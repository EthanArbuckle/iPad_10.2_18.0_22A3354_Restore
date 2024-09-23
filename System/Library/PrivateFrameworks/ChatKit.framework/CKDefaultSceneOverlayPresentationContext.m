@implementation CKDefaultSceneOverlayPresentationContext

- (CKDefaultSceneOverlayPresentationContext)initWithChatInputController:(id)a3 initialTraitCollection:(id)a4
{
  id v6;
  id v7;
  CKDefaultSceneOverlayPresentationContext *v8;
  CKDefaultSceneOverlayPresentationContext *v9;
  uint64_t v10;
  UIView *viewToPortal;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDefaultSceneOverlayPresentationContext;
  v8 = -[CKDefaultSceneOverlayPresentationContext init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_inputController, v6);
    v9->_presentationStyle = objc_msgSend(v6, "determineSendMenuPresentationStyleCompatibleWithTraitCollection:", v7);
    -[CKDefaultSceneOverlayPresentationContext _determineViewToPortal](v9, "_determineViewToPortal");
    v10 = objc_claimAutoreleasedReturnValue();
    viewToPortal = v9->_viewToPortal;
    v9->_viewToPortal = (UIView *)v10;

  }
  return v9;
}

- (UIView)anchorView
{
  void *v2;
  void *v3;
  void *v4;

  -[CKDefaultSceneOverlayPresentationContext inputController](self, "inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendMenuSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (CGRect)anchorRect
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CKDefaultSceneOverlayPresentationContext inputController](self, "inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendMenuSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_determineViewToPortal
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;

  if (self->_presentationStyle)
  {
    v2 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(WeakRetained, "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMenuSourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)willDismissSendMenuPresentation
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "setIsAppCardUsingPopoverPresentation:", 0);

  -[CKDefaultSceneOverlayPresentationContext _endSendMenuPresentation](self, "_endSendMenuPresentation");
}

- (void)_endSendMenuPresentation
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSendMenuPresentation");

}

- (void)didChangePopoverMetrics:(id)a3
{
  CKChatInputController **p_inputController;
  id v4;
  void *v5;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMenuPopoverMetricsDidChange:", v4);

}

- (void)appCardDidAppearInPopover
{
  void *v2;
  id v3;

  -[CKDefaultSceneOverlayPresentationContext inputController](self, "inputController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginSendMenuPopoverPresentation");

}

- (void)willPresentAppCard
{
  id WeakRetained;

  if (self->_presentationStyle == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(WeakRetained, "setIsAppCardUsingPopoverPresentation:", 1);

  }
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (UIView)viewToPortal
{
  return self->_viewToPortal;
}

- (CKChatInputController)inputController
{
  return (CKChatInputController *)objc_loadWeakRetained((id *)&self->_inputController);
}

- (void)setInputController:(id)a3
{
  objc_storeWeak((id *)&self->_inputController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputController);
  objc_storeStrong((id *)&self->_viewToPortal, 0);
}

@end
