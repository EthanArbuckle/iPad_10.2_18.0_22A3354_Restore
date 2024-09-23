@implementation FBSSceneSettings(BacklightServices)

- (id)bls_visualState
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 200002);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = v6;
  }
  else if (v4)
  {
    bls_scenes_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBSSceneSettings(BacklightServices) bls_visualState].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6;
}

- (uint64_t)bls_isDelegateActive
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 200000);

  return v2;
}

- (uint64_t)bls_isBlanked
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 200001);

  return v2;
}

- (id)bls_presentationDate
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 200003);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = v6;
  }
  else if (v4)
  {
    bls_scenes_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBSSceneSettings(BacklightServices) bls_presentationDate].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6;
}

- (uint64_t)bls_isAlwaysOnEnabledForEnvironment
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 200004);

  return v2;
}

- (uint64_t)bls_renderSeed
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 200005);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedLongLongValue");
  }
  else
  {
    if (v4)
    {
      bls_scenes_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FBSSceneSettings(BacklightServices) bls_renderSeed].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    }
    v7 = 0;
  }

  return v7;
}

- (uint64_t)bls_isLiveUpdating
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 200006);

  return v2;
}

- (uint64_t)bls_hasUnrestrictedFramerateUpdates
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForSetting:", 200007);

  return v2;
}

- (void)bls_visualState
{
  OUTLINED_FUNCTION_0(&dword_1B0C75000, a2, a3, "%@ is not of class BLSBacklightSceneVisualState", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)bls_presentationDate
{
  OUTLINED_FUNCTION_0(&dword_1B0C75000, a2, a3, "%@ is not of class NSDate", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)bls_renderSeed
{
  OUTLINED_FUNCTION_0(&dword_1B0C75000, a2, a3, "%@ is not of class NSNumber", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end
