@implementation DATrafficLogger

- (void)_ensureCustomLogFile
{
  void *v3;
  _QWORD block[5];

  if (_ensureCustomLogFile_once != -1)
    dispatch_once(&_ensureCustomLogFile_once, &__block_literal_global_8);
  -[DATrafficLogger filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__DATrafficLogger__ensureCustomLogFile__block_invoke_2;
    block[3] = &unk_1E7B92278;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)_ensureCustomLogFile_logSetupQueue, block);
  }
}

void __39__DATrafficLogger__ensureCustomLogFile__block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = objc_opt_new();
  v1 = (void *)_ensureCustomLogFile_knownCustomNames;
  _ensureCustomLogFile_knownCustomNames = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.dataaccess.DATrafficQueue", v4);
  v3 = (void *)_ensureCustomLogFile_logSetupQueue;
  _ensureCustomLogFile_logSetupQueue = (uint64_t)v2;

}

void __39__DATrafficLogger__ensureCustomLogFile__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v2 = _ensureCustomLogFile_knownCustomNames;
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend((id)v2, "containsObject:", v3);

  if ((v2 & 1) == 0)
  {
    v4 = (void *)objc_msgSend(&__block_literal_global_3, "copy");
    v19[0] = *MEMORY[0x1E0D03928];
    v20[0] = DACustomLogDirectory();
    v19[1] = *MEMORY[0x1E0D03938];
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D03940];
    v20[1] = v5;
    v20[2] = &unk_1E7B9C0C0;
    v7 = *MEMORY[0x1E0D03930];
    v19[2] = v6;
    v19[3] = v7;
    v8 = *MEMORY[0x1E0D03950];
    v9 = *MEMORY[0x1E0C9AE40];
    v20[3] = CFSTR("DALogLevel");
    v20[4] = v9;
    v10 = *MEMORY[0x1E0D03920];
    v19[4] = v8;
    v19[5] = v10;
    v11 = (void *)MEMORY[0x1C3BB541C](v4);
    v20[5] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03908], "DAManagedDefaultForKey:", CFSTR("DALogLevel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      if (objc_msgSend(MEMORY[0x1E0D03908], "isAppleInternalInstall"))
      {
        v14 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E7B9C0D8, *MEMORY[0x1E0D03948]);

        v12 = v14;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    MEMORY[0x1C3BB4F9C](objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1), v12);

    v16 = (void *)_ensureCustomLogFile_knownCustomNames;
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
}

CFStringRef __39__DATrafficLogger__ensureCustomLogFile__block_invoke_3(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFStringRef theString)
{
  return CFStringCreateCopy(0, theString);
}

- (DATrafficLogger)initWithFilename:(id)a3
{
  id v4;
  DATrafficLogger *v5;
  DATrafficLogger *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DATrafficLogger;
  v5 = -[DATrafficLogger init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DATrafficLogger setFilename:](v5, "setFilename:", v4);
    -[DATrafficLogger _ensureCustomLogFile](v6, "_ensureCustomLogFile");
  }

  return v6;
}

+ (BOOL)enabled
{
  return shouldDALogAtLevel();
}

- (void)logSnippet:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (+[DATrafficLogger enabled](DATrafficLogger, "enabled"))
  {
    v5 = (void *)objc_msgSend(v4, "copy");

    v4 = v5;
    -[DATrafficLogger filename](self, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DACPLoggingAppendDataToLogFile();

  }
}

void __30__DATrafficLogger_logSnippet___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (void)slurpAndRemoveLookasideFile:(id)a3 prefixString:(id)a4 suffixString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[DATrafficLogger enabled](DATrafficLogger, "enabled"))
  {
    -[DATrafficLogger filename](self, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    DACPLoggingSlurpFileIntoLogFile();

  }
}

void __73__DATrafficLogger_slurpAndRemoveLookasideFile_prefixString_suffixString___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);

}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
