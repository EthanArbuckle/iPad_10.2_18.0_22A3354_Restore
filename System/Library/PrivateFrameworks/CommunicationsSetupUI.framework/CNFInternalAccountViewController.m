@implementation CNFInternalAccountViewController

- (CNFInternalAccountViewController)initWithAccount:(id)a3
{
  id v4;
  CNFInternalAccountViewController *v5;
  CNFInternalAccountViewController *v6;
  void *v7;
  uint64_t v8;
  FTRegConnectionHandler *v9;
  FTRegConnectionHandler *connectionHandler;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFInternalAccountViewController;
  v5 = -[CNFInternalAccountViewController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CNFInternalAccountViewController setAccount:](v5, "setAccount:", v4);
    objc_msgSend(v4, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = FTCServiceTypeForService(v7);

    v9 = -[FTRegConnectionHandler initWithServiceType:name:]([FTRegConnectionHandler alloc], "initWithServiceType:name:", v8, CFSTR("InternalAccountView"));
    connectionHandler = v6->_connectionHandler;
    v6->_connectionHandler = v9;

  }
  return v6;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[CNFInternalAccountViewController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("ConferenceInternalAccountViewSettings"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("ALIAS_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon"))
    {
      if (v6)
      {
        v8 = objc_msgSend(v5, "indexOfObject:", v6);
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = v8 + 1;
          -[CNFInternalAccountViewController account](self, "account");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "aliases");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __46__CNFInternalAccountViewController_specifiers__block_invoke;
          v19[3] = &unk_24D075B10;
          v19[4] = self;
          v20 = v5;
          v21 = v9;
          objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, v19);

          v7 = 0;
        }
      }
    }
    if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon"))
    {
      -[CNFInternalAccountViewController account](self, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "registrationStatus");

      if (v13 == -1)
      {
        if (!v7)
        {
LABEL_10:
          v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

          v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
          return v4;
        }
LABEL_9:
        objc_msgSend(v5, "removeObject:", v6);
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v5, "specifierForID:", CFSTR("DISPLAY_NAME_GROUP"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "specifierForID:", CFSTR("DISPLAY_NAME"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v16);
      objc_msgSend(v5, "removeObject:", v17);

    }
    objc_msgSend(v5, "specifierForID:", CFSTR("REGISTRATION_FAILURE_REASON"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v18);

    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  return v4;
}

void __46__CNFInternalAccountViewController_specifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "specifierForAlias:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v3, *(_QWORD *)(a1 + 48));
    v3 = v4;
  }

}

- (id)bundle
{
  return +[CNFInternalSettingsUtilities currentInternalSettingsBundle](CNFInternalSettingsUtilities, "currentInternalSettingsBundle");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountViewController;
  -[CNFInternalAccountViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNFInternalAccountViewController _startListeningForNotifications](self, "_startListeningForNotifications");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountViewController;
  -[CNFInternalAccountViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CNFInternalAccountViewController _stopListeningForNotifications](self, "_stopListeningForNotifications");
}

- (id)specifierForAlias:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel_statusForAlias_, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v5, CFSTR("cnf-internal-alias"));

  return v6;
}

- (BOOL)isConnectedToDaemon
{
  return -[FTRegConnectionHandler isConnectedToDaemon](self->_connectionHandler, "isConnectedToDaemon");
}

- (id)accountLoginStatus:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
  {
    -[CNFInternalAccountViewController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "loginStatus");
      if (v6 > 4)
        v7 = CFSTR("Unknown");
      else
        v7 = off_24D075FA0[v6];
      objc_msgSend(v5, "loginStatusMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v5, "loginStatusMessage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToIgnoringCase:", &stru_24D077260) & 1) == 0)
        {
          objc_msgSend(v5, "loginStatusMessage");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
    }
    else
    {
      v7 = CFSTR("Account missing");
    }
    v9 = v7;

    v8 = v9;
  }
  else
  {
    v8 = CFSTR("Disconnected");
    v9 = CFSTR("Unavailable");
  }

  return v8;
}

- (id)registrationStatus:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
  {
    -[CNFInternalAccountViewController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      CNFRegNonLocStringForRegistrationStatus(objc_msgSend(v4, "registrationStatus"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("Account missing");
    }
    v8 = v6;

    v7 = v8;
  }
  else
  {
    v7 = CFSTR("Disconnected");
    v8 = CFSTR("Unavailable");
  }

  return v7;
}

- (id)accountLogin:(id)a3
{
  void *v4;
  __CFString *v5;

  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
  {
    -[CNFInternalAccountViewController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "login");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("Disconnected");
  }
  return v5;
}

- (id)accountType:(id)a3
{
  void *v4;
  unint64_t v5;
  __CFString *v6;

  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
  {
    -[CNFInternalAccountViewController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accountType");

    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown account type (%ld)"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24D075FC8[v5];
    }
  }
  else
  {
    v6 = CFSTR("Disconnected");
  }
  return v6;
}

- (id)statusForAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = a3;
  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon"))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("cnf-internal-alias"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFInternalAccountViewController account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegNonLocStringForAliasValidationStatus(objc_msgSend(v6, "validationStatusForAlias:", v5));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("Disconnected");
  }

  return v7;
}

- (id)accountDisplayName:(id)a3
{
  void *v4;
  __CFString *v5;

  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
  {
    -[CNFInternalAccountViewController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("Disconnected");
  }
  return v5;
}

- (id)registrationFailureReason:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
  {
    -[CNFInternalAccountViewController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "registrationFailureReason");

    v6 = (void *)MEMORY[0x24BDD17C8];
    CNFRegNonLocStringForRegistrationFailure(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%ld: %@"), v5, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("Disconnected");
  }
  return v8;
}

- (id)accountIsActive:(id)a3
{
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;

  if (!-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
    return CFSTR("Disconnected");
  -[CNFInternalAccountViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v7 = v6;

  return v7;
}

- (void)_startListeningForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDaemonConnected_, *MEMORY[0x24BE50118], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDaemonDisconnected_, *MEMORY[0x24BE50120], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50028], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50030], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE500B8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50008], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE4FFB8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50058], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50068], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50018], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50020], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE4FFA8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50038], 0);

}

- (void)_stopListeningForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50118], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50120], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50028], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50030], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE500B8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50008], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE4FFB8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50058], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50068], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50018], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50020], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE4FFA8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50038], 0);

}

- (void)_handleAccountNotification:(id)a3
{
  if (-[CNFInternalAccountViewController isConnectedToDaemon](self, "isConnectedToDaemon", a3))
    -[CNFInternalAccountViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
