@implementation FASettingPresetsCache

- (id)_cacheDirectoryURLWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FASettingPresetsCache _cacheDirectoryURLWithError:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FamilyCircle/Presets"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_cacheURLWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[FASettingPresetsCache _cacheDirectoryURLWithError:](self, "_cacheDirectoryURLWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("preset_cache.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cacheQueue
{
  if (cacheQueue_onceToken_0[0] != -1)
    dispatch_once(cacheQueue_onceToken_0, &__block_literal_global_10);
  return (id)cacheQueue_cacheQueue_0;
}

void __35__FASettingPresetsCache_cacheQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("FASettingPresetsCache Queue", v2);
  v1 = (void *)cacheQueue_cacheQueue_0;
  cacheQueue_cacheQueue_0 = (uint64_t)v0;

}

- (id)_fetchData:(id *)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "cacheQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FASettingPresetsCache__fetchData___block_invoke;
  block[3] = &unk_1E8561D00;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__FASettingPresetsCache__fetchData___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v2, "_cacheURLWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 0, a1[6]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else if (v4 && a1[6])
  {
    *(_QWORD *)a1[6] = objc_retainAutorelease(v4);
  }

}

- (id)loadForURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__FASettingPresetsCache_loadForURL___block_invoke;
  v9[3] = &unk_1E8561930;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithBlock:", v9);

  return v7;
}

void __36__FASettingPresetsCache_loadForURL___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD, id);
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v4, "load:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    v7 = v6;
    v3[2](v3, 0, v6);
  }
  else
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    ((void (**)(id, void *, id))v3)[2](v3, v11, v7);

  }
}

- (id)load:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  unint64_t Nanoseconds;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  _FASignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _FASignpostCreate(v5);
  v8 = v7;

  _FASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadFamilyPhotoCache", ", buf, 2u);
  }

  _FASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FASettingPresetsCache load:].cold.2(v6, v11);

  -[FASettingPresetsCache _fetchData:](self, "_fetchData:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  Nanoseconds = _FASignpostGetNanoseconds(v6, v8);
  _FASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v15, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyPhotoCache", ", v18, 2u);
  }

  _FASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[FASettingPresetsCache load:].cold.1(v6, v16, (double)Nanoseconds / 1000000000.0);

  return v12;
}

- (id)_cacheURL
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__FASettingPresetsCache__cacheURL__block_invoke;
  v5[3] = &unk_1E85618E0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithBlock:", v5);
}

void __34__FASettingPresetsCache__cacheURL__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, id);
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = a2;
  objc_msgSend(v2, "_cacheURLWithError:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  v3[2](v3, v4, v5);

}

- (id)_createCacheFile
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;

  -[FASettingPresetsCache _cacheURL](self, "_cacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenOnQueue");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cacheQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v3)[2](v3, v4, &__block_literal_global_23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__FASettingPresetsCache__createCacheFile__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v2 = a2;
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v12);
    v7 = v12;

  }
  if (v7)
    v9 = v7;
  else
    v9 = v2;
  v10 = v9;

  return v10;
}

- (id)updateWithPresets:(id)a3 requestURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke;
  v13[3] = &unk_1E8561D28;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_msgSend(v8, "initWithBlock:", v13);

  return v11;
}

void __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cacheQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke_2;
  v7[3] = &unk_1E8561DE0;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke_2(id *a1)
{
  void *v2;
  uint64_t (**v3)(_QWORD, _QWORD);
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "_createCacheFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "then");
  v3 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke_3;
  v5[3] = &unk_1E85622C0;
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v4 = (id)((uint64_t (**)(_QWORD, _QWORD *))v3)[2](v3, v5);

}

id __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtURL:error:", v3, 0);

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v11);

  }
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  v26 = 0;
  objc_msgSend(v12, "writeToURL:options:error:", v3, 0x40000000, &v26);
  v14 = v26;
  _FALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke_3_cold_1(a1 + 32, v16, v17, v18, v19, v20, v21, v22);
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v29 = v23;
    _os_log_impl(&dword_1CAEBA000, v16, OS_LOG_TYPE_DEFAULT, "Updated presets cache for url %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v24 = v14;

  return v24;
}

- (id)invalidate
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EB0]), "initWithValue:", 0);
  objc_msgSend(v3, "thenOnQueue");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cacheQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__FASettingPresetsCache_invalidate__block_invoke;
  v8[3] = &unk_1E85622E8;
  v8[4] = self;
  ((void (**)(_QWORD, void *, _QWORD *))v4)[2](v4, v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __35__FASettingPresetsCache_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v1, "_cacheDirectoryURLWithError:", &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  if (v3)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "Error finding cache presets directory %@", buf, 0xCu);
    }

    v5 = v3;
  }
  else
  {
    v5 = 0;
    if (objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0))
    {
      _FALogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "presets cache cleared", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      objc_msgSend(v7, "removeItemAtURL:error:", v2, &v9);
      v5 = v9;

    }
  }

  return v5;
}

- (void)_cacheDirectoryURLWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, a2, a3, "Call to fetch URL for presets cache provided error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

- (void)load:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:LoadFamilyPhotoCache ", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

- (void)load:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: LoadFamilyPhotoCache ", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

void __54__FASettingPresetsCache_updateWithPresets_requestURL___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, a2, a3, "Error updating presets cache for url %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

@end
