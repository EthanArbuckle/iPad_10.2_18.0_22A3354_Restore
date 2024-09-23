@implementation SUUIOverlayFlipTransition

- (UIView)flipSourceView
{
  return self->_flipSourceView;
}

- (void)setFlipSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_flipSourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipSourceView, 0);
}

@end
