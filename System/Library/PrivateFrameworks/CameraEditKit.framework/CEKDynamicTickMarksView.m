@implementation CEKDynamicTickMarksView

- (CEKDynamicTickMarksView)initWithFrame:(CGRect)a3
{
  CEKDynamicTickMarksView *v3;
  _TtC13CameraEditKit14TickMarksModel *v4;
  _TtC13CameraEditKit14TickMarksModel *tickMarksModel;
  uint64_t v6;
  NSIndexSet *installedTickMarkIndexes;
  uint64_t v8;
  NSMutableDictionary *tickMarksByIndex;
  _TtC13CameraEditKit24TickMarksVisibilityModel *v10;
  _TtC13CameraEditKit24TickMarksVisibilityModel *tickMarksVisibilityModel;
  uint64_t v12;
  NSMutableSet *tickMarksReusePool;
  uint64_t v14;
  __int128 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CEKDynamicTickMarksView;
  v3 = -[CEKDynamicTickMarksView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_TtC13CameraEditKit14TickMarksModel);
    tickMarksModel = v3->_tickMarksModel;
    v3->_tickMarksModel = v4;

    -[TickMarksModel setTickMarkWidth:](v3->_tickMarksModel, "setTickMarkWidth:", 2.0);
    -[TickMarksModel setDataSource:](v3->_tickMarksModel, "setDataSource:", v3);
    -[TickMarksModel setDelegate:](v3->_tickMarksModel, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v6 = objc_claimAutoreleasedReturnValue();
    installedTickMarkIndexes = v3->__installedTickMarkIndexes;
    v3->__installedTickMarkIndexes = (NSIndexSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    tickMarksByIndex = v3->__tickMarksByIndex;
    v3->__tickMarksByIndex = (NSMutableDictionary *)v8;

    v10 = -[TickMarksVisibilityModel initWithModel:]([_TtC13CameraEditKit24TickMarksVisibilityModel alloc], "initWithModel:", v3->_tickMarksModel);
    tickMarksVisibilityModel = v3->__tickMarksVisibilityModel;
    v3->__tickMarksVisibilityModel = v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    tickMarksReusePool = v3->__tickMarksReusePool;
    v3->__tickMarksReusePool = (NSMutableSet *)v12;

    v14 = MEMORY[0x1E0C9BAA8];
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v3->_contentTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v3->_contentTransform.c = v15;
    *(_OWORD *)&v3->_contentTransform.tx = *(_OWORD *)(v14 + 32);
  }
  return v3;
}

- (void)layoutSubviews
{
  -[CEKDynamicTickMarksView _recycleTickMarks](self, "_recycleTickMarks");
  if (-[CEKDynamicTickMarksView _needsTickMarkRefresh](self, "_needsTickMarkRefresh"))
    -[CEKDynamicTickMarksView _refreshTickMarks](self, "_refreshTickMarks");
}

- (void)setVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleBounds = &self->_visibleBounds;
  if (!CGRectEqualToRect(a3, self->_visibleBounds))
  {
    p_visibleBounds->origin.x = x;
    p_visibleBounds->origin.y = y;
    p_visibleBounds->size.width = width;
    p_visibleBounds->size.height = height;
    -[CEKDynamicTickMarksView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectedTickMarkIndex:(unint64_t)a3
{
  -[CEKDynamicTickMarksView setSelectedTickMarkIndex:animated:](self, "setSelectedTickMarkIndex:animated:", a3, 0);
}

- (void)setSelectedTickMarkIndex:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t selectedTickMarkIndex;
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  dispatch_time_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31[2];
  id location;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  CEKDynamicTickMarksView *v42;

  selectedTickMarkIndex = self->_selectedTickMarkIndex;
  if (selectedTickMarkIndex != a3)
  {
    v5 = a4;
    self->_selectedTickMarkIndex = a3;
    -[CEKDynamicTickMarksView _tickMarksByIndex](self, "_tickMarksByIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke;
    aBlock[3] = &unk_1E70A4C20;
    v10 = v8;
    v41 = v10;
    v42 = self;
    v11 = _Block_copy(aBlock);
    if (selectedTickMarkIndex <= a3)
      v12 = a3;
    else
      v12 = selectedTickMarkIndex;
    if (selectedTickMarkIndex >= a3)
      v13 = a3;
    else
      v13 = selectedTickMarkIndex;
    v14 = v12 - v13;
    if (v5)
      v15 = v13;
    else
      v15 = a3;
    if (v5)
      v16 = v14 + 1;
    else
      v16 = 1;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeIndex:", selectedTickMarkIndex);
    -[CEKDynamicTickMarksView _selectedIndexes](self, "_selectedIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDynamicTickMarksView _setSelectedIndexes:](self, "_setSelectedIndexes:", v17);
    v38[0] = v9;
    v38[1] = 3221225472;
    v38[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_2;
    v38[3] = &unk_1E70A4C48;
    v19 = v11;
    v39 = v19;
    objc_msgSend(v17, "enumerateIndexesUsingBlock:", v38);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3F40], "behaviorWithDampingRatio:response:", 0.75, 0.4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v33[0] = v9;
      v33[1] = 3221225472;
      v33[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_4;
      v33[3] = &unk_1E70A4C70;
      v34 = v18;
      v35 = v19;
      v22 = v19;
      objc_msgSend(v21, "_animateUsingSpringBehavior:tracking:animations:completion:", v20, 0, v33, 0);
      objc_initWeak(&location, self);
      v23 = dispatch_time(0, 20000000);
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_6;
      v27[3] = &unk_1E70A4CE8;
      objc_copyWeak(v31, &location);
      v24 = v17;
      v31[1] = (id)a3;
      v28 = v24;
      v29 = v20;
      v30 = v10;
      v25 = v20;
      dispatch_after(v23, MEMORY[0x1E0C80D38], v27);

      objc_destroyWeak(v31);
      objc_destroyWeak(&location);

    }
    else
    {
      v36[0] = v9;
      v36[1] = 3221225472;
      v36[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_3;
      v36[3] = &unk_1E70A4C48;
      v37 = v19;
      v26 = v19;
      objc_msgSend(v18, "enumerateIndexesUsingBlock:", v36);
      v25 = v37;
    }

  }
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)a3)
    objc_msgSend(v8, "_removeAllRetargetableAnimations:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_configureTickMark:forIndex:selected:", v8, a2, a3);

}

uint64_t __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_5;
  v2[3] = &unk_1E70A4C48;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateIndexesUsingBlock:", v2);

}

uint64_t __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_6(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 56));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "_selectedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v6, "_setSelectedIndexes:", v5);

    v7 = *(void **)(a1 + 32);
    v8 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "removeIndex:", objc_msgSend(v8, "selectedTickMarkIndex"));

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_7;
    v10[3] = &unk_1E70A4CC0;
    v9 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_copyWeak(&v13, &to);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v10);

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&to);
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_7(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8[2];

  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_8;
  v6[3] = &unk_1E70A4C98;
  objc_copyWeak(v8, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  v8[1] = a2;
  objc_msgSend(v4, "_animateUsingSpringBehavior:tracking:animations:completion:", v5, 0, v6, 0);

  objc_destroyWeak(v8);
}

void __61__CEKDynamicTickMarksView_setSelectedTickMarkIndex_animated___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_configureTickMark:forIndex:selected:", v4, *(_QWORD *)(a1 + 48), 0);

}

- (void)setHighlightSelectedIndex:(BOOL)a3
{
  -[CEKDynamicTickMarksView setHighlightSelectedIndex:animated:](self, "setHighlightSelectedIndex:animated:", a3, 0);
}

- (void)setHighlightSelectedIndex:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_highlightSelectedIndex != a3)
  {
    self->_highlightSelectedIndex = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __62__CEKDynamicTickMarksView_setHighlightSelectedIndex_animated___block_invoke;
      v4[3] = &unk_1E70A4B18;
      v4[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.3, 0.0);
    }
    else
    {
      -[CEKDynamicTickMarksView _refreshTickMarksHighlight](self, "_refreshTickMarksHighlight");
    }
  }
}

uint64_t __62__CEKDynamicTickMarksView_setHighlightSelectedIndex_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshTickMarksHighlight");
}

- (id)_colorForTickMarkAtIndex:(unint64_t)a3 selected:(BOOL)a4 enabled:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  if (!a4)
  {
    -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainTickMarkColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_3;
LABEL_5:
    v7 = v6;
    goto LABEL_6;
  }
  -[CEKDynamicTickMarksView tintColor](self, "tintColor", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = v7;

  return v9;
}

- (void)_configureTickMark:(id)a3 forIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[CEKDynamicTickMarksView _configureTickMark:forIndex:selected:](self, "_configureTickMark:forIndex:selected:", v6, a4, -[CEKDynamicTickMarksView selectedTickMarkIndex](self, "selectedTickMarkIndex") == a4);

}

- (void)_configureTickMark:(id)a3 forIndex:(unint64_t)a4 selected:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  double v35;
  void *v36;
  int v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  unint64_t v41;
  _OWORD v42[6];
  _OWORD v43[6];

  v5 = a5;
  v8 = a3;
  if (v8)
  {
    -[CEKDynamicTickMarksView _frameForTickMarkAtIndex:selected:](self, "_frameForTickMarkAtIndex:selected:", a4, v5);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    if (-[CEKDynamicTickMarksView _isUsingCells](self, "_isUsingCells"))
    {
      -[CEKDynamicTickMarksView cellDataProvider](self, "cellDataProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "configurationAtIndex:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v8;
      objc_msgSend(v19, "setContentConfiguration:", v18);
      -[CEKDynamicTickMarksView contentTransform](self, "contentTransform");
      v43[0] = v43[3];
      v43[1] = v43[4];
      v43[2] = v43[5];
      objc_msgSend(v19, "setTransform:", v43);
      -[CEKDynamicTickMarksView _colorForTickMarkAtIndex:selected:enabled:](self, "_colorForTickMarkAtIndex:selected:enabled:", a4, v5, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTintColor:", v20);

      -[CEKDynamicTickMarksView _layoutDynamicCellTickMark:atIndex:](self, "_layoutDynamicCellTickMark:atIndex:", v19, a4);
LABEL_6:

      goto LABEL_20;
    }
    if (-[CEKDynamicTickMarksView _isUsingImages](self, "_isUsingImages"))
    {
      -[CEKDynamicTickMarksView imageDataProvider](self, "imageDataProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageForTickMarkAtIndex:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[CEKDynamicTickMarksView imageDataProvider](self, "imageDataProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isDisabledAtIndex:", a4);

      v19 = v8;
      objc_msgSend(v19, "setImage:", v18);
      -[CEKDynamicTickMarksView contentTransform](self, "contentTransform");
      v42[0] = v42[3];
      v42[1] = v42[4];
      v42[2] = v42[5];
      objc_msgSend(v19, "setTransform:", v42);
      -[CEKDynamicTickMarksView _colorForTickMarkAtIndex:selected:enabled:](self, "_colorForTickMarkAtIndex:selected:enabled:", a4, v5, v23 ^ 1u);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTintColor:", v24);

      -[CEKDynamicTickMarksView _configureHighlightForTickMark:atIndex:](self, "_configureHighlightForTickMark:atIndex:", v19, a4);
      goto LABEL_6;
    }
    objc_msgSend(v8, "setFrame:", v10, v12, v14, v16);
    objc_msgSend(v8, "frame");
    v26 = v25 * 0.5;
    objc_msgSend(v8, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRadius:", v26);

    -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isMainTickMarkAtIndex:", a4);

    -[CEKDynamicTickMarksView magneticTickMarkIndexes](self, "magneticTickMarkIndexes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "containsIndex:", a4);

    -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "endTickMarksProminent"))
    {
      if (a4)
      {
        -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "tickMarksCount") - 1 == a4;

      }
      else
      {
        v34 = 1;
      }
    }
    else
    {
      v34 = 0;
    }

    v35 = 1.0;
    if (!v5)
    {
      -[CEKDynamicTickMarksView _tickMarksVisibilityModel](self, "_tickMarksVisibilityModel", 1.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "shouldHideTickMarkAtIndex:", a4);

      v35 = 0.4;
      if (v29)
        v35 = 0.7;
      if (v31 | v34)
        v35 = 1.0;
      if (v37)
        v35 = 0.0;
    }
    objc_msgSend(v8, "setAlpha:", v35);
    v38 = (void *)MEMORY[0x1E0DC3F10];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __64__CEKDynamicTickMarksView__configureTickMark_forIndex_selected___block_invoke;
    v39[3] = &unk_1E70A4D10;
    v41 = a4;
    v39[4] = self;
    v40 = v8;
    objc_msgSend(v38, "performWithoutAnimation:", v39);

  }
LABEL_20:

}

void __64__CEKDynamicTickMarksView__configureTickMark_forIndex_selected___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_colorForTickMarkAtIndex:selected:enabled:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48) == objc_msgSend(*(id *)(a1 + 32), "selectedTickMarkIndex"), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setBackgroundColor:", v2);

}

- (void)_configureHighlightForTickMark:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  double v19;
  void *v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  v6 = a3;
  if (-[CEKDynamicTickMarksView _isUsingImages](self, "_isUsingImages"))
  {
    v7 = -[CEKDynamicTickMarksView selectedTickMarkIndex](self, "selectedTickMarkIndex");
    -[CEKDynamicTickMarksView _frameForTickMarkAtIndex:selected:](self, "_frameForTickMarkAtIndex:selected:", a4, v7 == a4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = v6;
    -[CEKDynamicTickMarksView imageDataProvider](self, "imageDataProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeForImageAtIndex:", a4);

    v18 = -[CEKDynamicTickMarksView highlightSelectedIndex](self, "highlightSelectedIndex");
    v19 = 1.0;
    if (v7 == a4 && v18)
    {
      memset(&v21, 0, sizeof(v21));
      CGAffineTransformMakeScale(&v21, 0.75, 0.75);
      v19 = 0.6;
    }
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    CGRectGetMidX(v22);
    -[CEKDynamicTickMarksView bounds](self, "bounds");
    CGRectGetMidY(v23);
    CEKRectWithSize();
    -[CEKDynamicTickMarksView traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayScale");
    UIRectCenteredAboutPointScale();

    UIRectGetCenter();
    objc_msgSend(v16, "setCenter:");
    objc_msgSend(v16, "setBounds:", CEKRectWithSize());
    objc_msgSend(v16, "setAlpha:", v19);

  }
}

- (void)_layoutDynamicCellTickMark:(id)a3 atIndex:(unint64_t)a4
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double MidX;
  double MidY;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v18 = a3;
  if (-[CEKDynamicTickMarksView _isUsingCells](self, "_isUsingCells"))
  {
    -[CEKDynamicTickMarksView _frameForTickMarkAtIndex:selected:](self, "_frameForTickMarkAtIndex:selected:", a4, -[CEKDynamicTickMarksView selectedTickMarkIndex](self, "selectedTickMarkIndex") == a4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CEKDynamicTickMarksView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");

    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    MidX = CGRectGetMidX(v19);
    -[CEKDynamicTickMarksView bounds](self, "bounds");
    MidY = CGRectGetMidY(v20);
    objc_msgSend(v18, "contentConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentSize");
    UISizeCeilToScale();

    CEKRectWithSize();
    UIRectCenteredAboutPointScale();
    objc_msgSend(v18, "setCenter:", MidX, MidY);
    objc_msgSend(v18, "setBounds:", CEKRectWithSize());
  }

}

- (double)_lengthForSelectedTickMark
{
  double v2;

  -[CEKDynamicTickMarksView bounds](self, "bounds");
  return v2;
}

- (double)_lengthForMagneticTickMark
{
  double result;

  -[CEKDynamicTickMarksView bounds](self, "bounds");
  UIRoundToViewScale();
  return result;
}

- (double)_lengthForStandardTickMark
{
  double result;

  -[CEKDynamicTickMarksView bounds](self, "bounds");
  UIRoundToViewScale();
  return result;
}

- (CGRect)frameForTickMarkAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CEKDynamicTickMarksView _frameForTickMarkAtIndex:selected:](self, "_frameForTickMarkAtIndex:selected:", a3, -[CEKDynamicTickMarksView selectedTickMarkIndex](self, "selectedTickMarkIndex") == a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameForTickMarkAtIndex:(unint64_t)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a4;
  -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "endTickMarksProminent"))
  {
    if (a3)
      v8 = a3 + 1 == objc_msgSend(v7, "tickMarksCount");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  -[CEKDynamicTickMarksView magneticTickMarkIndexes](self, "magneticTickMarkIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsIndex:", a3);

  if (v4)
  {
    -[CEKDynamicTickMarksView _lengthForSelectedTickMark](self, "_lengthForSelectedTickMark");
  }
  else if ((v10 | v8) == 1)
  {
    -[CEKDynamicTickMarksView _lengthForMagneticTickMark](self, "_lengthForMagneticTickMark");
  }
  else
  {
    -[CEKDynamicTickMarksView _lengthForStandardTickMark](self, "_lengthForStandardTickMark");
  }
  v12 = v11;
  objc_msgSend(v7, "xOffsetForTickMarkIndex:", a3);
  v14 = v13;
  -[CEKDynamicTickMarksView bounds](self, "bounds");
  v16 = v15 - v12;
  objc_msgSend(v7, "tickMarkWidth");
  v18 = v17;

  v19 = v14;
  v20 = v16;
  v21 = v18;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_recycleTickMarks
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  -[CEKDynamicTickMarksView _indexesIntersectingVisibleBounds](self, "_indexesIntersectingVisibleBounds");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKDynamicTickMarksView _installedTickMarkIndexes](self, "_installedTickMarkIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "removeIndexes:", v7);
  v5 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "removeIndexes:", v3);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke;
  v9[3] = &unk_1E70A4D38;
  v9[4] = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke_2;
  v8[3] = &unk_1E70A4D38;
  v8[4] = self;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);
  -[CEKDynamicTickMarksView _setInstalledTickMarkIndexes:](self, "_setInstalledTickMarkIndexes:", v7);

}

uint64_t __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAndEnqueueTickMarkAtIndex:", a2);
}

uint64_t __44__CEKDynamicTickMarksView__recycleTickMarks__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueAndInstallTickMarkForIndex:", a2);
}

- (void)_setNeedsRefreshTickMarks
{
  self->__needsTickMarkRefresh = 1;
  -[CEKDynamicTickMarksView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_refreshTickMarks
{
  void *v3;
  _QWORD v4[5];

  -[CEKDynamicTickMarksView _installedTickMarkIndexes](self, "_installedTickMarkIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CEKDynamicTickMarksView__refreshTickMarks__block_invoke;
  v4[3] = &unk_1E70A4D38;
  v4[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);

  self->__needsTickMarkRefresh = 0;
}

void __44__CEKDynamicTickMarksView__refreshTickMarks__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_tickMarksByIndex");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configureTickMark:forIndex:", v5, a2);

}

- (void)_refreshTickMarksHighlight
{
  void *v3;
  _QWORD v4[5];

  -[CEKDynamicTickMarksView _installedTickMarkIndexes](self, "_installedTickMarkIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CEKDynamicTickMarksView__refreshTickMarksHighlight__block_invoke;
  v4[3] = &unk_1E70A4D38;
  v4[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);

}

void __53__CEKDynamicTickMarksView__refreshTickMarksHighlight__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_tickMarksByIndex");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configureHighlightForTickMark:atIndex:", v5, a2);

}

- (id)_indexesIntersectingVisibleBounds
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CGRect v19;

  -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tickMarksCount");

  if (!v4)
    goto LABEL_5;
  -[CEKDynamicTickMarksView visibleBounds](self, "visibleBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "floorTickMarkIndexForXOffset:", v6);

  if (!-[CEKDynamicTickMarksView _bounds:containsTickMarkAtIndex:](self, "_bounds:containsTickMarkAtIndex:", v14, v6, v8, v10, v12)&& !-[CEKDynamicTickMarksView _bounds:containsTickMarkAtIndex:](self, "_bounds:containsTickMarkAtIndex:", ++v14, v6, v8, v10, v12))
  {
    goto LABEL_5;
  }
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CEKDynamicTickMarksView tickMarksModel](self, "tickMarksModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    v17 = objc_msgSend(v16, "floorTickMarkIndexForXOffset:", CGRectGetMaxX(v19));

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v14, v17 - v14 + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (BOOL)_bounds:(CGRect)a3 containsTickMarkAtIndex:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CEKDynamicTickMarksView frameForTickMarkAtIndex:](self, "frameForTickMarkAtIndex:", a4);
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return CGRectIntersectsRect(v13, v14);
}

- (void)_dequeueAndInstallTickMarkForIndex:(unint64_t)a3
{
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  -[CEKDynamicTickMarksView _tickMarksReusePool](self, "_tickMarksReusePool");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)v5;
    objc_msgSend(v10, "removeObject:", v5);
  }
  else
  {
    if (-[CEKDynamicTickMarksView _isUsingCells](self, "_isUsingCells"))
    {
      v7 = (objc_class *)CEKDynamicTickCell;
    }
    else if (-[CEKDynamicTickMarksView _isUsingImages](self, "_isUsingImages"))
    {
      v7 = (objc_class *)MEMORY[0x1E0DC3890];
    }
    else
    {
      v7 = (objc_class *)MEMORY[0x1E0DC3F10];
    }
    v6 = objc_alloc_init(v7);
  }
  -[CEKDynamicTickMarksView addSubview:](self, "addSubview:", v6);
  -[CEKDynamicTickMarksView _tickMarksByIndex](self, "_tickMarksByIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  -[CEKDynamicTickMarksView _configureTickMark:forIndex:](self, "_configureTickMark:forIndex:", v6, a3);
}

- (void)_removeAndEnqueueTickMarkAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKDynamicTickMarksView _tickMarksByIndex](self, "_tickMarksByIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CEKDynamicTickMarksView _tickMarksByIndex](self, "_tickMarksByIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v8);

  objc_msgSend(v5, "removeFromSuperview");
  objc_msgSend(v5, "_removeAllRetargetableAnimations:", 0);
  -[CEKDynamicTickMarksView _tickMarksReusePool](self, "_tickMarksReusePool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v5);

}

- (void)_destroyAllTickMarks
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CEKDynamicTickMarksView _installedTickMarkIndexes](self, "_installedTickMarkIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__CEKDynamicTickMarksView__destroyAllTickMarks__block_invoke;
  v6[3] = &unk_1E70A4D38;
  v6[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v6);

  -[CEKDynamicTickMarksView _tickMarksReusePool](self, "_tickMarksReusePool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDynamicTickMarksView _setInstalledTickMarkIndexes:](self, "_setInstalledTickMarkIndexes:", v5);

  -[CEKDynamicTickMarksView _setSelectedIndexes:](self, "_setSelectedIndexes:", 0);
}

uint64_t __47__CEKDynamicTickMarksView__destroyAllTickMarks__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAndEnqueueTickMarkAtIndex:", a2);
}

- (void)tickMarksModelDidChangeWidthForTickMarkCountWithModel:(id)a3
{
  void *v4;
  id v5;

  -[CEKDynamicTickMarksView _setNeedsRefreshTickMarks](self, "_setNeedsRefreshTickMarks", a3);
  -[CEKDynamicTickMarksView _tickMarksVisibilityModel](self, "_tickMarksVisibilityModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsRebuild");

  -[CEKDynamicTickMarksView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tickMarksViewDidChangeWidthForTickMarkCount:", self);

}

- (void)setImageDataProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  _BOOL4 v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_imageDataProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_imageDataProvider);
    v7 = v6 == 0;

    v8 = objc_storeWeak((id *)&self->_imageDataProvider, obj);
    if (((v7 ^ (obj != 0)) & 1) == 0)
      -[CEKDynamicTickMarksView _destroyAllTickMarks](self, "_destroyAllTickMarks");
    -[CEKDynamicTickMarksView reloadContent](self, "reloadContent");
    v5 = obj;
  }

}

- (BOOL)_isUsingImages
{
  void *v2;
  BOOL v3;

  -[CEKDynamicTickMarksView imageDataProvider](self, "imageDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setCellDataProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  _BOOL4 v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cellDataProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_cellDataProvider);
    v7 = v6 == 0;

    v8 = objc_storeWeak((id *)&self->_cellDataProvider, obj);
    if (((v7 ^ (obj != 0)) & 1) == 0)
      -[CEKDynamicTickMarksView _destroyAllTickMarks](self, "_destroyAllTickMarks");
    -[CEKDynamicTickMarksView reloadContent](self, "reloadContent");
    v5 = obj;
  }

}

- (BOOL)_isUsingCells
{
  BOOL v3;
  void *v4;

  if (-[CEKDynamicTickMarksView _isUsingImages](self, "_isUsingImages"))
    return 0;
  -[CEKDynamicTickMarksView cellDataProvider](self, "cellDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[CEKDynamicTickMarksView setContentTransform:animated:](self, "setContentTransform:animated:", v4, 0);
}

- (void)setContentTransform:(CGAffineTransform *)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  CGAffineTransform *p_contentTransform;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  CGAffineTransform t2;
  CGAffineTransform t1;

  v4 = a4;
  p_contentTransform = &self->_contentTransform;
  v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v9 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_contentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (v4)
    {
      -[CEKDynamicTickMarksView layoutIfNeeded](self, "layoutIfNeeded");
      v10 = *(_OWORD *)&a3->a;
      v11 = *(_OWORD *)&a3->tx;
      *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
      *(_OWORD *)&p_contentTransform->tx = v11;
      *(_OWORD *)&p_contentTransform->a = v10;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__CEKDynamicTickMarksView_setContentTransform_animated___block_invoke;
      v14[3] = &unk_1E70A4B18;
      v14[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v14, 0, 0.3, 0.0);
    }
    else
    {
      v12 = *(_OWORD *)&a3->a;
      v13 = *(_OWORD *)&a3->tx;
      *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
      *(_OWORD *)&p_contentTransform->tx = v13;
      *(_OWORD *)&p_contentTransform->a = v12;
      -[CEKDynamicTickMarksView _refreshTickMarks](self, "_refreshTickMarks");
    }
  }
}

uint64_t __56__CEKDynamicTickMarksView_setContentTransform_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshTickMarks");
}

- (CEKTickMarksImageDataProvider)imageDataProvider
{
  return (CEKTickMarksImageDataProvider *)objc_loadWeakRetained((id *)&self->_imageDataProvider);
}

- (CEKTickMarksCellDataProvider)cellDataProvider
{
  return (CEKTickMarksCellDataProvider *)objc_loadWeakRetained((id *)&self->_cellDataProvider);
}

- (_TtC13CameraEditKit14TickMarksModel)tickMarksModel
{
  return self->_tickMarksModel;
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[12].a;
  return self;
}

- (CEKSliderTickMarksDelegate)delegate
{
  return (CEKSliderTickMarksDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)selectedTickMarkIndex
{
  return self->_selectedTickMarkIndex;
}

- (NSIndexSet)magneticTickMarkIndexes
{
  return self->_magneticTickMarkIndexes;
}

- (void)setMagneticTickMarkIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_magneticTickMarkIndexes, a3);
}

- (BOOL)highlightSelectedIndex
{
  return self->_highlightSelectedIndex;
}

- (NSMutableSet)_tickMarksReusePool
{
  return self->__tickMarksReusePool;
}

- (NSMutableDictionary)_tickMarksByIndex
{
  return self->__tickMarksByIndex;
}

- (_TtC13CameraEditKit24TickMarksVisibilityModel)_tickMarksVisibilityModel
{
  return self->__tickMarksVisibilityModel;
}

- (NSIndexSet)_installedTickMarkIndexes
{
  return self->__installedTickMarkIndexes;
}

- (void)_setInstalledTickMarkIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__installedTickMarkIndexes, a3);
}

- (NSIndexSet)_selectedIndexes
{
  return self->__selectedIndexes;
}

- (void)_setSelectedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->__selectedIndexes, a3);
}

- (BOOL)_needsTickMarkRefresh
{
  return self->__needsTickMarkRefresh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectedIndexes, 0);
  objc_storeStrong((id *)&self->__installedTickMarkIndexes, 0);
  objc_storeStrong((id *)&self->__tickMarksVisibilityModel, 0);
  objc_storeStrong((id *)&self->__tickMarksByIndex, 0);
  objc_storeStrong((id *)&self->__tickMarksReusePool, 0);
  objc_storeStrong((id *)&self->_magneticTickMarkIndexes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tickMarksModel, 0);
  objc_destroyWeak((id *)&self->_cellDataProvider);
  objc_destroyWeak((id *)&self->_imageDataProvider);
}

@end
