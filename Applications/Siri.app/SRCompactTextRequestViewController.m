@implementation SRCompactTextRequestViewController

- (SRCompactTextRequestView)_textRequestView
{
  SRCompactTextRequestView *textRequestView;
  SRCompactTextRequestView *v4;
  SRCompactTextRequestView *v5;

  textRequestView = self->_textRequestView;
  if (!textRequestView)
  {
    v4 = objc_alloc_init(SRCompactTextRequestView);
    v5 = self->_textRequestView;
    self->_textRequestView = v4;

    -[SRCompactTextRequestView setDelegate:](self->_textRequestView, "setDelegate:", self);
    textRequestView = self->_textRequestView;
  }
  return textRequestView;
}

- (BOOL)allowsCancellation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController _textRequestView](self, "_textRequestView"));
  v3 = objc_msgSend(v2, "allowsCancellation");

  return v3;
}

- (void)setAllowsCancellation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController _textRequestView](self, "_textRequestView"));
  objc_msgSend(v4, "setAllowsCancellation:", v3);

}

- (void)loadView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController _textRequestView](self, "_textRequestView"));
  -[SRCompactTextRequestViewController setView:](self, "setView:", v3);

}

- (void)textRequestView:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate"));
  objc_msgSend(v6, "textRequestController:requestsKeyboardWithCompletion:", self, v5);

}

- (void)textRequestViewWillBeginEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "textRequestControllerWillBeginEditing:", self);

}

- (void)textRequestViewDidEndEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "textRequestControllerDidEndEditing:", self);

}

- (void)textRequestViewWillBeginTextEditMenuInteraction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "textRequestControllerWillBeginTextEditMenuInteraction:", self);

}

- (void)textRequestViewDidEndTextEditMenuInteraction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "textRequestControllerDidEndTextEditMenuInteraction:", self);

}

- (void)textRequestView:(id)a3 siriRequestCommittedWithText:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate"));
  objc_msgSend(v6, "textRequestController:siriRequestCommittedWithText:", self, v5);

}

- (void)textRequestView:(id)a3 didChangeTextFieldText:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "textRequestController:didChangeText:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate"));
    objc_msgSend(v7, "textRequestController:didChangeText:", self, v8);

  }
}

- (void)textRequestView:(id)a3 didEnableSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate", a3));
  v7 = objc_opt_respondsToSelector(v6, "textRequestController:didEnableSuggestions:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate"));
    objc_msgSend(v8, "textRequestController:didEnableSuggestions:", self, v4);

  }
}

- (void)textRequestViewRequestsVoiceActivation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "textRequestControllerRequestsVoiceActivation:", self);

}

- (SRCompactTextRequestViewControllerDelegate)delegate
{
  return (SRCompactTextRequestViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textRequestView, 0);
}

@end
