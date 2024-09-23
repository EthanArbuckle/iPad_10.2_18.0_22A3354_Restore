@implementation AKApplicationMetadataInfo

- (AKApplicationMetadataInfo)initWithResponseInfo:(id)a3
{
  id v4;
  AKApplicationMetadataInfo *v5;
  uint64_t v6;
  NSString *authorizedAppListVersion;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSDictionary *teams;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = -[AKApplicationMetadataInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authorizedAppListVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorizedAppListVersion = v5->_authorizedAppListVersion;
    v5->_authorizedAppListVersion = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("teams"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__AKApplicationMetadataInfo_initWithResponseInfo___block_invoke;
    v15[3] = &unk_1E2E60768;
    v16 = v8;
    v11 = v8;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
    v12 = objc_msgSend(v11, "copy");
    teams = v5->_teams;
    v5->_teams = (NSDictionary *)v12;

  }
  return v5;
}

void __50__AKApplicationMetadataInfo_initWithResponseInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AKDeveloperTeam *v6;

  v3 = a2;
  v6 = -[AKDeveloperTeam initWithResponseInfo:]([AKDeveloperTeam alloc], "initWithResponseInfo:", v3);

  v4 = *(void **)(a1 + 32);
  -[AKDeveloperTeam teamID](v6, "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKApplicationMetadataInfo)initWithCoder:(id)a3
{
  id v4;
  AKApplicationMetadataInfo *v5;
  uint64_t v6;
  NSString *authorizedAppListVersion;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *teams;

  v4 = a3;
  v5 = -[AKApplicationMetadataInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizedAppListVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorizedAppListVersion = v5->_authorizedAppListVersion;
    v5->_authorizedAppListVersion = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("teams"));
    v12 = objc_claimAutoreleasedReturnValue();
    teams = v5->_teams;
    v5->_teams = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *authorizedAppListVersion;
  id v5;

  authorizedAppListVersion = self->_authorizedAppListVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authorizedAppListVersion, CFSTR("authorizedAppListVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teams, CFSTR("teams"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> version: %@, teams: {\n%@\n}"), objc_opt_class(), self, self->_authorizedAppListVersion, self->_teams);
}

- (NSString)authorizedAppListVersion
{
  return self->_authorizedAppListVersion;
}

- (NSDictionary)teams
{
  return self->_teams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teams, 0);
  objc_storeStrong((id *)&self->_authorizedAppListVersion, 0);
}

@end
