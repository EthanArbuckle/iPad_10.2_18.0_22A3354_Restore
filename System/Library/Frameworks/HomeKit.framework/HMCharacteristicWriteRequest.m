@implementation HMCharacteristicWriteRequest

- (HMCharacteristicWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4
{
  id v7;
  HMCharacteristicWriteRequest *v8;
  HMCharacteristicWriteRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMCharacteristicWriteRequest;
  v8 = -[HMCharacteristicRequest initWithCharacteristic:](&v11, sel_initWithCharacteristic_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_value, a4);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMCharacteristicWriteRequest *v4;
  HMCharacteristicWriteRequest *v5;
  HMCharacteristicWriteRequest *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMCharacteristicWriteRequest *)a3;
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

- (NSCopying)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)writeRequestWithCharacteristic:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  HMCharacteristicWriteRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMCharacteristicWriteRequest initWithCharacteristic:value:]([HMCharacteristicWriteRequest alloc], "initWithCharacteristic:value:", v6, v5);

  return v7;
}

@end
