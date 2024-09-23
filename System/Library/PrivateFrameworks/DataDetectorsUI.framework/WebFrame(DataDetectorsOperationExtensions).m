@implementation WebFrame(DataDetectorsOperationExtensions)

- (DDWebKitOperation)dd_newOperation
{
  return -[DDOperation initWithContainer:]([DDWebKitOperation alloc], "initWithContainer:", a1);
}

@end
