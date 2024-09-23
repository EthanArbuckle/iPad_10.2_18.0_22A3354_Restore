@implementation FASettingsPresetConfiguration

+ (id)BOOLKeys
{
  if (BOOLKeys_onceToken != -1)
    dispatch_once(&BOOLKeys_onceToken, &__block_literal_global_0);
  return (id)BOOLKeys_keys;
}

void __41__FASettingsPresetConfiguration_BOOLKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("media.settings.allowBookstoreErotica"), CFSTR("system.ratings.allowExplicitContent"), CFSTR("system.music.allowMusicVideos"), CFSTR("system.music.allowMusicArtistActivity"), CFSTR("system.siri.allowAssistantUserGeneratedContent"), CFSTR("system.siri.forceAssistantProfanityFilter"), CFSTR("application.store.allowAppRemoval"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BOOLKeys_keys;
  BOOLKeys_keys = v0;

}

- (FASettingsPresetConfiguration)initWithValues:(id)a3
{
  id v4;
  FASettingsPresetConfiguration *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FASettingsPresetConfiguration;
  v5 = -[FASettingsPresetConfiguration init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v5->_values, v8);

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_values, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDictionary *values;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    values = self->_values;
    objc_msgSend(v4, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary isEqualToDictionary:](values, "isEqualToDictionary:", v6);

  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_values, CFSTR("values"));
}

- (FASettingsPresetConfiguration)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  FASettingsPresetConfiguration *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v6, v9, CFSTR("values"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[FASettingsPresetConfiguration initWithValues:](self, "initWithValues:", v10);
  return v11;
}

- (FASettingsPresetConfiguration)initWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  FASettingsPresetConfiguration *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FASettingsPresetConfiguration initWithDictionary:].cold.1();

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("values"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FASettingsPresetConfiguration validatedValuesFromValues:](self, "validatedValuesFromValues:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    self = -[FASettingsPresetConfiguration initWithValues:](self, "initWithValues:", v7);
    v8 = self;
  }
  else
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FASettingsPresetConfiguration initWithDictionary:].cold.1();
    v8 = 0;
  }

  return v8;
}

- (id)validatedValuesFromValues:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("STCustomRestrictionConfiguration.STCustomRestrictionWebFilterState"), (_QWORD)v16))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[FASettingsPresetConfiguration isValidTriState:](self, "isValidTriState:", v12))
            goto LABEL_11;
        }
        else
        {
          +[FASettingsPresetConfiguration BOOLKeys](FASettingsPresetConfiguration, "BOOLKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v11);

          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14 || -[FASettingsPresetConfiguration isValidBoolValue:](self, "isValidBoolValue:", v12))
LABEL_11:
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isValidTriState:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0
    && (!objc_msgSend(v3, "integerValue")
     || objc_msgSend(v3, "integerValue") == 1
     || objc_msgSend(v3, "integerValue") == 2);

  return v4;
}

- (BOOL)isValidBoolValue:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v3, "integerValue"))
      v4 = objc_msgSend(v3, "integerValue") == 1;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FASettingsPresetConfiguration values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ({\n values: %@\n)}"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

- (void)initWithDictionary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1CAEBA000, v0, v1, "Error decoding %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
