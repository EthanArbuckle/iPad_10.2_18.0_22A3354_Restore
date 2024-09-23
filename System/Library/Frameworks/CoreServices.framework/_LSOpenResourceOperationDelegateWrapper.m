@implementation _LSOpenResourceOperationDelegateWrapper

- (_LSOpenResourceOperationDelegateWrapper)initWithOperation:(id)a3 wrappedDelegate:(id)a4
{
  id v6;
  id v7;
  _LSOpenResourceOperationDelegateWrapper *v8;
  _LSOpenResourceOperationDelegateWrapper *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_LSOpenResourceOperationDelegateWrapper;
  v8 = -[_LSOpenResourceOperationDelegateWrapper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_operation, v6);
    objc_storeStrong((id *)&v9->_delegate, a4);
  }

  return v9;
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    -[LSOpenResourceOperationDelegate openResourceOperation:didFinishCopyingResource:](self->_delegate, "openResourceOperation:didFinishCopyingResource:", WeakRetained, v6);

  }
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4;
  char v5;
  id WeakRetained;
  id v7;

  v4 = a3;
  if (self->_delegate)
  {
    v7 = v4;
    v5 = objc_opt_respondsToSelector();
    v4 = v7;
    if ((v5 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
      -[LSOpenResourceOperationDelegate openResourceOperationDidComplete:](self->_delegate, "openResourceOperationDidComplete:", WeakRetained);

      v4 = v7;
    }
  }

}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LSOpenResourceOperationDelegateWrapper openResourceOperation:didFailWithError:].cold.1();

    -[LSOpenResourceOperationDelegate openResourceOperation:didFailWithError:](self->_delegate, "openResourceOperation:didFailWithError:", WeakRetained, v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_operation);
}

- (void)openResourceOperation:didFailWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "LaunchServices: open operation %{public}@ failed with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
