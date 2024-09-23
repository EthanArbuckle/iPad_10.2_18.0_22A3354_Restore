@implementation MUPlaceInfoSectionView

- (MUPlaceInfoSectionView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUPlaceInfoSectionView;
  return -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v4, sel_initWithShowsSeparators_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setViewModels:(id)a3
{
  NSArray *v4;
  NSArray *viewModels;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_viewModels, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    -[MUPlaceInfoSectionView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  MULabeledValueActionRowView *v15;
  MULabeledValueActionRowView *v16;
  MULabeledValueActionRowView *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_viewModels;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = -[MUPlaceVerticalCardContainerView isDeveloperPlaceCard](self, "isDeveloperPlaceCard", (_QWORD)v19);
        v15 = [MULabeledValueActionRowView alloc];
        if (v14)
          v16 = -[MULabeledValueActionRowView initForDeveloperPlaceCard](v15, "initForDeveloperPlaceCard");
        else
          v16 = -[MULabeledValueActionRowView initWithFrame:](v15, "initWithFrame:", v8, v9, v10, v11);
        v17 = v16;
        -[MULabeledValueActionRowView setViewModel:](v16, "setViewModel:", v13);
        objc_msgSend(v3, "addObject:", v17);

        ++v12;
      }
      while (v6 != v12);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(v3, "copy");
  -[MUPlaceVerticalCardContainerView setRowViews:](self, "setRowViews:", v18);

}

- (id)draggableContent
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MUInfoCardDraggableContent *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MUStackView arrangedSubviews](self, "arrangedSubviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = objc_alloc_init(MUInfoCardDraggableContent);
        -[MUInfoCardDraggableContent setView:](v10, "setView:", v9);
        objc_msgSend(v9, "viewModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUInfoCardDraggableContent setDraggableContent:](v10, "setDraggableContent:", v12);

        -[MUInfoCardDraggableContent setAnalyticsTarget:](v10, "setAnalyticsTarget:", objc_msgSend(v11, "analyticsTarget"));
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
