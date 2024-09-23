@implementation _LTPreflightConfiguration

- (_LTPreflightConfiguration)initWithSourceStrings:(id)a3 supportedLocalePairs:(id)a4
{
  id v6;
  id v7;
  _LTPreflightConfiguration *v8;
  uint64_t v9;
  NSArray *sourceStrings;
  uint64_t v11;
  NSArray *supportedLocalePairs;
  _LTPreflightConfiguration *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_LTPreflightConfiguration;
  v8 = -[_LTPreflightConfiguration init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sourceStrings = v8->_sourceStrings;
    v8->_sourceStrings = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    supportedLocalePairs = v8->_supportedLocalePairs;
    v8->_supportedLocalePairs = (NSArray *)v11;

    v8->_deviceSupportsTranslation = 1;
    v13 = v8;
  }

  return v8;
}

- (int64_t)nextStep
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  if (!-[_LTPreflightConfiguration deviceSupportsTranslation](self, "deviceSupportsTranslation"))
    return 2;
  -[_LTPreflightConfiguration resolvedSourceLocale](self, "resolvedSourceLocale");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[_LTPreflightConfiguration resolvedTargetLocale](self, "resolvedTargetLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (NSArray)supportedLocales
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_supportedLocalePairs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "sourceLocale", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        objc_msgSend(v9, "targetLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSLocale)effectiveSourceLocale
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_LTPreflightConfiguration resolvedSourceLocale](self, "resolvedSourceLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_LTPreflightConfiguration requestedSourceLocale](self, "requestedSourceLocale");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSLocale *)v6;
}

- (NSLocale)effectiveTargetLocale
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_LTPreflightConfiguration resolvedTargetLocale](self, "resolvedTargetLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_LTPreflightConfiguration requestedTargetLocale](self, "requestedTargetLocale");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSLocale *)v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  -[_LTPreflightConfiguration lowConfidenceLocales](self, "lowConfidenceLocales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_ltCompactMap:", &__block_literal_global_7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration sourceStrings](self, "sourceStrings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v26, "count");
  -[_LTPreflightConfiguration supportedLocales](self, "supportedLocales");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v25, "count");
  -[_LTPreflightConfiguration requestedSourceLocale](self, "requestedSourceLocale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_ltLocaleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration requestedTargetLocale](self, "requestedTargetLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_ltLocaleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration resolvedSourceLocale](self, "resolvedSourceLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration resolvedTargetLocale](self, "resolvedTargetLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_ltLocaleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration lidUnsupportedLocale](self, "lidUnsupportedLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ltLocaleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration systemLocale](self, "systemLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_ltLocaleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_LTPreflightConfiguration isForDownloadApprovalOnly](self, "isForDownloadApprovalOnly"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[_LTPreflightConfiguration deviceSupportsTranslation](self, "deviceSupportsTranslation"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; number of sourceStrings: %zu; number of supportedLocales: %zu; requestedSource: %@; requestedTarget: %@; resolvedSource: %@; resolvedTarget: %@; lidUnsupportedLocale: %@; systemLocale: %@; lowConfidenceLocales: %@; isForDownloadApprovalOnly: %@; deviceSupportsTranslation: %@>"),
    v21,
    self,
    v19,
    v18,
    v16,
    v15,
    v5,
    v6,
    v8,
    v10,
    v27,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LTPreflightConfiguration *v4;
  void *v5;
  void *v6;
  _LTPreflightConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = [_LTPreflightConfiguration alloc];
  -[_LTPreflightConfiguration sourceStrings](self, "sourceStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration supportedLocalePairs](self, "supportedLocalePairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LTPreflightConfiguration initWithSourceStrings:supportedLocalePairs:](v4, "initWithSourceStrings:supportedLocalePairs:", v5, v6);

  -[_LTPreflightConfiguration systemLocale](self, "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setSystemLocale:](v7, "setSystemLocale:", v8);

  -[_LTPreflightConfiguration requestedSourceLocale](self, "requestedSourceLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setRequestedSourceLocale:](v7, "setRequestedSourceLocale:", v9);

  -[_LTPreflightConfiguration requestedTargetLocale](self, "requestedTargetLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setRequestedTargetLocale:](v7, "setRequestedTargetLocale:", v10);

  -[_LTPreflightConfiguration resolvedSourceLocale](self, "resolvedSourceLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setResolvedSourceLocale:](v7, "setResolvedSourceLocale:", v11);

  -[_LTPreflightConfiguration resolvedTargetLocale](self, "resolvedTargetLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setResolvedTargetLocale:](v7, "setResolvedTargetLocale:", v12);

  -[_LTPreflightConfiguration lidUnsupportedLocale](self, "lidUnsupportedLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setLidUnsupportedLocale:](v7, "setLidUnsupportedLocale:", v13);

  -[_LTPreflightConfiguration lowConfidenceLocales](self, "lowConfidenceLocales");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[_LTPreflightConfiguration setLowConfidenceLocales:](v7, "setLowConfidenceLocales:", v15);

  -[_LTPreflightConfiguration setIsForDownloadApprovalOnly:](v7, "setIsForDownloadApprovalOnly:", -[_LTPreflightConfiguration isForDownloadApprovalOnly](self, "isForDownloadApprovalOnly"));
  -[_LTPreflightConfiguration setDeviceSupportsTranslation:](v7, "setDeviceSupportsTranslation:", -[_LTPreflightConfiguration deviceSupportsTranslation](self, "deviceSupportsTranslation"));
  -[_LTPreflightConfiguration selfLoggingID](self, "selfLoggingID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setSelfLoggingID:](v7, "setSelfLoggingID:", v16);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sourceStrings;
  id v5;

  sourceStrings = self->_sourceStrings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceStrings, CFSTR("sourceStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedLocalePairs, CFSTR("supportedLocalePairs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemLocale, CFSTR("systemLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestedSourceLocale, CFSTR("requestedSourceLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestedTargetLocale, CFSTR("requestedTargetLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resolvedSourceLocale, CFSTR("resolvedSourceLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resolvedTargetLocale, CFSTR("resolvedTargetLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lidUnsupportedLocale, CFSTR("lidUnsupportedLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowConfidenceLocales, CFSTR("lowConfidenceLocales"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isForDownloadApprovalOnly, CFSTR("isForDownloadApprovalOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deviceSupportsTranslation, CFSTR("deviceSupportsTranslation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selfLoggingID, CFSTR("selfLoggingID"));

}

- (_LTPreflightConfiguration)initWithCoder:(id)a3
{
  id v4;
  _LTPreflightConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *sourceStrings;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *supportedLocalePairs;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLocale *systemLocale;
  uint64_t v21;
  NSLocale *requestedSourceLocale;
  uint64_t v23;
  NSLocale *requestedTargetLocale;
  uint64_t v25;
  NSLocale *resolvedSourceLocale;
  uint64_t v27;
  NSLocale *resolvedTargetLocale;
  uint64_t v29;
  NSLocale *lidUnsupportedLocale;
  uint64_t v31;
  NSArray *lowConfidenceLocales;
  uint64_t v33;
  NSUUID *selfLoggingID;
  _LTPreflightConfiguration *v35;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_LTPreflightConfiguration;
  v5 = -[_LTPreflightConfiguration init](&v37, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sourceStrings"));
    v9 = objc_claimAutoreleasedReturnValue();
    sourceStrings = v5->_sourceStrings;
    v5->_sourceStrings = (NSArray *)v9;

    if (v5->_sourceStrings)
    {
      v11 = (void *)MEMORY[0x24BDBCF20];
      v39[0] = objc_opt_class();
      v39[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("supportedLocalePairs"));
      v14 = objc_claimAutoreleasedReturnValue();
      supportedLocalePairs = v5->_supportedLocalePairs;
      v5->_supportedLocalePairs = (NSArray *)v14;

      if (v5->_supportedLocalePairs)
      {
        v16 = (void *)MEMORY[0x24BDBCF20];
        v38[0] = objc_opt_class();
        v38[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemLocale"));
        v19 = objc_claimAutoreleasedReturnValue();
        systemLocale = v5->_systemLocale;
        v5->_systemLocale = (NSLocale *)v19;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedSourceLocale"));
        v21 = objc_claimAutoreleasedReturnValue();
        requestedSourceLocale = v5->_requestedSourceLocale;
        v5->_requestedSourceLocale = (NSLocale *)v21;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedTargetLocale"));
        v23 = objc_claimAutoreleasedReturnValue();
        requestedTargetLocale = v5->_requestedTargetLocale;
        v5->_requestedTargetLocale = (NSLocale *)v23;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolvedSourceLocale"));
        v25 = objc_claimAutoreleasedReturnValue();
        resolvedSourceLocale = v5->_resolvedSourceLocale;
        v5->_resolvedSourceLocale = (NSLocale *)v25;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolvedTargetLocale"));
        v27 = objc_claimAutoreleasedReturnValue();
        resolvedTargetLocale = v5->_resolvedTargetLocale;
        v5->_resolvedTargetLocale = (NSLocale *)v27;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lidUnsupportedLocale"));
        v29 = objc_claimAutoreleasedReturnValue();
        lidUnsupportedLocale = v5->_lidUnsupportedLocale;
        v5->_lidUnsupportedLocale = (NSLocale *)v29;

        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("lowConfidenceLocales"));
        v31 = objc_claimAutoreleasedReturnValue();
        lowConfidenceLocales = v5->_lowConfidenceLocales;
        v5->_lowConfidenceLocales = (NSArray *)v31;

        v5->_isForDownloadApprovalOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isForDownloadApprovalOnly"));
        v5->_deviceSupportsTranslation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceSupportsTranslation"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfLoggingID"));
        v33 = objc_claimAutoreleasedReturnValue();
        selfLoggingID = v5->_selfLoggingID;
        v5->_selfLoggingID = (NSUUID *)v33;

        v35 = v5;
      }
      else
      {
        v35 = 0;
      }

    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)supportedLocalePairs
{
  return self->_supportedLocalePairs;
}

- (NSArray)sourceStrings
{
  return self->_sourceStrings;
}

- (NSLocale)systemLocale
{
  return self->_systemLocale;
}

- (void)setSystemLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSLocale)requestedSourceLocale
{
  return self->_requestedSourceLocale;
}

- (void)setRequestedSourceLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSLocale)requestedTargetLocale
{
  return self->_requestedTargetLocale;
}

- (void)setRequestedTargetLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSLocale)resolvedSourceLocale
{
  return self->_resolvedSourceLocale;
}

- (void)setResolvedSourceLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSLocale)resolvedTargetLocale
{
  return self->_resolvedTargetLocale;
}

- (void)setResolvedTargetLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)lowConfidenceLocales
{
  return self->_lowConfidenceLocales;
}

- (void)setLowConfidenceLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSLocale)lidUnsupportedLocale
{
  return self->_lidUnsupportedLocale;
}

- (void)setLidUnsupportedLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isForDownloadApprovalOnly
{
  return self->_isForDownloadApprovalOnly;
}

- (void)setIsForDownloadApprovalOnly:(BOOL)a3
{
  self->_isForDownloadApprovalOnly = a3;
}

- (BOOL)deviceSupportsTranslation
{
  return self->_deviceSupportsTranslation;
}

- (void)setDeviceSupportsTranslation:(BOOL)a3
{
  self->_deviceSupportsTranslation = a3;
}

- (NSUUID)selfLoggingID
{
  return self->_selfLoggingID;
}

- (void)setSelfLoggingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfLoggingID, 0);
  objc_storeStrong((id *)&self->_lidUnsupportedLocale, 0);
  objc_storeStrong((id *)&self->_lowConfidenceLocales, 0);
  objc_storeStrong((id *)&self->_resolvedTargetLocale, 0);
  objc_storeStrong((id *)&self->_resolvedSourceLocale, 0);
  objc_storeStrong((id *)&self->_requestedTargetLocale, 0);
  objc_storeStrong((id *)&self->_requestedSourceLocale, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_sourceStrings, 0);
  objc_storeStrong((id *)&self->_supportedLocalePairs, 0);
}

- (_LTPreflightConfiguration)initWithSession:(id)a3 request:(id)a4 supportedLocalePairs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _LTPreflightConfiguration *v13;
  _LTPreflightConfiguration *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "batch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_ltCompactMap:", &__block_literal_global_9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_LTPreflightConfiguration initWithSourceStrings:supportedLocalePairs:](self, "initWithSourceStrings:supportedLocalePairs:", v12, v8);
  v14 = v13;
  objc_msgSend(v10, "sourceLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setRequestedSourceLocale:](v14, "setRequestedSourceLocale:", v15);

  objc_msgSend(v10, "targetLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LTPreflightConfiguration setRequestedTargetLocale:](v14, "setRequestedTargetLocale:", v16);
  v17 = objc_msgSend(v9, "isForDownloadRequest");

  -[_LTPreflightConfiguration setIsForDownloadApprovalOnly:](v14, "setIsForDownloadApprovalOnly:", v17);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTPreflightConfiguration setSystemLocale:](v14, "setSystemLocale:", v18);

  return v14;
}

@end
