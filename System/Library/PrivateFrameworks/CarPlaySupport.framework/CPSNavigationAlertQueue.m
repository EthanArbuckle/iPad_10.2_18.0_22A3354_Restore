@implementation CPSNavigationAlertQueue

- (CPSNavigationAlertQueue)initWithDelegate:(id)a3 applicationStateMonitor:(id)a4
{
  CPSNavigationAlertQueue *v4;
  CPSNavigationAlertQueue *v6;
  CPSNavigationAlertQueue *v8;
  id v9;
  id location[2];
  CPSNavigationAlertQueue *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8 = -[CPSNavigationAlertQueue init](v4, "init");
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v11->_currentAlert, 0);
    objc_storeWeak((id *)&v11->_delegate, location[0]);
    objc_storeWeak((id *)&v11->_applicationStateMonitor, v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (BOOL)isDisplayingAlert
{
  CPNavigationAlert *v2;
  BOOL v4;

  v2 = -[CPSNavigationAlertQueue currentAlert](self, "currentAlert");
  v4 = v2 != 0;

  return v4;
}

- (void)prepareNavigationAlert:(id)a3 templateDelegate:(id)a4 animated:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSTimer *v9;
  CPSNavigationAlertQueueDelegate *v10;
  CPSNavigationAlertView *v13;
  CPSNavigationAlertQueueDelegate *v14;
  char v15;
  id v16;
  BOOL v17;
  id v18;
  id location[2];
  CPSNavigationAlertQueue *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = a5;
  v13 = [CPSNavigationAlertView alloc];
  CGRectMake_3();
  v16 = -[CPSNavigationAlertView initWithFrame:navigationAlert:templateDelegate:buttonDelegate:](v13, "initWithFrame:navigationAlert:templateDelegate:buttonDelegate:", location[0], v18, v20, v5, v6, v7, v8);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSNavigationAlertView removeFromSuperview](v20->_currentAlertView, "removeFromSuperview");
  objc_storeStrong((id *)&v20->_currentAlert, location[0]);
  objc_storeStrong((id *)&v20->_currentAlertView, v16);
  objc_storeWeak((id *)&v20->_templateDelegate, v18);
  v14 = -[CPSNavigationAlertQueue delegate](v20, "delegate");
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v10 = -[CPSNavigationAlertQueue delegate](v20, "delegate");
    -[CPSNavigationAlertQueueDelegate navigationAlertQueue:shouldDisplayAlertView:animated:](v10, "navigationAlertQueue:shouldDisplayAlertView:animated:", v20, v16, v17);

  }
  v9 = -[CPSNavigationAlertQueue alertTimer](v20, "alertTimer");
  -[NSTimer invalidate](v9, "invalidate");

  -[CPSNavigationAlertQueue beginAnimatingAlertIfPossible](v20, "beginAnimatingAlertIfPossible");
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissCurrentNavigationAlertAnimated:(BOOL)a3 context:(unint64_t)a4 completion:(id)a5
{
  CPSNavigationAlertQueue *v5;
  CPSNavigationAlertView *v6;
  BOOL v7;
  unint64_t v8;
  CPSNavigationAlertQueueDelegate *v9;
  NSTimer *v10;
  CPSNavigationAlertQueueDelegate *v11;
  char v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CPSNavigationAlertQueue *v18;
  CPSNavigationAlertView *v19;
  id v20;
  CPSNavigationAlertView *v21;
  id location;
  unint64_t v23;
  BOOL v24;
  SEL v25;
  CPSNavigationAlertQueue *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v10 = -[CPSNavigationAlertQueue alertTimer](v26, "alertTimer");
  -[NSTimer invalidate](v10, "invalidate");

  v11 = -[CPSNavigationAlertQueue delegate](v26, "delegate");
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v21 = -[CPSNavigationAlertQueue currentAlertView](v26, "currentAlertView");
    v9 = -[CPSNavigationAlertQueue delegate](v26, "delegate");
    v5 = v26;
    v6 = v21;
    v7 = v24;
    v8 = v23;
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __84__CPSNavigationAlertQueue_dismissCurrentNavigationAlertAnimated_context_completion___block_invoke;
    v17 = &unk_24E2709A8;
    v20 = location;
    v18 = v26;
    v19 = v21;
    -[CPSNavigationAlertQueueDelegate navigationAlertQueue:shouldRemoveAlertView:animated:dismissalContext:completion:](v9, "navigationAlertQueue:shouldRemoveAlertView:animated:dismissalContext:completion:", v5, v6, v7, v8, &v13);

    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v21, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __84__CPSNavigationAlertQueue_dismissCurrentNavigationAlertAnimated_context_completion___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_clearAlertViewIfNecessaryForDismissedAlertView:", *(_QWORD *)(a1 + 40));
}

- (void)beginAnimatingAlertIfPossible
{
  if (-[CPSNavigationAlertQueue _canBeginAnimatingAlert](self, "_canBeginAnimatingAlert"))
    -[CPSNavigationAlertQueue _startAlertAnimations](self, "_startAlertAnimations");
}

- (BOOL)_canBeginAnimatingAlert
{
  CPNavigationAlert *v3;
  int v4;
  char v5;
  NSTimer *v6;
  char v7;
  CPSNavigationAlertQueueDelegate *v8;
  char v9;
  CPSApplicationStateMonitor *v10;

  v3 = -[CPSNavigationAlertQueue currentAlert](self, "currentAlert");
  v9 = 0;
  v7 = 0;
  v5 = 0;
  LOBYTE(v4) = 0;
  if (v3)
  {
    v10 = -[CPSNavigationAlertQueue applicationStateMonitor](self, "applicationStateMonitor");
    v9 = 1;
    LOBYTE(v4) = 0;
    if (-[CPSApplicationStateMonitor templateApplicationSceneIsActive](v10, "templateApplicationSceneIsActive"))
    {
      v8 = -[CPSNavigationAlertQueue delegate](self, "delegate");
      v7 = 1;
      LOBYTE(v4) = 0;
      if ((-[CPSNavigationAlertQueueDelegate canAnimateNavigationAlert](v8, "canAnimateNavigationAlert") & 1) != 0)
      {
        v6 = -[CPSNavigationAlertQueue alertTimer](self, "alertTimer");
        v5 = 1;
        v4 = !-[NSTimer isValid](v6, "isValid");
      }
    }
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if ((v9 & 1) != 0)

  return v4 & 1;
}

- (void)_startAlertAnimations
{
  double v2;
  NSTimer *v3;
  NSTimer *alertTimer;
  void *v5;
  CPNavigationAlert *v6;
  CPSNavigationAlertView *v7;
  CPNavigationAlert *v8;
  BOOL v9;

  v8 = -[CPSNavigationAlertQueue currentAlert](self, "currentAlert");
  -[CPNavigationAlert duration](v8, "duration");
  v9 = v2 <= 0.0;

  if (!v9)
  {
    v5 = (void *)MEMORY[0x24BDBCF40];
    v6 = -[CPSNavigationAlertQueue currentAlert](self, "currentAlert");
    -[CPNavigationAlert duration](v6, "duration");
    v3 = (NSTimer *)(id)objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__visibleAlertTimerFired_, 0, 0);
    alertTimer = self->_alertTimer;
    self->_alertTimer = v3;

    v7 = -[CPSNavigationAlertQueue currentAlertView](self, "currentAlertView");
    -[CPSNavigationAlertView startAnimating](v7, "startAnimating");

  }
}

- (void)_visibleAlertTimerFired:(id)a3
{
  CPSNavigationAlertQueue *v3;
  id v4;
  CPSNavigationAlertQueueDelegate *v5;
  CPSNavigationAlertQueueDelegate *v6;
  char v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CPSNavigationAlertQueue *v13;
  id v14;
  id v15;
  id location[2];
  CPSNavigationAlertQueue *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = -[CPSNavigationAlertQueue currentAlertView](v17, "currentAlertView");
  v6 = -[CPSNavigationAlertQueue delegate](v17, "delegate");
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSNavigationAlertQueue delegate](v17, "delegate");
    v3 = v17;
    v4 = v15;
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __51__CPSNavigationAlertQueue__visibleAlertTimerFired___block_invoke;
    v12 = &unk_24E26EF28;
    v13 = v17;
    v14 = v15;
    -[CPSNavigationAlertQueueDelegate navigationAlertQueue:shouldRemoveAlertView:animated:dismissalContext:completion:](v5, "navigationAlertQueue:shouldRemoveAlertView:animated:dismissalContext:completion:", v3, v4, 1, 0, &v8);

    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__CPSNavigationAlertQueue__visibleAlertTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearAlertViewIfNecessaryForDismissedAlertView:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)_clearAlertViewIfNecessaryForDismissedAlertView:(id)a3
{
  id location[2];
  CPSNavigationAlertQueue *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_currentAlertView == location[0])
  {
    objc_storeStrong((id *)&v4->_currentAlertView, 0);
    objc_storeStrong((id *)&v4->_currentAlert, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  CPNavigationAlert *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id obj;
  CPTemplateDelegate *v10;
  CPAlertAction *v11;
  CPNavigationAlert *v12;
  NSString *v13;
  CPAlertAction *v14;
  CPNavigationAlert *v15;
  char v16;
  CPAlertAction *v17;
  CPNavigationAlert *v18;
  NSString *v19;
  CPAlertAction *v20;
  CPNavigationAlert *v21;
  char v22;
  BOOL v23;
  id v24;
  os_log_type_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id location[2];
  CPSNavigationAlertQueue *v32;
  uint8_t v33[32];
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSNavigationAlertQueue currentAlert](v32, "currentAlert");
  v23 = v3 != 0;

  if (v23)
  {
    v4 = (void *)objc_opt_class();
    v29 = CPSSafeCast_15(v4, location[0]);
    v28 = (id)objc_msgSend(v29, "titleForState:", 0);
    v27 = 0;
    v21 = -[CPSNavigationAlertQueue currentAlert](v32, "currentAlert");
    v20 = -[CPNavigationAlert primaryAction](v21, "primaryAction");
    v19 = -[CPAlertAction title](v20, "title");
    v22 = objc_msgSend(v28, "isEqualToString:");

    if ((v22 & 1) != 0)
    {
      v18 = -[CPSNavigationAlertQueue currentAlert](v32, "currentAlert");
      v17 = -[CPNavigationAlert primaryAction](v18, "primaryAction");
      v5 = (id)-[CPAlertAction identifier](v17, "identifier");
      v6 = v27;
      v27 = v5;

    }
    else
    {
      v15 = -[CPSNavigationAlertQueue currentAlert](v32, "currentAlert");
      v14 = -[CPNavigationAlert secondaryAction](v15, "secondaryAction");
      v13 = -[CPAlertAction title](v14, "title");
      v16 = objc_msgSend(v28, "isEqualToString:");

      if ((v16 & 1) != 0)
      {
        v12 = -[CPSNavigationAlertQueue currentAlert](v32, "currentAlert");
        v11 = -[CPNavigationAlert secondaryAction](v12, "secondaryAction");
        v7 = (id)-[CPAlertAction identifier](v11, "identifier");
        v8 = v27;
        v27 = v7;

      }
      else
      {
        v26 = CarPlaySupportGeneralLogging();
        v25 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v32);
          _os_log_impl(&dword_21E389000, (os_log_t)v26, v25, "%@: dismissing alert with close button", v34, 0xCu);
        }
        objc_storeStrong(&v26, 0);
      }
    }
    if (v27)
    {
      v24 = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v33, (uint64_t)v32, (uint64_t)v27);
        _os_log_impl(&dword_21E389000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "%@: button selected with UUID: %@", v33, 0x16u);
      }
      objc_storeStrong(&v24, 0);
      v10 = -[CPSNavigationAlertQueue templateDelegate](v32, "templateDelegate");
      -[CPTemplateDelegate handleActionForControlIdentifier:](v10, "handleActionForControlIdentifier:", v27);

    }
    -[CPSNavigationAlertQueue dismissCurrentNavigationAlertAnimated:context:completion:](v32, "dismissCurrentNavigationAlertAnimated:context:completion:", 1, 1, 0);
    objc_storeStrong(&v27, obj);
    objc_storeStrong(&v28, obj);
    objc_storeStrong(&v29, obj);
    v30 = 0;
  }
  else
  {
    v30 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPSNavigationAlertQueue *v11;
  BOOL v12;
  id location[2];
  CPSNavigationAlertQueue *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __67__CPSNavigationAlertQueue_applicationStateMonitor_didBecomeActive___block_invoke;
  v10 = &unk_24E26F1B8;
  v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __67__CPSNavigationAlertQueue_applicationStateMonitor_didBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canBeginAnimatingAlert");
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_startAlertAnimations");
  return result;
}

- (CPSNavigationAlertQueueDelegate)delegate
{
  return (CPSNavigationAlertQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CPNavigationAlert)currentAlert
{
  return self->_currentAlert;
}

- (CPSNavigationAlertView)currentAlertView
{
  return self->_currentAlertView;
}

- (NSTimer)alertTimer
{
  return self->_alertTimer;
}

- (void)setAlertTimer:(id)a3
{
  objc_storeStrong((id *)&self->_alertTimer, a3);
}

- (CPTemplateDelegate)templateDelegate
{
  return (CPTemplateDelegate *)objc_loadWeakRetained((id *)&self->_templateDelegate);
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_templateDelegate, a3);
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  return (CPSApplicationStateMonitor *)objc_loadWeakRetained((id *)&self->_applicationStateMonitor);
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_applicationStateMonitor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationStateMonitor);
  objc_destroyWeak((id *)&self->_templateDelegate);
  objc_storeStrong((id *)&self->_alertTimer, 0);
  objc_storeStrong((id *)&self->_currentAlertView, 0);
  objc_storeStrong((id *)&self->_currentAlert, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
