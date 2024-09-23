@implementation HMWidgetManagerFetchStateResponse

- (HMWidgetManagerFetchStateResponse)initWithValueByCharacteristicUniqueIdentifier:(id)a3
{
  id v4;
  HMWidgetManagerFetchStateResponse *v5;
  uint64_t v6;
  NSDictionary *valueByCharacteristicUniqueIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMWidgetManagerFetchStateResponse;
  v5 = -[HMWidgetManagerFetchStateResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    valueByCharacteristicUniqueIdentifier = v5->_valueByCharacteristicUniqueIdentifier;
    v5->_valueByCharacteristicUniqueIdentifier = (NSDictionary *)v6;

  }
  return v5;
}

- (NSDictionary)valueByCharacteristicUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueByCharacteristicUniqueIdentifier, 0);
}

@end
