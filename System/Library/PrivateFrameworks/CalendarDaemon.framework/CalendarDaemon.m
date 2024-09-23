uint64_t CalGetValuesFromFetchedObjectDictionary(void *a1, const char *a2)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("values"));
}

uint64_t CalEntityCopyPropertyAllowingLimitedAccess(void *a1, uint64_t a2, void *a3, _QWORD *a4, char a5)
{
  id v9;
  int Type;
  char v11;
  uint64_t v12;
  uint64_t PropertyDescriptor;
  uint64_t v14;
  os_unfair_lock_s *RecordLock;
  char IsDeleted;
  _BYTE *v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  const os_unfair_lock *Context;
  uint64_t v22;
  const os_unfair_lock *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v27;
  int v28;
  const os_unfair_lock *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  CFTypeID v33;
  uint64_t RelatedObject;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  CFIndex Count;
  CFIndex v41;
  CFIndex i;
  void *v43;
  NSObject *v44;
  int Property;
  _BYTE v46[18];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  *a4 = 0;
  Type = CalEntityGetType();
  if (objc_msgSend(v9, "eventAccessLevel") == 1)
    v11 = a5;
  else
    v11 = 1;
  if ((v11 & 1) == 0 && CalGetDatabaseForRecord())
  {
    if (Type == 6)
    {
      v12 = CalDatabaseCopyLimitedAccessVirtualStore();
    }
    else
    {
      if (Type != 1)
        goto LABEL_11;
      v12 = CalDatabaseCopyLimitedAccessVirtualCalendar();
    }
    a2 = v12;
  }
LABEL_11:
  if (CalEntityGetPropertyIDFromName(Type) == -1)
  {
    v19 = v9;
    if (CalEntityGetType() == 6
      && objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D0BA60]))
    {
      Property = objc_msgSend(v19, "managedConfigurationAccountAccessForStore:", a2);
      *a4 = CFNumberCreate(0, kCFNumberIntType, &Property);

      v18 = 0;
    }
    else
    {

      if (CalEntityIsDeleted())
        v18 = 1010;
      else
        v18 = 1008;
    }
    goto LABEL_71;
  }
  PropertyDescriptor = CPRecordGetPropertyDescriptor();
  if (!PropertyDescriptor)
  {
    v18 = 1001;
    goto LABEL_71;
  }
  v14 = PropertyDescriptor;
  RecordLock = (os_unfair_lock_s *)CalGetRecordLock();
  os_unfair_lock_lock(RecordLock);
  IsDeleted = _CalEntityIsDeleted();
  v17 = (_BYTE *)MEMORY[0x1E0D0A160];
  if ((IsDeleted & 1) == 0)
  {
    v20 = *(_DWORD *)(v14 + 8);
    if (v20 > 7)
      goto LABEL_47;
    if (((1 << v20) & 0xCC) != 0)
    {
      if (*MEMORY[0x1E0D0A160])
      {
        if (a2)
        {
          if (CPRecordGetStore())
          {
            Context = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (Context)
              os_unfair_lock_assert_owner(Context + 20);
          }
        }
      }
      v22 = CPRecordCopyProperty();
      goto LABEL_67;
    }
    if (v20)
    {
      if (v20 == 1)
      {
        if (*MEMORY[0x1E0D0A160])
        {
          if (a2)
          {
            if (CPRecordGetStore())
            {
              v23 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v23)
                os_unfair_lock_assert_owner(v23 + 20);
            }
          }
        }
        Property = CPRecordGetProperty();
        v22 = (uint64_t)CFNumberCreate(0, kCFNumberIntType, &Property);
        goto LABEL_67;
      }
LABEL_47:
      v27 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v28 = *(_DWORD *)(v14 + 8);
        Property = 67109378;
        *(_DWORD *)v46 = v28;
        *(_WORD *)&v46[4] = 2112;
        *(_QWORD *)&v46[6] = a3;
        _os_log_impl(&dword_1B6A18000, v27, OS_LOG_TYPE_ERROR, "Unknown property type %d for name %@", (uint8_t *)&Property, 0x12u);
      }
      v18 = 1001;
      goto LABEL_68;
    }
    v24 = *(_QWORD *)(v14 + 16);
    if (v24 == MEMORY[0x1E0D0BED8])
    {
      v25 = 1;
    }
    else
    {
      v25 = *(_QWORD *)(v14 + 32);
      if ((unint64_t)(v25 - 1) >= 3)
      {
        if (v24 == MEMORY[0x1E0D0BED0])
        {
          v25 = 2;
        }
        else if (v24 == MEMORY[0x1E0D0BEE8] || v24 == MEMORY[0x1E0D0BEE0])
        {
          v25 = 3;
        }
        else
        {
          v25 = 0;
        }
      }
    }
    if (*MEMORY[0x1E0D0A160])
    {
      if (a2)
      {
        if (CPRecordGetStore())
        {
          v29 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v29)
            os_unfair_lock_assert_owner(v29 + 20);
        }
      }
    }
    v30 = (const void *)CPRecordGetProperty();
    if (v30)
    {
      v31 = v30;
      if (v25 == 3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_60:
          v32 = v31;
LABEL_66:
          v22 = (uint64_t)CFRetain(v32);
LABEL_67:
          v18 = 0;
          *a4 = v22;
          goto LABEL_68;
        }
        v36 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v37 = v36;
          Property = 138543618;
          *(_QWORD *)v46 = a3;
          *(_WORD *)&v46[8] = 2114;
          *(_QWORD *)&v46[10] = objc_opt_class();
          v38 = *(id *)&v46[10];
          _os_log_impl(&dword_1B6A18000, v37, OS_LOG_TYPE_ERROR, "Wrong data type for attribute '%{public}@': %{public}@", (uint8_t *)&Property, 0x16u);

        }
LABEL_74:
        v18 = 1011;
        goto LABEL_68;
      }
      v33 = CFGetTypeID(v30);
      if (v33 == CalRelationGetTypeID())
      {
        RelatedObject = CalRelationGetRelatedObject();
        if ((v11 & 1) == 0)
          RelatedObject = FilterCalendarAndSource(Type, RelatedObject, a3);
        if (RelatedObject)
        {
          v32 = (const void *)RelatedObject;
          goto LABEL_66;
        }
      }
      else
      {
        if (v33 != CalToManyRelationGetTypeID())
        {
          if (v33 == CFStringGetTypeID() || v33 == CFNumberGetTypeID() || v33 == CFBooleanGetTypeID())
            goto LABEL_60;
          v44 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            Property = 134218242;
            *(_QWORD *)v46 = v33;
            *(_WORD *)&v46[8] = 2112;
            *(_QWORD *)&v46[10] = a3;
            _os_log_impl(&dword_1B6A18000, v44, OS_LOG_TYPE_ERROR, "Unknown property typeId %ld for name %@. Assume its a value type and proceed.", (uint8_t *)&Property, 0x16u);
          }
          goto LABEL_74;
        }
        v18 = CalToManyRelationCopyObjects();
        if (!v18)
          goto LABEL_68;
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", CFArrayGetCount((CFArrayRef)v18));
        Count = CFArrayGetCount((CFArrayRef)v18);
        if (Count >= 1)
        {
          v41 = Count;
          for (i = 0; i != v41; ++i)
          {
            CFArrayGetValueAtIndex((CFArrayRef)v18, i);
            CADEntityCopyObjectIDUnlocked();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
              objc_msgSend(v39, "addObject:", v43);

          }
        }
        *a4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v39);
        CFRelease((CFTypeRef)v18);

      }
    }
    v18 = 0;
    goto LABEL_68;
  }
  v18 = 1010;
LABEL_68:
  if (*v17)
    os_unfair_lock_assert_owner(RecordLock);
  os_unfair_lock_unlock(RecordLock);
LABEL_71:

  return v18;
}

uint64_t CADEventAccessTypeFromAuthStatus(uint64_t a1)
{
  if (a1 == 4)
    return 1;
  else
    return 2 * (a1 == 3);
}

uint64_t CalEntityGetPropertyIDFromName(int a1)
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 1:
      return CalCalendarGetPropertyIDWithPropertyName();
    case 2:
    case 3:
      return CalCalendarItemGetPropertyIDWithPropertyName();
    case 4:
      return CalAlarmGetPropertyIDWithPropertyName();
    case 5:
      return CalRecurrenceGetPropertyIDWithPropertyName();
    case 6:
      return CalStoreGetPropertyIDWithPropertyName();
    case 7:
      return CalAttendeeGetPropertyIDWithPropertyName();
    case 8:
      return CalOrganizerGetPropertyIDWithPropertyName();
    case 9:
      return CalEventActionGetPropertyIDWithPropertyName();
    case 10:
      return CalExceptionDateGetPropertyIDWithPropertyName();
    case 11:
      return CalAttachmentGetPropertyIDWithPropertyName();
    case 12:
    case 13:
    case 22:
    case 25:
    case 26:
    case 27:
      goto LABEL_5;
    case 14:
      return CalLocationGetPropertyIDWithPropertyName();
    case 15:
      return CalShareeGetPropertyIDWithPropertyName();
    case 16:
    case 17:
    case 19:
      return CalNotificationGetPropertyIDWithPropertyName();
    case 18:
      return CalResourceChangeGetPropertyIDWithPropertyName();
    case 20:
      return CalSuggestedEventInfoGetPropertyIDWithPropertyName();
    case 21:
      return CalContactGetPropertyIDWithPropertyName();
    case 23:
      return CalConferenceGetPropertyIDWithPropertyName();
    case 24:
      return CalErrorGetPropertyIDWithPropertyName();
    case 28:
      return CalImageGetPropertyIDWithPropertyName();
    case 29:
      return CalColorGetPropertyIDWithPropertyName();
    default:
      if (a1 == 102)
        return CalNotificationGetPropertyIDWithPropertyName();
LABEL_5:
      v3 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v4[0] = 67109378;
        v4[1] = a1;
        v5 = 2080;
        v6 = "CalEntityGetPropertyIDFromName";
        _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_ERROR, "Invalid entity type [%d] passed to [%s].", (uint8_t *)v4, 0x12u);
      }
      return 0xFFFFFFFFLL;
  }
}

uint64_t CalEntityCopyProperty(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  return CalEntityCopyPropertyAllowingLimitedAccess(a1, a2, a3, a4, 0);
}

id CADEntityCopyObjectID()
{
  uint64_t Type;
  uint64_t ID;
  void *v2;

  Type = CalEntityGetType();
  ID = CalEntityGetID();
  v2 = 0;
  if ((int)Type >= 1 && (int)ID >= 1)
  {
    if ((_DWORD)ID == 0x7FFFFFFF)
    {
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:", Type, 0x7FFFFFFFLL);
    }
    else
    {
      CalGetDatabaseForRecord();
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", Type, ID, CalDatabaseGetAuxilliaryDatabaseID());
    }
  }
  return v2;
}

id CalFetchedObjectDictionary(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    if ((_DWORD)a3)
    {
      v21[0] = CFSTR("entityType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v21[1] = CFSTR("rowID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v9;
      v21[2] = CFSTR("dbID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v10;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = v22;
      v13 = v21;
      v14 = 3;
      goto LABEL_6;
    }
    v23[0] = CFSTR("entityType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("rowID");
    v24[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v9;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = v24;
    v18 = v23;
    v19 = 2;
LABEL_9:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!(_DWORD)a3)
  {
    v27[0] = CFSTR("entityType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v8;
    v27[1] = CFSTR("rowID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = CFSTR("values");
    v28[1] = v9;
    v28[2] = v7;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = v28;
    v18 = v27;
    v19 = 3;
    goto LABEL_9;
  }
  v25[0] = CFSTR("entityType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v25[1] = CFSTR("rowID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  v25[2] = CFSTR("dbID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = CFSTR("values");
  v26[2] = v10;
  v26[3] = v7;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = v26;
  v13 = v25;
  v14 = 4;
LABEL_6:
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v15;
}

uint64_t CalAuthorizationStatusFromTCCAuthRight(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = 3;
  switch(a2)
  {
    case 0:
      if (TCCAccessRestricted())
        result = 1;
      else
        result = 2;
      break;
    case 1:
      result = TCCAccessRestricted() != 0;
      break;
    case 2:
      return result;
    case 4:
      result = 4;
      break;
    default:
      v4 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v5 = 134217984;
        v6 = a2;
        _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_ERROR, "Unexpected tcc_authorization_right_t (int value: %llu): we don't support this kind of authorization.", (uint8_t *)&v5, 0xCu);
      }
      result = 2;
      break;
  }
  return result;
}

void sub_1B6A1C4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

id CADEntityCopyObjectIDUnlocked()
{
  uint64_t Type;
  uint64_t ID;
  void *v2;

  Type = _CalEntityGetType();
  ID = CPRecordGetID();
  v2 = 0;
  if ((int)Type >= 1 && (int)ID >= 1)
  {
    CalGetDatabaseForRecord();
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", Type, ID, CalDatabaseGetAuxilliaryDatabaseID());
  }
  return v2;
}

void sub_1B6A1E7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A1E938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void sub_1B6A1EA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A1ED94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CalEntityCopyPropertyValues(void *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  void *v16;
  BOOL v17;
  void *v18;
  CFTypeID v19;
  uint64_t Type;
  uint64_t ID;
  uint64_t AuxilliaryDatabaseID;
  CFTypeID v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v34;
  uint64_t v35;
  id v36;
  unsigned int v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFTypeRef cf;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  cf = 0;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = v7;
  v10 = (void *)v8;
  obj = v9;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    v37 = *MEMORY[0x1E0D0BE78];
    v38 = *(_QWORD *)v45;
    v35 = a2;
    v36 = v6;
    v34 = (void *)v8;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(obj);
        v15 = CalEntityCopyPropertyAllowingLimitedAccess(v6, a2, *(void **)(*((_QWORD *)&v44 + 1) + 8 * i), &cf, 0);
        v16 = (void *)cf;
        if (v15)
          v17 = 1;
        else
          v17 = cf == 0;
        if (v17)
        {
          v18 = (void *)cf;
        }
        else
        {
          v19 = CFGetTypeID(cf);
          if (v19 == CPRecordGetTypeID())
          {
            Type = CalEntityGetType();
            ID = CalEntityGetID();
            AuxilliaryDatabaseID = v37;
            if ((_DWORD)ID != 0x7FFFFFFF)
            {
              CalGetDatabaseForRecord();
              AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
              CFRelease(v16);
            }
            CalFetchedObjectDictionary(Type, ID, AuxilliaryDatabaseID, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            cf = v18;
          }
          else
          {
            v23 = CFGetTypeID(v16);
            if (v23 != CFSetGetTypeID())
              goto LABEL_27;
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", CFSetGetCount((CFSetRef)v16));
            CalGetDatabaseForRecord();
            v24 = CalDatabaseGetAuxilliaryDatabaseID();
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v25 = v16;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v41;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v41 != v28)
                    objc_enumerationMutation(v25);
                  CalFetchedObjectDictionary(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "entityType"), objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "entityID"), v24, 0);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "addObject:", v30);

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
              }
              while (v27);
            }

            CFRelease(v25);
            cf = v18;
            a2 = v35;
            v6 = v36;
            v10 = v34;
          }
          v13 = v38;
        }
        v16 = v18;
        if (v18)
        {
LABEL_27:
          objc_msgSend(v10, "addObject:", v16);
          CFRelease(v16);
          continue;
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v31);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v12);
  }

  if (a4)
    *a4 = 0;

  return v10;
}

BOOL CalendarCanContainAnAllowedEntityType(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "eventAccessLevel")
    && (CalCalendarCanContainEntityTypeAndStoreAllowsIt() & 1) != 0
    || objc_msgSend(v2, "reminderAccessGranted")
    && (CalCalendarCanContainEntityTypeAndStoreAllowsIt() & 1) != 0;

  return v3;
}

uint64_t CADEntityIsInRestrictedStore(void *a1, const void *a2, uint64_t a3)
{
  id v5;
  int Type;
  CFTypeRef v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  int v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  Type = CalEntityGetType();
  v12 = Type;
  v7 = owningEntity(a2, &v12);
  if (!v7 || (CalEntityIsVirtual() & 1) == 0)
  {
    if (v12 > 5)
    {
      if (v12 != 101)
      {
        if (v12 == 17)
        {
          v9 = objc_msgSend(v5, "isNotificationRestricted:forAction:", v7, a3);
          goto LABEL_14;
        }
        if (v12 == 6)
        {
          v9 = objc_msgSend(v5, "isStoreRestricted:forAction:", v7, a3);
          goto LABEL_14;
        }
LABEL_16:
        if (v7)
        {
          if ((CalEntityIsNew() & 1) == 0)
          {
            v11 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              v14 = v12;
              v15 = 1024;
              v16 = Type;
              _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_ERROR, "Internal error: missed entity type in CADEntityAccessIsDenied: %i (from original entityType %i)", buf, 0xEu);
            }
          }
        }
        goto LABEL_3;
      }
    }
    else if ((v12 - 2) >= 2)
    {
      if (v12 == 1)
      {
        v9 = objc_msgSend(v5, "isCalendarRestricted:forAction:", v7, a3);
LABEL_14:
        v8 = v9;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    v9 = objc_msgSend(v5, "isCalendarItemRestricted:forAction:", v7, a3);
    goto LABEL_14;
  }
LABEL_3:
  v8 = 0;
LABEL_15:

  return v8;
}

CFTypeRef owningEntity(CFTypeRef a1, int *a2)
{
  int Type;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  const void *v9;

  Type = CalEntityGetType();
  if (!a1)
  {
LABEL_27:
    if (a2)
      goto LABEL_28;
    return a1;
  }
  v5 = -1;
  while (2)
  {
    switch(Type)
    {
      case 4:
        v6 = CalAlarmCopyOwningEntity();
        goto LABEL_24;
      case 5:
        v6 = CalRecurrenceCopyOwner();
        goto LABEL_24;
      case 6:
      case 12:
      case 13:
      case 22:
      case 26:
      case 27:
        goto LABEL_27;
      case 7:
      case 8:
        goto LABEL_23;
      case 9:
        v6 = CalEventActionCopyOwningEvent();
        goto LABEL_24;
      case 10:
        v6 = CalExceptionDateCopyOwner();
        goto LABEL_24;
      case 11:
        v6 = CalAttachmentCopyOwner();
        goto LABEL_24;
      case 14:
        v6 = CalLocationCopyOwner();
        goto LABEL_24;
      case 15:
        v6 = CalShareeCopyOwner();
        goto LABEL_24;
      case 16:
      case 17:
      case 19:
        goto LABEL_7;
      case 18:
        v7 = CalResourceChangeCopyNotification();
        if (v7)
        {
          v8 = (const void *)v7;
          v9 = (const void *)CalNotificationCopyOwner();
          CFRelease(v8);
LABEL_25:
          if (!v9)
            goto LABEL_27;
          a1 = CFAutorelease(v9);
          Type = CalEntityGetType();
          if (++v5 >= 5)
            goto LABEL_27;
          continue;
        }
        Type = 18;
        if (!a2)
          return a1;
LABEL_28:
        *a2 = Type;
        return a1;
      case 20:
        v6 = CalSuggestedEventInfoCopyOwner();
        goto LABEL_24;
      case 21:
        v6 = CalContactCopyOwner();
        goto LABEL_24;
      case 23:
        v6 = CalConferenceCopyOwner();
        goto LABEL_24;
      case 24:
        v6 = CalErrorCopyOwner();
        goto LABEL_24;
      case 25:
        v6 = CalAttachmentFileCopyStore();
        goto LABEL_24;
      case 28:
        v6 = CalImageCopyStore();
        goto LABEL_24;
      case 29:
        v6 = CalColorCopyStore();
        goto LABEL_24;
      default:
        if (Type == 100)
        {
LABEL_23:
          v6 = CalParticipantCopyOwner();
        }
        else
        {
          if (Type != 102)
            goto LABEL_27;
LABEL_7:
          v6 = CalNotificationCopyOwner();
        }
LABEL_24:
        v9 = (const void *)v6;
        goto LABEL_25;
    }
  }
}

const void *CADCopyEntityInDatabase(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  const void *v5;

  v3 = (os_unfair_lock_s *)(a1 + 80);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = (const void *)_CADGetEntity(a1, v4);

  if (v5)
    CFRetain(v5);
  if (*MEMORY[0x1E0D0A160])
    os_unfair_lock_assert_owner(v3);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t _CADGetEntity(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t LimitedAccessVirtualCalendar;
  void *v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _CalDatabaseGetRecordStore();
  v3 = objc_msgSend(v2, "entityType");
  v4 = 0;
  switch(v3)
  {
    case -1:
      goto LABEL_4;
    case 0:
    case 13:
    case 22:
    case 26:
    case 27:
      goto LABEL_33;
    case 1:
      if (objc_msgSend(v2, "isVirtual"))
      {
        LimitedAccessVirtualCalendar = _CalDatabaseGetLimitedAccessVirtualCalendar();
      }
      else
      {
        objc_msgSend(v2, "entityID");
        LimitedAccessVirtualCalendar = _CalGetCalendarWithUID();
      }
      goto LABEL_32;
    case 2:
    case 3:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalGetCalendarItemWithRowID();
      goto LABEL_32;
    case 4:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalAlarmGetWithUID();
      goto LABEL_32;
    case 5:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalRecurrenceGetWithUID();
      goto LABEL_32;
    case 6:
      if (objc_msgSend(v2, "isVirtual"))
      {
        LimitedAccessVirtualCalendar = _CalDatabaseGetLimitedAccessVirtualStore();
      }
      else
      {
        objc_msgSend(v2, "entityID");
        LimitedAccessVirtualCalendar = _CalGetStoreWithUID();
      }
      goto LABEL_32;
    case 7:
    case 8:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalParticipantGetWithUID();
      goto LABEL_32;
    case 9:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalEventActionGetWithUID();
      goto LABEL_32;
    case 10:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalExceptionDateGetWithUID();
      goto LABEL_32;
    case 11:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalAttachmentGetWithUID();
      goto LABEL_32;
    case 12:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalCategoryGetWithUID();
      goto LABEL_32;
    case 14:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalLocationGetWithUID();
      goto LABEL_32;
    case 15:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalShareeGetWithUID();
      goto LABEL_32;
    case 16:
    case 17:
    case 19:
      goto LABEL_9;
    case 18:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalResourceChangeGetWithUID();
      goto LABEL_32;
    case 20:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalSuggestedEventInfoGetWithUID();
      goto LABEL_32;
    case 21:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalContactGetWithUID();
      goto LABEL_32;
    case 23:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalConferenceGetWithUID();
      goto LABEL_32;
    case 24:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalErrorGetWithUID();
      goto LABEL_32;
    case 25:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalAttachmentFileGetWithUID();
      goto LABEL_32;
    case 28:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalImageGetWithUID();
      goto LABEL_32;
    case 29:
      objc_msgSend(v2, "entityID");
      LimitedAccessVirtualCalendar = _CalColorGetWithUID();
      goto LABEL_32;
    default:
      if ((v3 - 100) >= 2)
      {
        if (v3 == 102)
        {
LABEL_9:
          objc_msgSend(v2, "entityID");
          LimitedAccessVirtualCalendar = _CalNotificationGetWithUID();
LABEL_32:
          v4 = LimitedAccessVirtualCalendar;
        }
      }
      else
      {
LABEL_4:
        v6 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v7 = v6;
          v9[0] = 67109120;
          v9[1] = objc_msgSend(v2, "entityType");
          _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_ERROR, "Unknown entity type in CADCopyEntity (type = %i)", (uint8_t *)v9, 8u);

        }
        v4 = 0;
      }
LABEL_33:

      return v4;
  }
}

uint64_t CreateFilterFromRowIDs(void *a1, void *a2)
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
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
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
          if ((objc_msgSend(v4, "containsObject:", v11, (_QWORD)v15) & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v12 = CalFilterCreateWithDatabaseShowingCalendarsWithUIDsAndEntityType();
  }
  else
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "allObjects");
      v13 = CalFilterCreateWithDatabaseFilteringCalendarsWithUIDs();
    }
    else
    {
      v13 = CalFilterCreateWithDatabaseShowingAll();
    }
    v12 = v13;
  }

  return v12;
}

void sub_1B6A21A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 160), 8);
  _Block_object_dispose((const void *)(v40 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t CalGetEntityIDFromFetchedObjectDictonary(void *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;

  if (!a1)
    return 0;
  v7 = a1;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("entityType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rowID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dbID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    if (a2)
      *a2 = objc_msgSend(v8, "intValue");
    if (a3)
      *a3 = objc_msgSend(v9, "intValue");
    if (a4)
      *a4 = objc_msgSend(v10, "intValue");
  }

  return v12;
}

void sub_1B6A22078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B6A232CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12)
{
  id *v12;
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v14 - 168));
  objc_destroyWeak((id *)(v14 - 160));
  _Unwind_Resume(a1);
}

id GetSharedXPCInterfaceForCADInterface()
{
  if (GetSharedXPCInterfaceForCADInterface_onceToken != -1)
    dispatch_once(&GetSharedXPCInterfaceForCADInterface_onceToken, &__block_literal_global_14);
  return (id)GetSharedXPCInterfaceForCADInterface___remoteInterface;
}

id GetSharedXPCInterfaceForCADClientInterface()
{
  if (GetSharedXPCInterfaceForCADClientInterface_onceToken != -1)
    dispatch_once(&GetSharedXPCInterfaceForCADClientInterface_onceToken, &__block_literal_global_353);
  return (id)GetSharedXPCInterfaceForCADClientInterface____clientInterface;
}

void sub_1B6A24444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A24618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CADEKPersistentEventDefaultPropertiesToLoad()
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
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[32];

  v16[31] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B3D0];
  v16[0] = *MEMORY[0x1E0D0B820];
  v16[1] = v0;
  v1 = *MEMORY[0x1E0D0B6F8];
  v16[2] = *MEMORY[0x1E0D0B680];
  v16[3] = v1;
  v2 = *MEMORY[0x1E0D0B2F0];
  v16[4] = *MEMORY[0x1E0D0B408];
  v16[5] = v2;
  v3 = *MEMORY[0x1E0D0B358];
  v16[6] = *MEMORY[0x1E0D0B360];
  v16[7] = v3;
  v4 = *MEMORY[0x1E0D0B308];
  v16[8] = *MEMORY[0x1E0D0B330];
  v16[9] = v4;
  v5 = *MEMORY[0x1E0D0B2C0];
  v16[10] = *MEMORY[0x1E0D0B3D8];
  v16[11] = v5;
  v6 = *MEMORY[0x1E0D0B300];
  v16[12] = *MEMORY[0x1E0D0B410];
  v16[13] = v6;
  v7 = *MEMORY[0x1E0D0B630];
  v16[14] = *MEMORY[0x1E0D0B2F8];
  v16[15] = v7;
  v8 = *MEMORY[0x1E0D0B3E0];
  v16[16] = *MEMORY[0x1E0D0B280];
  v16[17] = v8;
  v9 = *MEMORY[0x1E0D0B6D0];
  v16[18] = *MEMORY[0x1E0D0B710];
  v16[19] = v9;
  v10 = *MEMORY[0x1E0D0B6D8];
  v16[20] = *MEMORY[0x1E0D0B290];
  v16[21] = v10;
  v11 = *MEMORY[0x1E0D0B400];
  v16[22] = *MEMORY[0x1E0D0B6B8];
  v16[23] = v11;
  v12 = *MEMORY[0x1E0D0B3F0];
  v16[24] = *MEMORY[0x1E0D0B638];
  v16[25] = v12;
  v13 = *MEMORY[0x1E0D0B338];
  v16[26] = *MEMORY[0x1E0D0B658];
  v16[27] = v13;
  v14 = *MEMORY[0x1E0D0B2E8];
  v16[28] = *MEMORY[0x1E0D0B6F0];
  v16[29] = v14;
  v16[30] = *MEMORY[0x1E0D0B6C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 31);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B6A266C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A26B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A26F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A2714C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A272F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A274AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A27694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t CADObjectPassedOrSkippedAccessCheck(void *a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a1;
  v4 = objc_msgSend(a2, "eventAccessLevel");
  if (v4)
  {
    if (v4 == 1)
      v5 = objc_msgSend(v3, "isVirtual");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1B6A283AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A28820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A29698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t CADEntityExistsInDatabaseAndIsAccessible(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const void *v8;
  const void *v9;
  uint64_t v10;

  v7 = a2;
  v8 = CADCopyEntityInDatabase(a1, a3);
  if (v8)
  {
    v9 = v8;
    v10 = CADEntityIsInRestrictedStore(v7, v8, a4) ^ 1;
    CFRelease(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void CADAccountManagementFromSource(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  if (a1 >= 3)
  {
    v1 = (void *)MEMORY[0x1E0C99DA0];
    v2 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "raise:format:", v2, CFSTR("Invalid source account management value: [%@]"), v3);

  }
}

void sub_1B6A2BAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A2BC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A2BE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A2C0DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id getCADXPCProxyHelperLogHandle()
{
  if (getCADXPCProxyHelperLogHandle_onceToken != -1)
    dispatch_once(&getCADXPCProxyHelperLogHandle_onceToken, &__block_literal_global_63);
  return (id)getCADXPCProxyHelperLogHandle_loggingHandle;
}

uint64_t _minimumAuthStatus(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = 2;
      if (a1 != 2)
      {
        v4 = 4;
        v5 = a2 == 3 || a1 == 3;
        v6 = 3;
        if (!v5)
          v6 = 0;
        if (a2 == 4)
          v6 = 4;
        if (a1 != 4)
          v4 = v6;
        if (a2 == 1)
          v4 = 1;
        if (a1 == 1)
          v7 = 1;
        else
          v7 = v4;
        if (a2 != 2)
          return v7;
      }
    }
  }
  return result;
}

void sub_1B6A2FBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A2FF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A300EC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B6A3010C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1B6A300B0);
}

void sub_1B6A30424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A307DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___auditTokenForCurrentProcess_block_invoke()
{
  kern_return_t v0;
  int v1;
  NSObject *v2;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  v0 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&_auditTokenForCurrentProcess_token, &task_info_outCnt);
  if (v0)
  {
    v1 = v0;
    v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_FAULT))
      ___auditTokenForCurrentProcess_block_invoke_cold_1(v1, v2);
  }
}

uint64_t ___processIdentifierForCurrentProcess_block_invoke()
{
  uint64_t result;

  result = getpid();
  _processIdentifierForCurrentProcess_pid = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1B6A30D78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B6A322D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B6A32A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1B6A33070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A333D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A337A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A33B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A33EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1B6A34060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A345A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A354F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A35704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t CADSourceFromAccountManagement(unint64_t a1)
{
  unint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (a1 >= 3)
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "raise:format:", v3, CFSTR("Invalid account management value: [%@]"), v4);

  }
  return v1;
}

unint64_t CADTargetFromAccountManagement(unint64_t a1)
{
  unint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (a1 >= 3)
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "raise:format:", v3, CFSTR("Invalid account management value: [%@]"), v4);

  }
  return v1;
}

void CADAccountManagementFromTarget(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  if (a1 >= 3)
  {
    v1 = (void *)MEMORY[0x1E0C99DA0];
    v2 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "raise:format:", v2, CFSTR("Invalid target account management value: [%@]"), v3);

  }
}

void CADStatsRegisterCollectionCallback(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CADStatsCallback *v8;
  void *v9;
  CADStatsCallback *v10;

  v3 = a2;
  v4 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&statsCollectionCallbacksLock);
  v5 = (void *)statsCollectionCallbacks;
  if (!statsCollectionCallbacks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)statsCollectionCallbacks;
    statsCollectionCallbacks = v6;

    v5 = (void *)statsCollectionCallbacks;
  }
  v8 = [CADStatsCallback alloc];
  v9 = (void *)objc_msgSend(v3, "copy");

  v10 = -[CADStatsCallback initWithEventName:callback:](v8, "initWithEventName:callback:", v4, v9);
  objc_msgSend(v5, "addObject:", v10);

  os_unfair_lock_unlock((os_unfair_lock_t)&statsCollectionCallbacksLock);
}

void CADStatsCollectWithAllStatCollectorsAndContext(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v4 = a1;
  createStatsInstances(1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CADStatsCollectWithStatCollectorsAndContext(v5, v4, v3);

}

void CADStatsCollectWithStatCollectorsAndContext(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  CFIndex k;
  const void *ValueAtIndex;
  const void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __CFArray *Mutable;
  const void *v27;
  const void *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t ii;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  NSObject *v64;
  void *v65;
  CFIndex cf;
  CFTypeRef cfa;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);
  void *v80;
  id v81;
  __int128 *p_buf;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t, uint64_t);
  void *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t v104[128];
  __int128 buf;
  uint64_t v106;
  int v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v68 = a3;
  mach_absolute_time();
  v69 = (void *)objc_opt_new();
  v72 = (void *)objc_opt_new();
  v71 = (void *)objc_opt_new();
  v70 = (void *)objc_opt_new();
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v101 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_msgSend(v11, "prepareWithContext:", v6);
        if (objc_msgSend(v11, "wantsStores"))
          objc_msgSend(v69, "addObject:", v11);
        if (objc_msgSend(v11, "wantsCalendars"))
          objc_msgSend(v72, "addObject:", v11);
        if (objc_msgSend(v11, "wantsOccurrences"))
          objc_msgSend(v71, "addObject:", v11);
        if (objc_msgSend(v11, "wantsEvents"))
          objc_msgSend(v70, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "database");
  if (objc_msgSend(v69, "count") || objc_msgSend(v72, "count"))
  {
    v12 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_DEBUG, "Collecting statistics about stores and calendars.", (uint8_t *)&buf, 2u);
    }
    v13 = (const __CFArray *)CalDatabaseCopyOfAllStores();
    v14 = v13;
    if (v13)
    {
      cf = CFArrayGetCount(v13);
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v15 = v69;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v97;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v97 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * j), "processStores:", v14);
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
        }
        while (v16);
      }

      if (cf >= 1)
      {
        for (k = 0; k != cf; ++k)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v14, k);
          v21 = (const void *)CalStoreCopyCalendars();
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          v22 = v72;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v93;
            do
            {
              for (m = 0; m != v23; ++m)
              {
                if (*(_QWORD *)v93 != v24)
                  objc_enumerationMutation(v22);
                objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * m), "processCalendars:inStore:", v21, ValueAtIndex);
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
            }
            while (v23);
          }

          if (v21)
            CFRelease(v21);
        }
      }
      CFRelease(v14);
    }
  }
  else
  {
    v64 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6A18000, v64, OS_LOG_TYPE_DEBUG, "Skipping statistics for stores and calendars because nobody's interested.", (uint8_t *)&buf, 2u);
    }
  }
  Mutable = CFArrayCreateMutable(0, 1, MEMORY[0x1E0C9B378]);
  v27 = (const void *)CalDatabaseCopyBirthdayCalendar();
  if (v27)
  {
    CFArrayAppendValue(Mutable, v27);
    CFRelease(v27);
  }
  v28 = (const void *)CalFilterCreateWithDatabaseFilteringCalendars();
  CFRelease(Mutable);
  v29 = objc_msgSend(v71, "count");
  v30 = CADLogHandle;
  v31 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
  if (v29)
  {
    if (v31)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6A18000, v30, OS_LOG_TYPE_DEBUG, "Collecting statistics about occurrences.", (uint8_t *)&buf, 2u);
    }
    cfa = (CFTypeRef)CalDatabaseCopyEventOccurrenceCache();
    v65 = (void *)CalEventOccurrenceCacheCopyTimeZone();
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v32 = v71;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v88, v108, 16);
    if (v33)
    {
      v34 = 0;
      v35 = *(_QWORD *)v89;
      do
      {
        for (n = 0; n != v33; ++n)
        {
          if (*(_QWORD *)v89 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * n), "desiredOccurrenceRange");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (v37)
          {
            if (v34)
            {
              objc_msgSend(v34, "unionRange:", v37);
              v39 = objc_claimAutoreleasedReturnValue();

              v34 = (id)v39;
            }
            else
            {
              v34 = v37;
            }
          }

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v88, v108, 16);
      }
      while (v33);

      if (v34)
        goto LABEL_63;
    }
    else
    {

    }
    v40 = objc_alloc(MEMORY[0x1E0D0C420]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v40, "initWithDate:timeZone:", v41, v65);

    objc_msgSend(v42, "calendarDateByAddingDays:", -1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "calendarDateByAddingDays:", 365);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc(MEMORY[0x1E0D0C2B8]);
    objc_msgSend(v43, "date");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v45, "initWithStartDate:endDate:", v46, v47);

LABEL_63:
    objc_msgSend(v34, "startDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "endDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = MEMORY[0x1E0C809B0];
    v84 = 3221225472;
    v85 = __CADStatsCollectWithStatCollectorsAndContext_block_invoke;
    v86 = &unk_1E6A36BB8;
    v87 = v32;
    CalEventOccurrenceCacheProcessEventOccurrencesInDateRange();

    CalDatabaseReset();
    CFRelease(cfa);

    goto LABEL_64;
  }
  if (v31)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6A18000, v30, OS_LOG_TYPE_DEBUG, "Skipping statistics about occurrences because nobody's interested.", (uint8_t *)&buf, 2u);
  }
LABEL_64:
  v50 = objc_msgSend(v70, "count");
  v51 = CADLogHandle;
  v52 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
  if (v50)
  {
    if (v52)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6A18000, v51, OS_LOG_TYPE_DEBUG, "Collecting statistics about events.", (uint8_t *)&buf, 2u);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v106 = 0x2020000000;
    v107 = 0;
    v77 = MEMORY[0x1E0C809B0];
    v78 = 3221225472;
    v79 = __CADStatsCollectWithStatCollectorsAndContext_block_invoke_50;
    v80 = &unk_1E6A36BE0;
    p_buf = &buf;
    v81 = v70;
    CalDatabaseProcessEventsWithCalendarFilter();

    _Block_object_dispose(&buf, 8);
  }
  else if (v52)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6A18000, v51, OS_LOG_TYPE_DEBUG, "Skipping statistics about events because nobody's interested.", (uint8_t *)&buf, 2u);
  }
  CFRelease(v28);
  mach_absolute_time();
  CalAnalyticsTimeIntervalFromMachTimes();
  v54 = v53;
  v55 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v54;
    _os_log_impl(&dword_1B6A18000, v55, OS_LOG_TYPE_INFO, "Finished collecting stats in [%f] seconds", (uint8_t *)&buf, 0xCu);
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v56 = v7;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v74;
    do
    {
      for (ii = 0; ii != v57; ++ii)
      {
        if (*(_QWORD *)v74 != v58)
          objc_enumerationMutation(v56);
        v60 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * ii);
        objc_msgSend(v60, "eventDictionaries");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "eventName");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v61, "count"))
          v63 = v62 == 0;
        else
          v63 = 1;
        if (!v63)
          objc_msgSend(v68, "setObject:forKeyedSubscript:", v61, v62);

      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
    }
    while (v57);
  }

}

void sub_1B6A3AF30(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x270], 8);
  _Unwind_Resume(a1);
}

id createStatsInstances(char a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  v28[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        if ((a1 & 1) != 0 || objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v8), "enabled"))
        {
          v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "alloc"), "init");
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  os_unfair_lock_lock((os_unfair_lock_t)&statsCollectionCallbacksLock);
  v11 = (void *)objc_msgSend((id)statsCollectionCallbacks, "copy", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&statsCollectionCallbacksLock);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if ((a1 & 1) != 0 || objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "enabled"))
          objc_msgSend(v3, "addObject:", v16);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  return v3;
}

void CADStatsCollect()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CADStatCollectionContext *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  createStatsInstances(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    v1 = (void *)objc_opt_new();
    v14 = objc_alloc_init(CADStatCollectionContext);
    CADStatsCollectWithStatCollectorsAndContext(v0, v14, v1);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v20;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v20 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v6));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          if (v7)
          {
            v17 = 0u;
            v18 = 0u;
            v15 = 0u;
            v16 = 0u;
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v16;
              do
              {
                v12 = 0;
                do
                {
                  if (*(_QWORD *)v16 != v11)
                    objc_enumerationMutation(v8);
                  CalAnalyticsSendEvent();
                  ++v12;
                }
                while (v10 != v12);
                v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
              }
              while (v10);
            }
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v4);
    }

  }
  else
  {
    v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_DEBUG, "Not running stats collection because all events are disabled", buf, 2u);
    }
  }

}

void CalRequestAuthorizationForServiceWithCompletion(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v7 = a2;
  v8 = a4;
  v9 = a5;
  if (_getTCCServer_onceToken != -1)
    dispatch_once(&_getTCCServer_onceToken, &__block_literal_global_6);
  v10 = (id)_getTCCServer_server;
  v11 = (void *)tcc_message_options_create();
  tcc_service_singleton_for_CF_name();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v7 && v10 && v11 && v12)
  {
    tcc_message_options_set_client_dict();
    tcc_message_options_set_reply_handler_policy();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __CalRequestAuthorizationForServiceWithCompletion_block_invoke;
    v16[3] = &unk_1E6A36C08;
    v17 = v9;
    v14 = (void *)MEMORY[0x1BCC9D8DC](v16);
    tcc_server_message_request_authorization_change();

  }
  else
  {
    v15 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_ERROR, "Failed to init at least one tcc parameter.", buf, 2u);
    }
    (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, 1, 1015);
  }

}

void ___getTCCServer_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = tcc_server_create();
  v1 = (void *)_getTCCServer_server;
  _getTCCServer_server = v0;

}

void sub_1B6A3BBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1B6A3BDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A3C164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A3C75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Block_object_dispose((const void *)(v38 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A3D724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A3D948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A3DDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A3EAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;

  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

BOOL _shouldSaveCallback(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  _occurrenceIDForComponent(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

id _copyExternalIDCallback(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  _occurrenceIDForComponent(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

void sub_1B6A3FA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A3FC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A4001C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A403E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A418EC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x400], 8);
  _Block_object_dispose(&STACK[0x368], 8);
  _Unwind_Resume(a1);
}

void _recursivelyFindAndReplacePropertyFromRebasedObject(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D0B838];
    objc_msgSend(v16, "valueForKey:", *MEMORY[0x1E0D0B838]);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    v38 = 0;
    if (v18)
    {
      do
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "valueForKey:", v12);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v34[5];
        v34[5] = v20;

        if (v34[5])
          break;
        if (!objc_msgSend(v18, "isTemporary"))
        {
          if (!v34[5])
          {
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = ___recursivelyFindAndReplacePropertyFromRebasedObject_block_invoke;
            v26[3] = &unk_1E6A37060;
            v18 = v18;
            v27 = v18;
            v31 = &v39;
            v28 = v9;
            v29 = v12;
            v32 = &v33;
            v30 = v10;
            objc_msgSend(v28, "withDatabaseForObject:perform:", v18, v26);

          }
          break;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "valueForKey:", v17);
        v23 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v23;
      }
      while (v23);
    }
    if (v34[5] && !*((_DWORD *)v40 + 6))
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "mutableCopy");

      objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, v10);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v34[5], v12);

    }
    _Block_object_dispose(&v33, 8);

  }
  _Block_object_dispose(&v39, 8);

}

void sub_1B6A41D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A42C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t _CADGetExistingOrInsertedEntity(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a3;
  v6 = a2;
  if (objc_msgSend(v6, "isTemporary"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  else
  {
    v7 = _CADGetEntity(a1, v6);
  }

  return v7;
}

void sub_1B6A443A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id convertDefaultValueToNil(void *a1)
{
  id v1;
  double v2;
  id v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v1, "doubleValue"), v2 == 0.0))
    v3 = 0;
  else
    v3 = v1;

  return v3;
}

void sub_1B6A45364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A45A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A45C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A45DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id _occurrenceIDForComponent(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    objc_msgSend(v2, "uid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "recurrence_id");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "icsString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v3;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void ___handleNewCreatedEvents_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = MEMORY[0x1BCC9BEF0](a3, objc_msgSend(*(id *)(a1 + 32), "entityID"));
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = CalCalendarItemCopyCalendar();
    if (v6)
    {
      v7 = (const void *)v6;
      CADEntityCopyObjectID();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      CFRelease(v7);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1008;
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1010;
  }
}

void ___recursivelyFindAndReplacePropertyFromRebasedObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    v13 = 0;
    if (CalEntityCopyPropertyAllowingLimitedAccess(*(void **)(a1 + 40), (uint64_t)v4, *(void **)(a1 + 48), &v13, 1))v6 = 1;
    else
      v6 = v13 == 0;
    if (v6)
    {
      v7 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 48);
        v9 = *(_QWORD *)(a1 + 56);
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v15 = v8;
        v16 = 2112;
        v17 = v9;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_ERROR, "Error when retrieving %@ for rebased item %@ from %@", buf, 0x20u);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1008;
    }
    else
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v13;

    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1010;
  }
}

void sub_1B6A4764C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void CADLogInitIfNeeded()
{
  if (CADLogInitIfNeeded_onceToken != -1)
    dispatch_once(&CADLogInitIfNeeded_onceToken, &__block_literal_global_8);
}

void sub_1B6A4802C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B6A48624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A48A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A48E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1B6A4927C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A4A3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B6A4B6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A4C504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A4D364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A4F3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a21, 8);
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

_BYTE *OUTLINED_FUNCTION_4(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_9()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

void __getCADXPCProxyHelperLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(CADCalendarLogSubsystem, "CADXPCProxyHelper");
  v1 = (void *)getCADXPCProxyHelperLogHandle_loggingHandle;
  getCADXPCProxyHelperLogHandle_loggingHandle = (uint64_t)v0;

}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B6A5199C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A51BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CalRedactString(int a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v13;

  v3 = a2;
  v4 = v3;
  switch(a1)
  {
    case 1:
      CalRedactURLString();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2:
      ICSRedactString();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 3:
      v13 = 0;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithICSString:options:error:", v3, 257, &v13);

      if (v7)
        goto LABEL_6;
      goto LABEL_12;
    case 4:
      objc_msgSend(MEMORY[0x1E0DDB7A0], "parseableDocumentFromICS:options:", v3, 257);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
LABEL_6:
        if (_sortICSDocuments)
          v8 = 20;
        else
          v8 = 16;
        objc_msgSend(v7, "ICSStringWithOptions:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Parse failure: Failed to generate redacted ICS; original ICS had length %lu]"),
            objc_msgSend(v4, "length"));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v6 = v11;

      }
      else
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Parse failure: Bad ICS. %lu characters]"), objc_msgSend(v4, "length"));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 5:
      v5 = (__CFString *)v3;
LABEL_14:
      v6 = v5;
      break;
    default:
      v6 = CFSTR("<private>");
      break;
  }

  return v6;
}

uint64_t writeNextTaskHeader(FILE *a1, FILE *a2)
{
  uint64_t v4;
  void (**v5)(_QWORD);
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD);
  int v7;
  int v8;
  int v9;
  const char *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  size_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  _QWORD v23[7];
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __writeNextTaskHeader_block_invoke;
  v24[3] = &unk_1E6A378F8;
  v24[4] = &v29;
  v24[5] = &v33;
  v24[6] = &v37;
  v24[7] = &v25;
  v5 = (void (**)(_QWORD))MEMORY[0x1BCC9D8DC](v24);
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __writeNextTaskHeader_block_invoke_2;
  v23[3] = &unk_1E6A37920;
  v23[5] = &v37;
  v23[6] = a1;
  v23[4] = &v33;
  v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCC9D8DC](v23);
  while (2)
  {
    switch(*((_DWORD *)v26 + 6))
    {
      case 0:
        if ((((uint64_t (**)(_QWORD, const char *, _QWORD))v6)[2](v6, "\nTask ", 0) & 1) == 0)
          goto LABEL_25;
        v7 = 1;
        goto LABEL_23;
      case 1:
        v11 = fgetc(a1);
        ++*((_DWORD *)v38 + 6);
        if (v11 != 10)
        {
          if ((v11 - 58) <= 0xFFFFFFF5)
LABEL_16:
            v5[2](v5);
          continue;
        }
        v12 = fgetc(a1);
        if (v12 == 10)
        {
          ++*((_DWORD *)v38 + 6);
          v7 = 2;
LABEL_23:
          *((_DWORD *)v26 + 6) = v7;
          continue;
        }
        if (v12 != 82)
        {
          ungetc(v12, a1);
          goto LABEL_16;
        }
        ungetc(82, a1);
        *((_DWORD *)v30 + 6) = 3;
LABEL_25:
        if (*((int *)v34 + 6) >= 1)
          fprintf(a2, "[Parse failure: %i unparsed bytes prior to task header]\n", *((_DWORD *)v34 + 6));
        if (*((_DWORD *)v30 + 6))
        {
          v14 = fseek(a1, -(uint64_t)*((int *)v38 + 6), 1);
          MEMORY[0x1E0C80A78](v14);
          v16 = (char *)v23 - v15;
          v18 = v17;
          if (fread((char *)v23 - v15, v17, 1uLL, a1) == 1)
          {
            fwrite(v16, v18, 1uLL, a2);
          }
          else
          {
            +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              writeNextTaskHeader_cold_1(a1, v20);

          }
          v21 = *((_DWORD *)v38 + 6);
          if ((int)v18 < v21)
            fprintf(a2, "<truncated %i bytes of task header>\n", v21 - v18);
          v19 = *((unsigned int *)v30 + 6);
        }
        else
        {
          v19 = 0;
        }

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v29, 8);
        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);
        return v19;
      case 2:
        v8 = fgetc(a1);
        switch(v8)
        {
          case -1:
            goto LABEL_16;
          case 60:
            v9 = 2;
            v10 = "<<<< ";
            break;
          case 62:
            v9 = 1;
            v10 = ">>>> ";
            break;
          default:
            ungetc(v8, a1);
            goto LABEL_16;
        }
        *((_DWORD *)v30 + 6) = v9;
        ++*((_DWORD *)v38 + 6);
        if ((((uint64_t (**)(_QWORD, const char *, uint64_t))v6)[2](v6, v10, 1) & 1) == 0)
          continue;
        v7 = 3;
        goto LABEL_23;
      case 3:
        v13 = fgetc(a1);
        ++*((_DWORD *)v38 + 6);
        if (v13 != 10)
          continue;
        goto LABEL_25;
      default:
        continue;
    }
  }
}

void sub_1B6A58DB0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v1 + 120), 8);
  _Block_object_dispose((const void *)(v1 + 152), 8);
  _Block_object_dispose((const void *)(v2 - 168), 8);
  _Block_object_dispose((const void *)(v2 - 136), 8);
  _Unwind_Resume(a1);
}

_QWORD *__writeNextTaskHeader_block_invoke(_QWORD *result)
{
  *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = 0;
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) += *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = 0;
  *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) = 0;
  return result;
}

uint64_t __writeNextTaskHeader_block_invoke_2(uint64_t a1, _BYTE *a2, int a3)
{
  int v6;
  _BYTE *v7;
  int v8;

  if (*a2)
  {
    v6 = 0;
    v7 = a2;
    while (1)
    {
      v8 = getc(*(FILE **)(a1 + 48));
      if (v8 == -1)
        return 0;
      if (v8 == (char)*v7)
      {
        ++v6;
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                 + 24)
                                                                     + v6;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        if (a3)
        {
          ungetc(v8, *(FILE **)(a1 + 48));
          return 0;
        }
        if (v6)
        {
          ungetc(v8, *(FILE **)(a1 + 48));
          v6 = 0;
        }
        else
        {
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        }
      }
      v7 = &a2[v6];
      if (!*v7)
        goto LABEL_13;
    }
  }
  else
  {
    v6 = 0;
LABEL_13:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6;
    return 1;
  }
}

void __writeRequest_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("GET"), CFSTR("HEAD"), CFSTR("POST"), CFSTR("PUT"), CFSTR("DELETE"), CFSTR("CONNECT"), CFSTR("OPTIONS"), CFSTR("TRACE"), CFSTR("PATCH"), CFSTR("PROPFIND"), CFSTR("PROPPATCH"), CFSTR("MKCOL"), CFSTR("COPY"), CFSTR("MOVE"), CFSTR("LOCK"), CFSTR("UNLOCK"), CFSTR("MKCALENDAR"),
    CFSTR("REPORT"),
    CFSTR("VERSION-CONTROL"),
    CFSTR("CHECKOUT"),
    CFSTR("CHECKIN"),
    CFSTR("UNCHECKOUT"),
    CFSTR("MKWORKSPACE"),
    CFSTR("UPDATE"),
    CFSTR("LABEL"),
    CFSTR("MERGE"),
    CFSTR("BASELINE-CONTROL"),
    CFSTR("MKACTIVITY"),
    CFSTR("ORDERPATCH"),
    CFSTR("ACL"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)writeRequest_knownMethods;
  writeRequest_knownMethods = v0;

}

void fputNSString(FILE *a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fwrite((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), 1uLL, a1);

}

id readFromFileUntilStringAndReturnData(FILE *a1, _BYTE *a2, int a3)
{
  unsigned __int8 *v6;
  uint64_t v7;
  int v8;
  int v9;
  _BYTE *v10;
  int v11;
  unsigned __int8 *v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  NSObject *v17;

  v6 = (unsigned __int8 *)malloc_type_malloc(0x800uLL, 0x7C7337E8uLL);
  if (*a2)
  {
    v7 = 0;
    v8 = 0;
    v9 = 2048;
    v10 = a2;
    do
    {
      v11 = getc(a1);
      if (v11 == -1)
        break;
      if (v11 == (char)*v10)
        ++v8;
      else
        v8 = v11 == (char)*a2;
      v6[v7++] = v11;
      if (v9 <= (int)v7)
      {
        v9 *= 2;
        v12 = (unsigned __int8 *)reallocf(v6, v9);
        if (!v12)
        {
          +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            readFromFileUntilStringAndReturnData_cold_1();

          v16 = 0;
          return v16;
        }
        v6 = v12;
      }
      v10 = &a2[v8];
    }
    while (*v10);
    if ((a3 & 1) != 0)
      goto LABEL_20;
    if (v7 >= 2)
    {
      v13 = 2415919360;
      v14 = *v6;
      if (!*v6)
        goto LABEL_30;
      if (v14 == 254)
      {
        v15 = v6[1];
        if (v15 == 255)
          goto LABEL_30;
      }
      else if (v14 == 255)
      {
        v15 = v6[1];
        if (v15 == 254)
          goto LABEL_32;
      }
      else
      {
        v15 = v6[1];
      }
      if (!v15)
      {
LABEL_32:
        v13 = 2483028224;
        goto LABEL_30;
      }
    }
    v13 = 4;
    goto LABEL_30;
  }
  LODWORD(v7) = 0;
  if (!a3)
  {
    v13 = 4;
    v8 = 0;
LABEL_30:
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, (int)v7 - v8, v13, 1);
    return v16;
  }
  v8 = 0;
LABEL_20:
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v6, (int)v7 - v8);
  return v16;
}

void __writeHttpStatus_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" .0123456789"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)writeHttpStatus_disallowedCharacters;
  writeHttpStatus_disallowedCharacters = v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Unrecognized Status Code"), CFSTR("Continue"), CFSTR("Switching Protocols"), CFSTR("OK"), CFSTR("Created"), CFSTR("Accepted"), CFSTR("Non Authoritative Information"), CFSTR("No Content"), CFSTR("Reset Content"), CFSTR("Partial Content"), CFSTR("Multiple Choices"), CFSTR("Moved Permanently"), CFSTR("Found"), CFSTR("See Other"), CFSTR("Not Modified"), CFSTR("Use Proxy"), CFSTR("Temporary Redirect"),
    CFSTR("Bad Request"),
    CFSTR("Unauthorized"),
    CFSTR("Payment Required"),
    CFSTR("Forbidden"),
    CFSTR("Not Found"),
    CFSTR("Method Not Allowed"),
    CFSTR("Not Acceptable"),
    CFSTR("Proxy Authentication Required"),
    CFSTR("Request Timeout"),
    CFSTR("Conflict"),
    CFSTR("Gone"),
    CFSTR("Length Required"),
    CFSTR("Precondition Failed"),
    CFSTR("Request Entity Too Large"),
    CFSTR("Request URI Too Long"),
    CFSTR("Unsupported Media Type"),
    CFSTR("Requested Range Not Satisfiable"),
    CFSTR("Expectation Failed"),
    CFSTR("I'm a teapot"),
    CFSTR("Internal Server Error"),
    CFSTR("Not Implemented"),
    CFSTR("Bad Gateway"),
    CFSTR("Service Unavailable"),
    CFSTR("Gateway Timeout"),
    CFSTR("HTTP Version Not Supported"),
    CFSTR("Multi-Status"),
    CFSTR("Unprocessable Entity"),
    CFSTR("Locked"),
    CFSTR("Failed Dependency"),
    CFSTR("Insufficient Storage"),
    0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)writeHttpStatus_expectedStatusDescriptions;
  writeHttpStatus_expectedStatusDescriptions = v3;

}

void __getHeaderRedactionBehaviors_block_invoke()
{
  void *v0;

  v0 = (void *)getHeaderRedactionBehaviors_headerRedactionBehaviors;
  getHeaderRedactionBehaviors_headerRedactionBehaviors = (uint64_t)&unk_1E6A50AB8;

}

uint64_t checkForString(FILE *a1, _BYTE *a2, char a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  if (*a2)
  {
    v6 = 0;
    while (1)
    {
      v7 = fgetc(a1);
      if (v7 == -1)
        return 0;
      if (v7 != (char)a2[v6])
        break;
      v8 = v6 + 1;
      if (!a2[++v6])
      {
        v10 = -v8;
        goto LABEL_8;
      }
    }
    v11 = 0;
    LODWORD(v10) = ~(_DWORD)v6;
    goto LABEL_12;
  }
  LODWORD(v10) = 0;
LABEL_8:
  v11 = 1;
  if ((a3 & 1) == 0)
LABEL_12:
    fseek(a1, (int)v10, 1);
  return v11;
}

CalXMLElementRedactionRule *___createRedactionRules_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  CalXMLElementRedactionRule *v11;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);
  }
  v11 = objc_alloc_init(CalXMLElementRedactionRule);
  -[CalXMLElementRedactionRule setElementName:](v11, "setElementName:", 5);
  -[CalXMLElementRedactionRule setContent:](v11, "setContent:", a4);
  -[CalXMLElementRedactionRule setCdata:](v11, "setCdata:", a4);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v9);

  return v11;
}

CalXMLAttributeRedactionRule *___createRedactionRules_block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  CalXMLAttributeRedactionRule *v9;

  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    objc_msgSend(v6, "setAttributes:", v8);
  }
  v9 = objc_alloc_init(CalXMLAttributeRedactionRule);
  -[CalXMLAttributeRedactionRule setAttributeName:](v9, "setAttributeName:", 5);
  -[CalXMLAttributeRedactionRule setAttributeValue:](v9, "setAttributeValue:", a4);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

  return v9;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

int *OUTLINED_FUNCTION_6_0()
{
  return __error();
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

char *urlStringRedactor(uint64_t a1, uint64_t a2, int *a3)
{
  void *v4;
  id v5;
  const char *v6;
  char *v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a2, *a3, 4, 0);
  CalRedactURLString();
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  *a3 = strlen(v6);
  v7 = strdup(v6);

  return v7;
}

_BYTE *blobRedactor(void *a1, uint64_t a2, _DWORD *a3)
{
  id v5;
  _BYTE *v6;

  v5 = a1;
  if (a2)
  {
    v6 = malloc_type_malloc(0x15uLL, 0xD5AE65E8uLL);
    if (v6)
    {
      ICSRedactBytes();
      v6[20] = 0;
      *a3 = 20;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
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

void sub_1B6A5AFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A5B474(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B6A5B4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B6A5B53C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B6A5BB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _resourceChangeDeletionQueue()
{
  if (_resourceChangeDeletionQueue_queueCreationGuard != -1)
    dispatch_once(&_resourceChangeDeletionQueue_queueCreationGuard, &__block_literal_global_20);
  return (id)_resourceChangeDeletionQueue_queue;
}

void ___resourceChangeDeletionQueue_block_invoke()
{
  id v0;
  const char *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  objc_opt_class();
  CalGenerateQualifiedIdentifierWithClassAndSubdomain();
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v0, "UTF8String");

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create(v1, v4);
  v3 = (void *)_resourceChangeDeletionQueue_queue;
  _resourceChangeDeletionQueue_queue = (uint64_t)v2;

}

Class __getEKCalendarVisibilityManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!EventKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6A37C30;
    v5 = 0;
    EventKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EventKitLibraryCore_frameworkLibrary)
    __getEKCalendarVisibilityManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("EKCalendarVisibilityManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getEKCalendarVisibilityManagerClass_block_invoke_cold_2();
  getEKCalendarVisibilityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B6A62684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCalDiagObfuscatorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CalendarDiagnosticsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6A37CC8;
    v5 = 0;
    CalendarDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CalendarDiagnosticsLibraryCore_frameworkLibrary)
    __getCalDiagObfuscatorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CalDiagObfuscator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCalDiagObfuscatorClass_block_invoke_cold_2();
  getCalDiagObfuscatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DefaultCalendarChanged()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0D0C508]);
}

__CFArray *createArrayOfRecordIDsFromXPCArray(void *a1)
{
  id v1;
  size_t count;
  __CFArray *Mutable;
  size_t i;
  const void *v5;

  v1 = a1;
  count = xpc_array_get_count(v1);
  Mutable = CFArrayCreateMutable(0, count, MEMORY[0x1E0C9B378]);
  if (count)
  {
    for (i = 0; i != count; ++i)
    {
      xpc_array_get_uint64(v1, i);
      v5 = (const void *)CalRecordIDCreate();
      CFArrayAppendValue(Mutable, v5);
      CFRelease(v5);
    }
  }

  return Mutable;
}

void sub_1B6A65A20(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1B6A65A70()
{
  JUMPOUT(0x1B6A65A60);
}

__CFString *_CADStringFromXPCActivityState(unint64_t a1)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1 < 6)
    return off_1E6A37F00[a1];
  v3 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = v3;
    objc_msgSend(v4, "numberWithLong:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_ERROR, "WARNING: Cannot convert unrecognized state: [%@] to a string. Returning nil as a result.", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

void sub_1B6A67178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id _CADPropertySearchPredicateExtendWhereClause(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    switch(a2)
    {
      case 2:
        objc_msgSend(v5, "appendString:", v6);
        break;
      case 1:
        objc_msgSend(v5, "appendFormat:", CFSTR(" OR %@"), v6);
        break;
      case 0:
        objc_msgSend(v5, "appendFormat:", CFSTR(" AND %@"), v6);
        break;
    }
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

uint64_t _CADPropertySearchPredicateGetAllowedFilterTypes()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
}

__CFString **getSearchPropertyInfo(unint64_t a1)
{
  if (a1 > 0xE)
    return 0;
  else
    return off_1E6A37F30[a1];
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

void sub_1B6A6A0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6A1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6A310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CADEKPersistentEventMinimumDefaultPropertiesToLoad()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B680];
  v4[0] = *MEMORY[0x1E0D0B3D0];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0D0B3D8];
  v4[2] = *MEMORY[0x1E0D0B308];
  v4[3] = v1;
  v2 = *MEMORY[0x1E0D0B300];
  v4[4] = *MEMORY[0x1E0D0B338];
  v4[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  return (id)objc_claimAutoreleasedReturnValue();
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

void sub_1B6A6AB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6AEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6B25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6B4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6B624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  uint64_t v9;
  id v10;

  if (a2 == 1)
  {
    v10 = objc_begin_catch(exception_object);
    NSLog(CFSTR("Exception raised while attempting to refresh store: %@"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 48) + 8) + 24) = 1001;

    objc_end_catch();
    JUMPOUT(0x1B6A6B608);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B6A6B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6B8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A6E054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

uint64_t _CalEntitySetProperty(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  int Type;
  id v8;
  uint64_t PropertyDescriptor;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const os_unfair_lock *v14;
  uint64_t v15;
  const os_unfair_lock *v16;
  const void *Property;
  CFTypeID v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  const os_unfair_lock *Context;
  void *v28;
  NSObject *v29;
  id v30;
  const os_unfair_lock *v31;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  Type = _CalEntityGetType();
  v8 = a3;
  if (CalEntityGetPropertyIDFromName(Type) != -1)
  {
    PropertyDescriptor = CPRecordGetPropertyDescriptor();
    if (PropertyDescriptor)
    {
      v10 = PropertyDescriptor;
      if (*(_DWORD *)(PropertyDescriptor + 8))
      {
        v11 = 0;
        goto LABEL_5;
      }
      v15 = *(_QWORD *)(PropertyDescriptor + 16);
      if (v15 != MEMORY[0x1E0D0BED8])
      {
        v11 = *(_QWORD *)(PropertyDescriptor + 32);
        if ((unint64_t)(v11 - 1) >= 3)
        {
          v22 = v15 == MEMORY[0x1E0D0BEE8] || v15 == MEMORY[0x1E0D0BEE0];
          v23 = 3;
          if (!v22)
            v23 = 0;
          if (v15 == MEMORY[0x1E0D0BED0])
            v11 = 2;
          else
            v11 = v23;
        }
        else if (v11 == 1)
        {
          goto LABEL_25;
        }
LABEL_5:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((*(_DWORD *)(v10 + 8) | 2) != 2)
          {
            v12 = (void *)CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
              goto LABEL_53;
            goto LABEL_54;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (*(_DWORD *)(v10 + 8) != 3)
            {
              v12 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
              {
LABEL_53:
                v24 = v12;
                v32 = 138543618;
                v33 = v8;
                v34 = 2114;
                v35 = (id)objc_opt_class();
                v25 = v35;
                _os_log_impl(&dword_1B6A18000, v24, OS_LOG_TYPE_ERROR, "Wrong data type for attribute '%{public}@': %{public}@", (uint8_t *)&v32, 0x16u);

              }
LABEL_54:
              v13 = 1011;
              goto LABEL_55;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = *(_DWORD *)(v10 + 8);
              if (v20)
              {
                if (v20 == 1)
                {
                  objc_msgSend(a4, "intValue");
                  if (a2)
                  {
                    if (*MEMORY[0x1E0D0A160])
                    {
                      if (CPRecordGetStore())
                      {
                        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
                        if (Context)
                          os_unfair_lock_assert_owner(Context + 20);
                      }
                    }
                  }
                  goto LABEL_20;
                }
                if (v20 != 6)
                {
                  v12 = (void *)CADLogHandle;
                  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                    goto LABEL_53;
                  goto LABEL_54;
                }
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (*(_DWORD *)(v10 + 8) != 7)
                {
                  v12 = (void *)CADLogHandle;
                  if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                    goto LABEL_54;
                  goto LABEL_53;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a4)
                  {
                    v28 = (void *)CADLogHandle;
                    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      v29 = v28;
                      v32 = 138412290;
                      v33 = (id)objc_opt_class();
                      v30 = v33;
                      _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_ERROR, "Value of class '%@' not handled.", (uint8_t *)&v32, 0xCu);

                    }
                    goto LABEL_21;
                  }
                  if (a2)
                  {
                    if (*MEMORY[0x1E0D0A160])
                    {
                      if (CPRecordGetStore())
                      {
                        v31 = (const os_unfair_lock *)CPRecordStoreGetContext();
                        if (v31)
                          os_unfair_lock_assert_owner(v31 + 20);
                      }
                    }
                  }
                  goto LABEL_20;
                }
                if (v11 != 3)
                {
                  v12 = (void *)CADLogHandle;
                  if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                    goto LABEL_54;
                  goto LABEL_53;
                }
              }
            }
          }
        }
        if (a2)
        {
          if (*MEMORY[0x1E0D0A160])
          {
            if (CPRecordGetStore())
            {
              v14 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v14)
                os_unfair_lock_assert_owner(v14 + 20);
            }
          }
        }
LABEL_20:
        CPRecordSetProperty();
LABEL_21:
        v13 = 0;
        goto LABEL_55;
      }
LABEL_25:
      if (a2)
      {
        if (*MEMORY[0x1E0D0A160])
        {
          if (CPRecordGetStore())
          {
            v16 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v16)
              os_unfair_lock_assert_owner(v16 + 20);
          }
        }
      }
      Property = (const void *)CPRecordGetProperty();
      if (Property && (v18 = CFGetTypeID(Property), v18 == CalRelationGetTypeID()))
      {
        CalRelationSetRelatedObject();
      }
      else
      {
        v21 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v32 = 138412290;
          v33 = v8;
          _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_ERROR, "Expected relation for property %@", (uint8_t *)&v32, 0xCu);
        }
      }
      goto LABEL_21;
    }
LABEL_35:
    v13 = 1001;
    goto LABEL_55;
  }
  if (Type == 6 && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D0BA80]) & 1) != 0)
    goto LABEL_21;
  if ((_CalEntityIsDeleted() & 1) == 0)
  {
    v19 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v32 = 138412546;
      v33 = v8;
      v34 = 1024;
      LODWORD(v35) = Type;
      _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_ERROR, "Invalid attribute name '%@' passed for entity type %d", (uint8_t *)&v32, 0x12u);
    }
    goto LABEL_35;
  }
  v13 = 1010;
LABEL_55:

  return v13;
}

uint64_t FilterCalendarAndSource(int a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t LimitedAccessVirtualStore;

  v5 = a3;
  if (CalGetDatabaseForRecord())
  {
    if (a1 == 1)
    {
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D0B578]))
      {
        LimitedAccessVirtualStore = _CalDatabaseGetLimitedAccessVirtualStore();
        goto LABEL_8;
      }
    }
    else if (a1 == 2 && objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D0B280]))
    {
      LimitedAccessVirtualStore = _CalDatabaseGetLimitedAccessVirtualCalendar();
LABEL_8:
      a2 = LimitedAccessVirtualStore;
    }
  }

  return a2;
}

const __CFString *CADAccountActionDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("Write");
  if (a1)
    return v1;
  else
    return CFSTR("Read");
}

void sub_1B6A728FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1B6A72FE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A75144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

CFTypeRef CADOwningEntity(const void *a1)
{
  return owningEntity(a1, 0);
}

uint64_t CADEntityIsInManagedStore(void *a1, const void *a2)
{
  id v3;
  uint64_t Type;
  CFTypeRef v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v3 = a1;
  Type = CalEntityGetType();
  v9 = Type;
  v5 = owningEntity(a2, (int *)&v9);
  if ((int)v9 <= 5)
  {
    if (v9 - 2 >= 2)
    {
      if (v9 == 1)
      {
        v6 = objc_msgSend(v3, "isCalendarManaged:", v5);
LABEL_9:
        v7 = v6;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
LABEL_8:
    v6 = objc_msgSend(v3, "isCalendarItemManaged:", v5);
    goto LABEL_9;
  }
  if (v9 == 101)
    goto LABEL_8;
  if (v9 == 6)
  {
    v6 = objc_msgSend(v3, "isStoreManaged:", v5);
    goto LABEL_9;
  }
LABEL_11:
  if (v5)
    NSLog(CFSTR("Internal error: missed entity type in CADEntityAccessIsDenied: %i (from original entityType %i)"), v9, Type);
  v7 = 0;
LABEL_10:

  return v7;
}

void _CADDeleteEntity()
{
  int Type;
  void *v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  Type = _CalEntityGetType();
  switch(Type)
  {
    case 1:
      _CalRemoveCalendar();
      return;
    case 2:
      _CalRemoveEvent();
      return;
    case 3:
      CalGetDatabaseForRecord();
      _CalRemoveTask();
      return;
    case 4:
      _CalRemoveAlarm();
      return;
    case 5:
      _CalRemoveRecurrence();
      return;
    case 6:
      _CalRemoveStore();
      return;
    case 7:
      _CalRemoveAttendee();
      return;
    case 8:
      _CalRemoveOrganizer();
      return;
    case 9:
      _CalEventActionRemove();
      return;
    case 10:
      if (_CalExceptionDateGetOwner())
        _CalCalendarItemRemoveExceptionDate();
      _CalRemoveExceptionDate();
      return;
    case 11:
      _CalRemoveAttachment();
      return;
    case 12:
      _CalCategoryRemove();
      return;
    case 13:
    case 22:
    case 25:
    case 26:
    case 27:
      goto LABEL_4;
    case 14:
      _CalRemoveLocation();
      return;
    case 15:
      _CalRemoveSharee();
      return;
    case 16:
    case 17:
    case 19:
      goto LABEL_2;
    case 18:
      _CalRemoveResourceChange();
      return;
    case 20:
      _CalRemoveSuggestedEventInfo();
      return;
    case 21:
      _CalRemoveContact();
      return;
    case 23:
      _CalRemoveConference();
      return;
    case 24:
      _CalRemoveError();
      return;
    case 28:
      _CalRemoveImage();
      return;
    case 29:
      _CalRemoveColor();
      return;
    default:
      if (Type == 102)
      {
LABEL_2:
        _CalRemoveNotification();
      }
      else
      {
LABEL_4:
        v1 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v2 = v1;
          v3[0] = 67109120;
          v3[1] = _CalEntityGetType();
          _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_ERROR, "Unknown entity type in _CADDeleteEntity (%i)", (uint8_t *)v3, 8u);

        }
      }
      return;
  }
}

void sub_1B6A77580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1B6A790DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_1B6A793A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A79768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A79988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A79C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A79EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7A0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7A25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7A438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1B6A7A654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7A840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1B6A7AA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7AC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7AF98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7B3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7BCF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7BEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7C010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7C224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B6A7C474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void ___auditTokenForCurrentProcess_block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B6A18000, a2, OS_LOG_TYPE_FAULT, "Failed to get audit token for current process. Result = %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void writeNextTaskHeader_cold_1(FILE *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  ferror(a1);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6A18000, a2, v3, "Error reading from input: %i", v4);
  OUTLINED_FUNCTION_5();
}

void readFromFileUntilStringAndReturnData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6A18000, v0, v1, "Unable to realloc %i bytes", v2);
  OUTLINED_FUNCTION_1();
}

void __getEKCalendarVisibilityManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *EventKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CADNotificationUtilities.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getEKCalendarVisibilityManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKCalendarVisibilityManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CADNotificationUtilities.m"), 33, CFSTR("Unable to find class %s"), "EKCalendarVisibilityManager");

  __break(1u);
}

void __getCalDiagObfuscatorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CalendarDiagnosticsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CADDiagnosticsDiagnosticDatabaseCollector.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCalDiagObfuscatorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCalDiagObfuscatorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CADDiagnosticsDiagnosticDatabaseCollector.m"), 19, CFSTR("Unable to find class %s"), "CalDiagObfuscator");

  __break(1u);
  CFAbsoluteTimeGetCurrent();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99288](allocator, name, tryAbbrev);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

uint64_t CPFileCompressionZDeflate()
{
  return MEMORY[0x1E0CFA288]();
}

uint64_t CPRecordCopyProperty()
{
  return MEMORY[0x1E0CFA3C0]();
}

uint64_t CPRecordGetID()
{
  return MEMORY[0x1E0CFA3F0]();
}

uint64_t CPRecordGetOriginalProperty()
{
  return MEMORY[0x1E0CFA400]();
}

uint64_t CPRecordGetProperty()
{
  return MEMORY[0x1E0CFA408]();
}

uint64_t CPRecordGetPropertyDescriptor()
{
  return MEMORY[0x1E0CFA410]();
}

uint64_t CPRecordGetStore()
{
  return MEMORY[0x1E0CFA418]();
}

uint64_t CPRecordGetTypeID()
{
  return MEMORY[0x1E0CFA420]();
}

uint64_t CPRecordSetProperty()
{
  return MEMORY[0x1E0CFA478]();
}

uint64_t CPRecordStoreGetContext()
{
  return MEMORY[0x1E0CFA5A0]();
}

uint64_t CalAbsoluteTimeGetAbsoluteTimeInTimeZone()
{
  return MEMORY[0x1E0D0BF60]();
}

uint64_t CalAbsoluteTimeGetGregorianDate()
{
  return MEMORY[0x1E0D0BF78]();
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1E0D0BF88]();
}

uint64_t CalAddStateCaptureBlock()
{
  return MEMORY[0x1E0D0BFA8]();
}

uint64_t CalAlarmCopyDefaultAllDayAlarmOffset()
{
  return MEMORY[0x1E0D0A170]();
}

uint64_t CalAlarmCopyDefaultAllDayAlarmOffsetWithPreferences()
{
  return MEMORY[0x1E0D0A178]();
}

uint64_t CalAlarmCopyDefaultTimedAlarmOffset()
{
  return MEMORY[0x1E0D0A180]();
}

uint64_t CalAlarmCopyDefaultTimedAlarmOffsetWithPreferences()
{
  return MEMORY[0x1E0D0A188]();
}

uint64_t CalAlarmCopyOwningEntity()
{
  return MEMORY[0x1E0D0A190]();
}

uint64_t CalAlarmCopyUUID()
{
  return MEMORY[0x1E0D0A198]();
}

uint64_t CalAlarmGetAcknowledgedDate()
{
  return MEMORY[0x1E0D0A1A0]();
}

uint64_t CalAlarmGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A1A8]();
}

uint64_t CalAlarmGetUID()
{
  return MEMORY[0x1E0D0A1B0]();
}

uint64_t CalAlarmIsDefaultAlarm()
{
  return MEMORY[0x1E0D0A1B8]();
}

uint64_t CalAlarmOccurrenceGetAlarm()
{
  return MEMORY[0x1E0D0A1C0]();
}

uint64_t CalAlarmOccurrenceGetEventOccurrence()
{
  return MEMORY[0x1E0D0A1C8]();
}

uint64_t CalAlarmOccurrenceGetFireDate()
{
  return MEMORY[0x1E0D0A1D0]();
}

uint64_t CalAlertInviteeDeclines()
{
  return MEMORY[0x1E0D0A1E8]();
}

uint64_t CalAnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D0BFB0]();
}

uint64_t CalAnalyticsSendEvent()
{
  return MEMORY[0x1E0D0BFB8]();
}

uint64_t CalAnalyticsTimeIntervalFromMachTimes()
{
  return MEMORY[0x1E0D0BFC8]();
}

uint64_t CalApproximateContinuousTime()
{
  return MEMORY[0x1E0D0BFD0]();
}

uint64_t CalAttachmentCopyOwner()
{
  return MEMORY[0x1E0D0A1F0]();
}

uint64_t CalAttachmentFileCopyAttachmentContainerForStore()
{
  return MEMORY[0x1E0D0A1F8]();
}

uint64_t CalAttachmentFileCopyStore()
{
  return MEMORY[0x1E0D0A200]();
}

uint64_t CalAttachmentGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A208]();
}

uint64_t CalAttendeeCopyDisplayName()
{
  return MEMORY[0x1E0D0A210]();
}

uint64_t CalAttendeeCopyEmailAddress()
{
  return MEMORY[0x1E0D0A218]();
}

uint64_t CalAttendeeCopyFirstName()
{
  return MEMORY[0x1E0D0A220]();
}

uint64_t CalAttendeeCopyLastName()
{
  return MEMORY[0x1E0D0A228]();
}

uint64_t CalAttendeeCopyOwningEvent()
{
  return MEMORY[0x1E0D0A230]();
}

uint64_t CalAttendeeCopyPhoneNumber()
{
  return MEMORY[0x1E0D0A238]();
}

uint64_t CalAttendeeCopyResponseComment()
{
  return MEMORY[0x1E0D0A240]();
}

uint64_t CalAttendeeGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A248]();
}

uint64_t CalAttendeeGetProposedStartDate()
{
  return MEMORY[0x1E0D0A250]();
}

uint64_t CalAttendeeGetProposedStartDateStatus()
{
  return MEMORY[0x1E0D0A258]();
}

uint64_t CalAttendeeGetStatus()
{
  return MEMORY[0x1E0D0A260]();
}

uint64_t CalAttendeeGetUID()
{
  return MEMORY[0x1E0D0A268]();
}

uint64_t CalAttendeeGetUseDeletedByOrganizerStatusInStore()
{
  return MEMORY[0x1E0D0A270]();
}

uint64_t CalAttendeeIsStatusKnownForInvitedEventsInStore()
{
  return MEMORY[0x1E0D0A278]();
}

uint64_t CalAttendeeIsStatusKnownForOrganizedEventsInStore()
{
  return MEMORY[0x1E0D0A280]();
}

uint64_t CalAttendeeRequireSearchInSingleAccountInStore()
{
  return MEMORY[0x1E0D0A288]();
}

uint64_t CalAuxDatabaseAccountCopyAccountID()
{
  return MEMORY[0x1E0D0A298]();
}

uint64_t CalAuxDatabaseAccountSetAccountID()
{
  return MEMORY[0x1E0D0A2A0]();
}

uint64_t CalAuxDatabaseAddAccount()
{
  return MEMORY[0x1E0D0A2A8]();
}

uint64_t CalAuxDatabaseCopyAccounts()
{
  return MEMORY[0x1E0D0A2B0]();
}

uint64_t CalAuxDatabaseCopyPath()
{
  return MEMORY[0x1E0D0A2B8]();
}

uint64_t CalAuxDatabaseCopyPersonaID()
{
  return MEMORY[0x1E0D0A2C0]();
}

uint64_t CalAuxDatabaseGetUID()
{
  return MEMORY[0x1E0D0A2C8]();
}

uint64_t CalAuxDatabaseRemoveAccount()
{
  return MEMORY[0x1E0D0A2D0]();
}

uint64_t CalCalendarCanContainEntityType()
{
  return MEMORY[0x1E0D0A2D8]();
}

uint64_t CalCalendarCanContainEntityTypeAndStoreAllowsIt()
{
  return MEMORY[0x1E0D0A2E0]();
}

uint64_t CalCalendarCopyColorString()
{
  return MEMORY[0x1E0D0A2E8]();
}

uint64_t CalCalendarCopySelfIdentityAddress()
{
  return MEMORY[0x1E0D0A2F0]();
}

uint64_t CalCalendarCopySharees()
{
  return MEMORY[0x1E0D0A2F8]();
}

uint64_t CalCalendarCopyStore()
{
  return MEMORY[0x1E0D0A300]();
}

uint64_t CalCalendarCopySubCalAccountID()
{
  return MEMORY[0x1E0D0A308]();
}

uint64_t CalCalendarCopySubscriptionURL()
{
  return MEMORY[0x1E0D0A310]();
}

uint64_t CalCalendarCopyTitle()
{
  return MEMORY[0x1E0D0A318]();
}

uint64_t CalCalendarCopyType()
{
  return MEMORY[0x1E0D0A320]();
}

uint64_t CalCalendarCopyURI()
{
  return MEMORY[0x1E0D0A328]();
}

uint64_t CalCalendarCopyUUID()
{
  return MEMORY[0x1E0D0A330]();
}

uint64_t CalCalendarGetBirthdayCalendarVersion()
{
  return MEMORY[0x1E0D0A338]();
}

uint64_t CalCalendarGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A340]();
}

uint64_t CalCalendarGetSharingStatus()
{
  return MEMORY[0x1E0D0A348]();
}

uint64_t CalCalendarGetUID()
{
  return MEMORY[0x1E0D0A350]();
}

uint64_t CalCalendarHasEvents()
{
  return MEMORY[0x1E0D0A358]();
}

uint64_t CalCalendarHasEventsWithRoomAsAttendee()
{
  return MEMORY[0x1E0D0A360]();
}

uint64_t CalCalendarInsertBirthdayCalendar()
{
  return MEMORY[0x1E0D0A368]();
}

uint64_t CalCalendarIsBirthdayCalendar()
{
  return MEMORY[0x1E0D0A370]();
}

uint64_t CalCalendarIsFacebookBirthdayCalendar()
{
  return MEMORY[0x1E0D0A378]();
}

uint64_t CalCalendarIsFamilyCalendar()
{
  return MEMORY[0x1E0D0A380]();
}

uint64_t CalCalendarIsFoundInMailCalendar()
{
  return MEMORY[0x1E0D0A388]();
}

uint64_t CalCalendarIsHidden()
{
  return MEMORY[0x1E0D0A390]();
}

uint64_t CalCalendarIsHolidaySubscribedCalendar()
{
  return MEMORY[0x1E0D0A398]();
}

uint64_t CalCalendarIsHolidaySyncedCalendar()
{
  return MEMORY[0x1E0D0A3A0]();
}

uint64_t CalCalendarIsIgnoringEventAlerts()
{
  return MEMORY[0x1E0D0A3A8]();
}

uint64_t CalCalendarIsIgnoringSharedCalendarNotifications()
{
  return MEMORY[0x1E0D0A3B0]();
}

uint64_t CalCalendarIsNaturalLanguageSuggestedEventsCalendar()
{
  return MEMORY[0x1E0D0A3B8]();
}

uint64_t CalCalendarIsNotificationsCollection()
{
  return MEMORY[0x1E0D0A3C0]();
}

uint64_t CalCalendarIsSubscribed()
{
  return MEMORY[0x1E0D0A3C8]();
}

uint64_t CalCalendarItemCopyAttendees()
{
  return MEMORY[0x1E0D0A3D0]();
}

uint64_t CalCalendarItemCopyCalendar()
{
  return MEMORY[0x1E0D0A3D8]();
}

uint64_t CalCalendarItemCopyCalendarScale()
{
  return MEMORY[0x1E0D0A3E0]();
}

uint64_t CalCalendarItemCopyDescription()
{
  return MEMORY[0x1E0D0A3E8]();
}

uint64_t CalCalendarItemCopyLocation()
{
  return MEMORY[0x1E0D0A3F0]();
}

uint64_t CalCalendarItemCopyOrganizer()
{
  return MEMORY[0x1E0D0A3F8]();
}

uint64_t CalCalendarItemCopyPreferredLocation()
{
  return MEMORY[0x1E0D0A400]();
}

uint64_t CalCalendarItemCopyRecurrences()
{
  return MEMORY[0x1E0D0A408]();
}

uint64_t CalCalendarItemCopySelfAttendee()
{
  return MEMORY[0x1E0D0A410]();
}

uint64_t CalCalendarItemCopyStartDate()
{
  return MEMORY[0x1E0D0A418]();
}

uint64_t CalCalendarItemCopySummary()
{
  return MEMORY[0x1E0D0A420]();
}

uint64_t CalCalendarItemCopyURL()
{
  return MEMORY[0x1E0D0A428]();
}

uint64_t CalCalendarItemCopyUUID()
{
  return MEMORY[0x1E0D0A430]();
}

uint64_t CalCalendarItemGetAvailabilitySupportedByStore()
{
  return MEMORY[0x1E0D0A438]();
}

uint64_t CalCalendarItemGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A440]();
}

uint64_t CalCalendarItemGetRowID()
{
  return MEMORY[0x1E0D0A448]();
}

uint64_t CalCalendarItemGetStatus()
{
  return MEMORY[0x1E0D0A450]();
}

uint64_t CalCalendarItemHasAttendees()
{
  return MEMORY[0x1E0D0A458]();
}

uint64_t CalCalendarItemHasClientLocation()
{
  return MEMORY[0x1E0D0A460]();
}

uint64_t CalCalendarItemHasLocation()
{
  return MEMORY[0x1E0D0A468]();
}

uint64_t CalCalendarItemHasRecurrenceRules()
{
  return MEMORY[0x1E0D0A470]();
}

uint64_t CalCalendarItemIsAllDay()
{
  return MEMORY[0x1E0D0A478]();
}

uint64_t CalCalendarItemIsFloating()
{
  return MEMORY[0x1E0D0A480]();
}

uint64_t CalCalendarItemIsPhantomMaster()
{
  return MEMORY[0x1E0D0A488]();
}

uint64_t CalCalendarMigrateSubscribedCalendarToStore()
{
  return MEMORY[0x1E0D0A490]();
}

uint64_t CalCalendarSetBirthdayCalendarVersion()
{
  return MEMORY[0x1E0D0A498]();
}

uint64_t CalCalendarSetInvitationStatus()
{
  return MEMORY[0x1E0D0A4A0]();
}

uint64_t CalColorCopyStore()
{
  return MEMORY[0x1E0D0A4A8]();
}

uint64_t CalColorGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A4B0]();
}

uint64_t CalColorGetUID()
{
  return MEMORY[0x1E0D0A4B8]();
}

uint64_t CalConferenceCopyOwner()
{
  return MEMORY[0x1E0D0A4C0]();
}

uint64_t CalConferenceGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A4C8]();
}

uint64_t CalContactCopyOwner()
{
  return MEMORY[0x1E0D0A4D0]();
}

uint64_t CalContactGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A4D8]();
}

uint64_t CalContinuousIntervalToNSTimeInterval()
{
  return MEMORY[0x1E0D0BFF0]();
}

uint64_t CalCopyDatabaseForEntity()
{
  return MEMORY[0x1E0D0A4E0]();
}

uint64_t CalCopyDefaultTimeZone()
{
  return MEMORY[0x1E0D0C000]();
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x1E0D0C010]();
}

uint64_t CalCreateiCalendarDataFromCalEntitiesWithOptions()
{
  return MEMORY[0x1E0D0A4F0]();
}

uint64_t CalCreateiCalendarDataFromCalendarWithOptions()
{
  return MEMORY[0x1E0D0A4F8]();
}

uint64_t CalDatabaseBackupDatabaseFile()
{
  return MEMORY[0x1E0D0A500]();
}

uint64_t CalDatabaseBackupDatabaseFileAndAttachments()
{
  return MEMORY[0x1E0D0A508]();
}

uint64_t CalDatabaseBackupToICBU()
{
  return MEMORY[0x1E0D0A510]();
}

uint64_t CalDatabaseCleanUpDeclinedEvents()
{
  return MEMORY[0x1E0D0A518]();
}

uint64_t CalDatabaseCleanUpOrphanedLocalAttachments()
{
  return MEMORY[0x1E0D0A520]();
}

uint64_t CalDatabaseCleanupDanglers()
{
  return MEMORY[0x1E0D0A528]();
}

uint64_t CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient()
{
  return MEMORY[0x1E0D0A530]();
}

uint64_t CalDatabaseClearIndividualChangeRowIDsForClient()
{
  return MEMORY[0x1E0D0A538]();
}

uint64_t CalDatabaseClearRestoreGenerationChangedDelegate()
{
  return MEMORY[0x1E0D0A540]();
}

uint64_t CalDatabaseCopyAlarmOccurrencesFromAlarmCache()
{
  return MEMORY[0x1E0D0A548]();
}

uint64_t CalDatabaseCopyAlarmWithExternalIDInStore()
{
  return MEMORY[0x1E0D0A550]();
}

uint64_t CalDatabaseCopyAlarmWithUUID()
{
  return MEMORY[0x1E0D0A558]();
}

uint64_t CalDatabaseCopyAllAuxDatabases()
{
  return MEMORY[0x1E0D0A560]();
}

uint64_t CalDatabaseCopyAllEntitiesWithPropertyInCalendarOrStore()
{
  return MEMORY[0x1E0D0A568]();
}

uint64_t CalDatabaseCopyAllErrors()
{
  return MEMORY[0x1E0D0A570]();
}

uint64_t CalDatabaseCopyAllEventsWithUniqueIdentifierInStore()
{
  return MEMORY[0x1E0D0A578]();
}

uint64_t CalDatabaseCopyAllNaturalLanguageSuggestedEventsMatchingSummary()
{
  return MEMORY[0x1E0D0A580]();
}

uint64_t CalDatabaseCopyAttachmentWithUUID()
{
  return MEMORY[0x1E0D0A588]();
}

uint64_t CalDatabaseCopyAuxDatabaseAccountForAccountID()
{
  return MEMORY[0x1E0D0A590]();
}

uint64_t CalDatabaseCopyAuxDatabaseForPersonaID()
{
  return MEMORY[0x1E0D0A598]();
}

uint64_t CalDatabaseCopyAuxDatabaseWithUID()
{
  return MEMORY[0x1E0D0A5A0]();
}

uint64_t CalDatabaseCopyBirthdayCalendar()
{
  return MEMORY[0x1E0D0A5A8]();
}

uint64_t CalDatabaseCopyCalendarItemUUIDs()
{
  return MEMORY[0x1E0D0A5B0]();
}

uint64_t CalDatabaseCopyCalendarItemWithUUID()
{
  return MEMORY[0x1E0D0A5B8]();
}

uint64_t CalDatabaseCopyCalendarItemsWithCalendarFilter()
{
  return MEMORY[0x1E0D0A5C0]();
}

uint64_t CalDatabaseCopyCalendarItemsWithUUIDs()
{
  return MEMORY[0x1E0D0A5C8]();
}

uint64_t CalDatabaseCopyCalendarItemsWithUniqueIdentifier()
{
  return MEMORY[0x1E0D0A5D0]();
}

uint64_t CalDatabaseCopyCalendarWithExternalIDInStore()
{
  return MEMORY[0x1E0D0A5D8]();
}

uint64_t CalDatabaseCopyCalendarWithUID()
{
  return MEMORY[0x1E0D0A5E0]();
}

uint64_t CalDatabaseCopyChangesSinceSequenceNumber()
{
  return MEMORY[0x1E0D0A5E8]();
}

uint64_t CalDatabaseCopyColorWithProviderAndExternalID()
{
  return MEMORY[0x1E0D0A5F8]();
}

uint64_t CalDatabaseCopyDefaultLocalCalendar()
{
  return MEMORY[0x1E0D0A600]();
}

uint64_t CalDatabaseCopyDefaultOrAnyReadWriteCalendarForNewEvents()
{
  return MEMORY[0x1E0D0A608]();
}

uint64_t CalDatabaseCopyDirectoryPath()
{
  return MEMORY[0x1E0D0A610]();
}

uint64_t CalDatabaseCopyDirectoryPathForDatabase()
{
  return MEMORY[0x1E0D0A618]();
}

uint64_t CalDatabaseCopyEntitiesWhere()
{
  return MEMORY[0x1E0D0A620]();
}

uint64_t CalDatabaseCopyEventIDsOfEventsMatching()
{
  return MEMORY[0x1E0D0A628]();
}

uint64_t CalDatabaseCopyEventOccurrenceCache()
{
  return MEMORY[0x1E0D0A630]();
}

uint64_t CalDatabaseCopyEventOccurrenceNearestToDate()
{
  return MEMORY[0x1E0D0A638]();
}

uint64_t CalDatabaseCopyEventOccurrenceNearestToDatePreferringForwardSearch()
{
  return MEMORY[0x1E0D0A640]();
}

uint64_t CalDatabaseCopyEventOccurrencesInDateRangeEx()
{
  return MEMORY[0x1E0D0A648]();
}

uint64_t CalDatabaseCopyEventOccurrencesInDateRangeWithEventFilter()
{
  return MEMORY[0x1E0D0A650]();
}

uint64_t CalDatabaseCopyEventWithPublicID()
{
  return MEMORY[0x1E0D0A658]();
}

uint64_t CalDatabaseCopyEventWithUID()
{
  return MEMORY[0x1E0D0A660]();
}

uint64_t CalDatabaseCopyEventWithUUID()
{
  return MEMORY[0x1E0D0A668]();
}

uint64_t CalDatabaseCopyEventWithUniqueIdentifierInStore()
{
  return MEMORY[0x1E0D0A670]();
}

uint64_t CalDatabaseCopyEventsWithRecurrenceSet()
{
  return MEMORY[0x1E0D0A678]();
}

uint64_t CalDatabaseCopyFirstNaturalLanguageSuggestedEventMatchingSummary()
{
  return MEMORY[0x1E0D0A680]();
}

uint64_t CalDatabaseCopyInitializationConfiguration()
{
  return MEMORY[0x1E0D0A688]();
}

uint64_t CalDatabaseCopyLimitedAccessVirtualCalendar()
{
  return MEMORY[0x1E0D0A690]();
}

uint64_t CalDatabaseCopyLimitedAccessVirtualStore()
{
  return MEMORY[0x1E0D0A698]();
}

uint64_t CalDatabaseCopyLocalStore()
{
  return MEMORY[0x1E0D0A6A0]();
}

uint64_t CalDatabaseCopyNaturalLanguageSuggestionsCalendar()
{
  return MEMORY[0x1E0D0A6A8]();
}

uint64_t CalDatabaseCopyOfAllCalendarsInStore()
{
  return MEMORY[0x1E0D0A6B0]();
}

uint64_t CalDatabaseCopyOfAllCalendarsInStoreWithOptions()
{
  return MEMORY[0x1E0D0A6B8]();
}

uint64_t CalDatabaseCopyOfAllEventsCreatedFromSuggestionsInStore()
{
  return MEMORY[0x1E0D0A6C0]();
}

uint64_t CalDatabaseCopyOfAllEventsCreatedFromSuggestionsWithExtractionGroupIdentifierInStore()
{
  return MEMORY[0x1E0D0A6C8]();
}

uint64_t CalDatabaseCopyOfAllEventsWithScheduleAgentClientAndCalendarUID()
{
  return MEMORY[0x1E0D0A6D0]();
}

uint64_t CalDatabaseCopyOfAllNotifiableEventsInStore()
{
  return MEMORY[0x1E0D0A6D8]();
}

uint64_t CalDatabaseCopyOfAllNotifications()
{
  return MEMORY[0x1E0D0A6E0]();
}

uint64_t CalDatabaseCopyOfAllRepliedEventsInStore()
{
  return MEMORY[0x1E0D0A6E8]();
}

uint64_t CalDatabaseCopyOfAllStores()
{
  return MEMORY[0x1E0D0A6F0]();
}

uint64_t CalDatabaseCopyOfAllUnacknowledgedEventsInStore()
{
  return MEMORY[0x1E0D0A6F8]();
}

uint64_t CalDatabaseCopyOfAllUnalertedEventsInStore()
{
  return MEMORY[0x1E0D0A700]();
}

uint64_t CalDatabaseCopyOrCreateDefaultCalendarForNewEvents()
{
  return MEMORY[0x1E0D0A708]();
}

uint64_t CalDatabaseCopyOriginalVisibleEventsWithDates()
{
  return MEMORY[0x1E0D0A710]();
}

uint64_t CalDatabaseCopyProperty()
{
  return MEMORY[0x1E0D0A718]();
}

uint64_t CalDatabaseCopyResourceChangeWithUID()
{
  return MEMORY[0x1E0D0A728]();
}

uint64_t CalDatabaseCopySourceStats()
{
  return MEMORY[0x1E0D0A730]();
}

uint64_t CalDatabaseCopyStoreForBirthdayCalendar()
{
  return MEMORY[0x1E0D0A738]();
}

uint64_t CalDatabaseCopyStoreWithUID()
{
  return MEMORY[0x1E0D0A748]();
}

uint64_t CalDatabaseCopyStoreWithUUID()
{
  return MEMORY[0x1E0D0A750]();
}

uint64_t CalDatabaseCopySubscribedCalendarStoreCreateIfNeeded()
{
  return MEMORY[0x1E0D0A758]();
}

uint64_t CalDatabaseCopySuggestionsCalendar()
{
  return MEMORY[0x1E0D0A760]();
}

uint64_t CalDatabaseCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D0A768]();
}

uint64_t CalDatabaseCountCachedRecords()
{
  return MEMORY[0x1E0D0A770]();
}

uint64_t CalDatabaseCreateAuxDatabaseAccount()
{
  return MEMORY[0x1E0D0A778]();
}

uint64_t CalDatabaseCreateWithAuxDatabaseRef()
{
  return MEMORY[0x1E0D0A780]();
}

uint64_t CalDatabaseCreateWithConfiguration()
{
  return MEMORY[0x1E0D0A788]();
}

uint64_t CalDatabaseCreateWithConfigurationForPersonaID()
{
  return MEMORY[0x1E0D0A798]();
}

uint64_t CalDatabaseCreateWithOptions()
{
  return MEMORY[0x1E0D0A7A0]();
}

uint64_t CalDatabaseEnumerateDatabases()
{
  return MEMORY[0x1E0D0A7B0]();
}

uint64_t CalDatabaseEnumerateDatabasesWithConfiguration()
{
  return MEMORY[0x1E0D0A7B8]();
}

uint64_t CalDatabaseEnumerateUnconsumedObjectChangesForClient()
{
  return MEMORY[0x1E0D0A7C0]();
}

uint64_t CalDatabaseGetAuxDatabaseChangesSequence()
{
  return MEMORY[0x1E0D0A7C8]();
}

uint64_t CalDatabaseGetAuxilliaryDatabaseID()
{
  return MEMORY[0x1E0D0A7D0]();
}

uint64_t CalDatabaseGetCalendarDataContainerProvider()
{
  return MEMORY[0x1E0D0A7D8]();
}

uint64_t CalDatabaseGetChangedEKObjectsForClient()
{
  return MEMORY[0x1E0D0A7E0]();
}

uint64_t CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient()
{
  return MEMORY[0x1E0D0A7E8]();
}

uint64_t CalDatabaseGetCountOfCalendarItemsInStore()
{
  return MEMORY[0x1E0D0A7F0]();
}

uint64_t CalDatabaseGetIDOfOneEventWithAnErrorPerSource()
{
  return MEMORY[0x1E0D0A7F8]();
}

uint64_t CalDatabaseGetLastCacheInvalidationTimestamp()
{
  return MEMORY[0x1E0D0A800]();
}

uint64_t CalDatabaseGetPreferences()
{
  return MEMORY[0x1E0D0A808]();
}

uint64_t CalDatabaseGetRestoreGeneration()
{
  return MEMORY[0x1E0D0A810]();
}

uint64_t CalDatabaseGetSequenceNumber()
{
  return MEMORY[0x1E0D0A818]();
}

uint64_t CalDatabaseGetStoreForPersistentChangeTrackingClientIdentifier()
{
  return MEMORY[0x1E0D0A820]();
}

uint64_t CalDatabaseInsertNaturalLanguageSuggestionsCalendar()
{
  return MEMORY[0x1E0D0A830]();
}

uint64_t CalDatabaseInsertSuggestionsCalendar()
{
  return MEMORY[0x1E0D0A838]();
}

uint64_t CalDatabaseIsCurrentProcessCalaccessd()
{
  return MEMORY[0x1E0D0A840]();
}

uint64_t CalDatabaseLockForThread()
{
  return MEMORY[0x1E0D0A848]();
}

uint64_t CalDatabaseMovedAsideDatabaseFilePathInDirectory()
{
  return MEMORY[0x1E0D0A858]();
}

uint64_t CalDatabaseMultiLock()
{
  return MEMORY[0x1E0D0A860]();
}

uint64_t CalDatabaseNextInMemoryChangeTrackingClientID()
{
  return MEMORY[0x1E0D0A868]();
}

uint64_t CalDatabasePerformMigrationIfNeeded()
{
  return MEMORY[0x1E0D0A870]();
}

uint64_t CalDatabaseProcessEventsWithCalendarFilter()
{
  return MEMORY[0x1E0D0A878]();
}

uint64_t CalDatabasePurgeIdlePersistentChangeTrackingClients()
{
  return MEMORY[0x1E0D0A880]();
}

uint64_t CalDatabaseRebuildOccurrenceCache()
{
  return MEMORY[0x1E0D0A888]();
}

uint64_t CalDatabaseRegisterClientForPersistentChangeTracking()
{
  return MEMORY[0x1E0D0A890]();
}

uint64_t CalDatabaseRegisterClientForPersistentChangeTrackingInStore()
{
  return MEMORY[0x1E0D0A898]();
}

uint64_t CalDatabaseRemoveNaturalLanguageSuggestionsCalendar()
{
  return MEMORY[0x1E0D0A8A8]();
}

uint64_t CalDatabaseRemoveProperty()
{
  return MEMORY[0x1E0D0A8B0]();
}

uint64_t CalDatabaseRemoveSuggestionsCalendar()
{
  return MEMORY[0x1E0D0A8B8]();
}

uint64_t CalDatabaseRequestApplicationSnapshotUpdateWithRateLimiter()
{
  return MEMORY[0x1E0D0A8C0]();
}

uint64_t CalDatabaseRequestWidgetRefreshWithRateLimiter()
{
  return MEMORY[0x1E0D0A8C8]();
}

uint64_t CalDatabaseReset()
{
  return MEMORY[0x1E0D0A8D0]();
}

uint64_t CalDatabaseRestoreFromBackupDatabaseFile()
{
  return MEMORY[0x1E0D0A8D8]();
}

uint64_t CalDatabaseRestoreFromBackupDatabaseFileAndAttachments()
{
  return MEMORY[0x1E0D0A8E0]();
}

uint64_t CalDatabaseRestoreFromICBU()
{
  return MEMORY[0x1E0D0A8E8]();
}

uint64_t CalDatabaseRevert()
{
  return MEMORY[0x1E0D0A8F0]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x1E0D0A8F8]();
}

uint64_t CalDatabaseSaveWithOptions()
{
  return MEMORY[0x1E0D0A908]();
}

uint64_t CalDatabaseSetAuxilliaryDatabaseID()
{
  return MEMORY[0x1E0D0A910]();
}

uint64_t CalDatabaseSetChangeLoggingEnabled()
{
  return MEMORY[0x1E0D0A918]();
}

uint64_t CalDatabaseSetClientIdentifier()
{
  return MEMORY[0x1E0D0A920]();
}

uint64_t CalDatabaseSetClientName()
{
  return MEMORY[0x1E0D0A928]();
}

uint64_t CalDatabaseSetDefaultCalendarForNewEventsInStore()
{
  return MEMORY[0x1E0D0A930]();
}

uint64_t CalDatabaseSetDefaultCalendarForNewEventsWithReason()
{
  return MEMORY[0x1E0D0A938]();
}

uint64_t CalDatabaseSetInMemoryChangeTrackingID()
{
  return MEMORY[0x1E0D0A940]();
}

uint64_t CalDatabaseSetIntegrityErrorReportingDelegate()
{
  return MEMORY[0x1E0D0A948]();
}

uint64_t CalDatabaseSetIsUnitTesting()
{
  return MEMORY[0x1E0D0A950]();
}

uint64_t CalDatabaseSetProperty()
{
  return MEMORY[0x1E0D0A958]();
}

uint64_t CalDatabaseSetPropertyModificationLoggingEnabled()
{
  return MEMORY[0x1E0D0A960]();
}

uint64_t CalDatabaseSetRestoreGenerationChangedDelegate()
{
  return MEMORY[0x1E0D0A968]();
}

uint64_t CalDatabaseUnlockForThread()
{
  return MEMORY[0x1E0D0A978]();
}

uint64_t CalEntityGetID()
{
  return MEMORY[0x1E0D0A980]();
}

uint64_t CalEntityGetType()
{
  return MEMORY[0x1E0D0A988]();
}

uint64_t CalEntityIsDeleted()
{
  return MEMORY[0x1E0D0A990]();
}

uint64_t CalEntityIsNew()
{
  return MEMORY[0x1E0D0A998]();
}

uint64_t CalEntityIsOfType()
{
  return MEMORY[0x1E0D0A9A0]();
}

uint64_t CalEntityIsVirtual()
{
  return MEMORY[0x1E0D0A9A8]();
}

uint64_t CalEqualStrings()
{
  return MEMORY[0x1E0D0C0C8]();
}

uint64_t CalErrorCopyOwner()
{
  return MEMORY[0x1E0D0A9B8]();
}

uint64_t CalErrorGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A9C0]();
}

uint64_t CalEventActionCopyOwningEvent()
{
  return MEMORY[0x1E0D0A9C8]();
}

uint64_t CalEventActionGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0A9D0]();
}

uint64_t CalEventAttendeeIsSelf()
{
  return MEMORY[0x1E0D0A9D8]();
}

uint64_t CalEventCancelDeletedEventsInStore()
{
  return MEMORY[0x1E0D0A9E0]();
}

uint64_t CalEventCopyAlarms()
{
  return MEMORY[0x1E0D0A9E8]();
}

uint64_t CalEventCopyAttendees()
{
  return MEMORY[0x1E0D0A9F0]();
}

uint64_t CalEventCopyCalendar()
{
  return MEMORY[0x1E0D0A9F8]();
}

uint64_t CalEventCopyContactIdentifier()
{
  return MEMORY[0x1E0D0AA00]();
}

uint64_t CalEventCopyContactName()
{
  return MEMORY[0x1E0D0AA08]();
}

uint64_t CalEventCopyCreatorIdentityString()
{
  return MEMORY[0x1E0D0AA10]();
}

uint64_t CalEventCopyCreatorTeamIdentityString()
{
  return MEMORY[0x1E0D0AA18]();
}

uint64_t CalEventCopyDescription()
{
  return MEMORY[0x1E0D0AA20]();
}

uint64_t CalEventCopyLocation_Deprecated()
{
  return MEMORY[0x1E0D0AA28]();
}

uint64_t CalEventCopyOrganizer()
{
  return MEMORY[0x1E0D0AA30]();
}

uint64_t CalEventCopyRecurrences()
{
  return MEMORY[0x1E0D0AA38]();
}

uint64_t CalEventCopyRowIDsAndUniqueIdentifiersInCalendar()
{
  return MEMORY[0x1E0D0AA40]();
}

uint64_t CalEventCopyStartTimeZone()
{
  return MEMORY[0x1E0D0AA48]();
}

uint64_t CalEventCopyStore()
{
  return MEMORY[0x1E0D0AA50]();
}

uint64_t CalEventCopySummary()
{
  return MEMORY[0x1E0D0AA58]();
}

uint64_t CalEventCopyURI()
{
  return MEMORY[0x1E0D0AA60]();
}

uint64_t CalEventCopyURL()
{
  return MEMORY[0x1E0D0AA68]();
}

uint64_t CalEventCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D0AA70]();
}

uint64_t CalEventDeclineDeletedInvitationsInStore()
{
  return MEMORY[0x1E0D0AA78]();
}

uint64_t CalEventDurationConstrainedToRecurrenceIntervalInStore()
{
  return MEMORY[0x1E0D0AA80]();
}

uint64_t CalEventGetCalendarId()
{
  return MEMORY[0x1E0D0AA88]();
}

uint64_t CalEventGetDeliverySourceOrExternalIDRequiredForResponseInStore()
{
  return MEMORY[0x1E0D0AA90]();
}

uint64_t CalEventGetDuration()
{
  return MEMORY[0x1E0D0AA98]();
}

uint64_t CalEventGetEndDate()
{
  return MEMORY[0x1E0D0AAA0]();
}

uint64_t CalEventGetFutureStartDateLimitedToOccurrenceCacheBoundsInStore()
{
  return MEMORY[0x1E0D0AAA8]();
}

uint64_t CalEventGetInvitationChangedProperties()
{
  return MEMORY[0x1E0D0AAB0]();
}

uint64_t CalEventGetJunkStatus()
{
  return MEMORY[0x1E0D0AAB8]();
}

uint64_t CalEventGetOccurrenceOrderEnforcedAfterDetachmentInStore()
{
  return MEMORY[0x1E0D0AAC0]();
}

uint64_t CalEventGetOccurrencesMustOccurOnSeparateDaysInStore()
{
  return MEMORY[0x1E0D0AAC8]();
}

uint64_t CalEventGetParticipationStatus()
{
  return MEMORY[0x1E0D0AAD0]();
}

uint64_t CalEventGetParticipationStatusModifiedDate()
{
  return MEMORY[0x1E0D0AAD8]();
}

uint64_t CalEventGetProposedStartDate()
{
  return MEMORY[0x1E0D0AAE0]();
}

uint64_t CalEventGetProposedStatusRequiredForResponseInStore()
{
  return MEMORY[0x1E0D0AAE8]();
}

uint64_t CalEventGetRejectedStatusChangeRequiresNoExternalStatusInStore()
{
  return MEMORY[0x1E0D0AAF0]();
}

uint64_t CalEventGetStartDate()
{
  return MEMORY[0x1E0D0AAF8]();
}

uint64_t CalEventGetStartDateOfEarliestOccurrenceEndingAfterDateWithExclusions()
{
  return MEMORY[0x1E0D0AB00]();
}

uint64_t CalEventGetStatus()
{
  return MEMORY[0x1E0D0AB08]();
}

uint64_t CalEventGetStatusIsAccurateInStore()
{
  return MEMORY[0x1E0D0AB10]();
}

uint64_t CalEventGetTravelAdvisoryBehavior()
{
  return MEMORY[0x1E0D0AB18]();
}

uint64_t CalEventGetUID()
{
  return MEMORY[0x1E0D0AB20]();
}

uint64_t CalEventHasPredictedLocation()
{
  return MEMORY[0x1E0D0AB28]();
}

uint64_t CalEventIsAllDay()
{
  return MEMORY[0x1E0D0AB30]();
}

uint64_t CalEventIsCandidateForTravelAdvisories()
{
  return MEMORY[0x1E0D0AB38]();
}

uint64_t CalEventIsDetached()
{
  return MEMORY[0x1E0D0AB40]();
}

uint64_t CalEventIsFloating()
{
  return MEMORY[0x1E0D0AB48]();
}

uint64_t CalEventIsImmediatelyEligibleForTravelAdvisories()
{
  return MEMORY[0x1E0D0AB50]();
}

uint64_t CalEventIsRecurring()
{
  return MEMORY[0x1E0D0AB58]();
}

uint64_t CalEventNextReminderOccurrenceDateIfEventKitIsLikelyToWantIt()
{
  return MEMORY[0x1E0D0AB60]();
}

uint64_t CalEventOccurrenceCacheCopyAllDaysAndOccurrenceCounts()
{
  return MEMORY[0x1E0D0AB68]();
}

uint64_t CalEventOccurrenceCacheCopyEventOccurrencesAfterDate()
{
  return MEMORY[0x1E0D0AB78]();
}

uint64_t CalEventOccurrenceCacheCopyEventOccurrencesInDateRange()
{
  return MEMORY[0x1E0D0AB80]();
}

uint64_t CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate()
{
  return MEMORY[0x1E0D0AB88]();
}

uint64_t CalEventOccurrenceCacheCopyOccurrencesOnDay()
{
  return MEMORY[0x1E0D0AB90]();
}

uint64_t CalEventOccurrenceCacheCopyTimeZone()
{
  return MEMORY[0x1E0D0AB98]();
}

uint64_t CalEventOccurrenceCacheCount()
{
  return MEMORY[0x1E0D0ABA0]();
}

uint64_t CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate()
{
  return MEMORY[0x1E0D0ABA8]();
}

uint64_t CalEventOccurrenceCacheMergeCounts()
{
  return MEMORY[0x1E0D0ABB8]();
}

uint64_t CalEventOccurrenceCacheProcessEventOccurrencesInDateRange()
{
  return MEMORY[0x1E0D0ABC0]();
}

uint64_t CalEventOccurrenceCacheTrimExtendAndUpdate()
{
  return MEMORY[0x1E0D0ABC8]();
}

uint64_t CalEventOccurrenceCreateForInitialOccurrence()
{
  return MEMORY[0x1E0D0ABD0]();
}

uint64_t CalEventOccurrenceCreateForInitialOccurrenceWithTimeZone()
{
  return MEMORY[0x1E0D0ABD8]();
}

uint64_t CalEventOccurrenceGetDate()
{
  return MEMORY[0x1E0D0ABE0]();
}

uint64_t CalEventOccurrenceGetEvent()
{
  return MEMORY[0x1E0D0ABE8]();
}

uint64_t CalEventOccurrenceGetTypeID()
{
  return MEMORY[0x1E0D0ABF0]();
}

uint64_t CalEventOccurrencesExistForEventInDateRange()
{
  return MEMORY[0x1E0D0ABF8]();
}

uint64_t CalEventPreferredLocationIsAConferenceRoom()
{
  return MEMORY[0x1E0D0AC00]();
}

uint64_t CalEventRequiresOutgoingInvitationsInDefaultCalendarInStore()
{
  return MEMORY[0x1E0D0AC08]();
}

uint64_t CalEventResponseCommentsSupportedInStore()
{
  return MEMORY[0x1E0D0AC10]();
}

uint64_t CalEventSetInvitationChangedProperties()
{
  return MEMORY[0x1E0D0AC18]();
}

uint64_t CalEventSetNeedsNotification()
{
  return MEMORY[0x1E0D0AC20]();
}

uint64_t CalEventURLFieldSupportedInStore()
{
  return MEMORY[0x1E0D0AC28]();
}

uint64_t CalExceptionDateCopyOwner()
{
  return MEMORY[0x1E0D0AC30]();
}

uint64_t CalExceptionDateGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0AC38]();
}

uint64_t CalFilterCreateWithDatabaseFilteringCalendars()
{
  return MEMORY[0x1E0D0AC40]();
}

uint64_t CalFilterCreateWithDatabaseFilteringCalendarsWithUIDs()
{
  return MEMORY[0x1E0D0AC48]();
}

uint64_t CalFilterCreateWithDatabaseShowingAll()
{
  return MEMORY[0x1E0D0AC50]();
}

uint64_t CalFilterCreateWithDatabaseShowingCalendarsWithUIDs()
{
  return MEMORY[0x1E0D0AC58]();
}

uint64_t CalFilterCreateWithDatabaseShowingCalendarsWithUIDsAndEntityType()
{
  return MEMORY[0x1E0D0AC60]();
}

uint64_t CalFilterSetSearchTerm()
{
  return MEMORY[0x1E0D0AC68]();
}

uint64_t CalGenerateQualifiedIdentifierWithClassAndSubdomain()
{
  return MEMORY[0x1E0D0C0D0]();
}

uint64_t CalGetDatabaseForRecord()
{
  return MEMORY[0x1E0D0AC70]();
}

uint64_t CalGetRecordLock()
{
  return MEMORY[0x1E0D0AC78]();
}

uint64_t CalHasCurrentUserInvitedAttendeeWithEmail()
{
  return MEMORY[0x1E0D0AC88]();
}

uint64_t CalHasCurrentUserInvitedAttendeeWithPhoneNumber()
{
  return MEMORY[0x1E0D0AC90]();
}

uint64_t CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithEmail()
{
  return MEMORY[0x1E0D0AC98]();
}

uint64_t CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithPhoneNumber()
{
  return MEMORY[0x1E0D0ACA0]();
}

uint64_t CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithEmail()
{
  return MEMORY[0x1E0D0ACA8]();
}

uint64_t CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithPhoneNumber()
{
  return MEMORY[0x1E0D0ACB0]();
}

uint64_t CalIdentityGarbageCollectOrphans()
{
  return MEMORY[0x1E0D0ACB8]();
}

uint64_t CalImageCopyStore()
{
  return MEMORY[0x1E0D0ACC0]();
}

uint64_t CalImageGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0ACC8]();
}

uint64_t CalInviteReplyNotificationCopyHostURL()
{
  return MEMORY[0x1E0D0ACD0]();
}

uint64_t CalInviteReplyNotificationCopyInviteReplyCalendar()
{
  return MEMORY[0x1E0D0ACD8]();
}

uint64_t CalInviteReplyNotificationCopyOwner()
{
  return MEMORY[0x1E0D0ACE0]();
}

uint64_t CalItemsUpdateFromiCalendarDocumentWithOptionsIncludingPhantomMaster()
{
  return MEMORY[0x1E0D0ACE8]();
}

uint64_t CalLocationCopyOwner()
{
  return MEMORY[0x1E0D0ACF0]();
}

uint64_t CalLocationCopyTitle()
{
  return MEMORY[0x1E0D0ACF8]();
}

uint64_t CalLocationGetCoordinates()
{
  return MEMORY[0x1E0D0AD00]();
}

uint64_t CalLocationGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0AD08]();
}

uint64_t CalLocationHasCoordinates()
{
  return MEMORY[0x1E0D0AD10]();
}

uint64_t CalLocationHasKnownSpatialData()
{
  return MEMORY[0x1E0D0AD18]();
}

uint64_t CalMonotonicTime()
{
  return MEMORY[0x1E0D0C148]();
}

uint64_t CalNSTimeIntervalToContinuousInterval()
{
  return MEMORY[0x1E0D0C150]();
}

uint64_t CalNotificationCopyOwner()
{
  return MEMORY[0x1E0D0AD20]();
}

uint64_t CalNotificationGetCreationDate()
{
  return MEMORY[0x1E0D0AD28]();
}

uint64_t CalNotificationGetEntityType()
{
  return MEMORY[0x1E0D0AD30]();
}

uint64_t CalNotificationGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0AD38]();
}

uint64_t CalNotificationGetUID()
{
  return MEMORY[0x1E0D0AD40]();
}

uint64_t CalOrganizerCopyEmailAddress()
{
  return MEMORY[0x1E0D0AD48]();
}

uint64_t CalOrganizerCopyOwner()
{
  return MEMORY[0x1E0D0AD50]();
}

uint64_t CalOrganizerCopyPhoneNumber()
{
  return MEMORY[0x1E0D0AD58]();
}

uint64_t CalOrganizerGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0AD60]();
}

uint64_t CalOrganizerIsSelf()
{
  return MEMORY[0x1E0D0AD68]();
}

uint64_t CalParticipantCopyOwner()
{
  return MEMORY[0x1E0D0AD70]();
}

uint64_t CalParticipantGetProposedStartDateChanged()
{
  return MEMORY[0x1E0D0AD78]();
}

uint64_t CalParticipantGetStatusChanged()
{
  return MEMORY[0x1E0D0AD80]();
}

uint64_t CalParticipantSetProposedStartDateChanged()
{
  return MEMORY[0x1E0D0AD88]();
}

uint64_t CalRecordIDCreate()
{
  return MEMORY[0x1E0D0AD90]();
}

uint64_t CalRecurrenceCopyOwner()
{
  return MEMORY[0x1E0D0AD98]();
}

uint64_t CalRecurrenceGetEffectiveEndDate()
{
  return MEMORY[0x1E0D0ADA8]();
}

uint64_t CalRecurrenceGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0ADB0]();
}

uint64_t CalRedactURLString()
{
  return MEMORY[0x1E0D0C158]();
}

uint64_t CalRelationGetRelatedObject()
{
  return MEMORY[0x1E0D0ADB8]();
}

uint64_t CalRelationGetTypeID()
{
  return MEMORY[0x1E0D0ADC0]();
}

uint64_t CalRelationSetRelatedObject()
{
  return MEMORY[0x1E0D0ADC8]();
}

uint64_t CalRemoveAuxDatabase()
{
  return MEMORY[0x1E0D0ADD0]();
}

uint64_t CalRemoveClientForPersistentChangeTracking()
{
  return MEMORY[0x1E0D0ADE0]();
}

uint64_t CalRemoveNotification()
{
  return MEMORY[0x1E0D0ADE8]();
}

uint64_t CalRemoveResourceChange()
{
  return MEMORY[0x1E0D0ADF0]();
}

uint64_t CalResourceChangeCopyCalendar()
{
  return MEMORY[0x1E0D0AE00]();
}

uint64_t CalResourceChangeCopyCalendarItem()
{
  return MEMORY[0x1E0D0AE08]();
}

uint64_t CalResourceChangeCopyNotification()
{
  return MEMORY[0x1E0D0AE10]();
}

uint64_t CalResourceChangeGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0AE18]();
}

uint64_t CalResourceChangeGetPublicStatus()
{
  return MEMORY[0x1E0D0AE20]();
}

uint64_t CalResourceChangeGetType()
{
  return MEMORY[0x1E0D0AE28]();
}

uint64_t CalResourceChangeGetUID()
{
  return MEMORY[0x1E0D0AE30]();
}

uint64_t CalResourceChangeNotificationCopyChanges()
{
  return MEMORY[0x1E0D0AE38]();
}

uint64_t CalResourceChangeNotificationCopyOwner()
{
  return MEMORY[0x1E0D0AE40]();
}

uint64_t CalResourceChangeSetAlerted()
{
  return MEMORY[0x1E0D0AE48]();
}

uint64_t CalSetShowCompletedReminders()
{
  return MEMORY[0x1E0D0AE50]();
}

uint64_t CalSetShowDeclinedEvents()
{
  return MEMORY[0x1E0D0AE58]();
}

uint64_t CalShareeCopyOwner()
{
  return MEMORY[0x1E0D0AE60]();
}

uint64_t CalShareeGetAccessLevel()
{
  return MEMORY[0x1E0D0AE68]();
}

uint64_t CalShareeGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0AE70]();
}

uint64_t CalShowCompletedReminders()
{
  return MEMORY[0x1E0D0AE78]();
}

uint64_t CalShowDeclinedEvents()
{
  return MEMORY[0x1E0D0AE80]();
}

uint64_t CalStoreAllowsCalendarAddDeleteModify()
{
  return MEMORY[0x1E0D0AE88]();
}

uint64_t CalStoreAllowsEvents()
{
  return MEMORY[0x1E0D0AE90]();
}

uint64_t CalStoreAllowsPrivateEventAccessByDelegate()
{
  return MEMORY[0x1E0D0AE98]();
}

uint64_t CalStoreAllowsProposeNewTime()
{
  return MEMORY[0x1E0D0AEA0]();
}

uint64_t CalStoreAllowsTasks()
{
  return MEMORY[0x1E0D0AEA8]();
}

uint64_t CalStoreAreRecurrencesPinnedToMonthDays()
{
  return MEMORY[0x1E0D0AEB0]();
}

uint64_t CalStoreCopyCalendars()
{
  return MEMORY[0x1E0D0AEB8]();
}

uint64_t CalStoreCopyDefaultAlarmOffset()
{
  return MEMORY[0x1E0D0AEC0]();
}

uint64_t CalStoreCopyDelegatedAccountOwnerStoreID()
{
  return MEMORY[0x1E0D0AEC8]();
}

uint64_t CalStoreCopyExternalID()
{
  return MEMORY[0x1E0D0AED0]();
}

uint64_t CalStoreCopyName()
{
  return MEMORY[0x1E0D0AEE0]();
}

uint64_t CalStoreCopyUUID()
{
  return MEMORY[0x1E0D0AEE8]();
}

uint64_t CalStoreGetMaxAlarmsSupported()
{
  return MEMORY[0x1E0D0AEF0]();
}

uint64_t CalStoreGetMaxRecurrencesSupported()
{
  return MEMORY[0x1E0D0AEF8]();
}

uint64_t CalStoreGetProhibitsICSImport()
{
  return MEMORY[0x1E0D0AF00]();
}

uint64_t CalStoreGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0AF08]();
}

uint64_t CalStoreGetStrictestEventPrivateValue()
{
  return MEMORY[0x1E0D0AF10]();
}

uint64_t CalStoreGetSupportsClearingPrivateComments()
{
  return MEMORY[0x1E0D0AF18]();
}

uint64_t CalStoreGetSupportsIncomingInvitations()
{
  return MEMORY[0x1E0D0AF20]();
}

uint64_t CalStoreGetSupportsInvitationModifications()
{
  return MEMORY[0x1E0D0AF28]();
}

uint64_t CalStoreGetSupportsJunkReporting()
{
  return MEMORY[0x1E0D0AF30]();
}

uint64_t CalStoreGetSupportsOutgoingInvitations()
{
  return MEMORY[0x1E0D0AF38]();
}

uint64_t CalStoreGetSupportsPhoneNumbers()
{
  return MEMORY[0x1E0D0AF40]();
}

uint64_t CalStoreGetType()
{
  return MEMORY[0x1E0D0AF48]();
}

uint64_t CalStoreGetUID()
{
  return MEMORY[0x1E0D0AF50]();
}

uint64_t CalStoreIsDelegate()
{
  return MEMORY[0x1E0D0AF58]();
}

uint64_t CalStoreIsEnabled()
{
  return MEMORY[0x1E0D0AF60]();
}

uint64_t CalStoreIsFacebook()
{
  return MEMORY[0x1E0D0AF68]();
}

uint64_t CalStoreIsWritable()
{
  return MEMORY[0x1E0D0AF70]();
}

uint64_t CalStoreMustAcknowledgeMasterEvent()
{
  return MEMORY[0x1E0D0AF78]();
}

uint64_t CalStoreProhibitsDetachmentOnCommentChange()
{
  return MEMORY[0x1E0D0AF80]();
}

uint64_t CalStoreProhibitsMultipleDaysInMonthlyRecurrence()
{
  return MEMORY[0x1E0D0AF88]();
}

uint64_t CalStoreProhibitsMultipleMonthsInYearlyRecurrence()
{
  return MEMORY[0x1E0D0AF90]();
}

uint64_t CalStoreProhibitsPrivateEventsWithAttendees()
{
  return MEMORY[0x1E0D0AF98]();
}

uint64_t CalStoreProhibitsSlicingEventsWithAttendees()
{
  return MEMORY[0x1E0D0AFA0]();
}

uint64_t CalStoreProhibitsUsingEventOrganizerEmailWhenComposingMail()
{
  return MEMORY[0x1E0D0AFA8]();
}

uint64_t CalStoreProhibitsYearlyRecurrenceInterval()
{
  return MEMORY[0x1E0D0AFB0]();
}

uint64_t CalStoreRecurrenceSeriesMustIncludeMoreThanFirstOccurrence()
{
  return MEMORY[0x1E0D0AFB8]();
}

uint64_t CalStoreRemoveItemsOfTypeOlderThanDateInStore()
{
  return MEMORY[0x1E0D0AFC0]();
}

uint64_t CalStoreRepairDefaultLocalStore()
{
  return MEMORY[0x1E0D0AFC8]();
}

uint64_t CalStoreRequiresMSFormattedUIDKey()
{
  return MEMORY[0x1E0D0AFD0]();
}

uint64_t CalStoreRequiresOccurrencesConformToRecurrenceRule()
{
  return MEMORY[0x1E0D0AFD8]();
}

uint64_t CalStoreRequiresOpeningAttachmentAsLink()
{
  return MEMORY[0x1E0D0AFE0]();
}

uint64_t CalStoreRequiresSamePrivacyLevelAcrossRecurrenceSeries()
{
  return MEMORY[0x1E0D0AFE8]();
}

uint64_t CalStoreRequiresSeparateFilesForAllAttachments()
{
  return MEMORY[0x1E0D0AFF0]();
}

uint64_t CalStoreSetEnabled()
{
  return MEMORY[0x1E0D0AFF8]();
}

uint64_t CalStoreShouldUseDeleteAndAddInsteadOfMoveBetweenCalendars()
{
  return MEMORY[0x1E0D0B008]();
}

uint64_t CalStoreShowsNotifications()
{
  return MEMORY[0x1E0D0B010]();
}

uint64_t CalStoreSnoozeAlarmRequiresDetach()
{
  return MEMORY[0x1E0D0B018]();
}

uint64_t CalStoreSupportsAlarmProximity()
{
  return MEMORY[0x1E0D0B020]();
}

uint64_t CalStoreSupportsAlarmTriggerDates()
{
  return MEMORY[0x1E0D0B028]();
}

uint64_t CalStoreSupportsAlarmTriggerIntervals()
{
  return MEMORY[0x1E0D0B030]();
}

uint64_t CalStoreSupportsAlarmsTriggeringAfterStartDate()
{
  return MEMORY[0x1E0D0B038]();
}

uint64_t CalStoreSupportsAttachments()
{
  return MEMORY[0x1E0D0B040]();
}

uint64_t CalStoreSupportsAutoGeocodingStructuredLocations()
{
  return MEMORY[0x1E0D0B048]();
}

uint64_t CalStoreSupportsAvailabilityRequests()
{
  return MEMORY[0x1E0D0B050]();
}

uint64_t CalStoreSupportsDelegateEnumeration()
{
  return MEMORY[0x1E0D0B058]();
}

uint64_t CalStoreSupportsDelegation()
{
  return MEMORY[0x1E0D0B060]();
}

uint64_t CalStoreSupportsEventForwarding()
{
  return MEMORY[0x1E0D0B068]();
}

uint64_t CalStoreSupportsFloatingTimeZone()
{
  return MEMORY[0x1E0D0B070]();
}

uint64_t CalStoreSupportsIgnoringEventsInAvailabilityRequests()
{
  return MEMORY[0x1E0D0B078]();
}

uint64_t CalStoreSupportsInboxAvailability()
{
  return MEMORY[0x1E0D0B080]();
}

uint64_t CalStoreSupportsInvitationModificationsWithoutNotification()
{
  return MEMORY[0x1E0D0B088]();
}

uint64_t CalStoreSupportsLocationDirectorySearches()
{
  return MEMORY[0x1E0D0B090]();
}

uint64_t CalStoreSupportsManagedSubscriptionCalendars()
{
  return MEMORY[0x1E0D0B098]();
}

uint64_t CalStoreSupportsParticipantRoles()
{
  return MEMORY[0x1E0D0B0A0]();
}

uint64_t CalStoreSupportsPrivateEvents()
{
  return MEMORY[0x1E0D0B0A8]();
}

uint64_t CalStoreSupportsPush()
{
  return MEMORY[0x1E0D0B0B0]();
}

uint64_t CalStoreSupportsRecurrenceSplit()
{
  return MEMORY[0x1E0D0B0B8]();
}

uint64_t CalStoreSupportsRecurrencesOnDetachedEvents()
{
  return MEMORY[0x1E0D0B0C0]();
}

uint64_t CalStoreSupportsReminderActions()
{
  return MEMORY[0x1E0D0B0C8]();
}

uint64_t CalStoreSupportsReminderLocations()
{
  return MEMORY[0x1E0D0B0D0]();
}

uint64_t CalStoreSupportsSharedCalendars()
{
  return MEMORY[0x1E0D0B0D8]();
}

uint64_t CalStoreSupportsStructuredLocations()
{
  return MEMORY[0x1E0D0B0E0]();
}

uint64_t CalStoreSupportsSubscriptionCalendars()
{
  return MEMORY[0x1E0D0B0E8]();
}

uint64_t CalStoreSupportsSubscriptionMirroring()
{
  return MEMORY[0x1E0D0B0F0]();
}

uint64_t CalStoreSupportsTravelTime()
{
  return MEMORY[0x1E0D0B0F8]();
}

uint64_t CalSuggestedEventInfoCopyOwner()
{
  return MEMORY[0x1E0D0B100]();
}

uint64_t CalSuggestedEventInfoGetPropertyIDWithPropertyName()
{
  return MEMORY[0x1E0D0B108]();
}

uint64_t CalSuggestionNotificationCopyOwner()
{
  return MEMORY[0x1E0D0B110]();
}

uint64_t CalTaskAllDayDueDatesSupportedInStore()
{
  return MEMORY[0x1E0D0B118]();
}

uint64_t CalTaskCopyDueDate()
{
  return MEMORY[0x1E0D0B120]();
}

uint64_t CalTaskCopyDueDateTimeZone()
{
  return MEMORY[0x1E0D0B128]();
}

uint64_t CalTaskCopyURI()
{
  return MEMORY[0x1E0D0B130]();
}

uint64_t CalToManyRelationCopyObjects()
{
  return MEMORY[0x1E0D0B138]();
}

uint64_t CalToManyRelationGetTypeID()
{
  return MEMORY[0x1E0D0B140]();
}

uint64_t DACPLoggingAddCustomLogFile()
{
  return MEMORY[0x1E0D1C368]();
}

uint64_t DACPLoggingAppendDataToLogFile()
{
  return MEMORY[0x1E0D1C370]();
}

uint64_t DACustomLogDirectory()
{
  return MEMORY[0x1E0D1C390]();
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x1E0D1CFA0]();
}

uint64_t EKWeakLinkClass()
{
  return MEMORY[0x1E0D0C210]();
}

uint64_t ICSRedactBytes()
{
  return MEMORY[0x1E0DDB778]();
}

uint64_t ICSRedactString()
{
  return MEMORY[0x1E0DDB780]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PAAuthenticatedClientIdentity()
{
  return MEMORY[0x1E0D80CC0]();
}

uint64_t PCSettingsGetStyle()
{
  return MEMORY[0x1E0D70A60]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t SpotlightDaemonClientRegister()
{
  return MEMORY[0x1E0DA9C78]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1E0C80960](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _CalAlarmGetWithUID()
{
  return MEMORY[0x1E0D0BB70]();
}

uint64_t _CalAttachmentFileGetWithUID()
{
  return MEMORY[0x1E0D0BB78]();
}

uint64_t _CalAttachmentGetWithUID()
{
  return MEMORY[0x1E0D0BB80]();
}

uint64_t _CalCalendarCopyUUID()
{
  return MEMORY[0x1E0D0BB88]();
}

uint64_t _CalCalendarGetStore()
{
  return MEMORY[0x1E0D0BB90]();
}

uint64_t _CalCalendarItemCopyUUID()
{
  return MEMORY[0x1E0D0BB98]();
}

uint64_t _CalCalendarItemCreate()
{
  return MEMORY[0x1E0D0BBA0]();
}

uint64_t _CalCalendarItemCreateCopy()
{
  return MEMORY[0x1E0D0BBA8]();
}

uint64_t _CalCalendarItemGetCalendar()
{
  return MEMORY[0x1E0D0BBB0]();
}

uint64_t _CalCalendarItemHasRecurrenceRules()
{
  return MEMORY[0x1E0D0BBB8]();
}

uint64_t _CalCalendarItemRemoveExceptionDate()
{
  return MEMORY[0x1E0D0BBC0]();
}

uint64_t _CalCategoryGetWithUID()
{
  return MEMORY[0x1E0D0BBC8]();
}

uint64_t _CalCategoryRemove()
{
  return MEMORY[0x1E0D0BBD0]();
}

uint64_t _CalColorGetWithUID()
{
  return MEMORY[0x1E0D0BBD8]();
}

uint64_t _CalConferenceGetWithUID()
{
  return MEMORY[0x1E0D0BBE0]();
}

uint64_t _CalContactGetWithUID()
{
  return MEMORY[0x1E0D0BBE8]();
}

uint64_t _CalCreateResourceChangeOfType()
{
  return MEMORY[0x1E0D0BBF0]();
}

uint64_t _CalDatabaseCopyCalendar()
{
  return MEMORY[0x1E0D0BBF8]();
}

uint64_t _CalDatabaseCopyCalendarItemsWithCalendar()
{
  return MEMORY[0x1E0D0BC00]();
}

uint64_t _CalDatabaseCreateAlarm()
{
  return MEMORY[0x1E0D0BC08]();
}

uint64_t _CalDatabaseCreateAttachment()
{
  return MEMORY[0x1E0D0BC10]();
}

uint64_t _CalDatabaseCreateAttendee()
{
  return MEMORY[0x1E0D0BC18]();
}

uint64_t _CalDatabaseCreateCalendarForEntityType()
{
  return MEMORY[0x1E0D0BC20]();
}

uint64_t _CalDatabaseCreateCategory()
{
  return MEMORY[0x1E0D0BC28]();
}

uint64_t _CalDatabaseCreateColor()
{
  return MEMORY[0x1E0D0BC30]();
}

uint64_t _CalDatabaseCreateConference()
{
  return MEMORY[0x1E0D0BC38]();
}

uint64_t _CalDatabaseCreateContact()
{
  return MEMORY[0x1E0D0BC40]();
}

uint64_t _CalDatabaseCreateError()
{
  return MEMORY[0x1E0D0BC48]();
}

uint64_t _CalDatabaseCreateEventAction()
{
  return MEMORY[0x1E0D0BC50]();
}

uint64_t _CalDatabaseCreateExceptionDate()
{
  return MEMORY[0x1E0D0BC58]();
}

uint64_t _CalDatabaseCreateImage()
{
  return MEMORY[0x1E0D0BC60]();
}

uint64_t _CalDatabaseCreateInviteReplyNotification()
{
  return MEMORY[0x1E0D0BC68]();
}

uint64_t _CalDatabaseCreateLocation()
{
  return MEMORY[0x1E0D0BC70]();
}

uint64_t _CalDatabaseCreateNotification()
{
  return MEMORY[0x1E0D0BC78]();
}

uint64_t _CalDatabaseCreateOrganizer()
{
  return MEMORY[0x1E0D0BC80]();
}

uint64_t _CalDatabaseCreateRecurrence()
{
  return MEMORY[0x1E0D0BC88]();
}

uint64_t _CalDatabaseCreateResourceChangeNotification()
{
  return MEMORY[0x1E0D0BC90]();
}

uint64_t _CalDatabaseCreateSharee()
{
  return MEMORY[0x1E0D0BC98]();
}

uint64_t _CalDatabaseCreateStore()
{
  return MEMORY[0x1E0D0BCA0]();
}

uint64_t _CalDatabaseCreateSuggestedEventInfo()
{
  return MEMORY[0x1E0D0BCA8]();
}

uint64_t _CalDatabaseCreateSuggestionNotification()
{
  return MEMORY[0x1E0D0BCB0]();
}

uint64_t _CalDatabaseGetImageWithIdentifierInStoreID()
{
  return MEMORY[0x1E0D0BCB8]();
}

uint64_t _CalDatabaseGetLimitedAccessVirtualCalendar()
{
  return MEMORY[0x1E0D0BCC0]();
}

uint64_t _CalDatabaseGetLimitedAccessVirtualStore()
{
  return MEMORY[0x1E0D0BCC8]();
}

uint64_t _CalDatabaseGetRecordStore()
{
  return MEMORY[0x1E0D0BCD0]();
}

uint64_t _CalDatabasePostDBOrSyncStatusChangeNotification()
{
  return MEMORY[0x1E0D0BCD8]();
}

uint64_t _CalEntityGetType()
{
  return MEMORY[0x1E0D0BCE0]();
}

uint64_t _CalEntityIsDeleted()
{
  return MEMORY[0x1E0D0BCE8]();
}

uint64_t _CalEntityIsOfType()
{
  return MEMORY[0x1E0D0BCF0]();
}

uint64_t _CalErrorGetWithUID()
{
  return MEMORY[0x1E0D0BCF8]();
}

uint64_t _CalEventActionGetWithUID()
{
  return MEMORY[0x1E0D0BD00]();
}

uint64_t _CalEventActionRemove()
{
  return MEMORY[0x1E0D0BD08]();
}

uint64_t _CalEventGetDuration()
{
  return MEMORY[0x1E0D0BD10]();
}

uint64_t _CalEventGetJunkStatusWhileLocked()
{
  return MEMORY[0x1E0D0BD18]();
}

uint64_t _CalEventIsDetached()
{
  return MEMORY[0x1E0D0BD20]();
}

uint64_t _CalEventOccurrenceCacheCopySpotlightOccurrenceDates()
{
  return MEMORY[0x1E0D0BD28]();
}

uint64_t _CalEventSetInvitationStatus()
{
  return MEMORY[0x1E0D0BD30]();
}

uint64_t _CalExceptionDateGetOwner()
{
  return MEMORY[0x1E0D0BD38]();
}

uint64_t _CalExceptionDateGetWithUID()
{
  return MEMORY[0x1E0D0BD40]();
}

uint64_t _CalGetCalendarItemWithRowID()
{
  return MEMORY[0x1E0D0BD48]();
}

uint64_t _CalGetCalendarWithUID()
{
  return MEMORY[0x1E0D0BD50]();
}

uint64_t _CalGetStoreWithUID()
{
  return MEMORY[0x1E0D0BD58]();
}

uint64_t _CalImageGetWithUID()
{
  return MEMORY[0x1E0D0BD60]();
}

uint64_t _CalLocationGetWithUID()
{
  return MEMORY[0x1E0D0BD68]();
}

uint64_t _CalNotificationGetWithUID()
{
  return MEMORY[0x1E0D0BD70]();
}

uint64_t _CalParticipantGetWithUID()
{
  return MEMORY[0x1E0D0BD78]();
}

uint64_t _CalRecurrenceGetWithUID()
{
  return MEMORY[0x1E0D0BD80]();
}

uint64_t _CalRemoveAlarm()
{
  return MEMORY[0x1E0D0BD88]();
}

uint64_t _CalRemoveAttachment()
{
  return MEMORY[0x1E0D0BD90]();
}

uint64_t _CalRemoveAttendee()
{
  return MEMORY[0x1E0D0BD98]();
}

uint64_t _CalRemoveCalendar()
{
  return MEMORY[0x1E0D0BDA0]();
}

uint64_t _CalRemoveColor()
{
  return MEMORY[0x1E0D0BDA8]();
}

uint64_t _CalRemoveConference()
{
  return MEMORY[0x1E0D0BDB0]();
}

uint64_t _CalRemoveContact()
{
  return MEMORY[0x1E0D0BDB8]();
}

uint64_t _CalRemoveError()
{
  return MEMORY[0x1E0D0BDC0]();
}

uint64_t _CalRemoveEvent()
{
  return MEMORY[0x1E0D0BDC8]();
}

uint64_t _CalRemoveExceptionDate()
{
  return MEMORY[0x1E0D0BDD0]();
}

uint64_t _CalRemoveImage()
{
  return MEMORY[0x1E0D0BDD8]();
}

uint64_t _CalRemoveLocation()
{
  return MEMORY[0x1E0D0BDE0]();
}

uint64_t _CalRemoveNotification()
{
  return MEMORY[0x1E0D0BDE8]();
}

uint64_t _CalRemoveOrganizer()
{
  return MEMORY[0x1E0D0BDF0]();
}

uint64_t _CalRemoveRecurrence()
{
  return MEMORY[0x1E0D0BDF8]();
}

uint64_t _CalRemoveResourceChange()
{
  return MEMORY[0x1E0D0BE00]();
}

uint64_t _CalRemoveSharee()
{
  return MEMORY[0x1E0D0BE08]();
}

uint64_t _CalRemoveStore()
{
  return MEMORY[0x1E0D0BE10]();
}

uint64_t _CalRemoveSuggestedEventInfo()
{
  return MEMORY[0x1E0D0BE18]();
}

uint64_t _CalRemoveTask()
{
  return MEMORY[0x1E0D0BE20]();
}

uint64_t _CalResourceChangeGetWithUID()
{
  return MEMORY[0x1E0D0BE28]();
}

uint64_t _CalShareeGetWithUID()
{
  return MEMORY[0x1E0D0BE30]();
}

uint64_t _CalStoreAddCalendar()
{
  return MEMORY[0x1E0D0BE38]();
}

uint64_t _CalStoreCopyUUID()
{
  return MEMORY[0x1E0D0BE40]();
}

uint64_t _CalSuggestedEventInfoGetWithUID()
{
  return MEMORY[0x1E0D0BE48]();
}

uint64_t _CalTimeZoneForceUpdate()
{
  return MEMORY[0x1E0D0C440]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1E0C9AA78]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x1E0DE40C8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

uint64_t dispatch_workloop_is_current()
{
  return MEMORY[0x1E0C82FE8]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1E0C83388](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x1E0C83638](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1E0DE8558](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1E0DE8560](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1E0DE8578](p, *(_QWORD *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x1E0DB11F8]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1E0DB1208]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1E0DB1240]();
}

uint64_t tcc_events_filter_create_with_criteria()
{
  return MEMORY[0x1E0DB1270]();
}

uint64_t tcc_events_subscribe()
{
  return MEMORY[0x1E0DB1278]();
}

uint64_t tcc_events_unsubscribe()
{
  return MEMORY[0x1E0DB1280]();
}

uint64_t tcc_identity_copy_external_representation()
{
  return MEMORY[0x1E0DB1288]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

uint64_t tcc_identity_create_from_external_representation()
{
  return MEMORY[0x1E0DB1298]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1E0DB12C8]();
}

uint64_t tcc_message_options_set_client_dict()
{
  return MEMORY[0x1E0DB12D0]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1E0DB12F0]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1E0DB1320]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x1E0DB1328]();
}

uint64_t tcc_server_message_request_authorization_change()
{
  return MEMORY[0x1E0DB1358]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1E0DB1390]();
}

int ungetc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C859A8](*(_QWORD *)&a1, a2);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E78](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

