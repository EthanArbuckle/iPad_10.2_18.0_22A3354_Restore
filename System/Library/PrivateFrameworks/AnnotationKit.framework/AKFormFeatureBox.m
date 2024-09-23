@implementation AKFormFeatureBox

+ (id)boxWithRect:(CGRect)a3 onPage:(id)a4 flags:(unint64_t)a5 baseline:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v14 = a4;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRect:onPage:flags:baseline:", v14, a5, v13, x, y, width, height);

  return v15;
}

- (AKFormFeatureBox)initWithRect:(CGRect)a3 onPage:(id)a4 flags:(unint64_t)a5 baseline:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  AKFormFeatureBox *v14;
  AKFormFeatureBox *v15;
  uint64_t v16;
  AKFormFeatureLine *baseline;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AKFormFeatureBox;
  v14 = -[AKFormFeature initWithRect:onPage:](&v19, sel_initWithRect_onPage_, a4, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_flags = a5;
    v14->_widthExpands = a5 & 1;
    v14->_multiline = (a5 & 2) != 0;
    v16 = objc_msgSend(v13, "copy");
    baseline = v15->_baseline;
    v15->_baseline = (AKFormFeatureLine *)v16;

    if ((a5 & 4) != 0 || (a5 & 8) == 0)
      v15->_alignment = 0;
    else
      v15->_alignment = 2;
  }

  return v15;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (BOOL)widthExpands
{
  return self->_widthExpands;
}

- (void)setWidthExpands:(BOOL)a3
{
  self->_widthExpands = a3;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseline, 0);
}

@end
