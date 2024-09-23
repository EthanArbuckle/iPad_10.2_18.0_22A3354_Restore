@implementation _MSTempFileManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  return (id)sharedInstance_sharedInstance_0;
}

- (_MSTempFileManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MSTempFileManager;
  return -[_MSTempFileManager init](&v3, sel_init);
}

- (id)writeTemporaryFileWithData:(id)a3 type:(id)a4
{
  const __CFString *v5;
  id v6;
  CFStringRef v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  char v20[1024];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFString *)*MEMORY[0x1E0CA5A88];
  v6 = a3;
  v7 = UTTypeCopyPreferredTagWithClass((CFStringRef)a4, v5);
  v8 = (__CFString *)v7;
  v9 = CFSTR("data");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  IMSafeTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("ms-XXXXXX"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathExtension:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_retainAutorelease(v14);
  objc_msgSend(v15, "UTF8String");
  bzero(v20, 0x400uLL);
  __strlcpy_chk();
  LODWORD(v12) = -[__CFString length](v10, "length");

  v16 = mkstemps(v20, (_DWORD)v12 + 1);
  close(v16);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MSTempURL fileURLWithPath:](_MSTempURL, "fileURLWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeToURL:atomically:", v18, 1);
  return v18;
}

@end
