@implementation CNLSApplicationWorkspace

- (id)applicationsForUserActivityType:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "launchServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationsForUserActivityType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNLSApplicationWorkspace)init
{
  void *v3;
  CNLSApplicationWorkspace *v4;

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNLSApplicationWorkspace initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v3);

  return v4;
}

- (CNLSApplicationWorkspace)initWithSchedulerProvider:(id)a3
{
  id v5;
  CNLSApplicationWorkspace *v6;
  CNLSApplicationWorkspace *v7;
  CNLSApplicationWorkspace *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNLSApplicationWorkspace;
  v6 = -[CNLSApplicationWorkspace init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_schedulerProvider, a3);
    v8 = v7;
  }

  return v7;
}

void __51__CNLSApplicationWorkspace_inProcessLaunchServices__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D13A90]);
  v1 = (void *)inProcessLaunchServices_cn_once_object_2;
  inProcessLaunchServices_cn_once_object_2 = (uint64_t)v0;

}

+ (id)launchServices
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  if (_CFMZEnabled())
  {
    objc_msgSend(a1, "inProcessLaunchServices");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitlementVerifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D137C8];
    v12 = 0;
    v7 = objc_msgSend(v5, "currentProcessHasBooleanEntitlement:error:", v6, &v12);
    v8 = v12;

    if (v7)
    {
      objc_msgSend(a1, "inProcessLaunchServices");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__CNLSApplicationWorkspace_launchServices__block_invoke;
      v11[3] = &__block_descriptor_40_e5_v8__0l;
      v11[4] = a1;
      if (launchServices_cn_once_token_1 != -1)
        dispatch_once(&launchServices_cn_once_token_1, v11);
      v9 = (id)launchServices_cn_once_object_1;
    }
    v10 = v9;

    return v10;
  }
}

+ (id)inProcessLaunchServices
{
  if (inProcessLaunchServices_cn_once_token_2 != -1)
    dispatch_once(&inProcessLaunchServices_cn_once_token_2, &__block_literal_global_52);
  return (id)inProcessLaunchServices_cn_once_object_2;
}

void __42__CNLSApplicationWorkspace_launchServices__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0D13A90]);
  objc_msgSend(*(id *)(a1 + 32), "remoteAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithAdapter:", v5);
  v4 = (void *)launchServices_cn_once_object_1;
  launchServices_cn_once_object_1 = v3;

}

+ (id)remoteAdapter
{
  if (remoteAdapter_cn_once_token_3 != -1)
    dispatch_once(&remoteAdapter_cn_once_token_3, &__block_literal_global_6_0);
  return (id)remoteAdapter_cn_once_object_3;
}

void __41__CNLSApplicationWorkspace_remoteAdapter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97340]);
  v1 = (void *)remoteAdapter_cn_once_object_3;
  remoteAdapter_cn_once_object_3 = (uint64_t)v0;

}

- (id)observableForApplicationsChangedWithSchedulerProvider:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v4 = (void *)MEMORY[0x1E0CB35B0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observableOnNotificationCenter:withName:object:", v6, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v8 = (void *)MEMORY[0x1E0D13AE8];
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "observableOnNotificationCenter:withName:object:", v9, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merge:schedulerProvider:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)applicationsAvailableForHandlingURLScheme:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "launchServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationsAvailableForHandlingURLScheme:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)applicationForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "launchServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationForBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)openUserActivity:(id)a3 inApplication:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v10 = a4;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__CNLSApplicationWorkspace_openUserActivity_inApplication_options_completionHandler___block_invoke;
  v14[3] = &unk_1EA604DB8;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend(a3, "_createUserActivityDataWithOptions:completionHandler:", a5, v14);

}

void __85__CNLSApplicationWorkspace_openUserActivity_inApplication_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "inProcessLaunchServices");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openUserActivityData:inApplication:completionHandler:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4
{
  -[CNLSApplicationWorkspace openSensitiveURLInBackground:withOptions:completionHandler:](self, "openSensitiveURLInBackground:withOptions:completionHandler:", a3, a4, 0);
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNLSApplicationWorkspace schedulerProvider](self, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__CNLSApplicationWorkspace_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke;
  v16[3] = &unk_1EA604000;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "performBlock:", v16);

}

void __87__CNLSApplicationWorkspace_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "inProcessLaunchServices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURLInBackground:withOptions:completionHandler:", a1[5], a1[6], a1[7]);

}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

@end
