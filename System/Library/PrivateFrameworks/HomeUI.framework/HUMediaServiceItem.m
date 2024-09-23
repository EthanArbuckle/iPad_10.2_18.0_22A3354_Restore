@implementation HUMediaServiceItem

- (HUMediaServiceItem)initWithMediaService:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUMediaServiceItem *v9;
  HUMediaServiceItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMediaServiceItem;
  v9 = -[HUMediaServiceItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaService, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (HUMediaServiceItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaService_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaServiceItem.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUMediaServiceItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];

  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaServicesForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__HUMediaServiceItem__subclass_updateWithOptions___block_invoke;
  v23[3] = &unk_1E6F555A8;
  v23[4] = self;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[HUMediaServiceItem setMediaService:](self, "setMediaService:", v7);
  v8 = (void *)objc_opt_new();
  -[HUMediaServiceItem mediaService](self, "mediaService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v8, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceItem home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultMediaServiceForHome:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[HUMediaServiceItem mediaService](self, "mediaService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithBool:", objc_msgSend(v17, "isEqualToString:", v18));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeSetObject:forKey:", v19, *MEMORY[0x1E0D30DA0]);

  objc_msgSend(v8, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31578]), "initWithResults:", v8);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __50__HUMediaServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mediaService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUMediaServiceItem mediaService](self, "mediaService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMediaService:home:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (MediaService)mediaService
{
  return self->_mediaService;
}

- (void)setMediaService:(id)a3
{
  objc_storeStrong((id *)&self->_mediaService, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_mediaService, 0);
}

@end
