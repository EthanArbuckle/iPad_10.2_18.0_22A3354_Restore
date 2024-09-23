@implementation AMSUICommonCollectionViewHandler

- (AMSUICommonCollectionViewHandler)initWithCollectionView:(id)a3
{
  id v4;
  AMSUICommonCollectionViewHandler *v5;
  AMSUICommonCollectionViewHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUICommonCollectionViewHandler;
  v5 = -[AMSUICommonCollectionViewHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_collectionView, v4);

  return v6;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonCollectionViewHandler collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didEndDisplayingItemAtIndexPath:", v9, v10);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonCollectionViewHandler collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView:didSelectItemAtIndexPath:", v8, v9);

  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonCollectionViewHandler collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "collectionView:shouldHighlightItemAtIndexPath:", v9, v5);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isDecelerating") & 1) != 0
    || (objc_msgSend(v8, "isDragging") & 1) != 0
    || objc_msgSend(v8, "isTracking"))
  {
    -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[AMSUICommonCollectionViewHandler delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUICommonCollectionViewHandler collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "collectionViewDidScroll:", v7);

    }
  }

}

- (AMSUICommonCollectionView)collectionView
{
  return (AMSUICommonCollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (AMSUICommonCollectionViewDelegate)delegate
{
  return (AMSUICommonCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
