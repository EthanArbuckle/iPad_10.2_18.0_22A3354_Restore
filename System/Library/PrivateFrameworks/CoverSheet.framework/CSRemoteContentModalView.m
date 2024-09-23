@implementation CSRemoteContentModalView

- (CSRemoteContentModalView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CSRemoteContentModalView *v7;
  uint64_t v8;
  UIButton *backgroundDismissButton;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CSRemoteContentModalView;
  v7 = -[CSModalView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA3A0]), "initWithFrame:", x, y, width, height);
    backgroundDismissButton = v7->_backgroundDismissButton;
    v7->_backgroundDismissButton = (UIButton *)v8;

    -[CSRemoteContentModalView addSubview:](v7, "addSubview:", v7->_backgroundDismissButton);
    -[CSRemoteContentModalView sendSubviewToBack:](v7, "sendSubviewToBack:", v7->_backgroundDismissButton);
  }
  return v7;
}

- (void)setTouchDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      -[UIButton removeTarget:action:forControlEvents:](self->_backgroundDismissButton, "removeTarget:action:forControlEvents:", WeakRetained, sel_didReceiveTouch, 64);
    objc_storeWeak((id *)&self->_touchDelegate, obj);
    -[UIButton addTarget:action:forControlEvents:](self->_backgroundDismissButton, "addTarget:action:forControlEvents:", obj, sel_didReceiveTouch, 64);
  }

}

- (CSRemoteModalContentViewTouchDelegate)touchDelegate
{
  return (CSRemoteModalContentViewTouchDelegate *)objc_loadWeakRetained((id *)&self->_touchDelegate);
}

- (UIButton)backgroundDismissButton
{
  return self->_backgroundDismissButton;
}

- (void)setBackgroundDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDismissButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDismissButton, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
}

@end
