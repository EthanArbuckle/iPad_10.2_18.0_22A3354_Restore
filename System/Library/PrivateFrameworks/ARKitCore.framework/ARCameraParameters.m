@implementation ARCameraParameters

- (ARCameraParameters)initWithFocalLength:(CGPoint)a3 imageResolution:(CGSize)a4 principalPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  ARCameraParameters *result;
  objc_super v12;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  v9 = a3.y;
  v10 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)ARCameraParameters;
  result = -[ARCameraParameters init](&v12, sel_init);
  if (result)
  {
    result->_focalLength.x = v10;
    result->_focalLength.y = v9;
    result->_imageResolution.width = width;
    result->_imageResolution.height = height;
    result->_principalPoint.x = x;
    result->_principalPoint.y = y;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[ARCameraParameters imageResolution](self, "imageResolution");
    v4[1] = v5;
    v4[2] = v6;
    -[ARCameraParameters focalLength](self, "focalLength");
    v4[3] = v7;
    v4[4] = v8;
    -[ARCameraParameters principalPoint](self, "principalPoint");
    v4[5] = v9;
    v4[6] = v10;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  -[ARCameraParameters imageResolution](self, "imageResolution");
  *(float *)&v5 = v4;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("resolutionHeight"), v5);
  -[ARCameraParameters imageResolution](self, "imageResolution");
  *(float *)&v6 = v6;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("resolutionWidth"), v6);
  -[ARCameraParameters focalLength](self, "focalLength");
  *(float *)&v7 = v7;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("focalLengthX"), v7);
  -[ARCameraParameters focalLength](self, "focalLength");
  *(float *)&v9 = v8;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("focalLengthY"), v9);
  -[ARCameraParameters principalPoint](self, "principalPoint");
  *(float *)&v10 = v10;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("principalPointX"), v10);
  -[ARCameraParameters principalPoint](self, "principalPoint");
  *(float *)&v12 = v11;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("principalPointY"), v12);

}

- (ARCameraParameters)initWithCoder:(id)a3
{
  id v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  float v16;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("resolutionHeight"));
  v6 = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("resolutionWidth"));
  v8 = v7;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("focalLengthX"));
  v10 = v9;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("focalLengthY"));
  v12 = v11;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("principalPointX"));
  v14 = v13;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("principalPointY"));
  v16 = v15;

  return -[ARCameraParameters initWithFocalLength:imageResolution:principalPoint:](self, "initWithFocalLength:imageResolution:principalPoint:", v10, v12, v8, v6, v14, v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)focalLength
{
  double x;
  double y;
  CGPoint result;

  x = self->_focalLength.x;
  y = self->_focalLength.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)principalPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_principalPoint.x;
  y = self->_principalPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
