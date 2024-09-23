@implementation FASpotlightHostViewController

+ (id)requestViewControllerWithContactID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE30968];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__FASpotlightHostViewController_requestViewControllerWithContactID_completion___block_invoke;
  v13[3] = &unk_24C88CEA8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("FASpotlightServiceViewController"), v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __79__FASpotlightHostViewController_requestViewControllerWithContactID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "serviceViewControllerProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithContactIdentifier:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A5F0B8);
}

@end
