@implementation VNFgBgE5MLInstanceFeature

- (VNFgBgE5MLInstanceFeature)initWithQueryID:(int)a3 miyoshiConfidence:(float)a4 cocoConfidence:(float)a5 IoU:(float)a6 stabilityScore:(float)a7 miyoshiCategory:(int)a8 cocoCategory:(int)a9 miyoshiCategoryName:(id)a10 cocoCategoryName:(id)a11 bbox:(CGRect)a12 mapSize:(CGSize)a13 segmentation:(id)a14
{
  void *v14;
  void *v15;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v30;
  id v31;
  id v32;
  VNFgBgE5MLInstanceFeature *v33;
  VNFgBgE5MLInstanceFeature *v34;
  objc_super v36;

  v15 = v14;
  height = a12.size.height;
  width = a12.size.width;
  y = a12.origin.y;
  x = a12.origin.x;
  v30 = a10;
  v31 = a11;
  v32 = v15;
  v36.receiver = self;
  v36.super_class = (Class)VNFgBgE5MLInstanceFeature;
  v33 = -[VNFgBgE5MLInstanceFeature init](&v36, sel_init);
  v34 = v33;
  if (v33)
  {
    v33->_queryID = a3;
    v33->_miyoshiConfidence = a4;
    v33->_cocoConfidence = a5;
    v33->_IoU = a6;
    v33->_stabilityScore = a7;
    v33->_miyoshiCategory = a8;
    v33->_cocoCategory = a9;
    objc_storeStrong((id *)&v33->_miyoshiCategoryName, a10);
    objc_storeStrong((id *)&v34->_cocoCategoryName, a11);
    v34->_bbox.origin.x = x;
    v34->_bbox.origin.y = y;
    v34->_bbox.size.width = width;
    v34->_bbox.size.height = height;
    v34->_mapSize = a13;
    objc_storeStrong((id *)&v34->_segmentation, v15);
  }

  return v34;
}

- (int)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(int)a3
{
  self->_queryID = a3;
}

- (float)miyoshiConfidence
{
  return self->_miyoshiConfidence;
}

- (void)setMiyoshiConfidence:(float)a3
{
  self->_miyoshiConfidence = a3;
}

- (float)cocoConfidence
{
  return self->_cocoConfidence;
}

- (void)setCocoConfidence:(float)a3
{
  self->_cocoConfidence = a3;
}

- (float)IoU
{
  return self->_IoU;
}

- (void)setIoU:(float)a3
{
  self->_IoU = a3;
}

- (float)stabilityScore
{
  return self->_stabilityScore;
}

- (void)setStabilityScore:(float)a3
{
  self->_stabilityScore = a3;
}

- (int)miyoshiCategory
{
  return self->_miyoshiCategory;
}

- (void)setMiyoshiCategory:(int)a3
{
  self->_miyoshiCategory = a3;
}

- (int)cocoCategory
{
  return self->_cocoCategory;
}

- (void)setCocoCategory:(int)a3
{
  self->_cocoCategory = a3;
}

- (NSString)miyoshiCategoryName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMiyoshiCategoryName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)cocoCategoryName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCocoCategoryName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CGRect)bbox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bbox.origin.x;
  y = self->_bbox.origin.y;
  width = self->_bbox.size.width;
  height = self->_bbox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBbox:(CGRect)a3
{
  self->_bbox = a3;
}

- (CGSize)mapSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_mapSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMapSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_mapSize, &v3, 16, 1, 0);
}

- (NSArray)segmentation
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSegmentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentation, 0);
  objc_storeStrong((id *)&self->_cocoCategoryName, 0);
  objc_storeStrong((id *)&self->_miyoshiCategoryName, 0);
}

@end
