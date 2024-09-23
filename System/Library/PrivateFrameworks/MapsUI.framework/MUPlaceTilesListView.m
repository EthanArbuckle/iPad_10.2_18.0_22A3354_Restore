@implementation MUPlaceTilesListView

- (MUPlaceTilesListView)initWithFrame:(CGRect)a3
{
  MUPlaceTilesListView *v3;
  MUPlaceTilesListView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTilesListView;
  v3 = -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v6, sel_initWithShowsSeparators_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUPlaceTilesListView _commonInit](v3, "_commonInit");
  return v4;
}

- (MUPlaceTilesListView)initWithConfiguration:(id)a3
{
  MUPlaceTilesListView *v3;
  MUPlaceTilesListView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTilesListView;
  v3 = -[MUPlaceVerticalCardContainerView initWithConfiguration:](&v6, sel_initWithConfiguration_, a3);
  v4 = v3;
  if (v3)
    -[MUPlaceTilesListView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  -[MUPlaceVerticalCardContainerView setDelegate:](self, "setDelegate:", self);
  -[MUPlaceTilesListView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("PlaceTilesList"));
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

    -[MUPlaceTilesListView _updateAppearance](self, "_updateAppearance");
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
  MUPlaceTileListContentView *v14;
  MUPlaceTileListContentView *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_viewModels;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = [MUPlaceTileListContentView alloc];
        v15 = -[MUPlaceTileListContentView initWithFrame:](v14, "initWithFrame:", v8, v9, v10, v11, (_QWORD)v17);
        -[MUPlaceTileListContentView setViewModel:](v15, "setViewModel:", v13);
        objc_msgSend(v3, "addObject:", v15);

        ++v12;
      }
      while (v6 != v12);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  -[MUPlaceVerticalCardContainerView setRowViews:](self, "setRowViews:", v16);

}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  void *v6;
  id v7;

  -[NSArray objectAtIndexedSubscript:](self->_viewModels, "objectAtIndexedSubscript:", a5, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTilesListView listFeedbackDelegate](self, "listFeedbackDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeTilesListView:didSelectViewModel:", self, v7);

}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(unint64_t)a4
{
  return 1;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (MUPlaceTilesListViewDelegate)listFeedbackDelegate
{
  return (MUPlaceTilesListViewDelegate *)objc_loadWeakRetained((id *)&self->_listFeedbackDelegate);
}

- (void)setListFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listFeedbackDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listFeedbackDelegate);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
