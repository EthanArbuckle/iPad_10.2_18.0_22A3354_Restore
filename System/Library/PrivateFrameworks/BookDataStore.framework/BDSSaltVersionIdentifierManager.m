@implementation BDSSaltVersionIdentifierManager

- (BDSSaltVersionIdentifierManager)initWithZoneDataManager:(id)a3 tokenController:(id)a4 databaseController:(id)a5
{
  id v8;
  id v9;
  id v10;
  BDSSaltVersionIdentifierManager *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  id WeakRetained;
  id v28;
  uint64_t v29;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BDSSaltVersionIdentifierManager;
  v11 = -[BDSSaltVersionIdentifierManager init](&v31, sel_init);
  v12 = (uint64_t)v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_zoneDataManager, v8);
    objc_storeWeak((id *)(v12 + 16), v9);
    objc_msgSend_zoneName(v9, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_copy(v17, v18, v19, v20, v21);
    v23 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v22;

    objc_msgSend_addObserver_zoneID_(v10, v24, v12, *(_QWORD *)(v12 + 24), v25);
    BDSCloudKitSyncLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v12 + 8));
      v28 = objc_loadWeakRetained((id *)(v12 + 16));
      v29 = *(_QWORD *)(v12 + 24);
      *(_DWORD *)buf = 138412802;
      v33 = WeakRetained;
      v34 = 2112;
      v35 = v28;
      v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_227D4F000, v26, OS_LOG_TYPE_INFO, "[BDSSaltVersionIdentifierManager] init with %@ %@. Adding to zone:(%@)", buf, 0x20u);

    }
  }

  return (BDSSaltVersionIdentifierManager *)v12;
}

- (void)databaseController:(id)a3 saltVersionIdentifierChanged:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_handleSaltVersionIdentifierChange_completion_, a4, a5, a5);
}

- (void)handleSaltVersionIdentifierChange:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  BDSSaltVersionIdentifierManager *v32;
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[5];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_zoneName(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BDSCloudKitSyncLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v12;
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_227D4F000, v13, OS_LOG_TYPE_DEFAULT, "[BDSSaltVersionIdentifierManager] #saltVersionIdentifierChanged - %@ ---1. %@  ", buf, 0x16u);
  }

  v14 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_227D87688;
  aBlock[3] = &unk_24F089EC8;
  aBlock[4] = self;
  v15 = v12;
  v37 = v15;
  v16 = v6;
  v38 = v16;
  v17 = v7;
  v39 = v17;
  v18 = _Block_copy(aBlock);
  objc_msgSend_tokenController(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = sub_227D879D8;
  v30[3] = &unk_24F089F18;
  v34 = v18;
  v35 = v17;
  v31 = v15;
  v32 = self;
  v33 = v16;
  v24 = v16;
  v25 = v17;
  v26 = v18;
  v27 = v15;
  objc_msgSend_zoneNeedsUpdate_completion_(v23, v28, (uint64_t)v24, (uint64_t)v30, v29);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneDataManager(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("<%@:%p zoneName=%@ zoneDataManager=%@>"), v17, v18, v5, self, v10, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (BDSCloudKitSupportZoneRecovery)zoneDataManager
{
  return (BDSCloudKitSupportZoneRecovery *)objc_loadWeakRetained((id *)&self->_zoneDataManager);
}

- (void)setZoneDataManager:(id)a3
{
  objc_storeWeak((id *)&self->_zoneDataManager, a3);
}

- (BCCloudChangeTokenController)tokenController
{
  return (BCCloudChangeTokenController *)objc_loadWeakRetained((id *)&self->_tokenController);
}

- (void)setTokenController:(id)a3
{
  objc_storeWeak((id *)&self->_tokenController, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_destroyWeak((id *)&self->_tokenController);
  objc_destroyWeak((id *)&self->_zoneDataManager);
}

@end
