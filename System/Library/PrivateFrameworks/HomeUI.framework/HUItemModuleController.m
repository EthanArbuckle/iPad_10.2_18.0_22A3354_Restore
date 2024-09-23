@implementation HUItemModuleController

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  return 0;
}

- (id)asGeneric
{
  sub_1B8E3CE70();
  return sub_1B8E3CEAC();
}

- (HUItemModuleControllerHosting)host
{
  return (HUItemModuleControllerHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (void)setHostType:(unint64_t)a3
{
  self->_hostType = a3;
}

- (HUItemModuleController)initWithModule:(id)a3
{
  id v6;
  HUItemModuleController *v7;
  HUItemModuleController *v8;
  uint64_t v9;
  NSString *moduleIdentifier;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemModuleController.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("module"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HUItemModuleController;
  v7 = -[HUItemModuleController init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_module, a3);
    objc_msgSend(v6, "moduleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    moduleIdentifier = v8->_moduleIdentifier;
    v8->_moduleIdentifier = (NSString *)v9;

  }
  return v8;
}

- (HFItemModule)module
{
  return self->_module;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (Class)cellClassForItem:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemModuleController.m"), 29, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUItemModuleController cellClassForItem:]", objc_opt_class());

  return 0;
}

- (Class)collectionCellClassForItem:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemModuleController.m"), 35, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUItemModuleController collectionCellClassForItem:]", objc_opt_class());

  return 0;
}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  return 0;
}

- (unint64_t)didSelectItem:(id)a3
{
  return 0;
}

- (int64_t)rowAnimationForOperationType:(unint64_t)a3 item:(id)a4 suggestedAnimation:(int64_t)a5
{
  return a5;
}

- (id)leadingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (BOOL)shouldHideFooterBelowSectionWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldHideHeaderAboveSectionWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 0;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  return 0;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  return 0;
}

- (id)textFieldForVisibleItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUItemModuleController host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moduleController:textFieldForVisibleItem:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hostType
{
  return self->_hostType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_storeStrong((id *)&self->_module, 0);
  objc_destroyWeak((id *)&self->_host);
}

@end
