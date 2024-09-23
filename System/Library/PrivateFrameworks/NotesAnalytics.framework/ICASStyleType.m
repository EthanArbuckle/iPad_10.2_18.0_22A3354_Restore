@implementation ICASStyleType

- (ICASStyleType)initWithStyleType:(int64_t)a3
{
  ICASStyleType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASStyleType;
  result = -[ICASStyleType init](&v5, sel_init);
  if (result)
    result->_styleType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASStyleType styleType](self, "styleType", a3);
  if ((unint64_t)(v3 - 1) > 0xF)
    return CFSTR("unknown");
  else
    return off_1E771C2F8[v3 - 1];
}

- (int64_t)styleType
{
  return self->_styleType;
}

@end
