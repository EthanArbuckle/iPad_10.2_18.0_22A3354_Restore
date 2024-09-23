@implementation CNContactsUserDefaultsX

- (CNContactsUserDefaultsX)init
{
  void *v3;
  CNContactsUserDefaultsX *v4;

  objc_msgSend(MEMORY[0x1E0D13A60], "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactsUserDefaultsX initWithFoundationUserDefaults:](self, "initWithFoundationUserDefaults:", v3);

  return v4;
}

- (CNContactsUserDefaultsX)initWithFoundationUserDefaults:(id)a3
{
  id v5;
  CNContactsUserDefaultsX *v6;
  CNContactsUserDefaultsX *v7;
  CNContactsUserDefaultsX *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactsUserDefaultsX;
  v6 = -[CNContactsUserDefaults init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_foundationUserDefaults, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)displayNameOrder
{
  void *v2;
  uint64_t v3;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nameOrder");

  if (v3 == 1)
    return 2;
  else
    return 1;
}

- (void)setDisplayNameOrder:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a3 == 2)
  {
    -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v4 = 1;
  }
  else
  {
    if (a3 != 1)
      return;
    -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v4 = 0;
  }
  objc_msgSend(v3, "setNameOrder:", v4);

}

- (int64_t)newContactDisplayNameOrder
{
  void *v2;
  uint64_t v3;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "newContactNameOrder");

  if (v3 == 1)
    return 2;
  else
    return 1;
}

- (int64_t)sortOrder
{
  void *v2;
  uint64_t v3;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortOrder");

  if (v3)
    return 3;
  else
    return 2;
}

- (id)countryCode
{
  void *v2;
  void *v3;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)shortNameFormat
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  int64_t v6;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shortNameFormat");

  v5 = -[CNContactsUserDefaultsX isShortNameFormatEnabled](self, "isShortNameFormatEnabled");
  v6 = v4 - 1;
  if ((unint64_t)(v4 - 1) >= 4)
    v6 = 4;
  if (v5)
    return v6;
  else
    return 4;
}

- (void)setShortNameFormat:(int64_t)a3
{
  uint64_t v4;
  id v5;

  v4 = 1;
  switch(a3)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v4 = 2;
      goto LABEL_5;
    case 2:
      v4 = 3;
      goto LABEL_5;
    case 3:
      v4 = 4;
LABEL_5:
      -[CNContactsUserDefaultsX setShortNameFormatEnabled:](self, "setShortNameFormatEnabled:", 1);
      -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setShortNameFormat:", v4);

      break;
    case 4:
      -[CNContactsUserDefaultsX setShortNameFormatEnabled:](self, "setShortNameFormatEnabled:", 0);
      break;
    default:
      return;
  }
}

- (BOOL)isShortNameFormatEnabled
{
  void *v2;
  char v3;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShortNameFormatEnabled");

  return v3;
}

- (void)setShortNameFormatEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShortNameFormatEnabled:", v3);

}

- (BOOL)shortNameFormatPrefersNicknames
{
  void *v2;
  char v3;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferNickname");

  return v3;
}

- (void)setShortNameFormatPrefersNicknames:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferNickname:", v3);

}

- (id)filteredGroupAndContainerIDs
{
  void *v2;
  void *v3;

  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredAccountsAndContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFilteredGroupAndContainerIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactsUserDefaultsX foundationUserDefaults](self, "foundationUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilteredAccountsAndContainers:", v4);

}

- (CNFoundationUserDefaults)foundationUserDefaults
{
  return (CNFoundationUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFoundationUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundationUserDefaults, 0);
}

@end
