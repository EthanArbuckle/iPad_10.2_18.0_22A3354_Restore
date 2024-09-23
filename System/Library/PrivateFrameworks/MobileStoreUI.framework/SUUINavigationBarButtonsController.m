@implementation SUUINavigationBarButtonsController

- (SUUINavigationBarButtonsController)initWithNavigationBarViewElement:(id)a3
{
  id v5;
  SUUINavigationBarButtonsController *v6;
  SUUINavigationBarButtonsController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarButtonsController;
  v6 = -[SUUINavigationBarButtonsController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_navigationBarElement, a3);

  return v7;
}

- (void)dealloc
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_buttonItemElements;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "customView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarButtonsController;
  -[SUUINavigationBarSectionController dealloc](&v9, sel_dealloc);
}

- (id)addButtonItemWithButtonViewElement:(id)a3
{
  id v4;
  id v5;
  SUUIItemOfferButton *v6;
  void *v7;
  NSMapTable *buttonItemElements;
  NSMapTable *v9;
  NSMapTable *v10;
  void *v11;
  void *v12;
  NSMapTable *buttonItemToImageResourceCacheKey;
  NSMapTable *v14;
  NSMapTable *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEBD410]);
  if (objc_msgSend(v4, "buttonViewType") == 2)
  {
    v6 = objc_alloc_init(SUUIItemOfferButton);
    -[SUUIItemOfferButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__cancelConfirmationAction_, 0x10000);
    -[SUUIItemOfferButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__itemOfferAction_, 0x20000);
    -[SUUIItemOfferButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__showConfirmationAction_, 0x40000);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUIItemOfferButton setDelegate:](v6, "setDelegate:", self);
    -[SUUINavigationBarButtonsController _updateItemOfferButton:withButtonViewElement:](self, "_updateItemOfferButton:withButtonViewElement:", v6, v4);
    objc_msgSend(v5, "setCustomView:", v6);

  }
  else
  {
    objc_msgSend(v5, "setAction:", sel__buttonAction_);
    objc_msgSend(v5, "setTarget:", self);
    -[SUUINavigationBarButtonsController _updateButtonItem:withButtonViewElement:](self, "_updateButtonItem:withButtonViewElement:", v5, v4);
  }
  buttonItemElements = self->_buttonItemElements;
  if (!buttonItemElements)
  {
    v9 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    v10 = self->_buttonItemElements;
    self->_buttonItemElements = v9;

    buttonItemElements = self->_buttonItemElements;
  }
  -[NSMapTable setObject:forKey:](buttonItemElements, "setObject:forKey:", v4, v5);
  -[SUUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageResourceCacheKeyForViewElement:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    buttonItemToImageResourceCacheKey = self->_buttonItemToImageResourceCacheKey;
    if (!buttonItemToImageResourceCacheKey)
    {
      v14 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 1);
      v15 = self->_buttonItemToImageResourceCacheKey;
      self->_buttonItemToImageResourceCacheKey = v14;

      buttonItemToImageResourceCacheKey = self->_buttonItemToImageResourceCacheKey;
    }
    -[NSMapTable setObject:forKey:](buttonItemToImageResourceCacheKey, "setObject:forKey:", v12, v5);
  }

  return v5;
}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSMapTable *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_buttonItemElements;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_buttonItemElements, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itmlID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = v9;

          goto LABEL_11;
        }

      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)disconnectAllButtons
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_buttonItemElements;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "customView", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTarget:", 0);
        objc_msgSend(v9, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_buttonItemElements, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_buttonItemToImageResourceCacheKey, "removeAllObjects");
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  SUUINavigationBarViewElement *navigationBarElement;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id obj;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _BYTE v39[128];
  _QWORD v40[6];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "leftBarButtonItems");
  v5 = objc_claimAutoreleasedReturnValue();
  v28 = v4;
  objc_msgSend(v4, "rightBarButtonItems");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  navigationBarElement = self->_navigationBarElement;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __82__SUUINavigationBarButtonsController_reloadAfterDocumentUpdateWithNavigationItem___block_invoke;
  v36[3] = &unk_2511F78E0;
  v10 = v7;
  v37 = v10;
  v11 = v8;
  v38 = v11;
  -[SUUIViewElement enumerateChildrenUsingBlock:](navigationBarElement, "enumerateChildrenUsingBlock:", v36);
  v12 = 0;
  v26 = (void *)v6;
  v27 = (void *)v5;
  v40[0] = v5;
  v40[1] = v10;
  v24 = v11;
  v25 = v10;
  v13 = 1;
  v40[2] = v6;
  v40[3] = v11;
  do
  {
    v29 = v13;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)v40[2 * v12];
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v33;
      v18 = (id *)&v40[2 * v12 + 1];
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v19);
        -[NSMapTable objectForKey:](self->_buttonItemElements, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = *v18;
        if (v21)
        {
          objc_msgSend(*v18, "objectAtIndex:", v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUINavigationBarButtonsController _reloadButtonItem:withButtonViewElement:](self, "_reloadButtonItem:withButtonViewElement:", v20, v23);
          -[NSMapTable setObject:forKey:](self->_buttonItemElements, "setObject:forKey:", v23, v20);
          ++v16;

        }
        if (v16 == objc_msgSend(v22, "count"))
          break;
        if (v15 == ++v19)
        {
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
          if (v15)
            goto LABEL_4;
          break;
        }
      }
    }

    v13 = 0;
    v12 = 1;
  }
  while ((v29 & 1) != 0);
  v31.receiver = self;
  v31.super_class = (Class)SUUINavigationBarButtonsController;
  -[SUUINavigationBarSectionController reloadAfterDocumentUpdateWithNavigationItem:](&v31, sel_reloadAfterDocumentUpdateWithNavigationItem_, v28);

}

void __82__SUUINavigationBarButtonsController_reloadAfterDocumentUpdateWithNavigationItem___block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 IsButton;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  IsButton = SUUIIKViewElementTypeIsButton(objc_msgSend(v7, "elementType"));
  v4 = v7;
  if (IsButton)
  {
    objc_msgSend(v7, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "elementAlignment");

    if (v6 == 3)
    {
      objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v7, 0);
      goto LABEL_6;
    }
    v4 = v7;
    if (v6 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
LABEL_6:
      v4 = v7;
    }
  }

}

- (void)_cancelConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_buttonAction:(id)a3
{
  id v3;

  -[NSMapTable objectForKey:](self->_buttonItemElements, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (void)_itemOfferAction:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
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
  v5 = self->_buttonItemElements;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "customView", (_QWORD)v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          -[NSMapTable objectForKey:](self->_buttonItemElements, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_showConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 1, 1);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSMapTable *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = a4;
  -[SUUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v8 = objc_msgSend(v6, "requestIdentifier");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_buttonItemToImageResourceCacheKey;
  v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_buttonItemToImageResourceCacheKey, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "requestIdentifierForResourceCacheKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15 && objc_msgSend(v15, "unsignedIntegerValue") == v8)
        {
          objc_msgSend(v13, "setImage:", v22);
          -[SUUINavigationBarSectionController context](self, "context");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "parentViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "navigationController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "navigationBar");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "setNeedsLayout");
          goto LABEL_12;
        }

      }
      v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)_imageForImageViewElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "resourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    SUUIImageWithResourceName(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestIdentifierForViewElement:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || (objc_msgSend(v8, "resourceLoader"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v7))
    {
      objc_msgSend(v8, "loadImageForImageElement:reason:", v4, 1);
      v7 = 0;
    }

  }
  return v7;
}

- (UIEdgeInsets)_imageInsetsForImageViewElement:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elementPadding");
  v9 = v6;
  v11 = v10;
  v12 = v7;
  v13 = v8;
  if (v10 == *(double *)(MEMORY[0x24BEBE158] + 8)
    && v6 == *MEMORY[0x24BEBE158]
    && v8 == *(double *)(MEMORY[0x24BEBE158] + 24)
    && v7 == *(double *)(MEMORY[0x24BEBE158] + 16))
  {
    objc_msgSend(v4, "resourceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("previewHistory"));

    if (v18)
    {
      -[SUUINavigationBarSectionController context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clientContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = SUUIUserInterfaceIdiom(v20);

      if (v21 == 1)
        v9 = 3.0;
      else
        v9 = 2.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "userInterfaceIdiom"))
      {

        goto LABEL_21;
      }
      objc_msgSend(v4, "resourceName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("share"));

      if (!v24)
        goto LABEL_21;
      v9 = -3.0;
    }
    v13 = 0.0;
    v12 = 0.0;
    v11 = 0.0;
  }
LABEL_21:

  v25 = v9;
  v26 = v11;
  v27 = v12;
  v28 = v13;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)_reloadButtonItem:(id)a3 withButtonViewElement:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "updateType"))
  {
    if (objc_msgSend(v6, "buttonViewType") == 2)
    {
      objc_msgSend(v8, "customView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUINavigationBarButtonsController _updateItemOfferButton:withButtonViewElement:](self, "_updateItemOfferButton:withButtonViewElement:", v7, v6);

    }
    else
    {
      -[SUUINavigationBarButtonsController _updateButtonItem:withButtonViewElement:](self, "_updateButtonItem:withButtonViewElement:", v8, v6);
    }
  }

}

- (void)_updateButtonItem:(id)a3 withButtonViewElement:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "setEnabled:", objc_msgSend(v6, "isEnabled"));
  objc_msgSend(v12, "setStyle:", 2 * (objc_msgSend(v6, "buttonViewType") == 8));
  objc_msgSend(v6, "buttonImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "accessibilityText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAccessibilityLabel:", v8);
    -[SUUINavigationBarButtonsController _imageForImageViewElement:](self, "_imageForImageViewElement:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v9);

    -[SUUINavigationBarButtonsController _imageInsetsForImageViewElement:](self, "_imageInsetsForImageViewElement:", v7);
    objc_msgSend(v12, "setImageInsets:");
  }
  else
  {
    objc_msgSend(v6, "buttonText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v11);

  }
}

- (void)_updateItemOfferButton:(id)a3 withButtonViewElement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "confirmationText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConfirmationTitle:", v9);
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v5, "isEnabled"));
  objc_msgSend(v6, "setShowsConfirmationState:", v9 != 0);
  objc_msgSend(v5, "buttonText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  objc_msgSend(v6, "sizeToFit");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarElement, 0);
  objc_storeStrong((id *)&self->_buttonItemToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_buttonItemElements, 0);
}

@end
