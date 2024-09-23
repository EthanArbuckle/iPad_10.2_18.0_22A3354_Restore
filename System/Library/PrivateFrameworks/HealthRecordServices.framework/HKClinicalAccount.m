@implementation HKClinicalAccount

- (HKClinicalAccount)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalAccount)initWithIdentifier:(id)a3 state:(int64_t)a4 userEnabled:(BOOL)a5 lastFetchDate:(id)a6 lastFullFetchDate:(id)a7 lastFailedFetchDate:(id)a8 failedFetchAttemptsCount:(id)a9 clinicalSharingStatus:(id)a10 hasClinicalSharingScopes:(BOOL)a11 provenance:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKClinicalAccount *v25;
  uint64_t v26;
  NSUUID *identifier;
  void *v28;
  uint64_t v29;
  NSDate *lastFetchDate;
  uint64_t v31;
  NSDate *lastFullFetchDate;
  uint64_t v33;
  NSDate *lastFailedFetchDate;
  uint64_t v35;
  NSNumber *failedFetchAttemptsCount;
  uint64_t v37;
  HKClinicalSharingStatus *clinicalSharingStatus;
  uint64_t v39;
  HKClinicalAccountProvenance *provenance;
  objc_super v42;

  v18 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v42.receiver = self;
  v42.super_class = (Class)HKClinicalAccount;
  v25 = -[HKClinicalAccount init](&v42, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v18, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSUUID *)v26;

    v25->_state = a4;
    v25->_userEnabled = a5;
    HKDateMax();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    lastFetchDate = v25->_lastFetchDate;
    v25->_lastFetchDate = (NSDate *)v29;

    v31 = objc_msgSend(v20, "copy");
    lastFullFetchDate = v25->_lastFullFetchDate;
    v25->_lastFullFetchDate = (NSDate *)v31;

    v33 = objc_msgSend(v21, "copy");
    lastFailedFetchDate = v25->_lastFailedFetchDate;
    v25->_lastFailedFetchDate = (NSDate *)v33;

    v35 = objc_msgSend(v22, "copy");
    failedFetchAttemptsCount = v25->_failedFetchAttemptsCount;
    v25->_failedFetchAttemptsCount = (NSNumber *)v35;

    v37 = objc_msgSend(v23, "copy");
    clinicalSharingStatus = v25->_clinicalSharingStatus;
    v25->_clinicalSharingStatus = (HKClinicalSharingStatus *)v37;

    v25->_hasClinicalSharingScopes = a11;
    v39 = objc_msgSend(v24, "copy");
    provenance = v25->_provenance;
    v25->_provenance = (HKClinicalAccountProvenance *)v39;

  }
  return v25;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  NSNumber *failedFetchAttemptsCount;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("false");
  if (self->_userEnabled)
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  v15 = *(_OWORD *)&self->_state;
  v14 = *(_OWORD *)&self->_lastFullFetchDate;
  failedFetchAttemptsCount = self->_failedFetchAttemptsCount;
  -[HKClinicalSharingStatus description](self->_clinicalSharingStatus, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hasClinicalSharingScopes)
    v7 = CFSTR("true");
  -[HKClinicalAccountProvenance description](self->_provenance, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; identifier: %@; isUserEnabled: %@; state: %ld; lastFetchDate: %@; lastFullFetchDate: %@; lastFailedFetchDate: %@; failedFetchAttemptsCount: %@; clinicalSharingStatus: %@ ; hasClinicalSharingScopes: %@; provenance: %@;>"),
    v5,
    self,
    v6,
    v8,
    v15,
    v14,
    failedFetchAttemptsCount,
    v10,
    v7,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (HKClinicalGateway)gateway
{
  return -[HKClinicalAccountProvenance gateway](self->_provenance, "gateway");
}

- (HKClinicalGatewayReference)newerAvailableGateway
{
  void *v2;
  void *v3;

  -[HKClinicalAccountProvenance gateway](self->_provenance, "gateway");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "newerSupportedGatewayVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKClinicalGatewayReference *)v3;
}

- (NSString)title
{
  int64_t v3;
  HKClinicalAccountProvenance *provenance;
  void *v5;
  void *v6;

  v3 = -[HKClinicalAccountProvenance type](self->_provenance, "type");
  provenance = self->_provenance;
  if (v3 == 1)
  {
    -[HKClinicalAccountProvenance signedClinicalDataIssuer](provenance, "signedClinicalDataIssuer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKClinicalAccountProvenance title](provenance, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)subtitle
{
  int64_t v3;
  HKClinicalAccountProvenance *provenance;
  void *v5;
  void *v6;

  v3 = -[HKClinicalAccountProvenance type](self->_provenance, "type");
  provenance = self->_provenance;
  if (v3 == 1)
  {
    -[HKClinicalAccountProvenance signedClinicalDataIssuer](provenance, "signedClinicalDataIssuer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKClinicalAccountProvenance subtitle](provenance, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (HKClinicalBrand)brand
{
  return -[HKClinicalAccountProvenance brand](self->_provenance, "brand");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKClinicalAccount identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalAccount *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HKClinicalAccount *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKClinicalAccount identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAccount identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)needsScopeUpgrade
{
  return -[HKClinicalAccount state](self, "state") == 6;
}

- (BOOL)needsRelogin
{
  return -[HKClinicalAccount state](self, "state") == 3
      && -[HKClinicalAccountProvenance type](self->_provenance, "type") == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKClinicalAccountProvenance *provenance;
  id v5;

  provenance = self->_provenance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", provenance, CFSTR("provenance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastFetchDate, CFSTR("lastFetchDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastFullFetchDate, CFSTR("lastFullFetchDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastFailedFetchDate, CFSTR("lastFailedFetchDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_failedFetchAttemptsCount, CFSTR("failedFetchAttemptsCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clinicalSharingStatus, CFSTR("clinicalSharingStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasClinicalSharingScopes, CFSTR("hasClinicalSharingScopes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userEnabled, CFSTR("userEnabled"));

}

- (HKClinicalAccount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKClinicalAccount *v16;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provenance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clinicalSharingStatus"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v5 == 0;
  else
    v9 = 1;
  v10 = v9 || v7 == 0;
  if (!v10
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("state"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("userEnabled"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("hasClinicalSharingScopes")) & 1) != 0)
  {
    v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFetchDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFullFetchDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFailedFetchDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("failedFetchAttemptsCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clinicalSharingStatus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasClinicalSharingScopes"));
    self = -[HKClinicalAccount initWithIdentifier:state:userEnabled:lastFetchDate:lastFullFetchDate:lastFailedFetchDate:failedFetchAttemptsCount:clinicalSharingStatus:hasClinicalSharingScopes:provenance:](self, "initWithIdentifier:state:userEnabled:lastFetchDate:lastFullFetchDate:lastFailedFetchDate:failedFetchAttemptsCount:clinicalSharingStatus:hasClinicalSharingScopes:provenance:", v6, v20, v19, v11, v12, v13, v14, v15, v18, v5);

    v16 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v16 = 0;
  }

  return v16;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isUserEnabled
{
  return self->_userEnabled;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (NSDate)lastFullFetchDate
{
  return self->_lastFullFetchDate;
}

- (NSDate)lastFailedFetchDate
{
  return self->_lastFailedFetchDate;
}

- (NSNumber)failedFetchAttemptsCount
{
  return self->_failedFetchAttemptsCount;
}

- (HKClinicalSharingStatus)clinicalSharingStatus
{
  return self->_clinicalSharingStatus;
}

- (BOOL)hasClinicalSharingScopes
{
  return self->_hasClinicalSharingScopes;
}

- (HKClinicalAccountProvenance)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_clinicalSharingStatus, 0);
  objc_storeStrong((id *)&self->_failedFetchAttemptsCount, 0);
  objc_storeStrong((id *)&self->_lastFailedFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFullFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFetchDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
