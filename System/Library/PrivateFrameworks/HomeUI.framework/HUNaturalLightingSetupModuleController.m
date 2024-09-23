@implementation HUNaturalLightingSetupModuleController

- (HUNaturalLightingSetupModuleController)initWithModule:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUNaturalLightingSetupModuleController;
  return -[HUItemModuleController initWithModule:](&v4, sel_initWithModule_, a3);
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleSelectedForItem:", v4);

  return 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUNaturalLightingSetupModuleController;
  -[HUItemModuleController setupCell:forItem:](&v8, sel_setupCell_forItem_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "setHideValue:", 1);
    objc_msgSend(v7, "setHideIcon:", 1);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  objc_super v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUNaturalLightingSetupModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v20, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    objc_opt_class();
    objc_msgSend(v9, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CD8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      objc_msgSend(v14, "serviceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitleText:", v15);

    }
    objc_msgSend(v9, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      v19 = 3;
    else
      v19 = 0;
    objc_msgSend(v10, "setAccessoryType:", v19);

  }
}

@end
