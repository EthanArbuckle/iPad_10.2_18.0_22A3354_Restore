@implementation CKDRegisterOperationInfo

- (CKDRegisterOperationInfo)initWithOptions:(unint64_t)a3
{
  CKDRegisterOperationInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDRegisterOperationInfo;
  result = -[CKDRegisterOperationInfo init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

- (unint64_t)options
{
  return self->_options;
}

@end
