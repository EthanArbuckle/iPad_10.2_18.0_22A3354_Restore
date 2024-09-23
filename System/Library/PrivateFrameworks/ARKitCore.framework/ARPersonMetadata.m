@implementation ARPersonMetadata

- (ARPersonMetadata)initWithDepthBasedPersonDetectionResult:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;

  v4 = a3;
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "meanValue");
  v14 = v13;

  return -[ARPersonMetadata initWithBoundingBox:meanDepth:](self, "initWithBoundingBox:meanDepth:", v6, v8, v10, v12, v14);
}

- (ARPersonMetadata)initWithBoundingBox:(CGRect)a3 meanDepth:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  ARPersonMetadata *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)ARPersonMetadata;
  result = -[ARPersonMetadata init](&v10, sel_init);
  if (result)
  {
    result->_boundingBox.origin.y = y;
    result->_boundingBox.size.width = width;
    result->_boundingBox.size.height = height;
    result->_meanDepth = a4;
    result->_boundingBox.origin.x = x;
  }
  return result;
}

- (CGRect)rectScaledToSize:(CGSize)a3
{
  double height;
  double width;
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
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[ARPersonMetadata boundingBox](self, "boundingBox");
  v7 = width * v6;
  -[ARPersonMetadata boundingBox](self, "boundingBox");
  v9 = height * v8;
  -[ARPersonMetadata boundingBox](self, "boundingBox");
  v11 = width * v10;
  -[ARPersonMetadata boundingBox](self, "boundingBox");
  v13 = height * v12;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGSize size;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
  {
    size = self->_boundingBox.size;
    *((_OWORD *)result + 1) = self->_boundingBox.origin;
    *((CGSize *)result + 2) = size;
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_meanDepth;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float meanDepth;
  double v5;
  id v6;

  meanDepth = self->_meanDepth;
  v6 = a3;
  *(float *)&v5 = meanDepth;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("meanDepth"), v5);
  objc_msgSend(v6, "encodeRect:forKey:", CFSTR("boundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);

}

- (ARPersonMetadata)initWithCoder:(id)a3
{
  id v4;
  ARPersonMetadata *v5;
  float v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARPersonMetadata;
  v5 = -[ARPersonMetadata init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("meanDepth"));
    v5->_meanDepth = v6;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("boundingBox"));
    v5->_boundingBox.origin.x = v7;
    v5->_boundingBox.origin.y = v8;
    v5->_boundingBox.size.width = v9;
    v5->_boundingBox.size.height = v10;
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

- (double)meanDepth
{
  return self->_meanDepth;
}

@end
