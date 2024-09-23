@implementation NSMutableDictionary(MSASServerSideModel)

- (void)MSASAddDictionary:()MSASServerSideModel
{
  objc_msgSend(a1, "addEntriesFromDictionary:");
  return a1;
}

- (void)MSASAddIsGlobalResetSync
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v2, CFSTR("isGlobalResetSync"));

  return a1;
}

- (void)MSASAddIsAlbumResetSyncAlbumGUID:()MSASServerSideModel
{
  if (a3)
    objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("isAlbumResetSync"));
  else
    objc_msgSend(a1, "removeObjectForKey:", CFSTR("isAlbumResetSync"));
  return a1;
}

- (void)MSASAddIsLocalChange
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v2, CFSTR("isLocalChange"));

  return a1;
}

- (void)MSASAddEventIsDueToAlbumDeletionAlbumGUID:()MSASServerSideModel
{
  objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("eventIsDueToAlbumDeletion"));
  return a1;
}

- (void)MSASAddEventIsDueToAssetCollectionDeletionAssetCollectionGUID:()MSASServerSideModel
{
  objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("eventIsDueToAssetCollectionDeletion"));
  return a1;
}

- (void)MSASAddNotInterestingKey
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v2, CFSTR("notInteresting"));

  return a1;
}

- (void)MSASAddIsErrorRecovery
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v2, CFSTR("isErrorRecovery"));

  return a1;
}

+ (id)MSASDictionaryWithCopyOfDictionary:()MSASServerSideModel
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  return v5;
}

@end
