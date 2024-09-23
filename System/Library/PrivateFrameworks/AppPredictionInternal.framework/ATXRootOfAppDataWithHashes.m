@implementation ATXRootOfAppDataWithHashes

- (ATXRootOfAppDataWithHashes)init
{
  ATXRootOfAppDataWithHashes *v2;
  uint64_t v3;
  NSMutableDictionary *dataForBundleId;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXRootOfAppDataWithHashes;
  v2 = -[ATXRootOfAppData initInternal](&v6, sel_initInternal);
  if (v2)
  {
    v3 = objc_opt_new();
    dataForBundleId = v2->_dataForBundleId;
    v2->_dataForBundleId = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (ATXRootOfAppDataWithHashes)initWithSerialized:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  ATXRootOfAppDataWithHashes *v10;
  NSObject *v11;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXRootOfAppDataWithHashes;
  v5 = -[ATXRootOfAppData initInternal](&v14, sel_initInternal);
  if (!v5)
    goto LABEL_4;
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 2, 0, &v13);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_autoreleasePoolPop(v6);
  v9 = (void *)v5[1];
  v5[1] = v7;

  if (v5[1])
  {

LABEL_4:
    v10 = v5;
    goto LABEL_8;
  }
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ATXRootOfAppDataWithHashes initWithSerialized:].cold.1((uint64_t)v8, v11);

  v10 = 0;
LABEL_8:

  return v10;
}

- (unint64_t)sessionCountForBundleId:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForBundleId, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = *(unsigned int *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
  else
    v5 = 0;

  return v5;
}

- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unsigned int *v11;
  unint64_t v12;
  _DWORD __key[2];

  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForBundleId, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (v9 = objc_retainAutorelease(v7),
        v10 = objc_msgSend(v9, "mutableBytes"),
        __key[0] = hash32(v6),
        __key[1] = 0,
        (v11 = (unsigned int *)bsearch(__key, (const void *)(v10 + 4), (unint64_t)(objc_msgSend(v9, "length") - 4) >> 3, 8uLL, (int (__cdecl *)(const void *, const void *))compareEntries)) != 0))
  {
    v12 = v11[1];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4
{
  id v6;
  int v7;
  void *v8;
  id v9;
  _DWORD *v10;
  _DWORD *v11;
  void *v12;
  _DWORD *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _DWORD __key[2];

  v6 = a3;
  v7 = hash32(a4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForBundleId, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_retainAutorelease(v8);
    v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
    ++*v10;
    __key[0] = v7;
    __key[1] = 1;
    v11 = bsearch(__key, v10 + 1, (unint64_t)(objc_msgSend(v9, "length") - 4) >> 3, 8uLL, (int (__cdecl *)(const void *, const void *))compareEntries);
    if (v11)
    {
      ++v11[1];
    }
    else
    {
      objc_msgSend(v9, "appendBytes:length:", __key, 8);
      v14 = objc_retainAutorelease(v9);
      v15 = (void *)(objc_msgSend(v14, "mutableBytes") + 4);
      v16 = objc_msgSend(v14, "length");

      qsort(v15, (unint64_t)(v16 - 4) >> 3, 8uLL, (int (__cdecl *)(const void *, const void *))compareEntries);
    }
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataForBundleId, "setObject:forKeyedSubscript:", v12, v6);
    v9 = objc_retainAutorelease(v12);
    v13 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
    *v13 = 1;
    v13[1] = v7;
    v13[2] = 1;
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  unsigned int *v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int *v16;
  NSMutableDictionary *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_dataForBundleId;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForBundleId, "objectForKeyedSubscript:", v11);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = (unsigned int *)objc_msgSend(v12, "bytes");
        objc_msgSend(v6, "appendFormat:", CFSTR("\n  %@ (%u): "), v11, *v13);
        v14 = objc_msgSend(v12, "length");
        if ((unint64_t)(v14 - 4) >= 8)
        {
          v15 = (unint64_t)(v14 - 4) >> 3;
          v16 = v13 + 2;
          do
          {
            objc_msgSend(v6, "appendFormat:", CFSTR("%x(%u) "), *(v16 - 1), *v16);
            v16 += 2;
            --v15;
          }
          while (v15);
        }

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "appendString:", CFSTR("\n>"));
  return v6;
}

- (id)serialize
{
  NSMutableDictionary *dataForBundleId;
  void *v5;
  void *v7;
  id v8;
  void *v9;
  id v10;

  dataForBundleId = self->_dataForBundleId;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", dataForBundleId, 200, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3488];
    v8 = v10;
    objc_msgSend(v7, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXRootOfAppData.m"), 226, CFSTR("Archiver error: %@"), v8);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataForBundleId, 0);
}

- (void)initWithSerialized:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Could not load root of app data: %@", (uint8_t *)&v2, 0xCu);
}

@end
