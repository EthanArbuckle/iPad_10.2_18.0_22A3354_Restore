void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t protocol witness for ViewUpdateGenerationRunner.update(viewName:requests:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t protocol witness for ViewUpdateGenerationRunner.update(viewName:requests:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = protocol witness for ViewUpdateGenerationRunner.update(viewName:requests:) in conformance ComputeOrchestration.ViewRunner;
  v9[5] = a3;
  v9[6] = v8;
  v9[3] = a1;
  v9[4] = a2;
  return swift_task_switch();
}

uint64_t @objc ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, char a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  Swift::String v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t result;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  if (a4)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  swift_retain();
  static ViewOrchestrationSystem.sourceUpdater(config:)();
  v15._countAndFlagsBits = specialized ComputeOrchestration.EventReporter.annotatedStreamIdentifier(streamIdentifier:remoteName:)(v9, v11, v12, v14);
  ViewUpdate.SourceUpdater.streamUpdated(streamName:isDelete:)(v15, a6 & 1);
  if (v16)
  {
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a5)
    {
      v17 = (void *)_convertErrorToNSError(_:)();

      v18 = v17;
      result = 0;
      *a5 = v17;
    }
    else
    {

      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
  return result;
}

uint64_t specialized ComputeOrchestration.EventReporter.annotatedStreamIdentifier(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  Swift::String v7;
  Swift::String v8;

  v4 = a1;
  if (a4)
  {
    swift_bridgeObjectRetain();
    v7._countAndFlagsBits = 0x7365746F6D65723ALL;
    v7._object = (void *)0xE90000000000003ALL;
    String.append(_:)(v7);
    v8._countAndFlagsBits = a3;
    v8._object = a4;
    String.append(_:)(v8);
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t ComputeOrchestration.ViewRunner.update(viewName:requests:)()
{
  return ComputeOrchestration.ViewRunner.fullRebuild(viewName:requests:)();
}

uint64_t type metadata accessor for GDViewUpdateSourceRequest(uint64_t a1, unint64_t *a2)
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

void sub_23FE07564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

id GDCLog()
{
  if (GDCLog_onceToken != -1)
    dispatch_once(&GDCLog_onceToken, &__block_literal_global_0);
  return (id)GDCLog_log;
}

void sub_23FE07650(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23FE07780(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_23FE07D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_23FE08048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_23FE08314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_23FE08568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t ComputeOrchestration.ViewRunner.update(viewName:requests:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t ComputeOrchestration.ViewRunner.update(groupName:namesAndRequests:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t ComputeOrchestration.ViewRunner.update(groupName:namesAndRequests:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  Class isa;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v9;

  v1 = *(void **)(*(_QWORD *)(v0 + 48) + 16);
  v2 = (void *)MEMORY[0x24267A504](*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateNameAndRequests);
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 16) = 0;
  v4 = objc_msgSend(v1, sel_updateGroupWithName_namesAndRequests_error_, v2, isa, v0 + 16);

  v5 = *(void **)(v0 + 16);
  if (v4)
  {
    type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateNameAndResponses);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v5;

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
  }
  else
  {
    v9 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t ComputeOrchestration.ViewRunner.fullRebuild(viewName:requests:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t ComputeOrchestration.ViewRunner.fullRebuild(viewName:requests:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  Class isa;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v9;

  v1 = *(void **)(*(_QWORD *)(v0 + 48) + 16);
  v2 = (void *)MEMORY[0x24267A504](*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateSourceRequest);
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 16) = 0;
  v4 = objc_msgSend(v1, sel_updateViewWithName_viewUpdateSourceRequests_error_, v2, isa, v0 + 16);

  v5 = *(void **)(v0 + 16);
  if (v4)
  {
    type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateSourceResponse);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v5;

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
  }
  else
  {
    v9 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t ComputeOrchestration.ViewRunner.clear(viewName:fullRebuild:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = v3;
  *(_BYTE *)(v4 + 48) = a3;
  *(_QWORD *)(v4 + 24) = a1;
  return swift_task_switch();
}

uint64_t ComputeOrchestration.ViewRunner.clear(viewName:fullRebuild:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t (*v6)(void);
  id v7;
  uint64_t (*v9)(void);

  v1 = *(unsigned __int8 *)(v0 + 48);
  v2 = *(void **)(*(_QWORD *)(v0 + 40) + 16);
  v3 = (void *)MEMORY[0x24267A504](*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  *(_QWORD *)(v0 + 16) = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_clearViewWithName_fullRebuild_error_, v3, v1, v0 + 16);

  v4 = *(void **)(v0 + 16);
  if ((_DWORD)v2)
  {
    v9 = *(uint64_t (**)(void))(v0 + 8);
    v5 = v4;
    v6 = v9;
  }
  else
  {
    v7 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t ComputeOrchestration.ViewRunner.truncate(viewName:fullRebuild:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = v3;
  *(_BYTE *)(v4 + 48) = a3;
  *(_QWORD *)(v4 + 24) = a1;
  return swift_task_switch();
}

uint64_t ComputeOrchestration.ViewRunner.truncate(viewName:fullRebuild:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t (*v6)(void);
  id v7;
  uint64_t (*v9)(void);

  v1 = *(unsigned __int8 *)(v0 + 48);
  v2 = *(void **)(*(_QWORD *)(v0 + 40) + 16);
  v3 = (void *)MEMORY[0x24267A504](*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  *(_QWORD *)(v0 + 16) = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_truncateViewWithName_fullRebuild_error_, v3, v1, v0 + 16);

  v4 = *(void **)(v0 + 16);
  if ((_DWORD)v2)
  {
    v9 = *(uint64_t (**)(void))(v0 + 8);
    v5 = v4;
    v6 = v9;
  }
  else
  {
    v7 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t ComputeOrchestration.ViewRunner.stop()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

{
  _QWORD *v0;
  void *v1;
  unsigned int v2;
  void *v3;
  id v4;
  uint64_t (*v5)(void);
  id v6;
  uint64_t (*v8)(void);

  v1 = *(void **)(v0[3] + 16);
  v0[2] = 0;
  v2 = objc_msgSend(v1, sel_stopWithError_, v0 + 2);
  v3 = (void *)v0[2];
  if (v2)
  {
    v8 = (uint64_t (*)(void))v0[1];
    v4 = v3;
    v5 = v8;
  }
  else
  {
    v6 = v3;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v5 = (uint64_t (*)(void))v0[1];
  }
  return v5();
}

uint64_t ComputeOrchestration.ViewRunner.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ComputeOrchestration.ViewRunner.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t protocol witness for ViewUpdateGenerationRunner.update(groupName:namesAndRequests:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = protocol witness for ViewUpdateGenerationRunner.update(groupName:namesAndRequests:) in conformance ComputeOrchestration.ViewRunner;
  v9[5] = a3;
  v9[6] = v8;
  v9[3] = a1;
  v9[4] = a2;
  return swift_task_switch();
}

uint64_t protocol witness for ViewUpdateGenerationRunner.clear(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *v3;
  v9 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *(_QWORD *)v9 = v4;
  *(_QWORD *)(v9 + 8) = protocol witness for ViewUpdateGenerationRunner.truncate(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner;
  *(_QWORD *)(v9 + 32) = a2;
  *(_QWORD *)(v9 + 40) = v8;
  *(_BYTE *)(v9 + 48) = a3;
  *(_QWORD *)(v9 + 24) = a1;
  return swift_task_switch();
}

uint64_t protocol witness for ViewUpdateGenerationRunner.truncate(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *v3;
  v9 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *(_QWORD *)v9 = v4;
  *(_QWORD *)(v9 + 8) = protocol witness for ViewUpdateGenerationRunner.truncate(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner;
  *(_QWORD *)(v9 + 32) = a2;
  *(_QWORD *)(v9 + 40) = v8;
  *(_BYTE *)(v9 + 48) = a3;
  *(_QWORD *)(v9 + 24) = a1;
  return swift_task_switch();
}

uint64_t protocol witness for ViewUpdateGenerationRunner.stop() in conformance ComputeOrchestration.ViewRunner()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = protocol witness for ViewUpdateGenerationRunner.stop() in conformance ComputeOrchestration.ViewRunner;
  v3[3] = v2;
  return swift_task_switch();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id ComputeOrchestration.ViewRunnerProvider.runner(for:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v6;

  v6 = *(id *)(v1 + 16);
  v3 = type metadata accessor for ComputeOrchestration.ViewRunner();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v6;
  a1[3] = v3;
  a1[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner, type metadata accessor for ComputeOrchestration.ViewRunner, (uint64_t)&protocol conformance descriptor for ComputeOrchestration.ViewRunner);
  *a1 = v4;
  return v6;
}

uint64_t type metadata accessor for ComputeOrchestration.ViewRunner()
{
  return objc_opt_self();
}

id protocol witness for ViewUpdateGenerationRunnerProvider.runner(for:) in conformance ComputeOrchestration.ViewRunnerProvider@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(void **)(*(_QWORD *)v1 + 16);
  v4 = type metadata accessor for ComputeOrchestration.ViewRunner();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v3;
  a1[3] = v4;
  a1[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner, type metadata accessor for ComputeOrchestration.ViewRunner, (uint64_t)&protocol conformance descriptor for ComputeOrchestration.ViewRunner);
  *a1 = v5;
  return v3;
}

id ComputeOrchestration.NullEventReporter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t ComputeOrchestration.EventReporterProvider.GuardedData.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t closure #1 in ComputeOrchestration.EventReporterProvider.eventReporter()@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v13[5];

  v3 = *a1;
  if ((*(_BYTE *)(*a1 + 16) & 1) == 0 && (objc_msgSend((id)objc_opt_self(), sel_isClassCLocked) & 1) == 0)
  {
    v4 = type metadata accessor for ComputeOrchestration.ViewRunnerProvider();
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = objc_msgSend(objc_allocWithZone((Class)GDCComputeService), sel_init);
    v6 = type metadata accessor for Configuration();
    v7 = *(_QWORD *)(v6 - 8);
    MEMORY[0x24BDAC7A8]();
    v9 = (char *)&v13[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13[3] = v4;
    v13[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunnerProvider and conformance ComputeOrchestration.ViewRunnerProvider, type metadata accessor for ComputeOrchestration.ViewRunnerProvider, (uint64_t)&protocol conformance descriptor for ComputeOrchestration.ViewRunnerProvider);
    v13[0] = v5;
    static ViewOrchestrationSystem.start(viewUpdateRunnerProvider:)();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
    type metadata accessor for ComputeOrchestration.EventReporter();
    v10 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v10 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config, v9, v6);
    *(_QWORD *)(v3 + 24) = v10;
    swift_unknownObjectRelease();
    *(_BYTE *)(v3 + 16) = 1;
  }
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_unknownObjectRetain();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
  ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(streamIdentifier._countAndFlagsBits, (uint64_t)streamIdentifier._object, remoteName.value._countAndFlagsBits, remoteName.value._object, 0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.EventReporter.streamPruned(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
  ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(streamIdentifier._countAndFlagsBits, (uint64_t)streamIdentifier._object, remoteName.value._countAndFlagsBits, remoteName.value._object, 0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.EventReporter.streamDeletion(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
  ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(streamIdentifier._countAndFlagsBits, (uint64_t)streamIdentifier._object, remoteName.value._countAndFlagsBits, remoteName.value._object, 1);
}

uint64_t ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  uint64_t v5;
  uint64_t result;
  Swift::String v12;

  result = static ViewOrchestrationSystem.sourceUpdater(config:)();
  if (!v5)
  {
    v12._countAndFlagsBits = specialized ComputeOrchestration.EventReporter.annotatedStreamIdentifier(streamIdentifier:remoteName:)(a1, a2, a3, a4);
    ViewUpdate.SourceUpdater.streamUpdated(streamName:isDelete:)(v12, a5 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ComputeOrchestration.EventReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config;
  v2 = type metadata accessor for Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ComputeOrchestration.EventReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config;
  v2 = type metadata accessor for Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
  specialized ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(streamIdentifier._countAndFlagsBits, (unint64_t)streamIdentifier._object, "NullEventReporter: streamUpdated: %s dropped");
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.NullEventReporter.streamPruned(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
  specialized ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(streamIdentifier._countAndFlagsBits, (unint64_t)streamIdentifier._object, "NullEventReporter: streamPruned: %s dropped");
}

uint64_t @objc ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a1;
  specialized ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(v9, v11, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.NullEventReporter.streamDeletion(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
  specialized ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(streamIdentifier._countAndFlagsBits, (unint64_t)streamIdentifier._object, "NullEventReporter: streamDeletion: %s dropped");
}

uint64_t @objc ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, SEL *a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  if (a4)
  {
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v12;
  }
  else
  {
    v11 = 0;
  }
  swift_retain();
  ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)(v8, v10, v11, a4, a6);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return 1;
}

id ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, SEL *a5)
{
  id v10;
  void *v11;
  unsigned int v12;
  id v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BMViewEventReporter & Sendable);
  UnfairLockedBox.access<A>(_:)();
  v10 = v15[0];
  v11 = (void *)MEMORY[0x24267A504](a1, a2);
  if (a4)
    a4 = (void *)MEMORY[0x24267A504](a3, a4);
  v15[0] = 0;
  v12 = objc_msgSend(v10, *a5, v11, a4, v15);
  swift_unknownObjectRelease();

  if (v12)
    return v15[0];
  v14 = v15[0];
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

uint64_t ComputeOrchestration.EventReporterProvider.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

id ComputeOrchestration.NullEventReporter.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id @objc ComputeOrchestration.NullEventReporter.init()(void *a1)
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ComputeOrchestration.NullEventReporter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = type metadata accessor for Logger();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)();
  swift_bridgeObjectRetain_n();
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v18 = a3;
    v13 = swift_slowAlloc();
    v19 = v7;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    v20 = v3;
    v16 = v15;
    v22 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v21 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23FE05000, v11, v12, v18, v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24267A918](v16, -1, -1);
    MEMORY[0x24267A918](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

id specialized static ComputeOrchestration.start()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD v18[5];

  if (MEMORY[0x24BE58570])
  {
    if ((objc_msgSend((id)objc_opt_self(), sel_isClassCLocked) & 1) != 0)
    {
      type metadata accessor for ComputeOrchestration.WrappedEventReporter();
      v0 = swift_allocObject();
      type metadata accessor for ComputeOrchestration.EventReporterProvider();
      v1 = swift_allocObject();
      type metadata accessor for ComputeOrchestration.EventReporterProvider.GuardedData();
      v2 = swift_allocObject();
      *(_BYTE *)(v2 + 16) = 0;
      *(_QWORD *)(v2 + 24) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComputeOrchestration.NullEventReporter()), sel_init);
      v18[0] = v2;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnfairLockedBox<ComputeOrchestration.EventReporterProvider.GuardedData>);
      swift_allocObject();
      *(_QWORD *)(v1 + 16) = UnfairLockedBox.init(contents:)();
      *(_QWORD *)(v0 + 16) = v1;
    }
    else
    {
      v10 = type metadata accessor for ComputeOrchestration.ViewRunnerProvider();
      v11 = swift_allocObject();
      *(_QWORD *)(v11 + 16) = objc_msgSend(objc_allocWithZone((Class)GDCComputeService), sel_init);
      v12 = type metadata accessor for Configuration();
      v13 = *(_QWORD *)(v12 - 8);
      MEMORY[0x24BDAC7A8]();
      v15 = (char *)&v18[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18[3] = v10;
      v18[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunnerProvider and conformance ComputeOrchestration.ViewRunnerProvider, type metadata accessor for ComputeOrchestration.ViewRunnerProvider, (uint64_t)&protocol conformance descriptor for ComputeOrchestration.ViewRunnerProvider);
      v18[0] = v11;
      static ViewOrchestrationSystem.start(viewUpdateRunnerProvider:)();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
      type metadata accessor for ComputeOrchestration.EventReporter();
      v0 = swift_allocObject();
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v0 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config, v15, v12);
    }
  }
  else
  {
    v3 = type metadata accessor for Logger();
    v4 = *(_QWORD *)(v3 - 8);
    MEMORY[0x24BDAC7A8]();
    v6 = (char *)&v18[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    Logger.init(subsystem:category:)();
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23FE05000, v7, v8, "Failed to locate the IntelligencePlatformCore framework. The view system will not start up. This is unexpected on non-factory images", v9, 2u);
      MEMORY[0x24267A918](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComputeOrchestration.NullEventReporter()), sel_init);
  }
  return (id)v0;
}

uint64_t type metadata accessor for ComputeOrchestration()
{
  return objc_opt_self();
}

uint64_t method lookup function for ComputeOrchestration.ViewRunner()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for ComputeOrchestration.ViewRunnerProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for ComputeOrchestration.ViewRunnerProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for ComputeOrchestration.EventReporterProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ComputeOrchestration.EventReporterProvider.GuardedData()
{
  return objc_opt_self();
}

uint64_t ObjC metadata update function for ComputeOrchestration.EventReporter()
{
  return type metadata accessor for ComputeOrchestration.EventReporter();
}

uint64_t type metadata accessor for ComputeOrchestration.EventReporter()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ComputeOrchestration.EventReporter;
  if (!type metadata singleton initialization cache for ComputeOrchestration.EventReporter)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for ComputeOrchestration.EventReporter()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Configuration();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ComputeOrchestration.EventReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for ComputeOrchestration.NullEventReporter()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ComputeOrchestration.WrappedEventReporter()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24267A8C4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x24267A8D0](a3, v6);
    atomic_store(result, a1);
  }
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2E8]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD300]();
}

uint64_t UnfairLockedBox.access<A>(_:)()
{
  return MEMORY[0x24BE58218]();
}

uint64_t UnfairLockedBox.init(contents:)()
{
  return MEMORY[0x24BE58220]();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ViewUpdate.SourceUpdater.streamUpdated(streamName:isDelete:)(Swift::String streamName, Swift::Bool isDelete)
{
  MEMORY[0x24BE58568](streamName._countAndFlagsBits, streamName._object, isDelete);
}

uint64_t type metadata accessor for Configuration()
{
  return MEMORY[0x24BE58578]();
}

uint64_t static ViewOrchestrationSystem.sourceUpdater(config:)()
{
  return MEMORY[0x24BE58588]();
}

uint64_t static ViewOrchestrationSystem.start(viewUpdateRunnerProvider:)()
{
  return MEMORY[0x24BE58590]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBD0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

