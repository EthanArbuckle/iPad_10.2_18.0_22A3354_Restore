@implementation BLBookletMigrationStore

- (BLBookletMigrationStore)init
{
  BLBookletMigrationStore *v2;
  BLServiceProxy *v3;
  id v4;
  BLServiceProxy *serviceProxy;
  NSObject *v6;
  id v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)BLBookletMigrationStore;
  v2 = -[BLBookletMigrationStore init](&v9, sel_init);
  if (v2)
  {
    v8 = 0;
    v3 = -[BLServiceProxy initWithError:]([BLServiceProxy alloc], "initWithError:", &v8);
    v4 = v8;
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

    if (!v2->_serviceProxy)
    {
      BLDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "Unable to create service proxy: %@", buf, 0xCu);
      }

      v2 = 0;
    }

  }
  return v2;
}

- (BOOL)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 error:(id *)a5
{
  id v8;
  BLServiceProxy *serviceProxy;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_212C9E220;
  v18 = sub_212C9E230;
  v19 = 0;
  serviceProxy = self->_serviceProxy;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212C9E238;
  v13[3] = &unk_24CE8B680;
  v13[4] = &v14;
  -[BLServiceProxy setMigrationState:forStoreIDs:withReply:](serviceProxy, "setMigrationState:forStoreIDs:withReply:", a3, v8, v13);
  v10 = (void *)v15[5];
  if (a5 && v10)
  {
    *a5 = objc_retainAutorelease(v10);
    v10 = (void *)v15[5];
  }
  v11 = v10 == 0;
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)migrationInfosWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BLServiceProxy *serviceProxy;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_212C9E220;
  v22 = sub_212C9E230;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_212C9E220;
  v16 = sub_212C9E230;
  v17 = 0;
  serviceProxy = self->_serviceProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C9E390;
  v11[3] = &unk_24CE8B6A8;
  v11[4] = &v12;
  v11[5] = &v18;
  -[BLServiceProxy migrationInfosWithStoreIDs:withReply:](serviceProxy, "migrationInfosWithStoreIDs:withReply:", v6, v11);
  v9 = MEMORY[0x2199A44E0](v7);
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v13[5], v19[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

- (void)migrationInfosWithState:(int64_t)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  objc_msgSend(v7, "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[BLBookletMigrationStore migrationInfosWithStates:completion:](self, "migrationInfosWithStates:completion:", v10, v8);
}

- (void)migrationInfosWithStates:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BLServiceProxy *serviceProxy;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_212C9E220;
  v22 = sub_212C9E230;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_212C9E220;
  v16 = sub_212C9E230;
  v17 = 0;
  serviceProxy = self->_serviceProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C9E5E0;
  v11[3] = &unk_24CE8B6A8;
  v11[4] = &v12;
  v11[5] = &v18;
  -[BLServiceProxy migrationInfosWithStates:withReply:](serviceProxy, "migrationInfosWithStates:withReply:", v6, v11);
  v9 = MEMORY[0x2199A44E0](v7);
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v13[5], v19[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4
{
  id v6;
  BLServiceProxy *serviceProxy;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_212C9E220;
  v16 = sub_212C9E230;
  v17 = 0;
  serviceProxy = self->_serviceProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212C9E754;
  v11[3] = &unk_24CE8B680;
  v11[4] = &v12;
  -[BLServiceProxy removeAllMigrationInfosExcludingStates:withReply:](serviceProxy, "removeAllMigrationInfosExcludingStates:withReply:", v6, v11);
  v8 = (void *)v13[5];
  if (a4 && v8)
  {
    *a4 = objc_retainAutorelease(v8);
    v8 = (void *)v13[5];
  }
  v9 = v8 == 0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (BLServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
