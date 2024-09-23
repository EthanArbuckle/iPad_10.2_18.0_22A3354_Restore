@implementation CRKToolCommandUserInfo

- (CRKToolCommandUserInfo)initWithSessionIdentifier:(id)a3
{
  id v4;
  CRKToolCommandUserInfo *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKToolCommandUserInfo;
  v5 = -[CRKToolCommandUserInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  +[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "platform"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("instructorPlatform"));

  -[CRKToolCommandUserInfo appVersion](self, "appVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("instructorClassroomAppVersion"));

  objc_msgSend(v4, "systemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("instructorOSVersion"));

  -[CRKToolCommandUserInfo sessionIdentifier](self, "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKToolCommandUserInfo sessionIdentifier](self, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sessionIdentifier"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v10;
}

- (id)appVersion
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), &unk_24DA080A8);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
