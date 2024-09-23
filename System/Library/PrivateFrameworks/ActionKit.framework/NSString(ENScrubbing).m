@implementation NSString(ENScrubbing)

- (id)en_scrubUsingRegex:()ENScrubbing withMinLength:maxLength:invalidCharacterReplacement:
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v10 = a3;
  v11 = a6;
  v12 = a1;
  if (objc_msgSend(v12, "length") < (unint64_t)a4)
  {
    v13 = 0;
    goto LABEL_21;
  }
  v14 = a4;
  if (objc_msgSend(v12, "length") <= (unint64_t)a5)
  {
    v15 = v12;
  }
  else
  {
    objc_msgSend(v12, "substringToIndex:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v10, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v15, "length"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
LABEL_16:

      goto LABEL_17;
    }
    v18 = 0;
    while (1)
    {
      v19 = v17;
      objc_msgSend(v15, "substringWithRange:", v18, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "matchesInString:options:range:", v20, 0, 0, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "count"))
        break;
      if (v11)
      {
        v21 = v12;
        v22 = v11;
        goto LABEL_14;
      }
LABEL_15:

      if (++v18 >= (unint64_t)objc_msgSend(v15, "length"))
        goto LABEL_16;
    }
    v21 = v12;
    v22 = v20;
LABEL_14:
    objc_msgSend(v21, "appendString:", v22);
    goto LABEL_15;
  }
  v12 = v15;
LABEL_17:
  if (objc_msgSend(v12, "length") >= v14)
    v13 = v12;
  else
    v13 = 0;

LABEL_21:
  return v13;
}

- (uint64_t)en_scrubUsingRegex:()ENScrubbing withMinLength:maxLength:
{
  return objc_msgSend(a1, "en_scrubUsingRegex:withMinLength:maxLength:invalidCharacterReplacement:", a3, a4, a5, 0);
}

@end
