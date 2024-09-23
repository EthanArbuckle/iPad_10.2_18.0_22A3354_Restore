@implementation MKMessagePhoneNumber

+ (id)addCountryCallingCode:(id)a3
{
  id v3;
  int v4;
  id v5;
  id v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v3 = a3;
  if (addCountryCallingCode__onceToken != -1)
    dispatch_once(&addCountryCallingCode__onceToken, &__block_literal_global_5);
  if (!objc_msgSend(v3, "length"))
    return v3;
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("+"));
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (!objc_msgSend(v3, "length"))
  {
LABEL_16:
    if (v4)
    {
      objc_msgSend(CFSTR("+"), "stringByAppendingString:", v5);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v13 = PNCopyBestGuessNormalizedNumberForCountry();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        v16 = v15;

        v3 = v16;
      }
      free(v14);
      v25 = *MEMORY[0x24BE1FAA8];
      v26 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 16);
      v27 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 32);
      v28 = *(_OWORD *)(MEMORY[0x24BE1FAA8] + 48);
      v3 = objc_retainAutorelease(v3);
      objc_msgSend(v3, "UTF8String");
      if (PNDecomposeForCountry())
      {
        if ((_QWORD)v25)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", (_QWORD)v25);
          objc_msgSend(CFSTR("+"), "stringByAppendingString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(CFSTR("+"), "stringByAppendingString:", addCountryCallingCode__internationalCallingCodeDefault);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v21 = &stru_24E35A3B8;
        if ((_QWORD)v26 && DWORD2(v26))
          v21 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", (_QWORD)v26, DWORD2(v26), 4);
        v22 = &stru_24E35A3B8;
        if ((_QWORD)v27 && DWORD2(v27))
          v22 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", (_QWORD)v27, DWORD2(v27), 4);
        v23 = &stru_24E35A3B8;
        if ((_QWORD)v28)
        {
          if (DWORD2(v28))
            v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", (_QWORD)v28, DWORD2(v28), 4);
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@%@"), v18, v21, v22, v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v24;
        return v3;
      }

    }
    +[MKMessagePhoneNumber addDefaultCountryCallingCode:number:](MKMessagePhoneNumber, "addDefaultCountryCallingCode:number:", addCountryCallingCode__internationalCallingCodeDefault, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
  v7 = 0;
  v8 = 0;
  do
  {
    while (1)
    {
      v9 = objc_msgSend(v3, "characterAtIndex:", v7);
      v10 = v9;
      if ((v9 - 48) <= 9)
      {
        objc_msgSend(v5, "appendFormat:", CFSTR("%C"), v9);
        objc_msgSend(v6, "appendFormat:", CFSTR("%C"), v10);
        goto LABEL_10;
      }
      if ((v9 & 0xFFFFFFDF) - 65 >= 0x1A)
        break;
      objc_msgSend(v6, "appendFormat:", CFSTR("%C"), v9);
      ++v7;
      v8 = 1;
      if (v7 >= objc_msgSend(v3, "length"))
        goto LABEL_15;
    }
    if ((_DWORD)v9 == 64)
      goto LABEL_19;
LABEL_10:
    ++v7;
  }
  while (v7 < objc_msgSend(v3, "length"));
  if ((v8 & 1) == 0)
    goto LABEL_16;
LABEL_15:
  v11 = v6;
LABEL_18:
  v12 = v11;

  v3 = v12;
LABEL_19:

  return v3;
}

void __46__MKMessagePhoneNumber_addCountryCallingCode___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryCode");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)addCountryCallingCode__countryCode;
  addCountryCallingCode__countryCode = v1;

  if (!objc_msgSend((id)addCountryCallingCode__countryCode, "length"))
  {
    v3 = (void *)addCountryCallingCode__countryCode;
    addCountryCallingCode__countryCode = (uint64_t)CFSTR("US");

  }
  v4 = _PNCopyInternationalCodeForCountry();
  v5 = (void *)addCountryCallingCode__internationalCallingCodeDefault;
  addCountryCallingCode__internationalCallingCodeDefault = v4;

  if (!objc_msgSend((id)addCountryCallingCode__internationalCallingCodeDefault, "length"))
  {
    v6 = (void *)addCountryCallingCode__internationalCallingCodeDefault;
    addCountryCallingCode__internationalCallingCodeDefault = (uint64_t)CFSTR("1");

  }
}

+ (id)addDefaultCountryCallingCode:(id)a3 number:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[^0-9]"), &stru_24E35A3B8, 1024, 0, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "hasPrefix:", CFSTR("0")))
  {
    objc_msgSend(v7, "substringFromIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+%@%@"), v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)countryCallingCode:(id)a3
{
  return (id)_PNCopyInternationalCodeForCountry();
}

@end
