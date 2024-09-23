@implementation CNContactsUserDefaults

+ (CNContactsUserDefaults)sharedDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CNContactsUserDefaults_sharedDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (s_onceToken != -1)
    dispatch_once(&s_onceToken, block);
  return (CNContactsUserDefaults *)(id)s_instance;
}

void __40__CNContactsUserDefaults_sharedDefaults__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)s_instance;
  s_instance = (uint64_t)v1;

}

- (CNContactsUserDefaults)init
{
  CNContactsUserDefaults *p_super;
  CNiOSABContactsUserDefaults *v3;
  CNContactsUserDefaults *v4;
  objc_super v6;

  p_super = self;
  if (-[CNContactsUserDefaults isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v3 = objc_alloc_init(CNiOSABContactsUserDefaults);
  }
  else
  {
    v6.receiver = p_super;
    v6.super_class = (Class)CNContactsUserDefaults;
    v3 = -[CNContactsUserDefaults init](&v6, sel_init);
    p_super = &v3->super;
  }
  v4 = &v3->super;

  return v4;
}

+ (void)flushSharedInstance
{
  void *v2;

  s_onceToken = 0;
  v2 = (void *)s_instance;
  s_instance = 0;

}

- (id)changeNotificationName
{
  return CFSTR("CNContactsUserDefaultsDidChangeNotification");
}

- (int64_t)displayNameOrder
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (int64_t)newContactDisplayNameOrder
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setDisplayNameOrder:(int64_t)a3
{
  CNContactsUserDefaults *v3;
  id v4;

  v3 = self;
  CNAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (CNContactSortOrder)sortOrder
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSString)countryCode
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setShortNameFormat:(int64_t)a3
{
  CNContactsUserDefaults *v3;
  id v4;

  v3 = self;
  CNAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (int64_t)shortNameFormat
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setShortNameFormatEnabled:(BOOL)a3
{
  CNContactsUserDefaults *v3;
  id v4;

  v3 = self;
  CNAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)isShortNameFormatEnabled
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setShortNameFormatPrefersNicknames:(BOOL)a3
{
  CNContactsUserDefaults *v3;
  id v4;

  v3 = self;
  CNAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)shortNameFormatPrefersNicknames
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)filteredGroupAndContainerIDs
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setFilteredGroupAndContainerIDs:(id)a3
{
  id v4;
  CNContactsUserDefaults *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (int64_t)lastIgnoredNewDuplicatesCount
{
  CNContactsUserDefaults *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3
{
  CNContactsUserDefaults *v3;
  id v4;

  v3 = self;
  CNAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

@end
