@implementation MRStreamTransportConnection

- (MRStreamTransportConnection)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v7;
  id v8;
  MRStreamTransportConnection *v9;
  uint64_t v10;
  NSRunLoop *runLoop;
  uint64_t v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRStreamTransportConnection;
  v9 = -[MRStreamTransportConnection init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v10 = objc_claimAutoreleasedReturnValue();
    runLoop = v9->_runLoop;
    v9->_runLoop = (NSRunLoop *)v10;

    objc_storeStrong((id *)&v9->_inputStream, a3);
    objc_storeStrong((id *)&v9->_outputStream, a4);
    -[MRStreamTransportConnection _openStream:](v9, "_openStream:", v9->_inputStream);
    v12 = *MEMORY[0x1E0C99860];
    -[NSInputStream scheduleInRunLoop:forMode:](v9->_inputStream, "scheduleInRunLoop:forMode:", v9->_runLoop, *MEMORY[0x1E0C99860]);
    -[MRStreamTransportConnection _openStream:](v9, "_openStream:", v9->_outputStream);
    -[NSOutputStream scheduleInRunLoop:forMode:](v9->_outputStream, "scheduleInRunLoop:forMode:", v9->_runLoop, v12);
  }

  return v9;
}

- (BOOL)isValid
{
  return (unint64_t)(-[NSInputStream streamStatus](self->_inputStream, "streamStatus") - 1) <= 3
      && (unint64_t)(-[NSOutputStream streamStatus](self->_outputStream, "streamStatus") - 1) < 4;
}

- (id)runLoop
{
  return self->_runLoop;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v5;
  NSOutputStream *outputStream;
  id v7;
  int64_t v8;
  void *v9;
  NSOutputStream *v10;

  v5 = a3;
  outputStream = self->_outputStream;
  v7 = objc_retainAutorelease(v5);
  v8 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (v8 >= 1 && objc_msgSend(v7, "length") - v8 >= 1)
  {
    do
    {
      objc_msgSend(v7, "subdataWithRange:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = self->_outputStream;
      v7 = objc_retainAutorelease(v9);
      v8 = -[NSOutputStream write:maxLength:](v10, "write:maxLength:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    }
    while ((v8 & 0x8000000000000000) == 0 && objc_msgSend(v7, "length") - v8 > 0);
  }

  return v8;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)MEMORY[0x194036A64]();
  -[MRStreamTransportConnection _stream:handleEvent:](self, "_stream:handleEvent:", v7, a4);
  objc_autoreleasePoolPop(v6);

}

- (void)_stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  char v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  NSRunLoop *runLoop;
  NSRunLoop *v20;
  char isKindOfClass;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  uint64_t v32;
  _BYTE buf[12];
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 1uLL:
      -[MRStreamTransportConnection _setQOSPropertiesOnStream:](self, "_setQOSPropertiesOnStream:", v6);
      break;
    case 2uLL:
      v10 = v6;
      *(_QWORD *)buf = 0;
      v32 = 0;
      v11 = objc_msgSend(v10, "getBuffer:length:", &v32, buf);
      if (v32)
        v12 = v11;
      else
        v12 = 0;
      if ((v12 & 1) == 0)
        *(_QWORD *)buf = 1024;
      v13 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v14 = (void *)objc_msgSend(v13, "initWithCapacity:", *(_QWORD *)buf);
      if (objc_msgSend(v10, "hasBytesAvailable"))
      {
        do
        {
          v15 = objc_msgSend(v14, "length");
          objc_msgSend(v14, "increaseLengthBy:", *(_QWORD *)buf);
          v16 = objc_retainAutorelease(v14);
          v17 = objc_msgSend(v16, "mutableBytes");
          v18 = objc_msgSend(v10, "read:maxLength:", v17 + v15, *(_QWORD *)buf);
          if (v18 < *(_QWORD *)buf)
            objc_msgSend(v16, "setLength:", v18 - *(_QWORD *)buf + objc_msgSend(v16, "length"));
        }
        while ((objc_msgSend(v10, "hasBytesAvailable") & 1) != 0);
      }
      if (objc_msgSend(v14, "length"))
      {
        objc_initWeak(&location, self);
        runLoop = self->_runLoop;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __51__MRStreamTransportConnection__stream_handleEvent___block_invoke;
        v28[3] = &unk_1E30C6A78;
        objc_copyWeak(&v30, &location);
        v29 = v14;
        -[NSRunLoop performBlock:](runLoop, "performBlock:", v28);

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }

      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      objc_initWeak((id *)buf, self);
      v20 = self->_runLoop;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __51__MRStreamTransportConnection__stream_handleEvent___block_invoke_2;
      v26[3] = &unk_1E30C6AA0;
      objc_copyWeak(&v27, (id *)buf);
      -[NSRunLoop performBlock:](v20, "performBlock:", v26);
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
      break;
    case 8uLL:
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v22 = CFSTR("OutputStream");
      if ((isKindOfClass & 1) != 0)
        v22 = CFSTR("InputStream");
      v23 = v22;
      objc_msgSend(v7, "streamError");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _MRLogForCategory(4uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        v34 = 2112;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "[MRNetServiceTransport] %{public}@ %@ Error: %@. Disconnecting...", buf, 0x20u);
      }

      -[MRExternalDeviceTransportConnection _notifyDelegateDidCloseWithError:](self, "_notifyDelegateDidCloseWithError:", v24);
      break;
    default:
      if (a4 == 16)
      {
        _MRLogForCategory(4uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRNetServiceTransport] %{public}@ Stream ended. Disconnecting...", buf, 0xCu);
        }

        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 121);
        -[MRExternalDeviceTransportConnection _notifyDelegateDidCloseWithError:](self, "_notifyDelegateDidCloseWithError:", v9);

      }
      break;
  }

}

void __51__MRStreamTransportConnection__stream_handleEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x194036A64]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_notifyDelegateDidReceiveData:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

void __51__MRStreamTransportConnection__stream_handleEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)MEMORY[0x194036A64]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyDelegateHasSpaceAvailable");

  objc_autoreleasePoolPop(v2);
}

- (void)_openStream:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useNoDelayOptionForExternalDeviceSockets");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x1E0C93068]);

  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C93248]);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "scheduleInRunLoop:forMode:", self->_runLoop, *MEMORY[0x1E0C99748]);
  objc_msgSend(v7, "open");

}

- (void)_closeStream:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "close");
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "removeFromRunLoop:forMode:", self->_runLoop, *MEMORY[0x1E0C99748]);

}

- (void)_closeAllStreams
{
  -[MRStreamTransportConnection _closeStream:](self, "_closeStream:", self->_inputStream);
  -[MRStreamTransportConnection _closeStream:](self, "_closeStream:", self->_outputStream);
}

- (void)_setQOSPropertiesOnStream:(id)a3
{
  __CFReadStream *v3;
  const __CFData *v4;
  const __CFData *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  UInt8 buffer[4];
  CFRange v11;

  v3 = (__CFReadStream *)a3;
  *(_DWORD *)buffer = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (const __CFData *)CFReadStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2F0]);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_9:
      v7 = v3;
LABEL_12:

      goto LABEL_13;
    }
    v4 = (const __CFData *)CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2F0]);
  }
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  v11.location = 0;
  v11.length = 4;
  CFDataGetBytes(v4, v11, buffer);
  CFRelease(v5);
  v6 = *(unsigned int *)buffer;

  if ((_DWORD)v6)
  {
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasExternalDeviceSocketQOSLevelSet"))
      v8 = objc_msgSend(v7, "externalDeviceSocketQOSLevel");
    else
      v8 = 3;
    v9 = (void (*)(uint64_t, uint64_t))MSVWeakLinkSymbol();
    v9(v6, v8);
    goto LABEL_12;
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end
