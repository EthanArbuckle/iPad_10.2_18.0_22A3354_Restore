@implementation HUMatterConnectedServicesItemModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v6 = a3;
  objc_msgSend(a4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_opt_class();
  v12 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v12;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "setHideIcon:", 1);
  objc_msgSend(v11, "setAccessoryType:", 1);
  objc_msgSend(v11, "setShowSpinner:", v9);

}

- (BOOL)canSelectItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue") ^ 1;
  return (char)v3;
}

- (unint64_t)didSelectItem:(id)a3
{
  void *v4;
  void *v5;
  HUMatterConnectedServicesViewController *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  -[HUItemModuleController module](self, "module", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedServicesItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HUMatterConnectedServicesViewController initWithConnectedServicesItemProvider:]([HUMatterConnectedServicesViewController alloc], "initWithConnectedServicesItemProvider:", v5);
  -[HUItemModuleController host](self, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2CE4F8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  -[HUMatterConnectedServicesViewController setDelegate:](v6, "setDelegate:", v9);

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredPresentationType:", 1);
  -[HUItemModuleController host](self, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "moduleController:presentViewControllerForRequest:", self, v10);

  return 0;
}

@end
