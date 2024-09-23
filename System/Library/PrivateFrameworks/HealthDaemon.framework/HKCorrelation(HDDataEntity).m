@implementation HKCorrelation(HDDataEntity)

- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  objc_super v18;

  v12 = a5;
  v13 = a6;
  v18.receiver = a1;
  v18.super_class = (Class)&off_1EF225BF0;
  if (objc_msgSendSuper2(&v18, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, a3, a4, v12, v13, a7))
  {
    objc_msgSend(a1, "objects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[HDAssociationEntity insertEntriesWithAssociation:objects:type:destinationSubObject:enforceSameSource:profile:transaction:error:](HDAssociationEntity, "insertEntriesWithAssociation:objects:type:destinationSubObject:enforceSameSource:profile:transaction:error:", a1, v15, 0, 0, 1, v12, v13, a7);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)hd_relatedJournalEntriesWithProfile:()HDDataEntity
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAssociationEntity journalEntryForAssociation:objects:profile:](HDAssociationEntity, "journalEntryForAssociation:objects:profile:", a1, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
