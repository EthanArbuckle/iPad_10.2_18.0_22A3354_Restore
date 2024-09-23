@implementation AVContentOverlayView

- (void)didAddSubview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVContentOverlayView;
  -[AVContentOverlayView didAddSubview:](&v5, sel_didAddSubview_, a3);
  -[AVContentOverlayView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOverlayViewDidAddOrRemoveSubview:", self);

}

- (void)_didRemoveSubview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVContentOverlayView;
  -[AVContentOverlayView _didRemoveSubview:](&v5, sel__didRemoveSubview_, a3);
  -[AVContentOverlayView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOverlayViewDidAddOrRemoveSubview:", self);

}

- (AVContentOverlayViewDelegate)delegate
{
  return (AVContentOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
