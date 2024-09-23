@implementation CKSURFAvailable

void *__CKSURFAvailable_block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("PKPeerPaymentIsAvailable", CFSTR("PassKitCore"));
  CKSURFAvailable__PKPeerPaymentIsAvailable = result;
  return result;
}

@end
