@implementation _MKLookAroundLayerHostingLayer

- (_MKLookAroundLayerHostingView)hostView
{
  return (_MKLookAroundLayerHostingView *)objc_loadWeakRetained((id *)&self->_hostView);
}

- (void)setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_hostView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostView);
}

@end
