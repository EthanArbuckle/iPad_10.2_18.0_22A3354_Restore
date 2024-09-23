@implementation ABPersonLinker

+ (BOOL)isLinkDataValidForAddressBook:(void *)a3
{
  return ABAddressBookGetIntegerProperty((uint64_t)a3) == 9;
}

+ (BOOL)isInitialLinkingEnabled
{
  return 1;
}

+ (BOOL)isAutoLinkingEnabled
{
  return 1;
}

+ (void)startAutoLinkingNewPeopleInAddressBook:(void *)a3 inProcess:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  ABPersonLinker *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1A1ACC34C](a1, a2);
  v7 = ABOSLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = a3;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_19BC4B000, v7, OS_LOG_TYPE_DEFAULT, "[ABPersonLinker] startAutoLinkingNewPeopleInAddressBook:%@ inProcess:%i", (uint8_t *)&v9, 0x12u);
  }
  if (v4)
  {
    v8 = -[ABPersonLinker initWithAddressBook:]([ABPersonLinker alloc], "initWithAddressBook:", a3);
    -[ABPersonLinker linkRecentlyAddedPeople](v8, "linkRecentlyAddedPeople");

  }
  else
  {
    ABStartDatabaseDoctor((uint64_t)a3);
  }
  objc_autoreleasePoolPop(v6);
}

- (ABPersonLinker)initWithAddressBook:(void *)a3
{
  ABPersonLinker *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABPersonLinker;
  v4 = -[ABPersonLinker init](&v6, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    v4->_addressBook = a3;
  }
  return v4;
}

- (ABPersonLinker)init
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABPersonLinker.m"), 71, CFSTR("Use (id)initWithAddressBook:(ABAddressBookRef)addressBook instead of (id)init."));
  return 0;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);

  v4.receiver = self;
  v4.super_class = (Class)ABPersonLinker;
  -[ABPersonLinker dealloc](&v4, sel_dealloc);
}

- (id)otherPeopleInDatabaseMatchingPerson:(void *)a3 notIncludingPeople:(id)a4
{
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  ABRecordID RecordID;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  ABRecordID v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  int IntValue;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  const void *v32;
  void *v33;
  CFTypeRef v34;
  const void *v35;
  uint64_t SelectStatement;
  const void *v37;
  id v38;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (self->_peopleByOrganization && self->_peopleByFirstName && self->_peopleByLastName)
  {
    if (ABRecordGetIntValue((uint64_t)a3, kABPersonKindProperty) == 1)
    {
      v8 = objc_msgSend((id)(id)ABRecordCopyValue(a3, kABPersonOrganizationProperty), "lowercaseString");
      if (v8)
        v9 = (const __CFString *)v8;
      else
        v9 = &stru_1E3CA4E68;
      v10 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_peopleByOrganization, "objectForKey:", v9), "mutableCopy");
    }
    else
    {
      v18 = objc_msgSend((id)(id)ABRecordCopyValue(a3, kABPersonFirstNameProperty), "lowercaseString");
      v19 = objc_msgSend((id)(id)ABRecordCopyValue(a3, kABPersonLastNameProperty), "lowercaseString");
      if (v18)
        v20 = (const __CFString *)v18;
      else
        v20 = &stru_1E3CA4E68;
      v21 = (void *)-[NSMutableDictionary objectForKey:](self->_peopleByFirstName, "objectForKey:", v20);
      if (v19)
        v22 = (const __CFString *)v19;
      else
        v22 = &stru_1E3CA4E68;
      v23 = -[NSMutableDictionary objectForKey:](self->_peopleByLastName, "objectForKey:", v22);
      v24 = (void *)objc_msgSend(v21, "mutableCopy");
      v10 = v24;
      if (v23)
      {
        objc_msgSend(v24, "intersectSet:", v23);
      }
      else
      {

        v10 = 0;
      }
    }
    objc_msgSend(v10, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a4));
    objc_msgSend(v10, "removeObject:", a3);
    v40 = (id)objc_msgSend((id)objc_msgSend(v10, "allObjects"), "copy");

    return v40;
  }
  else
  {
    RecordID = ABRecordGetRecordID(a3);
    if (RecordID == -1 && !objc_msgSend(a4, "count"))
    {
      v12 = 0;
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", RecordID);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(a4);
            v17 = ABRecordGetRecordID(*(ABRecordRef *)(*((_QWORD *)&v41 + 1) + 8 * i));
            if (v17 != -1)
              objc_msgSend(v12, "addIndex:", v17);
          }
          v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v14);
      }
    }
    IntValue = ABRecordGetIntValue((uint64_t)a3, kABPersonKindProperty);
    if (IntValue)
    {
      if (IntValue != 1)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABPersonLinker.m"), 202, CFSTR("Wrong kind of person, expected an organization"));
      v34 = ABRecordCopyValue(a3, kABPersonOrganizationProperty);
      if (v34)
      {
        v35 = v34;
        SelectStatement = CPRecordStoreCreateSelectStatement();
        if (SelectStatement)
        {
          v37 = (const void *)SelectStatement;
          v33 = (void *)CPRecordStoreProcessQueryWithBindBlock();
          CFRelease(v37);
        }
        else
        {
          v33 = 0;
        }
        CFRelease(v35);
      }
      else
      {
        v33 = 0;
      }
    }
    else
    {
      v26 = (unint64_t)ABRecordCopyValue(a3, kABPersonFirstNameProperty);
      v27 = (unint64_t)ABRecordCopyValue(a3, kABPersonLastNameProperty);
      if (!(v26 | v27))
        goto LABEL_46;
      v28 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      objc_msgSend(v28, "appendString:", CFSTR("WHERE "));
      objc_msgSend(v28, "appendString:", CFSTR("First"));
      v29 = v26 ? CFSTR(" LIKE ? AND ") : CFSTR(" IS NULL AND ");
      objc_msgSend(v28, "appendString:", v29);
      objc_msgSend(v28, "appendString:", CFSTR("Last"));
      v30 = v27 ? CFSTR(" LIKE ? AND ") : CFSTR(" IS NULL AND ");
      objc_msgSend(v28, "appendString:", v30);
      objc_msgSend(v28, "appendFormat:", CFSTR("%@ = %@"), CFSTR("Kind"), CFSTR("0"));
      v31 = CPRecordStoreCreateSelectStatement();
      if (v31)
      {
        v32 = (const void *)v31;
        v33 = (void *)CPRecordStoreProcessQueryWithBindBlock();
        CFRelease(v32);
      }
      else
      {
LABEL_46:
        v33 = 0;
      }

    }
    v38 = v33;
    return v33;
  }
}

_QWORD *__73__ABPersonLinker_otherPeopleInDatabaseMatchingPerson_notIncludingPeople___block_invoke(_QWORD *result, uint64_t a2)
{
  sqlite3_stmt *v3;
  _QWORD *v4;
  void *v5;
  int v6;

  if (a2)
  {
    v3 = *(sqlite3_stmt **)(a2 + 8);
    if (v3)
    {
      v4 = result;
      v5 = (void *)result[4];
      if (v5)
      {
        sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(v5, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v6 = 2;
      }
      else
      {
        v6 = 1;
      }
      result = (_QWORD *)v4[5];
      if (result)
        return (_QWORD *)sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), v6, (const char *)objc_msgSend(result, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  return result;
}

_QWORD *__73__ABPersonLinker_otherPeopleInDatabaseMatchingPerson_notIncludingPeople___block_invoke_2(_QWORD *result, uint64_t a2)
{
  sqlite3_stmt *v2;

  if (a2)
  {
    v2 = *(sqlite3_stmt **)(a2 + 8);
    if (v2)
    {
      result = (_QWORD *)result[4];
      if (result)
        return (_QWORD *)sqlite3_bind_text(v2, 1, (const char *)objc_msgSend(result, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  return result;
}

- (id)otherPeopleInArray:(id)a3 matchingPerson:(void *)a4
{
  CFTypeRef v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  CFTypeRef v18;
  CFTypeRef v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  CFTypeRef v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (ABRecordGetIntValue((uint64_t)a4, kABPersonKindProperty))
  {
    if (ABRecordGetIntValue((uint64_t)a4, kABPersonKindProperty) != 1)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABPersonLinker.m"), 260, CFSTR("Wrong kind of person, expected an organization"));
    v8 = ABRecordCopyValue(a4, kABPersonOrganizationProperty);
    if (v8)
    {
      v9 = (void *)v8;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v34 != v12)
              objc_enumerationMutation(a3);
            v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            if (v14 != a4
              && ABRecordGetIntValue(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), kABPersonKindProperty) == 1)
            {
              v15 = (void *)ABRecordCopyValue(v14, kABPersonOrganizationProperty);
              v16 = v15;
              if (v15)
              {
                if (!objc_msgSend(v15, "localizedCaseInsensitiveCompare:", v9))
                  objc_msgSend(v32, "addObject:", v14);
              }

            }
          }
          v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v11);
      }

    }
  }
  else
  {
    v18 = ABRecordCopyValue(a4, kABPersonFirstNameProperty);
    v19 = ABRecordCopyValue(a4, kABPersonLastNameProperty);
    v30 = (void *)v19;
    v31 = (void *)v18;
    if (v18)
      v20 = v19 == 0;
    else
      v20 = 1;
    if (!v20)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v38 != v23)
              objc_enumerationMutation(a3);
            v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            if (v25 != a4
              && !ABRecordGetIntValue(*(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j), kABPersonKindProperty))
            {
              v26 = (void *)ABRecordCopyValue(v25, kABPersonFirstNameProperty);
              v27 = ABRecordCopyValue(v25, kABPersonLastNameProperty);
              v28 = (void *)v27;
              if (v26)
                v29 = v27 == 0;
              else
                v29 = 1;
              if (!v29
                && !objc_msgSend(v26, "localizedCaseInsensitiveCompare:", v31)
                && !objc_msgSend(v28, "localizedCaseInsensitiveCompare:", v30))
              {
                objc_msgSend(v32, "addObject:", v25);
              }

            }
          }
          v22 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v22);
      }
    }

  }
  return v32;
}

- (BOOL)shouldLinkPerson:(void *)a3 toPeopleInDatabase:(id)a4 andNewlyAddedPeople:(id)a5 inInitialLinking:(BOOL)a6
{
  int IntValue;
  uint64_t v10;
  unint64_t v11;
  ABRecordRef v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  const void *v18;
  ABRecordRef v19;
  const void *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  int v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  IntValue = ABRecordGetIntValue((uint64_t)a3, kABPersonKindProperty);
  v10 = objc_msgSend(a4, "count");
  v11 = objc_msgSend(a5, "count") + v10;
  v12 = ABPersonCopySource(a3);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v11);
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "addObject:", v12);
    CFRelease(v12);
  }
  v42 = (id)ABRecordCopyValue(a3, kABPersonMiddleNameProperty);
  if (v11)
  {
    v15 = 0;
    while (1)
    {
      if (v15 >= objc_msgSend(a4, "count"))
      {
        v17 = v15 - objc_msgSend(a4, "count");
        v16 = a5;
      }
      else
      {
        v16 = a4;
        v17 = v15;
      }
      v18 = (const void *)objc_msgSend(v16, "objectAtIndex:", v17);
      v19 = ABPersonCopySource(v18);
      if (!v19)
        goto LABEL_11;
      v20 = v19;
      if (objc_msgSend(v14, "containsObject:", v19))
      {
        CFRelease(v20);
        goto LABEL_47;
      }
      objc_msgSend(v14, "addObject:", v20);
      CFRelease(v20);
      if (IntValue)
      {
LABEL_11:
        v21 = 1;
        goto LABEL_18;
      }
      v22 = (void *)ABRecordCopyValue(v18, kABPersonMiddleNameProperty);
      if (!v22)
        goto LABEL_16;
      if (!v42)
        break;
      v21 = objc_msgSend(v42, "localizedCaseInsensitiveCompare:", v22) == 0;
LABEL_17:

LABEL_18:
      if (++v15 >= v11 || !v21)
        goto LABEL_22;
    }
    v42 = v22;
LABEL_16:
    v21 = 1;
    goto LABEL_17;
  }
  v21 = 1;
LABEL_22:
  if (v21 && !a6)
  {
    v23 = ABRecordGetIntValue((uint64_t)a3, kABPersonLinkProperty);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v24 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v52 != v26)
            objc_enumerationMutation(a5);
          v28 = ABRecordGetIntValue(*(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i), kABPersonLinkProperty);
          if (v28 != -1)
          {
            if (v23 == -1)
            {
              v23 = v28;
            }
            else
            {
              v29 = v23 == v28;
              v23 = v28;
              if (!v29)
                goto LABEL_47;
            }
          }
        }
        v25 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v25);
    }
    if (v23 == -1)
    {
      if ((unint64_t)objc_msgSend(a4, "count") >= 2)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v35 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v48;
          v38 = -1;
LABEL_52:
          v39 = 0;
          while (1)
          {
            if (*(_QWORD *)v48 != v37)
              objc_enumerationMutation(a4);
            v40 = ABRecordGetIntValue(*(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v39), kABPersonLinkProperty);
            if (v40 == -1)
              goto LABEL_47;
            if (v38 == -1)
            {
              v38 = v40;
            }
            else if (v38 != v40)
            {
              goto LABEL_47;
            }
            if (v36 == ++v39)
            {
              v36 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
              LOBYTE(v21) = 1;
              if (v36)
                goto LABEL_52;
              goto LABEL_48;
            }
          }
        }
      }
    }
    else
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v30 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v44;
LABEL_39:
        v33 = 0;
        while (1)
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(a4);
          if (ABRecordGetIntValue(*(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v33), kABPersonLinkProperty) != v23)break;
          if (v31 == ++v33)
          {
            v31 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            LOBYTE(v21) = 1;
            if (v31)
              goto LABEL_39;
            goto LABEL_48;
          }
        }
LABEL_47:
        LOBYTE(v21) = 0;
        goto LABEL_48;
      }
    }
    LOBYTE(v21) = 1;
  }
LABEL_48:

  return v21;
}

- (id)suggestedPeopleToLinkWithPerson:(void *)a3 isInitialLinking:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  v7 = -[ABPersonLinker otherPeopleInDatabaseMatchingPerson:notIncludingPeople:](self, "otherPeopleInDatabaseMatchingPerson:notIncludingPeople:", a3, 0);
  if (-[ABPersonLinker shouldLinkPerson:toPeopleInDatabase:andNewlyAddedPeople:inInitialLinking:](self, "shouldLinkPerson:toPeopleInDatabase:andNewlyAddedPeople:inInitialLinking:", a3, v7, 0, v4))
  {
    return v7;
  }
  else
  {
    return 0;
  }
}

- (void)addPerson:(void *)a3 toDictionary:(id)a4 withProperty:(int)a5
{
  uint64_t v7;
  const __CFString *v8;
  void *v9;

  v7 = objc_msgSend((id)(id)ABRecordCopyValue(a3, a5), "lowercaseString");
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = &stru_1E3CA4E68;
  v9 = (void *)objc_msgSend(a4, "objectForKey:", v8);
  if (!v9)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(a4, "setObject:forKey:", v9, v8);

  }
  objc_msgSend(v9, "addObject:", a3);
}

- (void)presortPeople:(id)a3
{
  NSMutableDictionary *peopleByLastName;
  NSMutableDictionary *peopleByFirstName;
  NSMutableDictionary *v6;
  NSMutableDictionary *peopleByOrganization;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int IntValue;
  NSMutableDictionary **p_peopleByOrganization;
  uint64_t v15;
  NSMutableDictionary **p_peopleByLastName;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  peopleByLastName = self->_peopleByLastName;
  p_peopleByLastName = &self->_peopleByLastName;
  if (peopleByLastName)

  self->_peopleByLastName = (NSMutableDictionary *)objc_opt_new();
  peopleByFirstName = self->_peopleByFirstName;
  if (peopleByFirstName)

  v6 = (NSMutableDictionary *)objc_opt_new();
  peopleByOrganization = self->_peopleByOrganization;
  self->_peopleByFirstName = v6;
  if (peopleByOrganization)

  self->_peopleByOrganization = (NSMutableDictionary *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(a3);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        IntValue = ABRecordGetIntValue(v12, kABPersonKindProperty);
        p_peopleByOrganization = &self->_peopleByOrganization;
        v15 = kABPersonOrganizationProperty;
        if (!IntValue)
        {
          -[ABPersonLinker addPerson:toDictionary:withProperty:](self, "addPerson:toDictionary:withProperty:", v12, self->_peopleByFirstName, kABPersonFirstNameProperty);
          p_peopleByOrganization = p_peopleByLastName;
          v15 = kABPersonLastNameProperty;
        }
        -[ABPersonLinker addPerson:toDictionary:withProperty:](self, "addPerson:toDictionary:withProperty:", v12, *p_peopleByOrganization, v15, p_peopleByLastName);
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
}

- (void)makeLinksForAddedPeople:(id)a3 inInitialLinking:(BOOL)a4 countingOuterIterations:(unint64_t *)a5 detectedLinkCount:(unint64_t *)a6
{
  ABPersonLinker *v7;
  CFArrayRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  id v18;
  CFMutableStringRef v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  CFMutableStringRef v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const void *v42;
  uint64_t RecordID;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSMutableDictionary *peopleByFirstName;
  NSMutableDictionary *peopleByLastName;
  NSMutableDictionary *peopleByOrganization;
  uint64_t v52;
  uint64_t v53;
  const __CFArray *v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  _BOOL4 v60;
  unint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v7 = self;
  v78 = *MEMORY[0x1E0C80C00];
  v60 = a4;
  if (a4)
    -[ABPersonLinker removeAllLinks](self, "removeAllLinks");
  if (a3)
  {
    v8 = (CFArrayRef)a3;
  }
  else
  {
    v8 = ABAddressBookCopyArrayOfAllPeople(v7->_addressBook);
    -[ABPersonLinker presortPeople:](v7, "presortPeople:", v8);
  }
  if (ABDiagnosticsEnabled())
  {
    objc_msgSend(a3, "count");
    -[__CFArray count](v8, "count");
    _ABLog2(7, (uint64_t)"-[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:]", 464, 0, (uint64_t)CFSTR("[ABPersonLinker] (%@) makeLinksForAddedPeople %ld inInitialLinking %i peopleToLink %ld"), v9, v10, v11, (uint64_t)v7);
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[__CFArray count](v8, "count"));
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v13)
  {
    v14 = v13;
    v61 = 0;
    v57 = (uint64_t)v7;
    v58 = 0;
    v15 = *(_QWORD *)v72;
    v56 = v8;
    v59 = a3;
    do
    {
      v16 = 0;
      v62 = v14;
      do
      {
        if (*(_QWORD *)v72 != v15)
          objc_enumerationMutation(v8);
        v17 = *(const void **)(*((_QWORD *)&v71 + 1) + 8 * v16);
        if ((objc_msgSend(v12, "containsObject:", v17) & 1) == 0)
        {
          v18 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          if (ABRecordGetIntValue((uint64_t)v17, kABPersonLinkProperty) == -1)
          {
            v23 = -[ABPersonLinker otherPeopleInArray:matchingPerson:](v7, "otherPeopleInArray:matchingPerson:", a3, v17);
            v24 = -[ABPersonLinker otherPeopleInDatabaseMatchingPerson:notIncludingPeople:](v7, "otherPeopleInDatabaseMatchingPerson:notIncludingPeople:", v17, v23);
            if (ABDiagnosticsEnabled())
            {
              v25 = ABPersonCopyCompositeName(v17);
              if (ABDiagnosticsEnabled())
              {
                ABRecordGetRecordID(v17);
                objc_msgSend(v24, "count");
                objc_msgSend(v23, "count");
                v8 = v56;
                v7 = (ABPersonLinker *)v57;
                _ABLog2(7, (uint64_t)"-[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:]", 480, 0, (uint64_t)CFSTR("[ABPersonLinker] (%@) person %i %@, otherPeopleinDatabase %ld, otherNewlyAddedPeople %ld"), v26, v27, v28, v57);
              }

            }
            if (-[ABPersonLinker shouldLinkPerson:toPeopleInDatabase:andNewlyAddedPeople:inInitialLinking:](v7, "shouldLinkPerson:toPeopleInDatabase:andNewlyAddedPeople:inInitialLinking:", v17, v24, v23, v60))
            {
              if (objc_msgSend(v24, "count") || objc_msgSend(v23, "count"))
                ++v58;
              if (objc_msgSend(v24, "count"))
              {
                if (v60)
                {
                  v69 = 0u;
                  v70 = 0u;
                  v67 = 0u;
                  v68 = 0u;
                  v29 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
                  if (v29)
                  {
                    v30 = v29;
                    v31 = *(_QWORD *)v68;
                    do
                    {
                      for (i = 0; i != v30; ++i)
                      {
                        if (*(_QWORD *)v68 != v31)
                          objc_enumerationMutation(v24);
                        ABPersonLinkPerson(v17, *(const void **)(*((_QWORD *)&v67 + 1) + 8 * i));
                      }
                      v30 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
                    }
                    while (v30);
                  }
                }
                else
                {
                  ABPersonLinkPerson(v17, (const void *)objc_msgSend(v24, "lastObject"));
                }
              }
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v33 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v64;
                do
                {
                  for (j = 0; j != v34; ++j)
                  {
                    if (*(_QWORD *)v64 != v35)
                      objc_enumerationMutation(v23);
                    ABPersonLinkPerson(v17, *(const void **)(*((_QWORD *)&v63 + 1) + 8 * j));
                  }
                  v34 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
                }
                while (v34);
              }
              v8 = v56;
              v7 = (ABPersonLinker *)v57;
            }
            objc_msgSend(v12, "addObjectsFromArray:", v24);
            objc_msgSend(v12, "addObjectsFromArray:", v23);
            ++v61;
            a3 = v59;
          }
          else
          {
            v19 = ABPersonCopyCompositeName(v17);
            if (ABDiagnosticsEnabled())
            {
              ABRecordGetRecordID(v17);
              _ABLog2(7, (uint64_t)"-[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:]", 517, 0, (uint64_t)CFSTR("[ABPersonLinker] (%@) person %i %@, personLinkId %i"), v20, v21, v22, (uint64_t)v7);
            }

          }
          v14 = v62;
        }
        ++v16;
      }
      while (v16 != v14);
      v14 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v14);
  }
  else
  {
    v61 = 0;
    v58 = 0;
  }

  if (a5)
    *a5 = v61;
  if (v60)
  {
    ABAddressBookSetIntegerProperty((uint64_t)v7->_addressBook, (uint64_t)CFSTR("PersonLinkerVersion"), 9, v37, v38, v39, v40, v41, v52);
    v42 = (const void *)-[__CFArray lastObject](v8, "lastObject");
    if (v42)
    {
      RecordID = ABRecordGetRecordID(v42);
      ABAddressBookSetIntegerProperty((uint64_t)v7->_addressBook, (uint64_t)CFSTR("PersonLinkerLastProcessedPerson"), RecordID, v44, v45, v46, v47, v48, v53);
      ABAddressBookSave(v7->_addressBook, 0);
    }
  }
  if (a6)
    *a6 = v58;
  peopleByFirstName = v7->_peopleByFirstName;
  if (peopleByFirstName)
  {

    v7->_peopleByFirstName = 0;
  }
  peopleByLastName = v7->_peopleByLastName;
  if (peopleByLastName)
  {

    v7->_peopleByLastName = 0;
  }
  peopleByOrganization = v7->_peopleByOrganization;
  if (peopleByOrganization)
  {

    v7->_peopleByOrganization = 0;
  }

}

- (void)removeAllLinks
{
  CFArrayRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = ABAddressBookCopyArrayOfAllPeople(self->_addressBook);
  if (ABDiagnosticsEnabled())
  {
    -[__CFArray count](v3, "count");
    _ABLog2(7, (uint64_t)"-[ABPersonLinker removeAllLinks]", 562, 0, (uint64_t)CFSTR("[ABPersonLinker] %@: removeAllLinks on %ld people"), v4, v5, v6, (uint64_t)self);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v3);
        ABPersonUnlink(*(CFTypeRef *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)makeInitialLinksCountingOuterIterations:(unint64_t *)a3
{
  -[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:](self, "makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:", 0, 1, a3, 0);
}

- (void)makeInitialLinks
{
  -[ABPersonLinker makeInitialLinksCountingOuterIterations:](self, "makeInitialLinksCountingOuterIterations:", 0);
}

- (id)copyArrayOfAllPeopleWithROWIDGreatThan:(int)a3 withLimit:(int64_t)a4
{
  void *addressBook;
  id result;

  addressBook = self->_addressBook;
  if (!addressBook)
    return 0;
  result = (id)*((_QWORD *)addressBook + 2);
  if (result)
    return (id)CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock();
  return result;
}

sqlite3_stmt *__67__ABPersonLinker_copyArrayOfAllPeopleWithROWIDGreatThan_withLimit___block_invoke(sqlite3_stmt *result, uint64_t a2)
{
  sqlite3_stmt *v3;

  if (a2)
  {
    v3 = result;
    result = *(sqlite3_stmt **)(a2 + 8);
    if (result)
    {
      sqlite3_bind_int(result, 1, *((_DWORD *)v3 + 10));
      return (sqlite3_stmt *)sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 2, *((_DWORD *)v3 + 8));
    }
  }
  return result;
}

- (BOOL)linkRecentlyAddedPeopleWithLimit:(int64_t)a3
{
  unsigned int IntegerProperty;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t RecordID;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  IntegerProperty = ABAddressBookGetIntegerProperty((uint64_t)self->_addressBook);
  if (IntegerProperty)
    v6 = IntegerProperty;
  else
    v6 = 0xFFFFFFFFLL;
  v7 = -[ABPersonLinker copyArrayOfAllPeopleWithROWIDGreatThan:withLimit:](self, "copyArrayOfAllPeopleWithROWIDGreatThan:withLimit:", v6, a3);
  v8 = objc_msgSend(v7, "count");
  if (ABDiagnosticsEnabled())
  {
    objc_msgSend(v7, "count");
    _ABLog2(7, (uint64_t)"-[ABPersonLinker linkRecentlyAddedPeopleWithLimit:]", 601, 0, (uint64_t)CFSTR("[ABPersonLinker] (%@) link recently added people with last autolinked person ID %i, limit %ld, number of people found %ld"), v9, v10, v11, (uint64_t)self);
  }
  if (objc_msgSend(v7, "count"))
  {
    v20 = 0;
    -[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:](self, "makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:", v7, 0, 0, &v20);
    RecordID = ABRecordGetRecordID((ABRecordRef)objc_msgSend(v7, "lastObject"));
    ABAddressBookSetIntegerProperty((uint64_t)self->_addressBook, (uint64_t)CFSTR("PersonLinkerLastProcessedPerson"), RecordID, v13, v14, v15, v16, v17, v19);
    if (v20)
      ABAddressBookSave(self->_addressBook, 0);
  }

  return v8 == a3;
}

- (void)linkRecentlyAddedPeople
{
  -[ABPersonLinker linkRecentlyAddedPeopleWithLimit:](self, "linkRecentlyAddedPeopleWithLimit:", -1);
}

- (void)linkNewlyAddedPerson:(void *)a3
{
  CFMutableStringRef v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (ABDiagnosticsEnabled())
  {
    v5 = ABPersonCopyCompositeName(a3);
    if (ABDiagnosticsEnabled())
      _ABLog2(7, (uint64_t)"-[ABPersonLinker linkNewlyAddedPerson:]", 627, 0, (uint64_t)CFSTR("[ABPersonLinker] (%@) link newly added person %@"), v6, v7, v8, (uint64_t)self);

  }
  -[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:](self, "makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3), 0, 0, 0);
}

@end
