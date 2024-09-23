@implementation ICASContextPath

- (ICASContextPath)initWithContextPath:(int64_t)a3
{
  ICASContextPath *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASContextPath;
  result = -[ICASContextPath init](&v5, sel_init);
  if (result)
    result->_contextPath = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASContextPath contextPath](self, "contextPath", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E771BEF0[v3 - 1];
}

- (int64_t)contextPath
{
  return self->_contextPath;
}

@end
