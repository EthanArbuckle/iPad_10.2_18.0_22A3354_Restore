@implementation VNClusteringLogger

- (VNClusteringLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4 logFileNameBase:(id)a5
{
  id v9;
  id v10;
  VNClusteringLogger *v11;
  id *p_isa;
  VNClusteringLogger *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VNClusteringLogger;
  v11 = -[VNClusteringLogger init](&v15, sel_init);
  p_isa = (id *)&v11->super.isa;
  v13 = 0;
  if (v9 && v11)
  {
    v11->_logEnabled = a4;
    objc_storeStrong((id *)&v11->_logFolderURL, a3);
    objc_storeStrong(p_isa + 4, a5);
    objc_msgSend(p_isa, "resetFileNameURLWithCurentDateTime");
    v13 = p_isa;
  }

  return v13;
}

- (VNClusteringLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4
{
  return -[VNClusteringLogger initWithOptions:logEnabled:logFileNameBase:](self, "initWithOptions:logEnabled:logFileNameBase:", a3, a4, CFSTR("VNClusteringLog"));
}

- (void)resetFileNameURLWithCurentDateTime
{
  NSURL *logFolderURL;
  void *v4;
  NSString *fileNameBase;
  void *v6;
  NSURL *v7;
  NSURL *logFileURL;
  id v9;

  logFolderURL = self->_logFolderURL;
  v4 = (void *)MEMORY[0x1E0CB3940];
  fileNameBase = self->_fileNameBase;
  +[VNClusteringLogger currentDateTime](VNClusteringLogger, "currentDateTime");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@.log"), fileNameBase, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](logFolderURL, "URLByAppendingPathComponent:", v6);
  v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
  logFileURL = self->_logFileURL;
  self->_logFileURL = v7;

}

- (void)logString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSURL path](self->_logFileURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNClusteringLogger appendString:toLogFile:](VNClusteringLogger, "appendString:toLogFile:", v5, v4);

}

- (void)logClusterMap:(const void *)a3 level:(id)a4
{
  void *v5;
  char *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;
  char *v14;
  BOOL v15;
  id v17;

  v17 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Level %@ cluster map:\n"), v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(char **)a3;
  v7 = (char *)a3 + 8;
  v6 = v8;
  if (v8 != v7)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ClusterId: %lld"), *((_QWORD *)v6 + 4));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNClusteringLogger padStringWithSpaces:toSize:](VNClusteringLogger, "padStringWithSpaces:toSize:", v9, 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("%@Faces: "), v10);
      v11 = (_QWORD *)*((_QWORD *)v6 + 5);
      v12 = (_QWORD *)*((_QWORD *)v6 + 6);
      while (v11 != v12)
      {
        objc_msgSend(v5, "appendFormat:", CFSTR("%lld"), *v11);
        if (v11 != (_QWORD *)(*((_QWORD *)v6 + 6) - 8))
          objc_msgSend(v5, "appendFormat:", CFSTR(", "));
        ++v11;
      }
      objc_msgSend(v5, "appendFormat:", CFSTR("\n"));

      v13 = (char *)*((_QWORD *)v6 + 1);
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = *(char **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (char *)*((_QWORD *)v6 + 2);
          v15 = *(_QWORD *)v14 == (_QWORD)v6;
          v6 = v14;
        }
        while (!v15);
      }
      v6 = v14;
    }
    while (v14 != v7);
  }
  -[VNClusteringLogger logString:](self, "logString:", v5);

}

- (void)logClusterMapL0:(const void *)a3
{
  -[VNClusteringLogger logClusterMap:level:](self, "logClusterMap:level:", a3, CFSTR("0"));
}

- (void)logClusterLookupMapL0:(const void *)a3
{
  -[VNClusteringLogger logClusterMap:level:](self, "logClusterMap:level:", a3, CFSTR("0 Lookup"));
}

- (void)logClusterMapL1:(const void *)a3
{
  -[VNClusteringLogger logClusterMap:level:](self, "logClusterMap:level:", a3, CFSTR("1"));
}

- (void)logClusterLookupMapL1:(const void *)a3
{
  -[VNClusteringLogger logClusterMap:level:](self, "logClusterMap:level:", a3, CFSTR("1 Lookup"));
}

- (NSURL)logFolderURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)logFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)logEnabled
{
  return self->_logEnabled;
}

- (NSString)fileNameBase
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNameBase, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
  objc_storeStrong((id *)&self->_logFolderURL, 0);
}

+ (BOOL)isLogEnabled
{
  if (+[VNClusteringLogger isLogEnabled]::onceToken != -1)
    dispatch_once(&+[VNClusteringLogger isLogEnabled]::onceToken, &__block_literal_global_183);
  return +[VNClusteringLogger isLogEnabled]::logEnabled;
}

+ (void)appendString:(id)a3 toLogFile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v15);

  if (v15)
    v10 = v9;
  else
    v10 = 0;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingAtPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "seekToEndOfFile");
      objc_msgSend(CFSTR("\n\n"), "stringByAppendingString:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataUsingEncoding:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writeData:", v14);

      objc_msgSend(v12, "closeFile");
    }
    else
    {
      objc_msgSend(v5, "writeToFile:atomically:encoding:error:", v6, 1, 4, 0);
    }

  }
}

+ (id)padStringWithSpaces:(id)a3 toSize:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "length") >= (unint64_t)a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    do
      objc_msgSend(v6, "insertString:atIndex:", CFSTR(" "), v7++);
    while (a4 != v7);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, objc_msgSend(v5, "length"), v5);

  }
  return v8;
}

+ (id)currentDateTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss-SSS"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __34__VNClusteringLogger_isLogEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[VNClusteringLogger isLogEnabled]::logEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("CVML_debug_enable_cluster_log"));

}

@end
