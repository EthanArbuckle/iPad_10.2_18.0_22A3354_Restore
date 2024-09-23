@implementation HFAccessoryInvitationServiceItemProvider

- (HFAccessoryInvitationServiceItemProvider)initWithHome:(id)a3 serviceTypes:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_user_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryInvitationServiceItemProvider.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryInvitationServiceItemProvider initWithHome:serviceTypes:]",
    v7);

  return 0;
}

- (HFAccessoryInvitationServiceItemProvider)initWithHome:(id)a3 user:(id)a4
{
  id v7;
  HFAccessoryInvitationServiceItemProvider *v8;
  HFAccessoryInvitationServiceItemProvider *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryInvitationServiceItemProvider;
  v8 = -[HFServiceItemProvider initWithHome:serviceTypes:](&v11, sel_initWithHome_serviceTypes_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_user, a4);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFServiceItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryInvitationServiceItemProvider user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:user:", v5, v6);

  return v7;
}

- (id)filter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryInvitationServiceItemProvider;
  -[HFServiceItemProvider filter](&v18, sel_filter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryInvitationServiceItemProvider user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingAccessoryInvitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_192);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __50__HFAccessoryInvitationServiceItemProvider_filter__block_invoke_2;
  v15 = &unk_1EA73CE18;
  v16 = v6;
  v17 = v3;
  v7 = v6;
  v8 = v3;
  v9 = _Block_copy(&v12);
  v10 = (void *)objc_msgSend(v9, "copy", v12, v13, v14, v15);

  return v10;
}

id __50__HFAccessoryInvitationServiceItemProvider_filter__block_invoke(uint64_t a1, void *a2)
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

uint64_t __50__HFAccessoryInvitationServiceItemProvider_filter__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = *(_QWORD *)(a1 + 40);
  if (v7 && !(*(unsigned int (**)(uint64_t, id))(v7 + 16))(v7, v4))
  {
    v10 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

  }
  return v10;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFAccessoryInvitationServiceItemProvider;
  -[HFServiceItemProvider invalidationReasons](&v5, sel_invalidationReasons);
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
