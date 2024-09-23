@implementation HKObject(HDDataEntity)

- (uint64_t)entityType
{
  return 0;
}

- (uint64_t)hd_relatedJournalEntriesWithProfile:()HDDataEntity
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(a1, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v14, "metadataManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "provenance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sourceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:transaction:error:", v16, v12, v19, objc_msgSend(a1, "_externalSyncObjectCode"), 0, v15, a7);

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

@end
