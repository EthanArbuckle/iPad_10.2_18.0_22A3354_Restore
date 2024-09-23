@implementation BWTrackedFace

- (_QWORD)initWithDetectionID:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)BWTrackedFace;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
  {
    v3[7] = a2;
    *((_DWORD *)v3 + 24) = 1095761920;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWTrackedFace;
  -[BWTrackedFace dealloc](&v3, sel_dealloc);
}

- (CGRect)detectionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_detectionRect.origin.x;
  y = self->_detectionRect.origin.y;
  width = self->_detectionRect.size.width;
  height = self->_detectionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDetectionRect:(CGRect)a3
{
  double height;
  float v4;
  float v5;

  self->_detectionRect = a3;
  if (a3.size.width <= a3.size.height)
    height = a3.size.height;
  else
    height = a3.size.width;
  v4 = height;
  v5 = self->_sizeToDistanceMultiplier / v4;
  self->_size = v4;
  self->_distance = v5;
}

- (float)trackingDistance
{
  return self->_trackingDistance;
}

- (void)setTrackingDistance:(float)a3
{
  float size;

  self->_trackingDistance = a3;
  self->_distance = a3;
  size = self->_size;
  if (size != 0.0)
    self->_sizeToDistanceMultiplier = size * a3;
}

- (id)trackingID
{
  return self->_trackingID;
}

- (void)setTrackingID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGRect)trackingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trackingRect.origin.x;
  y = self->_trackingRect.origin.y;
  width = self->_trackingRect.size.width;
  height = self->_trackingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTrackingRect:(CGRect)a3
{
  self->_trackingRect = a3;
}

- (id)detectionID
{
  return self->_detectionID;
}

- (float)size
{
  return self->_size;
}

- (float)distance
{
  return self->_distance;
}

@end
