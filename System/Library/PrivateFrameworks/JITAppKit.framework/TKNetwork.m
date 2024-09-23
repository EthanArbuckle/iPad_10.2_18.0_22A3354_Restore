@implementation TKNetwork

+ (id)shared
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&shared_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)_shared;
}

void __19__TKNetwork_shared__block_invoke()
{
  TKNetwork *v0;
  void *v1;

  if (!_shared)
  {
    v0 = objc_alloc_init(TKNetwork);
    v1 = (void *)_shared;
    _shared = (uint64_t)v0;

  }
}

+ (void)setShared:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&_shared, location[0]);
  objc_storeStrong(location, 0);
}

- (id)loadRequest:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  TKNetworkDefaultTask *v5;
  id v7;
  id v8;
  id v9;
  TKNetworkDefaultTask *v10;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  TKNetwork *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  int64_t v23;
  id location[2];
  TKNetwork *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = CFSTR("normal");
  if (v23 == -1)
  {
    objc_storeStrong(&v21, CFSTR("low"));
  }
  else if (v23 == 1)
  {
    objc_storeStrong(&v21, CFSTR("high"));
  }
  -[TKNetwork updateNetworkActivity:](v25, "updateNetworkActivity:", 1);
  v9 = +[MCLURLDataLoader shared](MCLURLDataLoader, "shared");
  v7 = location[0];
  v8 = v21;
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __45__TKNetwork_loadRequest_priority_completion___block_invoke;
  v17 = &unk_24E0994C8;
  v18 = v25;
  v19 = v22;
  v20 = (id)objc_msgSend(v9, "downloadRequest:category:completionHandler:", v7, v8, &v13);

  v5 = [TKNetworkDefaultTask alloc];
  v10 = -[TKNetworkDefaultTask initWithTask:](v5, "initWithTask:", v20);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v10;
}

void __45__TKNetwork_loadRequest_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v9[2];
  id v10;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10 = 0;
  objc_storeStrong(&v10, a3);
  v9[1] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "updateNetworkActivity:", -1);
  if (!v10 && (objc_msgSend(location[0], "responseOk") & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDBCE50];
    v4 = (id)objc_msgSend(location[0], "targetPath");
    v9[0] = (id)objc_msgSend(v3, "dataWithContentsOfFile:");

    v5 = *(_QWORD *)(a1 + 40);
    v6 = (id)objc_msgSend(location[0], "response");
    (*(void (**)(void))(v5 + 16))();

    objc_storeStrong(v9, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)downloadRequest:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  TKNetworkDefaultTask *v5;
  id v7;
  id v8;
  id v9;
  TKNetworkDefaultTask *v10;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  TKNetwork *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  int64_t v23;
  id location[2];
  TKNetwork *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = CFSTR("normal");
  if (v23 == -1)
  {
    objc_storeStrong(&v21, CFSTR("low"));
  }
  else if (v23 == 1)
  {
    objc_storeStrong(&v21, CFSTR("high"));
  }
  -[TKNetwork updateNetworkActivity:](v25, "updateNetworkActivity:", 1);
  v9 = +[MCLURLDataLoader shared](MCLURLDataLoader, "shared");
  v7 = location[0];
  v8 = v21;
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __49__TKNetwork_downloadRequest_priority_completion___block_invoke;
  v17 = &unk_24E0994C8;
  v18 = v25;
  v19 = v22;
  v20 = (id)objc_msgSend(v9, "downloadRequest:category:completionHandler:", v7, v8, &v13);

  v5 = [TKNetworkDefaultTask alloc];
  v10 = -[TKNetworkDefaultTask initWithTask:](v5, "initWithTask:", v20);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v10;
}

void __49__TKNetwork_downloadRequest_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v4;
  id v7;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  objc_msgSend(*(id *)(a1 + 32), "updateNetworkActivity:", -1);
  if (!v7 && (objc_msgSend(location[0], "responseOk") & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (id)objc_msgSend(location[0], "targetPath");
    (*(void (**)(void))(v3 + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)downloadImage:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  TKNetworkDefaultTask *v5;
  id v7;
  id v8;
  id v9;
  TKNetworkDefaultTask *v10;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  TKNetwork *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  int64_t v23;
  id location[2];
  TKNetwork *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = CFSTR("normal");
  if (v23 == -1)
  {
    objc_storeStrong(&v21, CFSTR("low"));
  }
  else if (v23 == 1)
  {
    objc_storeStrong(&v21, CFSTR("high"));
  }
  -[TKNetwork updateNetworkActivity:](v25, "updateNetworkActivity:", 1);
  v9 = +[MCLURLDataLoader shared](MCLURLDataLoader, "shared");
  v7 = location[0];
  v8 = v21;
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __47__TKNetwork_downloadImage_priority_completion___block_invoke;
  v17 = &unk_24E0994F0;
  v18 = v25;
  v19 = v22;
  v20 = (id)objc_msgSend(v9, "downloadImageWithRequest:category:completionHandler:", v7, v8, &v13);

  v5 = [TKNetworkDefaultTask alloc];
  v10 = -[TKNetworkDefaultTask initWithTask:](v5, "initWithTask:", v20);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v10;
}

void __47__TKNetwork_downloadImage_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_msgSend(*(id *)(a1 + 32), "updateNetworkActivity:", -1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)updateNetworkActivity:(int64_t)a3
{
  NSObject *v3;
  uint64_t block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  int64_t v9;
  int64_t v10;
  SEL v11;
  TKNetwork *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v3 = MEMORY[0x24BDAC9B8];
  block = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __35__TKNetwork_updateNetworkActivity___block_invoke;
  v8 = &__block_descriptor_40_e5_v8__0l;
  v9 = v10;
  dispatch_async(v3, &block);

}

void __35__TKNetwork_updateNetworkActivity___block_invoke(uint64_t a1)
{
  id v1;
  dispatch_time_t when;
  NSObject *v3;
  uint64_t v4;

  if (_networkActivityCount + *(_QWORD *)(a1 + 32) <= 0)
    v4 = 0;
  else
    v4 = _networkActivityCount + *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (!_networkActivityCount)
    {
      v1 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      objc_msgSend(v1, "setNetworkActivityIndicatorVisible:", 1);

    }
  }
  else
  {
    when = dispatch_time(0, 500000000);
    v3 = MEMORY[0x24BDAC9B8];
    dispatch_after(when, v3, &__block_literal_global_6);

  }
  _networkActivityCount = v4;
}

void __35__TKNetwork_updateNetworkActivity___block_invoke_2()
{
  id v0;

  if (!_networkActivityCount)
  {
    v0 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    objc_msgSend(v0, "setNetworkActivityIndicatorVisible:", 0);

  }
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

@end
