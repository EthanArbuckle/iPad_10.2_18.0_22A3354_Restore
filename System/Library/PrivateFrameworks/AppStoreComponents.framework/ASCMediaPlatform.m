@implementation ASCMediaPlatform

- (ASCMediaPlatform)initWithDeviceCornerRadiusFactor:(id)a3
{
  id v4;
  ASCMediaPlatform *v5;
  uint64_t v6;
  NSNumber *deviceCornerRadiusFactor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCMediaPlatform;
  v5 = -[ASCMediaPlatform init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    deviceCornerRadiusFactor = v5->_deviceCornerRadiusFactor;
    v5->_deviceCornerRadiusFactor = (NSNumber *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMediaPlatform)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASCMediaPlatform *v6;
  uint64_t v7;
  NSNumber *deviceCornerRadiusFactor;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceCornerRadiusFactor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)ASCMediaPlatform;
  v6 = -[ASCMediaPlatform init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    deviceCornerRadiusFactor = v6->_deviceCornerRadiusFactor;
    v6->_deviceCornerRadiusFactor = (NSNumber *)v7;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceCornerRadiusFactor"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ASCMediaPlatform *v4;
  ASCMediaPlatform *v5;
  ASCMediaPlatform *v6;
  char v7;
  ASCMediaPlatform *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (ASCMediaPlatform *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      -[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCMediaPlatform deviceCornerRadiusFactor](v8, "deviceCornerRadiusFactor");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
        v7 = objc_msgSend(v9, "isEqual:", v10);
      else
        v7 = v9 == (void *)v10;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("deviceCornerRadiusFactor"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNumber)deviceCornerRadiusFactor
{
  return self->_deviceCornerRadiusFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCornerRadiusFactor, 0);
}

@end
