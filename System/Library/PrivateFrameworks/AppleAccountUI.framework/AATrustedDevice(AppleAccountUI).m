@implementation AATrustedDevice(AppleAccountUI)

- (id)_deviceLocatorKey
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "deviceQualifiedClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("DEVICE_LOCATOR_%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)aaui_localizedDeviceLocatorLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_deviceLocatorKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DEVICE_LOCATOR_UNKNOWN"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
