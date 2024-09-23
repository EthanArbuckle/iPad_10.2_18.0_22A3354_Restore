@implementation FCTranslationMap

- (FCTranslationMap)initWithPBTranslationMap:(id)a3 resourceID:(id)a4
{
  id v6;
  id v7;
  FCTranslationMap *v8;
  uint64_t v9;
  NSString *resourceID;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSDictionary *topicTranslationMap;
  NSObject *v16;
  NSDictionary *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *favoriteTranslationMap;
  NSObject *v21;
  NSDictionary *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  objc_super v28;
  uint8_t buf[4];
  NSDictionary *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)FCTranslationMap;
  v8 = -[FCTranslationMap init](&v28, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    resourceID = v8->_resourceID;
    v8->_resourceID = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke;
    v26[3] = &unk_1E463AA78;
    v13 = v6;
    v27 = v13;
    objc_msgSend(v11, "fc_dictionary:", v26);
    v14 = objc_claimAutoreleasedReturnValue();
    topicTranslationMap = v8->_topicTranslationMap;
    v8->_topicTranslationMap = (NSDictionary *)v14;

    v16 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v8->_topicTranslationMap;
      *(_DWORD *)buf = 138412290;
      v30 = v17;
      _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Parsed topic translation map %@", buf, 0xCu);
    }
    v18 = (void *)MEMORY[0x1E0C99D80];
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_7;
    v24[3] = &unk_1E463AA78;
    v25 = v13;
    objc_msgSend(v18, "fc_dictionary:", v24);
    v19 = objc_claimAutoreleasedReturnValue();
    favoriteTranslationMap = v8->_favoriteTranslationMap;
    v8->_favoriteTranslationMap = (NSDictionary *)v19;

    v21 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v8->_favoriteTranslationMap;
      *(_DWORD *)buf = 138412290;
      v30 = v22;
      _os_log_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_DEFAULT, "Parsed favorites translation map %@", buf, 0xCu);
    }

  }
  return v8;
}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topicLanguageBuckets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2;
  v6[3] = &unk_1E4646460;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FCTopicTranslation *v4;
  void *v5;
  FCTopicTranslation *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  FCTopicTranslation *v11;

  v3 = a2;
  v4 = -[FCTopicTranslation initWithLanguageBucket:]([FCTopicTranslation alloc], "initWithLanguageBucket:", v3);
  objc_msgSend(v3, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3;
  v8[3] = &unk_1E4644E20;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Given the same foreign key in 2 buckets: %@"), *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCTranslationMap initWithPBTranslationMap:resourceID:]_block_invoke_3";
    v8 = 2080;
    v9 = "FCTranslationMap.m";
    v10 = 1024;
    v11 = 42;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v3);

}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "favoritesLanguageBuckets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2_8;
  v6[3] = &unk_1E4646460;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_2_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3_9;
  v6[3] = &unk_1E463FD48;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __56__FCTranslationMap_initWithPBTranslationMap_resourceID___block_invoke_3_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Given the same foreign key in 2 buckets: %@"), *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCTranslationMap initWithPBTranslationMap:resourceID:]_block_invoke_3";
    v10 = 2080;
    v11 = "FCTranslationMap.m";
    v12 = 1024;
    v13 = 53;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 40), "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);

}

- (id)topicTranslationForTagID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[FCTranslationMap topicTranslationMap](self, "topicTranslationMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)favoriteTranslationForTagID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[FCTranslationMap favoriteTranslationMap](self, "favoriteTranslationMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
  objc_storeStrong((id *)&self->_resourceID, a3);
}

- (NSDictionary)topicTranslationMap
{
  return self->_topicTranslationMap;
}

- (void)setTopicTranslationMap:(id)a3
{
  objc_storeStrong((id *)&self->_topicTranslationMap, a3);
}

- (NSDictionary)favoriteTranslationMap
{
  return self->_favoriteTranslationMap;
}

- (void)setFavoriteTranslationMap:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteTranslationMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteTranslationMap, 0);
  objc_storeStrong((id *)&self->_topicTranslationMap, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
}

@end
