@implementation GEONavdClientInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEONavdClientInfo)initWithCoder:(id)a3
{
  id v4;
  GEONavdClientInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *canonicalName;
  void *v9;
  uint64_t v10;
  NSString *uniqueClientId;
  uint64_t v12;
  GEOApplicationAuditToken *auditToken;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEONavdClientInfo;
  v5 = -[GEONavdClientInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEONavdClientInfoCanonicalNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    canonicalName = v5->_canonicalName;
    v5->_canonicalName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEONavdClientInfoUniqueClientIdKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    uniqueClientId = v5->_uniqueClientId;
    v5->_uniqueClientId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEONavdClientInfoUniqueAuditTokenKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    auditToken = v5->_auditToken;
    v5->_auditToken = (GEOApplicationAuditToken *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[GEONavdClientInfo canonicalName](self, "canonicalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("GEONavdClientInfoCanonicalNameKey"));

  -[GEONavdClientInfo uniqueClientId](self, "uniqueClientId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("GEONavdClientInfoUniqueClientIdKey"));

  -[GEONavdClientInfo auditToken](self, "auditToken");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("GEONavdClientInfoUniqueAuditTokenKey"));

}

- (GEONavdClientInfo)initWithCanonicalName:(id)a3 instanceId:(unint64_t)a4 auditToken:(id)a5
{
  id v8;
  id v9;
  GEONavdClientInfo *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *canonicalName;
  uint64_t v18;
  NSString *uniqueClientId;
  GEONavdClientInfo *v20;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEONavdClientInfo;
  v10 = -[GEONavdClientInfo init](&v22, sel_init);
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "processIdentifier");
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "initWithFormat:", CFSTR("%@-%d-%@"), v8, v13, v15);
    canonicalName = v10->_canonicalName;
    v10->_canonicalName = (NSString *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu-%@"), a4, v10->_canonicalName);
    uniqueClientId = v10->_uniqueClientId;
    v10->_uniqueClientId = (NSString *)v18;

    objc_storeStrong((id *)&v10->_auditToken, a5);
    v20 = v10;
  }

  return v10;
}

- (GEONavdClientInfo)initWithCanonicalName:(id)a3 instanceId:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  GEONavdClientInfo *v11;
  GEONavdClientInfo *v12;
  GEOApplicationAuditToken *v13;
  void *v14;
  GEOApplicationAuditToken *v15;
  GEONavdClientInfo *v16;

  v6 = (void *)MEMORY[0x1E0CB3898];
  v7 = a3;
  objc_msgSend(v6, "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("navd")) & 1) != 0)
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEONavdClientInfo initWithCanonicalName:instanceId:auditToken:](self, "initWithCanonicalName:instanceId:auditToken:", v7, a4, v10);

    v12 = v11;
  }
  else
  {
    v13 = [GEOApplicationAuditToken alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[GEOApplicationAuditToken initWithProxiedExternalApplicationBundleId:](v13, "initWithProxiedExternalApplicationBundleId:", v14);
    v16 = -[GEONavdClientInfo initWithCanonicalName:instanceId:auditToken:](self, "initWithCanonicalName:instanceId:auditToken:", v7, a4, v15);

    v12 = v16;
  }

  return v12;
}

+ (id)clientInfoForNavdPredictions
{
  if (qword_1ECDBC2E0 != -1)
    dispatch_once(&qword_1ECDBC2E0, &__block_literal_global_124);
  return (id)_MergedGlobals_264;
}

void __49__GEONavdClientInfo_clientInfoForNavdPredictions__block_invoke()
{
  GEONavdClientInfo *v0;
  void *v1;

  v0 = -[GEONavdClientInfo initWithCanonicalName:instanceId:]([GEONavdClientInfo alloc], "initWithCanonicalName:instanceId:", CFSTR("com.apple.navd.predictions"), 0);
  v1 = (void *)_MergedGlobals_264;
  _MergedGlobals_264 = (uint64_t)v0;

}

- (BOOL)isCalendarClientInfo
{
  return -[NSString containsString:](self->_canonicalName, "containsString:", CFSTR("calaccessd"));
}

- (BOOL)isNavdClientInfo
{
  return -[NSString containsString:](self->_canonicalName, "containsString:", CFSTR("com.apple.navd.predictions"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "canonicalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavdClientInfo canonicalName](self, "canonicalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "uniqueClientId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEONavdClientInfo uniqueClientId](self, "uniqueClientId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GEONavdClientInfo *v4;

  v4 = -[GEONavdClientInfo init](+[GEONavdClientInfo allocWithZone:](GEONavdClientInfo, "allocWithZone:", a3), "init");
  -[GEONavdClientInfo setCanonicalName:](v4, "setCanonicalName:", self->_canonicalName);
  -[GEONavdClientInfo setUniqueClientId:](v4, "setUniqueClientId:", self->_uniqueClientId);
  -[GEONavdClientInfo setAuditToken:](v4, "setAuditToken:", self->_auditToken);
  return v4;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uniqueClientId, "hash");
}

- (NSString)canonicalName
{
  return self->_canonicalName;
}

- (void)setCanonicalName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)uniqueClientId
{
  return self->_uniqueClientId;
}

- (void)setUniqueClientId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_uniqueClientId, 0);
  objc_storeStrong((id *)&self->_canonicalName, 0);
}

@end
