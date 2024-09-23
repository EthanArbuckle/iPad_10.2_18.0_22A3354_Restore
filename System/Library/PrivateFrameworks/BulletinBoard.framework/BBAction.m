@implementation BBAction

+ (id)action
{
  return objc_alloc_init((Class)a1);
}

+ (BBAction)actionWithAppearance:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearance:", v4);

  return (BBAction *)v5;
}

+ (BBAction)actionWithCallblock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCallblock:", v4);

  return (BBAction *)v5;
}

+ (BBAction)actionWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return (BBAction *)v5;
}

+ (BBAction)actionWithIdentifier:(id)a3 title:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "actionWithIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BBAppearance appearanceWithTitle:](BBAppearance, "appearanceWithTitle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAppearance:", v8);
  return (BBAction *)v7;
}

+ (BBAction)actionWithLaunchURL:(id)a3
{
  return (BBAction *)objc_msgSend(a1, "actionWithLaunchURL:callblock:", a3, 0);
}

+ (BBAction)actionWithLaunchBundleID:(id)a3
{
  return (BBAction *)objc_msgSend(a1, "actionWithLaunchBundleID:callblock:", a3, 0);
}

+ (BBAction)actionWithLaunchURL:(id)a3 callblock:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "actionWithCallblock:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchURL:", v6);

  return (BBAction *)v7;
}

+ (BBAction)actionWithLaunchBundleID:(id)a3 callblock:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "actionWithCallblock:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchBundleID:", v6);

  return (BBAction *)v7;
}

+ (BBAction)actionWithActivatePluginName:(id)a3 activationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActivatePluginName:", v7);

  objc_msgSend(v8, "setActivatePluginContext:", v6);
  return (BBAction *)v8;
}

- (BBAction)init
{
  BBAction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BBAction;
  result = -[BBAction init](&v3, sel_init);
  if (result)
    result->_shouldDismissBulletin = 1;
  return result;
}

- (BBAction)initWithIdentifier:(id)a3
{
  id v4;
  BBAction *v5;
  BBAction *v6;

  v4 = a3;
  v5 = -[BBAction init](self, "init");
  v6 = v5;
  if (v5)
    -[BBAction setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (void)setCallblock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __25__BBAction_setCallblock___block_invoke;
    v7[3] = &unk_24C564480;
    v8 = v4;
    v6 = (void *)MEMORY[0x212B949C0](v7);

  }
  else
  {
    v6 = 0;
  }
  -[BBAction setInternalBlock:](self, "setInternalBlock:", v6);

}

uint64_t __25__BBAction_setCallblock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasLaunchAction
{
  void *v3;
  BOOL v4;
  void *v5;

  -[BBAction launchBundleID](self, "launchBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[BBAction launchURL](self, "launchURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)hasPluginAction
{
  void *v2;
  BOOL v3;

  -[BBAction activatePluginName](self, "activatePluginName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasRemoteViewAction
{
  void *v3;
  void *v4;
  BOOL v5;

  -[BBAction remoteServiceBundleIdentifier](self, "remoteServiceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BBAction remoteViewControllerClassName](self, "remoteViewControllerClassName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasInteractiveAction
{
  return -[BBAction hasRemoteViewAction](self, "hasRemoteViewAction") || -[BBAction behavior](self, "behavior") != 0;
}

- (id)url
{
  return self->_launchURL;
}

- (id)bundleID
{
  return self->_launchBundleID;
}

- (BOOL)deliverResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v4 = a3;
  if (v4)
  {
    -[BBAction internalBlock](self, "internalBlock");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = v5 != 0;
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);

  }
  else
  {
    v8 = objc_opt_class();
    NSLog(CFSTR("%@-handleResponse: Error: empty response"), v8);
    v7 = 0;
  }

  return v7;
}

- (id)_nameForActionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return CFSTR("unknown");
  else
    return off_24C5644A0[a3 - 1];
}

- (id)partialDescription
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[BBAction launchURL](self, "launchURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[BBAction launchURL](self, "launchURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BBAction canBypassPinLock](self, "canBypassPinLock");
    v7 = CFSTR("no");
    if (v6)
      v7 = CFSTR("yes");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[url] %@; bypassPin: %@"), v5, v7);
LABEL_9:
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  -[BBAction launchBundleID](self, "launchBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[BBAction launchBundleID](self, "launchBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BBAction canBypassPinLock](self, "canBypassPinLock");
    v11 = CFSTR("no");
    if (v10)
      v11 = CFSTR("yes");
    objc_msgSend(v9, "stringWithFormat:", CFSTR("[bundleID] %@; bypassPin: %@"), v5, v11);
    goto LABEL_9;
  }
  v12 = &stru_24C5686F0;
LABEL_10:
  -[BBAction activatePluginName](self, "activatePluginName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    -[BBAction activatePluginName](self, "activatePluginName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction activatePluginContext](self, "activatePluginContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("[plugin] %@ (context: %@)"), v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v17;
  }
  -[BBAction remoteViewControllerClassName](self, "remoteViewControllerClassName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[BBAction remoteViewControllerClassName](self, "remoteViewControllerClassName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction remoteServiceBundleIdentifier](self, "remoteServiceBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("[view service] %@; inBundle: %@"), v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v22;
  }
  -[BBAction internalBlock](self, "internalBlock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", -[BBAction internalBlock](self, "internalBlock"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR("callblock: %@"), v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v26;
  }
  if (-[BBAction behavior](self, "behavior") == 1)
  {
    -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(" behavior: textInput"));
    v27 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v27;
  }
  v28 = (void *)MEMORY[0x24BDD17C8];
  -[BBAction identifier](self, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBAction _nameForActionType:](self, "_nameForActionType:", -[BBAction actionType](self, "actionType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("ID: %@; type: %@; action: %@"), v29, v30, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  BBAction *v4;
  BBAction *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = (BBAction *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        v6 = -[BBAction canBypassPinLock](v5, "canBypassPinLock");
        if (v6 != -[BBAction canBypassPinLock](self, "canBypassPinLock")
          || (v7 = -[BBAction actionType](v5, "actionType"), v7 != -[BBAction actionType](self, "actionType")))
        {
          LOBYTE(v10) = 0;
LABEL_48:

          goto LABEL_49;
        }
        -[BBAction internalBlock](v5, "internalBlock");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBAction internalBlock](self, "internalBlock");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 != v9)
        {
          LOBYTE(v10) = 0;
LABEL_47:

          goto LABEL_48;
        }
        -[BBAction identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBAction identifier](v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_46:

          goto LABEL_47;
        }
        -[BBAction appearance](self, "appearance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBAction appearance](v5, "appearance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_45:

          goto LABEL_46;
        }
        -[BBAction launchURL](self, "launchURL");
        v15 = objc_claimAutoreleasedReturnValue();
        -[BBAction launchURL](v5, "launchURL");
        v47 = (void *)v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_44:

          goto LABEL_45;
        }
        v45 = v16;
        -[BBAction launchBundleID](self, "launchBundleID");
        v17 = objc_claimAutoreleasedReturnValue();
        -[BBAction launchBundleID](v5, "launchBundleID");
        v46 = (void *)v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_43:

          v16 = v45;
          goto LABEL_44;
        }
        v44 = v18;
        -[BBAction activatePluginName](self, "activatePluginName");
        v19 = objc_claimAutoreleasedReturnValue();
        -[BBAction activatePluginName](v5, "activatePluginName");
        v43 = (void *)v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_42:

          v18 = v44;
          goto LABEL_43;
        }
        v41 = v20;
        -[BBAction activatePluginName](self, "activatePluginName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          -[BBAction activatePluginContext](self, "activatePluginContext");
          v21 = objc_claimAutoreleasedReturnValue();
          -[BBAction activatePluginContext](v5, "activatePluginContext");
          v39 = (void *)v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!BSEqualObjects())
          {
            LOBYTE(v10) = 0;
LABEL_40:

LABEL_41:
            v20 = v41;
            goto LABEL_42;
          }
          v38 = v22;
        }
        -[BBAction remoteViewControllerClassName](self, "remoteViewControllerClassName");
        v23 = objc_claimAutoreleasedReturnValue();
        -[BBAction remoteViewControllerClassName](v5, "remoteViewControllerClassName");
        v40 = (void *)v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          v37 = v24;
          -[BBAction remoteServiceBundleIdentifier](self, "remoteServiceBundleIdentifier");
          v25 = objc_claimAutoreleasedReturnValue();
          -[BBAction remoteServiceBundleIdentifier](v5, "remoteServiceBundleIdentifier");
          v36 = (void *)v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            v35 = v26;
            v27 = -[BBAction activationMode](v5, "activationMode");
            if (v27 == -[BBAction activationMode](self, "activationMode")
              && (v28 = -[BBAction behavior](v5, "behavior"), v28 == -[BBAction behavior](self, "behavior")))
            {
              -[BBAction behaviorParameters](self, "behaviorParameters");
              v29 = objc_claimAutoreleasedReturnValue();
              -[BBAction behaviorParameters](v5, "behaviorParameters");
              v34 = (void *)v29;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (BSEqualObjects()
                && (v32 = -[BBAction isAuthenticationRequired](v5, "isAuthenticationRequired"),
                    v32 == -[BBAction isAuthenticationRequired](self, "isAuthenticationRequired")))
              {
                v33 = -[BBAction shouldDismissBulletin](v5, "shouldDismissBulletin");
                v10 = v33 ^ -[BBAction shouldDismissBulletin](self, "shouldDismissBulletin") ^ 1;
              }
              else
              {
                LOBYTE(v10) = 0;
              }

            }
            else
            {
              LOBYTE(v10) = 0;
            }
            v26 = v35;
          }
          else
          {
            LOBYTE(v10) = 0;
          }

        }
        else
        {

          LOBYTE(v10) = 0;
        }
        v22 = v38;
        if (!v42)
          goto LABEL_41;
        goto LABEL_40;
      }
    }
    LOBYTE(v10) = 0;
  }
LABEL_49:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  void *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  void *v30;
  void *v31;

  -[BBAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v3 != 0;

  -[BBAction appearance](self, "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4 != 0;

  v26 = -[BBAction actionType](self, "actionType");
  v25 = -[BBAction canBypassPinLock](self, "canBypassPinLock");
  -[BBAction launchURL](self, "launchURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v31, "hash");
  -[BBAction launchBundleID](self, "launchBundleID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v30, "hash");
  -[BBAction activatePluginName](self, "activatePluginName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v27, "hash");
  -[BBAction activatePluginContext](self, "activatePluginContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v24, "hash");
  -[BBAction launchBundleID](self, "launchBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v22, "hash");
  -[BBAction internalBlock](self, "internalBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "hash");
  -[BBAction remoteViewControllerClassName](self, "remoteViewControllerClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "hash");
  -[BBAction remoteServiceBundleIdentifier](self, "remoteServiceBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = -[BBAction activationMode](self, "activationMode");
  v10 = -[BBAction behavior](self, "behavior");
  -[BBAction behaviorParameters](self, "behaviorParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = -[BBAction isAuthenticationRequired](self, "isAuthenticationRequired");
  v14 = v26 ^ v25 ^ v23 ^ v21 ^ v28 ^ v29 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ -[BBAction shouldDismissBulletin](self, "shouldDismissBulletin");

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[BBAction appearance](self, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppearance:", v5);

  -[BBAction launchURL](self, "launchURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLaunchURL:", v6);

  -[BBAction identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v7);

  objc_msgSend(v4, "setActionType:", -[BBAction actionType](self, "actionType"));
  -[BBAction internalBlock](self, "internalBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalBlock:", v8);

  -[BBAction launchBundleID](self, "launchBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLaunchBundleID:", v9);

  objc_msgSend(v4, "setCanBypassPinLock:", -[BBAction canBypassPinLock](self, "canBypassPinLock"));
  -[BBAction activatePluginName](self, "activatePluginName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivatePluginName:", v10);

  -[BBAction activatePluginContext](self, "activatePluginContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivatePluginContext:", v11);

  -[BBAction remoteViewControllerClassName](self, "remoteViewControllerClassName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteViewControllerClassName:", v12);

  -[BBAction remoteServiceBundleIdentifier](self, "remoteServiceBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteServiceBundleIdentifier:", v13);

  objc_msgSend(v4, "setActivationMode:", -[BBAction activationMode](self, "activationMode"));
  objc_msgSend(v4, "setBehavior:", -[BBAction behavior](self, "behavior"));
  -[BBAction behaviorParameters](self, "behaviorParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBehaviorParameters:", v14);

  objc_msgSend(v4, "setAuthenticationRequired:", -[BBAction isAuthenticationRequired](self, "isAuthenticationRequired"));
  objc_msgSend(v4, "setShouldDismissBulletin:", -[BBAction shouldDismissBulletin](self, "shouldDismissBulletin"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAction)initWithCoder:(id)a3
{
  id v4;
  BBAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BBAction;
  v5 = -[BBAction init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appearance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setAppearance:](v5, "setAppearance:", v7);

    -[BBAction setActionType:](v5, "setActionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setLaunchURL:](v5, "setLaunchURL:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchBundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setLaunchBundleID:](v5, "setLaunchBundleID:", v9);

    -[BBAction setLaunchCanBypassPinLock:](v5, "setLaunchCanBypassPinLock:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("launchCanBypassPinLock")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activatePluginName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setActivatePluginName:](v5, "setActivatePluginName:", v10);

    BBAllowedClasses();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("activatePluginContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setActivatePluginContext:](v5, "setActivatePluginContext:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteClassName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setRemoteViewControllerClassName:](v5, "setRemoteViewControllerClassName:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteBundleID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setRemoteServiceBundleIdentifier:](v5, "setRemoteServiceBundleIdentifier:", v14);

    -[BBAction setActivationMode:](v5, "setActivationMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activation")));
    -[BBAction setBehavior:](v5, "setBehavior:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("behavior")));
    BBAllowedClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("behaviorParameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAction setBehaviorParameters:](v5, "setBehaviorParameters:", v16);

    -[BBAction setAuthenticationRequired:](v5, "setAuthenticationRequired:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secure")));
    -[BBAction setShouldDismissBulletin:](v5, "setShouldDismissBulletin:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dismiss")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[BBAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[BBAction appearance](self, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("appearance"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[BBAction actionType](self, "actionType"), CFSTR("actionType"));
  -[BBAction launchURL](self, "launchURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("launchURL"));

  -[BBAction launchBundleID](self, "launchBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("launchBundleID"));

  objc_msgSend(v13, "encodeBool:forKey:", -[BBAction launchCanBypassPinLock](self, "launchCanBypassPinLock"), CFSTR("launchCanBypassPinLock"));
  -[BBAction activatePluginName](self, "activatePluginName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("activatePluginName"));

  -[BBAction activatePluginContext](self, "activatePluginContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("activatePluginContext"));

  -[BBAction remoteViewControllerClassName](self, "remoteViewControllerClassName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("remoteClassName"));

  -[BBAction remoteServiceBundleIdentifier](self, "remoteServiceBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("remoteBundleID"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[BBAction activationMode](self, "activationMode"), CFSTR("activation"));
  objc_msgSend(v13, "encodeInteger:forKey:", -[BBAction behavior](self, "behavior"), CFSTR("behavior"));
  -[BBAction behaviorParameters](self, "behaviorParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("behaviorParameters"));

  objc_msgSend(v13, "encodeBool:forKey:", -[BBAction isAuthenticationRequired](self, "isAuthenticationRequired"), CFSTR("secure"));
  objc_msgSend(v13, "encodeBool:forKey:", -[BBAction shouldDismissBulletin](self, "shouldDismissBulletin"), CFSTR("dismiss"));

}

- (id)replacementObjectForCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BBAction partialDescription](self, "partialDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)internalBlock
{
  return self->_internalBlock;
}

- (void)setInternalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)launchBundleID
{
  return self->_launchBundleID;
}

- (void)setLaunchBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)launchCanBypassPinLock
{
  return self->_launchCanBypassPinLock;
}

- (void)setLaunchCanBypassPinLock:(BOOL)a3
{
  self->_launchCanBypassPinLock = a3;
}

- (NSString)activatePluginName
{
  return self->_activatePluginName;
}

- (void)setActivatePluginName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)activatePluginContext
{
  return self->_activatePluginContext;
}

- (void)setActivatePluginContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BBAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isAuthenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_authenticationRequired = a3;
}

- (BOOL)shouldDismissBulletin
{
  return self->_shouldDismissBulletin;
}

- (void)setShouldDismissBulletin:(BOOL)a3
{
  self->_shouldDismissBulletin = a3;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (void)setActivationMode:(unint64_t)a3
{
  self->_activationMode = a3;
}

- (NSString)remoteViewControllerClassName
{
  return self->_remoteViewControllerClassName;
}

- (void)setRemoteViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)remoteServiceBundleIdentifier
{
  return self->_remoteServiceBundleIdentifier;
}

- (void)setRemoteServiceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (NSDictionary)behaviorParameters
{
  return self->_behaviorParameters;
}

- (void)setBehaviorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorParameters, 0);
  objc_storeStrong((id *)&self->_remoteServiceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activatePluginContext, 0);
  objc_storeStrong((id *)&self->_activatePluginName, 0);
  objc_storeStrong((id *)&self->_launchBundleID, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong(&self->_internalBlock, 0);
}

@end
