@implementation NSError(PHErrors_Private)

+ (id)ph_errorWithDomain:()PHErrors_Private code:userInfo:
{
  __CFString *v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  __CFString *v16;
  uint64_t v17;
  int v18;
  int v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0CB28A8];
  v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]);
  if (a4 == 3072 && v11)
  {

    v8 = CFSTR("PHPhotosErrorDomain");
  }
  if (PHErrorAllowsInternalErrors())
  {
    v12 = a1;
    v13 = v8;
    v14 = a4;
    v15 = v9;
LABEL_39:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (dyld_program_sdk_at_least())
  {
    v16 = v8;
    if (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("PHPhotosErrorDomain")))
    {
      if (a4 > 3168)
      {
        if (((unint64_t)(a4 - 3300) > 0xB || ((1 << (a4 + 28)) & 0xC6F) == 0)
          && ((unint64_t)(a4 - 3169) > 0x29 || ((1 << (a4 - 97)) & 0x20300000001) == 0)
          && a4 != 5423)
        {
          goto LABEL_24;
        }
      }
      else if (((unint64_t)(a4 - 3105) > 0x3B || ((1 << (a4 - 33)) & 0x800006000000201) == 0)
             && a4 != -1
             && a4 != 3072)
      {
        goto LABEL_24;
      }

      v15 = 0;
      goto LABEL_23;
    }
    if ((-[__CFString isEqualToString:](v16, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) == 0)
    {
LABEL_24:

      goto LABEL_25;
    }

    v15 = v9;
    if (a4 == -1009)
    {
LABEL_23:
      v12 = a1;
      v13 = v16;
      v14 = a4;
      goto LABEL_39;
    }
  }
LABEL_25:
  v17 = *MEMORY[0x1E0D11268];
  v18 = -[__CFString isEqualToString:](v8, "isEqualToString:", *MEMORY[0x1E0D11268]);
  if ((unint64_t)(a4 - 1005) <= 1 && v18
    || (v19 = -[__CFString isEqualToString:](v8, "isEqualToString:", v17), (unint64_t)(a4 - 80) <= 2)
    && v19
    && (dyld_program_sdk_at_least() & 1) == 0)
  {
    v12 = a1;
    v13 = v8;
    v14 = a4;
    v15 = 0;
    goto LABEL_39;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    PLPhotoKitGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = 138412290;
      v26 = v20;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Sanitized PhotoKit Error: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  if (a4 == 3072)
    v22 = 3072;
  else
    v22 = -1;
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v10, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
  return v23;
}

+ (id)_ph_genericErrorWithUnderlyingError:()PHErrors_Private localizedDescription:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(a1, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ph_errorWithCode:()PHErrors_Private localizedDescription:
{
  __CFString *v6;
  id v7;
  void *v8;
  va_list va;

  va_start(va, format);
  v6 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, format, va);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(a1, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ph_genericErrorWithLocalizedDescription:()PHErrors_Private
{
  __CFString *v10;
  void *v11;

  v10 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a3, &a9);
  objc_msgSend(a1, "_ph_genericErrorWithUnderlyingError:localizedDescription:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ph_genericErrorWithUnderlyingError:()PHErrors_Private localizedDescription:
{
  const __CFAllocator *v11;
  id v12;
  __CFString *v13;
  void *v14;

  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = a3;
  v13 = (__CFString *)CFStringCreateWithFormatAndArguments(v11, 0, a4, &a9);
  objc_msgSend(a1, "_ph_genericErrorWithUnderlyingError:localizedDescription:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)ph_genericEntitlementError
{
  if (ph_genericEntitlementError_onceToken != -1)
    dispatch_once(&ph_genericEntitlementError_onceToken, &__block_literal_global_37537);
  return (id)ph_genericEntitlementError_s_error;
}

@end
