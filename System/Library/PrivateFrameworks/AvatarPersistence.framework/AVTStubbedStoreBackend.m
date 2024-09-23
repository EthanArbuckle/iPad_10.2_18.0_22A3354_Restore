@implementation AVTStubbedStoreBackend

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)saveAvatar:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)saveAvatars:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4
{
  id v4;
  AVTAvatarRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AVTAvatarRecord *v10;

  v4 = a3;
  v5 = [AVTAvatarRecord alloc];
  objc_msgSend(v4, "avatarData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "orderDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateByAddingTimeInterval:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTAvatarRecord initWithAvatarData:orderDate:](v5, "initWithAvatarData:orderDate:", v7, v9);

  return v10;
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  return 0;
}

- (AVTStoreBackendDelegate)backendDelegate
{
  return 0;
}

- (AVTAvatarRecordChangeTracker)recordChangeTracker
{
  return 0;
}

@end
