@implementation HDCloudSyncStateSampleWindowUpdaterConfiguration

- (HDCloudSyncStateSampleWindowUpdaterConfiguration)initWithDomain:(id)a3 key:(id)a4 sampleOriginKey:(id)a5 sampleType:(id)a6 syncEntityClass:(Class)a7 timeWindow:(id)a8 loggingCategory:(id)a9 sampleUUIDsFunction:(void *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HDCloudSyncStateSampleWindowUpdaterConfiguration *v22;
  uint64_t v23;
  NSString *domain;
  uint64_t v25;
  NSString *key;
  uint64_t v27;
  NSString *sampleOriginKey;
  uint64_t v29;
  NSDateInterval *timeWindow;
  objc_super v32;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v32.receiver = self;
  v32.super_class = (Class)HDCloudSyncStateSampleWindowUpdaterConfiguration;
  v22 = -[HDCloudSyncStateSampleWindowUpdaterConfiguration init](&v32, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    domain = v22->_domain;
    v22->_domain = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    key = v22->_key;
    v22->_key = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    sampleOriginKey = v22->_sampleOriginKey;
    v22->_sampleOriginKey = (NSString *)v27;

    objc_storeStrong((id *)&v22->_sampleType, a6);
    objc_storeStrong((id *)&v22->_syncEntityClass, a7);
    v29 = objc_msgSend(v20, "copy");
    timeWindow = v22->_timeWindow;
    v22->_timeWindow = (NSDateInterval *)v29;

    objc_storeStrong((id *)&v22->_loggingCategory, a9);
    v22->_sampleUUIDsFromCodableObjectCollectionFunction = a10;
  }

  return v22;
}

- (id)sampleUUIDsFromCodableObjectCollection:(id)a3
{
  return (id)((uint64_t (*)(id))self->_sampleUUIDsFromCodableObjectCollectionFunction)(a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)sampleOriginKey
{
  return self->_sampleOriginKey;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (Class)syncEntityClass
{
  return self->_syncEntityClass;
}

- (NSDateInterval)timeWindow
{
  return self->_timeWindow;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_timeWindow, 0);
  objc_storeStrong((id *)&self->_syncEntityClass, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_sampleOriginKey, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
