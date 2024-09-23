@implementation ZN17MTLLibraryBuilder18newLibraryWithFileEPU19objcproto9MTLDevice11objc

os_unfair_lock_s *___ZN17MTLLibraryBuilder18newLibraryWithFileEPU19objcproto9MTLDevice11objc_objectP8NSStringPP7NSError_block_invoke(uint64_t a1, NSError **a2)
{
  uint64_t v4;
  FILE *v5;
  FILE *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  void *v9;
  int *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = fopen(*(const char **)(a1 + 56), "rb");
  if (!v5)
  {
    v10 = __error();
    v11 = strerror(*v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      ___ZN17MTLLibraryBuilder18newLibraryWithFileEPU19objcproto9MTLDevice11objc_objectP8NSStringPP7NSError_block_invoke_cold_1((uint64_t)v11);
      if (a2)
        goto LABEL_7;
    }
    else if (a2)
    {
LABEL_7:
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metal library file %s failed to open with error: %s"), *(_QWORD *)(a1 + 56), v11);
      v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0CB2D50]);
      v7 = 0;
      *a2 = (NSError *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 1, v13);
      return v7;
    }
    return 0;
  }
  v6 = v5;
  fileno(v5);
  change_fdguard_np();
  v7 = (os_unfair_lock_s *)operator new();
  v8 = *(_QWORD *)(a1 + 64);
  v9 = (void *)objc_msgSend((id)+[MTLLoader canonicalURL:]((uint64_t)MTLLoader, *(_QWORD *)(a1 + 32)), "path");
  MTLLibraryDataWithArchive::MTLLibraryDataWithArchive((uint64_t)v7, v8, (__int128 *)(a1 + 72), v9);
  *(_QWORD *)&v7->_os_unfair_lock_opaque = &off_1E0FE0370;
  *(_QWORD *)&v7[162]._os_unfair_lock_opaque = v6;
  if ((MTLLibraryDataWithArchive::parseArchive(v7, a2, *(unsigned __int8 *)(v4 + 40), *(void **)(a1 + 40)) & 1) == 0)
  {
    if (!MTLAtomicDecrement(&v7[20]._os_unfair_lock_opaque))
      (*(void (**)(os_unfair_lock_s *))(*(_QWORD *)&v7->_os_unfair_lock_opaque + 8))(v7);
    return 0;
  }
  return v7;
}

@end
