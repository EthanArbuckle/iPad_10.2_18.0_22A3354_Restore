@implementation HFItemUpdateRequest

- (SEL)senderSelector
{
  return self->_senderSelector;
}

- (NSSet)itemsToUpdate
{
  return self->_itemsToUpdate;
}

- (NSSet)itemsProvidersToReload
{
  return self->_itemsProvidersToReload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsProvidersToReload, 0);
  objc_storeStrong((id *)&self->_itemsToUpdate, 0);
}

+ (id)requestToReloadItemProviders:(id)a3 senderSelector:(SEL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithItemProviders:items:senderSelector:", v6, v8, a4);

  return v9;
}

- (HFItemUpdateRequest)initWithItemProviders:(id)a3 items:(id)a4 senderSelector:(SEL)a5
{
  id v9;
  id v10;
  HFItemUpdateRequest *v11;
  HFItemUpdateRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFItemUpdateRequest;
  v11 = -[HFItemUpdateRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemsProvidersToReload, a3);
    objc_storeStrong((id *)&v12->_itemsToUpdate, a4);
    v12->_senderSelector = a5;
  }

  return v12;
}

+ (id)requestToUpdateItems:(id)a3 senderSelector:(SEL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithItemProviders:items:senderSelector:", v8, v6, a4);

  return v9;
}

- (HFItemUpdateRequest)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemProviders_items_senderSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemUpdating.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFItemUpdateRequest init]",
    v5);

  return 0;
}

@end
