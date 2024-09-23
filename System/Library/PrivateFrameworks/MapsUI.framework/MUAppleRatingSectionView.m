@implementation MUAppleRatingSectionView

- (MUAppleRatingSectionView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUAppleRatingSectionView;
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

    -[MUAppleRatingSectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("AppleRatingSection"));
    -[MUAppleRatingSectionView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
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
  MUAppleRatingRowView *v14;
  MUAppleRatingRowView *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_viewModels, "count"));
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
        v14 = [MUAppleRatingRowView alloc];
        v15 = -[MUAppleRatingRowView initWithFrame:ratingsCountAnimationEnabled:](v14, "initWithFrame:ratingsCountAnimationEnabled:", 0, v8, v9, v10, v11, (_QWORD)v17);
        -[MUAppleRatingRowView setDirectionalLayoutMargins:](v15, "setDirectionalLayoutMargins:", 12.0, 16.0, 12.0, 16.0);
        -[MUAppleRatingRowView setViewModel:](v15, "setViewModel:", v13);
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
