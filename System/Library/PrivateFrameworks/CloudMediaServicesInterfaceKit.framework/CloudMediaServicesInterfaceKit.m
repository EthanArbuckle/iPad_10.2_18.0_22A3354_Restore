void sub_21DE4FC84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
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

void applyHeaderOverrides(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __applyHeaderOverrides_block_invoke;
  v5[3] = &unk_24E1CC7B8;
  v6 = v3;
  v4 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __applyHeaderOverrides_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _CMSILogingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __applyHeaderOverrides_block_invoke_cold_1();

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    headerStringFormat(v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v16 = v8;
    else
      v16 = &stru_24E1CDD40;
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v16, v5);
    goto LABEL_28;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (__CFString *)v6;
  v9 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v9)
    goto LABEL_28;
  v10 = v9;
  v11 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        _CMSILogingFacility();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __applyHeaderOverrides_block_invoke_cold_2();
        goto LABEL_27;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        _CMSILogingFacility();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __applyHeaderOverrides_block_invoke_cold_3();
LABEL_27:

        goto LABEL_28;
      }
      headerStringFormat(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);
      if (v14)
        objc_msgSend(v15, "addValue:forHTTPHeaderField:", v14, v5);
      else
        objc_msgSend(v15, "setValue:forHTTPHeaderField:", &stru_24E1CDD40, v5, (_QWORD)v18);

    }
    v10 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
      continue;
    break;
  }
LABEL_28:

LABEL_29:
}

__CFString *headerStringFormat(void *a1)
{
  id v1;
  __CFString *v2;
  id v3;
  CFTypeID TypeID;
  int v5;
  __CFString *v6;
  __CFString *v7;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (__CFString *)v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v1;
      TypeID = CFBooleanGetTypeID();
      if (CFGetTypeID(v3) == TypeID)
      {
        v5 = objc_msgSend(v3, "BOOLValue");
        v6 = CFSTR("false");
        if (v5)
          v6 = CFSTR("true");
        v7 = v6;
      }
      else
      {
        objc_msgSend(v3, "stringValue");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v2 = v7;

    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id cmsDateFormatter()
{
  if (cmsDateFormatter_onceToken != -1)
    dispatch_once(&cmsDateFormatter_onceToken, &__block_literal_global);
  return (id)cmsDateFormatter_formatter;
}

uint64_t __cmsDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)cmsDateFormatter_formatter;
  cmsDateFormatter_formatter = (uint64_t)v0;

  return objc_msgSend((id)cmsDateFormatter_formatter, "setFormatOptions:", 1907);
}

id cmsSafeDictionary(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id cmsDateCalender()
{
  if (cmsDateCalender_onceToken != -1)
    dispatch_once(&cmsDateCalender_onceToken, &__block_literal_global_481);
  return (id)cmsDateCalender_gregorian;
}

id _userInfoValueToJSONValue(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "absoluteString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v4 = v3;

    v2 = v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "UUIDString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = v1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cmsDateFormatter();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v1);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_9;
      v24 = (void *)MEMORY[0x24BDBCED8];
      v25 = v1;
      objc_msgSend(v24, "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = ___userInfoValueToJSONValue_block_invoke;
      v27[3] = &unk_24E1CC9B0;
      v28 = v26;
      v6 = v26;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v27);

      v8 = objc_msgSend(v6, "copy");
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v1;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          _userInfoValueToJSONValue(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

    v7 = objc_msgSend(v6, "copy");
LABEL_12:
    v8 = v7;

LABEL_13:
    v2 = (void *)v8;
    goto LABEL_9;
  }
  v9 = v1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        _userInfoValueToJSONValue(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v10, "copy");
  v2 = (void *)v17;
LABEL_9:

  return v2;
}

id _JSONValueToUserInfoValue(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    objc_msgSend(v2, "cmsOptionalStringForKey:", CFSTR("$typ"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("$val"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v4 || objc_msgSend(v2, "count") != 2)
      goto LABEL_38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("url")))
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_31:
        v13 = (id)v6;
        goto LABEL_37;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("uuid")))
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
        goto LABEL_31;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("date")))
      {
        cmsDateFormatter();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateFromString:", v5);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("data")))
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v5, 0);
        goto LABEL_31;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_38;
      v5 = v4;
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("set")))
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v27 = v5;
        v16 = v5;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v35;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v35 != v19)
                objc_enumerationMutation(v16);
              _JSONValueToUserInfoValue(*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v20));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v21);

              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v18);
        }

        v13 = (id)objc_msgSend(v15, "copy");
        v5 = v27;
LABEL_37:

        if (v13)
        {
LABEL_39:

          goto LABEL_40;
        }
LABEL_38:
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = ___JSONValueToUserInfoValue_block_invoke;
        v32[3] = &unk_24E1CC9B0;
        v33 = v23;
        v24 = v23;
        objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v32);
        v13 = (id)objc_msgSend(v24, "copy");

        goto LABEL_39;
      }
    }
    v13 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = v1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          _JSONValueToUserInfoValue(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v9);
    }

    v13 = (id)objc_msgSend(v2, "copy");
LABEL_40:

    if (v13)
      goto LABEL_41;
    goto LABEL_18;
  }
  v13 = v1;
  if (v13)
  {
LABEL_41:
    v14 = v13;
    goto LABEL_42;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
  v25 = v14;

  return v25;
}

uint64_t INIntentHandlingStatusFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ready")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("inProgress")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failure")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("deferredToApplication")) & 1) != 0)
  {
    v2 = 5;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("userConfirmationRequired")))
  {
    v2 = 6;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *INIntentHandlingStatusToString(unint64_t a1)
{
  if (a1 < 7)
    return off_24E1CCA10[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INInteractionDirectionFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("outgoing")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("incoming")) & 1) != 0)
  {
    v2 = 2;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unspecified"));
    v2 = 0;
  }

  return v2;
}

__CFString *INInteractionDirectionToString(unint64_t a1)
{
  if (a1 < 3)
    return off_24E1CCA48[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INRecurrenceFrequencyFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("minute")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("hourly")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("daily")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("weekly")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("monthly")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("yearly")) & 1) != 0)
  {
    v2 = 6;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 0;
  }

  return v2;
}

__CFString *INRecurrenceFrequencyToString(unint64_t a1)
{
  if (a1 < 7)
    return off_24E1CCA60[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INMediaItemTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("song")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("album")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("artist")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("genre")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("playlist")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("podcastShow")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("podcastEpisode")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("podcastPlaylist")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("musicStation")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("audioBook")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("movie")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tvShow")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tvShowEpisode")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("musicVideo")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("podcastStation")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("radioStation")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("station")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("music")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("algorithmicRadioStation")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("news")) & 1) != 0)
  {
    v2 = 20;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 0;
  }

  return v2;
}

__CFString *INMediaItemTypeToString(unint64_t a1)
{
  if (a1 < 0x15)
    return off_24E1CCA98[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INMediaReferenceFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("currentlyPlaying")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("my")) & 1) != 0)
  {
    v2 = 2;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 0;
  }

  return v2;
}

__CFString *INMediaReferenceToString(unint64_t a1)
{
  if (a1 < 3)
    return off_24E1CCB40[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INMediaSortOrderFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("newest")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("oldest")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("best")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("worst")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("popular")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("unpopular")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("trending")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("recommended")) & 1) != 0)
  {
    v2 = 8;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 0;
  }

  return v2;
}

__CFString *INMediaSortOrderToString(unint64_t a1)
{
  if (a1 < 9)
    return off_24E1CCB58[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INMediaDestinationTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("library")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("playlist")) & 1) != 0)
  {
    v2 = 2;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 0;
  }

  return v2;
}

__CFString *INMediaDestinationTypeToString(unint64_t a1)
{
  if (a1 < 3)
    return off_24E1CCBA0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INPlaybackRepeatModeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("all")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("one")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *INPlaybackRepeatModeToString(unint64_t a1)
{
  if (a1 < 4)
    return off_24E1CCBB8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INPlaybackQueueLocationFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("now")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("next")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("later")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 0;
  }

  return v2;
}

__CFString *INPlaybackQueueLocationToString(unint64_t a1)
{
  if (a1 < 4)
    return off_24E1CCBD8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INPlayMediaIntentResponseCodeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ready")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("continueInApp")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("inProgress")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("handleInApp")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failure")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failureRequiringAppLaunch")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failureUnknownMediaType")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failureNoUnplayedContent")) & 1) != 0)
  {
    v2 = 9;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("failureRestrictedContent")))
  {
    v2 = 10;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *INPlayMediaIntentResponseCodeToString(unint64_t a1)
{
  if (a1 < 0xC)
    return off_24E1CCBF8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INAddMediaIntentResponseCodeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ready")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("inProgress")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("handleInApp")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Failure")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FailureRequiringAppLaunch")) & 1) != 0)
  {
    v2 = 6;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unspecified"));
    v2 = 0;
  }

  return v2;
}

__CFString *INAddMediaIntentResponseCodeToString(unint64_t a1)
{
  if (a1 < 7)
    return off_24E1CCC58[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INMediaAffinityTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("like")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("dislike")) & 1) != 0)
  {
    v2 = 2;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 0;
  }

  return v2;
}

__CFString *INMediaAffinityTypeToString(unint64_t a1)
{
  if (a1 < 3)
    return off_24E1CCC90[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INUpdateMediaAffinityIntentResponseCodeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ready")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("inProgress")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failure")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failureRequiringAppLaunch")) & 1) != 0)
  {
    v2 = 5;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unspecified"));
    v2 = 0;
  }

  return v2;
}

__CFString *INUpdateMediaAffinityIntentResponseCodeToString(unint64_t a1)
{
  if (a1 < 6)
    return off_24E1CCCA8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t INAddMediaMediaDestinationUnsupportedReasonFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("playlistNameNotFound")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("playlistNotEditable")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

__CFString *INAddMediaMediaDestinationUnsupportedReasonToString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 2)
    return CFSTR("playlistNotEditable");
  if (a1 == 1)
  {
    v1 = CFSTR("playlistNameNotFound");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("##%ld##"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void __cmsDateCalender_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v2 = (void *)cmsDateCalender_gregorian;
  cmsDateCalender_gregorian = v1;

}

void ___userInfoValueToJSONValue_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  _userInfoValueToJSONValue(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, v5);

}

id CreateDataWithSerializedJSON(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 0, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _CMSILogingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      CreateDataWithSerializedJSON_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 13, 0);
      v4 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

void sub_21DE5BC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DE5C298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DE5C6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak((id *)(v12 - 120));
  _Unwind_Resume(a1);
}

BOOL _isValidMethod(void *a1)
{
  void *v1;
  _BOOL8 v2;

  CMSExtensionEndpointForProtocolMethodName(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

void sub_21DE5D8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DE5E8A0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_21DE61088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DE612AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id nwActivityFromUUID(void *a1)
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2[0] = 0;
    v2[1] = 0;
    objc_msgSend(a1, "getUUIDBytes:", v2);
    a1 = (void *)nw_activity_create_from_token();
  }
  return a1;
}

const __CFString *CMSActivityReportTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x12)
    return CFSTR("local.report.undefined");
  else
    return off_24E1CD108[a1 - 1];
}

const __CFString *CMSActivityTransitionTypeToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("undefined");
  else
    return off_24E1CD1A0[a1];
}

const __CFString *CMSCloudExtensionSpecVersion()
{
  return CFSTR("1.1.0");
}

id CMSCloudExtensionLanguageCode()
{
  if (CMSCloudExtensionLanguageCode_onceToken != -1)
    dispatch_once(&CMSCloudExtensionLanguageCode_onceToken, &__block_literal_global_1);
  return (id)CMSCloudExtensionLanguageCode_languageCode;
}

id CMSCreateCloudExtensionHTTPRequest(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;

  v7 = a2;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BDD16B0];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithURL:cachePolicy:timeoutInterval:", v10, a3, 6.0);

  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("AppleCloudExtension/1.1.0"), CFSTR("User-Agent"));
  if (v7)
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", v7, CFSTR("Authorization"));
  if (v8)
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", v8, CFSTR("x-com-apple-cloudextension-session"));

  return v11;
}

id CMSExtensionEndpointForProtocolMethodName(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = CMSExtensionEndpointForProtocolMethodName_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&CMSExtensionEndpointForProtocolMethodName_onceToken, &__block_literal_global_2);
  objc_msgSend((id)CMSExtensionEndpointForProtocolMethodName_methodNameToEndpointMapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CMSProtocolNameForExtensionEndpoint(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = CMSProtocolNameForExtensionEndpoint_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&CMSProtocolNameForExtensionEndpoint_onceToken, &__block_literal_global_38);
  objc_msgSend((id)CMSProtocolNameForExtensionEndpoint_nameMapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CMSPredictedMethodNameForElidingMethod(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = CMSPredictedMethodNameForElidingMethod_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&CMSPredictedMethodNameForElidingMethod_onceToken, &__block_literal_global_39);
  objc_msgSend((id)CMSPredictedMethodNameForElidingMethod_predictionDependencies, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _CMSILogingFacility()
{
  if (_CMSILogingFacility_onceToken != -1)
    dispatch_once(&_CMSILogingFacility_onceToken, &__block_literal_global_3);
  return (id)_CMSILogingFacility_oslog;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  size_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    return v4 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

void __applyHeaderOverrides_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21DE4E000, v0, v1, "Unexpected dictionary in header map: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __applyHeaderOverrides_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21DE4E000, v0, v1, "Unexpected dictionary in header value list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __applyHeaderOverrides_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21DE4E000, v0, v1, "Unexpected array in header value list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void CreateDataWithSerializedJSON_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21DE4E000, a1, a3, "%s can't convert object to JSON", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

OSStatus SecAsn1CoderCreate(SecAsn1CoderRef *coder)
{
  return MEMORY[0x24BDE87E0](coder);
}

OSStatus SecAsn1CoderRelease(SecAsn1CoderRef coder)
{
  return MEMORY[0x24BDE87E8](coder);
}

OSStatus SecAsn1Decode(SecAsn1CoderRef coder, const void *src, size_t len, const SecAsn1Template *templates, void *dest)
{
  return MEMORY[0x24BDE87F0](coder, src, len, templates, dest);
}

OSStatus SecAsn1EncodeItem(SecAsn1CoderRef coder, const void *src, const SecAsn1Template *templates, SecAsn1Item *dest)
{
  return MEMORY[0x24BDE8800](coder, src, templates, dest);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x24BDE0950]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x24BDE0960]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x24BDE0990]();
}

uint64_t nw_activity_create_from_token()
{
  return MEMORY[0x24BDE0998]();
}

uint64_t nw_activity_create_retry()
{
  return MEMORY[0x24BDE09B0]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x24BDE09C8]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x24BDE09E8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

