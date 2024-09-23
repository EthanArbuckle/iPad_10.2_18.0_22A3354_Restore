@implementation NSArray(EMSender)

- (uint64_t)em_senderAddresses
{
  return objc_msgSend(a1, "ef_flatMap:", &__block_literal_global_78);
}

@end
