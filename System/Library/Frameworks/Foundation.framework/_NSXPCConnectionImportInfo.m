@implementation _NSXPCConnectionImportInfo

- (_NSXPCConnectionImportInfo)init
{
  _NSXPCConnectionImportInfo *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCConnectionImportInfo;
  result = -[_NSXPCConnectionImportInfo init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (uint64_t)removeProxy:(uint64_t)a1
{
  const void *v3;
  const __CFDictionary *Mutable;
  uint64_t v5;
  const void *v7[2];

  v7[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2)
    v3 = *(const void **)(a2 + 40);
  else
    v3 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  Mutable = *(const __CFDictionary **)(a1 + 16);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0);
    *(_QWORD *)(a1 + 16) = Mutable;
  }
  v7[0] = 0;
  if (!CFDictionaryGetValueIfPresent(Mutable, v3, v7))
    goto LABEL_10;
  if (v7[0] != (const void *)1)
  {
    CFDictionarySetValue(Mutable, v3, (char *)v7[0] - 1);
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  CFDictionaryRemoveValue(Mutable, v3);
  v5 = 1;
LABEL_11:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  return v5;
}

- (void)dealloc
{
  __CFDictionary *proxyNumberToCount;
  void *secTaskRef;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  proxyNumberToCount = self->_proxyNumberToCount;
  if (proxyNumberToCount)
    CFRelease(proxyNumberToCount);
  secTaskRef = self->_secTaskRef;
  if (secTaskRef)
    CFRelease(secTaskRef);
  v5.receiver = self;
  v5.super_class = (Class)_NSXPCConnectionImportInfo;
  -[_NSXPCConnectionImportInfo dealloc](&v5, sel_dealloc);
}

- (void)_clearEntitlementCache
{
  os_unfair_lock_s *v2;
  const void *v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    v3 = *(const void **)(a1 + 24);
    if (v3)
    {
      if (!*(_BYTE *)(a1 + 36))
      {
        *(_BYTE *)(a1 + 36) = 1;
        CFRelease(v3);
        *(_QWORD *)(a1 + 24) = 0;
      }
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)addProxy:(uint64_t)a1
{
  const void *v3;
  const __CFDictionary *Mutable;
  uint64_t v5;
  __CFDictionary *v6;
  const void *v7;
  const void *v8[2];

  v8[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
      v3 = *(const void **)(a2 + 40);
    else
      v3 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    Mutable = *(const __CFDictionary **)(a1 + 16);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0);
      *(_QWORD *)(a1 + 16) = Mutable;
    }
    v8[0] = 0;
    if (CFDictionaryGetValueIfPresent(Mutable, v3, v8))
    {
      v5 = (uint64_t)v8[0] + 1;
      v6 = Mutable;
      v7 = v3;
    }
    else
    {
      v6 = Mutable;
      v7 = v3;
      v5 = 1;
    }
    CFDictionarySetValue(v6, v7, (const void *)v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

- (os_unfair_lock_s)_valueForEntitlement:(_OWORD *)a3 auditToken:
{
  os_unfair_lock_s *v5;
  BOOL v6;
  NSObject *v7;
  os_unfair_lock_s *v8;
  const void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  CFTypeRef v13;
  NSObject *v14;
  CFTypeRef cf;
  _BYTE buf[32];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (qword_1ECD0A920 != -1)
      dispatch_once(&qword_1ECD0A920, &__block_literal_global_89);
    if (_MergedGlobals_157)
      v6 = off_1ECD0A918 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v8 = v5 + 8;
      os_unfair_lock_lock(v5 + 8);
      v9 = *(const void **)&v5[6]._os_unfair_lock_opaque;
      if (v9)
        goto LABEL_15;
      os_unfair_lock_unlock(v5 + 8);
      v10 = *MEMORY[0x1E0C9AE30];
      v11 = a3[1];
      *(_OWORD *)buf = *a3;
      *(_OWORD *)&buf[16] = v11;
      v9 = (const void *)_MergedGlobals_157(v10, buf);
      os_unfair_lock_lock(v5 + 8);
      if (*(_QWORD *)&v5[6]._os_unfair_lock_opaque)
      {
        CFRelease(v9);
        v9 = *(const void **)&v5[6]._os_unfair_lock_opaque;
        if (v9)
          goto LABEL_15;
      }
      else
      {
        *(_QWORD *)&v5[6]._os_unfair_lock_opaque = v9;
        if (v9)
        {
LABEL_15:
          cf = 0;
          v12 = (void *)off_1ECD0A918(v9, a2, &cf);
          v13 = cf;
          if (!v12 && cf)
          {
            v14 = _NSXPCLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = a2;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = cf;
              _os_log_error_impl(&dword_1817D9000, v14, OS_LOG_TYPE_ERROR, "-[NSXPCConnection valueForEntitlement:]: Error getting value for entitlement '%{public}@': %{public}@", buf, 0x16u);
            }
            v13 = cf;
          }
          if (v13)
            CFRelease(v13);
          goto LABEL_24;
        }
      }
      v12 = 0;
LABEL_24:
      os_unfair_lock_unlock(v8);
      return (os_unfair_lock_s *)v12;
    }
    v7 = _NSXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "valueForEntitlement couldn't load a Security symbol.", buf, 2u);
    }
    return 0;
  }
  return result;
}

@end
