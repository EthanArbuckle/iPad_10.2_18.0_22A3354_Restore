@implementation NSUnitConverterLinear

- (NSUnitConverterLinear)initWithCoefficient:(double)coefficient
{
  return -[NSUnitConverterLinear initWithCoefficient:constant:](self, "initWithCoefficient:constant:", coefficient, 0.0);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  if (a3 == self)
    return 1;
  -[NSUnitConverterLinear coefficient](self, "coefficient");
  v6 = v5;
  objc_msgSend(a3, "coefficient");
  if (v6 != v7)
    return 0;
  -[NSUnitConverterLinear constant](self, "constant");
  v10 = v9;
  objc_msgSend(a3, "constant");
  return v10 == v11;
}

- (double)valueFromBaseUnitValue:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[NSUnitConverterLinear constant](self, "constant");
  v6 = a3 - v5;
  -[NSUnitConverterLinear coefficient](self, "coefficient");
  return v6 / v7;
}

- (double)baseUnitValueFromValue:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[NSUnitConverterLinear coefficient](self, "coefficient");
  v6 = v5;
  -[NSUnitConverterLinear constant](self, "constant");
  return v7 + a3 * v6;
}

- (double)coefficient
{
  return self->_coefficient;
}

- (double)constant
{
  return self->_constant;
}

- (NSUnitConverterLinear)initWithCoefficient:(double)coefficient constant:(double)constant
{
  NSUnitConverterLinear *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSUnitConverterLinear;
  result = -[NSUnitConverterLinear init](&v7, sel_init);
  if (result)
  {
    result->_coefficient = coefficient;
    result->_constant = constant;
  }
  return result;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  unint64_t v19;

  -[NSUnitConverterLinear coefficient](self, "coefficient");
  v4 = -v3;
  if (v3 >= 0.0)
    v4 = v3;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  -[NSUnitConverterLinear constant](self, "constant");
  v13 = -v12;
  if (v12 >= 0.0)
    v13 = v12;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  v17 = v16 + (unint64_t)v15;
  v18 = fabs(v15);
  if (v15 <= 0.0)
    v17 = v16;
  v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0)
    v19 = v17;
  return v19 ^ v11;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSUnitConverterLinear;
  v3 = -[NSUnitConverterLinear description](&v8, sel_description);
  -[NSUnitConverterLinear coefficient](self, "coefficient");
  v5 = v4;
  -[NSUnitConverterLinear constant](self, "constant");
  return (id)objc_msgSend(v3, "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" coefficient = %f, constant = %f"), v5, v6));
}

- (NSUnitConverterLinear)initWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnitConverterLinear cannot be decoded by non-keyed archivers"), 0));
  }
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.coefficient"));
  v6 = v5;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.constant"));
  return -[NSUnitConverterLinear initWithCoefficient:constant:](self, "initWithCoefficient:constant:", v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnitConverterLinear encoder does not allow non-keyed coding!"), 0));
  -[NSUnitConverterLinear coefficient](self, "coefficient");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.coefficient"));
  -[NSUnitConverterLinear constant](self, "constant");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.constant"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
