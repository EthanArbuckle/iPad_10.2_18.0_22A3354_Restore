@implementation IKJSDataSourceView

- (id)initForDataSource:(id)a3
{
  id v4;
  IKJSDataSourceView *v5;
  IKJSDataSourceView *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKJSDataSourceView;
  v5 = -[IKJSDataSourceView init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_dataSource, v4);
    objc_msgSend(v4, "addDataSourceView:", v6);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "removeDataSourceView:", self);

  v4.receiver = self;
  v4.super_class = (Class)IKJSDataSourceView;
  -[IKJSDataSourceView dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  IKJSDataSourceViewDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateFlags.hasDidReset = p_delegate & 1;
}

- (void)setUsedIndexRange:(_NSRange)a3
{
  id v4;

  if (self->_usedIndexRange.location != a3.location || self->_usedIndexRange.length != a3.length)
  {
    self->_usedIndexRange = a3;
    -[IKJSDataSourceView dataSource](self, "dataSource");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markDataSourceViewsUpdated");

  }
}

- (void)reset
{
  void *v3;
  id v4;

  self->_usedIndexRange.location = 0;
  self->_usedIndexRange.length = 0;
  -[IKJSDataSourceView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markDataSourceViewsUpdated");

  if (self->_delegateFlags.hasDidReset)
  {
    -[IKJSDataSourceView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didResetUsedIndexRangeForDataSourceView:", self);

  }
}

- (IKJSDataSource)dataSource
{
  return (IKJSDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (IKJSDataSourceViewDelegate)delegate
{
  return (IKJSDataSourceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_NSRange)usedIndexRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_usedIndexRange.length;
  location = self->_usedIndexRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
