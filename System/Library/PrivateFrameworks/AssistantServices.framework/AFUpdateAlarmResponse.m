@implementation AFUpdateAlarmResponse

- (void)setAlarmIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUpdateAlarmResponse setAlarmIdentifiers:](self, "setAlarmIdentifiers:", v6);

  }
  else
  {
    -[AFUpdateAlarmResponse setAlarmIdentifiers:](self, "setAlarmIdentifiers:", 0);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUpdateAlarmResponse;
  v4 = a3;
  -[AFSiriResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIdentifiers, CFSTR("_alarmIdentifiers"), v5.receiver, v5.super_class);

}

- (AFUpdateAlarmResponse)initWithCoder:(id)a3
{
  id v4;
  AFUpdateAlarmResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *alarmIdentifiers;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFUpdateAlarmResponse;
  v5 = -[AFSiriResponse initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_alarmIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    alarmIdentifiers = v5->_alarmIdentifiers;
    v5->_alarmIdentifiers = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)alarmIdentifiers
{
  return self->_alarmIdentifiers;
}

- (void)setAlarmIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
