@implementation _EXSceneComponent

- (_EXSceneComponent)initWithScene:(id)a3
{
  id v4;
  _EXSceneComponent *v5;
  _EXSceneComponent *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_EXSceneComponent;
  v5 = -[_EXSceneComponent init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    objc_msgSend(v4, "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

    objc_msgSend(MEMORY[0x24BDC7A10], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionForIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "scene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "conformsToProtocol:", &unk_254651FD0))
    {
      objc_msgSend(v13, "sceneDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&v6->_scene);
    objc_msgSend(WeakRetained, "setDelegate:", v14);

  }
  return v6;
}

- (void)_sceneWillInvalidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "_FBSScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  objc_msgSend(MEMORY[0x24BDC7A10], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeSessionForIdentifier:", v5);

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
