@implementation NSError(AAAFoundation)

- (BOOL)isRecoverableError
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v3
    && (objc_msgSend(a1, "code") == -997
     || objc_msgSend(a1, "code") == -1005
     || objc_msgSend(a1, "code") == -1001
     || objc_msgSend(a1, "code") == -1009))
  {
    return 1;
  }
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v5)
  {
    if (objc_msgSend(a1, "code") == 4099 || objc_msgSend(a1, "code") == 4097)
      return 1;
  }
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CKErrorDomain"));

  return v7 && (objc_msgSend(a1, "code") == 3 || objc_msgSend(a1, "code") == 4);
}

@end
