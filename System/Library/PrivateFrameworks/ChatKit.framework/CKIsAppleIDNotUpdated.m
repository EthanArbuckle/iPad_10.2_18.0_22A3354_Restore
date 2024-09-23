@implementation CKIsAppleIDNotUpdated

uint64_t __CKIsAppleIDNotUpdated_block_invoke()
{
  uint64_t result;

  result = _CKCalculateIsAppleIDNotUpdatedValue();
  __CKIsAppleIDNotUpdated = result;
  return result;
}

@end
