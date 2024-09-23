@implementation NSNumber(CATCasting)

+ (id)cat_numberWithObject:()CATCasting
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  if (cat_numberWithObject__onceToken != -1)
    dispatch_once(&cat_numberWithObject__onceToken, &__block_literal_global_29);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      v11 = objc_msgSend(v6, "length");
      v9 = 0;
      objc_msgSend((id)cat_numberWithObject__formatter, "getObjectValue:forString:range:error:", &v9, v6, &v10, 0);
      v4 = v9;
      v7 = v11;
      if (v7 == objc_msgSend(v6, "length"))
      {

        goto LABEL_10;
      }

    }
    v4 = 0;
    goto LABEL_10;
  }
  v4 = v3;
LABEL_10:

  return v4;
}

@end
