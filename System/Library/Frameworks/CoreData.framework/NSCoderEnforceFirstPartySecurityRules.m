@implementation NSCoderEnforceFirstPartySecurityRules

void ___NSCoderEnforceFirstPartySecurityRules_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t (*v17)(_QWORD);
  unsigned int (*v18)(void);
  uint64_t (*v19)(const void *, _QWORD);
  uint64_t (*v20)(const void *, _QWORD);
  const void *v21;
  void *v22;
  const void *v23;

  v9 = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (v9
    && (v16 = v9,
        v17 = (uint64_t (*)(_QWORD))dlsym(v9, "SecTaskCreateFromSelf"),
        v18 = (unsigned int (*)(void))dlsym(v16, "SecTaskGetCodeSignStatus"),
        v19 = (uint64_t (*)(const void *, _QWORD))dlsym(v16, "SecTaskCopySigningIdentifier"),
        v17)
    && v18
    && (v20 = v19) != 0)
  {
    v21 = (const void *)v17(*MEMORY[0x1E0C9AE00]);
    if ((~v18() & 0x4000001) != 0)
    {
      v22 = (void *)v20(v21, 0);
      if (v22)
      {
        v23 = v22;
        if (objc_msgSend(v22, "rangeOfString:options:", CFSTR("^([A-Z0-9]+\\.)?com\\.apple\\."), 1024) == 0x7FFFFFFFFFFFFFFFLL)
          _MergedGlobals_69 = 1;
        CFRelease(v23);
      }
    }
    CFRelease(v21);
  }
  else
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Couldn't load a Security symbol."), v10, v11, v12, v13, v14, v15, a9);
  }
}

@end
