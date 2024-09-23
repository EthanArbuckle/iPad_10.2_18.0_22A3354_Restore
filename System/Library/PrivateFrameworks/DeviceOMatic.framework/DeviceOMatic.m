uint64_t DOMRegisterForMatching(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __DOMRegisterForMatching_block_invoke;
  v15[3] = &unk_24E6AAFC8;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = a1;
  v10 = DOMRegisterForMatching_onceToken;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  if (v10 != -1)
    dispatch_once(&DOMRegisterForMatching_onceToken, v15);

  return 0;
}

id NSLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v4 = 0;
    v13 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v2, "localizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_20:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v1, v1, CFSTR("Localizable"), (_QWORD)v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v5 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x24BDBD568], CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_19;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "localizedStringForKey:value:table:localization:", v1, 0, CFSTR("Localizable"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

  if (!v13)
    goto LABEL_20;
LABEL_21:

  return v13;
}

uint64_t getLogHandle()
{
  if (getLogHandle_onceToken != -1)
    dispatch_once(&getLogHandle_onceToken, &__block_literal_global);
  return getLogHandle_gLogHandle;
}

uint64_t __getLogHandle_block_invoke()
{
  uint64_t result;

  result = MOLogOpen();
  getLogHandle_gLogHandle = result;
  return result;
}

id stringFromObject(void *a1)
{
  return printObjectToString(a1, 0, 0);
}

id printObjectToString(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  const __CFString *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  id v21;
  id v22;
  id v23;
  CFTypeID v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  int v29;
  _QWORD v30[4];
  id v31;
  int v32;
  _QWORD v33[4];
  id v34;
  int v35;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (v5)
      goto LABEL_3;
LABEL_12:
    v15 = CFSTR("NULL");
    goto LABEL_13;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (!v5)
    goto LABEL_12;
LABEL_3:
  if (!objc_msgSend(v7, "length")
    || (objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v7, "length") - 1),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("\n")),
        v8,
        v9))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%*s"), (2 * a2), &unk_220DB590F);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((_DWORD)a2)
      v10 = CFSTR("<dict>\n");
    else
      v10 = CFSTR("\n<dict>\n");
    v11 = (id)printObjectToString(v10, a2, v7);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __printObjectToString_block_invoke;
    v33[3] = &unk_24E6AB0A0;
    v35 = a2;
    v12 = v7;
    v34 = v12;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v33);
    v13 = (id)printObjectToString(CFSTR("</dict>"), a2, v12);
    v14 = v34;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((_DWORD)a2)
      v16 = CFSTR("<array>\n");
    else
      v16 = CFSTR("\n<array>\n");
    v17 = (id)printObjectToString(v16, a2, v7);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __printObjectToString_block_invoke_2;
    v30[3] = &unk_24E6AB0C8;
    v32 = a2;
    v18 = v7;
    v31 = v18;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v30);
    v19 = (id)printObjectToString(CFSTR("</array>"), a2, v18);
    v14 = v31;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((_DWORD)a2)
      v20 = CFSTR("<set>\n");
    else
      v20 = CFSTR("\n<set>\n");
    v21 = (id)printObjectToString(v20, a2, v7);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __printObjectToString_block_invoke_3;
    v27[3] = &unk_24E6AB0F0;
    v29 = a2;
    v22 = v7;
    v28 = v22;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v27);
    v23 = (id)printObjectToString(CFSTR("</set>"), a2, v22);
    v14 = v28;
    goto LABEL_24;
  }
  v25 = CFGetTypeID(v5);
  if (v25 != CFBooleanGetTypeID())
  {
    objc_msgSend(v5, "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v26);

    goto LABEL_25;
  }
  if (objc_msgSend(v5, "BOOLValue"))
    v15 = CFSTR("true");
  else
    v15 = CFSTR("false");
LABEL_13:
  objc_msgSend(v7, "appendString:", v15);
LABEL_25:

  return v7;
}

uint64_t serviceIsAttachedToRemovableDevice(io_object_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  kern_return_t ParentEntry;
  int *v6;
  char *v7;
  _QWORD v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = (void (*)(void))__serviceIsAttachedToRemovableDevice_block_invoke;
  v10 = &unk_24E6AB030;
  v11 = &v12;
  v2 = v8;
  v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry)
          break;
        a1 = parent;
        if (!parent)
          goto LABEL_3;
        ((void (*)(_QWORD *, _QWORD, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v6 = __error();
        v7 = strerror(*v6);
        serviceIsAttachedToRemovableDevice_cold_1((uint64_t)v7, buf);
      }
    }
  }
LABEL_3:

  v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_220DB3FD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void __serviceIsAttachedToRemovableDevice_block_invoke(uint64_t a1, io_registry_entry_t entry, _BYTE *a3)
{
  CFTypeRef CFProperty;
  const void *v6;

  CFProperty = IORegistryEntryCreateCFProperty(entry, CFSTR("removable"), 0, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    if (CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x24BDBD270]))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

__CFDictionary *propertiesForRegistryEntryID(uint64_t a1)
{
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  __CFDictionary *v4;
  CFMutableDictionaryRef properties;

  v1 = IORegistryEntryIDMatching(a1);
  if (v1 && (MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v1)) != 0)
  {
    v3 = MatchingService;
    properties = 0;
    v4 = 0;
    if (!IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0))
      v4 = properties;
    IOObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t getAllChildren(uint64_t a1, __CFDictionary *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  io_object_t v8;
  io_service_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
  const __CFDictionary *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  __CFDictionary *v28;
  id v29;
  io_service_t v30;
  CFNumberRef cf;
  const __CFDictionary *v32;
  CFStringRef key;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFDictionary *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  BOOLean_t matches[2];
  uint64_t entryID;
  io_iterator_t iterator;
  uint8_t buf[4];
  CFStringRef v52;
  __int16 v53;
  const __CFDictionary *v54;
  __int16 v55;
  const void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  char v62[128];
  char className[136];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (getAllChildren_onceToken != -1)
    dispatch_once(&getAllChildren_onceToken, &__block_literal_global_11);
  v6 = (void *)getAllChildren__match;
  if (v5)
    v6 = v5;
  v7 = v6;
  iterator = 0;
  MEMORY[0x2276659C0](a1, "IOService", &iterator);
  v8 = IOIteratorNext(iterator);
  if (v8)
  {
    v9 = v8;
    v34 = 0;
    v10 = MEMORY[0x24BDACB70];
    v28 = a2;
    v29 = v5;
    v32 = v7;
    do
    {
      IOServiceWaitQuiet(v9, 0);
      entryID = 0;
      IORegistryEntryGetRegistryEntryID(v9, &entryID);
      cf = CFNumberCreate(0, kCFNumberSInt64Type, &entryID);
      memset(className, 0, 128);
      IOObjectGetClass(v9, className);
      key = CFStringCreateWithFormat(0, 0, CFSTR("%s, %lld (0x%016llx)"), className, entryID, entryID);
      if (v7)
      {
        matches[0] = 0;
        IOServiceMatchPropertyTable(v9, v7, matches);
        if (matches[0])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v52 = key;
            _os_log_impl(&dword_220DB2000, v10, OS_LOG_TYPE_DEFAULT, "%@ matches via IOServiceMatchPropertyTable", buf, 0xCu);
          }
          v34 = 1;
        }
      }
      *(_QWORD *)matches = 0;
      IORegistryEntryCreateCFProperties(v9, (CFMutableDictionaryRef *)matches, 0, 0);
      if (a2)
        CFDictionarySetValue(a2, key, *(const void **)matches);
      if (!((v5 == 0) | v34 & 1))
      {
        v30 = v9;
        v38 = objc_msgSend(v5, "count");
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        obj = v7;
        v36 = -[__CFDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
        if (v36)
        {
          v11 = 0;
          v34 = 0;
          v35 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v45 != v35)
                objc_enumerationMutation(obj);
              v13 = *(const __CFDictionary **)(*((_QWORD *)&v44 + 1) + 8 * i);
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v14 = *(id *)matches;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
              if (v15)
              {
                v16 = v15;
                v37 = i;
                v17 = *(_QWORD *)v41;
                while (2)
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v41 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(const void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                    if (-[__CFDictionary isEqualToString:](v13, "isEqualToString:", v19))
                    {
                      v20 = v10;
                      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                      {
                        -[__CFDictionary objectForKey:](obj, "objectForKey:", v13);
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*(id *)matches, "objectForKey:", v19);
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 134219010;
                        v52 = (CFStringRef)v11;
                        v53 = 2112;
                        v54 = v13;
                        v55 = 2112;
                        v56 = v19;
                        v57 = 2112;
                        v58 = v21;
                        v59 = 2112;
                        v60 = v22;
                        _os_log_impl(&dword_220DB2000, v20, OS_LOG_TYPE_DEFAULT, "[%lu] comparing keys %@:%@ and values %@:%@", buf, 0x34u);

                      }
                      -[__CFDictionary objectForKey:](obj, "objectForKey:", v13);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)matches, "objectForKey:", v19);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v23, "isEqual:", v24);

                      if (v25)
                      {
                        ++v11;
                        v10 = v20;
                        if (v11 == v38)
                        {
                          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412802;
                            v52 = key;
                            v53 = 2112;
                            v54 = v32;
                            v55 = 2112;
                            v56 = *(const void **)matches;
                            _os_log_impl(&dword_220DB2000, v20, OS_LOG_TYPE_DEFAULT, "%@ MATCHED %@ with %@", buf, 0x20u);
                          }
                          v34 = 1;
                          v11 = v38;
                          goto LABEL_38;
                        }
                      }
                      else
                      {
                        v10 = v20;
                      }
                    }
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
                  if (v16)
                    continue;
                  break;
                }
LABEL_38:
                i = v37;
              }

            }
            v36 = -[__CFDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
          }
          while (v36);
        }
        else
        {
          v34 = 0;
        }

        a2 = v28;
        v5 = v29;
        v7 = v32;
        v9 = v30;
      }
      CFRelease(key);
      CFRelease(cf);
      CFRelease(*(CFTypeRef *)matches);
      IOObjectRelease(v9);
      v9 = IOIteratorNext(iterator);
    }
    while (v9);
  }
  else
  {
    v34 = 0;
  }
  IOObjectRelease(iterator);

  return v34 & 1;
}

void __getAllChildren_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithContentsOfFile:", CFSTR("/tmp/test.plist"));
  v1 = (void *)getAllChildren__match;
  getAllChildren__match = v0;

}

void printAllChildren(void *a1)
{
  id v1;
  id v2;
  __CFDictionary *Mutable;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  getAllChildren(objc_msgSend(v1, "io_service"), Mutable, 0);
  v4 = printObjectToString(Mutable, 2, v2);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = v1;
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_220DB2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@\nchildren: %@", (uint8_t *)&v5, 0x16u);
  }
  CFRelease(Mutable);

}

void printChildSet(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a2;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v23;
    v3 = MEMORY[0x24BDACB70];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v17 = v4;
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v4);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v13;
          v29 = 2112;
          v30 = v5;
          _os_log_impl(&dword_220DB2000, v3, OS_LOG_TYPE_DEFAULT, "%@ child %@", buf, 0x16u);
        }
        objc_msgSend(obj, "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v6);
              if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
              {
                v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
                objc_msgSend(v6, "objectForKey:", v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v28 = v11;
                v29 = 2112;
                v30 = v12;
                _os_log_impl(&dword_220DB2000, v3, OS_LOG_TYPE_DEFAULT, "\tproperty %@: %@", buf, 0x16u);

              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v8);
        }

        v4 = v17 + 1;
      }
      while (v17 + 1 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v15);
  }

}

id copyEntryProperties(uint64_t a1)
{
  id v2;
  CFMutableDictionaryRef properties;
  char name[1024];
  _BYTE v6[520];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  properties = 0;
  memset(v6, 0, 512);
  IORegistryEntryGetNameInPlane(a1, "IOService", name);
  MEMORY[0x2276659E4](a1, "IOService", v6);
  IORegistryEntryCreateCFProperties(a1, &properties, 0, 0);
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v2, "appendFormat:", CFSTR("%s:\nPath:\n%s\n%@\n"), name, v6, printObjectToString(properties, 0, 0));
  return v2;
}

const char *stringForXPCType(uint64_t a1)
{
  if (a1 == MEMORY[0x24BDACF88])
    return "XPC_TYPE_CONNECTION";
  if (a1 == MEMORY[0x24BDACFE0])
    return "XPC_TYPE_NULL";
  if (a1 == MEMORY[0x24BDACF80])
    return "XPC_TYPE_BOOL";
  if (a1 == MEMORY[0x24BDACFD0])
    return "XPC_TYPE_INT64";
  if (a1 == MEMORY[0x24BDACFF8])
    return "XPC_TYPE_UINT64";
  if (a1 == MEMORY[0x24BDACFA8])
    return "XPC_TYPE_DOUBLE";
  if (a1 == MEMORY[0x24BDACF98])
    return "XPC_TYPE_DATE";
  if (a1 == MEMORY[0x24BDACF90])
    return "XPC_TYPE_DATA";
  if (a1 == MEMORY[0x24BDACFF0])
    return "XPC_TYPE_STRING";
  if (a1 == MEMORY[0x24BDAD000])
    return "XPC_TYPE_UUID";
  if (a1 == MEMORY[0x24BDACFC0])
    return "XPC_TYPE_FD";
  if (a1 == MEMORY[0x24BDACFE8])
    return "XPC_TYPE_SHMEM";
  if (a1 == MEMORY[0x24BDACF78])
    return "XPC_TYPE_ARRAY";
  if (a1 == MEMORY[0x24BDACFA0])
    return "XPC_TYPE_DICTIONARY";
  if (a1 == MEMORY[0x24BDACFB8])
    return "XPC_TYPE_ERROR";
  return "Unknown type";
}

void errorEvent(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;

  v3 = a1;
  v4 = MEMORY[0x227665CF0]();
  v5 = MEMORY[0x24BDACB70];
  v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    errorEvent_cold_1(a2, v4, v3);

}

void logEvent(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  uint64_t v10;

  v3 = a1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = __logEvent_block_invoke;
  v8 = &unk_24E6AB078;
  v4 = v3;
  v9 = v4;
  v10 = a2;
  v5 = v6;
  if (getLogHandle_onceToken != -1)
    dispatch_once(&getLogHandle_onceToken, &__block_literal_global);
  if (getLogHandle_gLogHandle && *(int *)(getLogHandle_gLogHandle + 44) >= 5)
    v7((uint64_t)v5);

}

void __logEvent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  const char *v6;
  const char *string;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x227665CF0](*(_QWORD *)(a1 + 32));
  v3 = MEMORY[0x24BDACB70];
  v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = stringForXPCType(v2);
    if (v2 == MEMORY[0x24BDACFB8])
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x24BDACF40]);
    else
      string = (const char *)&unk_220DB590F;
    v8 = 136315650;
    v9 = v5;
    v10 = 2080;
    v11 = v6;
    v12 = 2080;
    v13 = string;
    _os_log_impl(&dword_220DB2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

}

void __printObjectToString_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = (id)printObjectToString(a2, (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));
  v6 = (id)printObjectToString(CFSTR(" : "), (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));
  v7 = (id)printObjectToString(v9, (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));
  v8 = (id)printObjectToString(CFSTR("\n"), (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));

}

id __printObjectToString_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)printObjectToString(a2, (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));
  return (id)printObjectToString(CFSTR("\n"), (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));
}

id __printObjectToString_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)printObjectToString(a2, (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));
  return (id)printObjectToString(CFSTR("\n"), (*(_DWORD *)(a1 + 40) + 1), *(_QWORD *)(a1 + 32));
}

void serviceIsAttachedToRemovableDevice_cold_1(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_220DB2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "IORegistryEntryGetParentIterator failed: %s", buf, 0xCu);
}

void errorEvent_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v6;
  const char *string;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = stringForXPCType(a2);
  if (a2 == MEMORY[0x24BDACFB8])
    string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x24BDACF40]);
  else
    string = (const char *)&unk_220DB590F;
  v8 = 136315650;
  v9 = a1;
  v10 = 2080;
  v11 = v6;
  v12 = 2080;
  v13 = string;
  _os_log_error_impl(&dword_220DB2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s %s %s", (uint8_t *)&v8, 0x20u);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x24BDD86D8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return MEMORY[0x24BDD88E8](*(_QWORD *)&entry, plane, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return MEMORY[0x24BDD8900](*(_QWORD *)&entry, plane, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return MEMORY[0x24BDD89A0](*(_QWORD *)&service, matching, matches);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x24BDD89C8](*(_QWORD *)&service, waitTime);
}

uint64_t MOLogOpen()
{
  return MEMORY[0x24BE67710]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0690](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

