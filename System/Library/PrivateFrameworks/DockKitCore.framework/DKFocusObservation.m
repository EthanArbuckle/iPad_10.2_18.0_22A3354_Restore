@implementation DKFocusObservation

- (DKFocusObservation)initWithIdentifier:(int64_t)a3 rect:(CGRect)a4 userFocusStrong:(BOOL)a5 detectionType:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  DKFocusObservation *result;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)DKFocusObservation;
  result = -[DKFocusObservation init](&v14, sel_init);
  if (result)
  {
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
    result->_userFocusStrong = a5;
    result->_identifier = a3;
    result->_detectionType = a6;
  }
  return result;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (BOOL)userFocusStrong
{
  return self->_userFocusStrong;
}

- (void)setUserFocusStrong:(BOOL)a3
{
  self->_userFocusStrong = a3;
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(unint64_t)a3
{
  self->_detectionType = a3;
}

@end
