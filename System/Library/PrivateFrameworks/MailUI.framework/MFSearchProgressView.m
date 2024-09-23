@implementation MFSearchProgressView

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MFSearchProgressView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (id)log_log_4;
}

void __27__MFSearchProgressView_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

- (id)_searchingFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_11, CFSTR("MFSearchProgressView.searchingFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__MFSearchProgressView__searchingFont__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)_newProgressLabelWithText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  -[MFSearchProgressView _searchingFont](self, "_searchingFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v8);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v6;
}

- (MFSearchProgressView)initWithFrame:(CGRect)a3
{
  MFSearchProgressView *v3;
  MFSearchProgressView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSearchProgressView;
  v3 = -[MFSearchProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFSearchProgressView _setupLabels](v3, "_setupLabels");
    -[MFSearchProgressView setAlpha:](v4, "setAlpha:", 0.0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[MFSearchProgressView _endCharacterAnimation](self, "_endCharacterAnimation");
  v3.receiver = self;
  v3.super_class = (Class)MFSearchProgressView;
  -[MFSearchProgressView dealloc](&v3, sel_dealloc);
}

- (void)_setupLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3CA8], "mf_baselineAlignedHorizontalStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSearchProgressView setStackView:](self, "setStackView:", v3);

  -[MFSearchProgressView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSearchProgressView addSubview:](self, "addSubview:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCHING"), &stru_1E99EB1C8, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFSearchProgressView _newProgressLabelWithText:](self, "_newProgressLabelWithText:", v6);

  -[MFSearchProgressView stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  objc_msgSend(v8, "addArrangedSubview:", v7);

  v9 = 3;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SEARCHING_ANIMATED_CHARACTER"), &stru_1E99EB1C8, CFSTR("Main"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  do
  {
    v13 = -[MFSearchProgressView _newProgressLabelWithText:](self, "_newProgressLabelWithText:", v12);
    objc_msgSend(v13, "setAlpha:", 0.0);
    objc_msgSend(v10, "addObject:", v13);
    -[MFSearchProgressView stackView](self, "stackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addArrangedSubview:", v13);

    --v9;
  }
  while (v9);
  -[MFSearchProgressView setCharacterLabels:](self, "setCharacterLabels:", v10);
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSearchProgressView topAnchor](self, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 8.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSearchProgressView leadingAnchor](self, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:constant:", v26, 8.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v25;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSearchProgressView bottomAnchor](self, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -8.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v15;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSearchProgressView trailingAnchor](self, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v17, -8.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v18;
  -[UIStackView centerXAnchor](self->_stackView, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSearchProgressView centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
}

- (void)_startCharacterAnimation
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  id v11;
  void *v12;
  double v13;
  _QWORD aBlock[4];
  id v15;
  float64x2_t v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[MFSearchProgressView log](MFSearchProgressView, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5522000, v3, OS_LOG_TYPE_DEFAULT, "Starting 'searching...' animation", buf, 2u);
  }

  -[MFSearchProgressView characterLabels](self, "characterLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8++), "setAlpha:", 0.0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v9 = (double)(unint64_t)(objc_msgSend(v4, "count") + 1) * 0.4 + 0.05;
  UIAnimationDragCoefficient();
  v13 = v9 * v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke;
  aBlock[3] = &unk_1E99E2430;
  v15 = v4;
  v16 = vdivq_f64((float64x2_t)xmmword_1D566ED60, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v13, 0));
  v17 = 0.05 / v13;
  v11 = v4;
  v12 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 8, v12, 0, v13, 0.0);

}

uint64_t __48__MFSearchProgressView__startCharacterAnimation__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke_2;
  v3[3] = &__block_descriptor_56_e23_v32__0__UIView_8Q16_B24l;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __48__MFSearchProgressView__startCharacterAnimation__block_invoke_2(double *a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a2;
  v6 = a1[5];
  v7 = a1[4] * (double)(unint64_t)(a3 + 1);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke_3;
  v16[3] = &unk_1E99E1258;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v8, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v16, v7, v6);
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v12 = a1[6];
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke_4;
  v14[3] = &unk_1E99E1258;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v14, 1.0 - v12, v12);

}

uint64_t __48__MFSearchProgressView__startCharacterAnimation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __48__MFSearchProgressView__startCharacterAnimation__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)_endCharacterAnimation
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[MFSearchProgressView log](MFSearchProgressView, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5522000, v3, OS_LOG_TYPE_DEFAULT, "Stopping 'searching...' animation", buf, 2u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MFSearchProgressView characterLabels](self, "characterLabels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAllAnimations");

        objc_msgSend(v9, "setAlpha:", 0.0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

- (void)setAnimating:(BOOL)a3 fade:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void (**v7)(_QWORD);
  uint64_t (*v8)(uint64_t, char);
  uint64_t *v9;
  void (**v10)(void *, uint64_t);
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;
  _QWORD aBlock[5];

  if (self->_animating != a3)
  {
    v4 = a4;
    self->_animating = a3;
    v6 = MEMORY[0x1E0C809B0];
    if (a3)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __42__MFSearchProgressView_setAnimating_fade___block_invoke_3;
      aBlock[3] = &unk_1E99E1258;
      aBlock[4] = self;
      v7 = (void (**)(_QWORD))_Block_copy(aBlock);
      v13 = v6;
      v8 = __42__MFSearchProgressView_setAnimating_fade___block_invoke_4;
      v9 = &v13;
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __42__MFSearchProgressView_setAnimating_fade___block_invoke_5;
      v12[3] = &unk_1E99E1258;
      v12[4] = self;
      v7 = (void (**)(_QWORD))_Block_copy(v12);
      v11 = v6;
      v8 = __42__MFSearchProgressView_setAnimating_fade___block_invoke_6;
      v9 = &v11;
    }
    v9[1] = 3221225472;
    v9[2] = (uint64_t)v8;
    v9[3] = (uint64_t)&unk_1E99E2458;
    v9[4] = (uint64_t)self;
    v10 = (void (**)(void *, uint64_t))_Block_copy(v9);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v10, 0.15);
    }
    else
    {
      v7[2](v7);
      v10[2](v10, 1);
    }

  }
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "_startCharacterAnimation");
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_6(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_endCharacterAnimation");
}

- (void)setAnimating:(BOOL)a3
{
  -[MFSearchProgressView setAnimating:fade:](self, "setAnimating:fade:", a3, 1);
}

- (void)invalidateLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureCacheIsValid");

  -[MFSearchProgressView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_filter:", &__block_literal_global_31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFSearchProgressView _searchingFont](self, "_searchingFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setFont:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

uint64_t __40__MFSearchProgressView_invalidateLayout__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSArray)characterLabels
{
  return self->_characterLabels;
}

- (void)setCharacterLabels:(id)a3
{
  objc_storeStrong((id *)&self->_characterLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterLabels, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
