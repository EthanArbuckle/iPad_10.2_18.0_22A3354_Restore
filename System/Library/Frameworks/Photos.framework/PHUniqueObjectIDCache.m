@implementation PHUniqueObjectIDCache

- (id)uniquedOIDs:(id)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(a1, "_verifyObjectIDIsTagged:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    a1 = v4;
  }

  return a1;
}

- (void)_verifyObjectIDIsTagged:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t)a3;
  if (v3 >= 1)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_FAULT, "Unexpected non-tagged NSManagedObjectID: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (id)uniquedOIDsFromObjects:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t j;
  void *v22;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[2];
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (!a1 || !v3)
    goto LABEL_26;
  v6 = objc_msgSend(v3, "count");
  v7 = v6;
  if ((v6 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = (_QWORD *)MEMORY[0x1E0C99750];
    goto LABEL_29;
  }
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = v6;
  if (v6 >= 0x101)
    v9 = 1;
  else
    v9 = v8;
  v10 = 8 * v9;
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v29 - v11;
  bzero((char *)&v29 - v11, v10);
  v31 = &v29;
  if (v7 >= 0x101)
  {
    v15 = (char *)malloc_type_calloc(8uLL, v8, 0xD0F50EE7uLL);
    if (v15)
    {
      v12 = v15;
      MEMORY[0x1E0C80A78]();
      v13 = (char *)v28;
      bzero(v28, v10);
      v16 = malloc_type_calloc(8uLL, v8, 0x66127448uLL);
      if (v16)
      {
        v14 = v16;
        objc_msgSend(v4, "getObjects:range:", v12, 0, v7);
LABEL_16:
        v30 = v4;
        for (i = 0; i != v7; ++i)
        {
          v18 = *(id *)&v12[8 * i];
          objc_msgSend(v18, "objectID");
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_verifyObjectIDIsTagged:", v19);
          v20 = (void *)v14[i];
          v14[i] = v19;

        }
        v4 = v30;
        goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v8);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = (_QWORD *)MEMORY[0x1E0C99850];
LABEL_29:
    objc_msgSend(v25, "exceptionWithName:reason:userInfo:", *v26, v24, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  bzero(v12, 8 * v8);
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&v29 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v13, v10);
  bzero(v13, 8 * v8);
  objc_msgSend(v4, "getObjects:range:", v12, 0, v7);
  v14 = v13;
  if (v7)
    goto LABEL_16;
LABEL_19:
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:count:", v14, v7);
  if (v7 >= 0x101)
    free(v12);
  for (j = 0; j != v8; ++j)
  {
    v22 = (void *)v14[j];
    v14[j] = 0;

  }
  if (v7 >= 0x101)
    free(v14);
  do
  {

    v10 -= 8;
  }
  while (v10);
LABEL_26:

  return v5;
}

@end
