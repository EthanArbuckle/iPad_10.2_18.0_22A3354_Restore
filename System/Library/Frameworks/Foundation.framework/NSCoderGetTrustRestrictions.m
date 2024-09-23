@implementation NSCoderGetTrustRestrictions

void ___NSCoderGetTrustRestrictions_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t (*v2)(_QWORD);
  unsigned int (*v3)(void);
  uint64_t (*v4)(const void *, _QWORD);
  uint64_t (*v5)(const void *, _QWORD);
  const void *v6;
  NSObject *v7;
  void *v8;
  const void *v9;
  int v10;
  uint8_t v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (v0
    && (v1 = v0,
        v2 = (uint64_t (*)(_QWORD))dlsym(v0, "SecTaskCreateFromSelf"),
        v3 = (unsigned int (*)(void))dlsym(v1, "SecTaskGetCodeSignStatus"),
        v4 = (uint64_t (*)(const void *, _QWORD))dlsym(v1, "SecTaskCopySigningIdentifier"),
        v2)
    && v3
    && (v5 = v4) != 0)
  {
    v6 = (const void *)v2(*MEMORY[0x1E0C9AE00]);
    if ((~v3() & 0x4000001) != 0)
    {
      v8 = (void *)v5(v6, 0);
      if (v8)
      {
        v9 = v8;
        if (_NSCoderIsAppleSigningIdentifier(v8))
          v10 = 1;
        else
          v10 = 2;
        dword_1ECD09B5C = v10;
        CFRelease(v9);
      }
    }
    else
    {
      dword_1ECD09B5C = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "NSCoder couldn't load a Security symbol.", v11, 2u);
    }
  }
}

@end
