@implementation ICASShareFlowType

- (ICASShareFlowType)initWithShareFlowType:(int64_t)a3
{
  ICASShareFlowType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASShareFlowType;
  result = -[ICASShareFlowType init](&v5, sel_init);
  if (result)
    result->_shareFlowType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASShareFlowType shareFlowType](self, "shareFlowType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("initiate");
  else
    return off_1E771C470[v3 - 1];
}

- (int64_t)shareFlowType
{
  return self->_shareFlowType;
}

@end
