@implementation BCSBusinessQueryService

- (BCSBusinessQueryService)initWithConnection:(id)a3 clientBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  BCSBusinessQueryService *v9;
  BCSBusinessQueryService *v10;
  uint64_t v11;
  NSString *clientBundleIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSBusinessQueryService;
  v9 = -[BCSBusinessQueryService init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = objc_msgSend(v8, "copy");
    clientBundleIdentifier = v10->_clientBundleIdentifier;
    v10->_clientBundleIdentifier = (NSString *)v11;

    -[BCSXPCDaemonConnectionProtocol resume](v10->_connection, "resume");
  }

  return v10;
}

- (BCSBusinessQueryService)init
{
  id *v3;
  void *v4;
  void *v5;
  BCSBusinessQueryService *v6;

  v3 = -[BCSXPCDaemonConnection initWithMachServiceName:]((id *)[BCSXPCDaemonConnection alloc], CFSTR("com.apple.businessservicesd"));
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BCSBusinessQueryService initWithConnection:clientBundleIdentifier:](self, "initWithConnection:clientBundleIdentifier:", v3, v5);

  return v6;
}

- (void)warmCacheIfNecessaryForPhoneNumbers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  BCSXPCDaemonConnectionProtocol *connection;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[BCSBusinessQueryService warmCacheIfNecessaryForPhoneNumbers:]";
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  if ((unint64_t)objc_msgSend(v4, "count") < 0x1F)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, 30);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (self)
    connection = self->_connection;
  else
    connection = 0;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "warmCacheIfNecessaryForPhoneNumbers:forClientBundleID:", v7, CFSTR("com.apple.businessservicesd"));

}

- (id)businessItemForPhoneNumber:(id)a3 isMessageable:(BOOL *)a4 isChatSuggestVisible:(BOOL *)a5 error:(id *)a6
{
  if (a4)
    *a4 = 1;
  return -[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:](self, "businessItemForPhoneNumber:isChatSuggestVisible:error:", a3, a5, a6);
}

- (id)businessItemForPhoneNumber:(id)a3 isChatSuggestVisible:(BOOL *)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  const char *v10;
  id Property;
  id v12;
  double v13;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  BOOL v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  NSObject *v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t v47[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  ABSLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]";
    _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__2;
  v54 = __Block_byref_object_dispose__2;
  v55 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  v40 = 0;
  if (self)
    Property = objc_getProperty(self, v10, 8, 1);
  else
    Property = 0;
  v12 = Property;
  objc_msgSend(v12, "timeIntervalSinceNow");
  v15 = v13 <= 0.0 && v12 != 0;
  v16 = v13 > -2.0 && v15;
  if (v16)
    goto LABEL_16;
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __81__BCSBusinessQueryService_businessItemForPhoneNumber_isChatSuggestVisible_error___block_invoke;
  v30[3] = &unk_24C39C480;
  p_buf = &buf;
  v33 = &v41;
  v34 = &v35;
  v18 = v17;
  v31 = v18;
  -[BCSBusinessQueryService _fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]((uint64_t)self, v8, v30);
  v19 = dispatch_time(0, 1000000000);
  v20 = dispatch_group_wait(v18, v19) == 0;

  if (v20)
  {
    if (a4)
      *a4 = *((_BYTE *)v42 + 24);
    if (a5)
      *a5 = objc_retainAutorelease((id)v36[5]);
    if (self)
      objc_setProperty_atomic(self, v21, 0, 8);
    v28 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  }
  else
  {
LABEL_16:
    ABSLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v47 = 136315394;
      v48 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]";
      v49 = 1024;
      v50 = !v16;
      _os_log_impl(&dword_20ACAD000, v22, OS_LOG_TYPE_DEFAULT, "%s timed out - did really attempt:%d", v47, 0x12u);
    }

    if (a4)
      *a4 = 0;
    if (a5)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0FD8];
      v45[0] = *MEMORY[0x24BDD0FC8];
      v45[1] = v24;
      v46[0] = CFSTR("businessItemForPhoneNumber server fetch timed out");
      v46[1] = CFSTR("The operation timed out");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("BusinessChat"), -1001, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        objc_setProperty_atomic(self, v26, v27, 8);

    }
    v28 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&buf, 8);

  return v28;
}

void __81__BCSBusinessQueryService_businessItemForPhoneNumber_isChatSuggestVisible_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a4;
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v9)
    {
      if (v11)
      {
        v12 = 136315650;
        v13 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]_block_invoke";
        v14 = 2112;
        v15 = v9;
        v16 = 1024;
        v17 = a3;
        _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed fetch with error %@ - isChatSuggestVisible:%d", (uint8_t *)&v12, 0x1Cu);
      }

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
    }
    else
    {
      if (v11)
      {
        v12 = 136315394;
        v13 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]_block_invoke";
        v14 = 1024;
        LODWORD(v15) = a3;
        _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s No bizItem exists for this phoneNumber - isChatSuggestVisible:%d", (uint8_t *)&v12, 0x12u);
      }

    }
  }
  else
  {
    if (v11)
    {
      v12 = 136315394;
      v13 = "-[BCSBusinessQueryService businessItemForPhoneNumber:isChatSuggestVisible:error:]_block_invoke";
      v14 = 1024;
      LODWORD(v15) = a3;
      _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetched bizItem Visible %d", (uint8_t *)&v12, 0x12u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_fetchBusinessItemWithDetailsForPhoneNumber:(uint64_t)a1 forClientBundleID:(void *)a2 completion:(void *)a3
{
  id v5;
  __CFString *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a1)
  {
    v6 = CFSTR("com.apple.businessservicesd");
    v7 = a2;
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 16);
      v10 = v9;
      objc_msgSend(v10, "remoteObjectProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v18 = "-[BCSBusinessQueryService _fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]";
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

    }
    v12 = *(id *)(a1 + 16);
    objc_msgSend(v12, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __100__BCSBusinessQueryService__fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke;
    v15[3] = &unk_24C39C4D0;
    v14 = v5;

    v16 = v14;
    objc_msgSend(v13, "fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:", v7, CFSTR("com.apple.businessservicesd"), v15);

  }
}

- (void)fetchBusinessItemWithPhoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService fetchBusinessItemWithPhoneNumber:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__BCSBusinessQueryService_fetchBusinessItemWithPhoneNumber_completion___block_invoke;
  v17[3] = &unk_24C39C4A8;

  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "fetchBusinessItemWithPhoneNumber:forClientBundleID:completion:", v7, CFSTR("com.apple.businessservicesd"), v17);

}

uint64_t __71__BCSBusinessQueryService_fetchBusinessItemWithPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchBusinessItemWithDetailsForPhoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__BCSBusinessQueryService_fetchBusinessItemWithDetailsForPhoneNumber_completion___block_invoke;
  v8[3] = &unk_24C39C4D0;
  v9 = v6;
  v7 = v6;
  -[BCSBusinessQueryService _fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]((uint64_t)self, a3, v8);

}

uint64_t __81__BCSBusinessQueryService_fetchBusinessItemWithDetailsForPhoneNumber_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchBusinessItemForPhoneNumber:(id)a3 completion:(id)a4
{
  -[BCSBusinessQueryService _fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]((uint64_t)self, a3, a4);
}

uint64_t __100__BCSBusinessQueryService__fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)isBusinessRegisteredForPhoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService isBusinessRegisteredForPhoneNumber:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__BCSBusinessQueryService_isBusinessRegisteredForPhoneNumber_completion___block_invoke;
  v17[3] = &unk_24C39BDC8;

  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "fetchIsBusinessPhoneNumber:forClientBundleID:completion:", v7, CFSTR("com.apple.businessservicesd"), v17);

}

uint64_t __73__BCSBusinessQueryService_isBusinessRegisteredForPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchSquareIconDataForBusinessItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    v7 = a3;
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = self->_connection;
        connection = self->_connection;
      }
      else
      {
        v9 = 0;
        connection = 0;
      }
      v11 = connection;
      -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v20 = "-[BCSBusinessQueryService fetchSquareIconDataForBusinessItem:completion:]";
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

    }
    if (self)
      v13 = self->_connection;
    else
      v13 = 0;
    v14 = v13;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__BCSBusinessQueryService_fetchSquareIconDataForBusinessItem_completion___block_invoke;
    v17[3] = &unk_24C39C4F8;
    v16 = v6;

    v18 = v16;
    objc_msgSend(v15, "fetchSquareIconDataForBusinessItem:forClientBundleID:completion:", v7, CFSTR("com.apple.businessservicesd"), v17);

  }
}

uint64_t __73__BCSBusinessQueryService_fetchSquareIconDataForBusinessItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLinkItemWithURL:(id)a3 completion:(id)a4
{
  -[BCSBusinessQueryService fetchLinkItemWithURL:chopURL:completion:](self, "fetchLinkItemWithURL:chopURL:completion:", a3, 1, a4);
}

- (void)fetchLinkItemWithURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  BCSXPCDaemonConnectionProtocol *v11;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v13;
  void *v14;
  BCSXPCDaemonConnectionProtocol *v15;
  BCSXPCDaemonConnectionProtocol *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  BCSXPCDaemonConnectionProtocol *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v11 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v11 = 0;
      connection = 0;
    }
    v13 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v13, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[BCSBusinessQueryService fetchLinkItemWithURL:chopURL:completion:]";
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v15 = self->_connection;
  else
    v15 = 0;
  v16 = v15;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v16, "remoteObjectProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__BCSBusinessQueryService_fetchLinkItemWithURL_chopURL_completion___block_invoke;
  v19[3] = &unk_24C39C520;
  v20 = v8;
  v18 = v8;
  objc_msgSend(v17, "fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:", v9, v5, self, v19);

}

void __67__BCSBusinessQueryService_fetchLinkItemWithURL_chopURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  BCSLinkItem *v7;
  BCSLocaleHelper *v8;
  BCSLinkItem *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (v10)
    {
      v7 = [BCSLinkItem alloc];
      v8 = objc_alloc_init(BCSLocaleHelper);
      v9 = -[BCSLinkItem initWithLinkItemModel:localeHelper:](v7, "initWithLinkItemModel:localeHelper:", v10, v8);

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    }
  }

}

- (void)isBusinessRegisteredForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__BCSBusinessQueryService_isBusinessRegisteredForURL_completion___block_invoke;
  v8[3] = &unk_24C39C548;
  v9 = v6;
  v7 = v6;
  -[BCSBusinessQueryService isBusinessRegisteredForURL:chopURL:completion:](self, "isBusinessRegisteredForURL:chopURL:completion:", a3, 1, v8);

}

uint64_t __65__BCSBusinessQueryService_isBusinessRegisteredForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  BCSXPCDaemonConnectionProtocol *v11;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v13;
  void *v14;
  BCSXPCDaemonConnectionProtocol *v15;
  BCSXPCDaemonConnectionProtocol *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  BCSXPCDaemonConnectionProtocol *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v11 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v11 = 0;
      connection = 0;
    }
    v13 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v13, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[BCSBusinessQueryService isBusinessRegisteredForURL:chopURL:completion:]";
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v15 = self->_connection;
  else
    v15 = 0;
  v16 = v15;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v16, "remoteObjectProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __73__BCSBusinessQueryService_isBusinessRegisteredForURL_chopURL_completion___block_invoke;
  v19[3] = &unk_24C39C570;
  v20 = v8;
  v18 = v8;
  objc_msgSend(v17, "isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:", v9, v5, self, v19);

}

uint64_t __73__BCSBusinessQueryService_isBusinessRegisteredForURL_chopURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  return result;
}

- (void)_isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  BCSXPCDaemonConnectionProtocol *v11;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v13;
  void *v14;
  BCSXPCDaemonConnectionProtocol *v15;
  BCSXPCDaemonConnectionProtocol *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  BCSXPCDaemonConnectionProtocol *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v11 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v11 = 0;
      connection = 0;
    }
    v13 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v13, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[BCSBusinessQueryService _isBusinessRegisteredForURL:chopURL:completion:]";
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v15 = self->_connection;
  else
    v15 = 0;
  v16 = v15;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v16, "remoteObjectProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__BCSBusinessQueryService__isBusinessRegisteredForURL_chopURL_completion___block_invoke;
  v19[3] = &unk_24C39C570;
  v20 = v8;
  v18 = v8;
  objc_msgSend(v17, "isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:", v9, v5, self, v19);

}

uint64_t __74__BCSBusinessQueryService__isBusinessRegisteredForURL_chopURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchLinkItemWithHash:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService fetchLinkItemWithHash:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__BCSBusinessQueryService_fetchLinkItemWithHash_completion___block_invoke;
  v17[3] = &unk_24C39C520;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "fetchLinkItemModelWithHash:forClientBundleID:completion:", v7, self, v17);

}

void __60__BCSBusinessQueryService_fetchLinkItemWithHash_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  BCSLinkItem *v7;
  BCSLocaleHelper *v8;
  BCSLinkItem *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (v10)
    {
      v7 = [BCSLinkItem alloc];
      v8 = objc_alloc_init(BCSLocaleHelper);
      v9 = -[BCSLinkItem initWithLinkItemModel:localeHelper:](v7, "initWithLinkItemModel:localeHelper:", v10, v8);

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    }
  }

}

- (void)isBusinessCallerRegisteredForPhoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService isBusinessCallerRegisteredForPhoneNumber:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__BCSBusinessQueryService_isBusinessCallerRegisteredForPhoneNumber_completion___block_invoke;
  v17[3] = &unk_24C39BDC8;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "isBusinessCallerRegisteredForPhoneNumber:forClientBundleID:completion:", v7, self, v17);

}

uint64_t __79__BCSBusinessQueryService_isBusinessCallerRegisteredForPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchBusinessCallerMetadataWithPhoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService fetchBusinessCallerMetadataWithPhoneNumber:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__BCSBusinessQueryService_fetchBusinessCallerMetadataWithPhoneNumber_completion___block_invoke;
  v17[3] = &unk_24C39C598;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "fetchBusinessCallerMetadataForPhoneNumber:forClientBundleID:completion:", v7, self, v17);

}

uint64_t __81__BCSBusinessQueryService_fetchBusinessCallerMetadataWithPhoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 metadataCallback:(id)a4 logoURLCallback:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  BCSXPCDaemonConnectionProtocol *v15;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v17;
  void *v18;
  BCSXPCDaemonConnectionProtocol *v19;
  BCSXPCDaemonConnectionProtocol *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  BCSXPCDaemonConnectionProtocol *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  ABSLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v15 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v15 = 0;
      connection = 0;
    }
    v17 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v17, "remoteObjectProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v32 = "-[BCSBusinessQueryService fetchBusinessCallerMetadataForPhoneNumber:metadataCallback:logoURLCallback:completion:]";
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v18;
    _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v19 = self->_connection;
  else
    v19 = 0;
  v20 = v19;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v20, "remoteObjectProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v28 = v11;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke;
  v29[3] = &unk_24C39C5C0;
  v30 = v10;
  v26 = v12;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_2;
  v27[3] = &unk_24C39C5E8;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_3;
  v25[3] = &unk_24C39C610;
  v22 = v12;
  v23 = v11;
  v24 = v10;
  objc_msgSend(v21, "fetchBusinessCallerMetadataForPhoneNumber:forClientBundleID:metadataCallback:logoURLCallback:completion:", v13, self, v29, v27, v25);

}

uint64_t __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __113__BCSBusinessQueryService_fetchBusinessCallerMetadataForPhoneNumber_metadataCallback_logoURLCallback_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchBusinessMetadataForEmail:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService fetchBusinessMetadataForEmail:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__BCSBusinessQueryService_fetchBusinessMetadataForEmail_completion___block_invoke;
  v17[3] = &unk_24C39C638;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "fetchBusinessMetadataForEmail:forClientBundleID:completion:", v7, self, v17);

}

uint64_t __68__BCSBusinessQueryService_fetchBusinessMetadataForEmail_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchBusinessMetadataForEmailIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService fetchBusinessMetadataForEmailIdentifier:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__BCSBusinessQueryService_fetchBusinessMetadataForEmailIdentifier_completion___block_invoke;
  v17[3] = &unk_24C39C638;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "fetchBusinessMetadataForEmailIdentifier:forClientBundleID:completion:", v7, self, v17);

}

uint64_t __78__BCSBusinessQueryService_fetchBusinessMetadataForEmailIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchBusinessLogoForBusinessIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  BCSXPCDaemonConnectionProtocol *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  BCSXPCDaemonConnectionProtocol *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[BCSBusinessQueryService fetchBusinessLogoForBusinessIdentifier:completion:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", buf, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  v14 = v13;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BCSBusinessQueryService *)self->_clientBundleIdentifier;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__BCSBusinessQueryService_fetchBusinessLogoForBusinessIdentifier_completion___block_invoke;
  v17[3] = &unk_24C39C660;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "fetchBusinessLogoForBusinessIdentifier:forClientBundleID:completion:", v7, self, v17);

}

uint64_t __77__BCSBusinessQueryService_fetchBusinessLogoForBusinessIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)prefetchBloomFilterAndConfigCacheWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  BCSXPCDaemonConnectionProtocol *v6;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v8;
  void *v9;
  BCSXPCDaemonConnectionProtocol *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  BCSXPCDaemonConnectionProtocol *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v6 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v6 = 0;
      connection = 0;
    }
    v8 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[BCSBusinessQueryService prefetchBloomFilterAndConfigCacheWithCompletion:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v12, 0x20u);

  }
  if (self)
    v10 = self->_connection;
  else
    v10 = 0;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prefetchMegashardsWithCompletion:", v4);

}

- (void)clearCachesForType:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  BCSXPCDaemonConnectionProtocol *v8;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v10;
  void *v11;
  BCSXPCDaemonConnectionProtocol *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  BCSXPCDaemonConnectionProtocol *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v8 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v8 = 0;
      connection = 0;
    }
    v10 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v10, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[BCSBusinessQueryService clearCachesForType:completion:]";
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v14, 0x20u);

  }
  if (self)
    v12 = self->_connection;
  else
    v12 = 0;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v12, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearCachesForType:completion:", a3, v6);

}

- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  BCSXPCDaemonConnectionProtocol *v8;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v10;
  void *v11;
  BCSXPCDaemonConnectionProtocol *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  BCSXPCDaemonConnectionProtocol *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v8 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v8 = 0;
      connection = 0;
    }
    v10 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v10, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[BCSBusinessQueryService clearExpiredCachesForType:completion:]";
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v14, 0x20u);

  }
  if (self)
    v12 = self->_connection;
  else
    v12 = 0;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v12, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearExpiredCachesForType:completion:", a3, v6);

}

- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BCSXPCDaemonConnectionProtocol *v9;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v11;
  void *v12;
  BCSXPCDaemonConnectionProtocol *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  BCSXPCDaemonConnectionProtocol *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v9 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v9 = 0;
      connection = 0;
    }
    v11 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "-[BCSBusinessQueryService clearCachesForLinkItemsAssociatedWithBundleID:completion:]";
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v15, 0x20u);

  }
  if (self)
    v13 = self->_connection;
  else
    v13 = 0;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v13, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clearCachesForLinkItemsAssociatedWithBundleID:completion:", v7, v6);

}

- (void)_deleteInMemoryCache
{
  NSObject *v3;
  BCSXPCDaemonConnectionProtocol *v4;
  BCSXPCDaemonConnectionProtocol *connection;
  BCSXPCDaemonConnectionProtocol *v6;
  void *v7;
  BCSXPCDaemonConnectionProtocol *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  BCSXPCDaemonConnectionProtocol *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v4 = self->_connection;
      connection = self->_connection;
    }
    else
    {
      v4 = 0;
      connection = 0;
    }
    v6 = connection;
    -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[BCSBusinessQueryService _deleteInMemoryCache]";
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_20ACAD000, v3, OS_LOG_TYPE_DEFAULT, "%s - connection:%@ remoteObjectProxy:%@", (uint8_t *)&v10, 0x20u);

  }
  if (self)
    v8 = self->_connection;
  else
    v8 = 0;
  -[BCSXPCDaemonConnectionProtocol remoteObjectProxy](v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_deleteInMemoryCache");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lastTimeoutDate, 0);
}

@end
