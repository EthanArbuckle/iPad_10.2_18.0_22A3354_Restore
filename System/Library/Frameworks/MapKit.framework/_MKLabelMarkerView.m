@implementation _MKLabelMarkerView

+ (BOOL)_followsTerrain
{
  return 0;
}

- (_MKLabelMarkerView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  _MKLabelMarkerView *v4;
  _MKLabelMarkerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKLabelMarkerView;
  v4 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v7, sel_initWithAnnotation_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MKAnnotationView setBounds:](v4, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MKAnnotationView setCanShowCallout:](v5, "setCanShowCallout:", 1);
  }
  return v5;
}

- (BOOL)shouldShowCallout
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "suppressCallout") & 1) != 0 || (objc_msgSend(v3, "isRouteEta") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_MKLabelMarkerView;
    v4 = -[MKAnnotationView shouldShowCallout](&v6, sel_shouldShowCallout);
  }

  return v4;
}

- (void)_registerObserver
{
  id v3;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("leftCalloutAccessoryView"), 0, 0);
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("rightCalloutAccessoryView"), 0, 0);
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("detailCalloutAccessoryView"), 0, 0);

}

- (void)_deregisterObserver
{
  id v3;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("leftCalloutAccessoryView"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("rightCalloutAccessoryView"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("detailCalloutAccessoryView"));

}

- (void)setAnnotation:(id)a3
{
  MKAnnotation *v4;
  MKAnnotation *annotation;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MinX;
  double MaxX;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v4 = (MKAnnotation *)a3;
  annotation = self->super._annotation;
  if (annotation != v4)
  {
    if (annotation)
      -[_MKLabelMarkerView _deregisterObserver](self, "_deregisterObserver");
    v17.receiver = self;
    v17.super_class = (Class)_MKLabelMarkerView;
    -[MKAnnotationView setAnnotation:](&v17, sel_setAnnotation_, v4);
    -[MKAnnotationView annotation](self, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calloutAnchorRect");
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
    MidX = CGRectGetMidX(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    -[MKAnnotationView setCalloutOffset:](self, "setCalloutOffset:", MidX, CGRectGetMinY(v19));
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    MinX = CGRectGetMinX(v20);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    -[MKAnnotationView setLeftCalloutOffset:](self, "setLeftCalloutOffset:", MinX, CGRectGetMidY(v21));
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MaxX = CGRectGetMaxX(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    -[MKAnnotationView setRightCalloutOffset:](self, "setRightCalloutOffset:", MaxX, CGRectGetMidY(v23));
    objc_msgSend(v6, "leftCalloutAccessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setLeftCalloutAccessoryView:](self, "setLeftCalloutAccessoryView:", v14);

    objc_msgSend(v6, "rightCalloutAccessoryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setRightCalloutAccessoryView:](self, "setRightCalloutAccessoryView:", v15);

    objc_msgSend(v6, "detailCalloutAccessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setDetailCalloutAccessoryView:](self, "setDetailCalloutAccessoryView:", v16);

    -[MKAnnotationView setCanShowCallout:](self, "setCanShowCallout:", -[_MKLabelMarkerView shouldShowCallout](self, "shouldShowCallout"));
    -[_MKLabelMarkerView _registerObserver](self, "_registerObserver");

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_MKLabelMarkerView _deregisterObserver](self, "_deregisterObserver");
  v3.receiver = self;
  v3.super_class = (Class)_MKLabelMarkerView;
  -[MKAnnotationView dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MKAnnotationView annotation](self, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("leftCalloutAccessoryView")))
  {
    objc_msgSend(v7, "leftCalloutAccessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setLeftCalloutAccessoryView:](self, "setLeftCalloutAccessoryView:", v8);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("rightCalloutAccessoryView")))
  {
    objc_msgSend(v7, "rightCalloutAccessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setRightCalloutAccessoryView:](self, "setRightCalloutAccessoryView:", v8);
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("detailCalloutAccessoryView")))
  {
    objc_msgSend(v7, "detailCalloutAccessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView setDetailCalloutAccessoryView:](self, "setDetailCalloutAccessoryView:", v8);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_updateAnchorOffset
{
  id v3;
  CGRect v4;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calloutAnchorRect");
  -[MKAnnotationView setCalloutOffset:](self, "setCalloutOffset:", CGRectGetMidX(v4), -8.0);

}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  -[_MKLabelMarkerView _updateAnchorOffset](self, "_updateAnchorOffset");
  v6.receiver = self;
  v6.super_class = (Class)_MKLabelMarkerView;
  return -[MKAnnotationView updateCalloutViewIfNeededAnimated:](&v6, sel_updateCalloutViewIfNeededAnimated_, v3);
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
}

@end
