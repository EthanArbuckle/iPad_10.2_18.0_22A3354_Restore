@implementation FBSLazyApplicationInfoProvider

- (FBSLazyApplicationInfoProvider)init
{
  FBSLazyApplicationInfoProvider *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBSLazyApplicationInfoProvider;
  v2 = -[FBSLazyApplicationInfoProvider init](&v4, sel_init);
  if (v2)
    v2->_applicationInfoSubclass = (Class)objc_opt_class();
  return v2;
}

- (id)applicationInfoForBundleIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "appState"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isValid"),
        v7,
        v6,
        v8))
  {
    objc_msgSend(v4, "fbs_correspondingApplicationRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "fbs_processIdentityForApplicationIdentity:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = 0;
    if (v9 && v11 && v12)
      v14 = (void *)objc_msgSend(objc_alloc(self->_applicationInfoSubclass), "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v4, v9, v11, v12, 0);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)applicationInfoForAuditToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _OWORD v23[2];

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CA5890];
  if (v4)
    objc_msgSend(v4, "realToken");
  else
    memset(v23, 0, sizeof(v23));
  objc_msgSend(v6, "bundleProxyWithAuditToken:error:", v23, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CA5860];
    objc_msgSend(v7, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationProxyForBundleURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bundleURL");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12
      && (v13 = (void *)v12,
          objc_msgSend(v11, "appState"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isValid"),
          v14,
          v13,
          v15))
    {
      objc_msgSend(v11, "fbs_correspondingApplicationRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identities");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "fbs_processIdentityForApplicationIdentity:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = 0;
      if (v16 && v18 && v19)
        v21 = (void *)objc_msgSend(objc_alloc(self->_applicationInfoSubclass), "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v11, v16, v18, v19, 0);

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (Class)applicationInfoSubclass
{
  return self->_applicationInfoSubclass;
}

- (void)setApplicationInfoSubclass:(Class)a3
{
  self->_applicationInfoSubclass = a3;
}

@end
