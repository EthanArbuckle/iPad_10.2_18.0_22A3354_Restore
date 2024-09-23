@implementation NSObject(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  CFTypeID v4;
  uint64_t MD5Digest;
  CFTypeID v6;
  CFDataRef XMPData;
  const __CFData *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v4 = CFGetTypeID(a1);
  if (v4 == CGColorSpaceGetTypeID())
  {
    MD5Digest = CGColorSpaceGetMD5Digest();
    objc_msgSend(v30, "addString:", CFSTR("CGColorSpace<"));
    objc_msgSend(v30, "addBytes:length:", MD5Digest, 16);
    objc_msgSend(v30, "addString:", CFSTR(">"));
  }
  else
  {
    v6 = CFGetTypeID(a1);
    if (v6 != CGImageMetadataGetTypeID())
    {
      NUAssertLogger_375();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v13;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_375();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v16)
        {
          v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v20 = (void *)MEMORY[0x1E0CB3978];
          v21 = v19;
          objc_msgSend(v20, "callStackSymbols");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v19;
          v33 = 2114;
          v34 = v23;
          _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v18;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = objc_claimAutoreleasedReturnValue();
      _NUAssertFailHandler((uint64_t)"-[NSObject(NUDigest) nu_updateDigest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUDigest.m", 119, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v26, v27, v28, v29, v25);
    }
    XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)a1, 0);
    objc_msgSend(v30, "addString:", CFSTR("CGImageMetadata<"));
    v8 = objc_retainAutorelease(XMPData);
    objc_msgSend(v30, "addBytes:length:", -[__CFData bytes](v8, "bytes"), -[__CFData length](v8, "length"));
    objc_msgSend(v30, "addString:", CFSTR(">"));

  }
}

- (id)nu_digest
{
  NUDigest *v2;
  void *v3;

  v2 = objc_alloc_init(NUDigest);
  objc_msgSend(a1, "nu_updateDigest:", v2);
  -[NUDigest stringValue](v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
