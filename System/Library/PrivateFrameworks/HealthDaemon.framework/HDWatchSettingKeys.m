@implementation HDWatchSettingKeys

- (HDWatchSettingKeys)initWithFeatureIdentifier:(id)a3 defaultsEnabledKey:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  HDWatchSettingKeys *v11;

  v6 = *MEMORY[0x1E0CB50C8];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_lastReconciledValue"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDWatchSettingKeys initWithFeatureIdentifier:featureSettingEnabledKey:defaultsEnabledKey:lastReconciledEnabledKey:](self, "initWithFeatureIdentifier:featureSettingEnabledKey:defaultsEnabledKey:lastReconciledEnabledKey:", v9, v6, v8, v10);

  return v11;
}

- (HDWatchSettingKeys)initWithFeatureIdentifier:(id)a3 featureSettingEnabledKey:(id)a4 defaultsEnabledKey:(id)a5 lastReconciledEnabledKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDWatchSettingKeys *v14;
  uint64_t v15;
  NSString *featureIdentifier;
  uint64_t v17;
  NSString *featureSettingEnabledKey;
  uint64_t v19;
  NSString *defaultsEnabledKey;
  uint64_t v21;
  NSString *lastReconciledEnabledKey;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDWatchSettingKeys;
  v14 = -[HDWatchSettingKeys init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    featureIdentifier = v14->_featureIdentifier;
    v14->_featureIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    featureSettingEnabledKey = v14->_featureSettingEnabledKey;
    v14->_featureSettingEnabledKey = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    defaultsEnabledKey = v14->_defaultsEnabledKey;
    v14->_defaultsEnabledKey = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    lastReconciledEnabledKey = v14->_lastReconciledEnabledKey;
    v14->_lastReconciledEnabledKey = (NSString *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HDWatchSettingKeys *v4;
  HDWatchSettingKeys *v5;
  NSString *featureIdentifier;
  NSString *v7;
  NSString *featureSettingEnabledKey;
  NSString *v9;
  NSString *defaultsEnabledKey;
  NSString *v11;
  NSString *lastReconciledEnabledKey;
  NSString *v13;
  char v14;

  v4 = (HDWatchSettingKeys *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      featureIdentifier = self->_featureIdentifier;
      v7 = v5->_featureIdentifier;
      if (featureIdentifier != v7 && (!v7 || !-[NSString isEqual:](featureIdentifier, "isEqual:")))
        goto LABEL_17;
      featureSettingEnabledKey = self->_featureSettingEnabledKey;
      v9 = v5->_featureSettingEnabledKey;
      if (featureSettingEnabledKey != v9
        && (!v9 || !-[NSString isEqual:](featureSettingEnabledKey, "isEqual:")))
      {
        goto LABEL_17;
      }
      defaultsEnabledKey = self->_defaultsEnabledKey;
      v11 = v5->_defaultsEnabledKey;
      if (defaultsEnabledKey != v11 && (!v11 || !-[NSString isEqual:](defaultsEnabledKey, "isEqual:")))
        goto LABEL_17;
      lastReconciledEnabledKey = self->_lastReconciledEnabledKey;
      v13 = v5->_lastReconciledEnabledKey;
      if (lastReconciledEnabledKey == v13)
      {
        v14 = 1;
        goto LABEL_18;
      }
      if (v13)
        v14 = -[NSString isEqual:](lastReconciledEnabledKey, "isEqual:");
      else
LABEL_17:
        v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_featureIdentifier, "hash");
  v4 = -[NSString hash](self->_featureSettingEnabledKey, "hash") ^ v3;
  v5 = -[NSString hash](self->_defaultsEnabledKey, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_lastReconciledEnabledKey, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %@:%@, %@:%@>"), objc_opt_class(), self->_featureIdentifier, self->_featureSettingEnabledKey, self->_defaultsEnabledKey, self->_lastReconciledEnabledKey);
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)featureSettingEnabledKey
{
  return self->_featureSettingEnabledKey;
}

- (NSString)defaultsEnabledKey
{
  return self->_defaultsEnabledKey;
}

- (NSString)lastReconciledEnabledKey
{
  return self->_lastReconciledEnabledKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReconciledEnabledKey, 0);
  objc_storeStrong((id *)&self->_defaultsEnabledKey, 0);
  objc_storeStrong((id *)&self->_featureSettingEnabledKey, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
