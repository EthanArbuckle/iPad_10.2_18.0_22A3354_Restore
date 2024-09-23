@implementation CCUIDismissalGestureRecognizer

- (CCUIDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  CCUIDismissalGestureRecognizer *v4;
  CCUIDismissalGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIDismissalGestureRecognizer;
  v4 = -[CCUIDismissalGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[CCUIDismissalGestureRecognizer addTarget:action:](v4, "addTarget:action:", v4, sel__tryToCancelTouches);
  return v5;
}

- (void)reset
{
  NSSet *currentTouches;

  self->_triggered = 0;
  currentTouches = self->_currentTouches;
  self->_currentTouches = 0;

}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSSet *v8;
  NSSet *currentTouches;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[CCUIDismissalGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v6);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  currentTouches = self->_currentTouches;
  self->_currentTouches = v8;

  v10.receiver = self;
  v10.super_class = (Class)CCUIDismissalGestureRecognizer;
  -[CCUIDismissalGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSSet *v8;
  NSSet *currentTouches;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[CCUIDismissalGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v6);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  currentTouches = self->_currentTouches;
  self->_currentTouches = v8;

  v10.receiver = self;
  v10.super_class = (Class)CCUIDismissalGestureRecognizer;
  -[CCUIDismissalGestureRecognizer touchesMoved:withEvent:](&v10, sel_touchesMoved_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSSet *v8;
  NSSet *currentTouches;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[CCUIDismissalGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v6);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  currentTouches = self->_currentTouches;
  self->_currentTouches = v8;

  v10.receiver = self;
  v10.super_class = (Class)CCUIDismissalGestureRecognizer;
  -[CCUIDismissalGestureRecognizer touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, v7, v6);

}

- (void)_tryToCancelTouches
{
  uint64_t v3;
  NSSet **p_currentTouches;
  NSSet *v5;

  if (!self->_triggered)
  {
    v3 = -[CCUIDismissalGestureRecognizer state](self, "state");
    if ((unint64_t)(v3 - 1) >= 3)
    {
      if ((unint64_t)(v3 - 4) >= 2)
        return;
      self->_triggered = 1;
      p_currentTouches = &self->_currentTouches;
    }
    else
    {
      self->_triggered = 1;
      p_currentTouches = &self->_currentTouches;
      -[CCUIDismissalGestureRecognizer _cancelOtherGestureRecognizersForTouches:](self, "_cancelOtherGestureRecognizersForTouches:", self->_currentTouches);
    }
    v5 = *p_currentTouches;
    *p_currentTouches = 0;

  }
}

- (void)_cancelOtherGestureRecognizersForTouches:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CCUIDismissalGestureRecognizer *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v9, "gestureRecognizers", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              v15 = *(CCUIDismissalGestureRecognizer **)(*((_QWORD *)&v16 + 1) + 8 * v14);
              if (v15 != self)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "setEnabled:", 0);
                -[CCUIDismissalGestureRecognizer setEnabled:](v15, "setEnabled:", 1);
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouches, 0);
}

@end
