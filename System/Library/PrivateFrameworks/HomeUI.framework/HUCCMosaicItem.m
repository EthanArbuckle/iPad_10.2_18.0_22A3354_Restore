@implementation HUCCMosaicItem

- (HUCCMosaicItem)initWithBaseItem:(id)a3
{
  id v4;
  HUCCMosaicItem *v5;
  HUCCMosaicItem *v6;
  void *v7;
  char isKindOfClass;
  HUCCMosaicItem *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUCCMosaicItem;
  v5 = -[HUCCMosaicItem init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HUCCMosaicItem setBaseItem:](v5, "setBaseItem:", v4);
    -[HUCCMosaicItem baseItem](v6, "baseItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v9 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      -[HUCCMosaicItem baseItem](v6, "baseItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();

      v9 = v6;
      if ((v12 & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        -[HUCCMosaicItem baseItem](v6, "baseItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EF2AC470);

        v9 = v6;
        if (v14)
        {
          v10 = 2;
        }
        else
        {
          -[HUCCMosaicItem baseItem](v6, "baseItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v16 = objc_opt_isKindOfClass();

          v9 = v6;
          if ((v16 & 1) == 0)
          {
            -[HUCCMosaicItem baseItem](v6, "baseItem");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("Unknown mosaic base item type %@"), v18);

            goto LABEL_11;
          }
          v10 = 3;
        }
      }
    }
    -[HUCCMosaicItem setItemType:](v9, "setItemType:", v10);
  }
LABEL_11:

  return v6;
}

- (HUCCMosaicItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCCMosaicItem.m"), 44, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCCMosaicItem init]",
    v5);

  return 0;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (double)itemPriority
{
  return self->_itemPriority;
}

- (void)setItemPriority:(double)a3
{
  self->_itemPriority = a3;
}

- (HFHomeKitItemProtocol)baseItem
{
  return self->_baseItem;
}

- (void)setBaseItem:(id)a3
{
  objc_storeStrong((id *)&self->_baseItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseItem, 0);
}

@end
