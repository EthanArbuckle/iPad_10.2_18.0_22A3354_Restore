@implementation BCCloudChangeTokenController

- (BCCloudChangeTokenController)initWithMOC:(id)a3 zoneName:(id)a4 cloudKitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCCloudChangeTokenController *v11;
  BCCloudChangeTokenController *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *zoneName;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];
  BCCloudChangeTokenController *v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BCCloudChangeTokenController;
  v11 = -[BCCloudChangeTokenController init](&v31, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_moc, v8);
    v17 = objc_msgSend_copy(v9, v13, v14, v15, v16);
    zoneName = v12->_zoneName;
    v12->_zoneName = (NSString *)v17;

    v19 = objc_storeWeak((id *)&v12->_cloudKitController, v10);
    v24 = objc_msgSend_didChangeContainer(v10, v20, v21, v22, v23);

    if (v24)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = sub_227DAC4C8;
      v29[3] = &unk_24F08B220;
      v30 = v12;
      objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v30, v25, (uint64_t)v29, v26, v27);

    }
  }

  return v12;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const __CFString *v48;
  uint64_t v49;

  v5 = a3;
  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_shared(MEMORY[0x24BE0FC08], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_verboseLoggingEnabled(v7, v8, v9, v10, v11);

  if (v12)
  {
    BDSCloudKitDevelopmentLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("NO");
      if (v5)
        v18 = CFSTR("YES");
      v47 = 138412290;
      v48 = v18;
      _os_log_impl(&dword_227D4F000, v17, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudChangeTokenController #enableCloudSync setEnableCloudSync %@\\\"\", (uint8_t *)&v47, 0xCu);
    }

  }
  if (self->_enableCloudSync != v5)
  {
    self->_enableCloudSync = v5;
    if (v5)
    {
      v19 = objc_alloc(MEMORY[0x24BDB91F8]);
      objc_msgSend_zoneName(self, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend_initWithZoneName_ownerName_(v19, v25, (uint64_t)v24, *MEMORY[0x24BDB8E88], v26);

      objc_msgSend_cloudKitController(self, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_privateCloudDatabaseController(v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_registerServerChangeTokenStore_forZoneID_(v37, v38, (uint64_t)self, (uint64_t)v27, v39);

    }
    else
    {
      objc_msgSend_cloudKitController(self, v13, v14, v15, v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_privateCloudDatabaseController(v27, v40, v41, v42, v43);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unregisterServerChangeTokenStore_(v32, v44, (uint64_t)self, v45, v46);
    }

  }
}

- (void)zoneNeedsUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moc(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_227DAC830;
  v19[3] = &unk_24F089EC8;
  v19[4] = self;
  v20 = v6;
  v21 = v12;
  v22 = v7;
  v13 = v7;
  v14 = v12;
  v15 = v6;
  objc_msgSend_performBlock_(v14, v16, (uint64_t)v19, v17, v18);

}

- (void)updateSaltVersionIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend_moc(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_227DACC58;
  v19[3] = &unk_24F089EC8;
  v19[4] = self;
  v20 = v6;
  v21 = v12;
  v22 = v7;
  v13 = v7;
  v14 = v12;
  v15 = v6;
  objc_msgSend_performBlock_(v14, v16, (uint64_t)v19, v17, v18);

}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  BCCloudChangeTokenController *v17;
  id v18;

  v4 = a3;
  objc_msgSend_moc(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_227DAD104;
  v15[3] = &unk_24F08A9C8;
  v16 = v9;
  v17 = self;
  v18 = v4;
  v10 = v4;
  v11 = v9;
  objc_msgSend_performBlock_(v11, v12, (uint64_t)v15, v13, v14);

}

- (void)storeServerChangeToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *inited;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_enableCloudSync(self, v8, v9, v10, v11))
  {
    v16 = objc_alloc(MEMORY[0x24BDD1618]);
    inited = (void *)objc_msgSend_initRequiringSecureCoding_(v16, v17, 1, v18, v19);
    objc_msgSend_encodeWithCoder_(v6, v21, (uint64_t)inited, v22, v23);
    objc_msgSend_finishEncoding(inited, v24, v25, v26, v27);
    objc_msgSend_encodedData(inited, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_moc(self, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = sub_227DAD55C;
    v56[3] = &unk_24F08B248;
    v56[4] = self;
    v57 = v6;
    v58 = v37;
    v59 = v32;
    v60 = v7;
    v38 = v32;
    v39 = v37;
    objc_msgSend_performBlock_(v39, v40, (uint64_t)v56, v41, v42);

  }
  else
  {
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v12, v13, v14, v15);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_verboseLoggingEnabled(v43, v44, v45, v46, v47);

    if (v48)
    {
      BDSCloudKitDevelopmentLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_zoneName(self, v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v54;
        v63 = 2112;
        v64 = v6;
        _os_log_impl(&dword_227D4F000, v49, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudChangeTokenController - #recordChange zone: %@ NOT storing server change token: %@\\\"\", buf, 0x16u);

      }
    }
    v55 = _Block_copy(v7);
    inited = v55;
    if (v55)
      (*((void (**)(void *))v55 + 2))(v55);
  }

}

- (void)serverChangeTokenWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  BCCloudChangeTokenController *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_moc(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_zoneName(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v15;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_INFO, "BCCloudChangeTokenController - serverChangeTokenWithCompletion: %@", buf, 0xCu);

  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_227DAD8C8;
  v21[3] = &unk_24F08A9C8;
  v22 = v9;
  v23 = self;
  v24 = v4;
  v16 = v4;
  v17 = v9;
  objc_msgSend_performBlock_(v17, v18, (uint64_t)v21, v19, v20);

}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSManagedObjectContext)moc
{
  return (NSManagedObjectContext *)objc_loadWeakRetained((id *)&self->_moc);
}

- (void)setMoc:(id)a3
{
  objc_storeWeak((id *)&self->_moc, a3);
}

- (BCCloudKitController)cloudKitController
{
  return (BCCloudKitController *)objc_loadWeakRetained((id *)&self->_cloudKitController);
}

- (void)setCloudKitController:(id)a3
{
  objc_storeWeak((id *)&self->_cloudKitController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudKitController);
  objc_destroyWeak((id *)&self->_moc);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
