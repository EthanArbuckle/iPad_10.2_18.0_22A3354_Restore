@implementation HDHRSExtractionFailureRecord

+ (id)extractionFailureRecordWithCode:(int64_t)a3 propertyName:(id)a4 resourceKeyPath:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)a1);
  v11 = v10;
  if (v10)
  {
    v10[1] = a3;
    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)v11[2];
    v11[2] = v12;

    v14 = objc_msgSend(v9, "copy");
    v15 = (void *)v11[3];
    v11[3] = v14;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDHRSExtractionFailureRecord)initWithCoder:(id)a3
{
  id v4;
  HDHRSExtractionFailureRecord *v5;
  uint64_t v6;
  NSString *propertyName;
  uint64_t v8;
  NSString *resourceKeyPath;
  HDHRSExtractionFailureRecord *v10;
  objc_super v12;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("FailureCode")) & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)HDHRSExtractionFailureRecord;
    v5 = -[HDHRSExtractionFailureRecord init](&v12, sel_init);
    if (v5)
    {
      v5->_failureCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FailureCode"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PropertyName"));
      v6 = objc_claimAutoreleasedReturnValue();
      propertyName = v5->_propertyName;
      v5->_propertyName = (NSString *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ResourceKeyPath"));
      v8 = objc_claimAutoreleasedReturnValue();
      resourceKeyPath = v5->_resourceKeyPath;
      v5->_resourceKeyPath = (NSString *)v8;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t failureCode;
  id v5;

  failureCode = self->_failureCode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", failureCode, CFSTR("FailureCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_propertyName, CFSTR("PropertyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceKeyPath, CFSTR("ResourceKeyPath"));

}

- (NSString)internalDisplaySafeDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  NSStringFromHDClinicalAnalyticsExtractionFailureCode(self->_failureCode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_propertyName)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" for %@"), self->_propertyName);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (self->_resourceKeyPath)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" from %@"), self->_resourceKeyPath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24D54C670);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)description
{
  void *v2;
  NSString *resourceKeyPath;
  NSString *propertyName;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  propertyName = self->_propertyName;
  resourceKeyPath = self->_resourceKeyPath;
  NSStringFromHDClinicalAnalyticsExtractionFailureCode(self->_failureCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ → %@, reason: %@"), resourceKeyPath, propertyName, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)failureCode
{
  return self->_failureCode;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)resourceKeyPath
{
  return self->_resourceKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceKeyPath, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end
