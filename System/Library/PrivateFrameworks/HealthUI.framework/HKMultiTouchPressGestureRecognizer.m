@implementation HKMultiTouchPressGestureRecognizer

- (HKMultiTouchPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  HKMultiTouchPressGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMultiTouchPressGestureRecognizer;
  result = -[HKMultiTouchPressGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_minimumNumberOfTouches = 1;
    result->_maximumNumberOfTouches = 1;
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  _BOOL4 v24;
  NSMutableSet *touches;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableSet *v36;
  NSMutableSet *v37;
  NSMutableSet *v38;
  NSTimer *v39;
  NSTimer *touchDelayTimer;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  HKMultiTouchPressGestureRecognizer *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGPoint v60;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = a4;
  -[HKMultiTouchPressGestureRecognizer delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HKMultiTouchPressGestureRecognizer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[HKMultiTouchPressGestureRecognizer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "gestureWillBeginWithRecognizer:", self);

    }
  }
  if (objc_msgSend(v6, "count") <= self->_maximumNumberOfTouches)
  {
    v12 = objc_msgSend(v6, "count");
    if (-[NSMutableSet count](self->_touches, "count") + v12 <= self->_maximumNumberOfTouches
      || !self->_touchDelayTimer)
    {
      v47 = v6;
      if (CGRectEqualToRect(self->_touchableBounds, *MEMORY[0x1E0C9D648]))
      {
        v14 = (void *)objc_msgSend(v6, "mutableCopy");
      }
      else
      {
        v46 = 320;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v15 = v6;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v54 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              -[HKMultiTouchPressGestureRecognizer view](self, "view");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "locationInView:", v21);
              v60.x = v22;
              v60.y = v23;
              v24 = CGRectContainsPoint(self->_touchableBounds, v60);

              if (v24)
                objc_msgSend(v14, "addObject:", v20);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          }
          while (v17);
        }

      }
      touches = self->_touches;
      v13 = v48;
      if (touches)
      {
        if (-[NSMutableSet count](touches, "count") >= self->_maximumNumberOfTouches)
          goto LABEL_48;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v46 = (uint64_t)v14;
        v26 = v14;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v27)
        {
          v28 = v27;
          v29 = 0;
          v30 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v50 != v30)
                objc_enumerationMutation(v26);
              v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
              if (-[NSMutableSet count](self->_touches, "count", v46) >= self->_maximumNumberOfTouches)
              {
                -[HKMultiTouchPressGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", v32, v48);
              }
              else
              {
                -[NSMutableSet addObject:](self->_touches, "addObject:", v32);
                v29 = 1;
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          }
          while (v28);
        }
        else
        {
          v29 = 0;
        }

        v14 = (void *)v46;
        if (self->_touchDelayTimer)
          goto LABEL_48;
        if (-[HKMultiTouchPressGestureRecognizer state](self, "state")
          || -[NSMutableSet count](self->_touches, "count") < self->_minimumNumberOfTouches)
        {
          if ((v29 & 1) == 0 || -[HKMultiTouchPressGestureRecognizer state](self, "state") != 2)
            goto LABEL_48;
          v44 = self;
          v45 = 2;
          goto LABEL_47;
        }
      }
      else
      {
        if (objc_msgSend(v14, "count") <= self->_maximumNumberOfTouches)
        {
          v38 = v14;
          v34 = self->_touches;
          self->_touches = v38;
        }
        else
        {
          v33 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v14, "allObjects");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "subarrayWithRange:", 0, self->_maximumNumberOfTouches);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setWithArray:", v35);
          v36 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
          v37 = self->_touches;
          self->_touches = v36;

        }
        if (-[NSMutableSet count](self->_touches, "count") < self->_minimumNumberOfTouches)
          goto LABEL_48;
        if (self->_requiredPressDelay > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_touchDelayTimerFired_, 0, 0);
          v39 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          touchDelayTimer = self->_touchDelayTimer;
          self->_touchDelayTimer = v39;

          -[HKMultiTouchPressGestureRecognizer view](self, "view");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMultiTouchPressGestureRecognizer locationInView:](self, "locationInView:", v41);
          self->_startingPosition.x = v42;
          self->_startingPosition.y = v43;

LABEL_48:
          v6 = v47;
          goto LABEL_49;
        }
      }
      v44 = self;
      v45 = 1;
LABEL_47:
      -[HKMultiTouchPressGestureRecognizer setState:](v44, "setState:", v45, v46);
      goto LABEL_48;
    }
  }
  -[HKMultiTouchPressGestureRecognizer setState:](self, "setState:", 5);
  v13 = v48;
LABEL_49:

}

- (void)touchDelayTimerFired:(id)a3
{
  NSTimer *touchDelayTimer;

  -[NSTimer invalidate](self->_touchDelayTimer, "invalidate", a3);
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  -[HKMultiTouchPressGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSTimer *touchDelayTimer;
  NSTimer *v11;
  id v12;

  v12 = a3;
  -[HKMultiTouchPressGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMultiTouchPressGestureRecognizer locationInView:](self, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  touchDelayTimer = self->_touchDelayTimer;
  if (touchDelayTimer
    && (vabdd_f64(v7, self->_startingPosition.x) > 300.0 || vabdd_f64(v9, self->_startingPosition.y) > 300.0))
  {
    -[NSTimer invalidate](touchDelayTimer, "invalidate");
    v11 = self->_touchDelayTimer;
    self->_touchDelayTimer = 0;

  }
  if (-[NSMutableSet intersectsSet:](self->_touches, "intersectsSet:", v12)
    && -[HKMultiTouchPressGestureRecognizer state](self, "state") == 2)
  {
    -[HKMultiTouchPressGestureRecognizer setState:](self, "setState:", 2);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  int v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = -[NSMutableSet intersectsSet:](self->_touches, "intersectsSet:", v8);
  v6 = v8;
  if (v5)
  {
    -[NSMutableSet minusSet:](self->_touches, "minusSet:", v8);
    if (-[NSMutableSet count](self->_touches, "count") >= self->_minimumNumberOfTouches)
    {
      v7 = 2;
    }
    else if (self->_touchDelayTimer)
    {
      v7 = 5;
    }
    else
    {
      v7 = 3;
    }
    -[HKMultiTouchPressGestureRecognizer setState:](self, "setState:", v7);
    v6 = v8;
  }

}

- (void)reset
{
  NSMutableSet *touches;
  NSTimer *touchDelayTimer;

  touches = self->_touches;
  self->_touches = 0;

  -[NSTimer invalidate](self->_touchDelayTimer, "invalidate");
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  self->_startingPosition = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint result;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_touches;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "locationInView:", v4, (_QWORD)v22);
        v10 = v10 + v13;
        v11 = v11 + v14;
      }
      v8 += v7;
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);

    -[HKMultiTouchPressGestureRecognizer view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UIPointRoundToViewScale();
    v17 = v16;
    v19 = v18;

  }
  else
  {

    v17 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (NSArray)orderedTouches
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSMutableSet allObjects](self->_touches, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HKMultiTouchPressGestureRecognizer_orderedTouches__block_invoke;
  v6[3] = &unk_1E9C43130;
  v6[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

BOOL __52__HKMultiTouchPressGestureRecognizer_orderedTouches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v13);
  v15 = v14;
  v17 = v16;

  if (v10 == v15)
    return v12 > v17;
  else
    return v10 > v15;
}

- (id)touchAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HKMultiTouchPressGestureRecognizer orderedTouches](self, "orderedTouches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSSet)touches
{
  return &self->_touches->super;
}

- (double)requiredPressDelay
{
  return self->_requiredPressDelay;
}

- (void)setRequiredPressDelay:(double)a3
{
  self->_requiredPressDelay = a3;
}

- (unint64_t)minimumNumberOfTouches
{
  return self->_minimumNumberOfTouches;
}

- (void)setMinimumNumberOfTouches:(unint64_t)a3
{
  self->_minimumNumberOfTouches = a3;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (CGRect)touchableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_touchableBounds.origin.x;
  y = self->_touchableBounds.origin.y;
  width = self->_touchableBounds.size.width;
  height = self->_touchableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTouchableBounds:(CGRect)a3
{
  self->_touchableBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_touchDelayTimer, 0);
}

@end
