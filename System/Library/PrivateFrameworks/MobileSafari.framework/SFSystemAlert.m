@implementation SFSystemAlert

- (SFSystemAlert)initWithTitle:(id)a3 message:(id)a4 affirmativeButtonTitle:(id)a5 negativeButtonTitle:(id)a6
{
  return -[SFSystemAlert initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:alternateButtonTitle:](self, "initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:alternateButtonTitle:", a3, a4, a5, a6, 0);
}

- (SFSystemAlert)initWithTitle:(id)a3 message:(id)a4 affirmativeButtonTitle:(id)a5 negativeButtonTitle:(id)a6 alternateButtonTitle:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SFSystemAlert *v17;
  SFSystemAlert *v18;
  SFSystemAlert *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SFSystemAlert;
  v17 = -[SFSystemAlert init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_message, a4);
    objc_storeStrong((id *)&v18->_affirmativeButtonTitle, a5);
    objc_storeStrong((id *)&v18->_negativeButtonTitle, a6);
    objc_storeStrong((id *)&v18->_alternateButtonTitle, a7);
    v19 = v18;
  }

  return v18;
}

+ (id)_displayNameForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CA5860];
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationProxyForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localizedShortName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v8, "localizedShortName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedShortName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)webAuthenticationAlertForDomain:(id)a3 appBundleID:(id)a4
{
  id v5;
  void *v6;
  SFSystemAlert *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFSystemAlert *v14;

  v5 = a3;
  +[SFSystemAlert _displayNameForBundleID:](SFSystemAlert, "_displayNameForBundleID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SFSystemAlert alloc];
  v8 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SFSystemAlert initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:](v7, "initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:", v10, v11, v12, v13);

  return v14;
}

+ (id)readingListAlertForDomain:(id)a3 appBundleID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SFSystemAlert *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFSystemAlert *v19;

  v5 = a3;
  +[SFSystemAlert _displayNameForBundleID:](SFSystemAlert, "_displayNameForBundleID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_bestURLForUserTypedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_highLevelDomainFromHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [SFSystemAlert alloc];
  v11 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedStringWithCurrentUserLocale();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedStringWithCurrentUserLocale();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedStringWithCurrentUserLocale();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedStringWithCurrentUserLocale();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SFSystemAlert initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:](v10, "initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:", v13, v16, v17, v18);

  return v19;
}

+ (id)searchEngineSettingAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SFSystemAlert *v6;

  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFSystemAlert initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:]([SFSystemAlert alloc], "initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:", v2, v3, v4, v5);

  return v6;
}

+ (id)sharedTabGroupsManateeAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SFSystemAlert *v6;

  objc_msgSend(MEMORY[0x1E0D89BE8], "isAppleAccountBrandingEnabled");
  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D89BE8], "isAppleAccountBrandingEnabled");
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFSystemAlert initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:]([SFSystemAlert alloc], "initWithTitle:message:affirmativeButtonTitle:negativeButtonTitle:", v2, v3, v5, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SFSystemAlert cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)SFSystemAlert;
  -[SFSystemAlert dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  __CFUserNotification *cfNotification;
  __CFRunLoop *Main;

  if ((SFSystemAlert *)activeNotification == self)
  {
    activeNotification = 0;

  }
  cfNotification = self->_cfNotification;
  if (cfNotification)
  {
    CFUserNotificationCancel(cfNotification);
    CFRelease(self->_cfNotification);
    self->_cfNotification = 0;
  }
  if (self->_cfRunloopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_cfRunloopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    CFRelease(self->_cfRunloopSource);
    self->_cfRunloopSource = 0;
  }
}

- (void)scheduleWithCompletionBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  uint64_t *p_title;
  __CFUserNotification *v9;
  __CFRunLoop *Main;
  void *v11;
  id completionBlock;
  NSObject *v13;
  SInt32 error;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (activeNotification)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 2);
  }
  else
  {
    v6 = *MEMORY[0x1E0C9B868];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_title = (uint64_t *)&self->_title;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_title, *MEMORY[0x1E0C9B800]);
    if (-[NSString length](self->_message, "length"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_message, *MEMORY[0x1E0C9B810]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_negativeButtonTitle, *MEMORY[0x1E0C9B830]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_affirmativeButtonTitle, v6);
    if (-[NSString length](self->_alternateButtonTitle, "length"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_alternateButtonTitle, *MEMORY[0x1E0C9B838]);
    error = 0;
    v9 = CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, (CFDictionaryRef)v7);
    self->_cfNotification = v9;
    if (v9)
    {
      self->_cfRunloopSource = CFUserNotificationCreateRunLoopSource(0, v9, (CFUserNotificationCallBack)SFUserNotificationRunLoopSourceCallback, 0);
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, self->_cfRunloopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      v11 = _Block_copy(v5);
      completionBlock = self->_completionBlock;
      self->_completionBlock = v11;

      objc_storeStrong((id *)&activeNotification, self);
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXViewService();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SFSystemAlert scheduleWithCompletionBlock:].cold.1(p_title, &error, v13);
      v5[2](v5, 2);
    }

  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_negativeButtonTitle, 0);
  objc_storeStrong((id *)&self->_affirmativeButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)scheduleWithCompletionBlock:(os_log_t)log .cold.1(uint64_t *a1, int *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Fail to create the system alert with title %@ and error code %d", (uint8_t *)&v5, 0x12u);
}

@end
