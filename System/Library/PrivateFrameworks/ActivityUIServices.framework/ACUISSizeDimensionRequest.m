@implementation ACUISSizeDimensionRequest

+ (id)new
{
  return 0;
}

- (ACUISSizeDimensionRequest)init
{

  return 0;
}

- (ACUISSizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5
{
  ACUISSizeDimensionRequest *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACUISSizeDimensionRequest;
  result = -[ACUISSizeDimensionRequest init](&v9, sel_init);
  if (result)
  {
    result->_minimum = a3;
    result->_maximum = a4;
    result->_type = a5;
  }
  return result;
}

- (ACUISSizeDimensionRequest)initWithDimensionRequest:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "minimum");
  v6 = v5;
  objc_msgSend(v4, "maximum");
  v8 = v7;
  v9 = objc_msgSend(v4, "type");

  return -[ACUISSizeDimensionRequest initWithMinimum:maximum:type:](self, "initWithMinimum:maximum:type:", -[ACUISSizeDimensionRequest objcTypeFromSwift:](self, "objcTypeFromSwift:", v9), v6, v8);
}

- (ACUISSizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4
{
  return -[ACUISSizeDimensionRequest initWithMinimum:maximum:type:](self, "initWithMinimum:maximum:type:", 1, a3, a4);
}

+ (id)fixed:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMinimum:maximum:type:", 0, a3, a3);
}

- (BOOL)isEqual:(id)a3
{
  ACUISSizeDimensionRequest *v4;
  ACUISSizeDimensionRequest *v5;
  BOOL v6;

  v4 = (ACUISSizeDimensionRequest *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_minimum == v5->_minimum && self->_maximum == v5->_maximum && self->_type == v5->_type;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  BOOL v2;

  if ((unint64_t)self->_minimum)
    v2 = (unint64_t)self->_maximum == 0;
  else
    v2 = 1;
  if (v2 || self->_type == 0)
    return 0;
  else
    return 3;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_type)
    v5 = CFSTR("dynamic");
  else
    v5 = CFSTR("fixed");
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("type"));
  v6 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("minimum"), 2, self->_minimum);
  v7 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("maximum"), 2, self->_maximum);
  objc_msgSend(v4, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACUISSizeDimensionRequest *v4;
  double v5;
  double v6;
  double v7;

  v4 = [ACUISSizeDimensionRequest alloc];
  -[ACUISSizeDimensionRequest minimum](self, "minimum");
  v6 = v5;
  -[ACUISSizeDimensionRequest maximum](self, "maximum");
  return -[ACUISSizeDimensionRequest initWithMinimum:maximum:type:](v4, "initWithMinimum:maximum:type:", -[ACUISSizeDimensionRequest type](self, "type"), v6, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISSizeDimensionRequest)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("min"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("max"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return -[ACUISSizeDimensionRequest initWithMinimum:maximum:type:](self, "initWithMinimum:maximum:type:", v9, v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double minimum;
  id v5;

  minimum = self->_minimum;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("min"), minimum);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("max"), self->_maximum);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)_sizeDimensionRequest
{
  _TtC18ActivityUIServices20SizeDimensionRequest *v3;
  double v4;
  double v5;
  double v6;

  v3 = [_TtC18ActivityUIServices20SizeDimensionRequest alloc];
  -[ACUISSizeDimensionRequest minimum](self, "minimum");
  v5 = v4;
  -[ACUISSizeDimensionRequest maximum](self, "maximum");
  return -[SizeDimensionRequest initWithMinimum:maximum:type:](v3, "initWithMinimum:maximum:type:", -[ACUISSizeDimensionRequest swiftTypeFromObjc:](self, "swiftTypeFromObjc:", -[ACUISSizeDimensionRequest type](self, "type")), v5, v6);
}

- (int64_t)objcTypeFromSwift:(int64_t)a3
{
  return a3 != 1;
}

- (int64_t)swiftTypeFromObjc:(int64_t)a3
{
  return a3 == 0;
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

- (int64_t)type
{
  return self->_type;
}

@end
