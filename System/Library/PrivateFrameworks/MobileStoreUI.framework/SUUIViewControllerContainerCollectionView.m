@implementation SUUIViewControllerContainerCollectionView

- (void)dealloc
{
  objc_super v3;

  -[SUUIViewControllerContainerCollectionView _endDynamicHysteresisIncrease](self, "_endDynamicHysteresisIncrease");
  v3.receiver = self;
  v3.super_class = (Class)SUUIViewControllerContainerCollectionView;
  -[SUUIViewControllerContainerCollectionView dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if ((void *)_SUUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext == a6)
  {
    -[SUUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer", a3, a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v7, "state") - 3) <= 2)
      -[SUUIViewControllerContainerCollectionView _endDynamicHysteresisIncrease](self, "_endDynamicHysteresisIncrease");

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUUIViewControllerContainerCollectionView;
    -[SUUIViewControllerContainerCollectionView observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  id v9;
  SUUIViewControllerContainerCollectionView *v10;
  SUUIViewControllerContainerCollectionView *v11;
  id v12;
  BOOL v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  -[SUUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    objc_msgSend(v8, "delegate");
    v10 = (SUUIViewControllerContainerCollectionView *)objc_claimAutoreleasedReturnValue();
    if (v10 != self)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        -[SUUIViewControllerContainerCollectionView panGestureRecognizer](v11, "panGestureRecognizer");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v8
          && _SUUIScrollViewIsCompetingWithScrollView(self, v11)
          && (_SUUIScrollViewWantsToBeginTrackingImmediately(v11) & 1) != 0)
        {
          -[SUUIViewControllerContainerCollectionView _beginDynamicHysteresisIncreaseWithCompetingScrollView:](self, "_beginDynamicHysteresisIncreaseWithCompetingScrollView:", v11);

          v13 = 1;
          goto LABEL_13;
        }

      }
    }

  }
  if (objc_msgSend((id)+[SUUIViewControllerContainerCollectionView superclass](SUUIViewControllerContainerCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v15.receiver = self;
    v15.super_class = (Class)SUUIViewControllerContainerCollectionView;
    v13 = -[SUUIViewControllerContainerCollectionView gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:](&v15, sel_gestureRecognizer_shouldBeRequiredToFailByGestureRecognizer_, v7, v8);
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  id v9;
  SUUIViewControllerContainerCollectionView *v10;
  SUUIViewControllerContainerCollectionView *v11;
  id v12;
  char v13;
  BOOL v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  -[SUUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v7)
    goto LABEL_10;
  objc_msgSend(v8, "delegate");
  v10 = (SUUIViewControllerContainerCollectionView *)objc_claimAutoreleasedReturnValue();
  if (v10 == self)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v11 = v10;
  -[SUUIViewControllerContainerCollectionView panGestureRecognizer](v11, "panGestureRecognizer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v8 || !_SUUIScrollViewIsCompetingWithScrollView(self, v11))
  {

LABEL_9:
    goto LABEL_10;
  }
  v13 = _SUUIScrollViewWantsToBeginTrackingImmediately(self);

  if ((v13 & 1) != 0)
  {
    v14 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if (objc_msgSend((id)+[SUUIViewControllerContainerCollectionView superclass](SUUIViewControllerContainerCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v16.receiver = self;
    v16.super_class = (Class)SUUIViewControllerContainerCollectionView;
    v14 = -[SUUIViewControllerContainerCollectionView gestureRecognizer:shouldRequireFailureOfGestureRecognizer:](&v16, sel_gestureRecognizer_shouldRequireFailureOfGestureRecognizer_, v7, v8);
  }
  else
  {
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (void)_beginDynamicHysteresisIncreaseWithCompetingScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  const __CFAllocator *v10;
  __CFRunLoop *Main;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = v4;
  if (!self->_forcingIncreasedPanGestureRecognizerHysteresis)
  {
    objc_msgSend(v4, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_hysteresis");
    self->_competingScrollViewPanGestureRecognizerHysteresis = v7;

    -[SUUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_hysteresis");
    self->_originalPanGestureRecognizerHysteresis = v9;
    objc_msgSend(v8, "_setHysteresis:", 88.0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 0, _SUUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext);
    self->_forcingIncreasedPanGestureRecognizerHysteresis = 1;
    objc_initWeak(&location, self);
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __100__SUUIViewControllerContainerCollectionView__beginDynamicHysteresisIncreaseWithCompetingScrollView___block_invoke;
    v12[3] = &unk_2511FD4B8;
    objc_copyWeak(&v13, &location);
    self->_runLoopObserver = CFRunLoopObserverCreateWithHandler(v10, 0x20uLL, 1u, 0, v12);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x24BEBE998]);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __100__SUUIViewControllerContainerCollectionView__beginDynamicHysteresisIncreaseWithCompetingScrollView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStateForDynamicHysteresisIncrease");

}

- (void)_endDynamicHysteresisIncrease
{
  __CFRunLoop *Main;
  id v4;

  if (self->_forcingIncreasedPanGestureRecognizerHysteresis)
  {
    self->_competingScrollViewPanGestureRecognizerHysteresis = 0.0;
    -[SUUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setHysteresis:", self->_originalPanGestureRecognizerHysteresis);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("state"), &_SUUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext);
    self->_originalPanGestureRecognizerHysteresis = 0.0;
    self->_forcingIncreasedPanGestureRecognizerHysteresis = 0;
    if (self->_runLoopObserver)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopRemoveObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
      CFRunLoopRemoveObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x24BEBE998]);
      CFRelease(self->_runLoopObserver);
      self->_runLoopObserver = 0;
    }

  }
}

- (void)_updateStateForDynamicHysteresisIncrease
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[SUUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "state"))
  {
    objc_msgSend(v7, "translationInView:", self);
    v4 = fabs(v3);
    v6 = fabs(v5);
    if (v6 > v4 && v6 > self->_competingScrollViewPanGestureRecognizerHysteresis)
      objc_msgSend(v7, "setState:", 5);
  }

}

@end
