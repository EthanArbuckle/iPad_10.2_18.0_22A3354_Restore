@implementation AFSearchAlarmsRequest

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFSearchAlarmsResponse alloc], "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFSearchAlarmsRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("Options"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_criteria, CFSTR("Criteria"));

}

- (AFSearchAlarmsRequest)initWithCoder:(id)a3
{
  id v4;
  AFSearchAlarmsRequest *v5;
  uint64_t v6;
  STAlarm *criteria;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSearchAlarmsRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Options"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Criteria"));
    v6 = objc_claimAutoreleasedReturnValue();
    criteria = v5->_criteria;
    v5->_criteria = (STAlarm *)v6;

  }
  return v5;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (STAlarm)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
