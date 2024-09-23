void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id unexpectedDisambiguationTypeException(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received an unexpected disambiguation type %zu"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("_LTUnexpectedDisambiguationTypeException"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id unexpectedGenderInputException(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received an unexpected gender input %zu"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("_LTUnexpectedGenderInputException"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

const __CFString *_LTDisambiguationTypeDescription(uint64_t a1)
{
  id v2;

  if (!a1)
    return CFSTR("meaning");
  if (a1 != 1)
  {
    unexpectedDisambiguationTypeException(a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  return CFSTR("gender");
}

id menuDescriptionForGender(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  id v6;

  if (a1 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("FEMININE_GENDER_DESCRIPTION");
  }
  else
  {
    if (a1)
    {
      unexpectedGenderInputException(a1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    v3 = CFSTR("MASCULINE_GENDER_DESCRIPTION");
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_250695360, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

unint64_t sortOrderForType(unint64_t result)
{
  id v1;

  if (result >= 2)
  {
    unexpectedDisambiguationTypeException(result);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v1);
  }
  return result;
}

unint64_t sortOrderForGender(unint64_t result)
{
  id v1;

  if (result >= 2)
  {
    unexpectedGenderInputException(result);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v1);
  }
  return result;
}

uint64_t rangeFromDictionary(void *a1, _BYTE *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a1;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", CFSTR("start"))
      && (objc_msgSend(v4, "containsObject:", CFSTR("length")) & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("start"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = v5;
        else
          v6 = 0;
      }
      else
      {
        v6 = 0;
      }
      v8 = v6;

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v11 = v10;

      if (v8 && v11)
      {
        v7 = objc_msgSend(v8, "unsignedIntegerValue");
        objc_msgSend(v11, "unsignedIntegerValue");
      }
      else
      {
        v7 = 0;
        *a2 = 1;
      }

    }
    else
    {
      v7 = 0;
      *a2 = 1;
    }

  }
  else
  {

    v7 = 0;
    *a2 = 1;
  }

  return v7;
}

id genderPayloadValueForDescription(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  v8 = 0;
  if (v4 && v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("meaning")) & 1) != 0)
        {
          v8 = 0;
LABEL_21:

          goto LABEL_22;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("payload"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(&unk_2506A41F8, "objectForKeyedSubscript:", v11);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v8 = 0;
          }

        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = 0;
        v10 = v9;
        v9 = 0;
      }
    }
    else
    {
      v8 = 0;
      v10 = 0;
    }

    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

void sub_23543F7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2354402DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_235440600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2354408F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_235441494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,char a26)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_2354418F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

void sub_235445AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235445C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_235445D84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2354460C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23544628C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544681C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_235446E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;
  uint64_t v18;
  id *v19;

  v19 = v17;
  objc_destroyWeak(v19);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Block_object_dispose((const void *)(v18 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_235446FF4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2354471D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_23544753C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_235447850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_235447B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Block_object_dispose((const void *)(v20 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_235447D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_235447F04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id _LTLanguageCodeToSupportedLocale(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];
  _QWORD v27[5];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v26[0] = CFSTR("zh-Hant");
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("zh_TW"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v26[1] = CFSTR("zh-Hans");
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("zh_CN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v6;
  v26[2] = CFSTR("en");
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v4, "containsObject:", v9))
  {
    v10 = v9;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v4;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "languageCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v3);

          if ((v18 & 1) != 0)
          {
            v10 = v16;

            goto LABEL_14;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }

    v10 = 0;
LABEL_14:
    v4 = v20;
  }

  return v10;
}

const __CFString *_LTOfflineStateString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_250693A48[a1];
}

void sub_2354491BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_23544A210(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_23544A490(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544A614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _LTOSLogAssets()
{
  if (_LTOSLogAssets_onceToken != -1)
    dispatch_once(&_LTOSLogAssets_onceToken, &__block_literal_global_5);
  return _LTOSLogAssets_log;
}

uint64_t _LTOSLogDisambiguation()
{
  if (_LTOSLogDisambiguation_onceToken != -1)
    dispatch_once(&_LTOSLogDisambiguation_onceToken, &__block_literal_global_3);
  return _LTOSLogDisambiguation_log;
}

uint64_t _LTOSLogOnboarding()
{
  if (_LTOSLogOnboarding_onceToken != -1)
    dispatch_once(&_LTOSLogOnboarding_onceToken, &__block_literal_global_5_0);
  return _LTOSLogOnboarding_log;
}

uint64_t _LTOSLogRomanization()
{
  if (_LTOSLogRomanization_onceToken != -1)
    dispatch_once(&_LTOSLogRomanization_onceToken, &__block_literal_global_7);
  return _LTOSLogRomanization_log;
}

uint64_t _LTOSLogSELFLogging()
{
  if (_LTOSLogSELFLogging_onceToken != -1)
    dispatch_once(&_LTOSLogSELFLogging_onceToken, &__block_literal_global_9);
  return _LTOSLogSELFLogging_log;
}

uint64_t _LTOSLogSpeech()
{
  if (_LTOSLogSpeech_onceToken != -1)
    dispatch_once(&_LTOSLogSpeech_onceToken, &__block_literal_global_11_0);
  return _LTOSLogSpeech_log;
}

uint64_t _LTOSLogTextAPI()
{
  if (_LTOSLogTextAPI_onceToken != -1)
    dispatch_once(&_LTOSLogTextAPI_onceToken, &__block_literal_global_13);
  return _LTOSLogTextAPI_log;
}

uint64_t _LTOSLogTranslationEngine()
{
  if (_LTOSLogTranslationEngine_onceToken != -1)
    dispatch_once(&_LTOSLogTranslationEngine_onceToken, &__block_literal_global_15);
  return _LTOSLogTranslationEngine_log;
}

uint64_t _LTOSLogTTS()
{
  if (_LTOSLogTTS_onceToken != -1)
    dispatch_once(&_LTOSLogTTS_onceToken, &__block_literal_global_17);
  return _LTOSLogTTS_log;
}

uint64_t _LTOSLogUserFeedback()
{
  if (_LTOSLogUserFeedback_onceToken != -1)
    dispatch_once(&_LTOSLogUserFeedback_onceToken, &__block_literal_global_19);
  return _LTOSLogUserFeedback_log;
}

uint64_t _LTOSLogXPC()
{
  if (_LTOSLogXPC_onceToken != -1)
    dispatch_once(&_LTOSLogXPC_onceToken, &__block_literal_global_21);
  return _LTOSLogXPC_log;
}

id _LTLoggingRequestClasses()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)_LTLoggingRequestClasses_classSet;
  if (!_LTLoggingRequestClasses_classSet)
  {
    v1 = (void *)MEMORY[0x24BDBCF20];
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    v6[2] = objc_opt_class();
    v6[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setWithArray:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_LTLoggingRequestClasses_classSet;
    _LTLoggingRequestClasses_classSet = v3;

    v0 = (void *)_LTLoggingRequestClasses_classSet;
  }
  return v0;
}

void sub_23544D47C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23544D5D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544DBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23544DE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23544E3A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544E538(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544E7AC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544E934(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544EAB8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544EF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23544F7EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23544F974(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_235452EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235453000(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_235453144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235455174(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_2354554E8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2354556C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_235455A70(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_235456050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_2354562E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_235456660(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_235456AD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_235456C04(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_235457168(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

const __CFString *_LTFeedbackCategoryString(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("undefined");
  else
    return off_2506942D8[a1];
}

void sub_23545B57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23545C060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23545C30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23545E304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id _LTTranslationServiceDelegateXPCInterface()
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256237020);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_languageInstallProgressed_error_, 0, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_ttsAudioStarted_duration_, 0, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_assetResponseWithProgress_finished_error_, 0, 0);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_languageStatusChangedForType_progress_observations_, 2, 0);

  return v0;
}

id _LTTranslationServiceXPCInterface()
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
  void *v9;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[7];
  _QWORD v59[2];
  _QWORD v60[4];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[3];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256240D28);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v65[0] = objc_opt_class();
  v65[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_translateParagraphs_withContext_completion_, 0, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  v64[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__offlineLanguageStatus_, 0, 1);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v63[0] = objc_opt_class();
  v63[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_availableLocalePairsForTask_completion_, 0, 1);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_textStreamingConfigurationWithCompletion_, 0, 1);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_autoDetectSpeechUnsupportedPairsWithCompletion_, 0, 1);

  v16 = (void *)MEMORY[0x24BDBCF20];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  v60[2] = objc_opt_class();
  v60[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_modalitiesPerLocaleWithCompletion_, 0, 1);

  v19 = (void *)MEMORY[0x24BDBCF20];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_additionalLikelyPreferredLocalesForLocale_completion_, 0, 1);

  v22 = (void *)MEMORY[0x24BDBCF20];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  v58[2] = objc_opt_class();
  v58[3] = objc_opt_class();
  v58[4] = objc_opt_class();
  v58[5] = objc_opt_class();
  v58[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_configInfoForLocale_otherLocale_completion_, 0, 1);

  v25 = (void *)MEMORY[0x24BDBCF20];
  v57 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_onDeviceModeSupported_, 0, 1);

  v28 = (void *)MEMORY[0x24BDBCF20];
  v56 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_task_isSupportedInCountry_completion_, 0, 0);

  v31 = (void *)MEMORY[0x24BDBCF20];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_installedLocales_, 0, 1);

  v34 = (void *)MEMORY[0x24BDBCF20];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_installedLocalesForTask_completion_, 0, 1);

  v37 = (void *)MEMORY[0x24BDBCF20];
  v53 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_onDeviceModeEnabled_, 0, 1);

  v40 = (void *)MEMORY[0x24BDBCF20];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_languageAssetsWithOptions_completion_, 0, 1);

  v43 = (void *)MEMORY[0x24BDBCF20];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_addLanguages_useCellular_, 0, 0);

  v46 = (void *)MEMORY[0x24BDBCF20];
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setWithArray:", v47, v50[0]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_removeLanguages_, 0, 0);

  return v0;
}

id _LTTextTranslationServiceXPCInterface()
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[7];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25623FA80);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_availableLocalePairsForTask_completion_, 0, 1);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_translateParagraphs_withContext_completion_, 0, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  v15[5] = objc_opt_class();
  v15[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_configInfoForLocale_otherLocale_completion_, 0, 1);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11, v14[0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_installedLocalesForTask_completion_, 0, 1);

  return v0;
}

void sub_235460E14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_235460F98(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2354611B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_235461700(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_235461A60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_235461C38(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

const __CFString *_LTTranslationModelTaskString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("undefined");
  else
    return off_250694678[a1 - 1];
}

id OUTLINED_FUNCTION_6_1(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t _LTIsInternalInstall()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "BOOLValue");

  return v1;
}

uint64_t _LTIsSeedInstall()
{
  return 0;
}

id _LTObjectMappedForKey(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

id _LTLocaleMappedForTTS(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(a1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LTLocaleIdentifierMappedForTTS(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *_LTLocaleIdentifierMappedForTTS(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("ar_")) & 1) != 0)
  {
    v2 = CFSTR("ar_SA");
  }
  else if ((objc_msgSend(v1, "hasSuffix:", CFSTR("_IN")) & 1) != 0)
  {
    v2 = CFSTR("en_IN");
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("yue_")) & 1) != 0)
  {
    v2 = CFSTR("zh_HK");
  }
  else
  {
    v2 = (__CFString *)v1;
  }

  return v2;
}

uint64_t _LTIsEqual(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqual:", a2);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_235468DC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t static LanguageAvailability.Status.== infix(_:_:)(_BYTE *a1, _BYTE *a2)
{
  int v2;

  v2 = *a2;
  if (*a1)
  {
    if (*a1 == 1)
    {
      if (v2 == 1)
        return 1;
    }
    else if (v2 == 2)
    {
      return 1;
    }
  }
  else if (!*a2)
  {
    return 1;
  }
  return 0;
}

uint64_t LanguageAvailability.Status.hash(into:)()
{
  return sub_235476D48();
}

uint64_t LanguageAvailability.Status.hashValue.getter()
{
  sub_235476D3C();
  sub_235476D48();
  return sub_235476D54();
}

uint64_t sub_235469E88()
{
  sub_235476D3C();
  sub_235476D48();
  return sub_235476D54();
}

uint64_t sub_235469ECC()
{
  return sub_235476D48();
}

uint64_t sub_235469EF4()
{
  sub_235476D3C();
  sub_235476D48();
  return sub_235476D54();
}

BOOL sub_235469F34(_BYTE *a1, _BYTE *a2)
{
  int v2;

  v2 = *a2;
  if (*a1)
  {
    if (*a1 == 1)
      return v2 == 1;
    if (v2 != 2)
      return 0;
  }
  else if (*a2)
  {
    return 0;
  }
  return 1;
}

uint64_t sub_235469F70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_235469F88()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 32) = swift_allocObject();
  swift_weakInit();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_256234BC0);
  *v1 = v0;
  v1[1] = sub_23546A04C;
  return sub_235476CE8();
}

uint64_t sub_23546A04C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23546A0A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23546A0B0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_23546A0D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD aBlock[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CE8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8]();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v6 = *(void **)(Strong + 16);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v8 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    aBlock[4] = sub_23546B6D4;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23546A48C;
    aBlock[3] = &block_descriptor_24;
    v9 = _Block_copy(aBlock);
    v10 = v6;
    swift_release();
    objc_msgSend(v10, sel_supportedLanguagesWithCompletion_, v9);
    _Block_release(v9);
    swift_release();

  }
}

void sub_23546A248(uint64_t a1)
{
  sub_23546A0D4(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CC910]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23546A290(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v19[2];
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_235476B5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_235476B44();
  v8 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  if (v11)
  {
    v19[1] = a2;
    v23 = MEMORY[0x24BEE4AF8];
    sub_2354712AC(0, v11, 0);
    v13 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v14 = *(_QWORD *)(v5 + 72);
    v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v21 = v14;
    v15 = v5;
    do
    {
      v20(v7, v13, v4);
      sub_235476B50();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v12 = v23;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2354712AC(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v23;
      }
      v17 = *(_QWORD *)(v12 + 16);
      v16 = *(_QWORD *)(v12 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_2354712AC(v16 > 1, v17 + 1, 1);
        v12 = v23;
      }
      *(_QWORD *)(v12 + 16) = v17 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v17, v10, v22);
      v23 = v12;
      v13 += v21;
      --v11;
      v5 = v15;
    }
    while (v11);
  }
  v23 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234CE8);
  return sub_235476C04();
}

uint64_t sub_23546A48C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_235476B5C();
  v2 = sub_235476BE0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23546A4E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23546A504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v1 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v1;
  v5 = *(_OWORD *)(v0 + 24);
  swift_weakInit();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v5;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_23546A5E0;
  return sub_235476CE8();
}

uint64_t sub_23546A5E0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23546A63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t result;
  void *v26;
  void (*v27)(char *, uint64_t, uint64_t);
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  _QWORD aBlock[6];

  v51 = a4;
  v48 = a3;
  v53 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CE0);
  v55 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v52 = v5;
  v54 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  MEMORY[0x24BDAC7A8](v6);
  v49 = (uint64_t)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD8);
  MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_235476B2C();
  v45 = *(_QWORD *)(v47 - 8);
  v10 = MEMORY[0x24BDAC7A8](v47);
  v12 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v43 - v13;
  v15 = sub_235476B44();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v43 - v20;
  v46 = sub_235476B5C();
  v22 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v24 = (char *)v43 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v44 = v4;
    v43[1] = result;
    v26 = *(void **)(result + 16);
    v27 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    v27(v21, v48, v15);
    v27(v19, (uint64_t)v21, v15);
    v28 = v26;
    sub_235476B20();
    v29 = v45;
    v30 = v47;
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v12, v14, v47);
    sub_235476AF0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v30);
    v31 = (void *)sub_235476AFC();
    v32 = *(void (**)(char *, uint64_t))(v22 + 8);
    v33 = v46;
    v32(v24, v46);
    v34 = v49;
    sub_23546B590(v51, v49);
    v35 = v50;
    sub_23546B744(v34, v50);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v35, 1, v33) == 1)
    {
      v36 = 0;
    }
    else
    {
      v36 = (void *)sub_235476AFC();
      v32((char *)v35, v33);
    }
    v37 = v44;
    v39 = v54;
    v38 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v54, v53, v44);
    v40 = (*(unsigned __int8 *)(v38 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
    v41 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v41 + v40, v39, v37);
    aBlock[4] = sub_23546B658;
    aBlock[5] = v41;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23546AAE8;
    aBlock[3] = &block_descriptor_18;
    v42 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v28, sel_statusFromLanguage_toLanguage_completion_, v31, v36, v42);
    _Block_release(v42);

    return swift_release();
  }
  return result;
}

uint64_t sub_23546AA38(uint64_t a1)
{
  uint64_t *v1;

  return sub_23546A63C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23546AA44(unint64_t a1)
{
  uint64_t result;

  if (a1 >= 4)
  {
    result = sub_235476CB8();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234CE0);
    return sub_235476C04();
  }
  return result;
}

uint64_t sub_23546AAE8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_23546AB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23546AB44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_allocObject();
  *(_QWORD *)(v0 + 56) = v2;
  v6 = *(_OWORD *)(v0 + 32);
  swift_weakInit();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_OWORD *)(v3 + 32) = v6;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_23546AC2C;
  return sub_235476D00();
}

uint64_t sub_23546AC2C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23546ACAC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23546ACE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v26 = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CC8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v25 = *(id *)(result + 16);
    v16 = (void *)sub_235476BA4();
    sub_23546B590(a5, (uint64_t)v11);
    sub_23546B744((uint64_t)v11, (uint64_t)v14);
    v17 = sub_235476B5C();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17) != 1)
    {
      v19 = (void *)sub_235476AFC();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v17);
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v6);
    v20 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v21 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v21 + v20, (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    aBlock[4] = sub_23546B5E4;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23546B07C;
    aBlock[3] = &block_descriptor;
    v22 = _Block_copy(aBlock);
    swift_release();
    v23 = v25;
    objc_msgSend(v25, sel_statusForSourceSample_toLanguage_completion_, v16, v19, v22);
    _Block_release(v22);

    return swift_release();
  }
  return result;
}

uint64_t sub_23546AF64(uint64_t a1)
{
  uint64_t *v1;

  return sub_23546ACE8(a1, v1[2], v1[3], v1[4], v1[5]);
}

void sub_23546AF70(unint64_t a1, id a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (a2)
  {
    v3 = a2;
    v4 = (void *)sub_235476AD8();
    v5 = (void *)sub_23546BE8C(v4);

    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234CC8);
    sub_235476BF8();

  }
  else if (a1 >= 4)
  {
    sub_235476CB8();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234CC8);
    sub_235476C04();
  }
}

void sub_23546B07C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t LanguageAvailability.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)_LTLanguageAvailability), sel_init);
  return v0;
}

uint64_t LanguageAvailability.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)_LTLanguageAvailability), sel_init);
  return v0;
}

uint64_t LanguageAvailability.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LanguageAvailability.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

unint64_t sub_23546B19C()
{
  unint64_t result;

  result = qword_256234BD8;
  if (!qword_256234BD8)
  {
    result = MEMORY[0x23B7CC928](&protocol conformance descriptor for LanguageAvailability.Status, &type metadata for LanguageAvailability.Status);
    atomic_store(result, (unint64_t *)&qword_256234BD8);
  }
  return result;
}

uint64_t type metadata accessor for LanguageAvailability()
{
  return objc_opt_self();
}

uint64_t method lookup function for LanguageAvailability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LanguageAvailability.supportedLanguages.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 88) + *(_QWORD *)(*(_QWORD *)v0 + 88));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23546B264;
  return v4();
}

uint64_t sub_23546B264(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of LanguageAvailability.status(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 96)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 96));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23546B334;
  return v10(a1, a2, a3);
}

uint64_t sub_23546B334()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of LanguageAvailability.status(for:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 104)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 104));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23546B334;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of LanguageAvailability.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LanguageAvailability.Status(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LanguageAvailability.Status(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23546B4FC + 4 * byte_23547BA55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23546B530 + 4 * byte_23547BA50[v4]))();
}

uint64_t sub_23546B530(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23546B538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23546B540);
  return result;
}

uint64_t sub_23546B54C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23546B554);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23546B558(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23546B560(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23546B56C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23546B578(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LanguageAvailability.Status()
{
  return &type metadata for LanguageAvailability.Status;
}

uint64_t sub_23546B590(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23546B5D8()
{
  return objectdestroy_11Tm(&qword_256234CC8);
}

void sub_23546B5E4(unint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234CC8);
  sub_23546AF70(a1, a2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_23546B64C()
{
  return objectdestroy_11Tm(&qword_256234CE0);
}

uint64_t sub_23546B658(uint64_t a1)
{
  return sub_23546B6E8(a1, &qword_256234CE0, (uint64_t (*)(uint64_t, uint64_t))sub_23546AA44);
}

uint64_t sub_23546B66C()
{
  return objectdestroy_11Tm(&qword_256234CE8);
}

uint64_t objectdestroy_11Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_23546B6D4(uint64_t a1)
{
  return sub_23546B6E8(a1, &qword_256234CE8, sub_23546A290);
}

uint64_t sub_23546B6E8(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return a3(a1, v3 + ((v5 + 16) & ~v5));
}

uint64_t sub_23546B744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a2;
  v3 = sub_235476B2C();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v31 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235476B44();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v31 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v31 - v20;
  v22 = a1;
  sub_23546B590(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23546B9A8(a1);
    sub_23546B9A8((uint64_t)v11);
    v23 = sub_235476B5C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v34, 1, 1, v23);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v21, v11, v12);
    v25 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v25(v19, v21, v12);
    v25(v16, v19, v12);
    sub_235476B20();
    v27 = v32;
    v26 = v33;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v6, v8, v33);
    v28 = v34;
    sub_235476AF0();
    v29 = *(void (**)(char *, uint64_t))(v13 + 8);
    v29(v19, v12);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v26);
    sub_23546B9A8(v22);
    v29(v21, v12);
    v30 = sub_235476B5C();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v28, 0, 1, v30);
  }
}

uint64_t sub_23546B9A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23546B9E8()
{
  uint64_t v0;

  v0 = sub_235476B80();
  __swift_allocate_value_buffer(v0, qword_256235510);
  __swift_project_value_buffer(v0, (uint64_t)qword_256235510);
  return sub_235476B74();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23546BAB4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234D10);
  v2 = sub_235476CD0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23546CD34(v6, (uint64_t)&v15, &qword_256234D18);
    v7 = v15;
    v8 = v16;
    result = sub_23546BD40(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23546BBFC);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23546CD78(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23546BBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_235476CF4() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_235476CF4() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_235476CF4() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_23546BD40(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  sub_235476D3C();
  sub_235476BC8();
  v5 = sub_235476D54();
  return a3(a1, a2, v5);
}

unint64_t sub_23546BDAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_235476CF4() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_235476CF4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23546BE8C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  int v41;
  char *v42;
  uint64_t v43;
  unsigned int (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char v68;
  uint64_t v69;
  id v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  _QWORD *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  NSObject *v84;
  _QWORD *v85;
  uint8_t *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint8_t *v102;
  char *v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;

  v2 = sub_235476A90();
  MEMORY[0x24BDAC7A8](v2);
  v97 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235476A9C();
  v98 = *(_QWORD *)(v4 - 8);
  v99 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v96 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v101 = (uint64_t *)((char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x24BDAC7A8](v7);
  v100 = (uint64_t)&v95 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v95 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v104 = (uint64_t)&v95 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v95 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v95 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v95 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v95 - v25;
  v27 = objc_msgSend(a1, sel_domain);
  v28 = sub_235476BB0();
  v30 = v29;

  if (v28 == sub_235476BB0() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_5:
    v102 = (uint8_t *)objc_msgSend(a1, sel_code);
    v33 = objc_msgSend(a1, sel_userInfo);
    v34 = sub_235476B8C();

    v35 = sub_235476BB0();
    v37 = *(_QWORD *)(v34 + 16);
    v103 = v13;
    if (v37
      && (v38 = sub_23546BD40(v35, v36, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23546BDAC), (v39 & 1) != 0))
    {
      sub_23546CCF8(*(_QWORD *)(v34 + 56) + 32 * v38, (uint64_t)&v105);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v106 + 1))
      {
        v40 = sub_235476B5C();
        v41 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v26, v41 ^ 1u, 1, v40);
        goto LABEL_11;
      }
    }
    else
    {
      v105 = 0u;
      v106 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    sub_23546CC34((uint64_t)&v105, &qword_256234D00);
    v40 = sub_235476B5C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v26, 1, 1, v40);
LABEL_11:
    v42 = v26;
    sub_23546CD34((uint64_t)v26, (uint64_t)v24, &qword_256234CD8);
    sub_235476B5C();
    v43 = *(_QWORD *)(v40 - 8);
    v44 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48);
    if (v44(v24, 1, v40) == 1)
    {
      sub_23546CC34((uint64_t)v24, &qword_256234CD8);
      v45 = sub_235476B44();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v104, 1, 1, v45);
    }
    else
    {
      v46 = v104;
      sub_235476B50();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v24, v40);
      v47 = sub_235476B44();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v46, 0, 1, v47);
    }
    v48 = objc_msgSend(a1, sel_userInfo);
    v49 = sub_235476B8C();

    v50 = sub_235476BB0();
    if (*(_QWORD *)(v49 + 16)
      && (v52 = sub_23546BD40(v50, v51, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23546BDAC), (v53 & 1) != 0))
    {
      sub_23546CCF8(*(_QWORD *)(v49 + 56) + 32 * v52, (uint64_t)&v105);
    }
    else
    {
      v105 = 0u;
      v106 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v106 + 1))
    {
      v54 = swift_dynamicCast();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v21, v54 ^ 1u, 1, v40);
    }
    else
    {
      sub_23546CC34((uint64_t)&v105, &qword_256234D00);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56))(v21, 1, 1, v40);
    }
    sub_23546CD34((uint64_t)v21, (uint64_t)v18, &qword_256234CD8);
    if (v44(v18, 1, v40) == 1)
    {
      sub_23546CC34((uint64_t)v18, &qword_256234CD8);
      v55 = sub_235476B44();
      v56 = (uint64_t)v103;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v103, 1, 1, v55);
    }
    else
    {
      v57 = (uint64_t)v103;
      sub_235476B50();
      v58 = *(void (**)(char *, uint64_t))(v43 + 8);
      v56 = v57;
      v58(v18, v40);
      v59 = sub_235476B44();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v57, 0, 1, v59);
    }
    v60 = (uint64_t)v42;
    switch((unint64_t)v102)
    {
      case 2uLL:
      case 0xBuLL:
        v61 = v100;
        sub_23546CCB0(v104, v100);
        v62 = v101;
        sub_23546CCB0(v56, (uint64_t)v101);
        v63 = type metadata accessor for TranslationError();
        sub_23546CC70((unint64_t *)&qword_256234CF0, (uint64_t (*)(uint64_t))type metadata accessor for TranslationError, (uint64_t)&protocol conformance descriptor for TranslationError);
        v65 = swift_allocError();
        v66 = v21;
        v67 = v64;
        v68 = 2;
        goto LABEL_39;
      case 3uLL:
        if (qword_256234BA8 != -1)
          swift_once();
        v89 = type metadata accessor for TranslationError();
        v90 = qword_256234D80;
        goto LABEL_54;
      case 0xDuLL:
        goto LABEL_51;
      case 0x12uLL:
        v61 = v100;
        sub_23546CCB0(v104, v100);
        v62 = v101;
        sub_23546CCB0(v56, (uint64_t)v101);
        v63 = type metadata accessor for TranslationError();
        sub_23546CC70((unint64_t *)&qword_256234CF0, (uint64_t (*)(uint64_t))type metadata accessor for TranslationError, (uint64_t)&protocol conformance descriptor for TranslationError);
        v65 = swift_allocError();
        v66 = v21;
        v67 = v64;
        *v64 = 0;
        goto LABEL_48;
      case 0x13uLL:
        v61 = v100;
        sub_23546CCB0(v104, v100);
        v62 = v101;
        sub_23546CCB0(v56, (uint64_t)v101);
        v63 = type metadata accessor for TranslationError();
        sub_23546CC70((unint64_t *)&qword_256234CF0, (uint64_t (*)(uint64_t))type metadata accessor for TranslationError, (uint64_t)&protocol conformance descriptor for TranslationError);
        v65 = swift_allocError();
        v66 = v21;
        v67 = v64;
        v68 = 1;
LABEL_39:
        *v64 = v68;
LABEL_48:
        sub_23546CCB0(v61, (uint64_t)&v64[*(int *)(v63 + 20)]);
        sub_23546CCB0((uint64_t)v62, (uint64_t)&v67[*(int *)(v63 + 24)]);
        v91 = (uint64_t)v66;
        goto LABEL_56;
      case 0x14uLL:
        sub_235476A84();
        sub_23546BAB4(MEMORY[0x24BEE4AF8]);
        sub_23546CC70(&qword_256234D08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAEE8], MEMORY[0x24BDCAEE0]);
        v87 = v96;
        v88 = v99;
        sub_235476ACC();
        v65 = sub_235476A78();
        (*(void (**)(char *, uint64_t))(v98 + 8))(v87, v88);
        goto LABEL_55;
      case 0x15uLL:
        if (qword_256234BA0 != -1)
          swift_once();
        v89 = type metadata accessor for TranslationError();
        v90 = qword_256234D68;
        goto LABEL_54;
      case 0x16uLL:
        sub_235476CB8();
        __break(1u);
        JUMPOUT(0x23546CB9CLL);
      default:
        if (qword_256234B80 != -1)
          swift_once();
        v79 = sub_235476B80();
        __swift_project_value_buffer(v79, (uint64_t)qword_256235510);
        v80 = a1;
        v81 = sub_235476B68();
        v82 = sub_235476C4C();
        if (os_log_type_enabled(v81, v82))
        {
          v83 = (uint8_t *)swift_slowAlloc();
          v101 = (_QWORD *)swift_slowAlloc();
          v102 = v83;
          *(_DWORD *)v83 = 138412290;
          *(_QWORD *)&v105 = v80;
          v84 = v80;
          sub_235476C64();
          v85 = v101;
          *v101 = v80;

          v86 = v102;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256234CF8);
          swift_arrayDestroy();
          MEMORY[0x23B7CC988](v85, -1, -1);
          MEMORY[0x23B7CC988](v86, -1, -1);
        }
        else
        {

          v81 = v80;
        }

LABEL_51:
        if (qword_256234BB0 != -1)
          swift_once();
        v89 = type metadata accessor for TranslationError();
        v90 = qword_256234D98;
LABEL_54:
        v92 = __swift_project_value_buffer(v89, (uint64_t)v90);
        sub_23546CC70((unint64_t *)&qword_256234CF0, (uint64_t (*)(uint64_t))type metadata accessor for TranslationError, (uint64_t)&protocol conformance descriptor for TranslationError);
        v65 = swift_allocError();
        sub_23546CBF0(v92, v93);
LABEL_55:
        sub_23546CC34(v56, &qword_256234CD0);
        sub_23546CC34(v104, &qword_256234CD0);
        v91 = (uint64_t)v21;
LABEL_56:
        sub_23546CC34(v91, &qword_256234CD8);
        sub_23546CC34(v60, &qword_256234CD8);
        break;
    }
    return v65;
  }
  v32 = sub_235476CF4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_5;
  if (qword_256234B80 != -1)
    swift_once();
  v69 = sub_235476B80();
  __swift_project_value_buffer(v69, (uint64_t)qword_256235510);
  v70 = a1;
  v71 = sub_235476B68();
  v72 = sub_235476C4C();
  if (os_log_type_enabled(v71, v72))
  {
    v73 = (uint8_t *)swift_slowAlloc();
    v74 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v73 = 138412290;
    *(_QWORD *)&v105 = v70;
    v75 = v70;
    sub_235476C64();
    *v74 = v70;

    __swift_instantiateConcreteTypeFromMangledName(&qword_256234CF8);
    swift_arrayDestroy();
    MEMORY[0x23B7CC988](v74, -1, -1);
    MEMORY[0x23B7CC988](v73, -1, -1);

  }
  else
  {

  }
  if (qword_256234BB0 != -1)
    swift_once();
  v76 = type metadata accessor for TranslationError();
  v77 = __swift_project_value_buffer(v76, (uint64_t)qword_256234D98);
  sub_23546CC70((unint64_t *)&qword_256234CF0, (uint64_t (*)(uint64_t))type metadata accessor for TranslationError, (uint64_t)&protocol conformance descriptor for TranslationError);
  v65 = swift_allocError();
  sub_23546CBF0(v77, v78);
  return v65;
}

uint64_t sub_23546CBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TranslationError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23546CC34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23546CC70(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7CC928](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23546CCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23546CCF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23546CD34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_23546CD78(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

BOOL sub_23546CD88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23546CD9C()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  void (*v4)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v0 = type metadata accessor for TranslationError();
  __swift_allocate_value_buffer(v0, qword_256234D20);
  v1 = (_BYTE *)__swift_project_value_buffer(v0, (uint64_t)qword_256234D20);
  v2 = &v1[*(int *)(v0 + 20)];
  v3 = sub_235476B44();
  v4 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  result = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v4)(&v1[*(int *)(v0 + 24)], 1, 1, v3);
  *v1 = 0;
  return result;
}

uint64_t static TranslationError.unsupportedSourceLanguage.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23546D254(&qword_256234B88, (uint64_t)qword_256234D20, a1);
}

uint64_t type metadata accessor for TranslationError()
{
  uint64_t result;

  result = qword_256234E28;
  if (!qword_256234E28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23546CE94()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  void (*v4)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v0 = type metadata accessor for TranslationError();
  __swift_allocate_value_buffer(v0, qword_256234D38);
  v1 = (_BYTE *)__swift_project_value_buffer(v0, (uint64_t)qword_256234D38);
  v2 = &v1[*(int *)(v0 + 20)];
  v3 = sub_235476B44();
  v4 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  result = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v4)(&v1[*(int *)(v0 + 24)], 1, 1, v3);
  *v1 = 1;
  return result;
}

uint64_t static TranslationError.unsupportedTargetLanguage.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23546D254(&qword_256234B90, (uint64_t)qword_256234D38, a1);
}

uint64_t sub_23546CF54()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  void (*v4)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v0 = type metadata accessor for TranslationError();
  __swift_allocate_value_buffer(v0, qword_256234D50);
  v1 = (_BYTE *)__swift_project_value_buffer(v0, (uint64_t)qword_256234D50);
  v2 = &v1[*(int *)(v0 + 20)];
  v3 = sub_235476B44();
  v4 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  result = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v4)(&v1[*(int *)(v0 + 24)], 1, 1, v3);
  *v1 = 2;
  return result;
}

uint64_t static TranslationError.unsupportedLanguagePairing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23546D254(&qword_256234B98, (uint64_t)qword_256234D50, a1);
}

uint64_t sub_23546D014()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  void (*v4)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v0 = type metadata accessor for TranslationError();
  __swift_allocate_value_buffer(v0, qword_256234D68);
  v1 = (_BYTE *)__swift_project_value_buffer(v0, (uint64_t)qword_256234D68);
  v2 = &v1[*(int *)(v0 + 20)];
  v3 = sub_235476B44();
  v4 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  result = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v4)(&v1[*(int *)(v0 + 24)], 1, 1, v3);
  *v1 = 3;
  return result;
}

uint64_t static TranslationError.unableToIdentifyLanguage.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23546D254(&qword_256234BA0, (uint64_t)qword_256234D68, a1);
}

uint64_t sub_23546D0D4()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  void (*v4)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v0 = type metadata accessor for TranslationError();
  __swift_allocate_value_buffer(v0, qword_256234D80);
  v1 = (_BYTE *)__swift_project_value_buffer(v0, (uint64_t)qword_256234D80);
  v2 = &v1[*(int *)(v0 + 20)];
  v3 = sub_235476B44();
  v4 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  result = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v4)(&v1[*(int *)(v0 + 24)], 1, 1, v3);
  *v1 = 4;
  return result;
}

uint64_t static TranslationError.nothingToTranslate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23546D254(&qword_256234BA8, (uint64_t)qword_256234D80, a1);
}

uint64_t sub_23546D194()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  void (*v4)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v0 = type metadata accessor for TranslationError();
  __swift_allocate_value_buffer(v0, qword_256234D98);
  v1 = (_BYTE *)__swift_project_value_buffer(v0, (uint64_t)qword_256234D98);
  v2 = &v1[*(int *)(v0 + 20)];
  v3 = sub_235476B44();
  v4 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  result = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v4)(&v1[*(int *)(v0 + 24)], 1, 1, v3);
  *v1 = 5;
  return result;
}

uint64_t static TranslationError.internalError.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23546D254(&qword_256234BB0, (uint64_t)qword_256234D98, a1);
}

uint64_t sub_23546D254@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for TranslationError();
  v6 = __swift_project_value_buffer(v5, a2);
  return sub_23546CBF0(v6, a3);
}

BOOL static TranslationError.~= infix(_:_:)(unsigned __int8 *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  id v11;
  int v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  int v14;
  int v15;
  _QWORD v17[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234DB0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TranslationError();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (unsigned __int8 *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = a2;
  v11 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234DB8);
  v12 = swift_dynamicCast();
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v12)
  {
    v13(v6, 0, 1, v7);
    sub_23546D3E4((uint64_t)v6, (uint64_t)v10);
    v14 = *a1;
    v15 = *v10;
    sub_23546D428((uint64_t)v10);
    return v14 == v15;
  }
  else
  {
    v13(v6, 1, 1, v7);
    sub_23546CC34((uint64_t)v6, &qword_256234DB0);
    return 0;
  }
}

uint64_t sub_23546D3E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TranslationError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23546D428(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TranslationError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t TranslationError.errorDescription.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for TranslationSession(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_235476AC0();

  return v2;
}

void TranslationError.failureReason.getter()
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = sub_235476B5C();
  MEMORY[0x24BDAC7A8](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_235476B44();
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  __asm { BR              X10 }
}

uint64_t sub_23546D660()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjCClassFromMetadata;
  id v17;

  v8 = type metadata accessor for TranslationError();
  sub_23546B590(v1 + *(int *)(v8 + 20), v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v5, 1, v0) == 1)
  {
    sub_23546CC34(v5, &qword_256234CD0);
LABEL_6:
    type metadata accessor for TranslationSession(0);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v15 = sub_235476AC0();

    return v15;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v3, v5, v0);
  sub_235476B14();
  sub_235476B38();
  v9 = sub_235476AE4();
  v11 = v10;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v2);
  if (!v11)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v0);
    goto LABEL_6;
  }
  type metadata accessor for TranslationSession(0);
  v12 = swift_getObjCClassFromMetadata();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v12);
  sub_235476AC0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256234DC0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23547BB20;
  *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v14 + 64) = sub_23546DC20();
  *(_QWORD *)(v14 + 32) = v9;
  *(_QWORD *)(v14 + 40) = v11;
  v15 = sub_235476BBC();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v0);
  return v15;
}

unint64_t sub_23546DC20()
{
  unint64_t result;

  result = qword_256234DC8;
  if (!qword_256234DC8)
  {
    result = MEMORY[0x23B7CC928](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256234DC8);
  }
  return result;
}

unint64_t sub_23546DC68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256234CF0;
  if (!qword_256234CF0)
  {
    v1 = type metadata accessor for TranslationError();
    result = MEMORY[0x23B7CC928](&protocol conformance descriptor for TranslationError, v1);
    atomic_store(result, (unint64_t *)&qword_256234CF0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TranslationError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_235476B44();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = *(int *)(a3 + 24);
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    if (v12(v17, 1, v10))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
  }
  return v4;
}

uint64_t destroy for TranslationError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t result;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_235476B44();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  return result;
}

_BYTE *initializeWithCopy for TranslationError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_235476B44();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(v15, 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  return a1;
}

_BYTE *assignWithCopy for TranslationError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_235476B44();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v16, v17, v9);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
  return a1;
}

_BYTE *initializeWithTake for TranslationError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_235476B44();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(v15, 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  return a1;
}

_BYTE *assignWithTake for TranslationError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_235476B44();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v16, v17, v9);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationError()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23546E500(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 250)
  {
    v4 = *a1;
    if (v4 >= 6)
      return v4 - 5;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TranslationError()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_23546E584(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 250)
  {
    *result = a2 + 5;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_23546E5F8()
{
  unint64_t v0;

  sub_23546E66C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23546E66C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256234E38[0])
  {
    sub_235476B44();
    v0 = sub_235476C58();
    if (!v1)
      atomic_store(v0, qword_256234E38);
  }
}

uint64_t getEnumTagSinglePayload for TranslationError.Cause(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TranslationError.Cause(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23546E79C + 4 * byte_23547BB35[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23546E7D0 + 4 * byte_23547BB30[v4]))();
}

uint64_t sub_23546E7D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23546E7D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23546E7E0);
  return result;
}

uint64_t sub_23546E7EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23546E7F4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23546E7F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23546E800(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TranslationError.Cause()
{
  return &type metadata for TranslationError.Cause;
}

unint64_t sub_23546E820()
{
  unint64_t result;

  result = qword_256234E70;
  if (!qword_256234E70)
  {
    result = MEMORY[0x23B7CC928](&unk_23547BC48, &type metadata for TranslationError.Cause);
    atomic_store(result, (unint64_t *)&qword_256234E70);
  }
  return result;
}

id TranslationSession.allowOnlineTranslation.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_allowOnlineTranslation);
}

id TranslationSession.allowOnlineTranslation.setter(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_setAllowOnlineTranslation_, a1 & 1);
}

id (*TranslationSession.allowOnlineTranslation.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v3, sel_allowOnlineTranslation);
  return sub_23546E900;
}

id sub_23546E900(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setAllowOnlineTranslation_, *(unsigned __int8 *)(a1 + 8));
}

id TranslationSession.textSessionDelegate.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_delegate);
}

uint64_t TranslationSession.textSessionDelegate.setter(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_setDelegate_, a1);
  return swift_unknownObjectRelease();
}

uint64_t (*TranslationSession.textSessionDelegate.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_delegate);
  return sub_23546E9DC;
}

uint64_t sub_23546E9DC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 8), sel_setDelegate_, *(_QWORD *)a1);
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall TranslationSession.cancel()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_cancel);
}

id sub_23546EA2C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_allowOnlineTranslation);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23546EA6C(unsigned __int8 *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_setAllowOnlineTranslation_, *a1);
}

id sub_23546EA94@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_delegate);
  *a2 = result;
  return result;
}

id sub_23546EADC(_QWORD *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession), sel_setDelegate_, *a1);
}

uint64_t sub_23546EB04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  void (*v18)(char *, uint64_t);
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, char *, uint64_t);
  int *v33;
  uint64_t result;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_235476B44();
  v42 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v39 - v8;
  v10 = sub_235476B5C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v39 - v15;
  v17 = objc_msgSend(a1, sel_sourceLocale);
  sub_235476B08();

  sub_235476B50();
  v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v16, v10);
  v19 = objc_msgSend(a1, sel_targetLocale);
  sub_235476B08();

  sub_235476B50();
  v18(v14, v10);
  v20 = objc_msgSend(a1, sel_sourceText);
  v21 = sub_235476BB0();
  v40 = v22;
  v41 = v21;

  v23 = objc_msgSend(a1, sel_targetText);
  v24 = sub_235476BB0();
  v26 = v25;

  v27 = objc_msgSend(a1, sel_clientIdentifier);
  if (v27)
  {
    v28 = v27;
    v29 = sub_235476BB0();
    v31 = v30;

  }
  else
  {

    v29 = 0;
    v31 = 0;
  }
  v32 = *(void (**)(uint64_t, char *, uint64_t))(v42 + 32);
  v32(a2, v9, v4);
  v33 = (int *)type metadata accessor for TranslationSession.Response(0);
  result = ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(a2 + v33[5], v7, v4);
  v35 = (uint64_t *)(a2 + v33[6]);
  v36 = v40;
  *v35 = v41;
  v35[1] = v36;
  v37 = (uint64_t *)(a2 + v33[7]);
  *v37 = v24;
  v37[1] = v26;
  v38 = (uint64_t *)(a2 + v33[8]);
  *v38 = v29;
  v38[1] = v31;
  return result;
}

uint64_t TranslationSession.Response.init(sourceLanguage:targetLanguage:sourceText:targetText:clientIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  int *v19;
  uint64_t result;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;

  v17 = sub_235476B44();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32);
  v18(a9, a1, v17);
  v19 = (int *)type metadata accessor for TranslationSession.Response(0);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v18)(a9 + v19[5], a2, v17);
  v21 = (_QWORD *)(a9 + v19[6]);
  *v21 = a3;
  v21[1] = a4;
  v22 = (_QWORD *)(a9 + v19[7]);
  *v22 = a5;
  v22[1] = a6;
  v23 = (_QWORD *)(a9 + v19[8]);
  *v23 = a7;
  v23[1] = a8;
  return result;
}

uint64_t type metadata accessor for TranslationSession.Response(uint64_t a1)
{
  return sub_235472894(a1, (uint64_t *)&unk_256234F00);
}

uint64_t TranslationSession.sourceLanguage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23546CD34(v1 + OBJC_IVAR____TtC11Translation18TranslationSession_sourceLanguage, a1, &qword_256234CD0);
}

uint64_t TranslationSession.targetLanguage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23546CD34(v1 + OBJC_IVAR____TtC11Translation18TranslationSession_targetLanguage, a1, &qword_256234CD0);
}

uint64_t TranslationSession.Request.sourceText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranslationSession.Request.sourceText.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TranslationSession.Request.sourceText.modify())()
{
  return nullsub_1;
}

uint64_t TranslationSession.Request.clientIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranslationSession.Request.clientIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TranslationSession.Request.clientIdentifier.modify())()
{
  return nullsub_1;
}

Translation::TranslationSession::Request __swiftcall TranslationSession.Request.init(sourceText:clientIdentifier:)(Swift::String sourceText, Swift::String_optional clientIdentifier)
{
  Swift::String_optional *v2;
  Translation::TranslationSession::Request result;

  v2->value = sourceText;
  v2[1] = clientIdentifier;
  result.clientIdentifier = clientIdentifier;
  result.sourceText = sourceText;
  return result;
}

uint64_t TranslationSession.Response.sourceLanguage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_235476B44();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TranslationSession.Response.targetLanguage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TranslationSession.Response(0) + 20);
  v4 = sub_235476B44();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TranslationSession.Response.sourceText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TranslationSession.Response(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranslationSession.Response.targetText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TranslationSession.Response(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranslationSession.Response.clientIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TranslationSession.Response(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranslationSession.BatchResponse.makeAsyncIterator()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234E78);
  return sub_235476C28();
}

uint64_t TranslationSession.BatchResponse.AsyncIterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256234E88);
  *v1 = v0;
  v1[1] = sub_23546B334;
  return sub_235476C34();
}

uint64_t sub_23546F168()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256234E88);
  *v1 = v0;
  v1[1] = sub_23547381C;
  return sub_235476C34();
}

uint64_t sub_23546F1D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v4[6] = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256234E88);
  *v5 = v4;
  v5[1] = sub_23546F248;
  return sub_235476C34();
}

uint64_t sub_23546F248()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  if (*(_QWORD *)(v2 + 24))
  {
    swift_getObjectType();
    sub_235476BEC();
  }
  return swift_task_switch();
}

uint64_t sub_23546F2E0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD **)(v0 + 40);
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234DB8);
  swift_willThrowTypedImpl();
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23546F348()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256234E78);
  sub_235476C28();
  return sub_235473648(v0, type metadata accessor for TranslationSession.BatchResponse);
}

uint64_t TranslationSession.Configuration.source.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23546CD34(v1, a1, &qword_256234CD0);
}

uint64_t TranslationSession.Configuration.source.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23546F3B4(a1, v1);
}

uint64_t sub_23546F3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TranslationSession.Configuration.source.modify())()
{
  return nullsub_1;
}

uint64_t TranslationSession.Configuration.target.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TranslationSession.Configuration(0);
  return sub_23546CD34(v1 + *(int *)(v3 + 20), a1, &qword_256234CD0);
}

uint64_t type metadata accessor for TranslationSession.Configuration(uint64_t a1)
{
  return sub_235472894(a1, (uint64_t *)&unk_256234F40);
}

uint64_t TranslationSession.Configuration.target.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TranslationSession.Configuration(0) + 20);
  return sub_23546F3B4(a1, v3);
}

uint64_t (*TranslationSession.Configuration.target.modify())()
{
  type metadata accessor for TranslationSession.Configuration(0);
  return nullsub_1;
}

uint64_t TranslationSession.Configuration.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TranslationSession.Configuration(0) + 24));
}

uint64_t TranslationSession.Configuration.managedInternally.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TranslationSession.Configuration(0) + 28));
}

uint64_t TranslationSession.Configuration.managedInternally.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for TranslationSession.Configuration(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*TranslationSession.Configuration.managedInternally.modify())()
{
  type metadata accessor for TranslationSession.Configuration(0);
  return nullsub_1;
}

Swift::Void __swiftcall TranslationSession.Configuration.invalidate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v1 = *(int *)(type metadata accessor for TranslationSession.Configuration(0) + 24);
  v2 = *(_QWORD *)(v0 + v1);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
    __break(1u);
  else
    *(_QWORD *)(v0 + v1) = v4;
}

uint64_t TranslationSession.Configuration.init(source:target:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  uint64_t result;

  v6 = sub_235476B44();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(a3, 1, 1, v6);
  v8 = (int *)type metadata accessor for TranslationSession.Configuration(0);
  v9 = a3 + v8[5];
  v7(v9, 1, 1, v6);
  sub_23546F3B4(a1, a3);
  result = sub_23546F3B4(a2, v9);
  *(_QWORD *)(a3 + v8[6]) = 0;
  *(_BYTE *)(a3 + v8[7]) = 0;
  return result;
}

uint64_t TranslationSession.Configuration.init(source:target:managedInternally:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  int *v10;
  uint64_t v11;
  uint64_t result;

  v8 = sub_235476B44();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(a4, 1, 1, v8);
  v10 = (int *)type metadata accessor for TranslationSession.Configuration(0);
  v11 = a4 + v10[5];
  v9(v11, 1, 1, v8);
  sub_23546F3B4(a1, a4);
  result = sub_23546F3B4(a2, v11);
  *(_QWORD *)(a4 + v10[6]) = 0;
  *(_BYTE *)(a4 + v10[7]) = a3;
  return result;
}

uint64_t sub_23546F6EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[18] = a3;
  v4[19] = v3;
  v4[16] = a1;
  v4[17] = a2;
  return swift_task_switch();
}

uint64_t sub_23546F708()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(void **)(v0[19] + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession);
  v2 = sub_235476BA4();
  v0[20] = v2;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23546F7C4;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_23546F8DC;
  v4[3] = &block_descriptor_0;
  v4[4] = v3;
  objc_msgSend(v1, sel_translateString_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_23546F7C4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23546F824()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);

  sub_23546EB04(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23546F868()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 168);
  swift_willThrow();

  v3 = (void *)sub_235476AD8();
  sub_23546BE8C(v3);

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23546F8DC(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234DB8);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23546F968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256234E98);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v19[1] = v3;
    v20 = v7;
    v21 = v6;
    v22 = a2;
    v23 = MEMORY[0x24BEE4AF8];
    sub_235476C94();
    v12 = (uint64_t *)(a1 + 56);
    do
    {
      v14 = *v12;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v15 = (void *)sub_235476BA4();
      swift_bridgeObjectRelease();
      if (v14)
      {
        v13 = (void *)sub_235476BA4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v13 = 0;
      }
      v12 += 4;
      objc_msgSend(objc_allocWithZone((Class)_LTTextInput), sel_initWithSourceText_clientIdentifier_, v15, v13);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235476C7C();
      sub_235476CA0();
      sub_235476CAC();
      sub_235476C88();
      --v10;
    }
    while (v10);
    v11 = v23;
    v7 = v20;
    v6 = v21;
  }
  v16 = swift_allocObject();
  v17 = swift_weakInit();
  MEMORY[0x24BDAC7A8](v17);
  v19[-2] = v16;
  v19[-1] = v11;
  type metadata accessor for TranslationSession.Response(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE6CA0], v6);
  sub_235476C40();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23546FB9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  void *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  unint64_t v9;
  uint64_t v10;
  void (*v11)(unint64_t, char *, uint64_t);
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t aBlock;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234F70);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v7 = *(void **)(result + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession);
    sub_2354736BC(0, &qword_256234F58);
    v19 = v7;
    v18 = sub_235476BD4();
    v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v8((char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v10 = swift_allocObject();
    v11 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
    v11(v10 + v9, v5, v2);
    v24 = sub_235473748;
    v25 = v10;
    aBlock = MEMORY[0x24BDAC760];
    v21 = 1107296256;
    v22 = sub_23546FF7C;
    v23 = &block_descriptor_31;
    v12 = _Block_copy(&aBlock);
    swift_release();
    v8(v5, a1, v2);
    v13 = swift_allocObject();
    v11(v13 + v9, v5, v2);
    v24 = sub_235473768;
    v25 = v13;
    aBlock = MEMORY[0x24BDAC760];
    v21 = 1107296256;
    v22 = sub_235470098;
    v23 = &block_descriptor_37;
    v14 = _Block_copy(&aBlock);
    swift_release();
    v16 = (void *)v18;
    v15 = v19;
    objc_msgSend(v19, sel_translateBatch_itemHandler_completionHandler_, v18, v12, v14);
    _Block_release(v14);
    _Block_release(v12);

    return swift_release();
  }
  return result;
}

void sub_23546FDF0(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234F78);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TranslationSession.Response(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v18 - v12;
  if (a2)
  {
    v14 = a2;
    v15 = (void *)sub_235476AD8();
    v16 = (void *)sub_23546BE8C(v15);

    v18[1] = v16;
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234F70);
    sub_235476C1C();

  }
  else if (a1)
  {
    sub_23546EB04(a1, (uint64_t)v13);
    sub_2354737D8((uint64_t)v13, (uint64_t)v11, type metadata accessor for TranslationSession.Response);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234F70);
    sub_235476C10();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_235473648((uint64_t)v13, type metadata accessor for TranslationSession.Response);
  }
}

void sub_23546FF7C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_23546FFF0(int a1, id a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (a2)
  {
    v3 = a2;
    v4 = (void *)sub_235476AD8();
    v5 = (void *)sub_23546BE8C(v4);

    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234F70);
    sub_235476C1C();

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234F70);
    sub_235476C1C();
  }
}

uint64_t sub_235470098(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2354736BC(0, &qword_256234F60);
    v4 = sub_235476BE0();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235470124(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_23547013C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v1 = v0[3];
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_235476C94();
    v4 = (uint64_t *)(v1 + 56);
    do
    {
      v6 = *v4;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v7 = (void *)sub_235476BA4();
      swift_bridgeObjectRelease();
      if (v6)
      {
        v5 = (void *)sub_235476BA4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v5 = 0;
      }
      v4 += 4;
      objc_msgSend(objc_allocWithZone((Class)_LTTextInput), sel_initWithSourceText_clientIdentifier_, v7, v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_235476C7C();
      sub_235476CA0();
      sub_235476CAC();
      sub_235476C88();
      --v2;
    }
    while (v2);
    v3 = v12;
  }
  v0[5] = v3;
  v8 = swift_allocObject();
  v0[6] = v8;
  swift_weakInit();
  v9 = swift_task_alloc();
  v0[7] = v9;
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v3;
  v10 = (_QWORD *)swift_task_alloc();
  v0[8] = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256234EA8);
  *v10 = v0;
  v10[1] = sub_235470338;
  return sub_235476D00();
}

uint64_t sub_235470338()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_2354703C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2354703CC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235470414(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234F50);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v6 = *(void **)(result + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession);
    sub_2354736BC(0, &qword_256234F58);
    v7 = v6;
    v8 = (void *)sub_235476BD4();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v10 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    aBlock[4] = sub_235473690;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235470098;
    aBlock[3] = &block_descriptor_25;
    v11 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v7, sel_translateBatch_itemHandler_completionHandler_, v8, 0, v11);
    _Block_release(v11);

    return swift_release();
  }
  return result;
}

void sub_2354705D0(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  id v27;
  char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  int *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  int *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;

  v6 = sub_235476B44();
  v74 = *(_QWORD *)(v6 - 8);
  v75 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v78 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v77 = (char *)&v64 - v9;
  v10 = sub_235476B5C();
  v72 = *(_QWORD *)(v10 - 8);
  v73 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v71 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v70 = (char *)&v64 - v13;
  v14 = type metadata accessor for TranslationSession.Response(0);
  v68 = *(_QWORD *)(v14 - 8);
  v69 = (int *)v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v17 = sub_235476CC4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v18 = (unint64_t *)MEMORY[0x24BEE4AF8];
    if (!v17)
    {
LABEL_18:
      v79 = (uint64_t)v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256234F50);
      sub_235476C04();
      return;
    }
    v79 = MEMORY[0x24BEE4AF8];
    sub_2354712D8(0, v17 & ~(v17 >> 63), 0);
    if ((v17 & 0x8000000000000000) == 0)
    {
      v64 = a3;
      v65 = v17;
      v19 = 0;
      v66 = a1 & 0xC000000000000001;
      v67 = a1;
      do
      {
        if (v66)
          v20 = (id)MEMORY[0x23B7CC238](v19, a1);
        else
          v20 = *(id *)(a1 + 8 * v19 + 32);
        v21 = v20;
        v22 = objc_msgSend(v20, sel_sourceLocale, v64);
        v23 = v70;
        sub_235476B08();

        sub_235476B50();
        v24 = *(void (**)(char *, uint64_t))(v72 + 8);
        v25 = v23;
        v26 = v73;
        v24(v25, v73);
        v27 = objc_msgSend(v21, sel_targetLocale);
        v28 = v71;
        sub_235476B08();

        sub_235476B50();
        v24(v28, v26);
        v29 = objc_msgSend(v21, sel_sourceText);
        v76 = sub_235476BB0();
        v31 = v30;

        v32 = objc_msgSend(v21, sel_targetText);
        v33 = sub_235476BB0();
        v35 = v34;

        v36 = objc_msgSend(v21, sel_clientIdentifier);
        if (v36)
        {
          v37 = v36;
          v38 = sub_235476BB0();
          v40 = v39;

        }
        else
        {

          v38 = 0;
          v40 = 0;
        }
        v41 = v75;
        v42 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
        v42(v16, v77, v75);
        v43 = v16;
        v44 = v69;
        v42(&v43[v69[5]], v78, v41);
        v45 = (uint64_t *)&v43[v44[6]];
        *v45 = v76;
        v45[1] = v31;
        v46 = (uint64_t *)&v43[v44[7]];
        *v46 = v33;
        v46[1] = v35;
        v47 = v44[8];
        v16 = v43;
        v48 = (uint64_t *)&v43[v47];
        *v48 = v38;
        v48[1] = v40;
        v18 = (unint64_t *)v79;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2354712D8(0, v18[2] + 1, 1);
          v18 = (unint64_t *)v79;
        }
        v49 = v65;
        v51 = v18[2];
        v50 = v18[3];
        if (v51 >= v50 >> 1)
        {
          sub_2354712D8(v50 > 1, v51 + 1, 1);
          v18 = (unint64_t *)v79;
        }
        ++v19;
        v18[2] = v51 + 1;
        sub_2354736F4((uint64_t)v16, (uint64_t)v18+ ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80))+ *(_QWORD *)(v68 + 72) * v51);
        a1 = v67;
      }
      while (v49 != v19);
      goto LABEL_18;
    }
    __break(1u);
LABEL_29:
    swift_once();
    goto LABEL_22;
  }
  if (a2)
  {
    v52 = a2;
    v53 = (void *)sub_235476AD8();
    v54 = (void *)sub_23546BE8C(v53);

    v79 = (uint64_t)v54;
    v55 = v54;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256234F50);
    sub_235476BF8();

    return;
  }
  if (qword_256234B80 != -1)
    goto LABEL_29;
LABEL_22:
  v56 = sub_235476B80();
  __swift_project_value_buffer(v56, (uint64_t)qword_256235510);
  v57 = sub_235476B68();
  v58 = sub_235476C4C();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v59 = 0;
    _os_log_impl(&dword_235438000, v57, v58, "Got a batch response that ended with no results an no error; throwing internal error",
      v59,
      2u);
    MEMORY[0x23B7CC988](v59, -1, -1);
  }

  if (qword_256234BB0 != -1)
    swift_once();
  v60 = type metadata accessor for TranslationError();
  v61 = __swift_project_value_buffer(v60, (uint64_t)qword_256234D98);
  sub_23546CC70((unint64_t *)&qword_256234CF0, (uint64_t (*)(uint64_t))type metadata accessor for TranslationError, (uint64_t)&protocol conformance descriptor for TranslationError);
  v62 = swift_allocError();
  sub_2354737D8(v61, v63, (uint64_t (*)(_QWORD))type metadata accessor for TranslationError);
  v79 = v62;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234F50);
  sub_235476BF8();
}

uint64_t sub_235470BB0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_235470BC8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[15] + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession);
  v0[2] = v0;
  v0[3] = sub_235470C60;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_235470D3C;
  v3[3] = &block_descriptor_7;
  v3[4] = v2;
  objc_msgSend(v1, sel_prepareDownloadsWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_235470C60()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 128) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_235470CC0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235470CCC()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 128);
  swift_willThrow();
  v2 = (void *)sub_235476AD8();
  sub_23546BE8C(v2);

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235470D3C(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256234DB8);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t TranslationSession.__allocating_init(sourceLanguage:targetLanguage:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  TranslationSession.init(sourceLanguage:targetLanguage:)(a1, a2);
  return v4;
}

uint64_t TranslationSession.init(sourceLanguage:targetLanguage:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v23;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v23 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v23 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v23 - v19;
  sub_23546CD34(a1, v3 + OBJC_IVAR____TtC11Translation18TranslationSession_sourceLanguage, &qword_256234CD0);
  sub_23546CD34(a2, v3 + OBJC_IVAR____TtC11Translation18TranslationSession_targetLanguage, &qword_256234CD0);
  sub_23546CD34(a1, (uint64_t)v8, &qword_256234CD0);
  sub_23546B744((uint64_t)v8, (uint64_t)v20);
  sub_23546CD34(a2, (uint64_t)v8, &qword_256234CD0);
  sub_23546B744((uint64_t)v8, (uint64_t)v18);
  sub_2354736BC(0, qword_256234EB8);
  sub_23546CD34((uint64_t)v20, (uint64_t)v15, &qword_256234CD8);
  sub_23546CD34((uint64_t)v18, (uint64_t)v12, &qword_256234CD8);
  v21 = sub_235471008((uint64_t)v15, (uint64_t)v12);
  sub_23546CC34(a2, &qword_256234CD0);
  sub_23546CC34(a1, &qword_256234CD0);
  sub_23546CC34((uint64_t)v18, &qword_256234CD8);
  sub_23546CC34((uint64_t)v20, &qword_256234CD8);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11Translation18TranslationSession_underlyingTextSession) = v21;
  return v3;
}

id sub_235471008(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  void *v7;
  void *v8;
  id v9;

  v4 = sub_235476B5C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  v7 = 0;
  if (v6(a1, 1, v4) != 1)
  {
    v7 = (void *)sub_235476AFC();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  if (v6(a2, 1, v4) == 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_235476AFC();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSourceLocale_targetLocale_, v7, v8);

  return v9;
}

uint64_t TranslationSession.__allocating_init(configuration:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v11 - v6;
  sub_23546CD34(a1, (uint64_t)&v11 - v6, &qword_256234CD0);
  v8 = type metadata accessor for TranslationSession.Configuration(0);
  sub_23546CD34(a1 + *(int *)(v8 + 20), (uint64_t)v5, &qword_256234CD0);
  type metadata accessor for TranslationSession(0);
  v9 = swift_allocObject();
  TranslationSession.init(sourceLanguage:targetLanguage:)((uint64_t)v7, (uint64_t)v5);
  sub_235473648(a1, type metadata accessor for TranslationSession.Configuration);
  return v9;
}

uint64_t TranslationSession.deinit()
{
  uint64_t v0;

  sub_23546CC34(v0 + OBJC_IVAR____TtC11Translation18TranslationSession_sourceLanguage, &qword_256234CD0);
  sub_23546CC34(v0 + OBJC_IVAR____TtC11Translation18TranslationSession_targetLanguage, &qword_256234CD0);

  return v0;
}

uint64_t TranslationSession.__deallocating_deinit()
{
  uint64_t v0;

  sub_23546CC34(v0 + OBJC_IVAR____TtC11Translation18TranslationSession_sourceLanguage, &qword_256234CD0);
  sub_23546CC34(v0 + OBJC_IVAR____TtC11Translation18TranslationSession_targetLanguage, &qword_256234CD0);

  return swift_deallocClassInstance();
}

uint64_t sub_2354712AC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_235471304(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_256234F90, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEE28]);
  *v3 = result;
  return result;
}

uint64_t sub_2354712D8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_235471304(a1, a2, a3, (_QWORD *)*v3, &qword_256234F68, type metadata accessor for TranslationSession.Response);
  *v3 = result;
  return result;
}

uint64_t sub_235471304(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_235476CDC();
  __break(1u);
  return result;
}

uint64_t _s11Translation0A7SessionC13ConfigurationV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  unsigned int (*v35)(uint64_t, uint64_t, uint64_t);
  _BYTE *v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  _BYTE *v44;
  void (*v45)(_BYTE *, uint64_t);
  _BYTE *v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  _BYTE *v56;
  _BYTE *v57;
  char v58;
  _BYTE *v60;
  char v61;
  void (*v62)(_BYTE *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  _BYTE v68[12];
  int v69;
  _BYTE *v70;
  _BYTE *v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  _BYTE *v76;
  _BYTE *v77;
  _BYTE *v78;
  _BYTE *v79;
  _BYTE *v80;
  uint64_t v81;

  v73 = type metadata accessor for TranslationSession.Configuration(0);
  v4 = MEMORY[0x24BDAC7A8](v73);
  v78 = &v68[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = MEMORY[0x24BDAC7A8](v4);
  v75 = &v68[-v7];
  v8 = MEMORY[0x24BDAC7A8](v6);
  v77 = &v68[-v9];
  v10 = MEMORY[0x24BDAC7A8](v8);
  v76 = &v68[-v11];
  v12 = MEMORY[0x24BDAC7A8](v10);
  v79 = &v68[-v13];
  MEMORY[0x24BDAC7A8](v12);
  v80 = &v68[-v14];
  v15 = sub_235476B44();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v71 = &v68[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234F80);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v72 = &v68[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v19);
  v22 = &v68[-v21];
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v70 = &v68[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = &v68[-v27];
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = &v68[-v30];
  MEMORY[0x24BDAC7A8](v29);
  v33 = &v68[-v32];
  v81 = a1;
  sub_23546CD34(a1, (uint64_t)&v68[-v32], &qword_256234CD0);
  v74 = a2;
  sub_23546CD34(a2, (uint64_t)v31, &qword_256234CD0);
  v34 = (uint64_t)&v22[*(int *)(v18 + 48)];
  sub_23546CD34((uint64_t)v33, (uint64_t)v22, &qword_256234CD0);
  sub_23546CD34((uint64_t)v31, v34, &qword_256234CD0);
  v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v35((uint64_t)v22, 1, v15) == 1)
  {
    sub_23546CC34((uint64_t)v31, &qword_256234CD0);
    sub_23546CC34((uint64_t)v33, &qword_256234CD0);
    if (v35(v34, 1, v15) == 1)
    {
      sub_23546CC34((uint64_t)v22, &qword_256234CD0);
      v36 = v80;
      sub_2354737D8(v81, (uint64_t)v80, type metadata accessor for TranslationSession.Configuration);
      v37 = v74;
      v38 = v79;
      sub_2354737D8(v74, (uint64_t)v79, type metadata accessor for TranslationSession.Configuration);
      v39 = (uint64_t)v38;
      v40 = (uint64_t)v75;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_23546CD34((uint64_t)v22, (uint64_t)v28, &qword_256234CD0);
  if (v35(v34, 1, v15) == 1)
  {
    sub_23546CC34((uint64_t)v31, &qword_256234CD0);
    sub_23546CC34((uint64_t)v33, &qword_256234CD0);
    (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v28, v15);
LABEL_6:
    sub_23546CC34((uint64_t)v22, &qword_256234F80);
    v36 = v80;
    v41 = v81;
    sub_2354737D8(v81, (uint64_t)v80, type metadata accessor for TranslationSession.Configuration);
    v37 = v74;
    v42 = v79;
    sub_2354737D8(v74, (uint64_t)v79, type metadata accessor for TranslationSession.Configuration);
    v39 = (uint64_t)v42;
    v43 = (uint64_t)v78;
    v40 = (uint64_t)v75;
LABEL_11:
    sub_235473648(v39, type metadata accessor for TranslationSession.Configuration);
    sub_235473648((uint64_t)v36, type metadata accessor for TranslationSession.Configuration);
    v55 = v76;
    v56 = v77;
LABEL_15:
    sub_2354737D8(v41, (uint64_t)v55, type metadata accessor for TranslationSession.Configuration);
    sub_2354737D8(v37, (uint64_t)v56, type metadata accessor for TranslationSession.Configuration);
LABEL_16:
    sub_235473648((uint64_t)v56, type metadata accessor for TranslationSession.Configuration);
    sub_235473648((uint64_t)v55, type metadata accessor for TranslationSession.Configuration);
    sub_2354737D8(v41, v40, type metadata accessor for TranslationSession.Configuration);
    sub_2354737D8(v37, v43, type metadata accessor for TranslationSession.Configuration);
    goto LABEL_17;
  }
  v44 = v71;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 32))(v71, v34, v15);
  sub_23546CC70(&qword_256234F88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEE28], MEMORY[0x24BDCEE40]);
  v69 = sub_235476B98();
  v45 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
  v45(v44, v15);
  sub_23546CC34((uint64_t)v31, &qword_256234CD0);
  sub_23546CC34((uint64_t)v33, &qword_256234CD0);
  v45(v28, v15);
  sub_23546CC34((uint64_t)v22, &qword_256234CD0);
  v46 = v80;
  v41 = v81;
  sub_2354737D8(v81, (uint64_t)v80, type metadata accessor for TranslationSession.Configuration);
  v37 = v74;
  v47 = v79;
  v36 = v46;
  sub_2354737D8(v74, (uint64_t)v79, type metadata accessor for TranslationSession.Configuration);
  v39 = (uint64_t)v47;
  v43 = (uint64_t)v78;
  v40 = (uint64_t)v75;
  if ((v69 & 1) == 0)
    goto LABEL_11;
LABEL_8:
  v48 = *(int *)(v73 + 20);
  v49 = (uint64_t)&v36[v48];
  v50 = v39 + v48;
  v51 = *(int *)(v18 + 48);
  v52 = v72;
  v53 = (uint64_t)&v72[v51];
  v54 = v39;
  sub_23546CD34(v49, (uint64_t)v72, &qword_256234CD0);
  sub_23546CD34(v50, v53, &qword_256234CD0);
  if (v35((uint64_t)v52, 1, v15) == 1)
  {
    sub_235473648(v54, type metadata accessor for TranslationSession.Configuration);
    sub_235473648((uint64_t)v80, type metadata accessor for TranslationSession.Configuration);
    if (v35(v53, 1, v15) == 1)
    {
      sub_23546CC34((uint64_t)v52, &qword_256234CD0);
      v41 = v81;
      v55 = v76;
      sub_2354737D8(v81, (uint64_t)v76, type metadata accessor for TranslationSession.Configuration);
      v56 = v77;
      sub_2354737D8(v37, (uint64_t)v77, type metadata accessor for TranslationSession.Configuration);
      v43 = (uint64_t)v78;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  v57 = v70;
  sub_23546CD34((uint64_t)v52, (uint64_t)v70, &qword_256234CD0);
  if (v35(v53, 1, v15) == 1)
  {
    sub_235473648((uint64_t)v79, type metadata accessor for TranslationSession.Configuration);
    sub_235473648((uint64_t)v80, type metadata accessor for TranslationSession.Configuration);
    (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v57, v15);
LABEL_14:
    sub_23546CC34((uint64_t)v52, &qword_256234F80);
    v41 = v81;
    v55 = v76;
    v56 = v77;
    v43 = (uint64_t)v78;
    goto LABEL_15;
  }
  v60 = v71;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 32))(v71, v53, v15);
  sub_23546CC70(&qword_256234F88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEE28], MEMORY[0x24BDCEE40]);
  v61 = sub_235476B98();
  v62 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
  v62(v60, v15);
  sub_235473648((uint64_t)v79, type metadata accessor for TranslationSession.Configuration);
  sub_235473648((uint64_t)v80, type metadata accessor for TranslationSession.Configuration);
  v62(v57, v15);
  sub_23546CC34((uint64_t)v52, &qword_256234CD0);
  v41 = v81;
  v55 = v76;
  sub_2354737D8(v81, (uint64_t)v76, type metadata accessor for TranslationSession.Configuration);
  v56 = v77;
  sub_2354737D8(v37, (uint64_t)v77, type metadata accessor for TranslationSession.Configuration);
  v43 = (uint64_t)v78;
  if ((v61 & 1) == 0)
    goto LABEL_16;
LABEL_20:
  v63 = v73;
  v64 = *(_QWORD *)&v55[*(int *)(v73 + 24)];
  sub_235473648((uint64_t)v55, type metadata accessor for TranslationSession.Configuration);
  v65 = *(_QWORD *)&v56[*(int *)(v63 + 24)];
  sub_235473648((uint64_t)v56, type metadata accessor for TranslationSession.Configuration);
  sub_2354737D8(v41, v40, type metadata accessor for TranslationSession.Configuration);
  sub_2354737D8(v37, v43, type metadata accessor for TranslationSession.Configuration);
  if (v64 == v65)
  {
    v66 = *(_BYTE *)(v40 + *(int *)(v63 + 28));
    sub_235473648(v40, type metadata accessor for TranslationSession.Configuration);
    v67 = *(_BYTE *)(v43 + *(int *)(v63 + 28));
    sub_235473648(v43, type metadata accessor for TranslationSession.Configuration);
    v58 = v66 ^ v67 ^ 1;
    return v58 & 1;
  }
LABEL_17:
  sub_235473648(v43, type metadata accessor for TranslationSession.Configuration);
  sub_235473648(v40, type metadata accessor for TranslationSession.Configuration);
  v58 = 0;
  return v58 & 1;
}

uint64_t sub_235471D24()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235471D48(uint64_t a1)
{
  return sub_23546FB9C(a1);
}

uint64_t sub_235471D50(uint64_t a1)
{
  return sub_235470414(a1);
}

uint64_t type metadata accessor for TranslationSession(uint64_t a1)
{
  return sub_235472894(a1, (uint64_t *)&unk_256234ED8);
}

uint64_t sub_235471D6C()
{
  return MEMORY[0x24BEE3F20];
}

uint64_t sub_235471D78()
{
  return sub_23546CC70(&qword_256234ED0, type metadata accessor for TranslationSession.BatchResponse.AsyncIterator, (uint64_t)&protocol conformance descriptor for TranslationSession.BatchResponse.AsyncIterator);
}

uint64_t type metadata accessor for TranslationSession.BatchResponse.AsyncIterator(uint64_t a1)
{
  return sub_235472894(a1, (uint64_t *)&unk_256234F28);
}

uint64_t sub_235471DB8()
{
  return type metadata accessor for TranslationSession(0);
}

void sub_235471DC0()
{
  unint64_t v0;

  sub_23546E66C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for TranslationSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TranslationSession.translate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 104)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 104));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23547381C;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of TranslationSession.translate(batch:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of TranslationSession.translations(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_235471F38;
  return v6(a1);
}

uint64_t sub_235471F38(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of TranslationSession.prepareTranslation()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 128) + *(_QWORD *)(*(_QWORD *)v0 + 128));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23546B334;
  return v4();
}

uint64_t dispatch thunk of TranslationSession.__allocating_init(sourceLanguage:targetLanguage:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t initializeBufferWithCopyOfBuffer for TranslationSession.Request(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TranslationSession.Request()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TranslationSession.Request(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TranslationSession.Request(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for TranslationSession.Request(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationSession.Request(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TranslationSession.Request(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationSession.Request()
{
  return &type metadata for TranslationSession.Request;
}

uint64_t *initializeBufferWithCopyOfBuffer for TranslationSession.Response(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_235476B44();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v9 = a3[6];
    v10 = a3[7];
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (uint64_t *)((char *)a1 + v10);
    v15 = (uint64_t *)((char *)a2 + v10);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = a3[8];
    v18 = (uint64_t *)((char *)a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TranslationSession.Response(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_235476B44();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TranslationSession.Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = sub_235476B44();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a3[7];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_QWORD *)(a1 + v9);
  v14 = (_QWORD *)(a2 + v9);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TranslationSession.Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v6 = sub_235476B44();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[8];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TranslationSession.Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_235476B44();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for TranslationSession.Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = sub_235476B44();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[8];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationSession.Response()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23547264C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_235476B44();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for TranslationSession.Response()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2354726D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_235476B44();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_235472754()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235476B44();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TranslationSession.BatchResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234E78);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for TranslationSession.BatchResponse(uint64_t a1, uint64_t a2)
{
  return sub_23547296C(a1, a2, &qword_256234E78);
}

uint64_t initializeWithCopy for TranslationSession.BatchResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2354729AC(a1, a2, a3, &qword_256234E78);
}

uint64_t assignWithCopy for TranslationSession.BatchResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2354729FC(a1, a2, a3, &qword_256234E78);
}

uint64_t initializeWithTake for TranslationSession.BatchResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235472A4C(a1, a2, a3, &qword_256234E78);
}

uint64_t assignWithTake for TranslationSession.BatchResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235472A9C(a1, a2, a3, &qword_256234E78);
}

uint64_t getEnumTagSinglePayload for TranslationSession.BatchResponse()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23547285C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_12Tm(a1, a2, a3, &qword_256234E78);
}

uint64_t storeEnumTagSinglePayload for TranslationSession.BatchResponse()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235472874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_13Tm(a1, a2, a3, a4, &qword_256234E78);
}

uint64_t type metadata accessor for TranslationSession.BatchResponse(uint64_t a1)
{
  return sub_235472894(a1, (uint64_t *)&unk_256234F10);
}

uint64_t sub_235472894(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2354728C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_235472BA0(a1, a2, a3, &qword_256234F20, MEMORY[0x24BEE6D28]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CC91C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TranslationSession.BatchResponse.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256234E88);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for TranslationSession.BatchResponse.AsyncIterator(uint64_t a1, uint64_t a2)
{
  return sub_23547296C(a1, a2, (uint64_t *)&unk_256234E88);
}

uint64_t sub_23547296C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

uint64_t initializeWithCopy for TranslationSession.BatchResponse.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2354729AC(a1, a2, a3, (uint64_t *)&unk_256234E88);
}

uint64_t sub_2354729AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  return a1;
}

uint64_t assignWithCopy for TranslationSession.BatchResponse.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2354729FC(a1, a2, a3, (uint64_t *)&unk_256234E88);
}

uint64_t sub_2354729FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  return a1;
}

uint64_t initializeWithTake for TranslationSession.BatchResponse.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235472A4C(a1, a2, a3, (uint64_t *)&unk_256234E88);
}

uint64_t sub_235472A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  return a1;
}

uint64_t assignWithTake for TranslationSession.BatchResponse.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235472A9C(a1, a2, a3, (uint64_t *)&unk_256234E88);
}

uint64_t sub_235472A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationSession.BatchResponse.AsyncIterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235472AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_12Tm(a1, a2, a3, (uint64_t *)&unk_256234E88);
}

uint64_t __swift_get_extra_inhabitant_index_12Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for TranslationSession.BatchResponse.AsyncIterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235472B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_13Tm(a1, a2, a3, a4, (uint64_t *)&unk_256234E88);
}

uint64_t __swift_store_extra_inhabitant_index_13Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, a2, a2, v7);
}

void sub_235472B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_235472BA0(a1, a2, a3, &qword_256234F38, MEMORY[0x24BEE6D08]);
}

void sub_235472BA0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  unint64_t v5;

  sub_235472C10(319, a4, a5);
  if (v5 <= 0x3F)
    swift_initStructMetadata();
}

void sub_235472C10(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = type metadata accessor for TranslationSession.Response(255);
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256234DB8);
    v8 = a3(a1, v6, v7, MEMORY[0x24BEE3F20]);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TranslationSession.Configuration(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_235476B44();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v12 = a3[5];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 1, v7))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
    v16 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *((_BYTE *)a1 + v16) = *((_BYTE *)a2 + v16);
  }
  return a1;
}

uint64_t destroy for TranslationSession.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;

  v4 = sub_235476B44();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v7 = a1 + *(int *)(a2 + 20);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v7, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  return result;
}

char *initializeWithCopy for TranslationSession.Configuration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_235476B44();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v14 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v14] = a2[v14];
  return a1;
}

char *assignWithCopy for TranslationSession.Configuration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;

  v6 = sub_235476B44();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 1, v6);
  v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
LABEL_13:
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *initializeWithTake for TranslationSession.Configuration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_235476B44();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v14 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v14] = a2[v14];
  return a1;
}

char *assignWithTake for TranslationSession.Configuration(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_235476B44();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 1, v6);
  v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
LABEL_13:
  v18 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v18] = a2[v18];
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationSession.Configuration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2354734B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TranslationSession.Configuration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23547354C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256234CD0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 28)) = a2 + 1;
  return result;
}

void sub_2354735C8()
{
  unint64_t v0;

  sub_23546E66C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_235473648(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235473684()
{
  return objectdestroy_11Tm(&qword_256234F50);
}

uint64_t sub_235473690(uint64_t a1, uint64_t a2)
{
  return sub_23547377C(a1, a2, &qword_256234F50, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2354705D0);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_2354736BC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2354736F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TranslationSession.Response(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23547373C()
{
  return objectdestroy_11Tm(&qword_256234F70);
}

uint64_t sub_235473748(uint64_t a1, uint64_t a2)
{
  return sub_23547377C(a1, a2, &qword_256234F70, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23546FDF0);
}

uint64_t sub_23547375C()
{
  return objectdestroy_11Tm(&qword_256234F70);
}

uint64_t sub_235473768(uint64_t a1, uint64_t a2)
{
  return sub_23547377C(a1, a2, &qword_256234F70, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23546FFF0);
}

uint64_t sub_23547377C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8) + 80);
  return a4(a1, a2, v4 + ((v7 + 16) & ~v7));
}

uint64_t sub_2354737D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235476A78()
{
  return MEMORY[0x24BDCADA0]();
}

uint64_t sub_235476A84()
{
  return MEMORY[0x24BDCAE20]();
}

uint64_t sub_235476A90()
{
  return MEMORY[0x24BDCAEB0]();
}

uint64_t sub_235476A9C()
{
  return MEMORY[0x24BDCAEE8]();
}

uint64_t sub_235476AA8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_235476AB4()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_235476AC0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_235476ACC()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_235476AD8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_235476AE4()
{
  return MEMORY[0x24BDCEBE8]();
}

uint64_t sub_235476AF0()
{
  return MEMORY[0x24BDCEC78]();
}

uint64_t sub_235476AFC()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_235476B08()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_235476B14()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_235476B20()
{
  return MEMORY[0x24BDCEDC0]();
}

uint64_t sub_235476B2C()
{
  return MEMORY[0x24BDCEDC8]();
}

uint64_t sub_235476B38()
{
  return MEMORY[0x24BDCEDF0]();
}

uint64_t sub_235476B44()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_235476B50()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_235476B5C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_235476B68()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235476B74()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235476B80()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235476B8C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235476B98()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235476BA4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235476BB0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235476BBC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_235476BC8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235476BD4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235476BE0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235476BEC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_235476BF8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_235476C04()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_235476C10()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_235476C1C()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_235476C28()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_235476C34()
{
  return MEMORY[0x24BEE6CF8]();
}

uint64_t sub_235476C40()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_235476C4C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235476C58()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_235476C64()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235476C70()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235476C7C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_235476C88()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_235476C94()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_235476CA0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_235476CAC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_235476CB8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_235476CC4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235476CD0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235476CDC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235476CE8()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_235476CF4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235476D00()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_235476D0C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_235476D18()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_235476D24()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_235476D30()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_235476D3C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235476D48()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235476D54()
{
  return MEMORY[0x24BEE4328]();
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x24BDC0058](desc);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x24BDC00B0](theSourceBuffer, offsetToData, dataLength, destination);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00D8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

OSStatus CMSampleBufferCopyPCMDataIntoAudioBufferList(CMSampleBufferRef sbuf, int32_t frameOffset, int32_t numFrames, AudioBufferList *bufferList)
{
  return MEMORY[0x24BDC0268](sbuf, *(_QWORD *)&frameOffset, *(_QWORD *)&numFrames, bufferList);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02B8](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x24BDC0300](sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x24BDC0360]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

