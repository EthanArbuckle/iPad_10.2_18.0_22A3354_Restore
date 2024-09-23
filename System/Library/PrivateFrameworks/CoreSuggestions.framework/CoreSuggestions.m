void sub_1A2268B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  uint64_t v29;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);

  _Unwind_Resume(a1);
}

void sub_1A22699C4(void *a1)
{
  objc_begin_catch(a1);
  objc_terminate();
}

void sub_1A22699D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2269CA8(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sgLogHandle()
{
  if (sgLogHandle__pasOnceToken2 != -1)
    dispatch_once(&sgLogHandle__pasOnceToken2, &__block_literal_global_7836);
  return (id)sgLogHandle__pasExprOnceResult;
}

id SGNormalizePhoneNumber(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  void *String;
  void *v9;
  void *v10;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    _PASTryToConvertPhoneNumberToASCII();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)sOverrideCountryCode;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997B0]);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = CFPhoneNumberCreate();
    if (!v6 || (v7 = (const void *)v6, String = (void *)CFPhoneNumberCreateString(), CFRelease(v7), !String))
    {
      CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
      _PASKeepOnlyCharacterSet();
      String = (void *)objc_claimAutoreleasedReturnValue();
    }
    _PASFullwidthLatinToHalfwidth();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

id SGNormalizeEmailAddress(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(a1, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  _PASRemoveCharacterSet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  objc_autoreleasePoolPop(v2);

  return v5;
}

void sub_1A226AAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A226B4E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A226B648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A226B788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A226BFD8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_1A226C904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void incrementKeyWithSuffix(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v1 = a1;
  if (getAggdDispatchQueue__pasOnceToken17 != -1)
    dispatch_once(&getAggdDispatchQueue__pasOnceToken17, &__block_literal_global_63);
  v2 = getAggdDispatchQueue__pasExprOnceResult;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __addValueForScalarKey_block_invoke;
  v4[3] = &unk_1E4762908;
  v5 = v1;
  v6 = 1;
  v3 = v1;
  dispatch_async(v2, v4);

}

void sub_1A226CB8C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A226CBAC(void *a1)
{
  char v1;

  objc_begin_catch(a1);
  if ((v1 & 1) != 0)
    JUMPOUT(0x1A226CB08);
  JUMPOUT(0x1A226CAD8);
}

void __addValueForScalarKey_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(CFSTR("com.apple.suggestions"), "stringByAppendingString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setKey:", v3);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackScalarForMessage:count:", v4, *(unsigned int *)(a1 + 40));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), *(_QWORD *)(a1 + 32));
  v9 = CFSTR("clientaggdpush");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

void sub_1A226F02C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A226EFA4);
}

void sub_1A226F038(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void __sgLogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "suggestions");
  v2 = (void *)sgLogHandle__pasExprOnceResult;
  sgLogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id sgMapAndFilter(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  mutableArrayLike(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A8583A40](v7);
        v4[2](v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v12);
        if (v13)
          objc_msgSend(v5, "addObject:", v13, (_QWORD)v15);

        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

id sgMap(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  mutableArrayLike(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A8583A40](v7);
        v4[2](v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v12);
        objc_msgSend(v5, "addObject:", v13, (_QWORD)v15);

        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

void sub_1A226F588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    objc_terminate();
  }
  _Unwind_Resume(exception_object);
}

id mutableArrayLike(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "count");
  else
    v2 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);

  return v3;
}

id sgPrivateLogHandle()
{
  if (sgPrivateLogHandle__pasOnceToken3 != -1)
    dispatch_once(&sgPrivateLogHandle__pasOnceToken3, &__block_literal_global_4);
  return (id)sgPrivateLogHandle__pasExprOnceResult;
}

void __getAggdDispatchQueue_block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A8583A40]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.suggestions.clientaggdpush", v2);
  v4 = (void *)getAggdDispatchQueue__pasExprOnceResult;
  getAggdDispatchQueue__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

uint64_t SGM2SelfIdPatternMatchedReadFrom(uint64_t a1, uint64_t a2)
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_30;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_55:
          v42 = 40;
          goto LABEL_68;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_30:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v22 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                v14 = v28++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_59:
          v42 = 24;
          goto LABEL_68;
        case 5u:
          v32 = 0;
          v33 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v22 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_63:
          v42 = 20;
          goto LABEL_68;
        case 6u:
          v37 = 0;
          v38 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          break;
        v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
        *(_QWORD *)(a2 + v39) = v40 + 1;
        v22 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0)
          goto LABEL_65;
        v37 += 7;
        v14 = v38++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_67;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_65:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_67:
      v42 = 16;
LABEL_68:
      *(_DWORD *)(a1 + v42) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SGM2BundleIdsMissingEntitlementReadFrom(uint64_t a1, uint64_t a2)
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
        v19 = 8;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
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
    v19 = 16;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SGM2CNtoSGContactsCacheHitReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
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
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v21 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

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

uint64_t SGM2EventICSOpportunityReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_46:
          v37 = 20;
          goto LABEL_51;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_50:
          v37 = 16;
LABEL_51:
          *(_DWORD *)(a1 + v37) = v22;
          continue;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          break;
        v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0)
          goto LABEL_53;
        v31 += 7;
        v14 = v32++ >= 9;
        if (v14)
        {
          v33 = 0;
          goto LABEL_55;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
      if (*(_BYTE *)(a2 + *v5))
        v33 = 0;
LABEL_55:
      *(_BYTE *)(a1 + 24) = v33 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *SGDelimitedStringsSerialize(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  size_t v10;
  __CFString *v11;
  id *v12;
  __CFString *v13;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  UniChar v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  UniChar *v30;
  UniChar *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  id *v36;
  const __CFString *v37;
  CFIndex v38;
  const UniChar *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  UniChar v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const UInt8 *v54;
  const UInt8 *v55;
  uint64_t i;
  CFStringRef v57;
  __CFString *v58;
  id v60;
  __CFString *v61;
  __CFString *v62;
  uint64_t v63;
  id *v64;
  id *v65;
  UniChar buffer[8];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 theString;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  CFRange v78;
  CFRange v79;

  v77 = 0;
  v75 = 0u;
  v76 = 0u;
  theString = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  *(_OWORD *)buffer = 0u;
  v67 = 0u;
  v64 = (id *)&a9;
  v9 = 0;
  v10 = 0;
  v61 = a1;
  v11 = v61;
  while (v11)
  {
    Length = CFStringGetLength(v11);
    *(_QWORD *)&theString = v11;
    *((_QWORD *)&v75 + 1) = 0;
    *(_QWORD *)&v76 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v11);
    CStringPtr = 0;
    *((_QWORD *)&theString + 1) = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v11, 0x600u);
    *(_QWORD *)&v75 = CStringPtr;
    v17 = v10 + 1;
    *((_QWORD *)&v76 + 1) = 0;
    v77 = 0;
    if (Length >= 1)
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 64;
      do
      {
        if ((unint64_t)v20 >= 4)
          v22 = 4;
        else
          v22 = v20;
        v23 = v76;
        if ((uint64_t)v76 <= v20)
        {
          v24 = 0;
        }
        else if (*((_QWORD *)&theString + 1))
        {
          v24 = *(_WORD *)(*((_QWORD *)&theString + 1) + 2 * (v20 + *((_QWORD *)&v75 + 1)));
        }
        else if ((_QWORD)v75)
        {
          v24 = *(char *)(v75 + *((_QWORD *)&v75 + 1) + v20);
        }
        else
        {
          if (v77 <= v20 || v19 > v20)
          {
            v26 = v22 + v18;
            v27 = v21 - v22;
            v28 = v20 - v22;
            v29 = v28 + 64;
            if (v28 + 64 >= (uint64_t)v76)
              v29 = v76;
            *((_QWORD *)&v76 + 1) = v28;
            v77 = v29;
            if ((uint64_t)v76 >= v27)
              v23 = v27;
            v78.length = v23 + v26;
            v78.location = v28 + *((_QWORD *)&v75 + 1);
            CFStringGetCharacters((CFStringRef)theString, v78, buffer);
            v19 = *((_QWORD *)&v76 + 1);
          }
          v24 = buffer[v20 - v19];
        }
        if ((v24 & 0xFFDF) == 0x5C)
          v10 += 2;
        else
          v10 = v17;
        ++v20;
        v17 = v10 + 1;
        --v18;
        ++v21;
      }
      while (Length != v20);
    }
    ++v9;
    v10 = v17;
    if (v9)
    {
      v12 = v64++;
      v13 = (__CFString *)*v12;

      v11 = v13;
    }
  }
  if (v10)
  {
    v30 = (UniChar *)malloc_type_malloc(2 * v10, 0x1000040BDFB0063uLL);
    if (v30)
    {
      v31 = v30;
      v65 = (id *)&a9;
      v32 = v61;
      v33 = 0;
      v34 = 0;
      v35 = 1;
      while (v32)
      {
        v31[v33] = 124;
        v38 = CFStringGetLength(v32);
        *(_QWORD *)&theString = v32;
        *((_QWORD *)&v75 + 1) = 0;
        *(_QWORD *)&v76 = v38;
        v39 = CFStringGetCharactersPtr(v32);
        v40 = 0;
        *((_QWORD *)&theString + 1) = v39;
        if (!v39)
          v40 = CFStringGetCStringPtr(v32, 0x600u);
        v62 = (__CFString *)v32;
        v63 = v34;
        *(_QWORD *)&v75 = v40;
        v41 = v33 + 1;
        *((_QWORD *)&v76 + 1) = 0;
        v77 = 0;
        if (v38 >= 1)
        {
          v42 = 0;
          v43 = 0;
          v44 = 64;
          do
          {
            if ((unint64_t)v43 >= 4)
              v45 = 4;
            else
              v45 = v43;
            v46 = v76;
            if ((uint64_t)v76 <= v43)
            {
              v47 = 0;
            }
            else
            {
              if (*((_QWORD *)&theString + 1))
              {
                v47 = *(_WORD *)(*((_QWORD *)&theString + 1) + 2 * (v43 + *((_QWORD *)&v75 + 1)));
              }
              else if ((_QWORD)v75)
              {
                v47 = *(char *)(v75 + *((_QWORD *)&v75 + 1) + v43);
              }
              else
              {
                v48 = *((_QWORD *)&v76 + 1);
                if (v77 <= v43 || *((_QWORD *)&v76 + 1) > v43)
                {
                  v50 = v45 + v42;
                  v51 = v44 - v45;
                  v52 = v43 - v45;
                  v53 = v52 + 64;
                  if (v52 + 64 >= (uint64_t)v76)
                    v53 = v76;
                  *((_QWORD *)&v76 + 1) = v52;
                  v77 = v53;
                  if ((uint64_t)v76 >= v51)
                    v46 = v51;
                  v79.length = v46 + v50;
                  v79.location = v52 + *((_QWORD *)&v75 + 1);
                  CFStringGetCharacters((CFStringRef)theString, v79, buffer);
                  v48 = *((_QWORD *)&v76 + 1);
                }
                v47 = buffer[v43 - v48];
              }
              if ((v47 & 0xFFDF) == 0x5C)
              {
                v31[v41] = 92;
                v41 = v33 + 2;
              }
            }
            v33 = v41;
            v31[v41] = v47;
            v35 &= v47 < 0x80u;
            ++v43;
            ++v41;
            --v42;
            ++v44;
          }
          while (v38 != v43);
        }
        v34 = v63 + 1;
        v33 = v41;
        v32 = v62;
        if (v63 != -1)
        {
          v36 = v65++;
          v37 = (const __CFString *)*v36;

          v32 = v37;
        }
      }
      if ((v35 & 1) == 0)
      {
        v57 = CFStringCreateWithCharactersNoCopy(0, v31, v10, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
LABEL_74:
        v58 = (__CFString *)v57;
        goto LABEL_75;
      }
      v54 = (const UInt8 *)malloc_type_malloc(v10, 0x100004077774924uLL);
      if (v54)
      {
        v55 = v54;
        for (i = 0; i != v10; ++i)
          v54[i] = v31[i];
        free(v31);
        v57 = CFStringCreateWithBytesNoCopy(0, v55, v10, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
        goto LABEL_74;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v60 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v60);
  }
  v58 = &stru_1E4762D08;
LABEL_75:

  return v58;
}

__CFString *SGDelimitedStringsSerializeArray(void *a1)
{
  id v1;
  __CFString *Mutable;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    Mutable = CFStringCreateMutable(0, 0);
    if (Mutable)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v3 = v1;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
      {
        v12 = v4;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v3);
            SGDelimitedStringsSerialize(*(void **)(*((_QWORD *)&v17 + 1) + 8 * v14), v5, v6, v7, v8, v9, v10, v11, 0);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CFStringAppend(Mutable, v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
  }
  else
  {
    Mutable = &stru_1E4762D08;
  }

  return Mutable;
}

void SGDelimitedStringsDeserializeWithBlock(void *a1, void *a2)
{
  __CFString *v3;
  void (**v4)(id, __CFString *);
  uint64_t v5;
  CFIndex v6;
  const __CFString *CharactersPtr;
  UniChar isa;
  const char *CStringPtr;
  CFRange v10;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;
  CFIndex v14;
  UniChar *v15;
  uint64_t v16;
  UniChar v17;
  uint64_t v18;
  uint64_t v19;
  const UniChar *v20;
  const UniChar *v21;
  CFIndex v22;
  CFIndex v23;
  UniChar *v24;
  uint64_t v25;
  UniChar v26;
  CFIndex v27;
  UniChar *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  id v35;
  const __CFAllocator *contentsDeallocator;
  UniChar buffer[8];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CFStringRef theString[2];
  __int128 v46;
  __int128 v47;
  CFIndex length;
  CFRange v49;
  CFRange v50;
  CFRange v51;

  v3 = a1;
  v4 = a2;
  v5 = -[__CFString length](v3, "length");
  if (!v5)
    goto LABEL_82;
  v6 = v5;
  v46 = 0u;
  v44 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)buffer = 0u;
  theString[0] = v3;
  length = 0;
  v47 = (unint64_t)v5;
  CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v3);
  theString[1] = CharactersPtr;
  if (CharactersPtr)
  {
    *((_QWORD *)&v47 + 1) = 0;
    length = 0;
    *(_QWORD *)&v46 = 0;
    if (v6 < 1)
      goto LABEL_82;
    isa = (UniChar)CharactersPtr->isa;
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    *((_QWORD *)&v47 + 1) = 0;
    length = 0;
    *(_QWORD *)&v46 = CStringPtr;
    if (v6 <= 0)
      goto LABEL_82;
    if (CStringPtr)
    {
      isa = *CStringPtr;
    }
    else
    {
      if (v6 >= 64)
        v10.length = 64;
      else
        v10.length = v6;
      length = v10.length;
      v10.location = 0;
      CFStringGetCharacters(v3, v10, buffer);
      isa = buffer[-*((_QWORD *)&v47 + 1)];
    }
  }
  if (isa != 124)
    goto LABEL_82;
  contentsDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE10];
  v11 = 1;
  do
  {
    if (v11 >= v6)
    {
      v13 = v11;
LABEL_79:
      v34 = &stru_1E4762D08;
      goto LABEL_81;
    }
    v12 = 0;
    v13 = v11;
    do
    {
      if (v13 < 0)
        goto LABEL_28;
      v14 = v47;
      if ((uint64_t)v47 <= v13)
        goto LABEL_28;
      v15 = (UniChar *)theString[1];
      if (theString[1])
      {
        v16 = *((_QWORD *)&v46 + 1) + v13;
LABEL_20:
        v17 = v15[v16];
        goto LABEL_23;
      }
      if (!(_QWORD)v46)
      {
        if (length <= v13 || (v18 = *((_QWORD *)&v47 + 1), *((uint64_t *)&v47 + 1) > v13))
        {
          v19 = v13 - 4;
          if ((unint64_t)v13 < 4)
            v19 = 0;
          if (v19 + 64 < (uint64_t)v47)
            v14 = v19 + 64;
          *((_QWORD *)&v47 + 1) = v19;
          length = v14;
          v49.location = *((_QWORD *)&v46 + 1) + v19;
          v49.length = v14 - v19;
          CFStringGetCharacters(theString[0], v49, buffer);
          v18 = *((_QWORD *)&v47 + 1);
        }
        v16 = v13 - v18;
        v15 = buffer;
        goto LABEL_20;
      }
      v17 = *(char *)(v46 + *((_QWORD *)&v46 + 1) + v13);
LABEL_23:
      if (v17 == 92)
      {
        if (v13 + 1 < v6)
          ++v13;
      }
      else if (v17 == 124)
      {
        break;
      }
LABEL_28:
      ++v13;
      ++v12;
    }
    while (v13 < v6);
    if (v11 >= v13 || !v12)
      goto LABEL_79;
    v20 = (const UniChar *)malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v35);
    }
    v21 = v20;
    v22 = 0;
    while (2)
    {
      if (v11 < 0)
        goto LABEL_56;
      v23 = v47;
      if ((uint64_t)v47 <= v11)
        goto LABEL_56;
      v24 = (UniChar *)theString[1];
      if (theString[1])
      {
        v25 = *((_QWORD *)&v46 + 1) + v11;
        goto LABEL_47;
      }
      if ((_QWORD)v46)
      {
        v26 = *(char *)(v46 + *((_QWORD *)&v46 + 1) + v11);
      }
      else
      {
        if (length <= v11 || (v30 = *((_QWORD *)&v47 + 1), *((uint64_t *)&v47 + 1) > v11))
        {
          v31 = v11 - 4;
          if ((unint64_t)v11 < 4)
            v31 = 0;
          if (v31 + 64 < (uint64_t)v47)
            v23 = v31 + 64;
          *((_QWORD *)&v47 + 1) = v31;
          length = v23;
          v50.location = *((_QWORD *)&v46 + 1) + v31;
          v50.length = v23 - v31;
          CFStringGetCharacters(theString[0], v50, buffer);
          v30 = *((_QWORD *)&v47 + 1);
        }
        v25 = v11 - v30;
        v24 = buffer;
LABEL_47:
        v26 = v24[v25];
      }
      if (v26 != 92)
        goto LABEL_57;
      if (v11 < v13 - 1)
      {
        ++v11;
        v27 = v47;
        if ((uint64_t)v47 > v11)
        {
          v28 = (UniChar *)theString[1];
          if (theString[1])
          {
            v29 = *((_QWORD *)&v46 + 1) + v11;
            goto LABEL_55;
          }
          if ((_QWORD)v46)
          {
            v26 = *(char *)(v46 + *((_QWORD *)&v46 + 1) + v11);
          }
          else
          {
            if (length <= v11 || (v32 = *((_QWORD *)&v47 + 1), *((uint64_t *)&v47 + 1) > v11))
            {
              v33 = v11 - 4;
              if ((unint64_t)v11 < 4)
                v33 = 0;
              if (v33 + 64 < (uint64_t)v47)
                v27 = v33 + 64;
              *((_QWORD *)&v47 + 1) = v33;
              length = v27;
              v51.location = *((_QWORD *)&v46 + 1) + v33;
              v51.length = v27 - v33;
              CFStringGetCharacters(theString[0], v51, buffer);
              v32 = *((_QWORD *)&v47 + 1);
            }
            v29 = v11 - v32;
            v28 = buffer;
LABEL_55:
            v26 = v28[v29];
          }
LABEL_57:
          v21[v22++] = v26;
          goto LABEL_58;
        }
LABEL_56:
        v26 = 0;
        goto LABEL_57;
      }
LABEL_58:
      if (++v11 < v13 && v22 < v12)
        continue;
      break;
    }
    v34 = (__CFString *)CFStringCreateWithCharactersNoCopy(0, v21, v22, contentsDeallocator);
LABEL_81:
    v4[2](v4, v34);

    v11 = v13 + 1;
  }
  while (v13 < v6);
LABEL_82:

}

id SGDelimitedStringsDeserialize(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)objc_opt_new();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __SGDelimitedStringsDeserialize_block_invoke;
    v5[3] = &unk_1E475FEB8;
    v3 = v2;
    v6 = v3;
    SGDelimitedStringsDeserializeWithBlock(v1, v5);

  }
  else
  {
    v3 = (id)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

id SGDelimitedStringsDeserializeSet(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)objc_opt_new();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __SGDelimitedStringsDeserializeSet_block_invoke;
    v5[3] = &unk_1E475FEB8;
    v3 = v2;
    v6 = v3;
    SGDelimitedStringsDeserializeWithBlock(v1, v5);

  }
  else
  {
    v3 = (id)objc_opt_new();
  }

  return v3;
}

void sub_1A227A75C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
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

uint64_t SGM2ContactConfirmedReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 48) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_95:
          v76 = 8;
          goto LABEL_133;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 48) |= 0x20u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_99:
          v77 = v28 != 0;
          v78 = 40;
          goto LABEL_124;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)(a1 + 48) |= 0x80u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_103:
          v77 = v34 != 0;
          v78 = 42;
          goto LABEL_124;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 48) |= 0x100u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_107:
          v77 = v40 != 0;
          v78 = 43;
          goto LABEL_124;
        case 6u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_WORD *)(a1 + 48) |= 0x40u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_111:
          v77 = v46 != 0;
          v78 = 41;
          goto LABEL_124;
        case 7u:
          v50 = 0;
          v51 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 48) |= 2u;
          while (2)
          {
            v52 = *v3;
            v53 = *(_QWORD *)(a2 + v52);
            if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
              *(_QWORD *)(a2 + v52) = v53 + 1;
              v22 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_115:
          v76 = 12;
          goto LABEL_133;
        case 8u:
          v55 = 0;
          v56 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 48) |= 4u;
          while (2)
          {
            v57 = *v3;
            v58 = *(_QWORD *)(a2 + v57);
            if (v58 == -1 || v58 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
              *(_QWORD *)(a2 + v57) = v58 + 1;
              v22 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                v14 = v56++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_119:
          v76 = 16;
          goto LABEL_133;
        case 9u:
          v60 = 0;
          v61 = 0;
          v62 = 0;
          *(_WORD *)(a1 + 48) |= 0x200u;
          while (2)
          {
            v63 = *v3;
            v64 = *(_QWORD *)(a2 + v63);
            if (v64 == -1 || v64 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
              *(_QWORD *)(a2 + v63) = v64 + 1;
              v62 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                v14 = v61++ >= 9;
                if (v14)
                {
                  v62 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v62 = 0;
LABEL_123:
          v77 = v62 != 0;
          v78 = 44;
LABEL_124:
          *(_BYTE *)(a1 + v78) = v77;
          continue;
        case 0xAu:
          v66 = 0;
          v67 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 48) |= 8u;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v69 + 1;
              v22 |= (unint64_t)(v70 & 0x7F) << v66;
              if (v70 < 0)
              {
                v66 += 7;
                v14 = v67++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_128:
          v76 = 32;
          goto LABEL_133;
        case 0xBu:
          v71 = 0;
          v72 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 48) |= 0x10u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v73 = *v3;
        v74 = *(_QWORD *)(a2 + v73);
        if (v74 == -1 || v74 >= *(_QWORD *)(a2 + *v4))
          break;
        v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v74);
        *(_QWORD *)(a2 + v73) = v74 + 1;
        v22 |= (unint64_t)(v75 & 0x7F) << v71;
        if ((v75 & 0x80) == 0)
          goto LABEL_130;
        v71 += 7;
        v14 = v72++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_132;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_130:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_132:
      v76 = 36;
LABEL_133:
      *(_DWORD *)(a1 + v76) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A227E13C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A227E07CLL);
}

void sub_1A227E148(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A227E574(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__998(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__999(uint64_t a1)
{

}

uint64_t SGM2EventBannerRejectedReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_46:
          v36 = 8;
          goto LABEL_55;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_50:
          v36 = 12;
          goto LABEL_55;
        case 4u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          break;
        v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
        *(_QWORD *)(a2 + v33) = v34 + 1;
        v22 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0)
          goto LABEL_52;
        v31 += 7;
        v14 = v32++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_54:
      v36 = 16;
LABEL_55:
      *(_DWORD *)(a1 + v36) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SGM2BundleIdsUsingOldEntitlementReadFrom(uint64_t a1, uint64_t a2)
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
        v18 = 16;
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
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void *SGWeakLinkSymbol(const char *a1, unint64_t a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

const void *__HandleForSource(unint64_t a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  __CFString *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&__HandleForSource_handlesLock);
  Mutable = (const __CFDictionary *)__HandleForSource_handles;
  if (!__HandleForSource_handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __HandleForSource_handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, (const void *)a1);
  if (!Value)
  {
    if (a1 <= 3)
    {
      v4 = off_1E4760218[a1];
      v5 = dlopen((const char *)-[__CFString UTF8String](v4, "UTF8String"), 1);
      if (v5)
      {
        Value = v5;
        CFDictionarySetValue((CFMutableDictionaryRef)__HandleForSource_handles, (const void *)a1, v5);
        goto LABEL_13;
      }
      sgLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412546;
        v10 = (unint64_t)v4;
        v11 = 2080;
        v12 = dlerror();
        _os_log_error_impl(&dword_1A2267000, v6, OS_LOG_TYPE_ERROR, "Could not load library at path %@ (%s)", (uint8_t *)&v9, 0x16u);
      }

    }
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = a1;
      _os_log_error_impl(&dword_1A2267000, v7, OS_LOG_TYPE_ERROR, "Could not load source: %ld", (uint8_t *)&v9, 0xCu);
    }

    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&__HandleForSource_handlesLock);
  return Value;
}

id SGWeakLinkClass(void *a1, unint64_t a2)
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = a1;
  v4 = (void *)__HandleForSource(a2);
  if (v4)
    v4 = NSClassFromString(v3);
  v5 = v4;

  return v5;
}

id SGWeakLinkProtocol(void *a1, unint64_t a2)
{
  NSString *v3;
  void *v4;

  v3 = a1;
  if (__HandleForSource(a2))
  {
    NSProtocolFromString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id *SGWeakLinkStringConstant(const char *a1, unint64_t a2)
{
  id *v3;

  v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    v3 = (id *)dlsym(v3, a1);
    if (v3)
      v3 = (id *)*v3;
  }
  return v3;
}

void sub_1A2281214(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A2281A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1278(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1279(uint64_t a1)
{

}

void sub_1A2282978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SGM2MaybeInformationShownReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

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
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_41:
        v32 = 12;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_45:
        v32 = 8;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id collapseWhitespaceAndStrip(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  const __CFCharacterSet *Predefined;
  unint64_t v5;
  char *v6;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  UniChar v19;
  int IsCharacterMember;
  __int16 v21;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  CFIndex v27;
  id v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v34;
  id v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _OWORD buffer[8];
  __CFString *v41;
  const UniChar *v42;
  const char *v43;
  uint64_t v44;
  CFIndex v45;
  int64_t v46;
  int64_t v47;
  uint64_t v48;
  CFRange v49;

  v48 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2)
  {
    v3 = v2;
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
    v5 = (2 * v3) | 1;
    buffer[0] = 0uLL;
    if (v5 > 0x200)
    {
      v34 = malloc_type_posix_memalign((void **)buffer, 8uLL, 2 * v3, 0x1000040BDFB0063uLL);
      BYTE8(buffer[0]) = 0;
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v35);
      }
      v6 = *(char **)&buffer[0];
    }
    else
    {
      MEMORY[0x1E0C80A78]();
      v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v6, (2 * v3) | 1);
    }
    v7 = (__CFString *)v1;
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      memset(buffer, 0, sizeof(buffer));
      Length = CFStringGetLength(v7);
      v41 = v7;
      v44 = 0;
      v45 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      CStringPtr = 0;
      v42 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      v36 = v7;
      v37 = v3;
      v38 = (2 * v3) | 1;
      v39 = v1;
      v46 = 0;
      v47 = 0;
      v43 = CStringPtr;
      if (Length < 1)
      {
        v14 = 0;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 1;
        v16 = 64;
        do
        {
          if ((unint64_t)v13 >= 4)
            v17 = 4;
          else
            v17 = v13;
          v18 = v45;
          if (v45 <= v13)
          {
            v19 = 0;
          }
          else if (v42)
          {
            v19 = v42[v13 + v44];
          }
          else if (v43)
          {
            v19 = v43[v44 + v13];
          }
          else
          {
            v22 = v46;
            if (v47 <= v13 || v46 > v13)
            {
              v24 = v17 + v12;
              v25 = v16 - v17;
              v26 = v13 - v17;
              v27 = v26 + 64;
              if (v26 + 64 >= v45)
                v27 = v45;
              v46 = v26;
              v47 = v27;
              if (v45 >= v25)
                v18 = v25;
              v49.length = v18 + v24;
              v49.location = v26 + v44;
              CFStringGetCharacters(v41, v49, (UniChar *)buffer);
              v22 = v46;
            }
            v19 = *((_WORD *)buffer + v13 - v22);
          }
          IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v19);
          if (IsCharacterMember == 0 || !v15)
          {
            if (IsCharacterMember)
              v21 = 32;
            else
              v21 = v19;
            *(_WORD *)&v6[2 * v14++] = v21;
          }
          ++v13;
          --v12;
          ++v16;
          v15 = IsCharacterMember != 0;
        }
        while (Length != v13);
      }
      v1 = v39;
      v5 = v38;
      v3 = v37;
      v7 = v36;
    }
    else
    {
      v14 = 0;
    }

    v29 = v14 - 1;
    while (v29 != -1)
    {
      v30 = *(unsigned __int16 *)&v6[2 * v29--];
      if (v30 != 32)
      {
        v31 = v29 + 2;
        goto LABEL_44;
      }
    }
    v31 = 0;
LABEL_44:
    if (v31 == v3)
      v32 = -[__CFString copy](v7, "copy");
    else
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v6, v31);
    v28 = (id)v32;
    if (v5 >= 0x201)
      free(v6);
  }
  else
  {
    v28 = v1;
  }

  return v28;
}

uint64_t SGM2NLEventInBannerReadFrom(uint64_t a1, uint64_t a2)
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  void *v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  uint64_t v97;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_117;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x40u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_135:
          v97 = 60;
          goto LABEL_192;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 1u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_139:
          v97 = 8;
          goto LABEL_192;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_117;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_117;
        case 6u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 8u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_143:
          v97 = 40;
          goto LABEL_192;
        case 7u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 2u;
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
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v22 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_147;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_147:
          v97 = 32;
          goto LABEL_192;
        case 8u:
          v41 = 0;
          v42 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x800u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v22 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_151;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_151:
          v97 = 96;
          goto LABEL_192;
        case 9u:
          v46 = 0;
          v47 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x400u;
          while (2)
          {
            v48 = *v3;
            v49 = *(_QWORD *)(a2 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
              *(_QWORD *)(a2 + v48) = v49 + 1;
              v22 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_155;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_155:
          v97 = 92;
          goto LABEL_192;
        case 0xAu:
          v51 = 0;
          v52 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x20u;
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
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v22 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                v14 = v52++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_159;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_159:
          v97 = 56;
          goto LABEL_192;
        case 0xBu:
          v56 = 0;
          v57 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x4000u;
          while (2)
          {
            v58 = *v3;
            v59 = *(_QWORD *)(a2 + v58);
            if (v59 == -1 || v59 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
              *(_QWORD *)(a2 + v58) = v59 + 1;
              v22 |= (unint64_t)(v60 & 0x7F) << v56;
              if (v60 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_163;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_163:
          v97 = 108;
          goto LABEL_192;
        case 0xCu:
          v61 = 0;
          v62 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x2000u;
          while (2)
          {
            v63 = *v3;
            v64 = *(_QWORD *)(a2 + v63);
            if (v64 == -1 || v64 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
              *(_QWORD *)(a2 + v63) = v64 + 1;
              v22 |= (unint64_t)(v65 & 0x7F) << v61;
              if (v65 < 0)
              {
                v61 += 7;
                v14 = v62++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_167:
          v97 = 104;
          goto LABEL_192;
        case 0xDu:
          v66 = 0;
          v67 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x1000u;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v69 + 1;
              v22 |= (unint64_t)(v70 & 0x7F) << v66;
              if (v70 < 0)
              {
                v66 += 7;
                v14 = v67++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_171:
          v97 = 100;
          goto LABEL_192;
        case 0xEu:
          v71 = 0;
          v72 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 4u;
          while (2)
          {
            v73 = *v3;
            v74 = *(_QWORD *)(a2 + v73);
            if (v74 == -1 || v74 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v74);
              *(_QWORD *)(a2 + v73) = v74 + 1;
              v22 |= (unint64_t)(v75 & 0x7F) << v71;
              if (v75 < 0)
              {
                v71 += 7;
                v14 = v72++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_175;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_175:
          v97 = 36;
          goto LABEL_192;
        case 0xFu:
          v76 = 0;
          v77 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x10u;
          while (2)
          {
            v78 = *v3;
            v79 = *(_QWORD *)(a2 + v78);
            if (v79 == -1 || v79 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v79);
              *(_QWORD *)(a2 + v78) = v79 + 1;
              v22 |= (unint64_t)(v80 & 0x7F) << v76;
              if (v80 < 0)
              {
                v76 += 7;
                v14 = v77++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_179;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_179:
          v97 = 44;
          goto LABEL_192;
        case 0x10u:
          v81 = 0;
          v82 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x80u;
          while (2)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            if (v84 == -1 || v84 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
              *(_QWORD *)(a2 + v83) = v84 + 1;
              v22 |= (unint64_t)(v85 & 0x7F) << v81;
              if (v85 < 0)
              {
                v81 += 7;
                v14 = v82++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_183;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_183:
          v97 = 80;
          goto LABEL_192;
        case 0x11u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_117;
        case 0x12u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_117:
          v86 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 0x13u:
          v87 = 0;
          v88 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x100u;
          while (2)
          {
            v89 = *v3;
            v90 = *(_QWORD *)(a2 + v89);
            if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v90);
              *(_QWORD *)(a2 + v89) = v90 + 1;
              v22 |= (unint64_t)(v91 & 0x7F) << v87;
              if (v91 < 0)
              {
                v87 += 7;
                v14 = v88++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_187;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_187:
          v97 = 84;
          goto LABEL_192;
        case 0x14u:
          v92 = 0;
          v93 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 112) |= 0x200u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v94 = *v3;
        v95 = *(_QWORD *)(a2 + v94);
        if (v95 == -1 || v95 >= *(_QWORD *)(a2 + *v4))
          break;
        v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v95);
        *(_QWORD *)(a2 + v94) = v95 + 1;
        v22 |= (unint64_t)(v96 & 0x7F) << v92;
        if ((v96 & 0x80) == 0)
          goto LABEL_189;
        v92 += 7;
        v14 = v93++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_191;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_189:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_191:
      v97 = 88;
LABEL_192:
      *(_DWORD *)(a1 + v97) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A2289F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_1A228A46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A228A99C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A228AA78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1A228AC04(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__15(__n128 *a1, __n128 *a2)
{
  __n128 result;
  unint64_t v3;

  result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  v3 = a2[4].n128_u64[1];
  a2[4].n128_u64[1] = 0;
  a1[4].n128_u64[1] = v3;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_1A228AEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1772(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1773(uint64_t a1)
{

}

void sub_1A228D7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A229831C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A22984BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A22985D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2051(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2052(uint64_t a1)
{

}

id _PASValidatedFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18[2];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v18[1] = &a9;
  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a1;
  v18[0] = 0;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v10, CFSTR("%@"), 0, &a9, v18);

  v12 = v18[0];
  if (!v11)
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DA0]);
    v14 = *MEMORY[0x1E0C99778];
    v19 = *MEMORY[0x1E0CB3388];
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithName:reason:userInfo:", v14, CFSTR("An error occurred while formatting the string."), v15);

    objc_msgSend(v16, "raise");
  }

  return v11;
}

void sub_1A22A0470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A22A3654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SGM2ContactDetailConfirmedReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_53:
          v41 = 24;
          goto LABEL_66;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_57:
          v41 = 8;
          goto LABEL_66;
        case 4u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_61:
          v41 = 12;
          goto LABEL_66;
        case 5u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          break;
        v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
        *(_QWORD *)(a2 + v38) = v39 + 1;
        v22 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0)
          goto LABEL_63;
        v36 += 7;
        v14 = v37++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_65;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_65:
      v41 = 28;
LABEL_66:
      *(_DWORD *)(a1 + v41) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SGM2BadInteractionIgnoredReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
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
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

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

uint64_t SGM2DDLinkShownReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
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
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

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

void sub_1A22AF8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2899(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2900(uint64_t a1)
{

}

uint64_t SGM2ContactInBannerReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_60:
          v47 = 8;
          goto LABEL_77;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_64:
          v47 = 12;
          goto LABEL_77;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 40) |= 0x10u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v33 = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_68:
          *(_BYTE *)(a1 + 36) = v33 != 0;
          continue;
        case 5u:
          v37 = 0;
          v38 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          while (2)
          {
            v39 = *v3;
            v40 = *(_QWORD *)(a2 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
              *(_QWORD *)(a2 + v39) = v40 + 1;
              v22 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v14 = v38++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_72:
          v47 = 16;
          goto LABEL_77;
        case 6u:
          v42 = 0;
          v43 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v44 = *v3;
        v45 = *(_QWORD *)(a2 + v44);
        if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
          break;
        v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
        *(_QWORD *)(a2 + v44) = v45 + 1;
        v22 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0)
          goto LABEL_74;
        v42 += 7;
        v14 = v43++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_76;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_74:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_76:
      v47 = 32;
LABEL_77:
      *(_DWORD *)(a1 + v47) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void SGSetOverrideCountryCodeForPhoneNumberNormalization(id obj)
{
  objc_storeStrong((id *)&sOverrideCountryCode, obj);
}

id SGNormalizePhoneNumberCached(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        SGNormalizePhoneNumber(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v10;
        if (v10)
        {
          v11 = objc_msgSend(v10, "length");
          if ((unint64_t)(objc_msgSend(v5, "length") + v11) <= 0x100)
          {
            if ((unint64_t)objc_msgSend(v3, "count") >= 0x3E8)
              objc_msgSend(v3, "removeAllObjects");
            if (objc_msgSend(v8, "isEqualToString:", v5))
              v12 = v8;
            else
              v12 = v5;
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v12);
          }
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    SGNormalizePhoneNumber(v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

const __CFString *SGEntityExtractionInfoTypeDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("ExtractionTypeUnknown");
  if (a1 == 2)
    v1 = CFSTR("ExtractionTypeCongratulations");
  if (a1 == 1)
    return CFSTR("ExtractionTypeBirthday");
  else
    return v1;
}

uint64_t SGM2EventInBannerReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_53:
          v41 = 8;
          goto LABEL_66;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_57:
          v41 = 12;
          goto LABEL_66;
        case 4u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_61:
          v41 = 16;
          goto LABEL_66;
        case 5u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          break;
        v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
        *(_QWORD *)(a2 + v38) = v39 + 1;
        v22 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0)
          goto LABEL_63;
        v36 += 7;
        v14 = v37++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_65;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_65:
      v41 = 32;
LABEL_66:
      *(_DWORD *)(a1 + v41) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SGM2ContactDetailUsedReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

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
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_41:
        v32 = 24;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_45:
        v32 = 8;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t changeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_notify");
}

void SGSetSiriPrefsHidden(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t j;
  void *v36;
  __CFBundle *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  const __CFString *v45;
  __CFString *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  const __CFString *v55;
  const __CFString *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[4];
  _QWORD v73[4];
  uint8_t buf[4];
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v72[0] = CFSTR("SBSearchDisabledApps");
  v72[1] = CFSTR("SBSearchDisabledBundles");
  v73[0] = CFSTR("SBSearchDisabledAppsPriorValue");
  v73[1] = CFSTR("SBSearchDisabledBundlesPriorValue");
  v72[2] = CFSTR("SBSearchDisabledShortcuts");
  v72[3] = CFSTR("SBSearchSuggestAppDisabled");
  v73[2] = CFSTR("SBSearchDisabledShortcutsPriorValue");
  v73[3] = CFSTR("SBSearchSuggestAppDisabledPriorValue");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    v64 = 0uLL;
    v65 = 0uLL;
    v62 = 0uLL;
    v63 = 0uLL;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v63 != v9)
            objc_enumerationMutation(v6);
          v11 = *(const __CFString **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          cachePriorValuesAndSet(v3, v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      }
      while (v8);
    }

    v13 = v3;
    v14 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
    v15 = objc_msgSend(v14, "containsObject:", v13);

    if ((v15 & 1) == 0)
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v13;
        _os_log_debug_impl(&dword_1A2267000, v16, OS_LOG_TYPE_DEBUG, "'Learn from this app' was on: %@", buf, 0xCu);
      }

      addBundleToPriorActivatedList(v13, CFSTR("SBSearchDisabledAppsPriorValue"));
    }
    SGSetSiriCanLearnFromApp(v13, 0);
    disabledLockScreenBundles();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v13);

    if ((v18 & 1) == 0)
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v13;
        _os_log_debug_impl(&dword_1A2267000, v19, OS_LOG_TYPE_DEBUG, "Suggestion Notifications were on: %@", buf, 0xCu);
      }

      addBundleToPriorActivatedList(v13, CFSTR("LockscreenSuggestionsDisabledBundlesPriorValue"));
      v20 = (void *)MEMORY[0x1E0C99E20];
      disabledLockScreenBundles();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithSet:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "addObject:", v13);
      CFPreferencesSetAppValue(CFSTR("LockscreenSuggestionsDisabledBundles"), (CFPropertyListRef)objc_msgSend(v22, "allObjects"), CFSTR("com.apple.duetexpertd"));

    }
    v57 = v5;
    v23 = v13;
    v24 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
    v25 = objc_msgSend(v24, "containsObject:", v23);

    if ((v25 & 1) == 0)
    {
      sgLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v23;
        _os_log_debug_impl(&dword_1A2267000, v26, OS_LOG_TYPE_DEBUG, "Siri Suggestions were on: %@", buf, 0xCu);
      }

      addBundleToPriorActivatedList(v23, CFSTR("SiriPerAppSuggestionsPriorValue"));
    }
    SGSetAppCanShowSiriSuggestions(v23, 0);
    v27 = v23;
    v28 = (void *)TCCAccessCopyInformation();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v67;
      v33 = (_QWORD *)MEMORY[0x1E0DB1098];
      v34 = (_QWORD *)MEMORY[0x1E0DB10A8];
      while (2)
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v67 != v32)
            objc_enumerationMutation(v29);
          v36 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          v37 = (__CFBundle *)objc_msgSend(v36, "objectForKey:", *v33);
          objc_msgSend(v36, "objectForKey:", *v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          CFBundleGetIdentifier(v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "BOOLValue") && (objc_msgSend(v27, "isEqualToString:", v39) & 1) != 0)
          {

            sgLogHandle();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v75 = v27;
              _os_log_debug_impl(&dword_1A2267000, v54, OS_LOG_TYPE_DEBUG, "'Use with Siri' was on: %@", buf, 0xCu);
            }

            addBundleToPriorActivatedList(v27, CFSTR("SiriPerAppSiriPriorValue"));
            goto LABEL_57;
          }

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
        if (v31)
          continue;
        break;
      }
    }

LABEL_57:
    v5 = v57;
    goto LABEL_58;
  }
  v60 = 0uLL;
  v61 = 0uLL;
  v58 = 0uLL;
  v59 = 0uLL;
  v40 = v4;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(v40);
        v45 = *(const __CFString **)(*((_QWORD *)&v58 + 1) + 8 * k);
        objc_msgSend(v40, "objectForKeyedSubscript:", v45);
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        restoreValue(v3, v45, v46);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v42);
  }

  if (checkAndRemoveBundleFromPriorActivatedList(v3, CFSTR("SBSearchDisabledAppsPriorValue")))
  {
    sgLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v3;
      _os_log_debug_impl(&dword_1A2267000, v47, OS_LOG_TYPE_DEBUG, "Reenabling 'Learn from this app' for %@", buf, 0xCu);
    }

    SGSetSiriCanLearnFromApp(v3, 1);
  }
  if (checkAndRemoveBundleFromPriorActivatedList(v3, CFSTR("LockscreenSuggestionsDisabledBundlesPriorValue")))
  {
    sgLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v3;
      _os_log_debug_impl(&dword_1A2267000, v48, OS_LOG_TYPE_DEBUG, "Reenabling Suggestion Notifications for %@", buf, 0xCu);
    }

    v49 = (void *)MEMORY[0x1E0C99E20];
    disabledLockScreenBundles();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setWithSet:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "removeObject:", v3);
    CFPreferencesSetAppValue(CFSTR("LockscreenSuggestionsDisabledBundles"), (CFPropertyListRef)objc_msgSend(v51, "allObjects"), CFSTR("com.apple.duetexpertd"));

  }
  if (checkAndRemoveBundleFromPriorActivatedList(v3, CFSTR("SiriPerAppSuggestionsPriorValue")))
  {
    sgLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v3;
      _os_log_debug_impl(&dword_1A2267000, v52, OS_LOG_TYPE_DEBUG, "Reenabling Siri Suggestions for %@", buf, 0xCu);
    }

    SGSetAppCanShowSiriSuggestions(v3, 1);
  }
  if (checkAndRemoveBundleFromPriorActivatedList(v3, CFSTR("SiriPerAppSiriPriorValue")))
  {
    sgLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v3;
      _os_log_debug_impl(&dword_1A2267000, v53, OS_LOG_TYPE_DEBUG, "Reenabling 'Use with Siri' for %@", buf, 0xCu);
    }

LABEL_58:
    TCCAccessSetForBundleId();
  }
  v55 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v56 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.appprotectiond"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(CFSTR("com.apple.duetexpertd"), v55, v56);
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), v55, v56);
  notify_post("com.apple.spotlightui.prefschanged");
  notify_post("com.apple.duetexpertd.prefschanged");

}

void cachePriorValuesAndSet(void *a1, const __CFString *a2, const __CFString *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = (void *)CFPreferencesCopyAppValue(a2, CFSTR("com.apple.spotlightui"));
  v7 = objc_msgSend(v6, "containsObject:", v5);
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_debug_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEBUG, "%@ was off, adding %@ to prior block list", buf, 0x16u);
    }

    v10 = (void *)CFPreferencesCopyAppValue(a3, CFSTR("com.apple.spotlightui"));
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "arrayByAddingObject:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CFPreferencesSetAppValue(a3, v12, CFSTR("com.apple.spotlightui"));

  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_debug_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEBUG, "%@ was on, setting: %@ to off", buf, 0x16u);
    }

    if (v6)
    {
      objc_msgSend(v6, "arrayByAddingObject:", v5);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    else
    {
      v14 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    CFPreferencesSetAppValue(a2, v6, CFSTR("com.apple.spotlightui"));
  }

}

void addBundleToPriorActivatedList(void *a1, const __CFString *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (void *)CFPreferencesCopyAppValue(a2, CFSTR("com.apple.appprotectiond"));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "arrayByAddingObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CFPreferencesSetAppValue(a2, v6, CFSTR("com.apple.appprotectiond"));

}

void SGSetSiriCanLearnFromApp(void *a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v8;

  v8 = a1;
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
  else
    v5 = (void *)objc_opt_new();
  v6 = v5;
  if (a2)
  {
    objc_msgSend(v5, "removeObject:", v8);
  }
  else if ((objc_msgSend(v5, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", v8);
  }
  CFPreferencesSetAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), v6, CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);

}

id disabledLockScreenBundles()
{
  CFPropertyListRef v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  int v5;
  void *v6;

  v0 = CFPreferencesCopyValue(CFSTR("LockscreenSuggestionsDisabledBundles"), CFSTR("com.apple.duetexpertd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = (void *)v0;
  v2 = (void *)MEMORY[0x1E0C9AA60];
  if (v0)
    v2 = (void *)v0;
  v3 = v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", CFSTR("com.apple.application"));
  objc_msgSend(v4, "removeObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
  v5 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.DocumentsApp"));

  if (v5)
    objc_msgSend(v4, "addObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void SGSetAppCanShowSiriSuggestions(void *a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v8;

  v8 = a1;
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
  else
    v5 = (void *)objc_opt_new();
  v6 = v5;
  if (a2)
  {
    objc_msgSend(v5, "removeObject:", v8);
  }
  else if ((objc_msgSend(v5, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", v8);
  }
  CFPreferencesSetAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), v6, CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);

}

void restoreValue(void *a1, const __CFString *a2, const __CFString *a3)
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = (void *)CFPreferencesCopyAppValue(a3, CFSTR("com.apple.spotlightui"));
  v7 = objc_msgSend(v6, "containsObject:", v5);
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_debug_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEBUG, "%@ was off before, keeping it off for %@", buf, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v17 = a2;
      v18 = 2112;
      v19 = v5;
      _os_log_debug_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEBUG, "Reenabling %@ for %@", buf, 0x16u);
    }

    v10 = (void *)CFPreferencesCopyAppValue(a2, CFSTR("com.apple.spotlightui"));
    v15 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByExcludingObjectsInArray:", v11);
    v8 = objc_claimAutoreleasedReturnValue();

    CFPreferencesSetAppValue(a2, v8, CFSTR("com.apple.spotlightui"));
  }

  v14 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByExcludingObjectsInArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(a3, v13, CFSTR("com.apple.spotlightui"));
}

uint64_t checkAndRemoveBundleFromPriorActivatedList(void *a1, const __CFString *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (void *)CFPreferencesCopyAppValue(a2, CFSTR("com.apple.appprotectiond"));
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = a2;
    _os_log_debug_impl(&dword_1A2267000, v5, OS_LOG_TYPE_DEBUG, "Prior value: %@ for key: %@", buf, 0x16u);
  }

  v6 = objc_msgSend(v4, "containsObject:", v3);
  if ((_DWORD)v6)
  {
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByExcludingObjectsInArray:", v7);
    v8 = (const void *)objc_claimAutoreleasedReturnValue();

    CFPreferencesSetAppValue(a2, v8, CFSTR("com.apple.appprotectiond"));
    v4 = (void *)v8;
  }

  return v6;
}

void SGSetSiriPrefsLocked(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  CFStringRef *v6;
  CFStringRef *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  const __CFString *v27;
  __CFString *v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  id v42;
  _BYTE v43[128];
  _QWORD v44[2];
  _QWORD v45[5];

  v45[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v44[0] = CFSTR("SBSearchDisabledBundles");
  v44[1] = CFSTR("SBSearchDisabledShortcuts");
  v45[0] = CFSTR("SBSearchDisabledBundlesPriorValue");
  v45[1] = CFSTR("SBSearchDisabledShortcutsPriorValue");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (CFStringRef *)MEMORY[0x1E0C9B260];
  v7 = (CFStringRef *)MEMORY[0x1E0C9B230];
  if (a2)
  {
    v37 = 0uLL;
    v38 = 0uLL;
    v35 = 0uLL;
    v36 = 0uLL;
    v30 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v13 = *(const __CFString **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          cachePriorValuesAndSet(v3, v13, v14);

          v15 = (void *)CFPreferencesCopyAppValue(v13, CFSTR("com.apple.spotlightui"));
          if (v15)
          {
            v16 = v15;
            objc_msgSend(v15, "arrayByAddingObject:", v3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v42 = v3;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          CFPreferencesSetAppValue(v13, v17, CFSTR("com.apple.spotlightui"));

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v10);
    }

    v18 = v3;
    v19 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
    v20 = objc_msgSend(v19, "containsObject:", v18);

    v6 = (CFStringRef *)MEMORY[0x1E0C9B260];
    v7 = (CFStringRef *)MEMORY[0x1E0C9B230];
    if ((v20 & 1) == 0)
    {
      sgLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v18;
        _os_log_debug_impl(&dword_1A2267000, v21, OS_LOG_TYPE_DEBUG, "'Learn from this app' was on: %@", buf, 0xCu);
      }

      addBundleToPriorActivatedList(v18, CFSTR("SBSearchDisabledAppsPriorValue"));
    }
    SGSetSiriCanLearnFromApp(v18, 0);
    CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), *v6, *v7);
    notify_post("com.apple.spotlightui.prefschanged");
    v5 = v30;
  }
  else
  {
    v33 = 0uLL;
    v34 = 0uLL;
    v31 = 0uLL;
    v32 = 0uLL;
    v22 = v4;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          v27 = *(const __CFString **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v22, "objectForKeyedSubscript:", v27);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          restoreValue(v3, v27, v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v24);
    }

    if (checkAndRemoveBundleFromPriorActivatedList(v3, CFSTR("SBSearchDisabledAppsPriorValue")))
    {
      sgLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v3;
        _os_log_debug_impl(&dword_1A2267000, v29, OS_LOG_TYPE_DEBUG, "Reenabling 'Learn from this app' for %@", buf, 0xCu);
      }

      SGSetSiriCanLearnFromApp(v3, 1);
    }
  }
  CFPreferencesSynchronize(CFSTR("com.apple.appprotectiond"), *v6, *v7);

}

uint64_t SGM2EventBannerConfirmedReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_74:
          v56 = 8;
          goto LABEL_99;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_78:
          v56 = 12;
          goto LABEL_99;
        case 4u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 0x10u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_82:
          v56 = 24;
          goto LABEL_99;
        case 5u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 0x20u;
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
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v22 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_86:
          v56 = 40;
          goto LABEL_99;
        case 6u:
          v41 = 0;
          v42 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 0x40u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v22 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_90:
          v56 = 44;
          goto LABEL_99;
        case 7u:
          v46 = 0;
          v47 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
          while (2)
          {
            v48 = *v3;
            v49 = *(_QWORD *)(a2 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
              *(_QWORD *)(a2 + v48) = v49 + 1;
              v22 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_94:
          v56 = 16;
          goto LABEL_99;
        case 8u:
          v51 = 0;
          v52 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v22 |= (unint64_t)(v55 & 0x7F) << v51;
        if ((v55 & 0x80) == 0)
          goto LABEL_96;
        v51 += 7;
        v14 = v52++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_98;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_96:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_98:
      v56 = 20;
LABEL_99:
      *(_DWORD *)(a1 + v56) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void SGParseNamedEmailAddress(const char *a1, void *a2)
{
  size_t v3;
  const char *v4;
  int v5;
  const char *v6;
  const char *v7;
  const char *v8;
  unint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  unsigned int v13;
  const char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  const char *v19;
  char *v20;
  int v21;
  int v22;
  char *v23;
  char *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int v32;
  char *v33;
  char *v34;
  int v35;
  int v36;
  void *v37;
  int v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  char *v42;
  int v43;
  int v44;
  int v45;
  unsigned __int8 *v46;
  int v47;
  unsigned __int8 *v48;
  _BYTE *v49;
  char *v50;
  char *v51;
  int v52;
  int v53;
  unsigned int v54;
  char *v55;
  int v56;
  int v57;
  char *v58;
  int v59;
  int v60;
  char *v61;
  char *v62;
  int v63;
  int v64;
  unsigned int v65;
  char *v66;
  char *v67;
  char *v68;
  int v69;
  int v70;
  char *v71;
  char *v72;
  int v73;
  int v74;
  int v75;
  char *v76;
  char *v77;
  int v78;
  int v79;
  void *v80;
  void *v81;
  char *v82;
  int v83;
  int v84;
  void *v85;
  void *v86;
  int v87;
  int v88;
  void *v89;
  unsigned __int8 *v90;
  int v91;
  char *v92;
  int v93;
  int v94;
  int v95;
  unsigned int v96;
  int v97;
  unsigned int v98;
  char *v99;
  int v100;
  int v101;
  char *v102;
  int v103;
  int v104;
  char *v105;
  int v106;
  int v107;
  char *v108;
  char *v109;
  int v110;
  int v111;
  int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  char *v116;
  int v117;
  int v118;
  const char *v119;
  void (**v120)(id, _QWORD, void *);
  size_t v121;

  v120 = a2;
  v3 = strlen(a1);
  v4 = a1;
  v5 = 0;
  v6 = 0;
  v7 = &a1[v3];
  v119 = a1;
  v121 = v3;
  if (!v3)
  {
    v13 = 32;
    v14 = a1;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_588;
  }
  v8 = a1;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  while (2)
  {
    v15 = *v8;
    if (v15 <= 59)
    {
      if (v15 != 32)
      {
        if (v15 == 34)
        {
          v16 = (char *)(v8 + 1);
          if (v8 + 1 != v7)
          {
            v17 = *v16;
            v5 = 4;
            if (v17 <= 59)
            {
              if (v17 != 32)
              {
                v33 = (char *)(v8 + 1);
                v19 = v8 + 1;
                if (v17 == 34)
                {
                  v10 = (char *)(v8 + 1);
                  v19 = v8 + 1;
                  v9 = (unint64_t)v8;
                  goto LABEL_265;
                }
                goto LABEL_170;
              }
            }
            else if (v17 != 60 && v17 != 62)
            {
              if (v17 == 64)
              {
                v10 = (char *)(v8 + 2);
                v18 = (char *)(v8 + 1);
                v6 = v8 + 1;
                goto LABEL_121;
              }
              v33 = (char *)(v8 + 1);
              v19 = v8 + 1;
LABEL_170:
              while (2)
              {
                v42 = v33 + 1;
                do
                {
                  while (1)
                  {
                    if (v42 == v7)
                    {
                      v13 = 23;
                      v14 = v7;
                      v6 = v19;
                      goto LABEL_194;
                    }
                    v44 = *v42++;
                    v43 = v44;
                    if (v44 > 59)
                      break;
                    if (v43 == 32)
                      goto LABEL_186;
                    if (v43 == 34)
                    {
                      v33 = v42 - 1;
LABEL_180:
                      v9 = (unint64_t)v8;
                      v12 = v33;
LABEL_181:
                      v10 = v33 + 1;
                      if (v33 + 1 == v7)
                      {
                        v13 = 25;
                        v14 = v7;
                        v6 = v19;
                        v10 = (char *)v7;
                        v11 = (char *)(v8 + 1);
                        goto LABEL_588;
                      }
                      v45 = *v10;
                      if (v45 <= 61)
                      {
                        if (v45 != 32)
                        {
                          v11 = (char *)(v8 + 1);
                          if (v45 != 60)
                            goto LABEL_265;
                          goto LABEL_395;
                        }
                        v49 = v33 + 1;
                        v8 = (const char *)v9;
                        v11 = v16;
LABEL_501:
                        v14 = &v4[v121];
                        v99 = v49 + 1;
                        while (v99 != v7)
                        {
                          v101 = *v99++;
                          v100 = v101;
                          if (v101 != 32)
                          {
                            if (v100 != 60)
                              goto LABEL_582;
                            v76 = v99 - 1;
                            v9 = (unint64_t)v8;
                            goto LABEL_506;
                          }
                        }
                        v13 = 16;
LABEL_514:
                        v6 = v19;
                        v9 = (unint64_t)v8;
                        goto LABEL_588;
                      }
                      if (v45 == 62)
                      {
                        v11 = (char *)(v8 + 1);
                        goto LABEL_395;
                      }
                      if (v45 != 64)
                      {
                        v11 = (char *)(v8 + 1);
                        goto LABEL_265;
                      }
                      v14 = &v4[v121];
                      v11 = (char *)(v8 + 1);
                      v20 = v33 + 1;
                      while (2)
                      {
                        v61 = v20 + 1;
                        do
                        {
                          if (v61 == v7)
                          {
                            v13 = 21;
                            goto LABEL_316;
                          }
                          v10 = v61;
                          v62 = v61 - 1;
                          v63 = *v61++;
                        }
                        while (v63 == 64);
                        if (v63 > 61)
                        {
                          if (v63 == 62)
                            goto LABEL_347;
                          if (v63 != 95)
                            goto LABEL_284;
                          v62 = v61 - 2;
                        }
                        else
                        {
                          if (v63 == 32 || v63 == 60)
                          {
LABEL_347:
                            v10 = v61 - 1;
                            goto LABEL_395;
                          }
LABEL_284:
                          if ((char)v63 > 47)
                          {
                            if (v63 >= 0x3Au)
                            {
                              if (v63 < 0x5Bu)
                              {
                                if (v63 <= 0x40u)
                                  goto LABEL_265;
                              }
                              else if (v63 - 97 >= 0x1A)
                              {
                                goto LABEL_265;
                              }
                            }
                          }
                          else if ((char)v63 < 45 || v63 == 47)
                          {
                            goto LABEL_265;
                          }
                        }
                        v20 = v62 + 2;
                        if (v62 + 2 == v7)
                        {
                          v5 = 3;
                          v13 = 35;
                          v14 = v7;
                          v6 = v7;
                          goto LABEL_587;
                        }
LABEL_294:
                        v64 = *v20;
                        if (v64 <= 63)
                        {
                          if (v64 == 32 || v64 == 60 || v64 == 62)
                          {
                            v5 = 3;
                            v10 = v20;
LABEL_433:
                            v8 = v20 - 1;
                            v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, &v10[-v9], 4);
                            v120[2](v120, 0, v89);

                            v4 = v119;
LABEL_434:
                            v19 = v20;
                            goto LABEL_435;
                          }
LABEL_301:
                          v65 = *v20;
                          if ((char)v65 > 47)
                          {
                            if (v65 >= 0x3A)
                            {
                              if (v65 < 0x5B)
                              {
                                if (v65 <= 0x40)
                                {
LABEL_383:
                                  v5 = 3;
LABEL_384:
                                  v10 = v20;
                                  v19 = v20;
LABEL_265:
                                  v14 = &v4[v121];
                                  v58 = v10 + 1;
                                  do
                                  {
                                    while (1)
                                    {
                                      if (v58 == v7)
                                      {
                                        v13 = 20;
                                        goto LABEL_316;
                                      }
                                      v60 = *v58++;
                                      v59 = v60;
                                      if (v60 > 61)
                                        break;
                                      if (v59 == 32 || v59 == 60)
                                      {
LABEL_312:
                                        v10 = v58 - 1;
                                        goto LABEL_395;
                                      }
                                    }
                                    if (v59 == 62)
                                      goto LABEL_312;
                                  }
                                  while (v59 != 64);
                                  v20 = v58 - 1;
                                  continue;
                                }
                              }
                              else if (v65 - 97 >= 0x1A)
                              {
                                goto LABEL_383;
                              }
                            }
                          }
                          else
                          {
                            v5 = 3;
                            if ((char)v65 < 45 || v65 == 47)
                              goto LABEL_384;
                          }
                        }
                        else if (v64 != 95)
                        {
                          if (v64 == 64)
                          {
                            v5 = 3;
                            v19 = v20;
                            continue;
                          }
                          goto LABEL_301;
                        }
                        break;
                      }
                      if (++v20 == v7)
                      {
                        v5 = 3;
                        v13 = 35;
                        v6 = v14;
                        goto LABEL_317;
                      }
                      goto LABEL_294;
                    }
                  }
                  if (v43 == 60 || v43 == 62)
                  {
LABEL_186:
                    v33 = v42 - 1;
LABEL_187:
                    v10 = v33;
LABEL_188:
                    v46 = (unsigned __int8 *)(v33 + 1);
                    while (v46 != (unsigned __int8 *)v7)
                    {
                      v47 = *v46++;
                      if (v47 == 34)
                      {
                        v48 = v46 - 1;
                        v11 = (char *)(v8 + 1);
                        v12 = (char *)v48;
                        goto LABEL_499;
                      }
                    }
                    v13 = 24;
                    v14 = v7;
                    v6 = v19;
                    v9 = (unint64_t)v8;
LABEL_195:
                    v11 = (char *)(v8 + 1);
LABEL_196:
                    v12 = (char *)v7;
                    goto LABEL_588;
                  }
                }
                while (v43 != 64);
                v33 = v42 - 1;
LABEL_197:
                while (2)
                {
                  v10 = v33 + 1;
                  v18 = v33;
                  v6 = v19;
LABEL_121:
                  v33 = v18 + 1;
                  if (v18 + 1 == v7)
                  {
                    v13 = 26;
                    v14 = v7;
                    v9 = (unint64_t)v8;
                    v11 = (char *)(v8 + 1);
                    v12 = v10;
                    goto LABEL_588;
                  }
                  v38 = *v33;
                  v39 = *v33;
                  if (v38 <= 61)
                  {
                    if (v38 != 32)
                    {
                      if (v38 == 34)
                      {
                        v19 = v6;
                        v9 = (unint64_t)v8;
                        v12 = v10;
                        goto LABEL_181;
                      }
                      if (v38 != 60)
                        goto LABEL_155;
                    }
LABEL_152:
                    v19 = v6;
                    goto LABEL_188;
                  }
                  if (v38 == 62)
                    goto LABEL_152;
                  if (v38 == 64)
                  {
                    v19 = v6;
                    continue;
                  }
                  break;
                }
                if (v38 != 95)
                {
LABEL_155:
                  if ((char)v39 > 47)
                  {
                    if (v39 < 0x3A)
                      break;
                    if (v39 < 0x5B)
                    {
                      if (v39 >= 0x41)
                        break;
                    }
                    else if (v39 - 97 < 0x1A)
                    {
                      break;
                    }
                  }
                  else if ((char)v39 >= 45 && v39 != 47)
                  {
                    break;
                  }
                  v19 = v6;
                  continue;
                }
                break;
              }
              v33 = v18 + 2;
              if (v18 + 2 == v7)
              {
                v5 = 3;
                v13 = 39;
                v14 = v7;
                v6 = v7;
LABEL_194:
                v9 = (unint64_t)v8;
                v10 = (char *)v7;
                goto LABEL_195;
              }
              v14 = &v4[v121];
              while (1)
              {
                v40 = *v33;
                if (v40 <= 61)
                {
                  switch(v40)
                  {
                    case ' ':
                      goto LABEL_164;
                    case '"':
                      v5 = 3;
                      v19 = v33;
                      goto LABEL_180;
                    case '<':
LABEL_164:
                      v5 = 3;
                      v19 = v33;
                      goto LABEL_187;
                  }
                }
                else
                {
                  switch(v40)
                  {
                    case '_':
                      goto LABEL_150;
                    case '>':
                      goto LABEL_164;
                    case '@':
                      v5 = 3;
                      v19 = v33;
                      goto LABEL_197;
                  }
                }
                v41 = *v33;
                if ((char)v41 > 47)
                {
                  if (v41 >= 0x3A)
                  {
                    if (v41 < 0x5B)
                    {
                      if (v41 <= 0x40)
                      {
LABEL_168:
                        v5 = 3;
LABEL_169:
                        v19 = v33;
                        goto LABEL_170;
                      }
                    }
                    else if (v41 - 97 >= 0x1A)
                    {
                      goto LABEL_168;
                    }
                  }
                }
                else
                {
                  v5 = 3;
                  if ((char)v41 < 45 || v41 == 47)
                    goto LABEL_169;
                }
LABEL_150:
                ++v33;
                v5 = 3;
                v13 = 39;
                if (v33 == v7)
                {
                  v6 = &v4[v121];
                  v9 = (unint64_t)v8;
                  v10 = (char *)&v4[v121];
                  v11 = (char *)(v8 + 1);
LABEL_496:
                  v12 = (char *)v14;
                  goto LABEL_588;
                }
              }
            }
            v33 = (char *)(v8 + 1);
            v19 = v8 + 1;
            v10 = (char *)(v8 + 1);
            goto LABEL_188;
          }
          v5 = 4;
          v13 = 38;
          v14 = v7;
          v6 = v7;
LABEL_584:
          v9 = (unint64_t)v8;
          goto LABEL_587;
        }
        goto LABEL_78;
      }
      v20 = (char *)(v8 + 1);
      if (v8 + 1 == v7)
      {
        v5 = 4;
        v13 = 37;
        v14 = v7;
        v6 = v7;
        goto LABEL_88;
      }
      v21 = *v20;
      v5 = 4;
      if (v21 > 59)
      {
        if (v21 != 60 && v21 != 62)
        {
LABEL_102:
          v14 = &v4[v121];
          v19 = v8 + 1;
          v11 = (char *)v8;
          while (1)
          {
            v72 = v20 + 1;
            while (1)
            {
              while (1)
              {
                if (v72 == v7)
                {
                  v13 = 2;
                  goto LABEL_330;
                }
                v74 = *v72++;
                v73 = v74;
                if (v74 <= 59)
                  break;
                if (v73 == 60 || v73 == 62)
                {
LABEL_346:
                  v12 = v72 - 1;
                  goto LABEL_395;
                }
              }
              if (v73 == 32)
                break;
              if (v73 == 34)
                goto LABEL_346;
            }
            v20 = v72 - 1;
LABEL_322:
            v14 = &v4[v121];
            v66 = v20 + 1;
            while (2)
            {
              if (v66 == v7)
              {
                v13 = 1;
LABEL_330:
                v6 = v19;
                goto LABEL_496;
              }
              v67 = v66 + 1;
              v68 = v66 - 1;
              v69 = *v66++;
              if (v69 == 32)
                continue;
              break;
            }
            if (v69 == 34)
              goto LABEL_328;
            if (v69 == 60)
              break;
            if (v69 == 62)
            {
LABEL_328:
              v12 = v67 - 1;
              goto LABEL_395;
            }
            v20 = v67 - 1;
          }
          v8 = v68 + 2;
          if (v68 + 2 == v7)
          {
            v13 = 3;
            v14 = v7;
            v6 = v19;
            goto LABEL_196;
          }
          v70 = *v8;
          if (v70 <= 61)
          {
            if (v70 == 32)
            {
              v76 = v68 + 2;
              v12 = (char *)v8;
LABEL_506:
              v102 = v76 + 1;
              do
              {
                if (v102 == v7)
                {
                  v13 = 8;
                  goto LABEL_437;
                }
                v104 = *v102++;
                v103 = v104;
              }
              while (v104 == 32);
              if (v103 == 60 || v103 == 62)
                goto LABEL_395;
              v71 = v102 - 1;
              v8 = v102 - 1;
              goto LABEL_533;
            }
            v12 = v68 + 2;
            v71 = v68 + 2;
            goto LABEL_335;
          }
          if (v70 == 62)
          {
            v12 = v68 + 2;
            goto LABEL_395;
          }
          if (v70 != 104)
          {
            v71 = v68 + 2;
            v12 = v68 + 2;
            goto LABEL_533;
          }
          v10 = v68 + 3;
          if (v68 + 3 == v7)
          {
            v13 = 9;
            goto LABEL_516;
          }
          v70 = *v10;
          if (v70 > 61)
          {
            if (v70 == 62)
              goto LABEL_381;
            if (v70 == 64)
              goto LABEL_382;
            if (v70 != 116)
              goto LABEL_386;
            v10 = v68 + 4;
            if (v68 + 4 == v7)
            {
              v13 = 10;
              goto LABEL_516;
            }
            v70 = *v10;
            if (v70 > 61)
            {
              if (v70 == 62)
                goto LABEL_381;
              if (v70 == 64)
                goto LABEL_382;
              if (v70 != 116)
                goto LABEL_386;
              v10 = v68 + 5;
              if (v68 + 5 == v7)
              {
                v13 = 11;
                goto LABEL_516;
              }
              v70 = *v10;
              if (v70 > 61)
              {
                if (v70 == 62)
                  goto LABEL_381;
                if (v70 != 64)
                {
                  if (v70 == 112)
                  {
                    v12 = v68 + 6;
                    if (v68 + 6 == v7)
                    {
                      v13 = 12;
                      goto LABEL_516;
                    }
                    v75 = *v12;
                    if (v75 > 61)
                    {
                      if (v75 == 62)
                      {
                        v9 = (unint64_t)v8;
                        v10 = v12;
                        goto LABEL_395;
                      }
                      if (v75 == 64)
                      {
LABEL_453:
                        v10 = v12 + 1;
                        if (v12 + 1 == v7)
                        {
                          v13 = 17;
                          goto LABEL_516;
                        }
                        while (1)
                        {
                          v95 = *v10;
                          if (v95 <= 63)
                            break;
                          if (v95 != 64)
                          {
                            if (v95 != 95)
                              goto LABEL_458;
LABEL_470:
                            if (++v10 != v7)
                            {
                              while (2)
                              {
                                v97 = *v10;
                                if (v97 <= 63)
                                {
                                  switch(v97)
                                  {
                                    case ' ':
                                      v105 = v10 + 1;
                                      while (v105 != v7)
                                      {
                                        v107 = *v105++;
                                        v106 = v107;
                                        if (v107 != 32)
                                        {
                                          if (v106 == 62)
                                          {
                                            v108 = v105 - 2;
                                            goto LABEL_526;
                                          }
                                          v12 = v105 - 1;
LABEL_438:
                                          v90 = (unsigned __int8 *)(v12 + 1);
                                          while (v90 != (unsigned __int8 *)v7)
                                          {
                                            v91 = *v90++;
                                            if (v91 == 62)
                                            {
                                              v48 = v90 - 1;
                                              goto LABEL_498;
                                            }
                                          }
                                          v13 = 14;
LABEL_443:
                                          v6 = v19;
                                          v9 = (unint64_t)v8;
                                          goto LABEL_496;
                                        }
                                      }
                                      v13 = 19;
                                      goto LABEL_443;
                                    case '<':
                                      goto LABEL_519;
                                    case '>':
                                      v108 = v10 - 1;
LABEL_526:
                                      v19 = v108 + 2;
                                      v5 = 1;
                                      if (v108 + 2 == v7)
                                      {
                                        v13 = 34;
                                        v14 = v7;
                                        v6 = v7;
                                        v9 = (unint64_t)v8;
                                        goto LABEL_196;
                                      }
                                      v9 = (unint64_t)v8;
                                      v12 = v108 + 2;
                                      v49 = v108 + 2;
                                      if (*v19 == 32)
                                        goto LABEL_501;
LABEL_424:
                                      v8 = v19 - 1;
                                      if ((unint64_t)v12 <= v9)
                                        v82 = v12;
                                      else
                                        v82 = (char *)v9;
                                      if (v82 <= v11)
                                        goto LABEL_421;
                                      v12 = v82;
                                      do
                                      {
                                        v88 = *--v12;
                                        v87 = v88;
                                        if (v88 != 60 && v87 != 32)
                                          goto LABEL_421;
                                        v82 = v12;
                                      }
                                      while (v12 > v11);
LABEL_422:
                                      v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v11, v12 - v11, 4);
                                      v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, &v10[-v9], 4);
                                      ((void (**)(id, void *, void *))v120)[2](v120, v85, v86);

LABEL_394:
                                      v4 = v119;
                                      goto LABEL_435;
                                  }
LABEL_478:
                                  v98 = *v10;
                                  if ((char)v98 > 47)
                                  {
                                    if (v98 >= 0x3A)
                                    {
                                      if (v98 < 0x5B)
                                      {
                                        if (v98 <= 0x40)
                                          goto LABEL_528;
                                      }
                                      else if (v98 - 97 >= 0x1A)
                                      {
                                        goto LABEL_528;
                                      }
                                    }
                                  }
                                  else if ((char)v98 < 45 || v98 == 47)
                                  {
                                    goto LABEL_528;
                                  }
                                }
                                else if (v97 != 95)
                                {
                                  if (v97 == 64)
                                    goto LABEL_489;
                                  goto LABEL_478;
                                }
                                if (++v10 == v7)
                                {
                                  v13 = 18;
LABEL_494:
                                  v6 = v19;
                                  v9 = (unint64_t)v8;
                                  goto LABEL_495;
                                }
                                continue;
                              }
                            }
                            v13 = 18;
LABEL_516:
                            v14 = v7;
                            v6 = v19;
                            v9 = (unint64_t)v8;
                            goto LABEL_517;
                          }
LABEL_489:
                          ++v10;
                          v13 = 17;
                          if (v10 == v7)
                            goto LABEL_516;
                        }
                        if (v95 == 32 || v95 == 60)
                        {
LABEL_519:
                          v12 = v10;
                          goto LABEL_438;
                        }
                        if (v95 == 62)
                        {
                          v48 = (unsigned __int8 *)v10;
                          goto LABEL_498;
                        }
LABEL_458:
                        v96 = *v10;
                        if ((char)v96 > 47)
                        {
                          if (v96 < 0x3A)
                            goto LABEL_470;
                          if (v96 < 0x5B)
                          {
                            if (v96 > 0x40)
                              goto LABEL_470;
                          }
                          else if (v96 - 97 <= 0x19)
                          {
                            goto LABEL_470;
                          }
                        }
                        else if ((char)v96 >= 45 && v96 != 47)
                        {
                          goto LABEL_470;
                        }
LABEL_528:
                        v12 = v10;
                      }
                    }
                    else
                    {
                      if (v75 == 32)
                      {
LABEL_492:
                        v10 = v12;
                        goto LABEL_438;
                      }
                      v10 = v12;
                      if (v75 == 60)
                        goto LABEL_438;
                    }
                    v92 = v12 + 1;
                    while (1)
                    {
                      while (1)
                      {
                        if (v92 == v7)
                        {
                          v13 = 13;
                          goto LABEL_494;
                        }
                        v94 = *v92++;
                        v93 = v94;
                        if (v94 > 61)
                          break;
                        if (v93 == 32 || v93 == 60)
                        {
                          v12 = v92 - 1;
                          goto LABEL_492;
                        }
                      }
                      if (v93 == 62)
                        break;
                      if (v93 == 64)
                      {
                        v12 = v92 - 1;
                        goto LABEL_453;
                      }
                    }
                    v48 = (unsigned __int8 *)(v92 - 1);
                    v10 = v92 - 1;
LABEL_498:
                    v12 = (char *)(v48 + 1);
LABEL_499:
                    v49 = v48 + 1;
                    if (v48 + 1 != (unsigned __int8 *)v7)
                    {
                      v9 = (unint64_t)v8;
                      if (*v49 != 32)
                        goto LABEL_395;
                      goto LABEL_501;
                    }
                    v13 = 15;
                    v14 = v7;
                    goto LABEL_514;
                  }
LABEL_386:
                  v71 = v10;
                  v12 = v10;
                  goto LABEL_533;
                }
LABEL_382:
                v9 = (unint64_t)(v68 + 2);
                v12 = v10;
LABEL_542:
                if (++v10 == v7)
                {
                  v13 = 5;
                  goto LABEL_586;
                }
                v14 = &v4[v121];
                while (1)
                {
                  v112 = *v10;
                  if (v112 <= 63)
                    break;
                  if (v112 != 64)
                  {
                    if (v112 != 95)
                      goto LABEL_548;
LABEL_560:
                    if (++v10 != v7)
                    {
                      while (2)
                      {
                        v114 = *v10;
                        if (v114 > 63)
                        {
                          if (v114 != 95)
                          {
                            if (v114 == 64)
                              goto LABEL_579;
LABEL_568:
                            v115 = *v10;
                            if ((char)v115 > 47)
                            {
                              if (v115 >= 0x3A)
                              {
                                if (v115 < 0x5B)
                                {
                                  if (v115 <= 0x40)
                                    goto LABEL_600;
                                }
                                else if (v115 - 97 >= 0x1A)
                                {
                                  goto LABEL_600;
                                }
                              }
                            }
                            else if ((char)v115 < 45 || v115 == 47)
                            {
                              goto LABEL_600;
                            }
                          }
                          if (++v10 == v7)
                          {
                            v13 = 6;
LABEL_316:
                            v6 = v19;
LABEL_317:
                            v10 = (char *)v14;
                            goto LABEL_588;
                          }
                          continue;
                        }
                        break;
                      }
                      switch(v114)
                      {
                        case ' ':
                          v116 = v10 + 1;
                          while (v116 != v7)
                          {
                            v118 = *v116++;
                            v117 = v118;
                            if (v118 != 32)
                            {
                              if (v117 != 62)
                                goto LABEL_395;
                              v8 = v116 - 1;
LABEL_412:
                              v19 = v8 + 1;
                              if ((unint64_t)v12 <= v9)
                                v82 = v12;
                              else
                                v82 = (char *)v9;
                              if (v82 > v11)
                              {
                                v12 = v82;
                                while (1)
                                {
                                  v84 = *--v12;
                                  v83 = v84;
                                  if (v84 != 60 && v83 != 32)
                                    break;
                                  v82 = v12;
                                  if (v12 <= v11)
                                    goto LABEL_422;
                                }
                              }
LABEL_421:
                              v12 = v82;
                              goto LABEL_422;
                            }
                          }
                          v13 = 7;
                          goto LABEL_437;
                        case '<':
                          goto LABEL_395;
                        case '>':
                          v8 = v10;
                          goto LABEL_412;
                      }
                      goto LABEL_568;
                    }
                    v13 = 6;
LABEL_586:
                    v14 = v7;
                    v6 = v19;
LABEL_587:
                    v10 = (char *)v7;
                    goto LABEL_588;
                  }
LABEL_579:
                  ++v10;
                  v13 = 5;
                  if (v10 == v7)
                    goto LABEL_586;
                }
                if (v112 == 32 || v112 == 60 || v112 == 62)
                  goto LABEL_395;
LABEL_548:
                v113 = *v10;
                if ((char)v113 > 47)
                {
                  if (v113 < 0x3A)
                    goto LABEL_560;
                  if (v113 < 0x5B)
                  {
                    if (v113 >= 0x41)
                      goto LABEL_560;
                  }
                  else if (v113 - 97 < 0x1A)
                  {
                    goto LABEL_560;
                  }
                }
                else if ((char)v113 >= 45 && v113 != 47)
                {
                  goto LABEL_560;
                }
LABEL_600:
                v71 = v10;
                v8 = (const char *)v9;
                goto LABEL_533;
              }
            }
          }
          if (v70 == 32)
          {
LABEL_381:
            v9 = (unint64_t)(v68 + 2);
            goto LABEL_314;
          }
          v9 = (unint64_t)(v68 + 2);
          v12 = v10;
          v71 = v10;
LABEL_335:
          if (v70 == 60)
            goto LABEL_395;
LABEL_533:
          v109 = v71 + 1;
          while (v109 != v7)
          {
            v111 = *v109++;
            v110 = v111;
            if (v111 > 61)
            {
              if (v110 == 62)
                goto LABEL_581;
              if (v110 == 64)
              {
                v10 = v109 - 1;
                v9 = (unint64_t)v8;
                goto LABEL_542;
              }
            }
            else if (v110 == 32 || v110 == 60)
            {
LABEL_581:
              v10 = v109 - 1;
LABEL_582:
              v9 = (unint64_t)v8;
              goto LABEL_395;
            }
          }
          v13 = 4;
          v14 = v7;
          v6 = v19;
          goto LABEL_584;
        }
      }
      else
      {
        if (v21 == 32)
        {
          v19 = v8 + 1;
          goto LABEL_104;
        }
        if (v21 != 34)
          goto LABEL_102;
      }
      v11 = (char *)v8;
      v12 = (char *)(v8 + 1);
      goto LABEL_593;
    }
    if (v15 != 60)
    {
      if (v15 == 62)
      {
        v19 = v8 + 1;
        goto LABEL_435;
      }
LABEL_78:
      v10 = (char *)(v8 + 1);
      if (v8 + 1 != v7)
      {
        v32 = *v10;
        v5 = 4;
        if (v32 > 59)
        {
          if (v32 != 60 && v32 != 62)
          {
            if (v32 == 64)
            {
              v14 = &v4[v121];
              v11 = (char *)v8;
              v9 = (unint64_t)v8;
              v20 = (char *)(v8 + 1);
              v19 = v8 + 1;
              goto LABEL_205;
            }
            v19 = v8 + 1;
            v9 = (unint64_t)v8;
            v11 = (char *)v8;
LABEL_254:
            while (1)
            {
              v14 = &v4[v121];
              v55 = v10 + 1;
              do
              {
                while (1)
                {
                  if (v55 == v7)
                  {
                    v13 = 0;
                    goto LABEL_319;
                  }
                  v57 = *v55++;
                  v56 = v57;
                  if (v57 > 59)
                    break;
                  if (v56 == 32)
                  {
                    v20 = v55 - 1;
                    goto LABEL_321;
                  }
                  if (v56 == 34)
                  {
                    v10 = v55 - 1;
                    goto LABEL_264;
                  }
                }
                if (v56 == 60 || v56 == 62)
                {
                  v10 = v55 - 1;
                  goto LABEL_314;
                }
              }
              while (v56 != 64);
              v20 = v55 - 1;
LABEL_205:
              v50 = v20 + 1;
              while (2)
              {
                if (v50 == v7)
                {
                  v13 = 22;
LABEL_319:
                  v6 = v19;
                  goto LABEL_495;
                }
                v10 = v50;
                v51 = v50 - 1;
                v52 = *v50++;
                if (v52 == 64)
                  continue;
                break;
              }
              if (v52 <= 59)
                break;
              if (v52 == 60 || v52 == 62)
              {
                v10 = v50 - 1;
LABEL_314:
                v12 = v10;
                goto LABEL_395;
              }
              if (v52 == 95)
              {
                v51 = v50 - 2;
                goto LABEL_224;
              }
LABEL_215:
              if ((char)v52 > 47)
              {
                if (v52 >= 0x3Au)
                {
                  if (v52 < 0x5Bu)
                  {
                    if (v52 <= 0x40u)
                      continue;
                  }
                  else if (v52 - 97 >= 0x1A)
                  {
                    continue;
                  }
                }
              }
              else if ((char)v52 < 45 || v52 == 47)
              {
                continue;
              }
LABEL_224:
              v20 = v51 + 2;
              if (v51 + 2 == v7)
              {
                v5 = 3;
                v13 = 36;
                v14 = v7;
                v6 = v7;
LABEL_517:
                v10 = (char *)v7;
                goto LABEL_196;
              }
              while (2)
              {
                v53 = *v20;
                if (v53 <= 61)
                {
                  if (v53 != 32)
                  {
                    if (v53 == 34)
                    {
                      v5 = 3;
                      v10 = v20;
                      v19 = v20;
                      v12 = v20;
                      goto LABEL_265;
                    }
                    if (v53 == 60)
                    {
LABEL_248:
                      v5 = 3;
                      v10 = v20;
                      v12 = v20;
                      goto LABEL_433;
                    }
                    goto LABEL_233;
                  }
                  v5 = 3;
                  v19 = v20;
                  goto LABEL_321;
                }
                switch(v53)
                {
                  case '_':
                    goto LABEL_242;
                  case '>':
                    goto LABEL_248;
                  case '@':
                    v5 = 3;
                    v19 = v20;
                    goto LABEL_205;
                }
LABEL_233:
                v54 = *v20;
                if ((char)v54 <= 47)
                {
                  v5 = 3;
                  if ((char)v54 < 45 || v54 == 47)
                    goto LABEL_253;
LABEL_242:
                  if (++v20 == v7)
                  {
                    v5 = 3;
                    v13 = 36;
                    v6 = v14;
LABEL_495:
                    v10 = (char *)v14;
                    goto LABEL_496;
                  }
                  continue;
                }
                break;
              }
              if (v54 < 0x3A)
                goto LABEL_242;
              if (v54 >= 0x5B)
              {
                if (v54 - 97 >= 0x1A)
                  goto LABEL_252;
                goto LABEL_242;
              }
              if (v54 > 0x40)
                goto LABEL_242;
LABEL_252:
              v5 = 3;
LABEL_253:
              v10 = v20;
              v19 = v20;
            }
            if (v52 != 32)
            {
              if (v52 != 34)
                goto LABEL_215;
              v10 = v50 - 1;
LABEL_264:
              v12 = v10;
              goto LABEL_265;
            }
            v20 = v50 - 1;
LABEL_321:
            v10 = v20;
            goto LABEL_322;
          }
          v20 = (char *)(v8 + 1);
          v9 = (unint64_t)v8;
          v11 = (char *)v8;
          v12 = (char *)(v8 + 1);
LABEL_593:
          v8 = v20 - 1;
          goto LABEL_434;
        }
        if (v32 != 32)
        {
          v19 = v8 + 1;
          v9 = (unint64_t)v8;
          v11 = (char *)v8;
          v12 = (char *)(v8 + 1);
          if (v32 == 34)
            goto LABEL_265;
          goto LABEL_254;
        }
        v20 = (char *)(v8 + 1);
        v19 = v8 + 1;
        v9 = (unint64_t)v8;
LABEL_104:
        v11 = (char *)v8;
        goto LABEL_322;
      }
      v5 = 4;
      v13 = 33;
      v14 = v7;
      v6 = v7;
      v9 = (unint64_t)v8;
      v10 = (char *)v7;
LABEL_88:
      v11 = (char *)v8;
      goto LABEL_196;
    }
    v6 = v8 + 1;
    if (v8 + 1 == v7)
    {
      v13 = 40;
      v14 = v7;
      v6 = v7;
      goto LABEL_588;
    }
    v22 = *v6;
    if (v22 == 62 || v22 == 60)
    {
      v20 = (char *)(v8 + 1);
      goto LABEL_593;
    }
    v23 = (char *)(v8 + 1);
    if (v22 == 32)
    {
      v14 = &v4[v121];
      v24 = (char *)(v8 + 2);
      do
      {
        if (v24 == v7)
        {
          v13 = 31;
          goto LABEL_588;
        }
        v26 = *v24++;
        v25 = v26;
      }
      while (v26 == 32);
      if (v25 == 60 || v25 == 62)
        goto LABEL_592;
      v23 = v24 - 1;
    }
    v10 = v23 + 1;
    if (v23 + 1 == v7)
    {
      v13 = 27;
LABEL_106:
      v14 = v7;
      v9 = (unint64_t)v23;
      goto LABEL_587;
    }
    v14 = &v4[v121];
    while (1)
    {
      v27 = *v10;
      if (v27 > 63)
        break;
      if (v27 == 32 || v27 == 60 || v27 == 62)
        goto LABEL_115;
LABEL_76:
      ++v10;
      v13 = 27;
      if (v10 == v7)
        goto LABEL_106;
    }
    if (v27 != 64)
      goto LABEL_76;
    if (++v10 == v7)
    {
      v13 = 28;
      goto LABEL_106;
    }
    while (1)
    {
      v28 = *v10;
      if (v28 <= 63)
      {
        if (v28 == 32 || v28 == 60 || v28 == 62)
          goto LABEL_115;
LABEL_40:
        v29 = *v10;
        if ((char)v29 > 47)
        {
          if (v29 < 0x3A)
            goto LABEL_52;
          if (v29 < 0x5B)
          {
            if (v29 >= 0x41)
              goto LABEL_52;
          }
          else if (v29 - 97 < 0x1A)
          {
            goto LABEL_52;
          }
        }
        else if ((char)v29 >= 45 && v29 != 47)
        {
          goto LABEL_52;
        }
        goto LABEL_76;
      }
      if (v28 != 64)
        break;
LABEL_71:
      ++v10;
      v13 = 28;
      if (v10 == v7)
        goto LABEL_106;
    }
    if (v28 != 95)
      goto LABEL_40;
LABEL_52:
    if (++v10 == v7)
    {
      v13 = 29;
      goto LABEL_106;
    }
    while (2)
    {
      v30 = *v10;
      if (v30 > 63)
      {
        if (v30 != 95)
        {
          if (v30 == 64)
            goto LABEL_71;
          goto LABEL_60;
        }
        goto LABEL_69;
      }
      if (v30 != 32)
      {
        if (v30 == 60)
          goto LABEL_115;
        if (v30 == 62)
        {
          v8 = v10;
          goto LABEL_117;
        }
LABEL_60:
        v31 = *v10;
        if ((char)v31 > 47)
        {
          if (v31 >= 0x3A)
          {
            if (v31 < 0x5B)
            {
              if (v31 <= 0x40)
                goto LABEL_76;
            }
            else if (v31 - 97 >= 0x1A)
            {
              goto LABEL_76;
            }
          }
        }
        else if ((char)v31 < 45 || v31 == 47)
        {
          goto LABEL_76;
        }
LABEL_69:
        if (++v10 == v7)
        {
          v13 = 29;
          v9 = (unint64_t)v23;
          goto LABEL_317;
        }
        continue;
      }
      break;
    }
    v34 = v10 + 1;
    do
    {
      if (v34 == v7)
      {
        v13 = 30;
        v9 = (unint64_t)v23;
        goto LABEL_588;
      }
      v36 = *v34++;
      v35 = v36;
    }
    while (v36 == 32);
    if (v35 == 62)
    {
      v8 = v34 - 1;
LABEL_117:
      v19 = v8 + 1;
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v23, v10 - v23, 4);
      v120[2](v120, 0, v37);

      v9 = (unint64_t)v23;
      goto LABEL_394;
    }
LABEL_115:
    v9 = (unint64_t)v23;
LABEL_592:
    v8 = v6 - 1;
    v19 = v6;
LABEL_435:
    ++v8;
    v13 = 32;
    if (v8 != v7)
      continue;
    break;
  }
  v14 = v7;
LABEL_437:
  v6 = v19;
LABEL_588:
  if (v14 != v7)
    goto LABEL_594;
  if (v13 < 0x1B)
  {
    v19 = v6;
LABEL_395:
    if (v5 != 3)
    {
      if (v5 == 1)
      {
        if ((unint64_t)v12 <= v9)
          v77 = v12;
        else
          v77 = (char *)v9;
        if (v77 > v11)
        {
          v12 = v77;
          while (1)
          {
            v79 = *--v12;
            v78 = v79;
            if (v79 != 60 && v78 != 32)
              break;
            v77 = v12;
            if (v12 <= v11)
              goto LABEL_408;
          }
        }
        v12 = v77;
LABEL_408:
        v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v11, v12 - v11, 4);
        v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, &v10[-v9], 4);
        ((void (**)(id, void *, void *))v120)[2](v120, v80, v81);

LABEL_409:
        v4 = v119;
      }
      v8 = v19 - 1;
      goto LABEL_435;
    }
    v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, &v10[-v9], 4);
    v120[2](v120, 0, v80);
    goto LABEL_409;
  }
  v20 = (char *)v7;
  v19 = v7;
  switch(v13)
  {
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
      goto LABEL_592;
    case 0x21u:
    case 0x25u:
    case 0x26u:
    case 0x28u:
      goto LABEL_593;
    case 0x22u:
      goto LABEL_424;
    case 0x23u:
    case 0x24u:
    case 0x27u:
      goto LABEL_433;
    default:
      break;
  }
LABEL_594:

}

const __CFString *SGEntityTypeDescription(unint64_t a1)
{
  if (a1 > 0x1B)
    return CFSTR("SGEntityTypePseudoEvent");
  else
    return off_1E4761C30[a1];
}

BOOL SGEntityTypeIsEvent(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL SGEntityTypeIsContact(uint64_t a1)
{
  return a1 == 4;
}

uint64_t SGEntityTypeIsContactDetail(unint64_t a1)
{
  return (a1 < 0x18) & (0xB88FC0u >> a1);
}

uint64_t SGEntityTypeIsCurated(unint64_t a1)
{
  return (a1 < 0x13) & (0x72E2Au >> a1);
}

uint64_t SGEntityTypeIsMessage(unint64_t a1)
{
  return (a1 < 0x13) & (0x52020u >> a1);
}

BOOL SGEntityTypeIsDelivery(uint64_t a1)
{
  return a1 == 24;
}

BOOL SGEntityTypeIsWalletOrder(uint64_t a1)
{
  return a1 == 25;
}

BOOL SGEntityTypeHasSnippetData(uint64_t a1)
{
  return ((a1 - 5) & 0xFFFFFFFFFFFFFFF7) == 0;
}

uint64_t __Block_byref_object_copy__4766(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4767(uint64_t a1)
{

}

void sub_1A22C2A8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A22C2CF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id trimAfterDelimiter(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = objc_msgSend(v3, "rangeOfString:", a2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  return v3;
}

void sub_1A22C3418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5235(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5236(uint64_t a1)
{

}

void sub_1A22C5C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5633(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5634(uint64_t a1)
{

}

id sgFilter(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  mutableArrayLike(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A8583A40](v7);
        v13 = v4[2](v4, v11);
        objc_autoreleasePoolPop(v12);
        if (v13)
          v7 = objc_msgSend(v5, "addObject:", v11, (_QWORD)v15);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

id sgShuffledArrayFrom(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint32_t v4;
  uint64_t v5;
  void *v7;
  void *v8;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "count") > 1)
  {
    v3 = (void *)objc_msgSend(v1, "mutableCopy");
    if ((unint64_t)objc_msgSend(v1, "count") >> 32)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray *sgShuffledArrayFrom(NSArray *__strong)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SGArrays.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("a.count <= UINT32_MAX"));

    }
    v4 = objc_msgSend(v1, "count");
    v5 = v4 - 1;
    if (v4 != 1)
    {
      do
        objc_msgSend(v3, "exchangeObjectAtIndex:withObjectAtIndex:", v5--, arc4random_uniform(v4--));
      while ((_DWORD)v5);
    }
    v2 = (id)objc_msgSend(v3, "copy");

  }
  else
  {
    v2 = v1;
  }

  return v2;
}

id sgMapSelector(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  mutableArrayLike(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A8583A40](v6);
        ((void (*)(void *, uint64_t))objc_msgSend(v10, "methodForSelector:", a2, (_QWORD)v14))(v10, a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

id bomData()
{
  if (bomData__pasOnceToken2 != -1)
    dispatch_once(&bomData__pasOnceToken2, &__block_literal_global_45);
  return (id)bomData__pasExprOnceResult;
}

void __bomData_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __int16 v3;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v3 = -257;
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v3, 2);
  v2 = (void *)bomData__pasExprOnceResult;
  bomData__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id nullByteData()
{
  if (nullByteData__pasOnceToken3 != -1)
    dispatch_once(&nullByteData__pasOnceToken3, &__block_literal_global_5968);
  return (id)nullByteData__pasExprOnceResult;
}

void __nullByteData_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "", 1);
  v2 = (void *)nullByteData__pasExprOnceResult;
  nullByteData__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t nullTerminationSupportedForEncoding(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = 0;
  if (a1 > 2483028223)
  {
    if (a1 != 2483028224 && a1 != 2550137088)
    {
      v3 = 2617245952;
LABEL_8:
      if (a1 != v3)
        return 1;
    }
  }
  else if (a1 != 10 && a1 != 2348810496)
  {
    v3 = 2415919360;
    goto LABEL_8;
  }
  return result;
}

uint64_t SGM2FoundInAppsICSReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

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
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_41:
        v32 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_45:
        v32 = 24;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *mapCalendarUsageLevel(double a1)
{
  __CFString *v1;
  double v2;
  double v3;
  void *v4;

  if (a1 == -1.0)
  {
    v1 = CFSTR("NA");
  }
  else
  {
    if (a1 >= 1.0)
    {
      v3 = 50.0;
      if (a1 < 50.0)
        v3 = round(a1 + a1) * 0.5;
    }
    else
    {
      +[SGNLEventSuggestionsMetrics round:toSignificantFigures:](SGNLEventSuggestionsMetrics, "round:toSignificantFigures:", 1);
      v3 = v2;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t contactDetailUsedAppFromBundle(void *a1)
{
  id v1;
  uint64_t *v2;
  int v3;
  uint64_t v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v2 = &SGMContactDetailUsedAppMessages;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) != 0)
  {
    v2 = &SGMContactDetailUsedAppPhone;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0)
  {
    v2 = &SGMContactDetailUsedAppCalendar;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v2 = &SGMContactDetailUsedAppMail;
  }
  else
  {
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.facetime"));
    v2 = (uint64_t *)&SGMContactDetailUsedAppOther;
    if (v3)
      v2 = (uint64_t *)&SGMContactDetailUsedAppFaceTime;
  }
  v4 = *v2;

  return v4;
}

uint64_t mapDetailExtractionType(uint64_t a1)
{
  uint64_t *v1;

  v1 = &SGMDetailExtractionTypeSig;
  switch(a1)
  {
    case 0:
      v1 = &SGMDetailExtractionTypeUnknown;
      break;
    case 1:
      return *v1;
    case 2:
      v1 = &SGMDetailExtractionTypePhrase;
      break;
    case 3:
      v1 = &SGMDetailExtractionTypeSigPhrase;
      break;
    case 4:
      v1 = &SGMDetailExtractionTypeAddressBook;
      break;
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      goto LABEL_6;
    case 8:
      v1 = &SGMDetailExtractionTypeUnkLookup;
      break;
    case 16:
      v1 = &SGMDetailExtractionTypeInteraction;
      break;
    default:
      if (a1 == 32)
      {
        v1 = &SGMDetailExtractionTypeCalendar;
      }
      else if (a1 == 64)
      {
        v1 = &SGMDetailExtractionTypeMessagesMeCard;
      }
      else
      {
LABEL_6:
        v1 = &SGMDetailExtractionTypeOther;
      }
      break;
  }
  return *v1;
}

unint64_t realTimeContactHasSelfIdPhrase(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "contact");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extractionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "extractionType") >> 1) & 1;

  return v4;
}

uint64_t contactDetailTypeFromDetailName(void *a1)
{
  id v1;
  uint64_t *v2;
  int v3;
  uint64_t v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("emailAddresses")) & 1) != 0)
  {
    v2 = &SGMContactDetailTypeEmail;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("phoneNumbers")) & 1) != 0)
  {
    v2 = &SGMContactDetailTypePhone;
  }
  else
  {
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("postalAddresses"));
    v2 = (uint64_t *)&SGMContactDetailTypeOther;
    if (v3)
      v2 = (uint64_t *)&SGMContactDetailTypeAddress;
  }
  v4 = *v2;

  return v4;
}

uint64_t tagsToEventCategory(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (tagsToEventCategory__pasOnceToken9 != -1)
    dispatch_once(&tagsToEventCategory__pasOnceToken9, &__block_literal_global_252);
  v2 = (id)tagsToEventCategory__pasExprOnceResult;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 9;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = v9;
          v7 = *(_QWORD *)objc_msgSend(v9, "pointerValue");

          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = 9;
  }
LABEL_14:

  return v7;
}

uint64_t tagsToEventExtraction(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;

  v1 = a1;
  +[SGEntityTag fromCalendarAttachment](SGEntityTag, "fromCalendarAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "containsObject:", v3);

  return v4 ^ 1u;
}

void __tagsToEventCategory_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *context;
  _QWORD v33[10];
  _QWORD v34[12];

  v34[10] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A8583A40]();
  +[SGEntityTag extractedFlight](SGEntityTag, "extractedFlight");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryFlight);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v29;
  +[SGEntityTag extractedBus](SGEntityTag, "extractedBus");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v27;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryBus);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v26;
  +[SGEntityTag extractedTrain](SGEntityTag, "extractedTrain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v24;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryTrain);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v23;
  +[SGEntityTag extractedBoat](SGEntityTag, "extractedBoat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v21;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryBoat);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v20;
  +[SGEntityTag extractedHotel](SGEntityTag, "extractedHotel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v18;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryHotel);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v17;
  +[SGEntityTag extractedCarRental](SGEntityTag, "extractedCarRental");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v15;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryCar);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v14;
  +[SGEntityTag extractedTicket](SGEntityTag, "extractedTicket");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v12;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryTicket);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v11;
  +[SGEntityTag extractedMovie](SGEntityTag, "extractedMovie");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryMovie);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v2;
  +[SGEntityTag extractedFood](SGEntityTag, "extractedFood");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategoryFood);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v5;
  +[SGEntityTag extractedSocial](SGEntityTag, "extractedSocial");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", &SGMEventCategorySocial);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 10);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)tagsToEventCategory__pasExprOnceResult;
  tagsToEventCategory__pasExprOnceResult = v9;

  objc_autoreleasePoolPop(context);
}

uint64_t detailTypeFromSGContact(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v1 = a1;
  objc_msgSend(v1, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(v1, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 && v4)
    goto LABEL_16;
  v8 = 3;
  if (v4)
    v8 = 0;
  if (v7)
    v9 = 1;
  else
    v9 = v8;
  objc_msgSend(v1, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postalAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    goto LABEL_11;
  if (v7 | v4)
  {
LABEL_16:
    v16 = 3;
    goto LABEL_17;
  }
  v9 = 2;
LABEL_11:
  objc_msgSend(v1, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "birthday");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 3;
  if (v9 == 3)
    v15 = 4;
  if (v14)
    v16 = v15;
  else
    v16 = v9;
LABEL_17:

  return v16;
}

uint64_t SGM2ContactDetailRejectedReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_53:
          v41 = 24;
          goto LABEL_66;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_57:
          v41 = 8;
          goto LABEL_66;
        case 4u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_61:
          v41 = 12;
          goto LABEL_66;
        case 5u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 32) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          break;
        v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
        *(_QWORD *)(a2 + v38) = v39 + 1;
        v22 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0)
          goto LABEL_63;
        v36 += 7;
        v14 = v37++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_65;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_65:
      v41 = 28;
LABEL_66:
      *(_DWORD *)(a1 + v41) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A22D428C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void _blockingNotifySettingsChanged()
{
  uint64_t v0;
  const char *v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  int v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v0 = objc_msgSend(CFSTR("com.apple.suggestions.settingsChanged"), "UTF8String");
  if ((notificationQueueSuspended & 1) == 0)
  {
    v1 = (const char *)v0;
    v2 = dispatch_semaphore_create(0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___blocking_notify_post_block_invoke;
    v5[3] = &unk_1E47627A0;
    v6 = v2;
    v3 = v2;
    v4 = +[SGPreferenceStorage registerBlockOnSuggestionsSettingsChange:](SGPreferenceStorage, "registerBlockOnSuggestionsSettingsChange:", v5);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    notify_post(v1);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    notify_cancel(v4);

  }
}

intptr_t ___blocking_notify_post_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t SGM2ContactRejectedReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;

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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_67:
          v52 = 8;
          goto LABEL_88;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_71:
          v52 = 12;
          goto LABEL_88;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 44) |= 0x20u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v33 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_75:
          *(_BYTE *)(a1 + 40) = v33 != 0;
          continue;
        case 5u:
          v37 = 0;
          v38 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          while (2)
          {
            v39 = *v3;
            v40 = *(_QWORD *)(a2 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
              *(_QWORD *)(a2 + v39) = v40 + 1;
              v22 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v14 = v38++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_79:
          v52 = 16;
          goto LABEL_88;
        case 6u:
          v42 = 0;
          v43 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
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
              v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
              *(_QWORD *)(a2 + v44) = v45 + 1;
              v22 |= (unint64_t)(v46 & 0x7F) << v42;
              if (v46 < 0)
              {
                v42 += 7;
                v14 = v43++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_83:
          v52 = 32;
          goto LABEL_88;
        case 7u:
          v47 = 0;
          v48 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 0x10u;
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
        if (v50 == -1 || v50 >= *(_QWORD *)(a2 + *v4))
          break;
        v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
        *(_QWORD *)(a2 + v49) = v50 + 1;
        v22 |= (unint64_t)(v51 & 0x7F) << v47;
        if ((v51 & 0x80) == 0)
          goto LABEL_85;
        v47 += 7;
        v14 = v48++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_87;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_85:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_87:
      v52 = 36;
LABEL_88:
      *(_DWORD *)(a1 + v52) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void SGThrottle(uint64_t a1, void *a2, void *a3, double a4)
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v7 = a2;
  v8 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __SGThrottle_block_invoke;
  v19[3] = &unk_1E4762568;
  v21 = a1;
  v10 = v8;
  v20 = v10;
  v11 = (void *)MEMORY[0x1A8583BFC](v19);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(_BYTE *)(a1 + 12))
  {
    ++*(_DWORD *)(a1 + 8);
  }
  else
  {
    v15 = v14 - *(double *)a1;
    if (*(double *)a1 == 0.0 || v15 > a4)
    {
      *(double *)a1 = v14;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __SGThrottle_block_invoke_2;
      block[3] = &unk_1E4762590;
      v18 = v10;
      dispatch_async(v7, block);

      goto LABEL_9;
    }
    *(_BYTE *)(a1 + 12) = 1;
    objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", v7, v11, a4 - v15);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
LABEL_9:

}

void __sgPrivateLogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "Private-Data");
  v2 = (void *)sgPrivateLogHandle__pasExprOnceResult;
  sgPrivateLogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id sgRemindersLogHandle()
{
  if (sgRemindersLogHandle__pasOnceToken4 != -1)
    dispatch_once(&sgRemindersLogHandle__pasOnceToken4, &__block_literal_global_6);
  return (id)sgRemindersLogHandle__pasExprOnceResult;
}

void __sgRemindersLogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "reminders");
  v2 = (void *)sgRemindersLogHandle__pasExprOnceResult;
  sgRemindersLogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id sgSignpostHandle()
{
  if (sgSignpostHandle__pasOnceToken5 != -1)
    dispatch_once(&sgSignpostHandle__pasOnceToken5, &__block_literal_global_8);
  return (id)sgSignpostHandle__pasExprOnceResult;
}

void __sgSignpostHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "Signposts");
  v2 = (void *)sgSignpostHandle__pasExprOnceResult;
  sgSignpostHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id sgEventsLogHandle()
{
  if (sgEventsLogHandle__pasOnceToken6 != -1)
    dispatch_once(&sgEventsLogHandle__pasOnceToken6, &__block_literal_global_10_7848);
  return (id)sgEventsLogHandle__pasExprOnceResult;
}

void __sgEventsLogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "events");
  v2 = (void *)sgEventsLogHandle__pasExprOnceResult;
  sgEventsLogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id sgDeveloperLogHandle()
{
  if (sgDeveloperLogHandle__pasOnceToken7 != -1)
    dispatch_once(&sgDeveloperLogHandle__pasOnceToken7, &__block_literal_global_12_7850);
  return (id)sgDeveloperLogHandle__pasExprOnceResult;
}

void __sgDeveloperLogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "siri-event-suggestions");
  v2 = (void *)sgDeveloperLogHandle__pasExprOnceResult;
  sgDeveloperLogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id sgQuicktypeLogHandle()
{
  if (sgQuicktypeLogHandle__pasOnceToken8 != -1)
    dispatch_once(&sgQuicktypeLogHandle__pasOnceToken8, &__block_literal_global_14);
  return (id)sgQuicktypeLogHandle__pasExprOnceResult;
}

void __sgQuicktypeLogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "quicktype");
  v2 = (void *)sgQuicktypeLogHandle__pasExprOnceResult;
  sgQuicktypeLogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id sgMailIntelligenceLogHandle()
{
  if (sgMailIntelligenceLogHandle__pasOnceToken9 != -1)
    dispatch_once(&sgMailIntelligenceLogHandle__pasOnceToken9, &__block_literal_global_16_7855);
  return (id)sgMailIntelligenceLogHandle__pasExprOnceResult;
}

void __sgMailIntelligenceLogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = os_log_create("com.apple.suggestions", "mail-intelligence");
  v2 = (void *)sgMailIntelligenceLogHandle__pasExprOnceResult;
  sgMailIntelligenceLogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

const __CFString *SGExtractionTypeDescription(uint64_t a1)
{
  const __CFString *result;

  if (a1 > 31)
  {
    switch(a1)
    {
      case 32:
        return CFSTR("attachment");
      case 64:
        return CFSTR("mecard");
      case 128:
        return CFSTR("donatedid");
      default:
        return CFSTR("corrupt");
    }
  }
  else
  {
    result = CFSTR("sig");
    switch(a1)
    {
      case 0:
        result = CFSTR("unknown");
        break;
      case 1:
        return result;
      case 2:
        result = CFSTR("phrase");
        break;
      case 3:
        result = CFSTR("sigphrase");
        break;
      case 4:
        result = CFSTR("ab");
        break;
      case 5:
        result = CFSTR("sigab");
        break;
      case 6:
        result = CFSTR("phraseab");
        break;
      case 7:
        result = CFSTR("sigphraseab");
        break;
      case 8:
        result = CFSTR("lookup");
        break;
      case 16:
        result = CFSTR("interaction");
        break;
      default:
        return CFSTR("corrupt");
    }
  }
  return result;
}

uint64_t SGCombineExtractionTypes(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t __Block_byref_object_copy__8513(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8514(uint64_t a1)
{

}

void sub_1A22DDA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8606(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8607(uint64_t a1)
{

}

uint64_t __sortLocations_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D71058]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D71068]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

uint64_t GEOCoordinateRegionMakeWithDistance()
{
  return MEMORY[0x1E0D26548]();
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x1E0D26670]();
}

uint64_t GEOMetersBetweenMapPoints()
{
  return MEMORY[0x1E0D26700]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1E0CB3118](namestr);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
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

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1E0DB0FB0]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1E0DB1070]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _PASEvaluateLogFaultAndProbCrashCriteria()
{
  return MEMORY[0x1E0D816A0]();
}

uint64_t _PASFullwidthLatinToHalfwidth()
{
  return MEMORY[0x1E0D816A8]();
}

uint64_t _PASKeepOnlyCharacterSet()
{
  return MEMORY[0x1E0D81700]();
}

uint64_t _PASRemoveCharacterSet()
{
  return MEMORY[0x1E0D81748]();
}

uint64_t _PASTryToConvertPhoneNumberToASCII()
{
  return MEMORY[0x1E0D817A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x1E0DE7A40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

