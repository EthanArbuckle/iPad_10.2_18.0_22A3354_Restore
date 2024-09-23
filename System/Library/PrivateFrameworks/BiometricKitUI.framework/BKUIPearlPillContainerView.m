@implementation BKUIPearlPillContainerView

- (BKUIPearlPillContainerView)init
{
  BKUIPearlPillContainerView *v2;
  uint64_t v3;
  NSMutableArray *pillViews;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)BKUIPearlPillContainerView;
  v2 = -[BKUIPearlPillContainerView init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 120);
    pillViews = v2->_pillViews;
    v2->_pillViews = (NSMutableArray *)v3;

    v5 = 120;
    do
    {
      v6 = (void *)objc_opt_new();
      -[NSMutableArray addObject:](v2->_pillViews, "addObject:", v6);
      -[BKUIPearlPillContainerView addSubview:](v2, "addSubview:", v6);
      objc_msgSend(v6, "setRadius:", 120.0);
      objc_msgSend(v6, "setPillCornerRadius:", 2.0);
      objc_msgSend(v6, "setNumberOfPills:", 120.0);
      objc_msgSend(v6, "setPillInitialHeight:", 13.0);
      objc_msgSend(v6, "setPillCompletedHeight:", 30.0);
      objc_msgSend(v6, "setRingHeight:", 3.5);

      --v5;
    }
    while (v5);
    v2->_clockwise = 0;
    v2->_counterwise = 0;
    v2->_lastAngle = 0;
    -[BKUIPearlPillContainerView resetPillsAnimated:](v2, "resetPillsAnimated:", 0);
    objc_initWeak(&location, v2);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__BKUIPearlPillContainerView_init__block_invoke;
    v10[3] = &unk_1EA27FB48;
    objc_copyWeak(&v11, &location);
    -[BKUIPearlPillContainerView registerForTraitChanges:withHandler:](v2, "registerForTraitChanges:withHandler:", v7, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillContainerView setTraitChangeRegistration:](v2, "setTraitChangeRegistration:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__BKUIPearlPillContainerView_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "layoutIfNeeded");

}

- (unint64_t)_numberOfVisiblePillViews
{
  unsigned int state;
  int64_t numberOfVisiblePillViews;

  state = self->_state;
  if (state > 0xA)
    goto LABEL_8;
  if (((1 << state) & 0x66) != 0)
  {
    numberOfVisiblePillViews = 64;
    goto LABEL_9;
  }
  if (((1 << state) & 0x580) == 0)
  {
    if (((1 << state) & 0x208) != 0)
    {
      numberOfVisiblePillViews = self->_numberOfVisiblePillViews;
      goto LABEL_9;
    }
LABEL_8:
    numberOfVisiblePillViews = 0;
    goto LABEL_9;
  }
  numberOfVisiblePillViews = 120;
LABEL_9:
  self->_numberOfVisiblePillViews = numberOfVisiblePillViews;
  return numberOfVisiblePillViews;
}

- (void)layoutSubviews
{
  unint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  _OWORD v11[3];

  v3 = -[BKUIPearlPillContainerView _numberOfVisiblePillViews](self, "_numberOfVisiblePillViews");
  if (-[NSMutableArray count](self->_pillViews, "count"))
  {
    v4 = 0;
    v5 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v4 >= v3)
      {
        objc_msgSend(v6, "setAlpha:", 0.0);
      }
      else
      {
        objc_msgSend(v6, "setAlpha:", 1.0);
        v8 = v5[1];
        v11[0] = *v5;
        v11[1] = v8;
        v11[2] = v5[2];
        objc_msgSend(v7, "setTransform:", v11);
        -[BKUIPearlPillContainerView bounds](self, "bounds");
        objc_msgSend(v7, "setFrame:");
        CGAffineTransformMakeRotation(&v10, (double)v4 / (double)v3 * -2.0 * 3.14159265 + 6.28318531 + -1.57079633);
        v9 = v10;
        objc_msgSend(v7, "setTransform:", &v9);
        objc_msgSend(v7, "setNumberOfPills:", (double)v3);
      }

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_pillViews, "count"));
  }
}

- (void)_animateToFinishedCompletion:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  LAUICheckmarkLayer *v9;
  LAUICheckmarkLayer *successAnimation;
  LAUICheckmarkLayer *v11;
  void *v12;
  LAUICheckmarkLayer *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  LAUICheckmarkLayer *v21;
  double v22;
  double v23;
  _BOOL4 IsReduceMotionEnabled;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  double v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  dispatch_block_t block;
  _QWORD v36[4];
  NSObject *v37;
  id v38[3];
  id from;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  NSObject *v45;
  id v46;
  BOOL v47;
  id location;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[BKUIPearlPillContainerView squareNeedsPositionLayout](self, "squareNeedsPositionLayout"))
  {
    block = v4;
    -[NSMutableArray firstObject](self->_pillViews, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ringHeight");
    v7 = v6;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44438]);
    successAnimation = self->_successAnimation;
    self->_successAnimation = v9;

    v11 = self->_successAnimation;
    v34 = objc_retainAutorelease(v8);
    -[LAUICheckmarkLayer setColor:animated:](v11, "setColor:animated:", objc_msgSend(v34, "CGColor"), 0);
    -[BKUIPearlPillContainerView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", self->_successAnimation);

    v13 = self->_successAnimation;
    -[BKUIPearlPillContainerView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 34.7999992 - v7;
    objc_msgSend(v14, "contentsScale");
    -[LAUICheckmarkLayer defaultSizeForCircleWithDiameter:scale:](v13, "defaultSizeForCircleWithDiameter:scale:", v15 + v15, v16);
    v18 = v17;
    v20 = v19;

    -[LAUICheckmarkLayer setFrame:](self->_successAnimation, "setFrame:", 0.0, 0.0, v18, v20);
    v21 = self->_successAnimation;
    -[BKUIPearlPillContainerView bounds](self, "bounds");
    v23 = v22 * 0.5;
    -[BKUIPearlPillContainerView enrollViewCenter](self, "enrollViewCenter");
    -[LAUICheckmarkLayer setPosition:](v21, "setPosition:", v23);
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v25 = dispatch_group_create();
    dispatch_group_enter(v25);
    objc_initWeak(&location, self);
    v26 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke;
    v44[3] = &unk_1EA280530;
    objc_copyWeak(&v46, &location);
    v47 = IsReduceMotionEnabled;
    v27 = v25;
    v45 = v27;
    -[BKUIPearlPillContainerView setAllPillState:animated:completion:](self, "setAllPillState:animated:completion:", 5, !IsReduceMotionEnabled, v44);
    if (IsReduceMotionEnabled)
      v28 = 0.0;
    else
      v28 = 0.5;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v29 = self->_pillViews;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v41 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          dispatch_group_enter(v27);
          objc_initWeak(&from, v33);
          v36[0] = v26;
          v36[1] = 3221225472;
          v36[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_4;
          v36[3] = &unk_1EA280558;
          objc_copyWeak(v38, &from);
          v38[1] = *(id *)&v15;
          v38[2] = *(id *)&v28;
          v37 = v27;
          objc_msgSend(v33, "setRadius:animationDuration:completion:", v36, v15 * 0.899999976, v28 * 0.7);

          objc_destroyWeak(v38);
          objc_destroyWeak(&from);
        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v30);
    }

    if (block)
      dispatch_group_notify(v27, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

    v4 = block;
  }

}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  char v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "squareNeedsPositionLayout"))
    {
      v4 = dispatch_time(0, 1000000000);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_2;
      v5[3] = &unk_1EA280410;
      v5[4] = v3;
      v6 = *(_BYTE *)(a1 + 48);
      dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
    }
    else
    {
      objc_msgSend(v3[53], "setRevealed:animated:", 1, *(_BYTE *)(a1 + 48) == 0);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 424);
  v3 = (void *)MEMORY[0x1E0CEABB0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_3;
  v5[3] = &unk_1EA280410;
  v6 = v2;
  v7 = *(_BYTE *)(a1 + 40);
  v4 = v2;
  objc_msgSend(v3, "animateWithDuration:animations:", v5, 0.3);

}

uint64_t __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRevealed:animated:", 1, *(_BYTE *)(a1 + 40) == 0);
}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56) * 0.3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_5;
  v5[3] = &unk_1EA27FB98;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "setRadius:animationDuration:completion:", v5, v3, v4);

}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (double)percentOfPillsCompleted
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  double v8;

  v3 = -[BKUIPearlPillContainerView _numberOfVisiblePillViews](self, "_numberOfVisiblePillViews");
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isCompleted");

      v5 += v7;
      ++v4;
    }
    while (v3 != v4);
    v8 = (double)v5;
  }
  else
  {
    v8 = 0.0;
  }
  return v8 / (double)v3;
}

- (void)setAllPillState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  dispatch_block_t block;
  NSMutableArray *obj;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v5 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  block = a5;
  v8 = dispatch_group_create();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_pillViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v19[0] = v12;
        v19[1] = 3221225472;
        v19[2] = __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke;
        v19[3] = &unk_1EA27FB98;
        v20 = v8;
        v17[0] = v12;
        v17[1] = 3221225472;
        v17[2] = __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke_2;
        v17[3] = &unk_1EA27FB98;
        v18 = v20;
        objc_msgSend(v14, "setState:animated:animationDelay:completion:failure:", a3, v5, v19, v17, 0.0);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  if (block)
    dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

}

void __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)stashPillStates
{
  __assert_rtn("-[BKUIPearlPillContainerView stashPillStates]", "BKUIPearlPillContainerView.m", 237, "_stashedPillStates[i] == BKUIPearlPillStateNone");
}

- (void)unstashPillStatesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  unint64_t *stashedPillStates;
  unint64_t v7;
  void *v8;

  v3 = a3;
  v5 = 0;
  stashedPillStates = self->_stashedPillStates;
  do
  {
    if (!stashedPillStates[v5])
      -[BKUIPearlPillContainerView unstashPillStatesAnimated:].cold.1();
    if (v5 < -[NSMutableArray count](self->_pillViews, "count"))
    {
      v7 = stashedPillStates[v5];
      -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setState:animated:animationDelay:completion:failure:", v7, v3, 0, 0, 0.0);

    }
    stashedPillStates[v5++] = 0;
  }
  while (v5 != 120);
  self->_hasPillStateStash = 0;
}

- (BOOL)unstashPillStatesIfNeededAnimated:(BOOL)a3
{
  _BOOL4 hasPillStateStash;

  hasPillStateStash = self->_hasPillStateStash;
  if (self->_hasPillStateStash)
    -[BKUIPearlPillContainerView unstashPillStatesAnimated:](self, "unstashPillStatesAnimated:", a3);
  return hasPillStateStash;
}

- (void)resetPillsAnimated:(BOOL)a3
{
  -[BKUIPearlPillContainerView setAllPillState:animated:completion:](self, "setAllPillState:animated:completion:", 2, a3, 0);
}

- (int64_t)_indexForPillAtAngle:(double)a3
{
  unint64_t v4;

  v4 = -[BKUIPearlPillContainerView _numberOfVisiblePillViews](self, "_numberOfVisiblePillViews");
  if (v4)
    return (unint64_t)(a3 / (6.28318531 / (double)v4)) % v4;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)fillPillsAroundAngle:(double)a3 forTutorial:(BOOL)a4
{
  double v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  int64_t v10;
  int64_t clockwise;
  unint64_t v12;
  char v13;
  float v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a4)
    v6 = 0.05;
  else
    v6 = 0.02;
  if (a4)
    v7 = 1;
  else
    v7 = 3;
  v8 = -[BKUIPearlPillContainerView _numberOfVisiblePillViews](self, "_numberOfVisiblePillViews");
  v9 = 6.28318531;
  if (a3 + 0.392699082 >= 0.0)
    v9 = 0.0;
  v10 = (uint64_t)((a3 + 0.392699082 + v9) * 100.0);
  self->_counterwise -= self->_lastAngle < v10;
  if (self->_lastAngle <= v10)
    clockwise = self->_clockwise;
  else
    clockwise = self->_clockwise + 1;
  self->_clockwise = clockwise;
  self->_lastAngle = v10;
  v12 = -[BKUIPearlPillContainerView _indexForPillAtAngle:](self, "_indexForPillAtAngle:");
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
    return v13 & 1;
  }
  v14 = (double)v8 * 0.125;
  v15 = vcvtps_u32_f32(v14);
  v16 = (uint64_t)((int)(v12 / v15) * v15 - (v15 >> 1)) % (uint64_t)v8;
  v17 = (v8 & (v16 >> 63)) + v16;
  v18 = v17 + v15;
  if ((self->_counterwise + self->_clockwise < 0) ^ __OFADD__(self->_counterwise, self->_clockwise) | (self->_counterwise + self->_clockwise == 0))
  {
    if (v17 < v18)
    {
      v13 = 0;
      v23 = 0.0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v17 % v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v13 |= objc_msgSend(v24, "state") != v7;
        objc_msgSend(v24, "setState:animated:animationDelay:completion:failure:", v7, 1, 0, 0, v23);
        v23 = v6 + v23;

        ++v17;
        --v15;
      }
      while (v15);
      goto LABEL_26;
    }
  }
  else
  {
    v19 = v18 - 1;
    if (v18 - 1 >= v17)
    {
      v20 = 0;
      v21 = 0.0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v19 % v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "state") != v7)
          v20 = 1;
        objc_msgSend(v22, "setState:animated:animationDelay:completion:failure:", v7, 1, 0, 0, v21);
        v21 = v6 + v21;

        --v19;
      }
      while (v19 >= v17);
      v13 = v20;
      goto LABEL_26;
    }
  }
  v13 = 0;
LABEL_26:
  v25 = self->_clockwise;
  v26 = self->_counterwise + v25;
  v27 = v26 - 2;
  if (v26 <= 2)
    v27 = 0;
  self->_clockwise = v25 - v27;
  v28 = v26 + 2;
  if (v26 >= -2)
    v28 = 0;
  self->_counterwise -= v28;
  return v13 & 1;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:](self->_pillViews, "makeObjectsPerformSelector:", sel_tearDownPillView);
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlPillContainerView;
  -[BKUIPearlPillContainerView dealloc](&v3, sel_dealloc);
}

- (BOOL)fillPillsAroundAngle:(double)a3
{
  return -[BKUIPearlPillContainerView fillPillsAroundAngle:forTutorial:](self, "fillPillsAroundAngle:forTutorial:", 0, a3);
}

- (id)unfilledDirections
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = (id)objc_opt_new();
  v3 = objc_msgSend(&unk_1EA2989B0, "count");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(&unk_1EA2989B0, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(&unk_1EA2989B0);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "integerValue");
        v9 = -[BKUIPearlPillContainerView _indexForPillAtAngle:](self, "_indexForPillAtAngle:", 6.28318531 / (double)v3 * (double)v8);
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "state");

          if (v11 == 2)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v12);

          }
        }
      }
      v5 = objc_msgSend(&unk_1EA2989B0, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  return v14;
}

- (void)setRadius:(double)a3 center:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  double y;
  double x;
  id v11;
  double v12;
  NSObject *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = a5;
  y = a4.y;
  x = a4.x;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  -[BKUIPearlPillContainerView setEnrollViewCenter:](self, "setEnrollViewCenter:", x, y);
  -[BKUIPearlPillContainerView setNeedsLayout](self, "setNeedsLayout");
  if (v6)
    v12 = 0.5;
  else
    v12 = 0.0;
  v13 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = self->_pillViews;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        dispatch_group_enter(v13);
        v21[0] = v18;
        v21[1] = 3221225472;
        v21[2] = __67__BKUIPearlPillContainerView_setRadius_center_animated_completion___block_invoke;
        v21[3] = &unk_1EA27FB98;
        v22 = v13;
        objc_msgSend(v20, "setRadius:animationDuration:completion:", v21, a3, v12);

        ++v19;
      }
      while (v16 != v19);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  if (v11)
    dispatch_group_notify(v13, MEMORY[0x1E0C80D38], v11);

}

void __67__BKUIPearlPillContainerView_setRadius_center_animated_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)animateToState:(int)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  int state;
  int v8;
  void (**v9)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  state = self->_state;
  if (state == a3)
  {
    if (v6)
    {
      v9 = v6;
      v6[2](v6);
LABEL_11:
      v6 = v9;
    }
  }
  else
  {
    v9 = v6;
    if (state == 10)
      -[LAUICheckmarkLayer setRevealed:animated:](self->_successAnimation, "setRevealed:animated:", 0, 0);
    self->_state = a3;
    -[BKUIPearlPillContainerView setNeedsLayout](self, "setNeedsLayout");
    v8 = self->_state;
    if ((v8 - 6) >= 3 && v8 == 10)
    {
      -[BKUIPearlPillContainerView _animateToFinishedCompletion:](self, "_animateToFinishedCompletion:", v9);
      goto LABEL_11;
    }
    v6 = v9;
    if (v9)
    {
      v9[2](v9);
      goto LABEL_11;
    }
  }

}

- (double)radius
{
  return self->_radius;
}

- (BOOL)squareNeedsPositionLayout
{
  return self->_squareNeedsPositionLayout;
}

- (void)setSquareNeedsPositionLayout:(BOOL)a3
{
  self->_squareNeedsPositionLayout = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (CGPoint)enrollViewCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_enrollViewCenter.x;
  y = self->_enrollViewCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEnrollViewCenter:(CGPoint)a3
{
  self->_enrollViewCenter = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_successAnimation, 0);
  objc_storeStrong((id *)&self->_pillViews, 0);
}

- (void)unstashPillStatesAnimated:.cold.1()
{
  __assert_rtn("-[BKUIPearlPillContainerView unstashPillStatesAnimated:]", "BKUIPearlPillContainerView.m", 246, "_stashedPillStates[i] != BKUIPearlPillStateNone");
}

@end
