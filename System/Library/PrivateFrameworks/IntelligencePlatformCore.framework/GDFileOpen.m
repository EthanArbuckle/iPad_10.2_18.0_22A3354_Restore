@implementation GDFileOpen

+ (int)openWithPath:(id)a3 flags:(int)a4 protection:(int)a5 mode:(int)a6 errorCode:(int *)a7
{
  uint64_t v8;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  int v16;
  int v17;

  v8 = *(_QWORD *)&a6;
  v11 = objc_retainAutorelease(a3);
  v15 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
  v16 = open_dprotected_np(v15, a4, a5, 0, v8);
  v17 = v16;
  if (a7 && v16 < 0)
    *a7 = *__error();
  return v17;
}

+ (BOOL)setFileLimitWithError:(id *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  int *v7;
  char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v17;
  uint64_t v18;
  int *v19;
  char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  rlimit v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v26.rlim_cur = 0;
  v26.rlim_max = 0;
  if (getrlimit(8, &v26))
  {
    if (!a3)
      return 0;
    v4 = (void *)MEMORY[0x1C3BA7BEC]();
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = *__error();
    v7 = __error();
    v8 = strerror(*v7);
    v11 = (void *)objc_msgSend_initWithFormat_(v5, v9, (uint64_t)CFSTR("Unable to get rlimit [%i] %s"), v10, v6, v8);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)&v28, (uint64_t)&v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v15, (uint64_t)CFSTR("com.apple.IntelligencePlatform.IntelligencePlatformCompute"), 2, v14);
LABEL_4:
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
    return 0;
  }
  if (v26.rlim_cur <= 0x4FF)
  {
    v26.rlim_cur = 1280;
    if (setrlimit(8, &v26))
    {
      if (!a3)
        return 0;
      v4 = (void *)MEMORY[0x1C3BA7BEC]();
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = *__error();
      v19 = __error();
      v20 = strerror(*v19);
      v11 = (void *)objc_msgSend_initWithFormat_(v17, v21, (uint64_t)CFSTR("Unable to set rlimit [%i] %s"), v22, v18, v20);
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = v11;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v30, (uint64_t)&v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, (uint64_t)CFSTR("com.apple.IntelligencePlatform.IntelligencePlatformCompute"), 1, v14);
      goto LABEL_4;
    }
  }
  return 1;
}

@end
