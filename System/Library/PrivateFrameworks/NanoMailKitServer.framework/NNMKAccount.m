@implementation NNMKAccount

- (NSString)accountId
{
  NSString *accountId;
  NSString *v3;

  accountId = self->_accountId;
  if (accountId)
  {
    v3 = accountId;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "generateAccountIdForAccount:", self);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_defaultEmailAddress, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_parentAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_localId, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (void)setTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_typeIdentifier, a3);
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (void)setShouldArchive:(BOOL)a3
{
  self->_shouldArchive = a3;
}

- (void)setPccEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_pccEmailAddress, a3);
}

- (void)setParentAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentAccountIdentifier, a3);
}

- (void)setLocalId:(id)a3
{
  objc_storeStrong((id *)&self->_localId, a3);
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (void)setEmailAddressToken:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddressToken, a3);
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)setDefaultEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)localId
{
  NSString *localId;

  localId = self->_localId;
  if (localId)
    return localId;
  else
    return (NSString *)&stru_24F9F9D80;
}

+ (id)generateAccountIdForAccount:(id)a3
{
  return (id)objc_msgSend(a3, "localId");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKAccount)initWithCoder:(id)a3
{
  id v4;
  NNMKAccount *v5;
  uint64_t v6;
  NSString *accountId;
  uint64_t v8;
  NSString *localId;
  uint64_t v10;
  NSString *displayName;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *emailAddresses;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *mailboxes;
  uint64_t v24;
  NSString *username;
  void *v26;
  uint64_t v27;
  NSString *defaultEmailAddress;
  uint64_t v29;
  NSString *typeIdentifier;
  objc_super v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NNMKAccount;
  v5 = -[NNMKAccount init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyAccountId"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyLocalId"));
    v8 = objc_claimAutoreleasedReturnValue();
    localId = v5->_localId;
    v5->_localId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyDisplayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyShouldArchive"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldArchive = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySourceType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceType = objc_msgSend(v13, "unsignedIntegerValue");

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("kNSCodingKeyEmailAddresses"));
    v17 = objc_claimAutoreleasedReturnValue();
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("kNSCodingKeyMailboxes"));
    v22 = objc_claimAutoreleasedReturnValue();
    mailboxes = v5->_mailboxes;
    v5->_mailboxes = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyUsername"));
    v24 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyStandaloneState"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_standaloneState = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyDefaultEmailAddress"));
    v27 = objc_claimAutoreleasedReturnValue();
    defaultEmailAddress = v5->_defaultEmailAddress;
    v5->_defaultEmailAddress = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyTypeIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NNMKAccount accountId](self, "accountId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("kNSCodingKeyAccountId"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_localId, CFSTR("kNSCodingKeyLocalId"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_displayName, CFSTR("kNSCodingKeyDisplayName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldArchive);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("kNSCodingKeyShouldArchive"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sourceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeySourceType"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_emailAddresses, CFSTR("kNSCodingKeyEmailAddresses"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_mailboxes, CFSTR("kNSCodingKeyMailboxes"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_username, CFSTR("kNSCodingKeyUsername"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_standaloneState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kNSCodingKeyStandaloneState"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_defaultEmailAddress, CFSTR("kNSCodingKeyDefaultEmailAddress"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_typeIdentifier, CFSTR("kNSCodingKeyTypeIdentifier"));

}

+ (id)inboxesFromAccounts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "mailboxes", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if (objc_msgSend(v16, "type") == 1)
                objc_msgSend(v4, "addObject:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)generateIdentifierFromEmailsAddresses:(id)a3
{
  return (id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR("#"));
}

- (BOOL)maySupportStandaloneMode
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NNMKAccount emailAddresses](self, "emailAddresses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "lowercaseString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "containsString:", CFSTR("@gmail.com"));

        if ((v8 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)supportsCloudNotifications
{
  return -[NNMKAccount _isHotmail](self, "_isHotmail") || -[NNMKAccount _isGmail](self, "_isGmail");
}

- (BOOL)areStandaloneNotificationsEnabledWithCloudNotificationsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[NNMKAccount typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[NNMKAccount _isiCloud](self, "_isiCloud"))
    {
      return 1;
    }
    else if (-[NNMKAccount _isHotmail](self, "_isHotmail"))
    {
      return v3;
    }
    else
    {
      v6 = 0;
      if (-[NNMKAccount _isGmail](self, "_isGmail") && v3)
      {
        -[NNMKAccount emailAddressToken](self, "emailAddressToken");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v8 != 0;

      }
    }
  }
  else
  {
    v7 = (void *)__logCategories;
    if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR))
      -[NNMKAccount areStandaloneNotificationsEnabledWithCloudNotificationsEnabled:].cold.1(v7, self);
    return 0;
  }
  return v6;
}

- (BOOL)_isiCloud
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[NNMKAccount typeIdentifier](self, "typeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4090]);

  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NNMKAccount emailAddresses](self, "emailAddresses", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if (+[NNMKAccount isiCloudEmailAddress:](NNMKAccount, "isiCloudEmailAddress:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)isiCloudEmailAddress:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsString:", CFSTR("@me.com")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsString:", CFSTR("@icloud.com")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "containsString:", CFSTR("@mac.com"));

    }
  }

  return v5;
}

- (BOOL)_isGmail
{
  void *v2;
  char v3;

  -[NNMKAccount typeIdentifier](self, "typeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB4068]);

  return v3;
}

- (BOOL)_isHotmail
{
  void *v2;
  char v3;

  -[NNMKAccount typeIdentifier](self, "typeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB4078]);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;

  v6 = a3;
  -[NNMKAccount accountId](self, "accountId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    -[NNMKAccount accountId](self, "accountId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v4))
    {
      v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v10 = -[NNMKAccount sourceType](self, "sourceType");
  v9 = v10 == objc_msgSend(v6, "sourceType");
  if (v7 != v8)
    goto LABEL_5;
LABEL_6:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NNMKAccount accountId](self, "accountId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Id: %@, Display Name: %@, Should Archive: %d, Email Addresses: %@, Parent Id: %@, Standalone state: %lu]"), v4, self->_displayName, self->_shouldArchive, self->_emailAddresses, self->_parentAccountIdentifier, self->_standaloneState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)parentAccountIdentifier
{
  return self->_parentAccountIdentifier;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)shouldArchive
{
  return self->_shouldArchive;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)defaultEmailAddress
{
  return self->_defaultEmailAddress;
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (unint64_t)standaloneState
{
  return self->_standaloneState;
}

- (void)setStandaloneState:(unint64_t)a3
{
  self->_standaloneState = a3;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxes, a3);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, a3, (uint64_t)a3, "NNMKAccount entity is unable to decode some of the fields (possible Message.framework API changes): %{public}@", (uint8_t *)a2);

}

- (void)areStandaloneNotificationsEnabledWithCloudNotificationsEnabled:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v3, v5, "Missing typeIdentifier for accountId: %{public}@", (uint8_t *)&v6);

}

@end
