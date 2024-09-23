@implementation ICASLayoutType

- (ICASLayoutType)initWithLayoutType:(int64_t)a3
{
  ICASLayoutType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASLayoutType;
  result = -[ICASLayoutType init](&v5, sel_init);
  if (result)
    result->_layoutType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASLayoutType layoutType](self, "layoutType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("list");
  if (v3 == 2)
    return CFSTR("grid");
  else
    return (id)v4;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

@end
