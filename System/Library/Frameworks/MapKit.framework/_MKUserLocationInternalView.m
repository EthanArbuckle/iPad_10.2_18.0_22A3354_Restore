@implementation _MKUserLocationInternalView

- (id)_mapView
{
  void *v2;
  void *v3;

  -[_MKUserLocationInternalView parentView](self, "parentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MKUserLocationView)parentView
{
  return (MKUserLocationView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (double)_pointsForDistance:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[_MKUserLocationInternalView parentView](self, "parentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_pointsForDistance:", a3);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_MKUserLocationInternalView;
    -[MKAnnotationView _pointsForDistance:](&v10, sel__pointsForDistance_, a3);
  }
  v8 = v7;

  return v8;
}

- (void)setParentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentView, a3);
}

- (id)_annotationContainer
{
  void *v2;
  void *v3;

  -[_MKUserLocationInternalView parentView](self, "parentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_annotationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_containerView
{
  void *v2;
  void *v3;

  -[_MKUserLocationInternalView parentView](self, "parentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);
}

@end
