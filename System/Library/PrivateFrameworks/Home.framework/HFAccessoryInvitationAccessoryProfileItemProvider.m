@implementation HFAccessoryInvitationAccessoryProfileItemProvider

- (HFAccessoryInvitationAccessoryProfileItemProvider)initWithHome:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_user_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryInvitationAccessoryProfileItemProvider.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryInvitationAccessoryProfileItemProvider initWithHome:]",
    v6);

  return 0;
}

- (HFAccessoryInvitationAccessoryProfileItemProvider)initWithHome:(id)a3 user:(id)a4
{
  id v6;
  id v7;
  HFAccessoryInvitationAccessoryProfileItemProvider *v8;
  HFAccessoryInvitationAccessoryProfileItemProvider *v9;
  void *v10;
  uint64_t v12;
  id v13;
  id location;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFAccessoryInvitationAccessoryProfileItemProvider;
  v8 = -[HFAccessoryProfileItemProvider initWithHome:](&v15, sel_initWithHome_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_user, a4);
    objc_initWeak(&location, v9);
    v12 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v13, &location);
    -[HFAccessoryProfileItemProvider filterOptions](v9, "filterOptions", v12, 3221225472, __71__HFAccessoryInvitationAccessoryProfileItemProvider_initWithHome_user___block_invoke, &unk_1EA7394A0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setByFilter:", &v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v9;
}

uint64_t __71__HFAccessoryInvitationAccessoryProfileItemProvider_initWithHome_user___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingAccessoryInvitations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_157);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "containsObject:", v8);
  return v9;
}

id __71__HFAccessoryInvitationAccessoryProfileItemProvider_initWithHome_user___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFAccessoryProfileItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryInvitationAccessoryProfileItemProvider user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:user:", v5, v6);

  return v7;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFAccessoryInvitationAccessoryProfileItemProvider;
  -[HFAccessoryProfileItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("pendingAccessories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMUser)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
}

@end
