@implementation _MFRootlessMailboxUid

- (id)displayName
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "displayNameAtPath:", -[MFMailboxUid name](self, "name"));
}

- (id)tildeAbbreviatedPath
{
  return (id)objc_msgSend(-[MFMailboxUid name](self, "name"), "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath");
}

- (id)storeForMailboxUid:(id)a3
{
  return +[MFLibraryStore storeWithMailbox:](MFLibraryStore, "storeWithMailbox:", a3);
}

@end
