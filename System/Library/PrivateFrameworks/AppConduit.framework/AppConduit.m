void sub_1D4D23364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D23940(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  id v28;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
    v19 = objc_msgSend(v17, "mutableCopy");
  else
    v19 = objc_opt_new();
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v18, a8);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D50]);
    if (v16)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_13;
      v27 = v21;
      v28 = v16;
      v26 = a2;
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_13;
      v26 = a2;
      v27 = v21;
    }
    MOLogWrite();
LABEL_13:

  }
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1, v26, v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("FunctionName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("SourceFileLine"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, a4, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t ACXBooleanValue(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a2 = objc_msgSend(v3, "BOOLValue");

  return a2;
}

id _ACXValidateObject(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

void sub_1D4D276E0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

void _FetchLocalizedKeys(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t Unique;
  __CFBundle *v9;
  void *FilteredInfoPlist;
  void *v11;
  void *v12;
  const __CFArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t FilteredLocalizedInfoPlist;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v24 = v5;
  Unique = _CFBundleCreateUnique();
  if (Unique)
  {
    v9 = (__CFBundle *)Unique;
    FilteredInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist();
    if (FilteredInfoPlist)
    {
      v11 = FilteredInfoPlist;
      _RemoveUnfilteredKeys(FilteredInfoPlist, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      _MergeLocalizedKeysForLocale(v6, v12, &stru_1E9884358);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = CFBundleCopyBundleLocalizations(v9);
      v14 = -[__CFArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            FilteredLocalizedInfoPlist = _CFBundleCreateFilteredLocalizedInfoPlist();
            if (FilteredLocalizedInfoPlist)
            {
              v20 = (void *)FilteredLocalizedInfoPlist;

              _RemoveUnfilteredKeys(v20, v7);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              _MergeLocalizedKeysForLocale(v6, v12, v18);
            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              objc_msgSend(v24, "path", v21);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();

            }
          }
          v15 = -[__CFArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v15);
      }

    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v24, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
      v12 = 0;
    }
    CFRelease(v9);

  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v5, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
}

id _RemoveUnfilteredKeys(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

void _MergeLocalizedKeysForLocale(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a1;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___MergeLocalizedKeysForLocale_block_invoke;
  v9[3] = &unk_1E98832C0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void sub_1D4D2A40C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4D2A5A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ACXShowUserNoticeWithTapToRadarButton(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __ACXShowUserNoticeWithTapToRadarButton_block_invoke;
  v15[3] = &unk_1E9883310;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  ACXAsyncTransaction(MEMORY[0x1E0C80D38], v15);

}

void ACXAsyncTransaction(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = a1;
  v5 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __ACXAsyncTransaction_block_invoke;
  v8[3] = &unk_1E9883360;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  v7 = v3;
  dispatch_async(v4, v8);

}

id ACXStringifyObject(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v1);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t ACXArrayContainsOnlyClass(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

id ACXArrayifyThing(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;

  v1 = a1;
  if (!v1)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (ACXArrayContainsOnlyClass(v1))
    {
      v2 = v1;
LABEL_7:
      v3 = v2;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v1, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (ACXArrayContainsOnlyClass(v4))
    v3 = v4;
  else
    v3 = 0;

LABEL_12:
  return v3;
}

BOOL ACXDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __ACXDictionaryContainsOnlyClasses_block_invoke;
    v9[3] = &unk_1E9883338;
    v9[4] = &v10;
    v9[5] = a2;
    v9[6] = a3;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1D4D2AEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ACXGetPOSIXError(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  v2 = *MEMORY[0x1E0CB2FE0];
  v3 = *MEMORY[0x1E0CB3388];
  v4 = v1;
  do
  {
    if (!v4)
      break;
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v2);

    if ((v6 & 1) != 0)
      break;
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  while (v8);

  return v4;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  objc_class *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a3;
  if (v13)
  {
    v16 = objc_msgSend([v14 alloc], "initWithFormat:arguments:", v13, &a9);
  }
  else
  {
    -[objc_class stringWithUTF8String:](v14, "stringWithUTF8String:", strerror(a4));
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1, &a9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = *MEMORY[0x1E0CB2D50];
  v23[1] = CFSTR("FunctionName");
  v24[0] = v17;
  v24[1] = v18;
  v23[2] = CFSTR("SourceFileLine");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", a3, a4, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t ACXCopyStagingDirectoryPath()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/tmp/com.apple.AppConduit.staging"), 1);
}

id ACXCopyStagingDirectory(_QWORD *a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/tmp/com.apple.AppConduit.staging"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v8);
  v5 = v8;

  if ((v4 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v2, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v2 = 0;
    if (a1)
      *a1 = objc_retainAutorelease(v5);
  }

  return v2;
}

id ACXCopyLogDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Logs/AppConduit"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v8);
  v6 = v8;

  if ((v5 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();

  return v3;
}

void ACXInitializeDiskLogging()
{
  void *v0;
  id v1;
  id v2;

  ACXCopyLogDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppConduit.log"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  gLogHandle = MOLogOpen();
  if (!gLogHandle)
    syslog(3, "Failed to set up rotating logs at path %s", (const char *)objc_msgSend(objc_retainAutorelease(v0), "fileSystemRepresentation"));
  if (ACXIsInternalBuild_onceToken != -1)
    dispatch_once(&ACXIsInternalBuild_onceToken, &__block_literal_global_0);
  v1 = objc_retainAutorelease(v0);
  objc_msgSend(v1, "fileSystemRepresentation");
  MOLogEnableDiskLogging();

}

uint64_t ACXIsInternalBuild()
{
  if (ACXIsInternalBuild_onceToken != -1)
    dispatch_once(&ACXIsInternalBuild_onceToken, &__block_literal_global_0);
  return ACXIsInternalBuild_result;
}

id ACXCopyDataDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppConduit"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ACXCopyPairingStoreSubdirectoryInBase(void *a1)
{
  void *v1;
  void *v2;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  id v9;

  if (!a1)
    return 0;
  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppConduit"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v1, 0, 0, &v9);
  v4 = v9;

  if ((v3 & 1) == 0)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 516)
        goto LABEL_11;
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v1, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
LABEL_11:

  return v1;
}

id ACXRandomDirWithTemplateURL(void *a1, _QWORD *a2)
{
  char *v3;
  void *v4;
  id v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = strdup((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
  if (mkdtemp(v3))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v3, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  else
  {
    v6 = __error();
    v10 = *v6;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      strerror(*v6);
      MOLogWrite();
    }
    _CreateError((uint64_t)"ACXRandomDirWithTemplateURL", 374, (void *)*MEMORY[0x1E0CB2FE0], v10, CFSTR("mkdtemp failed for %s"), v7, v8, v9, (uint64_t)v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (a2)
    {
      v5 = objc_retainAutorelease(v11);
      v4 = 0;
      *a2 = v5;
    }
    else
    {
      v4 = 0;
    }
  }
  free(v3);

  return v4;
}

id ACXLoadInfoPlist(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFBundle *Unique;
  __CFBundle *v6;
  uint64_t FilteredInfoPlist;
  const void *v8;
  CFTypeID TypeID;
  void *v10;
  void *v11;
  const void *FilteredLocalizedInfoPlist;
  CFTypeID v13;
  CFDictionaryRef InfoDictionary;
  void *v15;
  CFTypeID v16;
  CFStringRef v17;
  CFTypeID v19;
  CFStringRef v20;

  v3 = a1;
  v4 = a2;
  pthread_mutex_lock(&ACXLoadInfoPlist_cfBundleIsNotThreadSafe);
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    v6 = Unique;
    if (v4)
    {
      FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
      if (FilteredInfoPlist)
      {
        v8 = (const void *)FilteredInfoPlist;
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v8))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v8);
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localeIdentifier");
          FilteredLocalizedInfoPlist = (const void *)_CFBundleCreateFilteredLocalizedInfoPlist();

          if (FilteredLocalizedInfoPlist)
          {
            v13 = CFDictionaryGetTypeID();
            if (v13 == CFGetTypeID(FilteredLocalizedInfoPlist))
            {
              objc_msgSend(v10, "addEntriesFromDictionary:", FilteredLocalizedInfoPlist);
            }
            else
            {
              v19 = CFGetTypeID(FilteredLocalizedInfoPlist);
              v20 = CFCopyTypeIDDescription(v19);
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                MOLogWrite();
              if (v20)
                CFRelease(v20);
            }
            CFRelease(FilteredLocalizedInfoPlist);
          }
          else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            MOLogWrite();
          }
          goto LABEL_28;
        }
        v16 = CFGetTypeID(v8);
        v17 = CFCopyTypeIDDescription(v16);
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          MOLogWrite();
        if (v17)
          CFRelease(v17);
        CFRelease(v8);
LABEL_27:
        v10 = 0;
LABEL_28:
        CFRelease(v6);
        goto LABEL_29;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_27;
    }
    else
    {
      InfoDictionary = CFBundleGetInfoDictionary(Unique);
      if (InfoDictionary)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", InfoDictionary);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v15;
        if (v15)
          objc_msgSend(v15, "removeObjectForKey:", CFSTR("CFBundleInfoPlistURL"));
        goto LABEL_28;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_27;
    }
    MOLogWrite();
    goto LABEL_27;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v10 = 0;
LABEL_29:
  pthread_mutex_unlock(&ACXLoadInfoPlist_cfBundleIsNotThreadSafe);

  return v10;
}

uint64_t ACXYOrN(int a1)
{
  if (a1)
    return 89;
  else
    return 78;
}

void ACXUntrustedAppTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorUntrustedAppTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorUntrustedAppMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@ %@"), &v12, v5, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

id _LocalizedStringForSystemLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFArrayRef v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppConduit.framework"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v1;
  v6 = v2;
  v7 = v4;
  v19 = v3;
  if (!objc_msgSend(v5, "length") || !objc_msgSend(CFSTR("Localizable"), "length") || !objc_msgSend(v7, "length"))
  {
    v13 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
LABEL_9:
    v12 = 0;
LABEL_10:
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E9884358, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v6, "localizations");
  v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v10 = CFBundleCopyLocalizationsForPreferences(v8, v9);
  if (!-[__CFArray count](v10, "count"))
  {
    v13 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  -[__CFArray objectAtIndex:](v10, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_10;
LABEL_11:

  v15 = v14;
  if (!v14)
  {
    if (!gLogHandle || (v15 = v5, *(int *)(gLogHandle + 44) >= 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fileExistsAtPath:", CFSTR("/System/Library/PrivateFrameworks/AppConduit.framework"));
      MOLogWrite();

      v15 = v5;
    }
  }
  v17 = v15;

  return v17;
}

void ACXLowDiskSpaceTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorCannotDownloadTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorCannotDownloadMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

_QWORD *ACXInstallationUnavailableTitleAndMessage(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorInstallationUnavailableTitle"));
    result = (id)objc_claimAutoreleasedReturnValue();
    *v3 = result;
  }
  if (a2)
  {
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorInstallationUnavailableMessage"));
    result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }
  return result;
}

void ACXCapabilitiesMismatchTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorApplicationNotCompatibleTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorApplicationNotCompatibleMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

void ACXAppNotAllowedTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorApplicationNotAllowedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorApplicationNotAllowedMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

void ACXRuntimeNotSupportedTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorApplicationRuntimeNotSupportedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorApplicationRuntimeNotSupportedMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

void ACXArchitectureNotSupportedTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorArchitectureNotSupportedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorArchitectureNotSupportedMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

void ACXDeviceNotReachableDuringInstallTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = a1;
  if (!a2)
    goto LABEL_4;
  _LocalizedStringForSystemLanguage(CFSTR("ACXCannotInstallGenericTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v10, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    *a2 = v9;

LABEL_4:
    _ACXDeviceNotReachableMessage(a3);
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    ACXUntrustedAppTitleAndMessage_cold_1();

LABEL_8:
}

void _ACXDeviceNotReachableMessage(_QWORD *a1)
{
  int v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v2 = MGGetBoolAnswer();
    v3 = CFSTR("WIFI");
    if (v2)
      v3 = CFSTR("WLAN");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_ACXDeviceNotReachableMessage"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _LocalizedStringForSystemLanguage(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    *a1 = v6;

  }
}

void ACXDeviceNotReachableDuringUninstallTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = a1;
  if (!a2)
    goto LABEL_4;
  _LocalizedStringForSystemLanguage(CFSTR("ACXCannotUninstallGenericTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v10, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    *a2 = v9;

LABEL_4:
    _ACXDeviceNotReachableMessage(a3);
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    ACXUntrustedAppTitleAndMessage_cold_1();

LABEL_8:
}

void ACXDeviceNotReachableGenericTitleAndMessage(_QWORD *a1, _QWORD *a2)
{
  if (a1)
  {
    _LocalizedStringForSystemLanguage(CFSTR("ACXDeviceNotReachableMessageGenericTitle"));
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  _ACXDeviceNotReachableMessage(a2);
}

void ACXInstallRestrictedTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorInstallRestrictedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorInstallRestrictedMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

void ACXRemovalRestrictedTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorRemovalRestrictedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorRemovalRestrictedMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

void ACXNotEligibleForWatchAppInstallTitleAndMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a1;
  if (!a2)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_10;
  }
  _LocalizedStringForSystemLanguage(CFSTR("ACXErrorNotEligibleForWatchAppInstallTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v13, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    *a2 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    ACXUntrustedAppTitleAndMessage_cold_1();
  }

  if (a3 && v7)
  {
LABEL_10:
    _LocalizedStringForSystemLanguage(CFSTR("ACXErrorNotEligibleForWatchAppInstallMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v12, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      ACXUntrustedAppTitleAndMessage_cold_1();
    }

  }
LABEL_15:

}

id ACXWatchKitAppExecutableHash(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  MobileInstallationCopyAppMetadata();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v2)
  {
    objc_msgSend(v2, "watchKitAppExecutableHash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v4 = 0;
  }

  return v4;
}

BOOL ACXObjectsAreTheSameOrSameNullness(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  v6 = !(v3 | v4) || v3 && v4 && (objc_msgSend((id)v3, "isEqual:", v4) & 1) != 0;

  return v6;
}

BOOL ACXObjectsAreDifferentOrDifferentNullness(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = (v3 == 0) == (v4 != 0) || v3 && v4 && !objc_msgSend(v3, "isEqual:", v4);

  return v6;
}

id ACXCopySentinelFileURLForTestingMode()
{
  void *v0;
  void *v1;

  ACXCopyDataDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("TestingModeEnabled"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ApplicationRecordFromApplicationProxy(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v3 = a1;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "correspondingApplicationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, objc_msgSend(v5, "isPlaceholder"), &v10);
  v7 = v10;
  v8 = v7;
  if (a2 && !v6)
    *a2 = objc_retainAutorelease(v7);

  return v6;
}

id ACXCopyDuplicatedClassInfo(void *a1)
{
  id v1;
  Class *v2;
  uint64_t v3;
  id v4;
  NSHashTable *v5;
  void *v6;
  id *v7;
  void *v8;
  const char *ClassName;
  void *v10;
  void *v11;
  void *v12;
  unint64_t i;
  objc_class *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  Class *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unsigned int outCount;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  outCount = 0;
  v2 = objc_copyClassList(&outCount);
  v3 = outCount;
  v4 = v1;
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 770);
  v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  if ((_DWORD)v3)
  {
    v7 = (id *)v2;
    while (1)
    {
      v8 = (void *)MEMORY[0x1D8267F64]();
      if (!*v7)
        break;
      ClassName = object_getClassName(*v7);
      _StringFromClassName(ClassName);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "containsObject:", v10) & 1) == 0)
      {
        if (NSHashGet(v5, ClassName))
          objc_msgSend(v6, "addObject:", v10);
        else
          NSHashInsertKnownAbsent(v5, ClassName);
      }

      objc_autoreleasePoolPop(v8);
      ++v7;
      if (!--v3)
        goto LABEL_11;
    }
    objc_autoreleasePoolPop(v8);
  }
LABEL_11:
  v11 = (void *)objc_msgSend(v6, "copy");

  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_opt_new();
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        v14 = v2[i];
        if (!v14)
          break;
        v15 = object_getClassName(v2[i]);
        _StringFromClassName(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "containsObject:", v16))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p: %s"), v14, class_getImageName(v14));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18;
            objc_msgSend(v18, "addObject:", v17);
          }
          else
          {
            v19 = (void *)objc_opt_new();
            objc_msgSend(v19, "addObject:", v17);
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v16);
          }

        }
      }
    }
    v30 = v2;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v12, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v12, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v26, "copy");
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v22);
    }

    v28 = (void *)objc_msgSend(v12, "copy");
    v2 = v30;
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C9AA70];
  }
  free(v2);

  return v28;
}

id _StringFromClassName(const char *a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a1, strlen(a1), 4, 0);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1D4D30A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1D4D30F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D33230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D33560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D33AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D34250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D347B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D34C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D353F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D358DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D35D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D36174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3659C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D369EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D36D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D37024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D37408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3790C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 96), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__116(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__117(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1D4D382CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  id *v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v13);
  _Unwind_Resume(a1);
}

void sub_1D4D38BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D39180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D396E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D39A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3A0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3A448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3A8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3ABF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3AEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3B3D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 96), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4D3BD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3C228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3C48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3C668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3C88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3CBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4D3CE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t rosetta_is_current_process_translated()
{
  return 0;
}

uint64_t parse_macho_iterate_slices(const char *a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int *v8;
  char *v9;

  v4 = open(a1, 256);
  if (v4 < 0)
  {
    v8 = __error();
    v9 = strerror(*v8);
    syslog(3, "Failed to open macho file at %s for reading: %s", a1, v9);
    return 0;
  }
  else
  {
    v5 = v4;
    v6 = parse_macho_iterate_slices_fd(v4, (uint64_t)a1, a2);
    close(v5);
    return v6;
  }
}

uint64_t parse_macho_iterate_slices_fd(int a1, uint64_t a2, uint64_t a3)
{
  int *v5;
  int v6;
  int *v7;
  uint64_t v8;
  char *v10;
  char *v11;
  uint32_t magic;
  int *v13;
  fat_arch *v14;
  size_t v15;
  uint64_t v16;
  fat_arch *v17;
  off_t offset;
  char *macho_header_and_load_commands;
  char *v20;
  char v21;
  int *v22;
  fat_header fat_header;
  stat v24;
  int __buf;

  __buf = 0;
  memset(&v24, 0, sizeof(v24));
  if (fstat(a1, &v24))
  {
    v5 = __error();
    strerror(*v5);
    syslog(3, "Failed to stat %s : %s");
    return 0;
  }
  if (v24.st_size <= 8)
  {
    syslog(3, "File at %s is not a valid mach-o (too small to contain a valid header)");
    return 0;
  }
  *__error() = 0;
  if (pread(a1, &__buf, 4uLL, 0) != 4)
  {
    v7 = __error();
    strerror(*v7);
    syslog(3, "Failed to read magic from %s : %s");
    return 0;
  }
  if (__buf <= -805638659)
  {
    if (__buf != -1095041334 && __buf != -889275714)
    {
      v6 = -822415874;
      goto LABEL_15;
    }
    fat_header = 0;
    *__error() = 0;
    if (pread(a1, &fat_header, 8uLL, 0) == 8)
    {
      magic = fat_header.magic;
      if (fat_header.magic == -1095041334)
      {
        swap_fat_header(&fat_header, NX_LittleEndian);
        magic = fat_header.magic;
      }
      syslog(7, "Got fat header with magic 0x%08x and %u archs", magic, fat_header.nfat_arch);
      if (fat_header.nfat_arch < 0x401)
      {
        v15 = 20 * fat_header.nfat_arch;
        if (v24.st_size > (uint64_t)(v15 + 8))
        {
          v14 = (fat_arch *)malloc_type_malloc(20 * fat_header.nfat_arch, 0x50FF23B5uLL);
          if (v15 == pread(a1, v14, v15, 8))
          {
            swap_fat_arch(v14, fat_header.nfat_arch, NX_LittleEndian);
            if (!fat_header.nfat_arch)
            {
LABEL_37:
              v8 = 1;
              if (!v14)
                return v8;
              goto LABEL_28;
            }
            v16 = 0;
            v17 = v14;
            while (1)
            {
              syslog(7, "Evaluating fat slice with cputype %d; subtype %d; offset %u; size %u; align %u",
                v17->cputype,
                v17->cpusubtype,
                v17->offset,
                v17->size,
                v17->align);
              offset = v17->offset;
              if (v24.st_size <= offset)
              {
                syslog(3, "Fat arch %u in %s specifies offset which is beyond the end of the file");
                goto LABEL_27;
              }
              macho_header_and_load_commands = _read_macho_header_and_load_commands(a1, offset, v24.st_size);
              if (!macho_header_and_load_commands)
                break;
              v20 = macho_header_and_load_commands;
              v21 = (*(uint64_t (**)(uint64_t, fat_arch *, char *))(a3 + 16))(a3, v17, macho_header_and_load_commands);
              free(v20);
              if (++v16 < (unint64_t)fat_header.nfat_arch)
              {
                ++v17;
                if ((v21 & 1) != 0)
                  continue;
              }
              goto LABEL_37;
            }
            syslog(3, "Failed to read macho header and load commands in %s at %u");
          }
          else
          {
            v22 = __error();
            strerror(*v22);
            syslog(3, "Failed to read fat archs from %s : %s");
          }
LABEL_27:
          v8 = 0;
          if (!v14)
            return v8;
LABEL_28:
          free(v14);
          return v8;
        }
        syslog(3, "File is not large enough to contain %u fat arch headers and their referenced slices.");
      }
      else
      {
        syslog(3, "Number of fat archs %u exceeds the maximum %u");
      }
    }
    else
    {
      v13 = __error();
      strerror(*v13);
      syslog(3, "Failed to read fat header of %s : %s");
    }
    v14 = 0;
    goto LABEL_27;
  }
  if ((__buf + 17958194) >= 2)
  {
    v6 = -805638658;
LABEL_15:
    if (__buf != v6)
    {
      syslog(3, "Unknown binary with magic 0x%08x at %s");
      return 0;
    }
  }
  v10 = _read_macho_header_and_load_commands(a1, 0, v24.st_size);
  if (v10)
  {
    v11 = v10;
    (*(void (**)(uint64_t, _QWORD, char *))(a3 + 16))(a3, 0, v10);
    free(v11);
    return 1;
  }
  syslog(3, "Failed to read macho header and load commands in %s at %u");
  return 0;
}

char *_read_macho_header_and_load_commands(int a1, off_t a2, uint64_t a3)
{
  ssize_t v6;
  unsigned int v7;
  unsigned int v8;
  int *v9;
  size_t v10;
  size_t v11;
  char *v12;
  char *v13;
  ssize_t v14;
  int *v16;
  int *v17;
  __int128 __buf;
  __int128 v19;

  __buf = 0u;
  v19 = 0u;
  v6 = pread(a1, &__buf, 0x20uLL, a2);
  if (v6 < 0)
  {
    v9 = __error();
    strerror(*v9);
    syslog(3, "Failed to read mach header at offset %lld : %s");
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  if (v6 != 28 && v6 != 32)
  {
    syslog(3, "Expected to read at least sizeof(struct mach_header) but only got %zd bytes");
    goto LABEL_26;
  }
  v8 = v19;
  v7 = DWORD1(v19);
  if ((int)__buf > -17958195)
  {
    if ((_DWORD)__buf != -17958194)
    {
      if ((_DWORD)__buf == -17958193)
        goto LABEL_12;
LABEL_23:
      syslog(3, "Unknown magic in macho header at offset %llu: 0x%08x");
      goto LABEL_26;
    }
LABEL_15:
    v10 = 28;
    goto LABEL_16;
  }
  if ((_DWORD)__buf == -822415874)
  {
    v7 = bswap32(DWORD1(v19));
    v8 = bswap32(v19);
    goto LABEL_15;
  }
  if ((_DWORD)__buf != -805638658)
    goto LABEL_23;
  v7 = bswap32(DWORD1(v19));
  v8 = bswap32(v19);
LABEL_12:
  if (v6 != 32)
  {
    syslog(3, "Got 64-bit magic but didn't read size of 64-bit mach header");
    goto LABEL_26;
  }
  v10 = 32;
LABEL_16:
  v11 = v7;
  if (8 * (unint64_t)v8 > v7)
  {
    syslog(3, "Space required for total size of load commands (%llu) is greater than indicated size of commands (%u).");
    goto LABEL_26;
  }
  if ((uint64_t)(v10 + v7 + a2) >= a3)
  {
    syslog(3, "File is not large enough to contain commands with length %u");
    goto LABEL_26;
  }
  v12 = (char *)malloc_type_malloc(v10 + v7, 0xD7630F4AuLL);
  v13 = v12;
  if (!v12)
  {
    v16 = __error();
    strerror(*v16);
    syslog(3, "Failed to allocate %llu bytes: %s");
    goto LABEL_27;
  }
  memcpy(v12, &__buf, v10);
  v14 = pread(a1, &v13[v10], v11, v10 + a2);
  if (v14 < 0)
  {
    v17 = __error();
    strerror(*v17);
    syslog(3, "Failed to read %u bytes at offset %lld : %s");
    goto LABEL_27;
  }
  if (v14 != v11)
  {
    syslog(3, "Expected to read %u bytes of commands but only got %zd bytes");
LABEL_27:
    free(v13);
    return 0;
  }
  return v13;
}

uint64_t get_highest_sdk_version_for_any_slice(const char *a1)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __get_highest_sdk_version_for_any_slice_block_invoke;
  v4[3] = &unk_1E9883A38;
  v4[4] = &v5;
  v4[5] = a1;
  if ((parse_macho_iterate_slices(a1, (uint64_t)v4) & 1) != 0)
  {
    v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    syslog(3, "Failed to iterate macho file at %s", a1);
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke(uint64_t a1)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  dyld_get_image_versions();
  v2 = *((_DWORD *)v7 + 6);
  if (!v2)
  {
    syslog(3, "Failed to get SDK version from slice in %s", *(const char **)(a1 + 40));
    v2 = *((_DWORD *)v7 + 6);
  }
  syslog(7, "Slice had version 0x%08x", v2);
  v3 = *((_DWORD *)v7 + 6);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3 > *(_DWORD *)(v4 + 24))
    *(_DWORD *)(v4 + 24) = v3;
  _Block_object_dispose(&v6, 8);
  return 1;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

BOOL parse_macho_is_cpu_type_runnable_for_apps(int a1, int a2, char *a3, int *a4)
{
  int v8;
  _BOOL8 v9;
  int *v10;
  char *v11;
  int v12;
  char v13;
  size_t v15;
  int v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    syslog(3, "Error: Argument pointer must not be null");
    v12 = 13;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 13);
    v9 = 0;
    if (!a4)
      return v9;
    goto LABEL_12;
  }
  v17[0] = a1;
  v17[1] = a2;
  v16 = 0;
  v15 = 4;
  v8 = sysctlbyname("kern.grade_cputype", &v16, &v15, v17, 8uLL);
  v9 = v8 == 0;
  if (v8)
  {
    v10 = __error();
    v11 = strerror(*v10);
    syslog(3, "Error calling kern.grade_cputype for CPU type 0x%x and subtype 0x%x: %s", a1, a2, v11);
    v12 = 12;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 12);
    v13 = 0;
  }
  else if (v16 < 1 || a1 != 16777228 || (a2 & 0xFFFFFE) != 0)
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are not runnable", a1, a2);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are runnable", 16777228, a2);
    v12 = 0;
    v13 = 1;
  }
  *a3 = v13;
  if (a4)
LABEL_12:
    *a4 = v12;
  return v9;
}

BOOL parse_macho_is_file_runnable_for_apps(const char *a1, _BYTE *a2, _DWORD *a3)
{
  int v6;
  int v7;
  unint64_t st_size;
  const char *v9;
  int v10;
  char *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  size_t v17;
  int v18;
  fat_arch *v19;
  uint64_t v20;
  int *p_cpusubtype;
  int v22;
  const char *v23;
  int v24;
  int v25;
  char *cputype;
  uint64_t cpusubtype;
  mach_header_64 fat_header;
  int v30;
  stat v31;
  char v32;
  int v33;

  v33 = 0;
  v32 = 0;
  memset(&v31, 0, sizeof(v31));
  v30 = 0;
  if (!a1)
  {
    v33 = 1;
    syslog(3, "Input path is NULL");
    goto LABEL_58;
  }
  if (!a2)
  {
    v33 = 13;
    syslog(3, "Error: Argument pointer must not be null");
    goto LABEL_60;
  }
  v6 = open(a1, 256);
  if (v6 != -1)
  {
    v7 = v6;
    if (fstat(v6, &v31) == -1)
    {
      v12 = *__error();
      v33 = 3;
      cputype = (char *)a1;
      cpusubtype = (uint64_t)strerror(v12);
      v9 = "Can't stat input file %s: %s";
      goto LABEL_54;
    }
    st_size = v31.st_size;
    if (read(v7, &v30, 4uLL) != 4)
    {
      v13 = *__error();
      v33 = 5;
      cputype = (char *)a1;
      cpusubtype = (uint64_t)strerror(v13);
      v9 = "Failed to read header for file %s: %s";
      goto LABEL_54;
    }
    if (lseek(v7, 0, 0) == -1)
    {
      v14 = *__error();
      v33 = 4;
      cputype = (char *)a1;
      cpusubtype = (uint64_t)strerror(v14);
      v9 = "Can't seek input file %s: %s";
      goto LABEL_54;
    }
    if (st_size >= 8 && v30 == -1095041334)
    {
      *(_QWORD *)&fat_header.magic = 0;
      if (read(v7, &fat_header, 8uLL) != 8)
      {
        v16 = *__error();
        v33 = 5;
        cputype = (char *)a1;
        cpusubtype = (uint64_t)strerror(v16);
        v9 = "Failed to read fat header from input file %s: %s";
        goto LABEL_54;
      }
      swap_fat_header((fat_header *)&fat_header, NX_LittleEndian);
      if (fat_header.cputype >= 0x401u)
      {
        v33 = 7;
        cputype = (char *)fat_header.cputype;
        cpusubtype = 1024;
        v9 = "Number of fat archs %u exceeds the maximum %u";
LABEL_54:
        v15 = 3;
        goto LABEL_55;
      }
      v17 = 20 * fat_header.cputype;
      if (v17 + 8 > st_size)
      {
        v33 = 8;
        cputype = (char *)a1;
        v9 = "Malformed fat file: %s";
        goto LABEL_54;
      }
      v19 = (fat_arch *)malloc_type_malloc(v17, 0x360B8367uLL);
      if (v19)
      {
        if (v17 == read(v7, v19, v17))
        {
          swap_fat_arch(v19, fat_header.cputype, NX_LittleEndian);
          if (fat_header.cputype)
          {
            v20 = 0;
            p_cpusubtype = &v19->cpusubtype;
            while (parse_macho_is_cpu_type_runnable_for_apps(*(p_cpusubtype - 1), *p_cpusubtype, &v32, &v33))
            {
              if (v32)
                goto LABEL_64;
              p_cpusubtype += 5;
              if (++v20 >= (unint64_t)fat_header.cputype)
                goto LABEL_65;
            }
            v23 = "Failed to check if cpu type is runnable";
          }
          else
          {
            if (v32)
            {
LABEL_64:
              syslog(7, "FAT matching_arch cpu_type: 0x%x cpu_subtype: 0x%x");
              goto LABEL_56;
            }
LABEL_65:
            cputype = (char *)a1;
            v23 = "Failed to find matching arch for FAT input file %s";
          }
        }
        else
        {
          v24 = *__error();
          v33 = 6;
          cputype = (char *)a1;
          cpusubtype = (uint64_t)strerror(v24);
          v23 = "Failed to read fat arch(s) from input file %s: %s";
        }
      }
      else
      {
        v22 = *__error();
        v33 = 9;
        cputype = strerror(v22);
        v23 = "Failed to allocate memory for fat arch(s): %s";
      }
      syslog(3, v23, cputype, cpusubtype);
LABEL_56:
      free(v19);
      if ((v7 & 0x80000000) == 0)
        close(v7);
LABEL_58:
      if (!a2)
        goto LABEL_60;
      goto LABEL_59;
    }
    if (st_size >= 0x1C)
    {
      if (v30 == -17958194 || v30 == -822415874)
      {
        memset(&fat_header, 0, 28);
        if (read(v7, &fat_header, 0x1CuLL) == 28)
        {
          if (v30 == -822415874)
            swap_mach_header((mach_header *)&fat_header, NX_LittleEndian);
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              v9 = "Failed to find matching arch for 32-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            cpusubtype = fat_header.cpusubtype;
            v9 = "32-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
LABEL_27:
            v15 = 7;
LABEL_55:
            syslog(v15, v9, cputype, cpusubtype);
            v19 = 0;
            goto LABEL_56;
          }
          goto LABEL_50;
        }
        goto LABEL_41;
      }
      if (st_size >= 0x20 && (v30 == -17958193 || v30 == -805638658))
      {
        memset(&fat_header, 0, sizeof(fat_header));
        if (read(v7, &fat_header, 0x20uLL) == 32)
        {
          if (v30 == -805638658)
            swap_mach_header_64(&fat_header, NX_LittleEndian);
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              v9 = "Failed to find matching arch for 64-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            cpusubtype = fat_header.cpusubtype;
            v9 = "64-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
            goto LABEL_27;
          }
LABEL_50:
          v9 = "Failed to check if cpu type is runnable";
          goto LABEL_54;
        }
LABEL_41:
        v18 = *__error();
        v33 = 5;
        cputype = (char *)a1;
        cpusubtype = (uint64_t)strerror(v18);
        v9 = "Failed to read mach header from input file %s: %s";
        goto LABEL_54;
      }
    }
    v33 = 10;
    cputype = (char *)a1;
    v9 = "Unknown binary format for input file %s.";
    goto LABEL_54;
  }
  v10 = *__error();
  v33 = 2;
  v11 = strerror(v10);
  syslog(3, "Can't open input file %s: %s", a1, v11);
LABEL_59:
  *a2 = v32;
LABEL_60:
  v25 = v33;
  if (a3)
    *a3 = v33;
  return v25 == 0;
}

void ACXUntrustedAppTitleAndMessage_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D4D22000, MEMORY[0x1E0C81028], v0, "Failed to validate %@ : %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995C8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x1E0DE7180]();
}

uint64_t MISValidateSignature()
{
  return MEMORY[0x1E0DE7240]();
}

uint64_t MOLogEnableDiskLogging()
{
  return MEMORY[0x1E0D4F918]();
}

uint64_t MOLogOpen()
{
  return MEMORY[0x1E0D4F920]();
}

uint64_t MOLogWrite()
{
  return MEMORY[0x1E0D4F928]();
}

uint64_t MobileInstallationCopyAppMetadata()
{
  return MEMORY[0x1E0D4E418]();
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BD0](table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BE8](table, pointer);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x1E0C99FE0]();
}

uint64_t _CFBundleCreateFilteredLocalizedInfoPlist()
{
  return MEMORY[0x1E0C99FE8]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AA0](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1E0C830B0]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  return (Class *)MEMORY[0x1E0DE7C08](outCount);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856D8](fat_archs, *(_QWORD *)&nfat_arch, *(_QWORD *)&target_byte_order);
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856E0](fat_header, *(_QWORD *)&target_byte_order);
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856F0](mh, *(_QWORD *)&target_byte_order);
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856F8](mh, *(_QWORD *)&target_byte_order);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

