@implementation DTApplicationListingService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.device.applictionListing"), 1, a1);
}

- (void)applicationInstalled:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__sendNotification_install_);
}

- (void)applicationUninstalled:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__sendNotification_install_);
}

- (void)_sendNotification:(id)a3 install:(BOOL)a4
{
  char **v5;
  void *v6;
  id v7;

  v5 = &selRef_applicationInstalled_;
  if (!a4)
    v5 = &selRef_applicationUninstalled_;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", *v5, a3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DTXService channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendControlAsync:replyHandler:", v7, 0);

}

- (id)installedApplicationsMatching:(id)a3 registerUpdateToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  DTApplicationListingService *v15;

  v6 = a4;
  v7 = a3;
  +[DTApplicationWorkspaceObserver sharedInstance](DTApplicationWorkspaceObserver, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerNotificationToken:observer:query:", v6, self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DTXService channel](self, "channel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_222BA2870;
  v13[3] = &unk_24EB28350;
  v14 = v6;
  v15 = self;
  v11 = v6;
  objc_msgSend(v10, "registerDisconnectHandler:", v13);

  return v9;
}

- (void)unregisterUpdateToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[DTApplicationWorkspaceObserver sharedInstance](DTApplicationWorkspaceObserver, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterNotificationToken:observer:", v4, self);

}

@end
