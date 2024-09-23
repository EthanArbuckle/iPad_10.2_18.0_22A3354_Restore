@implementation CAMSemanticStyleSettingsController

- (CAMSemanticStyleSettingsController)init
{
  CAMSemanticStyleSettingsController *v2;
  CAMSemanticStyleSettingsRootController *v3;
  CAMSemanticStyleSettingsRootController *rootController;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CAMSemanticStyleSettingsController;
  v2 = -[CAMSemanticStyleSettingsController init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CAMSemanticStyleSettingsRootController);
    rootController = v2->__rootController;
    v2->__rootController = v3;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __42__CAMSemanticStyleSettingsController_init__block_invoke;
    v10 = &unk_1EA329490;
    objc_copyWeak(&v11, &location);
    -[CAMSemanticStyleSettingsRootController setCompletionBlock:](v2->__rootController, "setCompletionBlock:", &v7);
    v14[0] = v2->__rootController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v7, v8, v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleSettingsController setViewControllers:](v2, "setViewControllers:", v5);

    -[CAMSemanticStyleSettingsController setNavigationBarHidden:](v2, "setNavigationBarHidden:", 0);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__CAMSemanticStyleSettingsController_init__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "semanticStyleSettingsControllerDidDismiss:", v3);

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

- (CAMSemanticStyleSettingsControllerDelegate)controllerDelegate
{
  return (CAMSemanticStyleSettingsControllerDelegate *)objc_loadWeakRetained((id *)&self->_controllerDelegate);
}

- (void)setControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_controllerDelegate, a3);
}

- (CAMSemanticStyleSettingsRootController)_rootController
{
  return self->__rootController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rootController, 0);
  objc_destroyWeak((id *)&self->_controllerDelegate);
}

@end
