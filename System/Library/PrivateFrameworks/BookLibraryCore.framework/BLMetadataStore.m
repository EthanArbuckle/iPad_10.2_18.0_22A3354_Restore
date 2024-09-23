@implementation BLMetadataStore

- (BLMetadataStore)init
{
  BLMetadataStore *v2;
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
  v9.super_class = (Class)BLMetadataStore;
  v2 = -[BLMetadataStore init](&v9, sel_init);
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

- (BOOL)setRacGUID:(id)a3 forStoreID:(int64_t)a4 error:(id *)a5
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

  v8 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_212C9E994;
  v18 = sub_212C9E9A4;
  v19 = 0;
  serviceProxy = self->_serviceProxy;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212C9E9AC;
  v13[3] = &unk_24CE8B680;
  v13[4] = &v14;
  -[BLServiceProxy setRacGUID:forStoreID:withReply:](serviceProxy, "setRacGUID:forStoreID:withReply:", v8, a4, v13);
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

- (void)racGUIDForStoreID:(int64_t)a3 result:(id)a4
{
  id v6;
  BLServiceProxy *serviceProxy;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_212C9E994;
  v21 = sub_212C9E9A4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_212C9E994;
  v15 = sub_212C9E9A4;
  v16 = 0;
  serviceProxy = self->_serviceProxy;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212C9EAF8;
  v10[3] = &unk_24CE8B6D0;
  v10[4] = &v11;
  v10[5] = &v17;
  -[BLServiceProxy racGUIDForStoreID:withReply:](serviceProxy, "racGUIDForStoreID:withReply:", a3, v10);
  v8 = MEMORY[0x2199A44E0](v6);
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v12[5], v18[5]);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

}

- (BOOL)removeRacGUIDForStoreID:(int64_t)a3 error:(id *)a4
{
  BLServiceProxy *serviceProxy;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_212C9E994;
  v14 = sub_212C9E9A4;
  v15 = 0;
  serviceProxy = self->_serviceProxy;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212C9EC50;
  v9[3] = &unk_24CE8B680;
  v9[4] = &v10;
  -[BLServiceProxy removeRacGUIDForStoreID:withReply:](serviceProxy, "removeRacGUIDForStoreID:withReply:", a3, v9);
  v6 = (void *)v11[5];
  if (a4 && v6)
  {
    *a4 = objc_retainAutorelease(v6);
    v6 = (void *)v11[5];
  }
  v7 = v6 == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
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
