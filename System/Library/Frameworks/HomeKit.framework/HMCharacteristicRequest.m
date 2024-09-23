@implementation HMCharacteristicRequest

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (HMCharacteristicRequest)initWithCharacteristic:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  HMCharacteristicRequest *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMCharacteristicRequest;
    v6 = -[HMRequestBase _init](&v10, sel__init);
    v7 = v6;
    if (v6)
      objc_storeStrong(v6 + 1, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
