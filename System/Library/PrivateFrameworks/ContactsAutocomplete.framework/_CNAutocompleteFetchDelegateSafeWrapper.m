@implementation _CNAutocompleteFetchDelegateSafeWrapper

- (_CNAutocompleteFetchDelegateSafeWrapper)initWithDelegate:(id)a3
{
  id v4;
  _CNAutocompleteFetchDelegateSafeWrapper *v5;
  _CNAutocompleteFetchDelegateSafeWrapper *v6;
  _CNAutocompleteFetchDelegateSafeWrapper *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CNAutocompleteFetchDelegateSafeWrapper;
  v5 = -[_CNAutocompleteFetchDelegateSafeWrapper init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6;
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "autocompleteFetch:didReceiveResults:", v11, v6);

  }
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v6;
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "autocompleteFetch:didFailWithError:", v11, v6);

  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "autocompleteFetchDidFinish:", v8);

  }
}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "autocompleteFetchDidBeginNetworkActivity:", v8);

  }
}

- (void)autocompleteFetchDidEndNetworkActivity:(id)a3
{
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "autocompleteFetchDidEndNetworkActivity:", v8);

  }
}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v13;
  id v14;
  char v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)p_delegate);
    v15 = objc_msgSend(v14, "autocompleteFetch:shouldExpectSupplementalResultsForRequest:completionHandler:", v8, v9, v10);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)autocompleteFetch:(id)a3 willAdjustResults:(id)a4
{
  id v6;
  id v7;
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint8_t v15[16];

  v6 = a3;
  v7 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    CNALoggingContextDebug();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Asking delegate to adjust results", v15, 2u);
    }

    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "autocompleteFetch:willAdjustResults:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

- (void)autocompleteFetch:(id)a3 willSortResults:(id)a4
{
  id v6;
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "autocompleteFetch:willSortResults:", v11, v6);

  }
}

- (id)resultComparatorForAutocompleteFetch:(id)a3
{
  id v4;
  CNAutocompleteFetchDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  v4 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "resultComparatorForAutocompleteFetch:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
