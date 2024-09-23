@implementation SSSDittoDismissTimer

- (SSSDittoDismissTimer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSDittoDismissTimer;
  return -[SSSDittoDismissTimer init](&v3, "init");
}

- (id)_stateDescription
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = sub_10002C0EC(-[SSSDittoDismissTimer viewState](self, "viewState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("viewState: %@"), v5));
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" inDragAndDrop: %d"), -[SSSDittoDismissTimer inDragAndDrop](self, "inDragAndDrop")));
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" showingSharingUI: %d"), -[SSSDittoDismissTimer showingSharingUI](self, "showingSharingUI")));
  objc_msgSend(v3, "appendString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" showingWaitingForImageIdentifierUpdatesUI: %d"), -[SSSDittoDismissTimer showingWaitingForImageIdentifierUpdatesUI](self, "showingWaitingForImageIdentifierUpdatesUI")));
  objc_msgSend(v3, "appendString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" performingDismissAnimation: %d"), -[SSSDittoDismissTimer performingDismissAnimation](self, "performingDismissAnimation")));
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" userInterfaceHidden: %d"), -[SSSDittoDismissTimer userInterfaceHidden](self, "userInterfaceHidden")));
  objc_msgSend(v3, "appendString:", v11);

  return v3;
}

- (BOOL)_timerShouldBeRunning
{
  if (-[SSSDittoDismissTimer viewState](self, "viewState")
    || -[SSSDittoDismissTimer inDragAndDrop](self, "inDragAndDrop")
    || -[SSSDittoDismissTimer showingSharingUI](self, "showingSharingUI")
    || -[SSSDittoDismissTimer showingWaitingForImageIdentifierUpdatesUI](self, "showingWaitingForImageIdentifierUpdatesUI")|| -[SSSDittoDismissTimer performingDismissAnimation](self, "performingDismissAnimation"))
  {
    return 0;
  }
  else
  {
    return !-[SSSDittoDismissTimer userInterfaceHidden](self, "userInterfaceHidden");
  }
}

- (void)_significantTimerEventOccured
{
  unsigned int v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  NSTimer *currentTimer;
  uint64_t v8;
  NSTimer *v9;
  NSTimer *v10;
  NSTimer *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;

  v3 = -[SSSDittoDismissTimer _timerShouldBeRunning](self, "_timerShouldBeRunning");
  v4 = os_log_create("com.apple.screenshotservices", "DismissTimer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDismissTimer _stateDescription](self, "_stateDescription"));
    v12[0] = 67109378;
    v12[1] = v3;
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Moving timer to running %d with state %@", (uint8_t *)v12, 0x12u);

  }
  v6 = -[SSSDittoDismissTimer _timerShouldBeRunning](self, "_timerShouldBeRunning");
  -[NSTimer invalidate](self->_currentTimer, "invalidate");
  if (v6)
  {
    currentTimer = self->_currentTimer;
    self->_currentTimer = 0;

    v9 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_timerFired", 0, 0, UIAnimationDragCoefficient(v8) * 6.0);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue(v9);
    v11 = self->_currentTimer;
    self->_currentTimer = v10;

  }
}

- (void)_timerFired
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[NSTimer invalidate](self->_currentTimer, "invalidate");
  v3 = os_log_create("com.apple.screenshotservices", "DismissTimer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDismissTimer _stateDescription](self, "_stateDescription"));
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dismiss timer fired with state %@", (uint8_t *)&v6, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDismissTimer delegate](self, "delegate"));
  objc_msgSend(v5, "dittoDismissTimerFired:", self);

}

- (BOOL)timerIsRunning
{
  return -[NSTimer isValid](self->_currentTimer, "isValid");
}

- (void)setViewState:(unint64_t)a3
{
  if (self->_viewState != a3 || !self->_hasSetViewState)
  {
    self->_viewState = a3;
    -[SSSDittoDismissTimer _significantTimerEventOccured](self, "_significantTimerEventOccured");
  }
  self->_hasSetViewState = 1;
}

- (void)setInDragAndDrop:(BOOL)a3
{
  if (self->_inDragAndDrop != a3 || !self->_hasSetInDragAndDrop)
  {
    self->_inDragAndDrop = a3;
    -[SSSDittoDismissTimer _significantTimerEventOccured](self, "_significantTimerEventOccured");
  }
  self->_hasSetInDragAndDrop = 1;
}

- (void)setShowingSharingUI:(BOOL)a3
{
  if (self->_showingSharingUI != a3 || !self->_hasSetShowingSharingUI)
  {
    self->_showingSharingUI = a3;
    -[SSSDittoDismissTimer _significantTimerEventOccured](self, "_significantTimerEventOccured");
  }
  self->_hasSetShowingSharingUI = 1;
}

- (void)setShowingWaitingForImageIdentifierUpdatesUI:(BOOL)a3
{
  if (self->_showingWaitingForImageIdentifierUpdatesUI != a3 || !self->_hasSetShowingWaitingForImageIdentifierUpdatesUI)
  {
    self->_showingWaitingForImageIdentifierUpdatesUI = a3;
    -[SSSDittoDismissTimer _significantTimerEventOccured](self, "_significantTimerEventOccured");
  }
  self->_hasSetShowingWaitingForImageIdentifierUpdatesUI = 1;
}

- (void)setPerformingDismissAnimation:(BOOL)a3
{
  if (self->_performingDismissAnimation != a3 || !self->_hasSetPerformingDismissAnimation)
  {
    self->_performingDismissAnimation = a3;
    -[SSSDittoDismissTimer _significantTimerEventOccured](self, "_significantTimerEventOccured");
  }
  self->_hasSetPerformingDismissAnimation = 1;
}

- (void)setUserInterfaceHidden:(BOOL)a3
{
  if (self->_userInterfaceHidden != a3 || !self->_hasSetUserInterfaceHidden)
  {
    self->_userInterfaceHidden = a3;
    -[SSSDittoDismissTimer _significantTimerEventOccured](self, "_significantTimerEventOccured");
  }
  self->_hasSetUserInterfaceHidden = 0;
}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (BOOL)inDragAndDrop
{
  return self->_inDragAndDrop;
}

- (BOOL)showingSharingUI
{
  return self->_showingSharingUI;
}

- (BOOL)showingWaitingForImageIdentifierUpdatesUI
{
  return self->_showingWaitingForImageIdentifierUpdatesUI;
}

- (BOOL)performingDismissAnimation
{
  return self->_performingDismissAnimation;
}

- (BOOL)userInterfaceHidden
{
  return self->_userInterfaceHidden;
}

- (SSSDittoDismissTimerDelegate)delegate
{
  return (SSSDittoDismissTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTimer, 0);
}

@end
