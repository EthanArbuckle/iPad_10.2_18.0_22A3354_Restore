@implementation NSDictionary(MSASDefinitions)

- (uint64_t)MSASIsGlobalResetSync
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("isGlobalResetSync"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)MSASAlbumResetSyncAlbumGUID
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("isAlbumResetSync"));
}

- (uint64_t)MSASIsLocalChange
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("isLocalChange"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)MSASEventIsDueToAlbumDeletionAlbumGUID
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("eventIsDueToAlbumDeletion"));
}

- (uint64_t)MSASEventIsDueToAssetCollectionDeletionAssetCollectionGUID
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("eventIsDueToAssetCollectionDeletion"));
}

- (uint64_t)MSASIsNotInteresting
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("notInteresting"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)MSASIsErrorRecovery
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("isErrorRecovery"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
