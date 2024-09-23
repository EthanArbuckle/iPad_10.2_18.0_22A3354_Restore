@implementation AXSSPunctuationEntry

- (AXSSPunctuationEntry)init
{
  AXSSPunctuationEntry *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSSPunctuationEntry;
  v2 = -[AXSSPunctuationEntry init](&v5, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setUuid:](v2, "setUuid:", v3);

  -[AXSSPunctuationEntry setRule:](v2, "setRule:", 1);
  -[AXSSPunctuationEntry setVersion:](v2, "setVersion:", 1);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXSSPunctuationEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = -[AXSSPunctuationEntry init](+[AXSSPunctuationEntry allocWithZone:](AXSSPunctuationEntry, "allocWithZone:", a3), "init");
  -[AXSSPunctuationEntry setRule:](v4, "setRule:", -[AXSSPunctuationEntry rule](self, "rule"));
  -[AXSSPunctuationEntry punctuation](self, "punctuation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setPunctuation:](v4, "setPunctuation:", v5);

  -[AXSSPunctuationEntry replacement](self, "replacement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setReplacement:](v4, "setReplacement:", v6);

  -[AXSSPunctuationEntry uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setUuid:](v4, "setUuid:", v7);

  -[AXSSPunctuationEntry groupUUID](self, "groupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setGroupUUID:](v4, "setGroupUUID:", v8);

  -[AXSSPunctuationEntry setVersion:](v4, "setVersion:", -[AXSSPunctuationEntry version](self, "version"));
  -[AXSSPunctuationEntry setInCloud:](v4, "setInCloud:", -[AXSSPunctuationEntry inCloud](self, "inCloud"));
  -[AXSSPunctuationEntry ckChangeTag](self, "ckChangeTag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setCkChangeTag:](v4, "setCkChangeTag:", v9);

  -[AXSSPunctuationEntry lastModifiedDate](self, "lastModifiedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setLastModifiedDate:](v4, "setLastModifiedDate:", v10);

  -[AXSSPunctuationEntry ckRecordProcessDate](self, "ckRecordProcessDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry setCkRecordProcessDate:](v4, "setCkRecordProcessDate:", v11);

  return v4;
}

+ (id)punctuationEntryFromJSONDictionary:(id)a3
{
  id v3;
  AXSSPunctuationEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = -[AXSSPunctuationEntry init]([AXSSPunctuationEntry alloc], "init");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rule"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rule"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setRule:](v4, "setRule:", objc_msgSend(v6, "stringToRule:", v7));

  }
  else
  {
    -[AXSSPunctuationEntry setRule:](v4, "setRule:", -[AXSSPunctuationEntry rule](v4, "rule"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("punctuation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("punctuation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setPunctuation:](v4, "setPunctuation:", v9);

  }
  else
  {
    -[AXSSPunctuationEntry setPunctuation:](v4, "setPunctuation:", 0);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("replacement"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("replacement"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setReplacement:](v4, "setReplacement:", v11);

  }
  else
  {
    -[AXSSPunctuationEntry setReplacement:](v4, "setReplacement:", 0);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setVersion:](v4, "setVersion:", (unsigned __int16)objc_msgSend(v13, "intValue"));

  }
  else
  {
    -[AXSSPunctuationEntry setVersion:](v4, "setVersion:", 1);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupUUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupUUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithUUIDString:", v16);
    -[AXSSPunctuationEntry setGroupUUID:](v4, "setGroupUUID:", v17);

  }
  else
  {
    -[AXSSPunctuationEntry setGroupUUID:](v4, "setGroupUUID:", 0);
  }

  return v4;
}

+ (id)punctuationEntryFromJSONRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    AXLogPunctuationStorage();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[AXSSPunctuationGroup punctuationGroupFromJSONRepresentation:].cold.1((uint64_t)v5, (uint64_t)v4, v7);

    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "punctuationEntryFromJSONDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_groupUUID, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setCkRecordProcessDate:(id)a3
{
  objc_storeStrong((id *)&self->_ckRecordProcessDate, a3);
}

- (NSDictionary)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("rule");
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ruleToString:", -[AXSSPunctuationEntry rule](self, "rule"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[AXSSPunctuationEntry punctuation](self, "punctuation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXSSPunctuationEntry punctuation](self, "punctuation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("punctuation"));

  }
  -[AXSSPunctuationEntry replacement](self, "replacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AXSSPunctuationEntry replacement](self, "replacement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("replacement"));

  }
  -[AXSSPunctuationEntry groupUUID](self, "groupUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AXSSPunctuationEntry groupUUID](self, "groupUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("groupUUID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[AXSSPunctuationEntry version](self, "version"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("version"));

  return (NSDictionary *)v6;
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
  -[AXSSPunctuationEntry jsonDictionary](self, "jsonDictionary");
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

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  int64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)AXSSPunctuationEntry;
  -[AXSSPunctuationEntry description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXSSPunctuationEntry version](self, "version");
  -[AXSSPunctuationEntry punctuation](self, "punctuation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry replacement](self, "replacement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXSSPunctuationEntry rule](self, "rule");
  v9 = -[AXSSPunctuationEntry inCloud](self, "inCloud");
  -[AXSSPunctuationEntry ckChangeTag](self, "ckChangeTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationEntry groupUUID](self, "groupUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[v%d]: punctuation: %@, replacement: %@, rule: %d (In Cloud: %d: %@), uuid: %@  group uuid: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
    -[AXSSPunctuationEntry uuid](self, "uuid");
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

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (NSString)punctuation
{
  return self->_punctuation;
}

- (void)setPunctuation:(id)a3
{
  objc_storeStrong((id *)&self->_punctuation, a3);
}

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
  objc_storeStrong((id *)&self->_replacement, a3);
}

- (int64_t)rule
{
  return self->_rule;
}

- (void)setRule:(int64_t)a3
{
  self->_rule = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordProcessDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_ckChangeTag, 0);
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_punctuation, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
