@implementation HUQuickControlGroupContext

- (HUQuickControlGroupContext)initWithPrimaryQuickControlContext:(id)a3 alternateQuickControlContexts:(id)a4
{
  id v7;
  id v8;
  HUQuickControlGroupContext *v9;
  HUQuickControlGroupContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlGroupContext;
  v9 = -[HUQuickControlGroupContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primaryQuickControlContext, a3);
    objc_storeStrong((id *)&v10->_alternateQuickControlContexts, a4);
  }

  return v10;
}

- (id)allControlItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HUQuickControlGroupContext primaryQuickControlContext](self, "primaryQuickControlContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithSet:", v5);

  -[HUQuickControlGroupContext alternateQuickControlContexts](self, "alternateQuickControlContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__HUQuickControlGroupContext_allControlItems__block_invoke;
  v10[3] = &unk_1E6F5F2C8;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "na_each:", v10);

  return v8;
}

void __45__HUQuickControlGroupContext_allControlItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "controlItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (HUQuickControlContext)primaryQuickControlContext
{
  return self->_primaryQuickControlContext;
}

- (void)setPrimaryQuickControlContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)alternateQuickControlContexts
{
  return self->_alternateQuickControlContexts;
}

- (void)setAlternateQuickControlContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateQuickControlContexts, 0);
  objc_storeStrong((id *)&self->_primaryQuickControlContext, 0);
}

@end
