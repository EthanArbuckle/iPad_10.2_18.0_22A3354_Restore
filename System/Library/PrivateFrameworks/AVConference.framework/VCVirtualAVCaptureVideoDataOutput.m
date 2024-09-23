@implementation VCVirtualAVCaptureVideoDataOutput

- (VCVirtualAVCaptureVideoDataOutput)init
{
  VCVirtualAVCaptureVideoDataOutput *v2;
  NSMutableArray *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCVirtualAVCaptureVideoDataOutput;
  v2 = -[AVCaptureVideoDataOutput init](&v5, sel_init);
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureVideoDataOutput init].cold.1();
    }
    goto LABEL_11;
  }
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_connections = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureVideoDataOutput init].cold.2();
    }
LABEL_11:

    return 0;
  }
  v2->_stateLock._os_unfair_lock_opaque = 0;
  return v2;
}

- (void)disconnect
{
  os_unfair_lock_s *p_stateLock;
  NSMutableArray *connections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  connections = self->_connections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(connections);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "invalidate");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  -[NSMutableArray removeAllObjects](self->_connections, "removeAllObjects");
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCVirtualAVCaptureVideoDataOutput disconnect](self, "disconnect");

  -[VCVirtualAVCaptureVideoDataOutput setSampleBufferDelegate:queue:](self, "setSampleBufferDelegate:queue:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureVideoDataOutput;
  -[AVCaptureVideoDataOutput dealloc](&v3, sel_dealloc);
}

- (void)setSampleBufferDelegate:(id)a3 queue:(id)a4
{
  os_unfair_lock_s *p_stateLock;
  NSObject *callbackQueue;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ((id)-[VCWeakObjectHolder strong](self->_weakPushDelegate, "strong") != a3)
  {

    self->_weakPushDelegate = 0;
    if (a3)
      self->_weakPushDelegate = (VCWeakObjectHolder *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF26A0]), "initWithObject:", a3);
  }
  callbackQueue = self->_callbackQueue;
  if (callbackQueue != a4)
  {
    if (a4)
    {
      dispatch_retain((dispatch_object_t)a4);
      callbackQueue = self->_callbackQueue;
    }
    if (callbackQueue)
      dispatch_release(callbackQueue);
    self->_callbackQueue = (OS_dispatch_queue *)a4;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)addConnection:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  VCVirtualAVCaptureVideoDataOutput *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    if ((-[NSMutableArray containsObject:](self->_connections, "containsObject:", a3) & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136316162;
          v11 = v6;
          v12 = 2080;
          v13 = "-[VCVirtualAVCaptureVideoDataOutput addConnection:]";
          v14 = 1024;
          v15 = 104;
          v16 = 2112;
          v17 = a3;
          v18 = 2112;
          v19 = self;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add connection that is already added to the session. Connection=%@, session=%@", (uint8_t *)&v10, 0x30u);
        }
      }
    }
    else
    {
      -[NSMutableArray addObject:](self->_connections, "addObject:", a3);
    }
    os_unfair_lock_unlock(p_stateLock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCVirtualAVCaptureVideoDataOutput addConnection:]";
      v14 = 1024;
      v15 = 97;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil connection", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)removeConnection:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  VCVirtualAVCaptureVideoDataOutput *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (-[NSMutableArray containsObject:](self->_connections, "containsObject:", a3))
  {
    objc_msgSend(a3, "invalidate");
    -[NSMutableArray removeObject:](self->_connections, "removeObject:", a3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCVirtualAVCaptureVideoDataOutput removeConnection:]";
      v12 = 1024;
      v13 = 115;
      v14 = 2112;
      v15 = a3;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to remove connection that does not exist in the session. Connection=%@, session=%@", (uint8_t *)&v8, 0x30u);
    }
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (id)connectionWithMediaType:(id)a3
{
  id v4;
  id result;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = -[VCVirtualAVCaptureVideoDataOutput connections](self, "connections");
  result = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = (void *)objc_msgSend(v9, "inputPorts");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          while (2)
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              if ((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "mediaType") == a3)
                return v9;
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
            if (v12)
              continue;
            break;
          }
        }
      }
      v6 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      result = 0;
    }
    while (v6);
  }
  return result;
}

- (id)connections
{
  os_unfair_lock_s *p_stateLock;
  void *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (void *)-[NSMutableArray copy](self->_connections, "copy");
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

void __VCVirtualAVCaptureVideoDataOutput_OnMediaSample_block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "captureOutput:didOutputSampleBuffer:fromConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);

}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate connections array", v2, v3, v4, v5, 2u);
}

@end
