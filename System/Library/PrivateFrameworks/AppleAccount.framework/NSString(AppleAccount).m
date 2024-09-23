@implementation NSString(AppleAccount)

- (id)aa_base64String
{
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:", 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+AppleAccount.m"), 17, CFSTR("Failed to get UTF8 encoding!"));

  }
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trim
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (__CFString)unredactedSuffixOfLength:()AppleAccount
{
  void *v4;
  __CFString *v5;

  objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "length") - a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", a1) & 1) != 0)
    v5 = CFSTR("[REDACTED]");
  else
    v5 = v4;

  return v5;
}

@end
