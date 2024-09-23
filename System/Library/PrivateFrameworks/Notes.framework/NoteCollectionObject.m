@implementation NoteCollectionObject

- (id)predicateForNotes
{
  return 0;
}

- (id)collectionInfo
{
  return 0;
}

- (id)basicAccountIdentifier
{
  return 0;
}

- (id)searchDomainIdentifier
{
  return 0;
}

- (BOOL)isAllNotesContainer
{
  return 0;
}

- (id)titleForTableViewCell
{
  return CFSTR("Note Collection");
}

- (BOOL)isTitleValid:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)cacheKey
{
  return &stru_1E81EB410;
}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  return a3 == 2;
}

- (id)predicateForSearchableNotes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("((deletedFlag == %@) AND (body.content != nil) AND (isBookkeepingEntry == %@))"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NoteCollectionObject predicateForNotes](self, "predicateForNotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predicateForSearchableAttachments
{
  return 0;
}

@end
