@implementation AVTNotifyingContainerView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVTNotifyingContainerView frame](self, "frame");
  if (width == v9 && height == v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  }
  else
  {
    -[AVTNotifyingContainerView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notifyingContainerViewWillChangeSize:", width, height);

    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setFrame:](&v13, sel_setFrame_, x, y, width, height);
    -[AVTNotifyingContainerView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyingContainerViewDidChangeSize:", width, height);

  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVTNotifyingContainerView bounds](self, "bounds");
  if (width == v9 && height == v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  }
  else
  {
    -[AVTNotifyingContainerView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notifyingContainerViewWillChangeSize:", width, height);

    v13.receiver = self;
    v13.super_class = (Class)AVTNotifyingContainerView;
    -[AVTNotifyingContainerView setBounds:](&v13, sel_setBounds_, x, y, width, height);
    -[AVTNotifyingContainerView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyingContainerViewDidChangeSize:", width, height);

  }
}

- (AVTNotifyingContainerViewDelegate)delegate
{
  return (AVTNotifyingContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
