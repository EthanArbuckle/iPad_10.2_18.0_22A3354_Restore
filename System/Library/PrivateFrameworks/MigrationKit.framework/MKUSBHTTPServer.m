@implementation MKUSBHTTPServer

- (MKUSBHTTPServer)init
{
  MKUSBHTTPServer *v2;
  MKUSBDevice *v3;
  MKUSBDevice *device;
  MKHTTPParser *v5;
  NSObject *p_super;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKUSBHTTPServer;
  v2 = -[MKHTTPRequestMultiplexer init](&v9, sel_init);
  if (v2)
  {
    if (+[MKInternal isInternal](MKInternal, "isInternal")
      && !+[MKUSBHTTPServer isEnabled](MKUSBHTTPServer, "isEnabled"))
    {
      +[MKLog log](MKLog, "log");
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21EC08000, p_super, OS_LOG_TYPE_INFO, "will disable USB", v8, 2u);
      }
    }
    else
    {
      v3 = objc_alloc_init(MKUSBDevice);
      device = v2->_device;
      v2->_device = v3;

      -[MKUSBDevice setDelegate:](v2->_device, "setDelegate:", v2);
      v5 = objc_alloc_init(MKHTTPParser);
      p_super = &v2->_parser->super;
      v2->_parser = v5;
    }

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MKUSBHTTPServer stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)MKUSBHTTPServer;
  -[MKUSBHTTPServer dealloc](&v3, sel_dealloc);
}

- (void)run
{
  -[MKUSBDevice run](self->_device, "run");
}

- (void)cancel
{
  -[MKUSBHTTPServer stop](self, "stop");
  -[MKUSBDevice cancel](self->_device, "cancel");
}

- (void)listen
{
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[16];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[MKLog log](MKLog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "usb server will listen.", buf, 2u);
  }

  -[MKUSBDevice endpoints](self->_device, "endpoints");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_sync_enter(v9);
        objc_msgSend(v9, "thread", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", self, sel_start_, v9);
          objc_msgSend(v9, "setThread:", v12);
          objc_msgSend(v12, "start");

        }
        objc_sync_exit(v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  objc_sync_exit(v5);
  +[MKLog log](MKLog, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC08000, v13, OS_LOG_TYPE_INFO, "usb server did listen.", buf, 2u);
  }

}

- (void)start:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "usb server will listen on a background thread. thread=%@", (uint8_t *)&v11, 0xCu);
  }

  while (1)
  {
    v7 = (void *)MEMORY[0x2207B99F4]();
    if (!-[MKUSBHTTPServer _listen:](self, "_listen:", v4)
      || !objc_msgSend(v5, "isExecuting")
      || (objc_msgSend(v5, "isCancelled") & 1) != 0)
    {
      break;
    }
    v8 = objc_msgSend(v5, "isFinished");
    objc_autoreleasePoolPop(v7);
    if ((v8 & 1) != 0)
      goto LABEL_10;
  }
  objc_autoreleasePoolPop(v7);
LABEL_10:
  v9 = v4;
  objc_sync_enter(v9);
  objc_msgSend(v9, "setThread:", 0);
  objc_sync_exit(v9);

  +[MKLog log](MKLog, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "usb server did listen on a background thread. thread=%@.", (uint8_t *)&v11, 0xCu);
  }

}

- (void)stop
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MKUSBDevice endpoints](self->_device, "endpoints");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_sync_enter(v7);
        objc_msgSend(v7, "thread", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cancel");

        objc_msgSend(v7, "setThread:", 0);
        objc_sync_exit(v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_sync_exit(v3);
}

- (BOOL)_listen:(id)a3
{
  id v4;
  MKTime *v5;
  MKHTTPResponse *v6;
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  MKHTTPParser *parser;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  BOOL v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v48;
  MKTime *v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unsigned int v53;
  void *context;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MKTime);
  v64 = 0;
  v6 = objc_alloc_init(MKHTTPResponse);
  v7 = 0;
  v8 = 0x25547D000uLL;
  v49 = v5;
  v50 = v4;
  do
  {
    context = (void *)MEMORY[0x2207B99F4]();
    v51 = *(int *)(v8 + 1416);
    v9 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v51), "read:fromEndpoint:", &v64, v4);
    if (v9 >= 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v64, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v7, "appendData:", v10);
      }
      else
      {
        -[MKHTTPParser parse:hostname:](self->_parser, "parse:hostname:", v10, &stru_24E35A3B8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    objc_msgSend(v7, "headers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "method");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v11, "contentLength");
    v52 = objc_msgSend(v12, "length");
    if ((objc_msgSend(v11, "transferEncoding") & 1) != 0)
    {
      v63 = 0;
      v62 = 0;
      -[MKHTTPParser chunk:offset:done:](self->_parser, "chunk:offset:done:", v12, &v63, &v62);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v62 == 0;
      objc_msgSend(v7, "setChunkedTransferCompleted:");
      objc_msgSend(v7, "chunk");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = objc_msgSend(v15, "length");
      v18 = objc_msgSend(v16, "chunkOffset") + v17;
      v7 = v16;
      objc_msgSend(v16, "setChunkOffset:", v18);

      objc_msgSend(v16, "setChunk:", v14);
      if (v63)
        objc_msgSend(v16, "sliceData:");
      v5 = v49;
      if (!v62 && objc_msgSend(v14, "length"))
      {
        -[MKHTTPRequestMultiplexer routerForMethod:path:](self, "routerForMethod:path:", v56, v55);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "server:didReceiveRequest:response:", self, v16, v6);

        v7 = v16;
      }

      v4 = v50;
      v8 = 0x25547D000;
    }
    else
    {
      v13 = 0;
    }
    if (v52 < v53)
      v13 = 1;

    objc_autoreleasePoolPop(context);
  }
  while (v9 >= 1 && v13);
  if (v9 < 0)
  {
    v36 = 0;
  }
  else
  {
    self->_used = 1;
    objc_msgSend(v7, "headers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "method");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "body");
    v23 = objc_claimAutoreleasedReturnValue();
    -[MKHTTPRequestMultiplexer routerForMethod:path:](self, "routerForMethod:path:", v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "boundary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v7;
    v57 = (void *)v23;
    if (v25)
    {
      parser = self->_parser;
      objc_msgSend(v20, "boundary");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v7;
      v29 = (void *)v27;
      -[MKHTTPParser parts:boundary:container:](parser, "parts:boundary:container:", v23, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v59 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(v24, "server:didReceiveRequest:response:", self, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i), v6);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        }
        while (v33);
      }

    }
    else
    {
      objc_msgSend(v24, "server:didReceiveRequest:response:", self, v7, v6);
    }
    -[MKHTTPResponse headers](v6, "headers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "serverTiming");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTime elapsedTimeInSeconds](v49, "elapsedTimeInSeconds");
    v40 = v39;
    objc_msgSend(v38, "response");
    objc_msgSend(v38, "setResponse:", v40 + v41);

    -[MKHTTPResponse responseData](v6, "responseData");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43 = objc_msgSend(v42, "bytes");
    v64 = v43;
    v44 = *(Class *)((char *)&self->super.super.isa + v51);
    v45 = objc_msgSend(v42, "length");
    v46 = v44;
    v4 = v50;
    LODWORD(v43) = objc_msgSend(v46, "write:length:toEndpoint:", v43, v45, v50);
    v36 = objc_msgSend(v42, "length") == (int)v43;

    v5 = v49;
    v7 = v48;
  }

  return v36;
}

- (void)deviceDidOpen:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  +[MKLog log](MKLog, "log", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "usb device is ready to accept a connection.", v4, 2u);
  }

}

- (void)deviceDidCancel:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  +[MKLog log](MKLog, "log", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "usb device is closed.", v4, 2u);
  }

}

- (void)device:(id)a3 didFail:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  +[MKLog log](MKLog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21EC08000, v5, OS_LOG_TYPE_INFO, "usb device failed to initialize. error=%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)device:(id)a3 didChangeState:(unsigned __int8)a4
{
  int v4;
  NSObject *v6;
  id WeakRetained;
  _DWORD v8[2];
  uint64_t v9;

  v4 = a4;
  v9 = *MEMORY[0x24BDAC8D0];
  +[MKLog log](MKLog, "log", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "usb device did change state. state=%d", (uint8_t *)v8, 8u);
  }

  if (v4 == 5)
  {
LABEL_6:
    -[MKUSBHTTPServer listen](self, "listen");
    return;
  }
  if (v4 != 4)
  {
    if (v4 != 3)
      return;
    goto LABEL_6;
  }
  if (self->_used)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "usbHTTPServerDidClose:", self);

  }
}

+ (BOOL)isEnabled
{
  return +[MKPreferences BOOLForKey:](MKPreferences, "BOOLForKey:", CFSTR("disable_usb")) != 1;
}

- (MKUSBBHTTPServerDelegate)delegate
{
  return (MKUSBBHTTPServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
