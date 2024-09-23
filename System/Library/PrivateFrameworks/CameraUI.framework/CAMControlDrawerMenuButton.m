@implementation CAMControlDrawerMenuButton

+ (id)_backgroundImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CAMControlDrawerMenuButton__backgroundImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_backgroundImage_onceToken_214 != -1)
    dispatch_once(&_backgroundImage_onceToken_214, block);
  return (id)_backgroundImage_resizableBackgroundImage;
}

void __46__CAMControlDrawerMenuButton__backgroundImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___CAMControlDrawerMenuButton;
  objc_msgSendSuper2(&v6, sel__backgroundImage);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_backgroundImage_resizableBackgroundImage;
  _backgroundImage_resizableBackgroundImage = v1;

  objc_msgSend((id)_backgroundImage_resizableBackgroundImage, "size");
  objc_msgSend((id)_backgroundImage_resizableBackgroundImage, "resizableImageWithCapInsets:", 0.0, v3 * 0.5, 0.0, v3 * 0.5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_backgroundImage_resizableBackgroundImage;
  _backgroundImage_resizableBackgroundImage = v4;

}

- (CAMControlDrawerMenuButton)initWithLayoutStyle:(int64_t)a3
{
  CAMControlDrawerMenuButton *v3;
  uint64_t v4;
  NSMutableArray *itemLabels;
  id v6;
  void *v7;
  uint64_t v8;
  UIImageView *accessoryBackgroundView;
  UIImageView *v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMControlDrawerMenuButton;
  v3 = -[CAMControlDrawerButton initWithLayoutStyle:](&v14, sel_initWithLayoutStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    itemLabels = v3->__itemLabels;
    v3->__itemLabels = (NSMutableArray *)v4;

    v3->__trackedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3->__needsLoadMenuItems = 1;
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    v13.receiver = v3;
    v13.super_class = (Class)CAMControlDrawerMenuButton;
    objc_msgSend(-[CAMControlDrawerMenuButton class](&v13, sel_class), "_backgroundImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithImage:", v7);
    accessoryBackgroundView = v3->__accessoryBackgroundView;
    v3->__accessoryBackgroundView = (UIImageView *)v8;

    v10 = v3->__accessoryBackgroundView;
    -[CAMControlDrawerButton _imageView](v3, "_imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawerMenuButton insertSubview:belowSubview:](v3, "insertSubview:belowSubview:", v10, v11);

    -[CAMControlDrawerMenuButton _updateSubviewAlphas](v3, "_updateSubviewAlphas");
  }
  return v3;
}

- (BOOL)isExpandable
{
  return 1;
}

- (BOOL)shouldScaleImageWhileHighlighted
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  double v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double MaxX;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  CGFloat v54;
  CGFloat v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v72 = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)CAMControlDrawerMenuButton;
  -[CAMControlDrawerButton layoutSubviews](&v68, sel_layoutSubviews);
  -[CAMControlDrawerMenuButton _itemLabels](self, "_itemLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAMControlDrawerButton _slashView](self, "_slashView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerButton _imageView](self, "_imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = v15;
  v18 = v17;
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded"))
  {
    -[CAMControlDrawerMenuButton expansionInsets](self, "expansionInsets");
    v19 = 0.0;
    v55 = v12;
    UIRectInset();
    v8 = v20;
    v22 = v21;
    v24 = v23;
    v54 = v25;
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v14, "bounds");
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v14, "setCenter:");
    objc_msgSend(v13, "bounds");
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v26 = v3;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v65 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "bounds");
          v19 = v19 + v31;
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v28);
    }

    objc_msgSend(v26, "count");
    objc_msgSend(v4, "image");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "size");

    v73.size.height = v55;
    v73.origin.x = v54;
    v73.origin.y = v8;
    v73.size.width = v10;
    CGRectGetMaxX(v73);
    v74.origin.x = v54;
    v74.origin.y = v8;
    v74.size.width = v22;
    v74.size.height = v24;
    CGRectGetMidY(v74);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v33 = v26;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v61 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_msgSend(v38, "bounds");
          UIRectIntegralWithScale();
          v40 = v39;
          v42 = v41;
          v44 = v43;
          v46 = v45;
          UIRectGetCenter();
          objc_msgSend(v38, "setCenter:");
          v75.origin.x = v40;
          v75.origin.y = v42;
          v75.size.width = v44;
          v75.size.height = v46;
          MaxX = CGRectGetMaxX(v75);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v70, 16, MaxX);
      }
      while (v35);
    }

    v6 = v54;
    v12 = v55;
  }
  else
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v48 = v3;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v57 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "setCenter:", v16, v18);
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v50);
    }

  }
  -[CAMControlDrawerMenuButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v6, v8, v10, v12);

}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMControlDrawerMenuButton;
  -[CAMControlDrawerButton setOrientation:animated:](&v8, sel_setOrientation_animated_, a3, a4);
  if ((unint64_t)(a3 - 1) <= 1)
  {
    -[CAMControlDrawerMenuButton _itemLabels](self, "_itemLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__CAMControlDrawerMenuButton_setOrientation_animated___block_invoke;
    v7[3] = &__block_descriptor_40_e24_v32__0__UILabel_8Q16_B24l;
    v7[4] = a3;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  }
}

uint64_t __54__CAMControlDrawerMenuButton_setOrientation_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", a2, *(_QWORD *)(a1 + 32), 0);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  _BOOL4 v7;
  objc_super v9;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)CAMControlDrawerMenuButton;
  if (-[CAMControlDrawerMenuButton pointInside:withEvent:](&v9, sel_pointInside_withEvent_, a4))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v7 = -[CAMControlDrawerMenuButton isExpanded](self, "isExpanded");
    if (v7)
    {
      -[CAMControlDrawerMenuButton expansionInsets](self, "expansionInsets");
      -[CAMControlDrawerMenuButton bounds](self, "bounds");
      UIRectInset();
      v10.x = x;
      v10.y = y;
      LOBYTE(v7) = CGRectContainsPoint(v11, v10);
    }
  }
  return v7;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL8 v13;
  BOOL v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded"))
  {
    objc_msgSend(v6, "locationInView:", self);
    v9 = v8;
    v11 = v10;
    -[CAMControlDrawerMenuButton _setTrackedItemIndex:](self, "_setTrackedItemIndex:", -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:"));
    -[CAMControlDrawerMenuButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawerMenuButton _setTrackingExpansionToggle:](self, "_setTrackingExpansionToggle:", -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11));

  }
  else
  {
    -[CAMControlDrawerMenuButton _setTrackingExpansionToggle:](self, "_setTrackingExpansionToggle:", 1);
  }
  v13 = -[CAMControlDrawerMenuButton _isTrackingExpansionToggle](self, "_isTrackingExpansionToggle")
     || -[CAMControlDrawerMenuButton _trackedItemIndex](self, "_trackedItemIndex") != 0x7FFFFFFFFFFFFFFFLL;
  -[CAMControlDrawerMenuButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", v13);
  -[CAMControlDrawerMenuButton _updateHighlightedView](self, "_updateHighlightedView");
  v16.receiver = self;
  v16.super_class = (Class)CAMControlDrawerMenuButton;
  v14 = -[CAMControlDrawerMenuButton beginTrackingWithTouch:withEvent:](&v16, sel_beginTrackingWithTouch_withEvent_, v6, v7);

  return v14;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL8 v13;
  BOOL v14;
  unint64_t v16;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  if (!-[CAMControlDrawerMenuButton isTouchInside](self, "isTouchInside"))
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  if (!-[CAMControlDrawerMenuButton _isTrackingExpansionToggle](self, "_isTrackingExpansionToggle"))
  {
    if (-[CAMControlDrawerMenuButton _trackedItemIndex](self, "_trackedItemIndex") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = -[CAMControlDrawerMenuButton _trackedItemIndex](self, "_trackedItemIndex");
      v13 = v16 == -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v9, v11);
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  -[CAMControlDrawerMenuButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11);

LABEL_6:
  -[CAMControlDrawerMenuButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", v13);
  -[CAMControlDrawerMenuButton _updateHighlightedView](self, "_updateHighlightedView");
  v17.receiver = self;
  v17.super_class = (Class)CAMControlDrawerMenuButton;
  v14 = -[CAMControlDrawerMenuButton continueTrackingWithTouch:withEvent:](&v17, sel_continueTrackingWithTouch_withEvent_, v7, v6);

  return v14;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  CAMControlDrawerMenuButton *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded")
    && -[CAMControlDrawerMenuButton _isTouchInTrackedView](self, "_isTouchInTrackedView"))
  {
    objc_msgSend(v6, "locationInView:", self);
    v9 = v8;
    v11 = v10;
    if (-[CAMControlDrawerMenuButton _isTrackingExpansionToggle](self, "_isTrackingExpansionToggle"))
    {
      -[CAMControlDrawerMenuButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11);

      v14 = !v13;
      v15 = self;
LABEL_8:
      -[CAMControlDrawerMenuButton _setExpanded:animated:shouldNotify:](v15, "_setExpanded:animated:shouldNotify:", v14, 1, 1);
      goto LABEL_9;
    }
    if (-[CAMControlDrawerMenuButton _trackedItemIndex](self, "_trackedItemIndex") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v9, v11);
      if (v16 == -[CAMControlDrawerMenuButton _trackedItemIndex](self, "_trackedItemIndex"))
      {
        -[CAMControlDrawerMenuButton _cachedMenuItems](self, "_cachedMenuItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[CAMControlDrawerMenuButton didSelectMenuItem:](self, "didSelectMenuItem:", v18);
        -[CAMControlDrawerMenuButton delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "menuButtonDidSelectItem:", self);

        -[CAMControlDrawerMenuButton _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", 0, 1, 1);
      }
    }
  }
  else if (-[CAMControlDrawerMenuButton _isTouchInTrackedView](self, "_isTouchInTrackedView")
         && -[CAMControlDrawerMenuButton isExpandable](self, "isExpandable"))
  {
    v15 = self;
    v14 = 1;
    goto LABEL_8;
  }
LABEL_9:
  -[CAMControlDrawerMenuButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", 0);
  -[CAMControlDrawerMenuButton _setTrackingExpansionToggle:](self, "_setTrackingExpansionToggle:", 0);
  -[CAMControlDrawerMenuButton _setTrackedItemIndex:](self, "_setTrackedItemIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[CAMControlDrawerMenuButton _updateHighlightedView](self, "_updateHighlightedView");
  v20.receiver = self;
  v20.super_class = (Class)CAMControlDrawerMenuButton;
  -[CAMControlDrawerMenuButton endTrackingWithTouch:withEvent:](&v20, sel_endTrackingWithTouch_withEvent_, v6, v7);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CAMControlDrawerMenuButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", 0);
  -[CAMControlDrawerMenuButton _setTrackingExpansionToggle:](self, "_setTrackingExpansionToggle:", 0);
  -[CAMControlDrawerMenuButton _setTrackedItemIndex:](self, "_setTrackedItemIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[CAMControlDrawerMenuButton _updateHighlightedView](self, "_updateHighlightedView");
  v5.receiver = self;
  v5.super_class = (Class)CAMControlDrawerMenuButton;
  -[CAMControlDrawerMenuButton cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, v4);

}

- (unint64_t)_indexOfItemToTrackForTouchAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  unint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  y = a3.y;
  x = a3.x;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded"))
  {
    -[CAMControlDrawerMenuButton _itemLabels](self, "_itemLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__CAMControlDrawerMenuButton__indexOfItemToTrackForTouchAtLocation___block_invoke;
    v9[3] = &unk_1EA32D688;
    *(CGFloat *)&v9[6] = x;
    *(CGFloat *)&v9[7] = y;
    v9[4] = self;
    v9[5] = &v10;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __68__CAMControlDrawerMenuButton__indexOfItemToTrackForTouchAtLocation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldTrackView:forTouchAtLocation:", a2, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_shouldTrackView:(id)a3 forTouchAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGPoint v18;
  CGRect v19;
  CGRect v20;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "origin");
  v16 = v15;

  v19.origin.x = v8;
  v19.origin.y = v10;
  v19.size.width = v12;
  v19.size.height = v14;
  v20 = CGRectInset(v19, -20.0, -v16);
  v18.x = x;
  v18.y = y;
  return CGRectContainsPoint(v20, v18);
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;

  v4 = a3;
  objc_msgSend(v4, "locationOfAccessibilityGestureInView:", self);
  v6 = v5;
  v8 = v7;
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded")
    && (-[CAMControlDrawerMenuButton _accessoryBackgroundView](self, "_accessoryBackgroundView"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v9, v6, v8), v9, !v10))
  {
    if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded")
      && (v12 = -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v6, v8), v12 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v13 = v12;
      -[CAMControlDrawerMenuButton _cachedMenuItems](self, "_cachedMenuItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v18.receiver = self;
      v18.super_class = (Class)CAMControlDrawerMenuButton;
      -[CAMControlDrawerButton hudItemForAccessibilityHUDManager:](&v18, sel_hudItemForAccessibilityHUDManager_, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v16);

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CAMControlDrawerMenuButton;
    -[CAMControlDrawerButton hudItemForAccessibilityHUDManager:](&v19, sel_hudItemForAccessibilityHUDManager_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  _BOOL4 v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "locationOfAccessibilityGestureInView:", self);
  v5 = v4;
  v7 = v6;
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded")
    && (-[CAMControlDrawerMenuButton _accessoryBackgroundView](self, "_accessoryBackgroundView"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[CAMControlDrawerMenuButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v8, v5, v7), v8, !v9))
  {
    if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded"))
    {
      v10 = -[CAMControlDrawerMenuButton _indexOfItemToTrackForTouchAtLocation:](self, "_indexOfItemToTrackForTouchAtLocation:", v5, v7);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v10;
        -[CAMControlDrawerMenuButton _cachedMenuItems](self, "_cachedMenuItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[CAMControlDrawerMenuButton didSelectMenuItem:](self, "didSelectMenuItem:", v13);
        -[CAMControlDrawerMenuButton delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "menuButtonDidSelectItem:", self);

        -[CAMControlDrawerMenuButton _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", 0, 1, 1);
      }
    }
  }
  else
  {
    -[CAMControlDrawerMenuButton _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", -[CAMControlDrawerMenuButton isExpanded](self, "isExpanded") ^ 1, 1, 1);
  }
  -[CAMControlDrawerMenuButton cancelTouchTracking](self, "cancelTouchTracking");
  -[CAMControlDrawerMenuButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (void)_updateHighlightedView
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  if (-[CAMControlDrawerMenuButton _isTouchInTrackedView](self, "_isTouchInTrackedView"))
  {
    if (-[CAMControlDrawerMenuButton _isTrackingExpansionToggle](self, "_isTrackingExpansionToggle"))
    {
      -[CAMControlDrawerButton _imageView](self, "_imageView");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CAMControlDrawerMenuButton _itemLabels](self, "_itemLabels");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", -[CAMControlDrawerMenuButton _trackedItemIndex](self, "_trackedItemIndex"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v3 = (uint64_t)v5;
    }
  }
  else
  {
    v3 = 0;
  }
  v6 = (id)v3;
  -[CAMControlDrawerMenuButton _setHighlightedView:](self, "_setHighlightedView:", v3);

}

- (void)_setHighlightedView:(id)a3
{
  UIView *v5;
  id *p_highlightedView;
  UIView *highlightedView;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  UIView *v18;

  v5 = (UIView *)a3;
  p_highlightedView = (id *)&self->__highlightedView;
  highlightedView = self->__highlightedView;
  v18 = v5;
  if (highlightedView != v5)
  {
    if (highlightedView)
    {
      -[UIView layer](highlightedView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v8, 0, -[CAMControlDrawerButton layoutStyle](self, "layoutStyle"));

      v9 = *p_highlightedView;
      -[CAMControlDrawerButton _imageView](self, "_imageView");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
      {
        -[CAMControlDrawerButton _slashView](self, "_slashView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v12, 0, -[CAMControlDrawerButton layoutStyle](self, "layoutStyle"));

      }
    }
    objc_storeStrong((id *)&self->__highlightedView, a3);
    if (*p_highlightedView)
    {
      objc_msgSend(*p_highlightedView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v13, 1, -[CAMControlDrawerButton layoutStyle](self, "layoutStyle"));

      v14 = *p_highlightedView;
      -[CAMControlDrawerButton _imageView](self, "_imageView");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {
        -[CAMControlDrawerButton _slashView](self, "_slashView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v17, 1, -[CAMControlDrawerButton layoutStyle](self, "layoutStyle"));

      }
    }
  }

}

- (void)_updateLabels
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  id v12;
  CAMControlDrawerMenuButton *v13;
  _OWORD v14[3];
  _OWORD v15[3];

  -[CAMControlDrawerMenuButton _loadMenuItemsIfNeeded](self, "_loadMenuItemsIfNeeded");
  -[CAMControlDrawerMenuButton _cachedMenuItems](self, "_cachedMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[CAMControlDrawerMenuButton _itemLabels](self, "_itemLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v5, "count") < v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[CAMControlDrawerMenuButton addSubview:](self, "addSubview:", v6);
    objc_msgSend(v5, "addObject:", v6);
    if (-[CAMControlDrawerButton orientation](self, "orientation") == 2)
    {
      CAMOrientationTransform(-[CAMControlDrawerButton orientation](self, "orientation"), (uint64_t)v15);
      v14[0] = v15[0];
      v14[1] = v15[1];
      v14[2] = v15[2];
      objc_msgSend(v6, "setTransform:", v14);
    }

  }
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__CAMControlDrawerMenuButton__updateLabels__block_invoke;
  v11 = &unk_1EA32D6B0;
  v12 = v3;
  v13 = self;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);
  -[CAMControlDrawerMenuButton _updateSubviewAlphas](self, "_updateSubviewAlphas", v8, v9, v10, v11);

}

void __43__CAMControlDrawerMenuButton__updateLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isMenuItemSelected:", v5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v6);

    objc_msgSend(v5, "selectedTitle");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v7);

    objc_msgSend(v5, "title");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMFont cameraModeDialFontSizeForContentSize:](CAMFont, "cameraModeDialFontSizeForContentSize:", v10);
  v12 = v11;

  objc_msgSend(v22, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", v13) & 1) != 0)
  {
    objc_msgSend(v22, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pointSize");
    v16 = v15;

    if (v12 == v16)
      goto LABEL_9;
  }
  else
  {

  }
  objc_msgSend(v22, "setText:", v8);
  +[CAMFont cameraFontOfSize:](CAMFont, "cameraFontOfSize:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v17);

  v18 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v22, "intrinsicContentSize");
  objc_msgSend(v22, "setBounds:", v18, v19, v20, v21);
LABEL_9:

}

- (void)_updateSubviewAlphas
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  id v8;
  _QWORD v9[5];
  BOOL v10;

  v3 = -[CAMControlDrawerMenuButton isExpanded](self, "isExpanded");
  -[CAMControlDrawerMenuButton _cachedMenuItems](self, "_cachedMenuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[CAMControlDrawerMenuButton _itemLabels](self, "_itemLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__CAMControlDrawerMenuButton__updateSubviewAlphas__block_invoke;
  v9[3] = &__block_descriptor_41_e24_v32__0__UILabel_8Q16_B24l;
  v10 = v3;
  v9[4] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  if (v3)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[CAMControlDrawerMenuButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

uint64_t __50__CAMControlDrawerMenuButton__updateSubviewAlphas__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3;

  if (*(_BYTE *)(a1 + 40))
  {
    v3 = 0.0;
    if (*(_QWORD *)(a1 + 32) > a3)
      v3 = 1.0;
  }
  else
  {
    v3 = 0.0;
  }
  return objc_msgSend(a2, "setAlpha:", v3);
}

- (void)setExpansionInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_expansionInsets.left
    || a3.top != self->_expansionInsets.top
    || a3.right != self->_expansionInsets.right
    || a3.bottom != self->_expansionInsets.bottom)
  {
    self->_expansionInsets = a3;
    -[CAMControlDrawerMenuButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpanded:(BOOL)a3
{
  -[CAMControlDrawerMenuButton setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  -[CAMControlDrawerMenuButton _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", a3, a4, 0);
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  if (self->_expanded == a3)
    return;
  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (a3)
  {
    -[CAMControlDrawerMenuButton _updateLabels](self, "_updateLabels");
    if (!v6)
    {
LABEL_4:
      if (!v5)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if (!a4)
  {
    goto LABEL_4;
  }
  -[CAMControlDrawerMenuButton layoutIfNeeded](self, "layoutIfNeeded");
  if (v5)
  {
LABEL_5:
    -[CAMControlDrawerMenuButton delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expandableButton:willChangeExpanded:", self, v7);

  }
LABEL_6:
  self->_expanded = v7;
  -[CAMControlDrawerMenuButton setNeedsLayout](self, "setNeedsLayout");
  if (v6)
  {
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke;
    v19[3] = &unk_1EA328868;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v19, 0, 0.5, 0.0, 1.0, 1.0);
    if (v7)
    {
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_2;
      v18[3] = &unk_1EA328868;
      v18[4] = self;
      v11 = 0.05;
      v12 = 0.5;
      v13 = 1.0;
      v14 = 1.0;
      v15 = v18;
      v16 = 2;
    }
    else
    {
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_3;
      v17[3] = &unk_1EA328868;
      v17[4] = self;
      v12 = 0.25;
      v11 = 0.0;
      v13 = 1.0;
      v15 = v17;
      v14 = 1.0;
      v16 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v16, v15, 0, v12, v11, v13, v14);
  }
  else
  {
    -[CAMControlDrawerMenuButton _updateSubviewAlphas](self, "_updateSubviewAlphas");
  }
}

uint64_t __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubviewAlphas");
}

uint64_t __65__CAMControlDrawerMenuButton__setExpanded_animated_shouldNotify___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubviewAlphas");
}

- (void)_loadMenuItemsIfNeeded
{
  void *v3;

  if (-[CAMControlDrawerMenuButton _needsLoadMenuItems](self, "_needsLoadMenuItems"))
  {
    -[CAMControlDrawerMenuButton loadMenuItems](self, "loadMenuItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawerMenuButton _setCachedMenuItems:](self, "_setCachedMenuItems:", v3);

    -[CAMControlDrawerMenuButton _setNeedsLoadMenuItems:](self, "_setNeedsLoadMenuItems:", 0);
  }
}

- (void)setNeedsLoadMenuItems
{
  -[CAMControlDrawerMenuButton _setNeedsLoadMenuItems:](self, "_setNeedsLoadMenuItems:", 1);
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded"))
    -[CAMControlDrawerMenuButton _updateLabels](self, "_updateLabels");
}

- (void)updateLabelsIfNeeded
{
  if (-[CAMControlDrawerMenuButton isExpanded](self, "isExpanded"))
    -[CAMControlDrawerMenuButton _updateLabels](self, "_updateLabels");
}

- (id)loadMenuItems
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ must be implemented by subclasses"), v4);

  return (id)MEMORY[0x1E0C9AA60];
}

- (void)didSelectMenuItem:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ must be implemented by subclasses"), v5);

}

- (BOOL)isMenuItemSelected:(id)a3
{
  return 0;
}

- (UIEdgeInsets)expansionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_expansionInsets.top;
  left = self->_expansionInsets.left;
  bottom = self->_expansionInsets.bottom;
  right = self->_expansionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CAMControlDrawerMenuButtonDelegate)delegate
{
  return (CAMControlDrawerMenuButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (UIImageView)_accessoryBackgroundView
{
  return self->__accessoryBackgroundView;
}

- (NSMutableArray)_itemLabels
{
  return self->__itemLabels;
}

- (NSArray)_cachedMenuItems
{
  return self->__cachedMenuItems;
}

- (void)_setCachedMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->__cachedMenuItems, a3);
}

- (BOOL)_needsLoadMenuItems
{
  return self->__needsLoadMenuItems;
}

- (void)_setNeedsLoadMenuItems:(BOOL)a3
{
  self->__needsLoadMenuItems = a3;
}

- (unint64_t)_trackedItemIndex
{
  return self->__trackedItemIndex;
}

- (void)_setTrackedItemIndex:(unint64_t)a3
{
  self->__trackedItemIndex = a3;
}

- (BOOL)_isTrackingExpansionToggle
{
  return self->__trackingExpansionToggle;
}

- (void)_setTrackingExpansionToggle:(BOOL)a3
{
  self->__trackingExpansionToggle = a3;
}

- (BOOL)_isTouchInTrackedView
{
  return self->__touchInTrackedView;
}

- (void)_setTouchInTrackedView:(BOOL)a3
{
  self->__touchInTrackedView = a3;
}

- (UIView)_highlightedView
{
  return self->__highlightedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__highlightedView, 0);
  objc_storeStrong((id *)&self->__cachedMenuItems, 0);
  objc_storeStrong((id *)&self->__itemLabels, 0);
  objc_storeStrong((id *)&self->__accessoryBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
