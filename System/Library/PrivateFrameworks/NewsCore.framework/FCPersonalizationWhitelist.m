@implementation FCPersonalizationWhitelist

void __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "defaultTags");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = MEMORY[0x1E0C9AA60];
  if (v4)
    v7 = v4;
  else
    v7 = MEMORY[0x1E0C9AA60];
  +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:](FCPersonalizationMappingUtilities, "scoredTagsDictionaryFromScoredTags:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("defaultTags"));

  objc_msgSend(*(id *)(a1 + 32), "optionalTags");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = v6;
  +[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:](FCPersonalizationMappingUtilities, "scoredTagsDictionaryFromScoredTags:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("optionalTags"));

  if (NFInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringForKey:", CFSTR("personalization_whitelist_additions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
    {
      v15 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v15, "JSONObjectWithData:options:error:", v16, 4, &v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v27;

      if (v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "error");
        *(_DWORD *)buf = 136315906;
        v29 = "-[FCPersonalizationWhitelist initWithPBPersonalizationWhitelist:]_block_invoke";
        v30 = 2080;
        v31 = "FCPersonalizationWhitelist.m";
        v32 = 1024;
        v33 = 73;
        v34 = 2114;
        v35 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v19 = (void *)MEMORY[0x1E0C99D80];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke_13;
      v24[3] = &unk_1E463B8D0;
      v20 = v3;
      v25 = v20;
      v26 = v17;
      v21 = v17;
      objc_msgSend(v19, "fc_dictionary:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("optionalTags"));

    }
  }

}

- (NSDictionary)optionalTags
{
  return (NSDictionary *)-[NSDictionary objectForKeyedSubscript:](self->_whitelist, "objectForKeyedSubscript:", CFSTR("optionalTags"));
}

- (NSDictionary)defaultTags
{
  return (NSDictionary *)-[NSDictionary objectForKeyedSubscript:](self->_whitelist, "objectForKeyedSubscript:", CFSTR("defaultTags"));
}

- (FCPersonalizationWhitelist)initWithPBPersonalizationWhitelist:(id)a3
{
  id v5;
  FCPersonalizationWhitelist *v6;
  FCPersonalizationWhitelist *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSDictionary *whitelist;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *portraitDisabledTagIDs;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCPersonalizationWhitelist;
  v6 = -[FCPersonalizationWhitelist init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbWhitelist, a3);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke;
    v17[3] = &unk_1E463AA78;
    v9 = v5;
    v18 = v9;
    objc_msgSend(v8, "fc_dictionary:", v17);
    v10 = objc_claimAutoreleasedReturnValue();
    whitelist = v7->_whitelist;
    v7->_whitelist = (NSDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "disabledPortraitTags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    portraitDisabledTagIDs = v7->_portraitDisabledTagIDs;
    v7->_portraitDisabledTagIDs = (NSSet *)v14;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_portraitDisabledTagIDs, 0);
  objc_storeStrong((id *)&self->_pbWhitelist, 0);
}

void __65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("optionalTags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryWithKeys:valueBlock:", *(_QWORD *)(a1 + 40), &__block_literal_global_56);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

}

void *__65__FCPersonalizationWhitelist_initWithPBPersonalizationWhitelist___block_invoke_2()
{
  return &unk_1E470A910;
}

- (FCPersonalizationWhitelist)init
{
  return -[FCPersonalizationWhitelist initWithPBPersonalizationWhitelist:](self, "initWithPBPersonalizationWhitelist:", 0);
}

- (unint64_t)count
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[FCPersonalizationWhitelist defaultTags](self, "defaultTags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[FCPersonalizationWhitelist optionalTags](self, "optionalTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationWhitelist)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FCPersonalizationWhitelist *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("whiteList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FCPersonalizationWhitelist initWithPBPersonalizationWhitelist:](self, "initWithPBPersonalizationWhitelist:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NTPBPersonalizationWhitelist *pbWhitelist;

  pbWhitelist = self->_pbWhitelist;
  if (pbWhitelist)
    objc_msgSend(a3, "encodeObject:forKey:", pbWhitelist, CFSTR("whiteList"));
}

- (id)jsonEncodableObject
{
  void *v2;
  void *v3;

  -[FCPersonalizationWhitelist whitelist](self, "whitelist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_jsonEncodableDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)portraitDisabledTagIDs
{
  return self->_portraitDisabledTagIDs;
}

- (void)setPortraitDisabledTagIDs:(id)a3
{
  objc_storeStrong((id *)&self->_portraitDisabledTagIDs, a3);
}

- (NSDictionary)whitelist
{
  return self->_whitelist;
}

- (void)setWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_whitelist, a3);
}

@end
