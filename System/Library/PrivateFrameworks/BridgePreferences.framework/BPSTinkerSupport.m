@implementation BPSTinkerSupport

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance__instance;
}

- (BOOL)isActiveTinker
{
  void *v2;
  void *v3;
  BOOL v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;

  BPSGetActiveDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B340]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    pbb_bridge_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = "No active device found";
      v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
LABEL_9:

    v4 = 0;
    goto LABEL_10;
  }
  if (!v3)
  {
    pbb_bridge_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v6 = "Device is not tinker, so we will not use it for account matching";
      v7 = (uint8_t *)&v9;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v4 = 1;
LABEL_10:

  return v4;
}

- (void)fetchFamilyDetails
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = objc_alloc_init(MEMORY[0x24BE30A88]);
  objc_msgSend(v3, "setCachePolicy:", 1);
  pbb_bridge_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "fetchFamilyDetails start", buf, 2u);
  }

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke;
  v5[3] = &unk_24CBE4860;
  v5[4] = self;
  objc_msgSend(v3, "startRequestWithCompletionHandler:", v5);

}

- (void)getActiveTinkerFamilyMemberWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__BPSTinkerSupport_getActiveTinkerFamilyMemberWithCompletion___block_invoke;
  v6[3] = &unk_24CBE48E8;
  v7 = v4;
  v5 = v4;
  -[BPSTinkerSupport getActiveTinkerFamilyMemberDetailsWithCompletion:](self, "getActiveTinkerFamilyMemberDetailsWithCompletion:", v6);

}

- (void)getActiveTinkerFamilyMemberDetailsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__BPSTinkerSupport_getActiveTinkerFamilyMemberDetailsWithCompletion___block_invoke;
  v6[3] = &unk_24CBE4910;
  v7 = v4;
  v5 = v4;
  -[BPSTinkerSupport getActiveTinkerFamilyDetailsWithCompletion:](self, "getActiveTinkerFamilyDetailsWithCompletion:", v6);

}

- (void)getActiveTinkerFamilyDetailsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil replyBlock"));
  pbb_bridge_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x212BDABD0](v4);
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "Reply block: %@", buf, 0xCu);

  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke;
  v9[3] = &unk_24CBE49D8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(queue, v9);

}

void __34__BPSTinkerSupport_sharedInstance__block_invoke()
{
  BPSTinkerSupport *v0;
  void *v1;

  v0 = objc_alloc_init(BPSTinkerSupport);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (BPSTinkerSupport)init
{
  BPSTinkerSupport *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  NSSManager *nssManager;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)BPSTinkerSupport;
  v2 = -[BPSTinkerSupport init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AccountRetrieval", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getNSSManagerClass_softClass;
    v15 = getNSSManagerClass_softClass;
    if (!getNSSManagerClass_softClass)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getNSSManagerClass_block_invoke;
      v11[3] = &unk_24CBE4A00;
      v11[4] = &v12;
      __getNSSManagerClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = objc_msgSend([v6 alloc], "initWithQueue:", v2->_queue);
    nssManager = v2->_nssManager;
    v2->_nssManager = (NSSManager *)v7;

  }
  return v2;
}

void __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pbb_bridge_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "fetchFamilyDetails complete, error: %@", buf, 0xCu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = v5;
  v11 = v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke_37;
  block[3] = &unk_24CBE4838;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (id)cachedTinkerFamilyMemeber
{
  FAFamilyMember *v3;

  if (-[BPSTinkerSupport isActiveTinker](self, "isActiveTinker"))
    v3 = self->_currentTinkerMember;
  else
    v3 = 0;
  return v3;
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v20[5];
  id v21;
  __int128 *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  __int128 *p_buf;
  _QWORD *v34;
  _QWORD *v35;
  uint8_t v36[16];
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  pbb_bridge_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BPSTinkerSupport getActiveTinkerFamilyDetailsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v4 = a1 + 32;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  *(_QWORD *)(*(_QWORD *)v4 + 64) = 0;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  *(_QWORD *)(*(_QWORD *)v4 + 48) = 0;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(*(_QWORD *)v4 + 56) = 0;

  v9 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_51;
  v45[3] = &unk_24CBE4938;
  v45[4] = *(_QWORD *)(a1 + 32);
  v46 = *(id *)(a1 + 40);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BDABD0](v45);
  if ((objc_msgSend(*(id *)(a1 + 32), "isActiveTinker") & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy_;
    v50 = __Block_byref_object_dispose_;
    v51 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy_;
    v43[4] = __Block_byref_object_dispose_;
    v44 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy_;
    v41[4] = __Block_byref_object_dispose_;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy_;
    v39[4] = __Block_byref_object_dispose_;
    v40 = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy_;
    v37[4] = __Block_byref_object_dispose_;
    v38 = 0;
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    pbb_bridge_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_21147E000, v12, OS_LOG_TYPE_DEFAULT, "fetching accounts", v36, 2u);
    }

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v31[0] = v9;
    v31[1] = 3221225472;
    v31[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52;
    v31[3] = &unk_24CBE4960;
    p_buf = &buf;
    v34 = v37;
    v35 = v41;
    v14 = v11;
    v32 = v14;
    objc_msgSend(v13, "getAccountsInfo:", v31);
    dispatch_group_enter(v14);
    v15 = objc_alloc_init(MEMORY[0x24BE30A88]);
    objc_msgSend(v15, "setCachePolicy:", 2);
    pbb_bridge_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_21147E000, v16, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest start", v36, 2u);
    }

    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_54;
    v27[3] = &unk_24CBE4988;
    v29 = v43;
    v30 = v39;
    v17 = v14;
    v28 = v17;
    objc_msgSend(v15, "startRequestWithCompletionHandler:", v27);
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_55;
    v20[3] = &unk_24CBE49B0;
    v22 = &buf;
    v23 = v43;
    v19 = v10;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v19;
    v24 = v37;
    v25 = v41;
    v26 = v39;
    dispatch_group_notify(v17, v18, v20);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v43, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v10[2](v10, 0, 0, 0);
  }

}

void __69__BPSTinkerSupport_getActiveTinkerFamilyMemberDetailsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(a2, "tinkerFamilyMember");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v9, v8, v7);

}

uint64_t __62__BPSTinkerSupport_getActiveTinkerFamilyMemberWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchProfilePictures
{
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  id *p_profilePictureStore;
  FAProfilePictureStore *profilePictureStore;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 buf;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = self->_cachedFamilyCircle == 0;
  pbb_bridge_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[BPSTinkerSupport fetchProfilePictures]";
      _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "%s: can't fetch without family circle", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[BPSTinkerSupport fetchProfilePictures]";
      _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "%s: fetching profile pictures", (uint8_t *)&buf, 0xCu);
    }

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v6 = (void *)getFAProfilePictureStoreClass_softClass;
    v15 = getFAProfilePictureStoreClass_softClass;
    if (!getFAProfilePictureStoreClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v17 = __getFAProfilePictureStoreClass_block_invoke;
      v18 = &unk_24CBE4A00;
      v19 = &v12;
      __getFAProfilePictureStoreClass_block_invoke((uint64_t)&buf);
      v6 = (void *)v13[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v12, 8);
    v8 = [v7 alloc];
    v9 = objc_msgSend(v8, "initWithFamilyCircle:", self->_cachedFamilyCircle, v12);
    profilePictureStore = self->_profilePictureStore;
    p_profilePictureStore = (id *)&self->_profilePictureStore;
    *p_profilePictureStore = (id)v9;

    objc_msgSend(*p_profilePictureStore, "fetchProfileImagesWithCompletion:", &__block_literal_global_41);
  }
}

uint64_t __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke_37(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("BPSTinkerSupportFamilyCircleUpdatedNotification"), 0);

  return objc_msgSend(*(id *)(a1 + 32), "fetchProfilePictures");
}

void __40__BPSTinkerSupport_fetchProfilePictures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  pbb_bridge_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[BPSTinkerSupport fetchProfilePictures]_block_invoke";
      v11 = 2112;
      v12 = (uint64_t)v8;
      _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "%s: error %@", (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[BPSTinkerSupport fetchProfilePictures]_block_invoke";
      v11 = 2048;
      v12 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "%s: fetched %lu profile pictures", (uint8_t *)&v9, 0x16u);
    }

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_43);
  }

}

void __40__BPSTinkerSupport_fetchProfilePictures__block_invoke_42()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("BPSTinkerSupportProfilePicturesUpdatedNotification"), 0);

}

- (void)resetCachedDeviceValues
{
  FAFamilyMember *currentTinkerMember;
  AKDevice *currentTinkerAKDevice;

  currentTinkerMember = self->_currentTinkerMember;
  self->_currentTinkerMember = 0;

  currentTinkerAKDevice = self->_currentTinkerAKDevice;
  self->_currentTinkerAKDevice = 0;

}

- (FAFamilyCircle)cachedFamilyCircle
{
  return self->_cachedFamilyCircle;
}

- (id)cachedProfilePictureForFamilyMember:(id)a3
{
  id v4;
  FAProfilePictureStore *profilePictureStore;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  profilePictureStore = self->_profilePictureStore;
  if (profilePictureStore
    && (-[FAProfilePictureStore profilePictureForFamilyMember:pictureDiameter:](profilePictureStore, "profilePictureForFamilyMember:pictureDiameter:", v4, 36.0), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    objc_msgSend(v8, "imageWithData:scale:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)cachedTinkerAKDevice
{
  AKDevice *v3;

  if (-[BPSTinkerSupport isActiveTinker](self, "isActiveTinker"))
    v3 = self->_currentTinkerAKDevice;
  else
    v3 = 0;
  return v3;
}

- (void)setTinkerFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_currentTinkerMember, a3);
}

- (id)cachedPairingParentFamilyMember
{
  return self->_pairingParentFamilyMember;
}

- (id)cachedOrganizerParentFamilyMember
{
  return self->_organizerParentFamilyMember;
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_51(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint8_t v23[16];

  v7 = a3;
  v8 = a4;
  v9 = a2;
  pbb_bridge_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_21147E000, v10, OS_LOG_TYPE_DEFAULT, "Updating current tinker family details", v23, 2u);
  }

  objc_msgSend(v9, "tinkerFamilyMember");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 64);
  *(_QWORD *)(v14 + 64) = v7;
  v16 = v7;

  objc_msgSend(v9, "pairingParentFamilyMember");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 48);
  *(_QWORD *)(v18 + 48) = v17;

  objc_msgSend(v9, "organizerParentFamilyMember");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 56);
  *(_QWORD *)(v21 + 56) = v20;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  __int128 buf;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v38 = a2;
  v39 = a3;
  pbb_bridge_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v39;
    _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "fetching accounts complete. error %@", (uint8_t *)&buf, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v5 = v39;
  if (!v39)
  {
    v37 = (void *)objc_opt_new();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v47 = 0x2020000000;
    v6 = (_QWORD *)getkNSSAccountsKeySymbolLoc_ptr;
    v48 = getkNSSAccountsKeySymbolLoc_ptr;
    if (!getkNSSAccountsKeySymbolLoc_ptr)
    {
      v7 = (void *)NanoSystemSettingsLibrary();
      v6 = dlsym(v7, "kNSSAccountsKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v6;
      getkNSSAccountsKeySymbolLoc_ptr = (uint64_t)v6;
    }
    _Block_object_dispose(&buf, 8);
    if (!v6)
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
    objc_msgSend(v38, "objectForKeyedSubscript:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v47 = 0x2020000000;
    v9 = (id *)getkNSSAKDeviceKeySymbolLoc_ptr;
    v48 = getkNSSAKDeviceKeySymbolLoc_ptr;
    if (!getkNSSAKDeviceKeySymbolLoc_ptr)
    {
      v10 = (void *)NanoSystemSettingsLibrary();
      v9 = (id *)dlsym(v10, "kNSSAKDeviceKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;
      getkNSSAKDeviceKeySymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&buf, 8);
    if (!v9)
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
    v11 = *v9;
    objc_msgSend(v38, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setLinkType:", 2);
    pbb_bridge_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_21147E000, v15, OS_LOG_TYPE_DEFAULT, "watch AKDevice :%@", (uint8_t *)&buf, 0xCu);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v42;
      v20 = *MEMORY[0x24BDB3FD8];
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v47 = 0x2020000000;
          v23 = (_QWORD *)getkNSSAccountTypeKeySymbolLoc_ptr;
          v48 = getkNSSAccountTypeKeySymbolLoc_ptr;
          if (!getkNSSAccountTypeKeySymbolLoc_ptr)
          {
            v24 = (void *)NanoSystemSettingsLibrary();
            v23 = dlsym(v24, "kNSSAccountTypeKey");
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v23;
            getkNSSAccountTypeKeySymbolLoc_ptr = (uint64_t)v23;
          }
          _Block_object_dispose(&buf, 8);
          if (!v23)
            __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1();
          objc_msgSend(v22, "objectForKeyedSubscript:", *v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "isEqualToString:", v20))
          {
            getkNSSAccountDSIDKey();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            getkNSSAccountDSIDKey();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v27, v28);

            getkNSSAccountAltDSIDKey();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            getkNSSAccountAltDSIDKey();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v30, v31);

            getkNSSAccountUsernameKey();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            getkNSSAccountUsernameKey();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v33, v34);

            goto LABEL_25;
          }

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_25:

    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v37;

    v5 = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pbb_bridge_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest complete, error: %@", (uint8_t *)&v15, 0xCu);

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;
  v14 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_55(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "familyMemberMatchingAccount:inCircle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setTinkerFamilyMember:", v2);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "members", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v9, "isMe") && objc_msgSend(v9, "isParent"))
            objc_msgSend(v3, "setPairingParentFamilyMember:", v9);
          if (objc_msgSend(v9, "isOrganizer"))
            objc_msgSend(v3, "setOrganizerParentFamilyMember:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)familyMemberMatchingAccount:(id)a3 inCircle:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(a4, "members");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "altDSID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        getkNSSAccountAltDSIDKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
          goto LABEL_15;
        objc_msgSend(v7, "dsid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v7, "dsid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          getkNSSAccountDSIDKey();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v16, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
        objc_msgSend(v7, "appleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        getkNSSAccountUsernameKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isEqualToString:", v22);

        if ((v23 & 1) != 0)
        {
LABEL_15:
          v24 = v7;
          goto LABEL_17;
        }
      }
      v24 = 0;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    v24 = 0;
  }
LABEL_17:

  return v24;
}

- (void)setCachedFamilyCircle:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFamilyCircle, a3);
}

- (FAProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
  objc_storeStrong((id *)&self->_profilePictureStore, a3);
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
  objc_storeStrong((id *)&self->_nssManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FAFamilyMember)currentTinkerMember
{
  return self->_currentTinkerMember;
}

- (void)setCurrentTinkerMember:(id)a3
{
  objc_storeStrong((id *)&self->_currentTinkerMember, a3);
}

- (FAFamilyMember)pairingParentFamilyMember
{
  return self->_pairingParentFamilyMember;
}

- (void)setPairingParentFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, a3);
}

- (FAFamilyMember)organizerParentFamilyMember
{
  return self->_organizerParentFamilyMember;
}

- (void)setOrganizerParentFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_organizerParentFamilyMember, a3);
}

- (AKDevice)currentTinkerAKDevice
{
  return self->_currentTinkerAKDevice;
}

- (void)setCurrentTinkerAKDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentTinkerAKDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTinkerAKDevice, 0);
  objc_storeStrong((id *)&self->_organizerParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_currentTinkerMember, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_cachedFamilyCircle, 0);
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_52_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  __getNSSManagerClass_block_invoke_cold_1(v0);
}

@end
