@implementation FBSceneWorkspaceAccessibility_SettingsLoader

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FBSceneWorkspace");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSceneWorkspace"), CFSTR("initWithIdentifier:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSceneWorkspace"), CFSTR("invalidate"), "v", 0);

}

- (FBSceneWorkspaceAccessibility_SettingsLoader)initWithIdentifier:(id)a3
{
  id v4;
  FBSceneWorkspaceAccessibility_SettingsLoader *v5;
  NSObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBSceneWorkspaceAccessibility_SettingsLoader;
  v5 = -[FBSceneWorkspaceAccessibility_SettingsLoader initWithIdentifier:](&v8, sel_initWithIdentifier_, v4);
  if (initWithIdentifier__onceToken != -1)
    dispatch_once(&initWithIdentifier__onceToken, &__block_literal_global_4);
  objc_msgSend((id)AXWorkspaces, "setObject:forKeyedSubscript:", v5, v4);
  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FBSceneWorkspaceAccessibility_SettingsLoader initWithIdentifier:].cold.1((uint64_t)v4, (uint64_t)v5, v6);

  return v5;
}

+ (id)_accessibilityCachedWorkspaces
{
  return (id)AXWorkspaces;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBSceneWorkspaceAccessibility_SettingsLoader;
  -[FBSceneWorkspaceAccessibility_SettingsLoader invalidate](&v5, sel_invalidate);
  v3 = (void *)AXWorkspaces;
  -[FBSceneWorkspaceAccessibility_SettingsLoader safeStringForKey:](self, "safeStringForKey:", CFSTR("_identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)initWithIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_230B0B000, log, OS_LOG_TYPE_DEBUG, "Monitoring workspace: %@ %@", (uint8_t *)&v3, 0x16u);
}

@end
