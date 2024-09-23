@implementation MSStructuredPageTableDataSource

- (BOOL)canShowPreviewForItem:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v7;

  v4 = objc_msgSend(a3, "itemType");
  v5 = (unint64_t)(v4 - 1005) > 6 || ((1 << (v4 + 19)) & 0x4D) == 0;
  if (v5 || objc_msgSend(a3, "itemDisplayType") == 2)
    return 0;
  v7 = (void *)objc_msgSend(a3, "itemMediaKind");
  return objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB2710]) ^ 1;
}

- (BOOL)canDoubleTapIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEC8E28]), "itemList"), "itemAtIndexPath:", a3);
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "defaultStoreOffer"), "offerMedia"), "URL");
  if (v5)
    LOBYTE(v5) = -[MSStructuredPageTableDataSource canShowPreviewForItem:](self, "canShowPreviewForItem:", v4);
  return v5;
}

- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4
{
  objc_class *v5;
  objc_super v7;
  void *v8;

  v7.receiver = self;
  v7.super_class = (Class)MSStructuredPageTableDataSource;
  v8 = 0;
  v5 = -[SUStructuredPageGroupedTableDataSource cellClassForItem:reuseIdentifier:](&v7, sel_cellClassForItem_reuseIdentifier_, a3, &v8);
  if (v5 == (objc_class *)objc_opt_class())
  {
    v5 = (objc_class *)objc_opt_class();
    if (!a4)
      return v5;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = v8;
  return v5;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  void *v7;
  _BOOL8 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSStructuredPageTableDataSource;
  -[SUStructuredPageGroupedTableDataSource configureCell:forIndexPath:](&v9, sel_configureCell_forIndexPath_);
  v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEC8E28]), "itemList"), "itemAtIndexPath:", a4);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "defaultStoreOffer"), "offerMedia"), "URL"))
  {
    v8 = -[MSStructuredPageTableDataSource canShowPreviewForItem:](self, "canShowPreviewForItem:", v7);
    objc_msgSend(a3, "setHighlightsOnlyContentView:", v8);
    if (v8 && objc_msgSend(a3, "accessoryType") == 1)
      objc_msgSend(a3, "setAccessoryType:", 0);
  }
  else
  {
    objc_msgSend(a3, "setHighlightsOnlyContentView:", 0);
  }
}

@end
