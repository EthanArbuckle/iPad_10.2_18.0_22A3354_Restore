@implementation HMWidgetManagerMonitorCharacteristicsResponse

- (HMWidgetManagerMonitorCharacteristicsResponse)initWithValueByCharacteristicUniqueIdentifier:(id)a3 reachabilityByAccessoryUniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  HMWidgetManagerMonitorCharacteristicsResponse *v8;
  uint64_t v9;
  NSDictionary *valueByCharacteristicUniqueIdentifier;
  uint64_t v11;
  NSDictionary *reachabilityByAccessoryUniqueIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMWidgetManagerMonitorCharacteristicsResponse;
  v8 = -[HMWidgetManagerMonitorCharacteristicsResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    valueByCharacteristicUniqueIdentifier = v8->_valueByCharacteristicUniqueIdentifier;
    v8->_valueByCharacteristicUniqueIdentifier = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    reachabilityByAccessoryUniqueIdentifier = v8->_reachabilityByAccessoryUniqueIdentifier;
    v8->_reachabilityByAccessoryUniqueIdentifier = (NSDictionary *)v11;

  }
  return v8;
}

- (NSDictionary)valueByCharacteristicUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)reachabilityByAccessoryUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityByAccessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_valueByCharacteristicUniqueIdentifier, 0);
}

@end
