@implementation ICASClickContext

- (ICASClickContext)initWithClickContext:(int64_t)a3
{
  ICASClickContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASClickContext;
  result = -[ICASClickContext init](&v5, sel_init);
  if (result)
    result->_clickContext = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASClickContext clickContext](self, "clickContext", a3);
  if ((unint64_t)(v3 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_1E771C238[v3 - 1];
}

- (int64_t)clickContext
{
  return self->_clickContext;
}

@end
