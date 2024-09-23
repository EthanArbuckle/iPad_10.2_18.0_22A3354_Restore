@implementation MUPlaceCardActionsRowView

- (MUPlaceCardActionsRowView)initWithStyle:(unint64_t)a3
{
  void *v5;
  MUPlaceCardActionsRowView *v6;

  +[MUGroupedActionsRowViewConfiguration defaultConfiguration](MUGroupedActionsRowViewConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MUPlaceCardActionsRowView initWithConfiguration:style:](self, "initWithConfiguration:style:", v5, a3);

  return v6;
}

- (MUPlaceCardActionsRowView)initWithConfiguration:(id)a3 style:(unint64_t)a4
{
  MUPlaceCardActionsRowView *v5;
  MUPlaceCardActionsRowView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUPlaceCardActionsRowView;
  v5 = -[MUGroupedActionsRowView initWithConfiguration:](&v8, sel_initWithConfiguration_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    -[MUPlaceCardActionsRowView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("PlaceCardActionsRow"));
    -[MUGroupedActionsRowView setDelegate:](v6, "setDelegate:", v6);
    v6->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
  }
  return v6;
}

- (void)setActionManager:(id)a3
{
  id WeakRetained;
  void *v5;
  NSArray *viewModels;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_actionManager, obj);
    viewModels = self->_viewModels;
    self->_viewModels = 0;

    -[MUPlaceCardActionsRowView _createActionsFromActionManager](self, "_createActionsFromActionManager");
    v5 = obj;
  }

}

- (void)reload
{
  NSArray *viewModels;

  viewModels = self->_viewModels;
  self->_viewModels = 0;

  -[MUPlaceCardActionsRowView _createActionsFromActionManager](self, "_createActionsFromActionManager");
}

- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[MUPlaceCardActionsRowView _buildModuleForAnalytics](self, "_buildModuleForAnalytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = *MEMORY[0x1E0CC16A8];
    objc_msgSend(v10, "sourceView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = *MEMORY[0x1E0CC16A0];
    v25[0] = v12;
    v25[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "actionRowItem");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v14, "setEnabled:", 0);
    v16 = v14;
    if (objc_msgSend(v14, "selected"))
    {
      objc_msgSend(v14, "selectedItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v14;
      if (v17)
      {
        objc_msgSend(v14, "selectedItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    -[MUPlaceCardActionsRowView actionManager](self, "actionManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __83__MUPlaceCardActionsRowView_actionsRowView_didSelectViewModel_presentationOptions___block_invoke;
    v21[3] = &unk_1E2E01730;
    v22 = v16;
    v23 = v14;
    v19 = v14;
    v20 = v16;
    objc_msgSend(v18, "performAction:options:completion:", v20, v13, v21);

  }
}

uint64_t __83__MUPlaceCardActionsRowView_actionsRowView_didSelectViewModel_presentationOptions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
}

- (void)setMenuProvider:(id)a3
{
  id v4;
  MUPlaceCardActionsRowViewMenuProvider **p_menuProvider;
  id WeakRetained;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_menuProvider = &self->_menuProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_menuProvider, v4);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_viewModels;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          v13 = objc_loadWeakRetained((id *)p_menuProvider);
          objc_msgSend(v12, "setMenuProvider:", v13, (_QWORD)v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)_createActionsFromActionManager
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int IsMacCatalyst;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  MUPlaceActionRowItemViewModel *v23;
  void *v24;
  MUPlaceActionRowItemViewModel *v25;
  void *v26;
  MUPlaceCardActionsRowView *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[MUGroupedActionsRowView viewModels](self, "viewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[MUPlaceCardActionsRowView actionManager](self, "actionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createRowActionsWithStyle:", self->_style);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self;
    if (self->_myPlacesEnabled && MapKitIdiomIsMacCatalyst())
      objc_msgSend(v8, "addObjectsFromArray:", &unk_1E2E55BE8);
    IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (IsMacCatalyst)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "resolvedActionItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "glyph");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "length");

            if (!v18)
              continue;
          }
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "resolvedActionItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "type"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v8, "containsObject:", v21);

          if ((v22 & 1) == 0)
          {
            v23 = [MUPlaceActionRowItemViewModel alloc];
            -[MUPlaceCardActionsRowView menuProvider](v27, "menuProvider");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[MUPlaceActionRowItemViewModel initWithActionRowItem:menuProvider:style:](v23, "initWithActionRowItem:menuProvider:style:", v15, v24, v27->_style);

            objc_msgSend(v28, "addObject:", v25);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v12);
    }

    v26 = (void *)objc_msgSend(v28, "copy");
    -[MUGroupedActionsRowView setViewModels:](v27, "setViewModels:", v26);

  }
}

- (int)_buttonItemTypeFromActionItem:(id)a3
{
  void *v3;
  uint64_t v4;
  int result;
  int v6;

  objc_msgSend(a3, "resolvedActionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  result = 0;
  switch(v4)
  {
    case 7:
    case 13:
      result = 6;
      break;
    case 8:
    case 9:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
      return result;
    case 10:
      result = 4;
      break;
    case 11:
      result = 5;
      break;
    case 16:
      result = 3;
      break;
    case 21:
      result = 1;
      break;
    default:
      if (v4 == 34)
        v6 = 11;
      else
        v6 = 0;
      if ((unint64_t)(v4 - 1) >= 2)
        result = v6;
      else
        result = 2;
      break;
  }
  return result;
}

- (id)_buildModuleForAnalytics
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_viewModels;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "actionRowItem", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MUPlaceCardActionsRowView _buttonItemTypeFromActionItem:](self, "_buttonItemTypeFromActionItem:", v9);

        if ((_DWORD)v10)
          objc_msgSend(v3, "addContent:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (MKPlaceActionManagerProtocol)actionManager
{
  return (MKPlaceActionManagerProtocol *)objc_loadWeakRetained((id *)&self->_actionManager);
}

- (MUPlaceCardActionsRowViewMenuProvider)menuProvider
{
  return (MUPlaceCardActionsRowViewMenuProvider *)objc_loadWeakRetained((id *)&self->_menuProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
