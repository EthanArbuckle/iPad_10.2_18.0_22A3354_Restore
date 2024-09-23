@implementation DeliveryAccount

+ (void)_postDeliveryAccountsHaveChanged
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  v5 = (id)objc_msgSend(v2, "initWithArray:", sDeliveryAccounts);
  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("DeliveryAccountsDidChange"), v5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotification:", v4);

}

+ (void)reloadDeliveryAccounts
{
  void *v3;
  id v4;

  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v3 = (void *)sDeliveryAccounts;
  sDeliveryAccounts = 0;

  v4 = getDeliveryAccounts();
  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  objc_msgSend(a1, "_postDeliveryAccountsHaveChanged");
}

+ (id)existingAccountForUniqueID:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)sDeliveryAccounts;
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "uniqueID", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if (v10)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  return v5;
}

- (unint64_t)maximumMessageBytes
{
  void *v2;
  unint64_t v3;

  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("MaxMessageBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

+ (DeliveryAccount)accountWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "deliveryAccounts");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (DeliveryAccount *)v6;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MFAccount hostname](self, "hostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[MFAccount username](self, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v3, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v3;
  }

  return (NSString *)v7;
}

+ (id)deliveryAccounts
{
  void *v2;
  void *v3;

  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  getDeliveryAccounts();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  return v3;
}

+ (id)existingAccountWithIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)sDeliveryAccounts;
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "identifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if (v10)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  return v5;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F138];
}

+ (void)addDeliveryAccount:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (v4)
  {
    +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
    getDeliveryAccounts();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);
    objc_msgSend(v4, "savePersistentAccount");
    +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");

  }
}

+ (void)removeDeliveryAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("DeliveryAccountWillBeRemoved"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v6 = v5;
    v11 = v6;
    v7 = v4;
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v10, 3221225472, __41__DeliveryAccount_removeDeliveryAccount___block_invoke, &unk_1E4E88EE8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performBlock:", &v10);

    +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
    getDeliveryAccounts();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v3);
    objc_msgSend(v3, "removePersistentAccount");
    +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");

  }
}

uint64_t __41__DeliveryAccount_removeDeliveryAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotification:", *(_QWORD *)(a1 + 40));
}

+ (DeliveryAccount)accountWithUniqueId:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "deliveryAccounts");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (DeliveryAccount *)v6;
}

+ (id)existingAccountWithHostname:(id)a3 username:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (v7)
  {
    v9 = v8;
    if ((objc_msgSend(v7, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v8, v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
  }
  objc_msgSend(a1, "accountWithIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (DeliveryAccount)accountWithHostname:(id)a3 username:(id)a4
{
  objc_msgSend(a1, "accountWithHostname:username:lookForExistingAccounts:", a3, a4, 1);
  return (DeliveryAccount *)(id)objc_claimAutoreleasedReturnValue();
}

+ (DeliveryAccount)accountWithHostname:(id)a3 username:(id)a4 lookForExistingAccounts:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!v5
    || (objc_msgSend(a1, "existingAccountWithHostname:username:", v8, v9),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(a1, "newAccountWithDictionary:", v11);

    objc_msgSend(v10, "setHostname:", v8);
    objc_msgSend(v10, "setUsername:", v9);
    objc_msgSend(v10, "_updateAccountDescriptionWithUsername:hostname:", v9, v8);
    +[DeliveryAccount addDeliveryAccount:](DeliveryAccount, "addDeliveryAccount:", v10);
  }

  return (DeliveryAccount *)v10;
}

+ (id)carrierDeliveryAccount
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copyCarrierBundleValue:", CFSTR("SMTPServers"));

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR(":"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v5;
      v8 = 0xFFFFFFFFLL;
    }
    else
    {
      objc_msgSend(v5, "substringToIndex:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "substringFromIndex:", v6 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
        v8 = objc_msgSend(v11, "intValue");
      else
        v8 = 0xFFFFFFFFLL;

      v7 = (id)v10;
    }
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(a1, "newAccountWithDictionary:", v12);

      objc_msgSend(v9, "setHostname:", v7);
      if ((int)v8 >= 1)
        objc_msgSend(v9, "setPortNumber:", v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newDefaultInstance
{
  return 0;
}

- (Class)deliveryClass
{
  return 0;
}

- (id)newDeliveryWithMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithMessage:", v4);
  objc_msgSend(v5, "setAccount:", self);

  return v5;
}

- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:mixedContent:textPartsAreHTML:", v8, v9, v5);
  objc_msgSend(v10, "setAccount:", self);

  return v10;
}

- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:HTML:plainTextAlternative:other:", v10, v11, v12, v13);
  objc_msgSend(v14, "setAccount:", self);

  return v14;
}

- (BOOL)shouldUseAuthentication
{
  void *v3;
  void *v4;
  int v5;
  unsigned int v6;

  -[MFAccount username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("ShouldUseAuthentication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v3)
    v6 = v5 & ~objc_msgSend(v3, "isEqualToString:", &stru_1E4F1C8F8);
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (void)setShouldUseAuthentication:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:");

}

- (void)setUsername:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[DeliveryAccount setShouldUseAuthentication:](self, "setShouldUseAuthentication:", objc_msgSend(v4, "length") != 0);
  v6.receiver = self;
  v6.super_class = (Class)DeliveryAccount;
  -[MFAccount setUsername:](&v6, sel_setUsername_, v4);
  -[MFAccount hostname](self, "hostname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeliveryAccount _updateAccountDescriptionWithUsername:hostname:](self, "_updateAccountDescriptionWithUsername:hostname:", v4, v5);

}

- (void)_setAccountProperties:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DeliveryAccount;
  -[MFAccount _setAccountProperties:](&v7, sel__setAccountProperties_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("Username"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Hostname"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6)
    -[DeliveryAccount _updateAccountDescriptionWithUsername:hostname:](self, "_updateAccountDescriptionWithUsername:hostname:", v5, v6);

}

- (void)setMaximumMessageBytes:(unint64_t)a3
{
  void *v5;

  if (-[DeliveryAccount maximumMessageBytes](self, "maximumMessageBytes") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("MaxMessageBytes"));

    -[MFAccount savePersistentAccount](self, "savePersistentAccount");
  }
}

- (id)mailAccountIfAvailable
{
  return 0;
}

- (BOOL)hasNoReferences
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[DeliveryAccount identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[MailAccount mailAccounts](MailAccount, "mailAccounts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "deliveryAccount");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v7) = objc_msgSend(v8, "isEqualToString:", v2);
        if ((v7 & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)canBeFallbackAccount
{
  return 1;
}

- (BOOL)hasEnoughInformationForEasySetup
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[MFAccount hostname](self, "hostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  -[MFAccount username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  return v6;
}

- (BOOL)supportsOutboxCopy
{
  return 0;
}

- (BOOL)shouldUseSaveSentForAccount:(id)a3
{
  return 0;
}

- (void)_updateAccountDescriptionWithUsername:(id)a3 hostname:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v13, "length"))
    {
      v8 = objc_msgSend(v13, "rangeOfString:", CFSTR("@"));
      v9 = v13;
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v6, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%@"), v13, v6);
          v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
          v12 = (void *)v10;
LABEL_10:
          objc_msgSend(v7, "setAccountDescription:", v12);

          goto LABEL_11;
        }
LABEL_9:
        v12 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      v11 = objc_msgSend(v6, "length");
      v9 = v6;
      if (!v11)
        goto LABEL_9;
    }
    v10 = objc_msgSend(v9, "copy");
    goto LABEL_8;
  }
LABEL_11:

}

@end
