@implementation CAMSemanticStyleControl

- (CAMSemanticStyleControl)initWithFrame:(CGRect)a3
{
  CAMSemanticStyleControl *v3;
  CAMSemanticStyle *v4;
  CAMSemanticStyle *semanticStyle;
  NSArray *v6;
  uint64_t v7;
  void *v8;
  NSArray *allSliders;
  NSArray *v10;
  UIButton *v11;
  UIButton *resetButton;
  void *v13;
  UILabel *v14;
  UILabel *descriptionLabel;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;
  UIView *gradientContainer;
  void *v21;
  CEKEdgeGradientView *v22;
  CEKEdgeGradientView *edgeGradients;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CAMSemanticStyleControl;
  v3 = -[CAMSemanticStyleControl initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v3)
  {
    v4 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 0);
    semanticStyle = v3->_semanticStyle;
    v3->_semanticStyle = v4;

    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    -[CAMSemanticStyleControl _createSliderForIndex:](v3, "_createSliderForIndex:", -[NSArray count](v6, "count"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        -[CAMSemanticStyleControl addSubview:](v3, "addSubview:", v8);
        -[NSArray addObject:](v6, "addObject:", v8);

        -[CAMSemanticStyleControl _createSliderForIndex:](v3, "_createSliderForIndex:", -[NSArray count](v6, "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v8);
    }
    allSliders = v3->__allSliders;
    v3->__allSliders = v6;
    v10 = v6;

    v11 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    resetButton = v3->__resetButton;
    v3->__resetButton = v11;

    -[UIButton addTarget:action:forControlEvents:](v3->__resetButton, "addTarget:action:forControlEvents:", v3, sel__handleResetButtonReleased_, 64);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v3->__resetButton, "setTintColor:", v13);

    -[CAMSemanticStyleControl addSubview:](v3, "addSubview:", v3->__resetButton);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    descriptionLabel = v3->__descriptionLabel;
    v3->__descriptionLabel = v14;

    CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_CONTROL_DESCRIPTION"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->__descriptionLabel, "setText:", v16);

    -[UILabel setTextAlignment:](v3->__descriptionLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->__descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v3->__descriptionLabel, "setNumberOfLines:", 1);
    CEKFontOfSizeAndStyle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->__descriptionLabel, "setFont:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->__descriptionLabel, "setTextColor:", v18);

    -[CAMSemanticStyleControl addSubview:](v3, "addSubview:", v3->__descriptionLabel);
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    gradientContainer = v3->__gradientContainer;
    v3->__gradientContainer = v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->__gradientContainer, "setBackgroundColor:", v21);

    -[UIView setUserInteractionEnabled:](v3->__gradientContainer, "setUserInteractionEnabled:", 0);
    v22 = (CEKEdgeGradientView *)objc_alloc_init(MEMORY[0x1E0D0D050]);
    edgeGradients = v3->__edgeGradients;
    v3->__edgeGradients = v22;

    -[CEKEdgeGradientView setUserInteractionEnabled:](v3->__edgeGradients, "setUserInteractionEnabled:", 0);
    -[CEKEdgeGradientView setEdgeGradientStyleMask](v3->__edgeGradients, "setEdgeGradientStyleMask");
    -[UIView addSubview:](v3->__gradientContainer, "addSubview:", v3->__edgeGradients);
    -[CAMSemanticStyleControl setMaskView:](v3, "setMaskView:", v3->__gradientContainer);

    -[CAMSemanticStyleControl _updateResetButtonImage](v3, "_updateResetButtonImage");
    -[CAMSemanticStyleControl _updateSubviewsVisibilityWithDuration:delay:](v3, "_updateSubviewsVisibilityWithDuration:delay:", 0.0, 0.0);
  }
  return v3;
}

- (id)_createSliderForIndex:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    if (a3 != 1)
    {
      v7 = 0;
      v6 = 0;
      goto LABEL_9;
    }
    v4 = CFSTR("SEMANTIC_STYLES_CONTROL_WARMTH");
  }
  else
  {
    v4 = CFSTR("SEMANTIC_STYLES_CONTROL_TONE");
  }
  CAMLocalizedFrameworkString(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cam_uppercaseStringWithPreferredLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D058]), "initWithTitle:", v7);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleSliderDidChangeValue_, 4096);
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v6;
}

- (void)_updateResetButtonImage
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMSemanticStyleControl traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "legibilityWeight");

  if (v4 == 1)
    v5 = CFSTR("CAMSemanticStyleResetBold");
  else
    v5 = CFSTR("CAMSemanticStyleReset");
  -[CAMSemanticStyleControl _resetButton](self, "_resetButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:forState:", v8, 0);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t i;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;

  v52 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)CAMSemanticStyleControl;
  -[CAMSemanticStyleControl layoutSubviews](&v50, sel_layoutSubviews);
  -[CAMSemanticStyleControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CAMControlDrawerButton buttonSize](CAMControlDrawerButton, "buttonSize");
  v12 = v11;
  v45 = v13;
  -[CAMSemanticStyleControl _allSliders](self, "_allSliders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intrinsicContentSize");
  v17 = v16;

  v44 = v12;
  v18 = v12 + 20.0;
  -[CAMSemanticStyleControl _allSliders](self, "_allSliders");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v22)
  {
    v23 = v22;
    v24 = (v8 + (v12 + 20.0) * -2.0 - v17 * (double)v20) / (double)(v20 + 1);
    v25 = v17 * 0.5 + v18 + v24;
    v26 = *(_QWORD *)v47;
    v27 = v17 + v24;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v47 != v26)
          objc_enumerationMutation(v21);
        v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v29, "setFrame:", v4, v6, v8, v10);
        UIRoundToViewScale();
        objc_msgSend(v29, "setCollapsedCenterX:");
        v25 = v27 + v25;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v23);
  }

  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  CGRectGetMidY(v53);
  UIRoundToViewScale();
  v31 = v30;
  -[CAMSemanticStyleControl _descriptionLabel](self, "_descriptionLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v18, v31, v8 + v18 * -2.0, 17.0);

  v54.origin.x = v4;
  v54.origin.y = v6;
  v54.size.width = v8;
  v54.size.height = v10;
  CGRectGetMidY(v54);
  UIRoundToViewScale();
  v34 = v33;
  -[CAMSemanticStyleControl _resetButton](self, "_resetButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v8 - v18, v34, v44, v45);

  -[CAMSemanticStyleControl _gradientContainer](self, "_gradientContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v4, v6, v8, v10);

  -[CAMSemanticStyleControl _edgeGradients](self, "_edgeGradients");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v4, v6, v8, v10);

  -[CAMSemanticStyleControl _edgeGradients](self, "_edgeGradients");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setContentInsets:", 28.0, 0.0, 5.0, 0.0);

  -[CAMSemanticStyleControl gradientInsets](self, "gradientInsets");
  v40 = v39;
  -[CAMSemanticStyleControl gradientInsets](self, "gradientInsets");
  v42 = v41;
  -[CAMSemanticStyleControl _edgeGradients](self, "_edgeGradients");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setGradientDimensions:", v40, v8 * 0.1, v8 * 0.1, v42);

}

- (void)setSemanticStyle:(id)a3
{
  -[CAMSemanticStyleControl setSemanticStyle:animated:](self, "setSemanticStyle:animated:", a3, 0);
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    -[CAMSemanticStyleControl _updateSlidersAnimated:](self, "_updateSlidersAnimated:", v4);
    v7 = 0.3;
    if (!v4)
      v7 = 0.0;
    -[CAMSemanticStyleControl _updateSubviewsVisibilityWithDuration:delay:](self, "_updateSubviewsVisibilityWithDuration:delay:", v7);
  }

}

- (void)_updateSlidersAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CAMSemanticStyle *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[CAMSemanticStyleControl semanticStyle](self, "semanticStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleControl _allSliders](self, "_allSliders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isCustomizable");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12++), "setUserInteractionEnabled:", v7, (_QWORD)v23);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  -[CAMSemanticStyleControl _resetButton](self, "_resetButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInteractionEnabled:", v7);

  if ((_DWORD)v7)
  {
    v14 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", objc_msgSend(v5, "presetType"));
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneBias");
    objc_msgSend(v15, "setValue:animated:", v3);

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "warmthBias");
    objc_msgSend(v16, "setValue:animated:", v3);

    -[CAMSemanticStyle sceneBias](v14, "sceneBias");
    v18 = v17;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMarkedValue:", v18);

    -[CAMSemanticStyle warmthBias](v14, "warmthBias");
    v21 = v20;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMarkedValue:", v21);

  }
}

- (void)setGradientInsets:(id)a3
{
  double var1;
  double var0;
  $EA4D17EC7EF19748977D62946CF719EB *p_gradientInsets;

  var1 = a3.var1;
  var0 = a3.var0;
  p_gradientInsets = &self->_gradientInsets;
  if ((CEKEdgeInsetsEqualToInsets() & 1) == 0)
  {
    p_gradientInsets->startInset = var0;
    p_gradientInsets->endInset = var1;
    -[CAMSemanticStyleControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateSubviewsVisibilityWithDuration:(double)a3 delay:(double)a4
{
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  CAMSemanticStyleControl *v19;
  uint64_t *v20;
  char v21;
  BOOL v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  -[CAMSemanticStyleControl semanticStyle](self, "semanticStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCustomizable");

  -[CAMSemanticStyleControl _allSliders](self, "_allSliders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v27 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke;
  v23[3] = &unk_1EA329780;
  v23[4] = &v24;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);
  -[CAMSemanticStyleControl semanticStyle](self, "semanticStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ 1;
  if (objc_msgSend(v11, "isCustomized"))
    v13 = *((_BYTE *)v25 + 24) == 0;
  else
    v13 = 0;

  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke_2;
  aBlock[3] = &unk_1EA3297A8;
  v14 = v9;
  v19 = self;
  v20 = &v24;
  v21 = v12;
  v18 = v14;
  v22 = v13;
  v15 = _Block_copy(aBlock);
  v16 = v15;
  if (a3 == 0.0 && a4 == 0.0)
    (*((void (**)(void *))v15 + 2))(v15);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v15, 0, a3, a4);

  _Block_object_dispose(&v24, 8);
}

uint64_t __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "expanded");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
          && !objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "expanded", (_QWORD)v15)
          || *(_BYTE *)(a1 + 56))
        {
          v8 = 0.0;
        }
        else
        {
          v8 = 1.0;
        }
        objc_msgSend(v7, "setAlpha:", v8, (_QWORD)v15);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(a1 + 57))
    v9 = 1.0;
  else
    v9 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "_resetButton", (_QWORD)v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  if (*(_BYTE *)(a1 + 56))
    v11 = 1.0;
  else
    v11 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "_descriptionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v11);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_gradientContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

}

- (void)_handleSliderDidChangeValue:(id)a3
{
  CAMSemanticStyle *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CAMSemanticStyle *v12;
  id v13;

  -[CAMSemanticStyleControl _allSliders](self, "_allSliders", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [CAMSemanticStyle alloc];
  -[CAMSemanticStyleControl semanticStyle](self, "semanticStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "presetType");
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v12 = -[CAMSemanticStyle initWithPresetType:sceneBias:warmthBias:](v4, "initWithPresetType:sceneBias:warmthBias:", v6, v9, v11);
  -[CAMSemanticStyleControl setSemanticStyle:](self, "setSemanticStyle:", v12);

  -[CAMSemanticStyleControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_handleResetButtonReleased:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_CONTROL_RESET_CONFIRM_FORMAT"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[CAMSemanticStyleControl semanticStyle](self, "semanticStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presetDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMSemanticStyleControl becomeFirstResponder](self, "becomeFirstResponder");
  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39E8]), "initWithTitle:action:", v9, sel__handleResetMenuItem_);
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMenuItems:", v12);

  objc_msgSend(v4, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  objc_msgSend(v10, "showMenuFromView:rect:", v4);

}

- (void)_handleResetMenuItem:(id)a3
{
  CAMSemanticStyle *v4;
  void *v5;
  CAMSemanticStyle *v6;

  v4 = [CAMSemanticStyle alloc];
  -[CAMSemanticStyleControl semanticStyle](self, "semanticStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMSemanticStyle initWithPresetType:](v4, "initWithPresetType:", objc_msgSend(v5, "presetType"));

  -[CAMSemanticStyleControl setSemanticStyle:animated:](self, "setSemanticStyle:animated:", v6, 1);
  -[CAMSemanticStyleControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[CAMSemanticStyleControl semanticStyle](self, "semanticStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCustomized");

  return v3;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  v6 = (void *)MEMORY[0x1E0DC39D8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedMenuController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hideMenu");

  v11.receiver = self;
  v11.super_class = (Class)CAMSemanticStyleControl;
  LOBYTE(self) = -[CAMSemanticStyleControl beginTrackingWithTouch:withEvent:](&v11, sel_beginTrackingWithTouch_withEvent_, v8, v7);

  return (char)self;
}

- (void)sliderWillExpand:(id)a3
{
  id v3;

  -[CAMSemanticStyleControl _updateSubviewsVisibilityWithDuration:delay:](self, "_updateSubviewsVisibilityWithDuration:delay:", a3, 0.2, 0.0);
  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideMenu");

}

- (void)sliderWillCollapse:(id)a3
{
  -[CAMSemanticStyleControl _updateSubviewsVisibilityWithDuration:delay:](self, "_updateSubviewsVisibilityWithDuration:delay:", a3, 0.2, 0.15);
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets
{
  double startInset;
  double endInset;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  startInset = self->_gradientInsets.startInset;
  endInset = self->_gradientInsets.endInset;
  result.var1 = endInset;
  result.var0 = startInset;
  return result;
}

- (NSArray)_allSliders
{
  return self->__allSliders;
}

- (UILabel)_descriptionLabel
{
  return self->__descriptionLabel;
}

- (UIButton)_resetButton
{
  return self->__resetButton;
}

- (UIView)_gradientContainer
{
  return self->__gradientContainer;
}

- (CEKEdgeGradientView)_edgeGradients
{
  return self->__edgeGradients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__edgeGradients, 0);
  objc_storeStrong((id *)&self->__gradientContainer, 0);
  objc_storeStrong((id *)&self->__resetButton, 0);
  objc_storeStrong((id *)&self->__descriptionLabel, 0);
  objc_storeStrong((id *)&self->__allSliders, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
}

@end
