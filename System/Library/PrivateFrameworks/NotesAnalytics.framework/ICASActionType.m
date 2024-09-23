@implementation ICASActionType

- (ICASActionType)initWithActionType:(int64_t)a3
{
  ICASActionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASActionType;
  result = -[ICASActionType init](&v5, sel_init);
  if (result)
    result->_actionType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASActionType actionType](self, "actionType", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E771C378[v3 - 1];
}

- (int64_t)actionType
{
  return self->_actionType;
}

@end
