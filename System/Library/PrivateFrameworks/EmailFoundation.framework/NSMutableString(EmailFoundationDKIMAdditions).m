@implementation NSMutableString(EmailFoundationDKIMAdditions)

- (void)ef_appendQuotedSQLEscapedString:()EmailFoundationDKIMAdditions
{
  id v4;

  objc_msgSend(a3, "ef_quotedSQLEscapedString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendString:");

}

- (void)ef_rfc5322Unfold
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "ef_rfc6376WhitespaceCharacterSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(a1, "length") >= 3)
  {
    v2 = objc_msgSend(a1, "length");
    if (v2 != 2)
    {
      v3 = v2 - 1;
      do
      {
        if ((unint64_t)objc_msgSend(a1, "length") < 3)
          break;
        if (objc_msgSend(a1, "characterAtIndex:", v3 - 2) == 13
          && objc_msgSend(a1, "characterAtIndex:", v3 - 1) == 10
          && objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v3)))
        {
          objc_msgSend(a1, "deleteCharactersInRange:", v3 - 2, 2);
        }
        --v3;
      }
      while (v3 != 1);
    }
  }

}

- (void)ef_removeCharactersInSet:()EmailFoundationDKIMAdditions beforeOccurrencesOfString:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  if (v7)
  {
    v8 = 0;
    v9 = v7 - 1;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_7;
      if (!objc_msgSend(v13, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v9)))
        break;
      ++v8;
LABEL_13:
      if (--v9 == -1)
        goto LABEL_14;
    }
    objc_msgSend(a1, "deleteCharactersInRange:", v9 + 1, v8);
    v8 = 0;
LABEL_7:
    v11 = objc_msgSend(v6, "length");
    if (v9 + v11 <= (unint64_t)objc_msgSend(a1, "length"))
    {
      objc_msgSend(a1, "substringWithRange:", v9, objc_msgSend(v6, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v6))
        v10 = v9;
      else
        v10 = 0x7FFFFFFFFFFFFFFFLL;

    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_13;
  }
LABEL_14:

}

- (void)ef_replaceContiguousSequencesOfCharactersInSet:()EmailFoundationDKIMAdditions withString:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = v7 - 1;
      if (objc_msgSend(v10, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v7 - 1)))
      {
        ++v8;
        if (v7 == 1)
        {
          objc_msgSend(a1, "replaceCharactersInRange:withString:", 0, v8, v6);
          break;
        }
      }
      else if (v8)
      {
        objc_msgSend(a1, "replaceCharactersInRange:withString:", v7, v8, v6);
        v8 = 0;
      }
      --v7;
    }
    while (v9);
  }

}

- (void)ef_trimLeadingCharactersInSet:()EmailFoundationDKIMAdditions
{
  unint64_t i;
  id v5;

  v5 = a3;
  for (i = 0;
        i < objc_msgSend(a1, "length")
     && objc_msgSend(v5, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", i));
  if (i)
    objc_msgSend(a1, "deleteCharactersInRange:", 0, i);

}

- (void)ef_trimTrailingCharactersInSet:()EmailFoundationDKIMAdditions
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(a1, "length");
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    v7 = v4 - 1;
    while (objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v7)))
    {
      ++v6;
      if (--v7 == -1)
      {
        v6 = v5;
        break;
      }
    }
    if (v6)
      objc_msgSend(a1, "deleteCharactersInRange:", objc_msgSend(a1, "length") - v6, v6);
  }

}

- (void)ef_appendSQLEscapedString:()EmailFoundationDKIMAdditions
{
  id v4;

  objc_msgSend(a3, "ef_SQLEscapedString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendString:");

}

@end
