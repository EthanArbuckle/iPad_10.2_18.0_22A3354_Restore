@implementation NSURL(STSiriMessage)

- (id)_af_messageIdentifierValue
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("siri-message-internal"));

  if (v3)
  {
    objc_msgSend(a1, "resourceSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByRemovingPercentEncoding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_af_URLWithMessageIdentifier:()STSiriMessage
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3500];
    v5 = a3;
    objc_msgSend(v4, "URLPathAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("siri-message-internal"), "stringByAppendingString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
