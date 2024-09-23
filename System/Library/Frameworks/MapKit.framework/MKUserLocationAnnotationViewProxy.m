@implementation MKUserLocationAnnotationViewProxy

- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_annotationView);
  objc_msgSend(WeakRetained, "_presentationCoordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)setPresentationCoordinate:(id)a3
{
  double var1;
  double var0;
  id v5;

  var1 = a3.var1;
  var0 = a3.var0;
  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPresentationCoordinate:", var0, var1);

}

- (double)presentationCourse
{
  void *v2;
  double v3;
  double v4;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentationCourse");
  v4 = v3;

  return v4;
}

- (void)setPresentationCourse:(double)a3
{
  id v4;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPresentationCourse:", a3);

}

- (double)presentationAccuracy
{
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "_mkUserLocationView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  objc_msgSend(v4, "presentationAccuracy");
  v6 = v5;

  return v6;
}

- (void)setPresentationAccuracy:(double)a3
{
  id v4;
  void *v5;
  id v6;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "_mkUserLocationView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  objc_msgSend(v5, "setPresentationAccuracy:", a3);
}

- (BOOL)isAnimatingAccuracy
{
  id v2;
  id v3;
  void *v4;
  char v5;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "_mkUserLocationView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  v5 = objc_msgSend(v4, "isAnimatingPresentationAccuracy");
  return v5;
}

- (void)setAnimatingAccuracy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "_mkUserLocationView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  objc_msgSend(v5, "setAnimatingPresentationAccuracy:", v3);
}

- (void)setAnimatingToCoordinate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAnimatingToCoordinate:", v3);

}

- (double)minimumAccuracy
{
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "_mkUserLocationView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  objc_msgSend(v4, "_minimumAccuracyUncertainty");
  v6 = v5;

  return v6;
}

- (BOOL)tracking
{
  void *v2;
  char v3;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isTracking");

  return v3;
}

- (void)setTracking:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTracking:", v3);

}

- (GEORouteMatch)routeMatch
{
  void *v2;
  void *v3;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_routeMatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEORouteMatch *)v3;
}

- (void)setRouteMatch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRouteMatch:", v4);

}

- (VKEdgeInsets)annotationTrackingEdgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  VKEdgeInsets result;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_annotationTrackingInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (CGSize)collisionSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[MKUserLocationAnnotationViewProxy annotationView](self, "annotationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_collisionFrame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (MKAnnotationView)annotationView
{
  return (MKAnnotationView *)objc_loadWeakRetained((id *)&self->_annotationView);
}

- (void)setAnnotationView:(id)a3
{
  objc_storeWeak((id *)&self->_annotationView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationView);
}

@end
