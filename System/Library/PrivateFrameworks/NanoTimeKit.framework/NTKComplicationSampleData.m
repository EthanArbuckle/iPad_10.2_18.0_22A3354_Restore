@implementation NTKComplicationSampleData

- (NTKComplicationSampleData)initWithSupportedFamilies:(id)a3
{
  id v4;
  NTKComplicationSampleData *v5;
  uint64_t v6;
  NSMutableDictionary *familyToTemplate;
  uint64_t v8;
  NSMutableDictionary *familyToTemplatePath;
  uint64_t v10;
  NSMutableSet *supportedFamilies;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationSampleData;
  v5 = -[NTKComplicationSampleData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    familyToTemplate = v5->_familyToTemplate;
    v5->_familyToTemplate = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    familyToTemplatePath = v5->_familyToTemplatePath;
    v5->_familyToTemplatePath = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    supportedFamilies = v5->_supportedFamilies;
    v5->_supportedFamilies = (NSMutableSet *)v10;

    -[NTKComplicationSampleData _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (void)_commonInit
{
  self->_encodesTemplatesAsPaths = 1;
}

- (BOOL)hasTemplateForFamily:(int64_t)a3
{
  NTKComplicationSampleData *v4;
  NSMutableDictionary *familyToTemplate;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSMutableDictionary *familyToTemplatePath;
  void *v11;
  void *v12;
  void *v13;

  v4 = self;
  objc_sync_enter(v4);
  familyToTemplate = v4->_familyToTemplate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplate, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (v8)
  {
    v9 = 1;
  }
  else
  {
    familyToTemplatePath = v4->_familyToTemplatePath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplatePath, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    }
    else
    {
      v9 = 0;
    }

  }
  objc_sync_exit(v4);

  return v9;
}

- (id)_uncachedTemplateForFamily:(int64_t)a3
{
  NTKComplicationSampleData *v4;
  NSMutableDictionary *familyToTemplate;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *familyToTemplatePath;
  void *v10;
  void *v11;

  v4 = self;
  objc_sync_enter(v4);
  familyToTemplate = v4->_familyToTemplate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplate, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (!v8)
  {
    familyToTemplatePath = v4->_familyToTemplatePath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplatePath, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NTKComplicationSampleData _decodedTemplateFromPath:](v4, "_decodedTemplateFromPath:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  objc_sync_exit(v4);

  return v8;
}

- (id)templateForFamily:(int64_t)a3
{
  NTKComplicationSampleData *v4;
  NSMutableDictionary *familyToTemplate;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v4 = self;
  objc_sync_enter(v4);
  familyToTemplate = v4->_familyToTemplate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplate, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (!v8)
  {
    -[NTKComplicationSampleData _uncachedTemplateForFamily:](v4, "_uncachedTemplateForFamily:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((CLKIsNTKDaemon() & 1) == 0)
    {
      v9 = v4->_familyToTemplate;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

    }
  }
  v11 = v8;

  objc_sync_exit(v4);
  return v11;
}

- (id)templatePathForFamily:(int64_t)a3
{
  NTKComplicationSampleData *v4;
  NSMutableDictionary *familyToTemplatePath;
  void *v6;
  void *v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  familyToTemplatePath = v4->_familyToTemplatePath;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplatePath, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_sync_exit(v4);
  return v8;
}

- (void)setTemplate:(id)a3 forFamily:(int64_t)a4
{
  id v6;
  NTKComplicationSampleData *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *familyToTemplate;
  void *v17;
  NSMutableSet *supportedFamilies;
  void *v19;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v6)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[NTKComplicationSampleData setTemplate:forFamily:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  if ((CLKIsNTKDaemon() & 1) == 0)
  {
    familyToTemplate = v7->_familyToTemplate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](familyToTemplate, "setObject:forKeyedSubscript:", v6, v17);

  }
  supportedFamilies = v7->_supportedFamilies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](supportedFamilies, "addObject:", v19);

  objc_sync_exit(v7);
}

- (void)setTemplatePath:(id)a3 forFamily:(int64_t)a4
{
  NTKComplicationSampleData *v6;
  NSMutableDictionary *familyToTemplatePath;
  void *v8;
  NSMutableSet *supportedFamilies;
  void *v10;
  id v11;

  v11 = a3;
  v6 = self;
  objc_sync_enter(v6);
  familyToTemplatePath = v6->_familyToTemplatePath;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](familyToTemplatePath, "setObject:forKeyedSubscript:", v11, v8);

  supportedFamilies = v6->_supportedFamilies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](supportedFamilies, "addObject:", v10);

  objc_sync_exit(v6);
}

- (id)supportedFamilies
{
  NTKComplicationSampleData *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableSet allObjects](v2->_supportedFamilies, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return v4;
}

- (id)templateReferenceForFamily:(int64_t)a3
{
  NTKComplicationSampleData *v4;
  NSMutableSet *supportedFamilies;
  void *v6;
  NSMutableDictionary *familyToTemplatePath;
  void *v8;
  void *v9;
  NSMutableDictionary *familyToTemplate;
  void *v11;
  void *v12;
  NTKComplicationTemplateReference *v13;

  v4 = self;
  objc_sync_enter(v4);
  supportedFamilies = v4->_supportedFamilies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(supportedFamilies) = -[NSMutableSet containsObject:](supportedFamilies, "containsObject:", v6);

  if ((supportedFamilies & 1) != 0)
  {
    familyToTemplatePath = v4->_familyToTemplatePath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplatePath, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    familyToTemplate = v4->_familyToTemplate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](familyToTemplate, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[NTKComplicationTemplateReference initWithPath:existingTemplate:]([NTKComplicationTemplateReference alloc], "initWithPath:existingTemplate:", v9, v12);
  }
  else
  {
    v13 = 0;
  }
  objc_sync_exit(v4);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationSampleData)initWithCoder:(id)a3
{
  id v4;
  NTKComplicationSampleData *v5;
  NTKComplicationSampleData *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *familyToTemplate;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *familyToTemplatePath;
  uint64_t v27;
  NSMutableSet *supportedFamilies;
  void *v29;
  uint64_t v30;
  NSString *clientID;
  void *v32;
  uint64_t v33;
  NSString *applicationID;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v5 = -[NTKComplicationSampleData init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[NTKComplicationSampleData _commonInit](v5, "_commonInit");
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("FamilyToTemplate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v19 ? (NSMutableDictionary *)v19 : (NSMutableDictionary *)objc_opt_new();
    familyToTemplate = v6->_familyToTemplate;
    v6->_familyToTemplate = v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("FamilyToTemplatePath"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v23 ? (NSMutableDictionary *)v23 : (NSMutableDictionary *)objc_opt_new();
    familyToTemplatePath = v6->_familyToTemplatePath;
    v6->_familyToTemplatePath = v25;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("SupportedFamilies"));
    v27 = objc_claimAutoreleasedReturnValue();
    supportedFamilies = v6->_supportedFamilies;
    v6->_supportedFamilies = (NSMutableSet *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    clientID = v6->_clientID;
    v6->_clientID = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ApplicationID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    applicationID = v6->_applicationID;
    v6->_applicationID = (NSString *)v33;

    if (!-[NTKComplicationSampleData _validateTemplatesExist](v6, "_validateTemplatesExist"))
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[NTKComplicationSampleData initWithCoder:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);

      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NTKComplicationSampleData *v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_encodesTemplatesAsPaths)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5->_supportedFamilies;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_familyToTemplatePath, "objectForKeyedSubscript:", v11, (_QWORD)v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (v13)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](v5->_familyToTemplate, "objectForKeyedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v11);

          }
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "encodeObject:forKey:", v5->_familyToTemplatePath, CFSTR("FamilyToTemplatePath"));
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("FamilyToTemplate"));

  }
  else
  {
    -[NTKComplicationSampleData _inflateAllTemplates](v5, "_inflateAllTemplates");
    objc_msgSend(v4, "encodeObject:forKey:", v5->_familyToTemplate, CFSTR("FamilyToTemplate"));
  }
  objc_msgSend(v4, "encodeObject:forKey:", v5->_supportedFamilies, CFSTR("SupportedFamilies"), (_QWORD)v23);
  objc_msgSend(v4, "encodeObject:forKey:", v5->_clientID, CFSTR("ClientID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_applicationID, CFSTR("ApplicationID"));
  if (!-[NTKComplicationSampleData _validateTemplatesExist](v5, "_validateTemplatesExist"))
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NTKComplicationSampleData encodeWithCoder:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  objc_sync_exit(v5);

}

- (id)_decodedTemplateFromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 1, &v10);
  v5 = v10;
  if (v5)
  {
    CLKLoggingObjectForDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NTKComplicationSampleData _decodedTemplateFromPath:].cold.2();

    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
    objc_msgSend(v8, "setDecodingFailurePolicy:", 0);
    objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_inflateAllTemplates
{
  NSMutableDictionary *familyToTemplatePath;
  NTKComplicationSampleData *obj;
  _QWORD v4[5];

  obj = self;
  objc_sync_enter(obj);
  familyToTemplatePath = obj->_familyToTemplatePath;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__NTKComplicationSampleData__inflateAllTemplates__block_invoke;
  v4[3] = &unk_1E6BCF9A0;
  v4[4] = obj;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](familyToTemplatePath, "enumerateKeysAndObjectsUsingBlock:", v4);
  objc_sync_exit(obj);

}

void __49__NTKComplicationSampleData__inflateAllTemplates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_decodedTemplateFromPath:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v7, v6);

}

- (BOOL)_validateTemplatesExist
{
  NTKComplicationSampleData *v2;
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2->_supportedFamilies;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v2->_familyToTemplate, "objectForKeyedSubscript:", v7, (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (v9)
        {
          if (!v2->_encodesTemplatesAsPaths
            || (-[NSMutableDictionary objectForKeyedSubscript:](v2->_familyToTemplatePath, "objectForKeyedSubscript:", v7), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = v10 == 0, v10, v11))
          {
            v12 = 0;
            goto LABEL_13;
          }
        }
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  objc_sync_exit(v2);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NTKComplicationSampleData *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = self;
  objc_sync_enter(v3);
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSMutableSet mutableCopy](v3->_supportedFamilies, "mutableCopy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[NSMutableDictionary mutableCopy](v3->_familyToTemplatePath, "mutableCopy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSMutableDictionary mutableCopy](v3->_familyToTemplate, "mutableCopy");
  v10 = (void *)v4[1];
  v4[1] = v9;

  *((_BYTE *)v4 + 32) = v3->_encodesTemplatesAsPaths;
  v11 = -[NSString copy](v3->_clientID, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](v3->_applicationID, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  objc_sync_exit(v3);
  return v4;
}

- (id)inflatedCopy
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)-[NTKComplicationSampleData copy](self, "copy");
  objc_msgSend(v2, "_inflateAllTemplates");
  v3 = objc_opt_new();
  v4 = (void *)v2[2];
  v2[2] = v3;

  return v2;
}

- (id)copyEncodedToDirectoryPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NTKComplicationSampleData *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id *v25;
  id *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v31;
  uint64_t v33;
  NSMutableSet *obj;
  uint64_t v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v4 = -[NTKComplicationSampleData copy](self, "copy");
  v5 = objc_opt_new();
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = objc_opt_new();
  v8 = *(void **)(v4 + 8);
  v36 = (id *)v4;
  *(_QWORD *)(v4 + 8) = v7;

  v9 = self;
  objc_sync_enter(v9);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v9->_supportedFamilies;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v35 = *(_QWORD *)v42;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v35)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "unsignedIntegerValue");
      CLKStringForComplicationFamily();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.sample-template"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "stringByAppendingPathComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v9->_familyToTemplatePath, "objectForKey:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17
        && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "fileExistsAtPath:", v17),
            v18,
            v19))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v20, "copyItemAtPath:toPath:error:", v17, v16, &v40);
        v21 = v40;

        if (v21)
        {
          _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[NTKComplicationSampleData copyEncodedToDirectoryPath:].cold.3((uint64_t)v21, v31, v33);
          goto LABEL_21;
        }
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0CB36F8];
        -[NSMutableDictionary objectForKey:](v9->_familyToTemplate, "objectForKey:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v22, "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, &v39);
        v31 = objc_claimAutoreleasedReturnValue();
        v21 = v39;

        if (v21)
        {
          _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[NTKComplicationSampleData copyEncodedToDirectoryPath:].cold.2((uint64_t)v21, v27, v28);
LABEL_20:

LABEL_21:
          objc_sync_exit(v9);

          v26 = 0;
          v25 = v36;
          goto LABEL_22;
        }
        v38 = 0;
        -[NSObject writeToFile:options:error:](v31, "writeToFile:options:error:", v16, 1, &v38);
        v24 = v38;
        if (v24)
        {
          v21 = v24;
          _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[NTKComplicationSampleData copyEncodedToDirectoryPath:].cold.1((uint64_t)v21, v27, v29);
          goto LABEL_20;
        }

      }
      objc_msgSend(v36[2], "setObject:forKeyedSubscript:", v16, v12);

      if (v10 == ++v11)
      {
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_sync_exit(v9);
  v25 = v36;
  v26 = v36;
LABEL_22:

  return v26;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void)setApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)encodesTemplatesAsPaths
{
  return self->_encodesTemplatesAsPaths;
}

- (void)setEncodesTemplatesAsPaths:(BOOL)a3
{
  self->_encodesTemplatesAsPaths = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_supportedFamilies, 0);
  objc_storeStrong((id *)&self->_familyToTemplatePath, 0);
  objc_storeStrong((id *)&self->_familyToTemplate, 0);
}

- (void)setTemplate:(uint64_t)a3 forFamily:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B72A3000, a1, a3, "Invalid Complication Sample Data: Attempted to set sample data template to nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B72A3000, a1, a3, "Invalid Complication Sample Data: NTKComplicationSampleData found to be invalid during decoding", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)initWithCoder:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a3, (uint64_t)a3, "Could not decode NTKComplicationSampleData '%@'", (uint8_t *)a2);

}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B72A3000, a1, a3, "Invalid Complication Sample Data: NTKComplicationSampleData found to be invalid during encoding", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)_decodedTemplateFromPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Error decoding sample complication template at path %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_decodedTemplateFromPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Error loading data for sample complication template at path %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)copyEncodedToDirectoryPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "Failed to make encoded copy of sample data (4): %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)copyEncodedToDirectoryPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "Failed to make encoded copy of sample data (3): %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)copyEncodedToDirectoryPath:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "Failed to make encoded copy of sample data (2): %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
