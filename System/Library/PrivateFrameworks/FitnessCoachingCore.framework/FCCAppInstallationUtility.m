@implementation FCCAppInstallationUtility

- (BOOL)fitnessAppInstalled
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  char v7;
  void *v8;
  id v10;

  v10 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Fitness"), 0, &v10);
  v3 = v10;
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    objc_msgSend(v2, "applicationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isInstalled");

  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCCAppInstallationUtility fitnessAppInstalled].cold.1((uint64_t)v4, v6);
    v7 = 0;
  }

  return v7;
}

- (void)fitnessAppInstalled
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0C58000, a2, OS_LOG_TYPE_ERROR, "Error creating application record %@", (uint8_t *)&v2, 0xCu);
}

@end
