@implementation HKUserNotificationsDataSource

- (BOOL)areNotificationsAuthorizedWithBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v9;

  v3 = (objc_class *)MEMORY[0x1E0CEC7A0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", v4);

  objc_msgSend(v5, "notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "authorizationStatus");

  v9 = v7 == 4 || (v7 & 0xFFFFFFFFFFFFFFFELL) == 2;
  return v9;
}

@end
