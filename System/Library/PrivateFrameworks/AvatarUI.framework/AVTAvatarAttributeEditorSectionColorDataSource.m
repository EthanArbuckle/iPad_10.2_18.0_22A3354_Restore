@implementation AVTAvatarAttributeEditorSectionColorDataSource

+ (id)selectedItemFromItems:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isSelected", (_QWORD)v9) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (int64_t)indexOfItem:(id)a3 inItems:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__AVTAvatarAttributeEditorSectionColorDataSource_indexOfItem_inItems___block_invoke;
  v9[3] = &unk_1EA51F800;
  v10 = v5;
  v6 = v5;
  v7 = objc_msgSend(a4, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __70__AVTAvatarAttributeEditorSectionColorDataSource_indexOfItem_inItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (AVTAvatarAttributeEditorSectionColorDataSource)init
{
  AVTAvatarAttributeEditorSectionColorDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorSectionColorDataSource;
  result = -[AVTAvatarAttributeEditorSectionColorDataSource init](&v3, sel_init);
  if (result)
    *(int64x2_t *)&result->_selectedPrimaryColorIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return result;
}

- (void)setColorSection:(id)a3
{
  AVTAvatarAttributeEditorColorSection *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  AVTAvatarAttributeEditorColorSection *v15;

  v5 = (AVTAvatarAttributeEditorColorSection *)a3;
  if (self->_colorSection != v5)
  {
    v15 = v5;
    -[AVTAvatarAttributeEditorColorSection identifier](v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorColorSection identifier](self->_colorSection, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    objc_storeStrong((id *)&self->_colorSection, a3);
    if ((v8 & 1) == 0)
      -[AVTAvatarAttributeEditorSectionColorDataSource resetToDefaultDisplayMode](self, "resetToDefaultDisplayMode");
    v9 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorColorSection primaryItems](v15, "primaryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedItemFromItems:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 || -[AVTAvatarAttributeEditorColorSection alwaysShowExtended](v15, "alwaysShowExtended"))
    {
      v12 = (void *)objc_opt_class();
      -[AVTAvatarAttributeEditorColorSection extendedItems](v15, "extendedItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedItemFromItems:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    -[AVTAvatarAttributeEditorSectionColorDataSource updateSelectedIndexesSelectingItem:fromUserInteraction:](self, "updateSelectedIndexesSelectingItem:fromUserInteraction:", v11, 0);

    v5 = v15;
  }

}

- (int64_t)selectedItemIndex
{
  void *v4;
  int64_t v5;

  if (-[AVTAvatarAttributeEditorSectionColorDataSource isShowingExtended](self, "isShowingExtended"))
    return -[AVTAvatarAttributeEditorSectionColorDataSource selectedExtendedColorIndex](self, "selectedExtendedColorIndex");
  if (-[AVTAvatarAttributeEditorSectionColorDataSource selectedPrimaryColorIndex](self, "selectedPrimaryColorIndex") != 0x7FFFFFFFFFFFFFFFLL
    || -[AVTAvatarAttributeEditorSectionColorDataSource selectedExtendedColorIndex](self, "selectedExtendedColorIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    return -[AVTAvatarAttributeEditorSectionColorDataSource selectedPrimaryColorIndex](self, "selectedPrimaryColorIndex");
  }
  -[AVTAvatarAttributeEditorSectionColorDataSource indexPathOfExtendedIcon](self, "indexPathOfExtendedIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "item");

  return v5;
}

- (void)updateSelectedIndexesSelectingItem:(id)a3 fromUserInteraction:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  id v19;

  v4 = a4;
  v19 = a3;
  v6 = -[AVTAvatarAttributeEditorSectionColorDataSource selectedItemIndex](self, "selectedItemIndex");
  if (v19)
  {
    v7 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorDataSource setSelectedPrimaryColorIndex:](self, "setSelectedPrimaryColorIndex:", objc_msgSend(v7, "indexOfItem:inItems:", v19, v9));

    v10 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extendedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorDataSource setSelectedExtendedColorIndex:](self, "setSelectedExtendedColorIndex:", objc_msgSend(v10, "indexOfItem:inItems:", v19, v12));

  }
  else
  {
    -[AVTAvatarAttributeEditorSectionColorDataSource setSelectedPrimaryColorIndex:](self, "setSelectedPrimaryColorIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[AVTAvatarAttributeEditorSectionColorDataSource setSelectedExtendedColorIndex:](self, "setSelectedExtendedColorIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  v13 = -[AVTAvatarAttributeEditorSectionColorDataSource selectedItemIndex](self, "selectedItemIndex");
  if (v13 != v6 || v4)
  {
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AVTAvatarAttributeEditorSectionColorDataSource delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "colorDataSource:didDeselectItemAtIndex:shouldReloadModel:", self, v6, v4);

    }
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AVTAvatarAttributeEditorSectionColorDataSource delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "colorDataSource:didSelectItemAtIndex:shouldReloadModel:", self, -[AVTAvatarAttributeEditorSectionColorDataSource selectedItemIndex](self, "selectedItemIndex"), v4);

    }
  }
  v16 = !-[AVTAvatarAttributeEditorSectionColorDataSource isShowingExtended](self, "isShowingExtended")
     && -[AVTAvatarAttributeEditorSectionColorDataSource selectedPrimaryColorIndex](self, "selectedPrimaryColorIndex") == 0x7FFFFFFFFFFFFFFFLL;
  v17 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingSlider](self, "isShowingSlider");
  v18 = v13 == 0x7FFFFFFFFFFFFFFFLL || v16;
  if (v17 && v18)
    -[AVTAvatarAttributeEditorSectionColorDataSource toggleSliderMode](self, "toggleSliderMode");

}

- (void)setDisplayMode:(int64_t)a3
{
  int64_t v5;
  id v6;

  if (self->_displayMode != a3)
  {
    v5 = -[AVTAvatarAttributeEditorSectionColorDataSource displayMode](self, "displayMode");
    self->_displayMode = a3;
    -[AVTAvatarAttributeEditorSectionColorDataSource delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorDataSource:didChangeDisplayMode:previousDisplayMode:", self, a3, v5);

  }
}

- (BOOL)isShowingSlider
{
  return (-[AVTAvatarAttributeEditorSectionColorDataSource displayMode](self, "displayMode") & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)isShowingExtended
{
  return (-[AVTAvatarAttributeEditorSectionColorDataSource displayMode](self, "displayMode") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)toggleSliderMode
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingSlider](self, "isShowingSlider");
  v4 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingExtended](self, "isShowingExtended");
  v5 = 2;
  if (!v3)
    v5 = 3;
  if (v4)
    v6 = v5;
  else
    v6 = !v3;
  -[AVTAvatarAttributeEditorSectionColorDataSource setDisplayMode:](self, "setDisplayMode:", v6);
}

- (void)toggleExtendedMode
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingSlider](self, "isShowingSlider");
  v4 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingExtended](self, "isShowingExtended");
  v5 = 2;
  if (v3)
    v5 = 3;
  if (v4)
    v6 = v3;
  else
    v6 = v5;
  -[AVTAvatarAttributeEditorSectionColorDataSource setDisplayMode:](self, "setDisplayMode:", v6);
}

- (void)resetToDefaultDisplayMode
{
  void *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "alwaysShowExtended"))
  {
    -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "primaryItems");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "count"))
        goto LABEL_12;
    }
    -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extendedItems");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "extendedItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v8)
      {

      }
      if (v14)
        goto LABEL_3;
LABEL_14:
      v6 = 0;
      goto LABEL_15;
    }

    if (v8)
    {
LABEL_12:

    }
    goto LABEL_14;
  }

LABEL_3:
  v6 = 2;
LABEL_15:
  -[AVTAvatarAttributeEditorSectionColorDataSource setDisplayMode:](self, "setDisplayMode:", v6);
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingExtended](self, "isShowingExtended");
  -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    v6 = objc_msgSend(v9, "count");

LABEL_7:
    return v6;
  }
  if (!v9)
    goto LABEL_7;
  -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extendedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
    ++v6;
  return v6;
}

- (id)sectionItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorDataSource indexPathOfExtendedIcon](self, "indexPathOfExtendedIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    v3 = 0;
    if ((v8 & 1) == 0)
    {
      v9 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingExtended](self, "isShowingExtended");
      -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
        objc_msgSend(v10, "extendedItems");
      else
        objc_msgSend(v10, "primaryItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count") <= (unint64_t)a3)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Index of out of currently showing colors bounds"));
      objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (void)selectSectionItemAtIndexPath:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  char v12;
  id v13;

  v13 = a3;
  -[AVTAvatarAttributeEditorSectionColorDataSource indexPathOfExtendedIcon](self, "indexPathOfExtendedIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v13, "isEqual:", v4);

  if (v5)
  {
    -[AVTAvatarAttributeEditorSectionColorDataSource toggleExtendedMode](self, "toggleExtendedMode");
    -[AVTAvatarAttributeEditorSectionColorDataSource sectionItemAtIndex:](self, "sectionItemAtIndex:", -[AVTAvatarAttributeEditorSectionColorDataSource selectedItemIndex](self, "selectedItemIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[AVTAvatarAttributeEditorSectionColorDataSource selectedItemIndex](self, "selectedItemIndex");
    v8 = objc_msgSend(v13, "row");
    -[AVTAvatarAttributeEditorSectionColorDataSource sectionItemAtIndex:](self, "sectionItemAtIndex:", objc_msgSend(v13, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "canShowSlider");

    v11 = -[AVTAvatarAttributeEditorSectionColorDataSource isShowingSlider](self, "isShowingSlider");
    if (v7 == v8)
      v12 = 0;
    else
      v12 = v10;
    if (v11 && (v12 & 1) == 0
      || !-[AVTAvatarAttributeEditorSectionColorDataSource isShowingSlider](self, "isShowingSlider")
      && ((v10 ^ 1) & 1) == 0)
    {
      -[AVTAvatarAttributeEditorSectionColorDataSource toggleSliderMode](self, "toggleSliderMode");
    }
  }
  -[AVTAvatarAttributeEditorSectionColorDataSource updateSelectedIndexesSelectingItem:fromUserInteraction:](self, "updateSelectedIndexesSelectingItem:fromUserInteraction:", v6, 1);

}

- (id)indexPathOfExtendedIcon
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (-[AVTAvatarAttributeEditorSectionColorDataSource isShowingExtended](self, "isShowingExtended"))
    goto LABEL_6;
  -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedItems");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_6;
  }
  v5 = (void *)v4;
  -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
LABEL_6:
    v12 = 0;
    return v12;
  }
  -[AVTAvatarAttributeEditorSectionColorDataSource colorSection](self, "colorSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (AVTAvatarAttributeEditorColorSection)colorSection
{
  return self->_colorSection;
}

- (AVTAvatarAttributeEditorSectionColorDataSourceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AVTAvatarAttributeEditorSectionColorDataSourceDelegate *)a3;
}

- (int64_t)selectedPrimaryColorIndex
{
  return self->_selectedPrimaryColorIndex;
}

- (void)setSelectedPrimaryColorIndex:(int64_t)a3
{
  self->_selectedPrimaryColorIndex = a3;
}

- (int64_t)selectedExtendedColorIndex
{
  return self->_selectedExtendedColorIndex;
}

- (void)setSelectedExtendedColorIndex:(int64_t)a3
{
  self->_selectedExtendedColorIndex = a3;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSection, 0);
}

@end
