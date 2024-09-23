@implementation ENPersistentTemporaryExposureKey

- (ENPersistentTemporaryExposureKey)initWithTemporaryExposureKey:(id)a3 appBundleIdentifier:(id)a4 regionCountryCode:(id)a5
{
  id v9;
  id v10;
  id v11;
  ENPersistentTemporaryExposureKey *v12;
  ENPersistentTemporaryExposureKey *v13;
  uint64_t v14;
  NSString *appBundleIdentifier;
  uint64_t v16;
  NSString *regionCountryCode;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ENPersistentTemporaryExposureKey;
  v12 = -[ENPersistentTemporaryExposureKey init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    v14 = objc_msgSend(v10, "copy");
    appBundleIdentifier = v13->_appBundleIdentifier;
    v13->_appBundleIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    regionCountryCode = v13->_regionCountryCode;
    v13->_regionCountryCode = (NSString *)v16;

    v13->_originalReportType = objc_msgSend(v9, "diagnosisReportType");
    v13->_originalVariantOfConcernType = objc_msgSend(v9, "variantOfConcernType");
  }

  return v13;
}

- (id)description
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v9;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v4 = 0;

  if (self->_appBundleIdentifier)
  {
    NSAppendPrintF_safe();
    v5 = v4;

    v4 = v5;
  }
  if (self->_regionCountryCode)
  {
    NSAppendPrintF_safe();
    v6 = v4;

    v4 = v6;
  }
  NSAppendPrintF_safe();
  v7 = v4;

  return v7;
}

- (ENTemporaryExposureKey)key
{
  return self->_key;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)regionCountryCode
{
  return self->_regionCountryCode;
}

- (unsigned)originalReportType
{
  return self->_originalReportType;
}

- (void)setOriginalReportType:(unsigned int)a3
{
  self->_originalReportType = a3;
}

- (unsigned)originalVariantOfConcernType
{
  return self->_originalVariantOfConcernType;
}

- (void)setOriginalVariantOfConcernType:(unsigned int)a3
{
  self->_originalVariantOfConcernType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCountryCode, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
