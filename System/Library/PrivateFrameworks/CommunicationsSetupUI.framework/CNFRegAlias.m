@implementation CNFRegAlias

- (CNFRegAlias)initWithAlias:(id)a3 type:(int64_t)a4 selected:(BOOL)a5 deviceAliasIdentifier:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  CNFRegAlias *v12;
  CNFRegAlias *v13;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CNFRegAlias;
  v12 = -[CNFRegAlias init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[CNFRegAlias setAlias:](v12, "setAlias:", v10);
    -[CNFRegAlias setGivenAliasType:](v13, "setGivenAliasType:", a4);
    -[CNFRegAlias setSelectedDeviceAlias:](v13, "setSelectedDeviceAlias:", v7);
    -[CNFRegAlias setDeviceAliasIdentifier:](v13, "setDeviceAliasIdentifier:", v11);
  }

  return v13;
}

- (CNFRegAlias)initWithAccount:(id)a3 alias:(id)a4
{
  id v6;
  id v7;
  CNFRegAlias *v8;
  CNFRegAlias *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNFRegAlias;
  v8 = -[CNFRegAlias init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CNFRegAlias setAlias:](v8, "setAlias:", v7);
    -[CNFRegAlias setAccount:](v9, "setAccount:", v6);
  }

  return v9;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[IMAccount uniqueID](self->_account, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, self->_alias);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)type
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[CNFRegAlias account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNFRegAlias account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegAlias alias](self, "alias");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "typeForAlias:", v5);

  }
  else
  {
    v6 = -[CNFRegAlias givenAliasType](self, "givenAliasType");
  }

  return v6;
}

- (BOOL)isPhoneNumberAliasOnPhoneNumberAccount
{
  void *v3;
  BOOL v4;

  -[CNFRegAlias account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accountType") == 2 && -[CNFRegAlias type](self, "type") == 2;

  return v4;
}

- (BOOL)isTemporaryPhoneNumberAlias
{
  BOOL v2;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  if (self->_isTemporary)
    return 1;
  -[CNFRegAlias account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE4FED8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;
  -[CNFRegAlias account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "accountType") == 2)
    v2 = v6;
  else
    v2 = 0;

  return v2;
}

- (NSDate)expirationDate
{
  NSDate *expirationDate;
  NSDate *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[CNFRegAlias isTemporaryPhoneNumberAlias](self, "isTemporaryPhoneNumberAlias"))
  {
    expirationDate = self->__expirationDate;
    if (expirationDate)
    {
      v4 = expirationDate;
    }
    else
    {
      -[CNFRegAlias account](self, "account");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE4FED0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v4 = v7;

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isDeviceAlias
{
  void *v2;
  BOOL v3;

  -[CNFRegAlias account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)validate
{
  void *v3;
  void *v4;
  char v5;

  -[CNFRegAlias account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAlias alias](self, "alias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "validateAlias:", v4);

  return v5;
}

- (int64_t)validationStatus
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CNFRegAlias account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAlias alias](self, "alias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasAlias:", v4))
    v5 = objc_msgSend(v3, "validationStatusForAlias:", v4);
  else
    v5 = 1;

  return v5;
}

- (int64_t)validationErrorReason
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CNFRegAlias account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAlias alias](self, "alias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasAlias:", v4) && objc_msgSend(v3, "validationStatusForAlias:", v4) == -1)
    v5 = objc_msgSend(v3, "validationErrorReasonForAlias:", v4);
  else
    v5 = -1;

  return v5;
}

- (NSString)displayName
{
  NSString *displayName;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  displayName = self->_displayName;
  if (!displayName)
  {
    -[CNFRegAlias alias](self, "alias");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegFormattedPhoneNumberForString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_displayName;
    self->_displayName = v6;

    displayName = self->_displayName;
  }
  return displayName;
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;
  id v6;

  if (self->_displayName != a3)
  {
    CNFRegFormattedPhoneNumberForString(a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (NSString *)objc_msgSend(v6, "copy");
    displayName = self->_displayName;
    self->_displayName = v4;

  }
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = -[CNFRegAlias isDeviceAlias](self, "isDeviceAlias");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = -[CNFRegAlias type](self, "type");
  -[CNFRegAlias alias](self, "alias");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
  {
    if (-[CNFRegAlias isSelectedDeviceAlias](self, "isSelectedDeviceAlias"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    -[CNFRegAlias deviceAliasIdentifier](self, "deviceAliasIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<CNFRegAlias:%p> {Type:%ld, Alias:%@, Selected: %@, DeviceId: %@}"), self, v5, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<CNFRegAlias:%p> {Type:%ld, Alias:%@}"), self, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (int64_t)localizedCaseInsensitiveCompare:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CNFRegAlias alias](self, "alias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_appearsToBePhoneNumber");

  objc_msgSend(v4, "alias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_appearsToBePhoneNumber");

  if (v6 == v8)
  {
    -[CNFRegAlias alias](self, "alias");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alias");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "localizedCaseInsensitiveCompare:", v11);

  }
  else if (v6)
  {
    v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isLocalPhoneNumberAlias
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  -[CNFRegAlias alias](self, "alias");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegLocalPhoneNumberDisplayString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToIgnoringCase:", v3);

  if ((v4 & 1) != 0)
    goto LABEL_4;
  CNFRegFormattedPhoneNumberForString(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegLocalPhoneNumberDisplayString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToIgnoringCase:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_4;
  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("YOUR_NUMBER_STRING"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v2, "isEqualToIgnoringCase:", v10);

  if ((v11 & 1) != 0)
LABEL_4:
    v12 = 1;
  else
    v12 = objc_msgSend(v2, "isEqualToIgnoringCase:", *MEMORY[0x24BE50A38]);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int64_t v17;
  uint64_t v18;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNFRegAlias;
  if (-[CNFRegAlias isEqual:](&v21, sel_isEqual_, v4))
  {
    v5 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
    goto LABEL_20;
  }
  v6 = v4;
  -[CNFRegAlias alias](self, "alias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_8:
    -[CNFRegAlias alias](self, "alias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alias");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    goto LABEL_9;
  }
  objc_msgSend(v6, "alias");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_8;
  v11 = 1;
LABEL_9:
  -[CNFRegAlias account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    goto LABEL_12;
  }
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_12:
    -[CNFRegAlias account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      v11 = 0;
  }
  v17 = -[CNFRegAlias type](self, "type");
  v18 = objc_msgSend(v6, "type");

  v5 = v17 == v18 && v11 != 0;
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[CNFRegAlias type](self, "type");
  -[CNFRegAlias alias](self, "alias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 961 * v3;

  -[CNFRegAlias account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return v7;
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (int64_t)givenAliasType
{
  return self->_givenAliasType;
}

- (void)setGivenAliasType:(int64_t)a3
{
  self->_givenAliasType = a3;
}

- (BOOL)isSelectedDeviceAlias
{
  return self->_selectedDeviceAlias;
}

- (void)setSelectedDeviceAlias:(BOOL)a3
{
  self->_selectedDeviceAlias = a3;
}

- (NSString)deviceAliasIdentifier
{
  return self->_deviceAliasIdentifier;
}

- (void)setDeviceAliasIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (void)setIsTemporary:(BOOL)a3
{
  self->_isTemporary = a3;
}

- (NSDate)_expirationDate
{
  return self->__expirationDate;
}

- (void)set_expirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expirationDate, 0);
  objc_storeStrong((id *)&self->_deviceAliasIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end
