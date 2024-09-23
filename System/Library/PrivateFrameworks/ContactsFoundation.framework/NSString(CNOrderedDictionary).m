@implementation NSString(CNOrderedDictionary)

- (id)_cn_stringByReplacingStrings:()CNOrderedDictionary
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v6 = objc_msgSend(v5, "_cn_replaceStrings:", v4);

  if (v6)
    v7 = v5;
  else
    v7 = a1;
  v8 = v7;

  return v8;
}

@end
