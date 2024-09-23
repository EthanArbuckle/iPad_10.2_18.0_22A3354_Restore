@implementation SUUIDynamicGridViewElementPageSection

- (SUUIDynamicGridViewElementPageSection)initWithPageComponent:(id)a3
{
  SUUIDynamicGridViewElementPageSection *v3;
  SUUIMutableIntegerValue *v4;
  SUUIMutableIntegerValue *reusableGlobalIndexIntegerValue;
  SUUIGridViewElementPageSectionConfiguration *v6;
  SUUIGridViewElementPageSectionConfiguration *configuration;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  v3 = -[SUUIStorePageSection initWithPageComponent:](&v9, sel_initWithPageComponent_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIMutableIntegerValue);
    reusableGlobalIndexIntegerValue = v3->_reusableGlobalIndexIntegerValue;
    v3->_reusableGlobalIndexIntegerValue = v4;

    v6 = objc_alloc_init(SUUIGridViewElementPageSectionConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = v6;

    -[SUUIGridViewElementPageSectionConfiguration setDataSource:](v3->_configuration, "setDataSource:", v3);
    -[SUUIDynamicGridViewElementPageSection _reloadViewElementProperties](v3, "_reloadViewElementProperties");
  }
  return v3;
}

- (void)dealloc
{
  unint64_t *sectionHeaderGlobalIndices;
  objc_super v4;

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", 0);
  sectionHeaderGlobalIndices = self->_sectionHeaderGlobalIndices;
  if (sectionHeaderGlobalIndices)
  {
    free(sectionHeaderGlobalIndices);
    self->_sectionHeaderGlobalIndices = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection dealloc](&v4, sel_dealloc);
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  int64_t result;
  int64_t v5;
  _BOOL4 v6;
  int64_t v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  result = -[SUUIStorePageSection applyUpdateType:](&v9, sel_applyUpdateType_, a3);
  if (result != 2)
  {
    v5 = result;
    v6 = -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode");
    v7 = -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities");
    -[SUUIDynamicGridViewElementPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
    -[SUUIDynamicGridViewElementPageSection _invalidateCellSizeCache](self, "_invalidateCellSizeCache");
    if (v6 == -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode")
      || v7 != -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities"))
    {
      v8.receiver = self;
      v8.super_class = (Class)SUUIDynamicGridViewElementPageSection;
      return -[SUUIStorePageSection applyUpdateType:](&v8, sel_applyUpdateType_, v5);
    }
    else
    {
      -[SUUIDynamicGridViewElementPageSection _resetLayoutProperties](self, "_resetLayoutProperties");
      return 1;
    }
  }
  return result;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[SUUIGridViewElementPageSectionConfiguration backgroundColorForViewElement:](self->_configuration, "backgroundColorForViewElement:", v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)SUUIDynamicGridViewElementPageSection;
    -[SUUIStorePageSection backgroundColorForIndexPath:](&v8, sel_backgroundColorForIndexPath_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SUUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](self->_configuration, "requestCellLayoutForViewElement:", v5);
    -[SUUIViewElementLayoutContext labelLayoutCache](self->_cellLayoutContext, "labelLayoutCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commitLayoutRequests");

    -[SUUIGridViewElementPageSectionConfiguration cellForViewElement:indexPath:](self->_configuration, "cellForViewElement:indexPath:", v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_templateViewElementsForType:(id)a3 mode:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *templateViewElementsCache;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    objc_msgSend(a3, "stringByAppendingString:", a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a3;
  }
  v8 = v7;
  -[NSMutableDictionary objectForKey:](self->_templateViewElementsCache, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(-[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement"), "templateDefinitionViewElementsForType:mode:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "contentViewElement");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "children");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "addObject:", v19);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    templateViewElementsCache = self->_templateViewElementsCache;
    if (templateViewElementsCache)
    {
      v21 = (void *)objc_msgSend(v11, "copy");
      -[NSMutableDictionary setObject:forKey:](templateViewElementsCache, "setObject:forKey:", v21, v8);
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDBCED8];
      v21 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v22, "dictionaryWithObject:forKey:", v21, v8);
      v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v24 = self->_templateViewElementsCache;
      self->_templateViewElementsCache = v23;

    }
    v9 = 0;

  }
  return v9;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  double *v4;
  BOOL usesSizingEntityValueProvider;
  _SUUIDynamicGridSizeCacheKey *reusableSizeCacheKey;
  _SUUIDynamicGridSizeCacheKey *v7;
  _SUUIDynamicGridSizeCacheKey *v8;
  double v9;
  double v10;
  uint64_t *v11;
  uint64_t v12;
  __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int *v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  SUUIViewElement *independentlySizedViewElement;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  NSMutableDictionary *sizeCacheKeyToCachedCellSize;
  NSMutableDictionary *v50;
  NSMutableDictionary *v51;
  void *v52;
  double v53;
  double v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  char v59;
  uint64_t v61;
  SUUIViewElement *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;
  CGSize result;

  v70 = *MEMORY[0x24BDAC8D0];
  v56 = objc_msgSend(a3, "item");
  v4 = (double *)MEMORY[0x24BDBF148];
  usesSizingEntityValueProvider = self->_usesSizingEntityValueProvider;
  self->_usesSizingEntityValueProvider = 1;
  reusableSizeCacheKey = self->_reusableSizeCacheKey;
  if (!reusableSizeCacheKey)
  {
    v7 = objc_alloc_init(_SUUIDynamicGridSizeCacheKey);
    v8 = self->_reusableSizeCacheKey;
    self->_reusableSizeCacheKey = v7;

    reusableSizeCacheKey = self->_reusableSizeCacheKey;
  }
  v9 = *v4;
  v10 = v4[1];
  -[_SUUIDynamicGridSizeCacheKey setPosition:](reusableSizeCacheKey, "setPosition:", 0);
  if (-[SUUIGridViewElementPageSectionConfiguration numberOfColumns](self->_configuration, "numberOfColumns") == 1)
  {
    v68 = 0x7FFFFFFFFFFFFFFFLL;
    -[SUUIDynamicGridViewElementPageSection _entityGlobalIndexForGlobalIndex:returningSection:](self, "_entityGlobalIndexForGlobalIndex:returningSection:", v56, &v68);
    v11 = &SUUITemplateDefinitionViewElementTypeSection;
    if (v68 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = &SUUITemplateDefinitionViewElementTypeItem;
    v12 = *v11;
    if (self->_editing)
      v13 = CFSTR("editing");
    else
      v13 = 0;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v14 = -[SUUIDynamicGridViewElementPageSection _templateViewElementsForType:mode:](self, "_templateViewElementsForType:mode:", v12, v13);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v15)
    {
      v16 = v15;
      v55 = usesSizingEntityValueProvider;
      v17 = 0;
      v59 = 1;
      v18 = &OBJC_IVAR___SUUIGallerySwooshViewController__collectionView;
      v19 = *(_QWORD *)v65;
      v20 = v10;
      v21 = v9;
      v57 = *(_QWORD *)v65;
      v58 = v14;
      while (1)
      {
        v22 = 0;
        v61 = v16;
        do
        {
          if (*(_QWORD *)v65 != v19)
            objc_enumerationMutation(v14);
          v23 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v22);
          -[_SUUIDynamicGridSizeCacheKey setViewElement:](self->_reusableSizeCacheKey, "setViewElement:", v23);
          v24 = v18[814];
          v25 = (id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v24), "objectForKey:", self->_reusableSizeCacheKey);
          if (v25)
          {
            objc_msgSend(v25, "CGSizeValue");
            v27 = v26;
            v29 = v28;
            if ((v17 & 1) == 0)
              goto LABEL_24;
          }
          else
          {
            v63 = -[SUUISizingEntityValueProvider initForViewElement:]([SUUISizingEntityValueProvider alloc], "initForViewElement:", v23);
            objc_msgSend(v23, "setEntityValueProvider:");
            independentlySizedViewElement = self->_independentlySizedViewElement;
            v62 = independentlySizedViewElement;
            objc_storeStrong((id *)&self->_independentlySizedViewElement, v23);
            -[SUUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](self->_configuration, "requestCellLayoutForViewElement:", v23);
            -[SUUIViewElementLayoutContext labelLayoutCache](self->_cellLayoutContext, "labelLayoutCache");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "layoutCache");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "commitLayoutRequests");

            -[SUUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](self->_configuration, "cellSizeForViewElement:indexPath:", v23, a3);
            v27 = v34;
            v29 = v35;
            objc_storeStrong((id *)&self->_independentlySizedViewElement, independentlySizedViewElement);
            v36 = *(Class *)((char *)&self->super.super.isa + v24);
            if (!v36)
            {
              v37 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
              v38 = *(Class *)((char *)&self->super.super.isa + v24);
              *(Class *)((char *)&self->super.super.isa + v24) = v37;

              v36 = *(Class *)((char *)&self->super.super.isa + v24);
            }
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v27, v29);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKey:", v39, self->_reusableSizeCacheKey);

            v19 = v57;
            v14 = v58;
            v16 = v61;
            v18 = &OBJC_IVAR___SUUIGallerySwooshViewController__collectionView;
            if ((v17 & 1) == 0)
            {
LABEL_24:
              v20 = v29;
              v21 = v27;
              goto LABEL_25;
            }
          }
          v26 = vabdd_f64(v29, v20);
          if (vabdd_f64(v27, v21) > 0.00000011920929 || v26 > 0.00000011920929)
            v59 = 0;
LABEL_25:
          ++v22;
          v17 = 1;
        }
        while (v16 != v22);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v69, 16, v26);
        if (!v16)
        {

          usesSizingEntityValueProvider = v55;
          if ((v59 & 1) != 0)
            goto LABEL_38;
          goto LABEL_30;
        }
      }
    }

  }
LABEL_30:
  -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", v56);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    -[_SUUIDynamicGridSizeCacheKey setViewElement:](self->_reusableSizeCacheKey, "setViewElement:", v40);
    -[NSMutableDictionary objectForKey:](self->_sizeCacheKeyToCachedCellSize, "objectForKey:", self->_reusableSizeCacheKey);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      objc_msgSend(v41, "CGSizeValue");
      v9 = v43;
      v10 = v44;
    }
    else
    {
      -[SUUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](self->_configuration, "requestCellLayoutForViewElement:", v40);
      -[SUUIViewElementLayoutContext labelLayoutCache](self->_cellLayoutContext, "labelLayoutCache");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "layoutCache");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "commitLayoutRequests");

      -[SUUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](self->_configuration, "cellSizeForViewElement:indexPath:", v40, a3);
      v9 = v47;
      v10 = v48;
      sizeCacheKeyToCachedCellSize = self->_sizeCacheKeyToCachedCellSize;
      if (!sizeCacheKeyToCachedCellSize)
      {
        v50 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
        v51 = self->_sizeCacheKeyToCachedCellSize;
        self->_sizeCacheKeyToCachedCellSize = v50;

        sizeCacheKeyToCachedCellSize = self->_sizeCacheKeyToCachedCellSize;
      }
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v9, v10);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](sizeCacheKeyToCachedCellSize, "setObject:forKey:", v52, self->_reusableSizeCacheKey);

    }
  }

  v20 = v10;
  v21 = v9;
LABEL_38:
  self->_usesSizingEntityValueProvider = usesSizingEntityValueProvider;
  v53 = v21;
  v54 = v20;
  result.height = v54;
  result.width = v53;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[5];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityValueProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE519B0]);
    -[SUUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scriptAppContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithAppContext:", v10);

    if (v11)
    {
      objc_msgSend(v11, "setEntityValueProvider:", v6);
      v15 = CFSTR("entityValueProvider");
      v16[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
      v14[3] = &unk_2511F51C8;
      v14[4] = self;
      objc_msgSend(v5, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, v12, v14);

    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection collectionViewDidSelectItemAtIndexPath:](&v13, sel_collectionViewDidSelectItemAtIndexPath_, v4);

}

void __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_2511F47C0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __80__SUUIDynamicGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (SUUIViewControllerIsVisible(v4))
  {
    objc_msgSend(v4, "transitionCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(*(id *)(a1 + 32), "deselectItemsAnimated:", 1);
  }

}

- (void)collectionViewDidConfirmButtonElement:(id)a3 withClickInfo:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUUIStorePageSection context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_scriptAppContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(v10, "item"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entityValueProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE519B0]), "initWithAppContext:", v13);
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "setEntityValueProvider:", v15);
        v18 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("entityValueProvider"));
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, v19, 0);

      }
    }

  }
  v20.receiver = self;
  v20.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:](&v20, sel_collectionViewDidConfirmButtonElement_withClickInfo_forItemAtIndexPath_, v8, v9, v10);

}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  SUUIGridViewElementPageSectionConfiguration *configuration;
  id v5;
  objc_super v6;

  configuration = self->_configuration;
  v5 = a3;
  -[SUUIGridViewElementPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](configuration, "collectionViewWillApplyLayoutAttributes:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v6, sel_collectionViewWillApplyLayoutAttributes_, v5);

}

- (void)deselectItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "section") == v8)
          objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v14, v3);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v15.receiver = self;
  v15.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection deselectItemsAnimated:](&v15, sel_deselectItemsAnimated_, v3);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  if (self->_entityProvider == a3)
  {
    v10 = v6;
    if ((objc_msgSend(v6, "invalidateEverything") & 1) != 0
      || objc_msgSend(v10, "invalidateDataSourceCounts"))
    {
      -[SUUIDynamicGridViewElementPageSection _reloadEntityProperties](self, "_reloadEntityProperties");
      -[SUUIDynamicGridViewElementPageSection _updateStyleProperties](self, "_updateStyleProperties");
      -[SUUIStorePageSection context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadSections:", v9);

    }
    else
    {
      -[CPLRUDictionary removeAllObjects](self->_globalIndexToTemplateViewElementCache, "removeAllObjects");
      -[SUUIDynamicPageSectionIndexMapper reloadData](self->_dynamicPageSectionIndexMapper, "reloadData");
      -[SUUIDynamicGridViewElementPageSection _reloadVisibleCellsAnimated:](self, "_reloadVisibleCellsAnimated:", 0);
    }
    v6 = v10;
  }

}

- (id)indexPathsForPinningItems
{
  int64_t v3;
  int64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v3 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  if (self->_numberOfSections)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_numberOfSections)
    {
      v6 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", self->_sectionHeaderGlobalIndices[v6], v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

        ++v6;
      }
      while (v6 < self->_numberOfSections);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)invalidateCachedLayoutInformation
{
  objc_super v3;

  -[SUUIDynamicGridViewElementPageSection _invalidateCellSizeCache](self, "_invalidateCellSizeCache");
  v3.receiver = self;
  v3.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection invalidateCachedLayoutInformation](&v3, sel_invalidateCachedLayoutInformation);
}

- (int64_t)numberOfCells
{
  int64_t v3;

  v3 = -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities");
  if (self->_showsSectionHeaders)
    v3 += -[SUUIDynamicPageSectionIndexMapper numberOfSections](self->_dynamicPageSectionIndexMapper, "numberOfSections");
  return v3;
}

- (UIEdgeInsets)pinningContentInsetForItemAtIndexPath:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x24BEBE158];
  v4 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v5 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v6 = *(double *)(MEMORY[0x24BEBE158] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)pinningStyleForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[SUUIDynamicGridViewElementPageSection _entityValueProviderForGlobalIndex:sectionIndex:](self, "_entityValueProviderForGlobalIndex:sectionIndex:", objc_msgSend(a3, "item"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDynamicGridViewElementPageSection _sectionTemplateViewElementForEntityValueProvider:](self, "_sectionTemplateViewElementForEntityValueProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = 1;
    switch(objc_msgSend(v5, "pinStyle"))
    {
      case 1:
        v7 = 0;
        break;
      case 2:
        break;
      case 3:
        v7 = 2;
        break;
      case 4:
        v7 = 3;
        break;
      case 5:
        v7 = 4;
        break;
      default:
        goto LABEL_3;
    }
  }
  else
  {
LABEL_3:
    v7 = -[SUUIStorePageSection defaultItemPinningStyle](self, "defaultItemPinningStyle");
  }

  return v7;
}

- (id)relevantEntityProviders
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection relevantEntityProviders](&v7, sel_relevantEntityProviders);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_entityProvider)
  {
    if (v3)
    {
      objc_msgSend(v3, "setByAddingObject:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(v7, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SUUIGridViewElementPageSectionConfiguration reloadCellWithIndexPath:forViewElement:reason:](self->_configuration, "reloadCellWithIndexPath:forViewElement:reason:", v7, v6, a4);

}

- (void)reloadVisibleCellsWithReason:(int64_t)a3
{
  SUUIViewElementLayoutContext *cellLayoutContext;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection reloadVisibleCellsWithReason:](&v6, sel_reloadVisibleCellsWithReason_, a3);
  cellLayoutContext = self->_cellLayoutContext;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setAggregateValue:forKey:](cellLayoutContext, "setAggregateValue:forKey:", v5, 0x251210448);

}

- (UIEdgeInsets)sectionContentInset
{
  SUUIGridViewElementPageSectionConfiguration *configuration;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
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
  UIEdgeInsets result;

  configuration = self->_configuration;
  v25.receiver = self;
  v25.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection sectionContentInset](&v25, sel_sectionContentInset);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration sectionContentInsetAdjustedFromValue:forGridViewElement:](configuration, "sectionContentInsetAdjustedFromValue:forGridViewElement:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;

  v6 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexBarEntryID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_8;
  if (!self->_showsSectionHeaders)
  {
    if (-[SUUIDynamicPageSectionIndexMapper numberOfSections](self->_dynamicPageSectionIndexMapper, "numberOfSections") > a4)
    {
      v16 = -[SUUIDynamicPageSectionIndexMapper rangeForSectionAtIndex:](self->_dynamicPageSectionIndexMapper, "rangeForSectionAtIndex:", a4);
      v17 = (void *)MEMORY[0x24BDD15D8];
      v18 = -[SUUIDynamicGridViewElementPageSection _globalIndexForEntityGlobalIndex:](self, "_globalIndexForEntityGlobalIndex:", v16);
      v13 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
      v14 = v17;
      v15 = v18;
      goto LABEL_7;
    }
LABEL_8:
    v19 = 0;
    return v19;
  }
  if (self->_numberOfSections <= a4)
    goto LABEL_8;
  v11 = self->_sectionHeaderGlobalIndices[a4];
  v12 = (void *)MEMORY[0x24BDD15D8];
  v13 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  v14 = v12;
  v15 = v11;
LABEL_7:
  objc_msgSend(v14, "indexPathForItem:inSection:", v15, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  return v19;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SUUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "updateWithItemState:context:animated:", v9, self->_cellLayoutContext, v5);
  if (v13)
  {
    -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(v8, "item"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[SUUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](self->_configuration, "requestCellLayoutForViewElement:", v14);

  }
  return v13;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SUUIViewElementTextLayoutCache *v6;
  void *v7;
  SUUIViewElementTextLayoutCache *v8;
  SUUIViewElementTextLayoutCache *labelLayoutCache;
  SUUIViewElementLayoutContext *cellLayoutContext;
  SUUIViewElementLayoutContext *v11;
  SUUIViewElementLayoutContext *v12;
  SUUIViewElementLayoutContext *v13;
  void *v14;
  void *v15;
  SUUIViewElementLayoutContext *v16;
  void *v17;
  SUUIViewElementLayoutContext *v18;
  void *v19;
  SUUIViewElementLayoutContext *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration registerReusableClassesForCollectionView:](self->_configuration, "registerReusableClassesForCollectionView:", v5);
  v6 = [SUUIViewElementTextLayoutCache alloc];
  objc_msgSend(v4, "textLayoutCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIViewElementTextLayoutCache initWithLayoutCache:](v6, "initWithLayoutCache:", v7);
  labelLayoutCache = self->_labelLayoutCache;
  self->_labelLayoutCache = v8;

  cellLayoutContext = self->_cellLayoutContext;
  if (cellLayoutContext)
    -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](cellLayoutContext, "setArtworkRequestDelegate:", 0);
  v11 = -[SUUIViewElementLayoutContext initWithStorePageSectionContext:]([SUUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:", v4);
  v12 = self->_cellLayoutContext;
  self->_cellLayoutContext = v11;

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  v13 = self->_cellLayoutContext;
  objc_msgSend(v4, "parentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setClientContext:](v13, "setClientContext:", v15);

  -[SUUIViewElementLayoutContext setLabelLayoutCache:](self->_cellLayoutContext, "setLabelLayoutCache:", self->_labelLayoutCache);
  -[SUUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", MEMORY[0x24BDBD1C8], 0x251209688);
  -[SUUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", &unk_2512EED48, 0x25120CA28);
  v16 = self->_cellLayoutContext;
  objc_msgSend(v4, "parentViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setParentViewController:](v16, "setParentViewController:", v17);

  v18 = self->_cellLayoutContext;
  objc_msgSend(v4, "resourceLoader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setResourceLoader:](v18, "setResourceLoader:", v19);

  v20 = self->_cellLayoutContext;
  objc_msgSend(v5, "tintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setTintColor:](v20, "setTintColor:", v21);

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "viewElement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", objc_msgSend(v23, "elementType"));
  -[SUUIGridViewElementPageSectionConfiguration setCellLayoutContext:](self->_configuration, "setCellLayoutContext:", self->_cellLayoutContext);
  -[SUUIDynamicGridViewElementPageSection _resetLayoutProperties](self, "_resetLayoutProperties");
  -[SUUIDynamicGridViewElementPageSection _invalidateCellSizeCache](self, "_invalidateCellSizeCache");
  v24.receiver = self;
  v24.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v24, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SUUIViewElementLayoutContext *cellLayoutContext;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  v8 = a4;
  -[SUUIViewElementLayoutContext setActivePageWidth:](cellLayoutContext, "setActivePageWidth:", width);
  -[SUUIDynamicGridViewElementPageSection _resetLayoutProperties](self, "_resetLayoutProperties");
  -[SUUIDynamicGridViewElementPageSection _invalidateCellSizeCache](self, "_invalidateCellSizeCache");
  v9.receiver = self;
  v9.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)_setContext:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicGridViewElementPageSection;
  v4 = a3;
  -[SUUIStorePageSection _setContext:](&v5, sel__setContext_, v4);
  -[SUUIGridViewElementPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__SUUIDynamicGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke;
  v10[3] = &unk_2511F7988;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[SUUIDynamicGridViewElementPageSection _enumerateVisibleCellsUsingBlock:](self, "_enumerateVisibleCellsUsingBlock:", v10);

}

void __69__SUUIDynamicGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_viewElementAtGlobalIndex:", objc_msgSend(a3, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "elementType");
  v7 = (unint64_t)(v6 - 14) > 0x34 || ((1 << (v6 - 14)) & 0x10001C00000001) == 0;
  if (!v7 || v6 == 152)
  {
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_2571AB4A8))
      objc_msgSend(v8, "setImage:forArtworkRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  }

}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[SUUIDynamicGridViewElementPageSection _reloadVisibleCellsAnimated:](self, "_reloadVisibleCellsAnimated:", a4);
  }
}

- (id)gridViewElementPageSectionConfiguration:(id)a3 viewElementForIndexPath:(id)a4
{
  SUUIViewElement *independentlySizedViewElement;
  SUUIViewElement *v5;

  independentlySizedViewElement = self->_independentlySizedViewElement;
  if (independentlySizedViewElement)
  {
    v5 = independentlySizedViewElement;
  }
  else
  {
    -[SUUIDynamicGridViewElementPageSection _viewElementAtGlobalIndex:](self, "_viewElementAtGlobalIndex:", objc_msgSend(a4, "item", a3));
    v5 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)gridViewElementPageSectionConfiguration:(id)a3 configurePosition:(int64_t *)a4 forItemAtIndexPath:(id)a5
{
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_showsSectionHeaders)
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = -[SUUIDynamicGridViewElementPageSection _entityGlobalIndexForGlobalIndex:returningSection:](self, "_entityGlobalIndexForGlobalIndex:returningSection:", objc_msgSend(a5, "item", a3), &v14);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0;
      v13 = 0;
      if (!-[SUUIDynamicPageSectionIndexMapper getItem:section:forGlobalIndex:](self->_dynamicPageSectionIndexMapper, "getItem:section:forGlobalIndex:", &v13, &v12, v7))return;
      if (v13)
      {
        v8 = -[SUUIDynamicPageSectionIndexMapper rangeForSectionAtIndex:](self->_dynamicPageSectionIndexMapper, "rangeForSectionAtIndex:", v12);
        if (v13 != v9 + v8 - 1)
          return;
        v10 = 32;
      }
      else
      {
        v10 = 8;
      }
      v11 = *a4 & 0xFFFFFFFFFFFFFFC7 | v10;
    }
    else
    {
      v11 = *a4 & 0xFFFFFFFFFFFFFFC7 | 0x10;
    }
    *a4 = v11;
  }
}

- (id)_dynamicGridViewElement
{
  void *v2;
  void *v3;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_entityGlobalIndexForGlobalIndex:(int64_t)a3 returningSection:(int64_t *)a4
{
  unint64_t numberOfSections;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;

  if (self->_showsSectionHeaders && (numberOfSections = self->_numberOfSections) != 0)
  {
    v5 = 0;
    v6 = a3 - numberOfSections;
    while (1)
    {
      v7 = self->_sectionHeaderGlobalIndices[v5];
      if (v7 >= a3)
        break;
      if (numberOfSections == ++v5)
      {
        v8 = 0x7FFFFFFFFFFFFFFFLL;
        a3 = v6;
        if (a4)
          goto LABEL_9;
        return a3;
      }
    }
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v7 == a3)
      v8 = v5;
    a3 -= v5;
    if (a4)
      goto LABEL_9;
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
LABEL_9:
      *a4 = v8;
  }
  return a3;
}

- (id)_entityValueProviderForGlobalIndex:(int64_t)a3 sectionIndex:(int64_t *)a4
{
  int64_t v7;
  _SUUIDynamicGridEntityValueProviderValue *v8;
  _SUUIDynamicGridEntityValueProviderValue *v9;
  void *v10;
  int64_t v12;
  void *v13;
  CPLRUDictionary *globalIndexToEntityValueProviderValueCache;
  CPLRUDictionary *v15;
  CPLRUDictionary *v16;
  int64_t v17;

  v7 = -[SUUIMutableIntegerValue integerValue](self->_reusableGlobalIndexIntegerValue, "integerValue");
  -[SUUIMutableIntegerValue setIntegerValue:](self->_reusableGlobalIndexIntegerValue, "setIntegerValue:", a3);
  -[CPLRUDictionary objectForKey:](self->_globalIndexToEntityValueProviderValueCache, "objectForKey:", self->_reusableGlobalIndexIntegerValue);
  v8 = (_SUUIDynamicGridEntityValueProviderValue *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (v8)
  {
    v9 = v8;
    v17 = -[_SUUIDynamicGridEntityValueProviderValue sectionIndex](v8, "sectionIndex");
    -[_SUUIDynamicGridEntityValueProviderValue entityValueProvider](v9, "entityValueProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
LABEL_3:
      *a4 = v17;
  }
  else
  {
    v12 = -[SUUIDynamicGridViewElementPageSection _entityGlobalIndexForGlobalIndex:returningSection:](self, "_entityGlobalIndexForGlobalIndex:returningSection:", a3, &v17);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SUUIDynamicPageSectionIndexMapper entityIndexPathForGlobalIndex:](self->_dynamicPageSectionIndexMapper, "entityIndexPathForGlobalIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[SUUIEntityProviding entityValueProviderAtIndexPath:](self->_entityProvider, "entityValueProviderAtIndexPath:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    else if ((*(_BYTE *)&self->_entityProviderFlags & 1) != 0)
    {
      -[SUUIEntityProviding sectionEntityValueProviderAtIndex:](self->_entityProvider, "sectionEntityValueProviderAtIndex:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v9 = objc_alloc_init(_SUUIDynamicGridEntityValueProviderValue);
    -[_SUUIDynamicGridEntityValueProviderValue setSectionIndex:](v9, "setSectionIndex:", v17);
    -[_SUUIDynamicGridEntityValueProviderValue setEntityValueProvider:](v9, "setEntityValueProvider:", v10);
    globalIndexToEntityValueProviderValueCache = self->_globalIndexToEntityValueProviderValueCache;
    if (!globalIndexToEntityValueProviderValueCache)
    {
      v15 = (CPLRUDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BE04770]), "initWithMaximumCapacity:", 50);
      v16 = self->_globalIndexToEntityValueProviderValueCache;
      self->_globalIndexToEntityValueProviderValueCache = v15;

      globalIndexToEntityValueProviderValueCache = self->_globalIndexToEntityValueProviderValueCache;
    }
    -[CPLRUDictionary setObject:forKey:](globalIndexToEntityValueProviderValueCache, "setObject:forKey:", v9, self->_reusableGlobalIndexIntegerValue);
    if (a4)
      goto LABEL_3;
  }
  -[SUUIMutableIntegerValue setIntegerValue:](self->_reusableGlobalIndexIntegerValue, "setIntegerValue:", v7);

  return v10;
}

- (void)_enumerateVisibleCellsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int64_t v14;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "visibleCells");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__SUUIDynamicGridViewElementPageSection__enumerateVisibleCellsUsingBlock___block_invoke;
  v11[3] = &unk_2511F79B0;
  v13 = v4;
  v14 = v7;
  v12 = v6;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __74__SUUIDynamicGridViewElementPageSection__enumerateVisibleCellsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "section") == *(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (int64_t)_globalIndexForEntityGlobalIndex:(int64_t)a3
{
  unint64_t numberOfSections;
  unint64_t *sectionHeaderGlobalIndices;
  int64_t result;
  int64_t v6;

  if (!self->_showsSectionHeaders)
    return a3;
  numberOfSections = self->_numberOfSections;
  if (!numberOfSections)
    return a3;
  sectionHeaderGlobalIndices = self->_sectionHeaderGlobalIndices;
  result = a3;
  do
  {
    v6 = *sectionHeaderGlobalIndices++;
    if (v6 <= a3)
      ++result;
    --numberOfSections;
  }
  while (numberOfSections);
  return result;
}

- (void)_invalidateCellSizeCache
{
  -[NSMutableDictionary removeAllObjects](self->_sizeCacheKeyToCachedCellSize, "removeAllObjects");
}

- (id)_itemTemplateViewElementForEntityValueProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_editing)
    v7 = CFSTR("editing");
  else
    v7 = 0;
  objc_msgSend(v5, "templateDefinitionViewElementsForType:mode:", 0x251200F08, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestTemplateDefinitionViewElementFromTemplateDefinitionViewElements:entityValueProvider:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "contentViewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_reloadEntityProperties
{
  unint64_t *sectionHeaderGlobalIndices;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[CPLRUDictionary removeAllObjects](self->_globalIndexToEntityValueProviderValueCache, "removeAllObjects");
  -[CPLRUDictionary removeAllObjects](self->_globalIndexToTemplateViewElementCache, "removeAllObjects");
  -[SUUIDynamicPageSectionIndexMapper reloadData](self->_dynamicPageSectionIndexMapper, "reloadData");
  -[SUUIDynamicGridViewElementPageSection _updateShowsSectionHeaders](self, "_updateShowsSectionHeaders");
  sectionHeaderGlobalIndices = self->_sectionHeaderGlobalIndices;
  if (sectionHeaderGlobalIndices)
  {
    free(sectionHeaderGlobalIndices);
    self->_sectionHeaderGlobalIndices = 0;
  }
  if (self->_showsSectionHeaders)
  {
    v4 = -[SUUIDynamicPageSectionIndexMapper numberOfSections](self->_dynamicPageSectionIndexMapper, "numberOfSections");
    self->_sectionHeaderGlobalIndices = (unint64_t *)malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
    if (v4 >= 1)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        self->_sectionHeaderGlobalIndices[v5] = v6;
        -[SUUIDynamicPageSectionIndexMapper rangeForSectionAtIndex:](self->_dynamicPageSectionIndexMapper, "rangeForSectionAtIndex:", v5);
        v6 += v7 + 1;
        ++v5;
      }
      while (v4 != v5);
    }
    self->_numberOfSections = v4;
  }
}

- (void)_reloadViewElementProperties
{
  SUUIEntityProviding *v3;
  SUUIEntityProviding *entityProvider;
  int v5;
  SUUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  SUUIDynamicPageSectionIndexMapper *v7;
  SUUIDynamicPageSectionIndexMapper *v8;
  int64_t v9;
  void *v10;
  id v11;

  -[NSMutableDictionary removeAllObjects](self->_templateViewElementsCache, "removeAllObjects");
  -[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "explicitEntityProvider");
  v3 = (SUUIEntityProviding *)objc_claimAutoreleasedReturnValue();
  entityProvider = self->_entityProvider;
  if (entityProvider == v3 || (-[SUUIEntityProviding isEqual:](entityProvider, "isEqual:", v3) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_entityProvider, v3);
    *(_BYTE *)&self->_entityProviderFlags = *(_BYTE *)&self->_entityProviderFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    if (!dynamicPageSectionIndexMapper)
    {
      v7 = objc_alloc_init(SUUIDynamicPageSectionIndexMapper);
      v8 = self->_dynamicPageSectionIndexMapper;
      self->_dynamicPageSectionIndexMapper = v7;

      dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    }
    -[SUUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicPageSectionIndexMapper, "setEntityProvider:", self->_entityProvider);
    v5 = 1;
  }
  v9 = objc_msgSend(v11, "minimumEntityCountForSections");
  if (self->_minimumEntityCountForSections == v9)
  {
    -[SUUIGridViewElementPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", objc_msgSend(v11, "rendersWithPerspective"));
    if (!v5)
      goto LABEL_12;
  }
  else
  {
    self->_minimumEntityCountForSections = v9;
    -[SUUIGridViewElementPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", objc_msgSend(v11, "rendersWithPerspective"));
  }
  -[SUUIDynamicGridViewElementPageSection _reloadEntityProperties](self, "_reloadEntityProperties");
LABEL_12:
  -[SUUIDynamicGridViewElementPageSection _updateStyleProperties](self, "_updateStyleProperties");
  objc_msgSend(v11, "collectionFeature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCollectionTarget:", self);

}

- (void)_reloadVisibleCellsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[SUUIViewElementLayoutContext labelLayoutCache](self->_cellLayoutContext, "labelLayoutCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__SUUIDynamicGridViewElementPageSection__reloadVisibleCellsAnimated___block_invoke;
  v7[3] = &unk_2511FC2E8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[SUUIDynamicGridViewElementPageSection _enumerateVisibleCellsUsingBlock:](self, "_enumerateVisibleCellsUsingBlock:", v7);

}

void __69__SUUIDynamicGridViewElementPageSection__reloadVisibleCellsAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "conformsToProtocol:", &unk_2571AB4A8))
  {
    objc_msgSend(*(id *)(a1 + 32), "_viewElementAtGlobalIndex:", objc_msgSend(v5, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "requestCellLayoutForViewElement:", v6);
      objc_msgSend(*(id *)(a1 + 40), "commitLayoutRequests");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "configureCell:forViewElement:indexPath:", v7, v6, v5);
    }

  }
}

- (void)_resetLayoutProperties
{
  SUUIGridViewElementPageSectionConfiguration *configuration;
  void *v3;
  id v4;

  configuration = self->_configuration;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:](configuration, "updateLayoutPropertiesForGridViewElement:", v3);

}

- (id)_sectionTemplateViewElementForEntityValueProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_editing)
    v7 = CFSTR("editing");
  else
    v7 = 0;
  objc_msgSend(v5, "templateDefinitionViewElementsForType:mode:", 0x251204888, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestTemplateDefinitionViewElementFromTemplateDefinitionViewElements:entityValueProvider:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "contentViewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_updateShowsSectionHeaders
{
  void *v3;
  int v4;
  int showsSectionHeaders;

  -[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSectionHeaders"))
    v4 = -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities") >= self->_minimumEntityCountForSections;
  else
    v4 = 0;

  showsSectionHeaders = self->_showsSectionHeaders;
  if (showsSectionHeaders != v4)
    self->_showsSectionHeaders = v4;
  return showsSectionHeaders != v4;
}

- (void)_updateStyleProperties
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SUUIDynamicGridViewElementPageSection _dynamicGridViewElement](self, "_dynamicGridViewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_editing)
    v5 = CFSTR("editing");
  else
    v5 = 0;
  objc_msgSend(v3, "templateDefinitionViewElementsForType:mode:", 0x251200F08, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "contentViewElement");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "children");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          if (!v9)
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
          objc_msgSend(v9, "addObjectsFromArray:", v13);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  -[SUUIGridViewElementPageSectionConfiguration updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:](self->_configuration, "updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:", v4, v9, -[SUUIDynamicGridViewElementPageSection numberOfCells](self, "numberOfCells"));

}

- (id)_viewElementAtGlobalIndex:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  CPLRUDictionary *globalIndexToTemplateViewElementCache;
  CPLRUDictionary *v9;
  CPLRUDictionary *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;

  v5 = -[SUUIMutableIntegerValue integerValue](self->_reusableGlobalIndexIntegerValue, "integerValue");
  -[SUUIMutableIntegerValue setIntegerValue:](self->_reusableGlobalIndexIntegerValue, "setIntegerValue:", a3);
  -[CPLRUDictionary objectForKey:](self->_globalIndexToTemplateViewElementCache, "objectForKey:", self->_reusableGlobalIndexIntegerValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  -[SUUIDynamicGridViewElementPageSection _entityValueProviderForGlobalIndex:sectionIndex:](self, "_entityValueProviderForGlobalIndex:sectionIndex:", a3, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (!self->_usesSizingEntityValueProvider)
      goto LABEL_13;
LABEL_11:
    v11 = -[SUUISizingEntityValueProvider initForViewElement:]([SUUISizingEntityValueProvider alloc], "initForViewElement:", v6);
    objc_msgSend(v6, "setEntityValueProvider:", v11);

    goto LABEL_14;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    -[SUUIDynamicGridViewElementPageSection _itemTemplateViewElementForEntityValueProvider:](self, "_itemTemplateViewElementForEntityValueProvider:", v7);
  else
    -[SUUIDynamicGridViewElementPageSection _sectionTemplateViewElementForEntityValueProvider:](self, "_sectionTemplateViewElementForEntityValueProvider:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    globalIndexToTemplateViewElementCache = self->_globalIndexToTemplateViewElementCache;
    if (!globalIndexToTemplateViewElementCache)
    {
      v9 = (CPLRUDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BE04770]), "initWithMaximumCapacity:", 50);
      v10 = self->_globalIndexToTemplateViewElementCache;
      self->_globalIndexToTemplateViewElementCache = v9;

      globalIndexToTemplateViewElementCache = self->_globalIndexToTemplateViewElementCache;
    }
    -[CPLRUDictionary setObject:forKey:](globalIndexToTemplateViewElementCache, "setObject:forKey:", v6, self->_reusableGlobalIndexIntegerValue);
    if (!self->_usesSizingEntityValueProvider)
    {
      objc_msgSend(v6, "entityValueProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v7, "valuesForEntityProperties:", v12);

LABEL_13:
      objc_msgSend(v6, "setEntityValueProvider:", v7);
      goto LABEL_14;
    }
    goto LABEL_11;
  }
LABEL_14:
  -[SUUIMutableIntegerValue setIntegerValue:](self->_reusableGlobalIndexIntegerValue, "setIntegerValue:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateViewElementsCache, 0);
  objc_storeStrong((id *)&self->_sizeCacheKeyToCachedCellSize, 0);
  objc_storeStrong((id *)&self->_reusableGlobalIndexIntegerValue, 0);
  objc_storeStrong((id *)&self->_reusableSizeCacheKey, 0);
  objc_storeStrong((id *)&self->_labelLayoutCache, 0);
  objc_storeStrong((id *)&self->_independentlySizedViewElement, 0);
  objc_storeStrong((id *)&self->_globalIndexToTemplateViewElementCache, 0);
  objc_storeStrong((id *)&self->_globalIndexToEntityValueProviderValueCache, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end
