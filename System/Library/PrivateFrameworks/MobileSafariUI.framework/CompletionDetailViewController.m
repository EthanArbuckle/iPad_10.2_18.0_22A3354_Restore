@implementation CompletionDetailViewController

- (CompletionDetailViewController)initWithRootViewController:(id)a3
{
  id v4;
  CompletionDetailViewController *v5;
  CompletionDetailViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  CompletionDetailViewController *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CompletionDetailViewController;
  v5 = -[CompletionDetailViewController initWithRootViewController:](&v12, sel_initWithRootViewController_, v4);
  v6 = v5;
  if (v5)
  {
    -[CompletionDetailViewController presentationController](v5, "presentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v6);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v6, sel__dismissCompletionDetailSheet);
    objc_msgSend(v4, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sf_setPreferredDismissOrDoneButtonItem:", v8);

    v10 = v6;
  }

  return v6;
}

- (void)_dismissCompletionDetailSheet
{
  _QWORD v3[4];
  id v4;
  id location;

  -[CompletionDetailViewController _willDismissCompletionDetailSheet](self, "_willDismissCompletionDetailSheet");
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__CompletionDetailViewController__dismissCompletionDetailSheet__block_invoke;
  v3[3] = &unk_1E9CF25A0;
  objc_copyWeak(&v4, &location);
  -[CompletionDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__CompletionDetailViewController__dismissCompletionDetailSheet__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_didDismissCompletionDetailSheet");
    WeakRetained = v2;
  }

}

- (void)_willDismissCompletionDetailSheet
{
  void *v3;
  void *v4;
  id v5;
  char isKindOfClass;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[CompletionDetailViewController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)get_MKPlaceViewControllerClass_softClass;
  v12 = get_MKPlaceViewControllerClass_softClass;
  if (!get_MKPlaceViewControllerClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __get_MKPlaceViewControllerClass_block_invoke;
    v8[3] = &unk_1E9CF1780;
    v8[4] = &v9;
    __get_MKPlaceViewControllerClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CompletionDetailViewController topViewController](self, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeCardWillCloseFromClientType:", 3);

  }
}

- (void)_didDismissCompletionDetailSheet
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_completionDetailViewControllerDelegate);
  objc_msgSend(WeakRetained, "completionDetailViewControllerDidDismiss:", self);

  +[UniversalSearchSession sharedSession](UniversalSearchSession, "sharedSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedbackDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C238]), "initWithEvent:", 4);
  objc_msgSend(v4, "postFeedback:forQueryID:", v5, objc_msgSend(MEMORY[0x1E0D8A860], "currentQueryID"));

}

- (CompletionDetailViewControllerDelegate)completionDetailViewControllerDelegate
{
  return (CompletionDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_completionDetailViewControllerDelegate);
}

- (void)setCompletionDetailViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_completionDetailViewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_completionDetailViewControllerDelegate);
  objc_storeStrong((id *)&self->_currentStoreSheet, 0);
}

@end
