@implementation HUFaceRecognitionItemModuleController

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  HUFaceRecognitionLibraryListViewController *v13;
  void *v14;
  HUFaceRecognitionLibraryListViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  HUFaceRecognitionLibraryListViewController *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  HUFaceRecognitionLibraryListViewController *v27;
  BOOL v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = [HUFaceRecognitionLibraryListViewController alloc];
  objc_msgSend(v12, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HUFaceRecognitionLibraryListViewController initWithHome:](v13, "initWithHome:", v14);
  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAnimated:", v5);
  objc_msgSend(v16, "setPreferredPresentationType:", 1);
  -[HUItemModuleController host](self, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "moduleController:presentViewControllerForRequest:", self, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __110__HUFaceRecognitionItemModuleController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
  v24[3] = &unk_1E6F5AD20;
  v25 = v8;
  v26 = v9;
  v27 = v15;
  v28 = v5;
  v19 = v8;
  v20 = v9;
  v21 = v15;
  objc_msgSend(v18, "flatMap:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __110__HUFaceRecognitionItemModuleController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "presentFaceRecognitionPersonSettingsForPerson:personManager:animated:");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 48));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  HUFaceRecognitionLibraryListViewController *v10;
  void *v11;
  HUFaceRecognitionLibraryListViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  HUFaceRecognitionLibraryListViewController *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  HUFaceRecognitionLibraryListViewController *v21;
  id v22;
  BOOL v23;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = [HUFaceRecognitionLibraryListViewController alloc];
  objc_msgSend(v9, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HUFaceRecognitionLibraryListViewController initWithHome:](v10, "initWithHome:", v11);
  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnimated:", v4);
  objc_msgSend(v13, "setPreferredPresentationType:", 1);
  -[HUItemModuleController host](self, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleController:presentViewControllerForRequest:", self, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__HUFaceRecognitionItemModuleController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
  v20[3] = &unk_1E6F5AD48;
  v21 = v12;
  v22 = v6;
  v23 = v4;
  v16 = v12;
  v17 = v6;
  objc_msgSend(v15, "flatMap:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __111__HUFaceRecognitionItemModuleController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "faceRecognitionCellItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v4)
    NSLog(CFSTR("Forgot to declare a cell class"));
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "faceRecognitionCellItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    objc_opt_class();
    v11 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v13, "setAccessoryType:", 1);
    objc_msgSend(v13, "setHideIcon:", 1);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v15 = a3;
  v7 = a4;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "faceRecognitionCellItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v7)
  {
    objc_msgSend(v7, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v15, "setAccessoryType:", v14 ^ 1u);
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  HUFaceRecognitionLibraryListViewController *v11;
  void *v12;
  HUFaceRecognitionLibraryListViewController *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "faceRecognitionCellItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  v10 = 0;
  if (v9)
  {
    v11 = [HUFaceRecognitionLibraryListViewController alloc];
    objc_msgSend(v7, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUFaceRecognitionLibraryListViewController initWithHome:](v11, "initWithHome:", v12);

    +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v14, "setPreferredPresentationType:", 1);
    -[HUItemModuleController host](self, "host");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "moduleController:presentViewControllerForRequest:", self, v14);

  }
  return v10;
}

@end
