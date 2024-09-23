@implementation ABFavoritesEntry

- (ABFavoritesEntry)initWithPerson:(void *)a3 property:(int)a4 identifier:(int)a5
{
  return -[ABFavoritesEntry initWithPerson:property:identifier:type:](self, "initWithPerson:property:identifier:type:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
}

- (ABFavoritesEntry)initWithPerson:(void *)a3 property:(int)a4 identifier:(int)a5 type:(int)a6
{
  id v10;
  ABRecordID RecordID;
  const void *v12;
  CFTypeRef v13;
  CFTypeRef v14;
  const void *v15;
  CFIndex IndexForIdentifier;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ABFavoritesEntry;
  v10 = -[ABFavoritesEntry init](&v19, sel_init);
  *((_DWORD *)v10 + 6) = a4;
  RecordID = ABRecordGetRecordID(a3);
  *((_DWORD *)v10 + 2) = RecordID;
  if (RecordID == -1)
    goto LABEL_12;
  *((_DWORD *)v10 + 3) = a5;
  if (a3 && (v12 = (const void *)ABCGetAddressBookForRecord()) != 0)
    v13 = CFRetain(v12);
  else
    v13 = ABAddressBookCreateWithOptions(0, 0);
  *((_QWORD *)v10 + 8) = v13;
  *((_QWORD *)v10 + 6) = ABCopyPreferredNameForPerson(a3);
  v14 = ABRecordCopyValue(a3, a4);
  if (!v14)
    goto LABEL_12;
  v15 = v14;
  if (ABMultiValueGetCount(v14) < 1)
  {
    CFRelease(v15);
LABEL_12:

    return 0;
  }
  IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v15, a5);
  *((_QWORD *)v10 + 2) = ABMultiValueCopyValueAtIndex(v15, IndexForIdentifier);
  *((_QWORD *)v10 + 5) = ABMultiValueCopyLabelAtIndex(v15, IndexForIdentifier);
  v17 = *((_QWORD *)v10 + 8);
  if (v17)
    *((_QWORD *)v10 + 7) = ABAddressBookCopyUniqueIdentifier(v17);
  *((_DWORD *)v10 + 7) = a6;
  *((_BYTE *)v10 + 32) |= 1u;
  CFRelease(v15);
  return (ABFavoritesEntry *)v10;
}

- (ABFavoritesEntry)initWithDictionaryRepresentation:(id)a3
{
  return -[ABFavoritesEntry initWithDictionaryRepresentation:addressBook:](self, "initWithDictionaryRepresentation:addressBook:", a3, 0);
}

- (ABFavoritesEntry)initWithDictionaryRepresentation:(id)a3 addressBook:(void *)a4
{
  ABFavoritesEntry *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ABFavoritesEntry;
  v6 = -[ABFavoritesEntry init](&v13, sel_init);
  if (v6)
  {
    v6->_property = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("Property")), "intValue");
    v6->_value = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("Value"));
    v6->_label = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("Label"));
    v6->_name = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("Name"));
    v6->_abUid = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("ABUid")), "intValue");
    v6->_abIdentifier = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("ABIdentifier")), "intValue");
    v6->_abDatabaseUUID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("ABDatabaseUUID")), "copy");
    v6->_type = 0;
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("EntryType"));
    if (v7 && (v8 = objc_msgSend(v7, "intValue"), v6->_type = v8, v8 == -1))
    {

      return 0;
    }
    else
    {
      if (a4)
      {
        CFRetain(a4);
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABFavoritesEntry initWithDictionaryRepresentation:addressBook:]", 136, 0, (uint64_t)CFSTR("addressBook is NULL, some API is non-functional when this is the case (example -ABPerson)"), v9, v10, v11, (uint64_t)v13.receiver);
      }
      v6->_addressBook = a4;
    }
  }
  return v6;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  -[ABFavoritesEntry _unqueueLookup](self, "_unqueueLookup");

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)ABFavoritesEntry;
  -[ABFavoritesEntry dealloc](&v4, sel_dealloc);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSString *value;
  NSString *label;
  NSString *name;
  NSString *abDatabaseUUID;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_abUid);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_abIdentifier);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_property);
  v7 = (void *)objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("ABUid"), v5, CFSTR("ABIdentifier"), v6, CFSTR("Property"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type), CFSTR("EntryType"), 0);
  v8 = v7;
  value = self->_value;
  if (value)
    objc_msgSend(v7, "setObject:forKey:", value, CFSTR("Value"));
  label = self->_label;
  if (label)
    objc_msgSend(v8, "setObject:forKey:", label, CFSTR("Label"));
  name = self->_name;
  if (name)
    objc_msgSend(v8, "setObject:forKey:", name, CFSTR("Name"));
  abDatabaseUUID = self->_abDatabaseUUID;
  if (abDatabaseUUID)
    objc_msgSend(v8, "setObject:forKey:", abDatabaseUUID, CFSTR("ABDatabaseUUID"));
  return v8;
}

- (void)dictionaryRepresentation:(id *)a3 isDirty:(BOOL *)a4
{
  *a3 = -[ABFavoritesEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  *a4 = *((_BYTE *)self + 32) & 1;
  *((_BYTE *)self + 32) &= ~1u;
}

- (id)displayName
{
  id result;

  result = self->_name;
  if (!result || self->_abUid < 0)
    return self->_value;
  return result;
}

- (int)property
{
  return self->_property;
}

- (id)label
{
  const __CFString *label;
  __CFString *v4;
  __CFString *v5;

  label = (const __CFString *)self->_label;
  if (!label || self->_abUid < 0)
    return 0;
  v4 = (__CFString *)ABAddressBookCopyLocalizedLabel(label);
  v5 = v4;
  return v4;
}

- (id)nonLocalizedLabel
{
  return self->_label;
}

- (id)value
{
  return self->_value;
}

- (int)identifier
{
  return self->_abIdentifier;
}

- (int)type
{
  return self->_type;
}

- (void)ABPerson
{
  void *result;

  result = self->_addressBook;
  if (result)
    return (void *)ABAddressBookGetPersonWithRecordID(result, self->_abUid);
  return result;
}

- (int)_abUid
{
  return self->_abUid;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  NSString *label;
  uint64_t v7;

  if (self->_property != *((_DWORD *)a3 + 6))
    goto LABEL_8;
  v5 = -[NSString isEqualToString:](self->_value, "isEqualToString:", *((_QWORD *)a3 + 2));
  if (v5)
  {
    if (self->_type == *((_DWORD *)a3 + 7))
    {
      label = self->_label;
      v7 = *((_QWORD *)a3 + 5);
      if (label && v7)
      {
        if (!-[NSString isEqualToString:](label, "isEqualToString:") || self->_abUid != *((_DWORD *)a3 + 2))
          goto LABEL_8;
        goto LABEL_11;
      }
      if (!((unint64_t)label | v7))
      {
LABEL_11:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (void)_runLookup
{
  ABAddressBookRef v2;
  const void *v3;
  id v4;
  void *v5;
  int v6;
  ABRecordID v7;
  char v8;
  ABRecordRef PersonWithRecordID;
  const void *v10;
  CFTypeRef v11;
  CFTypeRef v12;
  CFIndex IndexForIdentifier;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFIndex v19;
  const __CFArray *v20;
  const void *v21;
  ABRecordRef v22;
  CFIndex v23;
  int v24;
  ABRecordID ValueAtIndex;
  ABRecordRef v26;
  const void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  const void *v35;
  const __CFArray *v36;
  int v37;
  const void *v38;
  CFIndex FirstIndexOfValueWithCallback;
  ABMultiValueIdentifier IdentifierAtIndex;
  unint64_t v41;
  CFIndex Count;
  CFIndex v43;
  __CFString *v44;
  int v45;
  __CFString *v46;
  void *v47;
  __CFString *v48;
  __CFString *v49;
  char v50;
  BOOL v53;
  int v54;
  ABFavoritesLookupChangeRecord *v55;
  char *v56;
  id v57;
  id v58;
  int v59;
  int v60;
  void *v61;
  int v62;
  const void *v63;
  const __CFArray *v64;
  const void *v65;
  CFIndex v66;
  CFTypeRef cf;
  CFTypeRef v68;
  const __CFArray *v69;

  v58 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v2 = ABAddressBookCreateWithOptions(0, 0);
  v3 = v2;
  if (v2)
    v4 = (id)ABAddressBookCopyUniqueIdentifier((uint64_t)v2);
  else
    v4 = 0;
  objc_msgSend((id)__LookupQueueLock, "lock");
  if (CFArrayGetCount((CFArrayRef)__LookupQueue) >= 1)
  {
    v56 = sel__lookupChanged_;
    v57 = v4;
    v61 = (void *)*MEMORY[0x1E0C9B0D0];
    v65 = v3;
    while (1)
    {
      v5 = (id)CFArrayGetValueAtIndex((CFArrayRef)__LookupQueue, 0);
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)__LookupQueue, 0);
      objc_msgSend((id)__LookupQueueLock, "unlock");
      if (!v5)
        goto LABEL_128;
      if (v4)
      {
        v6 = objc_msgSend(*((id *)v5 + 7), "isEqualToString:", v4) ^ 1;
        if (!v3)
          goto LABEL_22;
      }
      else
      {
        v6 = 0;
        if (!v3)
          goto LABEL_22;
      }
      v7 = *((_DWORD *)v5 + 2);
      if (v7 < 0)
        v8 = 1;
      else
        v8 = v6;
      if ((v8 & 1) != 0 || (PersonWithRecordID = ABAddressBookGetPersonWithRecordID(v3, v7)) == 0)
      {
LABEL_22:
        v12 = 0;
        goto LABEL_23;
      }
      v10 = PersonWithRecordID;
      v11 = ABRecordCopyValue(PersonWithRecordID, *((_DWORD *)v5 + 6));
      v12 = v11;
      if (!v11)
        goto LABEL_23;
      IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v11, *((_DWORD *)v5 + 3));
      if ((IndexForIdentifier & 0x8000000000000000) == 0)
        break;
LABEL_94:
      if (*((_QWORD *)v5 + 5))
      {
        Count = ABMultiValueGetCount(v12);
        if (Count >= 1)
        {
          v43 = Count;
          v14 = 0;
          while (1)
          {
            v44 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, v14);
            v45 = objc_msgSend(*((id *)v5 + 5), "isEqualToString:", v44);

            if (v45)
              break;
            if (v43 == ++v14)
            {
              v3 = v65;
              goto LABEL_23;
            }
          }
          v59 = v6;
          IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v12, v14);
          v3 = v65;
LABEL_102:
          v41 = v14 >> 63;
          v62 = -1;
LABEL_103:
          v46 = (__CFString *)ABCopyPreferredNameForPerson(v10);
          if (-[__CFString isEqualToString:](v46, "isEqualToString:", *((_QWORD *)v5 + 6)))
          {

            v46 = 0;
          }
          v47 = (void *)ABMultiValueCopyValueAtIndex(v12, v14);
          if (objc_msgSend(v47, "isEqualToString:", *((_QWORD *)v5 + 2)))
          {

            v47 = 0;
          }
          v48 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, v14);
          v49 = v48;
          if (!*((_QWORD *)v5 + 5) || -[__CFString isEqualToString:](v48, "isEqualToString:"))
          {

            v49 = 0;
          }
          if (v12)
          {
            CFRelease(v12);
            if ((v41 & 1) == 0)
              goto LABEL_114;
          }
          else if (!(_DWORD)v41)
          {
LABEL_114:
            v53 = (IdentifierAtIndex & v62) < 0 != v50 && v47 == 0 && v46 == 0 && v49 == 0;
            v54 = v59;
            if (!v53)
              v54 = 1;
            if (v54 == 1)
            {
              v55 = objc_alloc_init(ABFavoritesLookupChangeRecord);
              v55->identifier = IdentifierAtIndex;
              v55->uid = v62;
              v55->value = (NSString *)v47;
              v55->name = &v46->isa;
              v55->label = &v49->isa;
              v55->abDatabaseUUID = (NSString *)v4;
              objc_msgSend(v5, "performSelectorOnMainThread:withObject:waitUntilDone:", v56, v55, 0);

            }
            goto LABEL_90;
          }
          goto LABEL_89;
        }
      }
LABEL_23:
      if (*((_QWORD *)v5 + 2))
      {
        v59 = v6;
        if (v12)
          CFRelease(v12);
        if (!v3 || !*((_QWORD *)v5 + 2))
          goto LABEL_89;
        v69 = 0;
        if (objc_msgSend(v5, "property") == kABPersonPhoneProperty)
        {
          v17 = ABCCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint((uint64_t)v3, *((_QWORD *)v5 + 2), 0, &v69);
        }
        else
        {
          if (objc_msgSend(v5, "property") != kABPersonEmailProperty)
            goto LABEL_89;
          v68 = 0;
          cf = 0;
          v17 = (const __CFArray *)ABCCopyArrayOfUIDsMatchingEmailAddressIncludingLabels((uint64_t)v3, *((const __CFString **)v5 + 2), &cf, &v68);
          if (cf)
            CFRelease(cf);
          if (v68)
            CFRelease(v68);
        }
        if (!v17)
        {
          v20 = v69;
          if (!v69)
            goto LABEL_89;
LABEL_87:
          v18 = v20;
LABEL_88:
          CFRelease(v18);
          goto LABEL_89;
        }
        v19 = CFArrayGetCount(v17);
        if (v69)
          v66 = CFArrayGetCount(v69);
        else
          v66 = 0;
        if (v19 < 1)
        {
          v22 = 0;
          v10 = 0;
          v63 = 0;
          v24 = -1;
          v62 = -1;
          v60 = -1;
LABEL_76:
          CFRelease(v17);
          if (v69)
            CFRelease(v69);
          v4 = v57;
          if (!v10)
          {
            v10 = v63;
            v62 = v60;
            if (!v63)
            {
              v10 = v22;
              v62 = v24;
              if (!v22)
                goto LABEL_89;
            }
          }
          v36 = (const __CFArray *)ABRecordCopyValue(v10, objc_msgSend(v5, "property", v56));
          if (!v36)
            goto LABEL_89;
          v20 = v36;
          v37 = objc_msgSend(v5, "property");
          v38 = (const void *)*((_QWORD *)v5 + 2);
          if (v37 == kABPersonPhoneProperty)
            FirstIndexOfValueWithCallback = ABCMultiValueGetFirstIndexOfValueWithCallback((uint64_t)v20, (uint64_t)v38, (unsigned int (*)(uint64_t, const void *))_ABFavoritesPhoneNumbersEqualCallback);
          else
            FirstIndexOfValueWithCallback = ABCMultiValueGetFirstIndexOfValue((uint64_t)v20, v38);
          v14 = FirstIndexOfValueWithCallback;
          if (FirstIndexOfValueWithCallback < 0)
            goto LABEL_87;
          IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v20, FirstIndexOfValueWithCallback);
          v12 = CFRetain(v20);
          CFRelease(v20);
          LODWORD(v41) = 0;
          goto LABEL_103;
        }
        v63 = 0;
        v64 = v17;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v60 = -1;
        v62 = -1;
        v24 = -1;
        while (2)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v17, v23);
          v26 = ABAddressBookGetPersonWithRecordID(v3, ValueAtIndex);
          if (v26)
          {
            v27 = v26;
            if (!v22)
            {
              v24 = ValueAtIndex;
              v22 = v26;
            }
            if (v66 <= v23)
              v28 = 0;
            else
              v28 = (void *)CFArrayGetValueAtIndex(v69, v23);
            v29 = (__CFString *)ABCopyPreferredNameForPerson(v27);
            if (v29)
            {
              v30 = v29;
              if (*((_QWORD *)v5 + 6))
              {
                v31 = -[__CFString isEqualToString:](v29, "isEqualToString:");
                v32 = v62;
                if (v31)
                  v32 = ValueAtIndex;
                v62 = v32;
                if (v31)
                  v21 = v27;
              }
              CFRelease(v30);
            }
            v17 = v64;
            if (v21 || !v28 || v28 == v61)
            {
              if (!v28 || !v21)
                goto LABEL_72;
              v10 = v63;
              v3 = v65;
              if (v63 == v21)
                goto LABEL_76;
            }
            else
            {
              if (*((_QWORD *)v5 + 5))
              {
                v33 = objc_msgSend(v28, "isEqualToString:");
                v21 = 0;
                v34 = v60;
                if (v33)
                  v34 = ValueAtIndex;
                v60 = v34;
                v35 = v63;
                if (v33)
                  v35 = v27;
                v63 = v35;
              }
              else
              {
                v21 = 0;
              }
LABEL_72:
              v3 = v65;
            }
          }
          ++v23;
          v10 = v21;
          if (v19 == v23)
            goto LABEL_76;
          continue;
        }
      }
      if (v12)
      {
        v18 = (const __CFArray *)v12;
        goto LABEL_88;
      }
LABEL_89:
      objc_msgSend(v5, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__lookupNotFound, 0, 0, v56);
LABEL_90:

      objc_msgSend((id)__LookupQueueLock, "lock");
      if (CFArrayGetCount((CFArrayRef)__LookupQueue) <= 0)
        goto LABEL_127;
    }
    v14 = IndexForIdentifier;
    v15 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, IndexForIdentifier);
    v16 = (void *)*((_QWORD *)v5 + 5);
    if (v16)
    {
      if (!objc_msgSend(v16, "isEqualToString:", v15))
      {
LABEL_93:

        goto LABEL_94;
      }
      if (*((_QWORD *)v5 + 5))
        goto LABEL_100;
    }
    if (!v15)
    {
LABEL_100:
      v59 = v6;

      IdentifierAtIndex = -1;
      goto LABEL_102;
    }
    goto LABEL_93;
  }
LABEL_127:
  __LookupQueueRunning = 0;
  objc_msgSend((id)__LookupQueueLock, "unlock", v56);
LABEL_128:
  if (v3)
    CFRelease(v3);

}

- (void)_queueLookup
{
  id v3;
  __CFArray *Mutable;

  v3 = (id)__LookupQueueLock;
  if (!__LookupQueueLock)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    __LookupQueueLock = (uint64_t)v3;
  }
  objc_msgSend(v3, "lock");
  Mutable = (__CFArray *)__LookupQueue;
  if (!__LookupQueue)
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    __LookupQueue = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, self);
  if ((__LookupQueueRunning & 1) == 0)
  {
    __LookupQueueRunning = 1;
    objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel__runLookup, objc_opt_class(), 0);
  }
  objc_msgSend((id)__LookupQueueLock, "unlock");
}

- (void)_unqueueLookup
{
  if (__LookupQueueRunning == 1)
  {
    objc_msgSend((id)__LookupQueueLock, "lock");
    objc_msgSend((id)__LookupQueue, "removeObject:", self);
    objc_msgSend((id)__LookupQueueLock, "unlock");
  }
}

- (void)_postEntryChanged
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CNFavoritesEntryChangedNotification"), self, 0);
}

- (void)_lookupNotFound
{
  int abUid;
  NSString *abDatabaseUUID;
  NSString **p_abDatabaseUUID;

  if (self->_label || self->_name || (self->_abUid & 0x80000000) == 0 || (self->_abIdentifier & 0x80000000) == 0)
  {
    abUid = self->_abUid;
    if ((abUid & 0x80000000) == 0)
      self->_abUid = -1;
    if ((self->_abIdentifier & 0x80000000) == 0)
    {
      p_abDatabaseUUID = &self->_abDatabaseUUID;
      abDatabaseUUID = self->_abDatabaseUUID;
      self->_abIdentifier = -1;
      if (!abDatabaseUUID)
        goto LABEL_12;
      goto LABEL_11;
    }
    p_abDatabaseUUID = &self->_abDatabaseUUID;
    abDatabaseUUID = self->_abDatabaseUUID;
    if (abDatabaseUUID)
    {
LABEL_11:

      *p_abDatabaseUUID = 0;
LABEL_12:
      *((_BYTE *)self + 32) |= 1u;
      -[ABFavoritesEntry _postEntryChanged](self, "_postEntryChanged");
      return;
    }
    if ((abUid & 0x80000000) == 0)
      goto LABEL_12;
  }
}

- (void)_lookupChanged:(id)a3
{
  int v5;
  int v6;
  uint64_t abUid;
  unsigned int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;

  v5 = *((_DWORD *)a3 + 2);
  if ((v5 & 0x80000000) == 0)
    self->_abIdentifier = v5;
  v6 = *((_DWORD *)a3 + 3);
  if (v6 < 0)
  {
    v8 = 0;
    v9 = v5 >= 0;
    abUid = 0xFFFFFFFFLL;
  }
  else
  {
    abUid = self->_abUid;
    self->_abUid = v6;
    v8 = abUid >> 31;
    v9 = 1;
  }
  if (*((_QWORD *)a3 + 2))
  {

    self->_value = (NSString *)*((_QWORD *)a3 + 2);
  }
  if (*((_QWORD *)a3 + 3))
  {

    self->_name = (NSString *)*((_QWORD *)a3 + 3);
    v8 = 1;
  }
  if (*((_QWORD *)a3 + 4))
  {

    self->_label = (NSString *)*((_QWORD *)a3 + 4);
    v8 = 1;
  }
  if ((self->_abUid & 0x80000000) == 0)
  {

    self->_abDatabaseUUID = (NSString *)*((_QWORD *)a3 + 5);
    if ((abUid & 0x80000000) != 0)
      goto LABEL_17;
LABEL_16:
    if (-[ABFavoritesListManager entryIsDuplicateAndThusRemoved:oldUid:](+[ABFavoritesListManager sharedInstance](ABFavoritesListManager, "sharedInstance"), "entryIsDuplicateAndThusRemoved:oldUid:", self, abUid))
    {
      return;
    }
    goto LABEL_17;
  }

  if ((abUid & 0x80000000) == 0)
    goto LABEL_16;
LABEL_17:
  if (v8)
    -[ABFavoritesEntry _postEntryChanged](self, "_postEntryChanged");
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", abUid);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("CNFavoritesEntryOldIdentityKey"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CNFavoritesEntryIdentityChangedNotification"), self, v11);

  }
  *((_BYTE *)self + 32) |= 1u;
}

@end
