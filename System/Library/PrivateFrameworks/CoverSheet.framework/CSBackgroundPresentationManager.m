@implementation CSBackgroundPresentationManager

- (CSBackgroundPresentationManager)init
{
  CSBackgroundPresentationManager *v2;
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  FBSceneWorkspace *sceneWorkspace;
  BLSHGenericSceneDelegateWithActionHandlers *v8;
  BLSHGenericSceneDelegateWithActionHandlers *sceneDelegate;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSBackgroundPresentationManager;
  v2 = -[CSBackgroundPresentationManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D22988]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithIdentifier:", v5);
    sceneWorkspace = v2->_sceneWorkspace;
    v2->_sceneWorkspace = (FBSceneWorkspace *)v6;

    v8 = (BLSHGenericSceneDelegateWithActionHandlers *)objc_alloc_init(MEMORY[0x1E0D01010]);
    sceneDelegate = v2->_sceneDelegate;
    v2->_sceneDelegate = v8;

    objc_msgSend(MEMORY[0x1E0D01020], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerSceneWorkspace:", v2->_sceneWorkspace);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D01020], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterSceneWorkspace:", self->_sceneWorkspace);

  -[FBSceneWorkspace invalidate](self->_sceneWorkspace, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CSBackgroundPresentationManager;
  -[CSBackgroundPresentationManager dealloc](&v4, sel_dealloc);
}

- (id)createBackgroundViewControllerForDefinition:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  FBScene *v18;
  FBScene *currentScene;
  CSBackgroundContentViewController *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "clientBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAC578], "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87D80], "identityForAngelJobLabel:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22948], "identityForProcessIdentity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSBackgroundPresentationManager sceneWorkspace](self, "sceneWorkspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__CSBackgroundPresentationManager_createBackgroundViewControllerForDefinition_frame___block_invoke;
  v22[3] = &unk_1E8E2FDF8;
  v23 = v9;
  v24 = v11;
  v25 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v9;
  objc_msgSend(v14, "createScene:", v22);
  v18 = (FBScene *)objc_claimAutoreleasedReturnValue();
  currentScene = self->_currentScene;
  self->_currentScene = v18;

  -[FBScene setDelegate:](self->_currentScene, "setDelegate:", self->_sceneDelegate);
  v20 = -[CSBackgroundContentViewController initWithScene:frame:]([CSBackgroundContentViewController alloc], "initWithScene:frame:", self->_currentScene, x, y, width, height);

  return v20;
}

void __85__CSBackgroundPresentationManager_createBackgroundViewControllerForDefinition_frame___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v4);

  objc_msgSend(v5, "setSpecification:", a1[5]);
  objc_msgSend(v5, "setClientIdentity:", a1[6]);

}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (FBScene)currentScene
{
  return self->_currentScene;
}

- (BLSHGenericSceneDelegateWithActionHandlers)sceneDelegate
{
  return self->_sceneDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDelegate, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
}

@end
