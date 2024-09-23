@implementation HDConceptResolutionConfiguration

- (HDConceptResolutionConfiguration)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDConceptResolutionConfiguration)initWithCountryCode:(id)a3 recordCategoryType:(int64_t)a4 options:(unint64_t)a5
{
  id v8;
  HDConceptResolutionConfiguration *v9;
  uint64_t v10;
  NSString *countryCode;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDConceptResolutionConfiguration;
  v9 = -[HDConceptResolutionConfiguration init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    countryCode = v9->_countryCode;
    v9->_countryCode = (NSString *)v10;

    v9->_recordCategoryType = a4;
    v9->_options = a5;
  }

  return v9;
}

- (HDConceptResolutionConfiguration)initWithCountryCode:(id)a3
{
  return -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:](self, "initWithCountryCode:recordCategoryType:options:", a3, 0, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *countryCode;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  countryCode = self->_countryCode;
  HKStringFromMedicalRecordCategoryType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ /'%@/'>"), v4, self, countryCode, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)recordCategoryType
{
  return self->_recordCategoryType;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
