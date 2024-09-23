@implementation HUHomeTheaterAudioItemModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_super v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUHomeTheaterAudioItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v21, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v9, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitleText:", v14);

  objc_msgSend(v9, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v18, "startAnimating");
    objc_msgSend(v12, "setAccessoryView:", v18);
  }
  else
  {
    objc_msgSend(v12, "setAccessoryView:", 0);
    objc_msgSend(v9, "latestResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "BOOLValue"))
      v20 = 3;
    else
      v20 = 0;
    objc_msgSend(v12, "setAccessoryType:", v20);

  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
    objc_msgSend(v7, "selectItem:", v4);

  return 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setIconDisplayStyle:", 1);
  +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMetrics:", v5);

  objc_msgSend(v4, "setDisableContinuousIconAnimation:", 1);
  objc_msgSend(v4, "setIconForegroundColorFollowsTintColor:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconForegroundColor:", v6);

}

@end
