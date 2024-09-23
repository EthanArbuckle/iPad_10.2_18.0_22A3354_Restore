@implementation HUAccessoryDebugViewController

- (HUAccessoryDebugViewController)initWithHomeKitObject:(id)a3
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  HUAccessoryDebugViewController *v11;
  HUAccessoryDebugViewController *v12;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessoryDebugViewController.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitObject"));

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v9);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__HUAccessoryDebugViewController_initWithHomeKitObject___block_invoke;
  v16[3] = &unk_1E6F4FDA0;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v7, "setItemModuleCreator:", v16);
  v15.receiver = self;
  v15.super_class = (Class)HUAccessoryDebugViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_homeKitObject, a3);

  return v12;
}

id __56__HUAccessoryDebugViewController_initWithHomeKitObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUAccessoryDebugModule *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUAccessoryDebugModule initWithItemUpdater:homeKitObject:]([HUAccessoryDebugModule alloc], "initWithItemUpdater:homeKitObject:", v4, *(_QWORD *)(a1 + 32));

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUAccessoryDebugModuleController *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v4);
  v5 = -[HUAccessoryDebugModuleController initWithModule:]([HUAccessoryDebugModuleController alloc], "initWithModule:", v4);
  -[HUAccessoryDebugViewController setDebugModuleController:](self, "setDebugModuleController:", v5);

  -[HUAccessoryDebugViewController debugModuleController](self, "debugModuleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HUAccessoryDebugModuleController)debugModuleController
{
  return self->_debugModuleController;
}

- (void)setDebugModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_debugModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugModuleController, 0);
  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end
