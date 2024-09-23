@implementation SUUISettingsDocumentView

- (void)tintColorDidChange
{
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUISettingsDocumentView;
  -[SUUISettingsDocumentView tintColorDidChange](&v8, sel_tintColorDidChange);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "settingsDocumentViewDidChangeTintColor:", self);

    }
  }
}

- (SUUISettingsDocumentViewDelegate)delegate
{
  return (SUUISettingsDocumentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
