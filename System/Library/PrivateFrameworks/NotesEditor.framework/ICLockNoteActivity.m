@implementation ICLockNoteActivity

- (ICLockNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  ICLockNoteActivity *v8;
  uint64_t v9;
  ICNoteLockManager *lockManager;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICLockNoteActivity;
  v8 = -[ICActivity init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64CC8]), "initWithNote:", v6);
    lockManager = v8->_lockManager;
    v8->_lockManager = (ICNoteLockManager *)v9;

    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteLockManager setWindow:](v8->_lockManager, "setWindow:", v12);

    objc_storeWeak((id *)&v8->_presentingViewController, v7);
    -[ICLockNoteActivity presentingViewController](v8, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.presentingViewController.view.window) != nil)", "-[ICLockNoteActivity initWithNote:presentingViewController:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.presentingViewController.view.window");
  }

  return v8;
}

- (id)activityTitle
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[ICLockNoteActivity lockManager](self, "lockManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("Remove");
  else
    v7 = CFSTR("Lock");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D649D0];
}

- (id)activityImage
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  -[ICLockNoteActivity lockManager](self, "lockManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");
  v5 = CFSTR("lock.fill");
  if (v4)
    v5 = CFSTR("lock.slash.fill");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activityTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  dispatchMainAfterDelay();

}

void __52__ICLockNoteActivity_performActivityWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "lockManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__ICLockNoteActivity_performActivityWithCompletion___block_invoke_2;
  v3[3] = &unk_1EA7E0C30;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "toggleLockWithCompletionHandler:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__ICLockNoteActivity_performActivityWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "lockManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v18 = *(_QWORD *)(a1 + 32);
    if (!v18)
      return;
    v19 = objc_loadWeakRetained(v2);
    objc_msgSend(v19, "activityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v16);
    goto LABEL_6;
  }
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_viewControllerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "noteEditorViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventReporter");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v19, "pushContextPathDataWithContextPathEnum:", objc_msgSend(v10, "contextPathEnum"));

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "lockManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatedNote");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submitPasswordProtectEventForModernNote:", v13);

  objc_msgSend(v19, "popContextPathData");
  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "accessibilityAnnounceToggledLock");

  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
  {
    v16 = objc_loadWeakRetained(v2);
    objc_msgSend(v16, "activityType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, 1, v17);

LABEL_6:
  }

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[ICLockNoteActivity lockManager](self, "lockManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("Remove Lock");
  else
    v7 = CFSTR("Lock Note");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)accessibilityAnnounceToggledLock
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ICLockNoteActivity_accessibilityAnnounceToggledLock__block_invoke;
  block[3] = &unk_1EA7DD2D8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __54__ICLockNoteActivity_accessibilityAnnounceToggledLock__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "lockManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v4 & 1) != 0)
    v8 = CFSTR("Added lock to %@");
  else
    v8 = CFSTR("Removed lock from %@");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA7E9860, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lockManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatedNote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v9, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  ICAccessibilityPostAnnouncementNotification();
}

- (ICNoteLockManager)lockManager
{
  return self->_lockManager;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (int64_t)contextPath
{
  return self->_contextPath;
}

- (void)setContextPath:(int64_t)a3
{
  self->_contextPath = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_lockManager, 0);
}

@end
