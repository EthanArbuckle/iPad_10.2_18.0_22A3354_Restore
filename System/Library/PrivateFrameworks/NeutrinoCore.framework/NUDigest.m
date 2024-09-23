@implementation NUDigest

- (NUDigest)init
{
  NUDigest *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUDigest;
  v2 = -[NUDigest init](&v4, sel_init);
  CC_MD5_Init(&v2->_context);
  return v2;
}

- (void)finalize
{
  id v3;
  uint64_t i;
  NSString *stringValue;
  unsigned __int8 md[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_stringValue)
  {
    CC_MD5_Final(md, &self->_context);
    v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    for (i = 0; i != 16; ++i)
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);
    stringValue = self->_stringValue;
    self->_stringValue = (NSString *)v3;

  }
}

- (id)stringValue
{
  -[NUDigest finalize](self, "finalize");
  return self->_stringValue;
}

- (void)addString:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "maximumLengthOfBytesUsingEncoding:", 4);
  v6 = (char *)v7 - ((v5 + 16) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getCString:maxLength:encoding:", v6, v5 + 1, 4);

  -[NUDigest addBytes:length:](self, "addBytes:length:", v6, strlen(v6) + 1);
}

- (void)addCString:(const char *)a3
{
  -[NUDigest addBytes:length:](self, "addBytes:length:", a3, strlen(a3) + 1);
}

- (void)addBytes:(const void *)a3 length:(int64_t)a4
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[12];
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_stringValue)
  {
    NUAssertLogger_375();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already finalized"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v20, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_375();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138543618;
        *(_QWORD *)&v20[4] = v11;
        v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v20, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v20, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDigest addBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUDigest.m", 83, CFSTR("already finalized"), v16, v17, v18, v19, *(uint64_t *)v20);
  }
  CC_MD5_Update(&self->_context, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
