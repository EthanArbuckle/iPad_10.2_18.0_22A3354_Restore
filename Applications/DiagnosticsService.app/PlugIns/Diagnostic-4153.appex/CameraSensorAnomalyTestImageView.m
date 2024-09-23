@implementation CameraSensorAnomalyTestImageView

- (DADrawableView)drawableView
{
  return self->_drawableView;
}

- (void)setDrawableView:(id)a3
{
  objc_storeStrong((id *)&self->_drawableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawableView, 0);
}

@end
