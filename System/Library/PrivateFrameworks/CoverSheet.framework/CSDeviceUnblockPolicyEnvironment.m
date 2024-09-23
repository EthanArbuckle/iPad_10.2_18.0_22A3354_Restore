@implementation CSDeviceUnblockPolicyEnvironment

- (CSDeviceUnblockPolicyEnvironment)initWithBuilder:(id)a3
{
  void (**v4)(id, CSDeviceUnblockPolicyEnvironmentBuilder *);
  CSDeviceUnblockPolicyEnvironment *v5;
  CSDeviceUnblockPolicyEnvironmentBuilder *v6;
  objc_super v8;

  v4 = (void (**)(id, CSDeviceUnblockPolicyEnvironmentBuilder *))a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDeviceUnblockPolicyEnvironment;
  v5 = -[CSDeviceUnblockPolicyEnvironment init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(CSDeviceUnblockPolicyEnvironmentBuilder);
    v4[2](v4, v6);
    v5->_isUserRequestedEraseEnabled = -[CSDeviceUnblockPolicyEnvironmentBuilder isUserRequestedEraseEnabled](v6, "isUserRequestedEraseEnabled");
    v5->_isUserFindMyAccountPresent = -[CSDeviceUnblockPolicyEnvironmentBuilder isUserFindMyAccountPresent](v6, "isUserFindMyAccountPresent");
    v5->_isDeviceInternetConnectionActive = -[CSDeviceUnblockPolicyEnvironmentBuilder isDeviceInternetConnectionActive](v6, "isDeviceInternetConnectionActive");
    v5->_isPasscodeGracePeriodUsable = -[CSDeviceUnblockPolicyEnvironmentBuilder isPasscodeGracePeriodUsable](v6, "isPasscodeGracePeriodUsable");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSDeviceUnblockPolicyEnvironment *v4;
  _QWORD v6[5];

  v4 = [CSDeviceUnblockPolicyEnvironment alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CSDeviceUnblockPolicyEnvironment_copyWithZone___block_invoke;
  v6[3] = &unk_1E8E2DA58;
  v6[4] = self;
  return -[CSDeviceUnblockPolicyEnvironment initWithBuilder:](v4, "initWithBuilder:", v6);
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[CSDeviceUnblockPolicyEnvironment isUserRequestedEraseEnabled](self, "isUserRequestedEraseEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("isUserRequestedEraseEnabled: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (-[CSDeviceUnblockPolicyEnvironment isUserFindMyAccountPresent](self, "isUserFindMyAccountPresent"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("isUserFindMyAccountPresent: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (-[CSDeviceUnblockPolicyEnvironment isDeviceInternetConnectionActive](self, "isDeviceInternetConnectionActive"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("isDeviceInternetConnectionActive: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v12 = (void *)MEMORY[0x1E0CB3940];
  if (-[CSDeviceUnblockPolicyEnvironment isPasscodeGracePeriodUsable](self, "isPasscodeGracePeriodUsable"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("isPasscodeGracePeriodUsable: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  _BOOL4 v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[CSDeviceUnblockPolicyEnvironment isUserRequestedEraseEnabled](self, "isUserRequestedEraseEnabled");
    if (v6 == objc_msgSend(v5, "isUserRequestedEraseEnabled")
      && (v7 = -[CSDeviceUnblockPolicyEnvironment isUserFindMyAccountPresent](self, "isUserFindMyAccountPresent"),
          v7 == objc_msgSend(v5, "isUserFindMyAccountPresent"))
      && (v8 = -[CSDeviceUnblockPolicyEnvironment isDeviceInternetConnectionActive](self, "isDeviceInternetConnectionActive"), v8 == objc_msgSend(v5, "isDeviceInternetConnectionActive")))
    {
      v11 = -[CSDeviceUnblockPolicyEnvironment isPasscodeGracePeriodUsable](self, "isPasscodeGracePeriodUsable");
      v9 = v11 ^ objc_msgSend(v5, "isPasscodeGracePeriodUsable") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CSDeviceUnblockPolicyEnvironment description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isUserRequestedEraseEnabled
{
  return self->_isUserRequestedEraseEnabled;
}

- (BOOL)isUserFindMyAccountPresent
{
  return self->_isUserFindMyAccountPresent;
}

- (BOOL)isDeviceInternetConnectionActive
{
  return self->_isDeviceInternetConnectionActive;
}

- (BOOL)isPasscodeGracePeriodUsable
{
  return self->_isPasscodeGracePeriodUsable;
}

@end
