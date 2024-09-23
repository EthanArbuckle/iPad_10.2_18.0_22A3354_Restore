@implementation _TriggerEditorDelegateWrapper

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_TriggerEditorDelegateWrapper delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggerEditor:didFinishWithTriggerBuilder:", v7, v6);

}

- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[_TriggerEditorDelegateWrapper delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "triggerEditor:shouldCommitTriggerBuilder:", v7, v6);

  return v9;
}

- (void)triggerEditor:(id)a3 didCommitTriggerBuilder:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_TriggerEditorDelegateWrapper delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "triggerEditor:didCommitTriggerBuilder:withError:", v10, v9, v8);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[_TriggerEditorDelegateWrapper delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (HUTriggerEditorDelegate)delegate
{
  return (HUTriggerEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
