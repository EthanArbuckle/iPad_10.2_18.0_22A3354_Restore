@implementation ARPersonDetectionResult

- (ARPersonDetectionResult)initWithBoundingBox:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  ARPersonDetectionResult *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)ARPersonDetectionResult;
  result = -[ARPersonDetectionResult init](&v8, sel_init);
  if (result)
  {
    result->_boundingBox.origin.x = x;
    result->_boundingBox.origin.y = y;
    result->_boundingBox.size.width = width;
    result->_boundingBox.size.height = height;
  }
  return result;
}

- (CGRect)rectScaledToSizeOfPixelBuffer:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
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

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  -[ARPersonDetectionResult boundingBox](self, "boundingBox");
  v8 = v7 * (double)Width;
  -[ARPersonDetectionResult boundingBox](self, "boundingBox");
  v10 = v9 * (double)Height;
  -[ARPersonDetectionResult boundingBox](self, "boundingBox");
  v12 = v11 * (double)Width;
  -[ARPersonDetectionResult boundingBox](self, "boundingBox");
  v14 = v13 * (double)Height;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGPoint origin;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
  {
    origin = self->_boundingBox.origin;
    *(CGSize *)((char *)result + 24) = self->_boundingBox.size;
    *(CGPoint *)((char *)result + 8) = origin;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeRect:forKey:", CFSTR("boundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
}

- (ARPersonDetectionResult)initWithCoder:(id)a3
{
  id v4;
  ARPersonDetectionResult *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARPersonDetectionResult;
  v5 = -[ARPersonDetectionResult init](&v7, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("boundingBox"));
    -[ARPersonDetectionResult setBoundingBox:](v5, "setBoundingBox:");
  }

  return v5;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

@end
