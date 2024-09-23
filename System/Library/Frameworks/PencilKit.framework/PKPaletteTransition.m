@implementation PKPaletteTransition

- (PKPaletteTransition)initWithInitialVisualState:(int64_t)a3
{
  PKPaletteTransition *v4;
  PKPaletteTransition *v5;
  uint64_t v6;
  NSArray *remainingTransitionStages;
  NSArray *v8;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty *rotationAngleAnimatableProperty;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIViewFloatAnimatableProperty *v19;
  UIViewFloatAnimatableProperty *expandedToCollapsedAnimatableProperty;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  unint64_t v28;
  __CFString *v29;
  id *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  __CFString *v41;
  void *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)PKPaletteTransition;
  v4 = -[PKPaletteTransition init](&v37, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_targetVisualState = a3;
    v4->_intermediateVisualState = a3;
    v4->_initialVisualState = a3;
    objc_initWeak(&location, v4);
    v6 = 2 * (a3 == 6);
    remainingTransitionStages = v5->__remainingTransitionStages;
    v8 = (NSArray *)MEMORY[0x1E0C9AA60];
    if (a3 == 7)
      v6 = 1;
    v5->_pointingDirection = v6;
    v5->__remainingTransitionStages = v8;

    v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
    rotationAngleAnimatableProperty = v5->_rotationAngleAnimatableProperty;
    v5->_rotationAngleAnimatableProperty = v9;

    v11 = -[PKPaletteTransition pointingDirection](v5, "pointingDirection");
    -[PKPaletteTransition rotationAngleAnimatableProperty](v5, "rotationAngleAnimatableProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1.57079633;
    if (v11 != 2)
      v14 = 0.0;
    if (v11 == 1)
      v14 = -1.57079633;
    objc_msgSend(v12, "setValue:", v14);

    v15 = (void *)MEMORY[0x1E0DC3F10];
    -[PKPaletteTransition rotationAngleAnimatableProperty](v5, "rotationAngleAnimatableProperty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __50__PKPaletteTransition_initWithInitialVisualState___block_invoke;
    v34[3] = &unk_1E7777588;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v15, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v17, v34);

    v19 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
    expandedToCollapsedAnimatableProperty = v5->_expandedToCollapsedAnimatableProperty;
    v5->_expandedToCollapsedAnimatableProperty = v19;

    v21 = 1.0;
    if ((unint64_t)(a3 - 1) <= 6)
      v21 = dbl_1BE4FD940[a3 - 1];
    -[PKPaletteTransition expandedToCollapsedAnimatableProperty](v5, "expandedToCollapsedAnimatableProperty", &v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:", v21);

    v23 = (void *)MEMORY[0x1E0DC3F10];
    -[PKPaletteTransition expandedToCollapsedAnimatableProperty](v5, "expandedToCollapsedAnimatableProperty");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __50__PKPaletteTransition_initWithInitialVisualState___block_invoke_2;
    v32[3] = &unk_1E7777588;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v23, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v25, v32);

    v26 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      PKPaletteVisualStateDescription(a3);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = -[PKPaletteTransition pointingDirection](v5, "pointingDirection");
      if (v28 > 2)
        v29 = 0;
      else
        v29 = off_1E777B0C8[v28];
      *(_DWORD *)buf = 138412546;
      v39 = v27;
      v40 = 2112;
      v41 = v29;
      _os_log_impl(&dword_1BE213000, v26, OS_LOG_TYPE_DEFAULT, "Initializing palette transition with initial state %@+%@.", buf, 0x16u);

    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __50__PKPaletteTransition_initWithInitialVisualState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleRotationAnimatablePropertyPresentationValueChanged");
    WeakRetained = v2;
  }

}

void __50__PKPaletteTransition_initWithInitialVisualState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleExpandedToCollapsedAnimatablePropertyPresentationValueChanged");
    WeakRetained = v2;
  }

}

- (void)_setIntermediateVisualState:(int64_t)a3
{
  id v4;

  if (self->_intermediateVisualState != a3)
  {
    self->_intermediateVisualState = a3;
    -[PKPaletteTransition delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionIntermediateVisualStateDidChange:", self);

  }
}

- (void)_setPointingDirection:(int64_t)a3
{
  id v4;

  if (self->_pointingDirection != a3)
  {
    self->_pointingDirection = a3;
    -[PKPaletteTransition delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionPointingDirectionDidChange:", self);

  }
}

- (int64_t)_currentStage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (BOOL)isTransitionInProgress
{
  void *v2;
  BOOL v3;

  -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (double)expandedToCollapsedRatio
{
  void *v2;
  double v3;
  double v4;

  -[PKPaletteTransition expandedToCollapsedAnimatableProperty](self, "expandedToCollapsedAnimatableProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  return v4;
}

- (void)transitionToVisualState:(int64_t)a3
{
  unint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (-[PKPaletteTransition targetVisualState](self, "targetVisualState") != a3)
  {
    v5 = -[PKPaletteTransition intermediateVisualState](self, "intermediateVisualState");
    v6 = -[PKPaletteTransition pointingDirection](self, "pointingDirection");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    switch(v5)
    {
      case 2uLL:
        switch(a3)
        {
          case 2:
            if (!v6)
              goto LABEL_49;
            v9 = &unk_1E77ECB68;
            break;
          case 3:
            if (v6)
              objc_msgSend(v7, "addObjectsFromArray:", &unk_1E77ECB80);
            v10 = &unk_1E77EBCD0;
            goto LABEL_45;
          case 4:
          case 5:
            if (v6)
              objc_msgSend(v7, "addObjectsFromArray:", &unk_1E77ECB98);
            v9 = &unk_1E77ECBB0;
            goto LABEL_48;
          case 6:
          case 7:
            v9 = &unk_1E77ECBC8;
            goto LABEL_48;
          default:
            goto LABEL_49;
        }
        goto LABEL_48;
      case 3uLL:
        switch(a3)
        {
          case 2:
            if (v6)
              objc_msgSend(v7, "addObjectsFromArray:", &unk_1E77ECBE0);
            v10 = &unk_1E77EBD00;
LABEL_45:
            objc_msgSend(v8, "addObject:", v10);
            goto LABEL_49;
          case 3:
            if (!v6)
              goto LABEL_49;
            v9 = &unk_1E77ECBF8;
            break;
          case 4:
          case 5:
            if (v6)
              objc_msgSend(v7, "addObjectsFromArray:", &unk_1E77ECC10);
            v9 = &unk_1E77ECC28;
            goto LABEL_48;
          case 6:
          case 7:
            v9 = &unk_1E77ECC40;
            goto LABEL_48;
          default:
            goto LABEL_49;
        }
        goto LABEL_48;
      case 4uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1E77ECC58;
          goto LABEL_48;
        }
        if ((unint64_t)(a3 - 6) < 2)
        {
          v9 = &unk_1E77ECC88;
          goto LABEL_48;
        }
        if (a3 != 5)
          goto LABEL_49;
        v9 = &unk_1E77ECC70;
        goto LABEL_48;
      case 5uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1E77ECCA0;
          goto LABEL_48;
        }
        if ((unint64_t)(a3 - 6) < 2)
        {
          v9 = &unk_1E77ECCD0;
          goto LABEL_48;
        }
        if (a3 != 4)
          goto LABEL_49;
        v9 = &unk_1E77ECCB8;
        goto LABEL_48;
      case 6uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1E77ECCE8;
          goto LABEL_48;
        }
        if ((unint64_t)(a3 - 4) < 2)
        {
          v9 = &unk_1E77ECD00;
          goto LABEL_48;
        }
        if (a3 != 7)
          goto LABEL_49;
        v9 = &unk_1E77ECD18;
        goto LABEL_48;
      case 7uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1E77ECD30;
        }
        else if ((unint64_t)(a3 - 4) >= 2)
        {
          if (a3 != 6)
            goto LABEL_49;
          v9 = &unk_1E77ECD60;
        }
        else
        {
          v9 = &unk_1E77ECD48;
        }
LABEL_48:
        objc_msgSend(v8, "addObjectsFromArray:", v9);
LABEL_49:
        v11 = -[PKPaletteTransition _currentStage](self, "_currentStage");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          PKPaletteVisualStateDescription(v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PKPaletteTransition pointingDirection](self, "pointingDirection");
          if (v17 > 2)
            v18 = 0;
          else
            v18 = off_1E777B0C8[v17];
          PKPaletteVisualStateDescription(a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412802;
          v21 = v16;
          v22 = 2112;
          v23 = v18;
          v24 = 2112;
          v25 = v19;
          _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Begin transition from visual state %@+%@ to new target %@.", (uint8_t *)&v20, 0x20u);

        }
        -[PKPaletteTransition set_remainingTransitionStages:](self, "set_remainingTransitionStages:", v14);
        -[PKPaletteTransition _setTargetVisualState:](self, "_setTargetVisualState:", a3);
        -[PKPaletteTransition _moveToNextTransitionStageIfReady](self, "_moveToNextTransitionStageIfReady");

        break;
      default:
        goto LABEL_49;
    }
  }
}

- (BOOL)_canMoveToNextTransitionStage
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL result;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;

  -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = -[PKPaletteTransition _currentStage](self, "_currentStage");
  if (v4 < 2)
  {
    v8 = 0;
  }
  else
  {
    -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  switch(v5)
  {
    case 0:
    case 3:
    case 4:
      goto LABEL_6;
    case 1:
      if (v8 > 5)
        return 0;
      if (((1 << v8) & 0x39) == 0)
        goto LABEL_6;
      -[PKPaletteTransition expandedToCollapsedAnimatableProperty](self, "expandedToCollapsedAnimatableProperty");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v12 = v11;
      -[PKPaletteTransition expandedToCollapsedAnimatableProperty](self, "expandedToCollapsedAnimatableProperty");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentationValue");
      v15 = v12 - v14;

      v16 = -v15;
      if (v15 >= 0.0)
        v16 = v15;
      v17 = 0.2;
      goto LABEL_21;
    case 2:
      if (v8)
        goto LABEL_6;
      -[PKPaletteTransition expandedToCollapsedAnimatableProperty](self, "expandedToCollapsedAnimatableProperty");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "value");
      v20 = v19;
      -[PKPaletteTransition expandedToCollapsedAnimatableProperty](self, "expandedToCollapsedAnimatableProperty");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "presentationValue");
      v23 = v20 - v22;

      v16 = -v23;
      if (v23 >= 0.0)
        v16 = v23;
      v17 = 0.01;
      goto LABEL_21;
    case 5:
      if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
LABEL_6:
        result = 1;
      }
      else
      {
        -[PKPaletteTransition rotationAngleAnimatableProperty](self, "rotationAngleAnimatableProperty");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "value");
        v26 = v25;
        -[PKPaletteTransition rotationAngleAnimatableProperty](self, "rotationAngleAnimatableProperty");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "presentationValue");
        v29 = v26 - v28;

        v16 = -v29;
        if (v29 >= 0.0)
          v16 = v29;
        v17 = 0.392699082;
LABEL_21:
        result = v16 <= v17;
      }
      break;
    default:
      return 0;
  }
  return result;
}

- (void)_moveToNextTransitionStageIfReady
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  __CFString *v34;
  __CFString *v35;
  int v36;
  void *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  __CFString *v47;
  __int16 v48;
  __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (-[PKPaletteTransition _canMoveToNextTransitionStage](self, "_canMoveToNextTransitionStage"))
  {
    -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    v8 = v4 - 1;
    if (v4 <= 1)
    {
      -[PKPaletteTransition intermediateVisualState](self, "intermediateVisualState");
LABEL_6:
      v13 = -[PKPaletteTransition targetVisualState](self, "targetVisualState");
      v14 = v13;
      v11 = 0;
LABEL_7:
      if (v13 == 7)
        v15 = 1;
      else
        v15 = 2 * (v13 == 6);
    }
    else
    {
      -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      v12 = -[PKPaletteTransition intermediateVisualState](self, "intermediateVisualState");
      switch(v11)
      {
        case 0uLL:
          goto LABEL_6;
        case 1uLL:
          v26 = v12;
          if (-[PKPaletteTransition targetVisualState](self, "targetVisualState") == 2)
            v14 = 2;
          else
            v14 = 3;
          if (v26 == 7)
            v15 = 1;
          else
            v15 = 2 * (v26 == 6);
          v11 = 1;
          break;
        case 2uLL:
          v14 = -[PKPaletteTransition targetVisualState](self, "targetVisualState");
          if (v14 == 7)
            v15 = 1;
          else
            v15 = 2 * (v14 == 6);
          v11 = 2;
          break;
        case 3uLL:
        case 4uLL:
          v13 = -[PKPaletteTransition targetVisualState](self, "targetVisualState");
          v14 = v13;
          goto LABEL_7;
        case 5uLL:
          if (-[PKPaletteTransition targetVisualState](self, "targetVisualState") == 2)
            v14 = 2;
          else
            v14 = 3;
          v27 = -[PKPaletteTransition targetVisualState](self, "targetVisualState");
          if (v27 == 7)
            v15 = 1;
          else
            v15 = 2 * (v27 == 6);
          v11 = 5;
          break;
        default:
          v15 = 0;
          v14 = 0;
          break;
      }
    }
    v16 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      PKPaletteVisualStateDescription(-[PKPaletteTransition targetVisualState](self, "targetVisualState"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 > 5)
        v29 = 0;
      else
        v29 = off_1E777B098[v7];
      if (v11 > 5)
        v30 = 0;
      else
        v30 = off_1E777B098[v11];
      PKPaletteVisualStateDescription(-[PKPaletteTransition intermediateVisualState](self, "intermediateVisualState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      PKPaletteVisualStateDescription(v14);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[PKPaletteTransition pointingDirection](self, "pointingDirection");
      if (v33 > 2)
        v34 = 0;
      else
        v34 = off_1E777B0C8[v33];
      v35 = off_1E777B0C8[v15];
      v36 = 138413826;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = v30;
      v42 = 2112;
      v43 = v31;
      v44 = 2112;
      v45 = v32;
      v46 = 2112;
      v47 = v34;
      v48 = 2112;
      v49 = v35;
      _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "Transition towards state %@. Move to next stage %@ -> %@. Intermediate state: %@ -> %@. PointingDirection: %@ -> %@.", (uint8_t *)&v36, 0x48u);

    }
    v17 = -[PKPaletteTransition intermediateVisualState](self, "intermediateVisualState") != v14
       || -[PKPaletteTransition pointingDirection](self, "pointingDirection") != v15;
    -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subarrayWithRange:", 1, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteTransition set_remainingTransitionStages:](self, "set_remainingTransitionStages:", v19);

    -[PKPaletteTransition _setIntermediateVisualState:](self, "_setIntermediateVisualState:", v14);
    -[PKPaletteTransition _setPointingDirection:](self, "_setPointingDirection:", v15);
    -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      if (v17)
        return;
      goto LABEL_20;
    }
    v22 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      PKPaletteVisualStateDescription(-[PKPaletteTransition targetVisualState](self, "targetVisualState"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412290;
      v37 = v23;
      _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEFAULT, "Transition finished to state %@.", (uint8_t *)&v36, 0xCu);

    }
    if (!v17)
    {
LABEL_20:
      -[PKPaletteTransition _remainingTransitionStages](self, "_remainingTransitionStages");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25)
        -[PKPaletteTransition _moveToNextTransitionStageIfReady](self, "_moveToNextTransitionStageIfReady");
    }
  }
}

- (void)paletteDidBeginRotationAnimation
{
  int64_t v3;
  double v4;
  double v5;
  id v6;

  v3 = -[PKPaletteTransition pointingDirection](self, "pointingDirection");
  v4 = 1.57079633;
  if (v3 != 2)
    v4 = 0.0;
  if (v3 == 1)
    v5 = -1.57079633;
  else
    v5 = v4;
  -[PKPaletteTransition rotationAngleAnimatableProperty](self, "rotationAngleAnimatableProperty", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v5);

}

- (void)paletteDidBeginResizingAnimation
{
  int64_t v3;
  unint64_t v4;
  double v5;
  id v6;

  v3 = -[PKPaletteTransition _currentStage](self, "_currentStage");
  if ((unint64_t)(v3 - 3) < 2)
  {
    -[PKPaletteTransition _moveToNextTransitionStageIfReady](self, "_moveToNextTransitionStageIfReady");
  }
  else if ((unint64_t)(v3 - 1) <= 1)
  {
    v4 = -[PKPaletteTransition intermediateVisualState](self, "intermediateVisualState") - 1;
    v5 = 1.0;
    if (v4 <= 6)
      v5 = dbl_1BE4FD940[v4];
    -[PKPaletteTransition expandedToCollapsedAnimatableProperty](self, "expandedToCollapsedAnimatableProperty");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:", v5);

  }
}

- (void)_handleRotationAnimatablePropertyPresentationValueChanged
{
  if (-[PKPaletteTransition _currentStage](self, "_currentStage") == 5)
    -[PKPaletteTransition _moveToNextTransitionStageIfReady](self, "_moveToNextTransitionStageIfReady");
}

- (void)_handleExpandedToCollapsedAnimatablePropertyPresentationValueChanged
{
  id v3;

  if ((unint64_t)(-[PKPaletteTransition _currentStage](self, "_currentStage") - 1) <= 1)
    -[PKPaletteTransition _moveToNextTransitionStageIfReady](self, "_moveToNextTransitionStageIfReady");
  -[PKPaletteTransition delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionExpandedToCollapsedRatioDidChange:", self);

}

- (PKPaletteTransitionDelegate)delegate
{
  return (PKPaletteTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)initialVisualState
{
  return self->_initialVisualState;
}

- (int64_t)targetVisualState
{
  return self->_targetVisualState;
}

- (void)_setTargetVisualState:(int64_t)a3
{
  self->_targetVisualState = a3;
}

- (int64_t)intermediateVisualState
{
  return self->_intermediateVisualState;
}

- (int64_t)pointingDirection
{
  return self->_pointingDirection;
}

- (NSArray)_remainingTransitionStages
{
  return self->__remainingTransitionStages;
}

- (void)set_remainingTransitionStages:(id)a3
{
  objc_storeStrong((id *)&self->__remainingTransitionStages, a3);
}

- (UIViewFloatAnimatableProperty)rotationAngleAnimatableProperty
{
  return self->_rotationAngleAnimatableProperty;
}

- (void)setRotationAngleAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_rotationAngleAnimatableProperty, a3);
}

- (UIViewFloatAnimatableProperty)expandedToCollapsedAnimatableProperty
{
  return self->_expandedToCollapsedAnimatableProperty;
}

- (void)setExpandedToCollapsedAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_expandedToCollapsedAnimatableProperty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedToCollapsedAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_rotationAngleAnimatableProperty, 0);
  objc_storeStrong((id *)&self->__remainingTransitionStages, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
