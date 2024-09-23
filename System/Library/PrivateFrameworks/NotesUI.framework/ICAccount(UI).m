@implementation ICAccount(UI)

+ (id)globalVirtualSystemPaperFolder
{
  if (globalVirtualSystemPaperFolder_once != -1)
    dispatch_once(&globalVirtualSystemPaperFolder_once, &__block_literal_global_15_0);
  return (id)globalVirtualSystemPaperFolder_identifier;
}

+ (id)globalVirtualSharedWithYouFolder
{
  if (globalVirtualSharedWithYouFolder_once != -1)
    dispatch_once(&globalVirtualSharedWithYouFolder_once, &__block_literal_global_55);
  return (id)globalVirtualSharedWithYouFolder_identifier;
}

+ (id)localizedLocalAccountNameMidSentence:()UI
{
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getACUILocalizationClass_softClass;
  v11 = getACUILocalizationClass_softClass;
  if (!getACUILocalizationClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getACUILocalizationClass_block_invoke;
    v7[3] = &unk_1E5C1DE18;
    v7[4] = &v8;
    __getACUILocalizationClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v5, "localizedTitleForLocalSourceOfDataclass:usedAtBeginningOfSentence:", *MEMORY[0x1E0C8EED8], a3 ^ 1u);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)globalVirtualMathNotesFolder
{
  if (globalVirtualMathNotesFolder_once != -1)
    dispatch_once(&globalVirtualMathNotesFolder_once, &__block_literal_global_16);
  return (id)globalVirtualMathNotesFolder_identifier;
}

+ (id)globalVirtualRecentlyDeletedMathNotesFolder
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ICAccount_UI__globalVirtualRecentlyDeletedMathNotesFolder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (globalVirtualRecentlyDeletedMathNotesFolder_once[0] != -1)
    dispatch_once(globalVirtualRecentlyDeletedMathNotesFolder_once, block);
  return (id)globalVirtualRecentlyDeletedMathNotesFolder_identifier;
}

+ (id)globalVirtualCallNotesFolder
{
  if (globalVirtualCallNotesFolder_once != -1)
    dispatch_once(&globalVirtualCallNotesFolder_once, &__block_literal_global_17_0);
  return (id)globalVirtualCallNotesFolder_identifier;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSystemPaperFolder
{
  ICVirtualSmartFolderItemIdentifier *v2;
  ICVirtualSmartFolderItemIdentifier *v3;
  void *v4;
  void *v5;

  objc_getAssociatedObject(a1, &ICAccountVirtualSystemPaperFolderIdentifier);
  v2 = (ICVirtualSmartFolderItemIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [ICVirtualSmartFolderItemIdentifier alloc];
    +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:accountObjectID:](v3, "initWithType:parentIdentifier:accountObjectID:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSystemPaper"), v4, v5);

    objc_setAssociatedObject(a1, &ICAccountVirtualSystemPaperFolderIdentifier, v2, (void *)1);
  }
  return v2;
}

- (ICVirtualSmartFolderItemIdentifier)virtualMathNotesFolder
{
  ICVirtualSmartFolderItemIdentifier *v2;
  ICVirtualSmartFolderItemIdentifier *v3;
  void *v4;
  void *v5;

  objc_getAssociatedObject(a1, &ICAccountVirtualMathNotesFolderIdentifier);
  v2 = (ICVirtualSmartFolderItemIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [ICVirtualSmartFolderItemIdentifier alloc];
    +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:accountObjectID:](v3, "initWithType:parentIdentifier:accountObjectID:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeMathNotes"), v4, v5);

    objc_setAssociatedObject(a1, &ICAccountVirtualMathNotesFolderIdentifier, v2, (void *)1);
  }
  return v2;
}

- (ICVirtualSmartFolderItemIdentifier)virtualCallNotesFolder
{
  ICVirtualSmartFolderItemIdentifier *v2;
  ICVirtualSmartFolderItemIdentifier *v3;
  void *v4;
  void *v5;

  objc_getAssociatedObject(a1, &ICAccountVirtualCallNotesFolderIdentifier);
  v2 = (ICVirtualSmartFolderItemIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [ICVirtualSmartFolderItemIdentifier alloc];
    +[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:accountObjectID:](v3, "initWithType:parentIdentifier:accountObjectID:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeCallNotes"), v4, v5);

    objc_setAssociatedObject(a1, &ICAccountVirtualCallNotesFolderIdentifier, v2, (void *)1);
  }
  return v2;
}

@end
