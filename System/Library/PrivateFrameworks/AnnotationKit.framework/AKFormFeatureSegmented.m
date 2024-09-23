@implementation AKFormFeatureSegmented

+ (id)segments:(id)a3 withEnclosingRect:(CGRect)a4 baseline:(id)a5 onPage:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCharacterSegments:enclosingRect:baseline:onPage:", v15, v14, v13, x, y, width, height);

  return v16;
}

- (AKFormFeatureSegmented)initWithCharacterSegments:(id)a3 enclosingRect:(CGRect)a4 baseline:(id)a5 onPage:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  AKFormFeatureSegmented *v16;
  AKFormFeatureSegmented *v17;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AKFormFeatureSegmented;
  v16 = -[AKFormFeature initWithRect:onPage:](&v19, sel_initWithRect_onPage_, a6, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_characterSegmentRects, a3);
    v17->_enclosingRegionRect.origin.x = x;
    v17->_enclosingRegionRect.origin.y = y;
    v17->_enclosingRegionRect.size.width = width;
    v17->_enclosingRegionRect.size.height = height;
    objc_storeStrong((id *)&v17->_baseline, a5);
  }

  return v17;
}

- (AKFormFeatureLine)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_baseline, a3);
}

- (CGRect)enclosingRegionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_enclosingRegionRect.origin.x;
  y = self->_enclosingRegionRect.origin.y;
  width = self->_enclosingRegionRect.size.width;
  height = self->_enclosingRegionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEnclosingRegionRect:(CGRect)a3
{
  self->_enclosingRegionRect = a3;
}

- (NSArray)characterSegmentRects
{
  return self->_characterSegmentRects;
}

- (void)setCharacterSegmentRects:(id)a3
{
  objc_storeStrong((id *)&self->_characterSegmentRects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSegmentRects, 0);
  objc_storeStrong((id *)&self->_baseline, 0);
}

@end
