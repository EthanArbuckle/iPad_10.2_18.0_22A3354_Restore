@implementation MUTextPairVerticalCardView

- (MUTextPairVerticalCardView)initWithFrame:(CGRect)a3
{
  MUTextPairVerticalCardView *v3;
  MUTextPairVerticalCardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUTextPairVerticalCardView;
  v3 = -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v6, sel_initWithShowsSeparators_, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUTextPairVerticalCardView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("TextPairVerticalCard"));
    -[MUTextPairVerticalCardView _updateInsets](v4, "_updateInsets");
  }
  return v4;
}

- (void)setViewModels:(id)a3
{
  NSArray *v4;
  NSArray *viewModels;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_viewModels, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    -[MUTextPairVerticalCardView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  MUTextPairView *v18;
  MUTextPairView *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        -[MUPlaceVerticalCardContainerView removeArrangedSubview:](self, "removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_viewModels;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        v18 = [MUTextPairView alloc];
        v19 = -[MUTextPairView initWithFrame:](v18, "initWithFrame:", v12, v13, v14, v15, (_QWORD)v20);
        -[MUTextPairView setViewModel:](v19, "setViewModel:", v17);
        -[MUStackView addArrangedSubview:](self, "addArrangedSubview:", v19);

        ++v16;
      }
      while (v10 != v16);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v10);
  }

}

- (void)_updateInsets
{
  int64_t v3;
  double v4;

  v3 = +[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle");
  v4 = 16.0;
  if (v3 == 1)
    v4 = 0.0;
  -[MUStackView setContentEdgeInsets:](self, "setContentEdgeInsets:", v4, 16.0, v4, 16.0);
}

- (void)layoutSubviews
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUTextPairVerticalCardView;
  -[MUTextPairVerticalCardView layoutSubviews](&v4, sel_layoutSubviews);
  -[MUTextPairVerticalCardView _recalculateStackingIfNeeded](self, "_recalculateStackingIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)MUTextPairVerticalCardView;
  -[MUTextPairVerticalCardView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)_recalculateStackingIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MUStackView arrangedSubviews](self, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[MUTextPairVerticalCardView bounds](self, "bounds");
        if ((objc_msgSend(v7, "shouldStackForProposedWidth:", CGRectGetWidth(v24) + -16.0 + -16.0) & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MUStackView arrangedSubviews](self, "arrangedSubviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * j), "setStacked:", v4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

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
