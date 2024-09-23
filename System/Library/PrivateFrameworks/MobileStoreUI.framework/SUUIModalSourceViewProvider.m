@implementation SUUIModalSourceViewProvider

- (id)animationView
{
  void *v3;
  void *v4;

  -[SUUIModalSourceViewProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "animationViewForModalSourceViewProvider:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)hideOriginalSourceView
{
  self->_hideOriginalSourceView = 1;
  -[UIView setHidden:](self->_originalSourceView, "setHidden:", 1);
}

- (void)setOriginalSourceView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_originalSourceView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_originalSourceView, a3);
    -[UIView setHidden:](self->_originalSourceView, "setHidden:", self->_hideOriginalSourceView);
    v5 = v6;
  }

}

- (void)showOriginalSourceView
{
  self->_hideOriginalSourceView = 0;
  -[UIView setHidden:](self->_originalSourceView, "setHidden:", 0);
}

- (SUUIModalSourceViewProviderDelegate)delegate
{
  return (SUUIModalSourceViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)originalSourceView
{
  return self->_originalSourceView;
}

- (UIBarButtonItem)sourceButtonBarItem
{
  return self->_sourceButtonBarItem;
}

- (void)setSourceButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceButtonBarItem, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sourceButtonBarItem, 0);
  objc_storeStrong((id *)&self->_originalSourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
