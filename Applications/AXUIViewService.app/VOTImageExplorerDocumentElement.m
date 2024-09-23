@implementation VOTImageExplorerDocumentElement

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  CGRect v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerDocumentElement accessibilityLabel](self, "accessibilityLabel"));
  -[VOTImageExplorerElement accessibilityFrame](self, "accessibilityFrame");
  v7 = NSStringFromCGRect(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, Label: %@, Frame: %@"), v5, v6, v8));

  return v9;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXMVisionFeature nameForOCRType:](AXMVisionFeature, "nameForOCRType:", objc_msgSend(v2, "ocrFeatureType")));

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityIdentifier
{
  return CFSTR("VOTImageExplorerDocumentElement");
}

@end
