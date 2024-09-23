@implementation _EXFBSSceneSession

- (id)makeSceneWithError:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_EXSceneSession extension](self, "extension", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSwiftEntryPoint");

  if (v5)
  {
    +[_EXRunningUIExtension sharedInstance](_EXRunningUIExtension, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_EXSceneSession configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "makeSceneWithConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)connectWithFBSScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = a3;
  objc_storeStrong((id *)&self->_fbsScene, a3);
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v6);
  if (v7)
  {
    -[_EXSceneSession setIdentifier:](self, "setIdentifier:", v7);
    v8 = objc_alloc_init(MEMORY[0x24BDC7A18]);
    objc_msgSend(v5, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ex_role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSceneIdentifier:](v8, "setSceneIdentifier:", v10);

    -[_EXSceneSession makeConfigurationWithParameters:](self, "makeConfigurationWithParameters:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXSceneSession setConfiguration:](self, "setConfiguration:", v11);

    -[_EXSceneSession extension](self, "extension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXSceneSession configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "prepareForSceneConnectionWithConfiguration:", v13);

    objc_msgSend(MEMORY[0x24BDC7A10], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSession:", self);

    v16 = 0;
    -[_EXFBSSceneSession makeSceneWithError:](self, "makeSceneWithError:", &v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[_EXSceneSession setScene:](self, "setScene:", v15);
      -[_EXSceneSession connectToScene:](self, "connectToScene:", v15);
    }

  }
  else
  {
    _EXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[_EXFBSSceneSession connectWithFBSScene:].cold.1((uint64_t)v6, v8);
  }

}

- (FBSScene)fbsScene
{
  return (FBSScene *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFbsScene:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbsScene, 0);
}

- (void)connectWithFBSScene:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_20AE73000, a2, OS_LOG_TYPE_FAULT, "Unexpected scene identifier. ExtensionKit requires the scene identifier to be a UUID string. Got: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
