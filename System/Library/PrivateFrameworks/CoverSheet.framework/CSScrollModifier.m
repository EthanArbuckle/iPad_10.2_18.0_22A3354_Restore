@implementation CSScrollModifier

- (CSScrollModifier)initWithView:(id)a3
{
  id v4;
  CSScrollModifier *v5;
  CSScrollModifier *v6;
  void *v7;
  void *v8;
  CSScrollModifier *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSScrollModifier;
  v5 = -[CSScrollModifier init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeWeak((id *)&v5->_targetView, v4);
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dashBoardScrollModifierSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addKeyObserver:", v6);
    -[CSScrollModifier _loadFromSettings:](v6, "_loadFromSettings:", v8);

  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dashBoardScrollModifierSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeKeyObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CSScrollModifier;
  -[CSScrollModifier dealloc](&v5, sel_dealloc);
}

- (BOOL)scrollFromRightToLeft
{
  return self->_lastLocation.x < self->_firstLocation.x;
}

- (void)reset
{
  CGPoint v2;

  *(_WORD *)&self->_hasDraggedSinceReset = 0;
  self->_recognized = 0;
  v2 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_firstLocation = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_lastLocation = v2;
  self->_minSwipePercentageOfScreen = 100.0;
  self->_inertialMultiplier = 0.0;
  self->_initialScrollViewOffsetX = 0.0;
  self->_accumulatedDrag = 0.0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v4 = a3;
  if (!self->_hasDraggedSinceReset)
  {
    v15 = v4;
    objc_msgSend(v4, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    objc_msgSend(v5, "locationInView:", WeakRetained);
    self->_firstLocation.x = v7;
    self->_firstLocation.y = v8;

    self->_lastLocation = self->_firstLocation;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      objc_msgSend(v15, "contentSize");
      v10 = v9;
      objc_msgSend(v15, "frame");
      v12 = v10 - v11;
      objc_msgSend(v15, "contentOffset");
      v14 = v12 - v13;
    }
    else
    {
      objc_msgSend(v15, "contentOffset");
    }
    self->_initialScrollViewOffsetX = v14;
    self->_hasDraggedSinceReset = 1;
    v4 = v15;
  }

}

- (CGPoint)scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  id WeakRetained;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double maxAccumulatedDragThreshold;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSScrollModifier.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollView != nil"));

  }
  if (!self->_cancelled)
  {
    objc_msgSend(v13, "panGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    objc_msgSend(v14, "locationInView:", WeakRetained);
    v17 = v16;
    v19 = v18;

    -[CSScrollModifier _horizontalProgressSubtractionFromVertical:](self, "_horizontalProgressSubtractionFromVertical:", v17, v19);
    if (self->_cancelScrollingIfTooMuchDrag)
    {
      maxAccumulatedDragThreshold = self->_maxAccumulatedDragThreshold;
      v22 = v20 + self->_accumulatedDrag;
      self->_accumulatedDrag = v22;
      if (v22 > maxAccumulatedDragThreshold)
      {
        self->_cancelled = 1;
        objc_msgSend(v13, "_forcePanGestureToEndImmediately");
      }
    }
    self->_lastLocation.x = v17;
    self->_lastLocation.y = v19;
  }

  v23 = x;
  v24 = y;
  result.y = v24;
  result.x = v23;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v7;
  _BOOL4 v8;
  id *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double maxScrollDistance;
  double v20;
  id WeakRetained;
  double v22;
  BOOL v23;
  id v24;
  CGRect v25;

  x = a4.x;
  v7 = a3;
  if (self->_cancelled)
  {
    self->_recognized = 0;
  }
  else
  {
    v24 = v7;
    -[CSScrollModifier _updateScrollParameters](self, "_updateScrollParameters");
    v8 = -[CSScrollModifier scrollFromRightToLeft](self, "scrollFromRightToLeft");
    v9 = (id *)MEMORY[0x1E0CEB258];
    v10 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (objc_msgSend(*v9, "userInterfaceLayoutDirection") == 1)
    {
      objc_msgSend(v24, "contentSize");
      v12 = v11;
      objc_msgSend(v24, "frame");
      v14 = v12 - v13;
      objc_msgSend(v24, "contentOffset");
      v16 = v14 - v15;
    }
    else
    {
      objc_msgSend(v24, "contentOffset");
    }
    v17 = v16 - self->_initialScrollViewOffsetX;
    if (v10 == 1)
      v17 = -v17;
    if (v8)
      v18 = v17 + self->_inertialMultiplier * x;
    else
      v18 = -(v17 + self->_inertialMultiplier * x);
    maxScrollDistance = self->_maxScrollDistance;
    v20 = self->_minSwipePercentageOfScreen / 100.0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    objc_msgSend(WeakRetained, "bounds");
    v22 = fmin(maxScrollDistance, v20 * CGRectGetWidth(v25));

    v23 = v18 > v22;
    if (vabdd_f64(v18, v22) < 0.00000011920929)
      v23 = 1;
    self->_recognized = v23;
    v7 = v24;
  }

}

- (double)_horizontalProgressSubtractionFromVertical:(CGPoint)a3
{
  long double v4;
  long double v5;
  float v6;
  double v7;
  float v8;
  float v9;
  double result;

  v4 = a3.y - self->_lastLocation.y;
  v5 = a3.x - self->_lastLocation.x;
  v6 = v4 * v4 + v5 * v5;
  v7 = sqrtf(v6);
  v8 = atan2(v4, v5);
  v9 = sinf(v8);
  result = pow(v9 * v9, self->_powerOfVerticalDirectionSine2) * v7;
  if (result > self->_maxDragFromVerticalPerFrame)
    return self->_maxDragFromVerticalPerFrame;
  return result;
}

- (void)_updateScrollParameters
{
  id WeakRetained;
  double x;
  void *v5;
  uint64_t v6;
  double inertialMultiplierSigmoidRange;
  uint64_t v8;
  double inertialMultiplierSigmoidBase;
  double v10;
  double minPercentageSigmoidBase;
  double minPercentageSigmoidRange;
  CGRect v13;

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 != 1)
      goto LABEL_3;
LABEL_6:
    self->_minSwipePercentageOfScreen = self->_minPercentageSigmoidBase;
    inertialMultiplierSigmoidRange = self->_inertialMultiplierSigmoidRange;
    v8 = 64;
    goto LABEL_9;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_6;
LABEL_3:
  if (-[CSScrollModifier scrollFromRightToLeft](self, "scrollFromRightToLeft"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    objc_msgSend(WeakRetained, "bounds");
    x = CGRectGetWidth(v13) - self->_firstLocation.x;

  }
  else
  {
    x = self->_firstLocation.x;
  }
  inertialMultiplierSigmoidBase = self->_inertialMultiplierSigmoidBase;
  v10 = self->_inertialMultiplierSigmoidRange;
  self->_inertialMultiplier = inertialMultiplierSigmoidBase
                            + v10
                            / (exp(-(self->_inertialMultiplierSigmoidAlpha * (x - self->_inertialMultiplierSigmoidPivot)))
                             + 1.0);
  minPercentageSigmoidBase = self->_minPercentageSigmoidBase;
  minPercentageSigmoidRange = self->_minPercentageSigmoidRange;
  inertialMultiplierSigmoidRange = minPercentageSigmoidBase
                                 + minPercentageSigmoidRange
                                 / (exp(-(self->_minPercentageSigmoidAlpha * (x - self->_minPercentageSigmoidPivot)))
                                  + 1.0);
  v8 = 56;
LABEL_9:
  *(double *)((char *)&self->super.isa + v8) = inertialMultiplierSigmoidRange;
}

- (void)setAccumulatedDragThresholdPercentage:(double)a3
{
  id WeakRetained;
  CGRect v5;

  self->_accumulatedDragThresholdPercentage = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  objc_msgSend(WeakRetained, "bounds");
  self->_maxAccumulatedDragThreshold = CGRectGetWidth(v5) * (self->_accumulatedDragThresholdPercentage / 100.0);

}

- (void)_loadFromSettings:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  objc_msgSend(v4, "maxScrollDistance");
  -[CSScrollModifier setMaxScrollDistance:](self, "setMaxScrollDistance:");
  -[CSScrollModifier setCancelScrollingIfTooMuchDrag:](self, "setCancelScrollingIfTooMuchDrag:", objc_msgSend(v4, "cancelScrollingIfTooMuchDrag"));
  objc_msgSend(v4, "accumulatedDragThresholdPercentage");
  -[CSScrollModifier setAccumulatedDragThresholdPercentage:](self, "setAccumulatedDragThresholdPercentage:");
  objc_msgSend(v4, "maxDragFromVerticalPerFrame");
  -[CSScrollModifier setMaxDragFromVerticalPerFrame:](self, "setMaxDragFromVerticalPerFrame:");
  objc_msgSend(v4, "powerOfVerticalDirectionSine2");
  -[CSScrollModifier setPowerOfVerticalDirectionSine2:](self, "setPowerOfVerticalDirectionSine2:");
  objc_msgSend(v4, "inertialMultiplierSigmoidBase");
  -[CSScrollModifier setInertialMultiplierSigmoidBase:](self, "setInertialMultiplierSigmoidBase:");
  objc_msgSend(v4, "inertialMultiplierSigmoidRange");
  -[CSScrollModifier setInertialMultiplierSigmoidRange:](self, "setInertialMultiplierSigmoidRange:");
  objc_msgSend(v4, "inertialMultiplierSigmoidPivot");
  -[CSScrollModifier setInertialMultiplierSigmoidPivot:](self, "setInertialMultiplierSigmoidPivot:");
  objc_msgSend(v4, "inertialMultiplierSigmoidAlpha");
  -[CSScrollModifier setInertialMultiplierSigmoidAlpha:](self, "setInertialMultiplierSigmoidAlpha:");
  objc_msgSend(v4, "minPercentageSigmoidBase");
  -[CSScrollModifier setMinPercentageSigmoidBase:](self, "setMinPercentageSigmoidBase:");
  objc_msgSend(v4, "minPercentageSigmoidRange");
  -[CSScrollModifier setMinPercentageSigmoidRange:](self, "setMinPercentageSigmoidRange:");
  objc_msgSend(v4, "minPercentageSigmoidPivot");
  -[CSScrollModifier setMinPercentageSigmoidPivot:](self, "setMinPercentageSigmoidPivot:");
  objc_msgSend(v4, "minPercentageSigmoidAlpha");
  v6 = v5;

  -[CSScrollModifier setMinPercentageSigmoidAlpha:](self, "setMinPercentageSigmoidAlpha:", v6);
}

- (BOOL)recognized
{
  return self->_recognized;
}

- (double)maxScrollDistance
{
  return self->_maxScrollDistance;
}

- (void)setMaxScrollDistance:(double)a3
{
  self->_maxScrollDistance = a3;
}

- (BOOL)cancelScrollingIfTooMuchDrag
{
  return self->_cancelScrollingIfTooMuchDrag;
}

- (void)setCancelScrollingIfTooMuchDrag:(BOOL)a3
{
  self->_cancelScrollingIfTooMuchDrag = a3;
}

- (double)accumulatedDragThresholdPercentage
{
  return self->_accumulatedDragThresholdPercentage;
}

- (double)maxDragFromVerticalPerFrame
{
  return self->_maxDragFromVerticalPerFrame;
}

- (void)setMaxDragFromVerticalPerFrame:(double)a3
{
  self->_maxDragFromVerticalPerFrame = a3;
}

- (double)powerOfVerticalDirectionSine2
{
  return self->_powerOfVerticalDirectionSine2;
}

- (void)setPowerOfVerticalDirectionSine2:(double)a3
{
  self->_powerOfVerticalDirectionSine2 = a3;
}

- (double)inertialMultiplierSigmoidBase
{
  return self->_inertialMultiplierSigmoidBase;
}

- (void)setInertialMultiplierSigmoidBase:(double)a3
{
  self->_inertialMultiplierSigmoidBase = a3;
}

- (double)inertialMultiplierSigmoidRange
{
  return self->_inertialMultiplierSigmoidRange;
}

- (void)setInertialMultiplierSigmoidRange:(double)a3
{
  self->_inertialMultiplierSigmoidRange = a3;
}

- (double)inertialMultiplierSigmoidPivot
{
  return self->_inertialMultiplierSigmoidPivot;
}

- (void)setInertialMultiplierSigmoidPivot:(double)a3
{
  self->_inertialMultiplierSigmoidPivot = a3;
}

- (double)inertialMultiplierSigmoidAlpha
{
  return self->_inertialMultiplierSigmoidAlpha;
}

- (void)setInertialMultiplierSigmoidAlpha:(double)a3
{
  self->_inertialMultiplierSigmoidAlpha = a3;
}

- (double)minPercentageSigmoidBase
{
  return self->_minPercentageSigmoidBase;
}

- (void)setMinPercentageSigmoidBase:(double)a3
{
  self->_minPercentageSigmoidBase = a3;
}

- (double)minPercentageSigmoidRange
{
  return self->_minPercentageSigmoidRange;
}

- (void)setMinPercentageSigmoidRange:(double)a3
{
  self->_minPercentageSigmoidRange = a3;
}

- (double)minPercentageSigmoidPivot
{
  return self->_minPercentageSigmoidPivot;
}

- (void)setMinPercentageSigmoidPivot:(double)a3
{
  self->_minPercentageSigmoidPivot = a3;
}

- (double)minPercentageSigmoidAlpha
{
  return self->_minPercentageSigmoidAlpha;
}

- (void)setMinPercentageSigmoidAlpha:(double)a3
{
  self->_minPercentageSigmoidAlpha = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetView);
}

@end
