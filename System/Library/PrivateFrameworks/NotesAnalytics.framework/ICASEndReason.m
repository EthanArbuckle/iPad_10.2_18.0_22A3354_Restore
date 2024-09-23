@implementation ICASEndReason

- (ICASEndReason)initWithEndReason:(int64_t)a3
{
  ICASEndReason *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASEndReason;
  result = -[ICASEndReason init](&v5, sel_init);
  if (result)
    result->_endReason = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASEndReason endReason](self, "endReason", a3);
  if ((unint64_t)(v3 - 1) > 6)
    return CFSTR("unknown");
  else
    return off_1E771CF30[v3 - 1];
}

- (int64_t)endReason
{
  return self->_endReason;
}

@end
