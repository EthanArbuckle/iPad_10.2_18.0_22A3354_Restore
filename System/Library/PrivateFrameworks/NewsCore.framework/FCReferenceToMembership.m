@implementation FCReferenceToMembership

- (FCReferenceToMembership)initWithIdentifier:(id)a3
{
  id v5;
  FCReferenceToMembership *v6;
  FCReferenceToMembership *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCReferenceToMembership initWithIdentifier:]";
    v13 = 2080;
    v14 = "FCReferenceToMembership.m";
    v15 = 1024;
    v16 = 16;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCReferenceToMembership;
  v6 = -[FCReferenceToMembership init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (FCReferenceToMembership)initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCReferenceToMembership *v7;
  uint64_t v8;
  NSString *membershipID;

  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCReferenceToMembership initWithIdentifier:](self, "initWithIdentifier:", v6);

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("membershipID"));
    v8 = objc_claimAutoreleasedReturnValue();
    membershipID = v7->_membershipID;
    v7->_membershipID = (NSString *)v8;

  }
  return v7;
}

- (FCReferenceToMembership)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6;
  FCReferenceToMembership *v7;
  uint64_t v8;
  NSString *membershipID;

  v6 = a4;
  v7 = -[FCReferenceToMembership initWithIdentifier:](self, "initWithIdentifier:", a3);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("membershipID"));
    v8 = objc_claimAutoreleasedReturnValue();
    membershipID = v7->_membershipID;
    v7->_membershipID = (NSString *)v8;

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReferenceToMembership membershipID](self, "membershipID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCReferenceToMembership membershipID](self, "membershipID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("membershipID"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)membershipID
{
  return self->_membershipID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_membershipID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
