@implementation VNSizeRange

- (VNSizeRange)initWithMinimumDimension:(unint64_t)a3 maximumDimension:(unint64_t)a4 idealDimension:(unint64_t)a5
{
  VNSizeRange *v8;
  VNSizeRange *v9;
  VNSizeRange *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNSizeRange;
  v8 = -[VNSizeRange init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_minimumDimension = a3;
    v8->_maximumDimension = a4;
    v8->_idealDimension = a5;
    v10 = v8;
  }

  return v9;
}

- (BOOL)isAllowedDimension:(unint64_t)a3
{
  return -[VNSizeRange minimumDimension](self, "minimumDimension") <= a3
      && -[VNSizeRange maximumDimension](self, "maximumDimension") >= a3;
}

- (unint64_t)hash
{
  return -[VNSizeRange idealDimension](self, "idealDimension") ^ __ROR8__(-[VNSizeRange maximumDimension](self, "maximumDimension") ^ __ROR8__(-[VNSizeRange minimumDimension](self, "minimumDimension"), 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNSizeRange *v4;
  VNSizeRange *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = (VNSizeRange *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNSizeRange minimumDimension](self, "minimumDimension");
      if (v6 == -[VNSizeRange minimumDimension](v5, "minimumDimension")
        && (v7 = -[VNSizeRange maximumDimension](self, "maximumDimension"),
            v7 == -[VNSizeRange maximumDimension](v5, "maximumDimension")))
      {
        v8 = -[VNSizeRange idealDimension](self, "idealDimension");
        v9 = v8 == -[VNSizeRange idealDimension](v5, "idealDimension");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minimumDimension, CFSTR("minDimension"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumDimension, CFSTR("maxDimension"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_idealDimension, CFSTR("idealDimension"));

}

- (VNSizeRange)initWithCoder:(id)a3
{
  id v4;
  VNSizeRange *v5;

  v4 = a3;
  v5 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:](self, "initWithMinimumDimension:maximumDimension:idealDimension:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minDimension")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxDimension")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("idealDimension")));

  return v5;
}

- (unint64_t)minimumDimension
{
  return self->_minimumDimension;
}

- (unint64_t)maximumDimension
{
  return self->_maximumDimension;
}

- (unint64_t)idealDimension
{
  return self->_idealDimension;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
