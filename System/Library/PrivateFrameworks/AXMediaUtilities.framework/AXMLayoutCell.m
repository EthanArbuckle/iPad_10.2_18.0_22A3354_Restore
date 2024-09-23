@implementation AXMLayoutCell

+ (id)sequence:(id)a3
{
  AXMVisionFeature *v3;
  AXMLayoutCell *v4;
  AXMVisionFeature *feature;

  v3 = (AXMVisionFeature *)a3;
  v4 = objc_alloc_init(AXMLayoutCell);
  feature = v4->_feature;
  v4->_feature = v3;

  return v4;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AXMVisionFeature frame](self->_feature, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)normalizedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AXMVisionFeature normalizedFrame](self->_feature, "normalizedFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)feature
{
  return self->_feature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
