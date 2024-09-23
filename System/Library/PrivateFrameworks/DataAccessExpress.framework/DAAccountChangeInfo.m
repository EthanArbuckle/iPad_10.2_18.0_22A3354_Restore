@implementation DAAccountChangeInfo

- (DAAccountChangeInfo)initWithChangeType:(unint64_t)a3 accountIdentifier:(id)a4 accountTypeIdentifier:(id)a5 oldAccountProperties:(id)a6 username:(id)a7 password:(id)a8 oldUsername:(id)a9 oldPassword:(id)a10 modifiedDataClasses:(id)a11 clientName:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  DAAccountChangeInfo *v26;
  DAAccountChangeInfo *v27;
  uint64_t v28;
  NSString *accountIdentifier;
  uint64_t v30;
  NSString *accountTypeIdentifier;
  uint64_t v32;
  NSDictionary *oldAccountProperties;
  uint64_t v34;
  NSString *username;
  uint64_t v36;
  NSString *password;
  uint64_t v38;
  NSString *oldUsername;
  uint64_t v40;
  NSString *oldPassword;
  uint64_t v42;
  NSSet *modifiedDataClasses;
  uint64_t v44;
  NSString *clientName;
  id v47;
  objc_super v48;

  v47 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v48.receiver = self;
  v48.super_class = (Class)DAAccountChangeInfo;
  v26 = -[DAAccountChangeInfo init](&v48, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_changeType = a3;
    v28 = objc_msgSend(v47, "copy");
    accountIdentifier = v27->_accountIdentifier;
    v27->_accountIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v18, "copy");
    accountTypeIdentifier = v27->_accountTypeIdentifier;
    v27->_accountTypeIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v19, "copy");
    oldAccountProperties = v27->_oldAccountProperties;
    v27->_oldAccountProperties = (NSDictionary *)v32;

    v34 = objc_msgSend(v20, "copy");
    username = v27->_username;
    v27->_username = (NSString *)v34;

    v36 = objc_msgSend(v21, "copy");
    password = v27->_password;
    v27->_password = (NSString *)v36;

    v38 = objc_msgSend(v22, "copy");
    oldUsername = v27->_oldUsername;
    v27->_oldUsername = (NSString *)v38;

    v40 = objc_msgSend(v23, "copy");
    oldPassword = v27->_oldPassword;
    v27->_oldPassword = (NSString *)v40;

    v42 = objc_msgSend(v24, "copy");
    modifiedDataClasses = v27->_modifiedDataClasses;
    v27->_modifiedDataClasses = (NSSet *)v42;

    v44 = objc_msgSend(v25, "copy");
    clientName = v27->_clientName;
    v27->_clientName = (NSString *)v44;

  }
  return v27;
}

- (DAAccountChangeInfo)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  DAAccountChangeInfo *v15;
  DAAccountChangeInfo *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ChangeType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_ERROR, "Missing account identifier when attempting to decode DAAccountChangeInfo", buf, 2u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountTypeIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    DALoggingwithCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1B5244000, v17, OS_LOG_TYPE_ERROR, "Missing account type identifier when attempting to decode DAAccountChangeInfo", v23, 2u);
    }

LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v22 = v5;
  if (initWithCoder__onceToken != -1)
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_3);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__oldAccountPropertiesWhitelist, CFSTR("OldAccountProperties"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Username"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Password"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OldUsername"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OldPassword"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__modifiedDataClassesWhitelist, CFSTR("ModifiedDataClasses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = v6;
  v14 = (void *)v8;
  v15 = -[DAAccountChangeInfo initWithChangeType:accountIdentifier:accountTypeIdentifier:oldAccountProperties:username:password:oldUsername:oldPassword:modifiedDataClasses:clientName:](self, "initWithChangeType:accountIdentifier:accountTypeIdentifier:oldAccountProperties:username:password:oldUsername:oldPassword:modifiedDataClasses:clientName:", v22, v12, v7, v20, v21, v8, v19, v9, v10, v11);

  v6 = v13;
  self = v15;

  v16 = v15;
LABEL_12:

  return v16;
}

void __37__DAAccountChangeInfo_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  v9[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__oldAccountPropertiesWhitelist;
  initWithCoder__oldAccountPropertiesWhitelist = v2;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5, v8[0]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)initWithCoder__modifiedDataClassesWhitelist;
  initWithCoder__modifiedDataClassesWhitelist = v6;

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "encodeInt:forKey:", -[DAAccountChangeInfo changeType](self, "changeType"), CFSTR("ChangeType"));
  -[DAAccountChangeInfo accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v4, CFSTR("AccountIdentifier"));

  -[DAAccountChangeInfo accountTypeIdentifier](self, "accountTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("AccountTypeIdentifier"));

  -[DAAccountChangeInfo oldAccountProperties](self, "oldAccountProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DAAccountChangeInfo oldAccountProperties](self, "oldAccountProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("OldAccountProperties"));

  }
  -[DAAccountChangeInfo username](self, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DAAccountChangeInfo username](self, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("Username"));

  }
  -[DAAccountChangeInfo password](self, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DAAccountChangeInfo password](self, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v11, CFSTR("Password"));

  }
  -[DAAccountChangeInfo oldUsername](self, "oldUsername");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DAAccountChangeInfo oldUsername](self, "oldUsername");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("OldUsername"));

  }
  -[DAAccountChangeInfo oldPassword](self, "oldPassword");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DAAccountChangeInfo oldPassword](self, "oldPassword");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("OldPassword"));

  }
  -[DAAccountChangeInfo modifiedDataClasses](self, "modifiedDataClasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DAAccountChangeInfo modifiedDataClasses](self, "modifiedDataClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("ModifiedDataClasses"));

  }
  -[DAAccountChangeInfo clientName](self, "clientName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[DAAccountChangeInfo clientName](self, "clientName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("ClientName"));

  }
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "_stringForChangeType:", -[DAAccountChangeInfo changeType](self, "changeType"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo accountIdentifier](self, "accountIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo accountTypeIdentifier](self, "accountTypeIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo oldAccountProperties](self, "oldAccountProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[DAAccountChangeInfo oldAccountProperties](self, "oldAccountProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<keys = %@>"), v17);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("nil");
  }
  -[DAAccountChangeInfo username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo password](self, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("<redacted>");
  if (v8)
    v10 = CFSTR("<redacted>");
  else
    v10 = CFSTR("nil");
  -[DAAccountChangeInfo oldUsername](self, "oldUsername");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo oldPassword](self, "oldPassword");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v9 = CFSTR("nil");
  -[DAAccountChangeInfo modifiedDataClasses](self, "modifiedDataClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo clientName](self, "clientName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<DAAccountChangeInfo: changeType = %@, accountIdentifier = %@, accountTypeIdentifier = %@, oldAccountProperties = %@, username = %@, password = %@, oldUsername = %@, oldPassword = %@, modifiedDataClasses = %@, clientName = %@>"), v20, v22, v21, v6, v7, v10, v11, v9, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {

  }
  return v15;
}

- (id)redactedDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;

  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "_stringForChangeType:", -[DAAccountChangeInfo changeType](self, "changeType"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo accountIdentifier](self, "accountIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo accountTypeIdentifier](self, "accountTypeIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo oldAccountProperties](self, "oldAccountProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v4;
  v24 = (void *)v3;
  v22 = (void *)v5;
  if (v21)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[DAAccountChangeInfo oldAccountProperties](self, "oldAccountProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%d values>"), objc_msgSend(v19, "count"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = CFSTR("nil");
  }
  -[DAAccountChangeInfo username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("<redacted>");
  if (v7)
    v9 = CFSTR("<redacted>");
  else
    v9 = CFSTR("nil");
  -[DAAccountChangeInfo password](self, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("<redacted>");
  else
    v11 = CFSTR("nil");
  -[DAAccountChangeInfo oldUsername](self, "oldUsername");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = CFSTR("<redacted>");
  else
    v13 = CFSTR("nil");
  -[DAAccountChangeInfo oldPassword](self, "oldPassword");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    v8 = CFSTR("nil");
  -[DAAccountChangeInfo modifiedDataClasses](self, "modifiedDataClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAccountChangeInfo clientName](self, "clientName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<DAAccountChangeInfo: changeType = %@, accountIdentifier = %@, accountTypeIdentifier = %@, oldAccountProperties = %@, username = %@, password = %@, oldUsername = %@, oldPassword = %@, modifiedDataClasses = %@, clientName = %@>"), v24, v23, v22, v25, v9, v11, v13, v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {

  }
  return v17;
}

+ (id)_stringForChangeType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Add");
  else
    return off_1E68DBD78[a3 - 1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (NSDictionary)oldAccountProperties
{
  return self->_oldAccountProperties;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)oldUsername
{
  return self->_oldUsername;
}

- (NSString)oldPassword
{
  return self->_oldPassword;
}

- (NSSet)modifiedDataClasses
{
  return self->_modifiedDataClasses;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_modifiedDataClasses, 0);
  objc_storeStrong((id *)&self->_oldPassword, 0);
  objc_storeStrong((id *)&self->_oldUsername, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_oldAccountProperties, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
