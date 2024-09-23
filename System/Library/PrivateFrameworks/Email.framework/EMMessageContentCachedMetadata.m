@implementation EMMessageContentCachedMetadata

- (EMMessageContentCachedMetadata)initWithDelegate:(id)a3
{
  id v4;
  EMMessageContentCachedMetadata *v5;
  EMMessageContentCachedMetadata *v6;
  uint64_t v7;
  NSMutableDictionary *localCache;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMMessageContentCachedMetadata;
  v5 = -[EMMessageContentCachedMetadata init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    localCache = v6->_localCache;
    v6->_localCache = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (BOOL)showRemoteImages
{
  return -[EMMessageContentCachedMetadata _BOOLValueForKeyPath:]((uint64_t)self, CFSTR("ShowRemoteImages"));
}

- (uint64_t)_BOOLValueForKeyPath:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[EMMessageContentCachedMetadata cachedValueForKeyPath:](a1, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v6, v3);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setShowRemoteImages:(BOOL)a3
{
  -[EMMessageContentCachedMetadata _setBoolValue:forKeyPath:]((uint64_t)self, a3, CFSTR("ShowRemoteImages"));
}

- (void)_setBoolValue:(void *)a3 forKeyPath:
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "contentMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCachedMetadata:forKey:", v5, v8);

    objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v5, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

- (BOOL)skipMessageReformatting
{
  return -[EMMessageContentCachedMetadata _BOOLValueForKeyPath:]((uint64_t)self, CFSTR("SkipMessageReformat"));
}

- (void)setSkipMessageReformatting:(BOOL)a3
{
  -[EMMessageContentCachedMetadata _setBoolValue:forKeyPath:]((uint64_t)self, a3, CFSTR("SkipMessageReformat"));
}

- (id)cachedValueForKeyPath:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id WeakRetained;
  void *v23;

  v3 = a2;
  if (a1)
  {
    EMLogCategoryMessageLoading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[EMMessageContentCachedMetadata cachedValueForKeyPath:].cold.3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    -[EMMessageContentCachedMetadata _cachedMetadataJSONFromResult](a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      EMLogCategoryMessageLoading();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[EMMessageContentCachedMetadata cachedValueForKeyPath:].cold.2((uint64_t)v3, v12, v13, v14, v15, v16, v17, v18);

      -[EMMessageContentCachedMetadata _cachedValueForKeyPath:fromJSONData:]((_BYTE *)a1, v3, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      EMLogCategoryMessageLoading();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[EMMessageContentCachedMetadata cachedValueForKeyPath:].cold.1((uint64_t)v3, v20, v21);

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      objc_msgSend(WeakRetained, "contentMessage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cachedMetadataOfClass:forKey:", objc_opt_class(), v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_cachedMetadataJSONFromResult
{
  id WeakRetained;
  void *v2;
  void *v3;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "contentRepresentation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cachedMetadataJSON");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_BYTE)_cachedValueForKeyPath:(void *)a3 fromJSONData:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (objc_msgSend(v6, "length"))
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 24, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (v8)
      {
        -[EMMessageContentCachedMetadata _cachedValueForKeyPath:fromDictionary:]((uint64_t)a1, v5, v8);
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!a1[12])
        {
          a1[12] = 1;
          EMLogCategoryMessageLoading();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "ef_publicDescription");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[EMMessageContentCachedMetadata _cachedValueForKeyPath:fromJSONData:].cold.1(v11, (uint64_t)v14, v10);
          }

        }
        a1 = 0;
      }

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_cachedValueForKeyPath:(void *)a3 fromDictionary:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a2;
  v6 = a3;
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__6;
    v18[4] = __Block_byref_object_dispose__6;
    v19 = (id)0xAAAAAAAAAAAAAAAALL;
    v19 = v6;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__6;
    v16 = __Block_byref_object_dispose__6;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__EMMessageContentCachedMetadata__cachedValueForKeyPath_fromDictionary___block_invoke;
    v11[3] = &unk_1E70F3EB0;
    v11[4] = &v12;
    v11[5] = v18;
    v11[6] = v8;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
    v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(v18, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __72__EMMessageContentCachedMetadata__cachedValueForKeyPath_fromDictionary___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v11 = v5;
  if (a3 + 1 == a1[6])
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)cachedValueForKeyPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a2, a3, "Using EMMessage fallback for cached metadata value for key %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)cachedValueForKeyPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B99BB000, a2, a3, "Got cached metadata value for key %{public}@ from EMContentRepresentation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cachedValueForKeyPath:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B99BB000, a2, a3, "Getting cached metadata value for key %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_cachedValueForKeyPath:(NSObject *)a3 fromJSONData:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1B99BB000, a3, (uint64_t)a3, "Failed to parse cached metadata JSON: %{public}@", (uint8_t *)a2);

}

@end
