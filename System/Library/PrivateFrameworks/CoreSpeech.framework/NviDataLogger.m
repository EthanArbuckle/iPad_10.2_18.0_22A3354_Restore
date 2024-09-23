@implementation NviDataLogger

- (NviDataLogger)initWithFilePath:(id)a3 appendHdr:(id)a4
{
  id v6;
  id v7;
  NviDataLogger *v8;
  uint64_t v9;
  NSOutputStream *oStream;
  NSOutputStream *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSOutputStream *v15;
  id v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NviDataLogger;
  v8 = -[NviDataLogger init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:", v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    oStream = v8->_oStream;
    v8->_oStream = (NSOutputStream *)v9;

    -[NSOutputStream setDelegate:](v8->_oStream, "setDelegate:", v8);
    v11 = v8->_oStream;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOutputStream scheduleInRunLoop:forMode:](v11, "scheduleInRunLoop:forMode:", v12, *MEMORY[0x1E0C99748]);

    -[NSOutputStream open](v8->_oStream, "open");
    if (-[NSOutputStream hasSpaceAvailable](v8->_oStream, "hasSpaceAvailable"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4);
      v15 = v8->_oStream;
      v16 = objc_retainAutorelease(v13);
      -[NSOutputStream write:maxLength:](v15, "write:maxLength:", objc_msgSend(v16, "cStringUsingEncoding:", 4), v14);

    }
  }

  return v8;
}

- (void)logData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSOutputStream *oStream;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSOutputStream hasSpaceAvailable](self->_oStream, "hasSpaceAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4);
    oStream = self->_oStream;
    v8 = objc_retainAutorelease(v5);
    if (-[NSOutputStream write:maxLength:](oStream, "write:maxLength:", objc_msgSend(v8, "cStringUsingEncoding:", 4), v6) == -1)
    {
      v9 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[NviDataLogger logData:]";
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to write to o/p stream ! \n", buf, 0xCu);
      }
    }

  }
}

- (void)endRequest
{
  NSOutputStream *oStream;
  void *v4;
  NSOutputStream *v5;

  -[NSOutputStream close](self->_oStream, "close");
  oStream = self->_oStream;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOutputStream removeFromRunLoop:forMode:](oStream, "removeFromRunLoop:forMode:", v4, *MEMORY[0x1E0C99748]);

  v5 = self->_oStream;
  self->_oStream = 0;

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[NviDataLogger stream:handleEvent:]";
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Got event! %lu\n", (uint8_t *)&v9, 0x16u);
  }
  if (a4 != 4)
  {
    if (a4 == 16)
    {
      objc_msgSend(v5, "close");
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromRunLoop:forMode:", v7, *MEMORY[0x1E0C99748]);

    }
    else
    {
      v8 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315394;
        v10 = "-[NviDataLogger stream:handleEvent:]";
        v11 = 2048;
        v12 = a4;
        _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Got unhandled evt code %lu \n", (uint8_t *)&v9, 0x16u);
      }
    }
  }

}

- (NSOutputStream)oStream
{
  return self->_oStream;
}

- (void)setOStream:(id)a3
{
  objc_storeStrong((id *)&self->_oStream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oStream, 0);
}

@end
