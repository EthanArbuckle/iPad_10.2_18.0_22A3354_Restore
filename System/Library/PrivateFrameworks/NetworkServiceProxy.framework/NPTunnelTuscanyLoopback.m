@implementation NPTunnelTuscanyLoopback

- (NPTunnelTuscanyLoopback)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 onRamp:(id)a7 delegate:(id)a8
{
  NPTunnelTuscanyLoopback *v8;
  NPTunnelTuscanyLoopback *v9;
  int v10;
  _DWORD *v11;
  int v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NPTunnelTuscanyLoopback;
  v8 = -[NPTunnelTuscany initWithEndpoint:parameters:appRule:flowProperties:onRamp:delegate:](&v14, sel_initWithEndpoint_parameters_appRule_flowProperties_onRamp_delegate_, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  if (v8)
  {
    v10 = -[NPTunnelTuscanyLoopback initialWindowSize](v8, "initialWindowSize");
    v11 = (_DWORD *)operator new();
    if (v10 >= 0)
      v12 = v10;
    else
      v12 = v10 + 1;
    *v11 = 0;
    v11[1] = v12 >> 1;
    v11[2] = v10;
    v11[3] = v10;
    v9->_window = v11;
  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = -[NPTunnelTuscanyLoopback window](self, "window");
  if (v3)
    MEMORY[0x1A1AE9F9C](v3, 0x1000C40451B5BE8);
  v4.receiver = self;
  v4.super_class = (Class)NPTunnelTuscanyLoopback;
  -[NPTunnelTuscany dealloc](&v4, sel_dealloc);
}

- (void)createTuscanyClient
{
  -[NPTunnelTuscany setClientRef:](self, "setClientRef:", tuscanyLoopbackClientCreate(self));
}

- (unsigned)dayPassSessionCounter
{
  return 1;
}

- (BOOL)addNewFlow:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  -[NPTunnelTuscanyLoopback setFlow:](self, "setFlow:", v4);
  v6.receiver = self;
  v6.super_class = (Class)NPTunnelTuscanyLoopback;
  LOBYTE(self) = -[NPTunnel addNewFlow:](&v6, sel_addNewFlow_, v4);

  return (char)self;
}

- (void)removeFlow:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPTunnelTuscanyLoopback;
  -[NPTunnel removeFlow:](&v4, sel_removeFlow_, a3);
  -[NPTunnelTuscanyLoopback setFlow:](self, "setFlow:", 0);
}

- (unint64_t)maxFrameSize
{
  return 256;
}

- (int64_t)currentMTU
{
  return -[NPTunnelTuscanyLoopback maxFrameSize](self, "maxFrameSize") - 16;
}

- (BOOL)selectBestEdge
{
  return 0;
}

- (unint64_t)initialWindowSize
{
  return 1024;
}

- (void)write:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  int v9;
  int v10;
  int v11;
  FrameStream *v13;
  void *v14;
  int v15;
  dispatch_data_t v16;
  dispatch_data_t v17;
  NPTuscanyClient *v18;
  void *v19;
  objc_super v20;
  size_t size_ptr;
  void *buffer_ptr;

  v4 = objc_retainAutorelease(a3);
  v5 = -[NSObject bytes](v4, "bytes");
  if ((unint64_t)-[NSObject length](v4, "length") <= 0x14)
    __assert_rtn("tuscanyClientGetDataSize", "NPTuscanyClient.mm", 562, "dataLen > sizeof(Frame::Header)");
  if (*(_BYTE *)(v5 + 18) == 1)
  {
    v6 = *(unsigned __int16 *)(v5 + 16);
    v7 = v6 - 24;
    if (v6 != 24)
    {
      v8 = -[NPTunnelTuscanyLoopback window](self, "window");
      if (v8)
      {
        v9 = v8[1];
        v10 = *v8 + v7;
        v11 = v10 < v9 ? *v8 + v7 : 0;
        *v8 = v11;
        if (v10 >= v9 && v10 >= 1)
        {
          v13 = -[NPTunnelTuscany clientRef](self, "clientRef");
          -[NPTunnelTuscanyLoopback flow](self, "flow");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "identifier");
          if (v13)
            FrameStream::acknowledge(v13, v15, v10, 1);

        }
      }
      if (v7 == 4)
      {
        size_ptr = 0;
        buffer_ptr = 0;
        v16 = dispatch_data_create_map(v4, (const void **)&buffer_ptr, &size_ptr);
        v17 = v16;
        if (v16 && buffer_ptr && size_ptr >= 5 && *(_DWORD *)((char *)buffer_ptr + size_ptr - 4) == 1701736292)
        {
          v18 = -[NPTunnelTuscany clientRef](self, "clientRef");
          -[NPTunnelTuscanyLoopback flow](self, "flow");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          tuscanyClientSendClose(v18, v19);

          goto LABEL_22;
        }

      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)NPTunnelTuscanyLoopback;
  -[NPTunnel write:](&v20, sel_write_, v4);
LABEL_22:

}

- (void)cancelConnection
{
  void *v3;
  void *v4;

  if (-[NPTunnel connectionState](self, "connectionState") != 5)
  {
    -[NPTunnel setConnectionState:](self, "setConnectionState:", 5);
    -[NPTunnel parameters](self, "parameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)nw_parameters_copy_context();
    nw_queue_context_async();

  }
}

uint64_t __43__NPTunnelTuscanyLoopback_cancelConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destroyConnection");
}

- (void)pingWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a3 + 2))(a3, 0xFFFFFFFFLL, 0, 0);
}

- (void)window
{
  return self->_window;
}

- (void)setWindow:(void *)a3
{
  self->_window = a3;
}

- (NPTunnelFlow)flow
{
  return (NPTunnelFlow *)objc_getProperty(self, a2, 304, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
}

@end
