@implementation ASCModalViewGestureRecognizer

- (ASCModalViewGestureRecognizer)initWithTargetView:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v9;
  ASCModalViewGestureRecognizer *v10;
  ASCModalViewGestureRecognizer *v11;
  NSMutableSet *v12;
  NSMutableSet *activeTouches;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCModalViewGestureRecognizer;
  v10 = -[ASCModalViewGestureRecognizer initWithTarget:action:](&v15, sel_initWithTarget_action_, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_targetView, a3);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeTouches = v11->_activeTouches;
    v11->_activeTouches = v12;

  }
  return v11;
}

- (ASCModalViewGestureRecognizer)initWithCoder:(id)a3
{
  -[ASCModalViewGestureRecognizer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCModalViewGestureRecognizer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)reset
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCModalViewGestureRecognizer;
  -[ASCModalViewGestureRecognizer reset](&v4, sel_reset);
  -[ASCModalViewGestureRecognizer activeTouches](self, "activeTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (BOOL)isAnyTouch:(id)a3 fromEvent:(id)a4 outsideView:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "locationInView:", v9, (_QWORD)v15);
        if (!objc_msgSend(v9, "pointInside:withEvent:", v8))
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ASCModalViewGestureRecognizer activeTouches](self, "activeTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    goto LABEL_4;
  -[ASCModalViewGestureRecognizer targetView](self, "targetView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ASCModalViewGestureRecognizer isAnyTouch:fromEvent:outsideView:](self, "isAnyTouch:fromEvent:outsideView:", v6, v7, v10);

  if (v11)
  {
    -[ASCModalViewGestureRecognizer setState:](self, "setState:", 1);
LABEL_4:
    -[ASCModalViewGestureRecognizer activeTouches](self, "activeTouches");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unionSet:", v6);

    goto LABEL_5;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[ASCModalViewGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), v7, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

LABEL_5:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  -[ASCModalViewGestureRecognizer activeTouches](self, "activeTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v5);

  -[ASCModalViewGestureRecognizer activeTouches](self, "activeTouches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    -[ASCModalViewGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  -[ASCModalViewGestureRecognizer activeTouches](self, "activeTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v5);

  -[ASCModalViewGestureRecognizer activeTouches](self, "activeTouches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    -[ASCModalViewGestureRecognizer setState:](self, "setState:", 5);
}

- (UIView)targetView
{
  return self->_targetView;
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
}

@end
