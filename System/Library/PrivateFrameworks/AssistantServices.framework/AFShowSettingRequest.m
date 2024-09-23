@implementation AFShowSettingRequest

- (id)_initWithSettingType:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFShowSettingRequest;
  result = -[AFSiriRequest init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 5) = a3;
  return result;
}

- (int64_t)settingType
{
  return self->_settingType;
}

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFSiriRequestSucceededResponse alloc], "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFShowSettingRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_settingType, CFSTR("_settingType"), v5.receiver, v5.super_class);

}

- (AFShowSettingRequest)initWithCoder:(id)a3
{
  id v4;
  AFShowSettingRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AFShowSettingRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_settingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_settingType"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
