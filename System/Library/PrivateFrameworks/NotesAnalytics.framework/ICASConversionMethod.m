@implementation ICASConversionMethod

- (ICASConversionMethod)initWithConversionMethod:(int64_t)a3
{
  ICASConversionMethod *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASConversionMethod;
  result = -[ICASConversionMethod init](&v5, sel_init);
  if (result)
    result->_conversionMethod = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASConversionMethod conversionMethod](self, "conversionMethod", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("manual");
  if (v3 == 2)
    return CFSTR("automatic");
  else
    return (id)v4;
}

- (int64_t)conversionMethod
{
  return self->_conversionMethod;
}

@end
