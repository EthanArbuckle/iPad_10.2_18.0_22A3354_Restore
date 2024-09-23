@implementation _MKAnnotationViewAnchor

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[MKAnnotationView _presentationCoordinate](self->_annotationView, "_presentationCoordinate");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (CGPoint)pointInLayer:(id)a3 bound:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[MKAnnotationView _staticMapView](self->_annotationView, "_staticMapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_MKAnnotationViewAnchor coordinate](self, "coordinate");
    objc_msgSend(v10, "convertCoordinate:toPointToView:", v10);
    v12 = v11;
    v14 = v13;
    if (v9)
    {
      objc_msgSend(v10, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertPoint:toLayer:", v9, v12, v14);
      v12 = v16;
      v14 = v17;

    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)_MKAnnotationViewAnchor;
    -[VKAnchorWrapper pointInLayer:bound:](&v22, sel_pointInLayer_bound_, v9, x, y, width, height);
    v12 = v18;
    v14 = v19;
  }

  v20 = v12;
  v21 = v14;
  result.y = v21;
  result.x = v20;
  return result;
}

- (double)pointOffsetForDistanceOffset:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CLLocationCoordinate2D v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v24;
  MKMapPoint v25;

  -[MKAnnotationView _staticMapView](self->_annotationView, "_staticMapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_MKAnnotationViewAnchor coordinate](self, "coordinate");
    v7 = v6;
    v9 = v8;
    v10 = MKMapRectMakeWithRadialDistance(v6, v8, a3);
    v25.x = v10 + v11;
    v25.y = v13 + v12 * 0.5;
    v14 = MKCoordinateForMapPoint(v25);
    objc_msgSend(v5, "convertCoordinate:toPointToView:", v5, v7, v9);
    v16 = v15;
    v18 = v17;
    objc_msgSend(v5, "convertCoordinate:toPointToView:", v5, v14.latitude, v14.longitude);
    v21 = sqrt((v20 - v18) * (v20 - v18) + (v19 - v16) * (v19 - v16));
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_MKAnnotationViewAnchor;
    -[VKAnchorWrapper pointOffsetForDistanceOffset:](&v24, sel_pointOffsetForDistanceOffset_, a3);
    v21 = v22;
  }

  return v21;
}

- (void)setAnnotationView:(id)a3
{
  self->_annotationView = (MKAnnotationView *)a3;
}

- (MKAnnotationView)annotationView
{
  return self->_annotationView;
}

@end
