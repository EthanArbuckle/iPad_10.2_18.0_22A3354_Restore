@implementation ABFavoritesListManager

+ (id)sharedInstance
{
  return +[ABFavoritesListManager sharedInstanceWithAddressBook:](ABFavoritesListManager, "sharedInstanceWithAddressBook:", 0);
}

+ (id)sharedInstanceWithAddressBook:(void *)a3
{
  id result;

  result = (id)sharedInstanceWithAddressBook____SpeedDialListManager;
  if (!sharedInstanceWithAddressBook____SpeedDialListManager)
  {
    result = -[ABFavoritesListManager initWithAddressBook:]([ABFavoritesListManager alloc], "initWithAddressBook:", a3);
    sharedInstanceWithAddressBook____SpeedDialListManager = (uint64_t)result;
  }
  return result;
}

- (void)reportFavoritesIssue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  ABDiagnosticsEnabled();
  _ABLog2(3, (uint64_t)"-[ABFavoritesListManager reportFavoritesIssue:]", 68, 0, (uint64_t)CFSTR("%@"), v4, v5, v6, (uint64_t)a3);
  ABLogSimulateCrashReport((uint64_t)a3);
  ABLogDisplayInternalAlert((uint64_t)a3);
}

- (BOOL)shouldNotReportFavoritesError:(id)a3
{
  void *v4;
  uint64_t v5;
  int v6;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "domain");
    v5 = *MEMORY[0x1E0CB28A8];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && objc_msgSend(a3, "code") == 260)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v6 = objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", v5);
      if (v6)
        LOBYTE(v6) = objc_msgSend(a3, "code") == 257;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_loadListWithAddressBook:(void *)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  ABFavoritesEntry *v21;
  ABFavoritesEntry *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[4];
  id v28;
  id location;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D13A10], "sharedInstance"), "isUnlockedSinceBoot") & 1) != 0)
  {
    if (a3)
    {
      v5 = 0;
    }
    else
    {
      a3 = (void *)ABAddressBookCreateWithOptions(0, 0);
      v5 = a3;
      if (!a3)
        return;
    }
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
    {
      location = 0;
      v9 = (void *)objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Preferences"));
      if ((_SpeedDialPath__checkedForDir & 1) == 0)
      {
        v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        if ((objc_msgSend(v10, "fileExistsAtPath:", v9) & 1) == 0)
        {
          v11 = (void *)objc_msgSend(v9, "stringByDeletingLastPathComponent");
          if ((objc_msgSend(v10, "fileExistsAtPath:", v11) & 1) == 0)
            mkdir((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0x1C0u);
          mkdir((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0x1C0u);
        }
        _SpeedDialPath__checkedForDir = 1;
      }
      v12 = objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("com.apple.mobilephone.speeddial.plist"));
      v13 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfURL:error:", v13, &location);
      if (v14)
      {
        ABDiagnosticsEnabled();
        objc_msgSend(v14, "count");
        _ABLog2(4, (uint64_t)"-[ABFavoritesListManager _loadListWithAddressBook:]", 109, 0, (uint64_t)CFSTR("Read favorites file %@, count = %ld"), v15, v16, v17, v12);
        v18 = objc_msgSend(v14, "count");
        if (v18)
        {
          v19 = v18;
          v20 = 0;
          self->_list = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 50);
          do
          {
            v21 = -[ABFavoritesEntry initWithDictionaryRepresentation:addressBook:]([ABFavoritesEntry alloc], "initWithDictionaryRepresentation:addressBook:", objc_msgSend(v14, "objectAtIndex:", v20), a3);
            if (v21)
            {
              v22 = v21;
              -[NSMutableArray addObject:](self->_list, "addObject:", v21);
              -[ABFavoritesListManager _addEntryToMap:](self, "_addEntryToMap:", v22);

            }
            ++v20;
          }
          while (v19 != v20);
          -[ABFavoritesListManager recacheIdentitiesSoon](self, "recacheIdentitiesSoon");
        }
        *(_DWORD *)&self->_flags &= ~4u;
      }
      else if (-[ABFavoritesListManager shouldNotReportFavoritesError:](self, "shouldNotReportFavoritesError:", location))
      {
        ABDiagnosticsEnabled();
        v26 = (const __CFString *)location;
        if (!location)
          v26 = CFSTR("no error returned");
        _ABLog2(4, (uint64_t)"-[ABFavoritesListManager _loadListWithAddressBook:]", 112, 0, (uint64_t)CFSTR("Error reading favorites file, error: %@"), v23, v24, v25, (uint64_t)v26);
      }
      else
      {
        -[ABFavoritesListManager reportFavoritesIssue:](self, "reportFavoritesIssue:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error reading favorites file. Add a favorite as workaround. Please open a radar to PEP Contacts (New Bugs).\n\n%@"), location));
      }

    }
    if (v5)
      CFRelease(v5);
  }
  else
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
    v7 = ABOSLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ABFavoritesListManager _loadListWithAddressBook:].cold.1(v6, v7);
    objc_initWeak(&location, self);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0D13A10], "sharedInstance");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __51__ABFavoritesListManager__loadListWithAddressBook___block_invoke;
    v27[3] = &unk_1E3CA4298;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v8, "addUnlockHandlerWithIdentifier:block:", CFSTR("ABFavoriteListManager"), v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

uint64_t __51__ABFavoritesListManager__loadListWithAddressBook___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_postChangeNotification");
}

- (void)_loadList
{
  -[ABFavoritesListManager _loadListWithAddressBook:](self, "_loadListWithAddressBook:", self->_addressBook);
}

- (ABFavoritesListManager)initWithAddressBook:(void *)a3
{
  ABFavoritesListManager *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABFavoritesListManager;
  v4 = -[ABFavoritesListManager init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v4->_addressBook = (void *)CFRetain(a3);
    -[ABFavoritesListManager _loadListWithAddressBook:](v4, "_loadListWithAddressBook:", a3);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__entryIdentityChanged_, CFSTR("CNFavoritesEntryChangedNotification"), 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_SpeedDialListChangedExternally, CFSTR("CNFavoritesChangedExternallyNotification"), 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFDictionary *uidToEntry;
  void *addressBook;
  objc_super v6;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CNFavoritesChangedExternallyNotification"), 0);
  uidToEntry = self->_uidToEntry;
  if (uidToEntry)
    CFRelease(uidToEntry);

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D13A10], "sharedInstance"), "removeUnlockHandlerWithIdentifier:", CFSTR("ABFavoriteListManager"));
  v6.receiver = self;
  v6.super_class = (Class)ABFavoritesListManager;
  -[ABFavoritesListManager dealloc](&v6, sel_dealloc);
}

- (void)_scheduleSave
{
  *(_DWORD *)&self->_flags |= 1u;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_save, 0);
  -[ABFavoritesListManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_save, 0, 5.0);
}

- (id)entries
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    -[ABFavoritesListManager _loadList](self, "_loadList");
  return self->_list;
}

- (BOOL)isFull
{
  NSMutableArray *list;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
    -[ABFavoritesListManager _loadList](self, "_loadList");
  list = self->_list;
  if (list)
    LOBYTE(list) = (unint64_t)-[NSMutableArray count](list, "count") > 0x31;
  return (char)list;
}

- (id)entriesForPeople:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  __CFDictionary *uidToEntry;
  ABRecordID RecordID;
  const void *Value;
  const void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    -[ABFavoritesListManager _loadList](self, "_loadList");
  if (!self->_uidToEntry)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(a3);
      uidToEntry = self->_uidToEntry;
      RecordID = ABRecordGetRecordID(*(ABRecordRef *)(*((_QWORD *)&v15 + 1) + 8 * i));
      Value = CFDictionaryGetValue(uidToEntry, (const void *)RecordID);
      if (Value)
      {
        v13 = Value;
        if (!v7)
          v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "addObjectsFromArray:", v13);
        else
          objc_msgSend(v7, "addObject:", v13);
      }
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v6);
  return v7;
}

- (id)entriesForPerson:(void *)a3
{
  if (a3)
    return -[ABFavoritesListManager entriesForPeople:](self, "entriesForPeople:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:"));
  else
    return 0;
}

- (BOOL)_isValueForEntry:(id)a3 equalToValue:(id)a4
{
  if ((objc_msgSend(a4, "isEqualToString:", objc_msgSend(a3, "value")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "property") == kABPersonPhoneProperty)
    return objc_msgSend(+[ABPhoneFormatting abNormalizedPhoneNumberFromString:](ABPhoneFormatting, "abNormalizedPhoneNumberFromString:", objc_msgSend(a3, "value")), "isEqualToString:", +[ABPhoneFormatting abNormalizedPhoneNumberFromString:](ABPhoneFormatting, "abNormalizedPhoneNumberFromString:", a4));
  return 0;
}

- (id)entryFromEntries:(id)a3 type:(int)a4 property:(int)a5 identifier:(int)a6 value:(id)a7 label:(id)a8
{
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;

  v15 = objc_msgSend(a3, "count");
  if (!v15)
    return 0;
  v16 = v15;
  v17 = 1;
  do
  {
    v18 = (void *)objc_msgSend(a3, "objectAtIndex:", v17 - 1);
    v19 = v18;
    if (a6 != -1 && objc_msgSend(v18, "identifier") != a6
      || a4 != 3 && objc_msgSend(v19, "type") != a4
      || a5 != -1 && objc_msgSend(v19, "property") != a5
      || a7
      && (!-[ABFavoritesListManager _isValueForEntry:equalToValue:](self, "_isValueForEntry:equalToValue:", v19, a7)
       || a8 && !objc_msgSend(a8, "isEqualToString:", objc_msgSend(v19, "nonLocalizedLabel"))))
    {
      v19 = 0;
    }
    if (v17 >= v16)
      break;
    ++v17;
  }
  while (!v19);
  return v19;
}

- (id)entryFromEntries:(id)a3 type:(int)a4 property:(int)a5 value:(id)a6 label:(id)a7
{
  return -[ABFavoritesListManager entryFromEntries:type:property:identifier:value:label:](self, "entryFromEntries:type:property:identifier:value:label:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0xFFFFFFFFLL, a6, a7);
}

- (id)entryWithType:(int)a3 forPerson:(void *)a4 property:(int)a5 identifier:(int)a6
{
  return -[ABFavoritesListManager entryFromEntries:type:property:identifier:value:label:](self, "entryFromEntries:type:property:identifier:value:label:", -[ABFavoritesListManager entriesForPerson:](self, "entriesForPerson:", a4), *(_QWORD *)&a3, *(_QWORD *)&a5, *(_QWORD *)&a6, 0, 0);
}

- (id)entryWithIdentifier:(int)a3 forPerson:(void *)a4
{
  return -[ABFavoritesListManager entryWithType:forPerson:property:identifier:](self, "entryWithType:forPerson:property:identifier:", 0, a4, 0xFFFFFFFFLL, *(_QWORD *)&a3);
}

- (BOOL)containsEntryWithIdentifier:(int)a3 forPerson:(void *)a4
{
  return -[ABFavoritesListManager entryWithIdentifier:forPerson:](self, "entryWithIdentifier:forPerson:", *(_QWORD *)&a3, a4) != 0;
}

- (BOOL)containsEntryWithType:(int)a3 forPerson:(void *)a4 property:(int)a5 identifier:(int)a6
{
  return -[ABFavoritesListManager entryWithType:forPerson:property:identifier:](self, "entryWithType:forPerson:property:identifier:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6) != 0;
}

- (BOOL)addEntryForPerson:(void *)a3 property:(int)a4 withIdentifier:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  ABFavoritesEntry *v9;
  ABFavoritesEntry *v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  if (-[ABFavoritesListManager isFull](self, "isFull"))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = -[ABFavoritesEntry initWithPerson:property:identifier:]([ABFavoritesEntry alloc], "initWithPerson:property:identifier:", a3, v6, v5);
    if (v9)
    {
      v10 = v9;
      -[ABFavoritesListManager addEntry:](self, "addEntry:", v9);

      LOBYTE(v9) = 1;
    }
  }
  return (char)v9;
}

- (void)_addEntryToMap:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  __CFDictionary *uidToEntry;
  void *Value;
  void *v9;
  __CFDictionary *v10;
  unint64_t v11;
  void *v12;
  __CFDictionary *Mutable;
  unint64_t v14;
  id v15;

  v5 = objc_msgSend(a3, "_abUid");
  if ((v5 & 0x80000000) != 0)
    return;
  v6 = v5;
  uidToEntry = self->_uidToEntry;
  if (!uidToEntry)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 50, 0, MEMORY[0x1E0C9B3A0]);
    self->_uidToEntry = Mutable;
    v14 = v6;
LABEL_9:
    CFDictionarySetValue(Mutable, (const void *)v14, a3);
    return;
  }
  Value = (void *)CFDictionaryGetValue(uidToEntry, (const void *)v6);
  if (!Value)
  {
    Mutable = self->_uidToEntry;
    v14 = v6;
    goto LABEL_9;
  }
  v9 = Value;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (id)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v15, "addObject:", a3);
    v10 = self->_uidToEntry;
    v11 = v6;
    v12 = v15;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v9, a3, 0);
    v15 = v12;
    v10 = self->_uidToEntry;
    v11 = v6;
  }
  CFDictionarySetValue(v10, (const void *)v11, v12);

}

- (void)_removeEntryFromMap:(id)a3 withUid:(int)a4
{
  __CFDictionary *uidToEntry;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *value;

  if ((a4 & 0x80000000) == 0)
  {
    uidToEntry = self->_uidToEntry;
    if (uidToEntry)
    {
      v7 = a4;
      v8 = (void *)CFDictionaryGetValue(uidToEntry, (const void *)a4);
      if (v8)
      {
        v9 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_12:
          CFDictionaryRemoveValue(self->_uidToEntry, (const void *)v7);
          return;
        }
        v10 = objc_msgSend(v9, "count");
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          while ((id)objc_msgSend(v9, "objectAtIndex:", v12) != a3)
          {
            if (v11 == ++v12)
              return;
          }
          if (v11 == 2)
          {
            CFDictionarySetValue(self->_uidToEntry, (const void *)v7, (const void *)objc_msgSend(v9, "objectAtIndex:", v12 == 0));
          }
          else
          {
            if (v11 == 1)
              goto LABEL_12;
            value = (void *)objc_msgSend(v9, "mutableCopy");
            objc_msgSend(value, "removeObjectAtIndex:", v12);
            CFDictionarySetValue(self->_uidToEntry, (const void *)v7, value);

          }
        }
      }
    }
  }
}

- (void)saveImmediately
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  ABDiagnosticsEnabled();
  _ABLog2(4, (uint64_t)"-[ABFavoritesListManager saveImmediately]", 345, 0, (uint64_t)CFSTR("must save changes with CNFavorites"), v2, v3, v4, v5);
}

- (void)_entryIdentityChanged:(id)a3
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "object");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("CNFavoritesEntryOldIdentityKey"));
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_msgSend(v6, "intValue");
    if ((v8 & 0x80000000) == 0)
      -[ABFavoritesListManager _removeEntryFromMap:withUid:](self, "_removeEntryFromMap:withUid:", v5, v8);
    -[ABFavoritesListManager _addEntryToMap:](self, "_addEntryToMap:", v5);
  }
  -[ABFavoritesListManager _scheduleSave](self, "_scheduleSave");
}

- (void)_postChangeNotification
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("CNFavoritesChangedNotification"), self);
}

- (void)_listChangedExternally
{
  $9D67FB5E984A81712D1153695448EFC9 flags;
  __CFDictionary *uidToEntry;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    self->_flags = ($9D67FB5E984A81712D1153695448EFC9)(*(_DWORD *)&flags & 0xFFFFFFFD);
  }
  else if ((*(_BYTE *)&flags & 4) == 0)
  {

    self->_list = 0;
    uidToEntry = self->_uidToEntry;
    if (uidToEntry)
      CFRelease(uidToEntry);
    self->_uidToEntry = 0;
    *(_DWORD *)&self->_flags |= 4u;
    -[ABFavoritesListManager _postChangeNotification](self, "_postChangeNotification");
  }
}

- (void)addEntry:(id)a3
{
  NSMutableArray *list;
  unint64_t v6;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
    -[ABFavoritesListManager _loadList](self, "_loadList");
  list = self->_list;
  if (!list)
  {
    list = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 50);
    self->_list = list;
  }
  v6 = -[NSMutableArray count](list, "count");
  if (a3)
  {
    if (v6 <= 0x31)
    {
      -[NSMutableArray addObject:](self->_list, "addObject:", a3);
      -[ABFavoritesListManager _addEntryToMap:](self, "_addEntryToMap:", a3);
      -[ABFavoritesListManager _postChangeNotification](self, "_postChangeNotification");
      -[ABFavoritesListManager _scheduleSave](self, "_scheduleSave");
    }
  }
}

- (void)removeEntryAtIndex:(int64_t)a3
{
  void *v5;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
    -[ABFavoritesListManager _loadList](self, "_loadList");
  v5 = (void *)-[NSMutableArray objectAtIndex:](self->_list, "objectAtIndex:", a3);
  -[ABFavoritesListManager _removeEntryFromMap:withUid:](self, "_removeEntryFromMap:withUid:", v5, objc_msgSend(v5, "_abUid"));
  -[NSMutableArray removeObjectAtIndex:](self->_list, "removeObjectAtIndex:", a3);
  -[ABFavoritesListManager _postChangeNotification](self, "_postChangeNotification");
  -[ABFavoritesListManager _scheduleSave](self, "_scheduleSave");
}

- (void)moveEntryAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  NSMutableArray *list;
  uint64_t v8;
  int64_t v9;
  int64_t v10;

  if (a3 != a4)
  {
    list = self->_list;
    v8 = -[NSMutableArray objectAtIndex:](list, "objectAtIndex:");
    if (a4 <= a3)
      v9 = a4;
    else
      v9 = a4 + 1;
    -[NSMutableArray insertObject:atIndex:](list, "insertObject:atIndex:", v8, v9);
    if (a3 <= a4)
      v10 = a3;
    else
      v10 = a3 + 1;
    -[NSMutableArray removeObjectAtIndex:](self->_list, "removeObjectAtIndex:", v10);
    -[ABFavoritesListManager _postChangeNotification](self, "_postChangeNotification");
    -[ABFavoritesListManager _scheduleSave](self, "_scheduleSave");
  }
}

- (void)save
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  ABDiagnosticsEnabled();
  _ABLog2(4, (uint64_t)"-[ABFavoritesListManager save]", 419, 0, (uint64_t)CFSTR("must save changes with CNFavorites"), v3, v4, v5, v6);
  *(_DWORD *)&self->_flags &= ~1u;
}

- (void)recacheIdentitiesSoon
{
  -[ABFavoritesListManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedLookup, 0, 0.6);
}

- (void)_delayedLookup
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_list, "makeObjectsPerformSelector:", sel__queueLookup);
}

- (BOOL)entryIsDuplicateAndThusRemoved:(id)a3 oldUid:(int)a4
{
  uint64_t v4;
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
  id v17;

  v4 = *(_QWORD *)&a4;
  v7 = -[NSMutableArray count](self->_list, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while ((id)-[NSMutableArray objectAtIndex:](self->_list, "objectAtIndex:", v9) != a3)
    {
      if (v8 == ++v9)
        goto LABEL_5;
    }
    v14 = -[NSMutableArray count](self->_list, "count");
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      while (1)
      {
        v17 = (id)-[NSMutableArray objectAtIndex:](self->_list, "objectAtIndex:", v16);
        if (v17 != a3 && (objc_msgSend(v17, "isEqual:", a3) & 1) != 0)
          break;
        if (v15 == ++v16)
          goto LABEL_6;
      }
      -[NSMutableArray removeObjectAtIndex:](self->_list, "removeObjectAtIndex:", v9);
      -[ABFavoritesListManager _removeEntryFromMap:withUid:](self, "_removeEntryFromMap:withUid:", a3, v4);
      -[ABFavoritesListManager _scheduleSave](self, "_scheduleSave");
      -[ABFavoritesListManager _postChangeNotification](self, "_postChangeNotification");
      LOBYTE(v14) = 1;
    }
  }
  else
  {
LABEL_5:
    ABDiagnosticsEnabled();
    v10 = objc_msgSend(a3, "dictionaryRepresentation");
    _ABLog2(4, (uint64_t)"-[ABFavoritesListManager entryIsDuplicateAndThusRemoved:oldUid:]", 445, 0, (uint64_t)CFSTR("Checking for duplicate favorites entry, but entry we were told to compare is not list! Entry: %@\nList: %@"), v11, v12, v13, v10);
LABEL_6:
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (void)removeAllEntries
{
  __CFDictionary *uidToEntry;

  uidToEntry = self->_uidToEntry;
  if (uidToEntry)
  {
    CFRelease(uidToEntry);
    self->_uidToEntry = 0;
  }

  self->_list = 0;
  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_loadListWithAddressBook:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19BC4B000, a2, OS_LOG_TYPE_FAULT, "%@ (or something it links) is using deprecated code and contributing to the overall instability of the system.", (uint8_t *)&v2, 0xCu);
}

@end
