@implementation _MSTempURL

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  _QWORD block[4];
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_MSTempURL path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_isInvalidPath:", v3))
  {
    ms_defaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1DB1A9000, v4, OS_LOG_TYPE_DEFAULT, "suspicious _MSTempURL object found with path: [%@]", buf, 0xCu);
    }
  }
  else
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21___MSTempURL_dealloc__block_invoke;
    block[3] = &unk_1EA25C5A0;
    v8 = v3;
    dispatch_async(v5, block);

    v4 = v8;
  }

  v6.receiver = self;
  v6.super_class = (Class)_MSTempURL;
  -[_MSTempURL dealloc](&v6, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_MSTempURL)initWithCoder:(id)a3
{
  id v4;
  _MSTempURL *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)_MSTempURL;
    self = -[_MSTempURL initWithCoder:](&v8, sel_initWithCoder_, v4);
    v5 = self;
  }
  else
  {
    ms_defaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1DB1A9000, v6, OS_LOG_TYPE_DEFAULT, "suspicious _MSTempURL object encoded from coder: [%@]", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)_resolvedTempDirectory
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByResolvingSymlinksInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isInvalidPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByResolvingSymlinksInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_resolvedTempDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("ms-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v4, "hasPrefix:", v6) ^ 1;
  return (char)v5;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end
