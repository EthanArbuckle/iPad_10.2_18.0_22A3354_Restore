@implementation AFSetSettingsRequest

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFSiriRequestSucceededResponse alloc], "_initWithRequest:", self);
}

- (id)createResponseWithSettingChanges:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[AFSetSettingsResponse _initWithRequest:settingChanges:]([AFSetSettingsResponse alloc], "_initWithRequest:settingChanges:", self, v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFSetSettingsRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_settings, CFSTR("_settings"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_applyChanges, CFSTR("_applyChanges"));

}

- (AFSetSettingsRequest)initWithCoder:(id)a3
{
  id v4;
  AFSetSettingsRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *settings;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetSettingsRequest;
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_settings"));
    v9 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (NSArray *)v9;

    v5->_applyChanges = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_applyChanges"));
  }

  return v5;
}

- (NSArray)settings
{
  return self->_settings;
}

- (void)_setSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)applyChanges
{
  return self->_applyChanges;
}

- (void)_setApplyChanges:(BOOL)a3
{
  self->_applyChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
