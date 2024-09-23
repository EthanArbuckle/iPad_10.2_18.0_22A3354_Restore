@implementation CalCalendarMigrateTables

CFStringRef __CalCalendarMigrateTables_block_invoke(uint64_t a1, CFStringRef theString2, const __CFDictionary *a3)
{
  int v6;
  CFComparisonResult v7;
  CFStringRef result;
  const __CFNumber *v9;
  const __CFNumber *v10;
  uint64_t v11;
  const os_unfair_lock *Context;
  uint64_t v13;
  uint64_t **v14;
  uint64_t v15;
  const os_unfair_lock *v16;
  uint64_t v17;
  uint64_t v18;
  const os_unfair_lock *v19;
  const __CFUUID *v20;
  CFStringRef v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  const __CFNumber *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *Value;
  const void *v30;
  int v32;
  int v33;
  int valuePtr;

  v6 = *(_DWORD *)(a1 + 40);
  if (v6 <= 52)
  {
    if (CFStringCompare(CFSTR("UUID"), theString2, 0) == kCFCompareEqualTo)
    {
      v20 = CFUUIDCreate(0);
      v21 = CFUUIDCreateString(0, v20);
      CFRelease(v20);
      return v21;
    }
    v6 = *(_DWORD *)(a1 + 40);
  }
  if ((v6 - 13) > 0x28)
  {
LABEL_7:
    if (v6 > 119 || CFStringCompare(CFSTR("symbolic_color_name"), theString2, 0))
      goto LABEL_9;
    Value = CFDictionaryGetValue(a3, CFSTR("symbolic_color_name"));
    v30 = CFDictionaryGetValue(a3, CFSTR("color"));
    if (Value)
    {
      if (Value != (const void *)*MEMORY[0x1E0C9B0D0] || v30 == 0)
        goto LABEL_9;
    }
    else
    {
      if (!v30)
        goto LABEL_9;
      Value = (const void *)*MEMORY[0x1E0C9B0D0];
    }
    if (v30 != Value)
      return (CFStringRef)symbolicColorForLegacyRGB();
LABEL_9:
    if ((*(_DWORD *)(a1 + 40) - 14008) <= 0x7CC)
    {
      v7 = CFStringCompare(CFSTR("error_id"), theString2, 0);
      result = 0;
      if (v7)
        return result;
      v9 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("last_sync_error"));
      result = 0;
      if (!v9 || v9 == (const __CFNumber *)*MEMORY[0x1E0C9B0D0])
        return result;
      valuePtr = 0;
      CFNumberGetValue(v9, kCFNumberIntType, &valuePtr);
      if (valuePtr)
      {
        v10 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("ROWID"));
        v33 = 0;
        CFNumberGetValue(v10, kCFNumberIntType, &v33);
        v11 = *(_QWORD *)(a1 + 32);
        if (CDBLockingAssertionsEnabled)
        {
          if (v11)
          {
            if (*(_QWORD *)v11)
            {
              if (*(_QWORD *)(*(_QWORD *)v11 + 104))
              {
                Context = (const os_unfair_lock *)CPRecordStoreGetContext();
                if (Context)
                  os_unfair_lock_assert_owner(Context + 20);
              }
            }
          }
        }
        v13 = CPSqliteConnectionStatementForSQL();
        if (v13)
        {
          v14 = (uint64_t **)v13;
          sqlite3_bind_int(*(sqlite3_stmt **)(v13 + 8), 1, v33);
          if (CDBLockingAssertionsEnabled)
          {
            if (*v14)
            {
              v15 = **v14;
              if (v15)
              {
                if (*(_QWORD *)(v15 + 104))
                {
                  v16 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v16)
                    os_unfair_lock_assert_owner(v16 + 20);
                }
              }
            }
          }
          v17 = CPSqliteStatementIntegerResult();
          if (CDBLockingAssertionsEnabled)
          {
            if (*v14)
            {
              v18 = **v14;
              if (v18)
              {
                if (*(_QWORD *)(v18 + 104))
                {
                  v19 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v19)
                    os_unfair_lock_assert_owner(v19 + 20);
                }
              }
            }
          }
          CPSqliteStatementReset();
          if ((_DWORD)v17)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
            return (CFStringRef)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
    return 0;
  }
  if (CFStringCompare(CFSTR("color"), theString2, 0))
    goto LABEL_6;
  valuePtr = -1;
  v32 = -1;
  v33 = -1;
  v22 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("color_r"));
  v23 = (const __CFNumber *)*MEMORY[0x1E0C9B0D0];
  if (v22 && v22 != v23)
    CFNumberGetValue(v22, kCFNumberIntType, &valuePtr);
  v24 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("color_g"));
  if (v24 && v24 != v23)
    CFNumberGetValue(v24, kCFNumberIntType, &v32);
  v25 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("color_b"));
  if (v25 && v25 != v23)
    CFNumberGetValue(v25, kCFNumberIntType, &v33);
  if (valuePtr == -1 || v33 == -1 || v32 == -1)
  {
LABEL_6:
    v6 = *(_DWORD *)(a1 + 40);
    goto LABEL_7;
  }
  if (valuePtr >= 255)
    v26 = 255;
  else
    v26 = valuePtr;
  valuePtr = v26;
  if (v32 >= 255)
    v27 = 255;
  else
    v27 = v32;
  if (v33 >= 255)
    v28 = 255;
  else
    v28 = v33;
  v32 = v27;
  v33 = v28;
  return CFStringCreateWithFormat(0, 0, CFSTR("#%02X%02X%02X"), v26, v27, v28);
}

void *__CalCalendarMigrateTables_block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("old_flags")))
    return &unk_1E4FA3E98;
  else
    return 0;
}

@end
