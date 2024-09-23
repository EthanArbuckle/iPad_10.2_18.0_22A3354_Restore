@implementation ARUIRingGroup

- (ARUISpriteSheet)spriteSheet
{
  return self->_spriteSheet;
}

- (void)setPercentage:(float)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  double v13;
  int v14;
  int v15;
  int v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[6];
  float v21;

  v10 = (void (**)(_QWORD))a6;
  -[ARUIRingGroup rings](self, "rings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = ARUIRingPercentageValueNoRing;
  if (*(float *)&ARUIRingPercentageValueNoRing != a3)
  {
    objc_msgSend(v12, "diameter", v13);
    v15 = v14;
    objc_msgSend(v12, "thickness");
    LODWORD(v17) = v16;
    *(float *)&v18 = a3;
    LODWORD(v19) = v15;
    -[ARUIRingGroup _ringPercentageAdjustedForProximityToFull:withRingDiameter:thickness:](self, "_ringPercentageAdjustedForProximityToFull:withRingDiameter:thickness:", v18, v19, v17);
    a3 = *(float *)&v13;
  }
  if (a5)
  {
    objc_msgSend(v12, "percentage");
    -[ARUIRingGroup _adjustedDurationForRingWithIndex:startPercentage:targetPercentage:defaultDuration:](self, "_adjustedDurationForRingWithIndex:startPercentage:targetPercentage:defaultDuration:", a4);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __75__ARUIRingGroup_Activity__setPercentage_ofRingAtIndex_animated_completion___block_invoke;
    v20[3] = &unk_24CEC6370;
    v21 = a3;
    v20[4] = self;
    v20[5] = a4;
    +[ARUIRingGroup animateWithDuration:animations:completion:](ARUIRingGroup, "animateWithDuration:animations:completion:", v20, v10);
  }
  else
  {
    *(float *)&v13 = a3;
    -[ARUIRingGroup setPercentage:ofRingAtIndex:](self, "setPercentage:ofRingAtIndex:", a4, v13);
    if (v10)
      v10[2](v10);
  }

}

- (NSArray)rings
{
  return self->_rings;
}

+ (void)animateWithDuration:(double)a3 animations:(id)a4 curve:(unint64_t)a5 completion:(id)a6
{
  id v9;
  void (**v10)(_QWORD);
  ARUIRingGroupAnimationState *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = a6;
  v10 = (void (**)(_QWORD))a4;
  v11 = objc_alloc_init(ARUIRingGroupAnimationState);
  -[ARUIRingGroupAnimationState setDuration:](v11, "setDuration:", a3);
  +[ARUIRingGroup _timingFunctionForCurve:](ARUIRingGroup, "_timingFunctionForCurve:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRingGroupAnimationState setTimingFunction:](v11, "setTimingFunction:", v12);

  -[ARUIRingGroupAnimationState setCompletion:](v11, "setCompletion:", v9);
  arui_rings_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[ARUIRingGroup animateWithDuration:animations:curve:completion:].cold.3((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

  +[ARUIRingGroupAnimationState pushAnimationState:](ARUIRingGroupAnimationState, "pushAnimationState:", v11);
  arui_rings_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[ARUIRingGroup animateWithDuration:animations:curve:completion:].cold.2(v20);

  v10[2](v10);
  arui_rings_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    +[ARUIRingGroup animateWithDuration:animations:curve:completion:].cold.1((uint64_t)v11, v21, v22, v23, v24, v25, v26, v27);

  +[ARUIRingGroupAnimationState popAnimationState](ARUIRingGroupAnimationState, "popAnimationState");
}

+ (id)_timingFunctionForCurve:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v11;
  _QWORD *v12;

  switch(a3)
  {
    case 0uLL:
      v9 = (void *)MEMORY[0x24BDE56F0];
      LODWORD(v5) = 1051361018;
      LODWORD(v6) = 0;
      LODWORD(v7) = 0;
      goto LABEL_7;
    case 1uLL:
      v11 = (void *)MEMORY[0x24BDE56F0];
      v12 = (_QWORD *)MEMORY[0x24BDE5D20];
      goto LABEL_9;
    case 2uLL:
      v11 = (void *)MEMORY[0x24BDE56F0];
      v12 = (_QWORD *)MEMORY[0x24BDE5D18];
      goto LABEL_9;
    case 3uLL:
      v9 = (void *)MEMORY[0x24BDE56F0];
      LODWORD(v6) = 1056293519;
      LODWORD(v7) = 1057300152;
      LODWORD(v5) = 0;
LABEL_7:
      LODWORD(v8) = 1.0;
      objc_msgSend(v9, "functionWithControlPoints::::", v5, v6, v7, v8, v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      return a1;
    case 4uLL:
      v11 = (void *)MEMORY[0x24BDE56F0];
      v12 = (_QWORD *)MEMORY[0x24BDE5D30];
LABEL_9:
      objc_msgSend(v11, "functionWithName:", *v12, v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

- (void)setPercentage:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  -[ARUIRingGroup setPercentage:ofRingAtIndex:fromAnimation:](self, "setPercentage:ofRingAtIndex:fromAnimation:", a4, 0);
}

- (void)setPercentage:(float)a3 ofRingAtIndex:(unint64_t)a4 fromAnimation:(BOOL)a5
{
  void *v9;
  float v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  int v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22[2];
  id location;

  -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "percentage");
  if (!ARUIFloatEqual(v10, a3))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARUIAnimationKeyCoordinator animationKeyForType:ringIndex:](ARUIAnimationKeyCoordinator, "animationKeyForType:ringIndex:", 0, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && !ARUIFloatEqual(a3, *(float *)&ARUIRingPercentageValueNoRing))
    {
      objc_msgSend(v9, "percentage");
      if (*(float *)&v15 < 0.0)
      {
        LODWORD(v15) = 0;
        objc_msgSend(v9, "setPercentage:", v15);
        -[ARUIRingGroup delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ringGroupHasUpdated:", self);

      }
      objc_initWeak(&location, self);
      objc_msgSend(v9, "percentage");
      v18 = v17;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __59__ARUIRingGroup_setPercentage_ofRingAtIndex_fromAnimation___block_invoke;
      v21[3] = &unk_24CEC5E80;
      objc_copyWeak(v22, &location);
      v22[1] = (id)a4;
      LODWORD(v19) = v18;
      *(float *)&v20 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v11, v12, v21, v19, v20);
      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }
    else
    {
      if (!a5)
        -[ARUIRingGroup _removeAnimationForKey:](self, "_removeAnimationForKey:", v12);
      *(float *)&v13 = a3;
      objc_msgSend(v9, "setPercentage:", v13);
      -[ARUIRingGroup delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ringGroupHasUpdated:", self);

    }
  }

}

uint64_t __75__ARUIRingGroup_Activity__setPercentage_ofRingAtIndex_animated_completion___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "setPercentage:ofRingAtIndex:", *(_QWORD *)(a1 + 40), a2);
}

- (float)_ringPercentageAdjustedForProximityToFull:(float)result withRingDiameter:(float)a4 thickness:(float)a5
{
  float v6;

  if (result > 0.00000011921 && result < 1.0 && a4 > 0.00000011921)
  {
    v6 = (result * 6.28318531 * (a4 * 0.5) - a5 * 0.5) / (a4 * 0.5) * 0.5 / 3.14159265;
    return fmaxf(v6, 0.0);
  }
  return result;
}

- (double)_adjustedDurationForRingWithIndex:(int64_t)a3 startPercentage:(float)a4 targetPercentage:(float)a5 defaultDuration:(double)a6
{
  void *v10;
  double v11;
  BOOL v12;
  double result;

  -[ARUIRingGroup rings](self, "rings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a6 + (double)(unint64_t)(objc_msgSend(v10, "count") + ~a3) * 0.0833333333;

  v12 = a5 <= a4 || a5 <= 1.0;
  result = ((a5 + -1.0) * 0.600000024 + 1.0) * a6;
  if (v12)
    return v11;
  return result;
}

+ (void)animateWithDuration:(double)a3 animations:(id)a4 completion:(id)a5
{
  +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", a4, 0, a5, a3);
}

void __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setEmptyOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18[2];
  id location;

  +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v7)
  {
    +[ARUIAnimationKeyCoordinator animationKeyForType:ringIndex:](ARUIAnimationKeyCoordinator, "animationKeyForType:ringIndex:", 3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v10, "emptyOpacity");
    v13 = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __47__ARUIRingGroup_setEmptyOpacity_ofRingAtIndex___block_invoke;
    v17[3] = &unk_24CEC5E80;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&v15 = a3;
    -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v7, v11, v17, v14, v15);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);

  }
  else
  {
    *(float *)&v9 = a3;
    objc_msgSend(v8, "setEmptyOpacity:", v9);
    -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
    -[ARUIRingGroup delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ringGroupHasUpdated:", self);

  }
}

- (void)_positionSprites
{
  void *v3;
  _QWORD v4[5];

  -[ARUISpriteSheet sprites](self->_spriteSheet, "sprites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__ARUIRingGroup__positionSprites__block_invoke;
  v4[3] = &unk_24CEC5F48;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (void)setFrame:(unint64_t)a3 ofSpriteAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  -[ARUISpriteSheet sprites](self->_spriteSheet, "sprites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "currentFrameIndex") != a3)
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_initWeak(&location, self);
      v10 = objc_msgSend(v8, "currentFrameIndex");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("spriteFrame-%lu"), a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __42__ARUIRingGroup_setFrame_ofSpriteAtIndex___block_invoke;
      v13[3] = &unk_24CEC5F70;
      objc_copyWeak(v14, &location);
      v14[1] = (id)a4;
      -[ARUIRingGroup _setupUIntAnimationForState:startValue:endValue:key:applier:](self, "_setupUIntAnimationForState:startValue:endValue:key:applier:", v9, v10, a3, v11, v13);

      objc_destroyWeak(v14);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v8, "setCurrentFrameIndex:", a3);
      -[ARUIRingGroup delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ringGroupHasUpdated:", self);

    }
  }

}

- (ARUIRingGroupDelegate)delegate
{
  return (ARUIRingGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateRingGroupLayout
{
  float groupDiameter;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  float v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  groupDiameter = self->_groupDiameter;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSArray reverseObjectEnumerator](self->_rings, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        *(float *)&v6 = groupDiameter;
        objc_msgSend(v10, "setDiameter:", v6);
        objc_msgSend(v10, "thickness");
        v6 = groupDiameter + v11 * -2.0 + self->_interspacing * -2.0;
        groupDiameter = v6;
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[ARUIRingGroup _positionSprites](self, "_positionSprites");
}

void __33__ARUIRingGroup__positionSprites__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  float v19;
  unsigned int v20;
  unsigned int v21;
  id v22;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scale");
  v7 = v6;
  objc_msgSend(v22, "thickness");
  v9 = (float)(v7 * v8) * 0.85;
  *(float *)&v9 = v9;
  objc_msgSend(v5, "setSize:", v9);
  objc_msgSend(v22, "translation");
  *(float *)&v21 = v10 + v10;
  objc_msgSend(v22, "scale");
  v12 = v11;
  objc_msgSend(v22, "diameter");
  v14 = v13;
  objc_msgSend(v22, "scale");
  v16 = v15;
  objc_msgSend(v22, "thickness");
  v18 = (float)((float)(v12 * v14) - (float)(v16 * v17));
  objc_msgSend(v22, "translation");
  *(float *)&v20 = v18 + v19 * -2.0;
  objc_msgSend(v5, "setTranslation:", COERCE_DOUBLE(__PAIR64__(v20, v21)));
  objc_msgSend(v22, "opacity");
  objc_msgSend(v5, "setOpacity:");

}

- (void)_removeAnimationForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_animations, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", v5);
    objc_msgSend(v4, "completeAnimation");
  }

}

- (void)_setupFloatAnimationForState:(id)a3 startValue:(float)a4 endValue:(float)a5 key:(id)a6 applier:(id)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  v12 = a7;
  v13 = a6;
  -[ARUIRingGroup _removeAnimationForKey:](self, "_removeAnimationForKey:", v13);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v26;
    objc_msgSend(v14, "tension");
    v16 = v15;
    objc_msgSend(v14, "friction");
    *(float *)&v17 = a4;
    *(float *)&v18 = a5;
    +[ARUIFloatSpringAnimation animationWithTension:friction:startValue:endValue:applier:](ARUIFloatSpringAnimation, "animationWithTension:friction:startValue:endValue:applier:", v12, v16, v19, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addAnimation:", v20);
  }
  else
  {
    objc_msgSend(v26, "duration");
    v22 = v21;
    objc_msgSend(v26, "timingFunction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v24 = a4;
    *(float *)&v25 = a5;
    +[ARUIFloatAnimation animationWithDuration:startValue:endValue:timingFunction:applier:](ARUIFloatAnimation, "animationWithDuration:startValue:endValue:timingFunction:applier:", v23, v12, v22, v24, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "addAnimation:", v20);
  }
  -[NSMutableDictionary setObject:forKey:](self->_animations, "setObject:forKey:", v20, v13);

  -[ARUIRingGroup _updateAnimationObserving](self, "_updateAnimationObserving");
}

- (void)_setupUIntAnimationForState:(id)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 key:(id)a6 applier:(id)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[ARUIRingGroup _removeAnimationForKey:](self, "_removeAnimationForKey:", v13);
  objc_msgSend(v14, "duration");
  v16 = v15;
  objc_msgSend(v14, "timingFunction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIUIntAnimation animationWithDuration:startValue:endValue:timingFunction:applier:](ARUIUIntAnimation, "animationWithDuration:startValue:endValue:timingFunction:applier:", a4, a5, v17, v12, v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAnimation:", v18);
  -[NSMutableDictionary setObject:forKey:](self->_animations, "setObject:forKey:", v18, v13);

  -[ARUIRingGroup _updateAnimationObserving](self, "_updateAnimationObserving");
}

void __52__ARUIRingGroup_animationSequencer_updatedWithTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(v5, "update:", *(double *)(a1 + 40));
  if ((objc_msgSend(v5, "isAnimating") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

void __42__ARUIRingGroup_setFrame_ofSpriteAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFrame:ofSpriteAtIndex:", a2, *(_QWORD *)(a1 + 40));

}

void __59__ARUIRingGroup_setPercentage_ofRingAtIndex_fromAnimation___block_invoke(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "setPercentage:ofRingAtIndex:fromAnimation:", *(_QWORD *)(a1 + 40), 1, v4);

}

uint64_t __30__ARUIRingGroup_setThickness___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setThickness:", a3);
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 animated:(BOOL)a4
{
  -[ARUIRingGroup setIsStandalonePhoneFitnessMode:animated:completion:](self, "setIsStandalonePhoneFitnessMode:animated:completion:", a3, a4, 0);
}

uint64_t __52__ARUIRingGroup_animationSequencer_updatedWithTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeAnimation");
}

BOOL __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  float v4;
  _BOOL8 result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(a2, "percentage");
    result = ARUIFloatLess(v4, 0.0);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

uint64_t __39__ARUIRingGroup_Activity__forCompanion__block_invoke(double a1, uint64_t a2, void *a3)
{
  LODWORD(a1) = 0;
  return objc_msgSend(a3, "setPercentage:", a1);
}

uint64_t __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[ARUIRingGroup removeAllAnimations](self, "removeAllAnimations");
  v3.receiver = self;
  v3.super_class = (Class)ARUIRingGroup;
  -[ARUIRingGroup dealloc](&v3, sel_dealloc);
}

- (void)removeAllAnimations
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_animations, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_0);
  -[NSMutableDictionary removeAllObjects](self->_animations, "removeAllObjects");
}

- (ARUIRingGroup)forCompanion
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  v2 = (void *)-[ARUIRingGroup copy](self, "copy");
  LODWORD(v3) = 1132134400;
  objc_msgSend(v2, "setGroupDiameter:", v3);
  LODWORD(v4) = 2.0;
  objc_msgSend(v2, "setInterspacing:", v4);
  LODWORD(v5) = 27.0;
  objc_msgSend(v2, "setThickness:", v5);
  objc_msgSend(v2, "rings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_4);

  return (ARUIRingGroup *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  ARUIRingGroup *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v5 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[ARUIRingGroup rings](self, "rings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);

  v8 = -[ARUIRingGroup initWithRings:animationSequencer:]([ARUIRingGroup alloc], "initWithRings:animationSequencer:", v7, self->_animationSequencer);
  -[ARUIRingGroup spriteSheet](self, "spriteSheet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[ARUIRingGroup setSpriteSheet:](v8, "setSpriteSheet:", v10);

  -[ARUIRingGroup groupDiameter](self, "groupDiameter");
  -[ARUIRingGroup setGroupDiameter:](v8, "setGroupDiameter:");
  -[ARUIRingGroup interspacing](self, "interspacing");
  -[ARUIRingGroup setInterspacing:](v8, "setInterspacing:");
  -[ARUIRingGroup setPaused:](v8, "setPaused:", -[ARUIRingGroup paused](self, "paused"));
  -[ARUIRingGroup thickness](self, "thickness");
  -[ARUIRingGroup setThickness:](v8, "setThickness:");
  -[ARUIRingGroup opacity](self, "opacity");
  -[ARUIRingGroup setOpacity:](v8, "setOpacity:");
  -[ARUIRingGroup emptyOpacity](self, "emptyOpacity");
  -[ARUIRingGroup setEmptyOpacity:](v8, "setEmptyOpacity:");
  -[ARUIRingGroup trackOpacity](self, "trackOpacity");
  -[ARUIRingGroup setTrackOpacity:](v8, "setTrackOpacity:");
  -[ARUIRingGroup scale](self, "scale");
  -[ARUIRingGroup setScale:](v8, "setScale:");
  -[ARUIRingGroup zRotation](self, "zRotation");
  -[ARUIRingGroup setZRotation:](v8, "setZRotation:");
  -[ARUIRingGroup translation](self, "translation");
  -[ARUIRingGroup setTranslation:](v8, "setTranslation:");
  -[ARUIRingGroup setRingType:](v8, "setRingType:", -[ARUIRingGroup ringType](self, "ringType"));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__ARUIRingGroup_copyWithZone___block_invoke;
  v12[3] = &unk_24CEC5DC8;
  v12[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  return v8;
}

- (void)setThickness:(float)a3
{
  void *v5;
  float thickness;
  double v7;
  double v8;
  NSArray *rings;
  void *v10;
  _QWORD v11[4];
  float v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (!ARUIFloatEqual(a3, self->_thickness))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      thickness = self->_thickness;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __30__ARUIRingGroup_setThickness___block_invoke;
      v13[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v14, &location);
      *(float *)&v7 = thickness;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("thickness"), v13, v7, v8);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_thickness = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __30__ARUIRingGroup_setThickness___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      v12 = a3;
      -[NSArray enumerateObjectsUsingBlock:](rings, "enumerateObjectsUsingBlock:", v11);
      -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
      -[ARUIRingGroup delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setInterspacing:(float)a3
{
  void *v5;
  float interspacing;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (!ARUIFloatEqual(a3, self->_interspacing))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      interspacing = self->_interspacing;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __33__ARUIRingGroup_setInterspacing___block_invoke;
      v10[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v11, &location);
      *(float *)&v7 = interspacing;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("interspacing"), v10, v7, v8);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_interspacing = a3;
      -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
      -[ARUIRingGroup delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setGroupDiameter:(float)a3
{
  void *v5;
  float groupDiameter;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (!ARUIFloatEqual(a3, self->_groupDiameter))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      groupDiameter = self->_groupDiameter;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __34__ARUIRingGroup_setGroupDiameter___block_invoke;
      v10[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v11, &location);
      *(float *)&v7 = groupDiameter;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("groupDiameter"), v10, v7, v8);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_groupDiameter = a3;
      -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
      -[ARUIRingGroup delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setSpriteSheet:(id)a3
{
  ARUISpriteSheet *v5;
  id WeakRetained;
  ARUISpriteSheet *v7;

  v5 = (ARUISpriteSheet *)a3;
  if (self->_spriteSheet != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_spriteSheet, a3);
    -[ARUIRingGroup _positionSprites](self, "_positionSprites");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "ringGroupHasUpdated:", self);

    v5 = v7;
  }

}

- (void)setRingType:(int64_t)a3
{
  self->_ringType = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  -[ARUIRingGroup _updateAnimationObserving](self, "_updateAnimationObserving");
}

- (float)zRotation
{
  return self->_zRotation;
}

- (double)translation
{
  return *(double *)(a1 + 96);
}

- (float)trackOpacity
{
  return self->_trackOpacity;
}

- (float)thickness
{
  return self->_thickness;
}

- (void)setZRotation:(float)a3
{
  void *v5;
  float zRotation;
  double v7;
  double v8;
  NSArray *rings;
  void *v10;
  _QWORD v11[4];
  float v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (!ARUIFloatEqual(a3, self->_zRotation))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      zRotation = self->_zRotation;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __30__ARUIRingGroup_setZRotation___block_invoke;
      v13[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v14, &location);
      *(float *)&v7 = zRotation;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("zRotation"), v13, v7, v8);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_zRotation = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __30__ARUIRingGroup_setZRotation___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      v12 = a3;
      -[NSArray enumerateObjectsUsingBlock:](rings, "enumerateObjectsUsingBlock:", v11);
      -[ARUIRingGroup delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setTranslation:(ARUIRingGroup *)self
{
  float32x2_t v2;
  double v3;
  void *v5;
  double v6;
  NSArray *rings;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id location;

  v3 = *(double *)&v2;
  if (!ARUIFloat2Equal(v2, *(float32x2_t *)self->_translation))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      v6 = *(double *)self->_translation;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __32__ARUIRingGroup_setTranslation___block_invoke;
      v10[3] = &unk_24CEC5E38;
      objc_copyWeak(&v11, &location);
      -[ARUIRingGroup _setupFloat2AnimationForState:startValue:endValue:key:applier:](self, "_setupFloat2AnimationForState:startValue:endValue:key:applier:", v5, CFSTR("translation"), v10, v6, v3);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      *(double *)self->_translation = v3;
      rings = self->_rings;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __32__ARUIRingGroup_setTranslation___block_invoke_2;
      v9[3] = &__block_descriptor_40_e25_v32__0__ARUIRing_8Q16_B24l;
      *(double *)&v9[4] = v3;
      -[NSArray enumerateObjectsUsingBlock:](rings, "enumerateObjectsUsingBlock:", v9);
      -[ARUIRingGroup _positionSprites](self, "_positionSprites");
      -[ARUIRingGroup delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setTrackOpacity:(float)a3
{
  void *v5;
  float trackOpacity;
  double v7;
  double v8;
  NSArray *rings;
  void *v10;
  _QWORD v11[4];
  float v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (!ARUIFloatEqual(a3, self->_trackOpacity))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      trackOpacity = self->_trackOpacity;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __33__ARUIRingGroup_setTrackOpacity___block_invoke;
      v13[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v14, &location);
      *(float *)&v7 = trackOpacity;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("trackOpacity"), v13, v7, v8);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_trackOpacity = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __33__ARUIRingGroup_setTrackOpacity___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      v12 = a3;
      -[NSArray enumerateObjectsUsingBlock:](rings, "enumerateObjectsUsingBlock:", v11);
      -[ARUIRingGroup delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setScale:(float)a3
{
  void *v5;
  float scale;
  double v7;
  double v8;
  NSArray *rings;
  void *v10;
  _QWORD v11[4];
  float v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (!ARUIFloatEqual(a3, self->_scale))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      scale = self->_scale;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __26__ARUIRingGroup_setScale___block_invoke;
      v13[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v14, &location);
      *(float *)&v7 = scale;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("scale"), v13, v7, v8);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_scale = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __26__ARUIRingGroup_setScale___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      v12 = a3;
      -[NSArray enumerateObjectsUsingBlock:](rings, "enumerateObjectsUsingBlock:", v11);
      -[ARUIRingGroup _positionSprites](self, "_positionSprites");
      -[ARUIRingGroup delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setOpacity:(float)a3
{
  void *v5;
  float opacity;
  double v7;
  double v8;
  NSArray *rings;
  void *v10;
  _QWORD v11[4];
  float v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (!ARUIFloatEqual(a3, self->_opacity))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      opacity = self->_opacity;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __28__ARUIRingGroup_setOpacity___block_invoke;
      v13[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v14, &location);
      *(float *)&v7 = opacity;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("opacity"), v13, v7, v8);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_opacity = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __28__ARUIRingGroup_setOpacity___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      v12 = a3;
      -[NSArray enumerateObjectsUsingBlock:](rings, "enumerateObjectsUsingBlock:", v11);
      -[ARUIRingGroup delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setEmptyOpacity:(float)a3
{
  void *v5;
  float emptyOpacity;
  double v7;
  double v8;
  NSArray *rings;
  void *v10;
  _QWORD v11[4];
  float v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (!ARUIFloatEqual(a3, self->_emptyOpacity))
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(&location, self);
      emptyOpacity = self->_emptyOpacity;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __33__ARUIRingGroup_setEmptyOpacity___block_invoke;
      v13[3] = &unk_24CEC5DF0;
      objc_copyWeak(&v14, &location);
      *(float *)&v7 = emptyOpacity;
      *(float *)&v8 = a3;
      -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v5, CFSTR("emptyOpacity"), v13, v7, v8);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_emptyOpacity = a3;
      rings = self->_rings;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __33__ARUIRingGroup_setEmptyOpacity___block_invoke_2;
      v11[3] = &__block_descriptor_36_e25_v32__0__ARUIRing_8Q16_B24l;
      v12 = a3;
      -[NSArray enumerateObjectsUsingBlock:](rings, "enumerateObjectsUsingBlock:", v11);
      -[ARUIRingGroup delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ringGroupHasUpdated:", self);

    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)scale
{
  return self->_scale;
}

- (int64_t)ringType
{
  return self->_ringType;
}

- (float)opacity
{
  return self->_opacity;
}

- (float)interspacing
{
  return self->_interspacing;
}

- (float)emptyOpacity
{
  return self->_emptyOpacity;
}

- (void)animationSequencer:(id)a3 updatedWithTime:(double)a4
{
  void *v6;
  NSMutableDictionary *animations;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  double v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_animations, "count", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  animations = self->_animations;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__ARUIRingGroup_animationSequencer_updatedWithTime___block_invoke;
  v12[3] = &unk_24CEC5FD8;
  v14 = a4;
  v13 = v6;
  v11 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](animations, "enumerateKeysAndObjectsUsingBlock:", v12);
  v8 = self->_animations;
  objc_msgSend(v11, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](v8, "removeObjectsForKeys:", v9);

  objc_msgSend(v11, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_46);

  -[ARUIRingGroup _updateAnimationObserving](self, "_updateAnimationObserving");
}

- (void)_updateAnimationObserving
{
  BOOL v3;

  if (-[ARUIRingGroup _shouldObserveSequencer](self, "_shouldObserveSequencer"))
  {
    if (self->_observingSequencing)
      return;
    -[ARUIAnimationSequencing addObserver:](self->_animationSequencer, "addObserver:", self);
    v3 = 1;
  }
  else
  {
    if (!self->_observingSequencing)
      return;
    -[ARUIAnimationSequencing removeObserver:](self->_animationSequencer, "removeObserver:", self);
    v3 = 0;
  }
  self->_observingSequencing = v3;
}

- (BOOL)_shouldObserveSequencer
{
  uint64_t v3;

  v3 = -[NSMutableDictionary count](self->_animations, "count");
  if (v3)
    LOBYTE(v3) = !self->_paused;
  return v3;
}

- (ARUIRingGroup)initWithRings:(id)a3 animationSequencer:(id)a4
{
  id v7;
  id v8;
  ARUIRingGroup *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *animations;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUIRingGroup;
  v9 = -[ARUIRingGroup init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARUIRingGroup _setDefaultGroupValues:](v9, "_setDefaultGroupValues:", v10);

    objc_storeStrong((id *)&v9->_rings, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    animations = v9->_animations;
    v9->_animations = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v9->_animationSequencer, a4);
    v9->_observingSequencing = 0;
    v9->_paused = 0;
  }

  return v9;
}

- (BOOL)animating
{
  return -[NSMutableDictionary count](self->_animations, "count") != 0;
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  BOOL v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  -[ARUIRingGroup rings](self, "rings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 == 3)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    -[ARUIRingGroup rings](self, "rings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke;
    v18[3] = &unk_24CEC63B8;
    v18[4] = &v19;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);

    if (v5)
      v5 = *((_BYTE *)v20 + 24) == 0;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke_2;
    v16[3] = &unk_24CEC63E0;
    v17 = a3;
    v16[4] = self;
    v13 = MEMORY[0x2199A6364](v16);
    v14 = (void *)v13;
    if (v5)
    {
      +[ARUIRingGroup animateWithDuration:animations:completion:](ARUIRingGroup, "animateWithDuration:animations:completion:", v13, v8, 3.0);
    }
    else
    {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
      if (v8)
        v8[2](v8);
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    arui_rings_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ARUIRingGroup(Activity) setIsStandalonePhoneFitnessMode:animated:completion:].cold.1(self, v15);

  }
}

- (float)groupDiameter
{
  return self->_groupDiameter;
}

void __79__ARUIRingGroup_Activity__setIsStandalonePhoneFitnessMode_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  double v6;
  float v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  float v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  float v47;
  void *v48;
  void *v49;
  int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;

  +[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v2;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v2, "nonGradientTextColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "nonGradientTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "groupDiameter");
    +[ARUIRingGroup preferredActivityRingThicknessForDiameter:isStandaloneRing:](ARUIRingGroup, "preferredActivityRingThicknessForDiameter:isStandaloneRing:", 1, v5);
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  else
  {
    objc_msgSend(v2, "gradientDarkColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "gradientLightColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "thickness");
    v7 = v14;
    objc_msgSend(*(id *)(a1 + 32), "rings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "opacity");
    if (v17 == 0.0)
    {
      v8 = ARUIRingOpacityValueDefault;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "rings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "opacity");
      v8 = v20;

    }
    objc_msgSend(*(id *)(a1 + 32), "rings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "emptyOpacity");
    if (v23 == 0.0)
    {
      v9 = ARUIRingEmptyOpacityValueDefault;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "rings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "emptyOpacity");
      v9 = v26;

    }
    objc_msgSend(*(id *)(a1 + 32), "rings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trackOpacity");
    if (v29 == 0.0)
    {
      v10 = ARUIRingTrackOpacityValueDefault;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "rings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trackOpacity");
      v10 = v32;

    }
    objc_msgSend(*(id *)(a1 + 32), "rings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "opacity");
    if (v35 == 0.0)
    {
      v11 = ARUIRingOpacityValueDefault;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "rings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "opacity");
      v11 = v38;

    }
    objc_msgSend(*(id *)(a1 + 32), "rings");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "emptyOpacity");
    if (v41 == 0.0)
    {
      v12 = ARUIRingEmptyOpacityValueDefault;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "rings");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "emptyOpacity");
      v12 = v44;

    }
    objc_msgSend(*(id *)(a1 + 32), "rings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trackOpacity");
    if (v47 == 0.0)
    {
      v13 = ARUIRingTrackOpacityValueDefault;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "rings");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "trackOpacity");
      v13 = v50;

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setTopColor:bottomColor:ofRingAtIndex:", v3, v4, 2);
  *(float *)&v51 = v7;
  objc_msgSend(*(id *)(a1 + 32), "setThickness:ofRingAtIndex:", 2, v51);
  LODWORD(v52) = v8;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:ofRingAtIndex:", 1, v52);
  LODWORD(v53) = v9;
  objc_msgSend(*(id *)(a1 + 32), "setEmptyOpacity:ofRingAtIndex:", 1, v53);
  LODWORD(v54) = v10;
  objc_msgSend(*(id *)(a1 + 32), "setTrackOpacity:ofRingAtIndex:", 1, v54);
  LODWORD(v55) = v11;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:ofRingAtIndex:", 0, v55);
  LODWORD(v56) = v12;
  objc_msgSend(*(id *)(a1 + 32), "setEmptyOpacity:ofRingAtIndex:", 0, v56);
  LODWORD(v57) = v13;
  objc_msgSend(*(id *)(a1 + 32), "setTrackOpacity:ofRingAtIndex:", 0, v57);

}

- (void)setOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18[2];
  id location;

  +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v7)
  {
    +[ARUIAnimationKeyCoordinator animationKeyForType:ringIndex:](ARUIAnimationKeyCoordinator, "animationKeyForType:ringIndex:", 2, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v10, "opacity");
    v13 = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __42__ARUIRingGroup_setOpacity_ofRingAtIndex___block_invoke;
    v17[3] = &unk_24CEC5E80;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&v15 = a3;
    -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v7, v11, v17, v14, v15);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);

  }
  else
  {
    *(float *)&v9 = a3;
    objc_msgSend(v8, "setOpacity:", v9);
    -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
    -[ARUIRingGroup delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ringGroupHasUpdated:", self);

  }
}

+ (double)preferredActivityRingThicknessForDiameter:(double)a3 isStandaloneRing:(BOOL)a4
{
  double v4;

  v4 = 0.105769231;
  if (a4)
    v4 = 0.2;
  return v4 * a3;
}

void __30__ARUIRingGroup_copyWithZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "rings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "thickness");
  objc_msgSend(v5, "setThickness:");
  objc_msgSend(v7, "opacity");
  objc_msgSend(v5, "setOpacity:");
  objc_msgSend(v7, "emptyOpacity");
  objc_msgSend(v5, "setEmptyOpacity:");
  objc_msgSend(v7, "trackOpacity");
  objc_msgSend(v5, "setTrackOpacity:");

}

- (void)setTrackOpacity:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18[2];
  id location;

  +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v7)
  {
    +[ARUIAnimationKeyCoordinator animationKeyForType:ringIndex:](ARUIAnimationKeyCoordinator, "animationKeyForType:ringIndex:", 4, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v10, "trackOpacity");
    v13 = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __47__ARUIRingGroup_setTrackOpacity_ofRingAtIndex___block_invoke;
    v17[3] = &unk_24CEC5E80;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&v15 = a3;
    -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v7, v11, v17, v14, v15);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);

  }
  else
  {
    *(float *)&v9 = a3;
    objc_msgSend(v8, "setTrackOpacity:", v9);
    -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
    -[ARUIRingGroup delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ringGroupHasUpdated:", self);

  }
}

- (void)setThickness:(float)a3 ofRingAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18[2];
  id location;

  +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v7)
  {
    +[ARUIAnimationKeyCoordinator animationKeyForType:ringIndex:](ARUIAnimationKeyCoordinator, "animationKeyForType:ringIndex:", 1, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v10, "thickness");
    v13 = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__ARUIRingGroup_setThickness_ofRingAtIndex___block_invoke;
    v17[3] = &unk_24CEC5E80;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    LODWORD(v14) = v13;
    *(float *)&v15 = a3;
    -[ARUIRingGroup _setupFloatAnimationForState:startValue:endValue:key:applier:](self, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v7, v11, v17, v14, v15);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);

  }
  else
  {
    *(float *)&v9 = a3;
    objc_msgSend(v8, "setThickness:", v9);
    -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
    -[ARUIRingGroup delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ringGroupHasUpdated:", self);

  }
}

- (void)_setDefaultGroupValues:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "opacity");
  self->_opacity = v5;
  objc_msgSend(v4, "emptyOpacity");
  self->_emptyOpacity = v6;
  objc_msgSend(v4, "trackOpacity");
  self->_trackOpacity = v7;
  objc_msgSend(v4, "scale");
  self->_scale = v8;
  objc_msgSend(v4, "zRotation");
  self->_zRotation = v9;
  objc_msgSend(v4, "translation");
  v11 = v10;

  *(_QWORD *)self->_translation = v11;
}

+ (id)activityRingGroupForRingType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNumberOfRings:", +[ARUIRingGroup _numberOfRingsForRingType:](ARUIRingGroup, "_numberOfRingsForRingType:"));
  objc_msgSend(v4, "setRingType:", a3);
  objc_msgSend(v4, "_setStandardColorsWithAnimated:", 0);
  return v4;
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5
{
  -[ARUIRingGroup setTopColor:bottomColor:ofRingAtIndex:animated:](self, "setTopColor:bottomColor:ofRingAtIndex:animated:", a3, a4, a5, 0);
}

- (ARUIRingGroup)initWithNumberOfRings:(int64_t)a3
{
  void *v5;
  ARUIRingGroup *v6;

  +[ARUIRingGroupGlobalAnimationSequencer sharedInstance](ARUIRingGroupGlobalAnimationSequencer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ARUIRingGroup initWithNumberOfRings:animationSequencer:](self, "initWithNumberOfRings:animationSequencer:", a3, v5);

  return v6;
}

- (ARUIRingGroup)initWithNumberOfRings:(int64_t)a3 animationSequencer:(id)a4
{
  id v6;
  void *i;
  ARUIRing *v8;
  ARUIRingGroup *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    v8 = objc_alloc_init(ARUIRing);
    objc_msgSend(i, "addObject:", v8);

  }
  v9 = -[ARUIRingGroup initWithRings:animationSequencer:](self, "initWithRings:animationSequencer:", i, v6);

  return v9;
}

+ (unint64_t)_numberOfRingsForRingType:(int64_t)a3
{
  if (a3 == 3)
    return 3;
  else
    return 1;
}

- (void)setActiveEnergyPercentage:(float)a3 exerciseMinutesPercentage:(float)a4 standHoursPercentage:(float)a5 animated:(BOOL)a6 completion:(id)a7
{
  NSObject **v7;
  id *v8;
  _BOOL8 v9;
  void (**v14)(_QWORD);
  dispatch_group_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  _QWORD block[4];
  void (**v26)(_QWORD);
  _QWORD v27[4];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;

  v9 = a6;
  v14 = (void (**)(_QWORD))a7;
  v15 = dispatch_group_create();
  v16 = v15;
  if (v9)
  {
    v17 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke;
    v29[3] = &unk_24CEC5CE0;
    v7 = &v30;
    v18 = v15;
    v30 = v18;
    v19 = MEMORY[0x2199A6364](v29);
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_3;
    v27[3] = &unk_24CEC5CE0;
    v20 = v27;
    v8 = (id *)&v28;
    v28 = v18;
  }
  else
  {
    v20 = 0;
    v19 = &__block_literal_global_8;
  }
  v21 = (void *)MEMORY[0x2199A6364](v20);
  ((void (*))v19[2].isa)(v19);
  *(float *)&v22 = a3;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self, "setPercentage:ofRingAtIndex:animated:completion:", 2, v9, v21, v22);
  ((void (*))v19[2].isa)(v19);
  *(float *)&v23 = a4;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self, "setPercentage:ofRingAtIndex:animated:completion:", 1, v9, v21, v23);
  ((void (*))v19[2].isa)(v19);
  *(float *)&v24 = a5;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self, "setPercentage:ofRingAtIndex:animated:completion:", 0, v9, v21, v24);
  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke_4;
    block[3] = &unk_24CEC5D08;
    v26 = v14;
    dispatch_group_notify(v16, MEMORY[0x24BDAC9B8], block);

    v19 = *v7;
  }
  else
  {
    if (v14)
      v14[2](v14);

  }
}

void __120__ARUIRingGroup_Activity__setActiveEnergyPercentage_exerciseMinutesPercentage_standHoursPercentage_animated_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
}

- (void)playSpriteAnimation
{
  -[ARUIRingGroup playSpriteAnimationWithCompletion:](self, "playSpriteAnimationWithCompletion:", 0);
}

- (void)playSpriteAnimationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  dispatch_group_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  unint64_t v23;
  _QWORD v24[4];
  NSObject *v25;

  v4 = a3;
  v5 = v4;
  if (self->_spriteSheet)
  {
    v18 = v4;
    v6 = dispatch_group_create();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke;
    v24[3] = &unk_24CEC5CE0;
    v7 = v6;
    v25 = v7;
    v8 = (void *)MEMORY[0x2199A6364](v24);
    -[ARUISpriteSheet sprites](self->_spriteSheet, "sprites");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 0;
      do
      {
        -[ARUISpriteSheet sprites](self->_spriteSheet, "sprites");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setCurrentFrameIndex:", 0);
        v14 = (float)(unint64_t)objc_msgSend(v13, "frameCount") / 60.0;
        dispatch_group_enter(v7);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_2;
        v21[3] = &unk_24CEC5ED0;
        v21[4] = self;
        v22 = v13;
        v23 = v11;
        v15 = v13;
        +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", v21, 4, v8, v14);

        ++v11;
        -[ARUISpriteSheet sprites](self->_spriteSheet, "sprites");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v11 < v17);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_3;
    block[3] = &unk_24CEC5D08;
    v5 = v18;
    v20 = v18;
    dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

  }
  else if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

uint64_t __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:ofSpriteAtIndex:", objc_msgSend(*(id *)(a1 + 40), "frameCount") - 1, *(_QWORD *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spriteSheet, 0);
  objc_storeStrong((id *)&self->_rings, 0);
  objc_storeStrong((id *)&self->_animationSequencer, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

void __34__ARUIRingGroup_setGroupDiameter___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setGroupDiameter:", v3);

}

void __33__ARUIRingGroup_setInterspacing___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setInterspacing:", v3);

}

void __30__ARUIRingGroup_setThickness___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setThickness:", v3);

}

void __28__ARUIRingGroup_setOpacity___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setOpacity:", v3);

}

uint64_t __28__ARUIRingGroup_setOpacity___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setOpacity:", a3);
}

void __33__ARUIRingGroup_setEmptyOpacity___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setEmptyOpacity:", v3);

}

uint64_t __33__ARUIRingGroup_setEmptyOpacity___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setEmptyOpacity:", a3);
}

void __33__ARUIRingGroup_setTrackOpacity___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setTrackOpacity:", v3);

}

uint64_t __33__ARUIRingGroup_setTrackOpacity___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setTrackOpacity:", a3);
}

void __26__ARUIRingGroup_setScale___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setScale:", v3);

}

uint64_t __26__ARUIRingGroup_setScale___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setScale:", a3);
}

void __30__ARUIRingGroup_setZRotation___block_invoke(uint64_t a1, float a2)
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v3 = a2;
  objc_msgSend(WeakRetained, "setZRotation:", v3);

}

uint64_t __30__ARUIRingGroup_setZRotation___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setZRotation:", a3);
}

void __32__ARUIRingGroup_setTranslation___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setTranslation:", a2);

}

uint64_t __32__ARUIRingGroup_setTranslation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTranslation:", *(double *)(a1 + 32));
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5 animated:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24[2];
  id location;

  v10 = a3;
  v11 = a4;
  if (a6)
  {
    +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      +[ARUIAnimationKeyCoordinator animationKeyForType:ringIndex:](ARUIAnimationKeyCoordinator, "animationKeyForType:ringIndex:", 6, a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      objc_msgSend(v14, "topColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottomColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __64__ARUIRingGroup_setTopColor_bottomColor_ofRingAtIndex_animated___block_invoke;
      v23[3] = &unk_24CEC5EA8;
      objc_copyWeak(v24, &location);
      v24[1] = (id)a5;
      -[ARUIRingGroup _setupColorAnimationForState:startTopColor:endTopColor:startBottomColor:endBottomColor:key:applier:](self, "_setupColorAnimationForState:startTopColor:endTopColor:startBottomColor:endBottomColor:key:applier:", v12, v15, v10, v16, v11, v22, v23);

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);

    }
    else
    {
      objc_msgSend(v13, "setTopColor:", v10);
      objc_msgSend(v14, "setBottomColor:", v11);
      -[ARUIRingGroup _updateRingGroupLayout](self, "_updateRingGroupLayout");
      -[ARUIRingGroup delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ringGroupHasUpdated:", self);

    }
  }
  else
  {
    -[ARUIRingGroup rings](self, "rings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTopColor:", v10);

    -[ARUIRingGroup rings](self, "rings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBottomColor:", v11);

  }
}

void __64__ARUIRingGroup_setTopColor_bottomColor_ofRingAtIndex_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "setTopColor:bottomColor:ofRingAtIndex:", v7, v6, *(_QWORD *)(a1 + 40));

}

void __44__ARUIRingGroup_setThickness_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "setThickness:ofRingAtIndex:", *(_QWORD *)(a1 + 40), v4);

}

void __42__ARUIRingGroup_setOpacity_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "setOpacity:ofRingAtIndex:", *(_QWORD *)(a1 + 40), v4);

}

void __47__ARUIRingGroup_setEmptyOpacity_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "setEmptyOpacity:ofRingAtIndex:", *(_QWORD *)(a1 + 40), v4);

}

void __47__ARUIRingGroup_setTrackOpacity_ofRingAtIndex___block_invoke(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "setTrackOpacity:ofRingAtIndex:", *(_QWORD *)(a1 + 40), v4);

}

void __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __51__ARUIRingGroup_playSpriteAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)playCelebration:(id)a3 onRingAtIndex:(unint64_t)a4
{
  -[ARUIRingGroup playCelebration:onRingAtIndex:completion:](self, "playCelebration:onRingAtIndex:completion:", a3, a4, 0);
}

- (void)playCelebration:(id)a3 onRingAtIndex:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  double v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _BYTE *v16;
  unint64_t v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  arui_rings_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_212DE7000, v10, OS_LOG_TYPE_DEFAULT, "Playing celebration %@ on ring at index %lu", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  -[NSArray objectAtIndex:](self->_rings, "objectAtIndex:", a4);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setCelebration:", v8);
  objc_msgSend(v8, "duration");
  v12 = v11;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke;
  v14[3] = &unk_24CEC5F20;
  v14[4] = self;
  v17 = a4;
  v13 = v8;
  v15 = v13;
  v16 = buf;
  +[ARUIRingGroup animateWithDuration:animations:completion:](ARUIRingGroup, "animateWithDuration:animations:completion:", v14, v9, v12);

  _Block_object_dispose(buf, 8);
}

void __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id location;

  +[ARUIRingGroupAnimationState currentAnimationState](ARUIRingGroupAnimationState, "currentAnimationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  +[ARUIAnimationKeyCoordinator animationKeyForType:ringIndex:](ARUIAnimationKeyCoordinator, "animationKeyForType:ringIndex:", 5, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke_2;
  v7[3] = &unk_24CEC5EF8;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, &location);
  v9 = *(_QWORD *)(a1 + 48);
  LODWORD(v5) = 0;
  LODWORD(v6) = 1.0;
  objc_msgSend(v4, "_setupFloatAnimationForState:startValue:endValue:key:applier:", v2, v3, v7, v5, v6);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

uint64_t __58__ARUIRingGroup_playCelebration_onRingAtIndex_completion___block_invoke_2(uint64_t a1, float a2, double a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateDeltaTime:", a3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "ringGroupHasUpdated:", v7);

  result = ARUIFloatEqual(a2, 1.0);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCelebration:", 0);
  return result;
}

+ (void)animateWithDuration:(double)a3 animations:(id)a4
{
  +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", a4, 0, 0, a3);
}

+ (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 animations:(id)a5
{
  +[ARUIRingGroup animateUsingSpringWithTension:friction:animations:completion:](ARUIRingGroup, "animateUsingSpringWithTension:friction:animations:completion:", a5, 0, a3, a4);
}

+ (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 animations:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(_QWORD);
  ARUIRingGroupSpringAnimationState *v11;

  v9 = a6;
  v10 = (void (**)(_QWORD))a5;
  v11 = objc_alloc_init(ARUIRingGroupSpringAnimationState);
  -[ARUIRingGroupSpringAnimationState setTension:](v11, "setTension:", a3);
  -[ARUIRingGroupSpringAnimationState setFriction:](v11, "setFriction:", a4);
  -[ARUIRingGroupAnimationState setCompletion:](v11, "setCompletion:", v9);

  +[ARUIRingGroupAnimationState pushAnimationState:](ARUIRingGroupAnimationState, "pushAnimationState:", v11);
  v10[2](v10);

  +[ARUIRingGroupAnimationState popAnimationState](ARUIRingGroupAnimationState, "popAnimationState");
}

- (void)_setupColorAnimationForState:(id)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 key:(id)a8 applier:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[ARUIRingGroup _removeAnimationForKey:](self, "_removeAnimationForKey:", v17);
  objc_msgSend(v22, "duration");
  v24 = v23;
  objc_msgSend(v22, "timingFunction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIColorAnimation animationWithDuration:startTopColor:endTopColor:startBottomColor:endBottomColor:timingFunction:applier:](ARUIColorAnimation, "animationWithDuration:startTopColor:endTopColor:startBottomColor:endBottomColor:timingFunction:applier:", v21, v20, v19, v18, v25, v16, v24);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "addAnimation:", v26);
  -[NSMutableDictionary setObject:forKey:](self->_animations, "setObject:forKey:", v26, v17);

  -[ARUIRingGroup _updateAnimationObserving](self, "_updateAnimationObserving");
}

- (void)_setupFloat2AnimationForState:(ARUIRingGroup *)self startValue:(SEL)a2 endValue:(id)a3 key:(id)a4 applier:(id)a5
{
  double v5;
  double v6;
  double v8;
  double v9;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v8 = v6;
  v9 = v5;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[ARUIRingGroup _removeAnimationForKey:](self, "_removeAnimationForKey:", v13);
  objc_msgSend(v14, "duration");
  v16 = v15;
  objc_msgSend(v14, "timingFunction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIFloat2Animation animationWithDuration:startValue:endValue:timingFunction:applier:](ARUIFloat2Animation, "animationWithDuration:startValue:endValue:timingFunction:applier:", v17, v12, v16, v9, v8);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAnimation:", v18);
  -[NSMutableDictionary setObject:forKey:](self->_animations, "setObject:forKey:", v18, v13);

  -[ARUIRingGroup _updateAnimationObserving](self, "_updateAnimationObserving");
}

uint64_t __36__ARUIRingGroup_removeAllAnimations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "completeAnimation");
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_rings, CFSTR("rings"), 1);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (double)preferredActivityRingThicknessForDiameter:(double)a3
{
  double result;

  +[ARUIRingGroup preferredActivityRingThicknessForDiameter:isStandaloneRing:](ARUIRingGroup, "preferredActivityRingThicknessForDiameter:isStandaloneRing:", 0, a3);
  return result;
}

+ (double)preferredActivityRingInterspacingForDiameter:(double)a3
{
  double v3;

  v3 = (a3 + -29.0) / 114.0;
  if (v3 < 0.0)
    v3 = 0.0;
  if (v3 > 1.0)
    v3 = 1.0;
  return (v3 * -0.0288461538 + 0.0432692308) * a3;
}

+ (id)countdownRingGroup
{
  return +[ARUIRingGroup countdownRingGroupOnCompanion](ARUIRingGroup, "countdownRingGroupOnCompanion");
}

+ (id)countdownRingGroupOnCompanion
{
  void *v2;
  ARUIRingGroup *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  +[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[ARUIRingGroup initWithNumberOfRings:]([ARUIRingGroup alloc], "initWithNumberOfRings:", 1);
  LODWORD(v4) = 1132396544;
  -[ARUIRingGroup setGroupDiameter:](v3, "setGroupDiameter:", v4);
  LODWORD(v5) = 1099694080;
  -[ARUIRingGroup setThickness:](v3, "setThickness:", v5);
  LODWORD(v6) = 0;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:](v3, "setPercentage:ofRingAtIndex:", 0, v6);
  objc_msgSend(v2, "gradientLightColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gradientDarkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRingGroup setTopColor:bottomColor:ofRingAtIndex:](v3, "setTopColor:bottomColor:ofRingAtIndex:", v7, v8, 0);

  return v3;
}

+ (id)activityRingGroup
{
  return (id)objc_msgSend(a1, "activityRingGroupForRingType:", 3);
}

- (ARUIRingGroup)forWatch
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = (void *)-[ARUIRingGroup copy](self, "copy");
  objc_msgSend(v2, "setTranslation:", -131072.0);
  LODWORD(v3) = 1124466688;
  objc_msgSend(v2, "setGroupDiameter:", v3);
  LODWORD(v4) = 1.0;
  objc_msgSend(v2, "setInterspacing:", v4);
  LODWORD(v5) = 15.0;
  objc_msgSend(v2, "setThickness:", v5);
  return (ARUIRingGroup *)v2;
}

- (ARUIRingGroup)withSpriteSheet
{
  void *v2;
  void *v3;

  v2 = (void *)-[ARUIRingGroup copy](self, "copy");
  +[ARUISpriteSheetFactory spriteSheetForRingType:](ARUISpriteSheetFactory, "spriteSheetForRingType:", objc_msgSend(v2, "ringType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSpriteSheet:", v3);

  return (ARUIRingGroup *)v2;
}

- (ARUIRingGroup)withWheelchairSpriteSheet
{
  void *v2;
  void *v3;

  v2 = (void *)-[ARUIRingGroup copy](self, "copy");
  +[ARUISpriteSheetFactory wheelchairSpriteSheetForRingType:](ARUISpriteSheetFactory, "wheelchairSpriteSheetForRingType:", objc_msgSend(v2, "ringType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSpriteSheet:", v3);

  return (ARUIRingGroup *)v2;
}

- (id)playingSpriteAnimation
{
  -[ARUIRingGroup playSpriteAnimation](self, "playSpriteAnimation");
  return self;
}

- (void)_setStandardColorsWithAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v3 = a3;
  v30[3] = *MEMORY[0x24BDAC8D0];
  +[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIMetricColors briskColors](ARUIMetricColors, "briskColors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIMetricColors sedentaryColors](ARUIMetricColors, "sedentaryColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRingGroup rings](self, "rings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emptyOpacity");
  if (v9 == 0.0)
  {
    -[ARUIRingGroup rings](self, "rings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emptyOpacity");
    v13 = v12 == 0.0;

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v6, "gradientDarkColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  objc_msgSend(v28, "gradientDarkColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v15;
  if (v13)
    objc_msgSend(v5, "nonGradientTextColor");
  else
    objc_msgSend(v5, "gradientDarkColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "gradientLightColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  objc_msgSend(v28, "gradientLightColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v19;
  v27 = v5;
  if (v13)
    objc_msgSend(v5, "nonGradientTextColor");
  else
    objc_msgSend(v5, "gradientLightColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARUIRingGroup rings](self, "rings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v23 = 0;
    do
    {
      v24 = v23;
      if (objc_msgSend(v22, "count") == 1)
        v24 = -[ARUIRingGroup ringType](self, "ringType");
      objc_msgSend(v17, "objectAtIndex:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndex:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARUIRingGroup setTopColor:bottomColor:ofRingAtIndex:animated:](self, "setTopColor:bottomColor:ofRingAtIndex:animated:", v25, v26, v23, v3);

      ++v23;
    }
    while (v23 < objc_msgSend(v22, "count"));
  }

}

- (void)setPercentage:(float)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self, "setPercentage:ofRingAtIndex:animated:completion:", a4, a5, 0);
}

- (void)setActiveEnergyPercentage:(float)a3 animated:(BOOL)a4
{
  -[ARUIRingGroup setActiveEnergyPercentage:animated:completion:](self, "setActiveEnergyPercentage:animated:completion:", a4, 0);
}

- (void)setActiveEnergyPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  unint64_t v9;
  double v10;
  id v11;

  v5 = a4;
  v8 = a5;
  -[ARUIRingGroup rings](self, "rings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "count");
  *(float *)&v10 = a3;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self, "setPercentage:ofRingAtIndex:animated:completion:", 2 * (v9 > 1), v5, v8, v10);

}

- (void)setExerciseMinutesPercentage:(float)a3 animated:(BOOL)a4
{
  -[ARUIRingGroup setExerciseMinutesPercentage:animated:completion:](self, "setExerciseMinutesPercentage:animated:completion:", a4, 0);
}

- (void)setExerciseMinutesPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  _BOOL8 v9;
  double v10;
  id v11;

  v5 = a4;
  v8 = a5;
  -[ARUIRingGroup rings](self, "rings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (unint64_t)objc_msgSend(v11, "count") > 1;
  *(float *)&v10 = a3;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self, "setPercentage:ofRingAtIndex:animated:completion:", v9, v5, v8, v10);

}

- (void)setStandHoursPercentage:(float)a3 animated:(BOOL)a4
{
  -[ARUIRingGroup setStandHoursPercentage:animated:completion:](self, "setStandHoursPercentage:animated:completion:", a4, 0);
}

- (void)setStandHoursPercentage:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  id v10;

  v5 = a4;
  v8 = a5;
  -[ARUIRingGroup rings](self, "rings");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "count");
  *(float *)&v9 = a3;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self, "setPercentage:ofRingAtIndex:animated:completion:", 0, v5, v8, v9);

}

- (void)setActiveEnergyPercentage:(float)a3 exerciseMinutesPercentage:(float)a4 standHoursPercentage:(float)a5 animated:(BOOL)a6
{
  -[ARUIRingGroup setActiveEnergyPercentage:exerciseMinutesPercentage:standHoursPercentage:animated:completion:](self, "setActiveEnergyPercentage:exerciseMinutesPercentage:standHoursPercentage:animated:completion:", a6, 0);
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  -[ARUIRingGroup setIsStandalonePhoneFitnessMode:completion:](self, "setIsStandalonePhoneFitnessMode:completion:", a3, 0);
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3 completion:(id)a4
{
  -[ARUIRingGroup setIsStandalonePhoneFitnessMode:animated:completion:](self, "setIsStandalonePhoneFitnessMode:animated:completion:", a3, 1, a4);
}

- (void)setIsPaused:(BOOL)a3
{
  -[ARUIRingGroup setIsPaused:completion:](self, "setIsPaused:completion:", a3, 0);
}

- (void)setIsPaused:(BOOL)a3 animated:(BOOL)a4
{
  -[ARUIRingGroup setIsPaused:animated:completion:](self, "setIsPaused:animated:completion:", a3, a4, 0);
}

- (void)setIsPaused:(BOOL)a3 completion:(id)a4
{
  -[ARUIRingGroup setIsPaused:animated:completion:](self, "setIsPaused:animated:completion:", a3, 0, a4);
}

- (void)setIsPaused:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;
  BOOL v13;

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__ARUIRingGroup_Activity__setIsPaused_animated_completion___block_invoke;
    v11[3] = &unk_24CEC6408;
    v12 = a3;
    v11[4] = self;
    v13 = v5;
    v9 = MEMORY[0x2199A6364](v11);
    v10 = (void *)v9;
    if (v5)
    {
      +[ARUIRingGroup animateWithDuration:animations:completion:](ARUIRingGroup, "animateWithDuration:animations:completion:", v9, v8, 1.0);
    }
    else
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      if (v8)
        v8[2](v8);
    }

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

void __59__ARUIRingGroup_Activity__setIsPaused_animated_completion___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  int v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  id v46;

  if (*(_BYTE *)(a1 + 40))
  {
    +[ARUIMetricColors pausedRingsColors](ARUIMetricColors, "pausedRingsColors");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emptyOpacity");
    v5 = 0;
    if (v6 <= 0.0)
      v7 = 0.0;
    else
      v7 = *(float *)&ARUIRingPauseRingsOpacityValue;

    objc_msgSend(*(id *)(a1 + 32), "rings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emptyOpacity");
    if (v10 > 0.0)
      v5 = ARUIRingPauseRingsOpacityValue;

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v46, "gradientLightColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "gradientDarkColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTopColor:bottomColor:ofRingAtIndex:animated:", v12, v13, 2, *(unsigned __int8 *)(a1 + 41));

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v46, "gradientLightColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "gradientDarkColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTopColor:bottomColor:ofRingAtIndex:animated:", v15, v16, 1, *(unsigned __int8 *)(a1 + 41));

    v17 = *(void **)(a1 + 32);
    objc_msgSend(v46, "gradientLightColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "gradientDarkColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTopColor:bottomColor:ofRingAtIndex:animated:", v18, v19, 0, *(unsigned __int8 *)(a1 + 41));

    LODWORD(v20) = ARUIRingPauseRingsOpacityValue;
    objc_msgSend(*(id *)(a1 + 32), "setTrackOpacity:ofRingAtIndex:", 2, v20);
    *(float *)&v21 = v7;
    objc_msgSend(*(id *)(a1 + 32), "setTrackOpacity:ofRingAtIndex:", 1, v21);
    LODWORD(v22) = v5;
    objc_msgSend(*(id *)(a1 + 32), "setTrackOpacity:ofRingAtIndex:", 0, v22);
    LODWORD(v23) = ARUIRingPauseRingsOpacityValue;
    objc_msgSend(*(id *)(a1 + 32), "setEmptyOpacity:ofRingAtIndex:", 2, v23);
    *(float *)&v24 = v7;
    objc_msgSend(*(id *)(a1 + 32), "setEmptyOpacity:ofRingAtIndex:", 1, v24);
    LODWORD(v25) = v5;
    objc_msgSend(*(id *)(a1 + 32), "setEmptyOpacity:ofRingAtIndex:", 0, v25);
    LODWORD(v26) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setPercentage:ofRingAtIndex:animated:", 2, *(unsigned __int8 *)(a1 + 41), v26);
    LODWORD(v27) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setPercentage:ofRingAtIndex:animated:", 1, *(unsigned __int8 *)(a1 + 41), v27);
    LODWORD(v28) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setPercentage:ofRingAtIndex:animated:", 0, *(unsigned __int8 *)(a1 + 41), v28);

  }
  else
  {
    LODWORD(a2) = ARUIRingOpacityValueDefault;
    objc_msgSend(*(id *)(a1 + 32), "setTrackOpacity:ofRingAtIndex:", 2, a2);
    v29 = *(void **)(a1 + 32);
    objc_msgSend(v29, "rings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "emptyOpacity");
    if (*(float *)&v32 <= 0.0)
      *(float *)&v32 = 0.0;
    else
      LODWORD(v32) = ARUIRingOpacityValueDefault;
    objc_msgSend(v29, "setTrackOpacity:ofRingAtIndex:", 1, v32);

    v33 = *(void **)(a1 + 32);
    objc_msgSend(v33, "rings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "emptyOpacity");
    if (*(float *)&v36 <= 0.0)
      *(float *)&v36 = 0.0;
    else
      LODWORD(v36) = ARUIRingOpacityValueDefault;
    objc_msgSend(v33, "setTrackOpacity:ofRingAtIndex:", 0, v36);

    LODWORD(v37) = ARUIRingEmptyOpacityValueDefault;
    objc_msgSend(*(id *)(a1 + 32), "setEmptyOpacity:ofRingAtIndex:", 2, v37);
    v38 = *(void **)(a1 + 32);
    objc_msgSend(v38, "rings");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "emptyOpacity");
    if (*(float *)&v41 <= 0.0)
      *(float *)&v41 = 0.0;
    else
      LODWORD(v41) = ARUIRingEmptyOpacityValueDefault;
    objc_msgSend(v38, "setEmptyOpacity:ofRingAtIndex:", 1, v41);

    v42 = *(void **)(a1 + 32);
    objc_msgSend(v42, "rings");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "emptyOpacity");
    if (*(float *)&v45 <= 0.0)
      *(float *)&v45 = 0.0;
    else
      LODWORD(v45) = ARUIRingEmptyOpacityValueDefault;
    objc_msgSend(v42, "setEmptyOpacity:ofRingAtIndex:", 0, v45);

    objc_msgSend(*(id *)(a1 + 32), "_setStandardColorsWithAnimated:", *(unsigned __int8 *)(a1 + 41));
  }
}

+ (void)animateWithDuration:(uint64_t)a3 animations:(uint64_t)a4 curve:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212DE7000, a2, a3, "ARUIRingGroup animationWithDuration popping animation state: %@", a5, a6, a7, a8, 2u);
}

+ (void)animateWithDuration:(os_log_t)log animations:curve:completion:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_212DE7000, log, OS_LOG_TYPE_DEBUG, "ARUIRingGroup calling animations() block", v1, 2u);
}

+ (void)animateWithDuration:(uint64_t)a3 animations:(uint64_t)a4 curve:(uint64_t)a5 completion:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212DE7000, a2, a3, "ARUIRingGroup animationWithDuration pushing animation state: %@", a5, a6, a7, a8, 2u);
}

@end
