@implementation HUQuickControlContext

- (HUQuickControlContext)initWithQuickControlClass:(Class)a3 controlItems:(id)a4 home:(id)a5 itemUpdater:(id)a6
{
  id v11;
  id v12;
  id v13;
  HUQuickControlContext *v14;
  HUQuickControlContext *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUQuickControlContext;
  v14 = -[HUQuickControlContext init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_quickControlClass, a3);
    objc_storeStrong((id *)&v15->_controlItems, a4);
    objc_storeStrong((id *)&v15->_home, a5);
    objc_storeWeak((id *)&v15->_itemUpdater, v13);
  }

  return v15;
}

- (id)affectedCharacteristics
{
  void *v2;
  void *v3;

  -[HUQuickControlContext controlItems](self, "controlItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_276);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __48__HUQuickControlContext_affectedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  objc_msgSend(v2, "characteristicOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E7041C98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HUQuickControlContext_affectedCharacteristics__block_invoke_2;
  v8[3] = &unk_1E6F4C400;
  v9 = v2;
  v5 = v2;
  objc_msgSend(v4, "na_flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __48__HUQuickControlContext_affectedCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCharacteristicsForCharacteristicType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (Class)viewProfileClass
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (-[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class())|| -[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class())|| -[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class()))
  {
LABEL_4:
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return (Class)v3;
  }
  if (!-[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class()))
  {
    if (-[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class()))
    {
      -[HUQuickControlContext controlItems](self, "controlItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:preferredControl:](HUQuickControlUtilities, "shouldDisplayQuickControlAsPushButton:preferredControl:", v16, -[HUQuickControlContext preferredControl](self, "preferredControl"));
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return (Class)v3;
    }
    if (!-[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class())&& !-[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class())&& !-[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class())&& !-[objc_class isEqual:](-[HUQuickControlContext quickControlClass](self, "quickControlClass"), "isEqual:", objc_opt_class()))
    {
      v3 = 0;
      return (Class)v3;
    }
    goto LABEL_4;
  }
  objc_opt_class();
  -[HUQuickControlContext controlItems](self, "controlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "possibleValueSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 == 2)
    {
      +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:preferredControl:](HUQuickControlUtilities, "shouldDisplayQuickControlAsPushButton:preferredControl:", v9, -[HUQuickControlContext preferredControl](self, "preferredControl"));
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "multiStateCharacteristicType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB8AC0]) & 1) == 0)
        objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB8AB8]);
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }

  return (Class)v3;
}

- (Class)quickControlClass
{
  return self->_quickControlClass;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (HMHome)home
{
  return self->_home;
}

- (HUQuickControlItemUpdating)itemUpdater
{
  return (HUQuickControlItemUpdating *)objc_loadWeakRetained((id *)&self->_itemUpdater);
}

- (unint64_t)preferredControl
{
  return self->_preferredControl;
}

- (void)setPreferredControl:(unint64_t)a3
{
  self->_preferredControl = a3;
}

- (unint64_t)controlOrientation
{
  return self->_controlOrientation;
}

- (void)setControlOrientation:(unint64_t)a3
{
  self->_controlOrientation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemUpdater);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_quickControlClass, 0);
}

@end
