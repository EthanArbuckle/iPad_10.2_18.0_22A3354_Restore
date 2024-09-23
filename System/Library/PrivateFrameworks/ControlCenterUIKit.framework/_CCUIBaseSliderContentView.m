@implementation _CCUIBaseSliderContentView

- (void)didAddSubview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CCUIBaseSliderContentView;
  -[_CCUIBaseSliderContentView didAddSubview:](&v5, sel_didAddSubview_, a3);
  -[_CCUIBaseSliderContentView containingSliderView](self, "containingSliderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (CCUIBaseSliderView)containingSliderView
{
  return (CCUIBaseSliderView *)objc_loadWeakRetained((id *)&self->_containingSliderView);
}

- (void)setContainingSliderView:(id)a3
{
  objc_storeWeak((id *)&self->_containingSliderView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingSliderView);
}

@end
