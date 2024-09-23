@implementation HUSafetyAndSecuritySettingsNotificationsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUSafetyAndSecuritySettingsNotificationsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v8, sel_setupCell_forItem_, v6, a4);
  v7 = v6;
  objc_msgSend(v7, "setAccessoryView:", 0);
  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v7, "setHideIcon:", 1);

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  HUStatusAndNotificationsViewController *v14;
  void *v15;
  HUStatusAndNotificationsViewController *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  v8 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  objc_msgSend(v10, "sourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = [HUStatusAndNotificationsViewController alloc];
    objc_msgSend(v7, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HUStatusAndNotificationsViewController initWithServiceItem:inHome:displayingDetails:](v14, "initWithServiceItem:inHome:displayingDetails:", v13, v15, 0);

    +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 1;
    objc_msgSend(v17, "setAnimated:", 1);
    objc_msgSend(v17, "setPreferredPresentationType:", 1);
    -[HUItemModuleController host](self, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "moduleController:presentViewControllerForRequest:", self, v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
