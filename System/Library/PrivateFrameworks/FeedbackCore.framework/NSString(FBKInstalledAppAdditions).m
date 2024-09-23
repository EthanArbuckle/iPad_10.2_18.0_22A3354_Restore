@implementation NSString(FBKInstalledAppAdditions)

- (uint64_t)directoryCountFromRootPath:()FBKInstalledAppAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = a1;
  if (objc_msgSend(v5, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  if (objc_msgSend(v5, "hasPrefix:", v4))
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_24E15EAF8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(CFSTR("/"), "stringByAppendingString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") - 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
