void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t bm_openat_dprotected(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  char *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  int v22;
  os_log_type_t v23;
  NSObject *v24;
  int v25;
  os_log_type_t v26;
  NSObject *v27;
  void *v28;
  int v29;
  NSObject *v30;
  int v31;
  os_log_type_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  int v36;
  NSObject *v37;
  void *v39;
  int v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  v40 = a3;
  if ((a3 & 0x100000) != 0 && objc_msgSend(v7, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if ((bm_validate_pathat(a1, v8) & 1) == 0)
  {
    __biome_log_for_category(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      bm_openat_dprotected_cold_4();

    *__error() = 22;
    goto LABEL_50;
  }
  if ((_DWORD)a1 == -3)
    v10 = -2;
  else
    v10 = a1;
  v11 = objc_retainAutorelease(v8);
  v12 = (char *)objc_msgSend(v11, "fileSystemRepresentation");
  if ((a3 & 0x100000) != 0)
  {
    v19 = bm_opendirat(a1, v11, a3, 0x1C0u);
    if ((v19 & 0x80000000) != 0)
    {
      v22 = *__error();
      v39 = 0;
      v23 = _bm_log_config_for_errno(v22, (uint64_t)&v40, &v39);
      __biome_log_for_category(2);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, v23))
      {
        *(_DWORD *)buf = 67109378;
        v42 = v22;
        v43 = 2112;
        v44 = v39;
        _os_log_impl(&dword_1AEB31000, v24, v23, "bm_opendirat() failed: %{darwin.errno}d%@", buf, 0x12u);
      }

      *__error() = v22;
      goto LABEL_49;
    }
    v13 = v19;
    if (_bm_set_protection_class(v19, a4))
    {
      v20 = *__error();
      if (close(v13))
      {
        __biome_log_for_category(2);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          bm_openat_dprotected_cold_2(v21);

      }
      *__error() = v20;
      goto LABEL_50;
    }
  }
  else
  {
    v13 = _bm_openat_dprotected(v10, v12, a3, a4);
    if ((v13 & 0x80000000) != 0)
    {
      if (*__error() != 2 || (a3 & 0x200) == 0)
        goto LABEL_39;
      objc_msgSend(v11, "stringByDeletingLastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = bm_opendirat(a1, v14, a3 & 0x20000100 | 0x200u, 0x1C0u);
      if (v15 < 0)
      {
        v25 = *__error();
        v39 = 0;
        v26 = _bm_log_config_for_errno(v25, (uint64_t)&v40, &v39);
        __biome_log_for_category(2);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, v26))
        {
          *(_DWORD *)buf = 67109378;
          v42 = v25;
          v43 = 2112;
          v44 = v39;
          _os_log_impl(&dword_1AEB31000, v27, v26, "bm_opendirat() failed: %{darwin.errno}d%@", buf, 0x12u);
        }

        *__error() = v25;
        goto LABEL_33;
      }
      v16 = v15;
      if (v15 == (_DWORD)a1)
      {
        __biome_log_for_category(2);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          bm_openat_dprotected_cold_1();

LABEL_33:
LABEL_50:
        v13 = 0xFFFFFFFFLL;
        goto LABEL_51;
      }
      objc_msgSend(v11, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = _bm_openat_dprotected(v16, (char *)objc_msgSend(v28, "fileSystemRepresentation"), a3, a4);
      v29 = *__error();
      if (close(v16))
      {
        __biome_log_for_category(2);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          bm_openat_dprotected_cold_2(v30);

      }
      *__error() = v29;

      if ((v13 & 0x80000000) != 0)
      {
LABEL_39:
        v31 = *__error();
        v39 = 0;
        v32 = _bm_log_config_for_errno(v31, (uint64_t)&v40, &v39);
        __biome_log_for_category(2);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, v32))
        {
          *(_DWORD *)buf = 67109378;
          v42 = v31;
          v43 = 2112;
          v44 = v39;
          _os_log_impl(&dword_1AEB31000, v33, v32, "_bm_openat_dprotected() failed: %{darwin.errno}d%@", buf, 0x12u);
        }

        if (v31 == 92)
        {
          __biome_log_for_category(2);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, v32))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AEB31000, v34, v32, "_bm_openat_dprotected() unlinking permanently lost file", buf, 2u);
          }

          v35 = unlinkat(v10, (const char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"), 0);
          if (v35)
          {
            v36 = v35;
            __biome_log_for_category(2);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, v32))
            {
              *(_DWORD *)buf = 67109120;
              v42 = v36;
              _os_log_impl(&dword_1AEB31000, v37, v32, "_bm_openat_dprotected() unlinkat: %{darwin.errno}d", buf, 8u);
            }

          }
        }
        *__error() = v31;
LABEL_49:

        goto LABEL_50;
      }
    }
  }
LABEL_51:

  return v13;
}

void sub_1AEB33F90(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1AEB34184(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1AEB34454(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id bm_fd_get_path(int a1)
{
  void *v1;
  _BYTE v3[1024];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (fcntl(a1, 50, v3) < 0)
  {
    v1 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *bm_subpath(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFString *v5;
  int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;

  v3 = a1;
  v4 = a2;
  if (!objc_msgSend(v3, "length") || !objc_msgSend(v4, "length"))
    goto LABEL_13;
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
  {
    v6 = objc_msgSend(v3, "hasSuffix:", CFSTR("/"));
    v7 = objc_msgSend(v4, "hasPrefix:", v3);
    if (v6)
    {
      if (v7)
      {
        v8 = objc_msgSend(v3, "length");
LABEL_12:
        objc_msgSend(v4, "substringFromIndex:", v8);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else if (v7)
    {
      v9 = objc_msgSend(v4, "length");
      if (v9 > objc_msgSend(v3, "length")
        && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v3, "length")) == 47)
      {
        v8 = objc_msgSend(v3, "length") + 1;
        goto LABEL_12;
      }
    }
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  v5 = CFSTR(".");
LABEL_14:

  return v5;
}

uint64_t bm_validate_pathat(int a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length") || a1 < 0 && a1 != -3)
    goto LABEL_9;
  if (a1 == -3)
  {
    if (!objc_msgSend(v4, "hasPrefix:", CFSTR("/")))
    {
LABEL_9:
      v6 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v4, "substringFromIndex:", 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("/")) & 1) != 0)
    goto LABEL_9;
  if ((objc_msgSend(v4, "isEqual:", CFSTR(".")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", &stru_1E5E40E10) & 1) != 0
      || (objc_msgSend(v9, "containsObject:", CFSTR(".")) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v6 = objc_msgSend(v9, "containsObject:", CFSTR("..")) ^ 1;
    }

  }
LABEL_10:

  return v6;
}

void sub_1AEB34B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMDataProtectionClassFromOSProtectionClass(int a1)
{
  if ((a1 - 1) > 6)
    return 3;
  else
    return qword_1AEB5C9F8[a1 - 1];
}

uint64_t BMFileAccessModeFromOFlags(__int16 a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 3;
  if ((a1 & 0x8000) == 0)
    v1 = 1;
  if ((a1 & 3) != 0)
    v2 = 0;
  else
    v2 = v1;
  if ((a1 & 3u) - 1 >= 2)
    return v2;
  else
    return 2;
}

uint64_t _bm_set_protection_class(int a1, uint64_t a2)
{
  int v2;
  int v4;
  int *v5;
  uint64_t result;
  int v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  statfs v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a2 == -1)
    return 0;
  v2 = a2;
  v4 = fcntl(a1, 64, a2);
  v5 = __error();
  result = 0;
  if (!v4)
    return result;
  v7 = *v5;
  if (*v5 == 45)
    return result;
  switch(v7)
  {
    case 22:
      goto LABEL_7;
    case 9:
      v9 = fcntl(a1, 63);
      if (v9 == -1)
      {
        v10 = *__error();
        __biome_log_for_category(2);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          _bm_set_protection_class_cold_2();

        *__error() = v10;
      }
      if (v9 != v2)
        break;
      return 0;
    case 1:
LABEL_7:
      memset(&v13, 0, 512);
      v8 = fstatfs(a1, &v13);
      if (v8 | v13.f_flags & 0x80)
        break;
      return 0;
  }
  __biome_log_for_category(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    _bm_set_protection_class_cold_1();

  *__error() = v7;
  return 0xFFFFFFFFLL;
}

uint64_t bm_opendirat(uint64_t a1, void *a2, int a3, mode_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  BMPathEnumerator *v10;
  BMPathEnumerator *v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  __int16 v36;
  id v37;
  mode_t v38;
  void *v39;

  v7 = a2;
  v39 = (void *)objc_opt_new();
  v38 = a4;
  if ((unsigned __int16)(a4 - 512) <= 0xFE00u)
  {
    __biome_log_for_category(2);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      bm_opendirat_cold_2();
    goto LABEL_87;
  }
  if ((a3 & 0x9EEFFCFF) != 0)
  {
    __biome_log_for_category(2);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      bm_opendirat_cold_8();
    goto LABEL_87;
  }
  if ((a3 & 0x20000100) == 0x20000100)
  {
    __biome_log_for_category(2);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      bm_opendirat_cold_6();
    goto LABEL_87;
  }
  if ((a3 & 0x20000100) != 0)
  {
    if ((a3 & 0x100000) != 0)
      goto LABEL_6;
    goto LABEL_82;
  }
  __biome_log_for_category(2);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    bm_opendirat_cold_7();

  a3 |= 0x100u;
  if ((a3 & 0x100000) == 0)
  {
LABEL_82:
    __biome_log_for_category(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      bm_opendirat_cold_5();

    a3 |= 0x100000u;
  }
LABEL_6:
  if (objc_msgSend(v7, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  if ((bm_validate_pathat(a1, v7) & 1) == 0)
  {
    __biome_log_for_category(2);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      bm_opendirat_cold_4();
LABEL_87:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 22);
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v35);
LABEL_88:

    v11 = 0;
    v13 = 0;
    LODWORD(v19) = 22;
    v18 = 0xFFFFFFFFLL;
    goto LABEL_68;
  }
  if ((_DWORD)a1 == -3)
    v9 = -2;
  else
    v9 = a1;
  v10 = -[BMPathEnumerator initWithPath:]([BMPathEnumerator alloc], "initWithPath:", v7);
  if (!v10)
  {
    __biome_log_for_category(2);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      bm_opendirat_cold_3();
    goto LABEL_88;
  }
  v11 = v10;
  -[BMPathEnumerator peekPath](v10, "peekPath");
  v12 = objc_claimAutoreleasedReturnValue();
  v37 = v7;
  if (v12)
  {
    v13 = (void *)v12;
    v14 = 0;
    v15 = a3;
    v16 = a3 & 0xFFFFFDFF;
    v17 = (void *)v12;
    do
    {
      v18 = openat(v9, (const char *)objc_msgSend(v17, "fileSystemRepresentation"), v14 | v16);
      if ((v18 & 0x80000000) != 0)
        v19 = *__error();
      else
        v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v20);

      if ((v18 & 0x80000000) == 0)
      {
        -[BMPathEnumerator navigateDown](v11, "navigateDown");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = v18;
        v7 = v37;
        a3 = v15;
        goto LABEL_38;
      }
      if ((v15 & 0x200) == 0)
      {
        v7 = v37;
        LOWORD(a3) = v15;
        goto LABEL_59;
      }
      if ((_DWORD)v19 != 2)
      {
        v7 = v37;
        a3 = v15;
        goto LABEL_29;
      }
      -[BMPathEnumerator navigateUp](v11, "navigateUp");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        break;
      -[BMPathEnumerator peekPath](v11, "peekPath");
      v22 = objc_claimAutoreleasedReturnValue();

      v14 = 1074790400;
      v17 = (void *)v22;
    }
    while (v22);
    v7 = v37;
    a3 = v15;
    if (v9 == -2)
    {
      LODWORD(v19) = 2;
      goto LABEL_29;
    }
    -[BMPathEnumerator navigateDown](v11, "navigateDown");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 2;
  }
  else
  {
    LODWORD(v19) = 0;
    v17 = 0;
    v18 = 0xFFFFFFFFLL;
LABEL_29:
    if (v9 != -2)
    {
      v13 = v17;
      v9 = a1;
      goto LABEL_59;
    }
    if (v19 > 0x14 || ((1 << v19) & 0x102002) == 0)
    {
      v13 = v17;
      v9 = -2;
      goto LABEL_59;
    }
    -[BMPathEnumerator navigateDown](v11, "navigateDown");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[BMPathEnumerator peekPath](v11, "peekPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    a1 = 4294967294;
    v17 = (void *)v23;
  }
LABEL_38:

  if (v13)
  {
    v36 = a3;
    v24 = a3 & 0xFFFFFDFF;
    while (1)
    {
      v25 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
      v19 = mkdirat(a1, v25, v38) ? *__error() : 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v26);

      if ((_DWORD)v19 != 17)
      {
        if ((_DWORD)v19)
          break;
      }
      -[BMPathEnumerator navigateDown](v11, "navigateDown");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v28 = 1074790400;
      else
        v28 = 0;
      v18 = openat(a1, v25, v28 | v24);
      v19 = 0;
      if ((v18 & 0x80000000) != 0)
        v19 = *__error();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v29);

      if ((_DWORD)v19)
      {

        break;
      }
      if ((_DWORD)a1 != v9)
        close(a1);

      a1 = v18;
      v13 = v27;
      if (!v27)
      {
        v7 = v37;
        goto LABEL_72;
      }
    }
    v18 = a1;
    v7 = v37;
    LOWORD(a3) = v36;
LABEL_60:
    if ((v18 & 0x80000000) == 0)
    {
      if ((_DWORD)v18 != v9)
        close(v18);
      v18 = 0xFFFFFFFFLL;
    }
    if ((_DWORD)v19 == 2)
    {
      if ((a3 & 0x200) == 0)
        goto LABEL_71;
    }
    else if ((_DWORD)v19 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D81590], "lockState");
LABEL_71:
      *__error() = v19;
      goto LABEL_72;
    }
LABEL_68:
    __biome_log_for_category(2);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      bm_opendirat_cold_1((uint64_t)v7, v39, v30);

    goto LABEL_71;
  }
  v18 = a1;
LABEL_59:
  if ((_DWORD)v19)
    goto LABEL_60;
LABEL_72:

  return v18;
}

uint64_t _bm_openat_dprotected(int a1, char *a2, int a3, uint64_t a4)
{
  _BOOL4 v10;
  uint64_t v11;
  int *v12;
  int v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  statfs v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = (a3 & 3) == 2 && (_DWORD)a4 != 6 && (_DWORD)a4 != -1;
  if ((a3 & 0x200) != 0 && (_DWORD)a4 != -1)
  {
    if (_bm_supports_openat_dprotected_syscall_onceToken != -1)
      dispatch_once(&_bm_supports_openat_dprotected_syscall_onceToken, &__block_literal_global_8);
    if (_bm_supports_openat_dprotected_syscall_supported)
    {
      v11 = openat_dprotected_np(a1, a2, a3, a4, 0, 384);
      v12 = __error();
      if ((v11 & 0x80000000) == 0)
        return v11;
      v13 = *v12;
      if (*v12 != 45)
      {
        if (v13 != 1 || (memset(&v19, 0, 512), v14 = fstatfs(a1, &v19), v14 | v19.f_flags & 0x80))
        {
LABEL_29:
          *__error() = v13;
          return 0xFFFFFFFFLL;
        }
      }
      v10 = 0;
    }
    goto LABEL_21;
  }
  if ((a3 & 0x200) != 0)
LABEL_21:
    v18 = 384;
  v15 = openat(a1, a2, a3, v18);
  v11 = v15;
  if (v10 && (v15 & 0x80000000) == 0 && _bm_set_protection_class(v15, a4))
  {
    v13 = *__error();
    if (close(v11))
    {
      __biome_log_for_category(2);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        bm_openat_dprotected_cold_2(v16);

    }
    goto LABEL_29;
  }
  return v11;
}

BOOL BMValidatePath(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t *v7;
  uint64_t *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  const __CFString *v42;
  id v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v3 = a1;
  objc_msgSend(CFSTR("streams"), "stringByAppendingString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasPrefix:", v4);

  if (v5)
  {
    if (BMStreamsPathRegex_onceToken != -1)
      dispatch_once(&BMStreamsPathRegex_onceToken, &__block_literal_global_7);
    v6 = CFSTR("streams");
    v7 = &BMStreamsPathRegex_regex;
    v8 = &BMStreamsPathRegex_names;
    goto LABEL_9;
  }
  objc_msgSend(CFSTR("compute"), "stringByAppendingString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "hasPrefix:", v9);

  if (!v10)
  {
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("sharedSync")))
    {
      __biome_log_for_category(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        BMValidatePath_cold_2();

      if (!a2)
        goto LABEL_31;
    }
    else if (!a2)
    {
LABEL_31:
      v12 = 0;
      v14 = 0;
LABEL_32:
      v17 = 0;
      goto LABEL_36;
    }
    v12 = 0;
    v14 = 0;
    goto LABEL_35;
  }
  if (BMComputePathRegex_onceToken != -1)
    dispatch_once(&BMComputePathRegex_onceToken, &__block_literal_global_65);
  v6 = CFSTR("compute");
  v7 = &BMComputePathRegex_regex;
  v8 = &BMComputePathRegex_names;
LABEL_9:
  v11 = objc_retainAutorelease((id)*v8);
  v12 = (id)*v7;
  v13 = v11;
  v14 = v13;
  if (!v12 || !v13)
  {
    __biome_log_for_category(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      BMValidatePath_cold_1();

    if (!a2)
      goto LABEL_32;
LABEL_35:
    v17 = 0;
    *a2 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v12, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = v15 != 0;
  if (a2 && v15)
  {
    v42 = v6;
    v43 = v12;
    v44 = a2;
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    if (objc_msgSend(v16, "numberOfRanges"))
    {
      v19 = 0;
      v48 = v14;
      v46 = v18;
      do
      {
        v20 = objc_msgSend(v16, "rangeAtIndex:", v19);
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = v20;
          v23 = v21;
          objc_msgSend(v14, "objectAtIndexedSubscript:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqual:", &stru_1E5E40E10);

          if ((v25 & 1) == 0)
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", v19);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = v18;
            if (v27)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BMValidatePath(NSString *__strong _Nonnull, NSDictionary *__autoreleasing * _Nullable)");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", v19);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectForKeyedSubscript:", v45);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "objectAtIndexedSubscript:", v19);
              v32 = v3;
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "substringWithRange:", v22, v23);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("BMSecurity.m"), 305, CFSTR("Dictionary already has value %@ for key %@; new value %@"),
                v31,
                v33,
                v34);

              v3 = v32;
              v14 = v48;

              v28 = v46;
            }
            objc_msgSend(v3, "substringWithRange:", v22, v23);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringByTrimmingCharactersInSet:", v47);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", v19);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, v37);

            v14 = v48;
            v18 = v28;
          }
        }
        ++v19;
      }
      while (v19 < objc_msgSend(v16, "numberOfRanges"));
    }
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v42, CFSTR("pathType"));
    v38 = objc_retainAutorelease(v18);
    *v44 = v38;

    v12 = v43;
    v17 = 1;
  }

LABEL_36:
  return v17;
}

uint64_t bm_replace_file(int a1, int a2, int a3, void *a4, uint64_t a5)
{
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  int v15;
  int *v16;
  NSObject *v17;
  off_t v18;
  int *v19;
  int v20;
  int *v21;
  int v22;
  int *v23;
  int v24;
  int v25;
  int *v26;
  NSObject *v27;
  int *v28;
  int v29;
  int *v30;
  stat v31;
  char path[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[2];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = v9;
  memset(&v31, 0, sizeof(v31));
  v45 = 0u;
  memset(v46, 0, 31);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)path = 0u;
  if (a1 < 0)
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      bm_replace_file_cold_1();
    goto LABEL_16;
  }
  if (a2 < 0)
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      bm_replace_file_cold_2();
    goto LABEL_16;
  }
  if (a3 < 0)
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      bm_replace_file_cold_3();
    goto LABEL_16;
  }
  if (!objc_msgSend(v9, "length", *(_OWORD *)&v31.st_dev, *(_OWORD *)&v31.st_uid, *(_OWORD *)&v31.st_atimespec, *(_OWORD *)&v31.st_mtimespec, *(_OWORD *)&v31.st_ctimespec, *(_OWORD *)&v31.st_birthtimespec, *(_OWORD *)&v31.st_size, *(_OWORD *)&v31.st_blksize, *(_OWORD *)v31.st_qspare, *(_QWORD *)path, *(_QWORD *)&path[8], v33, v34, v35, v36, v37, v38,
          v39,
          v40,
          v41,
          v42,
          v43,
          v44,
          v45,
          v46[0],
          *(_QWORD *)&v46[1],
          *((_QWORD *)&v46[1] + 1))
    || (objc_msgSend(v10, "containsString:", CFSTR("/")) & 1) != 0
    || (objc_msgSend(v10, "isEqual:", CFSTR(".")) & 1) != 0
    || objc_msgSend(v10, "isEqual:", CFSTR("..")))
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      bm_replace_file_cold_4();
LABEL_16:
    v12 = 22;
LABEL_17:

    goto LABEL_18;
  }
  v15 = fstat(a1, &v31);
  v16 = __error();
  if (v15)
  {
    v12 = *v16;
    __biome_log_for_category(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      bm_new_temporary_file_cold_4();
LABEL_23:
    v13 = 0xFFFFFFFFLL;
LABEL_24:

    goto LABEL_25;
  }
  if ((v31.st_mode & 0xF000) != 0x8000)
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      bm_new_temporary_file_cold_3();
    v12 = 79;
    goto LABEL_17;
  }
  if (v31.st_nlink)
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      bm_new_temporary_file_cold_2();
    v12 = 31;
    goto LABEL_17;
  }
  v18 = lseek(a1, 0, 0);
  v19 = __error();
  if (v18)
  {
    v12 = *v19;
    __biome_log_for_category(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      bm_replace_file_cold_14();
    goto LABEL_23;
  }
  if ((a5 & 0xFFFFFFFB) == 2)
  {
LABEL_42:
    if (__strlcpy_chk() != 15)
    {
      __biome_log_for_category(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
LABEL_57:
        bm_replace_file_cold_10();
LABEL_58:
      v12 = 14;
      goto LABEL_17;
    }
    v20 = a3;
    v13 = mkostempsat_np(a2, path, 0, 0x1000000);
    v21 = __error();
    if ((v13 & 0x80000000) != 0)
    {
      v12 = *v21;
      __biome_log_for_category(2);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        bm_replace_file_cold_6();
      goto LABEL_24;
    }
    if ((_DWORD)a5 != -1)
    {
      v22 = _bm_set_protection_class(v13, a5);
      v23 = __error();
      if (v22)
      {
        v12 = *v23;
        goto LABEL_71;
      }
    }
    v25 = fcopyfile(a1, v13, 0, 8u);
    v26 = __error();
    if (v25)
    {
      v12 = *v26;
      __biome_log_for_category(2);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        bm_replace_file_cold_9();
    }
    else
    {
LABEL_65:
      v29 = renameat(a2, path, v20, (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"));
      v30 = __error();
      if (!v29)
        goto LABEL_19;
      v12 = *v30;
      __biome_log_for_category(2);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        bm_replace_file_cold_8();
    }
  }
  else
  {
    do
    {
      if (__strlcpy_chk() != 15)
      {
        __biome_log_for_category(2);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        goto LABEL_57;
      }
      mktemp(path);
      v24 = fclonefileat(a1, a2, path, 3u);
      v12 = *__error();
    }
    while (v24 && v12 == 17);
    if (v24)
    {
      if (v12 == 45)
        goto LABEL_42;
      __biome_log_for_category(2);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        bm_replace_file_cold_12();
      goto LABEL_23;
    }
    v20 = a3;
    v13 = openat(a2, path, 2);
    v28 = __error();
    if ((v13 & 0x80000000) == 0)
      goto LABEL_65;
    v12 = *v28;
    __biome_log_for_category(2);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      bm_replace_file_cold_11();
  }

LABEL_71:
  if (unlinkat(a2, path, 0))
  {
    __biome_log_for_category(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      bm_replace_file_cold_7(v17);
    goto LABEL_24;
  }
LABEL_25:
  if (!v12)
    goto LABEL_19;
  if ((v13 & 0x80000000) == 0 && close(v13))
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      bm_openat_dprotected_cold_2(v11);
    goto LABEL_17;
  }
LABEL_18:
  *__error() = v12;
  v13 = 0xFFFFFFFFLL;
LABEL_19:

  return v13;
}

uint64_t bm_new_temporary_file(int a1, unsigned int a2, int a3, _QWORD *a4)
{
  uint64_t v8;
  int *v9;
  int v10;
  int *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  int *v17;
  NSObject *v19;
  stat v20;
  char path[16];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  strcpy(path, ".tmp.XXXXXXXX");
  memset(&v20, 0, sizeof(v20));
  if (a1 < 0)
  {
    __biome_log_for_category(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      bm_new_temporary_file_cold_1();
    goto LABEL_12;
  }
  if (a2 + 1 >= 9)
  {
    __biome_log_for_category(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      bm_new_temporary_file_cold_6();
LABEL_12:

    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  v8 = mkostempsat_np(a1, path, 0, 0x1000000);
  v9 = __error();
  if ((v8 & 0x80000000) != 0)
    goto LABEL_19;
  if (!a3 || (v10 = unlinkat(a1, path, 0), v11 = __error(), !v10))
  {
    if (a2 == 4 || (a2 != -1 ? (v15 = a2) : (v15 = 3), !_bm_set_protection_class(v8, v15)))
    {
      v16 = fstat(v8, &v20);
      v17 = __error();
      if (!v16)
      {
        if ((v20.st_mode & 0xF000) == 0x8000)
        {
          if (v20.st_nlink == (a3 ^ 1))
            goto LABEL_32;
          __biome_log_for_category(2);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            bm_new_temporary_file_cold_2();
          v12 = 31;
        }
        else
        {
          __biome_log_for_category(2);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            bm_new_temporary_file_cold_3();
          v12 = 79;
        }

        goto LABEL_26;
      }
      v12 = *v17;
      __biome_log_for_category(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        bm_new_temporary_file_cold_4();
      goto LABEL_24;
    }
    v9 = __error();
LABEL_19:
    v12 = *v9;
    if (*v9)
      goto LABEL_25;
    goto LABEL_32;
  }
  v12 = *v11;
  __biome_log_for_category(2);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    bm_new_temporary_file_cold_5();
LABEL_24:

  if (v12)
  {
LABEL_25:
    if ((v8 & 0x80000000) != 0)
    {
LABEL_27:
      *__error() = v12;
      return 0xFFFFFFFFLL;
    }
LABEL_26:
    close(v8);
    goto LABEL_27;
  }
LABEL_32:
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", path, *(_OWORD *)&v20.st_dev, *(_OWORD *)&v20.st_uid, *(_OWORD *)&v20.st_atimespec, *(_OWORD *)&v20.st_mtimespec, *(_OWORD *)&v20.st_ctimespec, *(_OWORD *)&v20.st_birthtimespec, *(_OWORD *)&v20.st_size, *(_OWORD *)&v20.st_blksize, *(_OWORD *)v20.st_qspare);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

const __CFString *BMStringForServiceDomain(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("User");
  if (a1 == 1)
    v1 = CFSTR("System");
  if (a1 == 2)
    return CFSTR("Count");
  else
    return v1;
}

id __biome_log_for_category(uint64_t a1)
{
  dispatch_once_t *v2;
  _QWORD block[5];

  v2 = (dispatch_once_t *)&categories[3 * a1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____biome_log_for_category_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (*v2 != -1)
    dispatch_once(v2, block);
  return categories[3 * a1 + 1];
}

id BMFileServerValidateAndParsePath(void *a1)
{
  _BOOL4 v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v11;

  v11 = 0;
  v1 = BMValidatePath(a1, &v11);
  v2 = v11;
  v3 = v2;
  if (v1)
  {
    v4 = (void *)objc_msgSend(v2, "mutableCopy");

    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", CFSTR("public")))
      v7 = 1;
    else
      v7 = 2;
    objc_msgSend(v5, "numberWithUnsignedInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("streamType"));

    v3 = v4;
    v9 = v3;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_1AEB39144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v29 - 120));
  _Unwind_Resume(a1);
}

void sub_1AEB39558(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1AEB3997C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

uint64_t BMShouldRetry(void *a1, unint64_t *a2, unint64_t a3, char a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;

  v7 = a1;
  v8 = v7;
  v9 = 0;
  if (v7 && a2)
  {
    if (*a2 < a3
      && (objc_msgSend(v7, "domain"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB28A8]),
          v10,
          v11))
    {
      if (objc_msgSend(v8, "code") == 4097 || (v12 = objc_msgSend(v8, "code"), v9 = 0, (a4 & 1) != 0) && v12 == 4099)
      {
        ++*a2;
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

void sub_1AEB3A820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMAccessModeFromEntitlementAccessModeString(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  objc_msgSend(&unk_1E5E4A540, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

void sub_1AEB3D048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1AEB3D2B4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id BMNonnullSetOfStringsFromEntitlementValue(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v3 = (void *)v2;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

LABEL_17:
  return v3;
}

id BMAppleInternalVariantOfEntitlement(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("com.apple.private."), CFSTR("com.apple.internal."), 8, 0, objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v1, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v27;
    v19 = *(_QWORD *)v27;
    do
    {
      v5 = 0;
      v20 = v3;
      do
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v5);
        objc_msgSend(v1, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          __softlink__BiomeLibraryAndInternalLibraryNode();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "streamWithIdentifier:error:", v6, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "valueForKeyPath:", CFSTR("configuration.streamUUID.UUIDString"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1, "setObject:forKeyedSubscript:", v7, v11);
            objc_msgSend(v10, "valueForKeyPath:", CFSTR("configuration.legacyNames"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v23;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v23 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(v1, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v14);
            }

            v4 = v19;
            v3 = v20;
          }
          else
          {
            v17 = BMBiomeLibraryIdentifierForUUIDString_onceToken;
            v18 = v6;
            if (v17 != -1)
              dispatch_once(&BMBiomeLibraryIdentifierForUUIDString_onceToken, &__block_literal_global_208);
            objc_msgSend((id)BMBiomeLibraryIdentifierForUUIDString_mapping, "objectForKeyedSubscript:", v18);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
              objc_msgSend(v1, "setObject:forKeyedSubscript:", v7, v11);
          }

        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v3);
  }

}

void sub_1AEB3DE64(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t BMIdentifierIsPathSafe(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v6;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  UniChar v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  CFIndex v23;
  _OWORD v24[8];
  CFStringRef theString;
  const UniChar *v26;
  const char *v27;
  uint64_t v28;
  CFIndex v29;
  int64_t v30;
  int64_t v31;
  CFRange v32;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    __biome_log_for_category(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      BMIdentifierIsPathSafe_cold_1();
    goto LABEL_10;
  }
  if (!objc_msgSend(v1, "length"))
  {
    __biome_log_for_category(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      BMIdentifierIsPathSafe_cold_2();
    goto LABEL_10;
  }
  if (objc_msgSend(v2, "length") == 1)
  {
    __biome_log_for_category(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      BMIdentifierIsPathSafe_cold_3();
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v2, "length") > 0xFF)
  {
    v4 = 0;
    goto LABEL_12;
  }
  v3 = v2;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    memset(v24, 0, sizeof(v24));
    Length = CFStringGetLength((CFStringRef)v3);
    theString = (CFStringRef)v3;
    v28 = 0;
    v29 = Length;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)v3);
    CStringPtr = 0;
    v26 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr((CFStringRef)v3, 0x600u);
    v30 = 0;
    v31 = 0;
    v27 = CStringPtr;
    if (Length >= 1)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 64;
      do
      {
        if ((unint64_t)v12 >= 4)
          v14 = 4;
        else
          v14 = v12;
        v15 = v29;
        if (v29 <= v12)
        {
          v16 = 0;
        }
        else if (v26)
        {
          v16 = v26[v12 + v28];
        }
        else if (v27)
        {
          v16 = v27[v28 + v12];
        }
        else
        {
          if (v31 <= v12 || v11 > v12)
          {
            v20 = v14 + v10;
            v21 = v13 - v14;
            v22 = v12 - v14;
            v23 = v22 + 64;
            if (v22 + 64 >= v29)
              v23 = v29;
            v30 = v22;
            v31 = v23;
            if (v29 >= v21)
              v15 = v21;
            v32.length = v15 + v20;
            v32.location = v22 + v28;
            CFStringGetCharacters(theString, v32, (UniChar *)v24);
            v11 = v30;
          }
          v16 = *((_WORD *)v24 + v12 - v11);
        }
        v17 = (unsigned __int16)(v16 - 48);
        if ((_DWORD)v12)
        {
          if (v17 >= 0xA && (unsigned __int16)((v16 & 0xFFDF) - 65) >= 0x1Au)
          {
            v18 = v16 - 45;
            if (v18 > 0x32 || ((1 << v18) & 0x4000000002003) == 0)
              goto LABEL_10;
          }
        }
        else if (v17 >= 0xA
               && (unsigned __int16)(v16 - 65) >= 0x1Au
               && v16 != 95
               && (unsigned __int16)(v16 - 97) >= 0x1Au)
        {
          goto LABEL_10;
        }
        ++v12;
        --v10;
        ++v13;
      }
      while (Length != v12);
    }
  }
  v4 = 1;
LABEL_11:

LABEL_12:
  return v4;
}

void sub_1AEB3E41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void BMExpandBiomeStreamsPremigrationIdentifiersAccessModeDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v1, "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier(v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v1, "setObject:forKeyedSubscript:", v8, v9);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

id BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier(uint64_t a1)
{
  return +[BMStreamMigrations libraryPathForStreamIdentifier:](BMStreamMigrations, "libraryPathForStreamIdentifier:", a1);
}

uint64_t BMResourceTypeFromEntitlementResourceTypeString(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(&unk_1E5E4A518, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedLongLongValue");
  else
    v3 = 0;

  return v3;
}

void sub_1AEB41160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,os_activity_scope_state_s state)
{
  uint64_t v37;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1AEB41374(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id get_DKMachServiceName()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)get_DKMachServiceNameSymbolLoc_ptr;
  v6 = get_DKMachServiceNameSymbolLoc_ptr;
  if (!get_DKMachServiceNameSymbolLoc_ptr)
  {
    v1 = (void *)CoreDuetLibrary();
    v0 = (id *)dlsym(v1, "_DKMachServiceName");
    v4[3] = (uint64_t)v0;
    get_DKMachServiceNameSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    get_DKMachServiceName_cold_1();
  return *v0;
}

void sub_1AEB41410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t BMSandboxCheck(_OWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  __int128 v10;
  uint64_t v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  const char *v18;
  __int128 v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  _BYTE buf[32];
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = (__CFString *)objc_retainAutorelease(v7);
  -[__CFString UTF8String](v9, "UTF8String");
  if ((a3 & 0x87FFFFFF) <= 0xE)
  {
    if (((1 << a3) & 0x100E) != 0)
    {
      -[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
LABEL_6:
      v10 = a1[1];
      *(_OWORD *)buf = *a1;
      *(_OWORD *)&buf[16] = v10;
      goto LABEL_7;
    }
    if (((1 << a3) & 0x4400) != 0)
    {
      -[__CFString unsignedIntValue](v8, "unsignedIntValue");
      goto LABEL_6;
    }
    if ((a3 & 0x87FFFFFF) == 0)
    {
      v20 = a1[1];
      *(_OWORD *)buf = *a1;
      *(_OWORD *)&buf[16] = v20;
LABEL_7:
      v11 = sandbox_check_by_audit_token();
      v12 = *__error();
      v13 = CFSTR("sandboxed");
      if (v9)
        v13 = v9;
      v14 = v13;

      switch((_DWORD)v11)
      {
        case 0xFFFFFFFF:
          __biome_log_for_category(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          v16 = CFSTR(", ");
          *(_DWORD *)buf = 138544130;
          v17 = &stru_1E5E40E10;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2114;
          if (v8)
            v17 = v8;
          else
            v16 = &stru_1E5E40E10;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v17;
          v31 = 1024;
          v32 = v12;
          v18 = "BMSandboxCheck(%{public}@%{public}@%{public}@) failed with error %{darwin.errno}d";
          break;
        case 0:
LABEL_22:
          v9 = v14;
          goto LABEL_23;
        case 1:
          if ((*MEMORY[0x1E0C806B0] & ~(_DWORD)a3) != 0)
            v11 = 2;
          else
            v11 = 1;
          goto LABEL_22;
        default:
          __biome_log_for_category(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
LABEL_21:

            v11 = 0xFFFFFFFFLL;
            goto LABEL_22;
          }
          v28 = CFSTR(", ");
          *(_DWORD *)buf = 138544130;
          v29 = &stru_1E5E40E10;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2114;
          if (v8)
            v29 = v8;
          else
            v28 = &stru_1E5E40E10;
          *(_QWORD *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v29;
          v31 = 1024;
          v32 = v11;
          v18 = "sandbox_check(%{public}@%{public}@%{public}@) returned unexpected value %d";
          break;
      }
      _os_log_error_impl(&dword_1AEB31000, v15, OS_LOG_TYPE_ERROR, v18, buf, 0x26u);
      goto LABEL_21;
    }
  }
  __biome_log_for_category(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    BMSandboxCheck_cold_1(a3, v21, v22, v23, v24, v25, v26, v27);

  v11 = 0xFFFFFFFFLL;
LABEL_23:

  return v11;
}

uint64_t CoreDuetLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E5E3D168;
    v3 = 0;
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary)
    CoreDuetLibrary_cold_1(&v1);
  return CoreDuetLibraryCore_frameworkLibrary;
}

uint64_t BMServiceDomainForResource(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  switch(objc_msgSend(v1, "type"))
  {
    case 1:
      objc_msgSend(v1, "name");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = BMServiceDomainForStream(2, v2);
      goto LABEL_5;
    case 2:
    case 3:
    case 4:
      objc_msgSend(v1, "name");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = 0;
LABEL_5:

      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

void sub_1AEB41E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AEB41F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMDataProtectionClassFromNSFileProtectionType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AE0]) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AB8]) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AB0]))
  {
    v2 = 0;
  }
  else
  {
    v2 = 3;
  }

  return v2;
}

void ____biome_log_for_category_block_invoke(uint64_t a1)
{
  os_log_t v2;
  char *v3;
  void *v4;

  v2 = os_log_create("com.apple.Biome", *((const char **)&categories + 3 * *(_QWORD *)(a1 + 32) + 2));
  v3 = (char *)&categories + 24 * *(_QWORD *)(a1 + 32);
  v4 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = v2;

}

uint64_t BMServiceDomainForStream(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v3 = a2;
  if (a1 == 2)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v5 = (void (*)(void))getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0;
    v18 = getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0;
    if (!getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke;
      v14[3] = &unk_1E5E3C680;
      v14[4] = &v15;
      __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke((uint64_t)v14);
      v5 = (void (*)(void))v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v5)
      BMServiceDomainForStream_cold_1();
    v5();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "streamWithIdentifier:error:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (objc_msgSend(v7, "valueForKeyPath:", CFSTR("configuration.storeConfig.domain")),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = v9;
      v4 = objc_msgSend(v9, "integerValue");

    }
    else if ((objc_msgSend(&unk_1E5E4A2E8, "containsObject:", v3) & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend(&unk_1E5E4A300, "containsObject:", v3))
    {
      +[BMProcess current](BMProcess, "current");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isRunningInUserContext");

      v4 = v12 ^ 1u;
    }
    else
    {
      v4 = 0;
    }

  }
  else if (a1 == 1)
  {
    v4 = +[BMPublicStreamUtilities domainForStream:](BMPublicStreamUtilities, "domainForStream:", +[BMPublicStreamUtilities streamForStreamIdentifier:](BMPublicStreamUtilities, "streamForStreamIdentifier:", v3));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1AEB42BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *BMAccessModePrintableDescription(unint64_t a1)
{
  if (a1 < 4)
    return off_1E5E3C798[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown (%llu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1AEB44950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id BMPremigratedStreamIdentifierForBiomeLibraryStreamIdentifier(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths](BMPublicStreamUtilities, "libraryPublicStreamMigrationPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  +[BMStreamMigrations libraryRestrictedStreamMigrationPaths](BMStreamMigrations, "libraryRestrictedStreamMigrationPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id BMSyncableStreamIdentifiers()
{
  if (BMSyncableStreamIdentifiers_onceToken != -1)
    dispatch_once(&BMSyncableStreamIdentifiers_onceToken, &__block_literal_global);
  return (id)BMSyncableStreamIdentifiers_identifiers;
}

void sub_1AEB489A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMStreamSyncPolicyClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMStreamSyncPolicy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMStreamSyncPolicyClass_block_invoke_cold_1();
  getBMStreamSyncPolicyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BiomeStreamsLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E5E3C6E8;
    v3 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
    BiomeStreamsLibrary_cold_1(&v1);
  return BiomeStreamsLibraryCore_frameworkLibrary;
}

id __softlink__BiomeLibraryAndInternalLibraryNode()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr;
  v7 = getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr;
  if (!getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr)
  {
    v1 = (void *)BiomeStreamsLibrary();
    v0 = dlsym(v1, "BiomeLibraryAndInternalLibraryNode");
    v5[3] = (uint64_t)v0;
    getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    __softlink__BiomeLibraryAndInternalLibraryNode_cold_1();
  ((void (*)(uint64_t))v0)(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1AEB48CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t BMDevicePlatformFromModelString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("AudioAccessory")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("MacBook")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("Mac")) & 1) != 0
         || (objc_msgSend(v1, "hasPrefix:", CFSTR("iMac")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "hasPrefix:", CFSTR("RealityDevice")))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *BMDevicePlatformGetDescription(unint64_t a1)
{
  if (a1 < 9)
    return off_1E5E3C7E0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1AEB49978(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1AEB49C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1AEB49DF8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 8u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  void *v0;

  return objc_msgSend(v0, "pid");
}

uint64_t OUTLINED_FUNCTION_10(void *a1, const char *a2)
{
  return objc_msgSend(a1, "selector");
}

uint64_t OUTLINED_FUNCTION_13()
{
  void *v0;

  return objc_msgSend(v0, "pid");
}

uint64_t OUTLINED_FUNCTION_14()
{
  void *v0;

  return objc_msgSend(v0, "pid");
}

void sub_1AEB4B700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v29 - 120));
  _Unwind_Resume(a1);
}

void sub_1AEB4B9DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 120));
  _Unwind_Resume(a1);
}

void bm_service_connection_handler(void *a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  BOOL v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  v5 = a1;
  +[BMXPCListener serviceListener](BMXPCListener, "serviceListener");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2 == MEMORY[0x1E0C80D38];
  else
    v4 = 1;
  if (v4)
  {
    objc_msgSend(v1, "_handleConnection:", v5);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __bm_service_connection_handler_block_invoke;
    block[3] = &unk_1E5E3CBF0;
    v7 = v1;
    v8 = v5;
    dispatch_sync(v3, block);

  }
}

uint64_t __bm_service_connection_handler_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnection:", *(_QWORD *)(a1 + 40));
}

void sub_1AEB4DE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1AEB4E2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1AEB4E88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AEB4EA2C(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1AEB4EA90(uint64_t a1, int a2)
{
  if (a2)
    JUMPOUT(0x1AEB4EA9CLL);
  JUMPOUT(0x1AEB4EA88);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  int v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

void OUTLINED_FUNCTION_6_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_fault_impl(a1, a4, OS_LOG_TYPE_FAULT, a2, a3, 0x12u);
}

uint64_t BMServiceDomainForSet()
{
  return 0;
}

void *__getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E5E3CDD0;
    v5 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary_0)
    __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)BiomeStreamsLibraryCore_frameworkLibrary_0, "BiomeLibraryAndInternalLibraryNode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AEB4F5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AEB4F8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRBSProcessHandleClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSProcessHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSProcessHandleClass_block_invoke_cold_1();
  getRBSProcessHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void RunningBoardServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E5E3CE58;
    v2 = 0;
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    RunningBoardServicesLibrary_cold_1(&v0);
}

Class __getRBSTargetClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSTarget");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSTargetClass_block_invoke_cold_1();
  getRBSTargetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSDomainAttributeClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSDomainAttribute");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSDomainAttributeClass_block_invoke_cold_1();
  getRBSDomainAttributeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRBSAssertionClass_block_invoke_cold_1();
  getRBSAssertionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t BMStorageErrorGetErrno(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CB2FE0];
  v4 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CB2FE0]);

  if (v4)
  {
    v5 = objc_msgSend(v1, "code");
  }
  else
  {
    objc_msgSend(v1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("BiomeStorageError"));

    if (v7)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v1, "underlyingErrors", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v13, "domain");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqual:", v3);

            if ((v15 & 1) != 0)
            {
              v5 = objc_msgSend(v13, "code");

              goto LABEL_15;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v10)
            continue;
          break;
        }
      }

    }
    v5 = 0;
  }
LABEL_15:

  return v5;
}

uint64_t BMStorageErrorShouldTryAgainLater(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("BiomeStorageError"));

  if (v3 && objc_msgSend(v1, "code") == 5)
  {
    objc_msgSend(v1, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserControlled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1AEB50540(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1AEB50908(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

uint64_t _bm_log_config_for_errno(int a1, uint64_t a2, void **a3)
{
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a3)
  {
    v6 = *a3;
    *a3 = &stru_1E5E40E10;

  }
  if (a2)
  {
    if ((*(_BYTE *)(a2 + 1) & 2) != 0)
      result = 17;
    else
      result = 1;
  }
  else
  {
    result = 1;
  }
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      v8 = objc_msgSend(MEMORY[0x1E0D81590], "lockState");
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" locked:%d"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *a3;
        *a3 = (void *)v9;

      }
      if ((_DWORD)v8 == 1)
        return 1;
      else
        return 16;
    }
    else
    {
      return 17;
    }
  }
  return result;
}

void ___bm_supports_openat_dprotected_syscall_block_invoke()
{
  id v0;

  +[BMProcess current](BMProcess, "current");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _bm_supports_openat_dprotected_syscall_supported = objc_msgSend(v0, "canPerformSyscall:report:", &unk_1E5E48B70, 0);

}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

int *OUTLINED_FUNCTION_6_1()
{
  return __error();
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void *__getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_1E5E3CF98;
    v5 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary_1)
    __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1_0(&v3);
  result = dlsym((void *)BiomeStreamsLibraryCore_frameworkLibrary_1, "BiomeLibraryAndInternalLibraryNode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t BMEntitlementIsAppleInternal(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.internal."));
}

id BMRegularVariantOfAppleInternalEntitlement(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("com.apple.internal."), CFSTR("com.apple.private."), 8, 0, objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1AEB53F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 80));
  _Unwind_Resume(a1);
}

void sub_1AEB54200(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

void sub_1AEB56444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBMStreamSyncPolicyClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMStreamSyncPolicyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAccessControlPolicy.m"), 41, CFSTR("Unable to find class %s"), "BMStreamSyncPolicy");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMAccessControlPolicy.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __softlink__BiomeLibraryAndInternalLibraryNode_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<_BMRootLibrary> __softlink__BiomeLibraryAndInternalLibraryNode(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAccessControlPolicy.m"), 40, CFSTR("%s"), dlerror());

  __break(1u);
}

void BMServiceDomainForStream_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<_BMRootLibrary> __softlink__BiomeLibraryAndInternalLibraryNode(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMServiceDomain.m"), 22, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMServiceDomain.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void BMSandboxCheck_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEB31000, a2, a3, "BMSandboxCheck: unexpected filter %lx", a5, a6, a7, a8, 0);
}

void __getRBSProcessHandleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSProcessHandleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMProcess.m"), 32, CFSTR("Unable to find class %s"), "RBSProcessHandle");

  __break(1u);
}

void RunningBoardServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMProcess.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getRBSTargetClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSTargetClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMProcess.m"), 33, CFSTR("Unable to find class %s"), "RBSTarget");

  __break(1u);
}

void __getRBSDomainAttributeClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSDomainAttributeClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMProcess.m"), 34, CFSTR("Unable to find class %s"), "RBSDomainAttribute");

  __break(1u);
}

void __getRBSAssertionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSAssertionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMProcess.m"), 35, CFSTR("Unable to find class %s"), "RBSAssertion");

  __break(1u);
}

void BMIdentifierIsPathSafe_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BMIdentifierIsPathSafe_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Empty identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BMIdentifierIsPathSafe_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Identifier too short", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BMValidatePath_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Failed to parse path validation regular expression", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BMValidatePath_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Shared sync is not supported on this platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_openat_dprotected_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1AEB31000, v0, OS_LOG_TYPE_FAULT, "bm_opendirat() unexpectedly returned atfd", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void bm_openat_dprotected_cold_2(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, a1, v2, "close() failed: %{darwin.errno}d", v3);
  OUTLINED_FUNCTION_1_2();
}

void bm_openat_dprotected_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "bm_openat_dprotected() failed: invalid path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_opendirat_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_fault_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_FAULT, "bm_opendirat(\"%{private}@\") failed with sequence: %{public}@", (uint8_t *)&v6, 0x16u);

}

void bm_opendirat_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "bm_opendirat() passed invalid mode 0x%x", v2);
  OUTLINED_FUNCTION_4();
}

void bm_opendirat_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "bm_opendirat() failed: nil enumerator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_opendirat_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "bm_opendirat() passed invalid path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_opendirat_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "bm_opendirat() should be passed O_DIRECTORY", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_opendirat_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "bm_opendirat() cannot be passed both O_NOFOLLOW and O_NOFOLLOW_ANY", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_opendirat_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "bm_opendirat() should be passed O_NOFOLLOW or O_NOFOLLOW_ANY", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_opendirat_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "bm_opendirat() passed invalid set of flags 0x%x", v2);
  OUTLINED_FUNCTION_4();
}

void _bm_set_protection_class_cold_1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  v3 = 1024;
  v4 = v0;
  _os_log_fault_impl(&dword_1AEB31000, v1, OS_LOG_TYPE_FAULT, "fcntl(fd, F_SETPROTECTIONCLASS, %d) failed: %{darwin.errno}d", v2, 0xEu);
}

void _bm_set_protection_class_cold_2()
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  _os_log_fault_impl(&dword_1AEB31000, v0, OS_LOG_TYPE_FAULT, "fcntl(fd, F_GETPROTECTIONCLASS) failed: %{darwin.errno}d", v1, 8u);
  OUTLINED_FUNCTION_4();
}

void bm_new_temporary_file_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Invalid tmp dir parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_new_temporary_file_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "stat check: too many links", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_new_temporary_file_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "stat check: invalid file type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_new_temporary_file_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "fstat() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void bm_new_temporary_file_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "unlinkat() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void bm_new_temporary_file_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Invalid protection parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Missing src file handle parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Missing tmp file handle parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Missing dst file handle parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Invalid path parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "mkostempsat_np() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_7(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, a1, v2, "unlinkat() failed: %{darwin.errno}d", v3);
  OUTLINED_FUNCTION_1_2();
}

void bm_replace_file_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "renameat() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "fcopyfile() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "strlcpy() failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "openat() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "fclonefileat() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void bm_replace_file_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_5(&dword_1AEB31000, v0, v1, "lseek() failed: %{darwin.errno}d", v2);
  OUTLINED_FUNCTION_4();
}

void __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMAccessServer.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void get_DKMachServiceName_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *get_DKMachServiceName(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAccessConnectionFactory.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

void CoreDuetLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMAccessConnectionFactory.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _NSDefaultFileSystemEncoding()
{
  return MEMORY[0x1E0CB3BC0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

uint64_t aks_get_extended_device_state()
{
  return MEMORY[0x1E0CFD3C8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE4108](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1E0C832F0](*(_QWORD *)&a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C83308](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C83320](*(_QWORD *)&a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1E0C84168](*(_QWORD *)&a1, a2, a3);
}

int mkostempsat_np(int dfd, char *path, int slen, int oflags)
{
  return MEMORY[0x1E0C84190](*(_QWORD *)&dfd, path, *(_QWORD *)&slen, *(_QWORD *)&oflags);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int openat_dprotected_np(int a1, const char *a2, int a3, int a4, int a5, ...)
{
  return MEMORY[0x1E0C844B0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1E0C85010](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int removefileat(int fd, const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850E8](*(_QWORD *)&fd, path, state, *(_QWORD *)&flags);
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return MEMORY[0x1E0C85108](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

void rewinddir(DIR *a1)
{
  MEMORY[0x1E0C85128](a1);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t sysctlbyname_get_data_np()
{
  return MEMORY[0x1E0C857A8]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C859C0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1E0C85B88]();
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x1E0C85B90]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

au_asid_t xpc_connection_get_asid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C85FC8](connection);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

gid_t xpc_connection_get_egid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C85FE8](connection);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C85FF0](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1E0C86058]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x1E0C860D0]();
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1E0C864A0](*(_QWORD *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1E0C864B0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_main(xpc_connection_handler_t handler)
{
  MEMORY[0x1E0C86608](handler);
}

