@implementation SUUICellLayout

- (SUUICellLayout)initWithCollectionViewCell:(id)a3
{
  id v4;
  SUUICellLayout *v5;
  SUUICellLayout *v6;
  void *v7;
  id WeakRetained;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUICellLayout;
  v5 = -[SUUICellLayout init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cell, v4);
    objc_msgSend(v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_contentView, v7);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_cell);
    v6->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;

  }
  return v6;
}

- (SUUICellLayout)initWithParentView:(id)a3
{
  id v4;
  SUUICellLayout *v5;
  SUUICellLayout *v6;
  id WeakRetained;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUICellLayout;
  v5 = -[SUUICellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cell, v4);
    objc_storeWeak((id *)&v6->_contentView, v4);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_cell);
    v6->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;

  }
  return v6;
}

- (SUUICellLayout)initWithTableViewCell:(id)a3
{
  id v4;
  SUUICellLayout *v5;
  SUUICellLayout *v6;
  void *v7;
  id WeakRetained;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUICellLayout;
  v5 = -[SUUICellLayout init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cell, v4);
    objc_msgSend(v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_contentView, v7);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_cell);
    v6->_parentWantsCellNeedsLayout = objc_opt_respondsToSelector() & 1;

  }
  return v6;
}

- (void)setNeedsLayout
{
  _BOOL4 parentWantsCellNeedsLayout;
  id WeakRetained;
  id v4;

  parentWantsCellNeedsLayout = self->_parentWantsCellNeedsLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v4 = WeakRetained;
  if (parentWantsCellNeedsLayout)
    objc_msgSend(WeakRetained, "setCellLayoutNeedsLayout");
  else
    objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (UIView)parentCellView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end
