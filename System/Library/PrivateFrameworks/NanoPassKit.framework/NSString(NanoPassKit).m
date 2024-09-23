@implementation NSString(NanoPassKit)

- (BOOL)npkIsPhoneNumber
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "matchesInStringWithType:", 2048);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "resultType") == 2048;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)npkIsEmailAddress
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;

  objc_msgSend(a1, "matchesInStringWithType:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "resultType");
    objc_msgSend(v3, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mailto:%@"), a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v4 == 32)
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)npkBaseAddress
{
  int v2;
  int v3;
  __CFString *v4;
  id v5;

  v2 = objc_msgSend(a1, "hasPrefix:", CFSTR("mailto:"));
  v3 = objc_msgSend(a1, "hasPrefix:", CFSTR("tel:"));
  if (v2)
  {
    v4 = CFSTR("mailto:");
  }
  else
  {
    if (!v3)
    {
      v5 = a1;
      return v5;
    }
    v4 = CFSTR("tel:");
  }
  objc_msgSend(a1, "substringFromIndex:", -[__CFString length](v4, "length"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)matchesInStringWithType:()NanoPassKit
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "matchesInString:options:range:", a1, 4, 0, objc_msgSend(a1, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
