@implementation STSetting

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSetting;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("Type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("Value"));

}

- (STSetting)initWithCoder:(id)a3
{
  id v4;
  STSetting *v5;
  uint64_t v6;
  id value;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSetting;
  v5 = -[STSiriModelObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("Value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v6;

  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
