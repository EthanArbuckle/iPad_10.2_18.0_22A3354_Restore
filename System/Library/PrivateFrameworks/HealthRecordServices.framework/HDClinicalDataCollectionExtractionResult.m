@implementation HDClinicalDataCollectionExtractionResult

- (HDClinicalDataCollectionExtractionResult)initWithRedactedResources:(id)a3 rulesVersion:(id)a4
{
  id v6;
  id v7;
  HDClinicalDataCollectionExtractionResult *v8;
  uint64_t v9;
  NSArray *redactedResources;
  uint64_t v11;
  NSNumber *rulesVersion;

  v6 = a3;
  v7 = a4;
  v8 = -[HDClinicalDataCollectionExtractionResult init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    redactedResources = v8->_redactedResources;
    v8->_redactedResources = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    rulesVersion = v8->_rulesVersion;
    v8->_rulesVersion = (NSNumber *)v11;

  }
  return v8;
}

- (HDClinicalDataCollectionExtractionResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  HDClinicalDataCollectionExtractionResult *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("RedactedResources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RulesVersion"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }
  else
  {
    self = -[HDClinicalDataCollectionExtractionResult initWithRedactedResources:rulesVersion:](self, "initWithRedactedResources:rulesVersion:", v6, v7);
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *redactedResources;
  id v5;

  redactedResources = self->_redactedResources;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", redactedResources, CFSTR("RedactedResources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rulesVersion, CFSTR("RulesVersion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)redactedResources
{
  return self->_redactedResources;
}

- (NSNumber)rulesVersion
{
  return self->_rulesVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulesVersion, 0);
  objc_storeStrong((id *)&self->_redactedResources, 0);
}

@end
