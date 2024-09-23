@implementation MKTiltGestureRecognizer

- (MKTiltGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  MKTiltGestureRecognizer *v4;
  MKTiltGestureRecognizer *v5;
  MKTiltGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKTiltGestureRecognizer;
  v4 = -[MKTiltGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MKTiltGestureRecognizer setMinimumNumberOfTouches:](v4, "setMinimumNumberOfTouches:", 2);
    -[MKTiltGestureRecognizer setMaximumNumberOfTouches:](v5, "setMaximumNumberOfTouches:", 2);
    -[MKTiltGestureRecognizer _setCanPanHorizontally:](v5, "_setCanPanHorizontally:", 0);
    v6 = v5;
  }

  return v5;
}

- (id)_activeTouchesForEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "touchesForGestureRecognizer:", self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "phase") <= 2)
        {
          if (!v8)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)_distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  return sqrt((a4.y - a3.y) * (a4.y - a3.y) + (a4.x - a3.x) * (a4.x - a3.x));
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UITouch *v10;
  UITouch *touch1;
  UITouch *v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  UITouch **p_touch2;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  UITouch *v23;
  UITouch *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[MKTiltGestureRecognizer state](self, "state"))
  {
    -[MKTiltGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      if (!self->_touch1)
      {
        objc_msgSend(v9, "objectAtIndex:", 0);
        v10 = (UITouch *)objc_claimAutoreleasedReturnValue();
        touch1 = self->_touch1;
        self->_touch1 = v10;

        v12 = self->_touch1;
        -[MKTiltGestureRecognizer view](self, "view");
        v13 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITouch locationInView:](v12, "locationInView:", v14);
        self->_initialTouch1Point.x = v15;
        self->_initialTouch1Point.y = v16;

        v9 = v13;
      }
      p_touch2 = &self->_touch2;
      if (!self->_touch2)
      {
        v29 = v9;
        v30 = v8;
        v31 = v7;
        v32 = v6;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v18 = v8;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v35;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v35 != v21)
                objc_enumerationMutation(v18);
              v23 = *(UITouch **)(*((_QWORD *)&v34 + 1) + 8 * v22);
              if (v23 != self->_touch1)
              {
                objc_storeStrong((id *)&self->_touch2, v23);
                v24 = *p_touch2;
                -[MKTiltGestureRecognizer view](self, "view");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[UITouch locationInView:](v24, "locationInView:", v25);
                self->_initialTouch2Point.x = v26;
                self->_initialTouch2Point.y = v27;

              }
              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v20);
        }

        v7 = v31;
        v6 = v32;
        v9 = v29;
        v8 = v30;
      }
      if (self->_touch1 && *p_touch2)
      {
        -[MKTiltGestureRecognizer _distanceFromPoint:toPoint:](self, "_distanceFromPoint:toPoint:", self->_initialTouch1Point.x, self->_initialTouch1Point.y, self->_initialTouch2Point.x, self->_initialTouch2Point.y);
        self->_initialDistance = v28;
      }
    }

  }
  v33.receiver = self;
  v33.super_class = (Class)MKTiltGestureRecognizer;
  -[MKTiltGestureRecognizer touchesBegan:withEvent:](&v33, sel_touchesBegan_withEvent_, v6, v7, v29, v30, v31, v32);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  UITouch *touch1;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UITouch *touch2;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  if (-[MKTiltGestureRecognizer state](self, "state"))
    goto LABEL_2;
  -[MKTiltGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 < -[MKTiltGestureRecognizer minimumNumberOfTouches](self, "minimumNumberOfTouches"))
  {
LABEL_17:

    goto LABEL_18;
  }
  if (!objc_msgSend(v8, "containsObject:", self->_touch1)
    || !objc_msgSend(v8, "containsObject:", self->_touch2))
  {
    goto LABEL_16;
  }
  touch1 = self->_touch1;
  -[MKTiltGestureRecognizer view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITouch locationInView:](touch1, "locationInView:", v11);
  v13 = v12;
  v15 = v14;

  touch2 = self->_touch2;
  -[MKTiltGestureRecognizer view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITouch locationInView:](touch2, "locationInView:", v17);
  v19 = v18;
  v21 = v20;

  v22 = v15 - self->_initialTouch1Point.y;
  v23 = v21 - self->_initialTouch2Point.y;
  if (v22 >= 0.0 && v23 <= 0.0)
    goto LABEL_12;
  if (v22 <= 0.0 && v23 >= 0.0)
  {
LABEL_12:
    v24 = v22 - v23;
    if (v24 < 0.0)
      v24 = -v24;
    if (v24 > 18.0)
      goto LABEL_16;
  }
  -[MKTiltGestureRecognizer _distanceFromPoint:toPoint:](self, "_distanceFromPoint:toPoint:", v13, v15, v19, v21);
  v26 = v25 - self->_initialDistance;
  if (v26 < 0.0)
    v26 = -v26;
  if (v26 > 15.0)
  {
LABEL_16:
    -[MKTiltGestureRecognizer setState:](self, "setState:", 5);
    goto LABEL_17;
  }

LABEL_2:
  v27.receiver = self;
  v27.super_class = (Class)MKTiltGestureRecognizer;
  -[MKTiltGestureRecognizer touchesMoved:withEvent:](&v27, sel_touchesMoved_withEvent_, v6, v7);
LABEL_18:

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKTiltGestureRecognizer;
  v6 = a4;
  -[MKTiltGestureRecognizer touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, a3, v6);
  -[MKTiltGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v6, v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8 < -[MKTiltGestureRecognizer minimumNumberOfTouches](self, "minimumNumberOfTouches"))
  {
    if (-[MKTiltGestureRecognizer state](self, "state") == 1)
    {
      v9 = 3;
    }
    else if (-[MKTiltGestureRecognizer state](self, "state") == 2)
    {
      v9 = 3;
    }
    else
    {
      v9 = 5;
    }
    -[MKTiltGestureRecognizer setState:](self, "setState:", v9);
  }

}

- (void)reset
{
  UITouch *touch1;
  UITouch *touch2;
  objc_super v5;

  touch1 = self->_touch1;
  self->_touch1 = 0;

  touch2 = self->_touch2;
  self->_touch2 = 0;

  v5.receiver = self;
  v5.super_class = (Class)MKTiltGestureRecognizer;
  -[MKTiltGestureRecognizer reset](&v5, sel_reset);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touch2, 0);
  objc_storeStrong((id *)&self->_touch1, 0);
}

@end
