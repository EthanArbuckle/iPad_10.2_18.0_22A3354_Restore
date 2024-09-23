@implementation _UIKeyboardArbiterHost

- (void)detach:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

- (BOOL)isAvailable
{
  return self->_scene != 0;
}

- (void)updateSceneSettings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FBSScene clientSettings](self->_scene, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIKeyboardArbiterHost owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSceneClientSettings:", v4);

  v6 = v4;
  BSDispatchMain();

}

- (_UIKeyboardArbiter)owner
{
  return (_UIKeyboardArbiter *)objc_loadWeakRetained((id *)&self->owner);
}

- (void)attach:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

- (void)dealloc
{
  FBSScene *v3;
  FBSScene *v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  FBSScene *v10;

  v3 = self->_scene;
  v4 = v3;
  if (v3)
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __33___UIKeyboardArbiterHost_dealloc__block_invoke;
    v9 = &unk_24DAA0130;
    v10 = v3;
    BSDispatchMain();

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterHost;
  -[_UIKeyboardArbiterHost dealloc](&v5, sel_dealloc);
}

+ (void)launch
{
  id v2;

  v2 = (id)objc_msgSend(a1, "launchAdvisorWithOmniscientDelegate:", 0);
}

+ (id)launchAdvisorWithOmniscientDelegate:(id)a3
{
  return (id)objc_msgSend(a1, "launchAdvisorWithOmniscientDelegate:sceneDelegate:", a3, 0);
}

+ (id)launchAdvisorWithOmniscientDelegate:(id)a3 sceneDelegate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76___UIKeyboardArbiterHost_launchAdvisorWithOmniscientDelegate_sceneDelegate___block_invoke;
  v15[3] = &unk_24DAA00C0;
  v16 = v5;
  v17 = v6;
  v7 = qword_253E79010;
  v8 = v6;
  v9 = v5;
  v10 = v9;
  if (v7 == -1)
  {
    v11 = v9;
    v12 = v8;
  }
  else
  {
    dispatch_once(&qword_253E79010, v15);
    v11 = v16;
    v12 = v17;
  }
  v13 = (id)_MergedGlobals_3;

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardArbiterHost;
  -[_UIKeyboardArbiterHost description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; scene = %@>"), v4, self->_scene);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)serviceName
{
  return (NSString *)objc_msgSend(MEMORY[0x24BEBDCD8], "serviceName");
}

- (void)connectWithQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)createSceneWithCompletion:(id)a3
{
  id v4;
  void *v5;
  FBSScene *v6;
  FBSScene *scene;
  FBSScene *v8;
  void *v9;
  void (**v10)(id, BOOL);

  v10 = (void (**)(id, BOOL))a3;
  v4 = objc_alloc_init(MEMORY[0x24BEBD778]);
  -[_UIKeyboardArbiterHost owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSceneClientSettings:", v4);

  -[_UIKeyboardArbiterHost _createSceneWithIdentifier:initialClientSettings:](self, "_createSceneWithIdentifier:initialClientSettings:", CFSTR("com.apple.UIKit.remote-keyboard"), v4);
  v6 = (FBSScene *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  self->_scene = v6;

  v8 = self->_scene;
  if (v10)
    v10[2](v10, v8 != 0);
  if (v8)
  {
    -[_UIKeyboardArbiterHost owner](self, "owner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateClients");

  }
}

- (id)_createSceneWithIdentifier:(id)a3 initialClientSettings:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[4];
  id v18;
  id v19;
  _UIKeyboardArbiterHost *v20;
  uint64_t *v21;
  SEL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke;
  v17[3] = &unk_24DAA09D0;
  v10 = v8;
  v18 = v10;
  v11 = v7;
  v21 = &v23;
  v22 = a2;
  v19 = v11;
  v20 = self;
  v12 = (void (**)(_QWORD))MEMORY[0x219A2F288](v17);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v12[2](v12);
  }
  else
  {
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_3;
    v15[3] = &unk_24DAA0868;
    v16 = v12;
    dispatch_sync(MEMORY[0x24BDAC9B8], v15);

  }
  v13 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->owner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->owner);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
