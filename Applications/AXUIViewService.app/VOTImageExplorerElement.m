@implementation VOTImageExplorerElement

- (VOTImageExplorerElement)initWithImageView:(id)a3 forFeature:(id)a4 hasFlippedYAxis:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  VOTImageExplorerElement *v10;
  VOTImageExplorerElement *v11;
  objc_super v13;

  v5 = a5;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VOTImageExplorerElement;
  v10 = -[VOTImageExplorerElement initWithAccessibilityContainer:](&v13, "initWithAccessibilityContainer:", a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_feature, a4);
    -[VOTImageExplorerElement setFlippedYAxis:](v11, "setFlippedYAxis:", v5);
  }

  return v11;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeRemoteParentCustomActions
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
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
  double v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement accessibilityContainer](self, "accessibilityContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  objc_msgSend(v4, "normalizedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "frame");
  v14 = v13;
  v16 = v15;
  v17 = -[VOTImageExplorerElement flippedYAxis](self, "flippedYAxis");
  v18 = 1.0 - v8 - v12;
  if (!v17)
    v18 = v8;
  v19 = v16 * v18;

  v20 = UIAccessibilityFrameForBounds(v3, v6 * v14, v19, v10 * v14, v12 * v16);
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXMVisionFeature localizedStringForLocation:isSubjectImplicit:](AXMVisionFeature, "localizedStringForLocation:isSubjectImplicit:", objc_msgSend(v3, "locationUsingThirds:withFlippedYAxis:", 0, -[VOTImageExplorerElement flippedYAxis](self, "flippedYAxis")), 1));

  return v4;
}

- (AXMVisionFeature)feature
{
  return self->_feature;
}

- (BOOL)flippedYAxis
{
  return self->_flippedYAxis;
}

- (void)setFlippedYAxis:(BOOL)a3
{
  self->_flippedYAxis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
