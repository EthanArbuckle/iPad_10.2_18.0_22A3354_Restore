@implementation VPCMetalLib

+ (id)metalLibraryWithDevice:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("cvaviewpointcorrection"), CFSTR("metallib"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v19 = 0;
    v8 = (void *)objc_msgSend(v5, "newLibraryWithURL:error:", v7, &v19);
    v9 = (__CFString *)v19;
    if (v8)
    {
      v10 = v8;
      v11 = v10;
LABEL_17:

      goto LABEL_18;
    }
    v16 = atomic_load((unsigned __int8 *)&qword_1EF921288);
    if ((v16 & 1) == 0 && __cxa_guard_acquire(&qword_1EF921288))
    {
      qword_1EF921280 = (uint64_t)os_log_create("com.apple.AppleCVA", "ViewpointCorrection");
      __cxa_guard_release(&qword_1EF921288);
    }
    v17 = (id)qword_1EF921280;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_debug_impl(&dword_1C9870000, v17, OS_LOG_TYPE_DEBUG, "Forwarding NSError: %@", buf, 0xCu);
    }

    if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      v11 = 0;
      *a4 = v9;
      goto LABEL_17;
    }
    v10 = 0;
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  v12 = atomic_load((unsigned __int8 *)&qword_1EF921288);
  if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_1EF921288))
  {
    qword_1EF921280 = (uint64_t)os_log_create("com.apple.AppleCVA", "ViewpointCorrection");
    __cxa_guard_release(&qword_1EF921288);
  }
  v13 = (id)qword_1EF921280;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = CFSTR("Could not find metal library");
    _os_log_debug_impl(&dword_1C9870000, v13, OS_LOG_TYPE_DEBUG, "Check failed: %@", buf, 0xCu);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString setValue:forKey:](v9, "setValue:forKey:", CFSTR("Could not find metal library"), *MEMORY[0x1E0CB2D50]);
    v14 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 0, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

@end
