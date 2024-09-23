@implementation CKIsWaitingForCloud

uint64_t __CKIsWaitingForCloud_block_invoke()
{
  uint64_t result;

  result = _CKCalculateIsWaitingForCloudValue();
  __CKIsWaitingForCloud = result;
  return result;
}

@end
