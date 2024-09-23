@implementation _EXExtensionIdentity(SceneProviding)

- (_EXViewControllerSceneConfiguration)configurationWithParameters:()SceneProviding
{
  id v4;
  id v5;
  _EXViewControllerSceneConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  objc_msgSend(v4, "sceneIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (id)*MEMORY[0x24BDC7A30];
  v6 = -[_EXSceneConfiguration initWithParameters:]([_EXViewControllerSceneConfiguration alloc], "initWithParameters:", v4);

  objc_msgSend(a1, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_EX_dictionaryForKey:", CFSTR("EXSceneManifest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_EX_dictionaryForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "_EX_stringForKey:", CFSTR("EXStoryboardName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXViewControllerSceneConfiguration setStoryboardName:](v6, "setStoryboardName:", v10);

    -[_EXViewControllerSceneConfiguration storyboardName](v6, "storyboardName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      _EXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[_EXExtensionIdentity(SceneProviding) configurationWithParameters:].cold.3((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);

    }
    objc_msgSend(v9, "_EX_stringForKeys:", &unk_24C3EFA00);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[_EXViewControllerSceneConfiguration setViewControllerClassName:](v6, "setViewControllerClassName:", v19);
    }
    else
    {
      _EXDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[_EXExtensionIdentity(SceneProviding) configurationWithParameters:].cold.1((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);

    }
    objc_msgSend(v9, "_EX_stringForKey:", CFSTR("EXSceneDelegateClass"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      -[_EXSceneConfiguration setSceneDelegateClassName:](v6, "setSceneDelegateClassName:", v27);
    }
    else
    {
      _EXDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[_EXExtensionIdentity(SceneProviding) configurationWithParameters:].cold.1((uint64_t)v5, v28, v29, v30, v31, v32, v33, v34);

    }
  }

  return v6;
}

- (void)extensionViewControllerClassForSceneRole:()SceneProviding
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  Class v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  if (!v4)
    v4 = (id)*MEMORY[0x24BDC7A30];
  objc_msgSend(a1, "extensionPointConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_EX_dictionaryForKey:", CFSTR("EXSceneManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_EX_dictionaryForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(v7, "_EX_stringForKeys:", &unk_24C3EFA18),
        (v8 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = (void *)objc_opt_class();
    goto LABEL_8;
  }
  v9 = v8;
  v10 = NSClassFromString(v8);
  if (v10)
  {
    v11 = v10;

LABEL_8:
    v11;

    return;
  }
  _EXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[_EXExtensionIdentity(SceneProviding) extensionViewControllerClassForSceneRole:].cold.1((uint64_t)v9, v12);

  __break(1u);
}

- (id)scenes
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "extensionPointConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_EX_dictionaryForKey:", CFSTR("EXSceneManifest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configurationWithParameters:()SceneProviding .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, a2, a3, "No view controller class available scene ID: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)configurationWithParameters:()SceneProviding .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, a2, a3, "Storyboard name not provided for scene ID: %{public}@ falling back to view controller name.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)extensionViewControllerClassForSceneRole:()SceneProviding .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = 136315906;
  v3 = "viewControllerClass";
  v4 = 2080;
  v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/Util/EXExtension+UserInterfaceConfiguration.m";
  v6 = 1024;
  v7 = 64;
  v8 = 2114;
  v9 = a1;
}

@end
