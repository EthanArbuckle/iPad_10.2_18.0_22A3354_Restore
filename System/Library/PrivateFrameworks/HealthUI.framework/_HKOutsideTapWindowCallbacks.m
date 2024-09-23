@implementation _HKOutsideTapWindowCallbacks

- (_HKOutsideTapWindowCallbacks)initWithWindow:(id)a3
{
  id v4;
  _HKOutsideTapWindowCallbacks *v5;
  _HKOutsideTapWindowCallbacks *v6;
  NSMutableArray *v7;
  NSMutableArray *callbacks;
  UITapGestureRecognizer *recognizer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HKOutsideTapWindowCallbacks;
  v5 = -[_HKOutsideTapWindowCallbacks init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_window, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    callbacks = v6->_callbacks;
    v6->_callbacks = v7;

    recognizer = v6->_recognizer;
    v6->_recognizer = 0;

  }
  return v6;
}

- (BOOL)matchesWindow:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HKOutsideTapWindowCallbacks window](self, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)addCallbackForView:(id)a3 outsideTapBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HKOutsideTapCallback *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[_HKOutsideTapCallback initWithView:outsideTapBlock:]([_HKOutsideTapCallback alloc], "initWithView:outsideTapBlock:", v7, v6);

  -[_HKOutsideTapWindowCallbacks callbacks](self, "callbacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  -[_HKOutsideTapWindowCallbacks _installTapGestureRecognizerIfNeeded](self, "_installTapGestureRecognizerIfNeeded");
}

- (void)removeCallbackForView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_HKOutsideTapWindowCallbacks callbacks](self, "callbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54___HKOutsideTapWindowCallbacks_removeCallbackForView___block_invoke;
  v7[3] = &unk_1E9C43108;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_removeObjectsPassingTest:", v7);

  -[_HKOutsideTapWindowCallbacks _removeTapGestureRecognizerIfNeeded](self, "_removeTapGestureRecognizerIfNeeded");
}

- (void)_installTapGestureRecognizerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_HKOutsideTapWindowCallbacks recognizer](self, "recognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
    -[_HKOutsideTapWindowCallbacks setRecognizer:](self, "setRecognizer:", v4);

    -[_HKOutsideTapWindowCallbacks recognizer](self, "recognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfTapsRequired:", 1);

    -[_HKOutsideTapWindowCallbacks recognizer](self, "recognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfTouchesRequired:", 1);

    -[_HKOutsideTapWindowCallbacks recognizer](self, "recognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCancelsTouchesInView:", 0);

    -[_HKOutsideTapWindowCallbacks window](self, "window");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", self->_recognizer);

  }
}

- (void)_removeTapGestureRecognizerIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[_HKOutsideTapWindowCallbacks recognizer](self, "recognizer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_HKOutsideTapWindowCallbacks callbacks](self, "callbacks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[_HKOutsideTapWindowCallbacks window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKOutsideTapWindowCallbacks recognizer](self, "recognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeGestureRecognizer:", v8);

      -[_HKOutsideTapWindowCallbacks setRecognizer:](self, "setRecognizer:", 0);
    }
  }
}

- (void)_handleTap:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  BOOL v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_HKOutsideTapWindowCallbacks callbacks](self, "callbacks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "locationInView:", v13);
          v15 = v14;
          v17 = v16;

          objc_msgSend(v11, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "frame");
          v29.x = v15;
          v29.y = v17;
          v19 = CGRectContainsPoint(v30, v29);

          if (!v19)
          {
            objc_msgSend(v11, "outsideTapBlock");
            v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "view");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v20)[2](v20, v21);

          }
        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  -[_HKOutsideTapWindowCallbacks callbacks](self, "callbacks");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsInArray:", v5);

  -[_HKOutsideTapWindowCallbacks _removeTapGestureRecognizerIfNeeded](self, "_removeTapGestureRecognizerIfNeeded");
}

- (UITapGestureRecognizer)recognizer
{
  return self->_recognizer;
}

- (void)setRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_recognizer, a3);
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_callbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end
