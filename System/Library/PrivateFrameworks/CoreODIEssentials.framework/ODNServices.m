@implementation ODNServices

- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD);
  id v8;
  id v9;
  id v10;

  v7 = (void (**)(id, _QWORD))a5;
  v8 = a4;
  v9 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateGeoCodingsForAddresses:locations:", v9, v8);

  v7[2](v7, 0);
}

- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__ODNServices_fetchGeoCodingsForAddresses_completion___block_invoke;
  v9[3] = &unk_24C31EBD0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "fetchGeoCodingsForAddresses:completion:", v6, v9);

}

uint64_t __54__ODNServices_fetchGeoCodingsForAddresses_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchConfigThrowingWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchConfigThrowingWithCompletion:", v3);

}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchConfigWithCompletion:", v3);

}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dKsJLlNX54lzKt5n:eqF2XJh3hHBJQf2K:", v6, v5);

}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evrtH713YbFfEOzk:completion:", v6, v5);

}

- (void)registerICloudLoginWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerICloudLoginWithCompletion:", v3);

}

- (void)unregisterICloudLoginWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterICloudLoginWithCompletion:", v3);

}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ofLBc0SV56ddaijH:i7D0Lridvo8oYoNd:completion:", v9, v8, v7);

}

@end
