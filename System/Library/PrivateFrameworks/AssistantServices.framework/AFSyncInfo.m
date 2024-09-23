@implementation AFSyncInfo

- (AFSyncInfo)initWithAnchor:(id)a3 forcingReset:(BOOL)a4
{
  id v6;
  AFSyncInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSyncInfo;
  v7 = -[AFSyncInfo init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSyncInfo setKey:](v7, "setKey:", v8);

    objc_msgSend(v6, "appMetaData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSyncInfo setAppMetadata:](v7, "setAppMetadata:", v9);

    if (!a4)
    {
      objc_msgSend(v6, "generation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSyncInfo setAnchor:](v7, "setAnchor:", v10);

      objc_msgSend(v6, "validity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSyncInfo setValidity:](v7, "setValidity:", v11);

      -[AFSyncInfo setCount:](v7, "setCount:", objc_msgSend(v6, "count"));
    }
  }

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFSyncInfo;
  -[AFSyncInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ anchor: %@ validity: %@ count: %zd key: %@ targetIsLocal: %d appMetadata: %@ reasons: %@"), v4, self->_anchor, self->_validity, self->_count, self->_key, self->_targetIsLocal, self->_appMetadata, self->_reasons);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *anchor;
  id v5;

  anchor = self->_anchor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", anchor, CFSTR("_anchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validity, CFSTR("_validity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("_count"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("_key"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_targetIsLocal, CFSTR("_targetIsLocal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appMetadata, CFSTR("_appMetadata"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forVerification, CFSTR("_forVerification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reasons, CFSTR("_reasons"));

}

- (AFSyncInfo)initWithCoder:(id)a3
{
  id v4;
  AFSyncInfo *v5;
  uint64_t v6;
  NSString *anchor;
  uint64_t v8;
  NSString *validity;
  uint64_t v10;
  NSString *key;
  uint64_t v12;
  SASyncAppMetaData *appMetadata;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *reasons;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFSyncInfo;
  v5 = -[AFSyncInfo init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_validity"));
    v8 = objc_claimAutoreleasedReturnValue();
    validity = v5->_validity;
    v5->_validity = (NSString *)v8;

    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_count"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_key"));
    v10 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v10;

    v5->_targetIsLocal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_targetIsLocal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appMetadata"));
    v12 = objc_claimAutoreleasedReturnValue();
    appMetadata = v5->_appMetadata;
    v5->_appMetadata = (SASyncAppMetaData *)v12;

    v5->_forVerification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_forVerification"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_reasons"));
    v17 = objc_claimAutoreleasedReturnValue();
    reasons = v5->_reasons;
    v5->_reasons = (NSSet *)v17;

  }
  return v5;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setValidity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SASyncAppMetaData)appMetadata
{
  return self->_appMetadata;
}

- (void)setAppMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)targetIsLocal
{
  return self->_targetIsLocal;
}

- (void)setTargetIsLocal:(BOOL)a3
{
  self->_targetIsLocal = a3;
}

- (BOOL)forVerification
{
  return self->_forVerification;
}

- (void)setForVerification:(BOOL)a3
{
  self->_forVerification = a3;
}

- (NSSet)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_appMetadata, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
