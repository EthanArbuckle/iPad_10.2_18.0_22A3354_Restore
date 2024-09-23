@implementation UITextView(DataDetectorsOperationExtensions)

- (DDTextKitOperation)dd_newOperation
{
  DDTextKitOperation *v2;

  v2 = -[DDTextKitOperation initWithContainer:]([DDTextKitOperation alloc], "initWithContainer:", a1);
  -[DDOperation setIgnoreSignatures:](v2, "setIgnoreSignatures:", objc_msgSend(a1, "dd_ignoreSignatures"));
  return v2;
}

- (uint64_t)dd_ignoreSignatures
{
  return 0;
}

@end
