@implementation UNUserNotificationCenterDelegateService

+ (id)serviceNameForBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(CFSTR("com.apple.usernotifications.delegate."), "stringByAppendingString:", a3);
}

void __58__UNUserNotificationCenterDelegateService_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB8BBA0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface___interface_0;
  serverInterface___interface_0 = v0;

  v2 = (void *)serverInterface___interface_0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler_, 0, 0);

  v4 = (void *)serverInterface___interface_0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler_, 1, 0);

  v6 = (void *)serverInterface___interface_0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_didChangeSettings_forBundleIdentifier_, 0, 0);

  v8 = (void *)serverInterface___interface_0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didOpenApplicationForResponse_forBundleIdentifier_, 0, 0);

}

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1)
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_7);
  return (id)serverInterface___interface_0;
}

@end
