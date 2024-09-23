@implementation NSString(ECEmailAddressQuoting)

- (id)ecemailaddress_uniquedDomain
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (ecemailaddress_uniquedDomain_onceToken != -1)
    dispatch_once(&ecemailaddress_uniquedDomain_onceToken, &__block_literal_global_219);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__NSString_ECEmailAddressQuoting__ecemailaddress_uniquedDomain__block_invoke_222;
  v4[3] = &unk_1E7120F38;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)ecemailaddress_uniquedDomain_uniqueStringsQueue, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (__CFString)ecemailaddress_trimmedAndQuotedLocalPart
{
  id v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  if (ecemailaddress_trimmedAndQuotedLocalPart_onceToken != -1)
    dispatch_once(&ecemailaddress_trimmedAndQuotedLocalPart_onceToken, &__block_literal_global_200);
  v2 = a1;
  if (!objc_msgSend(v2, "length"))
  {

    v4 = CFSTR("\"\");
LABEL_11:
    v5 = v4;
    v4 = v5;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v4, "length")
    || -[__CFString rangeOfCharacterFromSet:](v4, "rangeOfCharacterFromSet:", ecemailaddress_trimmedAndQuotedLocalPart_specials) == 0x7FFFFFFFFFFFFFFFLL&& -[__CFString characterAtIndex:](v4, "characterAtIndex:", 0) != 46&& -[__CFString characterAtIndex:](v4, "characterAtIndex:", -[__CFString length](v4, "length") - 1) != 46&& -[__CFString rangeOfString:](v4, "rangeOfString:", CFSTR("..")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_11;
  }
  -[__CFString ecemailaddress_quotedString](v4, "ecemailaddress_quotedString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v6 = v5;

  return v6;
}

- (id)ecemailaddress_trimmedAndQuotedDisplayName
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (ecemailaddress_trimmedAndQuotedDisplayName_onceToken != -1)
    dispatch_once(&ecemailaddress_trimmedAndQuotedDisplayName_onceToken, &__block_literal_global_208);
  v2 = a1;
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length")
      && objc_msgSend(v4, "rangeOfCharacterFromSet:", ecemailaddress_trimmedAndQuotedDisplayName_specials) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "ecemailaddress_quotedString");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v2 = v4;
  }
  v5 = v2;
  v4 = v5;
LABEL_8:
  v6 = v5;

  return v6;
}

- (id)ecemailaddress_quotedString
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceCharactersInRange:withString:", 0, 0, CFSTR("\"));
    objc_msgSend(v1, "replaceCharactersInRange:withString:", objc_msgSend(v1, "length"), 0, CFSTR("\"));
  }
  return v1;
}

@end
