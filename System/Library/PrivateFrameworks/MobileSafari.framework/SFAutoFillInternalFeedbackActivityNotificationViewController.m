@implementation SFAutoFillInternalFeedbackActivityNotificationViewController

- (SFAutoFillInternalFeedbackActivityNotificationViewController)initWithDiagnosticsData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SFAutoFillInternalFeedbackActivityNotificationViewController *v8;
  void *v9;
  void *v10;
  SFAutoFillInternalFeedbackActivityNotificationViewController *v11;
  objc_super v13;

  v5 = a3;
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SFAutoFillInternalFeedbackActivityNotificationViewController;
  v8 = -[SFActivityNotificationViewController initWithTitleText:messageText:](&v13, sel_initWithTitleText_messageText_, v6, v7);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_diagnosticsData, a3);
    createButton((uint64_t)CFSTR("hand.thumbsup"), v8, (uint64_t)sel__handleThumbsUp_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFActivityNotificationViewController setLeadingAccessoryView:](v8, "setLeadingAccessoryView:", v9);

    createButton((uint64_t)CFSTR("hand.thumbsdown"), v8, (uint64_t)sel__handleThumbsDown_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFActivityNotificationViewController setTrailingAccessoryView:](v8, "setTrailingAccessoryView:", v10);

    v11 = v8;
  }

  return v8;
}

- (void)_handleThumbsUp:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoFillInternalFeedbackActivityNotice:shouldPresentFeedbackForm:", self, 0);

}

- (void)_handleThumbsDown:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoFillInternalFeedbackActivityNotice:shouldPresentFeedbackForm:", self, 1);

}

- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData
{
  return self->_diagnosticsData;
}

- (SFAutoFillInternalFeedbackActivityNotificationViewControllerDelegate)delegate
{
  return (SFAutoFillInternalFeedbackActivityNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_diagnosticsData, 0);
}

@end
