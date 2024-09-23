@implementation _MKMapLayerHostingLayer

- (void)setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_hostView, a3);
}

- (_MKMapLayerHostingView)hostView
{
  return (_MKMapLayerHostingView *)objc_loadWeakRetained((id *)&self->_hostView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostView);
}

@end
