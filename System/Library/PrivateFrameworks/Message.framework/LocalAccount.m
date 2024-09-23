@implementation LocalAccount

- (id)uniqueID
{
  return CFSTR("LocalAccountId");
}

- (id)_URLScheme
{
  return (id)*MEMORY[0x1E0D1DB70];
}

- (BOOL)_shouldConfigureMailboxCache
{
  return 1;
}

- (id)mailboxPathExtension
{
  return CFSTR("mbox");
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < 2)
  {
    v14.receiver = self;
    v14.super_class = (Class)LocalAccount;
    -[MailAccount mailboxUidForRelativePath:create:withOption:](&v14, sel_mailboxUidForRelativePath_create_withOption_, v8, v6, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)LocalAccount;
    -[MailAccount mailboxUidForRelativePath:create:withOption:](&v15, sel_mailboxUidForRelativePath_create_withOption_, v11, v6, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)resetSpecialMailboxes
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LocalAccount;
  -[MailAccount resetSpecialMailboxes](&v4, sel_resetSpecialMailboxes);
  v3 = -[LocalAccount transientDraftsFolderShouldCreate:](self, "transientDraftsFolderShouldCreate:", 0);
}

- (id)transientDraftsFolderShouldCreate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[LocalAccount mf_lock](self, "mf_lock");
  -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", CFSTR("x-apple-transient-drafts"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMailboxType:", 5);
  if (objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveState");

  }
  -[LocalAccount mf_unlock](self, "mf_unlock");
  return v5;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LocalAccount;
  v7 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](&v10, sel__copyMailboxUidWithParent_name_attributes_existingMailboxUid_dictionary_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isContainer") & 1) == 0)
    objc_msgSend(v8, "setAttributes:", objc_msgSend(v8, "attributes") & 0xFFFFFFFFFFFFFFFELL);
  return v8;
}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)LocalAccount;
  v8 = -[MailAccount _setChildren:forMailboxUid:](&v10, sel__setChildren_forMailboxUid_, v6, v7);
  if ((objc_msgSend(v7, "isContainer") & 1) == 0 && objc_msgSend(v6, "count"))
    objc_msgSend(v7, "setAttributes:", objc_msgSend(v7, "attributes") & 0xFFFFFFFFFFFFFFFELL);

  return v8;
}

- (BOOL)isLocalAccount
{
  return 1;
}

+ (LocalAccount)localAccount
{
  void *v3;
  void *v4;
  void *v5;
  LocalAccount *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[MailAccount lockMailAccount](MailAccount, "lockMailAccount");
  v3 = (void *)localAccount_sLocalAccount;
  if (!localAccount_sLocalAccount)
  {
    objc_msgSend(a1, "defaultAccountDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("LocalAccountId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[MailAccount initWithPath:]([LocalAccount alloc], "initWithPath:", v5);
    v7 = (void *)localAccount_sLocalAccount;
    localAccount_sLocalAccount = (uint64_t)v6;

    if (+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
    {
      v8 = (void *)localAccount_sLocalAccount;
      +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLibrary:", v9);

    }
    v3 = (void *)localAccount_sLocalAccount;
  }
  v10 = v3;
  +[MailAccount unlockMailAccount](MailAccount, "unlockMailAccount");
  return (LocalAccount *)v10;
}

- (id)identifier
{
  return CFSTR("LocalAccount");
}

- (id)sendLaterFolderShouldCreate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[LocalAccount mf_lock](self, "mf_lock");
  -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", CFSTR("x-apple-send-later"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMailboxType:", 0);
  if (objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveState");

  }
  -[LocalAccount mf_unlock](self, "mf_unlock");
  return v5;
}

- (id)displayName
{
  return MFLookupLocalizedString(CFSTR("PERSONAL_MAILBOXES"), CFSTR("Local Mailboxes"), CFSTR("Message"));
}

- (id)transientDraftsFolder
{
  return -[LocalAccount transientDraftsFolderShouldCreate:](self, "transientDraftsFolderShouldCreate:", 1);
}

- (BOOL)canFetch
{
  return 0;
}

- (BOOL)supportsPurge
{
  return 0;
}

- (id)sendLaterFolder
{
  return -[LocalAccount sendLaterFolderShouldCreate:](self, "sendLaterFolderShouldCreate:", 1);
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isActive
{
  return 1;
}

+ (id)accountTypeIdentifier
{
  return 0;
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

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByRemovingPercentEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", self, CFSTR("Account"));
  v9 = objc_msgSend(v7, "rangeOfString:options:", CFSTR("/"), 8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "substringWithRange:", v9 + v8, objc_msgSend(v7, "length") - (v9 + v8));
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  if (v7 && (objc_msgSend(v7, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("RelativePath"));

  return v5;
}

+ (id)legacyPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  return CFSTR("Mailboxes");
}

- (id)legacySQLExpressionToMatchAllMailboxes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("url"));
  objc_msgSend(v2, "beginsWith:caseSensitive:", CFSTR("local:"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryMailboxUid
{
  return self->super._inboxMailboxUid;
}

- (id)pushedMailboxUids
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)accountTypeString
{
  return CFSTR("Local");
}

+ (id)csAccountTypeString
{
  return (id)*MEMORY[0x1E0CA5CF8];
}

- (BOOL)canGoOffline
{
  return 1;
}

- (void)_synchronouslyLoadListingForParent:(id)a3
{
  id v4;
  LocalAccount *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = self;
  v12 = v4;
  objc_msgSend(v12, "fullPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", 0);

  if (v7)
  {
    if (objc_msgSend(v12, "isStore"))
    {
      -[LocalAccount mailboxPathExtension](v5, "mailboxPathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "rangeOfString:options:", v8, 12);
      v11 = v10;

      if (v9 >= 2 && v9 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v7, "deleteCharactersInRange:", v9 - 1, v11 + 1);
    }

    -[MailAccount _loadEntriesFromFileSystemPath:parent:](v5, "_loadEntriesFromFileSystemPath:parent:", v7, v12);
  }
  else
  {

  }
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "childWithName:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "mf_isSubdirectoryOfPath:", v12) & 1) != 0)
    goto LABEL_7;
  if (v11)
  {
    v13 = objc_msgSend(v11, "isStore");
    if (v13 == objc_msgSend(v8, "isStore")
      || (v14 = objc_msgSend(v11, "isContainer"), v14 == objc_msgSend(v8, "isContainer")))
    {
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("MAILBOX_EXISTS_FORMAT"), CFSTR("The mailbox “%@” already exists."), CFSTR("Delayed"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fullPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setError:", v21);

LABEL_7:
      v15 = 0;
      goto LABEL_8;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)LocalAccount;
  v15 = -[MailAccount renameMailbox:newName:parent:](&v23, sel_renameMailbox_newName_parent_, v8, v9, v10);
LABEL_8:

  return v15;
}

- (id)mailboxUidForFileSystemPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  MFMailboxUid *v11;
  void *v12;
  unsigned __int8 v14;

  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -86;
  objc_msgSend(v4, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("mbox")))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v14))
  {
    v9 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v8 = v14;

  if (v8)
  {
    objc_msgSend((id)mailboxUidForFileSystemPath___rootlessMailboxRoot, "childWithName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_msgSend(objc_allocWithZone((Class)_MFRootlessMailboxUid), "initWithName:attributes:forAccount:extraAttributes:", v6, 1, 0, 0);
      objc_msgSend(v9, "setMailboxType:", -100);
      v10 = (void *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
      if (!mailboxUidForFileSystemPath___rootlessMailboxRoot)
      {
        v11 = -[MFMailboxUid initWithAccount:]([MFMailboxUid alloc], "initWithAccount:", self);
        v12 = (void *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
        mailboxUidForFileSystemPath___rootlessMailboxRoot = (uint64_t)v11;

        v10 = (void *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
      }
      v7 = (void *)objc_msgSend(v10, "mutableCopyOfChildren");
      objc_msgSend(v7, "addObject:", v9);
      objc_msgSend((id)mailboxUidForFileSystemPath___rootlessMailboxRoot, "setChildren:", v7);
      goto LABEL_10;
    }
  }
  else
  {
LABEL_8:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (BOOL)deleteInPlaceForMailbox:(id)a3
{
  return objc_msgSend(a3, "mailboxType") == 6;
}

- (BOOL)supportsAppend
{
  return 1;
}

- (BOOL)supportsArchiving
{
  return 0;
}

@end
