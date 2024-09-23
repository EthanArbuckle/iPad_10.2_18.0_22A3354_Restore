@implementation CPLSettingFeedbackMessage

- (CPLSettingFeedbackMessage)initWithSetting:(id)a3 value:(id)a4 libraryIdentifier:(id)a5
{
  id v8;
  id v9;
  CPLSettingFeedbackMessage *v10;
  uint64_t v11;
  NSString *settingName;
  uint64_t v13;
  NSString *value;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CPLSettingFeedbackMessage;
  v10 = -[CPLFeedbackMessage initWithLibraryIdentifier:](&v16, sel_initWithLibraryIdentifier_, a5);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    settingName = v10->_settingName;
    v10->_settingName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    value = v10->_value;
    v10->_value = (NSString *)v13;

  }
  return v10;
}

- (id)serverMessage
{
  void *v3;
  CPLServerFeedbackKeyAndValue *v4;
  CPLServerFeedbackKeyAndValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPLSettingFeedbackMessage;
  -[CPLFeedbackMessage serverMessage](&v7, sel_serverMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  -[CPLServerFeedbackKeyAndValue setKey:](v4, "setKey:", CFSTR("setting"));
  -[CPLServerFeedbackKeyAndValue setValue:](v4, "setValue:", self->_settingName);
  objc_msgSend(v3, "addKeysAndValues:", v4);
  v5 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  -[CPLServerFeedbackKeyAndValue setKey:](v5, "setKey:", CFSTR("settingValue"));
  -[CPLServerFeedbackKeyAndValue setValue:](v5, "setValue:", self->_value);
  objc_msgSend(v3, "addKeysAndValues:", v5);

  return v3;
}

- (NSString)settingName
{
  return self->_settingName;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_settingName, 0);
}

+ (id)feedbackType
{
  return CFSTR("setting");
}

@end
