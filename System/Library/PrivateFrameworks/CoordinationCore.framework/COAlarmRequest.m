@implementation COAlarmRequest

- (COAlarmRequest)initWithAlarm:(id)a3
{
  id v4;
  COAlarmRequest *v5;
  uint64_t v6;
  MTAlarm *alarm;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COAlarmRequest;
  v5 = -[COMeshCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v6;

  }
  return v5;
}

- (COAlarmRequest)initWithCoder:(id)a3
{
  id v4;
  COAlarmRequest *v5;
  uint64_t v6;
  MTAlarm *alarm;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COAlarmRequest;
  v5 = -[COMeshCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarm"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COAlarmRequest;
  v4 = a3;
  -[COMeshCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COAlarmRequest alarm](self, "alarm", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("alarm"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
