@implementation CCUIStatusLabelViewController

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CCUIStatusLabelViewController;
  -[CCUIStatusLabelViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[CCUIStatusLabelViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_statusLabels;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setFrame:", 0.0, 0.0, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v18 = *MEMORY[0x1E0C80C00];
  -[CCUIStatusLabelViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_statusLabels;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setEdgeInsets:", top, left, bottom, right, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (CCUIStatusLabelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIStatusLabelViewController *v4;
  CCUIStatusUpdateQueue *v5;
  CCUIStatusUpdateQueue *updateQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIStatusLabelViewController;
  v4 = -[CCUIStatusLabelViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(CCUIStatusUpdateQueue);
    updateQueue = v4->_updateQueue;
    v4->_updateQueue = v5;

  }
  return v4;
}

- (UIEdgeInsets)edgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[NSArray firstObject](self->_statusLabels, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "edgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (unint64_t)verticalAlignment
{
  void *v2;
  unint64_t v3;

  -[NSArray firstObject](self->_statusLabels, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalAlignment");

  return v3;
}

- (void)setVerticalAlignment:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CCUIStatusLabelViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_statusLabels;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setVerticalAlignment:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)enqueueStatusUpdate:(id)a3 forIdentifier:(id)a4
{
  -[CCUIStatusUpdateQueue enqueueStatusUpdate:forIdentifier:](self->_updateQueue, "enqueueStatusUpdate:forIdentifier:", a3, a4);
  if (!self->_presentationState)
    -[CCUIStatusLabelViewController _advancePresentationState](self, "_advancePresentationState");
}

- (void)viewDidLoad
{
  CCUIStatusLabel *v3;
  CCUIStatusLabel *v4;
  NSArray *v5;
  NSArray *statusLabels;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CCUIStatusLabelViewController;
  -[CCUIStatusLabelViewController viewDidLoad](&v18, sel_viewDidLoad);
  v3 = objc_alloc_init(CCUIStatusLabel);
  v20[0] = v3;
  v4 = objc_alloc_init(CCUIStatusLabel);
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  statusLabels = self->_statusLabels;
  self->_statusLabels = v5;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_statusLabels;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[CCUIStatusLabelViewController view](self, "view", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubview:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

  -[CCUIStatusLabelViewController _resetPresentationStateAnimated:](self, "_resetPresentationStateAnimated:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUIStatusLabelViewController;
  -[CCUIStatusLabelViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[CCUIStatusLabelViewController _resetPresentationStateAnimated:](self, "_resetPresentationStateAnimated:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIStatusLabelViewController;
  -[CCUIStatusLabelViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CCUIStatusLabelViewController _resetPresentationStateAnimated:](self, "_resetPresentationStateAnimated:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_resetPresentationStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a3;
  -[CCUIStatusUpdateQueue removeAllStatusUpdates](self->_updateQueue, "removeAllStatusUpdates");
  -[NSTimer invalidate](self->_presentationTimer, "invalidate");
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke;
    v7[3] = &unk_1E8CFC3D0;
    v7[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_2;
    v6[3] = &unk_1E8CFCE28;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.3);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_4;
    v5[3] = &unk_1E8CFC3D0;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  }
  self->_presentationState = 0;
}

void __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 976);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_fadeOutStatusLabel:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_3;
  v11[3] = &unk_1E8CFC3D0;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.3);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 976);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setText:", 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
    }
    while (v4);
  }

}

uint64_t __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidFinishStatusUpdates");
}

uint64_t __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 976);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_fadeOutStatusLabel:", v7, (_QWORD)v9);
        objc_msgSend(v7, "setText:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidFinishStatusUpdates");
}

- (void)_advancePresentationState
{
  unint64_t v3;

  switch(self->_presentationState)
  {
    case 0uLL:
      v3 = -[CCUIStatusLabelViewController _advancePresentationStateFromReady](self, "_advancePresentationStateFromReady");
      goto LABEL_6;
    case 1uLL:
      v3 = -[CCUIStatusLabelViewController _advancePresentationStateFromFadeIn](self, "_advancePresentationStateFromFadeIn");
      goto LABEL_6;
    case 2uLL:
      v3 = -[CCUIStatusLabelViewController _advancePresentationStateFromPresenting](self, "_advancePresentationStateFromPresenting");
      goto LABEL_6;
    case 3uLL:
      v3 = -[CCUIStatusLabelViewController _advancePresentationStateFromFadeOut](self, "_advancePresentationStateFromFadeOut");
LABEL_6:
      self->_presentationState = v3;
      break;
    default:
      return;
  }
}

- (unint64_t)_advancePresentationStateFromReady
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id location;

  -[CCUIStatusUpdateQueue dequeueNextStatusUpdate](self->_updateQueue, "dequeueNextStatusUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self->_currentStatusLabelIndex + 1;
    self->_currentStatusLabelIndex = v4 % -[NSArray count](self->_statusLabels, "count");
    -[NSArray objectAtIndex:](self->_statusLabels, "objectAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);
    -[CCUIStatusLabelViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke;
    v16[3] = &unk_1E8CFC3D0;
    v16[4] = self;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_2;
    v13[3] = &unk_1E8CFCE78;
    objc_copyWeak(&v15, &location);
    v9 = v5;
    v14 = v9;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v16, v13, 0.3);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    v10 = 1;
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_5;
    v12[3] = &unk_1E8CFC3D0;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.3);
    v10 = 0;
  }

  return v10;
}

uint64_t __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateWillBeginStatusUpdates");
}

void __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_3;
    v8[3] = &unk_1E8CFCE50;
    v5 = (id *)(a1 + 40);
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v9 = *(id *)(a1 + 32);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_4;
    v6[3] = &unk_1E8CFCC60;
    objc_copyWeak(&v7, v5);
    objc_msgSend(v3, "animateWithDuration:animations:completion:", v8, v6, 0.3);
    objc_destroyWeak(&v7);

    objc_destroyWeak(&v10);
  }
}

void __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fadeInStatusLabel:", *(_QWORD *)(a1 + 32));

}

void __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_advancePresentationState");

  }
}

uint64_t __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidFinishStatusUpdates");
}

- (unint64_t)_advancePresentationStateFromFadeIn
{
  void *v3;
  NSTimer *v4;
  NSTimer *presentationTimer;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__CCUIStatusLabelViewController__advancePresentationStateFromFadeIn__block_invoke;
  v7[3] = &unk_1E8CFCEA0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 1.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  presentationTimer = self->_presentationTimer;
  self->_presentationTimer = v4;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return 2;
}

void __68__CCUIStatusLabelViewController__advancePresentationStateFromFadeIn__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[125];
    WeakRetained[125] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "_advancePresentationState");
    WeakRetained = v3;
  }

}

- (unint64_t)_advancePresentationStateFromPresenting
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  -[CCUIStatusUpdateQueue dequeueNextStatusUpdate](self->_updateQueue, "dequeueNextStatusUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_statusLabels, "objectAtIndex:", self->_currentStatusLabelIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = self->_currentStatusLabelIndex + 1;
    self->_currentStatusLabelIndex = v5 % -[NSArray count](self->_statusLabels, "count");
    -[NSArray objectAtIndex:](self->_statusLabels, "objectAtIndex:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[CCUIStatusLabelViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke;
    v24[3] = &unk_1E8CFCE50;
    objc_copyWeak(&v26, &location);
    v25 = v4;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_2;
    v21[3] = &unk_1E8CFCE78;
    objc_copyWeak(&v23, &location);
    v11 = v6;
    v22 = v11;
    objc_msgSend(v9, "animateWithDuration:animations:completion:", v24, v21, 0.3);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    v12 = 1;
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_5;
    v18[3] = &unk_1E8CFCE50;
    objc_copyWeak(&v20, &location);
    v19 = v4;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_6;
    v16[3] = &unk_1E8CFCC60;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v18, v16, 1.0);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    v12 = 3;
  }

  return v12;
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fadeOutStatusLabel:", *(_QWORD *)(a1 + 32));

}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_3;
    v8[3] = &unk_1E8CFCE50;
    v5 = (id *)(a1 + 40);
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v9 = *(id *)(a1 + 32);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_4;
    v6[3] = &unk_1E8CFCC60;
    objc_copyWeak(&v7, v5);
    objc_msgSend(v3, "animateWithDuration:animations:completion:", v8, v6, 0.3);
    objc_destroyWeak(&v7);

    objc_destroyWeak(&v10);
  }
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fadeInStatusLabel:", *(_QWORD *)(a1 + 32));

}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_advancePresentationState");

  }
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fadeOutStatusLabel:", *(_QWORD *)(a1 + 32));

}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_6(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_advancePresentationState");

  }
}

- (void)_fadeInStatusLabel:(id)a3
{
  objc_msgSend(a3, "setAlpha:", 1.0);
}

- (void)_fadeOutStatusLabel:(id)a3
{
  objc_msgSend(a3, "setAlpha:", 0.0);
}

- (void)_notifyDelegateWillBeginStatusUpdates
{
  CCUIStatusLabelViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "statusLabelViewControllerWillBeginStatusUpdates:", self);

  }
}

- (void)_notifyDelegateDidFinishStatusUpdates
{
  CCUIStatusLabelViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "statusLabelViewControllerDidFinishStatusUpdates:", self);

  }
}

- (CCUIStatusLabelViewControllerDelegate)delegate
{
  return (CCUIStatusLabelViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationTimer, 0);
  objc_storeStrong((id *)&self->_statusLabels, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end
