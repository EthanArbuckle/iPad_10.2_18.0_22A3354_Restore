@implementation EKLayoutContainerView

- (void)layoutSubviews
{
  id WeakRetained;
  char v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKLayoutContainerView;
  -[EKLayoutContainerView layoutSubviews](&v6, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "layoutContainerView:", self);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EKLayoutContainerViewDelegate)delegate
{
  return (EKLayoutContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
