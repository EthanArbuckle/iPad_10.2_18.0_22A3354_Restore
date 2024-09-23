@implementation MTRMetrics

- (MTRMetrics)init
{

  return 0;
}

- (MTRMetrics)initWithCapacity:(unint64_t)a3
{
  const char *v4;
  MTRMetrics *v5;
  uint64_t v6;
  NSMutableDictionary *metricsData;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSUUID *uniqueIdentifier;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRMetrics;
  v5 = -[MTRMetrics init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], v4, a3);
    v6 = objc_claimAutoreleasedReturnValue();
    metricsData = v5->_metricsData;
    v5->_metricsData = (NSMutableDictionary *)v6;

    objc_msgSend_UUID(MEMORY[0x24BDD1880], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v10;

  }
  return v5;
}

- (NSArray)allKeys
{
  uint64_t v2;

  return (NSArray *)objc_msgSend_allKeys(self->_metricsData, a2, v2);
}

- (id)metricDataForKey:(id)a3
{
  const char *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  if (v5)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_metricsData, v4, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "Cannot get metrics value for nil key", v9, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v6 = 0;
  }

  return v6;
}

- (void)setMetricData:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend_setValue_forKey_(self->_metricsData, v7, (uint64_t)v6, v8);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "Cannot set metrics value for nil key", v10, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }

}

- (void)removeMetricDataForKey:(id)a3
{
  const char *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if (v5)
  {
    objc_msgSend_removeObjectForKey_(self->_metricsData, v4, (uint64_t)v5);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "Cannot remove metrics value for nil key", v7, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }

}

- (id)description
{
  uint64_t v2;
  void *v3;
  NSUUID *uniqueIdentifier;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  uniqueIdentifier = self->_uniqueIdentifier;
  objc_msgSend_description(self->_metricsData, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<MTRMetrics: uuid = %@, data = %@>"), uniqueIdentifier, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsData, 0);
}

@end
