@implementation AFSetSettingsResponse

- (id)_initWithRequest:(id)a3 settingChanges:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFSetSettingsResponse;
  v7 = -[AFSiriResponse _initWithRequest:](&v11, sel__initWithRequest_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v7[2];
    v7[2] = v8;

  }
  return v7;
}

- (id)settingChanges
{
  return self->_settingChanges;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFSetSettingsResponse;
  v4 = a3;
  -[AFSiriResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_settingChanges, CFSTR("_settingChanges"), v5.receiver, v5.super_class);

}

- (AFSetSettingsResponse)initWithCoder:(id)a3
{
  id v4;
  AFSetSettingsResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *settingChanges;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetSettingsResponse;
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_settingChanges"));
    v9 = objc_claimAutoreleasedReturnValue();
    settingChanges = v5->_settingChanges;
    v5->_settingChanges = (NSArray *)v9;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingChanges, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
