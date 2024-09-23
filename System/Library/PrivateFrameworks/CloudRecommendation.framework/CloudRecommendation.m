uint64_t CECreateError(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudexperience"), a1, 0);
}

id CECreateErrorWithMessage(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDD0FC8];
  v9[0] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudexperience"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_1(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2380E2EDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudNotificationLibraryCore_frameworkLibrary)
  {
    iCloudNotificationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!iCloudNotificationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INDaemonConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getINDaemonConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getINDaemonConnectionClass()
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
  v0 = (void *)getINDaemonConnectionClass_softClass_0;
  v7 = getINDaemonConnectionClass_softClass_0;
  if (!getINDaemonConnectionClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getINDaemonConnectionClass_block_invoke_0;
    v3[3] = &unk_2509E0700;
    v3[4] = &v4;
    __getINDaemonConnectionClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2380E393C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
  {
    iCloudNotificationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INDaemonConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getINDaemonConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id OUTLINED_FUNCTION_0_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_8_0(void *a1)
{
  return a1;
}

void sub_2380E8AD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2380E8BD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2380E8EB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CELogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(a1, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

void sub_2380E90E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __47__iCloudStorageController_fetchStorageSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  iCloudStorageSummary *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CELogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__iCloudStorageController_fetchStorageSummary___block_invoke_cold_1(a1, v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = -[iCloudStorageSummary initWithStorageSummary:]([iCloudStorageSummary alloc], "initWithStorageSummary:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

void sub_2380E9340(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __60__iCloudStorageController_fetchCloudStorageInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __getICQStoragePlanRecommendationClass_block_invoke(uint64_t a1)
{
  iCloudQuotaLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ICQStoragePlanRecommendation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getICQStoragePlanRecommendationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getICQStoragePlanRecommendationClass_block_invoke_cold_1();
    iCloudQuotaLibrary();
  }
}

void iCloudQuotaLibrary()
{
  void *v0;

  if (!iCloudQuotaLibraryCore_frameworkLibrary)
    iCloudQuotaLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!iCloudQuotaLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getICQCloudStorageDataControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  iCloudQuotaLibrary();
  result = objc_getClass("ICQCloudStorageDataController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getICQCloudStorageDataControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getICQCloudStorageDataControllerClass_block_invoke_cold_1();
    return (Class)__getICSHomeDataControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getICSHomeDataControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudSettingsLibraryCore_frameworkLibrary)
  {
    iCloudSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!iCloudSettingsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ICSHomeDataController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getICSHomeDataControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getICSHomeDataControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

id _CELogSystem()
{
  if (_CELogSystem_onceToken != -1)
    dispatch_once(&_CELogSystem_onceToken, &__block_literal_global);
  return (id)_CELogSystem_log;
}

id _CESignpostLogSystem()
{
  if (_CESignpostLogSystem_onceToken != -1)
    dispatch_once(&_CESignpostLogSystem_onceToken, &__block_literal_global_3);
  return (id)_CESignpostLogSystem_log;
}

os_signpost_id_t _CESignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

os_signpost_id_t _CESignpostCreateWithObject(NSObject *a1, const void *a2)
{
  os_signpost_id_t v2;

  v2 = os_signpost_id_make_with_pointer(a1, a2);
  mach_continuous_time();
  return v2;
}

unint64_t _CESignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_CESignpostGetNanoseconds_onceToken[0] != -1)
    dispatch_once(_CESignpostGetNanoseconds_onceToken, &__block_literal_global_5);
  v3 = mach_continuous_time();
  LODWORD(v4) = _CESignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_2568DAE0C;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

id sub_2380ED5B0()
{
  id result;
  uint64_t v1;
  id v2;
  uint64_t v3;

  result = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (result)
  {
    v1 = (uint64_t)result;
    v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    type metadata accessor for ClientRecommendationsCache();
    v3 = swift_allocObject();
    result = (id)sub_2380ED68C(v1, (uint64_t)v2);
    qword_2568DB720 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t (*sub_2380ED64C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2380ED68C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA488);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)(v2 + 24) = sub_238102C84();
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_QWORD *)(v2 + 32) = sub_2380F2628(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return v2;
}

uint64_t sub_2380ED718()
{
  id *v0;

  sub_2380EDFC4();
  swift_release();

  swift_bridgeObjectRelease();
  sub_2380EE594((uint64_t)(v0 + 5));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ClientRecommendationsCache()
{
  return objc_opt_self();
}

void sub_2380ED788(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  os_unfair_lock_s *lock;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_unfair_lock_s *v39;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + 16) + 16);
  os_unfair_lock_lock(v5);
  v6 = (os_unfair_lock_s *)sub_2380F2740(MEMORY[0x24BEE4AF8]);
  if (a3 >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    v7 = sub_238102EA0();
    lock = v5;
    if (v7)
      goto LABEL_3;
LABEL_25:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v38 = *(_QWORD *)(v32 + 32);
    *(_QWORD *)(v32 + 32) = 0x8000000000000000;
    sub_2380EE670((uint64_t)v6, a1, a2, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v32 + 32) = v38;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    os_unfair_lock_unlock(lock);
    return;
  }
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  lock = v5;
  if (!v7)
    goto LABEL_25;
LABEL_3:
  v35 = a3;
  v36 = a3 & 0xC000000000000001;
  v8 = 4;
  while (1)
  {
    v5 = (os_unfair_lock_s *)(v8 - 4);
    if (v36)
      v11 = (id)MEMORY[0x23B82BBE4](v8 - 4, a3);
    else
      v11 = *(id *)(a3 + 8 * v8);
    v12 = v11;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    v37 = v8 - 3;
    v13 = objc_msgSend(v11, sel_identifier);
    v14 = sub_238102CA8();
    v16 = v15;

    v17 = v12;
    v18 = swift_isUniquelyReferenced_nonNull_native();
    v39 = v6;
    v5 = v6;
    v20 = sub_2380FA0F8(v14, v16);
    v21 = *(_QWORD *)&v6[4]._os_unfair_lock_opaque;
    v22 = (v19 & 1) == 0;
    v23 = v21 + v22;
    if (__OFADD__(v21, v22))
      goto LABEL_22;
    a3 = v19;
    if (*(_QWORD *)&v6[6]._os_unfair_lock_opaque < v23)
      break;
    if ((v18 & 1) != 0)
    {
      v6 = v39;
      if ((v19 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      v5 = (os_unfair_lock_s *)&v39;
      sub_2380FAD2C();
      v6 = v39;
      if ((a3 & 1) != 0)
      {
LABEL_4:
        v9 = *(_QWORD *)&v6[14]._os_unfair_lock_opaque;
        v10 = 8 * v20;

        *(_QWORD *)(v9 + v10) = v17;
        goto LABEL_5;
      }
    }
LABEL_17:
    *(_QWORD *)&v6[2 * (v20 >> 6) + 16]._os_unfair_lock_opaque |= 1 << v20;
    v26 = (uint64_t *)(*(_QWORD *)&v6[12]._os_unfair_lock_opaque + 16 * v20);
    *v26 = v14;
    v26[1] = v16;
    *(_QWORD *)(*(_QWORD *)&v6[14]._os_unfair_lock_opaque + 8 * v20) = v17;
    v27 = *(_QWORD *)&v6[4]._os_unfair_lock_opaque;
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_23;
    *(_QWORD *)&v6[4]._os_unfair_lock_opaque = v29;
    swift_bridgeObjectRetain();
LABEL_5:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v8;
    a3 = v35;
    if (v37 == v7)
      goto LABEL_25;
  }
  sub_2380FA550(v23, v18);
  v5 = v39;
  v24 = sub_2380FA0F8(v14, v16);
  if ((a3 & 1) == (v25 & 1))
  {
    v20 = v24;
    v6 = v39;
    if ((a3 & 1) != 0)
      goto LABEL_4;
    goto LABEL_17;
  }
  sub_238102F30();
  __break(1u);
}

void sub_2380EDA84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_unfair_lock_s *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + 16) + 16);
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(_QWORD *)(v2 + 32);
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_2380FA0F8(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_28:
    os_unfair_lock_unlock(v5);
    return;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v10 = 0;
  v11 = v9 + 64;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v9 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    while (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v10 << 6);
      if (v22)
        goto LABEL_23;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v15)
      goto LABEL_27;
    v19 = *(_QWORD *)(v11 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v15)
        goto LABEL_27;
      v19 = *(_QWORD *)(v11 + 8 * v10);
      if (!v19)
      {
        v10 = v18 + 2;
        if (v18 + 2 >= v15)
          goto LABEL_27;
        v19 = *(_QWORD *)(v11 + 8 * v10);
        if (!v19)
          break;
      }
    }
LABEL_22:
    v14 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v10 << 6);
    if (v22)
    {
LABEL_23:
      v21 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v17);
      MEMORY[0x23B82BA40]();
      if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_238102D08();
      sub_238102D14();
      sub_238102CFC();

    }
  }
  v20 = v18 + 3;
  if (v20 >= v15)
  {
LABEL_27:
    swift_release();
    goto LABEL_28;
  }
  v19 = *(_QWORD *)(v11 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v15)
      goto LABEL_27;
    v19 = *(_QWORD *)(v11 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_22;
  }
LABEL_30:
  __break(1u);
}

void sub_2380EDCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  os_unfair_lock_s *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  os_unfair_lock_s *v33;
  uint64_t v34;
  uint64_t v35;

  v9 = (os_unfair_lock_s *)(*(_QWORD *)(v4 + 16) + 16);
  os_unfair_lock_lock(v9);
  v35 = 0;
  swift_beginAccess();
  v10 = *(_QWORD *)(v4 + 32);
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_2380FA0F8(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_37:
    os_unfair_lock_unlock(v9);
    return;
  }
  v33 = v9;
  v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = 0;
  v34 = v13 + 64;
  v15 = 1 << *(_BYTE *)(v13 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v13 + 64);
  v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v21 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v22 = v21 | (v14 << 6);
      goto LABEL_29;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v23 >= v18)
      goto LABEL_36;
    v24 = *(_QWORD *)(v34 + 8 * v23);
    ++v14;
    if (!v24)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v18)
        goto LABEL_36;
      v24 = *(_QWORD *)(v34 + 8 * v14);
      if (!v24)
      {
        v14 = v23 + 2;
        if (v23 + 2 >= v18)
          goto LABEL_36;
        v24 = *(_QWORD *)(v34 + 8 * v14);
        if (!v24)
          break;
      }
    }
LABEL_28:
    v17 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_29:
    v26 = *(id *)(*(_QWORD *)(v13 + 56) + 8 * v22);
    v27 = objc_msgSend(v26, sel_bundleID);
    v28 = sub_238102CA8();
    v30 = v29;

    if (v28 == a3 && v30 == a4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v32 = sub_238102F0C();
      swift_bridgeObjectRelease();
      if ((v32 & 1) == 0)
        goto LABEL_12;
    }
    v19 = v35;
    if (!v35)
      v19 = MEMORY[0x24BEE4AF8];
    v35 = v19;
    v20 = v26;
    MEMORY[0x23B82BA40]();
    if (*(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_238102D08();
    sub_238102D14();
    sub_238102CFC();
LABEL_12:

  }
  v25 = v23 + 3;
  if (v25 >= v18)
  {
LABEL_36:
    swift_release();
    v9 = v33;
    goto LABEL_37;
  }
  v24 = *(_QWORD *)(v34 + 8 * v25);
  if (v24)
  {
    v14 = v25;
    goto LABEL_28;
  }
  while (1)
  {
    v14 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v14 >= v18)
      goto LABEL_36;
    v24 = *(_QWORD *)(v34 + 8 * v14);
    ++v25;
    if (v24)
      goto LABEL_28;
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_2380EDFC4()
{
  uint64_t v0;
  void *v1;
  id v2;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  swift_beginAccess();
  sub_2380EE50C(v0 + 40, (uint64_t)&v4);
  if (v5)
  {
    sub_2380EE61C(&v4, &v6);
    v1 = *(void **)(v0 + 80);
    __swift_project_boxed_opaque_existential_0(&v6, *((uint64_t *)&v7 + 1));
    v2 = v1;
    objc_msgSend(v2, sel_removeObserver_, sub_238102F00());

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
  }
  else
  {
    sub_2380EE594((uint64_t)&v4);
  }
  v6 = 0u;
  v7 = 0u;
  swift_beginAccess();
  sub_2380EE5D4((uint64_t)&v6, v0 + 40);
  return swift_endAccess();
}

void type metadata accessor for Name(uint64_t a1)
{
  sub_2380EE984(a1, &qword_2568DA450);
}

uint64_t sub_2380EE0CC(uint64_t a1, uint64_t a2)
{
  return sub_2380EE374(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2380EE0D8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_238102C90();
  *a2 = 0;
  return result;
}

uint64_t sub_2380EE14C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_238102C9C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2380EE1C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_238102CA8();
  v2 = sub_238102C84();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2380EE208@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_238102C84();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2380EE24C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_238102CA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2380EE274()
{
  sub_2380EE328(&qword_2568DA470, (uint64_t)&unk_238104A20);
  sub_2380EE328(&qword_2568DA478, (uint64_t)&unk_2381049C0);
  return sub_238102EDC();
}

uint64_t sub_2380EE2E0()
{
  return sub_2380EE328(&qword_2568DA458, (uint64_t)&unk_238104984);
}

uint64_t sub_2380EE304()
{
  return sub_2380EE328(&qword_2568DA460, (uint64_t)&unk_238104958);
}

uint64_t sub_2380EE328(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Name(255);
    result = MEMORY[0x23B82C2D4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2380EE368(uint64_t a1, uint64_t a2)
{
  return sub_2380EE374(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2380EE374(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_238102CA8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2380EE3B0()
{
  sub_238102CA8();
  sub_238102CB4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2380EE3F0()
{
  uint64_t v0;

  sub_238102CA8();
  sub_238102F84();
  sub_238102CB4();
  v0 = sub_238102F9C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2380EE460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_238102CA8();
  v2 = v1;
  if (v0 == sub_238102CA8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_238102F0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2380EE4E8()
{
  return sub_2380EE328(&qword_2568DA468, (uint64_t)&unk_2381049F4);
}

uint64_t sub_2380EE50C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B82C2BC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2380EE594(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA480);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2380EE5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2380EE61C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t sub_2380EE670(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2380FA0F8(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2380FAB78();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_2380FA23C(v15, a4 & 1);
  v21 = sub_2380FA0F8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_238102F30();
  __break(1u);
  return result;
}

uint64_t sub_2380EE7CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2380FA0F8(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2380FAD38();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_2380FA55C(v15, a4 & 1);
  v21 = sub_2380FA0F8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_238102F30();
  __break(1u);
  return result;
}

unint64_t sub_2380EE928(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_2380EE984(a1, &qword_2568DA490);
}

void sub_2380EE984(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t CERecommendation.id.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_identifier);
  v2 = sub_238102CA8();

  return v2;
}

Swift::Bool __swiftcall CERecommendation.hasDataclassAction()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Bool v9;
  BOOL v10;

  v1 = objc_msgSend(v0, sel_actions);
  sub_2380EEB50();
  v2 = sub_238102CE4();

  if (v2 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    v4 = 4;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B82BBE4](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      objc_opt_self();
      v8 = swift_dynamicCastObjCClass();
      v9 = v8 != 0;

      ++v4;
      if (v8)
        v10 = 1;
      else
        v10 = v7 == v3;
      if (v10)
        goto LABEL_17;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v3 = sub_238102EA0();
    swift_bridgeObjectRelease();
  }
  v9 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_2380EEB50()
{
  unint64_t result;

  result = qword_2568DA498;
  if (!qword_2568DA498)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568DA498);
  }
  return result;
}

uint64_t sub_2380EEB8C()
{
  return MEMORY[0x24BEE0D10];
}

void sub_2380EEB98(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, sel_identifier);
  v4 = sub_238102CA8();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t sub_2380EEBEC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD), uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_QWORD, _QWORD);
  uint64_t v39;
  uint64_t v40;

  v12 = sub_238102C0C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v16 = *(_QWORD *)(a4 + 16);
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  sub_2380F22EC(v16);
  if (qword_2568DA2C8 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v12, (uint64_t)qword_2568DB728);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v17, v12);
  swift_bridgeObjectRetain_n();
  v18 = v13;
  v19 = sub_238102BF4();
  v20 = sub_238102D8C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v36 = a3;
    v22 = v21;
    v35 = swift_slowAlloc();
    v40 = v35;
    *(_DWORD *)v22 = 136315906;
    v37 = a6;
    v23 = sub_2380FEAFC(0xD000000000000076, 0x8000000238105CF0, &v40);
    v38 = a5;
    v39 = v23;
    sub_238102E10();
    v34 = v18;
    *(_WORD *)(v22 + 12) = 2080;
    v39 = sub_2380FEAFC(0xD000000000000032, 0x8000000238105D70, &v40);
    sub_238102E10();
    *(_WORD *)(v22 + 22) = 2080;
    if ((a2 & 1) != 0)
      v24 = 561210745;
    else
      v24 = 2191214;
    if ((a2 & 1) != 0)
      v25 = 0xE400000000000000;
    else
      v25 = 0xE300000000000000;
    v39 = sub_2380FEAFC(v24, v25, &v40);
    sub_238102E10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 32) = 2080;
    v26 = sub_2380F25A0(0, &qword_2568DA5F8);
    v27 = swift_bridgeObjectRetain();
    v28 = MEMORY[0x23B82BA64](v27, v26);
    v30 = v29;
    swift_bridgeObjectRelease();
    v39 = sub_2380FEAFC(v28, v30, &v40);
    a5 = v38;
    sub_238102E10();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2380DF000, v19, v20, "%s%s Donated recommendations (didTimeout? %s) %s", (uint8_t *)v22, 0x2Au);
    v31 = v35;
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v31, -1, -1);
    v32 = v22;
    a3 = v36;
    MEMORY[0x23B82C364](v32, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v12);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v12);
  }
  return a5(a1, a3);
}

uint64_t sub_2380EEF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_238102F84();
    sub_238102CB4();
    v6 = sub_238102F9C();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_238102F0C() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_238102F0C() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_2380EF098(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA618);
    v2 = sub_238102EC4();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    v19 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v12);
    *(_QWORD *)&v37[0] = *v17;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    v19;
    swift_dynamicCast();
    sub_2380F25A0(0, &qword_2568DA5E8);
    swift_dynamicCast();
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_2380EE61C(&v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_2380EE61C(v36, v37);
    sub_2380EE61C(v37, &v33);
    result = sub_238102E40();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_2380EE61C(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2380F2548();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_2380EF458(unint64_t a1, void *a2, uint64_t a3, NSObject *a4, uint64_t a5, NSObject *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  _QWORD *v37;
  os_log_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  os_log_t v68;
  _QWORD *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81[3];

  v75 = a5;
  v11 = sub_238102BC4();
  v76 = *(_QWORD *)(v11 - 8);
  v77 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v73 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v68 - v14;
  v79 = sub_238102BA0();
  v16 = *(_QWORD *)(v79 - 8);
  v17 = MEMORY[0x24BDAC7A8](v79);
  v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v68 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v68 - v23;
  v78 = a3;
  if (a2)
  {
    v25 = a2;
    if (qword_2568DA2C8 != -1)
      swift_once();
    v26 = sub_238102C0C();
    __swift_project_value_buffer(v26, (uint64_t)qword_2568DB728);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v24, a3, v79);
    v27 = a2;
    v28 = a2;
    v29 = sub_238102BF4();
    v30 = sub_238102D98();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc();
      v69 = (_QWORD *)swift_slowAlloc();
      v70 = swift_slowAlloc();
      v81[0] = v70;
      *(_DWORD *)v31 = 136315394;
      v74 = a6;
      sub_2380F2560(&qword_2568DA5F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v68 = v29;
      v71 = v15;
      v32 = v79;
      v33 = sub_238102EE8();
      v80 = sub_2380FEAFC(v33, v34, v81);
      sub_238102E10();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v24, v32);
      *(_WORD *)(v31 + 12) = 2112;
      v35 = a2;
      v36 = _swift_stdlib_bridgeErrorToNSError();
      v80 = v36;
      v15 = v71;
      sub_238102E10();
      v37 = v69;
      *v69 = v36;
      a6 = v74;

      v38 = v68;
      _os_log_impl(&dword_2380DF000, v68, v30, "Could not fetch recommendations from %s due to %@", (uint8_t *)v31, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA600);
      swift_arrayDestroy();
      MEMORY[0x23B82C364](v37, -1, -1);
      v39 = v70;
      swift_arrayDestroy();
      MEMORY[0x23B82C364](v39, -1, -1);
      MEMORY[0x23B82C364](v31, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v16 + 8))(v24, v79);
    }
    v40 = v77;
  }
  else
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v67 = sub_238102EA0();
      swift_bridgeObjectRelease();
      v40 = v77;
      if (!v67)
        goto LABEL_19;
    }
    else
    {
      v40 = v77;
      if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_19;
    }
    v74 = a4 + 2;
    if (qword_2568DA2C8 != -1)
      swift_once();
    v41 = sub_238102C0C();
    __swift_project_value_buffer(v41, (uint64_t)qword_2568DB728);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v22, v78, v79);
    swift_bridgeObjectRetain_n();
    v42 = sub_238102BF4();
    v43 = sub_238102D8C();
    if (os_log_type_enabled(v42, (os_log_type_t)v43))
    {
      LODWORD(v70) = v43;
      v44 = swift_slowAlloc();
      v69 = (_QWORD *)swift_slowAlloc();
      v81[0] = (uint64_t)v69;
      *(_DWORD *)v44 = 134218242;
      v71 = v15;
      v72 = v19;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        v45 = sub_238102EA0();
        swift_bridgeObjectRelease();
      }
      else
      {
        v45 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v80 = v45;
      sub_238102E10();
      swift_bridgeObjectRelease();
      *(_WORD *)(v44 + 12) = 2080;
      sub_2380F2560(&qword_2568DA5F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v46 = v79;
      v47 = sub_238102EE8();
      v80 = sub_2380FEAFC(v47, v48, v81);
      sub_238102E10();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v46);
      _os_log_impl(&dword_2380DF000, v42, (os_log_type_t)v70, "Loading %ld recommendations from %s", (uint8_t *)v44, 0x16u);
      v49 = v69;
      swift_arrayDestroy();
      MEMORY[0x23B82C364](v49, -1, -1);
      MEMORY[0x23B82C364](v44, -1, -1);

      v15 = v71;
      v19 = v72;
      v40 = v77;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v79);

    }
    swift_beginAccess();
    v50 = swift_bridgeObjectRetain();
    sub_2380EFCF4(v50);
    swift_endAccess();
  }
LABEL_19:
  if (qword_2568DA2C8 != -1)
    swift_once();
  v51 = sub_238102C0C();
  __swift_project_value_buffer(v51, (uint64_t)qword_2568DB728);
  v52 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v15, v75, v40);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v78, v79);
  v53 = sub_238102BF4();
  v54 = sub_238102DA4();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = swift_slowAlloc();
    v78 = v16;
    v56 = v55;
    v57 = swift_slowAlloc();
    v72 = v19;
    v58 = v57;
    v81[0] = v57;
    *(_DWORD *)v56 = 134218242;
    v74 = a6;
    v59 = v73;
    sub_238102BB8();
    sub_238102BAC();
    v61 = v60;
    v62 = *(void (**)(char *, uint64_t))(v52 + 8);
    v62(v59, v40);
    v80 = v61;
    sub_238102E10();
    v62(v15, v40);
    *(_WORD *)(v56 + 12) = 2080;
    sub_2380F2560(&qword_2568DA5F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v63 = v72;
    v64 = v79;
    v65 = sub_238102EE8();
    v80 = sub_2380FEAFC(v65, v66, v81);
    a6 = v74;
    sub_238102E10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v63, v64);
    _os_log_impl(&dword_2380DF000, v53, v54, "It took %f seconds to check recommendations at %s", (uint8_t *)v56, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v58, -1, -1);
    MEMORY[0x23B82C364](v56, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v15, v40);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v79);
  }

  dispatch_group_leave(a6);
}

uint64_t sub_2380EFCF4(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_238102EA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_238102EA0();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B82BBF0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2380F04FC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_238102EA0();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_238102CFC();
  }
  __break(1u);
  return result;
}

uint64_t sub_2380EFEAC(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_238102EA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_238102EA0();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B82BBF0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2380F0718(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_238102EA0();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_238102CFC();
  }
  __break(1u);
  return result;
}

void sub_2380F0064(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_2380F25A0(0, &qword_2568DA5F8);
  v5 = sub_238102CE4();
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();

}

uint64_t sub_2380F00FC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;
  void (*v6)(uint64_t, _QWORD, _QWORD);
  uint64_t v7;

  result = swift_beginAccess();
  v6 = *(void (**)(uint64_t, _QWORD, _QWORD))(a1 + 16);
  if (v6)
  {
    swift_beginAccess();
    sub_2380F2550((uint64_t)v6);
    v7 = swift_bridgeObjectRetain();
    v6(v7, a3 & 1, 0);
    sub_2380F22EC((uint64_t)v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2380F01A8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2380F01D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RecommendationsPluginLoader()
{
  return objc_opt_self();
}

uint64_t sub_2380F0228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v6[2];

  v6[0] = sub_238102DD4();
  v1 = *(_QWORD *)(v6[0] - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238102DBC();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_238102C48();
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v0 + 16) = 0xD000000000000014;
  *(_QWORD *)(v0 + 24) = 0x8000000238105DB0;
  strcpy((char *)(v0 + 32), "ClientSources");
  *(_WORD *)(v0 + 46) = -4864;
  *(_QWORD *)(v0 + 48) = 5;
  sub_2380F25A0(0, &qword_2568DA620);
  sub_238102C30();
  v6[1] = MEMORY[0x24BEE4AF8];
  sub_2380F2560(&qword_2568DA628, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA630);
  sub_2380F25D8(&qword_2568DA638, &qword_2568DA630, MEMORY[0x24BEE12C8]);
  sub_238102E28();
  (*(void (**)(char *, _QWORD, _QWORD))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v6[0]);
  *(_QWORD *)(v0 + 56) = sub_238102DEC();
  return v0;
}

void sub_2380F044C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_238102E10();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_2380F04FC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_238102EA0();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_238102EA0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2380F25D8(&qword_2568DA610, &qword_2568DA608, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA608);
          v12 = sub_2380FB094(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2380F25A0(0, &qword_2568DA5F8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_238102ED0();
  __break(1u);
  return result;
}

uint64_t sub_2380F0718(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_238102EA0();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_238102EA0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2380F25D8((unint64_t *)&unk_2568DA650, &qword_2568DA648, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA648);
          v12 = sub_2380FB0EC(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2380F25A0(0, &qword_2568DA640);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_238102ED0();
  __break(1u);
  return result;
}

uint64_t sub_2380F0934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, NSObject *a6, void *a7, uint64_t a8, void (*a9)(char *, uint64_t))
{
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  _QWORD *v51;
  void (*v52)(_QWORD, _QWORD, _QWORD);
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  char *v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  os_log_type_t v72;
  _BOOL4 v73;
  uint64_t v74;
  char *v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  char *v84;
  void *v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  __int128 v107;
  uint64_t v108;
  char *v109;
  void (*v110)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v111;
  char *v112;
  NSObject *v113;
  os_log_type_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  id v122;
  void *v123;
  id v124;
  char *v125;
  id v126;
  uint64_t v127;
  char *v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  char v142;
  id v143;
  NSObject *v144;
  char *v145;
  os_log_type_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  void (*v151)(char *, uint64_t);
  uint64_t v152;
  uint64_t v153;
  char *v154;
  NSObject *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void (*v164)(char *, uint64_t);
  char *v165;
  char *v166;
  uint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  dispatch_group_t v174;
  void *v175;
  NSObject *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  char *v181;
  char *v182;
  uint64_t v183;
  dispatch_group_t v184;
  void (*v185)(char *, uint64_t);
  NSObject *v186;
  uint64_t v187;
  uint8_t *v188;
  NSObject *v189;
  os_log_type_t v190;
  uint8_t *v191;
  void (*v192)(char *, uint64_t);
  uint64_t v194;
  id v195;
  uint64_t v196;
  void (*v197)(char *, uint64_t);
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  char *v203;
  uint64_t v204;
  _QWORD *v205;
  uint64_t v206;
  uint64_t v207;
  char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char *v212;
  _QWORD *v213;
  uint64_t v214;
  id v215;
  dispatch_group_t v216;
  char *v217;
  char *v218;
  uint64_t v219;
  char *v220;
  char *v221;
  uint64_t v222;
  char *v223;
  uint64_t v224;
  char *v225;
  uint64_t v226;
  _QWORD *v227;
  char *v228;
  char *v229;
  __int128 v230;
  void (*v231)(_QWORD, _QWORD, _QWORD);
  uint64_t v232;
  char *v233;
  char *v234;
  char *v235;
  uint64_t v236;
  char *v237;
  void (*v238)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v239)(char *, char *, uint64_t);
  uint64_t v240;
  uint64_t v241;
  char *v242;
  void *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t aBlock;
  uint64_t v247;
  void *v248;
  void *v249;
  void *v250;
  uint64_t v251;

  v232 = a4;
  v200 = a3;
  v199 = a2;
  v236 = a1;
  v226 = sub_238102BC4();
  v219 = *(_QWORD *)(v226 - 8);
  v13 = MEMORY[0x24BDAC7A8](v226);
  v212 = (char *)&v194 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v202 = v14;
  MEMORY[0x24BDAC7A8](v13);
  v225 = (char *)&v194 - v15;
  v211 = sub_238102B64();
  v210 = *(_QWORD *)(v211 - 8);
  MEMORY[0x24BDAC7A8](v211);
  v229 = (char *)&v194 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v224 = sub_238102C24();
  *(_QWORD *)&v230 = *(_QWORD *)(v224 - 8);
  MEMORY[0x24BDAC7A8](v224);
  v223 = (char *)&v194 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v222 = sub_238102C48();
  v213 = *(_QWORD **)(v222 - 8);
  MEMORY[0x24BDAC7A8](v222);
  v221 = (char *)&v194 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v207 = sub_238102C18();
  v206 = *(_QWORD *)(v207 - 8);
  MEMORY[0x24BDAC7A8](v207);
  v205 = (uint64_t *)((char *)&v194 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v209 = sub_238102C60();
  v204 = *(_QWORD *)(v209 - 8);
  v20 = MEMORY[0x24BDAC7A8](v209);
  v203 = (char *)&v194 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v208 = (char *)&v194 - v22;
  v240 = sub_238102B70();
  v23 = *(_QWORD *)(v240 - 8);
  MEMORY[0x24BDAC7A8](v240);
  v25 = (char *)&v194 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_238102BA0();
  v241 = *(_QWORD *)(v26 - 8);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v235 = (char *)&v194 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v198 = (char *)&v194 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v220 = (char *)&v194 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v234 = (char *)&v194 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v237 = (char *)&v194 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v242 = (char *)&v194 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v233 = (char *)&v194 - v40;
  v201 = v41;
  MEMORY[0x24BDAC7A8](v39);
  v228 = (char *)&v194 - v42;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA560);
  v44 = MEMORY[0x24BDAC7A8](v43);
  v217 = (char *)&v194 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = MEMORY[0x24BDAC7A8](v44);
  v48 = (char *)&v194 - v47;
  MEMORY[0x24BDAC7A8](v46);
  v50 = (char *)&v194 - v49;
  v51 = (_QWORD *)swift_allocObject();
  v51[2] = a5;
  v51[3] = a6;
  v216 = a6;
  v51[4] = a7;
  v51[5] = a8;
  v214 = a8;
  v227 = v51;
  v51[6] = a9;
  v52 = (void (*)(_QWORD, _QWORD, _QWORD))objc_opt_self();
  swift_bridgeObjectRetain();
  v215 = a7;
  swift_retain();
  v197 = a9;
  swift_bridgeObjectRetain();
  v231 = v52;
  v53 = objc_msgSend(v52, sel_defaultManager);
  v54 = objc_msgSend(v53, sel_URLsForDirectory_inDomains_, 5, 8);

  v55 = sub_238102CE4();
  if (*(_QWORD *)(v55 + 16))
  {
    v56 = v241;
    (*(void (**)(char *, unint64_t, uint64_t))(v241 + 16))(v50, v55 + ((*(unsigned __int8 *)(v241 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v241 + 80)), v26);
    v57 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56);
    v58 = v50;
    v59 = 0;
  }
  else
  {
    v57 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v241 + 56);
    v58 = v50;
    v59 = 1;
  }
  v238 = v57;
  v57((uint64_t)v58, v59, 1, v26);
  v60 = v26;
  swift_bridgeObjectRelease();
  v61 = *MEMORY[0x24BDCD790];
  v62 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 104);
  v63 = v240;
  v62(v25, v61, v240);
  v218 = v50;
  sub_2380F21C4((uint64_t)v50, (uint64_t)v48);
  swift_bridgeObjectRetain();
  v64 = v228;
  sub_238102B94();
  v62(v25, v61, v63);
  v65 = *(void (**)(char *, char *, uint64_t))(v241 + 16);
  v65(v48, v64, v60);
  v238((uint64_t)v48, 0, 1, v60);
  swift_bridgeObjectRetain();
  v66 = v233;
  sub_238102B94();
  v67 = v60;
  if (qword_2568DA2C8 != -1)
    swift_once();
  v68 = sub_238102C0C();
  v69 = __swift_project_value_buffer(v68, (uint64_t)qword_2568DB728);
  v70 = v242;
  v65(v242, v66, v67);
  v240 = v69;
  v71 = sub_238102BF4();
  v72 = sub_238102DA4();
  v73 = os_log_type_enabled(v71, v72);
  v74 = (uint64_t)v217;
  v239 = v65;
  if (v73)
  {
    v75 = v70;
    v76 = (uint8_t *)swift_slowAlloc();
    v77 = swift_slowAlloc();
    aBlock = v77;
    *(_DWORD *)v76 = 136315138;
    v78 = sub_238102B7C();
    v244 = sub_2380FEAFC(v78, v79, &aBlock);
    sub_238102E10();
    swift_bridgeObjectRelease();
    v242 = *(char **)(v241 + 8);
    ((void (*)(char *, uint64_t))v242)(v75, v67);
    _os_log_impl(&dword_2380DF000, v71, v72, "Preparing to fetch client donated recommendations from %s", v76, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v77, -1, -1);
    MEMORY[0x23B82C364](v76, -1, -1);
  }
  else
  {
    v242 = *(char **)(v241 + 8);
    ((void (*)(char *, uint64_t))v242)(v70, v67);
  }

  v80 = v231;
  v81 = swift_allocObject();
  v82 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v81 + 16) = MEMORY[0x24BEE4AF8];
  v83 = objc_msgSend(v80, sel_defaultManager);
  v84 = v233;
  v85 = (void *)sub_238102D80();

  if (v85)
  {
    v216 = dispatch_group_create();
    v86 = swift_allocObject();
    *(_QWORD *)(v86 + 24) = 0;
    *(_QWORD *)(v86 + 16) = 0;
    v87 = (_QWORD *)swift_allocObject();
    v215 = v85;
    v88 = v87;
    v87[2] = v86;
    v87[3] = sub_2380F21B4;
    v87[4] = v227;
    swift_beginAccess();
    v89 = *(_QWORD *)(v86 + 16);
    *(_QWORD *)(v86 + 16) = sub_2380F22E0;
    *(_QWORD *)(v86 + 24) = v88;
    swift_retain();
    swift_retain();
    sub_2380F22EC(v89);
    v214 = *(_QWORD *)(v232 + 56);
    v90 = v203;
    sub_238102C54();
    v91 = v205;
    *v205 = 5;
    v92 = v206;
    v93 = v207;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v206 + 104))(v91, *MEMORY[0x24BEE5420], v207);
    v94 = v208;
    MEMORY[0x23B82B9E0](v90, v91);
    (*(void (**)(_QWORD *, uint64_t))(v92 + 8))(v91, v93);
    v232 = *(_QWORD *)(v204 + 8);
    v95 = v90;
    v96 = v209;
    ((void (*)(char *, uint64_t))v232)(v95, v209);
    v97 = swift_allocObject();
    *(_QWORD *)(v97 + 16) = v86;
    *(_QWORD *)(v97 + 24) = v81;
    v250 = sub_2380F2300;
    v251 = v97;
    aBlock = MEMORY[0x24BDAC760];
    v247 = 1107296256;
    v248 = sub_2380F01A8;
    v249 = &block_descriptor;
    v98 = _Block_copy(&aBlock);
    v206 = v86;
    swift_retain();
    v207 = v81;
    swift_retain();
    v99 = v221;
    sub_238102C30();
    v244 = MEMORY[0x24BEE4AF8];
    v100 = sub_2380F2560(&qword_2568DA568, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA570);
    v102 = sub_2380F25D8(&qword_2568DA578, &qword_2568DA570, MEMORY[0x24BEE12C8]);
    v103 = v223;
    v204 = v101;
    v196 = v102;
    v104 = v224;
    v205 = (_QWORD *)v100;
    sub_238102E28();
    MEMORY[0x23B82BB3C](v94, v99, v103, v98);
    _Block_release(v98);
    v203 = *(char **)(v230 + 8);
    ((void (*)(char *, uint64_t))v203)(v103, v104);
    v197 = (void (*)(char *, uint64_t))v213[1];
    v197(v99, v222);
    ((void (*)(char *, uint64_t))v232)(v94, v96);
    v105 = v241;
    swift_release();
    v106 = v229;
    sub_238102D74();
    sub_238102B58();
    v108 = v236;
    v109 = v237;
    v110 = v238;
    if (v245)
    {
      v209 = v201 + 7;
      v208 = v202 + 7;
      v111 = MEMORY[0x24BEE4AD8];
      *(_QWORD *)&v107 = 136315138;
      v230 = v107;
      v232 = MEMORY[0x24BEE4AD8] + 8;
      while ((swift_dynamicCast() & 1) != 0)
      {
        v110(v74, 0, 1, v67);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v105 + 48))(v74, 1, v67) == 1)
          goto LABEL_13;
        v231 = *(void (**)(_QWORD, _QWORD, _QWORD))(v105 + 32);
        v231(v109, v74, v67);
        v112 = v234;
        v239(v234, v109, v67);
        v113 = sub_238102BF4();
        v114 = sub_238102D8C();
        if (os_log_type_enabled(v113, v114))
        {
          v115 = swift_slowAlloc();
          v116 = swift_slowAlloc();
          aBlock = v116;
          *(_DWORD *)v115 = v230;
          sub_2380F2560(&qword_2568DA5F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
          v117 = sub_238102EE8();
          *(_QWORD *)(v115 + 4) = sub_2380FEAFC(v117, v118, &aBlock);
          swift_bridgeObjectRelease();
          ((void (*)(char *, uint64_t))v242)(v112, v67);
          _os_log_impl(&dword_2380DF000, v113, v114, "Visiting %s", (uint8_t *)v115, 0xCu);
          swift_arrayDestroy();
          v119 = v116;
          v108 = v236;
          MEMORY[0x23B82C364](v119, -1, -1);
          v120 = v115;
          v109 = v237;
          MEMORY[0x23B82C364](v120, -1, -1);
        }
        else
        {
          ((void (*)(char *, uint64_t))v242)(v112, v67);
        }

        v121 = v235;
        v122 = objc_allocWithZone(MEMORY[0x24BDD1488]);
        v123 = (void *)sub_238102B88();
        v124 = objc_msgSend(v122, sel_initWithURL_, v123);

        if (!v124)
        {
          v154 = v220;
          v239(v220, v109, v67);
          v155 = sub_238102BF4();
          v156 = sub_238102D98();
          if (os_log_type_enabled(v155, (os_log_type_t)v156))
          {
            v157 = swift_slowAlloc();
            v158 = v111;
            v159 = swift_slowAlloc();
            aBlock = v159;
            *(_DWORD *)v157 = v230;
            v160 = sub_238102B7C();
            *(_QWORD *)(v157 + 4) = sub_2380FEAFC(v160, v161, &aBlock);
            swift_bridgeObjectRelease();
            v151 = (void (*)(char *, uint64_t))v242;
            ((void (*)(char *, uint64_t))v242)(v154, v67);
            _os_log_impl(&dword_2380DF000, v155, (os_log_type_t)v156, "Unable to load source bundle at %s", (uint8_t *)v157, 0xCu);
            swift_arrayDestroy();
            v162 = v159;
            v111 = v158;
            v106 = v229;
            MEMORY[0x23B82C364](v162, -1, -1);
            v163 = v157;
            v108 = v236;
            MEMORY[0x23B82C364](v163, -1, -1);

          }
          else
          {

            v151 = (void (*)(char *, uint64_t))v242;
            ((void (*)(char *, uint64_t))v242)(v154, v67);
          }
LABEL_35:
          v151(v109, v67);
LABEL_41:
          v105 = v241;
          v110 = v238;
          goto LABEL_14;
        }
        if (objc_msgSend(v124, sel_principalClass))
        {
          swift_getObjCClassMetadata();
          sub_2380F25A0(0, &qword_2568DA580);
          if (swift_dynamicCastMetatype())
          {
            v125 = v225;
            sub_238102BB8();
            v126 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
            v243 = &unk_2568DF378;
            v213 = (_QWORD *)swift_dynamicCastObjCProtocolConditional();
            if (v213)
            {
              v127 = *(_QWORD *)(v108 + 16);
              v128 = (char *)v126;
              if (!v127)
                goto LABEL_26;
              v129 = objc_msgSend(v213, sel_bundleID);
              v130 = sub_238102CA8();
              v132 = v131;

              v133 = v130;
              v108 = v236;
              LOBYTE(v129) = sub_2380EEF64(v133, v132, v236);
              swift_bridgeObjectRelease();
              if ((v129 & 1) == 0)
              {
                v126 = v128;
              }
              else
              {
LABEL_26:
                dispatch_group_enter(v216);
                sub_2380F25A0(0, &qword_2568DA5E8);
                v134 = (void *)sub_238102DF8();
                v135 = objc_msgSend(v213, sel_bundleID);
                v136 = sub_238102CA8();
                v138 = v137;

                v139 = v200;
                v140 = *(_QWORD *)(v200 + 16);
                v202 = v128;
                if (v140 && (v141 = sub_2380FA0F8(v136, v138), (v142 & 1) != 0))
                {
                  v143 = *(id *)(*(_QWORD *)(v139 + 56) + 8 * v141);

                  v195 = v143;
                }
                else
                {
                  v195 = v134;
                }
                v165 = v225;
                swift_bridgeObjectRelease();
                sub_2380EF098(v199);
                v201 = sub_238102C78();
                swift_bridgeObjectRelease();
                v166 = v198;
                v239(v198, v237, v67);
                v167 = v219;
                (*(void (**)(char *, char *, uint64_t))(v219 + 16))(v212, v165, v226);
                v168 = (*(unsigned __int8 *)(v241 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v241 + 80);
                v169 = (v209 + v168) & 0xFFFFFFFFFFFFFFF8;
                v170 = (*(unsigned __int8 *)(v167 + 80) + v169 + 8) & ~(unint64_t)*(unsigned __int8 *)(v167 + 80);
                v171 = (unint64_t)&v208[v170] & 0xFFFFFFFFFFFFFFF8;
                v172 = swift_allocObject();
                v231(v172 + v168, v166, v67);
                *(_QWORD *)(v172 + v169) = v207;
                v173 = v172 + v170;
                v125 = v225;
                (*(void (**)(unint64_t, char *, uint64_t))(v167 + 32))(v173, v212, v226);
                v174 = v216;
                *(_QWORD *)(v172 + v171) = v216;
                v111 = MEMORY[0x24BEE4AD8];
                v250 = sub_2380F24AC;
                v251 = v172;
                aBlock = MEMORY[0x24BDAC760];
                v247 = 1107296256;
                v248 = sub_2380F0064;
                v249 = &block_descriptor_24;
                v175 = _Block_copy(&aBlock);
                swift_retain();
                v126 = v195;
                v176 = v174;
                swift_release();
                v128 = (char *)v201;
                objc_msgSend(v213, sel_recommendationsForThresholds_afterTimestamp_completion_, v201, v126, v175);

                _Block_release(v175);
                v177 = v202;

                v124 = v126;
                v108 = v236;
                v106 = v229;
              }

            }
            (*(void (**)(char *, uint64_t))(v219 + 8))(v125, v226);
            v109 = v237;
            ((void (*)(char *, uint64_t))v242)(v237, v67);
            goto LABEL_41;
          }
        }
        v109 = v237;
        v239(v121, v237, v67);
        v144 = sub_238102BF4();
        v145 = v121;
        v146 = sub_238102D98();
        if (os_log_type_enabled(v144, v146))
        {
          v147 = swift_slowAlloc();
          v148 = swift_slowAlloc();
          aBlock = v148;
          *(_DWORD *)v147 = v230;
          v149 = sub_238102B7C();
          *(_QWORD *)(v147 + 4) = sub_2380FEAFC(v149, v150, &aBlock);
          swift_bridgeObjectRelease();
          v151 = (void (*)(char *, uint64_t))v242;
          ((void (*)(char *, uint64_t))v242)(v145, v67);
          _os_log_impl(&dword_2380DF000, v144, v146, "Principal Class not found for bundle at %s", (uint8_t *)v147, 0xCu);
          v111 = MEMORY[0x24BEE4AD8];
          swift_arrayDestroy();
          v152 = v148;
          v106 = v229;
          MEMORY[0x23B82C364](v152, -1, -1);
          v153 = v147;
          v108 = v236;
          MEMORY[0x23B82C364](v153, -1, -1);

          goto LABEL_35;
        }

        v164 = (void (*)(char *, uint64_t))v242;
        ((void (*)(char *, uint64_t))v242)(v145, v67);
        v164(v109, v67);
        v105 = v241;
        v110 = v238;
        v111 = MEMORY[0x24BEE4AD8];
LABEL_14:
        sub_238102B58();
        if (!v245)
          goto LABEL_42;
      }
      v110(v74, 1, 1, v67);
LABEL_13:
      sub_2380F2248(v74);
      goto LABEL_14;
    }
LABEL_42:
    (*(void (**)(char *, uint64_t))(v210 + 8))(v106, v211);
    v178 = swift_allocObject();
    v179 = v207;
    *(_QWORD *)(v178 + 16) = v206;
    *(_QWORD *)(v178 + 24) = v179;
    v250 = sub_2380F23A8;
    v251 = v178;
    aBlock = MEMORY[0x24BDAC760];
    v247 = 1107296256;
    v248 = sub_2380F01A8;
    v249 = &block_descriptor_18;
    v180 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    v181 = v221;
    sub_238102C30();
    v244 = MEMORY[0x24BEE4AF8];
    v182 = v223;
    v183 = v224;
    sub_238102E28();
    v184 = v216;
    sub_238102DB0();
    _Block_release(v180);

    ((void (*)(char *, uint64_t))v203)(v182, v183);
    v197(v181, v222);
    v185 = (void (*)(char *, uint64_t))v242;
    ((void (*)(char *, uint64_t))v242)(v233, v67);
    v185(v228, v67);
    sub_2380F2248((uint64_t)v218);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    v186 = sub_238102BF4();
    v187 = sub_238102D98();
    if (os_log_type_enabled(v186, (os_log_type_t)v187))
    {
      v188 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v188 = 0;
      _os_log_impl(&dword_2380DF000, v186, (os_log_type_t)v187, "Unable to initialize bundles enumerator", v188, 2u);
      MEMORY[0x23B82C364](v188, -1, -1);
    }

    v189 = sub_238102BF4();
    v190 = sub_238102D8C();
    if (os_log_type_enabled(v189, v190))
    {
      v191 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v191 = 0;
      _os_log_impl(&dword_2380DF000, v189, v190, "Request to fetch recommendations from client donors has been completed.", v191, 2u);
      MEMORY[0x23B82C364](v191, -1, -1);
    }

    if ((v82 & 0xC000000000000000) != 0 && sub_238102EA0())
    {
      if (qword_2568DA2C0 != -1)
        swift_once();
      sub_2380ED788(v214, (uint64_t)v197, MEMORY[0x24BEE4AF8]);
    }
    ((void (*)(_QWORD, _QWORD))v216)(MEMORY[0x24BEE4AF8], 0);
    v192 = (void (*)(char *, uint64_t))v242;
    ((void (*)(char *, uint64_t))v242)(v84, v67);
    v192(v228, v67);
    sub_2380F2248((uint64_t)v218);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_2380F2180()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2380F21B4(unint64_t a1, void *a2)
{
  uint64_t v2;

  sub_2380FDB18(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(unint64_t, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_2380F21C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2380F2224()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2380F2248(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA560);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2380F2288()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_2380F22B4()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2380F22E0(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2380EEBEC(a1, a2, a3, *(_QWORD *)(v3 + 16), *(uint64_t (**)(_QWORD, _QWORD))(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t sub_2380F22EC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2380F2300()
{
  uint64_t v0;

  return sub_2380F00FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 1);
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B82C2C8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t objectdestroy_11Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2380F23A8()
{
  uint64_t v0;

  return sub_2380F00FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 0);
}

uint64_t sub_2380F23C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = sub_238102BA0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_238102BC4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);

  return swift_deallocObject();
}

void sub_2380F24AC(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v5 = *(_QWORD *)(sub_238102BA0() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(sub_238102BC4() - 8);
  v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  sub_2380EF458(a1, a2, v2 + v6, *(NSObject **)(v2 + v7), v2 + v9, *(NSObject **)(v2 + ((*(_QWORD *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_2380F2548()
{
  return swift_release();
}

uint64_t sub_2380F2550(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2380F2560(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B82C2D4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2380F25A0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2380F25D8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B82C2D4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2380F2628(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA700);
  v2 = (_QWORD *)sub_238102EC4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2380FA0F8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_2380F2740(uint64_t a1)
{
  return sub_2380F29A4(a1, &qword_2568DA6E0);
}

unint64_t sub_2380F274C(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA718);
  v2 = sub_238102EC4();
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
    sub_2380F301C(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_2380FA0F8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2380EE61C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2380F2874(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA708);
  v2 = (_QWORD *)sub_238102EC4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_2380FA0F8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_2380F298C(uint64_t a1)
{
  return sub_2380F29A4(a1, &qword_2568DA6D8);
}

unint64_t sub_2380F2998(uint64_t a1)
{
  return sub_2380F29A4(a1, &qword_2568DA710);
}

unint64_t sub_2380F29A4(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_238102EC4();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_2380FA0F8(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
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

unint64_t static RecommendationsError.errorDomain.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t RecommendationsError.errorCode.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t RecommendationsError.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t RecommendationsError.errorUserInfo.getter()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t inited;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA6C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_238104BB0;
  *(_QWORD *)(inited + 32) = sub_238102CA8();
  *(_QWORD *)(inited + 40) = v3;
  v4 = 0xD00000000000001FLL;
  if (v1)
    v4 = 0xD00000000000002FLL;
  v5 = 0x8000000238105E60;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  if (v1)
    v5 = 0x8000000238105E30;
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v5;
  return sub_2380F274C(inited);
}

CloudRecommendation::RecommendationsError_optional __swiftcall RecommendationsError.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (CloudRecommendation::RecommendationsError_optional)rawValue;
}

BOOL sub_2380F2BAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_2380F2BC8()
{
  unint64_t result;

  result = qword_2568DA6C8;
  if (!qword_2568DA6C8)
  {
    result = MEMORY[0x23B82C2D4](&protocol conformance descriptor for RecommendationsError, &type metadata for RecommendationsError);
    atomic_store(result, (unint64_t *)&qword_2568DA6C8);
  }
  return result;
}

uint64_t sub_2380F2C0C()
{
  sub_238102F84();
  sub_238102F90();
  return sub_238102F9C();
}

uint64_t sub_2380F2C50()
{
  return sub_238102F90();
}

uint64_t sub_2380F2C78()
{
  sub_238102F84();
  sub_238102F90();
  return sub_238102F9C();
}

_QWORD *sub_2380F2CB8@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_2380F2CD8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_2380F2CE8()
{
  unint64_t result;

  result = qword_2568DA6D0;
  if (!qword_2568DA6D0)
  {
    result = MEMORY[0x23B82C2D4](&protocol conformance descriptor for RecommendationsError, &type metadata for RecommendationsError);
    atomic_store(result, (unint64_t *)&qword_2568DA6D0);
  }
  return result;
}

unint64_t sub_2380F2D2C()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_2380F2D48()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_2380F2D54()
{
  sub_2380F2F50();
  return sub_238102F48();
}

uint64_t sub_2380F2D7C()
{
  sub_2380F2F50();
  sub_2380F2F94();
  sub_2380F2FD8();
  return sub_238102F3C();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecommendationsError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RecommendationsError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2380F2EB8 + 4 * byte_238104BC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2380F2EEC + 4 * byte_238104BC0[v4]))();
}

uint64_t sub_2380F2EEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380F2EF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2380F2EFCLL);
  return result;
}

uint64_t sub_2380F2F08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2380F2F10);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2380F2F14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380F2F1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380F2F28(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2380F2F34(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RecommendationsError()
{
  return &type metadata for RecommendationsError;
}

unint64_t sub_2380F2F50()
{
  unint64_t result;

  result = qword_2568DA6E8;
  if (!qword_2568DA6E8)
  {
    result = MEMORY[0x23B82C2D4](&protocol conformance descriptor for RecommendationsError, &type metadata for RecommendationsError);
    atomic_store(result, (unint64_t *)&qword_2568DA6E8);
  }
  return result;
}

unint64_t sub_2380F2F94()
{
  unint64_t result;

  result = qword_2568DA6F0;
  if (!qword_2568DA6F0)
  {
    result = MEMORY[0x23B82C2D4](&protocol conformance descriptor for RecommendationsError, &type metadata for RecommendationsError);
    atomic_store(result, (unint64_t *)&qword_2568DA6F0);
  }
  return result;
}

unint64_t sub_2380F2FD8()
{
  unint64_t result;

  result = qword_2568DA6F8;
  if (!qword_2568DA6F8)
  {
    result = MEMORY[0x23B82C2D4](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2568DA6F8);
  }
  return result;
}

uint64_t sub_2380F301C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CERecommendationAction.id.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_actionIdentifier);
  v2 = sub_238102CA8();

  return v2;
}

void sub_2380F30B8(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, sel_actionIdentifier);
  v4 = sub_238102CA8();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t sub_2380F310C()
{
  uint64_t v0;

  v0 = sub_238102C0C();
  __swift_allocate_value_buffer(v0, qword_2568DB728);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568DB728);
  swift_bridgeObjectRetain();
  return sub_238102C00();
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

BOOL static RecommendationsFetcher.FetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RecommendationsFetcher.FetchError.hash(into:)()
{
  return sub_238102F90();
}

uint64_t RecommendationsFetcher.FetchError.hashValue.getter()
{
  sub_238102F84();
  sub_238102F90();
  return sub_238102F9C();
}

id sub_2380F3268()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RecommendationsFetcher()), sel_init);
  qword_2568DA738 = (uint64_t)result;
  return result;
}

id RecommendationsFetcher.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static RecommendationsFetcher.shared.getter()
{
  if (qword_2568DA2D0 != -1)
    swift_once();
  return (id)qword_2568DA738;
}

uint64_t sub_2380F3334(void *a1)
{
  return sub_2380F338C(a1, 0, 0);
}

uint64_t sub_2380F338C(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  uint64_t v19;

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568DA2C8 != -1)
    swift_once();
  v10 = sub_238102C0C();
  __swift_project_value_buffer(v10, (uint64_t)qword_2568DB728);
  v11 = sub_238102BF4();
  v12 = sub_238102D8C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2380DF000, v11, v12, "Clearing recommendations cache", v13, 2u);
    MEMORY[0x23B82C364](v13, -1, -1);
  }

  v14 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v4;
  v15[5] = a1;
  v15[6] = a2;
  v15[7] = a3;
  v16 = v4;
  v17 = a1;
  sub_2380F2550(a2);
  sub_2380F4460((uint64_t)v9, (uint64_t)&unk_2568DA750, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_2380F3528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[334] = a7;
  v7[333] = a6;
  v7[332] = a5;
  v7[331] = a4;
  return swift_task_switch();
}

uint64_t sub_2380F354C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 2680) = *(_QWORD *)(*(_QWORD *)(v0 + 2648)
                                     + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

id sub_2380F3570()
{
  uint64_t v0;
  id v1;
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(v0 + 2656), sel_aa_altDSID);
  if (v1
    || (result = objc_msgSend(*(id *)(v0 + 2656), sel_aa_personID),
        (v1 = result) != 0))
  {
    v3 = sub_238102CA8();
    v5 = v4;

    swift_beginAccess();
    sub_2380FF218(v3, v5);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    return (id)swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2380F3654()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v16;

  v16 = v0[333];
  v1 = (void *)v0[332];
  v2 = (void *)v0[331];
  v3 = swift_allocObject();
  v0[336] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = v2;
  v5 = v1;
  swift_retain();
  sub_2380F25A0(255, &qword_2568DAC00);
  swift_asyncLet_begin();
  v6 = swift_allocObject();
  v0[337] = v6;
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = v4;
  v8 = v5;
  swift_retain();
  swift_asyncLet_begin();
  v9 = swift_allocObject();
  v0[338] = v9;
  *(_QWORD *)(v9 + 16) = v7;
  *(_QWORD *)(v9 + 24) = v8;
  v10 = v7;
  v11 = v8;
  swift_retain();
  sub_2380F25A0(255, &qword_2568DACC8);
  swift_asyncLet_begin();
  v12 = swift_allocObject();
  v0[339] = v12;
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = v10;
  v14 = v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568DA608);
  swift_asyncLet_begin();
  if (v16)
    return swift_asyncLet_get_throwing();
  else
    return swift_asyncLet_finish();
}

uint64_t sub_2380F38C0()
{
  uint64_t v0;
  _QWORD *v1;
  void *v3;
  id v4;

  v1[340] = v0;
  if (v0)
    return swift_asyncLet_finish();
  v3 = (void *)v1[329];
  v1[341] = v3;
  v4 = v3;
  return swift_asyncLet_get_throwing();
}

uint64_t sub_2380F3948()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 2736) = v0;
  return swift_task_switch();
}

uint64_t sub_2380F3970()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(void *, void *, _QWORD);
  void *v3;
  id v4;

  v1 = (void *)v0[341];
  v2 = (void (*)(void *, void *, _QWORD))v0[333];
  v3 = (void *)v0[330];
  v4 = v3;
  v2(v1, v3, 0);

  return swift_asyncLet_finish();
}

uint64_t sub_2380F39FC()
{
  return swift_task_switch();
}

uint64_t sub_2380F3A10()
{
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3A28()
{
  return swift_task_switch();
}

uint64_t sub_2380F3A3C()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3A90()
{
  return swift_task_switch();
}

uint64_t sub_2380F3AA4()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3AF8()
{
  return swift_task_switch();
}

uint64_t sub_2380F3B0C()
{
  uint64_t v0;

  swift_release_n();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F3B6C()
{
  return swift_task_switch();
}

uint64_t sub_2380F3B80()
{
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3B98()
{
  return swift_task_switch();
}

uint64_t sub_2380F3BAC()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3C00()
{
  return swift_task_switch();
}

uint64_t sub_2380F3C14()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3C68()
{
  return swift_task_switch();
}

uint64_t sub_2380F3C7C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, _QWORD, void *);
  id v3;

  v1 = *(void **)(v0 + 2720);
  v2 = *(void (**)(_QWORD, _QWORD, void *))(v0 + 2664);
  swift_release();
  v3 = v1;
  v2(0, 0, v1);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F3D28()
{
  uint64_t v0;

  return swift_asyncLet_finish();
}

uint64_t sub_2380F3D7C()
{
  return swift_task_switch();
}

uint64_t sub_2380F3D90()
{
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3DA8()
{
  return swift_task_switch();
}

uint64_t sub_2380F3DBC()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3E10()
{
  return swift_task_switch();
}

uint64_t sub_2380F3E24()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_2380F3E78()
{
  return swift_task_switch();
}

uint64_t sub_2380F3E8C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, _QWORD, void *);
  id v3;

  v1 = *(void **)(v0 + 2736);
  v2 = *(void (**)(_QWORD, _QWORD, void *))(v0 + 2664);
  swift_release();
  v3 = v1;
  v2(0, 0, v1);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F3F38()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  if (*(_QWORD *)(v0 + 48))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_2380F3F7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_2380FCE70;
  *(_QWORD *)(v4 + 2672) = v3;
  *(_QWORD *)(v4 + 2664) = v2;
  *(_OWORD *)(v4 + 2648) = v5;
  return swift_task_switch();
}

uint64_t sub_2380F3FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2380F4010()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F4034()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_2380F69F0(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F40A4;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_2380F40A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F4118()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F4154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2380F4170()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F4194()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_2380F69F0(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F4204;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_2380F4204(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F4278()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F42B4()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 72);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F42CC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F4300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2380F431C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F4340()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_2380F69F0(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F40A4;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_2380F43B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2380F43CC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F43F0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = sub_2380F69F0(*(void **)(v0 + 32));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F40A4;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = 0;
  return swift_task_switch();
}

uint64_t sub_2380F4460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_238102D50();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_238102D44();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2380FC56C(a1, &qword_2568DA740);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_238102D20();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2380F464C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (a3)
    v7 = sub_238102B4C();
  else
    v7 = 0;
  v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);

}

uint64_t sub_2380F46B4(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_2380F5D48(a1, a2, a3, a4, (uint64_t)&unk_2509E0ED0, (void (*)(uint64_t, uint64_t))sub_2380FCE60, (uint64_t)&unk_2568DA760);
}

uint64_t sub_2380F46D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_2380F46F0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F4714()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F478C;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F478C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2380F47F8()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F4834()
{
  uint64_t v0;
  void (*v1)(void *, _QWORD);
  void *v2;
  id v3;

  v1 = *(void (**)(void *, _QWORD))(v0 + 32);
  v2 = *(void **)(v0 + 72);
  if (v1)
  {
    v3 = v2;
    v1(v2, 0);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F4890()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F4A24(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 72) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  return swift_task_switch();
}

uint64_t sub_2380F4A40()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F4A64()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 16));
  *(_QWORD *)(v0 + 40) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F4ADC;
  v3 = *(_BYTE *)(v0 + 72);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F4ADC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 64) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F4B50()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F4B8C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 64);
  v2 = objc_msgSend(v1, sel_recommendations);
  sub_2380F25A0(0, &qword_2568DA5F8);
  v3 = sub_238102CE4();

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_2380F4C10()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F4D84(void *a1, char a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  uint64_t v10;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v8 = a1;
  v9 = a4;
  v10 = swift_task_alloc();
  v4[5] = v10;
  *(_QWORD *)v10 = v4;
  *(_QWORD *)(v10 + 8) = sub_2380F4E1C;
  *(_BYTE *)(v10 + 72) = a2;
  *(_QWORD *)(v10 + 16) = v8;
  *(_QWORD *)(v10 + 24) = v9;
  return swift_task_switch();
}

uint64_t sub_2380F4E1C()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v1 = *(void (***)(_QWORD, _QWORD))(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v2 = *(void **)(*v0 + 24);
  v6 = *v0;
  swift_task_dealloc();

  sub_2380F25A0(0, &qword_2568DA5F8);
  v4 = (void *)sub_238102CD8();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v4);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_2380F4EC8(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_2380F5D48(a1, a2, a3, a4, (uint64_t)&unk_2509E0EF8, (void (*)(uint64_t, uint64_t))sub_2380FCE60, (uint64_t)&unk_2568DA788);
}

uint64_t sub_2380F4EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_2380F4F04()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F4F28()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F4FA0;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F4FA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2380F500C()
{
  swift_release();
  return swift_task_switch();
}

void sub_2380F51A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_238102B4C();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_2380F51F8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 80) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  return swift_task_switch();
}

uint64_t sub_2380F5214()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[3];
  v0[4] = sub_2380F2998(MEMORY[0x24BEE4AF8]);
  v0[5] = *(_QWORD *)(v1 + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F5268()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 16));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F52E0;
  v3 = *(_BYTE *)(v0 + 80);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F52E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2380F534C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F5388()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char isUniquelyReferenced_nonNull_native;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v1 = objc_msgSend(*(id *)(v0 + 64), sel_ruleset);
  sub_2380F25A0(0, &qword_2568DA7A0);
  v2 = sub_238102CE4();

  v3 = sub_2380F5710(v2);
  swift_bridgeObjectRelease();
  if (v3 >> 62)
    goto LABEL_26;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    v33 = v3;
    v34 = v3 & 0xC000000000000001;
    v32 = v0;
    v6 = *(_QWORD **)(v0 + 32);
    while (1)
    {
      v9 = v34 ? (id)MEMORY[0x23B82BBE4](v5, v3) : *(id *)(v3 + 8 * v5 + 32);
      v10 = v9;
      v0 = v5 + 1;
      if (__OFADD__(v5, 1))
        break;
      v3 = v4;
      v11 = objc_msgSend(v9, sel_recommendationID);
      v12 = sub_238102CA8();
      v14 = v13;

      v15 = v10;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v18 = sub_2380FA0F8(v12, v14);
      v19 = v6[2];
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
        goto LABEL_24;
      v22 = v17;
      if (v6[3] >= v21)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v17 & 1) != 0)
            goto LABEL_4;
        }
        else
        {
          sub_2380FAEEC(&qword_2568DA710);
          if ((v22 & 1) != 0)
            goto LABEL_4;
        }
      }
      else
      {
        sub_2380FA870(v21, isUniquelyReferenced_nonNull_native, &qword_2568DA710);
        v23 = sub_2380FA0F8(v12, v14);
        if ((v22 & 1) != (v24 & 1))
          return sub_238102F30();
        v18 = v23;
        if ((v22 & 1) != 0)
        {
LABEL_4:
          v7 = v6[7];

          *(_QWORD *)(v7 + 8 * v18) = v15;
          goto LABEL_5;
        }
      }
      v6[(v18 >> 6) + 8] |= 1 << v18;
      v25 = (uint64_t *)(v6[6] + 16 * v18);
      *v25 = v12;
      v25[1] = v14;
      *(_QWORD *)(v6[7] + 8 * v18) = v15;
      v26 = v6[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_25;
      v6[2] = v28;
      swift_bridgeObjectRetain();
LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      ++v5;
      v4 = v3;
      v8 = v0 == v3;
      v3 = v33;
      if (v8)
      {
        v0 = v32;
        v29 = *(void **)(v32 + 64);
        swift_bridgeObjectRelease();

        return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v6);
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    swift_bridgeObjectRetain();
    v4 = sub_238102EA0();
    swift_bridgeObjectRelease();
  }
  v31 = *(void **)(v0 + 64);
  swift_bridgeObjectRelease();

  v6 = *(_QWORD **)(v0 + 32);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v6);
}

uint64_t sub_2380F5680()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2380F56C8()
{
  uint64_t v0;
  void *v1;
  unint64_t v2;

  v1 = *(void **)(v0 + 72);
  v2 = sub_2380F2998(MEMORY[0x24BEE4AF8]);

  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v2);
}

uint64_t sub_2380F5710(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_11;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_238102EA0())
  {
    for (i = 4; ; ++i)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B82BBE4](i - 4, a1) : *(id *)(a1 + 8 * i);
      v5 = v4;
      v6 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v7 = objc_msgSend(v4, sel_recommendationRules);
      sub_2380F25A0(0, &qword_2568DA640);
      v8 = sub_238102CE4();

      sub_2380EFEAC(v8);
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2380F59A8(void *a1, char a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  uint64_t v10;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v8 = a1;
  v9 = a4;
  v10 = swift_task_alloc();
  v4[5] = v10;
  *(_QWORD *)v10 = v4;
  *(_QWORD *)(v10 + 8) = sub_2380F5A40;
  *(_BYTE *)(v10 + 80) = a2;
  *(_QWORD *)(v10 + 16) = v8;
  *(_QWORD *)(v10 + 24) = v9;
  return swift_task_switch();
}

uint64_t sub_2380F5A40()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v1 = *(void (***)(_QWORD, _QWORD))(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v2 = *(void **)(*v0 + 24);
  v6 = *v0;
  swift_task_dealloc();

  sub_2380F25A0(0, &qword_2568DA640);
  v4 = (void *)sub_238102C78();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v4);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_2380F5AFC(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_2380F5D48(a1, a2, a3, a4, (uint64_t)&unk_2509E0F20, (void (*)(uint64_t, uint64_t))sub_2380FCE60, (uint64_t)&unk_2568DA7B0);
}

uint64_t sub_2380F5B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_2380F5B38()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F5B5C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F4FA0;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F5D2C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_2380F5D48(a1, a2, a3, a4, (uint64_t)&unk_2509E0F48, (void (*)(uint64_t, uint64_t))sub_2380F2550, (uint64_t)&unk_2568DA7C0);
}

uint64_t sub_2380F5D48(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t), uint64_t a7)
{
  void *v7;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  *(_QWORD *)(v17 + 32) = v7;
  *(_QWORD *)(v17 + 40) = a1;
  *(_BYTE *)(v17 + 48) = a2;
  *(_QWORD *)(v17 + 56) = a3;
  *(_QWORD *)(v17 + 64) = a4;
  v18 = v7;
  v19 = a1;
  a6(a3, a4);
  sub_2380F4460((uint64_t)v15, a7, v17);
  return swift_release();
}

uint64_t sub_2380F5E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_BYTE *)(v8 + 88) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_2380F5E68()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F5E8C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 24));
  *(_QWORD *)(v0 + 56) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F5F04;
  v3 = *(_BYTE *)(v0 + 88);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F5F04(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2380F5F70()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F5FAC()
{
  uint64_t v0;
  void (*v1)(_QWORD, _QWORD);

  v1 = *(void (**)(_QWORD, _QWORD))(v0 + 32);
  if (v1)
    v1(*(_QWORD *)(v0 + 72), 0);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F5FF8()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F6034()
{
  uint64_t v0;
  void (*v1)(_QWORD, void *);
  void *v2;
  id v3;

  v1 = *(void (**)(_QWORD, void *))(v0 + 32);
  v2 = *(void **)(v0 + 80);
  if (v1)
  {
    v3 = v2;
    v1(0, v2);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2380F61F0(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = a1;
  if (a1)
  {
    sub_2380F25A0(0, &qword_2568DA5F8);
    v5 = (void *)sub_238102CD8();
  }
  if (a2)
    v6 = sub_238102B4C();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

uint64_t sub_2380F6284(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 72) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  return swift_task_switch();
}

uint64_t sub_2380F62A0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F62C4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 16));
  *(_QWORD *)(v0 + 40) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F633C;
  v3 = *(_BYTE *)(v0 + 72);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F633C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 64) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F63B0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64));
}

uint64_t sub_2380F63E4()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F6420()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_2380F6590(void *a1, char a2, void *aBlock, void *a4)
{
  uint64_t v4;
  id v7;
  id v8;

  *(_BYTE *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  *(_QWORD *)(v4 + 32) = _Block_copy(aBlock);
  v7 = a1;
  v8 = a4;
  return swift_task_switch();
}

uint64_t sub_2380F65E8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers);
  return swift_task_switch();
}

uint64_t sub_2380F660C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;

  v1 = sub_2380F69F0(*(void **)(v0 + 16));
  *(_QWORD *)(v0 + 48) = v1;
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_2380F6684;
  v3 = *(_BYTE *)(v0 + 80);
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = v3;
  return swift_task_switch();
}

uint64_t sub_2380F6684(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F66F8()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F6734()
{
  uint64_t v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;

  v1 = *(void (***)(_QWORD, _QWORD))(v0 + 32);
  v2 = *(void **)(v0 + 16);

  sub_2380F25A0(0, &qword_2568DA5F8);
  v3 = (void *)sub_238102CD8();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v3);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F67C4()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F6800()
{
  uint64_t v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;

  v1 = *(void (***)(_QWORD, _QWORD))(v0 + 32);
  v2 = *(void **)(v0 + 16);

  sub_2380F25A0(0, &qword_2568DA5F8);
  v3 = (void *)sub_238102CD8();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v3);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id RecommendationsFetcher.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers;
  type metadata accessor for DataFetchers();
  v2 = swift_allocObject();
  v3 = v0;
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = sub_2380F2874(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v0[v1] = v2;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for RecommendationsFetcher();
  return objc_msgSendSuper2(&v5, sel_init);
}

id RecommendationsFetcher.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecommendationsFetcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2380F69F0(void *a1)
{
  uint64_t v1;
  id v3;
  id result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;

  v3 = objc_msgSend(a1, sel_aa_altDSID);
  if (v3 || (result = objc_msgSend(a1, sel_aa_personID), (v3 = result) != 0))
  {
    v5 = sub_238102CA8();
    v7 = v6;

    v8 = (uint64_t *)(v1 + 112);
    swift_beginAccess();
    v9 = *(_QWORD *)(v1 + 112);
    if (*(_QWORD *)(v9 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v10 = sub_2380FA0F8(v5, v7);
      if ((v11 & 1) != 0)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        return (id)v12;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    type metadata accessor for DataFetcher();
    swift_allocObject();
    v13 = a1;
    v12 = sub_2380FCA68(v13);

    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    *v8 = 0x8000000000000000;
    sub_2380EE7CC(v12, v5, v7, isUniquelyReferenced_nonNull_native);
    *v8 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return (id)v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2380F6B90()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_2380F6BB4(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F6BD0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_238102BE8();
  sub_2380F2560(&qword_2568DABE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFCA00], MEMORY[0x24BDFCA10]);
  swift_retain();
  sub_238102D20();
  return swift_task_switch();
}

uint64_t sub_2380F6C68()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_238102BD0();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F6CC8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 72);
  v2 = swift_allocObject();
  swift_weakInit();
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = v1;
  v7 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x24BDFC9D8] + MEMORY[0x24BDFC9D8]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  v5 = sub_2380F25A0(0, &qword_2568DAC00);
  *v4 = v0;
  v4[1] = sub_2380F6DCC;
  return v7(v0 + 16, 0xD000000000000014, 0x8000000238106230, &unk_2568DACD8, v3, v5);
}

uint64_t sub_2380F6DCC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_2380F6E48(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_2380F6E64()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_2380F6F2C;
    return sub_2380F7A3C(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_2380FC240();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2380F6F2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F6FA0(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F6FBC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_238102BE8();
  sub_2380F2560(&qword_2568DABE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFCA00], MEMORY[0x24BDFCA10]);
  swift_retain();
  sub_238102D20();
  return swift_task_switch();
}

uint64_t sub_2380F7054()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_238102BD0();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F70B8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t, uint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 72);
  v2 = swift_allocObject();
  swift_weakInit();
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = v1;
  v7 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x24BDFC9D8]
                                                                                            + MEMORY[0x24BDFC9D8]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  v5 = sub_2380F25A0(0, &qword_2568DACC8);
  *v4 = v0;
  v4[1] = sub_2380F71C0;
  return v7(v0 + 16, 0x6C75526863746566, 0xEC00000074657365, &unk_2568DACC0, v3, v5);
}

uint64_t sub_2380F71C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_2380F723C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2380F7248()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F7284(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_2380F72A0()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_2380F7368;
    return sub_2380F80F8(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_2380FC240();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2380F7368(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F73DC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD **)(v0 + 40);
  swift_release();
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F741C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F7450(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F746C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_238102BE8();
  sub_2380F2560(&qword_2568DABE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFCA00], MEMORY[0x24BDFCA10]);
  swift_retain();
  sub_238102D20();
  return swift_task_switch();
}

uint64_t sub_2380F7504()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_238102BD0();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F7564()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 72);
  v2 = swift_allocObject();
  swift_weakInit();
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = v1;
  v7 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x24BDFC9D8] + MEMORY[0x24BDFC9D8]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  v5 = sub_2380F25A0(0, &qword_2568DAC00);
  *v4 = v0;
  v4[1] = sub_2380F6DCC;
  return v7(v0 + 16, 0xD00000000000001DLL, 0x80000002381061F0, &unk_2568DABF8, v3, v5);
}

uint64_t sub_2380F7668(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_2380F7684()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_2380F6F2C;
    return sub_2380F88C4(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_2380FC240();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2380F774C(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2380F7768()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                   + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters);
  sub_238102BE8();
  sub_2380F2560(&qword_2568DABE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFCA00], MEMORY[0x24BDFCA10]);
  swift_retain();
  sub_238102D20();
  return swift_task_switch();
}

uint64_t sub_2380F7800()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_238102BD0();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2380F7860()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 72);
  v2 = swift_allocObject();
  swift_weakInit();
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = v1;
  v7 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *, uint64_t, uint64_t))((int)*MEMORY[0x24BDFC9D8] + MEMORY[0x24BDFC9D8]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA608);
  *v4 = v0;
  v4[1] = sub_2380F6DCC;
  return v7(v0 + 16, 0xD00000000000001ALL, 0x8000000238106210, &unk_2568DACB0, v3, v5);
}

uint64_t sub_2380F7958(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_2380F7974()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _BYTE *v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_2380F6F2C;
    return sub_2380F9150(*(_BYTE *)(v0 + 88));
  }
  else
  {
    sub_2380FC240();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2380F7A3C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 184) = v1;
  *(_BYTE *)(v2 + 288) = a1;
  v3 = sub_238102BC4();
  *(_QWORD *)(v2 + 192) = v3;
  *(_QWORD *)(v2 + 200) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABD0);
  *(_QWORD *)(v2 + 216) = swift_task_alloc();
  *(_QWORD *)(v2 + 224) = swift_task_alloc();
  *(_QWORD *)(v2 + 232) = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA9A0);
  *(_QWORD *)(v2 + 240) = v4;
  *(_QWORD *)(v2 + 248) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2380F7B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  _QWORD *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations;
  *(_QWORD *)(v0 + 272) = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations;
  v6 = v4 + v5;
  swift_beginAccess();
  v7 = &qword_2568DABD0;
  sub_2380FC30C(v6, v1, &qword_2568DABD0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v8 = (uint64_t *)(v0 + 232);
LABEL_5:
    sub_2380FC56C(*v8, v7);
    if (qword_2568DA2C8 != -1)
      swift_once();
    v15 = sub_238102C0C();
    __swift_project_value_buffer(v15, (uint64_t)qword_2568DB728);
    v16 = sub_238102BF4();
    v17 = sub_238102D8C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2380DF000, v16, v17, "Fetching fresh recommendations", v18, 2u);
      MEMORY[0x23B82C364](v18, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 184);

    v20 = *(void **)(v19 + 112);
    *(_QWORD *)(v0 + 56) = v0 + 168;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_2380F7F70;
    v21 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v22 = (_QWORD *)(v0 + 80);
    v22[1] = 0x40000000;
    v22[2] = sub_2380F80F4;
    v22[3] = &block_descriptor_33;
    v22[4] = v21;
    objc_msgSend(v20, sel_fetchRecommendationsWithCompletion_, v22);
    return swift_continuation_await();
  }
  v8 = (uint64_t *)(v0 + 264);
  v9 = *(double **)(v0 + 264);
  v11 = *(_QWORD *)(v0 + 200);
  v10 = *(_QWORD *)(v0 + 208);
  v12 = *(_QWORD *)(v0 + 192);
  v7 = &qword_2568DA9A0;
  sub_2380FC2C8(*(_QWORD *)(v0 + 232), (uint64_t)v9, &qword_2568DA9A0);
  sub_238102BB8();
  sub_238102BAC();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9 || (*(_BYTE *)(v0 + 288) & 1) != 0)
    goto LABEL_5;
  if (qword_2568DA2C8 != -1)
    swift_once();
  v25 = *(_QWORD *)(v0 + 256);
  v24 = *(_QWORD *)(v0 + 264);
  v26 = sub_238102C0C();
  __swift_project_value_buffer(v26, (uint64_t)qword_2568DB728);
  sub_2380FC30C(v24, v25, &qword_2568DA9A0);
  v27 = sub_238102BF4();
  v28 = sub_238102D8C();
  v29 = os_log_type_enabled(v27, v28);
  v30 = *(_QWORD *)(v0 + 256);
  if (v29)
  {
    v31 = *(_QWORD *)(v0 + 240);
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    v34 = *(void **)(v30 + *(int *)(v31 + 32));
    *(_QWORD *)(v0 + 176) = v34;
    v35 = v34;
    sub_238102E10();
    *v33 = v34;
    sub_2380FC56C(v30, &qword_2568DA9A0);
    _os_log_impl(&dword_2380DF000, v27, v28, "Reusing cached recommendations %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA600);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v33, -1, -1);
    MEMORY[0x23B82C364](v32, -1, -1);
  }
  else
  {
    sub_2380FC56C(*(_QWORD *)(v0 + 256), &qword_2568DA9A0);
  }
  v36 = *(_QWORD *)(v0 + 264);
  v37 = *(_QWORD *)(v0 + 240);

  v38 = *(id *)(v36 + *(int *)(v37 + 32));
  sub_2380FC56C(v36, &qword_2568DA9A0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v38);
}

uint64_t sub_2380F7F70()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 280) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2380F7FD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD **)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 184) + *(_QWORD *)(v0 + 272);
  v6 = *(void **)(v0 + 168);
  *(_QWORD *)((char *)v3 + *(int *)(v1 + 32)) = v6;
  *v3 = 0x40F5180000000000;
  v7 = v6;
  sub_238102BB8();
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  sub_2380FC2C8((uint64_t)v3, v4, &qword_2568DABD0);
  swift_beginAccess();
  sub_2380FC284(v4, v5, &qword_2568DABD0);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

uint64_t sub_2380F80F8(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 184) = v1;
  *(_BYTE *)(v2 + 288) = a1;
  v3 = sub_238102BC4();
  *(_QWORD *)(v2 + 192) = v3;
  *(_QWORD *)(v2 + 200) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABE0);
  *(_QWORD *)(v2 + 216) = swift_task_alloc();
  *(_QWORD *)(v2 + 224) = swift_task_alloc();
  *(_QWORD *)(v2 + 232) = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2568DA9C0);
  *(_QWORD *)(v2 + 240) = v4;
  *(_QWORD *)(v2 + 248) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2380F81D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  _QWORD *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset;
  *(_QWORD *)(v0 + 272) = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset;
  v6 = v4 + v5;
  swift_beginAccess();
  v7 = &qword_2568DABE0;
  sub_2380FC30C(v6, v1, &qword_2568DABE0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v8 = (uint64_t *)(v0 + 232);
LABEL_5:
    sub_2380FC56C(*v8, v7);
    if (qword_2568DA2C8 != -1)
      swift_once();
    v15 = sub_238102C0C();
    __swift_project_value_buffer(v15, (uint64_t)qword_2568DB728);
    v16 = sub_238102BF4();
    v17 = sub_238102D8C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2380DF000, v16, v17, "Fetching fresh rulesets", v18, 2u);
      MEMORY[0x23B82C364](v18, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 184);

    v20 = *(void **)(v19 + 112);
    *(_QWORD *)(v0 + 56) = v0 + 168;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_2380F862C;
    v21 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v22 = (_QWORD *)(v0 + 80);
    v22[1] = 0x40000000;
    v22[2] = sub_2380F80F4;
    v22[3] = &block_descriptor_31;
    v22[4] = v21;
    objc_msgSend(v20, sel_fetchRecommendationsRulesetWithCompletion_, v22);
    return swift_continuation_await();
  }
  v8 = (uint64_t *)(v0 + 264);
  v9 = *(double **)(v0 + 264);
  v11 = *(_QWORD *)(v0 + 200);
  v10 = *(_QWORD *)(v0 + 208);
  v12 = *(_QWORD *)(v0 + 192);
  v7 = qword_2568DA9C0;
  sub_2380FC2C8(*(_QWORD *)(v0 + 232), (uint64_t)v9, qword_2568DA9C0);
  sub_238102BB8();
  sub_238102BAC();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9 || (*(_BYTE *)(v0 + 288) & 1) != 0)
    goto LABEL_5;
  if (qword_2568DA2C8 != -1)
    swift_once();
  v25 = *(_QWORD *)(v0 + 256);
  v24 = *(_QWORD *)(v0 + 264);
  v26 = sub_238102C0C();
  __swift_project_value_buffer(v26, (uint64_t)qword_2568DB728);
  sub_2380FC30C(v24, v25, qword_2568DA9C0);
  v27 = sub_238102BF4();
  v28 = sub_238102D8C();
  v29 = os_log_type_enabled(v27, v28);
  v30 = *(_QWORD *)(v0 + 256);
  if (v29)
  {
    v31 = *(_QWORD *)(v0 + 240);
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    v34 = *(void **)(v30 + *(int *)(v31 + 32));
    *(_QWORD *)(v0 + 176) = v34;
    v35 = v34;
    sub_238102E10();
    *v33 = v34;
    sub_2380FC56C(v30, qword_2568DA9C0);
    _os_log_impl(&dword_2380DF000, v27, v28, "Reusing cached rulesets %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA600);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v33, -1, -1);
    MEMORY[0x23B82C364](v32, -1, -1);
  }
  else
  {
    sub_2380FC56C(*(_QWORD *)(v0 + 256), qword_2568DA9C0);
  }
  v36 = *(_QWORD *)(v0 + 264);
  v37 = *(_QWORD *)(v0 + 240);

  v38 = *(id *)(v36 + *(int *)(v37 + 32));
  sub_2380FC56C(v36, qword_2568DA9C0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v38);
}

uint64_t sub_2380F862C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 280) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2380F868C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD **)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 184) + *(_QWORD *)(v0 + 272);
  v6 = *(void **)(v0 + 168);
  *(_QWORD *)((char *)v3 + *(int *)(v1 + 32)) = v6;
  *v3 = 0x40F5180000000000;
  v7 = v6;
  sub_238102BB8();
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  sub_2380FC2C8((uint64_t)v3, v4, &qword_2568DABE0);
  swift_beginAccess();
  sub_2380FC284(v4, v5, &qword_2568DABE0);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

uint64_t sub_2380F87B0()
{
  uint64_t v0;

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F8838(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABD8);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2380F88C4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 184) = v1;
  *(_BYTE *)(v2 + 304) = a1;
  v3 = sub_238102BC4();
  *(_QWORD *)(v2 + 192) = v3;
  *(_QWORD *)(v2 + 200) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABD0);
  *(_QWORD *)(v2 + 216) = swift_task_alloc();
  *(_QWORD *)(v2 + 224) = swift_task_alloc();
  *(_QWORD *)(v2 + 232) = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA9A0);
  *(_QWORD *)(v2 + 240) = v4;
  *(_QWORD *)(v2 + 248) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2380F89A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  _QWORD *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations;
  *(_QWORD *)(v0 + 272) = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations;
  v6 = v4 + v5;
  swift_beginAccess();
  v7 = &qword_2568DABD0;
  sub_2380FC30C(v6, v1, &qword_2568DABD0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v8 = (uint64_t *)(v0 + 232);
LABEL_5:
    sub_2380FC56C(*v8, v7);
    v15 = swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v15;
    *(_QWORD *)v15 = v0;
    *(_QWORD *)(v15 + 8) = sub_2380F8D14;
    *(_QWORD *)(v15 + 24) = *(_QWORD *)(v0 + 184);
    *(_BYTE *)(v15 + 72) = 0;
    return swift_task_switch();
  }
  v8 = (uint64_t *)(v0 + 264);
  v9 = *(double **)(v0 + 264);
  v11 = *(_QWORD *)(v0 + 200);
  v10 = *(_QWORD *)(v0 + 208);
  v12 = *(_QWORD *)(v0 + 192);
  v7 = &qword_2568DA9A0;
  sub_2380FC2C8(*(_QWORD *)(v0 + 232), (uint64_t)v9, &qword_2568DA9A0);
  sub_238102BB8();
  sub_238102BAC();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (v14 >= *v9 || (*(_BYTE *)(v0 + 304) & 1) != 0)
    goto LABEL_5;
  if (qword_2568DA2C8 != -1)
    swift_once();
  v18 = *(_QWORD *)(v0 + 256);
  v17 = *(_QWORD *)(v0 + 264);
  v19 = sub_238102C0C();
  __swift_project_value_buffer(v19, (uint64_t)qword_2568DB728);
  sub_2380FC30C(v17, v18, &qword_2568DA9A0);
  v20 = sub_238102BF4();
  v21 = sub_238102D8C();
  v22 = os_log_type_enabled(v20, v21);
  v23 = *(_QWORD *)(v0 + 256);
  if (v22)
  {
    v24 = *(_QWORD *)(v0 + 240);
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v25 = 138412290;
    v27 = *(void **)(v23 + *(int *)(v24 + 32));
    *(_QWORD *)(v0 + 176) = v27;
    v28 = v27;
    sub_238102E10();
    *v26 = v27;
    sub_2380FC56C(v23, &qword_2568DA9A0);
    _os_log_impl(&dword_2380DF000, v20, v21, "Reusing cached completed recommendations %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA600);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v26, -1, -1);
    MEMORY[0x23B82C364](v25, -1, -1);
  }
  else
  {
    sub_2380FC56C(*(_QWORD *)(v0 + 256), &qword_2568DA9A0);
  }
  v29 = *(_QWORD *)(v0 + 264);
  v30 = *(_QWORD *)(v0 + 240);

  v31 = *(id *)(v29 + *(int *)(v30 + 32));
  sub_2380FC56C(v29, &qword_2568DA9A0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v31);
}

uint64_t sub_2380F8D14(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 288) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_2380F8DD8()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_2568DA2C8 != -1)
    swift_once();
  v1 = sub_238102C0C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2568DB728);
  v2 = sub_238102BF4();
  v3 = sub_238102D8C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2380DF000, v2, v3, "Fetching fresh completed recommendations", v4, 2u);
    MEMORY[0x23B82C364](v4, -1, -1);
  }
  v5 = v0[36];
  v6 = v0[23];

  v7 = *(void **)(v6 + 112);
  v0[7] = v0 + 21;
  v0[2] = v0;
  v0[3] = sub_2380F8F34;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v9 = v0 + 10;
  v9[1] = 0x40000000;
  v9[2] = sub_2380F80F4;
  v9[3] = &block_descriptor_0;
  v9[4] = v8;
  objc_msgSend(v7, sel_fetchCompletedRecommendations_completion_, v5, v9);
  return swift_continuation_await();
}

uint64_t sub_2380F8F34()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 296) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2380F8F94()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + 288);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD **)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 184) + *(_QWORD *)(v0 + 272);
  v7 = *(void **)(v0 + 168);
  *(_QWORD *)((char *)v4 + *(int *)(v2 + 32)) = v7;
  *v4 = 0x40F5180000000000;
  v8 = v7;
  sub_238102BB8();

  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  sub_2380FC2C8((uint64_t)v4, v5, &qword_2568DABD0);
  swift_beginAccess();
  sub_2380FC284(v5, v6, &qword_2568DABD0);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v8);
}

uint64_t sub_2380F90C8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 288);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F9150(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 56) = v1;
  *(_BYTE *)(v2 + 144) = a1;
  v3 = sub_238102BC4();
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 72) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 80) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABB0);
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA9B0);
  *(_QWORD *)(v2 + 96) = v4;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 112) = swift_task_alloc();
  *(_QWORD *)(v2 + 120) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2380F9214()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 56)
     + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations;
  swift_beginAccess();
  v5 = &qword_2568DABB0;
  sub_2380FC30C(v4, v1, &qword_2568DABB0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v6 = (uint64_t *)(v0 + 88);
LABEL_5:
    sub_2380FC56C(*v6, v5);
    sub_2380F2560(&qword_2568DABB8, (uint64_t (*)(uint64_t))type metadata accessor for DataFetcher, (uint64_t)&unk_238104F30);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA608);
    *v13 = v0;
    v13[1] = sub_2380F960C;
    return sub_238102F18();
  }
  v6 = (uint64_t *)(v0 + 120);
  v7 = *(double **)(v0 + 120);
  v9 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 64);
  v5 = &qword_2568DA9B0;
  sub_2380FC2C8(*(_QWORD *)(v0 + 88), (uint64_t)v7, &qword_2568DA9B0);
  sub_238102BB8();
  sub_238102BAC();
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  if (v12 >= *v7 || (*(_BYTE *)(v0 + 144) & 1) != 0)
    goto LABEL_5;
  if (qword_2568DA2C8 != -1)
    swift_once();
  v16 = *(_QWORD *)(v0 + 112);
  v15 = *(_QWORD *)(v0 + 120);
  v17 = sub_238102C0C();
  __swift_project_value_buffer(v17, (uint64_t)qword_2568DB728);
  sub_2380FC30C(v15, v16, &qword_2568DA9B0);
  v18 = sub_238102BF4();
  v19 = sub_238102D8C();
  v20 = os_log_type_enabled(v18, v19);
  v21 = *(_QWORD *)(v0 + 112);
  if (v20)
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v31 = v30;
    *(_DWORD *)v22 = 136315138;
    v23 = sub_2380F25A0(0, &qword_2568DA5F8);
    v24 = swift_bridgeObjectRetain();
    v25 = MEMORY[0x23B82BA64](v24, v23);
    v27 = v26;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_2380FEAFC(v25, v27, &v31);
    sub_238102E10();
    swift_bridgeObjectRelease();
    sub_2380FC56C(v21, &qword_2568DA9B0);
    _os_log_impl(&dword_2380DF000, v18, v19, "Reusing cached client recommendations %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v30, -1, -1);
    MEMORY[0x23B82C364](v22, -1, -1);
  }
  else
  {
    sub_2380FC56C(*(_QWORD *)(v0 + 112), &qword_2568DA9B0);
  }

  v28 = *(_QWORD *)(v0 + 120);
  v29 = *(_QWORD *)(v28 + *(int *)(*(_QWORD *)(v0 + 96) + 32));
  swift_bridgeObjectRetain();
  sub_2380FC56C(v28, &qword_2568DA9B0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v29);
}

uint64_t sub_2380F960C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2380F9670()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2380F96D0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380F9728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABC0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568DA2C8 != -1)
    swift_once();
  v8 = sub_238102C0C();
  __swift_project_value_buffer(v8, (uint64_t)qword_2568DB728);
  v9 = sub_238102BF4();
  v10 = sub_238102D8C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2380DF000, v9, v10, "Fetching fresh client recommendations", v11, 2u);
    MEMORY[0x23B82C364](v11, -1, -1);
  }

  v12 = MEMORY[0x24BEE4AF8];
  v13 = sub_2380F298C(MEMORY[0x24BEE4AF8]);
  v14 = sub_2380F298C(v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v16 = (v6 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v15, v7, v4);
  *(_QWORD *)(v17 + v16) = a2;
  swift_retain();
  sub_2380FD440(MEMORY[0x24BEE4B08], v13, v14, (uint64_t)sub_2380FC1DC, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2380F9914(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
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
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABB0);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&v26 - v10);
  if (a2)
  {
    if (qword_2568DA2C8 != -1)
      swift_once();
    v12 = sub_238102C0C();
    __swift_project_value_buffer(v12, (uint64_t)qword_2568DB728);
    v13 = a2;
    v14 = a2;
    v15 = sub_238102BF4();
    v16 = sub_238102D98();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      v19 = a2;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      v27 = v20;
      sub_238102E10();
      *v18 = v20;

      _os_log_impl(&dword_2380DF000, v15, v16, "Error fetching client recommendations: %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA600);
      swift_arrayDestroy();
      MEMORY[0x23B82C364](v18, -1, -1);
      MEMORY[0x23B82C364](v17, -1, -1);
    }
    else
    {

    }
    sub_2380FC240();
    v24 = swift_allocError();
    *v25 = 1;
    v27 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABC0);
    return sub_238102D2C();
  }
  else
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA9B0);
    *(_QWORD *)((char *)v11 + *(int *)(v21 + 32)) = a1;
    *v11 = 0x40F5180000000000;
    swift_bridgeObjectRetain();
    sub_238102BB8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v11, 0, 1, v21);
    sub_2380FC2C8((uint64_t)v11, (uint64_t)v9, &qword_2568DABB0);
    v22 = a4
        + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations;
    swift_beginAccess();
    sub_2380FC284((uint64_t)v9, v22, &qword_2568DABB0);
    swift_endAccess();
    v27 = a1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABC0);
    return sub_238102D38();
  }
}

uint64_t sub_2380F9C38()
{
  uint64_t v0;

  sub_2380FC56C(v0 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations, &qword_2568DABD0);
  sub_2380FC56C(v0+ OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations, &qword_2568DABB0);
  sub_2380FC56C(v0+ OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations, &qword_2568DABD0);
  sub_2380FC56C(v0 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset, &qword_2568DABE0);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_2380F9CDC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2380F9CE8(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2380F9CFC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2380FCE70;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_2380F9D78()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2380FCE70;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_2380F9DF0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2380F9E54;
  return v6(a1);
}

uint64_t sub_2380F9E54()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2380F9EA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2380FCE70;
  return v6();
}

uint64_t sub_2380F9EF4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2380FCE70;
  return v7();
}

uint64_t sub_2380F9F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_238102D50();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_238102D44();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2380FC56C(a1, &qword_2568DA740);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_238102D20();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2380FA094(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2380FCE74;
  return v6(a1);
}

unint64_t sub_2380FA0F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_238102F84();
  sub_238102CB4();
  v4 = sub_238102F9C();
  return sub_2380FA15C(a1, a2, v4);
}

unint64_t sub_2380FA15C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_238102F0C() & 1) == 0)
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
      while (!v14 && (sub_238102F0C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2380FA23C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA700);
  v36 = a2;
  v6 = sub_238102EB8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_238102F84();
    sub_238102CB4();
    result = sub_238102F9C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2380FA550(uint64_t a1, char a2)
{
  return sub_2380FA870(a1, a2, &qword_2568DA6E0);
}

uint64_t sub_2380FA55C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA708);
  v36 = a2;
  v6 = sub_238102EB8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_238102F84();
    sub_238102CB4();
    result = sub_238102F9C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2380FA870(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_238102EB8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_238102F84();
    sub_238102CB4();
    result = sub_238102F9C();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

void *sub_2380FAB78()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA700);
  v2 = *v0;
  v3 = sub_238102EAC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2380FAD2C()
{
  return sub_2380FAEEC(&qword_2568DA6E0);
}

void *sub_2380FAD38()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA708);
  v2 = *v0;
  v3 = sub_238102EAC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2380FAEEC(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_238102EAC();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
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
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t (*sub_2380FB094(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2380FB16C(v6, a2, a3);
  return sub_2380FB0E8;
}

uint64_t (*sub_2380FB0EC(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2380FB1E0(v6, a2, a3);
  return sub_2380FB0E8;
}

void sub_2380FB140(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2380FB16C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B82BBE4](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_2380FB1D8;
  }
  __break(1u);
  return result;
}

void sub_2380FB1D8(id *a1)
{

}

uint64_t (*sub_2380FB1E0(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B82BBE4](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_2380FCEB0;
  }
  __break(1u);
  return result;
}

uint64_t sub_2380FB250()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2380FCE70;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_2380FB2CC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2380FCE70;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t type metadata accessor for DataFetchers()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for RecommendationsFetcher()
{
  return objc_opt_self();
}

unint64_t sub_2380FB388()
{
  unint64_t result;

  result = qword_2568DA7D8;
  if (!qword_2568DA7D8)
  {
    result = MEMORY[0x23B82C2D4](&protocol conformance descriptor for RecommendationsFetcher.FetchError, &type metadata for RecommendationsFetcher.FetchError);
    atomic_store(result, (unint64_t *)&qword_2568DA7D8);
  }
  return result;
}

uint64_t method lookup function for RecommendationsFetcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RecommendationsFetcher.refreshCache(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of RecommendationsFetcher.refreshCache(for:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchServerRecommendations(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchServerRecommendationsAsync(for:shouldIgnoreCache:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x70);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2380FCE6C;
  return v9(a1, a2);
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchRulesets(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchRulesetsAsync(for:shouldIgnoreCache:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x80);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2380FCE6C;
  return v9(a1, a2);
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchCompletedRecommendations(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchClientRecommendations(for:shouldIgnoreCache:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of RecommendationsFetcher.fetchClientRecommendationsAsync(for:shouldIgnoreCache:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x98);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2380FB600;
  return v9(a1, a2);
}

uint64_t sub_2380FB600(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t storeEnumTagSinglePayload for RecommendationsFetcher.FetchError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2380FB69C + 4 * byte_238104D95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2380FB6D0 + 4 * byte_238104D90[v4]))();
}

uint64_t sub_2380FB6D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380FB6D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2380FB6E0);
  return result;
}

uint64_t sub_2380FB6EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2380FB6F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2380FB6F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380FB700(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecommendationsFetcher.FetchError()
{
  return &type metadata for RecommendationsFetcher.FetchError;
}

uint64_t sub_2380FB71C()
{
  return type metadata accessor for DataFetcher();
}

uint64_t type metadata accessor for DataFetcher()
{
  uint64_t result;

  result = qword_2568DA960;
  if (!qword_2568DA960)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2380FB760()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2380FB858(319, &qword_2568DA998, &qword_2568DA9A0);
  if (v0 <= 0x3F)
  {
    sub_2380FB858(319, &qword_2568DA9A8, &qword_2568DA9B0);
    if (v1 <= 0x3F)
    {
      sub_2380FB858(319, &qword_2568DA9B8, qword_2568DA9C0);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_2380FB858(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_238102E04();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_2380FB8A4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2380FB8AC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_238102BC4();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2380FB944(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_238102BC4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  if ((v12 | v8) > 7
    || ((*(_DWORD *)(v11 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((v9 + ((v8 + 8) & ~v8) + v12) & ~v12) + *(_QWORD *)(v11 + 64) > 0x18)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + (((v12 | v8) & 0xF8 ^ 0x1F8) & ((v12 | v8) + 16)));
    swift_retain();
  }
  else
  {
    v16 = ~v8;
    *a1 = *a2;
    v17 = (char *)a1 + v8;
    v18 = (char *)a2 + v8;
    v19 = (unint64_t)(v17 + 8) & v16;
    v20 = (unint64_t)(v18 + 8) & v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v19, v20, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))((v19 + v9 + v12) & ~v12, (v20 + v9 + v12) & ~v12, v10);
  }
  return a1;
}

uint64_t sub_2380FBA68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = sub_238102BC4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v6 + *(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_2380FBADC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_238102BC4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 16))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

_QWORD *sub_2380FBB80(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_238102BC4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 24))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

_QWORD *sub_2380FBC24(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_238102BC4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 32))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

_QWORD *sub_2380FBCC8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = sub_238102BC4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v9, v10, v6);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 40))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v11 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

uint64_t sub_2380FBD6C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  uint64_t v23;

  v6 = sub_238102BC4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8)
    v12 = *(_DWORD *)(v7 + 84);
  else
    v12 = *(_DWORD *)(v10 + 84);
  if (!a2)
    return 0;
  v13 = v6;
  v14 = *(unsigned __int8 *)(v7 + 80);
  v15 = *(_QWORD *)(v7 + 64);
  v16 = *(unsigned __int8 *)(v10 + 80);
  if (a2 <= v12)
    goto LABEL_23;
  v17 = ((v15 + ((v14 + 8) & ~v14) + v16) & ~v16) + *(_QWORD *)(v10 + 64);
  v18 = 8 * v17;
  if (v17 <= 3)
  {
    v20 = ((a2 - v12 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v20))
    {
      v19 = *(_DWORD *)(a1 + v17);
      if (!v19)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v20 > 0xFF)
    {
      v19 = *(unsigned __int16 *)(a1 + v17);
      if (!*(_WORD *)(a1 + v17))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v20 < 2)
    {
LABEL_23:
      if (v12)
      {
        v23 = (a1 + v14 + 8) & ~v14;
        if (v8 >= v11)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v23, v8, v13);
        else
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))((v23 + v15 + v16) & ~v16, *(unsigned int *)(v10 + 84), v9);
      }
      return 0;
    }
  }
  v19 = *(unsigned __int8 *)(a1 + v17);
  if (!*(_BYTE *)(a1 + v17))
    goto LABEL_23;
LABEL_14:
  v21 = (v19 - 1) << v18;
  if (v17 > 3)
    v21 = 0;
  if ((_DWORD)v17)
  {
    if (v17 <= 3)
      v22 = ((v15 + ((v14 + 8) & ~(_DWORD)v14) + v16) & ~(_DWORD)v16) + *(_DWORD *)(v10 + 64);
    else
      v22 = 4;
    __asm { BR              X12 }
  }
  return v12 + v21 + 1;
}

void sub_2380FBF1C(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v8 = *(_QWORD *)(sub_238102BC4() - 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84))
    v10 = *(_DWORD *)(v8 + 84);
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(unsigned __int8 *)(v8 + 80);
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = ((*(_QWORD *)(v8 + 64) + ((v11 + 8) & ~v11) + v12) & ~v12) + *(_QWORD *)(v9 + 64);
  if (a3 <= v10)
  {
    v14 = 0;
  }
  else if (v13 <= 3)
  {
    v16 = ((a3 - v10 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v16))
    {
      v14 = 4u;
    }
    else if (v16 >= 0x100)
    {
      v14 = 2;
    }
    else
    {
      v14 = v16 > 1;
    }
  }
  else
  {
    v14 = 1u;
  }
  if (v10 < a2)
  {
    v15 = ~v10 + a2;
    if (v13 < 4)
    {
      if ((_DWORD)v13)
      {
        v17 = v15 & ~(-1 << (8 * v13));
        bzero(a1, ((*(_QWORD *)(v8 + 64) + ((v11 + 8) & ~v11) + v12) & ~v12) + *(_QWORD *)(v9 + 64));
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, ((*(_QWORD *)(v8 + 64) + ((v11 + 8) & ~v11) + v12) & ~v12) + *(_QWORD *)(v9 + 64));
      *(_DWORD *)a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X1 }
}

uint64_t type metadata accessor for CacheBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CacheBox);
}

uint64_t sub_2380FC15C(uint64_t a1)
{
  uint64_t v1;

  return sub_2380F9728(a1, v1);
}

uint64_t sub_2380FC164()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DABC0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2380FC1DC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568DABC0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_2380F9914(a1, a2, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_2380FC240()
{
  unint64_t result;

  result = qword_2568DABC8;
  if (!qword_2568DABC8)
  {
    result = MEMORY[0x23B82C2D4](&protocol conformance descriptor for RecommendationsFetcher.FetchError, &type metadata for RecommendationsFetcher.FetchError);
    atomic_store(result, (unint64_t *)&qword_2568DABC8);
  }
  return result;
}

uint64_t sub_2380FC284(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2380FC2C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2380FC30C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2380FC350()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2380FC374(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_2380FCE70;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_2380FC3EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = *(void **)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v5 = *(void **)(v0 + 32);
  v4 = *(void **)(v0 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2380FCE70;
  return ((uint64_t (*)(void *, char, void *, void *))((char *)&dword_2568DAC08 + dword_2568DAC08))(v2, v3, v5, v4);
}

uint64_t sub_2380FC46C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2380FCE70;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2568DAC18 + dword_2568DAC18))(v2, v3, v4);
}

uint64_t sub_2380FC4E8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2380FCE70;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2568DAC28 + dword_2568DAC28))(a1, v4, v5, v6);
}

uint64_t sub_2380FC56C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2380FC5A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2380FCE70;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2568DAC38 + dword_2568DAC38))(a1, v4);
}

uint64_t sub_2380FC61C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_2380FC694;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = v2;
  *(_OWORD *)(v5 + 16) = v6;
  return swift_task_switch();
}

uint64_t sub_2380FC694()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_2380FC6DC(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_2380F61F0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_2380FC6EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = *(void **)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v5 = *(void **)(v0 + 32);
  v4 = *(void **)(v0 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2380FCE70;
  return ((uint64_t (*)(void *, char, void *, void *))((char *)&dword_2568DAC58 + dword_2568DAC58))(v2, v3, v5, v4);
}

uint64_t sub_2380FC774()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2380FC798(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2380F51A0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t objectdestroy_47Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_2380FC7E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = *(void **)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v5 = *(void **)(v0 + 32);
  v4 = *(void **)(v0 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2380FCE70;
  return ((uint64_t (*)(void *, char, void *, void *))((char *)&dword_2568DAC80 + dword_2568DAC80))(v2, v3, v5, v4);
}

uint64_t objectdestroy_51Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  if (*(_QWORD *)(v0 + 56))
    swift_release();
  return swift_deallocObject();
}

void sub_2380FC8E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_2380F464C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_2380FC8E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2380FC90C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_2380FCE70;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_2380FC980(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_2380FC694;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_2380FC9F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_2380FCE70;
  *(_BYTE *)(v6 + 88) = v5;
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_2380FCA68(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v2 = v1;
  swift_defaultActor_initialize();
  v4 = v1 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRecommendations;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA9A0);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  v7 = v2
     + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedClientRecommendations;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA9B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v6(v2+ OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedCompletedRecommendations, 1, 1, v5);
  v9 = v2 + OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_cachedRuleset;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2568DA9C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = OBJC_IVAR____TtC19CloudRecommendationP33_AFF0F38A07FEA7D3E0443E6C0DD7FA6B11DataFetcher_taskLimiters;
  sub_238102BE8();
  *(_QWORD *)(v2 + v11) = sub_238102BDC();
  *(_QWORD *)(v2 + 112) = objc_msgSend(objc_allocWithZone((Class)CERecommendationDataController), sel_initWithAccount_, a1);
  v12 = objc_allocWithZone((Class)type metadata accessor for ClientRecommendationsRepository());
  *(_QWORD *)(v2 + 120) = sub_23810025C(a1);
  return v2;
}

uint64_t sub_2380FCBB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2380FCBDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2380FCE70;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2568DACE0 + dword_2568DACE0))(a1, v4);
}

uint64_t sub_2380FCC4C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2380FCC78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2380FCE70;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2380FCCE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2380FCE70;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2380FCD48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2380FCE70;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2380FCDB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_2380FCE70;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B82C280](a1, v6, a5);
}

void (*sub_2380FCEB4(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_2380FF4D0(v6, a2, a3);
  return sub_2380FCF20;
}

void sub_2380FCF20(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

id sub_2380FCF58(char a1)
{
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t inited;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  char v18;

  v18 = a1 & 1;
  sub_2380F2CE8();
  v1 = sub_238102EF4();
  if (v1)
  {
    v2 = (void *)v1;
  }
  else
  {
    v2 = (void *)swift_allocError();
    *v3 = v18;
  }
  v4 = (void *)sub_238102B4C();

  v5 = objc_msgSend(v4, sel_domain);
  sub_238102CA8();

  v6 = objc_msgSend(v4, sel_code);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA6C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_238104BB0;
  *(_QWORD *)(inited + 32) = sub_238102CA8();
  *(_QWORD *)(inited + 40) = v8;
  v9 = objc_msgSend(v4, sel_localizedDescription);
  v10 = sub_238102CA8();
  v12 = v11;

  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v10;
  *(_QWORD *)(inited + 56) = v12;
  sub_2380F274C(inited);
  v13 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v14 = (void *)sub_238102C84();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_238102C78();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, v6, v15);

  return v16;
}

id ClientRecommendationsRepository.__allocating_init(account:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_23810025C(a1);

  return v4;
}

uint64_t sub_2380FD178()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2380FD1BC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_2380FD204())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2380FD248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_238102DD4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_238102DBC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_238102C48();
  MEMORY[0x24BDAC7A8](v6);
  sub_2380F25A0(0, &qword_2568DA620);
  sub_238102C3C();
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_2380F2560(&qword_2568DA628, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA630);
  sub_2381006D0(&qword_2568DA638, &qword_2568DA630);
  sub_238102E28();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_238102DEC();
  qword_2568DAD30 = result;
  return result;
}

id ClientRecommendationsRepository.init(account:)(void *a1)
{
  id v2;

  v2 = sub_23810025C(a1);

  return v2;
}

uint64_t sub_2380FD440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v11 = sub_238102C24();
  v23 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_238102C48();
  v14 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2568DA2D8 != -1)
    swift_once();
  v21 = qword_2568DAD30;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v5;
  v17[3] = a1;
  v17[4] = a2;
  v17[5] = a3;
  v17[6] = a4;
  v17[7] = a5;
  aBlock[4] = sub_2381003E0;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2380F01A8;
  aBlock[3] = &block_descriptor_1;
  v18 = _Block_copy(aBlock);
  v19 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_238102C30();
  v24 = MEMORY[0x24BEE4AF8];
  sub_2380F2560(&qword_2568DA568, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA570);
  sub_2381006D0(&qword_2568DA578, &qword_2568DA570);
  sub_238102E28();
  MEMORY[0x23B82BB54](0, v16, v13, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v22);
  return swift_release();
}

void sub_2380FD688(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  id v12;
  void *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  void (*v16)(char *, uint64_t);
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  uint64_t v36;

  v6 = v5;
  v12 = objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID);
  if (v12)
  {
    v13 = v12;
    v14 = sub_238102CA8();
    v16 = v15;

    v17 = (_BYTE *)(v6 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
    swift_beginAccess();
    if ((*v17 & 1) == 0)
    {
      v34 = a4;
      if (qword_2568DA2C0 != -1)
        swift_once();
      sub_2380EDA84(v14, (uint64_t)v16);
      if (v18)
      {
        v19 = v18;
        if (qword_2568DA2C8 != -1)
          swift_once();
        v20 = sub_238102C0C();
        __swift_project_value_buffer(v20, (uint64_t)qword_2568DB728);
        swift_bridgeObjectRetain();
        v21 = sub_238102BF4();
        v22 = sub_238102D8C();
        if (os_log_type_enabled(v21, v22))
        {
          v23 = (uint8_t *)swift_slowAlloc();
          v24 = swift_slowAlloc();
          v36 = v24;
          *(_DWORD *)v23 = 136315138;
          swift_bridgeObjectRetain();
          sub_2380FEAFC(v14, (unint64_t)v16, &v36);
          sub_238102E10();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2380DF000, v21, v22, "Returning cached recommendations for altDSID:%s", v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B82C364](v24, -1, -1);
          MEMORY[0x23B82C364](v23, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        ((void (*)(uint64_t, _QWORD))v34)(v19, 0);
        swift_bridgeObjectRelease();
        return;
      }
      if (qword_2568DA2C8 != -1)
        swift_once();
      v29 = sub_238102C0C();
      __swift_project_value_buffer(v29, (uint64_t)qword_2568DB728);
      v30 = sub_238102BF4();
      v31 = sub_238102D8C();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_2380DF000, v30, v31, "No cache found, reaching out to client donors.", v32, 2u);
        MEMORY[0x23B82C364](v32, -1, -1);
      }

      a4 = v34;
    }
    v33 = *(_QWORD *)(v6 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_pluginsLoader);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_2380F0934(a1, a2, a3, v33, a1, a4, a5, v14, v16);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease_n();
    return;
  }
  if (qword_2568DA2C8 != -1)
    swift_once();
  v25 = sub_238102C0C();
  __swift_project_value_buffer(v25, (uint64_t)qword_2568DB728);
  v26 = sub_238102BF4();
  v27 = sub_238102D98();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_2380DF000, v26, v27, "Invalid account. No altDSID found.", v28, 2u);
    MEMORY[0x23B82C364](v28, -1, -1);
  }

  v35 = sub_2380FCF58(0);
  ((void (*)(_QWORD, id))a4)(MEMORY[0x24BEE4AF8], v35);

}

void sub_2380FDB18(unint64_t a1, void *a2, uint64_t a3, void (*a4)(unint64_t, _QWORD), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void (*v29)(unint64_t, _QWORD);
  uint64_t v30;
  uint64_t v31;

  if (qword_2568DA2C8 != -1)
    swift_once();
  v12 = sub_238102C0C();
  __swift_project_value_buffer(v12, (uint64_t)qword_2568DB728);
  v13 = sub_238102BF4();
  v14 = sub_238102D8C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2380DF000, v13, v14, "Request to fetch recommendations from client donors has been completed.", v15, 2u);
    MEMORY[0x23B82C364](v15, -1, -1);
  }

  if (!a2)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v28 = sub_238102EA0();
      swift_bridgeObjectRelease();
      if (v28)
        goto LABEL_10;
    }
    else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_10:
      if (qword_2568DA2C0 != -1)
        swift_once();
      sub_2380ED788(a6, a7, a1);
    }
    a4(a1, 0);
    return;
  }
  swift_bridgeObjectRetain();
  v16 = a2;
  swift_bridgeObjectRetain();
  v17 = a2;
  v18 = sub_238102BF4();
  v19 = sub_238102D98();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v21 = (_QWORD *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v31 = v22;
    *(_DWORD *)v20 = 136315394;
    swift_bridgeObjectRetain();
    v23 = sub_238102D5C();
    v29 = a4;
    v25 = v24;
    swift_bridgeObjectRelease();
    sub_2380FEAFC(v23, v25, &v31);
    sub_238102E10();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    v26 = a2;
    v30 = _swift_stdlib_bridgeErrorToNSError();
    sub_238102E10();
    *v21 = v30;
    a4 = v29;

    _os_log_impl(&dword_2380DF000, v18, v19, "Unable to fetch recommendations from client donors for bundles:%s error: %@", (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA600);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v22, -1, -1);
    MEMORY[0x23B82C364](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v27 = sub_2380FCF58(1);
  a4(MEMORY[0x24BEE4AF8], v27);

}

void sub_2380FDED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, _QWORD), uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t inited;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;

  v7 = v6;
  v14 = objc_msgSend(*(id *)(v6 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID);
  if (v14)
  {
    v15 = v14;
    v16 = sub_238102CA8();
    v18 = v17;

    v19 = (_BYTE *)(v7 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
    swift_beginAccess();
    if ((*v19 & 1) != 0)
    {
      swift_bridgeObjectRelease();
LABEL_21:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568DAD48);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_238104BB0;
      *(_QWORD *)(inited + 32) = a1;
      *(_QWORD *)(inited + 40) = a2;
      swift_bridgeObjectRetain();
      v36 = sub_238100424(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = a5;
      *(_QWORD *)(v37 + 24) = a6;
      swift_retain();
      sub_2380FD440(v36, a3, a4, (uint64_t)sub_2381004DC, v37);
      swift_bridgeObjectRelease();
      swift_release();
      return;
    }
    v39 = a5;
    if (qword_2568DA2C0 != -1)
      swift_once();
    sub_2380EDCE0(v16, v18, a1, a2);
    if (!v24)
    {
      swift_bridgeObjectRelease();
      if (qword_2568DA2C8 != -1)
        swift_once();
      v31 = sub_238102C0C();
      __swift_project_value_buffer(v31, (uint64_t)qword_2568DB728);
      v32 = sub_238102BF4();
      v33 = sub_238102D8C();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_2380DF000, v32, v33, "No cache found, reaching out to client donors.", v34, 2u);
        MEMORY[0x23B82C364](v34, -1, -1);
      }

      a5 = (void (*)(_QWORD, _QWORD))v39;
      goto LABEL_21;
    }
    v25 = v24;
    if (qword_2568DA2C8 != -1)
      swift_once();
    v26 = sub_238102C0C();
    __swift_project_value_buffer(v26, (uint64_t)qword_2568DB728);
    swift_bridgeObjectRetain();
    v27 = sub_238102BF4();
    v28 = sub_238102D8C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v40 = v30;
      *(_DWORD *)v29 = 136315138;
      swift_bridgeObjectRetain();
      sub_2380FEAFC(v16, v18, &v40);
      sub_238102E10();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2380DF000, v27, v28, "Returning cached recommendations for altDSID:%s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B82C364](v30, -1, -1);
      MEMORY[0x23B82C364](v29, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(uint64_t, _QWORD))v39)(v25, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2568DA2C8 != -1)
      swift_once();
    v20 = sub_238102C0C();
    __swift_project_value_buffer(v20, (uint64_t)qword_2568DB728);
    v21 = sub_238102BF4();
    v22 = sub_238102D98();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2380DF000, v21, v22, "Invalid account. No altDSID found.", v23, 2u);
      MEMORY[0x23B82C364](v23, -1, -1);
    }

    v38 = sub_2380FCF58(0);
    a5(MEMORY[0x24BEE4AF8], v38);

  }
}

void sub_2380FE3C0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *oslog;

  if (qword_2568DA2C8 != -1)
    swift_once();
  v1 = sub_238102C0C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2568DB728);
  v2 = sub_238102BF4();
  v3 = sub_238102D8C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2380DF000, v2, v3, "Clear recommendations cache.", v4, 2u);
    MEMORY[0x23B82C364](v4, -1, -1);
  }

  v5 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID);
  if (v5)
  {
    v6 = v5;
    v7 = sub_238102CA8();
    v9 = v8;

    if (qword_2568DA2C0 != -1)
      swift_once();
    v10 = (os_unfair_lock_s *)(*(_QWORD *)(qword_2568DB720 + 16) + 16);
    os_unfair_lock_lock(v10);
    swift_beginAccess();
    sub_2380FF14C(v7, v9);
    swift_endAccess();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    oslog = sub_238102BF4();
    v11 = sub_238102D98();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2380DF000, oslog, v11, "Invalid account. No altDSID found.", v12, 2u);
      MEMORY[0x23B82C364](v12, -1, -1);
    }

  }
}

void sub_2380FE5E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t (*v16)();
  void (*v17)(_QWORD *);
  _QWORD *v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD v23[4];
  uint64_t v24[4];

  if (qword_2568DA2C8 != -1)
    swift_once();
  v5 = sub_238102C0C();
  __swift_project_value_buffer(v5, (uint64_t)qword_2568DB728);
  swift_bridgeObjectRetain_n();
  v6 = sub_238102BF4();
  v7 = sub_238102D8C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v24[0] = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    v23[0] = sub_2380FEAFC(a1, a2, v24);
    sub_238102E10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2380DF000, v6, v7, "Remove recommendations %s from client cache.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B82C364](v9, -1, -1);
    MEMORY[0x23B82C364](v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v10 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account), sel_aa_altDSID, v23[0]);
  if (v10)
  {
    v11 = v10;
    v12 = sub_238102CA8();
    v14 = v13;

    if (qword_2568DA2C0 != -1)
      swift_once();
    v15 = (os_unfair_lock_s *)(*(_QWORD *)(qword_2568DB720 + 16) + 16);
    os_unfair_lock_lock(v15);
    swift_bridgeObjectRetain();
    v16 = sub_2380ED64C();
    v17 = sub_2380FCEB4(v23, v12, v14);
    if (*v18)
    {
      v19 = (void *)sub_2380FF224(a1, a2, (void (*)(void))sub_2380FAD2C);
      ((void (*)(_QWORD *, _QWORD))v17)(v23, 0);
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t *, _QWORD))v16)(v24, 0);

    }
    else
    {
      ((void (*)(_QWORD *, _QWORD))v17)(v23, 0);
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t *, _QWORD))v16)(v24, 0);
    }
    os_unfair_lock_unlock(v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = sub_238102BF4();
    v21 = sub_238102D98();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_2380DF000, v20, v21, "Invalid account. No altDSID found.", v22, 2u);
      MEMORY[0x23B82C364](v22, -1, -1);
    }

  }
}

id ClientRecommendationsRepository.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ClientRecommendationsRepository.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ClientRecommendationsRepository.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClientRecommendationsRepository();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2380FEA10(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2380FEA44(uint64_t (*a1)(void))
{
  uint64_t result;

  result = a1();
  if (result)
    return _swift_stdlib_bridgeErrorToNSError();
  return result;
}

uint64_t sub_2380FEA6C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2380FEA8C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2380FEAFC(v6, v7, a3);
  v8 = *a1 + 8;
  sub_238102E10();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2380FEAFC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2380FEBCC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_238100690((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_238100690((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2380FEBCC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_238102E1C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2380FED84(a5, a6);
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
  v8 = sub_238102E88();
  if (!v8)
  {
    sub_238102E94();
    __break(1u);
LABEL_17:
    result = sub_238102ED0();
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

uint64_t sub_2380FED84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2380FEE18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2380FEFF0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2380FEFF0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2380FEE18(uint64_t a1, unint64_t a2)
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
      v3 = sub_2380FEF8C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_238102E64();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_238102E94();
      __break(1u);
LABEL_10:
      v2 = sub_238102CC0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_238102ED0();
    __break(1u);
LABEL_14:
    result = sub_238102E94();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2380FEF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DAD88);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2380FEFF0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568DAD88);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  result = sub_238102ED0();
  __break(1u);
  return result;
}

_BYTE **sub_2380FF13C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_2380FF14C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2380FA0F8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2380FAB78();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_2380FF2FC(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2380FF218(uint64_t a1, uint64_t a2)
{
  return sub_2380FF224(a1, a2, (void (*)(void))sub_2380FAD38);
}

uint64_t sub_2380FF224(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t *v5;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_2380FA0F8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v5;
  v14 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_2380FF2FC(v8, v11);
  *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_2380FF2FC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_238102E34();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_238102F84();
        swift_bridgeObjectRetain();
        sub_238102CB4();
        v9 = sub_238102F9C();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void (*sub_2380FF4D0(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_2380FF718(v6);
  v6[10] = sub_2380FF5B0(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_2380FF560;
}

void sub_2380FF560(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_2380FF5B0(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_2380FA0F8(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_2380FF6DC;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_2380FAB78();
      goto LABEL_7;
    }
    sub_2380FA23C(v16, a4 & 1);
    v20 = sub_2380FA0F8(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))sub_238102F30();
  __break(1u);
  return result;
}

void sub_2380FF6DC(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_2380FF744(*a1, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_2380FF718(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_2380FF738;
}

uint64_t sub_2380FF738(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_2380FF744(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;

  v8 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*a3 + 56) + 8 * a4) = v8;
    }
    else
    {
      sub_2380EE928(a4, a5, a6, v8, (_QWORD *)*a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    sub_2380FF2FC(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_2380FF7E0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_238102F84();
  swift_bridgeObjectRetain();
  sub_238102CB4();
  v8 = sub_238102F9C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_238102F0C() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_238102F0C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2380FFC68(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2380FF98C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DAD90);
  v3 = sub_238102E58();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_238102F84();
      sub_238102CB4();
      result = sub_238102F9C();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2380FFC68(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_2380FF98C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2380FFE00();
      goto LABEL_22;
    }
    sub_2380FFFB0();
  }
  v11 = *v4;
  sub_238102F84();
  sub_238102CB4();
  result = sub_238102F9C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_238102F0C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_238102F24();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_238102F0C();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_2380FFE00()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DAD90);
  v2 = *v0;
  v3 = sub_238102E4C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2380FFFB0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DAD90);
  v3 = sub_238102E58();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_238102F84();
    swift_bridgeObjectRetain();
    sub_238102CB4();
    result = sub_238102F9C();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_23810025C(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v3 = OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_defaultThresholdDictionary;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DAD98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_238104F80;
  *(_QWORD *)(inited + 32) = sub_238102CA8();
  *(_QWORD *)(inited + 40) = v5;
  sub_2380F25A0(0, &qword_2568DA5E8);
  v6 = v1;
  *(_QWORD *)(inited + 48) = sub_238102DF8();
  *(_QWORD *)(inited + 56) = sub_238102CA8();
  *(_QWORD *)(inited + 64) = v7;
  *(_QWORD *)(inited + 72) = sub_238102DF8();
  *(_QWORD *)&v1[v3] = sub_2380F298C(inited);
  *(_QWORD *)&v6[OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_account] = a1;
  v6[OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache] = 1;
  type metadata accessor for RecommendationsPluginLoader();
  swift_allocObject();
  v8 = a1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_pluginsLoader] = sub_2380F0228();

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for ClientRecommendationsRepository();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t sub_23810039C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2381003E0()
{
  uint64_t v0;

  sub_2380FD688(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(NSObject **)(v0 + 48), *(void **)(v0 + 56));
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

uint64_t sub_238100424(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_238102D68();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2380FF7E0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2381004B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2381004DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for ClientRecommendationsRepository()
{
  return objc_opt_self();
}

uint64_t sub_23810051C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23810056C(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC19CloudRecommendation31ClientRecommendationsRepository_ignoreClientCache);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for ClientRecommendationsRepository()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.ignoreClientCache.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.ignoreClientCache.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.ignoreClientCache.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.__allocating_init(account:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.fetch(bundles:thresholds:timestamps:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.fetch(bundleID:thresholds:timestamps:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.removeAll()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ClientRecommendationsRepository.remove(identifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t sub_238100690(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2381006D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B82C2D4](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __getINDaemonConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BackupManagerProvider initWithAccount:].cold.1(v0);
}

void __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (id)OUTLINED_FUNCTION_3_1();
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_2380DF000, v5, v6, "%@ Unable to get storage amount needed to sync account: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

void __47__iCloudStorageController_fetchStorageSummary___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (id)OUTLINED_FUNCTION_3_1();
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_2380DF000, v5, v6, "%@ Unable to fetch cloud storage summary: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

uint64_t __getICQStoragePlanRecommendationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getICQCloudStorageDataControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getICQCloudStorageDataControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getICSHomeDataControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getICSHomeDataControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CERecommendationAction initWithDictionary:].cold.1(v0);
}

uint64_t sub_238102B4C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_238102B58()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_238102B64()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_238102B70()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_238102B7C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_238102B88()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_238102B94()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_238102BA0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_238102BAC()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_238102BB8()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_238102BC4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_238102BD0()
{
  return MEMORY[0x24BDFC9F0]();
}

uint64_t sub_238102BDC()
{
  return MEMORY[0x24BDFC9F8]();
}

uint64_t sub_238102BE8()
{
  return MEMORY[0x24BDFCA00]();
}

uint64_t sub_238102BF4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_238102C00()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_238102C0C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_238102C18()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_238102C24()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_238102C30()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_238102C3C()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_238102C48()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_238102C54()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_238102C60()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_238102C6C()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_238102C78()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_238102C84()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_238102C90()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_238102C9C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_238102CA8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_238102CB4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_238102CC0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_238102CCC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_238102CD8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_238102CE4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_238102CF0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_238102CFC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_238102D08()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_238102D14()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_238102D20()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_238102D2C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_238102D38()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_238102D44()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_238102D50()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_238102D5C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_238102D68()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_238102D74()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_238102D80()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t sub_238102D8C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_238102D98()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_238102DA4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_238102DB0()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_238102DBC()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_238102DC8()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_238102DD4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_238102DE0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_238102DEC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_238102DF8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_238102E04()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_238102E10()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_238102E1C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_238102E28()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_238102E34()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_238102E40()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_238102E4C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_238102E58()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_238102E64()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_238102E70()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_238102E7C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_238102E88()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_238102E94()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_238102EA0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_238102EAC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_238102EB8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_238102EC4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_238102ED0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_238102EDC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_238102EE8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_238102EF4()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_238102F00()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_238102F0C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_238102F18()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_238102F24()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_238102F30()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_238102F3C()
{
  return MEMORY[0x24BDD06D8]();
}

uint64_t sub_238102F48()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_238102F54()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_238102F60()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_238102F6C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_238102F78()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_238102F84()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_238102F90()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_238102F9C()
{
  return MEMORY[0x24BEE4328]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x24BEE71B0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

