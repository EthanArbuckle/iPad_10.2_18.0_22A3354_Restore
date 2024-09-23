@implementation HDBackgroundAppLauncher

- (void)requestAppLaunchWithBundleID:(id)a3 updateFrequency:(double)a4
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 >= 60.0)
    v6 = a4 * 0.5;
  else
    v6 = 30.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)*MEMORY[0x1E0D1D9C0];
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Requesting to launch Duet for the App's bundleID %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.healthkit.background-delivery.%@"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1D900], "applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:", v11, *MEMORY[0x1E0D1DA18], v5, v9, *MEMORY[0x1E0D1D978], v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCancelAfterDeadline:", 0);
  objc_msgSend(MEMORY[0x1E0D1D920], "complete");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFileProtection:", v13);

  objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitActivity:", v12);

}

- (void)requestAssertionInvalidationForBundleID:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D1D928];
  v4 = a3;
  objc_msgSend(v3, "sharedScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endLaunchWithReason:forApp:", *MEMORY[0x1E0D1D9C0], v4);

}

@end
