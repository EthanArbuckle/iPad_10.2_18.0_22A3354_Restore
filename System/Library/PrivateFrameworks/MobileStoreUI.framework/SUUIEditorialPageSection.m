@implementation SUUIEditorialPageSection

- (SUUIEditorialPageSection)initWithPageComponent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIEditorialPageSection;
  return -[SUUIStorePageSection initWithPageComponent:](&v4, sel_initWithPageComponent_, a3);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v6);

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  SUUIEditorialLayout *editorialLayout;
  SUUIColorScheme *colorScheme;
  objc_super v8;

  editorialLayout = self->_editorialLayout;
  self->_editorialLayout = 0;

  colorScheme = self->_colorScheme;
  self->_colorScheme = 0;

  self->_hasValidColorScheme = 0;
  v8.receiver = self;
  v8.super_class = (Class)SUUIEditorialPageSection;
  return -[SUUIStorePageSection applyUpdateType:](&v8, sel_applyUpdateType_, a3);
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x251211FC8, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEditorialPageSection _colorScheme](self, "_colorScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColoringWithColorScheme:", v9);

  objc_msgSend(v8, "resetContentInset");
  if (!-[SUUIStorePageSection isTopSection](self, "isTopSection"))
  {
    objc_msgSend(v8, "contentInset");
    -[SUUIStorePageSection context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "horizontalPadding");
    v12 = v11;

    -[SUUIStorePageSection context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "horizontalPadding");
    v15 = v14;

    objc_msgSend(v8, "setContentInset:", 0.0, v15, 0.0, v12);
  }
  -[SUUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyEditorialLayout:withOrientation:expanded:", v16, 0, self->_isExpanded);

  objc_msgSend(v8, "textBoxView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMoreButtonTitle:", v21);

  if (self->_isExpanded)
  {
    v22 = 0;
  }
  else
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "maximumBodyLines");

  }
  objc_msgSend(v17, "setNumberOfVisibleLines:", v22);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  CGSize result;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  -[SUUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutHeightForOrientation:expanded:", 0, self->_isExpanded);
  v9 = v8;
  objc_msgSend(v7, "bodyTextLayoutForOrientation:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleTextLayoutForOrientation:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
    v9 = v9 + 17.0;

  v13 = v6;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bodyTextLayoutForOrientation:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_isExpanded && objc_msgSend(v7, "requiresTruncation"))
  {
    self->_isExpanded = 1;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadItemsAtIndexPaths:", v9);

  }
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIEditorialPageSection;
  -[SUUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIEditorialPageSection;
  -[SUUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[SUUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v11)
  {
    objc_msgSend(v11, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applyEditorialLayout:withOrientation:expanded:", v10, 0, self->_isExpanded);

    v8 = v11;
  }

}

- (void)willAppearInContext:(id)a3
{
  id v4;
  SUUIColorScheme *colorScheme;
  void *v6;
  void *v7;
  void *v8;
  SUUIEditorialLayout *editorialLayout;
  void *v10;
  SUUIViewElementLayoutContext *v11;
  SUUIViewElementLayoutContext *v12;
  SUUIViewElementLayoutContext *layoutContext;
  objc_super v14;

  v4 = a3;
  colorScheme = self->_colorScheme;
  self->_colorScheme = 0;

  self->_hasValidColorScheme = 0;
  objc_msgSend(v4, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251211FC8);

  objc_msgSend(v4, "textLayoutCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEditorialLayout layoutCache](self->_editorialLayout, "layoutCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    editorialLayout = self->_editorialLayout;
    self->_editorialLayout = 0;

  }
  -[SUUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueLayoutRequests");

  v11 = self->_layoutContext;
  v12 = -[SUUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SUUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v11);
  layoutContext = self->_layoutContext;
  self->_layoutContext = v12;

  v14.receiver = self;
  v14.super_class = (Class)SUUIEditorialPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v14, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SUUIEditorialLayout *editorialLayout;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  editorialLayout = self->_editorialLayout;
  self->_editorialLayout = 0;
  v8 = a4;

  -[SUUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueLayoutRequests");

  v10.receiver = self;
  v10.super_class = (Class)SUUIEditorialPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v10, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (id)_colorScheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUUIColorScheme *v8;
  SUUIColorScheme *colorScheme;
  void *v10;
  SUUIColorScheme *v11;
  SUUIColorScheme *v12;

  if (!self->_hasValidColorScheme)
  {
    self->_hasValidColorScheme = 1;
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIViewElementLayoutContext tintColor](self->_layoutContext, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithStyle(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(SUUIColorScheme);
      colorScheme = self->_colorScheme;
      self->_colorScheme = v8;

      -[SUUIColorScheme setPrimaryTextColor:](self->_colorScheme, "setPrimaryTextColor:", v7);
    }
    else
    {
      -[SUUIStorePageSection context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorScheme");
      v11 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue();
      v12 = self->_colorScheme;
      self->_colorScheme = v11;

    }
  }
  return self->_colorScheme;
}

- (id)_editorialLayout
{
  SUUIEditorialLayout *editorialLayout;
  void *v4;
  SUUIEditorialLayout *v5;
  void *v6;
  void *v7;
  void *v8;
  SUUIEditorialLayout *v9;
  SUUIEditorialLayout *v10;
  SUUIEditorialLayout *v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  editorialLayout = self->_editorialLayout;
  if (!editorialLayout)
  {
    -[SUUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SUUIEditorialLayout alloc];
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLayoutCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUUIEditorialLayout initWithEditorial:layoutCache:](v5, "initWithEditorial:layoutCache:", v6, v8);
    v10 = self->_editorialLayout;
    self->_editorialLayout = v9;

    v11 = self->_editorialLayout;
    objc_msgSend(v4, "activePageWidth");
    v13 = v12;
    -[SUUIStorePageSection context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "horizontalPadding");
    -[SUUIEditorialLayout setLayoutWidth:forOrientation:](v11, "setLayoutWidth:forOrientation:", 0, v13 + v15 * -2.0);

    editorialLayout = self->_editorialLayout;
  }
  return editorialLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_editorialLayout, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end
