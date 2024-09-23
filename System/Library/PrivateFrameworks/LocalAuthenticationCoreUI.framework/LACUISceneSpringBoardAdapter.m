@implementation LACUISceneSpringBoardAdapter

- (LACUISceneSpringBoardAdapter)initWithScene:(id)a3
{
  id v5;
  LACUISceneSpringBoardAdapter *v6;
  LACUISceneSpringBoardAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUISceneSpringBoardAdapter;
  v6 = -[LACUISceneSpringBoardAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scene, a3);

  return v7;
}

- (int64_t)statusBarStyle
{
  void *v2;
  int64_t v3;

  -[SBSUIRemoteAlertScene statusBarManager](self->_scene, "statusBarManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarStyle");

  return v3;
}

- (void)deactivateWithReason:(id)a3
{
  -[SBSUIRemoteAlertScene deactivate](self->_scene, "deactivate", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
