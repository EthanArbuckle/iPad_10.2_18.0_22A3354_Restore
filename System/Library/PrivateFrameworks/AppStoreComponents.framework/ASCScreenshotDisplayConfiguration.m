@implementation ASCScreenshotDisplayConfiguration

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceCornerRadiusFactor:", 0);
}

- (ASCScreenshotDisplayConfiguration)initWithDeviceCornerRadiusFactor:(id)a3
{
  id v4;
  ASCScreenshotDisplayConfiguration *v5;
  uint64_t v6;
  NSNumber *deviceCornerRadiusFactor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCScreenshotDisplayConfiguration;
  v5 = -[ASCScreenshotDisplayConfiguration init](&v9, sel_init);
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

- (ASCScreenshotDisplayConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASCScreenshotDisplayConfiguration *v6;
  uint64_t v7;
  NSNumber *deviceCornerRadiusFactor;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceCornerRadiusFactor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)ASCScreenshotDisplayConfiguration;
  v6 = -[ASCScreenshotDisplayConfiguration init](&v10, sel_init);
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
  -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceCornerRadiusFactor"));

}

- (BOOL)isEqual:(id)a3
{
  ASCScreenshotDisplayConfiguration *v4;
  ASCScreenshotDisplayConfiguration *v5;
  ASCScreenshotDisplayConfiguration *v6;
  char v7;
  ASCScreenshotDisplayConfiguration *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (ASCScreenshotDisplayConfiguration *)a3;
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
      -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](v8, "deviceCornerRadiusFactor");
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
  -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("deviceCornerRadiusFactor"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

+ (double)defaultCornerRadius
{
  return 5.0;
}

- (double)cornerRadiusForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double result;

  height = a3.height;
  width = a3.width;
  -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;
    if (width >= height)
      v10 = height;
    else
      v10 = width;
    v11 = v10 * v9;

    return v11;
  }
  else
  {
    +[ASCScreenshotDisplayConfiguration defaultCornerRadius](ASCScreenshotDisplayConfiguration, "defaultCornerRadius");
  }
  return result;
}

- (NSString)cornerCurve
{
  void *v2;
  id *v3;

  -[ASCScreenshotDisplayConfiguration deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (id *)MEMORY[0x1E0CD2A68];
  if (!v2)
    v3 = (id *)MEMORY[0x1E0CD2A60];
  return (NSString *)*v3;
}

- (unint64_t)maskedCorners
{
  return 15;
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
