void sub_1B1070E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1B1070FF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10710A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10711A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B1071220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10712F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1071384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10714C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1071614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23)
{
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B10716E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1071790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1071858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10718F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1071A60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1071AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1071B3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1071E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10722E0(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 112) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v3 - 112));
}

void sub_1B10727C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10729A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B1072A58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t EFObjectsAreEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqual:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1B1072B68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1072C20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1072CFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1072D8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1072EA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B1072F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1072FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1073054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10730F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B10731DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10732D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10734C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1B10735D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t EFDecodeCacheableInstance(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = objc_msgSend(a2, "decodeInt64ForKey:", CFSTR("EFCacheableInstanceID"));
  if (!v4)
    return objc_msgSend((id)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3), "cachedSelf");
  v5 = v4;
  os_unfair_recursive_lock_lock_with_options();
  v6 = (void *)sInstanceCache;
  if (!sInstanceCache)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 5, 15000);
    sInstanceCache = (uint64_t)v6;
  }
  v7 = objc_msgSend(v6, "objectForKey:", v5);
  if (!v7)
  {
    v7 = objc_msgSend((id)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3), "cachedSelf");
    objc_msgSend((id)sInstanceCache, "setObject:forKey:", v7, v5);
  }
  os_unfair_recursive_lock_unlock();
  return v7;
}

void sub_1B1073740(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock);
  _Unwind_Resume(a1);
}

void sub_1B1073CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t EFEncodeCacheableInstance(void *a1, void *a2, uint64_t a3)
{
  id AssociatedObject;
  NSObject *v7;

  if (objc_msgSend(a2, "ef_isNSXPCCoder"))
  {
    os_unfair_recursive_lock_lock_with_options();
    AssociatedObject = objc_getAssociatedObject(a1, CFSTR("EFCacheableInstanceID"));
    if (!AssociatedObject)
    {
      if (EFEncodeCacheableInstance_onceToken != -1)
        dispatch_once(&EFEncodeCacheableInstance_onceToken, &__block_literal_global_2);
      AssociatedObject = (id)EFEncodeCacheableInstance_sInstanceID++;
      ++EFEncodeCacheableInstance_sInstanceCount;
      if (__ROR8__(0x5D4E8FB00BCBE61DLL * EFEncodeCacheableInstance_sInstanceCount + 0xA7C5AC471B460, 5) <= 0xA7C5AC471B46uLL)
      {
        if (_log_onceToken != -1)
          dispatch_once(&_log_onceToken, &__block_literal_global_2);
        v7 = _log_log;
        if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEBUG))
          EFEncodeCacheableInstance_cold_1(v7);
      }
      objc_setAssociatedObject(a1, CFSTR("EFCacheableInstanceID"), AssociatedObject, 0);
    }
    os_unfair_recursive_lock_unlock();
    objc_msgSend(a2, "encodeInt64:forKey:", AssociatedObject, CFSTR("EFCacheableInstanceID"));
  }
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void sub_1B1073FC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t EFSQLVerboseDebugLoggingEnabled()
{
  if (EFSQLVerboseDebugLoggingEnabled_onceToken != -1)
    dispatch_once(&EFSQLVerboseDebugLoggingEnabled_onceToken, &__block_literal_global_31);
  return EFSQLVerboseDebugLoggingEnabled_enabled;
}

void sub_1B1074174(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10742EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107437C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10743D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1074454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1074540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10747BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location,char a35)
{
  void *v35;
  void *v36;
  id *v37;
  id *v38;
  void *v39;
  uint64_t v40;

  objc_destroyWeak(v38);
  objc_destroyWeak(v37);

  objc_destroyWeak(&location);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v40 - 184), 8);

  _Block_object_dispose((const void *)(v40 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B1074A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_1B1074C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1B1074DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1B1074E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1075000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1B1075098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1075158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10751C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10753D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B10754B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_126);
  _Unwind_Resume(a1);
}

void sub_1B10755E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1075720(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10758F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t EFSetsAreEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqualToSet:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1B1075968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10759C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1075A50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1075B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1075C70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1075D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B1075DF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1075EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1076044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

BOOL EFIsNotNull_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;

  v2 = a2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v3 != v2;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1B10760F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10761C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107627C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1076418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10764D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1076550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B107678C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B1076838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1076A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B1076BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1076D18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1076E74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107700C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10770B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1077160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10771C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107721C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1077330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107740C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10774DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1077570(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1077604(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10776B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1077728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10777E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10778C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B107798C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1077A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B1077AC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1077CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1078124(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v2;

  _Unwind_Resume(a1);
}

void sub_1B1078350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1078424(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1078540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1078678(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10787AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B1078864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1078904(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1078AFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1078BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1078EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_1B1078FF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10790D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B1079160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10791DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B107927C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107935C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1079424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10794EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1079554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10795A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1079624(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1079824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B1079918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1079978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1079AF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __hashForDigest_block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    while (1)
    {
      v5 = *a2++;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= (unint64_t)v5 << (8
                                                                                                * *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24));
      v6 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
      v7 = *(_QWORD *)(v6 + 24) + 1;
      *(_QWORD *)(v6 + 24) = v7;
      if (v7 == 8)
        break;
      if (!--a4)
        return result;
    }
    *a5 = 1;
  }
  return result;
}

void sub_1B1079CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

unint64_t EFMurmurHash3Mix(unint64_t a1)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;

  v2 = is32Bit();
  v3 = 0xC4CEB9FE1A85EC53
     * ((0xFF51AFD7ED558CCDLL * (a1 ^ (a1 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (a1 ^ (a1 >> 33))) >> 33));
  v4 = v3 ^ (v3 >> 33);
  v5 = -1028477387 * ((-2048144789 * (a1 ^ WORD1(a1))) ^ ((-2048144789 * (a1 ^ WORD1(a1))) >> 13));
  v6 = v5 ^ HIWORD(v5);
  if (v2)
    return v6;
  else
    return v4;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  return std::set<long long>::set[abi:ne180100]((uint64_t *)(a1 + 48), a2 + 48);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B1079F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B1079FEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107A0C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107A160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107A2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B107A438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t EFIsRunningUnitTests()
{
  if (EFIsRunningUnitTests_onceToken != -1)
    dispatch_once(&EFIsRunningUnitTests_onceToken, &__block_literal_global_40);
  return EFIsRunningUnitTests_result;
}

BOOL EFProtectedDataAvailable()
{
  if (_InitObservation_sOnceToken != -1)
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_62);
  return sContentProtectionState == 3 || sContentProtectionState == 0;
}

void sub_1B107A5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B107A9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1B107AAB0()
{
  JUMPOUT(0x1B107AA94);
}

void sub_1B107AAF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id truncatedDescriptionToMaxAllowableSize(void *a1, unint64_t a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= a2)
    v5 = a2;
  else
    v5 = v4;
  objc_msgSend(v3, "substringToIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1B107AB50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107ABC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107AC68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107ACE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107AE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B107AE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B107AF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B107B0C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107B144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107B1D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107B2BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B107B31C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107B39C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107B438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107B57C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B107B784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B107B984(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B107BA34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107BB74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107BC54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107BCB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107BE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  uint64_t v9;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);

  _Unwind_Resume(a1);
}

void sub_1B107C040(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107C480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107C7E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B107C9D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

__CFString *describableObjectForExpression(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  __CFString *v4;

  v1 = a1;
  v2 = CFSTR("<evaluated object>");
  switch(objc_msgSend(v1, "expressionType"))
  {
    case 0:
      objc_msgSend(v1, "constantValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v4 = (__CFString *)v1;
LABEL_5:
        v2 = v4;
        goto LABEL_6;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
      v2 = CFSTR("<constant>");
LABEL_6:

LABEL_18:
      return v2;
    case 2:
      v2 = CFSTR("<variable>");
      goto LABEL_18;
    case 3:
      v2 = (__CFString *)v1;
      goto LABEL_18;
    case 4:
      v2 = CFSTR("<function>");
      goto LABEL_18;
    case 5:
      v2 = CFSTR("<union set>");
      goto LABEL_18;
    case 6:
      v2 = CFSTR("<intersect set>");
      goto LABEL_18;
    case 7:
      v2 = CFSTR("<minus set>");
      goto LABEL_18;
    case 13:
      v2 = CFSTR("<subquery>");
      goto LABEL_18;
    case 14:
      v2 = CFSTR("<aggregate>");
      goto LABEL_18;
    case 15:
      v2 = CFSTR("<any key>");
      goto LABEL_18;
    case 19:
      v2 = CFSTR("<block>");
      goto LABEL_18;
    case 20:
      v2 = CFSTR("<conditional>");
      goto LABEL_18;
    default:
      goto LABEL_18;
  }
}

void sub_1B107CB6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107CC30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107D3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,_Unwind_Exception *exception_object,uint64_t a22,void *a23,void *a24)
{
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1B107D750(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107D7DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B107D8BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107D980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B107DC74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107DD20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107DDA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107DF38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B107DFFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107E084(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107E114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107E288(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107E2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFSQLPreparedStatement;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

CFStringRef EFStringWithInt64(uint64_t a1)
{
  __int128 v1;
  int v2;
  char __str[16];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  v5 = v1;
  v2 = snprintf(__str, 0x20uLL, "%lld", a1);
  return (id)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);
}

void sub_1B107E580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B107E6D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B107E968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107EB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  id *v18;
  void *v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B107ED14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  id *v23;
  id *v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);

  _Unwind_Resume(a1);
}

void sub_1B107EDA4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  void *v2;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B107EE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B107EF0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107F058(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B107F1F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B107F434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107F530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B107F6B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B107F76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B107F8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B107FC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B107FEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B107FF6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *EFSQLStringForCollation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return &stru_1E62A84D8;
  else
    return off_1E62A7108[a1 - 1];
}

void sub_1B10800A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10801A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108020C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1080480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

id _EFLocalizedString(void *a1, dispatch_once_t *a2, id *a3)
{
  _EFLocalizedStringFromTable(a1, a2, a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _EFLocalizedStringFromTable(void *a1, dispatch_once_t *a2, id *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  _QWORD block[5];

  v7 = a1;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___EFLocalizedStringFromTable_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (*a2 != -1)
    dispatch_once(a2, block);
  objc_msgSend(*a3, "localizedStringForKey:value:table:", v7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_1B10805F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1080664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10806D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)EFListStateCapturer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B10807B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B108085C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1080918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1080A04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1080A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1080B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1080B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1080C38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id EFAtomicObjectLoad(unint64_t *a1)
{
  void *v1;

  v1 = (void *)atomic_load(a1);
  return v1;
}

void sub_1B1080D0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1080E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B1080F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1081048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1081100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1081208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1081334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10813DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10815D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10816E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1081740(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1081794(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10817F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1081924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1081AB4(_Unwind_Exception *a1)
{
  void *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1B1081B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1081BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1081C44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1081D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B1081F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);

  _Unwind_Resume(a1);
}

id EFLogRegisterStateCaptureBlock(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[9];
  id v19;
  id v20;
  uint64_t v21;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = v9;
  if (!v7 || !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<EFCancelable>  _Nonnull EFLogRegisterStateCaptureBlock(__strong dispatch_queue_t _Nonnull, NSString *__strong _Nonnull, EFLogStateType, __strong EFLogStateCaptureBlock _Nonnull)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("EFLogging.m"), 42, CFSTR("No dispatch queue or 'state capture block' can be found. Please check previous logging"));

  }
  v11 = MEMORY[0x1E0C809B0];
  v18[5] = MEMORY[0x1E0C809B0];
  v18[6] = 3221225472;
  v18[7] = __EFLogRegisterStateCaptureBlock_block_invoke;
  v18[8] = &unk_1E62A6158;
  v21 = a3;
  v12 = v10;
  v20 = v12;
  v13 = v8;
  v19 = v13;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __EFLogRegisterStateCaptureBlock_block_invoke_12;
  v18[3] = &__block_descriptor_40_e5_v8__0l;
  v18[4] = os_state_add_handler();
  +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void sub_1B10820BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B1082244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1082388(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1082500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B108261C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10826CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10829E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1082BC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1082C1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1082CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1082D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1082DFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1082E80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1082F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B1082FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B108306C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10830E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10831BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B1083250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1083304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1083434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1083550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B10835C8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  void *v2;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B1083628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10837A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1B1083980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_1B1083AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1B1083B88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1083D38(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  void *v2;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B1083E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1083F58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1084240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1084330(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B10843A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1084428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10844A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10845E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10846FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10847FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B10849B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B1084B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B1084C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1084CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1084D70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1084E9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1084EF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1084F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1085044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1085128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10851F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1085270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1085344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108540C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1085494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1085514(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10855B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B1085AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B1085CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1085DB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1085EE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1086074(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B108615C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108625C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

const __CFString *EFSQLStringForConflictResolution(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 3)
    return CFSTR("ABORT");
  else
    return off_1E62A70E8[a1 - 2];
}

void sub_1B1086360(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1086408(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1086514(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1086678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B10867B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

id _keyForLookupValue(void *a1, void *a2)
{
  id v3;
  const char *v4;
  size_t v5;
  id v6;
  const char *v7;
  size_t v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v5 = strlen(v4);
  objc_msgSend(v3, "description");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v8 = strlen(v7);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v15 - v10;
  if ((v12 & 1) == 0)
    memset((char *)v15 - v10, 170, v9);
  memcpy(v11, v4, v5);
  v11[v5] = 1;
  memcpy(&v11[v5 + 1], v7, v8);
  v11[v8 + 1 + v5] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_1B1086940(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1086A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1086BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1087018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B1087270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _keyForClassInstanceProperty(void *a1, objc_class *a2, const char *a3)
{
  const char *Name;
  size_t v6;
  const char *v7;
  size_t v8;
  const char *v9;
  size_t v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  void *v16;
  uint64_t v18;
  id v19;
  uint64_t *v20;
  id v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = a1;
  Name = class_getName(a2);
  v6 = strlen(Name);
  v7 = sel_getName(a3);
  v22 = Name;
  v8 = strlen(v7);
  v21 = objc_retainAutorelease(v19);
  v9 = (const char *)objc_msgSend(v21, "UTF8String");
  v10 = strlen(v9);
  v20 = &v18;
  v11 = v10 + 1 + v6;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v18 - v13;
  if ((v15 & 1) == 0)
    memset((char *)&v18 - v13, 170, v12);
  memcpy(v14, v9, v10);
  v14[v10] = 1;
  memcpy(&v14[v10 + 1], v22, v6);
  v14[v11] = 46;
  memcpy(&v14[v11 + 1], v7, v8);
  v14[v11 + 1 + v8] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_1B1087490(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

id _keyForProtocolInstanceProperty(void *a1, Protocol *a2, const char *a3)
{
  const char *Name;
  size_t v6;
  const char *v7;
  size_t v8;
  const char *v9;
  size_t v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  void *v16;
  uint64_t v18;
  id v19;
  uint64_t *v20;
  id v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = a1;
  Name = protocol_getName(a2);
  v6 = strlen(Name);
  v7 = sel_getName(a3);
  v22 = Name;
  v8 = strlen(v7);
  v21 = objc_retainAutorelease(v19);
  v9 = (const char *)objc_msgSend(v21, "UTF8String");
  v10 = strlen(v9);
  v20 = &v18;
  v11 = v10 + 2 + v6;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v18 - v13;
  if ((v15 & 1) == 0)
    memset((char *)&v18 - v13, 170, v12);
  memcpy(v14, v9, v10);
  *(_WORD *)&v14[v10] = 15361;
  memcpy(&v14[v10 + 2], v22, v6);
  *(_WORD *)&v14[v11] = 11838;
  memcpy(&v14[v11 + 2], v7, v8);
  v14[v11 + 2 + v8] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_1B1087644(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1B1087774(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10878D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ef_xpc_activity_register(const char *a1, void *a2, void *a3)
{
  _ef_xpc_activity_register(a1, 1, a2, a3);
}

void sub_1B10879A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1087A14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1087B48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1087C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  std::__tree<long long>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void std::__tree<long long>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<long long>::destroy(a1, *a2);
    std::__tree<long long>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_1B1087CF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t **std::__tree<long long>::__assign_multi<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t **v14;
  uint64_t *v15;
  uint64_t *v16;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v14 = result;
    v15 = v8;
    v16 = v8;
    if (v8)
    {
      v15 = std::__tree<long long>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          v8[4] = v9[4];
          std::__tree<long long>::__node_insert_multi(v5, v8);
          v8 = v15;
          v16 = v15;
          if (v15)
            v15 = std::__tree<long long>::_DetachedTreeCache::__detach_next((uint64_t)v15);
          v10 = (_QWORD *)v9[1];
          if (v10)
          {
            do
            {
              a2 = v10;
              v10 = (_QWORD *)*v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v9[2];
              v11 = *a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v11);
          }
          if (!v8)
            break;
          v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)std::__tree<long long>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)std::__tree<long long>::__emplace_multi<long long const&>(v5, a2 + 4);
      v12 = (_QWORD *)a2[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)a2[2];
          v11 = *v13 == (_QWORD)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_1B1087E4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<long long>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1B1087F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B108800C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFLazyCache;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B10880EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108817C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10882D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&trampolineWithScheduler_object__sTrampolineLock);

  _Unwind_Resume(a1);
}

void sub_1B10883F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1088468(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10884B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1088590(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1088628(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id EFAtomicObjectSetIfNil(unint64_t *a1, void *a2)
{
  EFAtomicObjectSetIfIdentical(a1, 0, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id EFAtomicObjectSetIfIdentical(unint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<NSObject>  _Nullable EFAtomicObjectSetIfIdentical(EFAtomicObject * _Nonnull, id<NSObject>  _Nullable __strong, __strong id<NSObject> _Nonnull)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("EFAtomicObject.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newObject != nil"));

  }
  v7 = v6;
  v8 = v7;
  while (1)
  {
    v9 = __ldaxr(a1);
    if ((id)v9 != v5)
      break;
    if (!__stlxr((unint64_t)v7, a1))
    {
      v10 = v5;
      v11 = v7;
      goto LABEL_8;
    }
  }
  __clrex();
  CFRelease(v7);
  v12 = (void *)atomic_load(a1);
  v11 = v12;
  v10 = v8;
LABEL_8:

  return v11;
}

void sub_1B1088764(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10887CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1088820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108888C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10888DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id EFFetchSignpostLog()
{
  if (EFFetchSignpostLog_onceToken != -1)
    dispatch_once(&EFFetchSignpostLog_onceToken, &__block_literal_global_8);
  return (id)EFFetchSignpostLog_log;
}

uint64_t EFArraysAreEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqualToArray:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1B1088A10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1088B48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B1088C40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1088CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1088EA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1088F00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1088FB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1089888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a71;
  void *a72;
  void *v72;
  void *v73;
  void *v74;

  _Unwind_Resume(a1);
}

void sub_1B1089B40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1089C10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1089C7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1089CFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1089D64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1089DE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1089E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1089F10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void EFContentProtectionValidateObservedStateIsUnlocked()
{
  if (_InitObservation_sOnceToken != -1)
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_62);
  if ((unint64_t)(sContentProtectionState - 1) <= 1 && !_KeyBagLockState())
    dispatch_sync((dispatch_queue_t)_observationQueue, &__block_literal_global_39);
}

void sub_1B108A05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B108A1F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B108A3C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B108A45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108A514(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL EFDeviceUnlockedSinceBoot()
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

void sub_1B108A610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B108A6A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108A850(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1B108A93C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108AA10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108AAF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B108AC94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B108AD88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108ADE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108AE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void EFRegisterContentProtectionObserver(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  const char *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v8 = "nil != observer";
    v9 = 247;
    goto LABEL_8;
  }
  if (!v4)
  {
    v8 = "NULL != queue";
    v9 = 248;
    goto LABEL_8;
  }
  if ((id)_observationQueue == v4)
  {
    v8 = "_observationQueue != queue";
    v9 = 249;
LABEL_8:
    __assert_rtn("EFRegisterContentProtectionObserver", "EFContentProtectionObserver.m", v9, v8);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __EFRegisterContentProtectionObserver_block_invoke;
  v10[3] = &unk_1E62A58B0;
  v6 = v3;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  _InitAndPerformSync(v10);

}

void sub_1B108AFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void _InitAndPerformSync(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v4;

  v1 = _InitObservation_sOnceToken;
  v2 = a1;
  v4 = v2;
  if (v1 == -1)
  {
    v3 = v2;
  }
  else
  {
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_62);
    v3 = v4;
  }
  dispatch_sync((dispatch_queue_t)_observationQueue, v3);

}

void sub_1B108B0C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ef_xpc_activity_register_block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void (**v10)(id, xpc_object_t);
  _xpc_activity_s *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  _DWORD v17[7];

  *(_QWORD *)&v17[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  v5 = state;
  if (!state)
  {
    activityLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v16 = 136446210;
      *(_QWORD *)v17 = v9;
      _os_log_impl(&dword_1B106E000, v8, OS_LOG_TYPE_INFO, "Check in '%{public}s'", (uint8_t *)&v16, 0xCu);
    }

    v10 = (void (**)(id, xpc_object_t))*(id *)(a1 + 32);
    v11 = v3;
    v12 = xpc_dictionary_create(0, 0, 0);
    v10[2](v10, v12);
    v13 = xpc_activity_copy_criteria(v11);
    v14 = v13;
    if (!v13 || !xpc_equal(v13, v12))
      xpc_activity_set_criteria(v11, v12);

    goto LABEL_14;
  }
  if (state != 2)
  {
    activityLog();
    v10 = (void (**)(id, xpc_object_t))objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 48);
      v16 = 67109378;
      v17[0] = v5;
      LOWORD(v17[1]) = 2082;
      *(_QWORD *)((char *)&v17[1] + 2) = v15;
      _os_log_impl(&dword_1B106E000, (os_log_t)v10, OS_LOG_TYPE_INFO, "Unexpected state %u for '%{public}s'", (uint8_t *)&v16, 0x12u);
    }
LABEL_14:

    goto LABEL_15;
  }
  activityLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v16 = 136446210;
    *(_QWORD *)v17 = v7;
    _os_log_impl(&dword_1B106E000, v6, OS_LOG_TYPE_INFO, "Run '%{public}s'", (uint8_t *)&v16, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_15:

}

void sub_1B108B2E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id activityLog()
{
  if (activityLog_onceToken != -1)
    dispatch_once(&activityLog_onceToken, &__block_literal_global_42);
  return (id)activityLog_log;
}

void sub_1B108B404(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108B494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108B510(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108B584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108B634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108B7B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B108B8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B108BA24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108BBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B108BC98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108BD00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108BD50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _ef_xpc_activity_register(const char *a1, int a2, void *a3, void *a4)
{
  void (**v7)(id, xpc_object_t);
  id v8;
  xpc_object_t v9;
  void (**v10)(id, xpc_object_t);
  id v11;
  _QWORD handler[4];
  void (**v13)(id, xpc_object_t);
  id v14;
  const char *v15;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = (id)*MEMORY[0x1E0C80748];
  }
  else
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    v7[2](v7, v9);
  }
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = ___ef_xpc_activity_register_block_invoke;
  handler[3] = &unk_1E62A7988;
  v15 = a1;
  v10 = v7;
  v13 = v10;
  v11 = v8;
  v14 = v11;
  xpc_activity_register(a1, v9, handler);

}

void sub_1B108BEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B108C0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B108C13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108C274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B108C3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108C754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B108C8DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108C9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFStoppableScheduler;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

id EFAtomicObjectRelease(unint64_t *a1)
{
  void *v1;
  unint64_t v2;

_EFAtomicObjectRelease:
  v1 = (void *)atomic_load(a1);
  do
  {
    v2 = __ldaxr(a1);
    if ((void *)v2 != v1)
    {
      __clrex();
      goto _EFAtomicObjectRelease;
    }
  }
  while (__stlxr(0, a1));
  return v1;
}

void sub_1B108CAEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108CBDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108CC80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108CD1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108CD8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108CE4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108CECC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108CF38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108D028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108D07C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108D0DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t EFIsCustomerBuild()
{
  void *v1;
  int v2;

  if ((EFIsSeedBuild() & 1) != 0)
    return 0;
  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isInternal");

  return v2 ^ 1u;
}

void sub_1B108D138(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t EFIsSeedBuild()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "isEqual:", CFSTR("Beta"));

  return v1;
}

void sub_1B108D18C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108D1F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108D284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B108D388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B108D540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B108D600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108D6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B108D780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108D874(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108D8C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108D9C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108DA38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108DAB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108DB34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108DBE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108DC60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108DCEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108DE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B108DFD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108E0C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t *std::__tree<long long>::__emplace_unique_key_args<long long,long long const&>(uint64_t **a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<long long>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<long long>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void EFVerifyFileProtectionType(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (id)*MEMORY[0x1E0C99940];
  v18 = 0;
  v6 = *MEMORY[0x1E0C99938];
  v17 = 0;
  v7 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v18, v6, &v17);
  v8 = v18;

  v9 = v17;
  if (v7)
  {
    if (objc_msgSend(v8, "isEqualToString:", v4))
    {
      _Log_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v11;
        v21 = 2114;
        v22 = v4;
        _os_log_impl(&dword_1B106E000, v10, OS_LOG_TYPE_DEFAULT, "%@ has file protection type %{public}@", buf, 0x16u);

      }
    }
    else
    {
      _Log_0();
      v14 = objc_claimAutoreleasedReturnValue();
      v10 = v14;
      if (v8)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v3, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v20 = v15;
          v21 = 2114;
          v22 = v8;
          v23 = 2114;
          v24 = v4;
          _os_log_fault_impl(&dword_1B106E000, v10, OS_LOG_TYPE_FAULT, "%@ has incorrect file protection type %{public}@, expected %{public}@", buf, 0x20u);

        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        v21 = 2114;
        v22 = v4;
        _os_log_impl(&dword_1B106E000, v10, OS_LOG_TYPE_DEFAULT, "%@ has no file protection type, expected %{public}@", buf, 0x16u);

      }
    }
  }
  else
  {
    _Log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      EFVerifyFileProtectionType_cold_1(v12, v13, buf, v10);
    }
  }

}

void sub_1B108E5DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id _Log()
{
  if (_Log_onceToken != -1)
    dispatch_once(&_Log_onceToken, &__block_literal_global_72);
  return (id)_Log_log;
}

id _Log_0()
{
  if (_Log_onceToken_0 != -1)
    dispatch_once(&_Log_onceToken_0, &__block_literal_global_4);
  return (id)_Log_log_0;
}

uint64_t _KeyBagLockState()
{
  uint64_t result;

  LODWORD(result) = MKBGetDeviceLockState();
  if (result >= 4)
    return -1;
  else
    return result;
}

void sub_1B108E770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B108E810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108E968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t EFNonContainerizedHomeDirectory()
{
  uid_t v0;
  passwd *v1;
  char *pw_dir;
  void *v3;
  void *v4;

  v0 = geteuid();
  if (!v0)
    v0 = getuid();
  v1 = getpwuid(v0);
  if (!v1 || (pw_dir = v1->pw_dir) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nonnull EFNonContainerizedHomeDirectory(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("EFPathUtilities.m"), 33, CFSTR("Couldn't get non-containerized home directory"));

    pw_dir = 0;
  }
  return objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", pw_dir, 1, 0);
}

void sub_1B108EA28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108EB34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108EBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108ED30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B108EEBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108F078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108F160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108F330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B108F3E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108F4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void __initErrorDecodersOnce_block_invoke()
{
  id v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)sErrorDecoders;
  sErrorDecoders = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.mail.errorDecoder", 0);
  v3 = (void *)sErrorDecodeQueue;
  sErrorDecodeQueue = (uint64_t)v2;

}

void sub_1B108F708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108F99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B108FBAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL EFIsNull_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;

  v2 = a2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v3 == v2;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void sub_1B108FC94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B108FCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B108FDCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B108FF70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B1090030(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109009C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109010C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109017C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10901FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10902FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1090390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1090400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10904FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109058C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1090648(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10907CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10908D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10909E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B1090A88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id EFBundleIdentifierForXPCConnection(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BYTE __b[4096];
  uint64_t v19;

  v1 = (void *)MEMORY[0x1E0C80A78](a1);
  v19 = *MEMORY[0x1E0C80C00];
  v2 = v1;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForEntitlement:", CFSTR("application-identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v4, "rangeOfString:", CFSTR(".")) == 10
        && v5 + 10 < (unint64_t)objc_msgSend(v4, "length"))
      {
        objc_msgSend(v4, "substringFromIndex:", 11);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = v4;
      }
      v7 = v6;
      goto LABEL_24;
    }
    v8 = objc_msgSend(v3, "processIdentifier");
    if (getpid() != v8
      || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (getpid() == v8)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "bundleURL");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
      }
      memset(__b, 170, sizeof(__b));
      if (!proc_pidpath(v8, __b, 0x1000u))
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", __b, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v13 = (void *)_CFBundleCopyBundleURLForExecutableURL();
        objc_msgSend(v13, "pathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
          v16 = v13;
        else
          v16 = v9;
        v12 = v16;

LABEL_20:
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_23;
        }
LABEL_22:
        v9 = 0;
      }
    }
LABEL_23:
    objc_msgSend(v9, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
    goto LABEL_25;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

void sub_1B1090DBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1B1090F34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1091004(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109110C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10912C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __activityLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "XPCActivity");
  v1 = (void *)activityLog_log;
  activityLog_log = (uint64_t)v0;

}

id _ef_log_EFSQLQueryGenerator()
{
  if (_ef_log_EFSQLQueryGenerator_onceToken != -1)
    dispatch_once(&_ef_log_EFSQLQueryGenerator_onceToken, &__block_literal_global_34);
  return (id)_ef_log_EFSQLQueryGenerator_log;
}

void sub_1B1091408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_EFKeyValueObserverHandler;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B109151C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B1091580(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1091634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1091704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10917C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B1091934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1091A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1091B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  void *v16;

  v16 = v14;

  _Unwind_Resume(a1);
}

void sub_1B1091BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1091C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1091E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10920C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37)
{
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;

  _Block_object_dispose((const void *)(v41 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B10921A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1092404(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B109259C(_Unwind_Exception *a1)
{
  void *v1;
  os_unfair_lock_s *v2;

  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1B10926B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1092790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10929B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1092A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1092BC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1092D24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1092EA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1092FE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10933B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,void *a34,void *a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51)
{
  void *v51;
  void *v52;
  uint64_t v53;

  _Block_object_dispose((const void *)(v53 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B10934A8()
{
  JUMPOUT(0x1B1093498);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B1093510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1093598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1093690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id EFAtomicObjectReleaseIfIdentical(unint64_t *a1, void *a2)
{
  unint64_t v2;
  int v3;

  while (1)
  {
    v2 = __ldaxr(a1);
    if ((void *)v2 != a2)
      break;
    if (!__stlxr(0, a1))
    {
      v3 = 1;
      goto LABEL_5;
    }
  }
  v3 = 0;
  __clrex();
LABEL_5:
  if (v3)
    return a2;
  else
    return 0;
}

void EFAtomicSetOnceObjectRelease(unint64_t *a1)
{
  void *v1;

  v1 = (void *)atomic_load(a1);

}

id EFAtomicSetOnceObjectLoad(unint64_t *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  id v5;
  void *v6;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = (void *)atomic_load(a1);
  v5 = v4;
  if (v4)
  {
    v6 = v5;
  }
  else
  {
    v3[2](v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v6 = v9;
      while (1)
      {
        v10 = (void *)__ldaxr(a1);
        if (v10)
          break;
        if (!__stlxr((unint64_t)v9, a1))
          goto LABEL_3;
      }
      __clrex();

      v11 = v10;
      v6 = v11;
    }
    else
    {
      v6 = 0;
    }
  }
LABEL_3:

  return v6;
}

void sub_1B10937F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10938D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10939C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1093B70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1093C3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1093CC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1093FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void addStringToIndexes(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v9 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __addStringToIndexes_block_invoke;
  v11[3] = &unk_1E62A5AA8;
  v12 = v9;
  v10 = v9;
  addValueToIndexesWithBlock(a1, a3, a4, a5, v11);

}

void sub_1B10940B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void addDataToIndexes(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v9 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __addDataToIndexes_block_invoke;
  v11[3] = &unk_1E62A5AA8;
  v12 = v9;
  v10 = v9;
  addValueToIndexesWithBlock(a1, a3, a4, a5, v11);

}

void sub_1B1094168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B109434C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10946AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id bestBloomFilterCandidate(void *a1, void *a2, unint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint32_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  char v24;
  char v25;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *context;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v29 = a1;
  v30 = a2;
  v8 = 0;
  v33 = 0;
  v34 = 0;
  do
  {
    v31 = v8;
    context = (void *)MEMORY[0x1B5E15A60]();
    v9 = arc4random();
    v10 = arc4random();
    v28 = v29;
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = v28;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    v14 = v10 | (unint64_t)(v9 << 32);
    if (v13)
    {
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            addStringToIndexes(v11, v17, a3, a4, v14);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              addDataToIndexes(v11, v17, a3, a4, v14);
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v13);
    }

    v18 = -[EFBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:]([EFBloomFilter alloc], "_initWithBucketCount:hashFunctionCount:seed:indexes:", a3, a4, v14, v11);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __bestBloomFilterCandidate_block_invoke;
    v35[3] = &unk_1E62A5AD0;
    v19 = v18;
    v36 = v19;
    objc_msgSend(v30, "ef_filter:", v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    if (v34 && v21 >= objc_msgSend(v33, "count"))
      goto LABEL_17;
    v22 = v19;

    v23 = v20;
    if (v21)
    {
      v33 = v23;
      v34 = v22;
LABEL_17:
      v24 = 0;
      goto LABEL_19;
    }
    v24 = 1;
    v33 = v23;
    v34 = v22;
LABEL_19:

    objc_autoreleasePoolPop(context);
    v8 = v31 + 1;
    if (v31 == 9)
      v25 = 1;
    else
      v25 = v24;
  }
  while ((v25 & 1) == 0);
  if (a5)
    *a5 = objc_retainAutorelease(v33);

  return v34;
}

void sub_1B1094A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{

  _Unwind_Resume(a1);
}

void sub_1B1094DB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1094FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  va_list va;

  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_1B10950D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t checkValueWithBlock(void *a1, void *a2)
{
  id *v3;
  void (**v4)(id, uint64_t, unint64_t *, _QWORD);
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v13;
  unint64_t v14;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "bucketCount");
  v6 = objc_msgSend(v3, "seed");
  v7 = objc_msgSend(v3, "hashFunctionCount");
  if (v7)
  {
    while (1)
    {
      v8 = v7 ^ v6;
      v14 = 0;
      v9 = v7 - 1;
      if (v7 == 1)
      {
        v4[2](v4, v8, &v14, 0);
        v9 = 1;
      }
      else
      {
        v13 = 0;
        ((void (**)(id, uint64_t, unint64_t *, unint64_t *))v4)[2](v4, v8, &v14, &v13);
        if ((objc_msgSend(v3[1], "containsIndex:", v13 % v5) & 1) == 0)
        {
          v10 = 0;
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v3[1], "containsIndex:", v14 % v5);
      v7 = v9 - 1;
      if (v9 == 1)
        v11 = 0;
      else
        v11 = v10;
      if ((v11 & 1) == 0)
        goto LABEL_12;
    }
  }
  v10 = 1;
LABEL_12:

  return v10;
}

void sub_1B10951F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10952C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10954D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109556C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109560C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10956B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109573C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10957C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void addValueToIndexesWithBlock(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void (**i)(id, uint64_t, unint64_t *, unint64_t *);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v9 = a1;
  for (i = a5; a3; a3 = v12 - 1)
  {
    v11 = a3 ^ a4;
    v14 = 0;
    v12 = a3 - 1;
    if (v12)
    {
      v13 = 0;
      i[2](i, v11, &v14, &v13);
      objc_msgSend(v9, "addIndex:", v13 % a2);
    }
    else
    {
      i[2](i, v11, &v14, 0);
      v12 = 1;
    }
    objc_msgSend(v9, "addIndex:", v14 % a2);
  }

}

void sub_1B10958B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

unint64_t __addStringToIndexes_block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, _DWORD *a4)
{
  unint64_t result;

  result = EFMurmurHash3String(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

unint64_t __addDataToIndexes_block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, _DWORD *a4)
{
  unint64_t result;

  result = EFMurmurHash3Data(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

uint64_t __bestBloomFilterCandidate_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "mayContainString:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "mayContainData:", v3);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

void sub_1B10959AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __appendIndexesToData_block_invoke(uint64_t result, unint64_t a2)
{
  char v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  v3 = result;
  v4 = a2 >> 6;
  if (a2 >> 6 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (*(_BYTE *)(result + 56))
      v6 = *(_QWORD *)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6;
    result = objc_msgSend(*(id *)(result + 32), "appendBytes:length:", *(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24, 8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) = 0;
    while (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) < v4)
      result = objc_msgSend(*(id *)(v3 + 32), "appendBytes:length:", *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24, 8);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) |= 1 << v2;
  return result;
}

void sub_1B1095C20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1095E2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1095FEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10960E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E62A41F0, MEMORY[0x1E0DE42E0]);
}

void sub_1B109614C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

os_log_t ___log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.email", "cacheable");
  _log_log = (uint64_t)result;
  return result;
}

void sub_1B1096200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFAutoCancelationToken;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B10963C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B1096428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1096580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t EFDataAreEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqualToData:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1B109663C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t EFStringsAreEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqualToString:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1B10966B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t EFAttributedStringsAreEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqualToAttributedString:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1B1096724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t EFDictionarysAreEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqualToDictionary:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_1B1096798(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const __CFString *EFContentProtectionStateDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E62A5C90[a1 + 1];
}

id _DiagnosticStateDictionary()
{
  id v0;
  void *v1;
  const __CFString *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = v0;
  if ((unint64_t)(sContentProtectionState + 1) > 4)
    v2 = CFSTR("unknown");
  else
    v2 = off_1E62A5C90[sContentProtectionState + 1];
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("Recorded state"));
  v3 = _KeyBagLockState() + 1;
  if (v3 > 4)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E62A5C90[v3];
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v4, CFSTR("System state"));
  MKBDeviceUnlockedSinceBoot();
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v5, CFSTR("Unlocked since boot"));

  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setTimeStyle:", 3);
  objc_msgSend(v6, "setDateStyle:", 2);
  if (*(double *)&_lastNotificationTime == 0.0)
  {
    v8 = CFSTR("never");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&_lastNotificationTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (*(double *)&_beganObservingTime == 0.0)
  {
    v10 = CFSTR("never");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&_beganObservingTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v8, CFSTR("Last lock_status notification"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v10, CFSTR("Began observing lock_status"));
  v11 = (id)_observers;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ef_map:", &__block_literal_global_3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v14, CFSTR("Observers"));

  }
  return v1;
}

void sub_1B1096A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v5;

  _Unwind_Resume(a1);
}

void sub_1B1096B58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void EFUnregisterContentProtectionObserver(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  if (!v1)
    __assert_rtn("EFUnregisterContentProtectionObserver", "EFContentProtectionObserver.m", 264, "nil != observer");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __EFUnregisterContentProtectionObserver_block_invoke;
  v3[3] = &unk_1E62A5860;
  v2 = v1;
  v4 = v2;
  _InitAndPerformSync(v3);

}

void sub_1B1096C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t EFContentProtectionGetObservedState()
{
  if (_InitObservation_sOnceToken != -1)
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_62);
  return sContentProtectionState;
}

void EFPerformSyncWithProtectedDataAvailability(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __EFPerformSyncWithProtectedDataAvailability_block_invoke;
  v3[3] = &unk_1E62A5B40;
  v4 = v1;
  v2 = v1;
  _InitAndPerformSync(v3);

}

void sub_1B1096D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void _NotifyObserversWithContentProtectionState(unint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *obj;
  _QWORD block[7];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)_observationQueue);
  if (a1 == -1)
    _NotifyObserversWithContentProtectionState_cold_1();
  v2 = sContentProtectionState;
  if (sContentProtectionState == -1)
    _NotifyObserversWithContentProtectionState_cold_2();
  _Log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == a1)
  {
    if (v4)
    {
      v5 = CFSTR("disabled");
      switch(a1)
      {
        case 0uLL:
          v5 = CFSTR("unlocked");
          break;
        case 1uLL:
          v5 = CFSTR("locked");
          break;
        case 2uLL:
          v5 = CFSTR("locking");
          break;
        case 3uLL:
          break;
        default:
          v5 = CFSTR("unknown");
          break;
      }
      *(_DWORD *)buf = 138543618;
      v26 = v5;
      v27 = 2114;
      v28 = v5;
      _os_log_impl(&dword_1B106E000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring lock state change from %{public}@ to %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v4)
    {
      if (v2 > 3)
        v6 = CFSTR("unknown");
      else
        v6 = off_1E62A5C70[v2];
      if (a1 > 3)
        v7 = CFSTR("unknown");
      else
        v7 = off_1E62A5C70[a1];
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1B106E000, v3, OS_LOG_TYPE_DEFAULT, "Keybag transitioning from %{public}@ to %{public}@", buf, 0x16u);
    }

    if (a1 != 1 || v2)
    {
      if (v2)
      {
        if (v2 == 1)
        {
          if (!a1)
            goto LABEL_31;
        }
        else if (v2 == 2 && a1 < 2)
        {
          goto LABEL_31;
        }
      }
      else if (a1 == 2)
      {
        goto LABEL_31;
      }
    }
    else
    {
      _Log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        _NotifyObserversWithContentProtectionState_cold_4(v8);

    }
    _Log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      _NotifyObserversWithContentProtectionState_cold_3(v9);

    do
    {
LABEL_31:
      v10 = __ldaxr((unsigned int *)&sContentProtectionState);
      if (v10 != (_DWORD)v2)
      {
        __clrex();
        return;
      }
    }
    while (__stlxr(a1, (unsigned int *)&sContentProtectionState));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend((id)_observers, "allValues");
    obj = objc_claimAutoreleasedReturnValue();
    v3 = obj;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          v15 = a1;
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "queue");
          v17 = objc_claimAutoreleasedReturnValue();
          block[0] = v13;
          block[1] = 3221225472;
          block[2] = ___NotifyObserversWithContentProtectionState_block_invoke;
          block[3] = &unk_1E62A5C50;
          block[4] = v16;
          block[5] = v15;
          a1 = v15;
          block[6] = v2;
          dispatch_async(v17, block);

        }
        v3 = obj;
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
  }

}

void sub_1B10970EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void EFContentProtectionSimulateState(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __EFContentProtectionSimulateState_block_invoke;
  v1[3] = &__block_descriptor_40_e5_v8__0l;
  v1[4] = a1;
  _InitAndPerformSync(v1);
}

id EFContentProtectionDumpDiagnosticState()
{
  void *v0;
  id v1;
  _QWORD v3[4];
  id v4;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n==== EFContentProtectionObserver ====\n"));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __EFContentProtectionDumpDiagnosticState_block_invoke;
  v3[3] = &unk_1E62A5860;
  v1 = v0;
  v4 = v1;
  _InitAndPerformSync(v3);

  return v1;
}

void sub_1B10971EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B1097284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B10973D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109742C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFDeallocInvocationToken;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B10974A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EFDebouncer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B1097504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1097620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1097728(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void WithDeviceIsInternal(void *a1, uint64_t a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WithDeviceIsInternal(void (^ _Nonnull __strong)(void), BOOL)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("EFDevice.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  +[EFDevice testingDeviceWithInternal:](EFDevice, "testingDeviceWithInternal:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EFDevice setCurrentDevice:](EFDevice, "setCurrentDevice:", v4);

  v3[2](v3);
  +[EFDevice setCurrentDevice:](EFDevice, "setCurrentDevice:", 0);

}

void sub_1B1097A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B1097C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1097E5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10982B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B1098830(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10989AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1B10989D8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1B1098980);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_1B1098C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B1098CEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1098E70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1098F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_s *v10;

  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1B10990B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  os_unfair_lock_s *v4;

  os_unfair_lock_unlock(v4);

  _Unwind_Resume(a1);
}

void sub_1B1099150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_s *v10;

  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1B1099634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  void *v32;

  _Unwind_Resume(a1);
}

void sub_1B10997A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1099844(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10998CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1099B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B1099C60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1B1099D14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1099DFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1099E84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1099F1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B1099FA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109A02C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109A0C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109A164(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109A1D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109A244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109A304(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109A374(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109A3F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109A4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B109A588(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109A688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1B109A814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B109A8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109A9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B109AABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109AB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109ADAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B109AEA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109B004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B109B100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B109B21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109B334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1B109B40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B109B494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B109B52C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109B5D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109B684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B109B718(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void test_setUse32BitMurmurHash3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "threadDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("EFHashing.UseMurmur3x86-32"));

}

void sub_1B109B878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void test_unsetUse32BitMurmurHash3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "threadDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", 0, CFSTR("EFHashing.UseMurmur3x86-32"));

}

void sub_1B109B8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t is32Bit()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  if (is32Bit_onceToken != -1)
    dispatch_once(&is32Bit_onceToken, &__block_literal_global_7);
  if (!EFIsRunningUnitTests())
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("EFHashing.UseMurmur3x86-32"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

void sub_1B109B9B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

unint64_t EFMurmurHash3String(void *a1, uint64_t a2, _DWORD *a3)
{
  void *v5;
  unint64_t v6;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = EFMurmurHash3Data(v5, a2, a3);

  return v6;
}

void sub_1B109BA2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t EFMurmurHash3Data(void *a1, uint64_t a2, _DWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  id v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned __int8 *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  int *v46;
  int v47;
  unint64_t v48;
  int v49;
  unsigned __int8 *v50;
  unint64_t v51;
  unsigned int v52;
  unint64_t v53;
  int *v54;
  int v55;
  unint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  unsigned __int8 *v71;
  int v72;
  uint32x4_t v73;
  int8x16_t v74;
  int8x16_t v75;
  int32x4_t v76;
  unsigned int v77;
  id v79;

  v5 = a1;
  if (is32Bit())
  {
    v6 = v5;
    v7 = v6;
    if (a3)
    {
      v8 = objc_msgSend(v6, "length");
      v9 = objc_retainAutorelease(v7);
      v10 = objc_msgSend(v9, "bytes");
      v79 = v5;
      if (v8 >= 0x10)
      {
        v53 = v8 >> 4;
        v54 = (int *)(v10 + 8);
        v13 = a2;
        v12 = a2;
        v11 = a2;
        do
        {
          v55 = *(v54 - 1);
          HIDWORD(v56) = (-1425107063 * ((-888307712 * *(v54 - 2)) | ((597399067 * *(v54 - 2)) >> 17))) ^ a2;
          LODWORD(v56) = HIDWORD(v56);
          v57 = *v54;
          v58 = v54[1];
          v54 += 4;
          LODWORD(a2) = 5 * ((v56 >> 13) + v13) + 1444728091;
          HIDWORD(v56) = (951274213 * ((-1752629248 * v55) | ((-1425107063 * v55) >> 16))) ^ v13;
          LODWORD(v56) = HIDWORD(v56);
          v13 = 5 * ((v56 >> 15) + v12) + 197830471;
          HIDWORD(v56) = (-1578923117 * ((-1781923840 * v57) | ((951274213 * v57) >> 15))) ^ v12;
          LODWORD(v56) = HIDWORD(v56);
          v59 = 5 * ((v56 >> 17) + v11);
          HIDWORD(v56) = (597399067 * ((-1953300480 * v58) | ((-1578923117 * v58) >> 16))) ^ v11;
          LODWORD(v56) = HIDWORD(v56);
          v12 = v59 - 1764942795;
          v11 = 5 * ((v56 >> 19) + a2) + 850148119;
          --v53;
        }
        while (v53);
      }
      else
      {
        v11 = a2;
        v12 = a2;
        v13 = a2;
      }
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = (unsigned __int8 *)(v10 + (v8 & 0xFFFFFFFFFFFFFFF0));
      switch(v8 & 0xF)
      {
        case 1uLL:
          goto LABEL_55;
        case 2uLL:
          goto LABEL_54;
        case 3uLL:
          goto LABEL_53;
        case 4uLL:
          goto LABEL_52;
        case 5uLL:
          goto LABEL_51;
        case 6uLL:
          goto LABEL_50;
        case 7uLL:
          goto LABEL_49;
        case 8uLL:
          goto LABEL_48;
        case 9uLL:
          goto LABEL_47;
        case 0xAuLL:
          goto LABEL_46;
        case 0xBuLL:
          goto LABEL_45;
        case 0xCuLL:
          goto LABEL_44;
        case 0xDuLL:
          goto LABEL_43;
        case 0xEuLL:
          goto LABEL_42;
        case 0xFuLL:
          v60 = v71[14] << 16;
LABEL_42:
          v61 = v60 | (v71[13] << 8);
LABEL_43:
          v11 ^= 597399067 * ((776732672 * (v61 ^ v71[12])) | ((-1578923117 * (v61 ^ v71[12])) >> 14));
LABEL_44:
          v62 = v71[11] << 24;
LABEL_45:
          v63 = v62 | (v71[10] << 16);
LABEL_46:
          v64 = v63 ^ (v71[9] << 8);
LABEL_47:
          v12 ^= -1578923117 * ((-1781923840 * (v64 ^ v71[8])) | ((951274213 * (v64 ^ v71[8])) >> 15));
LABEL_48:
          v65 = v71[7] << 24;
LABEL_49:
          v66 = v65 | (v71[6] << 16);
LABEL_50:
          v67 = v66 ^ (v71[5] << 8);
LABEL_51:
          v13 ^= 951274213 * ((-1752629248 * (v67 ^ v71[4])) | ((-1425107063 * (v67 ^ v71[4])) >> 16));
LABEL_52:
          v68 = v71[3] << 24;
LABEL_53:
          v69 = v68 | (v71[2] << 16);
LABEL_54:
          v70 = v69 ^ (v71[1] << 8);
LABEL_55:
          LODWORD(a2) = (-1425107063 * ((-888307712 * (v70 ^ *v71)) | ((597399067 * (v70 ^ *v71)) >> 17))) ^ a2;
          break;
        default:
          break;
      }
      v72 = v11 ^ v8;
      v73.i32[0] = (v12 ^ v8) + (v13 ^ v8) + (a2 ^ v8) + v72;
      v73.i32[1] = v73.i32[0] + (v13 ^ v8);
      v73.i32[2] = v73.i32[0] + (v12 ^ v8);
      v73.i32[3] = v73.i32[0] + v72;
      v74 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v73, 0x10uLL), (int8x16_t)v73), vdupq_n_s32(0x85EBCA6B));
      v75 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v74, 0xDuLL), v74), vdupq_n_s32(0xC2B2AE35));
      v76 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v75, 0x10uLL), v75);
      v77 = vaddvq_s32(v76);
      v41 = v77;
      *a3 = v77 + v76.i32[1];

      v5 = v79;
      goto LABEL_57;
    }
    v42 = objc_msgSend(v6, "length");
    v43 = objc_retainAutorelease(v7);
    v44 = objc_msgSend(v43, "bytes");
    if (v42 >= 4)
    {
      v45 = v42 >> 2;
      v46 = (int *)v44;
      do
      {
        v47 = *v46++;
        HIDWORD(v48) = (461845907 * ((380141568 * v47) | ((-862048943 * v47) >> 17))) ^ a2;
        LODWORD(v48) = HIDWORD(v48);
        LODWORD(a2) = 5 * (v48 >> 19) - 430675100;
        --v45;
      }
      while (v45);
    }
    v49 = 0;
    v50 = (unsigned __int8 *)(v44 + (v42 & 0xFFFFFFFFFFFFFFFCLL));
    v51 = v42 & 3;
    if (v51 != 1)
    {
      if (v51 != 2)
      {
        if (v51 != 3)
        {
LABEL_37:
          v52 = -2048144789 * (a2 ^ v42 ^ ((a2 ^ v42) >> 16));
          v41 = (-1028477387 * (v52 ^ (v52 >> 13))) ^ ((-1028477387 * (v52 ^ (v52 >> 13))) >> 16);

          goto LABEL_57;
        }
        v49 = v50[2] << 16;
      }
      v49 |= v50[1] << 8;
    }
    LODWORD(a2) = (461845907 * ((380141568 * (v49 ^ *v50)) | ((-862048943 * (v49 ^ *v50)) >> 17))) ^ a2;
    goto LABEL_37;
  }
  v14 = v5;
  v15 = objc_msgSend(v14, "length");
  v16 = objc_retainAutorelease(v14);
  v17 = objc_msgSend(v16, "bytes");
  if (v15 >= 0x10)
  {
    v19 = v15 >> 4;
    v20 = (_QWORD *)(v17 + 8);
    v18 = a2;
    do
    {
      a2 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v20 - 1)) | ((0x87C37B91114253D5 * *(v20 - 1)) >> 33))) ^ a2, 37)+ v18)+ 1390208809;
      v18 = 5
          * (a2
           + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v20) | ((unint64_t)(0x4CF5AD432745937FLL * *v20) >> 31))) ^ v18, 33))+ 944331445;
      v20 += 2;
      --v19;
    }
    while (v19);
  }
  else
  {
    v18 = a2;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = (unsigned __int8 *)(v17 + (v15 & 0xFFFFFFFFFFFFFFF0));
  switch(v15 & 0xF)
  {
    case 1uLL:
      goto LABEL_24;
    case 2uLL:
      goto LABEL_23;
    case 3uLL:
      goto LABEL_22;
    case 4uLL:
      goto LABEL_21;
    case 5uLL:
      goto LABEL_20;
    case 6uLL:
      goto LABEL_19;
    case 7uLL:
      goto LABEL_18;
    case 8uLL:
      goto LABEL_17;
    case 9uLL:
      goto LABEL_16;
    case 0xAuLL:
      goto LABEL_15;
    case 0xBuLL:
      goto LABEL_14;
    case 0xCuLL:
      goto LABEL_13;
    case 0xDuLL:
      goto LABEL_12;
    case 0xEuLL:
      goto LABEL_11;
    case 0xFuLL:
      v21 = (unint64_t)v34[14] << 48;
LABEL_11:
      v22 = v21 | ((unint64_t)v34[13] << 40);
LABEL_12:
      v23 = v22 ^ ((unint64_t)v34[12] << 32);
LABEL_13:
      v24 = v23 ^ ((unint64_t)v34[11] << 24);
LABEL_14:
      v25 = v24 ^ ((unint64_t)v34[10] << 16);
LABEL_15:
      v26 = v25 ^ ((unint64_t)v34[9] << 8);
LABEL_16:
      v18 ^= 0x87C37B91114253D5
           * ((0x4E8B26FE00000000 * (v26 ^ v34[8])) | ((0x4CF5AD432745937FLL * (v26 ^ v34[8])) >> 31));
LABEL_17:
      v27 = (unint64_t)v34[7] << 56;
LABEL_18:
      v28 = v27 | ((unint64_t)v34[6] << 48);
LABEL_19:
      v29 = v28 ^ ((unint64_t)v34[5] << 40);
LABEL_20:
      v30 = v29 ^ ((unint64_t)v34[4] << 32);
LABEL_21:
      v31 = v30 ^ ((unint64_t)v34[3] << 24);
LABEL_22:
      v32 = v31 ^ ((unint64_t)v34[2] << 16);
LABEL_23:
      v33 = v32 ^ ((unint64_t)v34[1] << 8);
LABEL_24:
      a2 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v33 ^ *v34)) | ((0x87C37B91114253D5 * (v33 ^ *v34)) >> 33));
      break;
    default:
      break;
  }
  v35 = (a2 ^ v15) + (v18 ^ v15);
  v36 = v35 + (v18 ^ v15);
  v37 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v35 ^ (v35 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v35 ^ (v35 >> 33))) >> 33));
  v38 = v37 ^ (v37 >> 33);
  v39 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v36 ^ (v36 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v36 ^ (v36 >> 33))) >> 33));
  v40 = v39 ^ (v39 >> 33);
  v41 = v40 + v38;
  if (a3)
    *(_QWORD *)a3 = v41 + v40;

LABEL_57:
  return v41;
}

void sub_1B109C0F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109C1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B109C2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B109C3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B109C590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B109C64C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109C6A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1B109C740(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109C7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  std::__tree<long long>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void sub_1B109CAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,_QWORD *a21)
{
  uint64_t v21;

  std::__tree<long long>::destroy(v21, a21);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  std::__tree<long long>::destroy(a1 + 48, *(_QWORD **)(a1 + 56));
}

void sub_1B109CC3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109CE04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B109CEFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109D004(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109D074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  std::__tree<long long>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

uint64_t *std::set<long long>::insert[abi:ne180100]<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(uint64_t *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t **v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<long long>::__emplace_hint_unique_key_args<long long,long long const&>(v5, v6, v4 + 4, v4 + 4);
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

void sub_1B109D20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109D2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _QWORD *a10)
{
  void *v10;

  std::__tree<long long>::destroy((uint64_t)&a9, a10);

  _Unwind_Resume(a1);
}

uint64_t *std::__tree<long long>::__node_insert_multi(uint64_t **a1, uint64_t *a2)
{
  uint64_t **v3;
  uint64_t *v4;
  uint64_t **v5;

  v3 = a1 + 1;
  v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        v3 = (uint64_t **)v4;
        if (a2[4] >= v4[4])
          break;
        v4 = (uint64_t *)*v4;
        v5 = v3;
        if (!*v3)
          goto LABEL_8;
      }
      v4 = (uint64_t *)v4[1];
    }
    while (v4);
    v5 = v3 + 1;
  }
  else
  {
    v5 = a1 + 1;
  }
LABEL_8:
  std::__tree<long long>::__insert_node_at(a1, (uint64_t)v3, v5, a2);
  return a2;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

_QWORD *std::__tree<long long>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<long long>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<long long>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<long long>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

uint64_t *std::__tree<long long>::__emplace_multi<long long const&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;

  v4 = (uint64_t *)operator new(0x28uLL);
  v5 = *a2;
  v4[4] = *a2;
  v6 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        v6 = (uint64_t **)v7;
        if (v5 >= v7[4])
          break;
        v7 = (uint64_t *)*v7;
        v8 = v6;
        if (!*v6)
          goto LABEL_8;
      }
      v7 = (uint64_t *)v7[1];
    }
    while (v7);
    v8 = v6 + 1;
  }
  else
  {
    v8 = a1 + 1;
  }
LABEL_8:
  std::__tree<long long>::__insert_node_at(a1, (uint64_t)v6, v8, v4);
  return v4;
}

uint64_t *std::set<long long>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<long long>::insert[abi:ne180100]<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(a1, *(_QWORD **)a2, (_QWORD *)(a2 + 8));
  return a1;
}

void sub_1B109D664(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<long long>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<long long>::__emplace_hint_unique_key_args<long long,long long const&>(uint64_t **a1, _QWORD *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v10;
  uint64_t v11;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (uint64_t **)std::__tree<long long>::__find_equal<long long>(a1, a2, &v11, &v10, a3);
  v7 = *v6;
  if (!*v6)
  {
    v8 = v6;
    v7 = (uint64_t *)operator new(0x28uLL);
    v7[4] = *a4;
    std::__tree<long long>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

_QWORD *std::__tree<long long>::__find_equal<long long>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, uint64_t *a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    v8 = *a2;
    if ((_QWORD *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (_QWORD *)*a2;
      do
      {
        v10 = v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (_QWORD *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (v10[4] < *a5)
      goto LABEL_17;
    v16 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = v16;
          v18 = v16[4];
          if (v15 >= v18)
            break;
          v16 = (_QWORD *)*v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = (_QWORD *)v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (_QWORD *)a2[1];
    do
    {
      a4 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (_QWORD *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          v22 = v20[4];
          if (v6 >= v22)
            break;
          v20 = (_QWORD *)*v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = (_QWORD *)v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t std::__tree<long long>::__erase_unique<long long>(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 < v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (!v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  std::__tree<long long>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<long long>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

double std::__set_intersection[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::insert_iterator<std::set<long long>>>@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  _QWORD *v19;
  _QWORD *v20;
  double result;
  __int128 v22;

  *(_QWORD *)&v22 = a5;
  *((_QWORD *)&v22 + 1) = a6;
  if (a1 != a2)
  {
    v10 = a3;
    if (a3 != a4)
    {
      v11 = a1;
      do
      {
        v12 = v11[4];
        v13 = v10[4];
        if (v12 >= v13)
        {
          if (v13 >= v12)
          {
            std::insert_iterator<std::set<long long>>::operator=[abi:ne180100]((uint64_t)&v22, v11 + 4);
            v17 = (_QWORD *)v11[1];
            if (v17)
            {
              do
              {
                v16 = v17;
                v17 = (_QWORD *)*v17;
              }
              while (v17);
            }
            else
            {
              do
              {
                v16 = (_QWORD *)v11[2];
                v18 = *v16 == (_QWORD)v11;
                v11 = v16;
              }
              while (!v18);
            }
          }
          else
          {
            v16 = v11;
          }
          v19 = (_QWORD *)v10[1];
          if (v19)
          {
            do
            {
              v10 = v19;
              v19 = (_QWORD *)*v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              v20 = v10;
              v10 = (_QWORD *)v10[2];
            }
            while ((_QWORD *)*v10 != v20);
          }
          v11 = v16;
        }
        else
        {
          v14 = (_QWORD *)v11[1];
          if (v14)
          {
            do
            {
              v11 = v14;
              v14 = (_QWORD *)*v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              v15 = v11;
              v11 = (_QWORD *)v11[2];
            }
            while ((_QWORD *)*v11 != v15);
          }
        }
      }
      while (v11 != a2 && v10 != a4);
    }
  }
  *(_QWORD *)a7 = a2;
  *(_QWORD *)(a7 + 8) = a4;
  result = *(double *)&v22;
  *(_OWORD *)(a7 + 16) = v22;
  return result;
}

uint64_t std::insert_iterator<std::set<long long>>::operator=[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  BOOL v6;

  v3 = std::__tree<long long>::__emplace_hint_unique_key_args<long long,long long const&>(*(uint64_t ***)a1, *(_QWORD **)(a1 + 8), a2, a2);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = (uint64_t *)v3[1];
  if (v4)
  {
    do
    {
      v5 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  else
  {
    do
    {
      v5 = (uint64_t *)v3[2];
      v6 = *v5 == (_QWORD)v3;
      v3 = v5;
    }
    while (!v6);
  }
  *(_QWORD *)(a1 + 8) = v5;
  return a1;
}

void sub_1B109DF10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B109DF70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109DFDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109E0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B109E190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109E220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109E2A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109E2FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109E360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B109E470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B109E52C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109E580(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109E5D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109E678(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109E6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B109E778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B109E7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B109E88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B109E920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109E998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109EBD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1B109EFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B109F0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B109F190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109F23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109F428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B109F4FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109F660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109F808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;

  os_unfair_lock_unlock(v3);
  _Unwind_Resume(a1);
}

void sub_1B109F8EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B109FA98(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  void *v2;
  void *v3;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B109FB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B109FC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B109FD94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109FE28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B109FEBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t EFRoundUnsignedInteger(unint64_t result, unint64_t a2)
{
  double v3;
  double v4;
  double v5;

  if (result)
  {
    v3 = (double)result;
    v4 = log10((double)result);
    v5 = __exp10((double)(int)((double)a2 - ceil(v4)));
    return (unint64_t)((double)(uint64_t)llround(v5 * v3) / v5);
  }
  return result;
}

long double _EFARC4NormallyDistributedRandomDouble(long double *a1, double a2, double a3)
{
  long double v6;
  double v7;
  long double v8;
  double v9;
  double v10;

  v6 = (double)arc4random() / 4294967300.0 * 1.0 + 2.22044605e-16;
  v7 = (double)arc4random() / 4294967300.0;
  v8 = log(v6);
  v9 = v7 * 6.28318531;
  v10 = sqrt(v8 * -2.0);
  if (a1)
    *a1 = a2 + sin(v9) * v10 * a3;
  return a2 + cos(v9) * v10 * a3;
}

long double EFARC4NormallyDistributedRandomDouble(double a1, double a2)
{
  return _EFARC4NormallyDistributedRandomDouble(0, a1, a2);
}

void EFARC4NormallyDistributedRandomDoubleWithMinimum(double a1, double a2, double a3)
{
  EFARC4NormallyDistributedRandomDoubleInRange(a1, a2, a3, 1.79769313e308);
}

void EFARC4NormallyDistributedRandomDoubleInRange(double a1, double a2, double a3, double a4)
{
  double v8;
  void *v11;
  void *v12;
  double v13;

  if (a4 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "double EFARC4NormallyDistributedRandomDoubleInRange(double, double, double, double)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("EFMathUtilities.m"), 46, CFSTR("max must be greater than min"));

  }
  do
  {
    v13 = 0.0;
    v8 = _EFARC4NormallyDistributedRandomDouble(&v13, a1, a2);
    if (v8 >= a3 && v8 <= a4)
      break;
  }
  while (v13 < a3 || v13 > a4);
}

void sub_1B10A0154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A01C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A0264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A0304(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A0400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A0548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A05E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t kCompareTuples_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "index");
  if (v6 >= objc_msgSend(v5, "index"))
  {
    v8 = objc_msgSend(v4, "index");
    v7 = v8 > objc_msgSend(v5, "index");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void sub_1B10A06EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A0784(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A0850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10A0B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B10A0C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A0D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B10A0DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A0E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B10A0EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A0FEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A1080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A1164(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A11B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A1200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A1264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A14BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A15F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _ef_log_EFNetworkStatus()
{
  if (_ef_log_EFNetworkStatus_onceToken != -1)
    dispatch_once(&_ef_log_EFNetworkStatus_onceToken, &__block_literal_global_11);
  return (id)_ef_log_EFNetworkStatus_log;
}

void sub_1B10A1714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A18C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A1AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id *v20;
  void *v21;
  void *v22;

  v22 = v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);

  _Unwind_Resume(a1);
}

void sub_1B10A1BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10A1C60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A1CCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A1D38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A1EFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A1FF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A2178(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A2204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A22A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A234C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A23A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A2484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1B10A2528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A2728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10A2838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A2A30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A2B40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A2E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A2EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A2F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B10A30A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10A31A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A32A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A33A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A34A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A35A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A36A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A37A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A3834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A38B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A39C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A3A94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A3B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10A3CB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A3DA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A3E38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A3EDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A3FBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A402C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A4108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A41D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

id EFComparatorFromSortDescriptors(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSComparator  _Nonnull EFComparatorFromSortDescriptors(NSArray<NSSortDescriptor *> *__strong _Nonnull)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("EFNSComparatorAdditions.m"), 11, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortDescriptors"));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __EFComparatorFromSortDescriptors_block_invoke;
  aBlock[3] = &unk_1E62A6388;
  v8 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);

  return v3;
}

void sub_1B10A4350(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A4494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A4610(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A4788(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A492C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A49BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A4A6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A4AD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A4C54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10A4D84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A4E88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A4F4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A5068(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10A51A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10A52D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10A53E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A54C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B10A5568(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A5664(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A57C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10A5854(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A58B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A5948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A59D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _sharedShortDateFormatter()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)_sharedShortDateFormatter___sharedShortDateFormatter;
  if (!_sharedShortDateFormatter___sharedShortDateFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)_sharedShortDateFormatter___sharedShortDateFormatter;
    _sharedShortDateFormatter___sharedShortDateFormatter = (uint64_t)v1;

    objc_msgSend((id)_sharedShortDateFormatter___sharedShortDateFormatter, "setTimeStyle:", 1);
    objc_msgSend((id)_sharedShortDateFormatter___sharedShortDateFormatter, "setDateStyle:", 1);
    v0 = (void *)_sharedShortDateFormatter___sharedShortDateFormatter;
  }
  return v0;
}

id _sharedLongDateFormatter()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)_sharedLongDateFormatter___sharedLongDateFormatter;
  if (!_sharedLongDateFormatter___sharedLongDateFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)_sharedLongDateFormatter___sharedLongDateFormatter;
    _sharedLongDateFormatter___sharedLongDateFormatter = (uint64_t)v1;

    objc_msgSend((id)_sharedLongDateFormatter___sharedLongDateFormatter, "setTimeStyle:", 1);
    objc_msgSend((id)_sharedLongDateFormatter___sharedLongDateFormatter, "setDateStyle:", 3);
    objc_msgSend((id)_sharedLongDateFormatter___sharedLongDateFormatter, "setDoesRelativeDateFormatting:", 1);
    v0 = (void *)_sharedLongDateFormatter___sharedLongDateFormatter;
  }
  return v0;
}

void sub_1B10A5CBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A5D38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A5DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t ___sharedMediumRelativeDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter;
  _sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter = (uint64_t)v0;

  objc_msgSend((id)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter, "setTimeStyle:", 1);
  objc_msgSend((id)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter, "setDoesRelativeDateFormatting:", 1);
}

uint64_t ___sharedMediumRelativeDateOnlyFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter;
  _sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter = (uint64_t)v0;

  objc_msgSend((id)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter, "setDoesRelativeDateFormatting:", 1);
}

uint64_t ___sharedShortTimeFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_sharedShortTimeFormatter__sharedShortTimeFormatter;
  _sharedShortTimeFormatter__sharedShortTimeFormatter = (uint64_t)v0;

  return objc_msgSend((id)_sharedShortTimeFormatter__sharedShortTimeFormatter, "setTimeStyle:", 1);
}

void sub_1B10A5F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A5FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B10A60A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A6160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B10A6208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A6348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B10A645C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10A6514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A65EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10A6780(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A67F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A6848(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A68A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A68F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A6950(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A69A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A6B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B10A6D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B10A6E54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t __stringForPublicInfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@=%@"), a2, a3);
}

void sub_1B10A6F60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A7198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A7254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A739C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A7500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10A7608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A7740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A7840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A78DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A7990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A79F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A7A7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _sharedIntegerWithGroupingFormatter()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter;
  if (!_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v2 = (void *)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter;
    _sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter = (uint64_t)v1;

    objc_msgSend((id)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter, "setUsesGroupingSeparator:", 1);
    objc_msgSend((id)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter, "setGroupingSize:", 3);
    v0 = (void *)_sharedIntegerWithGroupingFormatter___sharedIntegerWithGroupingFormatter;
  }
  return v0;
}

id _sharedIntegerFormatter()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)_sharedIntegerFormatter___sharedIntegerFormatter;
  if (!_sharedIntegerFormatter___sharedIntegerFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v2 = (void *)_sharedIntegerFormatter___sharedIntegerFormatter;
    _sharedIntegerFormatter___sharedIntegerFormatter = (uint64_t)v1;

    objc_msgSend((id)_sharedIntegerFormatter___sharedIntegerFormatter, "setUsesGroupingSeparator:", 0);
    v0 = (void *)_sharedIntegerFormatter___sharedIntegerFormatter;
  }
  return v0;
}

void sub_1B10A7BB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A7C98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A7D84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A7E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10A7F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A8164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A8224(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A839C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  id *v3;
  id *v4;

  _Unwind_Resume(a1);
}

void sub_1B10A84C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A87A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,char a31)
{
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1B10A8904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A89B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A8AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1B10A8CC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A8EB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A9080(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B10A92FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A944C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A952C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10A9674(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A9804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10A98B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A9940(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A99D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10A9AE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10A9BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10A9C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10A9DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B10A9E68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__CFString *operatorDescriptionForPredicate(void *a1)
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "compoundPredicateType");
  if (v1 > 2)
    return 0;
  else
    return off_1E62A6770[v1];
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1B10A9F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10AA02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10AA1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B10AA2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10AA440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B10AA554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AA698(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10AA758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10AA8E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AAB18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AAD30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AAE9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AAF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10AB0C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AB254(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10AB328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AB384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10AB464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10AB4F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AB618(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

CFStringRef EFStringWithInt(int a1)
{
  __int128 v1;
  int v2;
  char __str[16];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  v5 = v1;
  v2 = snprintf(__str, 0x20uLL, "%d", a1);
  return (id)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);
}

CFStringRef EFStringWithUInt64(uint64_t a1)
{
  __int128 v1;
  int v2;
  char __str[16];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  v5 = v1;
  v2 = snprintf(__str, 0x20uLL, "%llu", a1);
  return (id)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);
}

CFStringRef EFStringWithUnsignedInteger(uint64_t a1)
{
  __int128 v1;
  int v2;
  char __str[16];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v1;
  v5 = v1;
  v2 = snprintf(__str, 0x20uLL, "%lu", a1);
  return (id)CFStringCreateWithBytes(0, (const UInt8 *)__str, v2, 0x600u, 0);
}

void sub_1B10AB8C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10ABF8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AC02C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AC378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10AC45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10AC5D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AC698(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AC838(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AC920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AC978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AC9E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10ACA60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10ACAC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10ACB7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10ACBB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10ACCFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B10ACFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B10AD144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B10AD234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10AD398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B10AD460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_1B10AD4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10AD65C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AD708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AD7A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AD99C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10ADAE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10ADBB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10ADD98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10ADE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10ADFAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AE068(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AE0E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AE18C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AE220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AE314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AE404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10AE4A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *_EFRepairString(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  __CFString *v3;
  __CFString *v4;
  const char *CStringPtr;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __int128 v10;
  CFIndex Length;
  const char *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  UniChar v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  UniChar v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  CFRange v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  __int128 v31;
  CFIndex v32;
  const char *v33;
  uint64_t v34;
  int64_t v35;
  BOOL v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;
  CFIndex v40;
  UniChar v41;
  BOOL v42;
  void *v43;
  int64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  int64_t v50;
  __CFString *v51;
  _WORD v52[2];
  __int16 v53;
  UniChar buffer[8];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __CFString *v62;
  const UniChar *CharactersPtr;
  unint64_t v64;
  uint64_t v65;
  CFIndex v66;
  int64_t v67;
  int64_t v68;
  CFRange v69;

  v1 = a1;
  if (-[__CFString length](v1, "length"))
  {
    v2 = -[__CFString fastestEncoding](v1, "fastestEncoding");
    if (v2 != 4 && v2 != 1)
    {
      CStringPtr = CFStringGetCStringPtr(v1, 4u);
      v7 = v1;
      v8 = v7;
      if (CStringPtr)
      {
        v4 = v7;
        goto LABEL_6;
      }
      objc_opt_self();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {

LABEL_43:
        v3 = v8;
        goto LABEL_5;
      }
      v68 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v67 = 0xAAAAAAAAAAAAAAAALL;
      v64 = 0xAAAAAAAAAAAAAAAALL;
      v60 = v10;
      v61 = v10;
      v58 = v10;
      v59 = v10;
      v56 = v10;
      v57 = v10;
      *(_OWORD *)buffer = v10;
      v55 = v10;
      Length = CFStringGetLength(v8);
      v62 = v8;
      v65 = 0;
      v66 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      if (CharactersPtr)
        v12 = 0;
      else
        v12 = CFStringGetCStringPtr(v8, 0x600u);
      v64 = (unint64_t)v12;
      v67 = 0;
      v68 = 0;
      if (Length >= 1)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 1;
        v18 = 64;
        while (1)
        {
          if ((unint64_t)v15 >= 4)
            v19 = 4;
          else
            v19 = v15;
          if (v66 <= v15)
          {
            if (v16 >> 10 == 54)
              goto LABEL_41;
            v20 = 0;
          }
          else
          {
            if (CharactersPtr)
            {
              v20 = CharactersPtr[v15 + v65];
            }
            else if (v64)
            {
              v20 = *(char *)(v64 + v65 + v15);
            }
            else
            {
              if (v68 <= v15 || v14 > v15)
              {
                v22 = -v19;
                v23 = v19 + v13;
                v24 = v18 - v19;
                v25 = v15 + v22;
                v26 = v25 + 64;
                if (v25 + 64 >= v66)
                  v26 = v66;
                v67 = v25;
                v68 = v26;
                v27.location = v25 + v65;
                if (v66 >= v24)
                  v28 = v24;
                else
                  v28 = v66;
                v27.length = v28 + v23;
                CFStringGetCharacters(v62, v27, buffer);
                v14 = v67;
              }
              v20 = buffer[v15 - v14];
            }
            if ((v16 >> 10 == 54) != (v20 >> 10 == 55))
              goto LABEL_41;
          }
          v17 = ++v15 < Length;
          --v13;
          ++v18;
          v16 = v20;
          if (Length == v15)
            goto LABEL_41;
        }
      }
      v16 = 0;
      v17 = 0;
LABEL_41:

      if (!v17 && (v16 & 0xFC00) != 0xD800)
        goto LABEL_43;
      v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", -[__CFString length](v8, "length"));
      v29 = v8;
      objc_opt_self();
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v60 = v31;
        v61 = v31;
        v58 = v31;
        v59 = v31;
        v56 = v31;
        v57 = v31;
        *(_OWORD *)buffer = v31;
        v55 = v31;
        v51 = v29;
        v32 = CFStringGetLength(v29);
        v62 = v29;
        v65 = 0;
        v66 = v32;
        CharactersPtr = CFStringGetCharactersPtr(v29);
        if (CharactersPtr)
          v33 = 0;
        else
          v33 = CFStringGetCStringPtr(v29, 0x600u);
        v64 = (unint64_t)v33;
        v67 = 0;
        v68 = 0;
        if (v32 >= 1)
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 64;
          do
          {
            if ((unint64_t)v35 >= 4)
              v39 = 4;
            else
              v39 = v35;
            v53 = -21846;
            v40 = v66;
            if (v66 <= v35)
            {
              v42 = 0;
              v53 = 0;
            }
            else
            {
              if (CharactersPtr)
              {
                v41 = CharactersPtr[v35 + v65];
              }
              else if (v64)
              {
                v41 = *(char *)(v64 + v65 + v35);
              }
              else
              {
                v44 = v67;
                if (v68 <= v35 || v67 > v35)
                {
                  v46 = -v39;
                  v47 = v39 + v34;
                  v48 = v38 - v39;
                  v49 = v35 + v46;
                  v50 = v49 + 64;
                  if (v49 + 64 >= v66)
                    v50 = v66;
                  v67 = v49;
                  v68 = v50;
                  if (v66 >= v48)
                    v40 = v48;
                  v69.length = v40 + v47;
                  v69.location = v49 + v65;
                  CFStringGetCharacters(v62, v69, buffer);
                  v44 = v67;
                }
                v41 = buffer[v35 - v44];
              }
              v53 = v41;
              v42 = (v41 & 0xFC00) == 55296;
              if (v36 && (v41 & 0xFC00) == 56320)
              {
                v52[0] = v37;
                v52[1] = v41;
                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v52, 2);
                -[__CFString appendString:](v4, "appendString:", v43);
                goto LABEL_72;
              }
              if ((v41 & 0xF800 | 0x400) == 0xDC00)
                goto LABEL_73;
            }
            v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v53, 1);
            -[__CFString appendString:](v4, "appendString:", v43);
LABEL_72:

LABEL_73:
            ++v35;
            v37 = v53;
            --v34;
            ++v38;
            v36 = v42;
          }
          while (v32 != v35);
        }
        v29 = v51;
      }

      goto LABEL_6;
    }
  }
  v3 = v1;
LABEL_5:
  v4 = v3;
LABEL_6:

  return v4;
}

void sub_1B10AE964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10AEA50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AEAB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AEB40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AECAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AED4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AEDD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AEE74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B10AEF54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10AEFDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AF04C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10AF0D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF2EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10AF368(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF3E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF498(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B10AF570(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B10AF69C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10AF734(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF78C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF7E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF83C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF894(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10AF96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10AF9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10AFA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (!v13)

  _Unwind_Resume(a1);
}

uint64_t EFCopyResponseDataForURLRequest(void *a1, void *a2, _QWORD *a3, uint64_t a4)
{
  _EFCopyResponseDataForURLRequest(a1, a2, a3, a4, 60.0);
  return objc_claimAutoreleasedReturnValue();
}

id _EFCopyResponseDataForURLRequest(void *a1, void *a2, _QWORD *a3, uint64_t a4, double a5)
{
  id v9;
  id v10;
  _EFURLConnectionDelegate *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a1;
  v10 = a2;
  v11 = objc_alloc_init(_EFURLConnectionDelegate);
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "set_sourceApplicationBundleIdentifier:", v9);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v13, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataTaskWithRequest:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "resume");
    -[_EFURLConnectionDelegate future](v11, "future");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resultWithTimeout:error:", a4, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      -[_EFURLConnectionDelegate response](v11, "response");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "invalidateAndCancel");
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void sub_1B10AFC74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void EFPostUTF8FormData(void *a1, uint64_t a2, void *a3, uint64_t a4, double a5)
{
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a1;
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("content-type"));
  objc_msgSend(v10, "setHTTPBody:", v9);
  v11 = _EFCopyResponseDataForURLRequest(v12, v10, 0, a4, a5);

}

void sub_1B10AFD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10AFE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10AFF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B10B000C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B0068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B0100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B0164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B01D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B0278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B02D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B0420(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B0474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B056C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B0618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B10B0710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B10B0790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B084C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10B0964(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10B0A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B0AAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B0B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B0CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1B10B0D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B0E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B0F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1B10B102C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B10E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B1260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  _Block_object_dispose((const void *)(v16 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B10B1394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B1500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1B10B15C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1B10B16F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_1B10B17BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B1890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10B1A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_1B10B1B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10B1C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B10B1E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B1F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1B10B2000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B2084(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B20E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B214C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B21B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B2240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B22A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B2300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B2430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B10B248C()
{
  JUMPOUT(0x1B10B2480);
}

void sub_1B10B2534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B26A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B10B2820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10B2954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10B2ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B10B2B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B2C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B10B2D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B2E1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B2E9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B10B2F60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B2FF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B3054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B3110(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B3188(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B3258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1B10B32EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B3398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1B10B342C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B34E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1B10B3574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B3644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B10B3708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B10B37C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10B3860(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B38D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B395C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B39FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B3A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B3B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B3B94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B3BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B3CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B3DB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B3E08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B3EC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10B3F44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B3FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B4070(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B4108(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B4184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B41F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B4268(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B42C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B4328(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B43C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B4458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B44E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10B45C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10B4784(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B4870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1B10B494C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B4A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1B10B4B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10B4C1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B4E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B10B4FF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B51CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _ef_log_EFProtectedFile()
{
  if (_ef_log_EFProtectedFile_onceToken != -1)
    dispatch_once(&_ef_log_EFProtectedFile_onceToken, &__block_literal_global_24);
  return (id)_ef_log_EFProtectedFile_log;
}

void sub_1B10B54D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B10B5538(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B5594(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B10B5660(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1B10B58C8(_Unwind_Exception *a1)
{
  void *v1;
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;

  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void sub_1B10B594C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B5B08(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  void *v2;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B10B5BD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B5C98(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1B10B5CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B5E40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B10B5F70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10B6290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t EFMarkFileAsPurgeable(void *a1, _QWORD *a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  id v18;
  _QWORD v19[3];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a1);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0);
  v5 = v4;
  if (v4 < 0)
  {
    v11 = *__error();
    if (a2)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB3308];
      v21[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v11, v13);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
    EFPurgeableFileLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      EFMarkFileAsPurgeable_cold_1(v14, (uint64_t)v19, v11);
    }
  }
  else
  {
    v19[0] = 65539;
    v6 = ffsctl(v4, 0xC0084A44uLL, v19, 0);
    if (!v6)
    {
      close(v5);
      v15 = 1;
      goto LABEL_13;
    }
    close(v5);
    if (a2)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB3308];
      v18 = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v6, v8);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
    EFPurgeableFileLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      EFMarkFileAsPurgeable_cold_2(v10, (uint64_t)v19, v6);
    }
  }

  v15 = 0;
LABEL_13:

  return v15;
}

void sub_1B10B6518(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id EFPurgeableFileLog()
{
  if (EFPurgeableFileLog_onceToken != -1)
    dispatch_once(&EFPurgeableFileLog_onceToken, &__block_literal_global_25);
  return (id)EFPurgeableFileLog_log;
}

uint64_t EFMarkFileAsPurgeableFD(int a1)
{
  uint64_t v2;

  v2 = 65539;
  return ffsctl(a1, 0xC0084A44uLL, &v2, 0);
}

uint64_t EFGetFileIsPurgeableFD(int a1, BOOL *a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  result = ffsctl(a1, 0x40084A47uLL, &v4, 0);
  if (a2)
  {
    if (!(_DWORD)result)
      *a2 = (v4 & 0xE00) != 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

void sub_1B10B66F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B6760(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B6824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B68BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B6960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B6A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10B6B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B6B9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B6C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B6CD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B6DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B6E3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B6F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B7044(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B70F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B7230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B72EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B73E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B7498(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B751C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B759C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B768C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B76E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B77B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B7828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B78C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B7998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B79EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B7A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B7BBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B7C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B7CBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B7D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B7E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B7EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B7FD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8090(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B81EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B84A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B10B85FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B875C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B10B88C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8A30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8ABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8B48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8BDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8C68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8CFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8D64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B8E0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8EC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B8F74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B9000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B90D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10B91CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10B9258(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B92B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B9310(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B93A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B94B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B10B9560(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B9640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10B9708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B97B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B98B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10B99C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10B9A60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B9B1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B9C58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B9D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10B9EF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10B9F64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10B9FCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BA064(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BA180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10BA31C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t ___registerSQLiteErrorDomainUserInfoValueProvider_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "setUserInfoValueProviderForDomain:provider:", CFSTR("EFSQLiteErrorDomain"), &__block_literal_global_147);
}

id ___registerSQLiteErrorDomainUserInfoValueProvider_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v4 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CB2938]))
  {
    v5 = objc_msgSend(v4, "code");
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EFSQLiteExtendedErrorCodeKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5 = objc_msgSend(v7, "intValue");
    v9 = (void *)MEMORY[0x1E0CB3940];
    if ((int)v5 <= 538)
    {
      if ((int)v5 > 100)
      {
        switch((int)v5)
        {
          case 256:
            v10 = CFSTR("SQLITE_OK_LOAD_PERMANENTLY");
            break;
          case 257:
            v10 = CFSTR("SQLITE_ERROR_MISSING_COLLSEQ");
            break;
          case 258:
          case 259:
          case 260:
          case 263:
          case 265:
          case 268:
          case 269:
          case 271:
          case 272:
          case 273:
          case 274:
          case 276:
          case 277:
          case 278:
          case 280:
          case 281:
          case 282:
            goto LABEL_116;
          case 261:
            v10 = CFSTR("SQLITE_BUSY_RECOVERY");
            break;
          case 262:
            v10 = CFSTR("SQLITE_LOCKED_SHAREDCACHE");
            break;
          case 264:
            v10 = CFSTR("SQLITE_READONLY_RECOVERY");
            break;
          case 266:
            v10 = CFSTR("SQLITE_IOERR_READ");
            break;
          case 267:
            v10 = CFSTR("SQLITE_CORRUPT_VTAB");
            break;
          case 270:
            v10 = CFSTR("SQLITE_CANTOPEN_NOTEMPDIR");
            break;
          case 275:
            v10 = CFSTR("SQLITE_CONSTRAINT_CHECK");
            break;
          case 279:
            v10 = CFSTR("SQLITE_AUTH_USER");
            break;
          case 283:
            v10 = CFSTR("SQLITE_NOTICE_RECOVER_WAL");
            break;
          case 284:
            v10 = CFSTR("SQLITE_WARNING_AUTOINDEX");
            break;
          default:
            switch((int)v5)
            {
              case 512:
                v10 = CFSTR("SQLITE_OK_SYMLINK");
                break;
              case 513:
                v10 = CFSTR("SQLITE_ERROR_RETRY");
                break;
              case 514:
              case 515:
              case 519:
              case 521:
              case 524:
              case 525:
              case 527:
              case 528:
              case 529:
              case 530:
                goto LABEL_116;
              case 516:
                v10 = CFSTR("SQLITE_ABORT_ROLLBACK");
                break;
              case 517:
                v10 = CFSTR("SQLITE_BUSY_SNAPSHOT");
                break;
              case 518:
                v10 = CFSTR("SQLITE_LOCKED_VTAB");
                break;
              case 520:
                v10 = CFSTR("SQLITE_READONLY_CANTLOCK");
                break;
              case 522:
                v10 = CFSTR("SQLITE_IOERR_SHORT_READ");
                break;
              case 523:
                v10 = CFSTR("SQLITE_CORRUPT_SEQUENCE");
                break;
              case 526:
                v10 = CFSTR("SQLITE_CANTOPEN_ISDIR");
                break;
              case 531:
                v10 = CFSTR("SQLITE_CONSTRAINT_COMMITHOOK");
                break;
              default:
                if ((_DWORD)v5 != 101)
                  goto LABEL_116;
                v10 = CFSTR("SQLITE_DONE");
                break;
            }
            break;
        }
      }
      else
      {
        v10 = CFSTR("SQLITE_OK");
        switch((int)v5)
        {
          case 0:
            goto LABEL_176;
          case 1:
            v10 = CFSTR("SQLITE_ERROR");
            break;
          case 2:
            v10 = CFSTR("SQLITE_INTERNAL");
            break;
          case 3:
            v10 = CFSTR("SQLITE_PERM");
            break;
          case 4:
            v10 = CFSTR("SQLITE_ABORT");
            break;
          case 5:
            v10 = CFSTR("SQLITE_BUSY");
            break;
          case 6:
            v10 = CFSTR("SQLITE_LOCKED");
            break;
          case 7:
            v10 = CFSTR("SQLITE_NOMEM");
            break;
          case 8:
            v10 = CFSTR("SQLITE_READONLY");
            break;
          case 9:
            v10 = CFSTR("SQLITE_INTERRUPT");
            break;
          case 10:
            v10 = CFSTR("SQLITE_IOERR");
            break;
          case 11:
            v10 = CFSTR("SQLITE_CORRUPT");
            break;
          case 12:
            v10 = CFSTR("SQLITE_NOTFOUND");
            break;
          case 13:
            v10 = CFSTR("SQLITE_FULL");
            break;
          case 14:
            v10 = CFSTR("SQLITE_CANTOPEN");
            break;
          case 15:
            v10 = CFSTR("SQLITE_PROTOCOL");
            break;
          case 16:
            v10 = CFSTR("SQLITE_EMPTY");
            break;
          case 17:
            v10 = CFSTR("SQLITE_SCHEMA");
            break;
          case 18:
            v10 = CFSTR("SQLITE_TOOBIG");
            break;
          case 19:
            v10 = CFSTR("SQLITE_CONSTRAINT");
            break;
          case 20:
            v10 = CFSTR("SQLITE_MISMATCH");
            break;
          case 21:
            v10 = CFSTR("SQLITE_MISUSE");
            break;
          case 22:
            v10 = CFSTR("SQLITE_NOLFS");
            break;
          case 23:
            v10 = CFSTR("SQLITE_AUTH");
            break;
          case 24:
            v10 = CFSTR("SQLITE_FORMAT");
            break;
          case 25:
            v10 = CFSTR("SQLITE_RANGE");
            break;
          case 26:
            v10 = CFSTR("SQLITE_NOTADB");
            break;
          case 27:
            v10 = CFSTR("SQLITE_NOTICE");
            break;
          case 28:
            v10 = CFSTR("SQLITE_WARNING");
            break;
          default:
            if ((_DWORD)v5 != 100)
              goto LABEL_116;
            v10 = CFSTR("SQLITE_ROW");
            break;
        }
      }
      goto LABEL_176;
    }
    if ((int)v5 > 2569)
    {
      if ((int)v5 > 5129)
      {
        if ((int)v5 > 6665)
        {
          if ((int)v5 > 7433)
          {
            switch((_DWORD)v5)
            {
              case 0x1D0A:
                v10 = CFSTR("SQLITE_IOERR_BEGIN_ATOMIC");
                goto LABEL_176;
              case 0x1E0A:
                v10 = CFSTR("SQLITE_IOERR_COMMIT_ATOMIC");
                goto LABEL_176;
              case 0x1F0A:
                v10 = CFSTR("SQLITE_IOERR_ROLLBACK_ATOMIC");
                goto LABEL_176;
            }
          }
          else
          {
            switch((_DWORD)v5)
            {
              case 0x1A0A:
                v10 = CFSTR("SQLITE_IOERR_CONVPATH");
                goto LABEL_176;
              case 0x1B0A:
                v10 = CFSTR("SQLITE_IOERR_VNODE");
                goto LABEL_176;
              case 0x1C0A:
                v10 = CFSTR("SQLITE_IOERR_AUTH");
                goto LABEL_176;
            }
          }
        }
        else if ((int)v5 > 5897)
        {
          switch((_DWORD)v5)
          {
            case 0x170A:
              v10 = CFSTR("SQLITE_IOERR_DELETE_NOENT");
              goto LABEL_176;
            case 0x180A:
              v10 = CFSTR("SQLITE_IOERR_MMAP");
              goto LABEL_176;
            case 0x190A:
              v10 = CFSTR("SQLITE_IOERR_GETTEMPPATH");
              goto LABEL_176;
          }
        }
        else
        {
          switch((_DWORD)v5)
          {
            case 0x140A:
              v10 = CFSTR("SQLITE_IOERR_SHMLOCK");
              goto LABEL_176;
            case 0x150A:
              v10 = CFSTR("SQLITE_IOERR_SHMMAP");
              goto LABEL_176;
            case 0x160A:
              v10 = CFSTR("SQLITE_IOERR_SEEK");
              goto LABEL_176;
          }
        }
      }
      else if ((int)v5 > 3593)
      {
        if ((int)v5 > 4361)
        {
          switch((_DWORD)v5)
          {
            case 0x110A:
              v10 = CFSTR("SQLITE_IOERR_DIR_CLOSE");
              goto LABEL_176;
            case 0x120A:
              v10 = CFSTR("SQLITE_IOERR_SHMOPEN");
              goto LABEL_176;
            case 0x130A:
              v10 = CFSTR("SQLITE_IOERR_SHMSIZE");
              goto LABEL_176;
          }
        }
        else
        {
          switch((_DWORD)v5)
          {
            case 0xE0A:
              v10 = CFSTR("SQLITE_IOERR_CHECKRESERVEDLOCK");
              goto LABEL_176;
            case 0xF0A:
              v10 = CFSTR("SQLITE_IOERR_LOCK");
              goto LABEL_176;
            case 0x100A:
              v10 = CFSTR("SQLITE_IOERR_CLOSE");
              goto LABEL_176;
          }
        }
      }
      else if ((int)v5 > 2834)
      {
        switch((_DWORD)v5)
        {
          case 0xB13:
            v10 = CFSTR("SQLITE_CONSTRAINT_PINNED");
            goto LABEL_176;
          case 0xC0A:
            v10 = CFSTR("SQLITE_IOERR_NOMEM");
            goto LABEL_176;
          case 0xD0A:
            v10 = CFSTR("SQLITE_IOERR_ACCESS");
            goto LABEL_176;
        }
      }
      else
      {
        switch((_DWORD)v5)
        {
          case 0xA0A:
            v10 = CFSTR("SQLITE_IOERR_DELETE");
            goto LABEL_176;
          case 0xA13:
            v10 = CFSTR("SQLITE_CONSTRAINT_ROWID");
            goto LABEL_176;
          case 0xB0A:
            v10 = CFSTR("SQLITE_IOERR_BLOCKED");
            goto LABEL_176;
        }
      }
    }
    else if ((int)v5 > 1293)
    {
      if ((int)v5 > 1801)
      {
        if ((int)v5 > 2066)
        {
          switch((_DWORD)v5)
          {
            case 0x813:
              v10 = CFSTR("SQLITE_CONSTRAINT_UNIQUE");
              goto LABEL_176;
            case 0x90A:
              v10 = CFSTR("SQLITE_IOERR_RDLOCK");
              goto LABEL_176;
            case 0x913:
              v10 = CFSTR("SQLITE_CONSTRAINT_VTAB");
              goto LABEL_176;
          }
        }
        else
        {
          switch((_DWORD)v5)
          {
            case 0x70A:
              v10 = CFSTR("SQLITE_IOERR_FSTAT");
              goto LABEL_176;
            case 0x713:
              v10 = CFSTR("SQLITE_CONSTRAINT_TRIGGER");
              goto LABEL_176;
            case 0x80A:
              v10 = CFSTR("SQLITE_IOERR_UNLOCK");
              goto LABEL_176;
          }
        }
      }
      else if ((int)v5 > 1545)
      {
        switch((_DWORD)v5)
        {
          case 0x60A:
            v10 = CFSTR("SQLITE_IOERR_TRUNCATE");
            goto LABEL_176;
          case 0x60E:
            v10 = CFSTR("SQLITE_CANTOPEN_SYMLINK");
            goto LABEL_176;
          case 0x613:
            v10 = CFSTR("SQLITE_CONSTRAINT_PRIMARYKEY");
            goto LABEL_176;
        }
      }
      else
      {
        switch((_DWORD)v5)
        {
          case 0x50E:
            v10 = CFSTR("SQLITE_CANTOPEN_DIRTYWAL");
            goto LABEL_176;
          case 0x513:
            v10 = CFSTR("SQLITE_CONSTRAINT_NOTNULL");
            goto LABEL_176;
          case 0x608:
            v10 = CFSTR("SQLITE_READONLY_DIRECTORY");
            goto LABEL_176;
        }
      }
    }
    else if ((int)v5 > 1031)
    {
      if ((int)v5 > 1042)
      {
        switch((_DWORD)v5)
        {
          case 0x413:
            v10 = CFSTR("SQLITE_CONSTRAINT_FUNCTION");
            goto LABEL_176;
          case 0x508:
            v10 = CFSTR("SQLITE_READONLY_CANTINIT");
            goto LABEL_176;
          case 0x50A:
            v10 = CFSTR("SQLITE_IOERR_DIR_FSYNC");
            goto LABEL_176;
        }
      }
      else
      {
        switch((_DWORD)v5)
        {
          case 0x408:
            v10 = CFSTR("SQLITE_READONLY_DBMOVED");
            goto LABEL_176;
          case 0x40A:
            v10 = CFSTR("SQLITE_IOERR_FSYNC");
            goto LABEL_176;
          case 0x40E:
            v10 = CFSTR("SQLITE_CANTOPEN_CONVPATH");
            goto LABEL_176;
        }
      }
    }
    else if ((int)v5 > 777)
    {
      switch((_DWORD)v5)
      {
        case 0x30A:
          v10 = CFSTR("SQLITE_IOERR_WRITE");
          goto LABEL_176;
        case 0x30E:
          v10 = CFSTR("SQLITE_CANTOPEN_FULLPATH");
          goto LABEL_176;
        case 0x313:
          v10 = CFSTR("SQLITE_CONSTRAINT_FOREIGNKEY");
          goto LABEL_176;
      }
    }
    else
    {
      switch((_DWORD)v5)
      {
        case 0x21B:
          v10 = CFSTR("SQLITE_NOTICE_RECOVER_ROLLBACK");
          goto LABEL_176;
        case 0x301:
          v10 = CFSTR("SQLITE_ERROR_SNAPSHOT");
          goto LABEL_176;
        case 0x308:
          v10 = CFSTR("SQLITE_READONLY_ROLLBACK");
LABEL_176:
          objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %s"), v10, sqlite3_errstr(v5));
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_177;
      }
    }
LABEL_116:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown error code: %d"), v5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_176;
  }
  v8 = 0;
LABEL_177:

  return v8;
}

void sub_1B10BAC54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const __CFString *EFSQLStringForOrderDirection(uint64_t a1)
{
  const __CFString *v1;

  v1 = &stru_1E62A84D8;
  if (a1 == 1)
    v1 = CFSTR("ASC");
  if (a1 == 2)
    return CFSTR("DESC");
  else
    return v1;
}

void sub_1B10BAD78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BADFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10BAE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10BAF34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BAFE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BB034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BB090(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BB2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10BB4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B10BB594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BB5E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BB7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10BB894(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BB96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B10BBA78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BBAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10BBB9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BBC2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BBCF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BBD60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BBE24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BBF00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BBFD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BC0BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BC194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BC278(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BC38C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10BC470(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BC554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BC630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BC700(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BC7DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BC8E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10BC9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BCAD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BCBF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BCCE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BCDBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BCE90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BCEF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BCFC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD04C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD144(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD2A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD3FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD4C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD61C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD6A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BD7BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BD918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10BD9B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BDAB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BDC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10BDD1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BDF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10BE018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BE118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10BE190(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BE3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10BE484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10BE55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B10BE658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10BE780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10BE9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B10BEAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B10BECC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B10BEE28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BEE90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BEF9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10BF044(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BF1F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10BF3AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10BF594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B10BF5F8()
{
  JUMPOUT(0x1B10BF5CCLL);
}

void sub_1B10BF600()
{
  JUMPOUT(0x1B10BF5D0);
}

void sub_1B10BF608()
{
  JUMPOUT(0x1B10BF5D8);
}

void sub_1B10BF610()
{
  JUMPOUT(0x1B10BF5E0);
}

void sub_1B10BF618()
{
  JUMPOUT(0x1B10BF5E8);
}

void sub_1B10BF764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B10BF824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BF8D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BFA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1B10BFAA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10BFB64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10BFE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B10C0068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10C02A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B10C0400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10C04D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C0594(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C06E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10C07E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10C08CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C097C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C0B24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10C0CC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B10C0DA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B10C0E50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C0EE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C118C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B10C12BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C13CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10C150C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10C1684(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C17D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10C1968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v8;

  _Unwind_Resume(a1);
}

void sub_1B10C1A4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C1DF0(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 112) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v3 - 112));
}

void sub_1B10C222C(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 104) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v3 - 104));
}

void sub_1B10C2338(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C24F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10C2654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C2748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10C27C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C286C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10C2928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C2A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10C2ABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C2B94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B10C2D04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B10C2DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10C2E7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C2F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C3008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C3084(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C311C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C3264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C3330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10C33A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C3490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10C352C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C358C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C3650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10C36E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C3874(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C3910(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C3974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C3A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C3AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C3C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  id *v18;
  void *v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B10C3D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C3D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C3E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C3E78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C3EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C3F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C3FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B10C4170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  void *v27;

  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1B10C4208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C429C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C43C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C4488(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C44E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void EFSaveTailspin(unint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  int v16;
  __int16 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  __CFString *v58;
  id v59;
  void *v60;
  size_t v61;
  size_t v62;
  size_t v63;
  size_t v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  int v70;
  void *v71;
  id v72;
  _QWORD __b[82];
  size_t v74[5];
  int v75[2];
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (_os_feature_enabled_impl())
  {
    if (a1 > 0xA)
      v4 = CFSTR("unknown-cause");
    else
      v4 = sContextNames[3 * a1];
    memset(__b, 170, 0x288uLL);
    LODWORD(__b[4]) = 0;
    *(_QWORD *)v75 = 0xE00000001;
    LODWORD(v76) = 1;
    HIDWORD(v76) = getpid();
    v74[0] = 648;
    v16 = sysctl(v75, 4u, __b, v74, 0, 0);
    v17 = __b[4];
    _tsl();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v16 || (v17 & 0x800) == 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v22 = -[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
        _shortContextName(a1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(__b[0]) = 136446466;
        *(_QWORD *)((char *)__b + 4) = v22;
        WORD2(__b[1]) = 2114;
        *(_QWORD *)((char *)&__b[1] + 6) = v23;
        _os_log_impl(&dword_1B106E000, v19, OS_LOG_TYPE_DEFAULT, "Saving tailspin for %{public}s (%{public}@)", (uint8_t *)__b, 0x16u);

      }
      v24 = DRTailspinRequest();
      v19 = 0;
      if ((v24 & 1) == 0)
      {
        _tsl();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          _shortContextName(a1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(__b[0]) = 138543874;
          *(_QWORD *)((char *)__b + 4) = v4;
          WORD2(__b[1]) = 2114;
          *(_QWORD *)((char *)&__b[1] + 6) = v71;
          HIWORD(__b[2]) = 2114;
          __b[3] = v19;
          _os_log_error_impl(&dword_1B106E000, v25, OS_LOG_TYPE_ERROR, "Failed to generate %{public}@ (%{public}@) tailspin: %{public}@", (uint8_t *)__b, 0x20u);

        }
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = -[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
      _shortContextName(a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(__b[0]) = 136446466;
      *(_QWORD *)((char *)__b + 4) = v20;
      WORD2(__b[1]) = 2114;
      *(_QWORD *)((char *)&__b[1] + 6) = v21;
      _os_log_impl(&dword_1B106E000, v19, OS_LOG_TYPE_INFO, "Skipping tailspin for %{public}s (%{public}@)", (uint8_t *)__b, 0x16u);

    }
    goto LABEL_30;
  }
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_15;
  memset(__b, 170, 0x288uLL);
  LODWORD(__b[4]) = 0;
  *(_QWORD *)v75 = 0xE00000001;
  LODWORD(v76) = 1;
  HIDWORD(v76) = getpid();
  v74[0] = 648;
  if (!sysctl(v75, 4u, __b, v74, 0, 0) && (__b[4] & 0x800) != 0)
    goto LABEL_15;
  if (_shouldSaveTailspin_o != -1)
    dispatch_once(&_shouldSaveTailspin_o, &__block_literal_global_59);
  os_unfair_lock_lock((os_unfair_lock_t)&_shouldSaveTailspin_lock);
  if (a1 > 0xA)
    goto LABEL_14;
  if (_systemTimeScale_o != -1)
    dispatch_once(&_systemTimeScale_o, &__block_literal_global_67);
  v5 = mach_continuous_time();
  v7 = _systemTimeScale_machTimebaseInfo;
  v6 = *(unsigned int *)algn_1ECFB36D4;
  v8 = (void *)_shouldSaveTailspin_last;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12 = v5 * v7 / v6 / 0x3B9ACA00;
  if (v11)
  {
    if (v12 - v11 < _shouldSaveTailspin_threshold)
    {
LABEL_14:
      os_unfair_lock_unlock((os_unfair_lock_t)&_shouldSaveTailspin_lock);
LABEL_15:
      _tsl();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        _shortContextName(a1);
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = objc_msgSend(v14, "UTF8String");
        LODWORD(__b[0]) = 136446210;
        *(_QWORD *)((char *)__b + 4) = v15;
        _os_log_impl(&dword_1B106E000, v13, OS_LOG_TYPE_INFO, "Skipping tailspin for %{public}s", (uint8_t *)__b, 0xCu);

      }
      goto LABEL_30;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)_shouldSaveTailspin_last;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

  os_unfair_lock_unlock((os_unfair_lock_t)&_shouldSaveTailspin_lock);
  _tsl();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    _shortContextName(a1);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = objc_msgSend(v30, "UTF8String");
    LODWORD(__b[0]) = 136446210;
    *(_QWORD *)((char *)__b + 4) = v31;
    _os_log_impl(&dword_1B106E000, v29, OS_LOG_TYPE_DEFAULT, "Saving tailspin for %{public}s", (uint8_t *)__b, 0xCu);

  }
  v72 = v3;
  if (_temporaryTailspinPath_o != -1)
    dispatch_once(&_temporaryTailspinPath_o, &__block_literal_global_70);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v74[0]) = -86;
  v33 = objc_msgSend(v32, "fileExistsAtPath:isDirectory:", CFSTR("/var/mobile/Library/Mail/tailspin-work"), v74);
  if (LOBYTE(v74[0]))
    v34 = 0;
  else
    v34 = v33;
  if (v34 == 1)
  {
    objc_msgSend(v32, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/Mail/tailspin-work"), 0);
  }
  else if (v33)
  {

    goto LABEL_44;
  }
  *(_QWORD *)v75 = 0;
  v35 = objc_msgSend(v32, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Mail/tailspin-work"), 1, 0, v75);
  v36 = *(id *)v75;
  v37 = v36;
  if (!v35)
  {
    _tsl();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v37, "localizedDescription");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "UTF8String");
      LODWORD(__b[0]) = 138543618;
      *(_QWORD *)((char *)__b + 4) = CFSTR("/var/mobile/Library/Mail/tailspin-work");
      WORD2(__b[1]) = 2082;
      *(_QWORD *)((char *)&__b[1] + 6) = v44;
      _os_log_impl(&dword_1B106E000, v42, OS_LOG_TYPE_DEFAULT, "Unable to create %{public}@: %{public}s", (uint8_t *)__b, 0x16u);

    }
    _tsl();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      EFSaveTailspin_cold_2(v38, v45, v46, v47, v48, v49, v50, v51);
    v41 = 0;
    goto LABEL_50;
  }

LABEL_44:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v38 = objc_claimAutoreleasedReturnValue();
  _shortContextName(a1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_temporaryTailspinPath_filenameFormatter, "stringFromDate:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/mailspin-%@-%@.tailspin"), CFSTR("/var/mobile/Library/Mail/tailspin-work"), v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_50:
  v52 = objc_retainAutorelease(v41);
  v53 = open((const char *)objc_msgSend(v52, "UTF8String"), 514, 438);
  if (v53 == -1)
  {
    v70 = *__error();
    _tsl();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      EFSaveTailspin_cold_1((uint64_t)v52, v70, v57);
  }
  else
  {
    if (_tailspinMinTimestamp_o != -1)
      dispatch_once(&_tailspinMinTimestamp_o, &__block_literal_global_80);
    v54 = mach_absolute_time();
    v55 = _tailspinMinTimestamp_absoluteTicksBeforeNow;
    v56 = v72;
    v57 = objc_msgSend(CFSTR("Mail EFTailspin: "), "mutableCopy");
    v58 = objc_retainAutorelease(sContextNames[3 * a1 + 2]);
    -[NSObject appendFormat:](v57, "appendFormat:", CFSTR("%s: "), -[__CFString UTF8String](v58, "UTF8String"));
    v59 = objc_retainAutorelease(v56);
    -[NSObject appendFormat:](v57, "appendFormat:", CFSTR("%s"), objc_msgSend(v59, "UTF8String"));

    LODWORD(v59) = os_variant_has_internal_diagnostics();
    v74[0] = *MEMORY[0x1E0DE8AF0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v54 - v55);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *MEMORY[0x1E0DE8B08];
    *(_QWORD *)v75 = v60;
    v76 = v57;
    v62 = *MEMORY[0x1E0DE8AC8];
    v74[1] = v61;
    v74[2] = v62;
    v63 = *MEMORY[0x1E0DE8AD0];
    v77 = MEMORY[0x1E0C9AAB0];
    v78 = MEMORY[0x1E0C9AAB0];
    v64 = *MEMORY[0x1E0DE8B10];
    v74[3] = v63;
    v74[4] = v64;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59 ^ 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v65;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 5);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(9, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    _tsl();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
      LODWORD(__b[0]) = 136446210;
      *(_QWORD *)((char *)__b + 4) = v69;
      _os_log_impl(&dword_1B106E000, v68, OS_LOG_TYPE_DEFAULT, "Attempting mailspin for: %{public}s", (uint8_t *)__b, 0xCu);
    }

    __b[0] = MEMORY[0x1E0C809B0];
    __b[1] = 3221225472;
    __b[2] = ___generateTailspin_block_invoke;
    __b[3] = &unk_1E62A7850;
    LODWORD(__b[5]) = v53;
    __b[4] = v52;
    tailspin_dump_output_with_options();

  }
LABEL_30:

}

void sub_1B10C4F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id _tsl()
{
  if (_tsl_o != -1)
    dispatch_once(&_tsl_o, &__block_literal_global_39);
  return (id)_tsl_h;
}

__CFString *_shortContextName(unint64_t a1)
{
  if (a1 > 0xA)
    return CFSTR("unknown-cause");
  else
    return sContextNames[3 * a1 + 1];
}

void ___tsl_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EFTailspin");
  v1 = (void *)_tsl_h;
  _tsl_h = (uint64_t)v0;

}

void ___shouldSaveTailspin_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_shouldSaveTailspin_last;
  _shouldSaveTailspin_last = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.mail"));

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.mail"));
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "integerForKey:", CFSTR("MinimumSecondsBetweenTailspins"))) != 0)
  {
    _tsl();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = v6;
      v8 = "Non-standard tailspin rate limit: %ld minimum seconds between tailspins";
      v9 = v7;
      v10 = 12;
LABEL_7:
      _os_log_impl(&dword_1B106E000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    _tsl();
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = 3600;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109120;
      LODWORD(v12) = 3600;
      v8 = "Standard tailspin rate limit: %d minimum seconds between tailspins";
      v9 = v7;
      v10 = 8;
      goto LABEL_7;
    }
  }

  _shouldSaveTailspin_threshold = v6;
}

void sub_1B10C52CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___systemTimeScale_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_systemTimeScale_machTimebaseInfo);
}

void ___generateTailspin_block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  char v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (fsync(*(_DWORD *)(a1 + 40)) == -1)
    ___generateTailspin_block_invoke_cold_3();
  if (close(*(_DWORD *)(a1 + 40)) == -1)
    ___generateTailspin_block_invoke_cold_3();
  _tsl();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v46 = (const __CFString *)v6;
      _os_log_impl(&dword_1B106E000, v5, OS_LOG_TYPE_DEFAULT, "Mailspin success: %{public}s", buf, 0xCu);
    }

    v7 = (__CFString *)*(id *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

      if (v12)
      {
        _tsl();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v7;
          _os_log_impl(&dword_1B106E000, v30, OS_LOG_TYPE_DEFAULT, "Empty tailspin file: %{public}@", buf, 0xCu);
        }

        objc_msgSend(v8, "removeItemAtPath:error:", v7, 0);
        goto LABEL_29;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -86;
    if (objc_msgSend(v13, "fileExistsAtPath:isDirectory:", CFSTR("/var/mobile/Library/Caches/com.apple.backboardd/spool"), &v44))
    {

    }
    else
    {
      v43 = 0;
      v21 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Caches/com.apple.backboardd/spool"), 1, 0, &v43);
      v22 = v43;
      v23 = v22;
      if (!v21)
      {
        _tsl();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v23, "localizedDescription");
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v33 = objc_msgSend(v32, "UTF8String");
          *(_DWORD *)buf = 138543618;
          v46 = CFSTR("/var/mobile/Library/Caches/com.apple.backboardd/spool");
          v47 = 2082;
          v48 = v33;
          _os_log_impl(&dword_1B106E000, v31, OS_LOG_TYPE_DEFAULT, "Unable to create %{public}@: %{public}s", buf, 0x16u);

        }
        _tsl();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          ___generateTailspin_block_invoke_cold_1(v26, v34, v35, v36, v37, v38, v39, v40);
        goto LABEL_28;
      }

    }
    v24 = (void *)MEMORY[0x1E0CB3940];
    -[__CFString lastPathComponent](v7, "lastPathComponent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Library/Caches/com.apple.backboardd/spool"), v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v43 = 0;
    objc_msgSend(v8, "moveItemAtPath:toPath:error:", v7, v26, &v43);
    v27 = v43;
    _tsl();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v27, "localizedDescription");
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = objc_msgSend(v41, "UTF8String");
        *(_DWORD *)buf = 138543874;
        v46 = v7;
        v47 = 2114;
        v48 = (uint64_t)v26;
        v49 = 2082;
        v50 = v42;
        _os_log_error_impl(&dword_1B106E000, v29, OS_LOG_TYPE_ERROR, "Failed move %{public}@ -> %{public}@: %{public}s", buf, 0x20u);

      }
      objc_msgSend(v8, "removeItemAtPath:error:", v7, 0);
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v46 = v7;
        v47 = 2114;
        v48 = (uint64_t)v26;
        _os_log_impl(&dword_1B106E000, v29, OS_LOG_TYPE_DEFAULT, "Successful move %{public}@ -> %{public}@", buf, 0x16u);
      }

    }
LABEL_28:

LABEL_29:
    return;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    ___generateTailspin_block_invoke_cold_2(v5, v14, v15, v16, v17, v18, v19, v20);

}

void sub_1B10C5748(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v6;

  _Unwind_Resume(a1);
}

uint64_t ___temporaryTailspinPath_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_temporaryTailspinPath_filenameFormatter;
  _temporaryTailspinPath_filenameFormatter = (uint64_t)v0;

  return objc_msgSend((id)_temporaryTailspinPath_filenameFormatter, "setDateFormat:", CFSTR("yyyy-MMdd-HHmm-ssSSS"));
}

void ___tailspinMinTimestamp_block_invoke()
{
  if (_systemTimeScale_o != -1)
    dispatch_once(&_systemTimeScale_o, &__block_literal_global_67);
  _tailspinMinTimestamp_absoluteTicksBeforeNow = 1000000000
                                               * (unint64_t)*(unsigned int *)algn_1ECFB36D4
                                               / _systemTimeScale_machTimebaseInfo;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B10C5950(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _readVersions_block_invoke()
{
  void *v0;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1B5E15A60]();
  v1 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x1E0C9ABB0]), "copy");
    v4 = (void *)sProductVersion;
    sProductVersion = v3;

    v5 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0C9AB90]), "copy");
    v6 = (void *)sBuildVersion;
    sBuildVersion = v5;

    CFRelease(v2);
  }
  objc_autoreleasePoolPop(v0);
}

id EFProductName()
{
  void *v0;
  void *v1;

  v0 = (void *)MGCopyAnswer();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Mail"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1B10C5A84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id EFVerboseVersion()
{
  if (EFVerboseVersion_onceToken != -1)
    dispatch_once(&EFVerboseVersion_onceToken, &__block_literal_global_9);
  return (id)EFVerboseVersion_verboseVersion;
}

void sub_1B10C5B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

id EFSystemBuildVersion()
{
  if (sSystemVersionsOnce != -1)
    dispatch_once(&sSystemVersionsOnce, &__block_literal_global_41);
  return (id)sBuildVersion;
}

id EFSystemVersion()
{
  if (sSystemVersionsOnce != -1)
    dispatch_once(&sSystemVersionsOnce, &__block_literal_global_41);
  return (id)sProductVersion;
}

void sub_1B10C5CB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C5DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C5F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C6048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C6198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10C6224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C62D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B10C63D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B10C65C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10C670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C67D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C68C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B10C6A4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C6BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C6D38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C6E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B10C709C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C7188(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B10C7260(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B10C7330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10C73D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B10C7438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ef_xpc_activity_register_withcriteria(const char *a1, void *a2, void *a3)
{
  _ef_xpc_activity_register(a1, 0, a2, a3);
}

void ef_xpc_activity_run_if_necessary(const char *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  const char *v8;

  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0C80748];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __ef_xpc_activity_run_if_necessary_block_invoke;
  v6[3] = &unk_1E62A79B0;
  v7 = v3;
  v8 = a1;
  v5 = v3;
  xpc_activity_register(a1, v4, v6);

}

void sub_1B10C7584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void __ef_xpc_activity_run_if_necessary_block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  _DWORD v16[7];

  *(_QWORD *)&v16[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  v5 = state;
  if (!state)
  {
    activityLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 136446210;
      *(_QWORD *)v16 = v9;
      _os_log_impl(&dword_1B106E000, v8, OS_LOG_TYPE_INFO, "Check in '%{public}s'", (uint8_t *)&v15, 0xCu);
    }

    v10 = *(const char **)(a1 + 40);
    v11 = xpc_activity_copy_criteria(v3);
    v12 = v11;
    if (!v11 || !xpc_dictionary_get_count(v11))
    {
      activityLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 136446210;
        *(_QWORD *)v16 = v10;
        _os_log_impl(&dword_1B106E000, v13, OS_LOG_TYPE_INFO, "Unregister '%{public}s'", (uint8_t *)&v15, 0xCu);
      }

      xpc_activity_unregister(v10);
    }
    goto LABEL_15;
  }
  if (state != 2)
  {
    activityLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 67109378;
      v16[0] = v5;
      LOWORD(v16[1]) = 2082;
      *(_QWORD *)((char *)&v16[1] + 2) = v14;
      _os_log_impl(&dword_1B106E000, v12, OS_LOG_TYPE_INFO, "Unexpected state %u for '%{public}s'", (uint8_t *)&v15, 0x12u);
    }
LABEL_15:

    goto LABEL_16;
  }
  activityLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v15 = 136446210;
    *(_QWORD *)v16 = v7;
    _os_log_impl(&dword_1B106E000, v6, OS_LOG_TYPE_INFO, "Run '%{public}s'", (uint8_t *)&v15, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_16:

}

void sub_1B10C77AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id EFFuture.isFinished.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isFinished);
}

id EFFuture.isCancelled.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isCancelled);
}

uint64_t EFFuture.__allocating_init<A>(_:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v0;
}

uint64_t EFFuture.init<A>(_:)()
{
  uint64_t v0;
  uint64_t result;

  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    *(_QWORD *)(v0 + 16) = result;
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  id v4;
  uint64_t v5;

  result = static EFFuture.asAnyObject(_:)(a1);
  if (result)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, result);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))(a1);
    v5 = swift_allocObject();
    EFFuture.init<A>(_:)();
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static EFFuture.asAnyObject(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t result;
  uint64_t v11;

  v3 = *(_QWORD *)(v1 + 80);
  v4 = sub_1B10CAD18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - v6;
  v8 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - v6, a1, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  v9 = sub_1B10C8FEC((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  result = 0;
  if (!v9)
    return sub_1B10CAD24();
  return result;
}

uint64_t EFFuture.__allocating_init(_:)(void *a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = (void *)sub_1B10CACE8();
  v3 = objc_msgSend((id)objc_opt_self(), sel_futureWithError_, v2);

  v4 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v4;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[6];

  v5 = (_QWORD *)swift_allocObject();
  v5[2] = *(_QWORD *)(v2 + 80);
  v5[3] = a1;
  v5[4] = a2;
  v11[4] = sub_1B10C91A0;
  v11[5] = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1B10C7C54;
  v11[3] = &block_descriptor;
  v6 = _Block_copy(v11);
  v7 = (void *)objc_opt_self();
  swift_retain();
  v8 = objc_msgSend(v7, sel_futureWithBlock_, v6);
  _Block_release(v6);
  swift_release();
  swift_release();
  v9 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v9;
}

uint64_t sub_1B10C7B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a4 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  type metadata accessor for EFFuture(0, a4, v10, v11);
  v12 = static EFFuture.asAnyObject(_:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v12;
}

id sub_1B10C7C54(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);
  void *v4;

  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v4 = (void *)v3(a2);
  swift_release();
  return v4;
}

uint64_t EFFuture.result()@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*v1 + 80);
  v4 = sub_1B10CAD18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v13 - v6;
  v8 = (void *)v1[2];
  v13[0] = 0;
  v9 = objc_msgSend(v8, sel_result_, v13);
  if (v13[0])
  {
    v10 = v13[0];
    swift_willThrow();

    return swift_unknownObjectRelease();
  }
  else
  {
    static EFFuture.asValue(_:)((uint64_t)v9, v7);
    v12 = *(_QWORD *)(v3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v3) == 1)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v7, v3);
    }
  }
  return result;
}

uint64_t static EFFuture.asValue(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  void (*v12)(char *, _QWORD, uint64_t, uint64_t);
  int v14;
  _QWORD v15[2];

  v5 = *(_QWORD *)(v2 + 80);
  v6 = sub_1B10CAD18();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v15 - v8;
  v15[1] = a1;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EEF0D520);
  v10 = swift_dynamicCast();
  v11 = *(_QWORD *)(v5 - 8);
  v12 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56);
  if (v10)
  {
    v12(v9, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(a2, v9, v5);
    return ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v12)(a2, 0, 1, v5);
  }
  else
  {
    v12(v9, 1, 1, v5);
    v15[0] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
    v14 = swift_dynamicCast();
    v12(a2, v14 ^ 1u, 1, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t EFFuture.result(withTimeout:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  void *v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(*v2 + 80);
  v6 = sub_1B10CAD18();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v17 - v8;
  v10 = (void *)v2[2];
  v17[0] = 0;
  v11 = objc_msgSend(v10, sel_resultWithTimeout_error_, v17, a2);
  v12 = v17[0];
  if (v11)
  {
    v13 = swift_unknownObjectRetain();
    static EFFuture.asValue(_:)(v13, v9);
    swift_unknownObjectRelease();
    v14 = *(_QWORD *)(v5 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v5) == 1)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a1, v9, v5);
    }
  }
  else
  {
    v16 = v12;
    sub_1B10CACF4();

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.result(beforeDate:)@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17[2];

  v16 = a1;
  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*v1 + 80);
  v3 = sub_1B10CAD18();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v15 - v5;
  v7 = (void *)v1[2];
  v8 = (void *)sub_1B10CAD00();
  v17[0] = 0;
  v9 = objc_msgSend(v7, sel_resultBeforeDate_error_, v8, v17);

  v10 = v17[0];
  if (v9)
  {
    v11 = swift_unknownObjectRetain();
    static EFFuture.asValue(_:)(v11, v6);
    swift_unknownObjectRelease();
    v12 = *(_QWORD *)(v2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v2) == 1)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v16, v6, v2);
    }
  }
  else
  {
    v14 = v10;
    sub_1B10CACF4();

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.onSuccess(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v12[6];

  v7 = *v3;
  v8 = (void *)v3[2];
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = *(_QWORD *)(v7 + 80);
  v9[3] = a2;
  v9[4] = a3;
  v12[4] = sub_1B10C9204;
  v12[5] = v9;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1B10C8490;
  v12[3] = &block_descriptor_6;
  v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_onScheduler_addSuccessBlock_, a1, v10);
  _Block_release(v10);
  return swift_retain();
}

uint64_t sub_1B10C8360(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;

  v7 = sub_1B10CAD18();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v18 - v10;
  v12 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture(0, a4, v15, v16);
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    a2(v14);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a4);
  }
  return result;
}

uint64_t sub_1B10C8490(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t EFFuture.onError(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v7 = *(void **)(v3 + 16);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v11[4] = sub_1B10C9210;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1B10C85B0;
  v11[3] = &block_descriptor_12;
  v9 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_onScheduler_addFailureBlock_, a1, v9);
  _Block_release(v9);
  return swift_retain();
}

void sub_1B10C85B0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t EFFuture.always(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v7 = *(void **)(v3 + 16);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v11[4] = sub_1B10C9210;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1B10C86D8;
  v11[3] = &block_descriptor_18;
  v9 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_onScheduler_always_, a1, v9);
  _Block_release(v9);
  return swift_retain();
}

uint64_t sub_1B10C86D8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t EFFuture.then<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v16[6];

  v9 = *v4;
  type metadata accessor for EFFuture(0, a4, a3, a4);
  v10 = (void *)v4[2];
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = *(_QWORD *)(v9 + 80);
  v11[3] = a4;
  v11[4] = a2;
  v11[5] = a3;
  v16[4] = sub_1B10C9284;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1B10C8978;
  v16[3] = &block_descriptor_24;
  v12 = _Block_copy(v16);
  swift_retain();
  swift_release();
  v13 = objc_msgSend(v10, sel_onScheduler_then_, a1, v12);
  _Block_release(v12);
  v14 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v14;
}

uint64_t sub_1B10C882C(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t result;
  uint64_t v20;

  v7 = sub_1B10CAD18();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v20 - v10;
  v12 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture(0, a4, v15, v16);
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    v17 = a2(v14);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    v18 = *(id *)(v17 + 16);
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

id sub_1B10C8978(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v3 = (void *)v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t EFFuture.recover<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v16[6];

  v9 = *v4;
  type metadata accessor for EFFuture(0, a4, a3, a4);
  v10 = (void *)v4[2];
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = *(_QWORD *)(v9 + 80);
  v11[3] = a4;
  v11[4] = a2;
  v11[5] = a3;
  v16[4] = sub_1B10C9290;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1B10C8AF4;
  v16[3] = &block_descriptor_30;
  v12 = _Block_copy(v16);
  swift_retain();
  swift_release();
  v13 = objc_msgSend(v10, sel_onScheduler_recover_, a1, v12);
  _Block_release(v12);
  v14 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v14;
}

id sub_1B10C8AF4(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t EFFuture.map<A>(on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v18[6];

  v9 = *v4;
  type metadata accessor for EFFuture(0, a4, a3, a4);
  v10 = (void *)v4[2];
  v11 = (_QWORD *)swift_allocObject();
  v12 = *(_QWORD *)(v9 + 80);
  v11[2] = v12;
  v11[3] = a4;
  v11[4] = a2;
  v11[5] = a3;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a4;
  v13[4] = sub_1B10C92CC;
  v13[5] = v11;
  v18[4] = sub_1B10C92D8;
  v18[5] = v13;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 1107296256;
  v18[2] = sub_1B10C8EBC;
  v18[3] = &block_descriptor_39;
  v14 = _Block_copy(v18);
  swift_retain();
  swift_release();
  v15 = objc_msgSend(v10, sel_onScheduler_map_, a1, v14);
  _Block_release(v14);
  v16 = swift_allocObject();
  EFFuture.init<A>(_:)();
  return v16;
}

uint64_t sub_1B10C8C90@<X0>(uint64_t a1@<X0>, void (*a2)(char *)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  void (*v22)(char *);

  v22 = a2;
  v9 = sub_1B10CAD18();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v21 - v12;
  v14 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture(0, a3, v17, v18);
  static EFFuture.asValue(_:)(a1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    v19 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, a3);
    v22(v16);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, a3);
    v19 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(a5, v19, 1, a4);
}

uint64_t sub_1B10C8DF4@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v14;

  v8 = sub_1B10CAD18();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v14 - v9;
  a2(a1);
  v11 = *(_QWORD *)(a3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a3);
  if ((_DWORD)result == 1)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  else
  {
    *(_QWORD *)(a4 + 24) = a3;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)a4);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v11 + 32))(boxed_opaque_existential_0, v10, a3);
  }
  return result;
}

id sub_1B10C8EBC(uint64_t a1)
{
  void (*v1)(_QWORD *__return_ptr, uint64_t);
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  v1 = *(void (**)(_QWORD *__return_ptr, uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v10, v2);
  swift_release();
  swift_unknownObjectRelease();
  v3 = v11;
  if (!v11)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_0(v10, v11);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (void *)sub_1B10CAD24();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v8;
}

uint64_t EFFuture.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t EFFuture.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

BOOL sub_1B10C8FEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  void *v12;
  _BOOL8 v13;
  _QWORD v15[2];

  v3 = *(_QWORD *)(v1 + 80);
  v4 = sub_1B10CAD18();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v15 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v15 - v9, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v10, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_6:
    v11(v8, a1, v4);
    goto LABEL_7;
  }
  sub_1B10C9414();
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_6;
  v12 = (void *)v15[1];
  v11(v8, a1, v4);
  if (!v12)
  {
LABEL_7:
    sub_1B10CAD0C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    objc_opt_self();
    v13 = swift_dynamicCastObjCClass() != 0;
    swift_unknownObjectRelease();
    return v13;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return 0;
}

uint64_t sub_1B10C917C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B10C91A0(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B10C7B84(a1, v1[3], v1[4], v1[2]);
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E1612C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B10C9204(uint64_t a1)
{
  uint64_t v1;

  return sub_1B10C8360(a1, *(void (**)(char *))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16));
}

uint64_t sub_1B10C9210()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B10C9230()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for EFFuture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EFFuture);
}

uint64_t sub_1B10C9260()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B10C9284(uint64_t a1)
{
  uint64_t v1;

  return sub_1B10C882C(a1, *(uint64_t (**)(char *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16));
}

id sub_1B10C9290()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)((*(uint64_t (**)(void))(v0 + 32))() + 16);
  swift_release();
  return v1;
}

uint64_t sub_1B10C92CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1B10C8C90(a1, *(void (**)(char *))(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1B10C92D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1B10C8DF4(a1, *(void (**)(uint64_t))(v2 + 32), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1B10C92E8()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for EFFuture()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EFFuture.__allocating_init<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EEF0D5A8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EEF0D5A8);
  }
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1B10C9414()
{
  unint64_t result;

  result = qword_1EEF0D5B0[0];
  if (!qword_1EEF0D5B0[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1EEF0D5B0);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1B5E16114](a1, v6, a5);
}

uint64_t EFPromise.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)EFPromise), sel_init);
  return v0;
}

uint64_t EFPromise.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)EFPromise), sel_init);
  return v0;
}

uint64_t EFPromise.future.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id *v4;
  id v5;

  type metadata accessor for EFFuture(0, *((_QWORD *)*v4 + 10), a3, a4);
  v5 = objc_msgSend(v4[2], sel_future);
  return EFFuture.__allocating_init<A>(_:)();
}

uint64_t EFPromise.finish(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = sub_1B10CAD18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - v6;
  v8 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v10 - v6, a1, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(with:error:)(char *a1, void *a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v5 = *(_QWORD *)(*v2 + 80);
  v6 = sub_1B10CAD18();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - v8;
  v10 = (void *)v2[2];
  v11 = *(_QWORD *)(v5 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a1, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, a1, v6);
    result = v12(v9, 1, v5);
    if ((_DWORD)result == 1)
    {
      __break(1u);
      return result;
    }
    type metadata accessor for EFFuture(0, v5, v15, v16);
    v13 = static EFFuture.asAnyObject(_:)((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v5);
  }
  if (a2)
    a2 = (void *)sub_1B10CACE8();
  v17 = objc_msgSend(v10, sel_finishWithResult_error_, v13, a2);
  swift_unknownObjectRelease();

  return (uint64_t)v17;
}

uint64_t EFPromise.finish(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = sub_1B10CAD18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - v6;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))((char *)&v9 - v6, 1, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, a1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(_:)(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = sub_1B10CAD18();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - v8;
  a1(v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v9, 0, 1, v3);
  EFPromise.finish(with:error:)(v9, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

uint64_t EFPromise.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t EFPromise.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EFPromise(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EFPromise);
}

uint64_t method lookup function for EFPromise()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EFPromise.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t Locked.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _DWORD *v4;

  v3 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 80) - 8) + 16))(v3 + *(_QWORD *)(*(_QWORD *)v3 + 88), a1);
  v4 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 96)) = v4;
  *v4 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))(a1);
  return v3;
}

uint64_t Locked.init(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = sub_1B10C9E9C(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

void Locked.performWhileLocked<A>(_:)(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v2 = v1;
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 96)));
  v4 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 88);
  swift_beginAccess();
  a1(v4);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 96)));
}

void Locked.value()(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96)));
  v4 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v4, v3);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96)));
}

void Locked.get<A>(_:)()
{
  uint64_t v0;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96)));
  swift_beginAccess();
  swift_getAtKeyPath();
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96)));
}

void Locked.set<A>(_:to:)()
{
  uint64_t v0;
  uint64_t v1;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96)));
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  swift_beginAccess();
  sub_1B10C9CFC(v1);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96)));
}

uint64_t sub_1B10C9CFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *, uint64_t))(v1 + 16))((char *)&v5 - v2, v3);
  return swift_setAtReferenceWritableKeyPath();
}

void Locked.update(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96)));
  v4 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 88);
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, a1, v3);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96)));
}

uint64_t Locked.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return v0;
}

uint64_t Locked.__deallocating_deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t sub_1B10C9E9C(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 88), a1);
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96)) = v2;
  *v2 = 0;
  return v1;
}

uint64_t sub_1B10C9EE8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for Locked(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Locked);
}

uint64_t method lookup function for Locked()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Locked.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

void EFEncodeCacheableInstance_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = EFEncodeCacheableInstance_sInstanceCount;
  _os_log_debug_impl(&dword_1B106E000, log, OS_LOG_TYPE_DEBUG, "Has created %td instance IDs.", (uint8_t *)&v1, 0xCu);
}

void _NotifyObserversWithContentProtectionState_cold_1()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "EFContentProtectionObserver.m", 115, "EFContentProtectionStateInvalid != state");
}

void _NotifyObserversWithContentProtectionState_cold_2()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "EFContentProtectionObserver.m", 116, "EFContentProtectionStateInvalid != sContentProtectionState");
}

void _NotifyObserversWithContentProtectionState_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B106E000, log, OS_LOG_TYPE_FAULT, "Invalid KeyBag state transition", v1, 2u);
}

void _NotifyObserversWithContentProtectionState_cold_4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Brace for impact, keybag was locked without grace period!", v1, 2u);
}

void EFVerifyFileProtectionType_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Could not get file protection type for %@: %{public}@", buf, 0x16u);

}

void WithDeviceIsInternal_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1B106E000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);

}

void EFMarkFileAsPurgeable_cold_1(void *a1, uint64_t a2, int a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_1((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B106E000, "Failed to open '%@': %{errno}d", v4, v5);

}

void EFMarkFileAsPurgeable_cold_2(void *a1, uint64_t a2, int a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_1((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B106E000, "Failed to mark '%@' as purgeable %{errno}d", v4, v5);

}

void EFSaveTailspin_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
}

void EFSaveTailspin_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B106E000, a1, a3, "Could not reach working directory?!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void ___generateTailspin_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B106E000, a1, a3, "Could not reach spool directory?!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void ___generateTailspin_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B106E000, a1, a3, "Mailspin failure!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

uint64_t ___generateTailspin_block_invoke_cold_3()
{
  __error();
  return _os_assumes_log();
}

uint64_t sub_1B10CACE8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B10CACF4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B10CAD00()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1B10CAD0C()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1B10CAD18()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B10CAD24()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
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

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t CFUniCharGetUnicodePropertyDataForPlane()
{
  return MEMORY[0x1E0C99590]();
}

uint64_t CompressFile()
{
  return MEMORY[0x1E0CFCE50]();
}

uint64_t CreateCompressionQueue()
{
  return MEMORY[0x1E0CFCE58]();
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x1E0D1D230]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
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

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFBundleCopyFrameworkURLForExecutablePath()
{
  return MEMORY[0x1E0C99FA0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E62A4200(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E62A4208(__sz);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x1E0C816E8](a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE7A88](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
  MEMORY[0x1E0C82C88](flags, block);
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
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

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1E0CCFE10](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1E0CCFE20](path);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE58](*(_QWORD *)&required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x1E0C84968]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x1E0C84980]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

objc_property_t protocol_getProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t)MEMORY[0x1E0DE80B8](proto, name, isRequiredProperty, isInstanceProperty);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
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

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
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

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
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

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x1E0DE8840](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1E0DE8848](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1E0DE8860](pDb, pStmt);
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

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEE60]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t tailspin_dump_output_with_options()
{
  return MEMORY[0x1E0DE8B28]();
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

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86340](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

