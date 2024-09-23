@implementation FBSSceneClientSettingsDiffInspector

- (FBSSceneClientSettingsDiffInspector)init
{
  objc_super v4;

  if (init_onceToken_0 != -1)
    dispatch_once(&init_onceToken_0, &__block_literal_global_20);
  v4.receiver = self;
  v4.super_class = (Class)FBSSceneClientSettingsDiffInspector;
  return -[FBSSettingsDiffInspector init](&v4, sel_init);
}

- (void)observePreferredInterfaceOrientationWithBlock:(id)a3
{
  -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:](self, "observeProperty:withBlock:", sel_preferredInterfaceOrientation, a3);
}

- (void)observeLayersWithBlock:(id)a3
{
  -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:](self, "observeProperty:withBlock:", sel_layers, a3);
}

- (void)observePreferredSceneHostIdentityWithBlock:(id)a3
{
  -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:](self, "observeProperty:withBlock:", sel_preferredSceneHostIdentity, a3);
}

void __43__FBSSceneClientSettingsDiffInspector_init__block_invoke()
{

}

- (void)observeProperty:(SEL)a3 withBlock:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("getter != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:].cold.1(a2);
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A736964);
  }
  v14 = v7;
  v8 = (void *)objc_opt_class();
  FBSSettingForExtensionSelector(v8, a3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("no setting found for %@"), v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:].cold.2(a2);
    goto LABEL_9;
  }
  v10 = (void *)v9;
  -[FBSSettingsDiffInspector observeSetting:withBlock:](self, "observeSetting:withBlock:", v9, v14);

}

- (void)observePreferredLevelWithBlock:(id)a3
{
  -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:](self, "observeProperty:withBlock:", sel_preferredLevel, a3);
}

- (void)observePreferredSceneHostIdentifierWithBlock:(id)a3
{
  -[FBSSceneClientSettingsDiffInspector observeProperty:withBlock:](self, "observeProperty:withBlock:", sel_preferredSceneHostIdentifier, a3);
}

- (void)observeProperty:(const char *)a1 withBlock:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)observeProperty:(const char *)a1 withBlock:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
