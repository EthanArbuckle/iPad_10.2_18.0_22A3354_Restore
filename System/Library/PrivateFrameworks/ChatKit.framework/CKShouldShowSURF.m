@implementation CKShouldShowSURF

void *__CKShouldShowSURF_block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("PKPeerPaymentMessagesExtensionIsVisible", CFSTR("PassKitCore"));
  CKShouldShowSURF__PKPeerPaymentMessagesExtensionIsVisible = result;
  return result;
}

@end
