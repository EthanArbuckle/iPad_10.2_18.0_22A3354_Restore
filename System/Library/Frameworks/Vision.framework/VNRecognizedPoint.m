@implementation VNRecognizedPoint

- (VNRecognizedPoint)initWithLocation:(CGPoint)a3 confidence:(float)a4 identifier:(id)a5
{
  double y;
  double x;
  id v9;
  double v10;
  VNRecognizedPoint *v11;
  uint64_t v12;
  NSString *identifier;
  VNRecognizedPoint *v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VNRecognizedPoint;
  *(float *)&v10 = a4;
  v11 = -[VNDetectedPoint initWithLocation:confidence:](&v16, sel_initWithLocation_confidence_, x, y, v10);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedPoint;
  return -[NSString hash](self->_identifier, "hash") ^ __ROR8__(-[VNDetectedPoint hash](&v3, sel_hash), 51);
}

- (VNRecognizedPoint)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedPoint *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedPoint;
  v5 = -[VNDetectedPoint initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Iden"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedPoint;
  -[VNDetectedPoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("Iden"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedPoint;
  if (-[VNDetectedPoint isEqual:](&v8, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = self->_identifier;
    v6 = VisionCoreEqualOrNilObjects();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)transformedWith:(CGAffineTransform *)a3
{
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  double v13;
  void *v14;

  -[VNPoint location](self, "location");
  v7 = a3->tx + v5 * a3->c + a3->a * v6;
  v8 = a3->ty + v5 * a3->d + a3->b * v6;
  v9 = objc_alloc((Class)objc_opt_class());
  -[VNDetectedPoint confidence](self, "confidence");
  v11 = v10;
  -[VNRecognizedPoint identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = v11;
  v14 = (void *)objc_msgSend(v9, "initWithLocation:confidence:identifier:", v12, v7, v8, v13);

  return v14;
}

- (VNRecognizedPointKey)identifier
{
  return (VNRecognizedPointKey)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
