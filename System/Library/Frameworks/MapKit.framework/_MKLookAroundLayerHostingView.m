@implementation _MKLookAroundLayerHostingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_MKLookAroundLayerHostingView)initWithFrame:(CGRect)a3
{
  _MKLookAroundLayerHostingView *v3;
  _MKLookAroundLayerHostingView *v4;
  void *v5;
  _MKLookAroundLayerHostingView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKLookAroundLayerHostingView;
  v3 = -[_MKLookAroundLayerHostingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_MKLookAroundLayerHostingView layer](v3, "layer");
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

  -[_MKLookAroundLayerHostingView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHostView:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_MKLookAroundLayerHostingView;
  -[_MKLookAroundLayerHostingView dealloc](&v4, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKLookAroundLayerHostingView;
  -[_MKLookAroundLayerHostingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_MKLookAroundLayerHostingView bounds](self, "bounds");
  -[VKMapView setFrame:](self->_lookAroundView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKLookAroundLayerHostingView;
  -[_MKLookAroundLayerHostingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_MKLookAroundLayerHostingView bounds](self, "bounds");
  -[VKMapView setFrame:](self->_lookAroundView, "setFrame:");
}

- (VKMapView)lookAroundView
{
  return self->_lookAroundView;
}

- (void)setLookAroundView:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundView, 0);
}

@end
