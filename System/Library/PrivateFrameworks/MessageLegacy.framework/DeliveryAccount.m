@implementation DeliveryAccount

+ (id)existingAccountWithIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)_deliveryAccounts;
  v5 = objc_msgSend((id)_deliveryAccounts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend((id)objc_msgSend(v9, "identifier"), "isEqualToString:", a3) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  return v9;
}

- (id)identifier
{
  NSString *v3;

  v3 = -[MFAccount hostname](self, "hostname");
  if (-[MFAccount username](self, "username"))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v3, -[MFAccount username](self, "username"));
  else
    return v3;
}

+ (id)existingAccountForUniqueID:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)_deliveryAccounts;
  v5 = objc_msgSend((id)_deliveryAccounts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend((id)objc_msgSend(v9, "uniqueId"), "isEqualToString:", a3) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  return v9;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F138];
}

+ (void)_postDeliveryAccountsHaveChanged
{
  id v2;
  void *v3;
  id v4;

  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  v4 = (id)objc_msgSend(v2, "initWithArray:", _deliveryAccounts);
  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("DeliveryAccountsDidChange"), v4, 0));

}

+ (void)reloadDeliveryAccounts
{
  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");

  _deliveryAccounts = 0;
  getDeliveryAccounts();
  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  objc_msgSend(a1, "_postDeliveryAccountsHaveChanged");
}

+ (id)deliveryAccounts
{
  id v2;

  +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
  v2 = (id)objc_msgSend((id)getDeliveryAccounts(), "copy");
  +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  return v2;
}

+ (void)addDeliveryAccount:(id)a3
{
  if (a3)
  {
    +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
    objc_msgSend((id)getDeliveryAccounts(), "addObject:", a3);
    objc_msgSend(a3, "savePersistentAccount");
    +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");
  }
}

+ (void)removeDeliveryAccount:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("DeliveryAccountWillBeRemoved"), a3);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      objc_msgSend(v4, "postNotification:", v3);
    else
      objc_msgSend(v4, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v3, 0);
    v5 = a3;
    +[DeliveryAccount mf_lock](DeliveryAccount, "mf_lock");
    objc_msgSend((id)getDeliveryAccounts(), "removeObject:", a3);
    objc_msgSend(a3, "removePersistentAccount");
    +[DeliveryAccount mf_unlock](DeliveryAccount, "mf_unlock");

  }
}

+ (id)accountWithUniqueId:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "deliveryAccounts");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(v9, "uniqueId")) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

+ (id)accountWithIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "deliveryAccounts");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend((id)objc_msgSend(v9, "identifier"), "isEqualToString:", a3) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

+ (id)existingAccountWithHostname:(id)a3 username:(id)a4
{
  if (a4 && (objc_msgSend(a4, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
    a3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
  return (id)objc_msgSend(a1, "accountWithIdentifier:", a3);
}

+ (id)accountWithHostname:(id)a3 username:(id)a4
{
  return (id)objc_msgSend(a1, "accountWithHostname:username:lookForExistingAccounts:", a3, a4, 1);
}

+ (id)accountWithHostname:(id)a3 username:(id)a4 lookForExistingAccounts:(BOOL)a5
{
  void *v8;

  if (!a5 || (v8 = (void *)objc_msgSend(a1, "existingAccountWithHostname:username:", a3, a4)) == 0)
  {
    v8 = (void *)objc_msgSend(a1, "newAccountWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionary"));
    objc_msgSend(v8, "setHostname:", a3);
    objc_msgSend(v8, "setUsername:", a4);
    objc_msgSend(v8, "_updateAccountDescriptionWithUsername:hostname:", a4, a3);
    +[DeliveryAccount addDeliveryAccount:](DeliveryAccount, "addDeliveryAccount:", v8);

  }
  return v8;
}

+ (id)carrierDeliveryAccount
{
  return 0;
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
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithMessage:", a3);
  objc_msgSend(v4, "setAccount:", self);
  return v4;
}

- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  void *v6;

  v6 = (void *)objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:mixedContent:textPartsAreHTML:", a3, a4, a5);
  objc_msgSend(v6, "setAccount:", self);
  return v6;
}

- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  void *v8;

  v8 = (void *)objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:HTML:plainTextAlternative:other:charsets:", a3, a4, a5, a6, a7);
  objc_msgSend(v8, "setAccount:", self);
  return v8;
}

- (BOOL)shouldUseAuthentication
{
  NSString *v3;
  char v4;

  v3 = -[MFAccount username](self, "username");
  v4 = objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("ShouldUseAuthentication")), "BOOLValue");
  if (v3)
    return v4 & ~-[NSString isEqualToString:](v3, "isEqualToString:", &stru_1E81CBE50);
  else
    return 0;
}

- (void)setShouldUseAuthentication:(BOOL)a3
{
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("ShouldUseAuthentication"));
}

- (void)setUsername:(id)a3
{
  objc_super v5;

  -[DeliveryAccount setShouldUseAuthentication:](self, "setShouldUseAuthentication:", objc_msgSend(a3, "length") != 0);
  v5.receiver = self;
  v5.super_class = (Class)DeliveryAccount;
  -[MFAccount setUsername:](&v5, sel_setUsername_, a3);
  -[DeliveryAccount _updateAccountDescriptionWithUsername:hostname:](self, "_updateAccountDescriptionWithUsername:hostname:", a3, -[MFAccount hostname](self, "hostname"));
}

- (void)_setAccountProperties:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeliveryAccount;
  -[MFAccount _setAccountProperties:](&v7, sel__setAccountProperties_);
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("Username"));
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("Hostname"));
  if (v5 | v6)
    -[DeliveryAccount _updateAccountDescriptionWithUsername:hostname:](self, "_updateAccountDescriptionWithUsername:hostname:", v5, v6);
}

- (unint64_t)maximumMessageBytes
{
  return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("MaxMessageBytes")), "unsignedLongLongValue");
}

- (void)setMaximumMessageBytes:(unint64_t)a3
{
  if (-[DeliveryAccount maximumMessageBytes](self, "maximumMessageBytes") != a3)
  {
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3), CFSTR("MaxMessageBytes"));
    -[MFAccount savePersistentAccount](self, "savePersistentAccount");
  }
}

- (id)mailAccountIfAvailable
{
  return 0;
}

- (BOOL)hasNoReferences
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = -[DeliveryAccount identifier](self, "identifier");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = +[MailAccount mailAccounts](MailAccount, "mailAccounts", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "deliveryAccount"), "identifier"), "isEqualToString:", v2) & 1) != 0)return 0;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
  return 1;
}

- (BOOL)canBeFallbackAccount
{
  return 1;
}

- (BOOL)hasEnoughInformationForEasySetup
{
  NSUInteger v3;

  v3 = -[NSString length](-[MFAccount hostname](self, "hostname"), "length");
  if (v3)
    LOBYTE(v3) = -[NSString length](-[MFAccount username](self, "username"), "length") != 0;
  return v3;
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
  ACAccount *v6;
  ACAccount *v7;
  id v8;
  id v9;
  id v10;

  v6 = -[MFAccount persistentAccount](self, "persistentAccount");
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(a3, "length"))
    {
      if (objc_msgSend(a3, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(a4, "length"))
        {
          v8 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%@"), a3, a4);
LABEL_11:
          v10 = v8;
LABEL_13:
          -[ACAccount setAccountDescription:](v7, "setAccountDescription:", v10);
          return;
        }
LABEL_12:
        v10 = 0;
        goto LABEL_13;
      }
      v9 = a3;
    }
    else
    {
      if (!objc_msgSend(a4, "length"))
        goto LABEL_12;
      v9 = a4;
    }
    v8 = (id)objc_msgSend(v9, "copy");
    goto LABEL_11;
  }
}

@end
