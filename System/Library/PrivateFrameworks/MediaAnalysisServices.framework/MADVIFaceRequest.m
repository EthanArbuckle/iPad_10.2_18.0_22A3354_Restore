@implementation MADVIFaceRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIFaceRequest)initWithCoder:(id)a3
{
  MADVIFaceRequest *v3;
  MADVIFaceRequest *v4;
  MADVIFaceRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MADVIFaceRequest;
  v3 = -[MADRequest initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVIFaceRequest;
  -[MADRequest encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

@end
