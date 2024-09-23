@implementation CCUIAppLauncherModule

- (CCUIAppLauncherModule)init
{
  CCUIAppLauncherModule *v2;
  uint64_t v3;
  NSBundle *bundle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *displayName;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  CCUIAppLauncherModule *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CCUIAppLauncherModule;
  v2 = -[CCUIAppLauncherModule init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "ccui_bundleForModuleInstance:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v3;

    -[NSBundle infoDictionary](v2->_bundle, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("CCAssociatedBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAppLauncherModule setApplicationIdentifier:](v2, "setApplicationIdentifier:", v6);

    objc_msgSend(v5, "objectForKey:", CFSTR("CCLaunchApplicationIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAppLauncherModule setLaunchApplicationIdentifier:](v2, "setLaunchApplicationIdentifier:", v7);

    objc_msgSend(v5, "objectForKey:", CFSTR("CCLaunchURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIAppLauncherModule setLaunchURL:](v2, "setLaunchURL:", v9);

    }
    else
    {
      -[CCUIAppLauncherModule setLaunchURL:](v2, "setLaunchURL:", 0);
    }
    -[NSBundle ccui_displayName](v2->_bundle, "ccui_displayName");
    v10 = objc_claimAutoreleasedReturnValue();
    displayName = v2->_displayName;
    v2->_displayName = (NSString *)v10;

    objc_msgSend(v5, "objectForKey:", CFSTR("CCSupportsApplicationShortcuts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = objc_msgSend(v12, "BOOLValue");
    else
      v14 = 1;
    v2->_supportsApplicationShortcuts = v14;
    objc_msgSend(v5, "objectForKey:", CFSTR("CCRequestAuthenticationForExpandedModule"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      LOBYTE(v15) = objc_msgSend(v15, "BOOLValue");
    v2->_requestAuthenticationForExpandedModule = (char)v15;
    dispatch_get_global_queue(9, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__CCUIAppLauncherModule_init__block_invoke;
    block[3] = &unk_1E8E20590;
    v20 = v2;
    dispatch_async(v17, block);

  }
  return v2;
}

uint64_t __29__CCUIAppLauncherModule_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchApplicationIfNeeded");
}

- (UIImage)iconGlyph
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("AppIcon"), self->_bundle);
}

- (id)launchURLForTouchType:(int64_t)a3
{
  return self->_launchURL;
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CCUIAppLauncherModule launchURLForTouchType:](self, "launchURLForTouchType:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIAppLauncherModule launchApplicationIdentifier](self, "launchApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAppLauncherModule applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CCUIAppLauncherModule contentModuleContext](self, "contentModuleContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAppLauncherModule launchURLForTouchType:](self, "launchURLForTouchType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:completionHandler:", v8, 0);
  }
  else
  {
    if (v5)
    {
      -[CCUIAppLauncherModule contentModuleContext](self, "contentModuleContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "openApplication:completionHandler:", v5, 0);
      goto LABEL_6;
    }
    if (!v6)
      goto LABEL_7;
    -[CCUIAppLauncherModule contentModuleContext](self, "contentModuleContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAppLauncherModule applicationIdentifier](self, "applicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openApplication:completionHandler:", v8, 0);
  }

LABEL_6:
LABEL_7:

}

- (id)contentViewControllerForContext:(id)a3
{
  CCUIAppLauncherViewController *v4;
  void *v5;

  v4 = objc_alloc_init(CCUIAppLauncherViewController);
  -[CCUIAppLauncherModule contentModuleContext](self, "contentModuleContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setContentModuleContext:](v4, "setContentModuleContext:", v5);

  -[CCUIAppLauncherViewController setModule:](v4, "setModule:", self);
  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (SBFApplication)_application
{
  -[CCUIAppLauncherModule _fetchApplicationIfNeeded](self, "_fetchApplicationIfNeeded");
  return self->_application;
}

- (void)_fetchApplicationIfNeeded
{
  CCUIAppLauncherModule *v2;
  uint64_t v3;
  SBFApplication *application;
  CCUIAppLauncherModule *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_applicationIdentifier && !obj->_application)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9D90]), "initWithApplicationBundleIdentifier:", obj->_applicationIdentifier);
    application = obj->_application;
    obj->_application = (SBFApplication *)v3;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)launchApplicationIdentifier
{
  return self->_launchApplicationIdentifier;
}

- (void)setLaunchApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)supportsApplicationShortcuts
{
  return self->_supportsApplicationShortcuts;
}

- (void)setSupportsApplicationShortcuts:(BOOL)a3
{
  self->_supportsApplicationShortcuts = a3;
}

- (BOOL)requestAuthenticationForExpandedModule
{
  return self->_requestAuthenticationForExpandedModule;
}

- (void)setRequestAuthenticationForExpandedModule:(BOOL)a3
{
  self->_requestAuthenticationForExpandedModule = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_launchApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
