@implementation HUCameraUsageOptionItemProvider

- (HUCameraUsageOptionItemProvider)initWithPresenceEventType:(unint64_t)a3 cameraProfiles:(id)a4
{
  id v6;
  HUCameraUsageOptionItemProvider *v7;
  HUCameraUsageOptionItemProvider *v8;
  uint64_t v9;
  NSSet *cameraProfiles;
  uint64_t v11;
  NSMutableSet *items;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraUsageOptionItemProvider;
  v7 = -[HFItemProvider init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_presenceEventType = a3;
    v9 = objc_msgSend(v6, "copy");
    cameraProfiles = v8->_cameraProfiles;
    v8->_cameraProfiles = (NSSet *)v9;

    v11 = objc_opt_new();
    items = v8->_items;
    v8->_items = (NSMutableSet *)v11;

  }
  return v8;
}

- (HUCameraUsageOptionItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPresenceEventType_cameraProfiles_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraUsageOptionItemProvider.m"), 101, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraUsageOptionItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_1E6F4EC68;
  objc_copyWeak(&v10, &location);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", &unk_1E7042DB0, &__block_literal_global_259, &__block_literal_global_67_2, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_5;
  v7[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v5;
}

id __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "usage"));
}

HUCameraUsageOptionItem *__46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HUCameraUsageOptionItem *v7;
  HUCameraUsageOptionItem *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_4;
  v13[3] = &unk_1E6F4DAD8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
  v7 = (HUCameraUsageOptionItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HUCameraUsageOptionItem alloc];
    v9 = objc_msgSend(WeakRetained, "presenceEventType");
    v10 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(WeakRetained, "cameraProfiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUCameraUsageOptionItem initWithPresence:cameraUsage:cameraProfiles:](v8, "initWithPresence:cameraUsage:cameraProfiles:", v9, v10, v11);

  }
  return v7;
}

BOOL __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = objc_msgSend(v6, "usage");
    v8 = v7 == objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUCameraUsageOptionItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (unint64_t)presenceEventType
{
  return self->_presenceEventType;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
