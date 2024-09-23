@implementation ADFileLoggerHandler

- (id)getFullPath:(const char *)a3 timestamp:(double)a4 extension:(const char *)a5
{
  NSString *logFolder;
  double v6;
  uint64_t v8;

  logFolder = self->_logFolder;
  v6 = a4 * 1000.0;
  if (a5)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%010llu_%s.%s"), logFolder, (unint64_t)v6, a3, a5);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%010llu_%s"), logFolder, (unint64_t)v6, a3, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ADFileLoggerHandler)init
{
  return -[ADFileLoggerHandler initWithName:](self, "initWithName:", CFSTR("logger"));
}

- (ADFileLoggerHandler)initWithName:(id)a3
{
  id v5;
  ADFileLoggerHandler *v6;
  ADFileLoggerHandler *v7;
  uint64_t v8;
  NSString *loggerName;
  NSString *v10;
  objc_super v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ADFileLoggerHandler;
  v6 = -[ADFileLoggerHandler init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shortName, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("appledepth.fl.%@"), v5);
    v8 = objc_claimAutoreleasedReturnValue();
    loggerName = v7->_loggerName;
    v7->_loggerName = (NSString *)v8;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v7->_loggerName;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "created logger handler %@", buf, 0xCu);
    }
  }

  return v7;
}

- (id)name
{
  return self->_loggerName;
}

- (int64_t)setLogFolder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *logFolder;
  void *v7;
  NSString *v8;
  char v9;
  id v10;
  int64_t v11;
  NSString *v13;
  id v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringByAppendingPathComponent:", self->_shortName);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  logFolder = self->_logFolder;
  self->_logFolder = v5;

  if (self->_logFolder)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_logFolder;
    v14 = 0;
    v9 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v14);
    v10 = v14;
    if ((v9 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v13 = self->_logFolder;
        *(_DWORD *)buf = 138543618;
        v16 = v13;
        v17 = 2114;
        v18 = v10;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADFileLoggerHandler cannot create logger directory \"%{public}@\". Error: %{public}@", buf, 0x16u);
      }
      v11 = -22950;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5
{
  PixelBufferUtils *v6;
  __CVBuffer *v7;
  id v8;

  if (self->_logFolder)
  {
    -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a4, 0, a5);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (PixelBufferUtils *)objc_msgSend(v8, "UTF8String");
    PixelBufferUtils::pixelBufferToRawFile(v6, a3, v7);

  }
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  char v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_logFolder)
  {
    if (-[ADLogManagerHandler humanReadableFormat](self, "humanReadableFormat"))
      -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a4, "csv", a5);
    else
      -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a4, "plist", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "writeToFile:atomically:", v9, 1);

    if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = a4;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to logPointCloud %s", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  char v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_logFolder)
  {
    -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a4, "txt", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "writeToFile:atomically:encoding:error:", v9, 1, 4, 0);

    if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = a4;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to logString %s", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6
{
  const char *v8;
  size_t v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *__dst[2];
  unint64_t v16;

  if (!self->_logFolder)
    return;
  -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a5, "raw", a6);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v14, "UTF8String");
  v9 = strlen(v8);
  if (v9 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = (void *)v9;
  if (v9 >= 0x17)
  {
    v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v12 = v9 | 7;
    v13 = v12 + 1;
    v11 = (void **)operator new(v12 + 1);
    __dst[1] = v10;
    v16 = v13 | 0x8000000000000000;
    __dst[0] = v11;
  }
  else
  {
    HIBYTE(v16) = v9;
    v11 = __dst;
    if (!v9)
      goto LABEL_11;
  }
  memmove(v11, v8, (size_t)v10);
LABEL_11:
  *((_BYTE *)v10 + (_QWORD)v11) = 0;
  dumpRawImageFile((uint64_t)__dst, a3, a4);
  if (SHIBYTE(v16) < 0)
    operator delete(__dst[0]);

}

- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  char v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_logFolder)
  {
    if (-[ADLogManagerHandler humanReadableFormat](self, "humanReadableFormat"))
      -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a4, "json", a5);
    else
      -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a4, "plist", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "writeToFile:atomically:", v9, 1);

    if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = a4;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to logCalibration for %s", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_logFolder)
  {
    v9 = (void *)MEMORY[0x24BDBCF48];
    -[ADFileLoggerHandler getFullPath:timestamp:extension:](self, "getFullPath:timestamp:extension:", a4, "plist", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "writeToURL:atomically:", v11, 1);

    if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = a4;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to logDictionary for %s", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)logMatrix4x4:(__n128)a3 name:(__n128)a4 timestamp:(__n128)a5
{
  id v11;
  ADCommonUtils *v12;
  const char *v13;
  char v14;
  _BYTE v15[64];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1[2])
  {
    *(__n128 *)v15 = a2;
    *(__n128 *)&v15[16] = a3;
    *(__n128 *)&v15[32] = a4;
    *(__n128 *)&v15[48] = a5;
    if (objc_msgSend(a1, "humanReadableFormat"))
      objc_msgSend(a1, "getFullPath:timestamp:extension:", a8, "json", a6);
    else
      objc_msgSend(a1, "getFullPath:timestamp:extension:", a8, "bin", a6);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (ADCommonUtils *)objc_msgSend(v11, "UTF8String");
    v14 = ADCommonUtils::extrinsicsToFile(v12, v13, *(simd_float4x4 *)v15);

    if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = a8;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to logMatrix4x4 for %s", buf, 0xCu);
    }
  }
}

- (void)logMatrix4x3:(__n128)a3 name:(__n128)a4 timestamp:(__n128)a5
{
  id v11;
  ADCommonUtils *v12;
  const char *v13;
  char v14;
  _BYTE v15[64];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1[2])
  {
    *(__n128 *)v15 = a2;
    *(__n128 *)&v15[16] = a3;
    *(__n128 *)&v15[32] = a4;
    *(__n128 *)&v15[48] = a5;
    if (objc_msgSend(a1, "humanReadableFormat"))
      objc_msgSend(a1, "getFullPath:timestamp:extension:", a8, "json", a6);
    else
      objc_msgSend(a1, "getFullPath:timestamp:extension:", a8, "bin", a6);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (ADCommonUtils *)objc_msgSend(v11, "UTF8String");
    v14 = ADCommonUtils::extrinsicsToFile(v12, v13, *(simd_float4x4 *)v15);

    if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = a8;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to logMatrix4x3 for %s", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerName, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_logFolder, 0);
}

@end
