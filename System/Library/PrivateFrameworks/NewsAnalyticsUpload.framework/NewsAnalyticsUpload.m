void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

id NDSharedServiceLog()
{
  if (NDSharedServiceLog_once != -1)
    dispatch_once(&NDSharedServiceLog_once, &__block_literal_global);
  return (id)NDSharedServiceLog_result;
}

id NDSharedClientLog()
{
  if (NDSharedClientLog_once != -1)
    dispatch_once(&NDSharedClientLog_once, &__block_literal_global_3);
  return (id)NDSharedClientLog_result;
}

id NDAnalyticsEnvelopeSubmissionDatesByContentType(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEnvelopeSubmissionDatesByContentType_cold_1();
  objc_msgSend(v1, "fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:", &__block_literal_global_0, &__block_literal_global_8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_214676964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
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

void sub_214676E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NDAnalyticsEnvelopeContentTypesFromEntries(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEnvelopeContentTypesFromEntries_cold_1();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_214678408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_214678588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_214678780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2146789E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214679F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
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

BOOL NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(unsigned int a1)
{
  return a1 < 9;
}

id NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries_cold_1();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations_cold_1();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_21467D484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_21467DABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NDAnalyticsEntryDeliveryWindowEarlierDate(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NDAnalyticsEntryDeliveryWindowEarlierDate_cold_2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEntryDeliveryWindowEarlierDate_cold_1();
LABEL_6:
  v8 = objc_msgSend(v7, "seedTime");
  if (v6)
    objc_msgSend(v6, "dateByAddingTimeInterval:", (double)(unint64_t)(60 * v8));
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "laterDate:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id NDAnalyticsEntryDeliveryWindow(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NDAnalyticsEntryDeliveryWindow_cold_2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEntryDeliveryWindow_cold_1();
LABEL_6:
  v8 = 60 * objc_msgSend(v7, "seedTime");
  NDAnalyticsEntryDeliveryWindowEarlierDate(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", (double)(unint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "laterDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6CB38], "dateRangeWithEarlierDate:laterDate:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t NDAnalyticsEntryCanBeUploaded(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NDAnalyticsEntryCanBeUploaded_cold_3();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEntryCanBeUploaded_cold_2();
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NDAnalyticsEntryCanBeUploaded_cold_1();
  NDAnalyticsEntryDeliveryWindowEarlierDate(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "fc_isLaterThanOrEqualTo:", v11);

  return v12;
}

id sub_21467E754(_QWORD *a1)
{
  id result;
  id v2;
  objc_class *v3;
  char *v4;
  objc_super v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21469038C();
  result = (id)sub_214690494();
  if (result)
  {
    v2 = result;
    v3 = (objc_class *)type metadata accessor for TelemetryUploader();
    v4 = (char *)objc_allocWithZone(v3);
    *(_QWORD *)&v4[OBJC_IVAR___NDAnalyticsTelemetryUploader_sessionManager] = v2;
    v5.receiver = v4;
    v5.super_class = v3;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21467E7E0()
{
  sub_21469038C();
  sub_2146904D0();
  sub_214690488();
  swift_release();
  swift_release();
  sub_2146903E0();
  sub_2146904D0();
  swift_release();
  sub_214690428();
  sub_2146904D0();
  swift_release();
  sub_214690464();
  sub_2146904D0();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA1D0);
  sub_2146904D0();
  swift_release();
  sub_214690398();
  sub_2146904DC();
  return swift_release();
}

uint64_t sub_21467E924(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;

  sub_2146902C0();
  MEMORY[0x24BDAC7A8]();
  v9[2] = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA1E0);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_214690374();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE03C18];
  MEMORY[0x24BDAC7A8]();
  v9[1] = dispatch_group_create();
  sub_214690290();
  sub_214690284();
  sub_2146903BC();
  swift_allocObject();
  v9[0] = sub_2146903B0();
  v10 = MEMORY[0x24BEE4AF8];
  sub_21467F2D8(&qword_253DAA1D8, v5, MEMORY[0x24BE03C28]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA200);
  sub_21467F318((unint64_t *)&unk_253DAA208, &qword_253DAA200);
  sub_2146905A8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = sub_214690398();
  sub_2146904A0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 1, v6);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_21469038C();
    sub_214690284();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253DAA220);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_2146913B0;
    sub_2146902B4();
    sub_21469029C();
    sub_2146902A8();
    v10 = v8;
    sub_21467F2D8(&qword_253DAA1C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE03B28], MEMORY[0x24BE03B38]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA1F0);
    sub_21467F318(&qword_253DAA1F8, &qword_253DAA1F0);
    sub_2146905A8();
    sub_21469032C();
    swift_allocObject();
    sub_214690320();
    sub_21469044C();
    swift_allocObject();
    sub_214690440();
    return sub_214690344();
  }
  return result;
}

uint64_t sub_21467EC78(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  sub_214690338();
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_2146903E0();
  result = sub_214690494();
  if (result)
  {
    sub_2146903A4();
    swift_release();
    swift_release();
    sub_214690338();
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    sub_214690428();
    result = sub_214690494();
    if (result)
    {
      sub_2146903A4();
      swift_release();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21467ED6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  v0 = sub_214690434();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (uint64_t *)((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2146903E0();
  *v3 = 11;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BE03CF8], v0);
  return sub_2146903D4();
}

uint64_t sub_21467EE04(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = sub_214690218();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214690464();
  result = sub_214690494();
  if (result)
  {
    v7 = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA1D0);
    result = sub_214690494();
    if (result)
    {
      v8 = result;
      sub_214690428();
      sub_214690410();
      v9 = (void *)sub_214690404();
      v10 = objc_msgSend((id)objc_opt_self(), sel_newsdDocumentsURL);
      sub_21469020C();

      v11 = (void *)sub_2146903F8();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v12 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
      v13 = (void *)sub_214690518();
      objc_msgSend(v12, sel_BOOLForKey_, v13);

      v14 = sub_2146903EC();
      return MEMORY[0x2199D34EC](v7, v8, 1, v14);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21467EFE8()
{
  id v0;

  sub_214690464();
  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  return sub_214690458();
}

uint64_t sub_21467F030(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA218);
  result = sub_214690494();
  if (result)
  {
    v2 = result;
    type metadata accessor for DynamicEndpoint();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = FCDefaultsReadEndpointEnvironment();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_21467F0B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  void *result;
  id v4;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA218);
  result = (void *)sub_214690494();
  if (result)
  {
    v4 = objc_msgSend(result, sel_possiblyUnfetchedAppConfiguration);
    swift_unknownObjectRelease();
    return (void *)sub_21467F5A8(v4, a2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21467F134()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TelemetryAssembly()
{
  return objc_opt_self();
}

void type metadata accessor for FCEndpointEnvironment()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254D7E748)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254D7E748);
  }
}

uint64_t sub_21467F1B8()
{
  sub_2146904AC();
  type metadata accessor for TelemetryUploader();
  sub_2146904D0();
  swift_release();
  swift_release();
  sub_2146904B8();
  sub_2146904C4();
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D3C18]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D3C24](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21467F2D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199D3C30](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21467F318(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199D3C30](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Assembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

id Assembly.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id Assembly.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR___NDAnalyticsUploadFrameworkAssembly_assemblies;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA048);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_214691460;
  v4 = type metadata accessor for TelemetryAssembly();
  v5 = swift_allocObject();
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 64) = sub_21467F438();
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)&v0[v2] = v3;
  v7.receiver = v0;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

unint64_t sub_21467F438()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253DAA1E8;
  if (!qword_253DAA1E8)
  {
    v1 = type metadata accessor for TelemetryAssembly();
    result = MEMORY[0x2199D3C30](&unk_214691418, v1);
    atomic_store(result, (unint64_t *)&qword_253DAA1E8);
  }
  return result;
}

id Assembly.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21467F574()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for Assembly()
{
  return objc_opt_self();
}

uint64_t sub_21467F5A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v4 = sub_214690398();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (unint64_t *)((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_isAnalyticsJitterEnabled) & 1) != 0
    && !objc_msgSend(a1, sel_isAnalyticsJitterEnabled))
  {
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(a2, *MEMORY[0x24BE03C50], v4);
  }
  else
  {
    if ((objc_msgSend(a1, sel_respondsToSelector_, sel_analyticsJitterLowerBound) & 1) != 0)
    {
      objc_msgSend(a1, sel_analyticsJitterLowerBound);
      v9 = v8;
    }
    else
    {
      v9 = 0xC082C00000000000;
    }
    if ((objc_msgSend(a1, sel_respondsToSelector_, sel_analyticsJitterUpperBound) & 1) != 0)
    {
      objc_msgSend(a1, sel_analyticsJitterUpperBound);
      v11 = v10;
    }
    else
    {
      v11 = 0x4082C00000000000;
    }
    swift_unknownObjectRelease();
    *v7 = v9;
    v7[1] = v11;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE03C48], v4);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(v5 + 32))(a2, v7, v4);
  }
}

uint64_t sub_21467F860()
{
  uint64_t v0;
  uint64_t result;

  result = 0x316F6D6564;
  switch(*(_QWORD *)(v0 + 24))
  {
    case 1:
      result = 0x69746375646F7270;
      break;
    case 2:
      result = 0x676E6967617473;
      break;
    case 3:
      result = 24945;
      break;
    case 4:
      result = 1953719668;
      break;
    case 5:
      result = 0x3164756F6C6369;
      break;
    case 6:
      result = 0x6C65766564;
      break;
    case 7:
      result = 0x786F62646E6173;
      break;
    case 8:
      return result;
    case 9:
      result = 0x326F6D6564;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_21467F954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;

  v5 = sub_214690218();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v33 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E7B8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33 - v16;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      v18 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if ((objc_msgSend(v18, sel_respondsToSelector_, sel_appAnalyticsEndpointUrlForEnvironment_) & 1) == 0)
        goto LABEL_15;
      v19 = objc_msgSend(v18, sel_appAnalyticsEndpointUrlForEnvironment_, *(_QWORD *)(v2 + 24));
      goto LABEL_4;
    case 5:
      v22 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if ((objc_msgSend(v22, sel_respondsToSelector_, sel_appAnalyticsNotificationReceiptEndpointUrlForEnvironment_) & 1) == 0)goto LABEL_15;
      v23 = objc_msgSend(v22, sel_appAnalyticsNotificationReceiptEndpointUrlForEnvironment_, *(_QWORD *)(v2 + 24));
      if (v23)
      {
        v24 = v23;
        sub_21469020C();

        v25 = 0;
      }
      else
      {
        v25 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v17, v25, 1, v5);
      sub_21467FECC((uint64_t)v17, a2);
      return swift_unknownObjectRelease();
    case 6:
      v26 = objc_msgSend((id)objc_opt_self(), sel_appAnalyticsSportsEventsBaseURLForConfiguration_, objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration));
      swift_unknownObjectRelease();
      if (v26)
      {
        sub_21469020C();

        v27 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
        v27(v15, v9, v5);
        v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
        v28((uint64_t)v15, 0, 1, v5);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v15, 1, v5) != 1)
        {
          v27(v11, v15, v5);
          v27((char *)a2, v11, v5);
          v29 = a2;
          v30 = 0;
          return v28(v29, v30, 1, v5);
        }
      }
      else
      {
        v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
        v28((uint64_t)v15, 1, 1, v5);
      }
      sub_21467FE8C((uint64_t)v15);
      v29 = a2;
      v30 = 1;
      return v28(v29, v30, 1, v5);
    case 7:
      v31 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if ((objc_msgSend(v31, sel_respondsToSelector_, sel_appAnalyticsAppHealthEndpointUrlForEnvironment_) & 1) == 0)goto LABEL_15;
      v19 = objc_msgSend(v31, sel_appAnalyticsAppHealthEndpointUrlForEnvironment_, *(_QWORD *)(v2 + 24));
      goto LABEL_4;
    case 8:
      v32 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if ((objc_msgSend(v32, sel_respondsToSelector_, sel_appAnalyticsAppHeartbeatEndpointUrlForEnvironment_) & 1) != 0)
      {
        v19 = objc_msgSend(v32, sel_appAnalyticsAppHeartbeatEndpointUrlForEnvironment_, *(_QWORD *)(v2 + 24));
LABEL_4:
        v20 = v19;
        sub_21469020C();
        swift_unknownObjectRelease();

        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(a2, 0, 1, v5);
      }
      else
      {
LABEL_15:
        swift_unknownObjectRelease();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, 1, 1, v5);
      }
    default:
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, 1, 1, v5);
  }
}

uint64_t sub_21467FE48()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DynamicEndpoint()
{
  return objc_opt_self();
}

uint64_t sub_21467FE8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E7B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21467FECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E7B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for AppData()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for AppData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppData()
{
  return &type metadata for AppData;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ContentEnvironmentData()
{
  return &type metadata for ContentEnvironmentData;
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DeviceData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DeviceData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeviceData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for DeviceData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceData(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceData()
{
  return &type metadata for DeviceData;
}

uint64_t destroy for SessionData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SessionData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 92) = *(_BYTE *)(a2 + 92);
  *(_WORD *)(a1 + 93) = *(_WORD *)(a2 + 93);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SessionData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_BYTE *)(a1 + 90) = *(_BYTE *)(a2 + 90);
  *(_BYTE *)(a1 + 91) = *(_BYTE *)(a2 + 91);
  *(_BYTE *)(a1 + 92) = *(_BYTE *)(a2 + 92);
  *(_BYTE *)(a1 + 93) = *(_BYTE *)(a2 + 93);
  *(_BYTE *)(a1 + 94) = *(_BYTE *)(a2 + 94);
  return a1;
}

__n128 __swift_memcpy95_8(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 79) = *(_OWORD *)(a2 + 79);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SessionData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_BYTE *)(a1 + 90) = *(_BYTE *)(a2 + 90);
  *(_BYTE *)(a1 + 91) = *(_BYTE *)(a2 + 91);
  *(_BYTE *)(a1 + 92) = *(_BYTE *)(a2 + 92);
  *(_BYTE *)(a1 + 93) = *(_BYTE *)(a2 + 93);
  *(_BYTE *)(a1 + 94) = *(_BYTE *)(a2 + 94);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 95))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 94) = 0;
    *(_WORD *)(result + 92) = 0;
    *(_DWORD *)(result + 88) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 95) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 95) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionData()
{
  return &type metadata for SessionData;
}

uint64_t destroy for UserData()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
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

uint64_t assignWithTake for UserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserData(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserData()
{
  return &type metadata for UserData;
}

uint64_t sub_214680968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2146809A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2146809E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_214680A28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_214680A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_214680AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_214680B00()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_214680B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_214680B4C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_214680B58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TelemetryEvent(uint64_t a1)
{
  return sub_214680CD0(a1, (uint64_t *)&unk_254D7E820);
}

void sub_214680BB0()
{
  unint64_t v0;

  sub_214680C18();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_214680C18()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D7E830)
  {
    type metadata accessor for NetworkEventData(255);
    sub_21467F2D8(&qword_254D7E838, type metadata accessor for NetworkEventData, (uint64_t)&unk_214691708);
    sub_21467F2D8(qword_254D7E840, type metadata accessor for NetworkEventData, (uint64_t)&unk_2146916E0);
    v0 = sub_214690308();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D7E830);
  }
}

uint64_t type metadata accessor for NetworkEventData(uint64_t a1)
{
  return sub_214680CD0(a1, qword_254D7E8C8);
}

uint64_t sub_214680CD0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_214680D04(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_214690254();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
    v9 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)((char *)a2 + v9);
    v10 = a3[10];
    *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
    v11 = a3[12];
    *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
    *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
    v12 = a3[14];
    *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
    v13 = a3[16];
    *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (_QWORD *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_214680E10(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_214690254();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_214680E58(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = sub_214690254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  v10 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v11 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_214680F38(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_214690254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v7 = a3[16];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_214681044(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_214690254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  v10 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v11 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_214681118(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_214690254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  v10 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v11 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_2146811FC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_214681208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_214690254();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 64) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_214681288()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_214681294(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_214690254();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 64) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_214681310()
{
  uint64_t result;
  unint64_t v1;

  result = sub_214690254();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_2146813C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2146813DC()
{
  sub_2146906D4();
  sub_2146906E0();
  return sub_2146906EC();
}

uint64_t sub_214681420()
{
  return sub_2146906E0();
}

uint64_t sub_214681448()
{
  sub_2146906D4();
  sub_2146906E0();
  return sub_2146906EC();
}

uint64_t sub_214681488()
{
  _BYTE *v0;

  if (*v0)
    return 0x646C697542707061;
  else
    return 0x6973726556707061;
}

uint64_t sub_2146814D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214685F20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2146814F8()
{
  return 0;
}

void sub_214681504(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_214681510()
{
  sub_2146861EC();
  return sub_214690710();
}

uint64_t sub_214681538()
{
  sub_2146861EC();
  return sub_21469071C();
}

uint64_t sub_214681560(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v12[0] = a4;
  v12[1] = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E990);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2146861EC();
  sub_214690704();
  v14 = 0;
  sub_214690674();
  if (!v5)
  {
    v13 = 1;
    sub_214690674();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_214681688()
{
  return sub_2146902F0();
}

uint64_t sub_21468169C()
{
  return sub_2146902FC();
}

uint64_t sub_2146816B0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_214686040(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_2146816DC(_QWORD *a1)
{
  uint64_t *v1;

  return sub_214681560(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_2146816F8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_214681734
                                                            + 4 * asc_214691500[a1]))(0x657366664F637475, 0xE900000000000074);
}

uint64_t sub_214681734()
{
  return 0x65676175676E616CLL;
}

uint64_t sub_214681754()
{
  return 0x437972746E756F63;
}

unint64_t sub_214681774()
{
  return 0xD000000000000012;
}

uint64_t sub_2146818B4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  _BYTE v14[8];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA48);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214687F84();
  sub_214690704();
  LOBYTE(v11) = 0;
  sub_2146906A4();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_214690650();
    LOBYTE(v11) = 2;
    sub_214690650();
    LOBYTE(v11) = *(_BYTE *)(v3 + 40);
    v12 = 3;
    sub_214688050();
    sub_214690698();
    LOBYTE(v11) = 4;
    sub_214690674();
    v11 = *(_QWORD *)(v3 + 64);
    v12 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA10);
    sub_214688094(&qword_254D7EA58, &qword_254D7EA10, MEMORY[0x24BEE4010], MEMORY[0x24BEE12A0]);
    sub_214690698();
    v11 = *(_QWORD *)(v3 + 72);
    v12 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA20);
    sub_214688094(&qword_254D7EA60, &qword_254D7EA20, MEMORY[0x24BEE3F90], MEMORY[0x24BEE12A0]);
    sub_214690698();
    sub_2146880F0(v3 + 80, (uint64_t)v14, &qword_254D7EA68);
    sub_2146880F0((uint64_t)v14, (uint64_t)&v11, &qword_254D7EA68);
    v12 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA30);
    sub_214688094(&qword_254D7EA70, &qword_254D7EA30, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_214690668();
    LOBYTE(v11) = 8;
    sub_214690680();
    LOBYTE(v11) = 9;
    sub_214690680();
    LOBYTE(v11) = 10;
    sub_214690680();
    LOBYTE(v11) = 11;
    sub_214690680();
    LOBYTE(v11) = 12;
    sub_21469065C();
    LOBYTE(v11) = 13;
    sub_214690680();
    sub_2146880F0(v3 + 94, (uint64_t)&v13, &qword_254D7EA78);
    sub_2146880F0((uint64_t)&v13, (uint64_t)&v11, &qword_254D7EA78);
    v12 = 14;
    sub_214688134();
    sub_214690668();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_214681D14()
{
  unsigned __int8 *v0;

  return sub_2146816F8(*v0);
}

uint64_t sub_214681D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214686250(a1, a2);
  *a3 = result;
  return result;
}

void sub_214681D40(_BYTE *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_214681D4C()
{
  sub_214687F84();
  return sub_214690710();
}

uint64_t sub_214681D74()
{
  sub_214687F84();
  return sub_21469071C();
}

double sub_214681D9C@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[4];
  _OWORD v8[2];

  sub_21468684C(a1, v7);
  if (!v2)
  {
    v5 = v7[3];
    a2[2] = v7[2];
    a2[3] = v5;
    a2[4] = v8[0];
    *(_OWORD *)((char *)a2 + 79) = *(_OWORD *)((char *)v8 + 15);
    result = *(double *)v7;
    v6 = v7[1];
    *a2 = v7[0];
    a2[1] = v6;
  }
  return result;
}

uint64_t sub_214681DEC(_QWORD *a1)
{
  return sub_2146818B4(a1);
}

uint64_t sub_214681E34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2146820C8(*a1, *a2);
}

uint64_t sub_214681E40(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 7824750;
    else
      v3 = 0x6E696E7275746572;
    if (v2 == 1)
      v4 = 0xE300000000000000;
    else
      v4 = 0xE900000000000067;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 7824750;
      else
        v6 = 0x6E696E7275746572;
      if (v5 == 1)
        v7 = 0xE300000000000000;
      else
        v7 = 0xE900000000000067;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE700000000000000;
    v3 = 0x6E776F6E6B6E75;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    v8 = sub_2146906BC();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_214681F50(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_214681FA0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_214682010 + 4 * byte_214691514[a2]))(1768319351);
}

uint64_t sub_214682010(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1768319351 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_2146906BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2146820C8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x6E496E6567676F6CLL;
    else
      v3 = 0x754F646567676F6CLL;
    if (v2 == 1)
      v4 = 0xE800000000000000;
    else
      v4 = 0xE900000000000074;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x6E496E6567676F6CLL;
      else
        v6 = 0x754F646567676F6CLL;
      if (v5 == 1)
        v7 = 0xE800000000000000;
      else
        v7 = 0xE900000000000074;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE700000000000000;
    v3 = 0x6E776F6E6B6E75;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    v8 = sub_2146906BC();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_2146821E8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_214682238(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_214682284 + 4 * byte_21469151D[a2]))(24945);
}

uint64_t sub_214682284(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 24945 && v1 == 0xE200000000000000)
    v2 = 1;
  else
    v2 = sub_2146906BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_214682314(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEA00000000006465;
  v3 = 0x766C6F7365726E75;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x6C75666574617473;
    else
      v5 = 0x73656C6574617473;
    if (v4 == 1)
      v6 = 0xE800000000000000;
    else
      v6 = 0xE900000000000073;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x766C6F7365726E75;
  v6 = 0xEA00000000006465;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0x6C75666574617473;
    else
      v3 = 0x73656C6574617473;
    if (v7 == 1)
      v2 = 0xE800000000000000;
    else
      v2 = 0xE900000000000073;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_2146906BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_214682434(char a1, unsigned __int8 a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (a1)
  {
    if (a1 == 1)
      v2 = 0x6C616E7265746E69;
    else
      v2 = 0x6C616E7265747865;
    v3 = 0xE800000000000000;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 0x6C616E7265746E69;
      else
        v5 = 0x6C616E7265747865;
      v6 = 0xE800000000000000;
      if (v2 != v5)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0xE700000000000000;
    v2 = 0x6E776F6E6B6E75;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v6 = 0xE700000000000000;
  if (v2 != 0x6E776F6E6B6E75)
  {
LABEL_15:
    v7 = sub_2146906BC();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6)
    goto LABEL_15;
  v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_214682524(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_214682574(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2146825C8 + 4 * byte_214691525[a2]))(5459817);
}

uint64_t sub_2146825C8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 5459817 && v1 == 0xE300000000000000)
    v2 = 1;
  else
    v2 = sub_2146906BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_214682660(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 7629160;
    else
      v3 = 1936943469;
    if (v2 == 1)
      v4 = 0xE300000000000000;
    else
      v4 = 0xE400000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 7629160;
      else
        v6 = 1936943469;
      if (v5 == 1)
        v7 = 0xE300000000000000;
      else
        v7 = 0xE400000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE700000000000000;
    v3 = 0x6E776F6E6B6E75;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    v8 = sub_2146906BC();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_214682758()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_2146827FC()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21468287C()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_21468291C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21468A1C8();
  *a1 = result;
  return result;
}

void sub_214682950(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE800000000000000;
  v5 = 0x6E496E6567676F6CLL;
  if (v2 != 1)
  {
    v5 = 0x754F646567676F6CLL;
    v4 = 0xE900000000000074;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E776F6E6B6E75;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2146829B4()
{
  sub_21468996C();
  return sub_214690548();
}

uint64_t sub_214682A10()
{
  sub_21468996C();
  return sub_21469053C();
}

uint64_t sub_214682A5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_214682314(*a1, *a2);
}

uint64_t sub_214682A68()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214682B10()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214682B94()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214682C38@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21468A1C8();
  *a1 = result;
  return result;
}

void sub_214682C6C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEA00000000006465;
  v4 = 0xE800000000000000;
  v5 = 0x6C75666574617473;
  if (v2 != 1)
  {
    v5 = 0x73656C6574617473;
    v4 = 0xE900000000000073;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x766C6F7365726E75;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_214682CD4()
{
  sub_2146899B0();
  return sub_214690548();
}

uint64_t sub_214682D30()
{
  sub_2146899B0();
  return sub_21469053C();
}

uint64_t sub_214682D7C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E9E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214687E30();
  sub_214690704();
  v10[15] = 0;
  sub_214690674();
  if (!v2)
  {
    v10[14] = *(_BYTE *)(v3 + 16);
    v10[13] = 1;
    sub_214687EFC();
    sub_214690698();
    v10[12] = *(_BYTE *)(v3 + 17);
    v10[11] = 2;
    sub_214687F40();
    sub_214690698();
    v10[10] = 3;
    sub_214690674();
    v10[9] = 4;
    sub_214690674();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

BOOL sub_214682F38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_214682F4C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_214682F84 + 4 * byte_214691529[*v0]))(0x6F4D656369766564, 0xEB000000006C6564);
}

uint64_t sub_214682F84()
{
  return 0x6C50656369766564;
}

unint64_t sub_214682FA8()
{
  return 0xD000000000000010;
}

uint64_t sub_214682FC4()
{
  return 0x6F6973726556736FLL;
}

uint64_t sub_214682FE0()
{
  return 0x656C646E7542736FLL;
}

uint64_t sub_214683004@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214686FA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_214683028(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_214683034()
{
  sub_214687E30();
  return sub_214690710();
}

uint64_t sub_21468305C()
{
  sub_214687E30();
  return sub_21469071C();
}

double sub_214683084@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  sub_214687220(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_2146830D0(_QWORD *a1)
{
  return sub_214682D7C(a1);
}

void sub_2146830E4(char *a1)
{
  sub_214682524(*a1);
}

void sub_2146830F0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2146906D4();
  __asm { BR              X9 }
}

uint64_t sub_21468313C()
{
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

void sub_21468319C()
{
  __asm { BR              X10 }
}

uint64_t sub_2146831D8()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

void sub_214683224()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2146906D4();
  __asm { BR              X9 }
}

uint64_t sub_21468326C()
{
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_2146832CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_214689A38();
  *a1 = result;
  return result;
}

uint64_t sub_214683300()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_214683330 + 4 * byte_21469153A[*v0]))();
}

void sub_214683330(_QWORD *a1@<X8>)
{
  *a1 = 5459817;
  a1[1] = 0xE300000000000000;
}

void sub_214683344(_QWORD *a1@<X8>)
{
  *a1 = 0x534F64615069;
  a1[1] = 0xE600000000000000;
}

void sub_21468335C(_QWORD *a1@<X8>)
{
  *a1 = 0x534F63616DLL;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_214683374()
{
  sub_2146898E4();
  return sub_214690548();
}

uint64_t sub_2146833D0()
{
  sub_2146898E4();
  return sub_21469053C();
}

uint64_t sub_21468341C(char *a1, unsigned __int8 *a2)
{
  return sub_214682434(*a1, *a2);
}

uint64_t sub_214683428()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_2146834BC()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21468352C()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_2146835BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21468A1C8();
  *a1 = result;
  return result;
}

void sub_2146835F0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0x6C616E7265746E69;
  if (v2 != 1)
    v4 = 0x6C616E7265747865;
  v5 = v2 == 0;
  if (*v1)
    v6 = v4;
  else
    v6 = 0x6E776F6E6B6E75;
  if (!v5)
    v3 = 0xE800000000000000;
  *a1 = v6;
  a1[1] = v3;
}

uint64_t sub_214683644()
{
  sub_214689928();
  return sub_214690548();
}

uint64_t sub_2146836A0()
{
  sub_214689928();
  return sub_21469053C();
}

uint64_t sub_2146836EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21468371C + 4 * byte_21469153E[a1]))(0x444972657375, 0xE600000000000000);
}

unint64_t sub_21468371C()
{
  return 0xD000000000000011;
}

unint64_t sub_2146837DC()
{
  return 0xD000000000000010;
}

uint64_t sub_2146837F8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EAA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214688178();
  sub_214690704();
  v10[15] = 0;
  sub_214690674();
  if (!v2)
  {
    v10[14] = 1;
    sub_21469065C();
    v10[13] = *(_BYTE *)(v3 + 17);
    v10[12] = 2;
    sub_214688200();
    sub_214690698();
    v10[11] = 3;
    sub_2146906B0();
    v10[10] = 4;
    sub_2146906A4();
    v10[9] = 5;
    sub_21469068C();
    v10[8] = 6;
    sub_2146906A4();
    v10[7] = 7;
    sub_21469068C();
    v10[6] = 8;
    sub_214690674();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_214683A3C()
{
  unsigned __int8 *v0;

  return sub_2146836EC(*v0);
}

uint64_t sub_214683A44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2146874F8(a1, a2);
  *a3 = result;
  return result;
}

void sub_214683A68(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_214683A74()
{
  sub_214688178();
  return sub_214690710();
}

uint64_t sub_214683A9C()
{
  sub_214688178();
  return sub_21469071C();
}

double sub_214683AC4@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  sub_2146878A0(a1, (uint64_t)v7);
  if (!v2)
  {
    v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    result = *(double *)&v8;
    v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_214683B04(_QWORD *a1)
{
  return sub_2146837F8(a1);
}

uint64_t sub_214683B18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_214681E40(*a1, *a2);
}

uint64_t sub_214683B24()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214683BC0()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214683C38()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214683CD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21468A1C8();
  *a1 = result;
  return result;
}

void sub_214683D04(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE300000000000000;
  v5 = 7824750;
  if (v2 != 1)
  {
    v5 = 0x6E696E7275746572;
    v4 = 0xE900000000000067;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E776F6E6B6E75;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_214683D60()
{
  sub_2146899F4();
  return sub_214690548();
}

uint64_t sub_214683DBC()
{
  sub_2146899F4();
  return sub_21469053C();
}

uint64_t sub_214683E08(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E9B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214687D64();
  sub_214690704();
  v9[15] = a2;
  sub_214687DEC();
  sub_214690698();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_214683F00()
{
  return 1;
}

uint64_t sub_214683F08()
{
  sub_2146906D4();
  sub_2146906E0();
  return sub_2146906EC();
}

uint64_t sub_214683F48()
{
  return sub_2146906E0();
}

uint64_t sub_214683F6C()
{
  sub_2146906D4();
  sub_2146906E0();
  return sub_2146906EC();
}

unint64_t sub_214683FA8()
{
  return 0xD000000000000012;
}

uint64_t sub_214683FC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214687BC0(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_214683FEC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_214683FF8()
{
  sub_214687D64();
  return sub_214690710();
}

uint64_t sub_214684020()
{
  sub_214687D64();
  return sub_21469071C();
}

_QWORD *sub_214684048@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_214687C44(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_214684070(_QWORD *a1)
{
  char *v1;

  return sub_214683E08(a1, *v1);
}

void sub_214684088(char *a1)
{
  sub_2146821E8(*a1);
}

void sub_214684094()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2146906D4();
  __asm { BR              X9 }
}

uint64_t sub_2146840E0()
{
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

void sub_214684138()
{
  __asm { BR              X10 }
}

uint64_t sub_214684174()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

void sub_2146841B8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2146906D4();
  __asm { BR              X9 }
}

uint64_t sub_214684200()
{
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214684258@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_214689A38();
  *a1 = result;
  return result;
}

uint64_t sub_21468428C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2146842BC + 4 * byte_214691553[*v0]))();
}

void sub_2146842BC(_QWORD *a1@<X8>)
{
  *a1 = 24945;
  a1[1] = 0xE200000000000000;
}

void sub_2146842CC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x676E6967617473;
  a1[1] = v1;
}

void sub_2146842E4(_QWORD *a1@<X8>)
{
  *a1 = 1685025392;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_2146842F8()
{
  sub_2146898A0();
  return sub_214690548();
}

uint64_t sub_214684354()
{
  sub_2146898A0();
  return sub_21469053C();
}

uint64_t sub_2146843A0(uint64_t a1)
{
  return sub_2146843D8(a1, MEMORY[0x24BE03B58], qword_254D81C10, MEMORY[0x24BE03B50]);
}

uint64_t sub_2146843BC(uint64_t a1)
{
  return sub_2146843D8(a1, MEMORY[0x24BE03CA0], qword_254D81C28, MEMORY[0x24BE03C98]);
}

uint64_t sub_2146843D8(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, unsigned int *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  v7 = __swift_project_value_buffer(v6, (uint64_t)a3);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v7, *a4, v6);
}

uint64_t sub_214684430@<X0>(uint64_t a1@<X8>)
{
  return sub_214684478(&qword_254D7E6C0, MEMORY[0x24BE03B58], (uint64_t)qword_254D81C10, a1);
}

uint64_t sub_214684454@<X0>(uint64_t a1@<X8>)
{
  return sub_214684478(&qword_254D7E6C8, MEMORY[0x24BE03CA0], (uint64_t)qword_254D81C28, a1);
}

uint64_t sub_214684478@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_2146844E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE03B98];
  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_254D7E7C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_214684530(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_214684568 + 4 * byte_214691557[a1]))(0x6D69547472617473, 0xE900000000000065);
}

uint64_t sub_214684568()
{
  return 0x7461727544736E64;
}

uint64_t sub_214684588()
{
  return 0x447463656E6E6F63;
}

unint64_t sub_2146845BC()
{
  return 0xD000000000000010;
}

uint64_t sub_2146845D8()
{
  return 0x65736E6F70736572;
}

uint64_t sub_2146845F8()
{
  return 0x6174536568636163;
}

uint64_t sub_214684618()
{
  return 0x6F43737574617473;
}

uint64_t sub_214684634()
{
  return 0x646F43726F727265;
}

uint64_t sub_214684648()
{
  return 0x707954746E657665;
}

unint64_t sub_21468465C()
{
  return 0xD000000000000016;
}

uint64_t sub_2146846D4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v11;
  char v12;
  char v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EAE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214688244();
  sub_214690704();
  v13 = 0;
  sub_214690254();
  sub_21467F2D8(&qword_254D7EAE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_214690698();
  if (!v2)
  {
    v9 = (int *)type metadata accessor for NetworkEventData(0);
    v13 = 1;
    sub_2146906B0();
    v13 = 2;
    sub_2146906B0();
    v13 = 3;
    sub_2146906B0();
    v13 = 4;
    sub_2146906B0();
    v13 = 5;
    sub_2146906B0();
    v13 = *(_BYTE *)(v3 + v9[10]);
    v12 = 6;
    sub_2146883D4();
    sub_214690698();
    v13 = 7;
    sub_2146906B0();
    v13 = 8;
    sub_2146906B0();
    v13 = *(_BYTE *)(v3 + v9[13]);
    v12 = 9;
    sub_214688418();
    sub_214690698();
    v13 = 10;
    sub_214690680();
    v13 = *(_BYTE *)(v3 + v9[15]);
    v12 = 11;
    sub_21468845C();
    sub_214690698();
    v13 = 12;
    sub_214690674();
    v13 = 13;
    sub_214690680();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_214684A84@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char v31;
  char v32;

  v25 = a2;
  v26 = sub_214690254();
  v3 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EAB0);
  v5 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for NetworkEventData(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214688244();
  v29 = v7;
  v11 = v30;
  sub_2146906F8();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v24 = (int *)v8;
  v30 = v10;
  v32 = 0;
  sub_21467F2D8(&qword_254D7EAC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v12 = v26;
  sub_21469062C();
  v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v14 = v30;
  v13(v30, v28, v12);
  v32 = 1;
  *(_QWORD *)&v14[v24[5]] = sub_214690644();
  v32 = 2;
  *(_QWORD *)&v14[v24[6]] = sub_214690644();
  v32 = 3;
  *(_QWORD *)&v14[v24[7]] = sub_214690644();
  v32 = 4;
  *(_QWORD *)&v14[v24[8]] = sub_214690644();
  v32 = 5;
  *(_QWORD *)&v14[v24[9]] = sub_214690644();
  v31 = 6;
  sub_214688288();
  sub_21469062C();
  v14[v24[10]] = v32;
  v32 = 7;
  *(_QWORD *)&v14[v24[11]] = sub_214690644();
  v32 = 8;
  *(_QWORD *)&v14[v24[12]] = sub_214690644();
  v31 = 9;
  sub_2146882CC();
  sub_21469062C();
  v30[v24[13]] = v32;
  v32 = 10;
  v30[v24[14]] = sub_214690614() & 1;
  v31 = 11;
  sub_214688310();
  sub_21469062C();
  v30[v24[15]] = v32;
  v32 = 12;
  v15 = sub_214690608();
  v16 = (uint64_t *)&v30[v24[16]];
  *v16 = v15;
  v16[1] = v17;
  v32 = 13;
  v18 = sub_214690614();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v29, v27);
  v19 = v25;
  v20 = v18 & 1;
  v21 = (uint64_t)v30;
  v30[v24[17]] = v20;
  sub_214688354(v21, v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_214688398(v21);
}

uint64_t sub_214684FF0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_214685024 + 4 * byte_214691565[a1]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_214685024()
{
  return 7234659;
}

uint64_t sub_214685034()
{
  return 0x6F437070416E6463;
}

uint64_t sub_214685054()
{
  return 1937208931;
}

uint64_t sub_214685064()
{
  return 0x63696C6275506B63;
}

uint64_t sub_214685080()
{
  return 0x7461766972506B63;
}

unint64_t sub_2146850A0()
{
  return 0xD000000000000011;
}

uint64_t sub_21468520C()
{
  unsigned __int8 *v0;

  return sub_214684530(*v0);
}

uint64_t sub_214685214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214689A7C(a1, a2);
  *a3 = result;
  return result;
}

void sub_214685238(_BYTE *a1@<X8>)
{
  *a1 = 14;
}

uint64_t sub_214685244()
{
  sub_214688244();
  return sub_214690710();
}

uint64_t sub_21468526C()
{
  sub_214688244();
  return sub_21469071C();
}

uint64_t sub_214685294@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_214684A84(a1, a2);
}

uint64_t sub_2146852A8(_QWORD *a1)
{
  return sub_2146846D4(a1);
}

unint64_t sub_2146852C0()
{
  unint64_t result;

  result = qword_254D7E930;
  if (!qword_254D7E930)
  {
    result = MEMORY[0x2199D3C30](&unk_214691758, &type metadata for UserData);
    atomic_store(result, (unint64_t *)&qword_254D7E930);
  }
  return result;
}

unint64_t sub_214685308()
{
  unint64_t result;

  result = qword_254D7E938;
  if (!qword_254D7E938)
  {
    result = MEMORY[0x2199D3C30](&unk_214691730, &type metadata for UserData);
    atomic_store(result, (unint64_t *)&qword_254D7E938);
  }
  return result;
}

unint64_t sub_214685350()
{
  unint64_t result;

  result = qword_254D7E940;
  if (!qword_254D7E940)
  {
    result = MEMORY[0x2199D3C30](&unk_2146917A8, &type metadata for SessionData);
    atomic_store(result, (unint64_t *)&qword_254D7E940);
  }
  return result;
}

unint64_t sub_214685398()
{
  unint64_t result;

  result = qword_254D7E948;
  if (!qword_254D7E948)
  {
    result = MEMORY[0x2199D3C30](&unk_214691780, &type metadata for SessionData);
    atomic_store(result, (unint64_t *)&qword_254D7E948);
  }
  return result;
}

unint64_t sub_2146853E0()
{
  unint64_t result;

  result = qword_254D7E950;
  if (!qword_254D7E950)
  {
    result = MEMORY[0x2199D3C30](&unk_2146917F8, &type metadata for DeviceData);
    atomic_store(result, (unint64_t *)&qword_254D7E950);
  }
  return result;
}

unint64_t sub_214685428()
{
  unint64_t result;

  result = qword_254D7E958;
  if (!qword_254D7E958)
  {
    result = MEMORY[0x2199D3C30](&unk_2146917D0, &type metadata for DeviceData);
    atomic_store(result, (unint64_t *)&qword_254D7E958);
  }
  return result;
}

unint64_t sub_214685470()
{
  unint64_t result;

  result = qword_254D7E960;
  if (!qword_254D7E960)
  {
    result = MEMORY[0x2199D3C30](&unk_214691848, &type metadata for ContentEnvironmentData);
    atomic_store(result, (unint64_t *)&qword_254D7E960);
  }
  return result;
}

unint64_t sub_2146854B8()
{
  unint64_t result;

  result = qword_254D7E968;
  if (!qword_254D7E968)
  {
    result = MEMORY[0x2199D3C30](&unk_214691820, &type metadata for ContentEnvironmentData);
    atomic_store(result, (unint64_t *)&qword_254D7E968);
  }
  return result;
}

unint64_t sub_214685500()
{
  unint64_t result;

  result = qword_254D7E970;
  if (!qword_254D7E970)
  {
    result = MEMORY[0x2199D3C30](&unk_214691898, &type metadata for AppData);
    atomic_store(result, (unint64_t *)&qword_254D7E970);
  }
  return result;
}

unint64_t sub_214685548()
{
  unint64_t result;

  result = qword_254D7E978;
  if (!qword_254D7E978)
  {
    result = MEMORY[0x2199D3C30](&unk_214691870, &type metadata for AppData);
    atomic_store(result, (unint64_t *)&qword_254D7E978);
  }
  return result;
}

uint64_t sub_21468558C()
{
  return sub_21467F2D8(&qword_254D7E838, type metadata accessor for NetworkEventData, (uint64_t)&unk_214691708);
}

uint64_t sub_2146855B8()
{
  return sub_21467F2D8(qword_254D7E840, type metadata accessor for NetworkEventData, (uint64_t)&unk_2146916E0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
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

uint64_t sub_21468563C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_214684FF0(*a1);
  v5 = v4;
  if (v3 == sub_214684FF0(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_2146906BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2146856C4()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_2146906D4();
  sub_214684FF0(v1);
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214685724()
{
  unsigned __int8 *v0;

  sub_214684FF0(*v0);
  sub_214690530();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214685764()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_2146906D4();
  sub_214684FF0(v1);
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_2146857C0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21468A178();
  *a1 = result;
  return result;
}

uint64_t sub_2146857EC@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_214684FF0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_214685814()
{
  sub_21468A0F0();
  return sub_214690548();
}

uint64_t sub_214685870()
{
  sub_21468A0F0();
  return sub_21469053C();
}

uint64_t sub_2146858BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_214682660(*a1, *a2);
}

uint64_t sub_2146858C8()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214685958()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2146859C4()
{
  sub_2146906D4();
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214685A50@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21468A1C8();
  *a1 = result;
  return result;
}

void sub_214685A84(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE300000000000000;
  v5 = 7629160;
  if (v2 != 1)
  {
    v5 = 1936943469;
    v4 = 0xE400000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E776F6E6B6E75;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_214685AD4()
{
  sub_21468A0AC();
  return sub_214690548();
}

uint64_t sub_214685B30()
{
  sub_21468A0AC();
  return sub_21469053C();
}

void sub_214685B7C(char *a1)
{
  sub_214681F50(*a1);
}

void sub_214685B88()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2146906D4();
  __asm { BR              X9 }
}

uint64_t sub_214685BD4()
{
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

void sub_214685C50()
{
  __asm { BR              X10 }
}

uint64_t sub_214685C8C()
{
  sub_214690530();
  return swift_bridgeObjectRelease();
}

void sub_214685CF4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2146906D4();
  __asm { BR              X9 }
}

uint64_t sub_214685D3C()
{
  sub_214690530();
  swift_bridgeObjectRelease();
  return sub_2146906EC();
}

uint64_t sub_214685DB8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21468A20C();
  *a1 = result;
  return result;
}

uint64_t sub_214685DE4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_214685E14 + 4 * byte_214691587[*v0]))();
}

void sub_214685E14(_QWORD *a1@<X8>)
{
  *a1 = 1768319351;
  a1[1] = 0xE400000000000000;
}

void sub_214685E28(_QWORD *a1@<X8>)
{
  *a1 = 1851881335;
  a1[1] = 0xE400000000000000;
}

void sub_214685E3C(_QWORD *a1@<X8>)
{
  *a1 = 0x47356E617777;
  a1[1] = 0xE600000000000000;
}

void sub_214685E54(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "notReachable");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t sub_214685E78()
{
  sub_21468A134();
  return sub_214690548();
}

uint64_t sub_214685ED4()
{
  sub_21468A134();
  return sub_21469053C();
}

uint64_t sub_214685F20(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6973726556707061 && a2 == 0xEA00000000006E6FLL;
  if (v2 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646C697542707061 && a2 == 0xEE007265626D754ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2146906BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_214686040(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E980);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2146861EC();
  sub_2146906F8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_214690608();
    v10 = 1;
    swift_bridgeObjectRetain();
    sub_214690608();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_2146861EC()
{
  unint64_t result;

  result = qword_254D7E988;
  if (!qword_254D7E988)
  {
    result = MEMORY[0x2199D3C30](&unk_21469299C, &type metadata for AppData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7E988);
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

uint64_t sub_214686250(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x657366664F637475 && a2 == 0xE900000000000074 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002146952E0 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x54746375646F7270 && a2 == 0xEB00000000657079 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000214695300 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000214695320 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x44496E6F69676572 && a2 == 0xE900000000000073 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x4465726F74537369 && a2 == 0xEF726573556F6D65 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000214695340 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000214695360 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000214695380 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002146953A0 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002146953C0 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002146953E0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    v5 = sub_2146906BC();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 14;
    else
      return 15;
  }
}

uint64_t sub_21468684C@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  _DWORD *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  char v45;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E9F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214687F84();
  sub_2146906F8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v43) = 0;
    v9 = sub_214690638();
    LOBYTE(v43) = 1;
    v10 = sub_2146905E4();
    v12 = v11;
    v40 = v10;
    v44 = v9;
    LOBYTE(v43) = 2;
    swift_bridgeObjectRetain();
    v13 = sub_2146905E4();
    v15 = v14;
    v39 = v13;
    v45 = 3;
    sub_214687FC8();
    swift_bridgeObjectRetain();
    sub_21469062C();
    v38 = v43;
    LOBYTE(v43) = 4;
    v36 = sub_214690608();
    v37 = a2;
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA10);
    v45 = 5;
    sub_214688094(&qword_254D7EA18, &qword_254D7EA10, MEMORY[0x24BEE4038], MEMORY[0x24BEE12D0]);
    v41 = v17;
    swift_bridgeObjectRetain();
    sub_21469062C();
    v18 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA20);
    v45 = 6;
    sub_214688094(&qword_254D7EA28, &qword_254D7EA20, MEMORY[0x24BEE3FB8], MEMORY[0x24BEE12D0]);
    v35 = v18;
    swift_bridgeObjectRetain();
    sub_21469062C();
    v19 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA30);
    v45 = 7;
    sub_214688094(&qword_254D7EA38, &qword_254D7EA30, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    v42 = v19;
    swift_bridgeObjectRetain();
    sub_2146905FC();
    v20 = v43;
    LOBYTE(v43) = 8;
    swift_bridgeObjectRetain();
    v34 = sub_214690614();
    LOBYTE(v43) = 9;
    v33 = sub_214690614();
    LOBYTE(v43) = 10;
    v32 = sub_214690614();
    LOBYTE(v43) = 11;
    v31 = sub_214690614();
    LOBYTE(v43) = 12;
    v30 = sub_2146905F0();
    LOBYTE(v43) = 13;
    v29 = sub_214690614();
    v45 = 14;
    sub_21468800C();
    sub_2146905FC();
    v33 &= 1u;
    v34 &= 1u;
    v31 &= 1u;
    v32 &= 1u;
    v21 = *(void (**)(char *, uint64_t))(v6 + 8);
    v22 = v29 & 1;
    v21(v8, v5);
    v23 = v43;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    v24 = v42;
    swift_bridgeObjectRelease();
    v25 = v35;
    swift_bridgeObjectRelease();
    v26 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v28 = v37;
    *v37 = v44;
    *((_QWORD *)v28 + 1) = v40;
    *((_QWORD *)v28 + 2) = v12;
    *((_QWORD *)v28 + 3) = v39;
    *((_QWORD *)v28 + 4) = v15;
    *((_BYTE *)v28 + 40) = v38;
    *((_QWORD *)v28 + 6) = v36;
    *((_QWORD *)v28 + 7) = v26;
    *((_QWORD *)v28 + 8) = v25;
    *((_QWORD *)v28 + 9) = v24;
    *((_QWORD *)v28 + 10) = v20;
    *((_BYTE *)v28 + 88) = v34;
    *((_BYTE *)v28 + 89) = v33;
    *((_BYTE *)v28 + 90) = v32;
    *((_BYTE *)v28 + 91) = v31;
    *((_BYTE *)v28 + 92) = v30;
    *((_BYTE *)v28 + 93) = v22;
    *((_BYTE *)v28 + 94) = v23;
  }
  return result;
}

uint64_t sub_214686FA0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6F4D656369766564 && a2 == 0xEB000000006C6564;
  if (v2 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C50656369766564 && a2 == 0xEE006D726F667461 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002146952C0 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C646E7542736FLL && a2 == 0xEF6E6F6973726556)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_2146906BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_214687220@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  char v25;
  char v26;
  char v27;
  unsigned __int8 v28;
  char v29;
  unsigned __int8 v30;
  char v31;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E9C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214687E30();
  sub_2146906F8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v31 = 0;
  v9 = sub_214690608();
  v11 = v10;
  v29 = 1;
  sub_214687E74();
  swift_bridgeObjectRetain();
  sub_21469062C();
  v24 = v30;
  v27 = 2;
  sub_214687EB8();
  sub_21469062C();
  v23 = v28;
  v26 = 3;
  v21 = sub_214690608();
  v22 = v12;
  v25 = 4;
  swift_bridgeObjectRetain();
  v13 = sub_214690608();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17 = v13;
  v16(v8, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  v18 = v22;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v24;
  *(_BYTE *)(a2 + 17) = v23;
  *(_QWORD *)(a2 + 24) = v21;
  *(_QWORD *)(a2 + 32) = v18;
  *(_QWORD *)(a2 + 40) = v17;
  *(_QWORD *)(a2 + 48) = v15;
  return result;
}

uint64_t sub_2146874F8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x444972657375 && a2 == 0xE600000000000000;
  if (v2 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000214695400 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6570795472657375 && a2 == 0xE800000000000000 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7261745372657375 && a2 == 0xED00006574614474 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6B63617242656761 && a2 == 0xEA00000000007465 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000214695420 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7265646E6567 && a2 == 0xE600000000000000 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000214695440 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000214695460)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_2146906BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_2146878A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  unsigned __int8 v33;
  char v34;
  char v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EA88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214688178();
  sub_2146906F8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v35 = 0;
  v9 = sub_214690608();
  v11 = v10;
  v34 = 1;
  swift_bridgeObjectRetain();
  v25 = sub_2146905F0();
  v32 = 2;
  sub_2146881BC();
  sub_21469062C();
  v24 = v33;
  v31 = 3;
  v23 = sub_214690644();
  v30 = 4;
  v22 = sub_214690638();
  v29 = 5;
  sub_214690620();
  v13 = v12;
  v28 = 6;
  v21 = sub_214690638();
  v27 = 7;
  sub_214690620();
  v20 = v14;
  v26 = 8;
  v19 = sub_214690608();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v25;
  *(_BYTE *)(a2 + 17) = v24;
  *(_QWORD *)(a2 + 24) = v23;
  *(_DWORD *)(a2 + 32) = v22;
  *(_DWORD *)(a2 + 36) = v13;
  *(_DWORD *)(a2 + 40) = v21;
  *(_DWORD *)(a2 + 44) = v20;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v16;
  return result;
}

uint64_t sub_214687BC0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000012 && a2 == 0x80000002146952A0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_2146906BC();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

_QWORD *sub_214687C44(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _QWORD *v7;
  _BYTE v9[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7E998);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214687D64();
  sub_2146906F8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_214687DA8();
    sub_21469062C();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[15];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_214687D64()
{
  unint64_t result;

  result = qword_254D7E9A0;
  if (!qword_254D7E9A0)
  {
    result = MEMORY[0x2199D3C30](&unk_21469294C, &type metadata for ContentEnvironmentData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7E9A0);
  }
  return result;
}

unint64_t sub_214687DA8()
{
  unint64_t result;

  result = qword_254D7E9A8;
  if (!qword_254D7E9A8)
  {
    result = MEMORY[0x2199D3C30]("-ݴ8X6", &type metadata for ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_254D7E9A8);
  }
  return result;
}

unint64_t sub_214687DEC()
{
  unint64_t result;

  result = qword_254D7E9B8;
  if (!qword_254D7E9B8)
  {
    result = MEMORY[0x2199D3C30](&unk_2146928FC, &type metadata for ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_254D7E9B8);
  }
  return result;
}

unint64_t sub_214687E30()
{
  unint64_t result;

  result = qword_254D7E9C8;
  if (!qword_254D7E9C8)
  {
    result = MEMORY[0x2199D3C30]("u\u07B48l6", &type metadata for DeviceData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7E9C8);
  }
  return result;
}

unint64_t sub_214687E74()
{
  unint64_t result;

  result = qword_254D7E9D0;
  if (!qword_254D7E9D0)
  {
    result = MEMORY[0x2199D3C30](&unk_214692884, &type metadata for DevicePlatform);
    atomic_store(result, (unint64_t *)&qword_254D7E9D0);
  }
  return result;
}

unint64_t sub_214687EB8()
{
  unint64_t result;

  result = qword_254D7E9D8;
  if (!qword_254D7E9D8)
  {
    result = MEMORY[0x2199D3C30](&unk_21469285C, &type metadata for OsInstallVariant);
    atomic_store(result, (unint64_t *)&qword_254D7E9D8);
  }
  return result;
}

unint64_t sub_214687EFC()
{
  unint64_t result;

  result = qword_254D7E9E8;
  if (!qword_254D7E9E8)
  {
    result = MEMORY[0x2199D3C30](&unk_214692834, &type metadata for DevicePlatform);
    atomic_store(result, (unint64_t *)&qword_254D7E9E8);
  }
  return result;
}

unint64_t sub_214687F40()
{
  unint64_t result;

  result = qword_254D7E9F0;
  if (!qword_254D7E9F0)
  {
    result = MEMORY[0x2199D3C30](&unk_21469280C, &type metadata for OsInstallVariant);
    atomic_store(result, (unint64_t *)&qword_254D7E9F0);
  }
  return result;
}

unint64_t sub_214687F84()
{
  unint64_t result;

  result = qword_254D7EA00;
  if (!qword_254D7EA00)
  {
    result = MEMORY[0x2199D3C30]("eߴ887", &type metadata for SessionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EA00);
  }
  return result;
}

unint64_t sub_214687FC8()
{
  unint64_t result;

  result = qword_254D7EA08;
  if (!qword_254D7EA08)
  {
    result = MEMORY[0x2199D3C30](&unk_214692794, &type metadata for ICloudAccountState);
    atomic_store(result, (unint64_t *)&qword_254D7EA08);
  }
  return result;
}

unint64_t sub_21468800C()
{
  unint64_t result;

  result = qword_254D7EA40;
  if (!qword_254D7EA40)
  {
    result = MEMORY[0x2199D3C30](&unk_21469276C, &type metadata for AggregateStateMode);
    atomic_store(result, (unint64_t *)&qword_254D7EA40);
  }
  return result;
}

unint64_t sub_214688050()
{
  unint64_t result;

  result = qword_254D7EA50;
  if (!qword_254D7EA50)
  {
    result = MEMORY[0x2199D3C30](&unk_214692744, &type metadata for ICloudAccountState);
    atomic_store(result, (unint64_t *)&qword_254D7EA50);
  }
  return result;
}

uint64_t sub_214688094(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x2199D3C30](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2146880F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_214688134()
{
  unint64_t result;

  result = qword_254D7EA80;
  if (!qword_254D7EA80)
  {
    result = MEMORY[0x2199D3C30](&unk_21469271C, &type metadata for AggregateStateMode);
    atomic_store(result, (unint64_t *)&qword_254D7EA80);
  }
  return result;
}

unint64_t sub_214688178()
{
  unint64_t result;

  result = qword_254D7EA90;
  if (!qword_254D7EA90)
  {
    result = MEMORY[0x2199D3C30](&unk_2146926CC, &type metadata for UserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EA90);
  }
  return result;
}

unint64_t sub_2146881BC()
{
  unint64_t result;

  result = qword_254D7EA98;
  if (!qword_254D7EA98)
  {
    result = MEMORY[0x2199D3C30](&unk_2146926A4, &type metadata for UserType);
    atomic_store(result, (unint64_t *)&qword_254D7EA98);
  }
  return result;
}

unint64_t sub_214688200()
{
  unint64_t result;

  result = qword_254D7EAA8;
  if (!qword_254D7EAA8)
  {
    result = MEMORY[0x2199D3C30](&unk_21469267C, &type metadata for UserType);
    atomic_store(result, (unint64_t *)&qword_254D7EAA8);
  }
  return result;
}

unint64_t sub_214688244()
{
  unint64_t result;

  result = qword_254D7EAB8;
  if (!qword_254D7EAB8)
  {
    result = MEMORY[0x2199D3C30](&unk_21469262C, &type metadata for NetworkEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EAB8);
  }
  return result;
}

unint64_t sub_214688288()
{
  unint64_t result;

  result = qword_254D7EAC8;
  if (!qword_254D7EAC8)
  {
    result = MEMORY[0x2199D3C30](&unk_214692604, &type metadata for CacheState);
    atomic_store(result, (unint64_t *)&qword_254D7EAC8);
  }
  return result;
}

unint64_t sub_2146882CC()
{
  unint64_t result;

  result = qword_254D7EAD0;
  if (!qword_254D7EAD0)
  {
    result = MEMORY[0x2199D3C30](&unk_2146925DC, &type metadata for NetworkEventType);
    atomic_store(result, (unint64_t *)&qword_254D7EAD0);
  }
  return result;
}

unint64_t sub_214688310()
{
  unint64_t result;

  result = qword_254D7EAD8;
  if (!qword_254D7EAD8)
  {
    result = MEMORY[0x2199D3C30](&unk_2146925B4, &type metadata for CellularRadioAccessTechnology);
    atomic_store(result, (unint64_t *)&qword_254D7EAD8);
  }
  return result;
}

uint64_t sub_214688354(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NetworkEventData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_214688398(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NetworkEventData(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2146883D4()
{
  unint64_t result;

  result = qword_254D7EAF0;
  if (!qword_254D7EAF0)
  {
    result = MEMORY[0x2199D3C30](&unk_21469258C, &type metadata for CacheState);
    atomic_store(result, (unint64_t *)&qword_254D7EAF0);
  }
  return result;
}

unint64_t sub_214688418()
{
  unint64_t result;

  result = qword_254D7EAF8;
  if (!qword_254D7EAF8)
  {
    result = MEMORY[0x2199D3C30](&unk_214692564, &type metadata for NetworkEventType);
    atomic_store(result, (unint64_t *)&qword_254D7EAF8);
  }
  return result;
}

unint64_t sub_21468845C()
{
  unint64_t result;

  result = qword_254D7EB00;
  if (!qword_254D7EB00)
  {
    result = MEMORY[0x2199D3C30](&unk_21469253C, &type metadata for CellularRadioAccessTechnology);
    atomic_store(result, (unint64_t *)&qword_254D7EB00);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkEventData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkEventData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_21468857C + 4 * byte_214691591[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_2146885B0 + 4 * byte_21469158C[v4]))();
}

uint64_t sub_2146885B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2146885B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2146885C0);
  return result;
}

uint64_t sub_2146885CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2146885D4);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_2146885D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2146885E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkEventData.CodingKeys()
{
  return &type metadata for NetworkEventData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for UserData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UserData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_2146886DC + 4 * byte_21469159B[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_214688710 + 4 * byte_214691596[v4]))();
}

uint64_t sub_214688710(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688718(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214688720);
  return result;
}

uint64_t sub_21468872C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214688734);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_214688738(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688740(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserData.CodingKeys()
{
  return &type metadata for UserData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SessionData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_214688838 + 4 * byte_2146915A5[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_21468886C + 4 * byte_2146915A0[v4]))();
}

uint64_t sub_21468886C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688874(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21468887CLL);
  return result;
}

uint64_t sub_214688888(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214688890);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_214688894(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21468889C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SessionData.CodingKeys()
{
  return &type metadata for SessionData.CodingKeys;
}

ValueMetadata *type metadata accessor for DeviceData.CodingKeys()
{
  return &type metadata for DeviceData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ContentEnvironmentData.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ContentEnvironmentData.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_214688964 + 4 * byte_2146915AA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_214688984 + 4 * byte_2146915AF[v4]))();
}

_BYTE *sub_214688964(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_214688984(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21468898C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_214688994(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21468899C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2146889A4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2146889B0()
{
  return 0;
}

ValueMetadata *type metadata accessor for ContentEnvironmentData.CodingKeys()
{
  return &type metadata for ContentEnvironmentData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AppData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_214688AA4 + 4 * byte_2146915B9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_214688AD8 + 4 * byte_2146915B4[v4]))();
}

uint64_t sub_214688AD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688AE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214688AE8);
  return result;
}

uint64_t sub_214688AF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214688AFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_214688B00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688B08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688B14(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_214688B1C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppData.CodingKeys()
{
  return &type metadata for AppData.CodingKeys;
}

ValueMetadata *type metadata accessor for ContentEnvironment()
{
  return &type metadata for ContentEnvironment;
}

ValueMetadata *type metadata accessor for OsInstallVariant()
{
  return &type metadata for OsInstallVariant;
}

uint64_t _s19NewsAnalyticsUpload18ContentEnvironmentOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s19NewsAnalyticsUpload18ContentEnvironmentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_214688C3C + 4 * byte_2146915C3[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_214688C70 + 4 * byte_2146915BE[v4]))();
}

uint64_t sub_214688C70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688C78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214688C80);
  return result;
}

uint64_t sub_214688C8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214688C94);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_214688C98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688CA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DevicePlatform()
{
  return &type metadata for DevicePlatform;
}

ValueMetadata *type metadata accessor for AggregateStateMode()
{
  return &type metadata for AggregateStateMode;
}

ValueMetadata *type metadata accessor for ICloudAccountState()
{
  return &type metadata for ICloudAccountState;
}

ValueMetadata *type metadata accessor for UserType()
{
  return &type metadata for UserType;
}

uint64_t _s19NewsAnalyticsUpload29CellularRadioAccessTechnologyOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s19NewsAnalyticsUpload29CellularRadioAccessTechnologyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_214688DC8 + 4 * byte_2146915CD[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_214688DFC + 4 * byte_2146915C8[v4]))();
}

uint64_t sub_214688DFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688E04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214688E0CLL);
  return result;
}

uint64_t sub_214688E18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214688E20);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_214688E24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688E2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CellularRadioAccessTechnology()
{
  return &type metadata for CellularRadioAccessTechnology;
}

uint64_t getEnumTagSinglePayload for NetworkEventType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEE)
    goto LABEL_17;
  if (a2 + 18 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 18) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 18;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 18;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 18;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x13;
  v8 = v6 - 19;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkEventType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 18 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 18) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xED)
    return ((uint64_t (*)(void))((char *)&loc_214688F24 + 4 * byte_2146915D7[v4]))();
  *a1 = a2 + 18;
  return ((uint64_t (*)(void))((char *)sub_214688F58 + 4 * byte_2146915D2[v4]))();
}

uint64_t sub_214688F58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688F60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214688F68);
  return result;
}

uint64_t sub_214688F74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214688F7CLL);
  *(_BYTE *)result = a2 + 18;
  return result;
}

uint64_t sub_214688F80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214688F88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkEventType()
{
  return &type metadata for NetworkEventType;
}

uint64_t _s19NewsAnalyticsUpload16OsInstallVariantOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19NewsAnalyticsUpload16OsInstallVariantOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_214689080 + 4 * byte_2146915E1[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2146890B4 + 4 * byte_2146915DC[v4]))();
}

uint64_t sub_2146890B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2146890BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2146890C4);
  return result;
}

uint64_t sub_2146890D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2146890D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2146890DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2146890E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2146890F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CacheState()
{
  return &type metadata for CacheState;
}

unint64_t sub_21468910C()
{
  unint64_t result;

  result = qword_254D7EB08;
  if (!qword_254D7EB08)
  {
    result = MEMORY[0x2199D3C30](&unk_214691BC4, &type metadata for CacheState);
    atomic_store(result, (unint64_t *)&qword_254D7EB08);
  }
  return result;
}

unint64_t sub_214689154()
{
  unint64_t result;

  result = qword_254D7EB10;
  if (!qword_254D7EB10)
  {
    result = MEMORY[0x2199D3C30](&unk_214691C64, &type metadata for NetworkEventType);
    atomic_store(result, (unint64_t *)&qword_254D7EB10);
  }
  return result;
}

unint64_t sub_21468919C()
{
  unint64_t result;

  result = qword_254D7EB18;
  if (!qword_254D7EB18)
  {
    result = MEMORY[0x2199D3C30](&unk_214691D04, &type metadata for CellularRadioAccessTechnology);
    atomic_store(result, (unint64_t *)&qword_254D7EB18);
  }
  return result;
}

unint64_t sub_2146891E4()
{
  unint64_t result;

  result = qword_254D7EB20;
  if (!qword_254D7EB20)
  {
    result = MEMORY[0x2199D3C30](&unk_214691DA4, &type metadata for UserType);
    atomic_store(result, (unint64_t *)&qword_254D7EB20);
  }
  return result;
}

unint64_t sub_21468922C()
{
  unint64_t result;

  result = qword_254D7EB28;
  if (!qword_254D7EB28)
  {
    result = MEMORY[0x2199D3C30](&unk_214691E44, &type metadata for ICloudAccountState);
    atomic_store(result, (unint64_t *)&qword_254D7EB28);
  }
  return result;
}

unint64_t sub_214689274()
{
  unint64_t result;

  result = qword_254D7EB30;
  if (!qword_254D7EB30)
  {
    result = MEMORY[0x2199D3C30](&unk_214691EE4, &type metadata for AggregateStateMode);
    atomic_store(result, (unint64_t *)&qword_254D7EB30);
  }
  return result;
}

unint64_t sub_2146892BC()
{
  unint64_t result;

  result = qword_254D7EB38;
  if (!qword_254D7EB38)
  {
    result = MEMORY[0x2199D3C30](&unk_214691F84, &type metadata for DevicePlatform);
    atomic_store(result, (unint64_t *)&qword_254D7EB38);
  }
  return result;
}

unint64_t sub_214689304()
{
  unint64_t result;

  result = qword_254D7EB40;
  if (!qword_254D7EB40)
  {
    result = MEMORY[0x2199D3C30](&unk_214692024, &type metadata for OsInstallVariant);
    atomic_store(result, (unint64_t *)&qword_254D7EB40);
  }
  return result;
}

unint64_t sub_21468934C()
{
  unint64_t result;

  result = qword_254D7EB48;
  if (!qword_254D7EB48)
  {
    result = MEMORY[0x2199D3C30](&unk_2146920C4, &type metadata for ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_254D7EB48);
  }
  return result;
}

unint64_t sub_214689394()
{
  unint64_t result;

  result = qword_254D7EB50;
  if (!qword_254D7EB50)
  {
    result = MEMORY[0x2199D3C30](&unk_21469217C, &type metadata for AppData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB50);
  }
  return result;
}

unint64_t sub_2146893DC()
{
  unint64_t result;

  result = qword_254D7EB58;
  if (!qword_254D7EB58)
  {
    result = MEMORY[0x2199D3C30](&unk_214692234, &type metadata for ContentEnvironmentData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB58);
  }
  return result;
}

unint64_t sub_214689424()
{
  unint64_t result;

  result = qword_254D7EB60;
  if (!qword_254D7EB60)
  {
    result = MEMORY[0x2199D3C30](&unk_2146922EC, &type metadata for DeviceData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB60);
  }
  return result;
}

unint64_t sub_21468946C()
{
  unint64_t result;

  result = qword_254D7EB68;
  if (!qword_254D7EB68)
  {
    result = MEMORY[0x2199D3C30](&unk_2146923A4, &type metadata for SessionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB68);
  }
  return result;
}

unint64_t sub_2146894B4()
{
  unint64_t result;

  result = qword_254D7EB70;
  if (!qword_254D7EB70)
  {
    result = MEMORY[0x2199D3C30](&unk_21469245C, &type metadata for UserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB70);
  }
  return result;
}

unint64_t sub_2146894FC()
{
  unint64_t result;

  result = qword_254D7EB78;
  if (!qword_254D7EB78)
  {
    result = MEMORY[0x2199D3C30](&unk_214692514, &type metadata for NetworkEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB78);
  }
  return result;
}

unint64_t sub_214689544()
{
  unint64_t result;

  result = qword_254D7EB80;
  if (!qword_254D7EB80)
  {
    result = MEMORY[0x2199D3C30](&unk_214692484, &type metadata for NetworkEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB80);
  }
  return result;
}

unint64_t sub_21468958C()
{
  unint64_t result;

  result = qword_254D7EB88;
  if (!qword_254D7EB88)
  {
    result = MEMORY[0x2199D3C30](&unk_2146924AC, &type metadata for NetworkEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB88);
  }
  return result;
}

unint64_t sub_2146895D4()
{
  unint64_t result;

  result = qword_254D7EB90;
  if (!qword_254D7EB90)
  {
    result = MEMORY[0x2199D3C30](&unk_2146923CC, &type metadata for UserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB90);
  }
  return result;
}

unint64_t sub_21468961C()
{
  unint64_t result;

  result = qword_254D7EB98;
  if (!qword_254D7EB98)
  {
    result = MEMORY[0x2199D3C30](&unk_2146923F4, &type metadata for UserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EB98);
  }
  return result;
}

unint64_t sub_214689664()
{
  unint64_t result;

  result = qword_254D7EBA0;
  if (!qword_254D7EBA0)
  {
    result = MEMORY[0x2199D3C30](&unk_214692314, &type metadata for SessionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBA0);
  }
  return result;
}

unint64_t sub_2146896AC()
{
  unint64_t result;

  result = qword_254D7EBA8;
  if (!qword_254D7EBA8)
  {
    result = MEMORY[0x2199D3C30](&unk_21469233C, &type metadata for SessionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBA8);
  }
  return result;
}

unint64_t sub_2146896F4()
{
  unint64_t result;

  result = qword_254D7EBB0;
  if (!qword_254D7EBB0)
  {
    result = MEMORY[0x2199D3C30](&unk_21469225C, &type metadata for DeviceData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBB0);
  }
  return result;
}

unint64_t sub_21468973C()
{
  unint64_t result;

  result = qword_254D7EBB8;
  if (!qword_254D7EBB8)
  {
    result = MEMORY[0x2199D3C30](&unk_214692284, &type metadata for DeviceData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBB8);
  }
  return result;
}

unint64_t sub_214689784()
{
  unint64_t result;

  result = qword_254D7EBC0;
  if (!qword_254D7EBC0)
  {
    result = MEMORY[0x2199D3C30](&unk_2146921A4, &type metadata for ContentEnvironmentData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBC0);
  }
  return result;
}

unint64_t sub_2146897CC()
{
  unint64_t result;

  result = qword_254D7EBC8;
  if (!qword_254D7EBC8)
  {
    result = MEMORY[0x2199D3C30](&unk_2146921CC, &type metadata for ContentEnvironmentData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBC8);
  }
  return result;
}

unint64_t sub_214689814()
{
  unint64_t result;

  result = qword_254D7EBD0;
  if (!qword_254D7EBD0)
  {
    result = MEMORY[0x2199D3C30](&unk_2146920EC, &type metadata for AppData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBD0);
  }
  return result;
}

unint64_t sub_21468985C()
{
  unint64_t result;

  result = qword_254D7EBD8;
  if (!qword_254D7EBD8)
  {
    result = MEMORY[0x2199D3C30](&unk_214692114, &type metadata for AppData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D7EBD8);
  }
  return result;
}

unint64_t sub_2146898A0()
{
  unint64_t result;

  result = qword_254D7EBE0;
  if (!qword_254D7EBE0)
  {
    result = MEMORY[0x2199D3C30](&unk_21469204C, &type metadata for ContentEnvironment);
    atomic_store(result, (unint64_t *)&qword_254D7EBE0);
  }
  return result;
}

unint64_t sub_2146898E4()
{
  unint64_t result;

  result = qword_254D7EBE8;
  if (!qword_254D7EBE8)
  {
    result = MEMORY[0x2199D3C30](&unk_214691F0C, &type metadata for DevicePlatform);
    atomic_store(result, (unint64_t *)&qword_254D7EBE8);
  }
  return result;
}

unint64_t sub_214689928()
{
  unint64_t result;

  result = qword_254D7EBF0;
  if (!qword_254D7EBF0)
  {
    result = MEMORY[0x2199D3C30](&unk_214691FAC, &type metadata for OsInstallVariant);
    atomic_store(result, (unint64_t *)&qword_254D7EBF0);
  }
  return result;
}

unint64_t sub_21468996C()
{
  unint64_t result;

  result = qword_254D7EBF8;
  if (!qword_254D7EBF8)
  {
    result = MEMORY[0x2199D3C30](&unk_214691DCC, &type metadata for ICloudAccountState);
    atomic_store(result, (unint64_t *)&qword_254D7EBF8);
  }
  return result;
}

unint64_t sub_2146899B0()
{
  unint64_t result;

  result = qword_254D7EC00;
  if (!qword_254D7EC00)
  {
    result = MEMORY[0x2199D3C30](&unk_214691E6C, &type metadata for AggregateStateMode);
    atomic_store(result, (unint64_t *)&qword_254D7EC00);
  }
  return result;
}

unint64_t sub_2146899F4()
{
  unint64_t result;

  result = qword_254D7EC08;
  if (!qword_254D7EC08)
  {
    result = MEMORY[0x2199D3C30](&unk_214691D2C, &type metadata for UserType);
    atomic_store(result, (unint64_t *)&qword_254D7EC08);
  }
  return result;
}

uint64_t sub_214689A38()
{
  unint64_t v0;

  v0 = sub_2146905D8();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_214689A7C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D69547472617473 && a2 == 0xE900000000000065;
  if (v2 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461727544736E64 && a2 == 0xEB000000006E6F69 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x447463656E6E6F63 && a2 == 0xEF6E6F6974617275 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4474736575716572 && a2 == 0xEF6E6F6974617275 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000214695480 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xEC000000657A6953 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6174536568636163 && a2 == 0xEA00000000006574 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6F43737574617473 && a2 == 0xEA00000000006564 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x707954746E657665 && a2 == 0xE900000000000065 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002146954A0 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x80000002146954C0 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x69646E6F70736572 && a2 == 0xED0000706F50676ELL || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002146954E0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else
  {
    v6 = sub_2146906BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 13;
    else
      return 14;
  }
}

unint64_t sub_21468A0AC()
{
  unint64_t result;

  result = qword_254D7EC10;
  if (!qword_254D7EC10)
  {
    result = MEMORY[0x2199D3C30](&unk_214691B4C, &type metadata for CacheState);
    atomic_store(result, (unint64_t *)&qword_254D7EC10);
  }
  return result;
}

unint64_t sub_21468A0F0()
{
  unint64_t result;

  result = qword_254D7EC18;
  if (!qword_254D7EC18)
  {
    result = MEMORY[0x2199D3C30](&unk_214691BEC, &type metadata for NetworkEventType);
    atomic_store(result, (unint64_t *)&qword_254D7EC18);
  }
  return result;
}

unint64_t sub_21468A134()
{
  unint64_t result;

  result = qword_254D7EC20;
  if (!qword_254D7EC20)
  {
    result = MEMORY[0x2199D3C30](&unk_214691C8C, &type metadata for CellularRadioAccessTechnology);
    atomic_store(result, (unint64_t *)&qword_254D7EC20);
  }
  return result;
}

uint64_t sub_21468A178()
{
  unint64_t v0;

  v0 = sub_2146906C8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13)
    return 19;
  else
    return v0;
}

uint64_t sub_21468A1C8()
{
  unint64_t v0;

  v0 = sub_2146905D8();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_21468A20C()
{
  unint64_t v0;

  v0 = sub_2146905D8();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t TelemetryUploader.uploadEnvelopes(_:completion:)(char **p_type, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  void *v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  unsigned int v25;
  char **v26;
  char *v27;
  char *v28;
  uint64_t v29;
  id v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  _OWORD *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  id v51;
  _OWORD *v52;
  id v53;
  dispatch_group_t v54;
  _QWORD *v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  dispatch_group_t v64;
  int IsEmpty;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v73;
  id v74;
  void *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t);
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char **v105;
  unint64_t v106;
  dispatch_group_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD aBlock[6];

  v85 = a3;
  v84 = a2;
  v4 = sub_2146904F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_21469050C();
  v87 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v86 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_214690254();
  v103 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v102 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_214690470();
  v100 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v99 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_214690278();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21469026C();
  v93 = sub_214690260();
  v92 = v15;
  v16 = *(void (**)(char *, uint64_t))(v12 + 8);
  v97 = v14;
  v98 = v11;
  v96 = v16;
  v16(v14, v11);
  v17 = (void *)*MEMORY[0x24BE6C658];
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC28);
  v18 = (_OWORD *)swift_allocObject();
  v18[1] = xmmword_2146929F0;
  v19 = (unint64_t)p_type >> 62;
  if ((unint64_t)p_type >> 62)
  {
LABEL_32:
    v83 = v17;
    swift_bridgeObjectRetain();
    v20 = sub_2146905CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = *(_QWORD *)(((unint64_t)p_type & 0xFFFFFFFFFFFFF8) + 0x10);
    v21 = v17;
  }
  v22 = MEMORY[0x24BEE17F0];
  *((_QWORD *)v18 + 7) = MEMORY[0x24BEE1768];
  *((_QWORD *)v18 + 8) = v22;
  *((_QWORD *)v18 + 4) = v20;
  *((_QWORD *)v18 + 12) = MEMORY[0x24BEE0D00];
  v106 = sub_21468AE78();
  *((_QWORD *)v18 + 13) = v106;
  v23 = v92;
  *((_QWORD *)v18 + 9) = v93;
  *((_QWORD *)v18 + 10) = v23;
  swift_bridgeObjectRetain();
  sub_214690584();
  sub_2146904E8();

  swift_bridgeObjectRelease();
  v107 = dispatch_group_create();
  v91 = v4;
  v90 = v5;
  v89 = v7;
  if (v19)
  {
    swift_bridgeObjectRetain();
    v4 = sub_2146905CC();
    if (!v4)
      goto LABEL_28;
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(((unint64_t)p_type & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
LABEL_7:
    v5 = (unint64_t)p_type & 0xC000000000000001;
    v7 = 4;
    v95 = OBJC_IVAR___NDAnalyticsTelemetryUploader_sessionManager;
    v94 = *MEMORY[0x24BE03D40];
    v114 = xmmword_214691460;
    v105 = p_type;
    v112 = (unint64_t)p_type & 0xC000000000000001;
    v113 = v4;
    while (1)
    {
      v17 = (void *)(v7 - 4);
      v26 = p_type;
      if (v5)
        v27 = (char *)MEMORY[0x2199D3684](v7 - 4, p_type);
      else
        v27 = p_type[v7];
      v28 = v27;
      v29 = v7 - 3;
      p_type = &stru_24D1E1FF0.type;
      if (__OFADD__(v17, 1))
      {
        __break(1u);
        goto LABEL_32;
      }
      if (objc_msgSend(v27, sel_contentType) == 2)
        break;
      v24 = (id)*MEMORY[0x24BE6C658];
      v18 = (_OWORD *)sub_214690578();
      v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = v114;
      v25 = objc_msgSend(v28, sel_contentType);
      *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE3F88];
      *(_QWORD *)(v19 + 64) = MEMORY[0x24BEE3FF0];
      *(_DWORD *)(v19 + 32) = v25;
      sub_2146904E8();

      swift_bridgeObjectRelease();
      p_type = v26;
LABEL_9:
      ++v7;
      if (v29 == v4)
        goto LABEL_28;
    }
    v30 = objc_msgSend(v28, sel_content);
    if (!v30)
    {
      __break(1u);
      goto LABEL_34;
    }
    v31 = v30;
    v18 = objc_msgSend(v30, sel_fc_zlibInflate);

    p_type = v26;
    if (v18)
    {
      v19 = sub_214690230();
      v33 = v32;

      v34 = (void *)sub_214690224();
      sub_21468BF1C(v19, v33);
    }
    else
    {
      v34 = 0;
    }
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6D2A8]), sel_initWithData_, v34);

    if (!v35)
    {
      v58 = (id)*MEMORY[0x24BE6C658];
      sub_214690578();
      *(_OWORD *)(swift_allocObject() + 16) = v114;
      v59 = objc_msgSend(v28, sel_content);
      if (v59)
      {
        v60 = v59;
        sub_214690230();
        v62 = v61;

        __asm { BR              X9 }
      }
LABEL_34:
      __break(1u);
      JUMPOUT(0x21468AE68);
    }
    v36 = objc_msgSend(v35, sel_networkEventGroups);
    if (v36)
    {
      v37 = v36;
      if (objc_msgSend(v36, sel_count))
      {
        v38 = v97;
        sub_21469026C();
        v39 = sub_214690260();
        v111 = v39;
        v41 = v40;
        v96(v38, v98);
        v42 = (void *)*MEMORY[0x24BE6C658];
        v43 = swift_allocObject();
        v109 = v37;
        *(_OWORD *)(v43 + 16) = v114;
        v44 = v106;
        *(_QWORD *)(v43 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v43 + 64) = v44;
        *(_QWORD *)(v43 + 32) = v39;
        *(_QWORD *)(v43 + 40) = v41;
        v45 = v42;
        v108 = v41;
        swift_bridgeObjectRetain();
        sub_214690584();
        sub_2146904E8();

        swift_bridgeObjectRelease();
        v46 = *(_OWORD **)(v104 + v95);
        v19 = v100;
        v47 = v99;
        v48 = v101;
        (*(void (**)(char *, _QWORD, uint64_t))(v100 + 104))(v99, v94, v101);
        v49 = v102;
        sub_214690248();
        sub_214690368();
        v50 = *(void (**)(char *, uint64_t))(v103 + 8);
        v50(v49, v110);
        (*(void (**)(char *, uint64_t))(v19 + 8))(v47, v48);
        *(_QWORD *)(swift_allocObject() + 16) = v35;
        v51 = v35;
        sub_214690350();
        swift_release();
        v52 = v46;
        sub_214690380();
        *(_QWORD *)(swift_allocObject() + 16) = v51;
        v53 = v51;
        sub_21469047C();
        swift_release();
        swift_release();
        v54 = v107;
        dispatch_group_enter(v107);
        v55 = (_QWORD *)swift_allocObject();
        v56 = v108;
        v55[2] = v111;
        v55[3] = v56;
        v55[4] = v54;
        v57 = v54;
        sub_214690248();
        v18 = v52;
        sub_21469035C();

        p_type = v105;
        swift_release();
        v50(v49, v110);
LABEL_27:
        v5 = v112;
        v4 = v113;
        goto LABEL_9;
      }

    }
    v63 = (id)*MEMORY[0x24BE6C658];
    sub_214690584();
    sub_2146904E8();

    goto LABEL_27;
  }
LABEL_28:
  swift_bridgeObjectRelease();
  v64 = v107;
  IsEmpty = FCDispatchGroupIsEmpty();
  v66 = (void *)*MEMORY[0x24BE6C658];
  v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_214691460;
  v68 = v106;
  *(_QWORD *)(v67 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v67 + 64) = v68;
  v69 = v93;
  v70 = v92;
  *(_QWORD *)(v67 + 32) = v93;
  *(_QWORD *)(v67 + 40) = v70;
  if (IsEmpty)
  {
    v71 = v66;
    sub_214690584();
    sub_2146904E8();

    return swift_bridgeObjectRelease();
  }
  else
  {
    v73 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    v74 = v66;
    sub_214690584();
    sub_2146904E8();

    swift_bridgeObjectRelease();
    sub_21468CDD0(0, &qword_254D7EC40);
    v75 = (void *)sub_21469059C();
    v76 = (_QWORD *)swift_allocObject();
    v76[2] = v69;
    v76[3] = v70;
    v77 = v84;
    v78 = v85;
    v76[4] = v84;
    v76[5] = v78;
    aBlock[4] = sub_21468BEBC;
    aBlock[5] = v76;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21468BEC8;
    aBlock[3] = &block_descriptor;
    v79 = _Block_copy(aBlock);
    sub_21468BF0C(v77);
    v80 = v86;
    sub_214690500();
    v116 = v73;
    sub_21467F2D8(&qword_254D7EC48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC50);
    sub_21468CE08(&qword_254D7EC58, &qword_254D7EC50, MEMORY[0x24BEE12C8]);
    v81 = v89;
    v82 = v91;
    sub_2146905A8();
    sub_214690590();
    _Block_release(v79);

    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v81, v82);
    (*(void (**)(char *, uint64_t))(v87 + 8))(v80, v88);
    return swift_release();
  }
}

unint64_t sub_21468AE78()
{
  unint64_t result;

  result = qword_254D7EC30;
  if (!qword_254D7EC30)
  {
    result = MEMORY[0x2199D3C30](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254D7EC30);
  }
  return result;
}

id sub_21468AEBC(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id result;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  unsigned int v33;
  unsigned int v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  _QWORD v56[2];
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  void (*v75)(uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7ECA8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7ECB0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v70 = (char *)v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7ECB8);
  v68 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v67 = (char *)v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7ECC0);
  v65 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v13 = (char *)v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7ECC8);
  v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v15 = (char *)v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(v2, sel_appVersion);
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  v17 = result;
  v60 = v13;
  v61 = v9;
  v62 = v8;
  v57 = v7;
  v78 = a1;
  v58 = v5;
  v59 = v4;
  v18 = sub_214690524();
  v20 = v19;

  v80 = v2;
  result = objc_msgSend(v2, sel_appBuildNumber);
  if (!result)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v21 = result;
  v22 = sub_214690524();
  v24 = v23;

  v81 = v18;
  v82 = v20;
  v83 = v22;
  v84 = v24;
  sub_21468CE48();
  sub_2146902CC();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC70);
  v26 = sub_214690314();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(unsigned __int8 *)(v27 + 80);
  v29 = (v28 + 32) & ~v28;
  v76 = v29 + *(_QWORD *)(v27 + 72);
  v77 = v28 | 7;
  v30 = swift_allocObject();
  v79 = xmmword_214691460;
  *(_OWORD *)(v30 + 16) = xmmword_214691460;
  v71 = v29;
  v31 = *MEMORY[0x24BE03BB0];
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 104);
  v72 = v26;
  v32(v30 + v29, v31, v26);
  v75 = v32;
  v56[1] = "or group type %d";
  v74 = 0x8000000214695870;
  sub_2146903C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v64);
  v33 = objc_msgSend(v80, sel_contentEnvironment);
  v34 = 0x1020300u >> (8 * v33);
  if (v33 >= 4)
    LOBYTE(v34) = 0;
  LOBYTE(v81) = v34;
  sub_21468CE8C();
  v35 = v60;
  sub_2146902CC();
  v73 = v25;
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = v79;
  v32(v36 + v29, v31, v26);
  sub_2146903C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v35, v66);
  sub_21468C1E8((uint64_t)&v81);
  sub_21468CED0();
  v37 = v67;
  sub_2146902CC();
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = v79;
  v39 = v71;
  v40 = v31;
  v41 = v31;
  v42 = v72;
  v75(v38 + v71, v41, v72);
  sub_2146903C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v37, v69);
  sub_21468C2CC((uint64_t)&v81);
  sub_21468CF14();
  v43 = v70;
  sub_2146902CC();
  v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = v79;
  LODWORD(v69) = v40;
  v45 = v75;
  v75(v44 + v39, v40, v42);
  sub_2146903C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v43, v62);
  result = objc_msgSend(v80, sel_userId);
  if (!result)
    goto LABEL_10;
  v46 = result;
  v47 = sub_214690524();
  v49 = v48;

  result = objc_msgSend(v80, sel_userStorefrontId);
  if (result)
  {
    v50 = result;
    v51 = sub_214690524();
    v53 = v52;

    v81 = v47;
    v82 = v49;
    LOWORD(v83) = 2;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = v51;
    v88 = v53;
    sub_21468CF58();
    v54 = v57;
    sub_2146902CC();
    v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = v79;
    v45(v55 + v71, v69, v72);
    sub_2146903C8();
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v54, v59);
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_21468B644(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void **v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v16;
  id v17;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  id v35;
  __int128 v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  unsigned int v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  _OWORD v49[3];

  v45 = a1;
  v44 = type metadata accessor for NetworkEventData(0);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (uint64_t)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_msgSend(v1, sel_networkEventGroups);
  if (!v3)
    goto LABEL_29;
  v4 = v3;
  if (!objc_msgSend(v3, sel_count))
  {

LABEL_29:
    v48 = (id)*MEMORY[0x24BE6C658];
    sub_214690584();
    sub_2146904E8();
LABEL_30:

    return;
  }
  *(_QWORD *)&v49[0] = 0;
  sub_21468CDD0(0, &qword_254D7EC68);
  v5 = v4;
  sub_214690554();

  v6 = (void **)MEMORY[0x24BE6C658];
  if (!*(_QWORD *)&v49[0])
  {
    v48 = (id)*MEMORY[0x24BE6C658];
    sub_214690578();
    sub_2146904E8();

    goto LABEL_30;
  }
  v7 = (id)*MEMORY[0x24BE6C658];
  v33 = *(_QWORD *)&v49[0];
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC28);
  v8 = swift_allocObject();
  v9 = v33;
  v42 = xmmword_214691460;
  *(_OWORD *)(v8 + 16) = xmmword_214691460;
  v10 = v9 >> 62;
  if (v9 >> 62)
    goto LABEL_38;
  v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  v12 = v7;
LABEL_6:
  v13 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v8 + 64) = v13;
  *(_QWORD *)(v8 + 32) = v11;
  sub_214690584();
  sub_2146904E8();

  swift_bridgeObjectRelease();
  if (v10)
  {
    swift_bridgeObjectRetain();
    v7 = (id)sub_2146905CC();
    swift_bridgeObjectRelease();
    if (v7)
      goto LABEL_8;
  }
  else
  {
    v7 = *(id *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_8:
      v10 = 0;
      v37 = v33 & 0xC000000000000001;
      v32 = v33 & 0xFFFFFFFFFFFFFF8;
      v31 = v33 + 32;
      v41 = *MEMORY[0x24BE03BB8];
      v36 = xmmword_2146929F0;
      v40 = 0x8000000214695870;
      v35 = v5;
      v34 = v7;
      while (1)
      {
        if (v37)
        {
          v14 = (id)MEMORY[0x2199D3684](v10, v33);
        }
        else
        {
          if (v10 >= *(_QWORD *)(v32 + 16))
            goto LABEL_37;
          v14 = *(id *)(v31 + 8 * v10);
        }
        v48 = v14;
        if (__OFADD__(v10++, 1))
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          v29 = v7;
          swift_bridgeObjectRetain();
          v11 = sub_2146905CC();
          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
        v39 = (id)v10;
        v16 = *v6;
        v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = v36;
        v17 = v16;
        v18 = sub_21468C3CC();
        if (v18 >> 62)
          v6 = (void **)sub_2146905CC();
        else
          v6 = *(void ***)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRelease();
        *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE1768];
        *(_QWORD *)(v8 + 64) = MEMORY[0x24BEE17F0];
        *(_QWORD *)(v8 + 32) = v6;
        v7 = v48;
        v19 = objc_msgSend(v48, sel_eventType);
        *(_QWORD *)(v8 + 96) = MEMORY[0x24BEE3F88];
        *(_QWORD *)(v8 + 104) = MEMORY[0x24BEE3FF0];
        *(_DWORD *)(v8 + 72) = v19;
        sub_214690584();
        sub_2146904E8();

        swift_bridgeObjectRelease();
        v10 = sub_21468C3CC();
        if (v10 >> 62)
        {
          v20 = sub_2146905CC();
          if (!v20)
            goto LABEL_9;
        }
        else
        {
          v20 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (!v20)
            goto LABEL_9;
        }
        type metadata accessor for TelemetryEvent(0);
        if (v20 < 1)
          goto LABEL_36;
        v8 = 0;
        v46 = v10 & 0xC000000000000001;
        v47 = v10;
        do
        {
          if (v46)
            v21 = (id)MEMORY[0x2199D3684](v8, v10);
          else
            v21 = *(id *)(v10 + 8 * v8 + 32);
          ++v8;
          v22 = v21;
          v23 = v48;
          v24 = v43;
          sub_21468C4D4(v22, v23, v43);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC70);
          v25 = sub_214690314();
          v26 = *(_QWORD *)(v25 - 8);
          v27 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
          v28 = swift_allocObject();
          *(_OWORD *)(v28 + 16) = v42;
          (*(void (**)(unint64_t, _QWORD, uint64_t))(v26 + 104))(v28 + v27, v41, v25);
          sub_21467F2D8(&qword_254D7EC78, type metadata accessor for NetworkEventData, (uint64_t)&unk_214691A38);
          sub_2146902D8();
          swift_bridgeObjectRelease();
          sub_214688398(v24);
          sub_21467F2D8(&qword_254D7EC80, type metadata accessor for TelemetryEvent, (uint64_t)&unk_214691A00);
          memset(v49, 0, 32);
          sub_2146902E4();

          sub_21468CD90((uint64_t)v49);
          v10 = v47;
        }
        while (v20 != v8);
LABEL_9:

        swift_bridgeObjectRelease();
        v7 = v34;
        v10 = (unint64_t)v39;
        v5 = v35;
        v6 = (void **)MEMORY[0x24BE6C658];
        if (v39 == v34)
        {

          swift_bridgeObjectRelease();
          return;
        }
      }
    }
  }

  swift_bridgeObjectRelease();
}

void sub_21468BCE8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = (void *)*MEMORY[0x24BE6C658];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC28);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_214691460;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_21468AE78();
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  v8 = v6;
  swift_bridgeObjectRetain();
  sub_214690584();
  sub_2146904E8();

  swift_bridgeObjectRelease();
  dispatch_group_leave(a3);
}

uint64_t sub_21468BDB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t result;

  v6 = (void *)*MEMORY[0x24BE6C658];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC28);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_214691460;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_21468AE78();
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  v8 = v6;
  swift_bridgeObjectRetain();
  sub_214690584();
  sub_2146904E8();

  result = swift_bridgeObjectRelease();
  if (a3)
    return a3(result);
  return result;
}

uint64_t sub_21468BE88()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_21468BEBC()
{
  uint64_t v0;

  return sub_21468BDB4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32));
}

uint64_t sub_21468BEC8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
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

uint64_t sub_21468BF0C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_21468BF1C(uint64_t a1, unint64_t a2)
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

uint64_t sub_21468BF60()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21468BF84(uint64_t a1)
{
  return sub_21468AEBC(a1);
}

void sub_21468BFA4(uint64_t a1)
{
  sub_21468B644(a1);
}

uint64_t sub_21468BFC4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_21468BFF0()
{
  uint64_t v0;

  sub_21468BCE8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(NSObject **)(v0 + 32));
}

id TelemetryUploader.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TelemetryUploader.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TelemetryUploader.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TelemetryUploader()
{
  return objc_opt_self();
}

uint64_t method lookup function for TelemetryUploader()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_21468C1A8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21468C1B8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21468C1DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_21468C1E8(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = objc_msgSend(v1, sel_deviceModel);
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v4;
  v6 = sub_214690524();
  v8 = v7;

  v9 = sub_21468C78C();
  v10 = objc_msgSend(v2, sel_osInstallVariant);
  v11 = objc_msgSend(v2, sel_osVersion);
  if (!v11)
  {
LABEL_8:
    __break(1u);
    return;
  }
  v12 = v11;
  if (v10 == 2)
    v13 = 2;
  else
    v13 = v10 == 1;
  v14 = sub_214690524();
  v16 = v15;

  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 17) = v13;
  *(_QWORD *)(a1 + 24) = v14;
  *(_QWORD *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
}

void sub_21468C2CC(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = objc_msgSend(v1, sel_languageCode);
  if (v4)
  {
    v5 = v4;
    v6 = sub_214690524();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = objc_msgSend(v2, sel_countryCode);
  if (v9)
  {
    v10 = v9;
    v11 = sub_214690524();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = v13;
  *(_BYTE *)(a1 + 40) = 0;
  strcpy((char *)(a1 + 48), "com.apple.news");
  *(_BYTE *)(a1 + 63) = -18;
  v14 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 64) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 72) = v14;
  *(_QWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 92) = 2;
  *(_BYTE *)(a1 + 94) = 3;
}

uint64_t sub_21468C3CC()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  v1 = objc_msgSend(v0, sel_successes);
  if (v1)
  {
    v2 = v1;
    sub_21468CDD0(0, &qword_254D7EC90);
    sub_214690554();

  }
  swift_bridgeObjectRelease();
  v3 = MEMORY[0x24BEE4AF8];
  v4 = objc_msgSend(v0, sel_failures);
  if (v4)
  {
    v5 = v4;
    sub_21468CDD0(0, &qword_254D7EC90);
    sub_214690554();

  }
  swift_bridgeObjectRelease();
  sub_21468C92C(MEMORY[0x24BEE4AF8]);
  return v3;
}

int *sub_21468C4D4@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  int *result;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  int v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v6 = sub_214690254();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_startTime);
  sub_21469023C();
  v10 = objc_msgSend(a1, sel_dnsDuration);
  v11 = objc_msgSend(a1, sel_connectDuration);
  v12 = objc_msgSend(a1, sel_requestDuration);
  v31 = objc_msgSend(a1, sel_responseDuration);
  v30 = objc_msgSend(a1, sel_responseSize);
  v13 = objc_msgSend(a1, sel_cacheState);
  v29 = objc_msgSend(a1, sel_httpStatusCode);
  v28 = objc_msgSend(a1, sel_errorCode);
  v27 = sub_21468C8EC(a2);
  v26 = objc_msgSend(a2, sel_wifiReachabilityStatus);
  v14 = objc_msgSend(a2, sel_cellularRadioAccessTechnology) - 1;
  v33 = v11;
  v34 = v10;
  v32 = v12;
  v15 = v6;
  if (v14 > 0xC)
    v25 = 0;
  else
    v25 = byte_214692A3A[v14];
  v16 = objc_msgSend(a2, sel_respondingPop);
  if (v16)
  {
    v17 = v16;
    v18 = sub_214690524();
    v20 = v19;

  }
  else
  {

    v18 = 0;
    v20 = 0xE000000000000000;
  }

  if (v13 == 2)
    v21 = 2;
  else
    v21 = v13 == 1;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v15);
  result = (int *)type metadata accessor for NetworkEventData(0);
  *(_QWORD *)(a3 + result[5]) = v34;
  *(_QWORD *)(a3 + result[6]) = v33;
  *(_QWORD *)(a3 + result[7]) = v32;
  *(_QWORD *)(a3 + result[8]) = v31;
  *(_QWORD *)(a3 + result[9]) = v30;
  *(_BYTE *)(a3 + result[10]) = v21;
  *(_QWORD *)(a3 + result[11]) = v29;
  *(_QWORD *)(a3 + result[12]) = v28;
  *(_BYTE *)(a3 + result[13]) = v27;
  *(_BYTE *)(a3 + result[14]) = v26;
  *(_BYTE *)(a3 + result[15]) = v25;
  v23 = (uint64_t *)(a3 + result[16]);
  *v23 = v18;
  v23[1] = v20;
  *(_BYTE *)(a3 + result[17]) = 0;
  return result;
}

uint64_t sub_21468C78C()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v0 = (id)NFSystemName();
  if (!v0)
    return 0;
  v1 = v0;
  v2 = sub_214690524();
  v4 = v3;

  if (v2 == 5459817 && v4 == 0xE300000000000000 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 0x534F64615069 && v4 == 0xE600000000000000 || (sub_2146906BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  if (v2 == 0x534F63616DLL && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  v6 = sub_2146906BC();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 3;
  else
    return 0;
}

uint64_t sub_21468C8EC(void *a1)
{
  unsigned int v1;

  v1 = objc_msgSend(a1, sel_eventType) - 1;
  if (v1 > 0x11)
    return 0;
  else
    return byte_214692A47[v1];
}

uint64_t sub_21468C92C(unint64_t a1)
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
    v3 = sub_2146905CC();
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
    v5 = sub_2146905CC();
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
    v4 = MEMORY[0x2199D3690](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_21468CAE4(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_2146905CC();
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
    return sub_21469056C();
  }
  __break(1u);
  return result;
}

uint64_t sub_21468CAE4(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2146905CC();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_2146905CC();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21468CE08(&qword_254D7ECA0, &qword_254D7EC98, MEMORY[0x24BEE12E0]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC98);
            v10 = sub_21468CC9C(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_21468CDD0(0, &qword_254D7EC90);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_21468CC9C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_21468CD1C(v6, a2, a3);
  return sub_21468CCF0;
}

void sub_21468CCF0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21468CD1C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2199D3684](a2, a3);
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
    return sub_21468CD88;
  }
  __break(1u);
  return result;
}

void sub_21468CD88(id *a1)
{

}

uint64_t sub_21468CD90(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D7EC88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21468CDD0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21468CE08(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199D3C30](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21468CE48()
{
  unint64_t result;

  result = qword_254D7ECD0;
  if (!qword_254D7ECD0)
  {
    result = MEMORY[0x2199D3C30](&unk_2146919C0, &type metadata for AppData);
    atomic_store(result, (unint64_t *)&qword_254D7ECD0);
  }
  return result;
}

unint64_t sub_21468CE8C()
{
  unint64_t result;

  result = qword_254D7ECD8;
  if (!qword_254D7ECD8)
  {
    result = MEMORY[0x2199D3C30](&unk_214691980, &type metadata for ContentEnvironmentData);
    atomic_store(result, (unint64_t *)&qword_254D7ECD8);
  }
  return result;
}

unint64_t sub_21468CED0()
{
  unint64_t result;

  result = qword_254D7ECE0;
  if (!qword_254D7ECE0)
  {
    result = MEMORY[0x2199D3C30](&unk_214691940, &type metadata for DeviceData);
    atomic_store(result, (unint64_t *)&qword_254D7ECE0);
  }
  return result;
}

unint64_t sub_21468CF14()
{
  unint64_t result;

  result = qword_254D7ECE8;
  if (!qword_254D7ECE8)
  {
    result = MEMORY[0x2199D3C30](&unk_214691900, &type metadata for SessionData);
    atomic_store(result, (unint64_t *)&qword_254D7ECE8);
  }
  return result;
}

unint64_t sub_21468CF58()
{
  unint64_t result;

  result = qword_254D7ECF0;
  if (!qword_254D7ECF0)
  {
    result = MEMORY[0x2199D3C30](&unk_2146918C0, &type metadata for UserData);
    atomic_store(result, (unint64_t *)&qword_254D7ECF0);
  }
  return result;
}

void NDAnalyticsEnvelopeSubmissionDatesByContentType_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEnvelopeContentTypesFromEntries_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"stringRepresentations", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEntryDeliveryWindowEarlierDate_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypeConfig", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEntryDeliveryWindowEarlierDate_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSubmissionDate", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEntryDeliveryWindow_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypeConfig", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEntryDeliveryWindow_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSubmissionDate", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEntryCanBeUploaded_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypeConfig", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEntryCanBeUploaded_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"targetDate", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void NDAnalyticsEntryCanBeUploaded_cold_3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSubmissionDate", v6, 2u);

  OUTLINED_FUNCTION_3();
}

uint64_t sub_214690200()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21469020C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_214690218()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_214690224()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_214690230()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21469023C()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_214690248()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_214690254()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_214690260()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21469026C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_214690278()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_214690284()
{
  return MEMORY[0x24BE03B00]();
}

uint64_t sub_214690290()
{
  return MEMORY[0x24BE03B08]();
}

uint64_t sub_21469029C()
{
  return MEMORY[0x24BE03B10]();
}

uint64_t sub_2146902A8()
{
  return MEMORY[0x24BE03B18]();
}

uint64_t sub_2146902B4()
{
  return MEMORY[0x24BE03B20]();
}

uint64_t sub_2146902C0()
{
  return MEMORY[0x24BE03B28]();
}

uint64_t sub_2146902CC()
{
  return MEMORY[0x24BE03B40]();
}

uint64_t sub_2146902D8()
{
  return MEMORY[0x24BE03B60]();
}

uint64_t sub_2146902E4()
{
  return MEMORY[0x24BE03B68]();
}

uint64_t sub_2146902F0()
{
  return MEMORY[0x24BE03B88]();
}

uint64_t sub_2146902FC()
{
  return MEMORY[0x24BE03B90]();
}

uint64_t sub_214690308()
{
  return MEMORY[0x24BE03BA0]();
}

uint64_t sub_214690314()
{
  return MEMORY[0x24BE03BC0]();
}

uint64_t sub_214690320()
{
  return MEMORY[0x24BE03BD0]();
}

uint64_t sub_21469032C()
{
  return MEMORY[0x24BE03BD8]();
}

uint64_t sub_214690338()
{
  return MEMORY[0x24BE03BE0]();
}

uint64_t sub_214690344()
{
  return MEMORY[0x24BE03BE8]();
}

uint64_t sub_214690350()
{
  return MEMORY[0x24BE03BF0]();
}

uint64_t sub_21469035C()
{
  return MEMORY[0x24BE03BF8]();
}

uint64_t sub_214690368()
{
  return MEMORY[0x24BE03C00]();
}

uint64_t sub_214690374()
{
  return MEMORY[0x24BE03C18]();
}

uint64_t sub_214690380()
{
  return MEMORY[0x24BE03C30]();
}

uint64_t sub_21469038C()
{
  return MEMORY[0x24BE03C38]();
}

uint64_t sub_214690398()
{
  return MEMORY[0x24BE03C58]();
}

uint64_t sub_2146903A4()
{
  return MEMORY[0x24BE03C78]();
}

uint64_t sub_2146903B0()
{
  return MEMORY[0x24BE03C80]();
}

uint64_t sub_2146903BC()
{
  return MEMORY[0x24BE03C88]();
}

uint64_t sub_2146903C8()
{
  return MEMORY[0x24BE03C90]();
}

uint64_t sub_2146903D4()
{
  return MEMORY[0x24BE03CA8]();
}

uint64_t sub_2146903E0()
{
  return MEMORY[0x24BE03CB8]();
}

uint64_t sub_2146903EC()
{
  return MEMORY[0x24BE03CC0]();
}

uint64_t sub_2146903F8()
{
  return MEMORY[0x24BE03CC8]();
}

uint64_t sub_214690404()
{
  return MEMORY[0x24BE03CD0]();
}

uint64_t sub_214690410()
{
  return MEMORY[0x24BE03CD8]();
}

uint64_t sub_21469041C()
{
  return MEMORY[0x24BE03CE0]();
}

uint64_t sub_214690428()
{
  return MEMORY[0x24BE03CF0]();
}

uint64_t sub_214690434()
{
  return MEMORY[0x24BE03D00]();
}

uint64_t sub_214690440()
{
  return MEMORY[0x24BE03D20]();
}

uint64_t sub_21469044C()
{
  return MEMORY[0x24BE03D28]();
}

uint64_t sub_214690458()
{
  return MEMORY[0x24BE03D30]();
}

uint64_t sub_214690464()
{
  return MEMORY[0x24BE03D38]();
}

uint64_t sub_214690470()
{
  return MEMORY[0x24BE03D48]();
}

uint64_t sub_21469047C()
{
  return MEMORY[0x24BE03D50]();
}

uint64_t sub_214690488()
{
  return MEMORY[0x24BEB42F0]();
}

uint64_t sub_214690494()
{
  return MEMORY[0x24BEB43A8]();
}

uint64_t sub_2146904A0()
{
  return MEMORY[0x24BEB43B0]();
}

uint64_t sub_2146904AC()
{
  return MEMORY[0x24BEB4430]();
}

uint64_t sub_2146904B8()
{
  return MEMORY[0x24BEB4438]();
}

uint64_t sub_2146904C4()
{
  return MEMORY[0x24BEB4558]();
}

uint64_t sub_2146904D0()
{
  return MEMORY[0x24BEB4560]();
}

uint64_t sub_2146904DC()
{
  return MEMORY[0x24BEB4568]();
}

uint64_t sub_2146904E8()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2146904F4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_214690500()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21469050C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_214690518()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_214690524()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_214690530()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21469053C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_214690548()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_214690554()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_214690560()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21469056C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_214690578()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_214690584()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_214690590()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_21469059C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2146905A8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2146905B4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2146905C0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2146905CC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2146905D8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2146905E4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2146905F0()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_2146905FC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_214690608()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_214690614()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_214690620()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_21469062C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_214690638()
{
  return MEMORY[0x24BEE3398]();
}

uint64_t sub_214690644()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_214690650()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21469065C()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_214690668()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_214690674()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_214690680()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_21469068C()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_214690698()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2146906A4()
{
  return MEMORY[0x24BEE34E8]();
}

uint64_t sub_2146906B0()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_2146906BC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2146906C8()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_2146906D4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2146906E0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2146906EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2146906F8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_214690704()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_214690710()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21469071C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t FCDefaultsReadEndpointEnvironment()
{
  return MEMORY[0x24BE6C970]();
}

uint64_t FCDeviceIdentifierForVendor()
{
  return MEMORY[0x24BE6C978]();
}

uint64_t FCDispatchGroupIsEmpty()
{
  return MEMORY[0x24BE6C980]();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return MEMORY[0x24BE6C990]();
}

uint64_t FCDynamicCast()
{
  return MEMORY[0x24BE6C998]();
}

uint64_t FCURLForFeldsparUserAccountHomeDirectory()
{
  return MEMORY[0x24BE6CA50]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x24BE6CF48]();
}

uint64_t NFSystemName()
{
  return MEMORY[0x24BE6CF50]();
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x24BE6CA90]();
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

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

