@implementation AKAuthorizationNameFormatter

+ (id)validNameCharacterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AKAuthorizationNameFormatter_validNameCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (validNameCharacterSet_onceToken != -1)
    dispatch_once(&validNameCharacterSet_onceToken, block);
  return (id)validNameCharacterSet_sValidNameCharacterSet;
}

void __53__AKAuthorizationNameFormatter_validNameCharacterSet__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v2);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v3);

  objc_msgSend(v6, "removeCharactersInString:", CFSTR("\t"));
  objc_msgSend(*(id *)(a1 + 32), "_addSymbolModifiersToCharacterSet:", v6);
  objc_msgSend(v6, "addCharactersInRange:", 33, 94);
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)validNameCharacterSet_sValidNameCharacterSet;
  validNameCharacterSet_sValidNameCharacterSet = v4;

}

- (id)stringForObjectValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  if (a3)
    *a3 = objc_retainAutorelease(a4);
  return a3 != 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  id v10;
  BOOL v11;
  void *v12;
  uint64_t v13;

  v10 = *a3;
  if ((unint64_t)objc_msgSend(v10, "length") <= 0x20)
  {
    if (!objc_msgSend(v10, "length"))
    {
      v11 = 1;
      goto LABEL_14;
    }
    if (-[AKAuthorizationNameFormatter _isOnlyWhitespace:](self, "_isOnlyWhitespace:", v10))
    {
      v11 = 0;
      *a3 = &stru_1E7679C68;
      a4->location = 0;
      a4->length = 0;
      goto LABEL_14;
    }
    -[AKAuthorizationNameFormatter _cleanNameString:](self, "_cleanNameString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "length") <= 0x20)
    {
      if ((objc_msgSend(v12, "isEqualToString:", v10) & 1) != 0)
      {
        v11 = 1;
        goto LABEL_13;
      }
      if (objc_msgSend(v12, "length"))
      {
        v13 = objc_msgSend(v10, "length");
        a4->location += objc_msgSend(v12, "length") - v13;
        v11 = 0;
        *a3 = objc_retainAutorelease(v12);
        goto LABEL_13;
      }
    }
    v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)_isOnlyWhitespace:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cleanNameString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "validNameCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invertedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = &stru_1E7679C68;
  objc_msgSend(v9, "componentsJoinedByString:", &stru_1E7679C68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:", v6, 4);
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v12 + v13;
    if (v12 + v13 >= (unint64_t)objc_msgSend(v11, "length"))
    {
      v10 = &stru_1E7679C68;
    }
    else
    {
      v15 = objc_msgSend(v11, "rangeOfComposedCharacterSequenceAtIndex:", v14);
      objc_msgSend(v11, "substringWithRange:", v15, v16);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByAppendingString:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (void)_addSymbolModifiersToCharacterSet:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "addCharactersInRange:", 94, 95);
  objc_msgSend(v3, "addCharactersInRange:", 96, 97);
  objc_msgSend(v3, "addCharactersInRange:", 168, 169);
  objc_msgSend(v3, "addCharactersInRange:", 175, 176);
  objc_msgSend(v3, "addCharactersInRange:", 180, 181);
  objc_msgSend(v3, "addCharactersInRange:", 184, 185);
  objc_msgSend(v3, "addCharactersInRange:", 706, 710);
  objc_msgSend(v3, "addCharactersInRange:", 722, 736);
  objc_msgSend(v3, "addCharactersInRange:", 741, 748);
  objc_msgSend(v3, "addCharactersInRange:", 749, 750);
  objc_msgSend(v3, "addCharactersInRange:", 751, 768);
  objc_msgSend(v3, "addCharactersInRange:", 885, 886);
  objc_msgSend(v3, "addCharactersInRange:", 900, 902);
  objc_msgSend(v3, "addCharactersInRange:", 8125, 8126);
  objc_msgSend(v3, "addCharactersInRange:", 8127, 8130);
  objc_msgSend(v3, "addCharactersInRange:", 8141, 8144);
  objc_msgSend(v3, "addCharactersInRange:", 8157, 8160);
  objc_msgSend(v3, "addCharactersInRange:", 8173, 8176);
  objc_msgSend(v3, "addCharactersInRange:", 8189, 0x1FFFLL);
  objc_msgSend(v3, "addCharactersInRange:", 12443, 12445);
  objc_msgSend(v3, "addCharactersInRange:", 42752, 42775);
  objc_msgSend(v3, "addCharactersInRange:", 42784, 42786);
  objc_msgSend(v3, "addCharactersInRange:", 42889, 42891);
  objc_msgSend(v3, "addCharactersInRange:", 43867, 43868);
  objc_msgSend(v3, "addCharactersInRange:", 64434, 64450);
  objc_msgSend(v3, "addCharactersInRange:", 65342, 65343);
  objc_msgSend(v3, "addCharactersInRange:", 65344, 65345);
  objc_msgSend(v3, "addCharactersInRange:", 65507, 65508);

}

@end
