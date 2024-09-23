void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
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

id _FLLogSystemQuery()
{
  if (_FLLogSystemQuery_onceToken != -1)
    dispatch_once(&_FLLogSystemQuery_onceToken, &__block_literal_global_3);
  return (id)_FLLogSystemQuery_log;
}

void sub_1B8D5574C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id _FLSignpostLogSystem()
{
  if (_FLSignpostLogSystem_onceToken != -1)
    dispatch_once(&_FLSignpostLogSystem_onceToken, &__block_literal_global_5);
  return (id)_FLSignpostLogSystem_log;
}

unint64_t _FLSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_FLSignpostGetNanoseconds_onceToken != -1)
    dispatch_once(&_FLSignpostGetNanoseconds_onceToken, &__block_literal_global_7);
  v3 = mach_absolute_time();
  LODWORD(v4) = _FLSignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1ED0286A4;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

unint64_t _FLSignpostCreate()
{
  unint64_t v0;

  do
    v0 = __ldxr(_fl_next_signpost_id___signpost_id);
  while (__stxr(v0 + 1, _fl_next_signpost_id___signpost_id));
  mach_absolute_time();
  return v0;
}

void sub_1B8D563C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v27 - 128));
  _Unwind_Resume(a1);
}

id _FLLogSystem()
{
  if (_FLLogSystem_onceToken != -1)
    dispatch_once(&_FLLogSystem_onceToken, &__block_literal_global_3);
  return (id)_FLLogSystem_log;
}

void sub_1B8D56798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FLLocDeviceSpecific(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  if (FLLocDeviceSpecific_onceToken != -1)
    dispatch_once(&FLLocDeviceSpecific_onceToken, &__block_literal_global_2);
  v5 = v3;
  v6 = v4;
  if (_FLLocKeyFromDeviceClass_onceToken != -1)
    dispatch_once(&_FLLocKeyFromDeviceClass_onceToken, &__block_literal_global_40);
  v7 = v5;
  if (v6)
  {
    v8 = (void *)_FLLocKeyFromDeviceClass_deviceMap;
    objc_msgSend(v6, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v5;
    if (v10)
    {
      objc_msgSend(v5, "stringByAppendingString:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend((id)FLLocDeviceSpecific_bundle, "localizedStringForKey:value:table:", v7, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id FLLoc(void *a1)
{
  return FLLocDeviceSpecific(a1, 0);
}

void sub_1B8D57374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t FLDaemonExportedInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1E5E60);
}

uint64_t FLError(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FLErrorDomain"), a1, 0);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B8D594F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v27 - 128));
  _Unwind_Resume(a1);
}

void sub_1B8D598F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v27 - 128));
  _Unwind_Resume(a1);
}

void sub_1B8D59D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v27 - 128));
  _Unwind_Resume(a1);
}

void sub_1B8D5A164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v27 - 128));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1B8D5D0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1B8D5D52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1B8D5D6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B8D60664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B8D60D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B8D6203C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FLFollowUpGroupSectionElement.groupIdentity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v6;

  v2 = *(_QWORD *)(v1 + 8);
  v6 = *(id *)v1;
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  swift_bridgeObjectRetain();
  return v6;
}

__n128 FLFollowUpGroupSectionElement.groupIdentity.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u8[8];

  swift_bridgeObjectRelease();
  result = v5;
  *(__n128 *)v1 = v5;
  *(_QWORD *)(v1 + 16) = v2;
  *(_BYTE *)(v1 + 24) = v3;
  return result;
}

uint64_t (*FLFollowUpGroupSectionElement.groupIdentity.modify())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64358()
{
  return 0;
}

uint64_t FLFollowUpGroupSectionElement.headerText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FLFollowUpGroupSectionElement.headerText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*FLFollowUpGroupSectionElement.headerText.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpGroupSectionElement.footerText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FLFollowUpGroupSectionElement.footerText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*FLFollowUpGroupSectionElement.footerText.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpGroupSectionElement.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRetain();
  v8 = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t FLFollowUpGroupSectionElement.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 56);
  sub_1B8D6459C();
  sub_1B8D71A88();
  if (v1)
  {
    sub_1B8D71C80();
    swift_bridgeObjectRetain();
    sub_1B8D71AD0();
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      sub_1B8D71C80();
      swift_bridgeObjectRetain();
      sub_1B8D71AD0();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_1B8D71C80();
    if (v2)
      goto LABEL_3;
  }
  return sub_1B8D71C80();
}

unint64_t sub_1B8D6459C()
{
  unint64_t result;

  result = qword_1EF1DF0A8;
  if (!qword_1EF1DF0A8)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLFollowUpGroupIdentity, &type metadata for FLFollowUpGroupIdentity);
    atomic_store(result, (unint64_t *)&qword_1EF1DF0A8);
  }
  return result;
}

uint64_t FLFollowUpGroupSectionElement.hashValue.getter()
{
  sub_1B8D71C68();
  FLFollowUpGroupSectionElement.hash(into:)();
  return sub_1B8D71C8C();
}

__n128 sub_1B8D64644@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6;
  __n128 result;

  v6 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)a6 = *(_QWORD *)a1;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a6 + 8) = result;
  *(_BYTE *)(a6 + 24) = v6;
  *(_QWORD *)(a6 + 32) = a2;
  *(_QWORD *)(a6 + 40) = a3;
  *(_QWORD *)(a6 + 48) = a4;
  *(_QWORD *)(a6 + 56) = a5;
  return result;
}

uint64_t sub_1B8D64668()
{
  sub_1B8D71C68();
  FLFollowUpGroupSectionElement.hash(into:)();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D646CC()
{
  sub_1B8D71C68();
  FLFollowUpGroupSectionElement.hash(into:)();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D64728@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRetain();
  v8 = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t _s12CoreFollowUp08FLFollowC19GroupSectionElementV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  char v20;

  v2 = *((_BYTE *)a1 + 24);
  v4 = a1[4];
  v3 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = *a2;
  v8 = *((_BYTE *)a2 + 24);
  v10 = a2[4];
  v9 = a2[5];
  v12 = a2[6];
  v11 = a2[7];
  v18 = *a1;
  v19 = *(_OWORD *)(a1 + 1);
  v20 = v2;
  v15 = v7;
  v16 = *(_OWORD *)(a2 + 1);
  v17 = v8;
  if ((static FLFollowUpGroupIdentity.== infix(_:_:)(&v18, &v15) & 1) == 0)
    return 0;
  if (!v3)
  {
    if (v9)
      return 0;
    goto LABEL_9;
  }
  if (!v9)
    return 0;
  if (v4 == v10 && v3 == v9 || (v13 = sub_1B8D71C5C(), result = 0, (v13 & 1) != 0))
  {
LABEL_9:
    if (v6)
    {
      if (v11 && (v5 == v12 && v6 == v11 || (sub_1B8D71C5C() & 1) != 0))
        return 1;
    }
    else if (!v11)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_1B8D648A8()
{
  unint64_t result;

  result = qword_1EF1DEB90;
  if (!qword_1EF1DEB90)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLFollowUpGroupSectionElement, &type metadata for FLFollowUpGroupSectionElement);
    atomic_store(result, (unint64_t *)&qword_1EF1DEB90);
  }
  return result;
}

unint64_t sub_1B8D648F0()
{
  unint64_t result;

  result = qword_1EF1DF0B0;
  if (!qword_1EF1DF0B0)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLFollowUpGroupSectionElement, &type metadata for FLFollowUpGroupSectionElement);
    atomic_store(result, (unint64_t *)&qword_1EF1DF0B0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FLFollowUpGroupIdentity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FLFollowUpGroupSectionElement(id *a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FLFollowUpGroupSectionElement(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FLFollowUpGroupSectionElement(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FLFollowUpGroupSectionElement(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FLFollowUpGroupSectionElement(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FLFollowUpGroupSectionElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FLFollowUpGroupSectionElement()
{
  return &type metadata for FLFollowUpGroupSectionElement;
}

uint64_t sub_1B8D64BD8()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64BE0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*sub_1B8D64C08())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64C18()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64C20(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*sub_1B8D64C48())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64C58()
{
  return 0;
}

uint64_t sub_1B8D64C60()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64C68(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_1B8D64C90())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64CA0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64CA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_1B8D64CD0())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64CE0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64CE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*sub_1B8D64D10())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64D20()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64D28(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*sub_1B8D64D50())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64D60()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64D68(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_1B8D64D90())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64DA0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B8D64DA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 56) = a1;
  return result;
}

uint64_t (*sub_1B8D64DD0())()
{
  return nullsub_1;
}

uint64_t sub_1B8D64DE0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t destroy for FLFollowUpViewModelSnapshot()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

_QWORD *initializeWithCopy for FLFollowUpViewModelSnapshot(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for FLFollowUpViewModelSnapshot(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = a2[3];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[4] = a2[4];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[5] = a2[5];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[6] = a2[6];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[7] = a2[7];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

_OWORD *assignWithTake for FLFollowUpViewModelSnapshot(_OWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  *a1 = *a2;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a1[3] = a2[3];
  swift_unknownObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for FLFollowUpViewModelSnapshot()
{
  return &type metadata for FLFollowUpViewModelSnapshot;
}

uint64_t sub_1B8D65060()
{
  uint64_t result;

  result = sub_1B8D71AA0();
  qword_1EF1E03D0 = result;
  return result;
}

uint64_t *sub_1B8D65094()
{
  if (qword_1EF1DF390 != -1)
    swift_once();
  return &qword_1EF1E03D0;
}

id sub_1B8D650D4()
{
  if (qword_1EF1DF390 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_1EF1E03D0;
}

void sub_1B8D6513C(uint64_t a1)
{
  void *v2;

  if (qword_1EF1DF390 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_1EF1E03D0;
  qword_1EF1E03D0 = a1;

}

uint64_t (*sub_1B8D651B0())()
{
  if (qword_1EF1DF390 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1B8D65220()
{
  uint64_t v0;
  uint64_t v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF1B0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1B8D73710;
  *(_QWORD *)(v0 + 32) = CFSTR("com.apple.followup.group.account");
  *(_QWORD *)(v0 + 40) = CFSTR("com.apple.followup.group.services");
  *(_QWORD *)(v0 + 48) = CFSTR("com.apple.followup.group.none");
  *(_QWORD *)(v0 + 56) = CFSTR("com.apple.followup.group.device");
  *(_QWORD *)(v0 + 64) = CFSTR("com.apple.followup.group.ndo");
  v1 = qword_1EF1DF390;
  v2 = CFSTR("com.apple.followup.group.account");
  v3 = CFSTR("com.apple.followup.group.services");
  v4 = CFSTR("com.apple.followup.group.none");
  v5 = CFSTR("com.apple.followup.group.device");
  v6 = CFSTR("com.apple.followup.group.ndo");
  if (v1 != -1)
    swift_once();
  swift_beginAccess();
  v7 = (void *)qword_1EF1E03D0;
  *(_QWORD *)(v0 + 72) = qword_1EF1E03D0;
  qword_1EF1DF8C0 = v0;
  return v7;
}

BOOL static FLItemGroup.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  if (qword_1EF1DF8B8 != -1)
    swift_once();
  v4 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v5 = sub_1B8D653EC(a1, v4);
  v7 = v6;
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    return 0;
  v8 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v9 = sub_1B8D653EC(a2, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  return (v11 & 1) == 0 && v5 < v9;
}

uint64_t sub_1B8D653EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_1B8D71AC4();
  v5 = v4;
  if (v3 == sub_1B8D71AC4() && v5 == v6)
  {
    v9 = 0;
LABEL_17:
    swift_bridgeObjectRelease_n();
    return v9;
  }
  v8 = sub_1B8D71C5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = 0;
  if ((v8 & 1) == 0)
  {
    v10 = v2 - 1;
    while (1)
    {
      if (v10 == v9)
        return 0;
      v11 = sub_1B8D71AC4();
      v13 = v12;
      if (v11 == sub_1B8D71AC4() && v13 == v14)
        break;
      v16 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v9;
      if ((v16 & 1) != 0)
        return v9;
    }
    ++v9;
    goto LABEL_17;
  }
  return v9;
}

uint64_t sub_1B8D65534()
{
  return sub_1B8D65CC0(&qword_1EF1DF180, (uint64_t)&unk_1B8D73A90);
}

void type metadata accessor for FLItemGroup()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF1DF188)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF1DF188);
  }
}

BOOL sub_1B8D655AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  v2 = *a1;
  v3 = *a2;
  if (qword_1EF1DF8B8 != -1)
    swift_once();
  v4 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v5 = sub_1B8D653EC(v2, v4);
  v7 = v6;
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    return 0;
  v8 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v9 = sub_1B8D653EC(v3, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  return (v11 & 1) == 0 && v5 < v9;
}

BOOL sub_1B8D65670(uint64_t *a1, uint64_t *a2)
{
  return sub_1B8D6567C(*a1, *a2);
}

BOOL sub_1B8D6567C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  if (qword_1EF1DF8B8 != -1)
    swift_once();
  v4 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v5 = sub_1B8D653EC(a2, v4);
  v7 = v6;
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    return 1;
  v8 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v9 = sub_1B8D653EC(a1, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  return (v11 & 1) != 0 || v5 >= v9;
}

BOOL sub_1B8D65748(uint64_t *a1, uint64_t *a2)
{
  return sub_1B8D65754(*a1, *a2);
}

BOOL sub_1B8D65754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  if (qword_1EF1DF8B8 != -1)
    swift_once();
  v4 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v5 = sub_1B8D653EC(a1, v4);
  v7 = v6;
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    return 1;
  v8 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v9 = sub_1B8D653EC(a2, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  return (v11 & 1) != 0 || v5 >= v9;
}

BOOL sub_1B8D65820(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  v2 = *a1;
  v3 = *a2;
  if (qword_1EF1DF8B8 != -1)
    swift_once();
  v4 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v5 = sub_1B8D653EC(v3, v4);
  v7 = v6;
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    return 0;
  v8 = qword_1EF1DF8C0;
  swift_bridgeObjectRetain();
  v9 = sub_1B8D653EC(v2, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  return (v11 & 1) == 0 && v5 < v9;
}

uint64_t sub_1B8D658E4(uint64_t a1, uint64_t a2)
{
  return sub_1B8D65BD4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1B8D658F0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1B8D71AAC();
  *a2 = 0;
  return result;
}

uint64_t sub_1B8D65964(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1B8D71AB8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B8D659E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1B8D71AC4();
  v2 = sub_1B8D71AA0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B8D65A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1B8D71AC4();
  v2 = v1;
  if (v0 == sub_1B8D71AC4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1B8D71C5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B8D65AA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1B8D71AA0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B8D65AEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1B8D71AC4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1B8D65B14()
{
  sub_1B8D65CC0(&qword_1EF1DF1A0, (uint64_t)&unk_1B8D737EC);
  sub_1B8D65CC0(&qword_1EF1DF1A8, (uint64_t)&unk_1B8D737B8);
  return sub_1B8D71C44();
}

uint64_t sub_1B8D65B80()
{
  return sub_1B8D65CC0(&qword_1EF1DF190, (uint64_t)&unk_1B8D73A50);
}

uint64_t sub_1B8D65BA4()
{
  return sub_1B8D65CC0(&qword_1EF1DF198, (uint64_t)&unk_1B8D7378C);
}

uint64_t sub_1B8D65BC8(uint64_t a1, uint64_t a2)
{
  return sub_1B8D65BD4(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1B8D65BD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1B8D71AC4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1B8D65C10()
{
  sub_1B8D71AC4();
  sub_1B8D71AD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8D65C50()
{
  uint64_t v0;

  sub_1B8D71AC4();
  sub_1B8D71C68();
  sub_1B8D71AD0();
  v0 = sub_1B8D71C8C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B8D65CC0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for FLItemGroup();
    result = MEMORY[0x1BCCBB818](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCBB800]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id FLFollowUpGroupIdentity.groupType.getter()
{
  id *v0;

  return *v0;
}

void FLFollowUpGroupIdentity.groupType.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*FLFollowUpGroupIdentity.groupType.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpGroupIdentity.accountIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FLFollowUpGroupIdentity.accountIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*FLFollowUpGroupIdentity.accountIdentifier.modify())()
{
  return nullsub_1;
}

void FLFollowUpGroupIdentity.accountType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

_BYTE *FLFollowUpGroupIdentity.accountType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = *result;
  return result;
}

uint64_t (*FLFollowUpGroupIdentity.accountType.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpGroupIdentity.id.getter()
{
  uint64_t v0;
  uint64_t v2;

  if (!*(_QWORD *)(v0 + 16))
    return sub_1B8D71AC4();
  v2 = sub_1B8D71AC4();
  sub_1B8D71ADC();
  sub_1B8D71ADC();
  return v2;
}

uint64_t static FLFollowUpGroupIdentity.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  return static FLItemGroup.< infix(_:_:)(*(_QWORD *)a1, *(_QWORD *)a2) & v3 & ~v2 & 1;
}

uint64_t static FLAccountType.< infix(_:_:)(_BYTE *a1, _BYTE *a2)
{
  return *a2 & ~*a1 & 1;
}

uint64_t FLFollowUpGroupIdentity.hash(into:)()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)v0;
  v2 = *(_QWORD *)(v0 + 16);
  sub_1B8D71AC4();
  v3 = v1;
  sub_1B8D71AD0();

  swift_bridgeObjectRelease();
  sub_1B8D71C80();
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1B8D71AD0();
    swift_bridgeObjectRelease();
  }
  return sub_1B8D71C74();
}

BOOL static FLAccountType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FLFollowUpGroupIdentity.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)v0;
  v2 = *(_QWORD *)(v0 + 16);
  sub_1B8D71C68();
  sub_1B8D71AC4();
  v3 = v1;
  sub_1B8D71AD0();

  swift_bridgeObjectRelease();
  sub_1B8D71C80();
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1B8D71AD0();
    swift_bridgeObjectRelease();
  }
  sub_1B8D71C74();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D66080@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  char v5;

  v5 = *a4;
  *(_QWORD *)a5 = result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  *(_BYTE *)(a5 + 24) = v5;
  return result;
}

uint64_t sub_1B8D6609C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)v0;
  v2 = *(_QWORD *)(v0 + 16);
  sub_1B8D71C68();
  sub_1B8D71AC4();
  v3 = v1;
  sub_1B8D71AD0();

  swift_bridgeObjectRelease();
  sub_1B8D71C80();
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1B8D71AD0();
    swift_bridgeObjectRelease();
  }
  sub_1B8D71C74();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D66164@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v1 + 16))
  {
    v6 = sub_1B8D71AC4();
    v7 = v3;
    sub_1B8D71ADC();
    sub_1B8D71ADC();
    result = v6;
    v5 = v7;
  }
  else
  {
    result = sub_1B8D71AC4();
  }
  *a1 = result;
  a1[1] = v5;
  return result;
}

uint64_t sub_1B8D661D8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  return static FLItemGroup.< infix(_:_:)(*(_QWORD *)a1, *(_QWORD *)a2) & v3 & ~v2 & 1;
}

BOOL sub_1B8D66218(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  return (static FLItemGroup.< infix(_:_:)(*(_QWORD *)a2, *(_QWORD *)a1) & v2 & ~v3 & 1) == 0;
}

BOOL sub_1B8D66258(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  return (static FLItemGroup.< infix(_:_:)(*(_QWORD *)a1, *(_QWORD *)a2) & v3 & ~v2 & 1) == 0;
}

uint64_t sub_1B8D6629C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  return static FLItemGroup.< infix(_:_:)(*(_QWORD *)a2, *(_QWORD *)a1) & v2 & ~v3 & 1;
}

uint64_t FLAccountType.hash(into:)()
{
  return sub_1B8D71C74();
}

uint64_t FLAccountType.hashValue.getter()
{
  sub_1B8D71C68();
  sub_1B8D71C74();
  return sub_1B8D71C8C();
}

BOOL sub_1B8D66348(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1B8D66360()
{
  sub_1B8D71C68();
  sub_1B8D71C74();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D663A4()
{
  return sub_1B8D71C74();
}

uint64_t sub_1B8D663CC()
{
  sub_1B8D71C68();
  sub_1B8D71C74();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D6640C(_BYTE *a1, _BYTE *a2)
{
  return *a2 & ~*a1 & 1;
}

uint64_t sub_1B8D66420(_BYTE *a1, _BYTE *a2)
{
  return *a2 & 1 | ((*a1 & 1) == 0);
}

uint64_t sub_1B8D66434(_BYTE *a1, _BYTE *a2)
{
  return *a1 & 1 | ((*a2 & 1) == 0);
}

uint64_t sub_1B8D66448(_BYTE *a1, _BYTE *a2)
{
  return *a1 & ~*a2 & 1;
}

uint64_t _s12CoreFollowUp08FLFollowC13GroupIdentityV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t result;
  char v15;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a1 + 24);
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(unsigned __int8 *)(a2 + 24);
  v8 = sub_1B8D71AC4();
  v10 = v9;
  if (v8 == sub_1B8D71AC4() && v10 == v11)
  {
    swift_bridgeObjectRelease_n();
    if (v3)
      goto LABEL_7;
LABEL_13:
    if (!v6)
      return v4 ^ v7 ^ 1u;
    return 0;
  }
  v13 = sub_1B8D71C5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v13 & 1) == 0)
    return result;
  if (!v3)
    goto LABEL_13;
LABEL_7:
  if (!v6)
    return 0;
  if (v2 == v5 && v3 == v6)
    return v4 ^ v7 ^ 1u;
  v15 = sub_1B8D71C5C();
  result = 0;
  if ((v15 & 1) != 0)
    return v4 ^ v7 ^ 1u;
  return result;
}

unint64_t sub_1B8D66570()
{
  unint64_t result;

  result = qword_1EF1DF1B8;
  if (!qword_1EF1DF1B8)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLFollowUpGroupIdentity, &type metadata for FLFollowUpGroupIdentity);
    atomic_store(result, (unint64_t *)&qword_1EF1DF1B8);
  }
  return result;
}

uint64_t sub_1B8D665B4()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_1B8D665C4()
{
  unint64_t result;

  result = qword_1EF1DF1C0;
  if (!qword_1EF1DF1C0)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLAccountType, &type metadata for FLAccountType);
    atomic_store(result, &qword_1EF1DF1C0);
  }
  return result;
}

uint64_t destroy for FLFollowUpGroupIdentity(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FLFollowUpGroupIdentity(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FLFollowUpGroupIdentity(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
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

uint64_t assignWithTake for FLFollowUpGroupIdentity(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for FLFollowUpGroupIdentity(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FLFollowUpGroupIdentity(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FLFollowUpGroupIdentity()
{
  return &type metadata for FLFollowUpGroupIdentity;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FLAccountType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FLAccountType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B8D668C4 + 4 * byte_1B8D73835[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B8D668F8 + 4 * byte_1B8D73830[v4]))();
}

uint64_t sub_1B8D668F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B8D66900(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B8D66908);
  return result;
}

uint64_t sub_1B8D66914(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B8D6691CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B8D66920(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B8D66928(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B8D66934(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B8D6693C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FLAccountType()
{
  return &type metadata for FLAccountType;
}

uint64_t *sub_1B8D66958()
{
  return &qword_1EF1E03D8;
}

uint64_t sub_1B8D66964()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1B8D669A8(uint64_t a1)
{
  swift_beginAccess();
  qword_1EF1E03D8 = a1;
  return swift_release();
}

uint64_t (*sub_1B8D669F4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B8D66A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[16];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEC10);
  MEMORY[0x1E0C80A78](v13);
  v18 = a1;
  v19 = a2;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = v6;
  v24 = a6;
  v25 = v6;
  (*(void (**)(_BYTE *, _QWORD))(v15 + 104))(&v17[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x1E0DF07B8]);
  return sub_1B8D71B84();
}

uint64_t sub_1B8D66B18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[6];

  v41 = a1;
  v42 = a7;
  v37 = a3;
  v38 = a9;
  v39 = a8;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC08);
  MEMORY[0x1E0C80A78](v14);
  v40 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC20);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, v16);
  v20 = (*(unsigned __int8 *)(v17 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v21 = (v18 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (char *)swift_allocObject();
  v23 = v37;
  *((_QWORD *)v22 + 2) = a2;
  *((_QWORD *)v22 + 3) = v23;
  *((_QWORD *)v22 + 4) = a4;
  *((_QWORD *)v22 + 5) = a5;
  *((_QWORD *)v22 + 6) = a6;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v22[v20], v19, v16);
  *(_QWORD *)&v22[v21] = v38;
  aBlock[0] = v39;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = &unk_1EF1DF1D0;
  *(_QWORD *)(v24 + 24) = v22;
  v25 = a2;
  swift_retain();
  sub_1B8D67258(a5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBA8);
  sub_1B8D69850(&qword_1EF1DEBA0, &qword_1EF1DEBA8, MEMORY[0x1E0C95D90]);
  v26 = sub_1B8D71A4C();
  swift_release();
  swift_beginAccess();
  qword_1EF1E03D8 = v26;
  swift_release();
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = &unk_1EF1DF1D0;
  *(_QWORD *)(v27 + 24) = v22;
  aBlock[4] = sub_1B8D67570;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8D67578;
  aBlock[3] = &block_descriptor;
  v28 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_setItemChangeHandler_, v28);
  _Block_release(v28);
  v29 = sub_1B8D71B48();
  v30 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v40, 1, 1, v29);
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = 0;
  v31[3] = 0;
  v31[4] = &unk_1EF1DF1D0;
  v31[5] = v22;
  swift_retain();
  sub_1B8D67300(v30, (uint64_t)&unk_1EF1DF1E0, (uint64_t)v31);
  swift_release();
  v32 = swift_allocObject();
  v33 = v42;
  *(_QWORD *)(v32 + 16) = v25;
  *(_QWORD *)(v32 + 24) = v33;
  v34 = v25;
  sub_1B8D71B54();
  return swift_release();
}

uint64_t sub_1B8D66E6C(uint64_t a1)
{
  uint64_t v1;

  return sub_1B8D66B18(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t sub_1B8D66E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_1B8D69890;
  return sub_1B8D68368(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1B8D66F20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC20);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);

  swift_release();
  if (*(_QWORD *)(v0 + 40))
    swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 56) & ~v3), v1);
  return swift_deallocObject();
}

uint64_t sub_1B8D66FBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC20) - 8) + 80);
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = v0[5];
  v7 = v0[6];
  v8 = (uint64_t)v0 + ((v2 + 56) & ~v2);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_1B8D69890;
  v10 = (_QWORD *)swift_task_alloc();
  v9[2] = v10;
  *v10 = v9;
  v10[1] = sub_1B8D69890;
  return sub_1B8D68368(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1B8D6707C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC08);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B8D71B48();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  if ((_DWORD)a1 == 1)
  {
    sub_1B8D67754((uint64_t)v6);
    v10 = 0;
    v11 = 0;
  }
  else
  {
    sub_1B8D71B3C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_1B8D71B0C();
      v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_1EF1DF218;
  *(_QWORD *)(v13 + 24) = v9;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1B8D67250()
{
  uint64_t v0;

  return sub_1B8D6707C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1B8D67258(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCBB80C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B8D672AC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1B8D69890;
  return v7();
}

uint64_t sub_1B8D67300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B8D71B48();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B8D71B3C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B8D67754(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B8D71B0C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B8D67444(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC08);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8D71B9C();
  sub_1B8D697D8(0, &qword_1EF1DEC68);
  v7 = (void *)sub_1B8D71BFC();
  sub_1B8D719A4();

  v8 = sub_1B8D71B48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  swift_retain();
  sub_1B8D67300((uint64_t)v6, (uint64_t)&unk_1EF1DF208, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1B8D67570()
{
  uint64_t v0;

  return sub_1B8D67444(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
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

uint64_t sub_1B8D67598()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = *(int **)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B8D67614;
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_1B8D69890;
  return v6();
}

uint64_t sub_1B8D67614()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B8D6765C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B8D67680()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t result;

  v1 = *(void **)(v0 + 16);
  sub_1B8D71B9C();
  sub_1B8D697D8(0, &qword_1EF1DEC68);
  v2 = (void *)sub_1B8D71BFC();
  sub_1B8D719A4();

  objc_msgSend(v1, sel_setItemChangeHandler_, 0);
  result = swift_beginAccess();
  if (qword_1EF1E03D8)
  {
    swift_retain();
    sub_1B8D719B0();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8D67754(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B8D67794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
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
  _QWORD aBlock[6];

  v30 = a5;
  v31 = a4;
  v28 = a3;
  v6 = sub_1B8D71A58();
  v34 = *(_QWORD *)(v6 - 8);
  v35 = v6;
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B8D71A7C();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78]();
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF1DF4A8 != -1)
    swift_once();
  v29 = qword_1EF1DF4A0;
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
  v17 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v18 = (v14 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v16;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v20 + v17, v15, v12);
  v21 = (_QWORD *)(v20 + v18);
  v23 = v30;
  v22 = v31;
  *v21 = v28;
  v21[1] = v22;
  *(_QWORD *)(v20 + v19) = v23;
  aBlock[4] = sub_1B8D6876C;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8D67578;
  aBlock[3] = &block_descriptor_46;
  v24 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B8D71A64();
  v36 = MEMORY[0x1E0DEE9D8];
  sub_1B8D69810(&qword_1EF1DEBC8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBD0);
  sub_1B8D69850((unint64_t *)&unk_1EF1DEBD8, &qword_1EF1DEBD0, MEMORY[0x1E0DEAF38]);
  v25 = v35;
  sub_1B8D71C14();
  MEMORY[0x1BCCBB254](0, v11, v8, v24);
  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v25);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v33);
  swift_release();
  return swift_release();
}

uint64_t sub_1B8D67A98(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;

  if (a3 >> 62)
    goto LABEL_14;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x1BCCBB2A8](v7, a3);
      }
      else
      {
        v8 = *(_QWORD *)(a3 + 8 * v7 + 32);
        swift_unknownObjectRetain();
      }
      v12 = v8;
      v9 = a1(&v12);
      swift_unknownObjectRelease();
      if (v3 || (v9 & 1) != 0)
        break;
      v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        v6 = sub_1B8D71C38();
        swift_bridgeObjectRelease();
        v7 = 0;
        if (!v6)
          return v7;
      }
      else
      {
        ++v7;
        if (v10 == v6)
          return 0;
      }
    }
  }
  return v7;
}

uint64_t sub_1B8D67BB4(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!(_DWORD)result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
    sub_1B8D68300(v3);
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v5 + 8 * a1;
    v9 = *(_QWORD *)(v8 + 32);
    memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * (v6 - 1 - a1));
    *(_QWORD *)(v5 + 16) = v7;
    sub_1B8D71B00();
    return v9;
  }
  return result;
}

uint64_t sub_1B8D67C48(id *a1)
{
  return sub_1B8D67C88(a1) & 1;
}

uint64_t sub_1B8D67C68(id *a1)
{
  return sub_1B8D67C88(a1) & 1;
}

uint64_t sub_1B8D67C88(id *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v1 = objc_msgSend(*a1, sel_identifier);
  v2 = sub_1B8D71AC4();
  v4 = v3;

  if (v2 == sub_1B8D71AC4() && v4 == v5)
    v7 = 1;
  else
    v7 = sub_1B8D71C5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1B8D67D3C(void **a1)
{
  void *v1;
  uint64_t *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v1 = *a1;
  v2 = sub_1B8D65094();
  swift_beginAccess();
  v3 = (id)*v2;
  v4 = objc_msgSend(v1, sel_identifier);
  v5 = sub_1B8D71AC4();
  v7 = v6;

  if (v5 == sub_1B8D71AC4() && v7 == v8)
    v10 = 1;
  else
    v10 = sub_1B8D71C5C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1B8D67E20(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1B8D67E4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t result;
  _QWORD v6[2];

  v0 = sub_1B8D71BC0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8D71BB4();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_1B8D71A7C();
  MEMORY[0x1E0C80A78]();
  sub_1B8D697D8(0, &qword_1EF1DEC48);
  sub_1B8D71A70();
  v6[1] = MEMORY[0x1E0DEE9D8];
  sub_1B8D69810(&qword_1EF1DEC40, v4, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBE8);
  sub_1B8D69850((unint64_t *)&unk_1EF1DEBF0, &qword_1EF1DEBE8, MEMORY[0x1E0DEAF38]);
  sub_1B8D71C14();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  result = sub_1B8D71BD8();
  qword_1EF1DF4A0 = result;
  return result;
}

uint64_t sub_1B8D68020(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1B8D68084;
  return v6(a1);
}

uint64_t sub_1B8D68084()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B8D680D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B8D680F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B8D69890;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF1DF1F0 + dword_1EF1DF1F0))(a1, v4);
}

uint64_t sub_1B8D68168()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = *(int **)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B8D69890;
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_1B8D69890;
  return v6();
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B8D68214()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = *(int **)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B8D69890;
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_1B8D69890;
  return v6();
}

uint64_t sub_1B8D68290(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B8D67614;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF1DF1F0 + dword_1EF1DF1F0))(a1, v4);
}

void sub_1B8D68300(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1B8D71C38();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x1BCCBB2B4);
}

uint64_t sub_1B8D68368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[22] = a5;
  v6[23] = a6;
  v6[20] = a3;
  v6[21] = a4;
  v6[18] = a1;
  v6[19] = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEB70);
  v6[24] = v7;
  v6[25] = *(_QWORD *)(v7 - 8);
  v6[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B8D683D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = (*(uint64_t (**)(void))(v0 + 152))();
  v4 = v3;
  *(_QWORD *)(v0 + 216) = v3;
  if (v1 && (v5 = (*(uint64_t (**)(void))(v0 + 168))()) != 0)
  {
    v6 = v5;
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = MEMORY[0x1E0DEE9D8];
  }
  *(_QWORD *)(v0 + 224) = v6;
  v7 = *(_QWORD *)(v0 + 144);
  sub_1B8D71B9C();
  *(_QWORD *)(v0 + 232) = sub_1B8D697D8(0, &qword_1EF1DEC68);
  v8 = (void *)sub_1B8D71BFC();
  sub_1B8D719A4();

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v9;
  v9[2] = v7;
  v9[3] = v2;
  v9[4] = v4;
  v9[5] = v6;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEB88);
  *v10 = v0;
  v10[1] = sub_1B8D6853C;
  return sub_1B8D71C50();
}

uint64_t sub_1B8D6853C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B8D68598()
{
  uint64_t v0;
  __int128 v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 16))
  {
    v1 = *(_OWORD *)(v0 + 32);
    v2 = *(_QWORD *)(v0 + 48);
    v3 = *(_OWORD *)(v0 + 56);
    v4 = *(_QWORD *)(v0 + 72);
    *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 16);
    v6 = *(_QWORD *)(v0 + 200);
    v5 = *(_QWORD *)(v0 + 208);
    v7 = *(_QWORD *)(v0 + 192);
    *(_OWORD *)(v0 + 96) = v1;
    *(_QWORD *)(v0 + 112) = v2;
    *(_OWORD *)(v0 + 120) = v3;
    *(_QWORD *)(v0 + 136) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC20);
    sub_1B8D71B60();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    v8 = (void *)sub_1B8D71BFC();
    sub_1B8D71BA8();
    sub_1B8D71998();

  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B8D68694(uint64_t a1)
{
  uint64_t *v1;

  return sub_1B8D67794(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1B8D686A0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B8D686C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1B8D6876C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  void *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v72;
  id v73;
  uint64_t v74;
  void *v75;
  char v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  char v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  _QWORD *v112;
  unint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00) - 8);
  v2 = (*(_QWORD *)(v1 + 64)
      + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  v3 = (v2 + 23) & 0xFFFFFFFFFFFFF8;
  v4 = (unint64_t *)(v0 + v2);
  v6 = *v4;
  v5 = (void *)v4[1];
  v7 = *(_QWORD **)(v0 + v3);
  v8 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess();
  v111 = (id)MEMORY[0x1BCCBB8D8](v8);
  if (!v111)
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
    sub_1B8D71B18();
    return;
  }
  if (!v5)
  {
    v9 = 0;
    if (v7)
      goto LABEL_4;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v9 = (void *)sub_1B8D71AA0();
  if (!v7)
    goto LABEL_7;
LABEL_4:
  v10 = (void *)sub_1B8D71AE8();
LABEL_8:
  v11 = objc_msgSend(v111, sel_groupsForPrimaryAccount_secondaryAccounts_, v9, v10);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEB80);
  v12 = sub_1B8D71AF4();

  v113 = v12;
  v112 = v7;
  if (v12 >> 62)
    goto LABEL_153;
  v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_27:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
    sub_1B8D71B18();

    return;
  }
LABEL_10:
  v14 = 0;
  while (1)
  {
    if ((v12 & 0xC000000000000001) != 0)
    {
      v15 = (void *)MEMORY[0x1BCCBB2A8](v14, v12);
    }
    else
    {
      v15 = *(void **)(v12 + 8 * v14 + 32);
      swift_unknownObjectRetain();
    }
    v16 = objc_msgSend(v15, sel_identifier);
    v17 = sub_1B8D71AC4();
    v19 = v18;

    if (v17 == sub_1B8D71AC4() && v19 == v20)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v22 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
        swift_unknownObjectRelease();
        goto LABEL_25;
      }
    }
    if (!v5)
    {
      swift_unknownObjectRelease();
      goto LABEL_31;
    }
    v23 = objc_msgSend(v15, sel_accountID);
    v24 = sub_1B8D71AC4();
    v26 = v25;

    if (v24 == v6 && v5 == v26)
      break;
    v27 = sub_1B8D71C5C();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    if ((v27 & 1) != 0)
      goto LABEL_30;
LABEL_25:
    v28 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = sub_1B8D71C38();
      if (!v13)
        goto LABEL_27;
      goto LABEL_10;
    }
    ++v14;
    if (v28 == v13)
      goto LABEL_27;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
LABEL_30:
  swift_bridgeObjectRelease();
LABEL_31:
  swift_bridgeObjectRelease();
  v109 = sub_1B8D67BB4(v14);
  v12 = v113;
  if (!(v113 >> 62))
  {
    v29 = *(_QWORD *)((v113 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29)
      goto LABEL_33;
LABEL_50:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
    sub_1B8D71B18();

    swift_unknownObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29 = sub_1B8D71C38();
  if (!v29)
    goto LABEL_50;
LABEL_33:
  v30 = 0;
  while (2)
  {
    if ((v113 & 0xC000000000000001) != 0)
    {
      v31 = (void *)MEMORY[0x1BCCBB2A8](v30, v113);
    }
    else
    {
      v31 = *(void **)(v113 + 8 * v30 + 32);
      swift_unknownObjectRetain();
    }
    v32 = objc_msgSend(v31, sel_identifier);
    v33 = sub_1B8D71AC4();
    v35 = v34;

    if (v33 == sub_1B8D71AC4() && v35 == v36)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v38 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v38 & 1) == 0)
      {
        swift_unknownObjectRelease();
        goto LABEL_48;
      }
    }
    if (!v5)
    {
      swift_unknownObjectRelease();
      goto LABEL_54;
    }
    v39 = objc_msgSend(v31, sel_accountID);
    v40 = sub_1B8D71AC4();
    v42 = v41;

    if (v40 != v6 || v5 != v42)
    {
      v43 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      if ((v43 & 1) != 0)
        goto LABEL_53;
LABEL_48:
      v44 = v30 + 1;
      if (__OFADD__(v30, 1))
        goto LABEL_149;
      ++v30;
      if (v44 == v29)
        goto LABEL_50;
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
LABEL_53:
  swift_bridgeObjectRelease();
LABEL_54:
  swift_bridgeObjectRelease();
  v108 = sub_1B8D67BB4(v30);
  v12 = v113;
  v45 = v112;
  if (v113 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v46 = sub_1B8D71C38();
  }
  else
  {
    v46 = *(_QWORD *)((v113 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  if (!v46)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v107 = 0;
    goto LABEL_81;
  }
  v47 = 0;
  while (2)
  {
    if ((v113 & 0xC000000000000001) != 0)
    {
      v48 = (void *)MEMORY[0x1BCCBB2A8](v47, v113);
    }
    else
    {
      v48 = *(void **)(v113 + 8 * v47 + 32);
      swift_unknownObjectRetain();
    }
    v49 = objc_msgSend(v48, sel_identifier);
    v50 = sub_1B8D71AC4();
    v52 = v51;

    if (v50 == sub_1B8D71AC4() && v52 == v53)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v55 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v55 & 1) == 0)
      {
        swift_unknownObjectRelease();
        goto LABEL_72;
      }
    }
    if (!v5)
    {
      swift_unknownObjectRelease();
      goto LABEL_79;
    }
    v56 = objc_msgSend(v48, sel_accountID);
    v57 = sub_1B8D71AC4();
    v59 = v58;

    if (v57 != v6 || v5 != v59)
    {
      v60 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      if ((v60 & 1) != 0)
        goto LABEL_78;
LABEL_72:
      v61 = v47 + 1;
      if (__OFADD__(v47, 1))
        goto LABEL_150;
      ++v47;
      if (v61 == v46)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v107 = 0;
        goto LABEL_80;
      }
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
LABEL_78:
  swift_bridgeObjectRelease();
LABEL_79:
  swift_bridgeObjectRelease();
  v107 = sub_1B8D67BB4(v47);
LABEL_80:
  v45 = v112;
LABEL_81:
  v12 = v113;
  if (!(v113 >> 62))
  {
    v62 = *(_QWORD *)((v113 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v62)
      goto LABEL_83;
LABEL_104:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v110 = 0;
    goto LABEL_109;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62 = sub_1B8D71C38();
  if (!v62)
    goto LABEL_104;
LABEL_83:
  v6 = 0;
  while (2)
  {
    if ((v113 & 0xC000000000000001) != 0)
    {
      v63 = (void *)MEMORY[0x1BCCBB2A8](v6, v113);
      if (!v45)
      {
LABEL_90:
        v65 = 0;
        v64 = 0;
        goto LABEL_91;
      }
    }
    else
    {
      v63 = *(void **)(v113 + 8 * v6 + 32);
      swift_unknownObjectRetain();
      if (!v45)
        goto LABEL_90;
    }
    if (!v45[2])
      goto LABEL_90;
    v65 = v45[4];
    v64 = (void *)v45[5];
    swift_bridgeObjectRetain();
LABEL_91:
    v66 = objc_msgSend(v63, sel_identifier, v107);
    v67 = sub_1B8D71AC4();
    v69 = v68;

    if (v67 == sub_1B8D71AC4() && v69 == v70)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v72 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v72 & 1) == 0)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
LABEL_102:
        v77 = v6 + 1;
        v45 = v112;
        if (__OFADD__(v6, 1))
          goto LABEL_151;
        ++v6;
        if (v77 == v62)
          goto LABEL_104;
        continue;
      }
    }
    break;
  }
  if (v64)
  {
    v73 = objc_msgSend(v63, sel_accountID);
    v74 = sub_1B8D71AC4();
    v5 = v75;

    if (v65 == v74 && v64 == v5)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      v45 = v112;
      swift_bridgeObjectRelease();
      goto LABEL_108;
    }
    v76 = sub_1B8D71C5C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    if ((v76 & 1) != 0)
      goto LABEL_106;
    goto LABEL_102;
  }
  swift_unknownObjectRelease();
LABEL_106:
  v45 = v112;
LABEL_108:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v110 = sub_1B8D67BB4(v6);
LABEL_109:
  v12 = v113;
  if (v113 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v78 = sub_1B8D71C38();
  }
  else
  {
    v78 = *(_QWORD *)((v113 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  if (!v78)
  {
LABEL_133:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v94 = 0;
    goto LABEL_139;
  }
  v6 = 0;
  while (2)
  {
    if ((v113 & 0xC000000000000001) != 0)
    {
      v5 = (void *)MEMORY[0x1BCCBB2A8](v6, v113);
      if (!v45)
      {
LABEL_119:
        v80 = 0;
        v79 = 0;
        goto LABEL_120;
      }
    }
    else
    {
      v5 = *(void **)(v113 + 8 * v6 + 32);
      swift_unknownObjectRetain();
      if (!v45)
        goto LABEL_119;
    }
    if (!v45[2])
      goto LABEL_119;
    v80 = v45[4];
    v79 = v45[5];
    swift_bridgeObjectRetain();
LABEL_120:
    v81 = objc_msgSend(v5, sel_identifier, v107);
    v82 = sub_1B8D71AC4();
    v84 = v83;

    if (v82 == sub_1B8D71AC4() && v84 == v85)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v87 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v87 & 1) == 0)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
LABEL_131:
        v93 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_152;
        ++v6;
        v45 = v112;
        if (v93 == v78)
          goto LABEL_133;
        continue;
      }
    }
    break;
  }
  if (!v79)
  {
    swift_unknownObjectRelease();
    goto LABEL_138;
  }
  v88 = objc_msgSend(v5, sel_accountID);
  v89 = sub_1B8D71AC4();
  v91 = v90;

  if (v80 != v89 || v79 != v91)
  {
    v92 = sub_1B8D71C5C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    if ((v92 & 1) != 0)
      goto LABEL_138;
    goto LABEL_131;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
LABEL_138:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v94 = sub_1B8D67BB4(v6);
LABEL_139:
  swift_bridgeObjectRetain();
  v95 = sub_1B8D67A98((uint64_t (*)(uint64_t *))sub_1B8D67C48, 0, v113);
  v97 = v96;
  swift_bridgeObjectRelease();
  if ((v97 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
    sub_1B8D71B18();

    swift_unknownObjectRelease();
LABEL_145:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return;
  }
  v98 = sub_1B8D67BB4(v95);
  swift_bridgeObjectRetain();
  v99 = sub_1B8D67A98((uint64_t (*)(uint64_t *))sub_1B8D67C68, 0, v113);
  v101 = v100;
  swift_bridgeObjectRelease();
  if ((v101 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
    sub_1B8D71B18();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_145;
  }
  v102 = sub_1B8D67BB4(v99);
  swift_bridgeObjectRetain();
  v103 = sub_1B8D67A98((uint64_t (*)(uint64_t *))sub_1B8D67D3C, 0, v113);
  v105 = v104;
  swift_bridgeObjectRelease();
  if ((v105 & 1) != 0)
    v106 = 0;
  else
    v106 = sub_1B8D67BB4(v103);
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  sub_1B8D64DE0(v109, v108, v107, v110, v94, v98, v102, v106, &v114);
  sub_1B8D696CC((uint64_t)&v114);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC00);
  sub_1B8D71B18();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B8D69750((uint64_t)&v114);
}

uint64_t sub_1B8D696CC(uint64_t a1)
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_1B8D69750(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1B8D697D8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B8D69810(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCBB818](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B8D69850(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1BCCBB818](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

double sub_1B8D698A8@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

_QWORD *sub_1B8D698B8(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void (*v12)(__int128 *, _QWORD);
  _QWORD *v13;
  void (*v14)(__int128 *, _QWORD);
  _QWORD *v15;
  void (*v16)(__int128 *, _QWORD);
  _QWORD *v17;
  void (*v18)(__int128 *, _QWORD);
  _QWORD *v19;
  void (*v20)(__int128 *, _QWORD);
  _QWORD *v21;
  void (*v22)(__int128 *, _QWORD);
  _QWORD *v23;
  void (*v24)(__int128 *, _QWORD);
  _QWORD *v25;
  void (*v26)(__int128 *, _QWORD);
  _QWORD *v27;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  char v57;
  char v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[9];

  sub_1B8D71B9C();
  sub_1B8D697D8(0, &qword_1EF1DEC68);
  v2 = (void *)sub_1B8D71BFC();
  v3 = MEMORY[0x1E0DEE9D8];
  sub_1B8D719A4();

  sub_1B8D6AD8C((uint64_t)a1, (uint64_t)v103);
  v4 = (void *)v103[0];
  if (!v103[0])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v12 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v13 = v3;
    swift_bridgeObjectRelease();
    v12(&v87, 0);
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v14 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v15 = v3;
    swift_bridgeObjectRelease();
    v14(&v87, 0);
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v16 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v17 = v3;
    swift_bridgeObjectRelease();
    v16(&v87, 0);
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v18 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v19 = v3;
    swift_bridgeObjectRelease();
    v18(&v87, 0);
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v20 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v21 = v3;
    swift_bridgeObjectRelease();
    v20(&v87, 0);
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    swift_retain();
    sub_1B8D71A10();
    swift_getKeyPath();
    swift_getKeyPath();
    v22 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v23 = v3;
    swift_bridgeObjectRelease();
    v22(&v87, 0);
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    swift_retain();
    sub_1B8D71A10();
    swift_getKeyPath();
    swift_getKeyPath();
    v24 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v25 = v3;
    swift_bridgeObjectRelease();
    v24(&v87, 0);
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    swift_retain();
    sub_1B8D71A10();
    swift_getKeyPath();
    swift_getKeyPath();
    v26 = (void (*)(__int128 *, _QWORD))sub_1B8D719F8();
    *v27 = v3;
    swift_bridgeObjectRelease();
    v26(&v87, 0);
    swift_release();
    return (_QWORD *)swift_release();
  }
  v59 = a1;
  v6 = (void *)v103[1];
  v5 = (void *)v103[2];
  v8 = (void *)v103[3];
  v7 = (void *)v103[4];
  v9 = (void *)v103[5];
  v69 = (void *)v103[6];
  v65 = (void *)v103[7];
  LOBYTE(v87) = 0;
  sub_1B8D6FBC4(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B8D6AC5C);
  v10 = sub_1B8D6F250(v4, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v11 = sub_1B8D6EC88(v87, v10);
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v10;
    swift_retain();
    sub_1B8D71A10();
  }
  LOBYTE(v87) = 0;
  v29 = sub_1B8D6F250(v6, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v30 = sub_1B8D6EC88(v87, v29);
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v29;
    swift_retain();
    sub_1B8D71A10();
  }
  LOBYTE(v87) = 0;
  v31 = sub_1B8D6F250(v5, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v32 = sub_1B8D6EC88(v87, v31);
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v31;
    swift_retain();
    sub_1B8D71A10();
  }
  LOBYTE(v87) = 1;
  v33 = sub_1B8D6F250(v8, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v34 = sub_1B8D6EC88(v87, v33);
  swift_bridgeObjectRelease();
  if ((v34 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v33;
    swift_retain();
    sub_1B8D71A10();
  }
  LOBYTE(v87) = 1;
  v35 = sub_1B8D6F250(v7, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v36 = sub_1B8D6EC88(v87, v35);
  swift_bridgeObjectRelease();
  if ((v36 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v35;
    swift_retain();
    sub_1B8D71A10();
  }
  LOBYTE(v99) = 0;
  v78 = v9;
  sub_1B8D6E9DC(v9, (char *)&v99, (uint64_t)&v87);
  v37 = (void *)v87;
  v85 = v88;
  v86 = *((_QWORD *)&v87 + 1);
  v83 = v89;
  v84 = *((_QWORD *)&v88 + 1);
  v81 = v90;
  v82 = *((_QWORD *)&v89 + 1);
  v80 = *((_QWORD *)&v90 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v38 = (void *)v99;
  if ((_QWORD)v99)
  {
    v87 = v99;
    v88 = v100;
    v89 = v101;
    v90 = v102;
    if (v37)
    {
      sub_1B8D648A8();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v76 = sub_1B8D71A94();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B8D6FB78(v38);
      if ((v76 & 1) != 0)
        goto LABEL_25;
LABEL_24:
      swift_getKeyPath();
      swift_getKeyPath();
      *(_QWORD *)&v87 = v37;
      *((_QWORD *)&v87 + 1) = v86;
      *(_QWORD *)&v88 = v85;
      *((_QWORD *)&v88 + 1) = v84;
      *(_QWORD *)&v89 = v83;
      *((_QWORD *)&v89 + 1) = v82;
      *(_QWORD *)&v90 = v81;
      *((_QWORD *)&v90 + 1) = v80;
      swift_retain();
      sub_1B8D6FAA0((uint64_t)v37);
      sub_1B8D71A10();
      goto LABEL_25;
    }
LABEL_23:
    v87 = v99;
    v88 = v100;
    v89 = v101;
    v90 = v102;
    v91 = (uint64_t)v37;
    v92 = v86;
    v93 = v85;
    v94 = v84;
    v95 = v83;
    v96 = v82;
    v97 = v81;
    v98 = v80;
    sub_1B8D6FAA0((uint64_t)v37);
    sub_1B8D6FAEC((uint64_t)&v87);
    goto LABEL_24;
  }
  if (v37)
    goto LABEL_23;
LABEL_25:
  LOBYTE(v87) = 0;
  v40 = sub_1B8D6F250(v78, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v41 = sub_1B8D6EC88(v87, v40);
  swift_bridgeObjectRelease();
  if ((v41 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v40;
    swift_retain();
    sub_1B8D71A10();
  }
  LOBYTE(v99) = 0;
  sub_1B8D6E9DC(v69, (char *)&v99, (uint64_t)&v87);
  v42 = v87;
  v77 = v88;
  v79 = *((_QWORD *)&v87 + 1);
  v74 = v89;
  v75 = *((_QWORD *)&v88 + 1);
  v72 = v90;
  v73 = *((_QWORD *)&v89 + 1);
  v71 = *((_QWORD *)&v90 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v43 = (void *)v99;
  v64 = (void *)v42;
  if ((_QWORD)v99)
  {
    v87 = v99;
    v88 = v100;
    v89 = v101;
    v90 = v102;
    if (v42)
    {
      sub_1B8D648A8();
      v44 = v43;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v67 = sub_1B8D71A94();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B8D6FB78(v43);
      if ((v67 & 1) != 0)
        goto LABEL_35;
LABEL_34:
      swift_getKeyPath();
      swift_getKeyPath();
      *(_QWORD *)&v87 = v42;
      *((_QWORD *)&v87 + 1) = v79;
      *(_QWORD *)&v88 = v77;
      *((_QWORD *)&v88 + 1) = v75;
      *(_QWORD *)&v89 = v74;
      *((_QWORD *)&v89 + 1) = v73;
      *(_QWORD *)&v90 = v72;
      *((_QWORD *)&v90 + 1) = v71;
      swift_retain();
      sub_1B8D6FAA0(v42);
      sub_1B8D71A10();
      goto LABEL_35;
    }
LABEL_33:
    v87 = v99;
    v88 = v100;
    v89 = v101;
    v90 = v102;
    v91 = v42;
    v92 = v79;
    v93 = v77;
    v94 = v75;
    v95 = v74;
    v96 = v73;
    v97 = v72;
    v98 = v71;
    sub_1B8D6FAA0(v42);
    sub_1B8D6FAEC((uint64_t)&v87);
    goto LABEL_34;
  }
  if (v42)
    goto LABEL_33;
LABEL_35:
  LOBYTE(v87) = 0;
  v45 = sub_1B8D6F250(v69, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v46 = sub_1B8D6EC88(v87, v45);
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v45;
    swift_retain();
    sub_1B8D71A10();
  }
  LOBYTE(v99) = 0;
  sub_1B8D6E9DC(v65, (char *)&v99, (uint64_t)&v87);
  v47 = v87;
  v62 = v88;
  v63 = *((_QWORD *)&v87 + 1);
  v60 = v89;
  v61 = *((_QWORD *)&v88 + 1);
  v68 = v90;
  v70 = *((_QWORD *)&v89 + 1);
  v66 = *((_QWORD *)&v90 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v48 = (void *)v99;
  if ((_QWORD)v99)
  {
    v87 = v99;
    v88 = v100;
    v89 = v101;
    v90 = v102;
    if (v47)
    {
      sub_1B8D648A8();
      v49 = v48;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v58 = sub_1B8D71A94();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v50 = v48;
      v52 = v60;
      v51 = v61;
      v54 = v62;
      v53 = v63;
      sub_1B8D6FB78(v50);
      v55 = (void *)v47;
      if ((v58 & 1) != 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if (!v47)
  {
    v55 = 0;
    goto LABEL_45;
  }
  v87 = v99;
  v88 = v100;
  v89 = v101;
  v90 = v102;
  v54 = v62;
  v53 = v63;
  v91 = v47;
  v92 = v63;
  v52 = v60;
  v51 = v61;
  v93 = v62;
  v94 = v61;
  v95 = v60;
  v96 = v70;
  v97 = v68;
  v98 = v66;
  sub_1B8D6FAA0(v47);
  sub_1B8D6FAEC((uint64_t)&v87);
  v55 = (void *)v47;
LABEL_44:
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)&v87 = v55;
  *((_QWORD *)&v87 + 1) = v53;
  *(_QWORD *)&v88 = v54;
  *((_QWORD *)&v88 + 1) = v51;
  *(_QWORD *)&v89 = v52;
  *((_QWORD *)&v89 + 1) = v70;
  *(_QWORD *)&v90 = v68;
  *((_QWORD *)&v90 + 1) = v66;
  swift_retain();
  sub_1B8D6FAA0((uint64_t)v55);
  sub_1B8D71A10();
LABEL_45:
  LOBYTE(v87) = 0;
  v56 = sub_1B8D6F250(v65, (char *)&v87);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  v57 = sub_1B8D6EC88(v87, v56);
  swift_bridgeObjectRelease();
  if ((v57 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v87 = v56;
    swift_retain();
    sub_1B8D71A10();
  }
  sub_1B8D69810((unint64_t *)&unk_1EF1DEC58, (uint64_t (*)(uint64_t))type metadata accessor for FLFollowUpModelObserver, (uint64_t)&protocol conformance descriptor for FLFollowUpModelObserver);
  sub_1B8D719BC();
  sub_1B8D719C8();
  swift_release();
  sub_1B8D6FB78(v55);
  sub_1B8D6FB78(v64);
  sub_1B8D6FB78(v37);
  return sub_1B8D6FBC4(v59, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B8D6ADD4);
}

uint64_t sub_1B8D6ABC0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  swift_beginAccess();
  v3 = v1[3];
  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[6];
  v7 = v1[7];
  v8 = v1[8];
  v10 = v1[9];
  v9 = v1[10];
  result = sub_1B8D6AC5C(v3);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v10;
  a1[7] = v9;
  return result;
}

uint64_t sub_1B8D6AC5C(uint64_t result)
{
  if (result)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_1B8D6ACEC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_1B8D698B8(a1);
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 24);
  sub_1B8D6AD8C((uint64_t)a1, v1 + 24);
  return sub_1B8D6ADD4(v3);
}

uint64_t sub_1B8D6AD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEB88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8D6ADD4(uint64_t result)
{
  if (result)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t FLFollowUpModelObserver.primaryAppleAccountFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6AE78@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6AE8C()
{
  return sub_1B8D6C5C0();
}

uint64_t FLFollowUpModelObserver.primaryAppleAccountFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t (*FLFollowUpModelObserver.primaryAppleAccountFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t sub_1B8D6AF30()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t FLFollowUpModelObserver.$primaryAppleAccountFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6AF50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6AF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t FLFollowUpModelObserver.$primaryAppleAccountFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t (*FLFollowUpModelObserver.$primaryAppleAccountFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.appleServicesFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6B07C@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6B090()
{
  return sub_1B8D6C5C0();
}

uint64_t FLFollowUpModelObserver.appleServicesFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t (*FLFollowUpModelObserver.appleServicesFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$appleServicesFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__appleServicesFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__appleServicesFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__appleServicesFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t FLFollowUpModelObserver.$appleServicesFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__appleServicesFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t (*FLFollowUpModelObserver.$appleServicesFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__appleServicesFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.primaryAppleAccountNoGroupFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6B26C@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6B280()
{
  return sub_1B8D6C5C0();
}

uint64_t FLFollowUpModelObserver.primaryAppleAccountNoGroupFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t (*FLFollowUpModelObserver.primaryAppleAccountNoGroupFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$primaryAppleAccountNoGroupFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t FLFollowUpModelObserver.$primaryAppleAccountNoGroupFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t (*FLFollowUpModelObserver.$primaryAppleAccountNoGroupFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountNoGroupFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.secondaryAppleAccountFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6B45C@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6B470()
{
  return sub_1B8D6C5C0();
}

uint64_t FLFollowUpModelObserver.secondaryAppleAccountFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t (*FLFollowUpModelObserver.secondaryAppleAccountFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$secondaryAppleAccountFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t FLFollowUpModelObserver.$secondaryAppleAccountFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t (*FLFollowUpModelObserver.$secondaryAppleAccountFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.secondaryAppleAccountNoGroupFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6B64C@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6B660()
{
  return sub_1B8D6C5C0();
}

uint64_t FLFollowUpModelObserver.secondaryAppleAccountNoGroupFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t (*FLFollowUpModelObserver.secondaryAppleAccountNoGroupFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$secondaryAppleAccountNoGroupFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6B728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t FLFollowUpModelObserver.$secondaryAppleAccountNoGroupFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountNoGroupFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t (*FLFollowUpModelObserver.$secondaryAppleAccountNoGroupFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountNoGroupFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.deviceFollowUpGroupSectionElement.getter()
{
  return sub_1B8D6C050();
}

double sub_1B8D6B840@<D0>(_OWORD *a1@<X8>)
{
  return sub_1B8D6C0C0(a1);
}

uint64_t sub_1B8D6B854(uint64_t *a1)
{
  return sub_1B8D6C154(a1);
}

uint64_t FLFollowUpModelObserver.deviceFollowUpGroupSectionElement.setter()
{
  return sub_1B8D6C228();
}

uint64_t (*FLFollowUpModelObserver.deviceFollowUpGroupSectionElement.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$deviceFollowUpGroupSectionElement.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t sub_1B8D6B908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t sub_1B8D6B91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF238, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t FLFollowUpModelObserver.$deviceFollowUpGroupSectionElement.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF238, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t (*FLFollowUpModelObserver.$deviceFollowUpGroupSectionElement.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF238);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUpGroupSectionElement;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBB0);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.deviceFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6BA30@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6BA44()
{
  return sub_1B8D6C5C0();
}

uint64_t FLFollowUpModelObserver.deviceFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t (*FLFollowUpModelObserver.deviceFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$deviceFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6BAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6BB0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t FLFollowUpModelObserver.$deviceFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t (*FLFollowUpModelObserver.$deviceFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.newDeviceOutreachFollowUpGroupSectionElement.getter()
{
  return sub_1B8D6C050();
}

double sub_1B8D6BC20@<D0>(_OWORD *a1@<X8>)
{
  return sub_1B8D6C0C0(a1);
}

uint64_t sub_1B8D6BC34(uint64_t *a1)
{
  return sub_1B8D6C154(a1);
}

uint64_t FLFollowUpModelObserver.newDeviceOutreachFollowUpGroupSectionElement.setter()
{
  return sub_1B8D6C228();
}

uint64_t (*FLFollowUpModelObserver.newDeviceOutreachFollowUpGroupSectionElement.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$newDeviceOutreachFollowUpGroupSectionElement.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t sub_1B8D6BCE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t sub_1B8D6BCFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF238, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t FLFollowUpModelObserver.$newDeviceOutreachFollowUpGroupSectionElement.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF238, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t (*FLFollowUpModelObserver.$newDeviceOutreachFollowUpGroupSectionElement.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF238);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUpGroupSectionElement;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBB0);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t FLFollowUpModelObserver.newDeviceOutreachFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6BE10@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6BE24()
{
  return sub_1B8D6C5C0();
}

uint64_t FLFollowUpModelObserver.newDeviceOutreachFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t (*FLFollowUpModelObserver.newDeviceOutreachFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$newDeviceOutreachFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6BED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6BEEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t FLFollowUpModelObserver.$newDeviceOutreachFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t (*FLFollowUpModelObserver.$newDeviceOutreachFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t sub_1B8D6BFEC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DECA0);
  return sub_1B8D719D4();
}

uint64_t FLFollowUpModelObserver.unauthorizedFollowUpGroupSectionElement.getter()
{
  return sub_1B8D6C050();
}

uint64_t sub_1B8D6C050()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  return swift_release();
}

double sub_1B8D6C0AC@<D0>(_OWORD *a1@<X8>)
{
  return sub_1B8D6C0C0(a1);
}

double sub_1B8D6C0C0@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  *a1 = v3;
  a1[1] = v4;
  result = *(double *)&v5;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_1B8D6C140(uint64_t *a1)
{
  return sub_1B8D6C154(a1);
}

uint64_t sub_1B8D6C154(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D6FAA0(v1);
  swift_retain();
  return sub_1B8D71A10();
}

uint64_t FLFollowUpModelObserver.unauthorizedFollowUpGroupSectionElement.setter()
{
  return sub_1B8D6C228();
}

uint64_t sub_1B8D6C228()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1B8D71A10();
}

uint64_t (*FLFollowUpModelObserver.unauthorizedFollowUpGroupSectionElement.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

uint64_t FLFollowUpModelObserver.$unauthorizedFollowUpGroupSectionElement.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t sub_1B8D6C34C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t sub_1B8D6C360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF238, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t FLFollowUpModelObserver.$unauthorizedFollowUpGroupSectionElement.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF238, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUpGroupSectionElement, &qword_1EF1DEBB0);
}

uint64_t (*FLFollowUpModelObserver.$unauthorizedFollowUpGroupSectionElement.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF238);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUpGroupSectionElement;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBB0);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

uint64_t sub_1B8D6C460()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DECB8);
  return sub_1B8D719D4();
}

uint64_t FLFollowUpModelObserver.unauthorizedFollowUps.getter()
{
  return sub_1B8D6C4B8();
}

uint64_t sub_1B8D6C4B8()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B8D6C520@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B8D6C534(a1);
}

uint64_t sub_1B8D6C534@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B8D71A04();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1B8D6C5AC()
{
  return sub_1B8D6C5C0();
}

uint64_t sub_1B8D6C5C0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_1B8D71A10();
}

uint64_t FLFollowUpModelObserver.unauthorizedFollowUps.setter()
{
  return sub_1B8D6C648();
}

uint64_t sub_1B8D6C648()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1B8D71A10();
}

uint64_t (*FLFollowUpModelObserver.unauthorizedFollowUps.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B8D719F8();
  return sub_1B8D6AF2C;
}

void sub_1B8D6C728(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t FLFollowUpModelObserver.$unauthorizedFollowUps.getter()
{
  return sub_1B8D6C788((uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6C788(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_1B8D719E0();
  return swift_endAccess();
}

uint64_t sub_1B8D6C7EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8D6C800(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6C800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_1B8D719E0();
  return swift_endAccess();
}

uint64_t sub_1B8D6C86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8D6C888(a1, a2, a3, a4, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6C888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_1B8D719EC();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t FLFollowUpModelObserver.$unauthorizedFollowUps.setter(uint64_t a1)
{
  return sub_1B8D6C9BC(a1, &qword_1EF1DF230, (uint64_t)&OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUps, (uint64_t *)&unk_1EF1DEBB8);
}

uint64_t sub_1B8D6C9BC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1B8D719EC();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*FLFollowUpModelObserver.$unauthorizedFollowUps.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF230);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  sub_1B8D719E0();
  swift_endAccess();
  return sub_1B8D6B064;
}

void sub_1B8D6CB5C(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1B8D719EC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_1B8D719EC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t (*sub_1B8D6CC74())(uint64_t (*a1)(void))
{
  return sub_1B8D6CC84;
}

uint64_t sub_1B8D6CC84(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t FLFollowUpModelObserver.__allocating_init(primaryAppleAccountIdentifierForFollowUpsRetriever:secondaryAppleAccountsIdentifiersForFollowUpsRetriever:onUpdateBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v23 = a1;
  v27 = a5;
  v28 = a6;
  v25 = a3;
  v26 = a4;
  v24 = a2;
  v6 = sub_1B8D71BE4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC90);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC80);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_1B8D71BF0();

  sub_1B8D69810(&qword_1EF1DEC98, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1F30], MEMORY[0x1E0CB1F20]);
  sub_1B8D71A40();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1B8D69850(&qword_1EF1DEC88, &qword_1EF1DEC90, MEMORY[0x1E0C95988]);
  sub_1B8D71A34();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_1B8D69850(&qword_1EF1DEC78, &qword_1EF1DEC80, MEMORY[0x1E0C95950]);
  v19 = sub_1B8D71A28();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v20 = swift_allocObject();
  FLFollowUpModelObserver.init(primaryAppleAccountIdentifierForFollowUpsRetriever:secondaryAppleAccountsIdentifiersForFollowUpsRetriever:accountChangePublisher:onUpdateBlock:)(v23, v24, v25, v26, v19, v27, v28);
  return v20;
}

uint64_t (*sub_1B8D6CEF0())(uint64_t (*)(void))
{
  return sub_1B8D6FC48;
}

uint64_t FLFollowUpModelObserver.__allocating_init(primaryAppleAccountIdentifierForFollowUpsRetriever:secondaryAppleAccountsIdentifiersForFollowUpsRetriever:accountChangePublisher:onUpdateBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;

  v14 = swift_allocObject();
  FLFollowUpModelObserver.init(primaryAppleAccountIdentifierForFollowUpsRetriever:secondaryAppleAccountsIdentifiersForFollowUpsRetriever:accountChangePublisher:onUpdateBlock:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

uint64_t FLFollowUpModelObserver.init(primaryAppleAccountIdentifierForFollowUpsRetriever:secondaryAppleAccountsIdentifiersForFollowUpsRetriever:accountChangePublisher:onUpdateBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v8 = v7;
  v55 = a6;
  v56 = a7;
  v59 = a4;
  v60 = a5;
  v57 = a2;
  v58 = a3;
  v61 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC08);
  MEMORY[0x1E0C80A78](v9);
  v54 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBB0);
  v11 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  v18 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountFollowUps;
  *(_QWORD *)&v62 = MEMORY[0x1E0DEE9D8];
  v19 = MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DECB8);
  sub_1B8D719D4();
  v20 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 32);
  v20(v18, v17, v14);
  v21 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__appleServicesFollowUps;
  *(_QWORD *)&v62 = v19;
  sub_1B8D719D4();
  v20(v21, v17, v14);
  v22 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountNoGroupFollowUps;
  *(_QWORD *)&v62 = v19;
  sub_1B8D719D4();
  v20(v22, v17, v14);
  v23 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountFollowUps;
  *(_QWORD *)&v62 = v19;
  sub_1B8D719D4();
  v20(v23, v17, v14);
  v24 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountNoGroupFollowUps;
  *(_QWORD *)&v62 = v19;
  sub_1B8D719D4();
  v20(v24, v17, v14);
  v25 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUpGroupSectionElement;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DECA0);
  sub_1B8D719D4();
  v26 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v27 = v53;
  v26(v25, v13, v53);
  v28 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUps;
  *(_QWORD *)&v62 = MEMORY[0x1E0DEE9D8];
  sub_1B8D719D4();
  v20(v28, v17, v14);
  v29 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUpGroupSectionElement;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  sub_1B8D719D4();
  v26(v29, v13, v27);
  v30 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUps;
  *(_QWORD *)&v62 = MEMORY[0x1E0DEE9D8];
  sub_1B8D719D4();
  v20(v30, v17, v14);
  v31 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUpGroupSectionElement;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  sub_1B8D719D4();
  v26(v31, v13, v27);
  v32 = v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUps;
  *(_QWORD *)&v62 = MEMORY[0x1E0DEE9D8];
  sub_1B8D719D4();
  v20(v32, v17, v14);
  *(_QWORD *)(v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver_observerTask) = 0;
  sub_1B8D71AC4();
  v33 = objc_allocWithZone((Class)FLTopLevelViewModel);
  v34 = (void *)sub_1B8D71AA0();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend(v33, sel_initWithBundleIdentifier_clientIdentifier_, v34, 0);

  *(_QWORD *)(v8 + 16) = v35;
  v37 = v55;
  v36 = v56;
  *(_QWORD *)(v8 + 88) = v55;
  *(_QWORD *)(v8 + 96) = v36;
  v38 = sub_1B8D71B48();
  v39 = (uint64_t)v54;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v54, 1, 1, v38);
  sub_1B8D71B30();
  v40 = v35;
  swift_retain_n();
  v41 = v40;
  v42 = v57;
  swift_retain();
  v44 = v58;
  v43 = v59;
  sub_1B8D67258(v58);
  v45 = v60;
  swift_retain();
  swift_retain();
  v46 = sub_1B8D71B24();
  v47 = (_QWORD *)swift_allocObject();
  v48 = MEMORY[0x1E0DF06E8];
  v47[2] = v46;
  v47[3] = v48;
  v49 = v61;
  v47[4] = v41;
  v47[5] = v49;
  v47[6] = v42;
  v47[7] = v44;
  v47[8] = v43;
  v47[9] = v45;
  v47[10] = v37;
  v47[11] = v36;
  v47[12] = v8;
  v50 = sub_1B8D67300(v39, (uint64_t)&unk_1EF1DF248, (uint64_t)v47);
  swift_release();
  swift_release();
  sub_1B8D6D960(v44);

  swift_release();
  *(_QWORD *)(v8 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver_observerTask) = v50;
  swift_release();
  return v8;
}

uint64_t sub_1B8D6D4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v8 + 200) = v14;
  *(_QWORD *)(v8 + 208) = v15;
  *(_OWORD *)(v8 + 184) = v13;
  *(_QWORD *)(v8 + 168) = a7;
  *(_QWORD *)(v8 + 176) = a8;
  *(_QWORD *)(v8 + 152) = a5;
  *(_QWORD *)(v8 + 160) = a6;
  *(_QWORD *)(v8 + 144) = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC28);
  *(_QWORD *)(v8 + 216) = v9;
  *(_QWORD *)(v8 + 224) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 232) = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEC30);
  *(_QWORD *)(v8 + 240) = v10;
  *(_QWORD *)(v8 + 248) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 256) = swift_task_alloc();
  *(_QWORD *)(v8 + 264) = sub_1B8D71B30();
  *(_QWORD *)(v8 + 272) = sub_1B8D71B24();
  *(_QWORD *)(v8 + 280) = sub_1B8D71B0C();
  *(_QWORD *)(v8 + 288) = v11;
  return swift_task_switch();
}

uint64_t sub_1B8D6D58C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = v0[22];
  v1 = v0[23];
  v4 = v0[20];
  v3 = v0[21];
  v5 = v0[18];
  v6 = v0[19];
  sub_1B8D697D8(0, &qword_1EF1DEC50);
  sub_1B8D66A34(v5, v6, v4, v3, v2, v1);
  sub_1B8D71B6C();
  v0[37] = sub_1B8D71B24();
  v7 = (_QWORD *)swift_task_alloc();
  v0[38] = v7;
  *v7 = v0;
  v7[1] = sub_1B8D6D68C;
  return sub_1B8D71B78();
}

uint64_t sub_1B8D6D68C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1B8D6D6E0()
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
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t (*)(), uint64_t);
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 80);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 96);
    v2 = *(_QWORD *)(v0 + 88);
    v4 = *(_QWORD *)(v0 + 104);
    v5 = *(_QWORD *)(v0 + 112);
    v6 = *(_QWORD *)(v0 + 120);
    v7 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 136);
    v18 = *(void (**)(uint64_t (*)(), uint64_t))(v0 + 192);
    *(_QWORD *)(v0 + 16) = v1;
    *(_QWORD *)(v0 + 24) = v2;
    *(_QWORD *)(v0 + 32) = v3;
    *(_QWORD *)(v0 + 40) = v4;
    *(_QWORD *)(v0 + 48) = v5;
    *(_QWORD *)(v0 + 56) = v6;
    *(_QWORD *)(v0 + 64) = v7;
    *(_QWORD *)(v0 + 72) = v19;
    v9 = swift_task_alloc();
    *(_QWORD *)(v9 + 16) = v8;
    *(_QWORD *)(v9 + 24) = v0 + 16;
    v18(sub_1B8D6F964, v9);
    sub_1B8D6ADD4(v1);
    swift_task_dealloc();
    *(_QWORD *)(v0 + 296) = sub_1B8D71B24();
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 304) = v10;
    *v10 = v0;
    v10[1] = sub_1B8D6D68C;
    return sub_1B8D71B78();
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 248);
    v12 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 232);
    v14 = *(_QWORD *)(v0 + 240);
    v16 = *(_QWORD *)(v0 + 216);
    v17 = *(_QWORD *)(v0 + 224);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1B8D6D870()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  if (*(_QWORD *)(v0 + 56))
    swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B8D6D8CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = v0[7];
  v6 = v0[8];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_1B8D67614;
  return sub_1B8D6D4A8((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_1B8D6D960(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t FLFollowUpModelObserver.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver_observerTask))
  {
    swift_retain();
    sub_1B8D71B90();
    swift_release();
  }

  sub_1B8D6ADD4(*(_QWORD *)(v0 + 24));
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountFollowUps;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF1DEBB8);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__appleServicesFollowUps, v2);
  v3(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__primaryAppleAccountNoGroupFollowUps, v2);
  v3(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountFollowUps, v2);
  v3(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__secondaryAppleAccountNoGroupFollowUps, v2);
  v4 = v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUpGroupSectionElement;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DEBB0);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v3(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__deviceFollowUps, v2);
  v6(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUpGroupSectionElement, v5);
  v3(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__newDeviceOutreachFollowUps, v2);
  v6(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUpGroupSectionElement, v5);
  v3(v0 + OBJC_IVAR____TtC12CoreFollowUp23FLFollowUpModelObserver__unauthorizedFollowUps, v2);
  swift_release();
  return v0;
}

uint64_t FLFollowUpModelObserver.__deallocating_deinit()
{
  FLFollowUpModelObserver.deinit();
  return swift_deallocClassInstance();
}

uint64_t FLFollowUpModelObserver.followUpGroup(with:)(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v2 = *(void **)a1;
  v3 = *(_BYTE *)(a1 + 24);
  swift_beginAccess();
  v4 = v1[3];
  if (v4)
  {
    v5 = v1[4];
    v57 = v1[6];
    v6 = v1[8];
    v58 = v1[7];
    v59 = v1[5];
    v8 = v1[9];
    v7 = v1[10];
    v9 = sub_1B8D71AC4();
    v11 = v10;
    v14 = v9 == sub_1B8D71AC4() && v11 == v12;
    v56 = v5;
    if ((v3 & 1) != 0)
    {
      if (v14)
      {
        v15 = v57;
        sub_1B8D6AC5C(v4);
        swift_bridgeObjectRelease_n();
LABEL_15:
        swift_unknownObjectRetain();
        v16 = v15;
        goto LABEL_37;
      }
      v17 = sub_1B8D71C5C();
      v15 = v57;
      v18 = v6;
      v19 = v8;
      v20 = v7;
      sub_1B8D6AC5C(v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        goto LABEL_15;
      v22 = sub_1B8D71AC4();
      v24 = v23;
      if (v22 == sub_1B8D71AC4() && v24 == v25)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v27 = sub_1B8D71C5C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v27 & 1) == 0)
          goto LABEL_41;
      }
      v16 = v58;
      goto LABEL_36;
    }
    if (v14)
    {
      sub_1B8D6AC5C(v4);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v21 = sub_1B8D71C5C();
      v18 = v6;
      v19 = v8;
      v20 = v7;
      sub_1B8D6AC5C(v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0)
      {
        v28 = sub_1B8D71AC4();
        v30 = v29;
        if (v28 == sub_1B8D71AC4() && v30 == v31)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          v33 = sub_1B8D71C5C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v33 & 1) == 0)
          {
            v34 = sub_1B8D71AC4();
            v36 = v35;
            if (v34 == sub_1B8D71AC4() && v36 == v37)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              v39 = sub_1B8D71C5C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v39 & 1) == 0)
              {
LABEL_41:
                v40 = sub_1B8D71AC4();
                v42 = v41;
                if (v40 == sub_1B8D71AC4() && v42 == v43)
                {
                  swift_bridgeObjectRelease_n();
                }
                else
                {
                  v44 = sub_1B8D71C5C();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v44 & 1) == 0)
                  {
                    v45 = sub_1B8D71AC4();
                    v47 = v46;
                    if (v45 == sub_1B8D71AC4() && v47 == v48)
                    {
                      swift_bridgeObjectRelease_n();
                    }
                    else
                    {
                      v49 = sub_1B8D71C5C();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      if ((v49 & 1) == 0)
                      {
                        v50 = v2;
                        sub_1B8D65094();
                        swift_beginAccess();
                        v51 = sub_1B8D71AC4();
                        v53 = v52;
                        if (v51 == sub_1B8D71AC4() && v53 == v54)
                        {

                          swift_bridgeObjectRelease_n();
                        }
                        else
                        {
                          v55 = sub_1B8D71C5C();

                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          if ((v55 & 1) == 0)
                          {
                            v16 = 0;
                            goto LABEL_37;
                          }
                        }
                        swift_unknownObjectRetain();
                        v16 = v20;
LABEL_37:
                        sub_1B8D6ADD4(v4);
                        return v16;
                      }
                    }
                    swift_unknownObjectRetain();
                    v16 = v19;
                    goto LABEL_37;
                  }
                }
                swift_unknownObjectRetain();
                v16 = v18;
                goto LABEL_37;
              }
            }
            swift_unknownObjectRetain();
            v16 = v56;
            goto LABEL_37;
          }
        }
        v16 = v59;
LABEL_36:
        swift_unknownObjectRetain();
        goto LABEL_37;
      }
    }
    swift_unknownObjectRetain();
    v16 = v4;
    goto LABEL_37;
  }
  return 0;
}

void __swiftcall FLFollowUpModelObserver.followUpItem(with:)(FLFollowUpItem_optional *__return_ptr retstr, CoreFollowUp::FLFollowUpInformation *with)
{
  _QWORD *v2;
  NSString rawValue;
  CoreFollowUp::FLAccountType accountType;
  uint64_t object;
  uint64_t countAndFlagsBits;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  id v36;
  unint64_t v37;
  char v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  id v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  id v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  void *v72;

  rawValue = with->groupIdentity.groupType._rawValue;
  accountType = with->groupIdentity.accountType;
  countAndFlagsBits = with->itemIdentifier.value._countAndFlagsBits;
  object = (uint64_t)with->itemIdentifier.value._object;
  swift_beginAccess();
  v7 = (void *)v2[3];
  if (v7 && object)
  {
    v8 = (void *)v2[6];
    v72 = (void *)v2[5];
    v9 = (void *)v2[8];
    v70 = (id)v2[4];
    v71 = (id)v2[7];
    v10 = (void *)v2[10];
    v68 = countAndFlagsBits;
    v69 = (id)v2[9];
    v11 = sub_1B8D71AC4();
    v13 = v12;
    v16 = v11 == sub_1B8D71AC4() && v13 == v14;
    if ((accountType & 1) != 0)
    {
      if (v16)
      {
        sub_1B8D6AC5C((uint64_t)v7);
        swift_bridgeObjectRelease_n();
LABEL_15:
        if (v8)
        {
          v19 = objc_msgSend(v8, sel_items);
LABEL_17:
          v20 = v19;
          sub_1B8D697D8(0, &qword_1EF1DEC38);
          v21 = sub_1B8D71AF4();

          swift_bridgeObjectRetain();
          sub_1B8D6F618(v21, v68, object);
          swift_bridgeObjectRelease();
          v22 = (uint64_t)v7;
LABEL_47:
          sub_1B8D6ADD4(v22);
          swift_bridgeObjectRelease();
          return;
        }
        v26 = (uint64_t)v7;
        goto LABEL_35;
      }
      v17 = sub_1B8D71C5C();
      sub_1B8D6AC5C((uint64_t)v7);
      swift_bridgeObjectRelease();
      v18 = v9;
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        goto LABEL_15;
      v27 = sub_1B8D71AC4();
      v29 = v28;
      if (v27 == sub_1B8D71AC4() && v29 == v30)
      {
        swift_bridgeObjectRelease_n();
LABEL_28:
        if (v71)
        {
          v36 = objc_msgSend(v71, sel_items);
          sub_1B8D697D8(0, &qword_1EF1DEC38);
          v37 = sub_1B8D71AF4();

          swift_bridgeObjectRetain();
          sub_1B8D6F618(v37, countAndFlagsBits, object);
          swift_bridgeObjectRelease();
          v22 = (uint64_t)v7;
          goto LABEL_47;
        }
        v26 = (uint64_t)v7;
        goto LABEL_35;
      }
      v35 = sub_1B8D71C5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v35 & 1) != 0)
        goto LABEL_28;
      goto LABEL_42;
    }
    v66 = v8;
    v67 = object;
    if (v16)
    {
      sub_1B8D6AC5C((uint64_t)v7);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v23 = sub_1B8D71C5C();
      sub_1B8D6AC5C((uint64_t)v7);
      swift_bridgeObjectRelease();
      v18 = v9;
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0)
      {
        v31 = sub_1B8D71AC4();
        v33 = v32;
        if (v31 == sub_1B8D71AC4() && v33 == v34)
        {
          swift_bridgeObjectRelease_n();
          object = v67;
        }
        else
        {
          v38 = sub_1B8D71C5C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          object = v67;
          if ((v38 & 1) == 0)
          {
            v41 = sub_1B8D71AC4();
            v43 = v42;
            if (v41 == sub_1B8D71AC4() && v43 == v44)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              v45 = sub_1B8D71C5C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v45 & 1) == 0)
              {
LABEL_42:
                v48 = sub_1B8D71AC4();
                v50 = v49;
                if (v48 == sub_1B8D71AC4() && v50 == v51)
                {
                  swift_bridgeObjectRelease_n();
LABEL_46:
                  v53 = objc_msgSend(v18, sel_items, v66);
                  sub_1B8D697D8(0, &qword_1EF1DEC38);
                  v54 = sub_1B8D71AF4();

                  swift_bridgeObjectRetain();
                  sub_1B8D6F618(v54, countAndFlagsBits, object);
                  swift_bridgeObjectRelease();
                  v22 = (uint64_t)v7;
                  goto LABEL_47;
                }
                v52 = sub_1B8D71C5C();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v52 & 1) != 0)
                  goto LABEL_46;
                v55 = sub_1B8D71AC4();
                v57 = v56;
                if (v55 == sub_1B8D71AC4() && v57 == v58)
                {
                  swift_bridgeObjectRelease_n();
LABEL_52:
                  v19 = objc_msgSend(v69, sel_items, v66);
                  goto LABEL_17;
                }
                v59 = sub_1B8D71C5C();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v59 & 1) != 0)
                  goto LABEL_52;
                v60 = rawValue;
                sub_1B8D65094();
                swift_beginAccess();
                v61 = sub_1B8D71AC4();
                v63 = v62;
                if (v61 == sub_1B8D71AC4() && v63 == v64)
                {

                  swift_bridgeObjectRelease_n();
LABEL_57:
                  if (v10)
                  {
                    v19 = objc_msgSend(v10, sel_items);
                    goto LABEL_17;
                  }
                  v26 = (uint64_t)v7;
                  goto LABEL_35;
                }
                v65 = sub_1B8D71C5C();

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v65 & 1) != 0)
                  goto LABEL_57;
                v26 = (uint64_t)v7;
LABEL_35:
                sub_1B8D6ADD4(v26);
                return;
              }
            }
            v46 = objc_msgSend(v70, sel_items, v8);
            sub_1B8D697D8(0, &qword_1EF1DEC38);
            v47 = sub_1B8D71AF4();

            swift_bridgeObjectRetain();
            sub_1B8D6F618(v47, countAndFlagsBits, v67);
            swift_bridgeObjectRelease();
            v22 = (uint64_t)v7;
            goto LABEL_47;
          }
        }
        if (v72)
        {
          v39 = objc_msgSend(v72, sel_items);
          sub_1B8D697D8(0, &qword_1EF1DEC38);
          v40 = sub_1B8D71AF4();

          swift_bridgeObjectRetain();
          sub_1B8D6F618(v40, countAndFlagsBits, object);
          swift_bridgeObjectRelease();
          v22 = (uint64_t)v7;
          goto LABEL_47;
        }
        v26 = (uint64_t)v7;
        goto LABEL_35;
      }
    }
    v24 = objc_msgSend(v7, sel_items, v8);
    sub_1B8D697D8(0, &qword_1EF1DEC38);
    v25 = sub_1B8D71AF4();

    swift_bridgeObjectRetain();
    sub_1B8D6F618(v25, countAndFlagsBits, v67);
    swift_bridgeObjectRelease();
    v22 = (uint64_t)v7;
    goto LABEL_47;
  }
}

double sub_1B8D6E9DC@<D0>(void *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double result;
  char v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  unsigned __int8 v34;
  id v35;
  __int128 v36;
  unsigned __int8 v37;
  __int128 v38;
  __int128 v39;

  if (!a1)
  {
    result = 0.0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  v5 = *a2;
  v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_identifier);
  if (!v6)
  {
    sub_1B8D71AC4();
    v6 = (id)sub_1B8D71AA0();
    swift_bridgeObjectRelease();
  }
  v7 = objc_msgSend(a1, sel_accountID);
  v8 = sub_1B8D71AC4();
  v10 = v9;

  LOBYTE(v32) = v5;
  sub_1B8D66080((uint64_t)v6, v8, v10, (char *)&v32, (uint64_t)&v35);
  v11 = v36;
  v12 = v37;
  v13 = v35;
  sub_1B8D65094();
  swift_beginAccess();
  v14 = sub_1B8D71AC4();
  v16 = v15;
  if (v14 == sub_1B8D71AC4() && v16 == v17)
  {
    v18 = 0x100000000000004ALL;

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v20 = sub_1B8D71C5C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      v29 = objc_msgSend(a1, sel_footerText);
      if (v29)
      {
        v30 = v29;
        v18 = sub_1B8D71AC4();
        v21 = v31;

      }
      else
      {
        v18 = 0;
        v21 = 0;
      }
      goto LABEL_11;
    }
    v18 = 0x100000000000004ALL;
  }
  v21 = 0x80000001B8D75EE0;
LABEL_11:
  v32 = v13;
  v33 = v11;
  v34 = v12;
  swift_bridgeObjectRetain();
  v22 = v13;
  v23 = objc_msgSend(a1, sel_groupTitle);
  v24 = sub_1B8D71AC4();
  v26 = v25;

  sub_1B8D64644((uint64_t)&v32, v24, v26, v18, v21, (uint64_t)&v35);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  v27 = v37;
  *(_QWORD *)a3 = v35;
  *(_OWORD *)(a3 + 8) = v36;
  *(_QWORD *)(a3 + 24) = v27;
  result = *(double *)&v38;
  v28 = v39;
  *(_OWORD *)(a3 + 32) = v38;
  *(_OWORD *)(a3 + 48) = v28;
  return result;
}

uint64_t sub_1B8D6EC60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1B8D719BC();
  *a1 = result;
  return result;
}

uint64_t sub_1B8D6EC88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  BOOL v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v5 = 1;
    }
    else
    {
      sub_1B8D6FC00();
      v3 = 0;
      v4 = v2 - 1;
      do
      {
        v5 = sub_1B8D71A94();
        v7 = v4-- != 0;
        if ((v5 & 1) == 0)
          break;
        v3 += 96;
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

char *sub_1B8D6EDE0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B8D6EDFC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B8D6EDFC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF258);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8])
      memmove(v12, v13, 96 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B8D6EF10(unint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5, void *a6, char a7)
{
  unint64_t v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *result;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  __int128 v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  char v60;
  _QWORD v61[3];
  char v62;
  uint64_t v63;
  __int128 v64;
  char v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  char v71;
  char v72;
  char v73;
  uint64_t v74;
  id v75;

  LOBYTE(v7) = a7;
  v75 = a6;
  v9 = a1;
  if (a1 >> 62)
    goto LABEL_24;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    if (!v10)
      return (char *)v11;
    v74 = MEMORY[0x1E0DEE9D8];
    result = sub_1B8D6EDE0(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0)
      break;
    v13 = 0;
    v50 = v7 & 1;
    v51 = a5 & 1;
    v11 = v74;
    v49 = v9 & 0xC000000000000001;
    v52 = v10;
    v53 = v9;
    while (v10 != v13)
    {
      v59 = v13;
      if (v49)
        v14 = (id)MEMORY[0x1BCCBB2A8]();
      else
        v14 = *(id *)(v9 + 8 * v13 + 32);
      v15 = v14;
      v61[0] = a2;
      v61[1] = a3;
      v61[2] = a4;
      v62 = v51;
      v16 = a2;
      swift_bridgeObjectRetain();
      v17 = objc_msgSend(v15, sel_uniqueIdentifier);
      if (v17)
      {
        v18 = v17;
        v57 = sub_1B8D71AC4();
        v20 = v19;

      }
      else
      {
        v57 = 0;
        v20 = 0;
      }
      v21 = objc_msgSend(v15, sel_title);
      if (v21)
      {
        v22 = v21;
        v23 = sub_1B8D71AC4();
        v25 = v24;

      }
      else
      {
        v23 = 0;
        v25 = 0xE000000000000000;
      }
      v26 = objc_msgSend(v75, sel_subtitleText);
      if (v26)
      {
        v27 = v26;
        v28 = sub_1B8D71AC4();
        v30 = v29;

      }
      else
      {
        v28 = 0;
        v30 = 0;
      }
      v31 = objc_msgSend(v15, sel_displayStyle);
      v60 = v50;
      sub_1B8D7017C((uint64_t)v61, v57, v20, v23, v25, v28, v30, (v31 & 0x10) == 0, (uint64_t)&v63, (v31 & 0x10) != 0, &v60, (char)objc_msgSend(v75, sel_restrictionEnabled));

      v32 = v63;
      v33 = v64;
      v34 = v65;
      v35 = v66;
      v36 = v67;
      v37 = v68;
      v38 = v69;
      v39 = v70;
      v40 = v71;
      v42 = *(_QWORD *)(v11 + 16);
      v41 = *(_QWORD *)(v11 + 24);
      v7 = v42 + 1;
      a5 = v72;
      v43 = v73;
      v74 = v11;
      if (v42 >= v41 >> 1)
      {
        v58 = v64;
        v47 = v69;
        v48 = v66;
        v46 = v63;
        v45 = v65;
        sub_1B8D6EDE0((char *)(v41 > 1), v42 + 1, 1);
        v34 = v45;
        v32 = v46;
        v38 = v47;
        v35 = v48;
        v33 = v58;
        v11 = v74;
      }
      *(_QWORD *)(v11 + 16) = v7;
      v44 = v11 + 96 * v42;
      *(_QWORD *)(v44 + 32) = v32;
      v13 = v59 + 1;
      *(_OWORD *)(v44 + 40) = v33;
      *(_BYTE *)(v44 + 56) = v34;
      *(_OWORD *)(v44 + 64) = v35;
      *(_QWORD *)(v44 + 80) = v36;
      *(_QWORD *)(v44 + 88) = v37;
      *(_OWORD *)(v44 + 96) = v38;
      *(_QWORD *)(v44 + 112) = v39;
      *(_BYTE *)(v44 + 120) = v40;
      *(_BYTE *)(v44 + 121) = a5;
      *(_BYTE *)(v44 + 122) = v43;
      v10 = v52;
      v9 = v53;
      if (v52 == v59 + 1)
        return (char *)v11;
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    v10 = sub_1B8D71C38();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B8D6F250(void *a1, char *a2)
{
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  id v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  id v36;
  char v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;

  if (!a1)
    return MEMORY[0x1E0DEE9D8];
  v3 = *a2;
  v4 = objc_msgSend((id)swift_unknownObjectRetain(), sel_identifier);
  if (!v4)
  {
    sub_1B8D71AC4();
    v4 = (id)sub_1B8D71AA0();
    swift_bridgeObjectRelease();
  }
  v5 = objc_msgSend(a1, sel_accountID);
  v6 = sub_1B8D71AC4();
  v8 = v7;

  v37 = v3;
  sub_1B8D66080((uint64_t)v4, v6, v8, &v37, (uint64_t)&v38);
  v10 = v38;
  v9 = v39;
  v11 = v40;
  v12 = v41;
  v13 = sub_1B8D71AC4();
  v15 = v14;
  if (v13 == sub_1B8D71AC4() && v15 == v16)
    v18 = 1;
  else
    v18 = sub_1B8D71C5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((objc_msgSend(a1, sel_shouldCoalesceItems) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1DF258);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1B8D73B20;
    v38 = v10;
    v39 = v9;
    v40 = v11;
    v41 = v12;
    swift_bridgeObjectRetain();
    v36 = v10;
    v20 = objc_msgSend(a1, sel_rowTitle);
    v21 = sub_1B8D71AC4();
    v23 = v22;

    v24 = objc_msgSend(a1, sel_subtitleText);
    if (v24)
    {
      v25 = v24;
      v26 = sub_1B8D71AC4();
      v28 = v27;

    }
    else
    {
      v26 = 0;
      v28 = 0;
    }
    v32 = objc_msgSend(a1, sel_items);
    sub_1B8D697D8(0, &qword_1EF1DEC38);
    v33 = sub_1B8D71AF4();

    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      v34 = sub_1B8D71C38();
      swift_bridgeObjectRelease();
    }
    else
    {
      v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v37 = v18 & 1;
    sub_1B8D7017C((uint64_t)&v38, 0, 0, v21, v23, v26, v28, v34, v19 + 32, 0, &v37, (char)objc_msgSend(a1, sel_restrictionEnabled));
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    v29 = objc_msgSend(a1, sel_items);
    sub_1B8D697D8(0, &qword_1EF1DEC38);
    v30 = sub_1B8D71AF4();

    swift_unknownObjectRetain();
    v31 = v10;
    swift_bridgeObjectRetain();
    v19 = (uint64_t)sub_1B8D6EF10(v30, v31, v9, v11, v12, a1, v18 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease_n();
  }
  return v19;
}

void *sub_1B8D6F618(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  if (a1 >> 62)
    goto LABEL_20;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_1B8D71C38())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1BCCBB2A8](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, sel_uniqueIdentifier);
      if (v10)
      {
        v11 = v10;
        v12 = sub_1B8D71AC4();
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        v16 = sub_1B8D71C5C();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_18;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B8D6F7A8()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1B8D6F7B4()
{
  return type metadata accessor for FLFollowUpModelObserver();
}

uint64_t type metadata accessor for FLFollowUpModelObserver()
{
  uint64_t result;

  result = qword_1EF1DF6B0;
  if (!qword_1EF1DF6B0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B8D6F7F8()
{
  unint64_t v0;
  unint64_t v1;

  sub_1B8D6F8F4(319, &qword_1EF1DECB0, &qword_1EF1DECB8);
  if (v0 <= 0x3F)
  {
    sub_1B8D6F8F4(319, &qword_1EF1DECA8, &qword_1EF1DECA0);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for FLFollowUpModelObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FLFollowUpModelObserver.__allocating_init(primaryAppleAccountIdentifierForFollowUpsRetriever:secondaryAppleAccountsIdentifiersForFollowUpsRetriever:accountChangePublisher:onUpdateBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

void sub_1B8D6F8F4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_1B8D71A1C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1B8D6F940()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B8D6F964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v9 = *(_OWORD *)(v2 + 32);
  v10 = *(_OWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 48);
  v4 = *(_QWORD *)(v2 + 56);
  sub_1B8D71B9C();
  sub_1B8D697D8(0, &qword_1EF1DEC68);
  v8 = *(_OWORD *)v2;
  v5 = (void *)sub_1B8D71BFC();
  sub_1B8D719A4();

  v11[0] = v8;
  v11[1] = v10;
  v11[2] = v9;
  v12 = v3;
  v13 = v4;
  sub_1B8D696CC(v2);
  sub_1B8D698B8(v11);
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 24);
  sub_1B8D6AD8C((uint64_t)v11, v1 + 24);
  return sub_1B8D6ADD4(v6);
}

uint64_t sub_1B8D6FAA0(uint64_t result)
{
  void *v1;
  id v2;

  if (result)
  {
    v1 = (void *)result;
    swift_bridgeObjectRetain();
    v2 = v1;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1B8D6FAEC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  sub_1B8D6FB78(*(void **)a1);
  sub_1B8D6FB78(v2);
  return a1;
}

void *sub_1B8D6FB78(void *result)
{
  if (result)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_1B8D6FBC4(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
  return a1;
}

unint64_t sub_1B8D6FC00()
{
  unint64_t result;

  result = qword_1EF1DEC70;
  if (!qword_1EF1DEC70)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLFollowUpInformation, &type metadata for FLFollowUpInformation);
    atomic_store(result, (unint64_t *)&qword_1EF1DEC70);
  }
  return result;
}

id FLFollowUpInformation.groupIdentity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v6;

  v2 = *(_QWORD *)(v1 + 8);
  v6 = *(id *)v1;
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  swift_bridgeObjectRetain();
  return v6;
}

__n128 FLFollowUpInformation.groupIdentity.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u8[8];

  swift_bridgeObjectRelease();
  result = v5;
  *(__n128 *)v1 = v5;
  *(_QWORD *)(v1 + 16) = v2;
  *(_BYTE *)(v1 + 24) = v3;
  return result;
}

uint64_t (*FLFollowUpInformation.groupIdentity.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpInformation.itemIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FLFollowUpInformation.itemIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*FLFollowUpInformation.itemIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpInformation.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FLFollowUpInformation.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*FLFollowUpInformation.title.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpInformation.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FLFollowUpInformation.subtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t (*FLFollowUpInformation.subtitle.modify())()
{
  return nullsub_1;
}

uint64_t sub_1B8D6FE44()
{
  return 0;
}

uint64_t FLFollowUpInformation.badgeValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t FLFollowUpInformation.badgeValue.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = result;
  *(_BYTE *)(v2 + 88) = a2 & 1;
  return result;
}

uint64_t (*FLFollowUpInformation.badgeValue.modify())()
{
  return nullsub_1;
}

void FLFollowUpInformation.renderStyle.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 89);
}

_BYTE *FLFollowUpInformation.renderStyle.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 89) = *result;
  return result;
}

uint64_t (*FLFollowUpInformation.renderStyle.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpInformation.restrictionEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 90);
}

uint64_t FLFollowUpInformation.restrictionEnabled.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 90) = result;
  return result;
}

uint64_t (*FLFollowUpInformation.restrictionEnabled.modify())()
{
  return nullsub_1;
}

uint64_t FLFollowUpInformation.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  id v12;

  v3 = *(void **)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 56);
  v7 = *(_QWORD *)(v1 + 64);
  v9 = *(_BYTE *)(v1 + 88);
  v10 = *(_BYTE *)(v1 + 89);
  v11 = *(_BYTE *)(v1 + 90);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(v1 + 72);
  *(_BYTE *)(a1 + 88) = v9;
  *(_BYTE *)(a1 + 89) = v10;
  *(_BYTE *)(a1 + 90) = v11;
  swift_bridgeObjectRetain();
  v12 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t FLFollowUpInformation.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(unsigned __int8 *)(v0 + 88);
  sub_1B8D6459C();
  sub_1B8D71A88();
  sub_1B8D71C80();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_1B8D71AD0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_1B8D71AD0();
  swift_bridgeObjectRelease();
  if (!v2)
  {
    sub_1B8D71C80();
    if (v3)
      goto LABEL_5;
LABEL_7:
    sub_1B8D71C80();
    sub_1B8D71C74();
    goto LABEL_8;
  }
  sub_1B8D71C80();
  swift_bridgeObjectRetain();
  sub_1B8D71AD0();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_7;
LABEL_5:
  sub_1B8D71C80();
LABEL_8:
  sub_1B8D71C74();
  return sub_1B8D71C80();
}

BOOL static FLRenderStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FLFollowUpInformation.hashValue.getter()
{
  sub_1B8D71C68();
  FLFollowUpInformation.hash(into:)();
  return sub_1B8D71C8C();
}

__n128 sub_1B8D7017C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char *a11, char a12)
{
  char v12;
  char v13;
  __n128 result;

  v12 = *(_BYTE *)(a1 + 24);
  v13 = *a11;
  *(_QWORD *)a9 = *(_QWORD *)a1;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a9 + 8) = result;
  *(_BYTE *)(a9 + 24) = v12;
  *(_QWORD *)(a9 + 32) = a2;
  *(_QWORD *)(a9 + 40) = a3;
  *(_QWORD *)(a9 + 48) = a4;
  *(_QWORD *)(a9 + 56) = a5;
  *(_QWORD *)(a9 + 64) = a6;
  *(_QWORD *)(a9 + 72) = a7;
  *(_QWORD *)(a9 + 80) = a8;
  *(_BYTE *)(a9 + 88) = a10 & 1;
  *(_BYTE *)(a9 + 89) = v13;
  *(_BYTE *)(a9 + 90) = a12;
  return result;
}

uint64_t sub_1B8D701C8()
{
  sub_1B8D71C68();
  FLFollowUpInformation.hash(into:)();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D7025C()
{
  sub_1B8D71C68();
  FLFollowUpInformation.hash(into:)();
  return sub_1B8D71C8C();
}

uint64_t sub_1B8D702E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  id v12;

  v3 = *(void **)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 56);
  v7 = *(_QWORD *)(v1 + 64);
  v9 = *(_BYTE *)(v1 + 88);
  v10 = *(_BYTE *)(v1 + 89);
  v11 = *(_BYTE *)(v1 + 90);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(v1 + 72);
  *(_BYTE *)(a1 + 88) = v9;
  *(_BYTE *)(a1 + 89) = v10;
  *(_BYTE *)(a1 + 90) = v11;
  swift_bridgeObjectRetain();
  v12 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

BOOL sub_1B8D70380(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  _OWORD v8[2];
  _OWORD v9[4];
  _OWORD v10[2];

  v2 = a1[3];
  v7[2] = a1[2];
  v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 11) = *(_OWORD *)((char *)a1 + 75);
  v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 11) = *(_OWORD *)((char *)a2 + 75);
  v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_1B8D703E8(v7, v9);
}

BOOL sub_1B8D703E8(_OWORD *a1, _OWORD *a2)
{
  _OWORD v5[2];
  _OWORD v6[2];

  v6[0] = *a2;
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a2 + 9);
  v5[0] = *a1;
  *(_OWORD *)((char *)v5 + 9) = *(_OWORD *)((char *)a1 + 9);
  if ((static FLFollowUpGroupIdentity.< infix(_:_:)((uint64_t)v6, (uint64_t)v5) & 1) == 0)
    return 1;
  v6[0] = a2[3];
  v5[0] = a1[3];
  sub_1B8D70EE4();
  return sub_1B8D71C08() != -1;
}

BOOL sub_1B8D70484(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  _OWORD v8[2];
  _OWORD v9[4];
  _OWORD v10[2];

  v2 = a1[3];
  v7[2] = a1[2];
  v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 11) = *(_OWORD *)((char *)a1 + 75);
  v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 11) = *(_OWORD *)((char *)a2 + 75);
  v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_1B8D704EC(v7, v9);
}

BOOL sub_1B8D704EC(_OWORD *a1, _OWORD *a2)
{
  _OWORD v5[2];
  _OWORD v6[2];

  v6[0] = *a1;
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a1 + 9);
  v5[0] = *a2;
  *(_OWORD *)((char *)v5 + 9) = *(_OWORD *)((char *)a2 + 9);
  if ((static FLFollowUpGroupIdentity.< infix(_:_:)((uint64_t)v6, (uint64_t)v5) & 1) == 0)
    return 1;
  v6[0] = a1[3];
  v5[0] = a2[3];
  sub_1B8D70EE4();
  return sub_1B8D71C08() != -1;
}

BOOL sub_1B8D70588(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  _OWORD v8[2];
  _OWORD v9[4];
  _OWORD v10[2];

  v2 = a1[3];
  v7[2] = a1[2];
  v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 11) = *(_OWORD *)((char *)a1 + 75);
  v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 11) = *(_OWORD *)((char *)a2 + 75);
  v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_1B8D705F0(v7, v9);
}

BOOL sub_1B8D705F0(_OWORD *a1, _OWORD *a2)
{
  _OWORD v5[2];
  _OWORD v6[2];

  v6[0] = *a2;
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a2 + 9);
  v5[0] = *a1;
  *(_OWORD *)((char *)v5 + 9) = *(_OWORD *)((char *)a1 + 9);
  if ((static FLFollowUpGroupIdentity.< infix(_:_:)((uint64_t)v6, (uint64_t)v5) & 1) == 0)
    return 0;
  v6[0] = a2[3];
  v5[0] = a1[3];
  sub_1B8D70EE4();
  return sub_1B8D71C08() == -1;
}

uint64_t FLRenderStyle.hash(into:)()
{
  return sub_1B8D71C74();
}

uint64_t FLRenderStyle.hashValue.getter()
{
  sub_1B8D71C68();
  sub_1B8D71C74();
  return sub_1B8D71C8C();
}

BOOL _s12CoreFollowUp08FLFollowC11InformationV1loiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  char v15;

  v2 = *((_BYTE *)a1 + 24);
  v3 = a1[6];
  v4 = a1[7];
  v5 = *a2;
  v6 = *((_BYTE *)a2 + 24);
  v7 = a2[6];
  v8 = a2[7];
  v13 = *a1;
  v14 = *(_OWORD *)(a1 + 1);
  v15 = v2;
  v10 = v5;
  v11 = *(_OWORD *)(a2 + 1);
  v12 = v6;
  if ((static FLFollowUpGroupIdentity.< infix(_:_:)((uint64_t)&v13, (uint64_t)&v10) & 1) == 0)
    return 0;
  v13 = v3;
  *(_QWORD *)&v14 = v4;
  v10 = v7;
  *(_QWORD *)&v11 = v8;
  sub_1B8D70EE4();
  return sub_1B8D71C08() == -1;
}

uint64_t _s12CoreFollowUp08FLFollowC11InformationV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  char v29;
  char v30;
  uint64_t result;
  char v32;
  char v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  char v52;
  uint64_t v53;
  __int128 v54;
  char v55;

  v2 = *((_BYTE *)a1 + 24);
  v46 = a1[4];
  v43 = a1[6];
  v41 = a1[7];
  v48 = a1[5];
  v49 = a1[8];
  v40 = a1[9];
  v44 = a1[10];
  v42 = *((_BYTE *)a1 + 88);
  v45 = *((unsigned __int8 *)a1 + 89);
  v47 = *((unsigned __int8 *)a1 + 90);
  v3 = *a2;
  v4 = *((_BYTE *)a2 + 24);
  v5 = a2[4];
  v6 = a2[5];
  v8 = a2[6];
  v7 = a2[7];
  v9 = a2[8];
  v10 = a2[9];
  v11 = a2[10];
  v12 = *((unsigned __int8 *)a2 + 88);
  v13 = *((unsigned __int8 *)a2 + 89);
  v14 = *((unsigned __int8 *)a2 + 90);
  v53 = *a1;
  v54 = *(_OWORD *)(a1 + 1);
  v55 = v2;
  v50 = v3;
  v51 = *(_OWORD *)(a2 + 1);
  v52 = v4;
  if ((static FLFollowUpGroupIdentity.== infix(_:_:)(&v53, &v50) & 1) == 0)
    return 0;
  v36 = v10;
  v37 = v7;
  v15 = v8;
  v38 = v13;
  v39 = v14;
  if (v48)
  {
    v17 = v13;
    v16 = v14;
    v18 = v49;
    v19 = v7;
    if (!v6)
      return 0;
    v20 = v44;
    v21 = v42;
    v22 = v11;
    v23 = v12;
    v24 = v43;
    v25 = v41;
    v26 = v15;
    if (v46 != v5 || (v27 = v47, v28 = v45, v48 != v6))
    {
      v29 = sub_1B8D71C5C();
      v19 = v37;
      v18 = v49;
      v17 = v38;
      v16 = v39;
      v28 = v45;
      v27 = v47;
      v30 = v29;
      result = 0;
      if ((v30 & 1) == 0)
        return result;
    }
  }
  else
  {
    v27 = v47;
    v28 = v45;
    v17 = v13;
    v16 = v14;
    v20 = v44;
    v21 = v42;
    v22 = v11;
    v23 = v12;
    v18 = v49;
    v24 = v43;
    v25 = v41;
    v26 = v15;
    v19 = v37;
    if (v6)
      return 0;
  }
  if (v24 != v26 || v25 != v19)
  {
    v32 = sub_1B8D71C5C();
    v18 = v49;
    v17 = v38;
    v16 = v39;
    v28 = v45;
    v27 = v47;
    v33 = v32;
    result = 0;
    if ((v33 & 1) == 0)
      return result;
  }
  if (v40)
  {
    if (v36)
    {
      if (v18 != v9 || v40 != v36)
      {
        v34 = sub_1B8D71C5C();
        v17 = v38;
        v16 = v39;
        v28 = v45;
        v27 = v47;
        v35 = v34;
        result = 0;
        if ((v35 & 1) == 0)
          return result;
      }
      goto LABEL_21;
    }
    return 0;
  }
  if (v36)
    return 0;
LABEL_21:
  result = 0;
  if ((v21 & 1) != 0)
  {
    if (!v23)
      return result;
    goto LABEL_26;
  }
  if ((v23 & 1) == 0 && v20 == v22)
  {
LABEL_26:
    if (((v28 ^ v17) & 1) == 0)
      return v27 ^ v16 ^ 1u;
  }
  return result;
}

unint64_t sub_1B8D70A4C()
{
  unint64_t result;

  result = qword_1EF1DF260;
  if (!qword_1EF1DF260)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLFollowUpInformation, &type metadata for FLFollowUpInformation);
    atomic_store(result, (unint64_t *)&qword_1EF1DF260);
  }
  return result;
}

unint64_t sub_1B8D70A94()
{
  unint64_t result;

  result = qword_1EF1DF268;
  if (!qword_1EF1DF268)
  {
    result = MEMORY[0x1BCCBB818](&protocol conformance descriptor for FLRenderStyle, &type metadata for FLRenderStyle);
    atomic_store(result, (unint64_t *)&qword_1EF1DF268);
  }
  return result;
}

uint64_t destroy for FLFollowUpInformation(id *a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FLFollowUpInformation(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_BYTE *)(a1 + 90) = *(_BYTE *)(a2 + 90);
  v8 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FLFollowUpInformation(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v7;
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_BYTE *)(a1 + 90) = *(_BYTE *)(a2 + 90);
  return a1;
}

__n128 __swift_memcpy91_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 75) = *(_OWORD *)(a2 + 75);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for FLFollowUpInformation(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_BYTE *)(a1 + 90) = *(_BYTE *)(a2 + 90);
  return a1;
}

uint64_t getEnumTagSinglePayload for FLFollowUpInformation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 91))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FLFollowUpInformation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 90) = 0;
    *(_WORD *)(result + 88) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 91) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 91) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FLFollowUpInformation()
{
  return &type metadata for FLFollowUpInformation;
}

uint64_t storeEnumTagSinglePayload for FLRenderStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B8D70E64 + 4 * byte_1B8D73F15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B8D70E98 + 4 * byte_1B8D73F10[v4]))();
}

uint64_t sub_1B8D70E98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B8D70EA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B8D70EA8);
  return result;
}

uint64_t sub_1B8D70EB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B8D70EBCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B8D70EC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B8D70EC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FLRenderStyle()
{
  return &type metadata for FLRenderStyle;
}

unint64_t sub_1B8D70EE4()
{
  unint64_t result;

  result = qword_1EF1DF270;
  if (!qword_1EF1DF270)
  {
    result = MEMORY[0x1BCCBB818](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF1DF270);
  }
  return result;
}

uint64_t sub_1B8D71998()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1B8D719A4()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1B8D719B0()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1B8D719BC()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1B8D719C8()
{
  return MEMORY[0x1E0C96018]();
}

uint64_t sub_1B8D719D4()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1B8D719E0()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1B8D719EC()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1B8D719F8()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1B8D71A04()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1B8D71A10()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1B8D71A1C()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1B8D71A28()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1B8D71A34()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1B8D71A40()
{
  return MEMORY[0x1E0C963B0]();
}

uint64_t sub_1B8D71A4C()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1B8D71A58()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B8D71A64()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B8D71A70()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1B8D71A7C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B8D71A88()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B8D71A94()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B8D71AA0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B8D71AAC()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B8D71AB8()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B8D71AC4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B8D71AD0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B8D71ADC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B8D71AE8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B8D71AF4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B8D71B00()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B8D71B0C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B8D71B18()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1B8D71B24()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1B8D71B30()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1B8D71B3C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B8D71B48()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B8D71B54()
{
  return MEMORY[0x1E0DF07A0]();
}

uint64_t sub_1B8D71B60()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1B8D71B6C()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1B8D71B78()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1B8D71B84()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1B8D71B90()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1B8D71B9C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B8D71BA8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B8D71BB4()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B8D71BC0()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B8D71BCC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B8D71BD8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B8D71BE4()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1B8D71BF0()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1B8D71BFC()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1B8D71C08()
{
  return MEMORY[0x1E0CB24F0]();
}

uint64_t sub_1B8D71C14()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B8D71C20()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B8D71C2C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B8D71C38()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B8D71C44()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B8D71C50()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1B8D71C5C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B8D71C68()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B8D71C74()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B8D71C80()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1B8D71C8C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4C8]();
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
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

