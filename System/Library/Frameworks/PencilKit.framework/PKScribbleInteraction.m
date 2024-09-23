@implementation PKScribbleInteraction

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setElementSource:(id)a3
{
  objc_storeWeak((id *)&self->_elementSource, a3);
}

- (id)scribbleInteractionWrapper
{
  PKScribbleInteractionWrapper *cachedWrapper;
  PKScribbleInteractionWrapper *v4;
  PKScribbleInteractionWrapper *v5;

  cachedWrapper = self->_cachedWrapper;
  if (!cachedWrapper)
  {
    v4 = (PKScribbleInteractionWrapper *)-[PKScribbleInteractionWrapper initWithScribbleInteraction:]((id *)[PKScribbleInteractionWrapper alloc], self);
    v5 = self->_cachedWrapper;
    self->_cachedWrapper = v4;

    cachedWrapper = self->_cachedWrapper;
  }
  return cachedWrapper;
}

- (PKScribbleInteractionDelegate)delegate
{
  return (PKScribbleInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKScribbleInteractionElementSource)elementSource
{
  return (PKScribbleInteractionElementSource *)objc_loadWeakRetained((id *)&self->_elementSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_cachedWrapper, 0);
}

@end
