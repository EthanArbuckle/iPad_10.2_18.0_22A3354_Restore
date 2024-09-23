@implementation MUScrollViewImpressionsCalculator

- (MUScrollViewImpressionsCalculator)initWithConfiguration:(id)a3 visibleItemsProvider:(id)a4
{
  id v6;
  MUScrollViewImpressionsCalculator *v7;
  MUScrollViewImpressionsCalculator *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MUScrollViewImpressionsCalculator;
  v7 = -[MUImpressionsCalculator initWithConfiguration:](&v10, sel_initWithConfiguration_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_visibleItemsProvider, v6);

  return v8;
}

- (void)logImpressions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _MUImpressionUIElement *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (-[MUImpressionsCalculator isActive](self, "isActive"))
  {
    v3 = (void *)MEMORY[0x1E0C99E20];
    -[MUImpressionsCalculator uiElementsByIdentifiers](self, "uiElementsByIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_visibleItemsProvider);
    objc_msgSend(WeakRetained, "visibleImpressionElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
          -[MUImpressionsCalculator uiElementsByIdentifiers](self, "uiElementsByIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "elementIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v16);
          v17 = (_MUImpressionUIElement *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v14, "frame");
            -[_MUImpressionUIElement setFrame:](v17, "setFrame:");
            objc_msgSend(v14, "elementIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "removeObject:", v18);
          }
          else
          {
            v17 = objc_alloc_init(_MUImpressionUIElement);
            objc_msgSend(v14, "frame");
            -[_MUImpressionUIElement setFrame:](v17, "setFrame:");
            -[_MUImpressionUIElement setClientElement:](v17, "setClientElement:", v14);
            -[MUImpressionsCalculator uiElementsByIdentifiers](self, "uiElementsByIdentifiers");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "elementIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKey:", v17, v19);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v11);
    }
    v30 = v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v6, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v25);
          -[MUImpressionsCalculator uiElementsByIdentifiers](self, "uiElementsByIdentifiers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[MUImpressionsCalculator _logExitForImpressionUIElement:usingExitDate:](self, "_logExitForImpressionUIElement:usingExitDate:", v28, v20);
          -[MUImpressionsCalculator uiElementsByIdentifiers](self, "uiElementsByIdentifiers");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObjectForKey:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v23);
    }

    -[MUImpressionsCalculator _checkVisibilityForAllItemsOnDate:](self, "_checkVisibilityForAllItemsOnDate:", v20);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_visibleItemsProvider);
}

@end
