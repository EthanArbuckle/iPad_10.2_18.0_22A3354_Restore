@implementation CAFWriteRequest

+ (id)requestWithCharacteristic:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "writable"))
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCharacteristic:value:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (CAFWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4
{
  id v7;
  CAFWriteRequest *v8;
  CAFWriteRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CAFWriteRequest;
  v8 = -[CAFRequest initWithCharacteristic:](&v11, sel_initWithCharacteristic_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(&v8->_value, a4);

  return v9;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
