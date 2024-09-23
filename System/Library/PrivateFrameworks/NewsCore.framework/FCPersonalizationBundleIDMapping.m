@implementation FCPersonalizationBundleIDMapping

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "bundleID.bundleId");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:]_block_invoke_2";
    v15 = 2080;
    v16 = "FCPersonalizationBundleIDMapping.m";
    v17 = 1024;
    v18 = 76;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99D80];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_17;
  v11[3] = &unk_1E463AA78;
  v12 = v3;
  v6 = v3;
  objc_msgSend(v5, "fc_dictionary:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bundleIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_2;
  v17[3] = &unk_1E4644DB8;
  v6 = v3;
  v18 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);

  if (NFInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForKey:", CFSTR("personalization_bundle_id_mapping_additions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v9, "JSONObjectWithData:options:error:", v10, 4, &v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;

      if (v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "error");
        *(_DWORD *)buf = 136315906;
        v20 = "-[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:]_block_invoke_2";
        v21 = 2080;
        v22 = "FCPersonalizationBundleIDMapping.m";
        v23 = 1024;
        v24 = 120;
        v25 = 2114;
        v26 = v13;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_26;
      v14[3] = &unk_1E463E1E0;
      v15 = v6;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

    }
  }

}

- (FCPersonalizationBundleIDMapping)initWithPBBundleIDMapping:(id)a3
{
  id v5;
  FCPersonalizationBundleIDMapping *v6;
  FCPersonalizationBundleIDMapping *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *bundleIDMapping;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationBundleIDMapping;
  v6 = -[FCPersonalizationBundleIDMapping init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbBundleIDMapping, a3);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke;
    v12[3] = &unk_1E463AA78;
    v13 = v5;
    objc_msgSend(v8, "fc_dictionary:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIDMapping = v7->_bundleIDMapping;
    v7->_bundleIDMapping = (NSDictionary *)v9;

  }
  return v7;
}

+ (id)decendingSpecificityBundleIDsForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D20];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke;
  v14 = &unk_1E463EFB0;
  v15 = v4;
  v16 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "fc_array:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_arrayByReversingObjects", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke_2;
  v6[3] = &unk_1E4644D90;
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v6);

}

void __77__FCPersonalizationBundleIDMapping_decendingSpecificityBundleIDsForBundleID___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "fc_subarrayUpToIndex:inclusive:", a3, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 48));
  }
}

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "channelTags");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = MEMORY[0x1E0C9AA60];
  if (v5)
    v8 = v5;
  else
    v8 = MEMORY[0x1E0C9AA60];
  +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:](FCPersonalizationMappingUtilities, "scoredTagsDictionaryFromScoredTags:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("channels"));

  objc_msgSend(*(id *)(a1 + 32), "topicTags");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = v7;
  +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:](FCPersonalizationMappingUtilities, "scoredTagsDictionaryFromScoredTags:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("topics"));

  objc_msgSend(*(id *)(a1 + 32), "sectionTags");
  v14 = objc_claimAutoreleasedReturnValue();
  v17 = (id)v14;
  if (v14)
    v15 = v14;
  else
    v15 = v7;
  +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:](FCPersonalizationMappingUtilities, "scoredTagsDictionaryFromScoredTags:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("sections"));

}

void __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "bundleIDsDict[extraBundleID]");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:]_block_invoke";
    v13 = 2080;
    v14 = "FCPersonalizationBundleIDMapping.m";
    v15 = 1024;
    v16 = 128;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v5, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_92);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);

}

uint64_t __62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryWithKeys:valueBlock:", a2, &__block_literal_global_32_0);
}

void *__62__FCPersonalizationBundleIDMapping_initWithPBBundleIDMapping___block_invoke_2_30()
{
  return &unk_1E470AB50;
}

- (FCPersonalizationBundleIDMapping)init
{
  return -[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:](self, "initWithPBBundleIDMapping:", 0);
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[FCPersonalizationBundleIDMapping bundleIDMapping](self, "bundleIDMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)tagScoresForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke;
  v9[3] = &unk_1E463B8D0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "fc_dictionary:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "decendingSpecificityBundleIDsForBundleID:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_2;
  v9[3] = &unk_1E4644E20;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  if (!objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v7 = FCProgressivePersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v13 = v8;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEBUG, "Failed to find mapping for bundle ID %@ with decending IDs %@", buf, 0x16u);
      }
    }
  }

}

void __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleIDMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIDMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_3;
    v9[3] = &unk_1E463E1E0;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

    v6 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEBUG, "BundleID %@ Mapped to %@", buf, 0x16u);
    }

  }
}

void __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "fc_dictionaryByMergingDictionary:withValueCombiner:", a3, &__block_literal_global_36_1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

}

uint64_t __57__FCPersonalizationBundleIDMapping_tagScoresForBundleID___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  return objc_msgSend(v4, "numberWithDouble:", v7 + v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationBundleIDMapping)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FCPersonalizationBundleIDMapping *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIDMapping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FCPersonalizationBundleIDMapping initWithPBBundleIDMapping:](self, "initWithPBBundleIDMapping:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NTPBBundleIDMapping *pbBundleIDMapping;

  pbBundleIDMapping = self->_pbBundleIDMapping;
  if (pbBundleIDMapping)
    objc_msgSend(a3, "encodeObject:forKey:", pbBundleIDMapping, CFSTR("bundleIDMapping"));
}

- (id)jsonEncodableObject
{
  void *v2;
  void *v3;

  -[FCPersonalizationBundleIDMapping bundleIDMapping](self, "bundleIDMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_jsonEncodableDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)bundleIDMapping
{
  return self->_bundleIDMapping;
}

- (void)setBundleIDMapping:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDMapping, 0);
  objc_storeStrong((id *)&self->_pbBundleIDMapping, 0);
}

@end
