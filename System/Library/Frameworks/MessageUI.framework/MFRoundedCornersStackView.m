@implementation MFRoundedCornersStackView

- (MFRoundedCornersStackView)initWithFrame:(CGRect)a3
{
  MFRoundedCornersStackView *v3;
  MFRoundedCornersStackView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFRoundedCornersStackView;
  v3 = -[MFRoundedCornersStackView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MFRoundedCornersStackView setCornerRadius:](v3, "setCornerRadius:", 0.0);
  return v4;
}

- (MFRoundedCornersStackView)initWithCoder:(id)a3
{
  id v4;
  MFRoundedCornersStackView *v5;
  MFRoundedCornersStackView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFRoundedCornersStackView;
  v5 = -[MFRoundedCornersStackView initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
    -[MFRoundedCornersStackView setCornerRadius:](v5, "setCornerRadius:", 0.0);

  return v6;
}

- (void)mf_addArrangedSubviews:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[MFRoundedCornersStackView addArrangedSubview:](self, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[MFRoundedCornersStackView updateRoundedCorners](self, "updateRoundedCorners");
}

- (void)updateRoundedCorners
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void *, void *, uint64_t);
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MFRoundedCornersStackView arrangedSubviews](self, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[MFRoundedCornersStackView arrangedSubviews](self, "arrangedSubviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "layer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCornerRadius:", 0.0);

          objc_msgSend(v9, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setMaskedCorners:", 0);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__MFRoundedCornersStackView_updateRoundedCorners__block_invoke;
    aBlock[3] = &unk_1E5A69C48;
    aBlock[4] = self;
    v12 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    -[MFRoundedCornersStackView cornerRadius](self, "cornerRadius");
    if (v13 > 0.0)
    {
      v14 = -[MFRoundedCornersStackView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      if (v14 == 1)
        v15 = 10;
      else
        v15 = 5;
      if (v14 == 1)
        v16 = 5;
      else
        v16 = 10;
      -[MFRoundedCornersStackView arrangedSubviews](self, "arrangedSubviews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v18, v15);

      -[MFRoundedCornersStackView arrangedSubviews](self, "arrangedSubviews");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v20, v16);

    }
  }
}

void __49__MFRoundedCornersStackView_updateRoundedCorners__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", objc_msgSend(v5, "maskedCorners") | a3);

  objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
  v7 = v6;
  objc_msgSend(v10, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  objc_msgSend(v10, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMasksToBounds:", 1);

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

@end
