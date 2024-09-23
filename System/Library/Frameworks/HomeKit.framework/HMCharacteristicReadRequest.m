@implementation HMCharacteristicReadRequest

+ (id)readRequestWithCharacteristic:(id)a3
{
  id v3;
  HMCharacteristicReadRequest *v4;

  v3 = a3;
  v4 = -[HMCharacteristicReadRequest initWithCharacteristic:]([HMCharacteristicReadRequest alloc], "initWithCharacteristic:", v3);

  return v4;
}

- (HMCharacteristicReadRequest)initWithCharacteristic:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMCharacteristicReadRequest;
  return -[HMCharacteristicRequest initWithCharacteristic:](&v4, sel_initWithCharacteristic_, a3);
}

- (BOOL)isEqual:(id)a3
{
  HMCharacteristicReadRequest *v4;
  HMCharacteristicReadRequest *v5;
  HMCharacteristicReadRequest *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMCharacteristicReadRequest *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMCharacteristicRequest characteristic](self, "characteristic");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicRequest characteristic](v6, "characteristic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCharacteristicRequest characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

@end
