@implementation CNFoundationUserDefaults

+ (id)makeRegisteredDefaults
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("LocalizedDefaults"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)registeredDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CNFoundationUserDefaults_registeredDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registeredDefaults_cn_once_token_2 != -1)
    dispatch_once(&registeredDefaults_cn_once_token_2, block);
  return (id)registeredDefaults_cn_once_object_2;
}

void __46__CNFoundationUserDefaults_registeredDefaults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "makeRegisteredDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)registeredDefaults_cn_once_object_2;
  registeredDefaults_cn_once_object_2 = v1;

}

+ (id)sharedDefaults
{
  if (sharedDefaults_cn_once_token_3 != -1)
    dispatch_once(&sharedDefaults_cn_once_token_3, &__block_literal_global_59);
  return (id)sharedDefaults_cn_once_object_3;
}

void __42__CNFoundationUserDefaults_sharedDefaults__block_invoke()
{
  CNFoundationUserDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(CNFoundationUserDefaults);
  v1 = (void *)sharedDefaults_cn_once_object_3;
  sharedDefaults_cn_once_object_3 = (uint64_t)v0;

}

- (CNFoundationUserDefaults)init
{
  CNFoundationUserDefaults *v2;
  uint64_t v3;
  CNUserDefaults *userDefaults;
  CNUserDefaults *v5;
  void *v6;
  CNFoundationUserDefaults *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFoundationUserDefaults;
  v2 = -[CNFoundationUserDefaults init](&v9, sel_init);
  if (v2)
  {
    +[CNUserDefaults preferencesWithApplicationID:](CNUserDefaults, "preferencesWithApplicationID:", CFSTR("com.apple.AddressBook"));
    v3 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (CNUserDefaults *)v3;

    v5 = v2->_userDefaults;
    objc_msgSend((id)objc_opt_class(), "registeredDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUserDefaults registerDefaults:](v5, "registerDefaults:", v6);

    v7 = v2;
  }

  return v2;
}

- (unint64_t)newContactNameOrder
{
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
  v3 = -[CNUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", CFSTR("ABNewContactNameDisplay"));
  if (v3 == 2)
    return 1;
  if (v3 == 1)
    return 0;
  return -[CNFoundationUserDefaults nameOrder](self, "nameOrder");
}

- (unint64_t)sortOrder
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
  -[CNUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ABNameSortingFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("firstName"), 1);
  v5 = v4 >= objc_msgSend(v3, "rangeOfString:options:", CFSTR("lastName"), 1);

  return v5;
}

- (id)countryCode
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
  return -[CNUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ABDefaultAddressCountryCode"));
}

- (unint64_t)nameOrder
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
  return 1;
}

- (void)setNameOrder:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
}

- (BOOL)preferNickname
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
  return 0;
}

- (void)setPreferNickname:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
}

+ (unint64_t)_convertNSNameOrderToCNNameOrder:(int64_t)a3
{
  return a3 == 2;
}

- (unint64_t)shortNameFormat
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
  return 0;
}

- (void)setShortNameFormat:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
}

- (void)setShortNameFormatEnabled:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
}

- (BOOL)isShortNameFormatEnabled
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MethodNotImplemented"), CFSTR("You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead"));
  return 0;
}

- (NSDictionary)filteredAccountsAndContainers
{
  void *v2;
  void *v3;

  -[CNFoundationUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CNDefaultsFilteredAccountsAndContainersKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setFilteredAccountsAndContainers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNFoundationUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("CNDefaultsFilteredAccountsAndContainersKey"));

}

- (CNUserDefaults)userDefaults
{
  return (CNUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
