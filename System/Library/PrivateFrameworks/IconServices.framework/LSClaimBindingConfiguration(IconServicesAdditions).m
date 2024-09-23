@implementation LSClaimBindingConfiguration(IconServicesAdditions)

- (uint64_t)_LS_setAddClaimRecordIfMissing:()IconServicesAdditions
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "setAddClaimRecordIfMissing:", a3);
  return result;
}

@end
