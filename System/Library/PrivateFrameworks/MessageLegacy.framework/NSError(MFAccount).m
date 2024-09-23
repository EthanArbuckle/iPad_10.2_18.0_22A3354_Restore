@implementation NSError(MFAccount)

- (uint64_t)mf_isMissingAccountCredentialError
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(a1, "domain");
  result = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F1D0]);
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 11;
  return result;
}

- (uint64_t)mf_isInaccessibleAccountCredentialError
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(a1, "domain");
  result = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F1D0]);
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 10;
  return result;
}

@end
