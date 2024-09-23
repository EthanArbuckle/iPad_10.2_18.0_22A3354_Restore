@implementation DAMailAccount

+ (Class)_accountConduitClass
{
  return (Class)objc_opt_class();
}

+ (id)accountTypeString
{
  return CFSTR("ExchangeActiveSync");
}

+ (id)legacyPathForAccountIdentifier:(id)a3 withHostname:(id)a4 username:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "defaultAccountDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "accountTypeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mf_betterStringByResolvingSymlinksInPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)URLStringFromLegacyURLString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHost:", v5);

  objc_msgSend(v4, "setUser:", 0);
  objc_msgSend(v4, "setPort:", 0);
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)csAccountTypeString
{
  return (id)*MEMORY[0x1E0CA5CE8];
}

+ (id)displayedAccountTypeString
{
  return CFSTR("Exchange ActiveSync");
}

+ (id)displayedShortAccountTypeString
{
  return CFSTR("Exchange");
}

+ (id)_URLScheme
{
  return (id)*MEMORY[0x1E0D1DB58];
}

+ (id)accountIDForDirectoryName:(id)a3 isAccountDirectory:(BOOL *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "accountTypeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasPrefix:", v7) & 1) == 0)
  {

    goto LABEL_5;
  }
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(a1, "accountTypeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v8 <= v10)
  {
LABEL_5:
    v12 = 0;
    *a4 = 0;
    goto LABEL_6;
  }
  *a4 = 1;
  objc_msgSend(a1, "accountTypeString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v11, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v12;
}

- (DAMailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6;
  id v7;
  DAMailAccount *v8;
  NSLock *v9;
  NSLock *watchedFolderIdsLock;
  NSMutableDictionary *v11;
  NSMutableDictionary *requestQueuesByFolderID;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DAMailAccount;
  v8 = -[MailAccount initWithLibrary:persistentAccount:](&v17, sel_initWithLibrary_persistentAccount_, v6, v7);
  if (v8)
  {
    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    watchedFolderIdsLock = v8->_watchedFolderIdsLock;
    v8->_watchedFolderIdsLock = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestQueuesByFolderID = v8->_requestQueuesByFolderID;
    v8->_requestQueuesByFolderID = v11;

    v8->_supportsUniqueServerIdLock._os_unfair_lock_opaque = 0;
    MFUserAgent();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isMobileMail");

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addNetworkReachableObserver:selector:", v8, sel__reachabilityChanged_);
      v8->_isNetworkReachable = objc_msgSend(v15, "isNetworkReachable");

    }
  }

  return v8;
}

- (DAMailAccount)initWithDAAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DAMailAccount *v10;
  DAMailAccount *v11;
  objc_super v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MFMailDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)DAMailAccount;
  v10 = -[MailAccount initWithPath:](&v13, sel_initWithPath_, v9);
  v11 = v10;
  if (v10)
    -[DAMailAccount setDAAccount:](v10, "setDAAccount:", v4);

  return v11;
}

- (id)statisticsKind
{
  id *v2;

  if (self->_cachedIsHotmailAccount)
    v2 = (id *)MEMORY[0x1E0D46C28];
  else
    v2 = (id *)MEMORY[0x1E0D46C18];
  return *v2;
}

- (void)foldersContentsChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  DAMailAccount *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  if (-[DAMailAccount isActive](self, "isActive"))
  {
    if (!v20
      || (objc_msgSend(v20, "object"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqualToString:", self->_cachedAccountID),
          v4,
          v5))
    {
      objc_msgSend(v20, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("DAChangedFolders"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("MailAccountContentsDidChangeUids"), 0, 0);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v20, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("DAChangedFolders"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v10);
              v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
              -[DAMailAccount mailboxForFolderID:](self, "mailboxForFolderID:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend(v8, "addObject:", v15);
              }
              else
              {
                MFLogGeneral();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v26 = self;
                  v27 = 2114;
                  v28 = v14;
                  _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "#Warning warning, %@ got ping for folder ID %{public}@, but can't find mailboxUid with that ID.", buf, 0x16u);
                }

              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v11);
        }

        v17 = (void *)v19;
      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("MailAccountContentsDidChange"), self, v17);

    }
  }

}

- (id)displayName
{
  objc_super v4;

  if (-[NSString length](self->_cachedDisplayName, "length"))
    return self->_cachedDisplayName;
  v4.receiver = self;
  v4.super_class = (Class)DAMailAccount;
  -[MailAccount displayName](&v4, sel_displayName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accountForRenewingCredentials
{
  DAAccount *v3;
  void *v4;

  -[DAMailAccount mf_lock](self, "mf_lock");
  v3 = self->_daAccount;
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  -[DAAccount backingAccountInfo](v3, "backingAccountInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)username
{
  NSString *v3;
  uint64_t v4;
  void *v5;

  -[DAMailAccount mf_lock](self, "mf_lock");
  v3 = self->_cachedEmailAddress;
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  v4 = -[NSString rangeOfString:](v3, "rangeOfString:", CFSTR("@"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSString substringWithRange:](v3, "substringWithRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)hostname
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  -[DAMailAccount mf_lock](self, "mf_lock");
  v3 = self->_cachedEmailAddress;
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  v5 = -[NSString rangeOfString:](v3, "rangeOfString:", CFSTR("@"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = &stru_1E4F1C8F8;
  }
  else
  {
    -[NSString substringWithRange:](v3, "substringWithRange:", v5 + v4, -[NSString length](v3, "length") - (v5 + v4));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)deliveryAccount
{
  return -[DADeliveryAccount initWithDAMailAccount:]([DADeliveryAccount alloc], "initWithDAMailAccount:", self);
}

- (BOOL)mustArchiveSentMessages
{
  return 0;
}

- (BOOL)canArchiveSentMessages
{
  return 0;
}

- (id)uniqueID
{
  return self->_cachedAccountID;
}

- (id)uniqueIdForPersistentConnection
{
  return self->_cachedAccountPersistentUUID;
}

- (id)allMailboxUids
{
  void *v2;
  objc_super v4;

  if (self->_accountConduit)
  {
    v4.receiver = self;
    v4.super_class = (Class)DAMailAccount;
    -[MailAccount allMailboxUids](&v4, sel_allMailboxUids);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)resetSpecialMailboxes
{
  objc_super v2;

  if (self->_accountConduit)
  {
    v2.receiver = self;
    v2.super_class = (Class)DAMailAccount;
    -[MailAccount resetSpecialMailboxes](&v2, sel_resetSpecialMailboxes);
  }
}

- (MFMailboxUid)virtualAllSearchMailbox
{
  MFMailboxUid *virtualAllSearchMailbox;
  void *v4;
  MFDAMailbox *v5;
  MFMailboxUid *v6;
  MFMailboxUid *v7;
  void *v8;

  virtualAllSearchMailbox = self->_virtualAllSearchMailbox;
  if (!virtualAllSearchMailbox)
  {
    MFLookupLocalizedString(CFSTR("SEARCH_ALL_MAILBOXES"), CFSTR("Search"), CFSTR("Delayed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MFDAMailbox initWithName:attributes:account:folderID:]([MFDAMailbox alloc], "initWithName:attributes:account:folderID:", v4, 0, self, CFSTR("kDAMailAccountAllMailboxesFolderID"));
    v6 = self->_virtualAllSearchMailbox;
    self->_virtualAllSearchMailbox = &v5->super;

    v7 = self->_virtualAllSearchMailbox;
    -[MailAccount rootMailbox](self, "rootMailbox");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailboxUid setParent:](v7, "setParent:", v8);

    virtualAllSearchMailbox = self->_virtualAllSearchMailbox;
  }
  return virtualAllSearchMailbox;
}

- (int)emptyFrequencyForMailboxType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 3)
    return -1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)DAMailAccount;
  return -[MailAccount emptyFrequencyForMailboxType:](&v6, sel_emptyFrequencyForMailboxType_);
}

- (BOOL)isRunningInDisallowedBundle
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E4F68EC0, "containsObject:", v3);

  return v4;
}

- (void)_loadChildrenForParent:(id)a3 fromMap:(id)a4 intoArray:(id)a5 replacingInbox:(id)a6 withID:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  id v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v27 = a5;
  v13 = a6;
  v29 = v12;
  v30 = a7;
  v23 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v12, "objectForKey:", v11);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v25 = *(_QWORD *)v32;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v16, "folderID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[DAMailAccount _loadChildrenForParent:fromMap:intoArray:replacingInbox:withID:](self, "_loadChildrenForParent:fromMap:intoArray:replacingInbox:withID:", v18, v29, v17, v13, v30);

        objc_msgSend(v16, "folderName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqual:", v16))
        {
          v20 = v30;

          v19 = v20;
        }
        v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v21, "setValue:forKey:", v19, CFSTR("MailboxName"));
        objc_msgSend(v21, "setValue:forKey:", v17, CFSTR("MailboxChildren"));
        objc_msgSend(v21, "setValue:forKey:", v28, CFSTR("MailboxAttributes"));
        objc_msgSend(v16, "folderID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v22, CFSTR("DAFolderID"));

        objc_msgSend(v27, "addObject:", v21);
        ++v15;
      }
      while (v14 != v15);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

}

- (void)accountHierarchyChanged:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  int v25;
  uint64_t j;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  int receivedInitialMailboxUpdate;
  BOOL v43;
  $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  char v52;
  DAMailAccount *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id obj;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[DAMailAccount isRunningInDisallowedBundle](self, "isRunningInDisallowedBundle"))
    goto LABEL_103;
  if (!-[DAMailAccount isActive](self, "isActive"))
    goto LABEL_103;
  if (v5)
  {
    objc_msgSend(v5, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", self->_cachedAccountID);

    if ((v7 & 1) == 0)
      goto LABEL_103;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMainThread"))
  {
    v9 = -[DAMailAccount _isUnitTesting](self, "_isUnitTesting");

    if (!v9)
    {
      +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSInvocation mf_invocationWithSelector:target:object:](MFMonitoredInvocation, "mf_invocationWithSelector:target:object:", a2, self, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addInvocation:", v11);

      goto LABEL_103;
    }
  }
  else
  {

  }
  v47 = v5;
  MFLogGeneral();
  v12 = objc_claimAutoreleasedReturnValue();
  v53 = self;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[MFAccount ef_publicDescription](self, "ef_publicDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v75 = v13;
    _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "mailbox listing has changed for account %{public}@", buf, 0xCu);

  }
  -[DAMailAccount accountConduit](self, "accountConduit");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "mailboxes");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v49, "count"));
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v49;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v69 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v17, "folderID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setObject:forKey:", v17, v18);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v14);
  }

  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v48, "inboxFolder");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sentItemsFolder");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "deletedItemsFolder");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "draftsFolder");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v61, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  if (!v20)
  {
    v52 = 0;
    v25 = 0;
    v51 = 0;
    goto LABEL_61;
  }
  v52 = 0;
  LOBYTE(v25) = 0;
  v51 = 0;
  v60 = *(_QWORD *)v65;
  v58 = v19;
  do
  {
    v62 = v20;
    for (j = 0; j != v62; ++j)
    {
      if (*(_QWORD *)v65 != v60)
        objc_enumerationMutation(v58);
      v27 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
      if ((v21 & 1) != 0)
      {
        v21 = 1;
        if ((v22 & 1) != 0)
          goto LABEL_25;
      }
      else
      {
        v21 = objc_msgSend(v57, "isEqual:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
        if ((v22 & 1) != 0)
        {
LABEL_25:
          v22 = 1;
          if ((v23 & 1) != 0)
            goto LABEL_26;
          goto LABEL_30;
        }
      }
      v22 = objc_msgSend(v54, "isEqual:", v27);
      if ((v23 & 1) != 0)
      {
LABEL_26:
        v23 = 1;
        if ((v25 & 1) != 0)
          goto LABEL_33;
        goto LABEL_31;
      }
LABEL_30:
      v23 = objc_msgSend(v55, "isEqual:", v27);
      if ((v25 & 1) != 0)
        goto LABEL_33;
LABEL_31:
      if (objc_msgSend(v56, "isEqual:", v27))
      {
        if (!-[DAMailAccount supportsServerDrafts](v53, "supportsServerDrafts"))
        {
          v25 = 0;
          continue;
        }
LABEL_33:
        v25 = 1;
        goto LABEL_35;
      }
      v25 = 0;
LABEL_35:
      objc_msgSend(v27, "parentFolderID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v27, "parentFolderID");
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = CFSTR("0");
      }

      objc_msgSend(v63, "objectForKey:", v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v63, "setValue:forKey:", v30, v29);
      }
      objc_msgSend(v30, "addObject:", v27);
      if (!v24)
      {
        if (!objc_msgSend(CFSTR("0"), "isEqualToString:", v29))
        {
          v24 = 0;
          goto LABEL_56;
        }
        objc_msgSend(v27, "folderName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          v33 = objc_msgSend(v31, "caseInsensitiveCompare:", CFSTR("junk"));
          v24 = v33 == 0;
          if (v33)
          {
            if ((v52 & 1) != 0)
            {
              v24 = 0;
              v52 = 1;
LABEL_55:

              goto LABEL_56;
            }
            if (objc_msgSend(v32, "caseInsensitiveCompare:", CFSTR("junk e-mail"))
              && objc_msgSend(v32, "caseInsensitiveCompare:", CFSTR("junk email")))
            {
              v24 = 0;
              v52 = 0;
              goto LABEL_55;
            }
            v52 = 1;
          }
          v34 = v27;

          v51 = v34;
          goto LABEL_55;
        }
        v24 = 0;
        goto LABEL_55;
      }
      v24 = 1;
LABEL_56:

    }
    v19 = v58;
    v20 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  }
  while (v20);
LABEL_61:

  -[DAMailAccount _loadChildrenForParent:fromMap:intoArray:replacingInbox:withID:](v53, "_loadChildrenForParent:fromMap:intoArray:replacingInbox:withID:", CFSTR("0"), v63, v50, v57, CFSTR("70FB9178-576E-4CAA-A08E-F68D57BFD01E"));
  -[DAMailAccount mf_lock](v53, "mf_lock");
  if (v21)
  {
    objc_msgSend(v57, "folderID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedInboxFolderID, v35);
  if (v21)

  if (v22)
  {
    objc_msgSend(v54, "folderID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedSentMessagesFolderID, v36);
  if (v22)

  if (v23)
  {
    objc_msgSend(v55, "folderID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedTrashFolderID, v37);
  if (v23)

  if (((v24 | v52) & 1) != 0)
  {
    objc_msgSend(v51, "folderID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedJunkFolderID, v38);
  if (((v24 | v52) & 1) != 0)

  if (v25)
  {
    objc_msgSend(v56, "folderID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedDraftsFolderID, v39);
  if (v25)

  -[MailAccount rootMailbox](v53, "rootMailbox");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[MailAccount _loadMailboxListingIntoCache:attributes:children:parent:](v53, "_loadMailboxListingIntoCache:attributes:children:parent:", 0, 0, v50, v40);

  receivedInitialMailboxUpdate = v53->_receivedInitialMailboxUpdate;
  v43 = v47 == 0;
  if (v53->_receivedInitialMailboxUpdate)
    v43 = 1;
  if (!v43)
  {
    receivedInitialMailboxUpdate = 1;
    v53->_receivedInitialMailboxUpdate = 1;
  }
  if (v53->_doneInitialInboxCheck || receivedInitialMailboxUpdate == 0)
    v21 = 0;
  if (v21 == 1)
    v53->_doneInitialInboxCheck = 1;
  -[DAMailAccount mf_unlock](v53, "mf_unlock");
  -[DAMailAccount resetSpecialMailboxes](v53, "resetSpecialMailboxes");
  if (v41)
  {
    flags = v53->super._flags;
    if ((*(_DWORD *)&flags & 0x20000) == 0)
    {
      v53->super._flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
      -[MailAccount _writeMailboxCacheWithPrejudice:](v53, "_writeMailboxCacheWithPrejudice:", 1);
    }
  }
  -[DAMailAccount startListeningForNotifications](v53, "startListeningForNotifications");
  if (v21)
    -[DAMailAccount foldersContentsChanged:](v53, "foldersContentsChanged:", 0);
  v46 = -[MailAccount mailboxUidOfType:createIfNeeded:](v53, "mailboxUidOfType:createIfNeeded:", 5, 0);

  v5 = v47;
LABEL_103:

}

- (id)accountConduit
{
  ASAccountActorMessages *v4;
  ASAccountActorMessages *accountConduit;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  -[DAMailAccount mf_lock](self, "mf_lock");
  if (!self->_accountConduit)
  {
    if (-[DAMailAccount isRunningInDisallowedBundle](self, "isRunningInDisallowedBundle"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAMailAccount.m"), 595, CFSTR("should never make account conduits in %@."), v11);

    }
    v4 = (ASAccountActorMessages *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_accountConduitClass")), "initWithDAAccount:", self->_daAccount);
    accountConduit = self->_accountConduit;
    self->_accountConduit = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_foldersContentsChanged_, *MEMORY[0x1E0D1C200], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_accountHierarchyChanged_, *MEMORY[0x1E0D1C208], 0);

  }
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  return self->_accountConduit;
}

- (void)pushedFoldersPrefsChanged:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainThread");

  if (v6)
  {
    +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSInvocation mf_invocationWithSelector:target:object:](MFMonitoredInvocation, "mf_invocationWithSelector:target:object:", a2, self, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addInvocation:", v8);

  }
  else
  {
    -[DAMailAccount stopListeningForNotifications](self, "stopListeningForNotifications");
    -[DAMailAccount startListeningForNotifications](self, "startListeningForNotifications");
  }

}

- (BOOL)finishedInitialMailboxListLoad
{
  return self->_receivedInitialMailboxUpdate;
}

- (void)fetchMailboxList
{
  void *v3;
  void *v4;
  id v5;

  if (+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    if (!self->_loadedInitialMailboxList)
    {
      self->_loadedInitialMailboxList = 1;
      -[DAMailAccount accountHierarchyChanged:](self, "accountHierarchyChanged:", 0);
    }
    -[DAMailAccount uniqueID](self, "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v5 = v3;
      objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateFolderListForAccountID:andDataclasses:", v5, 1);

      v3 = v5;
    }

  }
}

- (BOOL)canReceiveNewMailNotifications
{
  return 1;
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 dictionary:(id)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a4;
  objc_msgSend(a6, "objectForKey:", CFSTR("DAFolderID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_allocWithZone((Class)MFDAMailbox), "initWithName:attributes:account:folderID:", v9, a5, self, v10);

  return v11;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[DAMailAccount _ensureWeHaveLoadedInitialMailboxList](self, "_ensureWeHaveLoadedInitialMailboxList");
  v21.receiver = self;
  v21.super_class = (Class)DAMailAccount;
  v16 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](&v21, sel__copyMailboxUidWithParent_name_attributes_existingMailboxUid_dictionary_, v12, v13, a5, v14, v15);
  objc_msgSend(v15, "objectForKey:", CFSTR("DAFolderID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "folderID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v14 && v18)
  {
    if ((objc_msgSend(v18, "isEqualToString:", v17) & 1) == 0)
    {

      v16 = 0;
    }
  }
  else if (!v18 && v17)
  {
    objc_msgSend(v16, "setFolderID:", v17);
  }

  return v16;
}

- (id)folderIDForMailbox:(id)a3
{
  id v4;
  id v5;
  __CFString *v6;

  v4 = a3;
  -[MailAccount rootMailbox](self, "rootMailbox");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = CFSTR("0");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "folderID");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_synchronouslyLoadListingForParent:(id)a3
{
  -[DAMailAccount accountHierarchyChanged:](self, "accountHierarchyChanged:", 0);
}

- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  SEL v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  objc_super v33;

  v9 = *(_QWORD *)&a5;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (a7 == 1)
  {
    v33.receiver = self;
    v33.super_class = (Class)DAMailAccount;
    v16 = -[MailAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:](&v33, sel__newMailboxWithParent_name_attributes_dictionary_withCreationOption_, v13, v14, v9, v15, 1);
  }
  else
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1;
    v31 = __Block_byref_object_dispose__1;
    v32 = 0;
    -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1C420]), "initFolderChangeWithChangeType:folderId:parentFolderId:displayName:dataclass:consumer:", 0, 0, v17, v14, 1, 0);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__DAMailAccount__newMailboxWithParent_name_attributes_dictionary_withCreationOption___block_invoke;
    v20[3] = &unk_1E4E88CE0;
    v24 = a2;
    v20[4] = self;
    v21 = v15;
    v23 = &v27;
    v26 = v9;
    v22 = v13;
    v25 = a7;
    -[DAMailAccount _performFolderChange:completion:](self, "_performFolderChange:completion:", v18, v20);
    v16 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }

  return v16;
}

void __85__DAMailAccount__newMailboxWithParent_name_attributes_dictionary_withCreationOption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  v3 = a2;
  if (objc_msgSend(v3, "wasSuccessful"))
  {
    objc_msgSend(v3, "folderID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("DAMailAccount.m"), 696, CFSTR("folderID must be non-nil"));

    }
    v5 = *(void **)(a1 + 40);
    if (v5)
      v6 = (id)objc_msgSend(v5, "mutableCopy");
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v6;
    objc_msgSend(v3, "folderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("DAFolderID"));

    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "folderName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(unsigned int *)(a1 + 80);
    v13 = *(_QWORD *)(a1 + 72);
    v18.receiver = v9;
    v18.super_class = (Class)DAMailAccount;
    v14 = objc_msgSendSuper2(&v18, sel__newMailboxWithParent_name_attributes_dictionary_withCreationOption_, v10, v11, v12, v7, v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  _QWORD v21[4];
  id v22;
  id v23;
  DAMailAccount *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(v8, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_alloc(MEMORY[0x1E0D1C420]);
  -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initFolderChangeWithChangeType:folderId:parentFolderId:displayName:dataclass:consumer:", 1, v15, v11, v13, 1, 0);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__DAMailAccount_renameMailbox_newName_parent___block_invoke;
  v21[3] = &unk_1E4E88D08;
  v25 = &v26;
  v17 = v8;
  v22 = v17;
  v18 = v10;
  v23 = v18;
  v24 = self;
  -[DAMailAccount _performFolderChange:completion:](self, "_performFolderChange:completion:", v16, v21);
  v19 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v19;
}

void __46__DAMailAccount_renameMailbox_newName_parent___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a2;
  if (objc_msgSend(v3, "wasSuccessful"))
  {
    v4 = (void *)a1[6];
    v5 = a1[4];
    objc_msgSend(v3, "folderName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v8.receiver = v4;
    v8.super_class = (Class)DAMailAccount;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSendSuper2(&v8, sel__renameMailbox_newName_parent_, v5, v6, v7);

  }
}

- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v7 = objc_alloc(MEMORY[0x1E0D1C420]);
    -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initFolderChangeWithChangeType:folderId:parentFolderId:displayName:dataclass:consumer:", 2, v8, 0, 0, 1, 0);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__DAMailAccount__deleteMailbox_reflectToServer___block_invoke;
    v12[3] = &unk_1E4E88D30;
    v12[4] = &v13;
    -[DAMailAccount _performFolderChange:completion:](self, "_performFolderChange:completion:", v9, v12);
    v10 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

void __48__DAMailAccount__deleteMailbox_reflectToServer___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "wasSuccessful");

}

- (void)_performFolderChange:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  MFDAFolderChangeConsumer *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_alloc_init(MFDAFolderChangeConsumer);
  objc_msgSend(v10, "setConsumer:", v7);
  -[DAMailAccount accountConduit](self, "accountConduit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performFolderChange:isUserRequested:", v10, 1);

  -[MFDAFolderChangeConsumer waitForResult](v7, "waitForResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);

}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAMailAccount;
  if (-[MailAccount newMailboxNameIsAcceptable:reasonForFailure:](&v14, sel_newMailboxNameIsAcceptable_reasonForFailure_, v6, a4))
  {
    if (self->_cachedIsHotmailAccount)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("&<>:;/()+'\"\\"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v7);
      v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "substringWithRange:", v8, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4)
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          MFLookupLocalizedString(CFSTR("MAILBOX_NAME_INCLUDES_SPECIAL_CHARACTERS"), CFSTR("This account does not allow mailbox names containing “%@”."), CFSTR("Delayed"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", v12, v10);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_URLScheme
{
  return (id)objc_msgSend((id)objc_opt_class(), "_URLScheme");
}

- (id)mailboxPathExtension
{
  return CFSTR("mbox");
}

- (void)setDAAccount:(id)a3
{
  ASAccountActorMessages *accountConduit;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSString *v21;
  NSString *cachedAccountID;
  NSString *v23;
  NSString *cachedAccountPersistentUUID;
  NSString *v25;
  NSString *cachedDisplayName;
  NSString *v27;
  NSString *cachedEmailAddress;
  NSArray *v29;
  NSArray *cachedEmailAddresses;
  id v31;

  v31 = a3;
  -[DAMailAccount mf_lock](self, "mf_lock");
  accountConduit = self->_accountConduit;
  if (accountConduit)
    -[ASAccountActorMessages setAccount:](accountConduit, "setAccount:", v31);
  else
    objc_storeStrong((id *)&self->_daAccount, a3);
  objc_msgSend(v31, "accountPropertyForKey:", CFSTR("mcProfileUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedIsManaged = objc_msgSend(v6, "length") != 0;

  objc_msgSend(v31, "backingAccountInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedIsManaged = +[MFAccount accountIsManaged:](MFAccount, "accountIsManaged:", v7);

  objc_msgSend(v31, "backingAccountInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedSourceIsManaged = +[MFAccount accountSourceIsManaged:](MFAccount, "accountSourceIsManaged:", v8);

  objc_msgSend(v31, "backingAccountInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedRestrictSendingFromExternalProcesses = +[MFAccount accountIsPreventedFromSendingFromExternalProcesses:](MailAccount, "accountIsPreventedFromSendingFromExternalProcesses:", v9);

  objc_msgSend(v31, "backingAccountInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedRestrictMessageTransfersToOtherAccounts = +[MFAccount accountIsRestrictedFromTransfersToOtherAccounts:](MailAccount, "accountIsRestrictedFromTransfersToOtherAccounts:", v10);

  objc_msgSend(v31, "backingAccountInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedRestrictSyncingRecents = +[MFAccount accountRestrictsRecentsSyncing:](MailAccount, "accountRestrictsRecentsSyncing:", v11);

  objc_msgSend(v31, "accountPropertyForKey:", CFSTR("SMIMESigningEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedSecureMIMEShouldSign = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v31, "accountPropertyForKey:", CFSTR("SMIMEEncryptionEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedSecureMIMEShouldEncrypt = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v31, "encryptionIdentityPersistentReference");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (self->_cachedIsManaged)
      v15 = objc_msgSend(v31, "accountBoolPropertyForKey:", CFSTR("PerMessageSMIMEEnabled"));
    else
      v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  self->_cachedPerMessageEncryptionEnabled = v15;
  objc_msgSend(v31, "accountPropertyForKey:", CFSTR("MFAccountSupportsMailDrop"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedSupportsMailDrop = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v31, "accountPropertyForKey:", CFSTR("ArchiveMessages"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedArchiveByDefault = objc_msgSend(v17, "BOOLValue");

  self->_cachedIsHotmailAccount = objc_msgSend(v31, "isHotmailAccount");
  self->_supportsServerDrafts = 0;
  objc_msgSend(v31, "accountPropertyForKey:", CFSTR("ASStoreDraftsOnServer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = objc_msgSend(v18, "BOOLValue");
  else
    v20 = 1;
  self->_cachedStoreDraftsOnServer = v20;
  objc_msgSend(v31, "accountID");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  cachedAccountID = self->_cachedAccountID;
  self->_cachedAccountID = v21;

  objc_msgSend(v31, "persistentUUID");
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  cachedAccountPersistentUUID = self->_cachedAccountPersistentUUID;
  self->_cachedAccountPersistentUUID = v23;

  self->_cachedIsActive = objc_msgSend(v31, "enabledForDADataclass:", 1);
  objc_msgSend(v31, "accountDescription");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  cachedDisplayName = self->_cachedDisplayName;
  self->_cachedDisplayName = v25;

  objc_msgSend(v31, "emailAddress");
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  cachedEmailAddress = self->_cachedEmailAddress;
  self->_cachedEmailAddress = v27;

  objc_msgSend(v31, "emailAddresses");
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cachedEmailAddresses = self->_cachedEmailAddresses;
  self->_cachedEmailAddresses = v29;

  if (self->_cachedCalendarEnabled != objc_msgSend(v31, "enabledForDADataclass:", 4))
    self->_cachedCalendarEnabled = objc_msgSend(v31, "enabledForDADataclass:", 4);
  self->_supportsServerSearch = objc_msgSend(v31, "supportsMailboxSearch");
  self->_supportsMessageFlagging = objc_msgSend(v31, "supportsEmailFlagging");
  self->_daysToSync = objc_msgSend(v31, "mailNumberOfPastDaysToSync");
  -[DAMailAccount mf_unlock](self, "mf_unlock");

}

- (id)syncAnchorForMailbox:(id)a3
{
  return 0;
}

- (BOOL)supportsRemoteAppend
{
  return 1;
}

- (BOOL)supportsMailboxEditing
{
  return 1;
}

- (id)_infoForMatchingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self, CFSTR("Account"));
  objc_msgSend(v4, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 3)
  {
    objc_msgSend(v4, "pathComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeObjectsInRange:", 0, 2);
    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("FolderID"));

  }
  return v5;
}

- (id)mailboxForFolderID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DAMailAccount mf_lock](self, "mf_lock");
  -[MailAccount rootMailbox](self, "rootMailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  if (v5)
  {
    _MFDescendantWithPredicate(v5, (uint64_t (*)(void *, uint64_t))mailboxHasFolderID, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mailboxUidForInfo:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("FolderID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailAccount mailboxForFolderID:](self, "mailboxForFolderID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)addRequest:(id)a3 consumer:(id)a4 mailbox:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[DAMailAccount addRequests:mailbox:](self, "addRequests:mailbox:", v12, v10);

  return (char)self;
}

- (BOOL)addRequests:(id)a3 mailbox:(id)a4
{
  return -[DAMailAccount addRequests:mailbox:combine:](self, "addRequests:mailbox:combine:", a3, a4, 0);
}

- (BOOL)addRequests:(id)a3 mailbox:(id)a4 combine:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  MFDARequestQueue *v12;
  BOOL v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_INFO, "Enqueing request pairs %@ for mailbox %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v9, "folderID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailAccount mf_lock](self, "mf_lock");
  -[NSMutableDictionary objectForKey:](self->_requestQueuesByFolderID, "objectForKey:", v11);
  v12 = (MFDARequestQueue *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[MFDARequestQueue initWithAccount:folderID:]([MFDARequestQueue alloc], "initWithAccount:folderID:", self, v11);
    -[NSMutableDictionary setObject:forKey:](self->_requestQueuesByFolderID, "setObject:forKey:");
  }
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  v13 = -[MFRequestQueue addRequests:combine:](v12, "addRequests:combine:", v8, v5);

  return v13;
}

- (BOOL)performRequests:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  MFDAMailAccountSyncConsumer *v17;
  void *v18;
  MFDAMailAccountSyncConsumer *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  BOOL v38;
  BOOL v39;
  void *v40;
  id v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  int v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  id v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v6 = a4;
  v56 = 0;
  -[DAMailAccount syncAnchorForFolderID:mailbox:](self, "syncAnchorForFolderID:mailbox:", v6, &v56);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v56;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __41__DAMailAccount_performRequests_mailbox___block_invoke;
  v49[3] = &unk_1E4E88D58;
  v44 = v8;
  v50 = v44;
  v51 = &v52;
  objc_msgSend(v42, "enumerateObjectsUsingBlock:", v49);
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v44, "count");
    -[MFAccount ef_publicDescription](self, "ef_publicDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (*((_BYTE *)v53 + 24))
      v13 = "YES";
    else
      v13 = "NO";
    *(_DWORD *)buf = 134219010;
    v58 = v10;
    v59 = 2114;
    v60 = v11;
    v61 = 2114;
    v62 = v6;
    v63 = 2112;
    v64 = v43;
    v65 = 2080;
    v66 = v13;
    _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "Performing %lu mailbox requests with %{public}@, folder-id %{public}@, anchor %@, user requested %s", buf, 0x34u);

  }
  MFUserAgent();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "networkActivityStarted:", self);

  if (!v43)
  {
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[MFAccount ef_publicDescription](self, "ef_publicDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = (uint64_t)v16;
      v59 = 2114;
      v60 = (uint64_t)v6;
      _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "Mail db had no sync anchor for %{public}@, folderID %{public}@.  Will erase local messages, perform full sync.", buf, 0x16u);

    }
  }
  v17 = [MFDAMailAccountSyncConsumer alloc];
  -[DAMailAccount uniqueID](self, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MFDAMailAccountSyncConsumer initWithCurrentTag:accountID:requests:](v17, "initWithCurrentTag:accountID:requests:", v43, v18, v42);

  do
  {
    -[MFDAMailAccountSyncConsumer tag](v19, "tag", v42);

    v20 = (void *)MEMORY[0x1A85B0E24]();
    -[DAMailAccount accountConduit](self, "accountConduit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDAMailAccountSyncConsumer tag](v19, "tag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "performMailboxRequests:mailbox:previousTag:clientWinsOnSyncConflict:isUserRequested:consumer:", v44, v6, v22, 1, *((unsigned __int8 *)v53 + 24), v19);

    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0D1EE90];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __41__DAMailAccount_performRequests_mailbox___block_invoke_128;
    v46[3] = &unk_1E4E88D80;
    v26 = v21;
    v47 = v26;
    v48 = v23;
    objc_msgSend(v25, "tokenWithCancelationBlock:", v46);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addCancelable:", v27);
    -[MFDAMailAccountConsumer waitUntilDone](v19, "waitUntilDone");
    objc_msgSend(v24, "removeCancelable:", v27);

    objc_autoreleasePoolPop(v20);
    -[MFDAMailAccountSyncConsumer tag](v19, "tag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = v28 == 0;

    if ((_DWORD)v24)
    {
      DALoggingwithCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[MFAccount ef_publicDescription](self, "ef_publicDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = (uint64_t)v30;
        v59 = 2114;
        v60 = (uint64_t)v6;
        _os_log_impl(&dword_1A4F90000, v29, OS_LOG_TYPE_DEFAULT, "server returned null sync key for sync of %{public}@, folderID %{public}@.  Will erase local messages, perform full sync.", buf, 0x16u);

      }
    }
    DALoggingwithCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      -[MFDAMailAccountSyncConsumer tag](v19, "tag");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v58 = (uint64_t)v32;
      v59 = 2114;
      v60 = (uint64_t)v6;
      _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_INFO, "setting sync key %@ for mailbox %{public}@", buf, 0x16u);

    }
    -[MFDAMailAccountSyncConsumer tag](v19, "tag");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v7;
    -[DAMailAccount setSyncAnchor:forFolderID:mailbox:](self, "setSyncAnchor:forFolderID:mailbox:", v33, v6, &v45);
    v34 = v45;

    v7 = v34;
    -[MFDAMailAccountSyncConsumer tag](v19, "tag");

    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = objc_msgSend(v35, "shouldCancel");

    if ((_DWORD)v34)
    {
      DALoggingwithCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        -[MFAccount ef_publicDescription](self, "ef_publicDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = (uint64_t)v37;
        v59 = 2114;
        v60 = (uint64_t)v6;
        _os_log_impl(&dword_1A4F90000, v36, OS_LOG_TYPE_INFO, "canceled mailbox request for %{public}@, folderID %{public}@", buf, 0x16u);

      }
      v38 = 0;
    }
    else
    {
      v38 = -[MFDAMailAccountSyncConsumer moreAvailable](v19, "moreAvailable");
    }
    -[MFDAMailAccountSyncConsumer reset](v19, "reset");
  }
  while (v38);
  v39 = -[MFDAMailAccountConsumer shouldRetryRequest](v19, "shouldRetryRequest");
  MFUserAgent();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "networkActivityEnded:", self);

  _Block_object_dispose(&v52, 8);
  return !v39;
}

void __41__DAMailAccount_performRequests_mailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "first");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && objc_msgSend(v3, "isUserRequested"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

uint64_t __41__DAMailAccount_performRequests_mailbox___block_invoke_128(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelTaskWithID:", *(unsigned int *)(a1 + 40));
}

- (id)_relativePathForType:(int64_t)a3
{
  void *v7;

  if (a3 == 2)
    return CFSTR("Archive");
  if (a3 == 1)
    return CFSTR("Junk");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAMailAccount.m"), 1019, CFSTR("requested relative path for unsupported mailbox type %ld"), a3);

  return 0;
}

- (id)_relativePathSpecialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[DAMailAccount _relativePathForType:](self, "_relativePathForType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  MFDAMailbox *v9;
  int64_t v10;
  id v11;
  MFDAMailbox **p_temporaryInbox;
  MFDAMailbox *temporaryInbox;
  void *v14;
  MFDAMailbox *v15;
  NSString *v16;
  NSString *cachedJunkFolderID;

  v4 = a4;
  if (!-[DAMailAccount isMailboxLocalForType:](self, "isMailboxLocalForType:"))
  {
    if (a3 == 2)
    {
      -[DAMailAccount _relativePathSpecialMailboxUidWithType:create:](self, "_relativePathSpecialMailboxUidWithType:create:", 2, v4);
      v9 = (MFDAMailbox *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      goto LABEL_23;
    }
    -[DAMailAccount mf_lock](self, "mf_lock");
    v10 = a3 - 1;
    if ((unint64_t)(a3 - 1) < 7 && ((0x5Du >> v10) & 1) != 0)
    {
      v11 = *(id *)((char *)&self->super.super.super.isa + *off_1E4E88E88[v10]);
      if (v11)
      {
        -[DAMailAccount mailboxForFolderID:](self, "mailboxForFolderID:", v11);
        v9 = (MFDAMailbox *)objc_claimAutoreleasedReturnValue();
        if (v9)
          goto LABEL_22;
      }
    }
    else
    {
      v11 = 0;
    }
    if (-[DAMailAccount isActive](self, "isActive"))
    {
      if (a3 == 1)
      {
        if (v4)
        {
          -[DAMailAccount _relativePathSpecialMailboxUidWithType:create:](self, "_relativePathSpecialMailboxUidWithType:create:", 1, 1);
          v15 = (MFDAMailbox *)objc_claimAutoreleasedReturnValue();
          -[MFDAMailbox folderID](v15, "folderID");
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          cachedJunkFolderID = self->_cachedJunkFolderID;
          self->_cachedJunkFolderID = v16;

          v9 = v15;
LABEL_22:
          -[DAMailAccount mf_unlock](self, "mf_unlock");

          v7 = 0;
          goto LABEL_23;
        }
      }
      else if (a3 == 7)
      {
        p_temporaryInbox = &self->_temporaryInbox;
        temporaryInbox = self->_temporaryInbox;
        if (!temporaryInbox)
        {
          -[DAMailAccount mf_unlock](self, "mf_unlock");
          -[MailAccount mailboxUidForRelativePath:create:withOption:](self, "mailboxUidForRelativePath:create:withOption:", CFSTR("70FB9178-576E-4CAA-A08E-F68D57BFD01E"), 1, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[DAMailAccount mf_lock](self, "mf_lock");
          if (!*p_temporaryInbox)
            objc_storeStrong((id *)&self->_temporaryInbox, v14);

          temporaryInbox = *p_temporaryInbox;
        }
        v9 = temporaryInbox;
        goto LABEL_22;
      }
    }
    v9 = 0;
    goto LABEL_22;
  }
  -[MailAccount _localMailboxNameForType:usingDisplayName:](self, "_localMailboxNameForType:usingDisplayName:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[LocalAccount localAccount](LocalAccount, "localAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxUidForRelativePath:create:", v7, v4);
  v9 = (MFDAMailbox *)objc_claimAutoreleasedReturnValue();

  -[MFMailboxUid setRepresentedAccount:](v9, "setRepresentedAccount:", self);
LABEL_23:

  return v9;
}

- (BOOL)isMailboxLocalForType:(int64_t)a3
{
  if (a3 != 5)
    return 0;
  if (-[DAMailAccount supportsServerDrafts](self, "supportsServerDrafts"))
    return !self->_cachedStoreDraftsOnServer;
  return 1;
}

- (void)_ensureWeHaveLoadedInitialMailboxList
{
  if (!self->_loadedInitialMailboxList)
  {
    self->_loadedInitialMailboxList = 1;
    -[DAMailAccount accountHierarchyChanged:](self, "accountHierarchyChanged:", 0);
  }
}

- (id)primaryMailboxUid
{
  objc_super v4;

  -[DAMailAccount _ensureWeHaveLoadedInitialMailboxList](self, "_ensureWeHaveLoadedInitialMailboxList");
  v4.receiver = self;
  v4.super_class = (Class)DAMailAccount;
  -[MailAccount primaryMailboxUid](&v4, sel_primaryMailboxUid);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)supportsMessageFlagging
{
  return self->_supportsMessageFlagging == 1;
}

- (BOOL)supportsThreadOperations
{
  return self->_supportsConversations == 1;
}

- (BOOL)supportsUniqueServerId
{
  os_unfair_lock_s *p_supportsUniqueServerIdLock;
  int supportsUniqueServerId;
  void *v5;

  p_supportsUniqueServerIdLock = &self->_supportsUniqueServerIdLock;
  os_unfair_lock_lock(&self->_supportsUniqueServerIdLock);
  supportsUniqueServerId = self->_supportsUniqueServerId;
  if (!supportsUniqueServerId)
  {
    -[DAMailAccount accountConduit](self, "accountConduit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    supportsUniqueServerId = objc_msgSend(v5, "supportsUniqueServerId");

    if (supportsUniqueServerId)
      self->_supportsUniqueServerId = supportsUniqueServerId;
  }
  os_unfair_lock_unlock(p_supportsUniqueServerIdLock);
  return supportsUniqueServerId != 2;
}

- (BOOL)supportsServerDrafts
{
  void *v3;

  if (!-[DAMailAccount isRunningInDisallowedBundle](self, "isRunningInDisallowedBundle")
    && !self->_supportsServerDrafts)
  {
    -[DAMailAccount accountConduit](self, "accountConduit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_supportsServerDrafts = objc_msgSend(v3, "supportsDraftFolderSync");

  }
  return self->_supportsServerDrafts == 1;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_cachedArchiveByDefault;
}

- (BOOL)sourceIsManaged
{
  return (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 6) & 1) != 0 || self->_cachedSourceIsManaged;
}

- (BOOL)_isUnitTesting
{
  return 0;
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  return 0;
}

- (id)uniqueServerIdForMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[DAMailAccount supportsUniqueServerId](self, "supportsUniqueServerId"))
  {
    objc_msgSend(v4, "remoteID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isActive
{
  return self->_cachedIsActive;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4;
  NSString *v5;
  NSArray *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DAMailAccount mf_lock](self, "mf_lock");
  v5 = self->_cachedEmailAddress;
  v6 = self->_cachedEmailAddresses;
  v7 = self->_cachedAccountID;
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  if (objc_msgSend(v4, "isEqual:", CFSTR("EmailAddresses")))
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", MEMORY[0x1E0C9AAB0], v5);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      v14 = v8;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (!objc_msgSend(v4, "isEqual:", CFSTR("ReceiveEmailAliasAddresses")))
  {
    v15 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8EF30]);
    if (v7)
      v16 = v15;
    else
      v16 = 0;
    if (v16 == 1)
    {
      v8 = v7;
      goto LABEL_20;
    }
LABEL_19:
    v18.receiver = self;
    v18.super_class = (Class)DAMailAccount;
    -[MFAccount accountPropertyForKey:](&v18, sel_accountPropertyForKey_, v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)-[NSArray mutableCopy](v6, "mutableCopy");
    if (!v5)
      goto LABEL_21;
LABEL_23:
    objc_msgSend(v14, "removeObjectForKey:", v5);
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    v13 = MEMORY[0x1E0C9AAB0];
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v10);
      objc_msgSend(v9, "addObject:", v13);
      if (!--v11)
      {
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (!v11)
          break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjects:forKeys:", v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_23;
LABEL_21:

  return v14;
}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  DAMailAccount *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_INFO, "DAMAilAccount %p is invalidating", buf, 0xCu);
  }

  -[ASAccountActorMessages shutdown](self->_accountConduit, "shutdown");
  v4.receiver = self;
  v4.super_class = (Class)DAMailAccount;
  -[MailAccount invalidate](&v4, sel_invalidate);
}

- (id)iconString
{
  NSString *cachedIconString;
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  NSString *v9;

  cachedIconString = self->_cachedIconString;
  if (!cachedIconString)
  {
    if (self->_cachedIsHotmailAccount)
    {
      v4 = CFSTR("outlookAccountIcon");
    }
    else if (objc_msgSend(MEMORY[0x1E0D1C3E8], "isAppleInternalInstall"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HatesAppleDesign"));

      v4 = CFSTR("exchangeAccountIcon");
      if ((v6 & 1) == 0)
      {
        -[MFAccount baseAccount](self, "baseAccount");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isAppleEmployeeAccount");

        if (v8)
          v4 = CFSTR("appleAccountIcon");
      }
    }
    else
    {
      v4 = CFSTR("exchangeAccountIcon");
    }
    v9 = self->_cachedIconString;
    self->_cachedIconString = &v4->isa;

    cachedIconString = self->_cachedIconString;
  }
  return cachedIconString;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend((id)*MEMORY[0x1E0C8F3D0], "isEqualToString:", v4))
    v5 = -[DAMailAccount isActive](self, "isActive");
  else
    v5 = 0;

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  DAMailAccount *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_INFO, "DAMailAccount %p is deallocating", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNetworkReachableObserver:", self);

  +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", sel_invalidate, self->_temporaryInbox);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addInvocation:", v6);

  -[ASAccountActorMessages shutdown](self->_accountConduit, "shutdown");
  v7.receiver = self;
  v7.super_class = (Class)DAMailAccount;
  -[MailAccount dealloc](&v7, sel_dealloc);
}

- (BOOL)reconstituteOrphanedMeetingInMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "loadMeetingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "messageStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mailbox");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[DAMailAccount accountConduit](self, "accountConduit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "reattemptInvitationLinkageForMetaData:inFolderWithId:", v5, v8);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)unactionableInvitationICSRepresentationInMessage:(id)a3 summary:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "loadMeetingData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "messageStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mailbox");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[DAMailAccount accountConduit](self, "accountConduit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unactionableICSRepresentationForMetaData:inFolderWithId:outSummary:", v7, v10, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)meetingStorePersistentID
{
  if (self->_cachedCalendarEnabled)
    return self->_cachedAccountPersistentUUID;
  else
    return 0;
}

- (id)_inboxFolderID
{
  void *v3;
  void *v4;

  -[DAMailAccount primaryMailboxUid](self, "primaryMailboxUid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_updateWatchedFolderIdsAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSString *v9;
  NSString *folderTag;
  void *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[DAMailAccount accountConduit](self, "accountConduit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v5, "folderIDsThatExternalClientsCareAboutForDataclasses:withTag:", 1, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v9 = (NSString *)objc_msgSend(v7, "copy");
    folderTag = self->_folderTag;
    self->_folderTag = v9;

  }
  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[DAMailAccount _inboxFolderID](self, "_inboxFolderID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "addObject:", v11);
  -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailAccount folderIDForMailbox:](self, "folderIDForMailbox:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v8, "addObject:", v13);
  -[NSLock lock](self->_watchedFolderIdsLock, "lock");
  v14 = self->_watchedFolderIds;
  objc_storeStrong((id *)&self->_watchedFolderIds, v8);
  -[NSLock unlock](self->_watchedFolderIdsLock, "unlock");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("MFMailAccountPushedMailboxUidsDidChange"), self, 0);

  }
  if (!-[NSSet isEqualToSet:](v14, "isEqualToSet:", v8))
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_INFO, "watched folder IDs changed: %@", buf, 0xCu);
    }

  }
  v17 = v8;

  return v17;
}

- (void)startListeningForNotifications
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMaild");

  if ((v4 & 1) != 0)
  {
    +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBatterySaverModeEnabled");

    if (v6)
    {
      MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[MFAccount ef_publicDescription](self, "ef_publicDescription");
        v8 = objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v8;
        _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "account %{public}@ will NOT start listening for notifications: battery-saver mode is ON", (uint8_t *)&v17, 0xCu);

      }
    }
    else
    {
      +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "gameModeEnabled");

      if (v11)
      {
        MFLogGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          -[MFAccount ef_publicDescription](self, "ef_publicDescription");
          v12 = objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v12;
          _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "account %{public}@ will NOT start listening for notifications: Game Mode is ON", (uint8_t *)&v17, 0xCu);

        }
      }
      else
      {
        if (!self->_observingPushedFoldersPrefsChanged)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_pushedFoldersPrefsChanged_, *MEMORY[0x1E0D1C210], 0);

          self->_observingPushedFoldersPrefsChanged = 1;
        }
        -[DAMailAccount _updateWatchedFolderIdsAndNotify:](self, "_updateWatchedFolderIdsAndNotify:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v7 = objc_claimAutoreleasedReturnValue();

        MFLogGeneral();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = 138412290;
          v18 = v7;
          _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_INFO, "Requesting push for folders: %@", (uint8_t *)&v17, 0xCu);
        }

        if (-[NSObject count](v7, "count")
          && -[DAMailAccount canReceiveNewMailNotifications](self, "canReceiveNewMailNotifications"))
        {
          -[DAMailAccount accountConduit](self, "accountConduit");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "monitorFoldersForUpdates:persistent:", v7, 1);

        }
      }
    }
  }
  else
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[MFAccount ef_publicDescription](self, "ef_publicDescription");
      v9 = objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "account %{public}@ will NOT start listening for notifications: Not in maild", (uint8_t *)&v17, 0xCu);

    }
  }

}

- (void)stopListeningForNotifications
{
  id v2;

  -[DAMailAccount accountConduit](self, "accountConduit");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopMonitoringAllFolders");

}

- (id)syncAnchorForFolderID:(id)a3 mailbox:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (a4)
  {
    v7 = *a4;
    if (v7)
      goto LABEL_6;
  }
  -[DAMailAccount mailboxForFolderID:](self, "mailboxForFolderID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  if (a4)
    *a4 = objc_retainAutorelease(v8);
  if (v7)
  {
LABEL_6:
    -[MailAccount library](self, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sequenceIdentifierForMailbox:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setSyncAnchor:(id)a3 forFolderID:(id)a4 mailbox:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = *a5;
    if (v9)
      goto LABEL_6;
  }
  -[DAMailAccount mailboxForFolderID:](self, "mailboxForFolderID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (a5)
    *a5 = objc_retainAutorelease(v10);
  if (v9)
  {
LABEL_6:
    -[MailAccount library](self, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSequenceIdentifier:forMailbox:", v16, v12);

  }
  if (v16 && !self->_supportsServerSearch)
  {
    -[DAMailAccount accountConduit](self, "accountConduit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_supportsServerSearch = objc_msgSend(v13, "supportsMailboxSearch");

  }
  if (v16 && !self->_supportsMessageFlagging)
  {
    -[DAMailAccount accountConduit](self, "accountConduit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_supportsMessageFlagging = objc_msgSend(v14, "supportsEmailFlagging");

  }
  if (v16 && !self->_supportsConversations)
  {
    -[DAMailAccount accountConduit](self, "accountConduit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_supportsConversations = objc_msgSend(v15, "supportsConversations");

  }
  -[DAMailAccount supportsUniqueServerId](self, "supportsUniqueServerId");

}

- (void)performSearchQuery:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DAMailAccount accountConduit](self, "accountConduit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSearchQuery:", v5);

}

- (void)cancelSearchQuery:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DAMailAccount accountConduit](self, "accountConduit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSearchQuery:", v5);

}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 0;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 1;
}

- (int)supportsServerSearch
{
  return self->_supportsServerSearch;
}

- (unsigned)daysToSync
{
  return self->_daysToSync;
}

- (BOOL)supportsUserPushedMailboxes
{
  return 1;
}

- (id)pushedMailboxUids
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[DAMailAccount _watchedFolderIds](self, "_watchedFolderIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[DAMailAccount _updateWatchedFolderIdsAndNotify:](self, "_updateWatchedFolderIdsAndNotify:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v12;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[DAMailAccount mailboxForFolderID:](self, "mailboxForFolderID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        else
        {
          MFLogGeneral();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v8;
            _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "#Warning mailboxForFolderID returned nil (folderId = %@)", buf, 0xCu);
          }

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)_folderIdsForMailboxUids:(id)a3
{
  objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__DAMailAccount__folderIdsForMailboxUids___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v2, "folderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "ef_publicDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Missing folder ID for mailbox: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    goto LABEL_6;
  }
LABEL_7:

  return v3;
}

- (void)changePushedMailboxUidsAdded:(id)a3 deleted:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  -[DAMailAccount _folderIdsForMailboxUids:](self, "_folderIdsForMailboxUids:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  -[DAMailAccount _folderIdsForMailboxUids:](self, "_folderIdsForMailboxUids:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    -[DAMailAccount accountConduit](self, "accountConduit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFolderIdsThatExternalClientsCareAboutAdded:deleted:foldersTag:", v6, v7, self->_folderTag);

  }
}

- (id)_watchedFolderIds
{
  NSSet *v3;

  -[NSLock lock](self->_watchedFolderIdsLock, "lock");
  v3 = self->_watchedFolderIds;
  -[NSLock unlock](self->_watchedFolderIdsLock, "unlock");
  return v3;
}

- (BOOL)canGoOffline
{
  return 1;
}

- (void)_reachabilityChanged:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD v11[5];
  char v12;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CFA2F8]);

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFA300]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__DAMailAccount__reachabilityChanged___block_invoke;
    v11[3] = &unk_1E4E88DF0;
    v11[4] = self;
    v12 = v9;
    dispatch_async(v10, v11);

  }
}

void __38__DAMailAccount__reachabilityChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 256) != *(unsigned __int8 *)(a1 + 40))
  {
    DALoggingwithCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = "reachable";
      if (!*(_BYTE *)(a1 + 40))
        v4 = "unreachable";
      *(_DWORD *)buf = 138412546;
      v9 = v3;
      v10 = 2080;
      v11 = v4;
      _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_INFO, "%@: Network became %s", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = *(_BYTE *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __38__DAMailAccount__reachabilityChanged___block_invoke_164;
      v7[3] = &unk_1E4E88DC8;
      v7[4] = *(_QWORD *)(a1 + 32);
      v6 = (id)objc_msgSend(v5, "afterDelay:performBlock:", v7, 1.0);

    }
  }
}

void __38__DAMailAccount__reachabilityChanged___block_invoke_164(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "replayHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "connectionEstablished");

}

- (id)signingIdentityPersistentReferenceForAddress:(id)a3
{
  void *v3;
  void *v4;

  -[DAMailAccount accountConduit](self, "accountConduit", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signingIdentityPersistentReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[DAMailAccount accountConduit](self, "accountConduit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSigningIdentityPersistentReference:", v6);

}

- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3
{
  void *v3;
  void *v4;

  -[DAMailAccount accountConduit](self, "accountConduit", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encryptionIdentityPersistentReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[DAMailAccount accountConduit](self, "accountConduit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEncryptionIdentityPersistentReference:", v6);

}

- (BOOL)perMessageEncryptionEnabledForAddress:(id)a3
{
  BOOL cachedPerMessageEncryptionEnabled;

  -[DAMailAccount mf_lock](self, "mf_lock", a3);
  cachedPerMessageEncryptionEnabled = self->_cachedPerMessageEncryptionEnabled;
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  return cachedPerMessageEncryptionEnabled;
}

- (int64_t)secureCompositionSigningPolicyForAddress:(id)a3
{
  int64_t cachedSecureMIMEShouldSign;

  -[DAMailAccount mf_lock](self, "mf_lock", a3);
  cachedSecureMIMEShouldSign = self->_cachedSecureMIMEShouldSign;
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  return cachedSecureMIMEShouldSign;
}

- (int64_t)secureCompositionEncryptionPolicyForAddress:(id)a3
{
  int64_t cachedSecureMIMEShouldEncrypt;

  -[DAMailAccount mf_lock](self, "mf_lock", a3);
  cachedSecureMIMEShouldEncrypt = self->_cachedSecureMIMEShouldEncrypt;
  -[DAMailAccount mf_unlock](self, "mf_unlock");
  return cachedSecureMIMEShouldEncrypt;
}

- (id)copyDataForRemoteEncryptionCertificatesForAddresses:(id)a3 errors:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  MFUserAgent();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networkActivityStarted:", self);

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = (id)0xAAAAAAAAAAAAAAAALL;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__DAMailAccount_copyDataForRemoteEncryptionCertificatesForAddresses_errors___block_invoke;
  v11[3] = &unk_1E4E88E18;
  v11[4] = self;
  v11[5] = &v18;
  v11[6] = &v12;
  objc_msgSend(v6, "ef_enumerateObjectsInBatchesOfSize:block:", 80, v11);
  MFUserAgent();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "networkActivityEnded:", self);

  if (a4 && objc_msgSend((id)v13[5], "count"))
    *a4 = objc_retainAutorelease((id)v13[5]);
  v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __76__DAMailAccount_copyDataForRemoteEncryptionCertificatesForAddresses_errors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  _MFDAResolveRecipientsConsumer *v30;
  id v31;
  id obj;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v28;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v41 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v5);
        objc_msgSend(v6, "simpleAddress");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v7, v5);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v2);
  }

  v8 = objc_alloc(MEMORY[0x1E0D1C2D8]);
  objc_msgSend(v35, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v8, "initWithEmailAddresses:", v9);

  v30 = objc_alloc_init(_MFDAResolveRecipientsConsumer);
  objc_msgSend(*(id *)(a1 + 32), "accountConduit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performResolveRecipientsRequest:consumer:", v29, v30);

  -[_MFDAResolveRecipientsConsumer waitForResolvedRecipients](v30, "waitForResolvedRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v34 = v11;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v31 = obj;
    v12 = 0;
    v13 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (!v13)
      goto LABEL_30;
    v14 = *(_QWORD *)v37;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v31);
        v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v15);
        objc_msgSend(v35, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v18)
        {
          v25 = (void *)MEMORY[0x1E0CB3940];
          MFLookupLocalizedString(CFSTR("SMIME_MISSING_REMOTE_ENCRYPTION_CERT_MESSAGE"), CFSTR("An encryption certificate for “%@” could not be found on the server. Without a certificate, you can’t encrypt messages sent to this address."), CFSTR("Delayed"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", v22, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v23);
          v24 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v26 = v12;
          v12 = (void *)v24;
LABEL_23:

          goto LABEL_24;
        }
        v20 = objc_msgSend(v18, "status");
        if (v20 == 2)
        {
          objc_msgSend(v19, "resolvedEmailToX509Certs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "allValues");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "ef_flatten");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v26, v16);
          goto LABEL_23;
        }
        if (v20 == 12 || v20 == 66)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          MFLookupLocalizedString(CFSTR("SMIME_MISSING_REMOTE_ENCRYPTION_CERT_MESSAGE"), CFSTR("An encryption certificate for “%@” could not be found on the server. Without a certificate, you can’t encrypt messages sent to this address."), CFSTR("Delayed"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", v22, v16, v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v23);
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
LABEL_24:
        if (v12)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v16);

        ++v15;
      }
      while (v13 != v15);
      v27 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v13 = v27;
      if (!v27)
      {
LABEL_30:

        v11 = v34;
        break;
      }
    }
  }

}

- (id)copyDataForRemoteEncryptionCertificatesForAddress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _MFDAResolveRecipientsConsumer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MFUserAgent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkActivityStarted:", self);

  v7 = objc_alloc(MEMORY[0x1E0D1C2D8]);
  v39[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v7, "initWithEmailAddresses:", v8);

  v9 = objc_alloc_init(_MFDAResolveRecipientsConsumer);
  -[DAMailAccount accountConduit](self, "accountConduit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performResolveRecipientsRequest:consumer:", v33, v9);

  -[_MFDAResolveRecipientsConsumer waitForResolvedRecipients](v9, "waitForResolvedRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MFUserAgent();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "networkActivityEnded:", self);

  if (!v11)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v11, "objectForKey:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "status");
    if (v15 == 2)
    {
      objc_msgSend(v14, "resolvedEmailToX509Certs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      goto LABEL_9;
    }
    if (v15 != 12 && v15 != 66)
    {
      v16 = 0;
      v17 = 0;
      goto LABEL_10;
    }
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  MFLookupLocalizedString(CFSTR("SMIME_MISSING_REMOTE_ENCRYPTION_CERT_MESSAGE"), CFSTR("An encryption certificate for “%@” could not be found on the server. Without a certificate, you can’t encrypt messages sent to this address."), CFSTR("Delayed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v20);
  v17 = objc_claimAutoreleasedReturnValue();

  v16 = 0;
LABEL_9:

LABEL_10:
LABEL_11:
  if (objc_msgSend(v16, "count"))
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v16;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(v21, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v21, "count"))
      v26 = (unint64_t)v21;
    else
      v26 = 0;

  }
  else
  {
    v26 = 0;
  }
  if (!(v26 | v17))
  {
    -[_MFDAResolveRecipientsConsumer error](v9, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v27, *MEMORY[0x1E0CB3388]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    MFLookupLocalizedString(CFSTR("MIME_GENERIC_REMOTE_ENCRYPTION_CERT_MESSAGE"), CFSTR("An error occurred while retrieving the encryption certificate."), CFSTR("Delayed"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("SMIME_CANT_ENCRYPT_TITLE"), CFSTR("Unable to Encrypt"), CFSTR("Delayed"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v29, v30, v28);
    v17 = objc_claimAutoreleasedReturnValue();

  }
  if (a4 && v17)
    *a4 = objc_retainAutorelease((id)v17);

  return (id)v26;
}

- (BOOL)restrictedFromTransferingMessagesToOtherAccounts
{
  return self->_cachedRestrictMessageTransfersToOtherAccounts;
}

- (BOOL)restrictedFromSendingExternally
{
  return self->_cachedRestrictSendingFromExternalProcesses;
}

- (BOOL)restrictedFromSyncingRecents
{
  return self->_cachedRestrictSyncingRecents;
}

- (BOOL)isManaged
{
  return self->_cachedIsManaged;
}

- (BOOL)supportsMailDrop
{
  return !-[DAMailAccount isManaged](self, "isManaged") || self->_cachedSupportsMailDrop;
}

- (id)fetchLimits
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  MFFetchLimits *v7;

  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFatPipe");
  +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPluggedIn");

  if ((v3 & v5 & 1) != 0)
  {
    v6 = 209715200;
  }
  else if ((objc_msgSend(v2, "isFatPipe") & 1) != 0 || (objc_msgSend(v2, "is4GConnection") & 1) != 0)
  {
    v6 = 0x800000;
  }
  else if (objc_msgSend(v2, "is3GConnection"))
  {
    v6 = 0x80000;
  }
  else
  {
    v6 = 0x20000;
  }
  v7 = objc_alloc_init(MFFetchLimits);
  -[MFFetchLimits setFetchMaxBytes:](v7, "setFetchMaxBytes:", v6);

  return v7;
}

- (id)unsupportedHandoffTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D46CE8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)moveSupported
{
  return 1;
}

- (id)replayAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  MFDATransferActionReplayer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "mailboxURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount mailboxUidForURL:](self, "mailboxUidForURL:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[MailAccount storeForMailboxUid:](self, "storeForMailboxUid:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ECLocalActionReplayer initWithAction:]([MFDATransferActionReplayer alloc], "initWithAction:", v4);
    -[ECLocalActionReplayer setDelegate:](v9, "setDelegate:", self);
    -[MFDATransferActionReplayer replayActionUsingStore:](v9, "replayActionUsingStore:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(v7, "mailboxURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount mailboxUidForURL:](self, "mailboxUidForURL:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MailAccount storeForMailboxUid:](self, "storeForMailboxUid:", v8);
    v9 = (MFDATransferActionReplayer *)objc_claimAutoreleasedReturnValue();
    -[DAMailAccount _remoteIDsForFlagChangeAction:](self, "_remoteIDsForFlagChangeAction:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -86;
    objc_msgSend(v7, "flagChange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v15 = -[MFDATransferActionReplayer replayFlagChange:forRemoteIDs:error:completed:](v9, "replayFlagChange:forRemoteIDs:error:completed:", v14, v13, &v20, &v21);
    v16 = v20;

    if (v21)
    {
      v17 = objc_alloc(MEMORY[0x1E0D1E750]);
      if (v15)
        v18 = 0;
      else
        v18 = v16;
      v10 = (void *)objc_msgSend(v17, "initWithError:", v18);
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)_remoteIDsForFlagChangeAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  objc_msgSend(v3, "remoteIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "messages", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "remoteID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "remoteID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)messageDataForMessage:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAMailAccount.m"), 1867, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[message isKindOfClass:[MFMailMessage class]]"));

  }
  objc_msgSend(v5, "messageDataIsComplete:downloadIfNecessary:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 == v7;

  return v8;
}

- (void)setVirtualAllSearchMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_virtualAllSearchMailbox, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualAllSearchMailbox, 0);
  objc_storeStrong((id *)&self->_folderTag, 0);
  objc_storeStrong((id *)&self->_watchedFolderIds, 0);
  objc_storeStrong((id *)&self->_watchedFolderIdsLock, 0);
  objc_storeStrong((id *)&self->_requestQueuesByFolderID, 0);
  objc_storeStrong((id *)&self->_temporaryInbox, 0);
  objc_storeStrong((id *)&self->_cachedDraftsFolderID, 0);
  objc_storeStrong((id *)&self->_cachedJunkFolderID, 0);
  objc_storeStrong((id *)&self->_cachedTrashFolderID, 0);
  objc_storeStrong((id *)&self->_cachedSentMessagesFolderID, 0);
  objc_storeStrong((id *)&self->_cachedInboxFolderID, 0);
  objc_storeStrong((id *)&self->_cachedIconString, 0);
  objc_storeStrong((id *)&self->_cachedEmailAddresses, 0);
  objc_storeStrong((id *)&self->_cachedEmailAddress, 0);
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_cachedAccountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_cachedAccountID, 0);
  objc_storeStrong((id *)&self->_daAccount, 0);
  objc_storeStrong((id *)&self->_accountConduit, 0);
}

@end
