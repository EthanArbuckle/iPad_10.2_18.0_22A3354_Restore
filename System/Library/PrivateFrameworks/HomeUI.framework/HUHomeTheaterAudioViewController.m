@implementation HUHomeTheaterAudioViewController

- (HUHomeTheaterAudioViewController)initWithMediaAccessoryItem:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  HUHomeTheaterAudioViewController *v9;
  HUHomeTheaterAudioViewController *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  HUHomeTheaterAudioViewController *v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HUHomeTheaterAudioViewController_initWithMediaAccessoryItem___block_invoke;
  v14[3] = &unk_1E6F51E10;
  v8 = v4;
  v15 = v8;
  v9 = self;
  v16 = v9;
  objc_msgSend(v5, "setItemModuleCreator:", v14);
  v13.receiver = v9;
  v13.super_class = (Class)HUHomeTheaterAudioViewController;
  v10 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v10)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSettings_Title"), CFSTR("HUHomeTheaterSettings_Title"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeTheaterAudioViewController setTitle:](v10, "setTitle:", v11);

  }
  return v10;
}

id __63__HUHomeTheaterAudioViewController_initWithMediaAccessoryItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUHomeTheaterAudioItemModule *v5;
  void *v6;
  HUHomeTheaterAudioItemModule *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUHomeTheaterAudioItemModule alloc];
  objc_msgSend(*(id *)(a1 + 32), "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUHomeTheaterAudioItemModule initWithItemUpdater:mediaProfileContainer:includeLocalDestinations:](v5, "initWithItemUpdater:mediaProfileContainer:includeLocalDestinations:", v4, v6, 1);

  -[HUHomeTheaterAudioItemModule setAlertDelegate:](v7, "setAlertDelegate:", *(_QWORD *)(a1 + 40));
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3;
  HUHomeTheaterAudioItemModuleController *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v3);
  v4 = -[HUItemModuleController initWithModule:]([HUHomeTheaterAudioItemModuleController alloc], "initWithModule:", v3);

  return v4;
}

- (void)homeTheaterItemModuleShouldPresentAlertController:(id)a3
{
  -[HUHomeTheaterAudioViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

@end
