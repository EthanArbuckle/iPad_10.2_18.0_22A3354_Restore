@implementation _LSDatabase

- (uint64_t)store
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (_QWORD)setAccessContext:(_QWORD *)result
{
  void *v2;
  CFTypeRef v3;
  id v4;

  if (result)
  {
    v2 = result;
    v3 = (CFTypeRef)result[207];
    if (v3 != cf)
    {
      result[207] = cf;
      if (cf)
        CFRetain(cf);
      if (v3)
        CFRelease(v3);
      v4 = objc_retainAutorelease(v2);
      return (_QWORD *)_CSStoreSetExpectedAccessContext();
    }
  }
  return result;
}

- (id)_init
{
  _LSDatabase *v2;
  _LSSchemaCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_LSDatabase;
  v2 = -[_LSDatabase init](&v5, sel_init);
  if (v2)
  {
    v3 = (_LSSchemaCache *)operator new();
    _LSSchemaCache::_LSSchemaCache(v3);
    v2->schema._cache = v3;
  }
  return v2;
}

- (uint64_t)isSeeded
{
  uint64_t v1;
  uint64_t v2;
  uint8_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *p_p;
  uint8_t *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint8_t *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *__p;
  uint64_t v21;
  unsigned __int8 v22;
  _OWORD v23[2];
  _OWORD v24[2];
  _OWORD v25[2];
  _OWORD v26[6];
  char v27[112];
  _BYTE __dst[32];
  uint8_t buf[40];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  _LSDatabaseGetHeader(v26);
  LSDBHeader::GetCurrentBuildVersion(&__p);
  v1 = v22;
  if ((v22 & 0x80u) != 0)
    v1 = v21;
  if (!v1)
  {
    _LSDatabaseGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "Could not get OS build version.", buf, 2u);
    }
    goto LABEL_41;
  }
  *(_QWORD *)__dst = 0;
  *(_QWORD *)&__dst[8] = 0;
  strlcpy(__dst, v27, 0x10uLL);
  std::string::basic_string[abi:nn180100]<0>(buf, __dst);
  v2 = buf[23];
  v3 = buf[23];
  v4 = *(_QWORD *)&buf[8];
  if ((buf[23] & 0x80u) == 0)
    v5 = buf[23];
  else
    v5 = *(_QWORD *)&buf[8];
  v6 = v22;
  if ((v22 & 0x80u) != 0)
    v6 = v21;
  if (v5 == v6)
  {
    if ((v22 & 0x80u) == 0)
      p_p = (unsigned __int8 *)&__p;
    else
      p_p = (unsigned __int8 *)__p;
    if ((char)buf[23] < 0)
    {
      v11 = *(void **)buf;
      v12 = memcmp(*(const void **)buf, p_p, *(size_t *)&buf[8]);
      v5 = v4;
      if (!v12)
      {
        operator delete(v11);
        goto LABEL_38;
      }
    }
    else
    {
      if (!buf[23])
        goto LABEL_38;
      v8 = buf;
      while (*v8 == *p_p)
      {
        ++v8;
        ++p_p;
        if (!--v2)
        {
          v9 = 0;
          if ((buf[23] & 0x80) == 0)
            goto LABEL_32;
          goto LABEL_35;
        }
      }
    }
  }
  if (!v5)
  {
    v9 = 1;
    if ((v3 & 0x80) == 0)
      goto LABEL_32;
LABEL_35:
    operator delete(*(void **)buf);
    if ((v9 & 1) != 0)
      goto LABEL_42;
    goto LABEL_38;
  }
  _LSDatabaseGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = buf;
    if ((buf[23] & 0x80u) != 0)
      v14 = *(uint8_t **)buf;
    v15 = &__p;
    if ((v22 & 0x80u) != 0)
      v15 = __p;
    *(_DWORD *)__dst = 136446466;
    *(_QWORD *)&__dst[4] = v14;
    *(_WORD *)&__dst[12] = 2082;
    *(_QWORD *)&__dst[14] = v15;
    _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "Local database thinks system build version is %{public}s, but the OS really is %{public}s.", __dst, 0x16u);
  }

  v9 = 1;
  if ((buf[23] & 0x80) != 0)
    goto LABEL_35;
LABEL_32:
  if ((v9 & 1) != 0)
    goto LABEL_42;
LABEL_38:
  _LSGetCurrentSystemVersion(v25);
  *(_OWORD *)buf = *(_OWORD *)((char *)v26 + 8);
  *(_OWORD *)&buf[16] = *(_OWORD *)((char *)&v26[1] + 8);
  *(_OWORD *)__dst = v25[0];
  *(_OWORD *)&__dst[16] = v25[1];
  if (_LSVersionNumberCompare(buf, __dst))
  {
    _LSDatabaseGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v24[0] = *(_OWORD *)((char *)v26 + 8);
      v24[1] = *(_OWORD *)((char *)&v26[1] + 8);
      _LSVersionNumberGetStringRepresentation(v24);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      _LSGetCurrentSystemVersion(v23);
      _LSVersionNumberGetStringRepresentation(v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "Local database thinks system version is %{public}@, but the OS really is %{public}@.", buf, 0x16u);

    }
LABEL_41:

LABEL_42:
    v18 = 0;
    goto LABEL_43;
  }
  v18 = 1;
LABEL_43:
  if ((char)v22 < 0)
    operator delete(__p);
  return v18;
}

- (uint64_t)isSeedingComplete
{
  NSObject *v1;
  _OWORD v2[5];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v3 = 0u;
    v4 = 0u;
    memset(v2, 0, sizeof(v2));
    _LSDatabaseGetHeader(v2);
    if ((BYTE8(v3) & 2) != 0)
    {
      _LSDatabaseGetLog();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        -[_LSDatabase isSeedingComplete].cold.1();

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)dealloc
{
  __CSStore *store;
  __CSStoreAccessContext *accessContext;
  _LSSchemaCache *cache;
  objc_super v6;

  store = self->store;
  if (store)
  {
    CFRelease(store);
    self->store = 0;
  }
  accessContext = self->accessContext;
  if (accessContext)
  {
    CFRelease(accessContext);
    self->accessContext = 0;
  }
  cache = self->schema._cache;
  if (cache)
  {
    _LSSchemaCache::~_LSSchemaCache(cache);
    MEMORY[0x186DADEF4]();
  }
  v6.receiver = self;
  v6.super_class = (Class)_LSDatabase;
  -[_LSDatabase dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->node, 0);
}

- (_LSDatabase)init
{
  abort();
}

- (id)description
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;

  -[FSNode pathWithError:](self->node, "pathWithError:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("?");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  if (self->sessionKey.systemSession)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = CFSTR("<LSDatabase %p> { system session, path = '%@' }");
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (self->sessionKey.uid != -2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<LSDatabase %p> { userID = %llu, path = '%@' }"), self, self->sessionKey.uid, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v8 = CFSTR("<LSDatabase %p> { path = '%@' }");
  }
  objc_msgSend(v7, "stringWithFormat:", v8, self, v6);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)v9;

  return v10;
}

- (uint64_t)schema
{
  if (a1)
    return a1 + 16;
  else
    return 0;
}

- (uint64_t)accessContext
{
  if (result)
    return *(_QWORD *)(result + 1656);
  return result;
}

- (void)setSeeded:(uint64_t)a1
{
  void **v4;
  void **v5;
  void **v6;
  void **v7;
  void **v8;
  void *__p[2];
  __int128 v10;
  _OWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    memset(v11, 0, sizeof(v11));
    _LSDatabaseGetHeader(v11);
    if (a2)
    {
      _LSGetCurrentSystemVersion((_OWORD *)((char *)v11 + 8));
      LSDBHeader::GetCurrentBuildVersion(__p);
      v13 = 0uLL;
      if ((SBYTE7(v10) & 0x80u) == 0)
        v4 = __p;
      else
        v4 = (void **)__p[0];
      strlcpy((char *)&v13, (const char *)v4, 0x10uLL);
      if (SBYTE7(v10) < 0)
        operator delete(__p[0]);
      LSDBHeader::GetCurrentModelCode(__p);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      if ((SBYTE7(v10) & 0x80u) == 0)
        v5 = __p;
      else
        v5 = (void **)__p[0];
      strlcpy((char *)&v14, (const char *)v5, 0x40uLL);
      if (SBYTE7(v10) < 0)
        operator delete(__p[0]);
      _LSGetCurrentCryptexVersion(__p);
      *(_OWORD *)((char *)&v11[2] + 8) = *(_OWORD *)__p;
      *(_OWORD *)((char *)&v11[3] + 8) = v10;
      LSDBHeader::GetCurrentCryptexVersion(__p);
      *((_QWORD *)&v11[4] + 1) = 0;
      *(_QWORD *)&v12 = 0;
      if ((SBYTE7(v10) & 0x80u) == 0)
        v6 = __p;
      else
        v6 = (void **)__p[0];
    }
    else
    {
      memset((char *)v11 + 8, 0, 32);
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      v13 = 0uLL;
      if ((SBYTE7(v10) & 0x80u) == 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      strlcpy((char *)&v13, (const char *)v7, 0x10uLL);
      if (SBYTE7(v10) < 0)
        operator delete(__p[0]);
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      if ((SBYTE7(v10) & 0x80u) == 0)
        v8 = __p;
      else
        v8 = (void **)__p[0];
      strlcpy((char *)&v14, (const char *)v8, 0x40uLL);
      if (SBYTE7(v10) < 0)
        operator delete(__p[0]);
      memset((char *)&v11[2] + 8, 0, 32);
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      *((_QWORD *)&v11[4] + 1) = 0;
      *(_QWORD *)&v12 = 0;
      if ((SBYTE7(v10) & 0x80u) == 0)
        v6 = __p;
      else
        v6 = (void **)__p[0];
    }
    strlcpy((char *)&v11[4] + 8, (const char *)v6, 0x10uLL);
    if (SBYTE7(v10) < 0)
      operator delete(__p[0]);
    _LSDatabaseSetHeader(a1);
  }
}

- (BOOL)cryptexContentChanged
{
  uint64_t v1;
  _BOOL8 v2;
  _OWORD v4[2];
  _OWORD v5[2];
  _OWORD v6[13];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  memset(v6, 0, sizeof(v6));
  _LSDatabaseGetHeader(v6);
  _LSGetCurrentCryptexVersion(v5);
  v4[0] = *(_OWORD *)((char *)&v6[2] + 8);
  v4[1] = *(_OWORD *)((char *)&v6[3] + 8);
  v1 = _LSVersionNumberCompare(v5, v4);
  v2 = v1 != 0;
  if (v1)
    _LSGetCurrentCryptexVersion((_OWORD *)((char *)&v6[2] + 8));
  return v2;
}

- (void)setSeedingComplete:(_LSDatabase *)a1
{
  if (a1)
    _LSDatabaseSetHeaderFlag(a1, 2, a2 ^ 1);
}

- (void)setApplicationsChanged:(_LSDatabase *)a1
{
  if (a1)
    _LSDatabaseSetHeaderFlag(a1, 0x1000000, a2);
}

- (void)setDocumentTypesChanged:(_LSDatabase *)a1
{
  if (a1)
    _LSDatabaseSetHeaderFlag(a1, 0x2000000, a2);
}

- (void)setURLTypesChanged:(_LSDatabase *)a1
{
  if (a1)
    _LSDatabaseSetHeaderFlag(a1, 0x4000000, a2);
}

- (void)setTypeDeclarationsChanged:(_LSDatabase *)a1
{
  if (a1)
    _LSDatabaseSetHeaderFlag(a1, 0x8000000, a2);
}

- (void)isSeedingComplete
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "Database seeding is incomplete, need to rebuild", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

@end
