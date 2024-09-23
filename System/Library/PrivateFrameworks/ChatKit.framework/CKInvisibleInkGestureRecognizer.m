@implementation CKInvisibleInkGestureRecognizer

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (objc_msgSend(v5, "isDragging") & 1) != 0
        || (objc_msgSend(v5, "isDecelerating") & 1) != 0
        || (objc_msgSend(v5, "_isAnimatingScroll") & 1) != 0
        || objc_msgSend(v5, "__ck_isVerticallyRubberBanding");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return !gestureRecognizerIsAllowed(a3);
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return !gestureRecognizerIsAllowed(a3);
}

- (void)reset
{
  -[CKInvisibleInkGestureRecognizer setFirstTouch:](self, "setFirstTouch:", 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v13, "count") == 1
    && (-[CKInvisibleInkGestureRecognizer firstTouch](self, "firstTouch"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    objc_msgSend(v13, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkGestureRecognizer setFirstTouch:](self, "setFirstTouch:", v8);

    -[CKInvisibleInkGestureRecognizer firstTouch](self, "firstTouch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkGestureRecognizer view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationInView:", v10);
    -[CKInvisibleInkGestureRecognizer setStartLocation:](self, "setStartLocation:");

    -[CKInvisibleInkGestureRecognizer firstTouch](self, "firstTouch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timestamp");
    -[CKInvisibleInkGestureRecognizer setStartTime:](self, "setStartTime:");

  }
  else if (!-[CKInvisibleInkGestureRecognizer state](self, "state"))
  {
    -[CKInvisibleInkGestureRecognizer setState:](self, "setState:", 1);
  }
  -[CKInvisibleInkGestureRecognizer view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "touchesBegan:withEvent:", v13, v6);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  if (!-[CKInvisibleInkGestureRecognizer state](self, "state"))
  {
    -[CKInvisibleInkGestureRecognizer firstTouch](self, "firstTouch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    v9 = v8;
    -[CKInvisibleInkGestureRecognizer startTime](self, "startTime");
    v11 = v10;

    -[CKInvisibleInkGestureRecognizer firstTouch](self, "firstTouch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v23, "containsObject:", v12);

    if (v13 && (v14 = v9 - v11, v14 <= 0.2))
    {
      -[CKInvisibleInkGestureRecognizer firstTouch](self, "firstTouch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkGestureRecognizer view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "locationInView:", v16);
      v18 = v17;

      -[CKInvisibleInkGestureRecognizer startLocation](self, "startLocation");
      if (vabdd_f64(v18, v19) >= (1.0 - v14) * 140.0)
      {
        -[CKInvisibleInkGestureRecognizer setState:](self, "setState:", 5);
        -[CKInvisibleInkGestureRecognizer view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "touchesForGestureRecognizer:", self);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "touchesCancelled:withEvent:", v21, v6);

      }
    }
    else
    {
      -[CKInvisibleInkGestureRecognizer setState:](self, "setState:", 1);
    }
  }
  -[CKInvisibleInkGestureRecognizer view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "touchesMoved:withEvent:", v23, v6);

}

- (BOOL)_hasActiveTouchesInEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "touchesForGestureRecognizer:", self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((unint64_t)(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "phase") - 3) > 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[CKInvisibleInkGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "touchesEnded:withEvent:", v7, v6);

  LOBYTE(v7) = -[CKInvisibleInkGestureRecognizer _hasActiveTouchesInEvent:](self, "_hasActiveTouchesInEvent:", v6);
  if ((v7 & 1) == 0)
    -[CKInvisibleInkGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[CKInvisibleInkGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "touchesCancelled:withEvent:", v7, v6);

  LOBYTE(v7) = -[CKInvisibleInkGestureRecognizer _hasActiveTouchesInEvent:](self, "_hasActiveTouchesInEvent:", v6);
  if ((v7 & 1) == 0)
    -[CKInvisibleInkGestureRecognizer setState:](self, "setState:", 3);
}

- (UITouch)firstTouch
{
  return self->_firstTouch;
}

- (void)setFirstTouch:(id)a3
{
  objc_storeStrong((id *)&self->_firstTouch, a3);
}

- (CGPoint)startLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_startLocation.x;
  y = self->_startLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartLocation:(CGPoint)a3
{
  self->_startLocation = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstTouch, 0);
}

@end
