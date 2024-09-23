@implementation FBScene(AXExtras)

- (id)accessibilitySceneDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSRect v14;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("FBScene (AX) <%p>\n"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessibilitySceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Scene ID: %@\n"), v3);

  objc_msgSend(a1, "accessibilityScenePID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Scene Process (pid): %@\n"), v4);

  objc_msgSend(a1, "accessibilitySceneFrame");
  NSStringFromRect(v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Scene Frame: %@\n"), v5);

  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "accessibilitySceneLevel");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Scene Level: %@\n"), v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "accessibilityIsSceneOccluded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Scene is Occluded: %@\n"), v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "accessibilitySceneBelongsToTheSystemApp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Belongs to system app: %@\n"), v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "accessibilitySceneOwnerIsAUIApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Is a UIApplication: %@\n"), v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "accessibilitySceneIsForegroundVisible"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Is foreground visible: %@\n"), v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "accessibilitySceneIsRunningInForeground"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("  Is foreground running: %@\n"), v12);

  return v2;
}

- (uint64_t)accessibilityIsSceneOnMainScreen
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMainDisplay");

  return v3;
}

- (uint64_t)accessibilityIsSceneOnExternalScreen
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExternal");

  return v3;
}

- (uint64_t)accessibilityIsSceneOnCarScreen
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarDisplay");

  return v3;
}

- (BOOL)accessibilityIsSceneOnUnknownScreen
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 7;

  return v3;
}

- (BOOL)accessibilitySceneBelongsToTheSystemApp
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  AXFrontBoardSystemAppProcess();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessibilitySceneProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (BOOL)accessibilitySceneIsDismissedInCallService
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;

  objc_msgSend(a1, "accessibilitySceneProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE00140]);

  if (!v4)
    return 0;
  objc_opt_class();
  objc_msgSend(a1, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_legacyOtherSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForSetting:", 3001);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = (unint64_t)(v9 - 4) < 0xFFFFFFFFFFFFFFFELL;
  return v10;
}

- (BOOL)accessibilitySceneIsCallServiceBanner
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  objc_msgSend(a1, "accessibilitySceneProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE00140]);

  if (!v4)
    return 0;
  objc_opt_class();
  objc_msgSend(a1, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_legacyOtherSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForSetting:", 3001);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue") == 1;

  return v9;
}

- (BOOL)accessibilitySceneIsDismissedSearchScreen
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("searchScreen"));

  if (!v3)
    return 0;
  objc_opt_class();
  objc_msgSend(a1, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_legacyOtherSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForSetting:", 1000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue") == 0;

  return v8;
}

- (uint64_t)accessibilitySceneOwnerIsAUIApplication
{
  void *v2;
  char isKindOfClass;

  NSClassFromString(CFSTR("FBApplicationProcess"));
  objc_msgSend(a1, "accessibilitySceneProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilitySceneIsSuspended
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "accessibilitySceneProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeIntForKey:", CFSTR("taskState")) == 3;

  return v2;
}

- (BOOL)accessibilitySceneIsForegroundVisible
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "accessibilitySceneProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeIntegerForKey:", CFSTR("visibility")) == 2;

  return v2;
}

- (uint64_t)accessibilitySceneIsRunningInForeground
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessibilitySceneProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeBoolForKey:", CFSTR("isForeground"));

  return v2;
}

- (BOOL)accessibilitySceneIsDeactivatedBySidebar
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "conformsToProtocol:", &unk_255024B80)
    && (objc_msgSend(v1, "deactivationReasons") & 0x80) != 0;

  return v2;
}

- (BOOL)accessibilitySceneIsDeactivatedBySwitcher
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "conformsToProtocol:", &unk_255024B80)
    && (objc_msgSend(v1, "deactivationReasons") & 8) != 0;

  return v2;
}

- (uint64_t)accessibilitySceneIdentifier
{
  return objc_msgSend(a1, "safeValueForKey:", CFSTR("identifier"));
}

- (id)accessibilityScenePID
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(a1, "accessibilitySceneProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilitySceneProcess
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("clientProcess"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "safeValueForKey:", CFSTR("clientHandle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "legacyProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (double)accessibilitySceneFrame
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("frame"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGRectValue");
  v4 = v3;

  return v4;
}

- (double)accessibilitySceneLevel
{
  void *v1;
  void *v2;
  float v3;
  double v4;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("level"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (uint64_t)accessibilityIsSceneOccluded
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("settings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("isOccluded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
