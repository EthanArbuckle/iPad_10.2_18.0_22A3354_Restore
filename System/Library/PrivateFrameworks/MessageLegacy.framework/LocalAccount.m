@implementation LocalAccount

- (void)resetSpecialMailboxes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LocalAccount;
  -[MailAccount resetSpecialMailboxes](&v3, sel_resetSpecialMailboxes);
  -[LocalAccount transientDraftsFolderShouldCreate:](self, "transientDraftsFolderShouldCreate:", 0);
}

- (id)transientDraftsFolderShouldCreate:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[LocalAccount mf_lock](self, "mf_lock");
  v5 = -[MailAccount mailboxUidForRelativePath:create:](self, "mailboxUidForRelativePath:create:", CFSTR("x-apple-transient-drafts"), v3);
  objc_msgSend(v5, "setType:", 5);
  if (objc_msgSend(v5, "isValid"))
    objc_msgSend((id)objc_msgSend(v5, "account"), "saveState");
  -[LocalAccount mf_unlock](self, "mf_unlock");
  return v5;
}

- (id)mailboxPathExtension
{
  return CFSTR("mbox");
}

- (BOOL)isActive
{
  return 1;
}

- (id)displayName
{
  return (id)MFLookupLocalizedString((uint64_t)CFSTR("PERSONAL_MAILBOXES"), (uint64_t)CFSTR("Local Mailboxes"), 0);
}

- (id)_URLScheme
{
  return CFSTR("local");
}

- (BOOL)_shouldConfigureMailboxCache
{
  return 1;
}

- (LocalAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  uint64_t v7;
  LocalAccount *v8;
  objc_super v10;
  objc_super v11;

  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    +[MailAccount mf_lock](MailAccount, "mf_lock");
    if (localAccount)
    {
      -[MailAccount dealloc](self, "dealloc");
      v8 = (LocalAccount *)(id)localAccount;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)LocalAccount;
      v8 = -[MailAccount initWithLibrary:persistentAccount:](&v11, sel_initWithLibrary_persistentAccount_, a3, a4);
      localAccount = (uint64_t)v8;
    }
    +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LocalAccount;
    return -[MailAccount initWithLibrary:persistentAccount:](&v10, sel_initWithLibrary_persistentAccount_, a3, a4);
  }
  return v8;
}

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LocalAccount;
  v7 = -[MailAccount _copyMailboxUidWithParent:name:attributes:existingMailboxUid:dictionary:](&v10, sel__copyMailboxUidWithParent_name_attributes_existingMailboxUid_dictionary_, a3, a4, *(_QWORD *)&a5, a6, a7);
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isContainer") & 1) == 0)
    objc_msgSend(v8, "setAttributes:", objc_msgSend(v8, "attributes") & 0xFFFFFFFELL);
  return v8;
}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LocalAccount;
  v6 = -[MailAccount _setChildren:forMailboxUid:](&v8, sel__setChildren_forMailboxUid_);
  if ((objc_msgSend(a4, "isContainer") & 1) == 0 && objc_msgSend(a3, "count"))
    objc_msgSend(a4, "setAttributes:", objc_msgSend(a4, "attributes") & 0xFFFFFFFELL);
  return v6;
}

+ (id)localAccount
{
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  if (!localAccount)
    localAccount = -[MailAccount initWithPath:]([LocalAccount alloc], "initWithPath:", objc_msgSend((id)objc_msgSend(a1, "defaultAccountDirectory"), "stringByAppendingPathComponent:", CFSTR("Mailboxes")));
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return (id)localAccount;
}

+ (id)defaultPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  return CFSTR("Mailboxes");
}

- (id)uniqueId
{
  return CFSTR("LocalAccountId");
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
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
  return (id)getCSAccountTypeLocal();
}

- (BOOL)canFetch
{
  return 0;
}

- (BOOL)canGoOffline
{
  return 1;
}

- (BOOL)supportsPurge
{
  return 0;
}

- (void)_synchronouslyLoadListingForParent:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_msgSend((id)objc_msgSend(a3, "fullPath"), "mutableCopyWithZone:", 0);
  if (v7)
  {
    if (objc_msgSend(a3, "isStore"))
    {
      v5 = objc_msgSend(v7, "rangeOfString:options:", -[LocalAccount mailboxPathExtension](self, "mailboxPathExtension"), 12);
      if (v5 >= 2 && v5 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v7, "deleteCharactersInRange:", v5 - 1, v6 + 1);
    }
    -[MailAccount _loadEntriesFromFileSystemPath:parent:](self, "_loadEntriesFromFileSystemPath:parent:", v7, a3);

  }
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  void *v9;
  int v10;
  int v11;
  id v13;
  objc_super v14;

  v9 = (void *)objc_msgSend(a5, "childWithName:", a4);
  if ((objc_msgSend(a4, "mf_isSubdirectoryOfPath:", objc_msgSend(a3, "name")) & 1) == 0)
  {
    if (!v9
      || (v10 = objc_msgSend(v9, "isStore"), v10 != objc_msgSend(a3, "isStore"))
      && (v11 = objc_msgSend(v9, "isContainer"), v11 != objc_msgSend(a3, "isContainer")))
    {
      v14.receiver = self;
      v14.super_class = (Class)LocalAccount;
      return -[MailAccount renameMailbox:newName:parent:](&v14, sel_renameMailbox_newName_parent_, a3, a4, a5);
    }
    v13 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    objc_msgSend(v13, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("MAILBOX_EXISTS_FORMAT"), (uint64_t)CFSTR("The mailbox “%@” already exists."), CFSTR("Delayed")), objc_msgSend(v9, "tildeAbbreviatedPath"))));
  }
  return 0;
}

- (id)mailboxUidForFileSystemPath:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v8;
  uint64_t v10;
  MFMailboxUid *v11;
  id v12;
  char v13;

  v5 = (void *)objc_msgSend(a3, "pathExtension");
  v6 = objc_msgSend(a3, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("mbox")))
    return 0;
  v13 = 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", v6, &v13)|| v13 == 0)
  {
    return 0;
  }
  v10 = objc_msgSend((id)mailboxUidForFileSystemPath___rootlessMailboxRoot, "childWithName:", v6);
  v8 = (void *)v10;
  if (!v10)
  {
    v8 = (void *)objc_msgSend(objc_allocWithZone((Class)_MFRootlessMailboxUid), "initWithName:attributes:forAccount:extraAttributes:", v6, 1, 0, 0);
    objc_msgSend(v8, "setType:", 4294967196);
    v11 = (MFMailboxUid *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
    if (!mailboxUidForFileSystemPath___rootlessMailboxRoot)
    {
      v11 = -[MFMailboxUid initWithAccount:]([MFMailboxUid alloc], "initWithAccount:", self);
      mailboxUidForFileSystemPath___rootlessMailboxRoot = (uint64_t)v11;
    }
    v12 = -[MFMailboxUid mutableCopyOfChildren](v11, "mutableCopyOfChildren");
    objc_msgSend(v12, "addObject:", v8);
    objc_msgSend((id)mailboxUidForFileSystemPath___rootlessMailboxRoot, "setChildren:", v12);

  }
  return v8;
}

- (id)transientDraftsFolder
{
  return -[LocalAccount transientDraftsFolderShouldCreate:](self, "transientDraftsFolderShouldCreate:", 1);
}

- (id)_infoForMatchingURL:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "resourceSpecifier"), "stringByRemovingPercentEncoding");
  objc_msgSend(v5, "setObject:forKey:", self, CFSTR("Account"));
  v7 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("/"), 8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    v6 = (void *)objc_msgSend(v6, "substringWithRange:", v7 + v8, objc_msgSend(v6, "length") - (v7 + v8));
  if (v6 && (objc_msgSend(v6, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RelativePath"));
  return v5;
}

- (BOOL)deleteInPlaceForMailbox:(id)a3
{
  return objc_msgSend(a3, "type") == 6;
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
