@implementation HFStaticItemProvider

- (id)items
{
  if (-[HFStaticItemProvider hasProvidedItems](self, "hasProvidedItems"))
    -[HFStaticItemProvider staticItems](self, "staticItems");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasProvidedItems
{
  return self->_hasProvidedItems;
}

- (NSSet)staticItems
{
  return self->_staticItems;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  HFItemProviderReloadResults *v5;
  void *v6;

  if (-[HFStaticItemProvider hasProvidedItems](self, "hasProvidedItems"))
  {
    v3 = 0;
  }
  else
  {
    -[HFStaticItemProvider staticItems](self, "staticItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[HFStaticItemProvider hasProvidedItems](self, "hasProvidedItems"))
  {
    -[HFStaticItemProvider staticItems](self, "staticItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[HFStaticItemProvider setHasProvidedItems:](self, "setHasProvidedItems:", 1);
  v5 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", v3, 0, v4);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHasProvidedItems:(BOOL)a3
{
  self->_hasProvidedItems = a3;
}

- (HFStaticItemProvider)initWithItems:(id)a3
{
  id v4;
  HFStaticItemProvider *v5;
  HFStaticItemProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFStaticItemProvider;
  v5 = -[HFItemProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HFStaticItemProvider setStaticItems:](v5, "setStaticItems:", v4);

  return v6;
}

- (void)setStaticItems:(id)a3
{
  objc_storeStrong((id *)&self->_staticItems, a3);
}

- (HFStaticItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItems_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFStaticItemProvider.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFStaticItemProvider init]",
    v5);

  return 0;
}

- (HFStaticItemProvider)initWithHome:(id)a3 items:(id)a4
{
  return -[HFStaticItemProvider initWithItems:](self, "initWithItems:", a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFStaticItemProvider items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithItems:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItems, 0);
}

@end
