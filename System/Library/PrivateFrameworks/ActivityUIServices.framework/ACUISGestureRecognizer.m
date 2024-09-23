@implementation ACUISGestureRecognizer

- (NSSet)observedControlClasses
{
  NSSet *observedControlClasses;
  id v4;
  uint64_t v5;
  NSSet *v6;
  NSSet *v7;

  observedControlClasses = self->_observedControlClasses;
  if (!observedControlClasses)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCF20]);
    v5 = objc_opt_class();
    v6 = (NSSet *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    v7 = self->_observedControlClasses;
    self->_observedControlClasses = v6;

    observedControlClasses = self->_observedControlClasses;
  }
  return observedControlClasses;
}

- (ACUISGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  ACUISGestureRecognizer *v4;
  ACUISGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  v4 = -[ACUISGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ACUISGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[ACUISGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[ACUISGestureRecognizer setDelegate:](v5, "setDelegate:", v5);
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  v6 = a3;
  -[ACUISGestureRecognizer touchesBegan:withEvent:](&v7, sel_touchesBegan_withEvent_, v6, a4);
  LODWORD(a4) = -[ACUISGestureRecognizer _shouldRecognizeTouches:](self, "_shouldRecognizeTouches:", v6, v7.receiver, v7.super_class);

  if ((_DWORD)a4)
    -[ACUISGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  v6 = a3;
  -[ACUISGestureRecognizer touchesMoved:withEvent:](&v7, sel_touchesMoved_withEvent_, v6, a4);
  LODWORD(a4) = -[ACUISGestureRecognizer _shouldRecognizeTouches:](self, "_shouldRecognizeTouches:", v6, v7.receiver, v7.super_class);

  if ((_DWORD)a4)
    -[ACUISGestureRecognizer setState:](self, "setState:", 2);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  v6 = a3;
  -[ACUISGestureRecognizer touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, v6, a4);
  LODWORD(a4) = -[ACUISGestureRecognizer _shouldRecognizeTouches:](self, "_shouldRecognizeTouches:", v6, v7.receiver, v7.super_class);

  if ((_DWORD)a4)
    -[ACUISGestureRecognizer setState:](self, "setState:", 3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_shouldRecognizeTouches:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ACUISGestureRecognizer _shouldRecognizeTouchForView:](self, "_shouldRecognizeTouchForView:", v9))
        {
LABEL_19:

          v15 = 1;
          goto LABEL_21;
        }
        v19 = 0u;
        v20 = 0u;
        v18 = 0u;
        -[ACUISGestureRecognizer observedControlClasses](self, "observedControlClasses", 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {

                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_21:

  return v15;
}

- (BOOL)_shouldRecognizeTouchForView:(id)a3
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
      -[ACUISGestureRecognizer observedControlClasses](self, "observedControlClasses", 0, 0);
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

- (void)setObservedControlClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedControlClasses, 0);
}

@end
