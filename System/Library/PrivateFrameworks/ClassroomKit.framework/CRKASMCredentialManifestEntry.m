@implementation CRKASMCredentialManifestEntry

- (CRKASMCredentialManifestEntry)init
{
  return -[CRKASMCredentialManifestEntry initWithUserIdentifier:validityInterval:fingerprint:](self, "initWithUserIdentifier:validityInterval:fingerprint:", 0, 0, 0);
}

- (CRKASMCredentialManifestEntry)initWithUserIdentifier:(id)a3 validityInterval:(id)a4 fingerprint:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKASMCredentialManifestEntry *v11;
  uint64_t v12;
  NSString *userIdentifier;
  uint64_t v14;
  NSString *fingerprint;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMCredentialManifestEntry;
  v11 = -[CRKASMCredentialManifestEntry init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    userIdentifier = v11->_userIdentifier;
    v11->_userIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_validityInterval, a4);
    v14 = objc_msgSend(v10, "copy");
    fingerprint = v11->_fingerprint;
    v11->_fingerprint = (NSString *)v14;

  }
  return v11;
}

- (BOOL)isFullyPopulated
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CRKASMCredentialManifestEntry userIdentifier](self, "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CRKASMCredentialManifestEntry validityInterval](self, "validityInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CRKASMCredentialManifestEntry fingerprint](self, "fingerprint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRKASMCredentialManifestEntry userIdentifier](self, "userIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialManifestEntry validityInterval](self, "validityInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMCredentialManifestEntry fingerprint](self, "fingerprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ userIdentifier = %@, validityInterval = %@, fingerprint = %@ }"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CRKASMCredentialManifestEntry)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CRKASMCredentialManifestEntry *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend((id)objc_opt_class(), "validityIntervalWithDictionary:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Fingerprint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = -[CRKASMCredentialManifestEntry initWithUserIdentifier:validityInterval:fingerprint:](self, "initWithUserIdentifier:validityInterval:fingerprint:", v7, v8, v11);
  return v12;
}

- (id)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[CRKASMCredentialManifestEntry userIdentifier](self, "userIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("UserIdentifier"));

  -[CRKASMCredentialManifestEntry validityInterval](self, "validityInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ValidityStartDate"));

  -[CRKASMCredentialManifestEntry validityInterval](self, "validityInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ValidityEndDate"));

  -[CRKASMCredentialManifestEntry fingerprint](self, "fingerprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Fingerprint"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

+ (id)validityIntervalWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ValidityStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ValidityEndDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = 0;
  if (v6)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v6, v9);

  return v10;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSDateInterval)validityInterval
{
  return self->_validityInterval;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_validityInterval, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
