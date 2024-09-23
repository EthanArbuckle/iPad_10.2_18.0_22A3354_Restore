@implementation NoteObject(ICLegacyNote)

- (id)account
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "folder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)createAttachmentWithName:()ICLegacyNote
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("@mobilenotes.apple.com"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D629F0];
  objc_msgSend(a1, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "newlyAddedAttachmentInContext:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setNote:", a1);
  objc_msgSend(v11, "setFilename:", v5);

  objc_msgSend(v11, "setContentID:", v8);
  return v11;
}

+ (uint64_t)predicateForVisibleNotes
{
  return objc_msgSend(MEMORY[0x1E0D629F0], "visibleNotesPredicate");
}

@end
