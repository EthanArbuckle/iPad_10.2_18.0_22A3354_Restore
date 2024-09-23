@implementation _LSRemotePlaceholderEnumerator

- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4
{
  LSContext *v4;
  void *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  LSApplicationRecord *v21;
  _QWORD v23[5];
  void *v24;
  unsigned int v25;
  _OWORD v26[2];
  uint64_t v27;

  v4 = *(LSContext **)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v24 = 0;
  if (-[_LSApplicationRecordEnumerator _enumerateAllBundles](self, "_enumerateAllBundles"))
  {
    v7 = (void *)_LSBundleGet(a3->db, (int)v4);
    v24 = v7;
    if (!v7)
      return v7;
    if (!evaluateBundleNoIOCommon(v4, (uint64_t)v7, (const LSBundleData *)self->super._options))
    {
      v7 = 0;
      return v7;
    }
    v25 = v4;
    v8 = 1;
  }
  else
  {
    v4 = (LSContext *)_CSStringCopyCFString();
    if (v4)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __87___LSRemotePlaceholderEnumerator__applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke;
      v23[3] = &unk_1E103FD68;
      v23[4] = self;
      v9 = (void *)MEMORY[0x186DAE9BC](v23);
      memset(v26, 0, sizeof(v26));
      v10 = -[_LSApplicationRecordEnumerator bundleClass](self, "bundleClass");
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)a3, 0, v4, 0, v26, v10, 33792, v12, v9, &v25, &v24, 0);

      if ((v10 & 1) == 0)
      {
        v13 = _LSEnumeratorLog;
        if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
          -[_LSApplicationRecordEnumerator(Private) _applicationRecordWithContext:bundleIdentifierOrUnit:].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
      }

    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10817, (uint64_t)"-[_LSRemotePlaceholderEnumerator _applicationRecordWithContext:bundleIdentifierOrUnit:]", 314, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _LSEnumeratorFireErrorHandler((unsigned __int8 *)self, v20);

    }
    LODWORD(v4) = v25;
    v8 = v24 != 0;
  }
  v7 = 0;
  if ((_DWORD)v4 && v8)
  {
    v21 = [LSApplicationRecord alloc];
    return -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](v21, "_initWithContext:bundleID:bundleData:error:", a3, v25, v24, 0);
  }
  return v7;
}

@end
