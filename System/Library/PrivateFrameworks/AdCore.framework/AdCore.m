void sub_1C998E480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id GetKeychainPropertyListForKey(void *a1, OSStatus *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v3 = a1;
  ADCopyDataFromKeychain(v3, a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (*a2)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %ld reading keychain data for %@"), *a2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdPersistenceLogging"), v7, 16);

LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = v15;
  v11 = v10;
  if (!v8)
  {
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Error deserializing data for %@: %@"), v3, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdPersistenceLogging"), v13, 16);

    goto LABEL_10;
  }
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Loaded dictionary for %@"), v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdPersistenceLogging"), v12, 0);

LABEL_11:
  return v8;
}

id ADCopyDataFromKeychain(void *a1, OSStatus *a2)
{
  id v3;
  void *v4;
  OSStatus v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  CFTypeRef result;

  v3 = a1;
  ADMakeMutableSecQuery(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7018]);
  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
  *a2 = v5;
  if (v5 || !result)
  {
    if (v5 == -25300)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No previous keychain records found for key %@."), v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %ld retrieving secure data for key %@"), v5, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 16;
    }
    _ADLog(CFSTR("iAdPersistenceLogging"), v8, v9);

    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(result);
  }

  return v6;
}

void sub_1C998EF54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C998F8A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C9990098(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C9990130(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _ADLog(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  char v16;

  v5 = a1;
  v6 = a2;
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v7, "hasSuffix:", CFSTR("Logging")))
  {
    objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v7, "length") - 7, 7, &stru_1E82B34E8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (_ADLog_onceToken != -1)
    dispatch_once(&_ADLog_onceToken, &__block_literal_global_161);
  if (_ADLog_internalBuild)
    v9 = a3;
  else
    v9 = 2;
  _ADLogQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ADLog_block_invoke_2;
  block[3] = &unk_1E82B2628;
  v16 = v9;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  dispatch_async(v10, block);

}

id _ADLogQueue()
{
  if (_ADLogQueue_onceToken != -1)
    dispatch_once(&_ADLogQueue_onceToken, &__block_literal_global_163);
  return (id)_ADLogQueue_loggingQueue;
}

uint64_t ADConfigurationResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  ADConfiguration *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(ADConfiguration);
          objc_msgSend((id)a1, "addTheConfiguration:", v17);
          if (PBReaderPlaceMark() && (ADConfigurationReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_34;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_34;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 16;
LABEL_34:
          v27 = *(void **)(a1 + v20);
          *(_QWORD *)(a1 + v20) = v19;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_36;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_38:
      *(_DWORD *)(a1 + 8) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ADConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  void *v34;
  uint64_t result;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_35;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_44:
          *(_DWORD *)(a1 + 32) = v22;
          continue;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          break;
        case 4u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
LABEL_35:
          v34 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 7u:
          *(_BYTE *)(a1 + 40) |= 1u;
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v38 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v38 = 0;
          }
          *(_QWORD *)(a1 + 8) = v38;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        v32 = v31 + 1;
        if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          break;
        v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v32;
        v29 |= (unint64_t)(v33 & 0x7F) << v27;
        if ((v33 & 0x80) == 0)
          goto LABEL_46;
        v27 += 7;
        v15 = v28++ >= 9;
        if (v15)
        {
          v29 = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        v29 = 0;
LABEL_48:
      *(_BYTE *)(a1 + 36) = v29 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C9992824(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ADAdsOptions()
{
  if (ADAdsOptions_once != -1)
    dispatch_once(&ADAdsOptions_once, &__block_literal_global_0);
  return (id)ADAdsOptions_sOptions;
}

void ADSaveToPromotedContentKeychain(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error archiving data: %@ for key: %@"), v5, v3);
    }
    else
    {
      v7 = ADWriteDataToKeychain(v3, v4);
      if (!(_DWORD)v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saved key: %@ keychain"), v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 0;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %d saving key: %@ to keychain"), v7, v3);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 16;
LABEL_8:
    _ADLog(CFSTR("iAdIDLogging"), v9, v10);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("value for key: %@ is nil. So not saving to keychain."), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdIDLogging"), v6, 16);

LABEL_9:
}

uint64_t ADWriteDataToKeychain(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFDictionary *v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  ADMakeMutableSecQuery(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x1E0CD68A0]);
  SecItemDelete((CFDictionaryRef)v5);
  if (v4)
  {
    ADMakeMutableSecQuery(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CD70D8];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD70D8]);
    v8 = SecItemAdd((CFDictionaryRef)v6, 0);
    v9 = v8;
    if ((_DWORD)v8)
    {
      if ((_DWORD)v8 == -25299)
      {
        ADMakeMutableSecQuery(v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectForKey:", *MEMORY[0x1E0CD6C98]);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v7);
        ADMakeMutableSecQuery(v3);
        v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        v9 = SecItemUpdate(v11, (CFDictionaryRef)v10);
        if ((_DWORD)v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to update keychain item %@. Error %d"), v3, v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog(CFSTR("iAdPersistenceLogging"), v12, 16);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %d checking for existence of keychain item %@"), v8, v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdPersistenceLogging"), v10, 16);
        v11 = (const __CFDictionary *)v5;
      }

      v5 = v11;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id ADMakeMutableSecQuery(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0C99E08];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("com.apple.iAdIDRecords"), *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD68A8], *MEMORY[0x1E0CD68A0]);
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD69B0]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD68F8]);

  return v3;
}

void _reachabilityDidChange(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _DWORD *v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Network reachability flags changed to 0x%x"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdInternalLogging"), v4, 0);

  v5 = 0;
  v7[10] = a2;
  if ((a2 & 2) != 0)
  {
    if ((a2 & 0x10000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Somehow we believe that 'apple.com' is local to the device. We do not yet have internet access."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("iAdInternalLogging"), v6, 16);

      v5 = 0;
    }
    else
    {
      v5 = 1;
    }
  }
  objc_msgSend(v7, "_updateStatus:", v5);

}

uint64_t ADClientSettingsResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  ADParameter *v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v22 = objc_alloc_init(ADParameter);
        objc_msgSend((id)a1, "addSearchLandingAdsSettingsParams:", v22);
      }
      else
      {
        if ((_DWORD)v18 != 2)
        {
          if ((_DWORD)v18 == 1)
          {
            *(_BYTE *)(a1 + 32) |= 1u;
            v19 = *v3;
            v20 = *(_QWORD *)(a2 + v19);
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
            {
              v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
              *(_QWORD *)(a2 + v19) = v20 + 8;
            }
            else
            {
              *(_BYTE *)(a2 + *v5) = 1;
              v21 = 0;
            }
            *(_QWORD *)(a1 + 8) = v21;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v22 = objc_alloc_init(ADParameter);
        objc_msgSend((id)a1, "addSearchAdsSettingsParams:", v22);
      }
      if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v22, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ADParameterReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ADAttributionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 88;
          goto LABEL_54;
        case 2u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 104;
          goto LABEL_54;
        case 3u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 56;
          goto LABEL_54;
        case 4u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 64;
          goto LABEL_54;
        case 5u:
          *(_BYTE *)(a1 + 124) |= 8u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v54 = 32;
          goto LABEL_88;
        case 6u:
          *(_BYTE *)(a1 + 124) |= 2u;
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v54 = 16;
          goto LABEL_88;
        case 7u:
          *(_BYTE *)(a1 + 124) |= 4u;
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v54 = 24;
          goto LABEL_88;
        case 8u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          *(_BYTE *)(a1 + 124) |= 0x80u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                v15 = v29++ >= 9;
                if (v15)
                {
                  v30 = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v30 = 0;
LABEL_68:
          *(_BYTE *)(a1 + 120) = v30 != 0;
          continue;
        case 9u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          *(_BYTE *)(a1 + 124) |= 0x40u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                v15 = v36++ >= 9;
                if (v15)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v37) = 0;
LABEL_72:
          v53 = 96;
          goto LABEL_77;
        case 0xAu:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 112;
          goto LABEL_54;
        case 0xBu:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 72;
          goto LABEL_54;
        case 0xCu:
          *(_BYTE *)(a1 + 124) |= 0x10u;
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v54 = 40;
          goto LABEL_88;
        case 0xDu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
LABEL_54:
          v44 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 0xEu:
          *(_BYTE *)(a1 + 124) |= 1u;
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          if (v46 <= 0xFFFFFFFFFFFFFFF7 && v46 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v46 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v54 = 8;
LABEL_88:
          *(_QWORD *)(a1 + v54) = v23;
          continue;
        case 0xFu:
          v47 = 0;
          v48 = 0;
          v37 = 0;
          *(_BYTE *)(a1 + 124) |= 0x20u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v49 = *v3;
        v50 = *(_QWORD *)(a2 + v49);
        v51 = v50 + 1;
        if (v50 == -1 || v51 > *(_QWORD *)(a2 + *v4))
          break;
        v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
        *(_QWORD *)(a2 + v49) = v51;
        v37 |= (unint64_t)(v52 & 0x7F) << v47;
        if ((v52 & 0x80) == 0)
          goto LABEL_74;
        v47 += 7;
        v15 = v48++ >= 9;
        if (v15)
        {
          LODWORD(v37) = 0;
          goto LABEL_76;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_74:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v37) = 0;
LABEL_76:
      v53 = 80;
LABEL_77:
      *(_DWORD *)(a1 + v53) = v37;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ADUserTransparencyResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ADTransparencyDetails *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ADTransparencyDetails);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !ADTransparencyDetailsReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ADLogAnalyticsRequestReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  ADAnalyticsEvent *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_23;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_23;
      case 3u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_23;
      case 4u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_23:
        v19 = *(ADAnalyticsEvent **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;
        goto LABEL_24;
      case 0xAu:
        v19 = objc_alloc_init(ADAnalyticsEvent);
        objc_msgSend(a1, "addEvents:", v19);
        if (PBReaderPlaceMark() && (ADAnalyticsEventReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_24:

LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_25;
    }
  }
}

__CFString *ADJingleAccountStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 3)
    return off_1E82B1D08[a1 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1C999AAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

BOOL ADTransparencyDetailsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C999B730(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C999BAC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADClientSettingsRequestReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  ADParameter *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        v19 = objc_alloc_init(ADParameter);
        objc_msgSend(a1, "addCurrentSettingParams:", v19);
LABEL_24:
        if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v19, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (ADParameter *)a1[3];
        a1[3] = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(ADParameter);
    objc_msgSend(a1, "addCurrentSearchLandingAdsSettingParams:", v19);
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ClientTypeToString(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (ClientTypeToString_onceToken != -1)
    dispatch_once(&ClientTypeToString_onceToken, &__block_literal_global_5);
  v2 = (void *)ClientTypeToString_strings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1C999E264(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C999E300(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C999E8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1C999EB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ADOptOutRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  void *v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
          goto LABEL_39;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
          break;
        case 3u:
          *(_BYTE *)(a1 + 48) |= 2u;
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v37 = 16;
          goto LABEL_48;
        case 4u:
          *(_BYTE *)(a1 + 48) |= 1u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v37 = 8;
LABEL_48:
          *(_QWORD *)(a1 + v37) = v30;
          continue;
        case 5u:
          *(_BYTE *)(a1 + 48) |= 4u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v35 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v35 = 0;
          }
          *(_DWORD *)(a1 + 40) = v35;
          continue;
        case 6u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
LABEL_39:
          v36 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        v26 = v25 + 1;
        if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          break;
        v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v26;
        v23 |= (unint64_t)(v27 & 0x7F) << v21;
        if ((v27 & 0x80) == 0)
          goto LABEL_41;
        v21 += 7;
        v15 = v22++ >= 9;
        if (v15)
        {
          v23 = 0;
          goto LABEL_43;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_43:
      *(_BYTE *)(a1 + 44) = v23 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C99A00FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99A023C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99A06A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99A091C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADKeyedParameterListReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  ADParameter *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (ADParameter *)a1[1];
        a1[1] = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(ADParameter);
    objc_msgSend(a1, "addParameterList:", v18);
    if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C99A196C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ADAnalyticsEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 3)
      {
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v28 = 0;
        }
        *(_QWORD *)(a1 + 8) = v28;
      }
      else if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          v24 = v23 + 1;
          if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0)
            goto LABEL_33;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ADSegmentUpdateRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  void *v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        v17 = v10 & 7;
        if (!v16 && v17 != 4)
        {
          switch((v10 >> 3))
          {
            case 2u:
              PBReaderReadData();
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = 120;
              goto LABEL_51;
            case 3u:
              PBReaderReadString();
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = 144;
              goto LABEL_51;
            case 4u:
              v21 = 0;
              v22 = 0;
              v23 = 0;
              *(_BYTE *)(a1 + 160) |= 0x10u;
              while (2)
              {
                v24 = *v3;
                v25 = *(_QWORD *)(a2 + v24);
                v26 = v25 + 1;
                if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
                  *(_QWORD *)(a2 + v24) = v26;
                  v23 |= (unint64_t)(v27 & 0x7F) << v21;
                  if (v27 < 0)
                  {
                    v21 += 7;
                    v15 = v22++ >= 9;
                    if (v15)
                    {
                      v23 = 0;
                      goto LABEL_95;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v23 = 0;
LABEL_95:
              *(_BYTE *)(a1 + 156) = v23 != 0;
              goto LABEL_130;
            case 5u:
              PBReaderReadString();
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = 96;
LABEL_51:
              v43 = *(void **)(a1 + v20);
              *(_QWORD *)(a1 + v20) = v19;

              goto LABEL_130;
            case 6u:
            case 7u:
LABEL_22:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_130;
              return 0;
            case 8u:
              *(_BYTE *)(a1 + 160) |= 1u;
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
                *(_QWORD *)(a2 + v28) = v29 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v30 = 0;
              }
              v86 = 80;
              goto LABEL_127;
            case 9u:
              *(_BYTE *)(a1 + 160) |= 2u;
              v31 = *v3;
              v32 = *(_QWORD *)(a2 + v31);
              if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
                *(_QWORD *)(a2 + v31) = v32 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v30 = 0;
              }
              v86 = 88;
LABEL_127:
              *(_QWORD *)(a1 + v86) = v30;
              goto LABEL_130;
            case 0xAu:
              *(_BYTE *)(a1 + 160) |= 8u;
              v33 = *v3;
              v34 = *(_QWORD *)(a2 + v33);
              if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v35 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v34);
                *(_QWORD *)(a2 + v33) = v34 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v35 = 0;
              }
              *(_DWORD *)(a1 + 152) = v35;
              goto LABEL_130;
            case 0xBu:
              v36 = 0;
              v37 = 0;
              v38 = 0;
              *(_BYTE *)(a1 + 160) |= 4u;
              while (2)
              {
                v39 = *v3;
                v40 = *(_QWORD *)(a2 + v39);
                v41 = v40 + 1;
                if (v40 == -1 || v41 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
                  *(_QWORD *)(a2 + v39) = v41;
                  v38 |= (unint64_t)(v42 & 0x7F) << v36;
                  if (v42 < 0)
                  {
                    v36 += 7;
                    v15 = v37++ >= 9;
                    if (v15)
                    {
                      LODWORD(v38) = 0;
                      goto LABEL_99;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v38) = 0;
LABEL_99:
              *(_DWORD *)(a1 + 104) = v38;
              goto LABEL_130;
            default:
              switch((v10 >> 3))
              {
                case '\'':
                  PBReaderReadString();
                  v19 = objc_claimAutoreleasedReturnValue();
                  v20 = 136;
                  goto LABEL_51;
                case '(':
                  PBReaderReadString();
                  v19 = objc_claimAutoreleasedReturnValue();
                  v20 = 128;
                  goto LABEL_51;
                case ')':
                  PBReaderReadData();
                  v19 = objc_claimAutoreleasedReturnValue();
                  v20 = 112;
                  goto LABEL_51;
                case '*':
                  if (v17 != 2)
                  {
                    v65 = 0;
                    v66 = 0;
                    v67 = 0;
                    while (1)
                    {
                      v68 = *v3;
                      v69 = *(_QWORD *)(a2 + v68);
                      v70 = v69 + 1;
                      if (v69 == -1 || v70 > *(_QWORD *)(a2 + *v4))
                        goto LABEL_121;
                      v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
                      *(_QWORD *)(a2 + v68) = v70;
                      v67 |= (unint64_t)(v71 & 0x7F) << v65;
                      if (v71 < 0)
                      {
                        v65 += 7;
                        v15 = v66++ >= 9;
                        if (!v15)
                          continue;
                      }
                      goto LABEL_122;
                    }
                  }
                  result = PBReaderPlaceMark();
                  if (!(_DWORD)result)
                    return result;
                  while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                  {
                    v44 = 0;
                    v45 = 0;
                    v46 = 0;
                    while (1)
                    {
                      v47 = *v3;
                      v48 = *(_QWORD *)(a2 + v47);
                      v49 = v48 + 1;
                      if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
                        break;
                      v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
                      *(_QWORD *)(a2 + v47) = v49;
                      v46 |= (unint64_t)(v50 & 0x7F) << v44;
                      if (v50 < 0)
                      {
                        v44 += 7;
                        v15 = v45++ >= 9;
                        if (!v15)
                          continue;
                      }
                      goto LABEL_64;
                    }
                    *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
                    PBRepeatedInt32Add();
                  }
                  goto LABEL_91;
                case '+':
                  if (v17 != 2)
                  {
                    v72 = 0;
                    v73 = 0;
                    v74 = 0;
                    while (1)
                    {
                      v75 = *v3;
                      v76 = *(_QWORD *)(a2 + v75);
                      v77 = v76 + 1;
                      if (v76 == -1 || v77 > *(_QWORD *)(a2 + *v4))
                        goto LABEL_121;
                      v78 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v76);
                      *(_QWORD *)(a2 + v75) = v77;
                      v74 |= (unint64_t)(v78 & 0x7F) << v72;
                      if (v78 < 0)
                      {
                        v72 += 7;
                        v15 = v73++ >= 9;
                        if (!v15)
                          continue;
                      }
                      goto LABEL_122;
                    }
                  }
                  result = PBReaderPlaceMark();
                  if (!(_DWORD)result)
                    return result;
                  while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                  {
                    v51 = 0;
                    v52 = 0;
                    v53 = 0;
                    while (1)
                    {
                      v54 = *v3;
                      v55 = *(_QWORD *)(a2 + v54);
                      v56 = v55 + 1;
                      if (v55 == -1 || v56 > *(_QWORD *)(a2 + *v4))
                        break;
                      v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v55);
                      *(_QWORD *)(a2 + v54) = v56;
                      v53 |= (unint64_t)(v57 & 0x7F) << v51;
                      if (v57 < 0)
                      {
                        v51 += 7;
                        v15 = v52++ >= 9;
                        if (!v15)
                          continue;
                      }
                      goto LABEL_77;
                    }
                    *(_BYTE *)(a2 + *v5) = 1;
LABEL_77:
                    PBRepeatedInt32Add();
                  }
                  goto LABEL_91;
                case ',':
                  if (v17 == 2)
                  {
                    result = PBReaderPlaceMark();
                    if (!(_DWORD)result)
                      return result;
                    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                    {
                      v58 = 0;
                      v59 = 0;
                      v60 = 0;
                      while (1)
                      {
                        v61 = *v3;
                        v62 = *(_QWORD *)(a2 + v61);
                        v63 = v62 + 1;
                        if (v62 == -1 || v63 > *(_QWORD *)(a2 + *v4))
                          break;
                        v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
                        *(_QWORD *)(a2 + v61) = v63;
                        v60 |= (unint64_t)(v64 & 0x7F) << v58;
                        if (v64 < 0)
                        {
                          v58 += 7;
                          v15 = v59++ >= 9;
                          if (!v15)
                            continue;
                        }
                        goto LABEL_90;
                      }
                      *(_BYTE *)(a2 + *v5) = 1;
LABEL_90:
                      PBRepeatedInt32Add();
                    }
LABEL_91:
                    PBReaderRecallMark();
                  }
                  else
                  {
                    v79 = 0;
                    v80 = 0;
                    v81 = 0;
                    while (1)
                    {
                      v82 = *v3;
                      v83 = *(_QWORD *)(a2 + v82);
                      v84 = v83 + 1;
                      if (v83 == -1 || v84 > *(_QWORD *)(a2 + *v4))
                        break;
                      v85 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v83);
                      *(_QWORD *)(a2 + v82) = v84;
                      v81 |= (unint64_t)(v85 & 0x7F) << v79;
                      if (v85 < 0)
                      {
                        v79 += 7;
                        v15 = v80++ >= 9;
                        if (!v15)
                          continue;
                      }
                      goto LABEL_122;
                    }
LABEL_121:
                    *(_BYTE *)(a2 + *v5) = 1;
LABEL_122:
                    PBRepeatedInt32Add();
                  }
LABEL_130:
                  if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                    return *(_BYTE *)(a2 + *v5) == 0;
                  continue;
                default:
                  goto LABEL_22;
              }
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C99A4CFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99A4D58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADSettingsReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  ADParameter *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (ADParameter *)a1[1];
        a1[1] = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(ADParameter);
    objc_msgSend(a1, "addParameters:", v18);
    if (!PBReaderPlaceMark() || !ADParameterReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ADConfigurationRequestReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ADConfiguration *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ADConfiguration);
        objc_msgSend(a1, "addCurrentConfiguration:", v17);
        if (!PBReaderPlaceMark() || (ADConfigurationReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = (ADConfiguration *)a1[2];
    a1[2] = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SetKeychainPropertyListForKey(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v13;

  v3 = a1;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_msgSend(v5, "code");
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Error serializing property list. Error %lu.\n%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdIDLogging"), v10, 16);

    v11 = 4294899602;
LABEL_5:

    goto LABEL_6;
  }
  v11 = ADWriteDataToKeychain(v3, v4);
  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error saving data to keychain: %d"), v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v9, 16);
    goto LABEL_5;
  }
LABEL_6:

  return v11;
}

id ADEncryptString(void *a1)
{
  id v1;
  void *v2;
  size_t v3;
  id v4;
  const uint8_t *v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (ADEncryptString_onceToken != -1)
    dispatch_once(&ADEncryptString_onceToken, &__block_literal_global_13);
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v4 = objc_retainAutorelease(v2);
  v5 = (const uint8_t *)objc_msgSend(v4, "bytes");
  v6 = (uint8_t *)malloc_type_calloc(ADEncryptString_cipherBufferSize, 1uLL, 0x100004077774924uLL);
  v7 = SecKeyEncrypt((SecKeyRef)ADEncryptString_adServerKeyRef, 1u, v5, v3, v6, (size_t *)&ADEncryptString_cipherBufferSize);
  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to encrypt string with result %d."), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v8, 16);

    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, ADEncryptString_cipherBufferSize);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  free(v6);

  return v9;
}

const __CFString *ADAdConnectionGetStringForValue(unsigned int a1)
{
  if (a1 > 0xA)
    return CFSTR("<BADVALUE>");
  else
    return off_1E82B2210[a1];
}

__CFString *dumpObject(void *a1)
{
  id v1;
  void *v2;
  objc_class *v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *j;
  void *v24;
  objc_property_t *v25;
  objc_property_t *v26;
  unint64_t k;
  void *v28;
  void *v29;
  objc_class *v31;
  id v32;
  objc_property_t *v33;
  void *v34;
  unsigned int v35;
  unsigned int outCount;

  v1 = a1;
  if (!v1)
  {
    v22 = CFSTR("(null)");
    goto LABEL_51;
  }
  v32 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v1;
  v3 = (objc_class *)objc_opt_class();
  for (i = objc_opt_class(); ; i = objc_opt_class())
  {
    if (v3 == (objc_class *)i)
    {
      objc_msgSend(v2, "AD_jsonString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "mutableCopy");

      v21 = (void *)v20;
      goto LABEL_50;
    }
    outCount = 0;
    v31 = v3;
    v33 = class_copyPropertyList(v3, &outCount);
    if (outCount)
    {
      v5 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v33[v5]));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "valueForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v8 = v7;
          goto LABEL_9;
        }
        if (!v7)
          break;
        if (v7 != (void *)-[objc_class superclass](v31, "superclass")
          && (objc_msgSend(v6, "isEqualToString:", CFSTR("superclass")) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "AD_dictionaryForJSON");
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "AD_arrayForJSON");
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "AD_dataStringForJSON");
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          NSClassFromString(CFSTR("NSBlock"));
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7);
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
            v9 = v8;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found an object that could not be converted to JSON: %@ (%@)"), v7, objc_opt_class());
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              _ADLog(CFSTR("ToroLogging"), v18, 0);

              v17 = 1;
              goto LABEL_34;
            }
            objc_msgSend(v7, "dictionaryRepresentation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "AD_dictionaryForJSON");
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
LABEL_10:
          v10 = 1;
          while (1)
          {
            objc_msgSend(v2, "objectForKey:", v6);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v11)
              break;
            objc_msgSend(v2, "objectForKey:", v6);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqual:", v9);

            if ((v13 & 1) != 0)
              break;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: There are multiple properties in this object with the same name... (%@)"), v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog(CFSTR("ToroLogging"), v14, 0);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), v6, v10);
            v15 = objc_claimAutoreleasedReturnValue();

            v10 = (v10 + 1);
            v6 = (void *)v15;
          }
          objc_msgSend(v2, "setObject:forKey:", v9, v6);
          goto LABEL_15;
        }
        v9 = 0;
LABEL_15:

        if (++v5 >= (unint64_t)outCount)
          goto LABEL_33;
      }
      v9 = CFSTR("(null)");
      goto LABEL_10;
    }
LABEL_33:
    v17 = 0;
LABEL_34:
    if (v33 && outCount)
      free(v33);
    if (v17)
      break;
    v3 = (objc_class *)-[objc_class superclass](v31, "superclass");
  }
  for (j = (void *)objc_opt_class(); j != (void *)objc_opt_class(); j = (void *)objc_msgSend(j, "superclass"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", class_getName((Class)j));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "appendFormat:", CFSTR("--- %@ ---\n"), v24);

    v35 = 0;
    v25 = class_copyPropertyList((Class)j, &v35);
    if (v35)
    {
      v26 = v25;
      for (k = 0; k < v35; ++k)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v26[k]));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "valueForKey:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "appendFormat:", CFSTR("%@: %@\n"), v28, v29);

      }
      if (v35)
        free(v26);
    }
  }
  v21 = v32;
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v21);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v1 = v34;
LABEL_51:

  return v22;
}

void sub_1C99A6B54()
{
  objc_end_catch();
  JUMPOUT(0x1C99A6B5CLL);
}

uint64_t RequestRetryDelay(uint64_t a1)
{
  if (((a1 - 2) & (a1 - 1)) != 0)
    return 0;
  else
    return 30;
}

void takeXPCTransaction(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  _TransactionQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __takeXPCTransaction_block_invoke;
  block[3] = &unk_1E82B1FD8;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

id _TransactionQueue()
{
  if (_TransactionQueue_onceToken != -1)
    dispatch_once(&_TransactionQueue_onceToken, &__block_literal_global_113);
  return (id)_TransactionQueue___queue;
}

void __takeXPCTransaction_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  _TransactionsByReason();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    _TransactionsByReason();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v4 = (void *)os_transaction_create();
  objc_msgSend(v5, "addObject:", v4);

}

id _TransactionsByReason()
{
  if (_TransactionsByReason_onceToken != -1)
    dispatch_once(&_TransactionsByReason_onceToken, &__block_literal_global_115);
  return (id)_TransactionsByReason___transactions;
}

void releaseXPCTransaction(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  _TransactionQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __releaseXPCTransaction_block_invoke;
  block[3] = &unk_1E82B1FD8;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

void __releaseXPCTransaction_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  _TransactionsByReason();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "removeLastObject");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("****** imbalanced transactions for reason '%@' -- please file a radar ******"), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("LATDLogging"), v3, 0);

  }
}

BOOL StringMatch(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  _BOOL8 v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  char v14[256];
  regex_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  v5 = objc_msgSend(v3, "UTF8String");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v8 = 0;
  if (v5 && v7)
  {
    memset(&v15, 0, sizeof(v15));
    if (regcomp(&v15, v7, 7))
    {
      MEMORY[0x1E0C80A78]();
      regerror(0, &v15, v14, 0xFFuLL);
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("[%s]: Error %d compiling regular expression pattern '%s' - %@"), "BOOL StringMatch(NSString *__strong, NSString *__strong)", 0, v7, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("iAdInternalLogging"), v13, 0);

      memset(&v15, 0, sizeof(v15));
      v8 = 0;
    }
    else
    {
      v9 = regexec(&v15, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), 0, 0, 2);
      MEMORY[0x1CAA463B4](&v15);
      v8 = v9 == 0;
    }
  }

  return v8;
}

id StringIsUUID(void *a1)
{
  id result;
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  result = a1;
  if (result)
  {
    v2 = result;
    if (objc_msgSend(result, "hasPrefix:", CFSTR("DPID-")))
    {
      objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("DPID-"), &stru_1E82B34E8);
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    v4 = StringMatch(v2, CFSTR("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"));

    return (id)v4;
  }
  return result;
}

BOOL StringIsFromUUID(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  _BOOL8 v4;

  if (!a1)
    return 0;
  v1 = (objc_class *)MEMORY[0x1E0CB3A28];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithUUIDString:", v2);

  v4 = v3 != 0;
  return v4;
}

BOOL StringIsZeroUUID(void *a1)
{
  return StringMatch(a1, CFSTR("^[0]{8}-[0]{4}-[0]{4}-[0]{4}-[0]{12}"));
}

void ADSimulateCrash(uint64_t a1, void *a2, int a3)
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdInternalLogging"), v4, 16);

  getpid();
  SimulateCrash();
  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "unitTesting");

  if ((_DWORD)v4)
    v6 = 1;
  else
    v6 = a3 == 0;
  if (!v6)
    exit(1);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We should exit at this point. If you see this log outside of the Unit Tests, Please file a radar..."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v7, 16);

  }
}

void sub_1C99A7660(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1C99A784C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99A7978(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99A7B20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADLogAnalyticsResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_1C99AA7FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99AA854(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99AA8C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99AA92C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99AA984(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99AABE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1C99AACF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ADOptOutResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t ADUserTargetingPropertiesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  ADParameter *v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t result;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  void *v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char v95;
  char v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  uint64_t v102;
  BOOL v103;
  uint64_t v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  char v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  uint64_t v126;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    v17 = v10 & 7;
    if (v16 || v17 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        *(_WORD *)(a1 + 348) |= 1u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 80) = v21;
        goto LABEL_132;
      case 2u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 112;
        goto LABEL_131;
      case 3u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 184;
        goto LABEL_131;
      case 4u:
        *(_WORD *)(a1 + 348) |= 0x200u;
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v126 = 320;
        goto LABEL_218;
      case 5u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_WORD *)(a1 + 348) |= 0x100u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_158:
        v102 = 288;
        goto LABEL_184;
      case 6u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 120;
        goto LABEL_131;
      case 7u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 264;
        goto LABEL_131;
      case 8u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 216;
        goto LABEL_131;
      case 9u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 240;
        goto LABEL_131;
      case 0xAu:
        PBReaderReadString();
        v34 = (ADParameter *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend((id)a1, "addUserKeyboard:", v34);
        goto LABEL_88;
      case 0xBu:
        v35 = 0;
        v36 = 0;
        v29 = 0;
        *(_WORD *)(a1 + 348) |= 4u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v29 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v15 = v36++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_162;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_162:
        v102 = 128;
        goto LABEL_184;
      case 0xCu:
        if (v17 != 2)
        {
          v105 = 0;
          v106 = 0;
          v107 = 0;
          while (1)
          {
            v108 = *v3;
            v109 = *(_QWORD *)(a2 + v108);
            v110 = v109 + 1;
            if (v109 == -1 || v110 > *(_QWORD *)(a2 + *v4))
              goto LABEL_206;
            v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v109);
            *(_QWORD *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              v15 = v106++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_207;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v42 = 0;
          v43 = 0;
          v44 = 0;
          while (1)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
              break;
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v44 |= (unint64_t)(v48 & 0x7F) << v42;
            if (v48 < 0)
            {
              v42 += 7;
              v15 = v43++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_59;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_59:
          PBRepeatedInt32Add();
        }
        goto LABEL_147;
      case 0xDu:
        if (v17 != 2)
        {
          v112 = 0;
          v113 = 0;
          v114 = 0;
          while (1)
          {
            v115 = *v3;
            v116 = *(_QWORD *)(a2 + v115);
            v117 = v116 + 1;
            if (v116 == -1 || v117 > *(_QWORD *)(a2 + *v4))
              goto LABEL_206;
            v118 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v116);
            *(_QWORD *)(a2 + v115) = v117;
            v114 |= (unint64_t)(v118 & 0x7F) << v112;
            if (v118 < 0)
            {
              v112 += 7;
              v15 = v113++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_207;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v49 = 0;
          v50 = 0;
          v51 = 0;
          while (1)
          {
            v52 = *v3;
            v53 = *(_QWORD *)(a2 + v52);
            v54 = v53 + 1;
            if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
              break;
            v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v54;
            v51 |= (unint64_t)(v55 & 0x7F) << v49;
            if (v55 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_72;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_72:
          PBRepeatedInt32Add();
        }
        goto LABEL_147;
      case 0xEu:
        *(_WORD *)(a1 + 348) |= 0x20u;
        v56 = *v3;
        v57 = *(_QWORD *)(a2 + v56);
        if (v57 <= 0xFFFFFFFFFFFFFFFBLL && v57 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v57);
          *(_QWORD *)(a2 + v56) = v57 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v126 = 232;
        goto LABEL_218;
      case 0xFu:
        *(_WORD *)(a1 + 348) |= 0x40u;
        v58 = *v3;
        v59 = *(_QWORD *)(a2 + v58);
        if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v59);
          *(_QWORD *)(a2 + v58) = v59 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v126 = 256;
        goto LABEL_218;
      case 0x10u:
        *(_WORD *)(a1 + 348) |= 0x10u;
        v60 = *v3;
        v61 = *(_QWORD *)(a2 + v60);
        if (v61 <= 0xFFFFFFFFFFFFFFFBLL && v61 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v61);
          *(_QWORD *)(a2 + v60) = v61 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v126 = 200;
LABEL_218:
        *(_DWORD *)(a1 + v126) = v26;
        goto LABEL_132;
      case 0x11u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 224;
        goto LABEL_131;
      case 0x14u:
        v34 = objc_alloc_init(ADParameter);
        objc_msgSend((id)a1, "addTargeting:", v34);
        if (PBReaderPlaceMark() && ADParameterReadFrom((uint64_t)v34, a2))
        {
          PBReaderRecallMark();
LABEL_88:

LABEL_132:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0x15u:
        v62 = 0;
        v63 = 0;
        v64 = 0;
        *(_WORD *)(a1 + 348) |= 0x800u;
        while (2)
        {
          v65 = *v3;
          v66 = *(_QWORD *)(a2 + v65);
          v67 = v66 + 1;
          if (v66 == -1 || v67 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
            *(_QWORD *)(a2 + v65) = v67;
            v64 |= (unint64_t)(v68 & 0x7F) << v62;
            if (v68 < 0)
            {
              v62 += 7;
              v15 = v63++ >= 9;
              if (v15)
              {
                v64 = 0;
                goto LABEL_166;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v64 = 0;
LABEL_166:
        v103 = v64 != 0;
        v104 = 345;
        goto LABEL_175;
      case 0x16u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 328;
        goto LABEL_131;
      case 0x17u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 208;
        goto LABEL_131;
      case 0x18u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 104;
        goto LABEL_131;
      case 0x19u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 176;
        goto LABEL_131;
      case 0x1Au:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 280;
        goto LABEL_131;
      case 0x1Bu:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 88;
        goto LABEL_131;
      case 0x1Cu:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 248;
        goto LABEL_131;
      case 0x1Du:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 304;
        goto LABEL_131;
      case 0x1Eu:
        v69 = 0;
        v70 = 0;
        v29 = 0;
        *(_WORD *)(a1 + 348) |= 2u;
        while (2)
        {
          v71 = *v3;
          v72 = *(_QWORD *)(a2 + v71);
          v73 = v72 + 1;
          if (v72 == -1 || v73 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
            *(_QWORD *)(a2 + v71) = v73;
            v29 |= (unint64_t)(v74 & 0x7F) << v69;
            if (v74 < 0)
            {
              v69 += 7;
              v15 = v70++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_170:
        v102 = 96;
        goto LABEL_184;
      case 0x1Fu:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 192;
        goto LABEL_131;
      case 0x20u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 144;
        goto LABEL_131;
      case 0x21u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 136;
        goto LABEL_131;
      case 0x22u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 168;
        goto LABEL_131;
      case 0x23u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 160;
        goto LABEL_131;
      case 0x24u:
        v75 = 0;
        v76 = 0;
        v77 = 0;
        *(_WORD *)(a1 + 348) |= 0x400u;
        while (2)
        {
          v78 = *v3;
          v79 = *(_QWORD *)(a2 + v78);
          v80 = v79 + 1;
          if (v79 == -1 || v80 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v79);
            *(_QWORD *)(a2 + v78) = v80;
            v77 |= (unint64_t)(v81 & 0x7F) << v75;
            if (v81 < 0)
            {
              v75 += 7;
              v15 = v76++ >= 9;
              if (v15)
              {
                v77 = 0;
                goto LABEL_174;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v77 = 0;
LABEL_174:
        v103 = v77 != 0;
        v104 = 344;
LABEL_175:
        *(_BYTE *)(a1 + v104) = v103;
        goto LABEL_132;
      case 0x25u:
        v82 = 0;
        v83 = 0;
        v29 = 0;
        *(_WORD *)(a1 + 348) |= 8u;
        while (2)
        {
          v84 = *v3;
          v85 = *(_QWORD *)(a2 + v84);
          v86 = v85 + 1;
          if (v85 == -1 || v86 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v87 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v85);
            *(_QWORD *)(a2 + v84) = v86;
            v29 |= (unint64_t)(v87 & 0x7F) << v82;
            if (v87 < 0)
            {
              v82 += 7;
              v15 = v83++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_179;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_179:
        v102 = 152;
        goto LABEL_184;
      case 0x26u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 296;
LABEL_131:
        v88 = *(void **)(a1 + v23);
        *(_QWORD *)(a1 + v23) = v22;

        goto LABEL_132;
      case 0x27u:
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v89 = 0;
            v90 = 0;
            v91 = 0;
            while (1)
            {
              v92 = *v3;
              v93 = *(_QWORD *)(a2 + v92);
              v94 = v93 + 1;
              if (v93 == -1 || v94 > *(_QWORD *)(a2 + *v4))
                break;
              v95 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v93);
              *(_QWORD *)(a2 + v92) = v94;
              v91 |= (unint64_t)(v95 & 0x7F) << v89;
              if (v95 < 0)
              {
                v89 += 7;
                v15 = v90++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_146;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_146:
            PBRepeatedInt32Add();
          }
LABEL_147:
          PBReaderRecallMark();
        }
        else
        {
          v119 = 0;
          v120 = 0;
          v121 = 0;
          while (1)
          {
            v122 = *v3;
            v123 = *(_QWORD *)(a2 + v122);
            v124 = v123 + 1;
            if (v123 == -1 || v124 > *(_QWORD *)(a2 + *v4))
              break;
            v125 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v123);
            *(_QWORD *)(a2 + v122) = v124;
            v121 |= (unint64_t)(v125 & 0x7F) << v119;
            if (v125 < 0)
            {
              v119 += 7;
              v15 = v120++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_207;
          }
LABEL_206:
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_207:
          PBRepeatedInt32Add();
        }
        goto LABEL_132;
      case 0x28u:
        v96 = 0;
        v97 = 0;
        v29 = 0;
        *(_WORD *)(a1 + 348) |= 0x80u;
        while (2)
        {
          v98 = *v3;
          v99 = *(_QWORD *)(a2 + v98);
          v100 = v99 + 1;
          if (v99 == -1 || v100 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v101 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v99);
            *(_QWORD *)(a2 + v98) = v100;
            v29 |= (unint64_t)(v101 & 0x7F) << v96;
            if (v101 < 0)
            {
              v96 += 7;
              v15 = v97++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_183;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_183:
        v102 = 272;
LABEL_184:
        *(_DWORD *)(a1 + v102) = v29;
        goto LABEL_132;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_132;
    }
  }
}

uint64_t ADSponsoredSearchRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t result;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  BOOL v62;
  uint64_t v63;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = 0x1E82B1000uLL;
    v8 = 0x1EF922000uLL;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v3;
        v14 = *(_QWORD *)(a2 + v13);
        if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
          break;
        v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
        *(_QWORD *)(a2 + v13) = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_12;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v17 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v12 = 0;
LABEL_14:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v19 = v8;
          v20 = v7;
          v21 = objc_alloc_init(*(Class *)(v7 + 1392));
          objc_storeStrong((id *)(a1 + 24), v21);
          if (PBReaderPlaceMark() && (ADUserTargetingPropertiesReadFrom((uint64_t)v21, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            v7 = v20;
            v8 = v19;
            continue;
          }

          return 0;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          *(_BYTE *)(a1 + *(int *)(v8 + 3596)) |= 0x20u;
          while (1)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
              break;
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if ((v28 & 0x80) == 0)
              goto LABEL_71;
            v23 += 7;
            v16 = v24++ >= 9;
            if (v16)
            {
              v25 = 0;
              goto LABEL_73;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_71:
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_73:
          v62 = v25 != 0;
          v63 = 52;
          goto LABEL_94;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *(_BYTE *)(a1 + *(int *)(v8 + 3596)) |= 0x10u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v33);
              *(_QWORD *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v16 = v30++ >= 9;
                if (v16)
                {
                  v31 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v31 = 0;
LABEL_77:
          v62 = v31 != 0;
          v63 = 51;
          goto LABEL_94;
        case 4u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          *(_BYTE *)(a1 + *(int *)(v8 + 3596)) |= 4u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v16 = v36++ >= 9;
                if (v16)
                {
                  v37 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v37 = 0;
LABEL_81:
          v62 = v37 != 0;
          v63 = 49;
          goto LABEL_94;
        case 5u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_BYTE *)(a1 + *(int *)(v8 + 3596)) |= 1u;
          while (2)
          {
            v44 = *v3;
            v45 = *(_QWORD *)(a2 + v44);
            if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v45);
              *(_QWORD *)(a2 + v44) = v45 + 1;
              v43 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                v16 = v42++ >= 9;
                if (v16)
                {
                  LODWORD(v43) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v43) = 0;
LABEL_85:
          *(_DWORD *)(a1 + 32) = v43;
          continue;
        case 6u:
          PBReaderReadString();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = 16;
          goto LABEL_55;
        case 7u:
          PBReaderReadString();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = 40;
          goto LABEL_55;
        case 8u:
          PBReaderReadString();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = 8;
LABEL_55:
          v49 = *(void **)(a1 + v48);
          *(_QWORD *)(a1 + v48) = v47;

          continue;
        case 9u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_BYTE *)(a1 + *(int *)(v8 + 3596)) |= 8u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v16 = v51++ >= 9;
                if (v16)
                {
                  v52 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v52 = 0;
LABEL_89:
          v62 = v52 != 0;
          v63 = 50;
          goto LABEL_94;
        case 0xAu:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_BYTE *)(a1 + *(int *)(v8 + 3596)) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v59 = *v3;
        v60 = *(_QWORD *)(a2 + v59);
        if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
          break;
        v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v60);
        *(_QWORD *)(a2 + v59) = v60 + 1;
        v58 |= (unint64_t)(v61 & 0x7F) << v56;
        if ((v61 & 0x80) == 0)
          goto LABEL_91;
        v56 += 7;
        v16 = v57++ >= 9;
        if (v16)
        {
          v58 = 0;
          goto LABEL_93;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_91:
      if (*(_BYTE *)(a2 + *v5))
        v58 = 0;
LABEL_93:
      v62 = v58 != 0;
      v63 = 48;
LABEL_94:
      *(_BYTE *)(a1 + v63) = v62;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ADAttributionResponseReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ADKeyedParameterList *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ADKeyedParameterList);
        objc_msgSend(a1, "addVersionedAttributionDetails:", v17);
        if (!PBReaderPlaceMark() || !ADKeyedParameterListReadFrom(v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ADUserTransparencyRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  BOOL v33;
  uint64_t v34;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_26;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_26;
        case 4u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_26;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_26:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 6u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 52) |= 2u;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (v14)
                {
                  v23 = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_44:
          v33 = v23 != 0;
          v34 = 49;
          goto LABEL_49;
        case 7u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 52) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_46;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          v29 = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        v29 = 0;
LABEL_48:
      v33 = v29 != 0;
      v34 = 48;
LABEL_49:
      *(_BYTE *)(a1 + v34) = v33;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ADSegmentUpdateResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v27 = 8;
      }
      else
      {
        if ((_DWORD)v18 != 3)
        {
          if ((_DWORD)v18 == 2)
          {
            PBReaderReadString();
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = *(void **)(a1 + 24);
            *(_QWORD *)(a1 + 24) = v19;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        *(_BYTE *)(a1 + 32) |= 2u;
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v27 = 16;
      }
      *(_QWORD *)(a1 + v27) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void ADLogBarrier()
{
  NSObject *v0;

  _ADLogQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_sync(v0, &__block_literal_global_21);

}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1E0D8D6F8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1E0CFA250]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return MEMORY[0x1E0CD6380]();
}

OSStatus SecKeyEncrypt(SecKeyRef key, SecPadding padding, const uint8_t *plainText, size_t plainTextLen, uint8_t *cipherText, size_t *cipherTextLen)
{
  return MEMORY[0x1E0CD63B0](key, *(_QWORD *)&padding, plainText, plainTextLen, cipherText, cipherTextLen);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x1E0CD63D8](key);
}

uint64_t SimulateCrash()
{
  return MEMORY[0x1E0D64FB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C85080](a1, a2, *(_QWORD *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x1E0C85088](*(_QWORD *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1E0C85090](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x1E0C85098](a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

