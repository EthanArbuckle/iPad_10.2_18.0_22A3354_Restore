@implementation CKDOperationInfoHolderOperation

- (CKDOperationInfoHolderOperation)initWithOperationInfo:(id)a3 container:(id)a4 operationType:(int)a5
{
  CKDOperationInfoHolderOperation *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDOperationInfoHolderOperation;
  result = -[CKDOperation initWithOperationInfo:container:](&v7, sel_initWithOperationInfo_container_, a3, a4);
  if (result)
    result->_operationType = a5;
  return result;
}

- (void)main
{
  objc_msgSend_finishWithError_(self, a2, 0);
}

- (int)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int)a3
{
  self->_operationType = a3;
}

@end
