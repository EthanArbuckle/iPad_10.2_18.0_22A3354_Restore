@implementation HUUserNotificationTopicServiceListModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setHideIcon:", 1);
  objc_msgSend(v4, "setAccessoryView:", 0);
  objc_msgSend(v4, "setAccessoryType:", 1);

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUUserNotificationTopicServiceListModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v15, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_msgSend(v9, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HUUserNotificationTopicSubtitleResultKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v8;
    objc_msgSend(v12, "setDescriptionText:", v11);
    objc_msgSend(v9, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValueText:", v14);

  }
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUUserNotificationTopicServiceListModuleController;
  v7 = a4;
  -[HUItemModuleController configureCell:forItem:](&v15, sel_configureCell_forItem_, v6, v7);
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration", v15.receiver, v15.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setContentConfiguration:", v12);
  v13 = objc_alloc_init(MEMORY[0x1E0CEA3E8]);
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessories:", v14);

}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceLikeItemForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[HUUserNotificationTopicServiceListModuleController showNotificationSettingsForServiceLikeItem:animated:](self, "showNotificationSettingsForServiceLikeItem:animated:", v6, 1);
  else
    NSLog(CFSTR("Missing service-like item for item %@!"), v4);

  return 0;
}

- (id)showNotificationSettingsForServiceLikeItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HUStatusAndNotificationsViewController *v7;
  void *v8;
  void *v9;
  HUStatusAndNotificationsViewController *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  v7 = [HUStatusAndNotificationsViewController alloc];
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUStatusAndNotificationsViewController initWithServiceItem:inHome:displayingDetails:](v7, "initWithServiceItem:inHome:displayingDetails:", v6, v9, 0);

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferredPresentationType:", 1);
  objc_msgSend(v11, "setAnimated:", v4);
  -[HUItemModuleController host](self, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleController:presentViewControllerForRequest:", self, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
