@implementation LUIKeyboardStateListener

+ (id)sharedInstance
{
  if (qword_100088DF8 != -1)
    dispatch_once(&qword_100088DF8, &stru_100069B50);
  return (id)qword_100088DF0;
}

- (LUIKeyboardStateListener)init
{
  LUIKeyboardStateListener *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIKeyboardStateListener;
  v2 = -[LUIKeyboardStateListener init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "willShow:", UIKeyboardWillShowNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "willHide:", UIKeyboardWillHideNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "didShow:", UIKeyboardDidShowNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "didHide:", UIKeyboardWillHideNotification, 0);

  }
  return v2;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (BOOL)isVisibleWithDelay:(double)a3
{
  return self->_isVisible;
}

- (void)willShow:(id)a3
{
  LUIKeyboardStateListenerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "keyboardWillShow:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "keyboardWillShow:", v10);

    }
  }

}

- (void)willHide:(id)a3
{
  LUIKeyboardStateListenerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "keyboardWillHide:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "keyboardWillHide:", v10);

    }
  }

}

- (void)didShow:(id)a3
{
  LUIKeyboardStateListenerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  self->_isVisible = 1;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "keyboardDidShow:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "keyboardDidShow:", v10);

    }
  }

}

- (void)didHide:(id)a3
{
  LUIKeyboardStateListenerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  self->_isVisible = 0;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "keyboardDidHide:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "keyboardDidHide:", v10);

    }
  }

}

- (LUIKeyboardStateListenerDelegate)delegate
{
  return (LUIKeyboardStateListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
