void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21A8661A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A866518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_21A866AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21A867070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21A867320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21A86787C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21A8688D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A868FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A8690C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_21A86927C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A869380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A869EC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_21A86B7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A86D054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A86EE64(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21A86F1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL AVTIsPersistentChangeOfInterest_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = a2;
  if (objc_msgSend(v2, "changeType") && objc_msgSend(v2, "changeType") != 2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    objc_msgSend(v2, "updatedProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = AVTIsPersistentChangeOfInterest_block_invoke_2;
    v6[3] = &unk_24DD32088;
    v6[4] = &v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

    v3 = *((_BYTE *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

void sub_21A86FA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVTIsPersistentChangeOfInterest_block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("orderDate");
  v10 = CFSTR("avatarData");
  v11 = CFSTR("identifier");
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", &v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "containsObject:", v8);
  if ((_DWORD)v6)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

uint64_t AVTAnyTransactionHasChangesFromAuthor_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "author", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v5) & 1) != 0)
        {
          objc_msgSend(v10, "changes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v7 = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
LABEL_12:

  return v7;
}

uint64_t AVTAnyTransactionHasChangesFromOtherThanAuthor_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "author", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v5))
        {

        }
        else
        {
          objc_msgSend(v10, "changes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v7 = 1;
            goto LABEL_13;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

uint64_t AVTAnyTransactionHasChangesFromOtherThanBundleID_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "bundleID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v5))
        {

        }
        else
        {
          objc_msgSend(v10, "changes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v7 = 1;
            goto LABEL_13;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

uint64_t AVTAnyTransactionHasAvatarChange_block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = a2;
  v18 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v3 = *(_QWORD *)v25;
    v19 = v2;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v3)
          objc_enumerationMutation(v2);
        v5 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v5, "changes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "changedObjectID");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "entity");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Avatar"));

              if ((v14 & 1) != 0)
              {

                v15 = 1;
                v2 = v19;
                goto LABEL_19;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v8)
              continue;
            break;
          }
        }

        v2 = v19;
        v3 = v17;
      }
      v15 = 0;
      v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

void sub_21A870544(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A8705C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A8706C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A870748(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _AVTUISetPropertyListObjectForInternalSettingsKey(void *a1, void *a2)
{
  const __CFString *v3;
  const __CFString *v4;
  __CFString *v5;
  id value;

  v3 = (const __CFString *)*MEMORY[0x24BDBD590];
  v4 = (const __CFString *)*MEMORY[0x24BDBD570];
  v5 = a2;
  value = a1;
  _CFPreferencesSetBackupDisabled();
  CFPreferencesSetValue(v5, value, CFSTR("com.apple.AvatarUI.Staryu"), v3, v4);

}

CFPropertyListRef _AVTUIPropertyListObjectForInternalSettingsKey(const __CFString *a1)
{
  return (id)CFPreferencesCopyValue(a1, CFSTR("com.apple.AvatarUI.Staryu"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

uint64_t _AVTUIBoolForInternalSettingKey(const __CFString *a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)CFPreferencesCopyValue(a1, CFSTR("com.apple.AvatarUI.Staryu"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v4 = v3;
  if (v3)
    a2 = objc_msgSend(v3, "BOOLValue");

  return a2;
}

void _AVTUISetBoolForInternalSettingsKey(uint64_t a1, void *a2, int a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if ((a1 & 1) != 0 || a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  _AVTUISetPropertyListObjectForInternalSettingsKey(v5, v6);

}

uint64_t _AVTUIIntegerForInternalSettingsKey(const __CFString *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _AVTUIPropertyListObjectForInternalSettingsKey(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

void _AVTUISetIntegerForInternalSettingsKey(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _AVTUISetPropertyListObjectForInternalSettingsKey(v5, v4);

}

void _AVTUIRemoveInternalSettingsKey(void *a1)
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, a1);
}

CFPropertyListRef _AVTUIPropertyListObjectForGlobalKey(const __CFString *a1)
{
  return (id)CFPreferencesCopyValue(a1, CFSTR(".GlobalPreferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

uint64_t _AVTUIIntegerForGlobalKey(const __CFString *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _AVTUIPropertyListObjectForGlobalKey(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

void _AVTUISetPropertyListObjectForGlobalKey(CFPropertyListRef value, CFStringRef key)
{
  CFPreferencesSetValue(key, value, CFSTR(".GlobalPreferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

void _AVTUISetIntegerForGlobalKey(uint64_t a1, void *a2)
{
  void *v3;
  __CFString *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetValue(v4, v5, CFSTR(".GlobalPreferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

void _AVTUIRemoveGlobalKey(const __CFString *a1)
{
  CFPreferencesSetValue(a1, 0, CFSTR(".GlobalPreferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

void AVTUIResetInternalSettings()
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIRestrictMaxAvatarCount"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIShowPerfHUD"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIThumbnailCaching"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIFlushThumbnailCache"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIRestrictMaxAvatarCount"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarShowTrackingLostReticle"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarAlwaysShowSplashScreen"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarAlwaysShowPaddleView"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarPreLoadOnLaunch"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAdaptativeFrameRate"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIEditorShowAssetsName"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesGroupDialUsesMasking"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesDisableDeleteConfirmation"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesDisablEditAfterDuplicate"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIShowAssetsWarning"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesMemojiClassicDisclosureWarning"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesStickersDisclosureWarning"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesStickersCaching"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesFlushStickersCache"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesShowPrereleaseStickerPack"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesShowPrereleaseStickerLabel"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesStickersHEICSSequence"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesStickerRecentsDisclosureWarning"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesAlwaysShowStickerRecentsSplashScreen"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesStickersDisclosureWarning"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTSyncEnabled"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIWipeCloudKitContainer"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIUseTestCloudKitContainer"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIWipeDatabase"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUISyncPreserveContentOnAccountChange"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUIWipeCloudKitContainer"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarUseLocalEditorModel"));
}

void AVTUIFlushCaches()
{
  _AVTUISetBoolForInternalSettingsKey(1, CFSTR("AVTAvatarUIFlushThumbnailCache"), 0);
  _AVTUISetBoolForInternalSettingsKey(1, CFSTR("AVTUIGlobalPreferencesFlushStickersCache"), 0);
}

void AVTUISetFlushThumbnailCache(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIFlushThumbnailCache"), 0);
}

void AVTUISetFlushStickersCache(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesFlushStickersCache"), 0);
}

void AVTUIResetFirstTimeExperience()
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarHasDisplayedSplashScreen"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarHasDisplayedPaddleView"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarHasDisplayedCameraEffectsSplashScreen"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTAvatarHasDisplayedAnimojiSplashScreen"));
  _AVTUISetPropertyListObjectForInternalSettingsKey(0, CFSTR("AVTUIGlobalPreferencesHasDisplayedCategoriesDiscoverability"));
  CFPreferencesSetValue(CFSTR("com.apple.Animoji.StickerRecents.SplashVersion"), 0, CFSTR(".GlobalPreferences"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  _AVTUISetBoolForInternalSettingsKey(1, CFSTR("AVTAvatarUIFlushThumbnailCache"), 0);
  _AVTUISetBoolForInternalSettingsKey(1, CFSTR("AVTUIGlobalPreferencesFlushStickersCache"), 0);
}

uint64_t AVTUIIsAvatarUIEnabled()
{
  return 1;
}

void AVTUISetShowAssetsWarning(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIShowAssetsWarning"), 0);
}

uint64_t AVTUIShowAssetsWarning()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIShowAssetsWarning"), 0);
}

void AVTUISetShowPerfHUD(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIShowPerfHUD"), 0);
}

uint64_t AVTUIShowPerfHUD()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIShowPerfHUD"), 0);
}

void AVTUISetEditorShowAssetsName(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIEditorShowAssetsName"), 0);
}

uint64_t AVTUIEditorShowAssetsName()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIEditorShowAssetsName"), 0);
}

uint64_t AVTUILastCacheVersion()
{
  return _AVTUIIntegerForInternalSettingsKey(CFSTR("AVTAvatarUILastCacheVersion"));
}

void AVTUISetLastCacheVersion(uint64_t a1)
{
  _AVTUISetIntegerForInternalSettingsKey(a1, CFSTR("AVTAvatarUILastCacheVersion"));
}

uint64_t AVTUIThumbnailCaching()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIThumbnailCaching"), 1);
}

void AVTUISetThumbnailCaching(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIThumbnailCaching"), 1);
}

uint64_t AVTUIFlushThumbnailCache()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIFlushThumbnailCache"), 0);
}

void AVTUISetShowTrackingLostReticle(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarShowTrackingLostReticle"), 0);
}

uint64_t AVTUIShowTrackingLostReticle()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarShowTrackingLostReticle"), 0);
}

void AVTUISetHasDisplayedSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarHasDisplayedSplashScreen"), 0);
}

uint64_t AVTUIHasDisplayedSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedSplashScreen"), 0);
}

void AVTUISetHasDisplayedCameraDisclosureSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarHasDisplayedCameraDisclosureSplashScreen"), 0);
}

uint64_t AVTUIHasDisplayedCameraDisclosureSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedCameraDisclosureSplashScreen"), 0);
}

void AVTUISetHasDisplayedPaddleView(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarHasDisplayedPaddleView"), 0);
}

uint64_t AVTUIHasDisplayedPaddleView()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedPaddleView"), 0);
}

void AVTUISetAlwaysShowPaddleView(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarAlwaysShowPaddleView"), 0);
}

uint64_t AVTUIAlwaysShowPaddleView()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarAlwaysShowPaddleView"), 0);
}

void AVTUISetHasDisplayedAnimojiSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarHasDisplayedAnimojiSplashScreen"), 0);
}

uint64_t AVTUIHasDisplayedAnimojiSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedAnimojiSplashScreen"), 0);
}

void AVTUISetHasDisplayedAnimojiCameraDisclosureSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarHasDisplayedAnimojiCameraDisclosureSplashScreen"), 0);
}

uint64_t AVTUIHasDisplayedAnimojiCameraDisclosureSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedAnimojiCameraDisclosureSplashScreen"), 0);
}

void AVTUISetHasDisplayedCameraEffectsSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarHasDisplayedCameraEffectsSplashScreen"), 0);
}

uint64_t AVTUIHasDisplayedCameraEffectsSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedCameraEffectsSplashScreen"), 0);
}

void AVTUISetHasDisplayedCameraEffectsCameraDisclosureSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarHasDisplayedCameraEffectsCameraDisclosureSplashScreen"), 0);
}

uint64_t AVTUIHasDisplayedCameraEffectsCameraDisclosureSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedCameraEffectsCameraDisclosureSplashScreen"), 0);
}

void AVTUISetAlwaysShowSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarAlwaysShowSplashScreen"), 0);
}

uint64_t AVTUIAlwaysShowSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarAlwaysShowSplashScreen"), 0);
}

uint64_t AVTUIForceCameraDisclosures()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarForceCameraDisclosures"), 0);
}

void AVTUISetForceCameraDisclosures(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarForceCameraDisclosures"), 0);
}

void AVTUISetHasDisplayedCategoriesDiscoverability(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesHasDisplayedCategoriesDiscoverability"), 0);
}

uint64_t AVTUIHasDisplayedCategoriesDiscoverability()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesHasDisplayedCategoriesDiscoverability"), 0);
}

void AVTUISetDisableDeleteConfirmation(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesDisableDeleteConfirmation"), 0);
}

uint64_t AVTUIDisableDeleteConfirmation()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesDisableDeleteConfirmation"), 0);
}

void AVTUISetDisableEditAfterDuplicate(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesDisablEditAfterDuplicate"), 0);
}

uint64_t AVTUIDisableEditAfterDuplicate()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesDisablEditAfterDuplicate"), 0);
}

void AVTUISetGroupDialUsesMasking(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesGroupDialUsesMasking"), 1);
}

uint64_t AVTUIGroupDialUsesMasking()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesGroupDialUsesMasking"), 1);
}

uint64_t AVTUIAvatarPreLoadOnLaunch()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarPreLoadOnLaunch"), 0);
}

void AVTUISetAvatarPreLoadOnLaunch(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarPreLoadOnLaunch"), 0);
}

void AVTUISetAdaptativeFrameRate(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAdaptativeFrameRate"), 0);
}

uint64_t AVTUIAdaptativeFrameRate()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAdaptativeFrameRate"), 0);
}

void AVTUISetWipeCloudKitContainer(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIWipeCloudKitContainer"), 0);
}

uint64_t AVTUIWipeCloudKitContainer()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIWipeCloudKitContainer"), 0);
}

void AVTUISetUseTestCloudKitContainer(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIUseTestCloudKitContainer"), 0);
}

uint64_t AVTUIUseTestCloudKitContainer()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIUseTestCloudKitContainer"), 0);
}

void AVTUISetWipeLocalDatabase(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUIWipeDatabase"), 0);
}

uint64_t AVTUIWipeLocalDatabase()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIWipeDatabase"), 0);
}

void AVTUISetAvatarSyncEnabled(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTSyncEnabled"), 1);
}

uint64_t AVTUIIsAvatarSyncEnabled()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTSyncEnabled"), 1);
}

void AVTUISetUseLocalEditorModel(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTAvatarUseLocalEditorModel"), 0);
}

uint64_t AVTUIUseLocalEditorModel()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUseLocalEditorModel"), 0);
}

void AVTUISetPreserveContentOnAccountChange(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUISyncPreserveContentOnAccountChange"), 0);
}

uint64_t AVTUIPreserveContentOnAccountChange()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUISyncPreserveContentOnAccountChange"), 0);
}

void AVTUISetRestrictMaximumAvatarCount(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIRestrictMaxAvatarCount"), 0);
}

uint64_t AVTUIRestrictMaximumAvatarCount()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIRestrictMaxAvatarCount"), 0);
}

uint64_t AVTUIIsAvatarUIEnabled_once()
{
  if (AVTUIIsAvatarUIEnabled_once_onceToken != -1)
    dispatch_once(&AVTUIIsAvatarUIEnabled_once_onceToken, &__block_literal_global_5);
  return AVTUIIsAvatarUIEnabled_once_enabled;
}

uint64_t AVTUIShowAssetsWarning_once()
{
  if (AVTUIShowAssetsWarning_once_onceToken != -1)
    dispatch_once(&AVTUIShowAssetsWarning_once_onceToken, &__block_literal_global_98);
  return AVTUIShowAssetsWarning_once_enabled;
}

uint64_t AVTUIShowPerfHUD_once()
{
  if (AVTUIShowPerfHUD_once_onceToken != -1)
    dispatch_once(&AVTUIShowPerfHUD_once_onceToken, &__block_literal_global_99);
  return AVTUIShowPerfHUD_once_enabled;
}

uint64_t AVTUIEditorShowAssetsName_once()
{
  if (AVTUIEditorShowAssetsName_once_onceToken != -1)
    dispatch_once(&AVTUIEditorShowAssetsName_once_onceToken, &__block_literal_global_100);
  return AVTUIEditorShowAssetsName_once_enabled;
}

uint64_t AVTUIThumbnailCaching_once()
{
  if (AVTUIThumbnailCaching_once_onceToken != -1)
    dispatch_once(&AVTUIThumbnailCaching_once_onceToken, &__block_literal_global_101);
  return AVTUIThumbnailCaching_once_enabled;
}

uint64_t AVTUIFlushThumbnailCache_once()
{
  if (AVTUIFlushThumbnailCache_once_onceToken != -1)
    dispatch_once(&AVTUIFlushThumbnailCache_once_onceToken, &__block_literal_global_102);
  return AVTUIFlushThumbnailCache_once_enabled;
}

uint64_t AVTUIShowTrackingLostReticle_once()
{
  if (AVTUIShowTrackingLostReticle_once_onceToken != -1)
    dispatch_once(&AVTUIShowTrackingLostReticle_once_onceToken, &__block_literal_global_103);
  return AVTUIShowTrackingLostReticle_once_enabled;
}

uint64_t AVTUIAlwaysShowSplashScreen_once()
{
  if (AVTUIAlwaysShowSplashScreen_once_onceToken != -1)
    dispatch_once(&AVTUIAlwaysShowSplashScreen_once_onceToken, &__block_literal_global_104);
  return AVTUIAlwaysShowSplashScreen_once_enabled;
}

uint64_t AVTUIForceCameraDisclosures_once()
{
  if (AVTUIForceCameraDisclosures_once_onceToken != -1)
    dispatch_once(&AVTUIForceCameraDisclosures_once_onceToken, &__block_literal_global_105);
  return AVTUIForceCameraDisclosures_once_enabled;
}

uint64_t AVTUIDisableDeleteConfirmation_once()
{
  if (AVTUIDisableDeleteConfirmation_once_onceToken != -1)
    dispatch_once(&AVTUIDisableDeleteConfirmation_once_onceToken, &__block_literal_global_106);
  return AVTUIDisableDeleteConfirmation_once_enabled;
}

uint64_t AVTUIDisableEditAfterDuplicate_once()
{
  if (AVTUIDisableEditAfterDuplicate_once_onceToken != -1)
    dispatch_once(&AVTUIDisableEditAfterDuplicate_once_onceToken, &__block_literal_global_107);
  return AVTUIDisableEditAfterDuplicate_once_enabled;
}

uint64_t AVTUIGroupDialUsesMasking_once()
{
  if (AVTUIGroupDialUsesMasking_once_onceToken != -1)
    dispatch_once(&AVTUIGroupDialUsesMasking_once_onceToken, &__block_literal_global_108);
  return AVTUIGroupDialUsesMasking_once_enabled;
}

uint64_t AVTUIRestrictMaximumAvatarCount_once()
{
  if (AVTUIRestrictMaximumAvatarCount_once_onceToken != -1)
    dispatch_once(&AVTUIRestrictMaximumAvatarCount_once_onceToken, &__block_literal_global_109);
  return AVTUIRestrictMaximumAvatarCount_once_enabled;
}

uint64_t AVTUIAlwaysShowPaddleView_once()
{
  if (AVTUIAlwaysShowPaddleView_once_onceToken != -1)
    dispatch_once(&AVTUIAlwaysShowPaddleView_once_onceToken, &__block_literal_global_110);
  return AVTUIAlwaysShowPaddleView_once_enabled;
}

uint64_t AVTUIHasDisplayedSplashScreen_once()
{
  if (AVTUIHasDisplayedSplashScreen_once_onceToken != -1)
    dispatch_once(&AVTUIHasDisplayedSplashScreen_once_onceToken, &__block_literal_global_111);
  return AVTUIHasDisplayedSplashScreen_once_enabled;
}

uint64_t AVTUIHasDisplayedAnimojiSplashScreen_once()
{
  if (AVTUIHasDisplayedAnimojiSplashScreen_once_onceToken != -1)
    dispatch_once(&AVTUIHasDisplayedAnimojiSplashScreen_once_onceToken, &__block_literal_global_112);
  return AVTUIHasDisplayedAnimojiSplashScreen_once_enabled;
}

uint64_t AVTUIHasDisplayedCameraEffectsSplashScreen_once()
{
  if (AVTUIHasDisplayedCameraEffectsSplashScreen_once_onceToken != -1)
    dispatch_once(&AVTUIHasDisplayedCameraEffectsSplashScreen_once_onceToken, &__block_literal_global_113);
  return AVTUIHasDisplayedCameraEffectsSplashScreen_once_enabled;
}

uint64_t AVTUIAlwaysShowRecentStickersSplashScreen_once()
{
  if (AVTUIAlwaysShowRecentStickersSplashScreen_once_onceToken != -1)
    dispatch_once(&AVTUIAlwaysShowRecentStickersSplashScreen_once_onceToken, &__block_literal_global_114);
  return AVTUIAlwaysShowRecentStickersSplashScreen_once_enabled;
}

uint64_t AVTUIAlwaysShowRecentStickersSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesAlwaysShowStickerRecentsSplashScreen"), 0);
}

uint64_t AVTUIForceNoMemojiRecentStickersSplashScreen_once()
{
  if (AVTUIForceNoMemojiRecentStickersSplashScreen_once_onceToken != -1)
    dispatch_once(&AVTUIForceNoMemojiRecentStickersSplashScreen_once_onceToken, &__block_literal_global_115);
  return AVTUIForceNoMemojiRecentStickersSplashScreen_once_enabled;
}

uint64_t AVTUIForceNoMemojiRecentStickersSplashScreen()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesForceNoMemojiStickerRecentsSplashScreen"), 0);
}

uint64_t AVTUIStickerRecentsMigrationVersion_once()
{
  if (AVTUIStickerRecentsMigrationVersion_once_onceToken != -1)
    dispatch_once(&AVTUIStickerRecentsMigrationVersion_once_onceToken, &__block_literal_global_116);
  return AVTUIStickerRecentsMigrationVersion_once_value;
}

uint64_t AVTUIStickerRecentsMigrationVersion()
{
  void *v0;
  uint64_t v1;

  _AVTUIPropertyListObjectForInternalSettingsKey(CFSTR("AVTUIGlobalPreferencesStickerRecentsMigrationVersion"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerValue");

  return v1;
}

uint64_t AVTUIHasDisplayedPaddleView_once()
{
  if (AVTUIHasDisplayedPaddleView_once_onceToken != -1)
    dispatch_once(&AVTUIHasDisplayedPaddleView_once_onceToken, &__block_literal_global_117);
  return AVTUIHasDisplayedPaddleView_once_enabled;
}

uint64_t AVTUIMemojiClassicShowDisclosureWarning_once()
{
  if (AVTUIMemojiClassicShowDisclosureWarning_once_onceToken != -1)
    dispatch_once(&AVTUIMemojiClassicShowDisclosureWarning_once_onceToken, &__block_literal_global_118);
  return AVTUIMemojiClassicShowDisclosureWarning_once_enabled;
}

uint64_t AVTUIMemojiClassicShowDisclosureWarning()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesMemojiClassicDisclosureWarning"), 0);
}

uint64_t AVTUIStickersShowDisclosureWarning_once()
{
  if (AVTUIStickersShowDisclosureWarning_once_onceToken != -1)
    dispatch_once(&AVTUIStickersShowDisclosureWarning_once_onceToken, &__block_literal_global_119);
  return AVTUIStickersShowDisclosureWarning_once_enabled;
}

uint64_t AVTUIStickersShowDisclosureWarning()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesStickersDisclosureWarning"), 0);
}

uint64_t AVTUIStickerRecentsShowDisclosureWarning_once()
{
  if (AVTUIStickerRecentsShowDisclosureWarning_once_onceToken != -1)
    dispatch_once(&AVTUIStickerRecentsShowDisclosureWarning_once_onceToken, &__block_literal_global_120);
  return AVTUIStickerRecentsShowDisclosureWarning_once_enabled;
}

uint64_t AVTUIStickerRecentsShowDisclosureWarning()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesStickerRecentsDisclosureWarning"), 0);
}

uint64_t AVTUIShowPrereleaseStickerPack_once()
{
  if (AVTUIShowPrereleaseStickerPack_once_onceToken != -1)
    dispatch_once(&AVTUIShowPrereleaseStickerPack_once_onceToken, &__block_literal_global_121);
  return AVTUIShowPrereleaseStickerPack_once_enabled;
}

uint64_t AVTUIShowPrereleaseStickerPack()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesShowPrereleaseStickerPack"), 0);
}

uint64_t AVTUIShowPrereleaseStickerLabel_once()
{
  if (AVTUIShowPrereleaseStickerLabel_once_onceToken != -1)
    dispatch_once(&AVTUIShowPrereleaseStickerLabel_once_onceToken, &__block_literal_global_122);
  return AVTUIShowPrereleaseStickerLabel_once_enabled;
}

uint64_t AVTUIShowPrereleaseStickerLabel()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesShowPrereleaseStickerLabel"), 0);
}

uint64_t AVTUIUseLocalEditorModel_once()
{
  if (AVTUIUseLocalEditorModel_once_onceToken != -1)
    dispatch_once(&AVTUIUseLocalEditorModel_once_onceToken, &__block_literal_global_123);
  return AVTUIUseLocalEditorModel_once_enabled;
}

CFPropertyListRef AVTUIEditorMostRecentGroupName()
{
  return _AVTUIPropertyListObjectForInternalSettingsKey(CFSTR("AVTUIEditorGroupName"));
}

void AVTUIEditorSetMostRecentGroupName(void *a1)
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(a1, CFSTR("AVTUIEditorGroupName"));
}

void AVTUISyncSetSuccessfulImportDate(void *a1)
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(a1, CFSTR("AVTSyncImportDate"));
}

CFPropertyListRef AVTUISyncSuccessfulImportDate()
{
  return _AVTUIPropertyListObjectForInternalSettingsKey(CFSTR("AVTSyncImportDate"));
}

void AVTUISyncSetExportRequired(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUISyncExportRequired"), 0);
}

uint64_t AVTUISyncExportRequired()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUISyncExportRequired"), 0);
}

void AVTUISetStickersLastSelected(void *a1)
{
  _AVTUISetPropertyListObjectForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesStickersLastSelected"));
}

CFPropertyListRef AVTUIStickersLastSelected()
{
  return _AVTUIPropertyListObjectForInternalSettingsKey(CFSTR("AVTUIGlobalPreferencesStickersLastSelected"));
}

void AVTUISetMemojiClassicShowDisclosureWarning(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesMemojiClassicDisclosureWarning"), 0);
}

void AVTUISetStickersShowDisclosureWarning(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesStickersDisclosureWarning"), 0);
}

void AVTUISetStickerRecentsShowDisclosureWarning(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesStickerRecentsDisclosureWarning"), 0);
}

uint64_t AVTUIStickersCaching()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesStickersCaching"), 1);
}

void AVTUISetStickersCaching(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesStickersCaching"), 1);
}

uint64_t AVTUIFlushStickersCache()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesFlushStickersCache"), 0);
}

void AVTUISetShowPrereleaseStickerPack(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesShowPrereleaseStickerPack"), 0);
}

void AVTUISetShowPrereleaseStickerLabel(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesShowPrereleaseStickerLabel"), 0);
}

uint64_t AVTUIStickersUseHEICSSequence()
{
  return _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesStickersHEICSSequence"), 0);
}

void AVTUISetStickersUseHEICSSequence(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesStickersHEICSSequence"), 1);
}

BOOL AVTUIHasShownStickerRecentsSplashView()
{
  return _AVTUIIntegerForGlobalKey(CFSTR("com.apple.Animoji.StickerRecents.SplashVersion")) > 0;
}

void AVTUISetHasShownStickerRecentsSplashView(unsigned int a1)
{
  _AVTUISetIntegerForGlobalKey(a1, CFSTR("com.apple.Animoji.StickerRecents.SplashVersion"));
}

void AVTUISetAlwaysShowRecentStickersSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesAlwaysShowStickerRecentsSplashScreen"), 0);
}

void AVTUISetForceNoMemojiRecentStickersSplashScreen(uint64_t a1)
{
  _AVTUISetBoolForInternalSettingsKey(a1, CFSTR("AVTUIGlobalPreferencesForceNoMemojiStickerRecentsSplashScreen"), 0);
}

void AVTUISetStickerRecentsMigrationVersion(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  _AVTUISetPropertyListObjectForInternalSettingsKey(v1, CFSTR("AVTUIGlobalPreferencesStickerRecentsMigrationVersion"));

}

void sub_21A872C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x22074B1E8](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_21A872F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A8732A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AVTAvatarRecordChangeEqualToChange(void *a1, void *a2)
{
  void *v2;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  _BOOL8 v11;

  v4 = a1;
  v5 = a2;
  objc_msgSend(v4, "recordIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "recordIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      goto LABEL_5;
  }
  objc_msgSend(v4, "recordIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (!v6)
  {

    if ((v9 & 1) != 0)
      goto LABEL_5;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }

  if (!v9)
    goto LABEL_7;
LABEL_5:
  v10 = objc_msgSend(v4, "changeType");
  v11 = v10 == objc_msgSend(v5, "changeType");
LABEL_8:

  return v11;
}

uint64_t AVTAvatarRecordChangeHash(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v1 = a1;
  objc_msgSend(v1, "recordIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  objc_msgSend(v1, "recordIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v5 + 1) = v3;
  *(_QWORD *)&v5 = objc_msgSend(v4, "hash");
  v6 = objc_msgSend(v1, "changeType");

  return (v5 >> 32) ^ v6;
}

void sub_21A8766FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_21A876C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21A8776C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21A877BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21A878068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id AVTDefaultFileProtectionType()
{
  return (id)*MEMORY[0x24BDD0CE0];
}

uint64_t AVTDefaultFileProtectionDataWritingOptions()
{
  return 0x40000000;
}

uint64_t AVTIsRunningAsSetupUser()
{
  return 0;
}

uint64_t _RecentStickersChangedExternally(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_recentStickersChangedExternally");
}

void sub_21A878A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_21A87BD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_21A87C5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21A87CF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_21A87DD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_21A87E650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21A87ECE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21A87FA3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_21A87FB68(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_21A889B4C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

uint64_t AVTAvatarKitSnapshotVersionNumber()
{
  return MEMORY[0x24BE0B3C0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x24BDBC8C8](url, key, propertyValue, error);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return MEMORY[0x24BDBD058]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

