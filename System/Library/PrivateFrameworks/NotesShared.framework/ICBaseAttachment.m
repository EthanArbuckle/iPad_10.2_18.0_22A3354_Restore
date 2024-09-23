@implementation ICBaseAttachment

- (BOOL)isVisible
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[ICBaseAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVisible"))
  {
    v6.receiver = self;
    v6.super_class = (Class)ICBaseAttachment;
    v4 = -[ICCloudSyncingObject isVisible](&v6, sel_isVisible);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)parentCloudObjectForMinimumSupportedVersionPropagation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICBaseAttachment parentAttachment](self, "parentAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICBaseAttachment note](self, "note");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)attachmentWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v9;
  if (!a4)
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v9;
    objc_msgSend(a1, "predicateForVisibleAttachmentsInContext:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v11, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)attachmentWithIdentifier:(id)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "attachmentWithIdentifier:includeDeleted:context:", a3, 1, a4);
}

+ (id)predicateForVisibleObjects
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___ICBaseAttachment;
  objc_msgSendSuper2(&v8, sel_predicateForVisibleObjects);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.needsInitialFetchFromCloud == NO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_NSRange)rangeInNote
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[ICBaseAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICBaseAttachment note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeForAttachment:", self);
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0;
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (BOOL)isUsed
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((-[ICBaseAttachment markedForDeletion](self, "markedForDeletion") & 1) != 0)
    return 0;
  -[ICBaseAttachment parentAttachment](self, "parentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[ICBaseAttachment rangeInNote](self, "rangeInNote") != 0x7FFFFFFFFFFFFFFFLL;
  -[ICBaseAttachment parentAttachment](self, "parentAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUsed"))
  {
    -[ICBaseAttachment parentAttachment](self, "parentAttachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "usesChildAttachment:", self);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)newAttachmentWithIdentifier:(id)a3 note:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v7, v8);

  objc_msgSend(v6, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccount:", v10);

  objc_msgSend(v9, "setNote:", v6);
  objc_msgSend(v6, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "persistentStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assignToPersistentStore:", v12);

  return v9;
}

+ (void)deleteAttachment:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMedia deleteMedia:](ICMedia, "deleteMedia:", v4);

  }
  objc_msgSend(v5, "markForDeletion");

}

+ (void)undeleteAttachment:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMedia undeleteMedia:](ICMedia, "undeleteMedia:", v4);

  }
  objc_msgSend(v5, "unmarkForDeletion");

}

+ (id)predicateForVisibleAttachmentsIncludingTrash:(BOOL)a3 inContext:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(a1, "predicateForVisibleObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.folder.folderType != %d"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v11;
  +[ICUnsupportedObjectPredicateHelper predicateForSupportedAttachmentsInContext:](ICUnsupportedObjectPredicateHelper, "predicateForSupportedAttachmentsInContext:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

+ (id)predicateForVisibleAttachmentsInContext:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForVisibleAttachmentsIncludingTrash:inContext:", 0, a3);
}

+ (id)predicateForVisibleAttachmentsIncludingTrashInContext:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForVisibleAttachmentsIncludingTrash:inContext:", 1, a3);
}

+ (id)notDeletedPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("markedForDeletion == NO"));
}

- (id)cloudAccount
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICBaseAttachment account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICBaseAttachment note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setParentAttachment:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[ICBaseAttachment parentAttachment](self, "parentAttachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[ICBaseAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parentAttachment"));
    -[ICBaseAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parentCloudObject"));
    -[ICBaseAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("parentAttachment"));
    -[ICBaseAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parentAttachment"));
    -[ICBaseAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parentCloudObject"));
    objc_msgSend(v5, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  }

}

- (ICBaseAttachment)rootParentAttachment
{
  void *v3;
  void *v4;
  ICBaseAttachment *v5;

  -[ICBaseAttachment parentAttachment](self, "parentAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICBaseAttachment parentAttachment](self, "parentAttachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootParentAttachment");
    v5 = (ICBaseAttachment *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self;
  }

  return v5;
}

@end
