@implementation NSString(NSEmailAddressString)

- (uint64_t)mf_emailAddressesWithEquivalentDomains
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "mf_rangeOfAddressDomain");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return MEMORY[0x1E0C9AA60];
  v5 = v2;
  v6 = v3;
  if (objc_msgSend(&unk_1E5AAC3C0, "containsObject:", objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v2, v3), "lowercaseString")))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(&unk_1E5AAC3C0, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(&unk_1E5AAC3C0, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(&unk_1E5AAC3C0);
          v11 = (void *)objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v5, v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          if (objc_msgSend(v11, "isEqualToString:", a1))
            objc_msgSend(v4, "insertObject:atIndex:", v11, 0);
          else
            objc_msgSend(v4, "addObject:", v11);
        }
        v8 = objc_msgSend(&unk_1E5AAC3C0, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }
  }
  else
  {
    v17 = a1;
    return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  }
  return (uint64_t)v4;
}

- (uint64_t)mf_rangeOfAddressDomain
{
  return objc_msgSend(MEMORY[0x1E0D1E450], "rangeOfAddressDomainFromAddress:", a1);
}

- (uint64_t)mf_copyUncommentedAddress
{
  return objc_msgSend((id)objc_msgSend(a1, "ea_uncommentedAddress"), "copy");
}

- (uint64_t)mf_copyAddressComment
{
  return objc_msgSend((id)objc_msgSend(a1, "ea_addressComment"), "copy");
}

+ (void)mf_formattedAddressWithName:()NSEmailAddressString email:useQuotes:
{
  void *v8;
  uint64_t v9;
  CFIndex v10;
  const __CFCharacterSet *v11;
  CFCharacterSetRef v12;
  const __CFString *v13;
  void *v14;
  CFRange v16;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = -[__CFString length](a3, "length");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v8, "appendString:", a3);
    if (a5)
    {
      if (!-[__CFString hasPrefix:](a3, "hasPrefix:", CFSTR("\"))
        || (-[__CFString hasSuffix:](a3, "hasSuffix:", CFSTR("\")) & 1) == 0)
      {
        v11 = (const __CFCharacterSet *)mf_formattedAddressWithName_email_useQuotes__requiresQuotes;
        if (!mf_formattedAddressWithName_email_useQuotes__requiresQuotes)
        {
          v12 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("()<>[]:;@\\,.\"));
          _MFLockGlobalLock();
          if (mf_formattedAddressWithName_email_useQuotes__requiresQuotes)
            CFRelease(v12);
          else
            mf_formattedAddressWithName_email_useQuotes__requiresQuotes = (uint64_t)v12;
          _MFUnlockGlobalLock();
          v11 = (const __CFCharacterSet *)mf_formattedAddressWithName_email_useQuotes__requiresQuotes;
        }
        v16.location = 0;
        v16.length = v10;
        if (CFStringFindCharacterFromSet(a3, v11, v16, 0, 0))
        {
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v8, "length"));
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v8, "length"));
          objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, 0, CFSTR("\"));
          objc_msgSend(v8, "replaceCharactersInRange:withString:", objc_msgSend(v8, "length"), 0, CFSTR("\"));
        }
      }
    }
  }
  if (-[__CFString length](a4, "length"))
  {
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v8, "appendString:", CFSTR(" <"));
      objc_msgSend(v8, "appendString:", a4);
      v13 = CFSTR(">");
      v14 = v8;
    }
    else
    {
      v14 = v8;
      v13 = a4;
    }
    objc_msgSend(v14, "appendString:", v13);
  }
  return v8;
}

- (uint64_t)mf_addressDomain
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (void *)objc_msgSend(a1, "mf_copyUncommentedAddress");
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("@"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || (v4 = v2 + v3, v2 + v3 >= (unint64_t)objc_msgSend(v1, "length")))
    v5 = 0;
  else
    v5 = objc_msgSend(v1, "substringFromIndex:", v4);

  return v5;
}

- (id)mf_copyDisplayEmailAddress
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(a1, "mf_rangeOfAddressDomain");
  v4 = (void *)objc_msgSend(a1, "mf_copyDisplayStringInRange:", v2, v3);
  if (objc_msgSend(v4, "containsString:", &stru_1E5AA22A8))
    return (id)objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", &stru_1E5AA22A8, &stru_1E5AA1FC8);
  else
    return v4;
}

- (uint64_t)mf_copyIDNADecodedEmailAddress
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1E450], "idnaDecodedAddressForAddress:", a1), "copy");
}

- (uint64_t)mf_copyIDNAEncodedEmailAddress
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1E450], "idnaEncodedAddressForAddress:", a1), "copy");
}

@end
