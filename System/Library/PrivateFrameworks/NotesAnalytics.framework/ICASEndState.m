@implementation ICASEndState

- (ICASEndState)initWithEndState:(int64_t)a3
{
  ICASEndState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASEndState;
  result = -[ICASEndState init](&v5, sel_init);
  if (result)
    result->_endState = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASEndState endState](self, "endState", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return *(&off_1E771D338 + v3 - 1);
}

- (int64_t)endState
{
  return self->_endState;
}

@end
