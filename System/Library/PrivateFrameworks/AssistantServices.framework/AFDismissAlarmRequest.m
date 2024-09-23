@implementation AFDismissAlarmRequest

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFSiriRequestSucceededResponse alloc], "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFDismissAlarmRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmURLs, CFSTR("AlarmURLs"), v5.receiver, v5.super_class);

}

- (AFDismissAlarmRequest)initWithCoder:(id)a3
{
  id v4;
  AFDismissAlarmRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *alarmURLs;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDismissAlarmRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AlarmURLs"));
    v9 = objc_claimAutoreleasedReturnValue();
    alarmURLs = v5->_alarmURLs;
    v5->_alarmURLs = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)alarmURLs
{
  return self->_alarmURLs;
}

- (void)setAlarmURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmURLs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
