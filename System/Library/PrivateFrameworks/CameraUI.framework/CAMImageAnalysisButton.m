@implementation CAMImageAnalysisButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAMImageAnalysisButton _setContextMenuDisplayed:](self, "_setContextMenuDisplayed:", 1);
  v11.receiver = self;
  v11.super_class = (Class)CAMImageAnalysisButton;
  -[CAMImageAnalysisButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v11, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v10, v9, v8);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAMImageAnalysisButton _setContextMenuDisplayed:](self, "_setContextMenuDisplayed:", 0);
  v11.receiver = self;
  v11.super_class = (Class)CAMImageAnalysisButton;
  -[CAMImageAnalysisButton contextMenuInteraction:willEndForConfiguration:animator:](&v11, sel_contextMenuInteraction_willEndForConfiguration_animator_, v10, v9, v8);

}

- (void)_setContextMenuDisplayed:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_contextMenuDisplayed != a3)
  {
    v3 = a3;
    self->_contextMenuDisplayed = a3;
    -[CAMImageAnalysisButton delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageAnalysisButton:didChangeContextMenuDisplayed:", self, v3);

  }
}

- (BOOL)isContextMenuDisplayed
{
  return self->_contextMenuDisplayed;
}

- (CAMImageAnalysisButtonDelegate)delegate
{
  return (CAMImageAnalysisButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
