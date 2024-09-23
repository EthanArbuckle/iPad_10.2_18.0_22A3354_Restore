@implementation ICAccount

void __47__ICAccount_UI__globalVirtualSystemPaperFolder__block_invoke()
{
  ICVirtualSmartFolderItemIdentifier *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:](v0, "initWithType:parentIdentifier:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSystemPaper"), v3);
  v2 = (void *)globalVirtualSystemPaperFolder_identifier;
  globalVirtualSystemPaperFolder_identifier = v1;

}

void __49__ICAccount_UI__globalVirtualSharedWithYouFolder__block_invoke()
{
  ICVirtualSmartFolderItemIdentifier *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:](v0, "initWithType:parentIdentifier:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"), v3);
  v2 = (void *)globalVirtualSharedWithYouFolder_identifier;
  globalVirtualSharedWithYouFolder_identifier = v1;

}

void __45__ICAccount_UI__globalVirtualMathNotesFolder__block_invoke()
{
  ICVirtualSmartFolderItemIdentifier *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:](v0, "initWithType:parentIdentifier:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeMathNotes"), v3);
  v2 = (void *)globalVirtualMathNotesFolder_identifier;
  globalVirtualMathNotesFolder_identifier = v1;

}

void __60__ICAccount_UI__globalVirtualRecentlyDeletedMathNotesFolder__block_invoke(uint64_t a1)
{
  ICVirtualSmartFolderItemIdentifier *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [ICVirtualSmartFolderItemIdentifier alloc];
  objc_msgSend(*(id *)(a1 + 32), "globalVirtualMathNotesFolder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:](v2, "initWithType:parentIdentifier:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"), v5);
  v4 = (void *)globalVirtualRecentlyDeletedMathNotesFolder_identifier;
  globalVirtualRecentlyDeletedMathNotesFolder_identifier = v3;

}

void __45__ICAccount_UI__globalVirtualCallNotesFolder__block_invoke()
{
  ICVirtualSmartFolderItemIdentifier *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ICVirtualSmartFolderItemIdentifier alloc];
  +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:](v0, "initWithType:parentIdentifier:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeCallNotes"), v3);
  v2 = (void *)globalVirtualCallNotesFolder_identifier;
  globalVirtualCallNotesFolder_identifier = v1;

}

@end
