@implementation AFCreateAlarmResponse

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFCreateAlarmResponse;
  v4 = a3;
  -[AFSiriResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIdentifier, CFSTR("AlarmIdentifier"), v5.receiver, v5.super_class);

}

- (AFCreateAlarmResponse)initWithCoder:(id)a3
{
  id v4;
  AFCreateAlarmResponse *v5;
  uint64_t v6;
  NSString *alarmIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCreateAlarmResponse;
  v5 = -[AFSiriResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AlarmIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarmIdentifier = v5->_alarmIdentifier;
    v5->_alarmIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)alarmIdentifier
{
  return self->_alarmIdentifier;
}

- (void)setAlarmIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
