@implementation COMTAlarmCreateAction

- (COMTAlarmCreateAction)initWithAlarm:(id)a3
{
  id v4;
  COMTAlarmCreateAction *v5;
  uint64_t v6;
  MTAlarm *alarm;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTAlarmCreateAction;
  v5 = -[COMTAction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v6;

  }
  return v5;
}

- (COMTAlarmCreateAction)initWithCoder:(id)a3
{
  id v4;
  COMTAlarmCreateAction *v5;
  COMTAlarmCreateAction *v6;
  COMTAlarmCreateAction *v7;
  uint64_t v8;
  MTAlarm *alarm;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTAlarmCreateAction;
  v5 = -[COMTAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CA"));
  v6 = (COMTAlarmCreateAction *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = -[COMTAlarmCreateAction copy](v6, "copy");
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v8;

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTAlarmCreateAction;
  v4 = a3;
  -[COMTAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTAlarmCreateAction alarm](self, "alarm", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CA"));

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
