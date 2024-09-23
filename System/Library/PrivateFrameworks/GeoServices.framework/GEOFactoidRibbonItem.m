@implementation GEOFactoidRibbonItem

- (GEOFactoidRibbonItem)initWithFactoidRibbonItem:(id)a3
{
  id v5;
  void *v6;
  GEOFactoidRibbonItem *v7;
  GEOFactoidRibbonItem *v8;
  GEOFactoidRibbonItem *v9;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5 && (*((_BYTE *)v5 + 20) & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOFactoidRibbonItem;
    v8 = -[GEOFactoidRibbonItem init](&v11, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_factoidItem, a3);
    self = v9;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)indexWithinFactoidComponent
{
  GEOPDFactoidRibbonItem *factoidItem;

  factoidItem = self->_factoidItem;
  if (factoidItem)
    return factoidItem->_factoidItemIndex;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoidItem, 0);
}

@end
