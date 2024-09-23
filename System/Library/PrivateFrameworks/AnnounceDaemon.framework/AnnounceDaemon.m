void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id ANLogHandleUserNotificationsController()
{
  if (ANLogHandleUserNotificationsController_once != -1)
    dispatch_once(&ANLogHandleUserNotificationsController_once, &__block_literal_global_1);
  return (id)ANLogHandleUserNotificationsController_logger;
}

void sub_1D23A9650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23A9A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnounceServiceListener()
{
  if (ANLogHandleAnnounceServiceListener_once != -1)
    dispatch_once(&ANLogHandleAnnounceServiceListener_once, &__block_literal_global_2);
  return (id)ANLogHandleAnnounceServiceListener_logger;
}

void sub_1D23ABA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23ACAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id ANLogHandlePlaybackSessionServiceListener()
{
  if (ANLogHandlePlaybackSessionServiceListener_once != -1)
    dispatch_once(&ANLogHandlePlaybackSessionServiceListener_once, &__block_literal_global_4);
  return (id)ANLogHandlePlaybackSessionServiceListener_logger;
}

void sub_1D23AE7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,id a28)
{
  id *v28;
  id *v29;
  id *v30;
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1D23AEB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D23AF138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

id ANLogHandleSystemNotificationObserver()
{
  if (ANLogHandleSystemNotificationObserver_once != -1)
    dispatch_once(&ANLogHandleSystemNotificationObserver_once, &__block_literal_global_5);
  return (id)ANLogHandleSystemNotificationObserver_logger;
}

uint64_t _LanguageChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ANLogHandleSystemNotificationObserver();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = &stru_1E93913D0;
    v12 = 2112;
    v13 = a3;
    v14 = 2112;
    v15 = a5;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@SystemNotificationObserver %@ notification received with user info %@.", (uint8_t *)&v10, 0x20u);
  }

  return objc_msgSend(a2, "_languageDidChange");
}

id ANLogHandleRapportEventStreamHandler()
{
  if (ANLogHandleRapportEventStreamHandler_once != -1)
    dispatch_once(&ANLogHandleRapportEventStreamHandler_once, &__block_literal_global_21);
  return (id)ANLogHandleRapportEventStreamHandler_logger;
}

void sub_1D23B240C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1D23B2764(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1D23B2D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  uint64_t v28;

  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Block_object_dispose((const void *)(v28 - 176), 8);
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

id ANLogHandleTonePlayerServiceListener()
{
  if (ANLogHandleTonePlayerServiceListener_once != -1)
    dispatch_once(&ANLogHandleTonePlayerServiceListener_once, &__block_literal_global_7);
  return (id)ANLogHandleTonePlayerServiceListener_logger;
}

void sub_1D23B39F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23B46D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23B4AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23B508C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23B57E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23B5B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D23B5C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D23B5DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1D23B6060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnounceReachabilityServiceListener()
{
  if (ANLogHandleAnnounceReachabilityServiceListener_once != -1)
    dispatch_once(&ANLogHandleAnnounceReachabilityServiceListener_once, &__block_literal_global_9);
  return (id)ANLogHandleAnnounceReachabilityServiceListener_logger;
}

void sub_1D23B9E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1D23BA1A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23BA640(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D23BA81C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D23BAF9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D23BB268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnouncementStorageManager()
{
  if (ANLogHandleAnnouncementStorageManager_once != -1)
    dispatch_once(&ANLogHandleAnnouncementStorageManager_once, &__block_literal_global_133);
  return (id)ANLogHandleAnnouncementStorageManager_logger;
}

void sub_1D23BD9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D23BDA54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D23BDAF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ANLogHandleHomeManager_HomeContext()
{
  if (ANLogHandleHomeManager_HomeContext_once != -1)
    dispatch_once(&ANLogHandleHomeManager_HomeContext_once, &__block_literal_global_11);
  return (id)ANLogHandleHomeManager_HomeContext_logger;
}

void sub_1D23BF788(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23BFC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id ANLogHandlePlaybackManager()
{
  if (ANLogHandlePlaybackManager_once != -1)
    dispatch_once(&ANLogHandlePlaybackManager_once, &__block_literal_global_12);
  return (id)ANLogHandlePlaybackManager_logger;
}

id ANLogHandleHomeManager()
{
  if (ANLogHandleHomeManager_once != -1)
    dispatch_once(&ANLogHandleHomeManager_once, &__block_literal_global_13);
  return (id)ANLogHandleHomeManager_logger;
}

void sub_1D23C3274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1D23C38BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C3CC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C4010(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C4280(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C44F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C489C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C4B4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C4DF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C50C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C5368(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C5604(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C5874(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23C5AF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id ANLogHandleHome_Announce()
{
  if (ANLogHandleHome_Announce_once != -1)
    dispatch_once(&ANLogHandleHome_Announce_once, &__block_literal_global_15);
  return (id)ANLogHandleHome_Announce_logger;
}

void sub_1D23C8F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23CA784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id location)
{
  id *v55;

  objc_destroyWeak(v55);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23CC53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1D23CC6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D23CCF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleAnalyticsDaily()
{
  if (ANLogHandleAnalyticsDaily_once != -1)
    dispatch_once(&ANLogHandleAnalyticsDaily_once, &__block_literal_global_17);
  return (id)ANLogHandleAnalyticsDaily_logger;
}

void sub_1D23CD3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23CD818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23CEB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23CF7FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23CFFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23D02A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1D23D07A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23D0970(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23D0B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D23D151C()
{
  objc_end_catch();
  JUMPOUT(0x1D23D1524);
}

void sub_1D23D17E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23D2E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23D34E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id ANLogHandleMessengerDestination()
{
  if (ANLogHandleMessengerDestination_once != -1)
    dispatch_once(&ANLogHandleMessengerDestination_once, &__block_literal_global_71);
  return (id)ANLogHandleMessengerDestination_logger;
}

id ANLogHandleMessenger_Announcement()
{
  if (ANLogHandleMessenger_Announcement_once != -1)
    dispatch_once(&ANLogHandleMessenger_Announcement_once, &__block_literal_global_22);
  return (id)ANLogHandleMessenger_Announcement_logger;
}

void sub_1D23D78C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ANLogHandleRapportConnection()
{
  if (ANLogHandleRapportConnection_once != -1)
    dispatch_once(&ANLogHandleRapportConnection_once, &__block_literal_global_216);
  return (id)ANLogHandleRapportConnection_logger;
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

void sub_1D23D84A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23D8784(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D23D8998(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D23D8C14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23D8F94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23D93F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v3);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1D23D9B4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1D23D9EF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D23DA124(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D23DA3A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23DA728(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D23DB000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23DB3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23DB7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23DC518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D23DCBA4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id ANLogHandleValidationHelper()
{
  if (ANLogHandleValidationHelper_once != -1)
    dispatch_once(&ANLogHandleValidationHelper_once, &__block_literal_global_25);
  return (id)ANLogHandleValidationHelper_logger;
}

id ANLogHandleAnnouncementDataItem_AudioProcessing()
{
  if (ANLogHandleAnnouncementDataItem_AudioProcessing_once != -1)
    dispatch_once(&ANLogHandleAnnouncementDataItem_AudioProcessing_once, &__block_literal_global_26);
  return (id)ANLogHandleAnnouncementDataItem_AudioProcessing_logger;
}

void sub_1D23DE45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
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

void sub_1D23DEF7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D23DF05C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D23E1360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleAnnouncementStatePublisher()
{
  if (ANLogHandleAnnouncementStatePublisher_once != -1)
    dispatch_once(&ANLogHandleAnnouncementStatePublisher_once, &__block_literal_global_28);
  return (id)ANLogHandleAnnouncementStatePublisher_logger;
}

void sub_1D23E4590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
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

id ANLogHandleIDSConnection()
{
  if (ANLogHandleIDSConnection_once != -1)
    dispatch_once(&ANLogHandleIDSConnection_once, &__block_literal_global_167);
  return (id)ANLogHandleIDSConnection_logger;
}

id ANLogHandleCompanionConnection()
{
  if (ANLogHandleCompanionConnection_once != -1)
    dispatch_once(&ANLogHandleCompanionConnection_once, &__block_literal_global_39);
  return (id)ANLogHandleCompanionConnection_logger;
}

void sub_1D23E5A70(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1D23E5D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ANLogHandleCoreAnalytics()
{
  if (ANLogHandleCoreAnalytics_once[0] != -1)
    dispatch_once(ANLogHandleCoreAnalytics_once, &__block_literal_global_32);
  return (id)ANLogHandleCoreAnalytics_logger;
}

id AnnounceServer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *AnnounceServer.init()()
{
  char *v0;
  void *v1;
  char *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  char *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  objc_super v16;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_systemNotificationObserver] = 0;
  v1 = (void *)objc_opt_self();
  v2 = v0;
  if (objc_msgSend(v1, sel_isAnnounceEnabled))
  {

  }
  v3 = objc_msgSend(objc_allocWithZone((Class)ANPlaybackSessionServiceListener), sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_playbackSessionServiceListener] = v3;
  v4 = objc_msgSend(objc_allocWithZone((Class)ANAnnounceServiceListener), sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceServiceListener] = v4;
  v5 = objc_msgSend(objc_allocWithZone((Class)ANAnnounceReachabilityServiceListener), sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceReachabilityServiceListener] = v5;
  v6 = objc_msgSend(objc_allocWithZone((Class)ANTonePlayerServiceListener), sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_tonePlayerServiceListener] = v6;

  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for AnnounceServer();
  v7 = (char *)objc_msgSendSuper2(&v16, sel_init);
  v8 = objc_msgSend(v1, sel_isAnnounceEnabled);
  v9 = v7;
  if (v8)
  {
    v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v15[4] = sub_1D23E6758;
    v15[5] = v10;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 1107296256;
    v15[2] = sub_1D23E67CC;
    v15[3] = &block_descriptor;
    v11 = _Block_copy(v15);
    v12 = (void *)objc_opt_self();
    swift_retain();
    v13 = objc_msgSend(v12, sel_observer_, v11);
    _Block_release(v11);
    swift_release();

    swift_release();
    v9 = *(void **)&v7[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_systemNotificationObserver];
    *(_QWORD *)&v7[OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_systemNotificationObserver] = v13;
  }

  return v7;
}

uint64_t type metadata accessor for AnnounceServer()
{
  return objc_opt_self();
}

uint64_t sub_1D23E66D4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1D23E66F8(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((a1 & 1) != 0)
  {
    v2 = a2 + 16;
    swift_beginAccess();
    v3 = MEMORY[0x1D8235DCC](v2);
    if (v3)
    {
      v4 = (void *)v3;
      sub_1D23E6840((uint64_t)sub_1D23E6760, 0);

    }
  }
}

void sub_1D23E6758(char a1)
{
  uint64_t v1;

  sub_1D23E66F8(a1, v1);
}

void sub_1D23E6760()
{
  void *v0;

  sub_1D23E6E08(0, &qword_1EFC7C418);
  v0 = (void *)sub_1D23F2990();
  sub_1D23F2954();
  sub_1D23F2780();

  exit(0);
}

uint64_t sub_1D23E67CC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
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

uint64_t sub_1D23E6840(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  void *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v29 = a1;
  v30 = a2;
  v32 = sub_1D23F27F8();
  v35 = *(_QWORD *)(v32 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v31 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D23F2810();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D23F27EC();
  v8 = *(_QWORD *)(v7 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v10 = (uint64_t *)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v28 = sub_1D23F2828();
  v11 = *(_QWORD *)(v28 - 8);
  v12 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v28 - v15;
  v17 = objc_msgSend((id)objc_opt_self(), sel_sharedController);
  objc_msgSend(v17, sel_cleanForExit);

  v18 = objc_msgSend((id)objc_opt_self(), sel_sharedCoordinator);
  objc_msgSend(v18, sel_cleanForExit);

  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_playbackSessionServiceListener), sel_cleanForExit);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceServiceListener), sel_cleanForExit);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceReachabilityServiceListener), sel_cleanForExit);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_tonePlayerServiceListener), sel_cleanForExit);
  sub_1D23E6E08(0, (unint64_t *)&qword_1EFC7C3F8);
  v19 = (void *)sub_1D23F296C();
  sub_1D23F281C();
  *v10 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF4A0], v7);
  MEMORY[0x1D8235274](v14, v10);
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21 = v28;
  v20(v14, v28);
  v22 = swift_allocObject();
  v23 = v30;
  *(_QWORD *)(v22 + 16) = v29;
  *(_QWORD *)(v22 + 24) = v23;
  aBlock[4] = sub_1D23E6CD0;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D23E6BDC;
  aBlock[3] = &block_descriptor_6;
  v24 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1D23F2804();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1D23E6CF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C408);
  sub_1D23E6D78();
  v26 = v31;
  v25 = v32;
  sub_1D23F29B4();
  MEMORY[0x1D82353A0](v16, v6, v26, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v26, v25);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v34);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, v21);
}

uint64_t sub_1D23E6BDC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id AnnounceServer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnnounceServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AnnounceServer()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1D23E6CAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D23E6CD0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_1D23E6CF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC7C400;
  if (!qword_1EFC7C400)
  {
    v1 = sub_1D23F27F8();
    result = MEMORY[0x1D8235CF4](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EFC7C400);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8235CDC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1D23E6D78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC7C410;
  if (!qword_1EFC7C410)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFC7C408);
    result = MEMORY[0x1D8235CF4](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EFC7C410);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8235CE8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1D23E6E08(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D23E6E48()
{
  uint64_t v0;

  v0 = sub_1D23F27A4();
  __swift_allocate_value_buffer(v0, qword_1EFC7C420);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFC7C420);
  return sub_1D23F2798();
}

uint64_t ANUserNotificationController.content(announcement:groupAnnouncements:home:threadIdentifier:isReplacement:suspendExpiration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v8 + 217) = a7;
  *(_BYTE *)(v8 + 216) = a6;
  *(_QWORD *)(v8 + 80) = a5;
  *(_QWORD *)(v8 + 88) = v7;
  *(_QWORD *)(v8 + 64) = a3;
  *(_QWORD *)(v8 + 72) = a4;
  *(_QWORD *)(v8 + 48) = a1;
  *(_QWORD *)(v8 + 56) = a2;
  v9 = sub_1D23F269C();
  *(_QWORD *)(v8 + 96) = v9;
  *(_QWORD *)(v8 + 104) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 112) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C458);
  *(_QWORD *)(v8 + 120) = swift_task_alloc();
  *(_QWORD *)(v8 + 128) = swift_task_alloc();
  *(_QWORD *)(v8 + 136) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1D23E6F74()
{
  uint64_t v0;
  void *v1;
  id v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  id v37;
  unsigned int v38;
  id v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  _QWORD *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  id v82;
  uint64_t v83;
  uint8_t *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  id v88;
  id v89;
  uint64_t (__cdecl *v90)();
  _QWORD *v91;
  uint64_t v92;
  unint64_t v93;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_BOOLForDefault_, *MEMORY[0x1E0CF7C30]);

  if (v3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = *(void **)(v0 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C460);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1D23F6430;
    *(_QWORD *)(v5 + 32) = v4;
    v92 = v5;
    sub_1D23F28DC();
    v6 = v4;
  }
  v88 = v1;
  v7 = (void *)objc_opt_self();
  sub_1D23E6E08(0, &qword_1EFC7C468);
  v8 = (void *)sub_1D23F28B8();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_uniqueAnnouncersInAnnouncements_, v8);

  v10 = v9;
  if (!v9)
  {
    sub_1D23E6E08(0, &qword_1EFC7C470);
    sub_1D23F28C4();
    v10 = (void *)sub_1D23F28B8();
    swift_bridgeObjectRelease();
  }
  v11 = *(void **)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = sub_1D23E6E08(0, &qword_1EFC7C470);
  v14 = sub_1D23F28C4();
  v15 = objc_msgSend(v11, sel_contentBodyForAnnouncers_inHome_, v10, v12);

  v85 = sub_1D23F2864();
  v86 = v16;

  if (qword_1EFC7C390 != -1)
    swift_once();
  v17 = sub_1D23F27A4();
  *(_QWORD *)(v0 + 144) = __swift_project_value_buffer(v17, (uint64_t)qword_1EFC7C420);
  swift_bridgeObjectRetain_n();
  v18 = sub_1D23F278C();
  v19 = sub_1D23F2954();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v92 = v21;
    *(_DWORD *)v20 = 136315138;
    v84 = v20 + 4;
    v22 = swift_bridgeObjectRetain();
    v23 = MEMORY[0x1D8235310](v22, v13);
    v25 = v24;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 40) = sub_1D23E92C0(v23, v25, &v92);
    sub_1D23F299C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D23A0000, v18, v19, "Unique Participant Announcers: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8235D54](v21, -1, -1);
    MEMORY[0x1D8235D54](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v26 = *(void **)(v0 + 64);
  v27 = *(id *)(v0 + 48);
  v28 = v26;
  *(_QWORD *)(v0 + 152) = sub_1D23EA13C(v14, v28, v27);
  *(_QWORD *)(v0 + 160) = 0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  v29 = sub_1D23F278C();
  v30 = sub_1D23F2954();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v92 = v32;
    *(_DWORD *)v31 = 136315138;
    v84 = v31 + 4;
    v33 = swift_bridgeObjectRetain();
    v34 = MEMORY[0x1D8235310](v33, &type metadata for Announcer);
    v36 = v35;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = sub_1D23E92C0(v34, v36, &v92);
    sub_1D23F299C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D23A0000, v29, v30, "Announcers: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8235D54](v32, -1, -1);
    MEMORY[0x1D8235D54](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v37 = objc_msgSend(v88, sel_sharedInstance);
  v38 = objc_msgSend(v37, sel_BOOLForDefault_, *MEMORY[0x1E0CF7C28]);

  if (v38 && (v39 = objc_msgSend(*(id *)(v0 + 48), sel_transcriptionText)) != 0)
  {
    v40 = v39;
    sub_1D23F2864();

    v92 = 2230794;
    v93 = 0xE300000000000000;
    sub_1D23F2894();
    swift_bridgeObjectRelease();
    sub_1D23F2894();
    v92 = v85;
    v93 = v86;
    swift_bridgeObjectRetain();
    sub_1D23F2894();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v42 = v92;
    v41 = v93;
  }
  else
  {
    v42 = v85;
    v41 = v86;
  }
  *(_QWORD *)(v0 + 168) = v42;
  *(_QWORD *)(v0 + 176) = v41;
  v43 = *(_QWORD *)(v0 + 136);
  v44 = *(_BYTE *)(v0 + 217);
  *(_QWORD *)(v0 + 184) = sub_1D23EA2C4(*(void **)(v0 + 48), *(_QWORD *)(v0 + 56));
  v45 = sub_1D23F26D8();
  *(_QWORD *)(v0 + 192) = v45;
  v46 = *(_QWORD *)(v45 - 8);
  *(_QWORD *)(v0 + 200) = v46;
  v47 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
  v47(v43, 1, 1, v45);
  if ((v44 & 1) == 0)
  {
    v49 = *(_QWORD *)(v0 + 128);
    v48 = *(_QWORD *)(v0 + 136);
    v50 = objc_msgSend(v88, sel_sharedInstance);
    v51 = objc_msgSend(v50, sel_numberForDefault_, *MEMORY[0x1E0CF7B08]);

    objc_msgSend(v51, sel_doubleValue);
    sub_1D23F26CC();

    sub_1D23EAE0C(v48, &qword_1EFC7C458);
    v47(v49, 0, 1, v45);
    sub_1D23EA8A0(v49, v48);
  }
  if ((*(_BYTE *)(v0 + 216) & 1) != 0)
  {
    v52 = *(void **)(v0 + 64);
    v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEC6E0]), sel_init);
    v54 = objc_msgSend(v52, sel_name);
    if (!v54)
    {
      sub_1D23F2864();
      v54 = (id)sub_1D23F2858();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v53, sel_setTitle_, v54, v84);

    v55 = (void *)sub_1D23F2858();
    objc_msgSend(v53, sel_setCategoryIdentifier_, v55);

    v56 = (void *)sub_1D23F2858();
    swift_bridgeObjectRelease();
    objc_msgSend(v53, sel_setBody_, v56);

    v57 = objc_msgSend((id)objc_opt_self(), sel_defaultSound);
    v87 = *(_QWORD *)(v0 + 200);
    v89 = *(id *)(v0 + 192);
    v58 = *(_QWORD *)(v0 + 136);
    v59 = *(_QWORD *)(v0 + 112);
    v60 = *(_QWORD *)(v0 + 120);
    v62 = *(_QWORD *)(v0 + 96);
    v61 = *(_QWORD *)(v0 + 104);
    v63 = *(void **)(v0 + 48);
    objc_msgSend(v53, sel_setSound_, v57);

    objc_msgSend(v53, sel_setShouldSuppressScreenLightUp_, 0);
    v64 = (void *)sub_1D23F2840();
    swift_bridgeObjectRelease();
    objc_msgSend(v53, sel_setUserInfo_, v64);

    v65 = objc_msgSend(v63, sel_defaultActionURL);
    sub_1D23F2690();

    v66 = (void *)sub_1D23F2684();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v59, v62);
    objc_msgSend(v53, sel_setDefaultActionURL_, v66);

    sub_1D23EB114(v58, v60, &qword_1EFC7C458);
    if ((*(unsigned int (**)(uint64_t, uint64_t, id))(v87 + 48))(v60, 1, v89) == 1)
    {
      v67 = 0;
    }
    else
    {
      v70 = *(_QWORD *)(v0 + 192);
      v71 = *(_QWORD *)(v0 + 200);
      v72 = *(_QWORD *)(v0 + 120);
      v67 = (void *)sub_1D23F26C0();
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v70);
    }
    objc_msgSend(v53, sel_setExpirationDate_, v67);

    v73 = (void *)sub_1D23F2858();
    objc_msgSend(v53, sel_setThreadIdentifier_, v73);

    objc_msgSend(v53, sel_setShouldBackgroundDefaultAction_, 1);
    objc_msgSend(v53, sel_setShouldSuppressDefaultAction_, 1);
    objc_msgSend(v53, sel_setShouldPreventNotificationDismissalAfterDefaultAction_, 1);
    objc_msgSend(v53, sel_setInterruptionLevel_, 2);
    if ((objc_msgSend((id)objc_opt_self(), sel_isCommunicationUserNotificationsEnabled) & 1) == 0)
    {
      v74 = (void *)sub_1D23F2858();
      objc_msgSend(v53, sel_setAccessoryImageName_, v74);

    }
    v75 = *(void **)(v0 + 160);
    v76 = sub_1D23EF5CC(*(_QWORD *)(v0 + 152));
    if (v75)
    {
      swift_bridgeObjectRelease();
      v77 = v75;
      v78 = v75;
      v79 = sub_1D23F278C();
      v80 = sub_1D23F2948();
      if (os_log_type_enabled(v79, v80))
      {
        v81 = (uint8_t *)swift_slowAlloc();
        v91 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v81 = 138412290;
        v82 = v75;
        v83 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 24) = v83;
        sub_1D23F299C();
        *v91 = v83;

        _os_log_impl(&dword_1D23A0000, v79, v80, "Failed to create updated content with intent. %@", v81, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
        swift_arrayDestroy();
        MEMORY[0x1D8235D54](v91, -1, -1);
        MEMORY[0x1D8235D54](v81, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      swift_bridgeObjectRelease();

      v53 = v76;
    }
    sub_1D23EAE0C(*(_QWORD *)(v0 + 136), &qword_1EFC7C458);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(id))(v0 + 8))(v53);
  }
  else
  {
    v90 = (uint64_t (__cdecl *)())((char *)&dword_1EFC7C478 + dword_1EFC7C478);
    v68 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v68;
    *v68 = v0;
    v68[1] = sub_1D23E7B90;
    return v90();
  }
}

uint64_t sub_1D23E7B90(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 218) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D23E7BEC()
{
  uint64_t v0;
  int v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v1 = *(unsigned __int8 *)(v0 + 218);
  v2 = *(void **)(v0 + 64);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEC6E0]), sel_init);
  v4 = objc_msgSend(v2, sel_name);
  if (!v4)
  {
    sub_1D23F2864();
    v4 = (id)sub_1D23F2858();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v3, sel_setTitle_, v4);

  v5 = (void *)sub_1D23F2858();
  objc_msgSend(v3, sel_setCategoryIdentifier_, v5);

  v6 = (void *)sub_1D23F2858();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setBody_, v6);

  v7 = v1 ^ 1u;
  if (v1)
    v8 = objc_msgSend((id)objc_opt_self(), sel_defaultSound);
  else
    v8 = 0;
  v35 = *(_QWORD *)(v0 + 200);
  v36 = *(_QWORD *)(v0 + 192);
  v34 = *(_QWORD *)(v0 + 136);
  v10 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 120);
  v12 = *(_QWORD *)(v0 + 96);
  v11 = *(_QWORD *)(v0 + 104);
  v13 = *(void **)(v0 + 48);
  objc_msgSend(v3, sel_setSound_, v8);

  objc_msgSend(v3, sel_setShouldSuppressScreenLightUp_, v7);
  v14 = (void *)sub_1D23F2840();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setUserInfo_, v14);

  v15 = objc_msgSend(v13, sel_defaultActionURL);
  sub_1D23F2690();

  v16 = (void *)sub_1D23F2684();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  objc_msgSend(v3, sel_setDefaultActionURL_, v16);

  sub_1D23EB114(v34, v9, &qword_1EFC7C458);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v9, 1, v36) == 1)
  {
    v17 = 0;
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 192);
    v19 = *(_QWORD *)(v0 + 200);
    v20 = *(_QWORD *)(v0 + 120);
    v17 = (void *)sub_1D23F26C0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
  }
  objc_msgSend(v3, sel_setExpirationDate_, v17);

  v21 = (void *)sub_1D23F2858();
  objc_msgSend(v3, sel_setThreadIdentifier_, v21);

  objc_msgSend(v3, sel_setShouldBackgroundDefaultAction_, 1);
  objc_msgSend(v3, sel_setShouldSuppressDefaultAction_, 1);
  objc_msgSend(v3, sel_setShouldPreventNotificationDismissalAfterDefaultAction_, 1);
  objc_msgSend(v3, sel_setInterruptionLevel_, 2);
  if ((objc_msgSend((id)objc_opt_self(), sel_isCommunicationUserNotificationsEnabled) & 1) == 0)
  {
    v22 = (void *)sub_1D23F2858();
    objc_msgSend(v3, sel_setAccessoryImageName_, v22);

  }
  v23 = *(void **)(v0 + 160);
  v24 = sub_1D23EF5CC(*(_QWORD *)(v0 + 152));
  if (v23)
  {
    swift_bridgeObjectRelease();
    v25 = v23;
    v26 = v23;
    v27 = sub_1D23F278C();
    v28 = sub_1D23F2948();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v29 = 138412290;
      v31 = v23;
      v32 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 24) = v32;
      sub_1D23F299C();
      *v30 = v32;

      _os_log_impl(&dword_1D23A0000, v27, v28, "Failed to create updated content with intent. %@", v29, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
      swift_arrayDestroy();
      MEMORY[0x1D8235D54](v30, -1, -1);
      MEMORY[0x1D8235D54](v29, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    swift_bridgeObjectRelease();

    v3 = v24;
  }
  sub_1D23EAE0C(*(_QWORD *)(v0 + 136), &qword_1EFC7C458);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v3);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1D23E82AC(void *a1, int a2, void *a3, int a4, char a5, char a6, void *aBlock, void *a8)
{
  _QWORD *v8;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD *v20;

  v8[3] = a3;
  v8[4] = a8;
  v8[2] = a1;
  v8[5] = _Block_copy(aBlock);
  sub_1D23E6E08(0, &qword_1EFC7C468);
  v14 = sub_1D23F28C4();
  v8[6] = v14;
  v15 = sub_1D23F2864();
  v17 = v16;
  v8[7] = v16;
  v18 = a1;
  v19 = a3;
  a8;
  v20 = (_QWORD *)swift_task_alloc();
  v8[8] = v20;
  *v20 = v8;
  v20[1] = sub_1D23E83BC;
  return ANUserNotificationController.content(announcement:groupAnnouncements:home:threadIdentifier:isReplacement:suspendExpiration:)((uint64_t)v18, v14, (uint64_t)v19, v15, v17, a5, a6);
}

uint64_t sub_1D23E83BC(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 40);
  v5 = *(void **)(*v1 + 24);
  v4 = *(void **)(*v1 + 32);
  v6 = *(void **)(*v1 + 16);
  v8 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v8 + 8))();
}

unint64_t sub_1D23E8464(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C508);
  v2 = sub_1D23F2A80();
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
    sub_1D23EB114(v6, (uint64_t)v15, &qword_1EFC7C510);
    result = sub_1D23EF34C((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_1D23EB094(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

void sub_1D23E85A4(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x1D823543C](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      sub_1D23E6E08(0, &qword_1EFC7C468);
      v6 = sub_1D23F2978();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v11 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v11 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v8 = (id)MEMORY[0x1D823543C](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_18;
            if (v11 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_19;
            v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          v9 = v8;
          v10 = sub_1D23F2978();

          if ((v10 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        v3 = sub_1D23F2A5C();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

uint64_t sub_1D23E873C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  *(_QWORD *)(v1 + 40) = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_1D23E8780()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4E0);
  *v2 = v0;
  v2[1] = sub_1D23E882C;
  return sub_1D23F2AB0();
}

uint64_t sub_1D23E882C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D23E8898()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1D23E88AC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1D23E88E4()
{
  uint64_t v0;

  v0 = sub_1D23F27A4();
  __swift_allocate_value_buffer(v0, qword_1EFC7C438);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFC7C438);
  return sub_1D23F2798();
}

id sub_1D23E8964(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4E8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EFC7C398 != -1)
    swift_once();
  v10 = sub_1D23F27A4();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EFC7C438);
  v11 = sub_1D23F278C();
  v12 = sub_1D23F2954();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D23A0000, v11, v12, "Checking if best device to alert", v13, 2u);
    MEMORY[0x1D8235D54](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v15 = (v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v14, v9, v6);
  *(_QWORD *)(v16 + v15) = a2;
  *(_QWORD *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_1D23EAFC4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D23E8F80;
  aBlock[3] = &block_descriptor_0;
  v17 = _Block_copy(aBlock);
  v18 = a2;
  swift_release();
  objc_msgSend(v18, sel_setCompletionHandler_, v17);
  _Block_release(v17);
  return objc_msgSend(v18, sel_start);
}

id sub_1D23E8B84(void *a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28[2];

  if (qword_1EFC7C398 != -1)
    swift_once();
  v9 = sub_1D23F27A4();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EFC7C438);
  v10 = sub_1D23F278C();
  v11 = sub_1D23F2954();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v12 = 67240192;
    LODWORD(v28[0]) = a2 & 1;
    sub_1D23F299C();
    _os_log_impl(&dword_1D23A0000, v10, v11, "Best device: %{BOOL,public}d", v12, 8u);
    MEMORY[0x1D8235D54](v12, -1, -1);
  }

  if (a1)
  {
    v13 = a1;
    v14 = a1;
    v15 = a1;
    v16 = sub_1D23F278C();
    v17 = sub_1D23F2948();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v18 = 138412290;
      v20 = a1;
      v28[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_1D23F299C();
      *v19 = v28[0];

      _os_log_impl(&dword_1D23A0000, v16, v17, "Scan error: %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
      swift_arrayDestroy();
      MEMORY[0x1D8235D54](v19, -1, -1);
      MEMORY[0x1D8235D54](v18, -1, -1);
    }
    else
    {

    }
    swift_bridgeObjectRetain_n();
    v21 = sub_1D23F278C();
    v22 = sub_1D23F293C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v28[0] = v24;
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4F0);
      v25 = sub_1D23F2870();
      sub_1D23E92C0(v25, v26, v28);
      sub_1D23F299C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D23A0000, v21, v22, "Info dictionary: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D8235D54](v24, -1, -1);
      MEMORY[0x1D8235D54](v23, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v28[0] = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4E8);
    sub_1D23F290C();
  }
  else
  {
    LOBYTE(v28[0]) = a2 & 1;
    v28[1] = a3;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4E8);
    sub_1D23F2918();
  }
  return objc_msgSend(a5, sel_invalidate);
}

uint64_t sub_1D23E8F80(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void (*v6)(void *, uint64_t, uint64_t);
  uint64_t v7;
  id v8;

  v6 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  if (a4)
    v7 = sub_1D23F284C();
  else
    v7 = 0;
  swift_retain();
  v8 = a2;
  v6(a2, a3, v7);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1D23E901C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1D23EB158;
  return v6();
}

uint64_t sub_1D23E9070(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1D23EB158;
  return v7();
}

uint64_t sub_1D23E90C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D23F2930();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D23F2924();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1D23EAE0C(a1, &qword_1EFC7C488);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D23F2900();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D23E9210(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D23E9274;
  return v6(a1);
}

uint64_t sub_1D23E9274()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D23E92C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1D23E9390(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1D23EAEFC((uint64_t)v12, *a3);
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
      sub_1D23EAEFC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1D23E9390(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1D23F29A8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1D23E9548(a5, a6);
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
  v8 = sub_1D23F2A08();
  if (!v8)
  {
    sub_1D23F2A50();
    __break(1u);
LABEL_17:
    result = sub_1D23F2A8C();
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

uint64_t sub_1D23E9548(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1D23E95DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1D23E97B4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1D23E97B4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D23E95DC(uint64_t a1, unint64_t a2)
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
      v3 = sub_1D23E9750(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1D23F29F0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1D23F2A50();
      __break(1u);
LABEL_10:
      v2 = sub_1D23F28A0();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1D23F2A8C();
    __break(1u);
LABEL_14:
    result = sub_1D23F2A50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1D23E9750(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4D0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D23E97B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4D0);
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
  result = sub_1D23F2A8C();
  __break(1u);
  return result;
}

uint64_t sub_1D23E9900(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1D23E991C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1D23E991C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C518);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 48 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1D23F2A8C();
  __break(1u);
  return result;
}

uint64_t sub_1D23E9A94(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C508);
  v6 = sub_1D23F2A74();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_1D23EB094((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1D23EB0D8(v25, (uint64_t)&v38);
      sub_1D23EAEFC(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_1D23F29C0();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_1D23EB094(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_1D23E9DA8(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1D23EF34C(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
        return sub_1D23EB094(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1D23E9F58();
      goto LABEL_7;
    }
    sub_1D23E9A94(v13, a3 & 1);
    v19 = sub_1D23EF34C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1D23EB0D8(a2, (uint64_t)v21);
      return sub_1D23E9EE0(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_1D23F2ABC();
  __break(1u);
  return result;
}

_OWORD *sub_1D23E9EE0(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_1D23EB094(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_1D23E9F58()
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
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C508);
  v2 = *v0;
  v3 = sub_1D23F2A68();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_1D23EB0D8(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1D23EAEFC(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1D23EB094(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1D23EA13C(unint64_t a1, void *a2, void *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  __int128 v20;
  _OWORD v21[2];
  uint64_t v22;

  v4 = v3;
  if (a1 >> 62)
    goto LABEL_15;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v8 = MEMORY[0x1E0DEE9D8];
    if (!v7)
      return v8;
    v22 = MEMORY[0x1E0DEE9D8];
    result = sub_1D23E9900(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
      break;
    v18 = v4;
    v10 = 0;
    v8 = v22;
    v4 = a1 & 0xC000000000000001;
    while (v7 != v10)
    {
      if (v4)
        v11 = (id)MEMORY[0x1D823543C](v10, a1);
      else
        v11 = *(id *)(a1 + 8 * v10 + 32);
      v12 = v11;
      sub_1D23EB3B0(a2, (uint64_t)objc_msgSend(a3, sel_productType, v18), (uint64_t)&v20);

      v22 = v8;
      v14 = *(_QWORD *)(v8 + 16);
      v13 = *(_QWORD *)(v8 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_1D23E9900(v13 > 1, v14 + 1, 1);
        v8 = v22;
      }
      ++v10;
      *(_QWORD *)(v8 + 16) = v14 + 1;
      v15 = (_OWORD *)(v8 + 48 * v14);
      v16 = v20;
      v17 = v21[0];
      *(_OWORD *)((char *)v15 + 57) = *(_OWORD *)((char *)v21 + 9);
      v15[2] = v16;
      v15[3] = v17;
      if (v7 == v10)
        return v8;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v7 = sub_1D23F2A5C();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1D23EA2C4(void *a1, unint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t result;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t i;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  _OWORD v41[2];
  __int128 v42;
  uint64_t v43;
  _BYTE v44[40];

  v4 = (void *)sub_1D23E8464(MEMORY[0x1E0DEE9D8]);
  sub_1D23F2864();
  *((_QWORD *)&v42 + 1) = v5;
  v6 = MEMORY[0x1E0DEA968];
  sub_1D23F29D8();
  v43 = MEMORY[0x1E0DEBB98];
  *(_QWORD *)&v42 = 0;
  sub_1D23EB094(&v42, v41);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1D23E9DA8(v41, (uint64_t)v44, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_1D23EB0A4((uint64_t)v44);
  *(_QWORD *)&v42 = sub_1D23F2864();
  *((_QWORD *)&v42 + 1) = v8;
  sub_1D23F29D8();
  v9 = objc_msgSend((id)objc_opt_self(), sel_shared);
  v10 = objc_msgSend(v9, sel_allHomes);

  sub_1D23E6E08(0, &qword_1EFC7C4F8);
  v11 = sub_1D23F28C4();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_1D23F2A5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  v13 = MEMORY[0x1E0DEB418];
  v43 = MEMORY[0x1E0DEB418];
  *(_QWORD *)&v42 = v12;
  sub_1D23EB094(&v42, v41);
  v14 = swift_isUniquelyReferenced_nonNull_native();
  sub_1D23E9DA8(v41, (uint64_t)v44, v14);
  swift_bridgeObjectRelease();
  sub_1D23EB0A4((uint64_t)v44);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1D23F2A5C();
    v15 = (void *)result;
    if (result)
      goto LABEL_5;
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v15 = *(void **)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v15)
    goto LABEL_11;
LABEL_5:
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_26:
    v17 = (id)MEMORY[0x1D823543C](0, a2);
  }
  else
  {
    if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    v17 = *(id *)(a2 + 32);
  }
  v18 = v17;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v42 = sub_1D23F2864();
  *((_QWORD *)&v42 + 1) = v19;
  sub_1D23F29D8();
  v20 = objc_msgSend(v18, sel_remoteSessionDictionary);
  v21 = sub_1D23F284C();

  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C500);
  *(_QWORD *)&v42 = v21;
  sub_1D23EB094(&v42, v41);
  v22 = swift_isUniquelyReferenced_nonNull_native();
  sub_1D23E9DA8(v41, (uint64_t)v44, v22);
  swift_bridgeObjectRelease();
  sub_1D23EB0A4((uint64_t)v44);

LABEL_12:
  *(_QWORD *)&v42 = sub_1D23F2864();
  *((_QWORD *)&v42 + 1) = v23;
  sub_1D23F29D8();
  v24 = objc_msgSend(a1, sel_identifier);
  v25 = sub_1D23F2864();
  v27 = v26;

  v43 = v6;
  *(_QWORD *)&v42 = v25;
  *((_QWORD *)&v42 + 1) = v27;
  sub_1D23EB094(&v42, v41);
  v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_1D23E9DA8(v41, (uint64_t)v44, v28);
  v6 = (uint64_t)v4;
  swift_bridgeObjectRelease();
  sub_1D23EB0A4((uint64_t)v44);
  if (v15)
  {
    swift_bridgeObjectRetain();
    for (i = 4; ; ++i)
    {
      if ((a2 & 0xC000000000000001) != 0)
        v30 = (id)MEMORY[0x1D823543C](i - 4, a2);
      else
        v30 = *(id *)(a2 + 8 * i);
      v4 = v30;
      a1 = (void *)(i - 3);
      if (__OFADD__(i - 4, 1))
      {
        __break(1u);
        goto LABEL_26;
      }
      if (!objc_msgSend(v30, sel_hasPlayed))
        break;

      if (a1 == v15)
      {
        swift_bridgeObjectRelease();
        return v6;
      }
    }
    swift_bridgeObjectRelease();
    v31 = v4;
    v32 = objc_msgSend(v31, sel_remoteSessionDictionary);
    v33 = sub_1D23F284C();

    sub_1D23E85A4((uint64_t)v31, a2);
    if ((v35 & 1) == 0)
    {
      v36 = v34;
      *(_QWORD *)&v42 = sub_1D23F2864();
      *((_QWORD *)&v42 + 1) = v37;
      sub_1D23F29D8();
      v43 = v13;
      *(_QWORD *)&v42 = v36;
      sub_1D23EB094(&v42, v41);
      v38 = swift_isUniquelyReferenced_nonNull_native();
      sub_1D23E9DA8(v41, (uint64_t)v44, v38);
      swift_bridgeObjectRelease();
      sub_1D23EB0A4((uint64_t)v44);
    }
    *(_QWORD *)&v42 = sub_1D23F2864();
    *((_QWORD *)&v42 + 1) = v39;
    sub_1D23F29D8();
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C500);
    *(_QWORD *)&v42 = v33;
    sub_1D23EB094(&v42, v41);
    v40 = swift_isUniquelyReferenced_nonNull_native();
    sub_1D23E9DA8(v41, (uint64_t)v44, v40);
    swift_bridgeObjectRelease();
    sub_1D23EB0A4((uint64_t)v44);

  }
  return v6;
}

uint64_t sub_1D23EA8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D23EA8E8()
{
  return swift_task_switch();
}

uint64_t sub_1D23EA8FC()
{
  uint64_t v0;
  id v1;
  unsigned __int8 v2;
  id v3;
  _QWORD *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v2 = objc_msgSend(v1, sel_BOOLForDefault_, *MEMORY[0x1E0CF7C08]);

  if ((v2 & 1) != 0)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D97428]), sel_init);
    *(_QWORD *)(v0 + 16) = v3;
    objc_msgSend(v3, sel_setType_, 4);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v4;
    *v4 = v0;
    v4[1] = sub_1D23EAAAC;
    v4[4] = v3;
    v4[5] = swift_getObjectType();
    return swift_task_switch();
  }
  else
  {
    if (qword_1EFC7C390 != -1)
      swift_once();
    v6 = sub_1D23F27A4();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EFC7C420);
    v7 = sub_1D23F278C();
    v8 = sub_1D23F2954();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D23A0000, v7, v8, "Coordinated Alerts disabled", v9, 2u);
      MEMORY[0x1D8235D54](v9, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
  }
}

uint64_t sub_1D23EAAAC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_BYTE *)(v4 + 40) = a1 & 1;
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1D23EAB30()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 40));
}

uint64_t sub_1D23EAB64()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_1D23EABA4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 56));
  return swift_deallocObject();
}

uint64_t sub_1D23EABF0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  v2 = *(void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(void **)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v6 = *(_BYTE *)(v0 + 48);
  v7 = *(_BYTE *)(v0 + 49);
  v9 = *(void **)(v0 + 56);
  v8 = *(void **)(v0 + 64);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_1D23EB158;
  return ((uint64_t (*)(void *, int, void *, int, char, char, void *, void *))((char *)&dword_1EFC7C490
                                                                                       + dword_1EFC7C490))(v2, v3, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1D23EAC98()
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
  v5[1] = sub_1D23EB158;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EFC7C4A0 + dword_1EFC7C4A0))(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D23EAD40(uint64_t a1)
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
  v7[1] = sub_1D23EADC4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFC7C4B0 + dword_1EFC7C4B0))(a1, v4, v5, v6);
}

uint64_t sub_1D23EADC4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D23EAE0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D23EAE48()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D23EAE6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D23EADC4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFC7C4C0 + dword_1EFC7C4C0))(a1, v4);
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

uint64_t sub_1D23EAEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_1D23EAF3C(uint64_t a1)
{
  uint64_t v1;

  return sub_1D23E8964(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1D23EAF44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4E8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

id sub_1D23EAFC4(void *a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;

  v7 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C4E8) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return sub_1D23E8B84(a1, a2, a3, v3 + v8, *(void **)(v3 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8)));
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

_OWORD *sub_1D23EB094(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1D23EB0A4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1D23EB0D8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1D23EB114(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id sub_1D23EB160()
{
  unint64_t v0;
  void *v1;

  sub_1D23E6E08(0, &qword_1EFC7C468);
  v0 = sub_1D23F28C4();
  _sSo14ANAnnouncementC14AnnounceDaemonE8contexts4fromSaySo0A7ContextCGSayABG_tFZ_0(v0);
  swift_bridgeObjectRelease();
  sub_1D23E6E08(0, &qword_1EFC7C520);
  v1 = (void *)sub_1D23F28B8();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t _sSo14ANAnnouncementC14AnnounceDaemonE8contexts4fromSaySo0A7ContextCGSayABG_tFZ_0(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;

  v1 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1D23F2A5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    result = sub_1D23F2A2C();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      v4 = 0;
      v11 = v1 & 0xC000000000000001;
      v5 = v1;
      do
      {
        if (v11)
          v6 = (id)MEMORY[0x1D823543C](v4, v1);
        else
          v6 = *(id *)(v1 + 8 * v4 + 32);
        v7 = v6;
        ++v4;
        v8 = objc_msgSend(v6, sel_remoteSessionDictionary, v11);
        sub_1D23F284C();

        v9 = objc_allocWithZone(MEMORY[0x1E0CF7E08]);
        v10 = (void *)sub_1D23F2840();
        swift_bridgeObjectRelease();
        objc_msgSend(v9, sel_initWithDictionary_, v10);

        sub_1D23F2A14();
        sub_1D23F2A38();
        sub_1D23F2A44();
        sub_1D23F2A20();
        v1 = v5;
      }
      while (v2 != v4);
      return v12;
    }
  }
  return result;
}

void sub_1D23EB3B0(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  unsigned int v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;

  v7 = objc_msgSend(v3, sel_isUser);
  v8 = v7;
  if (v7)
  {
    v9 = 0xEB000000006C6C69;
    v10 = 0x662E6E6F73726570;
    v11 = sub_1D23EB5B8(a1);
    v13 = v12;
    v14 = sub_1D23EB784(a1);
    if (v14)
    {
      v15 = v14;
      v16 = objc_msgSend(v14, sel_imageData);
      if (v16)
      {
        v17 = v16;
        v18 = sub_1D23F26B4();
        v20 = v19;

        sub_1D23EBEB0(v18, v20);
        v9 = 0;
        v21 = 0;
        v10 = (unint64_t)v15;
      }
      else
      {

        v21 = 1;
      }
    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
    v11 = sub_1D23EB9C8(a1);
    v13 = v22;
    if (a2 == 3348380076)
    {
      v9 = 0x80000001D23F8B30;
      v21 = 1;
      v10 = 0xD000000000000011;
    }
    else
    {
      v9 = 0xEC0000006C6C6966;
      v21 = 1;
      v10 = 0x2E646F70656D6F68;
    }
  }
  *(_QWORD *)a3 = v11;
  *(_QWORD *)(a3 + 8) = v13;
  *(_BYTE *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v10;
  *(_QWORD *)(a3 + 32) = v9;
  *(_BYTE *)(a3 + 40) = v21;
}

uint64_t sub_1D23EB54C()
{
  uint64_t result;

  result = sub_1D23EBDD8();
  qword_1EFC7C528 = result;
  return result;
}

void sub_1D23EB56C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D23EB59C()
{
  sub_1D23F2750();
  return swift_deallocClassInstance();
}

uint64_t sub_1D23EB5B8(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v3 = objc_msgSend(v1, sel_homeKitID);
  if (!v3)
    goto LABEL_12;
  v4 = v3;
  v5 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v3);

  if (!v5 || (v6 = objc_msgSend(v5, sel_userID)) == 0)
  {
    v6 = objc_msgSend(v1, sel_userID);
    if (!v6)
      goto LABEL_10;
  }
  sub_1D23F2864();

  if (qword_1EFC7C3A0 != -1)
    swift_once();
  v7 = sub_1D23F2738();
  v9 = v8;
  swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_10:
    if (v5)
    {
      v10 = objc_msgSend(v5, sel_name);
      v7 = sub_1D23F2864();

LABEL_13:
      return v7;
    }
LABEL_12:
    v11 = (void *)sub_1D23F2858();
    v10 = (id)ANLocalizedString();

    v7 = sub_1D23F2864();
    goto LABEL_13;
  }

  return v7;
}

id sub_1D23EB784(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v3 = objc_msgSend(v1, sel_homeKitID);
  if (!v3)
    return 0;
  v4 = v3;
  sub_1D23F2864();

  v5 = (void *)sub_1D23F2858();
  v6 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v5);

  if (v6)
  {
    swift_bridgeObjectRelease();
    v7 = v6;
  }
  else
  {
    v10 = objc_msgSend(v1, sel_homeKitUserID);
    if (!v10)
    {
      swift_bridgeObjectRelease();
      v7 = 0;
      goto LABEL_10;
    }
    v11 = v10;
    v7 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v10);
    swift_bridgeObjectRelease();

    if (!v7)
      goto LABEL_10;
    v7 = v7;
  }
  v8 = v6;
  v9 = objc_msgSend(v7, sel_userID);

  if (!v9)
  {
LABEL_10:
    v9 = objc_msgSend(v1, sel_userID);
    if (!v9)
      goto LABEL_14;
  }
  sub_1D23F2864();

  if (qword_1EFC7C3A0 != -1)
    swift_once();
  v12 = (id)sub_1D23F2744();
  swift_bridgeObjectRelease();
  if (v12)
    goto LABEL_16;
LABEL_14:
  if (!v7)
    return 0;
  v13 = objc_msgSend(v7, sel_name);
  sub_1D23F2864();

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97360]), sel_init);
  v14 = (void *)sub_1D23F2858();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setFirstName_, v14);

LABEL_16:
  return v12;
}

uint64_t sub_1D23EB9C8(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = objc_msgSend(v1, sel_homeKitID);
  if (!v3)
    goto LABEL_16;
  v4 = v3;
  v5 = objc_msgSend(v1, sel_homeKitUserID);
  if (!v5)
  {
LABEL_13:
    v13 = objc_msgSend(a1, sel_hmu_accessoryWithUniqueIdentifierUUIDString_, v4);

    if (v13)
    {
      v14 = objc_msgSend(v13, sel_room);

      if (v14)
      {
        v15 = objc_msgSend(v14, sel_name);
LABEL_17:
        v16 = v15;

        v9 = sub_1D23F2864();
        return v9;
      }
    }
LABEL_16:
    v14 = (id)sub_1D23F2858();
    v15 = (id)ANLocalizedString();
    goto LABEL_17;
  }
  v6 = v5;
  v7 = objc_msgSend(a1, sel_hmu_userWithUniqueIdentifierUUIDString_, v5);

  if (!v7 || (v8 = objc_msgSend(v7, sel_userID)) == 0)
  {
    v8 = objc_msgSend(v1, sel_userID);
    if (!v8)
      goto LABEL_11;
  }
  sub_1D23F2864();

  if (qword_1EFC7C3A0 != -1)
    swift_once();
  v9 = sub_1D23F2738();
  v11 = v10;
  swift_bridgeObjectRelease();
  if (!v11)
  {
LABEL_11:
    if (v7)
    {
      v12 = objc_msgSend(v7, sel_name);
      v9 = sub_1D23F2864();

      return v9;
    }
    goto LABEL_13;
  }

  return v9;
}

Swift::String __swiftcall ANParticipant.name(in:)(HMHome in)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Swift::String result;

  v3 = objc_msgSend(v1, sel_name);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1D23F2864();
    v7 = v6;

    v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0)
      v8 = v5 & 0xFFFFFFFFFFFFLL;
    if (v8)
    {
      v9 = v5;
      v10 = (void *)v7;
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
  }
  if (objc_msgSend(v1, sel_isAccessory))
    v9 = sub_1D23EB9C8(in.super.isa);
  else
    v9 = sub_1D23EB5B8(in.super.isa);
LABEL_10:
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

uint64_t type metadata accessor for ANContactStore()
{
  uint64_t result;

  result = qword_1EFC7C540;
  if (!qword_1EFC7C540)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D23EBD2C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1D23EBD68()
{
  return type metadata accessor for ANContactStore();
}

id sub_1D23EBD70(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a1;
  ANParticipant.name(in:)((HMHome)v4);

  v6 = (void *)sub_1D23F2858();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1D23EBDD8()
{
  id v0;
  uint64_t v1;
  uint64_t v2;

  type metadata accessor for ANContactStore();
  swift_allocObject();
  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C972A0]), sel_init);
  sub_1D23F2864();
  sub_1D23F287C();
  swift_bridgeObjectRelease();
  v1 = tcc_identity_create();
  swift_release();
  objc_msgSend(v0, sel_setAssumedIdentity_, v1);
  swift_unknownObjectRelease();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_initWithConfiguration_, v0);
  v2 = sub_1D23F272C();

  return v2;
}

uint64_t sub_1D23EBEB0(uint64_t a1, unint64_t a2)
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

void sub_1D23EBEF4(uint64_t a1)
{
  sub_1D23EC0F8(a1, (void **)&protocolRef_ANTonePlayerServiceInterface, &qword_1EFC7C590);
}

id static NSXPCInterface.tonePlayerServiceInterface.getter()
{
  return sub_1D23EBF70(&qword_1EFC7C3A8, (id *)&qword_1EFC7C590);
}

id sub_1D23EBF24(uint64_t a1, uint64_t a2)
{
  return sub_1D23EBFC4(a1, a2, &qword_1EFC7C3A8, (id *)&qword_1EFC7C590);
}

void sub_1D23EBF40(uint64_t a1)
{
  sub_1D23EC0F8(a1, (void **)&protocolRef_ANLocalPlaybackSessionServiceInterface, &qword_1ED947818);
}

id static NSXPCInterface.localPlaybackSessionServiceInterface.getter()
{
  return sub_1D23EBF70(qword_1ED947820, (id *)&qword_1ED947818);
}

id sub_1D23EBF70(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id sub_1D23EBFA8(uint64_t a1, uint64_t a2)
{
  return sub_1D23EBFC4(a1, a2, qword_1ED947820, (id *)&qword_1ED947818);
}

id sub_1D23EBFC4(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4)
{
  if (*a3 != -1)
    swift_once();
  return *a4;
}

void sub_1D23EC000(uint64_t a1)
{
  sub_1D23EC0F8(a1, (void **)&protocolRef_ANLocalPlaybackSessionServiceInterfaceDelegate, &qword_1ED947830);
}

id static NSXPCInterface.localPlaybackSessionServiceDelegateInterface.getter()
{
  return sub_1D23EBF70(&qword_1ED947838, (id *)&qword_1ED947830);
}

id sub_1D23EC030(uint64_t a1, uint64_t a2)
{
  return sub_1D23EBFC4(a1, a2, &qword_1ED947838, (id *)&qword_1ED947830);
}

void sub_1D23EC04C(uint64_t a1)
{
  sub_1D23EC0F8(a1, (void **)&protocolRef_ANRemotePlaybackSessionServiceInterface, &qword_1EFC7C598);
}

id static NSXPCInterface.remotePlaybackSessionServiceInterface.getter()
{
  return sub_1D23EBF70(&qword_1EFC7C3B0, (id *)&qword_1EFC7C598);
}

id sub_1D23EC07C(uint64_t a1, uint64_t a2)
{
  return sub_1D23EBFC4(a1, a2, &qword_1EFC7C3B0, (id *)&qword_1EFC7C598);
}

void sub_1D23EC098(uint64_t a1)
{
  sub_1D23EC0F8(a1, (void **)&protocolRef_ANRemotePlaybackSessionServiceClientInterface, &qword_1EFC7C5A0);
}

id static NSXPCInterface.remotePlaybackSessionServiceDelegateInterface.getter()
{
  return sub_1D23EBF70(&qword_1EFC7C3B8, (id *)&qword_1EFC7C5A0);
}

id sub_1D23EC0C8(uint64_t a1, uint64_t a2)
{
  return sub_1D23EBFC4(a1, a2, &qword_1EFC7C3B8, (id *)&qword_1EFC7C5A0);
}

void sub_1D23EC0E4(uint64_t a1)
{
  sub_1D23EC0F8(a1, (void **)&protocolRef_ANAnnounceServiceInterface, &qword_1EFC7C5A8);
}

void sub_1D23EC0F8(uint64_t a1, void **a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *a2;
  v5 = (void *)objc_opt_self();
  v6 = v4;
  v7 = objc_msgSend(v5, sel_interfaceWithProtocol_, v6);

  *a3 = v7;
}

id static NSXPCInterface.announceServiceInterface.getter()
{
  return sub_1D23EBF70(&qword_1EFC7C3C0, (id *)&qword_1EFC7C5A8);
}

id sub_1D23EC17C(uint64_t a1, uint64_t a2)
{
  return sub_1D23EBFC4(a1, a2, &qword_1EFC7C3C0, (id *)&qword_1EFC7C5A8);
}

uint64_t sub_1D23EC198(void *a1)
{
  id v1;
  char isAnnounce;

  v1 = a1;
  isAnnounce = HMAccessory.an_isAnnounceEnabled.getter();

  return isAnnounce & 1;
}

uint64_t HMAccessory.an_isAnnounceEnabled.getter()
{
  void *v0;
  char v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  id v9;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  NSObject *v21;
  _QWORD *v23;
  unsigned __int8 v24;

  v24 = 0;
  if (!objc_msgSend(v0, sel_hmu_isEndpoint) && (v1 = sub_1D23EC958(), v1 != 2)
    || (v1 = sub_1D23EC690(), v1 != 2))
  {
    v24 = v1 & 1;
  }
  if (qword_1EFC7C3C8 != -1)
    swift_once();
  v2 = sub_1D23F27A4();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EFC7CE08);
  v3 = v0;
  v4 = sub_1D23F278C();
  v5 = sub_1D23F2954();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412546;
    v8 = v3;
    sub_1D23F299C();
    *v7 = v3;

    *(_WORD *)(v6 + 12) = 1024;
    swift_beginAccess();
    sub_1D23F299C();
    _os_log_impl(&dword_1D23A0000, v4, v5, "Announce Enabled Setting For Accessory %@: %{BOOL}d", (uint8_t *)v6, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
    swift_arrayDestroy();
    MEMORY[0x1D8235D54](v7, -1, -1);
    MEMORY[0x1D8235D54](v6, -1, -1);

  }
  else
  {

  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v10 = objc_msgSend(v9, sel_BOOLForDefault_, *MEMORY[0x1E0CF7B50]);

  if (v10)
  {
    v11 = v3;
    v12 = sub_1D23F278C();
    v13 = sub_1D23F2954();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      v15 = v11;
      sub_1D23F299C();
      *v23 = v11;

      _os_log_impl(&dword_1D23A0000, v12, v13, "[Override] Force Allow Announce For Accessory %@ Enabled", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
      swift_arrayDestroy();
      MEMORY[0x1D8235D54](v23, -1, -1);
      MEMORY[0x1D8235D54](v14, -1, -1);
    }
    else
    {

      v12 = v11;
    }

    swift_beginAccess();
    v24 = 1;
  }
  swift_beginAccess();
  if ((v24 & 1) == 0)
  {
    v16 = v3;
    v17 = sub_1D23F278C();
    v18 = sub_1D23F2954();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v19 = 138412290;
      v21 = v16;
      sub_1D23F299C();
      *v20 = v16;

      _os_log_impl(&dword_1D23A0000, v17, v18, "Announce is DISABLED For Accessory %@", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
      swift_arrayDestroy();
      MEMORY[0x1D8235D54](v20, -1, -1);
      MEMORY[0x1D8235D54](v19, -1, -1);
    }
    else
    {

      v17 = v16;
    }

  }
  return v24;
}

uint64_t sub_1D23EC690()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;

  v1 = objc_msgSend((id)objc_opt_self(), sel_shared);
  v2 = objc_msgSend(v1, sel_accessorySettingsCache);

  v3 = objc_msgSend(v2, sel_settingsForAccessory_, v0);
  if (!v3)
  {
    if (qword_1EFC7C3C8 != -1)
      swift_once();
    v14 = sub_1D23F27A4();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EFC7CE08);
    v15 = sub_1D23F278C();
    v16 = sub_1D23F2948();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D23A0000, v15, v16, "Settings not found in settings from data source", v17, 2u);
      MEMORY[0x1D8235D54](v17, -1, -1);

      return 2;
    }

    return 2;
  }
  sub_1D23E6E08(0, &qword_1EFC7C8B8);
  v4 = sub_1D23F284C();

  if (!*(_QWORD *)(v4 + 16) || (v5 = sub_1D23EF3C4(0xD000000000000015, 0x80000001D23F8D30), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_1EFC7C3C8 != -1)
      swift_once();
    v10 = sub_1D23F27A4();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EFC7CE08);
    v11 = sub_1D23F278C();
    v12 = sub_1D23F2948();
    if (os_log_type_enabled(v11, v12))
    {
      v9 = 2;
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D23A0000, v11, v12, "Announce setting not found in settings from data source", v13, 2u);
      MEMORY[0x1D8235D54](v13, -1, -1);

      return v9;
    }

    return 2;
  }
  v7 = *(id *)(*(_QWORD *)(v4 + 56) + 8 * v5);
  swift_bridgeObjectRelease();
  objc_opt_self();
  v8 = (void *)swift_dynamicCastObjCClass();
  if (!v8)
  {

    goto LABEL_7;
  }
  v9 = (uint64_t)objc_msgSend(v8, sel_BOOLValue);

  return v9;
}

uint64_t sub_1D23EC958()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = objc_msgSend(v0, sel_an_announceSettingFromAccessorySettings);
  if (v1)
  {
    v2 = v1;
    v3 = (uint64_t)objc_msgSend(v1, sel_BOOLValue);

  }
  else
  {
    if (qword_1EFC7C3C8 != -1)
      swift_once();
    v4 = sub_1D23F27A4();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EFC7CE08);
    v5 = sub_1D23F278C();
    v6 = sub_1D23F2948();
    if (os_log_type_enabled(v5, v6))
    {
      v3 = 2;
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D23A0000, v5, v6, "Announce setting not found in accessory settings", v7, 2u);
      MEMORY[0x1D8235D54](v7, -1, -1);

    }
    else
    {

      return 2;
    }
  }
  return v3;
}

uint64_t sub_1D23ECA70(void *a1)
{
  id v1;
  char isAnnounce;

  v1 = a1;
  isAnnounce = HMAccessory.an_isAnnounceAccessory.getter();

  return isAnnounce & 1;
}

uint64_t HMAccessory.an_isAnnounceAccessory.getter()
{
  void *v0;
  void *v1;
  id v2;
  unsigned int v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  id v17;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_BOOLForDefault_, *MEMORY[0x1E0CF7B78]);

  if (!v3)
    return (uint64_t)objc_msgSend(v1, sel_supportsAnnounce);
  if (qword_1EFC7C3C8 != -1)
    swift_once();
  v4 = sub_1D23F27A4();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EFC7CE08);
  v5 = v1;
  v6 = sub_1D23F278C();
  v7 = sub_1D23F2954();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412546;
    v10 = v5;
    sub_1D23F299C();
    *v9 = v5;

    *(_WORD *)(v8 + 12) = 1024;
    objc_msgSend(v10, sel_supportsAnnounce);

    sub_1D23F299C();
    _os_log_impl(&dword_1D23A0000, v6, v7, "Supports Announce for Accessory %@: %{BOOL}d", (uint8_t *)v8, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
    swift_arrayDestroy();
    MEMORY[0x1D8235D54](v9, -1, -1);
    MEMORY[0x1D8235D54](v8, -1, -1);

  }
  else
  {

  }
  v12 = v5;
  v13 = sub_1D23F278C();
  v14 = sub_1D23F2954();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v15 = 138412290;
    v17 = v12;
    sub_1D23F299C();
    *v16 = v12;

    _os_log_impl(&dword_1D23A0000, v13, v14, "[Override] Force Announce Supported For Accessory %@ Enabled", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
    v11 = 1;
    swift_arrayDestroy();
    MEMORY[0x1D8235D54](v16, -1, -1);
    MEMORY[0x1D8235D54](v15, -1, -1);

  }
  else
  {

    return 1;
  }
  return v11;
}

id sub_1D23ECDF4(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (objc_msgSend(v1, sel_an_isAnnounceAccessory))
    v2 = objc_msgSend(v1, sel_hmu_isHomePod);
  else
    v2 = 0;

  return v2;
}

id HMAccessory.an_isAppleAnnounceAccessory.getter()
{
  void *v0;
  id result;

  result = objc_msgSend(v0, sel_an_isAnnounceAccessory);
  if ((_DWORD)result)
    return objc_msgSend(v0, sel_hmu_isHomePod);
  return result;
}

id sub_1D23ECE7C(void *a1)
{
  return objc_msgSend(a1, sel_an_isAppleAnnounceAccessory);
}

id HMAccessory.an_isAppleAnnounceHostAccessory.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_an_isAppleAnnounceAccessory);
}

uint64_t static HMAccessory.accessoriesWithAnnounceEnabled(from:)(unint64_t a1)
{
  return sub_1D23ED1A4(a1, (SEL *)&selRef_an_isAnnounceEnabled);
}

id sub_1D23ECEC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D23ECEF8(a1, a2, a3, (SEL *)&selRef_an_isAnnounceEnabled);
}

uint64_t static HMAccessory.announceAccessories(from:)(unint64_t a1)
{
  return sub_1D23ED1A4(a1, (SEL *)&selRef_an_isAnnounceAccessory);
}

id sub_1D23ECEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D23ECEF8(a1, a2, a3, (SEL *)&selRef_an_isAnnounceAccessory);
}

id sub_1D23ECEF8(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  unint64_t v5;
  void *v6;

  sub_1D23E6E08(0, &qword_1EFC7C8B0);
  v5 = sub_1D23F28C4();
  sub_1D23ED1A4(v5, a4);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_1D23F28B8();
  swift_bridgeObjectRelease();
  return v6;
}

id sub_1D23ECF80()
{
  unint64_t v0;
  void *v1;

  sub_1D23E6E08(0, &qword_1EFC7C8B0);
  v0 = sub_1D23F28C4();
  _sSo11HMAccessoryC14AnnounceDaemonE023announceAccessoriesWithB7Enabled4fromSayABGAF_tFZ_0(v0);
  swift_bridgeObjectRelease();
  v1 = (void *)sub_1D23F28B8();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static HMAccessory.appleAnnounceAccessories(from:)(unint64_t a1)
{
  return sub_1D23ED1A4(a1, (SEL *)&selRef_an_isAppleAnnounceAccessory);
}

id sub_1D23ED018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D23ECEF8(a1, a2, a3, (SEL *)&selRef_an_isAppleAnnounceAccessory);
}

uint64_t static HMAccessory.appleAnnounceHostAccessories(from:)(unint64_t a1)
{
  return sub_1D23ED1A4(a1, (SEL *)&selRef_an_isAppleAnnounceHostAccessory);
}

id sub_1D23ED040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D23ECEF8(a1, a2, a3, (SEL *)&selRef_an_isAppleAnnounceHostAccessory);
}

uint64_t _sSo11HMAccessoryC14AnnounceDaemonE023announceAccessoriesWithB7Enabled4fromSayABGAF_tFZ_0(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;

  v7 = MEMORY[0x1E0DEE9D8];
  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRetain();
  result = sub_1D23F2A5C();
  v2 = result;
  if (!result)
    goto LABEL_15;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D823543C](i, a1);
      else
        v5 = *(id *)(a1 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_an_isAnnounceAccessory)
        && (objc_msgSend(v6, sel_an_isAnnounceEnabled) & 1) != 0)
      {
        sub_1D23F2A14();
        sub_1D23F2A38();
        sub_1D23F2A44();
        sub_1D23F2A20();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t sub_1D23ED1A4(unint64_t a1, SEL *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;

  v9 = MEMORY[0x1E0DEE9D8];
  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRetain();
  result = sub_1D23F2A5C();
  v4 = result;
  if (!result)
    goto LABEL_14;
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v4; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1D823543C](i, a1);
      else
        v7 = *(id *)(a1 + 8 * i + 32);
      v8 = v7;
      if (objc_msgSend(v7, *a2))
      {
        sub_1D23F2A14();
        sub_1D23F2A38();
        sub_1D23F2A44();
        sub_1D23F2A20();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

id SiriReferenceResolutionDonation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SiriReferenceResolutionDonation.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  objc_class *v7;
  objc_super v9;

  v1 = sub_1D23F27A4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0;
  v6 = (id)ANLogWithCategory();
  sub_1D23F27B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))((uint64_t)v5 + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger, v4, v1);

  v7 = (objc_class *)type metadata accessor for SiriReferenceResolutionDonation();
  v9.receiver = v5;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for SiriReferenceResolutionDonation()
{
  uint64_t result;

  result = qword_1ED947808;
  if (!qword_1ED947808)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1D23ED4C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C8C0);
  MEMORY[0x1E0C80A78](v5);
  v40 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C8C8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D23F27D4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v41 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v2;
  v13 = v2 + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger;
  swift_bridgeObjectRetain_n();
  v14 = sub_1D23F278C();
  v15 = sub_1D23F2954();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v37[1] = v13;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v38 = v9;
    v19 = v18;
    v43 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    v42 = sub_1D23E92C0(a1, a2, &v43);
    sub_1D23F299C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D23A0000, v14, v15, "Start Donation [AnnouncementID = %s]", v17, 0xCu);
    swift_arrayDestroy();
    v20 = v19;
    v9 = v38;
    MEMORY[0x1D8235D54](v20, -1, -1);
    MEMORY[0x1D8235D54](v17, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_1D23F2720();
  swift_allocObject();
  v21 = sub_1D23F2714();
  sub_1D23F2708();
  if (MEMORY[0x1D823513C](v21))
  {
    sub_1D23F2864();
    v22 = sub_1D23F27BC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
    swift_bridgeObjectRetain();
    swift_retain();
    v23 = v41;
    sub_1D23F27C8();
    sub_1D23F2774();
    sub_1D23F2768();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C8D0);
    v24 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_1D23F6490;
    v26 = v23;
    v27 = v10;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 16))(v25 + v24, v26, v10);
    v28 = sub_1D23F27E0();
    v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
    v38 = (char *)v21;
    v30 = (uint64_t)v40;
    v29(v40, 1, 1, v28);
    v31 = a1;
    v32 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v33 = (_QWORD *)swift_allocObject();
    v33[2] = v32;
    v33[3] = v31;
    v33[4] = a2;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1D23F275C();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    sub_1D23EDE3C(v30);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v41, v27);
    swift_release();
  }
  else
  {
    v34 = sub_1D23F278C();
    v35 = sub_1D23F2948();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1D23A0000, v34, v35, "Failed to create uso entity", v36, 2u);
      MEMORY[0x1D8235D54](v36, -1, -1);
    }
    swift_release();

  }
}

void sub_1D23ED98C(void *a1, char a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v9 = a3 + 16;
  swift_beginAccess();
  v10 = MEMORY[0x1D8235DCC](v9);
  if (v10)
  {
    v11 = (void *)v10;
    if ((a2 & 1) != 0)
    {
      sub_1D23EDF18(a1, 1);
      swift_bridgeObjectRetain();
      sub_1D23EDF18(a1, 1);
      swift_bridgeObjectRetain();
      sub_1D23EDF18(a1, 1);
      v16 = sub_1D23F278C();
      v17 = sub_1D23F2948();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = swift_slowAlloc();
        v19 = swift_slowAlloc();
        v22 = v19;
        *(_DWORD *)v18 = 136315394;
        swift_bridgeObjectRetain();
        sub_1D23E92C0(a4, a5, &v22);
        sub_1D23F299C();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v18 + 12) = 2080;
        swift_getErrorValue();
        v20 = sub_1D23F2AC8();
        sub_1D23E92C0(v20, v21, &v22);
        sub_1D23F299C();
        swift_bridgeObjectRelease();
        sub_1D23EDF24(a1, 1);
        sub_1D23EDF24(a1, 1);
        _os_log_impl(&dword_1D23A0000, v16, v17, "Finished Donation [AnnouncementID = %s] with Error %s", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D8235D54](v19, -1, -1);
        MEMORY[0x1D8235D54](v18, -1, -1);
        sub_1D23EDF24(a1, 1);

      }
      else
      {
        sub_1D23EDF24(a1, 1);
        swift_bridgeObjectRelease_n();

        sub_1D23EDF24(a1, 1);
        sub_1D23EDF24(a1, 1);
      }
    }
    else
    {
      swift_bridgeObjectRetain_n();
      v12 = sub_1D23F278C();
      v13 = sub_1D23F2954();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v15 = swift_slowAlloc();
        v22 = v15;
        *(_DWORD *)v14 = 136315138;
        swift_bridgeObjectRetain();
        sub_1D23E92C0(a4, a5, &v22);
        sub_1D23F299C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1D23A0000, v12, v13, "Finished Donation Successfully [AnnouncementID = %s]", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D8235D54](v15, -1, -1);
        MEMORY[0x1D8235D54](v14, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

    }
  }
}

id SiriReferenceResolutionDonation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriReferenceResolutionDonation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D23EDDDC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D23EDE00()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1D23EDE2C(void *a1, char a2)
{
  uint64_t v2;

  sub_1D23ED98C(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_1D23EDE3C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C8C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D23EDE7C()
{
  return type metadata accessor for SiriReferenceResolutionDonation();
}

uint64_t sub_1D23EDE84()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D23F27A4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriReferenceResolutionDonation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriReferenceResolutionDonation.makePlaybackDonation(announcementID:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

id sub_1D23EDF18(id result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

void sub_1D23EDF24(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

id sub_1D23EDF60()
{
  id v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_hasCurrentCalls);

  v2 = sub_1D23F278C();
  v3 = sub_1D23F2954();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 67109120;
    sub_1D23F299C();
    _os_log_impl(&dword_1D23A0000, v2, v3, "Call Center Has Calls = %{BOOL}d", v4, 8u);
    MEMORY[0x1D8235D54](v4, -1, -1);
  }

  return v1;
}

uint64_t sub_1D23EE0B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___ANTelephonyObserver_delegate;
  swift_beginAccess();
  return MEMORY[0x1D8235DCC](v1);
}

uint64_t sub_1D23EE14C()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1D23EE1A4(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___ANTelephonyObserver_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1D8235DCC](v5);
  return sub_1D23EE214;
}

void sub_1D23EE214(void **a1, char a2)
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

id TelephonyObserver.__allocating_init(queue:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return TelephonyObserver.init(queue:)(a1);
}

id TelephonyObserver.init(queue:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  objc_class *v8;
  id v9;
  objc_super v11;

  v3 = sub_1D23F27A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v7 = v1;
  sub_1D23F2798();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v7 + OBJC_IVAR___ANTelephonyObserver_logger, v6, v3);

  v8 = (objc_class *)type metadata accessor for TelephonyObserver();
  v11.receiver = v7;
  v11.super_class = v8;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  sub_1D23EE3CC((uint64_t)a1);

  return v9;
}

void sub_1D23EE3CC(uint64_t a1)
{
  void *v2;
  char **v3;
  id v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_self();
  v3 = &selRef_scanningDeviceCandidates;
  v4 = objc_msgSend(v2, sel_sharedAVSystemController);
  if (!v4)
    __break(1u);
  v5 = v4;
  v6 = (uint64_t *)MEMORY[0x1E0D47EF0];
  sub_1D23F2864();
  v7 = (void *)sub_1D23F2858();
  swift_bridgeObjectRelease();
  v8 = *MEMORY[0x1E0D48280];
  aBlock[0] = 0;
  v9 = objc_msgSend(v5, sel_setAttribute_forKey_error_, v7, v8, aBlock);

  if (v9)
  {
    v10 = aBlock[0];
  }
  else
  {
    v11 = aBlock[0];
    v12 = (void *)sub_1D23F2678();

    swift_willThrow();
    v13 = v12;
    v14 = v12;
    v15 = sub_1D23F278C();
    v16 = sub_1D23F2948();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = (void *)swift_slowAlloc();
      aBlock[0] = v18;
      *(_DWORD *)v17 = 136446466;
      v19 = sub_1D23F2864();
      sub_1D23E92C0(v19, v20, (uint64_t *)aBlock);
      sub_1D23F299C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_getErrorValue();
      v21 = sub_1D23F2AC8();
      sub_1D23E92C0(v21, v22, (uint64_t *)aBlock);
      v6 = (uint64_t *)MEMORY[0x1E0D47EF0];
      sub_1D23F299C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D23A0000, v15, v16, "Failed to set attribute %{public}s on AVSystemController: %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D8235D54](v18, -1, -1);
      v23 = v17;
      v3 = &selRef_scanningDeviceCandidates;
      MEMORY[0x1D8235D54](v23, -1, -1);

    }
    else
    {

    }
  }
  v24 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v25 = *v6;
  v26 = objc_msgSend(v2, v3[159]);
  if (a1)
  {
    sub_1D23E6E08(0, (unint64_t *)&qword_1EFC7C3F8);
    v27 = (void *)sub_1D23F296C();
    v28 = sub_1D23F2978();

    if ((v28 & 1) != 0)
    {
      v29 = objc_msgSend((id)objc_opt_self(), sel_mainQueue);
    }
    else
    {
      v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3828]), sel_init);
      objc_msgSend(v29, sel_setUnderlyingQueue_, a1);
    }
  }
  else
  {
    v29 = 0;
  }
  v30 = (void *)swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1D23EF2EC;
  aBlock[5] = v30;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1D23EF01C;
  aBlock[3] = &block_descriptor_1;
  v31 = _Block_copy(aBlock);
  swift_release();
  v32 = objc_msgSend(v24, sel_addObserverForName_object_queue_usingBlock_, v25, v26, v29, v31);
  _Block_release(v31);
  swift_unknownObjectRelease();

}

id TelephonyObserver.__deallocating_deinit()
{
  void *v0;
  id v1;
  uint64_t v2;
  id v3;
  objc_super v5;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v2 = *MEMORY[0x1E0D47EF0];
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedAVSystemController);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, v2, v3);

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TelephonyObserver();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

id TelephonyObserver.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TelephonyObserver.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1D23EEBAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  id v30;
  char *v31;
  void *v32;
  _QWORD v33[2];
  char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37[5];
  __int128 v38;
  __int128 v39;

  v4 = sub_1D23F2648();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = MEMORY[0x1D8235DCC](a2 + 16);
  if (!v8)
    return;
  v9 = (char *)v8;
  v10 = v8 + OBJC_IVAR___ANTelephonyObserver_logger;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v11 = sub_1D23F278C();
  v12 = sub_1D23F2954();
  if (os_log_type_enabled(v11, v12))
  {
    v33[1] = v10;
    v13 = swift_slowAlloc();
    v33[0] = a1;
    v14 = (uint8_t *)v13;
    v15 = (void *)swift_slowAlloc();
    v34 = v9;
    v16 = v15;
    v37[0] = v15;
    *(_DWORD *)v14 = 136315138;
    sub_1D23EF37C();
    v17 = sub_1D23F2A98();
    *(_QWORD *)&v38 = sub_1D23E92C0(v17, v18, (uint64_t *)v37);
    sub_1D23F299C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_1D23A0000, v11, v12, "Call Changed Notification: %s", v14, 0xCu);
    swift_arrayDestroy();
    v19 = v16;
    v9 = v34;
    MEMORY[0x1D8235D54](v19, -1, -1);
    MEMORY[0x1D8235D54](v14, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v20 = sub_1D23F263C();
  if (!v20)
  {
    v38 = 0u;
    v39 = 0u;
LABEL_15:

    sub_1D23EF30C((uint64_t)&v38);
    return;
  }
  v21 = v20;
  v35 = sub_1D23F2864();
  v36 = v22;
  sub_1D23F29D8();
  if (*(_QWORD *)(v21 + 16) && (v23 = sub_1D23EF34C((uint64_t)v37), (v24 & 1) != 0))
  {
    sub_1D23EAEFC(*(_QWORD *)(v21 + 56) + 32 * v23, (uint64_t)&v38);
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D23EB0A4((uint64_t)v37);
  if (!*((_QWORD *)&v39 + 1))
    goto LABEL_15;
  sub_1D23E6E08(0, &qword_1EFC7C920);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v25 = v37[0];
    v26 = sub_1D23F278C();
    v27 = sub_1D23F2954();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v28 = 138412290;
      v37[0] = v25;
      v30 = v25;
      sub_1D23F299C();
      *v29 = v25;

      _os_log_impl(&dword_1D23A0000, v26, v27, "Active: %@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
      swift_arrayDestroy();
      MEMORY[0x1D8235D54](v29, -1, -1);
      MEMORY[0x1D8235D54](v28, -1, -1);
    }
    else
    {

    }
    v31 = &v9[OBJC_IVAR___ANTelephonyObserver_delegate];
    swift_beginAccess();
    v32 = (void *)MEMORY[0x1D8235DCC](v31);
    if (v32)
    {
      objc_msgSend(v32, sel_observer_didUpdateActiveCallStatus_, v9, objc_msgSend(v25, sel_BOOLValue));

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
  else
  {

  }
}

uint64_t sub_1D23EF01C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_1D23F2648();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_1D23F2630();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t type metadata accessor for TelephonyObserver()
{
  uint64_t result;

  result = qword_1EFC7C908;
  if (!qword_1EFC7C908)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D23EF0FC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___ANTelephonyObserver_delegate;
  swift_beginAccess();
  result = MEMORY[0x1D8235DCC](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1D23EF150()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1D23EF1A4()
{
  return type metadata accessor for TelephonyObserver();
}

uint64_t sub_1D23EF1AC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D23F27A4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for TelephonyObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TelephonyObserver.hasCalls.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TelephonyObserver.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TelephonyObserver.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TelephonyObserver.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TelephonyObserver.__allocating_init(queue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1D23EF2A4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1D23EF2C8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1D23EF2EC(uint64_t a1)
{
  uint64_t v1;

  sub_1D23EEBAC(a1, v1);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1D23EF30C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C918);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1D23EF34C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D23F29C0();
  return sub_1D23EF428(a1, v2);
}

unint64_t sub_1D23EF37C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC7C928;
  if (!qword_1EFC7C928)
  {
    v1 = sub_1D23F2648();
    result = MEMORY[0x1D8235CF4](MEMORY[0x1E0CAE658], v1);
    atomic_store(result, (unint64_t *)&qword_1EFC7C928);
  }
  return result;
}

unint64_t sub_1D23EF3C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D23F2B04();
  sub_1D23F2888();
  v4 = sub_1D23F2B28();
  return sub_1D23EF4EC(a1, a2, v4);
}

unint64_t sub_1D23EF428(uint64_t a1, uint64_t a2)
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
      sub_1D23EB0D8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D823540C](v9, a1);
      sub_1D23EB0A4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1D23EF4EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1D23F2AA4() & 1) == 0)
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
      while (!v14 && (sub_1D23F2AA4() & 1) == 0);
    }
  }
  return v6;
}

id sub_1D23EF5CC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  char *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  unsigned int v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74[2];

  v74[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C930);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_isCommunicationUserNotificationsEnabled);
  v60 = v2;
  if (v7)
  {
    v59 = v1;
    v74[0] = (id)MEMORY[0x1E0DEE9D8];
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      v62 = 0;
      v9 = 0;
      v61 = *MEMORY[0x1E0CF7C20];
      v58 = a1;
      v10 = (unsigned __int8 *)(a1 + 48 * v8 + 24);
      v63 = v8;
      v64 = v6;
      while (1)
      {
        v11 = *((_QWORD *)v10 - 5);
        v12 = *((_QWORD *)v10 - 4);
        v13 = (void *)*((_QWORD *)v10 - 2);
        v14 = (void *)*((_QWORD *)v10 - 1);
        v15 = *v10;
        v71 = v9;
        v72 = v12;
        v69 = v15;
        v68 = v14;
        v70 = v11;
        if ((v15 & 1) != 0)
        {
          v16 = (void *)objc_opt_self();
          sub_1D23EFC58(v13, v14, 1);
          swift_bridgeObjectRetain();
          v17 = (void *)sub_1D23F2858();
          v18 = objc_msgSend(v16, sel_systemImageNamed_, v17);

          v19 = 0;
        }
        else
        {
          sub_1D23EFC58(v13, v14, 0);
          sub_1D23EFC58(v13, v14, 0);
          swift_bridgeObjectRetain();
          v20 = objc_msgSend(v13, sel_imageData, v58);
          if (v20)
          {
            v21 = v13;
            v22 = sub_1D23F26B4();
            v24 = v23;

            v20 = (id)sub_1D23F26A8();
            v25 = v22;
            v13 = v21;
            sub_1D23EBEB0(v25, v24);
          }
          v18 = objc_msgSend((id)objc_opt_self(), sel_imageWithImageData_, v20);

          if (!v18)
          {
            __break(1u);
            break;
          }
          sub_1D23EFC68(v13, v14, 0);
          v26 = v13;
          v19 = v13;
        }
        v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CBDA60]), sel_initWithValue_type_, 0, 0);
        v28 = sub_1D23F2660();
        v29 = *(_QWORD *)(v28 - 8);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v6, 1, 1, v28);
        v66 = v13;
        v67 = v19;
        swift_bridgeObjectRetain();
        if (v19)
        {
          v30 = objc_msgSend(v19, sel_identifier);
          v65 = sub_1D23F2864();
          v32 = v31;

        }
        else
        {
          v65 = 0;
          v32 = 0;
        }
        v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48))(v6, 1, v28);
        v34 = v6;
        v35 = v27;
        v36 = v18;
        if (v33 == 1)
        {
          v37 = 0;
        }
        else
        {
          v37 = (void *)sub_1D23F2654();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v34, v28);
        }
        v38 = v63;
        v39 = (void *)sub_1D23F2858();
        swift_bridgeObjectRelease();
        if (v32)
        {
          v40 = (void *)sub_1D23F2858();
          swift_bridgeObjectRelease();
        }
        else
        {
          v40 = 0;
        }
        v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CBDA58]), sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, v35, v37, v39, v36, v40, 0);

        v42 = v71;
        if (v71)
        {
          v43 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
          v44 = objc_msgSend(v43, sel_BOOLForDefault_, v61);

          if (v44)
          {
            v45 = v41;
            MEMORY[0x1D82352EC]();
            if (*(_QWORD *)(((unint64_t)v74[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v74[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1D23F28E8();
            sub_1D23F28F4();
            sub_1D23F28DC();
            swift_bridgeObjectRelease();

          }
          else
          {
            swift_bridgeObjectRelease();

          }
          sub_1D23EFC68(v66, v68, v69);
        }
        else
        {
          swift_bridgeObjectRelease();

          sub_1D23EFC68(v66, v68, v69);
          v62 = v41;
        }
        v9 = v42 + 1;

        v10 -= 48;
        v6 = v64;
        if (v38 == v9)
        {
          swift_bridgeObjectRelease();
          v47 = v62;
          goto LABEL_30;
        }
      }
    }
    v47 = 0;
LABEL_30:
    v48 = objc_allocWithZone(MEMORY[0x1E0CBDB80]);
    sub_1D23EFC78();
    v49 = v47;
    v50 = (void *)sub_1D23F28B8();
    swift_bridgeObjectRelease();
    v51 = objc_msgSend(v48, sel_initWithRecipients_outgoingMessageType_content_speakableGroupName_conversationIdentifier_serviceName_sender_attachments_, v50, 0, 0, 0, 0, 0, v49, 0);

    v73 = 0;
    v52 = objc_msgSend(v59, sel_contentByUpdatingWithProvider_error_, v51, &v73);
    if (!v52)
    {
      v56 = v73;
      sub_1D23F2678();

      swift_willThrow();
      return v49;
    }
    v46 = v52;
    v53 = v73;

  }
  else
  {
    v46 = v1;
  }
  v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CBDA98]), sel_init);
  v74[0] = 0;
  v49 = objc_msgSend(v46, sel_contentByUpdatingWithProvider_error_, v54, v74);

  if (v49)
  {
    v55 = v74[0];
  }
  else
  {
    v49 = v74[0];
    sub_1D23F2678();

    swift_willThrow();
  }

  return v49;
}

id sub_1D23EFC58(void *a1, id a2, char a3)
{
  if ((a3 & 1) != 0)
    return (id)swift_bridgeObjectRetain();
  else
    return a1;
}

void sub_1D23EFC68(void *a1, id a2, char a3)
{
  if ((a3 & 1) != 0)
    swift_bridgeObjectRelease();
  else

}

unint64_t sub_1D23EFC78()
{
  unint64_t result;

  result = qword_1EFC7C938;
  if (!qword_1EFC7C938)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC7C938);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Announcer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for Announcer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_1D23EFC68(*(void **)(a1 + 24), *(id *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for Announcer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_1D23EFC58(v4, v5, v6);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  return a1;
}

uint64_t assignWithCopy for Announcer(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *((_BYTE *)v2 + 16);
  v4 = (void *)v2[3];
  v5 = (void *)v2[4];
  LOBYTE(v2) = *((_BYTE *)v2 + 40);
  sub_1D23EFC58(v4, v5, (char)v2);
  v6 = *(void **)(a1 + 24);
  v7 = *(void **)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = (_BYTE)v2;
  sub_1D23EFC68(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Announcer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_BYTE *)(a2 + 40);
  v6 = *(void **)(a1 + 24);
  v7 = *(void **)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v5;
  sub_1D23EFC68(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Announcer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Announcer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Announcer()
{
  return &type metadata for Announcer;
}

unint64_t sub_1D23EFF00()
{
  unint64_t result;

  result = qword_1EFC7C940;
  if (!qword_1EFC7C940)
  {
    result = MEMORY[0x1D8235CF4](&unk_1D23F6578, &type metadata for Announcer);
    atomic_store(result, (unint64_t *)&qword_1EFC7C940);
  }
  return result;
}

uint64_t sub_1D23EFF44()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  id v4;

  sub_1D23F2B04();
  swift_bridgeObjectRetain();
  sub_1D23F2888();
  swift_bridgeObjectRelease();
  sub_1D23F2B1C();
  v1 = *(void **)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  v3 = *(_BYTE *)(v0 + 40);
  sub_1D23F2B10();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1D23F2888();
  }
  else
  {
    v4 = v1;
    sub_1D23F2984();
  }
  sub_1D23EFC68(v1, v2, v3);
  return sub_1D23F2B28();
}

uint64_t sub_1D23F0018(__int128 *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  _OWORD v8[2];

  v2 = a1[1];
  v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  v3 = a2[1];
  v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(__int128 *)((char *)a2 + 25);
  return sub_1D23F04AC((uint64_t)&v5, (uint64_t)&v7) & 1;
}

void sub_1D23F0064()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  id v4;

  v1 = *(void **)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  v3 = *(_BYTE *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_1D23F2888();
  swift_bridgeObjectRelease();
  sub_1D23F2B1C();
  sub_1D23F2B10();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1D23F2888();
  }
  else
  {
    v4 = v1;
    sub_1D23F2984();
  }
  sub_1D23EFC68(v1, v2, v3);
}

uint64_t sub_1D23F0128()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  id v4;

  v1 = *(void **)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  v3 = *(_BYTE *)(v0 + 40);
  sub_1D23F2B04();
  swift_bridgeObjectRetain();
  sub_1D23F2888();
  swift_bridgeObjectRelease();
  sub_1D23F2B1C();
  sub_1D23F2B10();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1D23F2888();
  }
  else
  {
    v4 = v1;
    sub_1D23F2984();
  }
  sub_1D23EFC68(v1, v2, v3);
  return sub_1D23F2B28();
}

uint64_t sub_1D23F0200(uint64_t a1, uint64_t a2)
{
  return sub_1D23F03C0(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16), *(void **)a2, *(void **)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t sub_1D23F021C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  id v4;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  sub_1D23F2B04();
  sub_1D23F2B10();
  if ((v3 & 1) != 0)
  {
    sub_1D23F2888();
  }
  else
  {
    v4 = v1;
    sub_1D23F2984();
    sub_1D23EFC68(v1, v2, 0);
  }
  return sub_1D23F2B28();
}

void sub_1D23F02B0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
  {
    sub_1D23F2B10();
    sub_1D23F2888();
  }
  else
  {
    sub_1D23F2B10();
    v3 = v1;
    sub_1D23F2984();
    sub_1D23EFC68(v1, v2, 0);
  }
}

uint64_t sub_1D23F0330()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  id v4;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  sub_1D23F2B04();
  sub_1D23F2B10();
  if ((v3 & 1) != 0)
  {
    sub_1D23F2888();
  }
  else
  {
    v4 = v1;
    sub_1D23F2984();
    sub_1D23EFC68(v1, v2, 0);
  }
  return sub_1D23F2B28();
}

uint64_t sub_1D23F03C0(void *a1, void *a2, char a3, void *a4, void *a5, char a6)
{
  char v10;

  if ((a3 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      sub_1D23F060C();
      sub_1D23EFC58(a1, a2, 0);
      sub_1D23EFC58(a4, a5, 0);
      v10 = sub_1D23F2978();
      sub_1D23EFC68(a4, a5, 0);
      sub_1D23EFC68(a1, a2, 0);
      return v10 & 1;
    }
    return 0;
  }
  if ((a6 & 1) == 0)
    return 0;
  if (a1 == a4 && a2 == a5)
    return 1;
  else
    return sub_1D23F2AA4();
}

uint64_t sub_1D23F04AC(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[2];
  char v13;
  _QWORD v14[2];
  char v15;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_1D23F2AA4(), result = 0, (v5 & 1) != 0))
  {
    if (((*(unsigned __int8 *)(a1 + 16) ^ *(unsigned __int8 *)(a2 + 16)) & 1) != 0)
      return 0;
    sub_1D23F05F4((__int128 *)(a1 + 24), (uint64_t)&v11);
    sub_1D23F05F4((__int128 *)(a2 + 24), (uint64_t)&v10);
    sub_1D23F05F4(&v11, (uint64_t)v12);
    if ((v13 & 1) != 0)
    {
      v7 = v12[0];
      v8 = v12[1];
      sub_1D23F05F4(&v10, (uint64_t)v14);
      if ((v15 & 1) == 0 || (v7 != v14[0] || v8 != v14[1]) && (sub_1D23F2AA4() & 1) == 0)
        return 0;
    }
    else
    {
      sub_1D23F05F4(&v10, (uint64_t)v14);
      if ((v15 & 1) != 0)
        return 0;
      sub_1D23F060C();
      sub_1D23F0648((uint64_t)&v11);
      sub_1D23F0648((uint64_t)&v10);
      v9 = sub_1D23F2978();
      sub_1D23F0678((uint64_t)&v10);
      sub_1D23F0678((uint64_t)&v11);
      if ((v9 & 1) == 0)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t sub_1D23F05F4(__int128 *a1, uint64_t a2)
{
  __int128 v2;

  v2 = *a1;
  *(_BYTE *)(a2 + 16) = *((_BYTE *)a1 + 16);
  *(_OWORD *)a2 = v2;
  return a2;
}

unint64_t sub_1D23F060C()
{
  unint64_t result;

  result = qword_1EFC7C948;
  if (!qword_1EFC7C948)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC7C948);
  }
  return result;
}

uint64_t sub_1D23F0648(uint64_t a1)
{
  sub_1D23EFC58(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

uint64_t sub_1D23F0678(uint64_t a1)
{
  sub_1D23EFC68(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

void destroy for Announcer.ImageSource(uint64_t a1)
{
  sub_1D23EFC68(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s14AnnounceDaemon9AnnouncerV11ImageSourceOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D23EFC58(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Announcer.ImageSource(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D23EFC58(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1D23EFC68(v6, v7, v8);
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

uint64_t assignWithTake for Announcer.ImageSource(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1D23EFC68(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Announcer.ImageSource(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Announcer.ImageSource(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1D23F083C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1D23F0844(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Announcer.ImageSource()
{
  return &type metadata for Announcer.ImageSource;
}

unint64_t sub_1D23F0864()
{
  unint64_t result;

  result = qword_1EFC7C950;
  if (!qword_1EFC7C950)
  {
    result = MEMORY[0x1D8235CF4](&unk_1D23F65EC, &type metadata for Announcer.ImageSource);
    atomic_store(result, (unint64_t *)&qword_1EFC7C950);
  }
  return result;
}

id OS_dispatch_queue.operationQueue.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  id v5;

  v1 = v0;
  sub_1D23F094C();
  v2 = (void *)sub_1D23F296C();
  v3 = sub_1D23F2978();

  if ((v3 & 1) != 0)
    return objc_msgSend((id)objc_opt_self(), sel_mainQueue);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3828]), sel_init);
  objc_msgSend(v5, sel_setUnderlyingQueue_, v1);
  return v5;
}

unint64_t sub_1D23F094C()
{
  unint64_t result;

  result = qword_1EFC7C3F8;
  if (!qword_1EFC7C3F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC7C3F8);
  }
  return result;
}

id sub_1D23F0988(void *a1, uint64_t a2)
{
  return sub_1D23F09EC(a1, a2, (void (*)(void))HMRoom.description.getter);
}

unint64_t sub_1D23F0998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED947840;
  if (!qword_1ED947840)
  {
    v1 = sub_1D23F26F0();
    result = MEMORY[0x1D8235CF4](MEMORY[0x1E0CB09F0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED947840);
  }
  return result;
}

id sub_1D23F09E0(void *a1, uint64_t a2)
{
  return sub_1D23F09EC(a1, a2, (void (*)(void))HMZone.description.getter);
}

id sub_1D23F09EC(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_1D23F2858();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t _sSo6HMRoomC14AnnounceDaemonE11descriptionSSvg_0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v9;
  unint64_t v10;

  v1 = v0;
  v2 = sub_1D23F26F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 0;
  v10 = 0xE000000000000000;
  sub_1D23F29E4();
  swift_bridgeObjectRelease();
  v9 = 0x203D20656D614E5BLL;
  v10 = 0xE800000000000000;
  v6 = objc_msgSend(v0, sel_name);
  sub_1D23F2864();

  sub_1D23F2894();
  swift_bridgeObjectRelease();
  sub_1D23F2894();
  v7 = objc_msgSend(v1, sel_uniqueIdentifier);
  sub_1D23F26E4();

  sub_1D23F0998();
  sub_1D23F2A98();
  sub_1D23F2894();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1D23F2894();
  return v9;
}

NSObject *static AVAudioSession.audioSession(proxyAudioSessionID:endpointID:)(NSObject *a1)
{
  return sub_1D23F0DC8(a1);
}

NSObject *sub_1D23F0BDC(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C958);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1D23F26E4();
    v9 = sub_1D23F26F0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_1D23F26F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = sub_1D23F0DC8(a3);
  sub_1D23F1080((uint64_t)v8);
  return v11;
}

BOOL sub_1D23F0CF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D23F0D0C()
{
  sub_1D23F2B04();
  sub_1D23F2B10();
  return sub_1D23F2B28();
}

uint64_t sub_1D23F0D50()
{
  return sub_1D23F2B10();
}

uint64_t sub_1D23F0D78()
{
  sub_1D23F2B04();
  sub_1D23F2B10();
  return sub_1D23F2B28();
}

NSObject *sub_1D23F0DC8(NSObject *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  _BYTE *v17;
  _QWORD v19[2];
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  NSObject *v24;

  v2 = sub_1D23F27A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D23F2798();
  if ((_DWORD)a1
    && (v6 = objc_msgSend((id)objc_opt_self(), sel_retrieveSessionWithID_, a1)) != 0)
  {
    v7 = v6;
    a1 = v6;
    v8 = sub_1D23F278C();
    v9 = sub_1D23F2954();
    v10 = v9;
    if (os_log_type_enabled(v8, v9))
    {
      v11 = swift_slowAlloc();
      v20 = v10;
      v12 = v11;
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412546;
      v19[0] = v12 + 12;
      v19[1] = v12 + 4;
      v24 = a1;
      v22 = v2;
      v14 = a1;
      v21 = v3;
      v15 = v14;
      sub_1D23F299C();
      *v13 = v7;

      *(_WORD *)(v12 + 12) = 1024;
      v16 = -[NSObject opaqueSessionID](v15, sel_opaqueSessionID);

      v23 = v16;
      v2 = v22;
      sub_1D23F299C();

      _os_log_impl(&dword_1D23A0000, v8, (os_log_type_t)v20, "Using Proxy Audio Session %@) (ID = %u)", (uint8_t *)v12, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C480);
      swift_arrayDestroy();
      v3 = v21;
      MEMORY[0x1D8235D54](v13, -1, -1);
      MEMORY[0x1D8235D54](v12, -1, -1);
    }
    else
    {

      v8 = a1;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_1D23F10C0();
    swift_allocError();
    *v17 = 0;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return a1;
}

uint64_t sub_1D23F1080(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7C958);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1D23F10C0()
{
  unint64_t result;

  result = qword_1EFC7C960;
  if (!qword_1EFC7C960)
  {
    result = MEMORY[0x1D8235CF4](&unk_1D23F66BC, &_s19AVAudioSessionErrorON);
    atomic_store(result, (unint64_t *)&qword_1EFC7C960);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s19AVAudioSessionErrorOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s19AVAudioSessionErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1D23F11F0 + 4 * byte_1D23F6625[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D23F1224 + 4 * byte_1D23F6620[v4]))();
}

uint64_t sub_1D23F1224(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D23F122C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D23F1234);
  return result;
}

uint64_t sub_1D23F1240(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D23F1248);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D23F124C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D23F1254(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D23F1260(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D23F1268(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s19AVAudioSessionErrorOMa()
{
  return &_s19AVAudioSessionErrorON;
}

unint64_t sub_1D23F1284()
{
  unint64_t result;

  result = qword_1EFC7C968;
  if (!qword_1EFC7C968)
  {
    result = MEMORY[0x1D8235CF4](&unk_1D23F6694, &_s19AVAudioSessionErrorON);
    atomic_store(result, (unint64_t *)&qword_1EFC7C968);
  }
  return result;
}

uint64_t sub_1D23F12C8()
{
  uint64_t v0;

  v0 = sub_1D23F27A4();
  __swift_allocate_value_buffer(v0, qword_1EFC7CE08);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFC7CE08);
  return sub_1D23F2798();
}

uint64_t sub_1D23F2630()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1D23F263C()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1D23F2648()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1D23F2654()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_1D23F2660()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1D23F266C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D23F2678()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D23F2684()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1D23F2690()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1D23F269C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D23F26A8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D23F26B4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D23F26C0()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1D23F26CC()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1D23F26D8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D23F26E4()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1D23F26F0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D23F26FC()
{
  return MEMORY[0x1E0DA1318]();
}

uint64_t sub_1D23F2708()
{
  return MEMORY[0x1E0DA2488]();
}

uint64_t sub_1D23F2714()
{
  return MEMORY[0x1E0DA2490]();
}

uint64_t sub_1D23F2720()
{
  return MEMORY[0x1E0DA2498]();
}

uint64_t sub_1D23F272C()
{
  return MEMORY[0x1E0D334D8]();
}

uint64_t sub_1D23F2738()
{
  return MEMORY[0x1E0D334E0]();
}

uint64_t sub_1D23F2744()
{
  return MEMORY[0x1E0D334E8]();
}

uint64_t sub_1D23F2750()
{
  return MEMORY[0x1E0D334F8]();
}

uint64_t sub_1D23F275C()
{
  return MEMORY[0x1E0DA3C90]();
}

uint64_t sub_1D23F2768()
{
  return MEMORY[0x1E0DA3CD0]();
}

uint64_t sub_1D23F2774()
{
  return MEMORY[0x1E0DA3CD8]();
}

uint64_t sub_1D23F2780()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1D23F278C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D23F2798()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D23F27A4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D23F27B0()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1D23F27BC()
{
  return MEMORY[0x1E0DA3DA0]();
}

uint64_t sub_1D23F27C8()
{
  return MEMORY[0x1E0DA3E18]();
}

uint64_t sub_1D23F27D4()
{
  return MEMORY[0x1E0DA3E50]();
}

uint64_t sub_1D23F27E0()
{
  return MEMORY[0x1E0DA3E78]();
}

uint64_t sub_1D23F27EC()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1D23F27F8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D23F2804()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D23F2810()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D23F281C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1D23F2828()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1D23F2834()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1D23F2840()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D23F284C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D23F2858()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D23F2864()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D23F2870()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1D23F287C()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1D23F2888()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D23F2894()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D23F28A0()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D23F28AC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1D23F28B8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D23F28C4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D23F28D0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1D23F28DC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D23F28E8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1D23F28F4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1D23F2900()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D23F290C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1D23F2918()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1D23F2924()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D23F2930()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D23F293C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1D23F2948()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D23F2954()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1D23F2960()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1D23F296C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1D23F2978()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D23F2984()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1D23F2990()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1D23F299C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D23F29A8()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D23F29B4()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1D23F29C0()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D23F29CC()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D23F29D8()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D23F29E4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D23F29F0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D23F29FC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1D23F2A08()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D23F2A14()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1D23F2A20()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1D23F2A2C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1D23F2A38()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1D23F2A44()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1D23F2A50()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D23F2A5C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1D23F2A68()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1D23F2A74()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1D23F2A80()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D23F2A8C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D23F2A98()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D23F2AA4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D23F2AB0()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1D23F2ABC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1D23F2AC8()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1D23F2AD4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D23F2AE0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D23F2AEC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D23F2AF8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D23F2B04()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D23F2B10()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D23F2B1C()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1D23F2B28()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t ANLocalizedString()
{
  return MEMORY[0x1E0CF7CD0]();
}

uint64_t ANLocalizedStringWithFormat()
{
  return MEMORY[0x1E0CF7CD8]();
}

uint64_t ANLogBuildCategoryName()
{
  return MEMORY[0x1E0CF7CE0]();
}

uint64_t ANLogWithCategory()
{
  return MEMORY[0x1E0CF7CE8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x1E0C92128](inFileURL, outSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1E0C92160]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
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

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1E0C9ED40]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1E0C9ED48](retstr, clock);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x1E0D1ACB0]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1E0D33E20]();
}

uint64_t IDSGetUUIDData()
{
  return MEMORY[0x1E0D34740]();
}

uint64_t _AXSShowAudioTranscriptions()
{
  return MEMORY[0x1E0DDDCD0]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
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

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return MEMORY[0x1E0C82C90](block);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
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

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
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

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1E0C86238]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

