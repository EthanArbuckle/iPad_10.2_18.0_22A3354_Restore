@implementation IKJSDataSourceLoadIndexesRequest

- (IKJSDataSourceLoadIndexesRequest)initWithDataSource:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  IKJSDataSourceLoadIndexesRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend(v7, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)IKJSDataSourceLoadIndexesRequest;
  v9 = -[IKJSObject initWithAppContext:](&v14, sel_initWithAppContext_, v8);

  if (v9)
  {
    objc_storeWeak((id *)&v9->_dataSource, v7);
    v9->_range.location = location;
    v9->_range.length = length;
    -[IKJSObject appContext](v9, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "virtualMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addManagedReference:withOwner:", v7, v9);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[IKJSDataSourceLoadIndexesRequest cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)IKJSDataSourceLoadIndexesRequest;
  -[IKJSDataSourceLoadIndexesRequest dealloc](&v3, sel_dealloc);
}

- (JSValue)dataSource
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "exportValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (JSValue *)v3;
}

- (void)cancel
{
  void *v3;
  void (**v4)(id, _QWORD);

  if (!-[IKJSDataSourceLoadIndexesRequest isClosed](self, "isClosed"))
  {
    self->_state = 1;
    -[IKJSEventListenerObject invokeListeners:extraInfo:](self, "invokeListeners:extraInfo:", CFSTR("cancel"), 0);
    -[IKJSDataSourceLoadIndexesRequest completion](self, "completion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[IKJSDataSourceLoadIndexesRequest completion](self, "completion");
      v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0);

    }
  }
}

- (BOOL)isClosed
{
  return self->_state == 1;
}

- (void)close:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  if (!-[IKJSDataSourceLoadIndexesRequest isClosed](self, "isClosed"))
  {
    -[IKJSDataSourceLoadIndexesRequest completion](self, "completion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[IKJSDataSourceLoadIndexesRequest completion](self, "completion");
      v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
      v6[2](v6, v3);

    }
  }
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
