@implementation HPSSpatialProfileEarPillContainerView

- (HPSSpatialProfileEarPillContainerView)init
{
  HPSSpatialProfileEarPillContainerView *v2;
  uint64_t v3;
  NSMutableArray *pillViews;
  unint64_t v5;
  __int128 v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  __int128 v12;
  objc_super v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HPSSpatialProfileEarPillContainerView;
  v2 = -[HPSSpatialProfileEarPillContainerView init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 11);
    pillViews = v2->_pillViews;
    v2->_pillViews = (NSMutableArray *)v3;

    v5 = 0;
    *(_QWORD *)&v6 = 134217984;
    v12 = v6;
    do
    {
      sharedBluetoothSettingsLogComponent();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v12;
        v15 = v5;
        _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Pill: init: %lu", buf, 0xCu);
      }

      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setRadius:", 0.0);
      objc_msgSend(v8, "setPillCornerRadius:", 2.0);
      objc_msgSend(v8, "setNumberOfPills:", 11.0);
      objc_msgSend(v8, "setRingHeight:", 3.5);
      if (v5 <= 0xA && ((1 << v5) & 0x421) != 0)
      {
        v9 = 25.0;
        v10 = 20.0;
      }
      else
      {
        v9 = 15.0;
        v10 = 10.0;
      }
      objc_msgSend(v8, "setPillInitialHeight:", v10, v12);
      objc_msgSend(v8, "setPillCompletedHeight:", v9);
      -[NSMutableArray addObject:](v2->_pillViews, "addObject:", v8);
      -[HPSSpatialProfileEarPillContainerView addSubview:](v2, "addSubview:", v8);

      ++v5;
    }
    while (v5 != 11);
    v2->_clockwise = 0;
    v2->_counterwise = 0;
    v2->_lastAngle = 0;
    -[HPSSpatialProfileEarPillContainerView resetPillsAnimated:](v2, "resetPillsAnimated:", 0);
  }
  return v2;
}

- (unint64_t)_numberOfVisiblePillViews
{
  unsigned int state;
  int v3;
  int64_t numberOfVisiblePillViews;

  state = self->_state;
  if (state > 0xA)
    goto LABEL_6;
  v3 = 1 << state;
  if ((v3 & 0x5E6) == 0)
  {
    if ((v3 & 0x208) != 0)
    {
      numberOfVisiblePillViews = self->_numberOfVisiblePillViews;
      goto LABEL_7;
    }
LABEL_6:
    numberOfVisiblePillViews = 0;
    goto LABEL_7;
  }
  numberOfVisiblePillViews = 11;
LABEL_7:
  self->_numberOfVisiblePillViews = numberOfVisiblePillViews;
  return numberOfVisiblePillViews;
}

- (void)layoutSubviews
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  CGAffineTransform v7;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  if (-[NSMutableArray count](self->_pillViews, "count"))
  {
    v3 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSSpatialProfileEarPillContainerView bounds](self, "bounds");
      objc_msgSend(v4, "setFrame:");
      memset(&v12, 0, sizeof(v12));
      CGAffineTransformMakeRotation(&v12, 3.14159265);
      memset(&v11, 0, sizeof(v11));
      v5 = -[NSMutableArray count](self->_pillViews, "count");
      if (v5 >= 0)
        v6 = v5;
      else
        v6 = v5 + 1;
      CGAffineTransformMakeTranslation(&v11, (double)(uint64_t)(v3 - (v6 >> 1)) * 13.0, 0.0);
      t1 = v12;
      t2 = v11;
      CGAffineTransformConcat(&v10, &t1, &t2);
      v7 = v10;
      objc_msgSend(v4, "setTransform:", &v7);
      objc_msgSend(v4, "setNumberOfPills:", (double)(unint64_t)-[NSMutableArray count](self->_pillViews, "count"));

      ++v3;
    }
    while (v3 < -[NSMutableArray count](self->_pillViews, "count"));
  }
}

- (void)_animateToFinishedCompletion:(id)a3
{
  void *v4;
  double v5;
  double v6;
  LAUICheckmarkLayer *v7;
  LAUICheckmarkLayer *successAnimation;
  LAUICheckmarkLayer *v9;
  void *v10;
  void *v11;
  LAUICheckmarkLayer *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  LAUICheckmarkLayer *v20;
  double v21;
  double v22;
  _BOOL4 IsReduceMotionEnabled;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  double v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  dispatch_block_t block;
  _QWORD v34[4];
  NSObject *v35;
  id v36[3];
  id from;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  BOOL v45;
  id location;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  block = a3;
  -[NSMutableArray firstObject](self->_pillViews, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ringHeight");
  v6 = v5;

  v7 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44440]);
  successAnimation = self->_successAnimation;
  self->_successAnimation = v7;

  v9 = self->_successAnimation;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAUICheckmarkLayer setPrimaryColor:animated:](v9, "setPrimaryColor:animated:", v10, 0);

  -[HPSSpatialProfileEarPillContainerView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", self->_successAnimation);

  v12 = self->_successAnimation;
  -[HPSSpatialProfileEarPillContainerView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 34.7999992 - v6;
  objc_msgSend(v13, "contentsScale");
  -[LAUICheckmarkLayer defaultSizeForCircleWithDiameter:scale:](v12, "defaultSizeForCircleWithDiameter:scale:", v14 + v14, v15);
  v17 = v16;
  v19 = v18;

  -[LAUICheckmarkLayer setFrame:](self->_successAnimation, "setFrame:", 0.0, 0.0, v17, v19);
  v20 = self->_successAnimation;
  -[HPSSpatialProfileEarPillContainerView bounds](self, "bounds");
  v22 = v21 * 0.5;
  -[HPSSpatialProfileEarPillContainerView enrollViewCenter](self, "enrollViewCenter");
  -[LAUICheckmarkLayer setPosition:](v20, "setPosition:", v22);
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v24 = dispatch_group_create();
  dispatch_group_enter(v24);
  location = 0;
  objc_initWeak(&location, self);
  v25 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke;
  v42[3] = &unk_1EA29B0F0;
  objc_copyWeak(&v44, &location);
  v45 = IsReduceMotionEnabled;
  v26 = v24;
  v43 = v26;
  -[HPSSpatialProfileEarPillContainerView setAllPillState:animated:completion:](self, "setAllPillState:animated:completion:", 5, !IsReduceMotionEnabled, v42);
  if (IsReduceMotionEnabled)
    v27 = 0.0;
  else
    v27 = 0.5;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = self->_pillViews;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        dispatch_group_enter(v26);
        from = 0;
        objc_initWeak(&from, v32);
        v34[0] = v25;
        v34[1] = 3221225472;
        v34[2] = __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_2;
        v34[3] = &unk_1EA29B118;
        objc_copyWeak(v36, &from);
        v36[1] = *(id *)&v14;
        v36[2] = *(id *)&v27;
        v35 = v26;
        objc_msgSend(v32, "setRadius:animationDuration:completion:", v34, v14 * 0.899999976, v27 * 0.7);

        objc_destroyWeak(v36);
        objc_destroyWeak(&from);
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v29);
  }

  if (block)
    dispatch_group_notify(v26, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

void __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained[53], "setRevealed:animated:", 1, *(_BYTE *)(a1 + 48) == 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_2(uint64_t a1)
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
  v5[2] = __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_3;
  v5[3] = &unk_1EA29A770;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "setRadius:animationDuration:completion:", v5, v3, v4);

}

void __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_3(uint64_t a1)
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

  v3 = -[HPSSpatialProfileEarPillContainerView _numberOfVisiblePillViews](self, "_numberOfVisiblePillViews");
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
        v19[2] = __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke;
        v19[3] = &unk_1EA29A770;
        v20 = v8;
        v17[0] = v12;
        v17[1] = 3221225472;
        v17[2] = __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke_2;
        v17[3] = &unk_1EA29A770;
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

void __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)stashPillStates
{
  __assert_rtn("-[HPSSpatialProfileEarPillContainerView stashPillStates]", "HPSSpatialProfileEarPillContainerView.m", 216, "_stashedPillStates[i] == BKUIPearlPillStateNone");
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
      -[HPSSpatialProfileEarPillContainerView unstashPillStatesAnimated:].cold.1();
    if (v5 < -[NSMutableArray count](self->_pillViews, "count"))
    {
      v7 = stashedPillStates[v5];
      -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setState:animated:animationDelay:completion:failure:", v7, v3, 0, 0, 0.0);

    }
    stashedPillStates[v5++] = 0;
  }
  while (v5 != 11);
  self->_hasPillStateStash = 0;
}

- (BOOL)unstashPillStatesIfNeededAnimated:(BOOL)a3
{
  _BOOL4 hasPillStateStash;

  hasPillStateStash = self->_hasPillStateStash;
  if (self->_hasPillStateStash)
    -[HPSSpatialProfileEarPillContainerView unstashPillStatesAnimated:](self, "unstashPillStatesAnimated:", a3);
  return hasPillStateStash;
}

- (void)resetPillsAnimated:(BOOL)a3
{
  -[HPSSpatialProfileEarPillContainerView setAllPillState:animated:completion:](self, "setAllPillState:animated:completion:", 2, a3, 0);
}

- (int64_t)_indexForPillAtAngle:(double)a3
{
  unint64_t v4;

  v4 = -[HPSSpatialProfileEarPillContainerView _numberOfVisiblePillViews](self, "_numberOfVisiblePillViews");
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
  v8 = -[HPSSpatialProfileEarPillContainerView _numberOfVisiblePillViews](self, "_numberOfVisiblePillViews");
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
  v12 = -[HPSSpatialProfileEarPillContainerView _indexForPillAtAngle:](self, "_indexForPillAtAngle:");
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
  v3.super_class = (Class)HPSSpatialProfileEarPillContainerView;
  -[HPSSpatialProfileEarPillContainerView dealloc](&v3, sel_dealloc);
}

- (BOOL)fillPillsAroundAngle:(double)a3
{
  return -[HPSSpatialProfileEarPillContainerView fillPillsAroundAngle:forTutorial:](self, "fillPillsAroundAngle:forTutorial:", 0, a3);
}

- (id)unfilledDirections
{
  return (id)objc_opt_new();
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
  -[HPSSpatialProfileEarPillContainerView setEnrollViewCenter:](self, "setEnrollViewCenter:", x, y);
  -[HPSSpatialProfileEarPillContainerView setNeedsLayout](self, "setNeedsLayout");
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
        v21[2] = __78__HPSSpatialProfileEarPillContainerView_setRadius_center_animated_completion___block_invoke;
        v21[3] = &unk_1EA29A770;
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

void __78__HPSSpatialProfileEarPillContainerView_setRadius_center_animated_completion___block_invoke(uint64_t a1)
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
    -[HPSSpatialProfileEarPillContainerView setNeedsLayout](self, "setNeedsLayout");
    v8 = self->_state;
    if ((v8 - 6) >= 3 && v8 == 10)
    {
      -[HPSSpatialProfileEarPillContainerView _animateToFinishedCompletion:](self, "_animateToFinishedCompletion:", v9);
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

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HPSSpatialProfileEarPillContainerView;
  -[HPSSpatialProfileEarPillContainerView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HPSSpatialProfileEarPillContainerView layoutSubviews](self, "layoutSubviews");
}

- (void)fillLeftPillsWithCompletion:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillLeftPills", buf, 2u);
  }

  v5 = dispatch_group_create();
  v6 = 0;
  v7 = MEMORY[0x1E0C809B0];
  do
  {
    dispatch_group_enter(v5);
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v6;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillLeftPills filling: %lu", buf, 0xCu);
    }

    -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke;
    v15[3] = &unk_1EA29A770;
    v10 = v5;
    v16 = v10;
    objc_msgSend(v9, "setState:animated:animationDelay:completion:failure:", 3, 1, v15, 0, 0.0);

    ++v6;
  }
  while (v6 != 4);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke_2;
  block[3] = &unk_1EA29A6D8;
  v14 = v12;
  v11 = v12;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

}

void __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fillCentralPillsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills", buf, 2u);
  }

  v6 = dispatch_group_create();
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = 5;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills filling: %lu", buf, 0xCu);
  }

  dispatch_group_enter(v6);
  -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke;
  v24[3] = &unk_1EA29A770;
  v10 = v6;
  v25 = v10;
  objc_msgSend(v8, "setState:animated:animationDelay:completion:failure:", 3, 1, v24, 0, 0.0);

  sharedBluetoothSettingsLogComponent();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = 6;
    _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills filling: %lu", buf, 0xCu);
  }

  dispatch_group_enter(v10);
  -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_13;
  v22[3] = &unk_1EA29A770;
  v13 = v10;
  v23 = v13;
  objc_msgSend(v12, "setState:animated:animationDelay:completion:failure:", 3, 1, v22, 0, 0.0);

  sharedBluetoothSettingsLogComponent();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = 4;
    _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills filling: %lu", buf, 0xCu);
  }

  dispatch_group_enter(v13);
  -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_14;
  v20[3] = &unk_1EA29A770;
  v21 = v13;
  v16 = v13;
  objc_msgSend(v15, "setState:animated:animationDelay:completion:failure:", 3, 1, v20, 0, 0.0);

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_2;
  v18[3] = &unk_1EA29A6D8;
  v19 = v4;
  v17 = v4;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v18);

}

void __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_13(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_14(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fillRightPillsWithCompletion:(id)a3
{
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillRightPills", buf, 2u);
  }

  v5 = 10;
  v6 = dispatch_group_create();
  v7 = MEMORY[0x1E0C809B0];
  do
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v5;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillRightPills filling: %lu", buf, 0xCu);
    }

    dispatch_group_enter(v6);
    -[NSMutableArray objectAtIndexedSubscript:](self->_pillViews, "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke;
    v15[3] = &unk_1EA29A770;
    v10 = v6;
    v16 = v10;
    objc_msgSend(v9, "setState:animated:animationDelay:completion:failure:", 3, 1, v15, 0, 0.0);

    --v5;
  }
  while (v5 > 6);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke_2;
  block[3] = &unk_1EA29A6D8;
  v14 = v12;
  v11 = v12;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

}

void __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)radius
{
  return self->_radius;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successAnimation, 0);
  objc_storeStrong((id *)&self->_pillViews, 0);
}

- (void)unstashPillStatesAnimated:.cold.1()
{
  __assert_rtn("-[HPSSpatialProfileEarPillContainerView unstashPillStatesAnimated:]", "HPSSpatialProfileEarPillContainerView.m", 225, "_stashedPillStates[i] != BKUIPearlPillStateNone");
}

@end
