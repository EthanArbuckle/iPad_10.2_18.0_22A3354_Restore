uint64_t keyWithPrefix(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a2, a1);
}

id arrayOfCFPrefsWithPrefix(const __CFString *a1, void *a2, uint64_t a3)
{
  __CFString *v5;
  void *v6;
  id v7;
  CFArrayRef v8;
  const __CFArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@."), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = CFPreferencesCopyKeyList(a1, v5, (CFStringRef)*MEMORY[0x24BDBD570]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasPrefix:", v6))
          objc_msgSend(v7, "addObject:", v14);
      }
      v11 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v7;
}

id getPrefWithOverrideProfile(void *a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a1;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("HTProfile.%@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)CFPreferencesCopyValue(v3, (CFStringRef)*MEMORY[0x24BE3F310], (CFStringRef)*MEMORY[0x24BE3F448], (CFStringRef)*MEMORY[0x24BDBD570]);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      v8 = v9;
    else
      v8 = 0;

  }
  return v8;
}

id HTTerminationAllAvailableReasons()
{
  if (HTTerminationAllAvailableReasons_onceToken != -1)
    dispatch_once(&HTTerminationAllAvailableReasons_onceToken, &__block_literal_global);
  return (id)HTTerminationAllAvailableReasons_allReasons;
}

__CFString *HTTerminationReasonDisplayName(unint64_t a1)
{
  return exitNamespaceDisplayString(__clz(__rbit64(a1)) & 0x3F);
}

id HTTerminationSubReasonDisplayName(unint64_t a1, int64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;
  unint64_t v8;

  switch(a1)
  {
    case 0x100000uLL:
      v3 = __clz(__rbit64(a2));
      if (!a2)
        v3 = -1;
      if (a2 == 0x100000)
        v2 = 1001;
      else
        v2 = v3;
      break;
    case 0x8000uLL:
      if (a2 > 255)
      {
        if (a2 > 4095)
        {
          if (a2 >= 0x4000)
          {
            if (a2 == 0x4000)
            {
              v2 = 97132013;
              break;
            }
            if (a2 == 0x8000)
            {
              v2 = 2970726673;
              break;
            }
          }
          else
          {
            if (a2 == 4096)
            {
              v2 = 562215635;
              break;
            }
            if (a2 == 0x2000)
            {
              v2 = 562215636;
              break;
            }
          }
          goto LABEL_71;
        }
        if (a2 <= 1023)
        {
          if (a2 == 256)
          {
            v2 = 3490524077;
            break;
          }
          if (a2 == 512)
          {
            v2 = 2970405393;
            break;
          }
          goto LABEL_71;
        }
        if (a2 == 1024)
        {
          v7 = 25858;
          goto LABEL_82;
        }
        if (a2 == 2048)
        {
          v2 = 562215634;
          break;
        }
        goto LABEL_71;
      }
      if (a2 > 15)
      {
        if (a2 > 63)
        {
          if (a2 == 64)
            goto LABEL_70;
          if (a2 == 128)
          {
            v2 = 562215597;
            break;
          }
        }
        else
        {
          if (a2 == 16)
          {
LABEL_44:
            v2 = 3221229823;
            break;
          }
          if (a2 == 32)
          {
LABEL_69:
            v7 = 4300;
            goto LABEL_82;
          }
        }
LABEL_71:
        v8 = __clz(__rbit64(a2));
        if (a2)
          v2 = v8;
        else
          v2 = -1;
        break;
      }
      if (a2 == 2)
      {
        v2 = 0;
        break;
      }
      if (a2 == 4)
      {
LABEL_68:
        v2 = 2343432205;
        break;
      }
      if (a2 != 8)
        goto LABEL_71;
LABEL_52:
      v7 = -1519;
LABEL_82:
      v2 = v7 | 0xDEAD0000;
      break;
    case 0x400uLL:
      if (a2 > 255)
      {
        if (a2 <= 2047)
        {
          switch(a2)
          {
            case 256:
              v2 = 439025681;
              goto LABEL_83;
            case 512:
              v2 = 1539435073;
              goto LABEL_83;
            case 1024:
              v2 = 1539435076;
              goto LABEL_83;
          }
        }
        else if (a2 >= 0x2000)
        {
          if (a2 == 0x2000)
          {
            v2 = 3306925314;
            break;
          }
          if (a2 == 0x4000)
          {
            v2 = 3306925315;
            break;
          }
        }
        else
        {
          if (a2 == 2048)
          {
            v2 = 1539435077;
            break;
          }
          if (a2 == 4096)
          {
            v2 = 3306925313;
            break;
          }
        }
        goto LABEL_71;
      }
      if (a2 > 15)
      {
        if (a2 <= 63)
        {
          if (a2 != 16)
          {
            if (a2 == 32)
            {
              v2 = 4227595259;
              break;
            }
            goto LABEL_71;
          }
LABEL_70:
          v2 = 732775916;
          break;
        }
        if (a2 != 64)
        {
          if (a2 == 128)
          {
            v2 = 95805101;
            break;
          }
          goto LABEL_71;
        }
        goto LABEL_69;
      }
      if (a2 != 2)
      {
        if (a2 != 4)
        {
          if (a2 == 8)
            goto LABEL_44;
          goto LABEL_71;
        }
        goto LABEL_68;
      }
      goto LABEL_52;
    default:
      v4 = __clz(__rbit64(a2));
      if (a2)
        v5 = v4 + 1;
      else
        v5 = 0;
      v6 = -2;
      if (a1 != 2)
        v6 = -1;
      v2 = v5 + v6;
      break;
  }
LABEL_83:
  exitReasonDisplayString(__clz(__rbit64(a1)) & 0x3F, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t HTTerminationSubReasonShiftingForReason(uint64_t a1)
{
  if (a1 == 2)
    return 2;
  else
    return 1;
}

id HTTerminationAllAvailableSubReasonsForReason(uint64_t a1)
{
  void *v1;
  void *v2;
  unint64_t v3;
  void *v4;
  BOOL v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;

  v1 = (void *)MEMORY[0x24BDBD1A8];
  if (a1 >= 0x8000)
  {
    if (a1 < 0x400000)
    {
      if (a1 == 0x8000)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 2;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v27);

          v15 = v26 > 0x4000;
          v26 *= 2;
        }
        while (!v15);
        goto LABEL_76;
      }
      if (a1 == 0x40000)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 2;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v29);

          v5 = v28 >= 0x11;
          v28 *= 2;
        }
        while (!v5);
        goto LABEL_76;
      }
      if (a1 != 0x100000)
        return v1;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 2;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

        v5 = v10 >= 3;
        v10 *= 2;
      }
      while (!v5);
      v12 = &unk_250E69FF8;
    }
    else
    {
      if (a1 <= 0x7FFFFFF)
      {
        if (a1 == 0x400000)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 2;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v21);

            v5 = v20 >= 3;
            v20 *= 2;
          }
          while (!v5);
          goto LABEL_76;
        }
        if (a1 == 0x800000)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = 2;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v7);

            v5 = v6 >= 0x11;
            v6 *= 2;
          }
          while (!v5);
          goto LABEL_76;
        }
        return v1;
      }
      if (a1 == 0x8000000)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 2;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v33);

          v5 = v32 >= 5;
          v32 *= 2;
        }
        while (!v5);
        goto LABEL_76;
      }
      if (a1 != 0x100000000)
        return v1;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 2;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v17);

        v15 = v16 > 0x2000;
        v16 *= 2;
      }
      while (!v15);
      objc_msgSend(v2, "addObject:", &unk_250E69FF8);
      v12 = &unk_250E6A010;
    }
LABEL_48:
    objc_msgSend(v2, "addObject:", v12);
LABEL_76:
    v1 = (void *)objc_msgSend(v2, "copy");

    return v1;
  }
  if (a1 <= 63)
  {
    switch(a1)
    {
      case 2:
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 2;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v23);

          v15 = v22 > 0x8000;
          v22 *= 2;
        }
        while (!v15);
        goto LABEL_76;
      case 4:
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 2;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v25);

          v5 = v24 >= 0x40000001;
          v24 *= 2;
        }
        while (!v5);
        goto LABEL_76;
      case 8:
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 2;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

          v5 = v8 >= 9;
          v8 *= 2;
        }
        while (!v5);
        goto LABEL_76;
    }
    return v1;
  }
  if (a1 > 511)
  {
    if (a1 == 512)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 2;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v31);

        v15 = v30 > 0x40000;
        v30 *= 2;
      }
      while (!v15);
      goto LABEL_76;
    }
    if (a1 == 1024)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 2;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v14);

        v15 = v13 > 0x2000;
        v13 *= 2;
      }
      while (!v15);
      goto LABEL_76;
    }
    return v1;
  }
  if (a1 == 64)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 2;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v19);

      v5 = v18 >= 0x41;
      v18 *= 2;
    }
    while (!v5);
    v12 = &unk_250E69FE0;
    goto LABEL_48;
  }
  if (a1 == 128)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 2;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      v5 = v3 >= 0x101;
      v3 *= 2;
    }
    while (!v5);
    goto LABEL_76;
  }
  return v1;
}

void HTAnalyticsSendEventLazy(void *a1, void *a2)
{
  id v3;
  id v4;
  void (*v5)(id, id);
  _Unwind_Exception *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v5 = (void (*)(id, id))getAnalyticsSendEventLazySymbolLoc_ptr;
  v11 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v7[3] = &unk_250E62FB8;
    v7[4] = &v8;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)v7);
    v5 = (void (*)(id, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    v6 = (_Unwind_Exception *)HTAnalyticsSendEventLazy_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v5(v3, v4);

}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
  }
  else
  {
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
    if (!CoreAnalyticsLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEventLazy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HTLevelForHangDuration(double a1)
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F328], "sharedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "runloopHangTimeoutDurationMSec");

  if ((double)v3 * 0.555555556 <= a1)
    return 2;
  else
    return (double)v3 * 0.222222222 <= a1;
}

id stringFromXpcDictionary(void *a1, id a2)
{
  id v3;
  id v4;
  const char *string;
  void *v6;

  v3 = objc_retainAutorelease(a2);
  v4 = a1;
  string = xpc_dictionary_get_string(v4, (const char *)objc_msgSend(v3, "UTF8String"));

  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void sub_23DA43714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id location,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
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

void sub_23DA43904(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_23DA43A78(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __requestWithLogFile_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendData:", v3);

}

Class __getNEVPNManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NetworkExtensionLibraryCore_frameworkLibrary)
  {
    NetworkExtensionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NetworkExtensionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NEVPNManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNEVPNManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getNEVPNManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3(void *a1, const char *a2)
{
  _QWORD *v2;

  return objc_msgSend(a1, "initWithData:encoding:", *v2, 4);
}

void sub_23DA44BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a40, 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

id getDataTypePaths()
{
  if (getDataTypePaths_onceToken != -1)
    dispatch_once(&getDataTypePaths_onceToken, &__block_literal_global_3);
  return (id)getDataTypePaths__dataPathsArray;
}

void sub_23DA459C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35(uint64_t a1)
{

}

void __getDataTypePaths_block_invoke()
{
  uint64_t i;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  for (i = 0; i != 3; ++i)
    objc_msgSend(v3, "addObject:", off_250E633C0[_kAllHangsDataTypes[i]]);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getDataTypePaths__dataPathsArray;
  getDataTypePaths__dataPathsArray = v1;

}

uint64_t __filterDeveloperAppsPredicate_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "processRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "processRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDeveloperApp");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_23DA46620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23DA46A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

id savedSettingPrefixedDefaultsKey(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = *MEMORY[0x24BE3F3A8];
  keyWithPrefix(a1, *MEMORY[0x24BE3F3B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.%@"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __bootSessionUUID_block_invoke()
{
  uint64_t v0;
  void *v1;
  size_t v2;
  _BYTE v3[37];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(v3, 0, sizeof(v3));
  v2 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", v3, &v2, 0, 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)bootSessionUUID_bootUUID;
    bootSessionUUID_bootUUID = v0;

  }
}

id shared_ht_log_handle()
{
  if (shared_ht_log_handle_onceToken != -1)
    dispatch_once(&shared_ht_log_handle_onceToken, &__block_literal_global_6);
  return (id)shared_ht_log_handle___ht_log_handle;
}

void __shared_ht_log_handle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.hangtracer", "");
  v1 = (void *)shared_ht_log_handle___ht_log_handle;
  shared_ht_log_handle___ht_log_handle = (uint64_t)v0;

}

uint64_t applyTailspinConfig(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  uint8_t v5[16];
  uint8_t buf[16];

  shared_ht_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23DA3F000, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: change tailspin config", buf, 2u);
    }

    return tailspin_config_apply_sync();
  }
  else
  {
    if (v3)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23DA3F000, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: provided desiredConfig is null", v5, 2u);
    }

    return 0;
  }
}

uint64_t configureTailspinForSelfEnableConfig()
{
  NSObject *v0;
  uint8_t v2[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_23DA3F000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForSelfEnableConfig not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForEPL()
{
  NSObject *v0;
  uint8_t v2[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_23DA3F000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForEPL not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForThirdPartyDevelopment(int a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  arrayOfCFPrefsWithPrefix((const __CFString *)*MEMORY[0x24BE3F310], (void *)*MEMORY[0x24BE3F448], *MEMORY[0x24BE3F3A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    shared_ht_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      return 0;
    }
    v12 = 136315138;
    v13 = "configureTailspinForThirdPartyDevelopment";
    v5 = "%s: Not configuring tailspin since EPL is active";
    v6 = v4;
    v7 = OS_LOG_TYPE_INFO;
LABEL_4:
    _os_log_impl(&dword_23DA3F000, v6, v7, v5, (uint8_t *)&v12, 0xCu);
    goto LABEL_5;
  }
  v9 = tailspin_config_create_with_default_config();
  if (!v9)
  {
    shared_ht_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v12 = 136315138;
    v13 = "configureTailspinForThirdPartyDevelopment";
    v5 = "%s: Failed to create tailspin config object";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_4;
  }
  v10 = v9;
  if (a1)
  {
    tailspin_enabled_set();
    tailspin_buffer_size_set();
    tailspin_oncore_sampling_period_set();
    tailspin_full_sampling_period_set();
  }
  v11 = applyTailspinConfig(v10);
  MEMORY[0x2426394DC](v10);
  return v11;
}

id HTSettingsBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)HTSettingsBundle_bundle;
  if (!HTSettingsBundle_bundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)HTSettingsBundle_bundle;
    HTSettingsBundle_bundle = v1;

    v0 = (void *)HTSettingsBundle_bundle;
  }
  return v0;
}

id HTUISettingsGroupTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUISettingsGroupTitle_str;
  if (!HTUISettingsGroupTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Performance Testing"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUISettingsGroupTitle_str;
    HTUISettingsGroupTitle_str = v2;

    v0 = (void *)HTUISettingsGroupTitle_str;
  }
  return v0;
}

id HTUISettingsTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUISettingsTitle_str;
  if (!HTUISettingsTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Hang Detection"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUISettingsTitle_str;
    HTUISettingsTitle_str = v2;

    v0 = (void *)HTUISettingsTitle_str;
  }
  return v0;
}

id HTUIActivationToggleTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIActivationToggleTitle_str;
  if (!HTUIActivationToggleTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Enable Hang Detection"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIActivationToggleTitle_str;
    HTUIActivationToggleTitle_str = v2;

    v0 = (void *)HTUIActivationToggleTitle_str;
  }
  return v0;
}

id HTUIActivationToggleFooterPartJoiner_Part1_Part2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIActivationToggleFooterPartJoiner_Part1_Part2_str;
  if (!HTUIActivationToggleFooterPartJoiner_Part1_Part2_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("HTUIActivationToggleFooterPartJoiner"), CFSTR("%@ %@"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIActivationToggleFooterPartJoiner_Part1_Part2_str;
    HTUIActivationToggleFooterPartJoiner_Part1_Part2_str = v2;

    v0 = (void *)HTUIActivationToggleFooterPartJoiner_Part1_Part2_str;
  }
  return v0;
}

id HTUIActivationToggleFooterPart1()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)HTUIActivationToggleFooterPart1_string;
  if (!HTUIActivationToggleFooterPart1_string)
  {
    v1 = (void *)MEMORY[0x24BDD17C8];
    HTSettingsBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HTUIActivationToggleFooterPart1"), CFSTR("Detect and capture diagnostic logs for hangs greater than %ld milliseconds in monitored apps."), &stru_250E649A0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringWithFormat:", v3, 250);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)HTUIActivationToggleFooterPart1_string;
    HTUIActivationToggleFooterPart1_string = v4;

    v0 = (void *)HTUIActivationToggleFooterPart1_string;
  }
  return v0;
}

id HTUIActivationToggleFooterPart2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIActivationToggleFooterPart2_str;
  if (!HTUIActivationToggleFooterPart2_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("HTUIActivationToggleFooterPart2"), CFSTR("Learn More…"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIActivationToggleFooterPart2_str;
    HTUIActivationToggleFooterPart2_str = v2;

    v0 = (void *)HTUIActivationToggleFooterPart2_str;
  }
  return v0;
}

id HTUIActivationToggleFooterShort()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIActivationToggleFooterShort_str;
  if (!HTUIActivationToggleFooterShort_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("HTUIActivationToggleFooterShort"), CFSTR("Detect and capture diagnostics for hangs in monitored apps. [Learn More…](https://apple.com)"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIActivationToggleFooterShort_str;
    HTUIActivationToggleFooterShort_str = v2;

    v0 = (void *)HTUIActivationToggleFooterShort_str;
  }
  return v0;
}

id HTUIThresholdFooter()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)HTUIThresholdFooter_string;
  if (!HTUIThresholdFooter_string)
  {
    v1 = (void *)MEMORY[0x24BDD17C8];
    HTSettingsBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Detect hangs crossing this duration threshold.\nThe default is %ld milliseconds."), &stru_250E649A0, &stru_250E649A0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringWithFormat:", v3, 500);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)HTUIThresholdFooter_string;
    HTUIThresholdFooter_string = v4;

    v0 = (void *)HTUIThresholdFooter_string;
  }
  return v0;
}

__CFString *HTUIInternalRedirect()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalRedirect_str;
  if (!HTUIInternalRedirect_str)
  {
    HTUIInternalRedirect_str = (uint64_t)CFSTR("\n\nINTERNAL: Hang detection is enabled for all apps on internal builds. Open *Internal Settings* to turn on the HUD and see recent hang logs.");

    v0 = CFSTR("\n\nINTERNAL: Hang detection is enabled for all apps on internal builds. Open *Internal Settings* to turn on the HUD and see recent hang logs.");
  }
  return v0;
}

id HTUILogsSectionTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILogsSectionTitle_str;
  if (!HTUILogsSectionTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Available Hang Logs"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILogsSectionTitle_str;
    HTUILogsSectionTitle_str = v2;

    v0 = (void *)HTUILogsSectionTitle_str;
  }
  return v0;
}

id HTUIAppsSectionTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIAppsSectionTitle_str;
  if (!HTUIAppsSectionTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Monitored Apps"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIAppsSectionTitle_str;
    HTUIAppsSectionTitle_str = v2;

    v0 = (void *)HTUIAppsSectionTitle_str;
  }
  return v0;
}

id HTUIAppsSectionFooter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIAppsSectionFooter_str;
  if (!HTUIAppsSectionFooter_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Only apps installed by Xcode, by TestFlight, or via the enterprise program are monitored for hangs."), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIAppsSectionFooter_str;
    HTUIAppsSectionFooter_str = v2;

    v0 = (void *)HTUIAppsSectionFooter_str;
  }
  return v0;
}

__CFString *HTUIAppsSectionFooterInternal()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIAppsSectionFooterInternal_str;
  if (!HTUIAppsSectionFooterInternal_str)
  {
    HTUIAppsSectionFooterInternal_str = (uint64_t)CFSTR("All apps are monitored on internal builds.");

    v0 = CFSTR("All apps are monitored on internal builds.");
  }
  return v0;
}

id HTUILogsThresholdSelectorTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILogsThresholdSelectorTitle_str;
  if (!HTUILogsThresholdSelectorTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Hang Threshold"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILogsThresholdSelectorTitle_str;
    HTUILogsThresholdSelectorTitle_str = v2;

    v0 = (void *)HTUILogsThresholdSelectorTitle_str;
  }
  return v0;
}

id HTUIDurationLabel()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIDurationLabel_str;
  if (!HTUIDurationLabel_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Duration"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIDurationLabel_str;
    HTUIDurationLabel_str = v2;

    v0 = (void *)HTUIDurationLabel_str;
  }
  return v0;
}

id HTUITimestampLabel()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUITimestampLabel_str;
  if (!HTUITimestampLabel_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Timestamp"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUITimestampLabel_str;
    HTUITimestampLabel_str = v2;

    v0 = (void *)HTUITimestampLabel_str;
  }
  return v0;
}

id HTUIFileFormatTailspin()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIFileFormatTailspin_str;
  if (!HTUIFileFormatTailspin_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Tailspin"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIFileFormatTailspin_str;
    HTUIFileFormatTailspin_str = v2;

    v0 = (void *)HTUIFileFormatTailspin_str;
  }
  return v0;
}

id HTUIFileFormatSpindump()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIFileFormatSpindump_str;
  if (!HTUIFileFormatSpindump_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Spindump"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIFileFormatSpindump_str;
    HTUIFileFormatSpindump_str = v2;

    v0 = (void *)HTUIFileFormatSpindump_str;
  }
  return v0;
}

id HTUIFileFormatSpindumpSymbolicated()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIFileFormatSpindumpSymbolicated_str;
  if (!HTUIFileFormatSpindumpSymbolicated_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Spindump (Symbolicated)"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIFileFormatSpindumpSymbolicated_str;
    HTUIFileFormatSpindumpSymbolicated_str = v2;

    v0 = (void *)HTUIFileFormatSpindumpSymbolicated_str;
  }
  return v0;
}

id HTUIPlaceholderUnknownProcess()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIPlaceholderUnknownProcess_str;
  if (!HTUIPlaceholderUnknownProcess_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Unknown Process"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIPlaceholderUnknownProcess_str;
    HTUIPlaceholderUnknownProcess_str = v2;

    v0 = (void *)HTUIPlaceholderUnknownProcess_str;
  }
  return v0;
}

id HTUIPlaceholderNoLogs()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIPlaceholderNoLogs_str;
  if (!HTUIPlaceholderNoLogs_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("No hangs detected"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIPlaceholderNoLogs_str;
    HTUIPlaceholderNoLogs_str = v2;

    v0 = (void *)HTUIPlaceholderNoLogs_str;
  }
  return v0;
}

id HTUIPlaceholderNoApps()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIPlaceholderNoApps_str;
  if (!HTUIPlaceholderNoApps_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("No monitored apps"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIPlaceholderNoApps_str;
    HTUIPlaceholderNoApps_str = v2;

    v0 = (void *)HTUIPlaceholderNoApps_str;
  }
  return v0;
}

id HTUISelectButton()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUISelectButton_str;
  if (!HTUISelectButton_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Select"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUISelectButton_str;
    HTUISelectButton_str = v2;

    v0 = (void *)HTUISelectButton_str;
  }
  return v0;
}

id HTUIShareButton()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIShareButton_str;
  if (!HTUIShareButton_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIShareButton_str;
    HTUIShareButton_str = v2;

    v0 = (void *)HTUIShareButton_str;
  }
  return v0;
}

__CFString *HTUISymbolicateFileButton()
{
  __CFString *v0;

  v0 = (__CFString *)HTUISymbolicateFileButton_str;
  if (!HTUISymbolicateFileButton_str)
  {
    HTUISymbolicateFileButton_str = (uint64_t)CFSTR("Symbolicate");

    v0 = CFSTR("Symbolicate");
  }
  return v0;
}

__CFString *HTUISeeSymbolicatedFileButton()
{
  __CFString *v0;

  v0 = (__CFString *)HTUISeeSymbolicatedFileButton_str;
  if (!HTUISeeSymbolicatedFileButton_str)
  {
    HTUISeeSymbolicatedFileButton_str = (uint64_t)CFSTR("View Symbolicated Log");

    v0 = CFSTR("View Symbolicated Log");
  }
  return v0;
}

id HTUIFetchingAppsErrorTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIFetchingAppsErrorTitle_str;
  if (!HTUIFetchingAppsErrorTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Unable to load apps"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIFetchingAppsErrorTitle_str;
    HTUIFetchingAppsErrorTitle_str = v2;

    v0 = (void *)HTUIFetchingAppsErrorTitle_str;
  }
  return v0;
}

id HTUIFetchingAppsErrorMessage()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIFetchingAppsErrorMessage_str;
  if (!HTUIFetchingAppsErrorMessage_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("There was an error trying to fetch the list of developer apps that are currently being monitored."), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIFetchingAppsErrorMessage_str;
    HTUIFetchingAppsErrorMessage_str = v2;

    v0 = (void *)HTUIFetchingAppsErrorMessage_str;
  }
  return v0;
}

id HTUIFetchingHangsErrorTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIFetchingHangsErrorTitle_str;
  if (!HTUIFetchingHangsErrorTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Unable to load hang events"), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIFetchingHangsErrorTitle_str;
    HTUIFetchingHangsErrorTitle_str = v2;

    v0 = (void *)HTUIFetchingHangsErrorTitle_str;
  }
  return v0;
}

id HTUIFetchingHangsErrorMessage()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIFetchingHangsErrorMessage_str;
  if (!HTUIFetchingHangsErrorMessage_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("There was an error trying to find the list of hangs that occurred recently."), &stru_250E649A0, &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIFetchingHangsErrorMessage_str;
    HTUIFetchingHangsErrorMessage_str = v2;

    v0 = (void *)HTUIFetchingHangsErrorMessage_str;
  }
  return v0;
}

id HTUIDialogCancelButton()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIDialogCancelButton_str;
  if (!HTUIDialogCancelButton_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("HTUIDialogCancelButton"), CFSTR("Cancel"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIDialogCancelButton_str;
    HTUIDialogCancelButton_str = v2;

    v0 = (void *)HTUIDialogCancelButton_str;
  }
  return v0;
}

id HTUIDialogOKButton()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUIDialogOKButton_str;
  if (!HTUIDialogOKButton_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("HTUIDialogOKButton"), CFSTR("OK"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUIDialogOKButton_str;
    HTUIDialogOKButton_str = v2;

    v0 = (void *)HTUIDialogOKButton_str;
  }
  return v0;
}

id HTUILearnMoreTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreTitle_str;
  if (!HTUILearnMoreTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_00"), CFSTR("About Hang Detection"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreTitle_str;
    HTUILearnMoreTitle_str = v2;

    v0 = (void *)HTUILearnMoreTitle_str;
  }
  return v0;
}

id HTUILearnMoreWhatAreHangsTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreWhatAreHangsTitle_str;
  if (!HTUILearnMoreWhatAreHangsTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_01"), CFSTR("Hang Detection"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreWhatAreHangsTitle_str;
    HTUILearnMoreWhatAreHangsTitle_str = v2;

    v0 = (void *)HTUILearnMoreWhatAreHangsTitle_str;
  }
  return v0;
}

id HTUILearnMoreWhatAreHangsContent()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreWhatAreHangsContent_str;
  if (!HTUILearnMoreWhatAreHangsContent_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_02"), CFSTR("A hang occurs when the main thread of an app becomes unresponsive, and is unable to process user interactions or updates to the UI. When you turn on Hang Detection, iOS monitors responsiveness in your app and generates diagnostics to help identify parts of your app that spend too much time on the main thread after initial frame rendering. This feature supports apps installed directly through Xcode and signed with a development certificate, beta versions of apps you install with TestFlight, and apps distributed through the enterprise program.\n\nHang Detection is only available while the device is in Developer Mode."), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreWhatAreHangsContent_str;
    HTUILearnMoreWhatAreHangsContent_str = v2;

    v0 = (void *)HTUILearnMoreWhatAreHangsContent_str;
  }
  return v0;
}

id HTUILearnMoreHUDTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreHUDTitle_str;
  if (!HTUILearnMoreHUDTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_03"), CFSTR("Overlay"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreHUDTitle_str;
    HTUILearnMoreHUDTitle_str = v2;

    v0 = (void *)HTUILearnMoreHUDTitle_str;
  }
  return v0;
}

id HTUILearnMoreHUDContent()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreHUDContent_str;
  if (!HTUILearnMoreHUDContent_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_04"), CFSTR("When a hang occurs in a monitored app, an overlay appears at the top of the screen indicating how much time has elapsed since the app became unresponsive. Hang Detection stops monitoring hangs that exceed 10 seconds, and captures diagnostics to record the beginning of the hang.\n\nUsing this overlay is a great way to differentiate hangs from functional issues with similar symptoms, and helps you keep track of your app’s responsiveness while testing."), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreHUDContent_str;
    HTUILearnMoreHUDContent_str = v2;

    v0 = (void *)HTUILearnMoreHUDContent_str;
  }
  return v0;
}

id HTUILearnMoreLogLimitTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreLogLimitTitle_str;
  if (!HTUILearnMoreLogLimitTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_05"), CFSTR("Diagnostic Logs"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreLogLimitTitle_str;
    HTUILearnMoreLogLimitTitle_str = v2;

    v0 = (void *)HTUILearnMoreLogLimitTitle_str;
  }
  return v0;
}

id HTUILearnMoreLogLimitContent()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreLogLimitContent_str;
  if (!HTUILearnMoreLogLimitContent_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_06"), CFSTR("Hang Detection automatically collects diagnostic logs. Log processing occurs in the background at a low priority and may take longer if the system is busy. When logs are available for sharing with others, Notification Center displays a passive notification. Note that logs are a best effort and Hang Detection may not create logs for every hang."), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreLogLimitContent_str;
    HTUILearnMoreLogLimitContent_str = v2;

    v0 = (void *)HTUILearnMoreLogLimitContent_str;
  }
  return v0;
}

id HTUILearnMoreFileTypesTitle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreFileTypesTitle_str;
  if (!HTUILearnMoreFileTypesTitle_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_07"), CFSTR("Each hang event generates two files:"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreFileTypesTitle_str;
    HTUILearnMoreFileTypesTitle_str = v2;

    v0 = (void *)HTUILearnMoreFileTypesTitle_str;
  }
  return v0;
}

id HTUILearnMoreFileTypesIPS()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreFileTypesIPS_str;
  if (!HTUILearnMoreFileTypesIPS_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreFileTypesIPS_str;
    HTUILearnMoreFileTypesIPS_str = v2;

    v0 = (void *)HTUILearnMoreFileTypesIPS_str;
  }
  return v0;
}

id HTUILearnMoreFileTypesTailspin()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreFileTypesTailspin_str;
  if (!HTUILearnMoreFileTypesTailspin_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_09"), CFSTR("A tailspin file you can open in Instruments to view detailed thread interaction within your app’s process and overall usage of system resources at the time of the hang."), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreFileTypesTailspin_str;
    HTUILearnMoreFileTypesTailspin_str = v2;

    v0 = (void *)HTUILearnMoreFileTypesTailspin_str;
  }
  return v0;
}

id HTUILearnMoreFileTypesShare()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreFileTypesShare_str;
  if (!HTUILearnMoreFileTypesShare_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_10"), CFSTR("You can share both files to your Mac or send them to the app developer for further analysis."), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreFileTypesShare_str;
    HTUILearnMoreFileTypesShare_str = v2;

    v0 = (void *)HTUILearnMoreFileTypesShare_str;
  }
  return v0;
}

id HTUILearnMoreURLPrefix()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)HTUILearnMoreURLPrefix_str;
  if (!HTUILearnMoreURLPrefix_str)
  {
    HTSettingsBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("LearnMore_11"), CFSTR("Learn more about Hangs at"), &stru_250E649A0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)HTUILearnMoreURLPrefix_str;
    HTUILearnMoreURLPrefix_str = v2;

    v0 = (void *)HTUILearnMoreURLPrefix_str;
  }
  return v0;
}

__CFString *HTUILearnMoreURL()
{
  __CFString *v0;

  v0 = (__CFString *)HTUILearnMoreURL_str;
  if (!HTUILearnMoreURL_str)
  {
    HTUILearnMoreURL_str = (uint64_t)CFSTR("https://developer.apple.com/documentation/xcode/improving-app-responsiveness");

    v0 = CFSTR("https://developer.apple.com/documentation/xcode/improving-app-responsiveness");
  }
  return v0;
}

__CFString *HTUIInternalSettingsTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalSettingsTitle_str;
  if (!HTUIInternalSettingsTitle_str)
  {
    HTUIInternalSettingsTitle_str = (uint64_t)CFSTR("HangTracer");

    v0 = CFSTR("HangTracer");
  }
  return v0;
}

__CFString *HTUIInternalIntro()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalIntro_str;
  if (!HTUIInternalIntro_str)
  {
    HTUIInternalIntro_str = (uint64_t)CFSTR("HangTracer monitors the main thread in foreground apps and captures diagnostics.");

    v0 = CFSTR("HangTracer monitors the main thread in foreground apps and captures diagnostics.");
  }
  return v0;
}

__CFString *HTUIInternalHUDTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalHUDTitle_str;
  if (!HTUIInternalHUDTitle_str)
  {
    HTUIInternalHUDTitle_str = (uint64_t)CFSTR("Heads-Up Display");

    v0 = CFSTR("Heads-Up Display");
  }
  return v0;
}

__CFString *HTUIInternalToggleTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalToggleTitle_str;
  if (!HTUIInternalToggleTitle_str)
  {
    HTUIInternalToggleTitle_str = (uint64_t)CFSTR("HangTracer HUD");

    v0 = CFSTR("HangTracer HUD");
  }
  return v0;
}

id HTUIInternalThresholdFooter()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)HTUIInternalThresholdFooter_string;
  if (!HTUIInternalThresholdFooter_string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("Turn on the Heads-Up Display to be notified when apps are unresponsive to input. Increase the %ldms threshold to focus on the most critical hangs."), 500);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)HTUIInternalThresholdFooter_string;
    HTUIInternalThresholdFooter_string = v1;

    v0 = (void *)HTUIInternalThresholdFooter_string;
  }
  return v0;
}

__CFString *HTUIInternalIntroWithProcessTerminations()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalIntroWithProcessTerminations_str;
  if (!HTUIInternalIntroWithProcessTerminations_str)
  {
    HTUIInternalIntroWithProcessTerminations_str = (uint64_t)CFSTR("Get further insights into system stability with the *Process Terminations HUD*.");

    v0 = CFSTR("Get further insights into system stability with the *Process Terminations HUD*.");
  }
  return v0;
}

__CFString *HTUISymbolicating()
{
  __CFString *v0;

  v0 = (__CFString *)HTUISymbolicating_str;
  if (!HTUISymbolicating_str)
  {
    HTUISymbolicating_str = (uint64_t)CFSTR("Symbolicating…");

    v0 = CFSTR("Symbolicating…");
  }
  return v0;
}

__CFString *HTUISymbolicationErrorTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUISymbolicationErrorTitle_str;
  if (!HTUISymbolicationErrorTitle_str)
  {
    HTUISymbolicationErrorTitle_str = (uint64_t)CFSTR("Unable to symbolicate log");

    v0 = CFSTR("Unable to symbolicate log");
  }
  return v0;
}

__CFString *HTUISymbolicationErrorMessage()
{
  __CFString *v0;

  v0 = (__CFString *)HTUISymbolicationErrorMessage_str;
  if (!HTUISymbolicationErrorMessage_str)
  {
    HTUISymbolicationErrorMessage_str = (uint64_t)CFSTR("There was an error trying to symbolicate the log file. Ensure that you are connected to the internal network and try again.");

    v0 = CFSTR("There was an error trying to symbolicate the log file. Ensure that you are connected to the internal network and try again.");
  }
  return v0;
}

__CFString *HTUISymbolicationErrorButton_VPNName()
{
  __CFString *v0;

  v0 = (__CFString *)HTUISymbolicationErrorButton_VPNName_str;
  if (!HTUISymbolicationErrorButton_VPNName_str)
  {
    HTUISymbolicationErrorButton_VPNName_str = (uint64_t)CFSTR("Turn On %@");

    v0 = CFSTR("Turn On %@");
  }
  return v0;
}

__CFString *HTUIInternalForceQuitsTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalForceQuitsTitle_str;
  if (!HTUIInternalForceQuitsTitle_str)
  {
    HTUIInternalForceQuitsTitle_str = (uint64_t)CFSTR("Force-Quit Detection");

    v0 = CFSTR("Force-Quit Detection");
  }
  return v0;
}

__CFString *HTUIInternalForceQuitsToggleTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalForceQuitsToggleTitle_str;
  if (!HTUIInternalForceQuitsToggleTitle_str)
  {
    HTUIInternalForceQuitsToggleTitle_str = (uint64_t)CFSTR("Detect Force-Quit Apps");

    v0 = CFSTR("Detect Force-Quit Apps");
  }
  return v0;
}

__CFString *HTUIInternalForceQuitsFooterOFF()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalForceQuitsFooterOFF_str;
  if (!HTUIInternalForceQuitsFooterOFF_str)
  {
    HTUIInternalForceQuitsFooterOFF_str = (uint64_t)CFSTR("Receive a notification and capture tailspin logs each time you quit and relaunch an app. Report any app issue right from the notification.");

    v0 = CFSTR("Receive a notification and capture tailspin logs each time you quit and relaunch an app. Report any app issue right from the notification.");
  }
  return v0;
}

id HTUIInternalForceQuitsFooterON()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)HTUIInternalForceQuitsFooterON_string;
  if (!HTUIInternalForceQuitsFooterON_string)
  {
    v1 = (void *)MEMORY[0x24BDD17C8];
    HTUIInternalForceQuitsFooterOFF();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringWithFormat:", CFSTR("%@\n\nOnly apps force-quit and relaunched within this duration will be detected. The default is %d seconds."), v2, 3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)HTUIInternalForceQuitsFooterON_string;
    HTUIInternalForceQuitsFooterON_string = v3;

    v0 = (void *)HTUIInternalForceQuitsFooterON_string;
  }
  return v0;
}

__CFString *HTUIInternalForceQuitsProcessTerminationsLink()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalForceQuitsProcessTerminationsLink_str;
  if (!HTUIInternalForceQuitsProcessTerminationsLink_str)
  {
    HTUIInternalForceQuitsProcessTerminationsLink_str = (uint64_t)CFSTR("See *Process Terminations* to get an indication when background processes exit.");

    v0 = CFSTR("See *Process Terminations* to get an indication when background processes exit.");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsTitle_str;
  if (!HTUIInternalTerminationsTitle_str)
  {
    HTUIInternalTerminationsTitle_str = (uint64_t)CFSTR("Process Terminations");

    v0 = CFSTR("Process Terminations");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsToggleTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsToggleTitle_str;
  if (!HTUIInternalTerminationsToggleTitle_str)
  {
    HTUIInternalTerminationsToggleTitle_str = (uint64_t)CFSTR("Process Terminations HUD");

    v0 = CFSTR("Process Terminations HUD");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsFooter()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsFooter_str;
  if (!HTUIInternalTerminationsFooter_str)
  {
    HTUIInternalTerminationsFooter_str = (uint64_t)CFSTR("Show process terminations in the Heads-Up Display to monitor system stability in real-time.\nSelect which processes and termination reasons are included in the HUD.\n\nGet further insights into app performance with the *HangTracer HUD*.");

    v0 = CFSTR("Show process terminations in the Heads-Up Display to monitor system stability in real-time.\nSelect which processes and termination reasons are included in the HUD.\n\nGet further insights into app performance with the *HangTracer HUD*.");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsProcessesTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsProcessesTitle_str;
  if (!HTUIInternalTerminationsProcessesTitle_str)
  {
    HTUIInternalTerminationsProcessesTitle_str = (uint64_t)CFSTR("Monitored Processes");

    v0 = CFSTR("Monitored Processes");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsAllProcessesToggle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsAllProcessesToggle_str;
  if (!HTUIInternalTerminationsAllProcessesToggle_str)
  {
    HTUIInternalTerminationsAllProcessesToggle_str = (uint64_t)CFSTR("All Processes");

    v0 = CFSTR("All Processes");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsCriticalProcessesToggle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsCriticalProcessesToggle_str;
  if (!HTUIInternalTerminationsCriticalProcessesToggle_str)
  {
    HTUIInternalTerminationsCriticalProcessesToggle_str = (uint64_t)CFSTR("Critical Processes");

    v0 = CFSTR("Critical Processes");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsCriticalProcessesFooter()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsCriticalProcessesFooter_str;
  if (!HTUIInternalTerminationsCriticalProcessesFooter_str)
  {
    HTUIInternalTerminationsCriticalProcessesFooter_str = (uint64_t)CFSTR("Includes processes considered critical for performance and stability. *See list…*");

    v0 = CFSTR("Includes processes considered critical for performance and stability. *See list…*");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1_str;
  if (!HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1_str)
  {
    HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart1_str = (uint64_t)CFSTR("The following background processes are critical for performance and stability.");

    v0 = CFSTR("The following background processes are critical for performance and stability.");
  }
  return v0;
}

id HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string;
  if (!HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string)
  {
    v1 = (void *)MEMORY[0x24BDD17C8];
    HTUIInternalTerminationsCriticalProcessesToggle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringWithFormat:", CFSTR("Turn on “%@” to get notified in the Heads-Up Display whenever they are terminated."), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string;
    HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string = v3;

    v0 = (void *)HTUIInternalTerminationsCriticalProcessesLearnMoreIntroPart2_string;
  }
  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessButton()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsAddProcessButton_str;
  if (!HTUIInternalTerminationsAddProcessButton_str)
  {
    HTUIInternalTerminationsAddProcessButton_str = (uint64_t)CFSTR("Add Process");

    v0 = CFSTR("Add Process");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessDialogTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsAddProcessDialogTitle_str;
  if (!HTUIInternalTerminationsAddProcessDialogTitle_str)
  {
    HTUIInternalTerminationsAddProcessDialogTitle_str = (uint64_t)CFSTR("Monitor New Process");

    v0 = CFSTR("Monitor New Process");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessDialogMessage()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsAddProcessDialogMessage_str;
  if (!HTUIInternalTerminationsAddProcessDialogMessage_str)
  {
    HTUIInternalTerminationsAddProcessDialogMessage_str = (uint64_t)CFSTR("Enter the exact name of the process.");

    v0 = CFSTR("Enter the exact name of the process.");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessDialogConfirmation()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsAddProcessDialogConfirmation_str;
  if (!HTUIInternalTerminationsAddProcessDialogConfirmation_str)
  {
    HTUIInternalTerminationsAddProcessDialogConfirmation_str = (uint64_t)CFSTR("Monitor");

    v0 = CFSTR("Monitor");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsAddProcessPlaceholder()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsAddProcessPlaceholder_str;
  if (!HTUIInternalTerminationsAddProcessPlaceholder_str)
  {
    HTUIInternalTerminationsAddProcessPlaceholder_str = (uint64_t)CFSTR("contactsd");

    v0 = CFSTR("contactsd");
  }
  return v0;
}

uint64_t HTUIInternalTerminationsAddProcessConfirmationTitle(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("Do you want to start monitoring “%@”?"), a1);
}

__CFString *HTUIInternalTerminationsAddProcessConfirmationMessage()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsAddProcessConfirmationMessage_str;
  if (!HTUIInternalTerminationsAddProcessConfirmationMessage_str)
  {
    HTUIInternalTerminationsAddProcessConfirmationMessage_str = (uint64_t)CFSTR("Make sure the name is correct. This process does not seem to be currently running.");

    v0 = CFSTR("Make sure the name is correct. This process does not seem to be currently running.");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsNoProcessesFooter()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsNoProcessesFooter_str;
  if (!HTUIInternalTerminationsNoProcessesFooter_str)
  {
    HTUIInternalTerminationsNoProcessesFooter_str = (uint64_t)CFSTR("Select processes to start monitoring terminations.");

    v0 = CFSTR("Select processes to start monitoring terminations.");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsRemoveProcessSwipeTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsRemoveProcessSwipeTitle_str;
  if (!HTUIInternalTerminationsRemoveProcessSwipeTitle_str)
  {
    HTUIInternalTerminationsRemoveProcessSwipeTitle_str = (uint64_t)CFSTR("Stop Monitoring");

    v0 = CFSTR("Stop Monitoring");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsRemoveProcessMenuTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsRemoveProcessMenuTitle_str;
  if (!HTUIInternalTerminationsRemoveProcessMenuTitle_str)
  {
    HTUIInternalTerminationsRemoveProcessMenuTitle_str = (uint64_t)CFSTR("Stop Monitoring");

    v0 = CFSTR("Stop Monitoring");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsReasonsTitle()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsReasonsTitle_str;
  if (!HTUIInternalTerminationsReasonsTitle_str)
  {
    HTUIInternalTerminationsReasonsTitle_str = (uint64_t)CFSTR("Monitored Exit Reasons");

    v0 = CFSTR("Monitored Exit Reasons");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsSelectAllButton()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsSelectAllButton_str;
  if (!HTUIInternalTerminationsSelectAllButton_str)
  {
    HTUIInternalTerminationsSelectAllButton_str = (uint64_t)CFSTR("Select All");

    v0 = CFSTR("Select All");
  }
  return v0;
}

__CFString *HTUIInternalTerminationsUnselectAllButton()
{
  __CFString *v0;

  v0 = (__CFString *)HTUIInternalTerminationsUnselectAllButton_str;
  if (!HTUIInternalTerminationsUnselectAllButton_str)
  {
    HTUIInternalTerminationsUnselectAllButton_str = (uint64_t)CFSTR("Unselect All");

    v0 = CFSTR("Unselect All");
  }
  return v0;
}

uint64_t HTUIAsteriskedRangeFromString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "localizedStandardRangeOfString:", CFSTR("*"));
  if (objc_msgSend(v1, "length") <= (unint64_t)(v2 + 1))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(v1, "substringFromIndex:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "localizedStandardRangeOfString:", CFSTR("*"));

    if (v2 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0x7FFFFFFFFFFFFFFFLL)
      v2 = 0;
  }

  return v2;
}

__CFString *exitNamespaceString(unsigned int a1)
{
  if (a1 < 0x2A)
    return off_250E63580[(char)a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitNamespaceDisplayString(unsigned int a1)
{
  char v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    v3 = off_250E636D0[v1];
  }
  else
  {
    exitNamespaceString(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceSignal(uint64_t a1)
{
  if ((a1 - 1) < 0x1F)
    return off_250E63800[(int)a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SIG%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonStringForNamespaceJetsam(uint64_t a1)
{
  if (a1 < 0x10)
    return off_250E638F8[(int)a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceJetsam(uint64_t a1)
{
  int v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 2;
  if ((a1 - 2) < 0xE && ((0x2655u >> v1) & 1) != 0)
  {
    v3 = off_250E63978[v1];
  }
  else
  {
    exitReasonStringForNamespaceJetsam(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceSpringBoard(uint64_t a1)
{
  __CFString *v1;

  if (a1 > 3221229822)
  {
    if (a1 <= 3306925314)
    {
      switch(a1)
      {
        case 3221229823:
          return CFSTR("thermal pressure");
        case 3306925313:
          return CFSTR("cpu violation");
        case 3306925314:
          return CFSTR("walltime violation");
      }
    }
    else if (a1 > 3735943696)
    {
      if (a1 == 3735943697)
        return CFSTR("user quit");
      if (a1 == 4227595259)
        return CFSTR("force quit");
    }
    else
    {
      if (a1 == 3306925315)
        return CFSTR("system busy");
      if (a1 == 3735883980)
        return CFSTR("resource exclusion");
    }
    goto LABEL_36;
  }
  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101:
        return CFSTR("application assertion");
      case 439025681:
        return CFSTR("input ui scene");
      case 732775916:
        return CFSTR("secure draw violation");
    }
    goto LABEL_36;
  }
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
      return CFSTR("legacy clear the board");
    if (a1 == 2343432205)
      return CFSTR("watchdog");
    goto LABEL_36;
  }
  if (a1 == 1539435073)
    return CFSTR("languages changed");
  if (a1 != 1539435076)
  {
LABEL_36:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%#llx"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("clear the board");
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceSpringBoard(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      v1 = CFSTR("Legacy Clear the Board");
      return v1;
    }
    if (a1 == 3306925313)
    {
      v1 = CFSTR("CPU Violation");
      return v1;
    }
LABEL_8:
    exitReasonStringForNamespaceSpringBoard(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v1;
  }
  if (a1 == 439025681)
  {
    v1 = CFSTR("InputUI Scene");
    return v1;
  }
  if (a1 != 1539435076)
    goto LABEL_8;
  v1 = CFSTR("Clear the Board");
  return v1;
}

__CFString *exitReasonStringForNamespaceCodeSigning(uint64_t a1)
{
  if ((a1 - 1) < 4)
    return off_250E639E8[(int)a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id exitReasonDisplayStringForNamespaceCodeSigning(uint64_t a1)
{
  void *v1;
  void *v2;

  exitReasonStringForNamespaceCodeSigning(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "capitalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *exitReasonStringForNamespaceExec(uint64_t a1)
{
  if ((a1 - 1) < 0x13)
    return off_250E63A08[(int)a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceExec(uint64_t a1)
{
  int v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 1;
  if ((a1 - 1) < 0x13 && ((0x55F7Fu >> v1) & 1) != 0)
  {
    v3 = off_250E63AA0[v1];
  }
  else
  {
    exitReasonStringForNamespaceExec(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceGuard(uint64_t a1)
{
  if ((a1 - 1) < 5)
    return off_250E63B38[(int)a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceGuard(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if ((_DWORD)a1 == 5)
  {
    v1 = CFSTR("JIT");
  }
  else
  {
    exitReasonStringForNamespaceGuard(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

__CFString *exitReasonStringForNamespaceLibXPC(uint64_t a1)
{
  if ((a1 - 1) < 9)
    return off_250E63B60[(int)a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceLibXPC(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  switch((_DWORD)a1)
  {
    case 2:
      v1 = CFSTR("Unknown IPC");
      break;
    case 6:
      v1 = CFSTR("Sandbox Filtered IPC");
      break;
    case 4:
      v1 = CFSTR("SIGTERM Timeout");
      break;
    default:
      exitReasonStringForNamespaceLibXPC(a1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "capitalizedString");
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v1;
}

__CFString *exitReasonStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 9 && ((0x17Fu >> v1) & 1) != 0)
  {
    v2 = off_250E63BA8[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 7 && ((0x47u >> v1) & 1) != 0)
  {
    v3 = off_250E63BF0[v1];
  }
  else
  {
    exitReasonStringForNamespaceDYLD(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceRunningBoard(uint64_t a1)
{
  __CFString *v1;

  if (a1 <= 2343432204)
  {
    if (a1 <= 562215633)
    {
      if (a1)
      {
        if (a1 == 97132013)
        {
          return CFSTR("conditions changed");
        }
        else
        {
          if (a1 != 562215597)
            goto LABEL_37;
          return CFSTR("assertion timeout");
        }
      }
      else
      {
        return CFSTR("none");
      }
    }
    else if (a1 > 562215635)
    {
      if (a1 == 562215636)
      {
        return CFSTR("background fetch completion timeout");
      }
      else
      {
        if (a1 != 732775916)
          goto LABEL_37;
        return CFSTR("security violation");
      }
    }
    else if (a1 == 562215634)
    {
      return CFSTR("background task assertion timeout");
    }
    else
    {
      return CFSTR("background url session completion timeout");
    }
  }
  else if (a1 > 3490524076)
  {
    if (a1 > 3735905537)
    {
      if (a1 == 3735905538)
      {
        return CFSTR("termination assertion");
      }
      else
      {
        if (a1 != 3735943697)
          goto LABEL_37;
        return CFSTR("user initiated quit");
      }
    }
    else if (a1 == 3490524077)
    {
      return CFSTR("max assertions violation");
    }
    else
    {
      if (a1 != 3735883980)
        goto LABEL_37;
      return CFSTR("resource exclusion");
    }
  }
  else if (a1 > 2970726672)
  {
    if (a1 == 2970726673)
    {
      return CFSTR("process exited");
    }
    else
    {
      if (a1 != 3221229823)
        goto LABEL_37;
      return CFSTR("thermal pressure");
    }
  }
  else
  {
    if (a1 != 2343432205)
    {
      if (a1 == 2970405393)
      {
        v1 = CFSTR("max states violation");
        return v1;
      }
LABEL_37:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%#llx"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v1;
    }
    return CFSTR("watchdog violation");
  }
}

__CFString *exitReasonDisplayStringForNamespaceRunningBoard(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 <= 2970405392)
  {
    if (!a1)
    {
      v1 = CFSTR("None Provided");
      return v1;
    }
    if (a1 == 562215635)
    {
      v1 = CFSTR("Background URL Session Completion Timeout");
      return v1;
    }
LABEL_12:
    exitReasonStringForNamespaceRunningBoard(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v1;
  }
  if (a1 == 2970405393)
  {
    v1 = CFSTR("Maximum States Violation");
    return v1;
  }
  if (a1 == 3490524077)
  {
    v1 = CFSTR("Maximum Assertions Violation");
    return v1;
  }
  if (a1 != 3735943697)
    goto LABEL_12;
  v1 = CFSTR("User-Initiated Quit");
  return v1;
}

__CFString *exitReasonStringForNamespaceLibSystem(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5)
    return off_250E63C28[a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceLibSystem(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1) & 1) != 0)
  {
    v3 = off_250E63C50[v1];
  }
  else
  {
    exitReasonStringForNamespaceLibSystem(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceEndpointSecurity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_250E63C78[a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id exitReasonDisplayStringForNamespaceEndpointSecurity(uint64_t a1)
{
  void *v1;
  void *v2;

  exitReasonStringForNamespaceEndpointSecurity(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "capitalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *exitReasonStringForNamespaceWatchdog(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 1:
      return CFSTR("service timeout");
    case 1001:
      return CFSTR("chronokit");
    case 2:
      v1 = CFSTR("timeout no diags");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceWatchdog(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 == 2)
  {
    v1 = CFSTR("Service Timeout Diagnostics Unavailable");
  }
  else if (a1 == 1001)
  {
    v1 = CFSTR("ChronoKit");
  }
  else
  {
    exitReasonStringForNamespaceWatchdog(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

__CFString *exitReasonStringForNamespaceWatchKit(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("api violation");
  if (a1 == 2)
  {
    v1 = CFSTR("internal error");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceWatchKit(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 == 1)
  {
    v1 = CFSTR("API Violation");
  }
  else
  {
    exitReasonStringForNamespaceWatchKit(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

__CFString *exitReasonStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 0x15 && ((0x183FFFu >> v1) & 1) != 0)
  {
    v2 = off_250E63C90[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 11;
  if ((unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1) & 1) != 0)
  {
    v3 = off_250E63D38[v1];
  }
  else
  {
    exitReasonStringForNamespaceBacklightServices(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id exitReasonString(int a1, uint64_t a2)
{
  void *v2;

  switch(a1)
  {
    case 1:
      exitReasonStringForNamespaceJetsam(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      exitReasonStringForNamespaceSignal(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      exitReasonStringForNamespaceCodeSigning(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      exitReasonStringForNamespaceDYLD(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      exitReasonStringForNamespaceLibXPC(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      exitReasonStringForNamespaceExec(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      exitReasonStringForNamespaceSpringBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      exitReasonStringForNamespaceRunningBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      exitReasonDisplayStringForNamespaceLibSystem(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      exitReasonStringForNamespaceWatchdog(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      exitReasonStringForNamespaceWatchKit(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      exitReasonStringForNamespaceGuard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      exitReasonStringForNamespaceEndpointSecurity(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      exitReasonStringForNamespaceBacklightServices(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

id exitReasonDisplayString(int a1, uint64_t a2)
{
  void *v2;

  switch(a1)
  {
    case 1:
      exitReasonDisplayStringForNamespaceJetsam(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      exitReasonStringForNamespaceSignal(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      exitReasonDisplayStringForNamespaceCodeSigning(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      exitReasonDisplayStringForNamespaceDYLD(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      exitReasonDisplayStringForNamespaceLibXPC(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      exitReasonDisplayStringForNamespaceExec(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      exitReasonDisplayStringForNamespaceSpringBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      exitReasonDisplayStringForNamespaceRunningBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      exitReasonDisplayStringForNamespaceLibSystem(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      exitReasonDisplayStringForNamespaceWatchdog(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      exitReasonDisplayStringForNamespaceWatchKit(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      exitReasonDisplayStringForNamespaceGuard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      exitReasonDisplayStringForNamespaceEndpointSecurity(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      exitReasonDisplayStringForNamespaceBacklightServices(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%#llx"), a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

char *HTDeveloperSettings.availableThresholdsValues.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_availableThresholdsValues);
  sub_23DA4C788();
  v2 = sub_23DA524C4();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = sub_23DA52500();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = sub_23DA4C7C4(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x242638F3C](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_integerValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        sub_23DA4C7C4((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_QWORD *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

unint64_t sub_23DA4C788()
{
  unint64_t result;

  result = qword_256CD5E48;
  if (!qword_256CD5E48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CD5E48);
  }
  return result;
}

char *sub_23DA4C7C4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23DA4C7E0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23DA4C7E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CD5E50);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242639464]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t HTTerminationReason.displayName.getter(unint64_t a1)
{
  __CFString *v1;
  uint64_t v2;

  v1 = HTTerminationReasonDisplayName(a1);
  v2 = sub_23DA524AC();

  return v2;
}

uint64_t HTTerminationReason.subReasons.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void (*v34)(uint64_t);
  unint64_t *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;

  v1 = MEMORY[0x24BEE4AF8];
  if (a1 >= 0x8000)
  {
    if (a1 < 0x400000)
    {
      switch(a1)
      {
        case 0x8000:
          swift_beginAccess();
          v49 = qword_256CD5EC0;
          swift_beginAccess();
          v3 = (char *)MEMORY[0x24BEE4AF8];
          do
          {
            while (1)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6380);
              v51 = *((_QWORD *)v3 + 2);
              v50 = *((_QWORD *)v3 + 3);
              if (v51 >= v50 >> 1)
                v3 = sub_23DA50514((char *)(v50 > 1), v51 + 1, 1, v3, &qword_256CD6380);
              *((_QWORD *)v3 + 2) = v51 + 1;
              *(_QWORD *)&v3[8 * v51 + 32] = v49;
              v52 = 2 * v49;
              if ((unint64_t)qword_256CD5EC8 >= 0x40)
                break;
              v49 *= 2;
              if (1 << qword_256CD5EC8 < v52)
                goto LABEL_166;
            }
            v49 = 0;
          }
          while (!v52);
LABEL_166:
          v34 = type metadata accessor for HTRunningBoardTerminationReason;
          v35 = (unint64_t *)&unk_256CD5F60;
          v36 = &protocol conformance descriptor for HTRunningBoardTerminationReason;
          goto LABEL_170;
        case 0x40000:
          swift_beginAccess();
          v53 = qword_256CD5ED0;
          swift_beginAccess();
          v3 = (char *)MEMORY[0x24BEE4AF8];
          do
          {
            while (1)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6388);
              v55 = *((_QWORD *)v3 + 2);
              v54 = *((_QWORD *)v3 + 3);
              if (v55 >= v54 >> 1)
                v3 = sub_23DA50514((char *)(v54 > 1), v55 + 1, 1, v3, &qword_256CD6388);
              *((_QWORD *)v3 + 2) = v55 + 1;
              *(_QWORD *)&v3[8 * v55 + 32] = v53;
              v56 = 2 * v53;
              if ((unint64_t)qword_256CD5ED8 >= 0x40)
                break;
              v53 *= 2;
              if (1 << qword_256CD5ED8 < v56)
                goto LABEL_167;
            }
            v53 = 0;
          }
          while (!v56);
LABEL_167:
          v34 = type metadata accessor for HTLibSystemTerminationReason;
          v35 = (unint64_t *)&unk_256CD5F58;
          v36 = &protocol conformance descriptor for HTLibSystemTerminationReason;
          goto LABEL_170;
        case 0x100000:
          swift_beginAccess();
          v15 = qword_256CD5EE0;
          swift_beginAccess();
          v3 = (char *)MEMORY[0x24BEE4AF8];
          do
          {
            while (1)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6390);
              v17 = *((_QWORD *)v3 + 2);
              v16 = *((_QWORD *)v3 + 3);
              v18 = v17 + 1;
              if (v17 >= v16 >> 1)
                v3 = sub_23DA50514((char *)(v16 > 1), v17 + 1, 1, v3, &qword_256CD6390);
              *((_QWORD *)v3 + 2) = v18;
              *(_QWORD *)&v3[8 * v17 + 32] = v15;
              v19 = 2 * v15;
              if ((unint64_t)qword_256CD5EE8 >= 0x40)
                break;
              v15 *= 2;
              if (1 << qword_256CD5EE8 < v19)
                goto LABEL_133;
            }
            v15 = 0;
          }
          while (!v19);
LABEL_133:
          v57 = *((_QWORD *)v3 + 3);
          if (v18 >= v57 >> 1)
            v3 = sub_23DA50514((char *)(v57 > 1), v17 + 2, 1, v3, &qword_256CD6390);
          *((_QWORD *)v3 + 2) = v17 + 2;
          *(_QWORD *)&v3[8 * v18 + 32] = 0x100000;
          v34 = type metadata accessor for HTWatchdogTerminationReason;
          v35 = (unint64_t *)&unk_256CD5F50;
          v36 = &protocol conformance descriptor for HTWatchdogTerminationReason;
          goto LABEL_170;
      }
    }
    else if (a1 > 0x7FFFFFF)
    {
      if (a1 == 0x8000000)
      {
        swift_beginAccess();
        v62 = qword_256CD5F10;
        swift_beginAccess();
        v3 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD63A8);
            v64 = *((_QWORD *)v3 + 2);
            v63 = *((_QWORD *)v3 + 3);
            if (v64 >= v63 >> 1)
              v3 = sub_23DA50514((char *)(v63 > 1), v64 + 1, 1, v3, &qword_256CD63A8);
            *((_QWORD *)v3 + 2) = v64 + 1;
            *(_QWORD *)&v3[8 * v64 + 32] = v62;
            v65 = 2 * v62;
            if ((unint64_t)qword_256CD5F18 >= 0x40)
              break;
            v62 *= 2;
            if (1 << qword_256CD5F18 < v65)
              goto LABEL_169;
          }
          v62 = 0;
        }
        while (!v65);
LABEL_169:
        v34 = type metadata accessor for HTEndpointSecurityTerminationReason;
        v35 = (unint64_t *)&unk_256CD5F38;
        v36 = &protocol conformance descriptor for HTEndpointSecurityTerminationReason;
        goto LABEL_170;
      }
      if (a1 == 0x100000000)
      {
        swift_beginAccess();
        v24 = qword_256CD5F20;
        swift_beginAccess();
        v3 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD63B0);
            v26 = *((_QWORD *)v3 + 2);
            v25 = *((_QWORD *)v3 + 3);
            v27 = v26 + 1;
            if (v26 >= v25 >> 1)
              v3 = sub_23DA50514((char *)(v25 > 1), v26 + 1, 1, v3, &qword_256CD63B0);
            *((_QWORD *)v3 + 2) = v27;
            *(_QWORD *)&v3[8 * v26 + 32] = v24;
            v28 = 2 * v24;
            if ((unint64_t)qword_256CD5F28 >= 0x40)
              break;
            v24 *= 2;
            if (1 << qword_256CD5F28 < v28)
              goto LABEL_155;
          }
          v24 = 0;
        }
        while (!v28);
LABEL_155:
        v66 = *((_QWORD *)v3 + 3);
        v67 = v26 + 2;
        if (v27 >= v66 >> 1)
          v3 = sub_23DA50514((char *)(v66 > 1), v26 + 2, 1, v3, &qword_256CD63B0);
        *((_QWORD *)v3 + 2) = v67;
        *(_QWORD *)&v3[8 * v27 + 32] = 0x100000;
        v68 = *((_QWORD *)v3 + 3);
        if ((uint64_t)(v26 + 3) > (uint64_t)(v68 >> 1))
          v3 = sub_23DA50514((char *)(v68 > 1), v26 + 3, 1, v3, &qword_256CD63B0);
        *((_QWORD *)v3 + 2) = v26 + 3;
        *(_QWORD *)&v3[8 * v67 + 32] = 0x200000;
        v34 = type metadata accessor for HTBacklightServicesTerminationReason;
        v35 = (unint64_t *)&unk_256CD5F30;
        v36 = &protocol conformance descriptor for HTBacklightServicesTerminationReason;
        goto LABEL_170;
      }
    }
    else
    {
      if (a1 == 0x400000)
      {
        swift_beginAccess();
        v37 = qword_256CD5EF0;
        swift_beginAccess();
        v3 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6398);
            v39 = *((_QWORD *)v3 + 2);
            v38 = *((_QWORD *)v3 + 3);
            if (v39 >= v38 >> 1)
              v3 = sub_23DA50514((char *)(v38 > 1), v39 + 1, 1, v3, &qword_256CD6398);
            *((_QWORD *)v3 + 2) = v39 + 1;
            *(_QWORD *)&v3[8 * v39 + 32] = v37;
            v40 = 2 * v37;
            if ((unint64_t)qword_256CD5EF8 >= 0x40)
              break;
            v37 *= 2;
            if (1 << qword_256CD5EF8 < v40)
              goto LABEL_163;
          }
          v37 = 0;
        }
        while (!v40);
LABEL_163:
        v34 = type metadata accessor for HTWatchKitTerminationReason;
        v35 = (unint64_t *)&unk_256CD5F48;
        v36 = &protocol conformance descriptor for HTWatchKitTerminationReason;
        goto LABEL_170;
      }
      if (a1 == 0x800000)
      {
        swift_beginAccess();
        v7 = qword_256CD5F00;
        swift_beginAccess();
        v3 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD63A0);
            v9 = *((_QWORD *)v3 + 2);
            v8 = *((_QWORD *)v3 + 3);
            if (v9 >= v8 >> 1)
              v3 = sub_23DA50514((char *)(v8 > 1), v9 + 1, 1, v3, &qword_256CD63A0);
            *((_QWORD *)v3 + 2) = v9 + 1;
            *(_QWORD *)&v3[8 * v9 + 32] = v7;
            v10 = 2 * v7;
            if ((unint64_t)qword_256CD5F08 >= 0x40)
              break;
            v7 *= 2;
            if (1 << qword_256CD5F08 < v10)
              goto LABEL_93;
          }
          v7 = 0;
        }
        while (!v10);
LABEL_93:
        v34 = type metadata accessor for HTGuardTerminationReason;
        v35 = (unint64_t *)&unk_256CD5F40;
        v36 = &protocol conformance descriptor for HTGuardTerminationReason;
        goto LABEL_170;
      }
    }
  }
  else if (a1 <= 63)
  {
    switch(a1)
    {
      case 2:
        swift_beginAccess();
        v3 = (char *)MEMORY[0x24BEE4AF8];
        v41 = qword_256CD5E58;
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6348);
            v43 = *((_QWORD *)v3 + 2);
            v42 = *((_QWORD *)v3 + 3);
            if (v43 >= v42 >> 1)
              v3 = sub_23DA50514((char *)(v42 > 1), v43 + 1, 1, v3, &qword_256CD6348);
            *((_QWORD *)v3 + 2) = v43 + 1;
            *(_QWORD *)&v3[8 * v43 + 32] = v41;
            if (qword_256CD66F0 != -1)
              swift_once();
            v44 = 2 * v41;
            swift_beginAccess();
            if ((unint64_t)qword_256CD66F8 >= 0x40)
              break;
            v41 *= 2;
            if (1 << qword_256CD66F8 < v44)
              goto LABEL_164;
          }
          v41 = 0;
        }
        while (!v44);
LABEL_164:
        v34 = type metadata accessor for HTJetsamTerminationReason;
        v35 = (unint64_t *)&unk_256CD5F98;
        v36 = &protocol conformance descriptor for HTJetsamTerminationReason;
        goto LABEL_170;
      case 4:
        swift_beginAccess();
        v45 = qword_256CD5E60;
        swift_beginAccess();
        v3 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6350);
            v47 = *((_QWORD *)v3 + 2);
            v46 = *((_QWORD *)v3 + 3);
            if (v47 >= v46 >> 1)
              v3 = sub_23DA50514((char *)(v46 > 1), v47 + 1, 1, v3, &qword_256CD6350);
            *((_QWORD *)v3 + 2) = v47 + 1;
            *(_QWORD *)&v3[8 * v47 + 32] = v45;
            v48 = 2 * v45;
            if ((unint64_t)qword_256CD5E68 >= 0x40)
              break;
            v45 *= 2;
            if (1 << qword_256CD5E68 < v48)
              goto LABEL_165;
          }
          v45 = 0;
        }
        while (!v48);
LABEL_165:
        v34 = type metadata accessor for HTSignalTerminationReason;
        v35 = (unint64_t *)&unk_256CD5F90;
        v36 = &protocol conformance descriptor for HTSignalTerminationReason;
        goto LABEL_170;
      case 8:
        swift_beginAccess();
        v11 = qword_256CD5E70;
        swift_beginAccess();
        v3 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          while (1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6358);
            v13 = *((_QWORD *)v3 + 2);
            v12 = *((_QWORD *)v3 + 3);
            if (v13 >= v12 >> 1)
              v3 = sub_23DA50514((char *)(v12 > 1), v13 + 1, 1, v3, &qword_256CD6358);
            *((_QWORD *)v3 + 2) = v13 + 1;
            *(_QWORD *)&v3[8 * v13 + 32] = v11;
            v14 = 2 * v11;
            if ((unint64_t)qword_256CD5E78 >= 0x40)
              break;
            v11 *= 2;
            if (1 << qword_256CD5E78 < v14)
              goto LABEL_114;
          }
          v11 = 0;
        }
        while (!v14);
LABEL_114:
        v34 = type metadata accessor for HTCodeSigningTerminationReason;
        v35 = (unint64_t *)&unk_256CD5F88;
        v36 = &protocol conformance descriptor for HTCodeSigningTerminationReason;
        goto LABEL_170;
    }
  }
  else if (a1 > 511)
  {
    if (a1 == 512)
    {
      swift_beginAccess();
      v58 = qword_256CD5EA0;
      swift_beginAccess();
      v3 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6370);
          v60 = *((_QWORD *)v3 + 2);
          v59 = *((_QWORD *)v3 + 3);
          if (v60 >= v59 >> 1)
            v3 = sub_23DA50514((char *)(v59 > 1), v60 + 1, 1, v3, &qword_256CD6370);
          *((_QWORD *)v3 + 2) = v60 + 1;
          *(_QWORD *)&v3[8 * v60 + 32] = v58;
          v61 = 2 * v58;
          if ((unint64_t)qword_256CD5EA8 >= 0x40)
            break;
          v58 *= 2;
          if (1 << qword_256CD5EA8 < v61)
            goto LABEL_168;
        }
        v58 = 0;
      }
      while (!v61);
LABEL_168:
      v34 = type metadata accessor for HTExecTerminationReason;
      v35 = (unint64_t *)&unk_256CD5F70;
      v36 = &protocol conformance descriptor for HTExecTerminationReason;
      goto LABEL_170;
    }
    if (a1 == 1024)
    {
      swift_beginAccess();
      v20 = qword_256CD5EB0;
      swift_beginAccess();
      v3 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6378);
          v22 = *((_QWORD *)v3 + 2);
          v21 = *((_QWORD *)v3 + 3);
          if (v22 >= v21 >> 1)
            v3 = sub_23DA50514((char *)(v21 > 1), v22 + 1, 1, v3, &qword_256CD6378);
          *((_QWORD *)v3 + 2) = v22 + 1;
          *(_QWORD *)&v3[8 * v22 + 32] = v20;
          v23 = 2 * v20;
          if ((unint64_t)qword_256CD5EB8 >= 0x40)
            break;
          v20 *= 2;
          if (1 << qword_256CD5EB8 < v23)
            goto LABEL_145;
        }
        v20 = 0;
      }
      while (!v23);
LABEL_145:
      v34 = type metadata accessor for HTSpringBoardTerminationReason;
      v35 = (unint64_t *)&unk_256CD5F68;
      v36 = &protocol conformance descriptor for HTSpringBoardTerminationReason;
      goto LABEL_170;
    }
  }
  else
  {
    if (a1 == 64)
    {
      swift_beginAccess();
      v29 = qword_256CD5E80;
      swift_beginAccess();
      v3 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6360);
          v31 = *((_QWORD *)v3 + 2);
          v30 = *((_QWORD *)v3 + 3);
          v32 = v31 + 1;
          if (v31 >= v30 >> 1)
            v3 = sub_23DA50514((char *)(v30 > 1), v31 + 1, 1, v3, &qword_256CD6360);
          *((_QWORD *)v3 + 2) = v32;
          *(_QWORD *)&v3[8 * v31 + 32] = v29;
          v33 = 2 * v29;
          if ((unint64_t)qword_256CD5E88 >= 0x40)
            break;
          v29 *= 2;
          if (1 << qword_256CD5E88 < v33)
            goto LABEL_160;
        }
        v29 = 0;
      }
      while (!v33);
LABEL_160:
      v69 = *((_QWORD *)v3 + 3);
      if (v32 >= v69 >> 1)
        v3 = sub_23DA50514((char *)(v69 > 1), v31 + 2, 1, v3, &qword_256CD6360);
      *((_QWORD *)v3 + 2) = v31 + 2;
      *(_QWORD *)&v3[8 * v32 + 32] = 512;
      v34 = type metadata accessor for HTDYLDTerminationReason;
      v35 = (unint64_t *)&unk_256CD5F80;
      v36 = &protocol conformance descriptor for HTDYLDTerminationReason;
      goto LABEL_170;
    }
    if (a1 == 128)
    {
      swift_beginAccess();
      v2 = qword_256CD5E90;
      swift_beginAccess();
      v3 = (char *)MEMORY[0x24BEE4AF8];
      do
      {
        while (1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v3 = sub_23DA50514(0, *((_QWORD *)v3 + 2) + 1, 1, v3, &qword_256CD6368);
          v5 = *((_QWORD *)v3 + 2);
          v4 = *((_QWORD *)v3 + 3);
          if (v5 >= v4 >> 1)
            v3 = sub_23DA50514((char *)(v4 > 1), v5 + 1, 1, v3, &qword_256CD6368);
          *((_QWORD *)v3 + 2) = v5 + 1;
          *(_QWORD *)&v3[8 * v5 + 32] = v2;
          v6 = 2 * v2;
          if ((unint64_t)qword_256CD5E98 >= 0x40)
            break;
          v2 *= 2;
          if (1 << qword_256CD5E98 < v6)
            goto LABEL_83;
        }
        v2 = 0;
      }
      while (!v6);
LABEL_83:
      v34 = type metadata accessor for HTLibXPCTerminationReason;
      v35 = (unint64_t *)&unk_256CD5F78;
      v36 = &protocol conformance descriptor for HTLibXPCTerminationReason;
LABEL_170:
      v1 = sub_23DA4DBEC((uint64_t)v3, (uint64_t (*)(uint64_t))v34, v35, (uint64_t)v36);
      swift_bridgeObjectRelease();
    }
  }
  return v1;
}

uint64_t static HTTerminationSubReason.allCases.getter(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t, _QWORD *);
  _QWORD *v12;
  uint64_t (*v13)(uint64_t, _QWORD *);
  void (*v14)(char *, char *, uint64_t);
  unint64_t v15;
  void (*v16)(char *, uint64_t);
  unint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v19 - v9;
  v23 = sub_23DA524A0();
  v11 = (void (*)(uint64_t, _QWORD *))a2[3];
  v20 = v2;
  v11(a1, a2);
  v19[1] = a2[1];
  sub_23DA524B8();
  v12 = a2;
  v13 = (uint64_t (*)(uint64_t, _QWORD *))a2[4];
  v14 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v14(v8, v10, a1);
  while (1)
  {
    sub_23DA524DC();
    sub_23DA524D0();
    v15 = 2 * v22;
    v21 = 2 * v22;
    v22 *= 2;
    sub_23DA5250C();
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v10, a1);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v8, a1);
    v17 = v13(a1, v12);
    if (v17 <= 0x3F)
      break;
    if (v15)
      goto LABEL_6;
LABEL_3:
    v14(v8, v10, a1);
  }
  if (1 << v17 >= v15)
    goto LABEL_3;
LABEL_6:
  v16(v10, a1);
  return v23;
}

uint64_t sub_23DA4DBEC(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_23DA50608(0, v4, 0);
    v5 = v19;
    v10 = (uint64_t *)(a1 + 32);
    do
    {
      v12 = *v10++;
      v11 = v12;
      v19 = v5;
      v14 = *(_QWORD *)(v5 + 16);
      v13 = *(_QWORD *)(v5 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_23DA50608((_QWORD *)(v13 > 1), v14 + 1, 1);
        v5 = v19;
      }
      v17 = a2(0);
      v18 = sub_23DA50DC0(a3, a2, a4);
      *(_QWORD *)&v16 = v11;
      *(_QWORD *)(v5 + 16) = v14 + 1;
      sub_23DA51F20(&v16, v5 + 40 * v14 + 32);
      --v4;
    }
    while (v4);
  }
  return v5;
}

char *static HTDYLDTerminationReason.allCases.getter()
{
  return sub_23DA50A7C(&qword_256CD5E80, &qword_256CD5E88, &qword_256CD6360, 512);
}

char *static HTWatchdogTerminationReason.allCases.getter()
{
  return sub_23DA50A7C(&qword_256CD5EE0, &qword_256CD5EE8, &qword_256CD6390, 0x100000);
}

double HTTerminationReason.trackedSubReasons.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  unint64_t *v8;
  void *v9;
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
  uint64_t v22;
  double result;

  v4 = objc_msgSend(objc_allocWithZone((Class)HTProcessTerminationSettings), sel_init);
  v5 = objc_msgSend(v4, sel_trackedSubReasonsForReason_, a1);

  if (a1 >= 0x8000)
  {
    if (a1 < 0x400000)
    {
      switch(a1)
      {
        case 0x8000:
          type metadata accessor for HTRunningBoardTerminationReason(0);
          v6 = type metadata accessor for HTRunningBoardTerminationReason;
          *(_QWORD *)(a2 + 24) = v19;
          v8 = (unint64_t *)&unk_256CD5F60;
          v9 = &protocol conformance descriptor for HTRunningBoardTerminationReason;
          goto LABEL_34;
        case 0x40000:
          type metadata accessor for HTLibSystemTerminationReason(0);
          v6 = type metadata accessor for HTLibSystemTerminationReason;
          *(_QWORD *)(a2 + 24) = v20;
          v8 = (unint64_t *)&unk_256CD5F58;
          v9 = &protocol conformance descriptor for HTLibSystemTerminationReason;
          goto LABEL_34;
        case 0x100000:
          type metadata accessor for HTWatchdogTerminationReason(0);
          v6 = type metadata accessor for HTWatchdogTerminationReason;
          *(_QWORD *)(a2 + 24) = v12;
          v8 = (unint64_t *)&unk_256CD5F50;
          v9 = &protocol conformance descriptor for HTWatchdogTerminationReason;
          goto LABEL_34;
      }
    }
    else if (a1 > 0x7FFFFFF)
    {
      if (a1 == 0x8000000)
      {
        type metadata accessor for HTEndpointSecurityTerminationReason(0);
        v6 = type metadata accessor for HTEndpointSecurityTerminationReason;
        *(_QWORD *)(a2 + 24) = v22;
        v8 = (unint64_t *)&unk_256CD5F38;
        v9 = &protocol conformance descriptor for HTEndpointSecurityTerminationReason;
        goto LABEL_34;
      }
      if (a1 == 0x100000000)
      {
        type metadata accessor for HTBacklightServicesTerminationReason(0);
        v6 = type metadata accessor for HTBacklightServicesTerminationReason;
        *(_QWORD *)(a2 + 24) = v14;
        v8 = (unint64_t *)&unk_256CD5F30;
        v9 = &protocol conformance descriptor for HTBacklightServicesTerminationReason;
        goto LABEL_34;
      }
    }
    else
    {
      if (a1 == 0x400000)
      {
        type metadata accessor for HTWatchKitTerminationReason(0);
        v6 = type metadata accessor for HTWatchKitTerminationReason;
        *(_QWORD *)(a2 + 24) = v16;
        v8 = (unint64_t *)&unk_256CD5F48;
        v9 = &protocol conformance descriptor for HTWatchKitTerminationReason;
        goto LABEL_34;
      }
      if (a1 == 0x800000)
      {
        type metadata accessor for HTGuardTerminationReason(0);
        v6 = type metadata accessor for HTGuardTerminationReason;
        *(_QWORD *)(a2 + 24) = v10;
        v8 = (unint64_t *)&unk_256CD5F40;
        v9 = &protocol conformance descriptor for HTGuardTerminationReason;
        goto LABEL_34;
      }
    }
  }
  else if (a1 <= 63)
  {
    switch(a1)
    {
      case 2:
        type metadata accessor for HTJetsamTerminationReason(0);
        v6 = type metadata accessor for HTJetsamTerminationReason;
        *(_QWORD *)(a2 + 24) = v17;
        v8 = (unint64_t *)&unk_256CD5F98;
        v9 = &protocol conformance descriptor for HTJetsamTerminationReason;
        goto LABEL_34;
      case 4:
        type metadata accessor for HTSignalTerminationReason(0);
        v6 = type metadata accessor for HTSignalTerminationReason;
        *(_QWORD *)(a2 + 24) = v18;
        v8 = (unint64_t *)&unk_256CD5F90;
        v9 = &protocol conformance descriptor for HTSignalTerminationReason;
        goto LABEL_34;
      case 8:
        type metadata accessor for HTCodeSigningTerminationReason(0);
        v6 = type metadata accessor for HTCodeSigningTerminationReason;
        *(_QWORD *)(a2 + 24) = v11;
        v8 = (unint64_t *)&unk_256CD5F88;
        v9 = &protocol conformance descriptor for HTCodeSigningTerminationReason;
        goto LABEL_34;
    }
  }
  else if (a1 > 511)
  {
    if (a1 == 512)
    {
      type metadata accessor for HTExecTerminationReason(0);
      v6 = type metadata accessor for HTExecTerminationReason;
      *(_QWORD *)(a2 + 24) = v21;
      v8 = (unint64_t *)&unk_256CD5F70;
      v9 = &protocol conformance descriptor for HTExecTerminationReason;
      goto LABEL_34;
    }
    if (a1 == 1024)
    {
      type metadata accessor for HTSpringBoardTerminationReason(0);
      v6 = type metadata accessor for HTSpringBoardTerminationReason;
      *(_QWORD *)(a2 + 24) = v13;
      v8 = (unint64_t *)&unk_256CD5F68;
      v9 = &protocol conformance descriptor for HTSpringBoardTerminationReason;
      goto LABEL_34;
    }
  }
  else
  {
    if (a1 == 64)
    {
      type metadata accessor for HTDYLDTerminationReason(0);
      v6 = type metadata accessor for HTDYLDTerminationReason;
      *(_QWORD *)(a2 + 24) = v15;
      v8 = (unint64_t *)&unk_256CD5F80;
      v9 = &protocol conformance descriptor for HTDYLDTerminationReason;
      goto LABEL_34;
    }
    if (a1 == 128)
    {
      type metadata accessor for HTLibXPCTerminationReason(0);
      v6 = type metadata accessor for HTLibXPCTerminationReason;
      *(_QWORD *)(a2 + 24) = v7;
      v8 = (unint64_t *)&unk_256CD5F78;
      v9 = &protocol conformance descriptor for HTLibXPCTerminationReason;
LABEL_34:
      *(_QWORD *)(a2 + 32) = sub_23DA50DC0(v8, (uint64_t (*)(uint64_t))v6, (uint64_t)v9);
      *(_QWORD *)a2 = v5;
      return result;
    }
  }
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

char *sub_23DA4E09C@<X0>(char **a1@<X8>)
{
  char *result;

  result = _sSo19HTTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

uint64_t static HTJetsamTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5E58;
}

uint64_t static HTJetsamTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E58 = a1;
  return result;
}

uint64_t (*static HTJetsamTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DA4E184()
{
  uint64_t result;

  result = HTTerminationSubReasonShiftingForReason(2);
  qword_256CD66F8 = result << 15;
  return result;
}

uint64_t static HTJetsamTerminationReason.lastCaseRawValue.getter()
{
  if (qword_256CD66F0 != -1)
    swift_once();
  swift_beginAccess();
  return qword_256CD66F8;
}

uint64_t static HTJetsamTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  if (qword_256CD66F0 != -1)
    swift_once();
  result = swift_beginAccess();
  qword_256CD66F8 = a1;
  return result;
}

uint64_t (*static HTJetsamTerminationReason.lastCaseRawValue.modify())()
{
  if (qword_256CD66F0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTJetsamTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 2uLL);
}

char *sub_23DA4E2F0@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA507FC();
  *a1 = result;
  return result;
}

uint64_t sub_23DA4E314(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 2uLL);
}

uint64_t sub_23DA4E31C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5E58;
  return result;
}

uint64_t sub_23DA4E364()
{
  if (qword_256CD66F0 != -1)
    swift_once();
  swift_beginAccess();
  return qword_256CD66F8;
}

uint64_t static HTSignalTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5E60;
}

uint64_t static HTSignalTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E60 = a1;
  return result;
}

uint64_t (*static HTSignalTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTSignalTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5E68;
}

uint64_t static HTSignalTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E68 = a1;
  return result;
}

uint64_t (*static HTSignalTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTSignalTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 4uLL);
}

char *sub_23DA4E55C@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5E60, &qword_256CD5E68, &qword_256CD6350);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4E598(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 4uLL);
}

uint64_t sub_23DA4E5A0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5E60;
  return result;
}

uint64_t sub_23DA4E5E8()
{
  swift_beginAccess();
  return qword_256CD5E68;
}

uint64_t static HTCodeSigningTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5E70;
}

uint64_t static HTCodeSigningTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E70 = a1;
  return result;
}

uint64_t (*static HTCodeSigningTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTCodeSigningTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5E78;
}

uint64_t static HTCodeSigningTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E78 = a1;
  return result;
}

uint64_t (*static HTCodeSigningTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTCodeSigningTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 8uLL);
}

char *sub_23DA4E7B8@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5E70, &qword_256CD5E78, &qword_256CD6358);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4E7F4(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 8uLL);
}

uint64_t sub_23DA4E7FC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5E70;
  return result;
}

uint64_t sub_23DA4E844()
{
  swift_beginAccess();
  return qword_256CD5E78;
}

uint64_t static HTDYLDTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5E80;
}

uint64_t static HTDYLDTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E80 = a1;
  return result;
}

uint64_t (*static HTDYLDTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTDYLDTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5E88;
}

uint64_t static HTDYLDTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E88 = a1;
  return result;
}

uint64_t (*static HTDYLDTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t HTDYLDTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x40uLL);
}

char *sub_23DA4EA18@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50A7C(&qword_256CD5E80, &qword_256CD5E88, &qword_256CD6360, 512);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4EA58(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x40uLL);
}

uint64_t sub_23DA4EA60@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5E80;
  return result;
}

uint64_t sub_23DA4EAA8()
{
  swift_beginAccess();
  return qword_256CD5E88;
}

uint64_t static HTLibXPCTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5E90;
}

uint64_t static HTLibXPCTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E90 = a1;
  return result;
}

uint64_t (*static HTLibXPCTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTLibXPCTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5E98;
}

uint64_t static HTLibXPCTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5E98 = a1;
  return result;
}

uint64_t (*static HTLibXPCTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTLibXPCTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x80uLL);
}

char *sub_23DA4EC78@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5E90, &qword_256CD5E98, &qword_256CD6368);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4ECB4(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x80uLL);
}

uint64_t sub_23DA4ECBC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5E90;
  return result;
}

uint64_t sub_23DA4ED04()
{
  swift_beginAccess();
  return qword_256CD5E98;
}

uint64_t static HTExecTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5EA0;
}

uint64_t static HTExecTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EA0 = a1;
  return result;
}

uint64_t (*static HTExecTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTExecTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5EA8;
}

uint64_t static HTExecTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EA8 = a1;
  return result;
}

uint64_t (*static HTExecTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTExecTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x200uLL);
}

char *sub_23DA4EED4@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5EA0, &qword_256CD5EA8, &qword_256CD6370);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4EF10(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x200uLL);
}

uint64_t sub_23DA4EF18@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5EA0;
  return result;
}

uint64_t sub_23DA4EF60()
{
  swift_beginAccess();
  return qword_256CD5EA8;
}

uint64_t static HTSpringBoardTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5EB0;
}

uint64_t static HTSpringBoardTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EB0 = a1;
  return result;
}

uint64_t (*static HTSpringBoardTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTSpringBoardTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5EB8;
}

uint64_t static HTSpringBoardTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EB8 = a1;
  return result;
}

uint64_t (*static HTSpringBoardTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTSpringBoardTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x400uLL);
}

char *sub_23DA4F130@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5EB0, &qword_256CD5EB8, &qword_256CD6378);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4F16C(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x400uLL);
}

uint64_t sub_23DA4F174@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5EB0;
  return result;
}

uint64_t sub_23DA4F1BC()
{
  swift_beginAccess();
  return qword_256CD5EB8;
}

uint64_t static HTRunningBoardTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5EC0;
}

uint64_t static HTRunningBoardTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EC0 = a1;
  return result;
}

uint64_t (*static HTRunningBoardTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTRunningBoardTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5EC8;
}

uint64_t static HTRunningBoardTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EC8 = a1;
  return result;
}

uint64_t (*static HTRunningBoardTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTRunningBoardTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x8000uLL);
}

char *sub_23DA4F38C@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5EC0, &qword_256CD5EC8, &qword_256CD6380);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4F3C8(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x8000uLL);
}

uint64_t sub_23DA4F3D0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5EC0;
  return result;
}

uint64_t sub_23DA4F418()
{
  swift_beginAccess();
  return qword_256CD5EC8;
}

uint64_t static HTLibSystemTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5ED0;
}

uint64_t static HTLibSystemTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5ED0 = a1;
  return result;
}

uint64_t (*static HTLibSystemTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTLibSystemTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5ED8;
}

uint64_t static HTLibSystemTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5ED8 = a1;
  return result;
}

uint64_t (*static HTLibSystemTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTLibSystemTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x40000uLL);
}

char *sub_23DA4F5E8@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5ED0, &qword_256CD5ED8, &qword_256CD6388);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4F624(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x40000uLL);
}

uint64_t sub_23DA4F62C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5ED0;
  return result;
}

uint64_t sub_23DA4F674()
{
  swift_beginAccess();
  return qword_256CD5ED8;
}

uint64_t static HTWatchdogTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5EE0;
}

uint64_t static HTWatchdogTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EE0 = a1;
  return result;
}

uint64_t (*static HTWatchdogTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTWatchdogTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5EE8;
}

uint64_t static HTWatchdogTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EE8 = a1;
  return result;
}

uint64_t (*static HTWatchdogTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTWatchdogTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x100000uLL);
}

char *sub_23DA4F844@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50A7C(&qword_256CD5EE0, &qword_256CD5EE8, &qword_256CD6390, 0x100000);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4F884(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x100000uLL);
}

uint64_t sub_23DA4F88C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5EE0;
  return result;
}

uint64_t sub_23DA4F8D4()
{
  swift_beginAccess();
  return qword_256CD5EE8;
}

uint64_t static HTWatchKitTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5EF0;
}

uint64_t static HTWatchKitTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EF0 = a1;
  return result;
}

uint64_t (*static HTWatchKitTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTWatchKitTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5EF8;
}

uint64_t static HTWatchKitTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5EF8 = a1;
  return result;
}

uint64_t (*static HTWatchKitTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTWatchKitTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x400000uLL);
}

char *sub_23DA4FAA4@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5EF0, &qword_256CD5EF8, &qword_256CD6398);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4FAE0(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x400000uLL);
}

uint64_t sub_23DA4FAE8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5EF0;
  return result;
}

uint64_t sub_23DA4FB30()
{
  swift_beginAccess();
  return qword_256CD5EF8;
}

uint64_t static HTGuardTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5F00;
}

uint64_t static HTGuardTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5F00 = a1;
  return result;
}

uint64_t (*static HTGuardTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTGuardTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5F08;
}

uint64_t static HTGuardTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5F08 = a1;
  return result;
}

uint64_t (*static HTGuardTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTGuardTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x800000uLL);
}

char *sub_23DA4FD00@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5F00, &qword_256CD5F08, &qword_256CD63A0);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4FD3C(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x800000uLL);
}

uint64_t sub_23DA4FD44@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5F00;
  return result;
}

uint64_t sub_23DA4FD8C()
{
  swift_beginAccess();
  return qword_256CD5F08;
}

uint64_t static HTEndpointSecurityTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5F10;
}

uint64_t static HTEndpointSecurityTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5F10 = a1;
  return result;
}

uint64_t (*static HTEndpointSecurityTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTEndpointSecurityTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5F18;
}

uint64_t static HTEndpointSecurityTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5F18 = a1;
  return result;
}

uint64_t (*static HTEndpointSecurityTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTEndpointSecurityTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x8000000uLL);
}

char *sub_23DA4FF5C@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_23DA50960(&qword_256CD5F10, &qword_256CD5F18, &qword_256CD63A8);
  *a1 = result;
  return result;
}

uint64_t sub_23DA4FF98(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x8000000uLL);
}

uint64_t sub_23DA4FFA0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5F10;
  return result;
}

uint64_t sub_23DA4FFE8()
{
  swift_beginAccess();
  return qword_256CD5F18;
}

uint64_t static HTBacklightServicesTerminationReason.firstCase.getter()
{
  swift_beginAccess();
  return qword_256CD5F20;
}

uint64_t static HTBacklightServicesTerminationReason.firstCase.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5F20 = a1;
  return result;
}

uint64_t (*static HTBacklightServicesTerminationReason.firstCase.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static HTBacklightServicesTerminationReason.lastCaseRawValue.getter()
{
  swift_beginAccess();
  return qword_256CD5F28;
}

uint64_t static HTBacklightServicesTerminationReason.lastCaseRawValue.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256CD5F28 = a1;
  return result;
}

uint64_t (*static HTBacklightServicesTerminationReason.lastCaseRawValue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t HTBacklightServicesTerminationReason.displayName.getter(int64_t a1)
{
  return sub_23DA501B8(a1, 0x100000000uLL);
}

uint64_t sub_23DA501B8(int64_t a1, unint64_t a2)
{
  id v2;
  uint64_t v3;

  v2 = HTTerminationSubReasonDisplayName(a2, a1);
  v3 = sub_23DA524AC();

  return v3;
}

char *sub_23DA5020C@<X0>(char **a1@<X8>)
{
  char *result;

  result = _sSo36HTBacklightServicesTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

uint64_t sub_23DA50230(uint64_t a1, uint64_t a2)
{
  return sub_23DA50238(a1, a2, 0x100000000uLL);
}

uint64_t sub_23DA50238(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t *v3;
  id v4;
  uint64_t v5;

  v4 = HTTerminationSubReasonDisplayName(a3, *v3);
  v5 = sub_23DA524AC();

  return v5;
}

uint64_t sub_23DA50288@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_256CD5F20;
  return result;
}

uint64_t sub_23DA502D0()
{
  swift_beginAccess();
  return qword_256CD5F28;
}

BOOL sub_23DA50310(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_23DA50324@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_23DA50330@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23DA50340(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_23DA5034C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_23DA50354()
{
  return sub_23DA524E8();
}

_QWORD *sub_23DA5036C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_23DA50380@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_23DA50394@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23DA503A8(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_23DA503D8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_23DA50404@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_23DA50428(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23DA5043C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23DA50450(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_23DA50464@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23DA50478(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_23DA5048C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_23DA504A0(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_23DA504B4()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *sub_23DA504C4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_23DA504D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_23DA51EE8(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

char *sub_23DA50514(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

_QWORD *sub_23DA50608(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_23DA50624(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_23DA50624(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CD6338);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CD6340);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *_sSo19HTTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0()
{
  char *v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_23DA50514(0, 1, 1, MEMORY[0x24BEE4AF8], &qword_256CD63B8);
  v1 = *((_QWORD *)v0 + 2);
  v2 = 2;
  do
  {
    v3 = *((_QWORD *)v0 + 3);
    if (v1 >= v3 >> 1)
      v0 = sub_23DA50514((char *)(v3 > 1), v1 + 1, 1, v0, &qword_256CD63B8);
    *((_QWORD *)v0 + 2) = v1 + 1;
    *(_QWORD *)&v0[8 * v1 + 32] = v2;
    v4 = (v2 >> 41) & 0x3FFFFF;
    v2 *= 2;
    ++v1;
  }
  while (!v4);
  return v0;
}

char *sub_23DA507FC()
{
  char *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  swift_beginAccess();
  v0 = (char *)MEMORY[0x24BEE4AF8];
  v1 = qword_256CD5E58;
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v0 = sub_23DA50514(0, *((_QWORD *)v0 + 2) + 1, 1, v0, &qword_256CD6348);
      v3 = *((_QWORD *)v0 + 2);
      v2 = *((_QWORD *)v0 + 3);
      if (v3 >= v2 >> 1)
        v0 = sub_23DA50514((char *)(v2 > 1), v3 + 1, 1, v0, &qword_256CD6348);
      *((_QWORD *)v0 + 2) = v3 + 1;
      *(_QWORD *)&v0[8 * v3 + 32] = v1;
      if (qword_256CD66F0 != -1)
        swift_once();
      v4 = 2 * v1;
      swift_beginAccess();
      if ((unint64_t)qword_256CD66F8 >= 0x40)
        break;
      v1 *= 2;
      if (1 << qword_256CD66F8 < v4)
        return v0;
    }
    v1 = 0;
  }
  while (!v4);
  return v0;
}

char *sub_23DA50960(uint64_t *a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  swift_beginAccess();
  v6 = *a1;
  swift_beginAccess();
  v7 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_23DA50514(0, *((_QWORD *)v7 + 2) + 1, 1, v7, a3);
      v9 = *((_QWORD *)v7 + 2);
      v8 = *((_QWORD *)v7 + 3);
      if (v9 >= v8 >> 1)
        v7 = sub_23DA50514((char *)(v8 > 1), v9 + 1, 1, v7, a3);
      *((_QWORD *)v7 + 2) = v9 + 1;
      *(_QWORD *)&v7[8 * v9 + 32] = v6;
      v10 = 2 * v6;
      if (*a2 >= 0x40uLL)
        break;
      v6 *= 2;
      if (1 << *a2 < v10)
        return v7;
    }
    v6 = 0;
  }
  while (!v10);
  return v7;
}

char *sub_23DA50A7C(uint64_t *a1, _QWORD *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  swift_beginAccess();
  v8 = *a1;
  swift_beginAccess();
  v9 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v9 = sub_23DA50514(0, *((_QWORD *)v9 + 2) + 1, 1, v9, a3);
      v11 = *((_QWORD *)v9 + 2);
      v10 = *((_QWORD *)v9 + 3);
      v12 = v11 + 1;
      if (v11 >= v10 >> 1)
        v9 = sub_23DA50514((char *)(v10 > 1), v11 + 1, 1, v9, a3);
      *((_QWORD *)v9 + 2) = v12;
      *(_QWORD *)&v9[8 * v11 + 32] = v8;
      v13 = 2 * v8;
      if (*a2 > 0x3FuLL)
        break;
      v8 *= 2;
      if (1 << *a2 < v13)
        goto LABEL_9;
    }
    v8 = 0;
  }
  while (!v13);
LABEL_9:
  v14 = *((_QWORD *)v9 + 3);
  if (v12 >= v14 >> 1)
    v9 = sub_23DA50514((char *)(v14 > 1), v11 + 2, 1, v9, a3);
  *((_QWORD *)v9 + 2) = v11 + 2;
  *(_QWORD *)&v9[8 * v12 + 32] = a4;
  return v9;
}

char *_sSo36HTBacklightServicesTerminationReasonV24HangTracerSettingsClientE8allCasesSayABGvgZ_0()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  swift_beginAccess();
  v0 = qword_256CD5F20;
  swift_beginAccess();
  v1 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    while (1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v1 = sub_23DA50514(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_256CD63B0);
      v3 = *((_QWORD *)v1 + 2);
      v2 = *((_QWORD *)v1 + 3);
      v4 = v3 + 1;
      if (v3 >= v2 >> 1)
        v1 = sub_23DA50514((char *)(v2 > 1), v3 + 1, 1, v1, &qword_256CD63B0);
      *((_QWORD *)v1 + 2) = v4;
      *(_QWORD *)&v1[8 * v3 + 32] = v0;
      v5 = 2 * v0;
      if ((unint64_t)qword_256CD5F28 > 0x3F)
        break;
      v0 *= 2;
      if (1 << qword_256CD5F28 < v5)
        goto LABEL_9;
    }
    v0 = 0;
  }
  while (!v5);
LABEL_9:
  v6 = *((_QWORD *)v1 + 3);
  v7 = v3 + 2;
  if (v4 >= v6 >> 1)
    v1 = sub_23DA50514((char *)(v6 > 1), v3 + 2, 1, v1, &qword_256CD63B0);
  *((_QWORD *)v1 + 2) = v7;
  *(_QWORD *)&v1[8 * v4 + 32] = 0x100000;
  v8 = *((_QWORD *)v1 + 3);
  if ((uint64_t)(v3 + 3) > (uint64_t)(v8 >> 1))
    v1 = sub_23DA50514((char *)(v8 > 1), v3 + 3, 1, v1, &qword_256CD63B0);
  *((_QWORD *)v1 + 2) = v3 + 3;
  *(_QWORD *)&v1[8 * v7 + 32] = 0x200000;
  return v1;
}

void type metadata accessor for HTBacklightServicesTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6170);
}

void type metadata accessor for HTEndpointSecurityTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6168);
}

uint64_t sub_23DA50DC0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24263947C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for HTGuardTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6160);
}

void type metadata accessor for HTWatchKitTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6158);
}

void type metadata accessor for HTWatchdogTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6150);
}

void type metadata accessor for HTLibSystemTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6148);
}

void type metadata accessor for HTRunningBoardTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6140);
}

void type metadata accessor for HTSpringBoardTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6138);
}

void type metadata accessor for HTExecTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6130);
}

void type metadata accessor for HTLibXPCTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6128);
}

void type metadata accessor for HTDYLDTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6120);
}

void type metadata accessor for HTCodeSigningTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6118);
}

void type metadata accessor for HTSignalTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6110);
}

void type metadata accessor for HTJetsamTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6108);
}

uint64_t sub_23DA50EF0()
{
  return sub_23DA5145C(&qword_256CD5FA0, &qword_256CD5FA8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242639470](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23DA50F58()
{
  return sub_23DA5145C(&qword_256CD5FB0, &qword_256CD5FB8);
}

uint64_t sub_23DA50F7C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD5FC0, (uint64_t (*)(uint64_t))type metadata accessor for HTJetsamTerminationReason, (uint64_t)&unk_23DA5538C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA50FB8()
{
  return sub_23DA5145C(&qword_256CD5FC8, &qword_256CD5FD0);
}

uint64_t sub_23DA50FDC(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD5FD8, (uint64_t (*)(uint64_t))type metadata accessor for HTSignalTerminationReason, (uint64_t)&unk_23DA55350);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51018()
{
  return sub_23DA5145C(&qword_256CD5FE0, &qword_256CD5FE8);
}

uint64_t sub_23DA5103C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD5FF0, (uint64_t (*)(uint64_t))type metadata accessor for HTCodeSigningTerminationReason, (uint64_t)&unk_23DA55314);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51078()
{
  return sub_23DA5145C(&qword_256CD5FF8, &qword_256CD6000);
}

uint64_t sub_23DA5109C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD6008, (uint64_t (*)(uint64_t))type metadata accessor for HTDYLDTerminationReason, (uint64_t)&unk_23DA552D8);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA510D8()
{
  return sub_23DA5145C(&qword_256CD6010, &qword_256CD6018);
}

uint64_t sub_23DA510FC(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD6020, (uint64_t (*)(uint64_t))type metadata accessor for HTLibXPCTerminationReason, (uint64_t)&unk_23DA5529C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51138()
{
  return sub_23DA5145C(&qword_256CD6028, &qword_256CD6030);
}

uint64_t sub_23DA5115C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD6038, (uint64_t (*)(uint64_t))type metadata accessor for HTExecTerminationReason, (uint64_t)&unk_23DA55260);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51198()
{
  return sub_23DA5145C(&qword_256CD6040, &qword_256CD6048);
}

uint64_t sub_23DA511BC(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD6050, (uint64_t (*)(uint64_t))type metadata accessor for HTSpringBoardTerminationReason, (uint64_t)&unk_23DA55224);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA511F8()
{
  return sub_23DA5145C(&qword_256CD6058, &qword_256CD6060);
}

uint64_t sub_23DA5121C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD6068, (uint64_t (*)(uint64_t))type metadata accessor for HTRunningBoardTerminationReason, (uint64_t)&unk_23DA551E8);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51258()
{
  return sub_23DA5145C(&qword_256CD6070, &qword_256CD6078);
}

uint64_t sub_23DA5127C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD6080, (uint64_t (*)(uint64_t))type metadata accessor for HTLibSystemTerminationReason, (uint64_t)&unk_23DA551AC);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA512B8()
{
  return sub_23DA5145C(&qword_256CD6088, &qword_256CD6090);
}

uint64_t sub_23DA512DC(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD6098, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchdogTerminationReason, (uint64_t)&unk_23DA55170);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51318()
{
  return sub_23DA5145C(&qword_256CD60A0, &qword_256CD60A8);
}

uint64_t sub_23DA5133C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD60B0, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchKitTerminationReason, (uint64_t)&unk_23DA55134);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51378()
{
  return sub_23DA5145C(&qword_256CD60B8, &qword_256CD60C0);
}

uint64_t sub_23DA5139C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD60C8, (uint64_t (*)(uint64_t))type metadata accessor for HTGuardTerminationReason, (uint64_t)&unk_23DA550F8);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA513D8()
{
  return sub_23DA5145C(&qword_256CD60D0, &qword_256CD60D8);
}

uint64_t sub_23DA513FC(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD60E0, (uint64_t (*)(uint64_t))type metadata accessor for HTEndpointSecurityTerminationReason, (uint64_t)&unk_23DA550BC);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23DA51438()
{
  return sub_23DA5145C(&qword_256CD60E8, &qword_256CD60F0);
}

uint64_t sub_23DA5145C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24263947C](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DA5149C(uint64_t a1)
{
  uint64_t result;

  result = sub_23DA50DC0(&qword_256CD60F8, (uint64_t (*)(uint64_t))type metadata accessor for HTBacklightServicesTerminationReason, (uint64_t)&unk_23DA55080);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of HTTerminationSubReason.displayName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static HTTerminationSubReason.firstCase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static HTTerminationSubReason.lastCaseRawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

void type metadata accessor for HTTerminationReason(uint64_t a1)
{
  sub_23DA51504(a1, &qword_256CD6100);
}

void sub_23DA51504(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_23DA51548()
{
  return sub_23DA50DC0(&qword_256CD6178, (uint64_t (*)(uint64_t))type metadata accessor for HTBacklightServicesTerminationReason, (uint64_t)&unk_23DA53C9C);
}

uint64_t sub_23DA51574()
{
  return sub_23DA50DC0(&qword_256CD6180, (uint64_t (*)(uint64_t))type metadata accessor for HTBacklightServicesTerminationReason, (uint64_t)&unk_23DA53C68);
}

uint64_t sub_23DA515A0()
{
  return sub_23DA50DC0(&qword_256CD6188, (uint64_t (*)(uint64_t))type metadata accessor for HTEndpointSecurityTerminationReason, (uint64_t)&unk_23DA53E04);
}

uint64_t sub_23DA515CC()
{
  return sub_23DA50DC0(&qword_256CD6190, (uint64_t (*)(uint64_t))type metadata accessor for HTEndpointSecurityTerminationReason, (uint64_t)&unk_23DA53DD0);
}

uint64_t sub_23DA515F8()
{
  return sub_23DA50DC0(&qword_256CD6198, (uint64_t (*)(uint64_t))type metadata accessor for HTGuardTerminationReason, (uint64_t)&unk_23DA53F6C);
}

uint64_t sub_23DA51624()
{
  return sub_23DA50DC0(&qword_256CD61A0, (uint64_t (*)(uint64_t))type metadata accessor for HTGuardTerminationReason, (uint64_t)&unk_23DA53F38);
}

uint64_t sub_23DA51650()
{
  return sub_23DA50DC0(&qword_256CD61A8, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchKitTerminationReason, (uint64_t)&unk_23DA540D4);
}

uint64_t sub_23DA5167C()
{
  return sub_23DA50DC0(&qword_256CD61B0, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchKitTerminationReason, (uint64_t)&unk_23DA540A0);
}

uint64_t sub_23DA516A8()
{
  return sub_23DA50DC0(&qword_256CD61B8, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchdogTerminationReason, (uint64_t)&unk_23DA5423C);
}

uint64_t sub_23DA516D4()
{
  return sub_23DA50DC0(&qword_256CD61C0, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchdogTerminationReason, (uint64_t)&unk_23DA54208);
}

uint64_t sub_23DA51700()
{
  return sub_23DA50DC0(&qword_256CD61C8, (uint64_t (*)(uint64_t))type metadata accessor for HTLibSystemTerminationReason, (uint64_t)&unk_23DA543A4);
}

uint64_t sub_23DA5172C()
{
  return sub_23DA50DC0(&qword_256CD61D0, (uint64_t (*)(uint64_t))type metadata accessor for HTLibSystemTerminationReason, (uint64_t)&unk_23DA54370);
}

uint64_t sub_23DA51758()
{
  return sub_23DA50DC0(&qword_256CD61D8, (uint64_t (*)(uint64_t))type metadata accessor for HTRunningBoardTerminationReason, (uint64_t)&unk_23DA5450C);
}

uint64_t sub_23DA51784()
{
  return sub_23DA50DC0(&qword_256CD61E0, (uint64_t (*)(uint64_t))type metadata accessor for HTRunningBoardTerminationReason, (uint64_t)&unk_23DA544D8);
}

uint64_t sub_23DA517B0()
{
  return sub_23DA50DC0(&qword_256CD61E8, (uint64_t (*)(uint64_t))type metadata accessor for HTSpringBoardTerminationReason, (uint64_t)&unk_23DA54674);
}

uint64_t sub_23DA517DC()
{
  return sub_23DA50DC0(&qword_256CD61F0, (uint64_t (*)(uint64_t))type metadata accessor for HTSpringBoardTerminationReason, (uint64_t)&unk_23DA54640);
}

uint64_t sub_23DA51808()
{
  return sub_23DA50DC0(&qword_256CD61F8, (uint64_t (*)(uint64_t))type metadata accessor for HTExecTerminationReason, (uint64_t)&unk_23DA547DC);
}

uint64_t sub_23DA51834()
{
  return sub_23DA50DC0(&qword_256CD6200, (uint64_t (*)(uint64_t))type metadata accessor for HTExecTerminationReason, (uint64_t)&unk_23DA547A8);
}

uint64_t sub_23DA51860()
{
  return sub_23DA50DC0(&qword_256CD6208, (uint64_t (*)(uint64_t))type metadata accessor for HTLibXPCTerminationReason, (uint64_t)&unk_23DA54944);
}

uint64_t sub_23DA5188C()
{
  return sub_23DA50DC0(&qword_256CD6210, (uint64_t (*)(uint64_t))type metadata accessor for HTLibXPCTerminationReason, (uint64_t)&unk_23DA54910);
}

uint64_t sub_23DA518B8()
{
  return sub_23DA50DC0(&qword_256CD6218, (uint64_t (*)(uint64_t))type metadata accessor for HTDYLDTerminationReason, (uint64_t)&unk_23DA54AAC);
}

uint64_t sub_23DA518E4()
{
  return sub_23DA50DC0(&qword_256CD6220, (uint64_t (*)(uint64_t))type metadata accessor for HTDYLDTerminationReason, (uint64_t)&unk_23DA54A78);
}

uint64_t sub_23DA51910()
{
  return sub_23DA50DC0(&qword_256CD6228, (uint64_t (*)(uint64_t))type metadata accessor for HTCodeSigningTerminationReason, (uint64_t)&unk_23DA54C14);
}

uint64_t sub_23DA5193C()
{
  return sub_23DA50DC0(&qword_256CD6230, (uint64_t (*)(uint64_t))type metadata accessor for HTCodeSigningTerminationReason, (uint64_t)&unk_23DA54BE0);
}

uint64_t sub_23DA51968()
{
  return sub_23DA50DC0(&qword_256CD6238, (uint64_t (*)(uint64_t))type metadata accessor for HTSignalTerminationReason, (uint64_t)&unk_23DA54D7C);
}

uint64_t sub_23DA51994()
{
  return sub_23DA50DC0(&qword_256CD6240, (uint64_t (*)(uint64_t))type metadata accessor for HTSignalTerminationReason, (uint64_t)&unk_23DA54D48);
}

uint64_t sub_23DA519C0()
{
  return sub_23DA50DC0(&qword_256CD6248, (uint64_t (*)(uint64_t))type metadata accessor for HTJetsamTerminationReason, (uint64_t)&unk_23DA54EE4);
}

uint64_t sub_23DA519EC()
{
  return sub_23DA50DC0(&qword_256CD6250, (uint64_t (*)(uint64_t))type metadata accessor for HTJetsamTerminationReason, (uint64_t)&unk_23DA54EB0);
}

uint64_t sub_23DA51A18()
{
  return sub_23DA50DC0(&qword_256CD6258, (uint64_t (*)(uint64_t))type metadata accessor for HTBacklightServicesTerminationReason, (uint64_t)&unk_23DA53CC8);
}

uint64_t sub_23DA51A44()
{
  return sub_23DA50DC0(&qword_256CD6260, (uint64_t (*)(uint64_t))type metadata accessor for HTBacklightServicesTerminationReason, (uint64_t)&unk_23DA53D04);
}

uint64_t sub_23DA51A70()
{
  return sub_23DA50DC0(&qword_256CD6268, (uint64_t (*)(uint64_t))type metadata accessor for HTEndpointSecurityTerminationReason, (uint64_t)&unk_23DA53E30);
}

uint64_t sub_23DA51A9C()
{
  return sub_23DA50DC0(&qword_256CD6270, (uint64_t (*)(uint64_t))type metadata accessor for HTEndpointSecurityTerminationReason, (uint64_t)&unk_23DA53E6C);
}

uint64_t sub_23DA51AC8()
{
  return sub_23DA50DC0(&qword_256CD6278, (uint64_t (*)(uint64_t))type metadata accessor for HTGuardTerminationReason, (uint64_t)&unk_23DA53F98);
}

uint64_t sub_23DA51AF4()
{
  return sub_23DA50DC0(&qword_256CD6280, (uint64_t (*)(uint64_t))type metadata accessor for HTGuardTerminationReason, (uint64_t)&unk_23DA53FD4);
}

uint64_t sub_23DA51B20()
{
  return sub_23DA50DC0(&qword_256CD6288, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchKitTerminationReason, (uint64_t)&unk_23DA54100);
}

uint64_t sub_23DA51B4C()
{
  return sub_23DA50DC0(&qword_256CD6290, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchKitTerminationReason, (uint64_t)&unk_23DA5413C);
}

uint64_t sub_23DA51B78()
{
  return sub_23DA50DC0(&qword_256CD6298, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchdogTerminationReason, (uint64_t)&unk_23DA54268);
}

uint64_t sub_23DA51BA4()
{
  return sub_23DA50DC0(&qword_256CD62A0, (uint64_t (*)(uint64_t))type metadata accessor for HTWatchdogTerminationReason, (uint64_t)&unk_23DA542A4);
}

uint64_t sub_23DA51BD0()
{
  return sub_23DA50DC0(&qword_256CD62A8, (uint64_t (*)(uint64_t))type metadata accessor for HTLibSystemTerminationReason, (uint64_t)&unk_23DA543D0);
}

uint64_t sub_23DA51BFC()
{
  return sub_23DA50DC0(&qword_256CD62B0, (uint64_t (*)(uint64_t))type metadata accessor for HTLibSystemTerminationReason, (uint64_t)&unk_23DA5440C);
}

uint64_t sub_23DA51C28()
{
  return sub_23DA50DC0(&qword_256CD62B8, (uint64_t (*)(uint64_t))type metadata accessor for HTRunningBoardTerminationReason, (uint64_t)&unk_23DA54538);
}

uint64_t sub_23DA51C54()
{
  return sub_23DA50DC0(&qword_256CD62C0, (uint64_t (*)(uint64_t))type metadata accessor for HTRunningBoardTerminationReason, (uint64_t)&unk_23DA54574);
}

uint64_t sub_23DA51C80()
{
  return sub_23DA50DC0(&qword_256CD62C8, (uint64_t (*)(uint64_t))type metadata accessor for HTSpringBoardTerminationReason, (uint64_t)&unk_23DA546A0);
}

uint64_t sub_23DA51CAC()
{
  return sub_23DA50DC0(&qword_256CD62D0, (uint64_t (*)(uint64_t))type metadata accessor for HTSpringBoardTerminationReason, (uint64_t)&unk_23DA546DC);
}

uint64_t sub_23DA51CD8()
{
  return sub_23DA50DC0(&qword_256CD62D8, (uint64_t (*)(uint64_t))type metadata accessor for HTExecTerminationReason, (uint64_t)&unk_23DA54808);
}

uint64_t sub_23DA51D04()
{
  return sub_23DA50DC0(&qword_256CD62E0, (uint64_t (*)(uint64_t))type metadata accessor for HTExecTerminationReason, (uint64_t)&unk_23DA54844);
}

uint64_t sub_23DA51D30()
{
  return sub_23DA50DC0(&qword_256CD62E8, (uint64_t (*)(uint64_t))type metadata accessor for HTLibXPCTerminationReason, (uint64_t)&unk_23DA54970);
}

uint64_t sub_23DA51D5C()
{
  return sub_23DA50DC0(&qword_256CD62F0, (uint64_t (*)(uint64_t))type metadata accessor for HTLibXPCTerminationReason, (uint64_t)&unk_23DA549AC);
}

uint64_t sub_23DA51D88()
{
  return sub_23DA50DC0(&qword_256CD62F8, (uint64_t (*)(uint64_t))type metadata accessor for HTDYLDTerminationReason, (uint64_t)&unk_23DA54AD8);
}

uint64_t sub_23DA51DB4()
{
  return sub_23DA50DC0(&qword_256CD6300, (uint64_t (*)(uint64_t))type metadata accessor for HTDYLDTerminationReason, (uint64_t)&unk_23DA54B14);
}

uint64_t sub_23DA51DE0()
{
  return sub_23DA50DC0(&qword_256CD6308, (uint64_t (*)(uint64_t))type metadata accessor for HTCodeSigningTerminationReason, (uint64_t)&unk_23DA54C40);
}

uint64_t sub_23DA51E0C()
{
  return sub_23DA50DC0(&qword_256CD6310, (uint64_t (*)(uint64_t))type metadata accessor for HTCodeSigningTerminationReason, (uint64_t)&unk_23DA54C7C);
}

uint64_t sub_23DA51E38()
{
  return sub_23DA50DC0(&qword_256CD6318, (uint64_t (*)(uint64_t))type metadata accessor for HTSignalTerminationReason, (uint64_t)&unk_23DA54DA8);
}

uint64_t sub_23DA51E64()
{
  return sub_23DA50DC0(&qword_256CD6320, (uint64_t (*)(uint64_t))type metadata accessor for HTSignalTerminationReason, (uint64_t)&unk_23DA54DE4);
}

uint64_t sub_23DA51E90()
{
  return sub_23DA50DC0(&qword_256CD6328, (uint64_t (*)(uint64_t))type metadata accessor for HTJetsamTerminationReason, (uint64_t)&unk_23DA54F10);
}

uint64_t sub_23DA51EBC()
{
  return sub_23DA50DC0(&qword_256CD6330, (uint64_t (*)(uint64_t))type metadata accessor for HTJetsamTerminationReason, (uint64_t)&unk_23DA54F4C);
}

uint64_t sub_23DA51EE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_23DA51F20(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t HTHangsDataEntry.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(v1, sel_creationDate);
  if (v3)
  {
    v4 = v3;
    sub_23DA52488();

    v5 = sub_23DA52494();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_23DA52494();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t HTHang.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(v1, sel_creationDate);
  sub_23DA52488();

  v4 = sub_23DA52494();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 0, 1, v4);
}

uint64_t HTAnalyticsSendEventLazy_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2_cold_1(v0);
}

uint64_t __getNEVPNManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __29__HTHangReporterService_init__block_invoke_cold_1(v0);
}

uint64_t sub_23DA52488()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23DA52494()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23DA524A0()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_23DA524AC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DA524B8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23DA524C4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23DA524D0()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23DA524DC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23DA524E8()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23DA524F4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DA52500()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DA5250C()
{
  return MEMORY[0x24BEE4A18]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x24BDBC168](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

uint64_t HTPrefsKeysToRestoreForPrefix()
{
  return MEMORY[0x24BE3F320]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

uint64_t tailspin_buffer_size_set()
{
  return MEMORY[0x24BEDE430]();
}

uint64_t tailspin_config_apply_sync()
{
  return MEMORY[0x24BEDE438]();
}

uint64_t tailspin_config_create_with_default_config()
{
  return MEMORY[0x24BEDE458]();
}

uint64_t tailspin_config_free()
{
  return MEMORY[0x24BEDE470]();
}

uint64_t tailspin_enabled_set()
{
  return MEMORY[0x24BEDE4B0]();
}

uint64_t tailspin_full_sampling_period_set()
{
  return MEMORY[0x24BEDE4B8]();
}

uint64_t tailspin_oncore_sampling_period_set()
{
  return MEMORY[0x24BEDE4D8]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x24BDB0728]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

