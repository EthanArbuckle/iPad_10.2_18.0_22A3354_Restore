@implementation BuddyExistingSettings

- (BuddyExistingSettings)init
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  BuddyExistingSettings *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyExistingSettings;
  location = -[BuddyExistingSettings init](&v7, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = dispatch_queue_create("Backup Metadata Queue", v2);
    v4 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v3;

  }
  v5 = (BuddyExistingSettings *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (NSData)walletData
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  int v6;
  id location;
  id v8[2];
  BuddyExistingSettings *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = -[BuddyExistingSettings backupMetadata](self, "backupMetadata");
  if (!v8[0]
    || ((location = objc_msgSend(v8[0], "expressSettings"),
         (objc_msgSend(location, "hasWalletData") & 1) == 0)
      ? ((objc_msgSend(v8[0], "hasWalletData") & 1) == 0
       ? (v6 = 0)
       : (v10 = objc_msgSend(v8[0], "walletData"), v6 = 1))
      : (v10 = objc_msgSend(location, "walletData"), v6 = 1),
        objc_storeStrong(&location, 0),
        !v6))
  {
    v2 = -[BuddyExistingSettings expressSettings](v9, "expressSettings");
    v3 = -[SASExpressSettings hasWalletData](v2, "hasWalletData");

    if ((v3 & 1) != 0)
    {
      v4 = -[BuddyExistingSettings expressSettings](v9, "expressSettings");
      v10 = -[SASExpressSettings walletData](v4, "walletData");

    }
    else
    {
      v10 = 0;
    }
  }
  objc_storeStrong(v8, 0);
  return (NSData *)v10;
}

- (void)setBackupMetadataWithProviderBlock:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  BuddyExistingSettings *v9;
  id v10;
  id location[2];
  BuddyExistingSettings *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyExistingSettings metadataQueue](v12, "metadataQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100137C48;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)setBackupMetadata:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyExistingSettings *v9;
  id v10;
  id location[2];
  BuddyExistingSettings *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyExistingSettings metadataQueue](v12, "metadataQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100137D88;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)backupMetadata
{
  OS_dispatch_queue *v2;
  id v3;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[4];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17[2];
  BuddyExistingSettings *v18;

  v18 = self;
  v17[1] = (id)a2;
  v11 = 0;
  v12 = &v11;
  v13 = 838860800;
  v14 = 48;
  v15 = sub_100137EEC;
  v16 = sub_100137F1C;
  v17[0] = 0;
  v2 = -[BuddyExistingSettings metadataQueue](self, "metadataQueue");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100137F28;
  v9 = &unk_100281780;
  v10[1] = &v11;
  v10[0] = v18;
  dispatch_sync((dispatch_queue_t)v2, &v5);

  v3 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);
  return v3;
}

- (SASExpressSettings)expressSettings
{
  return self->_expressSettings;
}

- (void)setExpressSettings:(id)a3
{
  objc_storeStrong((id *)&self->_expressSettings, a3);
}

- (OS_dispatch_queue)metadataQueue
{
  return self->_metadataQueue;
}

- (void)setMetadataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metadataQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_expressSettings, 0);
  objc_storeStrong((id *)&self->_backupMetadata, 0);
}

@end
