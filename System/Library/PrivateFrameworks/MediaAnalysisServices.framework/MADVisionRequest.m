@implementation MADVisionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVisionRequest)initWithVisionRequest:(id)a3 error:(id *)a4
{
  id v6;
  MADVisionRequest *v7;
  MADVisionRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MADVisionRequest;
  v7 = -[MADVisionRequest init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_visionRequest, a3);

  return v8;
}

+ (id)requestWithVisionRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVisionRequest:error:", v6, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADVisionRequest;
  -[MADRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("VisionRequestClassName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[VNRequest revision](self->_visionRequest, "revision"), CFSTR("VisionRequestRevision"));
}

- (MADVisionRequest)initWithCoder:(id)a3
{
  id v4;
  MADVisionRequest *v5;
  NSString *v6;
  VNRequest *v7;
  VNRequest *visionRequest;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MADVisionRequest;
  v5 = -[MADRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VisionRequestClassName"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = (VNRequest *)objc_alloc_init(NSClassFromString(v6));
    visionRequest = v5->_visionRequest;
    v5->_visionRequest = v7;

    -[VNRequest setRevision:](v5->_visionRequest, "setRevision:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VisionRequestRevision")));
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRequest description](self->_visionRequest, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (VNRequest)visionRequest
{
  return self->_visionRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionRequest, 0);
}

@end
