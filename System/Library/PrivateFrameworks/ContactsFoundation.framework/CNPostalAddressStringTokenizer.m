@implementation CNPostalAddressStringTokenizer

+ (id)postalAddressFromString:(id)a3 error:(id *)a4
{
  id v5;
  CNPostalAddressStringTokenizer *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(CNPostalAddressStringTokenizer);
  -[CNPostalAddressStringTokenizer postalAddressFromString:error:](v6, "postalAddressFromString:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)postalAddressFromString:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", &__block_literal_global_69);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v27 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v6, "subResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v14 = (void *)objc_opt_class();
          objc_msgSend(v13, "type");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "tokenNameForScannerResultType:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v16);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ISOCountryCode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18 || !objc_msgSend(v18, "length"))
    {
      v20 = (void *)objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("country"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "countryCodeForCountryName:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v22;
    }
    v5 = v27;
    objc_msgSend(v19, "uppercaseString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("ISOCountryCode"));
  }
  else
  {
    +[CNFoundationError errorWithCode:userInfo:](CNFoundationError, "errorWithCode:userInfo:", 9, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a4)
      *a4 = objc_retainAutorelease(v24);

    v7 = 0;
  }

  return v7;
}

BOOL __64__CNPostalAddressStringTokenizer_postalAddressFromString_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "category") == 3;
}

+ (id)tokenNameForScannerResultType:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D1CB78];
  v11[0] = *MEMORY[0x1E0D1CB68];
  v11[1] = v3;
  v12[0] = CFSTR("street");
  v12[1] = CFSTR("subLocality");
  v4 = *MEMORY[0x1E0D1CB70];
  v11[2] = *MEMORY[0x1E0D1CA40];
  v11[3] = v4;
  v12[2] = CFSTR("city");
  v12[3] = CFSTR("subAdministrativeArea");
  v5 = *MEMORY[0x1E0D1CBC8];
  v11[4] = *MEMORY[0x1E0D1CB60];
  v11[5] = v5;
  v12[4] = CFSTR("state");
  v12[5] = CFSTR("postalCode");
  v11[6] = *MEMORY[0x1E0D1CA88];
  v12[6] = CFSTR("country");
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)countryCodeForCountryName:(id)a3
{
  void *v4;

  objc_msgSend(a1, "countryCodeByLookingUpCountryName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
  {

    objc_msgSend(a1, "countryCodeFromCurrentNetwork");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
    {

      objc_msgSend(a1, "countryCodeFromHomeNetwork");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
      {

        objc_msgSend(a1, "countryCodeFromCurrentLocale");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

+ (id)countryCodeByLookingUpCountryName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = *MEMORY[0x1E0C997B0];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v4, "displayNameForKey:value:", v9, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "compare:options:", v12, 129))
          {
            v13 = v11;

            goto LABEL_12;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)countryCodeFromCurrentNetwork
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = getCPPhoneNumberCopyNetworkCountryCodeSymbolLoc_ptr;
  v11 = getCPPhoneNumberCopyNetworkCountryCodeSymbolLoc_ptr;
  if (!getCPPhoneNumberCopyNetworkCountryCodeSymbolLoc_ptr)
  {
    v3 = (void *)AppSupportLibrary();
    v2 = dlsym(v3, "CPPhoneNumberCopyNetworkCountryCode");
    v9[3] = (uint64_t)v2;
    getCPPhoneNumberCopyNetworkCountryCodeSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    v7 = (_Unwind_Exception *)+[CNPostalAddressStringTokenizer countryCodeFromCurrentNetwork].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  v5 = (void *)((uint64_t (*)(uint64_t))v2)(v4);
  if (v5)
  {
    CFAutorelease(v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)countryCodeFromHomeNetwork
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = getCPPhoneNumberCopyHomeCountryCodeSymbolLoc_ptr;
  v11 = getCPPhoneNumberCopyHomeCountryCodeSymbolLoc_ptr;
  if (!getCPPhoneNumberCopyHomeCountryCodeSymbolLoc_ptr)
  {
    v3 = (void *)AppSupportLibrary();
    v2 = dlsym(v3, "CPPhoneNumberCopyHomeCountryCode");
    v9[3] = (uint64_t)v2;
    getCPPhoneNumberCopyHomeCountryCodeSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    v7 = (_Unwind_Exception *)+[CNPostalAddressStringTokenizer countryCodeFromCurrentNetwork].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  v5 = (void *)((uint64_t (*)(uint64_t))v2)(v4);
  if (v5)
  {
    CFAutorelease(v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)countryCodeFromCurrentLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)countryCodeFromCurrentNetwork
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[CNNameComponentsStringTokenizer initWithString:].cold.1(v0);
}

@end
