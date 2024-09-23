@implementation NSError(DisembarkUI)

- (BOOL)dkui_isBackupDisabled
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("MBErrorDomain"));

  if (!v3)
    return 0;
  if (objc_msgSend(a1, "code") == 204)
    return 1;
  return objc_msgSend(a1, "code") == 210;
}

@end
