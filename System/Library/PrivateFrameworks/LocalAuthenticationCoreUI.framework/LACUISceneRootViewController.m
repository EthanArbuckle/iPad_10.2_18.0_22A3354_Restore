@implementation LACUISceneRootViewController

- (LACUISceneRootViewController)initWithScene:(id)a3
{
  id v5;
  LACUISceneRootViewController *v6;
  LACUISceneRootViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUISceneRootViewController;
  v6 = -[LACUISceneRootViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scene, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ was deallocated"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIScene deactivateWithReason:](self->_scene, "deactivateWithReason:", v3);

  v4.receiver = self;
  v4.super_class = (Class)LACUISceneRootViewController;
  -[LACUISceneRootViewController dealloc](&v4, sel_dealloc);
}

- (void)dismiss
{
  -[LACUIScene deactivateWithReason:](self->_scene, "deactivateWithReason:", CFSTR("UI dismissed"));
}

- (void)present:(id)a3 animated:(BOOL)a4
{
  -[LACUISceneRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, a4, &__block_literal_global_3);
}

- (void)present:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (!a5)
    a5 = &__block_literal_global_6;
  -[LACUISceneRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, a4, a5);
}

- (void)handleSceneButton:(int64_t)a3
{
  if (!a3)
    -[LACUIScene deactivateWithReason:](self->_scene, "deactivateWithReason:", CFSTR("Home Button was pressed"));
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return -[LACUIScene statusBarStyle](self->_scene, "statusBarStyle");
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LACUIScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
