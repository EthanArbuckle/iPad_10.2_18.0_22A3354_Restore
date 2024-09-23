@implementation ACUISDependencyGestureRecognizer

- (NSSet)observedControlClasses
{
  NSSet *observedControlClasses;
  NSSet *v4;
  NSSet *v5;

  observedControlClasses = self->_observedControlClasses;
  if (!observedControlClasses)
  {
    v4 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
    v5 = self->_observedControlClasses;
    self->_observedControlClasses = v4;

    observedControlClasses = self->_observedControlClasses;
  }
  return observedControlClasses;
}

- (void)setObservedControlClasses:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_observedControlClasses, a3);
    if (-[ACUISDependencyGestureRecognizer isEnabled](self, "isEnabled"))
    {
      -[ACUISDependencyGestureRecognizer setEnabled:](self, "setEnabled:", 0);
      -[ACUISDependencyGestureRecognizer setEnabled:](self, "setEnabled:", 1);
    }
  }

}

- (ACUISDependencyGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  ACUISDependencyGestureRecognizer *v4;
  ACUISDependencyGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACUISDependencyGestureRecognizer;
  v4 = -[ACUISDependencyGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ACUISDependencyGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[ACUISDependencyGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[ACUISDependencyGestureRecognizer setDelegate:](v5, "setDelegate:", v5);
    v5->_hysteresis = 9.0;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  double v8;
  CGFloat v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ACUISDependencyGestureRecognizer;
  v6 = a3;
  -[ACUISDependencyGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, a4);
  v7 = _CentroidOfTouches(v6);
  v9 = v8;

  self->_initialSceneReferenceLocation.x = v7;
  self->_initialSceneReferenceLocation.y = v9;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ACUISDependencyGestureRecognizer;
  -[ACUISDependencyGestureRecognizer touchesMoved:withEvent:](&v23, sel_touchesMoved_withEvent_, v6, v7);
  if (!-[ACUISDependencyGestureRecognizer state](self, "state")
    && -[ACUISDependencyGestureRecognizer _didExceedHysteresisWithTouches:](self, "_didExceedHysteresisWithTouches:", v6))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "view", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[ACUISDependencyGestureRecognizer shouldRecognizeTouchForView:](self, "shouldRecognizeTouchForView:", v13))
          {

            v18 = 3;
            goto LABEL_18;
          }
          v14 = objc_opt_class();
          v15 = v13;
          if (v14)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = v15;
            else
              v16 = 0;
          }
          else
          {
            v16 = 0;
          }
          v17 = v16;

          objc_msgSend(v17, "cancelTrackingWithEvent:", v7);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v10)
          continue;
        break;
      }
    }
    v18 = 5;
LABEL_18:

    -[ACUISDependencyGestureRecognizer setState:](self, "setState:", v18);
  }

}

- (BOOL)shouldRecognizeTouchForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char isKindOfClass;
  char v13;
  uint64_t v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      -[ACUISDependencyGestureRecognizer observedControlClasses](self, "observedControlClasses", 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            isKindOfClass = objc_opt_isKindOfClass();
          }
          v13 = isKindOfClass;
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);

        if ((v13 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_18;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "superview");
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
      if (!v14)
      {
        v15 = 0;
        goto LABEL_18;
      }
    }
    v15 = objc_msgSend(v6, "acuis_wantsPriorityOverTargetOfGestureRecognizer:", self);
LABEL_18:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[ACUISDependencyGestureRecognizer view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
    x = v13;
    y = v14;
  }
  objc_msgSend(v9, "convertPoint:fromView:", 0, x, y);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (BOOL)_didExceedHysteresisWithTouches:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double hysteresis;
  BOOL v18;
  double v19;
  BOOL v20;

  v4 = a3;
  -[ACUISDependencyGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACUISDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, self->_initialSceneReferenceLocation.x, self->_initialSceneReferenceLocation.y);
  v7 = v6;
  v9 = v8;
  v10 = _CentroidOfTouches(v4);
  v12 = v11;

  -[ACUISDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, v10, v12);
  v14 = v13 - v7;
  v16 = v15 - v9;
  if (v14 < 0.0)
    v14 = -v14;
  hysteresis = self->_hysteresis;
  v18 = v14 > hysteresis;
  v19 = -v16;
  if (v16 >= 0.0)
    v19 = v16;
  v20 = v19 > hysteresis || v18;

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedControlClasses, 0);
}

@end
