@implementation ASPasswordManagerDeleteAlertConfiguration

BOOL __82___ASPasswordManagerDeleteAlertConfiguration__isPermanentlyDeletingSavedAccounts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "credentialTypes") == 4;
}

@end
