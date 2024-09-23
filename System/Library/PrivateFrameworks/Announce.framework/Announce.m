uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = *a1 + *a2;
  swift_beginAccess();
  result = MEMORY[0x2199E53C8](v4);
  *a3 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E52FC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t keypath_setTm()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

id ANLogHandleAnnouncement()
{
  if (ANLogHandleAnnouncement_once != -1)
    dispatch_once(&ANLogHandleAnnouncement_once, &__block_literal_global_306);
  return (id)ANLogHandleAnnouncement_logger;
}

id ANLogHandleLocalPlaybackSession()
{
  if (ANLogHandleLocalPlaybackSession_once != -1)
    dispatch_once(&ANLogHandleLocalPlaybackSession_once, &__block_literal_global_1);
  return (id)ANLogHandleLocalPlaybackSession_logger;
}

void sub_215707E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_215708120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

os_log_t ANLogWithCategory(char *category)
{
  return os_log_create("com.apple.intercom", category);
}

uint64_t ANLogBuildCategoryName(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  uint64_t v14;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v5;
  if (v4)
  {
    v6 = v5;
    if ((objc_msgSend(v4, "an_isLocalDevice") & 1) == 0)
    {
      objc_msgSend(v4, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("-"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = &stru_24D370F00;
      if (v9)
        v11 = (__CFString *)v9;
      v12 = v11;

      objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("-%@"), v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v13 = objc_retainAutorelease(v6);
  v14 = objc_msgSend(v13, "cStringUsingEncoding:", 134217984);

  return v14;
}

void sub_215708E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnounce()
{
  if (ANLogHandleAnnounce_once != -1)
    dispatch_once(&ANLogHandleAnnounce_once, &__block_literal_global_173);
  return (id)ANLogHandleAnnounce_logger;
}

void sub_215709D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_21570A18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570A540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570A778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570AE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570B028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570B22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570B43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570B630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21570B824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnouncementContext()
{
  if (ANLogHandleAnnouncementContext_once != -1)
    dispatch_once(&ANLogHandleAnnouncementContext_once, &__block_literal_global_4);
  return (id)ANLogHandleAnnouncementContext_logger;
}

id ANLogHandleAnnouncementDataItem()
{
  if (ANLogHandleAnnouncementDataItem_once != -1)
    dispatch_once(&ANLogHandleAnnouncementDataItem_once, &__block_literal_global_5);
  return (id)ANLogHandleAnnouncementDataItem_logger;
}

id ANLogHandleAudioProcessor()
{
  if (ANLogHandleAudioProcessor_once != -1)
    dispatch_once(&ANLogHandleAudioProcessor_once, &__block_literal_global_6);
  return (id)ANLogHandleAudioProcessor_logger;
}

id ANLogHandleAudioSession()
{
  if (ANLogHandleAudioSession_once != -1)
    dispatch_once(&ANLogHandleAudioSession_once, &__block_literal_global_7);
  return (id)ANLogHandleAudioSession_logger;
}

void sub_215711394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2157114A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2157115B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleXPCTransactionManager()
{
  if (ANLogHandleXPCTransactionManager_once != -1)
    dispatch_once(&ANLogHandleXPCTransactionManager_once, &__block_literal_global_8);
  return (id)ANLogHandleXPCTransactionManager_logger;
}

void sub_215712058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleRemotePlaybackSession()
{
  if (ANLogHandleRemotePlaybackSession_once != -1)
    dispatch_once(&ANLogHandleRemotePlaybackSession_once, &__block_literal_global_152);
  return (id)ANLogHandleRemotePlaybackSession_logger;
}

void sub_215713004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21571326C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleFiles()
{
  if (ANLogHandleFiles_once != -1)
    dispatch_once(&ANLogHandleFiles_once, &__block_literal_global_10);
  return (id)ANLogHandleFiles_logger;
}

id ANLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[_ANBundleHelper currentBundle](_ANBundleHelper, "currentBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24D370F00, CFSTR("ANSensitiveStrings-Announce"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ANLocalizedStringWithFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a1;
  v11 = [v9 alloc];
  ANLocalizedString(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:locale:arguments:", v12, v13, &a9);

  return v14;
}

id ANLocalizedStringWithDefaultValue(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = a1;
  ANLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
    v7 = v3;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

void sub_215715234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21571560C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21571578C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2157158F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215715A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleTonePlayerService()
{
  if (ANLogHandleTonePlayerService_once[0] != -1)
    dispatch_once(ANLogHandleTonePlayerService_once, &__block_literal_global_63);
  return (id)ANLogHandleTonePlayerService_logger;
}

uint64_t sub_2157182D8(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  char v8;

  v1 = a1;
  v2 = objc_msgSend(v1, sel_processName);
  v3 = sub_21571B210();
  v5 = v4;

  v6 = v3 == 0x616F42646E756F53 && v5 == 0xEA00000000006472;
  if (v6
    || (sub_21571B30C() & 1) != 0
    || (v3 == 0x64627568656D6F68 ? (v7 = v5 == 0xE800000000000000) : (v7 = 0), v7))
  {

    swift_bridgeObjectRelease();
    v8 = 1;
  }
  else
  {
    v8 = sub_21571B30C();

    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

uint64_t NSProcessInfo.isAutoPlaybackProcess.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  char v7;

  v1 = objc_msgSend(v0, sel_processName);
  v2 = sub_21571B210();
  v4 = v3;

  v5 = v2 == 0x616F42646E756F53 && v4 == 0xEA00000000006472;
  if (v5
    || (sub_21571B30C() & 1) != 0
    || (v2 == 0x64627568656D6F68 ? (v6 = v4 == 0xE800000000000000) : (v6 = 0), v6))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21571B30C();
    swift_bridgeObjectRelease();
    return v7 & 1;
  }
}

uint64_t sub_215718530()
{
  return sub_215718624(&OBJC_IVAR___ANXPCManager_delegate);
}

uint64_t sub_215718548()
{
  return sub_2157186CC();
}

uint64_t (*sub_215718554(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___ANXPCManager_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199E53C8](v5);
  return sub_2157185C4;
}

id sub_2157185D4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = a1 + *a3;
  swift_beginAccess();
  return (id)MEMORY[0x2199E53C8](v3);
}

uint64_t sub_215718618()
{
  return sub_215718624(&OBJC_IVAR___ANXPCManager_checkInProvider);
}

uint64_t sub_215718624(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x2199E53C8](v2);
}

uint64_t sub_215718674()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_2157186C0()
{
  return sub_2157186CC();
}

uint64_t sub_2157186CC()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_215718720(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___ANXPCManager_checkInProvider;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199E53C8](v5);
  return sub_2157185C4;
}

void sub_215718790(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
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

void sub_2157187FC(char a1)
{
  uint64_t v1;
  void *v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  v3 = *(void **)(v1 + OBJC_IVAR___ANXPCManager_lock);
  objc_msgSend(v3, sel_lock);
  *(_BYTE *)(v1 + OBJC_IVAR___ANXPCManager__needsCheckIn) = a1;
  objc_msgSend(v3, sel_unlock);
  oslog = sub_21571B1E0();
  v4 = sub_21571B294();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    sub_21571B2AC();
    _os_log_impl(&dword_2156FF000, oslog, v4, "Needs Check in = %{BOOL}d", v5, 8u);
    MEMORY[0x2199E5350](v5, -1, -1);
  }

}

id XPCManager.__allocating_init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return XPCManager.init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(a1, a2, a3, a4);
}

id XPCManager.init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  _BYTE *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _BYTE *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  objc_class *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v22 = a2;
  v8 = sub_21571B1F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4[OBJC_IVAR___ANXPCManager__needsCheckIn] = 1;
  *(_QWORD *)&v4[OBJC_IVAR___ANXPCManager__connection] = 0;
  swift_unknownObjectWeakInit();
  v12 = v4;
  sub_21571B1EC();
  (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 32))(&v12[OBJC_IVAR___ANXPCManager_logger], v11, v8);
  v12[OBJC_IVAR___ANXPCManager_isConnectionValid] = 0;
  *(_DWORD *)&v12[OBJC_IVAR___ANXPCManager_notifyRegisterToken] = -1;
  *(_QWORD *)&v12[OBJC_IVAR___ANXPCManager_checkInObservers] = MEMORY[0x24BEE4AF8];
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1788]), sel_init);
  *(_QWORD *)&v12[OBJC_IVAR___ANXPCManager_lock] = v13;
  v14 = &v12[OBJC_IVAR___ANXPCManager_machServiceName];
  v15 = v22;
  *v14 = a1;
  v14[1] = v15;
  *(_QWORD *)&v12[OBJC_IVAR___ANXPCManager_remoteObjectInterface] = a3;
  *(_QWORD *)&v12[OBJC_IVAR___ANXPCManager_exportedInterface] = a4;
  swift_unknownObjectWeakAssign();
  v16 = a3;
  v17 = a4;

  v18 = (objc_class *)type metadata accessor for XPCManager();
  v23.receiver = v12;
  v23.super_class = v18;
  v19 = objc_msgSendSuper2(&v23, sel_init);
  sub_2157187FC(1);
  sub_215718BE4();
  swift_unknownObjectRelease();

  return v19;
}

uint64_t type metadata accessor for XPCManager()
{
  uint64_t result;

  result = qword_253DAD8C0;
  if (!qword_253DAD8C0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_215718BE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint32_t v7;
  _QWORD v8[6];
  int out_token;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = OBJC_IVAR___ANXPCManager_notifyRegisterToken;
  if (*(_DWORD *)(v0 + OBJC_IVAR___ANXPCManager_notifyRegisterToken) == -1)
  {
    v2 = v0;
    out_token = -1;
    sub_21571B210();
    sub_21571AC20();
    v3 = sub_21571B2A0();
    v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v8[4] = sub_21571AC5C;
    v8[5] = v4;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_2157198B4;
    v8[3] = &block_descriptor_10;
    v5 = _Block_copy(v8);
    swift_release();
    v6 = sub_21571B21C();
    swift_bridgeObjectRelease();
    v7 = notify_register_dispatch((const char *)(v6 + 32), &out_token, v3, v5);
    swift_release();
    _Block_release(v5);

    if (!v7)
      *(_DWORD *)(v2 + v1) = out_token;
  }
}

id XPCManager.__deallocating_deinit()
{
  char *v0;
  void *v1;
  objc_super v3;

  v1 = *(void **)&v0[OBJC_IVAR___ANXPCManager__connection];
  if (v1)
    objc_msgSend(v1, sel_invalidate);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for XPCManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_215718F54()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + OBJC_IVAR___ANXPCManager_lock);
  objc_msgSend(v1, sel_lock);
  v2 = (_QWORD *)(v0 + OBJC_IVAR___ANXPCManager_checkInObservers);
  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x2199E4C48](v3);
  if (*(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_21571B24C();
  sub_21571B258();
  sub_21571B240();
  swift_endAccess();
  return objc_msgSend(v1, sel_unlock);
}

id sub_2157190A0()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  void *v3;
  __objc2_prot *v4;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t aBlock;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  void (*v28)();
  uint64_t v29;

  v1 = v0;
  v2 = OBJC_IVAR___ANXPCManager__connection;
  v3 = *(void **)&v0[OBJC_IVAR___ANXPCManager__connection];
  v4 = &OBJC_PROTOCOL___ANLocalPlaybackSessionServiceInterface;
  if (v3 && v0[OBJC_IVAR___ANXPCManager_isConnectionValid] == 1)
    return v3;
  v6 = v0;
  v7 = sub_21571B1E0();
  v8 = sub_21571B294();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    *(_DWORD *)v9 = 136315138;
    aBlock = v10;
    v11 = *(_QWORD *)&v6[OBJC_IVAR___ANXPCManager_machServiceName];
    v12 = *(_QWORD *)&v6[OBJC_IVAR___ANXPCManager_machServiceName + 8];
    swift_bridgeObjectRetain();
    v13 = v11;
    v4 = &OBJC_PROTOCOL___ANLocalPlaybackSessionServiceInterface;
    sub_21571A390(v13, v12, &aBlock);
    sub_21571B2AC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2156FF000, v7, v8, "Creating connection for %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199E5350](v10, -1, -1);
    MEMORY[0x2199E5350](v9, -1, -1);

  }
  else
  {

  }
  v14 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  swift_bridgeObjectRetain();
  v15 = (void *)sub_21571B204();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_initWithMachServiceName_options_, v15, 4096);

  objc_msgSend(v16, sel_setRemoteObjectInterface_, *(_QWORD *)&v6[OBJC_IVAR___ANXPCManager_remoteObjectInterface]);
  objc_msgSend(v16, sel_setExportedInterface_, *(_QWORD *)&v6[OBJC_IVAR___ANXPCManager_exportedInterface]);
  objc_msgSend(v16, sel_setExportedObject_, MEMORY[0x2199E53C8](&v6[OBJC_IVAR___ANXPCManager_exportedObject]));
  swift_unknownObjectRelease();
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v28 = sub_2157195D0;
  v29 = v17;
  v18 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v25 = 1107296256;
  v26 = sub_2157195D8;
  v27 = &block_descriptor;
  v19 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v16, sel_setInterruptionHandler_, v19);
  _Block_release(v19);
  v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v28 = sub_2157196E8;
  v29 = v20;
  aBlock = v18;
  v25 = 1107296256;
  v26 = sub_2157195D8;
  v27 = &block_descriptor_4;
  v21 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v16, sel_setInvalidationHandler_, v21);
  _Block_release(v21);
  sub_215718BE4();
  sub_2157187FC(0);
  objc_msgSend(v16, sel_resume);
  v6[(unint64_t)v4[16].opt_class_meths] = 1;
  v22 = *(void **)&v1[v2];
  *(_QWORD *)&v1[v2] = v16;
  v23 = v16;

  return v23;
}

uint64_t sub_215719484()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2157194A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  char *v7;
  void *v8;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2199E53C8](v1);
  if (v2)
  {
    v3 = (char *)v2;
    v4 = sub_21571B1E0();
    v5 = sub_21571B294();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2156FF000, v4, v5, "Connection to daemon was interrupted", v6, 2u);
      MEMORY[0x2199E5350](v6, -1, -1);
    }

    sub_2157187FC(1);
    v7 = &v3[OBJC_IVAR___ANXPCManager_delegate];
    swift_beginAccess();
    v8 = (void *)MEMORY[0x2199E53C8](v7);
    if (v8)
    {
      objc_msgSend(v8, sel_managerDidInterruptConnection_, v3);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_2157195D0()
{
  uint64_t v0;

  sub_2157194A8(v0);
}

uint64_t sub_2157195D8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_215719604(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2199E53C8](v1);
  if (v2)
  {
    v3 = (_BYTE *)v2;
    v4 = sub_21571B1E0();
    v5 = sub_21571B294();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2156FF000, v4, v5, "Connection to daemon was invalidated", v6, 2u);
      MEMORY[0x2199E5350](v6, -1, -1);
    }

    sub_2157187FC(1);
    v3[OBJC_IVAR___ANXPCManager_isConnectionValid] = 0;

  }
}

void sub_2157196E8()
{
  uint64_t v0;

  sub_215719604(v0);
}

id XPCManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void XPCManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_215719768(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unsigned __int8 *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAD900);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v5 = MEMORY[0x2199E53C8](a2 + 16);
  if (v5)
  {
    v6 = (unsigned __int8 *)v5;
    v7 = *(void **)(v5 + OBJC_IVAR___ANXPCManager_lock);
    objc_msgSend(v7, sel_lock);
    v8 = v6[OBJC_IVAR___ANXPCManager__needsCheckIn];
    objc_msgSend(v7, sel_unlock);
    if (v8 == 1)
    {
      v9 = sub_21571B27C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
      v10 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v11 = (_QWORD *)swift_allocObject();
      v11[2] = 0;
      v11[3] = 0;
      v11[4] = v10;
      sub_21571A0BC((uint64_t)v4, (uint64_t)&unk_254DE14C8, (uint64_t)v11);
      swift_release();
    }

  }
}

uint64_t sub_2157198B4(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_2157198F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 200) = a4;
  return swift_task_switch();
}

uint64_t sub_215719908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 200) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2199E53C8](v1);
  *(_QWORD *)(v0 + 208) = v2;
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)(v0 + 216) = OBJC_IVAR___ANXPCManager_logger;
    v4 = sub_21571B1E0();
    v5 = sub_21571B294();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2156FF000, v4, v5, "Checking in with daemon...", v6, 2u);
      MEMORY[0x2199E5350](v6, -1, -1);
    }

    v7 = v3 + OBJC_IVAR___ANXPCManager_checkInProvider;
    swift_beginAccess();
    v8 = MEMORY[0x2199E53C8](v7);
    *(_QWORD *)(v0 + 224) = v8;
    if (v8)
    {
      v9 = (void *)v8;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_215719C48;
      *(_QWORD *)(v0 + 112) = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
      *(_QWORD *)(v0 + 88) = 0x40000000;
      *(_QWORD *)(v0 + 96) = sub_21571A048;
      *(_QWORD *)(v0 + 104) = &block_descriptor_21;
      objc_msgSend(v9, sel_checkInWithCompletionHandler_, v0 + 80);
      return swift_continuation_await();
    }
    sub_21571AE0C();
    v11 = (void *)swift_allocError();
    swift_willThrow();
    v12 = v11;
    v13 = v11;
    v14 = sub_21571B1E0();
    v15 = sub_21571B288();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      *(_DWORD *)v16 = 136315138;
      v21 = v17;
      swift_getErrorValue();
      v18 = sub_21571B318();
      *(_QWORD *)(v0 + 80) = sub_21571A390(v18, v19, &v21);
      sub_21571B2AC();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2156FF000, v14, v15, "Failed to check in with daemon: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199E5350](v17, -1, -1);
      MEMORY[0x2199E5350](v16, -1, -1);

    }
    else
    {

    }
    v20 = *(void **)(v0 + 208);
    sub_2157187FC(1);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215719C48()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 232) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_215719CA8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  void *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t i;
  void *v11;

  v1 = sub_21571B1E0();
  v2 = sub_21571B294();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2156FF000, v1, v2, "Checked in with daemon", v3, 2u);
    MEMORY[0x2199E5350](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 208);

  sub_2157187FC(0);
  v5 = *(void **)(v4 + OBJC_IVAR___ANXPCManager_lock);
  objc_msgSend(v5, sel_lock);
  v6 = (unint64_t *)(v4 + OBJC_IVAR___ANXPCManager_checkInObservers);
  swift_beginAccess();
  v7 = *v6;
  swift_bridgeObjectRetain();
  objc_msgSend(v5, sel_unlock);
  if (!(v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_5;
LABEL_12:

    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_21571B2F4();
  v8 = result;
  if (!result)
    goto LABEL_12;
LABEL_5:
  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      if ((v7 & 0xC000000000000001) != 0)
      {
        v11 = (void *)MEMORY[0x2199E4CE4](i, v7);
      }
      else
      {
        v11 = *(void **)(v7 + 8 * i + 32);
        swift_unknownObjectRetain();
      }
      objc_msgSend(v11, sel_managerDidPerformDaemonCheckIn_, *(_QWORD *)(v0 + 208));
      swift_unknownObjectRelease();
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_215719E84()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v12;

  swift_willThrow();
  swift_unknownObjectRelease();
  v1 = *(void **)(v0 + 232);
  v2 = v1;
  v3 = v1;
  v4 = sub_21571B1E0();
  v5 = sub_21571B288();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v8 = sub_21571B318();
    *(_QWORD *)(v0 + 80) = sub_21571A390(v8, v9, &v12);
    sub_21571B2AC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2156FF000, v4, v5, "Failed to check in with daemon: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199E5350](v7, -1, -1);
    MEMORY[0x2199E5350](v6, -1, -1);

  }
  else
  {

  }
  v10 = *(void **)(v0 + 208);
  sub_2157187FC(1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21571A048(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE14E8);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_21571A0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21571B27C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21571B270();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21571AD38(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21571B264();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21571A200()
{
  return 1;
}

uint64_t sub_21571A208()
{
  sub_21571B354();
  sub_21571B360();
  return sub_21571B36C();
}

uint64_t sub_21571A248()
{
  return sub_21571B360();
}

uint64_t sub_21571A26C()
{
  sub_21571B354();
  sub_21571B360();
  return sub_21571B36C();
}

unint64_t sub_21571A2A8()
{
  return 0xD000000000000018;
}

uint64_t sub_21571A2E0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21571A344;
  return v6(a1);
}

uint64_t sub_21571A344()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21571A390(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21571A674(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21571A82C((uint64_t)v12, *a3);
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
      sub_21571A82C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21571A460@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___ANXPCManager_delegate, a2);
}

uint64_t sub_21571A46C()
{
  return keypath_setTm();
}

uint64_t sub_21571A478@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___ANXPCManager_checkInProvider, a2);
}

uint64_t sub_21571A484()
{
  return keypath_setTm();
}

uint64_t sub_21571A490()
{
  return type metadata accessor for XPCManager();
}

uint64_t sub_21571A498()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21571B1F8();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t method lookup function for XPCManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCManager.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of XPCManager.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of XPCManager.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of XPCManager.checkInProvider.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of XPCManager.checkInProvider.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of XPCManager.checkInProvider.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of XPCManager.__allocating_init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t dispatch thunk of XPCManager.addCheckInObserver(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of XPCManager.connection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t sub_21571A650(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_21571A674(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21571B2B8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21571A868(a5, a6);
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
  v8 = sub_21571B2DC();
  if (!v8)
  {
    sub_21571B2E8();
    __break(1u);
LABEL_17:
    result = sub_21571B300();
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

uint64_t sub_21571A82C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21571A868(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21571A8FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21571AAD4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21571AAD4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21571A8FC(uint64_t a1, unint64_t a2)
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
      v3 = sub_21571AA70(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21571B2C4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21571B2E8();
      __break(1u);
LABEL_10:
      v2 = sub_21571B228();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21571B300();
    __break(1u);
LABEL_14:
    result = sub_21571B2E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21571AA70(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE14B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21571AAD4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE14B8);
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
  result = sub_21571B300();
  __break(1u);
  return result;
}

unint64_t sub_21571AC20()
{
  unint64_t result;

  result = qword_253DAD8D0;
  if (!qword_253DAD8D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253DAD8D0);
  }
  return result;
}

void sub_21571AC5C(uint64_t a1)
{
  uint64_t v1;

  sub_215719768(a1, v1);
}

uint64_t sub_21571AC64()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21571AC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21571ACF0;
  v3[25] = v2;
  return swift_task_switch();
}

uint64_t sub_21571ACF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21571AD38(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253DAD900);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21571AD78()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21571AD9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21571ACF0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254DE14D0 + dword_254DE14D0))(a1, v4);
}

unint64_t sub_21571AE0C()
{
  unint64_t result;

  result = qword_254DE14E0;
  if (!qword_254DE14E0)
  {
    result = MEMORY[0x2199E5308](&unk_21571D8F8, &type metadata for XPCManager.XPCManagerError);
    atomic_store(result, (unint64_t *)&qword_254DE14E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for XPCManager.XPCManagerError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for XPCManager.XPCManagerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21571AEE0 + 4 * byte_21571D788[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21571AF00 + 4 * byte_21571D78D[v4]))();
}

_BYTE *sub_21571AEE0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21571AF00(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21571AF08(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21571AF10(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21571AF18(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21571AF20(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21571AF2C()
{
  return 0;
}

ValueMetadata *type metadata accessor for XPCManager.XPCManagerError()
{
  return &type metadata for XPCManager.XPCManagerError;
}

unint64_t sub_21571AF50()
{
  unint64_t result;

  result = qword_254DE14F0;
  if (!qword_254DE14F0)
  {
    result = MEMORY[0x2199E5308](&unk_21571D8D0, &type metadata for XPCManager.XPCManagerError);
    atomic_store(result, (unint64_t *)&qword_254DE14F0);
  }
  return result;
}

uint64_t sub_21571B1BC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21571B1C8()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21571B1D4()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21571B1E0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21571B1EC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21571B1F8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21571B204()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21571B210()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21571B21C()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_21571B228()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21571B234()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21571B240()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21571B24C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21571B258()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21571B264()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21571B270()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21571B27C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21571B288()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21571B294()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21571B2A0()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21571B2AC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21571B2B8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21571B2C4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21571B2D0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21571B2DC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21571B2E8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21571B2F4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21571B300()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21571B30C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21571B318()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21571B324()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21571B330()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21571B33C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21571B348()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21571B354()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21571B360()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21571B36C()
{
  return MEMORY[0x24BEE4328]();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
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

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

