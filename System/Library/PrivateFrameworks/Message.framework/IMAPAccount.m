@implementation IMAPAccount

- (id)mf_lockOrdering
{
  return self->_lockOrderingArray;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v4 = a4;
  v6 = a3;
  -[IMAPAccount _fileSystemServerPathPrefix](self, "_fileSystemServerPathPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("INBOX")) & 1) == 0
    && objc_msgSend(v6, "hasPrefix:", v7))
  {
    objc_msgSend(v6, "pathComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10 >= objc_msgSend(v8, "count"))
    {
      v16.receiver = self;
      v16.super_class = (Class)IMAPAccount;
      -[MailAccount mailboxUidForRelativePath:create:](&v16, sel_mailboxUidForRelativePath_create_, &stru_1E4F1C8F8, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8;
    }
    else
    {
      objc_msgSend(v8, "subarrayWithRange:", v10, objc_msgSend(v8, "count") - v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17.receiver = self;
      v17.super_class = (Class)IMAPAccount;
      -[MailAccount mailboxUidForRelativePath:create:](&v17, sel_mailboxUidForRelativePath_create_, v12, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)IMAPAccount;
    -[MailAccount mailboxUidForRelativePath:create:](&v15, sel_mailboxUidForRelativePath_create_, v6, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)mailboxPathExtension
{
  return CFSTR("imapmbox");
}

- (BOOL)canFetch
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMAPAccount;
  return -[MailAccount canFetch](&v4, sel_canFetch) || -[MFAccount isSyncingNotes](self, "isSyncingNotes");
}

- (id)_uidNameForPathComponent:(id)a3
{
  objc_msgSend(a3, "mf_encodedIMAPMailboxName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_mailboxPathPrefix
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[IMAPAccount _fileSystemServerPathPrefix](self, "_fileSystemServerPathPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = &stru_1E4F1C8F8;

  return v4;
}

- (id)_fileSystemServerPathPrefix
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;

  -[IMAPAccount serverPathPrefix](self, "serverPathPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAPAccount separatorChar](self, "separatorChar");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v8 = objc_msgSend(v3, "rangeOfString:options:", v4, 8);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v3, "length") <= (unint64_t)(v8 + v7))
      {
        v6 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v3, "substringFromIndex:");
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
    objc_msgSend(v3, "componentsSeparatedByString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v12 = objc_msgSend(v11, "count");
    if (v12)
    {
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend(v11, "objectAtIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAPAccount _pathComponentForUidName:](self, "_pathComponentForUidName:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "replaceObjectAtIndex:withObject:", i, v15);

      }
    }
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  return v6;
}

- (id)serverPathPrefix
{
  NSString *v3;

  -[IMAPAccount serverPathPrefixAccountValue](self, "serverPathPrefixAccountValue");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = self->_serverNamespace;
  return v3;
}

- (id)serverPathPrefixAccountValue
{
  void *v2;
  void *v3;
  id v4;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("ServerPathPrefix"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_URLScheme
{
  return (id)*MEMORY[0x1E0D1DB68];
}

- (id)separatorChar
{
  NSString *v3;

  -[IMAPAccount mf_lock](self, "mf_lock");
  v3 = self->_separatorChar;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  if (!v3)
  {
    -[MailAccount rootMailbox](self, "rootMailbox");

    -[IMAPAccount mf_lock](self, "mf_lock");
    v3 = self->_separatorChar;
    -[IMAPAccount mf_unlock](self, "mf_unlock");
    if (!v3)
    {
      -[IMAPAccount _fetchAndSetSeparatorChar](self, "_fetchAndSetSeparatorChar");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_pathComponentForUidName:(id)a3
{
  objc_msgSend(a3, "mf_decodedIMAPMailboxName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_infoForMatchingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self, CFSTR("Account"));
  if (v6)
  {
    -[IMAPAccount separatorChar](self, "separatorChar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("/"), 8);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "substringWithRange:", v9 + v8, objc_msgSend(v6, "length") - (v9 + v8));
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    if (v7)
    {
      v12 = objc_msgSend(v6, "rangeOfString:options:", v7, 8);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "substringWithRange:", v12 + v11, objc_msgSend(v6, "length") - (v12 + v11));
        v13 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v13;
      }
    }
    if ((objc_msgSend(v6, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RelativePath"));

  }
  return v5;
}

- (void)_updatePushedMailboxesAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id obj;

  v3 = a3;
  if (-[MFAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]))
  {
    if (-[IMAPAccount supportsUserPushedMailboxes](self, "supportsUserPushedMailboxes"))
      v5 = -[IMAPAccount _copyUserPushedMailboxes](self, "_copyUserPushedMailboxes");
    else
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    obj = v5;
    -[MailAccount primaryMailboxUid](self, "primaryMailboxUid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "addObject:", v6);

    -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(obj, "addObject:", v7);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("RelatedMessagesShouldIncludeDrafts"));

    if (v9)
    {
      -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 5, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(obj, "addObject:", v10);

    }
  }
  else
  {
    obj = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  -[IMAPAccount mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_pushedMailboxUids, obj);
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MFMailAccountPushedMailboxUidsDidChange"), self, 0);

  }
}

- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  IMAPAccount *v8;
  IMAPAccount *v9;
  void *v10;
  IMAPAccount *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = a4;
  v7 = -[IMAPAccount isMailboxLocalForType:](self, "isMailboxLocalForType:");
  v8 = self;
  v9 = v8;
  if (v7)
  {
    -[MailAccount _localMailboxNameForType:usingDisplayName:](v8, "_localMailboxNameForType:usingDisplayName:", a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LocalAccount localAccount](LocalAccount, "localAccount");
    v11 = (IMAPAccount *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMAPAccount specialUseAttributeForType:](v8, "specialUseAttributeForType:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[MailAccount rootMailbox](v9, "rootMailbox");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "descendantWithExtraAttribute:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {

        v10 = 0;
        goto LABEL_14;
      }
    }
    -[MailAccount specialMailboxNameForType:](v9, "specialMailboxNameForType:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      v10 = v15;
    }
    else
    {
      -[MailAccount _defaultSpecialMailboxNameForType:](v9, "_defaultSpecialMailboxNameForType:", a3);
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v16;
    }
    v17 = objc_msgSend(v10, "length");

    if (!v17)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v11 = v9;
  }
  -[IMAPAccount mailboxUidForRelativePath:create:](v11, "mailboxUidForRelativePath:create:", v10, v7 | v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if (v7)
    objc_msgSend(v18, "setRepresentedAccount:", v9);
  v9 = v11;
LABEL_14:

  return v14;
}

- (id)specialUseAttributeForType:(int64_t)a3
{
  if (specialUseAttributeForType__onceToken != -1)
    dispatch_once(&specialUseAttributeForType__onceToken, &__block_literal_global_179);
  return (id)CFDictionaryGetValue((CFDictionaryRef)specialUseAttributeForType__map, (const void *)a3);
}

- (BOOL)isMailboxLocalForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 2) > 3)
    return 0;
  else
    return !-[IMAPAccount storeMailboxTypeOnServer:](self, "storeMailboxTypeOnServer:", v3, v4);
}

- (BOOL)storeMailboxTypeOnServer:(int64_t)a3
{
  uint64_t v3;
  BOOL v4;
  __int128 v6;
  uint64_t v7;

  v3 = 0;
  do
  {
    v6 = *(_OWORD *)&_storeOnServer[v3];
    v7 = _storeOnServer[v3 + 2];
    if ((_QWORD)v6 == a3)
      break;
    v4 = v3 == 12;
    v3 += 3;
  }
  while (!v4);
  return _storeOnServerForTuple(self, (uint64_t)&v6);
}

- (BOOL)supportsUserPushedMailboxes
{
  return -[IMAPAccount supportedPushServiceLevel](self, "supportedPushServiceLevel") > 1;
}

- (BOOL)canReceiveNewMailNotifications
{
  return -[IMAPAccount supportedPushServiceLevel](self, "supportedPushServiceLevel") >= 0;
}

- (int64_t)supportedPushServiceLevel
{
  int64_t supportedPushServiceLevel;

  -[MailAccount rootMailbox](self, "rootMailbox");

  -[IMAPAccount mf_lock](self, "mf_lock");
  supportedPushServiceLevel = self->_supportedPushServiceLevel;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return supportedPushServiceLevel;
}

- (id)statisticsKind
{
  void *v2;
  id *v3;
  int v4;
  id v5;

  -[MailAccount iconString](self, "iconString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("163AccountIcon"), "isEqualToString:", v2) & 1) != 0
    || (objc_msgSend(CFSTR("126AccountIcon"), "isEqualToString:", v2) & 1) != 0)
  {
    v3 = (id *)MEMORY[0x1E0D46C40];
  }
  else
  {
    v4 = objc_msgSend(CFSTR("qqAccountIcon"), "isEqualToString:", v2);
    v3 = (id *)MEMORY[0x1E0D46C38];
    if (v4)
      v3 = (id *)MEMORY[0x1E0D46C48];
  }
  v5 = *v3;

  return v5;
}

- (BOOL)_readCustomInfoFromMailboxCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSString *v9;
  NSString *separatorChar;
  NSArray *v11;
  NSArray *lastKnownCapabilities;
  void *v13;
  int v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *pushRegisteredMailboxes;
  NSString *v17;
  NSString *apsTopic;
  objc_super v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("separator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("namespace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAPAccount mf_lock](self, "mf_lock");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
    {
      v9 = (NSString *)objc_msgSend(v5, "copy");
      separatorChar = self->_separatorChar;
      self->_separatorChar = v9;

      v8 = 1;
      if (!v6)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  +[IMAPAccount log](IMAPAccount, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[IMAPAccount _readCustomInfoFromMailboxCache:].cold.1(v7);

  v8 = 0;
  if (v6)
  {
LABEL_7:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
      objc_storeStrong((id *)&self->_serverNamespace, v6);
  }
LABEL_11:
  if (!self->_lastKnownCapabilities)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capabilities"));
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    lastKnownCapabilities = self->_lastKnownCapabilities;
    self->_lastKnownCapabilities = v11;

  }
  if (self->_supportedPushServiceLevel == -2)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("push-service-level"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = objc_msgSend(v13, "intValue");
      if (v14 >= -1 && -[IMAPAccount apsVersion](self, "apsVersion") >= v14)
        self->_supportedPushServiceLevel = v14;
    }

  }
  if (!self->_pushRegisteredMailboxes)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("push-registered-mailboxes"));
    v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    pushRegisteredMailboxes = self->_pushRegisteredMailboxes;
    self->_pushRegisteredMailboxes = v15;

  }
  if (!self->_apsTopic)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aps-topic"));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    apsTopic = self->_apsTopic;
    self->_apsTopic = v17;

  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  v20.receiver = self;
  v20.super_class = (Class)IMAPAccount;
  -[MailAccount _readCustomInfoFromMailboxCache:](&v20, sel__readCustomInfoFromMailboxCache_, v4);

  return v8;
}

- (int64_t)apsVersion
{
  return self->_apsVersion;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  MFMailboxUid *v12;
  id v13;
  MFMailboxUid *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  MFMailboxUid *inboxMailboxUid;
  MFMailboxUid *v20;
  void *v21;
  MFMailboxUid *v22;
  uint64_t v23;
  objc_super v25;
  objc_super v26;

  v12 = (MFMailboxUid *)a3;
  v13 = a4;
  v14 = (MFMailboxUid *)a6;
  v15 = a7;
  if (v14)
  {
    if (!v13)
    {
      if (self->super._inboxMailboxUid == v14)
      {
        -[MFMailboxUid name](v14, "name");
        v23 = objc_claimAutoreleasedReturnValue();
        a5 = -[MFMailboxUid attributes](self->super._inboxMailboxUid, "attributes") & 0xFFFFFFFFFFFFFEFFLL;
        v13 = (id)v23;
      }
      else
      {
        if ((-[MFMailboxUid attributes](v14, "attributes") & 0x100) != 0)
        {

          v14 = 0;
        }
        v13 = 0;
      }
    }
    a5 |= -[MFMailboxUid attributes](v14, "attributes") & 0x80;
    goto LABEL_15;
  }
  if (self->super._rootMailboxUid != v12
    || (v16 = v13, (v13 = v16) == 0)
    || (v17 = objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("INBOX")), v13, v17))
  {
    v14 = 0;
LABEL_15:
    v25.receiver = self;
    v25.super_class = (Class)IMAPAccount;
    v22 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](&v25, sel__copyMailboxUidWithParent_name_attributes_existingMailboxUid_dictionary_, v12, v13, a5, v14, v15);

    goto LABEL_16;
  }
  v18 = a5 & 0xFFFFFFFFFFFFFEFFLL;
  inboxMailboxUid = self->super._inboxMailboxUid;
  if (inboxMailboxUid)
  {
    -[MFMailboxUid setName:](inboxMailboxUid, "setName:", v13);
    -[MFMailboxUid setAttributes:](self->super._inboxMailboxUid, "setAttributes:", v18);
    v20 = self->super._inboxMailboxUid;
    objc_msgSend(v15, "objectForKey:", CFSTR("MailboxExtraAttributes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailboxUid setExtraAttributes:](v20, "setExtraAttributes:", v21);

    v22 = self->super._inboxMailboxUid;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)IMAPAccount;
    v22 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](&v26, sel__copyMailboxUidWithParent_name_attributes_existingMailboxUid_dictionary_, v12, v13, v18, 0, v15);
    -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", v22, 7);
  }
LABEL_16:

  return v22;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F0D0];
}

- (void)fetchMailboxList
{
  void *v3;
  id v4;

  if (+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    -[IMAPAccount taskManager](self, "taskManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[IMAPAccount taskManager](self, "taskManager");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fetchNow:", *MEMORY[0x1E0D1DC20]);

    }
    else
    {
      -[IMAPAccount throttledGetMailboxListWithConnection:](self, "throttledGetMailboxListWithConnection:", 0);
    }
  }
}

- (id)connectionForMailbox:(id)a3 delegate:(id)a4 options:(unint64_t)a5 failedToSelectMailbox:(BOOL *)a6
{
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  IMAPAccount *v15;
  id v16;
  void *v17;
  const __CFArray *cachedConnections;
  unint64_t Count;
  CFIndex v20;
  CFIndex v21;
  void *v22;
  id v23;
  char v24;
  char v25;
  char v26;
  _BOOL4 v27;
  CFIndex v28;
  void *v29;
  void *v30;
  void *v32;
  char v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  CFIndex v37;
  unint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  _BOOL4 v46;
  __CFArray *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  int v52;
  char v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  CFStringRef (__cdecl *v63)(const void *);
  void (__cdecl *v64)(CFAllocatorRef, const void *);
  const void *(__cdecl *v65)(CFAllocatorRef, const void *);
  void *v67;
  IMAPAccount *v68;
  id v69;
  void *v70;
  id v71;
  CFArrayCallBacks buf;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v68 = self;
  v69 = a4;
  v67 = v10;
  -[IMAPAccount taskManager](self, "taskManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = EFIsRunningUnitTests();

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, v68, CFSTR("IMAPAccount.m"), 833, CFSTR("Trying to use old IMAP while new IMAP is enabled"));

    }
  }
  if (a6)
    *a6 = 0;
  if (v10)
  {
    -[IMAPAccount _nameForMailboxUid:](v68, "_nameForMailboxUid:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[IMAPAccount log](IMAPAccount, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.version) = 138412290;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v10;
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "*** Unable to determine name for %@", (uint8_t *)&buf, 0xCu);
      }
      v71 = 0;
      goto LABEL_131;
    }
  }
  else
  {
    v13 = 0;
  }
  v70 = (void *)v13;
  v64 = *(void (__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E0C9B378] + 16);
  v65 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E0C9B378] + 8);
  v63 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B378] + 24);
  while (2)
  {
    v15 = v68;
    v71 = v70;
    v16 = v69;
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setError:", 0);

    -[NSRecursiveLock lock](v15->_connectionLock, "lock");
    -[IMAPAccount mf_lock](v15, "mf_lock");
    cachedConnections = v15->_cachedConnections;
    if ((a5 & 1) != 0)
    {
      if (cachedConnections)
        goto LABEL_17;
      buf.version = 0;
      buf.retain = v65;
      buf.release = v64;
      buf.copyDescription = v63;
      buf.equal = 0;
      cachedConnections = CFArrayCreateMutable(0, 0, &buf);
      v15->_cachedConnections = cachedConnections;
    }
    if (cachedConnections)
    {
LABEL_17:
      Count = CFArrayGetCount(cachedConnections);
      if (Count)
      {
        v20 = 0;
        v21 = 0xAAAAAAAAAAAAAAAALL;
        while (1)
        {
          CFArrayGetValueAtIndex(v15->_cachedConnections, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "delegate");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          if (v23 != v16)
            break;
          if ((a5 & 4) != 0)
          {
            v24 = objc_msgSend(v22, "mf_tryLock");

            if ((v24 & 1) == 0)
              goto LABEL_21;
          }
          else
          {

          }
          v14 = v22;
          v21 = v20;
LABEL_27:

          if (++v20 >= Count || v14)
          {
            if (v14)
              goto LABEL_30;
            v28 = 0;
            while (1)
            {
              CFArrayGetValueAtIndex(v15->_cachedConnections, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "delegate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
              {

              }
              else if ((a5 & 4) == 0 || objc_msgSend(v29, "mf_tryLock"))
              {
                if (v70)
                {
                  objc_msgSend(v29, "selectedMailbox");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v32, "isEqualToString:", v71);

                  if ((v33 & 1) != 0)
                  {
LABEL_53:
                    v14 = v29;
                    if ((a5 & 4) == 0)
                      goto LABEL_37;
                    goto LABEL_54;
                  }
                }
                else
                {
                  if ((a5 & 8) != 0)
                    goto LABEL_53;
                  objc_msgSend(v29, "selectedMailbox");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = v34 == 0;

                  if (v35)
                    goto LABEL_53;
                }
                v14 = 0;
                if ((a5 & 4) == 0)
                  goto LABEL_37;
LABEL_54:
                if (v14)
                  goto LABEL_37;
                objc_msgSend(v29, "mf_unlock");
              }
              v14 = 0;
LABEL_37:
              v27 = v14 == 0;
              if (v14)
                v21 = v28;

              if (++v28 >= Count || v14 != 0)
              {
                v26 = 0;
                goto LABEL_56;
              }
            }
          }
        }

LABEL_21:
        v14 = 0;
        goto LABEL_27;
      }
      goto LABEL_32;
    }
    Count = 0;
LABEL_32:
    v14 = 0;
    v21 = 0xAAAAAAAAAAAAAAAALL;
    v26 = 1;
    v27 = 1;
LABEL_56:
    if ((a5 & 1) == 0 || !v27)
    {
      v25 = 0;
      goto LABEL_82;
    }
    if (!v70)
      goto LABEL_77;
    +[IMAPAccount log](IMAPAccount, "log");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = (CFIndex)v15->_cachedConnections;
      LODWORD(buf.version) = 138543362;
      *(CFIndex *)((char *)&buf.version + 4) = v37;
      _os_log_impl(&dword_1A4F90000, v36, OS_LOG_TYPE_INFO, "Attempting to find a cached connection. _cachedConnections:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }

    if ((v26 & 1) != 0)
    {
LABEL_77:
      v14 = -[MFAccount _newConnection](v15, "_newConnection");
      +[IMAPAccount log](IMAPAccount, "log");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject ef_publicDescription](v14, "ef_publicDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.version) = 138543362;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v43;
        _os_log_impl(&dword_1A4F90000, v42, OS_LOG_TYPE_DEFAULT, "No cached connection found. Creating new connection: %{public}@", (uint8_t *)&buf, 0xCu);

      }
      if (((a5 >> 2) & 1) != 0)
        -[NSObject mf_lock](v14, "mf_lock");
      -[NSObject setTag:](v14, "setTag:", v15->_nextConnectionTag++);
      -[NSObject setMailboxListFilter:](v14, "setMailboxListFilter:", v15);
      CFArrayAppendValue(v15->_cachedConnections, v14);
      v25 = 1;
      v21 = Count;
      goto LABEL_82;
    }
    v38 = 0;
    do
    {
      CFArrayGetValueAtIndex(v15->_cachedConnections, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "delegate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v14 = 0;
      }
      else
      {
        if ((a5 & 4) != 0 && !objc_msgSend(v39, "mf_tryLock"))
        {
          v14 = 0;
          goto LABEL_71;
        }
        v14 = v39;
        +[IMAPAccount log](IMAPAccount, "log");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject ef_publicDescription](v14, "ef_publicDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.version) = 138543362;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v41;
          _os_log_impl(&dword_1A4F90000, v40, OS_LOG_TYPE_DEFAULT, "Checking out cached connection: %{public}@", (uint8_t *)&buf, 0xCu);

        }
        v21 = v38;
      }

LABEL_71:
      ++v38;
    }
    while (v38 < Count && !v14);
    if (!v14)
      goto LABEL_77;
LABEL_30:
    v25 = 0;
LABEL_82:
    -[IMAPAccount mf_unlock](v15, "mf_unlock");
    if (!v14)
      goto LABEL_104;
    if ((a5 & 1) == 0)
    {
      if ((unint64_t)-[NSObject connectionState](v14, "connectionState") >= 2)
        goto LABEL_98;
      goto LABEL_92;
    }
    MFUserAgent();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isMobileMail");

    if (!v45)
    {
      if (-[IMAPAccount connectAndAuthenticate:](v15, "connectAndAuthenticate:", v14))
        goto LABEL_98;
LABEL_92:
      v49 = 0;
      goto LABEL_95;
    }
    CFArrayRemoveValueAtIndex(v15->_cachedConnections, v21);
    -[NSRecursiveLock unlock](v15->_connectionLock, "unlock");
    v46 = -[IMAPAccount connectAndAuthenticate:](v15, "connectAndAuthenticate:", v14);
    -[NSRecursiveLock lock](v15->_connectionLock, "lock");
    v47 = v15->_cachedConnections;
    if (!v47)
    {
      buf.version = 0;
      buf.retain = v65;
      buf.release = v64;
      buf.copyDescription = v63;
      buf.equal = 0;
      v47 = CFArrayCreateMutable(0, 0, &buf);
      v15->_cachedConnections = v47;
    }
    CFArrayAppendValue(v47, v14);
    if (-[NSObject isCellularConnection](v14, "isCellularConnection"))
    {
      +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isFatPipe");

    }
    else
    {
      v49 = 0;
    }
    if ((v49 | !v46) == 1)
    {
LABEL_95:
      if ((a5 & 4) != 0)
        -[NSObject mf_unlock](v14, "mf_unlock");
      -[IMAPAccount checkInConnection:destroy:](v15, "checkInConnection:destroy:", v14, v49);
      goto LABEL_103;
    }
LABEL_98:
    -[IMAPAccount _replayMailboxActionsWithConnection:](v15, "_replayMailboxActionsWithConnection:", v14);
    if (-[NSObject isValid](v14, "isValid"))
    {
      -[IMAPAccount releaseNetworkAssertion](v15, "releaseNetworkAssertion");
    }
    else
    {
      if ((a5 & 4) != 0)
        -[NSObject mf_unlock](v14, "mf_unlock");
      -[IMAPAccount checkInConnection:](v15, "checkInConnection:", v14);
LABEL_103:

      v14 = 0;
    }
LABEL_104:
    if (v70)
    {
      -[NSObject selectedMailbox](v14, "selectedMailbox");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject delegate](v14, "delegate");
      v51 = (id)objc_claimAutoreleasedReturnValue();
      v52 = 1;
      if (v51 == v16 && v50)
        v52 = objc_msgSend(v71, "isEqualToString:", v50) ^ 1;

    }
    else
    {
      v52 = 0;
    }
    -[NSObject setDelegate:](v14, "setDelegate:", v16);
    -[NSRecursiveLock unlock](v15->_connectionLock, "unlock");

    if (v14)
    {
      if ((a5 & 0x10) != 0)
        v53 = v25;
      else
        v53 = 1;
      if ((v53 & 1) == 0)
        -[NSObject noop](v14, "noop");
      if (v52)
      {
        v54 = (a5 & 2) != 0
            ? -[NSObject examineMailbox:](v14, "examineMailbox:", v71)
            : -[NSObject selectMailbox:withAccount:](v14, "selectMailbox:withAccount:", v71, v15);
        if ((v54 & 1) == 0)
        {
          if ((a5 & 4) != 0)
            -[NSObject mf_unlock](v14, "mf_unlock");
          if (!-[NSObject isValid](v14, "isValid"))
          {
            -[IMAPAccount checkInConnection:](v15, "checkInConnection:", v14);

            if ((v25 & 1) != 0)
            {
LABEL_132:
              v14 = 0;
              break;
            }
            continue;
          }
          +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "error");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          {
            v57 = (void *)MEMORY[0x1E0CB3940];
            MFLookupLocalizedString(CFSTR("IMAP_OPEN_FAILED_TITLE_FORMAT"), CFSTR("Unable to open “%@”"), CFSTR("Delayed"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "displayName");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringWithFormat:", v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setShortDescription:", v60);

          }
          if (a6)
            *a6 = 1;

LABEL_131:
          goto LABEL_132;
        }
      }
    }
    break;
  }

  return v14;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__IMAPAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)(id)log_log_0;
}

- (id)taskManager
{
  void *v3;
  os_unfair_lock_s *p_taskManagerLock;
  MFTaskManager **p_taskManager;
  MFTaskManager *v6;
  NSObject *v7;
  void *v8;
  MFTaskManager *v9;
  MFTaskManager *v10;
  MFTaskManager *v11;
  NSObject *v13;
  void *v14;
  _QWORD block[4];
  MFTaskManager *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MFAccount hostname](self, "hostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_taskManagerLock = &self->_taskManagerLock;
  os_unfair_lock_lock(&self->_taskManagerLock);
  p_taskManager = &self->_taskManager;
  v6 = self->_taskManager;
  if (!v6)
  {
    if (-[IMAPAccount _useNewIMAPStack](self, "_useNewIMAPStack")
      && +[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
    {
      v6 = -[MFSwiftIMAPTaskManager initWithAccount:]([MFSwiftIMAPTaskManager alloc], "initWithAccount:", self);
      if (!v6)
      {
        +[IMAPAccount log](IMAPAccount, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          -[MFAccount identifier](self, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMAPAccount taskManager].cold.1(v14, (uint64_t)v3, buf, v13);
        }

        abort();
      }
      +[IMAPAccount log](IMAPAccount, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[MFAccount identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v8;
        v19 = 2114;
        v20 = v3;
        _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Using MFSwiftIMAPTaskManager for account %{public}@ on %{public}@", buf, 0x16u);

      }
      objc_storeStrong((id *)p_taskManager, v6);
    }
    else
    {
      v6 = 0;
    }
  }
  os_unfair_lock_unlock(p_taskManagerLock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__IMAPAccount_taskManager__block_invoke;
  block[3] = &unk_1E4E88DC8;
  v9 = v6;
  v16 = v9;
  if (taskManager_onceToken != -1)
    dispatch_once(&taskManager_onceToken, block);
  v10 = v16;
  v11 = v9;

  return v11;
}

- (BOOL)_useNewIMAPStack
{
  char v2;
  void *v3;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "BOOLForKey:", CFSTR("MailIMAPNewStack"));

  return v2;
}

- (void)checkInConnection:(id)a3 destroy:(BOOL)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  char v9;
  char v10;
  CFIndex Count;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  CFIndex i;
  CFIndex FirstIndexOfValue;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;
  CFRange v26;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[NSRecursiveLock lock](self->_connectionLock, "lock");
    if (!objc_msgSend(v6, "mf_tryLock"))
    {
LABEL_39:
      -[NSRecursiveLock unlock](self->_connectionLock, "unlock");
      goto LABEL_40;
    }
    +[IMAPAccount log](IMAPAccount, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Checking in connection and clearing delegate: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v6, "setDelegate:", 0);
    v8 = objc_msgSend(v6, "connectionState");
    objc_msgSend(v6, "mf_unlock");
    -[IMAPAccount mf_lock](self, "mf_lock");
    if (objc_msgSend(v6, "gotBadResponse"))
      -[IMAPAccount _setCapabilities:](self, "_setCapabilities:", 0);
    if (a4)
    {
      v9 = 1;
      v10 = 1;
LABEL_31:
      -[IMAPAccount mf_unlock](self, "mf_unlock");
      if ((v10 & 1) != 0)
      {
        objc_msgSend(v6, "logout");
        objc_msgSend(v6, "disconnectAndNotifyDelegate:", 0);
      }
      if (self->_cachedConnections && (v9 & 1) != 0)
      {
        -[IMAPAccount mf_lock](self, "mf_lock");
        for (i = CFArrayGetCount(self->_cachedConnections); ; --i)
        {
          v26.location = 0;
          v26.length = i;
          FirstIndexOfValue = CFArrayGetFirstIndexOfValue(self->_cachedConnections, v26, v6);
          if (FirstIndexOfValue == -1)
            break;
          CFArrayRemoveValueAtIndex(self->_cachedConnections, FirstIndexOfValue);
        }
        -[IMAPAccount mf_unlock](self, "mf_unlock");
      }
      goto LABEL_39;
    }
    if (!self->_cachedConnections)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_31;
    }
    if ((unint64_t)(v8 - 2) < 2)
    {
      objc_msgSend(v6, "selectedMailbox");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      Count = CFArrayGetCount(self->_cachedConnections);
      if (Count < 1)
      {
        v9 = 0;
        v10 = 0;
      }
      else
      {
        v10 = 0;
        v9 = 0;
        v12 = 1;
        do
        {
          CFArrayGetValueAtIndex(self->_cachedConnections, v12 - 1);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 != v6)
          {
            objc_msgSend(v13, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (v16)
            {
              v9 = 1;
              v10 = 1;
            }
          }

          if (v12 >= Count)
            break;
          ++v12;
        }
        while ((v9 & 1) == 0);
      }
      if (-[MailAccount _shouldLogDeleteActivity](self, "_shouldLogDeleteActivity"))
      {
        +[IMAPAccount log](IMAPAccount, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v22 = v20;
          v23 = 2112;
          v24 = v6;
          _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "#Warning Unselected connection checked back in, mailbox: %@, connection: %@", buf, 0x16u);
        }

      }
      goto LABEL_31;
    }
    if (v8)
    {
      v9 = 0;
      v10 = 0;
      if (v8 != 1)
        goto LABEL_31;
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    v9 = 1;
    goto LABEL_31;
  }
LABEL_40:

}

- (Class)connectionClass
{
  return (Class)objc_opt_class();
}

- (BOOL)connectAndAuthenticate:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMAPAccount isOffline](self, "isOffline");
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "connectionState");
  +[IMAPAccount log](IMAPAccount, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ef_publicDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ state: %@", (uint8_t *)&v20, 0x16u);

  }
  v11 = objc_msgSend(v4, "connectionState");
  if ((unint64_t)(v11 - 2) < 2)
    goto LABEL_14;
  v12 = 0;
  if (v11 == 1)
    goto LABEL_11;
  if (!v11)
  {
    if ((objc_msgSend(v6, "shouldCancel") & 1) != 0)
    {
      v13 = 0;
LABEL_25:
      LOBYTE(v12) = 0;
      goto LABEL_26;
    }
    if ((objc_msgSend(v4, "connectUsingAccount:", self) & 1) == 0)
    {
      objc_msgSend(v6, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      if (!v19 || (objc_msgSend(v19, "mf_isUserCancelledError") & 1) != 0)
      {
        v5 = 0;
        v13 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v6, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      v5 = 1;
LABEL_21:

      if (v13)
      {
        +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isNetworkUp");

        if (v17)
        {
          if ((objc_msgSend(v13, "mf_isUserCancelledError") & 1) == 0)
            -[MailAccount setConnectionError:](self, "setConnectionError:", v13);
        }
      }
      goto LABEL_25;
    }
    v12 = 1;
LABEL_11:
    if ((objc_msgSend(v4, "authenticateUsingAccount:", self) & 1) != 0)
    {
      -[MailAccount setConnectionError:](self, "setConnectionError:", 0);
      if (v12)
      {
        -[IMAPAccount _updateSeparatorAndNamespaceWithConnection:](self, "_updateSeparatorAndNamespaceWithConnection:", v4);
        -[IMAPAccount throttledGetMailboxListWithConnection:](self, "throttledGetMailboxListWithConnection:", v4);
        -[MailAccount replayHandler](self, "replayHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "connectionEstablished");

      }
LABEL_14:
      v13 = 0;
      v5 = 0;
      LOBYTE(v12) = 1;
      goto LABEL_26;
    }
    objc_msgSend(v6, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MFAccount shouldEnableAfterError:](self, "shouldEnableAfterError:", v13))
      -[MFAccount enableAccount](self, "enableAccount");
    if (!v13)
    {
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1033, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setError:", v13);
    }
    -[MFAccount preferredAuthScheme](self, "preferredAuthScheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount reportAuthenticationError:authScheme:](self, "reportAuthenticationError:authScheme:", v13, v15);
    goto LABEL_20;
  }
  v13 = 0;
LABEL_26:
  if (v5 != -[IMAPAccount isOffline](self, "isOffline"))
  {
    -[IMAPAccount setIsOffline:](self, "setIsOffline:", v5);
    if (!v5)
      objc_msgSend(v4, "setReadBufferSize:", -[IMAPAccount readBufferSize](self, "readBufferSize"));
  }

  return v12;
}

- (BOOL)isOffline
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isOffline);
  return v2 & 1;
}

- (void)resetMailboxTimer
{
  atomic_store(0, (unsigned __int8 *)&self->_fetchedMailboxList);
}

- (id)_nameForMailboxUid:(id)a3
{
  MFMailboxUid *v4;
  __CFString *v5;
  __CFString *v6;
  MFMailboxUid *v7;
  MFMailboxUid *rootMailboxUid;
  id v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;

  v4 = (MFMailboxUid *)a3;
  if (self->super._inboxMailboxUid != v4)
  {
    -[IMAPAccount serverPathPrefix](self, "serverPathPrefix");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v5
      && (-[MFMailboxUid parent](v4, "parent"),
          v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(),
          rootMailboxUid = self->super._rootMailboxUid,
          v7,
          v7 == rootMailboxUid))
    {
      -[MFMailboxUid name](v4, "name");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self->super._rootMailboxUid != v4)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (-[__CFString length](v5, "length"))
        {
          v10 = !-[MFMailboxUid isShared](v4, "isShared");
          if (!v4)
            goto LABEL_16;
        }
        else
        {
          v10 = 0;
          if (!v4)
          {
LABEL_16:
            if (v10)
              v15 = (void *)-[__CFString mutableCopy](v5, "mutableCopy");
            else
              v15 = 0;
            v16 = objc_msgSend(v9, "count");
            -[IMAPAccount separatorChar](self, "separatorChar");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              for (i = v16 - 1; i != -1; --i)
              {
                objc_msgSend(v9, "objectAtIndex:", i);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v19;
                if (v15)
                {
                  if (!v17)
                  {

                    v15 = 0;
                    break;
                  }
                  objc_msgSend(v15, "appendString:", v17);
                  objc_msgSend(v15, "appendString:", v20);
                }
                else
                {
                  v15 = (void *)objc_msgSend(v19, "mutableCopy");
                }

              }
            }
            v6 = v15;

            goto LABEL_31;
          }
        }
        do
        {
          if (v4 == self->super._rootMailboxUid)
            break;
          -[MFMailboxUid name](v4, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v13);

          -[MFMailboxUid parent](v4, "parent");
          v14 = objc_claimAutoreleasedReturnValue();

          v4 = (MFMailboxUid *)v14;
        }
        while (v14);
        goto LABEL_16;
      }
      v11 = &stru_1E4F1C8F8;
      if (v5)
        v11 = v5;
      v12 = v11;
    }
    v6 = v12;
LABEL_31:

    goto LABEL_32;
  }
  v6 = CFSTR("INBOX");
LABEL_32:

  return v6;
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)defaultPortNumber
{
  return 143;
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E0CD6B10];
}

void __18__IMAPAccount_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (void)throttledGetMailboxListWithConnection:(id)a3
{
  id v4;
  CFAbsoluteTime Current;
  void *v6;
  int v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29[2];

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  MFUserAgent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isForeground");

  v8 = atomic_load((unsigned __int8 *)&self->_fetchedMailboxList);
  if ((v8 & 1) == 0 || v7 && Current - self->_timeLastFetchedMailboxList > 300.0)
  {
    self->_timeLastFetchedMailboxList = Current;
    atomic_store(1u, (unsigned __int8 *)&self->_fetchedMailboxList);
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount rootMailbox](self, "rootMailbox");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMailbox:", v10);

    MFLookupLocalizedString(CFSTR("DISABLED_STATUS"), CFSTR("Checking for Mail…"), CFSTR("Delayed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisplayName:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", 0x1E4F2A1B8, 0);
    v29[0] = 0;
    v13 = -[IMAPAccount getMailboxListWithConnection:statusDataItems:statusEntriesByMailbox:](self, "getMailboxListWithConnection:statusDataItems:statusEntriesByMailbox:", v4, v12, v29);
    v14 = v29[0];
    v15 = v14;
    v16 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke;
      v28[3] = &unk_1E4E89020;
      v28[4] = self;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v28);
      if (!v15)
      {
        v17 = v4;
        v24 = v17;
        if (!v17)
        {
          -[IMAPAccount connectionForMailbox:delegate:options:failedToSelectMailbox:](self, "connectionForMailbox:delegate:options:failedToSelectMailbox:", 0, self, 9, 0);
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        -[MailAccount allMailboxUids](self, "allMailboxUids");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ef_filter:", &__block_literal_global_192);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v27[0] = v16;
        v27[1] = 3221225472;
        v27[2] = __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_3;
        v27[3] = &unk_1E4E89088;
        v27[4] = self;
        objc_msgSend(v19, "ef_compactMap:", v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fetchStatusForMailboxes:args:", v20, v12);
        if (v24 != v17)
          -[IMAPAccount checkInConnection:](self, "checkInConnection:", v24);

      }
    }
    else
    {
      atomic_store(0, (unsigned __int8 *)&self->_fetchedMailboxList);
    }
    objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_4;
    v25[3] = &unk_1E4E88DC8;
    v22 = v9;
    v26 = v22;
    v23 = (id)objc_msgSend(v21, "afterDelay:performBlock:", v25, 1.0);

  }
}

- (IMAPAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6;
  id v7;
  IMAPAccount *v8;
  IMAPAccount *v9;
  uint64_t v10;
  NSRecursiveLock *connectionLock;
  id v12;
  uint64_t v13;
  NSArray *lockOrderingArray;
  NSLock *v15;
  NSLock *eSearchSupportedLock;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMAPAccount;
  v8 = -[MailAccount initWithLibrary:persistentAccount:](&v18, sel_initWithLibrary_persistentAccount_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_supportedPushServiceLevel = -2;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46140]), "initWithName:andDelegate:", CFSTR("connectionLock"), v8);
    connectionLock = v9->_connectionLock;
    v9->_connectionLock = (NSRecursiveLock *)v10;

    v12 = objc_alloc(MEMORY[0x1E0C99D20]);
    v13 = objc_msgSend(v12, "initWithObjects:", v9->_connectionLock, *MEMORY[0x1E0D45FC0], 0);
    lockOrderingArray = v9->_lockOrderingArray;
    v9->_lockOrderingArray = (NSArray *)v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    eSearchSupportedLock = v9->_eSearchSupportedLock;
    v9->_eSearchSupportedLock = v15;

    *((_BYTE *)v9 + 388) &= ~0x10u;
    v9->_apsVersion = 2;
    atomic_store(0, (unsigned __int8 *)&v9->_fetchedMailboxList);
    atomic_store(1u, (unsigned __int8 *)&v9->_isOffline);
    v9->_taskManagerLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)stateCaptureTitle
{
  return CFSTR("mail-automation: IMAPAccount");
}

- (BOOL)getMailboxListWithConnection:(id)a3 statusDataItems:(id)a4 statusEntriesByMailbox:(id *)a5
{
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[IMAPAccount _listingForMailboxUid:listAllChildren:onlySubscribed:statusDataItems:withConnection:statusEntriesByMailbox:](self, "_listingForMailboxUid:listAllChildren:onlySubscribed:statusDataItems:withConnection:statusEntriesByMailbox:", self->super._rootMailboxUid, 1, 0, a4, a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("AccountMailboxListingWillFetch"), self, 0);

    -[IMAPAccount mf_lock](self, "mf_lock");
    LODWORD(v7) = -[MailAccount _loadMailboxListingIntoCache:attributes:children:parent:](self, "_loadMailboxListingIntoCache:attributes:children:parent:", 0, 0, v6, self->super._rootMailboxUid);
    -[IMAPAccount mf_unlock](self, "mf_unlock");
    if ((_DWORD)v7)
    {
      -[IMAPAccount _mailboxListingChanged](self, "_mailboxListingChanged");
      -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__IMAPAccount_getMailboxListWithConnection_statusDataItems_statusEntriesByMailbox___block_invoke;
    v9[3] = &unk_1E4E88DC8;
    v9[4] = self;
    -[MailAccount _writeMailboxCacheWithPrejudice:completionHandler:](self, "_writeMailboxCacheWithPrejudice:completionHandler:", 1, v9);
  }
  -[MailAccount resetSpecialMailboxes](self, "resetSpecialMailboxes");

  return v6 != 0;
}

- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4 onlySubscribed:(BOOL)a5 statusDataItems:(id)a6 withConnection:(id)a7 statusEntriesByMailbox:(id *)a8
{
  _BOOL4 v11;
  _BOOL4 v12;
  MFMailboxUid *v14;
  id v15;
  _BOOL4 v16;
  __CFString *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  _BOOL4 v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  unint64_t v45;

  v11 = a5;
  v12 = a4;
  v14 = (MFMailboxUid *)a3;
  v44 = a6;
  v15 = a7;
  if (v15
    || (-[IMAPAccount connectionForMailbox:delegate:options:failedToSelectMailbox:](self, "connectionForMailbox:delegate:options:failedToSelectMailbox:", 0, self, 9, 0), (v15 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[IMAPAccount serverPathPrefixAccountValue](self, "serverPathPrefixAccountValue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "length"))
      v16 = -[NSString isEqualToString:](self->_serverNamespace, "isEqualToString:", v43);
    else
      v16 = 1;
    if (self->super._rootMailboxUid == v14 && v16)
    {
      v17 = &stru_1E4F1C8F8;
    }
    else if (self->super._inboxMailboxUid == v14
           && (-[IMAPAccount serverPathPrefix](self, "serverPathPrefix"),
               v18 = (void *)objc_claimAutoreleasedReturnValue(),
               v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("INBOX")),
               v18,
               v19))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[IMAPAccount separatorChar](self, "separatorChar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("INBOX%@INBOX"), v21);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", v14);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v12)
      v22 = 2;
    else
      v22 = 1;
    if (!v11
      || (objc_msgSend(v15, "subscribedListingForMailbox:options:", v17, v22),
          (v23 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend(v15, "supportsCapability:", 23))
        v24 = (objc_msgSend(v15, "supportsCapability:", 21) & 1) != 0
           || -[IMAPAccount xListSupportedOnConnection:](self, "xListSupportedOnConnection:", v15);
      else
        v24 = 0;
      objc_msgSend(v15, "listingForMailbox:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:", v17, v22, v24, v44, a8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (self->super._rootMailboxUid == v14 && (self->_serverNamespace ? (v27 = v16) : (v27 = 0), v27))
      {
        v42 = (void *)objc_msgSend(v25, "mutableCopy");
        _mailboxDictionaryWithName(v26, self->_serverNamespace, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "removeObject:", v28);
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("MailboxChildren"));
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        v31 = (void *)MEMORY[0x1E0C9AA60];
        if (v29)
          v31 = (void *)v29;
        v32 = v31;

        v41 = v32;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObjectsFromArray:", v42);
        v33 = -[NSString isEqualToString:](self->_serverNamespace, "isEqualToString:", CFSTR("INBOX"));
        if (v28)
          v34 = v33;
        else
          v34 = 0;
        if (v34)
        {
          v45 = 0xAAAAAAAAAAAAAAAALL;
          _mailboxDictionaryWithName(v23, self->_serverNamespace, &v45);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v35;
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v28);
          if (v35)
          {
            objc_msgSend(v35, "objectForKey:", CFSTR("MailboxChildren"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKey:", v36, CFSTR("MailboxChildren"));

            objc_msgSend(v23, "replaceObjectAtIndex:withObject:", v45, v40);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKey:", v38, CFSTR("MailboxChildren"));

            objc_msgSend(v23, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v40, _MFCompareMailboxDictionariesByName, 0, 1);
          }

        }
      }
      else
      {
        v23 = v25;
      }
    }
    -[IMAPAccount checkInConnection:](self, "checkInConnection:", v15);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)stopListeningForNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  IMAPAccount *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[IMAPAccount log](IMAPAccount, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ told to stop listening for notifications", (uint8_t *)&v6, 0xCu);
  }

  *((_BYTE *)self + 388) &= ~4u;
  +[MFAPSManager sharedManager](MFAPSManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAPAccount apsTopic](self, "apsTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopWatchingForTopic:", v5);

  -[IMAPAccount _unregisterForDeviceTokenChanges](self, "_unregisterForDeviceTokenChanges");
}

- (id)apsTopic
{
  NSString *v3;

  -[MailAccount rootMailbox](self, "rootMailbox");

  -[IMAPAccount mf_lock](self, "mf_lock");
  v3 = self->_apsTopic;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)_unregisterForDeviceTokenChanges
{
  void *v3;

  if ((*((_BYTE *)self + 388) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MFAPSManagerDeviceTokenChangedNote"), 0);

    *((_BYTE *)self + 388) &= ~8u;
  }
}

- (void)startListeningForNotifications
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  int Style;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  const char *v19;
  const char *v20;
  int v21;
  IMAPAccount *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canRegisterForAPSPush");

  if ((v4 & 1) != 0)
  {
    +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBatterySaverModeEnabled");

    if (v6)
    {
      +[IMAPAccount log](IMAPAccount, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = self;
        v8 = "#aps-push account %@ will NOT start listening for notifications, battery-saver mode is ON";
LABEL_7:
        v9 = v7;
        v10 = 12;
LABEL_8:
        _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v21, v10);
      }
    }
    else
    {
      +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "gameModeEnabled");

      +[IMAPAccount log](IMAPAccount, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (!v13)
          goto LABEL_9;
        v21 = 138412290;
        v22 = self;
        v8 = "#aps-push account %@ will NOT start listening for notifications, Game Mode is ON";
        goto LABEL_7;
      }
      if (v13)
      {
        v21 = 138412290;
        v22 = self;
        _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ told to start listening for notifications", (uint8_t *)&v21, 0xCu);
      }

      *((_BYTE *)self + 388) |= 4u;
      -[MailAccount uniqueIdForPersistentConnection](self, "uniqueIdForPersistentConnection");
      Style = PCSettingsGetStyle();
      v15 = -[IMAPAccount canAttemptPushRegistration](self, "canAttemptPushRegistration");
      v16 = v15;
      if (Style)
        v17 = 0;
      else
        v17 = v15;
      if (!v17)
      {
        +[IMAPAccount log](IMAPAccount, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        v19 = "CANNOT";
        if (v16)
          v19 = "can";
        v21 = 138412802;
        v22 = self;
        v23 = 2080;
        v24 = v19;
        if (Style)
          v20 = "is NOT";
        else
          v20 = "is";
        v25 = 2080;
        v26 = v20;
        v8 = "#aps-push account %@ did NOT register for push, %s register for push and PCConnectionStyle %s push";
        v9 = v7;
        v10 = 32;
        goto LABEL_8;
      }
      -[IMAPAccount _updatePushedMailboxesAndNotify:](self, "_updatePushedMailboxesAndNotify:", 1);
      -[IMAPAccount _registerForDeviceTokenChanges](self, "_registerForDeviceTokenChanges");
      -[IMAPAccount apsTopic](self, "apsTopic");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        +[MFAPSManager sharedManager](MFAPSManager, "sharedManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "startWatchingForTopic:", v7);

      }
      -[IMAPAccount _schedulePushRegistrationConnection](self, "_schedulePushRegistrationConnection");
    }
  }
  else
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = self;
      v8 = "#aps-push account %@ will NOT start listening for notifications, canRegisterForAPSPush returned NO";
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (BOOL)canAttemptPushRegistration
{
  return 1;
}

- (void)releaseAllConnections
{
  -[IMAPAccount _releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:](self, "_releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:", 1, objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") ^ 1, 0, 1);
}

- (void)_releaseAllConnectionsAndCallSuper:(BOOL)a3 synchronously:(BOOL)a4 edgeForcedOnly:(BOOL)a5 saveOfflineCache:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSObject *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  __CFArray *cachedConnections;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  __CFArray *v37;
  CFIndex FirstIndexOfValue;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  objc_super v45;
  objc_super v46;
  _QWORD v47[5];
  BOOL v48;
  BOOL v49;
  BOOL v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  _BOOL4 v64;
  uint64_t v65;
  CFRange v66;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v65 = *MEMORY[0x1E0C80C00];
  +[IMAPAccount log](IMAPAccount, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v13 = (void *)objc_opt_class();
    v14 = CFSTR("BT");
    *(_DWORD *)buf = 138413570;
    if (v12)
      v14 = CFSTR("MT");
    v54 = (void *)v14;
    v55 = 2112;
    v56 = v13;
    v57 = 1024;
    v58 = v9;
    v59 = 1024;
    v60 = v8;
    v61 = 1024;
    v62 = v7;
    v63 = 1024;
    v64 = v6;
    v15 = v13;
    _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "#Network %@: -[%@ _releaseAllConnectionsAndCallSuper:%{BOOL}d synchronously:%{BOOL}d edgeForcedOnly:%{BOOL}d saveOfflineCache:%{BOOL}d]", buf, 0x2Eu);

  }
  v51[0] = CFSTR("method");
  v51[1] = CFSTR("edgeOnly");
  v52[0] = CFSTR("_releaseAllConnectionsAndCallSuper");
  NSStringFromBOOL();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", CFSTR("IMAPAccount"), v17);

  if (v8)
  {
    -[IMAPAccount taskManager](self, "taskManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[IMAPAccount taskManager](self, "taskManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "closeAllConnections");

      if (v9)
      {
        v46.receiver = self;
        v46.super_class = (Class)IMAPAccount;
        -[MailAccount releaseAllConnections](&v46, sel_releaseAllConnections);
      }
    }
    else
    {
      -[NSRecursiveLock lock](self->_connectionLock, "lock");
      -[IMAPAccount mf_lock](self, "mf_lock");
      v24 = (void *)-[__CFArray mutableCopy](self->_cachedConnections, "mutableCopy");
      if (self->_cachedConnections)
      {
        +[IMAPAccount log](IMAPAccount, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          cachedConnections = self->_cachedConnections;
          *(_DWORD *)buf = 138412290;
          v54 = cachedConnections;
          _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "#Network All connections: %@", buf, 0xCu);
        }

      }
      -[IMAPAccount mf_unlock](self, "mf_unlock");
      if (v7)
      {
        +[IMAPAccount log](IMAPAccount, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4F90000, v27, OS_LOG_TYPE_DEFAULT, "#Network EDGE ONLY", buf, 2u);
        }

        v28 = objc_msgSend(v24, "count");
        v29 = 0;
        if (v28)
        {
          v30 = v28 - 1;
          do
          {
            objc_msgSend(v24, "objectAtIndex:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v31, "isCellularConnection") & 1) != 0)
            {
              if (objc_msgSend(v31, "isFetching"))
                v29 = 1;
            }
            else
            {
              objc_msgSend(v24, "removeObjectAtIndex:", v30);
            }

            --v30;
          }
          while (v30 != -1);
        }
        v32 = v29;
      }
      else
      {
        v32 = 0;
      }
      +[IMAPAccount log](IMAPAccount, "log");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v24;
        _os_log_impl(&dword_1A4F90000, v33, OS_LOG_TYPE_DEFAULT, "#Network Dropping connections: %@", buf, 0xCu);
      }
      v34 = 0;
      while (1)
      {

        -[IMAPAccount mf_lock](self, "mf_lock");
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
          v35 = objc_claimAutoreleasedReturnValue();
          -[NSObject delegate](v35, "delegate");
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObjectAtIndex:", 0);
          v37 = self->_cachedConnections;
          if (v37)
          {
            v66.length = CFArrayGetCount(self->_cachedConnections);
            v66.location = 0;
            FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v37, v66, v35);
            if (FirstIndexOfValue != -1)
              CFArrayRemoveValueAtIndex(self->_cachedConnections, FirstIndexOfValue);
          }
          v33 = v35;
          v39 = (void *)v36;
        }
        else
        {
          v33 = 0;
          v39 = 0;
        }
        -[IMAPAccount mf_unlock](self, "mf_unlock");
        if (!v33)
          break;
        if (v34)
          v40 = 0;
        else
          v40 = v32;
        if (v40 == 1)
        {
          if (-[NSObject isFetching](v33, "isFetching"))
            v34 = v33;
          else
            v34 = 0;
        }
        -[NSObject logout](v33, "logout");
        if (v39)
        {
          -[IMAPAccount mf_lock](self, "mf_lock");
          -[NSObject setDelegate:](v33, "setDelegate:", 0);
          -[IMAPAccount mf_unlock](self, "mf_unlock");
        }

      }
      if (v32)
      {
        -[NSObject selectedMailbox](v34, "selectedMailbox");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAPAccount mailboxUidForName:](self, "mailboxUidForName:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v42 = 0;
      }
      -[NSRecursiveLock unlock](self->_connectionLock, "unlock");
      if (v42)
        v43 = v32;
      else
        v43 = 0;
      if (v43 == 1)
      {
        MFUserAgent();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "autofetchAccount:mailboxUid:", self, v42);

      }
      if (v9)
      {
        v45.receiver = self;
        v45.super_class = (Class)IMAPAccount;
        -[MailAccount releaseAllConnections](&v45, sel_releaseAllConnections);
      }

    }
  }
  else
  {
    -[IMAPAccount mf_lock](self, "mf_lock");
    if (self->_cachedConnections)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __96__IMAPAccount__releaseAllConnectionsAndCallSuper_synchronously_edgeForcedOnly_saveOfflineCache___block_invoke;
      v47[3] = &unk_1E4E88FB8;
      v47[4] = self;
      v48 = v9;
      v49 = v7;
      v50 = v6;
      v20 = (void *)objc_msgSend(v47, "copy");
      v21 = _Block_copy(v20);
      +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", sel__invokeBlock_, self, v21, 0, 3, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "retainArguments");
      +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addInvocation:", v22);

    }
    -[IMAPAccount mf_unlock](self, "mf_unlock");
  }
}

void __42__IMAPAccount_specialUseAttributeForType___block_invoke()
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)5, CFSTR("\\Drafts"));
  CFDictionarySetValue(Mutable, (const void *)4, CFSTR("\\Sent"));
  CFDictionarySetValue(Mutable, (const void *)3, CFSTR("\\Trash"));
  CFDictionarySetValue(Mutable, (const void *)2, CFSTR("\\Archive"));
  CFDictionarySetValue(Mutable, (const void *)1, CFSTR("\\Junk"));
  specialUseAttributeForType__map = (uint64_t)Mutable;
}

- (void)transferNotificationSessionToAccount:(id)a3
{
  IMAPAccount *v4;

  v4 = (IMAPAccount *)a3;
  if (v4 != self)
  {
    -[IMAPAccount stopListeningForNotifications](self, "stopListeningForNotifications");
    -[IMAPAccount startListeningForNotifications](v4, "startListeningForNotifications");
  }

}

- (id)pushedMailboxUids
{
  NSSet *v3;

  if (!self->_pushedMailboxUids)
    -[IMAPAccount _updatePushedMailboxesAndNotify:](self, "_updatePushedMailboxesAndNotify:", 0);
  -[IMAPAccount mf_lock](self, "mf_lock");
  v3 = self->_pushedMailboxUids;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (id)certUIService
{
  return (id)*MEMORY[0x1E0D0D598];
}

- (unint64_t)minID
{
  return 1;
}

- (BOOL)_writeCustomInfoToMailboxCache:(id)a3
{
  id v4;
  NSString *separatorChar;
  NSObject *v6;
  NSString *serverNamespace;
  NSArray *lastKnownCapabilities;
  void *v9;
  NSString *apsTopic;
  objc_super v12;

  v4 = a3;
  -[IMAPAccount mf_lock](self, "mf_lock");
  separatorChar = self->_separatorChar;
  if (separatorChar)
  {
    objc_msgSend(v4, "setObject:forKey:", self->_separatorChar, CFSTR("separator"));
  }
  else
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[IMAPAccount _writeCustomInfoToMailboxCache:].cold.1(v6);

  }
  serverNamespace = self->_serverNamespace;
  if (serverNamespace)
    objc_msgSend(v4, "setObject:forKey:", serverNamespace, CFSTR("namespace"));
  lastKnownCapabilities = self->_lastKnownCapabilities;
  if (lastKnownCapabilities)
    objc_msgSend(v4, "setObject:forKey:", lastKnownCapabilities, CFSTR("capabilities"));
  if (self->_supportedPushServiceLevel != -2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("push-service-level"));

  }
  if (-[NSMutableDictionary count](self->_pushRegisteredMailboxes, "count"))
    objc_msgSend(v4, "setObject:forKey:", self->_pushRegisteredMailboxes, CFSTR("push-registered-mailboxes"));
  apsTopic = self->_apsTopic;
  if (apsTopic)
    objc_msgSend(v4, "setObject:forKey:", apsTopic, CFSTR("aps-topic"));
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  v12.receiver = self;
  v12.super_class = (Class)IMAPAccount;
  -[MailAccount _writeCustomInfoToMailboxCache:](&v12, sel__writeCustomInfoToMailboxCache_, v4);

  return separatorChar != 0;
}

- (BOOL)_repairMailboxCache
{
  void *v2;
  BOOL v3;

  -[IMAPAccount _fetchAndSetSeparatorChar](self, "_fetchAndSetSeparatorChar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)dealloc
{
  __CFArray *cachedConnections;
  void *v4;
  objc_super v5;

  cachedConnections = self->_cachedConnections;
  if (cachedConnections)
    CFRelease(cachedConnections);
  +[MFAPSManager sharedManager](MFAPSManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopWatchingForTopic:", self->_apsTopic);

  unlockedReleaseNetworkAssertion(self);
  v5.receiver = self;
  v5.super_class = (Class)IMAPAccount;
  -[MailAccount dealloc](&v5, sel_dealloc);
}

- (void)test_setTaskManager:(id)a3
{
  id v5;
  os_unfair_lock_s *p_taskManagerLock;
  MFTaskManager *taskManager;
  MFTaskManager *v8;
  MFTaskManager *v9;
  MFTaskManager *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMAPAccount.m"), 322, CFSTR("%s can only be called from unit tests"), "-[IMAPAccount test_setTaskManager:]");

  }
  v12.receiver = self;
  v12.super_class = (Class)IMAPAccount;
  -[MailAccount test_setTaskManager:](&v12, sel_test_setTaskManager_, v5);
  p_taskManagerLock = &self->_taskManagerLock;
  os_unfair_lock_lock(&self->_taskManagerLock);
  taskManager = self->_taskManager;
  v8 = (MFTaskManager *)v5;
  v9 = self->_taskManager;
  self->_taskManager = v8;
  v10 = taskManager;

  os_unfair_lock_unlock(p_taskManagerLock);
  -[MFTaskManager test_tearDown](v10, "test_tearDown");

}

void __26__IMAPAccount_taskManager__block_invoke(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32))
    MFPersistenceAdaptorPowerLogDidCreateInstance(0);
}

- (void)setDisplayName:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[IMAPAccount _renameLocalSpecialMailboxesToName:](self, "_renameLocalSpecialMailboxesToName:", v4);
  v5.receiver = self;
  v5.super_class = (Class)IMAPAccount;
  -[MFAccount setDisplayName:](&v5, sel_setDisplayName_, v4);

}

+ (unsigned)defaultSecurePortNumber
{
  return 993;
}

- (id)serviceName
{
  return CFSTR("imap");
}

- (id)secureServiceName
{
  return CFSTR("imaps");
}

+ (id)saslProfileName
{
  return CFSTR("imap");
}

- (BOOL)requiresAuthentication
{
  return 1;
}

- (void)setStoreMailboxType:(int64_t)a3 onServer:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];

  v4 = a4;
  v6 = 0;
  do
  {
    v7 = _storeOnServer[v6];
    v8 = v6 * 8 + 24;
    if (v7 == a3)
      break;
    v9 = v6 == 12;
    v6 += 3;
  }
  while (!v9);
  v10 = *(uint64_t *)((char *)&_storeOnServer[-2] + v8);
  v12[0] = v7;
  v12[1] = v10;
  v12[2] = 1;
  if (_storeOnServerForTuple(self, (uint64_t)v12) != a4)
  {
    -[IMAPAccount mf_lock](self, "mf_lock");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v11, v10);

    -[IMAPAccount mf_unlock](self, "mf_unlock");
    -[MailAccount resetSpecialMailboxes](self, "resetSpecialMailboxes");
    -[MFAccount _queueAccountInfoDidChange](self, "_queueAccountInfoDidChange");
  }
}

+ (id)accountTypeString
{
  return CFSTR("IMAP");
}

+ (id)csAccountTypeString
{
  return (id)*MEMORY[0x1E0CA5CF0];
}

- (id)clientToken
{
  return 0;
}

- (void)handleAlertResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  MFLookupLocalizedString(CFSTR("IMAP_SERVER_ALERT_FORMAT"), CFSTR("The IMAP server for “%@” wishes to alert you to the following:\n\n%@"), CFSTR("Delayed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAPAccount mf_lock](self, "mf_lock");
  v8 = (void *)handleAlertResponse___handledAlerts;
  if (!handleAlertResponse___handledAlerts)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = (void *)handleAlertResponse___handledAlerts;
    handleAlertResponse___handledAlerts = (uint64_t)v9;

    v8 = (void *)handleAlertResponse___handledAlerts;
  }
  if (objc_msgSend(v8, "containsObject:", v7))
  {

    v7 = 0;
  }
  else
  {
    objc_msgSend((id)handleAlertResponse___handledAlerts, "addObject:", v7);
  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  if (v7)
  {
    MFLookupLocalizedString(CFSTR("WARNING_TITLE"), CFSTR("Warning"), CFSTR("Delayed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, v7, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount setConnectionError:](self, "setConnectionError:", v12);

  }
}

- (id)errorForResponse:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isResponseWithCode:", 17) & 1) != 0 || objc_msgSend(v3, "isAlertResponse"))
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1039, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)readBufferSize
{
  unsigned int readBufferSize;

  readBufferSize = self->_readBufferSize;
  if (!readBufferSize)
  {
    readBufferSize = 0x2000;
    self->_readBufferSize = 0x2000;
  }
  return readBufferSize;
}

- (void)setReadBufferSize:(unsigned int)a3
{
  self->_readBufferSize = a3;
}

- (BOOL)allowsPartialDownloads
{
  return !-[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("PreventDismemberment"), 0);
}

- (void)setAllowsPartialDownloads:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[IMAPAccount mf_lock](self, "mf_lock");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v5, CFSTR("PreventDismemberment"));

  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

- (BOOL)deleteInPlaceForAllMailboxes
{
  return -[MFAccount _BOOLForAccountInfoKey:defaultValue:](self, "_BOOLForAccountInfoKey:defaultValue:", CFSTR("DeleteInPlace"), 0);
}

- (void)_replayMailboxActionsWithConnection:(id)a3
{
  void *v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[MFAccount identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v9)
  {
    -[MailAccount library](self, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mailboxActionPersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextMailboxActionForAccountID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    if (objc_msgSend(v9, "actionType") == 1)
    {
      objc_msgSend(v9, "mailboxName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createMailbox:", v10);
    }
    else
    {
      objc_msgSend(v9, "mailboxName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deleteMailbox:", v10);
    }

    -[MailAccount library](self, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mailboxActionPersistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deleteMailboxAction:", objc_msgSend(v9, "actionID"));

  }
}

- (void)checkInConnection:(id)a3
{
  -[IMAPAccount checkInConnection:destroy:](self, "checkInConnection:destroy:", a3, 0);
}

- (void)checkInConnectionsForStore:(id)a3
{
  __CFArray *cachedConnections;
  CFIndex Count;
  CFIndex v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  if (v13 && self->_cachedConnections)
  {
    -[NSRecursiveLock lock](self->_connectionLock, "lock");
    -[IMAPAccount mf_lock](self, "mf_lock");
    cachedConnections = self->_cachedConnections;
    if (cachedConnections && (Count = CFArrayGetCount(cachedConnections), Count >= 1))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        CFArrayGetValueAtIndex(self->_cachedConnections, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "delegate");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == v13)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v8);
        }

        ++v6;
      }
      while (Count != v6);
    }
    else
    {
      v7 = 0;
    }
    -[IMAPAccount mf_unlock](self, "mf_unlock");
    v10 = objc_msgSend(v7, "count");
    if (v10 >= 1)
    {
      v11 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAPAccount checkInConnection:](self, "checkInConnection:", v12);

        ++v11;
      }
      while (v10 != v11);
    }
    -[NSRecursiveLock unlock](self->_connectionLock, "unlock");

  }
}

- (BOOL)verifyESearchSupportWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  NSNumber *eSearchSupported;
  NSNumber *v6;
  NSNumber *v7;
  int v8;
  char v9;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *v13;

  v4 = (uint64_t (**)(_QWORD))a3;
  -[NSLock lock](self->_eSearchSupportedLock, "lock");
  eSearchSupported = self->_eSearchSupported;
  if (eSearchSupported
    || (-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("VerifiedESEARCH")),
        v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(),
        v7 = self->_eSearchSupported,
        self->_eSearchSupported = v6,
        v7,
        (eSearchSupported = self->_eSearchSupported) != 0))
  {
    v8 = 0;
    v9 = -[NSNumber BOOLValue](eSearchSupported, "BOOLValue");
  }
  else
  {
    v11 = v4[2](v4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v13 = self->_eSearchSupported;
    self->_eSearchSupported = v12;

    if ((_DWORD)v11)
    {
      v8 = 1;
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", self->_eSearchSupported, CFSTR("VerifiedESEARCH"));
      v9 = 1;
    }
    else
    {
      AnalyticsSendEventLazy();
      v9 = 0;
      v8 = 0;
    }
  }
  -[NSLock unlock](self->_eSearchSupportedLock, "unlock");
  if (v8)
    -[MFAccount savePersistentAccount](self, "savePersistentAccount");

  return v9;
}

id __45__IMAPAccount_verifyESearchSupportWithBlock___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("hostname");
  objc_msgSend(*(id *)(a1 + 32), "hostname");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)unselectMailbox:(id)a3
{
  __CFArray *cachedConnections;
  CFIndex Count;
  void *v6;
  CFIndex v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  if (v14 && self->_cachedConnections)
  {
    -[NSRecursiveLock lock](self->_connectionLock, "lock");
    -[IMAPAccount mf_lock](self, "mf_lock");
    cachedConnections = self->_cachedConnections;
    if (cachedConnections && (Count = CFArrayGetCount(cachedConnections), Count >= 1))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        CFArrayGetValueAtIndex(self->_cachedConnections, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "selectedMailbox");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && objc_msgSend(v9, "isEqualToString:", v14))
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "addObject:", v8);
          CFArrayRemoveValueAtIndex(self->_cachedConnections, v7);
          --Count;
        }
        else
        {
          ++v7;
        }

      }
      while (v7 < Count);
    }
    else
    {
      v6 = 0;
    }
    -[IMAPAccount mf_unlock](self, "mf_unlock");
    v11 = objc_msgSend(v6, "count");
    if (v11 >= 1)
    {
      v12 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isValid"))
          objc_msgSend(v13, "logout");
        objc_msgSend(v13, "disconnectAndNotifyDelegate:", 1);

        ++v12;
      }
      while (v11 != v12);
    }
    -[NSRecursiveLock unlock](self->_connectionLock, "unlock");

  }
}

- (void)filterMailboxList:(id)a3 forMailbox:(id)a4 options:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(v9, "count");
  if (v5)
  {
    v6 = v5 - 1;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("MailboxName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("Apple Mail To Do")))
        objc_msgSend(v9, "removeObjectAtIndex:", v6);

      --v6;
    }
    while (v6 != -1);
  }

}

- (void)_invokeBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)systemWillSleep
{
  void *v3;

  -[IMAPAccount taskManager](self, "taskManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[IMAPAccount releaseAllConnections](self, "releaseAllConnections");
}

uint64_t __96__IMAPAccount__releaseAllConnectionsAndCallSuper_synchronously_edgeForcedOnly_saveOfflineCache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:", *(unsigned __int8 *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42));
}

- (void)_releaseAllConnectionsAndCallSuper:(BOOL)a3
{
  -[IMAPAccount _releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:](self, "_releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:", a3, objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") ^ 1, 0, 0);
}

- (void)releaseAllForcedConnections
{
  objc_super v3;

  -[IMAPAccount _releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:](self, "_releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:", 0, objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") ^ 1, 1, 1);
  v3.receiver = self;
  v3.super_class = (Class)IMAPAccount;
  -[MailAccount releaseAllForcedConnections](&v3, sel_releaseAllForcedConnections);
}

- (void)releaseAllConnectionsSynchronously
{
  -[IMAPAccount _releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:](self, "_releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:", 1, 1, 0, 1);
}

- (void)acquireNetworkAssertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id packetContextAssertion;
  void *v9;
  void *v10;

  -[IMAPAccount mf_lock](self, "mf_lock");
  if (!self->_packetContextAssertion)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[MailAccount displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("IMAP account %@ (%@)"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFNetworkController networkAssertionWithIdentifier:](MFNetworkController, "networkAssertionWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    packetContextAssertion = self->_packetContextAssertion;
    self->_packetContextAssertion = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_networkChanged, CFSTR("NetworkConfigurationDidChangeNotification"), v10);

  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

- (void)releaseNetworkAssertion
{
  -[IMAPAccount mf_lock](self, "mf_lock");
  unlockedReleaseNetworkAssertion(self);
  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

- (BOOL)connection:(id)a3 shouldHandleUntaggedResponse:(id)a4 forCommand:(id)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "isAlertResponse");
  if (v9)
  {
    objc_msgSend(v7, "userString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAPAccount handleAlertResponse:](self, "handleAlertResponse:", v10);
LABEL_3:

    goto LABEL_14;
  }
  if (objc_msgSend(v8, "command") == 8 && objc_msgSend(v7, "responseType") == 13)
  {
    objc_msgSend(v7, "mailboxName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAPAccount mailboxUidForName:](self, "mailboxUidForName:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "statusEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "objectForKey:", 0x1E4F2A178);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v10, "userInfoObjectForKey:", 0x1E4F2A178);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "intValue");

        if (v16 != objc_msgSend(v14, "unsignedIntValue"))
        {
          EFStringWithInt();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setUserInfoObject:forKey:", v17, 0x1E4F2A178);

        }
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", 0x1E4F2A1B8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        objc_msgSend(v10, "updateMostRecentStatusCount:", objc_msgSend(v18, "unsignedIntegerValue"));

    }
    goto LABEL_3;
  }
LABEL_14:

  return v9 ^ 1;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 forCommand:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "isAlertResponse"))
  {
    objc_msgSend(v7, "userString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAPAccount handleAlertResponse:](self, "handleAlertResponse:", v6);

  }
}

- (BOOL)canGoOffline
{
  return 1;
}

- (void)setIsOffline:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (setIsOffline__sOnceToken != -1)
      dispatch_once(&setIsOffline__sOnceToken, &__block_literal_global_7);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __28__IMAPAccount_setIsOffline___block_invoke_2;
    v5[3] = &unk_1E4E88DF0;
    v5[4] = self;
    v6 = v3;
    dispatch_async((dispatch_queue_t)setIsOffline__sOfflineStatusChangeQueue, v5);
  }
  else if (-[IMAPAccount isOffline](self, "isOffline") != v3)
  {
    if (v3)
      -[IMAPAccount _releaseAllConnectionsAndCallSuper:](self, "_releaseAllConnectionsAndCallSuper:", 0);
    atomic_store(v3, (unsigned __int8 *)&self->_isOffline);
  }
}

void __28__IMAPAccount_setIsOffline___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.mail.imap.offlinestatuschange", 0);
  v1 = (void *)setIsOffline__sOfflineStatusChangeQueue;
  setIsOffline__sOfflineStatusChangeQueue = (uint64_t)v0;

}

uint64_t __28__IMAPAccount_setIsOffline___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsOffline:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setSeparatorChar:(id)a3 serverNamespace:(id)a4
{
  id v6;
  int v7;
  NSString *v8;
  NSString *separatorChar;
  uint64_t v10;
  NSString *v11;
  NSString *serverNamespace;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[IMAPAccount mf_lock](self, "mf_lock");
  if (!v15 || self->_separatorChar && (objc_msgSend(v15, "isEqualToString:") & 1) != 0)
  {
    v7 = 0;
    if (!v6)
      goto LABEL_12;
  }
  else
  {
    v8 = (NSString *)objc_msgSend(v15, "copy");
    separatorChar = self->_separatorChar;
    self->_separatorChar = v8;

    -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
    v7 = 1;
    if (!v6)
      goto LABEL_12;
  }
  if (self->_separatorChar && objc_msgSend(v6, "hasSuffix:"))
  {
    objc_msgSend(v6, "substringWithRange:", 0, objc_msgSend(v6, "length") - -[NSString length](self->_separatorChar, "length"));
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  if ((objc_msgSend(v6, "isEqualToString:", self->_serverNamespace) & 1) == 0)
  {
    v11 = (NSString *)objc_msgSend(v6, "copy");
    serverNamespace = self->_serverNamespace;
    self->_serverNamespace = v11;

    -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
    v7 = 1;
  }
LABEL_12:
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  if (v7)
  {
    -[MailAccount allMailboxUids](self, "allMailboxUids");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeObjectsPerformSelector:", sel_flushCriteria);

  }
  -[IMAPAccount serverPathPrefixAccountValue](self, "serverPathPrefixAccountValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[IMAPAccount setServerPathPrefix:](self, "setServerPathPrefix:", v14);

}

- (void)_updateSeparatorAndNamespaceWithConnection:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSRecursiveLock lock](self->_connectionLock, "lock");
  if ((*((_BYTE *)self + 388) & 0x10) == 0)
  {
    objc_msgSend(v6, "separatorChar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverPathPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAPAccount setSeparatorChar:serverNamespace:](self, "setSeparatorChar:serverNamespace:", v4, v5);
    *((_BYTE *)self + 388) |= 0x10u;

  }
  -[NSRecursiveLock unlock](self->_connectionLock, "unlock");

}

- (id)_fetchAndSetSeparatorChar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    goto LABEL_2;
  -[IMAPAccount taskManager](self, "taskManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IMAPAccount taskManager](self, "taskManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchSeparatorChar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[IMAPAccount setSeparatorChar:serverNamespace:](self, "setSeparatorChar:serverNamespace:", v3, 0);
  }
  else
  {
    if (-[IMAPAccount isOffline](self, "isOffline"))
    {
LABEL_2:
      v3 = 0;
      return v3;
    }
    -[IMAPAccount connectionForMailbox:delegate:options:failedToSelectMailbox:](self, "connectionForMailbox:delegate:options:failedToSelectMailbox:", 0, self, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "separatorChar");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
        -[IMAPAccount setSeparatorChar:serverNamespace:](self, "setSeparatorChar:serverNamespace:", v8, 0);
      -[IMAPAccount checkInConnection:](self, "checkInConnection:", v7);
    }
    else
    {
      v8 = 0;
    }

    v3 = (void *)v8;
  }
  return v3;
}

- (BOOL)_hasCachedSeparatorChar
{
  NSString *separatorChar;
  BOOL v4;

  -[IMAPAccount mf_lock](self, "mf_lock");
  separatorChar = self->_separatorChar;
  if (separatorChar)
    v4 = -[NSString length](separatorChar, "length") != 0;
  else
    v4 = 0;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return v4;
}

- (id)lastKnownCapabilities
{
  NSArray *v3;

  -[MailAccount rootMailbox](self, "rootMailbox");

  -[IMAPAccount mf_lock](self, "mf_lock");
  v3 = self->_lastKnownCapabilities;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)_setCapabilities:(id)a3
{
  NSArray *lastKnownCapabilities;
  id v6;
  uint64_t v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  -[IMAPAccount mf_lock](self, "mf_lock");
  lastKnownCapabilities = self->_lastKnownCapabilities;
  if (v8 | (unint64_t)lastKnownCapabilities)
  {
    v6 = lastKnownCapabilities;
    objc_storeStrong((id *)&self->_lastKnownCapabilities, a3);
    -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
  }
  else
  {
    v6 = 0;
  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  if (v8 | (unint64_t)v6)
    v7 = objc_msgSend((id)v8, "isEqualToArray:", v6) ^ 1;
  else
    v7 = 0;
  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", v7);

}

- (id)fetchLimits
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  MFFetchLimits *v13;

  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFatPipe");
  +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPluggedIn");

  if ((v3 & v5 & 1) != 0)
  {
    v6 = 5242880;
    v7 = 209715200;
    v8 = 204472320;
  }
  else
  {
    v9 = objc_msgSend(v2, "is3GConnection");
    v10 = v3 | objc_msgSend(v2, "is4GConnection");
    v11 = 0x4000;
    if (v9)
      v11 = 0x80000;
    v12 = 4096;
    if (v9)
      v12 = 0x10000;
    if (v10)
      v8 = 0x200000;
    else
      v8 = v11;
    if (v10)
      v6 = 0x40000;
    else
      v6 = v12;
    v7 = v8 | v6;
  }
  v13 = objc_alloc_init(MFFetchLimits);
  -[MFFetchLimits setFetchMinBytes:](v13, "setFetchMinBytes:", v8);
  -[MFFetchLimits setMinBytesLeft:](v13, "setMinBytesLeft:", v6);
  -[MFFetchLimits setFetchMaxBytes:](v13, "setFetchMaxBytes:", v7);

  return v13;
}

- (BOOL)xListSupportedOnConnection:(id)a3
{
  return 0;
}

- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4 onlySubscribed:(BOOL)a5
{
  -[IMAPAccount _listingForMailboxUid:listAllChildren:onlySubscribed:statusDataItems:withConnection:statusEntriesByMailbox:](self, "_listingForMailboxUid:listAllChildren:onlySubscribed:statusDataItems:withConnection:statusEntriesByMailbox:", a3, a4, a5, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4
{
  -[IMAPAccount _listingForMailboxUid:listAllChildren:onlySubscribed:](self, "_listingForMailboxUid:listAllChildren:onlySubscribed:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  int v40;
  id v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  objc_super v49;
  objc_super v50;
  objc_super v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v48 = a6;
  if (a7)
    __assert_rtn("-[IMAPAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:]", "IMAPAccount.m", 1684, "creationOption == MailboxCreationOptionDefault");
  -[MailAccount rootMailbox](self, "rootMailbox");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", v14) || (v15 = v13) == 0)
  {

LABEL_7:
    -[NSRecursiveLock lock](self->_connectionLock, "lock");
    objc_msgSend(v12, "accountRelativePath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAPAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", v19, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
LABEL_31:
      -[NSRecursiveLock unlock](self->_connectionLock, "unlock");
      v16 = v13;
      goto LABEL_32;
    }
    v47 = v13;
    -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v13, "pathComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = a5;
    -[IMAPAccount separatorChar](self, "separatorChar", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v25);
          v29 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          if (objc_msgSend(v22, "length"))
          {
            if (!v24)
            {

              v38 = 0;
              goto LABEL_23;
            }
            objc_msgSend(v22, "appendString:", v24);
          }
          objc_msgSend(v22, "appendString:", v29);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v26)
          continue;
        break;
      }
    }

    -[IMAPAccount taskManager](self, "taskManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (!v31)
    {
      -[IMAPAccount taskManager](self, "taskManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "createMailbox:", v22);

      v51.receiver = self;
      v51.super_class = (Class)IMAPAccount;
      v18 = -[MailAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:](&v51, sel__newMailboxWithParent_name_attributes_dictionary_withCreationOption_, v12, v47, v43, v48, 0);
      if ((v33 & 1) != 0)
      {
LABEL_30:

        v13 = v47;
        goto LABEL_31;
      }
LABEL_20:
      objc_msgSend(MEMORY[0x1E0D1EB00], "actionWithID:toCreateMailbox:mailboxName:", 0, objc_msgSend(v18, "databaseID"), v22);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MailAccount library](self, "library");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "persistence");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "mailboxActionPersistence");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccount identifier](self, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "saveMailboxActionForAccountID:action:", v36, v45);

      -[IMAPAccount taskManager](self, "taskManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localMailboxesDidChange");

      goto LABEL_30;
    }
    v38 = 1;
LABEL_23:
    -[IMAPAccount connectionForMailbox:delegate:options:failedToSelectMailbox:](self, "connectionForMailbox:delegate:options:failedToSelectMailbox:", 0, self, 9, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAPAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", v19, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (v46)
        -[IMAPAccount checkInConnection:](self, "checkInConnection:");
    }
    else
    {
      objc_msgSend(v47, "mf_fileSystemString");
      v39 = objc_claimAutoreleasedReturnValue();

      v47 = (void *)v39;
      if (v38)
      {
        if (v46)
        {
          v40 = objc_msgSend(v46, "createMailbox:", v22);
          -[IMAPAccount checkInConnection:](self, "checkInConnection:", v46);
        }
        else
        {
          v40 = 1;
        }
        v50.receiver = self;
        v50.super_class = (Class)IMAPAccount;
        v18 = -[MailAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:](&v50, sel__newMailboxWithParent_name_attributes_dictionary_withCreationOption_, v12, v39, v43, v48, 0);
        if (v40)
        {
          v49.receiver = self;
          v49.super_class = (Class)IMAPAccount;
          v42 = -[MailAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:](&v49, sel__newMailboxWithParent_name_attributes_dictionary_withCreationOption_, v12, v39, v43, v48, 0);

          v18 = v42;
          if (v46)
            goto LABEL_30;
        }
        else
        {

          if (v46)
            goto LABEL_30;
        }
        goto LABEL_20;
      }
    }

    goto LABEL_30;
  }
  v16 = v15;
  v17 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("INBOX"));

  if (v17)
    goto LABEL_7;
  v18 = -[MailAccount _copyMailboxWithParent:name:attributes:dictionary:](self, "_copyMailboxWithParent:name:attributes:dictionary:", v12, v16, a5, v48);
  v19 = 0;
LABEL_32:

  return v18;
}

- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_super v25;

  v4 = a4;
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IMAPAccount;
  v7 = -[MailAccount _deleteMailbox:reflectToServer:](&v25, sel__deleteMailbox_reflectToServer_, v6, v4);
  if (v7 && v4)
  {
    -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAPAccount unselectMailbox:](self, "unselectMailbox:", v8);
    -[IMAPAccount taskManager](self, "taskManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[IMAPAccount taskManager](self, "taskManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "deleteMailbox:", v8);

      if ((v11 & 1) != 0)
      {
        v12 = 0;
LABEL_7:
        LOBYTE(v7) = 1;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      -[IMAPAccount connectionForMailbox:delegate:options:failedToSelectMailbox:](self, "connectionForMailbox:delegate:options:failedToSelectMailbox:", 0, self, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      if (v13)
      {
        v14 = objc_msgSend(v13, "deleteMailbox:", v8);
        -[IMAPAccount checkInConnection:](self, "checkInConnection:", v12);
        if ((v14 & 1) != 0)
          goto LABEL_7;
        if ((objc_msgSend(v6, "isStore") & 1) != 0)
        {
          LOBYTE(v7) = 0;
          goto LABEL_11;
        }
        objc_msgSend(v6, "parent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          LOBYTE(v7) = 0;
          goto LABEL_10;
        }
        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAPAccount _listingForMailboxUid:listAllChildren:](self, "_listingForMailboxUid:listAllChildren:", v17, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count")
          && (objc_msgSend(v6, "name"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v22, "mf_indexOfMailboxDictionaryWithName:", v23),
              v23,
              v24 != 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(v18, "setError:", v20);
          LOBYTE(v7) = 0;
        }
        else
        {
          objc_msgSend(v18, "setError:", 0);
          LOBYTE(v7) = 1;
        }

LABEL_9:
LABEL_10:

        goto LABEL_11;
      }
    }
    -[MailAccount library](self, "library");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "persistence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mailboxActionPersistence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EB00], "actionWithID:toDeleteMailbox:mailboxName:", 0, objc_msgSend(v6, "databaseID"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAccount identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveMailboxActionForAccountID:action:", v19, v18);

    -[IMAPAccount taskManager](self, "taskManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localMailboxesDidChange");
    v12 = 0;
    LOBYTE(v7) = 1;
    goto LABEL_9;
  }
LABEL_12:

  return v7;
}

- (void)_setSpecialMailbox:(id)a3 forType:(int64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IMAPAccount;
  -[MailAccount _setSpecialMailbox:forType:](&v7, sel__setSpecialMailbox_forType_, v6, a4);
  if (v6 && objc_msgSend(v6, "isValid"))
    -[IMAPAccount setStoreMailboxType:onServer:](self, "setStoreMailboxType:onServer:", a4, 1);

}

- (void)_renameLocalSpecialMailboxesToName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (-[IMAPAccount storeMailboxTypeOnServer:](self, "storeMailboxTypeOnServer:", 5))
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MailAccount _localMailboxNameForType:usingDisplayName:](self, "_localMailboxNameForType:usingDisplayName:", 5, v18);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renameMailbox:newName:parent:", v6, v7, v9);

    v4 = (void *)v7;
    v5 = v6;
  }
  if (!-[IMAPAccount storeMailboxTypeOnServer:](self, "storeMailboxTypeOnServer:", 4))
  {
    -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MailAccount _localMailboxNameForType:usingDisplayName:](self, "_localMailboxNameForType:usingDisplayName:", 4, v18);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "renameMailbox:newName:parent:", v10, v11, v13);

    v4 = (void *)v11;
    v5 = v10;
  }
  if (-[IMAPAccount storeMailboxTypeOnServer:](self, "storeMailboxTypeOnServer:", 3))
  {
    v14 = v4;
    v15 = v5;
  }
  else
  {
    -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 3, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MailAccount _localMailboxNameForType:usingDisplayName:](self, "_localMailboxNameForType:usingDisplayName:", 3, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "parent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "renameMailbox:newName:parent:", v15, v14, v17);

  }
}

- (id)allMailMailboxUid
{
  void *v2;
  void *v3;

  -[MailAccount rootMailbox](self, "rootMailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descendantWithExtraAttribute:", CFSTR("\\All"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSpecialMailbox:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMAPAccount;
  if (-[MailAccount isSpecialMailbox:](&v8, sel_isSpecialMailbox_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[IMAPAccount specialUseAttributesForMailbox:](self, "specialUseAttributesForMailbox:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (id)specialUseAttributesForMailbox:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (specialUseAttributesForMailbox__onceToken != -1)
    dispatch_once(&specialUseAttributesForMailbox__onceToken, &__block_literal_global_183);
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "extraAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "intersectSet:", specialUseAttributesForMailbox__knownSpecialAttributes);
  return v6;
}

void __46__IMAPAccount_specialUseAttributesForMailbox___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("\\All"), CFSTR("\\Junk"), CFSTR("\\Sent"), CFSTR("\\Trash"), CFSTR("\\Drafts"), CFSTR("\\Archive"), CFSTR("\\Flagged"), 0);
  v1 = (void *)specialUseAttributesForMailbox__knownSpecialAttributes;
  specialUseAttributesForMailbox__knownSpecialAttributes = v0;

}

void __83__IMAPAccount_getMailboxListWithConnection_statusDataItems_statusEntriesByMailbox___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("AccountMailboxListingDidFetch"), *(_QWORD *)(a1 + 32), 0);

}

void __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "mailboxUidForName:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = +[MFMailboxUid isDraftsMailboxType:](MFMailboxUid, "isDraftsMailboxType:", objc_msgSend(v5, "mailboxType"));

    if (!v7)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", 0x1E4F2A1B8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v5, "updateMostRecentStatusCount:", objc_msgSend(v8, "unsignedIntegerValue"));

    }
  }

}

uint64_t __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isStore"))
    v3 = +[MFMailboxUid isDraftsMailboxType:](MFMailboxUid, "isDraftsMailboxType:", objc_msgSend(v2, "mailboxType")) ^ 1;
  else
    v3 = 0;

  return v3;
}

id __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "nameForMailboxUid:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)_synchronouslyLoadListingForParent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v8 = a3;
  -[IMAPAccount taskManager](self, "taskManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[IMAPAccount _listingForMailboxUid:listAllChildren:](self, "_listingForMailboxUid:listAllChildren:", v8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v8, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MailAccount _loadMailboxListingIntoCache:attributes:children:parent:](self, "_loadMailboxListingIntoCache:attributes:children:parent:", v6, 0, v5, v8);

      if (v7)
        -[IMAPAccount _mailboxListingChanged](self, "_mailboxListingChanged");
    }

  }
}

- (void)_waitForMailboxListingLoadToComplete
{
  -[IMAPAccount mf_lock](self, "mf_lock");
  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

- (void)_mailboxesWereRemovedFromTree:(id)a3 withFileSystemPaths:(id)a4
{
  id v6;
  id v7;
  MFInvocationQueue *v8;
  void *v9;
  _MFIMAPMailboxDeletionQueueEntry *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  -[IMAPAccount mf_lock](self, "mf_lock");
  if (!sMailboxDeletionQueue)
  {
    v8 = objc_alloc_init(MFInvocationQueue);
    v9 = (void *)sMailboxDeletionQueue;
    sMailboxDeletionQueue = (uint64_t)v8;

  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  v10 = objc_alloc_init(_MFIMAPMailboxDeletionQueueEntry);
  -[_MFIMAPMailboxDeletionQueueEntry setUrls:](v10, "setUrls:", v6);
  -[_MFIMAPMailboxDeletionQueueEntry setPaths:](v10, "setPaths:", v7);
  -[_MFIMAPMailboxDeletionQueueEntry setAccount:](v10, "setAccount:", self);
  v11 = objc_opt_class();
  MFLookupLocalizedString(CFSTR("IMAP_REMOVING_CACHE_FILES"), CFSTR("Removing old cache files…"), CFSTR("Message"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", sel__deleteQueuedMailboxes_, v11, v10, v12, 12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)sMailboxDeletionQueue, "addInvocation:", v13);
  v14.receiver = self;
  v14.super_class = (Class)IMAPAccount;
  -[MailAccount _mailboxesWereRemovedFromTree:withFileSystemPaths:](&v14, sel__mailboxesWereRemovedFromTree_withFileSystemPaths_, v6, v7);

}

+ (void)_deleteQueuedMailboxes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_waitForMailboxListingLoadToComplete");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v18, "urls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    v9 = (void *)*MEMORY[0x1E0C9B0D0];
    do
    {
      objc_msgSend(v18, "urls");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "mailboxUidFromActiveAccountsForURL:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12 || (objc_msgSend(v12, "isValid") & 1) == 0)
      {
        objc_msgSend(v18, "paths");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndex:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 != v9)
          v16 = (id)MFRemoveItemAtPath();
        objc_msgSend(v5, "addObject:", v11);

      }
      ++v8;
    }
    while (v7 != v8);
  }
  objc_msgSend(v4, "library");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteMailboxes:account:", v5, v4);

}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMAPAccount;
  if (-[MailAccount newMailboxNameIsAcceptable:reasonForFailure:](&v14, sel_newMailboxNameIsAcceptable_reasonForFailure_, v6, a4))
  {
    -[IMAPAccount separatorChar](self, "separatorChar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(v6, "rangeOfString:", v7);
      v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;
      if (!a4)
      {
LABEL_10:

        goto LABEL_11;
      }
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        MFLookupLocalizedString(CFSTR("MAILBOX_NAME_INCLUDES_PATH_SEPARATOR"), CFSTR("Mailbox names may not include “%@”."), CFSTR("Delayed"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v11, v7);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v12;

        v9 = 0;
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
LABEL_9:
      v9 = 1;
      goto LABEL_10;
    }
    *a4 = 0;
    goto LABEL_9;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MFMailboxUid *inboxMailboxUid;
  MFMailboxUid *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v49;
  void *v50;
  void *v51;
  id v52;
  objc_super v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v52 = a5;
  -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  inboxMailboxUid = self->super._inboxMailboxUid;
  if (inboxMailboxUid && -[MFMailboxUid isEqual:](inboxMailboxUid, "isEqual:", v8))
    v12 = self->super._inboxMailboxUid;
  else
    v12 = 0;
  -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", v52);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[IMAPAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", v9);
  else
    objc_msgSend(v8, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    -[IMAPAccount separatorChar](self, "separatorChar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:", v16);

    objc_msgSend(v15, "appendString:", v14);
    v14 = v15;
  }
  if (!v14)
  {
    v26 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAPAccount taskManager](self, "taskManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v55 = v50;
      v56 = 2114;
      v57 = v51;
      _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Task manager mailbox %{public}@ to mailbox %{public}@", buf, 0x16u);
    }

    -[IMAPAccount taskManager](self, "taskManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "renameMailbox:toMailbox:", v10, v14);

    if ((v20 & 1) == 0)
    {
      -[MailAccount library](self, "library");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "persistence");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mailboxActionPersistence");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D1EB00], "actionWithID:toRenameMailbox:mailboxName:toName:", 0, objc_msgSend(v8, "databaseID"), v10, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAccount identifier](self, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "saveMailboxActionForAccountID:action:", v25, v24);

    }
    v26 = 0;
    goto LABEL_17;
  }
  if (-[IMAPAccount isOffline](self, "isOffline"))
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("NO_OFFLINE_MAILBOX_RENAMING"), CFSTR("You can’t rename mailboxes while an account is offline."), CFSTR("Delayed"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1034, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setError:", v32);

    +[IMAPAccount log](IMAPAccount, "log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[IMAPAccount renameMailbox:newName:parent:].cold.1((uint64_t)v51, v33, v34, v35, v36, v37, v38, v39);
LABEL_36:

    v29 = 0;
    v26 = 0;
    goto LABEL_37;
  }
  -[IMAPAccount connectionForMailbox:delegate:options:failedToSelectMailbox:](self, "connectionForMailbox:delegate:options:failedToSelectMailbox:", 0, self, 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[IMAPAccount renameMailbox:newName:parent:].cold.2((uint64_t)v51, v33, v42, v43, v44, v45, v46, v47);
    goto LABEL_36;
  }
  +[IMAPAccount log](IMAPAccount, "log");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v55 = v50;
    v56 = 2114;
    v57 = v51;
    _os_log_impl(&dword_1A4F90000, v40, OS_LOG_TYPE_DEFAULT, "Renaming mailbox %{public}@ to mailbox %{public}@", buf, 0x16u);
  }

  v49 = objc_msgSend(v26, "renameMailbox:toMailbox:", v10, v14);
  +[IMAPAccount log](IMAPAccount, "log");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v55) = v49;
    _os_log_impl(&dword_1A4F90000, v41, OS_LOG_TYPE_DEFAULT, "renameMailbox returnValue:%{BOOL}d", buf, 8u);
  }

  -[IMAPAccount checkInConnection:](self, "checkInConnection:", v26);
  if (!v49)
  {
LABEL_22:
    v29 = 0;
    if (!v12)
      goto LABEL_37;
LABEL_23:
    -[MailAccount resetSpecialMailboxes](self, "resetSpecialMailboxes");
    goto LABEL_37;
  }
LABEL_17:
  if (v12)
    -[MailAccount _assignSpecialMailboxToAppropriateIvar:forType:](self, "_assignSpecialMailboxToAppropriateIvar:forType:", 0, 7);
  v53.receiver = self;
  v53.super_class = (Class)IMAPAccount;
  -[MailAccount renameMailbox:newName:parent:](&v53, sel_renameMailbox_newName_parent_, v8, v9, v52);
  objc_msgSend(v8, "store");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reselectMailbox");

  -[IMAPAccount taskManager](self, "taskManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localMailboxesDidChange");

  v29 = 1;
  if (v12)
    goto LABEL_23;
LABEL_37:

  return v29;
}

- (id)nameForMailboxUid:(id)a3
{
  -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mailboxUidForName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = -[__CFString caseInsensitiveCompare:](v4, "caseInsensitiveCompare:", CFSTR("INBOX"));
    if (!v6)
    {

      v5 = CFSTR("INBOX");
    }
    -[IMAPAccount serverPathPrefix](self, "serverPathPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAPAccount separatorChar](self, "separatorChar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && objc_msgSend(v7, "length") && v6)
    {
      v9 = -[__CFString rangeOfString:options:](v5, "rangeOfString:options:", v7, 8);
      if (!v10)
      {

        v5 = 0;
        v15 = 0;
LABEL_25:

        goto LABEL_26;
      }
      -[__CFString substringFromIndex:](v5, "substringFromIndex:", v9 + v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v8 && v11 && (v12 = -[__CFString rangeOfString:options:](v11, "rangeOfString:options:", v8, 8), v13))
      {
        -[__CFString substringFromIndex:](v11, "substringFromIndex:", v12 + v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v5 = (__CFString *)v14;
      }
      else
      {
        v5 = v11;
      }
    }
    v15 = 0;
    if (v8 && v5)
    {
      -[__CFString componentsSeparatedByString:](v5, "componentsSeparatedByString:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MailAccount rootMailbox](self, "rootMailbox");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v24;
        do
        {
          v20 = 0;
          v21 = v15;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(v21, "childWithName:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20), (_QWORD)v23);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            ++v20;
            v21 = v15;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v18);
      }

    }
    goto LABEL_25;
  }
  v15 = 0;
LABEL_26:

  return v15;
}

- (BOOL)canMailboxBeDeleted:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->super._inboxMailboxUid) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)IMAPAccount;
    v5 = -[MailAccount canMailboxBeDeleted:](&v7, sel_canMailboxBeDeleted_, v4);
  }

  return v5;
}

- (id)serverNamespace
{
  NSString *v3;

  -[IMAPAccount mf_lock](self, "mf_lock");
  v3 = self->_serverNamespace;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setServerNamespace:(id)a3
{
  char v4;
  NSString *v5;
  NSString *serverNamespace;
  void *v7;
  id v8;

  v8 = a3;
  -[IMAPAccount mf_lock](self, "mf_lock");
  v4 = objc_msgSend(v8, "isEqualToString:", self->_serverNamespace);
  if ((v4 & 1) == 0)
  {
    v5 = (NSString *)objc_msgSend(v8, "copy");
    serverNamespace = self->_serverNamespace;
    self->_serverNamespace = v5;

    -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  if ((v4 & 1) == 0)
  {
    -[MailAccount allMailboxUids](self, "allMailboxUids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "makeObjectsPerformSelector:", sel_flushCriteria);

  }
}

- (void)setServerPathPrefix:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;

  v12 = (const __CFString *)a3;
  -[IMAPAccount serverPathPrefixAccountValue](self, "serverPathPrefixAccountValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (!v12)
    v5 = &stru_1E4F1C8F8;
  v13 = (id)v5;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1E4F1C8F8;
  -[IMAPAccount separatorChar](self, "separatorChar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7 = objc_msgSend(v13, "rangeOfString:options:", v8, 12);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v13, "substringToIndex:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v9;
    }
  }
  v10 = objc_msgSend(v13, "length", v7);
  if (v10 != -[__CFString length](v6, "length") || (objc_msgSend(v13, "isEqual:", v6) & 1) == 0)
  {
    -[MailAccount allMailboxUids](self, "allMailboxUids");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "makeObjectsPerformSelector:", sel_URLString);

    -[IMAPAccount mf_lock](self, "mf_lock");
    if (v13 && objc_msgSend(v13, "length"))
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v13, CFSTR("ServerPathPrefix"));
    else
      -[MFAccount removeAccountPropertyForKey:](self, "removeAccountPropertyForKey:", CFSTR("ServerPathPrefix"));
    -[IMAPAccount mf_unlock](self, "mf_unlock");
  }

}

- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[MailAccount _shouldLogDeleteActivity](self, "_shouldLogDeleteActivity"))
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[MFAccount ef_publicDescription](self, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ef_publicDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting messages from mailbox: %{public}@ older than %d days", buf, 0x1Cu);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)IMAPAccount;
  -[MailAccount deleteMessagesFromMailboxUid:olderThanNumberOfDays:](&v10, sel_deleteMessagesFromMailboxUid_olderThanNumberOfDays_, v6, v4);

}

- (BOOL)supportsAppend
{
  return 1;
}

- (BOOL)supportsRemoteAppend
{
  return 1;
}

- (BOOL)supportsMailboxEditing
{
  return 1;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 1;
}

- (double)lastPushRegistration
{
  double lastPushRegistration;

  -[IMAPAccount mf_lock](self, "mf_lock");
  lastPushRegistration = self->_lastPushRegistration;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return lastPushRegistration;
}

- (void)setLastPushRegistration:(double)a3
{
  -[IMAPAccount mf_lock](self, "mf_lock");
  self->_lastPushRegistration = a3;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

- (BOOL)mustRegisterForPushOnNextConnection
{
  _BOOL4 v3;

  -[IMAPAccount mf_lock](self, "mf_lock");
  v3 = (*((unsigned __int8 *)self + 388) >> 1) & 1;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setMustRegisterForPushOnNextConnection:(BOOL)a3
{
  _BOOL4 v3;
  char v5;

  v3 = a3;
  -[IMAPAccount mf_lock](self, "mf_lock");
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  *((_BYTE *)self + 388) = *((_BYTE *)self + 388) & 0xFD | v5;
  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

- (void)setSupportedPushServiceLevel:(int64_t)a3
{
  -[IMAPAccount mf_lock](self, "mf_lock");
  if (self->_supportedPushServiceLevel != a3)
  {
    self->_supportedPushServiceLevel = a3;
    -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

- (id)mailboxesRegisteredForPushByHash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  -[MailAccount rootMailbox](self, "rootMailbox");

  -[IMAPAccount mf_lock](self, "mf_lock");
  v3 = (void *)-[NSMutableDictionary copy](self->_pushRegisteredMailboxes, "copy");
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__IMAPAccount_mailboxesRegisteredForPushByHash__block_invoke;
  v9[3] = &unk_1E4E890B0;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __47__IMAPAccount_mailboxesRegisteredForPushByHash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "mf_encodedIMAPMailboxName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxUidForName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "redactedName:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v5);
  }
  else
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "#aps-push warning, can't find mailbox with name '%{public}@' (%{public}@)", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)updatePushRegisteredMailboxes:(id)a3
{
  NSMutableDictionary *pushRegisteredMailboxes;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id obj;
  uint64_t v22;
  IMAPAccount *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v23 = self;
  -[IMAPAccount mf_lock](self, "mf_lock");
  pushRegisteredMailboxes = self->_pushRegisteredMailboxes;
  if (pushRegisteredMailboxes)
  {
    -[NSMutableDictionary removeAllObjects](pushRegisteredMailboxes, "removeAllObjects");
  }
  else
  {
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v6 = self->_pushRegisteredMailboxes;
    self->_pushRegisteredMailboxes = v5;

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v20;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v22 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v9 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A85B0E24]();
        objc_msgSend(v9, "mf_decodedIMAPMailboxName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copy");

        objc_msgSend(v12, "dataUsingEncoding:allowLossyConversion:", 4, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ef_md5Digest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ef_hexString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSMutableDictionary setObject:forKey:](v23->_pushRegisteredMailboxes, "setObject:forKey:", v12, v15);
        }
        else
        {
          objc_msgSend(v12, "mf_encodedIMAPMailboxName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMAPAccount mailboxUidForName:](v23, "mailboxUidForName:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "redactedName:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMAPAccount log](IMAPAccount, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v18;
            _os_log_error_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_ERROR, "#aps-push failed to generate hash for mailbox named '%{public}@'", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v10);

        ++v8;
      }
      while (v7 != v8);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v7);
  }

  -[MailAccount _incrementCacheDirtyCount](v23, "_incrementCacheDirtyCount");
  -[IMAPAccount mf_unlock](v23, "mf_unlock");

}

- (void)setAPSTopic:(id)a3
{
  NSString *v5;
  NSObject *v6;
  void *v7;
  int Style;
  NSString *apsTopic;
  NSString *v10;
  void *v11;
  void *v12;
  int v13;
  NSString *v14;
  __int16 v15;
  IMAPAccount *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (NSString *)a3;
  +[IMAPAccount log](IMAPAccount, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "#aps-push Setting aps-topic '%@' for account %@", (uint8_t *)&v13, 0x16u);
  }

  -[MailAccount uniqueIdForPersistentConnection](self, "uniqueIdForPersistentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Style = PCSettingsGetStyle();
  -[IMAPAccount mf_lock](self, "mf_lock");
  apsTopic = self->_apsTopic;
  if (apsTopic != v5)
  {
    v10 = apsTopic;
    objc_storeStrong((id *)&self->_apsTopic, a3);
    -[MailAccount _incrementCacheDirtyCount](self, "_incrementCacheDirtyCount");
    +[MFAPSManager sharedManager](MFAPSManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v5 || !v10)
    {
      if (!v5 || v10)
      {
        if (!-[NSString isEqualToString:](v5, "isEqualToString:", v10))
          objc_msgSend(v12, "swapTopic:forNewTopic:", v10, v5);
      }
      else if ((*((_BYTE *)self + 388) & 4) != 0 && !Style)
      {
        objc_msgSend(v11, "startWatchingForTopic:", v5);
      }
    }
    else
    {
      objc_msgSend(v11, "stopWatchingForTopic:", v10);
    }

  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");

}

- (void)_schedulePushRegistrationConnection
{
  NSObject *v3;
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  IMAPAccount *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[IMAPAccount mf_lock](self, "mf_lock");
  if ((*((_BYTE *)self + 388) & 2) == 0)
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = self;
      v4 = v9;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "#aps-push account <%@:%p> scheduling push registration connection", buf, 0x16u);

    }
    *((_BYTE *)self + 388) |= 2u;
    v5 = dispatch_time(0, 2000000000);
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__IMAPAccount__schedulePushRegistrationConnection__block_invoke;
    block[3] = &unk_1E4E88DC8;
    block[4] = self;
    dispatch_after(v5, v6, block);

  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
}

void __50__IMAPAccount__schedulePushRegistrationConnection__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  char v3;
  int v4;
  int v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  v3 = v2[388];
  v4 = objc_msgSend(v2, "mustRegisterForPushOnNextConnection");
  v5 = v4;
  if ((v3 & 4) != 0 && v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "taskManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 == 0;
    +[IMAPAccount log](IMAPAccount, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ forcing push registration connection", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "authenticatedConnection");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject logout](v8, "logout");
    }
    else if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v18 = 138412290;
      v19 = v10;
      v11 = "#aps-push account %@ IMAPv4 not forcing push registration connection";
      v12 = v8;
      v13 = 12;
LABEL_13:
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v13);
    }
  }
  else
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "NO";
      v15 = *(_QWORD *)(a1 + 32);
      if ((v3 & 4) != 0)
        v16 = "YES";
      else
        v16 = "NO";
      v18 = 138412802;
      v19 = v15;
      v20 = 2080;
      if (v5)
        v14 = "YES";
      v21 = v16;
      v22 = 2080;
      v23 = v14;
      v11 = "#aps-push account %@ will NOT force push registration connection, didRequestPushRegistration: %s, mustRegist"
            "erOnNextConnection: %s";
      v12 = v8;
      v13 = 32;
      goto LABEL_13;
    }
  }

}

- (BOOL)shouldRegisterForPush
{
  int Style;
  int v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  double Current;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  _BYTE v20[18];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[IMAPAccount _hasCachedSeparatorChar](self, "_hasCachedSeparatorChar"))
  {
    -[MailAccount uniqueIdForPersistentConnection](self, "uniqueIdForPersistentConnection");
    Style = PCSettingsGetStyle();
    if (Style)
    {
      v4 = Style;
      MFLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v19 = 67109378;
        *(_DWORD *)v20 = v4;
        *(_WORD *)&v20[4] = 2112;
        *(_QWORD *)&v20[6] = self;
        _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, "#aps-push MCC push settings are not set to push (%d != PCStylePush) for account %@", (uint8_t *)&v19, 0x12u);
      }
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[IMAPAccount pushedMailboxUids](self, "pushedMailboxUids");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "initWithSet:", v8);

      -[IMAPAccount _externalMailboxUids](self, "_externalMailboxUids");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject unionSet:](v5, "unionSet:", v9);

      if (!-[NSObject count](v5, "count"))
      {
        +[IMAPAccount log](IMAPAccount, "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412290;
          *(_QWORD *)v20 = self;
          _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ has no pushed mailboxes, skipping", (uint8_t *)&v19, 0xCu);
        }

        v6 = 0;
        -[IMAPAccount setMustRegisterForPushOnNextConnection:](self, "setMustRegisterForPushOnNextConnection:", 0);
        goto LABEL_19;
      }
      Current = CFAbsoluteTimeGetCurrent();
      -[IMAPAccount lastPushRegistration](self, "lastPushRegistration");
      v12 = v11;
      v13 = -[IMAPAccount mustRegisterForPushOnNextConnection](self, "mustRegisterForPushOnNextConnection");
      v14 = Current - v12;
      v15 = v14 >= 82800.0 || v13;
      if ((v15 & 1) != 0)
      {
        v6 = 1;
LABEL_19:

        return v6;
      }
      +[IMAPAccount log](IMAPAccount, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        *(_QWORD *)v20 = self;
        *(_WORD *)&v20[8] = 2048;
        *(double *)&v20[10] = v14;
        _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ last registered for push %.3f seconds ago", (uint8_t *)&v19, 0x16u);
      }

    }
    v6 = 0;
    goto LABEL_19;
  }
  return 0;
}

- (void)serverRegisteredMailboxes:(id)a3 withTopic:(id)a4 version:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[IMAPAccount log](IMAPAccount, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 1024;
    v18 = a5;
    _os_log_debug_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEBUG, "#aps-push {mailboxes=%@, topic=%@, version=%d}", (uint8_t *)&v13, 0x1Cu);
  }

  v11 = -[IMAPAccount supportedPushServiceLevel](self, "supportedPushServiceLevel");
  -[IMAPAccount updatePushRegisteredMailboxes:](self, "updatePushRegisteredMailboxes:", v8);
  -[IMAPAccount setSupportedPushServiceLevel:](self, "setSupportedPushServiceLevel:", a5);
  -[IMAPAccount setAPSTopic:](self, "setAPSTopic:", v9);
  if (a5 >= 1)
    -[IMAPAccount setLastPushRegistration:](self, "setLastPushRegistration:", CFAbsoluteTimeGetCurrent());
  if (v11 != a5 && (*((_BYTE *)self + 388) & 4) != 0)
  {
    if (a5 >= 1 && v11 < 0)
    {
      -[IMAPAccount startListeningForNotifications](self, "startListeningForNotifications");
    }
    else if (a5 <= 0)
    {
      +[MFAPSManager sharedManager](MFAPSManager, "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopWatchingForTopic:", v9);

    }
  }
  -[MailAccount _writeMailboxCacheWithPrejudice:](self, "_writeMailboxCacheWithPrejudice:", 1);

}

- (id)_notificationNameForMailbox:(id)a3 withPrefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@.%@"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_notesPrefix
{
  return -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("NotesNotificationPrefix"));
}

- (BOOL)_registerPushNotificationPrefix:(id)a3 forMailboxNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  id v21;

  v6 = a3;
  v7 = a4;
  -[IMAPAccount mf_lock](self, "mf_lock");
  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("NotesPushedMailboxes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("NotesNotificationPrefix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 && (objc_msgSend(v9, "isEqualToString:", v6) & 1) == 0)
  {
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v6, CFSTR("NotesNotificationPrefix"));
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  -[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", CFSTR("NotesPushedMailboxes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mutableCopy");

  v14 = objc_msgSend(v7, "mutableCopy");
  objc_msgSend((id)v13, "sortUsingSelector:", sel_localizedCompare_);
  objc_msgSend((id)v14, "sortUsingSelector:", sel_localizedCompare_);
  if (!(v13 | v14) || v14 && (objc_msgSend((id)v13, "isEqual:", v14) & 1) == 0)
  {
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", v7, CFSTR("NotesPushedMailboxes"));
    v11 = 1;
  }
  -[IMAPAccount mf_unlock](self, "mf_unlock");
  -[IMAPAccount setIsOffline:](self, "setIsOffline:", 0);
  -[IMAPAccount startListeningForNotifications](self, "startListeningForNotifications");
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isEqualToArray:", v8) & 1) != 0)
      goto LABEL_14;
  }
  v21 = v6;
  v15 = v10;
  v16 = -[IMAPAccount _copyMailboxListForNames:](self, "_copyMailboxListForNames:", v7);
  v17 = objc_msgSend(v16, "count");
  v18 = objc_msgSend(v7, "count");

  v19 = v17 == v18;
  v10 = v15;
  v6 = v21;
  if (v19)
  {
LABEL_14:
    -[IMAPAccount _schedulePushRegistrationConnection](self, "_schedulePushRegistrationConnection");
  }
  else
  {
    -[IMAPAccount resetMailboxTimer](self, "resetMailboxTimer");
    -[IMAPAccount fetchMailboxList](self, "fetchMailboxList");
  }
  if (v11)
    -[MFAccount savePersistentAccount](self, "savePersistentAccount");

  return 1;
}

- (id)_copyMailboxListForNames:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
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
          -[IMAPAccount mailboxUidForName:](self, "mailboxUidForName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

  }
  return v5;
}

- (id)_copyMailboxListPreferenceForKey:(id)a3
{
  void *v4;
  id v5;

  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMAPAccount _copyMailboxListForNames:](self, "_copyMailboxListForNames:", v4);

  return v5;
}

- (id)_copyUserPushedMailboxes
{
  return -[IMAPAccount _copyMailboxListPreferenceForKey:](self, "_copyMailboxListPreferenceForKey:", CFSTR("PushedMailboxes"));
}

- (id)_copyPushedMailboxesForPrefix:(id)a3
{
  return -[IMAPAccount _copyMailboxListPreferenceForKey:](self, "_copyMailboxListPreferenceForKey:", CFSTR("NotesPushedMailboxes"));
}

- (void)changePushedMailboxUidsAdded:(id)a3 deleted:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  id v23;
  unint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = (unint64_t)a3;
  v23 = a4;
  if (-[IMAPAccount supportsUserPushedMailboxes](self, "supportsUserPushedMailboxes"))
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    -[IMAPAccount pushedMailboxUids](self, "pushedMailboxUids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend((id)v24, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v9);

    }
    v10 = (unint64_t)v23;
    if (v23)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v11 = v23;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v31;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v12);
      }

      v10 = (unint64_t)v23;
    }
    if (v24 | v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v15 = v8;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v27;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v15);
            -[IMAPAccount _nameForMailboxUid:](self, "_nameForMailboxUid:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              v21 = v19;
              v22 = objc_msgSend(v21, "caseInsensitiveCompare:", CFSTR("INBOX")) == 0;

              if (!v22)
                objc_msgSend(v25, "addObject:", v21);
            }

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v16);
      }

      -[IMAPAccount mf_lock](self, "mf_lock");
      -[MailAccount setValueInAccountProperties:forKey:](self, "setValueInAccountProperties:forKey:", v25, CFSTR("PushedMailboxes"));
      -[IMAPAccount mf_unlock](self, "mf_unlock");
      -[MFAccount savePersistentAccount](self, "savePersistentAccount");
      -[IMAPAccount _updatePushedMailboxesAndNotify:](self, "_updatePushedMailboxesAndNotify:", 1);
      -[IMAPAccount _schedulePushRegistrationConnection](self, "_schedulePushRegistrationConnection");

    }
  }

}

- (id)_externalMailboxUids
{
  void *v3;
  id v4;

  if (-[MFAccount isSyncingNotes](self, "isSyncingNotes"))
  {
    -[IMAPAccount _notesPrefix](self, "_notesPrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[IMAPAccount _copyPushedMailboxesForPrefix:](self, "_copyPushedMailboxesForPrefix:", v3);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)mailboxNamesForPushRegistration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[IMAPAccount setMustRegisterForPushOnNextConnection:](self, "setMustRegisterForPushOnNextConnection:", 0);
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[IMAPAccount pushedMailboxUids](self, "pushedMailboxUids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  -[IMAPAccount _externalMailboxUids](self, "_externalMailboxUids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[IMAPAccount nameForMailboxUid:](self, "nameForMailboxUid:", v13, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "addObject:", v14);
        else
          objc_msgSend(v8, "addObject:", v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v8, "count"))
  {
    +[IMAPAccount log](IMAPAccount, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      -[IMAPAccount separatorChar](self, "separatorChar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAPAccount serverPathPrefix](self, "serverPathPrefix");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v24 = v8;
      v25 = 2114;
      v26 = v9;
      v27 = 2114;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_fault_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_FAULT, "#aps-push could not create mailbox names for: %@, pushed mailboxes: %{public}@ (sep: %{public}@ prefix: %@)", buf, 0x2Au);

    }
  }

  return v7;
}

- (void)_mailboxListingChanged
{
  -[IMAPAccount _updatePushedMailboxesAndNotify:](self, "_updatePushedMailboxesAndNotify:", 1);
  -[IMAPAccount _schedulePushRegistrationConnection](self, "_schedulePushRegistrationConnection");
}

- (void)handlePushNotificationOnMailboxes:(id)a3 missedNotifications:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  int v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  __int128 v43;
  id obj;
  id obja;
  id v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  const __CFString *v62;
  id v63;
  uint8_t v64[128];
  uint8_t buf[4];
  IMAPAccount *v66;
  __int16 v67;
  const __CFString *v68;
  _BYTE v69[128];
  uint64_t v70;

  v4 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  obj = a3;
  if (obj)
  {
    -[IMAPAccount mailboxesRegisteredForPushByHash](self, "mailboxesRegisteredForPushByHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      objc_msgSend(v6, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = obj;
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obja = v8;
    v9 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v58;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v58 != v10)
            objc_enumerationMutation(obja);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "uppercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            LODWORD(v9) = 1;
            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_16:

    v48 = v7;
  }
  else
  {
    LODWORD(v9) = -[MFAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v48 = 0;
    obja = 0;
  }
  +[IMAPAccount log](IMAPAccount, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("not ");
    if ((_DWORD)v9)
      v15 = &stru_1E4F1C8F8;
    *(_DWORD *)buf = 138412546;
    v66 = self;
    v67 = 2112;
    v68 = v15;
    _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "#aps-push Received notification for account '%@', will %@handle push", buf, 0x16u);
  }

  if ((_DWORD)v9)
  {
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = v48;
    if (obja)
    {
      -[IMAPAccount pushedMailboxUids](self, "pushedMailboxUids");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAPAccount _externalMailboxUids](self, "_externalMailboxUids");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v19 = obja;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      if (!v20)
        goto LABEL_43;
      v22 = *(_QWORD *)v54;
      *(_QWORD *)&v21 = 138412546;
      v43 = v21;
      while (1)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v54 != v22)
            objc_enumerationMutation(v19);
          v24 = *(__CFString **)(*((_QWORD *)&v53 + 1) + 8 * v23);
          -[__CFString uppercaseString](v24, "uppercaseString", v43);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            +[IMAPAccount log](IMAPAccount, "log");
            v29 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
LABEL_37:

              goto LABEL_38;
            }
            *(_DWORD *)buf = v43;
            v66 = self;
            v67 = 2112;
            v68 = v24;
            v30 = v29;
            v31 = "#aps-push warning, %@ got a notification for mailbox with hash '%@', but can't find that mailbox.";
LABEL_41:
            _os_log_error_impl(&dword_1A4F90000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
            goto LABEL_37;
          }
          v27 = objc_msgSend(v17, "containsObject:", v26);
          v28 = v27;
          if (v27)
            objc_msgSend(v47, "addObject:", v26);
          if (objc_msgSend(v18, "containsObject:", v26))
          {
            objc_msgSend(v46, "addObject:", v26);
            goto LABEL_38;
          }
          if ((v28 & 1) == 0)
          {
            +[IMAPAccount log](IMAPAccount, "log");
            v29 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              goto LABEL_37;
            *(_DWORD *)buf = v43;
            v66 = self;
            v67 = 2112;
            v68 = v26;
            v30 = v29;
            v31 = "#aps-push warning, %@ got a notification for mailbox %@, but we're not enabled for the appropriate dataclass";
            goto LABEL_41;
          }
LABEL_38:

          ++v23;
          v16 = v48;
        }
        while (v20 != v23);
        v32 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        v20 = v32;
        if (!v32)
        {
LABEL_43:

          goto LABEL_45;
        }
      }
    }
    -[MailAccount primaryMailboxUid](self, "primaryMailboxUid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v17);
LABEL_45:

    if (objc_msgSend(v47, "count"))
    {
      v62 = CFSTR("MailAccountContentsDidChangeUids");
      v63 = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("MailAccountContentsDidChange"), self, v33);

    }
    if (objc_msgSend(v46, "count"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v36 = v46;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v50 != v38)
              objc_enumerationMutation(v36);
            v40 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
            -[IMAPAccount _notesPrefix](self, "_notesPrefix");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = -[IMAPAccount _notificationNameForMailbox:withPrefix:](self, "_notificationNameForMailbox:withPrefix:", v40, v41);

            CFNotificationCenterPostNotification(DarwinNotifyCenter, v42, 0, 0, 1u);
          }
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        }
        while (v37);
      }

    }
  }

}

- (void)_apsDeviceTokenChanged:(id)a3
{
  if (-[IMAPAccount canReceiveNewMailNotifications](self, "canReceiveNewMailNotifications", a3))
    -[IMAPAccount releaseAllConnections](self, "releaseAllConnections");
  if (-[MailAccount isActive](self, "isActive"))
  {
    if ((*((_BYTE *)self + 388) & 4) != 0)
      -[IMAPAccount _schedulePushRegistrationConnection](self, "_schedulePushRegistrationConnection");
  }
}

- (void)_registerForDeviceTokenChanges
{
  id v3;
  id v4;

  if ((*((_BYTE *)self + 388) & 8) == 0)
  {
    *((_BYTE *)self + 388) |= 8u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__apsDeviceTokenChanged_, CFSTR("MFAPSManagerDeviceTokenChangedNote"), 0);

    +[MFAPSManager sharedManager](MFAPSManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connect");

  }
}

- (id)copyDiagnosticInformation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double lastPushRegistration;
  __CFString *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMAPAccount;
  v3 = -[MFAccount copyDiagnosticInformation](&v12, sel_copyDiagnosticInformation);
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[IMAPAccount mailboxesRegisteredForPushByHash](self, "mailboxesRegisteredForPushByHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionWithLocale:indent:", 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAPAccount mf_lock](self, "mf_lock");
  objc_msgSend(v4, "appendFormat:", CFSTR("    topic: %@\n"), self->_apsTopic);
  -[NSArray componentsJoinedByString:](self->_lastKnownCapabilities, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("    known capabilities: %@\n"), v7);

  v8 = self->_supportedPushServiceLevel + 2;
  if (v8 >= 6)
    __assert_rtn("_pushServiceLevelName", "IMAPAccount.m", 3246, "0 && \"unknown push service level\");
  objc_msgSend(v4, "appendFormat:", CFSTR("    negotiated push service level: %@\n"), *(&off_1E4E89148 + v8));
  lastPushRegistration = self->_lastPushRegistration;
  if (lastPushRegistration == 0.0)
  {
    v10 = CFSTR("<never>");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_lastPushRegistration);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("    last push registration time: %@\n"), v10);
  if (lastPushRegistration != 0.0)

  if (self->_supportedPushServiceLevel >= 2)
    objc_msgSend(v4, "appendFormat:", CFSTR("    mailboxes registered for push: %@\n"), v6);
  -[IMAPAccount mf_unlock](self, "mf_unlock");

  return v4;
}

- (id)messageActionsAfterActionID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MailAccount library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localActionPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAccount URLString](self, "URLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageActionsForAccountURL:previousActionID:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)credentialExpiryDate
{
  void *v2;
  void *v3;
  void *v4;

  -[MFAccount baseAccount](self, "baseAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expiryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)moveSupported
{
  void *v2;
  char v3;

  -[IMAPAccount lastKnownCapabilities](self, "lastKnownCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("MOVE"));

  return v3;
}

- (id)replayAction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "mailboxURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MailAccount storeForMailboxUid:](self, "storeForMailboxUid:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Got store of class %@ for mailbox %@"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_retainAutorelease(v14);
      qword_1EE7AB6A8 = objc_msgSend(v15, "UTF8String");
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMAPAccount.m"), 3291, CFSTR("Got wrong type of store for mailboxURL"));

    }
    objc_msgSend(v9, "replayAction:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      +[IMAPAccount log](IMAPAccount, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "ef_publicDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't get store from mailbox %@", buf, 0xCu);

      }
    }
    else
    {
      +[IMAPAccount log](IMAPAccount, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't get mailbox from URL", buf, 2u);
      }
    }

    v17 = 0;
  }

  return v17;
}

- (BOOL)supportsAppleRemoteLinks
{
  void *v2;
  char v3;

  -[IMAPAccount lastKnownCapabilities](self, "lastKnownCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("X-APPLE-REMOTE-LINKS"));

  return v3;
}

- (NSString)apsSenderArgument
{
  return self->_apsSenderArgument;
}

- (void)setApsSenderArgument:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setApsVersion:(int64_t)a3
{
  self->_apsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsSenderArgument, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_pushRegisteredMailboxes, 0);
  objc_storeStrong((id *)&self->_pushedMailboxUids, 0);
  objc_storeStrong((id *)&self->_apsTopic, 0);
  objc_storeStrong((id *)&self->_eSearchSupported, 0);
  objc_storeStrong((id *)&self->_eSearchSupportedLock, 0);
  objc_storeStrong((id *)&self->_lastKnownCapabilities, 0);
  objc_storeStrong((id *)&self->_lockOrderingArray, 0);
  objc_storeStrong(&self->_packetContextAssertion, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_serverNamespace, 0);
  objc_storeStrong((id *)&self->_separatorChar, 0);
}

+ (id)imapMailboxURLForAccountID:(id)a3 pathComponents:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  id v29;

  v25 = a1;
  v29 = a3;
  v28 = a4;
  swift_getObjCClassMetadata();
  v26 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE7A1980) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v27 = (uint64_t)&v8 - v26;
  v4 = (id)MEMORY[0x1E0C80A78](v29);
  v5 = v28;
  if (v29)
  {
    v24 = v29;
    v19 = v29;
    v20 = sub_1A594B40C();
    v21 = v6;

    v22 = v20;
    v23 = v21;
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  v17 = v23;
  v18 = v22;
  if (v28)
  {
    v16 = v28;
    v13 = v28;
    v14 = sub_1A594B958();

    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  v10 = v15;
  swift_getObjCClassMetadata();
  sub_1A519F79C(v18, v17, v10, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = sub_1A5949EF4();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(v27, 1) == 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)sub_1A5949E34();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v27, v11);
    v9 = v8;
  }
  return v9;
}

+ (void)getAccountID:(id *)a3 pathComponents:(id *)a4 fromIMAPMailboxURL:(id)a5
{
  void *v5;
  id v6;
  id v7[3];
  id *v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;

  v7[2] = a1;
  v8 = a3;
  v9 = a4;
  v16 = a5;
  swift_getObjCClassMetadata();
  v10 = sub_1A5949EF4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v7 - v12;
  v14 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE7A1980) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = (void *)MEMORY[0x1E0C80A78](v16);
  v15 = (uint64_t)v7 - v14;
  v6 = v5;
  if (v16)
  {
    v7[1] = v16;
    v7[0] = v16;
    sub_1A5949EA0();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v15, v13, v10);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v15, 1, 1, v10);
  }
  swift_getObjCClassMetadata();
  sub_1A519FEEC(v8, v9, v15);
  sub_1A5176968(v15);
}

- (void)_readCustomInfoFromMailboxCache:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Separator char is missing. Not reading from mailbox cache.", v1, 2u);
}

- (void)_writeCustomInfoToMailboxCache:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Writing to mailbox cache with nil separator char", v1, 2u);
}

- (void)taskManager
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Unable to use MFSwiftIMAPTaskManager for account %{public}@ on %{public}@", buf, 0x16u);

}

- (void)renameMailbox:(uint64_t)a3 newName:(uint64_t)a4 parent:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "Offline renaming is not supported for mailbox %{public}@", a5, a6, a7, a8, 2u);
}

- (void)renameMailbox:(uint64_t)a3 newName:(uint64_t)a4 parent:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "Failed to get connection for mailbox rename %{public}@", a5, a6, a7, a8, 2u);
}

@end
