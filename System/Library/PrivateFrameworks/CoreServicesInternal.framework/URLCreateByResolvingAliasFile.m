@implementation URLCreateByResolvingAliasFile

void ___URLCreateByResolvingAliasFile_block_invoke(uint64_t a1)
{
  unint64_t v2;
  const __CFURL *v3;
  BOOL v4;
  __CFSet *Mutable;
  const __CFSet *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  uint64_t v9;
  const void *v10;
  CFTypeID v11;
  CFTypeID TypeID;
  const __CFURL *v13;
  const __CFArray *v14;
  const void *v15;
  _QWORD *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;

  v25 = 0;
  v2 = *(_QWORD *)(a1 + 40);
  v3 = _CreateByResolvingAliasFile(*(const __CFAllocator **)(a1 + 48), *(CFTypeRef *)(a1 + 56), v2, &v25, *(__CFError ***)(a1 + 64));
  if (v3)
    v4 = v25 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    Mutable = CFSetCreateMutable(*(CFAllocatorRef *)(a1 + 48), 0, MEMORY[0x1E0C9B3B0]);
    if (Mutable)
    {
      v6 = Mutable;
      CFSetAddValue(Mutable, v3);
      v7 = _CreateByResolvingAliasFile(*(const __CFAllocator **)(a1 + 48), v3, v2, &v25, *(__CFError ***)(a1 + 64));
      CFRelease(v3);
      if (v7)
      {
        v3 = v7;
        while (v25)
        {
          if (CFSetContainsValue(v6, v3) || CFSetGetCount(v6) >= 32)
          {
            if (*(_QWORD *)(a1 + 64))
              **(_QWORD **)(a1 + 64) = CFErrorCreate(*(CFAllocatorRef *)(a1 + 48), (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 260, 0);
            CFRelease(v3);
            goto LABEL_16;
          }
          CFSetAddValue(v6, v3);
          v8 = _CreateByResolvingAliasFile(*(const __CFAllocator **)(a1 + 48), v3, v2, &v25, *(__CFError ***)(a1 + 64));
          CFRelease(v3);
          v3 = v8;
          if (!v8)
            break;
        }
      }
      else
      {
LABEL_16:
        v3 = 0;
      }
      CFRelease(v6);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(v9 + 8) + 24))
  {
    v10 = *(const void **)(a1 + 72);
    if (v10)
    {
      v11 = CFGetTypeID(v10);
      TypeID = CFArrayGetTypeID();
      v9 = *(_QWORD *)(a1 + 32);
      if (v11 == TypeID)
      {
        v13 = *(const __CFURL **)(*(_QWORD *)(v9 + 8) + 24);
        v14 = *(const __CFArray **)(a1 + 72);
        v15 = (const void *)__CFURLResourceInfoPtr();
        _FSURLCacheResourcePropertiesForKeys(v13, v14, v15, 0);
        v9 = *(_QWORD *)(a1 + 32);
      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(v9 + 8) + 24))
  {
    v16 = *(_QWORD **)(a1 + 64);
    if (v16)
    {
      if (!*v16)
      {
        v17 = aliasLog;
        if (os_log_type_enabled((os_log_t)aliasLog, OS_LOG_TYPE_ERROR))
          ___URLCreateByResolvingAliasFile_block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
        **(_QWORD **)(a1 + 64) = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 256, 0);
      }
    }
  }
}

void ___URLCreateByResolvingAliasFile_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_1817A6000, a1, a3, "%s: NULL result with no real error", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
