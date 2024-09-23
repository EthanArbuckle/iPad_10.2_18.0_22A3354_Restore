void sub_212E47210(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  dispatch_time_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  dispatch_time_t MaxTime;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  dispatch_time_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t CoalescingTime;
  const char *v50;
  const char *v51;
  uint64_t v52;
  dispatch_time_t v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  _QWORD v57[6];
  _QWORD block[6];

  objc_msgSend_coalescingDelay(*(void **)(a1 + 32), a2, a3);
  v6 = *(_QWORD *)(a1 + 40);
  if (v7 <= 0.0)
  {
    if (v6)
    {
      objc_msgSend_callbacks(*(void **)(a1 + 32), v4, v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v38 = (void *)objc_opt_new();
        objc_msgSend_setCallbacks_(*(void **)(a1 + 32), v39, (uint64_t)v38);

      }
      objc_msgSend_callbacks(*(void **)(a1 + 32), v36, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
      objc_msgSend_addObject_(v40, v42, (uint64_t)v41);

    }
    objc_msgSend_setPending_(*(void **)(a1 + 32), v4, 1);
    objc_msgSend__invokeIfNotInProgress(*(void **)(a1 + 32), v43, v44);
  }
  else
  {
    if (v6)
    {
      objc_msgSend_callbacks(*(void **)(a1 + 32), v4, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend_setCallbacks_(*(void **)(a1 + 32), v12, (uint64_t)v11);

      }
      objc_msgSend_callbacks(*(void **)(a1 + 32), v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
      objc_msgSend_addObject_(v13, v15, (uint64_t)v14);

    }
    objc_msgSend_setPending_(*(void **)(a1 + 32), v4, 1);
    objc_msgSend_coalescingDelay(*(void **)(a1 + 32), v16, v17);
    if (v20 > 0.0)
    {
      objc_msgSend_maximumDelay(*(void **)(a1 + 32), v18, v19);
      if (v21 > 0.0 && objc_msgSend_nextMaxTime(*(void **)(a1 + 32), v18, v19) == -1)
      {
        objc_msgSend_maximumDelay(*(void **)(a1 + 32), v18, v19);
        v23 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
        objc_msgSend_setNextMaxTime_(*(void **)(a1 + 32), v24, v23);
        MaxTime = objc_msgSend_nextMaxTime(*(void **)(a1 + 32), v25, v26);
        objc_msgSend_sync(*(void **)(a1 + 32), v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_212E56C94;
        block[3] = &unk_24CED9CF8;
        block[4] = *(_QWORD *)(a1 + 32);
        block[5] = v23;
        dispatch_after(MaxTime, v30, block);

      }
    }
    objc_msgSend_coalescingDelay(*(void **)(a1 + 32), v18, v19);
    v33 = *(void **)(a1 + 32);
    if (v34 == 0.0)
    {
      objc_msgSend__invokeIfNotInProgress(v33, v31, v32);
    }
    else
    {
      objc_msgSend_coalescingDelay(v33, v31, v32);
      v46 = dispatch_time(0, (uint64_t)(v45 * 1000000000.0));
      CoalescingTime = objc_msgSend_nextCoalescingTime(*(void **)(a1 + 32), v47, v48);
      objc_msgSend_setNextCoalescingTime_(*(void **)(a1 + 32), v50, v46);
      if (CoalescingTime == -1)
      {
        v53 = objc_msgSend_nextCoalescingTime(*(void **)(a1 + 32), v51, v52);
        objc_msgSend_sync(*(void **)(a1 + 32), v54, v55);
        v56 = objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = sub_212E56CA0;
        v57[3] = &unk_24CED9CF8;
        v57[4] = *(_QWORD *)(a1 + 32);
        v57[5] = v46;
        dispatch_after(v53, v56, v57);

      }
    }
  }
}

void sub_212E476C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E476E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t isManagedAppleID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[10];
  if (!v5)
  {
    objc_msgSend_l_activeStoreAccount(v4, 0, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    isManagedAppleID = objc_msgSend_ams_isManagedAppleID(v6, v8, v9);
    objc_msgSend_numberWithBool_(v7, v11, isManagedAppleID);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 80);
    *(_QWORD *)(v13 + 80) = v12;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
}

void sub_212E47838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E47850(uint64_t a1, const char *a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t isManagedAppleID;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = *(_QWORD **)(a1 + 32);
  if (!v4[9])
    goto LABEL_4;
  if ((objc_msgSend_hasCloudKitEntitlement(v4, a2, a3) & 1) == 0)
  {
    v4 = *(_QWORD **)(a1 + 32);
LABEL_4:
    objc_msgSend_l_primaryAppleAccount(v4, a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD16E0];
    isManagedAppleID = objc_msgSend_aa_isManagedAppleID(v5, v7, v8);
    objc_msgSend_numberWithBool_(v6, v10, isManagedAppleID);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 72);
    *(_QWORD *)(v12 + 72) = v11;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

id sub_212E478D8()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  v0 = (void *)objc_opt_class();
  objc_msgSend_bu_booksGroupContainerURL(v0, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v3, v4, (uint64_t)CFSTR("Documents"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id sub_212E47920(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_books(BUAppGroup, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sub_212E47A94(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_books(BUAppGroup, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userDefaults(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_212E47B24(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend_buVerboseLoggingEnabled(*(void **)(a1 + 32), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_212E47BF4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 25);
  return result;
}

uint64_t sub_212E47DA4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

void sub_212E4813C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_212E4824C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E48264(_QWORD *a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v3 = *(void **)(a1[4] + 104);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], a2, a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x24BDD15C0], v6, v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1[4] + 104);
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v9, a1[7]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v11, (uint64_t)v14, v10);

  }
  objc_msgSend_addObject_(v14, v6, a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend_count(v14, v12, v13);

}

void sub_212E484F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E48508(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_l_primaryAppleAccount(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_212E4870C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E48724(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_l_activeStoreAccount(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_212E48AC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id sub_212E48AF0()
{
  if (qword_253DB2540 != -1)
    dispatch_once(&qword_253DB2540, &unk_24CED9A08);
  return (id)qword_253DB2548;
}

void sub_212E48C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E48C70(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend__registerNotificationForAccountTypeIfNeeded_(*(void **)(a1 + 32), a2, 1);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v4)
  {
    objc_msgSend_bu_sharedAccountStore(MEMORY[0x24BDB4398], 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_localiTunesAccount(v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
}

id sub_212E48DE8(uint64_t a1, const char *a2, void *a3)
{
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend_bu_arrayByRemovingNSNulls(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212E4905C;
  v8[3] = &unk_24CED9F28;
  v8[4] = a1;
  objc_msgSend_bu_arrayByInvokingBlock_(v4, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_212E48E64(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_arrayByRemovingNSNullsInvokingBlockForNulls_, 0);
}

id sub_212E48E6C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v8 = objc_msgSend_count(a1, v6, v7);
  if (v8)
  {
    v11 = v8;
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend_objectAtIndex_(a1, v9, i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v16)
      {
        v18 = MEMORY[0x2199A7288](v4);
        v19 = (void *)v18;
        if (v18)
          (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, i);

      }
      else
      {
        objc_msgSend_addObject_(v5, v17, (uint64_t)v13);
      }

    }
  }
  v20 = (void *)objc_msgSend_copy(v5, v9, v10);

  return v20;
}

id sub_212E48F5C(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(id, void *);
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v8 = objc_msgSend_count(a1, v6, v7);
    if (v8)
    {
      v11 = v8;
      v12 = 0;
      while (1)
      {
        objc_msgSend_objectAtIndex_(a1, v9, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v13);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
          break;
        v16 = (void *)v14;
        objc_msgSend_addObject_(v5, v15, v14);

        if (v11 == ++v12)
          goto LABEL_9;
      }

    }
LABEL_9:
    v18 = objc_msgSend_count(v5, v9, v10);
    if (v18 == objc_msgSend_count(a1, v19, v20))
      v17 = (void *)objc_msgSend_copy(v5, v21, v22);
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id sub_212E4905C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_opt_class();
  BUDynamicCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v3;
  if (v5)
  {
    objc_msgSend_bu_dictionaryByRecursivelyRemovingNSNulls(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = objc_opt_class();
  BUDynamicCast(v10, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend__bu_arrayByRecursivelyRemovingNSNulls_(*(void **)(a1 + 32), v11, (uint64_t)v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }

  return v9;
}

id sub_212E49118(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_mutableCopy(a1, a2, a3);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = a1;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, v36, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v5, v8, v12, (_QWORD)v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        BUDynamicCast(v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_class();
        BUDynamicCast(v16, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v20)
        {
          objc_msgSend_removeObjectForKey_(v4, v21, v12);
          goto LABEL_13;
        }
        if (v15)
        {
          objc_msgSend_bu_dictionaryByRecursivelyRemovingNSNulls(v15, v21, v22);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v17)
            goto LABEL_13;
          v25 = (void *)objc_opt_class();
          objc_msgSend__bu_arrayByRecursivelyRemovingNSNulls_(v25, v26, (uint64_t)v17);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        v27 = (void *)v23;
        objc_msgSend_setObject_forKeyedSubscript_(v4, v24, v23, v12);

LABEL_13:
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v32, v36, 16);
    }
    while (v9);
  }

  v30 = (void *)objc_msgSend_copy(v4, v28, v29);
  return v30;
}

id BUDynamicCast(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id BookUtilityLog()
{
  if (qword_253DB25C0 != -1)
    dispatch_once(&qword_253DB25C0, &unk_24CEDA948);
  return (id)qword_253DB25B8;
}

id BUAssertionLog()
{
  if (qword_253DB24F0 != -1)
    dispatch_once(&qword_253DB24F0, &unk_24CEDA9A8);
  return (id)qword_253DB24E8;
}

id NSStringFromBUAccountsType(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  if (qword_253DB2538 != -1)
    dispatch_once(&qword_253DB2538, &unk_24CEDA9C8);
  v3 = (void *)qword_253DB2530;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], a2, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_212E49444(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _BOOL8 v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _BOOL8 v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  _BOOL8 v21;
  const char *v22;
  id v23;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObserver_(v4, v5, *(_QWORD *)(a1 + 32));

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_effectiveBoolValueForSetting_(v8, v9, *MEMORY[0x24BE63828]) != 2;
  objc_msgSend_setIsBookStoreAllowed_(*(void **)(a1 + 32), v11, v10);

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_effectiveBoolValueForSetting_(v14, v15, *MEMORY[0x24BE63830]) != 2;
  objc_msgSend_setIsExplicitContentAllowed_(*(void **)(a1 + 32), v17, v16);

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v18, v19);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_effectiveBoolValueForSetting_(v23, v20, *MEMORY[0x24BE63770]) != 2;
  objc_msgSend_setIsAccountModificationAllowed_(*(void **)(a1 + 32), v22, v21);

}

uint64_t sub_212E495B8(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(*(_QWORD *)(a1 + 32) + 32), a2, *(_QWORD *)(a1 + 40));
}

uint64_t sub_212E497B8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 26);
  return result;
}

id sub_212E497CC(void *a1)
{
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v2 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (void *)objc_msgSend_initWithString_(v2, v3, (uint64_t)CFSTR("["));
  objc_msgSend_componentsJoinedByString_(a1, v5, (uint64_t)CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v4, v7, (uint64_t)v6);

  objc_msgSend_appendString_(v4, v8, (uint64_t)CFSTR("]"));
  v11 = (void *)objc_msgSend_copy(v4, v9, v10);

  return v11;
}

id sub_212E49908()
{
  if (qword_253DB2500 != -1)
    dispatch_once(&qword_253DB2500, &unk_24CED9F48);
  return (id)qword_253DB24F8;
}

id BUProtocolCast(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;

  v3 = a1;
  v4 = a2;
  v6 = v4;
  if (v4 && objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)v3))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

const __CFString *BUOnboardingBooksBundleID()
{
  return CFSTR("com.apple.onboarding.ibooks");
}

uint64_t BUIsRunningTests()
{
  if (qword_253DB2590 != -1)
    dispatch_once(&qword_253DB2590, &unk_24CEDA7C8);
  return byte_253DB24E0;
}

uint64_t BUIsGDPRAcknowledgementNeededForBooks()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BE08000], sel_acknowledgementNeededForPrivacyIdentifier_, CFSTR("com.apple.onboarding.ibooks"));
}

void *sub_212E49A0C()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_253DB25A0;
  v6 = qword_253DB25A0;
  if (!qword_253DB25A0)
  {
    v1 = (void *)sub_212E4A774();
    v0 = dlsym(v1, "CKAccountChangedNotification");
    v4[3] = (uint64_t)v0;
    qword_253DB25A0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_212E49A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_212E49A9C()
{
  id *v0;
  uint64_t v2;

  v0 = (id *)sub_212E49A0C();
  if (v0)
    return *v0;
  v2 = sub_212E6C4B8();
  return (id)sub_212E49ABC(v2);
}

void sub_212E49ABC(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v4[0] = &unk_24CEE5028;
  v4[1] = &unk_24CEE5040;
  v5[0] = CFSTR("BUAccountsTypeNone");
  v5[1] = CFSTR("BUAccountsTypeITunesStore");
  v4[2] = &unk_24CEE5058;
  v5[2] = CFSTR("BUAccountsTypeICloudAccount");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_253DB2530;
  qword_253DB2530 = v2;

}

void sub_212E49B6C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks", "BookUtility");
  v1 = (void *)qword_253DB25B8;
  qword_253DB25B8 = (uint64_t)v0;

}

void sub_212E49B9C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  id v8;

  objc_msgSend_processInfo(MEMORY[0x24BDD1760], a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environment(v3, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v8, v6, (uint64_t)CFSTR("XCTestConfigurationFilePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  byte_253DB24E0 = v7 != 0;

}

void sub_212E49C0C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks", "BookUtility.Assertion");
  v1 = (void *)qword_253DB24E8;
  qword_253DB24E8 = (uint64_t)v0;

}

uint64_t sub_212E49C3C(uint64_t a1, const char *a2)
{
  return objc_msgSend_setBuVerboseLoggingEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_212E49C48()
{
  const char *v0;
  uint64_t v1;
  void *v2;

  kdebug_trace();
  objc_msgSend_ams_sharedAccountStoreForMediaType_(MEMORY[0x24BDB4398], v0, *MEMORY[0x24BE07CB0]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_253DB2548;
  qword_253DB2548 = v1;

  return kdebug_trace();
}

void sub_212E49CC4(_QWORD *a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1[4] + 104);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], a2, a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend_count(v8, v6, v7);
}

void sub_212E49D40()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0)
    v0 = (void *)_CFCopySystemVersionDictionary();
  v4 = v0;
  objc_msgSend_objectForKeyedSubscript_(v0, v1, *MEMORY[0x24BDBD1F0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_253DB24F8;
  qword_253DB24F8 = v2;

}

void sub_212E49D90(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;

  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_activeStoreAccount(v8, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nq_setupNotifyBlockForAccountType_currentAccountIdentifier_(v8, v7, 1, v6);

}

uint64_t sub_212E49E00(uint64_t a1, const char *a2)
{
  return objc_msgSend__registerNotificationForAccountTypeIfNeeded_(*(void **)(a1 + 32), a2, 1);
}

void sub_212E49E0C(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;

  if (*(_BYTE *)(a1 + 56) || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v1 = (_QWORD *)(a1 + 32);
    *(_BYTE *)(*(_QWORD *)(v1[2] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) == 0;
    ++*(_QWORD *)(*v1 + 16);
    BUAssertionLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      sub_212E6D030((uint64_t)v1, v2);

  }
}

void sub_212E49EA4()
{
  __SecTask *v0;
  __SecTask *v1;
  const char *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  CFErrorRef error;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v3 = (void *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.developer.icloud-services"), &error);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BookUtilityLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_212E6D5FC();

    }
    else
    {
      byte_253DB2510 = objc_msgSend_containsObject_(v3, v2, (uint64_t)CFSTR("CloudKit"));
    }
    CFRelease(v1);

  }
  else
  {
    BookUtilityLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_212E6D5D0();

  }
}

void sub_212E49FA0(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend_bu_mediaURL(MEMORY[0x24BDBCF48], a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v6, v3, (uint64_t)CFSTR("Books"), 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_253DB2560;
  qword_253DB2560 = v4;

}

void sub_212E49FF4()
{
  BUManagedRestrictionsProvider *v0;
  void *v1;

  v0 = objc_alloc_init(BUManagedRestrictionsProvider);
  v1 = (void *)qword_253DB25D0;
  qword_253DB25D0 = (uint64_t)v0;

}

void sub_212E4A01C()
{
  BUAccountsProvider *v0;
  void *v1;

  v0 = objc_alloc_init(BUAccountsProvider);
  v1 = (void *)qword_253DB2558;
  qword_253DB2558 = (uint64_t)v0;

}

void sub_212E4A044()
{
  void *v0;
  const char *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!qword_253DB2570)
  {
    v0 = (void *)CPSharedResourcesDirectory();
    objc_msgSend_stringByAppendingPathComponent_(v0, v1, (uint64_t)CFSTR("Media"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], v2, (uint64_t)v5, 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_253DB2570;
    qword_253DB2570 = v3;

  }
}

void sub_212E4A0C0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  id v8;

  objc_msgSend_processInfo(MEMORY[0x24BDD1760], a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environment(v3, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v8, v6, (uint64_t)CFSTR("XCTestConfigurationFilePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  byte_254B69F90 = v7 != 0;

}

void sub_212E4A130(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_253DB24D0;
  qword_253DB24D0 = (uint64_t)v1;

}

void sub_212E4A154(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  int isEqualToString;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  int v65;
  const char *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  void *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  BUBag *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  id v90;
  _QWORD v91[4];
  id v92;
  uint8_t buf[4];
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  objc_msgSend_offlineCacheProvider(*(void **)(a1 + 32), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOfflineCacheProvider_(*(void **)(a1 + 32), v5, 0);
  if ((objc_msgSend_runFromCache(v4, v6, v7) & 1) != 0)
  {
    if (objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], v8, v9))
    {
      BookUtilityLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        sub_212E6BEC4(v10);

    }
    BookUtilityLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212E45000, v11, OS_LOG_TYPE_INFO, "Using bag values provided by offline cache", buf, 2u);
    }

    v12 = (void *)objc_opt_new();
    objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExpirationDate_(v12, v16, (uint64_t)v15);

    objc_msgSend_setProfile_(v12, v17, (uint64_t)CFSTR("iBooks"));
    objc_msgSend_setProfileVersion_(v12, v18, (uint64_t)CFSTR("1"));
    objc_msgSend_loadCache(v4, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setData_(v12, v22, (uint64_t)v21);

    v90 = 0;
    objc_msgSend_buildWithError_(v12, v23, (uint64_t)&v90);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v90;
    if (v25)
    {
      BookUtilityLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_212E6BE5C((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);

    }
    goto LABEL_26;
  }
  objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v8, v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_executableURL(v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v39, v40, (uint64_t)CFSTR("bookdatastored"));

  if (isEqualToString)
  {
    BookUtilityLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212E45000, v44, OS_LOG_TYPE_DEFAULT, "Fixing the request process info so we actually get results...", buf, 2u);
    }

    objc_msgSend_currentProcess(MEMORY[0x24BE08328], v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend_copy(v47, v48, v49);

    objc_msgSend_setBundleIdentifier_(v50, v51, (uint64_t)CFSTR("com.apple.bookdatastored"));
    objc_msgSend_bundleIdentifier(v50, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExecutableName_(v50, v55, (uint64_t)v54);

  }
  else
  {
    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v42, v43);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_executableURL(v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastPathComponent(v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_isEqualToString_(v63, v64, (uint64_t)CFSTR("booklibraryctl"));

    if (!v65)
    {
      objc_msgSend_bagForProfile_profileVersion_(MEMORY[0x24BE08050], v66, (uint64_t)CFSTR("iBooks"), CFSTR("1"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    BookUtilityLog();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212E45000, v67, OS_LOG_TYPE_DEFAULT, "Fixing the request process info so we actually get results...", buf, 2u);
    }

    objc_msgSend_currentProcess(MEMORY[0x24BE08328], v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend_copy(v70, v71, v72);

    objc_msgSend_setBundleIdentifier_(v50, v73, (uint64_t)CFSTR("com.apple.iBooks"));
    objc_msgSend_setExecutableName_(v50, v74, (uint64_t)CFSTR("com.apple.iBooks"));
  }
  objc_msgSend_bagForProfile_profileVersion_processInfo_(MEMORY[0x24BE08050], v56, (uint64_t)CFSTR("iBooks"), CFSTR("1"), v50);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  BookUtilityLog();
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__defaultValueDictionary(*(void **)(a1 + 32), v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ams_componentsJoinedByString_(v79, v80, (uint64_t)CFSTR(", "));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v94 = v81;
    _os_log_impl(&dword_212E45000, v76, OS_LOG_TYPE_DEFAULT, "Setting up default values: %@", buf, 0xCu);

  }
  objc_msgSend__defaultValueDictionary(*(void **)(a1 + 32), v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = MEMORY[0x24BDAC760];
  v91[1] = 3221225472;
  v91[2] = sub_212E4BD94;
  v91[3] = &unk_24CED9960;
  v24 = v75;
  v92 = v24;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v84, v85, (uint64_t)v91);

  v12 = v92;
LABEL_26:

  v86 = [BUBag alloc];
  v88 = objc_msgSend_initWithBackingBag_(v86, v87, (uint64_t)v24);
  v89 = (void *)qword_253DB2588;
  qword_253DB2588 = v88;

  kdebug_trace();
}

void sub_212E4A674()
{
  BUAppGroup *v0;
  const char *v1;
  uint64_t v2;
  void *v3;

  v0 = [BUAppGroup alloc];
  v2 = objc_msgSend_initWithIdentifier_(v0, v1, (uint64_t)CFSTR("group.com.apple.iBooks"));
  v3 = (void *)qword_253DB2528;
  qword_253DB2528 = v2;

}

uint64_t sub_212E4A6AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_253DB2598;
  v6 = qword_253DB2598;
  if (!qword_253DB2598)
  {
    v7 = xmmword_24CEDA1F8;
    v8 = *(_OWORD *)&off_24CEDA208;
    v1 = _sl_dlopen();
    v4[3] = v1;
    qword_253DB2598 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_212E4A75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E4A774()
{
  uint64_t v0;
  void *v2;

  v0 = sub_212E4A6AC();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_212E4A860(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a1;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v27, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v12, v8, (uint64_t)v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        BUClassAndProtocolCast(v13, v14, 1, v15, v16, v17, v18, v19, (uint64_t)&unk_254B724D8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v12, v21);

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v27, v31, 16);
    }
    while (v9);
  }

  v24 = (void *)objc_msgSend_copy(v5, v22, v23);
  return v24;
}

void sub_212E4B0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212E4B434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212E4B5E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_212E4B5F8()
{
  if (qword_253DB2578 != -1)
    dispatch_once(&qword_253DB2578, &unk_24CEDAE70);
  return (id)qword_253DB2570;
}

id sub_212E4B638()
{
  if (qword_253DB2568 != -1)
    dispatch_once(&qword_253DB2568, &unk_24CEDAE90);
  return (id)qword_253DB2560;
}

uint64_t sub_212E4BD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setDefaultValue_forKey_, a3);
}

void sub_212E4C514(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v9 = a4;
  if (v9)
  {
    BookUtilityLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_212E6BF44((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_4:
    v17 = 1;
    goto LABEL_5;
  }
  if (!v6)
  {
    BookUtilityLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_212E45000, v10, OS_LOG_TYPE_DEFAULT, "Defaulting isAudiobooksStoreEnabled to 1", (uint8_t *)v20, 2u);
    }
    goto LABEL_4;
  }
  v17 = objc_msgSend_BOOLValue(v6, v7, v8);
  BookUtilityLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109120;
    v20[1] = v17;
    _os_log_impl(&dword_212E45000, v10, OS_LOG_TYPE_DEFAULT, "isAudiobooksStoreEnabled %d", (uint8_t *)v20, 8u);
  }
LABEL_5:

  v18 = MEMORY[0x2199A7288](*(_QWORD *)(a1 + 32));
  v19 = (void *)v18;
  if (v18)
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, v17);

}

void sub_212E4C6C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_212E4CBC0()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  id v3;
  const __CFString *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;

  BUBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v0, v1, v2);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v9)
    v4 = v9;
  else
    v4 = CFSTR("com.apple.Unknown");
  v5 = getpid();
  v7 = objc_msgSend_initWithFormat_(v3, v6, (uint64_t)CFSTR("%@_%d"), v4, v5);
  v8 = (void *)qword_254B69F30;
  qword_254B69F30 = v7;

}

void sub_212E4CC58(void *a1, const char *a2, unint64_t a3)
{
  const char *v5;
  uint64_t v6;
  unint64_t i;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;

  v20 = (id)objc_msgSend_mutableCopy(CFSTR("          "), a2, a3);
  for (i = objc_msgSend_length(v20, v5, v6); i < a3; i = objc_msgSend_length(v20, v10, v11))
    objc_msgSend_appendString_(v20, v8, (uint64_t)v20);
  v12 = objc_msgSend_length(v20, v8, v9);
  objc_msgSend_deleteCharactersInRange_(v20, v13, a3, v12 - a3);
  objc_msgSend_insertString_atIndex_(a1, v14, (uint64_t)v20, 0);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], (const char *)v20, (uint64_t)CFSTR("\n%@"), v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(a1, v16, v17);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(a1, v19, (uint64_t)CFSTR("\n"), v15, 0, 0, v18);

}

id BUArrayDescription(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  v1 = a1;
  v4 = objc_msgSend_count(v1, v2, v3);
  objc_msgSend_descriptionWithObject_format_(BUDescription, v5, (uint64_t)v1, CFSTR("; count=%lu"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v1, v7, v8))
  {
    v11 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("[%lu]"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v1, v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addField_format_(v6, v15, (uint64_t)v12, CFSTR("%@"), v14);

      ++v11;
    }
    while (v11 < objc_msgSend_count(v1, v16, v17));
  }
  objc_msgSend_setFieldOptionCommaSeparated(v6, v9, v10);
  objc_msgSend_descriptionString(v6, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

__CFString *BUObjectReferenceDescription(void *a1)
{
  id v1;
  char isKindOfClass;
  void *v3;
  const char *ClassName;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  __CFString *v9;
  uint64_t v11;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = (void *)MEMORY[0x24BDD17C8];
    ClassName = object_getClassName(v1);
    v7 = ClassName;
    if ((isKindOfClass & 1) != 0)
    {
      v11 = objc_msgSend_count(v1, v5, v6);
      objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("(%s*)%p; count=%lu"), v7, v1, v11);
    }
    else
    {
      objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("(%s*)%p"), ClassName, v1);
    }
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("<nil>");
  }

  return v9;
}

id sub_212E4DB30(void *a1, const char *a2, unint64_t a3)
{
  __CFString *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a3 > 2)
    v5 = 0;
  else
    v5 = off_24CED9AA8[a3];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(a1, v7, (uint64_t)CFSTR("com.apple.iBooks.BUIO"), a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_212E4DC00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;

  v5 = a4;
  v6 = objc_alloc(MEMORY[0x24BDBCED8]);
  v9 = objc_msgSend_count(v5, v7, v8);
  v11 = (void *)objc_msgSend_initWithCapacity_(v6, v10, v9 + 1);
  v13 = v11;
  if (v5)
    objc_msgSend_addEntriesFromDictionary_(v11, v12, (uint64_t)v5);
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v12, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v15, (uint64_t)v14, CFSTR("BUIOErrorType"));

  return v13;
}

id sub_212E4DC9C(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0B88];
  objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v6, v4, 256, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id sub_212E4DD08(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0B88];
  objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v6, v4, 259, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id sub_212E4DD74(void *a1, const char *a2, int a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD1128];
  v5 = a3;
  objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v7, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_212E4DDE0(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0B88];
  objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v6, v4, 512, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id sub_212E4DE4C(void *a1, uint64_t a2, int a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x24BDD1540];
  v7 = a4;
  v8 = [v6 alloc];
  v9 = *MEMORY[0x24BDD1128];
  objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, v10, 1, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v8, v12, v9, a3, v11);
  return v13;
}

uint64_t sub_212E4DEE4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CED9A48);
}

uint64_t sub_212E4DEF0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  id v8;
  uint64_t isEqual;
  void *v10;
  const char *v11;

  v6 = a2;
  v8 = a4;
  if (a3 == 256 && (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD0B88]) & 1) != 0)
  {
    isEqual = 1;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v8, v7, (uint64_t)CFSTR("BUIOErrorType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)&unk_24CEE4FF8);

  }
  return isEqual;
}

uint64_t sub_212E4DF88(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CED9A68);
}

uint64_t sub_212E4DF94(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 == 259)
    return objc_msgSend_isEqualToString_(a2, (const char *)a2, *MEMORY[0x24BDD0B88]);
  else
    return 0;
}

uint64_t sub_212E4DFB8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CED9A88);
}

uint64_t sub_212E4DFC4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  id v8;
  uint64_t isEqual;
  void *v10;
  const char *v11;

  v6 = a2;
  v8 = a4;
  if (a3 == 512 && (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD0B88]) & 1) != 0)
  {
    isEqual = 1;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v8, v7, (uint64_t)CFSTR("BUIOErrorType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)&unk_24CEE5010);

  }
  return isEqual;
}

id sub_212E4E05C(void *a1, uint64_t a2, unsigned int a3)
{
  void *v4;
  int32x2_t v5;
  BOOL v7;
  id v8;
  time_t v9;
  const char *v10;
  uint64_t v11;
  tm v13;

  v4 = 0;
  memset(&v13.tm_wday, 0, 32);
  v13.tm_isdst = -1;
  v13.tm_sec = (a3 >> 15) & 0x3E;
  v13.tm_min = (a3 >> 21) & 0x3F;
  v13.tm_hour = a3 >> 27;
  v13.tm_mday = a3 & 0x1F;
  v5 = (int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF7FFFFFFFBLL), (int8x8_t)0x7F0000000FLL);
  *(int32x2_t *)&v13.tm_mon = vadd_s32(v5, (int32x2_t)0x50FFFFFFFFLL);
  v7 = (v5.i32[0] - 13) < 0xFFFFFFF4 || (a3 & 0x1F) == 0 || a3 >> 30 == 3;
  if (!v7 && ((a3 >> 21) & 0x3F) <= 0x3B && ((a3 >> 15) & 0x3E) <= 0x3B)
  {
    v8 = a1;
    v9 = mktime(&v13);
    v4 = (void *)objc_msgSend_initWithTimeIntervalSince1970_(v8, v10, v11, (double)v9);
  }
  return v4;
}

uint64_t sub_212E4E124(void *a1, const char *a2, uint64_t a3)
{
  double v3;
  tm *v4;
  int tm_year;
  time_t v7;

  objc_msgSend_timeIntervalSince1970(a1, a2, a3);
  v7 = (uint64_t)v3;
  v4 = localtime(&v7);
  tm_year = v4->tm_year;
  if (tm_year <= 81)
    LOWORD(tm_year) = 81;
  return (unsigned __int16)((32 * v4->tm_mon + 32) | v4->tm_mday | (((_WORD)tm_year << 9) + 24576)) | ((unsigned __int16)((32 * LOWORD(v4->tm_min)) | ((unsigned __int16)v4->tm_hour << 11) | ((unsigned __int16)v4->tm_sec >> 1)) << 16);
}

id sub_212E4E198(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDB4398];
  v4 = a3;
  objc_msgSend_bu_sharedAccountStore(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_iTunesAccountWithDSID_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_212E4E1F4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDB4398];
  v5 = a3;
  objc_msgSend_bu_sharedAccountStore(v4, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAccount_withCompletionHandler_(v9, v8, a1, v5);

}

id sub_212E4E254(void *a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_ams_setActive_forMediaType_(a1, a2, 0, 0);
  objc_msgSend_bu_sharedAccountStore(MEMORY[0x24BDB4398], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_saveAccount_verifyCredentials_(v5, v6, (uint64_t)a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id sub_212E4E2AC(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uLong total_out;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  int v30;
  int v31;
  const char *v32;
  const char *v33;
  z_stream v35;

  if (!objc_msgSend_length(a1, a2, a3))
    return a1;
  v6 = objc_msgSend_length(a1, v4, v5);
  v9 = objc_msgSend_length(a1, v7, v8);
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v10, v6 + (v9 >> 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(a1);
  v15 = objc_msgSend_bytes(v12, v13, v14);
  v35.avail_in = objc_msgSend_length(v12, v16, v17, v15, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v35.zalloc = 0;
  v35.zfree = 0;
  v35.total_out = 0;
  v20 = 0;
  if (!inflateInit2_(&v35, -15, "1.2.12", 112))
  {
    v21 = v9 >> 1;
    do
    {
      total_out = v35.total_out;
      if (total_out >= objc_msgSend_length(v11, v18, v19))
        objc_msgSend_increaseLengthBy_(v11, v23, v21);
      v24 = objc_retainAutorelease(v11);
      v27 = objc_msgSend_mutableBytes(v24, v25, v26);
      v35.next_out = (Bytef *)(v27 + v35.total_out);
      v30 = objc_msgSend_length(v24, v28, v29);
      v35.avail_out = v30 - LODWORD(v35.total_out);
      v31 = inflate(&v35, 2);
    }
    while (!v31);
    if (v31 == 1)
    {
      if (!inflateEnd(&v35))
      {
        objc_msgSend_setLength_(v24, v32, v35.total_out);
        objc_msgSend_dataWithData_(MEMORY[0x24BDBCE50], v33, (uint64_t)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v35);
    }
    v20 = 0;
  }
LABEL_13:

  return v20;
}

id sub_212E4E438(void *a1, const char *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uLong total_out;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  z_stream v28;

  if (!objc_msgSend_length(a1, a2, a3))
  {
    v11 = a1;
    return v11;
  }
  memset(&v28.total_out, 0, 72);
  v4 = objc_retainAutorelease(a1);
  v7 = objc_msgSend_bytes(v4, v5, v6);
  v28.avail_in = objc_msgSend_length(v4, v8, v9, v7, (unsigned __int128)0, (unsigned __int128)0);
  v11 = 0;
  if (deflateInit2_(&v28, 9, 8, -15, 9, 0, "1.2.12", 112))
    return v11;
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v10, 0x4000);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    total_out = v28.total_out;
    if (total_out >= objc_msgSend_length(v14, v12, v13))
      objc_msgSend_increaseLengthBy_(v14, v16, 0x4000);
    v17 = objc_retainAutorelease(v14);
    v20 = objc_msgSend_mutableBytes(v17, v18, v19);
    v28.next_out = (Bytef *)(v20 + v28.total_out);
    v23 = objc_msgSend_length(v17, v21, v22);
    v28.avail_out = v23 - LODWORD(v28.total_out);
    deflate(&v28, 4);
  }
  while (!v28.avail_out);
  deflateEnd(&v28);
  objc_msgSend_setLength_(v17, v24, v28.total_out);
  objc_msgSend_dataWithData_(MEMORY[0x24BDBCE50], v25, (uint64_t)v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

id BUOnboardingAllBundleIDs(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultBag(BUBag, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_onboardingPersonalizationID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valuePromise(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_date(MEMORY[0x24BDBCE60], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend_resultWithTimeout_error_(v9, v13, (uint64_t)&v32, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v32;
  v18 = v15;
  if (v15 && objc_msgSend_code(v15, v16, v17) != 204)
  {
    BookUtilityLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_212E6C034((uint64_t)v18, v19);

  }
  objc_msgSend_date(MEMORY[0x24BDBCE60], v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v20, v21, (uint64_t)v12);
  v23 = v22;

  BookUtilityLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v23;
    _os_log_impl(&dword_212E45000, v24, OS_LOG_TYPE_DEFAULT, "BUOnboardingAllBundleIDs: resultWithTimeout elapsedTime: %f", buf, 0xCu);
  }

  objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCEB8], v25, (uint64_t)CFSTR("com.apple.onboarding.ibooks"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v26;
  if (v14)
    objc_msgSend_addObject_(v26, v27, (uint64_t)v14);
  v30 = (void *)objc_msgSend_copy(v29, v27, v28);

  return v30;
}

void sub_212E4E8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E4E8FC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend_entriesCountImpl(*(void **)(a1 + 32), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_212E4EA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E4EAA0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E4EAB0(uint64_t a1)
{

}

void sub_212E4EAB8(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t sub_212E4EBB0(uint64_t a1, const char *a2)
{
  return objc_msgSend_beginEntryWithNameImpl_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(a1 + 69));
}

uint64_t sub_212E4EF00(uint64_t a1, const char *a2)
{
  return objc_msgSend_addDataImpl_queue_completion_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t sub_212E4F1C0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_212E4F1D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_212E4F1E0(uint64_t a1, const char *a2, uint64_t a3, const Bytef *a4, unint64_t a5)
{
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned int v11;
  uInt v12;
  uLong v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;

  objc_msgSend_currentEntry(*(void **)(a1 + 32), a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_CRC(v8, v9, v10);
  if (a5 >= 0xFFFFFFFF)
    v12 = -1;
  else
    v12 = a5;
  v13 = crc32(v11, a4, v12);
  objc_msgSend_currentEntry(*(void **)(a1 + 32), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCRC_(v16, v17, v13);

  return 1;
}

void sub_212E4F41C(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;

  v9 = a1[4];
  if (v9[16])
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 269, (uint64_t)"-[BUZipWriter flushCurrentEntryWithQueue:completion:]_block_invoke", (uint64_t)"!self->_closed", CFSTR("Trying to flush while closed."), a6, a7, a8, v28);
    BUCrashBreakpoint();
    if ((BUIsRunningTests() & 1) != 0)
      BUCrashFinalThrow(CFSTR("Trying to flush while closed."), v10, v11, v12, v13, v14, v15, v16, v29);
    __break(1u);
  }
  else
  {
    objc_msgSend_error(v9, a2, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = a1[4];
    if (v17)
    {
      objc_msgSend_error(v20, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_212E4F5A4;
      block[3] = &unk_24CED9B68;
      v22 = a1[5];
      v23 = a1[6];
      v34 = v21;
      v35 = v23;
      v24 = v21;
      dispatch_async(v22, block);

    }
    else
    {
      objc_msgSend_finishEntry(v20, v18, v19);
      objc_msgSend_channelQueue(a1[4], v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = sub_212E4F5B4;
      v30[3] = &unk_24CED9C08;
      v30[4] = a1[4];
      v32 = a1[6];
      v31 = a1[5];
      dispatch_async(v27, v30);

    }
  }
}

uint64_t sub_212E4F5A4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_212E4F5B4(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  objc_msgSend_channelQueue(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v4);

  objc_msgSend_p_writeChannel(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212E4F668;
  v12[3] = &unk_24CED9BE0;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v14 = v8;
  v12[4] = v9;
  v13 = v10;
  objc_msgSend_flushWithCompletion_(v7, v11, (uint64_t)v12);

}

void sub_212E4F668(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 48))
  {
    if (v3)
    {
      v7 = v3;
    }
    else
    {
      objc_msgSend_error(*(void **)(a1 + 32), v4, v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = sub_212E4F73C;
    v16 = &unk_24CED9B68;
    v9 = *(NSObject **)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v17 = v8;
    v18 = v10;
    v11 = v8;
    dispatch_async(v9, &v13);

  }
  objc_msgSend_channelQueue(*(void **)(a1 + 32), v4, v5, v13, v14, v15, v16);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v12);

}

uint64_t sub_212E4F73C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_212E4F9B4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v7 == 0);
  }

}

void sub_212E4FB48(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21[5];
  id v22;

  v9 = *(_BYTE **)(a1 + 32);
  if (v9[16])
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 350, (uint64_t)"-[BUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]_block_invoke", (uint64_t)"!self->_closed", CFSTR("Already closed."), a6, a7, a8, v21[0]);
    BUCrashBreakpoint();
    if ((BUIsRunningTests() & 1) != 0)
      BUCrashFinalThrow(CFSTR("Already closed."), v10, v11, v12, v13, v14, v15, v16, v21[0]);
    __break(1u);
  }
  else
  {
    objc_msgSend_writeQueue(v9, a2, a3);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v17);

    objc_msgSend_beginEntryWithNameImpl_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate_(*(void **)(a1 + 32), v18, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 84), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 80), 0);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = (uint64_t)sub_212E4FC44;
    v21[3] = (uint64_t)&unk_24CED9C80;
    v21[4] = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    objc_msgSend_readWithHandler_(v19, v20, (uint64_t)v21);

  }
}

void sub_212E4FC44(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  char v18;

  v7 = a3;
  objc_msgSend_handleWriteError_(*(void **)(a1 + 32), v8, a4);
  if (v7)
  {
    objc_msgSend_error(*(void **)(a1 + 32), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend_addDataImpl_queue_completion_(*(void **)(a1 + 32), v9, (uint64_t)v7, 0, 0);
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    v18 = 0;
    objc_msgSend_error(*(void **)(a1 + 32), v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id, void *, char *))(v12 + 16))(v12, a2, v7, v13, &v18);

    if (v18)
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v9, *MEMORY[0x24BDD0B88], 3072, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleWriteError_(v14, v16, (uint64_t)v15);

    }
  }
  if ((_DWORD)a2)
  {
    objc_msgSend_writeQueue(*(void **)(a1 + 32), v9, v10);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v17);

  }
}

uint64_t sub_212E4FE2C(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_addExistingEntryImpl_, *(_QWORD *)(a1 + 40));
}

uint64_t sub_212E4FFD0(uint64_t a1, const char *a2)
{
  return objc_msgSend_setEntryInsertionOffsetImpl_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

void sub_212E50084(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend_writeQueue(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v4);

  objc_msgSend_channelQueue(*(void **)(a1 + 32), v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212E50124;
  v9[3] = &unk_24CED9D20;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_async(v7, v9);

}

void sub_212E50124(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend_channelQueue(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v4);

  objc_msgSend_p_writeChannel(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212E501C4;
  v10[3] = &unk_24CED9B68;
  v8 = *(id *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  objc_msgSend_addBarrier_(v7, v9, (uint64_t)v10);

}

void sub_212E501C4(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend_channelQueue(*(void **)(a1 + 32), v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v4);

  objc_msgSend_writeQueue(*(void **)(a1 + 32), v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v7);

}

void sub_212E502E0(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;

  v9 = a1[4];
  if (v9[16])
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 450, (uint64_t)"-[BUZipWriter closeWithQueue:completion:]_block_invoke", (uint64_t)"!self->_closed", CFSTR("Shouldn't have closed twice."), a6, a7, a8, v33);
    BUCrashBreakpoint();
    if ((BUIsRunningTests() & 1) != 0)
      BUCrashFinalThrow(CFSTR("Shouldn't have closed twice."), v10, v11, v12, v13, v14, v15, v16, v34);
    __break(1u);
  }
  else
  {
    objc_msgSend_error(v9, a2, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = a1[4];
    if (v17)
    {
      objc_msgSend_setClosed_(v20, v18, 1);
      objc_msgSend_error(a1[4], v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_212E50488;
      block[3] = &unk_24CED9B68;
      v24 = a1[5];
      v25 = a1[6];
      v39 = v23;
      v40 = v25;
      v26 = v23;
      dispatch_async(v24, block);

    }
    else
    {
      objc_msgSend_finishEntry(v20, v18, v19);
      objc_msgSend_writeCentralDirectory(a1[4], v27, v28);
      objc_msgSend_setClosed_(a1[4], v29, 1);
      objc_msgSend_channelQueue(a1[4], v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = sub_212E50498;
      v35[3] = &unk_24CED9C08;
      v35[4] = a1[4];
      v37 = a1[6];
      v36 = a1[5];
      dispatch_async(v32, v35);

    }
  }
}

uint64_t sub_212E50488(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_212E50498(void **a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id location;

  objc_msgSend_channelQueue(a1[4], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v4);

  objc_msgSend_p_writeChannel(a1[4], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212E505A4;
  v9[3] = &unk_24CED9D48;
  objc_copyWeak(&v12, &location);
  v9[4] = a1[4];
  v11 = a1[6];
  v10 = a1[5];
  objc_msgSend_addBarrier_(v7, v8, (uint64_t)v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void sub_212E50588(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_212E505A4(void **a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend_close(WeakRetained, v3, v4);
  objc_msgSend_writeQueue(a1[4], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E50660;
  block[3] = &unk_24CED9C08;
  block[4] = a1[4];
  v10 = a1[6];
  v9 = a1[5];
  dispatch_async(v7, block);

}

void sub_212E50660(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  objc_msgSend_writeChannelCompletionGroup(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend_error(*(void **)(a1 + 32), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = sub_212E50738;
    v15 = &unk_24CED9B68;
    v8 = *(NSObject **)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v16 = v7;
    v17 = v9;
    v10 = v7;
    dispatch_async(v8, &v12);

  }
  objc_msgSend_channelQueue(*(void **)(a1 + 32), v5, v6, v12, v13, v14, v15);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v11);

}

uint64_t sub_212E50738(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_212E51068(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void (*v7)(void *, id);
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;

  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_212E51130;
      v9[3] = &unk_24CED9B68;
      v11 = v4;
      v10 = v3;
      dispatch_async((dispatch_queue_t)v6, v9);

    }
    else
    {
      v7 = (void (*)(void *, id))v4[2];
      v8 = 0;
      v7(v5, v3);
    }

  }
}

uint64_t sub_212E51130(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_212E51210(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend_channelQueue(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v4);

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_212E4EAA0;
  v15[4] = sub_212E4EAB0;
  v16 = 0;
  objc_msgSend_p_writeChannel(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212E51320;
  v12[3] = &unk_24CED9DC0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v14 = v15;
  v12[4] = v8;
  v10 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  objc_msgSend_writeData_offset_handler_(v7, v11, v9, v10, v12);

  _Block_object_dispose(v15, 8);
}

void sub_212E51308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E51320(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[6];

  v7 = a3;
  v10 = a4;
  if (v10 && (v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v13 = *(_QWORD *)(v11 + 40), v12 = (id *)(v11 + 40), !v13))
  {
    objc_storeStrong(v12, a4);
    if (!a2)
      goto LABEL_11;
  }
  else if (!a2)
  {
    goto LABEL_11;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend_writeQueue(*(void **)(a1 + 32), v8, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_212E51444;
    v21[3] = &unk_24CED9D98;
    v15 = *(_QWORD *)(a1 + 48);
    v21[4] = *(_QWORD *)(a1 + 32);
    v21[5] = v15;
    dispatch_async(v14, v21);

  }
  v16 = MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
  v17 = (void *)v16;
  if (v16)
    (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  objc_msgSend_channelQueue(*(void **)(a1 + 32), v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v20);

LABEL_11:
}

uint64_t sub_212E51444(uint64_t a1, const char *a2)
{
  return objc_msgSend_handleWriteError_(*(void **)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_212E51584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E5159C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend_currentOffset(*(void **)(a1 + 32), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_212E516E0(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_p_writeChannel(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_close(v5, v3, v4);

}

void sub_212E517A8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BUZipEntry *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  unsigned __int16 v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  unsigned __int8 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v49 = 0;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend_entries(*(void **)(a1 + 32), a2, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v45, v50, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v46;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v9);
      v11 = objc_alloc_init(BUZipEntry);
      objc_msgSend_name(v10, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v11, v15, (uint64_t)v14);

      objc_msgSend_name(v11, v16, v17);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = (const char *)objc_msgSend_UTF8String(v18, v19, v20);
      v22 = strlen(v21);
      objc_msgSend_setNameLength_(v11, v23, v22);

      objc_msgSend_lastModificationDate(v10, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastModificationDate_(v11, v27, (uint64_t)v26);

      v30 = objc_msgSend_size(v10, v28, v29);
      objc_msgSend_setSize_(v11, v31, v30);
      v34 = objc_msgSend_size(v10, v32, v33);
      objc_msgSend_setCompressedSize_(v11, v35, v34);
      v38 = objc_msgSend_offset(v10, v36, v37);
      objc_msgSend_setOffset_(v11, v39, v38);
      v42 = objc_msgSend_CRC(v10, v40, v41);
      objc_msgSend_setCRC_(v11, v43, v42);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      LODWORD(v10) = v49;

      if ((_DWORD)v10)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v44, (uint64_t)&v45, v50, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t sub_212E519DC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a3;
  v7 = objc_msgSend_offset(a2, v5, v6);
  v10 = objc_msgSend_offset(v4, v8, v9);

  if (v7 < v10)
    return -1;
  else
    return v7 > v10;
}

void sub_212E51AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E51B10(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sortedEntriesImpl(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_212E51BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E51C04(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

void sub_212E51D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E51D20(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend_entriesMap(*(void **)(a1 + 32), a2, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v4, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t sub_212E51E18(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_truncateToNumberOfEntriesImpl_completion_, *(_QWORD *)(a1 + 48));
}

uint64_t sub_212E52008(uint64_t a1, const char *a2)
{
  return objc_msgSend_truncateToOffsetImpl_completion_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void sub_212E522DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL BCPointsAlmostEqual(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 0.00999999978;
  return vabdd_f64(a2, a4) < 0.00999999978 && v4;
}

double CGPointMultiply(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGPointMultiplyByPoint(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGPointAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGPointSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

double CGPointAddSize(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGPointSubtractSize(double a1, double a2, double a3)
{
  return a1 - a3;
}

double CGPointDistanceFromPoint(double a1, double a2, double a3, double a4)
{
  return sqrt((a4 - a2) * (a4 - a2) + (a3 - a1) * (a3 - a1));
}

double CGPointSquaredDistanceFromPoint(double a1, double a2, double a3, double a4)
{
  return (a4 - a2) * (a4 - a2) + (a3 - a1) * (a3 - a1);
}

double CGPointClipToRect(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MinX;
  double MaxX;
  double v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  MaxX = CGRectGetMaxX(v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetMinY(v17);
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  CGRectGetMaxY(v18);
  if (a1 > MaxX)
    v13 = MaxX;
  else
    v13 = a1;
  if (a1 < MinX)
    return MinX;
  return v13;
}

double CGPointRoundForScale(double a1, double a2, double a3)
{
  if (a3 == 0.0)
    a3 = 1.0;
  return 1.0 / a3 * round(a1 * a3);
}

double CGRectFitRectInRectNoRounding(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double result;
  double v9;
  double v11;

  result = *MEMORY[0x24BDBF090];
  v9 = 0.0;
  if (a3 != *MEMORY[0x24BDBF148] || a4 != *(double *)(MEMORY[0x24BDBF148] + 8))
    v9 = fmin(a7 / a3, a8 / a4);
  v11 = a3 * v9;
  if (a7 > v11)
    return (a7 - v11) * 0.5;
  return result;
}

double CGSizeScaleThatFitsInCGSize(double a1, double a2, double a3, double a4)
{
  if (a1 == *MEMORY[0x24BDBF148] && a2 == *(double *)(MEMORY[0x24BDBF148] + 8))
    return 0.0;
  else
    return fmin(a3 / a1, a4 / a2);
}

double CGRectFitRectInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double result;

  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = 0.0;
  if (a3 != *MEMORY[0x24BDBF148] || a4 != *(double *)(MEMORY[0x24BDBF148] + 8))
    v10 = fmin(a7 / a3, a8 / a4);
  v12 = a3 * v10;
  v13 = a4 * v10;
  if (a7 > v12)
    v8 = (a7 - v12) * 0.5;
  if (a8 > v13)
    v9 = (a8 - v13) * 0.5;
  *(_QWORD *)&result = (unint64_t)CGRectIntegral(*(CGRect *)&v8);
  return result;
}

CGFloat CGRectFitRectInRectClip(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v8 = *MEMORY[0x24BDBF090];
  v9 = 0.0;
  if (a3 != *MEMORY[0x24BDBF148] || a4 != *(double *)(MEMORY[0x24BDBF148] + 8))
    v9 = fmin(a7 / a3, a8 / a4);
  v11 = a3 * v9;
  v12 = a4 * v9;
  v13 = (a7 - a3 * v9) * 0.5;
  if (a7 > v11)
    v8 = v13;
  if (a8 <= v12)
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
  else
    v14 = (a8 - v12) * 0.5;
  v15 = v14;
  v16 = v11;
  v17 = a4 * v9;
  v18 = floor(CGRectGetMinX(*(CGRect *)&v8));
  v22.origin.x = v18;
  v22.origin.y = v14;
  v22.size.width = v11;
  v22.size.height = v12;
  v19 = floor(CGRectGetMinY(v22));
  v23.origin.x = v18;
  v23.origin.y = v19;
  v23.size.width = v11;
  v23.size.height = v12;
  v20 = floor(CGRectGetWidth(v23));
  v24.origin.x = v18;
  v24.origin.y = v19;
  v24.size.width = v20;
  v24.size.height = v12;
  CGRectGetHeight(v24);
  return v18;
}

double CGRectFitRectInRectAbsoluteNoRounding(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v12;
  CGFloat v14;
  CGFloat v15;
  double MidX;
  double v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v12 = 0.0;
  if (a3 != *MEMORY[0x24BDBF148] || a4 != *(double *)(MEMORY[0x24BDBF148] + 8))
    v12 = fmin(a7 / a3, a8 / a4);
  v14 = a3 * v12;
  v15 = a4 * v12;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v14;
  v20.size.height = v15;
  v17 = MidX - CGRectGetWidth(v20) * 0.5;
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMidY(v21);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v14;
  v22.size.height = v15;
  CGRectGetHeight(v22);
  return v17;
}

double CGSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGRectCenterRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MidX;
  double v16;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  v16 = MidX - CGRectGetWidth(v20) * 0.5;
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMidY(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetHeight(v22);
  return v16;
}

double CGRectMakeWithSize()
{
  return 0.0;
}

double CGRectGetCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8;
  CGRect v10;

  v8 = ceil(CGRectGetMidX(*(CGRect *)&a1));
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return v8;
}

double CGRectGetCenterNoRounding(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double CGRectMultiply(double result, double a2, double a3, double a4, double a5)
{
  if (a5 != 1.0)
    return result * a5;
  return result;
}

double CGRectRoundedForScale(double a1, double a2, double a3, CGFloat a4, double a5)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v8 = a1;
  if (a5 == 0.0)
    v9 = 1.0;
  else
    v9 = a5;
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    if (v9 == 1.0)
      v10 = v8;
    else
      v10 = v8 * v9;
    if (v9 == 1.0)
      v11 = a2;
    else
      v11 = a2 * v9;
    if (v9 == 1.0)
      v12 = a3;
    else
      v12 = a3 * v9;
    if (v9 != 1.0)
      a4 = a4 * v9;
    v14.origin.x = v10;
    v14.origin.y = v11;
    v14.size.width = v12;
    v14.size.height = a4;
    v8 = round(CGRectGetMinX(v14));
    v15.origin.x = v10;
    v15.origin.y = v11;
    v15.size.width = v12;
    v15.size.height = a4;
    round(CGRectGetMinY(v15));
    v16.origin.x = v10;
    v16.origin.y = v11;
    v16.size.width = v12;
    v16.size.height = a4;
    CGRectGetMaxX(v16);
    v17.origin.x = v10;
    v17.origin.y = v11;
    v17.size.width = v12;
    v17.size.height = a4;
    CGRectGetMaxY(v17);
    if (1.0 / v9 != 1.0)
      return 1.0 / v9 * v8;
  }
  return v8;
}

double CGRectMakeWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

BOOL CGRectAlmostEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.00000011920929
      && vabdd_f64(a2, a6) < 0.00000011920929
      && vabdd_f64(a3, a7) < 0.00000011920929
      && vabdd_f64(a4, a8) < 0.00000011920929;
}

double CGSizeScaleThatFillsInCGSize(double a1, double a2, double a3, double a4)
{
  if (a1 == *MEMORY[0x24BDBF148] && a2 == *(double *)(MEMORY[0x24BDBF148] + 8))
    return 0.0;
  else
    return fmax(a3 / a1, a4 / a2);
}

double CGSizeLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double CGSizeScaledToFitInSize(double a1, double a2, double a3, double a4)
{
  double v4;

  v4 = 0.0;
  if (a1 != *MEMORY[0x24BDBF148] || a2 != *(double *)(MEMORY[0x24BDBF148] + 8))
    v4 = fmin(a3 / a1, a4 / a2);
  return a1 * v4;
}

double CGSizeScaledToFillInSize(double a1, double a2, double a3, double a4)
{
  double v4;

  v4 = 0.0;
  if (a1 != *MEMORY[0x24BDBF148] || a2 != *(double *)(MEMORY[0x24BDBF148] + 8))
    v4 = fmax(a3 / a1, a4 / a2);
  return a1 * v4;
}

double CGSizeRound(double a1)
{
  return round(a1);
}

double CGSizeRoundForScale(double a1, double a2, double a3)
{
  if (a3 == 0.0)
    a3 = 1.0;
  return 1.0 / a3 * round(a1 * a3);
}

double CGSizeCeilForScale(double a1, double a2, double a3)
{
  if (a3 == 0.0)
    a3 = 1.0;
  return 1.0 / a3 * ceil(a1 * a3);
}

double CGFloatScale(double a1, double a2)
{
  return a1 * a2;
}

double CGFloatRoundForScale(double a1, double a2)
{
  if (a2 == 0.0)
    a2 = 1.0;
  return 1.0 / a2 * round(a2 * a1);
}

double CGFloatCeilForScale(double a1, double a2)
{
  if (a2 == 0.0)
    a2 = 1.0;
  return 1.0 / a2 * ceil(a2 * a1);
}

double CGSizeMakeEvenSize(double result)
{
  if (((int)result & 1) != 0)
    return result + -1.0;
  return result;
}

double CGSizeRotate(double a1, double a2)
{
  return a2;
}

double CGSizeMin(double result, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = a3 > result;
  if (a4 > a2)
    v4 = 1;
  if (!v4)
    return a3;
  return result;
}

double CGSizeMultiplyByPoint(double a1, double a2, double a3)
{
  return a1 * a3;
}

void CGRectEdgePointAtAngle(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  __double2 v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  CGRectGetMidX(*(CGRect *)&a1);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetMidY(v11);
  v10 = __sincos_stret(a5);
  if (v10.__sinval <= 0.0001)
  {
    if (v10.__sinval < -0.0001)
    {
      v14.origin.x = a1;
      v14.origin.y = a2;
      v14.size.width = a3;
      v14.size.height = a4;
      CGRectGetMinY(v14);
      v15.origin.x = a1;
      v15.origin.y = a2;
      v15.size.width = a3;
      v15.size.height = a4;
      CGRectGetMinY(v15);
    }
  }
  else
  {
    v12.origin.x = a1;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMaxY(v12);
    v13.origin.x = a1;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    CGRectGetMaxY(v13);
  }
  if (v10.__cosval <= 0.0001)
  {
    if (v10.__cosval < -0.0001)
    {
      v18.origin.x = a1;
      v18.origin.y = a2;
      v18.size.width = a3;
      v18.size.height = a4;
      CGRectGetMinX(v18);
      v19.origin.x = a1;
      v19.origin.y = a2;
      v19.size.width = a3;
      v19.size.height = a4;
      CGRectGetMinX(v19);
    }
  }
  else
  {
    v16.origin.x = a1;
    v16.origin.y = a2;
    v16.size.width = a3;
    v16.size.height = a4;
    CGRectGetMaxX(v16);
    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    CGRectGetMaxX(v17);
  }
}

BOOL CGLinesIntersect(double *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v9 = a5 - a3;
  v10 = a2 - a4;
  v11 = a9 - a7;
  v12 = a6 - a8;
  v13 = v9 * (a6 - a8) - v11 * (a2 - a4);
  v14 = fabs(v13);
  if (a1 && v14 >= 0.00000011920929)
  {
    v15 = a7 * v12 + v11 * a6;
    v16 = a3 * v10 + v9 * a2;
    *a1 = (v12 * v16 - v10 * v15) / v13;
    a1[1] = (v16 * -v11 + v9 * v15) / v13;
  }
  return v14 >= 0.00000011920929;
}

BOOL SegmentCanContainPoint(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v14;

  if (a1 >= a3)
    v6 = a3;
  else
    v6 = a1;
  if (a1 >= a3)
    v7 = a1;
  else
    v7 = a3;
  if (a2 >= a4)
    v8 = a4;
  else
    v8 = a2;
  if (a2 >= a4)
    v9 = a2;
  else
    v9 = a4;
  v10 = vabdd_f64(a5, v6);
  if (a5 <= v6 && v10 >= 0.00000011920929)
    return 0;
  v12 = vabdd_f64(a5, v7);
  if (a5 >= v7 && v12 >= 0.00000011920929)
    return 0;
  v14 = vabdd_f64(a6, v8);
  if (a6 <= v8 && v14 >= 0.00000011920929)
    return 0;
  if (a6 >= v9)
    return vabdd_f64(a6, v9) < 0.00000011920929;
  return 1;
}

BOOL CGLineSegmentsIntersect(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  _BOOL8 result;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;

  v23 = 0uLL;
  result = CGLinesIntersect((double *)&v23, a2, a3, a4, a5, a6, a7, a8, a9);
  if (result)
  {
    v19 = a4;
    v20 = *((double *)&v23 + 1);
    v21 = a5;
    v22 = *(double *)&v23;
    result = SegmentCanContainPoint(a2, a3, v19, v21, *(double *)&v23, *((double *)&v23 + 1));
    if (result)
    {
      result = SegmentCanContainPoint(a6, a7, a8, a9, v22, v20);
      if (a1)
      {
        if (result)
        {
          *a1 = v23;
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t CGRectIntersectsLineSegment(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9)
{
  double MinY;
  double MaxX;
  double v18;
  double v19;
  _BOOL4 v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  int32x2_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int32x2_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int32x2_t v37;
  __int128 v38;
  CGFloat MinX;
  double v42;
  float64x2_t v44;
  _OWORD v45[2];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v46 = *MEMORY[0x24BDAC8D0];
  v44 = 0uLL;
  MinX = CGRectGetMinX(*(CGRect *)&a2);
  v47.origin.x = a2;
  v47.origin.y = a3;
  v47.size.width = a4;
  v47.size.height = a5;
  MinY = CGRectGetMinY(v47);
  v48.origin.x = a2;
  v48.origin.y = a3;
  v48.size.width = a4;
  v48.size.height = a5;
  MaxX = CGRectGetMaxX(v48);
  v49.origin.x = a2;
  v49.origin.y = a3;
  v49.size.width = a4;
  v49.size.height = a5;
  v18 = CGRectGetMinY(v49);
  v19 = MinX;
  v42 = a7;
  v20 = CGLineSegmentsIntersect(&v44, v19, MinY, MaxX, v18, a6, a7, a8, a9);
  v21 = 0;
  if (v20)
  {
    v45[0] = v44;
    v21 = 1;
  }
  v50.origin.x = a2;
  v50.origin.y = a3;
  v50.size.width = a4;
  v50.size.height = a5;
  v22 = CGRectGetMaxX(v50);
  v51.origin.x = a2;
  v51.origin.y = a3;
  v51.size.width = a4;
  v51.size.height = a5;
  v23 = CGRectGetMinY(v51);
  v52.origin.x = a2;
  v52.origin.y = a3;
  v52.size.width = a4;
  v52.size.height = a5;
  v24 = CGRectGetMaxX(v52);
  v53.origin.x = a2;
  v53.origin.y = a3;
  v53.size.width = a4;
  v53.size.height = a5;
  MaxY = CGRectGetMaxY(v53);
  if (CGLineSegmentsIntersect(&v44, v22, v23, v24, MaxY, a6, v42, a8, a9))
  {
    if (v20)
    {
      v26 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE140000000uLL), vabdq_f64(v44, *(float64x2_t *)a1)));
      if ((v26.i32[0] & v26.i32[1] & 1) == 0)
        goto LABEL_12;
    }
    else
    {
      v45[v21] = v44;
    }
    v21 = 1;
  }
  v54.origin.x = a2;
  v54.origin.y = a3;
  v54.size.width = a4;
  v54.size.height = a5;
  v27 = CGRectGetMinX(v54);
  v55.origin.x = a2;
  v55.origin.y = a3;
  v55.size.width = a4;
  v55.size.height = a5;
  v28 = CGRectGetMaxY(v55);
  v56.origin.x = a2;
  v56.origin.y = a3;
  v56.size.width = a4;
  v56.size.height = a5;
  v29 = CGRectGetMaxX(v56);
  v57.origin.x = a2;
  v57.origin.y = a3;
  v57.size.width = a4;
  v57.size.height = a5;
  v30 = CGRectGetMaxY(v57);
  if (CGLineSegmentsIntersect(&v44, v27, v28, v29, v30, a6, v42, a8, a9))
  {
    if (v21)
    {
      v31 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE140000000uLL), vabdq_f64(v44, *(float64x2_t *)a1)));
      if ((v31.i32[0] & v31.i32[1] & 1) == 0)
      {
LABEL_12:
        v32 = 2;
LABEL_20:
        v45[v21] = v44;
        v21 = v32;
        goto LABEL_21;
      }
    }
    else
    {
      v45[0] = v44;
    }
    v21 = 1;
  }
  v58.origin.x = a2;
  v58.origin.y = a3;
  v58.size.width = a4;
  v58.size.height = a5;
  v33 = CGRectGetMinX(v58);
  v59.origin.x = a2;
  v59.origin.y = a3;
  v59.size.width = a4;
  v59.size.height = a5;
  v34 = CGRectGetMinY(v59);
  v60.origin.x = a2;
  v60.origin.y = a3;
  v60.size.width = a4;
  v60.size.height = a5;
  v35 = CGRectGetMinX(v60);
  v61.origin.x = a2;
  v61.origin.y = a3;
  v61.size.width = a4;
  v61.size.height = a5;
  v36 = CGRectGetMaxY(v61);
  if (CGLineSegmentsIntersect(&v44, v33, v34, v35, v36, a6, v42, a8, a9))
  {
    if (!v21
      || (v37 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE140000000uLL), vabdq_f64(v44, *(float64x2_t *)a1))),
          (v37.i32[0] & v37.i32[1] & 1) == 0))
    {
      v32 = v21 + 1;
      goto LABEL_20;
    }
    v21 = 1;
  }
LABEL_21:
  if (a1 && v21)
  {
    v38 = v45[1];
    *(_OWORD *)a1 = v45[0];
    *(_OWORD *)(a1 + 16) = v38;
  }
  return v21;
}

void sub_212E534C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E534E0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E534F0(uint64_t a1)
{

}

void sub_212E534F8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  void (*v9)(void);
  dispatch_data_t concat;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *data2;

  data2 = a3;
  v7 = a4;
  v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    if (v7)
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_8:
      v9();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;

      goto LABEL_9;
    }
    if (data2)
    {
      concat = dispatch_data_create_concat(v8, data2);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = concat;

    }
    if (a2)
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_8;
    }
  }
LABEL_9:

}

uint64_t sub_212E5368C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  const char *v6;
  uint64_t v7;

  v5 = a1;
  v7 = objc_msgSend_readToBuffer_size_(v5, v6, a2, a3);

  return v7;
}

uint64_t sub_212E53808(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v6 = objc_msgSend_offset(v3, v4, v5);
  objc_msgSend_seekToOffset_(v3, v7, v6 + a2);
  v10 = objc_msgSend_offset(v3, v8, v9) - v6;

  return v10;
}

void sub_212E53990(void *a1)
{
  const char *v1;
  id v2;

  v2 = a1;
  objc_msgSend_seekToOffset_(v2, v1, 0);

}

void sub_212E53B00(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_212E53B20(void *a1)
{
  const char *v1;
  uint64_t v2;
  id v3;

  v3 = a1;
  objc_msgSend_close(v3, v1, v2);
  CFRelease(v3);

}

void sub_212E53C94(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

double BURound(double a1)
{
  return round(a1);
}

double BUFractionalPart(double a1)
{
  BOOL v1;
  double v2;
  double result;

  v1 = a1 <= 0.0;
  v2 = -(-a1 - floor(-a1));
  result = a1 - floor(a1);
  if (v1)
    return v2;
  return result;
}

double BUClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3)
      return a3;
  }
  return a2;
}

double BUMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double BURandom()
{
  return (double)random() / 2147483650.0;
}

double BURandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double BUReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double BUSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

id sub_212E54330(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_mutableCopy(a1, a2, a3);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = a1;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v21, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v5, v8, v12, (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v16)
          objc_msgSend_removeObjectForKey_(v4, v8, v12);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v21, v25, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_msgSend_copy(v4, v17, v18);
  return v19;
}

id sub_212E54484(uint64_t a1, const char *a2, void *a3)
{
  const char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  id v64;
  NSObject *v66;
  int v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  if (v4)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v3, (uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    if (v5)
    {
      objc_msgSend_scheme(v5, v3, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend_length(v8, v9, v10);

      if (v11)
      {
        objc_msgSend_lastPathComponent(v5, v3, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_host(v5, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_resourceSpecifier(v5, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_length(v13, v20, v21)
          && (objc_msgSend_isEqualToString_(v13, v22, (uint64_t)CFSTR("/")) & 1) == 0)
        {
          objc_msgSend_stringByDeletingPathExtension(v13, v22, v23);
        }
        else if (objc_msgSend_length(v16, v22, v23))
        {
          objc_msgSend_stringByDeletingPathExtension(v16, v24, v25);
        }
        else
        {
          if (!objc_msgSend_length(v19, v24, v25))
          {
            BookUtilityLog();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              v67 = 138412290;
              v68 = v5;
              _os_log_impl(&dword_212E45000, v66, OS_LOG_TYPE_DEFAULT, "Failed to generate fileNameCandidate from URL: %@ ", (uint8_t *)&v67, 0xCu);
            }

            goto LABEL_13;
          }
          objc_msgSend_stringByDeletingPathExtension(v19, v26, v27);
        }
        v28 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v28;
LABEL_13:

      }
    }
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD1690], v3, (uint64_t)CFSTR("/"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_newlineCharacterSet(MEMORY[0x24BDD14A8], v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formUnionWithCharacterSet_(v29, v33, (uint64_t)v32);

  objc_msgSend_illegalCharacterSet(MEMORY[0x24BDD14A8], v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formUnionWithCharacterSet_(v29, v37, (uint64_t)v36);

  objc_msgSend_controlCharacterSet(MEMORY[0x24BDD14A8], v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formUnionWithCharacterSet_(v29, v41, (uint64_t)v40);

  objc_msgSend_componentsSeparatedByCharactersInSet_(v7, v42, (uint64_t)v29);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v43, v44, (uint64_t)&stru_24CEDBD58);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_hasPrefix_(v45, v46, (uint64_t)CFSTR("."))
    && (unint64_t)objc_msgSend_length(v45, v47, v48) >= 2)
  {
    objc_msgSend_substringFromIndex_(v45, v47, 1);
    v49 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v49;
  }
  if (!v45)
    goto LABEL_21;
  if (!objc_msgSend_length(v45, v47, v48))
    goto LABEL_21;
  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v47, (uint64_t)CFSTR("."));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByCharactersInSet_(v45, v51, (uint64_t)v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v52, v53, (uint64_t)&stru_24CEDBD58);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_length(v54, v55, v56);

  if (v57)
  {
    v58 = v45;
  }
  else
  {
LABEL_21:
    objc_msgSend_UUID(MEMORY[0x24BDD1880], v47, v48);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(CFSTR("Book-"), v63, (uint64_t)v62);
    v58 = (id)objc_claimAutoreleasedReturnValue();

  }
  v64 = v58;

  return v64;
}

id sub_212E54800()
{
  if (qword_254B69F58 != -1)
    dispatch_once(&qword_254B69F58, &unk_24CED9F68);
  return (id)qword_254B69F50;
}

void sub_212E54840()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0)
    v0 = (void *)_CFCopySystemVersionDictionary();
  v4 = v0;
  objc_msgSend_objectForKeyedSubscript_(v0, v1, *MEMORY[0x24BDBD200]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254B69F50;
  qword_254B69F50 = v2;

}

id sub_212E54890()
{
  if (qword_254B69F68 != -1)
    dispatch_once(&qword_254B69F68, &unk_24CED9F88);
  return (id)qword_254B69F60;
}

void sub_212E548D0()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0)
    v0 = (void *)_CFCopySystemVersionDictionary();
  v4 = v0;
  objc_msgSend_objectForKeyedSubscript_(v0, v1, *MEMORY[0x24BDBD1F8]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254B69F60;
  qword_254B69F60 = v2;

}

uint64_t sub_212E54920(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  unsigned int v9;

  v9 = 0;
  objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], a2, a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v3, (uint64_t)CFSTR("#"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCharactersToBeSkipped_(v2, v5, (uint64_t)v4);

  objc_msgSend_scanHexInt_(v2, v6, (uint64_t)&v9);
  v7 = v9;

  return v7;
}

id sub_212E54B00(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc(MEMORY[0x24BDBCED8]);
  v15 = (void *)objc_msgSend_initWithCapacity_(v13, v14, 2);
  v17 = v15;
  if (v11)
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v11, *MEMORY[0x24BDD0FC8]);
  if (v12)
    objc_msgSend_setObject_forKeyedSubscript_(v17, v16, (uint64_t)v12, *MEMORY[0x24BDD0FF0]);
  objc_msgSend_errorWithDomain_code_userInfo_(a1, v16, (uint64_t)v10, a4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t sub_212E54BD0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_errorWithDomain_code_userInfo_(a1, a2, (uint64_t)CFSTR("com.apple.iBooks.BookUtility"), a3, a4);
}

uint64_t sub_212E54BE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend_bu_errorWithDomain_code_alertTitle_alertMessage_userInfo_(a1, a2, a3, a4, a5, a6, 0);
}

id sub_212E54BEC(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  void *v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc(MEMORY[0x24BDBCED8]);
  v19 = objc_msgSend_count(v15, v17, v18);
  v21 = (void *)objc_msgSend_initWithCapacity_(v16, v20, v19 + 4);
  v23 = v21;
  if (v15)
    objc_msgSend_addEntriesFromDictionary_(v21, v22, (uint64_t)v15);
  if (v13)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v23, v22, (uint64_t)v13, *MEMORY[0x24BDD0FC8]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v13, CFSTR("BULocalizedErrorAlertTitle"));
  }
  if (v14)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v23, v22, (uint64_t)v14, *MEMORY[0x24BDD0FF0]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v25, (uint64_t)v14, CFSTR("BULocalizedErrorAlertMessage"));
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, (uint64_t)v14, *MEMORY[0x24BDD0FD8]);
  }
  objc_msgSend_errorWithDomain_code_userInfo_(a1, v22, (uint64_t)v12, a4, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id sub_212E54D34(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;

  v10 = a3;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x24BDBCED8];
  v13 = a5;
  v14 = [v12 alloc];
  v16 = (void *)objc_msgSend_initWithCapacity_(v14, v15, 2);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v13, *MEMORY[0x24BDD0FC8]);

  if (v11)
    objc_msgSend_setObject_forKeyedSubscript_(v16, v18, (uint64_t)v11, *MEMORY[0x24BDD1398]);
  objc_msgSend_errorWithDomain_code_userInfo_(a1, v18, (uint64_t)v10, a4, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id sub_212E54E08(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;

  v10 = a6;
  if (a3)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    objc_msgSend_userInfo(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BDBCED8]);
    v20 = objc_msgSend_count(v16, v18, v19);
    v23 = objc_msgSend_count(v10, v21, v22);
    v25 = (void *)objc_msgSend_initWithCapacity_(v17, v24, v20 + v23 + 1);
    v27 = v25;
    if (v16)
      objc_msgSend_addEntriesFromDictionary_(v25, v26, (uint64_t)v16);
    if (v10)
      objc_msgSend_addEntriesFromDictionary_(v27, v26, (uint64_t)v10);
    objc_msgSend_setObject_forKeyedSubscript_(v27, v26, (uint64_t)v13, *MEMORY[0x24BDD1398]);
    objc_msgSend_domain(v13, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_code(v13, v31, v32);

    objc_msgSend_bu_errorWithDomain_code_alertTitle_alertMessage_userInfo_(a1, v34, (uint64_t)v30, v33, v12, v11, v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

id sub_212E54F58(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;

  objc_msgSend_userInfo(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD0FC8];
  objc_msgSend_objectForKeyedSubscript_(v4, v6, *MEMORY[0x24BDD0FC8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v7, (uint64_t)CFSTR("BULocalizedErrorAlertTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (v9 && !objc_msgSend_isEqualToString_(v9, v10, (uint64_t)v8))
    {
      v15 = (void *)objc_msgSend_mutableCopy(v4, v12, v13);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v11, v5);
      v17 = (void *)objc_opt_class();
      objc_msgSend_domain(a1, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_code(a1, v21, v22);
      objc_msgSend_errorWithDomain_code_userInfo_(v17, v24, (uint64_t)v20, v23, v15);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }

  }
  v14 = a1;
LABEL_7:

  return v14;
}

id sub_212E55064(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  char isEqualToString;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend_bu_isCancelError(v1, v2, v3))
  {
    if (objc_msgSend_code(v1, v4, v5) == 3072)
    {
      objc_msgSend_domain(v1, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDD0B88];
      isEqualToString = objc_msgSend_isEqualToString_(v8, v10, *MEMORY[0x24BDD0B88]);

      if ((isEqualToString & 1) != 0)
        return v1;
    }
    else
    {
      v9 = *MEMORY[0x24BDD0B88];
    }
    v12 = (void *)objc_opt_class();
    v18 = *MEMORY[0x24BDD1398];
    v19[0] = v1;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v15, v9, 3072, v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v16;
  }
  return v1;
}

id sub_212E55180(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend_userInfo(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("BULocalizedErrorAlertTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v6, *MEMORY[0x24BDD0FC8]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

id sub_212E551F4(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend_userInfo(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("BULocalizedErrorAlertMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v6, *MEMORY[0x24BDD0FF0]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

uint64_t sub_212E55268(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CED9FE0);
}

uint64_t sub_212E55274(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  id v8;
  uint64_t *v9;
  uint64_t isEqualToString;
  uint64_t v11;

  v6 = a2;
  v8 = a4;
  if (a3 == 2)
  {
    isEqualToString = objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("com.apple.iBooks.BookUtility"));
  }
  else
  {
    if (a3 == 28)
    {
      v9 = (uint64_t *)MEMORY[0x24BDD1128];
    }
    else
    {
      if (a3 != 640)
      {
        v11 = 0;
        goto LABEL_10;
      }
      v9 = (uint64_t *)MEMORY[0x24BDD0B88];
    }
    isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
  }
  v11 = isEqualToString;
LABEL_10:

  return v11;
}

uint64_t sub_212E55308(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CEDA000);
}

uint64_t sub_212E55314(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  id v8;
  uint64_t *v9;
  uint64_t isEqualToString;

  v6 = a2;
  v8 = a4;
  if (a3 == -999)
  {
    v9 = (uint64_t *)MEMORY[0x24BDD1308];
  }
  else
  {
    if (a3 != 3072)
    {
      isEqualToString = 0;
      goto LABEL_7;
    }
    v9 = (uint64_t *)MEMORY[0x24BDD0B88];
  }
  isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
LABEL_7:

  return isEqualToString;
}

uint64_t sub_212E55394(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CEDA020);
}

uint64_t sub_212E553A0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  id v8;
  uint64_t *v9;
  uint64_t isEqualToString;

  v6 = a2;
  v8 = a4;
  if (a3 == 2)
  {
    v9 = (uint64_t *)MEMORY[0x24BDD1128];
  }
  else
  {
    if (a3 != 260 && a3 != 4)
    {
      isEqualToString = 0;
      goto LABEL_8;
    }
    v9 = (uint64_t *)MEMORY[0x24BDD0B88];
  }
  isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
LABEL_8:

  return isEqualToString;
}

uint64_t sub_212E55428(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CEDA040);
}

uint64_t sub_212E55434(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  id v8;
  uint64_t *v9;
  uint64_t isEqualToString;

  v6 = a2;
  v8 = a4;
  if (a3 == 516)
  {
    v9 = (uint64_t *)MEMORY[0x24BDD0B88];
  }
  else
  {
    if (a3 != 17)
    {
      isEqualToString = 0;
      goto LABEL_7;
    }
    v9 = (uint64_t *)MEMORY[0x24BDD1128];
  }
  isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
LABEL_7:

  return isEqualToString;
}

uint64_t sub_212E554B4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_, &unk_24CEDA060);
}

uint64_t sub_212E554C0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  char isEqualToString;

  v6 = a2;
  v8 = a4;
  v9 = 0;
  if (a3 <= 512)
  {
    if (a3 != 1)
    {
      if (a3 != 257)
        goto LABEL_14;
      goto LABEL_7;
    }
    if ((objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD1128]) & 1) != 0)
    {
LABEL_12:
      v9 = 1;
      goto LABEL_14;
    }
    isEqualToString = objc_msgSend_isEqualToString_(v6, v10, (uint64_t)CFSTR("NSFileProviderInternalErrorDomain"));
LABEL_11:
    if ((isEqualToString & 1) == 0)
    {
      v9 = 0;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (a3 == 513)
  {
    isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD0B88]);
    goto LABEL_11;
  }
  if (a3 == 5124)
LABEL_7:
    v9 = objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD0B88]);
LABEL_14:

  return v9;
}

void sub_212E5559C(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(id, void *, uint64_t, void *, _BYTE *);
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  char v34;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v7 = (void *)objc_msgSend_initWithObjects_(v5, v6, a1, 0);
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v34 = 0;
    if (objc_msgSend_count(v7, v9, v10))
    {
      do
      {
        objc_msgSend_firstObject(v7, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectAtIndex_(v7, v14, 0);
        objc_msgSend_userInfo(v13, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v8, v18, (uint64_t)v13) & 1) == 0)
        {
          objc_msgSend_addObject_(v8, v19, (uint64_t)v13);
          objc_msgSend_domain(v13, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend_code(v13, v23, v24);
          v4[2](v4, v22, v25, v17, &v34);

          if (!v34)
          {
            objc_msgSend_underlyingErrors(v13, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v28, v29, v30))
              objc_msgSend_addObjectsFromArray_(v7, v31, (uint64_t)v28);

          }
        }

      }
      while (objc_msgSend_count(v7, v32, v33) && !v34);
    }

  }
}

BOOL sub_212E556F0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_212E557CC;
    v9[3] = &unk_24CEDA088;
    v10 = v4;
    v11 = &v12;
    objc_msgSend_bu_enumerateErrorUsingBlock_(a1, v6, (uint64_t)v9);

    v7 = *((_BYTE *)v13 + 24) != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_212E557B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E557CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t sub_212E558C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  id v9;

  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = (uint64_t *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend_dataWithTitle_propertyList_error_(BUOSStateDataSerialization, v5, v3, v4, &v9);
  v7 = v9;

  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_212E6C300(v2, (uint64_t)v7);

  return v6;
}

void sub_212E55BF0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  nw_path_monitor_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *label;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id location;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_pathMonitor(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = nw_path_monitor_create();
    objc_msgSend_setPathMonitor_(*(void **)(a1 + 32), v6, (uint64_t)v5);

    objc_msgSend_pathMonitor(*(void **)(a1 + 32), v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_monitorQueue(*(void **)(a1 + 32), v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_set_queue(v9, v12);

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend_pathMonitor(*(void **)(a1 + 32), v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = sub_212E55DF0;
    v27 = &unk_24CEDA108;
    objc_copyWeak(&v28, &location);
    nw_path_monitor_set_update_handler(v15, &v24);

    objc_msgSend_pathMonitor(*(void **)(a1 + 32), v16, v17, v24, v25, v26, v27);
    v18 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_start(v18);

    BookUtilityLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_monitorQueue(*(void **)(a1 + 32), v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      label = dispatch_queue_get_label(v22);
      *(_DWORD *)buf = 136315138;
      v31 = label;
      _os_log_impl(&dword_212E45000, v19, OS_LOG_TYPE_DEFAULT, "Started monitoring network in queue: %s", buf, 0xCu);

    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void sub_212E55DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212E55DF0(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  const char *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend_setCurrentPath_(WeakRetained, v4, (uint64_t)v3);

}

void sub_212E55E90(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *label;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_pathMonitor(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_pathMonitor(*(void **)(a1 + 32), v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_cancel(v7);

    objc_msgSend_setPathMonitor_(*(void **)(a1 + 32), v8, 0);
    BookUtilityLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_monitorQueue(*(void **)(a1 + 32), v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = 136315138;
      label = dispatch_queue_get_label(v12);
      _os_log_impl(&dword_212E45000, v9, OS_LOG_TYPE_DEFAULT, "Stopped monitoring network in queue: %s", (uint8_t *)&v13, 0xCu);

    }
  }
}

uint64_t sub_212E55FC4()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_254B69F70 = result;
  return result;
}

uint64_t sub_212E56028()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_254B69F80 = result;
  return result;
}

void sub_212E56248(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  BUCoalescingCallBlockLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_212E6C410((uint64_t)v2, v3);

}

void sub_212E564C0(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  unsigned int v24;
  dispatch_time_t v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD);
  _QWORD block[5];
  id v37;
  _QWORD *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  id v42;
  _QWORD *v43;
  _QWORD v44[3];
  char v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_group(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  objc_msgSend_UUID(MEMORY[0x24BDD1880], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = sub_212E5677C;
  v39[3] = &unk_24CEDA1D8;
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v40 = v12;
  v41 = v13;
  v43 = v44;
  v14 = v10;
  v42 = v14;
  v15 = (void *)MEMORY[0x2199A7288](v39);
  objc_msgSend_notifyTimeoutBlock(*(void **)(a1 + 32), v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_msgSend_notifyTimeoutDurationSeconds(*(void **)(a1 + 32), v18, v19) == 0;

    if (!v21)
    {
      v24 = objc_msgSend_notifyTimeoutDurationSeconds(*(void **)(a1 + 32), v22, v23);
      v25 = dispatch_time(0, 1000000000 * v24);
      objc_msgSend_sync(*(void **)(a1 + 32), v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = sub_212E56A04;
      block[3] = &unk_24CEDA1B0;
      block[4] = *(_QWORD *)(a1 + 32);
      v38 = v44;
      v37 = v14;
      dispatch_after(v25, v28, block);

    }
  }
  BUCoalescingCallBlockLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v32;
    v48 = 2114;
    v49 = v14;
    _os_log_impl(&dword_212E45000, v29, OS_LOG_TYPE_INFO, "Invoking notify block '%{public}@' (%{public}@)", buf, 0x16u);

  }
  objc_msgSend_notifyBlock(*(void **)(a1 + 32), v33, v34);
  v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v35)[2](v35, v15);

  _Block_object_dispose(v44, 8);
}

void sub_212E56750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E5677C(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v8, (uint64_t)&v19, v23, 16);
    }
    while (v5);
  }

  objc_msgSend_sync(*(void **)(a1 + 40), v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E568F8;
  block[3] = &unk_24CEDA1B0;
  block[4] = *(_QWORD *)(a1 + 40);
  v16 = *(_OWORD *)(a1 + 48);
  v12 = (id)v16;
  v18 = v16;
  dispatch_async(v11, block);

  objc_msgSend_group(*(void **)(a1 + 40), v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v15);

}

uint64_t sub_212E568F8(uint64_t a1, const char *a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t result;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_setInvoking_(*(void **)(a1 + 32), a2, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  BUCoalescingCallBlockLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_212E45000, v3, OS_LOG_TYPE_INFO, "Notify block '%{public}@' called completion (%{public}@)", (uint8_t *)&v15, 0x16u);

  }
  result = objc_msgSend_pending(*(void **)(a1 + 32), v8, v9);
  if ((_DWORD)result)
  {
    result = objc_msgSend_nextCoalescingTime(*(void **)(a1 + 32), v11, v12);
    if (result == -1)
      return objc_msgSend__invoke(*(void **)(a1 + 32), v13, v14);
  }
  return result;
}

void sub_212E56A04(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  BUCoalescingCallBlockLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v8 = CFSTR("was");
    else
      v8 = CFSTR("wasn't");
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    v20 = 2112;
    v21 = v8;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_212E45000, v2, OS_LOG_TYPE_INFO, "Notify block '%{public}@' completion timeout fired. Completion %@ called. (%{public}@)", buf, 0x20u);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend_notifyTimeoutBlock(*(void **)(a1 + 32), v9, v10);
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v11, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("'%@' (%@)"), v15, *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v13)[2](v13, v17);

    }
  }
}

uint64_t sub_212E56C80(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__coalescingTimeExpired_, *(_QWORD *)(a1 + 40));
}

uint64_t sub_212E56C94(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__maxTimeExpired_, *(_QWORD *)(a1 + 40));
}

uint64_t sub_212E56CA0(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__coalescingTimeExpired_, *(_QWORD *)(a1 + 40));
}

id sub_212E56D84()
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
  v0 = (void *)qword_253DB2508;
  v7 = qword_253DB2508;
  if (!qword_253DB2508)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_212E56E3C;
    v3[3] = &unk_24CED9AF0;
    v3[4] = &v4;
    sub_212E56E3C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_212E56E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BUAppDataContainer *sub_212E56E3C(uint64_t a1)
{
  BUAppDataContainer *result;
  BUAppDataContainer *v3;
  SEL v4;
  id v5;

  sub_212E4A774();
  result = (BUAppDataContainer *)objc_getClass("CKContainer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_253DB2508 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (BUAppDataContainer *)sub_212E6C494();
    return -[BUAppDataContainer initWithBundleID:](v3, v4, v5);
  }
  return result;
}

void sub_212E571CC()
{
  void *v0;
  const char *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v0, v1, (uint64_t)CFSTR("BUUnitTest"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtPath_error_(v4, v5, (uint64_t)v9, 0);

  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v6, (uint64_t)v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_254B69FA0;
  qword_254B69FA0 = v7;

}

void sub_212E577B4(uint64_t a1, const char *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], a2, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void sub_212E579F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E57A18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E57A28(uint64_t a1)
{

}

void sub_212E57A30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_212E57FE8(uint64_t a1, const char *a2)
{
  return objc_msgSend_addEntry_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_212E583FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212E58420(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  BUFileIOChannel *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  _QWORD v54[4];
  NSObject *v55;
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  id obj;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_temporaryDirectoryURL(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend_fdWrapper(*(void **)(a1 + 32), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x2199A70C0]();
    objc_msgSend_createTemporaryDirectoryRelativeToURL_(*(void **)(a1 + 32), v9, *(_QWORD *)(a1 + 40));
    objc_msgSend_temporaryDirectoryURL(*(void **)(a1 + 32), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v12, v13, (uint64_t)CFSTR("Temp.zip"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [BUFileIOChannel alloc];
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v16 + 40);
      v18 = (void *)objc_msgSend_initForStreamWritingURL_error_(v15, v17, (uint64_t)v14, &obj);
      objc_storeStrong((id *)(v16 + 40), obj);
    }
    else
    {
      v18 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v18 != 0;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x3032000000;
      v61 = sub_212E57A18;
      v62 = sub_212E57A28;
      v63 = 0;
      v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      objc_msgSend_readChannel(v7, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = sub_212E58858;
      v54[3] = &unk_24CEDA2F8;
      v57 = &v58;
      v23 = v19;
      v55 = v23;
      v24 = v18;
      v56 = v24;
      objc_msgSend_readFromOffset_length_handler_(v22, v25, 0, -1, v54);

      dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend_close(v24, v26, v27);

      v28 = v59;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v59[5] == 0;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), (id)v28[5]);
        BUZipLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_path(*(void **)(a1 + 40), v30, v31);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_path(v14, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend_code((void *)v59[5], v46, v47);
          objc_msgSend_domain((void *)v59[5], v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v59[5];
          *(_DWORD *)buf = 138413314;
          v66 = v42;
          v67 = 2112;
          v68 = v45;
          v69 = 2048;
          v70 = v48;
          v71 = 2114;
          v72 = v51;
          v73 = 2112;
          v74 = v52;
          _os_log_error_impl(&dword_212E45000, v29, OS_LOG_TYPE_ERROR, "Failed to copy zip file from %@ to %@ with error: %zd %{public}@ %@", buf, 0x34u);

        }
      }

      _Block_object_dispose(&v58, 8);
      v18 = 0;
    }
    else
    {
      BUZipLog();
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
        sub_212E6C8CC(v14, v34, v35);

    }
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v36 + 24))
    {
      v37 = *(void **)(a1 + 32);
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v53 = *(id *)(v38 + 40);
      v39 = objc_msgSend_reopenWithTemporaryURL_error_(v37, v32, (uint64_t)v14, &v53);
      objc_storeStrong((id *)(v38 + 40), v53);
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      v39 = 0;
    }
    *(_BYTE *)(v36 + 24) = v39;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      objc_msgSend_removeTemporaryDirectory(*(void **)(a1 + 32), v32, v33);

    objc_autoreleasePoolPop(v8);
    objc_msgSend_waitForAccessToEnd(v7, v40, v41);

  }
}

void sub_212E58830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E58858(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = (void *)v8;
  if (v7 && !(v8 | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_212E5894C;
    v15[3] = &unk_24CEDA2D0;
    v10 = *(void **)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 32);
    objc_msgSend_writeData_handler_(v10, v11, (uint64_t)v7, v15);

  }
  if (a2)
  {
    if (v9)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(_QWORD *)(v12 + 40);
      v13 = (id *)(v12 + 40);
      if (!v14)
        objc_storeStrong(v13, a4);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void sub_212E5894C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = v7;
  if (a2)
  {
    if (v7)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(_QWORD *)(v9 + 40);
      v10 = (id *)(v9 + 40);
      if (!v11)
        objc_storeStrong(v10, a4);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void sub_212E58A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E58A7C(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void sub_212E58B54(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  BUFileIOChannel *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  int v24;

  objc_msgSend_fdWrapper(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    v8 = objc_msgSend_fileDescriptor(v4, v5, v6);
    v9 = dup(v8);
    if ((v9 & 0x80000000) != 0)
    {
      BUZipLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_212E6C98C();
    }
    else
    {
      v12 = v9;
      objc_msgSend_beginAccess(v7, v10, v11);
      v13 = [BUFileIOChannel alloc];
      objc_msgSend_accessQueue(*(void **)(a1 + 32), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = sub_212E58C94;
      v22[3] = &unk_24CEDA348;
      v24 = v12;
      v23 = v7;
      v18 = objc_msgSend_initForReadingDescriptor_queue_cleanupHandler_(v13, v17, v12, v16, v22);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      v21 = v23;
    }
  }
  else
  {
    BUZipLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_212E6C94C(v21);
  }

}

uint64_t sub_212E58C94(uint64_t a1)
{
  uint64_t v2;

  close(*(_DWORD *)(a1 + 40));
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_endAccess, v2);
}

void sub_212E58D54(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  char v11;

  objc_msgSend_fdWrapper(*(void **)(a1 + 32), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_fdWrapper(*(void **)(a1 + 32), v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_fileDescriptor(v7, v8, v9);

  }
  else
  {
    v10 = -1;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10 >= 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = read(v10, &v11, 0) == 0;
  }
}

void sub_212E590A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_212E590B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void BUCastStatsDump()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  NSLog(CFSTR("Cast per file"));
  sub_212E59174(v0, (void *)qword_254B69FA8);
  NSLog(CFSTR("\nCast per callsite"));
  sub_212E59174(v1, (void *)qword_254B69FB8);
  NSLog(CFSTR("\nCast per type"));
  sub_212E59174(v2, (void *)qword_254B69FB0);
  NSLog(CFSTR("\nTotal casts: %lu"), qword_254B69FC0);
}

void sub_212E59174(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v2 = a2;
  objc_msgSend_allKeys(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_212E59254;
  v14[3] = &unk_24CEDA370;
  v7 = v2;
  v15 = v7;
  objc_msgSend_sortedArrayUsingComparator_(v5, v8, (uint64_t)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = sub_212E592DC;
  v12[3] = &unk_24CEDA398;
  v13 = v7;
  v11 = v7;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, (uint64_t)v12);

}

uint64_t sub_212E59254(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend_objectForKeyedSubscript_(v5, v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_unsignedIntegerValue(v8, v9, v10);

  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_unsignedIntegerValue(v13, v14, v15);
  if (v11 < v16)
    return -1;
  else
    return v11 > v16;
}

void sub_212E592DC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend_objectForKeyedSubscript_(v2, v4, (uint64_t)v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_unsignedIntegerValue(v8, v5, v6);
  NSLog(CFSTR("%8lu : %@"), v7, v3);

}

void BUCastRecord(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD block[6];
  int v7;

  if (qword_254B69FD0 != -1)
    dispatch_once(&qword_254B69FD0, &unk_24CEDA3B8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E59404;
  block[3] = &unk_24CEDA3D8;
  block[4] = a1;
  block[5] = a3;
  v7 = a2;
  dispatch_sync((dispatch_queue_t)qword_254B69FC8, block);
}

void sub_212E593D8()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("BookUtility.castStats", 0);
  v1 = (void *)qword_254B69FC8;
  qword_254B69FC8 = (uint64_t)v0;

}

void sub_212E59404(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  id v40;

  ++qword_254B69FC0;
  if (!qword_254B69FA8)
  {
    v3 = objc_opt_new();
    v4 = (void *)qword_254B69FA8;
    qword_254B69FA8 = v3;

  }
  if (!qword_254B69FB0)
  {
    v5 = objc_opt_new();
    v6 = (void *)qword_254B69FB0;
    qword_254B69FB0 = v5;

  }
  if (!qword_254B69FB8)
  {
    v7 = objc_opt_new();
    v8 = (void *)qword_254B69FB8;
    qword_254B69FB8 = v7;

  }
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, *(_QWORD *)(a1 + 32));
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v9, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("%s:%lu"), *(_QWORD *)(a1 + 32), *(int *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_objectForKeyedSubscript_((void *)qword_254B69FA8, v14, (uint64_t)v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);
  objc_msgSend_numberWithUnsignedInteger_(v13, v19, v18 + 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_((void *)qword_254B69FA8, v21, (uint64_t)v20, v40);

  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_objectForKeyedSubscript_((void *)qword_254B69FB0, v23, (uint64_t)v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_unsignedIntegerValue(v24, v25, v26);
  objc_msgSend_numberWithUnsignedInteger_(v22, v28, v27 + 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_((void *)qword_254B69FB0, v30, (uint64_t)v29, v10);

  v31 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_objectForKeyedSubscript_((void *)qword_254B69FB8, v32, (uint64_t)v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_unsignedIntegerValue(v33, v34, v35);
  objc_msgSend_numberWithUnsignedInteger_(v31, v37, v36 + 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_((void *)qword_254B69FB8, v39, (uint64_t)v38, v12);

}

id BUStaticCast(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id BUStaticProtocolCast(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;

  v3 = a1;
  v4 = a2;
  v6 = v4;
  if (v4 && objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)v3))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

id BUClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  const char *v11;
  uint64_t *v12;
  id v13;
  uint64_t *v15;

  v10 = a1;
  if (!v10 || (objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v15 = &a9;
  if (a3)
  {
    do
    {
      v12 = v15++;
      if ((objc_msgSend_conformsToProtocol_(v10, v11, *v12) & 1) == 0)
        goto LABEL_7;
    }
    while (--a3);
  }
  v13 = v10;
LABEL_8:

  return v13;
}

id BUStaticClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id *v11;
  id v12;
  const char *v13;
  id v14;
  id *v16;

  v10 = a1;
  if (!v10 || (objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v16 = (id *)&a9;
  if (a3)
  {
    while (1)
    {
      v11 = v16++;
      v12 = *v11;
      if ((objc_msgSend_conformsToProtocol_(v10, v13, (uint64_t)v12) & 1) == 0)
        break;

      if (!--a3)
        goto LABEL_6;
    }

    goto LABEL_8;
  }
LABEL_6:
  v14 = v10;
LABEL_9:

  return v14;
}

CFTypeRef BUCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf)
    return 0;
  if (CFGetTypeID(cf) == a1)
    return cf;
  return 0;
}

uint64_t sub_212E599A4(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_212E5A258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212E5A280(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = MEMORY[0x2199A7288](WeakRetained[21]);
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);

    v4 = (void *)v5[21];
    v5[21] = 0;

    WeakRetained = v5;
  }

}

void sub_212E5A594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  uint64_t v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E5A5D4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E5A5E4(uint64_t a1)
{

}

uint64_t sub_212E5A5EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_addExistingEntry_, a3);
}

void sub_212E5A5F4(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = MEMORY[0x2199A7288](WeakRetained[21]);
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);

    v4 = (void *)v5[21];
    v5[21] = 0;

    WeakRetained = v5;
  }

}

void sub_212E5A660(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_212E5A8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E5A90C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend_addObject_(v4, v6, (uint64_t)v5);
  v9 = objc_msgSend_size(v5, v7, v8);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v9;
}

uint64_t sub_212E5A96C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a3;
  v7 = objc_msgSend_offset(a2, v5, v6);
  v10 = objc_msgSend_offset(v4, v8, v9);

  if (v7 < v10)
    return -1;
  else
    return v7 > v10;
}

void sub_212E5ABCC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void (**v13)(id, void *);

  if ((a2 & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_msgSend_size(*(void **)(a1 + 40), a2, a3);
    v8 = objc_msgSend_completedUnitCount(v4, v6, v7);
    objc_msgSend_setCompletedUnitCount_(v4, v9, v8 + v5);
    objc_msgSend_copyRemainingEntries_fromArchive_progress_completionHandler_(*(void **)(a1 + 48), v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v13 = (void (**)(id, void *))MEMORY[0x2199A7288](*(_QWORD *)(a1 + 72));
    if (v13)
    {
      objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v12);

    }
  }
}

void sub_212E5AD74(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;

  v7 = a5;
  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = v7;
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v7 == 0);
      v7 = v9;
    }
  }

}

void sub_212E5B46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E5B4D4(uint64_t a1)
{
  char v2;

  v2 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, char *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, 0, *(_QWORD *)(a1 + 32), &v2);
}

void sub_212E5B510(_QWORD *a1, uint64_t a2, NSObject *a3, void *a4, _BYTE *a5)
{
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;

  v12 = a4;
  if (a3)
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += dispatch_data_get_size(a3);
  (*(void (**)(void))(a1[4] + 16))();
  v8 = v12;
  if (!v12 && *a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], 0, *MEMORY[0x24BDD0B88], 3072, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    v11 = *(_QWORD *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11)
    {
      v13 = v8;
      objc_storeStrong(v10, v8);
      v8 = v13;
    }
  }

}

void sub_212E5B5E8(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;

  v2 = a2;
  v7 = 0;
  v4 = a1[4];
  if (!a2)
    v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))(v4 + 16))(v4, 1, a1[6], a1[6], v2, &v7);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void sub_212E5B7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E5B80C(uint64_t a1, const char *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend_size(a3, a2, (uint64_t)a3);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_212E5BAA4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;

  v5 = a2;
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    objc_msgSend_userInfo(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("BUZipArchiveErrorDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &stru_24CEDBD58;
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

    BUZipLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_212E6CC0C();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_212E5BB7C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  objc_msgSend_close(*(void **)(a1 + 32), v4, v5);
  if (v3)
  {
    v8 = 0;
  }
  else
  {
    if ((objc_msgSend_options(*(void **)(a1 + 40), v6, v7) & 1) != 0)
      objc_msgSend_collapseCommonRootDirectory(*(void **)(a1 + 40), v9, v10);
    v8 = *(id *)(a1 + 40);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E5BC5C;
  block[3] = &unk_24CEDA5F0;
  v11 = *(NSObject **)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v17 = v3;
  v18 = v12;
  v16 = v8;
  v13 = v3;
  v14 = v8;
  dispatch_async(v11, block);

}

uint64_t sub_212E5BC5C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_212E5BC70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    v7 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_212E5BD4C;
    v11[3] = &unk_24CEDA640;
    v11[4] = v7;
    v12 = v6;
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v13 = v8;
    v14 = v9;
    objc_msgSend_readEndOfCentralDirectoryData_eocdOffset_channel_completion_(v7, v10, a2, v5, v12, v11);

  }
}

void sub_212E5BD4C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int isEqualToString;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  const char *v17;

  v3 = a2;
  if ((objc_msgSend_options(*(void **)(a1 + 32), v4, v5) & 4) != 0
    && objc_msgSend_code(v3, v6, v7) == 259
    && (objc_msgSend_domain(v3, v6, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x24BDD0B88]),
        v9,
        isEqualToString))
  {
    objc_msgSend_userInfo(v3, v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("BUZipArchiveErrorDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      BUZipLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_212E6CC88();

      objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(*(void **)(a1 + 32), v17, *(_QWORD *)(a1 + 40), 0, 0, 0, 0, *(_QWORD *)(a1 + 48));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    if (!v3)
      objc_msgSend_setEndOfLastEntry_(*(void **)(a1 + 32), v6, *(_QWORD *)(a1 + 56));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_212E5BE74(uint64_t a1, const char *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

uint64_t sub_212E5C24C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_readZip64EndOfCentralDirectoryLocatorData_channel_completion_, a2);
}

uint64_t sub_212E5C51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_readZip64EndOfCentralDirectoryData_channel_completion_, a2);
}

uint64_t sub_212E5C88C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_readCentralDirectoryData_entryCount_completion_, a2);
}

void sub_212E5D510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  int v13;
  char v14;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_212E5D60C;
    v9[3] = &unk_24CEDA6E0;
    v9[4] = v6;
    v10 = *(id *)(a1 + 48);
    v14 = *(_BYTE *)(a1 + 76);
    v13 = *(_DWORD *)(a1 + 72);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 56);
    objc_msgSend_readLocalFileHeaderData_atOffset_channel_completion_(v6, v8, a2, v5, v7, v9);

  }
}

void sub_212E5D60C(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void (*v11)(void);
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;

  v7 = a2;
  v10 = a3;
  if (v10)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_3:
    v11();
    goto LABEL_10;
  }
  if (!v7)
  {
    if ((a4 & 1) != 0)
    {
LABEL_37:
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_3;
    }
    v25 = *(unsigned int *)(a1 + 64);
    if (*(_BYTE *)(a1 + 68))
    {
      if ((_DWORD)v25)
      {
LABEL_22:
        v30 = 1;
        v27 = 100;
        goto LABEL_23;
      }
    }
    else
    {
      v26 = objc_msgSend_compressedSize(*(void **)(a1 + 40), v8, v9);
      if (v26 >= 0x64)
        v27 = 100;
      else
        v27 = v26;
      if (v27 != v25)
      {
        if (!(_DWORD)v25)
        {
          BUZipLog();
          v41 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
            sub_212E6CDE4(a1, v41, v42);

          if (v27)
          {
            v31 = 1;
            goto LABEL_32;
          }
          goto LABEL_34;
        }
        v30 = 0;
LABEL_23:
        if (v27 > v25)
        {
          v31 = (v25 + 1);
          if (v30)
          {
            v32 = objc_msgSend_offset(*(void **)(a1 + 40), v8, v9);
            v35 = objc_msgSend_fileHeaderLength(*(void **)(a1 + 40), v33, v34);
            v39 = v32 + v31 + v35 + objc_msgSend_compressedSize(*(void **)(a1 + 40), v36, v37);
            v40 = 1;
LABEL_33:
            objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(*(void **)(a1 + 32), v38, *(_QWORD *)(a1 + 48), v39, *(_QWORD *)(a1 + 40), v31, v40, *(_QWORD *)(a1 + 56));
            goto LABEL_10;
          }
LABEL_32:
          v43 = objc_msgSend_offset(*(void **)(a1 + 40), v8, v9);
          v46 = objc_msgSend_fileHeaderLength(*(void **)(a1 + 40), v44, v45);
          v49 = objc_msgSend_compressedSize(*(void **)(a1 + 40), v47, v48);
          v40 = 0;
          v39 = v43 - v31 + v46 + v49;
          goto LABEL_33;
        }
LABEL_34:
        BUZipLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          sub_212E6CCEC();

        goto LABEL_37;
      }
    }
    BUZipLog();
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      sub_212E6CD50(a1, v28, v29);

    LODWORD(v25) = 0;
    goto LABEL_22;
  }
  objc_msgSend_addEntry_(*(void **)(a1 + 32), v8, (uint64_t)v7);
  v14 = *(void **)(a1 + 40);
  if (v14 && !*(_BYTE *)(a1 + 68) && *(_DWORD *)(a1 + 64))
  {
    v15 = objc_msgSend_compressedSize(*(void **)(a1 + 40), v12, v13);
    objc_msgSend_setCompressedSize_(v14, v16, v15 - *(unsigned int *)(a1 + 64));
  }
  v17 = objc_msgSend_offset(v7, v12, v13);
  v20 = objc_msgSend_fileHeaderLength(v7, v18, v19) + v17;
  v23 = v20 + objc_msgSend_compressedSize(v7, v21, v22);
  objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(*(void **)(a1 + 32), v24, *(_QWORD *)(a1 + 48), v23, v7, 0, 0, *(_QWORD *)(a1 + 56));
LABEL_10:

}

void sub_212E5DC3C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void (*v23)(void);
  id v24;

  v5 = a2;
  v7 = a3;
  if (v7
    || (v8 = *(void **)(a1 + 32),
        v9 = *(_QWORD *)(a1 + 40),
        v24 = 0,
        v10 = objc_msgSend_readLocalFileHeaderFilenameAndExtraFieldsData_forEntry_error_(v8, v6, (uint64_t)v5, v9, &v24),
        v7 = v24,
        !v10))
  {
    v23 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v13 = objc_msgSend_offset(*(void **)(a1 + 40), v11, v12);
    v16 = objc_msgSend_fileHeaderLength(*(void **)(a1 + 40), v14, v15) + v13;
    v19 = v16 + objc_msgSend_compressedSize(*(void **)(a1 + 40), v17, v18);
    if (v19 > objc_msgSend_endOfLastEntry(*(void **)(a1 + 32), v20, v21))
      objc_msgSend_setEndOfLastEntry_(*(void **)(a1 + 32), v22, v19);
    v23 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v23();

}

id sub_212E5E0B4(uint64_t a1, void *a2)
{
  id v3;
  BUZipInflateReadChannel *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *Channel_uncompressedSize_CRC_validateCRC;

  v3 = a2;
  v4 = [BUZipInflateReadChannel alloc];
  objc_msgSend_size(*(void **)(a1 + 32), v5, v6);
  v9 = objc_msgSend_size(*(void **)(a1 + 32), v7, v8);
  v12 = objc_msgSend_CRC(*(void **)(a1 + 32), v10, v11);
  Channel_uncompressedSize_CRC_validateCRC = (void *)objc_msgSend_initWithReadChannel_uncompressedSize_CRC_validateCRC_(v4, v13, (uint64_t)v3, v9, v12, *(unsigned __int8 *)(a1 + 40));

  return Channel_uncompressedSize_CRC_validateCRC;
}

void sub_212E5E5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E5E5FC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E5E60C(uint64_t a1)
{

}

void sub_212E5E614(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isEqualToString;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;

  objc_msgSend_pathComponents(a2, (const char *)a2, a3);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v38, v6, v7) < 2
    || (objc_msgSend_objectAtIndexedSubscript_(v38, v8, 0),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("__MACOSX")),
        v10,
        v13 = v38,
        (isEqualToString & 1) == 0))
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v14)
    {
      v31 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v33 = objc_msgSend_initWithArray_(v31, v32, (uint64_t)v38);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

      objc_msgSend_removeLastObject(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v36, v37);
      goto LABEL_13;
    }
    v17 = 0;
    if (objc_msgSend_count(v14, v8, v9))
    {
      do
      {
        if (v17 >= objc_msgSend_count(v38, v15, v16))
          break;
        objc_msgSend_objectAtIndexedSubscript_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v38, v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend_compare_options_(v18, v21, (uint64_t)v20, *(_QWORD *)(a1 + 40));

        if (v22)
          break;
        ++v17;
      }
      while (v17 < objc_msgSend_count(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v15, v16));
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = 0;

        *a4 = 1;
LABEL_13:
        v13 = v38;
        goto LABEL_14;
      }
    }
    v25 = v17 >= objc_msgSend_count(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v15, v16);
    v13 = v38;
    if (!v25)
    {
      v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v29 = objc_msgSend_count(v28, v26, v27);
      objc_msgSend_removeObjectsInRange_(v28, v30, v17, v29 - v17);
      goto LABEL_13;
    }
  }
LABEL_14:

}

void sub_212E5E7DC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (objc_msgSend_length(v15, v6, v7) <= (unint64_t)(*(_QWORD *)(a1 + 48) + 1))
  {
    objc_msgSend_entries(*(void **)(a1 + 40), v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v11, v14, (uint64_t)v5);
    goto LABEL_5;
  }
  if ((objc_msgSend_hasPrefix_(v15, v8, (uint64_t)CFSTR("__MACOSX")) & 1) == 0)
  {
    objc_msgSend_substringFromIndex_(v15, v10, *(_QWORD *)(a1 + 48) + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCollapsedName_(v5, v12, (uint64_t)v11);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v13, (uint64_t)v5, v11);
LABEL_5:

  }
}

void sub_212E5EB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E5EB68(uint64_t a1, const char *a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend_size(a3, a2, (uint64_t)a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void sub_212E5F04C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  id v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;

  if (a2 == 1)
  {
    v19 = objc_begin_catch(exception_object);
    BUZipLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_212E6CF4C();

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v21, (uint64_t)CFSTR("Exception thrown during extractToURL - toURL: %@, exception: %@"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v18 - 240) = *MEMORY[0x24BDD0BA0];
    *(_QWORD *)(v18 - 232) = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, v18 - 232, v18 - 240, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v25, (uint64_t)v24);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x212E5EF84);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_212E5F180(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_212E5F204(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_212E5F240(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_212E5F278(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  const char *v24;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend_stringByAppendingPathComponent_(v7, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_fileExistsAtPath_(a1, v11, (uint64_t)v10))
  {
    objc_msgSend_pathExtension(v8, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByDeletingPathExtension(v8, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1;
    v26 = v8;
    v20 = v8;
    do
    {
      v21 = v20;
      v22 = v10;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("%@ %d.%@"), v18, v19, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringByAppendingPathComponent_(v7, v23, (uint64_t)v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (v19 + 1);
    }
    while ((objc_msgSend_fileExistsAtPath_(a1, v24, (uint64_t)v10) & 1) != 0);

    v8 = v26;
  }
  else
  {
    v20 = v8;
  }

  return v20;
}

id sub_212E5F3AC(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const void *v4;
  const char *v5;
  uint64_t v6;
  CC_LONG v7;
  const char *v8;
  const char *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  unsigned __int8 md[16];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend_bytes(v1, v2, v3);
  v7 = objc_msgSend_length(v1, v5, v6);
  CC_MD5(v4, v7, md);
  objc_msgSend_stringWithCapacity_(MEMORY[0x24BDD16A8], v8, 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend_appendFormat_(v10, v9, (uint64_t)CFSTR("%02x"), md[i]);
  v13 = (void *)objc_msgSend_copy(v10, v9, v12);

  return v13;
}

id sub_212E5F484(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_bu_md5(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uppercaseString(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sub_212E5F4BC(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const void *v4;
  const char *v5;
  uint64_t v6;
  CC_LONG v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend_bytes(v1, v2, v3);
  v7 = objc_msgSend_length(v1, v5, v6);
  CC_SHA1(v4, v7, md);
  objc_msgSend_string(MEMORY[0x24BDD16A8], v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend_appendFormat_(v11, v10, (uint64_t)CFSTR("%02x"), md[i]);
  return v11;
}

id sub_212E5F580(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const void *v4;
  const char *v5;
  uint64_t v6;
  CC_LONG v7;
  const char *v8;
  id v9;
  uint64_t i;
  void *v11;
  const char *v12;
  void *v13;
  unsigned __int8 md[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend_bytes(v1, v2, v3);
  v7 = objc_msgSend_length(v1, v5, v6);
  CC_SHA256(v4, v7, md);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 32; ++i)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("%02x"), md[i]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v12, (uint64_t)v11);

  }
  objc_msgSend_componentsJoinedByString_(v9, v8, (uint64_t)&stru_24CEDBD58);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id sub_212E5F680(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  unint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  id v13;
  const char *v14;
  CC_SHA512_CTX v16;
  _OWORD v17[6];
  char v18;
  unsigned __int8 md[48];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_length(a1, a2, a3);
  if (v4)
  {
    v5 = (unint64_t)v4;
    memset(&v16, 0, sizeof(v16));
    CC_SHA384_Init(&v16);
    v6 = objc_retainAutorelease(a1);
    v9 = (char *)objc_msgSend_bytes(v6, v7, v8);
    if (v5 < 0x10000)
      goto LABEL_5;
    do
    {
      CC_SHA384_Update(&v16, v9, 0x10000u);
      v9 += 0x10000;
      v5 -= 0x10000;
    }
    while (v5 >> 16);
    if (v5)
LABEL_5:
      CC_SHA384_Update(&v16, v9, v5);
    CC_SHA384_Final(md, &v16);
    v10 = 0;
    v18 = 0;
    v11 = (char *)v17 + 1;
    memset(v17, 0, sizeof(v17));
    do
    {
      v12 = md[v10];
      *(v11 - 1) = a0123456789abcd[v12 >> 4];
      *v11 = a0123456789abcd[v12 & 0xF];
      v11 += 2;
      ++v10;
    }
    while (v10 != 48);
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    v4 = (void *)objc_msgSend_initWithBytes_length_encoding_(v13, v14, (uint64_t)v17, 96, 4);
  }
  return v4;
}

__CFString *sub_212E5F7D4(void *a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __CFString *v13;
  const char *v14;
  const char *v15;

  objc_msgSend_base64EncodedStringWithOptions_(a1, a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v2, v3, v4))
  {
    v5 = objc_alloc(MEMORY[0x24BDD16A8]);
    v8 = objc_msgSend_length(CFSTR("data:image/png;base64,"), v6, v7);
    v11 = objc_msgSend_length(v2, v9, v10);
    v13 = (__CFString *)objc_msgSend_initWithCapacity_(v5, v12, v11 + v8);
    objc_msgSend_appendString_(v13, v14, (uint64_t)CFSTR("data:image/png;base64,"));
    objc_msgSend_appendString_(v13, v15, (uint64_t)v2);
  }
  else
  {
    v13 = &stru_24CEDBD58;
  }

  return v13;
}

id sub_212E5F870(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unsigned __int8 *v12;
  unsigned int v13;

  v4 = objc_msgSend_length(a1, a2, a3);
  objc_msgSend_stringWithCapacity_(MEMORY[0x24BDD16A8], v5, 2 * v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(a1);
  v10 = objc_msgSend_bytes(v7, v8, v9);
  if (v4)
  {
    v12 = (unsigned __int8 *)v10;
    do
    {
      v13 = *v12++;
      objc_msgSend_appendFormat_(v6, v11, (uint64_t)CFSTR("%02x"), v13);
      --v4;
    }
    while (v4);
  }
  return v6;
}

id sub_212E5F8F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  __int16 v23;

  v3 = a3;
  if (!objc_msgSend_length(v3, v4, v5)
    || (v8 = objc_msgSend_length(v3, v6, v7), v9 = v8 >> 1, (v10 = malloc_type_malloc(v8 >> 1, 0xE37DA0DDuLL)) == 0))
  {
LABEL_11:
    v21 = 0;
    goto LABEL_12;
  }
  v11 = v10;
  v12 = objc_retainAutorelease(v3);
  v15 = objc_msgSend_UTF8String(v12, v13, v14);
  if (v8 >= 2)
  {
    v16 = (const char *)v15;
    v17 = 0;
    if (v9 <= 1)
      v18 = 1;
    else
      v18 = v8 >> 1;
    while (1)
    {
      v23 = 0;
      if (sscanf(v16, "%1hhx%1hhx", (char *)&v23 + 1, &v23) < 2)
        break;
      v11[v17++] = v23 + 16 * HIBYTE(v23);
      v16 += 2;
      if (v18 == v17)
        goto LABEL_9;
    }
    free(v11);
    goto LABEL_11;
  }
LABEL_9:
  v19 = objc_alloc(MEMORY[0x24BDBCE50]);
  v21 = (void *)objc_msgSend_initWithBytesNoCopy_length_(v19, v20, (uint64_t)v11, v9);
LABEL_12:

  return v21;
}

void sub_212E5FAB0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  v4 = (void (**)(void))MEMORY[0x2199A7288](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  if (v4)
    v4[2]();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

void sub_212E5FB40(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  const char *v13;

  if (objc_msgSend__endAssertion(*(void **)(a1 + 32), a2, a3))
  {
    BUAssertionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_212E6D0AC(v4, v5, v6, v7, v8, v9, v10, v11);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend_countingAssertProviderTransitionToZero_(WeakRetained, v13, *(_QWORD *)(a1 + 32));

  }
}

void sub_212E5FC54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t BUShouldStopInDebugger()
{
  size_t v2;
  int v3[2];
  int v4;
  pid_t v5;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!BUGrantDebuggerPermissionToStopExecution)
    return 0;
  if (qword_253DB2590 != -1)
    dispatch_once(&qword_253DB2590, &unk_24CEDA7C8);
  if (byte_253DB24E0 && BUForceUnitTestsToHaltDebugger == 0)
    return 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *(_QWORD *)v3 = 0xE00000001;
  v4 = 1;
  v5 = getpid();
  v2 = 648;
  sysctl(v3, 4u, v6, &v2, 0, 0);
  return (v7 >> 11) & 1;
}

uint64_t BUHaltDebugger()
{
  uint64_t result;

  result = BUShouldStopInDebugger();
  if ((_DWORD)result)
    __break(0);
  return result;
}

void BUReportAssertionFailureWithMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  const char *v18;
  __CFString *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  __CFString *v23;
  const char *v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  if (objc_msgSend_length(v13, v14, v15))
  {
    v17 = objc_alloc(MEMORY[0x24BDD17C8]);
    v19 = (__CFString *)objc_msgSend_initWithFormat_arguments_(v17, v18, (uint64_t)v13, &a9);
    if (!a1)
      goto LABEL_6;
LABEL_5:
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v16, a1, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastPathComponent(v20, v21, v22);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v23)
      goto LABEL_7;
    goto LABEL_6;
  }
  v19 = &stru_24CEDBD58;
  if (a1)
    goto LABEL_5;
LABEL_6:
  v23 = &stru_24CEDBD58;
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v24, a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v27 = a4;
    v28 = 2080;
    v29 = a3;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v25;
    v34 = 2112;
    v35 = v19;
    _os_log_error_impl(&dword_212E45000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s in %s - %@:%@ %@", buf, 0x34u);

  }
}

void BUCrashFinalThrow(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v9 = a1;
  if (objc_msgSend_length(v9, v10, v11))
  {
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    v15 = objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v9, &a9);
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v16, (uint64_t)CFSTR("BUCrash"), v15, 0);
  }
  else
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v12, (uint64_t)CFSTR("BUCrash"), &stru_24CEDBD58, 0);
  }
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v17);
}

BOOL BUEncodedBlockInfoAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _BOOL8 v15;

  v3 = a1;
  v4 = a2;
  v7 = objc_msgSend_encodedLength(v3, v5, v6);
  if (v7 == objc_msgSend_encodedLength(v4, v8, v9))
  {
    v12 = objc_msgSend_decodedLength(v3, v10, v11);
    v15 = v12 == objc_msgSend_decodedLength(v4, v13, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id BUEncodedBlockInfoCreate(uint64_t a1, uint64_t a2)
{
  BUEncodedBlockInfoInternal *v3;
  const char *v4;
  void *v5;
  BUEncodedBlockInfoWithDecodedLengthInternal *v7;
  const char *v8;

  if (a1 == a2)
  {
    v3 = [BUEncodedBlockInfoInternal alloc];
    v5 = (void *)objc_msgSend_initWithEncodedLength_(v3, v4, a1);
  }
  else
  {
    v7 = [BUEncodedBlockInfoWithDecodedLengthInternal alloc];
    v5 = (void *)objc_msgSend_initWithEncodedLength_decodedLength_(v7, v8, a1, a2);
  }
  return v5;
}

void sub_212E60690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E606C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = MEMORY[0x2199A7288](*(_QWORD *)(a1 + 32));
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_212E60734(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;

  close(*(_DWORD *)(a1 + 40));
  if ((_DWORD)a2)
  {
    BUZipLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_212E6D1C0(a2);

  }
  v5 = MEMORY[0x2199A7288](*(_QWORD *)(a1 + 32));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);

}

uint64_t sub_212E60A2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_212E60A3C(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void (*v8)(void *, uint64_t);
  id v9;
  _QWORD v10[4];
  _QWORD *v11;
  int v12;

  if ((_DWORD)a2)
  {
    BUZipLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_212E6D1C0(a2);

  }
  v5 = (_QWORD *)MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_212E60B20;
      v10[3] = &unk_24CEDA840;
      v11 = v5;
      v12 = a2;
      dispatch_async((dispatch_queue_t)v7, v10);

    }
    else
    {
      v8 = (void (*)(void *, uint64_t))v5[2];
      v9 = 0;
      v8(v6, a2);
    }

  }
}

uint64_t sub_212E60B20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_212E60C68(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  const char *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((_DWORD)a4)
  {
    objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x24BDD1540], v6, a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_212E60DB4(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  const char *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, *MEMORY[0x24BDD1128], a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_212E60F08(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  const char *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, *MEMORY[0x24BDD1128], a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_212E61100(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  dispatch_fd_t descriptor;
  void *v6;
  int *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend_channel(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  descriptor = dispatch_io_get_descriptor(v4);

  if (descriptor != -1 && fsync(descriptor) == -1)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = __error();
    objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v6, v8, *v7, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v9 = MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);

}

void sub_212E61254(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  dispatch_fd_t descriptor;
  void *v6;
  int *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend_channel(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  descriptor = dispatch_io_get_descriptor(v4);

  if (descriptor != -1 && ftruncate(descriptor, *(_QWORD *)(a1 + 48)) == -1)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = __error();
    objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v6, v8, *v7, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v9 = MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);

}

unint64_t BUStoreIdFromObject(void *a1)
{
  id v1;
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;

  v1 = a1;
  v2 = objc_opt_class();
  BUDynamicCast(v2, v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend_unsignedLongLongValue(v1, v3, v4);
  }
  else
  {
    v7 = objc_opt_class();
    BUDynamicCast(v7, v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (v10 = objc_retainAutorelease(v8), (v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12)) != 0))
      v6 = strtoull(v13, 0, 10);
    else
      v6 = 0;

  }
  return v6;
}

id BUStoreIdStringFromObject(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_opt_class();
  BUDynamicCast(v2, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_stringValue(v1, v4, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

BOOL BUIsStoreBookAssetID(void *a1)
{
  return BUStoreIdFromObject(a1) != 0;
}

void sub_212E6180C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E61850(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E61860(uint64_t a1)
{

}

void sub_212E61868(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSObject *v7;
  const char *v8;
  id v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  dispatch_data_t concat;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  size_t size;
  uint64_t v18;
  void *v19;
  const char *v20;
  size_t v21;
  size_t v22;
  char *v23;
  uint64_t v24;
  dispatch_data_t subrange;
  size_t v26;

  v7 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(unsigned __int8 *)(v10 + 24);
  if (v9 && *(_BYTE *)(v10 + 24))
  {
    *(_BYTE *)(v10 + 24) = 0;
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v8, *(_QWORD *)(a1 + 40), v9);
    v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v11 && (v12 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) != 0)
  {
    if (v7)
    {
      concat = dispatch_data_create_concat(v12, v7);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = concat;

      v12 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    v16 = v12;

    size = dispatch_data_get_size(v16);
    if ((a2 & 1) != 0 || size >= 0x1E)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = 0;

      v26 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend_readFileHeaderFromData_headerLength_(*(void **)(a1 + 32), v20, (uint64_t)v16, &v26);
      v21 = v26;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v26 != *(_QWORD *)(a1 + 80);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend_readWithFileHeaderLength_handler_(*(void **)(a1 + 32), v8, v21, *(_QWORD *)(a1 + 40));
        }
        else
        {
          v22 = dispatch_data_get_size(v16);
          if (v22 >= v21)
          {
            subrange = dispatch_data_create_subrange(v16, v21, v22 - v21);

            v16 = subrange;
          }
          else
          {
            BUZipLog();
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
              sub_212E6D230((void **)(a1 + 32), v23, v24);

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          }
        }
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v8, *(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    v16 = v7;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend_processData_CRC_isDone_handler_(*(void **)(a1 + 32), v8, (uint64_t)v16, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24, a2, *(_QWORD *)(a1 + 40));
  }

}

void sub_212E61CB4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  v5 = a2;
  v7 = a3;
  v17 = 0;
  if (v7
    || !objc_msgSend_readFileHeaderFromData_headerLength_(*(void **)(a1 + 32), v6, (uint64_t)v5, &v17))
  {
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v6, *(_QWORD *)(a1 + 40), v7);
  }
  else
  {
    objc_msgSend_archiveReadChannel(*(void **)(a1 + 32), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entry(*(void **)(a1 + 32), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_offset(v12, v13, v14);
    objc_msgSend_readFromOffset_length_handler_(v9, v16, v17 + *(_QWORD *)(a1 + 48) + v15, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  }
}

void sub_212E62034(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212E62060(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  const char *v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(unsigned __int8 *)(v9 + 24);
  if (v8 && *(_BYTE *)(v9 + 24))
  {
    *(_BYTE *)(v9 + 24) = 0;
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v7, *(_QWORD *)(a1 + 40), v8);
    v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v10)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend_processData_CRC_isDone_handler_(*(void **)(a1 + 32), v7, (uint64_t)v11, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, a2, *(_QWORD *)(a1 + 40));

}

uint64_t sub_212E62228(uint64_t a1, int a2, int a3, Bytef *buf, unint64_t a5)
{
  uLong v6;
  uInt v7;

  v6 = **(unsigned int **)(a1 + 32);
  if (a5 >= 0xFFFFFFFF)
    v7 = -1;
  else
    v7 = a5;
  **(_DWORD **)(a1 + 32) = crc32(v6, buf, v7);
  return 1;
}

id BUCoalescingCallBlockLog()
{
  if (qword_253DB25B0 != -1)
    dispatch_once(&qword_253DB25B0, &unk_24CEDA968);
  return (id)qword_253DB25A8;
}

void sub_212E62428()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks", "BookUtility.CoalescingCallBlock");
  v1 = (void *)qword_253DB25A8;
  qword_253DB25A8 = (uint64_t)v0;

}

id BUZipLog()
{
  if (qword_254B69FE8 != -1)
    dispatch_once(&qword_254B69FE8, &unk_24CEDA988);
  return (id)qword_254B69FE0;
}

void sub_212E62498()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks", "BookUtility.Zip");
  v1 = (void *)qword_254B69FE0;
  qword_254B69FE0 = (uint64_t)v0;

}

void sub_212E62640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E62658(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__unregisterNotificationForAccountType_, 1);
}

uint64_t sub_212E62664(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__unregisterNotificationForAccountType_, 2);
}

uint64_t sub_212E62670(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t sub_212E62684(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E62694(uint64_t a1)
{

}

uint64_t sub_212E62928(uint64_t a1, const char *a2)
{
  return objc_msgSend__registerNotificationForAccountTypeIfNeeded_(*(void **)(a1 + 32), a2, 2);
}

void sub_212E62934(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    BookUtilityLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_212E6D540();

  }
  else
  {
    v8 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_212E62A20;
    v9[3] = &unk_24CEDAA40;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v10 = v5;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v11);
  }

}

void sub_212E62A20(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_recordName(*(void **)(a1 + 32), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_copy(v4, v5, v6);
  objc_msgSend_nq_setupNotifyBlockForAccountType_currentAccountIdentifier_(WeakRetained, v8, 2, v7);

}

void sub_212E62BC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_212E62BDC(uint64_t a1)
{
  const char *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_nq_teardownNotifyBlockForAccountType_(WeakRetained, v1, 1);

}

void sub_212E62C0C(uint64_t a1)
{
  const char *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_nq_teardownNotifyBlockForAccountType_(WeakRetained, v1, 2);

}

void sub_212E62CE4(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  int v7;
  _QWORD handler[4];
  id v9;
  id location;
  int out_token;

  if (!notify_is_valid_token(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24)))
  {
    out_token = -1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = (const char *)objc_msgSend_UTF8String(CFSTR("com.apple.tcc.access.changed"), v2, v3);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_212E62DE8;
    handler[3] = &unk_24CEDA420;
    objc_copyWeak(&v9, &location);
    v6 = notify_register_dispatch(v4, &out_token, v5, handler);
    v7 = out_token;
    if (v6)
      v7 = -1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = v7;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void sub_212E62DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212E62DE8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BookUtilityLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_212E45000, v2, OS_LOG_TYPE_DEFAULT, "Received TCC access change notification, reset iCloud and Store Account caches", v7, 2u);
    }

    objc_msgSend_nq_resetAppleAccountCachedValues(WeakRetained, v3, v4);
    objc_msgSend_nq_resetStoreAccountCachedValues(WeakRetained, v5, v6);
  }

}

uint64_t sub_212E62EC8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_nq_resetAppleAccountCachedValues(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_212E62F44(uint64_t a1, const char *a2)
{
  const char *v3;

  objc_msgSend_setActiveStoreAccount_(*(void **)(a1 + 32), a2, 0);
  objc_msgSend_setLocalStoreAccount_(*(void **)(a1 + 32), v3, 0);
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setCachedIsStoreAccountManagedAppleID_, 0);
}

uint64_t sub_212E62FF4(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  const char *v4;
  uint8_t v6[16];

  BookUtilityLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_212E45000, v2, OS_LOG_TYPE_DEFAULT, "[PrimaryAppleAccount] setting primaryAppleAccount to nil", v6, 2u);
  }

  objc_msgSend_setPrimaryAppleAccount_(*(void **)(a1 + 32), v3, 0);
  return objc_msgSend_setCachedIsPrimaryAccountManagedAppleID_(*(void **)(a1 + 32), v4, 0);
}

void sub_212E63158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E63170(_QWORD *a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(a1[4] + 104);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], a2, a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeObject_(v9, v6, a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend_count(v9, v7, v8);

}

void sub_212E632D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E632EC(_QWORD *a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1[4] + 104);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], a2, a1[6]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void sub_212E63368(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  const char *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend__didReceiveNotification_(WeakRetained, v4, (uint64_t)v3);

}

void sub_212E633B0(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  const char *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend__didReceiveNotification_(WeakRetained, v4, (uint64_t)v3);

}

void sub_212E635DC(uint64_t a1)
{
  id WeakRetained;
  void **v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    kdebug_trace();
    v4 = *(_QWORD *)(a1 + 32);
    v3 = (void **)(a1 + 32);
    v6 = objc_msgSend__singleAccountTypeForNotification_(WeakRetained, v5, v4);
    BookUtilityLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
        sub_212E6D70C(v3, (const char *)v7, v9);

      objc_msgSend_notifyBlocks(WeakRetained, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v13, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v12, v15, (uint64_t)v14);
      v7 = objc_claimAutoreleasedReturnValue();

      kdebug_trace();
      objc_msgSend_signalWithCompletion_(v7, v16, (uint64_t)&unk_24CEDAB48);
      kdebug_trace();
    }
    else if (v8)
    {
      sub_212E6D690(v3, (const char *)v7, v9);
    }

    kdebug_trace();
  }

}

void sub_212E6373C(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  _QWORD v5[4];
  id v6[2];

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212E637F4;
  v5[3] = &unk_24CEDAB70;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = *(id *)(a1 + 48);
  dispatch_async(v4, v5);
  v3[2](v3);
  objc_destroyWeak(v6);

}

void sub_212E637E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_212E637F4(uint64_t a1)
{
  id WeakRetained;
  const char *v3;

  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_nq_updateAccountIdentifierAndNotifyObserversForAccountType_(WeakRetained, v3, *(_QWORD *)(a1 + 40));

  return kdebug_trace();
}

void sub_212E63CB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_212E63CDC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212E63DB0;
  v10[3] = &unk_24CEDABC0;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
}

void sub_212E63DB0(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  const char *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend__observersForAccountType_(*(void **)(a1 + 32), v3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    BookUtilityLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_212E6D788(a1 + 40, v6, v7, v8, v9, v10, v11, v12);
LABEL_27:

    goto LABEL_28;
  }
  if (WeakRetained)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v4, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountIdentifiers(WeakRetained, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_recordName(*(void **)(a1 + 48), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_copy(v20, v21, v22);

    if ((objc_msgSend_isEqualToString_(v17, v24, (uint64_t)v23) & 1) != 0)
    {
      v27 = 0;
    }
    else
    {
      if (objc_msgSend_length(v17, v25, v26) && objc_msgSend_length(v23, v28, v29))
      {
        v27 = 102;
      }
      else if (objc_msgSend_length(v17, v28, v29) || !objc_msgSend_length(v23, v28, v29))
      {
        if (objc_msgSend_length(v17, v28, v29))
        {
          if (objc_msgSend_length(v23, v28, v29))
            v27 = 0;
          else
            v27 = 101;
        }
        else
        {
          v27 = 0;
        }
      }
      else
      {
        v27 = 100;
      }
      objc_msgSend_accountIdentifiers(WeakRetained, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v30, v31, (uint64_t)v23, v6);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v32 = v5;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v39, v43, 16);
    if (v34)
    {
      v36 = v34;
      v37 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v40 != v37)
            objc_enumerationMutation(v32);
          objc_msgSend_account_didChangeWithReason_(*(void **)(*((_QWORD *)&v39 + 1) + 8 * i), v35, 2, v27, (_QWORD)v39);
        }
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v39, v43, 16);
      }
      while (v36);
    }

    goto LABEL_27;
  }
LABEL_28:

}

void sub_212E642A4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_212E642C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t sub_212E643C0(uint64_t a1, const char *a2)
{
  return objc_msgSend_removeObject_(*(void **)(*(_QWORD *)(a1 + 32) + 32), a2, *(_QWORD *)(a1 + 40));
}

void sub_212E644A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E644B8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E644C8(uint64_t a1)
{

}

void sub_212E644D0(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend_observers(*(void **)(a1 + 32), a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v9, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t sub_212E64694(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_restrictionsForBookStoreAllowedChanged_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_212E64814(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_restrictionsForExplicitContentAllowedChanged_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_212E64994(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_restrictionsForAccountModificationAllowedChanged_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_212E64B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__uq_updateRestrictionsIfNeeded, a3);
}

uint64_t sub_212E64D04(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;

  objc_msgSend_date(MEMORY[0x24BDBCE60], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastBlockCallDate_(*(void **)(a1 + 32), v5, (uint64_t)v4);

  return objc_msgSend_setRunning_(*(void **)(a1 + 32), v6, 0);
}

uint64_t sub_212E64F88(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__close(*(void **)(a1 + 32), a2, a3);
}

void sub_212E6531C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  size_t size;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  dispatch_data_t concat;
  const char *v29;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend_isStreamOutputDone(*(void **)(a1 + 32), v9, v10) & 1) == 0)
  {
    if (v8)
    {
      BUZipLog();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
        sub_212E6D7F4(v8, v12, v13);

      objc_msgSend_setStreamOutputDone_(*(void **)(a1 + 32), v14, 1);
    }
    else
    {
      if (v7)
      {
        v15 = *(void **)(a1 + 32);
        size = dispatch_data_get_size(v7);
        v19 = objc_msgSend_streamOutputLength(v15, v17, v18);
        objc_msgSend_setStreamOutputLength_(v15, v20, v19 + size);
        objc_msgSend_currentStreamOutputData(*(void **)(a1 + 32), v21, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 32);
        if (v25)
        {
          objc_msgSend_currentStreamOutputData(v26, v23, v24);
          v27 = objc_claimAutoreleasedReturnValue();
          concat = dispatch_data_create_concat(v27, v7);
          objc_msgSend_setCurrentStreamOutputData_(*(void **)(a1 + 32), v29, (uint64_t)concat);

        }
        else
        {
          objc_msgSend_setCurrentStreamOutputData_(v26, v23, (uint64_t)v7);
        }

      }
      objc_msgSend_setStreamOutputDone_(*(void **)(a1 + 32), v11, a2);
    }
  }

}

void sub_212E654FC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  id v10;

  objc_msgSend_sourceReadChannelError(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend_sourceReadChannelError(*(void **)(a1 + 32), v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v7 + 16))(v7, 1, 0, v10);

  }
  else
  {
    objc_msgSend_readQueue(*(void **)(a1 + 32), v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v8);

    objc_msgSend__readFromOffset_length_handler_(*(void **)(a1 + 32), v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
}

void sub_212E65764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212E6577C(uint64_t a1, int a2, void *a3, void *a4)
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  size_t size;
  _BOOL8 v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;

  v7 = a3;
  v8 = a4;
  objc_msgSend_sourceReadChannelError(*(void **)(a1 + 32), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_22;
  objc_msgSend_streamReadChannelSourceHandler(*(void **)(a1 + 32), v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!(v8 | v14))
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v15, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    BUZipLog();
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      sub_212E6D880((void *)v8, v17, v18);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend_setSourceReadChannelError_(*(void **)(a1 + 32), v19, v8);
    objc_msgSend_readQueue(*(void **)(a1 + 32), v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v22);

    goto LABEL_22;
  }
  if (v7)
    size = dispatch_data_get_size(v7);
  else
    size = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += size;
  if (a2)
  {
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 56);
    if (v7)
      goto LABEL_16;
  }
  else
  {
    v24 = 0;
    if (v7)
    {
LABEL_16:
      objc_msgSend_streamReadChannelSourceHandler(*(void **)(a1 + 32), v15, v16);
      v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _BOOL8, NSObject *, _QWORD))v25)[2](v25, v24, v7, 0);

      goto LABEL_17;
    }
  }
  if (v24)
    goto LABEL_16;
LABEL_17:
  if (a2)
  {
    v26 = *(void **)(a1 + 32);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = objc_msgSend_sourceOffset(v26, v15, v16);
    objc_msgSend_setSourceOffset_(v26, v29, *(_QWORD *)(v27 + 24) + v28);
    if (objc_msgSend_sourceLength(*(void **)(a1 + 32), v30, v31) != -1)
    {
      v34 = *(void **)(a1 + 32);
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v36 = objc_msgSend_sourceLength(v34, v32, v33);
      objc_msgSend_setSourceLength_(v34, v37, v36 - *(_QWORD *)(v35 + 24));
    }
    objc_msgSend__readFromOffset_length_handler_(*(void **)(a1 + 32), v32, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
  }
  v8 = 0;
LABEL_22:

}

void sub_212E65BB4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_212E65E78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t shouldCopyItemToURL;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    shouldCopyItemToURL = objc_msgSend_shouldCopyItemToURL_(*(void **)(a1 + 32), v5, (uint64_t)v4);
  else
    shouldCopyItemToURL = 1;

  return shouldCopyItemToURL;
}

void sub_212E65ED0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_msgSend_size(v11, v6, v7);
    objc_msgSend_didCopyItemToURL_fileSize_(v8, v10, (uint64_t)v5, v9);
  }

}

void sub_212E6614C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E66170(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E66180(uint64_t a1)
{

}

void sub_212E66188(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_data_t concat;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  NSObject *data2;

  data2 = a3;
  v7 = a4;
  if (data2)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(NSObject **)(v8 + 40);
    if (v9)
    {
      concat = dispatch_data_create_concat(v9, data2);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = concat;
    }
    else
    {
      v13 = data2;
      v12 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v13;
    }

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(_QWORD *)(v14 + 40);
  v15 = (id *)(v14 + 40);
  if (!v16)
  {
    objc_storeStrong(v15, a4);
    if (!a2)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (a2)
LABEL_8:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_9:

}

void sub_212E66730()
{
  __break(1u);
}

void sub_212E667D8()
{
  objc_end_catch();
  JUMPOUT(0x212E6677CLL);
}

void sub_212E670F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_212E67134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  void **v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  char v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id obj;
  id v49;
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_3;
  v9 = (void **)(a1 + 32);
  if (objc_msgSend_isSymLink(*(void **)(a1 + 32), v6, v7))
  {
    v50 = 0;
    objc_msgSend_stringWithContentsOfURL_encoding_error_(MEMORY[0x24BDD17C8], v10, (uint64_t)v5, 4, &v50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v50;
    if (!objc_msgSend_length(v11, v13, v14))
    {
      BUZipLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_212E6DD88();

      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v29 = v12;
      v17 = *(void **)(v40 + 40);
      *(_QWORD *)(v40 + 40) = v29;
      goto LABEL_24;
    }
    objc_msgSend_URLByDeletingLastPathComponent(*(void **)(a1 + 40), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x24BDBCF48], v18, (uint64_t)v11, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    if (*(_BYTE *)(a1 + 72) || objc_msgSend_bu_isContainedWithinFileURL_(v19, v20, *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(*(void **)(a1 + 40), v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v12;
      v28 = objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(v23, v27, (uint64_t)v26, v11, &v49);
      v29 = v49;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v28;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        v22 = v47;
LABEL_23:

LABEL_24:
        goto LABEL_3;
      }
      BUZipLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_path(*(void **)(a1 + 40), v42, v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v52 = v46;
        v53 = 2112;
        v54 = v11;
        v55 = 2112;
        v56 = v29;
        _os_log_error_impl(&dword_212E45000, v41, OS_LOG_TYPE_ERROR, "Error creating symlink at %@ with destination %@: %@", buf, 0x20u);

      }
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = v29;
      v45 = *(NSObject **)(v44 + 40);
      *(_QWORD *)(v44 + 40) = v12;
      v22 = v47;
    }
    else
    {
      BUZipLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_212E6DDF0(v9, (const char *)v11, v45);
    }

    v29 = v12;
    goto LABEL_23;
  }
  BUZipLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v52 = v5;
    v53 = 2112;
    v54 = v31;
    _os_log_impl(&dword_212E45000, v30, OS_LOG_TYPE_DEFAULT, "Moving temporary %@ to requested URL: %@", buf, 0x16u);
  }

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *(_QWORD *)(a1 + 40);
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v36 + 40);
  v38 = objc_msgSend_moveItemAtURL_toURL_error_(v34, v37, (uint64_t)v5, v35, &obj);
  objc_storeStrong((id *)(v36 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v38;

LABEL_3:
}

void sub_212E678D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_212E67914(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }
  else if (v7)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_212E67A04;
    v13[3] = &unk_24CEDA2D0;
    v12 = *(_OWORD *)(a1 + 32);
    v10 = (id)v12;
    v14 = v12;
    objc_msgSend_writeData_handler_(v9, v11, (uint64_t)v7, v13);

  }
  if (a2)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_212E67A04(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  if (a2)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_212E67A74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t BUBundle()
{
  uint64_t v0;
  uint64_t v1;

  v0 = MEMORY[0x24BDD1488];
  v1 = objc_opt_class();
  return MEMORY[0x24BEDD108](v0, sel_bundleForClass_, v1);
}

void sub_212E680B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E680DC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E680EC(uint64_t a1)
{

}

void sub_212E680F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_212E6835C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_count(a1, v8, v9);
  v12 = v10;
  if (v10 < 1)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v14 = v10;
    do
    {
      v15 = v14 - v13;
      if (v14 < v13)
        ++v15;
      v16 = v13 + (v15 >> 1);
      objc_msgSend_objectAtIndex_(a1, v11, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueForKeyPath_(v17, v18, (uint64_t)v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_compare_(v19, v20, (uint64_t)v6) == -1)
        v13 = v16 + 1;
      else
        v14 = v16;

    }
    while (v13 < v14);
  }
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 < v12)
  {
    objc_msgSend_objectAtIndex_(a1, v11, v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKeyPath_(v22, v23, (uint64_t)v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_compare_(v24, v25, (uint64_t)v6);

    if (!v26)
      v21 = v13;
  }

  return v21;
}

id sub_212E68480(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = objc_msgSend_count(a1, a2, a3);
  objc_msgSend_arrayWithCapacity_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_reverseObjectEnumerator(a1, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v18, v22, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_addObject_(v7, v13, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v18, v22, 16);
    }
    while (v14);
  }

  return v7;
}

uint64_t sub_212E68598(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (!objc_msgSend_caseInsensitiveCompare_(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), v7, (uint64_t)v4, (_QWORD)v12))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

uint64_t sub_212E686A0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (!objc_msgSend_localizedCaseInsensitiveCompare_(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), v7, (uint64_t)v4, (_QWORD)v12))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

id sub_212E687A8(void *a1, uint64_t a2, void *a3)
{
  unsigned int (**v4)(id, uint64_t, _BYTE *);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (id)objc_msgSend_copy(a1, v8, v9);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v10);
      v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
      v19 = 0;
      if (v4[2](v4, v16, &v19))
        objc_msgSend_addObject_(v7, v17, v16);
      if (v19)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v17, (uint64_t)&v20, v24, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

  return v7;
}

id sub_212E688F4(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_indexesOfObjectsWithOptions_passingTest_(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectsAtIndexes_(a1, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sub_212E68938(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_212E689A4;
  v4[3] = &unk_24CEDAD78;
  v4[4] = a1;
  v1 = (void *)MEMORY[0x2199A7288](v4);
  v2 = (void *)MEMORY[0x2199A7288]();

  return v2;
}

uint64_t sub_212E689A4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = *(id *)(a1 + 32);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = objc_msgSend_compareObject_toObject_(*(void **)(*((_QWORD *)&v17 + 1) + 8 * v13), v10, (uint64_t)v5, v6, (_QWORD)v17);
        if (v14)
        {
          v15 = v14;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

id sub_212E68AD0(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], a2, a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id sub_212E68B14(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = a1;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v14, v10, (uint64_t)v4, (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v6, v16, (uint64_t)v15) & 1) == 0)
        {
          objc_msgSend_addObject_(v6, v17, (uint64_t)v15);
          objc_msgSend_addObject_(v5, v18, (uint64_t)v14);
        }

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }

  return v5;
}

id sub_212E68C7C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = a1;
  if (objc_msgSend_count(v4, v6, v7))
  {
    v10 = (void *)objc_msgSend_mutableCopy(v5, v8, v9);
    objc_msgSend_removeObjectsInArray_(v10, v11, (uint64_t)v4);
    v14 = objc_msgSend_copy(v10, v12, v13);

    v5 = (id)v14;
  }

  return v5;
}

void sub_212E68CF0(id a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  void (**v9)(id, uint64_t, uint64_t);
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  const char *v43;
  unint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  const char *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void (**v67)(id, void *, uint64_t);
  id v68;
  unint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v67 = a5;
  if (v8 != a1 && v8)
  {
    v69 = objc_msgSend_count(v8, v10, v11);
    objc_msgSend_orderedSetWithArray_(MEMORY[0x24BDBCF00], v12, (uint64_t)v8);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1;
    objc_msgSend_orderedSetWithArray_(MEMORY[0x24BDBCEE0], v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v16, (uint64_t)v13);
    v17 = objc_claimAutoreleasedReturnValue();
    v68 = v8;
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v18, (uint64_t)v8);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithSet_(MEMORY[0x24BDBCEF0], v20, v19);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(v66, v21, v17);
    v64 = (void *)v17;
    objc_msgSend_setWithSet_(MEMORY[0x24BDBCEF0], v22, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v19;
    objc_msgSend_minusSet_(v23, v24, v19);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v25 = v23;
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v70, v74, 16);
    if (v27)
    {
      v29 = v27;
      v30 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v71 != v30)
            objc_enumerationMutation(v25);
          v32 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          v33 = objc_msgSend_indexOfObject_(v15, v28, v32);
          if (v33 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v34 = v33;
            objc_msgSend_removeObjectAtIndex_(v13, v28, v33);
            objc_msgSend_removeObjectAtIndex_(v15, v35, v34);
            if (v9)
              v9[2](v9, v32, v34);
          }
        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v70, v74, 16);
      }
      while (v29);
    }

    v39 = v66;
    if (objc_msgSend_count(v13, v36, v37))
    {
      v40 = 0;
      v41 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        objc_msgSend_objectAtIndex_(v13, v38, v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend_indexOfObject_(v65, v43, (uint64_t)v42);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL || v44 > v41)
        {
          ++v40;
          v41 = v44;
        }
        else
        {
          objc_msgSend_removeObjectAtIndex_(v13, v45, v40);
          objc_msgSend_removeObjectAtIndex_(v15, v46, v40);
          if (v9)
            v9[2](v9, (uint64_t)v42, v40);
          objc_msgSend_addObject_(v66, v47, (uint64_t)v42);
        }

      }
      while (v40 < objc_msgSend_count(v13, v48, v49));
    }
    v8 = v68;
    if (v69)
    {
      v50 = 0;
      v51 = 1;
      do
      {
        objc_msgSend_objectAtIndex_(v8, v38, v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_containsObject_(v39, v53, (uint64_t)v52))
        {
          v56 = v51;
          while (v56 < v69)
          {
            objc_msgSend_objectAtIndex_(v8, v54, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend_indexOfObject_(v15, v58, (uint64_t)v57);

            v8 = v68;
            ++v56;
            if (v59 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend_insertObject_atIndex_(v13, v54, (uint64_t)v52, v59);
              objc_msgSend_insertObject_atIndex_(v15, v60, (uint64_t)v52, v59);
              goto LABEL_30;
            }
          }
          v59 = objc_msgSend_count(v13, v54, v55);
          objc_msgSend_addObject_(v13, v61, (uint64_t)v52);
          objc_msgSend_addObject_(v15, v62, (uint64_t)v52);
LABEL_30:
          v39 = v66;
          if (v67)
            v67[2](v67, v52, v59);
        }

        ++v50;
        ++v51;
      }
      while (v50 != v69);
    }

  }
}

void sub_212E69464(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL sub_212E694A8(_QWORD *a1, int a2, int a3, void *__src, size_t a5)
{
  size_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a5)
    v6 = a5;
  else
    v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  memcpy(*(void **)(*(_QWORD *)(a1[6] + 8) + 24), __src, v6);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) -= v6;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v6;
  v7 = (void *)a1[4];
  v10 = objc_msgSend_offset(v7, v8, v9);
  objc_msgSend_setOffset_(v7, v11, v10 + v6);
  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
}

uint64_t sub_212E69548(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212E69558(uint64_t a1)
{

}

void sub_212E69560(uint64_t a1, char a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  void *v9;
  size_t size;
  const char *v11;
  uint64_t v12;
  size_t v13;
  NSObject *v14;
  NSObject *subrange;
  dispatch_data_t concat;
  const char *v17;
  char v18;
  _QWORD v19[5];
  __int128 v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    if (v8)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
  }
  else
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_212E6971C;
    v19[3] = &unk_24CEDADC8;
    v20 = *(_OWORD *)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 32);
    v21 = &v22;
    dispatch_data_apply(v7, v19);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      size = dispatch_data_get_size(v7);
      if (size > v23[3])
      {
        v13 = size;
        objc_msgSend_leftoverData(*(void **)(a1 + 32), v11, v12);
        v14 = objc_claimAutoreleasedReturnValue();
        subrange = dispatch_data_create_subrange(v7, v23[3], v13 - v23[3]);
        concat = dispatch_data_create_concat(v14, subrange);
        objc_msgSend_setLeftoverData_(*(void **)(a1 + 32), v17, (uint64_t)concat);

      }
    }
    _Block_object_dispose(&v22, 8);
  }
  v18 = a2 ^ 1;
  if (v9)
    v18 = 0;
  if ((v18 & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }

}

void sub_212E69704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_212E6971C(_QWORD *a1, int a2, uint64_t a3, void *__src, size_t a5)
{
  size_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a5)
    v7 = a5;
  else
    v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  memcpy(*(void **)(*(_QWORD *)(a1[6] + 8) + 24), __src, v7);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) -= v7;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v7;
  v8 = (void *)a1[4];
  v11 = objc_msgSend_offset(v8, v9, v10);
  objc_msgSend_setOffset_(v8, v12, v11 + v7);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v7 + a3;
  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
}

void sub_212E69C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_212E69C54(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(unsigned __int8 *)(v10 + 24);
  if (v9 && *(_BYTE *)(v10 + 24))
  {
    *(_BYTE *)(v10 + 24) = 0;
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v7, *(_QWORD *)(a1 + 40), v9);
    v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_DWORD *)(v12 + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        objc_msgSend_prepareBuffer(*(void **)(a1 + 32), v7, v8);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend_processData_inflateResult_CRC_isDone_handler_(*(void **)(a1 + 32), v7, (uint64_t)v13, v12 + 24, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24, a2, *(_QWORD *)(a1 + 40));
    }
  }

}

void sub_212E69F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212E69F20(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int **v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;
  int v19;
  size_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  unsigned int *v25;
  uInt v26;
  _QWORD *v27;
  const void *v28;
  size_t v29;
  dispatch_data_t v30;
  const char *v31;
  uint64_t v32;
  dispatch_data_t subrange;
  dispatch_data_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;

  v8 = a2;
  if (HIDWORD(a5))
  {
    BUZipLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_212E6E048(a5, v9);
LABEL_4:

LABEL_31:
    v12 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_32;
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v10 + 40))
    goto LABEL_31;
  *(_DWORD *)(v10 + 16) = a5;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = a4;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = 1;
  if (*(_DWORD *)(v11 + 16))
  {
    v13 = (int **)(a1 + 56);
    v14 = (void *)*MEMORY[0x24BDAC980];
    while (1)
    {
      if (**v13)
      {
LABEL_30:
        v12 = 1;
        goto LABEL_32;
      }
      v15 = inflate((z_streamp)(v11 + 8), 0);
      **v13 = v15;
      if ((v15 + 5) > 6 || ((1 << (v15 + 5)) & 0x61) == 0)
        break;
      v19 = v15;
      v11 = *(_QWORD *)(a1 + 32);
      if (v19 == 1 || !*(_DWORD *)(v11 + 40))
      {
        v20 = objc_msgSend_outBufferSize((void *)v11, v16, v17) - *(unsigned int *)(*(_QWORD *)(a1 + 32) + 40);
        if (objc_msgSend_validateCRC(*(void **)(a1 + 32), v21, v22))
        {
          v25 = *(unsigned int **)(a1 + 64);
          if (v25)
          {
            if (v20 >= 0xFFFFFFFF)
              v26 = -1;
            else
              v26 = v20;
            **(_DWORD **)(a1 + 64) = crc32(*v25, *(const Bytef **)(*(_QWORD *)(a1 + 32) + 120), v26);
          }
        }
        v27 = *(_QWORD **)(a1 + 32);
        v28 = (const void *)v27[15];
        v29 = objc_msgSend_outBufferSize(v27, v23, v24);
        v30 = dispatch_data_create(v28, v29, 0, v14);
        if (objc_msgSend_outBufferSize(*(void **)(a1 + 32), v31, v32) == v20)
          subrange = v30;
        else
          subrange = dispatch_data_create_subrange(v30, 0, v20);
        v34 = subrange;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        objc_msgSend_setOutBufferSize_(*(void **)(a1 + 32), v35, 0);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
        v38 = objc_msgSend_remainingUncompressedSize(*(void **)(a1 + 32), v36, v37);
        v40 = 0;
        v41 = *(void **)(a1 + 32);
        if (v38 > v20)
          v40 = objc_msgSend_remainingUncompressedSize(*(void **)(a1 + 32), v39, 0) - v20;
        objc_msgSend_setRemainingUncompressedSize_(v41, v39, v40);
        if (v19 != 1)
          objc_msgSend_prepareBuffer(*(void **)(a1 + 32), v42, v43);

        v11 = *(_QWORD *)(a1 + 32);
      }
      if (!*(_DWORD *)(v11 + 16))
        goto LABEL_30;
    }
    BUZipLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_212E6E0BC((int **)(a1 + 56), v9);
    goto LABEL_4;
  }
LABEL_32:

  return v12;
}

void sub_212E6A2D8(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v3 = (objc_class *)MEMORY[0x24BDBCE70];
  v4 = a3;
  v5 = [v3 alloc];
  v11 = (id)objc_msgSend_initWithObjectsAndKeys_(v5, v6, (uint64_t)v4, CFSTR("BUErrorExceptionUserInfoKey"), 0);

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v7, (uint64_t)CFSTR("BUErrorException"), CFSTR("NSError exception"), v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise(v8, v9, v10);

}

id sub_212E6A360(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;

  objc_msgSend_userInfo(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("BUErrorExceptionUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

id sub_212E6A3D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5))
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("%@://%@"), CFSTR("ibooks"), CFSTR("assetid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLWithString_(v7, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_URLByAppendingPathComponent_(v10, v11, (uint64_t)v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t sub_212E6A480(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;

  objc_msgSend_scheme(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v4, v8, v9) && !objc_msgSend_caseInsensitiveCompare_(v4, v10, (uint64_t)CFSTR("ibooks")))
  {
    objc_msgSend_pathComponents(a1, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v7, v15, v16))
    {
      v13 = objc_msgSend_bu_storeURLTypeFromHost_(a1, v17, (uint64_t)v7);
    }
    else if ((unint64_t)objc_msgSend_count(v14, v17, v18) < 3)
    {
      v13 = 3;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v14, v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_bu_storeURLTypeFromHost_(a1, v21, (uint64_t)v20);

    }
  }
  else
  {
    v13 = 3;
  }

  return v13;
}

id sub_212E6A570(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;

  objc_msgSend_pathComponents(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_bu_storeURLType(a1, v5, v6) == 3)
    goto LABEL_2;
  objc_msgSend_host(a1, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v10, v11, v12);

  if (v13)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v14, 1);
LABEL_7:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend_count(v4, v14, v15) >= 3)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v16, 2);
    goto LABEL_7;
  }
LABEL_2:
  v9 = 0;
LABEL_8:

  return v9;
}

id sub_212E6A60C(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;

  objc_msgSend_host(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_caseInsensitiveCompare_(v4, v5, (uint64_t)CFSTR("play"));

  if (v6)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend_bu_dictionaryForQueryItems(a1, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v10, v11, (uint64_t)CFSTR("pid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id sub_212E6A688(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;

  objc_msgSend_bu_isbnForURI(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v3, v4, v5))
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("itms-books://itunes.apple.com/book/isbn%@"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLWithString_(v7, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_212E6A714(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD block[4];
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;

  v4 = a3;
  objc_msgSend_bu_isbnForURI(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v7, v8, v9))
  {
    objc_msgSend_defaultBag(BUBag, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_booksISBNURL(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_212E6A854;
    v23[3] = &unk_24CEDAEB8;
    v16 = &v24;
    v24 = v7;
    v25 = v4;
    v17 = v4;
    objc_msgSend_valueWithCompletion_(v15, v18, (uint64_t)v23);

    v19 = v25;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212E6A934;
    block[3] = &unk_24CED9B90;
    v16 = (id *)&v22;
    v22 = v4;
    v20 = v4;
    dispatch_async(v19, block);
  }

}

void sub_212E6A854(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  if (!objc_msgSend_length(v14, v3, v4)
    || (v6 = objc_msgSend_rangeOfString_(v14, v5, (uint64_t)CFSTR("{isbn}")), v6 == 0x7FFFFFFFFFFFFFFFLL)
    && (v6 = objc_msgSend_rangeOfString_(v14, v7, (uint64_t)CFSTR("%@")), v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_stringByReplacingCharactersInRange_withString_(v14, v7, v6, v7, *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLWithString_(v9, v11, (uint64_t)v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = MEMORY[0x2199A7288](*(_QWORD *)(a1 + 40));
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v8);

}

void sub_212E6A934(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  id v2;

  v1 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A7288](*(_QWORD *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    v1[2](v1, 0);
    v1 = (void (**)(_QWORD, _QWORD))v2;
  }

}

uint64_t sub_212E6A96C(void *a1, const char *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int isDirectory;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  int ResourceValue_forKey_error;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  int v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  char v56;
  _BYTE v57[128];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend_path(a1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v5, v9, (uint64_t)v8, &v56);

  if (v56)
  {
    v47 = v5;
    v13 = *MEMORY[0x24BDBCC60];
    v14 = *MEMORY[0x24BDBCCE8];
    v58[0] = *MEMORY[0x24BDBCC60];
    v58[1] = v14;
    v48 = v14;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, (uint64_t)v58, 2);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = sub_212E6AC34;
    v55[3] = &unk_24CEDAED8;
    v55[4] = a3;
    v46 = (void *)v15;
    objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v18, v19, (uint64_t)a1, v15, 0, v55);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v21 = v20;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v51, v57, 16);
    if (v23)
    {
      v25 = v23;
      v26 = 0;
      v27 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v52 != v27)
            objc_enumerationMutation(v21);
          v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v50 = 0;
          ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v29, v24, (uint64_t)&v50, v13, a3);
          v31 = v50;
          v34 = v31;
          if (!ResourceValue_forKey_error)
            goto LABEL_19;
          if ((objc_msgSend_BOOLValue(v31, v32, v33) & 1) == 0)
          {
            v49 = 0;
            v36 = objc_msgSend_getResourceValue_forKey_error_(v29, v35, (uint64_t)&v49, v48, a3);
            v37 = v49;
            v40 = v37;
            if (!v36)
            {

LABEL_19:
              goto LABEL_20;
            }
            v26 += objc_msgSend_unsignedLongLongValue(v37, v38, v39);

          }
        }
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v51, v57, 16);
        if (v25)
          continue;
        break;
      }
    }
    else
    {
      v26 = 0;
    }
LABEL_20:

    v41 = v46;
    v5 = v47;
    goto LABEL_21;
  }
  if (isDirectory)
  {
    objc_msgSend_path(a1, v11, v12);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_attributesOfItemAtPath_error_(v5, v42, (uint64_t)v41, a3);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_fileSize(v21, v43, v44);
LABEL_21:

    goto LABEL_22;
  }
  v26 = 0;
LABEL_22:

  return v26;
}

uint64_t sub_212E6AC34(uint64_t a1, int a2, id a3)
{
  if (*(_QWORD *)(a1 + 32))
    **(_QWORD **)(a1 + 32) = objc_retainAutorelease(a3);
  return 0;
}

id sub_212E6AC6C(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_absoluteString(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v3, v4, 2483028224);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_bu_sha1(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t sub_212E6ACC0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t hasPrefix;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;

  v4 = a3;
  if (objc_msgSend_isFileURL(a1, v5, v6) && objc_msgSend_isFileURL(v4, v7, v8))
  {
    objc_msgSend_baseURL(a1, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v14 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend_relativeString(a1, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_baseURL(a1, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByStandardizingPath(v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v14, v22, (uint64_t)v15, 0, v21);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = a1;
    }
    objc_msgSend_path(v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByStandardizingPath(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByResolvingSymlinksInPath(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_path(v4, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByStandardizingPath(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByResolvingSymlinksInPath(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_hasSuffix_(v42, v43, (uint64_t)CFSTR("/")) & 1) == 0)
    {
      objc_msgSend_stringByAppendingString_(v42, v44, (uint64_t)CFSTR("/"));
      v45 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)v45;
    }
    hasPrefix = objc_msgSend_hasPrefix_(v33, v44, (uint64_t)v42);

  }
  else
  {
    hasPrefix = 0;
  }

  return hasPrefix;
}

id sub_212E6AE4C(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  int v34;
  int v35;
  int v36;
  unint64_t v37;
  __int16 v38;
  id v39;
  _BYTE v40[6];
  _WORD v41[2];
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_scheme(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_caseInsensitiveCompare_(v4, v5, (uint64_t)CFSTR("urn"));

  if (v6)
    return 0;
  objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x24BDD1808], v7, (uint64_t)a1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByString_(v12, v13, (uint64_t)CFSTR(":"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v14, v15, v16) == 2)
  {
    objc_msgSend_objectAtIndex_(v14, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_caseInsensitiveCompare_(v18, v19, (uint64_t)CFSTR("isbn"));

    v22 = 0;
    if (!v20)
    {
      objc_msgSend_objectAtIndex_(v14, v21, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v23, v24, (uint64_t)CFSTR("-"), &stru_24CEDBD58);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_length(v25, v26, v27) == 10)
      {
        v41[1] = unk_212E71D08;
        v42 = unk_212E71D0A;
        objc_msgSend_getCharacters_range_(v25, v28, (uint64_t)v41, 0, 9, *(_QWORD *)L"978");
        v31 = 0;
        v32 = 0;
        v33 = 1;
        do
        {
          v34 = *(unsigned __int16 *)&v40[2 * v31];
          if ((v34 - 48) >= 0xA)
          {
            while (v31 != 11)
            {
              v34 = *(unsigned __int16 *)&v40[2 * v31++ + 2];
              if ((v34 - 48) <= 9)
              {
                v33 = 0;
                goto LABEL_11;
              }
            }
            goto LABEL_24;
          }
LABEL_11:
          v35 = v34 - 48;
          if ((v31 & 1) != 0)
            v36 = 3;
          else
            v36 = 1;
          v32 += (v35 * v36);
          ++v31;
        }
        while (v31 != 12);
        if ((v33 & 1) == 0)
          goto LABEL_24;
        v37 = v32 % 0xA;
        if (v37)
          v38 = 58 - v37;
        else
          v38 = 48;
        HIWORD(v42) = v38;
        objc_msgSend_stringWithCharacters_length_(MEMORY[0x24BDD17C8], v30, (uint64_t)v40, 13);
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend_length(v25, v28, v29) != 13)
        {
LABEL_24:
          v22 = 0;
          goto LABEL_25;
        }
        v39 = v25;
      }
      v22 = v39;
LABEL_25:

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

uint64_t sub_212E6B0B8(void *a1, const char *a2, uint64_t a3)
{
  const char *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  objc_msgSend_bu_utType(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    BookUtilityLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_212E6E134();

  }
  v6 = objc_msgSend_conformsToType_(v4, v3, *MEMORY[0x24BDF8368]);

  return v6;
}

uint64_t sub_212E6B138(void *a1, const char *a2, uint64_t a3)
{
  const char *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  objc_msgSend_bu_utType(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    BookUtilityLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_212E6E198();

  }
  v6 = objc_msgSend_conformsToType_(v4, v3, *MEMORY[0x24BDF83C0]);

  return v6;
}

id sub_212E6B1B8(void *a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDBCBE8];
  v13[0] = *MEMORY[0x24BDBCBE8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend_resourceValuesForKeys_error_(a1, v5, (uint64_t)v4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v7)
  {
    BookUtilityLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_212E6E23C();
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v8, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_6;
    BookUtilityLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_212E6E1FC(v9);
  }

  v10 = 0;
LABEL_6:

  return v10;
}

uint64_t sub_212E6B2F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5))
  {
    if (objc_msgSend_caseInsensitiveCompare_(v3, v6, (uint64_t)CFSTR("assetid")))
    {
      if (objc_msgSend_caseInsensitiveCompare_(v3, v7, (uint64_t)CFSTR("storeid")))
      {
        if (objc_msgSend_caseInsensitiveCompare_(v3, v8, (uint64_t)CFSTR("audiobookstoreid")))
          v9 = 3;
        else
          v9 = 2;
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 3;
  }

  return v9;
}

id sub_212E6B380(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x24BDD1808], v3, a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_queryItems(v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v25, v29, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_value(v15, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v15, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v2, v20, (uint64_t)v16, v19);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v25, v29, 16);
    }
    while (v12);
  }

  v23 = (void *)objc_msgSend_copy(v2, v21, v22);
  return v23;
}

id sub_212E6B4F4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v37 = v5;
  objc_msgSend_componentsSeparatedByString_(v5, v7, (uint64_t)CFSTR("&"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, v43, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v40;
    v15 = CFSTR("=");
    do
    {
      v16 = 0;
      v38 = v13;
      do
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v8);
        objc_msgSend_componentsSeparatedByString_(*(void **)(*((_QWORD *)&v39 + 1) + 8 * v16), v11, (uint64_t)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v17, v18, v19) == 2)
        {
          objc_msgSend_firstObject(v17, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastObject(v17, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v25;
          if ((_DWORD)a4)
          {
            objc_msgSend_stringByRemovingPercentEncoding(v25, v26, v27);
            v29 = v14;
            v30 = v15;
            v31 = v8;
            v32 = v6;
            v33 = a4;
            v34 = objc_claimAutoreleasedReturnValue();

            v28 = (void *)v34;
            a4 = v33;
            v6 = v32;
            v8 = v31;
            v15 = v30;
            v14 = v29;
            v13 = v38;
          }
          objc_msgSend_setObject_forKeyedSubscript_(v6, v26, (uint64_t)v28, v22);

        }
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v39, v43, 16);
    }
    while (v13);
  }
  v35 = (void *)objc_msgSend_copy(v6, v11, v12);

  return v35;
}

id sub_212E6B6DC()
{
  if (qword_254B69FF8 != -1)
    dispatch_once(&qword_254B69FF8, &unk_24CEDAEF8);
  return (id)qword_254B69FF0;
}

uint64_t sub_212E6B71C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD1690], a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_mutableCopy(v3, v4, v5);
  v7 = (void *)qword_254B69FF0;
  qword_254B69FF0 = v6;

  return MEMORY[0x24BEDD108](qword_254B69FF0, sel_removeCharactersInString_, CFSTR("?=&+"));
}

id sub_212E6B76C(void *a1, uint64_t a2, void *a3, int a4)
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  objc_msgSend_allKeys(v4, v7, v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v32, v36, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v33;
    v28 = v5;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v6, v11, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4)
        {
          objc_msgSend_bu_URLQueryParameterValueAllowedCharacterSet(a1, v16, v17);
          v19 = v13;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v18, v21, (uint64_t)v20);
          v22 = objc_claimAutoreleasedReturnValue();

          v13 = v19;
          v5 = v28;
          v18 = (void *)v22;
        }
        if (objc_msgSend_length(v5, v16, v17))
          objc_msgSend_appendFormat_(v5, v23, (uint64_t)CFSTR("&%@=%@"), v15, v18);
        else
          objc_msgSend_appendFormat_(v5, v23, (uint64_t)CFSTR("%@=%@"), v15, v18);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v32, v36, 16);
    }
    while (v12);
  }

  v26 = (void *)objc_msgSend_copy(v5, v24, v25);
  return v26;
}

id sub_212E6B930(void *a1, uint64_t a2, void *a3, int a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  xattr_flags_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  size_t v21;
  __int128 *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_path(a1, v7, v8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend_UTF8String(v9, v10, v11);

  v13 = objc_retainAutorelease(v6);
  v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
  if (a4)
    v17 = 8;
  else
    v17 = 0;
  v18 = xattr_name_with_flags(v16, v17);
  if (v18)
  {
    v19 = v18;
    v20 = getxattr(v12, v18, 0, 0x100uLL, 0, 0);
    if (v20 != -1)
    {
      v21 = v20;
      if (v20 <= 0xFF)
      {
        v22 = &v29;
        getxattr(v12, v19, &v29, 0x100uLL, 0, 0);
      }
      else
      {
        v22 = (__int128 *)malloc_type_calloc(v20 + 1, 1uLL, 0x100004077774924uLL);
        getxattr(v12, v19, v22, v21, 0, 0);
        if (!v22)
        {
LABEL_16:
          v24 = 0;
LABEL_23:
          free(v19);
          goto LABEL_24;
        }
      }
      if (*(_BYTE *)v22)
      {
        v26 = objc_alloc(MEMORY[0x24BDD17C8]);
        v24 = (void *)objc_msgSend_initWithCString_encoding_(v26, v27, (uint64_t)v22, 4);
      }
      else
      {
        v24 = 0;
      }
      if (v22 != &v29)
        free(v22);
      goto LABEL_23;
    }
    if (*__error() != 93)
    {
      BookUtilityLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_212E6E334();

    }
    goto LABEL_16;
  }
  BookUtilityLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_212E6E2B8();

  v24 = 0;
LABEL_24:

  return v24;
}

uint64_t sub_212E6BB6C(void *a1, uint64_t a2, void *a3, void *a4, int a5)
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  size_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  xattr_flags_t v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;

  v8 = a3;
  v9 = objc_retainAutorelease(a4);
  v12 = (const char *)objc_msgSend_UTF8String(v9, v10, v11);
  v13 = strlen(v12);
  v14 = objc_retainAutorelease(v8);
  v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16);
  if (a5)
    v18 = 8;
  else
    v18 = 0;
  v19 = xattr_name_with_flags(v17, v18);
  if (v19)
  {
    v22 = v19;
    objc_msgSend_path(a1, v20, v21);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (const char *)objc_msgSend_UTF8String(v23, v24, v25);
    v27 = setxattr(v26, v22, v12, v13, 0, 0);

    free(v22);
    if (!v27)
    {
      v29 = 1;
      goto LABEL_12;
    }
    BookUtilityLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_212E6E41C();
  }
  else
  {
    BookUtilityLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_212E6E3B0();
  }

  v29 = 0;
LABEL_12:

  return v29;
}

BOOL sub_212E6BC94(void *a1, uint64_t a2, void *a3, int a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  xattr_flags_t v10;
  char *v11;
  const char *v12;
  uint64_t v13;
  _BOOL8 v14;
  char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  int v20;
  NSObject *v21;

  v6 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
  if (a4)
    v10 = 8;
  else
    v10 = 0;
  v11 = xattr_name_with_flags(v9, v10);
  v14 = v11 == 0;
  if (!v11)
  {
    BookUtilityLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_212E6E488();
    goto LABEL_12;
  }
  v15 = v11;
  objc_msgSend_path(a1, v12, v13);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (const char *)objc_msgSend_UTF8String(v16, v17, v18);
  v20 = removexattr(v19, v15, 0);

  free(v15);
  if (v20 && *__error() != 93)
  {
    BookUtilityLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_212E6E4F4();
LABEL_12:

    goto LABEL_13;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

void sub_212E6BDA0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_212E6BE24(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_212E6BE38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

int *sub_212E6BE48()
{
  return __error();
}

void sub_212E6BE5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E4C6C8(&dword_212E45000, a2, a3, "Error converting offline cache to AMSSnapshotBag: %{public}@", a5, a6, a7, a8, 2u);
}

void sub_212E6BEC4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_212E45000, log, OS_LOG_TYPE_FAULT, "Loading default bag from offline cache involves sync disk I/O and shouldn't be executed on main thread.", v1, 2u);
}

void sub_212E6BF04(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "No bag value available for isAudiobooksStoreEnabled. Defaulting to enabled.", v1, 2u);
}

void sub_212E6BF44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E4C6C8(&dword_212E45000, a2, a3, "Failed to retrieve the value for isAudiobooksStoreEnabled. %@", a5, a6, a7, a8, 2u);
}

void sub_212E6BFAC(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "Failed to remove BUTemporaryDirectory. Error: %@, path: %@", (uint8_t *)&v4, 0x16u);
}

void sub_212E6C034(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "BUOnboardingAllBundleIDs: Failed to get personalization ID. error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_212E6C0A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E522DC(&dword_212E45000, a1, a3, "Entry size is 64-bit, even though the size was written as 32-bit.", a5, a6, a7, a8, 0);
  sub_212E522EC();
}

void sub_212E6C0D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E522DC(&dword_212E45000, a1, a3, "Zip entry name is too long", a5, a6, a7, a8, 0);
  sub_212E522EC();
}

void sub_212E6C108(void *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend_code(a1, a2, a3);
  objc_msgSend_domain(a1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218498;
  v10 = v5;
  v11 = 2114;
  v12 = v8;
  v13 = 2112;
  v14 = a1;
  _os_log_error_impl(&dword_212E45000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Couldn't write Zip: %zd %{public}@ %@", (uint8_t *)&v9, 0x20u);

}

void sub_212E6C1CC(void *a1, char *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_domain(a1, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v5;
  v10 = 2048;
  v11 = objc_msgSend_code(a1, v6, v7);
  v12 = 2112;
  v13 = a1;
  _os_log_error_impl(&dword_212E45000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Error reading carrier bundle value: {d=%{public}@ c=%ld, (%@)}", (uint8_t *)&v8, 0x20u);

}

void sub_212E6C28C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "No subscription context available: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_212E6C300(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412546;
  v4 = v2;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_212E45000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[BUOSStateHandler] State handler '%@' failed to serialize data, error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_212E6C38C()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_212E45000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error consuming extension for container: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_212E6C410(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109378;
  v2[1] = 5;
  v3 = 2114;
  v4 = a1;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "BUCoalescingCallBlock notification block did not call its completion handler after %hus.  Block description=%{public}@", (uint8_t *)v2, 0x12u);
}

uint64_t sub_212E6C494()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_212E6C4B8(v0);
}

uint64_t sub_212E6C4B8()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return sub_212E6C4D8(v0);
}

void sub_212E6C4D8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "BUAppDataContainer: Error executing query: %s", (uint8_t *)&v2, 0xCu);
}

void sub_212E6C54C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "BUAppDataContainer: Failed to obtain sandbox token", v1, 2u);
}

void sub_212E6C58C(void *a1, char *a2, uint64_t a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_identifier(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_212E45000, (os_log_t)a2, OS_LOG_TYPE_FAULT, "Unable to locate container URL for %@. Falling back to temporary url", (uint8_t *)&v5, 0xCu);

}

void sub_212E6C620(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_path(a2, (const char *)a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E590C8();
  sub_212E590B4(&dword_212E45000, v4, v5, "%@: initWithURL: %@", v6, v7, v8, v9, v10);

  sub_212E590E0();
}

void sub_212E6C6A4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_code(a2, (const char *)a2, (uint64_t)a3);
  objc_msgSend_domain(a2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = a1;
  v12 = 2048;
  v13 = v6;
  v14 = 2114;
  v15 = v9;
  v16 = 2112;
  v17 = a2;
  _os_log_error_impl(&dword_212E45000, a3, OS_LOG_TYPE_ERROR, "Couldn't get size for %@: %zd %{public}@ %@", (uint8_t *)&v10, 0x2Au);

}

void sub_212E6C784(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_path(a2, (const char *)a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E590C8();
  sub_212E590B4(&dword_212E45000, v4, v5, "%@: openWithURL: %@", v6, v7, v8, v9, v10);

  sub_212E590E0();
}

void sub_212E6C808(void *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend_code(a1, a2, a3);
  objc_msgSend_domain(a1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218498;
  v10 = v5;
  v11 = 2114;
  v12 = v8;
  v13 = 2112;
  v14 = a1;
  _os_log_error_impl(&dword_212E45000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Failed to remove temporary directory with error: %zd %{public}@ %@", (uint8_t *)&v9, 0x20u);

}

void sub_212E6C8CC(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_path(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E590A0(&dword_212E45000, v4, v5, "Failed to write to temporary zip file: %@", v6, v7, v8, v9, 2u);

  sub_212E590F0();
}

void sub_212E6C94C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "File isn't open", v1, 2u);
}

void sub_212E6C98C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  strerror(*v0);
  sub_212E590A0(&dword_212E45000, v1, v2, "Failed to create read channel with error: %{public}s", v3, v4, v5, v6, 2u);
  sub_212E590F0();
}

void sub_212E6CA04(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "Could not perform copyToURL: %@", (uint8_t *)&v2, 0xCu);
}

void sub_212E6CA78(void *a1, const char *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_fromURL(a1, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 141558530;
  v7 = 1752392040;
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_212E45000, a3, OS_LOG_TYPE_ERROR, "Failed to stat URL information. url: %{mask.hash}@ error: %@", (uint8_t *)&v6, 0x20u);

}

void sub_212E6CB34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F264();
  sub_212E5F240(&dword_212E45000, v0, v1, "%@: %{public}s", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6CBA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F264();
  sub_212E5F240(&dword_212E45000, v0, v1, "%@: %{public}s", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6CC0C()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  sub_212E5F258();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_212E45000, v1, OS_LOG_TYPE_FAULT, "Failed to read ZIP archive. %{public}@, error: %@", v2, 0x16u);
  sub_212E5F238();
}

void sub_212E6CC88()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_212E5F258();
  sub_212E5F204(&dword_212E45000, v0, v1, "Failed first attempt to read ZIP archive, but we will attempt to recover. %{public}@", v2);
  sub_212E5F238();
}

void sub_212E6CCEC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_212E5F258();
  sub_212E5F204(&dword_212E45000, v0, v1, "Attempted to adjust the offset for %llu times. Will assume the ZIP is complete.", v2);
  sub_212E5F238();
}

void sub_212E6CD50(uint64_t a1, char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_entries(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134217984;
  v9 = objc_msgSend_count(v4, v5, v6) + 1;
  sub_212E5F204(&dword_212E45000, a2, v7, "Failed to parse ZIP entry %tu. Will attempt to adjust offset forward.", (uint8_t *)&v8);

  sub_212E5F250();
}

void sub_212E6CDE4(uint64_t a1, char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_entries(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134217984;
  v9 = objc_msgSend_count(v4, v5, v6) + 1;
  sub_212E5F204(&dword_212E45000, a2, v7, "Failed to parse ZIP entry %tu. Will attempt to adjust offset backward.", (uint8_t *)&v8);

  sub_212E5F250();
}

void sub_212E6CE78()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_212E5F258();
  sub_212E5F204(&dword_212E45000, v0, v1, "Duplicate entry for name: %@", v2);
  sub_212E5F238();
}

void sub_212E6CEDC()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_212E5F210();
  _os_log_fault_impl(&dword_212E45000, v0, OS_LOG_TYPE_FAULT, "extractToURL failed - toURL: %{mask.hash}@, error: %@", v1, 0x20u);
  sub_212E5F250();
}

void sub_212E6CF4C()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_212E5F210();
  _os_log_error_impl(&dword_212E45000, v0, OS_LOG_TYPE_ERROR, "Exception thrown during extractToURL - toURL: %{mask.hash}@, exception: %@", v1, 0x20u);
  sub_212E5F250();
}

void sub_212E6CFBC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "Can't create output directory", v1, 2u);
}

void sub_212E6CFFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E5FC54(&dword_212E45000, a1, a3, "-newAssertion: triggering transition to non zero delegation", a5, a6, a7, a8, 0);
}

void sub_212E6D030(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_212E45000, a2, OS_LOG_TYPE_DEBUG, "-newAssertion: increased _count to %ld", (uint8_t *)&v3, 0xCu);
}

void sub_212E6D0AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E5FC54(&dword_212E45000, a1, a3, "-newAssertion: triggering transition to zero delegation", a5, a6, a7, a8, 0);
}

void sub_212E6D0E0(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 1024;
  v7 = a2 & 1;
  _os_log_debug_impl(&dword_212E45000, log, OS_LOG_TYPE_DEBUG, "-newAssertion: _endAssertion decreased _count to %ld and returning result as %d", (uint8_t *)&v4, 0x12u);
}

void sub_212E6D16C(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2082;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "Error opening file at path %s: %{public}s", buf, 0x16u);
}

void sub_212E6D1C0(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  strerror(a1);
  sub_212E590A0(&dword_212E45000, v1, v2, "Error cleaning up dispatch channel: %{public}s", v3, v4, v5, v6, 2u);
  sub_212E590F0();
}

void sub_212E6D230(void **a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend_entry(*a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  sub_212E590A0(&dword_212E45000, v7, v8, "Read was less than file header size for entry %@", v9, v10, v11, v12, v13);

}

void sub_212E6D2CC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_name(*(void **)(a1 + 16), a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  sub_212E590A0(&dword_212E45000, v4, v5, "Local file header doesn't match compression method from central directory file header for entry %@", v6, v7, v8, v9, v10);

  sub_212E590F0();
}

void sub_212E6D348(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_name(*(void **)(a1 + 16), a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  sub_212E590A0(&dword_212E45000, v4, v5, "Local file header has bad signature for entry %@", v6, v7, v8, v9, v10);

  sub_212E590F0();
}

void sub_212E6D3C4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_name(*(void **)(a1 + 16), a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  sub_212E590A0(&dword_212E45000, v4, v5, "Read was less than record size for entry %@", v6, v7, v8, v9, v10);

  sub_212E590F0();
}

void sub_212E6D440(void **a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_name(*a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  sub_212E590A0(&dword_212E45000, v4, v5, "CRC does not match for entry %@", v6, v7, v8, v9, v10);

  sub_212E590F0();
}

void sub_212E6D4BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E642B8();
  sub_212E522DC(&dword_212E45000, v0, v1, "We are out of luck, unable to get any storefront identifier from active and local store accounts. Returning nil storefront.", v2, v3, v4, v5, v6);
  sub_212E522EC();
}

void sub_212E6D4E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E642B8();
  sub_212E522DC(&dword_212E45000, v0, v1, "We have an active store account without storefront, will try to fallback to that of local store account", v2, v3, v4, v5, v6);
  sub_212E522EC();
}

void sub_212E6D514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E642B8();
  sub_212E642C4(&dword_212E45000, v0, v1, "Can't addObserver for iCloud Account without CloudKit entitlement.", v2, v3, v4, v5, v6);
  sub_212E522EC();
}

void sub_212E6D540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F258();
  sub_212E4C6C8(&dword_212E45000, v0, v1, "Failed to fetch iCloud UserRecordID: %@", v2, v3, v4, v5, v6);
}

void sub_212E6D5A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E642B8();
  sub_212E642C4(&dword_212E45000, v0, v1, "BUAccountsProvider needs CloudKit entitlement to provide iCloud account caching/notifying, and the calling process doesn't have that, we will always pass calls to AppleAccount and don't do any caching/notifying.", v2, v3, v4, v5, v6);
  sub_212E522EC();
}

void sub_212E6D5D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E642B8();
  sub_212E522DC(&dword_212E45000, v0, v1, "Unexpected NULL value returned from SecTaskCreateFromSelf()", v2, v3, v4, v5, v6);
  sub_212E522EC();
}

void sub_212E6D5FC()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_212E5F258();
  v3 = 2112;
  v4 = CFSTR("com.apple.developer.icloud-services");
  v5 = 2112;
  v6 = v0;
  _os_log_error_impl(&dword_212E45000, v1, OS_LOG_TYPE_ERROR, "Unexpected value %@ for %@ entitlement: %@", v2, 0x20u);
}

void sub_212E6D690(void **a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_name(*a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  sub_212E642A4(&dword_212E45000, v4, v5, "Received %@ but skipping notify observers", v6, v7, v8, v9, v10);

  sub_212E590F0();
}

void sub_212E6D70C(void **a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend_name(*a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  sub_212E642A4(&dword_212E45000, v4, v5, "Received %@", v6, v7, v8, v9, v10);

  sub_212E590F0();
}

void sub_212E6D788(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E4C6C8(&dword_212E45000, a2, a3, "Failed to fetch iCloud CKRecordID: %@", a5, a6, a7, a8, 2u);
}

void sub_212E6D7F4(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend_code(a1, a2, a3);
  objc_msgSend_domain(a1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E65B90();
  sub_212E65BB4(&dword_212E45000, v7, v8, "Error reading from filter BUStreamReadChannel: %zd %{public}@ %@", v9, v10, v11, v12, v13);

  sub_212E65BC8();
}

void sub_212E6D880(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend_code(a1, a2, a3);
  objc_msgSend_domain(a1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E65B90();
  sub_212E65BB4(&dword_212E45000, v7, v8, "Error reading from source BUReadChannel: %zd %{public}@ %@", v9, v10, v11, v12, v13);

  sub_212E65BC8();
}

void sub_212E6D90C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "Failed to initialize zip archive at %@. error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_212E6D990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F258();
  sub_212E4C6C8(&dword_212E45000, v0, v1, "Nil data for entry. %@", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6D9F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F258();
  sub_212E4C6C8(&dword_212E45000, v0, v1, "Failed to produce plist from data. %@", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6DA50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F258();
  sub_212E4C6C8(&dword_212E45000, v0, v1, "Exception creating xml document. %@", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6DAB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F258();
  sub_212E4C6C8(&dword_212E45000, v0, v1, "Error creating temporary directory: %@", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6DB10(void *a1, const char *a2, NSObject *a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_URLByDeletingLastPathComponent(a1, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E67A80();
  sub_212E67A74(&dword_212E45000, a3, v8, "Failed to create temp directory for extraction at %@. %@", v9);

  sub_212E590E0();
}

void sub_212E6DBA8(void *a1, char *a2, uint64_t a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_name(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E5F258();
  _os_log_error_impl(&dword_212E45000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Skipping entry because it is outside the root of the zip: %@", v5, 0xCu);

}

void sub_212E6DC38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E4C6C8(&dword_212E45000, a1, a3, "Unable to read symlink destination path from the entry's data: %@", a5, a6, a7, a8, 2u);
  sub_212E5F238();
}

void sub_212E6DCA0(void *a1, const char *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_name(a1, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E67A80();
  sub_212E67A74(&dword_212E45000, a3, v5, "Skipping extraction of symlink (%@) because destination of symlink (%@) is outside root.", v6);

  sub_212E590E0();
}

void sub_212E6DD28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F258();
  sub_212E4C6C8(&dword_212E45000, v0, v1, "Failed to write entry to directory. %@", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6DD88()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_212E67A98();
  sub_212E67A74(&dword_212E45000, v0, (uint64_t)v0, "Unable to read symlink destination path from %@: %@", v1);
  sub_212E5F238();
}

void sub_212E6DDF0(void **a1, const char *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_name(*a1, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_212E67A80();
  sub_212E67A74(&dword_212E45000, a3, v5, "Skipping extraction of symlink (%@) because destination of symlink (%@) is outside root.", v6);

  sub_212E590E0();
}

void sub_212E6DE7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E5F258();
  sub_212E4C6C8(&dword_212E45000, v0, v1, "Failed to create temp directory for extraction. Error: %@", v2, v3, v4, v5, v6);
  sub_212E5F238();
}

void sub_212E6DEDC()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_212E67A98();
  sub_212E67A74(&dword_212E45000, v0, (uint64_t)v0, "Failed to create write stream handler with URL %@. Error: %@", v1);
  sub_212E5F238();
}

void sub_212E6DF44(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "[Cellular] Returning 'null' identity after error occurred: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_212E6DFB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E522DC(&dword_212E45000, a1, a3, "inflateInit2 failed", a5, a6, a7, a8, 0);
  sub_212E522EC();
}

void sub_212E6DFE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E522DC(&dword_212E45000, a1, a3, "Stream is incomplete.", a5, a6, a7, a8, 0);
  sub_212E522EC();
}

void sub_212E6E018(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_212E522DC(&dword_212E45000, a1, a3, "CRC does not match.", a5, a6, a7, a8, 0);
  sub_212E522EC();
}

void sub_212E6E048(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "Data is too big to decompress. Size: %llu", (uint8_t *)&v2, 0xCu);
}

void sub_212E6E0BC(int **a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = **a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_212E45000, a2, OS_LOG_TYPE_ERROR, "inflate() failed: %d", (uint8_t *)v3, 8u);
  sub_212E522EC();
}

void sub_212E6E134()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E6BE04();
  sub_212E6BE38(&dword_212E45000, v0, v1, "bu_isDirectory: bu_utType failed. url: %{mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_212E6E198()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E6BE04();
  sub_212E6BE38(&dword_212E45000, v0, v1, "bu_isFolder: bu_utType failed. url: %{mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_212E6E1FC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212E45000, log, OS_LOG_TYPE_ERROR, "bu_utType: NSURLContentTypeKey not found.", v1, 2u);
}

void sub_212E6E23C()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sub_212E6BE04();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_212E45000, v2, OS_LOG_TYPE_ERROR, "bu_utType: resourceValuesForKeys failed. url: %{mask.hash}@ error: %@", v3, 0x20u);
}

void sub_212E6E2B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  sub_212E6BDB4();
  sub_212E6BE24(&dword_212E45000, v0, v1, "extendedAttributeNamed: xattr_name_with_flags failed. xattr: %@ errno: %d url: %{mask.hash}@", v2, v3, v4, v5, v6);
  sub_212E65BC8();
}

void sub_212E6E334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  sub_212E6BDB4();
  sub_212E6BE24(&dword_212E45000, v0, v1, "extendedAttributeNamed: getxattr failed. xattr: %@ errno: %d url: %{mask.hash}@", v2, v3, v4, v5, v6);
  sub_212E65BC8();
}

void sub_212E6E3B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E6BE50();
  sub_212E6BE48();
  sub_212E6BDEC();
  sub_212E6BDA0(&dword_212E45000, v0, v1, "setExtendedAttributeNamed: xattr_name_with_flags failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
  sub_212E590F0();
}

void sub_212E6E41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E6BE50();
  sub_212E6BE48();
  sub_212E6BDEC();
  sub_212E6BDA0(&dword_212E45000, v0, v1, "setExtendedAttributeNamed: setxattr failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
  sub_212E590F0();
}

void sub_212E6E488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E6BE50();
  sub_212E6BE48();
  sub_212E6BDEC();
  sub_212E6BDA0(&dword_212E45000, v0, v1, "removeExtendedAttributeNamed: xattr_name_with_flags failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
  sub_212E590F0();
}

void sub_212E6E4F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212E6BE50();
  sub_212E6BE48();
  sub_212E6BDEC();
  sub_212E6BDA0(&dword_212E45000, v0, v1, "removeExtendedAttributeNamed: removexattr failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
  sub_212E590F0();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGDataProviderRef CGDataProviderCreateSequential(void *info, const CGDataProviderSequentialCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE178](info, callbacks);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04730]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x24BDBCFA0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
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

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x24BDADA40]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x24BDADA88]();
}

uint64_t container_get_path()
{
  return MEMORY[0x24BDADAC0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x24BDADB18]();
}

uint64_t container_query_free()
{
  return MEMORY[0x24BDADB20]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x24BDADB28]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x24BDADB30]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x24BDADB48]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x24BDADB58]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x24BDADB68]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x24BDADB78]();
}

uint64_t container_query_set_uid()
{
  return MEMORY[0x24BDADB80]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x24BDADD78](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x24BDADD80](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
  MEMORY[0x24BDADDF8](channel, barrier);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x24BDADE00](channel, flags);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x24BDADE08](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

dispatch_fd_t dispatch_io_get_descriptor(dispatch_io_t channel)
{
  return MEMORY[0x24BDADE20](channel);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x24BDADE28](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
  MEMORY[0x24BDADE30](channel, low_water);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x24BDADE38](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A08](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A10]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x24BDE1A68](path, *(_QWORD *)&interface_type);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD110](a1, a2);
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
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

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x24BDAFB68](path, name, *(_QWORD *)&options);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  return (char *)MEMORY[0x24BDB0578](a1, a2);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x24BEDE6B8](sax, user_data, chunk, *(_QWORD *)&size, filename);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDE798](ctxt);
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x24BEDEAB0](ctxt, chunk, *(_QWORD *)&size, *(_QWORD *)&terminate);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

