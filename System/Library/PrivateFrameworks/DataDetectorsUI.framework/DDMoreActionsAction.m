@implementation DDMoreActionsAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("More…"));
}

- (id)iconName
{
  return CFSTR("chevron.forward");
}

- (id)variantIconName
{
  return 0;
}

- (int)interactionType
{
  return 3;
}

- (id)alertActions
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[DDMoreActionsAction alertActions].cold.1();
  return 0;
}

- (id)viewController
{
  UIViewController *viewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *v12;
  UIViewController *v13;
  UIViewController *v14;
  _QWORD v16[4];
  UIViewController *v17;

  viewController = self->super._viewController;
  if (!viewController)
  {
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleForResult:subResult:withURL:context:", self->super._result, 0, self->super._url, self->super._context);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CEA2E0];
    DDLocalizedString(CFSTR("Cancel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[DDMoreActionsAction alertActions](self, "alertActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __37__DDMoreActionsAction_viewController__block_invoke;
    v16[3] = &unk_1E4258940;
    v12 = v6;
    v17 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);

    v13 = self->super._viewController;
    self->super._viewController = v12;
    v14 = v12;

    viewController = self->super._viewController;
  }
  return viewController;
}

uint64_t __37__DDMoreActionsAction_viewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAction:", a2);
}

- (void)alertActions
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_10_0(v0);
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Please override -alertActions in your DDMoreActionsAction subclass %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

@end
