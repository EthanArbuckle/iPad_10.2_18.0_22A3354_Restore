@implementation FASettingsPreset

- (FASettingsPreset)initWithIdentifier:(id)a3 minAge:(int64_t)a4 maxAge:(int64_t)a5 sources:(id)a6
{
  id v10;
  id v11;
  FASettingsPreset *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FASettingsPreset;
  v12 = -[FASettingsPreset init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v12->_minAge = a4;
    v12->_maxAge = a5;
    v15 = objc_msgSend(v11, "copy");
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v12->_sources, v17);

  }
  return v12;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SETTINGS_PRESETS_AGE"), &stru_1E8565C18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, self->_minAge, self->_maxAge);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *identifier;
  void *v7;
  int64_t minAge;
  int64_t maxAge;
  NSArray *sources;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    identifier = self->_identifier;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v7)
      && (minAge = self->_minAge, minAge == objc_msgSend(v5, "minAge"))
      && (maxAge = self->_maxAge, maxAge == objc_msgSend(v5, "maxAge")))
    {
      sources = self->_sources;
      objc_msgSend(v5, "sources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSArray isEqualToArray:](sources, "isEqualToArray:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minAge, CFSTR("minAge"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxAge, CFSTR("maxAge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sources, CFSTR("sources"));

}

- (FASettingsPreset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FASettingsPreset *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minAge"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxAge"));
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("sources"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[FASettingsPreset initWithIdentifier:minAge:maxAge:sources:](self, "initWithIdentifier:minAge:maxAge:sources:", v5, v6, v7, v11);
  return v12;
}

- (FASettingsPreset)initWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FASettingsPreset *v18;
  NSObject *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FASettingsPreset initWithDictionary:].cold.1();

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minAge"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxAge"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _FALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _FALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    goto LABEL_30;
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _FALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      goto LABEL_30;
    }
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _FALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
LABEL_29:
        -[FASettingsPreset initWithDictionary:].cold.1();
LABEL_30:
      v18 = 0;
      goto LABEL_31;
    }
  }
  objc_msgSend(v10, "fa_map:", &__block_literal_global_12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[NSObject count](v13, "count");
  if (v14 != objc_msgSend(v10, "count"))
  {
    _FALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FASettingsPreset initWithDictionary:].cold.1();

    goto LABEL_30;
  }
  v15 = objc_msgSend(v11, "integerValue");
  v16 = objc_msgSend(v12, "integerValue");
  if (v16)
    v17 = v16;
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  self = -[FASettingsPreset initWithIdentifier:minAge:maxAge:sources:](self, "initWithIdentifier:minAge:maxAge:sources:", v6, v15, v17, v13);
  v18 = self;
LABEL_31:

  return v18;
}

FASettingsPresetSource *__39__FASettingsPreset_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FASettingsPresetSource *v3;

  v2 = a2;
  v3 = -[FASettingsPresetSource initWithDictionary:]([FASettingsPresetSource alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)sourceWithIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_sources;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FASettingsPreset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FASettingsPreset displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FASettingsPreset minAge](self, "minAge");
  v8 = -[FASettingsPreset maxAge](self, "maxAge");
  -[FASettingsPreset sources](self, "sources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ({\n identifier: %@\n displayName: %@\n age: %ld - %ld\n sources: %@\n)}"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)minAge
{
  return self->_minAge;
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithDictionary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1CAEBA000, v0, v1, "Error decoding %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
