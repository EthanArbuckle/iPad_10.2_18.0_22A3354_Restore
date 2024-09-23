@implementation CNLaunchServicesLocalAdapter

- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = a3;
  -[CNLaunchServicesLocalAdapter workspace](self, "workspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationsForUserActivityType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_cn_map:", &__block_literal_global_81);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v11))
    v10 = (id)MEMORY[0x1E0C9AA60];
  else
    v10 = v11;
  v6[2](v6, v10, 0);

}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (CNLaunchServicesLocalAdapter)initWithApplicationWorkspace:(id)a3
{
  id v5;
  CNLaunchServicesLocalAdapter *v6;
  CNLaunchServicesLocalAdapter *v7;
  CNLaunchServicesLocalAdapter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNLaunchServicesLocalAdapter;
  v6 = -[CNLaunchServicesLocalAdapter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspace, a3);
    v8 = v7;
  }

  return v7;
}

- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4
{
  objc_class *v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = a3;
  v14 = objc_alloc_init(v6);
  objc_msgSend(v14, "setScheme:", v8);

  -[CNLaunchServicesLocalAdapter workspace](self, "workspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationsAvailableForOpeningURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_map:", &__block_literal_global_81);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v12))
    v13 = (void *)MEMORY[0x1E0C9AA60];
  else
    v13 = v12;
  v7[2](v7, v13, 0);

}

- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4
{
  void (**v5)(id, id, _QWORD);
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = (void (**)(id, id, _QWORD))a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "lsApplicationWorkspaceForBundleId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CNApplicationProxyFromLSApplicationProxy_block_invoke(v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v9, 0);
}

- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CA5920];
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "_initWithUserActivityData:", v10);

  objc_msgSend(v16, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_opt_class();
    objc_msgSend(v16, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lsApplicationWorkspaceForBundleId:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CNLaunchServicesLocalAdapter workspace](self, "workspace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "openUserActivity:withApplicationProxy:completionHandler:", v11, v12, v9);

}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5
{
  void (**v8)(id, uint64_t, id);
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v8 = (void (**)(id, uint64_t, id))a5;
  v9 = a4;
  v10 = a3;
  -[CNLaunchServicesLocalAdapter workspace](self, "workspace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "openSensitiveURL:withOptions:error:", v10, v9, &v14);

  v13 = v14;
  v8[2](v8, v12, v13);

}

+ (id)lsApplicationWorkspaceForBundleId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a3);
}

- (void)setWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_workspace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
}

@end
