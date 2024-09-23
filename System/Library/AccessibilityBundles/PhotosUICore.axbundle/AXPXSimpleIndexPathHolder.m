@implementation AXPXSimpleIndexPathHolder

- (AXPXSimpleIndexPathHolder)initWithIndexPath:(PXSimpleIndexPath *)a3
{
  AXPXSimpleIndexPathHolder *v4;
  AXPXSimpleIndexPathHolder *v5;
  __int128 v6;
  _OWORD v8[2];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXPXSimpleIndexPathHolder;
  v4 = -[AXPXSimpleIndexPathHolder init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->item;
    v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v8[1] = v6;
    -[AXPXSimpleIndexPathHolder setIndexPath:](v4, "setIndexPath:", v8);
  }
  return v5;
}

- (PXSimpleIndexPath)indexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self->subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self->section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_indexPath.item = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_indexPath.dataSourceIdentifier = v3;
}

@end
