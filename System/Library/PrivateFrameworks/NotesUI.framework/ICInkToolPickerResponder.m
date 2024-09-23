@implementation ICInkToolPickerResponder

- (BOOL)canBecomeFirstResponder
{
  return !-[ICInkToolPickerResponder preventFirstResponder](self, "preventFirstResponder");
}

- (id)inputAssistantItem
{
  void *v2;
  void *v3;
  void *v4;

  -[ICInkToolPickerResponder delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responderToMatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAssistantItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ICInkToolPickerResponderDelegate)delegate
{
  return (ICInkToolPickerResponderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)preventFirstResponder
{
  return self->_preventFirstResponder;
}

- (void)setPreventFirstResponder:(BOOL)a3
{
  self->_preventFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
