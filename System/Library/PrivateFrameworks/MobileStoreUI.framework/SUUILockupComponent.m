@implementation SUUILockupComponent

- (SUUILockupComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUILockupComponent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SUUIItem *item;
  void *v10;
  void *v11;
  SUUIEditorialComponent *v12;
  SUUIEditorialComponent *editorial;
  SUUIEditorialComponent *v14;
  void *v15;
  __int128 v17;
  unint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUILockupComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v19, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("adamId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "itemForItemIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      item = v5->_item;
      v5->_item = (SUUIItem *)v8;

      v5->_itemIdentifier = objc_msgSend(v7, "longLongValue");
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("editorial"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v11, "setComponentDictionary:", v10);
      v12 = -[SUUIEditorialComponent initWithCustomPageContext:]([SUUIEditorialComponent alloc], "initWithCustomPageContext:", v11);
      editorial = v5->_editorial;
      v5->_editorial = v12;

      if (-[SUUIEditorialComponent _usesLockupTitle](v5->_editorial, "_usesLockupTitle"))
      {
        v14 = v5->_editorial;
        -[SUUIItem title](v5->_item, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIEditorialComponent _setTitleText:](v14, "_setTitleText:", v15);

      }
    }
    SUUILockupStyleForDictionary(v6, v4, (uint64_t)&v17);
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v17;
    v5->_lockupStyle.visibleFields = v18;

  }
  return v5;
}

- (SUUILockupComponent)initWithItemIdentifier:(int64_t)a3 style:(SUUILockupStyle *)a4
{
  SUUILockupComponent *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUILockupComponent;
  result = -[SUUILockupComponent init](&v8, sel_init);
  if (result)
  {
    result->_itemIdentifier = a3;
    v7 = *(_OWORD *)&a4->artworkSize;
    result->_lockupStyle.visibleFields = a4->visibleFields;
    *(_OWORD *)&result->_lockupStyle.artworkSize = v7;
  }
  return result;
}

- (SUUILockupComponent)initWithItem:(id)a3 style:(SUUILockupStyle *)a4
{
  id v7;
  SUUILockupComponent *v8;
  unint64_t visibleFields;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUILockupComponent;
  v8 = -[SUUILockupComponent init](&v11, sel_init);
  if (v8)
  {
    v8->_itemIdentifier = objc_msgSend(v7, "itemIdentifier");
    objc_storeStrong((id *)&v8->_item, a3);
    visibleFields = a4->visibleFields;
    *(_OWORD *)&v8->_lockupStyle.artworkSize = *(_OWORD *)&a4->artworkSize;
    v8->_lockupStyle.visibleFields = visibleFields;
  }

  return v8;
}

- (SUUILockupComponent)initWithViewElement:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUILockupComponent;
  return -[SUUIPageComponent initWithViewElement:](&v4, sel_initWithViewElement_, a3);
}

- (int64_t)componentType
{
  return 9;
}

- (BOOL)_needsItemData
{
  void *v2;
  void *v3;
  int v4;

  -[SUUIItem artworksProvider](self->_item, "artworksProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hasArtwork") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (void)_setItem:(id)a3
{
  SUUIItem *v5;
  SUUIItem **p_item;
  _BOOL4 v7;
  SUUIEditorialComponent *editorial;
  void *v9;
  SUUIItem *v10;

  v5 = (SUUIItem *)a3;
  p_item = &self->_item;
  if (self->_item != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    v7 = -[SUUIEditorialComponent _usesLockupTitle](self->_editorial, "_usesLockupTitle");
    v5 = v10;
    if (v7)
    {
      editorial = self->_editorial;
      -[SUUIItem title](*p_item, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIEditorialComponent _setTitleText:](editorial, "_setTitleText:", v9);

      v5 = v10;
    }
  }

}

- (void)_setLockupStyle:(SUUILockupStyle *)a3
{
  unint64_t visibleFields;

  visibleFields = a3->visibleFields;
  *(_OWORD *)&self->_lockupStyle.artworkSize = *(_OWORD *)&a3->artworkSize;
  self->_lockupStyle.visibleFields = visibleFields;
}

- (SUUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SUUIItem)item
{
  return self->_item;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (SUUILockupStyle)lockupStyle
{
  *retstr = self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
}

@end
