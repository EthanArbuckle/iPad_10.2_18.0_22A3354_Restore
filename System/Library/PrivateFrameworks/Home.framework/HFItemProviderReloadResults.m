@implementation HFItemProviderReloadResults

- (HFItemProviderReloadResults)initWithAddedItems:(id)a3 removedItems:(id)a4 existingItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  HFItemProviderReloadResults *v11;
  NSSet *v12;
  NSSet *addedItems;
  NSSet *v14;
  NSSet *removedItems;
  NSSet *v16;
  NSSet *existingItems;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFItemProviderReloadResults;
  v11 = -[HFItemProviderReloadResults init](&v19, sel_init);
  if (v11)
  {
    if (v8)
    {
      v12 = (NSSet *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    addedItems = v11->_addedItems;
    v11->_addedItems = v12;

    if (v9)
    {
      v14 = (NSSet *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    removedItems = v11->_removedItems;
    v11->_removedItems = v14;

    if (v10)
    {
      v16 = (NSSet *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    existingItems = v11->_existingItems;
    v11->_existingItems = v16;

  }
  return v11;
}

- (NSSet)allItems
{
  void *v3;
  void *v4;
  void *v5;

  -[HFItemProviderReloadResults existingItems](self, "existingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults addedItems](self, "addedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSSet)addedItems
{
  return self->_addedItems;
}

- (NSSet)removedItems
{
  return self->_removedItems;
}

- (NSSet)existingItems
{
  return self->_existingItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingItems, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
}

- (void)setAddedItems:(id)a3
{
  objc_storeStrong((id *)&self->_addedItems, a3);
}

- (HFItemProviderReloadResults)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemProvider.m"), 48, CFSTR("HFItemProviderReloadResults should only be instantiated by subclasses of HFItemProvider"));

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFItemProviderReloadResults addedItems](self, "addedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults removedItems](self, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults existingItems](self, "existingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithAddedItems:removedItems:existingItems:", v5, v6, v7);

  return v8;
}

- (id)resultsByMergingWithResults:(id)a3
{
  id v4;
  id v5;
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

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFItemProviderReloadResults addedItems](self, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults removedItems](self, "removedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults existingItems](self, "existingItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v5, "initWithAddedItems:removedItems:existingItems:", v8, v11, v14);

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults addedItems](self, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults removedItems](self, "removedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProviderReloadResults existingItems](self, "existingItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, Added: %@ Removed: %@ Existing:%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setRemovedItems:(id)a3
{
  objc_storeStrong((id *)&self->_removedItems, a3);
}

- (void)setExistingItems:(id)a3
{
  objc_storeStrong((id *)&self->_existingItems, a3);
}

@end
