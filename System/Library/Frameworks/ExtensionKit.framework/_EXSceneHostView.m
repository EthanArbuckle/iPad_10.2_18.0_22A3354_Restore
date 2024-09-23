@implementation _EXSceneHostView

- (_EXSceneHostView)initWithExtensionProcess:(id)a3 sessionUUID:(id)a4 role:(id)a5
{
  id v9;
  id v10;
  id v11;
  _EXSceneHostView *v12;
  _EXSceneHostView *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_EXSceneHostView;
  v12 = -[_EXSceneHostView init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionUUID, a4);
    objc_storeStrong((id *)&v13->_role, a5);
    objc_storeStrong((id *)&v13->_extensionProcess, a3);
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXSceneHostView setBackgroundColor:](v13, "setBackgroundColor:", v14);

  }
  return v13;
}

- (void)creatScene
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 440);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_debug_impl(&dword_20AE73000, log, OS_LOG_TYPE_DEBUG, "Scene created: %{public}@ for session: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)setScene:(id)a3
{
  FBScene *v4;
  void *v5;
  void *v6;
  void *v7;
  FBScene *scene;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  FBScene *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v4 = (FBScene *)a3;
  -[_EXSceneHostView scenePresenter](self, "scenePresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[_EXSceneHostView scenePresenter](self, "scenePresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  scene = self->_scene;
  self->_scene = v4;
  v28 = v4;

  -[FBScene uiPresentationManager](v28, "uiPresentationManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXSceneHostView sessionUUID](self, "sessionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "createPresenterWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v11;
  -[_EXSceneHostView setScenePresenter:](self, "setScenePresenter:", v11);
  objc_msgSend(v11, "presentationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXSceneHostView bounds](self, "bounds");
  objc_msgSend(v12, "setFrame:");
  objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  -[_EXSceneHostView addSubview:](self, "addSubview:", v12);
  v23 = (void *)MEMORY[0x24BDD1628];
  -[_EXSceneHostView leftAnchor](self, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leftAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  -[_EXSceneHostView topAnchor](self, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v15;
  -[_EXSceneHostView rightAnchor](self, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v18;
  -[_EXSceneHostView bottomAnchor](self, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v22);

  objc_msgSend(v29, "activate");
}

- (void)layoutSubviews
{
  FBScene *scene;
  _QWORD v3[5];

  scene = self->_scene;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34___EXSceneHostView_layoutSubviews__block_invoke;
  v3[3] = &unk_24C3E36C0;
  v3[4] = self;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v3);
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (void)setScenePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_scenePresenter, a3);
}

- (_EXExtensionProcessHandle)extensionProcess
{
  return self->_extensionProcess;
}

- (void)setExtensionProcess:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProcess, a3);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (NSString)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
