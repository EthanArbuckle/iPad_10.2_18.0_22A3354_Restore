@implementation CAMSmartStyleSettingsController

- (CAMSmartStyleSettingsController)init
{
  CAMSmartStyleSettingsController *v2;
  CAMSmartStyleSettingsRootController *v3;
  CAMSmartStyleSettingsRootController *rootController;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStyleSettingsController;
  v2 = -[CAMSmartStyleSettingsController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CAMSmartStyleSettingsRootController);
    rootController = v2->__rootController;
    v2->__rootController = v3;

    v8[0] = v2->__rootController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSmartStyleSettingsController setViewControllers:](v2, "setViewControllers:", v5);

  }
  return v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CAMSmartStyleSettingsRootController)_rootController
{
  return self->__rootController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rootController, 0);
}

@end
