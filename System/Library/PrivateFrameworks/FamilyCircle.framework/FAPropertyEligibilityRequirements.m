@implementation FAPropertyEligibilityRequirements

- (FAPropertyEligibilityRequirements)initWithPropertyName:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  FAPropertyEligibilityRequirements *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("has-recommended-members"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("media-altDSID-matches"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("server-journey-eligibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("active-apps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serverPayload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[FAPropertyEligibilityRequirements initWithPropertyName:hasRecommendedMembers:expectedMediaAltDSID:serverEligibility:activeBundleIDs:serverPayload:](self, "initWithPropertyName:hasRecommendedMembers:expectedMediaAltDSID:serverEligibility:activeBundleIDs:serverPayload:", v7, v9, v10, v12, v13, v14);
  return v15;
}

- (FAPropertyEligibilityRequirements)initWithCoder:(id)a3
{
  id v4;
  FAPropertyEligibilityRequirements *v5;
  uint64_t v6;
  NSString *propertyName;
  uint64_t v8;
  NSString *expectedMediaAltDSID;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *activeBundleIDs;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id serverPayload;

  v4 = a3;
  v5 = -[FAPropertyEligibilityRequirements init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyName"));
    v6 = objc_claimAutoreleasedReturnValue();
    propertyName = v5->_propertyName;
    v5->_propertyName = (NSString *)v6;

    v5->_hasRecommendedMembers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("has-recommended-members"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("media-altDSID-matches"));
    v8 = objc_claimAutoreleasedReturnValue();
    expectedMediaAltDSID = v5->_expectedMediaAltDSID;
    v5->_expectedMediaAltDSID = (NSString *)v8;

    v5->_serverEligibility = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("server-journey-eligibility"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("active-apps"));
    v13 = objc_claimAutoreleasedReturnValue();
    activeBundleIDs = v5->_activeBundleIDs;
    v5->_activeBundleIDs = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("serverPayload"));
    v20 = objc_claimAutoreleasedReturnValue();
    serverPayload = v5->_serverPayload;
    v5->_serverPayload = (id)v20;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverPayload, 0);
  objc_storeStrong((id *)&self->_activeBundleIDs, 0);
  objc_storeStrong((id *)&self->_expectedMediaAltDSID, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

- (FAPropertyEligibilityRequirements)initWithPropertyName:(id)a3 hasRecommendedMembers:(BOOL)a4 expectedMediaAltDSID:(id)a5 serverEligibility:(BOOL)a6 activeBundleIDs:(id)a7 serverPayload:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  FAPropertyEligibilityRequirements *v18;
  uint64_t v19;
  NSString *propertyName;
  uint64_t v21;
  NSString *expectedMediaAltDSID;
  uint64_t v23;
  NSArray *activeBundleIDs;
  objc_super v26;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)FAPropertyEligibilityRequirements;
  v18 = -[FAPropertyEligibilityRequirements init](&v26, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    propertyName = v18->_propertyName;
    v18->_propertyName = (NSString *)v19;

    v18->_hasRecommendedMembers = a4;
    v21 = objc_msgSend(v15, "copy");
    expectedMediaAltDSID = v18->_expectedMediaAltDSID;
    v18->_expectedMediaAltDSID = (NSString *)v21;

    v18->_serverEligibility = a6;
    v23 = objc_msgSend(v16, "copy");
    activeBundleIDs = v18->_activeBundleIDs;
    v18->_activeBundleIDs = (NSArray *)v23;

    objc_storeStrong(&v18->_serverPayload, a8);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *propertyName;
  id v5;

  propertyName = self->_propertyName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", propertyName, CFSTR("propertyName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasRecommendedMembers, CFSTR("has-recommended-members"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedMediaAltDSID, CFSTR("media-altDSID-matches"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_serverEligibility, CFSTR("server-journey-eligibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeBundleIDs, CFSTR("active-apps"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverPayload, CFSTR("serverPayload"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (BOOL)hasRecommendedMembers
{
  return self->_hasRecommendedMembers;
}

- (NSString)expectedMediaAltDSID
{
  return self->_expectedMediaAltDSID;
}

- (BOOL)serverEligibility
{
  return self->_serverEligibility;
}

- (NSArray)activeBundleIDs
{
  return self->_activeBundleIDs;
}

- (id)serverPayload
{
  return self->_serverPayload;
}

@end
