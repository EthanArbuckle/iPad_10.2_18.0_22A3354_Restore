@implementation HUCheckmarkIconCollectionListCell

- (UICellAccessory)checkmarkCellAccessory
{
  UICellAccessory *checkmarkCellAccessory;
  HUCheckmarkAccessoryView *v4;
  HUCheckmarkAccessoryView *checkmarkAccessoryView;
  id v6;
  void *v7;
  UICellAccessory *v8;
  UICellAccessory *v9;

  checkmarkCellAccessory = self->_checkmarkCellAccessory;
  if (!checkmarkCellAccessory)
  {
    self->_hidesCheckmark = 0;
    self->_disablesCheckmark = 0;
    v4 = objc_alloc_init(HUCheckmarkAccessoryView);
    checkmarkAccessoryView = self->_checkmarkAccessoryView;
    self->_checkmarkAccessoryView = v4;

    v6 = objc_alloc(MEMORY[0x1E0CEA3E0]);
    -[HUCheckmarkIconCollectionListCell checkmarkAccessoryView](self, "checkmarkAccessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UICellAccessory *)objc_msgSend(v6, "initWithCustomView:placement:", v7, 1);
    v9 = self->_checkmarkCellAccessory;
    self->_checkmarkCellAccessory = v8;

    checkmarkCellAccessory = self->_checkmarkCellAccessory;
  }
  return checkmarkCellAccessory;
}

- (id)_buildAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCheckmarkIconCollectionListCell;
  -[HUIconCollectionListCell _buildAccessories](&v8, sel__buildAccessories);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!-[HUCheckmarkIconCollectionListCell hidesCheckmark](self, "hidesCheckmark"))
  {
    -[HUCheckmarkIconCollectionListCell checkmarkCellAccessory](self, "checkmarkCellAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUCheckmarkIconCollectionListCell;
  -[HUIconCollectionListCell updateUIWithAnimation:](&v15, sel_updateUIWithAnimation_, a3);
  if (!-[HUCheckmarkIconCollectionListCell hidesCheckmark](self, "hidesCheckmark"))
  {
    -[HUIconCollectionListCell item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    -[HUIconCollectionListCell item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = objc_msgSend(v10, "integerValue") == 2;
    else
      v11 = 0;
    -[HUCheckmarkIconCollectionListCell checkmarkAccessoryView](self, "checkmarkAccessoryView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setChecked:", v11);

    if (-[HUCheckmarkIconCollectionListCell disablesCheckmark](self, "disablesCheckmark"))
      v13 = 1;
    else
      v13 = -[HUIconCollectionListCell isDisabled](self, "isDisabled") | v7;
    -[HUCheckmarkIconCollectionListCell checkmarkAccessoryView](self, "checkmarkAccessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDisabled:", v13);

  }
}

- (BOOL)hidesCheckmark
{
  return self->_hidesCheckmark;
}

- (void)setHidesCheckmark:(BOOL)a3
{
  self->_hidesCheckmark = a3;
}

- (BOOL)disablesCheckmark
{
  return self->_disablesCheckmark;
}

- (void)setDisablesCheckmark:(BOOL)a3
{
  self->_disablesCheckmark = a3;
}

- (HUCheckmarkAccessoryView)checkmarkAccessoryView
{
  return self->_checkmarkAccessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkAccessoryView, 0);
  objc_storeStrong((id *)&self->_checkmarkCellAccessory, 0);
}

@end
