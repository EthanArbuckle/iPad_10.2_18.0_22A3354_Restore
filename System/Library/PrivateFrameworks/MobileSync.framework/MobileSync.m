void _resetDataSourceState()
{
  if (sDataSourceCreators)
  {
    CFRelease((CFTypeRef)sDataSourceCreators);
    sDataSourceCreators = 0;
  }
}

uint64_t CreateDataSourceForDataClassName(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef *a5)
{
  uint64_t (*Value)(uint64_t, uint64_t, uint64_t, CFStringRef *);

  if (!a3 || !a1)
    return DLSetStatus();
  if ((sDataSourcesInitialized & 1) == 0)
  {
    _dataSourceRegisterCreatorForDataClassName(CFSTR("com.apple.Bookmarks"));
    _dataSourceRegisterCreatorForDataClassName(CFSTR("com.apple.Calendars"));
    _dataSourceRegisterCreatorForDataClassName(CFSTR("com.apple.Contacts"));
    _dataSourceRegisterCreatorForDataClassName(CFSTR("com.apple.MailAccounts"));
    sDataSourcesInitialized = 1;
  }
  if (DLShouldLog())
    _DLLog();
  if (sDataSourceCreators)
  {
    Value = (uint64_t (*)(uint64_t, uint64_t, uint64_t, CFStringRef *))CFDictionaryGetValue((CFDictionaryRef)sDataSourceCreators, a1);
    if (Value)
      return Value(a3, a2, a4, a5);
  }
  if (a5)
    *a5 = CFStringCreateWithFormat(0, 0, CFSTR("CreateDataSourceForDataClassName: Data Source is not registered for %@"), a1);
  return 0xFFFFFFFFLL;
}

uint64_t DataSourceDeleteDataSource(uint64_t a1)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 128))();
  else
    return DLSetStatus();
}

uint64_t DataSourceShouldLockData(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t DataSourceLockFilePath(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t DataSourceGetVersion(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t DataSourceCanSyncWithVersion(uint64_t a1, const __CFNumber *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t valuePtr;
  CFNumberRef number;

  number = 0;
  (*(void (**)(uint64_t, CFNumberRef *, uint64_t))(a1 + 16))(a1, &number, a4);
  valuePtr = 0;
  if (a2 && number)
  {
    CFNumberGetValue(number, kCFNumberIntType, (char *)&valuePtr + 4);
    CFNumberGetValue(a2, kCFNumberIntType, &valuePtr);
    if ((_DWORD)valuePtr != -1 && SHIDWORD(valuePtr) > (int)valuePtr)
    {
      v8 = (*(uint64_t (**)(uint64_t, const __CFNumber *, _QWORD *, uint64_t))(a1 + 24))(a1, a2, a3, a4);
      goto LABEL_9;
    }
    v8 = 0;
    v9 = (_QWORD *)MEMORY[0x24BDBD270];
  }
  else
  {
    v8 = 0;
    v9 = (_QWORD *)MEMORY[0x24BDBD268];
  }
  *a3 = *v9;
LABEL_9:
  if (DLShouldLog())
    _DLLog();
  return v8;
}

uint64_t DataSourceMigrateRecords(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(void);

  if (!a1 || !a2 || a1 == a2)
    return DLSetStatus();
  v2 = *(uint64_t (**)(void))(a1 + 32);
  if (v2)
    return v2();
  else
    return 0;
}

uint64_t DataSourceRemoveStore(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (!a1)
    return DLSetStatus();
  v1 = *(uint64_t (**)(void))(a1 + 40);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t DataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CFTypeRef *a5, uint64_t a6)
{
  uint64_t v7;

  if (!a1 || !a2 || !a5 || !a6)
    return DLSetStatus();
  v7 = (*(uint64_t (**)(void))(a1 + 48))();
  if (*a5)
  {
    if (CFStringCompare((CFStringRef)*a5, CFSTR("---DATACLASS_CLEARED---"), 0) == kCFCompareEqualTo)
    {
      CFRelease(*a5);
      *a5 = 0;
    }
  }
  return v7;
}

uint64_t DataSourceClearSyncAnchors(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (!a1)
    return DLSetStatus();
  v1 = *(uint64_t (**)(void))(a1 + 56);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t DataSourceClearAllRecords(uint64_t a1)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 64))();
  else
    return DLSetStatus();
}

uint64_t DataSourceGetChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3)
    return (*(uint64_t (**)(void))(a1 + 72))();
  else
    return DLSetStatus();
}

uint64_t DataSourceGetAllRecords(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3)
    return (*(uint64_t (**)(void))(a1 + 80))();
  else
    return DLSetStatus();
}

uint64_t DataSourceGetCountOfRecords(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return (*(uint64_t (**)(void))(a1 + 88))();
  else
    return DLSetStatus();
}

uint64_t DataSourceProcessChanges(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 && a2 && a4)
    return (*(uint64_t (**)(void))(a1 + 96))();
  else
    return DLSetStatus();
}

uint64_t DataSourceCommit(uint64_t a1)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 104))();
  else
    return DLSetStatus();
}

uint64_t DataSourceRollback(uint64_t a1)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 112))();
  else
    return DLSetStatus();
}

uint64_t DataSourceGetEntityTypeProcessOrder(uint64_t a1)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 120))();
  else
    return DLSetStatus();
}

void _dataSourceRegisterCreatorForDataClassName(CFStringRef theString1)
{
  const void *v2;

  if (theString1)
  {
    if (!sDataSourceCreators)
      sDataSourceCreators = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], 0);
    if (CFStringCompare(theString1, CFSTR("com.apple.Bookmarks"), 0))
    {
      if (CFStringCompare(theString1, CFSTR("com.apple.Calendars"), 0))
      {
        if (CFStringCompare(theString1, CFSTR("com.apple.Contacts"), 0))
        {
          if (CFStringCompare(theString1, CFSTR("com.apple.MailAccounts"), 0))
            v2 = 0;
          else
            v2 = MailAccountsDataSourceCreator;
        }
        else
        {
          v2 = ContactsDataSourceCreator;
        }
      }
      else
      {
        v2 = CalendarsDataSourceCreator;
      }
    }
    else
    {
      v2 = BookmarksDataSourceCreator;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)sDataSourceCreators, theString1, v2);
  }
  else
  {
    DLSetStatus();
  }
}

uint64_t ContactsDataSourceCreator(_QWORD *a1, uint64_t a2, const __CFDictionary *a3, CFStringRef *a4)
{
  char *v8;
  const __CFAllocator *v9;
  const CFDictionaryKeyCallBacks *v10;
  const CFDictionaryValueCallBacks *v11;
  ABAddressBookRef v12;
  const __CFBoolean *Value;
  const __CFBoolean *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  void *ValueAtIndex;
  void *v18;
  CFTypeRef v19;
  const void *v20;
  BOOL v21;
  __CFError *v22;
  const void *v23;
  const void *v24;
  const __CFBoolean *v25;
  ABRecordRef v26;
  const void *v27;
  ABRecordID RecordID;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  char v32;
  CFErrorRef v33;
  const __CFBoolean *v34;
  ABRecordRef v35;
  const void *v36;
  ABRecordID v37;
  const void *v38;
  int AppIntegerValue;
  int v40;
  int v41;
  uint64_t result;
  CFErrorRef error;
  CFErrorRef v44;
  CFErrorRef v45;

  v8 = (char *)malloc_type_calloc(0x1C0uLL, 1uLL, 0x373D4789uLL);
  *a1 = v8;
  *(_QWORD *)v8 = *MEMORY[0x24BDBD268];
  *((_QWORD *)v8 + 2) = ContactsDataSourceGetVersionFunction;
  *((_QWORD *)v8 + 3) = ContactsDataSourceCanSyncWithVersionFunction;
  *((_QWORD *)v8 + 4) = ContactsDataSourceMigrateFunction;
  *((_QWORD *)v8 + 5) = ContactsDataSourceRemoveStoreFunction;
  *((_QWORD *)v8 + 6) = ContactsDataSourceGetSyncTypeAndExchangeSyncAnchors;
  *((_QWORD *)v8 + 7) = ContactsDataSourceClearSyncAnchors;
  *((_QWORD *)v8 + 8) = ContactsDataSourceClearAllRecords;
  *((_QWORD *)v8 + 9) = ContactsDataSourceGetChanges;
  *((_QWORD *)v8 + 10) = ContactsDataSourceGetAllRecords;
  *((_QWORD *)v8 + 11) = ContactsDataSourceGetCountOfRecords;
  *((_QWORD *)v8 + 12) = ContactsDataSourceProcessChanges;
  *((_QWORD *)v8 + 13) = ContactsDataSourceCommit;
  *((_QWORD *)v8 + 14) = ContactsDataSourceRollback;
  *((_QWORD *)v8 + 15) = ContactsDataSourceGetEntityTypeProcessOrder;
  *((_QWORD *)v8 + 16) = ContactsDataSourceDeleteDataSource;
  v8[136] = 0;
  v8[138] = 0;
  *((_DWORD *)v8 + 35) = 0;
  *((_QWORD *)v8 + 22) = 0;
  *((_DWORD *)v8 + 108) = 0;
  *((_QWORD *)v8 + 32) = 0;
  *((_OWORD *)v8 + 14) = 0u;
  *((_OWORD *)v8 + 15) = 0u;
  *((_OWORD *)v8 + 12) = 0u;
  *((_OWORD *)v8 + 13) = 0u;
  *(_OWORD *)(v8 + 280) = 0u;
  *(_OWORD *)(v8 + 296) = 0u;
  *(_OWORD *)(v8 + 312) = 0u;
  *(_OWORD *)(v8 + 328) = 0u;
  *(_OWORD *)(v8 + 344) = 0u;
  *(_OWORD *)(v8 + 360) = 0u;
  *(_OWORD *)(v8 + 376) = 0u;
  *(_OWORD *)(v8 + 392) = 0u;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  *((_QWORD *)v8 + 51) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *((_QWORD *)v8 + 52) = CFDictionaryCreateMutable(v9, 0, v10, v11);
  error = 0;
  v12 = ABAddressBookCreateWithOptions(0, &error);
  *((_QWORD *)v8 + 18) = v12;
  if (!v12)
  {
    if (DLShouldLog())
      goto LABEL_98;
    return 0xFFFFFFFFLL;
  }
  ABAddressBookSetIsBackgroundProcess();
  *((_WORD *)v8 + 220) = 0;
  if (a3)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("UseImageChangedPlaceholder"));
    if (Value)
    {
      v8[440] = CFBooleanGetValue(Value) != 0;
      if (DLShouldLog())
        _DLLog();
    }
    v14 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("UpdateAnchorsOnPull"));
    if (v14)
    {
      v8[441] = CFBooleanGetValue(v14) != 0;
      if (DLShouldLog())
        _DLLog();
    }
  }
  v8[443] = 0;
  v45 = 0;
  if (!a2)
  {
    v29 = ABAddressBookCopyLocalSource();
    *((_QWORD *)v8 + 19) = v29;
    if (v29)
    {
      v8[443] = 1;
    }
    else if (a4)
    {
      *a4 = CFSTR("Could not get the default address book store");
    }
    goto LABEL_92;
  }
  v15 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier();
  v16 = v15;
  if (v15 && CFArrayGetCount(v15) >= 1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v16, 0);
    CFRetain(ValueAtIndex);
LABEL_19:
    CFRelease(v16);
    goto LABEL_20;
  }
  v18 = (void *)ABAddressBookCopySourceWithAccountAndExternalIdentifiers();
  ValueAtIndex = v18;
  if (v18)
  {
    v19 = ABRecordCopyValue(v18, *MEMORY[0x24BE02920]);
    if (v19)
    {
      v20 = v19;
      _makeAccountForSource((uint64_t)v8, ValueAtIndex);
      CFRelease(v20);
    }
  }
  if (v16)
    goto LABEL_19;
LABEL_20:
  v21 = ValueAtIndex == 0;
  v22 = (__CFError *)ValueAtIndex;
  if (ValueAtIndex)
    goto LABEL_102;
  if (DLShouldLog())
    _DLLog();
  v30 = ABSourceCreate();
  if (!v30)
  {
    if (DLShouldLog())
      _DLLog();
    if (a4)
    {
      *a4 = CFSTR("Could not create an AddressBook store");
      CFRetain(CFSTR("Could not create an AddressBook store"));
    }
    goto LABEL_92;
  }
  v22 = (__CFError *)v30;
  if (DLShouldLog())
    _DLLog();
  if (!_makeAccountForSource((uint64_t)v8, v22))
  {
    if (DLShouldLog())
      _DLLog();
    if (a4)
      *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Could not set external identifier on AB store: %@"), 0);
    v33 = v22;
    goto LABEL_91;
  }
  v31 = ABAddressBookAddRecord(*((ABAddressBookRef *)v8 + 18), v22, &v45);
  if (!v31)
  {
    if (DLShouldLog())
      _DLLog();
    if (a4)
      *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Could not add store to AddressBook: %@"), v45);
    CFRelease(v22);
    v22 = 0;
  }
  if (v45)
  {
    CFRelease(v45);
    v45 = 0;
  }
  v32 = !v31;
  if (!v22)
    v32 = 1;
  if ((v32 & 1) == 0)
  {
LABEL_102:
    if (DLShouldLog())
      _DLLog();
    if (a3)
    {
      v23 = CFDictionaryGetValue(a3, CFSTR("StoreDisplayName"));
      if (v23)
      {
        if (!ABRecordSetValue(v22, *MEMORY[0x24BE02928], v23, &v45) && DLShouldLog())
          _DLLog();
        if (v45)
        {
          CFRelease(v45);
          v45 = 0;
        }
      }
      v24 = CFDictionaryGetValue(a3, CFSTR("StoreType"));
      if (v24)
      {
        if (!ABRecordSetValue(v22, *MEMORY[0x24BE02930], v24, &v45) && DLShouldLog())
          _DLLog();
        if (v45)
        {
          CFRelease(v45);
          v45 = 0;
        }
      }
      v25 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("SetAsDefault"));
      if (v25 && CFBooleanGetValue(v25))
      {
        v26 = ABAddressBookCopyDefaultSource(*((ABAddressBookRef *)v8 + 18));
        if (v26)
        {
          v27 = v26;
          RecordID = ABRecordGetRecordID(v26);
          CFRelease(v27);
        }
        else
        {
          RecordID = -1;
        }
        v34 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("SetAsDefaultOnlyIfNotSet"));
        if (v34)
          CFBooleanGetValue(v34);
        if (DLShouldLog())
        {
          ABRecordGetRecordID(v22);
          _DLLog();
        }
        if (!ValueAtIndex)
          ABAddressBookProcessAddedRecords();
        ABAddressBookSetDefaultSource();
        v35 = ABAddressBookCopyDefaultSource(*((ABAddressBookRef *)v8 + 18));
        if (v35)
        {
          v36 = v35;
          v37 = ABRecordGetRecordID(v35);
          CFRelease(v36);
        }
        else
        {
          v37 = -1;
        }
        if (v37 != RecordID)
        {
          if (DLShouldLog())
            _DLLog();
          v21 = 1;
        }
      }
    }
    v38 = (const void *)*((_QWORD *)v8 + 19);
    if (v38)
      CFRelease(v38);
    *((_QWORD *)v8 + 19) = v22;
    if (!v21)
      goto LABEL_92;
  }
  else if (!v31)
  {
    goto LABEL_92;
  }
  v44 = 0;
  ABAddressBookSave(*((ABAddressBookRef *)v8 + 18), &v44);
  if (v44)
  {
    *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Could not save new AddressBook store: %@"), v44);
    v33 = v44;
    if (v44)
LABEL_91:
      CFRelease(v33);
  }
LABEL_92:
  if (!*((_QWORD *)v8 + 19))
  {
    if (DLShouldLog())
LABEL_98:
      _DLLog();
    return 0xFFFFFFFFLL;
  }
  *((_DWORD *)v8 + 106) = 0;
  *((_QWORD *)v8 + 20) = 0;
  *((_QWORD *)v8 + 21) = 0;
  LOBYTE(v45) = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("MaxCompressedImageSize"), CFSTR("com.apple.SyncAgent"), (Boolean *)&v45);
  if ((_BYTE)v45)
    v40 = AppIntegerValue;
  else
    v40 = 768000;
  *((_DWORD *)v8 + 107) = v40;
  ABChangeHistorySetAddressBookClientIdentifier();
  v41 = ABChangeHistoryRegisterClientForSource();
  result = 0;
  *((_DWORD *)v8 + 109) = v41;
  v8[442] = 0;
  return result;
}

uint64_t ContactsDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3;
  int valuePtr;

  v3 = (CFNumberRef)sContactsDataSourceVersionNumber;
  if (!sContactsDataSourceVersionNumber)
  {
    valuePtr = 106;
    v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    sContactsDataSourceVersionNumber = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t ContactsDataSourceCanSyncWithVersionFunction(uint64_t a1, CFNumberRef number, _QWORD *a3)
{
  int v5;
  _QWORD *v6;
  int valuePtr;

  valuePtr = 0;
  CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
  v5 = valuePtr;
  if (valuePtr == 104)
  {
    if (DLShouldLog())
      _DLLog();
  }
  else
  {
    if (valuePtr != 103)
      goto LABEL_9;
    if (DLShouldLog())
      _DLLog();
    *(_BYTE *)(a1 + 138) = 1;
  }
  v5 = valuePtr;
LABEL_9:
  if (v5 <= 105)
  {
    if (DLShouldLog())
      _DLLog();
    *(_BYTE *)(a1 + 440) = 0;
    v5 = valuePtr;
  }
  if (v5 <= 102)
    v6 = (_QWORD *)MEMORY[0x24BDBD268];
  else
    v6 = (_QWORD *)MEMORY[0x24BDBD270];
  *a3 = *v6;
  return 0;
}

uint64_t ContactsDataSourceMigrateFunction(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2)
  {
    if (DLShouldLog())
    {
      ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
      ABRecordGetRecordID(*(ABRecordRef *)(a2 + 152));
      _DLLog();
    }
    if ((ABAddressBookMoveAllRecordsInSourceToSource() & 1) != 0)
    {
      ContactsDataSourceClearSyncAnchors(a1);
      ContactsDataSourceClearSyncAnchors(a2);
      return 0;
    }
    else
    {
      if (DLShouldLog())
        _DLLog();
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t ContactsDataSourceRemoveStoreFunction(uint64_t a1, const __CFDictionary *a2)
{
  ABRecordRef v4;
  const void *v5;
  ABRecordID RecordID;
  ABRecordID v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  const void *ValueAtIndex;
  const __CFArray *v14;
  const __CFArray *v15;
  CFIndex v16;
  CFIndex v17;
  CFIndex j;
  const void *v19;
  const __CFArray *v20;
  const __CFArray *v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex v24;
  ABPropertyID v25;
  const void *v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  const void *v29;
  int valuePtr;
  CFErrorRef error;

  error = 0;
  _setComputerSyncAnchorForStore(a1);
  _setDeviceSyncAnchorForStore(a1);
  v4 = ABAddressBookCopyDefaultSource(*(ABAddressBookRef *)(a1 + 144));
  if (v4)
  {
    v5 = v4;
    RecordID = ABRecordGetRecordID(v4);
    CFRelease(v5);
  }
  else
  {
    RecordID = -1;
  }
  if (!ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152)))
  {
    v8 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
    if (v8)
    {
      v9 = v8;
      Count = CFArrayGetCount(v8);
      if (Count >= 1)
      {
        v11 = Count;
        for (i = 0; i != v11; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v9, i);
          if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), ValueAtIndex, &error)
            && DLShouldLog())
          {
            ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
            _DLLog();
          }
        }
      }
      CFRelease(v9);
    }
    v14 = ABAddressBookCopyArrayOfAllGroupsInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
    if (v14)
    {
      v15 = v14;
      v16 = CFArrayGetCount(v14);
      if (v16 >= 1)
      {
        v17 = v16;
        for (j = 0; j != v17; ++j)
        {
          v19 = CFArrayGetValueAtIndex(v15, j);
          if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), v19, &error) && DLShouldLog())
          {
            ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
            _DLLog();
          }
        }
      }
      CFRelease(v15);
    }
LABEL_26:
    if (!a2 || CFDictionaryGetValue(a2, CFSTR("ClearDefaultStore")) != (const void *)*MEMORY[0x24BDBD270])
      return (ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error) - 1);
    goto LABEL_28;
  }
  v7 = ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
  if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152), &error)
    && DLShouldLog())
  {
    ABRecordGetRecordID(*(ABRecordRef *)(a1 + 152));
    _DLLog();
  }
  if (v7 != RecordID)
    goto LABEL_26;
LABEL_28:
  v20 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
  if (v20)
  {
    v21 = v20;
    v22 = CFArrayGetCount(v20);
    if (v22 >= 1)
    {
      v23 = v22;
      v24 = 0;
      v25 = *MEMORY[0x24BE02930];
      do
      {
        v26 = CFArrayGetValueAtIndex(v21, v24);
        valuePtr = -1;
        v27 = (const __CFNumber *)ABRecordCopyValue(v26, v25);
        if (v27)
        {
          v28 = v27;
          CFNumberGetValue(v27, kCFNumberIntType, &valuePtr);
          if (valuePtr)
          {
            CFRetain(v26);
            CFRelease(v28);
            if (v26)
              goto LABEL_38;
          }
          else
          {
            CFRelease(v28);
          }
        }
        ++v24;
      }
      while (v23 != v24);
    }
    v26 = 0;
LABEL_38:
    CFRelease(v21);
  }
  else
  {
    v26 = 0;
  }
  v29 = *(const void **)(a1 + 152);
  if (v29)
    CFRelease(v29);
  *(_QWORD *)(a1 + 152) = v26;
  ABAddressBookSetDefaultSource();
  return (ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error) - 1);
}

uint64_t ContactsDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, const __CFString *a3, const __CFString *cf, uint64_t *a5, CFTypeRef *a6)
{
  CFStringRef v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  int v16;
  CFStringRef v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFLocale *v21;
  __CFDateFormatter *v22;
  CFAbsoluteTime Current;
  CFStringRef StringWithAbsoluteTime;
  const void *v26;
  uint64_t v27;
  int v28;
  const __CFDictionary *EntityChangesSinceSequenceNumberForClient;
  const __CFDictionary *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v12 = _copyComputerSyncAnchorKey(a1);
    v13 = ABAddressBookCopyValue();
    if (!v13)
    {
      v14 = (const __CFString *)ABAddressBookCopyValue();
      if (v14)
      {
        v15 = v14;
        if (CFStringCompare(v14, CFSTR("__UNUSED__"), 0))
        {
          if (DLShouldLog())
            _DLLog();
          ABAddressBookSetValue();
          ABAddressBookSetValue();
          v13 = (uint64_t)CFRetain(v15);
        }
        else
        {
          v13 = 0;
        }
        CFRelease(v15);
      }
      else
      {
        v13 = 0;
      }
    }
    if (v12)
      CFRelease(v12);
  }
  else
  {
    v13 = 0;
  }
  if (cf
    && (*(_QWORD *)(a1 + 168) = CFRetain(cf),
        CFStringCompare(cf, CFSTR("---DATACLASS_CLEARED---"), 0) == kCFCompareEqualTo))
  {
    ABChangeHistoryUnregisterClientForSource();
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  if (DLShouldLog())
    _DLLog();
  *a2 = CFRetain(CFSTR("SDSyncTypeFast"));
  *a5 = v13;
  v17 = _copyDeviceSyncAnchorKey(a1);
  v18 = (const __CFString *)ABAddressBookCopyValue();
  if (!v18)
  {
    v19 = (const __CFString *)ABAddressBookCopyValue();
    if (v19)
    {
      v20 = v19;
      if (CFStringCompare(v19, CFSTR("__UNUSED__"), 0))
      {
        if (DLShouldLog())
          _DLLog();
        ABAddressBookSetValue();
        ABAddressBookSetValue();
        v18 = (const __CFString *)CFRetain(v20);
      }
      else
      {
        v18 = 0;
      }
      CFRelease(v20);
    }
    else
    {
      v18 = 0;
    }
  }
  if (v17)
    CFRelease(v17);
  if (DLShouldLog())
    _DLLog();
  if (v18)
  {
    if (a3 && CFStringCompare(v18, a3, 0) == kCFCompareEqualTo)
    {
      if (!v16)
        goto LABEL_39;
      v26 = (const void *)*MEMORY[0x24BE02628];
      v31[0] = *MEMORY[0x24BE02628];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v27 = 0;
      v28 = 0;
      do
      {
        EntityChangesSinceSequenceNumberForClient = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
        if (EntityChangesSinceSequenceNumberForClient)
        {
          v30 = EntityChangesSinceSequenceNumberForClient;
          if (CFDictionaryGetCount(EntityChangesSinceSequenceNumberForClient) >= 1)
            v28 |= objc_msgSend((id)CFDictionaryGetValue(v30, v26), "BOOLValue");
        }
        v27 += 4;
      }
      while (v27 != 12);
      if ((v28 & 1) == 0)
        goto LABEL_39;
      if (DLShouldLog())
        goto LABEL_37;
    }
    else if (DLShouldLog())
    {
LABEL_37:
      _DLLog();
    }
    *a2 = CFRetain(CFSTR("SDSyncTypeSlow"));
LABEL_39:
    CFRelease(v18);
    goto LABEL_43;
  }
  if (DLShouldLog())
    _DLLog();
  *a2 = CFRetain(CFSTR("SDSyncTypeReset"));
LABEL_43:
  v21 = CFLocaleCopyCurrent();
  v22 = CFDateFormatterCreate(0, v21, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
  CFDateFormatterSetFormat(v22, CFSTR("MMM dd yyyy HH:mm:ss ZZZ"));
  Current = CFAbsoluteTimeGetCurrent();
  StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(0, v22, Current);
  *(_QWORD *)(a1 + 160) = StringWithAbsoluteTime;
  *a6 = CFRetain(StringWithAbsoluteTime);
  if (DLShouldLog())
    _DLLog();
  if (v22)
    CFRelease(v22);
  if (v21)
    CFRelease(v21);
  return 0;
}

uint64_t ContactsDataSourceClearSyncAnchors(uint64_t a1)
{
  _BOOL4 v2;
  CFErrorRef error;

  error = 0;
  _setComputerSyncAnchorForStore(a1);
  _setDeviceSyncAnchorForStore(a1);
  v2 = ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error);
  if (error)
    CFRelease(error);
  return (v2 - 1);
}

uint64_t ContactsDataSourceClearAllRecords(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  const __CFArray *v5;

  v2 = ABAddressBookCopyArrayOfAllGroupsInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
  if (v2)
  {
    v3 = v2;
    _RemoveRecordsFromAddressBook(a1, v2, 0);
    CFRelease(v3);
  }
  v4 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
  if (v4)
  {
    v5 = v4;
    _RemoveRecordsFromAddressBook(a1, v4, (void (*)(uint64_t, const void *))_SaveClearedPersonsSounds);
    CFRelease(v5);
  }
  if ((*(_DWORD *)(a1 + 436) & 0x80000000) == 0)
    ABChangeHistoryClearChangesUpToSequenceNumberForClient();
  if (!*(_QWORD *)(a1 + 160))
    *(_QWORD *)(a1 + 160) = CFRetain(CFSTR("---"));
  _setDeviceSyncAnchorForStore(a1);
  return 0;
}

uint64_t ContactsDataSourceGetChanges(uint64_t a1, __CFDictionary **a2, const __CFAllocator *a3, _QWORD *a4)
{
  uint64_t v6;
  const void *v7;
  int v8;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  const __CFAllocator *Mutable;
  const void *v19;
  const void *v20;
  const __CFDictionary *EntityChangesSinceSequenceNumberForClient;
  const __CFDictionary *v22;
  const __CFArray *Value;
  const __CFArray *v24;
  CFIndex Count;
  CFIndex v26;
  CFIndex v27;
  const void *ValueAtIndex;
  const __CFArray *v29;
  const void *v30;
  ABRecordRef PersonWithRecordID;
  CFTypeRef v32;
  const void *v33;
  CFIndex IndexForIdentifier;
  BOOL v35;
  CFStringRef v36;
  const void *v37;
  const __CFDictionary *v38;
  CFAllocatorRef *v39;
  const __CFDictionary *v40;
  const __CFArray *v41;
  const __CFArray *v42;
  CFIndex v43;
  uint64_t v44;
  CFIndex v45;
  __CFDictionary *v46;
  __CFSet *v47;
  CFIndex v48;
  const void *v49;
  unsigned int HasImageData;
  unsigned int v51;
  unsigned int v52;
  ABRecordRef v53;
  const void *v54;
  __CFDictionary *v55;
  const void *v56;
  CFStringRef v57;
  const __CFArray *v58;
  uint64_t v59;
  CFIndex v60;
  __CFSet *v61;
  __CFArray *v62;
  CFIndex v63;
  const __CFAllocator *v64;
  const void *v65;
  unsigned int v66;
  ABRecordRef GroupWithRecordID;
  const void *v68;
  CFStringRef v69;
  const __CFAllocator *v70;
  const void *v72;
  const __CFArray *v73;
  const void *v74;
  _QWORD *v75;
  const void *v76;
  CFAllocatorRef allocator;
  const __CFAllocator *allocatora;
  __CFDictionary **v79;
  __CFDictionary **v80;
  const __CFArray *key;
  void *keya;
  CFIndex theArray;
  const __CFArray *theArraya;
  CFAllocatorRef v86;
  _QWORD v87[2];
  _QWORD v88[3];
  _QWORD v89[7];

  v6 = a1;
  v89[5] = *MEMORY[0x24BDAC8D0];
  v7 = (const void *)*MEMORY[0x24BDBD270];
  *(_QWORD *)a3 = *MEMORY[0x24BDBD270];
  v8 = *(_DWORD *)(a1 + 140);
  if (v8 == 8)
  {
    if (DLShouldLog())
      _DLLog();
    allocator = a3;
    v79 = a2;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
    v86 = Mutable;
    if (*(_QWORD *)(v6 + 176))
    {
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x24BE02718], CFSTR("com.apple.contacts.Email Address"), Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x24BE028C0], CFSTR("com.apple.contacts.Phone Number"), Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x24BE026B8], CFSTR("com.apple.contacts.Street Address"), Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x24BE02900], CFSTR("com.apple.contacts.URL"), Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x24BE028E0], CFSTR("com.apple.contacts.Related Name"), Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x24BE02780], CFSTR("com.apple.contacts.IM"), Mutable);
      _AccumulatePropertiesForType((const __CFArray **)v6, *MEMORY[0x24BE02700], CFSTR("com.apple.contacts.Date"), Mutable);
    }
    v19 = (const void *)*MEMORY[0x24BE02650];
    keya = (void *)*MEMORY[0x24BE02660];
    v88[0] = *MEMORY[0x24BE02660];
    v88[1] = v19;
    v20 = (const void *)*MEMORY[0x24BE02648];
    v88[2] = *MEMORY[0x24BE02648];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 3);
    EntityChangesSinceSequenceNumberForClient = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
    if (!EntityChangesSinceSequenceNumberForClient)
      goto LABEL_31;
    v22 = EntityChangesSinceSequenceNumberForClient;
    if (CFDictionaryGetCount(EntityChangesSinceSequenceNumberForClient) < 1)
      goto LABEL_31;
    Value = (const __CFArray *)CFDictionaryGetValue(v22, keya);
    theArraya = (const __CFArray *)CFDictionaryGetValue(v22, v19);
    v24 = (const __CFArray *)CFDictionaryGetValue(v22, v20);
    Count = CFArrayGetCount(Value);
    if (Count < 1)
      goto LABEL_31;
    v26 = Count;
    v27 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(Value, v27);
      v29 = (const __CFArray *)CFArrayGetValueAtIndex(theArraya, v27);
      v30 = CFArrayGetValueAtIndex(v24, v27);
      PersonWithRecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(v6 + 144), (ABRecordID)ValueAtIndex);
      if (PersonWithRecordID)
      {
        v32 = ABRecordCopyValue(PersonWithRecordID, (ABPropertyID)v29);
        if (!v32
          || (v33 = v32,
              IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v32, (ABMultiValueIdentifier)v30),
              CFRelease(v33),
              v35 = IndexForIdentifier == -1,
              v6 = a1,
              v35))
        {
          v36 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d/%d"), v29, ValueAtIndex, v30);
          if (!Mutable)
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
          CFDictionarySetValue(Mutable, v36, v36);
          if (v36)
            CFRelease(v36);
          goto LABEL_29;
        }
        if (DLShouldLog())
        {
          v73 = v29;
          v74 = ValueAtIndex;
          v72 = v30;
LABEL_28:
          _DLLog();
        }
      }
      else if (DLShouldLog())
      {
        v73 = v29;
        v74 = ValueAtIndex;
        v72 = v30;
        goto LABEL_28;
      }
LABEL_29:
      if (v26 == ++v27)
      {
        v86 = Mutable;
LABEL_31:
        v37 = (const void *)*MEMORY[0x24BE02630];
        v87[0] = keya;
        v87[1] = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2, v72, v73, v74);
        v38 = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
        v39 = v79;
        if (!v38)
          goto LABEL_125;
        v40 = v38;
        if (CFDictionaryGetCount(v38) < 1)
          goto LABEL_125;
        v41 = (const __CFArray *)CFDictionaryGetValue(v40, keya);
        v42 = (const __CFArray *)CFDictionaryGetValue(v40, v37);
        if (v41)
          v43 = CFArrayGetCount(v41);
        else
          v43 = 0;
        v60 = CFArrayGetCount(v41);
        if (v60 != CFArrayGetCount(v42))
        {
          if (DLShouldLog())
            _DLLog();
          goto LABEL_125;
        }
        if (v43 < 1)
        {
LABEL_125:
          if (DLShouldLog())
            _DLLog();
          if (!*(_BYTE *)(v6 + 441))
            _saveDeviceSyncAnchorAndClearChangeHistory(v6);
          v44 = 0;
          *v39 = v86;
          *(_QWORD *)allocator = *MEMORY[0x24BDBD268];
          *(_DWORD *)(v6 + 140) = 9;
          return v44;
        }
        if (DLShouldLog())
          _DLLog();
        v61 = 0;
        v62 = 0;
        v63 = 0;
        v64 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        while (2)
        {
          v65 = CFArrayGetValueAtIndex(v41, v63);
          v66 = CFArrayGetValueAtIndex(v42, v63);
          if (v66 > 1)
          {
            if (v66 == 2)
            {
              v69 = CFStringCreateWithFormat(0, 0, CFSTR("Group/%d"), v65);
              v70 = v86;
              if (!v86)
              {
                v70 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
                v86 = v70;
              }
              CFDictionarySetValue(v70, v69, v69);
              if (v69)
                CFRelease(v69);
              goto LABEL_115;
            }
            if (!DLShouldLog())
              goto LABEL_115;
          }
          else
          {
            GroupWithRecordID = ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(a1 + 144), (ABRecordID)v65);
            if (GroupWithRecordID)
            {
              v68 = GroupWithRecordID;
              if (v62)
              {
                if (v61)
                  goto LABEL_102;
LABEL_118:
                v61 = CFSetCreateMutable(0, 0, 0);
              }
              else
              {
                v62 = CFArrayCreateMutable(v64, 0, MEMORY[0x24BDBD690]);
                if (!v61)
                  goto LABEL_118;
              }
LABEL_102:
              if (!v86)
                v86 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
              if (!CFSetContainsValue(v61, (const void *)(int)v65))
              {
                CFSetAddValue(v61, (const void *)(int)v65);
                CFArrayAppendValue(v62, v68);
              }
LABEL_115:
              if (v43 == ++v63)
              {
                v39 = v79;
                if (v62)
                {
                  _AccumulateGroups(&v86, v62);
                  CFRelease(v62);
                }
                v6 = a1;
                if (v61)
                  CFRelease(v61);
                goto LABEL_125;
              }
              continue;
            }
            if (!DLShouldLog())
              goto LABEL_115;
          }
          break;
        }
        _DLLog();
        goto LABEL_115;
      }
    }
  }
  if (v8)
  {
    if (DLShouldLog())
      _DLLog();
    v44 = 0;
    *a2 = 0;
    *(_QWORD *)a3 = *MEMORY[0x24BDBD268];
    return v44;
  }
  if (DLShouldLog())
    _DLLog();
  v10 = (const void *)*MEMORY[0x24BE02660];
  v11 = (const void *)*MEMORY[0x24BE02630];
  v89[0] = *MEMORY[0x24BE02660];
  v89[1] = v11;
  v12 = (const void *)*MEMORY[0x24BE02638];
  v13 = (const void *)*MEMORY[0x24BE02640];
  v89[2] = *MEMORY[0x24BE02638];
  v89[3] = v13;
  v89[4] = *MEMORY[0x24BE02658];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 5);
  v14 = (const __CFDictionary *)ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient();
  if (!v14 || (v15 = v14, CFDictionaryGetCount(v14) < 1))
  {
    v44 = 0;
    goto LABEL_85;
  }
  v16 = (const __CFArray *)CFDictionaryGetValue(v15, v10);
  v17 = (const __CFArray *)CFDictionaryGetValue(v15, v11);
  CFDictionaryGetValue(v15, v12);
  key = (const __CFArray *)CFDictionaryGetValue(v15, v13);
  if (v16)
    theArray = CFArrayGetCount(v16);
  else
    theArray = 0;
  v45 = CFArrayGetCount(v16);
  if (v45 != CFArrayGetCount(v17))
  {
    if (DLShouldLog())
      _DLLog();
    if (a4)
    {
      *a4 = CFSTR("The changedIDs and changeTypes counts do not match");
      CFRetain(CFSTR("The changedIDs and changeTypes counts do not match"));
    }
    goto LABEL_82;
  }
  if (theArray < 1)
  {
LABEL_82:
    if (*a4)
      v44 = 0xFFFFFFFFLL;
    else
      v44 = 0;
    goto LABEL_85;
  }
  v75 = a4;
  v80 = a2;
  if (DLShouldLog())
  {
    v73 = v17;
    _DLLog();
  }
  v46 = 0;
  v47 = 0;
  v48 = 0;
  allocatora = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v76 = (const void *)*MEMORY[0x24BDBD268];
  do
  {
    while (1)
    {
      v49 = CFArrayGetValueAtIndex(v16, v48);
      HasImageData = CFArrayGetValueAtIndex(key, v48);
      v51 = CFArrayGetValueAtIndex(v17, v48);
      v52 = v51;
      if (v51 > 1)
        break;
      v53 = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a1 + 144), (ABRecordID)v49);
      if (!v53)
      {
        if (!DLShouldLog())
          goto LABEL_72;
        goto LABEL_71;
      }
      v54 = v53;
      if (!*(_QWORD *)(a1 + 176))
        *(_QWORD *)(a1 + 176) = CFArrayCreateMutable(allocatora, 0, MEMORY[0x24BDBD690]);
      if (v47)
      {
        if (v46)
          goto LABEL_51;
      }
      else
      {
        v47 = CFSetCreateMutable(0, 0, 0);
        if (v46)
        {
LABEL_51:
          if (v47)
            goto LABEL_52;
          goto LABEL_76;
        }
      }
      v46 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      if (v47)
      {
LABEL_52:
        if (!CFSetContainsValue(v47, (const void *)(int)v49))
        {
          CFSetAddValue(v47, (const void *)(int)v49);
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 176), v54);
          v55 = *(__CFDictionary **)(a1 + 184);
          if (!v55)
          {
            v55 = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
            *(_QWORD *)(a1 + 184) = v55;
          }
          if (!v52)
          {
            HasImageData = ABPersonHasImageData(v54);
            v55 = *(__CFDictionary **)(a1 + 184);
          }
          if (HasImageData)
            v56 = v7;
          else
            v56 = v76;
          CFDictionarySetValue(v55, (const void *)(int)v49, v56);
        }
        goto LABEL_72;
      }
LABEL_76:
      if (++v48 == theArray)
        goto LABEL_133;
    }
    if (v51 != 2)
    {
      if (!DLShouldLog())
        goto LABEL_72;
LABEL_71:
      _DLLog();
      goto LABEL_72;
    }
    if (DLShouldLog())
      _DLLog();
    v57 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), v49, v73);
    if (!v46)
      v46 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(v46, v57, v57);
    if (v57)
      CFRelease(v57);
LABEL_72:
    ++v48;
  }
  while (v48 != theArray);
  if (v47)
    CFRelease(v47);
LABEL_133:
  if (*v75)
    v44 = 0xFFFFFFFFLL;
  else
    v44 = 0;
  a2 = v80;
  if (!v46)
LABEL_85:
    v46 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  if (*(_QWORD *)(a1 + 176) && v46)
    _AccumulateContacts(a1, v46);
  *a2 = v46;
  v58 = *(const __CFArray **)(a1 + 176);
  if (!v58 || (v59 = *(int *)(a1 + 432), CFArrayGetCount(v58) == v59))
    *(_DWORD *)(a1 + 140) = 8;
  return v44;
}

uint64_t ContactsDataSourceGetAllRecords(uint64_t a1, CFMutableDictionaryRef *a2, _QWORD *a3)
{
  CFArrayRef v6;
  __CFDictionary *Mutable;
  uint64_t v8;
  CFIndex Count;
  int v10;
  int v11;
  uint64_t v12;
  __CFDictionary *v13;
  int v14;
  uint64_t v15;
  __CFDictionary *v16;
  uint64_t v17;
  __CFDictionary *v18;
  uint64_t v19;
  __CFDictionary *v20;
  uint64_t v21;
  __CFDictionary *v22;
  uint64_t v23;
  __CFDictionary *v24;
  uint64_t v25;
  __CFDictionary *v26;
  const __CFArray *v27;
  const __CFArray *v28;

  *a3 = *MEMORY[0x24BDBD270];
  switch(*(_DWORD *)(a1 + 140))
  {
    case 0:
      if (!*(_QWORD *)(a1 + 176))
      {
        v6 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
        *(_QWORD *)(a1 + 176) = v6;
        if (!v6)
        {
          *a2 = 0;
          goto LABEL_28;
        }
      }
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulateContacts(a1, Mutable);
      *a2 = Mutable;
      if (!Mutable)
      {
LABEL_28:
        v11 = 9;
LABEL_29:
        *(_DWORD *)(a1 + 140) = v11;
        goto LABEL_30;
      }
      v8 = *(int *)(a1 + 432);
      Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 176));
      v10 = DLShouldLog();
      if (Count == v8)
      {
        if (v10)
          _DLLog();
        v11 = 1;
        goto LABEL_29;
      }
      if (v10)
      {
        CFArrayGetCount(*(CFArrayRef *)(a1 + 176));
        _DLLog();
      }
      if (!*(_DWORD *)(a1 + 140))
        return 0;
LABEL_30:
      v27 = ABAddressBookCopyArrayOfAllGroupsInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
      if (v27)
      {
        v28 = v27;
        _AccumulateGroups(a2, v27);
        CFRelease(v28);
      }
      if (*(_DWORD *)(a1 + 140) == 9)
        goto LABEL_20;
      return 0;
    case 1:
      v12 = *MEMORY[0x24BE02718];
      v13 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v12, CFSTR("com.apple.contacts.Email Address"), v13);
      *a2 = v13;
      v14 = 2;
      goto LABEL_17;
    case 2:
      v15 = *MEMORY[0x24BE028C0];
      v16 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v15, CFSTR("com.apple.contacts.Phone Number"), v16);
      *a2 = v16;
      v14 = 3;
      goto LABEL_17;
    case 3:
      v17 = *MEMORY[0x24BE026B8];
      v18 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v17, CFSTR("com.apple.contacts.Street Address"), v18);
      *a2 = v18;
      v14 = 4;
      goto LABEL_17;
    case 4:
      v19 = *MEMORY[0x24BE02900];
      v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v19, CFSTR("com.apple.contacts.URL"), v20);
      *a2 = v20;
      v14 = 5;
      goto LABEL_17;
    case 5:
      v21 = *MEMORY[0x24BE028E0];
      v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v21, CFSTR("com.apple.contacts.Related Name"), v22);
      *a2 = v22;
      v14 = 6;
      goto LABEL_17;
    case 6:
      v23 = *MEMORY[0x24BE02780];
      v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v23, CFSTR("com.apple.contacts.IM"), v24);
      *a2 = v24;
      v14 = 7;
LABEL_17:
      *(_DWORD *)(a1 + 140) = v14;
      return 0;
    case 7:
      v25 = *MEMORY[0x24BE02700];
      v26 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      _AccumulatePropertiesForType((const __CFArray **)a1, v25, CFSTR("com.apple.contacts.Date"), v26);
      *a2 = v26;
      goto LABEL_19;
    default:
      if (DLShouldLog())
        _DLLog();
LABEL_19:
      *(_DWORD *)(a1 + 140) = 9;
LABEL_20:
      *a3 = *MEMORY[0x24BDBD268];
      if (!*(_BYTE *)(a1 + 441) && !*(_BYTE *)(a1 + 442))
        _saveDeviceSyncAnchorAndClearChangeHistory(a1);
      return 0;
  }
}

uint64_t ContactsDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  *a2 = ABAddressBookGetPersonCountInSource();
  return 0;
}

uint64_t ContactsDataSourceProcessChanges(uint64_t a1, CFDictionaryRef theDict, uint64_t a3, _QWORD *a4, const __CFDictionary *a5)
{
  uint64_t v7;
  const __CFBoolean *v8;
  const __CFDictionary *v9;
  const void *v10;
  const __CFDictionary *v11;
  const void *v12;
  CFIndex Count;
  CFIndex v14;
  uint64_t v15;
  CFIndex v16;
  const void *ValueAtIndex;
  const __CFArray *v18;
  const __CFArray *v19;
  uint64_t v20;
  __CFSet *Mutable;
  const __CFArray *v22;
  const __CFArray *v23;
  uint64_t v24;
  __CFSet *v25;
  CFIndex i;
  const void *v27;
  CFIndex v28;
  const __CFString *v29;
  const __CFDictionary *Value;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v32;
  const __CFString *v33;
  SInt32 IntValue;
  ABRecordRef GroupWithRecordID;
  int v36;
  SInt32 v37;
  CFIndex j;
  const void *v39;
  const void *v40;
  const __CFArray *v41;
  CFIndex v42;
  CFIndex v43;
  CFIndex v44;
  const char *v45;
  const __CFString *v46;
  const __CFArray *v47;
  CFIndex v48;
  const __CFString *v49;
  const __CFString *v50;
  const char *v51;
  const __CFString *v52;
  SInt32 v53;
  const __CFString *v54;
  SInt32 v55;
  ABRecordRef PersonWithRecordID;
  const void *v57;
  CFTypeRef v58;
  const void *v59;
  CFIndex IndexForIdentifier;
  CFIndex v61;
  ABMutableMultiValueRef MutableCopy;
  const void *v63;
  uint64_t v65;
  CFIndex v67;
  ABRecordRef record;
  const __CFSet *theSet;
  ABPropertyID property[2];
  SInt32 propertya;
  uint64_t v72;
  CFErrorRef error;

  v7 = a1;
  if (*(_BYTE *)(a1 + 443))
  {
    error = 0;
    if (!ABRecordSetValue(*(ABRecordRef *)(a1 + 152), *MEMORY[0x24BE02918], (CFTypeRef)*MEMORY[0x24BDBD270], &error))
    {
      if (DLShouldLog())
        _DLLog();
      if (error)
        CFRelease(error);
    }
    *(_BYTE *)(v7 + 443) = 0;
  }
  if (*(_BYTE *)(v7 + 441) && !*(_BYTE *)(v7 + 442))
    _saveDeviceSyncAnchorAndClearChangeHistory(v7);
  *(_QWORD *)(v7 + 240) = 0;
  if (!theDict || CFDictionaryGetCount(theDict) < 1)
    goto LABEL_146;
  *(_BYTE *)(v7 + 137) = 0;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_ChangesApplierFunction, (void *)v7);
  if (*(_BYTE *)(v7 + 137))
  {
    if (DLShouldLog())
      _DLLog();
    ABProcessAddedImages();
  }
  v72 = v7;
  if (!*(_BYTE *)(v7 + 136))
  {
    v8 = a5
       ? (const __CFBoolean *)CFDictionaryGetValue(a5, CFSTR("SyncDeviceLinkAllRecordsOfPulledEntityTypeSentKey"))
       : (const __CFBoolean *)*MEMORY[0x24BDBD270];
    if (*(_BYTE *)(v7 + 138) || v8 && CFBooleanGetValue(v8) == 1)
    {
      ABAddressBookProcessAddedRecords();
      v9 = *(const __CFDictionary **)(v7 + 200);
      if (v9)
      {
        CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)_UpdateContactRemapping, (void *)v7);
        v10 = *(const void **)(v7 + 200);
        if (v10)
        {
          CFRelease(v10);
          *(_QWORD *)(v7 + 200) = 0;
        }
      }
      if (*(_QWORD *)(v7 + 224))
      {
        v11 = *(const __CFDictionary **)(v7 + 208);
        if (v11)
        {
          CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)_UpdateGroupRemapping, (void *)v7);
          v12 = *(const void **)(v7 + 208);
          if (v12)
          {
            CFRelease(v12);
            *(_QWORD *)(v7 + 208) = 0;
          }
        }
        error = 0;
        Count = CFArrayGetCount(*(CFArrayRef *)(v7 + 224));
        v14 = CFArrayGetCount(*(CFArrayRef *)(v7 + 232));
        if (v14 != Count && DLShouldLog())
          _DLLog();
        if (v14 >= Count)
          v15 = Count;
        else
          v15 = v14;
        v65 = v15;
        if (v15 >= 1)
        {
          v16 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v7 + 224), v16);
            v18 = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v7 + 232), v16);
            v19 = v18;
            v67 = v16;
            if (v18)
            {
              v20 = CFArrayGetCount(v18);
              if (v20 >= 1)
              {
                Mutable = CFSetCreateMutable(0, v20, MEMORY[0x24BDBD6B8]);
                goto LABEL_42;
              }
            }
            else
            {
              v20 = 0;
            }
            Mutable = 0;
LABEL_42:
            v22 = (const __CFArray *)ABGroupCopyArrayOfAllMembersAndSubgroups();
            v23 = v22;
            if (!v22)
            {
              v24 = 0;
LABEL_48:
              theSet = 0;
              goto LABEL_49;
            }
            v24 = CFArrayGetCount(v22);
            if (v24 < 1)
              goto LABEL_48;
            v25 = CFSetCreateMutable(0, v24, MEMORY[0x24BDBD6B8]);
            for (i = 0; i != v24; ++i)
            {
              v27 = CFArrayGetValueAtIndex(v23, i);
              CFSetAddValue(v25, v27);
            }
            theSet = v25;
LABEL_49:
            record = ValueAtIndex;
            if (v20 >= 1)
            {
              v28 = 0;
              *(_QWORD *)property = v19;
              do
              {
                v29 = (const __CFString *)CFArrayGetValueAtIndex(v19, v28);
                Value = *(const __CFDictionary **)(v7 + 248);
                if (Value)
                  Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v29);
                if (Value)
                  v29 = (const __CFString *)Value;
                if (!recordIdentifierIsLocal(v29))
                {
                  if (DLShouldLog())
                    _DLLog();
                  goto LABEL_79;
                }
                ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v29, CFSTR("/"));
                v32 = ArrayBySeparatingStrings;
                if (ArrayBySeparatingStrings && CFArrayGetCount(ArrayBySeparatingStrings) == 2)
                {
                  v33 = (const __CFString *)CFArrayGetValueAtIndex(v32, 1);
                  if (!v33)
                    goto LABEL_78;
                  IntValue = CFStringGetIntValue(v33);
                  GroupWithRecordID = ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(v7 + 144), IntValue);
                  v36 = 1;
                  if (!GroupWithRecordID)
                    goto LABEL_60;
                }
                else
                {
                  if (!v29)
                    goto LABEL_77;
                  v37 = CFStringGetIntValue(v29);
                  GroupWithRecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(v7 + 144), v37);
                  v36 = 0;
                  if (!GroupWithRecordID)
                  {
LABEL_60:
                    if (DLShouldLog())
                      _DLLog();
                    goto LABEL_77;
                  }
                }
                CFSetAddValue(Mutable, GroupWithRecordID);
                if (!theSet || !CFSetContainsValue(theSet, GroupWithRecordID))
                {
                  if (DLShouldLog())
                  {
                    ABRecordGetRecordID(record);
                    v7 = v72;
                    _DLLog();
                  }
                  if (v36)
                  {
                    ABGroupAddSubgroup();
                  }
                  else
                  {
                    if (!ABGroupAddMember(record, GroupWithRecordID, &error) && DLShouldLog())
                    {
                      ABRecordGetRecordID(GroupWithRecordID);
                      ABRecordGetRecordID(record);
                      _DLLog();
                    }
                    if (error)
                    {
                      CFRelease(error);
                      error = 0;
                    }
                  }
                }
LABEL_77:
                v19 = *(const __CFArray **)property;
                if (v32)
LABEL_78:
                  CFRelease(v32);
LABEL_79:
                ++v28;
              }
              while (v20 != v28);
            }
            if (v24 >= 1)
            {
              for (j = 0; j != v24; ++j)
              {
                v39 = CFArrayGetValueAtIndex(v23, j);
                if (!Mutable || !CFSetContainsValue(Mutable, v39))
                {
                  if (DLShouldLog())
                  {
                    ABRecordGetRecordID(v39);
                    ABRecordGetRecordID(record);
                    v7 = v72;
                    _DLLog();
                  }
                  if (!ABGroupRemoveMember(record, v39, &error) && DLShouldLog())
                  {
                    ABRecordGetRecordID(v39);
                    ABRecordGetRecordID(record);
                    _DLLog();
                  }
                  if (error)
                  {
                    CFRelease(error);
                    error = 0;
                  }
                }
              }
            }
            if (v23)
              CFRelease(v23);
            if (Mutable)
              CFRelease(Mutable);
            if (theSet)
              CFRelease(theSet);
            v16 = v67 + 1;
          }
          while (v67 + 1 != v65);
        }
        v40 = *(const void **)(v7 + 224);
        if (v40)
        {
          CFRelease(v40);
          *(_QWORD *)(v7 + 224) = 0;
        }
      }
      *(_BYTE *)(v7 + 136) = 1;
    }
  }
  v41 = *(const __CFArray **)(v7 + 216);
  if (v41)
  {
    v42 = CFArrayGetCount(v41);
    if (v42 >= 1)
    {
      v43 = v42;
      v44 = 0;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Sync/DataSources/ContactsDataSource.m";
      do
      {
        v46 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v7 + 216), v44);
        v47 = CFStringCreateArrayBySeparatingStrings(0, v46, CFSTR("/"));
        if (DLShouldLog())
          _DLLog();
        if (!v47 || CFArrayGetCount(v47) != 3)
        {
          if (DLShouldLog())
            _DLLog();
          if (!v47)
            goto LABEL_142;
          goto LABEL_141;
        }
        v48 = v43;
        v49 = (const __CFString *)CFArrayGetValueAtIndex(v47, 0);
        v50 = (const __CFString *)CFArrayGetValueAtIndex(v47, 1);
        v51 = v45;
        v52 = (const __CFString *)CFArrayGetValueAtIndex(v47, 2);
        propertya = CFStringGetIntValue(v49);
        v53 = CFStringGetIntValue(v50);
        v54 = v52;
        v45 = v51;
        v55 = CFStringGetIntValue(v54);
        error = 0;
        if (DLShouldLog())
          _DLLog();
        PersonWithRecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(v72 + 144), v53);
        if (PersonWithRecordID)
        {
          v57 = PersonWithRecordID;
          v58 = ABRecordCopyValue(PersonWithRecordID, propertya);
          if (v58)
          {
            v59 = v58;
            IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v58, v55);
            if (IndexForIdentifier == -1)
            {
              v45 = v51;
              v43 = v48;
              if (DLShouldLog())
                _DLLog();
            }
            else
            {
              v61 = IndexForIdentifier;
              if (ABMultiValueGetCount(v59) < 2)
              {
                MutableCopy = 0;
              }
              else
              {
                MutableCopy = ABMultiValueCreateMutableCopy(v59);
                ABMultiValueRemoveValueAndLabelAtIndex(MutableCopy, v61);
              }
              v45 = v51;
              v43 = v48;
              if (!ABRecordRemoveValue(v57, propertya, &error) && DLShouldLog())
              {
                ABRecordGetRecordID(v57);
                _DLLog();
              }
              if (error)
              {
                CFRelease(error);
                error = 0;
              }
              if (MutableCopy)
              {
                ABMultiValueSetImmutable();
                if (!ABRecordSetValue(v57, propertya, MutableCopy, &error) && DLShouldLog())
                {
                  ABRecordGetRecordID(v57);
                  _DLLog();
                }
                if (error)
                {
                  CFRelease(error);
                  error = 0;
                }
                CFRelease(MutableCopy);
              }
            }
            CFRelease(v59);
            goto LABEL_140;
          }
          v43 = v48;
          if (DLShouldLog())
LABEL_123:
            _DLLog();
        }
        else
        {
          v43 = v48;
          if (DLShouldLog())
            goto LABEL_123;
        }
LABEL_140:
        v7 = v72;
LABEL_141:
        CFRelease(v47);
LABEL_142:
        ++v44;
      }
      while (v43 != v44);
    }
    v63 = *(const void **)(v7 + 216);
    if (v63)
      CFRelease(v63);
    *(_QWORD *)(v7 + 216) = 0;
  }
LABEL_146:
  *a4 = *(_QWORD *)(v7 + 240);
  return 0;
}

uint64_t ContactsDataSourceCommit(uint64_t a1, _QWORD *a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  BOOL v10;
  CFErrorRef error;

  if (DLShouldLog())
    _DLLog();
  v4 = ABAddressBookCopyArrayOfAllPeopleInSource(*(ABAddressBookRef *)(a1 + 144), *(ABRecordRef *)(a1 + 152));
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        _RestoreClearedPersonsSound(*(const __CFDictionary **)(a1 + 408), (uint64_t)ValueAtIndex);
        _RestoreClearedPersonsSound(*(const __CFDictionary **)(a1 + 416), (uint64_t)ValueAtIndex);
      }
    }
    CFRelease(v5);
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
  if (*(_BYTE *)(a1 + 441) && !*(_BYTE *)(a1 + 442))
    _saveDeviceSyncAnchorAndClearChangeHistory(a1);
  error = 0;
  if (!*(_QWORD *)(a1 + 168))
    *(_QWORD *)(a1 + 168) = CFRetain(CFSTR("---"));
  _setComputerSyncAnchorForStore(a1);
  v10 = ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error);
  if (!v10 && DLShouldLog())
    _DLLog();
  if (error)
    CFRelease(error);
  if (v10)
    return 0;
  if (a2)
  {
    *a2 = CFSTR("Can't commit Address Book");
    CFRetain(CFSTR("Can't commit Address Book"));
  }
  return 0xFFFFFFFFLL;
}

uint64_t ContactsDataSourceRollback(uint64_t a1)
{
  ABAddressBookRevert(*(ABAddressBookRef *)(a1 + 144));
  return 0;
}

uint64_t ContactsDataSourceDeleteDataSource(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;

  v2 = (const void *)a1[18];
  if (v2)
  {
    CFRelease(v2);
    a1[18] = 0;
  }
  v3 = (const void *)a1[19];
  if (v3)
  {
    CFRelease(v3);
    a1[19] = 0;
  }
  v4 = (const void *)a1[20];
  if (v4)
  {
    CFRelease(v4);
    a1[20] = 0;
  }
  v5 = (const void *)a1[21];
  if (v5)
  {
    CFRelease(v5);
    a1[21] = 0;
  }
  v6 = (const void *)a1[22];
  if (v6)
  {
    CFRelease(v6);
    a1[22] = 0;
  }
  v7 = (const void *)a1[23];
  if (v7)
  {
    CFRelease(v7);
    a1[23] = 0;
  }
  v8 = (const void *)a1[24];
  if (v8)
  {
    CFRelease(v8);
    a1[24] = 0;
  }
  v9 = (const void *)a1[25];
  if (v9)
  {
    CFRelease(v9);
    a1[25] = 0;
  }
  v10 = (const void *)a1[26];
  if (v10)
  {
    CFRelease(v10);
    a1[26] = 0;
  }
  v11 = (const void *)a1[27];
  if (v11)
  {
    CFRelease(v11);
    a1[27] = 0;
  }
  v12 = (const void *)a1[28];
  if (v12)
  {
    CFRelease(v12);
    a1[28] = 0;
  }
  v13 = (const void *)a1[29];
  if (v13)
  {
    CFRelease(v13);
    a1[29] = 0;
  }
  v14 = (const void *)a1[31];
  if (v14)
  {
    CFRelease(v14);
    a1[31] = 0;
  }
  v15 = (const void *)a1[32];
  if (v15)
  {
    CFRelease(v15);
    a1[32] = 0;
  }
  v16 = (const void *)a1[33];
  if (v16)
  {
    CFRelease(v16);
    a1[33] = 0;
  }
  v17 = (const void *)a1[34];
  if (v17)
  {
    CFRelease(v17);
    a1[34] = 0;
  }
  v18 = (const void *)a1[35];
  if (v18)
  {
    CFRelease(v18);
    a1[35] = 0;
  }
  v19 = (const void *)a1[36];
  if (v19)
  {
    CFRelease(v19);
    a1[36] = 0;
  }
  v20 = (const void *)a1[37];
  if (v20)
  {
    CFRelease(v20);
    a1[37] = 0;
  }
  v21 = (const void *)a1[38];
  if (v21)
  {
    CFRelease(v21);
    a1[38] = 0;
  }
  v22 = (const void *)a1[39];
  if (v22)
  {
    CFRelease(v22);
    a1[39] = 0;
  }
  v23 = (const void *)a1[40];
  if (v23)
  {
    CFRelease(v23);
    a1[40] = 0;
  }
  v24 = (const void *)a1[41];
  if (v24)
  {
    CFRelease(v24);
    a1[41] = 0;
  }
  v25 = (const void *)a1[42];
  if (v25)
  {
    CFRelease(v25);
    a1[42] = 0;
  }
  v26 = (const void *)a1[43];
  if (v26)
  {
    CFRelease(v26);
    a1[43] = 0;
  }
  v27 = (const void *)a1[44];
  if (v27)
  {
    CFRelease(v27);
    a1[44] = 0;
  }
  v28 = (const void *)a1[45];
  if (v28)
  {
    CFRelease(v28);
    a1[45] = 0;
  }
  v29 = (const void *)a1[46];
  if (v29)
  {
    CFRelease(v29);
    a1[46] = 0;
  }
  v30 = (const void *)a1[47];
  if (v30)
  {
    CFRelease(v30);
    a1[47] = 0;
  }
  v31 = (const void *)a1[48];
  if (v31)
  {
    CFRelease(v31);
    a1[48] = 0;
  }
  v32 = (const void *)a1[49];
  if (v32)
  {
    CFRelease(v32);
    a1[49] = 0;
  }
  v33 = (const void *)a1[50];
  if (v33)
  {
    CFRelease(v33);
    a1[50] = 0;
  }
  v34 = (const void *)a1[52];
  if (v34)
  {
    CFRelease(v34);
    a1[52] = 0;
  }
  v35 = (const void *)a1[51];
  if (v35)
    CFRelease(v35);
  free(a1);
  return 0;
}

uint64_t ContactsDataSourceGetEntityTypeProcessOrder(uint64_t a1, __CFArray **a2)
{
  __CFArray *Mutable;
  const __CFAllocator *v5;
  const CFArrayCallBacks *v6;
  __CFArray *v7;
  __CFArray *v8;
  __CFArray *v9;
  __CFArray *v10;
  __CFArray *v11;
  __CFArray *v12;
  __CFArray *v13;
  __CFArray *v14;

  Mutable = *(__CFArray **)(a1 + 400);
  if (!Mutable)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v6 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    v7 = CFArrayCreateMutable(v5, 0, v6);
    CFArrayAppendValue(v7, CFSTR("com.apple.contacts.Contact"));
    CFArrayAppendValue(v7, CFSTR("com.apple.contacts.Group"));
    CFArrayAppendValue(Mutable, v7);
    if (v7)
      CFRelease(v7);
    v8 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v8, CFSTR("com.apple.contacts.Email Address"));
    CFArrayAppendValue(Mutable, v8);
    if (v8)
      CFRelease(v8);
    v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v9, CFSTR("com.apple.contacts.Phone Number"));
    CFArrayAppendValue(Mutable, v9);
    if (v9)
      CFRelease(v9);
    v10 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v10, CFSTR("com.apple.contacts.Street Address"));
    CFArrayAppendValue(Mutable, v10);
    if (v10)
      CFRelease(v10);
    v11 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v11, CFSTR("com.apple.contacts.URL"));
    CFArrayAppendValue(Mutable, v11);
    if (v11)
      CFRelease(v11);
    v12 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v12, CFSTR("com.apple.contacts.Related Name"));
    CFArrayAppendValue(Mutable, v12);
    if (v12)
      CFRelease(v12);
    v13 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v13, CFSTR("com.apple.contacts.IM"));
    CFArrayAppendValue(Mutable, v13);
    if (v13)
      CFRelease(v13);
    v14 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v14, CFSTR("com.apple.contacts.Date"));
    CFArrayAppendValue(Mutable, v14);
    if (v14)
      CFRelease(v14);
    *(_QWORD *)(a1 + 400) = Mutable;
  }
  *a2 = Mutable;
  return 0;
}

uint64_t _makeAccountForSource(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  CFErrorRef error;

  if (DLShouldLog())
    _DLLog();
  error = 0;
  v4 = ABAccountCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    if ((ABAccountSetIdentifier() & 1) != 0)
    {
      if (ABAddressBookAddRecord(*(ABAddressBookRef *)(a1 + 144), v5, &error))
      {
        ABAddressBookProcessAddedRecords();
        if ((ABAddressBookSetAccountForSource() & 1) != 0)
        {
          v6 = 1;
LABEL_21:
          CFRelease(v5);
          return v6;
        }
        if (!DLShouldLog())
        {
LABEL_18:
          if (error)
          {
            CFRelease(error);
            v6 = 0;
            error = 0;
          }
          else
          {
            v6 = 0;
          }
          goto LABEL_21;
        }
        ABRecordGetRecordID(a2);
      }
      else if (!DLShouldLog())
      {
        goto LABEL_18;
      }
    }
    else
    {
      if (!DLShouldLog())
        goto LABEL_18;
      ABRecordGetRecordID(a2);
    }
    _DLLog();
    goto LABEL_18;
  }
  if (DLShouldLog())
  {
    ABRecordGetRecordID(a2);
    _DLLog();
  }
  return 1;
}

void _setComputerSyncAnchorForStore(uint64_t a1)
{
  CFStringRef v1;

  if (a1)
  {
    v1 = _copyComputerSyncAnchorKey(a1);
    if (DLShouldLog())
      _DLLog();
    ABAddressBookSetValue();
    if (v1)
      CFRelease(v1);
  }
}

void _setDeviceSyncAnchorForStore(uint64_t a1)
{
  CFStringRef v1;

  v1 = _copyDeviceSyncAnchorKey(a1);
  if (DLShouldLog())
    _DLLog();
  ABAddressBookSetValue();
  if (v1)
    CFRelease(v1);
}

CFStringRef _copyComputerSyncAnchorKey(uint64_t a1)
{
  const void *v1;
  uint64_t RecordID;

  v1 = *(const void **)(a1 + 152);
  if (v1)
    RecordID = ABRecordGetRecordID(v1);
  else
    RecordID = 0xFFFFFFFFLL;
  return CFStringCreateWithFormat(0, 0, CFSTR("ComputerStoreSyncAnchor-%d"), RecordID);
}

CFStringRef _copyDeviceSyncAnchorKey(uint64_t a1)
{
  const void *v1;
  uint64_t RecordID;

  if (a1 && (v1 = *(const void **)(a1 + 152)) != 0)
    RecordID = ABRecordGetRecordID(v1);
  else
    RecordID = 0xFFFFFFFFLL;
  return CFStringCreateWithFormat(0, 0, CFSTR("DeviceStoreSyncAnchor-%d"), RecordID);
}

void _RemoveRecordsFromAddressBook(uint64_t a1, CFArrayRef theArray, void (*a3)(uint64_t, const void *))
{
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  CFErrorRef error;

  error = 0;
  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v7 = Count;
    for (i = 0; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      if (a3)
        a3(a1, ValueAtIndex);
      if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), ValueAtIndex, &error)
        && DLShouldLog())
      {
        _DLLog();
      }
      if (error)
      {
        CFRelease(error);
        error = 0;
      }
    }
  }
}

void _SaveClearedPersonsSounds(uint64_t a1, uint64_t a2)
{
  _SaveClearedPersonsSound(*(const __CFDictionary **)(a1 + 408), a2, 0xFFFFFFFFLL);
  _SaveClearedPersonsSound(*(const __CFDictionary **)(a1 + 416), a2, 4294967294);
}

void _SaveClearedPersonsSound(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  const void *v7;
  const __CFString *v8;
  const __CFString *Value;
  const __CFString *v10;
  CFComparisonResult v11;
  int v12;

  if (a2)
  {
    v6 = ABPersonCopyCompositeName();
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = (const __CFString *)MEMORY[0x22E2F9AD0](a2, a3);
      if (!v8)
        v8 = (const __CFString *)CFRetain(CFSTR("<null>"));
      Value = (const __CFString *)CFDictionaryGetValue(a1, v7);
      if (!Value)
      {
        if (CFStringCompare(v8, CFSTR("<null>"), 0) && DLShouldLog())
          _DLLog();
        CFDictionaryAddValue(a1, v7, v8);
        goto LABEL_20;
      }
      v10 = Value;
      if (CFStringCompare(Value, v8, 0))
      {
        v11 = CFStringCompare(v10, CFSTR("<conflict>"), 0);
        v12 = DLShouldLog();
        if (v11)
        {
          if (v12)
            _DLLog();
          CFDictionaryReplaceValue(a1, v7, CFSTR("<conflict>"));
          goto LABEL_20;
        }
        if (!v12)
        {
LABEL_20:
          CFRelease(v7);
          if (v8)
            CFRelease(v8);
          return;
        }
      }
      else if (CFStringCompare(v8, CFSTR("<null>"), 0) == kCFCompareEqualTo || !DLShouldLog())
      {
        goto LABEL_20;
      }
      _DLLog();
      goto LABEL_20;
    }
  }
}

void _AccumulateContacts(uint64_t a1, __CFDictionary *a2)
{
  const __CFArray *v3;
  ABPropertyID v4;
  ABPropertyID v5;
  const __CFNumber *v6;
  const void *v7;
  int v8;
  const void *ValueAtIndex;
  uint64_t RecordID;
  CFStringRef v11;
  __CFDictionary *Mutable;
  const __CFNumber *v13;
  const __CFString *v14;
  CFDataRef v15;
  const void *Value;
  const __CFDictionary *v17;
  ABRecordID v18;
  int Length;
  int v20;
  int v21;
  const void *v22;
  const __CFNumber *otherNumber;
  ABPropertyID v24;
  ABPropertyID v25;
  ABPropertyID v26;
  ABPropertyID v27;
  ABPropertyID v28;
  ABPropertyID v29;
  ABPropertyID v30;
  ABPropertyID v31;
  ABPropertyID v32;
  ABPropertyID v33;
  ABPropertyID v34;
  ABPropertyID v35;
  ABPropertyID property;
  CFIndex Count;

  v3 = *(const __CFArray **)(a1 + 176);
  if (v3)
  {
    Count = CFArrayGetCount(v3);
    property = *MEMORY[0x24BE02758];
    v35 = *MEMORY[0x24BE02820];
    v34 = *MEMORY[0x24BE02848];
    v33 = *MEMORY[0x24BE028D8];
    v31 = *MEMORY[0x24BE02858];
    v32 = *MEMORY[0x24BE028F8];
    v29 = *MEMORY[0x24BE02810];
    v30 = *MEMORY[0x24BE02748];
    v28 = *MEMORY[0x24BE02838];
    v27 = *MEMORY[0x24BE02868];
    v25 = *MEMORY[0x24BE02708];
    v26 = *MEMORY[0x24BE027F0];
    v24 = *MEMORY[0x24BE02860];
    v4 = *MEMORY[0x24BE026E8];
    v5 = *MEMORY[0x24BE02808];
    v6 = (const __CFNumber *)*MEMORY[0x24BE02800];
    otherNumber = (const __CFNumber *)*MEMORY[0x24BE027F8];
    v7 = (const void *)*MEMORY[0x24BDBD270];
    v22 = (const void *)*MEMORY[0x24BDBD268];
    v8 = *(_DWORD *)(a1 + 432);
    do
    {
      if (Count <= v8)
        return;
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 176), v8);
      RecordID = ABRecordGetRecordID(ValueAtIndex);
      v11 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), RecordID);
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.contacts.Contact"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, property, CFSTR("first name"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v35, CFSTR("last name"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v34, CFSTR("middle name"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v33, CFSTR("title"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v32, CFSTR("suffix"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v31, CFSTR("nickname"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v30, CFSTR("first name yomi"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v29, CFSTR("last name yomi"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v28, CFSTR("middle name yomi"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v27, CFSTR("company name"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v26, CFSTR("job title"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v25, CFSTR("department"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v24, CFSTR("notes"));
      _SetRecordValueInDictionary(Mutable, ValueAtIndex, v4, CFSTR("birthday"));
      v13 = (const __CFNumber *)ABRecordCopyValue(ValueAtIndex, v5);
      if (CFNumberCompare(v13, v6, 0))
      {
        if (CFNumberCompare(v13, otherNumber, 0))
          goto LABEL_9;
        v14 = CFSTR("company");
      }
      else
      {
        v14 = CFSTR("person");
      }
      CFDictionarySetValue(Mutable, CFSTR("display as company"), v14);
LABEL_9:
      if (v13)
        CFRelease(v13);
      v15 = ABPersonCopyImageDataWithFormat(ValueAtIndex, (ABPersonImageFormat)5u);
      if (!v15)
        v15 = ABPersonCopyImageDataWithFormat(ValueAtIndex, kABPersonImageFormatThumbnail);
      Value = v7;
      if (*(_BYTE *)(a1 + 440))
      {
        v17 = *(const __CFDictionary **)(a1 + 184);
        if (v17)
        {
          v18 = ABRecordGetRecordID(ValueAtIndex);
          Value = CFDictionaryGetValue(v17, (const void *)v18);
          if (!Value)
          {
            Value = v7;
            if (DLShouldLog())
            {
              ABRecordGetRecordID(ValueAtIndex);
              _DLLog();
              Value = v7;
            }
          }
        }
        else if (v15)
        {
          Value = v7;
        }
        else
        {
          Value = v22;
        }
        CFDictionarySetValue(Mutable, CFSTR("ImageChanged"), Value);
      }
      if (Value == v7 && v15)
      {
        CFDictionarySetValue(Mutable, CFSTR("image"), v15);
        Length = CFDataGetLength(v15);
LABEL_26:
        CFRelease(v15);
        v20 = Length;
        goto LABEL_27;
      }
      Length = 0;
      v20 = 0;
      if (v15)
        goto LABEL_26;
LABEL_27:
      v21 = *(_DWORD *)(a1 + 424) + v20;
      *(_DWORD *)(a1 + 424) = v21;
      if (v21 >= 4000001)
      {
        if (DLShouldLog())
          _DLLog();
        ABProcessAddedImages();
        *(_DWORD *)(a1 + 424) = 0;
      }
      CFDictionarySetValue(a2, v11, Mutable);
      if (Mutable)
        CFRelease(Mutable);
      if (v11)
        CFRelease(v11);
      v8 = *(_DWORD *)(a1 + 432) + 1;
      *(_DWORD *)(a1 + 432) = v8;
    }
    while (v21 < 4000001);
  }
}

CFStringRef _CreateContactRecordIdentifier(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("%d"), a1);
}

void _SetRecordValueInDictionary(__CFDictionary *a1, ABRecordRef record, ABPropertyID property, const void *a4)
{
  CFTypeRef v6;
  const void *v7;

  v6 = ABRecordCopyValue(record, property);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a1, a4, v6);
    CFRelease(v7);
  }
}

void _AccumulateGroups(CFMutableDictionaryRef *a1, CFArrayRef theArray)
{
  const __CFArray *v2;
  uint64_t Count;
  uint64_t v5;
  CFIndex v6;
  const void *ValueAtIndex;
  uint64_t RecordID;
  CFStringRef v9;
  CFMutableDictionaryRef Mutable;
  const __CFArray *v11;
  const __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  __CFArray *v15;
  CFIndex i;
  const void *v17;
  ABRecordType RecordType;
  uint64_t v19;
  CFStringRef v20;
  CFStringRef v21;
  const void *v22;
  uint64_t v23;
  CFMutableDictionaryRef *v24;
  const __CFArray *v25;
  ABPropertyID property;

  v2 = theArray;
  Count = CFArrayGetCount(theArray);
  if (Count < 1)
    return;
  v5 = Count;
  if (!*a1)
    *a1 = CFDictionaryCreateMutable(0, Count, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  v6 = 0;
  property = *MEMORY[0x24BE02688];
  v24 = a1;
  v25 = v2;
  v23 = v5;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, v6);
    RecordID = ABRecordGetRecordID(ValueAtIndex);
    v9 = CFStringCreateWithFormat(0, 0, CFSTR("Group/%d"), RecordID);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(*a1, v9, Mutable);
    CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.contacts.Group"));
    _SetRecordValueInDictionary(Mutable, ValueAtIndex, property, CFSTR("name"));
    if (v9)
      CFRelease(v9);
    v11 = (const __CFArray *)ABGroupCopyArrayOfAllMembersAndSubgroups();
    if (!v11)
      goto LABEL_24;
    v12 = v11;
    v13 = CFArrayGetCount(v11);
    if (v13 < 1)
      goto LABEL_23;
    v14 = v13;
    v15 = CFArrayCreateMutable(0, v13, MEMORY[0x24BDBD690]);
    for (i = 0; i != v14; ++i)
    {
      v17 = CFArrayGetValueAtIndex(v12, i);
      RecordType = ABRecordGetRecordType(v17);
      v19 = ABRecordGetRecordID(v17);
      if (RecordType == 1)
      {
        v20 = CFStringCreateWithFormat(0, 0, CFSTR("Group/%d"), v19, v22);
LABEL_14:
        if (v20)
        {
          v21 = v20;
          CFArrayAppendValue(v15, v20);
          CFRelease(v21);
        }
        continue;
      }
      if (!RecordType)
      {
        v20 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), v19, v22);
        goto LABEL_14;
      }
      if (DLShouldLog())
      {
        v22 = v17;
        _DLLog();
      }
    }
    if (CFArrayGetCount(v15) >= 1)
      CFDictionarySetValue(Mutable, CFSTR("members"), v15);
    a1 = v24;
    v2 = v25;
    v5 = v23;
    if (v15)
      CFRelease(v15);
LABEL_23:
    CFRelease(v12);
LABEL_24:
    if (Mutable)
      CFRelease(Mutable);
    ++v6;
  }
  while (v6 != v5);
}

CFStringRef _CreateGroupRecordIdentifier(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("Group/%d"), a1);
}

void _AccumulatePropertiesForType(const __CFArray **a1, uint64_t a2, const void *a3, __CFDictionary *a4)
{
  const __CFArray *v5;
  CFIndex v7;
  int v8;
  const void *ValueAtIndex;
  CFTypeRef v10;
  const void *v11;
  uint64_t RecordID;
  CFIndex i;
  CFArrayRef v14;
  uint64_t IdentifierAtIndex;
  __CFDictionary *Mutable;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const void *Value;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const __CFDictionary *v24;
  const __CFDictionary *v25;
  __CFDictionary *v26;
  const __CFString *v27;
  const void *v28;
  const void *v29;
  const __CFDictionary *v30;
  const void *v31;
  const __CFDictionary *v32;
  const __CFString *v33;
  const __CFDictionary *v34;
  const __CFString *v35;
  CFComparisonResult v36;
  const __CFString *v37;
  CFStringRef v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  CFIndex Count;
  CFIndex v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const __CFString *theString2;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *key;
  const __CFString *v57;
  int v58;
  int v59;
  int v60;
  const __CFAllocator *v61;
  CFIndex v64;
  void *values;

  v5 = a1[22];
  if (v5)
  {
    Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      v7 = 0;
      v61 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v8 = *MEMORY[0x24BE026B8];
      v59 = *MEMORY[0x24BE02780];
      v48 = (void *)*MEMORY[0x24BE027E0];
      v49 = (void *)*MEMORY[0x24BE027B8];
      v55 = (void *)*MEMORY[0x24BE026A0];
      key = (void *)*MEMORY[0x24BE026C8];
      v53 = (void *)*MEMORY[0x24BE026D0];
      v54 = (void *)*MEMORY[0x24BE026C0];
      v51 = (void *)*MEMORY[0x24BE026A8];
      v52 = (void *)*MEMORY[0x24BE026B0];
      v60 = *MEMORY[0x24BE02718];
      v58 = *MEMORY[0x24BE028C0];
      v42 = *MEMORY[0x24BE028E0];
      v43 = *MEMORY[0x24BE02900];
      v41 = *MEMORY[0x24BE02700];
      v39 = *MEMORY[0x24BE026D8];
      v40 = *MEMORY[0x24BE02768];
      v46 = *MEMORY[0x24BE02940];
      v47 = *MEMORY[0x24BE02690];
      v57 = (const __CFString *)*MEMORY[0x24BE028A0];
      theString2 = (const __CFString *)*MEMORY[0x24BE02698];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1[22], v7);
        v10 = ABRecordCopyValue(ValueAtIndex, a2);
        if (v10)
        {
          v11 = v10;
          v45 = v7;
          RecordID = ABRecordGetRecordID(ValueAtIndex);
          v64 = ABMultiValueGetCount(v11);
          if (v64 >= 1)
          {
            for (i = 0; v64 != i; ++i)
            {
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, CFSTR("%d"), RecordID);
              v14 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
              IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v11, i);
              Mutable = CFDictionaryCreateMutable(v61, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), a3);
              CFDictionarySetValue(Mutable, CFSTR("contact"), v14);
              if (v14)
                CFRelease(v14);
              v17 = (const __CFDictionary *)ABMultiValueCopyValueAtIndex(v11, i);
              v18 = v17;
              if (v8 == (_DWORD)a2)
              {
                if (!v17)
                  goto LABEL_36;
                Value = CFDictionaryGetValue(v17, key);
                if (Value)
                  CFDictionarySetValue(Mutable, CFSTR("street"), Value);
                v20 = CFDictionaryGetValue(v18, v55);
                if (v20)
                  CFDictionarySetValue(Mutable, CFSTR("city"), v20);
                v21 = CFDictionaryGetValue(v18, v54);
                if (v21)
                  CFDictionarySetValue(Mutable, CFSTR("state"), v21);
                v22 = CFDictionaryGetValue(v18, v53);
                if (v22)
                  CFDictionarySetValue(Mutable, CFSTR("postal code"), v22);
                v23 = CFDictionaryGetValue(v18, v52);
                if (v23)
                  CFDictionarySetValue(Mutable, CFSTR("country"), v23);
                v24 = (const __CFDictionary *)CFDictionaryGetValue(v18, v51);
                if (!v24)
                  goto LABEL_35;
                v25 = v24;
                v26 = Mutable;
                v27 = CFSTR("country code");
              }
              else if (v59 == (_DWORD)a2)
              {
                if (!v17)
                  goto LABEL_36;
                v28 = CFDictionaryGetValue(v17, v49);
                if (v28)
                {
                  v29 = v28;
                  v30 = a1[43];
                  if (!v30)
                  {
                    _InitializeInstantMessageServiceStringsArrays();
                    v30 = CFDictionaryCreate(0, (const void **)&sABInstantMessageServiceStrings, (const void **)&sSyncServicesInstantMessageServiceStrings, 10, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                    a1[43] = v30;
                  }
                  v31 = CFDictionaryGetValue(v30, v29);
                  if (v31)
                    CFDictionarySetValue(Mutable, v49, v31);
                }
                v32 = (const __CFDictionary *)CFDictionaryGetValue(v18, v48);
                if (!v32)
                  goto LABEL_35;
                v25 = v32;
                v26 = Mutable;
                v27 = CFSTR("user");
              }
              else
              {
                if (!v17)
                  goto LABEL_36;
                v26 = Mutable;
                v27 = CFSTR("value");
                v25 = v18;
              }
              CFDictionarySetValue(v26, v27, v25);
LABEL_35:
              CFRelease(v18);
LABEL_36:
              v33 = ABMultiValueCopyLabelAtIndex(v11, i);
              if (v60 == (_DWORD)a2)
              {
                v34 = a1[33];
                if (!v34)
                {
                  if (!sABEmailTypeStrings)
                  {
                    sABEmailTypeStrings = v47;
                    unk_255BFB4C0 = v46;
                    sSyncServicesEmailTypeStrings = (uint64_t)CFSTR("home");
                    unk_255BFB4D0 = CFSTR("work");
                  }
                  v34 = CFDictionaryCreate(0, (const void **)&sABEmailTypeStrings, (const void **)&sSyncServicesEmailTypeStrings, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  a1[33] = v34;
                }
              }
              else if (v58 == (_DWORD)a2)
              {
                v34 = a1[35];
                if (!v34)
                {
                  _InitializePhoneTypeStringsArrays();
                  v34 = CFDictionaryCreate(0, (const void **)&sABPhoneTypeStrings, (const void **)&sSyncServicesPhoneTypeStrings, 7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  a1[35] = v34;
                }
              }
              else if (v8 == (_DWORD)a2)
              {
                v34 = a1[37];
                if (!v34)
                {
                  if (!sABAddressTypeStrings)
                  {
                    sABAddressTypeStrings = v47;
                    unk_255BFB550 = v46;
                    sSyncServicesAddressTypeStrings = (uint64_t)CFSTR("home");
                    unk_255BFB560 = CFSTR("work");
                  }
                  v34 = CFDictionaryCreate(0, (const void **)&sABAddressTypeStrings, (const void **)&sSyncServicesAddressTypeStrings, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  a1[37] = v34;
                }
              }
              else if (v59 == (_DWORD)a2)
              {
                v34 = a1[45];
                if (!v34)
                {
                  if (!sABInstantMessageTypeStrings)
                  {
                    sABInstantMessageTypeStrings = v47;
                    unk_255BFB570 = v46;
                    sSyncServicesInstantMessageTypeStrings = (uint64_t)CFSTR("home");
                    unk_255BFB580 = CFSTR("work");
                  }
                  v34 = CFDictionaryCreate(0, (const void **)&sABInstantMessageTypeStrings, (const void **)&sSyncServicesInstantMessageTypeStrings, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  a1[45] = v34;
                }
              }
              else if (v43 == (_DWORD)a2)
              {
                v34 = a1[39];
                if (!v34)
                {
                  if (!sABURLTypeStrings)
                  {
                    sABURLTypeStrings = v40;
                    unk_255BFB590 = v47;
                    qword_255BFB598 = v46;
                    sSyncServicesURLTypeStrings = (uint64_t)CFSTR("home page");
                    *(_QWORD *)algn_255BFB5A8 = CFSTR("home");
                    qword_255BFB5B0 = (uint64_t)CFSTR("work");
                  }
                  v34 = CFDictionaryCreate(0, (const void **)&sABURLTypeStrings, (const void **)&sSyncServicesURLTypeStrings, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  a1[39] = v34;
                }
              }
              else if (v42 == (_DWORD)a2)
              {
                v34 = a1[41];
                if (!v34)
                {
                  _InitializeRelatedNamesTypeStringsArrays();
                  v34 = CFDictionaryCreate(0, (const void **)&sABRelatedNamesTypeStrings, (const void **)&sSyncServicesRelatedNamesTypeStrings, 11, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  a1[41] = v34;
                }
              }
              else if (v41 == (_DWORD)a2)
              {
                v34 = a1[47];
                if (!v34)
                {
                  if (!sABDateTypeStrings)
                  {
                    sABDateTypeStrings = v39;
                    sSyncServicesDateTypeStrings = (uint64_t)CFSTR("anniversary");
                  }
                  v34 = CFDictionaryCreate(0, (const void **)&sABDateTypeStrings, (const void **)&sSyncServicesDateTypeStrings, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  a1[47] = v34;
                }
              }
              else
              {
                v34 = 0;
              }
              if (!v33)
                v33 = (const __CFString *)CFRetain(CFSTR("other"));
              v35 = (const __CFString *)CFDictionaryGetValue(v34, v33);
              if (v35)
                goto LABEL_79;
              if (CFStringCompare(v33, v57, 0) == kCFCompareEqualTo)
              {
                v37 = CFSTR("iPhone");
LABEL_77:
                CFDictionarySetValue(Mutable, CFSTR("label"), v37);
                goto LABEL_78;
              }
              if (CFStringCompare(v33, theString2, 0))
              {
                v36 = CFStringCompare(v33, CFSTR("other"), 0);
                if (!v33)
                {
                  v35 = CFSTR("other");
                  goto LABEL_79;
                }
                v37 = v33;
                v35 = CFSTR("other");
                if (v36 == kCFCompareEqualTo)
                  goto LABEL_79;
                goto LABEL_77;
              }
LABEL_78:
              v35 = CFSTR("other");
LABEL_79:
              CFDictionarySetValue(Mutable, CFSTR("type"), v35);
              if (v33)
                CFRelease(v33);
              v38 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d/%d"), a2, RecordID, IdentifierAtIndex);
              CFDictionarySetValue(a4, v38, Mutable);
              if (v38)
                CFRelease(v38);
              if (Mutable)
                CFRelease(Mutable);
              if (values)
                CFRelease(values);
            }
          }
          CFRelease(v11);
          v7 = v45;
        }
        ++v7;
      }
      while (v7 != Count);
    }
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _InitializePhoneTypeStringsArrays()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (!sABPhoneTypeStrings)
  {
    v0 = *MEMORY[0x24BE02940];
    sABPhoneTypeStrings = *MEMORY[0x24BE02690];
    unk_255BFB4E0 = v0;
    v1 = *MEMORY[0x24BE028A8];
    qword_255BFB4E8 = *MEMORY[0x24BE028B0];
    unk_255BFB4F0 = v1;
    v2 = *MEMORY[0x24BE028D0];
    qword_255BFB4F8 = *MEMORY[0x24BE02898];
    unk_255BFB500 = v2;
    qword_255BFB508 = *MEMORY[0x24BE028B8];
    sSyncServicesPhoneTypeStrings = (uint64_t)CFSTR("home");
    *(_QWORD *)algn_255BFB518 = CFSTR("work");
    qword_255BFB520 = (uint64_t)CFSTR("mobile");
    unk_255BFB528 = CFSTR("main");
    qword_255BFB530 = (uint64_t)CFSTR("home fax");
    unk_255BFB538 = CFSTR("work fax");
    qword_255BFB540 = (uint64_t)CFSTR("pager");
  }
}

void _InitializeRelatedNamesTypeStringsArrays()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!sABRelatedNamesTypeStrings)
  {
    v0 = *MEMORY[0x24BE02850];
    sABRelatedNamesTypeStrings = *MEMORY[0x24BE02740];
    unk_255BFB5C0 = v0;
    v1 = *MEMORY[0x24BE026F8];
    qword_255BFB5C8 = *MEMORY[0x24BE02870];
    unk_255BFB5D0 = v1;
    v2 = *MEMORY[0x24BE028E8];
    qword_255BFB5D8 = *MEMORY[0x24BE026F0];
    unk_255BFB5E0 = v2;
    v3 = *MEMORY[0x24BE028F0];
    qword_255BFB5E8 = *MEMORY[0x24BE02760];
    unk_255BFB5F0 = v3;
    v4 = *MEMORY[0x24BE026E0];
    qword_255BFB5F8 = *MEMORY[0x24BE02878];
    unk_255BFB600 = v4;
    qword_255BFB608 = *MEMORY[0x24BE02830];
    sSyncServicesRelatedNamesTypeStrings = (uint64_t)CFSTR("father");
    *(_QWORD *)algn_255BFB618 = CFSTR("mother");
    qword_255BFB620 = (uint64_t)CFSTR("parent");
    unk_255BFB628 = CFSTR("child");
    qword_255BFB630 = (uint64_t)CFSTR("brother");
    unk_255BFB638 = CFSTR("sister");
    qword_255BFB640 = (uint64_t)CFSTR("friend");
    unk_255BFB648 = CFSTR("spouse");
    qword_255BFB650 = (uint64_t)CFSTR("partner");
    unk_255BFB658 = CFSTR("assistant");
    qword_255BFB660 = (uint64_t)CFSTR("manager");
  }
}

void _InitializeInstantMessageServiceStringsArrays()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!sABInstantMessageServiceStrings)
  {
    v0 = *MEMORY[0x24BE027B0];
    sABInstantMessageServiceStrings = *MEMORY[0x24BE027D8];
    unk_255BFB680 = v0;
    v1 = *MEMORY[0x24BE027A8];
    qword_255BFB688 = *MEMORY[0x24BE027C0];
    unk_255BFB690 = v1;
    v2 = *MEMORY[0x24BE027C8];
    qword_255BFB698 = *MEMORY[0x24BE02788];
    unk_255BFB6A0 = v2;
    v3 = *MEMORY[0x24BE027D0];
    qword_255BFB6A8 = *MEMORY[0x24BE027A0];
    unk_255BFB6B0 = v3;
    v4 = *MEMORY[0x24BE02798];
    qword_255BFB6B8 = *MEMORY[0x24BE02790];
    unk_255BFB6C0 = v4;
    sSyncServicesInstantMessageServiceStrings = (uint64_t)CFSTR("yahoo");
    unk_255BFB6D0 = CFSTR("jabber");
    qword_255BFB6D8 = (uint64_t)CFSTR("msn");
    unk_255BFB6E0 = CFSTR("icq");
    qword_255BFB6E8 = (uint64_t)CFSTR("aim");
    unk_255BFB6F0 = CFSTR("qq");
    qword_255BFB6F8 = (uint64_t)CFSTR("googletalk");
    unk_255BFB700 = CFSTR("skype");
    qword_255BFB708 = (uint64_t)CFSTR("facebook");
    unk_255BFB710 = CFSTR("gadugadu");
  }
}

void _saveDeviceSyncAnchorAndClearChangeHistory(uint64_t a1)
{
  CFErrorRef error;

  if ((*(_DWORD *)(a1 + 436) & 0x80000000) == 0)
    ABChangeHistoryClearChangesUpToSequenceNumberForClient();
  error = 0;
  if (!*(_QWORD *)(a1 + 160))
    *(_QWORD *)(a1 + 160) = CFRetain(CFSTR("---"));
  _setDeviceSyncAnchorForStore(a1);
  if (!ABAddressBookSave(*(ABAddressBookRef *)(a1 + 144), &error) && DLShouldLog())
    _DLLog();
  *(_BYTE *)(a1 + 442) = 1;
  if (error)
    CFRelease(error);
}

void _ChangesApplierFunction(const __CFString *a1, const void *a2, uint64_t a3)
{
  CFTypeID TypeID;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v8;
  const __CFString *ValueAtIndex;
  SInt32 IntValue;
  ABRecordRef GroupWithRecordID;
  const __CFString *v12;
  const __CFString *v13;
  const __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFArray *v19;
  const __CFArray *v20;
  const __CFString *v21;
  const __CFArray *v22;
  const __CFArray *v23;
  const __CFString *v24;
  SInt32 v25;
  void *v26;
  SInt32 v27;
  ABRecordRef v28;
  CFErrorRef v29;
  ABRecordRef v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFArray *v33;
  const __CFString *v34;
  const __CFString *v35;
  SInt32 v36;
  const void *v37;
  const void *v38;
  __CFDictionary *Mutable;
  const __CFArray *v40;
  CFArrayRef v41;
  __CFArray *v42;
  const __CFAllocator *v43;
  const CFArrayCallBacks *v44;
  CFArrayRef v45;
  const __CFDictionary *v46;
  const __CFString *v47;
  const __CFDictionary *v48;
  const void *v49;
  ABRecordRef PersonWithRecordID;
  CFTypeRef v51;
  const void *v52;
  CFIndex IndexForIdentifier;
  ABPropertyType v55;
  ABMutableMultiValueRef MutableCopy;
  int v57;
  __CFDictionary *v58;
  const void *v59;
  const void *v60;
  const void *v61;
  const void *v62;
  const void *v63;
  const void *v64;
  const void *v65;
  const void **v66;
  const void *v67;
  const void *v68;
  const __CFDictionary *v69;
  const void *v70;
  const void *v71;
  int v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFDictionary *v76;
  uint64_t v77;
  _BOOL4 v78;
  const __CFString *v79;
  const __CFString *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const void *v85;
  CFStringRef v86;
  CFMutableDictionaryRef v87;
  CFIndex v88;
  ABMutableMultiValueRef multiValue;
  uint64_t recordID;
  CFErrorRef v91;
  void *value;
  CFErrorRef error;

  TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a1, CFSTR("/"));
    if (!ArrayBySeparatingStrings)
    {
      _DeleteContact(a3, a1);
      return;
    }
    v8 = ArrayBySeparatingStrings;
    if (CFArrayGetCount(ArrayBySeparatingStrings) >= 2)
    {
      if (CFArrayGetCount(v8) == 2)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v8, 1);
        error = 0;
        if (DLShouldLog())
          _DLLog();
        if (recordIdentifierIsLocal(ValueAtIndex)
          && (IntValue = CFStringGetIntValue(ValueAtIndex),
              (GroupWithRecordID = ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(a3 + 144), IntValue)) != 0))
        {
          if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a3 + 144), GroupWithRecordID, &error)
            && DLShouldLog())
          {
            _DLLog();
          }
          if (error)
            CFRelease(error);
        }
        else if (DLShouldLog())
        {
          _DLLog();
        }
        v29 = v8;
        goto LABEL_312;
      }
      if (CFArrayGetCount(v8) == 3)
      {
        if (!*(_QWORD *)(a3 + 216))
          *(_QWORD *)(a3 + 216) = CFArrayCreateMutable(0, 0, 0);
        if (DLShouldLog())
          _DLLog();
        CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 216), a1);
        goto LABEL_105;
      }
      if (DLShouldLog())
        _DLLog();
    }
    _DeleteContact(a3, a1);
LABEL_105:
    CFRelease(v8);
    return;
  }
  v12 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("com.apple.syncservices.RecordEntityName"));
  if (!v12)
  {
    if (!DLShouldLog())
      return;
    goto LABEL_28;
  }
  v13 = v12;
  if (CFStringCompare(v12, CFSTR("com.apple.contacts.Group"), 0) == kCFCompareEqualTo)
  {
    error = 0;
    if (recordIdentifierIsLocal(a1))
    {
      v22 = CFStringCreateArrayBySeparatingStrings(0, a1, CFSTR("/"));
      v23 = v22;
      if (v22 && CFArrayGetCount(v22) == 2)
      {
        v24 = (const __CFString *)CFArrayGetValueAtIndex(v23, 1);
        v25 = CFStringGetIntValue(v24);
        v26 = (void *)ABAddressBookGetGroupWithRecordID(*(ABAddressBookRef *)(a3 + 144), v25);
        goto LABEL_81;
      }
      if (DLShouldLog())
        _DLLog();
      if (v23)
      {
        v26 = 0;
LABEL_81:
        CFRelease(v23);
        v37 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("name"));
        if (v37)
        {
          v38 = v37;
          if (v26)
          {
            CFRetain(v26);
            if (DLShouldLog())
            {
              ABRecordGetRecordID(v26);
              _DLLog();
            }
            goto LABEL_93;
          }
LABEL_86:
          if (DLShouldLog())
            _DLLog();
          v26 = (void *)ABGroupCreateInSource(*(ABRecordRef *)(a3 + 152));
          if (!ABAddressBookAddRecord(*(ABAddressBookRef *)(a3 + 144), v26, &error))
          {
            if (DLShouldLog())
              _DLLog();
            CFShow(v26);
            if (v26)
              CFRelease(v26);
            v29 = error;
            if (error)
              goto LABEL_312;
            return;
          }
          Mutable = *(__CFDictionary **)(a3 + 208);
          if (!Mutable)
          {
            Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            *(_QWORD *)(a3 + 208) = Mutable;
          }
          CFDictionaryAddValue(Mutable, a1, v26);
          if (error)
          {
            CFRelease(error);
            error = 0;
          }
LABEL_93:
          if (!ABRecordSetValue(v26, *MEMORY[0x24BE02688], v38, &error) && DLShouldLog())
          {
            ABRecordGetRecordID(v26);
            _DLLog();
          }
          if (error)
          {
            CFRelease(error);
            error = 0;
          }
          v40 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("members"));
          if (v40)
          {
            v41 = v40;
            CFRetain(v40);
          }
          else
          {
            v41 = CFArrayCreate(0, 0, 0, 0);
          }
          v42 = *(__CFArray **)(a3 + 224);
          if (!v42)
          {
            v43 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            v44 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
            *(_QWORD *)(a3 + 224) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
            *(_QWORD *)(a3 + 232) = CFArrayCreateMutable(v43, 0, v44);
            v42 = *(__CFArray **)(a3 + 224);
          }
          CFArrayAppendValue(v42, v26);
          CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 232), v41);
          if (!v41)
          {
LABEL_310:
            if (!v26)
              return;
            goto LABEL_311;
          }
          v45 = v41;
LABEL_309:
          CFRelease(v45);
          goto LABEL_310;
        }
LABEL_100:
        if (!DLShouldLog())
          return;
        goto LABEL_28;
      }
    }
    v38 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("name"));
    if (v38)
      goto LABEL_86;
    goto LABEL_100;
  }
  if (CFStringCompare(v13, CFSTR("com.apple.contacts.Contact"), 0))
  {
    if (CFStringCompare(v13, CFSTR("com.apple.contacts.Email Address"), 0)
      && CFStringCompare(v13, CFSTR("com.apple.contacts.Phone Number"), 0)
      && CFStringCompare(v13, CFSTR("com.apple.contacts.Street Address"), 0)
      && CFStringCompare(v13, CFSTR("com.apple.contacts.URL"), 0)
      && CFStringCompare(v13, CFSTR("com.apple.contacts.IM"), 0)
      && CFStringCompare(v13, CFSTR("com.apple.contacts.Related Name"), 0)
      && CFStringCompare(v13, CFSTR("com.apple.contacts.Date"), 0))
    {
      if (!DLShouldLog())
        return;
      goto LABEL_28;
    }
    v14 = *(const __CFDictionary **)(a3 + 392);
    if (v14)
      goto LABEL_315;
    sSyncServicesEntityTypeStrings = (uint64_t)CFSTR("com.apple.contacts.Email Address");
    unk_255BFB720 = CFSTR("com.apple.contacts.Phone Number");
    qword_255BFB728 = (uint64_t)CFSTR("com.apple.contacts.Street Address");
    unk_255BFB730 = CFSTR("com.apple.contacts.URL");
    qword_255BFB738 = (uint64_t)CFSTR("com.apple.contacts.Date");
    unk_255BFB740 = CFSTR("com.apple.contacts.Related Name");
    qword_255BFB748 = (uint64_t)CFSTR("com.apple.contacts.IM");
    v15 = (int)*MEMORY[0x24BE028C0];
    sABPropertyNames = (int)*MEMORY[0x24BE02718];
    *(_QWORD *)algn_255BFB758 = v15;
    v16 = (int)*MEMORY[0x24BE02900];
    qword_255BFB760 = (int)*MEMORY[0x24BE026B8];
    unk_255BFB768 = v16;
    v17 = (int)*MEMORY[0x24BE028E0];
    qword_255BFB770 = (int)*MEMORY[0x24BE02700];
    unk_255BFB778 = v17;
    qword_255BFB780 = (int)*MEMORY[0x24BE02780];
    v14 = CFDictionaryCreate(0, (const void **)&sSyncServicesEntityTypeStrings, (const void **)&sABPropertyNames, 7, MEMORY[0x24BDBD6A0], 0);
    *(_QWORD *)(a3 + 392) = v14;
    if (v14)
    {
LABEL_315:
      error = 0;
      if (CFDictionaryGetValueIfPresent(v14, v13, (const void **)&error))
      {
        v18 = error;
        v19 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("contact"));
        if (v19 && (v20 = v19, CFArrayGetCount(v19) == 1))
        {
          v21 = (const __CFString *)CFArrayGetValueAtIndex(v20, 0);
          if (DLShouldLog())
            _DLLog();
        }
        else
        {
          v21 = 0;
        }
        v33 = CFStringCreateArrayBySeparatingStrings(0, a1, CFSTR("/"));
        v26 = v33;
        if (v33 && CFArrayGetCount(v33) >= 2)
        {
          if (CFArrayGetCount((CFArrayRef)v26) == 3)
          {
            v34 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v26, 1);
            v35 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v26, 2);
            if (v35)
              v36 = CFStringGetIntValue(v35);
            else
              v36 = -1;
            if (v21 && v34)
            {
              if (CFStringCompare(v34, v21, 0) == kCFCompareEqualTo)
                goto LABEL_137;
              v36 = -1;
              goto LABEL_128;
            }
            if (v34)
              goto LABEL_137;
LABEL_127:
            if (!v21)
            {
              v34 = 0;
              goto LABEL_134;
            }
LABEL_128:
            v46 = *(const __CFDictionary **)(a3 + 248);
            if (v46 && (v47 = (const __CFString *)CFDictionaryGetValue(v46, v21)) != 0)
            {
              v34 = v47;
              if (DLShouldLog())
                _DLLog();
            }
            else
            {
              v34 = v21;
            }
LABEL_134:
            if (DLShouldLog())
              _DLLog();
            if (!v34)
            {
              if (!DLShouldLog())
                goto LABEL_310;
              goto LABEL_156;
            }
LABEL_137:
            if (recordIdentifierIsLocal(v34))
            {
              recordID = CFStringGetIntValue(v34);
            }
            else
            {
              if (DLShouldLog())
                _DLLog();
              recordID = 0xFFFFFFFFLL;
            }
            v48 = *(const __CFDictionary **)(a3 + 192);
            if (v48)
            {
              v49 = CFDictionaryGetValue(v48, v34);
              if (v49)
              {
                PersonWithRecordID = v49;
                if (DLShouldLog())
                  _DLLog();
LABEL_150:
                if (DLShouldLog())
                  _DLLog();
                LODWORD(value) = v36;
                error = 0;
                v51 = ABRecordCopyValue(PersonWithRecordID, v18);
                v52 = v51;
                if (v51)
                {
                  if (v36 == -1)
                    IndexForIdentifier = -1;
                  else
                    IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v51, v36);
                  MutableCopy = ABMultiValueCreateMutableCopy(v52);
                }
                else
                {
                  if (*MEMORY[0x24BE02780] == (_DWORD)v18 || *MEMORY[0x24BE026B8] == (_DWORD)v18)
                    v55 = 261;
                  else
                    v55 = 257;
                  MutableCopy = ABMultiValueCreateMutable(v55);
                  IndexForIdentifier = -1;
                }
                if (!MutableCopy)
                  goto LABEL_307;
                multiValue = MutableCopy;
                v57 = *MEMORY[0x24BE026B8];
                v88 = IndexForIdentifier;
                if (*MEMORY[0x24BE026B8] == (_DWORD)v18)
                {
                  v58 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
                  v59 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("street"));
                  if (v59)
                    CFDictionarySetValue(v58, (const void *)*MEMORY[0x24BE026C8], v59);
                  v60 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("city"));
                  if (v60)
                    CFDictionarySetValue(v58, (const void *)*MEMORY[0x24BE026A0], v60);
                  v61 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("state"));
                  if (v61)
                    CFDictionarySetValue(v58, (const void *)*MEMORY[0x24BE026C0], v61);
                  v62 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("postal code"));
                  if (v62)
                    CFDictionarySetValue(v58, (const void *)*MEMORY[0x24BE026D0], v62);
                  v63 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("country"));
                  if (v63)
                    CFDictionarySetValue(v58, (const void *)*MEMORY[0x24BE026B0], v63);
                  v64 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("country code"));
                  if (v64)
                  {
                    v65 = v64;
                    v66 = (const void **)MEMORY[0x24BE026A8];
LABEL_213:
                    CFDictionarySetValue(v58, *v66, v65);
                  }
                }
                else if (*MEMORY[0x24BE02780] == (_DWORD)v18)
                {
                  v58 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
                  v67 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("service"));
                  if (v67)
                  {
                    v68 = v67;
                    v69 = *(const __CFDictionary **)(a3 + 352);
                    if (!v69)
                    {
                      _InitializeInstantMessageServiceStringsArrays();
                      v69 = CFDictionaryCreate(0, (const void **)&sSyncServicesInstantMessageServiceStrings, (const void **)&sABInstantMessageServiceStrings, 10, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 352) = v69;
                    }
                    v70 = CFDictionaryGetValue(v69, v68);
                    if (v70)
                      CFDictionarySetValue(v58, (const void *)*MEMORY[0x24BE027B8], v70);
                  }
                  v71 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("user"));
                  if (v71)
                  {
                    v65 = v71;
                    v66 = (const void **)MEMORY[0x24BE027E0];
                    goto LABEL_213;
                  }
                }
                else
                {
                  v72 = *MEMORY[0x24BE02900];
                  v73 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("value"));
                  v58 = (__CFDictionary *)v73;
                  if (v72 == (_DWORD)v18)
                  {
                    v58 = (__CFDictionary *)CFURLCreateStringByReplacingPercentEscapes(0, v73, &stru_24F647E00);
                  }
                  else if (v73)
                  {
                    CFRetain(v73);
                  }
                  else
                  {
                    if (DLShouldLog())
                      _DLLog();
                    v58 = 0;
                  }
                }
                v74 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("type"));
                if (!v74)
                {
                  v78 = v58 != 0;
                  goto LABEL_289;
                }
                v75 = v74;
                if (CFStringCompare(v74, CFSTR("other"), 0))
                {
                  if (*MEMORY[0x24BE02718] == (_DWORD)v18)
                  {
                    v76 = *(const __CFDictionary **)(a3 + 272);
                    if (!v76)
                    {
                      if (!sABEmailTypeStrings)
                      {
                        v77 = *MEMORY[0x24BE02940];
                        sABEmailTypeStrings = *MEMORY[0x24BE02690];
                        unk_255BFB4C0 = v77;
                        sSyncServicesEmailTypeStrings = (uint64_t)CFSTR("home");
                        unk_255BFB4D0 = CFSTR("work");
                      }
                      v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesEmailTypeStrings, (const void **)&sABEmailTypeStrings, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 272) = v76;
                    }
                  }
                  else if (*MEMORY[0x24BE028C0] == (_DWORD)v18)
                  {
                    v76 = *(const __CFDictionary **)(a3 + 288);
                    if (!v76)
                    {
                      _InitializePhoneTypeStringsArrays();
                      v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesPhoneTypeStrings, (const void **)&sABPhoneTypeStrings, 7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 288) = v76;
                    }
                  }
                  else if (v57 == (_DWORD)v18)
                  {
                    v76 = *(const __CFDictionary **)(a3 + 304);
                    if (!v76)
                    {
                      if (!sABAddressTypeStrings)
                      {
                        v82 = *MEMORY[0x24BE02940];
                        sABAddressTypeStrings = *MEMORY[0x24BE02690];
                        unk_255BFB550 = v82;
                        sSyncServicesAddressTypeStrings = (uint64_t)CFSTR("home");
                        unk_255BFB560 = CFSTR("work");
                      }
                      v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesAddressTypeStrings, (const void **)&sABAddressTypeStrings, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 304) = v76;
                    }
                  }
                  else if (*MEMORY[0x24BE02780] == (_DWORD)v18)
                  {
                    v76 = *(const __CFDictionary **)(a3 + 368);
                    if (!v76)
                    {
                      if (!sABInstantMessageTypeStrings)
                      {
                        v83 = *MEMORY[0x24BE02940];
                        sABInstantMessageTypeStrings = *MEMORY[0x24BE02690];
                        unk_255BFB570 = v83;
                        sSyncServicesInstantMessageTypeStrings = (uint64_t)CFSTR("home");
                        unk_255BFB580 = CFSTR("work");
                      }
                      v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesInstantMessageTypeStrings, (const void **)&sABInstantMessageTypeStrings, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 368) = v76;
                    }
                  }
                  else if (*MEMORY[0x24BE02900] == (_DWORD)v18)
                  {
                    v76 = *(const __CFDictionary **)(a3 + 320);
                    if (!v76)
                    {
                      if (!sABURLTypeStrings)
                      {
                        v84 = *MEMORY[0x24BE02690];
                        sABURLTypeStrings = *MEMORY[0x24BE02768];
                        unk_255BFB590 = v84;
                        qword_255BFB598 = *MEMORY[0x24BE02940];
                        sSyncServicesURLTypeStrings = (uint64_t)CFSTR("home page");
                        *(_QWORD *)algn_255BFB5A8 = CFSTR("home");
                        qword_255BFB5B0 = (uint64_t)CFSTR("work");
                      }
                      v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesURLTypeStrings, (const void **)&sABURLTypeStrings, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 320) = v76;
                    }
                  }
                  else if (*MEMORY[0x24BE028E0] == (_DWORD)v18)
                  {
                    v76 = *(const __CFDictionary **)(a3 + 336);
                    if (!v76)
                    {
                      _InitializeRelatedNamesTypeStringsArrays();
                      v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesRelatedNamesTypeStrings, (const void **)&sABRelatedNamesTypeStrings, 11, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 336) = v76;
                    }
                  }
                  else if (*MEMORY[0x24BE02700] == (_DWORD)v18)
                  {
                    v76 = *(const __CFDictionary **)(a3 + 384);
                    if (!v76)
                    {
                      if (!sABDateTypeStrings)
                      {
                        sABDateTypeStrings = *MEMORY[0x24BE026D8];
                        sSyncServicesDateTypeStrings = (uint64_t)CFSTR("anniversary");
                      }
                      v76 = CFDictionaryCreate(0, (const void **)&sSyncServicesDateTypeStrings, (const void **)&sABDateTypeStrings, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 384) = v76;
                    }
                  }
                  else
                  {
                    v76 = 0;
                  }
                  v80 = (const __CFString *)CFDictionaryGetValue(v76, v75);
                  if (DLShouldLog())
                    goto LABEL_282;
                }
                else
                {
                  v79 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("label"));
                  if (v79)
                  {
                    v80 = v79;
                    if (CFStringCompare(v79, CFSTR("iPhone"), 0) == kCFCompareEqualTo)
                    {
                      v81 = DLShouldLog();
                      v80 = (const __CFString *)*MEMORY[0x24BE028A0];
                      if (v81)
                        _DLLog();
                    }
                    if (DLShouldLog())
                      goto LABEL_282;
                  }
                  else
                  {
                    v80 = (const __CFString *)*MEMORY[0x24BE02698];
                    if (DLShouldLog())
LABEL_282:
                      _DLLog();
                  }
                }
                v78 = v58 != 0;
                if (v58 && v80)
                {
                  if (v88 == -1)
                  {
                    ABMultiValueAddValueAndLabel(multiValue, v58, v80, (ABMultiValueIdentifier *)&value);
                    v86 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d/%d"), v18, recordID, value);
                    v87 = *(CFMutableDictionaryRef *)(a3 + 256);
                    if (!v87)
                    {
                      v87 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
                      *(_QWORD *)(a3 + 256) = v87;
                    }
                    *(_QWORD *)(a3 + 240) = v87;
                    if (DLShouldLog())
                      _DLLog();
                    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 240), a1, v86);
                    v85 = multiValue;
                    if (v86)
                      CFRelease(v86);
                  }
                  else
                  {
                    if (DLShouldLog())
                      _DLLog();
                    v85 = multiValue;
                    ABMultiValueReplaceValueAtIndex(multiValue, v58, v88);
                    ABMultiValueReplaceLabelAtIndex(multiValue, v80, v88);
                  }
                  ABMultiValueSetImmutable();
                  if (!ABRecordSetValue(PersonWithRecordID, v18, v85, &error) && DLShouldLog())
                  {
                    ABRecordGetRecordID(PersonWithRecordID);
                    _DLLog();
                  }
                  if (error)
                  {
                    CFRelease(error);
                    error = 0;
                  }
                  goto LABEL_305;
                }
LABEL_289:
                if (DLShouldLog())
                {
                  _DLLog();
                  v85 = multiValue;
                  if (!v78)
                    goto LABEL_306;
                }
                else
                {
                  v85 = multiValue;
                  if (!v78)
                    goto LABEL_306;
                }
LABEL_305:
                CFRelease(v58);
LABEL_306:
                CFRelease(v85);
LABEL_307:
                if (!v52)
                  goto LABEL_310;
                v45 = (CFArrayRef)v52;
                goto LABEL_309;
              }
            }
            if ((_DWORD)recordID != -1)
            {
              PersonWithRecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a3 + 144), recordID);
              if (PersonWithRecordID)
                goto LABEL_150;
            }
            if (!DLShouldLog())
              goto LABEL_310;
LABEL_156:
            _DLLog();
            goto LABEL_310;
          }
          if (DLShouldLog())
            _DLLog();
        }
        v36 = -1;
        goto LABEL_127;
      }
    }
    if (!DLShouldLog())
      return;
LABEL_28:
    _DLLog();
    return;
  }
  v91 = 0;
  if (recordIdentifierIsLocal(a1))
  {
    v27 = CFStringGetIntValue(a1);
    v28 = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a3 + 144), v27);
    if (v28)
    {
      v26 = (void *)v28;
      if (DLShouldLog())
        _DLLog();
      CFRetain(v26);
      goto LABEL_65;
    }
  }
  v30 = ABPersonCreateInSource(*(ABRecordRef *)(a3 + 152));
  if (!v30)
  {
    if (!DLShouldLog())
      return;
    goto LABEL_28;
  }
  v26 = (void *)v30;
  if (ABAddressBookAddRecord(*(ABAddressBookRef *)(a3 + 144), v30, &v91))
  {
    if (v91)
    {
      CFRelease(v91);
      v91 = 0;
    }
    if (!*(_QWORD *)(a3 + 200))
      *(_QWORD *)(a3 + 200) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (DLShouldLog())
      _DLLog();
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 200), a1, v26);
LABEL_65:
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02758], CFSTR("first name"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02820], CFSTR("last name"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02848], CFSTR("middle name"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE028D8], CFSTR("title"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE028F8], CFSTR("suffix"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02858], CFSTR("nickname"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02748], CFSTR("first name yomi"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02810], CFSTR("last name yomi"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02838], CFSTR("middle name yomi"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02868], CFSTR("company name"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE027F0], CFSTR("job title"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02708], CFSTR("department"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE02860], CFSTR("notes"));
    _SetContactValueInABPerson((const __CFDictionary *)a2, v26, *MEMORY[0x24BE026E8], CFSTR("birthday"));
    v31 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("display as company"));
    if (!v31)
    {
      ABRecordRemoveValue(v26, *MEMORY[0x24BE02808], &v91);
      goto LABEL_167;
    }
    v32 = v31;
    if (CFStringCompare(v31, CFSTR("person"), 0))
    {
      if (CFStringCompare(v32, CFSTR("company"), 0))
        goto LABEL_169;
      if (!ABRecordSetValue(v26, *MEMORY[0x24BE02808], (CFTypeRef)*MEMORY[0x24BE027F8], &v91)
        && DLShouldLog())
      {
        goto LABEL_166;
      }
    }
    else if (!ABRecordSetValue(v26, *MEMORY[0x24BE02808], (CFTypeRef)*MEMORY[0x24BE02800], &v91)
           && DLShouldLog())
    {
LABEL_166:
      ABRecordGetRecordID(v26);
      _DLLog();
    }
LABEL_167:
    if (v91)
    {
      CFRelease(v91);
      v91 = 0;
    }
LABEL_169:
    value = 0;
    error = 0;
    if (*(_BYTE *)(a3 + 440)
      && CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ImageChanged")) == (const void *)*MEMORY[0x24BDBD268])
    {
      if (DLShouldLog())
        goto LABEL_187;
    }
    else
    {
      if (CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("SDImageUnchangedMarker")))
      {
        if (DLShouldLog())
          _DLLog();
        if (!CFDictionaryContainsKey((CFDictionaryRef)a2, CFSTR("image")) || !DLShouldLog())
          goto LABEL_311;
        goto LABEL_188;
      }
      if (!ABPersonRemoveImageData(v26, &error) && DLShouldLog())
      {
        ABRecordGetRecordID(v26);
        _DLLog();
      }
      if (error)
      {
        CFRelease(error);
        error = 0;
      }
      if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)a2, CFSTR("image"), (const void **)&value))
        goto LABEL_311;
      *(_BYTE *)(a3 + 137) = 1;
      if (CFDataGetLength((CFDataRef)value) <= *(int *)(a3 + 428))
      {
        if (!ABPersonSetImageData(v26, (CFDataRef)value, &error))
        {
          if (DLShouldLog())
          {
            ABRecordGetRecordID(v26);
            _DLLog();
          }
          if (error)
          {
            CFRelease(error);
            error = 0;
          }
        }
        if ((ABPersonSetImageDataAndCropRect() & 1) == 0)
        {
          if (DLShouldLog())
          {
            ABRecordGetRecordID(v26);
            _DLLog();
          }
          if (error)
            CFRelease(error);
        }
        goto LABEL_311;
      }
      if (DLShouldLog())
      {
LABEL_187:
        ABRecordGetRecordID(v26);
LABEL_188:
        _DLLog();
      }
    }
LABEL_311:
    v29 = (CFErrorRef)v26;
LABEL_312:
    CFRelease(v29);
    return;
  }
  if (DLShouldLog())
    _DLLog();
  CFRelease(v26);
  v29 = v91;
  if (v91)
    goto LABEL_312;
}

void _DeleteContact(uint64_t a1, const __CFString *a2)
{
  SInt32 IntValue;
  ABRecordRef PersonWithRecordID;
  CFErrorRef error;

  error = 0;
  if (DLShouldLog())
    _DLLog();
  if (recordIdentifierIsLocal(a2)
    && (IntValue = CFStringGetIntValue(a2),
        (PersonWithRecordID = ABAddressBookGetPersonWithRecordID(*(ABAddressBookRef *)(a1 + 144), IntValue)) != 0))
  {
    if (!ABAddressBookRemoveRecord(*(ABAddressBookRef *)(a1 + 144), PersonWithRecordID, &error)
      && DLShouldLog())
    {
      _DLLog();
    }
    if (error)
      CFRelease(error);
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _SetContactValueInABPerson(const __CFDictionary *a1, const void *a2, ABPropertyID a3, void *key)
{
  const void *Value;
  CFErrorRef error;

  error = 0;
  Value = CFDictionaryGetValue(a1, key);
  if (Value)
  {
    if (ABRecordSetValue(a2, a3, Value, &error) || !DLShouldLog())
      goto LABEL_8;
  }
  else if (ABRecordRemoveValue(a2, a3, &error) || !DLShouldLog())
  {
    goto LABEL_8;
  }
  ABRecordGetRecordID(a2);
  _DLLog();
LABEL_8:
  if (error)
    CFRelease(error);
}

void _UpdateContactRemapping(const void *a1, const void *a2, __CFDictionary **a3)
{
  _UpdateRecordRemapping(a1, a2, a3, (uint64_t (*)(uint64_t))_CreateContactRecordIdentifier);
}

void _UpdateGroupRemapping(const void *a1, const void *a2, __CFDictionary **a3)
{
  _UpdateRecordRemapping(a1, a2, a3, (uint64_t (*)(uint64_t))_CreateGroupRecordIdentifier);
}

void _UpdateRecordRemapping(const void *a1, ABRecordRef record, __CFDictionary **a3, uint64_t (*a4)(uint64_t))
{
  uint64_t RecordID;
  uint64_t v9;
  CFMutableDictionaryRef Mutable;
  const void *v11;
  __CFDictionary *v12;

  RecordID = ABRecordGetRecordID(record);
  if ((_DWORD)RecordID)
  {
    v9 = RecordID;
    Mutable = a3[31];
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      a3[31] = Mutable;
    }
    a3[30] = Mutable;
    v11 = (const void *)a4(v9);
    if (DLShouldLog())
      _DLLog();
    CFDictionarySetValue(a3[30], a1, v11);
    v12 = a3[24];
    if (!v12)
    {
      v12 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      a3[24] = v12;
    }
    CFDictionaryAddValue(v12, v11, record);
    if (v11)
      CFRelease(v11);
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _RestoreClearedPersonsSound(const __CFDictionary *a1, uint64_t a2)
{
  const void *v3;
  const void *v4;
  const __CFString *Value;
  const __CFString *v6;

  if (a2)
  {
    v3 = (const void *)ABPersonCopyCompositeName();
    if (v3)
    {
      v4 = v3;
      Value = (const __CFString *)CFDictionaryGetValue(a1, v3);
      if (Value)
      {
        v6 = Value;
        if (CFStringCompare(Value, CFSTR("<null>"), 0))
        {
          if (CFStringCompare(v6, CFSTR("<conflict>"), 0))
          {
            if (DLShouldLog())
              _DLLog();
            ABPersonSetSoundIdentifierForMultiValueIdentifier();
          }
          else if (DLShouldLog())
          {
            _DLLog();
          }
        }
      }
      CFRelease(v4);
    }
  }
}

uint64_t CalendarsDataSourceCreator(_QWORD *a1, uint64_t a2, const __CFDictionary *a3, _QWORD *a4)
{
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t Store;
  const __CFNumber *Value;
  const __CFString *v14;
  const void *v15;
  int Type;
  const __CFArray *v17;
  CFIndex Count;
  CFIndex v19;
  CFIndex i;
  uint64_t UID;
  CFStringRef v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  const __CFBoolean *v27;
  const __CFBoolean *v28;
  const void *v29;
  const void *v30;
  const __CFBoolean *v31;
  const __CFBoolean *v32;
  const __CFBoolean *v33;
  const __CFBoolean *v34;
  const __CFBoolean *v35;
  const __CFBoolean *v36;
  const __CFBoolean *v37;
  const __CFBoolean *v38;
  const __CFBoolean *v39;
  const __CFBoolean *v40;
  const __CFBoolean *v41;
  const __CFBoolean *v42;
  int valuePtr;

  v8 = (char *)malloc_type_calloc(0x168uLL, 1uLL, 0xC41700C8uLL);
  v9 = (_QWORD *)MEMORY[0x24BDBD268];
  *a1 = v8;
  *(_QWORD *)v8 = *v9;
  *((_QWORD *)v8 + 2) = CalendarsDataSourceGetVersionFunction;
  *((_QWORD *)v8 + 3) = CalendarsDataSourceCanSyncWithVersionFunction;
  *((_QWORD *)v8 + 4) = CalendarsDataSourceMigrateFunction;
  *((_QWORD *)v8 + 5) = CalendarsDataSourceRemoveStoreFunction;
  *((_QWORD *)v8 + 6) = CalendarsDataSourceGetSyncTypeAndExchangeSyncAnchors;
  *((_QWORD *)v8 + 7) = CalendarsDataSourceClearSyncAnchors;
  *((_QWORD *)v8 + 8) = CalendarsDataSourceClearAllRecords;
  *((_QWORD *)v8 + 9) = CalendarsDataSourceGetChanges;
  *((_QWORD *)v8 + 10) = CalendarsDataSourceGetAllRecords;
  *((_QWORD *)v8 + 11) = CalendarsDataSourceGetCountOfRecords;
  *((_QWORD *)v8 + 12) = CalendarsDataSourceProcessChanges;
  *((_QWORD *)v8 + 13) = CalendarsDataSourceCommit;
  *((_QWORD *)v8 + 14) = CalendarsDataSourceRollback;
  *((_QWORD *)v8 + 15) = CalendarsDataSourceGetEntityTypeProcessOrder;
  *((_QWORD *)v8 + 16) = CalendarsDataSourceDeleteDataSource;
  *((_QWORD *)v8 + 17) = DLMemoryPoolCreate();
  *((_QWORD *)v8 + 37) = 0;
  *((_OWORD *)v8 + 9) = 0u;
  *((_OWORD *)v8 + 10) = 0u;
  *((_DWORD *)v8 + 44) = 0;
  *((_OWORD *)v8 + 13) = 0u;
  *((_OWORD *)v8 + 14) = 0u;
  *((_OWORD *)v8 + 15) = 0u;
  *((_OWORD *)v8 + 16) = 0u;
  *((_OWORD *)v8 + 17) = 0u;
  *((_QWORD *)v8 + 23) = CalDatabaseCreateWithOptions();
  CalDatabaseSetClientIdentifier();
  *((_QWORD *)v8 + 24) = CalDatabaseCopyDefaultLocalCalendar();
  if (!a2)
  {
    v25 = CalDatabaseCopyLocalStore();
    *((_QWORD *)v8 + 25) = v25;
    if (v25)
    {
      v24 = 0;
      goto LABEL_45;
    }
    if (!DLShouldLog())
      goto LABEL_42;
    goto LABEL_41;
  }
  v10 = CalDatabaseCopyStoreWithExternalID();
  v11 = v10;
  if (v10)
    goto LABEL_7;
  if (DLShouldLog())
    _DLLog();
  Store = CalDatabaseCreateStore();
  if (Store)
  {
    v11 = Store;
    CalStoreSetExternalID();
LABEL_7:
    if (DLShouldLog())
      _DLLog();
    if (a3)
    {
      if (CFDictionaryGetValue(a3, CFSTR("StoreDisplayName")))
        CalStoreSetName();
      Value = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("StoreType"));
      if (Value)
      {
        valuePtr = -1;
        if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
          CalStoreSetType();
      }
    }
    v14 = (const __CFString *)CalDatabaseCopyProperty();
    if (!v14)
      goto LABEL_27;
    v15 = v14;
    if (CFStringGetIntValue(v14) <= 106)
    {
      Type = CalStoreGetType();
      CFRelease(v15);
      if (Type != 3)
        goto LABEL_27;
      if (DLShouldLog())
        _DLLog();
      v17 = (const __CFArray *)CalStoreCopyCalendars();
      if (!v17)
        goto LABEL_27;
      v15 = v17;
      Count = CFArrayGetCount(v17);
      if (Count >= 1)
      {
        v19 = Count;
        for (i = 0; i != v19; ++i)
        {
          CFArrayGetValueAtIndex((CFArrayRef)v15, i);
          UID = CalCalendarGetUID();
          v22 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), UID);
          CalCalendarSetExternalID();
          if (v22)
            CFRelease(v22);
        }
      }
    }
    CFRelease(v15);
LABEL_27:
    if (!v10)
      CalDatabaseSave();
    v23 = (const void *)*((_QWORD *)v8 + 25);
    if (v23)
      CFRelease(v23);
    v24 = 0;
    *((_QWORD *)v8 + 25) = v11;
    goto LABEL_45;
  }
  if (DLShouldLog())
    _DLLog();
  if (a4)
  {
    *a4 = CFSTR("Could not create a new calendar store");
    CFRetain(CFSTR("Could not create a new calendar store"));
  }
  if (DLShouldLog())
LABEL_41:
    _DLLog();
LABEL_42:
  if (DLShouldLog())
    _DLLog();
  v24 = 0xFFFFFFFFLL;
LABEL_45:
  *((_DWORD *)v8 + 78) = CalDatabaseRegisterClientForPersistentChangeTrackingInStore();
  *(_QWORD *)&v26 = 0x100000001;
  *((_QWORD *)&v26 + 1) = 0x100000001;
  *(_OWORD *)(v8 + 316) = v26;
  *(_QWORD *)(v8 + 332) = 0xFFFFFFFEFFFFFFFELL;
  *((_QWORD *)v8 + 43) = 0;
  v8[340] = 0;
  *((_DWORD *)v8 + 88) = 257;
  v8[356] = 1;
  if (a3)
  {
    v27 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("ShouldSendAllCalendarsOnFastSync"));
    if (v27)
    {
      v28 = v27;
      if (DLShouldLog())
        _DLLog();
      v8[340] = CFBooleanGetValue(v28);
    }
    v29 = CFDictionaryGetValue(a3, CFSTR("OrganizerAddressSet"));
    if (v29)
    {
      v30 = v29;
      if (DLShouldLog())
        _DLLog();
      *((_QWORD *)v8 + 43) = CFRetain(v30);
    }
    v31 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("ShouldSyncAttendeesAndOrganizers"));
    if (v31)
    {
      v32 = v31;
      if (DLShouldLog())
        _DLLog();
      v8[352] = CFBooleanGetValue(v32);
    }
    v33 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("ShouldSyncCalendarColors"));
    if (v33)
    {
      v34 = v33;
      if (DLShouldLog())
        _DLLog();
      v8[353] = CFBooleanGetValue(v34);
    }
    v35 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("UpdateAnchorsOnPull"));
    if (v35)
    {
      v36 = v35;
      if (DLShouldLog())
        _DLLog();
      v8[354] = CFBooleanGetValue(v36);
    }
    v37 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("IsEventsOnly"));
    if (v37)
    {
      v38 = v37;
      if (DLShouldLog())
        _DLLog();
      v8[357] = CFBooleanGetValue(v38);
    }
    v39 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("IsRemindersOnly"));
    if (v39)
    {
      v40 = v39;
      if (DLShouldLog())
        _DLLog();
      v8[358] = CFBooleanGetValue(v40);
    }
    v41 = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("IsTetheredSync"));
    if (v41)
    {
      v42 = v41;
      if (DLShouldLog())
        _DLLog();
      v8[359] = CFBooleanGetValue(v42);
    }
  }
  return v24;
}

uint64_t CalendarsDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3;

  v3 = (CFNumberRef)sCalendarDataSourceVersion;
  if (!sCalendarDataSourceVersion)
  {
    v3 = CFNumberCreate(0, kCFNumberIntType, &kDefaultCalendarsDataSourceVersion);
    sCalendarDataSourceVersion = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t CalendarsDataSourceCanSyncWithVersionFunction(uint64_t a1, CFNumberRef number, _QWORD *a3)
{
  _QWORD *v5;
  int v6;
  int valuePtr;

  valuePtr = 0;
  CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
  v5 = (_QWORD *)MEMORY[0x24BDBD270];
  v6 = valuePtr;
  if (valuePtr <= 102)
    v5 = (_QWORD *)MEMORY[0x24BDBD268];
  *a3 = *v5;
  if (v6 <= 104)
  {
    if (DLShouldLog())
      _DLLog();
    *(_WORD *)(a1 + 352) = 0;
    v6 = valuePtr;
  }
  if (v6 <= 107)
  {
    *(_BYTE *)(a1 + 356) = 0;
    if (DLShouldLog())
      _DLLog();
  }
  return 0;
}

uint64_t CalendarsDataSourceMigrateFunction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  int v11;
  const __CFString *v12;
  const void *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v18;

  CalStoreGetUID();
  v4 = CalDatabaseCopyStoreWithUID();
  if (!v4)
    return DLSetStatus();
  v5 = (const void *)v4;
  if (DLShouldLog())
    _DLLog();
  v6 = (const __CFArray *)CalStoreCopyCalendars();
  if (v6)
  {
    v7 = v6;
    Count = CFArrayGetCount(v6);
    if (Count < 1)
    {
      CFRelease(v7);
    }
    else
    {
      v9 = Count;
      v18 = a1;
      v10 = 0;
      v11 = 0;
      do
      {
        CFArrayGetValueAtIndex(v7, v10);
        v12 = (const __CFString *)CalCalendarCopyType();
        if ((CalCalendarIsSubscribed() & 1) != 0
          || (CalCalendarIsInbox() & 1) != 0
          || (CalCalendarIsNotificationsCollection() & 1) != 0
          || CalCalendarGetSharingStatus() == 3
          || v12
          && (CFStringCompare(v12, CFSTR("caldav"), 0) == kCFCompareEqualTo
           || CFStringCompare(v12, CFSTR("urlsubscribe"), 0) == kCFCompareEqualTo)
          || CalCalendarGetSharingStatus() == 2
          || CalCalendarIsReadOnly())
        {
          v13 = (const void *)CalCalendarCopyTitle();
          if (DLShouldLog())
          {
            CalCalendarGetUID();
            _DLLog();
          }
          if (v13)
            CFRelease(v13);
          CalRemoveCalendar();
          v11 = 1;
        }
        if (v12)
          CFRelease(v12);
        ++v10;
      }
      while (v9 != v10);
      CFRelease(v7);
      a1 = v18;
      if (v11)
        CalDatabaseSave();
    }
  }
  v14 = *(_BYTE *)(a1 + 357) || *(_BYTE *)(a1 + 358) || *(_BYTE *)(a2 + 357) || *(_BYTE *)(a2 + 358)
      ? CalDatabaseMigrateCalendarsWithEntityType()
      : CalStoreMigrateToStore();
  v15 = v14;
  CFRelease(v5);
  if (!v15)
    return DLSetStatus();
  _setComputerSyncAnchorForStore_0(a2);
  _setDeviceSyncAnchorForStore_0(a2);
  if ((CalDatabaseSave() & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    if (DLShouldLog())
      _DLLog();
    v16 = 0xFFFFFFFFLL;
  }
  _setComputerSyncAnchorForStore_0(a1);
  _setDeviceSyncAnchorForStore_0(a1);
  if ((CalDatabaseSave() & 1) == 0)
  {
    if (DLShouldLog())
      _DLLog();
    return 0xFFFFFFFFLL;
  }
  return v16;
}

uint64_t CalendarsDataSourceRemoveStoreFunction(uint64_t a1)
{
  const void *v2;
  uint64_t v3;

  if (DLShouldLog())
  {
    CalStoreGetUID();
    _DLLog();
  }
  _setComputerSyncAnchorForStore_0(a1);
  _setDeviceSyncAnchorForStore_0(a1);
  v2 = (const void *)CalStoreCopyExternalID();
  CalRemoveStore();
  if ((CalDatabaseSave() & 1) != 0)
  {
    v3 = 0;
    if (!v2)
      return v3;
    goto LABEL_9;
  }
  if (DLShouldLog())
    _DLLog();
  v3 = 0xFFFFFFFFLL;
  if (v2)
LABEL_9:
    CFRelease(v2);
  return v3;
}

uint64_t CalendarsDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, const __CFString *a3, const void *a4, uint64_t *a5, CFTypeRef *a6)
{
  CFStringRef v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  CFStringRef v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFLocale *v23;
  __CFDateFormatter *v24;
  CFAbsoluteTime Current;
  const void *v26;

  v12 = _copyComputerSyncAnchorKey_0(a1);
  if (DLShouldLog())
    _DLLog();
  v13 = CalDatabaseCopyProperty();
  if (!v13)
  {
    v14 = (const __CFString *)CalDatabaseCopyProperty();
    if (v14)
    {
      v15 = v14;
      if (CFStringCompare(v14, CFSTR("__UNUSED__"), 0))
      {
        if (DLShouldLog())
          _DLLog();
        CalDatabaseSetProperty();
        CalDatabaseSetProperty();
        v13 = (uint64_t)CFRetain(v15);
      }
      else
      {
        v13 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      v13 = 0;
    }
  }
  if (v12)
    CFRelease(v12);
  if (a4)
  {
    CFRetain(a4);
    *(_QWORD *)(a1 + 152) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog())
    _DLLog();
  *a2 = CFRetain(CFSTR("SDSyncTypeFast"));
  *a5 = v13;
  v16 = _copyDeviceSyncAnchorKey_0(a1);
  if (DLShouldLog())
    _DLLog();
  v17 = (const __CFString *)CalDatabaseCopyProperty();
  if (!v17)
  {
    v18 = (const __CFString *)CalDatabaseCopyProperty();
    if (v18)
    {
      v19 = v18;
      if (CFStringCompare(v18, CFSTR("__UNUSED__"), 0))
      {
        if (DLShouldLog())
          _DLLog();
        CalDatabaseSetProperty();
        CalDatabaseSetProperty();
        v17 = (const __CFString *)CFRetain(v19);
      }
      else
      {
        v17 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      v17 = 0;
    }
  }
  if (v16)
    CFRelease(v16);
  v20 = (const __CFString *)CalDatabaseCopyProperty();
  v21 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), kDefaultCalendarsDataSourceVersion);
  if (DLShouldLog())
    _DLLog();
  if (v17)
  {
    if (v20 && CFStringCompare(v20, v21, 0) == kCFCompareEqualTo)
    {
      if (a3 && CFStringCompare(v17, a3, 0) == kCFCompareEqualTo)
      {
LABEL_40:
        CFRelease(v17);
        if (!v20)
          goto LABEL_42;
        goto LABEL_41;
      }
      if (DLShouldLog())
        _DLLog();
      v22 = CFSTR("SDSyncTypeSlow");
    }
    else
    {
      if (DLShouldLog())
        _DLLog();
      v22 = CFSTR("SDSyncTypeReset");
    }
    *a2 = CFRetain(v22);
    goto LABEL_40;
  }
  if (DLShouldLog())
    _DLLog();
  *a2 = CFRetain(CFSTR("SDSyncTypeReset"));
  if (v20)
LABEL_41:
    CFRelease(v20);
LABEL_42:
  if (v21)
    CFRelease(v21);
  v23 = CFLocaleCopyCurrent();
  v24 = CFDateFormatterCreate(0, v23, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
  CFDateFormatterSetFormat(v24, CFSTR("MMM dd yyyy HH:mm:ss ZZZ"));
  Current = CFAbsoluteTimeGetCurrent();
  CFDateFormatterCreateStringWithAbsoluteTime(0, v24, Current);
  v26 = (const void *)DLMemoryPoolAddObject();
  *(_QWORD *)(a1 + 144) = v26;
  *a6 = CFRetain(v26);
  if (DLShouldLog())
    _DLLog();
  CFRelease(v24);
  CFRelease(v23);
  return 0;
}

uint64_t CalendarsDataSourceClearSyncAnchors(uint64_t a1)
{
  _setComputerSyncAnchorForStore_0(a1);
  _setDeviceSyncAnchorForStore_0(a1);
  return CalDatabaseSave() - 1;
}

uint64_t CalendarsDataSourceClearAllRecords(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *v7;
  CFStringRef v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex v11;
  CFIndex v12;
  CFIndex j;
  const void *v14;
  CFStringRef v15;
  uint64_t UID;

  if (*(_BYTE *)(a1 + 357) || *(_BYTE *)(a1 + 358))
  {
    v2 = (const __CFArray *)CalStoreCopyCalendars();
    if (v2)
    {
      v3 = v2;
      Count = CFArrayGetCount(v2);
      if (Count >= 1)
      {
        v5 = Count;
        for (i = 0; i != v5; ++i)
        {
          CFArrayGetValueAtIndex(v3, i);
          if (CalCalendarCanContainEntityType())
          {
            if (DLShouldLog())
            {
              CalCalendarGetUID();
              _DLLog();
            }
            if (CalCalendarCanContainEntityType())
            {
              CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType();
              CalCalendarSetCanContainEntityType();
            }
            else
            {
              v7 = (const void *)CalCalendarCopyTitle();
              v8 = CFStringCreateWithFormat(0, 0, CFSTR("%@-CalDAVInfo"), v7);
              if (v7)
                CFRelease(v7);
              CalDatabaseSetProperty();
              if (v8)
                CFRelease(v8);
              CalRemoveCalendar();
            }
          }
        }
      }
      CFRelease(v3);
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 312) & 0x80000000) == 0)
      CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
    v9 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStore();
    if (v9)
    {
      v10 = v9;
      v11 = CFArrayGetCount(v9);
      if (v11 >= 1)
      {
        v12 = v11;
        for (j = 0; j != v12; ++j)
        {
          CFArrayGetValueAtIndex(v10, j);
          v14 = (const void *)CalCalendarCopyTitle();
          if (DLShouldLog())
          {
            UID = CalCalendarGetUID();
            _DLLog();
          }
          v15 = CFStringCreateWithFormat(0, 0, CFSTR("%@-CalDAVInfo"), v14, UID);
          if (v14)
            CFRelease(v14);
          CalDatabaseSetProperty();
          if (v15)
            CFRelease(v15);
          CalRemoveCalendar();
        }
      }
      CFRelease(v10);
    }
    if (!*(_QWORD *)(a1 + 144))
    {
      CFRetain(CFSTR("---"));
      *(_QWORD *)(a1 + 144) = DLMemoryPoolAddObject();
    }
    if (DLShouldLog())
      _DLLog();
    _setDeviceSyncAnchorForStore_0(a1);
  }
  return 0;
}

uint64_t CalendarsDataSourceGetChanges(uint64_t a1, CFMutableDictionaryRef *a2, _QWORD *a3)
{
  int v6;
  uint64_t result;
  CFIndex v8;
  __CFSet *v9;
  const void *ValueAtIndex;
  const __CFArray *v11;
  const __CFArray *v12;

  *a2 = 0;
  v6 = *(_DWORD *)(a1 + 176);
  if (v6 == 2)
  {
LABEL_4:
    *(_DWORD *)(a1 + 320) = CalDatabaseCopyEventChangesInStore();
    *(_DWORD *)(a1 + 324) = CalDatabaseCopyTaskChangesInStore();
    *(_DWORD *)(a1 + 328) = CalDatabaseCopyAlarmChangesInStore();
    *(_DWORD *)(a1 + 332) = CalDatabaseCopyRecurrenceChangesInStore();
    *(_DWORD *)(a1 + 336) = CalDatabaseCopyAttendeeChangesInStore();
    *a3 = *MEMORY[0x24BDBD268];
    _AccumulateChangedRecords(a1, 2, a2, 0, 0);
    _AccumulateChangedRecords(a1, 8, a2, 0, 0);
    _AccumulateChangedRecords(a1, 4, a2, 0, 0);
    _AccumulateChangedRecords(a1, 5, a2, 0, 0);
    _AccumulateChangedRecords(a1, 7, a2, 0, 0);
    if (!*(_BYTE *)(a1 + 354))
      _saveDeviceSyncAnchorAndClearChangeHistory_0(a1);
    result = 0;
    *(_DWORD *)(a1 + 176) = 6;
    return result;
  }
  if (!v6)
  {
    *(_DWORD *)(a1 + 176) = 2;
    *(_DWORD *)(a1 + 316) = CalDatabaseCopyCalendarChangesInStore();
    *(_QWORD *)(a1 + 304) = CFSetCreateMutable(0, 0, 0);
    if (CFArrayGetCount(0) >= 1)
    {
      v8 = 0;
      do
      {
        v9 = *(__CFSet **)(a1 + 304);
        ValueAtIndex = CFArrayGetValueAtIndex(0, v8);
        CFSetAddValue(v9, ValueAtIndex);
        ++v8;
      }
      while (v8 < CFArrayGetCount(0));
    }
    if (*(_BYTE *)(a1 + 340) == 1)
    {
      v11 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStore();
      if (v11)
      {
        v12 = v11;
        _AccumulateCalendars(a1, a2, v11);
        CFRelease(v12);
        if (DLShouldLog())
          _DLLog();
        if (*a2 && CFDictionaryGetCount(*a2) >= 1)
        {
          *a3 = *MEMORY[0x24BDBD270];
          return 0;
        }
      }
    }
    else
    {
      _AccumulateChangedRecords(a1, 1, a2, 0, 0);
      if (DLShouldLog())
        _DLLog();
      if (*a2 && CFDictionaryGetCount(*a2) >= 1)
      {
        result = 0;
        *a3 = *MEMORY[0x24BDBD270];
        return result;
      }
    }
    goto LABEL_4;
  }
  if (DLShouldLog())
    _DLLog();
  return 0xFFFFFFFFLL;
}

uint64_t CalendarsDataSourceGetAllRecords(uint64_t a1, CFMutableDictionaryRef *a2, _QWORD *a3)
{
  const __CFArray *v6;
  const __CFArray *v7;
  int v8;
  const __CFArray *v9;
  const __CFArray *v10;
  const void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  const __CFDictionary *v18;
  CFMutableDictionaryRef Mutable;

  *a2 = 0;
  *a3 = *MEMORY[0x24BDBD270];
  switch(*(_DWORD *)(a1 + 176))
  {
    case 0:
      *(_DWORD *)(a1 + 316) = CalDatabaseCopyCalendarChangesInStore();
      v6 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStore();
      if (v6)
      {
        v7 = v6;
        _AccumulateCalendars(a1, a2, v6);
        CFRelease(v7);
      }
      v8 = 2;
      goto LABEL_21;
    case 2:
      *(_DWORD *)(a1 + 320) = CalDatabaseCopyEventChangesInStore();
      v9 = (const __CFArray *)CalDatabaseCopyOfAllEventsInStore();
      if (v9)
      {
        v10 = v9;
        _AccumulateEvents(a1, a2, v9);
        if (*(_BYTE *)(a1 + 352) == 1)
        {
          v11 = *(const void **)(a1 + 288);
          if (v11)
          {
            CFRelease(v11);
            *(_QWORD *)(a1 + 288) = 0;
          }
          _AccumulateOrganizers(a1, (CFMutableDictionaryRef *)(a1 + 288), v10);
        }
        CFRelease(v10);
      }
      v8 = 3;
      goto LABEL_21;
    case 3:
      *(_DWORD *)(a1 + 328) = CalDatabaseCopyAlarmChangesInStore();
      v12 = (const __CFArray *)CalDatabaseCopyOfAllAlarmsInStore();
      if (v12)
      {
        v13 = v12;
        _AccumulateAlarms(a2, v12);
        CFRelease(v13);
      }
      v8 = 4;
      goto LABEL_21;
    case 4:
      *(_DWORD *)(a1 + 332) = CalDatabaseCopyRecurrenceChangesInStore();
      v14 = (const __CFArray *)CalDatabaseCopyOfAllRecurrencesInStore();
      if (v14)
      {
        v15 = v14;
        _AccumulateRecurrences(a2, v14);
        CFRelease(v15);
      }
      if (!*(_BYTE *)(a1 + 352))
        goto LABEL_28;
      v8 = 5;
LABEL_21:
      *(_DWORD *)(a1 + 176) = v8;
      break;
    case 5:
      *(_DWORD *)(a1 + 336) = CalDatabaseCopyAttendeeChangesInStore();
      v16 = (const __CFArray *)CalDatabaseCopyOfAllAttendeesInStore();
      if (v16)
      {
        v17 = v16;
        _AccumulateAttendees(a1, a2, v16);
        CFRelease(v17);
      }
      v18 = *(const __CFDictionary **)(a1 + 288);
      if (v18)
      {
        Mutable = *a2;
        if (!*a2)
        {
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          *a2 = Mutable;
          v18 = *(const __CFDictionary **)(a1 + 288);
        }
        CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)_addOrganizersToDictionary, Mutable);
        CFRelease(*(CFTypeRef *)(a1 + 288));
      }
      goto LABEL_28;
    default:
      if (DLShouldLog())
        _DLLog();
LABEL_28:
      *(_DWORD *)(a1 + 176) = 6;
      *a3 = *MEMORY[0x24BDBD268];
      if (!*(_BYTE *)(a1 + 354) && !*(_BYTE *)(a1 + 355))
        _saveDeviceSyncAnchorAndClearChangeHistory_0(a1);
      break;
  }
  return 0;
}

uint64_t CalendarsDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  int CountOfEventsInStore;
  int v4;

  if (*(_BYTE *)(a1 + 357))
  {
    *a2 = 0;
    CountOfEventsInStore = CalDatabaseGetCountOfEventsInStore();
  }
  else
  {
    v4 = *(unsigned __int8 *)(a1 + 358);
    *a2 = 0;
    if (v4)
      CountOfEventsInStore = CalDatabaseGetCountOfTasksInStore();
    else
      CountOfEventsInStore = CalDatabaseGetCountOfCalendarItemsInStore();
  }
  *a2 = CountOfEventsInStore;
  return 0;
}

uint64_t CalendarsDataSourceProcessChanges(uint64_t context, CFDictionaryRef theDict, uint64_t a3, _QWORD *a4)
{
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFSet *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;

  if (*(_BYTE *)(context + 354) && !*(_BYTE *)(context + 355))
    _saveDeviceSyncAnchorAndClearChangeHistory_0(context);
  if (*(_BYTE *)(context + 352) == 1 && !*(_QWORD *)(context + 344))
    *(_QWORD *)(context + 344) = _copySetOfEmailAddressesFromMessageFramework(context);
  v7 = *(const __CFDictionary **)(context + 160);
  if (v7)
  {
    CFDictionaryApplyFunction(v7, (CFDictionaryApplierFunction)_addCurrentRemappingsToAllRemappings, (void *)context);
    *(_QWORD *)(context + 160) = 0;
  }
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_ChangesApplierFunction_0, (void *)context);
  CalDatabaseProcessAddedRecords();
  v8 = *(const __CFDictionary **)(context + 208);
  if (v8)
  {
    CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)_UpdateCalendarRemapping, (void *)context);
    *(_QWORD *)(context + 208) = 0;
  }
  v9 = *(const __CFDictionary **)(context + 216);
  if (v9)
  {
    CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)_UpdateEventRemapping, (void *)context);
    *(_QWORD *)(context + 216) = 0;
  }
  v10 = *(const __CFDictionary **)(context + 272);
  if (v10 && CFDictionaryGetCount(v10))
  {
    if (*(_QWORD *)(context + 264))
    {
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(context + 272), (CFDictionaryApplierFunction)_UpdateDetachedEvents, (void *)context);
      v11 = *(const __CFSet **)(context + 280);
      if (v11)
      {
        CFSetApplyFunction(v11, (CFSetApplierFunction)_RemoveProcessedMainRecordIds, (void *)context);
        CFSetRemoveAllValues(*(CFMutableSetRef *)(context + 280));
      }
    }
    else if (DLShouldLog())
    {
      _DLLog();
    }
  }
  v12 = *(const __CFDictionary **)(context + 248);
  if (v12)
  {
    CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)_UpdateOrganizerRemapping, (void *)context);
    *(_QWORD *)(context + 248) = 0;
  }
  v13 = *(const __CFDictionary **)(context + 224);
  if (v13)
  {
    CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)_UpdateTaskRemapping, (void *)context);
    *(_QWORD *)(context + 224) = 0;
  }
  v14 = *(const __CFDictionary **)(context + 232);
  if (v14)
  {
    CFDictionaryApplyFunction(v14, (CFDictionaryApplierFunction)_UpdateAlarmRemapping, (void *)context);
    *(_QWORD *)(context + 232) = 0;
  }
  v15 = *(const __CFDictionary **)(context + 240);
  if (v15)
  {
    CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)_UpdateRecurrenceRemapping, (void *)context);
    *(_QWORD *)(context + 240) = 0;
  }
  v16 = *(const __CFDictionary **)(context + 256);
  if (v16)
  {
    CFDictionaryApplyFunction(v16, (CFDictionaryApplierFunction)_UpdateAttendeeRemapping, (void *)context);
    *(_QWORD *)(context + 256) = 0;
  }
  *a4 = *(_QWORD *)(context + 160);
  return 0;
}

uint64_t CalendarsDataSourceCommit(uint64_t a1, _QWORD *a2)
{
  CFStringRef v4;

  if (*(_BYTE *)(a1 + 354) && !*(_BYTE *)(a1 + 355))
    _saveDeviceSyncAnchorAndClearChangeHistory_0(a1);
  if (!*(_QWORD *)(a1 + 152))
  {
    CFRetain(CFSTR("---"));
    *(_QWORD *)(a1 + 152) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog())
    _DLLog();
  _setComputerSyncAnchorForStore_0(a1);
  v4 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), kDefaultCalendarsDataSourceVersion);
  CalDatabaseSetProperty();
  if (v4)
    CFRelease(v4);
  if (*(_BYTE *)(a1 + 359))
    CalStoreSetAllowsEvents();
  if ((CalDatabaseSaveAndFlushCaches() & 1) != 0)
  {
    CalDatabaseWaitForSpotlight();
    return 0;
  }
  else
  {
    if (DLShouldLog())
      _DLLog();
    if (a2)
    {
      *a2 = CFSTR("Can't commit Calendars");
      CFRetain(CFSTR("Can't commit Calendars"));
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t CalendarsDataSourceRollback()
{
  return 0;
}

uint64_t CalendarsDataSourceGetEntityTypeProcessOrder(uint64_t a1, __CFArray **a2)
{
  __CFArray *Mutable;
  const __CFAllocator *v5;
  const CFArrayCallBacks *v6;
  __CFArray *v7;
  __CFArray *v8;
  __CFArray *v9;
  __CFArray *v10;
  __CFArray *v11;
  __CFArray *v12;

  Mutable = *(__CFArray **)(a1 + 296);
  if (!Mutable)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v6 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    v7 = CFArrayCreateMutable(v5, 0, v6);
    CFArrayAppendValue(v7, CFSTR("com.apple.calendars.Calendar"));
    CFArrayAppendValue(Mutable, v7);
    if (v7)
      CFRelease(v7);
    v8 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v8, CFSTR("com.apple.calendars.Event"));
    CFArrayAppendValue(Mutable, v8);
    if (v8)
      CFRelease(v8);
    v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v9, CFSTR("com.apple.calendars.AudioAlarm"));
    CFArrayAppendValue(v9, CFSTR("com.apple.calendars.DisplayAlarm"));
    CFArrayAppendValue(Mutable, v9);
    if (v9)
      CFRelease(v9);
    v10 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v10, CFSTR("com.apple.calendars.Recurrence"));
    CFArrayAppendValue(Mutable, v10);
    if (v10)
      CFRelease(v10);
    v11 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v11, CFSTR("com.apple.calendars.Attendee"));
    CFArrayAppendValue(v11, CFSTR("com.apple.calendars.Organizer"));
    CFArrayAppendValue(Mutable, v11);
    if (v11)
      CFRelease(v11);
    v12 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v12, CFSTR("com.apple.calendars.CalendarOrder"));
    CFArrayAppendValue(Mutable, v12);
    if (v12)
      CFRelease(v12);
    *(_QWORD *)(a1 + 296) = Mutable;
  }
  *a2 = Mutable;
  return 0;
}

uint64_t CalendarsDataSourceDeleteDataSource(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;

  if (DLShouldLog())
    _DLLog();
  v2 = (const void *)a1[17];
  if (v2)
  {
    CFRelease(v2);
    a1[17] = 0;
  }
  v3 = (const void *)a1[37];
  if (v3)
  {
    CFRelease(v3);
    a1[37] = 0;
  }
  v4 = (const void *)a1[24];
  if (v4)
  {
    CFRelease(v4);
    a1[24] = 0;
  }
  v5 = (const void *)a1[25];
  if (v5)
  {
    CFRelease(v5);
    a1[25] = 0;
  }
  v6 = (const void *)a1[43];
  if (v6)
  {
    CFRelease(v6);
    a1[43] = 0;
  }
  v7 = (const void *)a1[23];
  if (v7)
  {
    CFRelease(v7);
    a1[23] = 0;
  }
  v8 = (const void *)a1[38];
  if (v8)
    CFRelease(v8);
  free(a1);
  return 0;
}

id _reallyCopySetOfEmailAddressesFromMessageFramework()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  int v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (DLShouldLog())
    _DLLog();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  if (_calendarSyncAccountLoader_onceToken != -1)
    dispatch_once(&_calendarSyncAccountLoader_onceToken, &__block_literal_global);
  v1 = (void *)objc_msgSend((id)_calendarSyncAccountLoader_sSyncAccountLoader, "mailAccounts");
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(v0, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "emailAddresses"));
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  v6 = DLShouldLog();
  if (v0)
  {
    if (v6)
      goto LABEL_16;
  }
  else if (v6)
  {
LABEL_16:
    _DLLog();
  }
  return v0;
}

uint64_t _copySetOfEmailAddressesFromMessageFramework(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___copySetOfEmailAddressesFromMessageFramework_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_copySetOfEmailAddressesFromMessageFramework_onceToken != -1)
    dispatch_once(&_copySetOfEmailAddressesFromMessageFramework_onceToken, block);
  return _copySetOfEmailAddressesFromMessageFramework_sEmails;
}

id ___copySetOfEmailAddressesFromMessageFramework_block_invoke()
{
  id result;

  result = _reallyCopySetOfEmailAddressesFromMessageFramework();
  _copySetOfEmailAddressesFromMessageFramework_sEmails = (uint64_t)result;
  return result;
}

void _setComputerSyncAnchorForStore_0(uint64_t a1)
{
  CFStringRef v1;

  v1 = _copyComputerSyncAnchorKey_0(a1);
  if (DLShouldLog())
    _DLLog();
  CalDatabaseSetProperty();
  if (v1)
    CFRelease(v1);
}

void _setDeviceSyncAnchorForStore_0(uint64_t a1)
{
  CFStringRef v1;

  v1 = _copyDeviceSyncAnchorKey_0(a1);
  if (DLShouldLog())
    _DLLog();
  CalDatabaseSetProperty();
  if (v1)
    CFRelease(v1);
}

CFStringRef _copyComputerSyncAnchorKey_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t UID;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (DLShouldLog())
  {
    if (a1)
    {
      v2 = *(_QWORD *)(a1 + 200);
      if (v2)
      {
        UID = CalStoreGetUID();
LABEL_7:
        v6 = v2;
        v7 = UID;
        _DLLog();
        goto LABEL_8;
      }
    }
    else
    {
      v2 = 0;
    }
    UID = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
LABEL_8:
  if (a1 && *(_QWORD *)(a1 + 200))
    v4 = CalStoreGetUID();
  else
    v4 = 0xFFFFFFFFLL;
  return CFStringCreateWithFormat(0, 0, CFSTR("ComputerStoreSyncAnchor-%d"), v4, v6, v7);
}

CFStringRef _copyDeviceSyncAnchorKey_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t UID;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (DLShouldLog())
  {
    if (a1)
    {
      v2 = *(_QWORD *)(a1 + 200);
      if (v2)
      {
        UID = CalStoreGetUID();
LABEL_7:
        v6 = v2;
        v7 = UID;
        _DLLog();
        goto LABEL_8;
      }
    }
    else
    {
      v2 = 0;
    }
    UID = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
LABEL_8:
  if (a1 && *(_QWORD *)(a1 + 200))
    v4 = CalStoreGetUID();
  else
    v4 = 0xFFFFFFFFLL;
  return CFStringCreateWithFormat(0, 0, CFSTR("DeviceStoreSyncAnchor-%d"), v4, v6, v7);
}

void _AccumulateCalendars(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  const __CFAllocator **v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __CFAllocator *v10;
  int UID;
  uint64_t v12;
  __CFDictionary *Mutable;
  const __CFSet *v14;
  CFStringRef v15;
  const __CFString *v16;
  const __CFString *v17;
  const void *v18;
  CFNumberRef v19;
  CFNumberRef v20;
  char ColorComponents;
  __CFArray *v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  const void *v27;
  const void *v28;
  const __CFAllocator *v29;
  CFMutableDictionaryRef *v30;
  void *value;
  CFStringRef key;
  CFTypeRef cf;
  __CFDictionary *theDict;
  int v35;
  int v36;
  int v37;
  int v38;
  int valuePtr;

  if (CFArrayGetCount(theArray))
  {
    v6 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if (!*a2)
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v8 = Count;
      v9 = 0;
      v10 = *v6;
      value = (void *)*MEMORY[0x24BDBD270];
      do
      {
        if (CFArrayGetValueAtIndex(theArray, v9) == *(const void **)(a1 + 192))
        {
          if (DLShouldLog())
            goto LABEL_25;
        }
        else if (CalCalendarIsSubscribed())
        {
          if (DLShouldLog())
            goto LABEL_25;
        }
        else if ((CalCalendarCanContainEntityType() & 1) != 0)
        {
          UID = CalCalendarGetUID();
          v12 = CalCalendarCopyTitle();
          if (UID == -1)
          {
            v18 = (const void *)v12;
            if (DLShouldLog())
              _DLLog();
            if (!v18)
              goto LABEL_26;
            goto LABEL_65;
          }
          if (v12)
          {
            cf = (CFTypeRef)v12;
            key = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 1, UID);
            Mutable = CFDictionaryCreateMutable(v10, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v14 = *(const __CFSet **)(a1 + 304);
            if (v14 && CFSetContainsValue(v14, (const void *)UID))
              CFDictionarySetValue(Mutable, CFSTR("com.apple.MobileSync.updated"), value);
            CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.calendars.Calendar"));
            theDict = Mutable;
            CFDictionarySetValue(Mutable, CFSTR("title"), cf);
            valuePtr = 0;
            v15 = CFStringCreateWithFormat(0, 0, CFSTR("%@-CalDAVInfo"), cf);
            v16 = (const __CFString *)CalDatabaseCopyProperty();
            if (v16)
            {
              v17 = v16;
              if (CFStringGetIntValue(v16))
                valuePtr = 1;
              CFDictionarySetValue(theDict, CFSTR("com.apple.MobileSync.calDAVInfo"), value);
              if (DLShouldLog())
                _DLLog();
              CFRelease(v17);
            }
            else
            {
              valuePtr = CalCalendarIsReadOnly();
              if (valuePtr && DLShouldLog())
                _DLLog();
            }
            if (v15)
              CFRelease(v15);
            v19 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            if (v19)
            {
              v20 = v19;
              CFDictionarySetValue(theDict, CFSTR("read only"), v19);
              CFRelease(v20);
            }
            else if (DLShouldLog())
            {
              _DLLog();
            }
            if (*(_BYTE *)(a1 + 353) == 1)
            {
              v37 = -1;
              v38 = -1;
              v35 = 255;
              v36 = -1;
              ColorComponents = CalCalendarGetColorComponents();
              if (DLShouldLog())
                _DLLog();
              v22 = CFArrayCreateMutable(v10, 0, MEMORY[0x24BDBD690]);
              if ((ColorComponents & 1) == 0)
              {
                if (DLShouldLog())
                  _DLLog();
                v36 = -1;
                v37 = -1;
                v38 = -1;
              }
              v29 = v10;
              v30 = a2;
              v23 = CFNumberCreate(0, kCFNumberIntType, &v38);
              v24 = CFNumberCreate(0, kCFNumberIntType, &v37);
              v25 = CFNumberCreate(0, kCFNumberIntType, &v36);
              v26 = CFNumberCreate(0, kCFNumberIntType, &v35);
              CFArrayAppendValue(v22, v23);
              CFArrayAppendValue(v22, v24);
              CFArrayAppendValue(v22, v25);
              CFArrayAppendValue(v22, v26);
              if (v23)
                CFRelease(v23);
              if (v24)
                CFRelease(v24);
              if (v25)
                CFRelease(v25);
              v10 = v29;
              if (v26)
                CFRelease(v26);
              CFDictionarySetValue(theDict, CFSTR("colorComponents"), v22);
              a2 = v30;
              if (v22)
                CFRelease(v22);
            }
            v27 = (const void *)CalCalendarCopyType();
            if (v27)
            {
              v28 = v27;
              CFDictionarySetValue(theDict, CFSTR("com.apple.ical.type"), v27);
              CFRelease(v28);
            }
            v18 = key;
            CFDictionarySetValue(*a2, key, theDict);
            if (DLShouldLog())
              _DLLog();
            CFRelease(cf);
            CFRelease(theDict);
LABEL_65:
            CFRelease(v18);
            goto LABEL_26;
          }
          if (DLShouldLog())
LABEL_25:
            _DLLog();
        }
        else if (DLShouldLog())
        {
          goto LABEL_25;
        }
LABEL_26:
        ++v9;
      }
      while (v8 != v9);
    }
  }
}

void _AccumulateEvents(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  const __CFAllocator **v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  double v10;
  const void *ValueAtIndex;
  uint64_t RowID;
  const void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t UID;
  __CFDictionary *Mutable;
  CFArrayRef v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  CFNumberRef v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  double v29;
  CFAbsoluteTime v30;
  CFAbsoluteTime v31;
  CFDateRef v32;
  CFDateRef v33;
  CFAbsoluteTime v34;
  CFDateRef v35;
  uint64_t v36;
  uint64_t v37;
  CFArrayRef v38;
  const void *v39;
  const void *v40;
  const __CFTimeZone *v41;
  double SecondsFromGMT;
  CFNumberRef v43;
  CFDateRef v44;
  CFDateRef v45;
  CFStringRef v46;
  const __CFTimeZone *cf;
  CFDateRef v48;
  CFNumberRef v49;
  const __CFAllocator *allocator;
  uint64_t v51;
  CFMutableDictionaryRef *v52;
  CFStringRef key;
  void *values;

  if (CFArrayGetCount(theArray))
  {
    v6 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if (!*a2)
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v8 = Count;
      v9 = 0;
      allocator = *v6;
      v51 = a1;
      v10 = *MEMORY[0x24BE14068];
      v52 = a2;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v9);
        RowID = CalCalendarItemGetRowID();
        v13 = (const void *)MEMORY[0x22E2FA3B8](ValueAtIndex);
        v14 = CalCalendarItemCopyCalendar();
        v15 = (const void *)v14;
        if ((_DWORD)RowID == -1)
        {
          if (DLShouldLog())
            _DLLog();
          if (v13)
            CFRelease(v13);
          if (!v15)
            goto LABEL_31;
          goto LABEL_30;
        }
        if (!v14)
        {
          if (DLShouldLog())
            _DLLog();
          v15 = v13;
          if (!v13)
            goto LABEL_31;
          goto LABEL_30;
        }
        if (CalCalendarIsSubscribed())
        {
          if (!DLShouldLog())
            goto LABEL_28;
        }
        else if ((CalCalendarCanContainEntityType() & 1) != 0)
        {
          if (v15 == *(const void **)(a1 + 192))
          {
            UID = 0xFFFFFFFFLL;
LABEL_34:
            key = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 2, RowID, v45);
            Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.calendars.Event"));
            if (v15 == *(const void **)(a1 + 192))
            {
              if (DLShouldLog())
                _DLLog();
            }
            else
            {
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 1, UID);
              v18 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
              CFDictionarySetValue(Mutable, CFSTR("calendar"), v18);
              CFRelease(v18);
              CFRelease(values);
            }
            if (v13)
              CFDictionarySetValue(Mutable, CFSTR("summary"), v13);
            v19 = (const void *)CalEventCopyLocation_Deprecated();
            if (v19)
            {
              v20 = v19;
              CFDictionarySetValue(Mutable, CFSTR("location"), v19);
              CFRelease(v20);
            }
            v21 = (const void *)MEMORY[0x22E2FA370](ValueAtIndex);
            if (v21)
            {
              v22 = v21;
              CFDictionarySetValue(Mutable, CFSTR("description"), v21);
              CFRelease(v22);
            }
            if (CalEventIsAllDay())
            {
              LODWORD(values) = 1;
              v23 = CFNumberCreate(0, kCFNumberIntType, &values);
              CFDictionarySetValue(Mutable, CFSTR("all day"), v23);
              if (v23)
                CFRelease(v23);
            }
            v24 = (void *)MEMORY[0x22E2FA3C4](ValueAtIndex);
            if (v24)
            {
              v25 = v24;
              CFDictionarySetValue(Mutable, CFSTR("url"), (const void *)objc_msgSend(v24, "absoluteString"));
              CFRelease(v25);
            }
            *(double *)&v26 = COERCE_DOUBLE(CalEventCopyStartDate());
            v28 = v27;
            CalEventGetEndDate();
            if (v28)
            {
              v30 = v29;
              v31 = *(double *)&v26;
              if (CFStringCompare(v28, CFSTR("_float"), 0))
              {
                CFDictionarySetValue(Mutable, CFSTR("start date.timezone"), v28);
                goto LABEL_54;
              }
              if ((CalEventIsAllDay() & 1) != 0)
              {
LABEL_54:
                v32 = CFDateCreate(0, *(CFAbsoluteTime *)&v26);
                v33 = CFDateCreate(0, v30);
                if (v32)
                  goto LABEL_55;
              }
              else
              {
                v41 = CFTimeZoneCopyDefault();
                v46 = CFTimeZoneCopyAbbreviation(v41, v31);
                CFDictionarySetValue(Mutable, CFSTR("start date.timezone"), v46);
                cf = v41;
                SecondsFromGMT = CFTimeZoneGetSecondsFromGMT(v41, v31);
                values = (void *)(uint64_t)SecondsFromGMT;
                v43 = CFNumberCreate(0, kCFNumberSInt64Type, &values);
                v44 = CFDateCreate(0, SecondsFromGMT + v31);
                v49 = v43;
                CFDictionarySetValue(Mutable, CFSTR("floatingOffset"), v43);
                v48 = v44;
                CFDictionarySetValue(Mutable, CFSTR("floatingGMTDate"), v44);
                v32 = CFDateCreate(0, v31 - SecondsFromGMT);
                v33 = CFDateCreate(0, v30 - SecondsFromGMT);
                if (DLShouldLog())
                {
                  v45 = v48;
                  _DLLog();
                }
                CFRelease(cf);
                CFRelease(v46);
                CFRelease(v48);
                CFRelease(v49);
                if (v32)
                {
LABEL_55:
                  CFDictionarySetValue(Mutable, CFSTR("start date"), v32);
                  CFRelease(v32);
                }
              }
              CalDateTimeRelease();
              if (v33)
              {
                CFDictionarySetValue(Mutable, CFSTR("end date"), v33);
                CFRelease(v33);
              }
            }
            else
            {
              CalDateTimeRelease();
            }
            CalEventGetOriginalStartDate();
            if (v34 != v10)
            {
              v35 = CFDateCreate(0, v34);
              CFDictionarySetValue(Mutable, CFSTR("original date"), v35);
              CFRelease(v35);
            }
            v36 = CalEventCopyOriginalEvent();
            if (v36)
            {
              v37 = CalCalendarItemGetRowID();
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 2, v37);
              v38 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
              CFDictionarySetValue(Mutable, CFSTR("main event"), v38);
              CFRelease(v38);
              CFRelease(values);
            }
            v39 = (const void *)MEMORY[0x22E2FA388](ValueAtIndex);
            if (v39)
            {
              v40 = v39;
              CFDictionarySetValue(Mutable, CFSTR("exception dates"), v39);
              CFRelease(v40);
            }
            CFDictionarySetValue(*v52, key, Mutable);
            if (DLShouldLog())
              _DLLog();
            a1 = v51;
            if (v13)
              CFRelease(v13);
            if (Mutable)
              CFRelease(Mutable);
            if (key)
              CFRelease(key);
            CFRelease(v15);
            v15 = (const void *)v36;
            if (!v36)
              goto LABEL_31;
            goto LABEL_30;
          }
          UID = CalCalendarGetUID();
          if ((_DWORD)UID != -1)
            goto LABEL_34;
          if (!DLShouldLog())
            goto LABEL_28;
        }
        else if (!DLShouldLog())
        {
          goto LABEL_28;
        }
        _DLLog();
LABEL_28:
        if (v13)
          CFRelease(v13);
LABEL_30:
        CFRelease(v15);
LABEL_31:
        ++v9;
      }
      while (v8 != v9);
    }
  }
}

void _AccumulateOrganizers(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  const __CFAllocator **v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const char *v8;
  const void *ValueAtIndex;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  uint64_t RowID;
  uint64_t v15;
  const char *v16;
  CFStringRef v17;
  CFArrayRef v18;
  __CFDictionary *Mutable;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const __CFAllocator *allocator;
  void *values;

  if (*(_BYTE *)(a1 + 352) && CFArrayGetCount(theArray))
  {
    v4 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if (!*a2)
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v6 = Count;
      v7 = 0;
      allocator = *v4;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Sync/DataSources/CalendarsDataSource.m";
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
        v10 = CalCalendarItemCopyCalendar();
        if (v10)
        {
          v11 = (const void *)v10;
          if (CalCalendarIsSubscribed())
          {
            if (DLShouldLog())
LABEL_31:
              _DLLog();
LABEL_32:
            v24 = v11;
LABEL_33:
            CFRelease(v24);
            goto LABEL_34;
          }
          if ((CalCalendarCanContainEntityType() & 1) == 0)
          {
            if (DLShouldLog())
              goto LABEL_31;
            goto LABEL_32;
          }
          CFRelease(v11);
        }
        v12 = MEMORY[0x22E2FA394](ValueAtIndex);
        if (v12)
        {
          v13 = (const void *)v12;
          RowID = CalCalendarItemGetRowID();
          if ((_DWORD)RowID == -1)
          {
            if (DLShouldLog())
              _DLLog();
            goto LABEL_34;
          }
          v15 = RowID;
          v16 = v8;
          values = 0;
          values = (void *)CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 2, RowID);
          v17 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 8, v15);
          v18 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
          Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.calendars.Organizer"));
          CFDictionarySetValue(Mutable, CFSTR("owner"), v18);
          v20 = (const void *)MEMORY[0x22E2FA49C](v13);
          if (v20)
          {
            v21 = v20;
            CFDictionarySetValue(Mutable, CFSTR("common name"), v20);
            CFRelease(v21);
          }
          v22 = (const void *)MEMORY[0x22E2FA4A8](v13);
          if (v22)
          {
            v23 = v22;
            CFDictionarySetValue(Mutable, CFSTR("email"), v22);
            CFRelease(v23);
          }
          CFDictionarySetValue(*a2, v17, Mutable);
          v8 = v16;
          if (DLShouldLog())
            _DLLog();
          if (Mutable)
            CFRelease(Mutable);
          if (v18)
            CFRelease(v18);
          if (v17)
            CFRelease(v17);
          if (values)
          {
            CFRelease(values);
            values = 0;
          }
          v24 = v13;
          goto LABEL_33;
        }
LABEL_34:
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

void _AccumulateAlarms(CFMutableDictionaryRef *a1, CFArrayRef theArray)
{
  const __CFAllocator **v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  uint64_t UID;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  int v11;
  uint64_t RowID;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  CFArrayRef v17;
  CFStringRef v18;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  const __CFString *v21;
  const __CFString *v22;
  CFAbsoluteTime v23;
  CFDateRef v24;
  CFNumberRef v25;
  const void *v26;
  const __CFAllocator *allocator;
  int valuePtr;
  void *values;

  if (CFArrayGetCount(theArray))
  {
    v3 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if (!*a1)
      *a1 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v5 = Count;
      v6 = 0;
      allocator = *v3;
      do
      {
        CFArrayGetValueAtIndex(theArray, v6);
        UID = CalAlarmGetUID();
        if ((_DWORD)UID == -1)
        {
          if (DLShouldLog())
            goto LABEL_16;
        }
        else
        {
          v8 = UID;
          v9 = CalAlarmCopyOwningEntity();
          if (v9)
          {
            v10 = (const void *)v9;
            v11 = _entityTypeForRecord();
            RowID = CalCalendarItemGetRowID();
            if ((_DWORD)RowID == -1)
            {
              if (DLShouldLog())
                _DLLog();
            }
            else
            {
              v13 = RowID;
              v14 = CalCalendarItemCopyCalendar();
              if (v14)
              {
                v15 = (const void *)v14;
                if (CalCalendarIsSubscribed())
                {
                  if (DLShouldLog())
LABEL_35:
                    _DLLog();
LABEL_36:
                  CFRelease(v10);
                  v26 = v15;
LABEL_37:
                  CFRelease(v26);
                  goto LABEL_38;
                }
                if ((CalCalendarCanContainEntityType() & 1) == 0)
                {
                  if (DLShouldLog())
                    goto LABEL_35;
                  goto LABEL_36;
                }
                CFRelease(v15);
              }
              values = 0;
              v16 = 2;
              if (v11 != 2)
                v16 = 3;
              values = (void *)CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), v16, v13);
              v17 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
              v18 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 4, v8);
              Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              if (CalAlarmGetType() == 1)
              {
                v20 = Mutable;
                v21 = CFSTR("com.apple.syncservices.RecordEntityName");
                v22 = CFSTR("com.apple.calendars.AudioAlarm");
              }
              else
              {
                CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.calendars.DisplayAlarm"));
                v20 = Mutable;
                v21 = CFSTR("description");
                v22 = CFSTR("Event reminder");
              }
              CFDictionarySetValue(v20, v21, v22);
              CFDictionarySetValue(Mutable, CFSTR("owner"), v17);
              CalAlarmGetTriggerDate();
              if (v23 != 1.17549435e-38)
              {
                v24 = CFDateCreate(0, v23);
                CFDictionarySetValue(Mutable, CFSTR("triggerdate"), v24);
                CFRelease(v24);
              }
              valuePtr = 0;
              valuePtr = CalAlarmGetTriggerInterval();
              if (valuePtr != 0x7FFFFFFF)
              {
                v25 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(Mutable, CFSTR("triggerduration"), v25);
                CFRelease(v25);
              }
              CFDictionarySetValue(*a1, v18, Mutable);
              if (DLShouldLog())
                _DLLog();
              CFRelease(Mutable);
              CFRelease(values);
              CFRelease(v17);
              CFRelease(v18);
            }
            v26 = v10;
            goto LABEL_37;
          }
          if (DLShouldLog())
LABEL_16:
            _DLLog();
        }
LABEL_38:
        ++v6;
      }
      while (v5 != v6);
    }
  }
}

void _AccumulateRecurrences(CFMutableDictionaryRef *a1, CFArrayRef theArray)
{
  const __CFArray *v2;
  const __CFAllocator **v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  double v8;
  const void *ValueAtIndex;
  uint64_t UID;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t RowID;
  CFArrayRef v17;
  __CFDictionary *Mutable;
  int WeekStartDirectly;
  const __CFString *DayOfWeekStringForDayOfWeek;
  const void *v21;
  int Frequency;
  const __CFString *v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFAbsoluteTime v26;
  CFDateRef v27;
  unsigned int v28;
  unsigned int v29;
  __CFArray *v30;
  uint64_t v31;
  CFNumberRef v32;
  const __CFArray *v33;
  const __CFArray *v34;
  uint64_t v35;
  uint64_t v36;
  __CFArray *v37;
  CFIndex i;
  CFNumberRef v39;
  const __CFArray *v40;
  const __CFArray *v41;
  uint64_t v42;
  uint64_t v43;
  __CFArray *v44;
  CFIndex j;
  CFNumberRef v46;
  const __CFArray *v47;
  const __CFArray *v48;
  uint64_t v49;
  uint64_t v50;
  __CFArray *v51;
  CFIndex k;
  CFNumberRef v53;
  const __CFArray *v54;
  const __CFArray *v55;
  uint64_t v56;
  uint64_t v57;
  __CFArray *v58;
  CFIndex m;
  CFNumberRef v60;
  const __CFArray *v61;
  const __CFArray *v62;
  uint64_t v63;
  CFIndex v64;
  const CFArrayCallBacks *v65;
  __CFArray *v66;
  __CFArray *v67;
  CFIndex n;
  int *v69;
  CFNumberRef v70;
  const __CFString *v71;
  const __CFAllocator *allocator;
  CFMutableDictionaryRef *v73;
  const __CFArray *v74;
  CFIndex v75;
  CFStringRef key;
  CFArrayRef cf;
  void *values;
  uint64_t v79;
  int v80;
  int valuePtr;

  v2 = theArray;
  if (CFArrayGetCount(theArray))
  {
    v4 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if (!*a1)
      *a1 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v6 = Count;
      v7 = 0;
      allocator = *v4;
      v73 = a1;
      v8 = *MEMORY[0x24BE14068];
      v74 = v2;
      v75 = Count;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v7);
        UID = CalRecurrenceGetUID();
        if ((_DWORD)UID == -1)
        {
          if (DLShouldLog())
            goto LABEL_15;
        }
        else
        {
          v11 = UID;
          v12 = MEMORY[0x22E2FA514](ValueAtIndex);
          if (v12)
          {
            v13 = (const void *)v12;
            v14 = CalCalendarItemCopyCalendar();
            if (v14)
            {
              v15 = (const void *)v14;
              if (CalCalendarIsSubscribed())
              {
                if (DLShouldLog())
LABEL_26:
                  _DLLog();
LABEL_27:
                CFRelease(v13);
                v21 = v15;
LABEL_28:
                CFRelease(v21);
                goto LABEL_103;
              }
              if ((CalCalendarCanContainEntityType() & 1) == 0)
              {
                if (DLShouldLog())
                  goto LABEL_26;
                goto LABEL_27;
              }
              CFRelease(v15);
            }
            RowID = CalCalendarItemGetRowID();
            if ((_DWORD)RowID != -1)
            {
              values = 0;
              values = (void *)CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 2, RowID);
              v17 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
              key = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 5, v11);
              Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.calendars.Recurrence"));
              cf = v17;
              CFDictionarySetValue(Mutable, CFSTR("owner"), v17);
              WeekStartDirectly = CalRecurrenceGetWeekStartDirectly();
              if (WeekStartDirectly != 7)
              {
                DayOfWeekStringForDayOfWeek = _GetDayOfWeekStringForDayOfWeek(WeekStartDirectly);
                if (DayOfWeekStringForDayOfWeek)
                {
                  CFDictionarySetValue(Mutable, CFSTR("weekstartday"), DayOfWeekStringForDayOfWeek);
                }
                else if (DLShouldLog())
                {
                  _DLLog();
                }
              }
              Frequency = CalRecurrenceGetFrequency();
              if (Frequency)
              {
                v23 = (const __CFString *)sFrequencyStrings_0;
                if (!sFrequencyStrings_0)
                {
                  v23 = CFSTR("daily");
                  sFrequencyStrings_0 = (uint64_t)CFSTR("daily");
                  sFrequencyStrings_1 = (uint64_t)CFSTR("weekly");
                  sFrequencyStrings_2 = (uint64_t)CFSTR("monthly");
                  sFrequencyStrings_3 = (uint64_t)CFSTR("yearly");
                }
                switch(Frequency)
                {
                  case 1:
                    goto LABEL_38;
                  case 2:
                    v23 = (const __CFString *)sFrequencyStrings_1;
                    if (!sFrequencyStrings_1)
                      goto LABEL_41;
                    goto LABEL_39;
                  case 3:
                    v23 = (const __CFString *)sFrequencyStrings_2;
LABEL_38:
                    if (v23)
                      goto LABEL_39;
                    goto LABEL_41;
                  case 4:
                    v23 = (const __CFString *)sFrequencyStrings_3;
                    if (!sFrequencyStrings_3)
                      goto LABEL_41;
LABEL_39:
                    CFDictionarySetValue(Mutable, CFSTR("frequency"), v23);
                    break;
                  default:
LABEL_41:
                    if (DLShouldLog())
                      _DLLog();
                    break;
                }
              }
              valuePtr = CalRecurrenceGetInterval();
              if (valuePtr)
              {
                v24 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(Mutable, CFSTR("interval"), v24);
                CFRelease(v24);
              }
              v80 = 0;
              v80 = CalRecurrenceGetCount();
              if (v80 >= 1)
              {
                v25 = CFNumberCreate(0, kCFNumberIntType, &v80);
                CFDictionarySetValue(Mutable, CFSTR("count"), v25);
                CFRelease(v25);
              }
              CalRecurrenceGetEndDate();
              if (v26 != v8)
              {
                v27 = CFDateCreate(0, v26);
                CFDictionarySetValue(Mutable, CFSTR("until"), v27);
                CFRelease(v27);
              }
              v28 = CalRecurrenceGetByMonthMonths();
              if (v28)
              {
                v29 = v28;
                v30 = CFArrayCreateMutable(0, 12, MEMORY[0x24BDBD690]);
                v31 = 0;
                do
                {
                  if (((v29 >> v31) & 1) != 0)
                  {
                    v79 = ++v31;
                    v32 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v30, v32);
                    CFRelease(v32);
                  }
                  else
                  {
                    ++v31;
                  }
                }
                while (v31 != 12);
                if (CFArrayGetCount(v30) >= 1)
                  CFDictionarySetValue(Mutable, CFSTR("bymonth"), v30);
                CFRelease(v30);
              }
              v33 = (const __CFArray *)CalRecurrenceCopyByWeekWeeks();
              if (v33)
              {
                v34 = v33;
                v35 = CFArrayGetCount(v33);
                if (v35 >= 1)
                {
                  v36 = v35;
                  v37 = CFArrayCreateMutable(0, v35, MEMORY[0x24BDBD690]);
                  for (i = 0; i != v36; ++i)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v34, i);
                    v39 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v37, v39);
                    CFRelease(v39);
                  }
                  if (CFArrayGetCount(v37) >= 1)
                    CFDictionarySetValue(Mutable, CFSTR("byweeknumber"), v37);
                  CFRelease(v37);
                }
                CFRelease(v34);
              }
              v40 = (const __CFArray *)CalRecurrenceCopyByYearDayDays();
              if (v40)
              {
                v41 = v40;
                v42 = CFArrayGetCount(v40);
                if (v42 >= 1)
                {
                  v43 = v42;
                  v44 = CFArrayCreateMutable(0, v42, MEMORY[0x24BDBD690]);
                  for (j = 0; j != v43; ++j)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v41, j);
                    v46 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v44, v46);
                    CFRelease(v46);
                  }
                  if (CFArrayGetCount(v44) >= 1)
                    CFDictionarySetValue(Mutable, CFSTR("byyearday"), v44);
                  CFRelease(v44);
                }
                CFRelease(v41);
              }
              v47 = (const __CFArray *)CalRecurrenceCopyByMonthDayDays();
              if (v47)
              {
                v48 = v47;
                v49 = CFArrayGetCount(v47);
                if (v49 >= 1)
                {
                  v50 = v49;
                  v51 = CFArrayCreateMutable(0, v49, MEMORY[0x24BDBD690]);
                  for (k = 0; k != v50; ++k)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v48, k);
                    v53 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v51, v53);
                    CFRelease(v53);
                  }
                  if (CFArrayGetCount(v51) >= 1)
                    CFDictionarySetValue(Mutable, CFSTR("bymonthday"), v51);
                  CFRelease(v51);
                }
                CFRelease(v48);
              }
              v54 = (const __CFArray *)CalRecurrenceCopyBySetPos();
              if (v54)
              {
                v55 = v54;
                v56 = CFArrayGetCount(v54);
                if (v56 >= 1)
                {
                  v57 = v56;
                  v58 = CFArrayCreateMutable(0, v56, MEMORY[0x24BDBD690]);
                  for (m = 0; m != v57; ++m)
                  {
                    LODWORD(v79) = 0;
                    LODWORD(v79) = CFArrayGetValueAtIndex(v55, m);
                    v60 = CFNumberCreate(0, kCFNumberIntType, &v79);
                    CFArrayAppendValue(v58, v60);
                    CFRelease(v60);
                  }
                  if (CFArrayGetCount(v58) >= 1)
                    CFDictionarySetValue(Mutable, CFSTR("bysetpos"), v58);
                  CFRelease(v58);
                }
                CFRelease(v55);
              }
              v61 = (const __CFArray *)CalRecurrenceCopyByDayDays();
              v6 = v75;
              if (v61)
              {
                v62 = v61;
                v63 = CFArrayGetCount(v61);
                if (v63 >= 1)
                {
                  v64 = v63;
                  v65 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
                  v66 = CFArrayCreateMutable(0, v63, MEMORY[0x24BDBD690]);
                  v67 = CFArrayCreateMutable(0, v64, v65);
                  for (n = 0; n != v64; ++n)
                  {
                    v69 = (int *)CFArrayGetValueAtIndex(v62, n);
                    v70 = CFNumberCreate(0, kCFNumberIntType, v69);
                    v71 = _GetDayOfWeekStringForDayOfWeek(v69[1]);
                    if (v71)
                    {
                      CFArrayAppendValue(v66, v71);
                      CFArrayAppendValue(v67, v70);
                    }
                    CFRelease(v70);
                  }
                  if (CFArrayGetCount(v66) >= 1)
                  {
                    CFDictionarySetValue(Mutable, CFSTR("bydaydays"), v66);
                    CFDictionarySetValue(Mutable, CFSTR("bydayfreq"), v67);
                  }
                  CFRelease(v66);
                  CFRelease(v67);
                  v6 = v75;
                }
                CFRelease(v62);
              }
              CFDictionarySetValue(*v73, key, Mutable);
              if (DLShouldLog())
                _DLLog();
              CFRelease(Mutable);
              CFRelease(values);
              CFRelease(cf);
              CFRelease(key);
              CFRelease(v13);
              v2 = v74;
              goto LABEL_103;
            }
            if (DLShouldLog())
              _DLLog();
            v21 = v13;
            goto LABEL_28;
          }
          if (DLShouldLog())
LABEL_15:
            _DLLog();
        }
LABEL_103:
        ++v7;
      }
      while (v7 != v6);
    }
  }
}

void _AccumulateAttendees(uint64_t a1, CFMutableDictionaryRef *a2, CFArrayRef theArray)
{
  const __CFAllocator **v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const char *v9;
  const void *ValueAtIndex;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t RowID;
  const char *v19;
  CFArrayRef v20;
  CFStringRef v21;
  __CFDictionary *Mutable;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  unsigned int v27;
  const __CFString *v28;
  unsigned int Role;
  const __CFString *v30;
  unsigned int Status;
  const __CFString *v32;
  const void *v33;
  CFMutableDictionaryRef *v34;
  const __CFAllocator *allocator;
  void *values;

  if (*(_BYTE *)(a1 + 352) && CFArrayGetCount(theArray))
  {
    v5 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if (!*a2)
      *a2 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      v34 = a2;
      allocator = *v5;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Sync/DataSources/CalendarsDataSource.m";
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v12 = MEMORY[0x22E2F9F80](ValueAtIndex, v11);
        if ((_DWORD)v12 == -1)
        {
          if (DLShouldLog())
            goto LABEL_17;
        }
        else
        {
          v13 = v12;
          v14 = MEMORY[0x22E2F9F50](ValueAtIndex);
          if (v14)
          {
            v15 = (const void *)v14;
            v16 = CalCalendarItemCopyCalendar();
            if (v16)
            {
              v17 = (const void *)v16;
              if (CalCalendarIsSubscribed())
              {
                if (DLShouldLog())
                  _DLLog();
                CFRelease(v17);
                goto LABEL_36;
              }
              if ((CalCalendarCanContainEntityType() & 1) != 0)
              {
                CFRelease(v17);
                goto LABEL_20;
              }
              if (DLShouldLog())
                _DLLog();
              CFRelease(v15);
              v33 = v17;
            }
            else
            {
LABEL_20:
              RowID = CalCalendarItemGetRowID();
              if ((_DWORD)RowID != -1)
              {
                v19 = v9;
                values = 0;
                values = (void *)CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 2, RowID);
                v20 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
                v21 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 7, v13);
                Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.calendars.Attendee"));
                CFDictionarySetValue(Mutable, CFSTR("owner"), v20);
                v23 = (const void *)MEMORY[0x22E2F9F38](ValueAtIndex);
                if (v23)
                {
                  v24 = v23;
                  CFDictionarySetValue(Mutable, CFSTR("common name"), v23);
                  CFRelease(v24);
                }
                v25 = (const void *)MEMORY[0x22E2F9F44](ValueAtIndex);
                if (v25)
                {
                  v26 = v25;
                  CFDictionarySetValue(Mutable, CFSTR("email"), v25);
                  CFRelease(v26);
                }
                v27 = CalAttendeeGetType() - 1;
                v28 = CFSTR("unknown");
                if (v27 <= 3)
                  v28 = off_24F645CB8[v27];
                CFDictionarySetValue(Mutable, CFSTR("user type"), v28);
                Role = CalAttendeeGetRole();
                v30 = CFSTR("requiredparticipant");
                v9 = v19;
                if (Role <= 5)
                  v30 = off_24F645CD8[Role];
                CFDictionarySetValue(Mutable, CFSTR("role"), v30);
                Status = CalAttendeeGetStatus();
                v32 = CFSTR("tentative");
                if (Status <= 6)
                  v32 = off_24F645D08[Status];
                CFDictionarySetValue(Mutable, CFSTR("status"), v32);
                CFDictionarySetValue(*v34, v21, Mutable);
                if (DLShouldLog())
                  _DLLog();
                CFRelease(Mutable);
                CFRelease(values);
                CFRelease(v20);
                CFRelease(v21);
                CFRelease(v15);
                goto LABEL_41;
              }
              if (DLShouldLog())
                _DLLog();
LABEL_36:
              v33 = v15;
            }
            CFRelease(v33);
            goto LABEL_41;
          }
          if (DLShouldLog())
LABEL_17:
            _DLLog();
        }
LABEL_41:
        ++v8;
      }
      while (v7 != v8);
    }
  }
}

void _addOrganizersToDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

uint64_t _entityTypeForRecord()
{
  uint64_t result;

  LODWORD(result) = CalEntityGetType();
  if ((result - 1) >= 8)
    return 0;
  else
    return result;
}

const __CFString *_GetDayOfWeekStringForDayOfWeek(int a1)
{
  const __CFString *result;

  result = (const __CFString *)sDayOfWeekStrings_0;
  if (!sDayOfWeekStrings_0)
  {
    result = CFSTR("sunday");
    sDayOfWeekStrings_0 = (uint64_t)CFSTR("sunday");
    sDayOfWeekStrings_1 = (uint64_t)CFSTR("monday");
    sDayOfWeekStrings_2 = (uint64_t)CFSTR("tuesday");
    sDayOfWeekStrings_3 = (uint64_t)CFSTR("wednesday");
    sDayOfWeekStrings_4 = (uint64_t)CFSTR("thursday");
    sDayOfWeekStrings_5 = (uint64_t)CFSTR("friday");
    sDayOfWeekStrings_6 = (uint64_t)CFSTR("saturday");
  }
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = (const __CFString *)sDayOfWeekStrings_1;
      break;
    case 2:
      result = (const __CFString *)sDayOfWeekStrings_2;
      break;
    case 3:
      result = (const __CFString *)sDayOfWeekStrings_3;
      break;
    case 4:
      result = (const __CFString *)sDayOfWeekStrings_4;
      break;
    case 5:
      result = (const __CFString *)sDayOfWeekStrings_5;
      break;
    case 6:
      result = (const __CFString *)sDayOfWeekStrings_6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t _saveDeviceSyncAnchorAndClearChangeHistory_0(uint64_t a1)
{
  uint64_t result;

  if ((*(_DWORD *)(a1 + 312) & 0x80000000) == 0)
    CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
  if (!*(_QWORD *)(a1 + 144))
  {
    CFRetain(CFSTR("---"));
    *(_QWORD *)(a1 + 144) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog())
    _DLLog();
  _setDeviceSyncAnchorForStore_0(a1);
  result = CalDatabaseSave();
  if ((result & 1) == 0)
  {
    result = DLShouldLog();
    if ((_DWORD)result)
      result = _DLLog();
  }
  *(_BYTE *)(a1 + 355) = 1;
  return result;
}

void _AccumulateChangedRecords(uint64_t a1, uint64_t a2, CFMutableDictionaryRef *a3, CFArrayRef theArray, const __CFArray *a5)
{
  CFIndex Count;
  uint64_t v11;
  CFIndex v12;
  __CFSet *Mutable;
  CFIndex v14;
  const void *ValueAtIndex;
  unsigned int v16;
  CFStringRef v17;
  const void *v18;
  __CFDictionary *v19;
  uint64_t v20;
  const __CFAllocator *allocator;
  CFMutableDictionaryRef *v22;
  __CFArray *theArraya;

  if (!theArray)
    return;
  Count = CFArrayGetCount(theArray);
  if (a5)
  {
    v11 = Count;
    v12 = CFArrayGetCount(theArray);
    if (v12 == CFArrayGetCount(a5))
    {
      if (v11 < 1)
        return;
      v22 = a3;
      theArraya = 0;
      Mutable = 0;
      v14 = 0;
      allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v14);
        v16 = CFArrayGetValueAtIndex(a5, v14);
        if (v16 <= 1)
        {
          switch((int)a2)
          {
            case 1:
              v20 = CalDatabaseCopyCalendarWithUID();
              goto LABEL_24;
            case 2:
            case 3:
            case 8:
              v20 = CalDatabaseCopyCalendarItemWithRowID();
              goto LABEL_24;
            case 4:
              v20 = CalDatabaseCopyAlarmWithUID();
              goto LABEL_24;
            case 5:
              v20 = CalDatabaseCopyRecurrenceWithUID();
              goto LABEL_24;
            case 7:
              v20 = MEMORY[0x22E2FA148](*(_QWORD *)(a1 + 184), ValueAtIndex);
LABEL_24:
              v18 = (const void *)v20;
              if (!v20)
                goto LABEL_30;
              if (!theArraya)
              {
                theArraya = CFArrayCreateMutable(allocator, 0, 0);
                Mutable = CFSetCreateMutable(0, 0, 0);
              }
              if (!CFSetContainsValue(Mutable, (const void *)(int)ValueAtIndex))
              {
                CFSetAddValue(Mutable, (const void *)(int)ValueAtIndex);
                CFArrayAppendValue(theArraya, v18);
              }
              goto LABEL_29;
            default:
              if (DLShouldLog())
                _DLLog();
LABEL_30:
              if (DLShouldLog())
                goto LABEL_35;
              goto LABEL_36;
          }
        }
        if (v16 == 2)
        {
          if (a2 <= 8 && ((1 << a2) & 0x1BE) != 0)
          {
            v17 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), a2, ValueAtIndex);
            if (v17)
            {
              v18 = v17;
              v19 = *v22;
              if (!*v22)
              {
                v19 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                *v22 = v19;
              }
              CFDictionarySetValue(v19, v18, v18);
LABEL_29:
              CFRelease(v18);
              goto LABEL_36;
            }
          }
          else if (DLShouldLog())
          {
            _DLLog();
          }
          if (DLShouldLog())
LABEL_35:
            _DLLog();
        }
        else if (DLShouldLog())
        {
          goto LABEL_35;
        }
LABEL_36:
        if (v11 == ++v14)
        {
          if (Mutable)
            CFRelease(Mutable);
          if (theArraya)
          {
            switch((int)a2)
            {
              case 1:
                _AccumulateCalendars(a1, v22, theArraya);
                break;
              case 2:
                _AccumulateEvents(a1, v22, theArraya);
                break;
              case 4:
                _AccumulateAlarms(v22, theArraya);
                break;
              case 5:
                _AccumulateRecurrences(v22, theArraya);
                break;
              case 7:
                _AccumulateAttendees(a1, v22, theArraya);
                break;
              case 8:
                _AccumulateOrganizers(a1, v22, theArraya);
                break;
              default:
                if (DLShouldLog())
                  _DLLog();
                break;
            }
            CFRelease(theArraya);
          }
          return;
        }
      }
    }
  }
  if (DLShouldLog())
    _DLLog();
}

objc_class *___calendarSyncAccountLoader_block_invoke()
{
  objc_class *result;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/Message.framework"))), "load") & 1) == 0)___calendarSyncAccountLoader_block_invoke_cold_1();
  result = NSClassFromString(CFSTR("MailAccount"));
  _calendarSyncAccountLoader_sSyncAccountLoader = (uint64_t)result;
  return result;
}

void _addCurrentRemappingsToAllRemappings(void *key, void *value, uint64_t a3)
{
  __CFDictionary *v5;

  v5 = *(__CFDictionary **)(a3 + 168);
  if (!v5)
  {
    CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v5 = (__CFDictionary *)DLMemoryPoolAddObject();
    *(_QWORD *)(a3 + 168) = v5;
  }
  CFDictionarySetValue(v5, key, value);
}

void _ChangesApplierFunction_0(const __CFString *a1, const __CFDictionary *a2, uint64_t a3)
{
  CFTypeID TypeID;
  uint64_t v7;
  uint64_t Organizer;
  const void *v9;
  CFStringRef v10;
  const void *v11;
  const __CFString *Value;
  const __CFString *v13;
  char v14;
  char v15;
  unsigned int v16;
  const void *v17;
  const void *CalendarForEntityType;
  int v19;
  const void *v20;
  CFStringRef v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const __CFDate *v28;
  const __CFDate *v29;
  const __CFString *v30;
  const void *Event;
  int v32;
  char v33;
  unsigned int v34;
  const void *Alarm;
  uint64_t v36;
  const void *v37;
  char v38;
  uint64_t v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  const void *v52;
  const void *v53;
  const void *v54;
  const void *v55;
  const void *Task;
  int v57;
  const __CFNumber *v58;
  BOOL v59;
  unsigned int v60;
  const __CFArray *v61;
  const __CFArray *v62;
  const __CFNumber *v63;
  const __CFNumber *v64;
  const __CFNumber *v65;
  CFStringRef v66;
  CFStringRef v67;
  char v68;
  unsigned int v69;
  const __CFArray *v70;
  const __CFArray *v71;
  const __CFString *v72;
  const __CFDictionary *v73;
  const __CFString *v74;
  char v75;
  const void *v76;
  const void *v77;
  const void *v78;
  SInt32 v79;
  uint64_t v80;
  const void *v81;
  __CFDictionary *v82;
  const __CFNumber *v83;
  SInt32 v84;
  const void *v85;
  const void *v86;
  CFTypeID v87;
  char v88;
  uint64_t v89;
  const void *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const void *v94;
  uint64_t v95;
  const void *v96;
  const void *v97;
  const void *v98;
  int v99;
  CFTypeID v100;
  CFTypeID v101;
  CFTypeID v102;
  CFTypeID v103;
  const void *v104;
  const __CFArray *v105;
  const __CFArray *v106;
  CFIndex v107;
  const __CFString *ValueAtIndex;
  uint64_t v109;
  const void *v110;
  CFTypeID v111;
  CFTypeID v112;
  const void *v113;
  CFDateRef v114;
  CFDateRef v115;
  CFTypeID v116;
  BOOL v117;
  char v118;
  const __CFString *v119;
  const void *v120;
  const __CFArray *v121;
  const __CFString *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const void *v127;
  double v128;
  double v129;
  CFTimeZoneRef v130;
  const __CFString *v131;
  uint64_t v132;
  const void *v133;
  const void *v134;
  const __CFDictionary *v135;
  const __CFDictionary *v136;
  void *v137;
  const void *Recurrence;
  __CFDictionary *v139;
  const __CFString *v140;
  const __CFString *v141;
  int CharacterAtIndex;
  const __CFSet *v143;
  __CFDictionary *v144;
  uint64_t v145;
  const void *v146;
  CFURLRef v147;
  uint64_t Attendee;
  int v149;
  int v150;
  const __CFNumber *v151;
  const __CFNumber *v152;
  const void *v153;
  const void *v154;
  CFTypeID v155;
  const __CFArray *v156;
  const __CFArray *v157;
  CFIndex Count;
  CFIndex v159;
  CFIndex v160;
  int v161;
  const __CFNumber *v162;
  BOOL v163;
  int v164;
  const __CFArray *v165;
  const __CFArray *v166;
  uint64_t v167;
  uint64_t v168;
  __CFArray *Mutable;
  CFIndex i;
  const __CFNumber *v171;
  const __CFArray *v172;
  const __CFArray *v173;
  uint64_t v174;
  uint64_t v175;
  __CFArray *v176;
  CFIndex j;
  const __CFNumber *v178;
  const __CFArray *v179;
  const __CFArray *v180;
  uint64_t v181;
  uint64_t v182;
  __CFArray *v183;
  CFIndex k;
  const __CFNumber *v185;
  const __CFArray *v186;
  const __CFArray *v187;
  uint64_t v188;
  uint64_t v189;
  __CFArray *v190;
  CFIndex m;
  const __CFNumber *v192;
  const __CFArray *v193;
  const __CFArray *v194;
  const __CFArray *v195;
  CFIndex v196;
  CFIndex v197;
  __CFArray *v198;
  CFIndex n;
  const __CFNumber *v200;
  const __CFString *v201;
  int DayOfWeekFromString;
  __CFDictionary *v203;
  char v204;
  const __CFString *URLString;
  const void *v206;
  const __CFNumber *number;
  const __CFArray *v208;
  const void *v209;
  const void *v210;
  const __CFNumber *v211;
  const __CFDate *v212;
  SInt32 v213;
  uint64_t v214;
  unsigned int v215;
  _BYTE valuePtr[12];
  SInt32 v217[3];

  TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    Value = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("com.apple.syncservices.RecordEntityName"));
    if (!Value)
    {
      if (!DLShouldLog())
        return;
      goto LABEL_76;
    }
    v13 = Value;
    v215 = 0;
    v214 = 0;
    v213 = 0;
    v14 = _deconstructRecordIdentifier(a1, &v213, (SInt32 *)&v214, (SInt32 *)&v214 + 1, (SInt32 *)&v215);
    if (CFStringCompare(v13, CFSTR("com.apple.calendars.Calendar"), 0))
    {
      if (CFStringCompare(v13, CFSTR("com.apple.calendars.Event"), 0))
      {
        if (CFStringCompare(v13, CFSTR("com.apple.calendars.Task"), 0))
        {
          if (CFStringCompare(v13, CFSTR("com.apple.calendars.AudioAlarm"), 0)
            && CFStringCompare(v13, CFSTR("com.apple.calendars.DisplayAlarm"), 0))
          {
            if (CFStringCompare(v13, CFSTR("com.apple.calendars.Recurrence"), 0))
            {
              if (CFStringCompare(v13, CFSTR("com.apple.calendars.Organizer"), 0))
              {
                if (CFStringCompare(v13, CFSTR("com.apple.calendars.Attendee"), 0))
                {
                  if (CFStringCompare(v13, CFSTR("com.apple.calendars.CalendarOrder"), 0) == kCFCompareEqualTo)
                  {
                    v105 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("calendars"));
                    if (v105)
                    {
                      v106 = v105;
                      if (CFArrayGetCount(v105) >= 1)
                      {
                        v107 = 0;
                        do
                        {
                          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v106, v107);
                          v109 = _CopyCalendarForUIDString(a3, ValueAtIndex);
                          if (v109)
                          {
                            v110 = (const void *)v109;
                            CalCalendarSetDisplayOrder();
                            CFRelease(v110);
                          }
                          ++v107;
                        }
                        while (CFArrayGetCount(v106) > v107);
                      }
                    }
                    return;
                  }
                  if (!DLShouldLog())
                    return;
LABEL_76:
                  _DLLog();
                  return;
                }
                if ((_DWORD)v214 == 7)
                  v88 = 0;
                else
                  v88 = v14;
                if ((v88 & 1) == 0)
                {
                  v89 = v215;
                  *(_DWORD *)&valuePtr[4] = 0;
                  v90 = CFDictionaryGetValue(a2, CFSTR("email"));
                  v91 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("role"));
                  v92 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("status"));
                  v93 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("user type"));
                  v94 = CFDictionaryGetValue(a2, CFSTR("common name"));
                  if (DLShouldLog())
                    _DLLog();
                  if ((_DWORD)v89 != -1)
                  {
                    Alarm = (const void *)MEMORY[0x22E2FA148](*(_QWORD *)(a3 + 184), v89);
                    if (Alarm)
                      goto LABEL_237;
                    if (DLShouldLog())
                      _DLLog();
                  }
                  Alarm = 0;
LABEL_237:
                  v95 = _CopyCalEntityOwner(a3, a2, (SInt32 *)&valuePtr[4]);
                  if (v95)
                  {
                    v96 = (const void *)v95;
                    if (Alarm)
                    {
                      if (DLShouldLog())
                        _DLLog();
                    }
                    else
                    {
                      Attendee = CalDatabaseCreateAttendee();
                      if (!Attendee)
                      {
                        if (DLShouldLog())
                          _DLLog();
                        Alarm = v96;
                        goto LABEL_225;
                      }
                      Alarm = (const void *)Attendee;
                      if (DLShouldLog())
                        _DLLog();
                      v149 = *(_DWORD *)&valuePtr[4];
                      v150 = DLShouldLog();
                      if (v149 == 2)
                      {
                        if (v150)
                          _DLLog();
                        MEMORY[0x22E2FA340](v96, Alarm);
                      }
                      else if (v150)
                      {
                        _DLLog();
                      }
                      v203 = *(__CFDictionary **)(a3 + 256);
                      if (!v203)
                      {
                        CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                        v203 = (__CFDictionary *)DLMemoryPoolAddObject();
                        *(_QWORD *)(a3 + 256) = v203;
                      }
                      CFDictionaryAddValue(v203, a1, Alarm);
                    }
                    MEMORY[0x22E2F9F98](Alarm, v90);
                    if (v91
                      && CFStringCompare(v91, CFSTR("requiredparticipant"), 0)
                      && CFStringCompare(v91, CFSTR("optionalparticipant"), 0)
                      && CFStringCompare(v91, CFSTR("chair"), 0))
                    {
                      CFStringCompare(v91, CFSTR("nonparticipant"), 0);
                    }
                    CalAttendeeSetRole();
                    if (v92
                      && CFStringCompare(v92, CFSTR("needsaction"), 0)
                      && CFStringCompare(v92, CFSTR("accepted"), 0)
                      && CFStringCompare(v92, CFSTR("declined"), 0)
                      && CFStringCompare(v92, CFSTR("tentative"), 0)
                      && CFStringCompare(v92, CFSTR("delegated"), 0)
                      && CFStringCompare(v92, CFSTR("completed"), 0))
                    {
                      CFStringCompare(v92, CFSTR("inprocess"), 0);
                    }
                    CalAttendeeSetStatus();
                    if (v93
                      && CFStringCompare(v93, CFSTR("individual"), 0)
                      && CFStringCompare(v93, CFSTR("room"), 0)
                      && CFStringCompare(v93, CFSTR("resource"), 0)
                      && CFStringCompare(v93, CFSTR("group"), 0))
                    {
                      CFStringCompare(v93, CFSTR("unknown"), 0);
                    }
                    CalAttendeeSetType();
                    MEMORY[0x22E2F9F8C](Alarm, v94);
                    CFRelease(v96);
LABEL_225:
                    v11 = Alarm;
                    goto LABEL_483;
                  }
                  if (!DLShouldLog())
                  {
LABEL_179:
                    if (!Alarm)
                      return;
                    goto LABEL_225;
                  }
LABEL_178:
                  _DLLog();
                  goto LABEL_179;
                }
              }
              else
              {
                if ((_DWORD)v214 == 8)
                  v75 = 0;
                else
                  v75 = v14;
                if ((v75 & 1) == 0)
                {
                  *(_DWORD *)&valuePtr[4] = 0;
                  v76 = CFDictionaryGetValue(a2, CFSTR("common name"));
                  v77 = CFDictionaryGetValue(a2, CFSTR("email"));
                  v78 = (const void *)_CopyCalEntityOwner(a3, a2, (SInt32 *)&valuePtr[4]);
                  if (DLShouldLog())
                    _DLLog();
                  if (!v78)
                  {
                    if (!DLShouldLog())
                      return;
                    goto LABEL_76;
                  }
                  v217[0] = -1;
                  if (_deconstructRecordIdentifier(a1, 0, 0, 0, v217))
                  {
                    v79 = v217[0];
                    if (v79 != CalCalendarItemGetRowID())
                    {
                      if (DLShouldLog())
                        _DLLog();
                      v80 = CalDatabaseCopyCalendarItemWithRowID();
                      if (v80)
                      {
                        v81 = (const void *)v80;
                        CalCalendarItemSetOrganizer();
                        CFRelease(v81);
                      }
                    }
                  }
                  if (*(_DWORD *)&valuePtr[4] == 2)
                  {
                    Organizer = MEMORY[0x22E2FA394](v78);
                    if (!Organizer)
                    {
                      if (DLShouldLog())
                      {
                        CalCalendarItemGetRowID();
                        _DLLog();
                      }
                      Organizer = CalDatabaseCreateOrganizer();
                      CalCalendarItemSetOrganizer();
                    }
                  }
                  else
                  {
                    if (DLShouldLog())
                      _DLLog();
                    Organizer = CalDatabaseCreateOrganizer();
                  }
                  v143 = *(const __CFSet **)(a3 + 344);
                  if (v143 && CFSetContainsValue(v143, v77))
                    CalOrganizerSetIsSelf();
                  MEMORY[0x22E2FA4C0](Organizer, v77);
                  MEMORY[0x22E2FA4B4](Organizer, v76);
                  v144 = *(__CFDictionary **)(a3 + 248);
                  if (!v144)
                  {
                    CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                    v144 = (__CFDictionary *)DLMemoryPoolAddObject();
                    *(_QWORD *)(a3 + 248) = v144;
                  }
                  CFDictionaryAddValue(v144, a1, v78);
                  CFRelease(v78);
                  if (!Organizer)
                    return;
LABEL_15:
                  v11 = (const void *)Organizer;
LABEL_483:
                  CFRelease(v11);
                  return;
                }
              }
LABEL_75:
              if (!DLShouldLog())
                return;
              goto LABEL_76;
            }
            if ((_DWORD)v214 == 5)
              v68 = 0;
            else
              v68 = v14;
            if ((v68 & 1) != 0)
              goto LABEL_75;
            v69 = v215;
            v70 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("owner"));
            if (v70 && (v71 = v70, CFArrayGetCount(v70) >= 1))
            {
              *(_DWORD *)&valuePtr[4] = 0;
              v217[0] = 0;
              v72 = (const __CFString *)CFArrayGetValueAtIndex(v71, 0);
              v73 = *(const __CFDictionary **)(a3 + 168);
              if (v73)
              {
                v74 = (const __CFString *)CFDictionaryGetValue(v73, v72);
                if (v74)
                  v72 = v74;
              }
              CalendarForEntityType = 0;
              if (!_deconstructRecordIdentifier(v72, 0, v217, 0, (SInt32 *)&valuePtr[4])
                || *(_DWORD *)&valuePtr[4] == -1)
              {
LABEL_248:
                if (DLShouldLog())
                  _DLLog();
                if (v69 != -1)
                {
                  v97 = (const void *)CalDatabaseCopyRecurrenceWithUID();
                  if (v97)
                    goto LABEL_255;
                  if (DLShouldLog())
                    _DLLog();
                }
                v97 = 0;
LABEL_255:
                if (!CalendarForEntityType)
                {
                  if (DLShouldLog())
                    _DLLog();
                  CalendarForEntityType = v97;
                  if (!v97)
                    return;
                  goto LABEL_482;
                }
                v98 = (const void *)MEMORY[0x22E2FA3B8](CalendarForEntityType);
                v99 = DLShouldLog();
                if (v97)
                {
                  if (v99)
                    _DLLog();
                  MEMORY[0x22E2FA40C](CalendarForEntityType, v97);
                }
                else if (v99)
                {
                  _DLLog();
                }
                if (v98)
                  CFRelease(v98);
                if (v97)
                  CFRelease(v97);
                Recurrence = (const void *)CalDatabaseCreateRecurrence();
                if (DLShouldLog())
                  _DLLog();
                v139 = *(__CFDictionary **)(a3 + 240);
                if (!v139)
                {
                  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  v139 = (__CFDictionary *)DLMemoryPoolAddObject();
                  *(_QWORD *)(a3 + 240) = v139;
                }
                CFDictionaryAddValue(v139, a1, Recurrence);
                v140 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("weekstartday"));
                _GetDayOfWeekFromString(v140);
                CalRecurrenceSetWeekStart();
                v141 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("frequency"));
                if (!v141)
                  goto LABEL_410;
                CharacterAtIndex = CFStringGetCharacterAtIndex(v141, 0);
                if (CharacterAtIndex > 118)
                {
                  if (CharacterAtIndex == 121 || CharacterAtIndex == 119)
                    goto LABEL_409;
                }
                else if (CharacterAtIndex == 100 || CharacterAtIndex == 109)
                {
LABEL_409:
                  CalRecurrenceSetFrequency();
LABEL_410:
                  v151 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("interval"));
                  if (v151)
                  {
                    *(_DWORD *)&valuePtr[4] = 0;
                    if (CFNumberGetValue(v151, kCFNumberIntType, &valuePtr[4]))
                    {
                      if (*(_DWORD *)&valuePtr[4])
                        CalRecurrenceSetInterval();
                    }
                  }
                  v152 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("count"));
                  if (v152
                    && (*(_DWORD *)&valuePtr[4] = 0, CFNumberGetValue(v152, kCFNumberIntType, &valuePtr[4]))
                    && *(_DWORD *)&valuePtr[4])
                  {
                    CalRecurrenceSetCount();
                  }
                  else
                  {
                    v153 = CFDictionaryGetValue(a2, CFSTR("until"));
                    if (v153)
                    {
                      v154 = v153;
                      v155 = CFGetTypeID(v153);
                      if (v155 == CFDateGetTypeID())
                      {
                        MEMORY[0x22E2F9C38](v154);
                        if (DLShouldLog())
                          _DLLog();
                      }
                    }
                    CalRecurrenceSetEndDate();
                  }
                  v156 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("bymonth"));
                  if (v156)
                  {
                    v157 = v156;
                    Count = CFArrayGetCount(v156);
                    if (Count >= 1)
                    {
                      v159 = Count;
                      v160 = 0;
                      v161 = 0;
                      do
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        v162 = (const __CFNumber *)CFArrayGetValueAtIndex(v157, v160);
                        v163 = CFNumberGetValue(v162, kCFNumberIntType, &valuePtr[4]) != 0;
                        if (v163 && *(_DWORD *)&valuePtr[4] != 0)
                          v164 = 1 << (valuePtr[4] - 1);
                        else
                          v164 = 0;
                        v161 |= v164;
                        ++v160;
                      }
                      while (v159 != v160);
                      if (v161)
                        CalRecurrenceSetByMonthMonths();
                    }
                  }
                  v165 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("byweeknumber"));
                  if (v165)
                  {
                    v166 = v165;
                    v167 = CFArrayGetCount(v165);
                    if (v167 >= 1)
                    {
                      v168 = v167;
                      Mutable = CFArrayCreateMutable(0, v167, 0);
                      for (i = 0; i != v168; ++i)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        v171 = (const __CFNumber *)CFArrayGetValueAtIndex(v166, i);
                        if (CFNumberGetValue(v171, kCFNumberIntType, &valuePtr[4]))
                          CFArrayAppendValue(Mutable, (const void *)*(int *)&valuePtr[4]);
                      }
                      if (CFArrayGetCount(Mutable))
                        CalRecurrenceSetByWeekWeeks();
                      CFRelease(Mutable);
                    }
                  }
                  v172 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("byyearday"));
                  if (v172)
                  {
                    v173 = v172;
                    v174 = CFArrayGetCount(v172);
                    if (v174 >= 1)
                    {
                      v175 = v174;
                      v176 = CFArrayCreateMutable(0, v174, 0);
                      for (j = 0; j != v175; ++j)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        v178 = (const __CFNumber *)CFArrayGetValueAtIndex(v173, j);
                        if (CFNumberGetValue(v178, kCFNumberIntType, &valuePtr[4]))
                          CFArrayAppendValue(v176, (const void *)*(int *)&valuePtr[4]);
                      }
                      if (CFArrayGetCount(v176))
                        CalRecurrenceSetByYearDayDays();
                      CFRelease(v176);
                    }
                  }
                  v179 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("bymonthday"));
                  if (v179)
                  {
                    v180 = v179;
                    v181 = CFArrayGetCount(v179);
                    if (v181 >= 1)
                    {
                      v182 = v181;
                      v183 = CFArrayCreateMutable(0, v181, 0);
                      for (k = 0; k != v182; ++k)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        v185 = (const __CFNumber *)CFArrayGetValueAtIndex(v180, k);
                        if (CFNumberGetValue(v185, kCFNumberIntType, &valuePtr[4]))
                          CFArrayAppendValue(v183, (const void *)*(int *)&valuePtr[4]);
                      }
                      if (CFArrayGetCount(v183))
                        CalRecurrenceSetByMonthDayDays();
                      CFRelease(v183);
                    }
                  }
                  v186 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("bysetpos"));
                  if (v186)
                  {
                    v187 = v186;
                    v188 = CFArrayGetCount(v186);
                    if (v188 >= 1)
                    {
                      v189 = v188;
                      v190 = CFArrayCreateMutable(0, v188, 0);
                      for (m = 0; m != v189; ++m)
                      {
                        *(_DWORD *)&valuePtr[4] = 0;
                        v192 = (const __CFNumber *)CFArrayGetValueAtIndex(v187, m);
                        if (CFNumberGetValue(v192, kCFNumberIntType, &valuePtr[4]))
                          CFArrayAppendValue(v190, (const void *)*(int *)&valuePtr[4]);
                      }
                      if (CFArrayGetCount(v190))
                        CalRecurrenceSetBySetPos();
                      CFRelease(v190);
                    }
                  }
                  v193 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("bydayfreq"));
                  v194 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("bydaydays"));
                  if (v193)
                  {
                    v195 = v194;
                    if (v194)
                    {
                      v196 = CFArrayGetCount(v193);
                      if (v196 >= 1)
                      {
                        v197 = v196;
                        if (CFArrayGetCount(v195) == v196)
                        {
                          *(_QWORD *)&valuePtr[4] = 0;
                          v198 = CFArrayCreateMutable(0, v197, MEMORY[0x24BE14070]);
                          for (n = 0; n != v197; ++n)
                          {
                            v217[0] = 0;
                            v200 = (const __CFNumber *)CFArrayGetValueAtIndex(v193, n);
                            v201 = (const __CFString *)CFArrayGetValueAtIndex(v195, n);
                            LODWORD(v200) = CFNumberGetValue(v200, kCFNumberIntType, v217);
                            DayOfWeekFromString = _GetDayOfWeekFromString(v201);
                            if ((_DWORD)v200 && DayOfWeekFromString != 7)
                            {
                              *(_DWORD *)&valuePtr[4] = v217[0];
                              *(_DWORD *)&valuePtr[8] = DayOfWeekFromString;
                              CFArrayAppendValue(v198, &valuePtr[4]);
                            }
                          }
                          if (CFArrayGetCount(v198))
                            CalRecurrenceSetByDayDays();
                          CFRelease(v198);
                        }
                      }
                    }
                  }
                  MEMORY[0x22E2FA358](CalendarForEntityType, Recurrence);
                  v104 = Recurrence;
LABEL_481:
                  CFRelease(v104);
LABEL_482:
                  v11 = CalendarForEntityType;
                  goto LABEL_483;
                }
                if (DLShouldLog())
                  _DLLog();
                goto LABEL_410;
              }
              if (v217[0] == 2)
              {
                CalendarForEntityType = (const void *)CalDatabaseCopyCalendarItemWithRowID();
                goto LABEL_248;
              }
              if (DLShouldLog())
                goto LABEL_246;
            }
            else if (DLShouldLog())
            {
LABEL_246:
              _DLLog();
            }
            CalendarForEntityType = 0;
            goto LABEL_248;
          }
          if ((_DWORD)v214 == 4)
            v33 = 0;
          else
            v33 = v14;
          if ((v33 & 1) != 0)
            goto LABEL_75;
          v34 = v215;
          if (DLShouldLog())
            _DLLog();
          if (v34 != -1)
          {
            Alarm = (const void *)CalDatabaseCopyAlarmWithUID();
            if (Alarm)
              goto LABEL_67;
            if (DLShouldLog())
              _DLLog();
          }
          Alarm = 0;
LABEL_67:
          *(_DWORD *)&valuePtr[4] = 0;
          v36 = _CopyCalEntityOwner(a3, a2, (SInt32 *)&valuePtr[4]);
          if (!v36)
          {
            if (!DLShouldLog())
              goto LABEL_179;
            goto LABEL_178;
          }
          v37 = (const void *)v36;
          if (Alarm)
          {
            if (DLShouldLog())
              _DLLog();
          }
          else
          {
            Alarm = (const void *)CalDatabaseCreateAlarm();
            if (DLShouldLog())
              _DLLog();
            if (DLShouldLog())
              _DLLog();
            CalCalendarItemAddAlarm();
            v82 = *(__CFDictionary **)(a3 + 232);
            if (!v82)
            {
              CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              v82 = (__CFDictionary *)DLMemoryPoolAddObject();
              *(_QWORD *)(a3 + 232) = v82;
            }
            CFDictionaryAddValue(v82, a1, Alarm);
          }
          CFStringCompare(v13, CFSTR("com.apple.calendars.AudioAlarm"), 0);
          CalAlarmSetType();
          v83 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("triggerduration"));
          if (v83 && (v217[0] = 0, CFNumberGetValue(v83, kCFNumberIntType, v217)))
          {
            v84 = v217[0];
            CalAlarmSetTriggerInterval();
            if (v84 != 0x7FFFFFFF)
            {
LABEL_224:
              CFRelease(Alarm);
              Alarm = v37;
              goto LABEL_225;
            }
          }
          else
          {
            CalAlarmSetTriggerInterval();
          }
          v85 = CFDictionaryGetValue(a2, CFSTR("triggerdate"));
          if (v85)
          {
            v86 = v85;
            v87 = CFGetTypeID(v85);
            if (v87 == CFDateGetTypeID())
            {
              MEMORY[0x22E2F9C38](v86);
              if (DLShouldLog())
                _DLLog();
            }
          }
          CalAlarmSetTriggerDate();
          goto LABEL_224;
        }
        if ((_DWORD)v214 == 3)
          v38 = 0;
        else
          v38 = v14;
        if ((v38 & 1) != 0)
          goto LABEL_75;
        v50 = v215;
        v51 = _CopyParentCalendar(a3, a2);
        if (!v51)
        {
          if (!DLShouldLog())
            return;
          goto LABEL_76;
        }
        CalendarForEntityType = (const void *)v51;
        v52 = CFDictionaryGetValue(a2, CFSTR("summary"));
        v53 = CFDictionaryGetValue(a2, CFSTR("priority"));
        v54 = CFDictionaryGetValue(a2, CFSTR("due date"));
        v55 = CFDictionaryGetValue(a2, CFSTR("completion date"));
        if (DLShouldLog())
          _DLLog();
        if (v50 != -1)
        {
          Task = (const void *)CalDatabaseCopyCalendarItemWithRowID();
          v57 = DLShouldLog();
          if (Task)
          {
            if (v57)
              _DLLog();
LABEL_267:
            MEMORY[0x22E2F9FD4](CalendarForEntityType, Task);
            if (v52)
            {
              v100 = CFGetTypeID(v52);
              if (v100 == CFStringGetTypeID())
                CalCalendarItemSetSummary();
            }
            if (v53)
            {
              v101 = CFGetTypeID(v53);
              if (v101 == CFNumberGetTypeID())
              {
                *(_DWORD *)&valuePtr[4] = 0;
                if (CFNumberGetValue((CFNumberRef)v53, kCFNumberIntType, &valuePtr[4]))
                  CalCalendarItemSetPriority();
              }
            }
            if (v54)
            {
              v102 = CFGetTypeID(v54);
              if (v102 == CFDateGetTypeID())
              {
                if (DLShouldLog())
                  _DLLog();
              }
            }
            CalTaskSetDueDate();
            if (v55)
            {
              v103 = CFGetTypeID(v55);
              if (v103 == CFDateGetTypeID())
              {
                if (DLShouldLog())
                  _DLLog();
              }
            }
            CalTaskSetCompletionDate();
            v104 = Task;
            goto LABEL_481;
          }
          if (v57)
            _DLLog();
        }
        Task = (const void *)CalDatabaseCreateTask();
        if (!*(_QWORD *)(a3 + 224))
        {
          CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          *(_QWORD *)(a3 + 224) = DLMemoryPoolAddObject();
        }
        if (DLShouldLog())
          _DLLog();
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 224), a1, Task);
        goto LABEL_267;
      }
      if ((_DWORD)v214 == 2)
        v22 = 0;
      else
        v22 = v14;
      if ((v22 & 1) != 0)
        goto LABEL_75;
      v23 = v215;
      v24 = _CopyParentCalendar(a3, a2);
      if (!v24)
      {
        if (!DLShouldLog())
          return;
        goto LABEL_76;
      }
      CalendarForEntityType = (const void *)v24;
      v25 = CFDictionaryGetValue(a2, CFSTR("summary"));
      v26 = CFDictionaryGetValue(a2, CFSTR("description"));
      v27 = CFDictionaryGetValue(a2, CFSTR("location"));
      v211 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("all day"));
      v28 = (const __CFDate *)CFDictionaryGetValue(a2, CFSTR("start date"));
      number = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("floatingOffset"));
      v29 = (const __CFDate *)CFDictionaryGetValue(a2, CFSTR("end date"));
      v209 = CFDictionaryGetValue(a2, CFSTR("original date"));
      v210 = CFDictionaryGetValue(a2, CFSTR("exception dates"));
      v208 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("main event"));
      v30 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("url"));
      v212 = v28;
      if (!v28 || !v29)
      {
        if (DLShouldLog())
          _DLLog();
        goto LABEL_482;
      }
      URLString = v30;
      v206 = CalendarForEntityType;
      if (v23 != -1)
      {
        Event = (const void *)CalDatabaseCopyCalendarItemWithRowID();
        v32 = DLShouldLog();
        if (Event)
        {
          if (v32)
            _DLLog();
          v204 = 0;
          goto LABEL_297;
        }
        if (v32)
          _DLLog();
      }
      Event = (const void *)CalDatabaseCreateEvent();
      if (!*(_QWORD *)(a3 + 216))
      {
        CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        *(_QWORD *)(a3 + 216) = DLMemoryPoolAddObject();
      }
      if (DLShouldLog())
        _DLLog();
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 216), a1, Event);
      v204 = 1;
LABEL_297:
      MEMORY[0x22E2F9FC8](CalendarForEntityType, Event);
      if (v25)
      {
        v111 = CFGetTypeID(v25);
        if (v111 == CFStringGetTypeID())
          CalCalendarItemSetSummary();
      }
      if (v26)
      {
        if (DLShouldLog())
          _DLLog();
        v112 = CFGetTypeID(v26);
        if (v112 == CFStringGetTypeID())
          v113 = v26;
        else
          v113 = 0;
      }
      else
      {
        v113 = 0;
      }
      MEMORY[0x22E2FA424](Event, v113);
      if (v27)
      {
        CFGetTypeID(v27);
        CFStringGetTypeID();
      }
      v114 = v29;
      CalEventSetLocation_Deprecated();
      v115 = v28;
      if (v211 && (v116 = CFGetTypeID(v211), v116 == CFNumberGetTypeID()))
      {
        *(_DWORD *)&valuePtr[4] = 0;
        if (CFNumberGetValue(v211, kCFNumberIntType, &valuePtr[4]))
          v117 = *(_DWORD *)&valuePtr[4] == 0;
        else
          v117 = 1;
        v118 = !v117;
        CalEventSetAllDay();
        if ((v118 & 1) != 0)
        {
          v119 = CFSTR("_float");
          CalendarForEntityType = v206;
          v121 = v208;
          v120 = v209;
          goto LABEL_330;
        }
      }
      else
      {
        CalEventSetAllDay();
      }
      v122 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("start date.timezone"));
      CalendarForEntityType = v206;
      v121 = v208;
      v120 = v209;
      if (!v122)
        goto LABEL_527;
      v119 = v122;
      if (CFStringCompare(v122, CFSTR("LOCAL"), 1uLL) == kCFCompareEqualTo)
      {
        if (DLShouldLog())
          _DLLog();
        v123 = CalCopyDefaultTimeZone();
        if (v123)
        {
          v127 = (const void *)v123;
          v119 = (const __CFString *)MEMORY[0x22E2F9E78](v123, v124, v125, v126);
          CFRelease(v127);
          if (!v119)
          {
LABEL_527:
            if (number)
            {
              *(_QWORD *)&valuePtr[4] = 0;
              CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr[4]);
              v128 = MEMORY[0x22E2F9C38](v212);
              v115 = CFDateCreate(0, v128 + (double)*(uint64_t *)&valuePtr[4]);
              v129 = MEMORY[0x22E2F9C38](v114);
              v114 = CFDateCreate(0, v129 + (double)*(uint64_t *)&valuePtr[4]);
              if (DLShouldLog())
                _DLLog();
            }
            v119 = CFSTR("_float");
          }
        }
      }
LABEL_330:
      MEMORY[0x22E2F9C38](v115);
      CalEventSetStartDateDirectly();
      MEMORY[0x22E2F9C38](v114);
      CalEventSetEndDate();
      v130 = CFTimeZoneCreateWithName(0, v119, 1u);
      CalCalendarItemSetEndTimeZone();
      if (v130)
        CFRelease(v130);
      if (v120 && (MEMORY[0x22E2F9C38](v120), CalEventSetOriginalStartDate(), v121) && CFArrayGetCount(v121) == 1)
      {
        v131 = (const __CFString *)CFArrayGetValueAtIndex(v121, 0);
        *(_DWORD *)&valuePtr[4] = -1;
        v217[0] = 0;
        if (DLShouldLog())
          _DLLog();
        if (!_deconstructRecordIdentifier(v131, 0, v217, 0, (SInt32 *)&valuePtr[4]))
          goto LABEL_348;
        if (v217[0] != 2)
        {
          v134 = v210;
          if (DLShouldLog())
            _DLLog();
          CalEventSetOriginalEvent();
          if (v210)
            goto LABEL_343;
          goto LABEL_392;
        }
        v132 = CalDatabaseCopyCalendarItemWithRowID();
        if (v132)
        {
          v133 = (const void *)v132;
          MEMORY[0x22E2FA34C](v132, v120);
          CalEventSetOriginalEvent();
          CFRelease(v133);
        }
        else
        {
LABEL_348:
          v135 = *(const __CFDictionary **)(a3 + 264);
          if (!v135)
          {
            CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v135 = (const __CFDictionary *)DLMemoryPoolAddObject();
            *(_QWORD *)(a3 + 264) = v135;
          }
          if (!CFDictionaryContainsKey(v135, v131))
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 264), v131, v131);
          v136 = *(const __CFDictionary **)(a3 + 272);
          if (!v136)
          {
            CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v136 = (const __CFDictionary *)DLMemoryPoolAddObject();
            *(_QWORD *)(a3 + 272) = v136;
          }
          v137 = (void *)CFDictionaryGetValue(v136, v131);
          if (!v137)
          {
            v137 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 272), v131, v137);
            CFRelease(v137);
          }
          CFArrayAppendValue((CFMutableArrayRef)v137, Event);
        }
      }
      else
      {
        CalEventSetOriginalEvent();
      }
      v134 = v210;
      if (v210)
      {
LABEL_343:
        MEMORY[0x22E2FA448](Event, v134);
LABEL_395:
        if (URLString)
        {
          v147 = CFURLCreateWithString(0, URLString, 0);
          MEMORY[0x22E2FA490](Event, v147);
          if (v147)
            CFRelease(v147);
        }
        else
        {
          MEMORY[0x22E2FA490](Event);
        }
        v104 = Event;
        goto LABEL_481;
      }
LABEL_392:
      if ((v204 & 1) == 0)
      {
        v145 = MEMORY[0x22E2FA388](Event);
        if (v145)
        {
          v146 = (const void *)v145;
          MEMORY[0x22E2FA448](Event, 0);
          CFRelease(v146);
        }
      }
      goto LABEL_395;
    }
    if ((_DWORD)v214 == 1)
      v15 = 0;
    else
      v15 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_75;
    v16 = v215;
    v17 = CFDictionaryGetValue(a2, CFSTR("title"));
    if (v16 != -1)
    {
      CalendarForEntityType = (const void *)CalDatabaseCopyCalendarWithUID();
      v19 = DLShouldLog();
      if (CalendarForEntityType)
      {
        if (v19)
          _DLLog();
        v20 = (const void *)CalCalendarCopyTitle();
        v21 = CFStringCreateWithFormat(0, 0, CFSTR("%@-CalDAVInfo"), v17);
        CalDatabaseSetProperty();
        if (v21)
          CFRelease(v21);
        if (v20)
          CFRelease(v20);
LABEL_117:
        v58 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("read only"));
        if (v58)
        {
          *(_DWORD *)&valuePtr[4] = 0;
          if (CFNumberGetValue(v58, kCFNumberIntType, &valuePtr[4]))
            v59 = *(_DWORD *)&valuePtr[4] == 0;
          else
            v59 = 1;
          v60 = !v59;
          if (!v59 && DLShouldLog())
            _DLLog();
        }
        else
        {
          v60 = 0;
        }
        CalCalendarSetReadOnly();
        CalCalendarSetTitle();
        if (CFDictionaryGetValue(a2, CFSTR("com.apple.ical.type")))
          CalCalendarSetType();
        if (*(_BYTE *)(a3 + 353) == 1)
        {
          v61 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("colorComponents"));
          if (v61)
          {
            v62 = v61;
            if (CFArrayGetCount(v61) >= 3)
            {
              *(_QWORD *)valuePtr = 0;
              v217[0] = 0;
              v63 = (const __CFNumber *)CFArrayGetValueAtIndex(v62, 0);
              CFNumberGetValue(v63, kCFNumberIntType, &valuePtr[4]);
              v64 = (const __CFNumber *)CFArrayGetValueAtIndex(v62, 1);
              CFNumberGetValue(v64, kCFNumberIntType, v217);
              v65 = (const __CFNumber *)CFArrayGetValueAtIndex(v62, 2);
              CFNumberGetValue(v65, kCFNumberIntType, valuePtr);
              if (DLShouldLog())
                _DLLog();
              CalCalendarSetColorComponents();
            }
          }
        }
        if (CFDictionaryGetValue(a2, CFSTR("com.apple.MobileSync.calDAVInfo")))
        {
          v66 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), v60);
          v67 = CFStringCreateWithFormat(0, 0, CFSTR("%@-CalDAVInfo"), v17);
          if (DLShouldLog())
            _DLLog();
          CalDatabaseSetProperty();
          if (v66)
            CFRelease(v66);
          if (v67)
            CFRelease(v67);
          CalCalendarSetReadOnly();
        }
        goto LABEL_482;
      }
      if (v19)
        _DLLog();
    }
    if (!v17)
    {
      if (!DLShouldLog())
        return;
      goto LABEL_76;
    }
    CalendarForEntityType = (const void *)CalDatabaseCreateCalendarForEntityType();
    CalStoreAddCalendar();
    if (!*(_QWORD *)(a3 + 208))
    {
      CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      *(_QWORD *)(a3 + 208) = DLMemoryPoolAddObject();
    }
    if (DLShouldLog())
      _DLLog();
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a3 + 208), a1, CalendarForEntityType);
    goto LABEL_117;
  }
  if (DLShouldLog())
    _DLLog();
  *(_QWORD *)valuePtr = 0;
  v217[0] = 0;
  v215 = 0;
  if (!_deconstructRecordIdentifier(a1, (SInt32 *)&v215, (SInt32 *)valuePtr, v217, (SInt32 *)&valuePtr[4]))
  {
    if (!DLShouldLog())
      return;
    goto LABEL_76;
  }
  switch(*(_DWORD *)valuePtr)
  {
    case 1:
      v7 = CalDatabaseCopyCalendarWithUID();
      if (v7)
      {
        Organizer = v7;
        v9 = (const void *)CalCalendarCopyTitle();
        CalRemoveCalendar();
        v10 = CFStringCreateWithFormat(0, 0, CFSTR("%@-CalDAVInfo"), v9);
        if (v9)
          CFRelease(v9);
        if (DLShouldLog())
          _DLLog();
        CalDatabaseSetProperty();
        if (v10)
          CFRelease(v10);
        if (DLShouldLog())
          _DLLog();
        goto LABEL_15;
      }
      if (DLShouldLog())
        goto LABEL_76;
      return;
    case 2:
      v39 = CalDatabaseCopyCalendarItemWithRowID();
      if (v39)
      {
        v40 = (const void *)v39;
        CalRemoveEvent();
        if (!DLShouldLog())
          goto LABEL_244;
        goto LABEL_204;
      }
      if (DLShouldLog())
        goto LABEL_76;
      return;
    case 3:
      v41 = CalDatabaseCopyCalendarItemWithRowID();
      if (v41)
      {
        v40 = (const void *)v41;
        CalRemoveTask();
        if (!DLShouldLog())
          goto LABEL_244;
        goto LABEL_204;
      }
      if (DLShouldLog())
        goto LABEL_76;
      return;
    case 4:
      v42 = CalDatabaseCopyAlarmWithUID();
      if (v42)
      {
        v40 = (const void *)v42;
        v43 = CalAlarmCopyOwningEntity();
        if (v43)
        {
          v44 = (const void *)v43;
          v217[0] = CalCalendarItemGetRowID();
          CalCalendarItemRemoveAlarm();
          if (!DLShouldLog())
            goto LABEL_243;
          goto LABEL_242;
        }
        if (!DLShouldLog())
          goto LABEL_244;
        goto LABEL_204;
      }
      if (DLShouldLog())
        goto LABEL_76;
      return;
    case 5:
      v45 = CalDatabaseCopyRecurrenceWithUID();
      if (v45)
      {
        v40 = (const void *)v45;
        v46 = MEMORY[0x22E2FA514](v45);
        if (v46)
        {
          v44 = (const void *)v46;
          v217[0] = CalCalendarItemGetRowID();
          MEMORY[0x22E2FA40C](v44, v40);
          if (!DLShouldLog())
            goto LABEL_243;
          goto LABEL_242;
        }
        if (!DLShouldLog())
          goto LABEL_244;
        goto LABEL_204;
      }
      if (DLShouldLog())
        goto LABEL_76;
      return;
    case 6:
      if (DLShouldLog())
        goto LABEL_76;
      return;
    case 7:
      v47 = MEMORY[0x22E2FA148](*(_QWORD *)(a3 + 184), *(unsigned int *)&valuePtr[4]);
      if (v47)
      {
        v40 = (const void *)v47;
        v48 = MEMORY[0x22E2F9F50](v47);
        if (!v48)
        {
          if (DLShouldLog())
LABEL_204:
            _DLLog();
          goto LABEL_244;
        }
        v44 = (const void *)v48;
        v49 = _entityTypeForRecord();
        v215 = v49;
        if (v49 == 3)
        {
          if (!DLShouldLog())
          {
LABEL_243:
            CFRelease(v44);
LABEL_244:
            v11 = v40;
            goto LABEL_483;
          }
        }
        else
        {
          if (v49 != 2)
            goto LABEL_243;
          MEMORY[0x22E2FA400](v44, v40);
          if (!DLShouldLog())
            goto LABEL_243;
        }
LABEL_242:
        _DLLog();
        goto LABEL_243;
      }
      if (DLShouldLog())
        goto LABEL_76;
      break;
    case 8:
      if (CalDatabaseCopyCalendarItemWithRowID())
      {
        CalCalendarItemSetOrganizer();
        if (!DLShouldLog())
          return;
      }
      else if (!DLShouldLog())
      {
        return;
      }
      goto LABEL_76;
    default:
      return;
  }
}

void _UpdateCalendarRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t UID;
  CFStringRef v6;
  uint64_t v7;
  CFStringRef v8;

  UID = CalCalendarGetUID();
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 1, UID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
  v7 = CalCalendarGetUID();
  v8 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), v7);
  CalCalendarSetExternalID();
  if (v8)
    CFRelease(v8);
}

void _UpdateEventRemapping(const void *a1, const void *a2, uint64_t a3)
{
  uint64_t RowID;
  CFStringRef v7;
  const __CFDictionary *v8;

  RowID = CalCalendarItemGetRowID();
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 2, RowID);
  _addRemapping(a3, a1, v7);
  v8 = *(const __CFDictionary **)(a3 + 264);
  if (v8 && CFDictionaryContainsKey(v8, a1))
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 264), a1, a2);
  CFRelease(v7);
}

void _UpdateDetachedEvents(void *key, const __CFArray *a2, uint64_t a3)
{
  const void *Value;
  const void *v7;
  CFTypeID v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  CFAbsoluteTime v12;
  CFDateRef v13;
  CFDateRef v14;
  __CFSet *v15;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 264), key);
  if (Value && (v7 = Value, v8 = CFGetTypeID(Value), v8 != CFStringGetTypeID()))
  {
    Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      v10 = Count;
      for (i = 0; i != v10; ++i)
      {
        CFArrayGetValueAtIndex(a2, i);
        if (DLShouldLog())
        {
          CalCalendarItemGetRowID();
          CalCalendarItemGetRowID();
          _DLLog();
        }
        CalEventGetOriginalStartDate();
        v13 = CFDateCreate(0, v12);
        if (v13)
        {
          v14 = v13;
          MEMORY[0x22E2FA34C](v7, v13);
          CFRelease(v14);
        }
        else if (DLShouldLog())
        {
          CalEventGetOriginalStartDate();
          _DLLog();
        }
        CalEventSetOriginalEvent();
      }
    }
    v15 = *(__CFSet **)(a3 + 280);
    if (!v15)
    {
      CFSetCreateMutable(0, 0, MEMORY[0x24BDBD6B8]);
      v15 = (__CFSet *)DLMemoryPoolAddObject();
      *(_QWORD *)(a3 + 280) = v15;
    }
    CFSetAddValue(v15, key);
  }
  else if (DLShouldLog())
  {
    _DLLog();
  }
}

void _RemoveProcessedMainRecordIds(const void *a1, uint64_t a2)
{
  if (DLShouldLog())
    _DLLog();
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 272), a1);
}

void _UpdateOrganizerRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t RowID;
  CFStringRef v6;

  RowID = CalCalendarItemGetRowID();
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 8, RowID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateTaskRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t RowID;
  CFStringRef v6;

  RowID = CalCalendarItemGetRowID();
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 3, RowID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateAlarmRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t UID;
  CFStringRef v6;

  UID = CalAlarmGetUID();
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 4, UID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateRecurrenceRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t UID;
  CFStringRef v6;

  UID = CalRecurrenceGetUID();
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 5, UID);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

void _UpdateAttendeeRemapping(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  CFStringRef v6;

  v5 = MEMORY[0x22E2F9F80](a2);
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("%d/%d"), 7, v5);
  _addRemapping(a3, a1, v6);
  CFRelease(v6);
}

uint64_t _deconstructRecordIdentifier(const __CFString *a1, SInt32 *a2, SInt32 *a3, SInt32 *a4, SInt32 *a5)
{
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v11;
  CFIndex Count;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *ValueAtIndex;
  const __CFString *v17;
  const __CFString *v18;

  if (a5)
    *a5 = -1;
  if (a4)
    *a4 = -1;
  if (a3)
    *a3 = 0;
  if (a2)
    *a2 = 0;
  if (recordIdentifierIsLocal(a1))
  {
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a1, CFSTR("/"));
    if (ArrayBySeparatingStrings)
    {
      v11 = ArrayBySeparatingStrings;
      Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count == 4)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v11, 0);
        if (a2)
          *a2 = CFStringGetIntValue(ValueAtIndex);
        v17 = (const __CFString *)CFArrayGetValueAtIndex(v11, 1);
        if (a3)
          *a3 = CFStringGetIntValue(v17);
        v18 = (const __CFString *)CFArrayGetValueAtIndex(v11, 2);
        if (a4)
          *a4 = CFStringGetIntValue(v18);
        v15 = (const __CFString *)CFArrayGetValueAtIndex(v11, 3);
        if (!a5)
          goto LABEL_28;
      }
      else
      {
        if (Count != 2)
        {
          if (DLShouldLog())
            _DLLog();
          v14 = 0;
          goto LABEL_32;
        }
        v13 = (const __CFString *)CFArrayGetValueAtIndex(v11, 0);
        if (a3)
          *a3 = CFStringGetIntValue(v13);
        v14 = 1;
        v15 = (const __CFString *)CFArrayGetValueAtIndex(v11, 1);
        if (!a5)
        {
LABEL_32:
          CFRelease(v11);
          return v14;
        }
      }
      *a5 = CFStringGetIntValue(v15);
LABEL_28:
      v14 = 1;
      goto LABEL_32;
    }
    if (DLShouldLog())
      _DLLog();
  }
  return 0;
}

uint64_t _CopyParentCalendar(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFArray *Value;
  const __CFArray *v4;
  const __CFString *ValueAtIndex;

  Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("calendar"));
  if (Value && (v4 = Value, CFArrayGetCount(Value) >= 1))
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
    return _CopyCalendarForUIDString(a1, ValueAtIndex);
  }
  else
  {
    if (DLShouldLog())
      _DLLog();
    return 0;
  }
}

uint64_t _CopyCalendarForUIDString(uint64_t a1, const __CFString *key)
{
  const __CFString *v2;
  const __CFDictionary *v3;
  const __CFString *Value;
  int v5;
  uint64_t result;
  uint64_t v7;

  v2 = key;
  v3 = *(const __CFDictionary **)(a1 + 168);
  if (v3)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v3, key);
    if (Value)
      v2 = Value;
  }
  v7 = 0;
  v5 = _deconstructRecordIdentifier(v2, 0, (SInt32 *)&v7, 0, (SInt32 *)&v7 + 1);
  result = 0;
  if (v5 && HIDWORD(v7) != -1)
  {
    if ((_DWORD)v7 == 1)
    {
      result = CalDatabaseCopyCalendarWithUID();
      if (result)
        return result;
      if (!DLShouldLog())
        return 0;
    }
    else if (!DLShouldLog())
    {
      return 0;
    }
    _DLLog();
    return 0;
  }
  return result;
}

uint64_t _CopyCalEntityOwner(uint64_t a1, CFDictionaryRef theDict, SInt32 *a3)
{
  const __CFArray *Value;
  const __CFArray *v6;
  const __CFString *ValueAtIndex;
  const __CFDictionary *v8;
  const __CFString *v9;
  int v10;
  uint64_t result;
  SInt32 v12;

  Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("owner"));
  if (!Value || (v6 = Value, CFArrayGetCount(Value) < 1))
  {
    if (!DLShouldLog())
      return 0;
LABEL_11:
    _DLLog();
    return 0;
  }
  v12 = 0;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
  v8 = *(const __CFDictionary **)(a1 + 168);
  if (v8)
  {
    v9 = (const __CFString *)CFDictionaryGetValue(v8, ValueAtIndex);
    if (v9)
      ValueAtIndex = v9;
  }
  v10 = _deconstructRecordIdentifier(ValueAtIndex, 0, a3, 0, &v12);
  result = 0;
  if (v10 && v12 != -1)
  {
    if ((*a3 & 0xFFFFFFFE) == 2)
      return CalDatabaseCopyCalendarItemWithRowID();
    if (!DLShouldLog())
      return 0;
    goto LABEL_11;
  }
  return result;
}

uint64_t _GetDayOfWeekFromString(const __CFString *a1)
{
  int CharacterAtIndex;

  if (!a1)
    return 7;
  CharacterAtIndex = CFStringGetCharacterAtIndex(a1, 0);
  if (CharacterAtIndex <= 114)
  {
    if (CharacterAtIndex == 102)
      return 5;
    if (CharacterAtIndex == 109)
      return 1;
  }
  else
  {
    switch(CharacterAtIndex)
    {
      case 's':
        if (CFStringGetCharacterAtIndex(a1, 1) == 97)
          return 6;
        else
          return 0;
      case 'w':
        return 3;
      case 't':
        if (CFStringGetCharacterAtIndex(a1, 1) == 117)
          return 2;
        else
          return 4;
    }
  }
  if (DLShouldLog())
    _DLLog();
  return 7;
}

void _addRemapping(uint64_t a1, const void *a2, const void *a3)
{
  if (!*(_QWORD *)(a1 + 160))
  {
    CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(a1 + 160) = DLMemoryPoolAddObject();
  }
  if (DLShouldLog())
    _DLLog();
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 160), a2, a3);
}

const __CFString *dataTypeForDataClassName(const __CFString *result)
{
  const __CFString *v1;

  if (result)
  {
    v1 = result;
    if (CFStringCompare(result, CFSTR("com.apple.Bookmarks"), 0))
    {
      if (CFStringCompare(v1, CFSTR("com.apple.Calendars"), 0))
      {
        if (CFStringCompare(v1, CFSTR("com.apple.Contacts"), 0))
        {
          if (CFStringCompare(v1, CFSTR("com.apple.MailAccounts"), 0))
          {
            if (CFStringCompare(v1, CFSTR("com.apple.Notes"), 0))
              return 0;
            else
              return CFSTR("Notes");
          }
          else
          {
            return CFSTR("Mail Accounts");
          }
        }
        else
        {
          return CFSTR("Contacts");
        }
      }
      else
      {
        return CFSTR("Calendars");
      }
    }
    else
    {
      return CFSTR("Bookmarks");
    }
  }
  return result;
}

const __CFString *dataClassNameForDataType(const __CFString *result)
{
  const __CFString *v1;

  if (result)
  {
    v1 = result;
    if (CFStringCompare(result, CFSTR("Bookmarks"), 0))
    {
      if (CFStringCompare(v1, CFSTR("Calendars"), 0))
      {
        if (CFStringCompare(v1, CFSTR("Contacts"), 0))
        {
          if (CFStringCompare(v1, CFSTR("Mail Accounts"), 0))
          {
            if (CFStringCompare(v1, CFSTR("Notes"), 0))
              return 0;
            else
              return CFSTR("com.apple.Notes");
          }
          else
          {
            return CFSTR("com.apple.MailAccounts");
          }
        }
        else
        {
          return CFSTR("com.apple.Contacts");
        }
      }
      else
      {
        return CFSTR("com.apple.Calendars");
      }
    }
    else
    {
      return CFSTR("com.apple.Bookmarks");
    }
  }
  return result;
}

uint64_t setPlaybackEnabled(char a1)
{
  uint64_t result;

  result = DLShouldLog();
  if ((_DWORD)result)
    result = _DLLog();
  playbackEnabledChecked = 1;
  playbackEnabled = a1;
  return result;
}

BOOL SyncPlaybackEnabled()
{
  _BOOL8 v0;
  Boolean keyExistsAndHasValidFormat;

  if (playbackEnabledChecked == 1)
    return playbackEnabled != 0;
  playbackEnabledChecked = 1;
  keyExistsAndHasValidFormat = 0;
  v0 = CFPreferencesGetAppBooleanValue(CFSTR("SyncPlayback"), CFSTR("com.apple.SyncServices.iPodSync"), &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
  {
    if (DLShouldLog())
      _DLLog();
  }
  else
  {
    v0 = 0;
  }
  playbackEnabled = v0;
  return v0;
}

const __CFString *CreateCleanUuid(const __CFString *a1)
{
  const __CFString *v1;
  CFIndex Length;
  CFIndex v3;
  BOOL v4;
  CFIndex v5;
  CFIndex v6;
  CFStringRef v7;
  CFRange v9;

  v1 = a1;
  if (CFStringHasPrefix(a1, CFSTR("com.apple.syncservices:")))
  {
    Length = CFStringGetLength(v1);
    v3 = CFStringGetLength(CFSTR("com.apple.syncservices:"));
    v4 = Length <= v3;
    v5 = Length - v3;
    if (v4)
    {
      if (DLShouldLog())
        _DLLog();
    }
    else
    {
      v6 = v3;
      if (DLShouldLog())
        _DLLog();
      v9.location = v6;
      v9.length = v5;
      v7 = CFStringCreateWithSubstring(0, v1, v9);
      if (DLShouldLog())
        _DLLog();
      return v7;
    }
  }
  else
  {
    CFRetain(v1);
  }
  return v1;
}

uint64_t recordIdentifierIsLocal(const __CFString *a1)
{
  uint64_t result;
  const char *CStringPtr;
  char buffer[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (CFStringHasPrefix(a1, CFSTR("com.apple.syncservices:")))
    return 0;
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
    return strlen(CStringPtr) < 9 || CStringPtr[8] != 45;
  CStringPtr = buffer;
  result = CFStringGetCString(a1, buffer, 64, 0x8000100u);
  if ((_DWORD)result)
    return strlen(CStringPtr) < 9 || CStringPtr[8] != 45;
  return result;
}

uint64_t BookmarksDataSourceCreator(_QWORD *a1, uint64_t a2, const __CFDictionary *a3)
{
  char *v5;
  const __CFBoolean *Value;
  const __CFBoolean *v7;

  v5 = (char *)malloc_type_calloc(0xE0uLL, 1uLL, 0x1EC0411uLL);
  *a1 = v5;
  *(_QWORD *)v5 = *MEMORY[0x24BDBD270];
  *((_QWORD *)v5 + 1) = CFSTR("~/Library/Safari/com.apple.Bookmarks.lock");
  *((_QWORD *)v5 + 2) = BookmarksDataSourceGetVersionFunction;
  *((_QWORD *)v5 + 3) = BookmarksDataSourceCanSyncWithVersionFunction;
  *((_QWORD *)v5 + 4) = 0;
  *((_QWORD *)v5 + 5) = BookmarksDataSourceRemoveStoreFunction;
  *((_QWORD *)v5 + 6) = BookmarksDataSourceGetSyncTypeAndExchangeSyncAnchors;
  *((_QWORD *)v5 + 7) = BookmarksDataSourceClearSyncAnchors;
  *((_QWORD *)v5 + 8) = BookmarksDataSourceClearAllRecords;
  *((_QWORD *)v5 + 9) = BookmarksDataSourceGetChanges;
  *((_QWORD *)v5 + 10) = BookmarksDataSourceGetAllRecords;
  *((_QWORD *)v5 + 11) = BookmarksDataSourceGetCountOfRecords;
  *((_QWORD *)v5 + 12) = BookmarksDataSourceProcessChanges;
  *((_QWORD *)v5 + 13) = BookmarksDataSourceCommit;
  *((_QWORD *)v5 + 14) = BookmarksDataSourceRollback;
  *((_QWORD *)v5 + 15) = BookmarksDataSourceGetEntityTypeProcessOrder;
  *((_QWORD *)v5 + 16) = BookmarksDataSourceDeleteDataSource;
  *((_QWORD *)v5 + 17) = (id)objc_msgSend(MEMORY[0x24BEC2730], "safariBookmarkCollection");
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *(_OWORD *)(v5 + 204) = 0u;
  if (a3)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a3, CFSTR("ShouldClearHiddenBookmarks"));
    if (Value)
    {
      v7 = Value;
      if (DLShouldLog())
        _DLLog();
      v5[219] = CFBooleanGetValue(v7);
    }
  }
  return 0;
}

uint64_t BookmarksDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3;

  v3 = (CFNumberRef)kBookmarksDataSourceVersion;
  if (!kBookmarksDataSourceVersion)
  {
    v3 = CFNumberCreate(0, kCFNumberIntType, &kDefaultDataSourceVersion);
    kBookmarksDataSourceVersion = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t BookmarksDataSourceCanSyncWithVersionFunction(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = *MEMORY[0x24BDBD268];
  return 0;
}

uint64_t BookmarksDataSourceRemoveStoreFunction(id *a1, uint64_t a2, _QWORD *a3)
{
  BookmarksDataSourceClearAllRecords((uint64_t)a1);
  objc_msgSend(a1[17], "syncSetString:forKey:", 0, CFSTR("ComputerAnchorKey"));
  objc_msgSend(a1[17], "syncSetString:forKey:", 0, CFSTR("BookmarksLastGeneration"));
  return BookmarksDataSourceCommit(a1, a3);
}

uint64_t BookmarksDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, uint64_t a3, const __CFString *a4, CFTypeRef *a5, CFTypeRef *a6, _QWORD *a7)
{
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const void *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;

  *a7 = 0;
  if (a4)
    v11 = a4;
  else
    v11 = CFSTR("Empty-Bookmarks-Anchor");
  *(_QWORD *)(a1 + 200) = CFRetain(v11);
  v12 = (const __CFString *)objc_msgSend(*(id *)(a1 + 136), "syncStringForKey:", CFSTR("ComputerAnchorKey"));
  v13 = v12;
  if (!v12)
    v12 = CFSTR("Unknown-Bookmarks-Anchor");
  *a5 = CFRetain(v12);
  *a6 = CFRetain(CFSTR("Bookmarks-Device-Anchor"));
  v14 = (const void *)objc_msgSend(*(id *)(a1 + 136), "bookmarksDictionary");
  if (!v14)
  {
    v16 = 6;
    do
    {
      v17 = DLShouldLog();
      if (!--v16)
      {
        if (v17)
          _DLLog();
        return 0xFFFFFFFFLL;
      }
      if (v17)
        _DLLog();
      sleep(1u);
      v18 = objc_msgSend(*(id *)(a1 + 136), "bookmarksDictionary");
    }
    while (!v18);
    v14 = (const void *)v18;
    if (v13)
      goto LABEL_8;
LABEL_17:
    *a2 = CFRetain(CFSTR("SDSyncTypeReset"));
    if ((DLShouldLog() & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (!v13)
    goto LABEL_17;
LABEL_8:
  v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 136), "syncStringForKey:", CFSTR("BookmarksLastGeneration")), "integerValue");
  if (v15 == objc_msgSend(*(id *)(a1 + 136), "generation"))
  {
    *a2 = CFRetain(CFSTR("SDSyncTypeFast"));
    if ((DLShouldLog() & 1) == 0)
      goto LABEL_21;
  }
  else
  {
    *a2 = CFRetain(CFSTR("SDSyncTypeSlow"));
    if (!DLShouldLog())
      goto LABEL_21;
  }
LABEL_20:
  _DLLog();
LABEL_21:
  v19 = 5;
  while ((objc_msgSend(*(id *)(a1 + 136), "beginSyncTransaction") & 1) == 0)
  {
    sleep(1u);
    if (!--v19)
      return 0xFFFFFFFFLL;
  }
  *(_QWORD *)(a1 + 144) = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v14, 2uLL);
  if (DLShouldLog())
    _DLLog();
  _initializeMaps(a1);
  return 0;
}

uint64_t BookmarksDataSourceClearSyncAnchors(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 136), "syncSetString:forKey:", 0, CFSTR("ComputerAnchorKey"));
  objc_msgSend(*(id *)(a1 + 136), "syncSetString:forKey:", 0, CFSTR("BookmarksLastGeneration"));
  return 0;
}

uint64_t BookmarksDataSourceClearAllRecords(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  CFNumberRef v6;
  CFMutableArrayRef Mutable;
  __CFDictionary *v8;
  int valuePtr;

  v2 = *(const void **)(a1 + 144);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 144) = 0;
  }
  v3 = *(const void **)(a1 + 152);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 152) = 0;
  }
  v4 = *(const void **)(a1 + 160);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 160) = 0;
  }
  v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 168) = 0;
  }
  valuePtr = 1;
  v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v8 = CFDictionaryCreateMutable(0, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 144) = v8;
  CFDictionarySetValue(v8, CFSTR("Children"), Mutable);
  CFRelease(Mutable);
  CFDictionarySetValue(v8, CFSTR("WebBookmarkType"), CFSTR("WebBookmarkTypeList"));
  CFDictionarySetValue(v8, CFSTR("WebBookmarkFileVersion"), v6);
  CFRelease(v6);
  CFDictionarySetValue(v8, CFSTR("WebBookmarkUUID"), CFSTR("Root"));
  _initializeMaps(a1);
  *(_BYTE *)(a1 + 218) = 1;
  return 0;
}

uint64_t BookmarksDataSourceGetChanges(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _createBookmarksForChildren(a1, *(const __CFDictionary **)(a1 + 144), 0, 0);
  *a2 = 0;
  *a3 = *MEMORY[0x24BDBD268];
  return 0;
}

uint64_t BookmarksDataSourceGetAllRecords(uint64_t a1, CFDictionaryRef *a2, _QWORD *a3)
{
  _createBookmarksForChildren(a1, *(const __CFDictionary **)(a1 + 144), 0, 1);
  *a2 = CFDictionaryCreateCopy(0, *(CFDictionaryRef *)(a1 + 160));
  *a3 = *MEMORY[0x24BDBD268];
  return 0;
}

uint64_t BookmarksDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  *a2 = _getCountOfChildrenForContainer((const __CFDictionary *)objc_msgSend(*(id *)(a1 + 136), "bookmarksDictionary"));
  return 0;
}

uint64_t BookmarksDataSourceProcessChanges(_BYTE *a1, CFDictionaryRef theDict, uint64_t a3, _QWORD *a4)
{
  if (theDict && CFDictionaryGetCount(theDict) >= 1)
  {
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_processRecord, a1);
    a1[218] = 1;
  }
  *a4 = 0;
  return 0;
}

uint64_t BookmarksDataSourceCommit(void *context, _QWORD *a2)
{
  const __CFDictionary *v4;
  const __CFSet *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v8;
  id v9;

  v4 = (const __CFDictionary *)*((_QWORD *)context + 23);
  if (v4 && CFDictionaryGetCount(v4) && DLShouldLog())
  {
    v8 = (id)*((_QWORD *)context + 23);
    _DLLog();
  }
  if (*((_BYTE *)context + 218) != 1)
    goto LABEL_11;
  v5 = (const __CFSet *)*((_QWORD *)context + 22);
  if (v5)
    CFSetApplyFunction(v5, (CFSetApplierFunction)_sortBookmarksForParentUuid, context);
  v9 = 0;
  if (DLShouldLog())
  {
    v8 = (id)*((_QWORD *)context + 18);
    _DLLog();
  }
  if (!objc_msgSend(*((id *)context + 17), "mergeWithBookmarksDictionary:clearHidden:error:", *((_QWORD *)context + 18), *((_BYTE *)context + 219) != 0, &v9, v8))
  {
    *a2 = (id)objc_msgSend(v9, "description");
    if (DLShouldLog())
    {
      v8 = v9;
      _DLLog();
    }
    objc_msgSend(*((id *)context + 17), "rollbackSyncTransaction", v8);
    return 0xFFFFFFFFLL;
  }
  else
  {
LABEL_11:
    objc_msgSend(*((id *)context + 17), "syncSetString:forKey:", *((_QWORD *)context + 25), CFSTR("ComputerAnchorKey"), v8);
    objc_msgSend(*((id *)context + 17), "syncSetString:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(*((id *)context + 17), "generation")), CFSTR("BookmarksLastGeneration"));
    objc_msgSend(*((id *)context + 17), "commitSyncTransaction");
    if (*((_BYTE *)context + 218) == 1)
    {
      if (DLShouldLog())
        _DLLog();
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.bookmarks.BookmarksFileChanged"), 0, 0, 0);
    }
    return 0;
  }
}

uint64_t BookmarksDataSourceRollback(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 136), "rollbackSyncTransaction");
  return 0;
}

uint64_t BookmarksDataSourceGetEntityTypeProcessOrder(uint64_t a1, __CFArray **a2)
{
  __CFArray *Mutable;
  const __CFAllocator *v5;
  const CFArrayCallBacks *v6;
  __CFArray *v7;
  __CFArray *v8;

  Mutable = *(__CFArray **)(a1 + 208);
  if (!Mutable)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v6 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    v7 = CFArrayCreateMutable(v5, 0, v6);
    CFArrayAppendValue(v7, CFSTR("com.apple.bookmarks.Folder"));
    CFArrayAppendValue(Mutable, v7);
    if (v7)
      CFRelease(v7);
    v8 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(v8, CFSTR("com.apple.bookmarks.Bookmark"));
    CFArrayAppendValue(Mutable, v8);
    if (v8)
      CFRelease(v8);
    *(_QWORD *)(a1 + 208) = Mutable;
  }
  *a2 = Mutable;
  return 0;
}

uint64_t BookmarksDataSourceDeleteDataSource(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;

  v2 = *(const void **)(a1 + 144);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 144) = 0;
  }
  v3 = *(const void **)(a1 + 152);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 152) = 0;
  }
  v4 = *(const void **)(a1 + 160);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 160) = 0;
  }
  v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 168) = 0;
  }
  v6 = *(const void **)(a1 + 176);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 176) = 0;
  }
  v7 = *(const void **)(a1 + 184);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(a1 + 184) = 0;
  }
  v8 = *(const void **)(a1 + 192);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a1 + 192) = 0;
  }
  v9 = *(const void **)(a1 + 200);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(a1 + 200) = 0;
  }
  v10 = *(const void **)(a1 + 208);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(a1 + 208) = 0;
  }

  free((void *)a1);
  return 0;
}

void _initializeMaps(uint64_t a1)
{
  const __CFAllocator *v2;
  const CFDictionaryKeyCallBacks *v3;
  const CFDictionaryValueCallBacks *v4;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  *(_QWORD *)(a1 + 152) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 160) = CFDictionaryCreateMutable(v2, 0, v3, v4);
  *(_QWORD *)(a1 + 168) = CFDictionaryCreateMutable(v2, 0, v3, v4);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 152), CFSTR("Root"), *(const void **)(a1 + 144));
}

void _createBookmarksForChildren(uint64_t a1, const __CFDictionary *a2, void *a3, uint64_t a4)
{
  const __CFArray *Value;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  const __CFDictionary *ValueAtIndex;
  const void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFDictionary *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  __CFDictionary *Mutable;
  uint64_t v22;
  CFComparisonResult v23;
  __CFString *v24;
  __CFString *v25;
  unsigned int v26;

  Value = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Children"));
  if (Value)
  {
    v8 = Value;
    Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      v10 = Count;
      v11 = 0;
      v26 = a4;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v11);
        v13 = CFDictionaryGetValue(ValueAtIndex, CFSTR("WebBookmarkUUID"));
        v14 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("WebBookmarkType"));
        if (v13)
        {
          v15 = v14;
          if (v14)
          {
            if (a3)
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 168), v13, a3);
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 152), v13, ValueAtIndex);
            if (CFStringCompare(v15, CFSTR("WebBookmarkTypeLeaf"), 0) == kCFCompareEqualTo)
            {
              if ((_DWORD)a4 != 1)
                goto LABEL_47;
              v16 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("URLString"));
              v17 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("URIDictionary"));
              v18 = v17 ? (const __CFString *)CFDictionaryGetValue(v17, CFSTR("title")) : 0;
              Mutable = CFDictionaryCreateMutable(0, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.bookmarks.Bookmark"));
              v24 = v18 ? (__CFString *)v18 : &stru_24F647E00;
              CFDictionarySetValue(Mutable, CFSTR("name"), v24);
              v25 = v16 ? (__CFString *)v16 : &stru_24F647E00;
              CFDictionarySetValue(Mutable, CFSTR("url"), v25);
              _setParentUUIDAndPosition(Mutable, a3, v11);
              a4 = v26;
              if (!Mutable)
                goto LABEL_47;
LABEL_46:
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 160), v13, Mutable);
              CFRelease(Mutable);
              goto LABEL_47;
            }
            if (CFStringCompare(v15, CFSTR("WebBookmarkTypeList"), 0))
            {
              if (CFStringCompare(v15, CFSTR("WebBookmarkTypeProxy"), 0) == kCFCompareEqualTo
                || !DLShouldLog())
              {
                goto LABEL_47;
              }
LABEL_16:
              _DLLog();
              goto LABEL_47;
            }
            if ((_DWORD)a4 == 1)
            {
              v19 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Title"));
              if (v19)
              {
                v20 = v19;
                Mutable = CFDictionaryCreateMutable(0, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                CFDictionarySetValue(Mutable, CFSTR("com.apple.syncservices.RecordEntityName"), CFSTR("com.apple.bookmarks.Folder"));
                CFDictionarySetValue(Mutable, CFSTR("name"), v20);
                v22 = v11;
                if (!a3)
                {
                  if (*(_BYTE *)(a1 + 216) || CFStringCompare(v20, CFSTR("BookmarksBar"), 0))
                  {
                    v22 = v11;
                    if (!*(_BYTE *)(a1 + 217))
                    {
                      v23 = CFStringCompare(v20, CFSTR("BookmarksMenu"), 0);
                      v22 = v11;
                      if (v23 == kCFCompareEqualTo)
                      {
                        *(_BYTE *)(a1 + 217) = 1;
                        goto LABEL_42;
                      }
                    }
                  }
                  else
                  {
                    *(_BYTE *)(a1 + 216) = 1;
LABEL_42:
                    v22 = -2;
                  }
                }
                _setParentUUIDAndPosition(Mutable, a3, v22);
              }
              else
              {
                if (DLShouldLog())
                  _DLLog();
                Mutable = 0;
              }
              a4 = v26;
            }
            else
            {
              Mutable = 0;
            }
            _createBookmarksForChildren(a1, ValueAtIndex, v13, a4);
            if (Mutable)
              goto LABEL_46;
            goto LABEL_47;
          }
          if (DLShouldLog())
            goto LABEL_16;
        }
        else if (DLShouldLog())
        {
          goto LABEL_16;
        }
LABEL_47:
        ++v11;
      }
      while (v10 != v11);
    }
  }
}

void _setParentUUIDAndPosition(__CFDictionary *a1, void *a2, uint64_t a3)
{
  CFArrayRef v4;
  CFNumberRef v5;
  uint64_t valuePtr;
  void *values[2];

  values[1] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = a3;
  if (a2)
  {
    values[0] = a2;
    v4 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x24BDBD690]);
    CFDictionarySetValue(a1, CFSTR("parent"), v4);
    CFRelease(v4);
  }
  v5 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  CFDictionarySetValue(a1, CFSTR("position"), v5);
  if (v5)
    CFRelease(v5);
}

uint64_t _getCountOfChildrenForContainer(const __CFDictionary *a1)
{
  const __CFString *Value;
  unint64_t v3;
  const __CFString *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  const void *ValueAtIndex;

  if (!a1)
    return 0;
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("WebBookmarkType"));
  if (CFStringCompare(Value, CFSTR("WebBookmarkTypeLeaf"), 0) == kCFCompareEqualTo)
    return 1;
  if (CFStringCompare(Value, CFSTR("WebBookmarkTypeList"), 0))
    return 0;
  v5 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Title"));
  v3 = (unint64_t)v5;
  if (v5)
  {
    if (CFStringCompare(v5, CFSTR("BookmarksBar"), 0))
      v3 = CFStringCompare((CFStringRef)v3, CFSTR("BookmarksMenu"), 0) != kCFCompareEqualTo;
    else
      v3 = 0;
  }
  v6 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Children"));
  if (v6)
  {
    v7 = v6;
    TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        v10 = Count;
        for (i = 0; i != v10; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
          v3 = _getCountOfChildrenForContainer(ValueAtIndex) + v3;
        }
      }
    }
  }
  return v3;
}

void _processRecord(const __CFString *a1, const __CFDictionary *a2, const __CFDictionary **a3)
{
  CFTypeID TypeID;
  const void *v7;
  const __CFDictionary *v8;
  const __CFString *Value;
  const __CFString *v10;
  CFComparisonResult v11;
  const __CFString *v12;
  __CFDictionary *v13;
  const __CFString *v14;
  CFMutableDictionaryRef Mutable;
  const __CFArray *v16;
  const __CFArray *ValueAtIndex;
  __CFSet *v18;
  const __CFString *v19;
  const void *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  __CFString *v23;
  __CFString *v24;
  const __CFDictionary *v25;
  const __CFArray *v26;
  const __CFArray *v27;
  CFIndex Count;
  CFIndex v29;
  CFIndex i;
  const __CFDictionary *v31;
  const void *v32;
  const void *v33;
  void *v34;
  const __CFString *v35;
  __CFString *v36;
  const __CFDictionary *v37;
  void *v38;

  TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    Value = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("com.apple.syncservices.RecordEntityName"));
    if (!Value)
    {
      if (!DLShouldLog())
        return;
LABEL_14:
      _DLLog();
      return;
    }
    v10 = Value;
    v11 = CFStringCompare(Value, CFSTR("com.apple.bookmarks.Bookmark"), 0);
    if (v11)
    {
      if (CFStringCompare(v10, CFSTR("com.apple.bookmarks.Folder"), 0))
      {
        if (!DLShouldLog())
          return;
        goto LABEL_14;
      }
      v12 = CFSTR("WebBookmarkTypeList");
    }
    else
    {
      v12 = CFSTR("WebBookmarkTypeLeaf");
    }
    v13 = (__CFDictionary *)CFDictionaryGetValue(a3[19], a1);
    if (v13)
    {
      v14 = (const __CFString *)CFDictionaryGetValue(a3[21], a1);
      Mutable = v13;
    }
    else
    {
      Mutable = CFDictionaryCreateMutable(0, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(a3[19], a1, Mutable);
      CFRelease(Mutable);
      v14 = 0;
    }
    v16 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("parent"));
    ValueAtIndex = v16;
    if (v16)
    {
      if (CFArrayGetCount(v16) < 1)
        ValueAtIndex = 0;
      else
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    }
    v18 = a3[22];
    if (!v18)
    {
      v18 = CFSetCreateMutable(0, 0, MEMORY[0x24BDBD6B8]);
      a3[22] = v18;
    }
    if (ValueAtIndex)
      v19 = (const __CFString *)ValueAtIndex;
    else
      v19 = CFSTR("Root");
    CFSetAddValue(v18, v19);
    v20 = CFDictionaryGetValue(a2, CFSTR("position"));
    if (v20)
      CFDictionarySetValue(Mutable, CFSTR("position"), v20);
    if (!v13 || v14 == (const __CFString *)ValueAtIndex)
    {
      if (v13)
        goto LABEL_46;
    }
    else
    {
      if (v14 && ValueAtIndex)
      {
        if (CFStringCompare(v14, (CFStringRef)ValueAtIndex, 0) == kCFCompareEqualTo)
        {
LABEL_47:
          CFDictionarySetValue(a3[21], a1, ValueAtIndex);
LABEL_48:
          v23 = (__CFString *)CFDictionaryGetValue(a2, CFSTR("name"));
          v24 = v23;
          if (v11)
          {
            if (!v23)
            {
              if (DLShouldLog())
                _DLLog();
              v24 = CFSTR("Folder");
            }
            CFDictionarySetValue(Mutable, CFSTR("Title"), v24);
            if (!v13
              && (-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("Bookmarks Menu")) & 1) == 0
              && (-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("Bookmarks Bar")) & 1) == 0)
            {
              v25 = a3[23];
              if (v25)
              {
                v26 = (const __CFArray *)CFDictionaryGetValue(v25, a1);
                if (v26)
                {
                  v27 = v26;
                  Count = CFArrayGetCount(v26);
                  if (Count >= 1)
                  {
                    v29 = Count;
                    for (i = 0; i != v29; ++i)
                    {
                      v31 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], a1);
                      v32 = CFArrayGetValueAtIndex(v27, i);
                      v33 = CFDictionaryGetValue(a3[19], v32);
                      if (v33)
                      {
                        _addChild(v31, v33);
                      }
                      else if (DLShouldLog())
                      {
                        _DLLog();
                      }
                    }
                  }
                  CFDictionaryRemoveValue(a3[23], a1);
                }
              }
            }
          }
          else
          {
            v34 = (void *)CFDictionaryGetValue(Mutable, CFSTR("URIDictionary"));
            if (!v34)
            {
              v34 = CFDictionaryCreateMutable(0, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFDictionarySetValue(Mutable, CFSTR("URIDictionary"), v34);
              CFRelease(v34);
            }
            v35 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("url"));
            if (!v35)
            {
              if (DLShouldLog())
                _DLLog();
              v35 = &stru_24F647E00;
            }
            if (v24)
              v36 = v24;
            else
              v36 = (__CFString *)v35;
            CFDictionarySetValue((CFMutableDictionaryRef)v34, &stru_24F647E00, v35);
            CFDictionarySetValue((CFMutableDictionaryRef)v34, CFSTR("title"), v36);
            CFDictionarySetValue(Mutable, CFSTR("URLString"), v35);
          }
          return;
        }
LABEL_40:
        v21 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], v14);
        if (!v21)
          goto LABEL_42;
        goto LABEL_41;
      }
      if (v14)
        goto LABEL_40;
      v21 = a3[18];
      if (v21)
LABEL_41:
        _removeChild(v21, a1);
    }
LABEL_42:
    if (ValueAtIndex)
    {
      v22 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], ValueAtIndex);
      if (v22)
        goto LABEL_44;
    }
    else
    {
      v22 = a3[18];
      if (v22)
      {
LABEL_44:
        _addChild(v22, Mutable);
        if (v13)
          goto LABEL_46;
        goto LABEL_45;
      }
    }
    v37 = a3[23];
    if (!v37)
    {
      v37 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      a3[23] = v37;
    }
    v38 = (void *)CFDictionaryGetValue(v37, ValueAtIndex);
    if (!v38)
    {
      v38 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      CFDictionaryAddValue(a3[23], ValueAtIndex, v38);
      CFRelease(v38);
    }
    CFArrayAppendValue((CFMutableArrayRef)v38, a1);
    if (v13)
    {
LABEL_46:
      if (!ValueAtIndex)
        goto LABEL_48;
      goto LABEL_47;
    }
LABEL_45:
    CFDictionarySetValue(Mutable, CFSTR("WebBookmarkType"), v12);
    CFDictionarySetValue(Mutable, CFSTR("WebBookmarkUUID"), a1);
    goto LABEL_46;
  }
  v7 = CFDictionaryGetValue(a3[21], a1);
  if (v7)
  {
    v8 = (const __CFDictionary *)CFDictionaryGetValue(a3[19], v7);
    if (v8)
    {
LABEL_4:
      _removeChild(v8, a1);
      return;
    }
  }
  else
  {
    v8 = a3[18];
    if (v8)
      goto LABEL_4;
  }
  if (DLShouldLog())
    goto LABEL_14;
}

void _removeChild(const __CFDictionary *a1, const __CFString *a2)
{
  const __CFArray *Value;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v9;

  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Children"));
  if (Value)
  {
    v4 = Value;
    Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      v6 = Count;
      v7 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
        v9 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("WebBookmarkUUID"));
        if (v9)
        {
          if (CFStringCompare(v9, a2, 0) == kCFCompareEqualTo)
            break;
        }
        if (v6 == ++v7)
          return;
      }
      CFArrayRemoveValueAtIndex(v4, v7);
    }
  }
}

void _addChild(const __CFDictionary *a1, const void *a2)
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(a1, CFSTR("Children"));
  if (!Value)
  {
    Value = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    CFDictionarySetValue(a1, CFSTR("Children"), Value);
    CFRelease(Value);
  }
  CFArrayAppendValue((CFMutableArrayRef)Value, a2);
}

void _sortBookmarksForParentUuid(void *key, uint64_t a2)
{
  const __CFDictionary *Value;
  const __CFArray *v3;
  __CFArray *v4;
  uint64_t Count;
  CFIndex i;
  __CFDictionary *ValueAtIndex;
  CFNumberRef v8;
  CFIndex j;
  __CFDictionary *v10;
  CFIndex valuePtr;
  CFRange v12;
  CFRange v13;

  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 152), key);
  if (!Value)
  {
    if (!DLShouldLog())
      return;
LABEL_15:
    _DLLog();
    return;
  }
  v3 = (const __CFArray *)CFDictionaryGetValue(Value, CFSTR("Children"));
  if (!v3)
  {
    if (!DLShouldLog())
      return;
    goto LABEL_15;
  }
  v4 = v3;
  Count = CFArrayGetCount(v3);
  valuePtr = 0;
  if (Count < 1)
  {
    v13.location = 0;
    v13.length = Count;
    CFArraySortValues(v4, v13, (CFComparatorFunction)_childrenSortCallback, 0);
  }
  else
  {
    for (i = 0; i < Count; valuePtr = i)
    {
      ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(v4, i);
      if (!CFDictionaryGetValue(ValueAtIndex, CFSTR("position")))
      {
        v8 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
        CFDictionaryAddValue(ValueAtIndex, CFSTR("position"), v8);
        CFRelease(v8);
      }
      i = valuePtr + 1;
    }
    v12.location = 0;
    v12.length = Count;
    CFArraySortValues(v4, v12, (CFComparatorFunction)_childrenSortCallback, 0);
    valuePtr = 0;
    for (j = 0; j < Count; valuePtr = j)
    {
      v10 = (__CFDictionary *)CFArrayGetValueAtIndex(v4, j);
      CFDictionaryRemoveValue(v10, CFSTR("position"));
      j = valuePtr + 1;
    }
  }
}

CFComparisonResult _childrenSortCallback(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const __CFNumber *Value;
  const __CFNumber *v5;
  uint64_t v6;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  CFComparisonResult v11;
  _BOOL4 v12;
  CFComparisonResult v13;
  _BOOL4 v14;
  const __CFString *v15;
  const __CFDictionary *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFDictionary *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t valuePtr;

  v21 = 0;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("position"));
  v5 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("position"));
  if (Value)
    CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
  if (v5)
  {
    CFNumberGetValue(v5, kCFNumberLongType, &v21);
    v6 = v21;
  }
  else
  {
    v6 = 0;
  }
  if (valuePtr < v6)
    return -1;
  if (valuePtr > v6)
    return 1;
  v8 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("WebBookmarkType"));
  v9 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("WebBookmarkType"));
  v10 = v9;
  if (v8)
  {
    v11 = CFStringCompare(v8, CFSTR("WebBookmarkTypeList"), 0);
    LODWORD(v8) = v11 == kCFCompareEqualTo;
    v12 = v11 != kCFCompareEqualTo;
    if (v10)
    {
LABEL_12:
      v13 = CFStringCompare(v10, CFSTR("WebBookmarkTypeList"), 0);
      LODWORD(v10) = v13 == kCFCompareEqualTo;
      v14 = v13 != kCFCompareEqualTo;
      goto LABEL_15;
    }
  }
  else
  {
    v12 = 1;
    if (v9)
      goto LABEL_12;
  }
  v14 = 1;
LABEL_15:
  if ((v12 | v10) != 1)
    return -1;
  if ((v8 | v14) != 1)
    return 1;
  if ((_DWORD)v8)
  {
    v15 = CFSTR("Title");
    v16 = a1;
  }
  else
  {
    v16 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("URIDictionary"));
    if (!v16)
    {
      v17 = 0;
      if ((_DWORD)v10)
        goto LABEL_22;
      goto LABEL_24;
    }
    v15 = CFSTR("title");
  }
  v17 = (const __CFString *)CFDictionaryGetValue(v16, v15);
  if ((_DWORD)v10)
  {
LABEL_22:
    v18 = CFSTR("Title");
    v19 = a2;
    goto LABEL_26;
  }
LABEL_24:
  v19 = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("URIDictionary"));
  if (v19)
  {
    v18 = CFSTR("title");
LABEL_26:
    v20 = (const __CFString *)CFDictionaryGetValue(v19, v18);
    if (v17)
    {
      if (v20)
        return CFStringCompare(v17, v20, 0);
      return 1;
    }
    return -1;
  }
  if (v17)
    return 1;
  else
    return -1;
}

uint64_t _identityStringWithInfo(void *a1, const __CFString *a2, const __CFString *a3)
{
  const __CFString *v4;
  _QWORD *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  int v10;

  v4 = a2;
  v6 = (_QWORD *)MEMORY[0x24BDB3FD8];
  v7 = CFSTR("@");
  if (a1 && !a2)
  {
    if ((objc_msgSend(a1, "isEqualToString:", *MEMORY[0x24BDB4118]) & 1) != 0
      || objc_msgSend(a1, "isEqualToString:", *v6))
    {
      v4 = &stru_24F647E00;
      v7 = &stru_24F647E00;
    }
    else
    {
      v4 = 0;
      v7 = &stru_24F647E00;
    }
  }
  v8 = objc_msgSend(a1, "isEqualToString:", *v6);
  v9 = CFSTR("smtp.icloud.com");
  if (!v8)
    v9 = a3;
  if (!a1 || v9)
  {
LABEL_13:
    if (!a1)
      return 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "isEqualToString:", *MEMORY[0x24BDB4160]) & 1) != 0)
  {
    v9 = CFSTR("Yahoo");
    goto LABEL_13;
  }
  v10 = objc_msgSend(a1, "isEqualToString:", *MEMORY[0x24BDB4068]);
  v9 = CFSTR("Gmail");
  if (!v10)
    v9 = 0;
LABEL_17:
  if (v4 && v9)
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@%@%@"), a1, v4, v7, v9);
  return 0;
}

uint64_t _bestiCloudUsernameFromEmails(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[6];

  if (objc_msgSend(a1, "rangeOfString:", CFSTR("@")) != 0x7FFFFFFFFFFFFFFFLL)
    return (uint64_t)a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "count"))
  {
    v4 = objc_msgSend((id)objc_msgSend(a1, "lowercaseString"), "stringByAppendingString:", CFSTR("@"));
    if (_bestiCloudUsernameFromEmails_onceToken != -1)
    {
      v7 = v4;
      dispatch_once(&_bestiCloudUsernameFromEmails_onceToken, &__block_literal_global_41);
      v4 = v7;
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___bestiCloudUsernameFromEmails_block_invoke_3;
    v8[3] = &unk_24F645E68;
    v8[4] = v4;
    v8[5] = &__block_literal_global_51;
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "sortedArrayUsingComparator:", v8), "objectAtIndex:", 0);
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "length"))
    return (uint64_t)v5;
  return objc_msgSend(a1, "stringByAppendingString:", CFSTR("@icloud.com"));
}

uint64_t MailAccountsDataSourceCreator(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc_type_calloc(0xB8uLL, 1uLL, 0x665F5F8AuLL);
  *a1 = v2;
  *v2 = *MEMORY[0x24BDBD270];
  v2[2] = MailAccountsDataSourceGetVersionFunction;
  v2[3] = MailAccountsDataSourceCanSyncWithVersionFunction;
  v2[5] = 0;
  v2[6] = MailAccountsDataSourceGetSyncTypeAndExchangeSyncAnchors;
  v2[7] = 0;
  v2[8] = MailAccountsDataSourceClearAllRecords;
  v2[9] = MailAccountsDataSourceGetChanges;
  v2[10] = MailAccountsDataSourceGetAllRecords;
  v2[11] = MailAccountsDataSourceGetCountOfRecords;
  v2[12] = MailAccountsDataSourceProcessChanges;
  v2[13] = MailAccountsDataSourceCommit;
  v2[14] = MailAccountsDataSourceRollback;
  v2[16] = MailAccountsDataSourceDeleteDataSource;
  *((_WORD *)v2 + 68) = 0;
  *((_OWORD *)v2 + 9) = 0u;
  *((_OWORD *)v2 + 10) = 0u;
  v2[22] = objc_alloc_init(MEMORY[0x24BDB4398]);
  return 0;
}

uint64_t MailAccountsDataSourceGetVersionFunction(uint64_t a1, CFTypeRef *a2)
{
  CFNumberRef v3;

  v3 = (CFNumberRef)kMailAccountsDataSourceVersion;
  if (!kMailAccountsDataSourceVersion)
  {
    v3 = CFNumberCreate(0, kCFNumberIntType, &kDefaultDataSourceVersion);
    kMailAccountsDataSourceVersion = (uint64_t)v3;
  }
  *a2 = CFRetain(v3);
  return 0;
}

uint64_t MailAccountsDataSourceCanSyncWithVersionFunction(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = *MEMORY[0x24BDBD268];
  return 0;
}

uint64_t MailAccountsDataSourceGetSyncTypeAndExchangeSyncAnchors(uint64_t a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, CFTypeRef *a5, CFTypeRef *a6)
{
  int v9;
  const __CFString *v10;

  v9 = objc_msgSend(*(id *)(a1 + 176), "hasMailAccountsForSync");
  if (DLShouldLog())
    _DLLog();
  if (v9)
    v10 = CFSTR("SDSyncTypeFast");
  else
    v10 = CFSTR("SDSyncTypeReset");
  *a2 = CFRetain(v10);
  *a5 = CFRetain(CFSTR("MailAccounts-Computer-Anchor"));
  *a6 = CFRetain(CFSTR("MailAccounts-Device-Anchor"));
  return 0;
}

uint64_t MailAccountsDataSourceClearAllRecords()
{
  if (DLShouldLog())
    _DLLog();
  return 0;
}

uint64_t MailAccountsDataSourceGetChanges(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (DLShouldLog())
    _DLLog();
  *a2 = 0;
  *a3 = *MEMORY[0x24BDBD268];
  return 0;
}

uint64_t MailAccountsDataSourceGetAllRecords(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (DLShouldLog())
    _DLLog();
  *a2 = 0;
  *a3 = *MEMORY[0x24BDBD268];
  return 0;
}

uint64_t MailAccountsDataSourceGetCountOfRecords(uint64_t a1, _DWORD *a2)
{
  if (DLShouldLog())
    _DLLog();
  *a2 = 0;
  return 0;
}

uint64_t MailAccountsDataSourceProcessChanges(uint64_t a1, CFDictionaryRef theDict, uint64_t a3, _QWORD *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (theDict && CFDictionaryGetCount(theDict) >= 1)
  {
    if (!*(_QWORD *)(a1 + 144))
    {

      *(_QWORD *)(a1 + 144) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(a1 + 152) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (!*(_BYTE *)(a1 + 136))
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v7 = (void *)objc_msgSend(*(id *)(a1 + 176), "mailAccountsForSync", 0);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
              v13 = objc_msgSend(v12, "syncIdentityString");
              if (v13)
                objc_msgSend(*(id *)(a1 + 144), "setValue:forKey:", objc_msgSend(v12, "identifier"), v13);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v9);
        }
      }
    }
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_processRecord_0, (void *)a1);
    *(_BYTE *)(a1 + 137) = 1;
  }
  *a4 = *(_QWORD *)(a1 + 160);
  return 0;
}

uint64_t MailAccountsDataSourceCommit(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  const void *v13;
  const __CFURL *v14;
  const __CFURL *PathComponent;
  const __CFURL *v16;
  CFStringRef v17;
  int v18;
  int v19;
  int *v20;
  uint64_t v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  UInt8 *v24;
  char *v25;
  id obj;
  _QWORD v27[6];
  _QWORD v28[2];
  uint64_t (*v29)(uint64_t);
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  UInt8 v38[128];
  UInt8 buffer[1024];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 137))
  {
    v2 = dispatch_group_create();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = *(id *)(a1 + 152);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (!v3)
      goto LABEL_22;
    v4 = v3;
    v5 = MEMORY[0x24BDAC760];
    v6 = *(_QWORD *)v35;
    v7 = *MEMORY[0x24BDB3FD8];
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        dispatch_group_enter(v2);
        v28[0] = v5;
        v28[1] = 3221225472;
        v29 = __MailAccountsDataSourceCommit_block_invoke;
        v30 = &unk_24F645EF8;
        v32 = v2;
        v33 = a1;
        v31 = v9;
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "accountType"), "identifier"), "isEqualToString:", v7)&& objc_msgSend(v9, "aa_needsRegistration"))
        {
          if (DLShouldLog())
          {
            v24 = (UInt8 *)objc_msgSend(v9, "identifier");
            _DLLog();
          }
          if (!objc_msgSend(*(id *)(a1 + 176), "aa_primaryAppleAccount", v24))
            objc_msgSend(v9, "aa_setPrimaryAccount:", 1);
          objc_msgSend(v9, "aa_setPrimaryEmailVerified:", 1);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "credential"), "password"), "length"))
          {
            v10 = *(void **)(a1 + 176);
            v27[0] = v5;
            v27[1] = 3221225472;
            v27[2] = __MailAccountsDataSourceCommit_block_invoke_3;
            v27[3] = &unk_24F645F20;
            v27[4] = v9;
            v27[5] = v28;
            objc_msgSend(v10, "aa_updatePropertiesForAppleAccount:completion:", v9, v27);
            goto LABEL_18;
          }
          objc_msgSend(v9, "setAuthenticated:", 0);
        }
        else if (DLShouldLog())
        {
          v24 = (UInt8 *)objc_msgSend(v9, "identifier");
          _DLLog();
        }
        v29((uint64_t)v28);
LABEL_18:
        ++v8;
      }
      while (v4 != v8);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v4 = v11;
      if (!v11)
      {
LABEL_22:
        if (DLShouldLog())
          _DLLog();
        v12 = dispatch_time(0, 120000000000);
        dispatch_group_wait(v2, v12);
        v13 = (const void *)CFCopyHomeDirectoryURLForUser();
        v14 = (const __CFURL *)MEMORY[0x22E2F9E9C](0, "Library/Mail/Accounts.plist.synced", 34, 0, v13);
        CFRelease(v13);
        PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, v14);
        if (PathComponent)
        {
          v16 = PathComponent;
          if (CFURLGetFileSystemRepresentation(PathComponent, 1u, buffer, 1024))
          {
            v17 = CFStringCreateWithCString(0, (const char *)buffer, 0x8000100u);
            if (DLShouldLog())
            {
              v24 = (UInt8 *)v17;
              _DLLog();
            }
            if (v17)
            {
              DLEnsureDirectoryExists();
              CFRelease(v17);
            }
          }
          CFRelease(v16);
        }
        v18 = CFURLGetFileSystemRepresentation(v14, 1u, buffer, 1024);
        if (v14)
          CFRelease(v14);
        if (v18)
        {
          v19 = open((const char *)buffer, 512, 420);
          if (v19 < 0 && DLShouldLog())
          {
            v20 = __error();
            v24 = buffer;
            v25 = strerror(*v20);
            _DLLog();
          }
          close(v19);
        }
        else if (DLShouldLog())
        {
          v24 = 0;
          _DLLog();
        }
        if (DLShouldLog())
          _DLLog();
        v21 = objc_msgSend(CFSTR("~/Library/Mail/AutoFetchEnabled"), "stringByExpandingTildeInPath", v24, v25);
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", v21, 0);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mail.AutoLaunchSettingsChanged"), 0, 0, 0);
        return 0;
      }
    }
  }
  if (DLShouldLog())
    _DLLog();
  return 0;
}

uint64_t MailAccountsDataSourceRollback()
{
  return 0;
}

uint64_t MailAccountsDataSourceDeleteDataSource(id *a1)
{

  free(a1);
  return 0;
}

void *___bestiCloudUsernameFromEmails_block_invoke()
{
  void *result;

  result = &unk_24F64B918;
  _bestiCloudUsernameFromEmails_sAppleDomains = (uint64_t)result;
  return result;
}

uint64_t ___bestiCloudUsernameFromEmails_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)_bestiCloudUsernameFromEmails_sAppleDomains;
  result = objc_msgSend((id)_bestiCloudUsernameFromEmails_sAppleDomains, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(a2, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7)) & 1) != 0)
          return 1;
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

uint64_t ___bestiCloudUsernameFromEmails_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return -1;
  v6 = (void *)objc_msgSend(a2, "lowercaseString");
  v7 = (void *)objc_msgSend(a3, "lowercaseString");
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    return 0;
  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))()
    || !objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(a1 + 32)))
  {
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))()
      || (objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      goto LABEL_13;
    }
    return 1;
  }
  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))()
    || (objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    return -1;
  }
LABEL_13:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)_bestiCloudUsernameFromEmails_sAppleDomains;
  v10 = objc_msgSend((id)_bestiCloudUsernameFromEmails_sAppleDomains, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v8 = 1;
LABEL_15:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
      v15 = objc_msgSend(v6, "hasSuffix:", v14);
      v16 = objc_msgSend(v7, "hasSuffix:", v14);
      if (v15)
        break;
      if ((v16 & 1) != 0)
        return v8;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          goto LABEL_15;
        return objc_msgSend(v6, "compare:", v7);
      }
    }
    if ((v16 & 1) == 0)
      return -1;
  }
  return objc_msgSend(v6, "compare:", v7);
}

void _processRecord_0(const __CFString *a1, void *a2, uint64_t a3)
{
  int v6;
  __CFString *v7;
  CFTypeID TypeID;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __CFString *v39;
  __CFString *CleanUuid;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  CleanUuid = (__CFString *)CreateCleanUuid(a1);
  v6 = DLShouldLog();
  if (CleanUuid == a1)
  {
    if (!v6)
      goto LABEL_7;
    v35 = a1;
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v35 = a1;
    v39 = CleanUuid;
  }
  _DLLog();
LABEL_7:
  if (DLShouldLog())
  {
    v7 = (__CFString *)objc_msgSend(a2, "mutableCopy");
    -[__CFString removeObjectForKey:](v7, "removeObjectForKey:", CFSTR("__Password__"));
    if (DLShouldLog())
    {
      v35 = v7;
      _DLLog();
    }

  }
  TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(a2))
    goto LABEL_12;
  objc_msgSend(*(id *)(a3 + 176), "accountWithIdentifier:", CleanUuid);
  v10 = (void *)_ACAccountTypeForSyncAccountType(objc_msgSend(a2, "objectForKey:", CFSTR("AccountType")));
  v11 = (__CFString *)objc_msgSend(a2, "objectForKey:", CFSTR("Username"));
  v12 = *MEMORY[0x24BDB3FD8];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB3FD8]))
    v11 = (__CFString *)_bestiCloudUsernameFromEmails(v11, (void *)objc_msgSend(a2, "objectForKey:", CFSTR("EmailAddresses")));
  v13 = _identityStringWithInfo(v10, v11, (const __CFString *)objc_msgSend(a2, "objectForKey:", CFSTR("Hostname"), v35, v39));
  if (DLShouldLog())
  {
    v36 = v13;
    _DLLog();
  }
  if (v13)
  {
    v14 = objc_msgSend(*(id *)(a3 + 176), "accountWithIdentifier:", objc_msgSend(*(id *)(a3 + 144), "objectForKey:", v13));
    if (v14)
    {
      v15 = (void *)v14;
      if (DLShouldLog())
      {
        v36 = objc_msgSend(v15, "identifier");
        _DLLog();
      }
      if (DLShouldLog())
      {
        v36 = (uint64_t)CleanUuid;
        _DLLog();
      }
      v16 = objc_msgSend(v15, "identifier", v36);
      if (!v16)
      {
        if (!DLShouldLog())
          goto LABEL_31;
        goto LABEL_30;
      }
      v9 = (void *)v16;
      v17 = *(void **)(a3 + 168);
      if (!v17 || !objc_msgSend(v17, "containsObject:", v9))
      {
        _addRemapping_0(a3, (uint64_t)CleanUuid, (uint64_t)v9);

        v18 = v9;
LABEL_66:
        objc_msgSend(v15, "applySyncProperties:", a2);
        v34 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("__Password__"));
        if (v34)
          objc_msgSend(v15, "setPasswordFromSync:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v34, "bytes")));
        objc_msgSend(*(id *)(a3 + 152), "addObject:", v15);
        goto LABEL_69;
      }
      if (DLShouldLog())
LABEL_30:
        _DLLog();
    }
  }
LABEL_31:
  v19 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("AccountType"), v36);
  if (v19)
  {
    v20 = (uint64_t)v19;
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("iToolsAccount"))
      && (v21 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("AuthenticationScheme"))) != 0
      && !objc_msgSend(v21, "length"))
    {
      if (!DLShouldLog())
        goto LABEL_12;
    }
    else
    {
      v22 = (void *)_ACAccountTypeForSyncAccountType(v20);
      v23 = objc_msgSend(*(id *)(a3 + 176), "accountTypeWithAccountTypeIdentifier:", v22);
      if (v23)
      {
        v24 = (void *)v23;
        if (DLShouldLog())
        {
          v37 = v22;
          _DLLog();
        }
        if (objc_msgSend(v22, "isEqualToString:", v12, v37))
        {
          v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v24);
        }
        else
        {
          v45 = 0;
          if (_syncAccountLoader_onceToken != -1)
            dispatch_once(&_syncAccountLoader_onceToken, &__block_literal_global_130);
          v26 = (void *)objc_msgSend((id)_syncAccountLoader_sSyncAccountLoader, "accountWithAccountTypeIdentifier:error:", v22, &v45);
          if (v45)
          {
            if (DLShouldLog())
            {
              v38 = v45;
              _DLLog();
            }
            v15 = 0;
LABEL_55:
            if (v15)
            {
              objc_msgSend(v15, "setAccountProperty:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL), CFSTR("NumberOfDaysToKeepTrash"));
              v27 = (void *)objc_msgSend(v24, "supportedDataclasses");
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v29; ++i)
                  {
                    if (*(_QWORD *)v42 != v30)
                      objc_enumerationMutation(v27);
                    objc_msgSend(v15, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), v38);
                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
                }
                while (v29);
              }
              v32 = (void *)objc_msgSend(v24, "supportedDataclasses", v38);
              v33 = *MEMORY[0x24BDB45E0];
              if (objc_msgSend(v32, "containsObject:", *MEMORY[0x24BDB45E0]))
                objc_msgSend(v15, "setEnabled:forDataclass:", 1, v33);
              objc_msgSend(v15, "aa_setSyncedAccount:", 1);
              _addRemapping_0(a3, objc_msgSend(v15, "identifier"), (uint64_t)CleanUuid);
              v9 = CleanUuid;
              goto LABEL_66;
            }
LABEL_12:
            v9 = CleanUuid;
LABEL_69:

            return;
          }
          v25 = objc_msgSend(v26, "persistentAccount");
        }
        v15 = (void *)v25;
        goto LABEL_55;
      }
      if (!DLShouldLog())
        goto LABEL_12;
    }
    _DLLog();
    goto LABEL_12;
  }
  if (DLShouldLog())
    _DLLog();

}

uint64_t _addRemapping_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7;
  uint64_t v8;

  if (!*(_QWORD *)(a1 + 160))
    *(_QWORD *)(a1 + 160) = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!*(_QWORD *)(a1 + 168))
    *(_QWORD *)(a1 + 168) = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (DLShouldLog())
  {
    v7 = a2;
    v8 = a3;
    _DLLog();
  }
  objc_msgSend(*(id *)(a1 + 160), "setObject:forKey:", a3, a2, v7, v8);
  return objc_msgSend(*(id *)(a1 + 168), "addObject:", a3);
}

uint64_t _ACAccountTypeForSyncAccountType(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (_ACAccountTypeForSyncAccountType_onceToken != -1)
      dispatch_once(&_ACAccountTypeForSyncAccountType_onceToken, &__block_literal_global_116);
    return objc_msgSend((id)_ACAccountTypeForSyncAccountType_accountTypeForAccountClass, "objectForKey:", v1);
  }
  return result;
}

objc_class *___syncAccountLoader_block_invoke()
{
  objc_class *result;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/Message.framework"))), "load") & 1) == 0)___syncAccountLoader_block_invoke_cold_1();
  result = NSClassFromString(CFSTR("MFAccountLoader"));
  _syncAccountLoader_sSyncAccountLoader = (uint64_t)result;
  return result;
}

void ___calendarSyncAccountLoader_block_invoke_cold_1()
{
  __assert_rtn("_calendarSyncAccountLoader_block_invoke", "CalendarsDataSource.m", 3544, "loadedMessageFramework");
}

void ___syncAccountLoader_block_invoke_cold_1()
{
  __assert_rtn("_syncAccountLoader_block_invoke", "MailAccountsDataSource.m", 501, "loadedMessageFramework");
}

uint64_t ABAccountCreate()
{
  return MEMORY[0x24BE022C0]();
}

uint64_t ABAccountSetIdentifier()
{
  return MEMORY[0x24BE022C8]();
}

BOOL ABAddressBookAddRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x24BE022D0](addressBook, record, error);
}

CFArrayRef ABAddressBookCopyArrayOfAllGroupsInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  return (CFArrayRef)MEMORY[0x24BE022E8](addressBook, source);
}

CFArrayRef ABAddressBookCopyArrayOfAllPeopleInSource(ABAddressBookRef addressBook, ABRecordRef source)
{
  return (CFArrayRef)MEMORY[0x24BE022F8](addressBook, source);
}

uint64_t ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources()
{
  return MEMORY[0x24BE02310]();
}

uint64_t ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier()
{
  return MEMORY[0x24BE02318]();
}

ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef addressBook)
{
  return (ABRecordRef)MEMORY[0x24BE02328](addressBook);
}

uint64_t ABAddressBookCopyLocalSource()
{
  return MEMORY[0x24BE02330]();
}

uint64_t ABAddressBookCopySourceWithAccountAndExternalIdentifiers()
{
  return MEMORY[0x24BE02360]();
}

uint64_t ABAddressBookCopyValue()
{
  return MEMORY[0x24BE02370]();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x24BE02380](options, error);
}

ABRecordRef ABAddressBookGetGroupWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x24BE02388](addressBook, *(_QWORD *)&recordID);
}

uint64_t ABAddressBookGetPersonCountInSource()
{
  return MEMORY[0x24BE02398]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x24BE023A0](addressBook, *(_QWORD *)&recordID);
}

uint64_t ABAddressBookMoveAllRecordsInSourceToSource()
{
  return MEMORY[0x24BE023B8]();
}

uint64_t ABAddressBookProcessAddedRecords()
{
  return MEMORY[0x24BE023C0]();
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x24BE023D8](addressBook, record, error);
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
  MEMORY[0x24BE023E0](addressBook);
}

BOOL ABAddressBookSave(ABAddressBookRef addressBook, CFErrorRef *error)
{
  return MEMORY[0x24BE023E8](addressBook, error);
}

uint64_t ABAddressBookSetAccountForSource()
{
  return MEMORY[0x24BE023F0]();
}

uint64_t ABAddressBookSetDefaultSource()
{
  return MEMORY[0x24BE023F8]();
}

uint64_t ABAddressBookSetIsBackgroundProcess()
{
  return MEMORY[0x24BE02400]();
}

uint64_t ABAddressBookSetValue()
{
  return MEMORY[0x24BE02408]();
}

uint64_t ABChangeHistoryClearChangesUpToSequenceNumberForClient()
{
  return MEMORY[0x24BE02418]();
}

uint64_t ABChangeHistoryGetEntityChangesSinceSequenceNumberForClient()
{
  return MEMORY[0x24BE02428]();
}

uint64_t ABChangeHistoryRegisterClientForSource()
{
  return MEMORY[0x24BE02430]();
}

uint64_t ABChangeHistorySetAddressBookClientIdentifier()
{
  return MEMORY[0x24BE02438]();
}

uint64_t ABChangeHistoryUnregisterClientForSource()
{
  return MEMORY[0x24BE02440]();
}

BOOL ABGroupAddMember(ABRecordRef group, ABRecordRef person, CFErrorRef *error)
{
  return MEMORY[0x24BE02458](group, person, error);
}

uint64_t ABGroupAddSubgroup()
{
  return MEMORY[0x24BE02460]();
}

uint64_t ABGroupCopyArrayOfAllMembersAndSubgroups()
{
  return MEMORY[0x24BE02470]();
}

ABRecordRef ABGroupCreateInSource(ABRecordRef source)
{
  return (ABRecordRef)MEMORY[0x24BE02480](source);
}

BOOL ABGroupRemoveMember(ABRecordRef group, ABRecordRef member, CFErrorRef *error)
{
  return MEMORY[0x24BE02488](group, member, error);
}

BOOL ABMultiValueAddValueAndLabel(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, ABMultiValueIdentifier *outIdentifier)
{
  return MEMORY[0x24BE02490](multiValue, value, label, outIdentifier);
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFStringRef)MEMORY[0x24BE024A0](multiValue, index);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x24BE024A8](multiValue, index);
}

ABMutableMultiValueRef ABMultiValueCreateMutable(ABPropertyType type)
{
  return (ABMutableMultiValueRef)MEMORY[0x24BE024B0](*(_QWORD *)&type);
}

ABMutableMultiValueRef ABMultiValueCreateMutableCopy(ABMultiValueRef multiValue)
{
  return (ABMutableMultiValueRef)MEMORY[0x24BE024B8](multiValue);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x24BE024C0](multiValue);
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x24BE024C8](multiValue, index);
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  return MEMORY[0x24BE024D0](multiValue, *(_QWORD *)&identifier);
}

BOOL ABMultiValueRemoveValueAndLabelAtIndex(ABMutableMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x24BE024D8](multiValue, index);
}

BOOL ABMultiValueReplaceLabelAtIndex(ABMutableMultiValueRef multiValue, CFStringRef label, CFIndex index)
{
  return MEMORY[0x24BE024E0](multiValue, label, index);
}

BOOL ABMultiValueReplaceValueAtIndex(ABMutableMultiValueRef multiValue, CFTypeRef value, CFIndex index)
{
  return MEMORY[0x24BE024E8](multiValue, value, index);
}

uint64_t ABMultiValueSetImmutable()
{
  return MEMORY[0x24BE024F0]();
}

uint64_t ABPersonCopyCompositeName()
{
  return MEMORY[0x24BE02500]();
}

CFDataRef ABPersonCopyImageDataWithFormat(ABRecordRef person, ABPersonImageFormat format)
{
  return (CFDataRef)MEMORY[0x24BE02508](person, *(_QWORD *)&format);
}

uint64_t ABPersonCopySoundIdentifierForMultiValueIdentifier()
{
  return MEMORY[0x24BE02520]();
}

ABRecordRef ABPersonCreateInSource(ABRecordRef source)
{
  return (ABRecordRef)MEMORY[0x24BE02528](source);
}

BOOL ABPersonHasImageData(ABRecordRef person)
{
  return MEMORY[0x24BE02558](person);
}

BOOL ABPersonRemoveImageData(ABRecordRef person, CFErrorRef *error)
{
  return MEMORY[0x24BE02560](person, error);
}

BOOL ABPersonSetImageData(ABRecordRef person, CFDataRef imageData, CFErrorRef *error)
{
  return MEMORY[0x24BE02568](person, imageData, error);
}

uint64_t ABPersonSetImageDataAndCropRect()
{
  return MEMORY[0x24BE02570]();
}

uint64_t ABPersonSetSoundIdentifierForMultiValueIdentifier()
{
  return MEMORY[0x24BE02588]();
}

uint64_t ABProcessAddedImages()
{
  return MEMORY[0x24BE02590]();
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x24BE025A0](record, *(_QWORD *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x24BE025B8](record);
}

ABRecordType ABRecordGetRecordType(ABRecordRef record)
{
  return MEMORY[0x24BE025C0](record);
}

BOOL ABRecordRemoveValue(ABRecordRef record, ABPropertyID property, CFErrorRef *error)
{
  return MEMORY[0x24BE025C8](record, *(_QWORD *)&property, error);
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  return MEMORY[0x24BE025D0](record, *(_QWORD *)&property, value, error);
}

uint64_t ABSourceCreate()
{
  return MEMORY[0x24BE025D8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x24BDBB8A0](theArray, range.location, range.length, comparator, context);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x24BDBBC68]();
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x24BDBBD60](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE50](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x24BDBC098](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x24BDBC420](theSet);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

CFStringRef CFTimeZoneCopyAbbreviation(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x24BDBC750](tz, at);
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC758]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC768](allocator, name, tryAbbrev);
}

CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz)
{
  return (CFStringRef)MEMORY[0x24BDBC778](tz);
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  CFTimeInterval result;

  MEMORY[0x24BDBC780](tz, at);
  return result;
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC830](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x24BDBC840](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x24BE04740]();
}

uint64_t CalAlarmCopyOwningEntity()
{
  return MEMORY[0x24BE12900]();
}

uint64_t CalAlarmGetTriggerDate()
{
  return MEMORY[0x24BE12908]();
}

uint64_t CalAlarmGetTriggerInterval()
{
  return MEMORY[0x24BE12910]();
}

uint64_t CalAlarmGetType()
{
  return MEMORY[0x24BE12918]();
}

uint64_t CalAlarmGetUID()
{
  return MEMORY[0x24BE12920]();
}

uint64_t CalAlarmSetTriggerDate()
{
  return MEMORY[0x24BE12930]();
}

uint64_t CalAlarmSetTriggerInterval()
{
  return MEMORY[0x24BE12938]();
}

uint64_t CalAlarmSetType()
{
  return MEMORY[0x24BE12940]();
}

uint64_t CalAttendeeCopyDisplayName()
{
  return MEMORY[0x24BE129E0]();
}

uint64_t CalAttendeeCopyEmailAddress()
{
  return MEMORY[0x24BE129E8]();
}

uint64_t CalAttendeeCopyOwningEvent()
{
  return MEMORY[0x24BE12A00]();
}

uint64_t CalAttendeeGetRole()
{
  return MEMORY[0x24BE12A20]();
}

uint64_t CalAttendeeGetStatus()
{
  return MEMORY[0x24BE12A28]();
}

uint64_t CalAttendeeGetType()
{
  return MEMORY[0x24BE12A30]();
}

uint64_t CalAttendeeGetUID()
{
  return MEMORY[0x24BE12A38]();
}

uint64_t CalAttendeeSetDisplayName()
{
  return MEMORY[0x24BE12A40]();
}

uint64_t CalAttendeeSetEmailAddress()
{
  return MEMORY[0x24BE12A48]();
}

uint64_t CalAttendeeSetRole()
{
  return MEMORY[0x24BE12A78]();
}

uint64_t CalAttendeeSetStatus()
{
  return MEMORY[0x24BE12A80]();
}

uint64_t CalAttendeeSetType()
{
  return MEMORY[0x24BE12A88]();
}

uint64_t CalCalendarAddEvent()
{
  return MEMORY[0x24BE12AA0]();
}

uint64_t CalCalendarAddTask()
{
  return MEMORY[0x24BE12AA8]();
}

uint64_t CalCalendarCanContainEntityType()
{
  return MEMORY[0x24BE12AB0]();
}

uint64_t CalCalendarCopyTitle()
{
  return MEMORY[0x24BE12B98]();
}

uint64_t CalCalendarCopyType()
{
  return MEMORY[0x24BE12BA0]();
}

uint64_t CalCalendarGetColorComponents()
{
  return MEMORY[0x24BE12BC8]();
}

uint64_t CalCalendarGetSharingStatus()
{
  return MEMORY[0x24BE12BF0]();
}

uint64_t CalCalendarGetUID()
{
  return MEMORY[0x24BE12C08]();
}

uint64_t CalCalendarIsInbox()
{
  return MEMORY[0x24BE12C50]();
}

uint64_t CalCalendarIsNotificationsCollection()
{
  return MEMORY[0x24BE12C68]();
}

uint64_t CalCalendarIsReadOnly()
{
  return MEMORY[0x24BE12C70]();
}

uint64_t CalCalendarIsSubscribed()
{
  return MEMORY[0x24BE12C88]();
}

uint64_t CalCalendarItemAddAlarm()
{
  return MEMORY[0x24BE12C90]();
}

uint64_t CalCalendarItemCopyCalendar()
{
  return MEMORY[0x24BE12CD8]();
}

uint64_t CalCalendarItemGetRowID()
{
  return MEMORY[0x24BE12D78]();
}

uint64_t CalCalendarItemRemoveAlarm()
{
  return MEMORY[0x24BE12DA0]();
}

uint64_t CalCalendarItemSetEndTimeZone()
{
  return MEMORY[0x24BE12E10]();
}

uint64_t CalCalendarItemSetOrganizer()
{
  return MEMORY[0x24BE12E88]();
}

uint64_t CalCalendarItemSetPriority()
{
  return MEMORY[0x24BE12E90]();
}

uint64_t CalCalendarItemSetSummary()
{
  return MEMORY[0x24BE12EB0]();
}

uint64_t CalCalendarSetCanContainEntityType()
{
  return MEMORY[0x24BE12EE8]();
}

uint64_t CalCalendarSetColorComponents()
{
  return MEMORY[0x24BE12EF0]();
}

uint64_t CalCalendarSetDisplayOrder()
{
  return MEMORY[0x24BE12F08]();
}

uint64_t CalCalendarSetExternalID()
{
  return MEMORY[0x24BE12F18]();
}

uint64_t CalCalendarSetReadOnly()
{
  return MEMORY[0x24BE12FC0]();
}

uint64_t CalCalendarSetTitle()
{
  return MEMORY[0x24BE13048]();
}

uint64_t CalCalendarSetType()
{
  return MEMORY[0x24BE13050]();
}

uint64_t CalCopyDefaultTimeZone()
{
  return MEMORY[0x24BE13F08]();
}

uint64_t CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient()
{
  return MEMORY[0x24BE13080]();
}

uint64_t CalDatabaseCopyAlarmChangesInStore()
{
  return MEMORY[0x24BE13098]();
}

uint64_t CalDatabaseCopyAlarmWithUID()
{
  return MEMORY[0x24BE130A0]();
}

uint64_t CalDatabaseCopyAttendeeChangesInStore()
{
  return MEMORY[0x24BE130E8]();
}

uint64_t CalDatabaseCopyAttendeeWithUID()
{
  return MEMORY[0x24BE130F0]();
}

uint64_t CalDatabaseCopyCalendarChangesInStore()
{
  return MEMORY[0x24BE130F8]();
}

uint64_t CalDatabaseCopyCalendarItemWithRowID()
{
  return MEMORY[0x24BE13118]();
}

uint64_t CalDatabaseCopyCalendarWithUID()
{
  return MEMORY[0x24BE13138]();
}

uint64_t CalDatabaseCopyDefaultLocalCalendar()
{
  return MEMORY[0x24BE13148]();
}

uint64_t CalDatabaseCopyEventChangesInStore()
{
  return MEMORY[0x24BE13180]();
}

uint64_t CalDatabaseCopyEventWithUID()
{
  return MEMORY[0x24BE13198]();
}

uint64_t CalDatabaseCopyLocalStore()
{
  return MEMORY[0x24BE131B8]();
}

uint64_t CalDatabaseCopyOfAllAlarmsInStore()
{
  return MEMORY[0x24BE131E0]();
}

uint64_t CalDatabaseCopyOfAllAttendeesInStore()
{
  return MEMORY[0x24BE131F0]();
}

uint64_t CalDatabaseCopyOfAllCalendarsInStore()
{
  return MEMORY[0x24BE131F8]();
}

uint64_t CalDatabaseCopyOfAllEventsInStore()
{
  return MEMORY[0x24BE13210]();
}

uint64_t CalDatabaseCopyOfAllRecurrencesInStore()
{
  return MEMORY[0x24BE13218]();
}

uint64_t CalDatabaseCopyProperty()
{
  return MEMORY[0x24BE13230]();
}

uint64_t CalDatabaseCopyRecurrenceChangesInStore()
{
  return MEMORY[0x24BE13240]();
}

uint64_t CalDatabaseCopyRecurrenceWithUID()
{
  return MEMORY[0x24BE13248]();
}

uint64_t CalDatabaseCopyStoreWithExternalID()
{
  return MEMORY[0x24BE13268]();
}

uint64_t CalDatabaseCopyStoreWithUID()
{
  return MEMORY[0x24BE13270]();
}

uint64_t CalDatabaseCopyTaskChangesInStore()
{
  return MEMORY[0x24BE13280]();
}

uint64_t CalDatabaseCreateAlarm()
{
  return MEMORY[0x24BE132A0]();
}

uint64_t CalDatabaseCreateAttendee()
{
  return MEMORY[0x24BE132B0]();
}

uint64_t CalDatabaseCreateCalendarForEntityType()
{
  return MEMORY[0x24BE132C0]();
}

uint64_t CalDatabaseCreateEvent()
{
  return MEMORY[0x24BE132D0]();
}

uint64_t CalDatabaseCreateOrganizer()
{
  return MEMORY[0x24BE132E8]();
}

uint64_t CalDatabaseCreateRecurrence()
{
  return MEMORY[0x24BE132F0]();
}

uint64_t CalDatabaseCreateStore()
{
  return MEMORY[0x24BE13300]();
}

uint64_t CalDatabaseCreateTask()
{
  return MEMORY[0x24BE13308]();
}

uint64_t CalDatabaseCreateWithOptions()
{
  return MEMORY[0x24BE13320]();
}

uint64_t CalDatabaseGetCountOfCalendarItemsInStore()
{
  return MEMORY[0x24BE13348]();
}

uint64_t CalDatabaseGetCountOfEventsInStore()
{
  return MEMORY[0x24BE13350]();
}

uint64_t CalDatabaseGetCountOfTasksInStore()
{
  return MEMORY[0x24BE13358]();
}

uint64_t CalDatabaseMigrateCalendarsWithEntityType()
{
  return MEMORY[0x24BE13368]();
}

uint64_t CalDatabaseProcessAddedRecords()
{
  return MEMORY[0x24BE13370]();
}

uint64_t CalDatabaseRegisterClientForPersistentChangeTrackingInStore()
{
  return MEMORY[0x24BE13378]();
}

uint64_t CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType()
{
  return MEMORY[0x24BE13388]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x24BE13398]();
}

uint64_t CalDatabaseSaveAndFlushCaches()
{
  return MEMORY[0x24BE133A0]();
}

uint64_t CalDatabaseSetClientIdentifier()
{
  return MEMORY[0x24BE133B0]();
}

uint64_t CalDatabaseSetProperty()
{
  return MEMORY[0x24BE133B8]();
}

uint64_t CalDatabaseWaitForSpotlight()
{
  return MEMORY[0x24BE133D0]();
}

uint64_t CalDateTimeRelease()
{
  return MEMORY[0x24BE13F20]();
}

uint64_t CalEntityGetType()
{
  return MEMORY[0x24BE133F0]();
}

uint64_t CalEventAddAttendee()
{
  return MEMORY[0x24BE13460]();
}

uint64_t CalEventAddExceptionDate()
{
  return MEMORY[0x24BE13478]();
}

uint64_t CalEventAddRecurrenceDirectly()
{
  return MEMORY[0x24BE13488]();
}

uint64_t CalEventCopyCalendar()
{
  return MEMORY[0x24BE13498]();
}

uint64_t CalEventCopyDescription()
{
  return MEMORY[0x24BE134A0]();
}

uint64_t CalEventCopyLocation_Deprecated()
{
  return MEMORY[0x24BE134C0]();
}

uint64_t CalEventCopyNonDetachedExceptionDates()
{
  return MEMORY[0x24BE134D0]();
}

uint64_t CalEventCopyOrganizer()
{
  return MEMORY[0x24BE134D8]();
}

uint64_t CalEventCopyOriginalEvent()
{
  return MEMORY[0x24BE134E0]();
}

uint64_t CalEventCopyStartDate()
{
  return MEMORY[0x24BE134F8]();
}

uint64_t CalEventCopySummary()
{
  return MEMORY[0x24BE13500]();
}

uint64_t CalEventCopyURL()
{
  return MEMORY[0x24BE13508]();
}

uint64_t CalEventGetEndDate()
{
  return MEMORY[0x24BE13528]();
}

uint64_t CalEventGetOriginalStartDate()
{
  return MEMORY[0x24BE13558]();
}

uint64_t CalEventGetUID()
{
  return MEMORY[0x24BE13588]();
}

uint64_t CalEventIsAllDay()
{
  return MEMORY[0x24BE13590]();
}

uint64_t CalEventRemoveAttendee()
{
  return MEMORY[0x24BE135C8]();
}

uint64_t CalEventRemoveRecurrenceDirectly()
{
  return MEMORY[0x24BE135E0]();
}

uint64_t CalEventSetAllDay()
{
  return MEMORY[0x24BE135E8]();
}

uint64_t CalEventSetDescription()
{
  return MEMORY[0x24BE135F8]();
}

uint64_t CalEventSetEndDate()
{
  return MEMORY[0x24BE13608]();
}

uint64_t CalEventSetLocation_Deprecated()
{
  return MEMORY[0x24BE13630]();
}

uint64_t CalEventSetNonDetachedExceptionDates()
{
  return MEMORY[0x24BE13640]();
}

uint64_t CalEventSetOrganizer()
{
  return MEMORY[0x24BE13648]();
}

uint64_t CalEventSetOriginalEvent()
{
  return MEMORY[0x24BE13650]();
}

uint64_t CalEventSetOriginalStartDate()
{
  return MEMORY[0x24BE13658]();
}

uint64_t CalEventSetStartDateDirectly()
{
  return MEMORY[0x24BE13678]();
}

uint64_t CalEventSetSummary()
{
  return MEMORY[0x24BE13680]();
}

uint64_t CalEventSetURL()
{
  return MEMORY[0x24BE13688]();
}

uint64_t CalOrganizerCopyDisplayName()
{
  return MEMORY[0x24BE13700]();
}

uint64_t CalOrganizerCopyEmailAddress()
{
  return MEMORY[0x24BE13708]();
}

uint64_t CalOrganizerSetDisplayName()
{
  return MEMORY[0x24BE13710]();
}

uint64_t CalOrganizerSetEmailAddress()
{
  return MEMORY[0x24BE13718]();
}

uint64_t CalOrganizerSetIsSelf()
{
  return MEMORY[0x24BE13720]();
}

uint64_t CalRecurrenceCopyByDayDays()
{
  return MEMORY[0x24BE13750]();
}

uint64_t CalRecurrenceCopyByMonthDayDays()
{
  return MEMORY[0x24BE13758]();
}

uint64_t CalRecurrenceCopyBySetPos()
{
  return MEMORY[0x24BE13760]();
}

uint64_t CalRecurrenceCopyByWeekWeeks()
{
  return MEMORY[0x24BE13768]();
}

uint64_t CalRecurrenceCopyByYearDayDays()
{
  return MEMORY[0x24BE13770]();
}

uint64_t CalRecurrenceCopyOwningEvent()
{
  return MEMORY[0x24BE13778]();
}

uint64_t CalRecurrenceGetByMonthMonths()
{
  return MEMORY[0x24BE13780]();
}

uint64_t CalRecurrenceGetCount()
{
  return MEMORY[0x24BE13788]();
}

uint64_t CalRecurrenceGetEndDate()
{
  return MEMORY[0x24BE13790]();
}

uint64_t CalRecurrenceGetFrequency()
{
  return MEMORY[0x24BE13798]();
}

uint64_t CalRecurrenceGetInterval()
{
  return MEMORY[0x24BE137A0]();
}

uint64_t CalRecurrenceGetUID()
{
  return MEMORY[0x24BE137A8]();
}

uint64_t CalRecurrenceGetWeekStartDirectly()
{
  return MEMORY[0x24BE137B8]();
}

uint64_t CalRecurrenceSetByDayDays()
{
  return MEMORY[0x24BE137C0]();
}

uint64_t CalRecurrenceSetByMonthDayDays()
{
  return MEMORY[0x24BE137C8]();
}

uint64_t CalRecurrenceSetByMonthMonths()
{
  return MEMORY[0x24BE137D0]();
}

uint64_t CalRecurrenceSetBySetPos()
{
  return MEMORY[0x24BE137D8]();
}

uint64_t CalRecurrenceSetByWeekWeeks()
{
  return MEMORY[0x24BE137E0]();
}

uint64_t CalRecurrenceSetByYearDayDays()
{
  return MEMORY[0x24BE137E8]();
}

uint64_t CalRecurrenceSetCount()
{
  return MEMORY[0x24BE137F0]();
}

uint64_t CalRecurrenceSetEndDate()
{
  return MEMORY[0x24BE137F8]();
}

uint64_t CalRecurrenceSetFrequency()
{
  return MEMORY[0x24BE13800]();
}

uint64_t CalRecurrenceSetInterval()
{
  return MEMORY[0x24BE13808]();
}

uint64_t CalRecurrenceSetWeekStart()
{
  return MEMORY[0x24BE13810]();
}

uint64_t CalRemoveCalendar()
{
  return MEMORY[0x24BE13818]();
}

uint64_t CalRemoveEvent()
{
  return MEMORY[0x24BE13828]();
}

uint64_t CalRemoveStore()
{
  return MEMORY[0x24BE13848]();
}

uint64_t CalRemoveTask()
{
  return MEMORY[0x24BE13850]();
}

uint64_t CalStoreAddCalendar()
{
  return MEMORY[0x24BE138C8]();
}

uint64_t CalStoreCopyCalendars()
{
  return MEMORY[0x24BE13900]();
}

uint64_t CalStoreCopyExternalID()
{
  return MEMORY[0x24BE13920]();
}

uint64_t CalStoreGetType()
{
  return MEMORY[0x24BE13988]();
}

uint64_t CalStoreGetUID()
{
  return MEMORY[0x24BE13990]();
}

uint64_t CalStoreMigrateToStore()
{
  return MEMORY[0x24BE139A8]();
}

uint64_t CalStoreSetAllowsEvents()
{
  return MEMORY[0x24BE13A20]();
}

uint64_t CalStoreSetExternalID()
{
  return MEMORY[0x24BE13A78]();
}

uint64_t CalStoreSetName()
{
  return MEMORY[0x24BE13A90]();
}

uint64_t CalStoreSetType()
{
  return MEMORY[0x24BE13BD0]();
}

uint64_t CalTaskSetCompletionDate()
{
  return MEMORY[0x24BE13CB8]();
}

uint64_t CalTaskSetDueDate()
{
  return MEMORY[0x24BE13CC0]();
}

uint64_t DLEnsureDirectoryExists()
{
  return MEMORY[0x24BE670C0]();
}

uint64_t DLMemoryPoolAddObject()
{
  return MEMORY[0x24BE670C8]();
}

uint64_t DLMemoryPoolCreate()
{
  return MEMORY[0x24BE670D0]();
}

uint64_t DLSetStatus()
{
  return MEMORY[0x24BE670D8]();
}

uint64_t DLShouldLog()
{
  return MEMORY[0x24BE670E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t _DLLog()
{
  return MEMORY[0x24BE670E8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

