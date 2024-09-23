id NDTodayFeedConfigDecodingServiceXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00AFE38);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_decodeTodayFeedConfigData_completion_, 0, 0);

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_decodeTodayFeedConfigData_completion_, 0, 1);

  return v0;
}

id NDTodayFeedConfigDecodingServiceXPCConnection()
{
  void *v0;
  void *v1;

  if (NDTodayFeedConfigDecodingServiceXPCConnection_onceToken != -1)
    dispatch_once(&NDTodayFeedConfigDecodingServiceXPCConnection_onceToken, &__block_literal_global);
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.news.TodayFeedConfigDecoder"));
  NDTodayFeedConfigDecodingServiceXPCInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRemoteObjectInterface:", v1);

  return v0;
}

id NDSharedServiceLog()
{
  if (NDSharedServiceLog_once != -1)
    dispatch_once(&NDSharedServiceLog_once, &__block_literal_global_0);
  return (id)NDSharedServiceLog_result;
}

id NDSharedClientLog()
{
  if (NDSharedClientLog_once != -1)
    dispatch_once(&NDSharedClientLog_once, &__block_literal_global_3);
  return (id)NDSharedClientLog_result;
}

void sub_1D7107810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

id NDDownloadServiceXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00AFF30);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_downloadProgressedForRequest_progress_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_downloadProgressedForRequest_contentArchive_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_downloadProgressedForRequest_contentArchive_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_downloadFinishedForRequest_error_, 0, 0);

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_downloadFinishedForRequest_error_, 1, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00B0058);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v0, sel_registerDownloadConsumer_, 0, 0);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_setDownloadRequests_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_setDownloadLimits_, 0, 0);

  return v9;
}

id NDDownloadServiceXPCConnection()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.newsd.download"), 0);
  NDDownloadServiceXPCInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRemoteObjectInterface:", v1);

  return v0;
}

void sub_1D7108E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

Class __getSXContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SilexLibraryCore_frameworkLibrary)
  {
    SilexLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SilexLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SXContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSXContextClass_block_invoke_cold_1();
    free(v3);
  }
  getSXContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id NDArticleIDFromAudioContentID(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("N"), "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t NDAudioContentIDFromArticleID(uint64_t a1)
{
  return objc_msgSend(CFSTR("N"), "stringByAppendingString:", a1);
}

id NDANFDecodingServiceXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00B00B8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_decodeANFDocumentData_completion_, 0, 0);

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_decodeANFDocumentData_completion_, 0, 1);

  return v0;
}

id NDANFDecodingServiceXPCConnection()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.news.ANFDecoder"));
  NDANFDecodingServiceXPCInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRemoteObjectInterface:", v1);

  return v0;
}

void sub_1D710B7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id NDTodayFeedServiceXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00B0190);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_adoptFeedConfigData_, 0, 0);

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_fetchCachedTodayFeedWithCompletion_, 0, 1);

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_flushWithCompletion_, 0, 1);

  return v0;
}

id NDTodayFeedServiceXPCConnection()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.newsd.today-feed"), 0);
  NDTodayFeedServiceXPCInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRemoteObjectInterface:", v1);

  return v0;
}

uint64_t LiveActivityScheduleRequest.liveActivityID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_liveActivityID);
  sub_1D711085C();
  return v1;
}

uint64_t LiveActivityScheduleRequest.options.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D710BC64(v1 + OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options, a1);
}

uint64_t sub_1D710BC64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LiveActivityScheduleRequestOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id LiveActivityScheduleRequest.__allocating_init(liveActivityID:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  id v9;
  objc_super v11;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_liveActivityID];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  sub_1D710BC64(a3, (uint64_t)&v7[OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options]);
  v11.receiver = v7;
  v11.super_class = v3;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  sub_1D710BDC8(a3);
  return v9;
}

id LiveActivityScheduleRequest.init(liveActivityID:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *ObjectType;
  char *v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = &v3[OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_liveActivityID];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  sub_1D710BC64(a3, (uint64_t)&v3[OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options]);
  v11.receiver = v3;
  v11.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  sub_1D710BDC8(a3);
  return v9;
}

uint64_t sub_1D710BDC8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LiveActivityScheduleRequestOptions();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t LiveActivityScheduleRequest.scheduleDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options;
  v4 = sub_1D71107C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t LiveActivityScheduleRequest.backgroundTaskID.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options;
  v2 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 20));
  sub_1D711085C();
  return v2;
}

uint64_t static LiveActivityScheduleRequest.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall LiveActivityScheduleRequest.encode(with:)(NSCoder with)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v2 = (void *)sub_1D71108C8();
  v3 = (void *)sub_1D71108C8();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v2, v3);

  sub_1D711076C();
  swift_allocObject();
  sub_1D7110760();
  type metadata accessor for LiveActivityScheduleRequestOptions();
  sub_1D710C488(&qword_1F00ACF78, (uint64_t)&protocol conformance descriptor for LiveActivityScheduleRequestOptions);
  v4 = sub_1D7110754();
  v6 = v5;
  swift_release();
  v7 = (void *)sub_1D711079C();
  v8 = (void *)sub_1D71108C8();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v7, v8);

  sub_1D710C3CC(v4, v6);
}

id LiveActivityScheduleRequest.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return LiveActivityScheduleRequest.init(coder:)(a1);
}

id LiveActivityScheduleRequest.init(coder:)(void *a1)
{
  void *v1;
  uint64_t ObjectType;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v23;
  uint64_t v24;
  unint64_t v25;
  objc_class *v26;
  objc_super v27;

  ObjectType = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F00ACF80);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LiveActivityScheduleRequestOptions();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D710C450(0, (unint64_t *)&qword_1F00ACF88);
  v10 = v1;
  v11 = sub_1D71108EC();
  if (!v11)
  {

LABEL_6:
    swift_deallocPartialClassInstance();
    return 0;
  }
  v12 = (void *)v11;
  v26 = (objc_class *)ObjectType;
  v13 = sub_1D71108D4();
  v15 = v14;

  v16 = (uint64_t *)&v10[OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_liveActivityID];
  *v16 = v13;
  v16[1] = v15;
  sub_1D710C450(0, &qword_1F00ACF90);
  v17 = sub_1D71108EC();
  if (!v17)
  {

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v18 = (void *)v17;
  v19 = sub_1D71107A8();
  v21 = v20;

  sub_1D7110748();
  swift_allocObject();
  sub_1D711073C();
  sub_1D710C488(&qword_1F00ACF98, (uint64_t)&protocol conformance descriptor for LiveActivityScheduleRequestOptions);
  v25 = v21;
  sub_1D7110730();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_1D710C508((uint64_t)v5, (uint64_t)v9);
  sub_1D710BC64((uint64_t)v9, (uint64_t)&v10[OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options]);

  v27.receiver = v10;
  v27.super_class = v26;
  v23 = objc_msgSendSuper2(&v27, sel_init);
  sub_1D710C3CC(v19, v25);

  sub_1D710BDC8((uint64_t)v9);
  return v23;
}

uint64_t sub_1D710C3CC(uint64_t a1, unint64_t a2)
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8292118]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1D710C450(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D710C488(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for LiveActivityScheduleRequestOptions();
    result = MEMORY[0x1D8292124](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D710C4C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F00ACF80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D710C508(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LiveActivityScheduleRequestOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id LiveActivityScheduleRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LiveActivityScheduleRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LiveActivityScheduleRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D710C634()
{
  return type metadata accessor for LiveActivityScheduleRequest();
}

uint64_t type metadata accessor for LiveActivityScheduleRequest()
{
  uint64_t result;

  result = qword_1F00ACFC8;
  if (!qword_1F00ACFC8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D710C678()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LiveActivityScheduleRequestOptions();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for LiveActivityScheduleRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LiveActivityScheduleRequest.__allocating_init(liveActivityID:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of LiveActivityScheduleRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

unint64_t LiveActivityServiceConnection.LiveActivityServiceError.errorDescription.getter()
{
  return 0xD000000000000028;
}

uint64_t static LiveActivityServiceConnection.LiveActivityServiceError.== infix(_:_:)()
{
  return 1;
}

uint64_t LiveActivityServiceConnection.LiveActivityServiceError.hash(into:)()
{
  return sub_1D71109C4();
}

uint64_t LiveActivityServiceConnection.LiveActivityServiceError.hashValue.getter()
{
  sub_1D71109B8();
  sub_1D71109C4();
  return sub_1D71109DC();
}

uint64_t sub_1D710C794()
{
  return 1;
}

uint64_t sub_1D710C79C()
{
  sub_1D71109B8();
  sub_1D71109C4();
  return sub_1D71109DC();
}

uint64_t sub_1D710C7DC()
{
  return sub_1D71109C4();
}

uint64_t sub_1D710C800()
{
  sub_1D71109B8();
  sub_1D71109C4();
  return sub_1D71109DC();
}

unint64_t sub_1D710C83C()
{
  return 0xD000000000000028;
}

void **static LiveActivityServiceConnection.newSynchronousConnection()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void **v19;
  _QWORD v21[2];
  id aBlock;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  void (*v26)();
  uint64_t v27;

  v21[0] = a1;
  v1 = sub_1D7110838();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D71107E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1F00ACF60 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)qword_1F00AD058);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  sub_1D71107D8();
  v10 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
  v11 = (void *)sub_1D71108C8();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_initWithMachServiceName_options_, v11, 0);

  sub_1D71107CC();
  v13 = (void *)sub_1D711082C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  objc_msgSend(v12, sel_setRemoteObjectInterface_, v13);

  v26 = sub_1D710CB20;
  v27 = 0;
  v14 = (void *)MEMORY[0x1E0C809B0];
  aBlock = (id)MEMORY[0x1E0C809B0];
  v23 = 1107296256;
  v24 = sub_1D710CB34;
  v25 = &block_descriptor;
  v15 = _Block_copy(&aBlock);
  objc_msgSend(v12, sel_setInterruptionHandler_, v15);
  _Block_release(v15);
  v26 = sub_1D710CB60;
  v27 = 0;
  aBlock = v14;
  v23 = 1107296256;
  v24 = sub_1D710CB34;
  v25 = &block_descriptor_3;
  v16 = _Block_copy(&aBlock);
  objc_msgSend(v12, sel_setInvalidationHandler_, v16);
  _Block_release(v16);
  aBlock = v12;
  v17 = v12;
  v18 = v21[1];
  v19 = LiveActivityServiceConnection.synchronousServiceProxyConnection()();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  if (v18)
  else
    *(_QWORD *)v21[0] = v17;
  return v19;
}

void sub_1D710CB20()
{
  sub_1D710CB74(MEMORY[0x1E0DF2280], "newsd live activity XPC connection interrupted");
}

uint64_t sub_1D710CB34(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1D710CB60()
{
  sub_1D710CB74(MEMORY[0x1E0DF2290], "newsd live activity XPC connection invalidated");
}

void sub_1D710CB74(uint64_t (*a1)(void), const char *a2)
{
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  if (qword_1ED699278 != -1)
    swift_once();
  v4 = sub_1D71108B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED699280);
  oslog = sub_1D7110898();
  v5 = a1();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D7105000, oslog, v5, a2, v6, 2u);
    MEMORY[0x1D8292178](v6, -1, -1);
  }

}

void **LiveActivityServiceConnection.synchronousServiceProxyConnection()()
{
  id *v0;
  id v1;
  uint64_t v2;
  void **v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[8];

  v1 = *v0;
  objc_msgSend(*v0, sel_activate);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  v3 = (void **)(v2 + 16);
  v9[4] = sub_1D710CEF0;
  v9[5] = v2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D710CE3C;
  v9[3] = &block_descriptor_6;
  v4 = _Block_copy(v9);
  swift_retain();
  swift_release();
  v5 = objc_msgSend(v1, sel_synchronousRemoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);
  sub_1D71108F8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F00AD040);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v3 = (void **)v9[7];
    swift_release();
  }
  else
  {
    swift_beginAccess();
    v6 = *v3;
    if (!*v3)
    {
      sub_1D710CEF8();
      swift_allocError();
      v6 = 0;
    }
    v7 = v6;
    swift_willThrow();
    swift_release();
  }
  return v3;
}

id sub_1D710CDEC(void *a1, uint64_t a2)
{
  void *v4;

  swift_beginAccess();
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;

  return a1;
}

void sub_1D710CE3C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

Swift::Void __swiftcall LiveActivityServiceConnection.invalidate()()
{
  id *v0;

  objc_msgSend(*v0, sel_invalidate);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t sub_1D710CECC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1D710CEF0(void *a1)
{
  uint64_t v1;

  return sub_1D710CDEC(a1, v1);
}

unint64_t sub_1D710CEF8()
{
  unint64_t result;

  result = qword_1F00AD048;
  if (!qword_1F00AD048)
  {
    result = MEMORY[0x1D8292124](&protocol conformance descriptor for LiveActivityServiceConnection.LiveActivityServiceError, &type metadata for LiveActivityServiceConnection.LiveActivityServiceError);
    atomic_store(result, (unint64_t *)&qword_1F00AD048);
  }
  return result;
}

unint64_t sub_1D710CF40()
{
  unint64_t result;

  result = qword_1F00AD050;
  if (!qword_1F00AD050)
  {
    result = MEMORY[0x1D8292124](&protocol conformance descriptor for LiveActivityServiceConnection.LiveActivityServiceError, &type metadata for LiveActivityServiceConnection.LiveActivityServiceError);
    atomic_store(result, (unint64_t *)&qword_1F00AD050);
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityServiceConnection()
{
  return &type metadata for LiveActivityServiceConnection;
}

uint64_t getEnumTagSinglePayload for LiveActivityServiceConnection.LiveActivityServiceError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LiveActivityServiceConnection.LiveActivityServiceError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1D710D030 + 4 * byte_1D7111590[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1D710D050 + 4 * byte_1D7111595[v4]))();
}

_BYTE *sub_1D710D030(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1D710D050(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D710D058(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D710D060(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D710D068(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D710D070(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1D710D07C()
{
  return 0;
}

ValueMetadata *type metadata accessor for LiveActivityServiceConnection.LiveActivityServiceError()
{
  return &type metadata for LiveActivityServiceConnection.LiveActivityServiceError;
}

uint64_t sub_1D710D0A8()
{
  uint64_t v0;

  v0 = sub_1D71107E4();
  __swift_allocate_value_buffer(v0, qword_1F00AD058);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F00AD058);
  sub_1D71108D4();
  return sub_1D71107F0();
}

uint64_t sub_1D710D110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v0 = sub_1D7110838();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = &unk_1F00B01F0;
  sub_1D7110844();
  sub_1D7110874();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1D710D1AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void (*v11)(unint64_t, char *, uint64_t);
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v0 = sub_1D7110814();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v15 - v5;
  sub_1D7110820();
  sub_1D7110820();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F00AD070);
  v7 = *(_QWORD *)(v1 + 72);
  v8 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1D71116F0;
  v10 = v9 + v8;
  v11 = *(void (**)(unint64_t, char *, uint64_t))(v1 + 16);
  v11(v10, v6, v0);
  v11(v10 + v7, v4, v0);
  v12 = sub_1D711085C();
  swift_bridgeObjectRelease();
  v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v4, v0);
  v13(v6, v0);
  return v12;
}

uint64_t sub_1D710D300()
{
  return sub_1D710D324();
}

uint64_t sub_1D710D30C()
{
  return sub_1D710D424((void (*)(_QWORD))type metadata accessor for LiveActivityScheduleRequest);
}

uint64_t sub_1D710D318()
{
  return sub_1D710D324();
}

uint64_t sub_1D710D324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1D71107FC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7110808();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F00AD078);
  v4 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1D7111700;
  (*(void (**)(unint64_t, char *, uint64_t))(v1 + 16))(v5 + v4, v3, v0);
  v6 = sub_1D711085C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

uint64_t sub_1D710D418()
{
  return sub_1D710D424((void (*)(_QWORD))sub_1D710D5D0);
}

uint64_t sub_1D710D424(void (*a1)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = sub_1D7110880();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1(0);
  sub_1D711088C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F00AD080);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1D7111700;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 16))(v7 + v6, v5, v2);
  v8 = sub_1D7110850();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v8;
}

uint64_t static MachServices.LiveActivities.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F00ACF60 != -1)
    swift_once();
  v2 = sub_1D71107E4();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F00AD058);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for MachServices()
{
  return &type metadata for MachServices;
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

unint64_t sub_1D710D5D0()
{
  unint64_t result;

  result = qword_1F00ACF88;
  if (!qword_1F00ACF88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00ACF88);
  }
  return result;
}

uint64_t sub_1D710D60C()
{
  uint64_t v0;

  v0 = sub_1D71108B0();
  __swift_allocate_value_buffer(v0, qword_1ED699280);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED699280);
  if (qword_1ED6992A8 != -1)
    swift_once();
  sub_1D711085C();
  return sub_1D71108A4();
}

uint64_t static Logger.liveActivityDaemon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED699278 != -1)
    swift_once();
  v2 = sub_1D71108B0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED699280);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void sub_1D710D72C()
{
  strcpy((char *)&qword_1ED699298, "com.apple.news");
  unk_1ED6992A7 = -18;
}

uint64_t LiveActivityScheduleRequestOptions.scheduleDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1D71107C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t LiveActivityScheduleRequestOptions.backgroundTaskID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 20));
  sub_1D711085C();
  return v1;
}

uint64_t type metadata accessor for LiveActivityScheduleRequestOptions()
{
  uint64_t result;

  result = qword_1F00AD118;
  if (!qword_1F00AD118)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LiveActivityScheduleRequestOptions.originalScheduleDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 24);
  v4 = sub_1D71107C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t LiveActivityScheduleRequestOptions.retryCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 28));
}

double LiveActivityScheduleRequestOptions.scheduleDelay.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 32));
}

double LiveActivityScheduleRequestOptions.randomInitialDelay.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 36));
}

double LiveActivityScheduleRequestOptions.scheduleTimeWindow.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 40));
}

double LiveActivityScheduleRequestOptions.retryInterval.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 44));
}

double LiveActivityScheduleRequestOptions.retryScheduleTimeWindow.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 48));
}

uint64_t LiveActivityScheduleRequestOptions.retryCountMax.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 52));
}

uint64_t LiveActivityScheduleRequestOptions.expectedDownloadByteSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for LiveActivityScheduleRequestOptions() + 56));
}

uint64_t LiveActivityScheduleRequestOptions.init(scheduleDate:backgroundTaskID:originalScheduleDate:retryCount:scheduleDelay:randomInitialDelay:scheduleTimeWindow:retryInterval:retryScheduleTimeWindow:retryCountMax:expectedDownloadByteSize:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, double a11@<D2>, double a12@<D3>, double a13@<D4>)
{
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  int *v28;
  _QWORD *v29;
  uint64_t result;

  v26 = sub_1D71107C0();
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32);
  v27(a8, a1, v26);
  v28 = (int *)type metadata accessor for LiveActivityScheduleRequestOptions();
  v29 = (_QWORD *)(a8 + v28[5]);
  *v29 = a2;
  v29[1] = a3;
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v27)(a8 + v28[6], a4, v26);
  *(_QWORD *)(a8 + v28[7]) = a5;
  *(double *)(a8 + v28[8]) = a9;
  *(double *)(a8 + v28[9]) = a10;
  *(double *)(a8 + v28[10]) = a11;
  *(double *)(a8 + v28[11]) = a12;
  *(double *)(a8 + v28[12]) = a13;
  *(_QWORD *)(a8 + v28[13]) = a6;
  *(_QWORD *)(a8 + v28[14]) = a7;
  return result;
}

uint64_t LiveActivityScheduleRequestOptions.hash(into:)()
{
  sub_1D71107C0();
  sub_1D710E8F0(&qword_1F00AD088, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1D71108BC();
  type metadata accessor for LiveActivityScheduleRequestOptions();
  sub_1D711085C();
  sub_1D71108E0();
  swift_bridgeObjectRelease();
  sub_1D71108BC();
  sub_1D71109C4();
  sub_1D71109D0();
  sub_1D71109D0();
  sub_1D71109D0();
  sub_1D71109D0();
  sub_1D71109D0();
  sub_1D71109D0();
  return sub_1D71109D0();
}

uint64_t sub_1D710DBBC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1D710DBF8 + 4 * byte_1D7111720[a1]))(0xD000000000000010, 0x80000001D71125B0);
}

uint64_t sub_1D710DBF8()
{
  return 0x656C756465686373;
}

unint64_t sub_1D710DC48()
{
  return 0xD000000000000012;
}

uint64_t sub_1D710DC70()
{
  return 0x746E497972746572;
}

uint64_t sub_1D710DCB8()
{
  uint64_t v0;

  return v0 + 6;
}

void sub_1D710DCC8()
{
  JUMPOUT(0x1D710DCD4);
}

BOOL sub_1D710DCE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D710DCF4()
{
  sub_1D71109B8();
  sub_1D71109C4();
  return sub_1D71109DC();
}

uint64_t sub_1D710DD38()
{
  return sub_1D71109C4();
}

uint64_t sub_1D710DD60()
{
  sub_1D71109B8();
  sub_1D71109C4();
  return sub_1D71109DC();
}

uint64_t sub_1D710DDA0()
{
  unsigned __int8 *v0;

  return sub_1D710DBBC(*v0);
}

uint64_t sub_1D710DDA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1D710F230(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D710DDCC()
{
  return 0;
}

void sub_1D710DDD8(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_1D710DDE4()
{
  sub_1D710E860();
  return sub_1D7110A00();
}

uint64_t sub_1D710DE0C()
{
  sub_1D710E860();
  return sub_1D7110A0C();
}

uint64_t LiveActivityScheduleRequestOptions.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F00AD090);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1D710E860();
  sub_1D71109F4();
  v8[31] = 0;
  sub_1D71107C0();
  sub_1D710E8F0(&qword_1F00AD0A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
  sub_1D7110964();
  if (!v1)
  {
    type metadata accessor for LiveActivityScheduleRequestOptions();
    v8[30] = 1;
    sub_1D7110940();
    v8[29] = 2;
    sub_1D7110964();
    v8[28] = 3;
    sub_1D7110958();
    v8[27] = 4;
    sub_1D711094C();
    v8[26] = 5;
    sub_1D711094C();
    v8[25] = 6;
    sub_1D711094C();
    v8[24] = 7;
    sub_1D711094C();
    v8[15] = 8;
    sub_1D711094C();
    v8[14] = 9;
    sub_1D7110970();
    v8[13] = 10;
    sub_1D7110970();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t LiveActivityScheduleRequestOptions.hashValue.getter()
{
  sub_1D71109B8();
  LiveActivityScheduleRequestOptions.hash(into:)();
  return sub_1D71109DC();
}

uint64_t LiveActivityScheduleRequestOptions.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  int *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  int *v35;
  char *v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;

  v31 = a2;
  v4 = sub_1D71107C0();
  v37 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v29 - v8;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F00AD0A8);
  v10 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = (int *)type metadata accessor for LiveActivityScheduleRequestOptions();
  MEMORY[0x1E0C80A78](v35);
  v36 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_1D710E860();
  v32 = v12;
  sub_1D71109E8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  v30 = v10;
  v48 = 0;
  sub_1D710E8F0(&qword_1F00AD0B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  sub_1D7110928();
  v15 = v36;
  v16 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  v16(v36, v9, v4);
  v47 = 1;
  v17 = sub_1D7110904();
  v18 = v35;
  v19 = (uint64_t *)&v15[v35[5]];
  *v19 = v17;
  v19[1] = v20;
  v46 = 2;
  sub_1D7110928();
  v16(&v15[v18[6]], v7, v4);
  v45 = 3;
  *(_QWORD *)&v15[v18[7]] = sub_1D711091C();
  v44 = 4;
  sub_1D7110910();
  *(_QWORD *)&v15[v18[8]] = v21;
  v43 = 5;
  sub_1D7110910();
  *(_QWORD *)&v15[v18[9]] = v22;
  v42 = 6;
  sub_1D7110910();
  *(_QWORD *)&v15[v18[10]] = v23;
  v41 = 7;
  sub_1D7110910();
  *(_QWORD *)&v15[v18[11]] = v24;
  v40 = 8;
  sub_1D7110910();
  *(_QWORD *)&v15[v18[12]] = v25;
  v39 = 9;
  *(_QWORD *)&v36[v35[13]] = sub_1D7110934();
  v38 = 10;
  v26 = sub_1D7110934();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v33);
  v27 = (uint64_t)v36;
  *(_QWORD *)&v36[v35[14]] = v26;
  sub_1D710BC64(v27, v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return sub_1D710BDC8(v27);
}

uint64_t sub_1D710E66C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LiveActivityScheduleRequestOptions.init(from:)(a1, a2);
}

uint64_t sub_1D710E680(_QWORD *a1)
{
  return LiveActivityScheduleRequestOptions.encode(to:)(a1);
}

uint64_t sub_1D710E698()
{
  sub_1D71109B8();
  LiveActivityScheduleRequestOptions.hash(into:)();
  return sub_1D71109DC();
}

uint64_t sub_1D710E6D8()
{
  sub_1D71109B8();
  LiveActivityScheduleRequestOptions.hash(into:)();
  return sub_1D71109DC();
}

BOOL _s10NewsDaemon34LiveActivityScheduleRequestOptionsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  char v10;
  _BOOL8 result;

  if ((sub_1D71107B4() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for LiveActivityScheduleRequestOptions();
  v5 = v4[5];
  v6 = *(_QWORD *)(a1 + v5);
  v7 = *(_QWORD *)(a1 + v5 + 8);
  v8 = (_QWORD *)(a2 + v5);
  v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (v10 = sub_1D711097C(), result = 0, (v10 & 1) != 0))
  {
    if ((sub_1D71107B4() & 1) != 0
      && *(_QWORD *)(a1 + v4[7]) == *(_QWORD *)(a2 + v4[7])
      && *(double *)(a1 + v4[8]) == *(double *)(a2 + v4[8])
      && *(double *)(a1 + v4[9]) == *(double *)(a2 + v4[9])
      && *(double *)(a1 + v4[10]) == *(double *)(a2 + v4[10])
      && *(double *)(a1 + v4[11]) == *(double *)(a2 + v4[11])
      && *(double *)(a1 + v4[12]) == *(double *)(a2 + v4[12])
      && *(_QWORD *)(a1 + v4[13]) == *(_QWORD *)(a2 + v4[13]))
    {
      return *(_QWORD *)(a1 + v4[14]) == *(_QWORD *)(a2 + v4[14]);
    }
    return 0;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1D710E860()
{
  unint64_t result;

  result = qword_1F00AD098;
  if (!qword_1F00AD098)
  {
    result = MEMORY[0x1D8292124](&unk_1D7111954, &type metadata for LiveActivityScheduleRequestOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F00AD098);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1D710E8C4()
{
  return sub_1D710E8F0(&qword_1F00AD0B8, (uint64_t (*)(uint64_t))type metadata accessor for LiveActivityScheduleRequestOptions, (uint64_t)&protocol conformance descriptor for LiveActivityScheduleRequestOptions);
}

uint64_t sub_1D710E8F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D8292124](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for LiveActivityScheduleRequestOptions(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1D71107C0();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    v9 = a3[5];
    v10 = a3[6];
    v11 = &a1[v9];
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *(_QWORD *)v11 = *v12;
    *((_QWORD *)v11 + 1) = v13;
    v14 = &a1[v10];
    v15 = (char *)a2 + v10;
    sub_1D711085C();
    v8(v14, v15, v7);
    v16 = a3[8];
    *(_QWORD *)&a1[a3[7]] = *(uint64_t *)((char *)a2 + a3[7]);
    *(_QWORD *)&a1[v16] = *(uint64_t *)((char *)a2 + v16);
    v17 = a3[10];
    *(_QWORD *)&a1[a3[9]] = *(uint64_t *)((char *)a2 + a3[9]);
    *(_QWORD *)&a1[v17] = *(uint64_t *)((char *)a2 + v17);
    v18 = a3[12];
    *(_QWORD *)&a1[a3[11]] = *(uint64_t *)((char *)a2 + a3[11]);
    *(_QWORD *)&a1[v18] = *(uint64_t *)((char *)a2 + v18);
    v19 = a3[14];
    *(_QWORD *)&a1[a3[13]] = *(uint64_t *)((char *)a2 + a3[13]);
    *(_QWORD *)&a1[v19] = *(uint64_t *)((char *)a2 + v19);
  }
  return a1;
}

uint64_t destroy for LiveActivityScheduleRequestOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_1D71107C0();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 24), v4);
}

uint64_t initializeWithCopy for LiveActivityScheduleRequestOptions(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_1D71107C0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a3[6];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = a1 + v9;
  v14 = a2 + v9;
  sub_1D711085C();
  v7(v13, v14, v6);
  v15 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  v16 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  v17 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v18 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);
  return a1;
}

uint64_t assignWithCopy for LiveActivityScheduleRequestOptions(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v6 = sub_1D71107C0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  sub_1D711085C();
  swift_bridgeObjectRelease();
  v7(a1 + a3[6], a2 + a3[6], v6);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  return a1;
}

uint64_t initializeWithTake for LiveActivityScheduleRequestOptions(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1D71107C0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v7(a1 + v8, a2 + v8, v6);
  v9 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  v10 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v11 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  v12 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  return a1;
}

uint64_t assignWithTake for LiveActivityScheduleRequestOptions(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_1D71107C0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v7(a1 + a3[6], a2 + a3[6], v6);
  v13 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v14 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  v15 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  v16 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivityScheduleRequestOptions()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D710EE48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1D71107C0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivityScheduleRequestOptions()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D710EED4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1D71107C0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1D710EF50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D71107C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LiveActivityScheduleRequestOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivityScheduleRequestOptions.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_1D710F0C8 + 4 * byte_1D7111730[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_1D710F0FC + 4 * byte_1D711172B[v4]))();
}

uint64_t sub_1D710F0FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D710F104(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D710F10CLL);
  return result;
}

uint64_t sub_1D710F118(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D710F120);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_1D710F124(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D710F12C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D710F138(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D710F140(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveActivityScheduleRequestOptions.CodingKeys()
{
  return &type metadata for LiveActivityScheduleRequestOptions.CodingKeys;
}

unint64_t sub_1D710F15C()
{
  unint64_t result;

  result = qword_1F00AD178;
  if (!qword_1F00AD178)
  {
    result = MEMORY[0x1D8292124](&unk_1D711192C, &type metadata for LiveActivityScheduleRequestOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F00AD178);
  }
  return result;
}

unint64_t sub_1D710F1A4()
{
  unint64_t result;

  result = qword_1F00AD180;
  if (!qword_1F00AD180)
  {
    result = MEMORY[0x1D8292124](&unk_1D711189C, &type metadata for LiveActivityScheduleRequestOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F00AD180);
  }
  return result;
}

unint64_t sub_1D710F1EC()
{
  unint64_t result;

  result = qword_1F00AD188;
  if (!qword_1F00AD188)
  {
    result = MEMORY[0x1D8292124](&unk_1D71118C4, &type metadata for LiveActivityScheduleRequestOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F00AD188);
  }
  return result;
}

uint64_t sub_1D710F230(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656C756465686373 && a2 == 0xEC00000065746144;
  if (v3 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001D71125B0 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001D71125D0 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x756F437972746572 && a2 == 0xEA0000000000746ELL || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C756465686373 && a2 == 0xED000079616C6544 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001D71125F0 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001D7112610 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x746E497972746572 && a2 == 0xED00006C61767265 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001D7112630 || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x756F437972746572 && a2 == 0xED000078614D746ELL || (sub_1D711097C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000001D7112650)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    v6 = sub_1D711097C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 10;
    else
      return 11;
  }
}

uint64_t __getSXContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __47__NDDownloadRequest_initWithContentID_options___block_invoke_cold_1(v0);
}

uint64_t sub_1D7110730()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1D711073C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1D7110748()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1D7110754()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1D7110760()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1D711076C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1D7110778()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1D7110784()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1D7110790()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1D711079C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D71107A8()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D71107B4()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1D71107C0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D71107CC()
{
  return MEMORY[0x1E0DB33E0]();
}

uint64_t sub_1D71107D8()
{
  return MEMORY[0x1E0DB33E8]();
}

uint64_t sub_1D71107E4()
{
  return MEMORY[0x1E0DB33F0]();
}

uint64_t sub_1D71107F0()
{
  return MEMORY[0x1E0DB33F8]();
}

uint64_t sub_1D71107FC()
{
  return MEMORY[0x1E0DB3420]();
}

uint64_t sub_1D7110808()
{
  return MEMORY[0x1E0DB3430]();
}

uint64_t sub_1D7110814()
{
  return MEMORY[0x1E0DB3440]();
}

uint64_t sub_1D7110820()
{
  return MEMORY[0x1E0DB3450]();
}

uint64_t sub_1D711082C()
{
  return MEMORY[0x1E0DB3680]();
}

uint64_t sub_1D7110838()
{
  return MEMORY[0x1E0DB3688]();
}

uint64_t sub_1D7110844()
{
  return MEMORY[0x1E0DB3690]();
}

uint64_t sub_1D7110850()
{
  return MEMORY[0x1E0DB3B08]();
}

uint64_t sub_1D711085C()
{
  return MEMORY[0x1E0DB4140]();
}

uint64_t sub_1D7110868()
{
  return MEMORY[0x1E0DB4148]();
}

uint64_t sub_1D7110874()
{
  return MEMORY[0x1E0DB41B8]();
}

uint64_t sub_1D7110880()
{
  return MEMORY[0x1E0DB4F90]();
}

uint64_t sub_1D711088C()
{
  return MEMORY[0x1E0DB4FA0]();
}

uint64_t sub_1D7110898()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D71108A4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D71108B0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D71108BC()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1D71108C8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D71108D4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D71108E0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D71108EC()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_1D71108F8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D7110904()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1D7110910()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1D711091C()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1D7110928()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1D7110934()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1D7110940()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1D711094C()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1D7110958()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1D7110964()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1D7110970()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1D711097C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D7110988()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D7110994()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D71109A0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D71109AC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D71109B8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D71109C4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D71109D0()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1D71109DC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1D71109E8()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1D71109F4()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1D7110A00()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1D7110A0C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t FCDynamicCast()
{
  return MEMORY[0x1E0D58420]();
}

uint64_t FCURLForFeldsparUserAccountHomeDirectory()
{
  return MEMORY[0x1E0D58860]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t xpc_add_bundle()
{
  return MEMORY[0x1E0C85DD8]();
}

