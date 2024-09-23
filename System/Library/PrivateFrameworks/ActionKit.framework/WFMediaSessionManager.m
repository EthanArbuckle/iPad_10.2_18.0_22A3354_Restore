@implementation WFMediaSessionManager

- (WFMediaSessionManager)init
{
  return -[WFMediaSessionManager initWithClientIdentifier:clientVersion:](self, "initWithClientIdentifier:clientVersion:", CFSTR("com.apple.shortcuts"), CFSTR("1"));
}

- (WFMediaSessionManager)initWithClientIdentifier:(id)a3 clientVersion:(id)a4
{
  WFMediaSessionManager *v4;
  uint64_t v5;
  NSString *clientIdentifier;
  uint64_t v7;
  NSString *clientVersion;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  AMSBag *bag;
  WFMediaSessionManager *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WFMediaSessionManager;
  v4 = -[WFMediaSessionManager init](&v19, sel_init, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(CFSTR("com.apple.shortcuts"), "copy");
    clientIdentifier = v4->_clientIdentifier;
    v4->_clientIdentifier = (NSString *)v5;

    v7 = objc_msgSend(CFSTR("1"), "copy");
    clientVersion = v4->_clientVersion;
    v4->_clientVersion = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BE08238], "bagSubProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE08238], "bagSubProfileVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE08238], "bagKeySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("amp-api.podcasts.apple.com"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-media-api-host"), 5, v13);

    objc_msgSend(v12, "addBagKey:valueType:defaultValue:", CFSTR("countryCode"), 4, CFSTR("us"));
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://sf-api-token-service.itunes.apple.com/apiToken/"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addBagKey:valueType:defaultValue:", CFSTR("sf-api-token-service-url"), 5, v14);

    objc_msgSend(MEMORY[0x24BE08060], "registerBagKeySet:forProfile:profileVersion:", v12, v9, v10);
    objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", v9, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    bag = v4->_bag;
    v4->_bag = (AMSBag *)v15;

    v17 = v4;
  }

  return v4;
}

- (void)lookupMediaType:(int64_t)a3 withIdentifiers:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  AMSMediaTask *v14;
  AMSMediaTask *task;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x24BE08238]);
  -[WFMediaSessionManager clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMediaSessionManager clientVersion](self, "clientVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMediaSessionManager bag](self, "bag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (AMSMediaTask *)objc_msgSend(v10, "initWithType:clientIdentifier:clientVersion:bag:", a3, v11, v12, v13);
  task = self->_task;
  self->_task = v14;

  if (a3 == 300)
  {
    v21[0] = CFSTR("episodes");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMediaTask setIncludedResultKeys:](self->_task, "setIncludedResultKeys:", v16);

  }
  -[AMSMediaTask setItemIdentifiers:](self->_task, "setItemIdentifiers:", v8);
  -[AMSMediaTask perform](self->_task, "perform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __72__WFMediaSessionManager_lookupMediaType_withIdentifiers_withCompletion___block_invoke;
  v19[3] = &unk_24F8B09A8;
  v20 = v9;
  v18 = v9;
  objc_msgSend(v17, "addFinishBlock:", v19);

}

- (AMSMediaTask)task
{
  return self->_task;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

void __72__WFMediaSessionManager_lookupMediaType_withIdentifiers_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    objc_msgSend(v10, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v8, 0);

  }
}

@end
