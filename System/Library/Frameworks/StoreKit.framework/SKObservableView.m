@implementation SKObservableView

- (void)setAlpha:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKObservableView;
  -[SKObservableView setAlpha:](&v10, sel_setAlpha_);
  -[SKObservableView delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[SKObservableView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[SKObservableView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didChangeAlpha:", a3);

    }
  }
}

- (void)setHidden:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKObservableView;
  -[SKObservableView setHidden:](&v9, sel_setHidden_, a3);
  -[SKObservableView delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SKObservableView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SKObservableView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didChangeHidden");

    }
  }
}

- (SKObservableViewDelegate)delegate
{
  return (SKObservableViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
