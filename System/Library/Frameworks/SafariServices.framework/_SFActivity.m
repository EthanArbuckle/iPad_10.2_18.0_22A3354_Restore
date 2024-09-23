@implementation _SFActivity

- (void)activityDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFActivity;
  -[UIActivity activityDidFinish:](&v6, sel_activityDidFinish_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "safariActivity:didFinish:", self, v3);

}

- (_SFActivityDelegate)delegate
{
  return (_SFActivityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
