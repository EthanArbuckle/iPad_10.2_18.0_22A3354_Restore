uint64_t getProtectionModeForAccessory(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "protectionMode");

  if (v3 && objc_msgSend(v1, "supportsNetworkProtection"))
    v4 = objc_msgSend(v1, "targetNetworkProtectionMode");
  else
    v4 = 3;

  return v4;
}

BOOL shouldManageAccessory(void *a1)
{
  id v1;
  _BOOL8 v2;
  void *v3;
  void *v4;

  v1 = a1;
  if ((objc_msgSend(v1, "supportsNetworkProtection") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(v1, "wiFiUniquePreSharedKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v2 = 1;
    }
    else
    {
      objc_msgSend(v1, "networkClientIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v4 != 0;

    }
  }

  return v2;
}

void sub_1CD7E7D1C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

HMDNetworkRouterCredential *networkRouterCredentialForAccessory(void *a1, void *a2)
{
  id v3;
  id v4;
  HMDNetworkRouterCredential *v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(HMDNetworkRouterCredential);
  objc_msgSend(v3, "wiFiUniquePreSharedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "wiFiUniquePreSharedKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterCredential setPsk:](v5, "setPsk:", v7);

  }
  else
  {
    -[HMDNetworkRouterCredential setMacAddress:](v5, "setMacAddress:", v4);
  }

  return v5;
}

void sub_1CD7EB42C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1CD7ED018(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__133069(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__133070(uint64_t a1)
{

}

uint64_t AWDHomeKitEventTriggerReadFrom(uint64_t a1, uint64_t a2)
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
  AWDHomeKitEventTriggerEvent *v17;
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
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;

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
        v17 = objc_alloc_init(AWDHomeKitEventTriggerEvent);
        objc_msgSend((id)a1, "addEvents:", v17);
        if (PBReaderPlaceMark() && (AWDHomeKitEventTriggerEventReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_40;
        goto LABEL_75;
      case 2u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 36) |= 8u;
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
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_58:
        v42 = v21 != 0;
        v43 = 33;
        goto LABEL_63;
      case 3u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 36) |= 4u;
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
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v27 = 0;
LABEL_62:
        v42 = v27 != 0;
        v43 = 32;
LABEL_63:
        *(_BYTE *)(a1 + v43) = v42;
        goto LABEL_73;
      case 4u:
        v17 = objc_alloc_init(AWDHomeKitPredicate);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (AWDHomeKitPredicateReadFrom(v17, a2) & 1) != 0)
        {
LABEL_40:
          PBReaderRecallMark();

LABEL_73:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_75:

        return 0;
      case 5u:
        v31 = 0;
        v32 = 0;
        v33 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (v14)
              {
                LODWORD(v33) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v33) = 0;
LABEL_67:
        v44 = 8;
        goto LABEL_72;
      case 6u:
        v37 = 0;
        v38 = 0;
        v33 = 0;
        *(_BYTE *)(a1 + 36) |= 2u;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 1;
            v33 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              v14 = v38++ >= 9;
              if (v14)
              {
                LODWORD(v33) = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v33) = 0;
LABEL_71:
        v44 = 12;
LABEL_72:
        *(_DWORD *)(a1 + v44) = v33;
        goto LABEL_73;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_73;
    }
  }
}

void sub_1CD7F9520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD7F9894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD803E60(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD803EF8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD803FD0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD807D7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD80801C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8083F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 144));
  _Unwind_Resume(a1);
}

void sub_1CD808510(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8085E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD80A0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD80A48C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__136612(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__136613(uint64_t a1)
{

}

void sub_1CD80A8B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD80A9BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD80AAD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD80AC28(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD80AD08(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD80B8C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD814CE4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __rootSettingUUIDInSettingModels(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "hmbParentModelID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          objc_msgSend(v9, "hmbModelID");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

__CFString *HMDUserDataControllerStateAsString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 4)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown state %@"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E89B7E38[a1];
  }
  return v1;
}

void sub_1CD826F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD827D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__139225(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__139226(uint64_t a1)
{

}

void sub_1CD835964(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8359D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD835AAC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD835B80(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83A518(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83A930(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83A99C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83B3A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83B404(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83B8FC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83BE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27,id a28)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a27);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1CD83C0D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83C12C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83C2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD83C7A0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83D704(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83EC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD83EFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD83F2F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83F3BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83F4AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83F594(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83FAD0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD83FBC4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD840B00(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD840E1C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD840E98(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD841808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8420A0(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD842834(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD842D94(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD844BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD847AB0(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD848F28(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD849458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD849830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD84ACF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD84C774(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD84E91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43)
{
  uint64_t v43;

  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(&a43);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t isIrrecoverableError(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (objc_msgSend(v1, "isHMError")
    && (objc_msgSend(v1, "code") == 90
     || objc_msgSend(v1, "code") == 79
     || objc_msgSend(v1, "code") == 52
     || objc_msgSend(v1, "code") == 96
     || objc_msgSend(v1, "code") == 13
     || objc_msgSend(v1, "code") == 11
     || objc_msgSend(v1, "code") == 55))
  {
    goto LABEL_30;
  }
  if (!objc_msgSend(v1, "isHAPError"))
    goto LABEL_40;
  if (objc_msgSend(v1, "code") != 20
    && objc_msgSend(v1, "code") != 21
    && objc_msgSend(v1, "code") != 22
    && objc_msgSend(v1, "code") != 23
    && objc_msgSend(v1, "code") != 26
    && objc_msgSend(v1, "code") != 25
    && objc_msgSend(v1, "code") != 34
    && objc_msgSend(v1, "code") != 9
    && objc_msgSend(v1, "code") != 12
    && objc_msgSend(v1, "code") != 10
    && objc_msgSend(v1, "code") != 11
    && objc_msgSend(v1, "code") != 18
    && objc_msgSend(v1, "code") != 7
    && objc_msgSend(v1, "code") != 3
    && objc_msgSend(v1, "code") != 15
    && objc_msgSend(v1, "code") != 17
    && objc_msgSend(v1, "code") != 16
    && objc_msgSend(v1, "code") != 35
    && objc_msgSend(v1, "code") != 36
    && objc_msgSend(v1, "code") != 30)
  {
    if (objc_msgSend(v1, "code") == 13
      || objc_msgSend(v1, "code") == 14
      || objc_msgSend(v1, "code") == 2
      || objc_msgSend(v1, "code") == 1)
    {
      objc_msgSend(v1, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
      v6 = v5;

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v6, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v6, "code"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = isIrrecoverableError();

LABEL_41:
        goto LABEL_42;
      }
    }
LABEL_40:
    objc_msgSend(v1, "domain");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CC1AF8]);
    goto LABEL_41;
  }
LABEL_30:
  v2 = 1;
LABEL_42:

  return v2;
}

id _normalizeSetupCode(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  if (objc_msgSend(MEMORY[0x1E0D165A0], "isValidSetupCode:", v1) || objc_msgSend(v1, "length") != 8)
  {
    v3 = v1;
  }
  else
  {
    v2 = (void *)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(v2, "insertString:atIndex:", CFSTR("-"), 3);
    objc_msgSend(v2, "insertString:atIndex:", CFSTR("-"), 6);
    v3 = (id)objc_msgSend(v2, "copy");

  }
  return v3;
}

uint64_t __Block_byref_object_copy__140814(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__140815(uint64_t a1)
{

}

void sub_1CD856E2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD858EE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id observerMatchingConnection(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a2;
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "observedObject", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = HMFEqualObjects();

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void sub_1CD859DA0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD859E50(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85A02C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD85A1B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t AWDHomeKitPredicateReadFrom(_BYTE *a1, uint64_t a2)
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
  AWDHomeKitPresenceEvent *v17;
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
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  BOOL v43;
  uint64_t v44;

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
          v17 = objc_alloc_init(AWDHomeKitPresenceEvent);
          objc_msgSend(a1, "addPresenceEvents:", v17);
          if (PBReaderPlaceMark() && AWDHomeKitPresenceEventReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          a1[20] |= 2u;
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
              goto LABEL_53;
            v19 += 7;
            v14 = v20++ >= 9;
            if (v14)
            {
              v21 = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_55:
          v43 = v21 != 0;
          v44 = 17;
          goto LABEL_68;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          a1[20] |= 4u;
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
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_59:
          v43 = v27 != 0;
          v44 = 18;
          goto LABEL_68;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          a1[20] |= 8u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v33 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_63:
          v43 = v33 != 0;
          v44 = 19;
          goto LABEL_68;
        case 5u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          a1[20] |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v40 = *v3;
        v41 = *(_QWORD *)(a2 + v40);
        if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
          break;
        v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
        *(_QWORD *)(a2 + v40) = v41 + 1;
        v39 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0)
          goto LABEL_65;
        v37 += 7;
        v14 = v38++ >= 9;
        if (v14)
        {
          v39 = 0;
          goto LABEL_67;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_65:
      if (*(_BYTE *)(a2 + *v5))
        v39 = 0;
LABEL_67:
      v43 = v39 != 0;
      v44 = 16;
LABEL_68:
      a1[v44] = v43;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1CD85DA4C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85DBC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85DC70(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85DD04(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85DD70(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85DEE4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85DF64(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85E238(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD85E2CC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD863768(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1CD863BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD868644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__142400(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__142401(uint64_t a1)
{

}

void sub_1CD878C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id createHMFNetAddressFromIPAddressString(void *a1)
{
  id v1;
  uint64_t v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _BYTE v10[28];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "UTF8String");
  if (v2)
    v3 = (const char *)v2;
  else
    v3 = "";
  *(_OWORD *)v10 = xmmword_1CDB8FBC0;
  if (inet_pton(2, v3, &v10[4]) == 1
    || (*(_OWORD *)v10 = xmmword_1CDB8F810,
        *(_OWORD *)&v10[12] = *(__int128 *)((char *)&xmmword_1CDB8F810 + 12),
        inet_pton(30, v3, &v10[8]) == 1))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28600]), "initWithSocketAddress:", v10);
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = v8;
      *(_WORD *)&v10[12] = 2112;
      *(_QWORD *)&v10[14] = v1;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@'%@' is not a valid IPv4 or IPv6 address string", v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

void __validateHostNameForWANFirewallRule_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(?=[^*]*(?:\\*(?:[^*]+|$)){0,2}$)[a-zA-Z0-9*](?:[a-zA-Z0-9*-]*[a-zA-Z0-9*])?$"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)validateHostNameForWANFirewallRule_componentRegex;
  validateHostNameForWANFirewallRule_componentRegex = v0;

}

uint64_t decodeStringFromJSONDictionary(void *a1, void *a2, int a3, _QWORD *a4)
{
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  char isKindOfClass;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v22 = 0;
  v9 = decodeValueFromJSONDictionary(v7, v8, a3, &v22);
  v10 = v22;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v12 = v10;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v14 = v12;
      else
        v14 = 0;
      v15 = v14;

      if ((isKindOfClass & 1) != 0 && objc_msgSend(v12, "length"))
      {
        *a4 = objc_retainAutorelease(v12);
        v16 = 1;
      }
      else
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        objc_opt_class();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = v20;
          v25 = 2112;
          v26 = v8;
          v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v17);
        v16 = 0;
      }

    }
    else
    {
      *a4 = 0;
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t decodeValueFromJSONDictionary(void *a1, void *a2, int a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    *a4 = objc_retainAutorelease(v9);
LABEL_8:
    v15 = 1;
    goto LABEL_9;
  }
  if (!a3)
  {
    *a4 = 0;
    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  objc_opt_class();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@JSON contains no '%@' value: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = 0;
LABEL_9:

  return v15;
}

uint64_t decodeUnsignedIntegerFromJSONDictionary(void *a1, void *a2, int a3, unint64_t a4, _QWORD *a5)
{
  id v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  char isKindOfClass;
  void *v16;
  id v17;
  CFTypeID v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v25 = 0;
  v11 = decodeValueFromJSONDictionary(v9, v10, a3, &v25);
  v12 = v25;
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
      v14 = v12;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v16 = v14;
      else
        v16 = 0;
      v17 = v16;

      if ((isKindOfClass & 1) != 0
        && objc_msgSend(v14, "unsignedLongLongValue") <= a4
        && (v18 = CFGetTypeID(v14), v18 != CFBooleanGetTypeID()))
      {
        *a5 = objc_retainAutorelease(v14);
        v23 = 1;
      }
      else
      {
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        objc_opt_class();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v22;
          v28 = 2112;
          v29 = v10;
          v30 = 2112;
          v31 = v9;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v19);
        v23 = 0;
      }

    }
    else
    {
      *a5 = 0;
      v23 = 1;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t decodeAddressFromJSONDictionary(void *a1, void *a2, int a3, _QWORD *a4)
{
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v19 = 0;
  v9 = decodeStringFromJSONDictionary(v7, v8, a3, &v19);
  v10 = v19;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      createHMFNetAddressFromIPAddressString(v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = v12;
      if (!v12)
      {
        v13 = (void *)MEMORY[0x1D17BA0A0]();
        objc_opt_class();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v21 = v16;
          v22 = 2112;
          v23 = v8;
          v24 = 2112;
          v25 = v7;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' address: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v13);
        goto LABEL_7;
      }
    }
    else
    {
      *a4 = 0;
    }
    v17 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v17 = 0;
LABEL_10:

  return v17;
}

uint64_t decodeTimeFromJSONDictionary(void *a1, void *a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  v4 = decodeUnsignedIntegerFromJSONDictionary(a1, a2, 1, 0xFFFFFFFFuLL, &v8);
  v5 = v8;
  v6 = v5;
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v5, "unsignedLongValue"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t decodePortFromJSONDictionary(void *a1, void *a2, int a3, _WORD *a4, BOOL *a5)
{
  uint64_t v7;
  id v8;
  void *v9;
  __int16 v10;
  id v12;

  v12 = 0;
  v7 = decodeUnsignedIntegerFromJSONDictionary(a1, a2, a3, 0xFFFFuLL, &v12);
  v8 = v12;
  v9 = v8;
  if ((_DWORD)v7)
  {
    if (a5)
      *a5 = v8 != 0;
    if (v8)
      v10 = objc_msgSend(v8, "unsignedShortValue");
    else
      v10 = 0;
    *a4 = v10;
  }

  return v7;
}

void sub_1CD87A3F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1CD87A9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD87AAB0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD87B010(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD87C54C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;

  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v15;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v12;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@### decode eventValue resulted in exception: %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v16 = *(void **)(v11 + 128);
    *(_QWORD *)(v11 + 128) = 0;

    objc_end_catch();
    JUMPOUT(0x1CD87C510);
  }
  _Unwind_Resume(a1);
}

id serviceTypeUUIDsForAccessory(void *a1)
{
  void *v1;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v1, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "type", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v2, "shouldFilterServiceOfType:", v10) & 1) == 0)
          {
            objc_msgSend(v9, "type");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    v12 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_1CD887BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  __HMFActivityScopeLeave();
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD88E558(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x3A0]);
  _Unwind_Resume(a1);
}

__CFString *changeTypeAsNSString(unint64_t a1)
{
  if (a1 < 4)
    return off_1E89B9530[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<UNKNOWN %lu>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void __sort(void *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
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
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "count") >= 2)
  {
    v2 = (void *)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v1, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v36 = v1;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v53 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "change", v36);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v2, "count");
    v13 = 0;
    v37 = v12 & ~(v12 >> 63);
    v38 = v4;
    v41 = v2;
    while (objc_msgSend(v2, "count", v36))
    {
      v39 = v13;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = (id)objc_msgSend(v2, "copy");
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      if (v14)
      {
        v15 = v14;
        v43 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v49 != v43)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "change");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "parentUUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v17, "change");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "parentUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v22);

            }
            objc_msgSend(v17, "dependentUUIDs");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "allObjects");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObjectsFromArray:", v24);

            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v25 = v18;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v45;
              while (2)
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v45 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
                  if (objc_msgSend(v3, "containsObject:", v30)
                    && !objc_msgSend(v11, "containsObject:", v30))
                  {

                    goto LABEL_29;
                  }
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
                if (v27)
                  continue;
                break;
              }
            }

            objc_msgSend(v40, "addObject:", v17);
            objc_msgSend(v17, "change");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "uuid");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v32);

            objc_msgSend(v41, "removeObject:", v17);
LABEL_29:

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        }
        while (v15);
      }

      v4 = v38;
      v13 = v39 + 1;
      v2 = v41;
      if (v39 == v37)
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v35;
          v58 = 2112;
          v59 = v41;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Possible circular dependency in %@, trying to continue", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        objc_msgSend(v40, "addObjectsFromArray:", v41);
        objc_msgSend(v41, "removeAllObjects");
        break;
      }
    }
    objc_msgSend(v4, "setArray:", v40);

    v1 = v36;
  }

}

void sub_1CD89453C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD894974(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __identifierForParentUUID(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = __identifierForParentUUID_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&__identifierForParentUUID_onceToken, &__block_literal_global_926);
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v4 = __identifierForParentUUID_namespace;
  objc_msgSend(v2, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithNamespace:data:", v4, v6);

  return v7;
}

void ____identifierForParentUUID_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("497A934F-F7DC-4596-BA43-9B1BBA077D55"));
  v1 = (void *)__identifierForParentUUID_namespace;
  __identifierForParentUUID_namespace = v0;

}

id __HMDDeviceCapabilitiesModelCodingKeyMapping()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[59];
  _QWORD v62[61];

  v62[59] = *MEMORY[0x1E0C80C00];
  v61[0] = CFSTR("HM.keychainSync");
  NSStringFromSelector(sel_supportsKeychainSync);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v60;
  v61[1] = CFSTR("HM.deviceSetup");
  NSStringFromSelector(sel_supportsDeviceSetup);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v59;
  v61[2] = CFSTR("HM.keyTransferClient");
  NSStringFromSelector(sel_supportsKeyTransferClient);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v58;
  v61[3] = CFSTR("HM.keyTransferServer");
  NSStringFromSelector(sel_supportsKeyTransferServer);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v57;
  v61[4] = CFSTR("HM.standalone");
  NSStringFromSelector(sel_supportsStandaloneMode);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v56;
  v61[5] = CFSTR("HM.cloudDataSync");
  NSStringFromSelector(sel_supportsCloudDataSync);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v55;
  v61[6] = CFSTR("HM.WHA");
  NSStringFromSelector(sel_supportsWholeHouseAudio);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v54;
  v61[7] = CFSTR("HM.assistantAC");
  NSStringFromSelector(sel_supportsAssistantAccessControl);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v53;
  v61[8] = CFSTR("HM.resident");
  NSStringFromSelector(sel_residentCapable);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v52;
  v61[9] = CFSTR("HM.remoteGateway");
  NSStringFromSelector(sel_remoteGatewayCapable);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v51;
  v61[10] = CFSTR("HM.homeInvitation");
  NSStringFromSelector(sel_supportsHomeInvitation);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v50;
  v61[11] = CFSTR("HM.targetControl");
  NSStringFromSelector(sel_supportsTargetControl);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v62[11] = v49;
  v61[12] = CFSTR("HM.multiUser");
  NSStringFromSelector(sel_supportsMultiUser);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v48;
  v61[13] = CFSTR("HM.homeLevelLocationServiceSetting");
  NSStringFromSelector(sel_supportsHomeLevelLocationServiceSetting);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v62[13] = v47;
  v61[14] = CFSTR("HM.restart");
  NSStringFromSelector(sel_supportsCompanionInitiatedRestart);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[14] = v46;
  v61[15] = CFSTR("HM.obliterate");
  NSStringFromSelector(sel_supportsCompanionInitiatedObliterate);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[15] = v45;
  v61[16] = CFSTR("HM.camRec");
  NSStringFromSelector(sel_supportsCameraRecording);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[16] = v44;
  v61[17] = CFSTR("HM.routerManagement");
  NSStringFromSelector(sel_supportsRouterManagement);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[17] = v43;
  v61[18] = CFSTR("HM.shortcutAction");
  NSStringFromSelector(sel_supportsShortcutActions);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[18] = v42;
  v61[19] = CFSTR("HM.mediaActions");
  NSStringFromSelector(sel_supportsMediaActions);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[19] = v41;
  v61[20] = CFSTR("HM.firmwareUpdate");
  NSStringFromSelector(sel_supportsFirmwareUpdate);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[20] = v40;
  v61[21] = CFSTR("HM.residentFirmwareUpdate");
  NSStringFromSelector(sel_supportsResidentFirmwareUpdate);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[21] = v39;
  v61[22] = CFSTR("HM.cameraActivityZones");
  NSStringFromSelector(sel_supportsCameraActivityZones);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[22] = v38;
  v61[23] = CFSTR("HM.createMusicAlarm");
  NSStringFromSelector(sel_supportsMusicAlarm);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v62[23] = v37;
  v61[24] = CFSTR("HM.faceClassification");
  NSStringFromSelector(sel_supportsFaceClassification);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[24] = v36;
  v61[25] = CFSTR("HM.naturalLighting");
  NSStringFromSelector(sel_supportsNaturalLighting);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62[25] = v35;
  v61[26] = CFSTR("HM.IDSActivityMonitorPresence");
  NSStringFromSelector(sel_supportsIDSActivityMonitorPresence);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v62[26] = v34;
  v61[27] = CFSTR("HM.cameraRecordingReachabilityNotifications");
  NSStringFromSelector(sel_supportsCameraRecordingReachabilityNotifications);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62[27] = v33;
  v61[28] = CFSTR("HM.announce");
  NSStringFromSelector(sel_supportsAnnounce);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[28] = v32;
  v61[29] = CFSTR("HM.ThirdPartyMusic");
  NSStringFromSelector(sel_supportsThirdPartyMusic);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62[29] = v31;
  v61[30] = CFSTR("HM.preferredMediaUser");
  NSStringFromSelector(sel_supportsPreferredMediaUser);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62[30] = v30;
  v61[31] = CFSTR("HM.ThreadBorderRouter");
  NSStringFromSelector(sel_supportsThreadBorderRouter);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[31] = v29;
  v61[32] = CFSTR("HM.siriEndpointSetup");
  NSStringFromSelector(sel_supportsSiriEndpointSetup);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62[32] = v28;
  v61[33] = CFSTR("HM.homeHub");
  NSStringFromSelector(sel_supportsHomeHub);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[33] = v27;
  v61[34] = CFSTR("HM.lockNotificationContext");
  NSStringFromSelector(sel_supportsLockNotificationContext);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[34] = v26;
  v61[35] = CFSTR("HM.wakeOnLAN");
  NSStringFromSelector(sel_supportsWakeOnLAN);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62[35] = v25;
  v61[36] = CFSTR("HM.audioReturnChannel");
  NSStringFromSelector(sel_supportsAudioReturnChannel);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62[36] = v24;
  v61[37] = CFSTR("HM.walletKey");
  NSStringFromSelector(sel_supportsWalletKey);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[37] = v23;
  v61[38] = CFSTR("HM.cameraPackageDetection");
  NSStringFromSelector(sel_supportsCameraPackageDetection);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[38] = v22;
  v61[39] = CFSTR("HM.coordinationDoorbellChime");
  NSStringFromSelector(sel_supportsCoordinationDoorbellChime);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62[39] = v21;
  v61[40] = CFSTR("HM.coordinationFreeDoorbellChime");
  NSStringFromSelector(sel_supportsCoordinationFreeDoorbellChime);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v62[40] = v20;
  v61[41] = CFSTR("HM.TVOSUpdateManualUpdateAvailableNotification");
  NSStringFromSelector(sel_supportsTVOSUpdateManualUpdateAvailableNotification);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62[41] = v19;
  v61[42] = CFSTR("HM.accessCodes");
  NSStringFromSelector(sel_supportsAccessCodes);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[42] = v18;
  v61[43] = CFSTR("HM.CHIP");
  NSStringFromSelector(sel_supportsCHIP);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62[43] = v17;
  v61[44] = CFSTR("HM.doorbellChime");
  NSStringFromSelector(sel_supportsDoorbellChime);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v62[44] = v16;
  v61[45] = CFSTR("HM.userMediaSettings");
  NSStringFromSelector(sel_supportsUserMediaSettings);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v62[45] = v15;
  v61[46] = CFSTR("HM.unifiedMediaNotifications");
  NSStringFromSelector(sel_supportsUnifiedMediaNotifications);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[46] = v14;
  v61[47] = CFSTR("HM.managedConfigProfile");
  NSStringFromSelector(sel_supportsManagedConfigurationProfile);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62[47] = v13;
  v61[48] = CFSTR("HM.captiveNetworks");
  NSStringFromSelector(sel_supportsCaptiveNetworks);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[48] = v12;
  v61[49] = CFSTR("HM.modernTransport");
  NSStringFromSelector(sel_supportsModernTransport);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v62[49] = v0;
  v61[50] = CFSTR("HM.residentFirstAccessoryCommunication");
  NSStringFromSelector(sel_supportsResidentFirstAccessoryCommunication);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v62[50] = v1;
  v61[51] = CFSTR("HM.messagedHomePodSettings");
  NSStringFromSelector(sel_supportsMessagedHomePodSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v62[51] = v2;
  v61[52] = CFSTR("HM.customDestinationMediaAction");
  NSStringFromSelector(sel_supportsCustomMediaApplicationDestination);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v62[52] = v3;
  v61[53] = CFSTR("HM.threadNetworkCredentialSharing");
  NSStringFromSelector(sel_supportsThreadNetworkCredentialSharing);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62[53] = v4;
  v61[54] = CFSTR("HM.matterSharedAdminPairing");
  NSStringFromSelector(sel_supportsMatterSharedAdminPairing);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v62[54] = v5;
  v61[55] = CFSTR("HM.appleTVRMV");
  NSStringFromSelector(sel_supportsRMVonAppleTV);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62[55] = v6;
  v61[56] = CFSTR("HM.justSiri");
  NSStringFromSelector(sel_supportsJustSiri);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62[56] = v7;
  v61[57] = CFSTR("HM.threadService");
  NSStringFromSelector(sel_supportsThreadService);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62[57] = v8;
  v61[58] = CFSTR("HM.matterOwnerCertFetch");
  NSStringFromSelector(sel_supportsMatterOwnerCertFetch);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62[58] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 59);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL productSupportsKeychainSync(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = 1;
  switch(objc_msgSend(v1, "productPlatform"))
  {
    case 1:
    case 5:
      break;
    case 2:
      if (objc_msgSend(v1, "productClass") == 6)
        goto LABEL_2;
      v2 = objc_msgSend(v1, "productClass") != 4;
      break;
    default:
LABEL_2:
      v2 = 0;
      break;
  }

  return v2;
}

BOOL productSupportsDeviceSetup(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productClass");
  if (v4 == 4)
    return HMFOperatingSystemVersionCompare() != 1;
  else
    return v4 == 6;
}

BOOL productSupportsKeyTransferClient(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v5, "productPlatform") == 1)
    goto LABEL_7;
  objc_msgSend(v5, "softwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "operatingSystemVersion");
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  v13 = *MEMORY[0x1E0D28490];
  v14 = *(_QWORD *)(MEMORY[0x1E0D28490] + 16);
  v10 = HMFOperatingSystemVersionCompare();

  if (v10 == -1)
LABEL_7:
    v11 = objc_msgSend(v5, "productPlatform", v13, v14, v15, v16, v17) == 5;
  else
    v11 = productSupportsKeychainSync(v5);

  return v11;
}

BOOL productSupportsKeyTransferServer(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "productClass") == 4 && objc_msgSend(v1, "productPlatform") == 4)
  {
    objc_msgSend(v1, "softwareVersion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      objc_msgSend(v2, "operatingSystemVersion");
    if (HMFOperatingSystemVersionCompare() == -1)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v1, "softwareVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        objc_msgSend(v5, "operatingSystemVersion");
      v4 = HMFOperatingSystemVersionCompare() == -1;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL productSupportsStandaloneMode(void *a1)
{
  id v1;
  unint64_t v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "productPlatform");
  if (v2 > 5)
  {
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  if (((1 << v2) & 0x2A) == 0)
  {
    if (((1 << v2) & 0x11) == 0 && objc_msgSend(v1, "productClass") != 6)
    {
      v3 = objc_msgSend(v1, "productClass") != 4;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v3 = 1;
LABEL_7:

  return v3;
}

uint64_t productSupportsCloudDataSync(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = 1;
  switch(objc_msgSend(v1, "productPlatform"))
  {
    case 1:
    case 5:
      break;
    case 2:
      v5 = objc_msgSend(v1, "productClass") == 4;
      goto LABEL_7;
    case 4:
      v5 = HMFOperatingSystemVersionCompare() == 1;
LABEL_7:
      v4 = !v5;
      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

BOOL productSupportsWholeHouseAudio(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productClass");
  return (v4 == 6 || v4 == 4) && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsAssistantAccessControl(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("enableAppleMedia"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v1, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "operatingSystemVersion");

  if (objc_msgSend(v1, "productClass") == 6)
    v7 = HMFOperatingSystemVersionCompare() != 1;
  else
LABEL_5:
    v7 = 0;

  return v7;
}

BOOL productIsResidentCapable(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productClass");
  if (v4 == 6)
    return 1;
  if (v4 == 4 || v4 == 3)
    return HMFOperatingSystemVersionCompare() != 1;
  return 0;
}

BOOL productSupportsHomeInvitation(void *a1)
{
  id v1;
  uint64_t v2;
  _BOOL8 v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "productPlatform");
  if (v2 == 1 || v2 == 5)
    v4 = 1;
  else
    v4 = v2 == 2 && objc_msgSend(v1, "productClass") != 6 && objc_msgSend(v1, "productClass") != 4;

  return v4;
}

BOOL productSupportsTargetControl(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  if (objc_msgSend(v1, "productClass") == 4)
  {
    objc_msgSend(v1, "softwareVersion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      objc_msgSend(v2, "operatingSystemVersion");

    v4 = HMFOperatingSystemVersionCompare() != 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL productSupportsMultiUser(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productClass");
  return (v4 == 6 || v4 == 4) && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsHomeLevelLocationServiceSetting(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BOOL8 result;

  v1 = a1;
  v2 = objc_msgSend(v1, "productPlatform");
  v3 = objc_msgSend(v1, "productClass");
  objc_msgSend(v1, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");

  result = 0;
  if (v2 == 4 && v3 == 6)
    return HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsCompanionInitiatedRestart(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productClass");
  return v4 == 6 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCompanionInitiatedObliterate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productClass");
  return v4 == 6 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCameraRecording(void *a1)
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  _BOOL8 result;

  v1 = a1;
  v2 = objc_msgSend(v1, "productPlatform");
  v3 = objc_msgSend(v1, "productClass");
  objc_msgSend(v1, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");

  result = 0;
  if (v3 <= 6 && ((1 << v3) & 0x58) != 0)
    return (v2 == 2 || v2 == 4) && HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsRouterManagement(void *a1)
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v1 = a1;
  if (!productIsResidentCapable(v1))
  {
LABEL_8:
    v6 = 0;
    goto LABEL_10;
  }
  v2 = objc_msgSend(v1, "productPlatform");
  v3 = objc_msgSend(v1, "productClass");
  objc_msgSend(v1, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");

  v6 = 0;
  if (v3 <= 6 && ((1 << v3) & 0x58) != 0)
  {
    if (v2 == 4 || v2 == 2)
    {
      v6 = HMFOperatingSystemVersionCompare() != 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
LABEL_10:

  return v6;
}

BOOL productSupportsShortcutActions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  result = 1;
  switch(v4)
  {
    case 1:
    case 2:
    case 4:
      result = HMFOperatingSystemVersionCompare() != 1;
      break;
    case 5:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

BOOL productSupportsMediaActions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  result = 1;
  switch(v4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      result = HMFOperatingSystemVersionCompare() != 1;
      break;
    case 5:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

BOOL productSupportsFirmwareUpdate(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "productPlatform");
  v3 = objc_msgSend(v1, "productClass");
  objc_msgSend(v1, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");

  if (objc_msgSend(v1, "productPlatform") == 1)
  {
LABEL_4:
    v6 = HMFOperatingSystemVersionCompare() != 1;
  }
  else
  {
    v6 = 0;
    switch(v3)
    {
      case 1:
      case 3:
        if (v2 == 2)
          goto LABEL_4;
        goto LABEL_9;
      case 4:
      case 6:
        if (v2 == 4)
          goto LABEL_4;
LABEL_9:
        v6 = 0;
        break;
      case 11:
        v6 = 1;
        break;
      default:
        break;
    }
  }

  return v6;
}

BOOL productSupportsResidentFirmwareUpdate(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "productPlatform");
  v3 = objc_msgSend(v1, "productClass");
  objc_msgSend(v1, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "operatingSystemVersion");

  return (v3 | 2) == 6 && v2 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCameraActivityZones(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  if (v5 == 6 || v5 == 4)
  {
    if (v4 == 4)
      return HMFOperatingSystemVersionCompare() != 1;
  }
  else if (v5 == 3 && v4 == 2)
  {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return 0;
}

BOOL productSupportsMusicAlarm(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productClass");
  return v4 == 6 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsAnnounce(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  switch(v5)
  {
    case 1:
    case 2:
    case 3:
      if (v4 != 2)
        goto LABEL_10;
      goto LABEL_9;
    case 5:
      if (v4 == 3)
        goto LABEL_9;
      goto LABEL_10;
    case 6:
      if (v4 == 4)
LABEL_9:
        result = HMFOperatingSystemVersionCompare() != 1;
      else
LABEL_10:
        result = 0;
      break;
    case 11:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

BOOL productSupportsThirdPartyMusic(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 6 && v4 == 4)
    return HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsPreferredMediaUser(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 6 && v4 == 4)
    return HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsUserMediaSettings(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 6 && v4 == 4)
    return HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsCoordinationDoorbellChime(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 6 && v4 == 4)
    return HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsCoordinationFreeDoorbellChime(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 6 && v4 == 4)
    return HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsSiriEndpointSetup(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  return (v5 | 2) == 6 && v4 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsHomeHub(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  _BOOL8 v9;

  v3 = a1;
  v4 = a2;
  if (!_os_feature_enabled_impl())
    goto LABEL_8;
  objc_msgSend(v3, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "operatingSystemVersion");

  v7 = objc_msgSend(v3, "productPlatform");
  if (objc_msgSend(v3, "productClass") == 6)
  {
    v8 = objc_msgSend(v4, "supportsSiriHub");
    v9 = 0;
    if (v7 == 4 && v8)
      v9 = HMFOperatingSystemVersionCompare() != 1;
  }
  else
  {
LABEL_8:
    v9 = 0;
  }

  return v9;
}

BOOL productSupportsWakeOnLAN(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  switch(v5)
  {
    case 1:
    case 3:
      if (v4 != 2)
        goto LABEL_8;
      goto LABEL_7;
    case 4:
    case 6:
      if (v4 == 4)
LABEL_7:
        result = HMFOperatingSystemVersionCompare() != 1;
      else
LABEL_8:
        result = 0;
      break;
    default:
      return result;
  }
  return result;
}

BOOL productSupportsLockNotificationContext(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  if (v5 == 6 || v5 == 4)
  {
    if (v4 == 4)
      return HMFOperatingSystemVersionCompare() != 1;
  }
  else if (v5 == 3 && v4 == 2)
  {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return 0;
}

uint64_t productSupportsAudioReturnChannel(void *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(a1, "productClass") == 6)
    v4 = objc_msgSend(v3, "supportsReceivingARCStreamOverAirPlay");
  else
    v4 = 0;

  return v4;
}

BOOL productSupportsUnifiedMediaNotifications(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  return (v5 | 2) == 6 && v4 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCaptiveNetworks(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 6 && v4 == 4)
    return HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsResidentFirstAccessoryCommunication(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 <= 6 && ((1 << v5) & 0x58) != 0)
    return (v4 == 2 || v4 == 4) && HMFOperatingSystemVersionCompare() != 1;
  return result;
}

BOOL productSupportsMessagedHomePodSettings(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  HMDHomeKitVersion *v9;

  v3 = a1;
  v4 = a2;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "softwareVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "operatingSystemVersion");

    v8 = objc_msgSend(v3, "productPlatform");
    v7 = 0;
    if (objc_msgSend(v3, "productClass") == 6 && v8 == 4)
    {
      v9 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("8.0"));
      v7 = -[HMDHomeKitVersion compare:](v9, "compare:", v4) != 1 && HMFOperatingSystemVersionCompare() != 1;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL productSupportsCustomMediaApplicationDestination(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  return (v5 | 2) == 6 && v4 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsThreadNetworkCredentialSharing(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 IsResidentCapable;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v7, "softwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "operatingSystemVersion");

  v10 = objc_msgSend(v7, "productPlatform");
  v11 = objc_msgSend(v7, "productClass");
  IsResidentCapable = productIsResidentCapable(v7);

  if (IsResidentCapable)
  {
    if (v11 == 6 || v11 == 4)
    {
      if (v10 == 4)
        return HMFOperatingSystemVersionCompare() != 1;
    }
    else if (v11 == 3 && v10 == 2)
    {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  return 0;
}

BOOL productSupportsMatterSharedAdminPairing(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 IsResidentCapable;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v7, "softwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "operatingSystemVersion");

  v10 = objc_msgSend(v7, "productPlatform");
  v11 = objc_msgSend(v7, "productClass");
  IsResidentCapable = productIsResidentCapable(v7);

  if (IsResidentCapable)
  {
    if (v11 == 6 || v11 == 4)
    {
      if (v10 == 4)
        return HMFOperatingSystemVersionCompare() != 1;
    }
    else if (v11 == 3 && v10 == 2)
    {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  return 0;
}

uint64_t productSupportsRMVonAppleTV(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 4 && v4 == 4)
  {
    if (HMFOperatingSystemVersionCompare() == 1)
      return 0;
    else
      return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t productSupportsJustSiri(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = a1;
  objc_msgSend(v1, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  v4 = objc_msgSend(v1, "productPlatform");
  v5 = objc_msgSend(v1, "productClass");

  result = 0;
  if (v5 == 6 && v4 == 4)
  {
    if (HMFOperatingSystemVersionCompare() == 1)
      return 0;
    else
      return _os_feature_enabled_impl();
  }
  return result;
}

BOOL productSupportsMatterOwnerCertFetch(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 IsResidentCapable;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v7, "softwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "operatingSystemVersion");

  v10 = objc_msgSend(v7, "productPlatform");
  v11 = objc_msgSend(v7, "productClass");
  IsResidentCapable = productIsResidentCapable(v7);

  if (IsResidentCapable)
  {
    if (v11 == 6 || v11 == 4)
    {
      if (v10 == 4)
        return HMFOperatingSystemVersionCompare() != 1;
    }
    else if (v11 == 3 && v10 == 2)
    {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  return 0;
}

void sub_1CD899B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD89DD28(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMDWatchManagerUpdateWithConnectedDevices(void *a1, void *a2)
{
  void *v3;
  os_unfair_lock_s *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  HMDDevice *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  os_unfair_lock_s *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  os_unfair_lock_s *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id obj;
  id obja;
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
  const __CFString *v55;
  void *v56;
  _BYTE v57[128];
  const __CFString *v58;
  void *v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v38 = a1;
  v39 = a2;
  if (v38)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = (os_unfair_lock_s *)v38;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v6;
      v64 = 2112;
      v65 = v39;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Processing connected devices: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v39, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v7 = v39;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v52 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (+[HMDWatchManager isCompatibleWatchDevice:](HMDWatchManager, "isCompatibleWatchDevice:", v11))
          {
            v12 = -[HMDDevice initWithService:device:]([HMDDevice alloc], "initWithService:device:", *(_QWORD *)&v4[10]._os_unfair_lock_opaque, v11);
            if (v12)
              objc_msgSend(v40, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v8);
    }

    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)&v4[8]._os_unfair_lock_opaque);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "allObjects");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)&v4[8]._os_unfair_lock_opaque;
    *(_QWORD *)&v4[8]._os_unfair_lock_opaque = v13;

    LOBYTE(v4[6]._os_unfair_lock_opaque) = objc_msgSend(v40, "count") != 0;
    os_unfair_lock_unlock(v4 + 2);
    objc_msgSend(v37, "hmf_removedObjectsFromSet:", v40);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v48 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          v19 = (void *)MEMORY[0x1D17BA0A0]();
          v20 = v4;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v63 = v22;
            v64 = 2112;
            v65 = v18;
            _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Removed connected device: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          +[HMDWatchConnectivityLogEventManager sharedInstance](HMDWatchConnectivityLogEventManager, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "incrementWatchRemovedNotificationCount");

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = CFSTR("HMDDeviceNotificationKey");
          v59 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("HMDWatcherManagerWatchDisconnectedNotification"), v20, v25);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v15);
    }

    objc_msgSend(v37, "hmf_addedObjectsFromSet:", v40);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obja = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v44;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v44 != v27)
            objc_enumerationMutation(obja);
          v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
          v30 = (void *)MEMORY[0x1D17BA0A0]();
          v31 = v4;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v63 = v33;
            v64 = 2112;
            v65 = v29;
            _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Added connected device: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          +[HMDWatchConnectivityLogEventManager sharedInstance](HMDWatchConnectivityLogEventManager, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "incrementWatchAddedNotificationCount");

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = CFSTR("HMDDeviceNotificationKey");
          v56 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "postNotificationName:object:userInfo:", CFSTR("HMDWatcherManagerWatchConnectedNotification"), v31, v36);

        }
        v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
      }
      while (v26);
    }

  }
}

void sub_1CD89E704(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8A4F38(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8A5108(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8A52C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8A6C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CD8A956C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD8A97E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD8ADF98(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__147676(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__147677(uint64_t a1)
{

}

void __updateClipManagerWriteAccess(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v3, "accessModeAtHome");
  LODWORD(v5) = HMIsRecordingAllowedForCameraAccessMode();
  objc_msgSend(v3, "accessModeNotAtHome");

  v6 = v5 | HMIsRecordingAllowedForCameraAccessMode();
  objc_msgSend(v4, "clipManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHasWriteAccess:", v6);
}

void sub_1CD8C73B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8C7824(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL __HMDDeviceSetupManagerIsProxSetupRunning(void *a1)
{
  unsigned int *v1;
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  unsigned int *v7;
  NSObject *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "darwinNotificationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notifyIsValidToken:", v1[3]);

  if (v3)
  {
    v12 = 0;
    objc_msgSend(v1, "darwinNotificationProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "notifyGetState:state:", v1[3], &v12);

    if (!v5)
    {
      v10 = v12 == 1;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 1024;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get ProxSetup state with status: %u", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v6);
  }
  v10 = 0;
LABEL_7:

  return v10;
}

void sub_1CD8C84B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v11);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v17 - 112));
  _Unwind_Resume(a1);
}

void sub_1CD8C8540()
{
  JUMPOUT(0x1CD8C8518);
}

void sub_1CD8C854C()
{
  JUMPOUT(0x1CD8C8520);
}

void sub_1CD8C8558()
{
  JUMPOUT(0x1CD8C8528);
}

void sub_1CD8C8780(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CD8C8B18(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8C8DFC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1CD8C8FF8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8CA61C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8CC5BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1CD8CE6FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__150635(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__150636(uint64_t a1)
{

}

void sub_1CD8CF838(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8CFA70(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8CFB54(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8D00DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8D06A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD8D7220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;
  id *v31;
  uint64_t v32;

  objc_destroyWeak(v30);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v32 - 160));
  _Unwind_Resume(a1);
}

void sub_1CD8D7C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;
  id *v31;
  uint64_t v32;

  objc_destroyWeak(v30);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v32 - 160));
  _Unwind_Resume(a1);
}

void sub_1CD8D8C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;
  id *v30;
  uint64_t v31;

  objc_destroyWeak(v29);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v31 - 176));
  _Unwind_Resume(a1);
}

void sub_1CD8D9614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8D9F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8DB848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8E07BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8EAECC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8EBA10(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8EBABC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8EC474(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8EC5F0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id ipAccessoryStageSystemCriteria()
{
  xpc_object_t v0;
  const char *v1;
  unsigned int v2;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E0C807A0], "com.apple.homed.firmwareUpdate.ipAccessory.stage.group");
  v1 = (const char *)*MEMORY[0x1E0C80798];
  v2 = uint32ForPreference(CFSTR("firmwareUpdateIPAccessoryStageConcurrentLimit"));
  xpc_dictionary_set_uint64(v0, v1, v2);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E0C808C8], 1);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E0C80828], (const char *)*MEMORY[0x1E0C80838]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E0C80738], 1);
  return v0;
}

id bleAccessoryStageSystemCriteria()
{
  xpc_object_t v0;
  const char *v1;
  unsigned int v2;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E0C807A0], "com.apple.homed.firmwareUpdate.bleAccessory.stage.group");
  v1 = (const char *)*MEMORY[0x1E0C80798];
  v2 = uint32ForPreference(CFSTR("firmwareUpdateBLEAccessoryStageConcurrentLimit"));
  xpc_dictionary_set_uint64(v0, v1, v2);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E0C80760], 5);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C8]);
  return v0;
}

id threadAccessoryStageSystemCriteria()
{
  xpc_object_t v0;
  const char *v1;
  unsigned int v2;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E0C807A0], "com.apple.homed.firmwareUpdate.threadAccessory.stage.group");
  v1 = (const char *)*MEMORY[0x1E0C80798];
  v2 = uint32ForPreference(CFSTR("firmwareUpdateThreadAccessoryStageConcurrentLimit"));
  xpc_dictionary_set_uint64(v0, v1, v2);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E0C808C8], 1);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E0C80828], (const char *)*MEMORY[0x1E0C80838]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E0C80760], 5);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C8]);
  return v0;
}

uint64_t uint32ForPreference(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = uint32ForPreference_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&uint32ForPreference_onceToken, &__block_literal_global_141_152939);
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  return v6;
}

uint64_t __uint32ForPreference_block_invoke()
{
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34D58, CFSTR("firmwareUpdateStageMinDelay"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34D70, CFSTR("firmwareUpdateStageMaxDelay"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34D88, CFSTR("firmwareUpdateApplyMinDelay"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34DA0, CFSTR("firmwareUpdateApplyMaxDelay"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34DB8, CFSTR("firmwareUpdateIPAccessoryStageConcurrentLimit"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34D88, CFSTR("firmwareUpdateIPAccessoryApplyConcurrentLimit"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34DD0, CFSTR("firmwareUpdateBLEAccessoryStageConcurrentLimit"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34DE8, CFSTR("firmwareUpdateBLEAccessoryApplyConcurrentLimit"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34DD0, CFSTR("firmwareUpdateThreadAccessoryStageConcurrentLimit"));
  return objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B34DD0, CFSTR("firmwareUpdateThreadAccessoryApplyConcurrentLimit"));
}

void sub_1CD8F5FC8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8F6F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18, id a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1CD8F8808(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8F89D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8F9014(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __HMDRemoteDeviceMonitorReachable(void *a1)
{
  id *v1;
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  id *v11;
  id *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_14;
  if ((objc_msgSend(v1[13], "isReachable") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v2;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    v10 = "%{public}@Considering ourselves unreachable because net monitor is unreachable";
LABEL_12:
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0xCu);

    goto LABEL_13;
  }
  WeakRetained = objc_loadWeakRetained(v2 + 11);
  objc_msgSend(WeakRetained, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v2;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    v10 = "%{public}@Considering ourselves unreachable because there is no current device";
    goto LABEL_12;
  }
  if ((objc_msgSend(v2[7], "hmd_isActive") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v2;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      v10 = "%{public}@Considering ourselves unreachable because the IDSService is not active";
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v6);
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  v5 = 1;
LABEL_15:

  return v5;
}

void sub_1CD8F9870(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD8FD17C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD8FD42C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1CD8FDBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8FE258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8FE4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD8FFD1C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD900304(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __hmiActivityZonesFromActivityZones_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createHMIActivityZoneWithIsInclusion:", *(unsigned __int8 *)(a1 + 32));
}

void sub_1CD908040(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

id getCurrentPairingIdentityWithPrivilege(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v4 = objc_msgSend(v3, "getControllerPublicKey:secretKey:username:allowCreation:error:", &v16, 0, &v15, 0, &v14);
  v5 = v16;
  v6 = v15;
  v7 = v14;
  v8 = v7;
  if ((v4 & 1) != 0)
  {

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v5);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D165A8]), "initWithIdentifier:publicKey:privateKey:permissions:", v6, v8, 0, (a1 & 0xFFFFFFFFFFFFFFFDLL) == 1);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get current user from keychain with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

void sub_1CD90B74C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD90B898(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD90B98C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD90D6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD90E208(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1CD90EBD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9153F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  uint64_t v15;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_1CD919AE0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD91A658(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD91B604(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id __accessoriesFromAccessoryUUIDs(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "accessoryWithUUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

id __displayNameForUser(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__155676;
  v13 = __Block_byref_object_dispose__155677;
  v14 = 0;
  v2 = (void *)MEMORY[0x1E0D28540];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ____displayNameForUser_block_invoke;
  v6[3] = &unk_1E89C0800;
  v3 = v1;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v2, "activityWithName:block:", CFSTR("User.Name"), v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_1CD91BE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__155676(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__155677(uint64_t a1)
{

}

void ____displayNameForUser_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "accountHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v12;
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v13;
    if (!v13)
    {
      v14 = 0;
      goto LABEL_6;
    }
  }
  v14 = v3;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_6:
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForObjectValue:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    goto LABEL_7;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
LABEL_7:

}

void __registerForAccountNotifications(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  unsigned __int8 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:name:object:", v1, CFSTR("HMDAccountRegistryAddedAccountNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", v1, CFSTR("HMDAccountRegistryRemovedAccountNotification"), 0);

    objc_msgSend(v1, "accountHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v19 = 0;
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountForHandle:exists:", v4, &v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v19;
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = v1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v7)
      {
        if (v11)
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v21 = v12;
          v22 = 2112;
          v23 = v13;
          _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Registering for notifications for account: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = sel___handleRemovedAccount_;
        +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("HMDAccountRegistryRemovedAccountNotification");
      }
      else
      {
        if (v11)
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v18;
          _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Registering for account notifications", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = sel___handleAddedAccount_;
        +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("HMDAccountRegistryAddedAccountNotification");
      }
      objc_msgSend(v14, "addObserver:selector:name:object:", v9, v15, v17, v16);

    }
  }

}

void __handleUpdatedAccount(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(v1, "deregisterIdentity");
    objc_msgSend(v1, "registerIdentity");

  }
}

void __updateWithAccount(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = v3;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating with account: %@ / %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    if (v4)
    {
      objc_msgSend(v6, "accountHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v4, "handles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v10);

        if ((v12 & 1) != 0)
        {
          if (objc_msgSend(v4, "isAuthenticated"))
          {
            objc_msgSend(v4, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "accountIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = HMFEqualObjects();

            if ((v15 & 1) == 0)
            {
              v16 = (void *)MEMORY[0x1D17BA0A0]();
              v17 = v6;
              HMFGetOSLogHandle();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "userID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v35 = v19;
                v36 = 2112;
                v37 = v20;
                v38 = 2112;
                v39 = v13;
                _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account identifier to: %@ / %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v16);
              v21 = (void *)objc_msgSend(v17, "newModelWithChangeType:", 2);
              objc_msgSend(v21, "setAccountIdentifier:", v13);
              objc_msgSend(v17, "home");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "backingStore");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "transaction:options:", CFSTR("userUpdateAccountIdentifier"), v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v25, "add:", v21);
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = ____updateWithAccount_block_invoke;
              v31[3] = &unk_1E89C21C0;
              v32 = v17;
              v33 = v13;
              objc_msgSend(v25, "run:", v31);

            }
          }
        }
        else
        {
          v26 = (void *)MEMORY[0x1D17BA0A0]();
          v27 = v6;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "userID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v35 = v29;
            v36 = 2112;
            v37 = v30;
            v38 = 2112;
            v39 = v4;
            _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to update with account: %@ / %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v26);
        }
      }

    }
  }

}

void ____updateWithAccount_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "userID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finished updating the accountIdentifier [%@] for user [%@] finished with error: %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);

}

id _userPairingIdentity(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E0D165A8];
    v4 = a1;
    v5 = [v3 alloc];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v5, "initWithIdentifier:publicKey:privateKey:permissions:", v6, v7, 0, (a2 & 0xFFFFFFFFFFFFFFFDLL) == 1);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void ____auditAccount_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accountHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v7;
      v22 = 2112;
      v23 = v2;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing user account with handle : %@ for home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    v19 = 0;
    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountForHandle:exists:", v2, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      __updateWithAccount(*(void **)(a1 + 32), v11);
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "userID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v17;
        v22 = 2112;
        v23 = v18;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Account does not currently exist for user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "userID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Not auditing the account for the user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }

}

void sub_1CD921790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v18 - 104));
  _Unwind_Resume(a1);
}

void sub_1CD922174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD924028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD925554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__156932(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__156933(uint64_t a1)
{

}

void __updateRegistration(void *a1, char *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HMDBackingStoreLogAddTransactionOperation *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[2];
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  HMDBackingStoreLogAddTransactionOperation *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, a4, 0, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transaction:options:", CFSTR("Object registration"), v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v13), "modelObjectWithChangeType:version:", a2, 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "add:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v11);
  }

  v15 = -[HMDBackingStoreLogAddTransactionOperation initWithTransaction:]([HMDBackingStoreLogAddTransactionOperation alloc], "initWithTransaction:", v9);
  objc_msgSend(v9, "objects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionBlock sort:](HMDBackingStoreTransactionBlock, "sort:", v16);

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = v7;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a2 - 1) > 2)
      v21 = CFSTR("unknown");
    else
      v21 = off_1E89B7420[(_QWORD)(a2 - 1)];
    v22 = v21;
    objc_msgSend(v9, "options");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v38 = v20;
    v39 = 2112;
    v40 = v22;
    v41 = 2112;
    v42 = v23;
    v43 = 2112;
    v44 = v15;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Registration operation -- changeType: %@, options: %@ (%@)", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v17);
  objc_initWeak((id *)buf, v18);
  objc_initWeak(&location, v15);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = ____updateRegistration_block_invoke;
  v28[3] = &unk_1E89BB868;
  objc_copyWeak(&v30, (id *)buf);
  objc_copyWeak(v31, &location);
  v24 = v9;
  v29 = v24;
  v31[1] = a2;
  -[HMDBackingStoreOperation setResultBlock:](v15, "setResultBlock:", v28);
  -[HMDBackingStoreOperation setStore:](v15, "setStore:", v18);
  -[HMDBackingStore dataSource]((id *)v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "backingStoreOperationQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addOperation:", v15);

  objc_destroyWeak(v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void sub_1CD925E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void ____updateRegistration_block_invoke(uint64_t a1, void *a2)
{
  HMDHomeSaveRequest *v3;
  id WeakRetained;
  HMDHomeSaveRequest *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeSaveRequest *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  HMDHomeSaveRequest *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDHomeSaveRequest *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDHomeSaveRequest *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void (**v61)(_QWORD, _QWORD);
  HMDHomeSaveRequest *v62;
  id v63;
  HMDHomeSaveRequest *v64;
  void *v65;
  id obj;
  id v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  HMDHomeSaveRequest *v78;
  __int16 v79;
  HMDHomeSaveRequest *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (HMDHomeSaveRequest *)objc_loadWeakRetained((id *)(a1 + 48));
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = WeakRetained;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "options");
      v10 = (HMDHomeSaveRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v9;
      v77 = 2112;
      v78 = v10;
      v79 = 2112;
      v80 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting operation -- options: %@ (%@)", buf, 0x20u);

    }
    v63 = WeakRetained;

    objc_autoreleasePoolPop(v6);
    objc_msgSend(v7, "homeManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v65, "isDataSyncInProgress") ^ 1;
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v7;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = a1;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Model objects:", buf, 0xCu);

      a1 = v15;
    }

    objc_autoreleasePoolPop(v12);
    v17 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "dumpWithVerbosity:prefix:logType:", v11, &stru_1E89C3E38, 1));
    v18 = v13;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v76 = v21;
        v77 = 2112;
        v78 = v5;
        v79 = 2112;
        v80 = v3;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@error occurred during save of %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v18, "local");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_rollback");
    }
    else
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v76 = v26;
        v77 = 2112;
        v78 = v5;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@save complete for operation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v18, "local");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (id)objc_msgSend(v22, "_commit");
    }
    v64 = v3;

    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = v18;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v31;
      v77 = 2112;
      v78 = v5;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@running operation: %@", buf, 0x16u);

    }
    v62 = v5;

    objc_autoreleasePoolPop(v28);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "objects");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = v65;
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v69)
    {
      v68 = *(_QWORD *)v71;
      v67 = v29;
      do
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v71 != v68)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          v35 = (void *)MEMORY[0x1D17BA0A0]();
          v36 = v29;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = a1;
            v40 = *(_QWORD *)(a1 + 56) - 1;
            v41 = CFSTR("unknown");
            if (v40 <= 2)
              v41 = off_1E89B7420[v40];
            v42 = v41;
            objc_msgSend(v34, "change");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "uuid");
            v44 = (HMDHomeSaveRequest *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v76 = v38;
            v77 = 2112;
            v78 = (HMDHomeSaveRequest *)v42;
            v79 = 2112;
            v80 = v44;
            _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Updating registration for object -- changeType: %@, object: %@", buf, 0x20u);

            a1 = v39;
            v32 = v65;
            v29 = v67;
          }

          objc_autoreleasePoolPop(v35);
          objc_msgSend(v36, "home");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45;
          if (v45)
          {
            objc_msgSend(v45, "zoneID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "UUIDString");
            v48 = (HMDHomeSaveRequest *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "syncManager");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "resetCloudPushTimer:", v48);

            objc_msgSend(*(id *)(a1 + 32), "options");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "label");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "change");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "saveWithReason:postSyncNotification:objectChange:", v51, 0, v52 != 0);

          }
          else
          {
            objc_msgSend(v32, "syncManager");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "resetCloudPushTimer:", 0);

            v54 = [HMDHomeSaveRequest alloc];
            objc_msgSend(*(id *)(a1 + 32), "options");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "label");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[HMDHomeSaveRequest initWithReason:information:postSyncNotification:](v54, "initWithReason:information:postSyncNotification:", v56, 0, 0);

            v57 = (void *)MEMORY[0x1D17BA0A0]();
            v58 = v36;
            HMFGetOSLogHandle();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v76 = v60;
              v77 = 2112;
              v78 = v48;
              _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_INFO, "%{public}@submitting save request: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v57);
            objc_msgSend(v32, "saveWithRequest:", v48);
            v29 = v67;
          }

        }
        v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v69);
    }

    -[HMDHomeSaveRequest operationFinishBlock](v62, "operationFinishBlock");
    v61 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v61[2](v61, 0);

    WeakRetained = v63;
    v3 = v64;
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[HMDBackingStore] Lost store when running transaction", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }

}

void sub_1CD92AAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__157420(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__157421(uint64_t a1)
{

}

void sub_1CD92BCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD92CCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD92CD64(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_1CD92CEF8(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_1CD92D078(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_1CD931008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD9310C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD93143C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD9318F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD934770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMDCameraLocalStreamSessionStateAsString(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;

  v2 = a1 - 1;
  v3 = CFSTR("UNKNOWN");
  switch(v2)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("NEGOTIATION");
      return v3;
    case 2:
    case 4:
    case 5:
    case 6:
      goto LABEL_7;
    case 3:
      return CFSTR("IDS-SESSION-STARTED");
    case 7:
      return CFSTR("STREAMING-STARTED-DEVICE");
    default:
      if (a1 == 16)
        return CFSTR("STREAM-STOPPED");
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDCameraLocalStreamSessionState %tu"), a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

void sub_1CD9366E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD937518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  id *v35;

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__159048(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__159049(uint64_t a1)
{

}

void sub_1CD937F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CD938070(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9380E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD938184(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD939450(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD93C828(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD93C8A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__159642(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__159643(uint64_t a1)
{

}

id encodedSnapshotFile(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8[0] = *MEMORY[0x1E0CB9C50];
  v1 = a1;
  objc_msgSend(v1, "slotIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = *MEMORY[0x1E0CBACC0];
  objc_msgSend(v1, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = *MEMORY[0x1E0CBACB8];
  objc_msgSend(v1, "snapshotTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = *MEMORY[0x1E0CB9DA8];
  objc_msgSend(v1, "aspectRatio");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL HMDRemoteEventRouterProtoEventsMessageReadFrom(void *a1, uint64_t a2)
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

void sub_1CD942CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9433CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1CD944B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD945354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __percentageForCharacteristicValue(void *a1, void *a2)
{
  id v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  double v16;

  if (a2)
  {
    v3 = a1;
    objc_msgSend(a2, "floatValue");
    v5 = v4;
    objc_msgSend(v3, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "minimumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "minimumValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;

    }
    else
    {
      v10 = 0.0;
    }

    objc_msgSend(v6, "maximumValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "maximumValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

    }
    else
    {
      v15 = 100.0;
    }

    *(float *)&v16 = (float)(v5 - v10) / (float)(v15 - v10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void sub_1CD947CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD947D58(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD947DF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD947E7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD947FD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD948228(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9483B4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CD9486B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD948C78(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9490FC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9491D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9492A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94A318(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94A3D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94A540(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94A828(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94A9C0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94AAE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94AF80(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD94EF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD94F064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_1CD951D94(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_1CD952784(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_1CD95336C(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_1CD953408(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

double __homeRegionNearbyRadius()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferenceForKey:", CFSTR("homeNearbyRegionRadius"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

__CFString *HMDHomeLocationSourceToString(unint64_t a1)
{
  if (a1 < 5)
    return off_1E89BC248[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void __Block_byref_object_copy__161755(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__161756(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

double getLocationUpdateTimeInterval()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _QWORD v14[4];
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[3];
  int v20;
  _QWORD v21[4];

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferenceForKey:", CFSTR("kLocationUpdateIntervalMinutes"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("kLocationUpdateIntervalVarianceMinutes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __getLocationUpdateTimeInterval_block_invoke;
  v14[3] = &unk_1E89BC228;
  v17 = v21;
  v18 = v19;
  v15 = v2;
  v16 = v5;
  v6 = getLocationUpdateTimeInterval_onceToken;
  v7 = v5;
  v8 = v2;
  v9 = v8;
  if (v6 == -1)
  {
    v10 = v8;
    v11 = v7;
  }
  else
  {
    dispatch_once(&getLocationUpdateTimeInterval_onceToken, v14);
    v10 = v15;
    v11 = v16;
  }
  v12 = *(double *)&getLocationUpdateTimeInterval_locationUpdateIntervalWithVariance;

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  return v12;
}

void sub_1CD9547BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

double __getLocationUpdateTimeInterval_block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double result;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    v3 = v2 * 60.0;
  }
  else
  {
    v3 = 86400.0;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = arc4random_uniform(objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue"));
  result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
         + (double)(60 * (unint64_t)*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  *(double *)&getLocationUpdateTimeInterval_locationUpdateIntervalWithVariance = result;
  return result;
}

void sub_1CD954F8C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __HMDHomeAdministratorHandlerRegister(void *a1, void *a2, void *a3, void *a4)
{
  os_unfair_lock_s *v4;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _Unwind_Exception *v26;
  void *v27;
  void *v28;

  v8 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = 0;
  if (v8 && v9 && v10 && v11)
  {
    objc_msgSend(v11, "hmf_objectPassingTest:", &__block_literal_global_164_161979);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v26 = (_Unwind_Exception *)_HMFPreconditionFailure();
      os_unfair_lock_unlock(v4);
      _Unwind_Resume(v26);
    }
    v27 = (void *)v14;
    v28 = v12;
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    v15 = objc_msgSend(v11, "indexOfObjectPassingTest:", &__block_literal_global_167_161981);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v16, 4, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v17);
    }
    else
    {
      v18 = v15;
      objc_msgSend(v13, "objectAtIndex:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v16, "setUserPrivilege:", 4);
      objc_msgSend(v16, "setRequiresRemoteAccess:", 0);
      v17 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v18, v17);
    }

    v20 = v8;
    v21 = v10;
    os_unfair_lock_lock_with_options();
    objc_msgSend(*((id *)v20 + 8), "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(v20, "home");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "isOwnerUser");
      objc_opt_class();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_msgSend(objc_alloc((Class)v24), "initWithReceiver:handler:", v21, v20);
      objc_msgSend(*((id *)v20 + 8), "setObject:forKey:", v22, v21);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v20 + 12);

    objc_msgSend(v22, "registerForMessage:policies:", v9, v13);
    v12 = v28;
  }
  objc_autoreleasePoolPop(v12);

  return v13;
}

void sub_1CD955DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD957230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD95C9E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD9628D4(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD969950(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__163429(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__163430(uint64_t a1)
{

}

void sub_1CD96A664(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD96BDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD96CF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9741B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD974B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1CD974D78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1CD974FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD97524C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9756A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location,char a41)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1CD976B5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)&STACK[0x298]);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CD976E14(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD97705C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CD977144(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD977CE8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD97AA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 144));
  _Unwind_Resume(a1);
}

void sub_1CD97B244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;

  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1CD97B6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD97C320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id location,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1CD97CEA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CD97D88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD97E318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD97E51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD97E7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD97F124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1CD97FFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9806F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1CD98084C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1CD980BB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD980DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD981298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD981768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v34 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CD9819B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD981B70(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD981E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1CD9822E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1CD982C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a58);
  _Unwind_Resume(a1);
}

void sub_1CD982D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD98300C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD983458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1CD983718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD983B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD983CE0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1CD984120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD98421C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD984300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9843BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1CD984498(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD98458C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1CD98489C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD985258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9858C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location)
{
  id *v39;

  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9868D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD986C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD986EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD987214(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD987294(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD98730C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD987384(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9874E0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD98764C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD98845C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD98C1B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 152));
  _Unwind_Resume(a1);
}

void sub_1CD98C324(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD98C3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD98C72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD98CA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1CD98CC0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD98CCD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD98CEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD98D538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD98D674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD990C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD990CF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CD9910B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9969D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD997F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9982B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD999678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD99B3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD99B6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD99E668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,id a36)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(&a35);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sub_1CD99F82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  uint64_t v13;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_1CD99FE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x220]);
  _Unwind_Resume(a1);
}

void sub_1CD9A3930(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD9A3DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1CD9A43F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v10 - 152));
  _Unwind_Resume(a1);
}

void sub_1CD9A6020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9A7E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9A80EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9A859C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_1CD9A98E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,id location)
{
  id *v62;
  uint64_t v63;

  objc_destroyWeak(v62);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v63 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CD9A9D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9AC394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a35);
  _Unwind_Resume(a1);
}

void sub_1CD9AD1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;
  uint64_t v69;

  _Block_object_dispose(&a63, 8);
  _Block_object_dispose((const void *)(v69 - 176), 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_1CD9AD858(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD9ADF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9AE1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9AEDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9B3EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9B4D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9B5E04(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9B6010(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9B86E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;
  uint64_t v23;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)(v23 - 160));
  _Unwind_Resume(a1);
}

void sub_1CD9BA28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9BB190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9BBDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD9BC37C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9BF5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  id *v28;
  uint64_t v29;

  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CD9C04D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C058C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C0670(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C073C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C0814(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C2288(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C4830(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C4D28(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9C5978(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__165094(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__165095(uint64_t a1)
{

}

void sub_1CD9C93C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1CD9CC8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9CDD64(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id __isUserInMessagePartOfHome(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "matchingRemoteIdentityUserForHome:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v5;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Found matching user: %@, for message: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = v8;
  }

  return v8;
}

void sub_1CD9CE760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1CD9CFFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1CD9D07A4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id __pairingIdentityForAccessory(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EFABB088))
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(v3, "pairingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1CD9D48EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D4B88(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D5034(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D5318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1CD9D6CA4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D7470(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D788C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D7F2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D867C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D8E44(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9D94A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9DA2C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9DA6B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9DA7C0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9DAE6C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CD9DCB00(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1CD9DDD10(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1CD9E03C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E07F8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E08E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E0D08(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E15BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E18C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E2390(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t HMDRemoteEventRouterProtoMultiHopFetchEventsResponseReadFrom(void *a1, uint64_t a2)
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
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D32D70]);
        objc_msgSend(a1, "addChangedEvents:", v17);
        if (!PBReaderPlaceMark() || (HMEProtoEventInfoReadFrom() & 1) == 0)
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

void sub_1CD9E7A4C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E8280(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E8430(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E86E8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9E8F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD9E8FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__166946(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__166947(uint64_t a1)
{

}

uint64_t AWDHomeKitCameraSettingsReadFrom(uint64_t a1, uint64_t a2)
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
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t result;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  void *v61;
  BOOL v62;
  uint64_t v63;

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
          *(_BYTE *)(a1 + 28) |= 0x20u;
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
              goto LABEL_72;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_74;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_72:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_74:
          v62 = v19 != 0;
          v63 = 24;
          goto LABEL_99;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          *(_BYTE *)(a1 + 28) |= 8u;
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
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                v14 = v24++ >= 9;
                if (v14)
                {
                  v25 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_78:
          v62 = v25 != 0;
          v63 = 22;
          goto LABEL_99;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
              *(_QWORD *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v31) = 0;
LABEL_82:
          *(_DWORD *)(a1 + 16) = v31;
          continue;
        case 4u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          *(_BYTE *)(a1 + 28) |= 0x40u;
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
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v14 = v36++ >= 9;
                if (v14)
                {
                  v37 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v37 = 0;
LABEL_86:
          v62 = v37 != 0;
          v63 = 25;
          goto LABEL_99;
        case 6u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (2)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
              *(_QWORD *)(a2 + v45) = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v14 = v43++ >= 9;
                if (v14)
                {
                  v44 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v44 = 0;
LABEL_90:
          v62 = v44 != 0;
          v63 = 20;
          goto LABEL_99;
        case 7u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
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
              v50 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                v14 = v49++ >= 9;
                if (v14)
                {
                  v50 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v50 = 0;
LABEL_94:
          v62 = v50 != 0;
          v63 = 21;
          goto LABEL_99;
        case 8u:
          v54 = 0;
          v55 = 0;
          v56 = 0;
          *(_BYTE *)(a1 + 28) |= 0x10u;
          break;
        case 9u:
          PBReaderReadString();
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v60;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v57 = *v3;
        v58 = *(_QWORD *)(a2 + v57);
        if (v58 == -1 || v58 >= *(_QWORD *)(a2 + *v4))
          break;
        v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
        *(_QWORD *)(a2 + v57) = v58 + 1;
        v56 |= (unint64_t)(v59 & 0x7F) << v54;
        if ((v59 & 0x80) == 0)
          goto LABEL_96;
        v54 += 7;
        v14 = v55++ >= 9;
        if (v14)
        {
          v56 = 0;
          goto LABEL_98;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_96:
      if (*(_BYTE *)(a2 + *v5))
        v56 = 0;
LABEL_98:
      v62 = v56 != 0;
      v63 = 23;
LABEL_99:
      *(_BYTE *)(a1 + v63) = v62;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1CD9EB550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9EC828(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CD9ECAD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9ED224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9EDB28(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9EF068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__167458(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__167459(uint64_t a1)
{

}

void sub_1CD9EFBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CD9F8C0C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9F8D28(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9F9028(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD9F9140(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t AWDHomeKitMultiUserSettingsReadFrom(_BYTE *a1, uint64_t a2)
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
  AWDHomeKitMultiUserSettingsValueByKeyPath *v23;
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
        v23 = objc_alloc_init(AWDHomeKitMultiUserSettingsValueByKeyPath);
        objc_msgSend(a1, "addHomeKitMultiUserSettingsValuesByKeyPath:", v23);
        if (!PBReaderPlaceMark()
          || (AWDHomeKitMultiUserSettingsValueByKeyPathReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        a1[20] |= 1u;
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
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_35:
        a1[16] = v19 != 0;
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

void sub_1CD9FDB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __mapProfilesToProfileUUIDs(void *a1)
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
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "uniqueIdentifier", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v2, "copy");
  return v10;
}

id mapProfilesToAccessoryUUIDs(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v30 = v3;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v3, "accessories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(obj);
        v9 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          objc_msgSend(v11, "mediaProfile");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "UUIDString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v4, "containsObject:", v15);

            if (v16)
            {
              objc_msgSend(v11, "uuid");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "UUIDString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v18);

            }
          }

        }
        v19 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        if (v21)
        {
          objc_msgSend(v21, "findServiceWithServiceType:", CFSTR("00000228-0000-1000-8000-0026BB765291"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            +[HMDMediaProfile uniqueIdentifierFromAccessory:](HMDHAPMediaProfile, "uniqueIdentifierFromAccessory:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "UUIDString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v4, "containsObject:", v24);

            if (v25)
            {
              objc_msgSend(v21, "uuid");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v27);

            }
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }

  v28 = (void *)objc_msgSend(v31, "copy");
  return v28;
}

id mapProfilesToServiceUUIDs(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v22 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v22, "count"));
  v20 = v3;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          objc_msgSend(v11, "findServiceWithServiceType:", CFSTR("00000228-0000-1000-8000-0026BB765291"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            +[HMDMediaProfile uniqueIdentifierFromAccessory:](HMDHAPMediaProfile, "uniqueIdentifierFromAccessory:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "UUIDString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v22, "containsObject:", v14);

            if (v15)
            {
              objc_msgSend(v12, "uuid");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "UUIDString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v17);

            }
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(v21, "copy");
  return v18;
}

id __mapUUIDsToProfiles(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v13 = (void *)objc_msgSend(v12, "initWithUUIDString:", v11, (_QWORD)v17);
        objc_msgSend(v3, "mediaProfileWithUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v5, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

void sub_1CDA01D7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA01E04(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA020BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA022BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA02438(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA0252C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA027E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA029B0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA02BC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA02E28(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA02EB0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA02FC4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA04174(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA04230(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA0501C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA0517C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

HMDAccessoryFirmwareUpdateAggregatePolicy *HMDFirmwareUpdatePolicyForAccessory(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  id v32;
  id v33;
  HMDAccessoryFirmwareUpdatePresencePolicy *v34;
  void *v35;
  int v36;
  id v37;
  id v38;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v74;
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  HMDAccessoryFirmwareUpdateCameraPolicy *v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  HMDAccessoryFirmwareUpdateAllowPolicy *v103;
  void *v104;
  char isKindOfClass;
  void *v106;
  id v107;
  id v108;
  id v109;
  HMDAccessoryFirmwareUpdateAggregatePolicy *v110;
  HMDAccessoryFirmwareUpdateAggregatePolicy *v111;
  void *v113;
  id obj;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  id v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  id v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  uint8_t v150[128];
  uint8_t buf[4];
  void *v152;
  __int16 v153;
  void *v154;
  __int128 aBlock;
  uint64_t (*v156)(uint64_t, void *);
  void *v157;
  id v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "addObject:", v5);
  v113 = v5;
  v117 = v6;
  getBridgedAccessoriesForBridge(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  obj = v7;
  v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
  if (v116)
  {
    v115 = *(_QWORD *)v138;
    v120 = a2;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v138 != v115)
        {
          v10 = v9;
          objc_enumerationMutation(obj);
          v9 = v10;
        }
        v119 = v9;
        v11 = *(id *)(*((_QWORD *)&v137 + 1) + 8 * v9);
        v12 = v117;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        v144 = 0u;
        objc_msgSend(v11, "services");
        v121 = (id)objc_claimAutoreleasedReturnValue();
        v126 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
        if (v126)
        {
          v124 = *(_QWORD *)v142;
          v125 = v13;
          v122 = v11;
          v127 = v12;
LABEL_8:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v142 != v124)
            {
              v15 = v14;
              objc_enumerationMutation(v121);
              v14 = v15;
            }
            v128 = v14;
            v16 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v14);
            if (a2 == 1)
              break;
            if (a2)
              goto LABEL_60;
            objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * v14), "serviceType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "category");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "categoryType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "stagingPolicyConfigurationForService:category:", v17, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              objc_msgSend(v16, "serviceType");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "stagingPolicyConfigurationForService:category:", v21, 0);
              v22 = objc_claimAutoreleasedReturnValue();
LABEL_17:
              v20 = (void *)v22;

              if (!v20)
              {
LABEL_60:
                if (objc_msgSend(v16, "isCustom"))
                {
                  v80 = MEMORY[0x1D17BA0A0]();
                  HMFGetOSLogHandle();
                  v81 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "serviceType");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v152 = v82;
                    v153 = 2112;
                    v154 = v83;
                    _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_INFO, "%{public}@Skipping policy creation for the custom service: %@", buf, 0x16u);

                  }
                  v84 = (void *)v80;
                }
                else
                {
                  v85 = v16;
                  if (isIgnoredServiceForAutoApply_token != -1)
                    dispatch_once(&isIgnoredServiceForAutoApply_token, &__block_literal_global_170036);
                  objc_msgSend(v85, "accessory");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "cameraProfiles");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v87, "count"))
                  {

LABEL_76:
                    v96 = (void *)MEMORY[0x1D17BA0A0]();
                    HMFGetOSLogHandle();
                    v97 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "serviceType");
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v152 = v98;
                      v153 = 2112;
                      v154 = v99;
                      _os_log_impl(&dword_1CD062000, v97, OS_LOG_TYPE_DEBUG, "%{public}@Policy configuration not available for service type: %@", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(v96);
                    v100 = (void *)MEMORY[0x1E0C99D20];
                    v101 = v127;
                    v102 = v11;
                    v103 = -[HMDAccessoryFirmwareUpdatePolicy initWithAccessory:workQueue:]([HMDAccessoryFirmwareUpdateAllowPolicy alloc], "initWithAccessory:workQueue:", v102, v101);

                    objc_msgSend(v100, "arrayWithObject:", v103);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();

                    v12 = v127;
                    v94 = v125;
                    goto LABEL_79;
                  }
                  v88 = (void *)isIgnoredServiceForAutoApply_ignoredServices;
                  objc_msgSend(v85, "serviceType");
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v88) = objc_msgSend(v88, "containsObject:", v89);

                  if (!(_DWORD)v88)
                    goto LABEL_76;
                  v90 = MEMORY[0x1D17BA0A0]();
                  HMFGetOSLogHandle();
                  v91 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "serviceType");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v152 = v92;
                    v153 = 2112;
                    v154 = v93;
                    _os_log_impl(&dword_1CD062000, v91, OS_LOG_TYPE_INFO, "%{public}@Skipping policy creation for the accessory firmware update ignored service: %@", buf, 0x16u);

                  }
                  v84 = (void *)v90;
                }
                objc_autoreleasePoolPop(v84);
                v13 = v125;
                goto LABEL_72;
              }
            }
LABEL_18:
            v26 = v20;
            v27 = v11;
            v133 = v127;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = v26;
            objc_msgSend(v26, "criteria");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "anyUserAtHome");

            if ((v29 & 1) != 0
              || (objc_msgSend(v134, "criteria"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  v31 = objc_msgSend(v30, "noUserAtHome"),
                  v30,
                  v31))
            {
              v32 = v133;
              v33 = v27;
              v34 = -[HMDAccessoryFirmwareUpdatePresencePolicy initWithAccessory:presenceNeeded:workQueue:]([HMDAccessoryFirmwareUpdatePresencePolicy alloc], "initWithAccessory:presenceNeeded:workQueue:", v33, v29, v32);

              if (v34)
              {
                objc_msgSend(v129, "addObject:", v34);

              }
            }
            objc_msgSend(v134, "criteria");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "checkForScheduledAutomation");

            if (v36)
            {
              v37 = v133;
              v38 = v27;
              v39 = -[HMDAccessoryFirmwareUpdatePolicy initWithAccessory:workQueue:]([HMDAccessoryFirmwareUpdateTimedAutomationPolicy alloc], "initWithAccessory:workQueue:", v38, v37);

              if (v39)
                objc_msgSend(v129, "addObject:", v39);

            }
            v147 = 0u;
            v148 = 0u;
            v145 = 0u;
            v146 = 0u;
            objc_msgSend(v134, "criteria");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "characteristicConfigurations");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v131 = v41;
            v136 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
            if (v136)
            {
              v135 = *(_QWORD *)v146;
              v132 = v27;
              do
              {
                v42 = 0;
                do
                {
                  if (*(_QWORD *)v146 != v135)
                    objc_enumerationMutation(v131);
                  v43 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v42);
                  objc_msgSend(v43, "format");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "values");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = v44;
                  v47 = v45;
                  if ((objc_msgSend(v46, "isEqualToString:", CFSTR("BOOL")) & 1) != 0
                    || (objc_msgSend(v46, "isEqualToString:", CFSTR("int")) & 1) != 0
                    || objc_msgSend(v46, "isEqualToString:", CFSTR("uint8")))
                  {
                    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
                    *((_QWORD *)&aBlock + 1) = 3221225472;
                    v156 = __characteristicPolicyHandlerForFormat_block_invoke;
                    v157 = &unk_1E89BF8D0;
                    v158 = v47;
                    v48 = _Block_copy(&aBlock);

                  }
                  else
                  {
                    v48 = 0;
                  }

                  if (v48)
                  {
                    objc_msgSend(v134, "type");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "type");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "settlingTime");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = v27;
                    v53 = v49;
                    v54 = v50;
                    v55 = v51;
                    v56 = v48;
                    v57 = v133;
                    if (v55)
                    {
                      v58 = objc_msgSend(v55, "unsignedIntegerValue");
                    }
                    else
                    {
                      v130 = v52;
                      if (valueDebounceDuration_onceToken != -1)
                        dispatch_once(&valueDebounceDuration_onceToken, &__block_literal_global_25_170040);
                      objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "preferenceForKey:", CFSTR("firmwareUpdateCharacteristicValueDebounceDuration"));
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v63, "numberValue");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();

                      v58 = objc_msgSend(v64, "unsignedIntValue");
                      v52 = v130;
                    }
                    v65 = -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy initWithAccessory:serviceType:characteristicType:debounceDuration:policyHandler:workQueue:]([HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy alloc], "initWithAccessory:serviceType:characteristicType:debounceDuration:policyHandler:workQueue:", v52, v53, v54, v58, v56, v57);

                    if (v65)
                      objc_msgSend(v129, "addObject:", v65);

                    v27 = v132;
                  }
                  else
                  {
                    v59 = (void *)MEMORY[0x1D17BA0A0]();
                    HMFGetOSLogHandle();
                    v60 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(aBlock) = 138543362;
                      *(_QWORD *)((char *)&aBlock + 4) = v61;
                      _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristic policy handler", (uint8_t *)&aBlock, 0xCu);

                    }
                    objc_autoreleasePoolPop(v59);
                  }

                  ++v42;
                }
                while (v136 != v42);
                v66 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v145, buf, 16);
                v136 = v66;
              }
              while (v66);
            }

            objc_msgSend(v134, "criteria");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "updateTimeWindow");
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            if (v68)
            {
              objc_msgSend(v134, "criteria");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "updateTimeWindow");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = v133;
              v72 = v70;
              v73 = v27;
              v74 = -[HMDAccessoryFirmwareUpdateTimeWindowPolicy initWithAccessory:timeWindow:workQueue:]([HMDAccessoryFirmwareUpdateTimeWindowPolicy alloc], "initWithAccessory:timeWindow:workQueue:", v73, v72, v71);

              if (v74)
                objc_msgSend(v129, "addObject:", v74);

            }
            objc_msgSend(v27, "cameraProfiles");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "count");

            a2 = v120;
            v11 = v122;
            if (v76)
            {
              v77 = v133;
              v78 = v27;
              v79 = -[HMDAccessoryFirmwareUpdatePolicy initWithAccessory:workQueue:]([HMDAccessoryFirmwareUpdateCameraPolicy alloc], "initWithAccessory:workQueue:", v78, v77);

              if (v79)
                objc_msgSend(v129, "addObject:", v79);

            }
            v13 = v125;
            objc_msgSend(v125, "addObjectsFromArray:", v129);

LABEL_72:
            v12 = v127;
            v14 = v128 + 1;
            if (v128 + 1 == v126)
            {
              v126 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
              if (v126)
                goto LABEL_8;
              goto LABEL_74;
            }
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * v14), "serviceType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "category");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "categoryType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "autoApplyPolicyConfigurationForService:category:", v23, v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            goto LABEL_18;
          objc_msgSend(v16, "serviceType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "autoApplyPolicyConfigurationForService:category:", v21, 0);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
LABEL_74:

        objc_msgSend(v13, "allObjects");
        v94 = v13;
        v95 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_79:

        if (objc_msgSend(v95, "count") == 1)
        {
          objc_msgSend(v95, "firstObject");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v118, "removeAllObjects");
            objc_msgSend(v95, "firstObject");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "addObject:", v106);

            goto LABEL_85;
          }
        }
        objc_msgSend(v118, "addObjectsFromArray:", v95);

        v9 = v119 + 1;
      }
      while (v119 + 1 != v116);
      v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
    }
    while (v116);
  }
LABEL_85:

  objc_msgSend(v118, "allObjects");
  v107 = (id)objc_claimAutoreleasedReturnValue();
  v108 = v113;
  v109 = v117;
  if (objc_msgSend(v107, "count"))
  {
    if (objc_msgSend(v107, "count") == 1)
    {
      objc_msgSend(v107, "firstObject");
      v110 = (HMDAccessoryFirmwareUpdateAggregatePolicy *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v110 = -[HMDAccessoryFirmwareUpdateAggregatePolicy initWithPolicies:accessory:workQueue:]([HMDAccessoryFirmwareUpdateAggregatePolicy alloc], "initWithPolicies:accessory:workQueue:", v107, v108, v109);
    }
    v111 = v110;
  }
  else
  {
    v111 = 0;
  }

  -[HMDAccessoryFirmwareUpdateAggregatePolicy configure](v111, "configure");
  return v111;
}

id getBridgedAccessoriesForBridge(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v22 = a2;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "isPrimary"))
  {
    objc_msgSend(v3, "identifiersForBridgedAccessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(v3, "identifiersForBridgedAccessories");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

      objc_msgSend(v3, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(v8, "accessoryWithUUID:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v15 = v14;
            else
              v15 = 0;
            v16 = v15;
            v17 = v16;
            if (v16)
            {
              objc_msgSend(v16, "bridge");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqual:", v3);

              if (v19)
              {
                objc_msgSend(v23, "addObject:", v17);
                getBridgedAccessoriesForBridge(v17, v22);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObjectsFromArray:", v20);

              }
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);
      }

    }
  }

  return v23;
}

uint64_t __valueDebounceDuration_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B350A0, CFSTR("firmwareUpdateCharacteristicValueDebounceDuration"));
}

uint64_t __characteristicPolicyHandlerForFormat_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
  else
    v6 = 1;

  return v6;
}

void __isIgnoredServiceForAutoApply_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("accessoryFirmwareUpdateAutoApplyIgnoredServices"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "value");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isIgnoredServiceForAutoApply_ignoredServices;
  isIgnoredServiceForAutoApply_ignoredServices = v1;

}

void sub_1CDA081A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDA08704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;
  uint64_t v27;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CDA08B58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA0B594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDA0D70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__170945(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__170946(uint64_t a1)
{

}

void sub_1CDA0E268(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA0EA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__171105(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__171106(uint64_t a1)
{

}

void sub_1CDA0F1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__171167(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__171168(uint64_t a1)
{

}

void sub_1CDA10D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__171493(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__171494(uint64_t a1)
{

}

void sub_1CDA1421C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,id a21)
{
  id *v21;
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1CDA145E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1CDA14B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1CDA19A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1CDA1B160(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA1B448(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA1B74C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA1B9D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA1D390(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __modelIDsFromModelIDStrings(void *a1)
{
  id v1;
  void *v2;
  void *v3;
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
  v3 = (void *)objc_msgSend(v1, "copy", 0);
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
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

id __accessoriesWithModelIDs(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = a1;
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v28, "user");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "home");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v25 = v5;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v26 = v3;
        obj = (id)objc_msgSend(v3, "copy");
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v31;
          v27 = v7;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v31 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v6, "accessoryWithUUID:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                objc_msgSend(v7, "addObject:", v13);
              }
              else
              {
                v14 = (void *)MEMORY[0x1D17BA0A0]();
                v15 = v28;
                HMFGetOSLogHandle();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "UUIDString");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v35 = v17;
                  v36 = 2112;
                  v37 = v18;
                  v38 = 2112;
                  v39 = v6;
                  _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with model ID, %@, in home: %@", buf, 0x20u);

                  v7 = v27;
                }

                objc_autoreleasePoolPop(v14);
              }

            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          }
          while (v9);
        }

        v19 = (void *)objc_msgSend(v7, "copy");
        v5 = v25;
        v3 = v26;
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v28;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v23;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing user", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

void sub_1CDA1D8D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __modelIDStringsFromAccessories(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_msgSend(v1, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "UUIDString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(v2, "copy");
  return v11;
}

void sub_1CDA1E3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA1E838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA20EEC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA212E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA21468(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA214F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA218D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA219C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA21B34(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA21D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CDA22508(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA2345C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getType(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v1 = a1 + 2;
  v2 = a1;
  os_unfair_lock_lock_with_options();
  v3 = *(_QWORD *)&v2[14]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v1);

  return v3;
}

uint64_t __Block_byref_object_copy__172347(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__172348(uint64_t a1)
{

}

id __missingElementsFromLeftNotInRight(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v4;
    v6 = v4;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          __itemFromConstraint(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v13, v16);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v10);
    }

    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = v3;
    v17 = v3;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          __itemFromConstraint(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            objc_msgSend(v5, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v19);
    }

    v4 = v27;
    v3 = v28;
  }

  return v5;
}

id __deepCopiedConstraints(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x1E0C99D20];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithArray:copyItems:", v2, 1);

  return v3;
}

id __itemFromConstraint(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

BOOL __isConstraintValid(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL8 v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  _QWORD *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = objc_msgSend(v6, "type");
  if ((unint64_t)(v7 - 1) < 2)
  {
    objc_msgSend(v6, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v18 = v17 != 0;
    if (v17)
      goto LABEL_43;
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v5;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v45 = a3;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v22;
      v48 = 2112;
      v49 = (id)objc_opt_class();
      v24 = v49;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint value class: %@", buf, 0x16u);

      a3 = v45;
    }

    objc_autoreleasePoolPop(v19);
    if (!a3)
      goto LABEL_43;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (v7 == 3)
  {
    objc_msgSend(v6, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v17 = v27;

    if (v17)
    {
      if (objc_msgSend(v17, "compare:", &unk_1E8B350E8) == 1)
      {
        v18 = 1;
LABEL_43:

        goto LABEL_44;
      }
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v5;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v40;
        v48 = 2112;
        v49 = v17;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Invalid step constraint value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      if (a3)
      {
        v34 = 43;
        goto LABEL_40;
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v5;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v31;
        v48 = 2112;
        v49 = (id)objc_opt_class();
        v33 = v49;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint value class: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      if (a3)
      {
        v34 = 22;
LABEL_40:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v34);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v18 = 0;
LABEL_41:
        *a3 = v25;
        goto LABEL_43;
      }
    }
    v18 = 0;
    goto LABEL_43;
  }
  if (v7 != 4)
    goto LABEL_35;
  v8 = objc_msgSend(v5, "type");
  if (v8 == 5)
  {
    objc_msgSend(v6, "value");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;
    v11 = v36;

    if (!v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = v5;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_47;
      goto LABEL_46;
    }
    goto LABEL_34;
  }
  if (v8 != 4)
  {
LABEL_35:
    v18 = 1;
    goto LABEL_44;
  }
  objc_msgSend(v6, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
LABEL_34:

    goto LABEL_35;
  }
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = v5;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    goto LABEL_47;
LABEL_46:
  HMFGetLogIdentifier();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v47 = v42;
  v48 = 2112;
  v49 = (id)objc_opt_class();
  v44 = v49;
  _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint value class: %@", buf, 0x16u);

LABEL_47:
  objc_autoreleasePoolPop(v12);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
    v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_44:

  return v18;
}

void sub_1CDA2506C(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CDA26038(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CDA260D4(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CDA268A0(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CDA26B60(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CDA27DC0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA28BCC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA28E84(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA29B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *a17, id *location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,id a36)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a17);
  objc_destroyWeak(&a35);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sub_1CDA2A144(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA2AE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA2F4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDA30424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__173785(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__173786(uint64_t a1)
{

}

void sub_1CDA30DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDA329DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA33DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA35D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMDEventTriggerExecutionStateAsString(unint64_t a1)
{
  if (a1 < 7)
    return off_1E89BF510[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDEventTriggerExecutionState %tu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CDA39968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA3F070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA40068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA40480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA4304C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDA4B648(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CDA509B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA53DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMDIsEmptyHome(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "rooms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v1, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(v1, "sharedUsers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        v3 = 0;
      }
      else
      {
        objc_msgSend(v1, "outgoingInvitations");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "count") == 0;

      }
    }

  }
  return v3;
}

uint64_t identifierForTargetWithUUID(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  do
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(a2, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v4, "hash");
  }
  while (!(_DWORD)v9);

  return v9;
}

uint64_t mapTargetCategory(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "categoryForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedShortValue");

  return v6;
}

id buttonConfigurationAsString(void *a1)
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
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendFormat:", CFSTR("%@, "), v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

void sub_1CDA5D894(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void logRemoteMessageEvent(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a1;
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kRemoteMessageAttributedMessageNameKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v22, "hmf_stringForKey:", CFSTR("kIDSMessageNameKey"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v22, "hmf_UUIDForKey:", CFSTR("kIDSMessageIdentifierKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kRemoteMessagePeerInformationKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("Unknown");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kRemoteMessageTransportAttributionKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kRemoteMessageQoSKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v17;
  +[HMDRemoteMessageLogEvent receivedRemoteMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:messageQoS:](HMDRemoteMessageLogEvent, "receivedRemoteMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:messageQoS:", v10, v11, v5, 0, v15, 1, v21, objc_msgSend(v18, "integerValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "submitLogEvent:", v20);
}

id augmentResponseOptions(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    v5 = a2;
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("kRemoteMessageAttributedMessageNameKey"));

    v7 = (id)objc_msgSend(v6, "copy");
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

uint64_t _pairingFindPeer(uint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _OWORD *v12;
  uint64_t v13;
  __int128 v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__176941;
  v23 = __Block_byref_object_dispose__176942;
  v24 = 0;
  if (v7[24])
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
    if (v8)
    {
      v9 = v7[30];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___pairingFindPeer_block_invoke;
      block[3] = &unk_1E89C25A0;
      v18 = &v19;
      block[4] = v7;
      v10 = v8;
      v17 = v10;
      dispatch_sync(v9, block);

      v11 = (void *)v20[5];
      if (v11)
      {
        if (objc_msgSend(v11, "length") == 32)
        {
          v12 = (_OWORD *)objc_msgSend(objc_retainAutorelease((id)v20[5]), "bytes");
          v13 = 0;
          v14 = v12[1];
          *a3 = *v12;
          a3[1] = v14;
        }
        else
        {
          v13 = 4294960553;
        }
      }
      else
      {
        v13 = 4294960569;
      }
    }
    else
    {
      v10 = 0;
      v13 = 4294960579;
    }
  }
  else
  {
    v10 = 0;
    v13 = 4294960534;
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

void sub_1CDA5EEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _pairingCopyIdentity(uint64_t a1, char **a2, _OWORD *a3, _OWORD *a4, void *a5)
{
  NSObject **v8;
  NSObject **v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  uint64_t v24;
  __int128 v25;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a5;
  v9 = v8;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__176941;
  v32 = __Block_byref_object_dispose__176942;
  v33 = 0;
  if (!v8[23])
  {
    v24 = 4294960534;
    goto LABEL_17;
  }
  v10 = v8[30];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = ___pairingCopyIdentity_block_invoke;
  v27[3] = &unk_1E89C0800;
  v27[4] = v9;
  v27[5] = &v28;
  dispatch_sync(v10, v27);
  v11 = (void *)v29[5];
  if (!v11)
  {
    v24 = 4294960569;
    goto LABEL_17;
  }
  if (a2)
  {
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4);

    if (!v13)
    {
      v24 = 4294960553;
      goto LABEL_17;
    }
    v14 = v13 + 1;
    v15 = (char *)malloc_type_calloc(v13 + 1, 1uLL, 0x100004077774924uLL);
    if (!v15)
    {
      v24 = 4294960568;
      goto LABEL_17;
    }
    objc_msgSend((id)v29[5], "identifier");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    strlcpy(v15, (const char *)objc_msgSend(v16, "UTF8String"), v14);

    *a2 = v15;
  }
  if (a3)
  {
    objc_msgSend((id)v29[5], "publicKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "data");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_18:
      v24 = 4294960569;
      goto LABEL_15;
    }
    if (objc_msgSend(v18, "length") != 32)
    {
LABEL_19:
      v24 = 4294960553;
      goto LABEL_15;
    }
    v19 = objc_retainAutorelease(v18);
    v20 = (_OWORD *)objc_msgSend(v19, "bytes");
    v21 = v20[1];
    *a3 = *v20;
    a3[1] = v21;

  }
  if (!a4)
  {
    v24 = 0;
    goto LABEL_17;
  }
  objc_msgSend((id)v29[5], "privateKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "data");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_18;
  if (objc_msgSend(v18, "length") != 32)
    goto LABEL_19;
  v18 = objc_retainAutorelease(v18);
  v23 = (_OWORD *)objc_msgSend(v18, "bytes");
  v24 = 0;
  v25 = v23[1];
  *a4 = *v23;
  a4[1] = v25;
LABEL_15:

LABEL_17:
  _Block_object_dispose(&v28, 8);

  return v24;
}

void sub_1CDA5F120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__176941(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__176942(uint64_t a1)
{

}

void ___pairingCopyIdentity_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
  v11 = 0;
  (*(void (**)(void))(v2 + 16))();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get local pairing identity with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void ___pairingFindPeer_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  v12 = 0;
  (*(void (**)(void))(v2 + 16))();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Find peer %@ failed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void sub_1CDA60A84(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA6149C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1CDA62E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  __HMFActivityScopeLeave();
  objc_destroyWeak((id *)(v18 - 112));
  _Unwind_Resume(a1);
}

void sub_1CDA62FAC(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CDA65EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__177443(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__177444(uint64_t a1)
{

}

void sub_1CDA66904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA67ED0(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CDA68474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__177624(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__177625(uint64_t a1)
{

}

void sub_1CDA69538(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA6986C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA6993C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA69AEC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA69C40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA69CD0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA69F5C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA6A0C0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA6A888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1CDA6A9FC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA6AD60(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA6BD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CDA6C218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA6F9D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA75B3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA75CE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA75F28(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA760E0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA77794(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL AWDHomeKitCameraStreamReconfigureReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

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
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___AWDHomeKitCameraStreamReconfigure__reconfigurationTimestamp;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            v24 = &OBJC_IVAR___AWDHomeKitCameraStreamReconfigure__reconfigurationTimestamp;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___AWDHomeKitCameraStreamReconfigure__reconfigurationTimestamp;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 16) |= 2u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___AWDHomeKitCameraStreamReconfigure__resolution;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___AWDHomeKitCameraStreamReconfigure__resolution;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___AWDHomeKitCameraStreamReconfigure__resolution;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *HMDCameraRecordingAudioCodecTypeAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HMDCameraRecordingAudioCodecTypeAACLC");
  if (a1 == 1)
  {
    v1 = CFSTR("HMDCameraRecordingAudioCodecTypeAACELD");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDCameraRecordingAudioCodecType %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HMDCameraRecordingAudioBitRateModeTypeAsString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("HMDCameraRecordingAudioBitRateModeTypeVariable");
  if (a1 == 1)
  {
    v1 = CFSTR("HMDCameraRecordingAudioBitRateModeTypeConstant");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDCameraRecordingAudioBitRateModeType %ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HMDCameraRecordingAudioSampleRateTypeAsString(unint64_t a1)
{
  if (a1 < 6)
    return off_1E89C1228[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDCameraRecordingAudioSampleRateType %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CDA7D33C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA7D6C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA80AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id accessoryRequestMapFromRequests(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v45;
  id v46;
  uint64_t v47;
  id v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v48 = a2;
  v46 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v51;
    *(_QWORD *)&v8 = 138543618;
    v45 = v8;
    do
    {
      v11 = 0;
      v47 = v9;
      do
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v11);
        objc_msgSend(v12, "accessory", v45);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_12;
          v15 = v10;
          v16 = v6;
          objc_msgSend(v12, "characteristic");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "type");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "service");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[HMDHAPMetadata isOwnerPrivilegeRequiredForWritingCharacteristicType:serviceType:](HMDHAPMetadata, "isOwnerPrivilegeRequiredForWritingCharacteristicType:serviceType:", v18, v20);

          if (v21 && (objc_msgSend(v46, "isOwner") & 1) == 0)
          {
            v33 = (void *)MEMORY[0x1D17BA0A0]();
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            v6 = v16;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v45;
              v55 = v35;
              v56 = 2112;
              v57 = v12;
              _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Aborting characteristic write request that requires owner privilege: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v33);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", v12, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "addObject:", v37);
            v10 = v15;
            v9 = v47;
          }
          else
          {
            objc_msgSend(v12, "characteristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "service");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "type");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = +[HMDHAPMetadata isAdminPrivilegeRequiredForWritingCharacteristicType:serviceType:](HMDHAPMetadata, "isAdminPrivilegeRequiredForWritingCharacteristicType:serviceType:", v23, v25);

            v6 = v16;
            v10 = v15;
            v9 = v47;
            if (!v26 || (objc_msgSend(v46, "isAdministrator") & 1) != 0)
            {
LABEL_12:
              if ((objc_msgSend(v14, "isPrimary") & 1) == 0)
              {
                objc_msgSend(v14, "bridge");
                v27 = objc_claimAutoreleasedReturnValue();

                v14 = (void *)v27;
              }
              objc_msgSend(v6, "objectForKey:", v14);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v28)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setObject:forKey:", v28, v14);
              }
              objc_msgSend(v28, "addObject:", v12);

              goto LABEL_20;
            }
            v38 = (void *)MEMORY[0x1D17BA0A0]();
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v45;
              v55 = v40;
              v56 = 2112;
              v57 = v12;
              _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Aborting characteristic write request that requires admin privilege: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v38);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", v12, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "addObject:", v42);
          }
        }
        else
        {
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v45;
            v55 = v31;
            v56 = 2112;
            v57 = v12;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Aborting characteristic request: %@, accessory is nil", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", v12, v32);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "addObject:", v14);
        }
LABEL_20:

        ++v11;
      }
      while (v9 != v11);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v9 = v43;
    }
    while (v43);
  }

  return v6;
}

void sub_1CDA832D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA850E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1CDA8587C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA86150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __writeRequestsFromRequests_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void sub_1CDA86FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_1CDA871C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void migrateRequestsPassingTest(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a1;
  v5 = a2;
  v6 = a3;
  if (v11 == v5)
  {
    v10 = _HMFPreconditionFailure();
    __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_367(v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __migrateRequestsPassingTest_block_invoke;
    v12[3] = &unk_1E89C1980;
    v13 = v6;
    v7 = v6;
    objc_msgSend(v11, "indexesOfObjectsPassingTest:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectsAtIndexes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

    objc_msgSend(v11, "removeObjectsAtIndexes:", v8);
  }
}

uint64_t __migrateRequestsPassingTest_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1CDA88414(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA8847C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDA887E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CDA8AC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA8B144(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMDHTTPClientMessageTransportReset(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "isRunning"))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = v1;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(v3, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelPendingRequests");

    objc_msgSend(v3, "_receiveMessage");
    objc_msgSend(v3, "netService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confirmWithTimeout:completionHandler:", &__block_literal_global_192_180765, 0.0);

  }
}

void sub_1CDA8CD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA8EC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDA8EFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HMDRemoteMessagePayloadKeysForTransportMetadata()
{
  if (HMDRemoteMessagePayloadKeysForTransportMetadata_onceToken != -1)
    dispatch_once(&HMDRemoteMessagePayloadKeysForTransportMetadata_onceToken, &__block_literal_global_181565);
  return (id)HMDRemoteMessagePayloadKeysForTransportMetadata_keys;
}

void sub_1CDA9D070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CDAA5C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1CDAA6434(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CDAA67A0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__184098(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__184099(uint64_t a1)
{

}

void __updateLoggedInAccount(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = v5;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v11;
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Posting transaction to update logged in account to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transactionWithObjectChangeType:", 2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    encodeRootObject();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLoggedInAccount:", v16);

    objc_msgSend(v12, "home");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "backingStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v19 = v13;
    v20 = v15;
    v21 = v9;
    v22 = v12;
    v23 = v7;
    v24 = v6;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transaction:options:", v18, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v24;
    v7 = v23;
    v12 = v22;
    v9 = v21;
    v15 = v20;
    v13 = v19;

    objc_msgSend(v26, "add:withMessage:", v15, v7);
    objc_msgSend(v26, "run");

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v9;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain apple media accessory model type to update logged in account.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
  }

}

__CFString *HMDMediaDestinationManagerFailureCodeAsString(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if ((unint64_t)(a1 - 1) >= 3)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("failureCode(%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E89C23B0[a1 - 1];
  }
  return v1;
}

uint64_t __Block_byref_object_copy__184801(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__184802(uint64_t a1)
{

}

void sub_1CDAAE2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id location;
  id *v68;

  objc_destroyWeak(v68);
  objc_destroyWeak(&location);
  _Block_object_dispose(&STACK[0x340], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__185019(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__185020(uint64_t a1)
{

}

void sub_1CDAB00DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void sub_1CDAB08A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, id a15)
{
  id *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a15);
  _Unwind_Resume(a1);
}

uint64_t sub_1CDAB81D8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CDAB81E4()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1CDAB81F0()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CDAB81FC()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1CDAB8208()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1CDAB8214()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1CDAB8220()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1CDAB822C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CDAB8238()
{
  return MEMORY[0x1E0D27CD0]();
}

uint64_t sub_1CDAB8244()
{
  return MEMORY[0x1E0D27CD8]();
}

uint64_t sub_1CDAB8250()
{
  return MEMORY[0x1E0D27CE0]();
}

uint64_t sub_1CDAB825C()
{
  return MEMORY[0x1E0D27CE8]();
}

uint64_t sub_1CDAB8268()
{
  return MEMORY[0x1E0D27CF0]();
}

uint64_t sub_1CDAB8274()
{
  return MEMORY[0x1E0D27CF8]();
}

uint64_t sub_1CDAB8280()
{
  return MEMORY[0x1E0D27D00]();
}

uint64_t sub_1CDAB828C()
{
  return MEMORY[0x1E0D27D08]();
}

uint64_t sub_1CDAB8298()
{
  return MEMORY[0x1E0D27D18]();
}

uint64_t sub_1CDAB82A4()
{
  return MEMORY[0x1E0D27D20]();
}

uint64_t sub_1CDAB82B0()
{
  return MEMORY[0x1E0D27D28]();
}

uint64_t sub_1CDAB82BC()
{
  return MEMORY[0x1E0D27D30]();
}

uint64_t sub_1CDAB82C8()
{
  return MEMORY[0x1E0D27D40]();
}

uint64_t sub_1CDAB82D4()
{
  return MEMORY[0x1E0D27D48]();
}

uint64_t sub_1CDAB82E0()
{
  return MEMORY[0x1E0D27D50]();
}

uint64_t sub_1CDAB82EC()
{
  return MEMORY[0x1E0D27D58]();
}

uint64_t sub_1CDAB82F8()
{
  return MEMORY[0x1E0D27D68]();
}

uint64_t sub_1CDAB8304()
{
  return MEMORY[0x1E0D27D70]();
}

uint64_t sub_1CDAB8310()
{
  return MEMORY[0x1E0D27D78]();
}

uint64_t sub_1CDAB831C()
{
  return MEMORY[0x1E0D27D80]();
}

uint64_t sub_1CDAB8328()
{
  return MEMORY[0x1E0D27D88]();
}

uint64_t sub_1CDAB8334()
{
  return MEMORY[0x1E0D27D90]();
}

uint64_t sub_1CDAB8340()
{
  return MEMORY[0x1E0D27D98]();
}

uint64_t sub_1CDAB834C()
{
  return MEMORY[0x1E0D27DA0]();
}

uint64_t sub_1CDAB8358()
{
  return MEMORY[0x1E0D27DA8]();
}

uint64_t sub_1CDAB8364()
{
  return MEMORY[0x1E0D27DB0]();
}

uint64_t sub_1CDAB8370()
{
  return MEMORY[0x1E0D27DB8]();
}

uint64_t sub_1CDAB837C()
{
  return MEMORY[0x1E0D27DC8]();
}

uint64_t sub_1CDAB8388()
{
  return MEMORY[0x1E0D27DE8]();
}

uint64_t sub_1CDAB8394()
{
  return MEMORY[0x1E0D333C0]();
}

uint64_t sub_1CDAB83A0()
{
  return MEMORY[0x1E0D333C8]();
}

uint64_t sub_1CDAB83AC()
{
  return MEMORY[0x1E0D333D0]();
}

uint64_t sub_1CDAB83B8()
{
  return MEMORY[0x1E0D333D8]();
}

uint64_t sub_1CDAB83C4()
{
  return MEMORY[0x1E0D333E0]();
}

uint64_t sub_1CDAB83D0()
{
  return MEMORY[0x1E0D333E8]();
}

uint64_t sub_1CDAB83DC()
{
  return MEMORY[0x1E0D333F0]();
}

uint64_t sub_1CDAB83E8()
{
  return MEMORY[0x1E0D33400]();
}

uint64_t sub_1CDAB83F4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CDAB8400()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1CDAB840C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CDAB8418()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CDAB8424()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CDAB8430()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CDAB843C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1CDAB8448()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1CDAB8454()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1CDAB8460()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1CDAB846C()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1CDAB8478()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CDAB8484()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CDAB8490()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1CDAB849C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CDAB84A8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CDAB84B4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1CDAB84C0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CDAB84CC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1CDAB84D8()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CDAB84E4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CDAB84F0()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CDAB84FC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CDAB8508()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CDAB8514()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1CDAB8520()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CDAB852C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CDAB8538()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CDAB8544()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CDAB8550()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CDAB855C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1CDAB8568()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CDAB8574()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1CDAB8580()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t sub_1CDAB858C()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1CDAB8598()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CDAB85A4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CDAB85B0()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1CDAB85BC()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1CDAB85C8()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1CDAB85D4()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1CDAB85E0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CDAB85EC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CDAB85F8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CDAB8604()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CDAB8610()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1CDAB861C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CDAB8628()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CDAB8634()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CDAB8640()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CDAB864C()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1CDAB8658()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1CDAB8664()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CDAB8670()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CDAB867C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1CDAB8688()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CDAB8694()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CDAB86A0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CDAB86AC()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CDAB86B8()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1CDAB86C4()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1CDAB86D0()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1CDAB86DC()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1CDAB86E8()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1CDAB86F4()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1CDAB8700()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1CDAB870C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1CDAB8718()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1CDAB8724()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1CDAB8730()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CDAB873C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CDAB8748()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CDAB8754()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_1CDAB8760()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CDAB876C()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1CDAB8778()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CDAB8784()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CDAB8790()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CDAB879C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CDAB87A8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CDAB87B4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CDAB87C0()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1CDAB87CC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CDAB87D8()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1CDAB87E4()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1CDAB87F0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CDAB87FC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CDAB8808()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CDAB8814()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AFPreferencesMultiUserCompanionNotificationLanguageCodesForHomePodVersion()
{
  return MEMORY[0x1E0CFE5D0]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1E0D034C0]();
}

uint64_t CARenderServerGetServerPort()
{
  return MEMORY[0x1E0CD2590]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
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

uint64_t CFArrayApplyBlock()
{
  return MEMORY[0x1E0D1A8E0]();
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

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

uint64_t CFDictionaryApplyBlock()
{
  return MEMORY[0x1E0D1A910]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1E0C98990](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x1E0D1AA40]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x1E0D1AA50]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1E0D1AA60]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x1E0C995E0](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

uint64_t CKContainerEnvironmentFromString()
{
  return MEMORY[0x1E0C946E8]();
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1E0C946F0]();
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3D8](retstr, range, otherRange);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

uint64_t DMGetUserDataDisposition()
{
  return MEMORY[0x1E0D1CF98]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x1E0D1AD88]();
}

uint64_t GetPrimaryIPAddress()
{
  return MEMORY[0x1E0D1AE40]();
}

uint64_t HAPAccessCodeResponseStatusAsString()
{
  return MEMORY[0x1E0D15E48]();
}

uint64_t HAPAccessoryServerDiscoveryMethodToString()
{
  return MEMORY[0x1E0D15E78]();
}

uint64_t HAPAccessoryServerSessionTypesFromString()
{
  return MEMORY[0x1E0D15E80]();
}

uint64_t HAPAccessorySuspendedStateDescription()
{
  return MEMORY[0x1E0D15E88]();
}

uint64_t HAPAuthMethodToString()
{
  return MEMORY[0x1E0D15EB0]();
}

uint64_t HAPCommunicationProtocolDescription()
{
  return MEMORY[0x1E0D16088]();
}

uint64_t HAPCompareStateNumberWithRollover()
{
  return MEMORY[0x1E0D16090]();
}

uint64_t HAPDataStreamTransportCommandStatusAsString()
{
  return MEMORY[0x1E0D16098]();
}

uint64_t HAPDateWithTimeIntervalSince1970()
{
  return MEMORY[0x1E0D160A0]();
}

uint64_t HAPDispatchQueueName()
{
  return MEMORY[0x1E0D160A8]();
}

uint64_t HAPFirmwareUpdateStateAsString()
{
  return MEMORY[0x1E0D160B8]();
}

uint64_t HAPIsHH2Enabled()
{
  return MEMORY[0x1E0D160C0]();
}

uint64_t HAPLinkLayerTypeDescription()
{
  return MEMORY[0x1E0D160C8]();
}

uint64_t HAPLinkTypeDescription()
{
  return MEMORY[0x1E0D160D0]();
}

uint64_t HAPOTAProviderStateAsString()
{
  return MEMORY[0x1E0D16168]();
}

uint64_t HAPOperatingStateAbnormalReasonsAsString()
{
  return MEMORY[0x1E0D16170]();
}

uint64_t HAPOperatingStateAsString()
{
  return MEMORY[0x1E0D16178]();
}

uint64_t HAPShortUUIDType()
{
  return MEMORY[0x1E0D162B8]();
}

uint64_t HAPStagingNotReadyReasonsAsString()
{
  return MEMORY[0x1E0D162C0]();
}

uint64_t HAPStringFromAccessoryServerSession()
{
  return MEMORY[0x1E0D162C8]();
}

uint64_t HAPTLVCreateParseArrayToString()
{
  return MEMORY[0x1E0D162D8]();
}

uint64_t HAPTLVParseContiguousTlvs()
{
  return MEMORY[0x1E0D162E0]();
}

uint64_t HAPTLVParseUInt64()
{
  return MEMORY[0x1E0D162E8]();
}

uint64_t HAPTLVWriteUInt64()
{
  return MEMORY[0x1E0D162F0]();
}

uint64_t HAPUpdateNotReadyReasonsAsString()
{
  return MEMORY[0x1E0D16328]();
}

uint64_t HAPUserPermissionTypeDescription()
{
  return MEMORY[0x1E0D16330]();
}

uint64_t HAPValidateSetupHash()
{
  return MEMORY[0x1E0D16338]();
}

uint64_t HMAccessoryCertificationStatusToString()
{
  return MEMORY[0x1E0CB7B18]();
}

uint64_t HMAccessoryNetworkProtectionModeAsString()
{
  return MEMORY[0x1E0CB7D50]();
}

uint64_t HMAccessorySettingConstraintTypeFromString()
{
  return MEMORY[0x1E0CB7E48]();
}

uint64_t HMAccessorySettingPropertiesFromString()
{
  return MEMORY[0x1E0CB7E90]();
}

uint64_t HMAccessorySettingPropertiesToString()
{
  return MEMORY[0x1E0CB7E98]();
}

uint64_t HMAccessorySettingTypeFromString()
{
  return MEMORY[0x1E0CB7EC0]();
}

uint64_t HMAccessorySettingTypeToString()
{
  return MEMORY[0x1E0CB7EC8]();
}

uint64_t HMAccessoryTransportTypesToString()
{
  return MEMORY[0x1E0CB8140]();
}

uint64_t HMAccessoryWiFiCredentialTypeAsString()
{
  return MEMORY[0x1E0CB81A0]();
}

uint64_t HMActionTypeAsString()
{
  return MEMORY[0x1E0CB8248]();
}

uint64_t HMAreSnapshotsAllowedForCameraAccessMode()
{
  return MEMORY[0x1E0CB82C8]();
}

uint64_t HMAssistantAccessControlOptionsToString()
{
  return MEMORY[0x1E0CB82F0]();
}

uint64_t HMCLAuthorizationStatusAsString()
{
  return MEMORY[0x1E0CB83D8]();
}

uint64_t HMCLRegionStateAsString()
{
  return MEMORY[0x1E0CB83E0]();
}

uint64_t HMCacheSubdirectoryWithRelativePath()
{
  return MEMORY[0x1E0CB83E8]();
}

uint64_t HMCameraAccessModeAsString()
{
  return MEMORY[0x1E0CB83F0]();
}

uint64_t HMCameraAudioStreamSettingAsString()
{
  return MEMORY[0x1E0CB83F8]();
}

uint64_t HMCameraSignificantEventTypesAsString()
{
  return MEMORY[0x1E0CB8600]();
}

uint64_t HMCameraSignificantEventTypesFromReasons()
{
  return MEMORY[0x1E0CB8608]();
}

uint64_t HMCameraSupportedFeaturesAsString()
{
  return MEMORY[0x1E0CB8670]();
}

uint64_t HMCreateHomeKitCacheDirectory()
{
  return MEMORY[0x1E0CB8B78]();
}

uint64_t HMDLocationAuthorizationAsString()
{
  return MEMORY[0x1E0CB8B80]();
}

uint64_t HMDRegionStateString()
{
  return MEMORY[0x1E0CB8B88]();
}

uint64_t HMDTaggedLoggingCreateDictionary()
{
  return MEMORY[0x1E0D33408]();
}

uint64_t HMDailyRotatedUUID()
{
  return MEMORY[0x1E0CB8B98]();
}

uint64_t HMDaysOfTheWeekToDateComponents()
{
  return MEMORY[0x1E0CB8BA8]();
}

uint64_t HMDispatchQueueNameString()
{
  return MEMORY[0x1E0CB8C40]();
}

uint64_t HMDurationsApproximatelyEqual()
{
  return MEMORY[0x1E0CB8C68]();
}

uint64_t HMEProtoEventInfoReadFrom()
{
  return MEMORY[0x1E0D32D18]();
}

uint64_t HMErrorFromOSStatus()
{
  return MEMORY[0x1E0D16340]();
}

uint64_t HMEventTriggerActivationStateAsString()
{
  return MEMORY[0x1E0CB8C78]();
}

uint64_t HMFAreStringsEqualIgnoringCase()
{
  return MEMORY[0x1E0D27DF8]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1E0D27E00]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1E0D27E08]();
}

uint64_t HMFDataIsReversed()
{
  return MEMORY[0x1E0D27E10]();
}

uint64_t HMFDigestAlgorithmToString()
{
  return MEMORY[0x1E0D27E20]();
}

uint64_t HMFDispatchQueueName()
{
  return MEMORY[0x1E0D27E28]();
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

uint64_t HMFOperatingSystemVersionCompare()
{
  return MEMORY[0x1E0D28028]();
}

uint64_t HMFProductClassFromString()
{
  return MEMORY[0x1E0D28068]();
}

uint64_t HMFProductClassToString()
{
  return MEMORY[0x1E0D28070]();
}

uint64_t HMFProductColorToString()
{
  return MEMORY[0x1E0D28078]();
}

uint64_t HMFProductPlatformFromString()
{
  return MEMORY[0x1E0D284D8]();
}

uint64_t HMFProductPlatformToString()
{
  return MEMORY[0x1E0D284E0]();
}

uint64_t HMFQOSClassFromQualityOfService()
{
  return MEMORY[0x1E0D284E8]();
}

uint64_t HMFQualityOfServiceCompare()
{
  return MEMORY[0x1E0D284F0]();
}

uint64_t HMFQualityOfServiceToString()
{
  return MEMORY[0x1E0D284F8]();
}

uint64_t HMFRandomDataWithLength()
{
  return MEMORY[0x1E0D28500]();
}

uint64_t HMFRandomUInt32()
{
  return MEMORY[0x1E0D28508]();
}

uint64_t HMFTimeIntervalDescription()
{
  return MEMORY[0x1E0D28528]();
}

uint64_t HMFUptime()
{
  return MEMORY[0x1E0D28530]();
}

uint64_t HMHomeAddWalletKeyOptionsDescription()
{
  return MEMORY[0x1E0CB8CF8]();
}

uint64_t HMHomeKitCacheDirectory()
{
  return MEMORY[0x1E0CB8E00]();
}

uint64_t HMHomeManagerAreAnyAccessoriesConfigured()
{
  return MEMORY[0x1E0CB8E50]();
}

uint64_t HMHomeManagerAreAnyAppleTVAccessoriesConfigured()
{
  return MEMORY[0x1E0CB8E58]();
}

uint64_t HMHomeManagerAreAnySpeakersConfigured()
{
  return MEMORY[0x1E0CB8E60]();
}

uint64_t HMHomeManagerAreAnyTelevisionAccessoriesConfigured()
{
  return MEMORY[0x1E0CB8E68]();
}

uint64_t HMHomeManagerDataSyncStateToString()
{
  return MEMORY[0x1E0CB8EB0]();
}

uint64_t HMHomeManagerNameValidationOptionsToString()
{
  return MEMORY[0x1E0CB9030]();
}

uint64_t HMHomeManagerOptionsShortDescription()
{
  return MEMORY[0x1E0CB9048]();
}

uint64_t HMHomeManagerOptionsToString()
{
  return MEMORY[0x1E0CB9050]();
}

uint64_t HMHomeWalletKeyColorAsString()
{
  return MEMORY[0x1E0CB9318]();
}

uint64_t HMINControlHomeIntentShortDescription()
{
  return MEMORY[0x1E0CB9390]();
}

uint64_t HMImmutableSettingChangeEventComponentsFromTopic()
{
  return MEMORY[0x1E0CB9398]();
}

uint64_t HMImmutableSettingChangeEventTopicFromComponents()
{
  return MEMORY[0x1E0CB93A0]();
}

uint64_t HMImmutableSettingChangeEventTopicFromComponentsLegacy()
{
  return MEMORY[0x1E0CB93A8]();
}

uint64_t HMImmutableSettingChangeEventTopicFromMediaSystem()
{
  return MEMORY[0x1E0CB93B0]();
}

uint64_t HMIsHAPMetadataNeededForHMHomeManagerOptions()
{
  return MEMORY[0x1E0CB93C8]();
}

uint64_t HMIsMotionDetectionAllowedForCameraAccessMode()
{
  return MEMORY[0x1E0CB93D0]();
}

uint64_t HMIsRecordingAllowedForCameraAccessMode()
{
  return MEMORY[0x1E0CB93D8]();
}

uint64_t HMIsStreamingAllowedForCameraAccessMode()
{
  return MEMORY[0x1E0CB93E0]();
}

uint64_t HMIsValidRegion()
{
  return MEMORY[0x1E0CB93E8]();
}

uint64_t HMIsValidSignificantEvent()
{
  return MEMORY[0x1E0CB93F0]();
}

uint64_t HMMLogTagActivityWithError()
{
  return MEMORY[0x1E0D33430]();
}

uint64_t HMMSafeHomeUUIDFromLogEvent()
{
  return MEMORY[0x1E0D33438]();
}

uint64_t HMMTRUserPrivilegeAsString()
{
  return MEMORY[0x1E0D33260]();
}

uint64_t HMMaxLengthForNaming()
{
  return MEMORY[0x1E0CB9458]();
}

uint64_t HMMediaDestinationControllerSupportOptionsAsString()
{
  return MEMORY[0x1E0CB9468]();
}

uint64_t HMMediaDestinationControllerUpateOptionsAsString()
{
  return MEMORY[0x1E0CB9470]();
}

uint64_t HMMediaDestinationSupportOptionsAsString()
{
  return MEMORY[0x1E0CB94A0]();
}

uint64_t HMMediaDestinationTypeAsString()
{
  return MEMORY[0x1E0CB94B0]();
}

uint64_t HMMediaSystemRoleTypeAsString()
{
  return MEMORY[0x1E0CB95F8]();
}

uint64_t HMNetworkProtectionModeAsString()
{
  return MEMORY[0x1E0CB9660]();
}

uint64_t HMNetworkRouterSupportDisableReasonAsString()
{
  return MEMORY[0x1E0CB9758]();
}

uint64_t HMSettingConstraintTypeToString()
{
  return MEMORY[0x1E0CB9B48]();
}

uint64_t HMSettingVersionValueTypeAsString()
{
  return MEMORY[0x1E0CB9B70]();
}

uint64_t HMSetupAccessoryProgressAsString()
{
  return MEMORY[0x1E0CB9B80]();
}

uint64_t HMSiriEndpointOnboardingResultAsString()
{
  return MEMORY[0x1E0CB9BA0]();
}

uint64_t HMSiriEndpointProfileSessionStateTypeToString()
{
  return MEMORY[0x1E0CB9C28]();
}

uint64_t HMSoftwareUpdateAssetSourceAsString()
{
  return MEMORY[0x1E0CB9C58]();
}

uint64_t HMSoftwareUpdateNeedsAttentionReasonsToString()
{
  return MEMORY[0x1E0CB9D40]();
}

uint64_t HMSoftwareUpdateStateToString()
{
  return MEMORY[0x1E0CB9D78]();
}

uint64_t HMSoftwareUpdateUpdateTypeToString()
{
  return MEMORY[0x1E0CB9D98]();
}

uint64_t HMStringFromCameraClipQuality()
{
  return MEMORY[0x1E0CB9DB8]();
}

uint64_t HMStringFromCameraSignificantEventConfidenceLevel()
{
  return MEMORY[0x1E0CB9DC0]();
}

uint64_t HMStringFromCameraSignificantEventReason()
{
  return MEMORY[0x1E0CB9DC8]();
}

uint64_t HMStringFromHomeLocation()
{
  return MEMORY[0x1E0CB9DD0]();
}

uint64_t HMStringFromIntentRequestType()
{
  return MEMORY[0x1E0CB9DD8]();
}

uint64_t HMUserCameraAccessLevelAsString()
{
  return MEMORY[0x1E0CB9ED8]();
}

uint64_t HMUserDefaultCamerasAccessLevel()
{
  return MEMORY[0x1E0CB9F38]();
}

uint64_t HMUserIsRecordingAllowedWithCameraAccessLevel()
{
  return MEMORY[0x1E0CB9F48]();
}

uint64_t HMUserIsStreamingAllowedWithCameraAccessLevel()
{
  return MEMORY[0x1E0CB9F50]();
}

uint64_t HMUserIsValidCameraAccessLevel()
{
  return MEMORY[0x1E0CB9F58]();
}

uint64_t HMUserPrivilegeToString()
{
  return MEMORY[0x1E0CB9FD8]();
}

uint64_t HMXPCClientEntitlementsShortDescription()
{
  return MEMORY[0x1E0CBA110]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1E0D1AFD8]();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return MEMORY[0x1E0D33DC0]();
}

uint64_t IDSCopyIDForBusinessID()
{
  return MEMORY[0x1E0D33DD8]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D33DF0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return MEMORY[0x1E0D33E18]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1E0D33E20]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x1E0D33E28]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1E0CBB890]();
}

uint64_t IXStringForAppRemovability()
{
  return MEMORY[0x1E0D3AC70]();
}

uint64_t IsAppleTV()
{
  return MEMORY[0x1E0D1B008]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1E0D1B098]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MPCAssistantErrorIsInformational()
{
  return MEMORY[0x1E0D4B2B8]();
}

uint64_t MRAVEndpointCopyLocalizedName()
{
  return MEMORY[0x1E0D4B3D0]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x1E0D4B3E0]();
}

uint64_t MRAVEndpointCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D4B3E8]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x1E0D4B418]();
}

uint64_t MRAVEndpointGetOutputDeviceUIDVolumeControlCapabilities()
{
  return MEMORY[0x1E0D4B438]();
}

uint64_t MRAVEndpointSetOutputDeviceUIDVolume()
{
  return MEMORY[0x1E0D4B4B0]();
}

uint64_t MRAVOutputDeviceCopyModelID()
{
  return MEMORY[0x1E0D4B568]();
}

uint64_t MRAVOutputDeviceCopyName()
{
  return MEMORY[0x1E0D4B578]();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x1E0D4B590]();
}

uint64_t MRAVOutputDeviceGetAVOutputDevice()
{
  return MEMORY[0x1E0D4B5A0]();
}

uint64_t MRAVOutputDeviceGetSubtype()
{
  return MEMORY[0x1E0D4B5B0]();
}

uint64_t MRAVOutputDeviceSupportsBufferedAirPlay()
{
  return MEMORY[0x1E0D4B628]();
}

uint64_t MRAVOutputDeviceSupportsHAP()
{
  return MEMORY[0x1E0D4B638]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x1E0D4B658]();
}

uint64_t MRAVReconnaissanceSessionCancelSearch()
{
  return MEMORY[0x1E0D4B660]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x1E0D4B668]();
}

uint64_t MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback()
{
  return MEMORY[0x1E0D4B680]();
}

uint64_t MRAVRoutingDiscoverySessionCopyAvailableOutputDevices()
{
  return MEMORY[0x1E0D4B688]();
}

uint64_t MRAVRoutingDiscoverySessionCreate()
{
  return MEMORY[0x1E0D4B690]();
}

uint64_t MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback()
{
  return MEMORY[0x1E0D4B698]();
}

uint64_t MRAVRoutingDiscoverySessionSetDiscoveryMode()
{
  return MEMORY[0x1E0D4B6A0]();
}

uint64_t MREExceptionTypeToString()
{
  return MEMORY[0x1E0DE2B08]();
}

uint64_t MRExternalDeviceConnect()
{
  return MEMORY[0x1E0D4BC40]();
}

uint64_t MRExternalDeviceCopyCustomOrigin()
{
  return MEMORY[0x1E0D4BC58]();
}

uint64_t MRExternalDeviceDisconnect()
{
  return MEMORY[0x1E0D4BC70]();
}

uint64_t MRExternalDeviceGetConnectionState()
{
  return MEMORY[0x1E0D4BC78]();
}

uint64_t MRExternalDeviceSetConnectionStateCallback()
{
  return MEMORY[0x1E0D4BC88]();
}

uint64_t MRExternalDeviceSetWantsNowPlayingUpdates()
{
  return MEMORY[0x1E0D4BC90]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x1E0D4BEB8]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1E0D4BEF8]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin()
{
  return MEMORY[0x1E0D4BF20]();
}

uint64_t MRMediaRemoteSendCommandForOriginWithReply()
{
  return MEMORY[0x1E0D4C0B8]();
}

uint64_t MROriginIsLocalOrigin()
{
  return MEMORY[0x1E0D4C218]();
}

uint64_t MTRSetMessageReliabilityParameters()
{
  return MEMORY[0x1E0CC1B00]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x1E0D51970]();
}

uint64_t NEHelperCacheClearUUIDs()
{
  return MEMORY[0x1E0C804F0]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x1E0C804F8]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x1E0C80510]();
}

uint64_t NRWatchOSVersion()
{
  return MEMORY[0x1E0D51818]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2858](table);
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1E0D1B130]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1E0D1B210]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
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

uint64_t OPACKDecodeBytes()
{
  return MEMORY[0x1E0D1B4B8]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1E0D1B4D0]();
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

uint64_t PairingSessionCreate()
{
  return MEMORY[0x1E0D1B510]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x1E0D1B528]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x1E0D1B530]();
}

uint64_t PairingSessionSetLogging()
{
  return MEMORY[0x1E0D1B588]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1E0D1B5F8]();
}

uint64_t ReportMemoryExceptionFromTask()
{
  return MEMORY[0x1E0DE2B10]();
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return (CFArrayRef)MEMORY[0x1E0CE8748](store, pattern);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE8798](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x1E0CE87E0]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x1E0CE8838]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1E0CE8848](interface);
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1E0CE8860](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1E0CE8870](interface);
}

uint64_t SZArchiverCreateStreamableZip()
{
  return MEMORY[0x1E0DAFE70]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x1E0CD6438]();
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6688](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x1E0D1B6B0]();
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1E0DB0F90]();
}

uint64_t TLV8BufferAppend()
{
  return MEMORY[0x1E0D1B728]();
}

uint64_t TLV8BufferAppendUInt64()
{
  return MEMORY[0x1E0D1B730]();
}

uint64_t TLV8BufferFree()
{
  return MEMORY[0x1E0D1B740]();
}

uint64_t TLV8BufferInit()
{
  return MEMORY[0x1E0D1B748]();
}

uint64_t TLV8Get()
{
  return MEMORY[0x1E0D1B750]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x1E0D1B760]();
}

uint64_t TLV8GetOrCopyCoalesced()
{
  return MEMORY[0x1E0D1B768]();
}

uint64_t TLV8GetUInt64()
{
  return MEMORY[0x1E0D1B770]();
}

uint64_t UARPAssetDownloadStatusToString()
{
  return MEMORY[0x1E0D1A668]();
}

uint64_t UARPFirmwareStagingCompletionStatusToString()
{
  return MEMORY[0x1E0D1A670]();
}

uint64_t UARPFirmwareUpdateAvailabilityStatusToString()
{
  return MEMORY[0x1E0D1A678]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1E0D1B7F0]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x1E0D1B808]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x1E0D1B828]();
}

uint64_t WiFiCopyNetworkInfo()
{
  return MEMORY[0x1E0D1B830]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1E0D4FD18]();
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Exit(int a1)
{
  MEMORY[0x1E0C80980](*(_QWORD *)&a1);
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1E0D28700]();
}

uint64_t _HMFPreconditionFailureWithFormat()
{
  return MEMORY[0x1E0D28708]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1E0D1B880]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t CtrXPC::Event::getDataValue(CtrXPC::Event *this)
{
  return MEMORY[0x1E0D1A610](this);
}

uint64_t CtrXPC::Event::getName(CtrXPC::Event *this)
{
  return MEMORY[0x1E0D1A618](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E899A6A0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E899A6A8(__sz);
}

uint64_t __HMFActivityScopeLeave()
{
  return MEMORY[0x1E0D28710]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
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

uint64_t allowedCharValueTypes()
{
  return MEMORY[0x1E0CBA9B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t areAnyHomePodMiniConfigured()
{
  return MEMORY[0x1E0CBA9B8]();
}

uint64_t areAnyHomePodsConfigured()
{
  return MEMORY[0x1E0CBA9C0]();
}

uint64_t areAnyLargeHomePodConfigured()
{
  return MEMORY[0x1E0CBA9C8]();
}

uint64_t areHomesConfigured()
{
  return MEMORY[0x1E0CBA9D0]();
}

uint64_t areIncomingInvitesPresent()
{
  return MEMORY[0x1E0CBA9D8]();
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1E0C81688](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C816F0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cced25519_sign_compat()
{
  return MEMORY[0x1E0D1B898]();
}

uint64_t cced25519_verify_compat()
{
  return MEMORY[0x1E0D1B8A0]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1E0C82090]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

uint64_t chacha20_poly1305_decrypt_all_64x64()
{
  return MEMORY[0x1E0D1B8D0]();
}

uint64_t chacha20_poly1305_decrypt_all_96x32()
{
  return MEMORY[0x1E0D1B8E0]();
}

uint64_t chacha20_poly1305_encrypt_all_64x64()
{
  return MEMORY[0x1E0D1B8F0]();
}

uint64_t chacha20_poly1305_encrypt_all_96x32()
{
  return MEMORY[0x1E0D1B8F8]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1E0C82B70]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1E0DE92C8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
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

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
  MEMORY[0x1E0C82C88](flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD8](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x1E0C82FF0](workloop, frequency);
}

uint64_t dispatch_workloop_set_cpupercent()
{
  return MEMORY[0x1E0C82FF8]();
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t encodeRootObject()
{
  return MEMORY[0x1E0CBA9E0]();
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
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

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x1E0C834D0](a1);
}

uint64_t generateURLForHomeKitObject()
{
  return MEMORY[0x1E0CBA9E8]();
}

uint64_t getAssistantConfigurationSnapshot()
{
  return MEMORY[0x1E0CBA9F0]();
}

uint64_t getAssistantConfigurationVersion()
{
  return MEMORY[0x1E0CBA9F8]();
}

uint64_t getLastSyncedAssistantConfigurationVersion()
{
  return MEMORY[0x1E0CBAA00]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1E0C836C8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t hap2LogInitialize()
{
  return MEMORY[0x1E0D16658]();
}

uint64_t hm_assistantIdentifier()
{
  return MEMORY[0x1E0CBAA08]();
}

uint64_t hm_assistantIdentifierWithSalts()
{
  return MEMORY[0x1E0CBAA10]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
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

uint64_t initializeMappingsAndPaths()
{
  return MEMORY[0x1E0CBAA18]();
}

uint64_t isAllowedCharType()
{
  return MEMORY[0x1E0CBAA20]();
}

uint64_t isEqualAllowingNil()
{
  return MEMORY[0x1E0CBAA28]();
}

uint64_t isFeatureMatteriPhoneOnlyPairingControlEnabled()
{
  return MEMORY[0x1E0D332C0]();
}

uint64_t isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
{
  return MEMORY[0x1E0D332C8]();
}

uint64_t isInternalBuild()
{
  return MEMORY[0x1E0CBAA30]();
}

uint64_t isPresenceAuthorizationValid()
{
  return MEMORY[0x1E0CBAA38]();
}

uint64_t isRestoreSupportedForCharacteristic()
{
  return MEMORY[0x1E0CBAA40]();
}

uint64_t isValidHMSoftwareUpdateAssetSourceString()
{
  return MEMORY[0x1E0CBAA48]();
}

uint64_t localizationKeyForCharacteristicType()
{
  return MEMORY[0x1E0CBACE8]();
}

uint64_t localizedWiFiStringKey()
{
  return MEMORY[0x1E0CBACF0]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
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

uint64_t nw_activity_activate()
{
  return MEMORY[0x1E0CCEDE0]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

uint64_t nw_activity_get_label()
{
  return MEMORY[0x1E0CCEE20]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x1E0CCEE38]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1E0CCEE50]();
}

uint64_t nw_activity_submit_metrics()
{
  return MEMORY[0x1E0CCEE68]();
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF128](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF130](connection, completion);
}

uint64_t nw_connection_reset_traffic_class()
{
  return MEMORY[0x1E0CCF158]();
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x1E0CCF1B8]();
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

uint64_t nw_context_create()
{
  return MEMORY[0x1E0CCF290]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x1E0CCF2C8]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x1E0CCF2D8]();
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x1E0CCF3B8]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF980](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x1E0CCFA90]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1E0CCFA98]();
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x1E0CCFD00]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1E0CCFE88](path, *(_QWORD *)&interface_type);
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
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

void objc_removeAssociatedObjects(id object)
{
  MEMORY[0x1E0DE7E48](object);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
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

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t playbackStateAsString()
{
  return MEMORY[0x1E0CBACF8]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1E0C84C28](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1E0C84C68]();
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1E0C85068](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C852F8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE85B8](a1);
}

const char *__cdecl sqlite3_bind_parameter_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1E0DE85C8](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_zeroblob(sqlite3_stmt *a1, int a2, int n)
{
  return MEMORY[0x1E0DE85F8](a1, *(_QWORD *)&a2, *(_QWORD *)&n);
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

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

sqlite3 *__cdecl sqlite3_db_handle(sqlite3_stmt *a1)
{
  return (sqlite3 *)MEMORY[0x1E0DE8748](a1);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1E0DE87E0](a1);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x1E0DE87F8]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
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

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t stringToHMSoftwareUpdateAssetSource()
{
  return MEMORY[0x1E0CBAD00]();
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t systemResourceUsageLevelAsString()
{
  return MEMORY[0x1E0D31B00]();
}

kern_return_t task_generate_corpse(task_read_t task, mach_port_t *corpse_task_port)
{
  return MEMORY[0x1E0C85818](*(_QWORD *)&task, corpse_task_port);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t usersListApplicable()
{
  return MEMORY[0x1E0CBAD08]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
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

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E50](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1E0C861B8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
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

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86340](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1E0C86748](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

