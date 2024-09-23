@implementation AVTTouchDownGestureRecognizer

- (AVTTouchDownGestureRecognizer)init
{
  AVTTouchDownGestureRecognizer *v2;
  AVTTouchDownGestureRecognizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTTouchDownGestureRecognizer;
  v2 = -[AVTTouchDownGestureRecognizer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AVTTouchDownGestureRecognizer _configure](v2, "_configure");
  return v3;
}

- (AVTTouchDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  AVTTouchDownGestureRecognizer *v4;
  AVTTouchDownGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTTouchDownGestureRecognizer;
  v4 = -[AVTTouchDownGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[AVTTouchDownGestureRecognizer _configure](v4, "_configure");
  return v5;
}

- (void)_configure
{
  -[AVTTouchDownGestureRecognizer setAllowsTouchesToPassThrough:](self, "setAllowsTouchesToPassThrough:", 1);
  -[AVTTouchDownGestureRecognizer setDelegate:](self, "setDelegate:", self);
}

- (void)requireGestureRecognizerToFail:(id)a3
{
  id v4;
  NSHashTable *recognizersRequiredToFail;
  NSHashTable *v6;
  NSHashTable *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVTTouchDownGestureRecognizer;
  -[AVTTouchDownGestureRecognizer requireGestureRecognizerToFail:](&v8, sel_requireGestureRecognizerToFail_, v4);
  recognizersRequiredToFail = self->_recognizersRequiredToFail;
  if (!recognizersRequiredToFail)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recognizersRequiredToFail;
    self->_recognizersRequiredToFail = v6;

    recognizersRequiredToFail = self->_recognizersRequiredToFail;
  }
  -[NSHashTable addObject:](recognizersRequiredToFail, "addObject:", v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[AVTTouchDownGestureRecognizer allowsTouchesToPassThrough](self, "allowsTouchesToPassThrough"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_recognizersRequiredToFail;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "view", (_QWORD)v20);
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "locationInView:", v12);
          v14 = v13;
          v16 = v15;

          objc_msgSend(v11, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v17, "pointInside:withEvent:", 0, v14, v16);

          if ((v12 & 1) != 0)
          {

            goto LABEL_12;
          }
        }
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
    }

    -[AVTTouchDownGestureRecognizer setState:](self, "setState:", 3);
    v18 = 0;
  }
  else
  {
LABEL_12:
    v18 = 1;
  }

  return v18;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (!-[AVTTouchDownGestureRecognizer state](self, "state", a3, a4))
    -[AVTTouchDownGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[AVTTouchDownGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[AVTTouchDownGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (BOOL)allowsTouchesToPassThrough
{
  return self->_allowsTouchesToPassThrough;
}

- (void)setAllowsTouchesToPassThrough:(BOOL)a3
{
  self->_allowsTouchesToPassThrough = a3;
}

- (NSHashTable)recognizersRequiredToFail
{
  return self->_recognizersRequiredToFail;
}

- (void)setRecognizersRequiredToFail:(id)a3
{
  objc_storeStrong((id *)&self->_recognizersRequiredToFail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizersRequiredToFail, 0);
}

@end
