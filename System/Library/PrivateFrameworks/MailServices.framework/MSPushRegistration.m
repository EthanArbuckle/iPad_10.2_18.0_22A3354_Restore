@implementation MSPushRegistration

- (MSPushRegistration)init
{
  MSPushRegistration *v2;
  MSPushRegistration *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  MSPushRegistration *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSPushRegistration;
  v2 = -[MSMailDefaultService init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSMailDefaultService setShouldLaunchMobileMail:](v2, "setShouldLaunchMobileMail:", 1);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    bundleIdentifier = v3->_bundleIdentifier;
    v3->_bundleIdentifier = (NSString *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)registerForPush:(id)a3
{
  id v5;
  NSString *notificationNamePrefix;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!self->_bundleIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSPushRegistration.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_bundleIdentifier"));

  }
  if (!self->_accountIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSPushRegistration.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_accountIdentifier"));

  }
  notificationNamePrefix = self->_notificationNamePrefix;
  if (!notificationNamePrefix)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSPushRegistration.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_notificationNamePrefix"));

    notificationNamePrefix = self->_notificationNamePrefix;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", self->_bundleIdentifier, CFSTR("bundle"), self->_accountIdentifier, CFSTR("account-id"), notificationNamePrefix, CFSTR("prefix"), self->_mailboxNames, CFSTR("mailboxes"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __38__MSPushRegistration_registerForPush___block_invoke;
  v12[3] = &unk_24C385178;
  v8 = v5;
  v13 = v8;
  -[MSService _callServicesMethod:arguments:callback:](self, "_callServicesMethod:arguments:callback:", CFSTR("PushRegistration"), v7, v12);

}

void __38__MSPushRegistration_registerForPush___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("success"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "BOOLValue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)notificationNamePrefix
{
  return self->_notificationNamePrefix;
}

- (void)setNotificationNamePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)mailboxNames
{
  return self->_mailboxNames;
}

- (void)setMailboxNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxNames, 0);
  objc_storeStrong((id *)&self->_notificationNamePrefix, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
