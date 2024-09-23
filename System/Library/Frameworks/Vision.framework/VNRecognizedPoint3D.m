@implementation VNRecognizedPoint3D

- (VNRecognizedPoint3D)initWithPosition:(double)a3 identifier:(double)a4
{
  id v8;
  VNRecognizedPoint3D *v9;
  uint64_t v10;
  NSString *identifier;
  VNRecognizedPoint3D *v12;
  objc_super v18;

  v8 = a7;
  v18.receiver = a1;
  v18.super_class = (Class)VNRecognizedPoint3D;
  v9 = -[VNPoint3D initWithPosition:](&v18, sel_initWithPosition_, a2, a3, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (VNRecognizedPoint3D)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedPoint3D *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedPoint3D;
  v5 = -[VNPoint3D initWithCoder:](&v9, sel_initWithCoder_, v4);
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

  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedPoint3D;
  v4 = a3;
  -[VNPoint3D encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("Iden"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedPoint3D;
  return -[NSString hash](self->_identifier, "hash") ^ __ROR8__(-[VNPoint3D hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedPoint3D;
  if (-[VNPoint3D isEqual:](&v8, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
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

- (id)description
{
  id v3;
  void *v4;
  objc_super v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6.receiver = self;
  v6.super_class = (Class)VNRecognizedPoint3D;
  -[VNPoint3D description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" idenfier =%@"), self->_identifier);
  return v3;
}

- (VNRecognizedPointKey)identifier
{
  return (VNRecognizedPointKey)objc_getProperty(self, a2, 80, 1);
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
