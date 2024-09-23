@implementation _MKMapLayerHostingView

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKMapLayerHostingView;
  -[_MKMapLayerHostingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_MKMapLayerHostingView bounds](self, "bounds");
  -[VKMapView setFrame:](self->_mapView, "setFrame:");
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (_MKMapLayerHostingView)initWithFrame:(CGRect)a3
{
  _MKMapLayerHostingView *v3;
  _MKMapLayerHostingView *v4;
  void *v5;
  _MKMapLayerHostingView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKMapLayerHostingView;
  v3 = -[_MKMapLayerHostingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_MKMapLayerHostingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHostView:", v4);
    v6 = v4;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_MKMapLayerHostingView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHostView:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_MKMapLayerHostingView;
  -[_MKMapLayerHostingView dealloc](&v4, sel_dealloc);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKMapLayerHostingView;
  -[_MKMapLayerHostingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_MKMapLayerHostingView bounds](self, "bounds");
  -[VKMapView setFrame:](self->_mapView, "setFrame:");
}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
