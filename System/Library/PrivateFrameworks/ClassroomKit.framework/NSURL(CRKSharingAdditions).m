@implementation NSURL(CRKSharingAdditions)

+ (id)crk_overriddenDescriptionForItems:()CRKSharingAdditions originalDescription:
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
  }
  else if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "crk_sharingDescription");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)crk_sharingDescription
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "isFileURL"))
  {
    objc_msgSend(a1, "lastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "crk_stringByRemovingWWWPrefixFromString:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)crk_stringByRemovingWWWPrefixFromString:()CRKSharingAdditions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("www")) & 1) != 0
    && (v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(".")), v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v3, "substringFromIndex:", v4 + 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(v3, "copy");
  }
  v6 = (void *)v5;

  return v6;
}

@end
