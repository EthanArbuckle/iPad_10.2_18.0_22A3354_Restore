@implementation MFDAMailbox

- (MFDAMailbox)initWithName:(id)a3 attributes:(unint64_t)a4 account:(id)a5 folderID:(id)a6
{
  id v10;
  id v11;
  id v12;
  MFDAMailbox *v13;
  uint64_t v14;
  NSString *folderID;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MFDAMailbox;
  v13 = -[MFMailboxUid initWithName:attributes:forAccount:extraAttributes:](&v17, sel_initWithName_attributes_forAccount_extraAttributes_, v10, a4, v11, 0);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    folderID = v13->_folderID;
    v13->_folderID = (NSString *)v14;

  }
  return v13;
}

- (void)didChangeUserInfo
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFDAMailbox;
  -[MFMailboxUid didChangeUserInfo](&v4, sel_didChangeUserInfo);
  -[MFDAMailbox _folderID](self, "_folderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v3, CFSTR("DAMailboxUid"));

}

- (void)setFolderID:(id)a3
{
  NSString *v4;
  NSString *folderID;
  id v6;

  v6 = a3;
  -[MFDAMailbox mf_lock](self, "mf_lock");
  v4 = (NSString *)objc_msgSend(v6, "copy");
  folderID = self->_folderID;
  self->_folderID = v4;

  -[MFDAMailbox mf_unlock](self, "mf_unlock");
  if (v6)
  {
    -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v6, CFSTR("DAMailboxUid"));
    -[MFMailboxUid flushCriteria](self, "flushCriteria");
  }

}

- (NSString)folderID
{
  void *v3;

  -[MFMailboxUid userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("DAMailboxUid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MFDAMailbox _folderID](self, "_folderID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)_folderID
{
  NSString *v3;

  -[MFDAMailbox mf_lock](self, "mf_lock");
  v3 = self->_folderID;
  -[MFDAMailbox mf_unlock](self, "mf_unlock");
  return v3;
}

- (id)URLWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDAMailbox folderID](self, "folderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("Account"), v7, CFSTR("RelativePath"), 0);
    +[MailAccount URLForInfo:](MailAccount, "URLForInfo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)displayName
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MFDAMailbox;
  -[MFMailboxUid displayName](&v8, sel_displayName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("70FB9178-576E-4CAA-A08E-F68D57BFD01E")))
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[MFMailboxUid ef_publicDescription](self, "ef_publicDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v10 = "-[MFDAMailbox displayName]";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "%s [10463402] fixing bogus EAS inbox name for %{public}@", buf, 0x16u);

    }
    MFLookupLocalizedString(CFSTR("INBOX_SPECIAL_MAILBOX_NAME"), CFSTR("Inbox"), CFSTR("Message"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *folderID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFDAMailbox;
  -[MFMailboxUid mutableDictionaryRepresentation](&v7, sel_mutableDictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  folderID = self->_folderID;
  if (folderID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", folderID, CFSTR("DAFolderID"));
  return v4;
}

- (id)_privacySafeDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFDAMailbox;
  -[MFMailboxUid _privacySafeDescription](&v7, sel__privacySafeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDAMailbox folderID](self, "folderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" folderID:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end
