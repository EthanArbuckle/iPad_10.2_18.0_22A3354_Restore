@implementation MTVisualStylingProvider

- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4
{
  -[MTVisualStylingProvider automaticallyUpdateView:withStyle:andObserverBlock:](self, "automaticallyUpdateView:withStyle:andObserverBlock:", a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateObservers, 0);
  objc_storeStrong((id *)&self->_viewsAndLayersToObserverBlocks, 0);
  objc_storeStrong((id *)&self->_viewsAndLayersToCoreMaterialVisualStyles, 0);
  objc_storeStrong((id *)&self->_styleNamesToVisualStylings, 0);
  objc_storeStrong((id *)&self->_coreMaterialVisualStylingProvider, 0);
}

+ (id)_visualStylingProviderForRecipe:(int64_t)a3 category:(int64_t)a4 andUserInterfaceStyle:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  void *v9;

  if (a3)
  {
    MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(a3, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_visualStylingProviderForRecipeNamed:andCategory:", v7, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 3)
    {
      v9 = 0;
      return v9;
    }
    MTCoreMaterialPlatformColorsStyleNameForUserInterfaceStyle(a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_visualStylingProviderForStyleSetNamed:inBundle:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)_visualStylingProviderForRecipeNamed:(id)a3 andCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (v6)
  {
    MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BE1E460], "coreMaterialVisualStylingProviderForRecipe:andCategory:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoreMaterialVisualStylingProvider:", v8);
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MTVisualStylingProvider)initWithCoreMaterialVisualStylingProvider:(id)a3
{
  id v6;
  MTVisualStylingProvider *v7;
  MTVisualStylingProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTVisualStylingProvider.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cmProvider"));

  }
  v11.receiver = self;
  v11.super_class = (Class)MTVisualStylingProvider;
  v7 = -[MTVisualStylingProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_coreMaterialVisualStylingProvider, a3);
    -[MTCoreMaterialVisualStylingProvider addObserver:](v8->_coreMaterialVisualStylingProvider, "addObserver:", v8);
  }

  return v8;
}

- (id)_visualStylingForStyle:(int64_t)a3
{
  void *v4;
  void *v5;

  MTCoreMaterialVisualStyleForVisualStyle(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MTVisualStylingProvider _visualStylingForStyleNamed:](self, "_visualStylingForStyleNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4 andObserverBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  if (v10 && MTIsValidVisualStyle(a4))
  {
    MTCoreMaterialVisualStyleForVisualStyle(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider _automaticallyUpdateViewOrLayer:withStyleNamed:andObserverBlock:](self, "_automaticallyUpdateViewOrLayer:withStyleNamed:andObserverBlock:", v10, v9, v8);

  }
}

- (void)_updateVisualStyleOfViewOrLayer:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;

  v9 = a3;
  -[NSMapTable objectForKey:](self->_viewsAndLayersToCoreMaterialVisualStyles, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_13;
  -[NSMapTable objectForKey:](self->_viewsAndLayersToObserverBlocks, "objectForKey:", v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, MTVisualStylingProvider *, id))(v5 + 16))(v5, self, v9);
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MTVisualStylingProvider _visualStylingForStyleNamed:](self, "_visualStylingForStyleNamed:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mt_replaceVisualStyling:", v8);
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MTCoreMaterialVisualStylingProvider visualStylingForStyle:](self->_coreMaterialVisualStylingProvider, "visualStylingForStyle:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mt_replaceAllVisualStylingWithStyling:", v8);
    goto LABEL_9;
  }
LABEL_10:
  if (v7)
    ((void (**)(_QWORD, MTVisualStylingProvider *, id))v7)[2](v7, self, v9);

LABEL_13:
}

- (id)_visualStylingForStyleNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *styleNamesToVisualStylings;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_styleNamesToVisualStylings, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[MTCoreMaterialVisualStylingProvider visualStylingForStyle:](self->_coreMaterialVisualStylingProvider, "visualStylingForStyle:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_visualStylingClass")), "initWithCoreMaterialVisualStyling:", v6);
        styleNamesToVisualStylings = self->_styleNamesToVisualStylings;
        if (!styleNamesToVisualStylings)
        {
          v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          v9 = self->_styleNamesToVisualStylings;
          self->_styleNamesToVisualStylings = v8;

          styleNamesToVisualStylings = self->_styleNamesToVisualStylings;
        }
        -[NSMutableDictionary setObject:forKey:](styleNamesToVisualStylings, "setObject:forKey:", v5, v4);
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_automaticallyUpdateViewOrLayer:(id)a3 withStyleNamed:(id)a4 andObserverBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSMapTable *viewsAndLayersToCoreMaterialVisualStyles;
  NSMapTable *v12;
  NSMapTable *v13;
  NSMapTable *viewsAndLayersToObserverBlocks;
  NSMapTable *v15;
  NSMapTable *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  if (v19)
  {
    -[MTCoreMaterialVisualStylingProvider visualStylingForStyle:](self->_coreMaterialVisualStylingProvider, "visualStylingForStyle:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      viewsAndLayersToCoreMaterialVisualStyles = self->_viewsAndLayersToCoreMaterialVisualStyles;
      if (!viewsAndLayersToCoreMaterialVisualStyles)
      {
        objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
        v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v13 = self->_viewsAndLayersToCoreMaterialVisualStyles;
        self->_viewsAndLayersToCoreMaterialVisualStyles = v12;

        viewsAndLayersToCoreMaterialVisualStyles = self->_viewsAndLayersToCoreMaterialVisualStyles;
      }
      -[NSMapTable setObject:forKey:](viewsAndLayersToCoreMaterialVisualStyles, "setObject:forKey:", v8, v19);
      if (v9)
      {
        viewsAndLayersToObserverBlocks = self->_viewsAndLayersToObserverBlocks;
        if (!viewsAndLayersToObserverBlocks)
        {
          objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
          v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          v16 = self->_viewsAndLayersToObserverBlocks;
          self->_viewsAndLayersToObserverBlocks = v15;

          viewsAndLayersToObserverBlocks = self->_viewsAndLayersToObserverBlocks;
        }
        v17 = (void *)objc_msgSend(v9, "copy");
        v18 = (void *)MEMORY[0x20BD33610]();
        -[NSMapTable setObject:forKey:](viewsAndLayersToObserverBlocks, "setObject:forKey:", v18, v19);

      }
      -[MTVisualStylingProvider _updateVisualStyleOfViewOrLayer:](self, "_updateVisualStyleOfViewOrLayer:", v19);
    }
  }

}

+ (Class)_visualStylingClass
{
  return (Class)objc_opt_class();
}

uint64_t __65__MTVisualStylingProvider_newAutomaticallyUpdatingViewWithStyle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

id __65__MTVisualStylingProvider_newAutomaticallyUpdatingViewWithStyle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  objc_msgSend(a3, "alpha");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__MTVisualStylingProvider_newAutomaticallyUpdatingViewWithStyle___block_invoke_2;
  v5[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v5[4] = v3;
  return (id)MEMORY[0x20BD33610](v5);
}

+ (id)_visualStylingProviderForRecipe:(int64_t)a3 andCategory:(int64_t)a4
{
  return (id)objc_msgSend(a1, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", a3, a4, 0);
}

- (id)newAutomaticallyUpdatingViewWithStyle:(int64_t)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  -[MTVisualStylingProvider automaticallyUpdateView:withStyle:andObserverBlock:](self, "automaticallyUpdateView:withStyle:andObserverBlock:", v5, a3, &__block_literal_global_3);
  return v5;
}

+ (id)_visualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4
{
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE1E460], "coreMaterialVisualStylingProviderForStyleSetNamed:inBundle:", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoreMaterialVisualStylingProvider:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_stopAutomaticallyUpdatingViewOrLayer:(id)a3
{
  NSMapTable *viewsAndLayersToCoreMaterialVisualStyles;
  id v5;

  if (a3)
  {
    viewsAndLayersToCoreMaterialVisualStyles = self->_viewsAndLayersToCoreMaterialVisualStyles;
    v5 = a3;
    -[NSMapTable removeObjectForKey:](viewsAndLayersToCoreMaterialVisualStyles, "removeObjectForKey:", v5);
    -[NSMapTable removeObjectForKey:](self->_viewsAndLayersToObserverBlocks, "removeObjectForKey:", v5);

  }
}

- (void)automaticallyUpdateLayer:(id)a3 withStyle:(int64_t)a4
{
  -[MTVisualStylingProvider automaticallyUpdateLayer:withStyle:andObserverBlock:](self, "automaticallyUpdateLayer:withStyle:andObserverBlock:", a3, a4, 0);
}

- (void)automaticallyUpdateLayer:(id)a3 withStyle:(int64_t)a4 andObserverBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  if (v10 && MTIsValidVisualStyle(a4))
  {
    MTCoreMaterialVisualStyleForVisualStyle(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTVisualStylingProvider _automaticallyUpdateViewOrLayer:withStyleNamed:andObserverBlock:](self, "_automaticallyUpdateViewOrLayer:withStyleNamed:andObserverBlock:", v10, v9, v8);

  }
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSPointerArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary removeAllObjects](self->_styleNamesToVisualStylings, "removeAllObjects", a3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_viewsAndLayersToCoreMaterialVisualStyles;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        -[MTVisualStylingProvider _updateVisualStyleOfViewOrLayer:](self, "_updateVisualStyleOfViewOrLayer:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  -[NSPointerArray compact](self->_privateObservers, "compact");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_privateObservers;
  v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "providedStylesDidChangeForProvider:", self, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (BOOL)_isAutomaticallyUpdatingViewOrLayer:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_viewsAndLayersToCoreMaterialVisualStyles;
    v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * i) == v4)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p: coreMaterialVisualStylingProvider: %@>"), objc_opt_class(), self, self->_coreMaterialVisualStylingProvider);
}

- (MTCoreMaterialVisualStylingProvider)_coreMaterialVisualStylingProvider
{
  return self->_coreMaterialVisualStylingProvider;
}

- (void)setCoreMaterialVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_coreMaterialVisualStylingProvider, a3);
}

- (NSMutableDictionary)_styleNamesToVisualStylings
{
  return self->_styleNamesToVisualStylings;
}

- (void)setStyleNamesToVisualStylings:(id)a3
{
  objc_storeStrong((id *)&self->_styleNamesToVisualStylings, a3);
}

- (NSMapTable)_viewsAndLayersToCoreMaterialVisualStyles
{
  return self->_viewsAndLayersToCoreMaterialVisualStyles;
}

- (void)setViewsAndLayersToCoreMaterialVisualStyles:(id)a3
{
  objc_storeStrong((id *)&self->_viewsAndLayersToCoreMaterialVisualStyles, a3);
}

- (NSMapTable)_viewsAndLayersToObserverBlocks
{
  return self->_viewsAndLayersToObserverBlocks;
}

- (void)setViewsAndLayersToObserverBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_viewsAndLayersToObserverBlocks, a3);
}

- (NSPointerArray)_privateObservers
{
  return self->_privateObservers;
}

- (void)setPrivateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_privateObservers, a3);
}

- (id)_visualStylingForContinuallyUpdatedView:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[NSMapTable objectForKey:](self->_viewsAndLayersToCoreMaterialVisualStyles, "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[MTVisualStylingProvider _visualStylingForStyleNamed:](self, "_visualStylingForStyleNamed:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_addObserver:(id)a3
{
  id v4;
  NSPointerArray *privateObservers;
  NSPointerArray *v6;
  NSPointerArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    privateObservers = self->_privateObservers;
    v8 = v4;
    if (!privateObservers)
    {
      v6 = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1748]), "initWithOptions:", 5);
      v7 = self->_privateObservers;
      self->_privateObservers = v6;

      privateObservers = self->_privateObservers;
    }
    -[NSPointerArray addPointer:](privateObservers, "addPointer:", v8);
    v4 = v8;
  }

}

- (void)_removeObserver:(id)a3
{
  NSPointerArray *privateObservers;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    privateObservers = self->_privateObservers;
    if (privateObservers)
    {
      -[NSPointerArray compact](privateObservers, "compact");
      if (-[NSPointerArray count](self->_privateObservers, "count"))
      {
        v5 = 0;
        while (-[NSPointerArray pointerAtIndex:](self->_privateObservers, "pointerAtIndex:", v5) != v6)
        {
          if (++v5 >= -[NSPointerArray count](self->_privateObservers, "count"))
            goto LABEL_9;
        }
        -[NSPointerArray removePointerAtIndex:](self->_privateObservers, "removePointerAtIndex:", v5);
      }
    }
  }
LABEL_9:

}

@end
