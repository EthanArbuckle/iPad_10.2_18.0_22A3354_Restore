@implementation MUActionGroupSectionView

- (MUActionGroupSectionView)initWithFrame:(CGRect)a3
{
  void *v4;
  int IsMacCatalyst;
  double v6;
  double v7;
  objc_class *v8;
  void *v9;
  void *v10;
  MUActionGroupSectionView *v11;

  +[MUPlaceVerticalCardConfiguration separatorConfiguration](MUPlaceVerticalCardConfiguration, "separatorConfiguration", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v6 = 16.0;
  if (IsMacCatalyst)
    v7 = 16.0;
  else
    v7 = 0.0;
  if (!IsMacCatalyst)
    v6 = 56.0;
  objc_msgSend(v4, "setBottomSeparatorInset:", 0.0, v6, 0.0, v7);
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MU"), &stru_1E2E05448);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUActionGroupSectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

  v11 = -[MUActionGroupSectionView initWithConfiguration:](self, "initWithConfiguration:", v4);
  return v11;
}

- (MUActionGroupSectionView)initWithConfiguration:(id)a3
{
  id v4;
  int IsMacCatalyst;
  double v6;
  double v7;
  MUActionGroupSectionView *v8;
  objc_super v10;

  v4 = a3;
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v6 = 16.0;
  if (IsMacCatalyst)
    v7 = 16.0;
  else
    v7 = 0.0;
  if (!IsMacCatalyst)
    v6 = 56.0;
  objc_msgSend(v4, "setBottomSeparatorInset:", 0.0, v6, 0.0, v7);
  v10.receiver = self;
  v10.super_class = (Class)MUActionGroupSectionView;
  v8 = -[MUPlaceVerticalCardContainerView initWithConfiguration:](&v10, sel_initWithConfiguration_, v4);

  return v8;
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

    -[MUActionGroupSectionView _updateAppearance](self, "_updateAppearance");
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
  MUButtonCellRowView *v14;
  MUButtonCellRowView *v15;
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
        v14 = [MUButtonCellRowView alloc];
        v15 = -[MUButtonCellRowView initWithFrame:](v14, "initWithFrame:", v8, v9, v10, v11, (_QWORD)v17);
        -[MUButtonCellRowView setViewModel:](v15, "setViewModel:", v13);
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

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
