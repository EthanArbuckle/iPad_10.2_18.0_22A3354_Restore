@implementation CSContentActionInterpreter

- (void)_viewControllerFromAction:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  int v8;
  UIViewController **p_digestOnboardingSuggestionViewController;
  void *v10;
  int v11;
  void *WeakRetained;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v13, "type") != 1)
    goto LABEL_7;
  objc_msgSend(v13, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAB120]);

  if (!v8)
  {
    objc_msgSend(v13, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DAB118]);

    if (v11)
    {
      p_digestOnboardingSuggestionViewController = &self->_digestOnboardingSuggestionViewController;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB7A8], 2, 0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, WeakRetained);
    goto LABEL_8;
  }
  p_digestOnboardingSuggestionViewController = &self->_nowPlayingViewController;
LABEL_6:
  WeakRetained = objc_loadWeakRetained((id *)p_digestOnboardingSuggestionViewController);
  ((void (**)(id, void *, void *))v6)[2](v6, WeakRetained, 0);
LABEL_8:

}

- (UIViewController)nowPlayingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_nowPlayingViewController);
}

- (void)setNowPlayingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_nowPlayingViewController, a3);
}

- (UIViewController)digestOnboardingSuggestionViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_digestOnboardingSuggestionViewController);
}

- (void)setDigestOnboardingSuggestionViewController:(id)a3
{
  objc_storeWeak((id *)&self->_digestOnboardingSuggestionViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_digestOnboardingSuggestionViewController);
  objc_destroyWeak((id *)&self->_nowPlayingViewController);
}

@end
