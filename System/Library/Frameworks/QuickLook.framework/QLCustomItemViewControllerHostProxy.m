@implementation QLCustomItemViewControllerHostProxy

- (void)presentShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[QLCustomItemViewControllerHostProxy delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentShareSheetWithPopoverTracker:customSharedURL:dismissCompletion:", v10, v9, v8);

}

- (void)setFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLCustomItemViewControllerHostProxy delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFullScreen:", v3);

}

- (void)dismissQuickLook
{
  id v2;

  -[QLCustomItemViewControllerHostProxy delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissQuickLook");

}

- (void)forwardMessageToHostOfCustomViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[QLCustomItemViewControllerHostProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forwardMessageToHostOfCustomViewController:completionHandler:", v7, v6);

}

- (QLCustomItemViewControllerHost)delegate
{
  return (QLCustomItemViewControllerHost *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
