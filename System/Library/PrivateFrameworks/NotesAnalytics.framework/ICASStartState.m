@implementation ICASStartState

- (ICASStartState)initWithStartState:(int64_t)a3
{
  ICASStartState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASStartState;
  result = -[ICASStartState init](&v5, sel_init);
  if (result)
    result->_startState = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASStartState startState](self, "startState", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C4D0[v3 - 1];
}

- (int64_t)startState
{
  return self->_startState;
}

@end
