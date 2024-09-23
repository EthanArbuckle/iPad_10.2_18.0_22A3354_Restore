@implementation DCLongRunningTaskController

- (DCLongRunningTaskController)init
{
  return -[DCLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:](self, "initWithWindow:intervalBeforeOpeningProgressDialog:", sMainWindow, 1.0);
}

- (DCLongRunningTaskController)initWithWindow:(id)a3 intervalBeforeOpeningProgressDialog:(double)a4
{
  id v6;
  DCLongRunningTaskController *v7;
  DCLongRunningTaskController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DCLongRunningTaskController;
  v7 = -[DCLongRunningTaskController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[DCLongRunningTaskController setIntervalBeforeOpeningProgressDialog:](v7, "setIntervalBeforeOpeningProgressDialog:", a4);
    -[DCLongRunningTaskController setWindow:](v8, "setWindow:", v6);
  }

  return v8;
}

+ (void)setMainWindow:(id)a3
{
  objc_storeStrong((id *)&sMainWindow, a3);
}

- (void)startTask:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  double v14;
  dispatch_time_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD block[5];
  NSObject *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[DCLongRunningTaskController setKeepAlive:](self, "setKeepAlive:", self);
  -[DCLongRunningTaskController setCompletionBlock:](self, "setCompletionBlock:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1768]), "initWithParent:userInfo:", 0, 0);
  -[DCLongRunningTaskController setProgress:](self, "setProgress:", v8);

  -[DCLongRunningTaskController progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, DCLongRunningTaskControllerKVOContext);

  v10 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke;
  block[3] = &unk_24C5B7F90;
  v12 = v6;
  v21 = v12;
  block[4] = self;
  v13 = v10;
  v20 = v13;
  dispatch_async(v11, block);

  -[DCLongRunningTaskController intervalBeforeOpeningProgressDialog](self, "intervalBeforeOpeningProgressDialog");
  v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  if (dispatch_semaphore_wait(v13, v15))
  {
    -[DCLongRunningTaskController progress](self, "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "totalUnitCount");

    if (v17 != 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DCLongRunningTaskController setOpenProgressDate:](self, "setOpenProgressDate:", v18);

      -[DCLongRunningTaskController openProgressDialog](self, "openProgressDialog");
    }
  }

}

void __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke_2;
  block[3] = &unk_24C5B7AE0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTaskIfNecessary");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if ((void *)DCLongRunningTaskControllerKVOContext == a6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__DCLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24C5B7AE0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DCLongRunningTaskController;
    -[DCLongRunningTaskController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __78__DCLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProgress");
}

- (void)completeTaskIfNecessary
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  -[DCLongRunningTaskController completionBlock](self, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DCLongRunningTaskController completionBlock](self, "completionBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v4)[2](v4, -[DCLongRunningTaskController isCancelled](self, "isCancelled"));

    -[DCLongRunningTaskController setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
  -[DCLongRunningTaskController progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DCLongRunningTaskController openProgressDate](self, "openProgressDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DCLongRunningTaskController openProgressDate](self, "openProgressDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      if (v10 < 0.5)
        objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.5 - v10);
      -[DCLongRunningTaskController closeProgressDialog](self, "closeProgressDialog");
      -[DCLongRunningTaskController setOpenProgressDate:](self, "setOpenProgressDate:", 0);

    }
    -[DCLongRunningTaskController progress](self, "progress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));

    -[DCLongRunningTaskController setProgress:](self, "setProgress:", 0);
  }
  -[DCLongRunningTaskController setKeepAlive:](self, "setKeepAlive:", 0);
}

- (void)updateProgress
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  __CFString *v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint8_t buf[16];

  -[DCLongRunningTaskController progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalUnitCount");

  if (v4 >= 1)
  {
    -[DCLongRunningTaskController updateProgressUIBlock](self, "updateProgressUIBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[DCLongRunningTaskController progressToStringTransformer](self, "progressToStringTransformer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[DCLongRunningTaskController progress](self, "progress");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "completedUnitCount");

        if (v8 + 1 < v4)
          v9 = v8 + 1;
        else
          v9 = v4;
        -[DCLongRunningTaskController progressToStringTransformer](self, "progressToStringTransformer");
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v10[2](v10, v9, v4);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20CE8E000, v12, OS_LOG_TYPE_DEFAULT, "Progress string transformer not set", buf, 2u);
        }

        v11 = &stru_24C5B9710;
      }
      -[DCLongRunningTaskController updateProgressUIBlock](self, "updateProgressUIBlock");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[DCLongRunningTaskController progress](self, "progress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fractionCompleted");
      ((void (**)(_QWORD, __CFString *))v13)[2](v13, v11);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DCLongRunningTaskController lastAccessibilityAnnouncementDate](self, "lastAccessibilityAnnouncementDate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[DCLongRunningTaskController lastAccessibilityAnnouncementDate](self, "lastAccessibilityAnnouncementDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", v18);
        v20 = v19;

        if (v20 > 3.0)
        {
          -[DCLongRunningTaskController progress](self, "progress");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "fractionCompleted");
          v23 = (unint64_t)(v22 * 100.0);

          +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("%lu%% complete"), CFSTR("%lu%% complete"), CFSTR("Localizable"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v24, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          DCAccessibilityPostHighPriorityAnnouncementNotification(0, v25);
          -[DCLongRunningTaskController setLastAccessibilityAnnouncementDate:](self, "setLastAccessibilityAnnouncementDate:", v15);

        }
      }

    }
  }
}

- (void)openProgressDialog
{
  void *v3;
  DCProgressViewController *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  DCProgressViewController *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  DCProgressViewController *v26;
  _QWORD v27[4];
  id v28;
  id location;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DCProgressViewController initWithDelegate:]([DCProgressViewController alloc], "initWithDelegate:", self);
  -[DCLongRunningTaskController setProgressViewController:](self, "setProgressViewController:", v4);
  if (-[DCLongRunningTaskController shouldShowCircularProgress](self, "shouldShowCircularProgress"))
  {
    -[DCLongRunningTaskController progressViewController](self, "progressViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "view");

    -[DCLongRunningTaskController progress](self, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCLongRunningTaskController progressViewController](self, "progressViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObservedProgress:", v7);

  }
  v9 = -[DCLongRunningTaskController shouldShowCancelButton](self, "shouldShowCancelButton");
  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x24BDF67E8];
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __49__DCLongRunningTaskController_openProgressDialog__block_invoke;
    v27[3] = &unk_24C5B85F0;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAction:", v13);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __49__DCLongRunningTaskController_openProgressDialog__block_invoke_2;
  v25[3] = &unk_24C5B8618;
  v26 = v4;
  v14 = v4;
  -[DCLongRunningTaskController setUpdateProgressUIBlock:](self, "setUpdateProgressUIBlock:", v25);
  -[DCLongRunningTaskController progressViewController](self, "progressViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentViewController:", v15);

  -[DCLongRunningTaskController progressViewController](self, "progressViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "view");

  -[DCLongRunningTaskController updateProgress](self, "updateProgress");
  -[DCLongRunningTaskController setProgressViewControllerDidFinishPresenting:](self, "setProgressViewControllerDidFinishPresenting:", 0);
  -[DCLongRunningTaskController setShouldDismissProgressViewController:](self, "setShouldDismissProgressViewController:", 0);
  -[DCLongRunningTaskController viewControllerToPresentFrom](self, "viewControllerToPresentFrom");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    -[DCLongRunningTaskController window](self, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rootViewController");
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __49__DCLongRunningTaskController_openProgressDialog__block_invoke_3;
  v23[3] = &unk_24C5B7BF0;
  v23[4] = self;
  v24 = v20;
  v22 = v20;
  objc_msgSend(v22, "presentViewController:animated:completion:", v3, 1, v23);

}

void __49__DCLongRunningTaskController_openProgressDialog__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsCancelled:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "closeProgressDialog");

}

void __49__DCLongRunningTaskController_openProgressDialog__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

uint64_t __49__DCLongRunningTaskController_openProgressDialog__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setProgressViewControllerDidFinishPresenting:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldDismissProgressViewController");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShouldDismissProgressViewController:", 0);
    return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  }
  return result;
}

- (void)closeProgressDialog
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DCLongRunningTaskController progressViewController](self, "progressViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DCLongRunningTaskController progressViewController](self, "progressViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProgressDelegate:", 0);

    -[DCLongRunningTaskController progressViewController](self, "progressViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[DCLongRunningTaskController setProgressViewController:](self, "setProgressViewController:", 0);
    if (-[DCLongRunningTaskController progressViewControllerDidFinishPresenting](self, "progressViewControllerDidFinishPresenting"))
    {
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    else
    {
      -[DCLongRunningTaskController setShouldDismissProgressViewController:](self, "setShouldDismissProgressViewController:", 1);
    }

  }
}

- (void)willDismissProgressViewController:(id)a3
{
  id v3;

  -[DCLongRunningTaskController progress](self, "progress", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

- (id)progressToStringTransformer
{
  return self->_progressToStringTransformer;
}

- (void)setProgressToStringTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIViewController)viewControllerToPresentFrom
{
  return self->_viewControllerToPresentFrom;
}

- (void)setViewControllerToPresentFrom:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerToPresentFrom, a3);
}

- (BOOL)shouldShowCircularProgress
{
  return self->_shouldShowCircularProgress;
}

- (void)setShouldShowCircularProgress:(BOOL)a3
{
  self->_shouldShowCircularProgress = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (double)intervalBeforeOpeningProgressDialog
{
  return self->_intervalBeforeOpeningProgressDialog;
}

- (void)setIntervalBeforeOpeningProgressDialog:(double)a3
{
  self->_intervalBeforeOpeningProgressDialog = a3;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
  objc_storeStrong(&self->_keepAlive, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)updateProgressUIBlock
{
  return self->_updateProgressUIBlock;
}

- (void)setUpdateProgressUIBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSDate)lastAccessibilityAnnouncementDate
{
  return self->_lastAccessibilityAnnouncementDate;
}

- (void)setLastAccessibilityAnnouncementDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, a3);
}

- (NSDate)openProgressDate
{
  return self->_openProgressDate;
}

- (void)setOpenProgressDate:(id)a3
{
  objc_storeStrong((id *)&self->_openProgressDate, a3);
}

- (DCProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setProgressViewController:(id)a3
{
  objc_storeStrong((id *)&self->_progressViewController, a3);
}

- (BOOL)progressViewControllerDidFinishPresenting
{
  return self->_progressViewControllerDidFinishPresenting;
}

- (void)setProgressViewControllerDidFinishPresenting:(BOOL)a3
{
  self->_progressViewControllerDidFinishPresenting = a3;
}

- (BOOL)shouldDismissProgressViewController
{
  return self->_shouldDismissProgressViewController;
}

- (void)setShouldDismissProgressViewController:(BOOL)a3
{
  self->_shouldDismissProgressViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_openProgressDate, 0);
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_updateProgressUIBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_viewControllerToPresentFrom, 0);
  objc_storeStrong(&self->_progressToStringTransformer, 0);
}

@end
