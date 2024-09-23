@implementation NSString(FBKUtils)

- (id)snakeCaseString
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCaseSensitive:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isAtEnd") & 1) != 0)
  {
    v3 = 0;
LABEL_11:
    v13 = v2;
    v2 = v13;
  }
  else
  {
    v4 = 0;
    v3 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v3;
      v6 = objc_msgSend(v1, "scanCharactersFromSet:intoString:", v5, &v16);
      v7 = v16;

      if (v6)
      {
        objc_msgSend(v2, "stringByAppendingString:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v7;
        v10 = objc_msgSend(v1, "scanCharactersFromSet:intoString:", v9, &v15);
        v3 = v15;

        if (v10)
        {
          objc_msgSend(v8, "stringByAppendingString:", CFSTR("_"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingString:", v12);
          v2 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v2 = v8;
        }
      }
      else
      {
        v3 = v7;
      }
      if (v4 == objc_msgSend(v1, "scanLocation"))
        break;
      v4 = objc_msgSend(v1, "scanLocation");
      if (objc_msgSend(v1, "isAtEnd"))
        goto LABEL_11;
    }
    v13 = 0;
  }

  return v13;
}

- (uint64_t)visibleCharactersCount
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "whitespaceSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    return v5;
  }
  return result;
}

+ (id)whitespaceSet
{
  if (whitespaceSet_onceToken != -1)
    dispatch_once(&whitespaceSet_onceToken, &__block_literal_global_36);
  return (id)whitespaceSet_set;
}

@end
