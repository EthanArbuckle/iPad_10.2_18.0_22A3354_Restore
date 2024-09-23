@implementation FCPersonalizationURLDomainMapping

- (FCPersonalizationURLDomainMapping)initWithPBURLMappingDomain:(id)a3
{
  id v4;
  FCPersonalizationURLDomainMapping *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *paths;
  void *v12;
  _QWORD v13[4];
  id v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCPersonalizationURLDomainMapping;
  v5 = -[FCPersonalizationURLDomainMapping init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "averageSafariVisitsPerDay");
    v5->_averageSafariVisitsPerDay = v6;
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "domain.domain");
      *(_DWORD *)buf = 136315906;
      v17 = "-[FCPersonalizationURLDomainMapping initWithPBURLMappingDomain:]";
      v18 = 2080;
      v19 = "FCPersonalizationURLMapping.m";
      v20 = 1024;
      v21 = 152;
      v22 = 2114;
      v23 = v12;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v8 = (void *)MEMORY[0x1E0C99D80];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke;
    v13[3] = &unk_1E463AA78;
    v14 = v4;
    objc_msgSend(v8, "fc_dictionary:", v13);
    v9 = objc_claimAutoreleasedReturnValue();
    paths = v5->_paths;
    v5->_paths = (NSDictionary *)v9;

  }
  return v5;
}

void __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "path.path");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCPersonalizationURLDomainMapping initWithPBURLMappingDomain:]_block_invoke_2";
    v18 = 2080;
    v19 = "FCPersonalizationURLMapping.m";
    v20 = 1024;
    v21 = 162;
    v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_50;
  v13[3] = &unk_1E4645838;
  v6 = v3;
  v14 = v6;
  v15 = *(id *)(a1 + 32);
  __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_50((uint64_t)v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2_51;
    v11[3] = &unk_1E463AA78;
    v12 = v6;
    objc_msgSend(v8, "fc_dictionary:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);

  }
}

void __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2;
  v8[3] = &unk_1E4645860;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

id __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_50(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 >= 2)
  {
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

void __64__FCPersonalizationURLDomainMapping_initWithPBURLMappingDomain___block_invoke_2_51(uint64_t a1, void *a2)
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

- (id)tagsForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCPersonalizationURLDomainMapping paths](self, "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)averageSafariVisitsPerDay
{
  return self->_averageSafariVisitsPerDay;
}

- (void)setAverageSafariVisitsPerDay:(double)a3
{
  self->_averageSafariVisitsPerDay = a3;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
