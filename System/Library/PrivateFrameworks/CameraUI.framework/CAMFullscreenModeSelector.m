@implementation CAMFullscreenModeSelector

- (CAMFullscreenModeSelector)init
{
  CAMFullscreenModeSelector *v2;
  void *v3;
  id v4;
  uint64_t v5;
  UIView *titleContainer;
  CAMFullscreenModeSelector *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMFullscreenModeSelector;
  v2 = -[CAMFullscreenModeSelector init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenModeSelector setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[CAMFullscreenModeSelector setAlpha:](v2, "setAlpha:", 0.0);
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleContainer = v2->__titleContainer;
    v2->__titleContainer = (UIView *)v5;

    -[CAMFullscreenModeSelector addSubview:](v2, "addSubview:", v2->__titleContainer);
    v7 = v2;
  }

  return v2;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  CAMModeSelectTitleView *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CAMFullscreenModeSelector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenModeSelector _titleViewsByMode](self, "_titleViewsByMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  if (v3)
  {
    objc_msgSend(v3, "modesForModeSelector:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenModeSelector _setModes:](self, "_setModes:", v6);
    v7 = -[CAMFullscreenModeSelector selectedMode](self, "selectedMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMFullscreenModeSelector selectedMode](self, "selectedMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "containsObject:", v8);

    v25 = v5;
    if ((v9 & 1) == 0)
    {
      if ((objc_msgSend(v6, "containsObject:", &unk_1EA3B0958) & 1) != 0 || !objc_msgSend(v6, "count"))
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v6, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "integerValue");

      }
    }
    -[CAMFullscreenModeSelector setSelectedMode:](self, "setSelectedMode:", v7);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      v15 = *MEMORY[0x1E0C9D648];
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "integerValue");
          v22 = -[CAMModeSelectTitleView initWithFrame:]([CAMModeSelectTitleView alloc], "initWithFrame:", v15, v16, v17, v18);
          objc_msgSend(MEMORY[0x1E0CB3940], "cam_localizedTitleForMode:wantsCompactTitle:", v21, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMFullscreenModeSelector _modeTitleForLegacyTitle:](self, "_modeTitleForLegacyTitle:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMModeSelectTitleView setText:](v22, "setText:", v24);
          -[UIView addSubview:](self->__titleContainer, "addSubview:", v22);
          objc_msgSend(v11, "setObject:forKey:", v22, v20);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    -[CAMFullscreenModeSelector _setItems:](self, "_setItems:", v11);
    -[CAMFullscreenModeSelector _updateTitles](self, "_updateTitles");

    v5 = v25;
  }

}

- (void)_setHighlightedIndex:(int64_t)a3
{
  if (self->__highlightedIndex != a3)
  {
    self->__highlightedIndex = a3;
    -[CAMFullscreenModeSelector _updateTitles](self, "_updateTitles");
  }
}

- (void)_setState:(int64_t)a3
{
  if (self->__state != a3)
  {
    self->__state = a3;
    if (a3 == 2)
      -[CAMFullscreenModeSelector _setHighlightedIndex:](self, "_setHighlightedIndex:", -1);
    -[CAMFullscreenModeSelector _updateAlpha](self, "_updateAlpha");
    -[CAMFullscreenModeSelector _updateTitles](self, "_updateTitles");
  }
}

- (void)enterTappableState
{
  -[CAMFullscreenModeSelector _setState:](self, "_setState:", 2);
}

- (void)_selectModeAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[CAMFullscreenModeSelector _modes](self, "_modes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  -[CAMFullscreenModeSelector _setSelectedMode:shouldNotify:](self, "_setSelectedMode:shouldNotify:", v7, 1);
}

- (void)setSelectedMode:(int64_t)a3
{
  -[CAMFullscreenModeSelector _setSelectedMode:shouldNotify:](self, "_setSelectedMode:shouldNotify:", a3, 0);
}

- (void)_setSelectedMode:(int64_t)a3 shouldNotify:(BOOL)a4
{
  id v5;

  if (self->_selectedMode != a3)
  {
    self->_selectedMode = a3;
    if (a4)
    {
      -[CAMFullscreenModeSelector delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didSelectMode:", a3);

    }
  }
}

- (double)_titleIndexOffset
{
  void *v2;
  double v3;

  -[CAMFullscreenModeSelector _modes](self, "_modes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -floor(((double)(unint64_t)objc_msgSend(v2, "count") + -1.0) * 0.5);

  return v3;
}

- (int64_t)_titleIndexForY:(double)a3
{
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  CGRect v11;

  -[CAMFullscreenModeSelector bounds](self, "bounds");
  v5 = floor((a3 - CGRectGetMidY(v11)) / 78.0);
  -[CAMFullscreenModeSelector _titleIndexOffset](self, "_titleIndexOffset");
  v7 = (uint64_t)(v5 - v6);
  if ((v7 & 0x8000000000000000) != 0)
    return -1;
  -[CAMFullscreenModeSelector _modes](self, "_modes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") > v7;

  if (v9)
    return v7;
  else
    return -1;
}

- (double)_titleYForIndex:(int64_t)a3
{
  double MidY;
  double v6;
  CGRect v8;

  -[CAMFullscreenModeSelector bounds](self, "bounds");
  MidY = CGRectGetMidY(v8);
  -[CAMFullscreenModeSelector _titleIndexOffset](self, "_titleIndexOffset");
  return MidY + (v6 + (double)a3) * 78.0;
}

- (void)handlePress:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");

  if ((unint64_t)(v9 - 3) >= 3)
  {
    if (v9 == 2)
    {
      -[CAMFullscreenModeSelector _touchSequenceChangedToPoint:](self, "_touchSequenceChangedToPoint:", v6, v8);
    }
    else if (v9 == 1)
    {
      -[CAMFullscreenModeSelector _touchSequenceBeganAtPoint:](self, "_touchSequenceBeganAtPoint:", v6, v8);
    }
  }
  else
  {
    -[CAMFullscreenModeSelector _touchSequenceEndedAtPoint:](self, "_touchSequenceEndedAtPoint:", v6, v8);
  }
}

- (void)_touchSequenceBeganAtPoint:(CGPoint)a3
{
  double y;
  double x;
  int64_t v6;
  NSObject *v7;

  y = a3.y;
  x = a3.x;
  -[CAMFullscreenModeSelector _setTouchBeganTime:](self, "_setTouchBeganTime:", CFAbsoluteTimeGetCurrent());
  -[CAMFullscreenModeSelector _setTouchBeganPosition:](self, "_setTouchBeganPosition:", x, y);
  v6 = -[CAMFullscreenModeSelector _state](self, "_state");
  if (v6 == 2)
  {
    -[CAMFullscreenModeSelector _setHighlightedIndex:](self, "_setHighlightedIndex:", -[CAMFullscreenModeSelector _titleIndexForY:](self, "_titleIndexForY:", y));
  }
  else if (v6 == 1)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAMFullscreenModeSelector _touchSequenceBeganAtPoint:].cold.1(v7);

  }
}

- (void)_touchSequenceChangedToPoint:(CGPoint)a3
{
  double y;
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  BOOL v11;
  CAMFullscreenModeSelector *v12;
  uint64_t v13;

  y = a3.y;
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMFullscreenModeSelector _touchBeganTime](self, "_touchBeganTime");
  v7 = Current - v6;
  -[CAMFullscreenModeSelector _touchBeganPosition](self, "_touchBeganPosition");
  v9 = y - v8;
  v10 = -[CAMFullscreenModeSelector _state](self, "_state");
  switch(v10)
  {
    case 2:
      if (v9 / 60.0 > 1.0 && v7 < 0.5)
      {
        v12 = self;
        v13 = 0;
        goto LABEL_17;
      }
      break;
    case 1:
      -[CAMFullscreenModeSelector _setHighlightedIndex:](self, "_setHighlightedIndex:", -[CAMFullscreenModeSelector _titleIndexForY:](self, "_titleIndexForY:", y));
      -[CAMFullscreenModeSelector _updateTitles](self, "_updateTitles");
      return;
    case 0:
      -[CAMFullscreenModeSelector setAlpha:](self, "setAlpha:", v9 / -60.0);
      if (v9 / -60.0 > 1.0 || (v9 / -60.0 > 0.1 ? (v11 = v7 <= 0.5) : (v11 = 1), !v11))
      {
        v12 = self;
        v13 = 1;
LABEL_17:
        -[CAMFullscreenModeSelector _setState:](v12, "_setState:", v13);
      }
      break;
  }
}

- (void)_touchSequenceEndedAtPoint:(CGPoint)a3
{
  double y;
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  CAMFullscreenModeSelector *v11;
  uint64_t v12;

  y = a3.y;
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMFullscreenModeSelector _touchBeganTime](self, "_touchBeganTime");
  v7 = v6;
  -[CAMFullscreenModeSelector _touchBeganPosition](self, "_touchBeganPosition");
  v9 = v8;
  v10 = -[CAMFullscreenModeSelector _state](self, "_state");
  if (v10 == 2)
  {
    if (-[CAMFullscreenModeSelector _highlightedIndex](self, "_highlightedIndex") == -1)
      goto LABEL_11;
  }
  else
  {
    if (v10 != 1)
    {
      if (v10)
        return;
      if ((y - v9) / -60.0 <= 1.0)
      {
        -[CAMFullscreenModeSelector _updateAlpha](self, "_updateAlpha");
        return;
      }
      goto LABEL_12;
    }
    if (Current - v7 <= 0.5
      || -[CAMFullscreenModeSelector _highlightedIndex](self, "_highlightedIndex", Current - v7) == -1)
    {
LABEL_12:
      v11 = self;
      v12 = 2;
      goto LABEL_13;
    }
  }
  -[CAMFullscreenModeSelector _selectModeAtIndex:](self, "_selectModeAtIndex:", -[CAMFullscreenModeSelector _highlightedIndex](self, "_highlightedIndex"));
LABEL_11:
  v11 = self;
  v12 = 0;
LABEL_13:
  -[CAMFullscreenModeSelector _setState:](v11, "_setState:", v12);
}

- (id)_modeTitleForLegacyTitle:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1EA3325A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cam_capitalizedStringWithPreferredLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateTitles
{
  void *v3;
  _QWORD v4[5];

  -[CAMFullscreenModeSelector _modes](self, "_modes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CAMFullscreenModeSelector__updateTitles__block_invoke;
  v4[3] = &unk_1EA32BE58;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __42__CAMFullscreenModeSelector__updateTitles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  __int128 v15;
  CGAffineTransform *v16;
  void *v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  _OWORD v21[3];

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_titleViewsByMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "_highlightedIndex");
  v10 = objc_msgSend(v6, "integerValue");

  v11 = objc_msgSend(*(id *)(a1 + 32), "selectedMode");
  v12 = objc_msgSend(*(id *)(a1 + 32), "_state");
  switch(v12)
  {
    case 2:
      if (v10 == v11)
        objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v17);

      if (v9 == a3)
      {
        CGAffineTransformMakeScale(&v20, 0.95, 0.95);
      }
      else
      {
        v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v20.c = v18;
        *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      v19 = v20;
      v16 = &v19;
      goto LABEL_16;
    case 1:
      if (v9 == a3)
        objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v14);

      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v21[0] = *MEMORY[0x1E0C9BAA8];
      v21[1] = v15;
      v21[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v16 = (CGAffineTransform *)v21;
LABEL_16:
      objc_msgSend(v8, "setTransform:", v16, *(_OWORD *)&v19.a, *(_OWORD *)&v19.c, *(_OWORD *)&v19.tx);
      v13 = 1.0;
      goto LABEL_17;
    case 0:
      v13 = 0.0;
LABEL_17:
      objc_msgSend(v8, "setAlpha:", v13);
      break;
  }

}

- (void)_updateAlpha
{
  unint64_t v3;

  v3 = -[CAMFullscreenModeSelector _state](self, "_state");
  if (v3 <= 2)
    -[CAMFullscreenModeSelector setAlpha:](self, "setAlpha:", dbl_1DB9A59A0[v3]);
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
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CAMFullscreenModeSelector *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CAMFullscreenModeSelector;
  -[CAMFullscreenModeSelector layoutSubviews](&v21, sel_layoutSubviews);
  -[CAMFullscreenModeSelector bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMFullscreenModeSelector _modes](self, "_modes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenModeSelector _titleViewsByMode](self, "_titleViewsByMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setFrame:](self->__titleContainer, "setFrame:", v4, v6, v8, v10);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__CAMFullscreenModeSelector_layoutSubviews__block_invoke;
  v14[3] = &unk_1EA32BE80;
  v17 = v4;
  v18 = v6;
  v19 = v8;
  v20 = v10;
  v15 = v12;
  v16 = self;
  v13 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

}

void __43__CAMFullscreenModeSelector_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  CGRectGetWidth(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_titleYForIndex:", a3);
  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  UIRectIntegralWithScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
}

- (CAMFullscreenModeSelectorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (CAMFullscreenModeSelectorDataSource *)a3;
}

- (CAMFullscreenModeSelectorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CAMFullscreenModeSelectorDelegate *)a3;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (NSArray)_modes
{
  return self->__modes;
}

- (void)_setModes:(id)a3
{
  objc_storeStrong((id *)&self->__modes, a3);
}

- (NSDictionary)_titleViewsByMode
{
  return self->__titleViewsByMode;
}

- (void)_setItems:(id)a3
{
  objc_storeStrong((id *)&self->__titleViewsByMode, a3);
}

- (UIView)_titleContainer
{
  return self->__titleContainer;
}

- (int64_t)_state
{
  return self->__state;
}

- (double)_touchBeganTime
{
  return self->__touchBeganTime;
}

- (void)_setTouchBeganTime:(double)a3
{
  self->__touchBeganTime = a3;
}

- (CGPoint)_touchBeganPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->__touchBeganPosition.x;
  y = self->__touchBeganPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setTouchBeganPosition:(CGPoint)a3
{
  self->__touchBeganPosition = a3;
}

- (int64_t)_highlightedIndex
{
  return self->__highlightedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleContainer, 0);
  objc_storeStrong((id *)&self->__titleViewsByMode, 0);
  objc_storeStrong((id *)&self->__modes, 0);
}

- (void)_touchSequenceBeganAtPoint:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "CAMModeSelectView cannot already be in draggable mode when a touch starts", v1, 2u);
}

@end
