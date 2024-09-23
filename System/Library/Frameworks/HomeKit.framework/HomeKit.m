void sub_19B1B2FEC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1B48A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1B4918(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1B5260(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1B550C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19B1B56F4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19B1B577C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1B5A40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedInstanceForHMAccessoryCategory__lock);
  _Unwind_Resume(a1);
}

void sub_19B1B5D50(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id sharedIdentifierSaltStore()
{
  if (sharedIdentifierSaltStore_onceToken != -1)
    dispatch_once(&sharedIdentifierSaltStore_onceToken, &__block_literal_global_81);
  return (id)sharedIdentifierSaltStore_identifierSaltStore;
}

void sub_19B1B7490(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1B97C0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id allowedCharValueTypes()
{
  if (allowedCharValueTypes_onceToken != -1)
    dispatch_once(&allowedCharValueTypes_onceToken, &__block_literal_global_30);
  return (id)allowedCharValueTypes_charValueTypes;
}

void sub_19B1B9AB0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1B9FDC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1BA7FC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

const __CFString *HMAccessoryCertificationStatusToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("Not Certified");
  if (a1 == 2)
    return CFSTR("Certified");
  else
    return v1;
}

void ____handleAccessoryRuntimeStateUpdate_block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_19B1BD97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_19B1BDF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL isInternalBuild()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "productVariant") == 3;

  return v1;
}

void sub_19B1BE7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, id a11)
{
  os_unfair_lock_s *v11;
  id *v12;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v11);
  _Unwind_Resume(a1);
}

void sub_19B1BEA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1BEB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1BEBE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1BEF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1BF0D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1BFAD0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1BFDE4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____handleAccessoryRuntimeStateUpdate_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyDelegateOfBatchNotificationsEndWithReason:", *(_QWORD *)(a1 + 40));

}

void sub_19B1C0268(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1C0638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1C0AA8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1C0BD4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1C0D5C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1C172C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_19B1C1E3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1C2580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1C3E50(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_19B1C4174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMHomeManagerOptionsShortDescription(uint64_t a1)
{
  __int16 v1;
  __CFString *v2;
  void *v3;
  void *v4;

  if (!a1)
  {
    v2 = CFSTR("None");
    return v2;
  }
  v1 = a1;
  if (a1 != -1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((v1 & 1) != 0)
    {
      objc_msgSend(v3, "addObject:", CFSTR("HM"));
      if ((v1 & 2) == 0)
      {
LABEL_7:
        if ((v1 & 4) == 0)
          goto LABEL_8;
        goto LABEL_24;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v4, "addObject:", CFSTR("PI"));
    if ((v1 & 4) == 0)
    {
LABEL_8:
      if ((v1 & 8) == 0)
        goto LABEL_9;
      goto LABEL_25;
    }
LABEL_24:
    objc_msgSend(v4, "addObject:", CFSTR("RM"));
    if ((v1 & 8) == 0)
    {
LABEL_9:
      if ((v1 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_26;
    }
LABEL_25:
    objc_msgSend(v4, "addObject:", CFSTR("USR"));
    if ((v1 & 0x10) == 0)
    {
LABEL_10:
      if ((v1 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_27;
    }
LABEL_26:
    objc_msgSend(v4, "addObject:", CFSTR("CA"));
    if ((v1 & 0x20) == 0)
    {
LABEL_11:
      if ((v1 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_28;
    }
LABEL_27:
    objc_msgSend(v4, "addObject:", CFSTR("SET"));
    if ((v1 & 0x40) == 0)
    {
LABEL_12:
      if ((v1 & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_29;
    }
LABEL_28:
    objc_msgSend(v4, "addObject:", CFSTR("AMA"));
    if ((v1 & 0x80) == 0)
    {
LABEL_13:
      if ((v1 & 0x100) == 0)
        goto LABEL_14;
      goto LABEL_30;
    }
LABEL_29:
    objc_msgSend(v4, "addObject:", CFSTR("MS"));
    if ((v1 & 0x100) == 0)
    {
LABEL_14:
      if ((v1 & 0x200) == 0)
        goto LABEL_15;
      goto LABEL_31;
    }
LABEL_30:
    objc_msgSend(v4, "addObject:", CFSTR("APA"));
    if ((v1 & 0x200) == 0)
    {
LABEL_15:
      if ((v1 & 0x400) == 0)
        goto LABEL_16;
      goto LABEL_32;
    }
LABEL_31:
    objc_msgSend(v4, "addObject:", CFSTR("HAP"));
    if ((v1 & 0x400) == 0)
    {
LABEL_16:
      if ((v1 & 0x800) == 0)
        goto LABEL_17;
      goto LABEL_33;
    }
LABEL_32:
    objc_msgSend(v4, "addObject:", CFSTR("TVA"));
    if ((v1 & 0x800) == 0)
    {
LABEL_17:
      if ((v1 & 0x1000) == 0)
        goto LABEL_18;
      goto LABEL_34;
    }
LABEL_33:
    objc_msgSend(v4, "addObject:", CFSTR("DEV"));
    if ((v1 & 0x1000) == 0)
    {
LABEL_18:
      if ((v1 & 0x8000) == 0)
      {
LABEL_20:
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        return v2;
      }
LABEL_19:
      objc_msgSend(v4, "addObject:", CFSTR("SEA"));
      goto LABEL_20;
    }
LABEL_34:
    objc_msgSend(v4, "addObject:", CFSTR("WRA"));
    if ((v1 & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  v2 = CFSTR("All");
  return v2;
}

BOOL HMPBMetadataCharacteristicReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMPBMetadataServiceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMPBMetadataCategoryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_34;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_36:
        *(_DWORD *)(a1 + 16) = v22;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B1C7578(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1C8914(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id resolveCharacteristic(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_findCharacteristic:forService:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_19B1CA1B0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  os_unfair_lock_s *v17;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;

  if (a2 == 1)
  {
    v19 = objc_begin_catch(a1);
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v22;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v19;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Exception while searching list (%@)", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);

    objc_end_catch();
    JUMPOUT(0x19B1CA14CLL);
  }
  os_unfair_lock_unlock(v17);
  _Unwind_Resume(a1);
}

void sub_19B1CA344(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1CAD40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMPrivacyRequestAccessForService(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (a1)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("HMPrivacyRequestAccessForService"));
    v9 = TCCAccessPreflight();
    if ((v9 - 1) >= 2)
    {
      if (!v9)
        v7[2](v7, 1);
    }
    else
    {
      v13 = v5;
      v15 = v7;
      v14 = v8;
      TCCAccessRequest();

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot request TCC access with unknown service", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v7[2](v7, 0);
  }

}

void __handleAccessoryRuntimeStateUpdate(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = v6;
  objc_msgSend(v6, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = dispatch_group_create();
  objc_msgSend(v5, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  objc_msgSend(v13, "notifyDelegateOfBatchNotificationsStartWithReason:", v7);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = v5;
  objc_msgSend(v5, "accessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v19, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "UUIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "containsObject:", v21))
        {
          objc_msgSend(v9, "hmf_dictionaryForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v12);
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = ____handleAccessoryRuntimeStateUpdate_block_invoke;
          v31[3] = &unk_1E3AB5E18;
          v32 = v12;
          objc_msgSend(v19, "handleRuntimeStateUpdate:completionHandler:", v22, v31);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

  dispatch_get_global_queue(-32768, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____handleAccessoryRuntimeStateUpdate_block_invoke_2;
  block[3] = &unk_1E3AB5ED8;
  v29 = v27;
  v30 = v26;
  v24 = v26;
  v25 = v27;
  dispatch_group_notify(v12, v23, block);

}

void sub_19B1CD53C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id _dictionaryRepresentationForReportContext(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reportDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("HMHomeReportDomainMessageKey"));

  objc_msgSend(v1, "requestInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("HMHomeRequestInfoMessageKey"));

  objc_msgSend(v1, "reportTimeout");
  if (v5 > 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v1, "reportTimeout");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("HMHomeReportTimeoutMessageKey"));

  }
  v8 = (void *)objc_msgSend(v2, "copy");

  return v8;
}

void __initializeMappingsAndPaths_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *context;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  const __CFString *v106;
  const __CFString *v107;
  const __CFString *v108;
  const __CFString *v109;
  const __CFString *v110;
  const __CFString *v111;
  const __CFString *v112;
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  const __CFString *v116;
  const __CFString *v117;
  const __CFString *v118;
  const __CFString *v119;
  const __CFString *v120;
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  const __CFString *v124;
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  const __CFString *v128;
  const __CFString *v129;
  const __CFString *v130;
  const __CFString *v131;
  const __CFString *v132;
  const __CFString *v133;
  const __CFString *v134;
  const __CFString *v135;
  const __CFString *v136;
  const __CFString *v137;
  const __CFString *v138;
  const __CFString *v139;
  const __CFString *v140;
  const __CFString *v141;
  const __CFString *v142;
  const __CFString *v143;
  const __CFString *v144;
  const __CFString *v145;
  const __CFString *v146;
  const __CFString *v147;
  const __CFString *v148;
  const __CFString *v149;
  const __CFString *v150;
  const __CFString *v151;
  const __CFString *v152;
  const __CFString *v153;
  const __CFString *v154;
  const __CFString *v155;
  const __CFString *v156;
  const __CFString *v157;
  const __CFString *v158;
  const __CFString *v159;
  const __CFString *v160;
  const __CFString *v161;
  const __CFString *v162;
  const __CFString *v163;
  const __CFString *v164;
  const __CFString *v165;
  const __CFString *v166;
  const __CFString *v167;
  const __CFString *v168;
  const __CFString *v169;
  const __CFString *v170;
  const __CFString *v171;
  const __CFString *v172;
  const __CFString *v173;
  const __CFString *v174;
  const __CFString *v175;
  const __CFString *v176;
  const __CFString *v177;
  const __CFString *v178;
  const __CFString *v179;
  const __CFString *v180;
  const __CFString *v181;
  const __CFString *v182;
  const __CFString *v183;
  const __CFString *v184;
  const __CFString *v185;
  const __CFString *v186;
  const __CFString *v187;
  const __CFString *v188;
  const __CFString *v189;
  const __CFString *v190;
  const __CFString *v191;
  const __CFString *v192;
  const __CFString *v193;
  const __CFString *v194;
  const __CFString *v195;
  const __CFString *v196;
  const __CFString *v197;
  const __CFString *v198;
  const __CFString *v199;
  const __CFString *v200;
  const __CFString *v201;
  const __CFString *v202;
  const __CFString *v203;
  const __CFString *v204;
  const __CFString *v205;
  const __CFString *v206;
  const __CFString *v207;
  const __CFString *v208;
  const __CFString *v209;
  const __CFString *v210;
  const __CFString *v211;
  const __CFString *v212;
  const __CFString *v213;
  const __CFString *v214;
  const __CFString *v215;
  const __CFString *v216;
  const __CFString *v217;
  const __CFString *v218;
  const __CFString *v219;
  const __CFString *v220;
  const __CFString *v221;
  const __CFString *v222;
  const __CFString *v223;
  const __CFString *v224;
  const __CFString *v225;
  const __CFString *v226;
  const __CFString *v227;
  const __CFString *v228;
  const __CFString *v229;
  const __CFString *v230;
  const __CFString *v231;
  const __CFString *v232;
  const __CFString *v233;
  const __CFString *v234;
  const __CFString *v235;
  const __CFString *v236;
  const __CFString *v237;
  const __CFString *v238;
  const __CFString *v239;
  const __CFString *v240;
  const __CFString *v241;
  const __CFString *v242;
  const __CFString *v243;
  const __CFString *v244;
  const __CFString *v245;
  const __CFString *v246;
  const __CFString *v247;
  const __CFString *v248;
  const __CFString *v249;
  const __CFString *v250;
  const __CFString *v251;
  const __CFString *v252;
  const __CFString *v253;
  const __CFString *v254;
  const __CFString *v255;
  const __CFString *v256;
  const __CFString *v257;
  const __CFString *v258;
  const __CFString *v259;
  const __CFString *v260;
  const __CFString *v261;
  const __CFString *v262;
  const __CFString *v263;
  const __CFString *v264;
  const __CFString *v265;
  const __CFString *v266;
  const __CFString *v267;
  const __CFString *v268;
  const __CFString *v269;
  const __CFString *v270;
  const __CFString *v271;
  const __CFString *v272;
  const __CFString *v273;
  const __CFString *v274;
  const __CFString *v275;
  const __CFString *v276;
  const __CFString *v277;
  const __CFString *v278;
  const __CFString *v279;
  const __CFString *v280;
  const __CFString *v281;
  const __CFString *v282;
  const __CFString *v283;
  const __CFString *v284;
  const __CFString *v285;
  const __CFString *v286;
  const __CFString *v287;
  const __CFString *v288;
  const __CFString *v289;
  const __CFString *v290;
  const __CFString *v291;
  const __CFString *v292;
  const __CFString *v293;
  const __CFString *v294;
  const __CFString *v295;
  const __CFString *v296;
  const __CFString *v297;
  const __CFString *v298;
  const __CFString *v299;
  const __CFString *v300;
  const __CFString *v301;
  const __CFString *v302;
  const __CFString *v303;
  const __CFString *v304;
  const __CFString *v305;
  const __CFString *v306;
  const __CFString *v307;
  const __CFString *v308;
  const __CFString *v309;
  const __CFString *v310;
  const __CFString *v311;
  const __CFString *v312;
  uint64_t v313;

  v313 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v31 = CFSTR("0000003E-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v31 + 1) = CFSTR("0000008D-0000-1000-8000-0026BB765291");
  v170 = CFSTR("ACCESSORY_INFORMATION_SVC");
  v171 = CFSTR("AIR_QUALITY_SENSOR_SVC");
  *(_QWORD *)&v32 = CFSTR("00000096-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v32 + 1) = CFSTR("00000097-0000-1000-8000-0026BB765291");
  v172 = CFSTR("BATTERY_SVC");
  v173 = CFSTR("CARBON_DIOXIDE_SENSOR_SVC");
  *(_QWORD *)&v33 = CFSTR("0000007F-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v33 + 1) = CFSTR("00000080-0000-1000-8000-0026BB765291");
  v174 = CFSTR("CARBON_MONOXIDE_SENSOR_SVC");
  v175 = CFSTR("CONTACT_SENSOR_SVC");
  *(_QWORD *)&v34 = CFSTR("00000081-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v34 + 1) = CFSTR("00000121-0000-1000-8000-0026BB765291");
  v176 = CFSTR("DOOR_SVC");
  v177 = CFSTR("DOORBELL_SVC");
  v35 = CFSTR("00000040-0000-1000-8000-0026BB765291");
  v36 = CFSTR("00000041-0000-1000-8000-0026BB765291");
  v178 = CFSTR("FAN_SVC");
  v179 = CFSTR("GARAGE_DOOR_OPENER_SVC");
  v37 = CFSTR("00000082-0000-1000-8000-0026BB765291");
  v38 = CFSTR("00000083-0000-1000-8000-0026BB765291");
  v180 = CFSTR("HUMIDITY_SENSOR_SVC");
  v181 = CFSTR("LEAK_SENSOR_SVC");
  v39 = CFSTR("00000084-0000-1000-8000-0026BB765291");
  v40 = CFSTR("00000043-0000-1000-8000-0026BB765291");
  v182 = CFSTR("LIGHT_SENSOR_SVC");
  v183 = CFSTR("LIGHTBULB_SVC");
  v41 = CFSTR("00000044-0000-1000-8000-0026BB765291");
  v42 = CFSTR("00000045-0000-1000-8000-0026BB765291");
  v184 = CFSTR("LOCK_MANAGEMENT_SVC");
  v185 = CFSTR("LOCK_MECHANISM_SVC");
  v43 = CFSTR("00000085-0000-1000-8000-0026BB765291");
  v44 = CFSTR("00000086-0000-1000-8000-0026BB765291");
  v186 = CFSTR("MOTION_SENSOR_SVC");
  v187 = CFSTR("OCCUPANCY_SENSOR_SVC");
  v45 = CFSTR("00000047-0000-1000-8000-0026BB765291");
  v46 = CFSTR("0000007E-0000-1000-8000-0026BB765291");
  v188 = CFSTR("OUTLET_SVC");
  v189 = CFSTR("SECURITY_SYSTEM_SVC");
  v47 = CFSTR("00000087-0000-1000-8000-0026BB765291");
  v48 = CFSTR("00000088-0000-1000-8000-0026BB765291");
  v190 = CFSTR("SMOKE_SENSOR_SVC");
  v191 = CFSTR("STATEFUL_PROGRAMMABLE_SWITCH_SVC");
  v49 = CFSTR("00000089-0000-1000-8000-0026BB765291");
  v50 = CFSTR("00000049-0000-1000-8000-0026BB765291");
  v192 = CFSTR("STATELESS_PROGRAMMABLE_SWITCH_SVC");
  v193 = CFSTR("SWITCH_SVC");
  v51 = CFSTR("0000008A-0000-1000-8000-0026BB765291");
  v52 = CFSTR("0000004A-0000-1000-8000-0026BB765291");
  v194 = CFSTR("TEMPERATURE_SENSOR_SVC");
  v195 = CFSTR("THERMOSTAT_SVC");
  v53 = CFSTR("0000008B-0000-1000-8000-0026BB765291");
  v54 = CFSTR("0000008C-0000-1000-8000-0026BB765291");
  v196 = CFSTR("WINDOW_SVC");
  v197 = CFSTR("WINDOW_COVERING_SVC");
  v55 = CFSTR("00000110-0000-1000-8000-0026BB765291");
  v56 = CFSTR("00000111-0000-1000-8000-0026BB765291");
  v198 = CFSTR("CAMERA_STREAM_SVC");
  v199 = CFSTR("CAMERA_CTRL_SVC");
  v57 = CFSTR("00000112-0000-1000-8000-0026BB765291");
  v58 = CFSTR("00000113-0000-1000-8000-0026BB765291");
  v200 = CFSTR("MICROPHONE_SVC");
  v201 = CFSTR("SPEAKER_SVC");
  v59 = CFSTR("000000BB-0000-1000-8000-0026BB765291");
  v60 = CFSTR("000000B7-0000-1000-8000-0026BB765291");
  v202 = CFSTR("AIR_PURIFIER_SVC");
  v203 = CFSTR("VENTILATION_FAN_SVC");
  v61 = CFSTR("000000BA-0000-1000-8000-0026BB765291");
  v62 = CFSTR("000000BC-0000-1000-8000-0026BB765291");
  v204 = CFSTR("FILTER_MAINTENANCE_SVC");
  v205 = CFSTR("HEATER_COOLER_SVC");
  v63 = CFSTR("000000B9-0000-1000-8000-0026BB765291");
  v64 = CFSTR("000000BD-0000-1000-8000-0026BB765291");
  v206 = CFSTR("SLATS_SVC");
  v207 = CFSTR("HUMIDIFIER_DEHUMIDIFIER_SVC");
  v65 = CFSTR("000000CC-0000-1000-8000-0026BB765291");
  v66 = CFSTR("000000CF-0000-1000-8000-0026BB765291");
  v208 = CFSTR("LABEL_SVC");
  v209 = CFSTR("IRRIGATION_SYSTEM_SVC");
  v67 = CFSTR("000000D0-0000-1000-8000-0026BB765291");
  v68 = CFSTR("000000D7-0000-1000-8000-0026BB765291");
  v210 = CFSTR("VALVE_SVC");
  v211 = CFSTR("FAUCET_SVC");
  v69 = CFSTR("0000021A-0000-1000-8000-0026BB765291");
  v70 = CFSTR("00000204-0000-1000-8000-0026BB765291");
  v212 = CFSTR("CAMERA_OPERATING_MODE_SVC");
  v213 = CFSTR("CAMERA_RECORDING_MGMT_SVC");
  v71 = CFSTR("00000122-0000-1000-8000-0026BB765291");
  v72 = CFSTR("00000125-0000-1000-8000-0026BB765291");
  v214 = CFSTR("TARGET_CONTROL_MANAGEMENT_SVC");
  v215 = CFSTR("TARGET_CONTROL_SVC");
  v73 = CFSTR("000000D8-0000-1000-8000-0026BB765291");
  v74 = CFSTR("000000D9-0000-1000-8000-0026BB765291");
  v216 = CFSTR("TELEVISION_SVC");
  v217 = CFSTR("INPUT_SOURCE_SVC");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v31, 48);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceTypeLocalizationKeyMapping;
  serviceTypeLocalizationKeyMapping = v0;

  *(_QWORD *)&v31 = CFSTR("00000001-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v31 + 1) = CFSTR("00000064-0000-1000-8000-0026BB765291");
  v170 = CFSTR("ADMIN_ONLY_ACCESS_CHR");
  v171 = CFSTR("AIR_PARTICULATE_DENSITY_CHR");
  *(_QWORD *)&v32 = CFSTR("00000065-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v32 + 1) = CFSTR("00000095-0000-1000-8000-0026BB765291");
  v172 = CFSTR("AIR_PARTICULATE_SIZE_CHR");
  v173 = CFSTR("AIR_QUALITY_CHR");
  *(_QWORD *)&v33 = CFSTR("00000005-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v33 + 1) = CFSTR("00000068-0000-1000-8000-0026BB765291");
  v174 = CFSTR("AUDIO_FEEDBACK_CHR");
  v175 = CFSTR("BATTERY_LEVEL_CHR");
  *(_QWORD *)&v34 = CFSTR("00000008-0000-1000-8000-0026BB765291");
  *((_QWORD *)&v34 + 1) = CFSTR("00000092-0000-1000-8000-0026BB765291");
  v176 = CFSTR("BRIGHTNESS_CHR");
  v177 = CFSTR("CARBON_DIOXIDE_DETECTED_CHR");
  v35 = CFSTR("00000093-0000-1000-8000-0026BB765291");
  v36 = CFSTR("00000094-0000-1000-8000-0026BB765291");
  v178 = CFSTR("CARBON_DIOXIDE_LEVEL_CHR");
  v179 = CFSTR("CARBON_DIOXIDE_PEAK_LEVEL_CHR");
  v37 = CFSTR("00000069-0000-1000-8000-0026BB765291");
  v38 = CFSTR("00000090-0000-1000-8000-0026BB765291");
  v180 = CFSTR("CARBON_MONOXIDE_DETECTED_CHR");
  v181 = CFSTR("CARBON_MONOXIDE_LEVEL_CHR");
  v39 = CFSTR("00000091-0000-1000-8000-0026BB765291");
  v40 = CFSTR("0000008F-0000-1000-8000-0026BB765291");
  v182 = CFSTR("CARBON_MONOXIDE_PEAK_LEVEL_CHR");
  v183 = CFSTR("CHARGING_STATE_CHR");
  v41 = CFSTR("0000006A-0000-1000-8000-0026BB765291");
  v42 = CFSTR("0000000D-0000-1000-8000-0026BB765291");
  v184 = CFSTR("CONTACT_SENSOR_STATE_CHR");
  v185 = CFSTR("COOLING_THRESHOLD_TEMPERATURE_CHR");
  v43 = CFSTR("0000000E-0000-1000-8000-0026BB765291");
  v44 = CFSTR("0000000F-0000-1000-8000-0026BB765291");
  v186 = CFSTR("CURRENT_DOOR_STATE_CHR");
  v187 = CFSTR("CURRENT_HEATING_COOLING_STATE_CHR");
  v45 = CFSTR("0000006C-0000-1000-8000-0026BB765291");
  v46 = CFSTR("0000006B-0000-1000-8000-0026BB765291");
  v188 = CFSTR("CURRENT_HORIZONTAL_TILT_ANGLE_CHR");
  v189 = CFSTR("CURRENT_LIGHT_LEVEL_CHR");
  v47 = CFSTR("0000006D-0000-1000-8000-0026BB765291");
  v48 = CFSTR("00000010-0000-1000-8000-0026BB765291");
  v190 = CFSTR("CURRENT_POSITION_CHR");
  v191 = CFSTR("CURRENT_RELATIVE_HUMIDITY_CHR");
  v49 = CFSTR("00000066-0000-1000-8000-0026BB765291");
  v50 = CFSTR("00000011-0000-1000-8000-0026BB765291");
  v192 = CFSTR("CURRENT_SECURITY_SYSTEM_STATE_CHR");
  v193 = CFSTR("CURRENT_TEMPERATURE_CHR");
  v51 = CFSTR("0000006E-0000-1000-8000-0026BB765291");
  v52 = CFSTR("00000053-0000-1000-8000-0026BB765291");
  v194 = CFSTR("CURRENT_VERTICAL_TILT_ANGLE_CHR");
  v195 = CFSTR("HARDWARE_VERSION_CHR");
  v53 = CFSTR("00000012-0000-1000-8000-0026BB765291");
  v54 = CFSTR("0000006F-0000-1000-8000-0026BB765291");
  v196 = CFSTR("HEATING_THRESHOLD_TEMPERATURE_CHR");
  v197 = CFSTR("HOLD_POSITION_CHR");
  v55 = CFSTR("00000014-0000-1000-8000-0026BB765291");
  v56 = CFSTR("00000013-0000-1000-8000-0026BB765291");
  v198 = CFSTR("IDENTIFY_CHR");
  v199 = CFSTR("HUE_CHR");
  v57 = CFSTR("00000070-0000-1000-8000-0026BB765291");
  v58 = CFSTR("00000019-0000-1000-8000-0026BB765291");
  v200 = CFSTR("LEAK_DETECTED_CHR");
  v201 = CFSTR("LOCK_MANAGEMENT_CONTROLPOINT_CHR");
  v59 = CFSTR("0000001A-0000-1000-8000-0026BB765291");
  v60 = CFSTR("0000001D-0000-1000-8000-0026BB765291");
  v202 = CFSTR("LOCK_MANAGEMENT_AUTO_SECURITY_TIMEOUT_CHR");
  v203 = CFSTR("CURRENT_LOCK_MECHANISM_STATE_CHR");
  v61 = CFSTR("0000001C-0000-1000-8000-0026BB765291");
  v62 = CFSTR("0000001E-0000-1000-8000-0026BB765291");
  v204 = CFSTR("LOCK_MECHANISM_LAST_KNOWN_ACTION_CHR");
  v205 = CFSTR("TARGET_LOCK_MECHANISM_STATE_CHR");
  v63 = CFSTR("0000001F-0000-1000-8000-0026BB765291");
  v64 = CFSTR("00000022-0000-1000-8000-0026BB765291");
  v206 = CFSTR("LOGS_CHR");
  v207 = CFSTR("MOTION_DETECTED_CHR");
  v65 = CFSTR("00000023-0000-1000-8000-0026BB765291");
  v66 = CFSTR("00000024-0000-1000-8000-0026BB765291");
  v208 = CFSTR("NAME_CHR");
  v209 = CFSTR("OBSTRUCTION_DETECTED_CHR");
  v67 = CFSTR("00000071-0000-1000-8000-0026BB765291");
  v68 = CFSTR("00000026-0000-1000-8000-0026BB765291");
  v210 = CFSTR("OCCUPANCY_DETECTED_CHR");
  v211 = CFSTR("OUTLET_IN_USE_CHR");
  v69 = CFSTR("00000072-0000-1000-8000-0026BB765291");
  v70 = CFSTR("00000025-0000-1000-8000-0026BB765291");
  v212 = CFSTR("POSITION_STATE_CHR");
  v213 = CFSTR("POWER_STATE_CHR");
  v71 = CFSTR("00000073-0000-1000-8000-0026BB765291");
  v72 = CFSTR("00000074-0000-1000-8000-0026BB765291");
  v214 = CFSTR("PROGRAMMABLE_SWITCH_EVENT_CHR");
  v215 = CFSTR("PROGRAMMABLE_SWITCH_OUTPUT_STATE_CHR");
  v73 = CFSTR("00000028-0000-1000-8000-0026BB765291");
  v74 = CFSTR("00000029-0000-1000-8000-0026BB765291");
  v216 = CFSTR("ROTATION_DIRECTION_CHR");
  v217 = CFSTR("ROTATION_SPEED_CHR");
  v75 = CFSTR("0000002F-0000-1000-8000-0026BB765291");
  v76 = CFSTR("0000008E-0000-1000-8000-0026BB765291");
  v218 = CFSTR("SATURATION_CHR");
  v219 = CFSTR("SECURITY_SYSTEM_ALARM_TYPE_CHR");
  v77 = CFSTR("00000076-0000-1000-8000-0026BB765291");
  v78 = CFSTR("00000075-0000-1000-8000-0026BB765291");
  v220 = CFSTR("SMOKE_DETECTED_CHR");
  v221 = CFSTR("STATUS_ACTIVE_CHR");
  v79 = CFSTR("00000077-0000-1000-8000-0026BB765291");
  v80 = CFSTR("00000078-0000-1000-8000-0026BB765291");
  v222 = CFSTR("STATUS_FAULT_CHR");
  v223 = CFSTR("STATUS_JAMMED_CHR");
  v81 = CFSTR("00000079-0000-1000-8000-0026BB765291");
  v82 = CFSTR("0000007A-0000-1000-8000-0026BB765291");
  v224 = CFSTR("STATUS_LOW_BATTERY_CHR");
  v225 = CFSTR("STATUS_TAMPERED_CHR");
  v83 = CFSTR("00000032-0000-1000-8000-0026BB765291");
  v84 = CFSTR("00000033-0000-1000-8000-0026BB765291");
  v226 = CFSTR("TARGET_DOOR_STATE_CHR");
  v227 = CFSTR("TARGET_HEATING_COOLING_STATE_CHR");
  v85 = CFSTR("0000007B-0000-1000-8000-0026BB765291");
  v86 = CFSTR("0000007C-0000-1000-8000-0026BB765291");
  v228 = CFSTR("TARGET_HORIZONTAL_TILT_ANGLE_CHR");
  v229 = CFSTR("TARGET_POSITION_CHR");
  v87 = CFSTR("00000034-0000-1000-8000-0026BB765291");
  v88 = CFSTR("00000067-0000-1000-8000-0026BB765291");
  v230 = CFSTR("TARGET_RELATIVE_HUMIDITY_CHR");
  v231 = CFSTR("TARGET_SECURITY_SYSTEM_STATE_CHR");
  v89 = CFSTR("00000035-0000-1000-8000-0026BB765291");
  v90 = CFSTR("0000007D-0000-1000-8000-0026BB765291");
  v232 = CFSTR("TARGET_TEMPERATURE_CHR");
  v233 = CFSTR("TARGET_VERTICAL_TILT_ANGLE_CHR");
  v91 = CFSTR("00000036-0000-1000-8000-0026BB765291");
  v234 = CFSTR("TEMPERATURE_UNITS_CHR");
  v92 = CFSTR("00000037-0000-1000-8000-0026BB765291");
  v235 = CFSTR("VERSION_CHR");
  v93 = CFSTR("00000054-0000-1000-8000-0026BB765291");
  v236 = CFSTR("SOFTWARE_VERSION_CHR");
  v94 = CFSTR("00000120-0000-1000-8000-0026BB765291");
  v237 = CFSTR("STREAMING_STATUS");
  v95 = CFSTR("00000118-0000-1000-8000-0026BB765291");
  v238 = CFSTR("SETUP_STREAM_ENDPOINT");
  v96 = CFSTR("00000114-0000-1000-8000-0026BB765291");
  v239 = CFSTR("SUPP_VIDEO_CONFIG");
  v97 = CFSTR("00000115-0000-1000-8000-0026BB765291");
  v240 = CFSTR("SUPP_AUDIO_CONFIG");
  v98 = CFSTR("00000116-0000-1000-8000-0026BB765291");
  v241 = CFSTR("SUPP_RTP_CONFIG");
  v99 = CFSTR("00000117-0000-1000-8000-0026BB765291");
  v242 = CFSTR("SELECT_STREAM_CONFIG");
  v100 = CFSTR("00000119-0000-1000-8000-0026BB765291");
  v243 = CFSTR("VOLUME");
  v101 = CFSTR("0000011A-0000-1000-8000-0026BB765291");
  v244 = CFSTR("MUTE");
  v102 = CFSTR("0000011B-0000-1000-8000-0026BB765291");
  v245 = CFSTR("NIGHT_VISION");
  v103 = CFSTR("0000011C-0000-1000-8000-0026BB765291");
  v246 = CFSTR("OPTICAL_ZOOM");
  v104 = CFSTR("0000011D-0000-1000-8000-0026BB765291");
  v247 = CFSTR("DIGITAL_ZOOM");
  v105 = CFSTR("0000011E-0000-1000-8000-0026BB765291");
  v248 = CFSTR("IMAGE_ROTATION");
  v106 = CFSTR("0000011F-0000-1000-8000-0026BB765291");
  v249 = CFSTR("IMAGE_MIRRORING");
  v107 = CFSTR("000000B0-0000-1000-8000-0026BB765291");
  v250 = CFSTR("ACTIVE");
  v108 = CFSTR("000000A9-0000-1000-8000-0026BB765291");
  v251 = CFSTR("CURRENT_AIR_PURIFIER_STATE");
  v109 = CFSTR("000000AF-0000-1000-8000-0026BB765291");
  v252 = CFSTR("CURRENT_FAN_STATE");
  v110 = CFSTR("000000B1-0000-1000-8000-0026BB765291");
  v253 = CFSTR("CURRENT_HEATER_COOLER_STATE");
  v111 = CFSTR("000000B3-0000-1000-8000-0026BB765291");
  v254 = CFSTR("CURRENT_HUMIDIFIER_DEHUMIDIFIER_STATE");
  v112 = CFSTR("000000AA-0000-1000-8000-0026BB765291");
  v255 = CFSTR("CURRENT_SLAT_STATE");
  v113 = CFSTR("000000C1-0000-1000-8000-0026BB765291");
  v256 = CFSTR("CURRENT_TILT_ANGLE");
  v114 = CFSTR("000000C9-0000-1000-8000-0026BB765291");
  v257 = CFSTR("DEHUMIDIFIER_THRESHOLD");
  v115 = CFSTR("000000AC-0000-1000-8000-0026BB765291");
  v258 = CFSTR("FILTER_CHANGE_INDICATION");
  v116 = CFSTR("000000AB-0000-1000-8000-0026BB765291");
  v259 = CFSTR("FILTER_LIFE_LEVEL");
  v117 = CFSTR("000000AD-0000-1000-8000-0026BB765291");
  v260 = CFSTR("FILTER_RESET_CHANGE_INDICATION");
  v118 = CFSTR("000000CA-0000-1000-8000-0026BB765291");
  v261 = CFSTR("HUMIDIFIER_THRESHOLD");
  v119 = CFSTR("000000A7-0000-1000-8000-0026BB765291");
  v262 = CFSTR("LOCK_PHYSICAL_CONTROLS");
  v120 = CFSTR("000000C4-0000-1000-8000-0026BB765291");
  v263 = CFSTR("NITROGENDIOXIDE_DENSITY");
  v121 = CFSTR("000000C3-0000-1000-8000-0026BB765291");
  v264 = CFSTR("OZONE_DENSITY");
  v122 = CFSTR("000000C6-0000-1000-8000-0026BB765291");
  v265 = CFSTR("PM2_5_DENSITY");
  v123 = CFSTR("000000C7-0000-1000-8000-0026BB765291");
  v266 = CFSTR("PM10_DENSITY");
  v124 = CFSTR("000000C0-0000-1000-8000-0026BB765291");
  v267 = CFSTR("SLAT_TYPE");
  v125 = CFSTR("000000C5-0000-1000-8000-0026BB765291");
  v268 = CFSTR("SULPHURDIOXIDE_DENSITY");
  v126 = CFSTR("000000B6-0000-1000-8000-0026BB765291");
  v269 = CFSTR("SWING_MODE");
  v127 = CFSTR("000000A8-0000-1000-8000-0026BB765291");
  v270 = CFSTR("TARGET_AIR_PURIFIER_STATE");
  v128 = CFSTR("000000BF-0000-1000-8000-0026BB765291");
  v271 = CFSTR("TARGET_FAN_STATE");
  v129 = CFSTR("000000B2-0000-1000-8000-0026BB765291");
  v272 = CFSTR("TARGET_HEATER_COOLER_STATE");
  v130 = CFSTR("000000B4-0000-1000-8000-0026BB765291");
  v273 = CFSTR("TARGET_HUMIDIFIER_DEHUMIDIFIER_STATE");
  v131 = CFSTR("000000C2-0000-1000-8000-0026BB765291");
  v274 = CFSTR("TARGET_TILT_ANGLE");
  v132 = CFSTR("000000C8-0000-1000-8000-0026BB765291");
  v275 = CFSTR("VOC_DENSITY");
  v133 = CFSTR("000000B5-0000-1000-8000-0026BB765291");
  v276 = CFSTR("WATER_LEVEL");
  v134 = CFSTR("000000CB-0000-1000-8000-0026BB765291");
  v277 = CFSTR("LABEL_INDEX");
  v135 = CFSTR("000000CD-0000-1000-8000-0026BB765291");
  v278 = CFSTR("LABEL_NAMESPACE");
  v136 = CFSTR("000000CE-0000-1000-8000-0026BB765291");
  v279 = CFSTR("COLOR_TEMPERATURE");
  v137 = CFSTR("000000D1-0000-1000-8000-0026BB765291");
  v280 = CFSTR("PROGRAM_MODE");
  v138 = CFSTR("000000D2-0000-1000-8000-0026BB765291");
  v281 = CFSTR("IN_USE");
  v139 = CFSTR("000000D3-0000-1000-8000-0026BB765291");
  v282 = CFSTR("SET_DURATION");
  v140 = CFSTR("000000D4-0000-1000-8000-0026BB765291");
  v283 = CFSTR("REMAINING_DURATION");
  v141 = CFSTR("000000D5-0000-1000-8000-0026BB765291");
  v284 = CFSTR("VALVE_TYPE");
  v142 = CFSTR("000000D6-0000-1000-8000-0026BB765291");
  v285 = CFSTR("IS_CONFIGURED");
  v143 = CFSTR("00000126-0000-1000-8000-0026BB765291");
  v286 = CFSTR("BUTTON_EVENT");
  v144 = CFSTR("00000124-0000-1000-8000-0026BB765291");
  v287 = CFSTR("TARGET_LIST");
  v145 = CFSTR("00000123-0000-1000-8000-0026BB765291");
  v288 = CFSTR("SUPPORTED_TARGET_CONFIGURATION");
  v146 = CFSTR("00000128-0000-1000-8000-0026BB765291");
  v289 = CFSTR("SELECT_AUDIO_STREAM_CONFIG");
  v147 = CFSTR("000000E7-0000-1000-8000-0026BB765291");
  v290 = CFSTR("ACTIVE_IDENTIFIER");
  v148 = CFSTR("0000021D-0000-1000-8000-0026BB765291");
  v291 = CFSTR("CAMERA_OPERATING_MODE_INDICATOR");
  v149 = CFSTR("00000223-0000-1000-8000-0026BB765291");
  v292 = CFSTR("EVENT_SNAPSHOTS_ACTIVE");
  v150 = CFSTR("00000226-0000-1000-8000-0026BB765291");
  v293 = CFSTR("RECORDING_AUDIO_ACTIVE");
  v151 = CFSTR("000000DB-0000-1000-8000-0026BB765291");
  v294 = CFSTR("INPUT_SOURCE_TYPE");
  v152 = CFSTR("000000DC-0000-1000-8000-0026BB765291");
  v295 = CFSTR("INPUT_DEVICE_TYPE");
  v153 = CFSTR("000000DD-0000-1000-8000-0026BB765291");
  v296 = CFSTR("CLOSED_CAPTIONS");
  v154 = CFSTR("000000E8-0000-1000-8000-0026BB765291");
  v297 = CFSTR("SLEEP_DISCOVERY_MODE");
  v155 = CFSTR("000000E0-0000-1000-8000-0026BB765291");
  v298 = CFSTR("CURRENT_MEDIA_STATE");
  v156 = CFSTR("00000137-0000-1000-8000-0026BB765291");
  v299 = CFSTR("TARGET_MEDIA_STATE");
  v157 = CFSTR("000000E1-0000-1000-8000-0026BB765291");
  v300 = CFSTR("REMOTE_KEY");
  v158 = CFSTR("000000E2-0000-1000-8000-0026BB765291");
  v301 = CFSTR("PICTURE_MODE");
  v159 = CFSTR("000000DF-0000-1000-8000-0026BB765291");
  v302 = CFSTR("POWER_MODE_SELECTION");
  v160 = CFSTR("000000E6-0000-1000-8000-0026BB765291");
  v303 = CFSTR("IDENTIFIER");
  v161 = CFSTR("000000E3-0000-1000-8000-0026BB765291");
  v304 = CFSTR("CONFIGURED_NAME");
  v162 = CFSTR("000000E9-0000-1000-8000-0026BB765291");
  v305 = CFSTR("VOLUME_CONTROL_TYPE");
  v163 = CFSTR("000000EA-0000-1000-8000-0026BB765291");
  v306 = CFSTR("VOLUME_SELECTOR");
  v164 = CFSTR("00000135-0000-1000-8000-0026BB765291");
  v307 = CFSTR("CURRENT_VISIBILITY_STATE");
  v165 = CFSTR("00000134-0000-1000-8000-0026BB765291");
  v308 = CFSTR("TARGET_VISIBILITY_STATE");
  v166 = CFSTR("00000052-0000-1000-8000-0026BB765291");
  v309 = CFSTR("FIRMWARE_VERSION_CHR");
  v167 = CFSTR("00000020-0000-1000-8000-0026BB765291");
  v310 = CFSTR("MANUFACTURER_CHR");
  v168 = CFSTR("00000021-0000-1000-8000-0026BB765291");
  v311 = CFSTR("MODEL_CHR");
  v169 = CFSTR("00000030-0000-1000-8000-0026BB765291");
  v312 = CFSTR("SERIAL_NUMBER_CHR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v31, 143);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)characteristicTypeLocalizationKeyMapping;
  characteristicTypeLocalizationKeyMapping = v2;

  context = (void *)MEMORY[0x1A1AC1AAC]();
  _getAccessoryCategoryTypeMappings();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, &v170, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v4, "hmf_stringForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingString:", CFSTR("_SINGULAR"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "hmf_stringWithSmallestEncoding");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, &v170, 16);
    }
    while (v8);
  }

  v15 = objc_msgSend(v5, "copy");
  v16 = (void *)accessoryCategoryLocalizationSingularKeyMapping;
  accessoryCategoryLocalizationSingularKeyMapping = v15;

  _getAccessoryCategoryTypeMappings();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v17, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, &v170, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v17, "hmf_stringForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingString:", CFSTR("_MULTIPLE"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "hmf_stringWithSmallestEncoding");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, &v170, 16);
    }
    while (v21);
  }

  v28 = objc_msgSend(v18, "copy");
  v29 = (void *)accessoryCategoryLocalizationPluralKeyMapping;
  accessoryCategoryLocalizationPluralKeyMapping = v28;

  objc_autoreleasePoolPop(context);
}

id _getAccessoryCategoryTypeMappings()
{
  void *v0;
  void *v1;
  _QWORD v3[36];
  _QWORD v4[37];

  v4[36] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("61102194-9993-48BF-A1EF-6C7DC50F0C01");
  v3[1] = CFSTR("DD4DE411-8F01-44EE-866A-1F96144DC1B6");
  v4[0] = CFSTR("BRIDGE_CATEGORY");
  v4[1] = CFSTR("DOOR_CATEGORY");
  v3[2] = CFSTR("C25D5FCE-52EC-4599-A815-1192C5F08C7F");
  v3[3] = CFSTR("151CB559-0DF9-40AA-8A67-12AF06C4449D");
  v4[2] = CFSTR("DOOR_LOCK_CATEGORY");
  v4[3] = CFSTR("FAN_CATEGORY");
  v3[4] = CFSTR("604B6E52-2C87-4596-B4C9-D15077C0C07F");
  v3[5] = CFSTR("C9EE63DB-2FF7-4514-826A-2FC2F0D4C9F0");
  v4[4] = CFSTR("GARAGE_DOOR_OPENER_CATEGORY");
  v4[5] = CFSTR("IP_CAMERA_CATEGORY");
  v3[6] = CFSTR("57D56F4D-3302-41F7-AB34-5365AA180E81");
  v3[7] = CFSTR("0FBA259B-05AC-46F2-875F-204ABB6D9FE7");
  v4[6] = CFSTR("LIGHTBULB_CATEGORY");
  v4[7] = CFSTR("OTHER_CATEGORY");
  v3[8] = CFSTR("730F40D4-6D0E-4903-B09E-520A08AFB78C");
  v3[9] = CFSTR("3F9B944B-B8DF-4570-BAF5-CD31A8B321A7");
  v4[8] = CFSTR("OUTLET_CATEGORY");
  v4[9] = CFSTR("PROGRAMMABLE_SWITCH_CATEGORY");
  v3[10] = CFSTR("8E33483E-2102-4BFE-9295-0A187D114188");
  v3[11] = CFSTR("14D8FE28-2998-49E3-AC95-E3969BE2957C");
  v4[10] = CFSTR("RANGE_EXTENDER_CATEGORY");
  v4[11] = CFSTR("SECURITY_SYSTEM_CATEGORY");
  v3[12] = CFSTR("772AFB8E-8D2F-455E-90E5-9852E6C4DD31");
  v3[13] = CFSTR("2F4C3164-8DE4-4A4F-93BA-DD1D5068DF0B");
  v4[12] = CFSTR("SENSOR_CATEGORY");
  v4[13] = CFSTR("SWITCH_CATEGORY");
  v3[14] = CFSTR("79668DCF-89FB-450D-94B5-AEE70B7B09F1");
  v3[15] = CFSTR("957A52E0-BE03-490C-8305-7B20C1CC17BA");
  v4[14] = CFSTR("THERMOSTAT_CATEGORY");
  v4[15] = CFSTR("VIDEO_DOORBELL_CATEGORY");
  v3[16] = CFSTR("1C501511-408E-4C1E-816B-3FC011FFD5B1");
  v3[17] = CFSTR("2FB9EE1F-1C21-4D0B-9383-9B65F64DBF0E");
  v4[16] = CFSTR("WINDOW_CATEGORY");
  v4[17] = CFSTR("WINDOW_COVERING_CATEGORY");
  v3[18] = CFSTR("5510B997-D711-4636-870F-82BB61092B15");
  v3[19] = CFSTR("BF7036FD-93CF-49B5-954F-CD2B760D11DA");
  v4[18] = CFSTR("AIR_PURIFIER_CATEGORY");
  v4[19] = CFSTR("AIR_HEATER_CATEGORY");
  v3[20] = CFSTR("18DDD63A-27F9-4341-B59B-759D3D114586");
  v3[21] = CFSTR("3FEB9075-C9AF-4629-ADBC-A853259C645A");
  v4[20] = CFSTR("AIR_CONDITIONER_CATEGORY");
  v4[21] = CFSTR("AIR_HUMIDIFIER_CATEGORY");
  v3[22] = CFSTR("1E15B639-DC98-41D4-A394-2E4A1D54AA3A");
  v3[23] = CFSTR("C0F5EDC5-4003-464A-9E5D-0DB36677BC35");
  v4[22] = CFSTR("AIR_DEHUMIDIFIER_CATEGORY");
  v4[23] = CFSTR("SPEAKER_CATEGORY");
  v3[24] = CFSTR("94D3FBD5-0A74-4EE4-BE1A-C97E82ADFA33");
  v3[25] = CFSTR("43CE6F7E-F7E8-44B4-80CE-5786F6E6CD47");
  v4[24] = CFSTR("SPRINKLER_CATEGORY");
  v4[25] = CFSTR("FAUCET_CATEGORY");
  v3[26] = CFSTR("39D2A5B4-F9A6-43F6-90E7-0019F0C0E99F");
  v3[27] = CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E");
  v4[26] = CFSTR("SHOWER_HEAD_CATEGORY");
  v4[27] = CFSTR("APPLE_TV_CATEGORY");
  v3[28] = CFSTR("1D8FD40E-7CAE-4AD5-9973-977D18890DE2");
  v3[29] = CFSTR("8BFB739C-1E09-4F7B-ABB8-DD7BADD0E8A9");
  v4[28] = CFSTR("HOMEPOD_CATEGORY");
  v4[29] = CFSTR("AIRPORT_CATEGORY");
  v3[30] = CFSTR("770ADB51-8848-491A-BFA3-C34EA096CC92");
  v3[31] = CFSTR("830C0952-7CD8-44FB-B0C0-DA4EDB0F32A9");
  v4[30] = CFSTR("TARGET_CONTROLLER_CATEGORY");
  v4[31] = CFSTR("TELEVISION_CATEGORY");
  v3[32] = CFSTR("337635B4-552A-48AD-A38D-DD2D5E826C9A");
  localizedWiFiStringKey(CFSTR("ROUTER_CATEGORY"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[32] = v0;
  v4[33] = CFSTR("AUDIO_RECEIVER_CATEGORY");
  v3[33] = CFSTR("BE15659C-3CE6-4FD0-B152-BCDB488446C6");
  v3[34] = CFSTR("FB953A08-6CDD-44E0-B011-CFAC559A3CFB");
  v3[35] = CFSTR("B0C866C4-3E25-4F6A-8476-A8A3B579A86E");
  v4[34] = CFSTR("TELEVISION_SET_TOP_BOX_CATEGORY");
  v4[35] = CFSTR("TELEVISION_STREAMING_STICK_CATEGORY");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 36);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id localizedWiFiStringKey(void *a1)
{
  id v1;
  int v2;
  const __CFString *v3;
  void *v4;

  v1 = a1;
  v2 = MGGetBoolAnswer();
  v3 = CFSTR("WIFI");
  if (v2)
    v3 = CFSTR("WLAN");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_19B1CF568(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D05D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D09E8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id localizationKeyForCharacteristicType(void *a1)
{
  if (a1)
  {
    objc_msgSend((id)characteristicTypeLocalizationKeyMapping, "objectForKeyedSubscript:", a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id localizationKeyForServiceType(void *a1)
{
  if (a1)
  {
    objc_msgSend((id)serviceTypeLocalizationKeyMapping, "objectForKeyedSubscript:", a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void sub_19B1D266C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D26DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMHomeAddWalletKeyErrorCodeAsString(unint64_t a1)
{
  if (a1 < 9)
    return off_1E3AB4C98[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown add wallet key error code: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19B1D5AB4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend(v1, "count"))
    _HMFPreconditionFailure();
  HMCacheSubdirectoryWithRelativePath(CFSTR("com.apple.HomeKit"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isWritableFileAtPath:", v4);

  if (!v5)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 0, 0, &v42);
  v8 = v42;

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v10 = objc_msgSend(v8, "code");

      if (v10 == 516)
        goto LABEL_6;
    }
    else
    {

    }
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v35;
      v45 = 2112;
      v46 = v2;
      v47 = 2112;
      v48 = (uint64_t)v8;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HomeKit cache directory %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v33);

    v25 = 0;
    v16 = CFSTR("com.apple.HomeKit");
    goto LABEL_25;
  }
LABEL_6:

LABEL_7:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = v1;
  v11 = v1;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    v15 = *MEMORY[0x1E0CB28A8];
    v16 = CFSTR("com.apple.HomeKit");
    while (2)
    {
      v17 = 0;
      v18 = v2;
      v19 = v16;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        -[__CFString stringByAppendingPathComponent:](v19, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v17), v36);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        HMCacheSubdirectoryWithRelativePath(v16);
        v2 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v21 = objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 0, 0, &v37);
        v22 = v37;

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v22, "domain");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "isEqualToString:", v15) & 1) == 0)
          {

LABEL_21:
            v26 = (void *)MEMORY[0x1A1AC1AAC]();
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v22, "code");
              objc_msgSend(v22, "userInfo");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v44 = v28;
              v45 = 2112;
              v46 = v2;
              v47 = 2048;
              v48 = v29;
              v49 = 2112;
              v50 = v31;
              _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HomeKit cache subdirectory %@: %ld, %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v26);

            v25 = 0;
            goto LABEL_24;
          }
          v24 = objc_msgSend(v22, "code");

          if (v24 != 516)
            goto LABEL_21;
        }

        ++v17;
        v18 = v2;
        v19 = v16;
      }
      while (v13 != v17);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v16 = CFSTR("com.apple.HomeKit");
  }

  v2 = v2;
  v25 = v2;
LABEL_24:
  v1 = v36;
LABEL_25:

  return v25;
}

id HMCacheSubdirectoryWithRelativePath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        buf[0] = 0;
        objc_msgSend(v9, "path", (_QWORD)v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, buf);
        v14 = buf[0];

        if (v13)
          v15 = v14 == 0;
        else
          v15 = 1;
        if (!v15)
        {
          v18 = v4;
          goto LABEL_19;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  if (v16)
  {
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v21;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_FAULT, "%{public}@Failed to determine HomeKit cache directory; falling back to a temporary directory",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v19);
    NSTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v17;
  objc_msgSend(v17, "stringByAppendingPathComponent:", v1, (_QWORD)v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v11;
}

void sub_19B1D7D10(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t determineFetchConfigurationQoS()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "qualityOfService");

  v2 = 17;
  if (v1 == -1)
    v2 = -1;
  if (v1 == 25)
    return 25;
  else
    return v2;
}

void sub_19B1D8214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  os_unfair_lock_s *v32;
  id *v33;
  id *v34;
  uint64_t v35;

  objc_destroyWeak(location);
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a32);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v35 - 152));
  os_unfair_lock_unlock(v32);
  _Unwind_Resume(a1);
}

void sub_19B1D892C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D89F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D9064(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D90EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D939C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1D9818(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1DACB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19B1DB0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  os_unfair_lock_s *v10;
  id *v11;

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

__CFString *HMHomeManagerStatusToString(unint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (!a1)
  {
    v8 = CFSTR("None");
    return v8;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Busy"));
    if ((a1 & 0x10) == 0)
    {
LABEL_4:
      if ((a1 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a1 & 0x10) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("Needs Device Setup"));
  if ((a1 & 0x20) != 0)
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("No Account"));
LABEL_6:
  v4 = objc_msgSend(v3, "count");
  if (a1 > 0x3F || !v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Unknown (%@)"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v8;
}

__CFString *HMHomeManagerOptionsToString(uint64_t a1)
{
  __int16 v1;
  __CFString *v2;
  void *v3;
  void *v4;

  if (!a1)
  {
    v2 = CFSTR("None");
    return v2;
  }
  v1 = a1;
  if (a1 != -1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((v1 & 1) != 0)
    {
      objc_msgSend(v3, "addObject:", CFSTR("Homes"));
      if ((v1 & 2) == 0)
      {
LABEL_7:
        if ((v1 & 4) == 0)
          goto LABEL_8;
        goto LABEL_24;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v4, "addObject:", CFSTR("Pairing Identities"));
    if ((v1 & 4) == 0)
    {
LABEL_8:
      if ((v1 & 8) == 0)
        goto LABEL_9;
      goto LABEL_25;
    }
LABEL_24:
    objc_msgSend(v4, "addObject:", CFSTR("Rooms"));
    if ((v1 & 8) == 0)
    {
LABEL_9:
      if ((v1 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_26;
    }
LABEL_25:
    objc_msgSend(v4, "addObject:", CFSTR("Users"));
    if ((v1 & 0x10) == 0)
    {
LABEL_10:
      if ((v1 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_27;
    }
LABEL_26:
    objc_msgSend(v4, "addObject:", CFSTR("Current Accessory"));
    if ((v1 & 0x20) == 0)
    {
LABEL_11:
      if ((v1 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_28;
    }
LABEL_27:
    objc_msgSend(v4, "addObject:", CFSTR("Settings"));
    if ((v1 & 0x40) == 0)
    {
LABEL_12:
      if ((v1 & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_29;
    }
LABEL_28:
    objc_msgSend(v4, "addObject:", CFSTR("Apple Media Accessories"));
    if ((v1 & 0x80) == 0)
    {
LABEL_13:
      if ((v1 & 0x100) == 0)
        goto LABEL_14;
      goto LABEL_30;
    }
LABEL_29:
    objc_msgSend(v4, "addObject:", CFSTR("Media Systems"));
    if ((v1 & 0x100) == 0)
    {
LABEL_14:
      if ((v1 & 0x200) == 0)
        goto LABEL_15;
      goto LABEL_31;
    }
LABEL_30:
    objc_msgSend(v4, "addObject:", CFSTR("AirPlay Accessories"));
    if ((v1 & 0x200) == 0)
    {
LABEL_15:
      if ((v1 & 0x400) == 0)
        goto LABEL_16;
      goto LABEL_32;
    }
LABEL_31:
    objc_msgSend(v4, "addObject:", CFSTR("HAP Accessories"));
    if ((v1 & 0x400) == 0)
    {
LABEL_16:
      if ((v1 & 0x800) == 0)
        goto LABEL_17;
      goto LABEL_33;
    }
LABEL_32:
    objc_msgSend(v4, "addObject:", CFSTR("Television Accessories"));
    if ((v1 & 0x800) == 0)
    {
LABEL_17:
      if ((v1 & 0x1000) == 0)
        goto LABEL_18;
      goto LABEL_34;
    }
LABEL_33:
    objc_msgSend(v4, "addObject:", CFSTR("Devices"));
    if ((v1 & 0x1000) == 0)
    {
LABEL_18:
      if ((v1 & 0x8000) == 0)
      {
LABEL_20:
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        return v2;
      }
LABEL_19:
      objc_msgSend(v4, "addObject:", CFSTR("Siri Endpoint Accessories"));
      goto LABEL_20;
    }
LABEL_34:
    objc_msgSend(v4, "addObject:", CFSTR("Wi-Fi Router Accessories"));
    if ((v1 & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  v2 = CFSTR("All");
  return v2;
}

__CFString *HMXPCClientEntitlementsShortDescription(unint64_t a1)
{
  void *v2;
  uint64_t i;
  const __CFString *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 64);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    for (i = 1; i - 1 < a1; i *= 2)
    {
      if ((i & a1) != 0)
      {
        if (i > 4095)
        {
          if (i < 0x20000)
          {
            if (i < 0x4000)
            {
              if (i == 4096)
              {
                v4 = CFSTR("MSG");
                goto LABEL_52;
              }
              if (i == 0x2000)
              {
                v4 = CFSTR("PM");
                goto LABEL_52;
              }
            }
            else
            {
              switch(i)
              {
                case 0x4000:
                  v4 = CFSTR("ASA");
                  goto LABEL_52;
                case 0x8000:
                  v4 = CFSTR("DIA");
                  goto LABEL_52;
                case 0x10000:
                  v4 = CFSTR("SD");
                  goto LABEL_52;
              }
            }
          }
          else if (i >= 0x100000)
          {
            switch(i)
            {
              case 0x100000:
                v4 = CFSTR("LCF");
                goto LABEL_52;
              case 0x200000:
                v4 = CFSTR("MSP");
                goto LABEL_52;
              case 0x400000:
                v4 = CFSTR("HMMM");
                goto LABEL_52;
            }
          }
          else
          {
            switch(i)
            {
              case 0x20000:
                v4 = CFSTR("WK");
                goto LABEL_52;
              case 0x40000:
                v4 = CFSTR("AI");
                goto LABEL_52;
              case 0x80000:
                v4 = CFSTR("HML");
LABEL_52:
                objc_msgSend(v2, "addObject:", v4);
                break;
            }
          }
        }
        else
        {
          if (i <= 63)
          {
            v4 = CFSTR("API");
            switch(i)
            {
              case 1:
                goto LABEL_52;
              case 2:
                v4 = CFSTR("BG");
                goto LABEL_52;
              case 3:
              case 5:
              case 6:
              case 7:
                continue;
              case 4:
                v4 = CFSTR("SPI");
                goto LABEL_52;
              case 8:
                v4 = CFSTR("PI");
                goto LABEL_52;
              default:
                if (i == 16)
                {
                  v4 = CFSTR("PIP");
                }
                else
                {
                  if (i != 32)
                    continue;
                  v4 = CFSTR("RLP");
                }
                break;
            }
            goto LABEL_52;
          }
          if (i > 511)
          {
            switch(i)
            {
              case 512:
                v4 = CFSTR("MUS");
                goto LABEL_52;
              case 1024:
                v4 = CFSTR("LOC");
                goto LABEL_52;
              case 2048:
                v4 = CFSTR("SA");
                goto LABEL_52;
            }
          }
          else
          {
            switch(i)
            {
              case 64:
                v4 = CFSTR("SP");
                goto LABEL_52;
              case 128:
                v4 = CFSTR("CC");
                goto LABEL_52;
              case 256:
                v4 = CFSTR("CI");
                goto LABEL_52;
            }
          }
        }
      }
    }
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(","));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("None");
  }

  return v5;
}

__CFString *HMHomeManagerDataSyncStateToString(unint64_t a1)
{
  if (a1 < 7)
    return off_1E3AB2568[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown value: %lu>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19B1DD1EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMPrivacyGetAuthorizationStatusForHomeKit()
{
  void *v0;
  int v1;
  uint64_t v2;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("HMPrivacyGetAuthorizationStatusForHomeKit"));
  v1 = TCCAccessPreflight();
  if (v1)
    v2 = v1 == 1;
  else
    v2 = 5;
  objc_msgSend(v0, "invalidate");

  return v2;
}

id HMDispatchQueueNameString(void *a1, void *a2)
{
  void *v3;
  __CFString *v4;
  id v5;
  objc_class *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = CFSTR(".");
  else
    v8 = &stru_1E3AB7688;
  if (v4)
    v9 = v4;
  else
    v9 = &stru_1E3AB7688;
  v10 = objc_msgSend(v5, "hash");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.HomeKit.%@%@%@.%tu"), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_19B1E04A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
  _Unwind_Resume(a1);
}

void sub_19B1E057C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
  _Unwind_Resume(a1);
}

id HMCreateConfigurationsCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  HMClientScopedHomeKitCacheDirectoryName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = CFSTR("com.apple.HomeKit.configurations");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HMCreateFrameworkCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  HMClientScopedHomeKitCacheDirectoryName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = CFSTR("com.apple.HomeKit.HMCache");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HMClientScopedHomeKitCacheDirectoryName()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D28688], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "applicationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    objc_msgSend(v0, "name");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v0, "identifier"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringValue");
      v1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v1;
}

BOOL HMIsHAPMetadataNeededForHMHomeManagerOptions(__int16 a1)
{
  return (a1 & 0x9701) != 0;
}

BOOL HMAreSnapshotsAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

void __sharedIdentifierSaltStore_block_invoke()
{
  HMIdentifierSaltStore *v0;
  void *v1;

  v0 = objc_alloc_init(HMIdentifierSaltStore);
  v1 = (void *)sharedIdentifierSaltStore_identifierSaltStore;
  sharedIdentifierSaltStore_identifierSaltStore = (uint64_t)v0;

}

__CFString *HMHomeWalletKeyColorAsString(uint64_t a1)
{
  __CFString *v1;

  if (a1 > 14935010)
  {
    if (a1 == 15521450)
      return CFSTR("PolishedBrass");
    if (a1 == 14935011)
      return CFSTR("SatinChrome");
    goto LABEL_10;
  }
  if (!a1)
    return CFSTR("MatteBlack");
  if (a1 != 14341582)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown wallet key color: %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("SatinNickel");
  return v1;
}

void sub_19B1E463C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1E4800(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1E48B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1E5D34(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __allowedCharValueTypes_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedCharValueTypes_charValueTypes;
  allowedCharValueTypes_charValueTypes = v2;

}

uint64_t HMUserActionPredictionDuetPredictionStoreReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t result;
  HMUserActionPredictionDuetPredictionValue *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3))
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        v18 = objc_alloc_init(HMUserActionPredictionDuetPredictionValue);
        objc_msgSend(a1, "addPrediction:", v18);
        if (!PBReaderPlaceMark()
          || (HMUserActionPredictionDuetPredictionValueReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id encodeRootObject(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", v1, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v3, "finishEncoding");
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

BOOL areHomesConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kHomesConfigured"), CFSTR("com.apple.homed"), 0) != 0;
}

id __HMHomeManagerConfigurationCreateCopy(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;

  v4 = a1;
  if (v4)
  {
    v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithOptions:cachePolicy:", *((_QWORD *)v4 + 2), *((_QWORD *)v4 + 1));
    *(_BYTE *)(v5 + 24) = *((_BYTE *)v4 + 24);
    *(_BYTE *)(v5 + 25) = *((_BYTE *)v4 + 25);
    objc_storeStrong((id *)(v5 + 32), *((id *)v4 + 4));
    objc_storeStrong((id *)(v5 + 40), *((id *)v4 + 5));
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

void sub_19B1E6D00(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMMediaSourceDisplayOrderProfile.canModifyOrder.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_canModifyOrder);
}

uint64_t sub_19B1E6E60()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile), sel_mediaSourceDisplayOrder);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return v2;
  v3 = v1;
  sub_19B1E6FEC();
  v4 = sub_19B42907C();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  v5 = sub_19B4291E4();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_14;
LABEL_4:
  result = sub_19B1E78A4(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x1A1AC1260](i, v4);
      else
        v8 = *(id *)(v4 + 8 * i + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_integerValue);

      v12 = *(_QWORD *)(v2 + 16);
      v11 = *(_QWORD *)(v2 + 24);
      if (v12 >= v11 >> 1)
        sub_19B1E78A4(v11 > 1, v12 + 1, 1);
      *(_QWORD *)(v2 + 16) = v12 + 1;
      *(_QWORD *)(v2 + 8 * v12 + 32) = v10;
    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

unint64_t sub_19B1E6FEC()
{
  unint64_t result;

  result = qword_1EE3EF3A0;
  if (!qword_1EE3EF3A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE3EF3A0);
  }
  return result;
}

uint64_t sub_19B1E7028@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  result = MEMORY[0x1A1AC20AC](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_19B1E7080(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_19B1E70E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  return MEMORY[0x1A1AC20AC](v1);
}

uint64_t sub_19B1E712C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_19B1E7194(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1A1AC20AC](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_19B1E7208;
}

void sub_19B1E7208(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_19B1E727C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return swift_task_switch();
}

uint64_t sub_19B1E7294()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[15];
  v2 = *(void **)(v0[16] + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile);
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    sub_19B42919C();
    v4 = (uint64_t *)(v1 + 32);
    do
    {
      v5 = *v4++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v5);
      sub_19B429184();
      sub_19B4291A8();
      sub_19B4291B4();
      sub_19B429190();
      --v3;
    }
    while (v3);
  }
  sub_19B1E6FEC();
  v6 = sub_19B429070();
  v0[17] = v6;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_19B1E73FC;
  v7 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v8 = v0 + 10;
  v8[1] = 0x40000000;
  v8[2] = sub_19B1E74D0;
  v8[3] = &block_descriptor;
  v8[4] = v7;
  objc_msgSend(v2, sel_updateMediaSourceDisplayOrder_completionHandler_, v6, v8);
  return swift_continuation_await();
}

uint64_t sub_19B1E73FC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_19B1E745C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B1E7490()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B1E74D0(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF4D0);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

void sub_19B1E759C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v3 = MEMORY[0x1A1AC20AC](v1+ OBJC_IVAR____TtCC7HomeKit32HMMediaSourceDisplayOrderProfileP33_9553D125375AA03A444888892644919534HMTelevisionProfileDelegateAdaptor_displayOrderProfile);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(a1, sel_context);
    v6 = objc_msgSend(v5, sel_delegateCaller);

    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v4;
    v10[4] = sub_19B1E7A64;
    v10[5] = v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 1107296256;
    v10[2] = sub_19B1E772C;
    v10[3] = &block_descriptor_4;
    v8 = _Block_copy(v10);
    v9 = v4;
    swift_release();
    objc_msgSend(v6, sel_invokeBlock_, v8);
    _Block_release(v8);

  }
}

uint64_t sub_19B1E76AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t ObjectType;

  v2 = a1 + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;
  swift_beginAccess();
  result = MEMORY[0x1A1AC20AC](v2);
  if (result)
  {
    v4 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_19B1E772C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_19B1E77D8()
{
  return sub_19B1E782C(0, type metadata accessor for HMMediaSourceDisplayOrderProfile.HMTelevisionProfileDelegateAdaptor);
}

id HMMediaSourceDisplayOrderProfile.__deallocating_deinit(uint64_t a1)
{
  return sub_19B1E782C(a1, type metadata accessor for HMMediaSourceDisplayOrderProfile);
}

id sub_19B1E782C(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_19B1E78A4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_19B1E7B6C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t type metadata accessor for HMMediaSourceDisplayOrderProfile()
{
  return objc_opt_self();
}

uint64_t method lookup function for HMMediaSourceDisplayOrderProfile()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.order.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.writeOrder(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x90);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B1E79D0;
  return v7(a1);
}

uint64_t sub_19B1E79D0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of HMMediaSourceDisplayOrderProfile.Delegate.mediaSourceDisplayOrderProfileDidUpdateOrder(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for HMMediaSourceDisplayOrderProfile.HMTelevisionProfileDelegateAdaptor()
{
  return objc_opt_self();
}

uint64_t sub_19B1E7A40()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_19B1E7A64()
{
  uint64_t v0;

  return sub_19B1E76AC(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_19B1E7A84(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_19B1E7CC8(a1, a2, a3, (_QWORD *)*v3, &qword_1EE3EF4C0, &qword_1EE3EF4C8);
  *v3 = result;
  return result;
}

uint64_t sub_19B1E7AB0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_19B1E7CC8(a1, a2, a3, (_QWORD *)*v3, &qword_1EE3EF4B0, &qword_1EE3EF4B8);
  *v3 = result;
  return result;
}

uint64_t sub_19B1E7ADC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_19B1E7E54(a1, a2, a3, *v3, &qword_1EE3EF4A8);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_19B1E7B08(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_19B1E7E54(a1, a2, a3, *v3, &qword_1EE3EF4A0);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_19B1E7B34(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_19B1E7FC0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_19B1E7B50(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_19B1E8124(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_19B1E7B6C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF4D8);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_19B429214();
  __break(1u);
  return result;
}

uint64_t sub_19B1E7CC8(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 17;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 4);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v16 = (unint64_t)(v13 + 4);
  v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v16 >= v17 + 16 * v11)
      memmove(v13 + 4, a4 + 4, 16 * v11);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 16 * v11 || v16 >= v17 + 16 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  result = sub_19B429214();
  __break(1u);
  return result;
}

uint64_t sub_19B1E7E54(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9])
      memmove(v14, v15, 16 * v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v9] || v14 >= &v15[16 * v9])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  result = sub_19B429214();
  __break(1u);
  return result;
}

uint64_t sub_19B1E7FC0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  size_t v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF498);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = 32 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_19B429214();
  __break(1u);
  return result;
}

uint64_t sub_19B1E8124(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF488);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF490);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_19B429214();
  __break(1u);
  return result;
}

char *sub_19B1E82C4(void *a1)
{
  char *v1;
  char *v3;
  id v4;
  unsigned __int8 v5;
  objc_class *v6;
  char *v7;
  id v8;
  char *v9;
  char *v10;
  objc_super v12;
  objc_super v13;

  *(_QWORD *)&v1[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile] = a1;
  v3 = v1;
  v4 = a1;
  v5 = objc_msgSend(v4, sel_mediaSourceDisplayOrderModifiable);
  v3[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_canModifyOrder] = v5;
  v6 = (objc_class *)type metadata accessor for HMMediaSourceDisplayOrderProfile.HMTelevisionProfileDelegateAdaptor();
  v7 = (char *)objc_allocWithZone(v6);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v7[OBJC_IVAR____TtCC7HomeKit32HMMediaSourceDisplayOrderProfileP33_9553D125375AA03A444888892644919534HMTelevisionProfileDelegateAdaptor_televisionProfile] = v4;
  v13.receiver = v7;
  v13.super_class = v6;
  v8 = v4;
  v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend(*(id *)&v9[OBJC_IVAR____TtCC7HomeKit32HMMediaSourceDisplayOrderProfileP33_9553D125375AA03A444888892644919534HMTelevisionProfileDelegateAdaptor_televisionProfile], sel_setDelegate_, v9);
  *(_QWORD *)&v3[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_displayOrderProfileDelegateAdaptor] = v9;

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for HMMediaSourceDisplayOrderProfile();
  v10 = (char *)objc_msgSendSuper2(&v12, sel_initWithAccessoryProfile_, v8);
  if (*(_QWORD *)&v10[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_displayOrderProfileDelegateAdaptor])
    swift_unknownObjectWeakAssign();
  return v10;
}

void sub_19B1E8404()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  sub_19B429154();
  swift_bridgeObjectRelease();
  sub_19B4291D8();
  __break(1u);
}

uint64_t sub_19B1E8498(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A1AC1FB0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EE3EF4E0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EE3EF4E0);
  }
}

uint64_t AccessoryInfoFetchSettingItem.keyPath.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccessoryInfoFetchSettingItem.__allocating_init(keyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t AccessoryInfoFetchSettingItem.init(keyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t sub_19B1E85C8()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v0 = (void *)sub_19B428F80();
  v1 = (void *)sub_19B428F80();
  v2 = (void *)sub_19B429004();
  v3 = (id)HMImmutableSettingChangeEventTopicFromComponents(v0, v1, v2);

  v4 = sub_19B429010();
  return v4;
}

void AccessoryInfoFetchSettingItem.__allocating_init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AccessoryInfoFetchSettingItem.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_19B1E86B0()
{
  return swift_bridgeObjectRelease();
}

uint64_t AccessoryInfoFetchSettingItem.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AccessoryInfoFetchSettingItem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AccessoryInfoFetchSettingItem()
{
  return objc_opt_self();
}

uint64_t method lookup function for AccessoryInfoFetchSettingItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessoryInfoFetchSettingItem.__allocating_init(keyPath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

id sub_19B1E872C(uint64_t a1)
{
  void *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  sub_19B429010();
  v3 = v1;
  sub_19B428FB0();
  *(_QWORD *)&v3[OBJC_IVAR___HMAccessoryInfoFetchController_dataSource + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher] = 0;
  v4 = OBJC_IVAR___HMAccessoryInfoFetchController_accessoryFetchHistory;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF658);
  v5 = swift_allocObject();
  v6 = MEMORY[0x1E0DEE9E0];
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = v6;
  *(_QWORD *)&v3[v4] = v5;
  *(_QWORD *)&v3[OBJC_IVAR___HMAccessoryInfoFetchController_minimumFetchThrottleSeconds] = 0x403E000000000000;
  v7 = &v3[OBJC_IVAR___HMAccessoryInfoFetchController_homeUUID];
  v8 = sub_19B428F98();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for AccessoryInfoFetchController();
  v10 = objc_msgSendSuper2(&v12, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v10;
}

uint64_t sub_19B1E8884(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_19B1E889C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t (*v12)(void);
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v1 = v0;
  v0[2] = MEMORY[0x1E0DEE9D8];
  v2 = (_QWORD **)(v0 + 2);
  v3 = v0[4] + OBJC_IVAR___HMAccessoryInfoFetchController_dataSource;
  v4 = MEMORY[0x1A1AC20AC](v3);
  v0[5] = v4;
  v5 = v0[4];
  if (!v4)
  {
    v9 = sub_19B428FA4();
    v10 = sub_19B4290E8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19B1B0000, v9, v10, "Nil data source", v11, 2u);
      MEMORY[0x1A1AC2040](v11, -1, -1);
    }

    objc_msgSend((id)objc_opt_self(), sel_hmErrorWithCode_, 21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  v6 = v4;
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(_QWORD *)(v5 + OBJC_IVAR___HMAccessoryInfoFetchController_accessoryFetchHistory);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  sub_19B1E9E50((uint64_t *)(v8 + 16), v5, v6, v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
  v14 = v1[3];
  swift_release();
  if (v14 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    v23 = sub_19B4291E4();
    v16 = v1[3];
    v31 = v23;
    if (v23)
      goto LABEL_9;
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = swift_bridgeObjectRetain();
    v31 = v15;
    if (v15)
    {
LABEL_9:
      v17 = v6;
      v6 = v7;
      v18 = 0;
      v19 = v14 & 0xC000000000000001;
      v30 = v16 + 32;
      while (1)
      {
        if (v19)
        {
          v14 = MEMORY[0x1A1AC1260](v18, v1[3]);
          v20 = v18 + 1;
          if (__OFADD__(v18, 1))
            goto LABEL_17;
        }
        else
        {
          v14 = *(_QWORD *)(v30 + 8 * v18);
          swift_retain();
          v20 = v18 + 1;
          if (__OFADD__(v18, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
        }
        v7 = (uint64_t)v1;
        v21 = v1[4];
        v32 = v14;
        sub_19B1E8DA0((uint64_t *)&v32, v17, v6, v21, v2);
        swift_release();
        ++v18;
        if (v20 == v31)
        {
          swift_bridgeObjectRelease();
          v22 = v1[2];
          goto LABEL_20;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  v22 = MEMORY[0x1E0DEE9D8];
LABEL_20:
  v24 = v1[4];
  if (!*(_QWORD *)(v22 + 16))
  {
    v27 = sub_19B428FA4();
    v28 = sub_19B4290D0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_19B1B0000, v27, v28, "Nothing left to fetch", v29, 2u);
      MEMORY[0x1A1AC2040](v29, -1, -1);
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    v12 = (uint64_t (*)(void))v1[1];
    return v12();
  }
  v25 = swift_task_alloc();
  v1[6] = v25;
  *(_QWORD *)(v25 + 16) = v24;
  *(_QWORD *)(v25 + 24) = v2;
  v26 = (_QWORD *)swift_task_alloc();
  v1[7] = v26;
  *v26 = v1;
  v26[1] = sub_19B1E8CB4;
  return sub_19B42928C();
}

uint64_t sub_19B1E8CB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B1E8D20()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B1E8D5C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B1E8DA0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD **a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (**v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t ObjectType;
  void (*v27)(uint64_t, uint64_t);
  int v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(os_unfair_lock_t, char *, uint64_t);
  unint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  os_unfair_lock_t v47;
  char *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void (*v56)(os_unfair_lock_t, char *, uint64_t);
  uint8_t *v57;
  void (*v58)(os_unfair_lock_t, char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v65;
  char *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint8_t *v74;
  uint64_t result;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v89;
  unint64_t v90;
  _QWORD v91[2];
  uint64_t v92;
  uint64_t v93;
  os_unfair_lock_t v94;
  uint64_t v95;
  os_unfair_lock_s *v96;
  uint64_t v97;
  void (*v98)(os_unfair_lock_t, char *, uint64_t);
  uint64_t v99;
  _QWORD **v100;
  char *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;

  v100 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF680);
  v9 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v98 = (void (*)(os_unfair_lock_t, char *, uint64_t))((char *)v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v9);
  v103 = (char *)v91 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF688);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_19B428F98();
  v16 = *(uint64_t (***)(char *, uint64_t, uint64_t))(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v94 = (os_unfair_lock_t)((char *)v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = MEMORY[0x1E0C80A78](v17);
  v102 = (char *)v91 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v96 = (os_unfair_lock_s *)((char *)v91 - v22);
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)v91 - v23;
  v25 = *a1;
  ObjectType = swift_getObjectType();
  v27 = *(void (**)(uint64_t, uint64_t))(a3 + 8);
  v97 = a2;
  v95 = ObjectType;
  v27(a4, v25 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier);
  v28 = v16[6](v14, 1, v15);
  v99 = v15;
  if (v28 == 1)
  {
    sub_19B1EAC88((uint64_t)v14, &qword_1EE3EF688);
    swift_retain_n();
    v29 = sub_19B428FA4();
    v30 = sub_19B4290E8();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v105 = v32;
      *(_DWORD *)v31 = 136315138;
      sub_19B1EB344(&qword_1EE3EF690, MEMORY[0x1E0CB09F0]);
      v33 = sub_19B429274();
      v104 = sub_19B1F1054(v33, v34, &v105);
      sub_19B429100();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_19B1B0000, v29, v30, "Accessory %s not found in home", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A1AC2040](v32, -1, -1);
      MEMORY[0x1A1AC2040](v31, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    objc_msgSend((id)objc_opt_self(), sel_hmErrorWithCode_, 2);
    return swift_willThrow();
  }
  v92 = v25;
  v16[4](v24, (uint64_t)v14, v15);
  v93 = a4;
  v35 = *(_QWORD *)(a4 + OBJC_IVAR___HMAccessoryInfoFetchController_accessoryFetchHistory);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v35 + 24));
  v36 = *(_QWORD *)(v35 + 16);
  v91[1] = v35 + 16;
  v37 = *(_QWORD *)(v36 + 16);
  v101 = v24;
  v38 = (void (**)(os_unfair_lock_t, char *, uint64_t))v16;
  if (v37 && (v39 = sub_19B1F1694((uint64_t)v24), (v40 & 1) != 0))
  {
    v41 = v39;
    v42 = *(_QWORD *)(v36 + 56);
    v43 = sub_19B428F74();
    v44 = *(_QWORD *)(v43 - 8);
    v45 = v42 + *(_QWORD *)(v44 + 72) * v41;
    v46 = (uint64_t)v103;
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v103, v45, v43);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v44 + 56))(v46, 0, 1, v43);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v46, 1, v43) != 1)
    {
      sub_19B1EAC88(v46, &qword_1EE3EF680);
      os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 24));
      swift_release();
      v47 = v94;
      v48 = v101;
      v49 = v99;
      v38[2](v94, v101, v99);
      v50 = sub_19B428FA4();
      v51 = sub_19B4290D0();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        v53 = swift_slowAlloc();
        v105 = v53;
        *(_DWORD *)v52 = 136315138;
        sub_19B1EB344(&qword_1EE3EF690, MEMORY[0x1E0CB09F0]);
        v54 = sub_19B429274();
        v104 = sub_19B1F1054(v54, v55, &v105);
        v49 = v99;
        sub_19B429100();
        swift_bridgeObjectRelease();
        v56 = v38[1];
        ((void (*)(os_unfair_lock_t, uint64_t))v56)(v47, v49);
        _os_log_impl(&dword_19B1B0000, v50, v51, "%s will not be queried due to fetch throttle", v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A1AC2040](v53, -1, -1);
        v57 = v52;
        v48 = v101;
        MEMORY[0x1A1AC2040](v57, -1, -1);

      }
      else
      {

        v56 = v38[1];
        ((void (*)(os_unfair_lock_t, uint64_t))v56)(v47, v49);
      }
      return ((uint64_t (*)(char *, uint64_t))v56)(v48, v49);
    }
  }
  else
  {
    v43 = sub_19B428F74();
    v46 = (uint64_t)v103;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v103, 1, 1, v43);
  }
  sub_19B1EAC88(v46, &qword_1EE3EF680);
  v58 = v38[2];
  v94 = (os_unfair_lock_t)(v35 + 24);
  v59 = (uint64_t)v96;
  v48 = v101;
  v103 = (char *)v38;
  v60 = v99;
  v58(v96, v101, v99);
  v61 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
  v91[0] = v35;
  v62 = (uint64_t)v98;
  v63 = v93;
  v61(v93, v95);
  sub_19B428F74();
  v64 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
  v65 = v43;
  v49 = v60;
  v64(v62, 0, 1, v65);
  sub_19B1E9750(v62, v59);
  os_unfair_lock_unlock(v94);
  swift_release();
  v66 = v102;
  v58((os_unfair_lock_t)v102, v48, v49);
  v67 = sub_19B428FA4();
  v68 = sub_19B4290D0();
  if (os_log_type_enabled(v67, v68))
  {
    v69 = (uint8_t *)swift_slowAlloc();
    v70 = swift_slowAlloc();
    v105 = v70;
    *(_DWORD *)v69 = 136315138;
    sub_19B1EB344(&qword_1EE3EF690, MEMORY[0x1E0CB09F0]);
    v71 = sub_19B429274();
    v104 = sub_19B1F1054(v71, v72, &v105);
    sub_19B429100();
    swift_bridgeObjectRelease();
    v56 = (void (*)(os_unfair_lock_t, char *, uint64_t))*((_QWORD *)v103 + 1);
    ((void (*)(char *, uint64_t))v56)(v66, v99);
    _os_log_impl(&dword_19B1B0000, v67, v68, "%s will be queried", v69, 0xCu);
    swift_arrayDestroy();
    v73 = v70;
    v49 = v99;
    MEMORY[0x1A1AC2040](v73, -1, -1);
    v74 = v69;
    v48 = v101;
    MEMORY[0x1A1AC2040](v74, -1, -1);

  }
  else
  {

    v56 = (void (*)(os_unfair_lock_t, char *, uint64_t))*((_QWORD *)v103 + 1);
    ((void (*)(char *, uint64_t))v56)(v66, v49);
  }
  v76 = *(_QWORD *)(v92 + 16);
  if (!(v76 >> 62))
  {
    v77 = *(_QWORD *)((v76 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v77)
      goto LABEL_17;
LABEL_32:
    swift_bridgeObjectRelease_n();
    return ((uint64_t (*)(char *, uint64_t))v56)(v48, v49);
  }
  swift_bridgeObjectRetain_n();
  result = sub_19B4291E4();
  v77 = result;
  if (!result)
    goto LABEL_32;
LABEL_17:
  if (v77 < 1)
  {
    __break(1u);
  }
  else
  {
    v98 = v56;
    v78 = 0;
    v103 = (char *)(v63 + OBJC_IVAR___HMAccessoryInfoFetchController_homeUUID);
    v102 = (char *)(v76 & 0xC000000000000001);
    do
    {
      if (v102)
      {
        v80 = MEMORY[0x1A1AC1260](v78, v76);
      }
      else
      {
        v80 = *(_QWORD *)(v76 + 8 * v78 + 32);
        swift_retain();
      }
      v81 = (*(uint64_t (**)(char *, char *))(*(_QWORD *)v80 + 88))(v48, v103);
      if (v82)
      {
        v83 = v81;
        v84 = v82;
        v85 = v76;
        v86 = v100;
        v87 = *v100;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v86 = v87;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v87 = sub_19B1F0C0C(0, v87[2] + 1, 1, v87);
          *v100 = v87;
        }
        v90 = v87[2];
        v89 = v87[3];
        if (v90 >= v89 >> 1)
        {
          v87 = sub_19B1F0C0C((_QWORD *)(v89 > 1), v90 + 1, 1, v87);
          *v100 = v87;
        }
        v87[2] = v90 + 1;
        v79 = &v87[2 * v90];
        v79[4] = v83;
        v79[5] = v84;
        v48 = v101;
        v76 = v85;
      }
      swift_release();
      ++v78;
    }
    while (v77 != v78);
    swift_bridgeObjectRelease_n();
    return ((uint64_t (*)(char *, uint64_t))v98)(v48, v99);
  }
  return result;
}

uint64_t sub_19B1E9750(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF680);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_19B428F74();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) == 1)
  {
    sub_19B1EAC88(a1, &qword_1EE3EF680);
    sub_19B1EACC4(a2, v7);
    v12 = sub_19B428F98();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a2, v12);
    return sub_19B1EAC88((uint64_t)v7, &qword_1EE3EF680);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v11, a1, v8);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v17 = *v3;
    *v3 = 0x8000000000000000;
    sub_19B1EB104((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v17;
    swift_bridgeObjectRelease();
    v15 = sub_19B428F98();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a2, v15);
  }
}

void sub_19B1E98DC(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  __CFString *v10;
  void *v11;
  id v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  _QWORD aBlock[6];

  v27 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF660);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_allocWithZone(MEMORY[0x1E0D285D8]);
  v10 = CFSTR("HMAccessoryInfoFetchMessageName");
  v11 = (void *)sub_19B428F80();
  v12 = objc_msgSend(v9, sel_initWithTarget_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF668);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19B44BBA0;
  *(_QWORD *)(inited + 32) = sub_19B429010();
  *(_QWORD *)(inited + 40) = v14;
  v15 = *a3;
  *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF670);
  *(_QWORD *)(inited + 48) = v15;
  swift_bridgeObjectRetain();
  sub_19B1EC014(inited);
  v16 = objc_allocWithZone(MEMORY[0x1E0D285F8]);
  v17 = (void *)sub_19B428FC8();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_initWithName_destination_payload_, v10, v12, v17);

  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v20 = swift_allocObject();
  v21 = v27;
  *(_QWORD *)(v20 + 16) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, v8, v5);
  aBlock[4] = sub_19B1EAC1C;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19B1E9DBC;
  aBlock[3] = &block_descriptor_0;
  v22 = _Block_copy(aBlock);
  v23 = v21;
  swift_release();
  objc_msgSend(v18, sel_setResponseHandler_, v22);
  _Block_release(v22);
  v24 = *(void **)&v23[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher];
  if (v24)
  {
    v25 = v24;
    objc_msgSend(v25, sel_sendMessage_, v18);

  }
}

uint64_t sub_19B1E9B84(void *a1)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;

  if (a1)
  {
    v2 = a1;
    v3 = a1;
    v4 = a1;
    v5 = sub_19B428FA4();
    v6 = sub_19B4290E8();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = a1;
      v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_19B429100();
      *v8 = v14;

      _os_log_impl(&dword_19B1B0000, v5, v6, "Fetch failed %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF678);
      swift_arrayDestroy();
      MEMORY[0x1A1AC2040](v8, -1, -1);
      MEMORY[0x1A1AC2040](v7, -1, -1);

    }
    else
    {

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF660);
    return sub_19B4290B8();
  }
  else
  {
    v10 = sub_19B428FA4();
    v11 = sub_19B4290D0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19B1B0000, v10, v11, "Fetch succeeded", v12, 2u);
      MEMORY[0x1A1AC2040](v12, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF660);
    return sub_19B4290C4();
  }
}

uint64_t sub_19B1E9DBC(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v4)(void *, uint64_t);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3)
    v5 = sub_19B428FD4();
  else
    v5 = 0;
  swift_retain();
  v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_19B1E9E50(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t result;
  unint64_t v31;
  __int128 v32;
  void (*v33)(char *, uint64_t);
  unint64_t v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t ObjectType;
  char *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t *v60;
  unint64_t v61;
  char v62;
  char v63;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  char *v80;
  int64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;

  v92 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF680);
  MEMORY[0x1E0C80A78](v7);
  v85 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19B428F74();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v80 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v74 - v13;
  v15 = sub_19B428F98();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v83 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v99 = (uint64_t)&v74 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF6A0);
  v21 = MEMORY[0x1E0C80A78](v20);
  v94 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v93 = (uint64_t)&v74 - v23;
  v86 = a1;
  v24 = *a1;
  v25 = *(_QWORD *)(*a1 + 64);
  v77 = *a1 + 64;
  v26 = 1 << *(_BYTE *)(v24 + 32);
  v27 = -1;
  if (v26 < 64)
    v27 = ~(-1 << v26);
  v28 = v27 & v25;
  v91 = a2;
  v82 = a2 + OBJC_IVAR___HMAccessoryInfoFetchController_log;
  v29 = (unint64_t)(v26 + 63) >> 6;
  v74 = v29 - 1;
  result = swift_bridgeObjectRetain();
  v31 = 0;
  v81 = v29;
  v75 = v29 - 5;
  v90 = result;
  v76 = result + 104;
  *(_QWORD *)&v32 = 136315138;
  v79 = v32;
  v78 = MEMORY[0x1E0DEE9B8] + 8;
  v95 = v14;
  v96 = v9;
  v84 = v10;
  v88 = v16;
  v89 = v15;
  v87 = a3;
  while (1)
  {
    if (v28)
    {
      v97 = (v28 - 1) & v28;
      v98 = v31;
      v34 = __clz(__rbit64(v28)) | (v31 << 6);
      goto LABEL_8;
    }
    v40 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v40 >= v81)
    {
      v42 = v31;
    }
    else
    {
      v41 = *(_QWORD *)(v77 + 8 * v40);
      if (v41)
        goto LABEL_12;
      v42 = v31 + 1;
      if ((uint64_t)(v31 + 2) < v81)
      {
        v41 = *(_QWORD *)(v77 + 8 * (v31 + 2));
        if (v41)
        {
          v40 = v31 + 2;
          goto LABEL_12;
        }
        v42 = v31 + 2;
        if ((uint64_t)(v31 + 3) < v81)
        {
          v41 = *(_QWORD *)(v77 + 8 * (v31 + 3));
          if (v41)
          {
            v40 = v31 + 3;
LABEL_12:
            v97 = (v41 - 1) & v41;
            v98 = v40;
            v34 = __clz(__rbit64(v41)) + (v40 << 6);
LABEL_8:
            v35 = v90;
            v36 = v94;
            (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v94, *(_QWORD *)(v90 + 48) + *(_QWORD *)(v16 + 72) * v34, v15);
            v37 = *(_QWORD *)(v35 + 56) + *(_QWORD *)(v10 + 72) * v34;
            v38 = (uint64_t)v36;
            v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF6A8);
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v10 + 16))(v38 + *(int *)(v39 + 48), v37, v9);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v38, 0, 1, v39);
            v14 = v95;
            goto LABEL_15;
          }
          v40 = v31 + 4;
          v42 = v31 + 3;
          if ((uint64_t)(v31 + 4) < v81)
          {
            v41 = *(_QWORD *)(v77 + 8 * v40);
            if (v41)
              goto LABEL_12;
            while (v75 != v31)
            {
              v41 = *(_QWORD *)(v76 + 8 * v31++);
              if (v41)
              {
                v40 = v31 + 4;
                goto LABEL_12;
              }
            }
            v42 = v74;
          }
        }
      }
    }
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF6A8);
    v44 = v94;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v94, 1, 1, v43);
    v97 = 0;
    v98 = v42;
    v38 = (uint64_t)v44;
LABEL_15:
    v45 = v38;
    v46 = v93;
    sub_19B1EB384(v45, v93, &qword_1EE3EF6A0);
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF6A8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 48))(v46, 1, v47) == 1)
      return swift_release();
    v48 = v46 + *(int *)(v47 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v99, v46, v15);
    v49 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 32);
    v49(v14, v48, v9);
    ObjectType = swift_getObjectType();
    if (fabs((*(double (**)(uint64_t, char *, uint64_t))(v92 + 24))(v91, v14, ObjectType)) < 30.0)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
      v33 = *(void (**)(char *, uint64_t))(v16 + 8);
    }
    else
    {
      v51 = v83;
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v83, v99, v15);
      v52 = sub_19B428FA4();
      v53 = v16;
      v54 = v15;
      v55 = sub_19B4290D0();
      if (os_log_type_enabled(v52, v55))
      {
        v56 = swift_slowAlloc();
        v57 = swift_slowAlloc();
        v100 = v57;
        *(_DWORD *)v56 = v79;
        sub_19B1EB344(&qword_1EE3EF690, MEMORY[0x1E0CB09F0]);
        v58 = sub_19B429274();
        *(_QWORD *)(v56 + 4) = sub_19B1F1054(v58, v59, &v100);
        swift_bridgeObjectRelease();
        v33 = *(void (**)(char *, uint64_t))(v53 + 8);
        v33(v51, v54);
        _os_log_impl(&dword_19B1B0000, v52, v55, "Clearing fetch history for %s", (uint8_t *)v56, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A1AC2040](v57, -1, -1);
        MEMORY[0x1A1AC2040](v56, -1, -1);

      }
      else
      {

        v33 = *(void (**)(char *, uint64_t))(v53 + 8);
        v33(v51, v54);
      }
      v60 = v86;
      swift_bridgeObjectRetain();
      v61 = sub_19B1F1694(v99);
      v63 = v62;
      swift_bridgeObjectRelease();
      if ((v63 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v65 = *v60;
        v100 = *v60;
        *v60 = 0x8000000000000000;
        v66 = v84;
        v67 = v88;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_19B1F2214();
          v65 = v100;
        }
        v33((char *)(*(_QWORD *)(v65 + 48) + *(_QWORD *)(v67 + 72) * v61), v89);
        v68 = v100;
        v69 = v80;
        v70 = v96;
        v49(v80, *(_QWORD *)(v100 + 56) + *(_QWORD *)(v66 + 72) * v61, v96);
        sub_19B1EAE48(v61, v68);
        *v60 = v68;
        swift_bridgeObjectRelease();
        v71 = (uint64_t)v85;
        v72 = v69;
        v16 = v88;
        v49(v85, (uint64_t)v72, v70);
        v73 = 0;
      }
      else
      {
        v73 = 1;
        v16 = v88;
        v66 = v84;
        v71 = (uint64_t)v85;
        v70 = v96;
      }
      v14 = v95;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 56))(v71, v73, 1, v70);
      sub_19B1EAC88(v71, &qword_1EE3EF680);
      (*(void (**)(char *, uint64_t))(v66 + 8))(v14, v70);
      v10 = v66;
      v15 = v89;
    }
    v28 = v97;
    result = ((uint64_t (*)(uint64_t, uint64_t))v33)(v99, v15);
    v9 = v96;
    v31 = v98;
  }
  __break(1u);
  return result;
}

id AccessoryInfoFetchController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AccessoryInfoFetchController.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccessoryInfoFetchController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryInfoFetchController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19B1EA718@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)sub_19B428F80();
  v4 = objc_msgSend(v1, sel_accessoryWithUniqueIdentifier_, v3);

  if (v4)
  {
    v5 = objc_msgSend(v4, sel_uuid);

    sub_19B428F8C();
    v6 = sub_19B428F98();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a1;
    v9 = 0;
  }
  else
  {
    v6 = sub_19B428F98();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a1;
    v9 = 1;
  }
  return v7(v8, v9, 1, v6);
}

uint64_t sub_19B1EA7E8()
{
  return sub_19B428F5C();
}

char *HMHome.accessoryInfoFetchController.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[2];
  _OWORD v15[2];
  _BYTE v16[24];
  uint64_t v17;

  v1 = v0;
  v2 = sub_19B428F98();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v1, sel_accessoryInfoFetch))
  {
    sub_19B429118();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_19B1EB384((uint64_t)v15, (uint64_t)v16, &qword_1EE3EF610);
  if (v17)
  {
    type metadata accessor for AccessoryInfoFetchController();
    if ((swift_dynamicCast() & 1) != 0)
      return (char *)v14[1];
  }
  else
  {
    sub_19B1EAC88((uint64_t)v16, &qword_1EE3EF610);
  }
  v6 = objc_msgSend(v1, sel_uuid);
  sub_19B428F8C();

  v7 = objc_allocWithZone((Class)type metadata accessor for AccessoryInfoFetchController());
  v5 = (char *)sub_19B1E872C((uint64_t)v4);
  v8 = objc_msgSend(v1, sel_context);
  if (!v8)
  {
    v9 = objc_allocWithZone((Class)_HMContext);
    v10 = (void *)sub_19B429004();
    v8 = objc_msgSend(v9, sel_initWithName_, v10);

  }
  v11 = objc_msgSend(v8, sel_messageDispatcher);
  v12 = *(void **)&v5[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher];
  *(_QWORD *)&v5[OBJC_IVAR___HMAccessoryInfoFetchController_messageDispatcher] = v11;

  *(_QWORD *)&v5[OBJC_IVAR___HMAccessoryInfoFetchController_dataSource + 8] = &off_1E3AAD008;
  swift_unknownObjectWeakAssign();

  objc_msgSend(v1, sel_setAccessoryInfoFetch_, v5);
  return v5;
}

void sub_19B1EAA20(uint64_t a1)
{
  uint64_t v1;

  sub_19B1E98DC(a1, *(void **)(v1 + 16), *(uint64_t **)(v1 + 24));
}

uint64_t type metadata accessor for AccessoryInfoFetchController()
{
  uint64_t result;

  result = qword_1EE3EF640;
  if (!qword_1EE3EF640)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_19B1EAA64()
{
  return type metadata accessor for AccessoryInfoFetchController();
}

uint64_t sub_19B1EAA6C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_19B428FBC();
  if (v1 <= 0x3F)
  {
    result = sub_19B428F98();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AccessoryInfoFetchController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessoryInfoFetchController.fetchUpdates(for:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xD8);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B1E79D0;
  return v7(a1);
}

uint64_t sub_19B1EABA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF660);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_19B1EAC1C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF660);
  return sub_19B1E9B84(a1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_19B1EAC88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_19B1EACC4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v6 = sub_19B428F74();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v10 = sub_19B1F1694(a1);
  LOBYTE(a1) = v11;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, 1, 1, v6);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v3;
  v19 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_19B1F2214();
    v13 = v19;
  }
  v14 = *(_QWORD *)(v13 + 48);
  v15 = sub_19B428F98();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * v10, v15);
  v16 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 32);
  v16(v9, *(_QWORD *)(v13 + 56) + *(_QWORD *)(v7 + 72) * v10, v6);
  sub_19B1EAE48(v10, v13);
  *v3 = v13;
  swift_bridgeObjectRelease();
  v16(a2, (unint64_t)v9, v6);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
}

unint64_t sub_19B1EAE48(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;

  v4 = sub_19B428F98();
  v36 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78]();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_19B429124();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v35 = (result + 1) & v11;
      v12 = *(_QWORD *)(v36 + 72);
      v34 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v34(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_19B1EB344(&qword_1EE3EF698, MEMORY[0x1E0CB09C8]);
        v17 = sub_19B428FEC();
        result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v35)
        {
          if (v18 >= v35 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            if (v14 * a1 < v15
              || *(_QWORD *)(a2 + 48) + v14 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v15 + v14))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v14 * a1 != v15)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v21 = *(_QWORD *)(a2 + 56);
            v22 = *(_QWORD *)(*(_QWORD *)(sub_19B428F74() - 8) + 72);
            v23 = v22 * a1;
            result = v21 + v22 * a1;
            v24 = v22 * v10;
            v25 = v21 + v22 * v10 + v22;
            if (v23 < v24 || result >= v25)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v16;
            }
            else
            {
              a1 = v10;
              v13 = v16;
              if (v23 != v24)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v16;
                a1 = v10;
              }
            }
          }
        }
        else if (v18 >= v35 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        v10 = (v10 + 1) & v13;
        v12 = v14;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v27;
    v29 = (-1 << a1) - 1;
  }
  else
  {
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v27;
    v28 = (-1 << a1) - 1;
  }
  *v27 = v29 & v28;
  v30 = *(_QWORD *)(a2 + 16);
  v31 = __OFSUB__(v30, 1);
  v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v32;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_19B1EB104(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_19B428F98();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_19B1F1694(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = sub_19B428F74();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_19B1F2214();
      goto LABEL_7;
    }
    sub_19B1F17F0(v17, a3 & 1);
    v24 = sub_19B1F1694(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_19B1EB28C(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_19B429298();
  __break(1u);
  return result;
}

uint64_t sub_19B1EB28C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_19B428F98();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = sub_19B428F74();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_19B1EB344(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_19B428F98();
    result = MEMORY[0x1A1AC1FC8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_19B1EB384(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_19B1EB3C8()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_19B428F80();
  v2 = (void *)sub_19B428F80();
  v3 = objc_msgSend(v0, sel_topicFromSuffixID_homeUUID_accessoryUUID_, 506, v1, v2);

  if (!v3)
    return 0;
  v4 = sub_19B429010();

  return v4;
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AccessoryInfoFetchSoftwareUpdateItem.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AccessoryInfoFetchSoftwareUpdateItem()
{
  return objc_opt_self();
}

uint64_t _sSo11HMAccessoryC7HomeKitE18televisionProfiles3for13isSPIEntitledSaySo0A7ProfileCGSaySo9HMServiceCG_SbtFZ_0(unint64_t a1, char a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  BOOL v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  char v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  char *v42;
  char *v43;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v2 = a1;
  v55 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_56;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_19B4291E4())
  {
    v4 = 0;
    v51 = v2 & 0xC000000000000001;
    v47 = v2 + 32;
    v48 = v2 & 0xFFFFFFFFFFFFFF8;
    v49 = v2;
    v50 = v3;
    while (1)
    {
      if (v51)
      {
        v5 = (id)MEMORY[0x1A1AC1260](v4, v2);
      }
      else
      {
        if (v4 >= *(_QWORD *)(v48 + 16))
          goto LABEL_55;
        v5 = *(id *)(v47 + 8 * v4);
      }
      v52 = v5;
      v6 = __OFADD__(v4, 1);
      v7 = v4 + 1;
      if (v6)
        break;
      v46 = v7;
      v8 = objc_msgSend(v5, sel_serviceType);
      v9 = sub_19B429010();
      v11 = v10;

      if (v9 == sub_19B429010() && v11 == v12)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v14 = sub_19B429280();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {

          goto LABEL_5;
        }
      }
      v54 = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRetain();
      v15 = 0;
      do
      {
        if (v51)
        {
          v16 = (id)MEMORY[0x1A1AC1260](v15, v2);
        }
        else
        {
          if (v15 >= *(_QWORD *)(v48 + 16))
            goto LABEL_53;
          v16 = *(id *)(v47 + 8 * v15);
        }
        v17 = v16;
        v6 = __OFADD__(v15++, 1);
        if (v6)
        {
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        v18 = objc_msgSend(v52, sel_linkedServiceInstanceIDs);
        sub_19B1EBBA0(0, (unint64_t *)&qword_1EE3EF3A0);
        v19 = sub_19B42907C();

        if (v19 >> 62)
        {
          swift_bridgeObjectRetain();
          v20 = sub_19B4291E4();
          swift_bridgeObjectRelease();
          if (!v20)
          {
LABEL_19:

            swift_bridgeObjectRelease();
            continue;
          }
        }
        else
        {
          v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (!v20)
            goto LABEL_19;
        }
        v53 = v15;
        sub_19B1EBBA0(0, &qword_1EE3EF750);
        v21 = 4;
        while (1)
        {
          if ((v19 & 0xC000000000000001) != 0)
            v22 = (id)MEMORY[0x1A1AC1260](v21 - 4, v19);
          else
            v22 = *(id *)(v19 + 8 * v21);
          v23 = v22;
          v24 = v21 - 3;
          if (__OFADD__(v21 - 4, 1))
          {
            __break(1u);
            goto LABEL_51;
          }
          v25 = objc_msgSend(v17, sel_instanceID);
          v26 = sub_19B4290F4();

          if ((v26 & 1) != 0)
            break;

          ++v21;
          if (v24 == v20)
          {

            swift_bridgeObjectRelease();
            v2 = v49;
            v3 = v50;
            v15 = v53;
            goto LABEL_20;
          }
        }
        swift_bridgeObjectRelease();
        v27 = v17;
        MEMORY[0x1A1AC1158]();
        v15 = v53;
        v2 = v49;
        if (*(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_19B4290A0();
        sub_19B4290AC();
        sub_19B429094();

        v3 = v50;
LABEL_20:
        ;
      }
      while (v15 != v3);
      swift_bridgeObjectRelease();
      if ((a2 & 1) != 0)
      {
        v28 = objc_allocWithZone((Class)HMTelevisionProfile);
        sub_19B1EBBA0(0, &qword_1ED016490);
        v29 = v52;
        swift_bridgeObjectRetain();
        v30 = (void *)sub_19B429070();
        swift_bridgeObjectRelease();
        v31 = objc_msgSend(v28, sel_initWithTelevisionService_linkedServices_, v29, v30);

        v32 = v31;
        MEMORY[0x1A1AC1158]();
        if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_19B4290A0();
        sub_19B4290AC();
        sub_19B429094();

      }
      v33 = objc_allocWithZone((Class)HMTelevisionProfile);
      sub_19B1EBBA0(0, &qword_1ED016490);
      v34 = v52;
      v35 = (void *)sub_19B429070();
      swift_bridgeObjectRelease();
      v36 = objc_msgSend(v33, sel_initWithTelevisionService_linkedServices_, v34, v35);

      v37 = objc_msgSend(v36, sel_accessoryProfile);
      objc_opt_self();
      v38 = swift_dynamicCastObjCClass();
      if (v38)
      {
        v39 = (void *)v38;
        v40 = objc_allocWithZone((Class)type metadata accessor for HMMediaSourceDisplayOrderProfile());
        v41 = v37;
        v42 = sub_19B1E82C4(v39);

        v43 = v42;
        MEMORY[0x1A1AC1158]();
        if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_19B4290A0();
        sub_19B4290AC();
        sub_19B429094();

        v3 = v50;
      }
      else
      {

      }
LABEL_5:
      v4 = v46;
      if (v46 == v3)
      {
LABEL_51:
        swift_bridgeObjectRelease();
        return v55;
      }
    }
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_19B1EBBA0(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_19B1EBBD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x1E0DEE9D8];
  if (!v3)
    return v4;
  v29 = MEMORY[0x1E0DEE9D8];
  sub_19B1E7ADC(0, v3, 0);
  v4 = v29;
  result = sub_19B1F30F0(a1);
  v8 = result;
  v9 = 0;
  v10 = a1 + 64;
  v24 = v3;
  v25 = v7;
  v26 = a1 + 64;
  while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(_BYTE *)(a1 + 32))
  {
    v13 = (unint64_t)v8 >> 6;
    if ((*(_QWORD *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v7)
      goto LABEL_24;
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v8);
    v14 = swift_bridgeObjectRetain();
    v15 = sub_19B1EBE08(v14);
    v27 = v2;
    result = swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(v29 + 16);
    v16 = *(_QWORD *)(v29 + 24);
    if (v17 >= v16 >> 1)
      result = sub_19B1E7ADC(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v29 + 16) = v17 + 1;
    v18 = v29 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v28;
    *(_QWORD *)(v18 + 40) = v15;
    v11 = 1 << *(_BYTE *)(a1 + 32);
    if (v8 >= v11)
      goto LABEL_25;
    v10 = a1 + 64;
    v19 = *(_QWORD *)(v26 + 8 * v13);
    if ((v19 & (1 << v8)) == 0)
      goto LABEL_26;
    v7 = v25;
    if (*(_DWORD *)(a1 + 36) != v25)
      goto LABEL_27;
    v20 = v19 & (-2 << (v8 & 0x3F));
    if (v20)
    {
      v11 = __clz(__rbit64(v20)) | v8 & 0xFFFFFFFFFFFFFFC0;
      v2 = v27;
      v12 = v24;
    }
    else
    {
      v21 = v13 + 1;
      v22 = (unint64_t)(v11 + 63) >> 6;
      v2 = v27;
      v12 = v24;
      if (v13 + 1 < v22)
      {
        v23 = *(_QWORD *)(v26 + 8 * v21);
        if (v23)
        {
LABEL_20:
          v11 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v13)
          {
            v23 = *(_QWORD *)(a1 + 80 + 8 * v13++);
            if (v23)
            {
              v21 = v13 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v9;
    v8 = v11;
    if (v9 == v12)
      return v4;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_19B1EBE08(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return v2;
  v25 = MEMORY[0x1E0DEE9D8];
  sub_19B1E7B08(0, v1, 0);
  v2 = v25;
  result = sub_19B1F30F0(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v21 = v1;
  v22 = v5;
  v23 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v6);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6);
    v14 = *(_QWORD *)(v25 + 16);
    v13 = *(_QWORD *)(v25 + 24);
    result = swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1)
      result = sub_19B1E7B08(v13 > 1, v14 + 1, 1);
    *(_QWORD *)(v25 + 16) = v14 + 1;
    v15 = v25 + 16 * v14;
    *(_QWORD *)(v15 + 32) = v24;
    *(_QWORD *)(v15 + 40) = v12;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v16 = *(_QWORD *)(v23 + 8 * v11);
    if ((v16 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v22;
    if (*(_DWORD *)(a1 + 36) != v22)
      goto LABEL_27;
    v17 = v16 & (-2 << (v6 & 0x3F));
    if (v17)
    {
      v9 = __clz(__rbit64(v17)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v21;
    }
    else
    {
      v18 = v11 + 1;
      v19 = (unint64_t)(v9 + 63) >> 6;
      v10 = v21;
      if (v11 + 1 < v19)
      {
        v20 = *(_QWORD *)(v23 + 8 * v18);
        if (v20)
        {
LABEL_20:
          v9 = __clz(__rbit64(v20)) + (v18 << 6);
        }
        else
        {
          while (v19 - 2 != v11)
          {
            v20 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v20)
            {
              v18 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_19B1EC014(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF968);
  v2 = sub_19B429208();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_19B1F5000(v6, (uint64_t)&v15, &qword_1EE3EF970);
    v7 = v15;
    v8 = v16;
    result = sub_19B1F16F8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_19B1F5044(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_19B1EC148()
{
  uint64_t v0;

  v0 = sub_19B428FBC();
  __swift_allocate_value_buffer(v0, qword_1EE3EF758);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE3EF758);
  sub_19B429010();
  return sub_19B428FB0();
}

BOOL AccessoryMFiCapability.matchesCase(_:)(uint64_t a1)
{
  uint64_t v1;

  if (*(char *)(v1 + 8) >= 0)
    return *(char *)(a1 + 8) >= 0;
  else
    return *(char *)(a1 + 8) < 0;
}

uint64_t sub_19B1EC1F4(char a1)
{
  if ((a1 & 1) != 0)
    return 7567206;
  else
    return 7364963;
}

uint64_t sub_19B1EC214(char *a1, char *a2)
{
  return sub_19B1EC364(*a1, *a2);
}

uint64_t sub_19B1EC220(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x2D6465776F6C6C61;
  else
    v3 = 0xD000000000000019;
  if (v2)
    v4 = 0x800000019B44D040;
  else
    v4 = 0xEF6E6F736A2E6C6ELL;
  if ((a2 & 1) != 0)
    v5 = 0x2D6465776F6C6C61;
  else
    v5 = 0xD000000000000019;
  if ((a2 & 1) != 0)
    v6 = 0xEF6E6F736A2E6C6ELL;
  else
    v6 = 0x800000019B44D040;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_19B429280();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_19B1EC2D4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 1936744803;
  else
    v3 = 6580592;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE400000000000000;
  if ((a2 & 1) != 0)
    v5 = 1936744803;
  else
    v5 = 6580592;
  if ((a2 & 1) != 0)
    v6 = 0xE400000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_19B429280();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_19B1EC364(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 7567206;
  else
    v2 = 7364963;
  if ((a2 & 1) != 0)
    v3 = 7567206;
  else
    v3 = 7364963;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_19B429280();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_19B1EC3D0()
{
  return sub_19B1EC3D8();
}

uint64_t sub_19B1EC3D8()
{
  sub_19B4292D4();
  sub_19B429028();
  swift_bridgeObjectRelease();
  return sub_19B4292EC();
}

uint64_t sub_19B1EC43C()
{
  sub_19B4292D4();
  sub_19B429028();
  swift_bridgeObjectRelease();
  return sub_19B4292EC();
}

uint64_t sub_19B1EC4AC()
{
  sub_19B4292D4();
  sub_19B429028();
  swift_bridgeObjectRelease();
  return sub_19B4292EC();
}

uint64_t sub_19B1EC53C()
{
  return sub_19B1EC5F4();
}

uint64_t sub_19B1EC544()
{
  sub_19B429028();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19B1EC5AC()
{
  sub_19B429028();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19B1EC5F4()
{
  sub_19B429028();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19B1EC628()
{
  return sub_19B1EC630();
}

uint64_t sub_19B1EC630()
{
  sub_19B4292D4();
  sub_19B429028();
  swift_bridgeObjectRelease();
  return sub_19B4292EC();
}

uint64_t sub_19B1EC690()
{
  sub_19B4292D4();
  sub_19B429028();
  swift_bridgeObjectRelease();
  return sub_19B4292EC();
}

uint64_t sub_19B1EC6FC()
{
  sub_19B4292D4();
  sub_19B429028();
  swift_bridgeObjectRelease();
  return sub_19B4292EC();
}

uint64_t sub_19B1EC788@<X0>(char *a1@<X8>)
{
  return sub_19B1EDD90(a1);
}

uint64_t sub_19B1EC794@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_19B1EC1F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_19B1EC7BC()
{
  char *v0;

  return sub_19B1EC1F4(*v0);
}

uint64_t sub_19B1EC7C4@<X0>(char *a1@<X8>)
{
  return sub_19B1EDE24(a1);
}

uint64_t sub_19B1EC7D0()
{
  return 0;
}

void sub_19B1EC7DC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_19B1EC7E8()
{
  sub_19B1F4994();
  return sub_19B429310();
}

uint64_t sub_19B1EC810()
{
  sub_19B1F4994();
  return sub_19B42931C();
}

void sub_19B1EC838(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  int v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v9 = a4 & 1;
  if (a1 == 1735877473 && a2 == 0xE400000000000000 || (sub_19B429280() & 1) != 0)
  {
    *(_QWORD *)a5 = a3;
    *(_BYTE *)(a5 + 8) = v9;
  }
  else if (a1 == 7106157 && a2 == 0xE300000000000000 || (sub_19B429280() & 1) != 0)
  {
    if (v9)
    {
      if (qword_1EE3EF380 != -1)
        swift_once();
      v10 = sub_19B428FBC();
      __swift_project_value_buffer(v10, (uint64_t)qword_1EE3EF758);
      swift_bridgeObjectRetain_n();
      v11 = sub_19B428FA4();
      v12 = sub_19B4290E8();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        v14 = swift_slowAlloc();
        v23 = v14;
        *(_DWORD *)v13 = 136315138;
        swift_bridgeObjectRetain();
        v25 = sub_19B1F1054(a1, a2, &v23);
        sub_19B429100();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19B1B0000, v11, v12, "Missing firmwareStart for %s", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A1AC2040](v14, -1, -1);
        MEMORY[0x1A1AC2040](v13, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v23 = 0;
      v24 = 0xE000000000000000;
      sub_19B429154();
      swift_bridgeObjectRelease();
      v23 = 0xD00000000000001ALL;
      v24 = 0x800000019B44D7A0;
      swift_bridgeObjectRetain();
      sub_19B429034();
      swift_bridgeObjectRelease();
      v20 = v23;
      v21 = v24;
      sub_19B1F4D58();
      swift_allocError();
      *(_QWORD *)v22 = v20;
      *(_QWORD *)(v22 + 8) = v21;
      *(_BYTE *)(v22 + 16) = 1;
      swift_willThrow();
    }
    else
    {
      *(_QWORD *)a5 = a3;
      *(_BYTE *)(a5 + 8) = 0x80;
    }
  }
  else
  {
    if (qword_1EE3EF380 != -1)
      swift_once();
    v15 = sub_19B428FBC();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EE3EF758);
    swift_bridgeObjectRetain_n();
    v16 = sub_19B428FA4();
    v17 = sub_19B4290D0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      *(_DWORD *)v18 = 136315138;
      v23 = v19;
      swift_bridgeObjectRetain();
      v25 = sub_19B1F1054(a1, a2, &v23);
      sub_19B429100();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19B1B0000, v16, v17, "Ignoring unknown capability %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A1AC2040](v19, -1, -1);
      MEMORY[0x1A1AC2040](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    *(_QWORD *)a5 = 0;
    *(_BYTE *)(a5 + 8) = -2;
  }
}

uint64_t sub_19B1ECC84(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  int v13;
  char v14;
  char v15;

  v13 = a5;
  v12[1] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF8F8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F4994();
  sub_19B429304();
  v15 = 0;
  sub_19B42925C();
  if (!v5)
  {
    v14 = 1;
    sub_19B429250();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_19B1ECDB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;

  result = sub_19B1F47E0(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_BYTE *)(a2 + 24) = v7 & 1;
  }
  return result;
}

uint64_t sub_19B1ECDEC(_QWORD *a1)
{
  uint64_t v1;

  return sub_19B1ECC84(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t AccessoryMFiCapabilitiesList.accessoriesByVendorID.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AccessoryMFiCapabilitiesList.accessoriesByVendorID.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*AccessoryMFiCapabilitiesList.accessoriesByVendorID.modify())()
{
  return nullsub_1;
}

HomeKit::AccessoryMFiCapabilitiesList __swiftcall AccessoryMFiCapabilitiesList.init()()
{
  HomeKit::AccessoryMFiCapabilitiesList *v0;
  HomeKit::AccessoryMFiCapabilitiesList *v1;
  HomeKit::AccessoryMFiCapabilitiesList result;

  v1 = v0;
  result.accessoriesByVendorID._rawValue = (void *)sub_19B1F3310(MEMORY[0x1E0DEE9D8]);
  v1->accessoriesByVendorID._rawValue = result.accessoriesByVendorID._rawValue;
  return result;
}

uint64_t AccessoryMFiCapabilitiesList.init(capabilities:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain();
  result = sub_19B1F340C(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_19B1ECECC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_19B429220();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_19B1ECF1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_19B1F497C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_19B1ECF44@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_19B429220();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_19B1ECF98(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_19B1ECFA4()
{
  sub_19B1F345C();
  return sub_19B429310();
}

uint64_t sub_19B1ECFCC()
{
  sub_19B1F345C();
  return sub_19B42931C();
}

uint64_t AccessoryMFiCapabilitiesList.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  _QWORD v55[2];
  char *v56;
  uint64_t v57;
  uint64_t *v58;
  _QWORD *v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68[2];
  id v69;
  uint64_t v70[2];
  _QWORD *v71;
  uint64_t v72;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF770);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F345C();
  sub_19B4292F8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v58 = a2;
  v59 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF780);
  sub_19B1F37D0(&qword_1EE3EF788, &qword_1EE3EF780, (uint64_t (*)(void))sub_19B1F34E4, MEMORY[0x1E0DEAF40]);
  sub_19B429244();
  v67 = 0;
  v56 = v8;
  v57 = v5;
  v10 = v68[0];
  v11 = *(_QWORD *)(v68[0] + 16);
  if (v11)
  {
    v72 = MEMORY[0x1E0DEE9D8];
    sub_19B1E7A84(0, v11, 0);
    v12 = 0;
    v13 = v72;
    v55[1] = v10;
    v61 = v6;
    v62 = v10 + 32;
    v60 = v11;
    while (1)
    {
      v64 = v12;
      v65 = v13;
      v14 = (uint64_t *)(v62 + 16 * v12);
      v15 = v14[1];
      v63 = *v14;
      v16 = *(_QWORD *)(v15 + 16);
      v66 = v15;
      if (v16)
      {
        v68[0] = MEMORY[0x1E0DEE9D8];
        swift_bridgeObjectRetain_n();
        sub_19B1E7AB0(0, v16, 0);
        v17 = v68[0];
        v18 = (uint64_t *)(v15 + 40);
        do
        {
          v20 = *(v18 - 1);
          v19 = *v18;
          v68[0] = v17;
          v22 = *(_QWORD *)(v17 + 16);
          v21 = *(_QWORD *)(v17 + 24);
          swift_bridgeObjectRetain();
          if (v22 >= v21 >> 1)
          {
            sub_19B1E7AB0(v21 > 1, v22 + 1, 1);
            v17 = v68[0];
          }
          *(_QWORD *)(v17 + 16) = v22 + 1;
          v23 = v17 + 16 * v22;
          *(_QWORD *)(v23 + 32) = v20;
          *(_QWORD *)(v23 + 40) = v19;
          v18 += 2;
          --v16;
        }
        while (v16);
        swift_bridgeObjectRelease();
        if (!*(_QWORD *)(v17 + 16))
        {
LABEL_27:
          v24 = (_QWORD *)MEMORY[0x1E0DEE9E0];
          v71 = (_QWORD *)MEMORY[0x1E0DEE9E0];
          swift_bridgeObjectRetain();
          goto LABEL_28;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        v17 = MEMORY[0x1E0DEE9D8];
        if (!*(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16))
          goto LABEL_27;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF798);
      v24 = (_QWORD *)sub_19B429208();
      v25 = *(_QWORD *)(v17 + 16);
      v71 = v24;
      swift_bridgeObjectRetain();
      if (v25)
      {
        v26 = 0;
        v27 = (uint64_t *)(v17 + 40);
        while (v26 < *(_QWORD *)(v17 + 16))
        {
          v28 = *(v27 - 1);
          v29 = *v27;
          swift_bridgeObjectRetain();
          if (!v29)
            goto LABEL_28;
          v70[0] = v29;
          v70[1] = v28;
          v31 = sub_19B1F175C(v28);
          v32 = v24[2];
          v33 = (v30 & 1) == 0;
          v34 = v32 + v33;
          if (__OFADD__(v32, v33))
            goto LABEL_39;
          v35 = v30;
          if (v24[3] < v34)
          {
            sub_19B1F1BC8(v34, 1, &qword_1EE3EF798);
            v24 = v71;
            v36 = sub_19B1F175C(v28);
            if ((v35 & 1) != (v37 & 1))
              goto LABEL_41;
            v31 = v36;
          }
          if ((v35 & 1) != 0)
          {
            v69 = *(id *)(v24[7] + 8 * v31);
            swift_bridgeObjectRetain();
            v38 = v67;
            sub_19B1ED634((uint64_t *)&v69, v70, v68);
            v67 = v38;
            if (v38)
              goto LABEL_42;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v39 = v24[7];
            v40 = v68[0];
            swift_bridgeObjectRelease();
            *(_QWORD *)(v39 + 8 * v31) = v40;
          }
          else
          {
            v24[(v31 >> 6) + 8] |= 1 << v31;
            v41 = 8 * v31;
            *(_QWORD *)(v24[6] + v41) = v28;
            *(_QWORD *)(v24[7] + v41) = v29;
            v42 = v24[2];
            v43 = __OFADD__(v42, 1);
            v44 = v42 + 1;
            if (v43)
              goto LABEL_40;
            v24[2] = v44;
          }
          ++v26;
          v27 += 2;
          if (v25 == v26)
            goto LABEL_28;
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        sub_19B429298();
        __break(1u);
LABEL_42:
        swift_bridgeObjectRelease();
        v69 = v67;
        v54 = v67;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF4D0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v68[0] = 0;
          v68[1] = 0xE000000000000000;
          sub_19B429154();
          sub_19B429034();
          sub_19B4291C0();
          sub_19B429034();
          sub_19B4291D8();
          __break(1u);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
        __break(1u);
        goto LABEL_45;
      }
LABEL_28:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      v13 = v65;
      v72 = v65;
      v46 = *(_QWORD *)(v65 + 16);
      v45 = *(_QWORD *)(v65 + 24);
      if (v46 >= v45 >> 1)
      {
        sub_19B1E7A84(v45 > 1, v46 + 1, 1);
        v13 = v72;
      }
      v47 = v63;
      v12 = v64 + 1;
      *(_QWORD *)(v13 + 16) = v46 + 1;
      v48 = v13 + 16 * v46;
      *(_QWORD *)(v48 + 32) = v47;
      *(_QWORD *)(v48 + 40) = v24;
      v6 = v61;
      if (v12 == v60)
      {
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
    }
  }
  swift_bridgeObjectRelease();
  v13 = MEMORY[0x1E0DEE9D8];
LABEL_33:
  v49 = v58;
  if (*(_QWORD *)(v13 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF7A0);
    v50 = sub_19B429208();
  }
  else
  {
    v50 = MEMORY[0x1E0DEE9E0];
  }
  v51 = (uint64_t)v59;
  v68[0] = v50;
  v52 = v67;
  sub_19B1F2680(v13, 1, (uint64_t)v68);
  if (v52)
  {
LABEL_45:
    result = swift_release();
    __break(1u);
  }
  else
  {
    v53 = v68[0];
    (*(void (**)(char *, uint64_t))(v6 + 8))(v56, v57);
    *v49 = v53;
    return __swift_destroy_boxed_opaque_existential_1Tm(v51);
  }
  return result;
}

uint64_t sub_19B1ED634@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  char v18;
  uint64_t result;
  uint8_t *buf;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v4 = v3;
  v6 = *a1;
  v7 = *a2;
  if (qword_1EE3EF380 != -1)
    swift_once();
  v8 = sub_19B428FBC();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EE3EF758);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v9 = sub_19B428FA4();
  v10 = sub_19B4290E8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22 = v21;
    *(_DWORD *)v11 = 136315138;
    buf = v11;
    v24 = v6;
    swift_bridgeObjectRetain();
    v12 = swift_bridgeObjectRetain();
    sub_19B1F2E20(v12);
    v13 = MEMORY[0x1A1AC117C](v6, &type metadata for AccessoryMFiCapability);
    v15 = v14;
    swift_bridgeObjectRelease();
    v24 = sub_19B1F1054(v13, v15, &v22);
    sub_19B429100();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19B1B0000, v9, v10, "Unexpected duplicate products, capabilities: %s", buf, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AC2040](v21, -1, -1);
    MEMORY[0x1A1AC2040](buf, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v24 = v7;
  v16 = *(_QWORD *)(v6 + 16);
  if (v16)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = (_BYTE *)(v6 + 40);
    while (1)
    {
      v18 = *v17;
      v22 = *((_QWORD *)v17 - 1);
      v23 = v18;
      sub_19B1F0950((uint64_t)&v24, &v22);
      if (v4)
        break;
      v4 = 0;
      v17 += 16;
      if (!--v16)
      {
        result = swift_bridgeObjectRelease();
        v7 = v24;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    result = swift_bridgeObjectRetain();
LABEL_12:
    *a3 = v7;
  }
  return result;
}

uint64_t sub_19B1ED8E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t *v21;
  uint64_t v22;

  v4 = *a1;
  v5 = *a2;
  if (qword_1EE3EF380 != -1)
    swift_once();
  v6 = sub_19B428FBC();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EE3EF758);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v7 = sub_19B428FA4();
  v8 = sub_19B4290E8();
  if (os_log_type_enabled(v7, v8))
  {
    v20 = v8;
    v21 = a3;
    v9 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v22 = v19;
    *(_DWORD *)v9 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF958);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_19B44BBA0;
    *(_QWORD *)(v10 + 32) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = (_QWORD *)v10;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_19B1F0E24(0, 2, 1, (_QWORD *)v10);
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
      v11 = sub_19B1F0E24((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
    v11[2] = v13 + 1;
    v11[v13 + 4] = v5;
    swift_bridgeObjectRelease();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF960);
    v15 = MEMORY[0x1A1AC117C](v11, v14);
    v17 = v16;
    swift_bridgeObjectRelease();
    sub_19B1F1054(v15, v17, &v22);
    sub_19B429100();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19B1B0000, v7, v20, "Unexpected duplicate vendors, pids: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AC2040](v19, -1, -1);
    MEMORY[0x1A1AC2040](v9, -1, -1);

    a3 = v21;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_19B1F0B90(v4, v5);
  *a3 = result;
  return result;
}

uint64_t AccessoryMFiCapabilitiesList.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF7A8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F345C();
  sub_19B429304();
  v6 = swift_bridgeObjectRetain();
  v7 = sub_19B1EBBD8(v6);
  swift_bridgeObjectRelease();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF780);
  sub_19B1F37D0(&qword_1EE3EF7B0, &qword_1EE3EF780, (uint64_t (*)(void))sub_19B1F3528, MEMORY[0x1E0DEAF10]);
  sub_19B429268();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_19B1EDD10(char a1)
{
  if ((a1 & 1) != 0)
    return 1936744803;
  else
    return 6580592;
}

uint64_t sub_19B1EDD38@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return AccessoryMFiCapabilitiesList.init(from:)(a1, a2);
}

uint64_t sub_19B1EDD4C(_QWORD *a1)
{
  return AccessoryMFiCapabilitiesList.encode(to:)(a1);
}

uint64_t sub_19B1EDD60(char *a1, char *a2)
{
  return sub_19B1EC2D4(*a1, *a2);
}

uint64_t sub_19B1EDD6C()
{
  return sub_19B1EC43C();
}

uint64_t sub_19B1EDD74()
{
  return sub_19B1EC5AC();
}

uint64_t sub_19B1EDD7C()
{
  return sub_19B1EC690();
}

uint64_t sub_19B1EDD84@<X0>(char *a1@<X8>)
{
  return sub_19B1EDD90(a1);
}

uint64_t sub_19B1EDD90@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_19B429220();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_19B1EDDE8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_19B1EDD10(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_19B1EDE10()
{
  char *v0;

  return sub_19B1EDD10(*v0);
}

uint64_t sub_19B1EDE18@<X0>(char *a1@<X8>)
{
  return sub_19B1EDE24(a1);
}

uint64_t sub_19B1EDE24@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_19B429220();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_19B1EDE80()
{
  sub_19B1F356C();
  return sub_19B429310();
}

uint64_t sub_19B1EDEA8()
{
  sub_19B1F356C();
  return sub_19B42931C();
}

uint64_t AccessoryMFiCapabilitiesList.Product.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unsigned __int8 v35;
  char v36;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF7C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F356C();
  sub_19B4292F8();
  if (!v2)
  {
    v36 = 0;
    sub_19B1F35B0();
    sub_19B429244();
    v9 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF7D8);
    v36 = 1;
    sub_19B1F37D0(&qword_1EE3EF7E0, &qword_1EE3EF7D8, (uint64_t (*)(void))sub_19B1F35F4, MEMORY[0x1E0DEAF40]);
    sub_19B429244();
    v31 = a2;
    v11 = v34;
    v12 = *(_QWORD *)(v34 + 16);
    if (v12)
    {
      v29 = v5;
      v30 = v6;
      swift_bridgeObjectRetain();
      v28 = v11;
      v13 = (char *)(v11 + 56);
      v33 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      do
      {
        v17 = v9;
        v18 = *v13;
        v19 = *((_QWORD *)v13 - 2);
        v20 = *((_QWORD *)v13 - 1);
        v21 = *((_QWORD *)v13 - 3);
        swift_bridgeObjectRetain();
        sub_19B1EC838(v21, v19, v20, v18, (uint64_t)&v34);
        swift_bridgeObjectRelease();
        v22 = v35;
        if (v35 <= 0xFDu)
        {
          v23 = v33;
          v32 = v34;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v23 = sub_19B1F0D18(0, v23[2] + 1, 1, v23);
          v25 = v23[2];
          v24 = v23[3];
          v33 = v23;
          if (v25 >= v24 >> 1)
            v33 = sub_19B1F0D18((_QWORD *)(v24 > 1), v25 + 1, 1, v33);
          v15 = v32;
          v14 = v33;
          v33[2] = v25 + 1;
          v16 = &v14[2 * v25];
          v16[4] = v15;
          *((_BYTE *)v16 + 40) = v22;
        }
        v9 = v17;
        v13 += 32;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
      v5 = v29;
      v6 = v30;
      v26 = v33;
    }
    else
    {
      v26 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    v27 = v31;
    *v31 = v9;
    v27[1] = v26;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t AccessoryMFiCapabilitiesList.Product.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF7F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F356C();
  sub_19B429304();
  v28 = v7;
  v27 = 0;
  sub_19B1F3638();
  v9 = v26;
  sub_19B429268();
  if (v9)
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v26 = v6;
  v11 = *(_QWORD *)(v8 + 16);
  v12 = MEMORY[0x1E0DEE9D8];
  if (v11)
  {
    v23[1] = 0;
    v24 = v4;
    v25 = v3;
    v28 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_19B1E7B34(0, v11, 0);
    v23[0] = v8;
    v13 = (unsigned __int8 *)(v8 + 40);
    v12 = v28;
    do
    {
      v14 = *((_QWORD *)v13 - 1);
      v15 = *v13;
      if ((v15 & 0x80u) != 0)
        v16 = 7106157;
      else
        v16 = 1735877473;
      if ((v15 & 0x80u) != 0)
        v17 = 0xE300000000000000;
      else
        v17 = 0xE400000000000000;
      v28 = v12;
      v19 = *(_QWORD *)(v12 + 16);
      v18 = *(_QWORD *)(v12 + 24);
      if (v19 >= v18 >> 1)
      {
        v21 = v14;
        sub_19B1E7B34(v18 > 1, v19 + 1, 1);
        v14 = v21;
        v12 = v28;
      }
      v13 += 16;
      *(_QWORD *)(v12 + 16) = v19 + 1;
      v20 = v12 + 32 * v19;
      *(_QWORD *)(v20 + 32) = v16;
      *(_QWORD *)(v20 + 40) = v17;
      *(_QWORD *)(v20 + 48) = v14;
      *(_BYTE *)(v20 + 56) = (v15 & 0xFFFFFF81) == 1;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    v4 = v24;
    v3 = v25;
  }
  v28 = v12;
  v27 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF7D8);
  sub_19B1F37D0(&qword_1EE3EF800, &qword_1EE3EF7D8, (uint64_t (*)(void))sub_19B1F367C, MEMORY[0x1E0DEAF10]);
  v22 = v26;
  sub_19B429268();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v22, v3);
}

uint64_t sub_19B1EE478(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73746375646F7270;
  else
    return 6580598;
}

uint64_t sub_19B1EE4A8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return AccessoryMFiCapabilitiesList.Product.init(from:)(a1, a2);
}

uint64_t sub_19B1EE4BC(_QWORD *a1)
{
  return AccessoryMFiCapabilitiesList.Product.encode(to:)(a1);
}

BOOL sub_19B1EE4D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_19B1EE4E8()
{
  sub_19B4292D4();
  sub_19B4292E0();
  return sub_19B4292EC();
}

uint64_t sub_19B1EE52C()
{
  return sub_19B4292E0();
}

uint64_t sub_19B1EE554()
{
  sub_19B4292D4();
  sub_19B4292E0();
  return sub_19B4292EC();
}

uint64_t sub_19B1EE594()
{
  char *v0;

  return sub_19B1EE478(*v0);
}

uint64_t sub_19B1EE59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_19B1F4BC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19B1EE5C0()
{
  sub_19B1F36C0();
  return sub_19B429310();
}

uint64_t sub_19B1EE5E8()
{
  sub_19B1F36C0();
  return sub_19B42931C();
}

uint64_t AccessoryMFiCapabilitiesList.Vendor.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF810);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F36C0();
  sub_19B429304();
  v12 = v8;
  v11 = 0;
  sub_19B1F3704();
  sub_19B429268();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF828);
    sub_19B1F37D0(&qword_1EE3EF830, &qword_1EE3EF828, (uint64_t (*)(void))sub_19B1F3748, MEMORY[0x1E0DEAF10]);
    sub_19B429268();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t AccessoryMFiCapabilitiesList.Vendor.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF840);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F36C0();
  sub_19B4292F8();
  if (!v2)
  {
    v13 = 0;
    sub_19B1F378C();
    sub_19B429244();
    v9 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF828);
    v13 = 1;
    sub_19B1F37D0(&qword_1EE3EF850, &qword_1EE3EF828, (uint64_t (*)(void))sub_19B1F3834, MEMORY[0x1E0DEAF40]);
    sub_19B429244();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v14;
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_19B1EE930@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return AccessoryMFiCapabilitiesList.Vendor.init(from:)(a1, a2);
}

uint64_t sub_19B1EE944(_QWORD *a1)
{
  return AccessoryMFiCapabilitiesList.Vendor.encode(to:)(a1);
}

uint64_t sub_19B1EE958()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_attributes);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_19B428FD4();

  return v3;
}

uint64_t sub_19B1EE9C4@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*v1, sel_getLocalFileUrl);
  if (v3)
  {
    v4 = v3;
    sub_19B428F38();

    v5 = sub_19B428F44();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_19B428F44();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_19B1EEA48(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void **v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_19B4291E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v17 = MEMORY[0x1E0DEE9D8];
  result = sub_19B1E7B50(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      do
      {
        v6 = MEMORY[0x1A1AC1260](v5, a1);
        v17 = v3;
        v8 = *(_QWORD *)(v3 + 16);
        v7 = *(_QWORD *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          sub_19B1E7B50(v7 > 1, v8 + 1, 1);
          v3 = v17;
        }
        ++v5;
        v15 = sub_19B1EBBA0(0, &qword_1EE3EF910);
        v16 = &off_1E3AAD090;
        *(_QWORD *)&v14 = v6;
        *(_QWORD *)(v3 + 16) = v8 + 1;
        sub_19B1F4D28(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (void **)(a1 + 32);
      do
      {
        v10 = *v9;
        v17 = v3;
        v12 = *(_QWORD *)(v3 + 16);
        v11 = *(_QWORD *)(v3 + 24);
        v13 = v10;
        if (v12 >= v11 >> 1)
        {
          sub_19B1E7B50(v11 > 1, v12 + 1, 1);
          v3 = v17;
        }
        v15 = sub_19B1EBBA0(0, &qword_1EE3EF910);
        v16 = &off_1E3AAD090;
        *(_QWORD *)&v14 = v13;
        *(_QWORD *)(v3 + 16) = v12 + 1;
        sub_19B1F4D28(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_19B1EEC38(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

id sub_19B1EEC4C()
{
  id *v0;
  id v1;
  unint64_t v2;

  v1 = objc_msgSend(*v0, sel_results);
  if (v1)
  {
    sub_19B1EBBA0(0, &qword_1EE3EF910);
    v2 = sub_19B42907C();

    v1 = (id)sub_19B1EEA48(v2);
    swift_bridgeObjectRelease();
  }
  return v1;
}

uint64_t HMAccessoryMatterCapabilities.contentVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

HomeKit::HMAccessoryMatterCapabilities::AssetFilename_optional __swiftcall HMAccessoryMatterCapabilities.AssetFilename.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  HomeKit::HMAccessoryMatterCapabilities::AssetFilename_optional result;
  char v5;

  v2 = v1;
  v3 = sub_19B429220();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.AssetFilename.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x2D6465776F6C6C61;
  else
    return 0xD000000000000019;
}

uint64_t sub_19B1EED7C(char *a1, char *a2)
{
  return sub_19B1EC220(*a1, *a2);
}

uint64_t sub_19B1EED88()
{
  return sub_19B1EC4AC();
}

uint64_t sub_19B1EED90()
{
  return sub_19B1EC544();
}

uint64_t sub_19B1EED98()
{
  return sub_19B1EC6FC();
}

HomeKit::HMAccessoryMatterCapabilities::AssetFilename_optional sub_19B1EEDA0(Swift::String *a1)
{
  return HMAccessoryMatterCapabilities.AssetFilename.init(rawValue:)(*a1);
}

uint64_t sub_19B1EEDAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HMAccessoryMatterCapabilities.AssetFilename.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.init(type:)(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_BYTE *)(v2 + 81) = *a2;
  return swift_task_switch();
}

uint64_t sub_19B1EEDF0()
{
  uint64_t v0;
  _QWORD *v1;

  *(_BYTE *)(v0 + 80) = *(_BYTE *)(v0 + 81);
  *(_QWORD *)(v0 + 40) = &type metadata for DefaultMobileAssetDataSource;
  *(_QWORD *)(v0 + 48) = &off_1E3AAD6C8;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_19B1EEE68;
  return sub_19B1EEEE0(*(_QWORD *)(v0 + 56), (_BYTE *)(v0 + 80), v0 + 16);
}

uint64_t sub_19B1EEE68()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B1EEED4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B1EEEE0(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;

  *(_QWORD *)(v3 + 272) = a1;
  *(_QWORD *)(v3 + 280) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF918);
  *(_QWORD *)(v3 + 288) = swift_task_alloc();
  v5 = sub_19B428F44();
  *(_QWORD *)(v3 + 296) = v5;
  *(_QWORD *)(v3 + 304) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 312) = swift_task_alloc();
  *(_QWORD *)(v3 + 320) = swift_task_alloc();
  *(_BYTE *)(v3 + 336) = *a2;
  return swift_task_switch();
}

void sub_19B1EEF80()
{
  _QWORD *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  sub_19B1F4E88(v0[35], v0[34]);
  v1 = objc_allocWithZone(MEMORY[0x1E0D4E050]);
  v2 = (void *)sub_19B429004();
  v3 = objc_msgSend(v1, sel_initWithType_, v2);

  if (v3)
  {
    v0[18] = sub_19B1EBBA0(0, &qword_1EE3EF920);
    v0[19] = &off_1E3AAD0A8;
    v0[15] = v3;
    objc_msgSend(v3, sel_returnTypes_, 1);
    v0[7] = v0 + 30;
    v0[2] = v0;
    v0[3] = sub_19B1EF0B0;
    v4 = swift_continuation_init();
    v0[20] = MEMORY[0x1E0C809B0];
    v5 = v0 + 20;
    v5[1] = 0x40000000;
    v5[2] = sub_19B1EEC38;
    v5[3] = &block_descriptor_1;
    v5[4] = v4;
    objc_msgSend(v3, sel_queryMetaData_, v5);
    swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_19B1EF0B0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 328) = *(_QWORD *)(*(_QWORD *)v0 + 240);
  return swift_task_switch();
}

uint64_t sub_19B1EF100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void (*v11)(_QWORD, _QWORD);
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  sub_19B1EF9FC(*(_QWORD *)(v0 + 328), (_QWORD *)(v0 + 120), v0 + 80);
  v1 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 288);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  sub_19B1F4D28((__int128 *)(v0 + 80), v0 + 200);
  v4 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 232);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 200), v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_19B1EAC88(*(_QWORD *)(v0 + 288), &qword_1EE3EF918);
    sub_19B1F4D58();
    v6 = (void *)swift_allocError();
    *(_QWORD *)v7 = 0;
    *(_QWORD *)(v7 + 8) = 0;
    *(_BYTE *)(v7 + 16) = 2;
    swift_willThrow();
    if (qword_1EE3EF380 != -1)
      swift_once();
    v12 = sub_19B428FBC();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EE3EF758);
    v13 = v6;
    v14 = v6;
    v15 = sub_19B428FA4();
    v16 = sub_19B4290E8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138543362;
      v19 = v6;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 264) = v20;
      sub_19B429100();
      *v18 = v20;

      _os_log_impl(&dword_19B1B0000, v15, v16, "Unable to parse capabilities: %{public}@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF678);
      swift_arrayDestroy();
      MEMORY[0x1A1AC2040](v18, -1, -1);
      MEMORY[0x1A1AC2040](v17, -1, -1);
    }
    else
    {

    }
    v21 = *(_QWORD *)(v0 + 280);

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1Tm(v21);
    v22 = *(_QWORD *)(v0 + 272);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 200);
    __swift_destroy_boxed_opaque_existential_1Tm(v22);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 32))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 296));
    sub_19B428F2C();
    swift_bridgeObjectRelease();
    v8 = sub_19B428F50();
    v10 = v9;
    v11 = *(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8);
    v11(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
    sub_19B428F14();
    swift_allocObject();
    sub_19B428F08();
    sub_19B1F3878();
    sub_19B428EFC();
    swift_release();
    v26 = *(_QWORD *)(v0 + 272);
    v25 = *(_QWORD *)(v0 + 280);
    v11(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 296));
    sub_19B1F38BC(v8, v10);
    *(_QWORD *)(v26 + 40) = *(_QWORD *)(v0 + 256);
    v27 = *(_QWORD *)(v0 + 224);
    v28 = *(_QWORD *)(v0 + 232);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 200), v27);
    v29 = sub_19B1F05D0(v27, v28);
    LOBYTE(v28) = v30;
    __swift_destroy_boxed_opaque_existential_1Tm(v25);
    if ((v28 & 1) != 0)
      v31 = 0;
    else
      v31 = v29;
    *(_QWORD *)(v26 + 48) = v31;
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 200);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v23();
}

uint64_t HMAccessoryMatterCapabilities.init(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;

  a3[3] = &type metadata for DefaultMobileAssetDataSource;
  a3[4] = &off_1E3AAD6C8;
  sub_19B428F14();
  swift_allocObject();
  sub_19B428F08();
  sub_19B1F3878();
  sub_19B428EFC();
  swift_release();
  result = sub_19B1F38BC(a1, a2);
  if (v3)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a3);
  a3[5] = v8;
  a3[6] = 0;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.isCapabilityAllowed(_:vendorID:productID:)(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t result;
  uint64_t v17;

  v4 = *(_QWORD *)(v3 + 40);
  if (*(_QWORD *)(v4 + 16))
  {
    v5 = *a1;
    v6 = *((_BYTE *)a1 + 8);
    v7 = *a3;
    v8 = sub_19B1F175C(*a2);
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v8);
      if (*(_QWORD *)(v10 + 16))
      {
        v11 = sub_19B1F175C(v7);
        if ((v12 & 1) != 0)
        {
          v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
          v14 = *(_QWORD *)(v13 + 16);
          if (v14)
          {
            v15 = (_BYTE *)(v13 + 40);
            result = 1;
            do
            {
              v17 = *((_QWORD *)v15 - 1);
              if (v6 < 0)
              {
                if ((*v15 & 0x80) != 0 && v5 >= v17)
                  return 1;
              }
              else if ((*v15 & 0x80) == 0)
              {
                if ((v6 & 1) != 0)
                  return result;
                if ((*v15 & 1) != 0 || v5 >= v17)
                  return result;
              }
              v15 += 16;
              --v14;
            }
            while (v14);
          }
        }
      }
    }
  }
  return 0;
}

uint64_t HMAccessoryMatterCapabilities.debugDescription.getter()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF878);
  sub_19B1F3900();
  v0 = sub_19B428FE0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_19B1EF98C()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF878);
  sub_19B1F3900();
  v0 = sub_19B428FE0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_19B1EF9FC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  unint64_t v37;
  uint64_t v38;
  __int128 *v39;
  _OWORD v40[3];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  if (a1)
  {
    if (qword_1EE3EF380 != -1)
      swift_once();
    v5 = sub_19B428FBC();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EE3EF758);
    v6 = sub_19B428FA4();
    v7 = sub_19B4290E8();
    if (!os_log_type_enabled(v6, v7))
      goto LABEL_33;
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 134217984;
    *(_QWORD *)&v49 = a1;
    sub_19B429100();
    v9 = "Unable to query metadata: %ld";
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = 12;
    goto LABEL_32;
  }
  v14 = v3;
  v16 = a2[3];
  v17 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v16);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
  if (!v18)
  {
    if (qword_1EE3EF380 == -1)
    {
LABEL_24:
      v32 = sub_19B428FBC();
      __swift_project_value_buffer(v32, (uint64_t)qword_1EE3EF758);
      v6 = sub_19B428FA4();
      v33 = sub_19B4290E8();
      if (!os_log_type_enabled(v6, v33))
      {
LABEL_33:

        sub_19B1F4D58();
        swift_allocError();
        *(_QWORD *)v35 = 0;
        *(_QWORD *)(v35 + 8) = 0;
        *(_BYTE *)(v35 + 16) = 2;
        return swift_willThrow();
      }
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      v9 = "No results for metadata";
      goto LABEL_31;
    }
LABEL_45:
    swift_once();
    goto LABEL_24;
  }
  v52 = a3;
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v20 = v18 + 32;
    swift_bridgeObjectRetain();
    v21 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    do
    {
      sub_19B1F4E88(v20, (uint64_t)&v44);
      sub_19B1F0020(&v44, (uint64_t)&v49);
      if (v14)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v44);
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        __break(1u);
        return result;
      }
      v14 = 0;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v44);
      if ((_QWORD)v51)
      {
        v46 = v49;
        v47 = v50;
        v48 = v51;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v21 = sub_19B1F0F30(0, v21[2] + 1, 1, v21);
        v23 = v21[2];
        v22 = v21[3];
        if (v23 >= v22 >> 1)
          v21 = sub_19B1F0F30((_QWORD *)(v22 > 1), v23 + 1, 1, v21);
        v21[2] = v23 + 1;
        v24 = &v21[6 * v23];
        v25 = v46;
        v26 = v48;
        v24[3] = v47;
        v24[4] = v26;
        v24[2] = v25;
      }
      else
      {
        sub_19B1EAC88((uint64_t)&v49, &qword_1EE3EF930);
      }
      v20 += 40;
      --v19;
    }
    while (v19);
    swift_bridgeObjectRelease_n();
    v27 = v21[2];
    if (!v27)
      goto LABEL_27;
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v27 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    if (!v27)
    {
LABEL_27:
      swift_bridgeObjectRelease();
      if (qword_1EE3EF380 != -1)
        swift_once();
      v34 = sub_19B428FBC();
      __swift_project_value_buffer(v34, (uint64_t)qword_1EE3EF758);
      v6 = sub_19B428FA4();
      v33 = sub_19B4290E8();
      if (!os_log_type_enabled(v6, v33))
        goto LABEL_33;
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      v9 = "Empty results for metadata";
LABEL_31:
      v10 = v6;
      v11 = v33;
      v12 = v8;
      v13 = 2;
LABEL_32:
      _os_log_impl(&dword_19B1B0000, v10, v11, v9, v12, v13);
      MEMORY[0x1A1AC2040](v8, -1, -1);
      goto LABEL_33;
    }
  }
  if (qword_1EE3EF380 != -1)
    swift_once();
  v28 = sub_19B428FBC();
  __swift_project_value_buffer(v28, (uint64_t)qword_1EE3EF758);
  swift_bridgeObjectRetain();
  v29 = sub_19B428FA4();
  v30 = sub_19B4290DC();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v31 = 134217984;
    *(_QWORD *)&v49 = v21[2];
    sub_19B429100();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19B1B0000, v29, v30, "Filtering %ld results", v31, 0xCu);
    MEMORY[0x1A1AC2040](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  if (v21[2] < v27)
  {
    __break(1u);
    goto LABEL_45;
  }
  sub_19B1F5000((uint64_t)(v21 + 4), (uint64_t)&v46, &qword_1EE3EF938);
  v44 = v46;
  sub_19B1F4D28((__int128 *)((char *)&v46 + 8), (uint64_t)&v45);
  sub_19B1F5000((uint64_t)&v44, (uint64_t)&v41, &qword_1EE3EF938);
  v37 = v27 - 1;
  if (v37)
  {
    swift_bridgeObjectRetain();
    v38 = (uint64_t)(v21 + 10);
    do
    {
      sub_19B1F5000(v38, (uint64_t)&v49, &qword_1EE3EF938);
      if ((uint64_t)v41 >= (uint64_t)v49)
        v39 = &v41;
      else
        v39 = &v49;
      sub_19B1F5000((uint64_t)v39, (uint64_t)v40, &qword_1EE3EF938);
      sub_19B1EAC88((uint64_t)&v49, &qword_1EE3EF938);
      sub_19B1EAC88((uint64_t)&v41, &qword_1EE3EF938);
      v41 = v40[0];
      v42 = v40[1];
      v43 = v40[2];
      v38 += 48;
      --v37;
    }
    while (v37);
    swift_bridgeObjectRelease();
  }
  v49 = v41;
  v50 = v42;
  v51 = v43;
  sub_19B1EAC88((uint64_t)&v44, &qword_1EE3EF938);
  swift_bridgeObjectRelease();
  sub_19B1F4D28((__int128 *)((char *)&v49 + 8), (uint64_t)&v46 + 8);
  return sub_19B1F4D28((__int128 *)((char *)&v46 + 8), v52);
}

void sub_19B1F0020(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;

  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  v6 = sub_19B1F05D0(v4, v5);
  if ((v7 & 1) != 0)
  {
    if (qword_1EE3EF380 != -1)
      swift_once();
    v14 = sub_19B428FBC();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EE3EF758);
    sub_19B1F4E88((uint64_t)a1, (uint64_t)v43);
    v15 = sub_19B428FA4();
    v16 = sub_19B4290D0();
    if (!os_log_type_enabled(v15, v16))
      goto LABEL_19;
    v17 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    v45 = v18;
    v41 = a2;
    *(_DWORD *)v17 = 136315138;
    v40 = v17 + 4;
    v19 = __swift_project_boxed_opaque_existential_1(v43, v44);
    MEMORY[0x1E0C80A78](v19);
    (*(void (**)(char *))(v21 + 16))((char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
    v22 = sub_19B42901C();
    v42 = sub_19B1F1054(v22, v23, &v45);
    a2 = v41;
    sub_19B429100();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    v24 = "Ignoring asset due to missing content version: %s";
  }
  else
  {
    v8 = v6;
    v9 = a1[3];
    v10 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v9);
    v11 = sub_19B1F05D0(v9, v10);
    if ((v12 & 1) == 0)
    {
      v13 = v11;
      if (v11 == 2)
      {
        *(_QWORD *)a2 = v8;
        sub_19B1F4E88((uint64_t)a1, a2 + 8);
        return;
      }
      if (qword_1EE3EF380 != -1)
        swift_once();
      v32 = sub_19B428FBC();
      __swift_project_value_buffer(v32, (uint64_t)qword_1EE3EF758);
      sub_19B1F4E88((uint64_t)a1, (uint64_t)v43);
      v15 = sub_19B428FA4();
      v33 = sub_19B4290D0();
      if (os_log_type_enabled(v15, v33))
      {
        v17 = swift_slowAlloc();
        v41 = swift_slowAlloc();
        v42 = v13;
        v45 = v41;
        *(_DWORD *)v17 = 134218242;
        sub_19B429100();
        *(_WORD *)(v17 + 12) = 2080;
        v40 = v17 + 14;
        v34 = __swift_project_boxed_opaque_existential_1(v43, v44);
        MEMORY[0x1E0C80A78](v34);
        (*(void (**)(char *))(v36 + 16))((char *)&v40 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
        v37 = sub_19B42901C();
        v42 = sub_19B1F1054(v37, v38, &v45);
        sub_19B429100();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
        _os_log_impl(&dword_19B1B0000, v15, v33, "Ignoring asset due to compatibility version: %ld: %s", (uint8_t *)v17, 0x16u);
        v39 = v41;
        swift_arrayDestroy();
        v31 = v39;
        goto LABEL_14;
      }
LABEL_19:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
      goto LABEL_20;
    }
    if (qword_1EE3EF380 != -1)
      swift_once();
    v25 = sub_19B428FBC();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EE3EF758);
    sub_19B1F4E88((uint64_t)a1, (uint64_t)v43);
    v15 = sub_19B428FA4();
    v16 = sub_19B4290D0();
    if (!os_log_type_enabled(v15, v16))
      goto LABEL_19;
    v41 = a2;
    v17 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    v45 = v18;
    *(_DWORD *)v17 = 136315138;
    v40 = v17 + 4;
    v26 = __swift_project_boxed_opaque_existential_1(v43, v44);
    MEMORY[0x1E0C80A78](v26);
    (*(void (**)(char *))(v28 + 16))((char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    v29 = sub_19B42901C();
    v42 = sub_19B1F1054(v29, v30, &v45);
    sub_19B429100();
    a2 = v41;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    v24 = "Ignoring asset due to missing compatibility version: %s";
  }
  _os_log_impl(&dword_19B1B0000, v15, v16, v24, (uint8_t *)v17, 0xCu);
  swift_arrayDestroy();
  v31 = v18;
LABEL_14:
  MEMORY[0x1A1AC2040](v31, -1, -1);
  MEMORY[0x1A1AC2040](v17, -1, -1);
LABEL_20:

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
}

uint64_t sub_19B1F05D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;

  v2 = (*(uint64_t (**)(void))(a2 + 8))();
  if (!v2)
  {
    v9 = 0u;
    v10 = 0u;
LABEL_12:
    sub_19B1EAC88((uint64_t)&v9, &qword_1EE3EF610);
    return 0;
  }
  v3 = v2;
  *(_QWORD *)&v9 = sub_19B429010();
  *((_QWORD *)&v9 + 1) = v4;
  sub_19B429148();
  if (*(_QWORD *)(v3 + 16) && (v5 = sub_19B1F17C0((uint64_t)v8), (v6 & 1) != 0))
  {
    sub_19B1F4DD0(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v9);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_19B1F4D9C((uint64_t)v8);
  if (!*((_QWORD *)&v10 + 1))
    goto LABEL_12;
  if (swift_dynamicCast())
    return v8[0];
  else
    return 0;
}

HomeKit::HMAccessoryMatterCapabilities::VendorID_optional __swiftcall HMAccessoryMatterCapabilities.VendorID.init(rawValue:)(Swift::Int rawValue)
{
  uint64_t v1;
  HomeKit::HMAccessoryMatterCapabilities::VendorID_optional result;

  *(_QWORD *)v1 = rawValue;
  *(_BYTE *)(v1 + 8) = 0;
  result.value.rawValue = rawValue;
  return result;
}

HomeKit::HMAccessoryMatterCapabilities::VendorID __swiftcall HMAccessoryMatterCapabilities.VendorID.init(_:)(HomeKit::HMAccessoryMatterCapabilities::VendorID result)
{
  HomeKit::HMAccessoryMatterCapabilities::VendorID *v1;

  v1->rawValue = result.rawValue;
  return result;
}

uint64_t HMAccessoryMatterCapabilities.VendorID.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t HMAccessoryMatterCapabilities.VendorID.rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*HMAccessoryMatterCapabilities.VendorID.rawValue.modify())()
{
  return nullsub_1;
}

_QWORD *sub_19B1F0704@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_19B1F0714(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_19B1F0724()
{
  return sub_19B4292E0();
}

uint64_t sub_19B1F0750()
{
  sub_19B1F4CE4();
  return sub_19B429058();
}

uint64_t sub_19B1F07AC()
{
  sub_19B1F4CE4();
  return sub_19B42904C();
}

BOOL sub_19B1F07F8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t HMAccessoryMatterCapabilities.ProductID.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t (*HMAccessoryMatterCapabilities.ProductID.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t sub_19B1F0824()
{
  sub_19B4292D4();
  sub_19B4292E0();
  return sub_19B4292EC();
}

uint64_t sub_19B1F0868()
{
  sub_19B4292D4();
  sub_19B4292E0();
  return sub_19B4292EC();
}

uint64_t sub_19B1F08A8()
{
  sub_19B1F4CA0();
  return sub_19B429058();
}

uint64_t sub_19B1F0904()
{
  sub_19B1F4CA0();
  return sub_19B42904C();
}

void sub_19B1F0950(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v3 = *a2;
  v4 = *((char *)a2 + 8);
  v5 = *(_QWORD **)a1;
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v6)
  {
    v7 = (char *)(v5 + 5);
    v8 = *(_QWORD *)(*(_QWORD *)a1 + 16);
    while (1)
    {
      v9 = v4 >= 0;
      v10 = *v7;
      v7 += 16;
      if (v10 < 0)
        v9 = v4 < 0;
      if (v9)
        break;
      if (!--v8)
        goto LABEL_7;
    }
    if (qword_1EE3EF380 != -1)
      swift_once();
    v14 = sub_19B428FBC();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EE3EF758);
    v15 = sub_19B428FA4();
    v16 = sub_19B4290E8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v21 = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = sub_19B42901C();
      sub_19B1F1054(v19, v20, &v21);
      sub_19B429100();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_19B1B0000, v15, v16, "Dropping capability %s because of a duplicate entry", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A1AC2040](v18, -1, -1);
      MEMORY[0x1A1AC2040](v17, -1, -1);
    }

  }
  else
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v5 = sub_19B1F0D18(0, v6 + 1, 1, v5);
    v12 = v5[2];
    v11 = v5[3];
    if (v12 >= v11 >> 1)
      v5 = sub_19B1F0D18((_QWORD *)(v11 > 1), v12 + 1, 1, v5);
    v5[2] = v12 + 1;
    v13 = &v5[2 * v12];
    v13[4] = v3;
    *((_BYTE *)v13 + 40) = v4;
    *(_QWORD *)a1 = v5;
  }
}

uint64_t sub_19B1F0B90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_19B1F29A4(a1, (uint64_t)sub_19B1F2F68, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

_QWORD *sub_19B1F0C0C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF978);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19B1F3220(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_19B1F0D18(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF950);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19B1F49D8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_19B1F0E24(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF958);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19B1F4AC0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_19B1F0F30(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF940);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_19B1F4ECC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_19B1F1054(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_19B1F1124(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_19B1F4DD0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_19B1F4DD0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_19B1F1124(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_19B42910C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_19B1F12DC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_19B429178();
  if (!v8)
  {
    sub_19B4291CC();
    __break(1u);
LABEL_17:
    result = sub_19B429214();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_19B1F12DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_19B1F1370(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_19B1F1548(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_19B1F1548(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19B1F1370(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_19B1F14E4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_19B429160();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_19B4291CC();
      __break(1u);
LABEL_10:
      v2 = sub_19B429040();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_19B429214();
    __break(1u);
LABEL_14:
    result = sub_19B4291CC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_19B1F14E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF948);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19B1F1548(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF948);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_19B429214();
  __break(1u);
  return result;
}

unint64_t sub_19B1F1694(uint64_t a1)
{
  uint64_t v2;

  sub_19B428F98();
  sub_19B1EB344(&qword_1EE3EF698, MEMORY[0x1E0CB09C8]);
  v2 = sub_19B428FEC();
  return sub_19B1F1E9C(a1, v2);
}

unint64_t sub_19B1F16F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_19B4292D4();
  sub_19B429028();
  v4 = sub_19B4292EC();
  return sub_19B1F1FD4(a1, a2, v4);
}

unint64_t sub_19B1F175C(uint64_t a1)
{
  uint64_t v2;

  sub_19B4292D4();
  sub_19B4292E0();
  v2 = sub_19B4292EC();
  return sub_19B1F20B4(a1, v2);
}

unint64_t sub_19B1F17C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_19B429130();
  return sub_19B1F2150(a1, v2);
}

uint64_t sub_19B1F17F0(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  v5 = sub_19B428F74();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x1E0C80A78]();
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_19B428F98();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF980);
  v11 = sub_19B4291FC();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_39;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_22;
    }
    if (__OFADD__(v19++, 1))
      goto LABEL_41;
    if (v19 >= v45)
      break;
    v26 = v46;
    v27 = v46[v19];
    if (!v27)
    {
      v28 = v19 + 1;
      if (v19 + 1 >= v45)
      {
LABEL_31:
        v40 = v48;
        swift_release();
        v3 = v44;
        if ((v43 & 1) == 0)
          goto LABEL_39;
        goto LABEL_35;
      }
      v27 = v46[v28];
      if (!v27)
      {
        while (1)
        {
          v19 = v28 + 1;
          if (__OFADD__(v28, 1))
            break;
          if (v19 >= v45)
            goto LABEL_31;
          v27 = v46[v19];
          ++v28;
          if (v27)
            goto LABEL_21;
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v19;
    }
LABEL_21:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_22:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_19B1EB344(&qword_1EE3EF698, MEMORY[0x1E0CB09C8]);
    result = sub_19B428FEC();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_39;
LABEL_35:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_39:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_19B1F1BC8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  result = sub_19B4291FC();
  v8 = result;
  if (*(_QWORD *)(v6 + 16))
  {
    v9 = 0;
    v33 = (_QWORD *)(v6 + 64);
    v10 = 1 << *(_BYTE *)(v6 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v6 + 64);
    v32 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v9 << 6);
      }
      else
      {
        v21 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v6 + 64;
        if (v21 >= v32)
          goto LABEL_33;
        v22 = v33[v21];
        ++v9;
        if (!v22)
        {
          v9 = v21 + 1;
          if (v21 + 1 >= v32)
            goto LABEL_33;
          v22 = v33[v9];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v32)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v4 = v3;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v6 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v4 = v3;
              *(_QWORD *)(v6 + 16) = 0;
              break;
            }
            v22 = v33[v23];
            if (!v22)
            {
              while (1)
              {
                v9 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v9 >= v32)
                  goto LABEL_33;
                v22 = v33[v9];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v9 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v9 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_19B4292D4();
      sub_19B4292E0();
      result = sub_19B4292EC();
      v14 = -1 << *(_BYTE *)(v8 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v18) = v30;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v4 = v8;
  return result;
}

unint64_t sub_19B1F1E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_19B428F98();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_19B1EB344(&qword_1EE3EF988, MEMORY[0x1E0CB09D0]);
      v14 = sub_19B428FF8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_19B1F1FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_19B429280() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_19B429280() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_19B1F20B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_19B1F2150(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_19B1F4E0C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1A1AC1230](v9, a1);
      sub_19B1F4D9C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

char *sub_19B1F2214()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  unint64_t v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;

  v1 = v0;
  v37 = sub_19B428F74();
  v33 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78]();
  v36 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_19B428F98();
  v32 = *(_QWORD *)(v35 - 8);
  MEMORY[0x1E0C80A78]();
  v34 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF980);
  v4 = *v0;
  v5 = sub_19B4291F0();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = (char *)swift_release();
LABEL_25:
    *v1 = v6;
    return result;
  }
  result = (char *)(v5 + 64);
  v8 = (char *)(v4 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v30 = v1;
  v31 = v4 + 64;
  if (v6 != v4 || result >= &v8[8 * v9])
    result = (char *)memmove(result, v8, 8 * v9);
  v10 = 0;
  v11 = *(_QWORD *)(v4 + 16);
  v38 = v4;
  v39 = v6;
  *(_QWORD *)(v6 + 16) = v11;
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v40 = (unint64_t)(v12 + 63) >> 6;
  v15 = v32;
  v16 = v33;
  v17 = v34;
  v18 = v36;
  v19 = v6;
  while (1)
  {
    if (v14)
    {
      v41 = (v14 - 1) & v14;
      v20 = __clz(__rbit64(v14)) | (v10 << 6);
      v21 = v38;
      goto LABEL_9;
    }
    v27 = __OFADD__(v10++, 1);
    v21 = v38;
    if (v27)
      goto LABEL_27;
    if (v10 >= v40)
    {
LABEL_24:
      result = (char *)swift_release();
      v1 = v30;
      v6 = v39;
      goto LABEL_25;
    }
    v28 = *(_QWORD *)(v31 + 8 * v10);
    if (!v28)
      break;
LABEL_21:
    v41 = (v28 - 1) & v28;
    v20 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_9:
    v22 = *(_QWORD *)(v15 + 72) * v20;
    v23 = v35;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v17, *(_QWORD *)(v21 + 48) + v22, v35);
    v24 = *(_QWORD *)(v16 + 72) * v20;
    v25 = *(_QWORD *)(v21 + 56) + v24;
    v26 = v37;
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v18, v25, v37);
    (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 48) + v22, v17, v23);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(_QWORD *)(v19 + 56) + v24, v18, v26);
    v14 = v41;
  }
  v29 = v10 + 1;
  if (v10 + 1 >= v40)
    goto LABEL_24;
  v28 = *(_QWORD *)(v31 + 8 * v29);
  if (v28)
  {
    ++v10;
    goto LABEL_21;
  }
  v6 = v39;
  while (1)
  {
    v10 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v10 >= v40)
    {
      result = (char *)swift_release();
      v1 = v30;
      goto LABEL_25;
    }
    v28 = *(_QWORD *)(v31 + 8 * v10);
    ++v29;
    if (v28)
      goto LABEL_21;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_19B1F24E8(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_19B4291F0();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_26;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_25:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = *(_QWORD *)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v21 = v19 + 2;
  if (v21 >= v14)
    goto LABEL_26;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_19B1F2680(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v31[2];
  id v32;
  uint64_t v33[3];

  v5 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v28 = v5;
  if (!v5)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return;
  }
  v6 = 0;
  v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    if (v6 >= *(_QWORD *)(a1 + 16))
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      sub_19B429298();
      __break(1u);
      goto LABEL_26;
    }
    v9 = *(v7 - 1);
    v8 = *v7;
    swift_bridgeObjectRetain();
    if (!v8)
      goto LABEL_18;
    v33[2] = v9;
    v33[0] = v8;
    v10 = *(_QWORD **)a3;
    v12 = sub_19B1F175C(v9);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      goto LABEL_23;
    v16 = v11;
    if (v10[3] < v15)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_13;
    }
    else
    {
      sub_19B1F24E8(&qword_1EE3EF7A0);
      if ((v16 & 1) != 0)
        goto LABEL_13;
    }
LABEL_16:
    v22 = *(_QWORD **)a3;
    *(_QWORD *)(*(_QWORD *)a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v23 = 8 * v12;
    *(_QWORD *)(v22[6] + v23) = v9;
    *(_QWORD *)(v22[7] + v23) = v8;
    v24 = v22[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_24;
    v22[2] = v26;
LABEL_3:
    ++v6;
    v7 += 2;
    a2 = 1;
    if (v28 == v6)
      goto LABEL_18;
  }
  sub_19B1F1BC8(v15, a2 & 1, &qword_1EE3EF7A0);
  v17 = sub_19B1F175C(v9);
  if ((v16 & 1) != (v18 & 1))
    goto LABEL_25;
  v12 = v17;
  if ((v16 & 1) == 0)
    goto LABEL_16;
LABEL_13:
  v19 = *(_QWORD **)a3;
  v32 = *(id *)(*(_QWORD *)(*(_QWORD *)a3 + 56) + 8 * v12);
  swift_bridgeObjectRetain();
  sub_19B1ED8E0((uint64_t *)&v32, v33, v31);
  if (!v29)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v20 = v19[7];
    v21 = v31[0];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v20 + 8 * v12) = v21;
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v32 = v29;
  v27 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF4D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_26:
  v31[0] = 0;
  v31[1] = 0xE000000000000000;
  sub_19B429154();
  sub_19B429034();
  sub_19B4291C0();
  sub_19B429034();
  sub_19B4291D8();
  __break(1u);
}

uint64_t sub_19B1F29A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **p_vtable;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  void **v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t result;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v63 = a1;
  v64 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v65 = v8;
  v66 = 0;
  v67 = v11 & v9;
  v68 = a2;
  v69 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_19B1F2F74(&v61);
  v12 = v62;
  if (v62)
  {
    p_vtable = &OBJC_METACLASS___HMDeviceSetupRequestMessage.vtable;
    v56 = a5;
    while (1)
    {
      v18 = v61;
      v19 = (_QWORD *)*a5;
      v21 = sub_19B1F175C(v61);
      v22 = v19[2];
      v23 = (v20 & 1) == 0;
      v24 = v22 + v23;
      if (__OFADD__(v22, v23))
        break;
      v25 = v20;
      if (v19[3] >= v24)
      {
        if ((a4 & 1) == 0)
          sub_19B1F24E8(&qword_1EE3EF798);
      }
      else
      {
        sub_19B1F1BC8(v24, a4 & 1, &qword_1EE3EF798);
        v26 = sub_19B1F175C(v18);
        if ((v25 & 1) != (v27 & 1))
          goto LABEL_41;
        v21 = v26;
      }
      v15 = (_QWORD *)*a5;
      v16 = 8 * v21;
      if ((v25 & 1) != 0)
      {
        v14 = *(_QWORD **)(v15[7] + 8 * v21);
        v28 = *(_QWORD *)(v12 + 16);
        if (v28)
        {
          v57 = 8 * v21;
          v58 = (_QWORD *)*a5;
          v29 = v12 + 32;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          v30 = v14;
          v31 = 0;
          v59 = v12 + 32;
          v60 = v28;
          do
          {
            v32 = (uint64_t *)(v29 + 16 * v31);
            v33 = *v32;
            v34 = *((char *)v32 + 8);
            v35 = v30[2];
            if (v35)
            {
              v36 = 5;
              v37 = v30[2];
              while (1)
              {
                v38 = v34 >= 0;
                if (SLOBYTE(v30[v36]) < 0)
                  v38 = v34 < 0;
                if (v38)
                  break;
                v36 += 2;
                if (!--v37)
                  goto LABEL_26;
              }
              if (p_vtable[112] != (void *)-1)
                swift_once();
              v42 = sub_19B428FBC();
              __swift_project_value_buffer(v42, (uint64_t)qword_1EE3EF758);
              v43 = sub_19B428FA4();
              v44 = sub_19B4290E8();
              if (os_log_type_enabled(v43, v44))
              {
                v45 = swift_slowAlloc();
                v46 = p_vtable;
                v47 = swift_slowAlloc();
                v70 = v47;
                *(_DWORD *)v45 = 136315138;
                v48 = sub_19B42901C();
                *(_QWORD *)(v45 + 4) = sub_19B1F1054(v48, v49, &v70);
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_19B1B0000, v43, v44, "Dropping capability %s because of a duplicate entry", (uint8_t *)v45, 0xCu);
                swift_arrayDestroy();
                v50 = v47;
                p_vtable = v46;
                v28 = v60;
                MEMORY[0x1A1AC2040](v50, -1, -1);
                v51 = v45;
                v29 = v59;
                MEMORY[0x1A1AC2040](v51, -1, -1);
              }

            }
            else
            {
LABEL_26:
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v30 = sub_19B1F0D18(0, v35 + 1, 1, v30);
              v40 = v30[2];
              v39 = v30[3];
              if (v40 >= v39 >> 1)
                v30 = sub_19B1F0D18((_QWORD *)(v39 > 1), v40 + 1, 1, v30);
              v30[2] = v40 + 1;
              v41 = &v30[2 * v40];
              v41[4] = v33;
              *((_BYTE *)v41 + 40) = v34;
            }
            ++v31;
          }
          while (v31 != v28);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v14 = v30;
          a5 = v56;
          v16 = v57;
          v15 = v58;
        }
        else
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
        v17 = v15[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v17 + v16) = v14;
      }
      else
      {
        v15[(v21 >> 6) + 8] |= 1 << v21;
        *(_QWORD *)(v15[6] + 8 * v21) = v18;
        *(_QWORD *)(v15[7] + 8 * v21) = v12;
        v52 = v15[2];
        v53 = __OFADD__(v52, 1);
        v54 = v52 + 1;
        if (v53)
          goto LABEL_40;
        v15[2] = v54;
      }
      sub_19B1F2F74(&v61);
      v12 = v62;
      a4 = 1;
      if (!v62)
        goto LABEL_38;
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    result = sub_19B429298();
    __break(1u);
  }
  else
  {
LABEL_38:
    swift_release();
    swift_bridgeObjectRelease();
    sub_19B1F4FF8();
    return swift_release();
  }
  return result;
}

uint64_t sub_19B1F2E20(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_19B1F0D18(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = &v3[2 * v9 + 4];
  if (a1 + 32 < (unint64_t)&v10[2 * v8] && (unint64_t)v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  memcpy(v10, (const void *)(a1 + 32), 16 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_19B429214();
  __break(1u);
  return result;
}

uint64_t sub_19B1F2F68@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19B1F2F74@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD *);
  uint64_t result;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  _QWORD v20[2];

  v3 = *v1;
  v5 = v1[3];
  v4 = v1[4];
  v6 = v5;
  if (v4)
  {
    v7 = (v4 - 1) & v4;
    v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
    v9 = 8 * v8;
    v10 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v8);
    v11 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v9);
    v1[3] = v6;
    v1[4] = v7;
    v12 = (void (*)(_QWORD *))v1[5];
    v20[0] = v10;
    v20[1] = v11;
    swift_bridgeObjectRetain();
    v12(v20);
    return swift_bridgeObjectRelease();
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v15 = (unint64_t)(v1[2] + 64) >> 6;
    if (v14 < v15)
    {
      v16 = v1[1];
      v17 = *(_QWORD *)(v16 + 8 * v14);
      if (v17)
      {
LABEL_7:
        v7 = (v17 - 1) & v17;
        v8 = __clz(__rbit64(v17)) + (v14 << 6);
        v6 = v14;
        goto LABEL_3;
      }
      v18 = v5 + 2;
      v6 = v5 + 1;
      if (v5 + 2 < v15)
      {
        v17 = *(_QWORD *)(v16 + 8 * v18);
        if (v17)
        {
LABEL_10:
          v14 = v18;
          goto LABEL_7;
        }
        v6 = v5 + 2;
        if (v5 + 3 < v15)
        {
          v17 = *(_QWORD *)(v16 + 8 * (v5 + 3));
          if (v17)
          {
            v14 = v5 + 3;
            goto LABEL_7;
          }
          v18 = v5 + 4;
          v6 = v5 + 3;
          if (v5 + 4 < v15)
          {
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (v17)
              goto LABEL_10;
            v14 = v5 + 5;
            v6 = v5 + 4;
            if (v5 + 5 < v15)
            {
              v17 = *(_QWORD *)(v16 + 8 * v14);
              if (v17)
                goto LABEL_7;
              v6 = v15 - 1;
              v19 = v5 + 6;
              while (v15 != v19)
              {
                v17 = *(_QWORD *)(v16 + 8 * v19++);
                if (v17)
                {
                  v14 = v19 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v6;
    v1[4] = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t sub_19B1F30F0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_19B1F3178()
{
  sub_19B4292D4();
  sub_19B429028();
  return sub_19B4292EC();
}

BOOL _s7HomeKit22AccessoryMFiCapabilityO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *((char *)a1 + 8);
  v4 = *a2;
  if (v3 < 0)
    return *((char *)a2 + 8) < 0 && v2 == v4;
  if ((a2[1] & 0x80) == 0)
  {
    if ((v3 & 1) != 0)
    {
      if ((a2[1] & 1) != 0)
        return 1;
    }
    else if ((a2[1] & 1) == 0 && v2 == v4)
    {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_19B1F3218()
{
  return 1;
}

uint64_t sub_19B1F3220(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_19B429214();
  __break(1u);
  return result;
}

unint64_t sub_19B1F3310(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF7A0);
  v3 = (_QWORD *)sub_19B429208();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_19B1F175C(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_bridgeObjectRetain();
    result = sub_19B1F175C(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_19B1F340C(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_19B1F345C()
{
  unint64_t result;

  result = qword_1EE3EF778;
  if (!qword_1EE3EF778)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C600, &type metadata for AccessoryMFiCapabilitiesList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF778);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A1AC1FBC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_19B1F34E4()
{
  unint64_t result;

  result = qword_1EE3EF790;
  if (!qword_1EE3EF790)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for AccessoryMFiCapabilitiesList.Vendor, &type metadata for AccessoryMFiCapabilitiesList.Vendor);
    atomic_store(result, (unint64_t *)&qword_1EE3EF790);
  }
  return result;
}

unint64_t sub_19B1F3528()
{
  unint64_t result;

  result = qword_1EE3EF7B8;
  if (!qword_1EE3EF7B8)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for AccessoryMFiCapabilitiesList.Vendor, &type metadata for AccessoryMFiCapabilitiesList.Vendor);
    atomic_store(result, (unint64_t *)&qword_1EE3EF7B8);
  }
  return result;
}

unint64_t sub_19B1F356C()
{
  unint64_t result;

  result = qword_1EE3EF7C8;
  if (!qword_1EE3EF7C8)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C5B0, &type metadata for AccessoryMFiCapabilitiesList.Product.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF7C8);
  }
  return result;
}

unint64_t sub_19B1F35B0()
{
  unint64_t result;

  result = qword_1EE3EF7D0;
  if (!qword_1EE3EF7D0)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.ProductID, &type metadata for HMAccessoryMatterCapabilities.ProductID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF7D0);
  }
  return result;
}

unint64_t sub_19B1F35F4()
{
  unint64_t result;

  result = qword_1EE3EF7E8;
  if (!qword_1EE3EF7E8)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C588, &type metadata for AccessoryMFiCapability.Representation);
    atomic_store(result, (unint64_t *)&qword_1EE3EF7E8);
  }
  return result;
}

unint64_t sub_19B1F3638()
{
  unint64_t result;

  result = qword_1EE3EF7F8;
  if (!qword_1EE3EF7F8)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.ProductID, &type metadata for HMAccessoryMatterCapabilities.ProductID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF7F8);
  }
  return result;
}

unint64_t sub_19B1F367C()
{
  unint64_t result;

  result = qword_1EE3EF808;
  if (!qword_1EE3EF808)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C560, &type metadata for AccessoryMFiCapability.Representation);
    atomic_store(result, (unint64_t *)&qword_1EE3EF808);
  }
  return result;
}

unint64_t sub_19B1F36C0()
{
  unint64_t result;

  result = qword_1EE3EF818;
  if (!qword_1EE3EF818)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C510, &type metadata for AccessoryMFiCapabilitiesList.Vendor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF818);
  }
  return result;
}

unint64_t sub_19B1F3704()
{
  unint64_t result;

  result = qword_1EE3EF820;
  if (!qword_1EE3EF820)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.VendorID, &type metadata for HMAccessoryMatterCapabilities.VendorID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF820);
  }
  return result;
}

unint64_t sub_19B1F3748()
{
  unint64_t result;

  result = qword_1EE3EF838;
  if (!qword_1EE3EF838)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for AccessoryMFiCapabilitiesList.Product, &type metadata for AccessoryMFiCapabilitiesList.Product);
    atomic_store(result, (unint64_t *)&qword_1EE3EF838);
  }
  return result;
}

unint64_t sub_19B1F378C()
{
  unint64_t result;

  result = qword_1EE3EF848;
  if (!qword_1EE3EF848)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.VendorID, &type metadata for HMAccessoryMatterCapabilities.VendorID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF848);
  }
  return result;
}

uint64_t sub_19B1F37D0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x1A1AC1FC8](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_19B1F3834()
{
  unint64_t result;

  result = qword_1EE3EF858;
  if (!qword_1EE3EF858)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for AccessoryMFiCapabilitiesList.Product, &type metadata for AccessoryMFiCapabilitiesList.Product);
    atomic_store(result, (unint64_t *)&qword_1EE3EF858);
  }
  return result;
}

unint64_t sub_19B1F3878()
{
  unint64_t result;

  result = qword_1EE3EF870;
  if (!qword_1EE3EF870)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for AccessoryMFiCapabilitiesList, &type metadata for AccessoryMFiCapabilitiesList);
    atomic_store(result, (unint64_t *)&qword_1EE3EF870);
  }
  return result;
}

uint64_t sub_19B1F38BC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

unint64_t sub_19B1F3900()
{
  unint64_t result;

  result = qword_1EE3EF880;
  if (!qword_1EE3EF880)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.VendorID, &type metadata for HMAccessoryMatterCapabilities.VendorID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF880);
  }
  return result;
}

unint64_t sub_19B1F3948()
{
  unint64_t result;

  result = qword_1EE3EF888;
  if (!qword_1EE3EF888)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.AssetFilename, &type metadata for HMAccessoryMatterCapabilities.AssetFilename);
    atomic_store(result, (unint64_t *)&qword_1EE3EF888);
  }
  return result;
}

unint64_t sub_19B1F3990()
{
  unint64_t result;

  result = qword_1EE3EF890;
  if (!qword_1EE3EF890)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.VendorID, &type metadata for HMAccessoryMatterCapabilities.VendorID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF890);
  }
  return result;
}

unint64_t sub_19B1F39D8()
{
  unint64_t result;

  result = qword_1EE3EF898;
  if (!qword_1EE3EF898)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.ProductID, &type metadata for HMAccessoryMatterCapabilities.ProductID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF898);
  }
  return result;
}

id sub_19B1F3A20(id result, uint64_t a2, char a3)
{
  if (a3 == 1)
    return (id)swift_bridgeObjectRetain();
  if (!a3)
    return result;
  return result;
}

void destroy for AssetError(uint64_t a1)
{
  sub_19B1F3A50(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_19B1F3A50(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {

  }
}

uint64_t _s7HomeKit10AssetErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_19B1F3A20(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AssetError(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_19B1F3A20(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_19B1F3A50(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AssetError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_19B1F3A50(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_19B1F3BF0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_19B1F3C08(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AssetError()
{
  return &type metadata for AssetError;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccessoryMFiCapability(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 127);
  v3 = (*(_BYTE *)(a1 + 8) & 0x7E | (*(unsigned __int8 *)(a1 + 8) >> 7)) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AccessoryMFiCapability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 8) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_19B1F3CEC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_19B1F3CF8(uint64_t result)
{
  *(_BYTE *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_19B1F3D08(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapability()
{
  return &type metadata for AccessoryMFiCapability;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList()
{
  return &type metadata for AccessoryMFiCapabilitiesList;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Product()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Product;
}

_QWORD *initializeBufferWithCopyOfBuffer for AccessoryMFiCapabilitiesList.Vendor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s7HomeKit28AccessoryMFiCapabilitiesListV7ProductVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for AccessoryMFiCapabilitiesList.Vendor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7HomeKit28AccessoryMFiCapabilitiesListV7ProductVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_19B1F3E48(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Vendor()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Vendor;
}

uint64_t destroy for HMAccessoryMatterCapabilities(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HMAccessoryMatterCapabilities(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for HMAccessoryMatterCapabilities(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for HMAccessoryMatterCapabilities(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for HMAccessoryMatterCapabilities(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HMAccessoryMatterCapabilities(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities()
{
  return &type metadata for HMAccessoryMatterCapabilities;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities.AssetFilename()
{
  return &type metadata for HMAccessoryMatterCapabilities.AssetFilename;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities.VendorID()
{
  return &type metadata for HMAccessoryMatterCapabilities.VendorID;
}

ValueMetadata *type metadata accessor for HMAccessoryMatterCapabilities.ProductID()
{
  return &type metadata for HMAccessoryMatterCapabilities.ProductID;
}

ValueMetadata *type metadata accessor for DefaultMobileAssetDataSource()
{
  return &type metadata for DefaultMobileAssetDataSource;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Vendor.CodingKeys()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Vendor.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for AccessoryMFiCapability.Representation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AccessoryMFiCapability.Representation()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccessoryMFiCapability.Representation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccessoryMFiCapability.Representation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AccessoryMFiCapability.Representation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessoryMFiCapability.Representation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccessoryMFiCapability.Representation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapability.Representation()
{
  return &type metadata for AccessoryMFiCapability.Representation;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.Product.CodingKeys()
{
  return &type metadata for AccessoryMFiCapabilitiesList.Product.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AccessoryMFiCapabilitiesList.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for AccessoryMFiCapabilitiesList.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_19B1F448C + 4 * byte_19B44BCC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_19B1F44AC + 4 * byte_19B44BCC5[v4]))();
}

_BYTE *sub_19B1F448C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_19B1F44AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_19B1F44B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_19B1F44BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_19B1F44C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_19B1F44CC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_19B1F44D8()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapabilitiesList.CodingKeys()
{
  return &type metadata for AccessoryMFiCapabilitiesList.CodingKeys;
}

unint64_t sub_19B1F44F4()
{
  unint64_t result;

  result = qword_1EE3EF8A0;
  if (!qword_1EE3EF8A0)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C330, &type metadata for AccessoryMFiCapabilitiesList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8A0);
  }
  return result;
}

unint64_t sub_19B1F453C()
{
  unint64_t result;

  result = qword_1EE3EF8A8;
  if (!qword_1EE3EF8A8)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C420, &type metadata for AccessoryMFiCapabilitiesList.Product.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8A8);
  }
  return result;
}

unint64_t sub_19B1F4584()
{
  unint64_t result;

  result = qword_1EE3EF8B0;
  if (!qword_1EE3EF8B0)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C4D8, &type metadata for AccessoryMFiCapabilitiesList.Vendor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8B0);
  }
  return result;
}

unint64_t sub_19B1F45CC()
{
  unint64_t result;

  result = qword_1EE3EF8B8;
  if (!qword_1EE3EF8B8)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C448, &type metadata for AccessoryMFiCapabilitiesList.Vendor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8B8);
  }
  return result;
}

unint64_t sub_19B1F4614()
{
  unint64_t result;

  result = qword_1EE3EF8C0;
  if (!qword_1EE3EF8C0)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C470, &type metadata for AccessoryMFiCapabilitiesList.Vendor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8C0);
  }
  return result;
}

unint64_t sub_19B1F465C()
{
  unint64_t result;

  result = qword_1EE3EF8C8;
  if (!qword_1EE3EF8C8)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C358, &type metadata for AccessoryMFiCapabilitiesList.Product.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8C8);
  }
  return result;
}

unint64_t sub_19B1F46A4()
{
  unint64_t result;

  result = qword_1EE3EF8D0;
  if (!qword_1EE3EF8D0)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C380, &type metadata for AccessoryMFiCapabilitiesList.Product.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8D0);
  }
  return result;
}

unint64_t sub_19B1F46EC()
{
  unint64_t result;

  result = qword_1EE3EF8D8;
  if (!qword_1EE3EF8D8)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C268, &type metadata for AccessoryMFiCapabilitiesList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8D8);
  }
  return result;
}

unint64_t sub_19B1F4734()
{
  unint64_t result;

  result = qword_1EE3EF8E0;
  if (!qword_1EE3EF8E0)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C290, &type metadata for AccessoryMFiCapabilitiesList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8E0);
  }
  return result;
}

uint64_t sub_19B1F4778()
{
  sub_19B4292D4();
  sub_19B429028();
  return sub_19B4292EC();
}

uint64_t sub_19B1F47C8()
{
  return sub_19B429028();
}

uint64_t sub_19B1F47E0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF8E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_19B1F4994();
  sub_19B4292F8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_19B429238();
    v10 = 1;
    swift_bridgeObjectRetain();
    sub_19B42922C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_19B1F497C()
{
  return 0x73726F646E6576;
}

unint64_t sub_19B1F4994()
{
  unint64_t result;

  result = qword_1EE3EF8F0;
  if (!qword_1EE3EF8F0)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C740, &type metadata for AccessoryMFiCapability.Representation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF8F0);
  }
  return result;
}

char *sub_19B1F49D8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_19B429214();
  __break(1u);
  return result;
}

uint64_t sub_19B1F4AC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF960);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_19B429214();
  __break(1u);
  return result;
}

uint64_t sub_19B1F4BC8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 6580598 && a2 == 0xE300000000000000;
  if (v3 || (sub_19B429280() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746375646F7270 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_19B429280();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_19B1F4CA0()
{
  unint64_t result;

  result = qword_1EE3EF900;
  if (!qword_1EE3EF900)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.ProductID, &type metadata for HMAccessoryMatterCapabilities.ProductID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF900);
  }
  return result;
}

unint64_t sub_19B1F4CE4()
{
  unint64_t result;

  result = qword_1EE3EF908;
  if (!qword_1EE3EF908)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for HMAccessoryMatterCapabilities.VendorID, &type metadata for HMAccessoryMatterCapabilities.VendorID);
    atomic_store(result, (unint64_t *)&qword_1EE3EF908);
  }
  return result;
}

uint64_t sub_19B1F4D28(__int128 *a1, uint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_19B1F4D58()
{
  unint64_t result;

  result = qword_1EE3EF928;
  if (!qword_1EE3EF928)
  {
    result = MEMORY[0x1A1AC1FC8](&protocol conformance descriptor for AssetError, &type metadata for AssetError);
    atomic_store(result, (unint64_t *)&qword_1EE3EF928);
  }
  return result;
}

uint64_t sub_19B1F4D9C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_19B1F4DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19B1F4E0C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_19B1F4E88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19B1F4ECC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3EF938);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_19B429214();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_19B1F4FF8()
{
  return swift_release();
}

uint64_t sub_19B1F5000(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_19B1F5044(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t _s7HomeKit29HMAccessoryMatterCapabilitiesV13AssetFilenameOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s7HomeKit29HMAccessoryMatterCapabilitiesV13AssetFilenameOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_19B1F5130 + 4 * byte_19B44BCCF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_19B1F5164 + 4 * byte_19B44BCCA[v4]))();
}

uint64_t sub_19B1F5164(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19B1F516C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19B1F5174);
  return result;
}

uint64_t sub_19B1F5180(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19B1F5188);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19B1F518C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19B1F5194(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19B1F51A0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_19B1F51A8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AccessoryMFiCapability.Representation.CodingKeys()
{
  return &type metadata for AccessoryMFiCapability.Representation.CodingKeys;
}

unint64_t sub_19B1F51C8()
{
  unint64_t result;

  result = qword_1EE3EF990;
  if (!qword_1EE3EF990)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C718, &type metadata for AccessoryMFiCapability.Representation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF990);
  }
  return result;
}

unint64_t sub_19B1F5210()
{
  unint64_t result;

  result = qword_1EE3EF998;
  if (!qword_1EE3EF998)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C650, &type metadata for AccessoryMFiCapability.Representation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF998);
  }
  return result;
}

unint64_t sub_19B1F5258()
{
  unint64_t result;

  result = qword_1EE3EF9A0;
  if (!qword_1EE3EF9A0)
  {
    result = MEMORY[0x1A1AC1FC8](&unk_19B44C678, &type metadata for AccessoryMFiCapability.Representation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3EF9A0);
  }
  return result;
}

uint64_t sub_19B1F52D0()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_19B428F80();
  v2 = (void *)sub_19B428F80();
  v3 = objc_msgSend(v0, sel_topicFromSuffixID_homeUUID_accessoryUUID_, 513, v1, v2);

  if (!v3)
    return 0;
  v4 = sub_19B429010();

  return v4;
}

uint64_t AccessoryInfoFetchMediaStateItem.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t AccessoryInfoFetchMediaStateItem.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t AccessoryInfoFetchMediaStateItem.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AccessoryInfoFetchMediaStateItem.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AccessoryInfoFetchMediaStateItem()
{
  return objc_opt_self();
}

id HMAccessory.matterNodeID.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_matterNodeID);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_unsignedLongLongValue);

  return v3;
}

uint64_t sub_19B1F5440()
{
  uint64_t result;
  uint64_t v1;

  result = sub_19B429010();
  qword_1EE3EFA48 = result;
  unk_1EE3EFA50 = v1;
  return result;
}

uint64_t HMCharacteristicPropertySupportsEventNotification.getter()
{
  uint64_t v0;

  if (qword_1EE3EF388 != -1)
    swift_once();
  v0 = qword_1EE3EFA48;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t HMService.matterEndpointID.getter()
{
  void *v0;
  id v1;
  void *v2;
  unsigned int v3;

  v1 = objc_msgSend(v0, sel_matterEndpointID);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_unsignedShortValue);

  }
  else
  {
    v3 = 0;
  }
  return v3 | ((v2 == 0) << 16);
}

uint64_t AccessoryInfoFetchItem.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t AccessoryInfoFetchItem.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AccessoryInfoFetchItem.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t sub_19B1F5554()
{
  return 0;
}

uint64_t AccessoryInfoFetchItem.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AccessoryInfoFetchItem()
{
  return objc_opt_self();
}

uint64_t method lookup function for AccessoryInfoFetchItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessoryInfoFetchItem.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t AccessoryInfoFetchItemCollection.__allocating_init(accessoryUniqueIdentifier:accessoryInfoFetchItems:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  v5 = v4 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  v6 = sub_19B428F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  return v4;
}

uint64_t AccessoryInfoFetchItemCollection.init(accessoryUniqueIdentifier:accessoryInfoFetchItems:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 16) = a2;
  v4 = v2 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  v5 = sub_19B428F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a1, v5);
  return v2;
}

uint64_t AccessoryInfoFetchItemCollection.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  v2 = sub_19B428F98();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AccessoryInfoFetchItemCollection.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC7HomeKit32AccessoryInfoFetchItemCollection_accessoryUniqueIdentifier;
  v2 = sub_19B428F98();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_19B1F5710()
{
  return type metadata accessor for AccessoryInfoFetchItemCollection();
}

uint64_t type metadata accessor for AccessoryInfoFetchItemCollection()
{
  uint64_t result;

  result = qword_1EE3EFB20;
  if (!qword_1EE3EFB20)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_19B1F5754()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19B428F98();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AccessoryInfoFetchItemCollection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessoryInfoFetchItemCollection.__allocating_init(accessoryUniqueIdentifier:accessoryInfoFetchItems:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t HMMediaGroupProtoMediaDestinationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_31;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_31;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_31:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          break;
        v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
        *(_QWORD *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0)
          goto LABEL_33;
        v20 += 7;
        v14 = v21++ >= 9;
        if (v14)
        {
          v22 = 0;
          goto LABEL_35;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_35:
      *(_QWORD *)(a1 + 8) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B1F7430(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1F74C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1FAF3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B1FB074(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void _initLocationEventWithRegion(void *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v6 = a1;
  v3 = objc_msgSend(a2, "copy");
  v4 = (void *)v6[7];
  v6[7] = v3;

  v5 = (void *)v6[8];
  v6[8] = 0;

  v6[9] = 1;
}

uint64_t HMMediaGroupProtoMediaGroupRoleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  HMMediaGroupProtoMediaSystemRoles *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        objc_msgSend((id)a1, "clearOneofValuesForRole");
        *(_BYTE *)(a1 + 20) |= 1u;
        *(_DWORD *)(a1 + 16) = 1;
        v23 = objc_alloc_init(HMMediaGroupProtoMediaSystemRoles);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || !HMMediaGroupProtoMediaSystemRolesReadFrom((uint64_t)v23, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3))
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        v17 = 0;
        while (1)
        {
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 == -1 || v19 >= *(_QWORD *)(a2 + *v4))
            break;
          v20 = v19 + 1;
          v21 = *(char *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v20;
          if (v21 < 0 && v17++ <= 8)
            continue;
          goto LABEL_33;
        }
        *(_BYTE *)(a2 + *v5) = 1;
      }
LABEL_33:
      ;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMMediaGroupProtoMediaParticipantDataReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  HMMediaGroupProtoMediaDestinationControllerData *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        v18 = objc_alloc_init(HMMediaGroupProtoMediaDestinationControllerData);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark()
          || (HMMediaGroupProtoMediaDestinationControllerDataReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
LABEL_28:
        PBReaderRecallMark();
LABEL_29:

        goto LABEL_31;
      }
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(HMMediaGroupProtoMediaDestination);
        objc_storeStrong(a1 + 2, v18);
        if (!PBReaderPlaceMark()
          || (HMMediaGroupProtoMediaDestinationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_34;
        }
        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_31:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = (HMMediaGroupProtoMediaDestinationControllerData *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(a1, "addBackupGroups:", v18);
    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMAccessoryDiagnosticInfoProtoSetupInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  char v99;
  unsigned int v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  unint64_t v107;
  char v108;
  char v109;
  unsigned int v110;
  uint64_t v111;
  unint64_t v112;
  char v113;
  char v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char v119;
  char v120;
  unsigned int v121;
  uint64_t v122;
  unint64_t v123;
  char v124;
  char v125;
  unsigned int v126;
  uint64_t v127;
  unint64_t v128;
  char v129;
  char v130;
  unsigned int v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  char v135;
  unsigned int v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  char v142;
  unsigned int v143;
  uint64_t v144;
  unint64_t v145;
  char v146;
  char v147;
  unsigned int v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  unsigned int v153;
  uint64_t v154;
  unint64_t v155;
  char v156;
  char v157;
  unsigned int v158;
  uint64_t v159;
  unint64_t v160;
  char v161;
  char v162;
  unsigned int v163;
  uint64_t v164;
  unint64_t v165;
  char v166;
  char v167;
  unsigned int v168;
  uint64_t v169;
  unint64_t v170;
  char v171;
  char v172;
  unsigned int v173;
  uint64_t v174;
  unint64_t v175;
  char v176;
  char v177;
  unsigned int v178;
  uint64_t v179;
  unint64_t v180;
  char v181;
  char v182;
  unsigned int v183;
  uint64_t v184;
  unint64_t v185;
  char v186;
  char v187;
  unsigned int v188;
  uint64_t v189;
  unint64_t v190;
  char v191;
  char v192;
  unsigned int v193;
  uint64_t v194;
  unint64_t v195;
  char v196;
  char v197;
  unsigned int v198;
  uint64_t v199;
  unint64_t v200;
  char v201;
  char v202;
  unsigned int v203;
  uint64_t v204;
  unint64_t v205;
  char v206;
  char v207;
  unsigned int v208;
  uint64_t v209;
  unint64_t v210;
  char v211;
  char v212;
  unsigned int v213;
  uint64_t v214;
  unint64_t v215;
  char v216;
  char v217;
  unsigned int v218;
  uint64_t v219;
  unint64_t v220;
  char v221;
  char v222;
  unsigned int v223;
  uint64_t v224;
  unint64_t v225;
  char v226;
  char v227;
  unsigned int v228;
  uint64_t v229;
  unint64_t v230;
  char v231;
  char v232;
  unsigned int v233;
  uint64_t v234;
  unint64_t v235;
  char v236;
  void *v237;
  char v238;
  unsigned int v239;
  uint64_t v240;
  unint64_t v241;
  char v242;
  uint64_t v243;
  uint64_t v244;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x100000000uLL;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_339;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_341;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_339:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_341:
          v243 = 264;
          goto LABEL_515;
        case 5u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x8000000uLL;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_345;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_345:
          v243 = 224;
          goto LABEL_515;
        case 6u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 4uLL;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_349;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_349:
          v243 = 24;
          goto LABEL_515;
        case 7u:
          v34 = 0;
          v35 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x10000uLL;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v14 = v35++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_353;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_353:
          v243 = 136;
          goto LABEL_515;
        case 8u:
          v39 = 0;
          v40 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x4000000uLL;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v19 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                v14 = v40++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_357;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_357:
          v243 = 216;
          goto LABEL_515;
        case 9u:
          v44 = 0;
          v45 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x2000000uLL;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_361;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_361:
          v243 = 208;
          goto LABEL_515;
        case 0xAu:
          v49 = 0;
          v50 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x40000000uLL;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v52 + 1;
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v14 = v50++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_365;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_365:
          v243 = 248;
          goto LABEL_515;
        case 0xBu:
          v54 = 0;
          v55 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 2uLL;
          while (2)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
              *(_QWORD *)(a2 + v56) = v57 + 1;
              v19 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                v14 = v55++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_369;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_369:
          v243 = 16;
          goto LABEL_515;
        case 0xCu:
          v59 = 0;
          v60 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 8uLL;
          while (2)
          {
            v61 = *v3;
            v62 = *(_QWORD *)(a2 + v61);
            if (v62 == -1 || v62 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
              *(_QWORD *)(a2 + v61) = v62 + 1;
              v19 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                v14 = v60++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_373;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_373:
          v243 = 32;
          goto LABEL_515;
        case 0xDu:
          v64 = 0;
          v65 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x400uLL;
          while (2)
          {
            v66 = *v3;
            v67 = *(_QWORD *)(a2 + v66);
            if (v67 == -1 || v67 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v67);
              *(_QWORD *)(a2 + v66) = v67 + 1;
              v19 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                v14 = v65++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_377;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_377:
          v243 = 88;
          goto LABEL_515;
        case 0xEu:
          v69 = 0;
          v70 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x200uLL;
          while (2)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            if (v72 == -1 || v72 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
              *(_QWORD *)(a2 + v71) = v72 + 1;
              v19 |= (unint64_t)(v73 & 0x7F) << v69;
              if (v73 < 0)
              {
                v69 += 7;
                v14 = v70++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_381;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_381:
          v243 = 80;
          goto LABEL_515;
        case 0xFu:
          v74 = 0;
          v75 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 1uLL;
          while (2)
          {
            v76 = *v3;
            v77 = *(_QWORD *)(a2 + v76);
            if (v77 == -1 || v77 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v78 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
              *(_QWORD *)(a2 + v76) = v77 + 1;
              v19 |= (unint64_t)(v78 & 0x7F) << v74;
              if (v78 < 0)
              {
                v74 += 7;
                v14 = v75++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_385;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_385:
          v243 = 8;
          goto LABEL_515;
        case 0x10u:
          v79 = 0;
          v80 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x10000000uLL;
          while (2)
          {
            v81 = *v3;
            v82 = *(_QWORD *)(a2 + v81);
            if (v82 == -1 || v82 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v82);
              *(_QWORD *)(a2 + v81) = v82 + 1;
              v19 |= (unint64_t)(v83 & 0x7F) << v79;
              if (v83 < 0)
              {
                v79 += 7;
                v14 = v80++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_389;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_389:
          v243 = 232;
          goto LABEL_515;
        case 0x11u:
          v84 = 0;
          v85 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x20000uLL;
          while (2)
          {
            v86 = *v3;
            v87 = *(_QWORD *)(a2 + v86);
            if (v87 == -1 || v87 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v88 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v87);
              *(_QWORD *)(a2 + v86) = v87 + 1;
              v19 |= (unint64_t)(v88 & 0x7F) << v84;
              if (v88 < 0)
              {
                v84 += 7;
                v14 = v85++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_393;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_393:
          v243 = 144;
          goto LABEL_515;
        case 0x12u:
          v89 = 0;
          v90 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x20000000uLL;
          while (2)
          {
            v91 = *v3;
            v92 = *(_QWORD *)(a2 + v91);
            if (v92 == -1 || v92 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v93 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v92);
              *(_QWORD *)(a2 + v91) = v92 + 1;
              v19 |= (unint64_t)(v93 & 0x7F) << v89;
              if (v93 < 0)
              {
                v89 += 7;
                v14 = v90++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_397;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_397:
          v243 = 240;
          goto LABEL_515;
        case 0x13u:
          v94 = 0;
          v95 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x20uLL;
          while (2)
          {
            v96 = *v3;
            v97 = *(_QWORD *)(a2 + v96);
            if (v97 == -1 || v97 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v98 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v97);
              *(_QWORD *)(a2 + v96) = v97 + 1;
              v19 |= (unint64_t)(v98 & 0x7F) << v94;
              if (v98 < 0)
              {
                v94 += 7;
                v14 = v95++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_401;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_401:
          v243 = 48;
          goto LABEL_515;
        case 0x14u:
          v99 = 0;
          v100 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x100000uLL;
          while (2)
          {
            v101 = *v3;
            v102 = *(_QWORD *)(a2 + v101);
            if (v102 == -1 || v102 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
              *(_QWORD *)(a2 + v101) = v102 + 1;
              v19 |= (unint64_t)(v103 & 0x7F) << v99;
              if (v103 < 0)
              {
                v99 += 7;
                v14 = v100++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_405;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_405:
          v243 = 168;
          goto LABEL_515;
        case 0x15u:
          v104 = 0;
          v105 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x10uLL;
          while (2)
          {
            v106 = *v3;
            v107 = *(_QWORD *)(a2 + v106);
            if (v107 == -1 || v107 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v108 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v107);
              *(_QWORD *)(a2 + v106) = v107 + 1;
              v19 |= (unint64_t)(v108 & 0x7F) << v104;
              if (v108 < 0)
              {
                v104 += 7;
                v14 = v105++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_409;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_409:
          v243 = 40;
          goto LABEL_515;
        case 0x16u:
          v109 = 0;
          v110 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x80000000uLL;
          while (2)
          {
            v111 = *v3;
            v112 = *(_QWORD *)(a2 + v111);
            if (v112 == -1 || v112 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v113 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v112);
              *(_QWORD *)(a2 + v111) = v112 + 1;
              v19 |= (unint64_t)(v113 & 0x7F) << v109;
              if (v113 < 0)
              {
                v109 += 7;
                v14 = v110++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_413;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_413:
          v243 = 256;
          goto LABEL_515;
        case 0x17u:
          v114 = 0;
          v115 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x400000000uLL;
          while (2)
          {
            v117 = *v3;
            v118 = *(_QWORD *)(a2 + v117);
            if (v118 == -1 || v118 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v119 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v118);
              *(_QWORD *)(a2 + v117) = v118 + 1;
              v116 |= (unint64_t)(v119 & 0x7F) << v114;
              if (v119 < 0)
              {
                v114 += 7;
                v14 = v115++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_417;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_417:
          v244 = 304;
          goto LABEL_474;
        case 0x18u:
          v120 = 0;
          v121 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x800000000uLL;
          while (2)
          {
            v122 = *v3;
            v123 = *(_QWORD *)(a2 + v122);
            if (v123 == -1 || v123 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v124 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v123);
              *(_QWORD *)(a2 + v122) = v123 + 1;
              v116 |= (unint64_t)(v124 & 0x7F) << v120;
              if (v124 < 0)
              {
                v120 += 7;
                v14 = v121++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_421;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_421:
          v244 = 308;
          goto LABEL_474;
        case 0x19u:
          v125 = 0;
          v126 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x4000000000uLL;
          while (2)
          {
            v127 = *v3;
            v128 = *(_QWORD *)(a2 + v127);
            if (v128 == -1 || v128 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v129 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v128);
              *(_QWORD *)(a2 + v127) = v128 + 1;
              v116 |= (unint64_t)(v129 & 0x7F) << v125;
              if (v129 < 0)
              {
                v125 += 7;
                v14 = v126++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_425;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_425:
          v244 = 360;
          goto LABEL_474;
        case 0x1Au:
          v130 = 0;
          v131 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x8000000000uLL;
          while (2)
          {
            v132 = *v3;
            v133 = *(_QWORD *)(a2 + v132);
            if (v133 == -1 || v133 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v134 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v133);
              *(_QWORD *)(a2 + v132) = v133 + 1;
              v116 |= (unint64_t)(v134 & 0x7F) << v130;
              if (v134 < 0)
              {
                v130 += 7;
                v14 = v131++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_429;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_429:
          v244 = 364;
          goto LABEL_474;
        case 0x1Bu:
          v135 = 0;
          v136 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x800uLL;
          while (2)
          {
            v137 = *v3;
            v138 = *(_QWORD *)(a2 + v137);
            if (v138 == -1 || v138 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v139 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v138);
              *(_QWORD *)(a2 + v137) = v138 + 1;
              v19 |= (unint64_t)(v139 & 0x7F) << v135;
              if (v139 < 0)
              {
                v135 += 7;
                v14 = v136++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_433;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_433:
          v243 = 96;
          goto LABEL_515;
        case 0x1Cu:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 320;
          goto LABEL_330;
        case 0x1Du:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 328;
          goto LABEL_330;
        case 0x1Eu:
          v142 = 0;
          v143 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x1000uLL;
          while (2)
          {
            v144 = *v3;
            v145 = *(_QWORD *)(a2 + v144);
            if (v145 == -1 || v145 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v146 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v145);
              *(_QWORD *)(a2 + v144) = v145 + 1;
              v19 |= (unint64_t)(v146 & 0x7F) << v142;
              if (v146 < 0)
              {
                v142 += 7;
                v14 = v143++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_437;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_437:
          v243 = 104;
          goto LABEL_515;
        case 0x1Fu:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 336;
          goto LABEL_330;
        case 0x20u:
          v147 = 0;
          v148 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x1000000uLL;
          while (2)
          {
            v149 = *v3;
            v150 = *(_QWORD *)(a2 + v149);
            if (v150 == -1 || v150 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v151 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v150);
              *(_QWORD *)(a2 + v149) = v150 + 1;
              v19 |= (unint64_t)(v151 & 0x7F) << v147;
              if (v151 < 0)
              {
                v147 += 7;
                v14 = v148++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_441;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_441:
          v243 = 200;
          goto LABEL_515;
        case 0x21u:
          v152 = 0;
          v153 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x1000000000uLL;
          while (2)
          {
            v154 = *v3;
            v155 = *(_QWORD *)(a2 + v154);
            if (v155 == -1 || v155 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v156 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v155);
              *(_QWORD *)(a2 + v154) = v155 + 1;
              v116 |= (unint64_t)(v156 & 0x7F) << v152;
              if (v156 < 0)
              {
                v152 += 7;
                v14 = v153++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_445;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_445:
          v244 = 312;
          goto LABEL_474;
        case 0x22u:
          v157 = 0;
          v158 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x2000000000uLL;
          while (2)
          {
            v159 = *v3;
            v160 = *(_QWORD *)(a2 + v159);
            if (v160 == -1 || v160 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v161 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v160);
              *(_QWORD *)(a2 + v159) = v160 + 1;
              v116 |= (unint64_t)(v161 & 0x7F) << v157;
              if (v161 < 0)
              {
                v157 += 7;
                v14 = v158++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_449;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_449:
          v244 = 316;
          goto LABEL_474;
        case 0x23u:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 272;
          goto LABEL_330;
        case 0x24u:
          v162 = 0;
          v163 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x80000000000uLL;
          while (2)
          {
            v164 = *v3;
            v165 = *(_QWORD *)(a2 + v164);
            if (v165 == -1 || v165 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v166 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v165);
              *(_QWORD *)(a2 + v164) = v165 + 1;
              v116 |= (unint64_t)(v166 & 0x7F) << v162;
              if (v166 < 0)
              {
                v162 += 7;
                v14 = v163++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_453;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_453:
          v244 = 380;
          goto LABEL_474;
        case 0x25u:
          v167 = 0;
          v168 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x8000uLL;
          while (2)
          {
            v169 = *v3;
            v170 = *(_QWORD *)(a2 + v169);
            if (v170 == -1 || v170 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v171 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v170);
              *(_QWORD *)(a2 + v169) = v170 + 1;
              v19 |= (unint64_t)(v171 & 0x7F) << v167;
              if (v171 < 0)
              {
                v167 += 7;
                v14 = v168++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_457;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_457:
          v243 = 128;
          goto LABEL_515;
        case 0x26u:
          v172 = 0;
          v173 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x20000000000uLL;
          while (2)
          {
            v174 = *v3;
            v175 = *(_QWORD *)(a2 + v174);
            if (v175 == -1 || v175 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v176 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v175);
              *(_QWORD *)(a2 + v174) = v175 + 1;
              v116 |= (unint64_t)(v176 & 0x7F) << v172;
              if (v176 < 0)
              {
                v172 += 7;
                v14 = v173++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_461;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_461:
          v244 = 372;
          goto LABEL_474;
        case 0x27u:
          v177 = 0;
          v178 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x40000000000uLL;
          while (2)
          {
            v179 = *v3;
            v180 = *(_QWORD *)(a2 + v179);
            if (v180 == -1 || v180 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v181 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v180);
              *(_QWORD *)(a2 + v179) = v180 + 1;
              v116 |= (unint64_t)(v181 & 0x7F) << v177;
              if (v181 < 0)
              {
                v177 += 7;
                v14 = v178++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_465;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_465:
          v244 = 376;
          goto LABEL_474;
        case 0x28u:
          v182 = 0;
          v183 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x10000000000uLL;
          while (2)
          {
            v184 = *v3;
            v185 = *(_QWORD *)(a2 + v184);
            if (v185 == -1 || v185 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v186 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v185);
              *(_QWORD *)(a2 + v184) = v185 + 1;
              v116 |= (unint64_t)(v186 & 0x7F) << v182;
              if (v186 < 0)
              {
                v182 += 7;
                v14 = v183++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_469;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_469:
          v244 = 368;
          goto LABEL_474;
        case 0x29u:
          v187 = 0;
          v188 = 0;
          v116 = 0;
          *(_QWORD *)(a1 + 384) |= 0x200000000uLL;
          while (2)
          {
            v189 = *v3;
            v190 = *(_QWORD *)(a2 + v189);
            if (v190 == -1 || v190 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v191 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v190);
              *(_QWORD *)(a2 + v189) = v190 + 1;
              v116 |= (unint64_t)(v191 & 0x7F) << v187;
              if (v191 < 0)
              {
                v187 += 7;
                v14 = v188++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_473;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v116) = 0;
LABEL_473:
          v244 = 280;
LABEL_474:
          *(_DWORD *)(a1 + v244) = v116;
          continue;
        case 0x2Au:
          v192 = 0;
          v193 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x2000uLL;
          while (2)
          {
            v194 = *v3;
            v195 = *(_QWORD *)(a2 + v194);
            if (v195 == -1 || v195 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v196 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v195);
              *(_QWORD *)(a2 + v194) = v195 + 1;
              v19 |= (unint64_t)(v196 & 0x7F) << v192;
              if (v196 < 0)
              {
                v192 += 7;
                v14 = v193++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_478:
          v243 = 112;
          goto LABEL_515;
        case 0x2Bu:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 344;
          goto LABEL_330;
        case 0x2Cu:
          v197 = 0;
          v198 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x4000uLL;
          while (2)
          {
            v199 = *v3;
            v200 = *(_QWORD *)(a2 + v199);
            if (v200 == -1 || v200 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v201 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v200);
              *(_QWORD *)(a2 + v199) = v200 + 1;
              v19 |= (unint64_t)(v201 & 0x7F) << v197;
              if (v201 < 0)
              {
                v197 += 7;
                v14 = v198++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_482:
          v243 = 120;
          goto LABEL_515;
        case 0x2Du:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 352;
          goto LABEL_330;
        case 0x2Eu:
          v202 = 0;
          v203 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x800000uLL;
          while (2)
          {
            v204 = *v3;
            v205 = *(_QWORD *)(a2 + v204);
            if (v205 == -1 || v205 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v206 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v205);
              *(_QWORD *)(a2 + v204) = v205 + 1;
              v19 |= (unint64_t)(v206 & 0x7F) << v202;
              if (v206 < 0)
              {
                v202 += 7;
                v14 = v203++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_486:
          v243 = 192;
          goto LABEL_515;
        case 0x2Fu:
          v207 = 0;
          v208 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x40000uLL;
          while (2)
          {
            v209 = *v3;
            v210 = *(_QWORD *)(a2 + v209);
            if (v210 == -1 || v210 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v211 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v210);
              *(_QWORD *)(a2 + v209) = v210 + 1;
              v19 |= (unint64_t)(v211 & 0x7F) << v207;
              if (v211 < 0)
              {
                v207 += 7;
                v14 = v208++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_490:
          v243 = 152;
          goto LABEL_515;
        case 0x30u:
          v212 = 0;
          v213 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x200000uLL;
          while (2)
          {
            v214 = *v3;
            v215 = *(_QWORD *)(a2 + v214);
            if (v215 == -1 || v215 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v216 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v215);
              *(_QWORD *)(a2 + v214) = v215 + 1;
              v19 |= (unint64_t)(v216 & 0x7F) << v212;
              if (v216 < 0)
              {
                v212 += 7;
                v14 = v213++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_494;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_494:
          v243 = 176;
          goto LABEL_515;
        case 0x31u:
          v217 = 0;
          v218 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x80000uLL;
          while (2)
          {
            v219 = *v3;
            v220 = *(_QWORD *)(a2 + v219);
            if (v220 == -1 || v220 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v221 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v220);
              *(_QWORD *)(a2 + v219) = v220 + 1;
              v19 |= (unint64_t)(v221 & 0x7F) << v217;
              if (v221 < 0)
              {
                v217 += 7;
                v14 = v218++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_498;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_498:
          v243 = 160;
          goto LABEL_515;
        case 0x32u:
          v222 = 0;
          v223 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x40uLL;
          while (2)
          {
            v224 = *v3;
            v225 = *(_QWORD *)(a2 + v224);
            if (v225 == -1 || v225 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v226 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v225);
              *(_QWORD *)(a2 + v224) = v225 + 1;
              v19 |= (unint64_t)(v226 & 0x7F) << v222;
              if (v226 < 0)
              {
                v222 += 7;
                v14 = v223++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_502;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_502:
          v243 = 56;
          goto LABEL_515;
        case 0x33u:
          v227 = 0;
          v228 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x80uLL;
          while (2)
          {
            v229 = *v3;
            v230 = *(_QWORD *)(a2 + v229);
            if (v230 == -1 || v230 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v231 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v230);
              *(_QWORD *)(a2 + v229) = v230 + 1;
              v19 |= (unint64_t)(v231 & 0x7F) << v227;
              if (v231 < 0)
              {
                v227 += 7;
                v14 = v228++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_506;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_506:
          v243 = 64;
          goto LABEL_515;
        case 0x34u:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 288;
          goto LABEL_330;
        case 0x35u:
          v232 = 0;
          v233 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x100uLL;
          while (2)
          {
            v234 = *v3;
            v235 = *(_QWORD *)(a2 + v234);
            if (v235 == -1 || v235 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v236 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v235);
              *(_QWORD *)(a2 + v234) = v235 + 1;
              v19 |= (unint64_t)(v236 & 0x7F) << v232;
              if (v236 < 0)
              {
                v232 += 7;
                v14 = v233++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_510;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_510:
          v243 = 72;
          goto LABEL_515;
        case 0x36u:
          PBReaderReadString();
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = 296;
LABEL_330:
          v237 = *(void **)(a1 + v141);
          *(_QWORD *)(a1 + v141) = v140;

          continue;
        case 0x37u:
          v238 = 0;
          v239 = 0;
          v19 = 0;
          *(_QWORD *)(a1 + 384) |= 0x400000uLL;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v240 = *v3;
        v241 = *(_QWORD *)(a2 + v240);
        if (v241 == -1 || v241 >= *(_QWORD *)(a2 + *v4))
          break;
        v242 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v241);
        *(_QWORD *)(a2 + v240) = v241 + 1;
        v19 |= (unint64_t)(v242 & 0x7F) << v238;
        if ((v242 & 0x80) == 0)
          goto LABEL_512;
        v238 += 7;
        v14 = v239++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_514;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_512:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_514:
      v243 = 184;
LABEL_515:
      *(_QWORD *)(a1 + v243) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMAccessorySettingConstraintTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("minimumValue")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("maximumValue")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("stepValue")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("validValue")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *HMAccessorySettingConstraintTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E3AADA30[a1 - 1];
}

void sub_19B20AC80(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B20ACF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  void *v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_46;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 8u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_57:
          v42 = 32;
          goto LABEL_70;
        case 3u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 4u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_61:
          v42 = 24;
          goto LABEL_70;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_46;
        case 5u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 1u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_65:
          v42 = 8;
          goto LABEL_70;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_46;
        case 7u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
LABEL_46:
          v36 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 8u:
          v37 = 0;
          v38 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          break;
        v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
        *(_QWORD *)(a2 + v39) = v40 + 1;
        v22 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0)
          goto LABEL_67;
        v37 += 7;
        v14 = v38++ >= 9;
        if (v14)
        {
          v22 = 0;
          goto LABEL_69;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_67:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_69:
      v42 = 16;
LABEL_70:
      *(_QWORD *)(a1 + v42) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMSoftwareUpdateProgressEventComponentsFromTopic(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;

  v5 = a1;
  if (objc_msgSend(v5, "hasSuffix:", CFSTR("info.softwareUpdate.progress")))
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 5)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

      v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

      if (v9)
        v13 = v12 == 0;
      else
        v13 = 1;
      v14 = !v13;
      if (!v13)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v9);
        if (a3)
          *a3 = objc_retainAutorelease(v12);
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void sub_19B210BD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B210DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_19B211520(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B21189C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B211A1C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B211C24(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B21215C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL isValidTimeComparison(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  _BOOL8 v9;

  v1 = a1;
  objc_msgSend(v1, "leftExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "expressionType") != 4)
    goto LABEL_9;
  objc_msgSend(v2, "function");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("now"));

  if (!v5
    || objc_msgSend(v1, "predicateOperatorType") != 2
    && objc_msgSend(v1, "predicateOperatorType") != 4
    && objc_msgSend(v1, "predicateOperatorType"))
  {
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "expressionType")
    && (objc_msgSend(v3, "constantValue"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v3, "constantValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[HMPredicateUtilities areOnlyHourAndMinuteSet:](HMPredicateUtilities, "areOnlyHourAndMinuteSet:", v8);

  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

void sub_19B215000(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B215060(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B215160(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAccessoryDiagnosticInfoProtoDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 64) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_55;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_57;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_57:
        *(_QWORD *)(a1 + 16) = v20;
        goto LABEL_69;
      case 2u:
        v26 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_71;
        }
        goto LABEL_53;
      case 3u:
        v26 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_71;
        }
        goto LABEL_53;
      case 4u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 64) |= 4u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_61:
        v43 = 32;
        goto LABEL_66;
      case 5u:
        v34 = 0;
        v35 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 64) |= 8u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          v38 = v37 + 1;
          if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v38;
            v29 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_65:
        v43 = 48;
LABEL_66:
        *(_DWORD *)(a1 + v43) = v29;
        goto LABEL_69;
      case 6u:
        *(_BYTE *)(a1 + 64) |= 1u;
        v40 = *v3;
        v41 = *(_QWORD *)(a2 + v40);
        if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v42 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v41);
          *(_QWORD *)(a2 + v40) = v41 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v42 = 0;
        }
        *(_QWORD *)(a1 + 8) = v42;
        goto LABEL_69;
      case 7u:
        v26 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoSetupInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (PBReaderPlaceMark()
          && (HMAccessoryDiagnosticInfoProtoSetupInfoReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_53:
          PBReaderRecallMark();

LABEL_69:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_71:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_69;
    }
  }
}

void sub_19B218964(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B218AE4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B218CEC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B21906C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAudioAnalysisEventBulletinEventProtoValueEventReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent);
        objc_msgSend(a1, "addEvents:", v17);
        if (!PBReaderPlaceMark()
          || (HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *HMLightProfileSupportedFeaturesAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  __CFString *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        if (v3 == 2)
        {
          v4 &= ~2uLL;
        }
        else if (v3 == 1)
        {
          v4 &= ~1uLL;
          objc_msgSend(v2, "addObject:", CFSTR("natural-lighting"));
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown supported features: %lu"), a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("none");
  }

  return v6;
}

__CFString *HMSettingVersionValueTypeAsString(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 == 1)
  {
    v1 = CFSTR("HMSettingReadVersionValue");
  }
  else if (a1 == 2)
  {
    v1 = CFSTR("HMSettingWriteVersionValue");
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown type (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t HMImmutableSettingsProtoAvailableLanguageListEventReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMImmutableSettingsProtoLanguageValueEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
        objc_msgSend(a1, "addLanguages:", v17);
        if (!PBReaderPlaceMark() || !HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *HMImmutableSettingValueTypeAsString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 6)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("UnknownType(%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AADCD8[a1];
  }
  return v1;
}

uint64_t HMAccessoryInfoProtoPrimaryUserInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B21DB88(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B21DCCC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B21F3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getIDSDestinationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!IDSFoundationLibraryCore_frameworkLibrary)
  {
    IDSFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!IDSFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("IDSDestination");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getIDSDestinationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HMAccessoryInfoProtoNetworkServiceEventReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  void *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_40;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_40;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          a1[84] |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_40;
        case 5u:
          PBReaderReadString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(a1, "addIpv4Addresses:", v26);
          goto LABEL_37;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_40;
        case 7u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_40;
        case 8u:
          PBReaderReadString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(a1, "addIpv6Addresses:", v26);
LABEL_37:

          continue;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_40;
        case 0xAu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
LABEL_40:
          v27 = *(void **)&a1[v18];
          *(_QWORD *)&a1[v18] = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          break;
        v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
        *(_QWORD *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0)
          goto LABEL_44;
        v20 += 7;
        v14 = v21++ >= 9;
        if (v14)
        {
          v22 = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_46:
      a1[80] = v22 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *HMMediaSystemRoleTypeAsString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HMMediaSystemRoleTypeLeft");
  if (a1 == 2)
  {
    v1 = CFSTR("HMMediaSystemRoleTypeRight");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMMediaSystemRoleType %tu"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_19B2219A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B222FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HMImmutableSettingsProtoBoolValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B225B44(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B225C64(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B225F64(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B226AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_19B226CB0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B226DC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMMediaDestinationSupportOptionsAsString(unint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;

  if (a1)
  {
    v2 = CFSTR("HT ");
    v3 = &stru_1E3AB7688;
    if ((a1 & 1) == 0)
      v2 = &stru_1E3AB7688;
    v4 = v2;
    v5 = CFSTR("AG ");
    if ((a1 & 8) == 0)
      v5 = &stru_1E3AB7688;
    v6 = v5;
    v7 = CFSTR("MHT ");
    if ((a1 & 4) == 0)
      v7 = &stru_1E3AB7688;
    v8 = v7;
    v9 = CFSTR("HT+ ");
    if ((a1 & 0x40) == 0)
      v9 = &stru_1E3AB7688;
    v10 = v9;
    v11 = CFSTR("MS+ ");
    if ((a1 & 0x80) == 0)
      v11 = &stru_1E3AB7688;
    v12 = v11;
    v13 = CFSTR("MS ");
    if ((a1 & 0x10) == 0)
      v13 = &stru_1E3AB7688;
    v14 = v13;
    v15 = CFSTR("MMS ");
    if ((a1 & 0x20) == 0)
      v15 = &stru_1E3AB7688;
    v16 = v15;
    if (a1 >= 0x100)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("unknown(%@)"), v18);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@%@"), v4, v6, v8, v14, v16, v10, v12, v3);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = CFSTR("None");
  }
  return v19;
}

__CFString *HMMediaDestinationTypeAsString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 5)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown type %@"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AADF70[a1];
  }
  return v1;
}

void sub_19B22DC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMMediaGroupProtoMediaSystemRolesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMDurationsApproximatelyEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

void sub_19B230B1C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B231024(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMResidentDeviceStatusDescription(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        v5 = v3 - 1;
        if ((unint64_t)(v3 - 1) <= 7 && ((0x8Bu >> v5) & 1) != 0)
        {
          objc_msgSend(v2, "addObject:", off_1E3AAE108[v5]);
          v4 &= ~v3;
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown device status: %lu"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("none");
  }

  return v7;
}

__CFString *HMResidentDeviceCapabilitiesDescription(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_82;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_79;
    if (v3 >= 0x10000)
    {
      if (v3 > 0xFFFFFF)
      {
        if (v3 > 0xFFFFFFF)
        {
          if (v3 > 0x3FFFFFFF)
          {
            if (v3 == 0x40000000)
            {
              v5 = CFSTR("restricted-guest");
            }
            else
            {
              if (v3 != 0x80000000)
                goto LABEL_79;
              v5 = CFSTR("matter-owner-cert-fetch");
            }
          }
          else if (v3 == 0x10000000)
          {
            v5 = CFSTR("matterTTU");
          }
          else
          {
            if (v3 != 0x20000000)
              goto LABEL_79;
            v5 = CFSTR("UWB");
          }
        }
        else if (v3 > 0x3FFFFFF)
        {
          if (v3 == 0x4000000)
          {
            v5 = CFSTR("matter-shared-admin-pairing");
          }
          else
          {
            if (v3 != 0x8000000)
              goto LABEL_79;
            v5 = CFSTR("event-log");
          }
        }
        else if (v3 == 0x1000000)
        {
          v5 = CFSTR("custom media destination");
        }
        else
        {
          if (v3 != 0x2000000)
            goto LABEL_79;
          v5 = CFSTR("thread-network-credential-sharing");
        }
      }
      else if (v3 >= 0x100000)
      {
        if (v3 >= 0x400000)
        {
          if (v3 == 0x400000)
          {
            v5 = CFSTR("chip");
          }
          else
          {
            if (v3 != 0x800000)
              goto LABEL_79;
            v5 = CFSTR("resident-firmware-update");
          }
        }
        else if (v3 == 0x100000)
        {
          v5 = CFSTR("camera-package-detection");
        }
        else
        {
          if (v3 != 0x200000)
            goto LABEL_79;
          v5 = CFSTR("access-codes");
        }
      }
      else if (v3 >= 0x40000)
      {
        if (v3 == 0x40000)
        {
          v5 = CFSTR("wallet-key");
        }
        else
        {
          if (v3 != 0x80000)
            goto LABEL_79;
          v5 = CFSTR("lock-notification-context");
        }
      }
      else if (v3 == 0x10000)
      {
        v5 = CFSTR("thread-border-router");
      }
      else
      {
        if (v3 != 0x20000)
          goto LABEL_79;
        v5 = CFSTR("camera-recording-reachability-notifications");
      }
      goto LABEL_78;
    }
    if (v3 > 255)
    {
      if (v3 > 4095)
      {
        if (v3 >= 0x4000)
        {
          if (v3 == 0x4000)
          {
            v5 = CFSTR("natural-lighting");
          }
          else
          {
            if (v3 != 0x8000)
              goto LABEL_79;
            v5 = CFSTR("announce");
          }
        }
        else if (v3 == 4096)
        {
          v5 = CFSTR("camera-activity-zones");
        }
        else
        {
          if (v3 != 0x2000)
            goto LABEL_79;
          v5 = CFSTR("face-classification");
        }
      }
      else if (v3 > 1023)
      {
        if (v3 == 1024)
        {
          v5 = CFSTR("camera-significant-event-notifications");
        }
        else
        {
          if (v3 != 2048)
            goto LABEL_79;
          v5 = CFSTR("firmware-update");
        }
      }
      else if (v3 == 256)
      {
        v5 = CFSTR("shortcut-actions");
      }
      else
      {
        if (v3 != 512)
          goto LABEL_79;
        v5 = CFSTR("media-actions");
      }
      goto LABEL_78;
    }
    if (v3 > 15)
    {
      if (v3 > 63)
      {
        if (v3 == 64)
        {
          v5 = CFSTR("camera-recording");
        }
        else
        {
          if (v3 != 128)
            goto LABEL_79;
          v5 = CFSTR("router-management");
        }
      }
      else if (v3 == 16)
      {
        v5 = CFSTR("media-system");
      }
      else
      {
        if (v3 != 32)
          goto LABEL_79;
        v5 = CFSTR("media-actions-internal-build");
      }
LABEL_78:
      v4 &= ~v3;
      objc_msgSend(v2, "addObject:", v5);
      goto LABEL_79;
    }
    v5 = CFSTR("triggers");
    switch(v3)
    {
      case 1:
        goto LABEL_78;
      case 2:
        v5 = CFSTR("administrators");
        goto LABEL_78;
      case 4:
        v5 = CFSTR("remote-access-restrictions");
        goto LABEL_78;
      case 8:
        v5 = CFSTR("shared-event-trigger-activation");
        goto LABEL_78;
      default:
        break;
    }
LABEL_79:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown capabilities: %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_82:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("none");
  }

  return v7;
}

void sub_19B233EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMIsValidSignificantEvent(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("sunrise")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("sunset"));

  return v2;
}

BOOL HMIsValidSignificantEventOffset(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = (objc_msgSend(v1, "hour") != 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v1, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    && objc_msgSend(v1, "era") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "year") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "month") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "day") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "weekday") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "weekdayOrdinal") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "quarter") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "weekOfMonth") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "yearForWeekOfYear") == 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

void sub_19B2383D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMMediaDestinationControllerUpateOptionsAsString(uint64_t a1)
{
  char v1;
  __CFString *v2;
  uint64_t v3;

  if (a1)
  {
    v1 = a1;
    v2 = &stru_1E3AB7688;
    if ((a1 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), &stru_1E3AB7688, CFSTR("Unavailable"));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if ((v1 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v2, CFSTR("Unconfigured"));
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (__CFString *)v3;
    }
  }
  else
  {
    v2 = CFSTR("No Options");
  }
  return v2;
}

uint64_t HMPBNaturalLightingActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (1)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
              break;
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0)
              goto LABEL_34;
            v21 += 7;
            v14 = v22++ >= 9;
            if (v14)
            {
              v23 = 0;
              goto LABEL_36;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_36:
          *(_BYTE *)(a1 + 24) = v23 != 0;
          continue;
        }
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
      }
      v20 = *(void **)(a1 + v19);
      *(_QWORD *)(a1 + v19) = v18;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B23B580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B23B898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMEventTriggerActivationStateAsString(unint64_t a1)
{
  if (a1 < 5)
    return off_1E3AAE210[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMEventTriggerActivationState %tu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL HMPBAccessoryReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMPBHomeReference *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMPBHomeReference);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (HMPBHomeReferenceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(HMPBHomeReference **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id HMImmutableSettingChangeEventTopicFromComponentsLegacy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D28630];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.settings.%@.updated"), a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_cachedInstanceForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HMImmutableSettingChangeEventTopicFromComponentsHH2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D28630];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("home.%@.accessory.%@.settings.%@.updated"), a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_cachedInstanceForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t HMImmutableSettingChangeEventComponentsFromTopic(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 5)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("settings")) & 1) != 0)
    {
      objc_msgSend(v7, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("updated"));

      if (v10)
      {
        v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

        v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

        v17 = objc_msgSend(v7, "count") - 4;
        v18 = v7;
        v19 = 3;
        goto LABEL_5;
      }
    }
    else
    {

    }
  }
  if ((unint64_t)objc_msgSend(v7, "count") < 7)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("home")))
    {
      v23 = 0;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "isEqualToString:", CFSTR("accessory")))
    {
      v23 = 0;
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "isEqualToString:", CFSTR("settings")))
    {
      v23 = 0;
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v7, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v24, "isEqualToString:", CFSTR("updated"));

    if ((_DWORD)v23)
    {
      v25 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v25, "initWithUUIDString:", v26);

      v27 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v27, "initWithUUIDString:", v28);

      v17 = objc_msgSend(v7, "count") - 6;
      v18 = v7;
      v19 = 5;
LABEL_5:
      objc_msgSend(v18, "subarrayWithRange:", v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("."));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (id)v21;
      v23 = 0;
      if (v13 && v16 && v21)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v13);
        if (a3)
          *a3 = objc_retainAutorelease(v16);
        if (a4)
        {
          v22 = objc_retainAutorelease(v22);
          *a4 = v22;
        }
        v23 = 1;
      }

      goto LABEL_27;
    }
  }
LABEL_30:

  return v23;
}

BOOL HMImmutableSettingChangeEventComponentsFromMediaSystemTopic(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  void *v9;

  +[HMEventTopicHelper decodeTopic:](HMEventTopicHelper, "decodeTopic:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asMediaSystemSettingTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "homeUUID");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaSystemUUID");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaSystemSettingKeyPath");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0;
}

uint64_t HMImmutableSettingChangeEventTopicFromMediaSystem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("home.%@.mediagroup.stereo.%@.settings.%@.updated"), a1, a2, a3);
}

__CFString *HMHomeAddWalletKeyOptionsDescription(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1 >= 1)
  {
    v3 = 1;
    v4 = a1;
    while (1)
    {
      if ((v3 & a1) == 0)
        goto LABEL_11;
      switch(v3)
      {
        case 1:
          v5 = CFSTR("suppress-wallet-notification");
          break;
        case 4:
          v5 = CFSTR("enable-UWB");
          break;
        case 2:
          v5 = CFSTR("enable-express");
          break;
        default:
          goto LABEL_11;
      }
      v4 &= ~v3;
      objc_msgSend(v2, "addObject:", v5);
LABEL_11:
      v3 *= 2;
      if (v3 > a1 || !v3)
      {
        if (v4)
          goto LABEL_14;
        goto LABEL_15;
      }
    }
  }
  v4 = a1;
  if (a1)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options: %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_15:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("none");
  }

  return v7;
}

void sub_19B244CF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B244E7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2467A0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMStringFromCameraClipQuality(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("Full");
  if (a1 == 1)
  {
    v1 = CFSTR("Timelapse");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown quality: %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_19B24D578(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24D5F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24D670(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24D6C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24D830(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24D8B0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24D970(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24DBD4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24DCB0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B24E1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B24EC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B24F218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B24F804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B24FC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B24FFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMSetupAccessoryProgressAsString(unint64_t a1)
{
  if (a1 < 0x33)
    return off_1E3AAE828[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown progress state: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL HMPBActionSetReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  HMPBActionContainer *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_28;
      case 2u:
        v19 = objc_alloc_init(HMPBActionContainer);
        objc_msgSend(a1, "addActions:", v19);
        if (PBReaderPlaceMark() && (HMPBActionContainerReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_29:

LABEL_30:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_28;
      case 4u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_28;
      case 5u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_28:
        v19 = *(HMPBActionContainer **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;
        goto LABEL_29;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_30;
    }
  }
}

uint64_t HMMediaGroupProtoMediaDestinationControllerDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_24:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          PBReaderReadString();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend((id)a1, "addAvailableDestinations:", v21);

          continue;
        case 5u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          break;
        v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
        *(_QWORD *)(a2 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0)
          goto LABEL_36;
        v22 += 7;
        v14 = v23++ >= 9;
        if (v14)
        {
          v24 = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        v24 = 0;
LABEL_38:
      *(_QWORD *)(a1 + 8) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *HMPresenceEventTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4)
    return off_1E3AAEB48[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMPresenceEventType %tu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMPresenceEventUserTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_1E3AAEB68[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMPresenceEventUserType %tu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t eventTypeForPresenceTypeAndGranularity(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMPresenceTypeCurrentUserAtHome")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HMPresenceTypeAnyUserAtHome")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("HMPresenceTypeUsersAtHome")))
  {
    if (a2 == 1)
      v4 = 1;
    else
      v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMPresenceTypeCurrentUserNotAtHome")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("HMPresenceTypeNoUserAtHome")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("HMPresenceTypeUsersNotAtHome")))
  {
    if (a2 == 1)
      v4 = 2;
    else
      v4 = 4;
  }
  else
  {
    v4 = kInvalidHMPresenceEventType;
  }

  return v4;
}

uint64_t userTypeForPresenceTypeAndGranularity(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeCurrentUserAtHome")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeCurrentUserNotAtHome")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeAnyUserAtHome")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeNoUserAtHome")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeUsersAtHome")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeUsersNotAtHome")))
  {
    v2 = 3;
  }
  else
  {
    v2 = kInvalidHMPresenceEventUserType;
  }

  return v2;
}

__CFString *presenceTypeForEventTypeAndGranularity(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __CFString ***v3;
  __CFString *result;

  switch(a1)
  {
    case 1:
    case 3:
      v2 = a2 - 1;
      if ((unint64_t)(a2 - 1) >= 3)
        goto LABEL_8;
      v3 = &off_1E3AAEB80;
      goto LABEL_6;
    case 2:
    case 4:
      v2 = a2 - 1;
      if ((unint64_t)(a2 - 1) >= 3)
        goto LABEL_8;
      v3 = &off_1E3AAEB98;
LABEL_6:
      result = *v3[v2];
      break;
    default:
LABEL_8:
      result = (__CFString *)0;
      break;
  }
  return result;
}

uint64_t granularityForEventType(uint64_t a1)
{
  char *v1;

  if ((unint64_t)(a1 - 1) >= 4)
    v1 = (char *)&kInvalidHMPresenceEventActivationGranularity;
  else
    v1 = (char *)&unk_19B44CD70 + 8 * a1 - 8;
  return *(_QWORD *)v1;
}

uint64_t HMAccessoryInfoProtoAccountInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_24:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_33;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          v23 = 0;
          goto LABEL_35;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_35:
      *(_BYTE *)(a1 + 32) = v23 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id _HMErrorFromOSStatus(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getHMErrorFromOSStatusSymbolLoc_ptr;
  v9 = getHMErrorFromOSStatusSymbolLoc_ptr;
  if (!getHMErrorFromOSStatusSymbolLoc_ptr)
  {
    v3 = (void *)CoreHAPLibrary();
    v2 = dlsym(v3, "HMErrorFromOSStatus");
    v7[3] = (uint64_t)v2;
    getHMErrorFromOSStatusSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  ((void (*)(uint64_t))v2)(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t CoreHAPLibrary()
{
  uint64_t v0;
  void *v2;

  if (CoreHAPLibraryCore_frameworkLibrary)
    return CoreHAPLibraryCore_frameworkLibrary;
  CoreHAPLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreHAPLibraryCore_frameworkLibrary;
  if (!CoreHAPLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getHAPTLVUnsignedNumberValueClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getHAPTLVUnsignedNumberValueClass_softClass;
  v7 = getHAPTLVUnsignedNumberValueClass_softClass;
  if (!getHAPTLVUnsignedNumberValueClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHAPTLVUnsignedNumberValueClass_block_invoke;
    v3[3] = &unk_1E3AB4620;
    v3[4] = &v4;
    __getHAPTLVUnsignedNumberValueClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19B25DFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHAPTLVUnsignedNumberValueClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  id *v6;

  CoreHAPLibrary();
  result = objc_getClass("HAPTLVUnsignedNumberValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHAPTLVUnsignedNumberValueClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[HMNetworkRouterWANStatus parsedFromData:error:](v3, v4, v5, v6);
  }
  return result;
}

void sub_19B25EB80(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B25FAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B25FDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B260FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_19B261A40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B261AA4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B261B34(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2624C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B262540(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2625BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B26262C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B265250(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B265350(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B265F84(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMImmutableSettingsProtoBoolSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMImmutableSettingsProtoBoolValueEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMImmutableSettingsProtoBoolValueEvent);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoolValueEventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B26817C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B2684A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B269068(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
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

void sub_19B2697D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B269834(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2699F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B269A74(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B269B14(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B269CBC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B269D38(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B269FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B26A09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B26A5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B26A7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _PreorderTraverseGroupsWithBlock(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, id, _QWORD);
  void *v7;
  void (**v8)(id, id, _QWORD);
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a1;
  v6 = a3;
  v6[2](v6, v5, a2);
  objc_msgSend(v5, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___PreorderTraverseGroupsWithBlock_block_invoke;
  v10[3] = &unk_1E3AAF0A0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "na_each:", v10);

}

__CFString *HMCameraAudioStreamSettingAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_1E3AAF140[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown audio stream setting %tu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19B26D84C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B26E8BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B26EA50(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B271264(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2714F0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B27177C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B271A08(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B271C94(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B271F20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2721AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMDaysOfTheWeekToString(char a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(CFSTR("<"), "mutableCopy");
  if ((a1 & 1) != 0)
  {
    appendDayToString(CFSTR("Sun"), v2);
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  appendDayToString(CFSTR("Mon"), v2);
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  appendDayToString(CFSTR("Tue"), v2);
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  appendDayToString(CFSTR("Wed"), v2);
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    appendDayToString(CFSTR("Fri"), v2);
    if ((a1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  appendDayToString(CFSTR("Thu"), v2);
  if ((a1 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((a1 & 0x40) != 0)
LABEL_8:
    appendDayToString(CFSTR("Sat"), v2);
LABEL_9:
  objc_msgSend(v2, "appendString:", CFSTR(">"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void appendDayToString(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "length") >= 2)
    objc_msgSend(v3, "appendString:", CFSTR(", "));
  objc_msgSend(v3, "appendString:", v4);

}

id HMDaysOfTheWeekToConciseString(char a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(CFSTR("<SuMTuWThFSa>"), "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("<"));
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "appendString:", CFSTR("Su"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v2, "appendString:", CFSTR("M"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v2, "appendString:", CFSTR("Tu"));
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v2, "appendString:", CFSTR("W"));
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v2, "appendString:", CFSTR("F"));
    if ((a1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v2, "appendString:", CFSTR("Th"));
  if ((a1 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((a1 & 0x40) != 0)
LABEL_8:
    objc_msgSend(v2, "appendString:", CFSTR("Sa"));
LABEL_9:
  objc_msgSend(v2, "appendString:", CFSTR(">"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

uint64_t HMDaysOfTheWeekForWeekday(char a1)
{
  return 1 << (a1 - 1);
}

id HMDaysOfTheWeekToDateComponents(int a1)
{
  void *v2;
  uint64_t i;
  id v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  for (i = 1; i != 8; ++i)
  {
    if (((1 << (i - 1)) & a1) != 0)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v4, "setWeekday:", i);
      objc_msgSend(v2, "addObject:", v4);

    }
  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

uint64_t HMDaysOfTheWeekFromDateComponents(void *a1, BOOL *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  BOOL *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v17 = a2;
  v18 = 0u;
  v19 = 0u;
  v4 = a2 != 0;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "calendar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v4 = (!v11 || (objc_msgSend(v11, "maximumRangeOfUnit:", 512) == 1 ? (v14 = v13 == 7) : (v14 = 0), v14))
          && (v15 = objc_msgSend(v10, "weekday"), (unint64_t)(v15 - 8) >= 0xFFFFFFFFFFFFFFF9)
          && (v7 |= (1 << (v15 - 1)), v4)
          && objc_msgSend(v10, "era") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "year") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "month") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "day") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "hour") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "minute") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "second") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "weekdayOrdinal") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "quarter") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "weekOfMonth") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "yearForWeekOfYear") == 0x7FFFFFFFFFFFFFFFLL;

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (v17)
    *v17 = v4;

  return v7;
}

void sub_19B278450(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B278710(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2787A0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B27893C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B278B58(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B278D20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B278E80(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B279094(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B27AC14(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_19B27AE34(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_19B27B898(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B27C634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14279(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14280(uint64_t a1)
{

}

id HMSoftwareUpdateAssetSourceAsString(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __HMSoftwareUpdateAssetSourceAsString_block_invoke;
  v4[3] = &__block_descriptor_40_e35_B32__0__NSString_8__NSNumber_16_B24l;
  v4[4] = a1;
  objc_msgSend(&unk_1E3B2FC60, "keysOfEntriesPassingTest:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_19B27D288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B27D6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B27DA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL isValidHMSoftwareUpdateAssetSourceString(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(&unk_1E3B2FC60, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

id validHMSoftwareUpdateAssetSourceStrings()
{
  id v0;
  void *v1;
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
  v0 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(&unk_1E3B2FC60, "allKeys", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5);
        if (objc_msgSend(v0, "length"))
          objc_msgSend(v0, "appendString:", CFSTR(", "));
        objc_msgSend(v0, "appendString:", v6);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  return v0;
}

uint64_t stringToHMSoftwareUpdateAssetSource(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(&unk_1E3B2FC60, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "unsignedIntValue");
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v1;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Invalid update asset source string %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

void sub_19B27ED88(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B27EE4C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B27F620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_19B27FC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B2806EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_19B280FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B281620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B281BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14589(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14590(uint64_t a1)
{

}

id _HMSignificantEventKeyPath(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("sunrise"))
    || objc_msgSend(v1, "isEqualToString:", CFSTR("sunset")))
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a significant event"), v1);
    v2 = 0;
  }

  return v2;
}

__CFString *HMStringFromPersonFaceCropSource(unint64_t a1)
{
  if (a1 < 5)
    return off_1E3AAF760[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown source: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19B289CD0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28A110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B28AAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B28AE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B28B508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B28B634(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28BBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMSoftwareUpdateNeedsAttentionReasonsToString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        v5 = v3 - 1;
        if ((unint64_t)(v3 - 1) <= 7 && ((0x8Bu >> v5) & 1) != 0)
        {
          v4 &= ~v3;
          objc_msgSend(v2, "addObject:", off_1E3AAF910[v5]);
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

void sub_19B28D484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B28D994(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19B28DDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *HMSoftwareUpdateStateToString(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("unknown");
  else
    return off_1E3AAF968[a1];
}

const __CFString *HMSoftwareUpdateUpdateTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E3AAF950[a1 - 1];
}

void sub_19B28E29C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28E564(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28E770(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28E7E8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28EA84(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28ECE8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B28EDC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id generateURLForHomeKitObject(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("com.apple.Home://"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHost:", v6);

  objc_msgSend(v3, "uuidString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/"), "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPath:", v8);

  if (objc_msgSend(v4, "count"))
  {
    v26 = v5;
    v28 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v27 = v4;
    obj = v4;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v14, "queryName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uuidString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v9, "objectForKeyedSubscript:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%@,%@"), v20, v16);
            v21 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v21;
          }
          objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v15, v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v15);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v11);
    }

    objc_msgSend(v9, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v26;
    objc_msgSend(v26, "setQueryItems:", v23);

    v4 = v27;
    v3 = v28;
  }
  objc_msgSend(v5, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

const __CFString *playbackStateAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("Unknown");
  else
    return off_1E3AAFAC0[a1 - 1];
}

void appendToShortDescription(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a1;
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (v5)
      objc_msgSend(v7, "appendFormat:", CFSTR("%@="), v5);
    objc_msgSend(v7, "appendFormat:", CFSTR("%@;"), v6);
  }

}

BOOL HMPBCharacteristicReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMPBServiceReference *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMPBServiceReference);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !HMPBServiceReferenceReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(HMPBServiceReference **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B291D3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2923A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B292444(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B293684(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id resolveProfiles(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __resolveProfiles_block_invoke;
  v7[3] = &unk_1E3AAFC50;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __resolveProfiles_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfileWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id getMPPlaybackArchiveClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPPlaybackArchiveClass_softClass;
  v7 = getMPPlaybackArchiveClass_softClass;
  if (!getMPPlaybackArchiveClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMPPlaybackArchiveClass_block_invoke;
    v3[3] = &unk_1E3AB4620;
    v3[4] = &v4;
    __getMPPlaybackArchiveClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19B2939A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPPlaybackArchiveClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MediaPlayerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MPPlaybackArchive");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getMPPlaybackArchiveClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19B293D1C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B293DEC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2960F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B296208(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B296AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B299924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMPBMediaPlaybackActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t result;
  void *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_34;
        case 2u:
          PBReaderReadData();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            -[HMPBMediaPlaybackAction addMediaProfiles:](a1, v19);

          continue;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        case 5u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_34;
        case 6u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_34:
          v27 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          break;
        v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
        *(_QWORD *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0)
          goto LABEL_36;
        v20 += 7;
        v14 = v21++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_38:
      *(_DWORD *)(a1 + 16) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMAccessoryInfoProtoPublicPairingIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id HMINControlHomeIntentShortDescription(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  appendToShortDescription(v6, CFSTR("IntentIdentifier"), v10);
  objc_msgSend(v9, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v6, CFSTR("home"), v12);

  objc_msgSend(v9, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v6, CFSTR("homeIdentifier"), v14);

  objc_msgSend(v9, "scene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v6, CFSTR("scene"), v16);

  objc_msgSend(v9, "scene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v6, CFSTR("sceneIdentifier"), v18);

  appendToShortDescription(v6, CFSTR("outcome"), v4);
  return v6;
}

uint64_t HMRemoteEventRouterProtoConnectedClientInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B29DA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B29E1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B29E41C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B29EE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B29F2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B29F4B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ____requestFetch_block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1[4], "softwareUpdateManager:didReceiveRequestToFetchUpdateWithCompletionHandler:", a1[5], a1[6]);
  }
  else
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = a1[5];
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling legacy fetch delegate", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = a1[4];
    v7 = a1[5];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ____requestFetch_block_invoke_147;
    v8[3] = &unk_1E3AAFEB8;
    v9 = a1[6];
    objc_msgSend(v6, "softwareUpdateManager:didReceiveRequestToFetchWithCompletionHandler:", v7, v8);

  }
}

uint64_t ____requestFetch_block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_19B29FDF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_19B2A010C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMStringFromCameraClipEncryptionScheme(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
  {
    v1 = CFSTR("AES256GCM");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown scheme: %lu>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

BOOL HMPBServiceReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMPBAccessoryReference *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMPBAccessoryReference);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !HMPBAccessoryReferenceReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(HMPBAccessoryReference **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMMediaGroupProtoMediaDestinationAggregateDataReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  HMMediaGroupProtoMediaGroupData *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v18 = objc_alloc_init(HMMediaGroupProtoMediaGroupData);
        objc_msgSend(a1, "addGroup:", v18);
        if (!PBReaderPlaceMark() || (HMMediaGroupProtoMediaGroupDataReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(HMMediaGroupProtoMediaDestination);
        objc_msgSend(a1, "addDestination:", v18);
        if (!PBReaderPlaceMark()
          || (HMMediaGroupProtoMediaDestinationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_31:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(HMMediaGroupProtoMediaDestinationControllerData);
    objc_msgSend(a1, "addDestinationControllerData:", v18);
    if (!PBReaderPlaceMark()
      || (HMMediaGroupProtoMediaDestinationControllerDataReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B2A7B18(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2A7B9C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMNetworkStatusAsString(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  __CFString *v4;

  if (!a1)
  {
    v4 = CFSTR("Good");
    return v4;
  }
  v1 = a1;
  if ((a1 & 1) != 0)
  {
    v4 = CFSTR("Unknown");
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((v1 & 2) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Cable Not Connected"));
    if ((v1 & 4) == 0)
    {
LABEL_5:
      if ((v1 & 8) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((v1 & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v3, "addObject:", CFSTR("No IP address"));
  if ((v1 & 8) == 0)
  {
LABEL_6:
    if ((v1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "addObject:", CFSTR("No Gateway"));
  if ((v1 & 0x10) == 0)
  {
LABEL_7:
    if ((v1 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "addObject:", CFSTR("Gateway Not Reachable"));
  if ((v1 & 0x20) == 0)
  {
LABEL_8:
    if ((v1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "addObject:", CFSTR("No DNS Servers"));
  if ((v1 & 0x40) == 0)
  {
LABEL_9:
    if ((v1 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "addObject:", CFSTR("DNS Servers Not Reachable"));
  if ((v1 & 0x80) == 0)
  {
LABEL_10:
    if ((v1 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "addObject:", CFSTR("Authentication Failure"));
  if ((v1 & 0x100) == 0)
  {
LABEL_11:
    if ((v1 & 0x20000000) == 0)
      goto LABEL_12;
LABEL_26:
    objc_msgSend(v3, "addObject:", CFSTR("Not Ready"));
    if ((v1 & 0x40000000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_25:
  objc_msgSend(v3, "addObject:", CFSTR("Walled"));
  if ((v1 & 0x20000000) != 0)
    goto LABEL_26;
LABEL_12:
  if ((v1 & 0x40000000) != 0)
LABEL_13:
    objc_msgSend(v3, "addObject:", CFSTR("Satellite Not Connected"));
LABEL_14:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL HMXPCEventRouterProtoChangeRegistrationsMessageReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  void *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 4)
        break;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(a1, "addTopicFilterAdditions:", v17);
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(a1, "addTopicFilterRemovals:", v17);
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B2AA788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_19B2AB6B0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B039C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTRSetupPayloadClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MatterLibraryCore_frameworkLibrary)
  {
    MatterLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MatterLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MTRSetupPayload");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getMTRSetupPayloadClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const __CFString *HMMMTransportRestrictionToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E3AB0108[a1];
}

const __CFString *HMMMUserRestrictionToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E3AB00F0[a1];
}

uint64_t HMAccessoryDiagnosticInfoProtoIdsInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoIntegerValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id hm_assistantIdentifierWithSalts(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDForAssistantFromBaseUUID:withSalts:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (a2 && v7)
  {
    objc_msgSend(CFSTR("X-HM://A/"), "stringByAppendingFormat:", CFSTR("%@=%@"), v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmf_stringWithSmallestEncoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

id hm_assistantIdentifier(void *a1, uint64_t a2)
{
  return hm_assistantIdentifierWithSalts(a1, a2, 0);
}

void sub_19B2B373C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B3878(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B38C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B41B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_19B2B4C94(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B4CF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B4DD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B4EC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2B6DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19B2B7F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a54, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21055(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21056(uint64_t a1)
{

}

__CFString *HMMediaDestinationControllerSupportOptionsAsString(unint64_t a1)
{
  char v1;
  __CFString *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;

  if (a1)
  {
    v1 = a1;
    v2 = &stru_1E3AB7688;
    if (a1 >= 8)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("unknown(%@) "), v4);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v5 = CFSTR("HP ");
    if ((v1 & 1) == 0)
      v5 = &stru_1E3AB7688;
    v6 = CFSTR("HPM ");
    if ((v1 & 2) == 0)
      v6 = &stru_1E3AB7688;
    v7 = CFSTR("HP+ ");
    if ((v1 & 4) == 0)
      v7 = &stru_1E3AB7688;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("< %@%@%@%@>"), v5, v6, v7, v2);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("<None>");
  }
  return v8;
}

void sub_19B2BDEF4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2BE0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

id getHomeConfigurationVersion()
{
  CFIndex AppIntegerValue;
  BOOL v1;
  uint64_t v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("kHomeConfigurationVersionKey"), CFSTR("com.apple.homed"), &keyExistsAndHasValidFormat);
  if (AppIntegerValue)
    v1 = keyExistsAndHasValidFormat == 0;
  else
    v1 = 1;
  if (v1)
    v2 = -1;
  else
    v2 = AppIntegerValue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id getAssistantConfigurationVersion()
{
  void *v0;
  void *v1;
  id v2;

  _getNumberValueForKey(CFSTR("kAssistantConfigurationVersionKey"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
    v0 = &unk_1E3B2E500;
  v2 = v0;

  return v2;
}

id _getNumberValueForKey(const __CFString *a1)
{
  CFIndex AppIntegerValue;
  void *v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(a1, CFSTR("com.apple.homed"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", AppIntegerValue);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id getAssistantConfigurationSnapshot()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  getAssistantConfigurationVersion();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _getNumberValueForKey(CFSTR("kAssistantConfigurationNumberOfEntitiesKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), v0, v2 + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id getLastSyncedAssistantConfigurationVersion()
{
  void *v0;
  id v1;
  void *v2;

  _getNumberValueForKey(CFSTR("kLastSyncedAssistantConfigurationVersionKey"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "unsignedIntegerValue"))
  {
    v1 = v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  v2 = v1;

  return v2;
}

BOOL areIncomingInvitesPresent()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kIncomingInvitesPresent"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL HMHomeManagerAreAnyAccessoriesConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kAccessoriesConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL HMHomeManagerAreAnySpeakersConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kSpeakersConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL areAnyHomePodMiniConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMSmallHomePodsConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL areAnyLargeHomePodConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMHomePod_6_1_ConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL areAnyHomePodsConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMHomePodsConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL HMHomeManagerAreAnyTelevisionAccessoriesConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMTelevisionAccessoriesConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL HMHomeManagerAreAnyAppleTVAccessoriesConfigured()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("HMAppleTVAccessoriesConfiguredStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

BOOL HMHomeManagerIsDemoModeActive()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("kHMDDemoModeStatusKey"), CFSTR("com.apple.homed"), 0) != 0;
}

void runOnMainQueue(void *a1)
{
  id v1;
  id v2;
  _QWORD block[4];
  id v4;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __runOnMainQueue_block_invoke;
  block[3] = &unk_1E3AB6078;
  v4 = v1;
  v2 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __runOnMainQueue_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void initializeMappingsAndPaths()
{
  if (initializeMappingsAndPaths_pred != -1)
    dispatch_once(&initializeMappingsAndPaths_pred, &__block_literal_global_22112);
}

id localizationKeyForAccessoryCategoryType(void *a1)
{
  if (a1)
  {
    objc_msgSend((id)accessoryCategoryLocalizationSingularKeyMapping, "objectForKeyedSubscript:", a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id pluralLocalizationKeyForAccessoryCategoryType(void *a1)
{
  if (a1)
  {
    objc_msgSend((id)accessoryCategoryLocalizationPluralKeyMapping, "objectForKeyedSubscript:", a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id HMHomeKitCacheDirectory()
{
  return HMCacheSubdirectoryWithRelativePath(CFSTR("com.apple.HomeKit"));
}

id HMCreateHomeKitCacheDirectory()
{
  void *v0;
  void *v1;
  char v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HMCacheSubdirectoryWithRelativePath(CFSTR("com.apple.HomeKit"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v2 = objc_msgSend(v1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v0, 1, 0, &v9);
  v3 = v9;

  if ((v2 & 1) != 0)
  {
    v4 = v0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v0;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HomeKit cache directory %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

id HMConfigurationsCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = CFSTR("com.apple.HomeKit");
  HMClientScopedHomeKitCacheDirectoryName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v6[2] = CFSTR("com.apple.HomeKit.configurations");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathWithComponents:", v2, v6[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HMCacheSubdirectoryWithRelativePath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HMFrameworkCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = CFSTR("com.apple.HomeKit");
  HMClientScopedHomeKitCacheDirectoryName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v6[2] = CFSTR("com.apple.HomeKit.HMCache");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathWithComponents:", v2, v6[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HMCacheSubdirectoryWithRelativePath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HMSoftwareUpdateCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = CFSTR("com.apple.HomeKit");
  HMClientScopedHomeKitCacheDirectoryName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v6[2] = CFSTR("com.apple.HomeKit.SoftwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathWithComponents:", v2, v6[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HMCacheSubdirectoryWithRelativePath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HMCreateSoftwareUpdateCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  HMClientScopedHomeKitCacheDirectoryName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = CFSTR("com.apple.HomeKit.SoftwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HMCreateHomeKitCacheSubdirectoryWithRelativePathComponents(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t isAllowedCharType(void *a1)
{
  id v1;
  void *v2;
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
  v1 = a1;
  if (v1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    allowedCharValueTypes();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v9;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            goto LABEL_12;
          }
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }

    v6 = 0;
  }
  else
  {
LABEL_12:
    v6 = 1;
  }

  return v6;
}

void sub_19B2BFF18(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x19B2BFECCLL);
  }
  _Unwind_Resume(a1);
}

BOOL HMAreStringsEqualIgnoringCase(__CFString *a1, const __CFString *a2)
{
  const __CFString *v2;

  if (!a1)
    a1 = &stru_1E3AB7688;
  if (a2)
    v2 = a2;
  else
    v2 = &stru_1E3AB7688;
  return -[__CFString caseInsensitiveCompare:](a1, "caseInsensitiveCompare:", v2) == 0;
}

id HMTimedRotatedUUID(id a1, void *a2, unint64_t a3, void *a4)
{
  id v4;
  uint64_t v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v15;

  v4 = a1;
  if (a1)
  {
    if (a3 <= 1)
      v6 = 1;
    else
      v6 = a3;
    v7 = a2;
    v8 = v4;
    objc_msgSend(a4, "timeIntervalSince1970");
    v15 = (unint64_t)(v9 * 1000.0) / (86400000 * v6);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v7, "length") + 8);
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "appendData:", v11);
    objc_msgSend(v10, "appendBytes:length:", &v15, 8);
    v12 = (void *)MEMORY[0x1E0CB3A28];
    v13 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend(v12, "hmf_UUIDWithNamespace:data:", v13, v10);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id HMDailyRotatedUUID(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99D68];
  v2 = a1;
  objc_msgSend(v1, "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HMTimedRotatedUUID(v2, CFSTR("0259F789-5C52-4436-85CF-9EC109813484"), 1uLL, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HMGenerateDecimalDigitPasswordWithLength(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = SecPasswordCreateWithRandomDigits();
  v4 = (void *)v3;
  if (a2 && !v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 52, 0, 0, 0, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t HMIsPasswordWeak()
{
  return SecPasswordIsPasswordWeak2();
}

uint64_t HMMaxLengthForNaming()
{
  if (HMMaxLengthForNaming__hmf_once_t5 != -1)
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
  return HMMaxLengthForNaming__hmf_once_v6;
}

void *HMArabicNumeralByChineseNumeralDictionary()
{
  return &unk_1E3B303E0;
}

void HMDispatchToContextQueueIfNotNil(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_msgSend(v6, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v8, v7);

  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = v5;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to dispatch to context queue due to nil context", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

id HMTransientIdentifier()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  v1[1] = 0;
  MEMORY[0x1A1AC20D0](v1);
  LODWORD(v1[0]) = -1431655766;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v1);
}

id HMExceptionForError(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v1 = a1;
  if ((objc_msgSend(v1, "isHMError") & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1E0C99DA0];
    v3 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", objc_msgSend(v1, "code"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return (id)HMAccessoryUUIDsAsStringForAccessories(v7);
  }
}

id HMAccessoryUUIDsAsStringForAccessories(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "uuid", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

id HMDateFromDateWithHourAndMinuteComponents(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = *MEMORY[0x1E0C996C8];
  v7 = a1;
  objc_msgSend(v5, "calendarWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHour:", a2);
  objc_msgSend(v9, "setMinute:", a3);
  objc_msgSend(v9, "setSecond:", 0);
  objc_msgSend(v8, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id HMDateComponentFromSecondsOfDay(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  unint64_t v4;

  v1 = (objc_class *)MEMORY[0x1E0C99D78];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = objc_msgSend(v2, "integerValue");

  objc_msgSend(v3, "setValue:forComponent:", v4 / 0xE10, 32);
  objc_msgSend(v3, "setValue:forComponent:", v4 % 0xE10 / 0x3C, 64);
  return v3;
}

uint64_t HMSecondsFromDateComponent(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = a1;
  v3 = 3600 * objc_msgSend(v2, "valueForComponent:", 32);
  v4 = objc_msgSend(v2, "valueForComponent:", 64);

  return objc_msgSend(v1, "numberWithInteger:", v3 + 60 * v4);
}

id HMMatterScheduleIntervalFromStartAndEndDates(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a1;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 96, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "hour") == 23 && objc_msgSend(v7, "minute") == 59)
  {
    objc_msgSend(v3, "timeIntervalSince1970");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(60 * ((int)v8 / 60) + 60));
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v3);

  return v10;
}

double HMDSecureClassBulletinUserAttributionTime()
{
  if (HMDSecureClassBulletinUserAttributionTime__hmf_once_t10 != -1)
    dispatch_once(&HMDSecureClassBulletinUserAttributionTime__hmf_once_t10, &__block_literal_global_119);
  return *(double *)&HMDSecureClassBulletinUserAttributionTime__hmf_once_v11;
}

uint64_t isRestoreSupportedForCharacteristic(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    if (isRestoreSupportedForCharacteristic_onceToken != -1)
      dispatch_once(&isRestoreSupportedForCharacteristic_onceToken, &__block_literal_global_22381);
    v2 = objc_msgSend((id)isRestoreSupportedForCharacteristic_supportedRestoreCharacteristics, "containsObject:", v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __isRestoreSupportedForCharacteristic_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("00000025-0000-1000-8000-0026BB765291");
  v2[1] = CFSTR("000000B0-0000-1000-8000-0026BB765291");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isRestoreSupportedForCharacteristic_supportedRestoreCharacteristics;
  isRestoreSupportedForCharacteristic_supportedRestoreCharacteristics = v0;

}

__CFString *HMAccessoryInfoOptionAsString(uint64_t a1)
{
  char v1;
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v1 = a1;
    v2 = &stru_1E3AB7688;
    if ((a1 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), &stru_1E3AB7688, CFSTR("HMAccessoryInfoOptionWifi"));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0)
          return v2;
        goto LABEL_9;
      }
    }
    else if ((a1 & 2) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v2, CFSTR("HMAccessoryInfoOptionAccount"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
    if ((v1 & 4) != 0)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v2, CFSTR("HMAccessoryInfoOptionPrimaryUser"));
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (__CFString *)v4;
    }
  }
  else
  {
    v2 = CFSTR("AccessoryInfoNoOption");
  }
  return v2;
}

id HMAccessoryInfoEventTopicsFromOption(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)objc_opt_new();
    if ((a1 & 1) != 0)
    {
      +[HMAccessoryEventTopic topicFromSuffixID:homeUUID:accessoryUUID:](HMAccessoryEventTopic, "topicFromSuffixID:homeUUID:accessoryUUID:", 504, v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      if ((a1 & 2) == 0)
      {
LABEL_4:
        if ((a1 & 4) == 0)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    else if ((a1 & 2) == 0)
    {
      goto LABEL_4;
    }
    +[HMAccessoryEventTopic topicFromSuffixID:homeUUID:accessoryUUID:](HMAccessoryEventTopic, "topicFromSuffixID:homeUUID:accessoryUUID:", 510, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    if ((a1 & 4) != 0)
    {
LABEL_9:
      +[HMAccessoryEventTopic topicFromSuffixID:homeUUID:accessoryUUID:](HMAccessoryEventTopic, "topicFromSuffixID:homeUUID:accessoryUUID:", 503, v5, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_10:

  return v7;
}

void sub_19B2C33F0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2C34A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2C3670(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2C36BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2C614C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2C6E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B2C715C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMAccessoryCurrentNetworkProtectionModeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4)
    return off_1E3AB0B10[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMAccessoryNetworkProtectionModeAsString(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 0:
      return CFSTR("Auto");
    case 3:
      return CFSTR("Open");
    case 1:
      v1 = CFSTR("HomeKit Only");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

__CFString *HMAccessoryWiFiCredentialTypeAsString(unint64_t a1)
{
  if (a1 < 4)
    return off_1E3AB0B30[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __Block_byref_object_copy__23098(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23099(uint64_t a1)
{

}

void sub_19B2C965C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (UIKitLibraryCore_frameworkLibrary)
    return UIKitLibraryCore_frameworkLibrary;
  UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

unint64_t SoftwareUpdateV2ErrorCodeFromSUControllerErrorCode(unint64_t result)
{
  if (result > 0x3B)
    return -1;
  return result;
}

void sub_19B2CCD2C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2CCDF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2CCE50(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2CCF68(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2CD02C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2CD08C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2CD104(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2CF3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMProtoResidentCapabilitiesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  char v116;
  unsigned int v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  char v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  char v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  char v140;
  unsigned int v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char v145;
  char v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  unsigned int v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  char v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  char v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  char v169;
  char v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  char v175;
  char v176;
  unsigned int v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  char v181;
  char v182;
  unsigned int v183;
  uint64_t v184;
  uint64_t v185;
  unint64_t v186;
  char v187;
  char v188;
  unsigned int v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  char v193;
  char v194;
  unsigned int v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  char v199;
  char v200;
  unsigned int v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  char v205;
  char v206;
  unsigned int v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  char v211;
  char v212;
  unsigned int v213;
  uint64_t v214;
  uint64_t v215;
  unint64_t v216;
  char v217;
  char v218;
  unsigned int v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  char v223;
  char v224;
  unsigned int v225;
  uint64_t v226;
  uint64_t v227;
  unint64_t v228;
  char v229;
  char v230;
  unsigned int v231;
  uint64_t v232;
  uint64_t v233;
  unint64_t v234;
  char v235;
  BOOL v236;
  uint64_t v237;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v17;

          continue;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_QWORD *)(a1 + 52) |= 0x400uLL;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_277;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_277:
          v236 = v22 != 0;
          v237 = 26;
          goto LABEL_418;
        case 5u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_QWORD *)(a1 + 52) |= 0x8000000uLL;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_281;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_281:
          v236 = v28 != 0;
          v237 = 43;
          goto LABEL_418;
        case 6u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_QWORD *)(a1 + 52) |= 0x10000000uLL;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_285;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_285:
          v236 = v34 != 0;
          v237 = 44;
          goto LABEL_418;
        case 7u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_QWORD *)(a1 + 52) |= 0x400000uLL;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_289;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_289:
          v236 = v40 != 0;
          v237 = 38;
          goto LABEL_418;
        case 8u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_QWORD *)(a1 + 52) |= 0x1000uLL;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_293;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_293:
          v236 = v46 != 0;
          v237 = 28;
          goto LABEL_418;
        case 9u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_QWORD *)(a1 + 52) |= 0x20000uLL;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  v52 = 0;
                  goto LABEL_297;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v52 = 0;
LABEL_297:
          v236 = v52 != 0;
          v237 = 33;
          goto LABEL_418;
        case 0xAu:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_QWORD *)(a1 + 52) |= 0x2000000uLL;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
              *(_QWORD *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  v58 = 0;
                  goto LABEL_301;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v58 = 0;
LABEL_301:
          v236 = v58 != 0;
          v237 = 41;
          goto LABEL_418;
        case 0xBu:
          v62 = 0;
          v63 = 0;
          v64 = 0;
          *(_QWORD *)(a1 + 52) |= 0x100uLL;
          while (2)
          {
            v65 = *v3;
            v66 = *(_QWORD *)(a2 + v65);
            if (v66 == -1 || v66 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
              *(_QWORD *)(a2 + v65) = v66 + 1;
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                v14 = v63++ >= 9;
                if (v14)
                {
                  v64 = 0;
                  goto LABEL_305;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v64 = 0;
LABEL_305:
          v236 = v64 != 0;
          v237 = 24;
          goto LABEL_418;
        case 0xCu:
          v68 = 0;
          v69 = 0;
          v70 = 0;
          *(_QWORD *)(a1 + 52) |= 0x10000uLL;
          while (2)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            if (v72 == -1 || v72 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
              *(_QWORD *)(a2 + v71) = v72 + 1;
              v70 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                v14 = v69++ >= 9;
                if (v14)
                {
                  v70 = 0;
                  goto LABEL_309;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v70 = 0;
LABEL_309:
          v236 = v70 != 0;
          v237 = 32;
          goto LABEL_418;
        case 0xDu:
          v74 = 0;
          v75 = 0;
          v76 = 0;
          *(_QWORD *)(a1 + 52) |= 0x800000uLL;
          while (2)
          {
            v77 = *v3;
            v78 = *(_QWORD *)(a2 + v77);
            if (v78 == -1 || v78 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v78);
              *(_QWORD *)(a2 + v77) = v78 + 1;
              v76 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                v14 = v75++ >= 9;
                if (v14)
                {
                  v76 = 0;
                  goto LABEL_313;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v76 = 0;
LABEL_313:
          v236 = v76 != 0;
          v237 = 39;
          goto LABEL_418;
        case 0xEu:
          v80 = 0;
          v81 = 0;
          v82 = 0;
          *(_QWORD *)(a1 + 52) |= 0x800uLL;
          while (2)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            if (v84 == -1 || v84 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
              *(_QWORD *)(a2 + v83) = v84 + 1;
              v82 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                v14 = v81++ >= 9;
                if (v14)
                {
                  v82 = 0;
                  goto LABEL_317;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v82 = 0;
LABEL_317:
          v236 = v82 != 0;
          v237 = 27;
          goto LABEL_418;
        case 0xFu:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          *(_QWORD *)(a1 + 52) |= 0x40uLL;
          while (2)
          {
            v89 = *v3;
            v90 = *(_QWORD *)(a2 + v89);
            if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v90);
              *(_QWORD *)(a2 + v89) = v90 + 1;
              v88 |= (unint64_t)(v91 & 0x7F) << v86;
              if (v91 < 0)
              {
                v86 += 7;
                v14 = v87++ >= 9;
                if (v14)
                {
                  v88 = 0;
                  goto LABEL_321;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v88 = 0;
LABEL_321:
          v236 = v88 != 0;
          v237 = 22;
          goto LABEL_418;
        case 0x10u:
          v92 = 0;
          v93 = 0;
          v94 = 0;
          *(_QWORD *)(a1 + 52) |= 0x200000000uLL;
          while (2)
          {
            v95 = *v3;
            v96 = *(_QWORD *)(a2 + v95);
            if (v96 == -1 || v96 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v97 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v96);
              *(_QWORD *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                v14 = v93++ >= 9;
                if (v14)
                {
                  v94 = 0;
                  goto LABEL_325;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v94 = 0;
LABEL_325:
          v236 = v94 != 0;
          v237 = 49;
          goto LABEL_418;
        case 0x11u:
          v98 = 0;
          v99 = 0;
          v100 = 0;
          *(_QWORD *)(a1 + 52) |= 0x80000uLL;
          while (2)
          {
            v101 = *v3;
            v102 = *(_QWORD *)(a2 + v101);
            if (v102 == -1 || v102 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
              *(_QWORD *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                v14 = v99++ >= 9;
                if (v14)
                {
                  v100 = 0;
                  goto LABEL_329;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v100 = 0;
LABEL_329:
          v236 = v100 != 0;
          v237 = 35;
          goto LABEL_418;
        case 0x12u:
          v104 = 0;
          v105 = 0;
          v106 = 0;
          *(_QWORD *)(a1 + 52) |= 0x400000000uLL;
          while (2)
          {
            v107 = *v3;
            v108 = *(_QWORD *)(a2 + v107);
            if (v108 == -1 || v108 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v109 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v108);
              *(_QWORD *)(a2 + v107) = v108 + 1;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                v14 = v105++ >= 9;
                if (v14)
                {
                  v106 = 0;
                  goto LABEL_333;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v106 = 0;
LABEL_333:
          v236 = v106 != 0;
          v237 = 50;
          goto LABEL_418;
        case 0x13u:
          v110 = 0;
          v111 = 0;
          v112 = 0;
          *(_QWORD *)(a1 + 52) |= 0x200uLL;
          while (2)
          {
            v113 = *v3;
            v114 = *(_QWORD *)(a2 + v113);
            if (v114 == -1 || v114 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v115 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v114);
              *(_QWORD *)(a2 + v113) = v114 + 1;
              v112 |= (unint64_t)(v115 & 0x7F) << v110;
              if (v115 < 0)
              {
                v110 += 7;
                v14 = v111++ >= 9;
                if (v14)
                {
                  v112 = 0;
                  goto LABEL_337;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v112 = 0;
LABEL_337:
          v236 = v112 != 0;
          v237 = 25;
          goto LABEL_418;
        case 0x14u:
          v116 = 0;
          v117 = 0;
          v118 = 0;
          *(_QWORD *)(a1 + 52) |= 0x20uLL;
          while (2)
          {
            v119 = *v3;
            v120 = *(_QWORD *)(a2 + v119);
            if (v120 == -1 || v120 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v121 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v120);
              *(_QWORD *)(a2 + v119) = v120 + 1;
              v118 |= (unint64_t)(v121 & 0x7F) << v116;
              if (v121 < 0)
              {
                v116 += 7;
                v14 = v117++ >= 9;
                if (v14)
                {
                  v118 = 0;
                  goto LABEL_341;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v118 = 0;
LABEL_341:
          v236 = v118 != 0;
          v237 = 21;
          goto LABEL_418;
        case 0x15u:
          v122 = 0;
          v123 = 0;
          v124 = 0;
          *(_QWORD *)(a1 + 52) |= 0x80uLL;
          while (2)
          {
            v125 = *v3;
            v126 = *(_QWORD *)(a2 + v125);
            if (v126 == -1 || v126 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v127 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v126);
              *(_QWORD *)(a2 + v125) = v126 + 1;
              v124 |= (unint64_t)(v127 & 0x7F) << v122;
              if (v127 < 0)
              {
                v122 += 7;
                v14 = v123++ >= 9;
                if (v14)
                {
                  v124 = 0;
                  goto LABEL_345;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v124 = 0;
LABEL_345:
          v236 = v124 != 0;
          v237 = 23;
          goto LABEL_418;
        case 0x16u:
          v128 = 0;
          v129 = 0;
          v130 = 0;
          *(_QWORD *)(a1 + 52) |= 0x40000000uLL;
          while (2)
          {
            v131 = *v3;
            v132 = *(_QWORD *)(a2 + v131);
            if (v132 == -1 || v132 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v133 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v132);
              *(_QWORD *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                v14 = v129++ >= 9;
                if (v14)
                {
                  v130 = 0;
                  goto LABEL_349;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v130 = 0;
LABEL_349:
          v236 = v130 != 0;
          v237 = 46;
          goto LABEL_418;
        case 0x17u:
          v134 = 0;
          v135 = 0;
          v136 = 0;
          *(_QWORD *)(a1 + 52) |= 0x20000000uLL;
          while (2)
          {
            v137 = *v3;
            v138 = *(_QWORD *)(a2 + v137);
            if (v138 == -1 || v138 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v139 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v138);
              *(_QWORD *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                v14 = v135++ >= 9;
                if (v14)
                {
                  v136 = 0;
                  goto LABEL_353;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v136 = 0;
LABEL_353:
          v236 = v136 != 0;
          v237 = 45;
          goto LABEL_418;
        case 0x18u:
          v140 = 0;
          v141 = 0;
          v142 = 0;
          *(_QWORD *)(a1 + 52) |= 0x2000uLL;
          while (2)
          {
            v143 = *v3;
            v144 = *(_QWORD *)(a2 + v143);
            if (v144 == -1 || v144 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v145 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v144);
              *(_QWORD *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                v14 = v141++ >= 9;
                if (v14)
                {
                  v142 = 0;
                  goto LABEL_357;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v142 = 0;
LABEL_357:
          v236 = v142 != 0;
          v237 = 29;
          goto LABEL_418;
        case 0x19u:
          v146 = 0;
          v147 = 0;
          v148 = 0;
          *(_QWORD *)(a1 + 52) |= 0x100000000uLL;
          while (2)
          {
            v149 = *v3;
            v150 = *(_QWORD *)(a2 + v149);
            if (v150 == -1 || v150 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v151 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v150);
              *(_QWORD *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                v14 = v147++ >= 9;
                if (v14)
                {
                  v148 = 0;
                  goto LABEL_361;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v148 = 0;
LABEL_361:
          v236 = v148 != 0;
          v237 = 48;
          goto LABEL_418;
        case 0x1Au:
          v152 = 0;
          v153 = 0;
          v154 = 0;
          *(_QWORD *)(a1 + 52) |= 0x40000uLL;
          while (2)
          {
            v155 = *v3;
            v156 = *(_QWORD *)(a2 + v155);
            if (v156 == -1 || v156 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v157 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v156);
              *(_QWORD *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                v14 = v153++ >= 9;
                if (v14)
                {
                  v154 = 0;
                  goto LABEL_365;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v154 = 0;
LABEL_365:
          v236 = v154 != 0;
          v237 = 34;
          goto LABEL_418;
        case 0x1Bu:
          v158 = 0;
          v159 = 0;
          v160 = 0;
          *(_QWORD *)(a1 + 52) |= 0x4000000uLL;
          while (2)
          {
            v161 = *v3;
            v162 = *(_QWORD *)(a2 + v161);
            if (v162 == -1 || v162 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v163 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v162);
              *(_QWORD *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                v14 = v159++ >= 9;
                if (v14)
                {
                  v160 = 0;
                  goto LABEL_369;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v160 = 0;
LABEL_369:
          v236 = v160 != 0;
          v237 = 42;
          goto LABEL_418;
        case 0x1Cu:
          v164 = 0;
          v165 = 0;
          v166 = 0;
          *(_QWORD *)(a1 + 52) |= 0x80000000uLL;
          while (2)
          {
            v167 = *v3;
            v168 = *(_QWORD *)(a2 + v167);
            if (v168 == -1 || v168 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v169 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v168);
              *(_QWORD *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                v14 = v165++ >= 9;
                if (v14)
                {
                  v166 = 0;
                  goto LABEL_373;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v166 = 0;
LABEL_373:
          v236 = v166 != 0;
          v237 = 47;
          goto LABEL_418;
        case 0x1Du:
          v170 = 0;
          v171 = 0;
          v172 = 0;
          *(_QWORD *)(a1 + 52) |= 1uLL;
          while (2)
          {
            v173 = *v3;
            v174 = *(_QWORD *)(a2 + v173);
            if (v174 == -1 || v174 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v175 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v174);
              *(_QWORD *)(a2 + v173) = v174 + 1;
              v172 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                v14 = v171++ >= 9;
                if (v14)
                {
                  v172 = 0;
                  goto LABEL_377;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v172 = 0;
LABEL_377:
          v236 = v172 != 0;
          v237 = 16;
          goto LABEL_418;
        case 0x1Eu:
          v176 = 0;
          v177 = 0;
          v178 = 0;
          *(_QWORD *)(a1 + 52) |= 0x8000uLL;
          while (2)
          {
            v179 = *v3;
            v180 = *(_QWORD *)(a2 + v179);
            if (v180 == -1 || v180 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v181 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v180);
              *(_QWORD *)(a2 + v179) = v180 + 1;
              v178 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                v14 = v177++ >= 9;
                if (v14)
                {
                  v178 = 0;
                  goto LABEL_381;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v178 = 0;
LABEL_381:
          v236 = v178 != 0;
          v237 = 31;
          goto LABEL_418;
        case 0x1Fu:
          v182 = 0;
          v183 = 0;
          v184 = 0;
          *(_QWORD *)(a1 + 52) |= 0x200000uLL;
          while (2)
          {
            v185 = *v3;
            v186 = *(_QWORD *)(a2 + v185);
            if (v186 == -1 || v186 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v187 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v186);
              *(_QWORD *)(a2 + v185) = v186 + 1;
              v184 |= (unint64_t)(v187 & 0x7F) << v182;
              if (v187 < 0)
              {
                v182 += 7;
                v14 = v183++ >= 9;
                if (v14)
                {
                  v184 = 0;
                  goto LABEL_385;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v184 = 0;
LABEL_385:
          v236 = v184 != 0;
          v237 = 37;
          goto LABEL_418;
        case 0x20u:
          v188 = 0;
          v189 = 0;
          v190 = 0;
          *(_QWORD *)(a1 + 52) |= 0x4000uLL;
          while (2)
          {
            v191 = *v3;
            v192 = *(_QWORD *)(a2 + v191);
            if (v192 == -1 || v192 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v193 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v192);
              *(_QWORD *)(a2 + v191) = v192 + 1;
              v190 |= (unint64_t)(v193 & 0x7F) << v188;
              if (v193 < 0)
              {
                v188 += 7;
                v14 = v189++ >= 9;
                if (v14)
                {
                  v190 = 0;
                  goto LABEL_389;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v190 = 0;
LABEL_389:
          v236 = v190 != 0;
          v237 = 30;
          goto LABEL_418;
        case 0x21u:
          v194 = 0;
          v195 = 0;
          v196 = 0;
          *(_QWORD *)(a1 + 52) |= 0x1000000uLL;
          while (2)
          {
            v197 = *v3;
            v198 = *(_QWORD *)(a2 + v197);
            if (v198 == -1 || v198 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v199 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v198);
              *(_QWORD *)(a2 + v197) = v198 + 1;
              v196 |= (unint64_t)(v199 & 0x7F) << v194;
              if (v199 < 0)
              {
                v194 += 7;
                v14 = v195++ >= 9;
                if (v14)
                {
                  v196 = 0;
                  goto LABEL_393;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v196 = 0;
LABEL_393:
          v236 = v196 != 0;
          v237 = 40;
          goto LABEL_418;
        case 0x22u:
          v200 = 0;
          v201 = 0;
          v202 = 0;
          *(_QWORD *)(a1 + 52) |= 0x10uLL;
          while (2)
          {
            v203 = *v3;
            v204 = *(_QWORD *)(a2 + v203);
            if (v204 == -1 || v204 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v205 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v204);
              *(_QWORD *)(a2 + v203) = v204 + 1;
              v202 |= (unint64_t)(v205 & 0x7F) << v200;
              if (v205 < 0)
              {
                v200 += 7;
                v14 = v201++ >= 9;
                if (v14)
                {
                  v202 = 0;
                  goto LABEL_397;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v202 = 0;
LABEL_397:
          v236 = v202 != 0;
          v237 = 20;
          goto LABEL_418;
        case 0x23u:
          v206 = 0;
          v207 = 0;
          v208 = 0;
          *(_QWORD *)(a1 + 52) |= 2uLL;
          while (2)
          {
            v209 = *v3;
            v210 = *(_QWORD *)(a2 + v209);
            if (v210 == -1 || v210 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v211 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v210);
              *(_QWORD *)(a2 + v209) = v210 + 1;
              v208 |= (unint64_t)(v211 & 0x7F) << v206;
              if (v211 < 0)
              {
                v206 += 7;
                v14 = v207++ >= 9;
                if (v14)
                {
                  v208 = 0;
                  goto LABEL_401;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v208 = 0;
LABEL_401:
          v236 = v208 != 0;
          v237 = 17;
          goto LABEL_418;
        case 0x24u:
          v212 = 0;
          v213 = 0;
          v214 = 0;
          *(_QWORD *)(a1 + 52) |= 0x100000uLL;
          while (2)
          {
            v215 = *v3;
            v216 = *(_QWORD *)(a2 + v215);
            if (v216 == -1 || v216 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v217 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v216);
              *(_QWORD *)(a2 + v215) = v216 + 1;
              v214 |= (unint64_t)(v217 & 0x7F) << v212;
              if (v217 < 0)
              {
                v212 += 7;
                v14 = v213++ >= 9;
                if (v14)
                {
                  v214 = 0;
                  goto LABEL_405;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v214 = 0;
LABEL_405:
          v236 = v214 != 0;
          v237 = 36;
          goto LABEL_418;
        case 0x25u:
          v218 = 0;
          v219 = 0;
          v220 = 0;
          *(_QWORD *)(a1 + 52) |= 0x800000000uLL;
          while (2)
          {
            v221 = *v3;
            v222 = *(_QWORD *)(a2 + v221);
            if (v222 == -1 || v222 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v223 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v222);
              *(_QWORD *)(a2 + v221) = v222 + 1;
              v220 |= (unint64_t)(v223 & 0x7F) << v218;
              if (v223 < 0)
              {
                v218 += 7;
                v14 = v219++ >= 9;
                if (v14)
                {
                  v220 = 0;
                  goto LABEL_409;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v220 = 0;
LABEL_409:
          v236 = v220 != 0;
          v237 = 51;
          goto LABEL_418;
        case 0x26u:
          v224 = 0;
          v225 = 0;
          v226 = 0;
          *(_QWORD *)(a1 + 52) |= 4uLL;
          while (2)
          {
            v227 = *v3;
            v228 = *(_QWORD *)(a2 + v227);
            if (v228 == -1 || v228 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v229 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v228);
              *(_QWORD *)(a2 + v227) = v228 + 1;
              v226 |= (unint64_t)(v229 & 0x7F) << v224;
              if (v229 < 0)
              {
                v224 += 7;
                v14 = v225++ >= 9;
                if (v14)
                {
                  v226 = 0;
                  goto LABEL_413;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v226 = 0;
LABEL_413:
          v236 = v226 != 0;
          v237 = 18;
          goto LABEL_418;
        case 0x27u:
          v230 = 0;
          v231 = 0;
          v232 = 0;
          *(_QWORD *)(a1 + 52) |= 8uLL;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v233 = *v3;
        v234 = *(_QWORD *)(a2 + v233);
        if (v234 == -1 || v234 >= *(_QWORD *)(a2 + *v4))
          break;
        v235 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v234);
        *(_QWORD *)(a2 + v233) = v234 + 1;
        v232 |= (unint64_t)(v235 & 0x7F) << v230;
        if ((v235 & 0x80) == 0)
          goto LABEL_415;
        v230 += 7;
        v14 = v231++ >= 9;
        if (v14)
        {
          v232 = 0;
          goto LABEL_417;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_415:
      if (*(_BYTE *)(a2 + *v5))
        v232 = 0;
LABEL_417:
      v236 = v232 != 0;
      v237 = 19;
LABEL_418:
      *(_BYTE *)(a1 + v237) = v236;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B2D6F90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2D7094(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2D7620(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2D8274(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2D831C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2E1CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMAccessoryAllowedHostPurposeAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  __CFString *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_37;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_33;
    if (v3 > 127)
    {
      if (v3 <= 1023)
      {
        switch(v3)
        {
          case 128:
            v5 = CFSTR("UsageMetrics");
            break;
          case 256:
            v5 = CFSTR("Diagnostics");
            break;
          case 512:
            v5 = CFSTR("RemoteAccess");
            break;
          default:
            goto LABEL_33;
        }
      }
      else if (v3 > 4095)
      {
        if (v3 == 4096)
        {
          v5 = CFSTR("ConnectivityChecks");
        }
        else
        {
          if (v3 != 0x2000)
            goto LABEL_33;
          v5 = CFSTR("EmergencyNotifications");
        }
      }
      else if (v3 == 1024)
      {
        v5 = CFSTR("HomeEcosystem");
      }
      else
      {
        if (v3 != 2048)
          goto LABEL_33;
        v5 = CFSTR("TimeSynchronization");
      }
      goto LABEL_32;
    }
    if (v3 > 15)
    {
      switch(v3)
      {
        case 16:
          v5 = CFSTR("UserEvents");
          break;
        case 32:
          v5 = CFSTR("UserStorage");
          break;
        case 64:
          v5 = CFSTR("Notifications");
          break;
        default:
          goto LABEL_33;
      }
LABEL_32:
      v4 &= ~v3;
      objc_msgSend(v2, "addObject:", v5);
      goto LABEL_33;
    }
    v5 = CFSTR("Other");
    switch(v3)
    {
      case 1:
        goto LABEL_32;
      case 2:
        v5 = CFSTR("FirmwareUpdate");
        goto LABEL_32;
      case 4:
        v5 = CFSTR("AccountManagement");
        goto LABEL_32;
      case 8:
        v5 = CFSTR("PeerToPeer");
        goto LABEL_32;
      default:
        break;
    }
LABEL_33:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if ((a1 & 1) == 0 && v4)
    objc_msgSend(v2, "addObject:", CFSTR("Other"));
LABEL_37:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("none");
  }

  return v6;
}

void sub_19B2E32F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2E3448(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2E3584(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2E3D9C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2E3DE8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2EA3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B2EDDDC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2F9404(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19B2F9554(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B2F9B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3056DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19B3076E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B307984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B307FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3086A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B308D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B30D660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_19B30DDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26674(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26675(uint64_t a1)
{

}

void sub_19B30F9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B30FC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3113D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

void sub_19B311A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B312130(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3124C0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B312564(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B313EC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B31442C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B31468C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3148EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3153A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B315B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B316564(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_19B319C40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

const __CFString *HMUserPrivilegeToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E3AB1B78[a1];
}

const __CFString *HMStringFromHomeLocation(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("HMHomeLocationAway");
  else
    return off_1E3AB1B98[a1];
}

const __CFString *userConsentAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("HMUserConsentResponseNoForAccessoryDetailConfirmation");
  else
    return off_1E3AB1B60[a1 - 1];
}

const __CFString *HMHomeSupportedFeatureAsString(uint64_t a1)
{
  if (a1 == 1)
    return CFSTR("Supports Add Network Router");
  else
    return CFSTR("Unknown");
}

const __CFString *HMNetworkProtectionModeAsString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (!a1)
    v1 = CFSTR("Not Protected");
  if (a1 == 1)
    return CFSTR("Protected");
  else
    return v1;
}

__CFString *HMNetworkRouterSupportAsString(unint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;

  if (!a1)
  {
    v6 = CFSTR("Enabled");
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = a1;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Home Protection Mode Updates disabled"));
    v4 = a1 & 0xFFFFFFFFFFFFFFFELL;
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("Accessory Protection Mode Updates disabled"));
  v4 &= ~2uLL;
  if ((a1 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("Add Network Router disabled"));
    v4 &= ~4uLL;
  }
LABEL_6:
  v5 = objc_msgSend(v3, "count");
  if (!v4 || v5)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("Unknown");
  }

  return v6;
}

__CFString *HMNetworkRouterSupportDisableReasonAsString(unint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  __CFString *v5;

  if (!a1)
  {
    v5 = CFSTR("None");
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = a1;
  if ((a1 & 8) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("No Active Network Router in home"));
    v4 = a1 & 0xFFFFFFFFFFFFFFF7;
    if ((a1 & 1) == 0)
    {
LABEL_4:
      if ((a1 & 2) == 0)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  else if ((a1 & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("No HomeHub or incompatible OS version on HomeHub"));
  v4 &= ~1uLL;
  if ((a1 & 2) == 0)
  {
LABEL_5:
    if ((a1 & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "addObject:", CFSTR("Incompatible OS version"));
  v4 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  objc_msgSend(v3, "addObject:", CFSTR("Insufficient Privileges"));
  v4 &= ~4uLL;
  if ((a1 & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(v3, "addObject:", CFSTR("Incompatible OS version to change accessory protection"));
    v4 &= ~0x10uLL;
  }
LABEL_8:
  if (objc_msgSend(v3, "count") || !v4)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Unknown");
  }

  return v5;
}

void sub_19B31D8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B31DAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B31DCE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_19B31E328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  id *v10;

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMUserPresenceComputeStatusAsString(unint64_t a1)
{
  if (a1 < 5)
    return off_1E3AB1C08[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMUserPresenceComputeStatus %tu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMSiriEndpointOnboardingResultAsString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 4)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown result (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AB1C78[a1];
  }
  return v1;
}

void sub_19B320B48(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B321000(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 160));
  _Unwind_Resume(a1);
}

__CFString *HMAccessorySettingsDataSourceSubscribeOptionsAsString(uint64_t a1)
{
  char v1;
  __CFString *v2;

  if (!a1)
    return CFSTR("SubscribeWithNoOptions");
  v1 = a1;
  v2 = &stru_1E3AB7688;
  if ((v1 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), &stru_1E3AB7688, CFSTR("SubscribeToOnlyLiveSettings"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_19B3254E8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B32601C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_19B327370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B327838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B327B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B327E14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19B327F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B32817C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B328344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B32850C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3286D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B32889C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B328A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B328B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B328CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B328E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B328FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B329194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B329308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B32A014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B32A894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B32CCDC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3301C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_19B33277C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getHAPSystemKeychainStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreHAPLibraryCore_frameworkLibrary_28068)
  {
    CoreHAPLibraryCore_frameworkLibrary_28068 = _sl_dlopen();
    if (!CoreHAPLibraryCore_frameworkLibrary_28068)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HAPSystemKeychainStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getHAPSystemKeychainStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__28182(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28183(uint64_t a1)
{

}

void sub_19B335F20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B33891C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HMHomeManagerCachePolicyToString(unint64_t a1)
{
  if (a1 < 4)
    return off_1E3AB25A0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown cache policy: %lu>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *HMHomeManagerNameValidationOptionsToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("HMHomeManagerNameValidationOptionsNotSupported");
  else
    return off_1E3AB25C0[a1 - 1];
}

__CFString *HMHomeManagerMultiUserStatusToString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HMHomeManagerMultiUserStatusReady");
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HMHomeManagerMultiUserStatus(%ld)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("HMHomeManagerMultiUserStatusUninitialized");
  }
  return v1;
}

uint64_t HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 80;
        goto LABEL_45;
      case 2u:
        v21 = objc_alloc_init(HMAccessoryInfoProtoWifiNetworkInfoEvent);
        objc_storeStrong((id *)(a1 + 176), v21);
        if (!PBReaderPlaceMark()
          || (HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 3u:
        v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo);
        objc_storeStrong((id *)(a1 + 48), v21);
        if (!PBReaderPlaceMark()
          || !HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfoReadFrom((uint64_t)v21, a2))
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 4u:
        v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoCloudInfo);
        objc_storeStrong((id *)(a1 + 40), v21);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoCloudInfoReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 5u:
        v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoIdsInfo);
        objc_storeStrong((id *)(a1 + 64), v21);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoIdsInfoReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 6u:
        v21 = objc_alloc_init(HMRemoteEventRouterProtoServerDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 56), v21);
        if (!PBReaderPlaceMark()
          || (HMRemoteEventRouterProtoServerDiagnosticInfoReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 7u:
        *(_BYTE *)(a1 + 184) |= 1u;
        v22 = *v3;
        v23 = *(_QWORD *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v24 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v24 = 0;
        }
        *(_QWORD *)(a1 + 8) = v24;
        goto LABEL_110;
      case 8u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 144;
        goto LABEL_45;
      case 9u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 88;
        goto LABEL_45;
      case 0xAu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 168;
        goto LABEL_45;
      case 0xBu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 136;
        goto LABEL_45;
      case 0xCu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
LABEL_45:
        v25 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_110;
      case 0xDu:
        v21 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor);
        objc_storeStrong((id *)(a1 + 152), v21);
        if (!PBReaderPlaceMark()
          || (HMSoftwareUpdateEventProtoSoftwareUpdateDescriptorReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 0xEu:
        v21 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateProgress);
        objc_storeStrong((id *)(a1 + 160), v21);
        if (!PBReaderPlaceMark()
          || (HMSoftwareUpdateEventProtoSoftwareUpdateProgressReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 0xFu:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 184) |= 8u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                v28 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_94:
        v52 = 32;
        goto LABEL_103;
      case 0x10u:
        v21 = objc_alloc_init(HMAccessoryInfoProtoNetworkInfoEvent);
        objc_msgSend((id)a1, "addNetworkInfo:", v21);
        if (!PBReaderPlaceMark()
          || !HMAccessoryInfoProtoNetworkInfoEventReadFrom((id *)&v21->super.super.isa, a2))
        {
          goto LABEL_112;
        }
        goto LABEL_69;
      case 0x11u:
        v21 = objc_alloc_init(HMAccessoryInfoProtoNetworkServiceEvent);
        objc_msgSend((id)a1, "addNetworkServiceInfo:", v21);
        if (!PBReaderPlaceMark() || (HMAccessoryInfoProtoNetworkServiceEventReadFrom(v21, a2) & 1) == 0)
          goto LABEL_112;
        goto LABEL_69;
      case 0x12u:
        v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        objc_msgSend((id)a1, "addNetworkVisibleDeviceInfos:", v21);
        goto LABEL_67;
      case 0x13u:
        v21 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        objc_msgSend((id)a1, "addNearbyVisibleDeviceInfos:", v21);
LABEL_67:
        if (PBReaderPlaceMark()
          && HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom((uint64_t)v21, a2))
        {
LABEL_69:
          PBReaderRecallMark();

LABEL_110:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_112:

        return 0;
      case 0x14u:
        v33 = 0;
        v34 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 184) |= 2u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          v37 = v36 + 1;
          if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v28 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v15 = v34++ >= 9;
              if (v15)
              {
                v28 = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_98:
        v52 = 16;
        goto LABEL_103;
      case 0x15u:
        v39 = 0;
        v40 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 184) |= 4u;
        while (2)
        {
          v41 = *v3;
          v42 = *(_QWORD *)(a2 + v41);
          v43 = v42 + 1;
          if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v43;
            v28 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              v15 = v40++ >= 9;
              if (v15)
              {
                v28 = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_102:
        v52 = 24;
LABEL_103:
        *(_QWORD *)(a1 + v52) = v28;
        goto LABEL_110;
      case 0x16u:
        v45 = 0;
        v46 = 0;
        v47 = 0;
        *(_BYTE *)(a1 + 184) |= 0x10u;
        while (2)
        {
          v48 = *v3;
          v49 = *(_QWORD *)(a2 + v48);
          v50 = v49 + 1;
          if (v49 == -1 || v50 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
            *(_QWORD *)(a2 + v48) = v50;
            v47 |= (unint64_t)(v51 & 0x7F) << v45;
            if (v51 < 0)
            {
              v45 += 7;
              v15 = v46++ >= 9;
              if (v15)
              {
                LODWORD(v47) = 0;
                goto LABEL_107;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v47) = 0;
LABEL_107:
        *(_DWORD *)(a1 + 128) = v47;
        goto LABEL_110;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_110;
    }
  }
}

void sub_19B33E9CC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMProtoAccessoryCapabilitiesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  char v116;
  unsigned int v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  char v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  char v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  char v140;
  unsigned int v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char v145;
  char v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  unsigned int v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  char v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  char v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  char v169;
  char v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  char v175;
  char v176;
  unsigned int v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  char v181;
  char v182;
  unsigned int v183;
  uint64_t v184;
  uint64_t v185;
  unint64_t v186;
  char v187;
  char v188;
  unsigned int v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  char v193;
  char v194;
  unsigned int v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  char v199;
  char v200;
  unsigned int v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  char v205;
  char v206;
  unsigned int v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  char v211;
  char v212;
  unsigned int v213;
  uint64_t v214;
  uint64_t v215;
  unint64_t v216;
  char v217;
  char v218;
  unsigned int v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  char v223;
  char v224;
  unsigned int v225;
  uint64_t v226;
  uint64_t v227;
  unint64_t v228;
  char v229;
  char v230;
  unsigned int v231;
  uint64_t v232;
  uint64_t v233;
  unint64_t v234;
  char v235;
  char v236;
  unsigned int v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  char v241;
  BOOL v242;
  uint64_t v243;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v17;

          continue;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_QWORD *)(a1 + 56) |= 0x400000uLL;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_284;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_284:
          v242 = v22 != 0;
          v243 = 38;
          goto LABEL_429;
        case 5u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_QWORD *)(a1 + 56) |= 0x2000uLL;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_288;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_288:
          v242 = v28 != 0;
          v243 = 29;
          goto LABEL_429;
        case 6u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_QWORD *)(a1 + 56) |= 0x100000uLL;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_292;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_292:
          v242 = v34 != 0;
          v243 = 36;
          goto LABEL_429;
        case 7u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_QWORD *)(a1 + 56) |= 0x200000uLL;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_296;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_296:
          v242 = v40 != 0;
          v243 = 37;
          goto LABEL_429;
        case 8u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_QWORD *)(a1 + 56) |= 0x20000000uLL;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_300;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_300:
          v242 = v46 != 0;
          v243 = 45;
          goto LABEL_429;
        case 9u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_QWORD *)(a1 + 56) |= 0x100uLL;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  v52 = 0;
                  goto LABEL_304;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v52 = 0;
LABEL_304:
          v242 = v52 != 0;
          v243 = 24;
          goto LABEL_429;
        case 0xAu:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_QWORD *)(a1 + 56) |= 0x800000000uLL;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
              *(_QWORD *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  v58 = 0;
                  goto LABEL_308;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v58 = 0;
LABEL_308:
          v242 = v58 != 0;
          v243 = 51;
          goto LABEL_429;
        case 0xBu:
          v62 = 0;
          v63 = 0;
          v64 = 0;
          *(_QWORD *)(a1 + 56) |= 0x20uLL;
          while (2)
          {
            v65 = *v3;
            v66 = *(_QWORD *)(a2 + v65);
            if (v66 == -1 || v66 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
              *(_QWORD *)(a2 + v65) = v66 + 1;
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                v14 = v63++ >= 9;
                if (v14)
                {
                  v64 = 0;
                  goto LABEL_312;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v64 = 0;
LABEL_312:
          v242 = v64 != 0;
          v243 = 21;
          goto LABEL_429;
        case 0xCu:
          v68 = 0;
          v69 = 0;
          v70 = 0;
          *(_QWORD *)(a1 + 56) |= 0x10000uLL;
          while (2)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            if (v72 == -1 || v72 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
              *(_QWORD *)(a2 + v71) = v72 + 1;
              v70 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                v14 = v69++ >= 9;
                if (v14)
                {
                  v70 = 0;
                  goto LABEL_316;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v70 = 0;
LABEL_316:
          v242 = v70 != 0;
          v243 = 32;
          goto LABEL_429;
        case 0xDu:
          v74 = 0;
          v75 = 0;
          v76 = 0;
          *(_QWORD *)(a1 + 56) |= 0x80000000uLL;
          while (2)
          {
            v77 = *v3;
            v78 = *(_QWORD *)(a2 + v77);
            if (v78 == -1 || v78 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v78);
              *(_QWORD *)(a2 + v77) = v78 + 1;
              v76 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                v14 = v75++ >= 9;
                if (v14)
                {
                  v76 = 0;
                  goto LABEL_320;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v76 = 0;
LABEL_320:
          v242 = v76 != 0;
          v243 = 47;
          goto LABEL_429;
        case 0xEu:
          v80 = 0;
          v81 = 0;
          v82 = 0;
          *(_QWORD *)(a1 + 56) |= 0x4000000uLL;
          while (2)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            if (v84 == -1 || v84 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
              *(_QWORD *)(a2 + v83) = v84 + 1;
              v82 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                v14 = v81++ >= 9;
                if (v14)
                {
                  v82 = 0;
                  goto LABEL_324;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v82 = 0;
LABEL_324:
          v242 = v82 != 0;
          v243 = 42;
          goto LABEL_429;
        case 0xFu:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          *(_QWORD *)(a1 + 56) |= 0x40000uLL;
          while (2)
          {
            v89 = *v3;
            v90 = *(_QWORD *)(a2 + v89);
            if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v90);
              *(_QWORD *)(a2 + v89) = v90 + 1;
              v88 |= (unint64_t)(v91 & 0x7F) << v86;
              if (v91 < 0)
              {
                v86 += 7;
                v14 = v87++ >= 9;
                if (v14)
                {
                  v88 = 0;
                  goto LABEL_328;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v88 = 0;
LABEL_328:
          v242 = v88 != 0;
          v243 = 34;
          goto LABEL_429;
        case 0x10u:
          v92 = 0;
          v93 = 0;
          v94 = 0;
          *(_QWORD *)(a1 + 56) |= 0x20000uLL;
          while (2)
          {
            v95 = *v3;
            v96 = *(_QWORD *)(a2 + v95);
            if (v96 == -1 || v96 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v97 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v96);
              *(_QWORD *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                v14 = v93++ >= 9;
                if (v14)
                {
                  v94 = 0;
                  goto LABEL_332;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v94 = 0;
LABEL_332:
          v242 = v94 != 0;
          v243 = 33;
          goto LABEL_429;
        case 0x11u:
          v98 = 0;
          v99 = 0;
          v100 = 0;
          *(_QWORD *)(a1 + 56) |= 0x400uLL;
          while (2)
          {
            v101 = *v3;
            v102 = *(_QWORD *)(a2 + v101);
            if (v102 == -1 || v102 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
              *(_QWORD *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                v14 = v99++ >= 9;
                if (v14)
                {
                  v100 = 0;
                  goto LABEL_336;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v100 = 0;
LABEL_336:
          v242 = v100 != 0;
          v243 = 26;
          goto LABEL_429;
        case 0x12u:
          v104 = 0;
          v105 = 0;
          v106 = 0;
          *(_QWORD *)(a1 + 56) |= 0x8000000uLL;
          while (2)
          {
            v107 = *v3;
            v108 = *(_QWORD *)(a2 + v107);
            if (v108 == -1 || v108 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v109 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v108);
              *(_QWORD *)(a2 + v107) = v108 + 1;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                v14 = v105++ >= 9;
                if (v14)
                {
                  v106 = 0;
                  goto LABEL_340;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v106 = 0;
LABEL_340:
          v242 = v106 != 0;
          v243 = 43;
          goto LABEL_429;
        case 0x13u:
          v110 = 0;
          v111 = 0;
          v112 = 0;
          *(_QWORD *)(a1 + 56) |= 0x10uLL;
          while (2)
          {
            v113 = *v3;
            v114 = *(_QWORD *)(a2 + v113);
            if (v114 == -1 || v114 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v115 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v114);
              *(_QWORD *)(a2 + v113) = v114 + 1;
              v112 |= (unint64_t)(v115 & 0x7F) << v110;
              if (v115 < 0)
              {
                v110 += 7;
                v14 = v111++ >= 9;
                if (v14)
                {
                  v112 = 0;
                  goto LABEL_344;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v112 = 0;
LABEL_344:
          v242 = v112 != 0;
          v243 = 20;
          goto LABEL_429;
        case 0x14u:
          v116 = 0;
          v117 = 0;
          v118 = 0;
          *(_QWORD *)(a1 + 56) |= 0x1000000000uLL;
          while (2)
          {
            v119 = *v3;
            v120 = *(_QWORD *)(a2 + v119);
            if (v120 == -1 || v120 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v121 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v120);
              *(_QWORD *)(a2 + v119) = v120 + 1;
              v118 |= (unint64_t)(v121 & 0x7F) << v116;
              if (v121 < 0)
              {
                v116 += 7;
                v14 = v117++ >= 9;
                if (v14)
                {
                  v118 = 0;
                  goto LABEL_348;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v118 = 0;
LABEL_348:
          v242 = v118 != 0;
          v243 = 52;
          goto LABEL_429;
        case 0x15u:
          v122 = 0;
          v123 = 0;
          v124 = 0;
          *(_QWORD *)(a1 + 56) |= 0x100000000uLL;
          while (2)
          {
            v125 = *v3;
            v126 = *(_QWORD *)(a2 + v125);
            if (v126 == -1 || v126 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v127 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v126);
              *(_QWORD *)(a2 + v125) = v126 + 1;
              v124 |= (unint64_t)(v127 & 0x7F) << v122;
              if (v127 < 0)
              {
                v122 += 7;
                v14 = v123++ >= 9;
                if (v14)
                {
                  v124 = 0;
                  goto LABEL_352;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v124 = 0;
LABEL_352:
          v242 = v124 != 0;
          v243 = 48;
          goto LABEL_429;
        case 0x16u:
          v128 = 0;
          v129 = 0;
          v130 = 0;
          *(_QWORD *)(a1 + 56) |= 0x10000000uLL;
          while (2)
          {
            v131 = *v3;
            v132 = *(_QWORD *)(a2 + v131);
            if (v132 == -1 || v132 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v133 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v132);
              *(_QWORD *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                v14 = v129++ >= 9;
                if (v14)
                {
                  v130 = 0;
                  goto LABEL_356;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v130 = 0;
LABEL_356:
          v242 = v130 != 0;
          v243 = 44;
          goto LABEL_429;
        case 0x17u:
          v134 = 0;
          v135 = 0;
          v136 = 0;
          *(_QWORD *)(a1 + 56) |= 0x200000000uLL;
          while (2)
          {
            v137 = *v3;
            v138 = *(_QWORD *)(a2 + v137);
            if (v138 == -1 || v138 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v139 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v138);
              *(_QWORD *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                v14 = v135++ >= 9;
                if (v14)
                {
                  v136 = 0;
                  goto LABEL_360;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v136 = 0;
LABEL_360:
          v242 = v136 != 0;
          v243 = 49;
          goto LABEL_429;
        case 0x18u:
          v140 = 0;
          v141 = 0;
          v142 = 0;
          *(_QWORD *)(a1 + 56) |= 0x4000uLL;
          while (2)
          {
            v143 = *v3;
            v144 = *(_QWORD *)(a2 + v143);
            if (v144 == -1 || v144 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v145 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v144);
              *(_QWORD *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                v14 = v141++ >= 9;
                if (v14)
                {
                  v142 = 0;
                  goto LABEL_364;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v142 = 0;
LABEL_364:
          v242 = v142 != 0;
          v243 = 30;
          goto LABEL_429;
        case 0x19u:
          v146 = 0;
          v147 = 0;
          v148 = 0;
          *(_QWORD *)(a1 + 56) |= 0x400000000uLL;
          while (2)
          {
            v149 = *v3;
            v150 = *(_QWORD *)(a2 + v149);
            if (v150 == -1 || v150 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v151 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v150);
              *(_QWORD *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                v14 = v147++ >= 9;
                if (v14)
                {
                  v148 = 0;
                  goto LABEL_368;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v148 = 0;
LABEL_368:
          v242 = v148 != 0;
          v243 = 50;
          goto LABEL_429;
        case 0x1Au:
          v152 = 0;
          v153 = 0;
          v154 = 0;
          *(_QWORD *)(a1 + 56) |= 0x800uLL;
          while (2)
          {
            v155 = *v3;
            v156 = *(_QWORD *)(a2 + v155);
            if (v156 == -1 || v156 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v157 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v156);
              *(_QWORD *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                v14 = v153++ >= 9;
                if (v14)
                {
                  v154 = 0;
                  goto LABEL_372;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v154 = 0;
LABEL_372:
          v242 = v154 != 0;
          v243 = 27;
          goto LABEL_429;
        case 0x1Bu:
          v158 = 0;
          v159 = 0;
          v160 = 0;
          *(_QWORD *)(a1 + 56) |= 0x8000uLL;
          while (2)
          {
            v161 = *v3;
            v162 = *(_QWORD *)(a2 + v161);
            if (v162 == -1 || v162 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v163 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v162);
              *(_QWORD *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                v14 = v159++ >= 9;
                if (v14)
                {
                  v160 = 0;
                  goto LABEL_376;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v160 = 0;
LABEL_376:
          v242 = v160 != 0;
          v243 = 31;
          goto LABEL_429;
        case 0x1Cu:
          v164 = 0;
          v165 = 0;
          v166 = 0;
          *(_QWORD *)(a1 + 56) |= 0x40uLL;
          while (2)
          {
            v167 = *v3;
            v168 = *(_QWORD *)(a2 + v167);
            if (v168 == -1 || v168 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v169 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v168);
              *(_QWORD *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                v14 = v165++ >= 9;
                if (v14)
                {
                  v166 = 0;
                  goto LABEL_380;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v166 = 0;
LABEL_380:
          v242 = v166 != 0;
          v243 = 22;
          goto LABEL_429;
        case 0x1Du:
          v170 = 0;
          v171 = 0;
          v172 = 0;
          *(_QWORD *)(a1 + 56) |= 0x800000uLL;
          while (2)
          {
            v173 = *v3;
            v174 = *(_QWORD *)(a2 + v173);
            if (v174 == -1 || v174 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v175 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v174);
              *(_QWORD *)(a2 + v173) = v174 + 1;
              v172 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                v14 = v171++ >= 9;
                if (v14)
                {
                  v172 = 0;
                  goto LABEL_384;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v172 = 0;
LABEL_384:
          v242 = v172 != 0;
          v243 = 39;
          goto LABEL_429;
        case 0x1Eu:
          v176 = 0;
          v177 = 0;
          v178 = 0;
          *(_QWORD *)(a1 + 56) |= 0x80uLL;
          while (2)
          {
            v179 = *v3;
            v180 = *(_QWORD *)(a2 + v179);
            if (v180 == -1 || v180 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v181 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v180);
              *(_QWORD *)(a2 + v179) = v180 + 1;
              v178 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                v14 = v177++ >= 9;
                if (v14)
                {
                  v178 = 0;
                  goto LABEL_388;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v178 = 0;
LABEL_388:
          v242 = v178 != 0;
          v243 = 23;
          goto LABEL_429;
        case 0x1Fu:
          v182 = 0;
          v183 = 0;
          v184 = 0;
          *(_QWORD *)(a1 + 56) |= 0x2000000uLL;
          while (2)
          {
            v185 = *v3;
            v186 = *(_QWORD *)(a2 + v185);
            if (v186 == -1 || v186 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v187 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v186);
              *(_QWORD *)(a2 + v185) = v186 + 1;
              v184 |= (unint64_t)(v187 & 0x7F) << v182;
              if (v187 < 0)
              {
                v182 += 7;
                v14 = v183++ >= 9;
                if (v14)
                {
                  v184 = 0;
                  goto LABEL_392;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v184 = 0;
LABEL_392:
          v242 = v184 != 0;
          v243 = 41;
          goto LABEL_429;
        case 0x20u:
          v188 = 0;
          v189 = 0;
          v190 = 0;
          *(_QWORD *)(a1 + 56) |= 0x1000000uLL;
          while (2)
          {
            v191 = *v3;
            v192 = *(_QWORD *)(a2 + v191);
            if (v192 == -1 || v192 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v193 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v192);
              *(_QWORD *)(a2 + v191) = v192 + 1;
              v190 |= (unint64_t)(v193 & 0x7F) << v188;
              if (v193 < 0)
              {
                v188 += 7;
                v14 = v189++ >= 9;
                if (v14)
                {
                  v190 = 0;
                  goto LABEL_396;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v190 = 0;
LABEL_396:
          v242 = v190 != 0;
          v243 = 40;
          goto LABEL_429;
        case 0x21u:
          v194 = 0;
          v195 = 0;
          v196 = 0;
          *(_QWORD *)(a1 + 56) |= 8uLL;
          while (2)
          {
            v197 = *v3;
            v198 = *(_QWORD *)(a2 + v197);
            if (v198 == -1 || v198 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v199 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v198);
              *(_QWORD *)(a2 + v197) = v198 + 1;
              v196 |= (unint64_t)(v199 & 0x7F) << v194;
              if (v199 < 0)
              {
                v194 += 7;
                v14 = v195++ >= 9;
                if (v14)
                {
                  v196 = 0;
                  goto LABEL_400;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v196 = 0;
LABEL_400:
          v242 = v196 != 0;
          v243 = 19;
          goto LABEL_429;
        case 0x22u:
          v200 = 0;
          v201 = 0;
          v202 = 0;
          *(_QWORD *)(a1 + 56) |= 4uLL;
          while (2)
          {
            v203 = *v3;
            v204 = *(_QWORD *)(a2 + v203);
            if (v204 == -1 || v204 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v205 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v204);
              *(_QWORD *)(a2 + v203) = v204 + 1;
              v202 |= (unint64_t)(v205 & 0x7F) << v200;
              if (v205 < 0)
              {
                v200 += 7;
                v14 = v201++ >= 9;
                if (v14)
                {
                  v202 = 0;
                  goto LABEL_404;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v202 = 0;
LABEL_404:
          v242 = v202 != 0;
          v243 = 18;
          goto LABEL_429;
        case 0x23u:
          v206 = 0;
          v207 = 0;
          v208 = 0;
          *(_QWORD *)(a1 + 56) |= 1uLL;
          while (2)
          {
            v209 = *v3;
            v210 = *(_QWORD *)(a2 + v209);
            if (v210 == -1 || v210 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v211 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v210);
              *(_QWORD *)(a2 + v209) = v210 + 1;
              v208 |= (unint64_t)(v211 & 0x7F) << v206;
              if (v211 < 0)
              {
                v206 += 7;
                v14 = v207++ >= 9;
                if (v14)
                {
                  v208 = 0;
                  goto LABEL_408;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v208 = 0;
LABEL_408:
          v242 = v208 != 0;
          v243 = 16;
          goto LABEL_429;
        case 0x24u:
          v212 = 0;
          v213 = 0;
          v214 = 0;
          *(_QWORD *)(a1 + 56) |= 0x80000uLL;
          while (2)
          {
            v215 = *v3;
            v216 = *(_QWORD *)(a2 + v215);
            if (v216 == -1 || v216 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v217 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v216);
              *(_QWORD *)(a2 + v215) = v216 + 1;
              v214 |= (unint64_t)(v217 & 0x7F) << v212;
              if (v217 < 0)
              {
                v212 += 7;
                v14 = v213++ >= 9;
                if (v14)
                {
                  v214 = 0;
                  goto LABEL_412;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v214 = 0;
LABEL_412:
          v242 = v214 != 0;
          v243 = 35;
          goto LABEL_429;
        case 0x25u:
          v218 = 0;
          v219 = 0;
          v220 = 0;
          *(_QWORD *)(a1 + 56) |= 0x1000uLL;
          while (2)
          {
            v221 = *v3;
            v222 = *(_QWORD *)(a2 + v221);
            if (v222 == -1 || v222 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v223 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v222);
              *(_QWORD *)(a2 + v221) = v222 + 1;
              v220 |= (unint64_t)(v223 & 0x7F) << v218;
              if (v223 < 0)
              {
                v218 += 7;
                v14 = v219++ >= 9;
                if (v14)
                {
                  v220 = 0;
                  goto LABEL_416;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v220 = 0;
LABEL_416:
          v242 = v220 != 0;
          v243 = 28;
          goto LABEL_429;
        case 0x26u:
          v224 = 0;
          v225 = 0;
          v226 = 0;
          *(_QWORD *)(a1 + 56) |= 0x200uLL;
          while (2)
          {
            v227 = *v3;
            v228 = *(_QWORD *)(a2 + v227);
            if (v228 == -1 || v228 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v229 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v228);
              *(_QWORD *)(a2 + v227) = v228 + 1;
              v226 |= (unint64_t)(v229 & 0x7F) << v224;
              if (v229 < 0)
              {
                v224 += 7;
                v14 = v225++ >= 9;
                if (v14)
                {
                  v226 = 0;
                  goto LABEL_420;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v226 = 0;
LABEL_420:
          v242 = v226 != 0;
          v243 = 25;
          goto LABEL_429;
        case 0x27u:
          v230 = 0;
          v231 = 0;
          v232 = 0;
          *(_QWORD *)(a1 + 56) |= 2uLL;
          while (2)
          {
            v233 = *v3;
            v234 = *(_QWORD *)(a2 + v233);
            if (v234 == -1 || v234 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v235 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v234);
              *(_QWORD *)(a2 + v233) = v234 + 1;
              v232 |= (unint64_t)(v235 & 0x7F) << v230;
              if (v235 < 0)
              {
                v230 += 7;
                v14 = v231++ >= 9;
                if (v14)
                {
                  v232 = 0;
                  goto LABEL_424;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v232 = 0;
LABEL_424:
          v242 = v232 != 0;
          v243 = 17;
          goto LABEL_429;
        case 0x28u:
          v236 = 0;
          v237 = 0;
          v238 = 0;
          *(_QWORD *)(a1 + 56) |= 0x40000000uLL;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v239 = *v3;
        v240 = *(_QWORD *)(a2 + v239);
        if (v240 == -1 || v240 >= *(_QWORD *)(a2 + *v4))
          break;
        v241 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v240);
        *(_QWORD *)(a2 + v239) = v240 + 1;
        v238 |= (unint64_t)(v241 & 0x7F) << v236;
        if ((v241 & 0x80) == 0)
          goto LABEL_426;
        v236 += 7;
        v14 = v237++ >= 9;
        if (v14)
        {
          v238 = 0;
          goto LABEL_428;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_426:
      if (*(_BYTE *)(a2 + *v5))
        v238 = 0;
LABEL_428:
      v242 = v238 != 0;
      v243 = 46;
LABEL_429:
      *(_BYTE *)(a1 + v243) = v242;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B3499BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30111(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30112(uint64_t a1)
{

}

void sub_19B34C81C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34C88C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34C908(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34CA40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34CCE8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34CDF8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34CE74(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34CEF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34CF6C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34CFDC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34D148(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34D1B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34E2E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34E998(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34EB60(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34EBD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34ECAC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34EEF4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B34FA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B34FDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3501F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B350538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B35122C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3512EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B353314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3547FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 160));
  _Unwind_Resume(a1);
}

void sub_19B355980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 144));
  _Unwind_Resume(a1);
}

void sub_19B35DD90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B35EABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B35FC14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19B363AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3645D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36AC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

id HMAccessoryTransportTypesToString(char a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("IP"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v3, "addObject:", CFSTR("WAC"));
      if ((a1 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("BluetoothLE"));
  if ((a1 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a1 & 0x10) != 0)
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("AirPlay"));
LABEL_6:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(";"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *HMAccessoryLinkQualityToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E3AB2E08[a1 - 1];
}

uint64_t HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_26;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_26:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 6u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 56) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_37;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_39;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_39:
      *(_DWORD *)(a1 + 40) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMAccessoryInfoProtoSoftwareVersionInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_44;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_46;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_46:
          v36 = 8;
          goto LABEL_55;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_50:
          v36 = 16;
          goto LABEL_55;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          break;
        case 4u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v34;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v31 = *v3;
        v32 = *(_QWORD *)(a2 + v31);
        if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          break;
        v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
        *(_QWORD *)(a2 + v31) = v32 + 1;
        v19 |= (unint64_t)(v33 & 0x7F) << v29;
        if ((v33 & 0x80) == 0)
          goto LABEL_52;
        v29 += 7;
        v14 = v30++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_54:
      v36 = 24;
LABEL_55:
      *(_QWORD *)(a1 + v36) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B36EE74(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36EEC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36EF9C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36F150(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36F2C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36F310(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36F408(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B36F5BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B371258(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B371310(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B371488(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3715B4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B37166C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3717E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B373884(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B373AFC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B373B5C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B374270(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B374338(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B374604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_19B376FBC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B377054(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3770AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMAccessorySettingsPartialFetchFailureTypeToString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 4)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown type (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AB3018[a1];
  }
  return v1;
}

void sub_19B379EE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMCameraAccessModeAsString(unint64_t a1)
{
  if (a1 < 4)
    return off_1E3AB31D8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid value: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t HMCameraSignificantEventTypesFromReasons(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "unsignedIntegerValue"))
        {
          case 1:
            v4 |= 1uLL;
            break;
          case 2:
            v4 |= 2uLL;
            break;
          case 3:
            v4 |= 4uLL;
            break;
          case 4:
            v4 |= 8uLL;
            break;
          case 5:
            v4 |= 0x10uLL;
            break;
          default:
            continue;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL HMIsRecordingAllowedForCameraAccessMode(uint64_t a1)
{
  return a1 == 2;
}

BOOL HMIsStreamingAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL HMIsMotionDetectionAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

BOOL HMIsSignificantEventDetectionAllowedForCameraAccessMode(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

uint64_t HMCameraSignificantEventTypesAsString()
{
  return NSPrintF();
}

uint64_t HMCameraSupportedFeaturesAsString()
{
  return NSPrintF();
}

uint64_t HMCameraSignificantEventPersonFamiliarityOptionsAsString()
{
  return NSPrintF();
}

__CFString *HMPresenceEventActivationGranularityAsString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HMPresenceEventActivationGranularityUser");
  if (a1 == 2)
  {
    v1 = CFSTR("HMPresenceEventActivationGranularityHome");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMPresenceEventActivationGranularity %tu"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t HMRemoteEventRouterProtoServerDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t result;
  HMRemoteEventRouterProtoConnectedClientInfo *v42;
  uint64_t v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 40) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_49;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_51:
        *(_QWORD *)(a1 + 16) = v20;
        goto LABEL_63;
      case 2u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 40) |= 8u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if (v31 < 0)
            {
              v25 += 7;
              v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v27) = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v27) = 0;
LABEL_55:
        v43 = 36;
        goto LABEL_60;
      case 3u:
        v32 = 0;
        v33 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 40) |= 4u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          v36 = v35 + 1;
          if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v36;
            v27 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v27) = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v27) = 0;
LABEL_59:
        v43 = 32;
LABEL_60:
        *(_DWORD *)(a1 + v43) = v27;
        goto LABEL_63;
      case 4u:
        *(_BYTE *)(a1 + 40) |= 1u;
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v40 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
          *(_QWORD *)(a2 + v38) = v39 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v40 = 0;
        }
        *(_QWORD *)(a1 + 8) = v40;
        goto LABEL_63;
      case 0xBu:
        v42 = objc_alloc_init(HMRemoteEventRouterProtoConnectedClientInfo);
        objc_msgSend((id)a1, "addConnectedClients:", v42);
        if (PBReaderPlaceMark()
          && (HMRemoteEventRouterProtoConnectedClientInfoReadFrom((uint64_t)v42, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_63:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_63;
    }
  }
}

void sub_19B37E4AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B37E840(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMPBHomeReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B380704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34662(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34663(uint64_t a1)
{

}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke_34756(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreAnalyticsLibraryCore_frameworkLibrary_34758)
  {
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary_34758;
  }
  else
  {
    CoreAnalyticsLibraryCore_frameworkLibrary_34758 = _sl_dlopen();
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary_34758;
    if (!CoreAnalyticsLibraryCore_frameworkLibrary_34758)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEventLazy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr_34755 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19B384890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B385014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3851CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B38538C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B385608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B385DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B388710(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B38875C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B38891C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B388C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B389AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose(&location, 8);
  _Unwind_Resume(a1);
}

Class __getSFDeviceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SharingLibrary();
  result = objc_getClass("SFDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__28__HMSymptomFixSession_start__block_invoke(v3);
  }
  return result;
}

void SharingLibrary()
{
  void *v0;

  if (!SharingLibraryCore_frameworkLibrary)
  {
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SharingLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void sub_19B38AC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

HMSetting *__getSFDeviceRepairSessionClass_block_invoke(uint64_t a1)
{
  HMSetting *result;
  HMSetting *v3;
  SEL v4;

  SharingLibrary();
  result = (HMSetting *)objc_getClass("SFDeviceRepairSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFDeviceRepairSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (HMSetting *)abort_report_np();
    return -[HMSetting initWithInternal](v3, v4);
  }
  return result;
}

uint64_t HMImmutableSettingsProtoBoundedIntegerSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  HMImmutableSettingsProtoIntegerValueEvent *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(HMImmutableSettingsProtoIntegerValueEvent);
          objc_storeStrong((id *)(a1 + 32), v17);
          if (PBReaderPlaceMark()
            && (HMImmutableSettingsProtoIntegerValueEventReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_46;
            v19 += 7;
            v14 = v20++ >= 9;
            if (v14)
            {
              v21 = 0;
              goto LABEL_48;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_48:
          v35 = 16;
          goto LABEL_57;
        case 3u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (v14)
                {
                  v21 = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_52:
          v35 = 8;
          goto LABEL_57;
        case 4u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          break;
        v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
        *(_QWORD *)(a2 + v32) = v33 + 1;
        v21 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0)
          goto LABEL_54;
        v30 += 7;
        v14 = v31++ >= 9;
        if (v14)
        {
          v21 = 0;
          goto LABEL_56;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
      if (*(_BYTE *)(a2 + *v5))
        v21 = 0;
LABEL_56:
      v35 = 24;
LABEL_57:
      *(_QWORD *)(a1 + v35) = v21;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMAccessoryInfoProtoAirportInfoEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B38E13C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_19B38E514(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_19B38E940(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

const __CFString *HMAccountStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("HMAccountStatus_PrimaryAccountAdded");
  else
    return off_1E3AB37E8[a1 - 1];
}

const __CFString *HMStringFromIntentRequestType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("execute");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("confirm");
}

void sub_19B390B0C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B390CD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B39106C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B393E3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B394A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3965F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  os_unfair_lock_s *v15;

  os_unfair_lock_unlock(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37546(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37547(uint64_t a1)
{

}

void sub_19B396CE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B396D98(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B396E58(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B396F90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B396FDC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMImmutableSettingTypeAsString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 7)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("UnknownType(%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AB38E8[a1];
  }
  return v1;
}

void sub_19B39A160(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B39A4F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B39B7EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B39C1A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B39C2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_19B39C3D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B39C594(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B39DFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3A197C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

Class __getIDSURIClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!IDSFoundationLibraryCore_frameworkLibrary_38350)
  {
    IDSFoundationLibraryCore_frameworkLibrary_38350 = _sl_dlopen();
    if (!IDSFoundationLibraryCore_frameworkLibrary_38350)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("IDSURI");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getIDSURIClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19B3A4034(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19B3A4674(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19B3A4CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3A579C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3A61B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3A6A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibrary_38566()
{
  uint64_t v0;
  void *v2;

  if (UIKitLibraryCore_frameworkLibrary_38562)
    return UIKitLibraryCore_frameworkLibrary_38562;
  UIKitLibraryCore_frameworkLibrary_38562 = _sl_dlopen();
  v0 = UIKitLibraryCore_frameworkLibrary_38562;
  if (!UIKitLibraryCore_frameworkLibrary_38562)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

__CFString *HMStringFromCameraSignificantEventConfidenceLevel(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 1:
      return CFSTR("low");
    case 100:
      return CFSTR("high");
    case 50:
      v1 = CFSTR("medium");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown type: %lu"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

__CFString *HMStringFromCameraSignificantEventReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 6)
    return off_1E3AB3BE8[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown type: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t HMAccessoryInfoProtoSleepWakeStateEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B3AC5D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3AD808(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3AD8DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3ADD54(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3B1364(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3B1A68(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3B1E14(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3B1F4C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3B2E38(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(HMAccessoryInfoProtoWifiNetworkInfoEvent);
        objc_storeStrong((id *)(a1 + 80), v17);
        if (PBReaderPlaceMark()
          && (HMAccessoryInfoProtoWifiNetworkInfoEventReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_42;
        }
        goto LABEL_69;
      case 2u:
        v17 = objc_alloc_init(HMAccessoryInfoProtoNetworkInfoEvent);
        objc_msgSend((id)a1, "addNetworkInfo:", v17);
        if (!PBReaderPlaceMark()
          || !HMAccessoryInfoProtoNetworkInfoEventReadFrom((id *)&v17->super.super.isa, a2))
        {
          goto LABEL_69;
        }
        goto LABEL_42;
      case 3u:
        v17 = objc_alloc_init(HMAccessoryInfoProtoNetworkServiceEvent);
        objc_msgSend((id)a1, "addNetworkServiceInfo:", v17);
        if (!PBReaderPlaceMark() || (HMAccessoryInfoProtoNetworkServiceEventReadFrom(v17, a2) & 1) == 0)
          goto LABEL_69;
        goto LABEL_42;
      case 6u:
        v17 = objc_alloc_init(HMRemoteEventRouterProtoServerDiagnosticInfo);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (!PBReaderPlaceMark()
          || (HMRemoteEventRouterProtoServerDiagnosticInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_69;
        }
        goto LABEL_42;
      case 0xBu:
        v17 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo);
        objc_msgSend((id)a1, "addVisibleAccessoriesInfo:", v17);
        if (!PBReaderPlaceMark()
          || (HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_69;
        }
        goto LABEL_42;
      case 0xCu:
        PBReaderReadString();
        v17 = (HMAccessoryInfoProtoWifiNetworkInfoEvent *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)a1, "addVisibleIDSDevices:", v17);
        goto LABEL_43;
      case 0xDu:
        v17 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        objc_msgSend((id)a1, "addNetworkVisibleDeviceInfos:", v17);
        goto LABEL_40;
      case 0xEu:
        v17 = objc_alloc_init(HMAccessoryDiagnosticInfoProtoVisibleDeviceInfo);
        objc_msgSend((id)a1, "addProximityVisibleDeviceInfos:", v17);
LABEL_40:
        if (PBReaderPlaceMark()
          && HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom((uint64_t)v17, a2))
        {
LABEL_42:
          PBReaderRecallMark();
LABEL_43:

LABEL_67:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_69:

        return 0;
      case 0xFu:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 88) |= 1u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                v21 = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_61:
        v30 = 8;
        goto LABEL_66;
      case 0x10u:
        v25 = 0;
        v26 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 88) |= 2u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                v21 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_65:
        v30 = 16;
LABEL_66:
        *(_QWORD *)(a1 + v30) = v21;
        goto LABEL_67;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_67;
    }
  }
}

BOOL HMXPCEventRouterProtoEventsMessageReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  id v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 3)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D32D70]);
        objc_msgSend(a1, "addCachedEvents:", v17);
      }
      else
      {
        if ((v10 >> 3) != 2)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(MEMORY[0x1E0D32D70]);
        objc_msgSend(a1, "addEvents:", v17);
      }
      if (!PBReaderPlaceMark() || (HMEProtoEventInfoReadFrom() & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMSoftwareUpdateEventProtoSoftwareUpdateDescriptorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  void *v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 100) |= 0x10u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_77;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_79;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_77:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_79:
          v58 = 40;
          goto LABEL_104;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
          goto LABEL_61;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_61;
        case 4u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_61;
        case 5u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 100) |= 4u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_83:
          v58 = 24;
          goto LABEL_104;
        case 6u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 100) |= 8u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_87:
          v58 = 32;
          goto LABEL_104;
        case 7u:
          v36 = 0;
          v37 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 100) |= 0x20u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_91:
          v58 = 48;
          goto LABEL_104;
        case 8u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_61;
        case 9u:
          v41 = 0;
          v42 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 100) |= 1u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v19 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_95:
          v58 = 8;
          goto LABEL_104;
        case 0xAu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
LABEL_61:
          v46 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        case 0xBu:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          *(_BYTE *)(a1 + 100) |= 0x40u;
          while (2)
          {
            v50 = *v3;
            v51 = *(_QWORD *)(a2 + v50);
            if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
              *(_QWORD *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                v14 = v48++ >= 9;
                if (v14)
                {
                  v49 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v49 = 0;
LABEL_99:
          *(_BYTE *)(a1 + 96) = v49 != 0;
          continue;
        case 0xCu:
          v53 = 0;
          v54 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 100) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v55 = *v3;
        v56 = *(_QWORD *)(a2 + v55);
        if (v56 == -1 || v56 >= *(_QWORD *)(a2 + *v4))
          break;
        v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
        *(_QWORD *)(a2 + v55) = v56 + 1;
        v19 |= (unint64_t)(v57 & 0x7F) << v53;
        if ((v57 & 0x80) == 0)
          goto LABEL_101;
        v53 += 7;
        v14 = v54++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_103;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_101:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_103:
      v58 = 16;
LABEL_104:
      *(_QWORD *)(a1 + v58) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMMediaGroupProtoMediaGroupDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  HMMediaGroupProtoMediaGroupRole *v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_27;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_27;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
        goto LABEL_27;
      case 4u:
        PBReaderReadString();
        v20 = (HMMediaGroupProtoMediaGroupRole *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend((id)a1, "addDestinationIdentifiers:", v20);
        goto LABEL_31;
      case 5u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_27:
        v21 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_43;
      case 6u:
        v20 = objc_alloc_init(HMMediaGroupProtoMediaGroupRole);
        objc_storeStrong((id *)(a1 + 24), v20);
        if (PBReaderPlaceMark() && (HMMediaGroupProtoMediaGroupRoleReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_31:

LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 7u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 60) |= 1u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v14 = v23++ >= 9;
              if (v14)
              {
                v24 = 0;
                goto LABEL_42;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v24 = 0;
LABEL_42:
        *(_BYTE *)(a1 + 56) = v24 != 0;
        goto LABEL_43;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_43;
    }
  }
}

void sub_19B3C27AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __secureDescription(void *a1, char a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  char v17;
  __CFString *v18;

  v3 = a1;
  v15 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v17 = a2;
  if ((a2 & 1) != 0)
  {
    v18 = &stru_1E3AB7688;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), v3);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "releaseNotesSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textReleaseNotes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "licenseAgreement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "licenseAgreementVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@%@, Summary = %@, Release Notes = %@, Text Release Notes = %@, License = %@, License Version = %@>"), v4, v18, v5, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v17 & 1) == 0)
  return v13;
}

void sub_19B3C52B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMAccessoryInfoProtoNetworkInfoEventReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  HMAccessoryInfoProtoAirportInfoEvent *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 1;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 4;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 5;
LABEL_24:
        v19 = (HMAccessoryInfoProtoAirportInfoEvent *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_32;
      case 4u:
        PBReaderReadString();
        v19 = (HMAccessoryInfoProtoAirportInfoEvent *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addIpv4Addresses:", v19);
        goto LABEL_32;
      case 5u:
        PBReaderReadString();
        v19 = (HMAccessoryInfoProtoAirportInfoEvent *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addIpv6Addresses:", v19);
        goto LABEL_32;
      case 6u:
        v19 = objc_alloc_init(HMAccessoryInfoProtoAirportInfoEvent);
        objc_storeStrong(a1 + 6, v19);
        if (PBReaderPlaceMark() && HMAccessoryInfoProtoAirportInfoEventReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_32:

LABEL_33:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_33;
    }
  }
}

BOOL HMImmutableSettingsProtoLanguageValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_25;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_25:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_26:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t result;
  HMImmutableSettingsProtoStringValueEvent *v24;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 0u:
        v17 = 0;
        do
        {
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 == -1 || v19 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
            goto LABEL_40;
          }
          v20 = v19 + 1;
          v21 = *(char *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0)
            break;
        }
        while (v17++ <= 8);
        goto LABEL_40;
      case 1u:
        objc_msgSend((id)a1, "clearOneofValuesForSettingValueEvent");
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        v24 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoStringValueEventReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 2u:
        objc_msgSend((id)a1, "clearOneofValuesForSettingValueEvent");
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        v24 = objc_alloc_init(HMImmutableSettingsProtoIntegerValueEvent);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoIntegerValueEventReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 3u:
        objc_msgSend((id)a1, "clearOneofValuesForSettingValueEvent");
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        v24 = objc_alloc_init(HMImmutableSettingsProtoBoolValueEvent);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoolValueEventReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 4u:
        objc_msgSend((id)a1, "clearOneofValuesForSettingValueEvent");
        *(_BYTE *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 4;
        v24 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (PBReaderPlaceMark() && HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)v24, a2))
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_40:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_44:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_40;
    }
  }
}

const __CFString *HMSettingConstraintTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E3AB4340[a1 - 1];
}

void sub_19B3D0B7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D0C30(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D0DCC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D1078(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D1BB4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D1D20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D1FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

__CFString *HMDLocationAuthorizationAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E3AB44B8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown auth: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMDRegionStateString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E3AB44D0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown region state: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMCLAuthorizationStatusAsString(unsigned int a1)
{
  if (a1 < 5)
    return off_1E3AB44E8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown location authorization: %ld"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMCLRegionStateAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E3AB4510[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown region state: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t HMIsValidRegion(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    if ((objc_msgSend(v1, "notifyOnEntry") & 1) != 0)
      v2 = 1;
    else
      v2 = objc_msgSend(v1, "notifyOnExit");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t HMSoftwareUpdateEventProtoSoftwareUpdateProgressReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 20) |= 1u;
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        *(_QWORD *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 20) |= 2u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        *(_DWORD *)(a1 + 16) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B3D68A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_unfair_lock_s *v9;

  _Block_object_dispose(&a9, 8);
  os_unfair_lock_unlock(v9);
  _Unwind_Resume(a1);
}

void sub_19B3D6940(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D6B94(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D6C14(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

Class __getWFHomeWorkflowClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!WorkflowKitLibraryCore_frameworkLibrary)
  {
    WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("WFHomeWorkflow");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getWFHomeWorkflowClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19B3D7988(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D8440(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D8CF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D95BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3D98DC(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_19B3DDCCC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DDD44(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DDDBC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DDE18(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DDE90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DDF3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DDFC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DE150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, os_unfair_lock_s *lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_19B3DE308(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DE388(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3DEEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3E0084(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMDeviceSetupSessionStateAsString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 4)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown state (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AB4888[a1];
  }
  return v1;
}

uint64_t HMImmutableSettingsProtoLanguageSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMImmutableSettingsProtoLanguageValueEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B3E62EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3E6470(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __validateAccessories(void *a1)
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
        objc_opt_class();
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

__CFString *HMAssistantAccessControlOptionsToString(uint64_t a1)
{
  char v1;
  void *v2;
  void *v3;
  __CFString *v4;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if ((v1 & 1) != 0)
      objc_msgSend(v2, "addObject:", CFSTR("Allow Unauthenticated Requests"));
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("None");
  }
  return v4;
}

void sub_19B3E72EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3E73E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B3E7518(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3E7564(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3E8034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3E8F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3E9474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMActionSetTypeIsHomeOwned(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = (objc_msgSend(CFSTR("HMActionSetTypeUserDefined"), "isEqualToString:", v1) & 1) != 0
    || +[HMActionSet isBuiltinActionSetType:](HMActionSet, "isBuiltinActionSetType:", v1);

  return v2;
}

void HMProxify(_QWORD *a1)
{
  void *v2;
  Class Class;
  uint64_t v4;
  size_t InstanceSize;
  void *v6;
  NSObject *v7;
  size_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  Class v18;
  __int16 v19;
  size_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (HMProxify_once != -1)
    dispatch_once(&HMProxify_once, &__block_literal_global_47524);
  v2 = (void *)objc_opt_self();
  Class = object_getClass(a1);
  v4 = -[objc_class instanceMethodForSelector:](Class, "instanceMethodForSelector:", sel_dealloc);
  if (v4 != HMProxify_defaultDealloc)
  {
    if (isInternalBuild())
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be safely proxified, has custom dealloc method"), Class, v13, v14);
      goto LABEL_20;
    }
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = HMFGetLogIdentifier();
      v17 = 2112;
      v18 = Class;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_FAULT, "%{public}@%@ cannot be safely proxified, has custom dealloc method (proceeding anyway)", buf, 0x16u);
    }
    objc_autoreleasePoolPop(v6);
  }
  InstanceSize = class_getInstanceSize(Class);
  if (InstanceSize >= HMProxify_proxyClassIVarSize)
  {
    objc_destructInstance(a1);
    object_setClass(a1, (Class)HMProxify_proxyClassIVar);
    a1[1] = v2;
    return;
  }
  if (InstanceSize >= HMProxify_proxyClassAssocSize)
  {
    objc_destructInstance(a1);
    object_setClass(a1, (Class)HMProxify_proxyClassAssoc);
    objc_setAssociatedObject(a1, &HMProxyObjectAssocTargetKey, v2, (void *)1);
    return;
  }
  v8 = InstanceSize;
  if (isInternalBuild())
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be proxified, instance size too small (%zu < %zu)"), Class, v8, HMProxify_proxyClassAssocSize);
LABEL_20:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v16 = v11;
    v17 = 2112;
    v18 = Class;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = HMProxify_proxyClassAssocSize;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_FAULT, "%{public}@%@ cannot be proxified, instance size too small (%zu < %zu)", buf, 0x2Au);
  }
  objc_autoreleasePoolPop(v9);
}

uint64_t HMAccessoryDiagnosticInfoProtoCloudInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 20) |= 4u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_51:
        *(_BYTE *)(a1 + 16) = v26 != 0;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v30 = 0;
          v31 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 20) |= 2u;
          while (1)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
              break;
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v30;
            if ((v34 & 0x80) == 0)
              goto LABEL_53;
            v30 += 7;
            v14 = v31++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_55:
          v36 = 12;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 20) |= 1u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_45;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_47:
          v36 = 8;
        }
        *(_DWORD *)(a1 + v36) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoSettingChangeEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v23;
  void *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  HMImmutableSettingsProtoStringSettingEvent *v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 0u:
        v17 = 0;
        do
        {
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 == -1 || v19 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
            goto LABEL_51;
          }
          v20 = v19 + 1;
          v21 = *(char *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0)
            break;
        }
        while (v17++ <= 8);
        goto LABEL_51;
      case 1u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v23;

        goto LABEL_51;
      case 2u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 68) |= 2u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                v27 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v27 = 0;
LABEL_57:
        *(_BYTE *)(a1 + 64) = v27 != 0;
        goto LABEL_51;
      case 0xBu:
        objc_msgSend((id)a1, "clearOneofValuesForSettingChangeEvent");
        *(_BYTE *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 48) = 1;
        v32 = objc_alloc_init(HMImmutableSettingsProtoStringSettingEvent);
        objc_storeStrong((id *)(a1 + 56), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoStringSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xCu:
        objc_msgSend((id)a1, "clearOneofValuesForSettingChangeEvent");
        *(_BYTE *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 48) = 2;
        v32 = objc_alloc_init(HMImmutableSettingsProtoBoundedIntegerSettingEvent);
        objc_storeStrong((id *)(a1 + 24), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoundedIntegerSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xDu:
        objc_msgSend((id)a1, "clearOneofValuesForSettingChangeEvent");
        *(_BYTE *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 48) = 3;
        v32 = objc_alloc_init(HMImmutableSettingsProtoBoolSettingEvent);
        objc_storeStrong((id *)(a1 + 16), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoBoolSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xEu:
        objc_msgSend((id)a1, "clearOneofValuesForSettingChangeEvent");
        *(_BYTE *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 48) = 4;
        v32 = objc_alloc_init(HMImmutableSettingsProtoLanguageSettingEvent);
        objc_storeStrong((id *)(a1 + 40), v32);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoLanguageSettingEventReadFrom((uint64_t)v32, a2) & 1) == 0)
        {
          goto LABEL_59;
        }
        goto LABEL_50;
      case 0xFu:
        objc_msgSend((id)a1, "clearOneofValuesForSettingChangeEvent");
        *(_BYTE *)(a1 + 68) |= 1u;
        *(_DWORD *)(a1 + 48) = 5;
        v32 = objc_alloc_init(HMImmutableSettingsProtoAvailableLanguageListEvent);
        objc_storeStrong((id *)(a1 + 8), v32);
        if (PBReaderPlaceMark()
          && (HMImmutableSettingsProtoAvailableLanguageListEventReadFrom(v32, a2) & 1) != 0)
        {
LABEL_50:
          PBReaderRecallMark();

LABEL_51:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_59:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_51;
    }
  }
}

uint64_t HMAccessoryInfoProtoMediaStateEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_47;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_49;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_49:
          v43 = 8;
          goto LABEL_58;
        case 2u:
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v20 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v15 = v27++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_53:
          v43 = 24;
          goto LABEL_58;
        case 3u:
          v32 = 0;
          v33 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          break;
        case 4u:
          *(_BYTE *)(a1 + 48) |= 8u;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v40 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v40 = 0;
          }
          *(_QWORD *)(a1 + 32) = v40;
          continue;
        case 5u:
          PBReaderReadString();
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = *(void **)(a1 + 40);
          *(_QWORD *)(a1 + 40) = v41;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v36;
        v20 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_55;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_57;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
      if (*(_BYTE *)(a2 + *v5))
        v20 = 0;
LABEL_57:
      v43 = 16;
LABEL_58:
      *(_QWORD *)(a1 + v43) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMImmutableSettingsProtoStringValueEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  HMAccessoryInfoProtoPublicPairingIdentity *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(HMAccessoryInfoProtoPublicPairingIdentity **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(HMAccessoryInfoProtoPublicPairingIdentity);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || !HMAccessoryInfoProtoPublicPairingIdentityReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B3F1B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3F1B68(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HMPBCharacteristicWriteActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  HMPBCharacteristicReference *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 6)
        break;
      if ((_DWORD)v17 == 5)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
LABEL_26:
        v20 = *(HMPBCharacteristicReference **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v20 = objc_alloc_init(HMPBCharacteristicReference);
    objc_storeStrong((id *)(a1 + 16), v20);
    if (!PBReaderPlaceMark() || !HMPBCharacteristicReferenceReadFrom((uint64_t)v20, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL HMAccessoryDiagnosticInfoProtoVisibleDeviceInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B3F8380(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3F851C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3F85C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3F8B74(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B3F9FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3FB940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B3FC238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 160));
  _Unwind_Resume(a1);
}

void sub_19B3FCAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_19B3FD21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a29);
  _Unwind_Resume(a1);
}

void sub_19B3FD9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a29);
  _Unwind_Resume(a1);
}

void sub_19B40025C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_19B400524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B400DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, id a19)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_19B40113C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_19B4019B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,id location)
{
  id *v53;

  objc_destroyWeak(v53);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B401FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B40282C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, __int128 buf)
{
  os_unfair_lock_s *v13;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(a1);
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = a11;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v19;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize accessory collection setting item value due to unexpected exception: %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);

    objc_end_catch();
    JUMPOUT(0x19B4027ACLL);
  }
  os_unfair_lock_unlock(v13);
  _Unwind_Resume(a1);
}

void sub_19B402D28(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B402EF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __validateItem(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 1;
  if (v5 && v6)
  {
    objc_msgSend(v6, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemValueClasses");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = 1;
            v17 = v10;
            goto LABEL_14;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }

    if (a3)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Item value class, %@, is not in expected classes: %@"), objc_opt_class(), v10, v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmErrorWithCode:description:reason:suggestion:", 22, CFSTR("Invalid value class."), v18, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v8 = 0;
LABEL_14:

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id __constraintsForItems(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  HMAccessorySettingConstraint *v15;
  HMAccessorySettingConstraint *v16;
  HMAccessorySettingConstraint *v17;
  HMAccessorySettingConstraint *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v3, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = [HMAccessorySettingConstraint alloc];
        v16 = -[HMAccessorySettingConstraint initWithType:value:](v15, "initWithType:value:", 4, v14, (_QWORD)v21);
        objc_msgSend(v7, "member:", v16);
        v17 = (HMAccessorySettingConstraint *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v18 = v17;
        else
          v18 = v16;
        objc_msgSend(v8, "addObject:", v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t HMAccessorySettingTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("data")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("number")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("string")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("selection")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("collection")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *HMAccessorySettingTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E3AB5558[a1 - 1];
}

uint64_t HMAccessorySettingPropertiesFromString(void *a1)
{
  id v1;
  uint64_t v2;
  int v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "containsString:", CFSTR("r"));
  v3 = objc_msgSend(v1, "containsString:", CFSTR("w"));

  if (v3)
    return v2 | 2;
  else
    return v2;
}

id HMAccessorySettingPropertiesToString(char a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "appendString:", CFSTR("r"));
  if ((a1 & 2) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("w"));
  return v3;
}

void sub_19B404134(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B4041A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404214(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B4042C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404388(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404404(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404480(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404908(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404960(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404B0C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404C68(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B404CB4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMServiceConfigurationStateAsString(unint64_t a1)
{
  if (a1 < 4)
    return off_1E3AB56F0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown value: %ld>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMServiceOperatingStateAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E3AB56D8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMServiceOperatingState %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HMServiceOperatingStateAbnormalReasonsAsString(unint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a1)
    goto LABEL_14;
  v3 = 1;
  v4 = a1;
  do
  {
    if ((v3 & a1) == 0)
      goto LABEL_11;
    switch(v3)
    {
      case 1:
        v5 = CFSTR("HMServiceOperatingStateAbnormalReasonOther");
        break;
      case 4:
        v5 = CFSTR("HMServiceOperatingStateAbnormalReasonHighTemperature");
        break;
      case 2:
        v5 = CFSTR("HMServiceOperatingStateAbnormalReasonLowTemperature");
        break;
      default:
        goto LABEL_11;
    }
    v4 &= ~v3;
    objc_msgSend(v2, "addObject:", v5);
LABEL_11:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMServiceOperatingStateAbnormalReasons %lu"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
LABEL_14:
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }

  return v7;
}

BOOL isPresenceAuthorizationValid(void *a1)
{
  return (unint64_t)(objc_msgSend(a1, "value") - 1) < 2;
}

__CFString *HMSiriEndpointProfileSessionStateTypeToString(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if ((unint64_t)(a1 + 1) >= 5)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AB5838[a1 + 1];
  }
  return v1;
}

__CFString *HMSiriEndpointProfileCapabilityToString(unint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if ((a1 & 1) != 0)
      objc_msgSend(v2, "addObject:", CFSTR("Needs Onboarding"));
    if ((a1 & 2) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("Supports Onboarding"));
    v4 = objc_msgSend(v3, "count");
    if (a1 > 3 || !v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Unknown (%@)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("/"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("None");
  }
  return v8;
}

__CFString *HMSiriEndpointProfileMultifunctionButtonTypeToString(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if ((unint64_t)(a1 + 1) >= 3)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AB5860[a1 + 1];
  }
  return v1;
}

__CFString *HMActionTypeAsString(unint64_t a1)
{
  if (a1 < 5)
    return off_1E3AB5878[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown action type: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id HMClassForActionType(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t HMImmutableSettingsProtoStringSettingEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HMImmutableSettingsProtoStringValueEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (HMImmutableSettingsProtoStringValueEventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19B40DB18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedInstanceForLanguageSettingValue__lock);
  _Unwind_Resume(a1);
}

void sub_19B40DBA4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
  _Unwind_Resume(a1);
}

void sub_19B40DD5C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B40DE30(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B40F1B4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B40F300(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMPBActionContainerReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  HMPBCharacteristicWriteAction *v24;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_38;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_40;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_38:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_41;
      case 2u:
        v24 = objc_alloc_init(HMPBCharacteristicWriteAction);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || !HMPBCharacteristicWriteActionReadFrom((uint64_t)v24, a2))
          goto LABEL_43;
        goto LABEL_36;
      case 3u:
        v24 = objc_alloc_init(HMPBMediaPlaybackAction);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (HMPBMediaPlaybackActionReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_43;
        goto LABEL_36;
      case 4u:
        v24 = objc_alloc_init(HMPBNaturalLightingAction);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (PBReaderPlaceMark() && (HMPBNaturalLightingActionReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_43:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_41;
    }
  }
}

void sub_19B411208(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B4126A0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B4127B0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMStringFromAccessoryCommunicationProtocol(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HAP");
  if (a1 == 2)
  {
    v1 = CFSTR("CHIP");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown type: %lu"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t base36Decode(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  v26 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    v8 = *(unsigned __int8 *)(a1 + v7);
    if ((v8 - 48) < 0xA)
    {
      v9 = -48;
      goto LABEL_5;
    }
    v9 = -55;
    if ((v8 - 65) >= 0x1A)
      break;
LABEL_5:
    v12 = (v9 + v8) + 36 * v5;
    v11 = (__PAIR128__(36 * v6, (v9 + v8)) + (unint64_t)v5 * (unsigned __int128)0x24uLL) >> 64;
    result = v12;
    if (__PAIR128__(v11, v12) < __PAIR128__(v6, v5))
    {
      v13 = MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v15;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Decoding base-36 encoded string overflowed 128 bits", (uint8_t *)&v22, 0xCu);

      }
      v16 = (void *)v13;
      goto LABEL_14;
    }
    ++v7;
    v5 = v12;
    v6 = v11;
    if (a2 == v7)
      return result;
  }
  v17 = MEMORY[0x1A1AC1AAC]();
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(unsigned __int8 *)(a1 + v7);
    v22 = 138543618;
    v23 = v19;
    v24 = 1024;
    v25 = v20;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Decoding base-36 encoded string encountered an invalid character - 0x%02x", (uint8_t *)&v22, 0x12u);

  }
  v16 = (void *)v17;
LABEL_14:
  objc_autoreleasePoolPop(v16);
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v21;
  return result;
}

void sub_19B41612C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B41A9E8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B41AA60(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t isValidPresenceType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeCurrentUserAtHome")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeCurrentUserNotAtHome")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeAnyUserAtHome")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeNoUserAtHome")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeUsersAtHome")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeUsersNotAtHome"));
  }

  return v2;
}

uint64_t usersListApplicable(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeUsersAtHome")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("HMPresenceTypeUsersNotAtHome"));

  return v2;
}

void sub_19B41DD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____handleFinishedUnarchive_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  HMSoftwareUpdateDocumentation *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMSoftwareUpdateDocumentation *v16;
  HMSoftwareUpdateDocumentation *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  HMSoftwareUpdateDocumentation *v24;
  BOOL v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMSoftwareUpdateDocumentation *v38;
  void *v39;
  void *v40;
  id v41;
  HMSoftwareUpdateDocumentation *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  HMSoftwareUpdateDocumentation *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2 == 3)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(HMSoftwareUpdateDocumentation **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v54 = v7;
      v55 = 2112;
      v56 = v8;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finished unarchive with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v9 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v9, "setState:", 2);
    }
    else
    {
      v11 = v9;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("HMSoftwareUpdateDocumentationAsset.validation"));
      v13 = (void *)MEMORY[0x1A1AC1AAC]();
      v14 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v11, "bundleURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleWithURL:", v15);
      v16 = (HMSoftwareUpdateDocumentation *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v51 = v13;
        v52 = v12;
        +[HMSoftwareUpdateDocumentation localizationsForBundle:](HMSoftwareUpdateDocumentation, "localizationsForBundle:", v16);
        v17 = (HMSoftwareUpdateDocumentation *)objc_claimAutoreleasedReturnValue();
        v18 = -[HMSoftwareUpdateDocumentation count](v17, "count");
        v19 = (void *)MEMORY[0x1A1AC1AAC]();
        v20 = v11;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v18)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v23;
            v55 = 2112;
            v56 = v17;
            _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Available localizations: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          v24 = -[HMSoftwareUpdateDocumentation initWithBundle:]([HMSoftwareUpdateDocumentation alloc], "initWithBundle:", v16);
          v25 = v24 != 0;
          v26 = (void *)MEMORY[0x1A1AC1AAC]();
          v27 = v20;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v24)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v30;
              v55 = 2112;
              v56 = v24;
              _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_INFO, "%{public}@Cached documentation: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v26);
            v31 = 0;
          }
          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v40;
              v55 = 2112;
              v56 = v16;
              _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse documentation for asset bundle: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v26);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v13 = v51;

          v12 = v52;
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v39;
            v55 = 2112;
            v56 = v16;
            _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@No available localization for asset bundle: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v12 = v52;
        }

      }
      else
      {
        v32 = (void *)MEMORY[0x1A1AC1AAC]();
        v33 = v11;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v35 = v13;
          v36 = v12;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "bundleURL");
          v38 = (HMSoftwareUpdateDocumentation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v37;
          v55 = 2112;
          v56 = v38;
          _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to create bundle from: %@", buf, 0x16u);

          v12 = v36;
          v13 = v35;
        }

        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
      }

      objc_autoreleasePoolPop(v13);
      v41 = objc_retainAutorelease(v31);

      v42 = (HMSoftwareUpdateDocumentation *)v41;
      if (v25)
      {
        objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
      }
      else
      {
        v43 = (void *)MEMORY[0x1A1AC1AAC]();
        v44 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v46;
          v55 = 2112;
          v56 = v42;
          _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to validate asset with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        objc_msgSend(*(id *)(a1 + 32), "setError:", v42);
        objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "bundleURL");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "removeItemAtURL:error:", v48, 0);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "archiveURL");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "removeItemAtURL:error:", v50, 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "setExtractor:", 0);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v10;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to finish unarchive, not currently unarchiving", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void sub_19B41F49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __processNextArchivedData(void *a1)
{
  _QWORD *v1;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ____processNextArchivedData_block_invoke;
    block[3] = &unk_1E3AB5E18;
    v5 = v1;
    dispatch_async(v3, block);

  }
}

void ____processNextArchivedData_block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "archivedFileStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBytesAvailable");

  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = *v2;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Reading next chunk from the archive", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v11 = *(void **)(a1 + 32);
    v10 = (id *)(a1 + 32);
    objc_msgSend(v11, "archivedFileStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "read:maxLength:", buf, 4096);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *v10);
    objc_msgSend(*v10, "extractor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ____processNextArchivedData_block_invoke_281;
    v17[3] = &unk_1E3AB5EB0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v15, "supplyBytes:withCompletionBlock:", v14, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Reached end of input stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "finishUnarchive");
  }
}

void sub_19B41F964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____processNextArchivedData_block_invoke_281(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = v7;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to append data with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "cancelUnarchiveWithError:", v5);
  }
  else if (a3)
  {
    objc_msgSend(WeakRetained, "finishUnarchive");
  }
  else
  {
    __processNextArchivedData();
  }

}

id __resourceBundleForBundle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("AssetData"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find resource bundle", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v3 = 0;
  }

  return v3;
}

HMHTMLDocument *__htmlDocumentForResource(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HMHTMLDocument *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5, "URLForResource:withExtension:subdirectory:localization:", v7, CFSTR("html"), 0, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12));
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v15 = (void *)v13;
          v22 = 0;
          v14 = -[HMHTMLDocument initWithURL:error:]([HMHTMLDocument alloc], "initWithURL:error:", v13, &v22);
          v16 = v22;
          if (!v14)
          {
            v17 = (void *)MEMORY[0x1A1AC1AAC]();
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v28 = v19;
              v29 = 2112;
              v30 = v20;
              v31 = 2112;
              v32 = v16;
              _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Unable to load document, %@, with error: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v17);
          }

          goto LABEL_15;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

void sub_19B421634(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMSiriEndpointProfileAssistantActiveTypeToString(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if ((unint64_t)(a1 + 1) >= 3)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3AB6008[a1 + 1];
  }
  return v1;
}

uint64_t HMUserActionPredictionDuetPredictionValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
LABEL_24:
          v21 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 4u:
          *(_BYTE *)(a1 + 48) |= 1u;
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v24 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v24 = 0;
          }
          *(_QWORD *)(a1 + 8) = v24;
          continue;
        case 5u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        v30 = v29 + 1;
        if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v30;
        v27 |= (unint64_t)(v31 & 0x7F) << v25;
        if ((v31 & 0x80) == 0)
          goto LABEL_36;
        v25 += 7;
        v15 = v26++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v27) = 0;
LABEL_38:
      *(_DWORD *)(a1 + 24) = v27;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HMUserDefaultCamerasAccessLevel(int a1)
{
  if (a1)
    return 2;
  else
    return 1;
}

__CFString *HMUserCameraAccessLevelAsString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("HMUserCameraAccessLevelStream");
  if (a1 == 2)
  {
    v1 = CFSTR("HMUserCameraAccessLevelStreamAndViewRecordings");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMUserCameraAccessLevel %tu"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

BOOL HMUserIsStreamingAllowedWithCameraAccessLevel(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL HMUserIsRecordingAllowedWithCameraAccessLevel(uint64_t a1)
{
  return a1 == 2;
}

BOOL HMUserIsValidCameraAccessLevel(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *HMUserPresenceAuthorizationStatusAsString(unint64_t a1)
{
  if (a1 < 3)
    return off_1E3AB6120[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMUserPresenceAuthorizationStatus %tu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19B425314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__56794(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__56795(uint64_t a1)
{

}

void sub_19B426A10(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B427E00(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19B427F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B428394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

uint64_t sub_19B428EFC()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_19B428F08()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_19B428F14()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_19B428F20()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_19B428F2C()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_19B428F38()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_19B428F44()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_19B428F50()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_19B428F5C()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_19B428F68()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_19B428F74()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_19B428F80()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_19B428F8C()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_19B428F98()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_19B428FA4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_19B428FB0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_19B428FBC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_19B428FC8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_19B428FD4()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_19B428FE0()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_19B428FEC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_19B428FF8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_19B429004()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_19B429010()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_19B42901C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_19B429028()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_19B429034()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_19B429040()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_19B42904C()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_19B429058()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_19B429064()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_19B429070()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_19B42907C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_19B429088()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_19B429094()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_19B4290A0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_19B4290AC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_19B4290B8()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_19B4290C4()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_19B4290D0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_19B4290DC()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_19B4290E8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_19B4290F4()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_19B429100()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_19B42910C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_19B429118()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_19B429124()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_19B429130()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_19B42913C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_19B429148()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_19B429154()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_19B429160()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_19B42916C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_19B429178()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_19B429184()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_19B429190()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_19B42919C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_19B4291A8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_19B4291B4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_19B4291C0()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_19B4291CC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_19B4291D8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_19B4291E4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_19B4291F0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_19B4291FC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_19B429208()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_19B429214()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_19B429220()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_19B42922C()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_19B429238()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_19B429244()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_19B429250()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_19B42925C()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_19B429268()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_19B429274()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_19B429280()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_19B42928C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_19B429298()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_19B4292A4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_19B4292B0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_19B4292BC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_19B4292C8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_19B4292D4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19B4292E0()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_19B4292EC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_19B4292F8()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_19B429304()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_19B429310()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_19B42931C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1E0C800D8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1E0C800E0]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

uint64_t HMEProtoEventInfoReadFrom()
{
  return MEMORY[0x1E0D32D18]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1E0D27E00]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1E0D27E08]();
}

uint64_t HMFDigestAlgorithmFromString()
{
  return MEMORY[0x1E0D27E18]();
}

uint64_t HMFDigestAlgorithmToString()
{
  return MEMORY[0x1E0D27E20]();
}

uint64_t HMFEnabledStatusToString()
{
  return MEMORY[0x1E0D27FB0]();
}

uint64_t HMFEncodedRootObject()
{
  return MEMORY[0x1E0D27FB8]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x1E0D27FC0]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1E0D27FD0]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1E0D27FD8]();
}

uint64_t HMFMethodDescription()
{
  return MEMORY[0x1E0D28018]();
}

uint64_t HMFObjectDescription()
{
  return MEMORY[0x1E0D28020]();
}

uint64_t HMFQOSClassFromQualityOfService()
{
  return MEMORY[0x1E0D284E8]();
}

uint64_t HMFQualityOfServiceToString()
{
  return MEMORY[0x1E0D284F8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1E0CB29B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB29C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1E0D1B210]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x1E0D1B228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t SecPasswordCreateWithRandomDigits()
{
  return MEMORY[0x1E0CD6430]();
}

uint64_t SecPasswordIsPasswordWeak()
{
  return MEMORY[0x1E0CD6440]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x1E0CD6448]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1E0DB0FF0]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1E0DB1018]();
}

uint64_t TLV8BufferAppend()
{
  return MEMORY[0x1E0D1B728]();
}

uint64_t TLV8BufferFree()
{
  return MEMORY[0x1E0D1B740]();
}

uint64_t TLV8BufferInit()
{
  return MEMORY[0x1E0D1B748]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x1E0D1B760]();
}

uint64_t TLV8GetOrCopyCoalesced()
{
  return MEMORY[0x1E0D1B768]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1E0D28700]();
}

uint64_t _HMFPreconditionFailureWithFormat()
{
  return MEMORY[0x1E0D28708]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __HMFActivityScopeLeave()
{
  return MEMORY[0x1E0D28710]();
}

uint64_t _dyld_images_for_addresses()
{
  return MEMORY[0x1E0C80EC0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF130](connection, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

void nw_connection_set_path_changed_handler(nw_connection_t connection, nw_connection_path_event_handler_t handler)
{
  MEMORY[0x1E0CCF1A8](connection, handler);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x1E0CCF1C8](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1E0DE7C68](obj);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1E0DE8030](a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

