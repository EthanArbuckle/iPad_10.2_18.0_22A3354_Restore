@implementation AFUITouchInputView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  -[AFUITouchInputView delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchesBeganForInputView:", self);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;

  -[AFUITouchInputView delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchesEndedForInputView:", self);

}

- (AFUITouchInputViewDelegate)delegate
{
  return (AFUITouchInputViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
