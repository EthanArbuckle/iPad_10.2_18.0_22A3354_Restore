@implementation ENExposureDetectionDaemonSessionState

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *clientSigningIdentity;
  ENRegion *region;
  NSDictionary *infectiousnessForDaysSinceOnsetOfSymptoms;
  NSDate *infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
  id v9;

  v4 = a3;
  clientSigningIdentity = self->_clientSigningIdentity;
  v9 = v4;
  if (clientSigningIdentity)
  {
    objc_msgSend(v4, "encodeObject:forKey:", clientSigningIdentity, CFSTR("client"));
    v4 = v9;
  }
  region = self->_region;
  if (region)
  {
    objc_msgSend(v9, "encodeObject:forKey:", region, CFSTR("region"));
    v4 = v9;
  }
  infectiousnessForDaysSinceOnsetOfSymptoms = self->_infectiousnessForDaysSinceOnsetOfSymptoms;
  if (infectiousnessForDaysSinceOnsetOfSymptoms)
  {
    objc_msgSend(v9, "encodeObject:forKey:", infectiousnessForDaysSinceOnsetOfSymptoms, CFSTR("infectiousnessMap"));
    v4 = v9;
  }
  infectiousnessForDaysSinceOnsetOfSymptomsChangeDate = self->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
  if (infectiousnessForDaysSinceOnsetOfSymptomsChangeDate)
  {
    objc_msgSend(v9, "encodeObject:forKey:", infectiousnessForDaysSinceOnsetOfSymptomsChangeDate, CFSTR("infectiousnessMapDate"));
    v4 = v9;
  }

}

- (ENExposureDetectionDaemonSessionState)initWithCoder:(id)a3
{
  id v4;
  ENExposureDetectionDaemonSessionState *v5;
  uint64_t v6;
  NSString *clientSigningIdentity;
  uint64_t v8;
  ENRegion *region;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *infectiousnessForDaysSinceOnsetOfSymptoms;
  uint64_t v13;
  NSDate *infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
  ENExposureDetectionDaemonSessionState *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ENExposureDetectionDaemonSessionState;
  v5 = -[ENExposureDetectionDaemonSessionState init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientSigningIdentity = v5->_clientSigningIdentity;
    v5->_clientSigningIdentity = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v8 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (ENRegion *)v8;

    v10 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v10, objc_opt_class(), CFSTR("infectiousnessMap"));
    v11 = objc_claimAutoreleasedReturnValue();
    infectiousnessForDaysSinceOnsetOfSymptoms = v5->_infectiousnessForDaysSinceOnsetOfSymptoms;
    v5->_infectiousnessForDaysSinceOnsetOfSymptoms = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("infectiousnessMapDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    infectiousnessForDaysSinceOnsetOfSymptomsChangeDate = v5->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
    v5->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate = (NSDate *)v13;

    v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientSigningIdentity
{
  return self->_clientSigningIdentity;
}

- (void)setClientSigningIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)infectiousnessForDaysSinceOnsetOfSymptomsChangeDate
{
  return self->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
}

- (void)setInfectiousnessForDaysSinceOnsetOfSymptomsChangeDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)infectiousnessForDaysSinceOnsetOfSymptoms
{
  return self->_infectiousnessForDaysSinceOnsetOfSymptoms;
}

- (void)setInfectiousnessForDaysSinceOnsetOfSymptoms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infectiousnessForDaysSinceOnsetOfSymptoms, 0);
  objc_storeStrong((id *)&self->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_clientSigningIdentity, 0);
}

@end
