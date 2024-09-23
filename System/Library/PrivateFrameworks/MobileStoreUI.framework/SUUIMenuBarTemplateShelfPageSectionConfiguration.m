@implementation SUUIMenuBarTemplateShelfPageSectionConfiguration

- (SUUIMenuBarTemplateShelfPageSectionConfiguration)init
{
  return -[SUUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:](self, "initWithNumberOfIterations:", 1);
}

- (SUUIMenuBarTemplateShelfPageSectionConfiguration)initWithNumberOfIterations:(unint64_t)a3
{
  SUUIMenuBarTemplateShelfPageSectionConfiguration *result;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  result = -[SUUIMenuBarTemplateShelfPageSectionConfiguration init](&v6, sel_init);
  if (result)
  {
    if (a3 <= 1)
      v5 = 1;
    else
      v5 = a3;
    result->_numberOfIterations = v5;
  }
  return result;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];
  uint64_t v11;

  v5 = a3;
  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(v5, (uint64_t)v10);
  if (!LOBYTE(v10[0]))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIMenuBarTemplateShelfPageSectionConfiguration.m"), 44, CFSTR("All shelf items vended by the shelf page section need to be valid."));

  }
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (int64_t)numberOfSectionCells
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  return -[SUUIShelfPageSectionConfiguration numberOfSectionCells](&v3, sel_numberOfSectionCells) + 1;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id fixedElementsCollectionViewCell;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "item") + 1;
  if (v8 == -[SUUIMenuBarTemplateShelfPageSectionConfiguration numberOfSectionCells](self, "numberOfSectionCells"))
  {
    -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x25120CAC8, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activePageWidth");
    v15 = v14;
    -[SUUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadWithViewElement:width:context:", v12, v16, v15);

    fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
    self->_fixedElementsCollectionViewCell = v11;

    v18 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
    -[SUUIShelfPageSectionConfiguration cellForShelfViewElement:indexPath:](&v20, sel_cellForShelfViewElement_indexPath_, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "item") + 1;
  if (v10 == -[SUUIMenuBarTemplateShelfPageSectionConfiguration numberOfSectionCells](self, "numberOfSectionCells"))
  {
    -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activePageWidth");
    v13 = v12;

    -[SUUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell sizeThatFitsWidth:viewElement:context:](SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", v14, v15, v13);
    v17 = v16;

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
    -[SUUIShelfPageSectionConfiguration cellSizeForShelfViewElement:indexPath:numberOfShelfItems:](&v25, sel_cellSizeForShelfViewElement_indexPath_numberOfShelfItems_, v8, v9, a5);
    v13 = v18;
    v17 = v19;
    if (-[SUUIShelfPageSectionConfiguration wantsZoomingShelfLayout](self, "wantsZoomingShelfLayout"))
    {
      -[SUUIShelfPageSectionConfiguration zoomingShelfLayoutScaledItemWidth](self, "zoomingShelfLayoutScaledItemWidth");
      v21 = v20;
      -[SUUIShelfPageSectionConfiguration zoomingShelfLayoutItemWidth](self, "zoomingShelfLayoutItemWidth");
      v17 = v17 - (v21 - v22);
    }
  }

  v23 = v13;
  v24 = v17;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  -[SUUIShelfPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](&v8, sel_collectionViewWillApplyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "item") + 1;
  v7 = -[SUUIMenuBarTemplateShelfPageSectionConfiguration numberOfSectionCells](self, "numberOfSectionCells");

  if (v6 == v7)
    objc_msgSend(v4, "setZIndex:", 1);

}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  v3 = a3;
  -[SUUIShelfPageSectionConfiguration registerReusableClassesForCollectionView:](&v4, sel_registerReusableClassesForCollectionView_, v3);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120CAC8, v4.receiver, v4.super_class);

}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  -[SUUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:](&v16, sel_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems_, a3, a4, a5, a6);
  if (v6)
  {
    -[SUUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activePageWidth");
    v11 = v10;
    -[SUUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:width:context:](SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell, "requestLayoutForViewElement:width:context:", v8, v12, v11);

    -[SUUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "labelLayoutCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "commitLayoutRequests");

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t focusedIndex;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id fixedElementsCollectionViewCell;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIMenuBarTemplateShelfPageSectionConfiguration;
  -[SUUIShelfPageSectionConfiguration scrollViewDidScroll:](&v22, sel_scrollViewDidScroll_, v4);
  if (-[SUUIShelfPageSectionConfiguration wantsZoomingShelfLayout](self, "wantsZoomingShelfLayout"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "collectionViewLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "menuBarFocusedItemIndexPathWithTransitionProgress:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        focusedIndex = self->_focusedIndex;
        if (focusedIndex != objc_msgSend(v6, "item"))
        {
          self->_focusedIndex = objc_msgSend(v6, "item");
          -[SUUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "activePageWidth");
          v11 = v10;
          -[SUUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell requestLayoutForViewElement:width:context:](SUUIMenuBarTemplateShelfFixedElementsCollectionViewCell, "requestLayoutForViewElement:width:context:", v8, v12, v11);

          -[SUUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "labelLayoutCache");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "layoutCache");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "commitLayoutRequests");

          fixedElementsCollectionViewCell = self->_fixedElementsCollectionViewCell;
          -[SUUIMenuBarTemplateShelfPageSectionConfiguration _focusedViewElement](self, "_focusedViewElement");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "activePageWidth");
          v20 = v19;
          -[SUUIShelfPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(fixedElementsCollectionViewCell, "reloadWithViewElement:width:context:", v17, v21, v20);

        }
      }

    }
  }

}

- (id)_focusedViewElement
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[SUUIShelfPageSectionConfiguration dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shelfPageSectionConfiguration:viewElementAtIndex:", self, self->_focusedIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = 0;
  v12 = 0;
  SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(v5, (uint64_t)&v10);
  if (!(_BYTE)v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIMenuBarTemplateShelfPageSectionConfiguration.m"), 133, CFSTR("All shelf items vended by the shelf page section need to be valid."));

  }
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fixedElementsCollectionViewCell, 0);
}

@end
