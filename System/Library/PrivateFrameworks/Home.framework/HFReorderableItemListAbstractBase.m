@implementation HFReorderableItemListAbstractBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_destroyWeak((id *)&self->_applicationDataContainer);
}

- (HFReorderableItemListAbstractBase)initWithApplicationDataContainer:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  HFReorderableItemListAbstractBase *v9;
  void *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFReorderableItemListAbstractBase;
  v9 = -[HFReorderableItemListAbstractBase init](&v13, sel_init);
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("HFReorderableHomeKitItemList.m"), 58, CFSTR("Do not try to use HFReorderableItemListAbstractBase without subclassing."));

    }
    objc_storeWeak((id *)&v9->_applicationDataContainer, v7);
    objc_storeStrong((id *)&v9->_category, a4);
  }

  return v9;
}

- (HMApplicationData)applicationDataContainer
{
  return (HMApplicationData *)objc_loadWeakRetained((id *)&self->_applicationDataContainer);
}

- (NSString)category
{
  return self->_category;
}

- (HFReorderableItemListAbstractBase)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithApplicationDataContainer_category_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFReorderableHomeKitItemList.m"), 48, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFReorderableItemListAbstractBase init]",
    v5);

  return 0;
}

- (BOOL)isEmpty
{
  void *v4;
  void *v6;

  v4 = (void *)objc_opt_class();
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFReorderableHomeKitItemList.m"), 68, CFSTR("Do not try to use HFReorderableItemListAbstractBase without subclassing."));

  }
  return 0;
}

- (void)setSortedItems:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFReorderableHomeKitItemList.m"), 74, CFSTR("Do not try to use HFReorderableItemListAbstractBase without subclassing."));

  }
}

- (id)saveWithSender:(id)a3
{
  void *v5;
  void *v7;

  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFReorderableHomeKitItemList.m"), 79, CFSTR("Do not try to use HFReorderableItemListAbstractBase without subclassing."));

  }
  return 0;
}

@end
