@implementation NSString(BusinessChatService)

- (uint64_t)bizIDWithoutPrefix
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("urn:biz:"), &stru_24C39D888);
}

- (id)prefixedBizID
{
  void *v2;

  if (objc_msgSend(a1, "isBusinessID"))
  {
    v2 = (void *)objc_msgSend(a1, "copy");
  }
  else
  {
    objc_msgSend(CFSTR("urn:biz:"), "stringByAppendingString:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (uint64_t)isBusinessID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("urn:biz:"));

  return v2;
}

- (uint64_t)removeFilePrefix
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("file://"), &stru_24C39D888);
}

- (id)stringByRemovingOccurancesOfCharacter:()BusinessChatService fromPosition:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(a1, "length"))
  {
    v7 = (void *)objc_msgSend(a1, "copy");
    v8 = v7;
    if (a4)
      v9 = objc_msgSend(v7, "length") - 1;
    else
      v9 = 0;
    while (1)
    {
      objc_msgSend(v8, "substringWithRange:", v9, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", v6))
        break;
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_24C39D888, 2, v9, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (a4)
        v9 = objc_msgSend(v10, "length") - 1;
      else
        v9 = 0;

      v8 = v10;
      if (!objc_msgSend(v10, "length"))
        goto LABEL_13;
    }

    v10 = v8;
  }
  else
  {
    v10 = a1;
  }
LABEL_13:

  return v10;
}

@end
