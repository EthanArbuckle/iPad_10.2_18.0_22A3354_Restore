@implementation MKPlaceCardActionItem

+ (MKPlaceCardActionItem)actionItemWithType:(unint64_t)a3 actionDataProvider:(id)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  MKPlaceActionItemAppearanceProvider *v8;
  MKPlaceCardActionItem *v9;

  v5 = a5;
  v7 = a4;
  v8 = -[MKPlaceActionItemAppearanceProvider initWithActionType:dataProvider:]([MKPlaceActionItemAppearanceProvider alloc], "initWithActionType:dataProvider:", a3, v7);

  v9 = -[MKPlaceCardActionItem initWithType:appearanceProvider:enabled:]([MKPlaceCardActionItem alloc], "initWithType:appearanceProvider:enabled:", a3, v8, v5);
  return v9;
}

+ (MKPlaceCardActionItem)actionItemWithType:(unint64_t)a3
{
  return -[MKPlaceCardActionItem initWithType:displayString:glyph:enabled:]([MKPlaceCardActionItem alloc], "initWithType:displayString:glyph:enabled:", a3, 0, 0, 1);
}

- (MKPlaceCardActionItem)initWithType:(unint64_t)a3 appearanceProvider:(id)a4 enabled:(BOOL)a5
{
  id v9;
  MKPlaceCardActionItem *v10;
  MKPlaceCardActionItem *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceCardActionItem;
  v10 = -[MKPlaceCardActionItem init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_appearanceProvider, a4);
    v11->_enabled = a5;
  }

  return v11;
}

- (MKPlaceCardActionItem)initWithType:(unint64_t)a3 displayString:(id)a4 glyph:(id)a5 enabled:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  MKPlaceActionItemCustomAppearanceProvider *v12;
  MKPlaceCardActionItem *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[MKPlaceActionItemCustomAppearanceProvider initWithActionType:overrideTitle:symbolName:]([MKPlaceActionItemCustomAppearanceProvider alloc], "initWithActionType:overrideTitle:symbolName:", a3, v11, v10);

  v13 = -[MKPlaceCardActionItem initWithType:appearanceProvider:enabled:]([MKPlaceCardActionItem alloc], "initWithType:appearanceProvider:enabled:", a3, v12, v6);
  return v13;
}

- (id)symbolForDisplayStyle:(unint64_t)a3
{
  return -[MKPlaceActionItemAppearanceProvider bestSymbolNameForDisplayStyle:](self->_appearanceProvider, "bestSymbolNameForDisplayStyle:", a3);
}

- (id)titleForDisplayStyle:(unint64_t)a3
{
  return -[MKPlaceActionItemAppearanceProvider bestTitleForDisplayStyle:](self->_appearanceProvider, "bestTitleForDisplayStyle:", a3);
}

- (BOOL)isDestructiveForDisplayStyle:(unint64_t)a3
{
  return -[MKPlaceActionItemAppearanceProvider isDestructiveForDisplayStyle:](self->_appearanceProvider, "isDestructiveForDisplayStyle:", a3);
}

- (NSString)displayString
{
  return (NSString *)-[MKPlaceCardActionItem titleForDisplayStyle:](self, "titleForDisplayStyle:", 1);
}

- (NSString)glyph
{
  -[MKPlaceCardActionItem symbolForDisplayStyle:](self, "symbolForDisplayStyle:", MapKitIdiomIsMacCatalyst());
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MKPlaceCardActionItem type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCardActionItem displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MKPlaceCardActionItem enabled](self, "enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type: %@, displayString: %@, enabled: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resolvedActionItem
{
  void *v3;
  MKPlaceCardActionItem *v4;

  if (-[MKPlaceCardActionItem selected](self, "selected")
    && (-[MKPlaceCardActionItem selectedItem](self, "selectedItem"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[MKPlaceCardActionItem selectedItem](self, "selectedItem");
    v4 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (id)menuElementWithActionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[MKPlaceCardActionItem resolvedActionItem](self, "resolvedActionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v5, "glyph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_mapkit_systemImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2A8];
  -[MKPlaceCardActionItem resolvedActionItem](self, "resolvedActionItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__MKPlaceCardActionItem_menuElementWithActionHandler___block_invoke;
  v15[3] = &unk_1E20DC430;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, v8, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __54__MKPlaceCardActionItem_menuElementWithActionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)buildActionMenuForItems:(id)a3 buildingOptions:(id)a4 menuElementCreationBlock:(id)a5
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
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerMenuElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v9, "headerMenuElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v8;
  v36 = v10;
  objc_msgSend(a1, "actionTypesToMenuElements:menuElementCreationBlock:", v8, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = v9;
  objc_msgSend(v9, "requestedActionTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  v18 = 0x1E0CEA000uLL;
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v15, "removeObjectForKey:", v22);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_12;
          v24 = v23;
          if ((objc_msgSend(v24, "options") & 1) == 0)
          {

LABEL_12:
            objc_msgSend(v14, "addObject:", v23);
            goto LABEL_17;
          }
          objc_msgSend(v11, "addObject:", v24);

        }
        else if (objc_msgSend(v22, "isEqualToNumber:", &unk_1E2158E78) && objc_msgSend(v14, "count"))
        {
          v25 = *(void **)(v18 + 1856);
          v26 = (void *)objc_msgSend(v14, "copy");
          objc_msgSend(v25, "menuWithTitle:image:identifier:options:children:", &stru_1E20DFC00, 0, 0, 1, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "addObject:", v27);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v28 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v28;
          v18 = 0x1E0CEA000;
        }
LABEL_17:

      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v19);
  }

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v11, "addObjectsFromArray:", v14);
  if (objc_msgSend(v37, "addMismatchedItems"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v15, "allValues");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v31);
    }

  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E20DFC00, v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAccessibilityIdentifier:", CFSTR("PlacecardEllipsisMenu"));
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)actionTypesToMenuElements:(id)a3 menuElementCreationBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v6[2](v6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "type", (_QWORD)v17));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (MKPlaceCardActionItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
}

@end
