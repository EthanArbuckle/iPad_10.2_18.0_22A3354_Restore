@implementation HMFMutableMessage(HMDBackingStoreTransactionActions)

- (uint64_t)setTransactionResult:()HMDBackingStoreTransactionActions
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", a3, CFSTR("_reserved_BackingStoreTransactionResult"));
}

@end
