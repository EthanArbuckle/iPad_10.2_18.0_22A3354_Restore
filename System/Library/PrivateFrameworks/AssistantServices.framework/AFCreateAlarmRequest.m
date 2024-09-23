@implementation AFCreateAlarmRequest

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFCreateAlarmResponse alloc], "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFCreateAlarmRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarm, CFSTR("Alarm"), v5.receiver, v5.super_class);

}

- (AFCreateAlarmRequest)initWithCoder:(id)a3
{
  id v4;
  AFCreateAlarmRequest *v5;
  uint64_t v6;
  STAlarm *alarm;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCreateAlarmRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Alarm"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarm = v5->_alarm;
    v5->_alarm = (STAlarm *)v6;

  }
  return v5;
}

- (STAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_alarm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
