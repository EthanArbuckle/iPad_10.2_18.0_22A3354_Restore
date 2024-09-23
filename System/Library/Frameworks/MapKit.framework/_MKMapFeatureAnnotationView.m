@implementation _MKMapFeatureAnnotationView

- (_MKMapFeatureAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  _MKMapFeatureAnnotationView *v4;
  _MKMapFeatureAnnotationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKMapFeatureAnnotationView;
  v4 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v7, sel_initWithAnnotation_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MKAnnotationView setBounds:](v4, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MKAnnotationView setCanShowCallout:](v5, "setCanShowCallout:", 0);
  }
  return v5;
}

- (BOOL)shouldShowCallout
{
  return 0;
}

- (CGPoint)_openInMapsAnchorPoint
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MaxY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[_MKMapFeatureAnnotationView _labelDisplayFrame](self, "_labelDisplayFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MaxY = CGRectGetMaxY(v11);
  v8 = MidX;
  result.y = MaxY;
  result.x = v8;
  return result;
}

- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double MidX;
  double MaxY;
  double v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double MaxX;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGPoint result;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[_MKMapFeatureAnnotationView _labelDisplayFrame](self, "_labelDisplayFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MKAnnotationView annotation](self, "annotation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  switch(a3)
  {
    case 1:
      v34.origin.x = v6;
      v34.origin.y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      MidX = CGRectGetMidX(v34);
      v35.origin.x = v6;
      v35.origin.y = v8;
      v35.size.width = v10;
      v35.size.height = v12;
      MaxY = CGRectGetMaxY(v35);
      goto LABEL_10;
    case 2:
      v36.origin.x = v6;
      v36.origin.y = v8;
      v36.size.width = v10;
      v36.size.height = v12;
      MidX = CGRectGetMidX(v36);
      v37.origin.x = v6;
      v37.origin.y = v8;
      v37.size.width = v10;
      v37.size.height = v12;
      MaxY = CGRectGetMinY(v37);
      goto LABEL_10;
    case 3:
      v18 = objc_msgSend(v13, "featureType");
      v19 = v6;
      v20 = v8;
      v21 = v10;
      v22 = v12;
      if (v18)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v19);
        goto LABEL_9;
      }
      v31 = CGRectGetMidX(*(CGRect *)&v19);
      v32 = 30.0;
      goto LABEL_14;
    case 4:
      v24 = objc_msgSend(v13, "featureType");
      v25 = v6;
      v26 = v8;
      v27 = v10;
      v28 = v12;
      if (v24)
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v25);
LABEL_9:
        MidX = MaxX;
        v38.origin.x = v6;
        v38.origin.y = v8;
        v38.size.width = v10;
        v38.size.height = v12;
        MaxY = CGRectGetMidY(v38);
LABEL_10:
        v17 = MaxY;
      }
      else
      {
        v31 = CGRectGetMidX(*(CGRect *)&v25);
        v32 = -30.0;
LABEL_14:
        MidX = v31 + v32;
        v39.origin.x = v6;
        v39.origin.y = v8;
        v39.size.width = v10;
        v39.size.height = v12;
        v17 = CGRectGetMinY(v39) + 32.0;
      }
LABEL_11:

      v29 = MidX;
      v30 = v17;
      result.y = v30;
      result.x = v29;
      return result;
    default:
      MidX = *MEMORY[0x1E0C9D538];
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      goto LABEL_11;
  }
}

- (CGRect)_frameForSelectionAdjustment
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[MKAnnotationView annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "marker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "screenBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_isProvidingVKLabelContents
{
  return 1;
}

- (CGRect)_labelDisplayFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[MKAnnotationView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "marker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKAnnotationView _mapView](self, "_mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenBounds");
  objc_msgSend(v5, "convertRect:toView:", self);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (unint64_t)_reasonToDeferSelectionAccessoryPresentationStyle:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "_style") | 2) == 3)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MKMapFeatureAnnotationView;
    v5 = -[MKAnnotationView _reasonToDeferSelectionAccessoryPresentationStyle:](&v7, sel__reasonToDeferSelectionAccessoryPresentationStyle_, v4);
  }

  return v5;
}

@end
