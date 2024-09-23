@implementation SUUIReviewsFacebookViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SUUIReviewsFacebookView likeToggleButton](self->_facebookView, "likeToggleButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 4095);

  v4.receiver = self;
  v4.super_class = (Class)SUUIReviewsFacebookViewController;
  -[SUUIReviewsFacebookViewController dealloc](&v4, sel_dealloc);
}

- (void)setFacebookLikeStatus:(id)a3
{
  SUUIFacebookLikeStatus *v4;
  SUUIFacebookLikeStatus *facebookLikeStatus;

  if (self->_facebookLikeStatus != a3)
  {
    v4 = (SUUIFacebookLikeStatus *)objc_msgSend(a3, "copy");
    facebookLikeStatus = self->_facebookLikeStatus;
    self->_facebookLikeStatus = v4;

    -[SUUIReviewsFacebookViewController _reloadFacebookView](self, "_reloadFacebookView");
  }
}

- (void)loadView
{
  SUUIReviewsFacebookView *facebookView;
  SUUIReviewsFacebookView *v4;
  SUUIReviewsFacebookView *v5;
  void *v6;

  facebookView = self->_facebookView;
  if (!facebookView)
  {
    v4 = -[SUUIReviewsFacebookView initWithClientContext:]([SUUIReviewsFacebookView alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_facebookView;
    self->_facebookView = v4;

    -[SUUIReviewsFacebookView likeToggleButton](self->_facebookView, "likeToggleButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__toggleLike_, 64);

    -[SUUIReviewsFacebookViewController _reloadFacebookView](self, "_reloadFacebookView");
    facebookView = self->_facebookView;
  }
  -[SUUIReviewsFacebookViewController setView:](self, "setView:", facebookView);
}

- (void)_toggleLike:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  char v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  BOOL v17;
  id location;

  v4 = a3;
  v5 = -[SUUIFacebookLikeStatus isUserLiked](self->_facebookLikeStatus, "isUserLiked");
  v6 = v5;
  v7 = !v5;
  -[SUUIReviewsFacebookViewController _changeStatusToUserLiked:](self, "_changeStatusToUserLiked:", v7);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke;
  aBlock[3] = &unk_2511F76E0;
  objc_copyWeak(&v16, &location);
  v17 = v7;
  v8 = _Block_copy(aBlock);
  v9 = SUUISocialFramework();
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("SLFacebookSession"), v9), "sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIFacebookLikeStatus URL](self->_facebookLikeStatus, "URL");
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlikeURL:completion:", v11, v8);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "likeURL:completion:", v11, v8);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "reviewsFacebookViewControllerDidChange:", self);

  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke_2;
    v3[3] = &unk_2511F76B8;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    v5 = *(_BYTE *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
    objc_destroyWeak(&v4);
  }
}

void __49__SUUIReviewsFacebookViewController__toggleLike___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_changeStatusToUserLiked:", *(_BYTE *)(a1 + 40) == 0);

}

- (void)_changeStatusToUserLiked:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)-[SUUIFacebookLikeStatus copy](self->_facebookLikeStatus, "copy");
  objc_msgSend(v5, "setUserLiked:", v3);
  -[SUUIReviewsFacebookViewController setFacebookLikeStatus:](self, "setFacebookLikeStatus:", v5);

}

- (void)_reloadFacebookView
{
  SUUIReviewsFacebookView *facebookView;
  void *v4;

  facebookView = self->_facebookView;
  -[SUUIFacebookLikeStatus friendNames](self->_facebookLikeStatus, "friendNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReviewsFacebookView setFriendNames:](facebookView, "setFriendNames:", v4);

  -[SUUIReviewsFacebookView setUserLiked:](self->_facebookView, "setUserLiked:", -[SUUIFacebookLikeStatus isUserLiked](self->_facebookLikeStatus, "isUserLiked"));
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIReviewsFacebookViewControllerDelegate)delegate
{
  return (SUUIReviewsFacebookViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIFacebookLikeStatus)facebookLikeStatus
{
  return self->_facebookLikeStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facebookView, 0);
  objc_storeStrong((id *)&self->_facebookLikeStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
