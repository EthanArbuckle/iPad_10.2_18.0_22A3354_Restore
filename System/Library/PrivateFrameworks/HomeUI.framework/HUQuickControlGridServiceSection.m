@implementation HUQuickControlGridServiceSection

- (HUQuickControlGridServiceSection)init
{
  HUQuickControlGridServiceSection *v2;
  uint64_t v3;
  NSMutableArray *gridControlItems;
  uint64_t v5;
  NSMutableArray *supplementaryControlItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlGridServiceSection;
  v2 = -[HUQuickControlGridServiceSection init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    gridControlItems = v2->_gridControlItems;
    v2->_gridControlItems = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    supplementaryControlItems = v2->_supplementaryControlItems;
    v2->_supplementaryControlItems = (NSMutableArray *)v5;

  }
  return v2;
}

- (HFServiceItem)serviceItem
{
  return self->_serviceItem;
}

- (void)setServiceItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItem, a3);
}

- (NSMutableArray)gridControlItems
{
  return self->_gridControlItems;
}

- (void)setGridControlItems:(id)a3
{
  objc_storeStrong((id *)&self->_gridControlItems, a3);
}

- (NSMutableArray)supplementaryControlItems
{
  return self->_supplementaryControlItems;
}

- (void)setSupplementaryControlItems:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryControlItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryControlItems, 0);
  objc_storeStrong((id *)&self->_gridControlItems, 0);
  objc_storeStrong((id *)&self->_serviceItem, 0);
}

@end
