@implementation AVAirTransportStreams

- (AVAirTransportStreams)initWithInput:(id)a3 output:(id)a4
{
  id v7;
  id v8;
  id *v9;
  AVAirTransportStreams *v10;
  id *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSOutputStream *outputStream;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AVAirTransportStreams;
  v9 = -[AVAirTransport _initPrivate](&v18, sel__initPrivate);
  v10 = (AVAirTransportStreams *)v9;
  if (v9)
  {
    v11 = v9 + 7;
    objc_storeStrong(v9 + 7, a3);
    objc_storeStrong((id *)&v10->_outputStream, a4);
    objc_msgSend(*v11, "setDelegate:", v10);
    v12 = *v11;
    +[AVAirTransport eventRunLoop](AVAirTransport, "eventRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0C99860];
    objc_msgSend(v12, "scheduleInRunLoop:forMode:", v13, *MEMORY[0x1E0C99860]);

    -[NSOutputStream setDelegate:](v10->_outputStream, "setDelegate:", v10);
    outputStream = v10->_outputStream;
    +[AVAirTransport eventRunLoop](AVAirTransport, "eventRunLoop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOutputStream scheduleInRunLoop:forMode:](outputStream, "scheduleInRunLoop:forMode:", v16, v14);

  }
  return v10;
}

- (void)invalidate
{
  NSInputStream *inputStream;
  void *v4;
  uint64_t v5;
  NSOutputStream *outputStream;
  void *v7;
  NSObject *v8;
  NSInputStream *v9;
  NSOutputStream *v10;
  NSInputStream *v11;
  NSOutputStream *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  NSInputStream *v17;
  __int16 v18;
  NSOutputStream *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", 0);
  -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", 0);
  inputStream = self->_inputStream;
  +[AVAirTransport eventRunLoop](AVAirTransport, "eventRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C99860];
  -[NSInputStream removeFromRunLoop:forMode:](inputStream, "removeFromRunLoop:forMode:", v4, *MEMORY[0x1E0C99860]);

  outputStream = self->_outputStream;
  +[AVAirTransport eventRunLoop](AVAirTransport, "eventRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOutputStream removeFromRunLoop:forMode:](outputStream, "removeFromRunLoop:forMode:", v7, v5);

  -[NSInputStream close](self->_inputStream, "close");
  -[NSOutputStream close](self->_outputStream, "close");
  _avairlog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_inputStream;
    v10 = self->_outputStream;
    *(_DWORD *)buf = 136315650;
    v15 = "-[AVAirTransportStreams invalidate]";
    v16 = 2048;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s shutting down streams %p and %p", buf, 0x20u);
  }

  v11 = self->_inputStream;
  self->_inputStream = 0;

  v12 = self->_outputStream;
  self->_outputStream = 0;

  v13.receiver = self;
  v13.super_class = (Class)AVAirTransportStreams;
  -[AVAirTransport invalidate](&v13, sel_invalidate);
}

- (void)open
{
  if (!-[NSInputStream streamStatus](self->_inputStream, "streamStatus"))
    -[NSInputStream open](self->_inputStream, "open");
  if (!-[NSOutputStream streamStatus](self->_outputStream, "streamStatus"))
    -[NSOutputStream open](self->_outputStream, "open");
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVAirTransportStreams;
  -[AVAirTransport delegate](&v13, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p>"), v6, v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("nil");
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %p: (<%@, >%@), delegate=%@>"), v10, self, self->_inputStream, self->_outputStream, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)_readDataNonBlockingUpToMaxLength:(unint64_t)a3
{
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!isRunningEventThread())
    __assert_rtn("-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]", "AVAirTransport.m", 86, "isRunningEventThread()");
  -[AVAirTransportStreams inputStream](self, "inputStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasBytesAvailable");

  if (!v6)
    return 0;
  if (a3 >= 0x8000)
    v7 = 0x8000;
  else
    v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v7);
  -[AVAirTransportStreams inputStream](self, "inputStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasBytesAvailable");

  if (v10)
  {
    v11 = 0;
    while (1)
    {
      v12 = v7 >= a3 - v11 ? a3 - v11 : v7;
      -[AVAirTransportStreams inputStream](self, "inputStream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_retainAutorelease(v8);
      v15 = objc_msgSend(v13, "read:maxLength:", objc_msgSend(v14, "mutableBytes") + v11, v12);

      if (v15 < 1)
        break;
      if (v15 < v12
        || (-[AVAirTransportStreams inputStream](self, "inputStream"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "hasBytesAvailable"),
            v16,
            (v17 & 1) == 0))
      {
        objc_msgSend(v14, "setLength:", v15 + v11);
        v21 = v14;
        goto LABEL_30;
      }
      v11 += v15;
      objc_msgSend(v14, "increaseLengthBy:", 0x20000);
      -[AVAirTransportStreams inputStream](self, "inputStream");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasBytesAvailable");

      v7 = 0x20000;
      if ((v19 & 1) == 0)
        goto LABEL_29;
    }
    if ((v15 & 0x8000000000000000) == 0)
    {
      -[AVAirTransportStreams inputStream](self, "inputStream");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "streamStatus");

      _avairlog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v23 == 5)
      {
        if (v25)
        {
          v32 = 136315138;
          v33 = "-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]";
          v26 = "%s the input data disappeared! the input stream has closed.";
          v27 = v24;
          v28 = 12;
LABEL_27:
          _os_log_impl(&dword_1AC4B1000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v32, v28);
        }
      }
      else if (v25)
      {
        v32 = 136315394;
        v33 = "-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]";
        v34 = 1024;
        LODWORD(v35) = v23;
        v26 = "%s the input data disappeared! Are multiple clients trying to read from this stream? (status = %d)";
        v27 = v24;
        v28 = 18;
        goto LABEL_27;
      }

      goto LABEL_29;
    }
    _avairlog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      -[AVAirTransportStreams inputStream](self, "inputStream");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "streamError");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 136315394;
      v33 = "-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]";
      v34 = 2114;
      v35 = v31;
      _os_log_impl(&dword_1AC4B1000, v29, OS_LOG_TYPE_DEFAULT, "%s an error prevented bytes from being read! (%{public}@)", (uint8_t *)&v32, 0x16u);

    }
  }
LABEL_29:
  v21 = 0;
LABEL_30:

  return v21;
}

- (BOOL)isReadyToSend
{
  void *v2;
  unint64_t v3;

  -[AVAirTransportStreams outputStream](self, "outputStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "streamStatus");

  return v3 > 1;
}

- (BOOL)canWrite
{
  void *v2;
  char v3;

  -[AVAirTransportStreams outputStream](self, "outputStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSpaceAvailable");

  return v3;
}

- (id)_readAvailableData
{
  if (!isRunningEventThread())
    __assert_rtn("-[AVAirTransportStreams _readAvailableData]", "AVAirTransport.m", 140, "isRunningEventThread()");
  return -[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:](self, "_readDataNonBlockingUpToMaxLength:", -1);
}

- (int64_t)_writeData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  -[AVAirTransportStreams outputStream](self, "outputStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  v9 = objc_msgSend(v5, "write:maxLength:", v7, v8);
  return v9;
}

- (void)_inputStreamHasBytesAvailable
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t v6[4];
  const char *v7;
  __int128 buf;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]";
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s inputStream hasBytesAvailable", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5343;
  v11 = __Block_byref_object_dispose__5344;
  -[AVAirTransportStreams _readAvailableData](self, "_readAvailableData");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__AVAirTransportStreams__inputStreamHasBytesAvailable__block_invoke;
    v5[3] = &unk_1E5BB15B0;
    v5[4] = self;
    v5[5] = &buf;
    -[AVAirTransport performOnAirChannelQueueSync:](self, "performOnAirChannelQueueSync:", v5);
  }
  else
  {
    _avairlog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v6 = 136315138;
      v7 = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]";
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s ... but the data couldn't be read", v6, 0xCu);
    }

  }
  _Block_object_dispose(&buf, 8);

}

- (void)_outputStreamDidOpen
{
  void *v3;
  char v4;
  id v5;

  -[AVAirTransport delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVAirTransport delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "airTransportOutputDidOpen:", self);

  }
}

- (void)_inputStreamDidClose
{
  id v3;

  -[AVAirTransport terminatePendingRequests](self, "terminatePendingRequests");
  -[AVAirTransport delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "airTransportInputDidClose:", self);

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  char v4;
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!isRunningEventThread())
    __assert_rtn("-[AVAirTransportStreams stream:handleEvent:]", "AVAirTransport.m", 211, "isRunningEventThread()");
  -[AVAirTransportStreams inputStream](self, "inputStream");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVAirTransportStreams outputStream](self, "outputStream");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("Input");
  if (v8 == v6)
    v9 = CFSTR("Output");
  v10 = v9;
  if ((v4 & 8) == 0)
  {
    if ((v4 & 1) == 0)
      goto LABEL_9;
    _avairlog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315394;
      v17 = "-[AVAirTransportStreams stream:handleEvent:]";
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@: OpenCompleted", (uint8_t *)&v16, 0x16u);
    }

    if (v8 == v6)
    {
      -[AVAirTransportStreams _outputStreamDidOpen](self, "_outputStreamDidOpen");
      if ((v4 & 0x10) != 0)
      {
LABEL_10:
        _avairlog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315394;
          v17 = "-[AVAirTransportStreams stream:handleEvent:]";
          v18 = 2114;
          v19 = v10;
          _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@: EndEncountered", (uint8_t *)&v16, 0x16u);
        }

        if (v7 == v6)
        {
          -[AVAirTransportStreams _inputStreamDidClose](self, "_inputStreamDidClose");
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_9:
      if ((v4 & 0x10) != 0)
        goto LABEL_10;
    }
    if ((v4 & 4) != 0)
    {
      _avairlog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315394;
        v17 = "-[AVAirTransportStreams stream:handleEvent:]";
        v18 = 2114;
        v19 = v10;
        _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@: HasSpaceAvailable", (uint8_t *)&v16, 0x16u);
      }

      if (v8 == v6)
        -[AVAirTransportStreams _outputStreamCanWrite](self, "_outputStreamCanWrite");
    }
    if ((v4 & 2) != 0)
    {
      _avairlog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315394;
        v17 = "-[AVAirTransportStreams stream:handleEvent:]";
        v18 = 2114;
        v19 = v10;
        _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@: HasBytesAvailable", (uint8_t *)&v16, 0x16u);
      }

      if (v7 == v6)
        -[AVAirTransportStreams _inputStreamHasBytesAvailable](self, "_inputStreamHasBytesAvailable");
    }
    goto LABEL_28;
  }
  _avairlog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[AVAirTransportStreams stream:handleEvent:]";
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@: ErrorOccurred", (uint8_t *)&v16, 0x16u);
  }

LABEL_28:
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

void __54__AVAirTransportStreams__inputStreamHasBytesAvailable__block_invoke(uint64_t a1, __n128 a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  __n128 v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v3 = 0;
  v19 = *MEMORY[0x1E0C80C00];
  a2.n128_u64[0] = 136315138;
  v16 = a2;
  do
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "receiveResponseBlocks", *(_OWORD *)&v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "streamDataTransformer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reverseTransformerForMessageData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if ((objc_msgSend(v3, "isIncomplete") & 1) == 0)
      {
        v8 = *(void **)(a1 + 32);
        if (v6)
        {
          objc_msgSend(v8, "receiveResponseBlocks");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObjectAtIndex:", 0);

          ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v3, 0);
        }
        else
        {
          objc_msgSend(v8, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(*(id *)(a1 + 32), "delegate");
            v13 = objc_claimAutoreleasedReturnValue();
            -[NSObject airTransport:didReceiveObject:](v13, "airTransport:didReceiveObject:", *(_QWORD *)(a1 + 32), v3);
          }
          else
          {
            _avairlog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16.n128_u32[0];
              v18 = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]_block_invoke";
              _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s unexpected message/response received; delegate not expecting messages",
                buf,
                0xCu);
            }
          }

        }
      }
    }
    else
    {
      _avairlog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16.n128_u32[0];
        v18 = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]_block_invoke";
        _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s message data failed to deserialize", buf, 0xCu);
      }

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "receiveResponseBlocks");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectAtIndex:", 0);

        v6[2](v6, 0, -4);
      }
    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

  }
  while ((objc_msgSend(v3, "shouldCallReverseTransformerAgain") & 1) != 0);

}

@end
