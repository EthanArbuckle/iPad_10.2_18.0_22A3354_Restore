@implementation FKUtility

+ (BOOL)shouldAllowAddingFriendWithRecordID:(int)a3 withFriendListManager:(id)a4 addressBook:(void *)a5 personValueCache:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  ABRecordRef PersonWithRecordID;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  ABRecordRef v16;
  void *v17;
  void *v18;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a6;
  if (v9)
  {
    PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a5, v8);
    v12 = (void *)ABRecordCopyValue(PersonWithRecordID, *MEMORY[0x24BE027E8]);
    v13 = objc_msgSend(v9, "containsFriendWithABRecordGUID:", v12) ^ 1;

    if (!a5)
      goto LABEL_9;
  }
  else
  {
    v13 = 1;
    if (!a5)
      goto LABEL_9;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = ABAddressBookGetPersonWithRecordID(a5, v8);
      v17 = (void *)MEMORY[0x24BDD16E0];
      +[FKPerson allValuesForPerson:](FKPerson, "allValuesForPerson:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setObject:forKey:", v15, v14);
    }
    LOBYTE(v13) = objc_msgSend(v15, "unsignedIntegerValue") != 0;

  }
LABEL_9:

  return v13;
}

+ (BOOL)personHasLinkages:(void *)a3
{
  return ABRecordGetIntValue() != -1;
}

+ (id)_nameFormatter
{
  if (_nameFormatter_name_formatter_init != -1)
    dispatch_once(&_nameFormatter_name_formatter_init, &__block_literal_global);
  return (id)_nameFormatter_sNameFormatter;
}

void __27__FKUtility__nameFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1738]);
  v1 = (void *)_nameFormatter_sNameFormatter;
  _nameFormatter_sNameFormatter = (uint64_t)v0;

}

+ (id)initialsForPerson:(void *)a3
{
  const void *v4;
  const void *v5;
  const __CFNumber *v6;
  CFComparisonResult v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3 && (v4 = (const void *)ABPersonCopyPreferredLinkedPersonForName()) != 0)
  {
    v5 = v4;
    v6 = (const __CFNumber *)ABRecordCopyValue(v4, *MEMORY[0x24BE02808]);
    v7 = CFNumberCompare(v6, (CFNumberRef)*MEMORY[0x24BE02800], 0);
    CFRelease(v6);
    v8 = 0;
    if (v7 == kCFCompareEqualTo)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDD1730]);
      v10 = (void *)ABRecordCopyValue(v5, *MEMORY[0x24BE02758]);
      objc_msgSend(v9, "setGivenName:", v10);

      v11 = (void *)ABRecordCopyValue(v5, *MEMORY[0x24BE02820]);
      objc_msgSend(v9, "setFamilyName:", v11);

      objc_msgSend(a1, "_nameFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setStyle:", 4);
      objc_msgSend(v12, "set_ignoresFallbacks:", 1);
      objc_msgSend(v12, "stringFromPersonNameComponents:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!objc_msgSend(v8, "length"))
    {

      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "localizedUppercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)initialForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (!objc_msgSend(v3, "length") || !+[FKUtility isRomanString:](FKUtility, "isRomanString:", v3))
    goto LABEL_5;
  objc_msgSend(v3, "substringWithRange:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {

LABEL_5:
    v4 = 0;
  }
  objc_msgSend(v4, "localizedUppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isRomanString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3)
  {
    if ((_ABStringContainsNonLatinCharacters() & 1) != 0)
      LOBYTE(v4) = 0;
    else
      v4 = _ABStringContainsEmojiCharacters() ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (id)compressPhoneNumberString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  void *String;
  void *v9;

  v3 = a3;
  v4 = (void *)CPPhoneNumberCopyHomeCountryCode();
  v5 = CFPhoneNumberCreate();
  v6 = v3;
  if (v5)
  {
    v7 = (const void *)v5;
    String = (void *)CFPhoneNumberCreateString();
    v9 = (void *)CFPhoneNumberCopyCountryCode();
    objc_msgSend(v9, "isEqualToString:", v4);
    v6 = (void *)PNCreateFormattedStringWithCountry();

    CFRelease(v7);
  }

  return v6;
}

+ (id)hashFromData:(id)a3
{
  id v3;
  const void *v4;
  CC_LONG v5;
  void *v6;
  void *v7;
  unsigned __int8 md[20];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  CC_SHA1(v4, v5, md);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
