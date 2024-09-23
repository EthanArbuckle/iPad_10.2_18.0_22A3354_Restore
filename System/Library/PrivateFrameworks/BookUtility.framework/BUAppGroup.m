@implementation BUAppGroup

- (NSURL)containerURL
{
  NSURL *containerURL;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSURL *v15;
  NSURL *v16;
  NSURL *v17;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;

  containerURL = self->_containerURL;
  if (containerURL)
    goto LABEL_8;
  v4 = (void *)objc_opt_class();
  if (objc_msgSend_isUnitTesting(v4, v5, v6))
  {
    if (qword_254B69F98 != -1)
      dispatch_once(&qword_254B69F98, &unk_24CEDA238);
    v9 = (NSURL *)(id)qword_254B69FA0;
    v10 = self->_containerURL;
    self->_containerURL = v9;
  }
  else
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(v10, v14, (uint64_t)v13);
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v16 = self->_containerURL;
    self->_containerURL = v15;

  }
  containerURL = self->_containerURL;
  if (containerURL)
  {
LABEL_8:
    v17 = containerURL;
  }
  else
  {
    BookUtilityLog();
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
      sub_212E6C58C(self, v19, v20);

    v21 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_isDirectory_(v21, v23, (uint64_t)v22, 1);
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

+ (BUAppGroup)books
{
  if (qword_253DB2520 != -1)
    dispatch_once(&qword_253DB2520, &unk_24CEDA258);
  return (BUAppGroup *)(id)qword_253DB2528;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (BUAppGroup)initWithIdentifier:(id)a3
{
  id v5;
  BUAppGroup *v6;
  BUAppGroup *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSUserDefaults *userDefaults;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BUAppGroup;
  v6 = -[BUAppGroup init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = objc_alloc(MEMORY[0x24BDBCF50]);
    v10 = objc_msgSend_initWithSuiteName_(v8, v9, (uint64_t)v5);
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (NSUserDefaults *)v10;

  }
  return v7;
}

+ (BOOL)isUnitTesting
{
  if (qword_253DB24C8 != -1)
    dispatch_once(&qword_253DB24C8, &unk_24CEDA218);
  return byte_254B69F90;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
