@implementation ECExchangeAccount

- (NSString)inboxMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("InboxMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setInboxMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("InboxMailboxName"));
}

- (NSString)journalMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("JournalMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setJournalMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("JournalMailboxName"));
}

- (NSString)folderHierarchySyncState
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FolderHierarchySyncState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setFolderHierarchySyncState:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("FolderHierarchySyncState"));
}

+ (id)standardPorts
{
  return &unk_1E7135E58;
}

+ (id)standardSSLPorts
{
  return &unk_1E7135E70;
}

- (int64_t)defaultPortNumber
{
  return 80;
}

- (int64_t)defaultSecurePortNumber
{
  return 443;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

@end
