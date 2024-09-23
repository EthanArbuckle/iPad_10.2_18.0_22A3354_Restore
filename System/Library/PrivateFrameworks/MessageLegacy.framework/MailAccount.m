@implementation MailAccount

+ (id)accountContainingEmailAddress:(id)a3
{
  return (id)objc_msgSend(a1, "_accountContainingEmailAddress:matchingAddress:fullUserName:includingInactive:", a3, 0, 0, 0);
}

+ (void)reloadAccounts
{
  void *v3;
  id v4;

  objc_msgSend(a1, "disableMailboxListingNotifications");
  +[MailAccount mf_lock](MailAccount, "mf_lock");

  _lastAccountsReloadDate = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = 0;
  v3 = (void *)objc_msgSend((id)objc_msgSend(a1, "_loadAllAccountsWithOptions:error:", __mailAccountLoadOptions, &v4), "mutableCopy");
  if (v4 != (id)_lastAccountsReloadError)
  {

    _lastAccountsReloadError = (uint64_t)v4;
  }
  if (v3)
  {
    objc_msgSend(a1, "_setMailAccounts:saveIfChanged:alreadyLocked:", v3, 0, 1);

  }
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  objc_msgSend(a1, "enableMailboxListingNotifications:", 0);
}

+ (id)URLForInfo:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "objectForKey:", CFSTR("Account"));
  if (result)
    return (id)objc_msgSend(result, "_URLForInfo:", a3);
  return result;
}

- (void)releaseAllConnections
{
  objc_msgSend(-[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0), "releaseAllConnections");
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  id result;

  v3 = a3;
  result = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPIdentifier"));
  if (result)
  {
    if (v3)
      return +[DeliveryAccount accountWithIdentifier:](DeliveryAccount, "accountWithIdentifier:", result);
    else
      return +[DeliveryAccount existingAccountWithIdentifier:](DeliveryAccount, "existingAccountWithIdentifier:", result);
  }
  return result;
}

uint64_t __39__MailAccount_activeAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

- (BOOL)_resetSpecialMailboxes
{
  int v3;
  _BOOL4 v4;
  int v5;
  uint64_t v6;
  int v7;
  _BOOL8 v8;
  int v9;
  int v11;

  -[MailAccount mf_lock](self, "mf_lock");
  v3 = (self->_inboxMailboxUid != 0) | (2 * (self->_draftsMailboxUid != 0)) | (4
                                                                                 * (self->_sentMessagesMailboxUid != 0)) | (8 * (self->_trashMailboxUid != 0)) | (16 * (self->_archiveMailboxUid != 0));
  v4 = self->_junkMailboxUid != 0;
  -[MailAccount mf_unlock](self, "mf_unlock");
  v5 = objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationAreEnabled");
  if (v5)
    objc_msgSend((id)objc_opt_class(), "disableMailboxListingNotifications");
  v6 = 0;
  v7 = 0;
  v11 = v3 | (32 * v4);
  do
  {
    v7 |= -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", -[MailAccount _specialMailboxUidWithType:create:](self, "_specialMailboxUidWithType:create:", dword_1C88A3698[v6], 0), dword_1C88A3698[v6]);
    ++v6;
  }
  while (v6 != 6);
  if ((v7 & 1) != 0)
  {
    v8 = 1;
    if (!v5)
      return v8;
    goto LABEL_9;
  }
  -[MailAccount mf_lock](self, "mf_lock");
  v9 = (self->_inboxMailboxUid != 0) | (2 * (self->_draftsMailboxUid != 0)) | (4
                                                                                 * (self->_sentMessagesMailboxUid != 0)) | (8 * (self->_trashMailboxUid != 0)) | (16 * (self->_archiveMailboxUid != 0)) | (32 * (self->_junkMailboxUid != 0));
  -[MailAccount mf_unlock](self, "mf_unlock");
  v8 = v11 != v9;
  if (v5)
LABEL_9:
    objc_msgSend((id)objc_opt_class(), "enableMailboxListingNotifications:", v8);
  return v8;
}

- (BOOL)_assignSpecialMailboxToAppropriateIvar:(id)a3 forType:(int)a4
{
  uint64_t v4;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;

  v4 = *(_QWORD *)&a4;
  v7 = -[MailAccount _specialMailboxIvarOfType:](self, "_specialMailboxIvarOfType:", *(_QWORD *)&a4);
  -[MFLock lock](self->_cachedMailboxenLock, "lock");
  if (v7)
  {
    v8 = *v7;
    if (*v7 == a3)
    {
      -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
      return 0;
    }
    objc_msgSend(*v7, "setType:", 0);
    objc_msgSend(v8, "setRepresentedAccount:", 0);
    objc_msgSend(a3, "setType:", v4);
    v9 = (void *)objc_msgSend(v8, "parent");
    v10 = (void *)objc_msgSend(a3, "parent");
    *v7 = a3;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
  v11 = v8 == a3;
  v12 = v8 != a3;
  if (!v11)

  -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
  if (v10)
    objc_msgSend((id)objc_msgSend(v10, "account"), "_setChildren:forMailboxUid:", 0, v10);
  if (v9 && v10 != v9)
    objc_msgSend((id)objc_msgSend(v9, "account"), "_setChildren:forMailboxUid:", 0, v9);
  return v12;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4
{
  return -[MailAccount mailboxUidForRelativePath:create:withOption:](self, "mailboxUidForRelativePath:create:withOption:", a3, a4, 0);
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int)a5
{
  uint64_t v5;
  _BOOL4 v6;
  void *v8;
  unint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v22;
  _QWORD v23[2];

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "pathComponents");
  v9 = objc_msgSend(v8, "count");
  v10 = -[MailAccount rootMailboxUid](self, "rootMailboxUid");
  -[MailAccount mf_lock](self, "mf_lock");
  v11 = 0;
  if (!v10 || !v9)
    goto LABEL_29;
  v22 = 0;
  v11 = 0;
  v12 = 1;
  do
  {
    v13 = (void *)objc_msgSend(v8, "objectAtIndex:", v12 - 1);
    if (v9 == v12
      && objc_msgSend(v13, "hasSuffix:", -[MailAccount mailboxPathExtension](self, "mailboxPathExtension")))
    {
      v13 = (void *)objc_msgSend(v13, "stringByDeletingPathExtension");
    }
    v14 = -[MailAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", v13);
    v15 = -[MailAccount _childOfMailbox:withComponentName:](self, "_childOfMailbox:withComponentName:", v10, v14);
    if (v15 || !v6)
    {
      v10 = v15;
      if (!v15)
        break;
      continue;
    }
    -[MailAccount mf_unlock](self, "mf_unlock");
    if (v9 == v12)
      v16 = 257;
    else
      v16 = 258;
    v17 = -[MailAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:](self, "_newMailboxWithParent:name:attributes:dictionary:withCreationOption:", v10, v14, v16, 0, v5);
    -[MailAccount mf_lock](self, "mf_lock");
    v18 = -[MailAccount _childOfMailbox:withComponentName:](self, "_childOfMailbox:withComponentName:", v10, v14);
    v19 = v18;
    if (v17)
    {
      if (!v18)
      {
        if (v22)
        {
          v23[0] = v17;
          objc_msgSend(v10, "setChildren:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1));
        }
        else
        {
          v11 = (id)objc_msgSend(v10, "mutableCopyOfChildren");
          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v11, "addObject:", v17);
          v22 = v10;
        }
        v19 = v17;
        ++*(_WORD *)&self->_flags;
      }

    }
    v10 = v19;
    if (!v19)
      break;
  }
  while (v12++ < v9);
  if (v10 && v22)
  {
    -[MailAccount mf_unlock](self, "mf_unlock");
    -[MailAccount _setChildren:forMailboxUid:](self, "_setChildren:forMailboxUid:", v11, v22);
    -[MailAccount mf_lock](self, "mf_lock");
  }
LABEL_29:
  -[MailAccount mf_unlock](self, "mf_unlock");

  return v10;
}

- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4
{
  id result;

  result = (id)objc_msgSend(a3, "childWithName:", a4);
  if (!result)
    return (id)objc_msgSend(a3, "childWithExtraAttribute:", a4);
  return result;
}

- (id)_specialMailboxUidWithType:(int)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[MailAccount specialMailboxNameForType:](self, "specialMailboxNameForType:");
  if (!v7)
  {
    v7 = -[MailAccount _defaultSpecialMailboxNameForType:](self, "_defaultSpecialMailboxNameForType:", v5);
    -[MailAccount _setSpecialMailboxName:forType:](self, "_setSpecialMailboxName:forType:", v7, v5);
  }
  return -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", v7, v4);
}

- (id)specialMailboxNameForType:(int)a3
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", off_1E81CA548[a3 - 1]);
}

- (id)_uidNameForPathComponent:(id)a3
{
  return a3;
}

+ (void)enableMailboxListingNotifications:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  _MFLockGlobalLock();
  _disableMailboxListingNotifications = 0;
  _MFUnlockGlobalLock();
  if (v3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), 0, 0);
}

+ (id)addressesThatReceivedMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "headersIfAvailable");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_msgSend(v4, "copyAddressListForTo");
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v4, "copyAddressListForCc");
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v5);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "mf_uncommentedAddress");
        if (objc_msgSend(a1, "_accountContainingEmailAddress:matchingAddress:fullUserName:includingInactive:", v13, 0, 0, 0))
        {
          objc_msgSend(v6, "addObject:", v13);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

+ (id)_accountContainingEmailAddress:(id)a3 matchingAddress:(id *)a4 fullUserName:(id *)a5 includingInactive:(BOOL)a6
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  id *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a3, "mf_uncommentedAddress");
  v9 = (void *)objc_msgSend(a3, "mf_addressComment");
  if ((objc_msgSend(v9, "isEqualToString:", &stru_1E81CBE50) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", a3))
  {
    v9 = 0;
  }
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)_accounts;
  v10 = objc_msgSend((id)_accounts, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  v11 = 0;
  if (v10)
  {
    v28 = 0;
    v29 = a4;
    v25 = *(_QWORD *)v36;
LABEL_6:
    v12 = 0;
    v24 = v10;
    while (1)
    {
      if (*(_QWORD *)v36 != v25)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
      v27 = v12;
      if (a6 || objc_msgSend(v13, "isActive"))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "emailAddressesAndAliasesList"), "mf_uncommentedAddressList");
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v14);
              v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (!objc_msgSend(v18, "caseInsensitiveCompare:", v8))
              {
                v19 = objc_msgSend(v13, "fullUserName");
                v20 = (void *)v19;
                if (v9 && (!v19 || objc_msgSend(v9, "caseInsensitiveCompare:", v19)))
                {
                  v28 = v13;
                }
                else
                {
                  if (v29)
                    *v29 = v18;
                  if (a5 && v20 && (objc_msgSend(v20, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
                    *a5 = v20;
                  v11 = v13;
                  if ((objc_msgSend(v13, "isActive") & 1) != 0)
                  {
                    v11 = v13;
                    goto LABEL_32;
                  }
                }
              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v15)
              continue;
            break;
          }
        }
      }
LABEL_32:
      if ((objc_msgSend(v11, "isActive") & 1) != 0)
        break;
      v12 = v27 + 1;
      if (v27 + 1 == v24)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v10)
          goto LABEL_6;
        break;
      }
    }
  }
  else
  {
    v28 = 0;
  }
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  if (v28)
    v21 = v11 == 0;
  else
    v21 = 0;
  if (v21)
    return v28;
  else
    return v11;
}

- (id)emailAddressesDictionary
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("EmailAddresses"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(", "));
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_4:
    if (v2)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v11;
        v7 = MEMORY[0x1E0C9AAB0];
        while (1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v2);
          objc_msgSend(v3, "addObject:", v7);
          if (!--v5)
          {
            v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
            if (!v5)
              break;
          }
        }
      }
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v3, v2);
    }
    return v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v2;
      _os_log_impl(&dword_1C8839000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Returned unhandled email addresses %@", buf, 0xCu);
    }
    return 0;
  }
  return v2;
}

- (BOOL)isActive
{
  return -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", -[MFAccount persistentAccount](self, "persistentAccount"));
}

- (BOOL)isActiveWithPersistentAccount:(id)a3
{
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]);
  if ((v4 & 1) == 0 && __dataclassesConsideredActive)
  {
    objc_msgSend((id)__dataclassesConsideredActiveLock, "lock");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)__dataclassesConsideredActive;
    v6 = objc_msgSend((id)__dataclassesConsideredActive, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(a3, "isEnabledForDataclass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
          {
            v4 = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
    v4 = 0;
LABEL_13:
    objc_msgSend((id)__dataclassesConsideredActiveLock, "unlock");
  }
  return v4;
}

+ (void)disableMailboxListingNotifications
{
  _MFLockGlobalLock();
  _disableMailboxListingNotifications = 1;
  _MFUnlockGlobalLock();
}

- (id)fullUserName
{
  return -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("FullUserName"));
}

- (void)_setSpecialMailboxName:(id)a3 forType:(int)a4
{
  int v7;

  _MFLockGlobalLock();
  v7 = a4 - 1;
  if ((a4 - 1) <= 4)
  {
    if (a3)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, off_1E81CA548[v7]);
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", off_1E81CA548[v7]);
  }
  _MFUnlockGlobalLock();
}

- (void)saveState
{
  if (self->_flags)
    -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
}

- (id)_defaultSpecialMailboxNameForType:(int)a3
{
  if ((a3 - 1) > 6)
    return 0;
  else
    return off_1E81CA4D8[a3 - 1];
}

- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3
{
  return 0;
}

- (id)displayName
{
  id v3;
  id v4;
  objc_super v6;

  v3 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("DisplayName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = -[MailAccount firstEmailAddress](self, "firstEmailAddress");
    if (v4)
    {
      v3 = v4;
      _MFLockGlobalLock();
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v3, CFSTR("DisplayName"));
      _MFUnlockGlobalLock();
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MailAccount;
      return -[MFAccount displayName](&v6, sel_displayName);
    }
  }
  return v3;
}

- (id)_pathComponentForUidName:(id)a3
{
  return a3;
}

+ (void)_addAccountToSortedPaths:(id)a3
{
  void *v4;
  void *v5;
  const void *v6;
  const __CFArray *v7;
  CFIndex v8;
  const __CFArray *v9;
  CFIndex v10;
  const __CFArray *v11;
  CFIndex v12;
  CFRange v13;
  CFRange v14;
  CFRange v15;

  v4 = (void *)objc_msgSend(a3, "path");
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("~")))
  {
    v5 = (void *)objc_msgSend(v4, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  }
  else
  {
    v5 = v4;
    v4 = (void *)objc_msgSend(a3, "tildeAbbreviatedPath");
  }
  v6 = (const void *)objc_msgSend(v5, "mf_betterStringByResolvingSymlinksInPath");
  v7 = (const __CFArray *)_sortedAccountPaths;
  v13.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
  v13.location = 0;
  v8 = CFArrayBSearchValues(v7, v13, v5, (CFComparatorFunction)MEMORY[0x1E0C98F10], 0);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v8, v5);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v8, a3);
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    v9 = (const __CFArray *)_sortedAccountPaths;
    v14.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
    v14.location = 0;
    v10 = CFArrayBSearchValues(v9, v14, v4, (CFComparatorFunction)MEMORY[0x1E0C98F10], 0);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v10, v4);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v10, a3);
  }
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    v11 = (const __CFArray *)_sortedAccountPaths;
    v15.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
    v15.location = 0;
    v12 = CFArrayBSearchValues(v11, v15, v6, (CFComparatorFunction)MEMORY[0x1E0C98F10], 0);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v12, v6);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v12, a3);
  }
}

- (id)path
{
  id result;
  NSString *v4;

  if (!self->_path)
    -[MailAccount setPath:](self, "setPath:", objc_msgSend((id)objc_opt_class(), "defaultPathForAccountWithHostname:username:", -[MFAccount hostname](self, "hostname"), -[MFAccount username](self, "username")));
  if (!__globalPathSwitch)
    return self->_path;
  result = self->_nonPersistentPath;
  if (!result)
  {
    v4 = (NSString *)objc_msgSend((id)__globalPathSwitch, "stringByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "defaultPathNameForAccountWithHostname:username:", -[MFAccount hostname](self, "hostname"), -[MFAccount username](self, "username")));
    self->_nonPersistentPath = v4;
    result = -[NSString mf_betterStringByResolvingSymlinksInPath](v4, "mf_betterStringByResolvingSymlinksInPath");
    self->_nonPersistentPath = (NSString *)result;
  }
  return result;
}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;

  v7 = (void *)objc_msgSend(a4, "mutableCopyOfChildren");
  v8 = v7;
  if (a3)
  {
    v9 = a3;
    if (!objc_msgSend(a4, "setChildren:", a3))
    {
      v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    a3 = v7;
    if (a3)
      objc_msgSend(a4, "setChildren:", a3);
  }
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0
    && objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationAreEnabled"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v11, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, CFSTR("OldChildren"), a3, CFSTR("NewChildren"), 0)));
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (id)mailboxUidForURL:(id)a3
{
  if (-[MailAccount ownsMailboxUidWithURL:](self, "ownsMailboxUidWithURL:"))
    return -[MailAccount mailboxUidForInfo:](self, "mailboxUidForInfo:", -[MailAccount _infoForMatchingURL:](self, "_infoForMatchingURL:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3)));
  else
    return 0;
}

- (BOOL)ownsMailboxUidWithURL:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", -[MailAccount URLString](self, "URLString"));
}

- (id)URLString
{
  return (id)objc_msgSend(-[MailAccount _URLForInfo:](self, "_URLForInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self, CFSTR("Account"), &stru_1E81CBE50, CFSTR("RelativePath"), 0)), "absoluteString");
}

- (id)persistentNameForMailbox:(id)a3
{
  return 0;
}

- (id)mailboxUidForInfo:(id)a3
{
  return -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", objc_msgSend(a3, "objectForKey:", CFSTR("RelativePath")), 0);
}

- (id)_URLForInfo:(id)a3
{
  id result;
  id v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  result = -[MailAccount _URLScheme](self, "_URLScheme");
  if (result)
  {
    v6 = result;
    v7 = -[MFAccount hostname](self, "hostname");
    v8 = v7;
    if (v7)
      v7 = -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](v7, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet"));
    if (v7)
      v9 = v7;
    else
      v9 = v8;
    v10 = -[MFAccount username](self, "username");
    v11 = v10;
    if (v10)
      v10 = -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](v10, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet"));
    if (v10)
      v12 = v10;
    else
      v12 = v11;
    v13 = -[MFAccount portNumber](self, "portNumber");
    v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("RelativePath"));
    v15 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v15, "appendString:", CFSTR("://"));
    if (v12 && !-[NSString isEqualToString:](v12, "isEqualToString:", &stru_1E81CBE50))
    {
      objc_msgSend(v15, "appendString:", v12);
      objc_msgSend(v15, "appendString:", CFSTR("@"));
    }
    if (v9)
      objc_msgSend(v15, "appendString:", v9);
    if ((_DWORD)v13
      && ((_DWORD)v13 != -[MFAccount defaultPortNumber](self, "defaultPortNumber")
       && (_DWORD)v13 != -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber")
       || (_DWORD)v13 == -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber")
       && objc_msgSend(a3, "mf_BOOLForKey:", CFSTR("IncludeDefaultSecurePortNumber"))))
    {
      objc_msgSend(v15, "appendFormat:", CFSTR(":%u"), v13);
    }
    objc_msgSend(v15, "appendString:", CFSTR("/"));
    if (v14)
      objc_msgSend(v15, "appendString:", objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet")));
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);

    return v16;
  }
  return result;
}

+ (BOOL)mailboxListingNotificationAreEnabled
{
  char v2;

  _MFLockGlobalLock();
  v2 = _disableMailboxListingNotifications;
  _MFUnlockGlobalLock();
  return (v2 & 1) == 0;
}

- (id)_mailboxPathPrefix
{
  return &stru_1E81CBE50;
}

+ (id)activeAccountsWithError:(id *)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "mailAccountsWithError:", a3), "ef_filter:", &__block_literal_global_6);
}

+ (MailAccount)accountWithUniqueId:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_msgSend(a1, "mailAccounts");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MailAccount_accountWithUniqueId___block_invoke;
  v6[3] = &unk_1E81CA398;
  v6[4] = a3;
  return (MailAccount *)(id)objc_msgSend(v4, "ef_firstObjectPassingTest:", v6);
}

+ (id)mailAccountsWithError:(id *)a3
{
  void *v5;
  id v6;

  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v5 = (void *)_accounts;
  if (!_accounts)
  {
    objc_msgSend(a1, "reloadAccounts");
    v5 = (void *)_accounts;
  }
  v6 = v5;
  if (a3)
    *a3 = (id)_lastAccountsReloadError;
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return v6;
}

+ (id)mailAccounts
{
  return (id)objc_msgSend(a1, "mailAccountsWithError:", 0);
}

- (id)mailboxUidOfType:(int)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  id v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[MailAccount _cachedSpecialMailboxOfType:](self, "_cachedSpecialMailboxOfType:");
  if (!v7)
  {
    v9 = -[MailAccount _specialMailboxUidWithType:create:](self, "_specialMailboxUidWithType:create:", v5, v4);
    v7 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "type") != (_DWORD)v5)
        -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", v7, v5);
    }
  }
  return v7;
}

- (id)_cachedSpecialMailboxOfType:(int)a3
{
  id result;
  id *v5;
  id v6;

  result = -[MailAccount _specialMailboxIvarOfType:](self, "_specialMailboxIvarOfType:", *(_QWORD *)&a3);
  if (result)
  {
    v5 = (id *)result;
    -[MFLock lock](self->_cachedMailboxenLock, "lock");
    v6 = *v5;
    -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
    return v6;
  }
  return result;
}

- (id)mailboxCachePath
{
  NSString *mailboxCachePath;

  mailboxCachePath = self->_mailboxCachePath;
  if (mailboxCachePath)
    return mailboxCachePath;
  else
    return (id)objc_msgSend(-[MailAccount path](self, "path"), "stringByAppendingPathComponent:", CFSTR(".mboxCache.plist"));
}

- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3
{
  return (id)objc_msgSend(-[MailAccount valueInAccountLookAsidePropertiesForKey:](self, "valueInAccountLookAsidePropertiesForKey:", CFSTR("EncryptionIdentities")), "objectForKey:", a3);
}

- (id)valueInAccountLookAsidePropertiesForKey:(id)a3
{
  return 0;
}

- (MailAccount)initWithLibrary:(id)a3 path:(id)a4
{
  MailAccount *v5;
  MailAccount *v6;

  v5 = -[MailAccount initWithLibrary:persistentAccount:](self, "initWithLibrary:persistentAccount:", a3, 0);
  v6 = v5;
  if (v5)
    -[MailAccount _setPath:](v5, "_setPath:", a4);
  return v6;
}

- (BOOL)_setPath:(id)a3
{
  uint64_t v5;
  void *v6;
  NSString *v8;
  const __CFArray *v9;
  id v10;
  CFRange v11;

  v5 = objc_msgSend((id)objc_msgSend(a3, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath"), "stringByStandardizingPath");
  if (!a3)
    return 0;
  v6 = (void *)v5;
  if (-[NSString isEqualToString:](self->_path, "isEqualToString:", v5))
    return 0;
  v8 = self->_path;
  self->_path = (NSString *)objc_msgSend(v6, "copy");
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v9 = (const __CFArray *)_accountsSortedByPath;
  if (!_accountsSortedByPath
    || (v11.length = CFArrayGetCount((CFArrayRef)_accountsSortedByPath),
        v11.location = 0,
        CFArrayGetFirstIndexOfValue(v9, v11, self) != -1))
  {
    objc_msgSend((id)objc_opt_class(), "_removeAccountFromSortedPaths:", self);
    objc_msgSend((id)objc_opt_class(), "_addAccountToSortedPaths:", self);
  }
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  v10 = -[MailAccount tildeAbbreviatedPath](self, "tildeAbbreviatedPath");
  _MFLockGlobalLock();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v10, CFSTR("AccountPath"));
  _MFUnlockGlobalLock();
  return 1;
}

- (MailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  MailAccount *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MailAccount;
  v5 = -[MFAccount initWithPersistentAccount:](&v7, sel_initWithPersistentAccount_, a4);
  if (v5)
  {
    v5->_cachedMailboxenLock = (MFLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("CachedMailboxenLock"), v5);
    v5->_deletionLock = (MFLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MailAccountDeletionLock"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v5, sel_deliveryAccountWillBeRemoved_, CFSTR("DeliveryAccountWillBeRemoved"), 0);
    if (a3)
      -[MailAccount setLibrary:](v5, "setLibrary:", a3);
    else
      -[MailAccount setupLibrary](v5, "setupLibrary");
    v5->_cachedLibraryID = -1;
    v5->_cachedLibraryIDLock = (MFLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MailAccount LibraryID Lock"), 0);
    v5->_messageStoresCache = -[MFWeakObjectCache initWithBlock:]([MFWeakObjectCache alloc], "initWithBlock:", &__block_literal_global_99);
  }
  return v5;
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  _BOOL4 v7;
  _BOOL8 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  -[MFAccount persistentAccountDidChange:previousAccount:](&v9, sel_persistentAccountDidChange_previousAccount_);
  if (a4)
  {
    v7 = -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", a4);
    v8 = -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", a3);
    if (v7 != v8)
      -[MailAccount _didBecomeActive:](self, "_didBecomeActive:", v8);
    -[MailAccount _invalidateCachedMailboxen](self, "_invalidateCachedMailboxen");
  }
}

- (id)library
{
  NSObject *v3;
  int v5;
  MailAccount *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_library)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_DEFAULT, "#Warning %@: no library!", (uint8_t *)&v5, 0xCu);
    }
  }
  return self->_library;
}

- (MailAccount)initWithPersistentAccount:(id)a3
{
  return -[MailAccount initWithLibrary:persistentAccount:](self, "initWithLibrary:persistentAccount:", 0, a3);
}

- (void)_invalidateCachedMailboxen
{
  -[MFLock lock](self->_cachedMailboxenLock, "lock");

  self->_draftsMailboxUid = 0;
  self->_sentMessagesMailboxUid = 0;

  self->_trashMailboxUid = 0;
  self->_archiveMailboxUid = 0;

  self->_junkMailboxUid = 0;
  -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
  *(_DWORD *)&self->_flags &= ~0x20000u;
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
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)_accounts;
  v5 = objc_msgSend((id)_accounts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return v9;
}

- (BOOL)_loadMailboxListingIntoCache:(id)a3 attributes:(unsigned int)a4 children:(id)a5 parent:(id)a6
{
  const __CFArray *v6;
  __CFDictionary *Mutable;
  const __CFArray *v8;
  int v9;
  void *ValueAtIndex;
  void *v11;
  void *v12;
  CFIndex v13;
  id v14;
  id v15;
  id v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MailAccount *v26;
  void *v27;
  const void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  CFMutableArrayRef v36;
  CFMutableArrayRef v37;
  uint64_t j;
  void *v39;
  const void *v40;
  uint64_t v41;
  const void *v42;
  void *Value;
  id v44;
  id v45;
  __CFArray *v46;
  id v48;
  const __CFArray *v50;
  __CFArray *v51;
  int v52;
  void *v54;
  void *v55;

  v48 = a5;
  v6 = 0;
  Mutable = 0;
  v8 = 0;
  v9 = 0;
  do
  {
    ValueAtIndex = v48;
    if (v8)
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, 0);
    v52 = v9;
    v11 = a6;
    if (v6)
      v11 = (void *)CFArrayGetValueAtIndex(v6, 0);
    v12 = (void *)objc_msgSend(v11, "mutableCopyOfChildren", a3, *(_QWORD *)&a4, v48);
    v13 = objc_msgSend(ValueAtIndex, "count");
    v14 = ValueAtIndex;
    if (v8)
      CFArrayRemoveValueAtIndex(v8, 0);
    v54 = v11;
    v15 = v11;
    if (v6)
      CFArrayRemoveValueAtIndex(v6, 0);
    v51 = v6;
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v13)
    {
      for (i = 0; i != v13; ++i)
      {
        v18 = (void *)objc_msgSend(ValueAtIndex, "objectAtIndex:", i);
        objc_msgSend(v16, "setObject:forKey:", v18, objc_msgSend(v18, "objectForKey:", CFSTR("MailboxName")));
      }
    }
    v50 = v8;
    v19 = objc_msgSend(v12, "count");
    v55 = ValueAtIndex;
    if (v19)
    {
      v20 = v19 - 1;
      do
      {
        v21 = (void *)objc_msgSend(v12, "objectAtIndex:", v20);
        v22 = (const void *)objc_msgSend(v21, "name");
        v23 = (void *)objc_msgSend(v16, "objectForKey:", v22);
        v24 = v23;
        if (v23)
        {
          v25 = objc_msgSend((id)objc_msgSend(v23, "objectForKey:", CFSTR("MailboxAttributes")), "unsignedIntValue");
          v26 = self;
          v27 = v54;
          v28 = v22;
          v29 = v21;
          v30 = v24;
        }
        else
        {
          v26 = self;
          v27 = v54;
          v28 = 0;
          v25 = 0;
          v29 = v21;
          v30 = 0;
        }
        v31 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](v26, "_copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:", v27, v28, v25, v29, v30);
        v32 = v31;
        if (v31)
        {
          v33 = (void *)objc_msgSend(v31, "name");
          if ((objc_msgSend(v32, "isEqual:", v21) & 1) == 0)
          {
            objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v20, v32);
            v52 = 1;
          }
          if (!Mutable)
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
          CFDictionarySetValue(Mutable, v33, v32);
          if ((objc_msgSend(v33, "isEqualToString:", v22) & 1) == 0)
            CFDictionarySetValue(Mutable, v22, v32);
          v34 = v24 == 0;
        }
        else
        {
          objc_msgSend(v12, "removeObjectAtIndex:", v20);
          if (v24)
            v34 = -1;
          else
            v34 = 0;
          v52 = 1;
        }
        v13 += v34;

        --v20;
        ValueAtIndex = v55;
      }
      while (v20 != -1);
    }

    v35 = objc_msgSend(ValueAtIndex, "count");
    v36 = CFArrayCreateMutable(0, v13, MEMORY[0x1E0C9B378]);
    v37 = v36;
    v8 = v50;
    if (v12)
    {
      -[__CFArray addObjectsFromArray:](v36, "addObjectsFromArray:", v12);

    }
    if (v35)
    {
      for (j = 0; v35 != j; ++j)
      {
        v39 = (void *)objc_msgSend(ValueAtIndex, "objectAtIndex:", j);
        v40 = (const void *)objc_msgSend(v39, "objectForKey:", CFSTR("MailboxName"));
        v41 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", CFSTR("MailboxAttributes")), "unsignedIntValue");
        v42 = (const void *)objc_msgSend(v39, "objectForKey:", CFSTR("MailboxChildren"));
        if (Mutable && (Value = (void *)CFDictionaryGetValue(Mutable, v40)) != 0)
        {
          v44 = Value;
          v45 = Value;
        }
        else
        {
          v44 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](self, "_copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:", v54, v40, v41, 0, v39);
          if (!v44)
            goto LABEL_48;
        }
        if (-[__CFArray indexOfObjectIdenticalTo:](v37, "indexOfObjectIdenticalTo:", v44) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v52 = 1;
          -[__CFArray ef_insertObject:usingSortFunction:context:allowDuplicates:](v37, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v44, _MFCompareMailboxUids, 0, 1);
        }
        if (v42 && (v41 & 1) == 0)
        {
          if (!v8)
            v8 = CFArrayCreateMutable(0, 0, 0);
          v46 = v51;
          ValueAtIndex = v55;
          if (!v51)
            v46 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
          CFArrayAppendValue(v8, v42);
          v51 = v46;
          CFArrayAppendValue(v46, v44);
          goto LABEL_49;
        }
LABEL_48:
        ValueAtIndex = v55;
LABEL_49:

      }
    }
    if (Mutable)
      CFDictionaryRemoveAllValues(Mutable);
    v9 = v52 | -[MailAccount _cleanInboxDuplication:](self, "_cleanInboxDuplication:", v37);
    v6 = v51;
    if ((v9 & 1) != 0)
      -[MailAccount _setChildren:forMailboxUid:](self, "_setChildren:forMailboxUid:", v37, v54);

  }
  while (v8 && CFArrayGetCount(v8) > 0);
  if (Mutable)

  if (v51)
  if (v8)

  return v9 & 1;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  id v8;

  if (!a4)
  {
    v8 = a6;
    if ((objc_msgSend(a6, "attributes", a3, 0, *(_QWORD *)&a5) & 0x100) == 0)
      return 0;
    return v8;
  }
  if (a6)
  {
    v8 = a6;
    objc_msgSend(a6, "setAttributes:", objc_msgSend(a6, "attributes", a3) & 0xFFFFFE00 | a5 & 0x1FF);
    return v8;
  }
  return -[MailAccount _copyMailboxWithParent:name:attributes:dictionary:](self, "_copyMailboxWithParent:name:attributes:dictionary:", a3);
}

- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6
{
  return -[MFMailboxUid initWithName:attributes:forAccount:extraAttributes:]([MFMailboxUid alloc], "initWithName:attributes:forAccount:extraAttributes:", a4, *(_QWORD *)&a5, self, objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("MailboxExtraAttributes")));
}

- (BOOL)_cleanInboxDuplication:(id)a3
{
  return 0;
}

+ (void)resetMailboxTimers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a1, "activeAccounts");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resetMailboxTimer");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (int)secureCompositionSigningPolicyForAddress:(id)a3
{
  int result;

  result = objc_msgSend((id)objc_msgSend(a3, "mf_uncommentedAddress"), "isEqualToString:", objc_msgSend(-[MailAccount firstEmailAddress](self, "firstEmailAddress"), "mf_uncommentedAddress"));
  if (result)
    return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("SMIMESigningEnabled")), "BOOLValue");
  return result;
}

+ (void)_setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4 alreadyLocked:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  id v30;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v5 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    objc_msgSend(a1, "disableMailboxListingNotifications");
    +[MailAccount mf_lock](MailAccount, "mf_lock");
  }
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setMaxConcurrentOperationCount:", 1);
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  v10 = +[LocalAccount localAccount](LocalAccount, "localAccount");
  if (objc_msgSend(v9, "indexOfObjectIdenticalTo:", v10) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = objc_msgSend((id)_accounts, "indexOfObjectIdenticalTo:", v10);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 0;
    else
      v12 = v11;
    objc_msgSend(v9, "insertObject:atIndex:", v10, v12);
  }
  v13 = (void *)_accounts;
  _accounts = (uint64_t)v9;
  v30 = a1;
  objc_msgSend(a1, "_setupSortedPathsForAccounts:", v9);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v18) & 1) == 0)
          objc_msgSend(v18, "invalidate");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v15);
  }
  if (v5)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    v20 = MEMORY[0x1E0C809B0];
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v13);
          v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
          if ((objc_msgSend(v9, "containsObject:", v24) & 1) == 0)
          {
            v37[0] = v20;
            v37[1] = 3221225472;
            v37[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke;
            v37[3] = &unk_1E81C9B98;
            v37[4] = v24;
            objc_msgSend(v8, "addOperationWithBlock:", v37);
          }
        }
        v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v21);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v9);
          v29 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
          if ((objc_msgSend(v13, "containsObject:", v29) & 1) == 0)
          {
            v32[0] = v20;
            v32[1] = 3221225472;
            v32[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_2;
            v32[3] = &unk_1E81C9B98;
            v32[4] = v29;
            objc_msgSend(v8, "addOperationWithBlock:", v32);
          }
        }
        v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v26);
    }
  }

  if (!a5)
  {
    +[MailAccount mf_unlock](MailAccount, "mf_unlock");
    objc_msgSend(v30, "enableMailboxListingNotifications:", 0);
  }
  objc_msgSend(v8, "waitUntilAllOperationsAreFinished");
}

+ (void)_setupSortedPathsForAccounts:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CFArrayRemoveAllValues((CFMutableArrayRef)_sortedAccountPaths);
  CFArrayRemoveAllValues((CFMutableArrayRef)_accountsSortedByPath);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(a1, "_addAccountToSortedPaths:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (id)iconString
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("AccountIcon"));
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("otherAccountIcon");
  v5 = -[MailAccount emailAddresses](self, "emailAddresses");
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            if ((objc_msgSend(v11, "hasSuffix:", CFSTR("@apple.com")) & 1) != 0
              || (objc_msgSend(v11, "hasSuffix:", CFSTR(".apple.com")) & 1) != 0)
            {
              return CFSTR("appleAccountIcon");
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
            continue;
          break;
        }
      }
    }
  }
  return (id)v4;
}

+ (void)initialize
{
  if (!_accountsSortedByPath)
  {
    _accountsSortedByPath = (uint64_t)CFArrayCreateMutable(0, 0, 0);
    _sortedAccountPaths = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  }
}

+ (void)setMailAccountLoadOptions:(unint64_t)a3
{
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  __mailAccountLoadOptions = a3;
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
}

+ (id)_loadAllAccountsWithOptions:(unint64_t)a3 error:(id *)a4
{
  char v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  _QWORD v24[6];

  v5 = a3;
  v24[5] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = v8;
  if ((v5 & 1) != 0)
    objc_msgSend(v8, "addObject:", *MEMORY[0x1E0C8F118]);
  if ((v5 & 2) != 0)
  {
    v10 = *MEMORY[0x1E0C8F160];
    v24[0] = *MEMORY[0x1E0C8F028];
    v24[1] = v10;
    v11 = *MEMORY[0x1E0C8F0D0];
    v24[2] = *MEMORY[0x1E0C8F0A8];
    v24[3] = v11;
    v24[4] = *MEMORY[0x1E0C8F0D8];
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5));
  }
  if (!objc_msgSend(v9, "count"))
    goto LABEL_11;
  v22 = 0;
  v12 = objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "accountsWithTypeIdentifiers:error:", v9, &v22);
  if (v12)
    objc_msgSend(v7, "addObjectsFromArray:", v12);
  if (v22)
  {
    if (a4)
      *a4 = v22;
  }
  else
  {
LABEL_11:
    objc_msgSend(a1, "_removeLookAsideValuesNotInAccountList:", v7);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "accountDidLoad");
      }
      while (v14 != v16);
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v14);
  }
  return v7;
}

+ (id)lastMailAccountsReloadDate
{
  id v2;

  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v2 = (id)_lastAccountsReloadDate;
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return v2;
}

+ (id)lastMailAccountsReloadError
{
  id v2;

  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v2 = (id)_lastAccountsReloadError;
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return v2;
}

+ (void)setMailAccounts:(id)a3
{
  objc_msgSend(a1, "setMailAccounts:saveIfChanged:", a3, 1);
}

+ (void)setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4
{
  objc_msgSend(a1, "_setMailAccounts:saveIfChanged:alreadyLocked:", a3, a4, 0);
}

uint64_t __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePersistentAccount");
}

uint64_t __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "savePersistentAccount");
}

+ (void)_removeAccountFromSortedPaths:(id)a3
{
  CFIndex Count;
  CFIndex v5;

  if (_accountsSortedByPath)
  {
    Count = CFArrayGetCount((CFArrayRef)_accountsSortedByPath);
    if (Count)
    {
      v5 = Count - 1;
      do
      {
        if (CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v5) == a3)
        {
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v5);
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v5);
        }
        --v5;
      }
      while (v5 != -1);
    }
  }
}

+ (id)activeAccounts
{
  return (id)objc_msgSend(a1, "activeAccountsWithError:", 0);
}

+ (id)purgableAccounts
{
  return (id)objc_msgSend(a1, "purgableAccountsWithError:", 0);
}

+ (id)purgableAccountsWithError:(id *)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "mailAccountsWithError:", a3), "ef_filter:", &__block_literal_global_74);
}

uint64_t __41__MailAccount_purgableAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsPurge");
}

uint64_t __35__MailAccount_accountWithUniqueId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "uniqueId"));
}

+ (id)existingAccountWithType:(id)a3 hostname:(id)a4 username:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_msgSend(a1, "mailAccounts", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      if ((objc_msgSend(v13, "isEquivalentTo:hostname:username:", a3, a4, a5) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }
  return v13;
}

- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5
{
  return -[MailAccount isAccountClassEquivalentTo:](self, "isAccountClassEquivalentTo:", a3)
      && -[MailAccount isHostnameEquivalentTo:](self, "isHostnameEquivalentTo:", a4)
      && -[MailAccount isUsernameEquivalentTo:](self, "isUsernameEquivalentTo:", a5);
}

- (BOOL)isUsernameEquivalentTo:(id)a3
{
  return -[MFAccount username](self, "username") == a3
      || objc_msgSend(a3, "compare:options:", -[MFAccount username](self, "username"), 1) == 0;
}

+ (void)updateAutoFetchSettings
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 138543362;
    v4 = objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    _os_log_impl(&dword_1C8839000, v2, OS_LOG_TYPE_INFO, "updateAutoFetchSettings was called. Backtrace:\n%{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)allEmailAddressesIncludingFullUserName:(BOOL)a3 includeReceiveAliases:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id result;

  v4 = a4;
  v5 = a3;
  result = _allEmailAddressesIncludingFullName(a3, a4);
  if (v5 && !result)
    return _allEmailAddressesIncludingFullName(0, v4);
  return result;
}

+ (id)accountContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_accountContainingEmailAddress:matchingAddress:fullUserName:includingInactive:", a3, 0, 0, a4);
}

+ (id)accountForHeaders:(id)a3 message:(id)a4 includingInactive:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "copyAddressListForResentFrom");
  v8 = (void *)objc_msgSend(v7, "firstObject");
  if (v8 && (v9 = v8, !objc_msgSend(v8, "isEqualToString:", &stru_1E81CBE50)))
  {
    v16 = +[MailAccount accountContainingEmailAddress:includingInactive:](MailAccount, "accountContainingEmailAddress:includingInactive:", v9, v5);

    if (v16)
      return v16;
  }
  else
  {

  }
  v10 = (void *)objc_msgSend(a4, "senders");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      v15 = +[MailAccount accountContainingEmailAddress:includingInactive:](MailAccount, "accountContainingEmailAddress:includingInactive:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v5);
      if (v15)
        return v15;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v16 = 0;
    if (v12)
      continue;
    break;
  }
  return v16;
}

+ (id)accountUsingHeadersFromMessage:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "headers");
  if (!v5)
    v5 = objc_msgSend(a3, "headersIfAvailable");
  return (id)objc_msgSend(a1, "accountForHeaders:message:includingInactive:", v5, a3, 0);
}

+ (id)accountThatMessageIsFrom:(id)a3 includingInactive:(BOOL)a4
{
  return (id)objc_msgSend(a1, "accountForHeaders:message:includingInactive:", objc_msgSend(a3, "headersIfAvailable"), a3, a4);
}

+ (id)accountThatMessageIsFrom:(id)a3
{
  return (id)objc_msgSend(a1, "accountForHeaders:message:includingInactive:", objc_msgSend(a3, "headersIfAvailable"), a3, 0);
}

+ (id)outboxMailboxUid
{
  id v3;
  void *v4;
  char v5;

  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v3 = +[LocalAccount localAccount](LocalAccount, "localAccount");
  v4 = (void *)_outboxUid;
  v5 = objc_msgSend((id)_outboxUid, "isValid");
  if (!v4 || (v5 & 1) == 0)
  {
    v4 = (void *)objc_msgSend(v3, "mailboxUidForRelativePath:create:", CFSTR("Outbox"), 1);
    if (v4)
    {
      objc_msgSend(a1, "_setOutboxMailboxUid:", v4);
      objc_msgSend(v3, "resetSpecialMailboxes");
    }
  }
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return v4;
}

+ (id)outboxMessageStore:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = +[LocalAccount localAccount](LocalAccount, "localAccount", a3);
  v5 = (void *)objc_msgSend(a1, "outboxMailboxUid");
  if (v5 && (v6 = v5, objc_msgSend(v5, "isValid")))
    return (id)objc_msgSend(v4, "storeForMailboxUid:", v6);
  else
    return 0;
}

+ (id)allMailboxUids
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = +[MailAccount mailAccounts](MailAccount, "mailAccounts");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "rootMailboxUid");
        if (v9)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  while (objc_msgSend(v3, "count"))
  {
    v10 = (void *)objc_msgSend((id)objc_msgSend(v3, "lastObject"), "mutableCopyOfChildren");
    objc_msgSend(v2, "addObjectsFromArray:", v10);
    objc_msgSend(v3, "removeLastObject");
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  return v2;
}

+ (id)allActivePrimaryMailboxUids
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "activeAccounts"), "ef_map:", &__block_literal_global_81);
  return (id)objc_msgSend(v2, "ef_filter:", *MEMORY[0x1E0D1ED88]);
}

uint64_t __42__MailAccount_allActivePrimaryMailboxUids__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "primaryMailboxUid");
}

+ (MailAccount)accountWithPath:(id)a3
{
  MailAccount *result;

  result = (MailAccount *)objc_msgSend(a3, "length");
  if (result)
  {
    result = +[MailAccount _accountWithPath:](MailAccount, "_accountWithPath:", a3);
    if (!result)
      return (MailAccount *)+[MailAccount _accountWithPath:](MailAccount, "_accountWithPath:", objc_msgSend(a3, "mf_betterStringByResolvingSymlinksInPath"));
  }
  return result;
}

+ (id)newAccountWithPath:(id)a3
{
  id result;
  id v5;
  void *v6;

  result = (id)objc_msgSend(a3, "length");
  if (result)
  {
    if (objc_msgSend(a3, "length"))
    {
      v5 = +[MailAccount _accountWithPath:](MailAccount, "_accountWithPath:", a3);
      if (v5)
        return v5;
    }
    v6 = (void *)objc_msgSend(a3, "mf_betterStringByResolvingSymlinksInPath");
    if (objc_msgSend(v6, "length")
      && (v5 = +[MailAccount _accountWithPath:](MailAccount, "_accountWithPath:", v6)) != 0)
    {
      return v5;
    }
    else
    {
      return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:", v6);
    }
  }
  return result;
}

- (void)_setAccountProperties:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailAccount;
  -[MFAccount _setAccountProperties:](&v5, sel__setAccountProperties_);
  if (!objc_msgSend(a3, "objectForKey:", CFSTR("SMTPAlternateIdentifiers")))
    -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SMTPAlternateIdentifiers"));
}

+ (id)newAccountWithDictionary:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AccountPath"));
  v6 = objc_msgSend(v5, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  v7 = (id)objc_msgSend(a1, "newAccountWithPath:", v6);
  if (v7 || (v7 = objc_alloc_init((Class)a1)) != 0)
  {
    if (v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    {
      v3 = (id)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("AccountPath"));
    }
    objc_msgSend(v7, "_setAccountProperties:", v3);
  }
  return v7;
}

id __49__MailAccount_initWithLibrary_persistentAccount___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend(a2, "account"), "storeClassForMailbox:", a2)), "initWithMailboxUid:readOnly:", a2, 0);
}

- (MailAccount)initWithPath:(id)a3
{
  return -[MailAccount initWithLibrary:path:](self, "initWithLibrary:path:", 0, a3);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  -[MFAccount dealloc](&v3, sel_dealloc);
}

+ (id)defaultPathForAccountWithHostname:(id)a3 username:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "defaultAccountDirectory"), "stringByAppendingPathComponent:", objc_msgSend(a1, "defaultPathNameForAccountWithHostname:username:", a3, a4)), "mf_betterStringByResolvingSymlinksInPath");
}

+ (id)defaultAccountDirectory
{
  if (defaultAccountDirectory_sOnceToken != -1)
    dispatch_once(&defaultAccountDirectory_sOnceToken, &__block_literal_global_102);
  return (id)defaultAccountDirectory_sMailAccountDirectory;
}

id __38__MailAccount_defaultAccountDirectory__block_invoke()
{
  id result;

  result = (id)objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Mail"));
  defaultAccountDirectory_sMailAccountDirectory = (uint64_t)result;
  return result;
}

+ (id)defaultPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@@%@"), objc_msgSend(a1, "accountTypeString"), a4, a3);
}

+ (void)setGlobalPathForAccounts:(id)a3
{
  if ((id)__globalPathSwitch != a3)
  {

    __globalPathSwitch = objc_msgSend(a3, "copy");
  }
}

- (void)setPath:(id)a3
{
  if (-[MailAccount _setPath:](self, "_setPath:", a3))
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
}

- (void)setLastKnownHostname:(id)a3
{
  -[MailAccount mf_lock](self, "mf_lock");
  if (self->_lastKnownHostname == a3 || (objc_msgSend(a3, "isEqualToString:") & 1) != 0)
  {
    -[MailAccount mf_unlock](self, "mf_unlock");
  }
  else
  {

    self->_lastKnownHostname = (NSString *)objc_msgSend(a3, "copy");
    -[MailAccount mf_unlock](self, "mf_unlock");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("MailAccountCurrentURLDidChange"), self);
  }
}

- (id)tildeAbbreviatedPath
{
  CFIndex i;
  void *ValueAtIndex;
  id v5;
  id v6;
  char v7;

  +[MailAccount mf_lock](MailAccount, "mf_lock");
  for (i = CFArrayGetCount((CFArrayRef)_accountsSortedByPath) - 1; i != -1; --i)
  {
    if (CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, i) == self
      && (ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_sortedAccountPaths, i),
          objc_msgSend(ValueAtIndex, "hasPrefix:", CFSTR("~"))))
    {
      v5 = ValueAtIndex;
    }
    else
    {
      v5 = 0;
    }
    if (v5)
    {
      +[MailAccount mf_unlock](MailAccount, "mf_unlock");
      return v5;
    }
  }
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  _MFLockGlobalLock();
  v6 = -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("AccountPath"));
  _MFUnlockGlobalLock();
  v5 = (id)objc_msgSend(v6, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath");
  v7 = objc_msgSend(v5, "hasPrefix:", CFSTR("~"));
  if (v5 && (v7 & 1) != 0)
    return v5;
  return -[NSString mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath](self->_path, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath");
}

- (void)setFullUserName:(id)a3
{
  const __CFString *v5;
  __CFString *v6;

  v5 = -[MailAccount fullUserName](self, "fullUserName");
  if (objc_msgSend(a3, "length"))
    a3 = (id)objc_msgSend(a3, "mf_stringWithNoExtraSpaces");
  if (a3 != v5)
  {
    v6 = v5 ? (__CFString *)v5 : &stru_1E81CBE50;
    if ((objc_msgSend(a3, "isEqualToString:", v6) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("FullUserName"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("FullUserName"));
      _MFUnlockGlobalLock();
      _resetAllEmailAddresses();
    }
  }
}

+ (id)defaultMailAccountForDelivery
{
  return (id)objc_msgSend(a1, "_defaultMailAccountForDeliveryIncludingRestricted:", 1);
}

+ (id)defaultMailAccountForDeliveryExcludingRestricted
{
  return (id)objc_msgSend(a1, "_defaultMailAccountForDeliveryIncludingRestricted:", 0);
}

+ (id)_defaultMailAccountForDeliveryIncludingRestricted:(BOOL)a3
{
  void *v5;
  char v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = objc_msgSend((id)*MEMORY[0x1E0D4D878], "isEqualToString:", objc_msgSend(v5, "bundleIdentifier"));
  v7 = (const __CFString *)MFMobileMailPreferenceDomain();
  if ((v6 & 1) != 0)
  {
    v8 = (void *)CFPreferencesCopyAppValue(CFSTR("DefaultSendingAccount"), v7);
  }
  else
  {
    MFMobileMailContainerPath();
    v8 = (void *)_CFPreferencesCopyValueWithContainer();
  }
  v9 = v8;
  if (objc_msgSend(v8, "length")
    && (v10 = (void *)objc_msgSend(a1, "accountWithUniqueId:", v9), objc_msgSend(v10, "isActive"))
    && (a3 || !objc_msgSend(v10, "restrictedFromSendingExternally")))
  {

    if (v10)
      return v10;
  }
  else
  {

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)objc_msgSend(a1, "mailAccounts", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = *(_QWORD *)v18;
LABEL_11:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v14)
      objc_enumerationMutation(v11);
    v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      && objc_msgSend(v10, "isActive")
      && (a3 || !objc_msgSend(v10, "restrictedFromSendingExternally")))
    {
      return v10;
    }
    if (v13 == ++v15)
    {
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
        goto LABEL_11;
      return 0;
    }
  }
}

+ (id)defaultDeliveryAccount
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "defaultMailAccountForDelivery"), "deliveryAccount");
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 0;
}

- (id)deliveryAccount
{
  return -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 1);
}

- (BOOL)isPrimaryDeliveryAccountDisabled
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("SMTPDisabled"), 0);
}

- (void)setPrimaryDeliveryAccountDisabled:(BOOL)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a3);
  _MFLockGlobalLock();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, CFSTR("SMTPDisabled"));
  _MFUnlockGlobalLock();

}

- (id)deliveryAccountAlternates
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  DeliveryAccount *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPAlternateIdentifiers"));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = +[DeliveryAccount accountWithIdentifier:](DeliveryAccount, "accountWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        if (v9)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (void)setDeliveryAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if ((objc_msgSend((id)objc_opt_class(), "primaryDeliveryAccountIsDynamic") & 1) == 0)
  {
    v5 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPIdentifier"));
    v6 = (void *)objc_msgSend(a3, "identifier");
    v7 = v6;
    if (!v5 || (objc_msgSend(v6, "isEqualToString:", v5) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (v7)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v7, CFSTR("SMTPIdentifier"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SMTPIdentifier"));
      _MFUnlockGlobalLock();
    }
  }
}

- (void)setDeliveryAccountAlternates:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "identifier");
        if (v10)
          objc_msgSend(v5, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if ((objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPAlternateIdentifiers")), "isEqual:", v5) & 1) == 0)
  {
    _MFLockGlobalLock();
    if (objc_msgSend(v5, "count"))
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("SMTPAlternateIdentifiers"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SMTPAlternateIdentifiers"));
    _MFUnlockGlobalLock();
  }
}

- (BOOL)canUseDeliveryAccount:(id)a3
{
  if ((objc_msgSend(a3, "isEqual:", -[MailAccount deliveryAccount](self, "deliveryAccount")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPAlternateIdentifiers")), "containsObject:", objc_msgSend(a3, "identifier"));
}

- (void)setCanUseCarrierDeliveryFallback:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  _MFLockGlobalLock();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("SMTPCarrierFallbackAllowed"));
  _MFUnlockGlobalLock();
}

- (BOOL)canUseCarrierDeliveryFallback
{
  return objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPCarrierFallbackAllowed")), "BOOLValue");
}

+ (BOOL)isPredefinedAccountType
{
  return 0;
}

- (id)firstEmailAddress
{
  id v2;
  id result;

  v2 = -[MailAccount emailAddresses](self, "emailAddresses");
  result = (id)objc_msgSend(v2, "count");
  if (result)
    return (id)objc_msgSend(v2, "objectAtIndex:", 0);
  return result;
}

- (id)defaultEmailAddress
{
  return -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("defaultAddress"));
}

- (void)setDefaultEmailAddress:(id)a3
{
  id v5;
  uint64_t v6;

  v5 = -[MailAccount defaultEmailAddress](self, "defaultEmailAddress");
  if (v5 != a3)
  {
    v6 = (uint64_t)v5;
    if (!v5)
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "string");
    if ((objc_msgSend(a3, "isEqualToString:", v6) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("defaultAddress"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("defaultAddress"));
      _MFUnlockGlobalLock();
    }
  }
}

- (id)emailAddresses
{
  return (id)objc_msgSend((id)objc_msgSend(-[MailAccount emailAddressesDictionary](self, "emailAddressesDictionary"), "allKeys"), "mf_uncommentedAddressList");
}

- (void)setEmailAddresses:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[MailAccount emailAddressesDictionary](self, "emailAddressesDictionary");
  objc_opt_class();
  v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v6 = (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(", "));
  }
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      v11 = MEMORY[0x1E0C9AAB0];
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(v7, "addObject:", v11);
        if (!--v9)
        {
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (!v9)
            break;
        }
      }
    }
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v7, v6);
  }
LABEL_12:
  if (v5 != a3)
  {
    if (!v5)
      v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    if ((objc_msgSend(a3, "isEqual:", v5) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("EmailAddresses"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("EmailAddresses"));
      _MFUnlockGlobalLock();
      _resetAllEmailAddresses();
    }
  }
}

- (id)receiveEmailAliasAddresses
{
  id v2;
  void *v3;
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
  v2 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("ReceiveEmailAliasAddresses"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      v7 = MEMORY[0x1E0C9AAB0];
      while (1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(v3, "addObject:", v7);
        if (!--v5)
        {
          v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          if (!v5)
            break;
        }
      }
    }
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v3, v2);
  }
  return v2;
}

- (id)receiveEmailAliasAddressesList
{
  return (id)objc_msgSend(-[MailAccount receiveEmailAliasAddresses](self, "receiveEmailAliasAddresses"), "allKeys");
}

- (void)setReceiveEmailAliasAddresses:(id)a3
{
  id v5;
  uint64_t v6;

  v5 = -[MailAccount receiveEmailAliasAddresses](self, "receiveEmailAliasAddresses");
  if (v5 != a3)
  {
    v6 = (uint64_t)v5;
    if (!v5)
      v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    if ((objc_msgSend(a3, "isEqual:", v6) & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", a3, CFSTR("ReceiveEmailAliasAddresses"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("ReceiveEmailAliasAddresses"));
      _MFUnlockGlobalLock();
      _resetAllEmailAddresses();
    }
  }
}

- (id)lastEmailAliasesSyncDate
{
  id result;
  void *v3;

  result = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("LastEmailAliasesSyncDate"));
  if (result)
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(result, "doubleValue");
    return (id)objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  }
  return result;
}

- (void)setLastEmailAliasesSyncDate:(id)a3
{
  id v5;
  id v6;

  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(a3, "timeIntervalSince1970");
  v6 = (id)objc_msgSend(v5, "initWithDouble:");
  _MFLockGlobalLock();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("LastEmailAliasesSyncDate"));
  _MFUnlockGlobalLock();

}

- (id)emailAddressesAndAliases
{
  id v3;
  id v4;
  _BOOL4 v5;
  id v6;
  double v7;

  v3 = -[MailAccount emailAddressesDictionary](self, "emailAddressesDictionary");
  v4 = -[MailAccount receiveEmailAliasAddresses](self, "receiveEmailAliasAddresses");
  if (!v4)
  {
    v6 = -[MailAccount lastEmailAliasesSyncDate](self, "lastEmailAliasesSyncDate");
    if (v6 && (objc_msgSend(v6, "timeIntervalSinceNow"), v7 >= -600.0)
      || !-[MailAccount updateEmailAliases](self, "updateEmailAliases"))
    {
      v4 = 0;
      v5 = v3 != 0;
      goto LABEL_10;
    }
    v4 = -[MailAccount receiveEmailAliasAddresses](self, "receiveEmailAliasAddresses");
    -[MFAccount savePersistentAccount](self, "savePersistentAccount");
  }
  v5 = v3 != 0;
  if (v3 && v4)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    return v3;
  }
LABEL_10:
  if (!v5)
    return v4;
  return v3;
}

- (void)_invalidateAndDeleteAccountData:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  MailAccount *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "disableMailboxListingNotifications");
  -[MailAccount releaseAllConnections](self, "releaseAllConnections");
  -[MFLock lock](self->_deletionLock, "lock");
  _invalidateMailboxCache((uint64_t)self);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 7);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 4);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 3);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 5);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 2);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 1);
  objc_msgSend(-[MailAccount library](self, "library"), "invalidateAccount:", self);
  if (v3)
  {
    v5 = objc_msgSend(-[MailAccount allMailboxUids](self, "allMailboxUids"), "arrayByApplyingSelector:", sel_URLString);
    v6 = -[MailAccount allLocalMailboxUids](self, "allLocalMailboxUids");
    -[MailAccount path](self, "path");
    MFRemoveItemAtPath();
    objc_msgSend(-[MailAccount library](self, "library"), "deleteMailboxes:account:", v5, self);
    if (objc_msgSend(v6, "count"))
    {
      v22 = self;
      v7 = +[LocalAccount localAccount](LocalAccount, "localAccount");
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v28 != v10)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v7, "deleteMailbox:", v12);
            v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            objc_msgSend(v13, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("MailboxUserInfoDidChange"), v12, 0));
          }
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v9);
      }
      _invalidateMailboxCache((uint64_t)v7);
      self = v22;
    }
    v14 = +[MailAccount outboxMessageStore:](MailAccount, "outboxMessageStore:", 1);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = (void *)objc_msgSend(v14, "copyOfAllMessagesWithOptions:", 128);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (!+[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:", v21))
            objc_msgSend(v15, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v14, "deleteMessages:moveToTrash:", v15, 0);
      objc_msgSend(v14, "doCompact");
    }

    objc_msgSend(-[MailAccount library](self, "library"), "deleteAccount:", self);
    -[MailAccount _deleteHook](self, "_deleteHook");
    -[MFAccount setPassword:](self, "setPassword:", 0);
    -[MailAccount deleteDeliveryAccountIfNeeded](self, "deleteDeliveryAccountIfNeeded");
  }
  -[MFLock unlock](self->_deletionLock, "unlock");
  objc_msgSend((id)objc_opt_class(), "enableMailboxListingNotifications:", 1);
}

- (void)_asynchronouslyInvalidateAndDeleteAccountData:(BOOL)a3
{
  NSObject *global_queue;
  _QWORD v6[5];
  BOOL v7;

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__MailAccount__asynchronouslyInvalidateAndDeleteAccountData___block_invoke;
  v6[3] = &unk_1E81CA0D8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(global_queue, v6);
}

uint64_t __61__MailAccount__asynchronouslyInvalidateAndDeleteAccountData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAndDeleteAccountData:", *(unsigned __int8 *)(a1 + 40));
}

- (void)invalidate
{
  -[MailAccount _asynchronouslyInvalidateAndDeleteAccountData:](self, "_asynchronouslyInvalidateAndDeleteAccountData:", 0);
}

- (void)invalidateAndDelete
{
  -[MailAccount _invalidateAndDeleteAccountData:](self, "_invalidateAndDeleteAccountData:", 1);
}

+ (void)saveStateForAllAccounts
{
  id v2;

  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v2 = (id)objc_msgSend((id)_accounts, "copy");
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  objc_msgSend(v2, "makeObjectsPerformSelector:withObject:", sel_saveState, 0);

}

- (void)releaseAllForcedConnections
{
  objc_msgSend(-[MailAccount deliveryAccount](self, "deliveryAccount"), "releaseAllForcedConnections");
}

- (BOOL)canFetch
{
  return -[MFAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]);
}

- (void)_synchronizeMailboxListWithFileSystem
{
  id v3;
  void *v4;

  v3 = -[MailAccount _mailboxPathPrefix](self, "_mailboxPathPrefix");
  v4 = (void *)objc_msgSend(-[MailAccount path](self, "path"), "mutableCopyWithZone:", 0);
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "appendString:", CFSTR("/"));
    objc_msgSend(v4, "appendString:", -[MailAccount _mailboxPathPrefix](self, "_mailboxPathPrefix"));
  }
  -[MailAccount mf_lock](self, "mf_lock");
  -[MailAccount _loadEntriesFromFileSystemPath:parent:](self, "_loadEntriesFromFileSystemPath:parent:", v4, -[MailAccount rootMailboxUid](self, "rootMailboxUid"));
  -[MailAccount mf_unlock](self, "mf_unlock");

  *(_DWORD *)&self->_flags &= ~0x40000u;
  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
  -[MailAccount resetSpecialMailboxes](self, "resetSpecialMailboxes");
  -[MailAccount emptyTrash](self, "emptyTrash");
}

- (void)nowWouldBeAGoodTimeToStartBackgroundSynchronization
{
  id v3;

  v3 = +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
  objc_msgSend(v3, "addInvocation:", +[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", sel__synchronizeMailboxListWithFileSystem, self, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SYNCHRONIZING_WITH_FILE_SYSTEM_FORMAT"), (uint64_t)CFSTR("Synchronizing with file system"), 0), -[MailAccount displayName](self, "displayName")), 0, 0));
}

- (void)forceFetchMailboxList
{
  objc_msgSend(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"), "addInvocation:", +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", sel_resetMailboxTimer, self));
  objc_msgSend(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"), "addInvocation:", +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", sel_fetchMailboxList, self));
}

- (BOOL)canAppendMessages
{
  return 1;
}

- (id)primaryMailboxUid
{
  return -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 7, 1);
}

- (id)allMailMailboxUid
{
  return 0;
}

- (id)rootMailboxUid
{
  MFMailboxUid *v3;

  _configureMailboxCache((uint64_t)self);
  -[MailAccount mf_lock](self, "mf_lock");
  v3 = self->_rootMailboxUid;
  -[MailAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (BOOL)shouldExpungeMessagesOnDelete
{
  return 0;
}

- (void)deleteDeliveryAccountIfNeeded
{
  id v3;
  id v4;

  v3 = -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0);
  if (v3)
  {
    v4 = v3;
    if (!-[MailAccount deliveryAccountInUseByOtherAccounts:](self, "deliveryAccountInUseByOtherAccounts:", v3))
      +[DeliveryAccount removeDeliveryAccount:](DeliveryAccount, "removeDeliveryAccount:", v4);
  }
}

- (BOOL)deliveryAccountInUseByOtherAccounts:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "uniqueId");
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)_accounts;
  v5 = objc_msgSend((id)_accounts, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = (NSString *)objc_msgSend(v10, "uniqueId");
        if (v11 != -[MFAccount uniqueId](self, "uniqueId"))
        {
          v12 = (void *)objc_msgSend(v10, "_deliveryAccountCreateIfNeeded:", 0);
          if (v12 && (objc_msgSend((id)objc_msgSend(v12, "uniqueId"), "isEqualToString:", v4) & 1) != 0)
          {
            v7 = 1;
            goto LABEL_24;
          }
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v13 = (void *)objc_msgSend(v10, "deliveryAccountAlternates");
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v21;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v21 != v16)
                  objc_enumerationMutation(v13);
                if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "uniqueId"), "isEqualToString:", v4) & 1) != 0)
                {
                  v7 = 1;
                  goto LABEL_19;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v15)
                continue;
              break;
            }
          }
        }
LABEL_19:
        ;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_24:
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return v7 & 1;
}

- (BOOL)isSpecialMailbox:(id)a3
{
  if ((objc_msgSend(a3, "isStandardizedMailboxUid") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isStore") ^ 1;
}

- (id)allMailboxUids
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = -[MailAccount rootMailboxUid](self, "rootMailboxUid");
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  while (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(v4, "lastObject"), "mutableCopyOfChildren");
    objc_msgSend(v3, "addObjectsFromArray:", v6);
    objc_msgSend(v4, "removeLastObject");
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  }
  v7 = objc_msgSend(v3, "indexOfObject:", -[MailAccount primaryMailboxUid](self, "primaryMailboxUid"));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "exchangeObjectAtIndex:withObjectAtIndex:", 0, v7);
  return v3;
}

- (id)mailboxesForSuggestionsLostMessageSearchPriorToTime:(double)a3
{
  id v5;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MailAccount allMailMailboxUid](self, "allMailMailboxUid");
  if (v5)
  {
    v10[0] = v5;
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  }
  else
  {
    v7 = -[MailAccount allMailboxUids](self, "allMailboxUids");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke;
    v9[3] = &__block_descriptor_40_e22_B16__0__MFMailboxUid_8l;
    *(double *)&v9[4] = a3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2;
    v8[3] = &__block_descriptor_40_e39_q24__0__MFMailboxUid_8__MFMailboxUid_16l;
    *(double *)&v8[4] = a3;
    return (id)objc_msgSend((id)objc_msgSend(v7, "ef_filter:", v9), "sortedArrayUsingComparator:", v8);
  }
}

uint64_t __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v5;
  double v6;

  if (objc_msgSend(a2, "type") == 3 || objc_msgSend(a2, "type") == 1)
    return 0;
  result = objc_msgSend(a2, "isStore");
  if ((_DWORD)result)
  {
    v5 = *(double *)(a1 + 32);
    if (v5 == 0.0)
      return 1;
    objc_msgSend(a2, "suggestionsLostMessageSearchTimestamp");
    return v5 >= v6;
  }
  return result;
}

uint64_t __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;

  if (*(double *)(a1 + 32) != 0.0)
  {
    objc_msgSend(a2, "suggestionsLostMessageSearchTimestamp");
    v6 = v5;
    objc_msgSend(a3, "suggestionsLostMessageSearchTimestamp");
    if (v6 < v7)
      return -1;
    objc_msgSend(a2, "suggestionsLostMessageSearchTimestamp");
    v10 = v9;
    objc_msgSend(a3, "suggestionsLostMessageSearchTimestamp");
    if (v10 > v11)
      return 1;
  }
  v12 = objc_msgSend(a2, "suggestionsLostMessageSearchResultCount");
  if (v12 > objc_msgSend(a3, "suggestionsLostMessageSearchResultCount"))
    return 1;
  v13 = objc_msgSend(a2, "suggestionsLostMessageSearchResultCount");
  if (v13 >= objc_msgSend(a3, "suggestionsLostMessageSearchResultCount"))
    return 0;
  else
    return -1;
}

- (id)transferDisabledMailboxUids
{
  return 0;
}

- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (objc_msgSend(a3, "URLString") && -[MailAccount isActive](self, "isActive"))
  {
    if (-[MailAccount _canEmptyMessagesFromMailboxUid:](self, "_canEmptyMessagesFromMailboxUid:", a3))
      objc_msgSend(-[MailAccount storeForMailboxUid:](self, "storeForMailboxUid:", a3), "deleteMessagesOlderThanNumberOfDays:compact:", v4, 1);
  }
}

- (void)_setEmptyFrequency:(int)a3 forKey:(id)a4
{
  uint64_t v6;

  v6 = EFStringWithInt();
  _MFLockGlobalLock();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, a4);
  _MFUnlockGlobalLock();
}

- (int)emptyFrequencyForMailboxType:(int)a3
{
  return -[MailAccount _emptyFrequencyForKey:defaultValue:](self, "_emptyFrequencyForKey:defaultValue:", CFSTR("NumberOfDaysToKeepTrash"), CFSTR("7"));
}

- (void)setEmptyFrequency:(int)a3 forMailboxType:(int)a4
{
  -[MailAccount _setEmptyFrequency:forKey:](self, "_setEmptyFrequency:forKey:", *(_QWORD *)&a3, CFSTR("NumberOfDaysToKeepTrash"));
}

+ (id)csAccountTypeString
{
  return (id)getCSAccountTypeUnknown();
}

+ (void)synchronouslyEmptyMailboxUidType:(int)a3 inAccounts:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v5 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(a4);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if ((objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "shouldCancel") & 1) != 0)break;
      v11 = objc_msgSend(v10, "mailboxUidOfType:createIfNeeded:", v5, 0);
      if (v11)
        objc_msgSend(v10, "deleteMessagesFromMailboxUid:olderThanNumberOfDays:", v11, 0);
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (id)displayNameForMailboxUid:(id)a3
{
  if (self->_rootMailboxUid == a3)
    return -[MailAccount displayName](self, "displayName");
  else
    return -[MailAccount _pathComponentForUidName:](self, "_pathComponentForUidName:", objc_msgSend(a3, "name"));
}

+ (id)mailboxUidForFileSystemPath:(id)a3 create:(BOOL)a4
{
  id result;
  _BOOL8 v5;
  CFIndex Count;
  CFIndex v8;
  void *ValueAtIndex;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;

  result = 0;
  if (!a3 || !_sortedAccountPaths)
    return result;
  v5 = a4;
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  Count = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
  if (Count < 1)
    goto LABEL_19;
  v8 = 0;
  while (1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_sortedAccountPaths, v8);
    if ((objc_msgSend(a3, "mf_isSubdirectoryOfPath:", ValueAtIndex) & 1) != 0
      || (objc_msgSend(a3, "isEqualToString:", ValueAtIndex) & 1) != 0)
    {
      break;
    }
    if (Count == ++v8)
      goto LABEL_19;
  }
  if (!ValueAtIndex)
    goto LABEL_19;
  v10 = objc_msgSend(a3, "rangeOfString:options:", ValueAtIndex, 8);
  v12 = v11;
  v13 = objc_msgSend(a3, "length");
  v14 = v10 + v12;
  if (v14 != objc_msgSend(ValueAtIndex, "length"))
    goto LABEL_19;
  if (v14 == v13)
  {
    v15 = 0;
  }
  else
  {
    if (objc_msgSend(a3, "characterAtIndex:", v14) != 47)
    {
LABEL_19:
      +[MailAccount mf_unlock](MailAccount, "mf_unlock");
      goto LABEL_20;
    }
    v13 = v14 + 1;
    v15 = objc_msgSend(a3, "length") - (v14 + 1);
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_19;
  v16 = (void *)CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v8);
  v17 = v16;
  if (!v16)
    goto LABEL_19;
  v18 = objc_msgSend(a3, "substringWithRange:", v13, v15);
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  if (!v18)
  {
LABEL_20:
    result = 0;
    goto LABEL_21;
  }
  result = (id)objc_msgSend(v16, "mailboxUidForRelativePath:create:", v18, v5);
LABEL_21:
  if (Count >= 1 && result == 0)
    return (id)objc_msgSend(+[LocalAccount localAccount](LocalAccount, "localAccount"), "mailboxUidForFileSystemPath:", a3);
  return result;
}

- (NSString)mailboxPathExtension
{
  return (NSString *)&stru_1E81CBE50;
}

- (BOOL)canCreateNewMailboxes
{
  return 1;
}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend(a3, "pathComponents"), "count");
  v6 = v5;
  if (a4)
  {
    if (v5 == 1)
      v7 = 0;
    else
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("MAILBOX_NAME_INCLUDES_PATH_SEPARATOR"), (uint64_t)CFSTR("Mailbox names may not include “%@”."), CFSTR("Delayed")), CFSTR("/"));
    *a4 = v7;
  }
  return v6 == 1;
}

- (BOOL)canMailboxBeRenamed:(id)a3
{
  int v5;

  if ((objc_msgSend(a3, "isEqual:", self->_rootMailboxUid) & 1) != 0)
    return 0;
  v5 = objc_msgSend(a3, "type");
  return v5 == -100 || v5 == 0;
}

- (BOOL)canMailboxBeDeleted:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self->_rootMailboxUid) ^ 1;
}

- (BOOL)moveMailbox:(id)a3 intoParent:(id)a4
{
  return -[MailAccount renameMailbox:newName:parent:](self, "renameMailbox:newName:parent:", a3, 0, a4);
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4
{
  return -[MailAccount renameMailbox:newName:parent:](self, "renameMailbox:newName:parent:", a3, a4, objc_msgSend(a3, "parent"));
}

- (BOOL)_renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const std::__fs::filesystem::path *v17;
  const std::__fs::filesystem::path *v18;
  std::error_code *v19;
  int v20;
  int v21;
  char v22;
  const std::__fs::filesystem::path *v23;
  const std::__fs::filesystem::path *v24;
  std::error_code *v25;
  int v26;
  MFError *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  char v37;
  BOOL v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(a3, "fullPath");
  v37 = objc_msgSend(a3, "attributes");
  v10 = (id)objc_msgSend(a3, "parent");
  -[MailAccount mf_lock](self, "mf_lock");
  v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "depthFirstEnumerator"), "allObjects");
  v12 = objc_msgSend(v11, "arrayByApplyingSelector:", sel_URLString);
  if (a4)
    objc_msgSend(a3, "setName:", -[MailAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", a4));
  if (a5)
    objc_msgSend(a3, "setParent:", a5);
  objc_msgSend(v11, "makeObjectsPerformSelector:", sel_flushCriteria);
  v13 = objc_msgSend(v11, "arrayByApplyingSelector:", sel_URLString);
  v14 = (void *)objc_msgSend(a3, "fullPath");
  v15 = objc_msgSend(v14, "stringByDeletingLastPathComponent");
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if ((objc_msgSend(v16, "fileExistsAtPath:", v15) & 1) == 0
    && !objc_msgSend(v16, "mf_makeCompletePath:mode:", v15, 448)
    || objc_msgSend(v16, "fileExistsAtPath:", v9)
    && (v17 = (const std::__fs::filesystem::path *)objc_msgSend(v9, "fileSystemRepresentation"),
        v18 = (const std::__fs::filesystem::path *)objc_msgSend(v14, "fileSystemRepresentation"),
        rename(v17, v18, v19),
        v20))
  {
    -[MailAccount mf_unlock](self, "mf_unlock");
LABEL_16:
    v27 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1033, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("RENAME_FAILED"), (uint64_t)CFSTR("Mail was unable to rename “%@”."), CFSTR("Delayed")), objc_msgSend(v9, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath")));
    v28 = 0;
    goto LABEL_19;
  }
  v21 = objc_msgSend(-[MailAccount library](self, "library"), "renameMailboxes:to:", v12, v13);
  v22 = v21;
  if (!v21 || (v37 & 3) != 0)
  {
    -[MailAccount mf_unlock](self, "mf_unlock");
    if ((v22 & 1) == 0)
      goto LABEL_16;
  }
  else
  {
    v9 = (void *)objc_msgSend(v9, "stringByDeletingPathExtension");
    if ((objc_msgSend(v16, "fileExistsAtPath:", v9) & 1) != 0)
    {
      v23 = (const std::__fs::filesystem::path *)objc_msgSend(v9, "fileSystemRepresentation");
      v24 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(v14, "stringByDeletingPathExtension"), "fileSystemRepresentation");
      rename(v23, v24, v25);
      LODWORD(v23) = v26;
      -[MailAccount mf_unlock](self, "mf_unlock");
      if ((_DWORD)v23)
        goto LABEL_16;
    }
    else
    {
      -[MailAccount mf_unlock](self, "mf_unlock");
    }
  }
  v27 = 0;
  v28 = 1;
LABEL_19:
  if (-[MFError localizedDescription](v27, "localizedDescription"))
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v27);
  if ((objc_msgSend(a5, "isEqual:", v10) & 1) == 0
    && ((v28 ^ 1) & 1) == 0
    && objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationAreEnabled"))
  {
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v29, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), v10, 0));
  }
  v38 = v28;
  v30 = v10;
  if (a5
    && (*((_BYTE *)&self->_flags + 2) & 2) != 0
    && objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationAreEnabled"))
  {
    v31 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v31, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), a5, 0));
  }
  if (!v27)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v32 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v40 != v34)
            objc_enumerationMutation(v11);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MFMailboxUidWasRenamedNotification"), *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), 0);
        }
        v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v33);
    }
  }
  -[MailAccount _synchronouslyLoadListingForParent:](self, "_synchronouslyLoadListingForParent:", a5);
  if ((objc_msgSend(a5, "isEqual:", v30) & 1) == 0)
    -[MailAccount _synchronouslyLoadListingForParent:](self, "_synchronouslyLoadListingForParent:", v30);

  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
  return v38;
}

- (BOOL)deleteMailbox:(id)a3
{
  unint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  $79341312EFB130D828C53DE6771A49BA flags;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  id *v19;
  int *v20;
  id v21;
  uint64_t v23;
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = 0x1E81C8000uLL;
  v6 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v7 = objc_msgSend(a3, "type");
  v8 = objc_msgSend(a3, "fullPath");
  v9 = (void *)objc_msgSend(a3, "depthFirstEnumerator");
  v10 = (void *)objc_msgSend(v9, "nextObject");
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0;
  if ((objc_msgSend(v6, "shouldCancel") & 1) == 0 && v10)
  {
    v23 = v8;
    v24 = v7;
    do
    {
      v12 = objc_msgSend(v10, "parent");
      v13 = -[MailAccount _deleteMailbox:](self, "_deleteMailbox:", v10);
      if (v13)
      {
        objc_msgSend(v11, "addObject:", objc_msgSend(v10, "URLString"));
        if (v9)
          v14 = objc_msgSend(v9, "nextObject");
        else
          v14 = 0;
        flags = self->_flags;
        if ((*(_DWORD *)&flags & 0x40000) == 0)
          self->_flags = ($79341312EFB130D828C53DE6771A49BA)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
        objc_msgSend(v10, "setParent:", 0);
      }
      else
      {
        v14 = (uint64_t)v10;
      }
      if ((v13 & (objc_msgSend(v6, "shouldCancel") ^ 1)) != 1)
        break;
      v10 = (void *)v14;
    }
    while (v14);
    if (!v13)
    {
      v18 = 0;
      v5 = 0x1E81C8000uLL;
      v7 = v24;
      goto LABEL_22;
    }
    v5 = 0x1E81C8000;
    v7 = v24;
    v8 = v23;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v8)
    && MFRemoveItemAtPath())
  {
    v16 = v8;
    v17 = MFLogGeneral();
    v18 = 1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl(&dword_1C8839000, v17, OS_LOG_TYPE_INFO, "failed to remove path %@", buf, 0xCu);
    }
  }
  else
  {
    v18 = 1;
  }
LABEL_22:
  if (objc_msgSend(v11, "count"))
    objc_msgSend(-[MailAccount library](self, "library"), "deleteMailboxes:account:", v11, self);

  if (v18)
  {
    v19 = 0;
    v20 = &OBJC_IVAR___MailAccount__inboxMailboxUid;
    switch(v7)
    {
      case 0:
        goto LABEL_37;
      case 1:
        v20 = &OBJC_IVAR___MailAccount__junkMailboxUid;
        goto LABEL_33;
      case 2:
        v20 = &OBJC_IVAR___MailAccount__archiveMailboxUid;
        goto LABEL_33;
      case 3:
        v20 = &OBJC_IVAR___MailAccount__trashMailboxUid;
        goto LABEL_33;
      case 4:
        v20 = &OBJC_IVAR___MailAccount__sentMessagesMailboxUid;
        goto LABEL_33;
      case 5:
        v20 = &OBJC_IVAR___MailAccount__draftsMailboxUid;
        goto LABEL_33;
      case 7:
LABEL_33:
        v19 = (id *)((char *)&self->super.super.isa + *v20);
        break;
      default:
        break;
    }
    -[MFLock lock](self->_cachedMailboxenLock, "lock");
    if (v19)
    {

      *v19 = 0;
    }
    -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
  }
  else if (!objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2424), "currentMonitor"), "error"))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2424), "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("DELETE_FAILED_FORMAT"), (uint64_t)CFSTR("Unable to delete “%@”."), CFSTR("Delayed")), objc_msgSend(a3, "accountRelativePath"))));
  }
LABEL_37:
  if (v12)
  {
    v21 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2424), "currentMonitor"), "error");
    -[MailAccount _synchronouslyLoadListingForParent:](self, "_synchronouslyLoadListingForParent:", v12);
    -[MailAccount mf_lock](self, "mf_lock");
    -[MailAccount _setChildren:forMailboxUid:](self, "_setChildren:forMailboxUid:", 0, v12);
    -[MailAccount mf_unlock](self, "mf_unlock");
    if (v21)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2424), "currentMonitor"), "setError:", v21);

    }
  }
  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
  return v18;
}

- (void)_resetAllMailboxURLs:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[MailAccount isActive](self, "isActive"))
  {
    v5 = +[MailAccount mailAccounts](MailAccount, "mailAccounts");
    if (v5)
    {
      if (objc_msgSend(v5, "containsObject:", self))
      {
        v6 = -[MailAccount allMailboxUids](self, "allMailboxUids");
        v7 = objc_msgSend(v6, "count");
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v6);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              v15 = objc_msgSend(v14, "URLString");
              if (v15)
              {
                v16 = (void *)v15;
                objc_msgSend(v14, "flushCriteria");
                v17 = objc_msgSend(v14, "URLString");
                if (v17)
                {
                  v18 = v17;
                  if ((objc_msgSend(v16, "isEqualToString:", v17) & 1) == 0)
                  {
                    objc_msgSend(v8, "addObject:", v16);
                    objc_msgSend(v9, "addObject:", v18);
                  }
                }
              }
            }
            v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v11);
        }
        if (objc_msgSend(v9, "count"))
        {
          if (v3)
            objc_msgSend(-[MailAccount library](self, "library"), "renameMailboxes:to:", v8, v9);
        }
      }
    }
  }
}

- (void)resetMailboxURLs
{
  -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 0);
}

- (void)setUsername:(id)a3
{
  NSString *v5;
  const __CFString *v6;
  __CFString *v7;
  objc_super v8;

  v5 = -[MFAccount username](self, "username");
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_1E81CBE50;
  v8.receiver = self;
  v8.super_class = (Class)MailAccount;
  -[MFAccount setUsername:](&v8, sel_setUsername_, a3);
  v7 = -[MFAccount username](self, "username");
  if (!v7)
    v7 = &stru_1E81CBE50;
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v6) & 1) == 0)
    -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 0);
}

- (void)setHostname:(id)a3
{
  NSString *v5;
  const __CFString *v6;
  __CFString *v7;
  objc_super v8;

  v5 = -[MFAccount hostname](self, "hostname");
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_1E81CBE50;
  v8.receiver = self;
  v8.super_class = (Class)MailAccount;
  -[MFAccount setHostname:](&v8, sel_setHostname_, a3);
  v7 = -[MFAccount hostname](self, "hostname");
  if (!v7)
    v7 = &stru_1E81CBE50;
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v6) & 1) == 0)
    -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 0);
}

- (BOOL)isHostnameEquivalentTo:(id)a3
{
  return -[MFAccount hostname](self, "hostname") == a3
      || -[NSString isEqualToString:](-[MFAccount hostname](self, "hostname"), "isEqualToString:", a3);
}

- (BOOL)isAccountClassEquivalentTo:(id)a3
{
  objc_class *v4;
  objc_class *v5;

  v4 = (objc_class *)objc_opt_class();
  if (NSStringFromClass(v4) == a3)
    return 1;
  v5 = (objc_class *)objc_opt_class();
  return -[NSString isEqualToString:](NSStringFromClass(v5), "isEqualToString:", a3);
}

- (void)setPortNumber:(unsigned int)a3
{
  uint64_t v3;
  unsigned int v5;
  int v6;
  unsigned int v7;
  int v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v5 = -[MFAccount portNumber](self, "portNumber");
  v6 = v5 == -[MFAccount defaultPortNumber](self, "defaultPortNumber")
    || v5 == -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber");
  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  -[MFAccount setPortNumber:](&v9, sel_setPortNumber_, v3);
  v7 = -[MFAccount portNumber](self, "portNumber");
  v8 = v7 == -[MFAccount defaultPortNumber](self, "defaultPortNumber")
    || v7 == -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber");
  if (v7 != v5)
  {
    if (v6 != v8)
      LOBYTE(v8) = 0;
    if ((v8 & 1) == 0)
      -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 0);
  }
}

- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4
{
  objc_super v7;

  if ((objc_msgSend(a4, "isEqual:", CFSTR("Hostname")) & 1) != 0
    || (objc_msgSend(a4, "isEqual:", CFSTR("Username")) & 1) != 0
    || objc_msgSend(a4, "isEqual:", CFSTR("PortNumber")))
  {
    objc_msgSend(-[MailAccount allMailboxUids](self, "allMailboxUids"), "makeObjectsPerformSelector:", sel_URLString);
    v7.receiver = self;
    v7.super_class = (Class)MailAccount;
    -[MFAccount setValueInAccountProperties:forKey:](&v7, sel_setValueInAccountProperties_forKey_, a3, a4);
    -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 1);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MailAccount;
    -[MFAccount setValueInAccountProperties:forKey:](&v7, sel_setValueInAccountProperties_forKey_, a3, a4);
  }
}

- (void)setConnectionError:(id)a3
{
  id v5;
  MFError *lastConnectionError;

  v5 = a3;
  _MFLockGlobalLock();
  lastConnectionError = self->_lastConnectionError;
  self->_lastConnectionError = (MFError *)a3;
  _MFUnlockGlobalLock();

  if ((a3 != 0) == (lastConnectionError == 0))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AccountOfflineStatusDidChange"), self, 0);
}

- (id)connectionError
{
  MFError *v3;

  _MFLockGlobalLock();
  v3 = self->_lastConnectionError;
  _MFUnlockGlobalLock();
  return v3;
}

- (id)storeForMailboxUid:(id)a3
{
  id v4;

  if (!a3 || self->_rootMailboxUid == a3)
    return 0;
  v4 = -[MFWeakObjectCache objectForKey:](self->_messageStoresCache, "objectForKey:");
  objc_msgSend(v4, "setLibrary:", -[MailAccount library](self, "library"));
  return v4;
}

- (Class)storeClass
{
  -[MailAccount doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailAccount storeClass]", "MailAccount.m", 2461, "0");
}

+ (MailAccount)accountWithURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MailAccount *v21;
  id v22;
  uint64_t v23;
  _BOOL4 v24;
  unsigned int v25;
  NSString *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "scheme");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = objc_msgSend(a3, "user");
  v8 = (void *)objc_msgSend(a3, "ef_hostNilForEmpty");
  v9 = (void *)objc_msgSend(a3, "port");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = (void *)objc_msgSend(a1, "mailAccounts");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v16, "isActive"))
          objc_msgSend(v10, "insertObject:atIndex:", v16, 0);
        else
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v13);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (!v17)
    return 0;
  v18 = v17;
  v19 = *(_QWORD *)v30;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v10);
      v21 = *(MailAccount **)(*((_QWORD *)&v29 + 1) + 8 * v20);
      v22 = -[MailAccount _URLScheme](v21, "_URLScheme");
      if (!v22 || objc_msgSend(v22, "caseInsensitiveCompare:", v6))
        goto LABEL_19;
      v23 = -[MFAccount hostname](v21, "hostname");
      if (v8 == (void *)v23)
      {
        v24 = 1;
      }
      else
      {
        if (!v8)
          goto LABEL_19;
        v24 = objc_msgSend(v8, "caseInsensitiveCompare:", v23) == 0;
        if (!v24)
          goto LABEL_32;
      }
      if (v9)
      {
        v25 = -[MFAccount portNumber](v21, "portNumber");
        if (!v25
          && (!-[MFAccount usesSSL](v21, "usesSSL")
           || (v25 = -[MFAccount defaultSecurePortNumber](v21, "defaultSecurePortNumber")) == 0))
        {
          v25 = -[MFAccount defaultPortNumber](v21, "defaultPortNumber");
        }
        v24 = objc_msgSend(v9, "unsignedIntValue") == v25;
      }
LABEL_32:
      if (v24 && v7)
      {
        v26 = -[MFAccount username](v21, "username");
        if (v26 && -[NSString caseInsensitiveCompare:](v26, "caseInsensitiveCompare:", v7) == NSOrderedSame)
          return v21;
      }
      else if (v24)
      {
        return v21;
      }
LABEL_19:
      ++v20;
    }
    while (v18 != v20);
    v27 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    v18 = v27;
  }
  while (v27);
  return 0;
}

+ (id)infoForURL:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "accountWithURL:"), "_infoForMatchingURL:", a3);
}

+ (MailAccount)accountWithURLString:(id)a3
{
  void *v4;
  MailAccount *v5;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", a3);
  v5 = (MailAccount *)objc_msgSend(a1, "accountWithURL:", v4);

  return v5;
}

+ (id)mailboxUidFromActiveAccountsForURL:(id)a3
{
  id v3;

  if (!a3)
    return 0;
  v3 = +[MailAccount infoForURL:](MailAccount, "infoForURL:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:"));
  return (id)objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("Account")), "mailboxUidForInfo:", v3);
}

- (void)emptyTrash
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[MailAccount emptyFrequencyForMailboxType:](self, "emptyFrequencyForMailboxType:", 3);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    v5 = -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 3, 0);
    if (v5)
      -[MailAccount deleteMessagesFromMailboxUid:olderThanNumberOfDays:](self, "deleteMessagesFromMailboxUid:olderThanNumberOfDays:", v5, v4);
  }
}

- (BOOL)updateEmailAliases
{
  -[MailAccount setLastEmailAliasesSyncDate:](self, "setLastEmailAliasesSyncDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  return 0;
}

+ (void)updateEmailAliasesForActiveAccounts
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = +[MailAccount activeAccounts](MailAccount, "activeAccounts", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(v7, "lastEmailAliasesSyncDate");
        if (v8)
        {
          objc_msgSend(v8, "timeIntervalSinceNow");
          if (v9 >= -600.0)
            continue;
        }
        if (objc_msgSend(v7, "updateEmailAliases"))
          objc_msgSend(v7, "savePersistentAccount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
}

+ (id)standardAccountClass:(Class)a3 valueForKey:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _MFLockGlobalLock();
  if (!standardAccountClass_valueForKey__standardAccountValues)
    standardAccountClass_valueForKey__standardAccountValues = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!standardAccountClass_valueForKey__loadedBundles)
    standardAccountClass_valueForKey__loadedBundles = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v8 = objc_msgSend(v7, "bundleIdentifier");
  if ((objc_msgSend((id)standardAccountClass_valueForKey__loadedBundles, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend((id)standardAccountClass_valueForKey__loadedBundles, "addObject:", v8);
    v9 = objc_msgSend(v7, "pathForResource:ofType:", CFSTR("ISP"), CFSTR("plist"));
    v10 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v9);
    if (v10)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
      if (v11)
      {
        v12 = v11;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v13 = (void *)objc_msgSend(v11, "allKeys", 0);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v23 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              v19 = objc_msgSend(v12, "objectForKey:", v18);
              objc_msgSend((id)standardAccountClass_valueForKey__standardAccountValues, "setObject:forKey:", v19, v18);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v15);
        }
      }
    }
  }
  if (standardAccountClass_valueForKey__standardAccountValues)
    v20 = (void *)objc_msgSend((id)objc_msgSend((id)standardAccountClass_valueForKey__standardAccountValues, "objectForKey:", NSStringFromClass(a3)), "objectForKey:", a4);
  else
    v20 = 0;
  _MFUnlockGlobalLock();
  return v20;
}

+ (id)predefinedValueForKey:(id)a3
{
  return (id)objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, a3);
}

- (int64_t)libraryID
{
  id v3;
  int64_t v4;
  int64_t v5;

  v3 = -[MailAccount library](self, "library");
  -[MFLock lock](self->_cachedLibraryIDLock, "lock");
  if (self->_cachedLibraryID < 0)
  {
    v4 = objc_msgSend(v3, "libraryIDForAccount:", self);
    self->_cachedLibraryID = v4;
    if (v4 < 0)
    {
      v5 = objc_msgSend(v3, "createLibraryIDForAccount:", self);
      self->_cachedLibraryID = v5;
      if (v5 < 0)
        -[MailAccount libraryID].cold.1();
    }
  }
  -[MFLock unlock](self->_cachedLibraryIDLock, "unlock");
  return self->_cachedLibraryID;
}

- (BOOL)canForwardWithoutDownload
{
  return 0;
}

- (void)setLibrary:(id)a3
{
  MFMessageLibrary *library;

  library = self->_library;
  if (library != a3)
  {

    self->_library = (MFMessageLibrary *)a3;
  }
}

+ (BOOL)usernameIsEmailAddress
{
  return 0;
}

- (BOOL)shouldAppearInMailSettings
{
  return 1;
}

- (BOOL)supportsAppend
{
  return 0;
}

- (BOOL)supportsRemoteAppend
{
  return 0;
}

- (BOOL)supportsSyncingReadState
{
  return 1;
}

- (BOOL)supportsMailboxEditing
{
  return 0;
}

- (BOOL)supportsPurge
{
  return 1;
}

- (void)setCachePolicy:(int)a3
{
  unsigned int v3;

  v3 = a3;
  if (-[MailAccount cachePolicy](self, "cachePolicy") != a3)
  {
    if (v3 > 3)
      v3 = 0;
    _MFLockGlobalLock();
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", _cachePolicyNames[v3], CFSTR("CachePolicy"));
    _MFUnlockGlobalLock();
  }
}

- (int)cachePolicy
{
  id v2;
  uint64_t v3;

  v2 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("CachePolicy"));
  v3 = 0;
  while ((objc_msgSend(v2, "isEqualToString:", _cachePolicyNames[v3]) & 1) == 0)
  {
    if (++v3 == 4)
    {
      LODWORD(v3) = 0;
      return v3;
    }
  }
  return v3;
}

- (BOOL)archiveSentMessages
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("SaveSentMessages"), 1);
}

- (BOOL)supportsMessageFlagging
{
  return 1;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 0;
}

- (BOOL)deleteInPlaceForAllMailboxes
{
  return 0;
}

- (BOOL)deleteInPlaceForMailbox:(id)a3
{
  return 0;
}

- (id)statisticsKind
{
  return 0;
}

- (BOOL)needsRemoteSearchResultsVerification
{
  return 0;
}

- (id)loggingIdentifier
{
  id v3;
  NSString *v4;

  v3 = -[MailAccount statisticsKind](self, "statisticsKind");
  v4 = -[NSString substringToIndex:](-[MFAccount uniqueId](self, "uniqueId"), "substringToIndex:", 8);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v4);
}

- (id)meetingStorePersistentID
{
  return 0;
}

- (BOOL)reconstituteOrphanedMeetingInMessage:(id)a3
{
  return 0;
}

- (id)unactionableInvitationICSRepresentationInMessage:(id)a3 summary:(id *)a4
{
  return 0;
}

- (BOOL)hasEnoughInformationForEasySetup
{
  NSUInteger v3;

  v3 = -[NSString length](-[MFAccount hostname](self, "hostname"), "length");
  if (v3)
  {
    v3 = -[NSString length](-[MFAccount username](self, "username"), "length");
    if (v3)
      LOBYTE(v3) = objc_msgSend(-[MFAccount password](self, "password"), "length") != 0;
  }
  return v3;
}

+ (BOOL)getConfigurationFromServerForEmail:(id)a3
{
  return 0;
}

- (BOOL)canReceiveNewMailNotifications
{
  return 0;
}

- (BOOL)_registerPushNotificationPrefix:(id)a3 forMailboxNames:(id)a4
{
  return 0;
}

- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5
{
  NSMutableDictionary *currentChokedActions;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  -[MailAccount mf_lock](self, "mf_lock");
  currentChokedActions = self->_currentChokedActions;
  if (!currentChokedActions)
  {
    currentChokedActions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_currentChokedActions = currentChokedActions;
  }
  v10 = -[NSMutableDictionary mf_objectForKey:ofClass:](currentChokedActions, "mf_objectForKey:ofClass:", a3, objc_opt_class());
  v11 = v10;
  v12 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("MFMailboxDictClientCount"));
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue") + 1), CFSTR("MFMailboxDictClientCount"));
  v13 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("MFMailboxDictLock"));
  if (v13)
  {
    -[MailAccount mf_unlock](self, "mf_unlock");
    objc_msgSend(v13, "lockWhenCondition:", 2);
    *a5 = (id)objc_msgSend(v10, "objectForKey:", a4);
    -[MailAccount mf_lock](self, "mf_lock");
    v14 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("MFMailboxDictClientCount")), "intValue");
    if (v14 < 2)
      -[NSMutableDictionary removeObjectForKey:](self->_currentChokedActions, "removeObjectForKey:", a3);
    else
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v14 - 1)), CFSTR("MFMailboxDictClientCount"));
    -[MailAccount mf_unlock](self, "mf_unlock");
    objc_msgSend(v13, "unlockWithCondition:", 2);
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("ChokeLock"), 1, 0);
    objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("MFMailboxDictLock"));

    -[MailAccount mf_unlock](self, "mf_unlock");
    objc_msgSend(v15, "lock");
  }

  return v13 != 0;
}

- (void)didFinishActionForChokePoint:(id)a3 coalescePoint:(id)a4 withResult:(id)a5
{
  void *v9;
  void *v10;
  int v11;

  -[MailAccount mf_lock](self, "mf_lock");
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_currentChokedActions, "objectForKey:", a3);
  v10 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("MFMailboxDictLock"));
  v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("MFMailboxDictClientCount")), "intValue");
  if (v11 < 2)
  {
    objc_msgSend(v10, "unlock");
    -[NSMutableDictionary removeObjectForKey:](self->_currentChokedActions, "removeObjectForKey:", a3);
  }
  else
  {
    if (!a5)
      -[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:].cold.1((uint64_t *)&self->_currentChokedActions, (uint64_t)v9);
    objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v11 - 1)), CFSTR("MFMailboxDictClientCount"));
    objc_msgSend(v9, "setObject:forKey:", a5, a4);
    objc_msgSend(v10, "unlockWithCondition:", 2);
  }
  -[MailAccount mf_unlock](self, "mf_unlock");
}

- (void)deliveryAccountWillBeRemoved:(id)a3
{
  id v5;

  v5 = -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0);
  if (v5 == (id)objc_msgSend(a3, "object"))
    -[MailAccount setDeliveryAccount:](self, "setDeliveryAccount:", 0);
}

- (id)pushedMailboxUids
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", -[MailAccount primaryMailboxUid](self, "primaryMailboxUid"));
}

- (BOOL)supportsUserPushedMailboxes
{
  return 0;
}

+ (id)_accountWithPath:(id)a3
{
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "mailboxUidForFileSystemPath:create:", a3, 0);
  if (v4)
    return (id)objc_msgSend(v4, "account");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)_accountsSortedByPath;
  v7 = objc_msgSend((id)_accountsSortedByPath, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v13;
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
    if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(v11, "path")) & 1) != 0)
      return v11;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        goto LABEL_5;
      return 0;
    }
  }
}

+ (void)setDataclassesConsideredActive:(id)a3
{
  if (setDataclassesConsideredActive__pred != -1)
    dispatch_once(&setDataclassesConsideredActive__pred, &__block_literal_global_197);
  objc_msgSend((id)__dataclassesConsideredActiveLock, "lock");
  if ((id)__dataclassesConsideredActive != a3)
  {

    __dataclassesConsideredActive = objc_msgSend(a3, "copy");
  }
  objc_msgSend((id)__dataclassesConsideredActiveLock, "unlock");
}

uint64_t __46__MailAccount_setDataclassesConsideredActive___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("Active Dataclasses Lock"), 0);
  __dataclassesConsideredActiveLock = result;
  return result;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  ACAccount *v5;
  _BOOL4 v6;

  v3 = a3;
  v5 = -[MFAccount persistentAccount](self, "persistentAccount");
  v6 = -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", v5);
  if (v5)
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", v3, *MEMORY[0x1E0C8F3D0]);
  if (-[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", v5) == v3 && v6 != v3)
    -[MailAccount _didBecomeActive:](self, "_didBecomeActive:", v3);
}

- (void)_didBecomeActive:(BOOL)a3
{
  if (a3)
  {
    _configureMailboxCache((uint64_t)self);
    -[MailAccount resetSpecialMailboxes](self, "resetSpecialMailboxes");
  }
  else
  {
    -[MailAccount _asynchronouslyInvalidateAndDeleteAccountData:](self, "_asynchronouslyInvalidateAndDeleteAccountData:");
  }
  _resetAllEmailAddresses();
}

- (int)_emptyFrequencyForKey:(id)a3 defaultValue:(id)a4
{
  id v5;

  v5 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v5, "isEqualToString:", &stru_1E81CBE50))
      v5 = a4;
  }
  return objc_msgSend(v5, "intValue");
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v9;

  v6 = (void *)objc_msgSend(a3, "domain");
  if (!a3)
    return 1;
  v7 = v6;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB31B0]) & 1) != 0)
    return 0;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    return objc_msgSend(a3, "code") != 60 || a4;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("MFMessageErrorDomain")))
    return 1;
  v9 = objc_msgSend(a3, "code");
  if ((unint64_t)(v9 - 1032) <= 0x1B)
    return (0x77FFF7Eu >> (v9 - 8)) & 1;
  else
    return 1;
}

- (void)setMailboxCachePath:(id)a3
{
  NSString *mailboxCachePath;

  mailboxCachePath = self->_mailboxCachePath;
  if (mailboxCachePath != a3)
  {

    self->_mailboxCachePath = (NSString *)a3;
  }
}

- (void)_loadEntriesFromFileSystemPath:(id)a3 parent:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  $79341312EFB130D828C53DE6771A49BA flags;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD context[3];
  _BYTE v28[128];
  uint64_t v29;
  CFRange v30;

  v29 = *MEMORY[0x1E0C80C00];
  v19 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = objc_msgSend(a3, "length");
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context[0] = self;
  context[1] = a3;
  v18 = a4;
  context[2] = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v13, "hasPrefix:", CFSTR(".")) & 1) == 0)
        {
          v22 = 0;
          objc_msgSend(a3, "appendString:", CFSTR("/"));
          objc_msgSend(a3, "appendString:", v13);
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v22))v14 = v22 == 0;
          else
            v14 = 1;
          if (!v14)
          {
            if (-[NSString isEqualToString:](-[MailAccount mailboxPathExtension](self, "mailboxPathExtension"), "isEqualToString:", objc_msgSend(v13, "pathExtension")))
            {
              v13 = (void *)objc_msgSend(v13, "stringByDeletingPathExtension");
            }
            v15 = -[MailAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", v13);
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v15, CFSTR("MailboxName"), &unk_1E81EA158, CFSTR("MailboxAttributes"), 0);
            objc_msgSend(v21, "addObject:", v16);

            v11 = v20;
          }
          objc_msgSend(a3, "deleteCharactersInRange:", v7, objc_msgSend(a3, "length") - v7);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }
  if (-[MailAccount _loadMailboxListingIntoCache:attributes:children:parent:](self, "_loadMailboxListingIntoCache:attributes:children:parent:", objc_msgSend(v18, "name"), 2, v21, v18))
  {
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      self->_flags = ($79341312EFB130D828C53DE6771A49BA)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
  }
  v30.length = objc_msgSend(v21, "count");
  v30.location = 0;
  CFArrayApplyFunction((CFArrayRef)v21, v30, (CFArrayApplierFunction)_recurseIntoFileSystem, context);

  objc_msgSend(v19, "drain");
}

- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3
{
  BOOL v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __CFDictionary *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3
    || ((*(_DWORD *)&self->_flags & 0xFFFEu) >= 0xA ? (v4 = (*(_DWORD *)&self->_flags & 0x40000) == 0) : (v4 = 1), !v4))
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[MailAccount path](self, "path")) & 1) == 0)objc_msgSend(-[MailAccount path](self, "path"), "mf_makeDirectoryWithMode:", 448);
    v5 = -[MailAccount mailboxCachePath](self, "mailboxCachePath");
    -[MailAccount mf_lock](self, "mf_lock");
    v6 = -[MFMailboxUid children](self->_rootMailboxUid, "children");
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v6);
            objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
          }
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }
      v12 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      CFDictionarySetValue(v12, CFSTR("mboxes"), v8);

      -[MailAccount _writeCustomInfoToMailboxCache:](self, "_writeCustomInfoToMailboxCache:", v12);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 200, 0, 0), "writeToFile:options:error:", v5, 1073741825, 0);

    }
    -[MailAccount mf_unlock](self, "mf_unlock");
    self->_flags = ($79341312EFB130D828C53DE6771A49BA)(*((unsigned __int16 *)&self->_flags + 1) << 16);
  }
}

- (BOOL)_deleteMailbox:(id)a3
{
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  return -[NSString stringByAppendingFormat:](-[MFAccount description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" path=%@"), self->_path);
}

- (id)powerAssertionIdentifierWithPrefix:(id)a3
{
  const __CFString *v5;

  if (objc_msgSend(-[MailAccount displayName](self, "displayName"), "length"))
    v5 = -[MailAccount displayName](self, "displayName");
  else
    v5 = &stru_1E81CBE50;
  return (id)objc_msgSend(a3, "stringByAppendingFormat:", CFSTR("-%@-(%@)"), -[MFAccount uniqueId](self, "uniqueId"), v5);
}

+ (void)_setOutboxMailboxUid:(id)a3
{
  objc_msgSend(a1, "mf_lock");
  if ((id)_outboxUid != a3)
  {

    _outboxUid = (uint64_t)a3;
    objc_msgSend((id)_outboxUid, "setType:", 6);
  }
  if (objc_msgSend(a3, "isValid"))
    objc_msgSend((id)objc_msgSend(a3, "account"), "_setChildren:forMailboxUid:", 0, objc_msgSend(a3, "parent"));
  objc_msgSend(a1, "mf_unlock");
}

- (id)_specialMailboxIvarOfType:(int)a3
{
  int v3;

  v3 = a3 - 1;
  if ((a3 - 1) <= 6 && ((0x5Fu >> v3) & 1) != 0)
    return (id *)((char *)&self->super.super.isa + *off_1E81CA510[v3]);
  else
    return 0;
}

- (void)_setSpecialMailbox:(id)a3 forType:(int)a4
{
  uint64_t v4;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v4 = *(_QWORD *)&a4;
  v7 = (__CFString *)objc_msgSend(a3, "accountRelativePath");
  v8 = -[MailAccount specialMailboxNameForType:](self, "specialMailboxNameForType:", v4);
  if (v7 != v8)
  {
    if (v8)
      v9 = v8;
    else
      v9 = &stru_1E81CBE50;
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v9) & 1) == 0)
    {
      -[MailAccount _setSpecialMailboxName:forType:](self, "_setSpecialMailboxName:forType:", v7, v4);
      -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", a3, v4);
    }
  }
}

- (BOOL)_canEmptyMessagesFromMailboxUid:(id)a3
{
  return 1;
}

- (BOOL)_shouldLogDeleteActivity
{
  int v2;

  v2 = _logDeleteActivity;
  if (_logDeleteActivity == -1)
  {
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("LogDeleteActivity"));
    _logDeleteActivity = v2;
  }
  return v2 == 1;
}

- (id)_infoForMatchingURL:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_msgSend(a3, "relativePath");
  objc_msgSend(v5, "setObject:forKey:", self, CFSTR("Account"));
  v7 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("/"), 8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    v6 = (void *)objc_msgSend(v6, "substringWithRange:", v7 + v8, objc_msgSend(v6, "length") - (v7 + v8));
  if (v6 && (objc_msgSend(v6, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RelativePath"));
  return v5;
}

- (id)_URLScheme
{
  return 0;
}

- (id)URLForMessage:(id)a3
{
  return 0;
}

- (id)uniqueServerIdForMessage:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "globalMessageURL"), "absoluteString");
}

- (id)newMailboxWithParent:(id)a3 name:(id)a4
{
  return -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", objc_msgSend((id)objc_msgSend(a3, "pathRelativeToMailbox:", objc_msgSend((id)objc_msgSend(a3, "account"), "rootMailboxUid")), "stringByAppendingPathComponent:", a4), 1);
}

+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4
{
  if (a3 == a4)
    return 1;
  if ((objc_msgSend(a3, "restrictedFromTransferingMessagesToOtherAccounts") & 1) != 0)
    return 0;
  return objc_msgSend(a4, "supportsAppend");
}

- (id)moveMessages:(id)a3 fromMailbox:(id)a4 toMailbox:(id)a5 markAsRead:(BOOL)a6
{
  MFMessageTransferResult *v6;

  v6 = [MFMessageTransferResult alloc];
  return -[MFMessageTransferResult initWithResultCode:failedMessages:transferedMessage:](v6, "initWithResultCode:failedMessages:transferedMessage:", 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (id)_localMailboxNameForType:(int)a3 usingDisplayName:(id)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a3;
  v7 = +[LocalAccount localAccount](LocalAccount, "localAccount");
  v8 = (void *)objc_msgSend(v7, "specialMailboxNameForType:", v5);
  if (v8)
  {
    if (a4)
      goto LABEL_8;
  }
  else
  {
    v8 = (void *)objc_msgSend(v7, "_defaultSpecialMailboxNameForType:", v5);
    if (a4)
      goto LABEL_8;
  }
  v9 = -[MailAccount displayName](self, "displayName");
  if (!v9 || (a4 = v9, objc_msgSend(v9, "isEqualToString:", &stru_1E81CBE50)))
  {
    a4 = -[MailAccount firstEmailAddress](self, "firstEmailAddress");
    if (!a4)
      return v8;
  }
LABEL_8:
  if ((objc_msgSend(a4, "isEqualToString:", &stru_1E81CBE50) & 1) != 0)
    return v8;
  return (id)objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" (%@)"), a4);
}

- (BOOL)isMailboxLocalForType:(int)a3
{
  return 0;
}

- (id)allLocalMailboxUids
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = 0;
  v4 = 0;
  do
  {
    v5 = dword_1C88A36B0[v3];
    if (-[MailAccount isMailboxLocalForType:](self, "isMailboxLocalForType:", v5))
    {
      v6 = -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", v5, 0);
      if (v6)
      {
        v7 = v6;
        if (!v4)
          v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        objc_msgSend(v4, "addObject:", v7);
      }
    }
    ++v3;
  }
  while (v3 != 4);
  return v4;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 0;
}

- (BOOL)shouldFetchBodiesWhenMovingToTrash
{
  return 1;
}

- (id)saveSentFolder
{
  return 0;
}

- (id)signingIdentityPersistentReferenceForAddress:(id)a3
{
  return (id)objc_msgSend(-[MailAccount valueInAccountLookAsidePropertiesForKey:](self, "valueInAccountLookAsidePropertiesForKey:", CFSTR("SendingIdentities")), "objectForKey:", a3);
}

- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  -[MailAccount _setValueInAccountLookAsideProperties:forKey:subKey:](self, "_setValueInAccountLookAsideProperties:forKey:subKey:", a3, CFSTR("SendingIdentities"), a4);
}

- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  -[MailAccount _setValueInAccountLookAsideProperties:forKey:subKey:](self, "_setValueInAccountLookAsideProperties:forKey:subKey:", a3, CFSTR("EncryptionIdentities"), a4);
}

- (BOOL)secureMIMEEnabled
{
  return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("SMIMEEnabled")), "BOOLValue");
}

- (BOOL)perMessageEncryptionEnabled
{
  if (-[MFAccount isManaged](self, "isManaged"))
    return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("PerMessageSMIMEEnabled")), "BOOLValue");
  else
    return 1;
}

- (int)secureCompositionEncryptionPolicyForAddress:(id)a3
{
  int result;

  result = objc_msgSend((id)objc_msgSend(a3, "mf_uncommentedAddress"), "isEqualToString:", objc_msgSend(-[MailAccount firstEmailAddress](self, "firstEmailAddress"), "mf_uncommentedAddress"));
  if (result)
    return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("SMIMEEncryptionEnabled")), "BOOLValue");
  return result;
}

- (id)copyDataForRemoteEncryptionCertificatesForAddress:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)restrictedFromTransferingMessagesToOtherAccounts
{
  return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("MFRestrictMessageTransfersToOtherAccounts")), "BOOLValue");
}

- (BOOL)restrictedFromSendingExternally
{
  return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("MFRestrictSendingFromExternalProcesses")), "BOOLValue");
}

- (BOOL)restrictedFromSyncingRecents
{
  return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("Prevent Recents Syncing")), "BOOLValue");
}

- (id)fetchLimits
{
  return 0;
}

- (id)customSignature
{
  return -[MailAccount valueInAccountLookAsidePropertiesForKey:](self, "valueInAccountLookAsidePropertiesForKey:", CFSTR("CustomSignature"));
}

- (void)setCustomSignature:(id)a3
{
  -[MailAccount setValueInAccountLookAsideProperties:forKey:](self, "setValueInAccountLookAsideProperties:forKey:", a3, CFSTR("CustomSignature"));
}

- (BOOL)supportsArchiving
{
  return 1;
}

- (BOOL)supportsThreadOperations
{
  return 1;
}

- (BOOL)preventArchiveForMailbox:(id)a3
{
  _BOOL4 v4;
  BOOL result;

  v4 = -[MailAccount supportsArchiving](self, "supportsArchiving");
  result = 0;
  if (a3)
  {
    if (v4)
      return objc_msgSend(a3, "type") - 1 < 5;
  }
  return result;
}

- (BOOL)canArchiveForMailbox:(id)a3
{
  _BOOL4 v5;

  v5 = -[MailAccount supportsArchiving](self, "supportsArchiving");
  if (v5)
    LOBYTE(v5) = !-[MailAccount preventArchiveForMailbox:](self, "preventArchiveForMailbox:", a3);
  return v5;
}

- (int)archiveDestinationForMailbox:(id)a3
{
  if (!-[MailAccount supportsArchiving](self, "supportsArchiving"))
    -[MailAccount archiveDestinationForMailbox:].cold.1();
  if (-[MailAccount canArchiveForMailbox:](self, "canArchiveForMailbox:", a3))
    return 2;
  else
    return 3;
}

- (BOOL)shouldArchiveByDefault
{
  _BOOL4 v3;

  v3 = -[MailAccount supportsArchiving](self, "supportsArchiving");
  if (v3)
    LOBYTE(v3) = -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("ArchiveMessages"), 0);
  return v3;
}

- (BOOL)sourceIsManaged
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("ForceSourceIsManaged")) & 1) != 0)return 1;
  else
    return -[ACAccount MCIsManaged](-[MFAccount persistentAccount](self, "persistentAccount"), "MCIsManaged");
}

- (id)unsupportedContinuationTypes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsContinuationType:(id)a3
{
  return objc_msgSend(-[MailAccount unsupportedContinuationTypes](self, "unsupportedContinuationTypes"), "containsObject:", a3) ^ 1;
}

- (BOOL)supportsMailDrop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  return -[MFAccount supportsMailDrop](&v3, sel_supportsMailDrop);
}

- (BOOL)supportsFastRemoteBodySearch
{
  return self->_supportsFastRemoteBodySearch;
}

- (void)libraryID
{
  __assert_rtn("-[MailAccount libraryID]", "MailAccount.m", 2782, "0 && \"account must have a library ID\");
}

- (void)didFinishActionForChokePoint:(uint64_t *)a1 coalescePoint:(uint64_t)a2 withResult:.cold.1(uint64_t *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *a1;
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_DEFAULT, "#Warning <rdar://problem/17733540> _currentChokedActions: %@\nmailboxDict: %@", (uint8_t *)&v6, 0x16u);
  }
  __assert_rtn("-[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:]", "MailAccount.m", 3011, "0");
}

- (void)archiveDestinationForMailbox:.cold.1()
{
  __assert_rtn("-[MailAccount archiveDestinationForMailbox:]", "MailAccount.m", 4228, "[self supportsArchiving] && \"only accounts that support archiving should call into this\");
}

@end
