@implementation SFNanoDomainContainerView

+ (double)defaultTopOffset
{
  return 0.0;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (double)defaultHeightInsideQuickboard
{
  return 0.0;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (_SFBrowserView)browserView
{
  return (_SFBrowserView *)objc_loadWeakRetained((id *)&self->_browserView);
}

- (void)setBrowserView:(id)a3
{
  objc_storeWeak((id *)&self->_browserView, a3);
}

- (id)platterTapAction
{
  return self->_platterTapAction;
}

- (void)setPlatterTapAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_platterTapAction, 0);
  objc_destroyWeak((id *)&self->_browserView);
}

@end
