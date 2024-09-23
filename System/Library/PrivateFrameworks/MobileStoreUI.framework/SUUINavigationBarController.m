@implementation SUUINavigationBarController

- (SUUINavigationBarController)initWithNavigationBarViewElement:(id)a3
{
  id v5;
  SUUINavigationBarController *v6;
  NSMutableArray *v7;
  NSMutableArray *sections;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUINavigationBarController;
  v6 = -[SUUINavigationBarController init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sections = v6->_sections;
    v6->_sections = v7;

    objc_storeStrong((id *)&v6->_viewElement, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__viewElementEventNotification_, 0x251204068, 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x251204068, 0);
  -[SUUINavigationBarButtonsController disconnectAllButtons](self->_buttonsController, "disconnectAllButtons");
  -[SUUINavigationBarContext textLayoutCache](self->_navigationBarContext, "textLayoutCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationBarController;
  -[SUUINavigationBarController dealloc](&v5, sel_dealloc);
}

- (void)attachToNavigationItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  SUUINavigationBarViewElement *viewElement;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  SUUINavigationBarSegmentsController *v17;
  SUUINavigationBarSegmentsController *v18;
  uint64_t v19;
  void *v20;
  SUUINavigationBarMenusController *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__73;
  v76 = __Block_byref_object_dispose__73;
  v77 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__73;
  v70 = __Block_byref_object_dispose__73;
  v71 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__73;
  v64 = __Block_byref_object_dispose__73;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__73;
  v58 = __Block_byref_object_dispose__73;
  v59 = 0;
  viewElement = self->_viewElement;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __54__SUUINavigationBarController_attachToNavigationItem___block_invoke;
  v46[3] = &unk_2511FBBD0;
  v51 = &v72;
  v52 = &v60;
  v50 = &v66;
  v46[4] = self;
  v9 = v5;
  v47 = v9;
  v10 = v7;
  v48 = v10;
  v37 = v6;
  v49 = v37;
  v53 = &v54;
  -[SUUIViewElement enumerateChildrenUsingBlock:](viewElement, "enumerateChildrenUsingBlock:", v46);
  if (!v55[5])
  {
    -[SUUINavigationBarController fallbackTitleView](self, "fallbackTitleView");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v55[5];
    v55[5] = v11;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "additionalLeftBarButtonItemForNavigationBarController:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v9, "insertObject:atIndex:", v14, 0);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "additionalRightBarButtonItemForNavigationBarController:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v10, "insertObject:atIndex:", v15, 0);

  }
  -[SUUINavigationBarController _navigationBarContext](self, "_navigationBarContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67[5])
  {
    v17 = [SUUINavigationBarSegmentsController alloc];
    v18 = -[SUUINavigationBarSegmentsController initWithViewElement:](v17, "initWithViewElement:", v67[5]);
    -[SUUINavigationBarSectionController setContext:](v18, "setContext:", v16);
    -[NSMutableArray addObject:](self->_sections, "addObject:", v18);
    -[SUUINavigationBarSegmentsController view](v18, "view");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v55[5];
    v55[5] = v19;

  }
  if (!v55[5] && objc_msgSend(v37, "count"))
  {
    v21 = -[SUUINavigationBarMenusController initWithMenuViewElements:]([SUUINavigationBarMenusController alloc], "initWithMenuViewElements:", v37);
    -[SUUINavigationBarSectionController setContext:](v21, "setContext:", v16);
    -[NSMutableArray addObject:](self->_sections, "addObject:", v21);
    -[SUUINavigationBarMenusController view](v21, "view");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v55[5];
    v55[5] = v22;

  }
  if (self->_buttonsController)
    -[NSMutableArray addObject:](self->_sections, "addObject:");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = self->_sections;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v42, v79, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v43;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v27++), "willAppearInNavigationBar");
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v42, v79, 16);
    }
    while (v25);
  }

  if (!objc_msgSend((id)v61[5], "length"))
  {
    v28 = objc_loadWeakRetained((id *)&self->_parentViewController);
    objc_msgSend(v28, "title");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v61[5];
    v61[5] = v29;

  }
  SUUINavigationBarController_SetTitleView(v4, (void *)v55[5]);
  v31 = v73[5];
  if (!v31)
    v31 = v61[5];
  objc_msgSend(v4, "setBackButtonTitle:", v31);
  objc_msgSend(v4, "setLeftItemsSupplementBackButton:", 1);
  objc_msgSend(v4, "setLeftBarButtonItems:animated:", v9, 0);
  objc_msgSend(v4, "setRightBarButtonItems:animated:", v10, 0);
  objc_msgSend(v4, "setTitle:", v61[5]);
  objc_msgSend(v16, "textLayoutCache");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commitLayoutRequests");

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v33 = self->_sections;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v38, v78, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v39;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v36++), "reloadSectionViews");
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v38, v78, 16);
    }
    while (v34);
  }

  -[SUUINavigationPaletteController reloadSectionViews](self->_paletteController, "reloadSectionViews");
  objc_msgSend((id)v55[5], "sizeToFit");

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

}

void __54__SUUINavigationBarController_attachToNavigationItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a2;
  v4 = objc_msgSend(v21, "elementType");
  if (v4 == 138)
  {
    v9 = v21;
    v10 = objc_msgSend(v9, "labelViewStyle");
    if (v10 == 5)
    {
      objc_msgSend(v9, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 80);
    }
    else
    {
      if (v10 != 2)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v9, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 72);
    }
    v16 = *(_QWORD *)(v13 + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v12;

    goto LABEL_12;
  }
  if (v4 != 109)
  {
    objc_msgSend(v21, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "elementAlignment");

    v8 = v21;
    switch(v15)
    {
      case 0:
      case 4:
      case 5:
        NSLog(CFSTR("Invalid alignment for navigation bar element: %@"), v21);
        goto LABEL_13;
      case 1:
        objc_msgSend(*(id *)(a1 + 32), "_barButtonItemWithViewElement:", v21);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        goto LABEL_12;
      case 2:
        if (v4 == 69)
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v21);
          goto LABEL_13;
        }
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
          || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
        {
          goto LABEL_14;
        }
        objc_msgSend(*(id *)(a1 + 32), "titleViewWithViewElement:", v21);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        break;
      case 3:
        objc_msgSend(*(id *)(a1 + 32), "_barButtonItemWithViewElement:", v21);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v9, 0);
        goto LABEL_12;
      default:
        goto LABEL_14;
    }
    goto LABEL_13;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v8 = v21;
  if (!v7)
  {
    objc_storeStrong(v6, a2);
LABEL_13:
    v8 = v21;
  }
LABEL_14:

}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_sections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "barButtonItemForElementIdentifier:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)detachFromNavigationItem:(id)a3
{
  id v4;

  v4 = a3;
  -[SUUINavigationBarController detachNavigationItemControllers](self, "detachNavigationItemControllers");
  objc_msgSend(v4, "setLeftBarButtonItems:animated:", 0, 0);
  objc_msgSend(v4, "setRightBarButtonItems:animated:", 0, 0);
  objc_msgSend(v4, "setTitle:", 0);
  SUUINavigationBarController_SetTitleView(v4, 0);

}

- (void)detachNavigationItemControllers
{
  SUUINavigationBarButtonsController *buttonsController;
  SUUINavigationPaletteController *paletteController;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  -[SUUINavigationBarButtonsController disconnectAllButtons](self->_buttonsController, "disconnectAllButtons");
  buttonsController = self->_buttonsController;
  self->_buttonsController = 0;

  paletteController = self->_paletteController;
  self->_paletteController = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_searchBarControllers;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_searchBarControllers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setParentViewController:", 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSMapTable removeAllObjects](self->_searchBarControllers, "removeAllObjects");
}

- (NSArray)existingSearchBarControllers
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_searchBarControllers;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_searchBarControllers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_reusableSearchBarControllers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  return (NSArray *)v3;
}

- (id)fallbackTitleView
{
  return 0;
}

- (UIView)navigationPaletteView
{
  SUUINavigationPaletteController *paletteController;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SUUINavigationPaletteController *v9;
  SUUINavigationPaletteController *v10;
  void *v11;

  paletteController = self->_paletteController;
  if (!paletteController)
  {
    -[SUUINavigationBarViewElement navigationPalettes](self->_viewElement, "navigationPalettes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "flattenedChildren");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        -[SUUINavigationBarController _navigationBarContext](self, "_navigationBarContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SUUINavigationPaletteController initWithPaletteViewElement:]([SUUINavigationPaletteController alloc], "initWithPaletteViewElement:", v5);
        v10 = self->_paletteController;
        self->_paletteController = v9;

        -[SUUINavigationBarSectionController setContext:](self->_paletteController, "setContext:", v8);
        -[SUUINavigationPaletteController willAppearInNavigationBar](self->_paletteController, "willAppearInNavigationBar");
        objc_msgSend(v8, "textLayoutCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "commitLayoutRequests");

      }
    }

    paletteController = self->_paletteController;
  }
  return (UIView *)-[SUUINavigationPaletteController view](paletteController, "view");
}

- (void)setReusableSearchBarControllers:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *reusableSearchBarControllers;

  if (self->_reusableSearchBarControllers != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    reusableSearchBarControllers = self->_reusableSearchBarControllers;
    self->_reusableSearchBarControllers = v4;

  }
}

- (id)titleViewWithViewElement:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  v5 = a3;
  -[SUUINavigationBarController _availableWidth](self, "_availableWidth");
  v7 = v6;
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10 > SUUICompactThreshold();

    if (v11 && v7 > 314.0)
      v7 = 314.0;
  }
  if (objc_msgSend(v5, "elementType") == 106)
  {
    -[SUUINavigationBarController _addSearchBarControllerWithViewElement:](self, "_addSearchBarControllerWithViewElement:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isDescendantOfView:", v13) & 1) == 0)
      objc_msgSend(v13, "addSubview:", v14);
    objc_msgSend(v13, "setPretendsIsInBar:", 1);
    objc_msgSend(v5, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemWidth");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v5, "style");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "itemWidth");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v20 = v19;

      v21 = *MEMORY[0x24BDBF090];
      v22 = *(double *)(MEMORY[0x24BDBF090] + 8);
      objc_msgSend(v13, "sizeThatFits:", v20, 1.79769313e308);
      v24 = v23;
      objc_msgSend(v13, "setFrame:", v21, v22, v20, v23);
      objc_msgSend(v13, "setAutoresizingMask:", 2);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v13, "setIntrinsicWidth:", v20);
      v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v21, v22, v20, v24);
      objc_msgSend(v25, "addSubview:", v13);
    }
    else
    {
      v25 = v13;
      v34 = *MEMORY[0x24BDBF090];
      v35 = *(double *)(MEMORY[0x24BDBF090] + 8);
      objc_msgSend(v25, "sizeThatFits:", v7, 1.79769313e308);
      objc_msgSend(v25, "setFrame:", v34, v35, v7, v36);
    }

    goto LABEL_16;
  }
  if (objc_msgSend(v5, "elementType") == 12)
  {
    objc_storeStrong((id *)&self->_titleButtonViewElement, a3);
    -[SUUINavigationBarController _buttonWithElement:width:](self, "_buttonWithElement:width:", self->_titleButtonViewElement, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__titleButtonAction_, 64);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundColor:", v27);

    v28 = *MEMORY[0x24BDBF090];
    v29 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v30 = *MEMORY[0x24BDBF148];
    v31 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v12 = v26;
    objc_msgSend(v12, "sizeThatFits:", v30, v31);
    objc_msgSend(v12, "setFrame:", v28, v29, v32, v33);
    v25 = v12;
LABEL_16:

    goto LABEL_17;
  }
  v25 = 0;
LABEL_17:

  return v25;
}

- (void)updateNavigationItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMapTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  BOOL v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  id WeakRetained;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char isKindOfClass;
  void *v39;
  void *v40;
  NSMapTable *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  SUUINavigationPaletteController *paletteController;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SUUINavigationBarViewElement updateType](self->_viewElement, "updateType");
  switch(v5)
  {
    case 1:
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v11 = self->_searchBarControllers;
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v51 != v14)
              objc_enumerationMutation(v11);
            -[NSMapTable objectForKey:](self->_searchBarControllers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "reloadAfterDocumentUpdate");

          }
          v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v13);
      }

      v17 = (void *)-[NSMutableArray mutableCopy](self->_sections, "mutableCopy");
      v6 = v17;
      if (self->_paletteController)
        objc_msgSend(v17, "addObject:");
      -[SUUINavigationBarController _fullyReloadSections:withNavigationItem:](self, "_fullyReloadSections:withNavigationItem:", v6, v4);
      if (self->_titleButtonViewElement)
      {
        -[SUUINavigationBarController _availableWidth](self, "_availableWidth");
        v19 = v18;
        if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
        {
          objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "keyWindow");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bounds");
          v23 = v22 > SUUICompactThreshold();

          if (v23 && v19 > 314.0)
            v19 = 314.0;
        }
        -[SUUINavigationBarController _buttonWithElement:width:](self, "_buttonWithElement:width:", self->_titleButtonViewElement, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__titleButtonAction_, 64);
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setBackgroundColor:", v25);

        v26 = *MEMORY[0x24BDBF090];
        v27 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v28 = *MEMORY[0x24BDBF148];
        v29 = *(double *)(MEMORY[0x24BDBF148] + 8);
        v30 = v24;
        objc_msgSend(v30, "sizeThatFits:", v28, v29);
        objc_msgSend(v30, "setFrame:", v26, v27, v31, v32);
        SUUINavigationBarController_SetTitleView(v4, v30);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
      objc_msgSend(WeakRetained, "navigationController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "navigationBar");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setNeedsLayout");

      goto LABEL_44;
    case 4:
      -[SUUINavigationBarController detachFromNavigationItem:](self, "detachFromNavigationItem:", v4);
      -[SUUINavigationBarController parentViewController](self, "parentViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "presentedViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[SUUINavigationBarController parentViewController](self, "parentViewController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "presentedViewController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dismissViewControllerAnimated:completion:", 0, 0);

      }
      -[SUUINavigationBarController attachToNavigationItem:](self, "attachToNavigationItem:", v4);
      break;
    case 3:
      -[SUUIViewElement firstChildForElementType:](self->_viewElement, "firstChildForElementType:", 106);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewElement firstChildForElementType:](self->_viewElement, "firstChildForElementType:", 75);
      v7 = objc_claimAutoreleasedReturnValue();
      -[SUUIViewElement firstChildForElementType:](self->_viewElement, "firstChildForElementType:", 138);
      v8 = objc_claimAutoreleasedReturnValue();
      if (-[NSMapTable count](self->_searchBarControllers, "count") != 1)
      {
LABEL_42:
        -[SUUINavigationBarController detachFromNavigationItem:](self, "detachFromNavigationItem:", v4);
        -[SUUINavigationBarController attachToNavigationItem:](self, "attachToNavigationItem:", v4);
LABEL_43:

LABEL_44:
        break;
      }
      -[SUUIViewElement flattenedChildren](self->_viewElement, "flattenedChildren");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 == 3)
      {
        if (!v6 || !v7 || !v8)
          goto LABEL_42;
      }
      else if (v10 == 2)
      {
        if (!v6 || !(v7 | v8))
          goto LABEL_42;
      }
      else if (v10 != 1 || !v6)
      {
        goto LABEL_42;
      }
      v49 = v8;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v41 = self->_searchBarControllers;
      v42 = -[NSMapTable countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v42)
      {
        v43 = v42;
        v44 = 0;
        v45 = *(_QWORD *)v55;
        do
        {
          v46 = 0;
          v47 = v44;
          do
          {
            if (*(_QWORD *)v55 != v45)
              objc_enumerationMutation(v41);
            -[NSMapTable objectForKey:](self->_searchBarControllers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v46));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            ++v46;
            v47 = v44;
          }
          while (v43 != v46);
          v43 = -[NSMapTable countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v43);
      }
      else
      {
        v44 = 0;
      }

      objc_msgSend(v44, "setSearchBarViewElement:", v6);
      -[NSMapTable removeAllObjects](self->_searchBarControllers, "removeAllObjects");
      -[NSMapTable setObject:forKey:](self->_searchBarControllers, "setObject:forKey:", v44, v6);
      paletteController = self->_paletteController;
      if (v7)
      {
        v8 = v49;
        if (!paletteController)
        {
LABEL_52:

          goto LABEL_43;
        }
        paletteController = (SUUINavigationPaletteController *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", self->_paletteController, 0);
        -[SUUINavigationBarController _fullyReloadSections:withNavigationItem:](self, "_fullyReloadSections:withNavigationItem:", paletteController, v4);
      }
      else
      {
        self->_paletteController = 0;
        v8 = v49;
      }

      goto LABEL_52;
  }

}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  SUUINavigationPaletteController *paletteController;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  paletteController = self->_paletteController;
  if (!paletteController
    || (-[SUUINavigationPaletteController viewForElementIdentifier:](paletteController, "viewForElementIdentifier:", v4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_sections;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "viewForElementIdentifier:", v4, (_QWORD)v14);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v6 = (void *)v12;
            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_13:

  }
  return v6;
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v4, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
      if (!v5)
        goto LABEL_7;
    }
    objc_msgSend(v6, "sizeToFit");
    objc_msgSend(v4, "layoutSubviews");

  }
LABEL_7:

}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_sections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "reloadSectionViews", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[SUUINavigationPaletteController reloadSectionViews](self->_paletteController, "reloadSectionViews");
}

- (void)_viewElementEventNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMapTable *v7;
  void *v8;
  _OWORD v9[4];
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUINavigationBarController navigationPaletteView](self, "navigationPaletteView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v6, "isDescendantOfView:", v5))
  {
    memset(v9, 0, sizeof(v9));
    v7 = self->_searchBarControllers;
    if (-[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", v9, v10, 16))
    {
      -[NSMapTable objectForKey:](self->_searchBarControllers, "objectForKey:", **((_QWORD **)&v9[0] + 1), *(_QWORD *)&v9[0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resignActive:", 1);

    }
  }

}

- (id)_addSearchBarControllerWithViewElement:(id)a3
{
  id v4;
  SUUISearchBarController *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  double v9;
  BOOL v10;
  NSMapTable *searchBarControllers;
  NSMapTable *v12;
  NSMapTable *v13;

  v4 = a3;
  if (!-[NSMutableArray count](self->_reusableSearchBarControllers, "count")
    || (-[NSMutableArray firstObject](self->_reusableSearchBarControllers, "firstObject"),
        v5 = (SUUISearchBarController *)objc_claimAutoreleasedReturnValue(),
        -[SUUISearchBarController setSearchBarViewElement:](v5, "setSearchBarViewElement:", v4),
        -[NSMutableArray removeObjectAtIndex:](self->_reusableSearchBarControllers, "removeObjectAtIndex:", 0),
        !v5))
  {
    v5 = -[SUUISearchBarController initWithSearchBarViewElement:]([SUUISearchBarController alloc], "initWithSearchBarViewElement:", v4);
  }
  -[SUUISearchBarController setClientContext:](v5, "setClientContext:", self->_clientContext);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  -[SUUISearchBarController setParentViewController:](v5, "setParentViewController:", WeakRetained);

  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    if (v9 <= SUUICompactThreshold())
    {

    }
    else
    {
      v10 = -[SUUIClientContext shouldForceTransientSearchControllerBahavior](self->_clientContext, "shouldForceTransientSearchControllerBahavior");

      if (!v10)
      {
        -[SUUISearchBarController setShowsResultsForEmptyField:](v5, "setShowsResultsForEmptyField:", 1);
        goto LABEL_10;
      }
    }
  }
  -[SUUISearchBarController setDisplaysSearchBarInNavigationBar:](v5, "setDisplaysSearchBarInNavigationBar:", 1);
LABEL_10:
  searchBarControllers = self->_searchBarControllers;
  if (!searchBarControllers)
  {
    v12 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    v13 = self->_searchBarControllers;
    self->_searchBarControllers = v12;

    searchBarControllers = self->_searchBarControllers;
  }
  -[NSMapTable setObject:forKey:](searchBarControllers, "setObject:forKey:", v5, v4);

  return v5;
}

- (id)_attributedStringForButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "buttonText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "buttonViewType");
  objc_msgSend(v4, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUUINavigationBarController _attributedStringForButtonText:type:style:](self, "_attributedStringForButtonText:type:style:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUINavigationBarController _attributedStringForButtonText:type:style:](self, "_attributedStringForButtonText:type:style:", v5, v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a3;
  SUUIViewElementFontWithStyle(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (a4)
      v11 = 5;
    else
      v11 = 1;
    SUUIFontPreferredFontForTextStyle(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUUINavigationBarViewElement tintColor](self->_viewElement, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attributedStringWithDefaultFont:foregroundColor:style:", v10, v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)_availableWidth
{
  UIViewController **p_parentViewController;
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  p_parentViewController = &self->_parentViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v4 = objc_msgSend(WeakRetained, "isViewLoaded");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_parentViewController);
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v8 = v9;
  }

  return v8;
}

- (id)_barButtonItemWithButtonViewElement:(id)a3
{
  id v4;
  SUUINavigationBarButtonsController *buttonsController;
  SUUINavigationBarButtonsController *v6;
  SUUINavigationBarButtonsController *v7;
  SUUINavigationBarButtonsController *v8;
  void *v9;
  void *v10;

  v4 = a3;
  buttonsController = self->_buttonsController;
  if (!buttonsController)
  {
    v6 = -[SUUINavigationBarButtonsController initWithNavigationBarViewElement:]([SUUINavigationBarButtonsController alloc], "initWithNavigationBarViewElement:", self->_viewElement);
    v7 = self->_buttonsController;
    self->_buttonsController = v6;

    v8 = self->_buttonsController;
    -[SUUINavigationBarController _navigationBarContext](self, "_navigationBarContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUINavigationBarSectionController setContext:](v8, "setContext:", v9);

    buttonsController = self->_buttonsController;
  }
  -[SUUINavigationBarButtonsController addButtonItemWithButtonViewElement:](buttonsController, "addButtonItemWithButtonViewElement:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_barButtonItemWithSearchBarViewElement:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v4 = (objc_class *)MEMORY[0x24BEBD410];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SUUINavigationBarController _addSearchBarControllerWithViewElement:](self, "_addSearchBarControllerWithViewElement:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUINavigationBarController _availableWidth](self, "_availableWidth");
  if (v8 <= 1000.0)
    v9 = 150.0;
  else
    v9 = 200.0;
  objc_msgSend(v7, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPretendsIsInBar:", 1);
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  objc_msgSend(v10, "sizeThatFits:", v9, 1.79769313e308);
  objc_msgSend(v10, "setFrame:", v11, v12, v9, v13);
  objc_msgSend(v6, "setCustomView:", v10);

  return v6;
}

- (id)_barButtonItemWithViewElement:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  if (SUUIIKViewElementTypeIsButton(v5))
  {
    -[SUUINavigationBarController _barButtonItemWithButtonViewElement:](self, "_barButtonItemWithButtonViewElement:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 106)
    {
      v7 = 0;
      goto LABEL_7;
    }
    -[SUUINavigationBarController _barButtonItemWithSearchBarViewElement:](self, "_barButtonItemWithSearchBarViewElement:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)_buttonWithElement:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  SUUIStyledButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SUUIAttributedStringLayoutRequest *v20;
  SUUIAttributedStringLayout *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  SUUIAttributedStringLayoutRequest *v29;
  SUUIAttributedStringLayout *v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  SUUIAttributedStringLayout *v43;
  uint64_t v44;
  SUUIButtonBorderStyle *v45;
  void *v46;
  SUUIButtonBorderStyle *v47;
  uint64_t v48;
  double v49;
  SUUIStyledButton *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  char v56;

  v6 = a3;
  v7 = objc_msgSend(v6, "buttonViewType");
  if (v7 == 9)
  {
    v9 = objc_alloc_init(SUUIStyledButton);
    -[SUUIStyledButton setAlpha:](v9, "setAlpha:", 1.0);
    -[SUUIStyledButton setBorderStyle:](v9, "setBorderStyle:", 0);
    v18 = 1;
    -[SUUIStyledButton setButtonType:](v9, "setButtonType:", 1);
    -[SUUINavigationBarController _attributedStringForButton:](self, "_attributedStringForButton:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v19);
    -[SUUIAttributedStringLayoutRequest setWidth:](v20, "setWidth:", a4);
    v21 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v20);
    -[SUUIStyledButton setTitleLayout:](v9, "setTitleLayout:", v21);
    if (!-[SUUIStyledButton isUsingItemOfferAppearance](v9, "isUsingItemOfferAppearance"))
      v18 = objc_msgSend(v6, "isEnabled");
    -[SUUIStyledButton setEnabled:](v9, "setEnabled:", v18);
    objc_msgSend(v6, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithStyle(v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIStyledButton setTintColor:](v9, "setTintColor:", v23);
    goto LABEL_29;
  }
  v8 = v7;
  if (v7 != 6)
  {
    if (v7 == 5)
    {
      v9 = objc_alloc_init(SUUIStyledImageButton);
      -[SUUIStyledButton imageView](v9, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "buttonImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUINavigationBarController _resourceImageForImageElement:](self, "_resourceImageForImageElement:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:", v12);
      objc_msgSend(v12, "size");
      objc_msgSend(v10, "setImageSize:");
      objc_msgSend(v11, "accessibilityText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v6, "accessibilityText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[SUUIStyledButton setAccessibilityLabel:](v9, "setAccessibilityLabel:", v13);
      v14 = objc_msgSend(v6, "isEnabled");
      v15 = 0.4;
      if ((_DWORD)v14)
        v15 = 1.0;
      -[SUUIStyledButton setAlpha:](v9, "setAlpha:", v15);
      -[SUUIStyledButton setEnabled:](v9, "setEnabled:", v14);
      objc_msgSend(v6, "style");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIViewElementPlainColorWithStyle(v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStyledButton setTintColor:](v9, "setTintColor:", v17);

      goto LABEL_30;
    }
    v9 = objc_alloc_init(SUUIStyledButton);
    -[SUUINavigationBarController _attributedStringForButton:](self, "_attributedStringForButton:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v19);
    -[SUUIAttributedStringLayoutRequest setWidth:](v20, "setWidth:", a4);
    v43 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v20);
    -[SUUIStyledButton setTitleLayout:](v9, "setTitleLayout:", v43);
    if (v8 == 13)
      v44 = 7;
    else
      v44 = 0;
    -[SUUIStyledButton setButtonType:](v9, "setButtonType:", v44);
    v45 = [SUUIButtonBorderStyle alloc];
    objc_msgSend(v6, "style");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[SUUIButtonBorderStyle initWithElementStyle:](v45, "initWithElementStyle:", v46);

    -[SUUIStyledButton setBorderStyle:](v9, "setBorderStyle:", v47);
    v48 = objc_msgSend(v6, "isEnabled");
    -[SUUIStyledButton setEnabled:](v9, "setEnabled:", v48);
    v49 = 0.4;
    if ((_DWORD)v48)
      v49 = 1.0;
    -[SUUIStyledButton setAlpha:](v9, "setAlpha:", v49);

LABEL_29:
    goto LABEL_30;
  }
  v9 = objc_alloc_init(SUUIStyledButton);
  -[SUUIStyledButton setBorderStyle:](v9, "setBorderStyle:", 0);
  objc_msgSend(v6, "children");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v25;
  v26 = objc_msgSend(v25, "elementType");
  if (v26 == 138)
    v27 = 5;
  else
    v27 = 6;
  -[SUUIStyledButton setButtonType:](v9, "setButtonType:", v27);
  -[SUUINavigationBarController _attributedStringForButton:](self, "_attributedStringForButton:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v28);
  -[SUUIAttributedStringLayoutRequest setWidth:](v29, "setWidth:", a4);
  v30 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v29);
  -[SUUIStyledButton setTitleLayout:](v9, "setTitleLayout:", v30);
  v31 = objc_msgSend(v6, "isEnabled");
  -[SUUIStyledButton setEnabled:](v9, "setEnabled:", v31);
  v32 = 0.4;
  if ((_DWORD)v31)
    v32 = 1.0;
  -[SUUIStyledButton setAlpha:](v9, "setAlpha:", v32);
  -[SUUIStyledButton imageView](v9, "imageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonImage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationBarController _resourceImageForImageElement:](self, "_resourceImageForImageElement:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setImage:", v35);
  objc_msgSend(v35, "size");
  objc_msgSend(v33, "setImageSize:");
  v56 = 0;
  objc_msgSend(v34, "style");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = SUUIViewElementMarginForStyle(v36, &v56);
  v39 = v38;
  v41 = v40;

  if (v56)
  {
    if (v26 == 138)
      v42 = v39;
    else
      v42 = v41;
    -[SUUIStyledButton setImageTextPaddingInterior:](v9, "setImageTextPaddingInterior:", v42);
    -[SUUIStyledButton setImageYAdjustment:](v9, "setImageYAdjustment:", v37);
  }

LABEL_30:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = v9;
    objc_msgSend(v6, "buttonTitleStyle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (!v51)
    {
      objc_msgSend(v6, "style");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v52, "ikColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStyledButton setUsesTintColor:](v50, "setUsesTintColor:", objc_msgSend(v53, "colorType") == 1);

    if (!v51)
  }

  return v9;
}

- (void)_fullyReloadSections:(id)a3 withNavigationItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "reloadAfterDocumentUpdateWithNavigationItem:", v7);
        objc_msgSend(v12, "willAppearInNavigationBar");
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }
  -[SUUINavigationBarController _navigationBarContext](self, "_navigationBarContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textLayoutCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commitLayoutRequests");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "reloadSectionViews", (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (id)_navigationBarContext
{
  SUUINavigationBarContext *navigationBarContext;
  SUUINavigationBarContext *v4;
  SUUINavigationBarContext *v5;
  SUUINavigationBarContext *v6;
  void *v7;
  double v8;
  SUUINavigationBarContext *v9;
  id WeakRetained;
  id v11;
  SUUIResourceLoader *v12;
  SUUILayoutCache *v13;

  navigationBarContext = self->_navigationBarContext;
  if (!navigationBarContext)
  {
    v4 = objc_alloc_init(SUUINavigationBarContext);
    v5 = self->_navigationBarContext;
    self->_navigationBarContext = v4;

    -[SUUINavigationBarContext setClientContext:](self->_navigationBarContext, "setClientContext:", self->_clientContext);
    v6 = self->_navigationBarContext;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[SUUINavigationBarContext setMaximumNavigationBarWidth:](v6, "setMaximumNavigationBarWidth:", v8);

    v9 = self->_navigationBarContext;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    -[SUUINavigationBarContext setParentViewController:](v9, "setParentViewController:", WeakRetained);

    v11 = objc_alloc_init(MEMORY[0x24BDD1710]);
    -[SUUINavigationBarContext setOperationQueue:](self->_navigationBarContext, "setOperationQueue:", v11);
    v12 = -[SUUIResourceLoader initWithClientContext:]([SUUIResourceLoader alloc], "initWithClientContext:", self->_clientContext);
    -[SUUINavigationBarContext setResourceLoader:](self->_navigationBarContext, "setResourceLoader:", v12);
    v13 = objc_alloc_init(SUUILayoutCache);
    -[SUUILayoutCache setDelegate:](v13, "setDelegate:", self);
    -[SUUINavigationBarContext setTextLayoutCache:](self->_navigationBarContext, "setTextLayoutCache:", v13);

    navigationBarContext = self->_navigationBarContext;
  }
  return navigationBarContext;
}

- (id)_resourceImageForImageElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "resourceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    SUUIImageWithResourceName(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageMaskColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "color");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_flatImageWithColor:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_titleButtonAction:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", 0x251204068, self);
  -[SUUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_titleButtonViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUINavigationBarViewElement)navigationBarViewElement
{
  return self->_viewElement;
}

- (void)setNavigationBarViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (SUUINavigationBarControllerDelegate)delegate
{
  return (SUUINavigationBarControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleButtonViewElement, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_searchBarControllers, 0);
  objc_storeStrong((id *)&self->_reusableSearchBarControllers, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_paletteController, 0);
  objc_storeStrong((id *)&self->_navigationBarContext, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_buttonsController, 0);
}

@end
