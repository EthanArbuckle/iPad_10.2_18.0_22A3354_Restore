@implementation AXSSPunctuationGroup

- (AXSSPunctuationGroup)init
{
  AXSSPunctuationGroup *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSSPunctuationGroup;
  v2 = -[AXSSPunctuationGroup init](&v5, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setUuid:](v2, "setUuid:", v3);

  -[AXSSPunctuationGroup setBasePunctuationUUID:](v2, "setBasePunctuationUUID:", AXSSVoiceOverPunctuationGroupSome);
  -[AXSSPunctuationGroup setInDatabase:](v2, "setInDatabase:", 0);
  -[AXSSPunctuationGroup setVersion:](v2, "setVersion:", 1);
  return v2;
}

+ (id)punctuationGroupFromJSONRepresentation:(id)a3
{
  void *v3;
  id v4;
  AXSSPunctuationGroup *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 1, &v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v22;
  if (v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    AXLogPunctuationStorage();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[AXSSPunctuationGroup punctuationGroupFromJSONRepresentation:].cold.1((uint64_t)v4, (uint64_t)v3, v8);
    v5 = 0;
  }
  else
  {
    v5 = -[AXSSPunctuationGroup init]([AXSSPunctuationGroup alloc], "init");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSPunctuationGroup setName:](v5, "setName:", v7);

    }
    else
    {
      -[AXSSPunctuationGroup setName:](v5, "setName:", &stru_1E5F9A110);
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSPunctuationGroup setVersion:](v5, "setVersion:", (unsigned __int16)objc_msgSend(v11, "intValue"));

    }
    else
    {
      -[AXSSPunctuationGroup setVersion:](v5, "setVersion:", 1);
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uuid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uuid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
      -[AXSSPunctuationGroup setUuid:](v5, "setUuid:", v15);

    }
    else
    {
      -[AXSSPunctuationGroup setUuid:](v5, "setUuid:", 0);
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("basePunctuationUUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("basePunctuationUUID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);
      -[AXSSPunctuationGroup setBasePunctuationUUID:](v5, "setBasePunctuationUUID:", v19);

    }
    else
    {
      -[AXSSPunctuationGroup setBasePunctuationUUID:](v5, "setBasePunctuationUUID:", 0);
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entries"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entries"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ax_mappedArrayUsingBlock:", &__block_literal_global_8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSPunctuationGroup setEntries:](v5, "setEntries:", v21);

    }
    else
    {
      -[AXSSPunctuationGroup setEntries:](v5, "setEntries:", 0);
    }
  }

  return v5;
}

id __63__AXSSPunctuationGroup_punctuationGroupFromJSONRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  +[AXSSPunctuationEntry punctuationEntryFromJSONDictionary:](AXSSPunctuationEntry, "punctuationEntryFromJSONDictionary:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)objc_opt_new();
  return v2;
}

- (void)setCkRecordProcessDate:(id)a3
{
  objc_storeStrong((id *)&self->_ckRecordProcessDate, a3);
}

- (NSDictionary)jsonDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("name");
  -[AXSSPunctuationGroup name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("basePunctuationUUID");
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mostBasePunctuationGroupForGroup:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E5F9A110;
  v22[1] = v7;
  v21[2] = CFSTR("uuid");
  -[AXSSPunctuationGroup uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E5F9A110;
  v22[2] = v11;
  v21[3] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[AXSSPunctuationGroup version](self, "version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v12;
  v21[4] = CFSTR("entries");
  -[AXSSPunctuationGroup entries](self, "entries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ax_mappedArrayUsingBlock:", &__block_literal_global_21);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = MEMORY[0x1E0C9AA60];
  if (v14)
    v16 = v14;
  v22[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  return (NSDictionary *)v18;
}

uint64_t __38__AXSSPunctuationGroup_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonDictionary");
}

- (NSString)name
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSString *v12;

  -[AXSSPunctuationGroup uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", AXSSVoiceOverPunctuationGroupNone);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("PUNCTUATION_GROUP_NONE");
  }
  else
  {
    -[AXSSPunctuationGroup uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", AXSSVoiceOverPunctuationGroupSome);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PUNCTUATION_GROUP_SOME");
    }
    else
    {
      -[AXSSPunctuationGroup uuid](self, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", AXSSVoiceOverPunctuationGroupAll);

      if (!v11)
      {
        v12 = self->_name;
        return v12;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PUNCTUATION_GROUP_ALL");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSData)jsonRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[AXSSPunctuationGroup jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    AXLogPunctuationStorage();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXSSPunctuationGroup jsonRepresentation].cold.1((uint64_t)v5, v6);

  }
  return (NSData *)v4;
}

- (BOOL)isSystemPunctuationGroup
{
  void *v3;
  void *v4;
  char v5;

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isBasePunctuationGroup:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)AXSSPunctuationGroup;
  -[AXSSPunctuationGroup description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXSSPunctuationGroup inCloud](self, "inCloud");
  -[AXSSPunctuationGroup ckChangeTag](self, "ckChangeTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup autoSwitchContexts](self, "autoSwitchContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup entries](self, "entries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%d/%@]: name: %@, contexts: %@, entries: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationGroup uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (NSSet)autoSwitchContexts
{
  return self->_autoSwitchContexts;
}

- (void)setAutoSwitchContexts:(id)a3
{
  objc_storeStrong((id *)&self->_autoSwitchContexts, a3);
}

- (NSUUID)basePunctuationUUID
{
  return self->_basePunctuationUUID;
}

- (void)setBasePunctuationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_basePunctuationUUID, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (BOOL)inCloud
{
  return self->_inCloud;
}

- (void)setInCloud:(BOOL)a3
{
  self->_inCloud = a3;
}

- (NSString)ckChangeTag
{
  return self->_ckChangeTag;
}

- (void)setCkChangeTag:(id)a3
{
  objc_storeStrong((id *)&self->_ckChangeTag, a3);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
}

- (NSDate)ckRecordProcessDate
{
  return self->_ckRecordProcessDate;
}

- (BOOL)inDatabase
{
  return self->_inDatabase;
}

- (void)setInDatabase:(BOOL)a3
{
  self->_inDatabase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordProcessDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_ckChangeTag, 0);
  objc_storeStrong((id *)&self->_basePunctuationUUID, 0);
  objc_storeStrong((id *)&self->_autoSwitchContexts, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (void)punctuationGroupFromJSONRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AF5CC000, log, OS_LOG_TYPE_ERROR, "Could not json: %@ %@", (uint8_t *)&v3, 0x16u);
}

- (void)jsonRepresentation
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_ERROR, "Could not json: %@", (uint8_t *)&v2, 0xCu);
}

@end
