@implementation _MFRootlessMailboxUid

- (id)displayName
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)storeForMailboxUid:(id)a3
{
  +[MFLibraryStore storeWithMailbox:](MFLibraryStore, "storeWithMailbox:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
