@implementation SKStoreReviewPresentationWindow

- (double)windowLevel
{
  return *MEMORY[0x1E0DC5628];
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SKStoreReviewPresentationWindow _presentationViewController](self, "_presentationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__SKStoreReviewPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E5B26758;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v12);

}

uint64_t __77__SKStoreReviewPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (id)_presentationViewController
{
  void *v3;
  id v4;

  -[SKStoreReviewPresentationWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3478]);
    objc_msgSend(v4, "setSizesWindowToScene:", 1);
    -[SKStoreReviewPresentationWindow setRootViewController:](self, "setRootViewController:", v4);

  }
  return (id)-[SKStoreReviewPresentationWindow rootViewController](self, "rootViewController");
}

@end
