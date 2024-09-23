@implementation ICAccessManager

+ (id)internalAccessType:(unint64_t)a3
{
  __CFString **v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = &ICAccessTypeWrite;
  }
  else
  {
    v3 = ICAccessTypeRead;
  }
  return *v3;
}

+ (id)bundleIdentifiersAccessingExternalMediaDevices
{
  void *v2;
  void *v3;

  +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifiersAccessingExternalCameras");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)updateBundleIdentifierAccessingExternalMediaDevices:(id)a3 withStatus:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateApplicationWithBundleIdentifier:withStatus:", v5, v4);

}

+ (id)bundleIdentifiersAccessingExternalMediaDevicesWithStatus
{
  void *v2;
  void *v3;

  +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifiersAccessingExternalCamerasWithStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)addBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBundleIdentifier:", v3);

}

+ (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v5 = a3;
  +[ICAccessManager internalAccessType:](ICAccessManager, "internalAccessType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "bundleIdentifier:stateForAccessType:", v5, v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)connection:(id)a3 stateForAccessType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  +[ICAccessManager internalAccessType:](ICAccessManager, "internalAccessType:", objc_msgSend(a4, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "connection:stateForAccessType:", v5, v6);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)updateBundleIdentifier:(id)a3 accessType:(unint64_t)a4 withState:(unint64_t)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[ICAccessManager internalAccessType:](ICAccessManager, "internalAccessType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateBundleIdentifier:accessType:withState:", v9, v7, a5);

  }
}

+ (void)revokeBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revokeBundleIdentifier:", v3);

}

+ (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "captureUserIntentForBundleIdentifier:withNotification:", v6, v5);

  return v8;
}

@end
