@implementation INIntentForwardingAction

- (INIntentForwardingAction)initWithIntent:(id)a3
{
  id v5;
  INIntentForwardingAction *v6;
  INIntentForwardingAction *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INIntentForwardingAction;
  v6 = -[INIntentForwardingAction init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intent, a3);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "if_auditToken");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    *(_OWORD *)v7->_hostProcessAuditToken.val = v11;
    *(_OWORD *)&v7->_hostProcessAuditToken.val[4] = v12;

    v7->_allowsScenelessAppLaunch = 1;
    v7->_requestTimeout = 10.0;
  }

  return v7;
}

- (NSString)appBundleIdentifier
{
  NSString *appBundleIdentifier;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  id v9;

  appBundleIdentifier = self->_appBundleIdentifier;
  if (!appBundleIdentifier)
  {
    -[INIntentForwardingAction intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_intents_launchIdForCurrentPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    INExtractAppInfoFromSiriLaunchId(v5, &v9, 0);
    v6 = (NSString *)v9;

    v7 = self->_appBundleIdentifier;
    self->_appBundleIdentifier = v6;

    appBundleIdentifier = self->_appBundleIdentifier;
  }
  return appBundleIdentifier;
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  INAppIntentDeliverer *v10;
  void *v11;
  INAppIntentDeliverer *v12;

  v6 = a4;
  if (a3
    || (-[INIntentForwardingAction appBundleIdentifier](self, "appBundleIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v7 = 0;
  }
  else
  {
    -[INIntentForwardingAction intent](self, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INIssueSandboxExtensionsForFileURLEnumerable(v9);

    v10 = [INAppIntentDeliverer alloc];
    -[INIntentForwardingAction appBundleIdentifier](self, "appBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[INAppIntentDeliverer initWithBundleIdentifier:intentForwardingAction:](v10, "initWithBundleIdentifier:intentForwardingAction:", v11, self);

    -[INAppIntentDeliverer deliverIntentForwardingActionWithResponseHandler:](v12, "deliverIntentForwardingActionWithResponseHandler:", v6);
    v7 = 1;
  }

  return v7;
}

- (INIntentForwardingAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  INIntentForwardingAction *v6;
  void *v7;
  void *v8;
  double v9;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[INIntentForwardingAction initWithIntent:](self, "initWithIntent:", v5);

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostProcessAuditToken"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "if_auditToken");
      *(_OWORD *)v6->_hostProcessAuditToken.val = v11;
      *(_OWORD *)&v6->_hostProcessAuditToken.val[4] = v12;
    }
    v6->_allowsScenelessAppLaunch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsScenelessAppLaunch"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("requestTimeout"));
    v6->_requestTimeout = v9;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  INIntent *intent;
  id v5;
  __int128 v6;
  void *v7;
  _OWORD v8[2];

  intent = self->_intent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", intent, CFSTR("intent"));
  v6 = *(_OWORD *)&self->_hostProcessAuditToken.val[4];
  v8[0] = *(_OWORD *)self->_hostProcessAuditToken.val;
  v8[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D50], "if_dataWithAuditToken:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("hostProcessAuditToken"));

  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsScenelessAppLaunch, CFSTR("allowsScenelessAppLaunch"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("requestTimeout"), self->_requestTimeout);

}

- (INIntent)intent
{
  return self->_intent;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostProcessAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)allowsScenelessAppLaunch
{
  return self->_allowsScenelessAppLaunch;
}

- (void)setAllowsScenelessAppLaunch:(BOOL)a3
{
  self->_allowsScenelessAppLaunch = a3;
}

- (BOOL)allowsForegroundAppLaunch
{
  return self->_allowsForegroundAppLaunch;
}

- (double)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(double)a3
{
  self->_requestTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

+ (Class)responseClass
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
