@implementation EAEmailAddressGenerator

+ (id)formattedAddressWithName:(id)a3 email:(id)a4 useQuotes:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v9, "appendString:", v7);
    if (v5
      && (!objc_msgSend(v7, "hasPrefix:", CFSTR("\"))
       || (objc_msgSend(v7, "hasSuffix:", CFSTR("\")) & 1) == 0))
    {
      if (formattedAddressWithName_email_useQuotes__onceToken != -1)
        dispatch_once(&formattedAddressWithName_email_useQuotes__onceToken, &__block_literal_global);
      if (objc_msgSend(v7, "rangeOfCharacterFromSet:", formattedAddressWithName_email_useQuotes__requiresQuotes) != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v9, "length"));
        objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v9, "length"));
        objc_msgSend(v9, "replaceCharactersInRange:withString:", 0, 0, CFSTR("\"));
        objc_msgSend(v9, "replaceCharactersInRange:withString:", objc_msgSend(v9, "length"), 0, CFSTR("\"));
      }
    }
  }
  if (objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v9, "appendString:", CFSTR(" <"));
      objc_msgSend(v9, "appendString:", v8);
      objc_msgSend(v9, "appendString:", CFSTR(">"));
    }
    else
    {
      objc_msgSend(v9, "appendString:", v8);
    }
  }

  return v9;
}

void __68__EAEmailAddressGenerator_formattedAddressWithName_email_useQuotes___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("()<>[]:;@\\,.\"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)formattedAddressWithName_email_useQuotes__requiresQuotes;
  formattedAddressWithName_email_useQuotes__requiresQuotes = v0;

}

+ (id)stringByTrimmingCommasSpacesQuotesFromString:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned __int16 v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int16 v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = objc_msgSend(v3, "characterAtIndex:", 0);
    v6 = 0;
    v7 = 1;
    while (v5 <= 0x2Cu && ((1 << v5) & 0x100500000000) != 0)
    {
      v6 ^= v5 == 34;
      if (v4 == v7)
      {
        v9 = v4;
        goto LABEL_9;
      }
      v8 = v7 + 1;
      v5 = objc_msgSend(v3, "characterAtIndex:");
      v7 = v8;
    }
    v9 = v7 - 1;
LABEL_9:
    v10 = v4 - 1;
    v11 = objc_msgSend(v3, "characterAtIndex:", v10);
    v12 = 0;
    while (v10 > v9)
    {
      if (v11 > 0x2Cu)
        break;
      if (((1 << v11) & 0x100500000000) == 0)
        break;
      --v10;
      v12 ^= v11 == 34;
      if (v10 <= v9)
        break;
      v11 = objc_msgSend(v3, "characterAtIndex:", v10);
    }
    if (v10 >= v9)
    {
      objc_msgSend(v3, "substringWithRange:", v9, v10 - v9 + 1);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v13 = v14;
      if (v12 & 1 | ((v6 & 1) == 0))
      {
        if (v6 & 1 | ((v12 & 1) == 0))
          goto LABEL_22;
        -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("\"));
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(CFSTR("\"), "stringByAppendingString:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (__CFString *)v15;

      v13 = v16;
      goto LABEL_22;
    }
  }
  v13 = &stru_24C2B7358;
LABEL_22:

  return v13;
}

@end
