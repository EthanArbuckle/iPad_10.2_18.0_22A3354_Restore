@implementation MailAccount

- (id)mailboxUidForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[MailAccount ownsMailboxUidWithURL:](self, "ownsMailboxUidWithURL:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount _infoForMatchingURL:](self, "_infoForMatchingURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount mailboxUidForInfo:](self, "mailboxUidForInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)ownsMailboxUidWithURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MailAccount URLString](self, "URLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  return v6;
}

- (id)URLString
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Account");
  v7[1] = CFSTR("RelativePath");
  v8[0] = self;
  v8[1] = &stru_1E4F1C8F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount _URLForInfo:](self, "_URLForInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mailboxUidForInfo:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("RelativePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4
{
  -[MailAccount mailboxUidForRelativePath:create:withOption:](self, "mailboxUidForRelativePath:create:withOption:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int64_t)a5
{
  _BOOL4 v5;
  unint64_t v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v25;
  id v26;
  id v28;
  void *v29;
  id v31;
  void *v32;
  _QWORD v33[2];

  v5 = a4;
  v33[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(v28, "pathComponents");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v32, "count");
  -[MailAccount rootMailbox](self, "rootMailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount mf_lock](self, "mf_lock");
  v31 = 0;
  if (v8 && v7)
  {
    v31 = 0;
    v9 = 0;
    v29 = 0;
    v10 = 1;
    do
    {
      objc_msgSend(v32, "objectAtIndex:", v10 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v10)
      {
        -[MailAccount mailboxPathExtension](self, "mailboxPathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "hasSuffix:", v12);

        if (v13)
        {
          objc_msgSend(v11, "stringByDeletingPathExtension");
          v14 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v14;
        }
      }
      -[MailAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MailAccount _childOfMailbox:withComponentName:](self, "_childOfMailbox:withComponentName:", v8, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16 && v5)
      {
        -[MailAccount mf_unlock](self, "mf_unlock");
        if (v7 == v10)
          v17 = 257;
        else
          v17 = 258;
        v18 = -[MailAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:](self, "_newMailboxWithParent:name:attributes:dictionary:withCreationOption:", v8, v15, v17, 0, a5);
        -[MailAccount mf_lock](self, "mf_lock");
        -[MailAccount _childOfMailbox:withComponentName:](self, "_childOfMailbox:withComponentName:", v8, v15);
        v19 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v19;
        if (v18 && !v19)
        {
          if (v31)
          {
            v33[0] = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setChildren:", v20);

          }
          else
          {
            v31 = v8;
            v21 = objc_msgSend(v31, "mutableCopyOfChildren");

            v22 = (id)v21;
            if (!v21)
              v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v29 = v22;
            objc_msgSend(v22, "addObject:", v18);
          }
          v23 = v18;
          -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
          v16 = v23;
        }

      }
      v9 = v16;

      if (!v9)
        break;
      v8 = v9;
    }
    while (v10++ < v7);
    if (v9 && v31)
    {
      -[MailAccount mf_unlock](self, "mf_unlock");
      -[MailAccount _setChildren:forMailboxUid:](self, "_setChildren:forMailboxUid:", v29, v31);
      v25 = v9;
      -[MailAccount mf_lock](self, "mf_lock");
    }
    else
    {
      v25 = v9;
    }
  }
  else
  {
    v25 = 0;
    v9 = v8;
    v29 = 0;
  }
  -[MailAccount mf_unlock](self, "mf_unlock");
  v26 = v9;

  return v26;
}

- (MFMailboxUid)rootMailbox
{
  MFMailboxUid *v3;

  _configureMailboxCache(self);
  -[MailAccount mf_lock](self, "mf_lock");
  v3 = self->_rootMailboxUid;
  -[MailAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (BOOL)cacheHasBeenRead
{
  MailAccount *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = HIWORD(*(_DWORD *)&v2->_flags) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (BOOL)canFetch
{
  return -[MFAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]);
}

- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "childWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "childWithExtraAttribute:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)path
{
  NSString *path;
  void *v4;

  path = self->_path;
  if (!path)
  {
    -[MailAccount defaultPath](self, "defaultPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount setPath:](self, "setPath:", v4);

    path = self->_path;
  }
  return path;
}

+ (id)URLForInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("Account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_URLForInfo:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_URLForInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  -[MFAccount uniqueID](self, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHost:", v6);

  -[MailAccount _URLScheme](self, "_URLScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v7);

  objc_msgSend(v4, "objectForKey:", CFSTR("RelativePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPath:", v9);

  }
  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)persistentNameForMailbox:(id)a3
{
  return 0;
}

- (id)_mailboxPathPrefix
{
  return &stru_1E4F1C8F8;
}

- (id)_pathComponentForUidName:(id)a3
{
  return a3;
}

- (id)_uidNameForPathComponent:(id)a3
{
  return a3;
}

- (id)mailboxCachePath
{
  NSString *mailboxCachePath;
  NSString *v3;
  void *v4;

  mailboxCachePath = self->_mailboxCachePath;
  if (mailboxCachePath)
  {
    v3 = mailboxCachePath;
  }
  else
  {
    -[MailAccount path](self, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR(".mboxCache.plist"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7
{
  return -[MailAccount _copyMailboxWithParent:name:attributes:dictionary:](self, "_copyMailboxWithParent:name:attributes:dictionary:", a3, a4, a5, a6, a7);
}

- (void)_incrementCacheDirtyCount
{
  os_unfair_lock_s *p_flagsLock;
  $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
    self->_flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
  os_unfair_lock_unlock(p_flagsLock);
}

uint64_t __39__MailAccount_activeAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

uint64_t __35__MailAccount_accountWithUniqueId___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

+ (id)outboxMessageStore:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[LocalAccount localAccount](LocalAccount, "localAccount", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outboxMailboxUid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v4, "storeForMailboxUid:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)outboxMailboxUid
{
  void *v3;
  id v4;
  uint64_t v5;

  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  +[LocalAccount localAccount](LocalAccount, "localAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)_outboxUid;
  if ((objc_msgSend(v4, "isValid") & 1) != 0)
  {
    if (v4)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(v3, "mailboxUidForRelativePath:create:", CFSTR("Outbox"), 1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_setOutboxMailboxUid:", v5);
    v4 = (id)v5;
    objc_msgSend(v3, "resetSpecialMailboxes");
  }
  else
  {
    v4 = 0;
  }
LABEL_8:
  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");

  return v4;
}

+ (void)_setOutboxMailboxUid:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "mf_lock");
  v5 = v8;
  if ((id)_outboxUid != v8)
  {
    objc_storeStrong((id *)&_outboxUid, a3);
    objc_msgSend((id)_outboxUid, "setMailboxType:", 6);
    v5 = v8;
  }
  if (objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v8, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setChildren:forMailboxUid:", 0, v7);

  }
  objc_msgSend(a1, "mf_unlock");

}

- (void)forceFetchMailboxList
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", sel_resetMailboxTimer, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addInvocation:", v3);

    +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", sel_fetchMailboxList, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInvocation:", v4);

  }
}

- (id)mailboxUidOfType:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v9;

  v4 = a4;
  -[MailAccount _cachedSpecialMailboxOfType:](self, "_cachedSpecialMailboxOfType:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[MailAccount _specialMailboxUidWithType:create:](self, "_specialMailboxUidWithType:create:", a3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "type") != a3)
        -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", v7, a3);
    }
  }
  return v7;
}

- (BOOL)_assignSpecialMailboxToAppropriateIvar:(id)a3 forType:(int64_t)a4
{
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a3;
  -[MFLock lock](self->_cachedMailboxenLock, "lock");
  v8 = a4 - 1;
  if ((unint64_t)(a4 - 1) < 7 && ((0x5Fu >> v8) & 1) != 0)
  {
    v15 = *(id *)((char *)&self->super.super.isa + *off_1E4E89D58[v8]);
    if (v15 == v7)
    {
      v10 = 0;
      v11 = 0;
      v9 = v7;
    }
    else
    {
      v9 = v15;
      objc_msgSend(v15, "setMailboxType:", 0);
      objc_msgSend(v9, "setRepresentedAccount:", 0);
      objc_msgSend(v7, "setMailboxType:", a4);
      objc_msgSend(v9, "parent");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "parent");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v8 < 7 && ((0x5Fu >> v8) & 1) != 0)
        objc_storeStrong((id *)((char *)&self->super.super.isa + *off_1E4E89D58[v8]), a3);
      v10 = (void *)v16;
      v11 = (void *)v17;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
  if (v11)
  {
    objc_msgSend(v11, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setChildren:forMailboxUid:", 0, v11);

  }
  if (v10 && v11 != v10)
  {
    objc_msgSend(v10, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setChildren:forMailboxUid:", 0, v10);

  }
  return v9 != v7;
}

- (id)_cachedSpecialMailboxOfType:(int64_t)a3
{
  int64_t v5;
  id v6;

  -[MFLock lock](self->_cachedMailboxenLock, "lock");
  v5 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 6 && ((0x5Fu >> v5) & 1) != 0)
    v6 = *(id *)((char *)&self->super.super.isa + *off_1E4E89D58[v5]);
  else
    v6 = 0;
  -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
  return v6;
}

+ (void)_postMailboxListNotificationAfterBlock:(id)a3
{
  int v3;
  uint64_t v4;
  uint64_t (**v5)(void);

  v5 = (uint64_t (**)(void))a3;
  v3 = objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationsAreEnabled");
  if (v3)
    objc_msgSend((id)objc_opt_class(), "disableMailboxListingNotifications");
  v4 = v5[2]();
  if (v3)
    objc_msgSend((id)objc_opt_class(), "enableMailboxListingNotifications:", v4);

}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v6 = a3;
  v7 = v6;
  v8 = a4;
  v9 = (void *)objc_msgSend(v8, "mutableCopyOfChildren");
  v10 = v9;
  if (!v6)
  {
    v7 = v9;
    if (!v7)
      goto LABEL_14;
  }
  v11 = objc_msgSend(v8, "setChildren:", v7) ^ 1;
  if (!v6)
    LOBYTE(v11) = 0;
  if ((v11 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
LABEL_14:
    if (-[MailAccount cacheHasBeenRead](self, "cacheHasBeenRead")
      && objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationsAreEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB37C0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v10, CFSTR("OldChildren"), v7, CFSTR("NewChildren"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "notificationWithName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), v8, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotification:", v15);

    }
    v16 = 1;
  }

  return v16;
}

+ (BOOL)mailboxListingNotificationsAreEnabled
{
  unsigned __int8 v2;

  v2 = atomic_load(sDisableMailboxListingNotifications);
  return (v2 & 1) == 0;
}

BOOL __45__MailAccount__resetSpecialMailboxesCanPost___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  int v8;
  int v10;
  _OWORD v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mf_lock");
  v2 = *(_QWORD **)(a1 + 32);
  v10 = (v2[15] != 0) | (2 * (v2[16] != 0)) | (4 * (v2[17] != 0)) | (8 * (v2[18] != 0)) | (16 * (v2[19] != 0)) | (32 * (v2[20] != 0));
  objc_msgSend(v2, "mf_unlock");
  v3 = 0;
  v11[0] = xmmword_1A5999480;
  v11[1] = xmmword_1A5999490;
  v11[2] = xmmword_1A59994A0;
  do
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)((char *)v11 + v3);
    objc_msgSend(v4, "_specialMailboxUidWithType:create:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v4, "_assignSpecialMailboxToAppropriateIvar:forType:", v6, v5);

    if ((_DWORD)v5)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v3 += 8;
  }
  while (v3 != 48);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "mf_lock");
    v7 = *(_QWORD **)(a1 + 32);
    v8 = (v7[15] != 0) | (2 * (v7[16] != 0)) | (4 * (v7[17] != 0)) | (8 * (v7[18] != 0)) | (16 * (v7[19] != 0)) | (32 * (v7[20] != 0));
    objc_msgSend(v7, "mf_unlock");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10 != v8;
  }
  return *(_BYTE *)(a1 + 48) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 0;
  else
    return off_1E4E89D20[a3 - 1];
}

- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;

  v4 = a4;
  -[MailAccount specialMailboxNameForType:](self, "specialMailboxNameForType:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[MailAccount _defaultSpecialMailboxNameForType:](self, "_defaultSpecialMailboxNameForType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount _setSpecialMailboxName:forType:](self, "_setSpecialMailboxName:forType:", v7, a3);
  }
  -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)specialMailboxNameForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", off_1E4E89D90[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setSpecialMailboxName:(id)a3 forType:(int64_t)a4
{
  __CFString *v6;
  id v7;

  v7 = a3;
  -[MailAccount mf_lock](self, "mf_lock");
  if ((unint64_t)(a4 - 1) < 5)
  {
    v6 = off_1E4E89D90[a4 - 1];
    if (v7)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v7, v6);
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", v6);
  }
  -[MailAccount mf_unlock](self, "mf_unlock");

}

+ (void)enableMailboxListingNotifications:(BOOL)a3
{
  id v3;

  atomic_store(0, sDisableMailboxListingNotifications);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), 0, 0);

  }
}

+ (void)disableMailboxListingNotifications
{
  atomic_store(1u, sDisableMailboxListingNotifications);
}

uint64_t __46__MailAccount_performOnAccounts_accountBlock___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MailAccount_performOnAccounts_accountBlock___block_invoke_2;
  v4[3] = &unk_1E4E89C08;
  v6 = &v7;
  v1 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);
  v2 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v2;
}

- (id)defaultEmailAddress
{
  return -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("defaultAddress"));
}

- (id)loggingIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MailAccount statisticsKind](self, "statisticsKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringToIndex:", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iconString
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  int v6;

  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("AccountIcon"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("otherAccountIcon");
  -[MFAccount baseAccount](self, "baseAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleEmployeeAccount");

  if (v6)
  {

    v4 = CFSTR("appleAccountIcon");
  }
  return v4;
}

- (BOOL)_readCustomInfoFromMailboxCache:(id)a3
{
  return 1;
}

- (BOOL)shouldArchiveByDefault
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[MailAccount supportsArchiving](self, "supportsArchiving"))
  {
    v3 = -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("ArchiveMessages"), 0);
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[MFAccount ef_publicDescription](self, "ef_publicDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: shouldArchiveByDefault: Get BOOL for account info key: %{BOOL}d", (uint8_t *)&v8, 0x12u);

    }
  }
  else
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[MFAccount ef_publicDescription](self, "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: shouldArchiveByDefault: Account does not support archiving", (uint8_t *)&v8, 0xCu);

    }
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)supportsArchiving
{
  return 1;
}

- (BOOL)_loadMailboxListingIntoCache:(id)a3 attributes:(unsigned int)a4 children:(id)a5 parent:(id)a6
{
  void *v8;
  const __CFArray *v9;
  __CFDictionary *Mutable;
  void *ValueAtIndex;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  id v39;
  char v40;
  char v41;
  CFIndex Count;
  void *v43;
  id v45;
  id v46;
  id v47;
  const __CFArray *v48;
  int v49;
  __CFArray *theArray;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v46 = a5;
  v47 = a6;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("AccountMailboxListingWillLoad"), 0, 0);

  v9 = 0;
  v48 = 0;
  Mutable = 0;
  v49 = 0;
  do
  {
    ValueAtIndex = v46;
    theArray = v9;
    if (v9)
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v9, 0);
    v56 = ValueAtIndex;
    v12 = v47;
    if (v48)
      v12 = (void *)CFArrayGetValueAtIndex(v48, 0);
    v52 = v12;
    v53 = (void *)objc_msgSend(v52, "mutableCopyOfChildren");
    v13 = objc_msgSend(v56, "count");
    if (theArray)
      CFArrayRemoveValueAtIndex(theArray, 0);
    if (v48)
      CFArrayRemoveValueAtIndex(v48, 0);
    v54 = (void *)objc_opt_new();
    v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v13)
    {
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend(v56, "objectAtIndex:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("MailboxName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKey:", v15, v16);

      }
    }
    v17 = objc_msgSend(v53, "count");
    if (v17)
    {
      v18 = v17 - 1;
      do
      {
        objc_msgSend(v53, "objectAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "containsObject:", v20))
        {
          +[MailAccount log](MailAccount, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v58 = v23;
            _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "Removing duplicate mailbox %{public}@", buf, 0xCu);

          }
          v24 = 0;
        }
        else
        {
          if (v21)
          {
            objc_msgSend(v21, "objectForKey:", CFSTR("MailboxAttributes"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedIntValue");

            v27 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](self, "_copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:", v52, v20, v26, v19, v21);
          }
          else
          {
            v27 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](self, "_copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:", v52, 0, 0, v19, 0);
          }
          v24 = v27;
        }
        objc_msgSend(v54, "addObject:", v20);
        if (v24)
        {
          objc_msgSend(v24, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqual:", v19) & 1) == 0)
          {
            objc_msgSend(v53, "replaceObjectAtIndex:withObject:", v18, v24);
            v49 = 1;
          }
          if (!Mutable)
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
          CFDictionarySetValue(Mutable, v28, v24);
          if ((objc_msgSend(v28, "isEqualToString:", v20) & 1) == 0)
            CFDictionarySetValue(Mutable, v20, v24);
          v29 = v21 == 0;

        }
        else
        {
          objc_msgSend(v53, "removeObjectAtIndex:", v18);
          if (v21)
            v29 = -1;
          else
            v29 = 0;
          v49 = 1;
        }

        v13 += v29;
        --v18;
      }
      while (v18 != -1);
    }
    v30 = objc_msgSend(v56, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v53)
      objc_msgSend(v31, "addObjectsFromArray:", v53);
    if (v30)
    {
      for (j = 0; v30 != j; ++j)
      {
        objc_msgSend(v56, "objectAtIndex:", j);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", CFSTR("MailboxName"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", CFSTR("MailboxAttributes"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "unsignedIntValue");

        objc_msgSend(v34, "objectForKey:", CFSTR("MailboxChildren"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (Mutable && (v39 = (id)CFDictionaryGetValue(Mutable, v35)) != 0
          || (v39 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](self, "_copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:", v52, v35, v37, 0, v34)) != 0)
        {
          if (objc_msgSend(v32, "indexOfObjectIdenticalTo:", v39) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v49 = 1;
            objc_msgSend(v32, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v39, _MFCompareMailboxUids, 0, 1);
          }
          if (v38)
          {
            if ((v37 & 1) == 0)
              goto LABEL_52;
          }
          else
          {
            v40 = objc_msgSend(v39, "hasChildren");
            if ((v37 & 1) != 0)
              v41 = 0;
            else
              v41 = v40;
            if ((v41 & 1) != 0)
            {
LABEL_52:
              if (!theArray)
                theArray = CFArrayCreateMutable(0, 0, 0);
              if (!v48)
                v48 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
              CFArrayAppendValue(theArray, v38);
              CFArrayAppendValue(v48, v39);
            }
          }
        }

      }
    }
    if (Mutable)
      CFDictionaryRemoveAllValues(Mutable);
    v49 |= -[MailAccount _cleanInboxDuplication:](self, "_cleanInboxDuplication:", v32);
    if ((v49 & 1) != 0)
      -[MailAccount _setChildren:forMailboxUid:](self, "_setChildren:forMailboxUid:", v32, v52);

    if (!theArray)
      break;
    Count = CFArrayGetCount(theArray);
    v9 = theArray;
  }
  while (Count > 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("AccountMailboxListingDidLoad"), 0, 0);

  if (Mutable)
    CFRelease(Mutable);
  if (v48)
    CFRelease(v48);
  if (theArray)
    CFRelease(theArray);

  return v49 & 1;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v13)
  {
    if (!v14)
    {
      v17 = -[MailAccount _copyMailboxWithParent:name:attributes:dictionary:](self, "_copyMailboxWithParent:name:attributes:dictionary:", v12, v13, a5, v15);
      goto LABEL_8;
    }
    objc_msgSend(v14, "setAttributes:", objc_msgSend(v14, "attributes") & 0xFFFFFE00 | a5 & 0x1FF);
LABEL_6:
    v17 = v14;
LABEL_8:
    v16 = v17;
    goto LABEL_9;
  }
  if ((objc_msgSend(v14, "attributes") & 0x100) != 0)
    goto LABEL_6;
  v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)_cleanInboxDuplication:(id)a3
{
  return 0;
}

- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 dictionary:(id)a6
{
  id v9;
  id v10;
  MFMailboxUid *v11;
  void *v12;
  MFMailboxUid *v13;

  v9 = a4;
  v10 = a6;
  v11 = [MFMailboxUid alloc];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MailboxExtraAttributes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MFMailboxUid initWithName:attributes:forAccount:extraAttributes:](v11, "initWithName:attributes:forAccount:extraAttributes:", v9, a5, self, v12);

  return v13;
}

uint64_t __37__MailAccount_activeNonLocalAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalAccount") ^ 1;
}

- (BOOL)isLocalAccount
{
  return 0;
}

- (NSString)defaultPath
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MFAccount personaIdentifier](self, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D1EB88];
    -[MFAccount personaIdentifier](self, "personaIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "baseAccountDirectoryPathForPersonaIdentifier:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v6;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultAccountDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFAccount uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mf_betterStringByResolvingSymlinksInPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (id)allMailboxUidsForAccounts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "rootMailbox", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v11 = v6;
  while (1)
  {

    if (!objc_msgSend(v5, "count"))
      break;
    objc_msgSend(v5, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopyOfChildren");
    objc_msgSend(v4, "addObjectsFromArray:", v12);
    objc_msgSend(v5, "removeLastObject");
    objc_msgSend(v5, "addObjectsFromArray:", v12);

  }
  return v4;
}

- (id)allMailboxesFilteringNotes:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount rootMailbox](self, "rootMailbox");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v3 && objc_msgSend(v8, "isNotesMailboxUid"))
    {
      objc_msgSend(v5, "removeObject:", v9);
      objc_msgSend(v6, "removeLastObject");
    }
    else
    {
      v10 = (void *)objc_msgSend(v9, "mutableCopyOfChildren");
      objc_msgSend(v5, "addObjectsFromArray:", v10);
      objc_msgSend(v6, "removeLastObject");
      objc_msgSend(v6, "addObjectsFromArray:", v10);

    }
  }
  -[MailAccount primaryMailboxUid](self, "primaryMailboxUid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "indexOfObject:", v11);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "exchangeObjectAtIndex:withObjectAtIndex:", 0, v12);

  return v5;
}

- (id)primaryMailboxUid
{
  return -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 7, 1);
}

- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "isSendLaterMailbox"))
  {
    _EFLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)saveState
{
  os_unfair_lock_s *p_flagsLock;
  $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  flags = self->_flags;
  os_unfair_lock_unlock(p_flagsLock);
  if (flags)
    -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
}

- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3
{
  -[MailAccount _writeMailboxCacheWithPrejudice:completionHandler:](self, "_writeMailboxCacheWithPrejudice:completionHandler:", a3, 0);
}

+ (id)defaultAccountDirectory
{
  if (defaultAccountDirectory_sOnceToken != -1)
    dispatch_once(&defaultAccountDirectory_sOnceToken, &__block_literal_global_137);
  return (id)defaultAccountDirectory_sMailAccountDirectory;
}

- (void)setLibrary:(id)a3
{
  MFMailMessageLibrary *v4;
  NSObject *v5;
  MFMailMessageLibrary *library;
  int v7;
  MailAccount *v8;
  __int16 v9;
  MFMailMessageLibrary *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (MFMailMessageLibrary *)a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      MFLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412546;
        v8 = self;
        v9 = 2112;
        v10 = v4;
        _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "#Warning %@: Cannot set library to %@. See rdar://problem/42167098.", (uint8_t *)&v7, 0x16u);
      }

      v4 = 0;
    }
  }
  library = self->_library;
  self->_library = v4;

}

- (MailAccount)initWithPath:(id)a3
{
  return -[MailAccount initWithLibrary:path:](self, "initWithLibrary:path:", 0, a3);
}

- (MailAccount)initWithLibrary:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  MailAccount *v8;
  MailAccount *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[MailAccount initWithLibrary:persistentAccount:](self, "initWithLibrary:persistentAccount:", v6, 0);
  v9 = v8;
  if (v8)
    -[MailAccount _setPath:](v8, "_setPath:", v7);

  return v9;
}

- (void)setPath:(id)a3
{
  id v4;

  v4 = a3;
  if (-[MailAccount _setPath:](self, "_setPath:"))
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");

}

- (BOOL)_setPath:(id)a3
{
  id v4;
  BOOL v5;
  NSString *v6;
  NSString *path;
  const __CFArray *v8;
  CFRange v10;

  v4 = a3;
  if (v4 && !-[NSString isEqualToString:](self->_path, "isEqualToString:", v4))
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    path = self->_path;
    self->_path = v6;

    +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
    v8 = (const __CFArray *)_accountsSortedByPath;
    if (!_accountsSortedByPath
      || (v10.length = CFArrayGetCount((CFArrayRef)_accountsSortedByPath),
          v10.location = 0,
          CFArrayGetFirstIndexOfValue(v8, v10, self) != -1))
    {
      objc_msgSend((id)objc_opt_class(), "_removeAccountFromSortedPaths:", self);
      objc_msgSend((id)objc_opt_class(), "_addAccountToSortedPaths:", self);
    }
    +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MFTaskManager)taskManager
{
  return 0;
}

- (void)setupLibrary
{
  id v3;

  if (+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[MailAccount setLibrary:](self, "setLibrary:");

  }
}

- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags;
  _BOOL4 v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __CFDictionary *v22;
  NSObject *v23;
  int v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _QWORD block[4];
  __CFDictionary *v31;
  id v32;
  MailAccount *v33;
  void (**v34)(_QWORD);
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v4 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  os_unfair_lock_lock(&self->_flagsLock);
  flags = self->_flags;
  os_unfair_lock_unlock(&self->_flagsLock);
  v8 = +[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence");
  v9 = (*(unsigned int *)&flags >> 17) & 1;
  if ((*(_WORD *)&flags & 0xFFFEu) <= 9)
    v9 = 0;
  if ((v8 & (v4 | v9) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

    if ((v12 & 1) == 0)
    {
      -[MailAccount path](self, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mf_makeDirectoryWithMode:", 448);

    }
    -[MailAccount mailboxCachePath](self, "mailboxCachePath");
    v14 = objc_claimAutoreleasedReturnValue();
    -[MailAccount mf_lock](self, "mf_lock");
    v28 = (void *)v14;
    -[MFMailboxUid children](self->_rootMailboxUid, "children");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v29, "count");
    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v17 = v29;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v37 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v21);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v18);
      }

      v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      CFDictionarySetValue(v22, CFSTR("mboxes"), v16);
      if (-[MailAccount _writeCustomInfoToMailboxCache:](self, "_writeCustomInfoToMailboxCache:", v22))
      {
        +[MFMailboxPersistence_iOS mailboxCacheQueue](MFMailboxPersistence_iOS, "mailboxCacheQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __65__MailAccount__writeMailboxCacheWithPrejudice_completionHandler___block_invoke;
        block[3] = &unk_1E4E89C58;
        v31 = v22;
        v35 = v15;
        v32 = v28;
        v33 = self;
        v34 = v6;
        dispatch_async(v23, block);

        v24 = 1;
      }
      else
      {
        MFLogGeneral();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[MailAccount _writeMailboxCacheWithPrejudice:completionHandler:].cold.1();

        if (v6)
          v6[2](v6);
        v24 = 0;
      }

    }
    else
    {
      if (v6)
        v6[2](v6);
      v24 = 1;
    }

    v27 = v24 != 0;
    v25 = v28;
    -[MailAccount mf_unlock](self, "mf_unlock");
    if (v27)
    {
      os_unfair_lock_lock(&self->_flagsLock);
      self->_flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*((unsigned __int16 *)&self->_flags + 1) << 16);
      os_unfair_lock_unlock(&self->_flagsLock);
    }
    else
    {
      -[MailAccount _repairMailboxCache](self, "_repairMailboxCache");
    }
  }
  else
  {
    if (v6)
      v6[2](v6);
    v25 = 0;
  }

}

- (NSString)displayName
{
  void *v3;
  void *v5;
  objc_super v6;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("DisplayName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    return (NSString *)v3;
  -[MailAccount firstEmailAddress](self, "firstEmailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MailAccount mf_lock](self, "mf_lock");
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("DisplayName"));
    -[MailAccount mf_unlock](self, "mf_unlock");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MailAccount;
    -[MFAccount displayName](&v6, sel_displayName);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (void)setConnectionError:(id)a3
{
  id v5;

  v5 = a3;
  -[MailAccount mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_lastConnectionError, a3);
  -[MailAccount mf_unlock](self, "mf_unlock");

}

uint64_t __32__MailAccount_purgeableAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsPurge");
}

- (NSString)statisticsKind
{
  return 0;
}

- (id)deliveryAccount
{
  return -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 1);
}

+ (void)initialize
{
  if (!_accountsSortedByPath)
  {
    _accountsSortedByPath = (uint64_t)CFArrayCreateMutable(0, 0, 0);
    _sortedAccountPaths = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  }
}

id __42__MailAccount_copyReceivingEmailAddresses__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

id __34__MailAccount_emailAddressStrings__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)allPurgeableMailboxUids
{
  void *v2;
  void *v3;

  +[MailAccount purgeableAccounts](MailAccount, "purgeableAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount allMailboxUidsForAccounts:](MailAccount, "allMailboxUidsForAccounts:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)resetMailboxTimers
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activeAccounts");
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "resetMailboxTimer", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

+ (id)purgeableAccounts
{
  void *v2;
  void *v3;

  +[MailAccount mailAccounts](MailAccount, "mailAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_filter:", &__block_literal_global_94);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)activeAccountEmailAddresses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[MailAccount activeAccounts](MailAccount, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "ef_map:", &__block_literal_global_89_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_flatten");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_filter:", *MEMORY[0x1E0D1ED88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0D1E458]);
  objc_msgSend(v7, "addObjectsFromArray:", v6);

  return v7;
}

+ (id)activeNonLocalAccounts
{
  void *v2;
  void *v3;

  +[MailAccount activeAccounts](MailAccount, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_filter:", &__block_literal_global_92);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)activeAccountsWithError:(id *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "mailAccountsWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_filter:", &__block_literal_global_93);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (MailAccount)accountWithUniqueId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "mailAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__MailAccount_accountWithUniqueId___block_invoke;
  v9[3] = &unk_1E4E899E0;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "ef_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MailAccount *)v7;
}

+ (id)mailAccountsWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  v5 = (void *)_accounts;
  if (!_accounts)
  {
    objc_msgSend(a1, "reloadAccounts");
    v5 = (void *)_accounts;
  }
  v6 = (void *)objc_msgSend(v5, "copy");
  if (a3)
    *a3 = objc_retainAutorelease((id)_lastAccountsReloadError);
  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
  return v6;
}

+ (id)mailAccounts
{
  return (id)objc_msgSend(a1, "mailAccountsWithError:", 0);
}

+ (id)activeAccounts
{
  return (id)objc_msgSend(a1, "activeAccountsWithError:", 0);
}

- (NSArray)emailAddresses
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D1E6B8];
  -[MailAccount emailAddressStrings](self, "emailAddressStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddressesFromStrings:invalidAddresses:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

id __42__MailAccount_copyReceivingEmailAddresses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "emailAddressesAndAliasesList");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ef_map:", &__block_literal_global_156);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ef_flatMap:", &__block_literal_global_158);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__MailAccount_activeAccountEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "copyReceivingEmailAddresses");
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyReceivingEmailAddresses
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  -[MFAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (receivingEmailAddressesCache_onceToken != -1)
    dispatch_once(&receivingEmailAddressesCache_onceToken, &__block_literal_global_836);
  v4 = (id)receivingEmailAddressesCache__receivingEmailAddressesCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MailAccount_copyReceivingEmailAddresses__block_invoke;
  v7[3] = &unk_1E4E89B78;
  v7[4] = self;
  objc_msgSend(v4, "objectForKey:generator:", v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)emailAddressStrings
{
  void *v2;
  void *v3;
  void *v4;

  -[MailAccount emailAddressesDictionary](self, "emailAddressesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_map:", &__block_literal_global_147);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)emailAddressesDictionary
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("EmailAddresses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v2;
        v4 = 0;
        goto LABEL_21;
      }
      if (v2)
      {
        MFLogGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v2;
          _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "#Warning Returned unhandled email addresses %@", buf, 0xCu);
        }

      }
      v4 = 0;
LABEL_20:
      v11 = 0;
      goto LABEL_21;
    }
    v3 = v2;
  }
  v4 = v3;
  if (!v3)
    goto LABEL_20;
  objc_msgSend(v3, "ef_map:", &__block_literal_global_154);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    v10 = MEMORY[0x1E0C9AAB0];
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v7);
      objc_msgSend(v6, "addObject:", v10, v15);
      if (!--v8)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (!v8)
          break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
  v13 = v11;

  return v13;
}

- (BOOL)supportsPurge
{
  return 1;
}

- (id)allMailboxUids
{
  return -[MailAccount allMailboxesFilteringNotes:](self, "allMailboxesFilteringNotes:", 0);
}

+ (id)defaultMailAccountForDelivery
{
  return (id)objc_msgSend(a1, "_defaultMailAccountForDeliveryIncludingRestricted:", 1);
}

- (id)storeForMailboxUid:(id)a3
{
  MFMailboxUid *v4;
  MFMailboxUid *v5;
  void *v6;

  v4 = (MFMailboxUid *)a3;
  v5 = v4;
  if (!v4 || self->_rootMailboxUid == v4)
  {
    v6 = 0;
  }
  else
  {
    -[MFWeakObjectCache objectForKey:](self->_messageStoresCache, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id __49__MailAccount_initWithLibrary_persistentAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "storeClassForMailbox:", v3)), "initWithMailbox:readOnly:", v3, 0);
  objc_msgSend(WeakRetained, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLibrary:", v7);

  return v6;
}

- (id)library
{
  MFMailMessageLibrary *library;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  MailAccount *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  library = self->_library;
  if (!library)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = objc_opt_class();
      v8 = 2048;
      v9 = self;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "#Warning <%@ %p>: no library!", (uint8_t *)&v6, 0x16u);
    }

    library = self->_library;
  }
  return library;
}

- (Class)storeClassForMailbox:(id)a3
{
  -[MailAccount storeClass](self, "storeClass", a3);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

void __46__MailAccount_performOnAccounts_accountBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)_defaultMailAccountForDeliveryIncludingRestricted:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DefaultSendingAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(a1, "accountWithUniqueId:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isActive")
      && (a3 || (objc_msgSend(v7, "restrictedFromSendingExternally") & 1) == 0))
    {
      if (v7)
        goto LABEL_20;
    }
    else
    {

    }
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "mailAccounts", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && objc_msgSend(v11, "isActive")
          && (a3 || (objc_msgSend(v11, "restrictedFromSendingExternally") & 1) == 0))
        {
          v7 = v11;
          goto LABEL_19;
        }
      }
      v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_19:

LABEL_20:
  return v7;
}

+ (MailAccount)accountWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = v4;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "ef_hostNilForEmpty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(a1, "mailAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v12, "isActive"))
            objc_msgSend(v7, "insertObject:atIndex:", v12, 0);
          else
            objc_msgSend(v7, "addObject:", v12);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v17, "_URLScheme");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = objc_msgSend(v18, "caseInsensitiveCompare:", v5) == 0;

            if (v20)
            {
              objc_msgSend(v17, "uniqueID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v6 == v21)
              {

LABEL_29:
                v24 = v17;
                goto LABEL_30;
              }
              if (v6)
              {
                v23 = objc_msgSend(v6, "caseInsensitiveCompare:", v21) == 0;

                if (v23)
                  goto LABEL_29;
              }
              else
              {

              }
            }
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v14)
          continue;
        break;
      }
    }
    v24 = 0;
LABEL_30:

  }
  else
  {
    v24 = 0;
  }

  return (MailAccount *)v24;
}

+ (void)reloadAccounts
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Ignoring accounts without paths: %{public}@", buf, 0xCu);

  OUTLINED_FUNCTION_1();
}

+ (void)_setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4 alreadyLocked:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  char v25;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v6 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v49 = v8;
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = a5;
  if (!a5)
  {
    objc_msgSend(a1, "disableMailboxListingNotifications");
    objc_msgSend(a1, "mf_lock");
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setMaxConcurrentOperationCount:", 1);
  obj = (id)objc_msgSend(v8, "mutableCopy");
  +[LocalAccount localAccount](LocalAccount, "localAccount");
  v11 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v11;
  if (objc_msgSend(obj, "indexOfObjectIdenticalTo:", v11) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = objc_msgSend((id)_accounts, "indexOfObjectIdenticalTo:", v11);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v13 = 0;
    else
      v13 = v12;
    objc_msgSend(obj, "insertObject:atIndex:", v11, v13);
  }
  v52 = (id)_accounts;
  objc_storeStrong((id *)&_accounts, obj);
  objc_msgSend(a1, "_setupSortedPathsForAccounts:", _accounts);
  v53 = a1;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v14 = v52;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v81 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        if ((objc_msgSend(obj, "containsObject:", v18) & 1) != 0)
        {
          objc_msgSend(v9, "addObject:", v18);
        }
        else
        {
          objc_msgSend(v54, "addObject:", v18);
          objc_msgSend(v18, "invalidate");
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    }
    while (v15);
  }

  v19 = v53;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v20 = obj;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v77 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
        v25 = objc_msgSend(v14, "containsObject:", v24);
        v26 = v55;
        if ((v25 & 1) != 0)
        {
          v27 = objc_msgSend(v9, "containsObject:", v24);
          v26 = v9;
          if ((v27 & 1) != 0)
            continue;
        }
        objc_msgSend(v26, "addObject:", v24);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    }
    while (v21);
  }

  v48 = v20;
  if (v6)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v28 = v54;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    v30 = MEMORY[0x1E0C809B0];
    if (v29)
    {
      v31 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v73 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k);
          v71[0] = v30;
          v71[1] = 3221225472;
          v71[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke;
          v71[3] = &unk_1E4E88DC8;
          v71[4] = v33;
          objc_msgSend(v10, "addOperationWithBlock:", v71);
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      }
      while (v29);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v34 = v55;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v68;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v68 != v36)
            objc_enumerationMutation(v34);
          v38 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * m);
          v66[0] = v30;
          v66[1] = 3221225472;
          v66[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_2;
          v66[3] = &unk_1E4E88DC8;
          v66[4] = v38;
          objc_msgSend(v10, "addOperationWithBlock:", v66);
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
      }
      while (v35);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v39 = v9;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v85, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v63;
      do
      {
        for (n = 0; n != v40; ++n)
        {
          if (*(_QWORD *)v63 != v41)
            objc_enumerationMutation(v39);
          v43 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * n);
          v61[0] = v30;
          v61[1] = 3221225472;
          v61[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_3;
          v61[3] = &unk_1E4E88DC8;
          v61[4] = v43;
          objc_msgSend(v10, "addOperationWithBlock:", v61);
        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v85, 16);
      }
      while (v40);
    }

    v19 = v53;
  }
  if (!v50)
  {
    objc_msgSend(v19, "mf_unlock");
    objc_msgSend(v19, "enableMailboxListingNotifications:", 0);
  }
  objc_msgSend(v10, "waitUntilAllOperationsAreFinished");
  clearMailboxUIDCache();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v44 = v9;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v84, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v58;
    do
    {
      for (ii = 0; ii != v45; ++ii)
      {
        if (*(_QWORD *)v58 != v46)
          objc_enumerationMutation(v44);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * ii), "invalidateEmailAliases");
      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v84, 16);
    }
    while (v45);
  }

  objc_msgSend(v19, "notifyOfAccountsAdded:accountsRemoved:changedAccounts:", v55, v54, v44);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__MailAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (OS_os_log *)(id)log_log_4;
}

+ (void)notifyOfAccountsAdded:(id)a3 accountsRemoved:(id)a4 changedAccounts:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  if (+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hookRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
      objc_msgSend(v11, "accountsAdded:", v12);
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v11, "accountsRemoved:", v7);
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v11, "accountsChanged:", v8);

  }
}

+ (id)mailboxUidFromActiveAccountsForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v3 = a3;
  if (v3)
  {
    cachedMailboxUIDs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[MailAccount infoForURL:](MailAccount, "infoForURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Account"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mailboxUidForInfo:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        +[MailAccount log](MailAccount, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          +[MailAccount mailboxUidFromActiveAccountsForURL:].cold.1((uint64_t)v3, v14);

        cachedMailboxUIDs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v3, "copy");
        objc_msgSend(v15, "setObject:forKey:", v13, v16);

      }
      v6 = v13;

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EE70], "sharedReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportIssueType:description:", v9, CFSTR("Account URL is nil"));

    v6 = 0;
  }

  return v6;
}

+ (void)_setupSortedPathsForAccounts:(id)a3
{
  id v4;
  id v5;
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
  v4 = a3;
  CFArrayRemoveAllValues((CFMutableArrayRef)_sortedAccountPaths);
  CFArrayRemoveAllValues((CFMutableArrayRef)_accountsSortedByPath);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "_addAccountToSortedPaths:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (void)_addAccountToSortedPaths:(id)a3
{
  void *v3;
  const __CFArray *v4;
  CFIndex v5;
  id value;
  CFRange v7;

  value = a3;
  objc_msgSend(value, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __CFArray *)_sortedAccountPaths;
  v7.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
  v7.location = 0;
  v5 = CFArrayBSearchValues(v4, v7, v3, (CFComparatorFunction)MEMORY[0x1E0C98F10], 0);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v5, v3);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v5, value);

}

- (void)invalidateEmailAliases
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_1A4F90000, v0, v1, "invalidateEmailAliases: no-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (id)_loadAllAccountsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  DAMailAccount *v19;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  _BYTE v30[128];
  _QWORD v31[8];

  v31[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C8F028];
  v31[0] = *MEMORY[0x1E0C8F118];
  v31[1] = v5;
  v6 = *MEMORY[0x1E0C8F0A8];
  v31[2] = *MEMORY[0x1E0C8F160];
  v31[3] = v6;
  v7 = *MEMORY[0x1E0C8F0D8];
  v31[4] = *MEMORY[0x1E0C8F0D0];
  v31[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v8);

  if (objc_msgSend(v23, "count"))
  {
    +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v9, "accountsWithTypeIdentifiers:error:", v23, &v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v29;

    if (v10)
      objc_msgSend(v4, "addObjectsFromArray:", v10);
    if (v11)
      v12 = v11;

  }
  else
  {
    v11 = 0;
  }
  v28 = 0;
  objc_msgSend(a1, "_loadDataAccessAccountsWithError:", &v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v28;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(a1, "existingDAMailAccountForDAAccount:", v18);
        v19 = (DAMailAccount *)objc_claimAutoreleasedReturnValue();
        if (v19
          || (v19 = -[DAMailAccount initWithDAAccount:]([DAMailAccount alloc], "initWithDAAccount:", v18)) != 0)
        {
          objc_msgSend(v4, "addObject:", v19);
        }

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v15);
  }

  if (!v22 || v11)
  {
    if (!v11)
    {
      objc_msgSend(a1, "_removeLookAsideValuesNotInAccountList:", v4);
      v11 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v11 = v22;
  }
  if (a3)
  {
    v11 = objc_retainAutorelease(v11);
    *a3 = v11;
  }
LABEL_25:

  return v4;
}

+ (void)_removeLookAsideValuesNotInAccountList:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MFUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMaild");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryForKey:", CFSTR("com.apple.MailAccount-ExtProperties"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = v3;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v19;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "identifier", (_QWORD)v18);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v12);
      }

      v16 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v16, "removeObjectsInArray:", v10);
      objc_msgSend(v8, "removeObjectsForKeys:", v16);
      MFLogGeneral();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_INFO, "Removing lookaside properties for accounts with identifiers: %@", buf, 0xCu);
      }

      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("com.apple.MailAccount-ExtProperties"));
      objc_msgSend(v6, "synchronize");

    }
  }

}

+ (id)_loadDataAccessAccountsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  sharedDAAccountStore();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C8F0B8];
  v19[0] = *MEMORY[0x1E0C8F080];
  v19[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "da_accountsWithAccountTypeIdentifiers:outError:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    v11 = *MEMORY[0x1E0D4D878];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setSourceApplicationBundleIdentifier:", v11, (_QWORD)v14);
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v8;
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _BOOL8 v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MailAccount;
  -[MFAccount persistentAccountDidChange:previousAccount:](&v10, sel_persistentAccountDidChange_previousAccount_, v6, v7);
  if (v7)
  {
    v8 = -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", v7);
    v9 = -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", v6);
    if (v8 != v9)
      -[MailAccount _didBecomeActive:](self, "_didBecomeActive:", v9);
    -[MailAccount _invalidateCachedMailboxen](self, "_invalidateCachedMailboxen", v9);
  }

}

- (BOOL)isActive
{
  MailAccount *v2;
  void *v3;

  v2 = self;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[MailAccount isActiveWithPersistentAccount:](v2, "isActiveWithPersistentAccount:", v3);

  return (char)v2;
}

- (BOOL)isActiveWithPersistentAccount:(id)a3
{
  return objc_msgSend(a3, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]);
}

- (void)setCacheHasBeenRead:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_flagsLock;
  int v6;

  v3 = a3;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (v3)
    v6 = 0x10000;
  else
    v6 = 0;
  self->_flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v6);
  os_unfair_lock_unlock(p_flagsLock);
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
  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)_accounts;
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

  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
  return v5;
}

- (MailAccount)initWithPersistentAccount:(id)a3
{
  return -[MailAccount initWithLibrary:persistentAccount:](self, "initWithLibrary:persistentAccount:", 0, a3);
}

- (void)_invalidateCachedMailboxen
{
  MFMailboxUid *draftsMailboxUid;
  MFMailboxUid *sentMessagesMailboxUid;
  MFMailboxUid *trashMailboxUid;
  MFMailboxUid *archiveMailboxUid;
  MFMailboxUid *junkMailboxUid;

  -[MFLock lock](self->_cachedMailboxenLock, "lock");
  draftsMailboxUid = self->_draftsMailboxUid;
  self->_draftsMailboxUid = 0;

  sentMessagesMailboxUid = self->_sentMessagesMailboxUid;
  self->_sentMessagesMailboxUid = 0;

  trashMailboxUid = self->_trashMailboxUid;
  self->_trashMailboxUid = 0;

  archiveMailboxUid = self->_archiveMailboxUid;
  self->_archiveMailboxUid = 0;

  junkMailboxUid = self->_junkMailboxUid;
  self->_junkMailboxUid = 0;

  -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
  -[MailAccount setCacheHasBeenRead:](self, "setCacheHasBeenRead:", 0);
}

+ (id)infoForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "accountWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_infoForMatchingURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __42__MailAccount_copyReceivingEmailAddresses__block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "mf_emailAddressesWithEquivalentDomains");
  return (id)objc_claimAutoreleasedReturnValue();
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
    -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 3, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[MailAccount deleteMessagesFromMailboxUid:olderThanNumberOfDays:](self, "deleteMessagesFromMailboxUid:olderThanNumberOfDays:", v5, v4);

  }
}

- (int)emptyFrequencyForMailboxType:(int64_t)a3
{
  return -[MailAccount _emptyFrequencyForKey:defaultValue:](self, "_emptyFrequencyForKey:defaultValue:", CFSTR("NumberOfDaysToKeepTrash"), CFSTR("-1"));
}

- (int)_emptyFrequencyForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  int v10;
  int v11;

  v6 = a4;
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v10 = objc_msgSend(v7, "isEqualToString:", &stru_1E4F1C8F8), v9 = v7, v10))
    {
      v9 = v6;
    }
  }
  v11 = objc_msgSend(v9, "intValue");

  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailAccount;
  -[MFAccount description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" path=%@"), self->_path);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

void __18__MailAccount_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  NSMutableDictionary *currentChokedActions;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  MFAutoFetchLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MFAccount ef_publicDescription](self, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v10;
    v33 = 2112;
    v34 = v30;
    v35 = 2112;
    v36 = v28;
    _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "Account: %@ willPerformActionForChokePoint: %@ - coalescePoint: %@", buf, 0x20u);

  }
  -[MailAccount mf_lock](self, "mf_lock");
  currentChokedActions = self->_currentChokedActions;
  if (!currentChokedActions)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = self->_currentChokedActions;
    self->_currentChokedActions = v12;

    currentChokedActions = self->_currentChokedActions;
  }
  -[NSMutableDictionary mf_objectForKey:ofClass:](currentChokedActions, "mf_objectForKey:ofClass:", v8, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("MFMailboxDictClientCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("MFMailboxDictClientCount"));
  MFAutoFetchLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v16;
    _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "Clients for choke point - %@", buf, 0xCu);
  }

  objc_msgSend(v14, "objectForKey:", CFSTR("MFMailboxDictLock"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("ChokeLock"), 1, 0);
    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("MFMailboxDictLock"));
  }
  -[MailAccount mf_unlock](self, "mf_unlock");
  if (v18)
  {
    MFAutoFetchLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v30;
      _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "Waiting for existing fetch to finish for choke point: %@", buf, 0xCu);
    }

    objc_msgSend(v19, "lockWhenCondition:", 2);
    objc_msgSend(v14, "objectForKeyedSubscript:", v29);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    MFAutoFetchLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *a5;
      *(_DWORD *)buf = 138412546;
      v32 = v22;
      v33 = 2112;
      v34 = v30;
      _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "Result: %@ returned for chokepoint: %@", buf, 0x16u);
    }

    -[MailAccount mf_lock](self, "mf_lock");
    objc_msgSend(v14, "objectForKey:", CFSTR("MFMailboxDictClientCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v23;
    v24 = objc_msgSend(v23, "intValue");
    if (v24 < 2)
    {
      MFAutoFetchLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v30;
        _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_DEFAULT, "Removing choke point from current actions: %@", buf, 0xCu);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_currentChokedActions, "removeObjectForKey:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 - 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v25, CFSTR("MFMailboxDictClientCount"));

    }
    -[MailAccount mf_unlock](self, "mf_unlock");
    objc_msgSend(v19, "unlockWithCondition:", 2);
  }
  else
  {
    objc_msgSend(v19, "lock");
  }

  return v18 != 0;
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  LOBYTE(v4) = a4;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
    goto LABEL_11;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB31B0]) & 1) != 0)
  {
    LOBYTE(v4) = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("MFMessageErrorDomain")))
    {
      v8 = objc_msgSend(v5, "code");
      if ((unint64_t)(v8 - 1032) <= 0x1B)
        v4 = (0x77FFF7Eu >> (v8 - 8)) & 1;
      else
        LOBYTE(v4) = 1;
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v4) = 1;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "code") != 60)
    LOBYTE(v4) = 1;
LABEL_12:

  return v4;
}

- (id)powerAssertionIdentifierWithPrefix:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MailAccount displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[MailAccount displayName](self, "displayName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E4F1C8F8;
  }

  -[MFAccount uniqueID](self, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%@-(%@)"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didFinishActionForChokePoint:(id)a3 coalescePoint:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MFAutoFetchLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[MFAccount ef_publicDescription](self, "ef_publicDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v13;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v22;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "Account: %@ didFinishActionForChokePoint: %@ - coalescePoint: %@ - result: %@", buf, 0x2Au);

  }
  -[MailAccount mf_lock](self, "mf_lock");
  -[NSMutableDictionary objectForKey:](self->_currentChokedActions, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("MFMailboxDictLock"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("MFMailboxDictClientCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");
  if (v17 < 2)
  {
    objc_msgSend(v15, "unlock");
    MFAutoFetchLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "Removing choke point from current actions: %@", buf, 0xCu);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_currentChokedActions, "removeObjectForKey:", v8);
  }
  else
  {
    if (!v10)
    {
      MFLogGeneral();
      v21 = objc_claimAutoreleasedReturnValue();
      -[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:].cold.1(v21, (uint64_t *)&self->_currentChokedActions, (uint64_t)v14);

      __assert_rtn("-[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:]", "MailAccount.m", 2977, "0");
    }
    MFAutoFetchLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Updating result for for choke point: %@ - result: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v17 - 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("MFMailboxDictClientCount"));

    objc_msgSend(v14, "setObject:forKey:", v10, v9);
    objc_msgSend(v15, "unlockWithCondition:", 2);
  }
  -[MailAccount mf_unlock](self, "mf_unlock");

}

- (BOOL)sourceIsManaged
{
  BOOL v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 6) & 1) != 0)
    return 1;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MFAccount accountSourceIsManaged:](MailAccount, "accountSourceIsManaged:", v4);

  return v3;
}

void __38__MailAccount_defaultAccountDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D1E2B8], "mailAccountDirectory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultAccountDirectory_sMailAccountDirectory;
  defaultAccountDirectory_sMailAccountDirectory = v0;

}

- (MailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6;
  id v7;
  MailAccount *v8;
  uint64_t v9;
  MFLock *cachedMailboxenLock;
  uint64_t v11;
  MFLock *deletionLock;
  void *v13;
  MFWeakObjectCache *v14;
  uint64_t v15;
  MFWeakObjectCache *messageStoresCache;
  MFLocalActionReplayHandler *v17;
  void *v18;
  uint64_t v19;
  MFLocalActionReplayHandler *replayHandler;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MailAccount;
  v8 = -[MFAccount initWithPersistentAccount:](&v28, sel_initWithPersistentAccount_, v7);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("CachedMailboxenLock"), v8);
    cachedMailboxenLock = v8->_cachedMailboxenLock;
    v8->_cachedMailboxenLock = (MFLock *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MailAccountDeletionLock"), 0);
    deletionLock = v8->_deletionLock;
    v8->_deletionLock = (MFLock *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel_deliveryAccountWillBeRemoved_, CFSTR("DeliveryAccountWillBeRemoved"), 0);

    if (v6)
      -[MailAccount setLibrary:](v8, "setLibrary:", v6);
    else
      -[MailAccount setupLibrary](v8, "setupLibrary");
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v14 = [MFWeakObjectCache alloc];
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __49__MailAccount_initWithLibrary_persistentAccount___block_invoke;
    v25 = &unk_1E4E89A68;
    objc_copyWeak(&v26, &location);
    v15 = -[MFWeakObjectCache initWithBlock:](v14, "initWithBlock:", &v22);
    messageStoresCache = v8->_messageStoresCache;
    v8->_messageStoresCache = (MFWeakObjectCache *)v15;

    v17 = [MFLocalActionReplayHandler alloc];
    -[MailAccount library](v8, "library", v22, v23, v24, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MFLocalActionReplayHandler initWithLibrary:account:](v17, "initWithLibrary:account:", v18, v8);
    replayHandler = v8->_replayHandler;
    v8->_replayHandler = (MFLocalActionReplayHandler *)v19;

    v8->_flagsLock._os_unfair_lock_opaque = 0;
    -[MailAccount _registerStateCaptureHandler](v8, "_registerStateCaptureHandler");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)_registerStateCaptureHandler
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MailAccount stateCaptureTitle](self, "stateCaptureTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v7, &location);
  EFLogRegisterStateCaptureBlock();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_stateCancelable;
  _stateCancelable = v5;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)stateCaptureTitle
{
  return CFSTR("mail-automation: MailAccount");
}

+ (void)performOnAccounts:(id)a3 accountBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__MailAccount_performOnAccounts_accountBlock___block_invoke;
  v10[3] = &unk_1E4E89C30;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_postMailboxListNotificationAfterBlock:", v10);

}

- (BOOL)_resetSpecialMailboxesCanPost:(BOOL)a3
{
  void *v5;
  char v6;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MailAccount__resetSpecialMailboxesCanPost___block_invoke;
  v8[3] = &unk_1E4E89BE0;
  v8[4] = self;
  v8[5] = &v10;
  v9 = a3;
  objc_msgSend(v5, "_postMailboxListNotificationAfterBlock:", v8);
  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)resetSpecialMailboxes
{
  -[MailAccount _resetSpecialMailboxesCanPost:](self, "_resetSpecialMailboxesCanPost:", 1);
}

BOOL __29__MailAccount_reloadAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)connectionError
{
  MFError *v3;

  -[MailAccount mf_lock](self, "mf_lock");
  v3 = self->_lastConnectionError;
  -[MailAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)releaseAllConnections
{
  id v2;

  -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseAllConnections");

}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v3)
      +[DeliveryAccount accountWithIdentifier:](DeliveryAccount, "accountWithIdentifier:", v4);
    else
      +[DeliveryAccount existingAccountWithIdentifier:](DeliveryAccount, "existingAccountWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)existingDAMailAccountForDAAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  objc_msgSend(v3, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)_accounts;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v5);
      v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "uniqueID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
          break;
      }

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v9 = 0;
  }

  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
  objc_msgSend(v9, "setDAAccount:", v3);

  return v9;
}

+ (id)lastMailAccountsReloadDate
{
  id v2;

  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  v2 = (id)_lastAccountsReloadDate;
  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
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

uint64_t __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "savePersistentAccount");
}

+ (void)_removeAccountFromSortedPaths:(id)a3
{
  CFIndex Count;
  CFIndex v4;
  id v5;

  v5 = a3;
  if (_accountsSortedByPath)
  {
    Count = CFArrayGetCount((CFArrayRef)_accountsSortedByPath);
    if (Count)
    {
      v4 = Count - 1;
      do
      {
        if (CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v4) == v5)
        {
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v4);
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v4);
        }
        --v4;
      }
      while (v4 != -1);
    }
  }

}

+ (void)lockMailAccount
{
  os_unfair_recursive_lock_lock_with_options();
}

+ (void)unlockMailAccount
{
  os_unfair_recursive_lock_unlock();
}

+ (id)existingAccountWithType:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "mailAccounts", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "isEquivalentTo:hostname:username:", v8, v9, v10))
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[MailAccount isAccountClassEquivalentTo:](self, "isAccountClassEquivalentTo:", v8)
     && -[MailAccount isHostnameEquivalentTo:](self, "isHostnameEquivalentTo:", v9)
     && -[MailAccount isUsernameEquivalentTo:](self, "isUsernameEquivalentTo:", v10);

  return v11;
}

- (BOOL)isUsernameEquivalentTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MFAccount username](self, "username");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    -[MFAccount username](self, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "compare:options:", v6, 1) == 0;

  }
  return v7;
}

+ (id)_accountContainingEmailAddress:(id)a3 matchingAddress:(id *)a4 fullUserName:(id *)a5 includingInactive:(BOOL)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "emailAddressValue", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simpleAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v6, "stringValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v33 = v6;
  objc_msgSend(v33, "emailAddressValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v33, "stringValue");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  if ((objc_msgSend(v16, "isEqualToString:", &stru_1E4F1C8F8) & 1) != 0
    || objc_msgSend(v16, "isEqualToString:", v33))
  {

    v16 = 0;
  }
  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)_accounts;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v18 = 0;
  if (v17)
  {
    v41 = 0;
    v36 = *(_QWORD *)v47;
LABEL_12:
    v38 = 0;
    v35 = v17;
    while (1)
    {
      if (*(_QWORD *)v47 != v36)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v38);
      if (a6 || objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v38), "isActive"))
      {
        objc_msgSend(v19, "emailAddressesAndAliasesList");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ef_map:", &__block_literal_global_99);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v43 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              if (!objc_msgSend(v26, "caseInsensitiveCompare:", v11))
              {
                objc_msgSend(v19, "fullUserName");
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = (void *)v27;
                if (v16 && (!v27 || objc_msgSend(v16, "caseInsensitiveCompare:", v27)))
                {
                  v29 = v19;

                  v41 = v29;
                }
                else
                {
                  if (a4)
                    *a4 = objc_retainAutorelease(v26);
                  if (a5 && v28 && (objc_msgSend(v28, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
                    *a5 = objc_retainAutorelease(v28);
                  v30 = v19;

                  if ((objc_msgSend(v30, "isActive") & 1) != 0)
                  {

                    v18 = v30;
                    goto LABEL_40;
                  }
                  v18 = v30;
                }

              }
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v23)
              continue;
            break;
          }
        }
LABEL_40:

      }
      if ((objc_msgSend(v18, "isActive") & 1) != 0)
        break;
      if (++v38 == v35)
      {
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v17)
          goto LABEL_12;
        break;
      }
    }
  }
  else
  {
    v41 = 0;
  }

  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
  if (!v18 && v41)
    v18 = v41;
  v31 = v18;

  return v31;
}

id __93__MailAccount__accountContainingEmailAddress_matchingAddress_fullUserName_includingInactive___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)accountContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4
{
  objc_msgSend(a1, "_accountContainingEmailAddress:matchingAddress:fullUserName:includingInactive:", a3, 0, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accountContainingEmailAddress:(id)a3
{
  objc_msgSend(a1, "_accountContainingEmailAddress:matchingAddress:fullUserName:includingInactive:", a3, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accountForHeaders:(id)a3 message:(id)a4 includingInactive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_msgSend(a3, "copyAddressListForResentFrom");
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "isEqualToString:", &stru_1E4F1C8F8) & 1) != 0
    || (+[MailAccount accountContainingEmailAddress:includingInactive:](MailAccount, "accountContainingEmailAddress:includingInactive:", v10, v5), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v7, "senders");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        +[MailAccount accountContainingEmailAddress:includingInactive:](MailAccount, "accountContainingEmailAddress:includingInactive:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), v5, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v13)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v11 = 0;
    }

  }
  return v11;
}

+ (id)accountThatMessageIsFrom:(id)a3 includingInactive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "headersIfAvailable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountForHeaders:message:includingInactive:", v7, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)accountThatMessageIsFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "headersIfAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountForHeaders:message:includingInactive:", v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)addressesThatReceivedMessage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "headersIfAvailable");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v21, "copyAddressListForTo");
  objc_msgSend(v22, "addObjectsFromArray:", v5);
  v6 = objc_msgSend(v21, "copyAddressListForCc");

  objc_msgSend(v22, "addObjectsFromArray:", v6);
  v20 = (void *)v6;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v22;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "emailAddressValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "simpleAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v11, "stringValue");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        objc_msgSend(a1, "_accountContainingEmailAddress:matchingAddress:fullUserName:includingInactive:", v16, 0, 0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
          objc_msgSend(v4, "addObject:", v16);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)allMailboxUids
{
  void *v2;
  void *v3;

  +[MailAccount mailAccounts](MailAccount, "mailAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount allMailboxUidsForAccounts:](MailAccount, "allMailboxUidsForAccounts:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allActivePrimaryMailboxUids
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_103);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __42__MailAccount_allActivePrimaryMailboxUids__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "primaryMailboxUid");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (MailAccount)accountWithPath:(id)a3
{
  accountWithPathTryResolvingSymlinks(a3, 1);
  return (MailAccount *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)newAccountWithPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    accountWithPathTryResolvingSymlinks(v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "mf_betterStringByResolvingSymlinksInPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      accountWithPathTryResolvingSymlinks(v5, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:", v5);
      v3 = v5;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)_stateCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  -[MailAccount dealloc](&v3, sel_dealloc);
}

- (void)test_setTaskManager:(id)a3
{
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailAccount.m"), 875, CFSTR("%s can only be called from unit tests"), "-[MailAccount test_setTaskManager:]");

  }
  -[MFWeakObjectCache removeAllObjects](self->_messageStoresCache, "removeAllObjects");
}

+ (void)test_tearDown
{
  void *v4;
  NSObject *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MailAccount.m"), 881, CFSTR("%s can only be called from unit tests"), "+[MailAccount test_tearDown]");

  }
  mailAccountQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, &__block_literal_global_109);

}

- (void)test_tearDown
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailAccount.m"), 888, CFSTR("%s can only be called from unit tests"), "-[MailAccount test_tearDown]");

  }
  -[MailAccount test_setTaskManager:](self, "test_setTaskManager:", 0);
}

- (void)_setAccountProperties:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MailAccount;
  -[MFAccount _setAccountProperties:](&v6, sel__setAccountProperties_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("SMTPAlternateIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SMTPAlternateIdentifiers"));

}

+ (id)newAccountWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("AccountPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(a1, "newAccountWithPath:", v6);
  if (v7 || (v7 = objc_alloc_init((Class)a1)) != 0)
  {
    if (v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    {
      v8 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("AccountPath"));

    }
    else
    {
      v8 = v4;
    }
    v4 = v8;
    objc_msgSend(v7, "_setAccountProperties:", v8);
  }

  return v7;
}

+ (id)legacyPathForAccountIdentifier:(id)a3 withHostname:(id)a4 username:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a1, "defaultAccountDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "legacyPathNameForAccountWithHostname:username:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mf_betterStringByResolvingSymlinksInPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)legacyPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "accountTypeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@@%@"), v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)legacySQLExpressionToMatchAllMailboxes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MFAccount username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  encodedURLComponent(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount hostname](self, "hostname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  encodedURLComponent(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@@%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("url"));
  objc_msgSend(v9, "contains:caseSensitive:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)URLStringFromLegacyURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUser:", 0);
    objc_msgSend(v5, "setPort:", 0);
    -[MFAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", v6);

    objc_msgSend(v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fullUserName
{
  return -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("FullUserName"));
}

- (void)setFullUserName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  -[MailAccount fullUserName](self, "fullUserName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v4, "length"))
  {
    -[__CFString mf_stringWithNoExtraSpaces](v4, "mf_stringWithNoExtraSpaces");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }
  if (v7 != v5)
  {
    v6 = v5 ? v5 : &stru_1E4F1C8F8;
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v6) & 1) == 0)
    {
      -[MailAccount mf_lock](self, "mf_lock");
      if (v7)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:");
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("FullUserName"));
      -[MailAccount mf_unlock](self, "mf_unlock");
    }
  }

}

+ (id)defaultMailAccountForDeliveryExcludingRestricted
{
  return (id)objc_msgSend(a1, "_defaultMailAccountForDeliveryIncludingRestricted:", 0);
}

+ (id)defaultDeliveryAccount
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultMailAccountForDelivery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deliveryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 0;
}

- (BOOL)isPrimaryDeliveryAccountDisabled
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("SMTPDisabled"), 0);
}

- (void)setPrimaryDeliveryAccountDisabled:(BOOL)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a3);
  -[MailAccount mf_lock](self, "mf_lock");
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, CFSTR("SMTPDisabled"));
  -[MailAccount mf_unlock](self, "mf_unlock");

}

- (id)deliveryAccountAlternates
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPAlternateIdentifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          +[DeliveryAccount accountWithIdentifier:](DeliveryAccount, "accountWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(v3, "addObject:", v8);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setDeliveryAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "primaryDeliveryAccountIsDynamic") & 1) == 0)
  {
    -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v4 || (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
    {
      -[MailAccount mf_lock](self, "mf_lock");
      if (v6)
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("SMTPIdentifier"));
      else
        -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SMTPIdentifier"));
      -[MailAccount mf_unlock](self, "mf_unlock");
    }

  }
}

- (void)setDeliveryAccountAlternates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "identifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPAlternateIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v5) & 1) == 0)
  {
    -[MailAccount mf_lock](self, "mf_lock");
    if (objc_msgSend(v5, "count"))
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("SMTPAlternateIdentifiers"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("SMTPAlternateIdentifiers"));
    -[MailAccount mf_unlock](self, "mf_unlock", (_QWORD)v12);
  }

}

- (BOOL)canUseDeliveryAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MailAccount deliveryAccount](self, "deliveryAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPAlternateIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsObject:", v8);

  }
  return v7;
}

- (void)setCanUseCarrierDeliveryFallback:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[MailAccount mf_lock](self, "mf_lock");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("SMTPCarrierFallbackAllowed"));

  -[MailAccount mf_unlock](self, "mf_unlock");
}

- (BOOL)canUseCarrierDeliveryFallback
{
  void *v2;
  char v3;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SMTPCarrierFallbackAllowed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)isPredefinedAccountType
{
  return 0;
}

- (id)firstEmailAddress
{
  void *v2;
  void *v3;

  -[MailAccount emailAddressStrings](self, "emailAddressStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)checkAndSetDefaultEmailAddress:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  BOOL v8;

  v4 = a3;
  -[MailAccount defaultEmailAddress](self, "defaultEmailAddress");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((id)v5 == v4
    || (v5 ? (v7 = (const __CFString *)v5) : (v7 = &stru_1E4F1C8F8), (objc_msgSend(v4, "isEqualToString:", v7) & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    -[MailAccount mf_lock](self, "mf_lock");
    if (v4)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, CFSTR("defaultAddress"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("defaultAddress"));
    -[MailAccount mf_unlock](self, "mf_unlock");
    v8 = 1;
  }

  return v8;
}

+ (void)updatePersonalStatusForAccounts:(id)a3 forceUpdate:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = objc_alloc_init(getMCCSecretAgentControllerClass());
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v19;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v34;
      v7 = *MEMORY[0x1E0D1ECA0];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v34 != v6)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v27 = 0;
          v28 = &v27;
          v29 = 0x3032000000;
          v30 = __Block_byref_object_copy__4;
          v31 = __Block_byref_object_dispose__4;
          v32 = (id)0xAAAAAAAAAAAAAAAALL;
          objc_msgSend(v9, "systemAccount");
          v32 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstEmailAddress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend((id)v28[5], "accountPropertyForKey:", v7);
            v11 = objc_claimAutoreleasedReturnValue();
            v12 = (void *)v11;
            if (a4 || !v11)
            {
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v10);
              v14 = v13;
              if (v13)
              {
                objc_msgSend(v13, "domain");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v23[0] = MEMORY[0x1E0C809B0];
                v23[1] = 3221225472;
                v23[2] = __59__MailAccount_updatePersonalStatusForAccounts_forceUpdate___block_invoke;
                v23[3] = &unk_1E4E89AB0;
                v25 = &v27;
                v26 = a1;
                v24 = v10;
                objc_msgSend(v20, "isPersonalDomain:completion:", v15, v23);

                v16 = v24;
              }
              else
              {
                MFLogGeneral();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v38 = v10;
                  _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Failed to parse email address %{public}@", buf, 0xCu);
                }
              }

            }
          }
          objc_msgSend(a1, "mf_lock");
          MFLogGeneral();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)v28[5], "accountPropertyForKey:", v7);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v38 = v9;
            v39 = 2112;
            v40 = v18;
            _os_log_debug_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEBUG, "Account %@ isNotPersonal flag is %@", buf, 0x16u);

          }
          objc_msgSend(a1, "mf_unlock");

          _Block_object_dispose(&v27, 8);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v5);
    }

  }
}

void __59__MailAccount_updatePersonalStatusForAccounts_forceUpdate___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Failed to get isPersonal status for %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "mf_lock");
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2 ^ 1u);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccountProperty:forKey:", v8, *MEMORY[0x1E0D1ECA0]);

    objc_msgSend(*(id *)(a1 + 48), "mf_unlock");
  }
}

- (BOOL)checkAndSetEmailAddresses:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MailAccount emailAddressesDictionary](self, "emailAddressesDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      v13 = v4;
      v9 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(", "));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (!v6)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    v12 = MEMORY[0x1E0C9AAB0];
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v9);
      objc_msgSend(v8, "addObject:", v12, v18);
      if (!--v10)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (!v10)
          break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v8, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
  if (v5 == v13)
    goto LABEL_20;
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_msgSend(v13, "isEqual:", v14, v18);
  if (!v5)

  if ((v15 & 1) != 0)
  {
LABEL_20:
    v16 = 0;
  }
  else
  {
    -[MailAccount mf_lock](self, "mf_lock");
    if (v13)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v13, CFSTR("EmailAddresses"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("EmailAddresses"));
    -[MailAccount mf_unlock](self, "mf_unlock");
    v16 = 1;
  }

  return v16;
}

id __39__MailAccount_emailAddressesDictionary__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)receiveEmailAliasAddresses
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("ReceiveEmailAliasAddresses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      v7 = MEMORY[0x1E0C9AAB0];
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", v7, v10);
        if (!--v5)
        {
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (!v5)
            break;
        }
      }
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v3, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v8;
  }
  return v2;
}

- (BOOL)checkAndSetReceiveEmailAliasAddresses:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MailAccount receiveEmailAliasAddresses](self, "receiveEmailAliasAddresses");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((id)v5 == v4 || v5 && (objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[MailAccount mf_lock](self, "mf_lock");
    if (v4)
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, CFSTR("ReceiveEmailAliasAddresses"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("ReceiveEmailAliasAddresses"));
    -[MailAccount mf_unlock](self, "mf_unlock");
    v7 = 1;
  }

  return v7;
}

- (NSDate)lastEmailAliasesSyncDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("LastEmailAliasesSyncDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setLastEmailAliasesSyncDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[MailAccount mf_lock](self, "mf_lock");
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("LastEmailAliasesSyncDate"));
  -[MailAccount mf_unlock](self, "mf_unlock");

}

- (NSString)lastEmailAliasesSyncEntityTag
{
  void *v2;
  void *v3;
  NSString *v4;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("LastEmailAliasesSyncEntityTag"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setLastEmailAliasesSyncEntityTag:(id)a3
{
  id v4;

  v4 = a3;
  -[MailAccount mf_lock](self, "mf_lock");
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v4, CFSTR("LastEmailAliasesSyncEntityTag"));
  -[MailAccount mf_unlock](self, "mf_unlock");

}

- (id)emailAddressesAndAliases
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[MailAccount emailAddressesDictionary](self, "emailAddressesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount receiveEmailAliasAddresses](self, "receiveEmailAliasAddresses");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    -[MailAccount updateEmailAliasesIfNeeded](self, "updateEmailAliasesIfNeeded");
    v6 = v3;
    if (!v3)
    {
      v7 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v6 = (void *)v4;
  if (!v3)
  {
LABEL_5:
    v7 = v6;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v5);
LABEL_7:

  return v7;
}

- (NSString)smtpIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)canAuthenticateWithCurrentCredentials
{
  return 0;
}

- (void)_invalidateAndDeleteAccountData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
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

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "disableMailboxListingNotifications");
  -[MailAccount releaseAllConnections](self, "releaseAllConnections");
  -[MFLock lock](self->_deletionLock, "lock");
  _invalidateMailboxCache(self);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 7);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 4);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 3);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 5);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 2);
  -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 1);
  -[MailAccount library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateAccount:", self);

  if (v3)
  {
    -[MailAccount allMailboxUids](self, "allMailboxUids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByApplyingSelector:", sel_URLString);
    v7 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v7;
    -[MailAccount allLocalMailboxUids](self, "allLocalMailboxUids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v8;
    -[MailAccount path](self, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)MFRemoveItemAtPath();

    -[MailAccount library](self, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteMailboxes:account:", v7, self);

    if (objc_msgSend(v8, "count"))
    {
      +[LocalAccount localAccount](LocalAccount, "localAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(v12, "deleteMailbox:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v14);
      }

      _invalidateMailboxCache(v12);
    }
    +[MailAccount outboxMessageStore:](MailAccount, "outboxMessageStore:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = (id)objc_msgSend(v17, "copyOfAllMessagesWithOptions:", 2048);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (v25)
            objc_msgSend(v18, "addObject:", v23);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(v17, "deleteMessages:moveToTrash:", v18, 0);
      objc_msgSend(v17, "doCompact");
    }
    -[MailAccount library](self, "library");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "deleteAccount:", self);

    -[MailAccount _deleteHook](self, "_deleteHook");
    -[MFAccount setPassword:](self, "setPassword:", 0);
    -[MailAccount deleteDeliveryAccountIfNeeded](self, "deleteDeliveryAccountIfNeeded");

  }
  -[MFLock unlock](self->_deletionLock, "unlock");
  objc_msgSend((id)objc_opt_class(), "enableMailboxListingNotifications:", 1);
}

- (void)_asynchronouslyInvalidateAndDeleteAccountData:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  mailAccountQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__MailAccount__asynchronouslyInvalidateAndDeleteAccountData___block_invoke;
  v6[3] = &unk_1E4E88DF0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

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

  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  v2 = (id)objc_msgSend((id)_accounts, "copy");
  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
  objc_msgSend(v2, "makeObjectsPerformSelector:withObject:", sel_saveState, 0);

}

- (void)releaseAllForcedConnections
{
  id v2;

  -[MailAccount deliveryAccount](self, "deliveryAccount");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseAllForcedConnections");

}

- (void)_synchronizeMailboxListWithFileSystem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MailAccount _mailboxPathPrefix](self, "_mailboxPathPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "mutableCopyWithZone:", 0);

  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v7, "appendString:", CFSTR("/"));
    -[MailAccount _mailboxPathPrefix](self, "_mailboxPathPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v5);

  }
  -[MailAccount mf_lock](self, "mf_lock");
  -[MailAccount rootMailbox](self, "rootMailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount _loadEntriesFromFileSystemPath:parent:](self, "_loadEntriesFromFileSystemPath:parent:", v7, v6);

  -[MailAccount mf_unlock](self, "mf_unlock");
  os_unfair_lock_lock(&self->_flagsLock);
  *(_DWORD *)&self->_flags &= ~0x20000u;
  os_unfair_lock_unlock(&self->_flagsLock);
  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
  -[MailAccount resetSpecialMailboxes](self, "resetSpecialMailboxes");
  -[MailAccount emptyTrash](self, "emptyTrash");

}

- (id)allMailMailboxUid
{
  return 0;
}

- (void)deleteDeliveryAccountIfNeeded
{
  id v3;

  -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[MailAccount deliveryAccountInUseByOtherAccounts:](self, "deliveryAccountInUseByOtherAccounts:", v3))
    +[DeliveryAccount removeDeliveryAccount:](DeliveryAccount, "removeDeliveryAccount:", v3);

}

- (BOOL)deliveryAccountInUseByOtherAccounts:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char v19;
  char v21;
  id obj;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)_accounts;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v21 = 0;
    v23 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v6, "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFAccount uniqueID](self, "uniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7 == v8;

        if (!v9)
        {
          objc_msgSend(v6, "_deliveryAccountCreateIfNeeded:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "uniqueID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", v3);

            if (v13)
            {

              v21 = 1;
              goto LABEL_25;
            }
          }
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v6, "deliveryAccountAlternates");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "uniqueID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqualToString:", v3);

                if ((v19 & 1) != 0)
                {
                  v21 = 1;
                  goto LABEL_19;
                }
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v15)
                continue;
              break;
            }
          }
LABEL_19:

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v21 = 0;
  }
LABEL_25:

  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
  return v21 & 1;
}

- (BOOL)isSpecialMailbox:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isStandardizedMailboxUid") & 1) != 0)
    LOBYTE(v4) = 1;
  else
    v4 = objc_msgSend(v3, "isStore") ^ 1;

  return v4;
}

- (id)mailboxForType:(int64_t)a3
{
  return -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", mailboxUIDTypeFromECMailboxType(a3), 1);
}

- (BOOL)containsMailboxWithURL:(id)a3
{
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MailAccount ownsMailboxUidWithURL:](self, "ownsMailboxUidWithURL:", v4);

  return (char)self;
}

- (id)mailboxesForSuggestionsLostMessageSearchPriorToTime:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[MailAccount allMailMailboxUid](self, "allMailMailboxUid");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MailAccount allMailboxUids](self, "allMailboxUids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke;
    v13[3] = &__block_descriptor_40_e22_B16__0__MFMailboxUid_8l;
    *(double *)&v13[4] = a3;
    objc_msgSend(v8, "ef_filter:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2;
    v12[3] = &__block_descriptor_40_e39_q24__0__MFMailboxUid_8__MFMailboxUid_16l;
    *(double *)&v12[4] = a3;
    objc_msgSend(v10, "sortedArrayUsingComparator:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

BOOL __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  _BOOL8 v6;

  v3 = a2;
  v6 = 0;
  if (objc_msgSend(v3, "mailboxType") != 3 && objc_msgSend(v3, "mailboxType") != 1)
  {
    if (objc_msgSend(v3, "isStore"))
    {
      v4 = *(double *)(a1 + 32);
      if (v4 == 0.0 || (objc_msgSend(v3, "suggestionsLostMessageSearchTimestamp"), v4 >= v5))
        v6 = 1;
    }
  }

  return v6;
}

uint64_t __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;

  v5 = a2;
  v6 = a3;
  if (*(double *)(a1 + 32) != 0.0)
  {
    objc_msgSend(v5, "suggestionsLostMessageSearchTimestamp");
    v8 = v7;
    objc_msgSend(v6, "suggestionsLostMessageSearchTimestamp");
    if (v8 < v9)
    {
      v10 = -1;
      goto LABEL_10;
    }
    objc_msgSend(v5, "suggestionsLostMessageSearchTimestamp");
    v12 = v11;
    objc_msgSend(v6, "suggestionsLostMessageSearchTimestamp");
    if (v12 > v13)
      goto LABEL_6;
  }
  v14 = objc_msgSend(v5, "suggestionsLostMessageSearchResultCount");
  if (v14 > objc_msgSend(v6, "suggestionsLostMessageSearchResultCount"))
  {
LABEL_6:
    v10 = 1;
    goto LABEL_10;
  }
  v15 = objc_msgSend(v5, "suggestionsLostMessageSearchResultCount");
  if (v15 >= objc_msgSend(v6, "suggestionsLostMessageSearchResultCount"))
    v10 = 0;
  else
    v10 = -1;
LABEL_10:

  return v10;
}

- (id)transferDisabledMailboxUids
{
  return 0;
}

- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && -[MailAccount isActive](self, "isActive")
    && -[MailAccount _canEmptyMessagesFromMailboxUid:](self, "_canEmptyMessagesFromMailboxUid:", v8))
  {
    -[MailAccount storeForMailboxUid:](self, "storeForMailboxUid:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteMessagesOlderThanNumberOfDays:compact:", v4, 1);

  }
}

- (void)_setEmptyFrequency:(int)a3 forKey:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  EFStringWithInt();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount mf_lock](self, "mf_lock");
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, v6);
  -[MailAccount mf_unlock](self, "mf_unlock");

}

- (void)setEmptyFrequency:(int)a3 forMailboxType:(int64_t)a4
{
  -[MailAccount _setEmptyFrequency:forKey:](self, "_setEmptyFrequency:forKey:", *(_QWORD *)&a3, CFSTR("NumberOfDaysToKeepTrash"));
}

+ (NSString)csAccountTypeString
{
  return (NSString *)(id)*MEMORY[0x1E0CA5D00];
}

+ (id)mailboxUidForFileSystemPath:(id)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  CFIndex Count;
  CFIndex v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a4;
  v5 = a3;
  v6 = 0;
  if (v5 && _sortedAccountPaths)
  {
    +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
    Count = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
    if (Count < 1)
    {
LABEL_8:
      v10 = 0;
      v9 = 0;
    }
    else
    {
      v8 = 0;
      while (1)
      {
        CFArrayGetValueAtIndex((CFArrayRef)_sortedAccountPaths, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "mf_isSubdirectoryOfPath:", v9) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", v9) & 1) != 0)
        {
          break;
        }

        if (Count == ++v8)
          goto LABEL_8;
      }
      if (!v9)
        goto LABEL_16;
      v11 = objc_msgSend(v5, "rangeOfString:options:", v9, 8);
      v13 = v12;
      v14 = objc_msgSend(v5, "length");
      v15 = v11 + v13;
      if (v15 != objc_msgSend(v9, "length"))
        goto LABEL_16;
      if (v15 == v14)
      {
        v16 = 0;
      }
      else
      {
        if (objc_msgSend(v5, "characterAtIndex:", v15) != 47)
        {
LABEL_16:
          v10 = 0;
          goto LABEL_17;
        }
        v14 = v15 + 1;
        v16 = objc_msgSend(v5, "length") - (v15 + 1);
      }
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_16;
      CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v5, "substringWithRange:", v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
        if (v17)
        {
          objc_msgSend(v10, "mailboxUidForRelativePath:create:", v17, v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
LABEL_24:

            goto LABEL_25;
          }
        }
        else
        {
          v6 = 0;
        }
        if (Count >= 1)
        {
          +[LocalAccount localAccount](LocalAccount, "localAccount");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "mailboxUidForFileSystemPath:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_24;
      }
    }
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
LABEL_25:

  return v6;
}

- (NSString)mailboxPathExtension
{
  return (NSString *)&stru_1E4F1C8F8;
}

- (BOOL)canCreateNewMailboxes
{
  return 1;
}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (a4)
  {
    if (v7 == 1)
    {
      *a4 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("MAILBOX_NAME_INCLUDES_PATH_SEPARATOR"), CFSTR("Mailbox names may not include “%@”."), CFSTR("Delayed"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, CFSTR("/"));
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v10;

    }
  }

  return v7 == 1;
}

- (BOOL)canMailboxBeRenamed:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_rootMailboxUid) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "mailboxType");
    v5 = v6 == -100 || v6 == 0;
  }

  return v5;
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
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MailAccount renameMailbox:newName:parent:](self, "renameMailbox:newName:parent:", v6, v7, v8);

  return (char)self;
}

- (BOOL)_renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const std::__fs::filesystem::path *v17;
  const std::__fs::filesystem::path *v18;
  std::error_code *v19;
  int v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  const std::__fs::filesystem::path *v28;
  id v29;
  const std::__fs::filesystem::path *v30;
  std::error_code *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v57 = a4;
  v64 = a5;
  v62 = v7;
  objc_msgSend(v7, "fullPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "attributes");
  objc_msgSend(v7, "parent");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount log](MailAccount, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v62, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v57);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v11;
    v74 = 2114;
    v75 = v12;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Renaming mailbox %{public}@ newName: %{public}@", buf, 0x16u);

  }
  -[MailAccount mf_lock](self, "mf_lock");
  objc_msgSend(v62, "depthFirstEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "arrayByApplyingSelector:", sel_URLString);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    -[MailAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", v57);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setName:", v14);

  }
  if (v64)
    objc_msgSend(v62, "setParent:", v64);
  objc_msgSend(v61, "makeObjectsPerformSelector:", sel_flushCriteria);
  objc_msgSend(v61, "arrayByApplyingSelector:", sel_URLString);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "fullPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ef_pathByReplacingRelativePathWithFolderName:", CFSTR("mbox"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v63, "fileExistsAtPath:", v60) & 1) == 0
    && !objc_msgSend(v63, "mf_makeCompletePath:mode:", v60, 448))
  {
    goto LABEL_20;
  }
  if (objc_msgSend(v63, "fileExistsAtPath:", v8))
  {
    v17 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    v18 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v15), "fileSystemRepresentation");
    rename(v17, v18, v19);
    v21 = v20 == 0;
  }
  else
  {
    v21 = 1;
  }
  +[MailAccount log](MailAccount, "log");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v62, "ef_publicDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v23;
    v74 = 1024;
    LODWORD(v75) = v21;
    _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "Renaming file at new path for mailbox %{public}@ result %d", buf, 0x12u);

  }
  if (!v21)
  {
LABEL_20:
    v59 = 0;
LABEL_21:
    v66 = v8;
    goto LABEL_22;
  }
  -[MailAccount library](self, "library");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v24, "renameMailboxes:to:", v55, v56);

  +[MailAccount log](MailAccount, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v61, "ef_mapSelector:", sel_ef_publicDescription);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v26;
    v74 = 1024;
    LODWORD(v75) = v59;
    _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "Renaming mailboxes in the database %{public}@ result %d", buf, 0x12u);

  }
  if ((v59 & ((v9 & 3) == 0)) != 1)
    goto LABEL_21;
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v63, "fileExistsAtPath:", v27))
  {
    v28 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v27), "fileSystemRepresentation");
    objc_msgSend(v15, "stringByDeletingPathExtension");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const std::__fs::filesystem::path *)objc_msgSend(v29, "fileSystemRepresentation");
    rename(v28, v30, v31);
    v59 = v32 == 0;

  }
  else
  {
    v59 = 1;
  }
  +[MailAccount log](MailAccount, "log");
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v62, "ef_publicDescription");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v54;
    v74 = 1024;
    LODWORD(v75) = v59;
    _os_log_impl(&dword_1A4F90000, v53, OS_LOG_TYPE_DEFAULT, "Renaming file that requires two renames at new path for mailbox %{public}@ result %d", buf, 0x12u);

  }
  v66 = v27;
LABEL_22:
  -[MailAccount mf_unlock](self, "mf_unlock");
  if ((v59 & 1) != 0)
  {
    v33 = 0;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("RENAME_FAILED"), CFSTR("Mail was unable to rename “%@”."), CFSTR("Delayed"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1033, v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v33, "localizedDescription");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setError:", v33);

  }
  if (((objc_msgSend(v64, "isEqual:", v58) | v59 ^ 1) & 1) == 0
    && objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationsAreEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), v58, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "postNotification:", v41);

    +[MailAccount log](MailAccount, "log");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v62, "ef_publicDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v43;
      _os_log_impl(&dword_1A4F90000, v42, OS_LOG_TYPE_DEFAULT, "Successfully renamed mailbox %{public}@", buf, 0xCu);

    }
  }
  if (v64
    && -[MailAccount cacheHasBeenRead](self, "cacheHasBeenRead")
    && objc_msgSend((id)objc_opt_class(), "mailboxListingNotificationsAreEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AccountMailboxListingDidChange"), v64, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "postNotification:", v45);

  }
  if (!v33)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v46 = v61;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v68 != v48)
            objc_enumerationMutation(v46);
          v50 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "postNotificationName:object:userInfo:", CFSTR("MFMailboxUidWasRenamedNotification"), v50, 0);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v47);
    }

  }
  -[MailAccount _synchronouslyLoadListingForParent:](self, "_synchronouslyLoadListingForParent:", v64);
  if ((objc_msgSend(v64, "isEqual:", v58) & 1) == 0)
    -[MailAccount _synchronouslyLoadListingForParent:](self, "_synchronouslyLoadListingForParent:", v58);
  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
  clearMailboxUIDCache();

  return v59;
}

- (BOOL)deleteMailbox:(id)a3
{
  return -[MailAccount deleteMailbox:reflectToServer:](self, "deleteMailbox:reflectToServer:", a3, 1);
}

- (BOOL)deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  id v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint8_t v49[4];
  void *v50;
  uint8_t buf[4];
  _BOOL4 v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v4 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  +[MailAccount log](MailAccount, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v46, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v52 = v4;
    v53 = 2114;
    v54 = v7;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Deleting mailbox (reflect to server = %d): %{public}@", buf, 0x12u);

  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v46, "mailboxType");
  objc_msgSend(v46, "fullPath");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "depthFirstEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v9;
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0;
  v13 = 1;
LABEL_4:
  v14 = (void *)v12;
  while (((objc_msgSend(v8, "shouldCancel") ^ 1) & v13) == 1 && v11 != 0)
  {
    objc_msgSend(v11, "parent");
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = -[MailAccount _deleteMailbox:reflectToServer:](self, "_deleteMailbox:reflectToServer:", v11, v4);
    v14 = (void *)v12;
    if (v13)
    {
      v16 = v11;
      objc_msgSend(v16, "URLString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

      if (v18)
      {
        +[MailAccount log](MailAccount, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "ef_publicDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MailAccount deleteMailbox:reflectToServer:].cold.1(v20, buf, &v52, v19);
        }

      }
      objc_msgSend(v16, "URLString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "ef_addOptionalObject:", v21);

      if (v10)
      {
        objc_msgSend(v10, "nextObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

      -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
      objc_msgSend(v16, "setParent:", 0);

      goto LABEL_4;
    }
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject fileExistsAtPath:](v22, "fileExistsAtPath:", v45))
    {
      MFRemoveItemAtPath();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
        goto LABEL_24;
      MFLogGeneral();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v49 = 138412290;
        v50 = v45;
        _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_INFO, "failed to remove path %@", v49, 0xCu);
      }
    }

  }
LABEL_24:
  if (objc_msgSend(v47, "count"))
  {
    -[MailAccount library](self, "library");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "deleteMailboxes:account:", v47, self);

  }
  if (v13)
  {
    if (v44)
    {
      -[MFLock lock](self->_cachedMailboxenLock, "lock");
      if (v44 <= 7 && ((0x5Fu >> (v44 - 1)) & 1) != 0)
      {
        v26 = *off_1E4E89D58[v44 - 1];
        v27 = *(Class *)((char *)&self->super.super.isa + v26);
        *(Class *)((char *)&self->super.super.isa + v26) = 0;

      }
      -[MFLock unlock](self->_cachedMailboxenLock, "unlock");
    }
  }
  else
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("DELETE_FAILED_FORMAT"), CFSTR("Unable to delete “%@”."), CFSTR("Delayed"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "accountRelativePath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setError:", v36);

    }
  }
  if (v14)
  {
    -[MailAccount taskManager](self, "taskManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[MailAccount mf_lock](self, "mf_lock");
      objc_msgSend(v14, "children");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "arrayByExcludingObjectsInArray:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setChildren:", v40);
      -[MailAccount mf_unlock](self, "mf_unlock");
    }
    else
    {
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "error");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[MailAccount _synchronouslyLoadListingForParent:](self, "_synchronouslyLoadListingForParent:", v14);
      -[MailAccount mf_lock](self, "mf_lock");
      -[MailAccount _setChildren:forMailboxUid:](self, "_setChildren:forMailboxUid:", 0, v14);
      -[MailAccount mf_unlock](self, "mf_unlock");
      if (v40)
      {
        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setError:", v40);

      }
    }

  }
  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);
  clearMailboxUIDCache();

  return v13;
}

- (void)_resetAllMailboxURLs:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (-[MailAccount isActive](self, "isActive"))
  {
    +[MailAccount mailAccounts](MailAccount, "mailAccounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v5;
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "containsObject:", self);
      v6 = v20;
      if ((v7 & 1) != 0)
      {
        -[MailAccount allMailboxUids](self, "allMailboxUids");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count", v8);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v8;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_msgSend(v16, "URLString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                objc_msgSend(v16, "flushCriteria");
                objc_msgSend(v16, "URLString");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18 && (objc_msgSend(v17, "isEqualToString:", v18) & 1) == 0)
                {
                  objc_msgSend(v10, "addObject:", v17);
                  objc_msgSend(v11, "addObject:", v18);
                }

              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v13);
        }

        if (objc_msgSend(v11, "count"))
        {
          if (v3)
          {
            -[MailAccount library](self, "library");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "renameMailboxes:to:", v10, v11);

          }
        }
        clearMailboxUIDCache();

        v6 = v20;
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
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  objc_super v9;

  v4 = a3;
  -[MFAccount username](self, "username");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (__CFString *)v5;
  else
    v6 = &stru_1E4F1C8F8;
  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  -[MFAccount setUsername:](&v9, sel_setUsername_, v4);
  -[MFAccount username](self, "username");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = &stru_1E4F1C8F8;
  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", v6) & 1) == 0)
    -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 0);

}

- (void)setHostname:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  objc_super v9;

  v4 = a3;
  -[MFAccount hostname](self, "hostname");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (__CFString *)v5;
  else
    v6 = &stru_1E4F1C8F8;
  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  -[MFAccount setHostname:](&v9, sel_setHostname_, v4);
  -[MFAccount hostname](self, "hostname");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = &stru_1E4F1C8F8;
  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", v6) & 1) == 0)
    -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 0);

}

- (BOOL)isHostnameEquivalentTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;

  v4 = a3;
  -[MFAccount hostname](self, "hostname");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    -[MFAccount hostname](self, "hostname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

  }
  return v7;
}

- (BOOL)isAccountClassEquivalentTo:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  objc_class *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {
    v8 = 1;
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v3);

  }
  return v8;
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
  id v6;
  id v7;
  void *v8;
  int v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Hostname")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Username")) & 1) != 0
    || objc_msgSend(v7, "isEqual:", CFSTR("PortNumber")))
  {
    -[MailAccount allMailboxUids](self, "allMailboxUids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "makeObjectsPerformSelector:", sel_URLString);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)MailAccount;
  -[MFAccount setValueInAccountProperties:forKey:](&v10, sel_setValueInAccountProperties_forKey_, v6, v7);
  if (v9)
    -[MailAccount _resetAllMailboxURLs:](self, "_resetAllMailboxURLs:", 1);

}

- (Class)storeClass
{
  -[MailAccount doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailAccount storeClass]", "MailAccount.m", 2450, "0");
}

+ (id)accountIDFromMailboxURLString:(id)a3 urlScheme:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (!v6
       || (objc_msgSend(v7, "scheme"),
           v9 = (void *)objc_claimAutoreleasedReturnValue(),
           v10 = objc_msgSend(v9, "isEqualToString:", v6),
           v9,
           (v10 & 1) != 0)))
    {
      objc_msgSend(v8, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)URL
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Account");
  v6[1] = CFSTR("RelativePath");
  v7[0] = self;
  v7[1] = &stru_1E4F1C8F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount _URLForInfo:](self, "_URLForInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (MailAccount)accountWithURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
    objc_msgSend(a1, "accountWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (MailAccount *)v6;
}

- (void)updateEmailAliasesIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_1A4F90000, v0, v1, "updateEmailAliasesIfNeeded: no-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)updateEmailAliasesForActiveAccounts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  +[MailAccount activeAccounts](MailAccount, "activeAccounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "updateEmailAliasesIfNeeded");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

+ (id)standardAccountClass:(Class)a3 valueForKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MailAccount_standardAccountClass_valueForKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (standardAccountClass_valueForKey__onceToken != -1)
    dispatch_once(&standardAccountClass_valueForKey__onceToken, block);
  v7 = (void *)standardAccountClass_valueForKey__sStandardAccountValues;
  NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __48__MailAccount_standardAccountClass_valueForKey___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("ISP"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)standardAccountClass_valueForKey__sStandardAccountValues;
    standardAccountClass_valueForKey__sStandardAccountValues = v3;

  }
}

+ (id)predefinedValueForKey:(id)a3
{
  objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)usernameIsEmailAddress
{
  return 0;
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

- (BOOL)mustArchiveSentMessages
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("SaveSentMessages"), 1);
}

- (BOOL)canArchiveSentMessages
{
  return 1;
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

- (BOOL)shouldFetchRemoteLinksWithDateReceived:(id)a3
{
  return 0;
}

- (BOOL)moveSupported
{
  return 0;
}

- (void)newActionsAdded
{
  void *v3;
  void *v4;
  id v5;

  -[MailAccount taskManager](self, "taskManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "checkForNewLocalActions");
  }
  else
  {
    -[MailAccount replayHandler](self, "replayHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "newActionsAdded");

  }
}

- (void)addNewAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MailAccount replayHandler](self, "replayHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addNewAction:", v5);

}

- (id)replayAction:(id)a3
{
  return 0;
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
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  -[MFAccount hostname](self, "hostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  -[MFAccount username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0;
  -[MFAccount password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") != 0;

  return v8;
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

- (void)deliveryAccountWillBeRemoved:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MailAccount _deliveryAccountCreateIfNeeded:](self, "_deliveryAccountCreateIfNeeded:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[MailAccount setDeliveryAccount:](self, "setDeliveryAccount:", 0);

}

- (id)pushedMailboxUids
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[MailAccount primaryMailboxUid](self, "primaryMailboxUid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsUserPushedMailboxes
{
  return 0;
}

+ (id)_accountWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "mailboxUidForFileSystemPath:create:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "account");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = (id)_accountsSortedByPath;
    v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "path", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v4, "isEqualToString:", v12);

          if (v13)
          {
            v7 = v11;
            goto LABEL_13;
          }
        }
        v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v7;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  id v6;

  v3 = a3;
  -[MFAccount persistentAccount](self, "persistentAccount");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:");
  if (v6)
    objc_msgSend(v6, "setEnabled:forDataclass:", v3, *MEMORY[0x1E0C8F3D0]);
  if (-[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:", v6) == v3 && v5 != v3)
    -[MailAccount _didBecomeActive:](self, "_didBecomeActive:", v3);

}

- (void)_didBecomeActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  if (!+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    v7 = 0;
    if (!v3)
      goto LABEL_3;
LABEL_5:
    _configureMailboxCache(self);
    -[MailAccount resetSpecialMailboxes](self, "resetSpecialMailboxes");
    objc_msgSend(v7, "accountBecameActive:", self);
    goto LABEL_6;
  }
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hookRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_5;
LABEL_3:
  mailAccountQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__MailAccount__didBecomeActive___block_invoke;
  v9[3] = &unk_1E4E88EE8;
  v9[4] = self;
  v10 = v7;
  dispatch_async(v8, v9);

LABEL_6:
}

uint64_t __32__MailAccount__didBecomeActive___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAndDeleteAccountData:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "accountBecameInactive:", *(_QWORD *)(a1 + 32));
}

- (void)setMailboxCachePath:(id)a3
{
  NSString *v4;
  NSString *mailboxCachePath;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mailboxCachePath = self->_mailboxCachePath;
  self->_mailboxCachePath = v4;

}

- (void)_loadEntriesFromFileSystemPath:(id)a3 parent:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;
  CFArrayRef theArray;
  id obj;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD context[3];
  _BYTE v36[128];
  uint64_t v37;
  CFRange v38;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = a4;
  v24 = (void *)MEMORY[0x1A85B0E24]();
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v5, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  theArray = (CFArrayRef)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context[0] = self;
  context[1] = v5;
  context[2] = v26;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v25;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((objc_msgSend(v11, "hasPrefix:", CFSTR(".")) & 1) == 0)
        {
          v30 = -86;
          objc_msgSend(v5, "appendString:", CFSTR("/"));
          objc_msgSend(v5, "appendString:", v11);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v5, &v30);
          if (v30)
            v14 = v13;
          else
            v14 = 0;

          if (v14)
          {
            -[MailAccount mailboxPathExtension](self, "mailboxPathExtension");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "pathExtension");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if (v17)
            {
              objc_msgSend(v11, "stringByDeletingPathExtension");
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = v11;
            }
            v19 = v18;
            -[MailAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v20, CFSTR("MailboxName"), &unk_1E4F69B38, CFSTR("MailboxAttributes"), 0);
            -[__CFArray addObject:](theArray, "addObject:", v21);

          }
          objc_msgSend(v5, "deleteCharactersInRange:", v6, objc_msgSend(v5, "length") - v6);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(v26, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MailAccount _loadMailboxListingIntoCache:attributes:children:parent:](self, "_loadMailboxListingIntoCache:attributes:children:parent:", v22, 2, theArray, v26);

  if (v23)
    -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
  v38.length = -[__CFArray count](theArray, "count");
  v38.location = 0;
  CFArrayApplyFunction(theArray, v38, (CFArrayApplierFunction)_recurseIntoFileSystem, context);

  objc_autoreleasePoolPop(v24);
}

void __65__MailAccount__writeMailboxCacheWithPrejudice_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", *(_QWORD *)(a1 + 32), 200, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeToFile:options:error:", *(_QWORD *)(a1 + 40), 1073741825, 0);
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Finished writing to disk mailbox cache mailboxes.count:%lu self:%{public}@", (uint8_t *)&v7, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  return 1;
}

- (void)_setSpecialMailbox:(id)a3 forType:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "accountRelativePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount specialMailboxNameForType:](self, "specialMailboxNameForType:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 != (void *)v7)
  {
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E4F1C8F8;
    if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) == 0)
    {
      -[MailAccount _setSpecialMailboxName:forType:](self, "_setSpecialMailboxName:forType:", v6, a4);
      -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", v10, a4);
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
  void *v3;

  v2 = sLogDeleteActivity;
  if (sLogDeleteActivity == -1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "BOOLForKey:", CFSTR("LogDeleteActivity"));

    sLogDeleteActivity = v2;
  }
  return v2 == 1;
}

- (id)_infoForMatchingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relativePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self, CFSTR("Account"));
  v8 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("/"), 8);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "substringWithRange:", v8 + v7, objc_msgSend(v6, "length") - (v8 + v7));
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  if (v6 && (objc_msgSend(v6, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RelativePath"));

  return v5;
}

- (id)_URLScheme
{
  return 0;
}

- (BOOL)_writeCustomInfoToMailboxCache:(id)a3
{
  return 1;
}

- (BOOL)_repairMailboxCache
{
  return 1;
}

- (id)URLForMessage:(id)a3
{
  return 0;
}

- (id)uniqueServerIdForMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "globalMessageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newMailboxWithParent:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootMailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathRelativeToMailbox:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathComponent:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "canMoveMessagesFromAccount:toAccount:profileConnection:", v6, v7, v8);

  return (char)a1;
}

+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4 profileConnection:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  char v11;
  BOOL v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 == v8)
    goto LABEL_8;
  if ((objc_msgSend(v7, "restrictedFromTransferingMessagesToOtherAccounts") & 1) != 0
    || !objc_msgSend(v8, "supportsAppend"))
  {
    v12 = 0;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v7, "sourceIsManaged");
  if (v10 == objc_msgSend(v8, "sourceIsManaged"))
  {
LABEL_8:
    v12 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "sourceIsManaged"))
    v11 = objc_msgSend(v9, "mayOpenFromManagedToUnmanaged");
  else
    v11 = objc_msgSend(v9, "mayOpenFromUnmanagedToManaged");
  v12 = v11;
LABEL_9:

  return v12;
}

- (id)_localMailboxNameForType:(int64_t)a3 usingDisplayName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  +[LocalAccount localAccount](LocalAccount, "localAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specialMailboxNameForType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "_defaultSpecialMailboxNameForType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_5;
LABEL_8:
    if ((objc_msgSend(v6, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
    {
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" (%@)"), v6);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    goto LABEL_10;
  }
  if (v6)
    goto LABEL_8;
LABEL_5:
  -[MailAccount displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v9 && !objc_msgSend(v9, "isEqualToString:", &stru_1E4F1C8F8))
    goto LABEL_8;
  -[MailAccount firstEmailAddress](self, "firstEmailAddress");
  v10 = objc_claimAutoreleasedReturnValue();

  v6 = (id)v10;
  if (v10)
    goto LABEL_8;
LABEL_10:

  return v8;
}

- (BOOL)isMailboxLocalForType:(int64_t)a3
{
  return 0;
}

- (id)allLocalMailboxUids
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v3 = 0;
  v4 = 0;
  v11 = *MEMORY[0x1E0C80C00];
  v8 = xmmword_1A59994B0;
  v9 = xmmword_1A59994C0;
  v10 = 1;
  do
  {
    v5 = *(_QWORD *)((char *)&v8 + v3);
    if (-[MailAccount isMailboxLocalForType:](self, "isMailboxLocalForType:", v5, v8, v9, v10, v11))
    {
      -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (!v4)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v4, "addObject:", v6);
      }

    }
    v3 += 8;
  }
  while (v3 != 40);
  return v4;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 0;
}

- (id)saveSentFolder
{
  return 0;
}

- (id)valueInAccountLookAsidePropertiesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("com.apple.MailAccount-ExtProperties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFAccount identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setValueInAccountLookAsideProperties:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("com.apple.MailAccount-ExtProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MFAccount identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "mutableCopy");

  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  if (v14)
    objc_msgSend(v13, "setObject:forKey:", v14, v6);
  else
    objc_msgSend(v13, "removeObjectForKey:", v6);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v10);
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("com.apple.MailAccount-ExtProperties"));
  objc_msgSend(v7, "synchronize");

}

- (void)_setValueInAccountLookAsideProperties:(id)a3 forKey:(id)a4 subKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MailAccount valueInAccountLookAsidePropertiesForKey:](self, "valueInAccountLookAsidePropertiesForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __assert_rtn("-[MailAccount _setValueInAccountLookAsideProperties:forKey:subKey:]", "MailAccount.m", 4107, "[dictionary isKindOfClass:[NSDictionary class]]");
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    v13 = v12;
    if (v8)
      objc_msgSend(v12, "setObject:forKey:", v8, v10);
    else
      objc_msgSend(v12, "removeObjectForKey:", v10);
    -[MailAccount setValueInAccountLookAsideProperties:forKey:](self, "setValueInAccountLookAsideProperties:forKey:", v13, v9);

  }
  else if (v8)
  {
    v15 = v10;
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount setValueInAccountLookAsideProperties:forKey:](self, "setValueInAccountLookAsideProperties:forKey:", v14, v9);

  }
}

- (id)signingIdentityPersistentReferenceForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MailAccount valueInAccountLookAsidePropertiesForKey:](self, "valueInAccountLookAsidePropertiesForKey:", CFSTR("SendingIdentities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  -[MailAccount _setValueInAccountLookAsideProperties:forKey:subKey:](self, "_setValueInAccountLookAsideProperties:forKey:subKey:", a3, CFSTR("SendingIdentities"), a4);
}

- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MailAccount valueInAccountLookAsidePropertiesForKey:](self, "valueInAccountLookAsidePropertiesForKey:", CFSTR("EncryptionIdentities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  -[MailAccount _setValueInAccountLookAsideProperties:forKey:subKey:](self, "_setValueInAccountLookAsideProperties:forKey:subKey:", a3, CFSTR("EncryptionIdentities"), a4);
}

- (BOOL)perMessageEncryptionEnabledForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MailAccount encryptionIdentityPersistentReferenceForAddress:](self, "encryptionIdentityPersistentReferenceForAddress:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[MFAccount isManaged](self, "isManaged"))
    {
      -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("PerMessageSMIMEEnabled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");

    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }

  return (char)v5;
}

- (int64_t)secureCompositionSigningPolicyForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  int64_t v18;

  v4 = a3;
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simpleAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[MailAccount firstEmailAddress](self, "firstEmailAddress");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_msgSend(v9, "isEqualToString:", v15);
  if (v16)
  {
    -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("SMIMESigningEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)secureCompositionEncryptionPolicyForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  int64_t v18;

  v4 = a3;
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simpleAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[MailAccount firstEmailAddress](self, "firstEmailAddress");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_msgSend(v9, "isEqualToString:", v15);
  if (v16)
  {
    -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("SMIMEEncryptionEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)copyDataForRemoteEncryptionCertificatesForAddresses:(id)a3 errors:(id *)a4
{
  return 0;
}

- (id)copyDataForRemoteEncryptionCertificatesForAddress:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)restrictedFromTransferingMessagesToOtherAccounts
{
  return +[MFAccount accountIsRestrictedFromTransfersToOtherAccounts:](MFAccount, "accountIsRestrictedFromTransfersToOtherAccounts:", self);
}

- (BOOL)restrictedFromSendingExternally
{
  return +[MFAccount accountIsPreventedFromSendingFromExternalProcesses:](MFAccount, "accountIsPreventedFromSendingFromExternalProcesses:", self);
}

- (BOOL)restrictedFromSyncingRecents
{
  return +[MFAccount accountRestrictsRecentsSyncing:](MFAccount, "accountRestrictsRecentsSyncing:", self);
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

- (BOOL)supportsThreadOperations
{
  return 1;
}

- (BOOL)preventArchiveForMailbox:(id)a3
{
  id v4;
  int v5;
  BOOL v6;

  v4 = a3;
  v5 = !-[MailAccount supportsArchiving](self, "supportsArchiving");
  if (!v4)
    LOBYTE(v5) = 1;
  v6 = (v5 & 1) == 0 && (unint64_t)(objc_msgSend(v4, "mailboxType") - 1) < 5;

  return v6;
}

- (BOOL)canArchiveForMailbox:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[MailAccount supportsArchiving](self, "supportsArchiving"))
    v5 = !-[MailAccount preventArchiveForMailbox:](self, "preventArchiveForMailbox:", v4);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (int64_t)archiveDestinationForMailbox:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (!-[MailAccount supportsArchiving](self, "supportsArchiving"))
    __assert_rtn("-[MailAccount archiveDestinationForMailbox:]", "MailAccount.m", 4264, "[self supportsArchiving] && \"only accounts that support archiving should call into this\");
  if (-[MailAccount canArchiveForMailbox:](self, "canArchiveForMailbox:", v4))
    v5 = 2;
  else
    v5 = 3;

  return v5;
}

- (id)unsupportedHandoffTypes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsHandoffType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MailAccount unsupportedHandoffTypes](self, "unsupportedHandoffTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4) ^ 1;

  return v6;
}

- (BOOL)supportsMailDrop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  return -[MFAccount supportsMailDrop](&v3, sel_supportsMailDrop);
}

id __43__MailAccount__registerStateCaptureHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugAccountState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)lastKnownCapabilities
{
  return 0;
}

- (id)debugAccountState
{
  MFDebugAccountState *v3;
  void *v4;
  void *v5;
  MFDebugAccountState *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = [MFDebugAccountState alloc];
  -[MFAccount identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount lastKnownCapabilities](self, "lastKnownCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFDebugAccountState initWithStateEventDictionary:identifier:lastKnownCapabilities:](v3, "initWithStateEventDictionary:identifier:lastKnownCapabilities:", self, v4, v5);

  v10 = CFSTR("Account Info");
  -[MFDebugAccountState dictionaryRepresentation](v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)supportsFastRemoteBodySearch
{
  return self->_supportsFastRemoteBodySearch;
}

- (MFLocalActionReplayHandler)replayHandler
{
  return self->_replayHandler;
}

- (void)setReplayHandler:(id)a3
{
  objc_storeStrong((id *)&self->_replayHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayHandler, 0);
  objc_storeStrong((id *)&self->_messageStoresCache, 0);
  objc_storeStrong((id *)&self->_mailboxCachePath, 0);
  objc_storeStrong((id *)&self->_currentChokedActions, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lastConnectionError, 0);
  objc_storeStrong((id *)&self->_deletionLock, 0);
  objc_storeStrong((id *)&self->_cachedMailboxenLock, 0);
  objc_storeStrong((id *)&self->_junkMailboxUid, 0);
  objc_storeStrong((id *)&self->_archiveMailboxUid, 0);
  objc_storeStrong((id *)&self->_trashMailboxUid, 0);
  objc_storeStrong((id *)&self->_sentMessagesMailboxUid, 0);
  objc_storeStrong((id *)&self->_draftsMailboxUid, 0);
  objc_storeStrong((id *)&self->_inboxMailboxUid, 0);
  objc_storeStrong((id *)&self->_rootMailboxUid, 0);
  objc_storeStrong((id *)&self->_nonPersistentPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)deleteMailbox:(_QWORD *)a3 reflectToServer:(NSObject *)a4 .cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a4, (uint64_t)a3, "No URL for mailbox %{public}@", a2);

  OUTLINED_FUNCTION_1();
}

+ (void)mailboxUidFromActiveAccountsForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_DEBUG, "Mailbox UID from account: cache miss. ('%@')", (uint8_t *)&v2, 0xCu);
}

- (void)didFinishActionForChokePoint:(NSObject *)a1 coalescePoint:(uint64_t *)a2 withResult:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *a2;
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a3;
    _os_log_impl(&dword_1A4F90000, a1, OS_LOG_TYPE_DEFAULT, "#Warning <rdar://problem/17733540> _currentChokedActions: %@\nmailboxDict: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_writeMailboxCacheWithPrejudice:completionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1A4F90000, v0, OS_LOG_TYPE_ERROR, "Error writing custom info to mailbox cache. Not saving the mailbox cache to file.", v1, 2u);
  OUTLINED_FUNCTION_9();
}

@end
