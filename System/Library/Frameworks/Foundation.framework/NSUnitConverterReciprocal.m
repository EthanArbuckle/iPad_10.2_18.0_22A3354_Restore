@implementation NSUnitConverterReciprocal

- (NSUnitConverterReciprocal)initWithReciprocalValue:(double)a3
{
  NSUnitConverterReciprocal *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSUnitConverterReciprocal;
  result = -[NSUnitConverterReciprocal init](&v5, sel_init);
  if (result)
    result->_reciprocalValue = a3;
  return result;
}

- (double)baseUnitValueFromValue:(double)a3
{
  return self->_reciprocalValue / a3;
}

- (double)valueFromBaseUnitValue:(double)a3
{
  return self->_reciprocalValue / a3;
}

- (BOOL)isEqual:(id)a3
{
  double reciprocalValue;
  double v4;

  if (a3 == self)
    return 1;
  reciprocalValue = self->_reciprocalValue;
  objc_msgSend(a3, "reciprocalValue");
  return reciprocalValue == v4;
}

- (unint64_t)hash
{
  double v2;
  double v3;
  long double v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  -[NSUnitConverterReciprocal reciprocalValue](self, "reciprocalValue");
  v3 = -v2;
  if (v2 >= 0.0)
    v3 = v2;
  v4 = floor(v3 + 0.5);
  v5 = (v3 - v4) * 1.84467441e19;
  v6 = fmod(v4, 1.84467441e19);
  v7 = 2654435761u * (unint64_t)v6;
  v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0)
    v8 = 2654435761u * (unint64_t)v6;
  v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0)
    return v9;
  else
    return v8;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSUnitConverterReciprocal;
  return (id)objc_msgSend(-[NSUnitConverterReciprocal description](&v3, sel_description), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" reciprocalValue = %f"), *(_QWORD *)&self->_reciprocalValue));
}

- (NSUnitConverterReciprocal)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnitConverterReciprocal cannot be decoded by non-keyed archivers"), 0));
  }
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.reciprocalValue"));
  return -[NSUnitConverterReciprocal initWithReciprocalValue:](self, "initWithReciprocalValue:");
}

- (void)encodeWithCoder:(id)a3
{
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSUnitConverterReciprocal encoder does not allow non-keyed coding!"), 0));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.reciprocalValue"), self->_reciprocalValue);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)reciprocalValue
{
  return self->_reciprocalValue;
}

@end
