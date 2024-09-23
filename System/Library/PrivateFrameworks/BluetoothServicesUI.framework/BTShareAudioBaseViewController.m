@implementation BTShareAudioBaseViewController

- (void)viewWillAppear:(BOOL)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BTShareAudioBaseViewController;
  -[BTShareAudioBaseViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[BTShareAudioBaseViewController setTitle:](self, "setTitle:", 0);
  self->_viewActive = 1;
  v4 = -[BTShareAudioViewController flags](self->_mainController, "flags");
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_cardView, "setBackgroundColor:", v5);

  }
  if ((v4 & 1) != 0)
    -[UIView _setContinuousCornerRadius:](self->_cardView, "_setContinuousCornerRadius:", 0.0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__handleMenuButton_);
  objc_msgSend(v6, "setAllowedPressTypes:", &unk_24FD32B40);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  -[BTShareAudioBaseViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BTShareAudioBaseViewController;
  -[BTShareAudioBaseViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_viewActive = 0;
}

- (void)_handleMenuButton:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[BTShareAudioViewController reportUserCancelled](self->_mainController, "reportUserCancelled");

}

- (BTShareAudioViewController)mainController
{
  return self->_mainController;
}

- (void)setMainController:(id)a3
{
  objc_storeStrong((id *)&self->_mainController, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (BOOL)viewActive
{
  return self->_viewActive;
}

- (void)setViewActive:(BOOL)a3
{
  self->_viewActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mainController, 0);
}

@end
