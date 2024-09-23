@implementation HMDResidentSyncClientHomeDataLogEvent

- (HMDResidentSyncClientHomeDataLogEvent)initWithHomeUUID:(id)a3 encodedDataSize:(unint64_t)a4 homeDataType:(int64_t)a5 transportType:(int)a6
{
  HMDResidentSyncClientHomeDataLogEvent *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDResidentSyncClientHomeDataLogEvent;
  result = -[HMMHomeLogEvent initWithHomeUUID:](&v10, sel_initWithHomeUUID_, a3);
  if (result)
  {
    result->_encodedDataSize = a4;
    result->_homeDataType = a5;
    result->_transportType = a6;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.daemon.residentSyncClient.encodedHomeDataSize");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (-[HMDResidentSyncClientHomeDataLogEvent homeDataType](self, "homeDataType") == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sparseEncodedDataSizeKBMaxUsingCA"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24E96B438, CFSTR("sparseEncodedDataSizeKBMaxUsingCA"));
  }
  v5 = &unk_24E96B438;
  if (-[HMDResidentSyncClientHomeDataLogEvent homeDataType](self, "homeDataType") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("fullEncodedDataSizeKBMaxUsingCA"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24E96B438, CFSTR("fullEncodedDataSizeKBMaxUsingCA"));
  }
  if (-[HMDResidentSyncClientHomeDataLogEvent homeDataType](self, "homeDataType") == 2)
    v7 = &unk_24E96B450;
  else
    v7 = &unk_24E96B438;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sparseEncodedDataCount"));
  if (-[HMDResidentSyncClientHomeDataLogEvent homeDataType](self, "homeDataType") == 1)
    v8 = &unk_24E96B450;
  else
    v8 = &unk_24E96B438;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("fullEncodedDataCount"));
  if (-[HMDResidentSyncClientHomeDataLogEvent transportType](self, "transportType") == 2)
    v9 = &unk_24E96B450;
  else
    v9 = &unk_24E96B438;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("transportIDSCount"));
  if (-[HMDResidentSyncClientHomeDataLogEvent transportType](self, "transportType") == 6)
    v10 = &unk_24E96B450;
  else
    v10 = &unk_24E96B438;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("transportRapportCount"));
  if (-[HMDResidentSyncClientHomeDataLogEvent transportType](self, "transportType") != 6
    && -[HMDResidentSyncClientHomeDataLogEvent transportType](self, "transportType") != 2)
  {
    v5 = &unk_24E96B450;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("transportOtherCount"));
  if (-[HMDResidentSyncClientHomeDataLogEvent transportType](self, "transportType") == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("transportIDSEncodedDataSizeKB"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24E96B438, CFSTR("transportIDSEncodedDataSizeKB"));
  }
  if (-[HMDResidentSyncClientHomeDataLogEvent transportType](self, "transportType") == 6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("transportRapportEncodedDataSizeKB"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24E96B438, CFSTR("transportRapportEncodedDataSizeKB"));
  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v13;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (unint64_t)encodedDataSize
{
  return self->_encodedDataSize;
}

- (int64_t)homeDataType
{
  return self->_homeDataType;
}

- (int)transportType
{
  return self->_transportType;
}

@end
