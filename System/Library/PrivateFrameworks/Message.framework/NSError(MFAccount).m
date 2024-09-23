@implementation NSError(MFAccount)

- (BOOL)mf_isMissingAccountCredentialError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F1D0]))
    v3 = objc_msgSend(a1, "code") == 11;
  else
    v3 = 0;

  return v3;
}

- (BOOL)mf_isInaccessibleAccountCredentialError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F1D0]))
    v3 = objc_msgSend(a1, "code") == 10;
  else
    v3 = 0;

  return v3;
}

@end
