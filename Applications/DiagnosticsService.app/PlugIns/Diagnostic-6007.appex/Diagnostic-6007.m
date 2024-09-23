id sub_1000040B4()
{
  id result;

  result = (id)DiagnosticLogHandleForCategory(3);
  qword_10000CE00 = (uint64_t)result;
  return result;
}

void sub_1000040DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder);
  *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder) = a2;
  swift_unknownObjectRetain(a2);
  swift_unknownObjectRelease(v4);
  if (a1
    && (v5 = type metadata accessor for OnDemandAudioDiagnosticTriggerInputs(),
        (v6 = swift_dynamicCastClass(a1, v5)) != 0))
  {
    v7 = *(id *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs);
    *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs) = v6;
    swift_unknownObjectRetain(a1);

  }
  else
  {
    sub_100004DF0(4);
  }
}

void sub_1000041F0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  Class isa;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void **aBlock;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v46 = *(_QWORD *)(v6 - 8);
  v47 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchTime(0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v16 = (char *)&v42 - v15;
  v17 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder;
  v18 = *(void **)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder];
  if (!v18)
  {
    __break(1u);
    goto LABEL_9;
  }
  v19 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs;
  v20 = *(_QWORD *)&v1[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs];
  if (!v20)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v44 = v14;
  v45 = v13;
  if ((*(_BYTE *)(v20 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeout + 8) & 1) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v42 = v3;
  v43 = v2;
  swift_unknownObjectRetain(v18);
  isa = UInt._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v18, "allowSessionAccessoryDisconnectForDuration:", isa);
  swift_unknownObjectRelease(v18);

  v22 = *(void **)&v1[v17];
  if (!v22)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v23 = swift_allocObject(&unk_1000084A8, 24, 7);
  *(_QWORD *)(v23 + 16) = v1;
  v52 = sub_10000574C;
  v53 = v23;
  aBlock = _NSConcreteStackBlock;
  v49 = 1107296256;
  v50 = sub_100004D74;
  v51 = &unk_1000084C0;
  v24 = _Block_copy(&aBlock);
  v25 = v53;
  v26 = v1;
  swift_unknownObjectRetain(v22);
  swift_release(v25);
  objc_msgSend(v22, "requestSessionAccessoryIdentifierWithCompletion:", v24);
  _Block_release(v24);
  swift_unknownObjectRelease(v22);
  sub_10000558C();
  v27 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  v28 = *(_QWORD *)&v1[v19];
  if (!v28)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v29 = v28 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout;
  if ((*(_BYTE *)(v29 + 8) & 1) == 0)
  {
    + infix(_:_:)(v12, (double)*(unint64_t *)v29);
    v30 = *(void (**)(char *, uint64_t))(v44 + 8);
    v31 = v12;
    v32 = v45;
    v30(v31, v45);
    v33 = swift_allocObject(&unk_1000084F8, 24, 7);
    *(_QWORD *)(v33 + 16) = v26;
    v52 = sub_100005778;
    v53 = v33;
    aBlock = _NSConcreteStackBlock;
    v49 = 1107296256;
    v50 = sub_100004628;
    v51 = &unk_100008510;
    v34 = _Block_copy(&aBlock);
    v35 = v53;
    v36 = v26;
    v37 = swift_release(v35);
    static DispatchQoS.unspecified.getter(v37);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v38 = sub_100005634();
    v39 = sub_10000567C(&qword_10000CC50);
    v40 = sub_1000056BC();
    v41 = v43;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v39, v40, v43, v38);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v16, v8, v5, v34);
    _Block_release(v34);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v41);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v8, v47);
    v30(v16, v32);
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_1000045A4(uint64_t a1)
{
  uint64_t v1;

  v1 = static os_log_type_t.error.getter(a1);
  if (qword_10000CB90 != -1)
    swift_once(&qword_10000CB90, sub_1000040B4);
  os_log(_:dso:log:_:_:)(v1, &_mh_execute_header, qword_10000CE00, "Timed out waiting for audio diagnostic trigger acknowledgement", 62, 2, &_swiftEmptyArrayStorage);
  sub_100004DF0(1);
}

void sub_100004678(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  os_log_type_t v8;
  NSObject *v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  NSString v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[3];
  char v20[8];
  uint64_t aBlock[5];
  uint64_t v22;

  if (a3)
  {
    swift_getErrorValue(a3, v20, v19);
    v5 = Error.localizedDescription.getter(v19[1], v19[2]);
    v7 = v6;
    v8 = static os_log_type_t.error.getter(v5);
    if (qword_10000CB90 != -1)
      swift_once(&qword_10000CB90, sub_1000040B4);
    v9 = qword_10000CE00;
    if (os_log_type_enabled((os_log_t)qword_10000CE00, v8))
    {
      swift_bridgeObjectRetain(v7);
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = swift_slowAlloc(32, -1);
      aBlock[0] = v11;
      *(_DWORD *)v10 = 136315138;
      swift_bridgeObjectRetain(v7);
      v18 = sub_100005788(v5, v7, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, v19, v10 + 4, v10 + 12);
      swift_bridgeObjectRelease_n(v7, 3);
      _os_log_impl((void *)&_mh_execute_header, v9, v8, "Unable to get UUID for session accessory with error %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease(v7);
    }
    sub_100004DF0(0);
  }
  else
  {
    v12 = *(void **)&a4[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_hearingModeClient];
    v13 = String._bridgeToObjectiveC()();
    v14 = swift_allocObject(&unk_100008548, 24, 7);
    *(_QWORD *)(v14 + 16) = a4;
    aBlock[4] = (uint64_t)sub_100005780;
    v22 = v14;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100004D20;
    aBlock[3] = (uint64_t)&unk_100008560;
    v15 = _Block_copy(aBlock);
    v16 = v22;
    v17 = a4;
    swift_release(v16);
    objc_msgSend(v12, "triggerOnDemandDiagnosticCheckForDeviceIdentifier:completion:", v13, v15);
    _Block_release(v15);

  }
}

void sub_1000048D4(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  os_log_type_t v9;
  __objc2_class_ro *v10;
  NSObject *v11;
  uint8_t *v12;
  void **v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  char *v23;
  uint8_t *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  os_log_type_t v30;
  NSObject *weak_ivar_lyt;
  os_log_type_t v32;
  char *v33;
  uint8_t *v34;
  id v35;
  Class isa;
  uint64_t v37;
  void **aBlock;
  _QWORD v39[4];
  uint64_t v40;
  _QWORD v41[3];
  char v42[8];

  if (!a1)
  {
    sub_100004DF0(3);
    return;
  }
  swift_getErrorValue(a1, v42, v41);
  v4 = v41[1];
  v5 = v41[2];
  swift_errorRetain(a1);
  v6 = Error.localizedDescription.getter(v4, v5);
  v8 = v7;
  v9 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
  if (qword_10000CB90 != -1)
    swift_once(&qword_10000CB90, sub_1000040B4);
  v10 = &OnDemandAudioDiagnosticTriggerController__metaData;
  v11 = qword_10000CE00;
  if (os_log_type_enabled((os_log_t)qword_10000CE00, v9))
  {
    swift_bridgeObjectRetain(v8);
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = (void **)swift_slowAlloc(32, -1);
    aBlock = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain(v8);
    v37 = sub_100005788(v6, v8, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &aBlock, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(v8, 3);
    _os_log_impl((void *)&_mh_execute_header, v11, v9, "On demand diagnostic check trigger failed with error %s.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    v14 = v13;
    v10 = &OnDemandAudioDiagnosticTriggerController__metaData;
    swift_slowDealloc(v14, -1, -1);
    v15 = swift_slowDealloc(v12, -1, -1);
  }
  else
  {
    v15 = swift_bridgeObjectRelease(v8);
  }
  v16 = *(_QWORD *)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs];
  if (!v16)
  {
    __break(1u);
    goto LABEL_20;
  }
  v17 = v16 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCount;
  if ((*(_BYTE *)(v17 + 8) & 1) != 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v18 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount;
  v19 = *(_QWORD *)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount];
  if (v19 >= *(_QWORD *)v17)
  {
    v30 = static os_log_type_t.error.getter(v15);
    weak_ivar_lyt = v10[49].weak_ivar_lyt;
    v32 = v30;
    if (os_log_type_enabled(weak_ivar_lyt, v30))
    {
      v33 = a2;
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v34 = 134217984;
      aBlock = *(void ***)&a2[v18];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v39, v34 + 4, v34 + 12);

      _os_log_impl((void *)&_mh_execute_header, weak_ivar_lyt, v32, "Maximum number or retries reached (%lu). Failing test.", v34, 0xCu);
      swift_slowDealloc(v34, -1, -1);
    }
    v35 = objc_msgSend(a2, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v35, "setStatusCode:", isa);

    goto LABEL_18;
  }
  *(_QWORD *)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount] = v19 + 1;
  v20 = static os_log_type_t.error.getter(v15);
  v21 = v10[49].weak_ivar_lyt;
  v22 = v20;
  if (os_log_type_enabled(v21, v20))
  {
    v23 = a2;
    v24 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v24 = 134217984;
    aBlock = *(void ***)&a2[v18];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v39, v24 + 4, v24 + 12);

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Retrying. Current retry count is now %lu", v24, 0xCu);
    swift_slowDealloc(v24, -1, -1);
  }
  v25 = *(void **)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder];
  if (v25)
  {
    v26 = swift_allocObject(&unk_100008598, 24, 7);
    *(_QWORD *)(v26 + 16) = a2;
    v39[3] = sub_100005E54;
    v40 = v26;
    aBlock = _NSConcreteStackBlock;
    v39[0] = 1107296256;
    v39[1] = sub_100004D74;
    v39[2] = &unk_1000085B0;
    v27 = _Block_copy(&aBlock);
    v28 = v40;
    v29 = a2;
    swift_unknownObjectRetain(v25);
    swift_release(v28);
    objc_msgSend(v25, "requestSessionAccessoryIdentifierWithCompletion:", v27);
    _Block_release(v27);
    swift_unknownObjectRelease(v25);
LABEL_18:
    swift_errorRelease(a1);
    return;
  }
LABEL_21:
  __break(1u);
}

void sub_100004D20(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

void sub_100004D74(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, void *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v8 = v7;
  swift_retain(v4);
  v9 = a3;
  v5(v6, v8, a3);
  swift_release(v4);
  swift_bridgeObjectRelease(v8);

}

void sub_100004DF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[9];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v8[7] = *(_QWORD *)(v2 - 8);
  v8[8] = v2;
  ((void (*)(void))__chkstk_darwin)();
  v8[6] = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v8[4] = *(_QWORD *)(v4 - 8);
  v8[5] = v4;
  ((void (*)(void))__chkstk_darwin)();
  v8[3] = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = type metadata accessor for DispatchTime(0);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v6);
  v7 = type metadata accessor for DispatchQoS.QoSClass(0);
  __chkstk_darwin(v7);
  v8[2] = a1;
  __asm { BR              X10 }
}

uint64_t sub_100004F54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  os_log_type_t v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v9 = static os_log_type_t.error.getter(a1);
  if (*(_QWORD *)(v6 + 2960) != -1)
    swift_once(&qword_10000CB90, sub_1000040B4);
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, qword_10000CE00, "Test ended with failing status code. Clearing request for host to ignore accessory disconnect", 93, 2, &_swiftEmptyArrayStorage);
  v10 = *(void **)(*(_QWORD *)(v8 - 168) + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder);
  if (!v10)
  {
LABEL_13:
    __break(1u);
    JUMPOUT(0x1000052F4);
  }
  v11 = objc_msgSend(v10, "clearAllowSessionAccessoryDisconnect");
  v12 = *(_QWORD *)(*(_QWORD *)(v8 - 168) + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs);
  if (!v12)
  {
    __break(1u);
    goto LABEL_12;
  }
  v13 = v12 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDuration;
  if ((*(_BYTE *)(v13 + 8) & 1) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v14 = *(_QWORD *)v13;
  v15 = ((uint64_t (*)(id))static os_log_type_t.default.getter)(v11);
  if (*(_QWORD *)(v6 + 2960) != -1)
    swift_once(&qword_10000CB90, sub_1000040B4);
  v16 = (double)v14;
  v17 = qword_10000CE00;
  if (os_log_type_enabled((os_log_t)qword_10000CE00, v15))
  {
    v18 = swift_slowAlloc(22, -1);
    *(_DWORD *)v18 = 134218240;
    *(_QWORD *)(v8 - 152) = -2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v8 - 152, v8 - 144, v18 + 4, v18 + 12);
    *(_WORD *)(v18 + 12) = 2048;
    *(double *)(v8 - 152) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v8 - 152, v8 - 144, v18 + 14, v18 + 22);
    _os_log_impl((void *)&_mh_execute_header, v17, v15, "Test finished with status code %ld. Will end test after %f seconds", (uint8_t *)v18, 0x16u);
    swift_slowDealloc(v18, -1, -1);
  }
  sub_10000558C();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v5, enum case for DispatchQoS.QoSClass.default(_:), v2);
  v19 = (void *)((uint64_t (*)(uint64_t))static OS_dispatch_queue.global(qos:))(v5);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v5, v2);
  ((void (*)(uint64_t))static DispatchTime.now())(v20);
  v21 = v4;
  + infix(_:_:)(v7, v16);
  v22 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v8 - 240) = v22;
  v23 = *(_QWORD *)(v8 - 232);
  v22(v7, v23);
  v24 = swift_allocObject(&unk_100008430, 24, 7);
  ((void (*)(uint64_t, _QWORD))swift_unknownObjectWeakInit)(v24 + 16, *(_QWORD *)(v8 - 168));
  v25 = swift_allocObject(&unk_100008458, 25, 7);
  *(_QWORD *)(v25 + 16) = v24;
  *(_BYTE *)(v25 + 24) = *(_QWORD *)(v8 - 224);
  *(_QWORD *)(v8 - 120) = sub_100005610;
  *(_QWORD *)(v8 - 112) = v25;
  *(_QWORD *)(v8 - 152) = _NSConcreteStackBlock;
  *(_QWORD *)(v8 - 144) = 1107296256;
  *(_QWORD *)(v8 - 136) = sub_100004628;
  *(_QWORD *)(v8 - 128) = &unk_100008470;
  v26 = _Block_copy((const void *)(v8 - 152));
  v27 = swift_retain(v24);
  v28 = *(_QWORD *)(v8 - 216);
  static DispatchQoS.unspecified.getter(v27);
  *(_QWORD *)(v8 - 160) = &_swiftEmptyArrayStorage;
  v29 = sub_100005634();
  v30 = sub_10000567C(&qword_10000CC50);
  v31 = sub_1000056BC();
  v32 = *(_QWORD *)(v8 - 192);
  v33 = *(_QWORD *)(v8 - 176);
  dispatch thunk of SetAlgebra.init<A>(_:)(v8 - 160, v30, v31, v33, v29);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v21, v28, v32, v26);
  _Block_release(v26);

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 184) + 8))(v32, v33);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v8 - 208) + 8))(v28, *(_QWORD *)(v8 - 200));
  (*(void (**)(uint64_t, uint64_t))(v8 - 240))(v21, v23);
  v34 = *(_QWORD *)(v8 - 112);
  swift_release(v24);
  return swift_release(v34);
}

void sub_100005308(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  uint64_t v4;
  id v5;
  Class isa;
  _BYTE v7[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = static os_log_type_t.default.getter();
    if (qword_10000CB90 != -1)
      swift_once(&qword_10000CB90, sub_1000040B4);
    os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, qword_10000CE00, "Exit delay duration passed. Ending test now.", 44, 2, &_swiftEmptyArrayStorage);
    v5 = objc_msgSend(v3, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v5, "setStatusCode:", isa);

    objc_msgSend(v3, "setFinished:", 1);
  }
}

uint64_t sub_100005424(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

id sub_1000054F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticTriggerController()
{
  return objc_opt_self(OnDemandAudioDiagnosticTriggerController);
}

unint64_t sub_10000558C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CC40;
  if (!qword_10000CC40)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000CC40);
  }
  return result;
}

uint64_t sub_1000055C8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000055EC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 25, 7);
}

void sub_100005610()
{
  uint64_t v0;

  sub_100005308(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000561C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000562C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100005634()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CC48;
  if (!qword_10000CC48)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10000CC48);
  }
  return result;
}

uint64_t sub_10000567C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000056BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CC58;
  if (!qword_10000CC58)
  {
    v1 = sub_100005708(&qword_10000CC50);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000CC58);
  }
  return result;
}

uint64_t sub_100005708(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_10000574C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_100004678(a1, a2, a3, *(char **)(v3 + 16));
}

uint64_t sub_100005754()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100005778()
{
  uint64_t v0;

  sub_1000045A4(*(_QWORD *)(v0 + 16));
}

void sub_100005780(uint64_t a1)
{
  uint64_t v1;

  sub_1000048D4(a1, *(char **)(v1 + 16));
}

uint64_t sub_100005788(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100005858(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100005A30((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100005A30((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100005A10(v12);
  return v7;
}

uint64_t sub_100005858(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100005A6C(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100005A10(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005A30(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005A6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100005B00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100005CD8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100005CD8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100005B00(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100005C74(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100005C74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_10000567C((uint64_t *)&unk_10000CC60);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005CD8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
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
    v10 = sub_10000567C((uint64_t *)&unk_10000CC60);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100005E58(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;

  if (!result)
  {
    __break(1u);
    return result;
  }
  v2 = v1;
  v3 = result;
  if (!*(_QWORD *)(result + 16))
  {
    v30 = 0u;
    v31 = 0u;
    goto LABEL_10;
  }
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey + 8);
  swift_bridgeObjectRetain(v4);
  v6 = sub_10000650C(v5, v4);
  if ((v7 & 1) == 0)
  {
    v30 = 0u;
    v31 = 0u;
    swift_bridgeObjectRelease(v4);
    goto LABEL_10;
  }
  sub_100005A30(*(_QWORD *)(v3 + 56) + 32 * v6, (uint64_t)&v30);
  swift_bridgeObjectRelease(v4);
  if (!*((_QWORD *)&v31 + 1))
  {
LABEL_10:
    sub_100006570((uint64_t)&v30);
    goto LABEL_11;
  }
  if ((swift_dynamicCast(&v29, &v30, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) == 0)
  {
LABEL_11:
    v8 = 10;
    goto LABEL_12;
  }
  v8 = v29;
  if (v29 - 61 < 0xFFFFFFFFFFFFFFC4)
    return 0;
LABEL_12:
  v9 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout;
  *(_QWORD *)v9 = v8;
  *(_BYTE *)(v9 + 8) = 0;
  if (!*(_QWORD *)(v3 + 16))
  {
    v30 = 0u;
    v31 = 0u;
LABEL_21:
    sub_100006570((uint64_t)&v30);
    goto LABEL_22;
  }
  v11 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountKey);
  v10 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountKey + 8);
  swift_bridgeObjectRetain(v10);
  v12 = sub_10000650C(v11, v10);
  if ((v13 & 1) != 0)
  {
    sub_100005A30(*(_QWORD *)(v3 + 56) + 32 * v12, (uint64_t)&v30);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
  }
  swift_bridgeObjectRelease(v10);
  if (!*((_QWORD *)&v31 + 1))
    goto LABEL_21;
  if ((swift_dynamicCast(&v29, &v30, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) == 0)
  {
LABEL_22:
    v15 = &OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout;
    v14 = 10;
    goto LABEL_23;
  }
  v14 = v29;
  if (!v29)
    return 0;
  v15 = &OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCount;
LABEL_23:
  v16 = v2 + *v15;
  *(_QWORD *)v16 = v14;
  *(_BYTE *)(v16 + 8) = 0;
  if (!*(_QWORD *)(v3 + 16))
  {
    v30 = 0u;
    v31 = 0u;
LABEL_32:
    sub_100006570((uint64_t)&v30);
    goto LABEL_33;
  }
  v18 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutKey);
  v17 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutKey + 8);
  swift_bridgeObjectRetain(v17);
  v19 = sub_10000650C(v18, v17);
  if ((v20 & 1) != 0)
  {
    sub_100005A30(*(_QWORD *)(v3 + 56) + 32 * v19, (uint64_t)&v30);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
  }
  swift_bridgeObjectRelease(v17);
  if (!*((_QWORD *)&v31 + 1))
    goto LABEL_32;
  if ((swift_dynamicCast(&v29, &v30, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) == 0)
  {
LABEL_33:
    v21 = 300;
    goto LABEL_34;
  }
  v21 = v29;
  if (v29 - 601 < 0xFFFFFFFFFFFFFDC5)
    return 0;
LABEL_34:
  v22 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeout;
  *(_QWORD *)v22 = v21;
  *(_BYTE *)(v22 + 8) = 0;
  if (!*(_QWORD *)(v3 + 16))
  {
    v30 = 0u;
    v31 = 0u;
LABEL_44:
    sub_100006570((uint64_t)&v30);
    goto LABEL_45;
  }
  v24 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationKey);
  v23 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationKey + 8);
  swift_bridgeObjectRetain(v23);
  v25 = sub_10000650C(v24, v23);
  if ((v26 & 1) != 0)
  {
    sub_100005A30(*(_QWORD *)(v3 + 56) + 32 * v25, (uint64_t)&v30);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
  }
  swift_bridgeObjectRelease(v23);
  if (!*((_QWORD *)&v31 + 1))
    goto LABEL_44;
  if ((swift_dynamicCast(&v29, &v30, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
  {
    v27 = v29;
    if (*(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMax) < v29
      || v29 < *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMin))
    {
      return 0;
    }
    goto LABEL_46;
  }
LABEL_45:
  v27 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationDefault);
LABEL_46:
  v28 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDuration;
  *(_QWORD *)v28 = v27;
  *(_BYTE *)(v28 + 8) = 0;
  return 1;
}

id sub_100006264()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v1 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey];
  strcpy(&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey], "triggerTimeout");
  v1[15] = -18;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutMin] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutMax] = 60;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutDefault] = 10;
  v2 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountKey];
  *(_QWORD *)v2 = 0x756F437972746572;
  *((_QWORD *)v2 + 1) = 0xEA0000000000746ELL;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountMin] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountMax] = -1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountDefault] = 1;
  v3 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutKey];
  *(_QWORD *)v3 = 0xD000000000000018;
  *((_QWORD *)v3 + 1) = 0x80000001000074C0;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutMin] = 30;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutMax] = 600;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutDefault] = 300;
  v4 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationKey];
  *(_QWORD *)v4 = 0xD00000000000001BLL;
  *((_QWORD *)v4 + 1) = 0x80000001000074E0;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMin] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMax] = 60;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationDefault] = 0;
  v5 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCount];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeout];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDuration];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerInputs();
  return objc_msgSendSuper2(&v10, "init");
}

id sub_100006454()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerInputs();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticTriggerInputs()
{
  return objc_opt_self(OnDemandAudioDiagnosticTriggerInputs);
}

unint64_t sub_10000650C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000065B0(a1, a2, v5);
}

uint64_t sub_100006570(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000567C(&qword_10000CDF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000065B0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}
