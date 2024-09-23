@implementation FCPersonalizationURLMapping

void __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  FCPersonalizationURLDomainMapping *v6;

  v3 = a2;
  v6 = -[FCPersonalizationURLDomainMapping initWithPBURLMappingDomain:]([FCPersonalizationURLDomainMapping alloc], "initWithPBURLMappingDomain:", v3);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

void __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "domains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke_2;
  v6[3] = &unk_1E46458A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

- (FCPersonalizationURLMapping)initWithPBURLMapping:(id)a3
{
  id v5;
  FCPersonalizationURLMapping *v6;
  FCPersonalizationURLMapping *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *urlMappingByDomain;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationURLMapping;
  v6 = -[FCPersonalizationURLMapping init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbURLMapping, a3);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__FCPersonalizationURLMapping_initWithPBURLMapping___block_invoke;
    v12[3] = &unk_1E463AA78;
    v13 = v5;
    objc_msgSend(v8, "fc_dictionary:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    urlMappingByDomain = v7->_urlMappingByDomain;
    v7->_urlMappingByDomain = (NSDictionary *)v9;

  }
  return v7;
}

- (FCPersonalizationURLMapping)init
{
  return -[FCPersonalizationURLMapping initWithPBURLMapping:](self, "initWithPBURLMapping:", 0);
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[FCPersonalizationURLMapping urlMappingByDomain](self, "urlMappingByDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (id)domainForURL:(id)a3
{
  id v3;
  FCPersonalizationDecomposedURL *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCPersonalizationDecomposedURL initWithURLString:]([FCPersonalizationDecomposedURL alloc], "initWithURLString:", v3);

  -[FCPersonalizationDecomposedURL domain](v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tagScoresForURL:(id)a3
{
  id v4;
  FCPersonalizationDecomposedURL *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  _BYTE *v25;
  _BYTE *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[24];
  __int128 v34;
  id v35;
  _BYTE v36[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[FCPersonalizationDecomposedURL initWithURLString:]([FCPersonalizationDecomposedURL alloc], "initWithURLString:", v4);
  -[FCPersonalizationURLMapping urlMappingByDomain](self, "urlMappingByDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersonalizationDecomposedURL domain](v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_QWORD *)v36 = 0;
    *(_QWORD *)&v36[8] = v36;
    *(_QWORD *)&v36[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__44;
    v38 = __Block_byref_object_dispose__44;
    objc_msgSend(v8, "tagsForPath:", CFSTR("/"));
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (!*(_QWORD *)(*(_QWORD *)&v36[8] + 40))
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("There should be path tags for the default path"));
        *(_DWORD *)v33 = 136315906;
        *(_QWORD *)&v33[4] = "-[FCPersonalizationURLMapping tagScoresForURL:]";
        *(_WORD *)&v33[12] = 2080;
        *(_QWORD *)&v33[14] = "FCPersonalizationURLMapping.m";
        *(_WORD *)&v33[22] = 1024;
        LODWORD(v34) = 277;
        WORD2(v34) = 2114;
        *(_QWORD *)((char *)&v34 + 6) = v21;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v33, 0x26u);

      }
    }
    *(_QWORD *)v33 = 0;
    *(_QWORD *)&v33[8] = v33;
    *(_QWORD *)&v33[16] = 0x3032000000;
    *(_QWORD *)&v34 = __Block_byref_object_copy__44;
    *((_QWORD *)&v34 + 1) = __Block_byref_object_dispose__44;
    v35 = 0;
    -[FCPersonalizationDecomposedURL paths](v5, "paths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke;
    v23[3] = &unk_1E463CE88;
    v24 = v8;
    v25 = v36;
    v26 = v33;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v23);

    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_2;
    v22[3] = &unk_1E4644B00;
    v22[4] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_QWORD *)(*(_QWORD *)&v33[8] + 40);
      *(_DWORD *)buf = 138412802;
      v28 = v4;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEBUG, "URL String %@ with matching path %@ mapped to %@", buf, 0x20u);
    }

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v36, 8);

  }
  else
  {
    v16 = (void *)FCProgressivePersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v17 = v16;
      -[FCPersonalizationDecomposedURL domain](v5, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPersonalizationDecomposedURL paths](v5, "paths");
      v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138412802;
      *(_QWORD *)&v36[4] = v4;
      *(_WORD *)&v36[12] = 2112;
      *(_QWORD *)&v36[14] = v18;
      *(_WORD *)&v36[22] = 2112;
      v37 = v19;
      _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEBUG, "Failed to find mapping for URL String %@ with domain %@ and paths %@", v36, 0x20u);

    }
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tagsForPath:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "tagsForPath:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_3;
  v6[3] = &unk_1E463E1E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_4;
  v4[3] = &unk_1E46458D0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __47__FCPersonalizationURLMapping_tagScoresForURL___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Already have a score for tag %@"), v5);
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCPersonalizationURLMapping tagScoresForURL:]_block_invoke_4";
    v11 = 2080;
    v12 = "FCPersonalizationURLMapping.m";
    v13 = 1024;
    v14 = 293;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)popularityForURL:(id)a3
{
  id v4;
  FCPersonalizationDecomposedURL *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[FCPersonalizationDecomposedURL initWithURLString:]([FCPersonalizationDecomposedURL alloc], "initWithURLString:", v4);

  -[FCPersonalizationURLMapping urlMappingByDomain](self, "urlMappingByDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersonalizationDecomposedURL domain](v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[FCPersonalizationURLMapping urlMappingByDomain](self, "urlMappingByDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPersonalizationDecomposedURL domain](v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "averageSafariVisitsPerDay");
    objc_msgSend(v9, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationURLMapping)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FCPersonalizationURLMapping *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlMapping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FCPersonalizationURLMapping initWithPBURLMapping:](self, "initWithPBURLMapping:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NTPBURLMapping *pbURLMapping;

  pbURLMapping = self->_pbURLMapping;
  if (pbURLMapping)
    objc_msgSend(a3, "encodeObject:forKey:", pbURLMapping, CFSTR("urlMapping"));
}

- (id)jsonEncodableObject
{
  void *v2;
  void *v3;

  -[FCPersonalizationURLMapping urlMappingByDomain](self, "urlMappingByDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", &__block_literal_global_85_0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __50__FCPersonalizationURLMapping_jsonEncodableObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)urlMappingByDomain
{
  return self->_urlMappingByDomain;
}

- (void)setUrlMappingByDomain:(id)a3
{
  objc_storeStrong((id *)&self->_urlMappingByDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlMappingByDomain, 0);
  objc_storeStrong((id *)&self->_pbURLMapping, 0);
}

@end
