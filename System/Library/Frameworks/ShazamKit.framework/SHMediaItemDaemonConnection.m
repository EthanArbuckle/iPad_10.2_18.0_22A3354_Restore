@implementation SHMediaItemDaemonConnection

+ (id)serverConnection
{
  if (serverConnection_onceToken != -1)
    dispatch_once(&serverConnection_onceToken, &__block_literal_global_5);
  return (id)serverConnection_serverConnection;
}

void __47__SHMediaItemDaemonConnection_serverConnection__block_invoke()
{
  SHShazamKitServiceConnection *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SHShazamKitServiceConnection alloc];
  v3 = (id)objc_opt_new();
  v1 = -[SHShazamKitServiceConnection initWithConnectionProvider:](v0, "initWithConnectionProvider:", v3);
  v2 = (void *)serverConnection_serverConnection;
  serverConnection_serverConnection = v1;

}

+ (void)fetchMediaItemWithShazamID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  SHShazamKey *v8;
  SHShazamKey *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  SHShazamKey *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[SHShazamKey initWithKey:]([SHShazamKey alloc], "initWithKey:", v6);
  v9 = v8;
  if (v8)
  {
    -[SHShazamKey validatedKey](v8, "validatedKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__SHMediaItemDaemonConnection_fetchMediaItemWithShazamID_completionHandler___block_invoke;
    v15[3] = &unk_24D9B7C20;
    v16 = v9;
    v17 = v7;
    objc_msgSend(a1, "fetchMediaItemsWithShazamIDs:completionHandler:", v11, v15);

    v12 = v16;
  }
  else
  {
    v19 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not a valid shazamID"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError errorWithCode:underlyingError:keyOverrides:](SHError, "errorWithCode:underlyingError:keyOverrides:", 600, 0, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
  }

}

void __76__SHMediaItemDaemonConnection_fetchMediaItemWithShazamID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    v13 = *MEMORY[0x24BDD0BA0];
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "validatedKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("shazamID %@ not found"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError errorWithCode:underlyingError:keyOverrides:](SHError, "errorWithCode:underlyingError:keyOverrides:", 600, v6, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v8);
  }

}

+ (void)fetchMediaItemsWithShazamIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "serverConnection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaItemsForShazamIDs:completionHandler:", v7, v6);

  }
}

+ (void)fetchHapticsWithMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "serverConnection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hapticsForMediaItems:completionHandler:", v7, v6);

  }
}

+ (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "serverConnection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isHapticTrackAvailableForMediaItem:completionHandler:", v7, v6);

  }
}

@end
