@implementation ICASOperationType

- (ICASOperationType)initWithOperationType:(int64_t)a3
{
  ICASOperationType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASOperationType;
  result = -[ICASOperationType init](&v5, sel_init);
  if (result)
    result->_operationType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASOperationType operationType](self, "operationType", a3);
  if ((unint64_t)(v3 - 1) > 0xA)
    return CFSTR("unknown");
  else
    return off_1E771C870[v3 - 1];
}

- (int64_t)operationType
{
  return self->_operationType;
}

@end
