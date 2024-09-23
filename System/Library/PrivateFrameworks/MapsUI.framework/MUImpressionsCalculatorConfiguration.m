@implementation MUImpressionsCalculatorConfiguration

- (MUImpressionsCalculatorConfiguration)initWithLogger:(id)a3 contentScrollView:(id)a4 containerViewProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  MUImpressionsCalculatorConfiguration *v12;
  MUImpressionsCalculatorConfiguration *v13;
  void *v14;
  id containerViewProvider;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MUImpressionsCalculatorConfiguration;
  v12 = -[MUImpressionsCalculatorConfiguration init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_logger, a3);
    objc_storeWeak((id *)&v13->_scrollView, v10);
    v14 = _Block_copy(v11);
    containerViewProvider = v13->_containerViewProvider;
    v13->_containerViewProvider = v14;

  }
  return v13;
}

- (UIView)hostingContainerView
{
  UIView **p_cachedContainerView;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;

  p_cachedContainerView = &self->_cachedContainerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachedContainerView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_cachedContainerView);
  }
  else
  {
    (*((void (**)(void))self->_containerViewProvider + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_storeWeak((id *)p_cachedContainerView, v6);
      v5 = v6;
    }
    else
    {
      v8 = objc_loadWeakRetained((id *)&self->_scrollView);
      objc_msgSend(v8, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (UIView *)v5;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (MUImpressionsLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_cachedContainerView);
  objc_storeStrong(&self->_containerViewProvider, 0);
}

@end
