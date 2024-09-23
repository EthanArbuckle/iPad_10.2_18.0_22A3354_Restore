id sub_100004088()
{
  id result;

  result = (id)DiagnosticLogHandleForCategory(3);
  qword_1000119F0 = (uint64_t)result;
  return result;
}

void sub_1000040B0(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  Class isa;
  _QWORD v14[5];
  uint64_t v15;

  v5 = *(_QWORD *)&v2[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder];
  *(_QWORD *)&v2[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder] = a2;
  swift_unknownObjectRetain(a2, a2);
  swift_unknownObjectRelease(v5);
  v6 = swift_allocObject(&unk_10000C5A0, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, v2);
  v14[4] = sub_1000083A4;
  v15 = v6;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_100004434;
  v14[3] = &unk_10000C748;
  v7 = _Block_copy(v14);
  swift_release(v15);
  objc_msgSend(a2, "requestSessionAccessoryIdentifierWithCompletion:", v7);
  _Block_release(v7);
  if (a1
    && (v8 = type metadata accessor for OnDemandAudioDiagnosticMonitorInputs(),
        (v9 = swift_dynamicCastClass(a1, v8)) != 0))
  {
    v11 = *(void **)&v2[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs];
    *(_QWORD *)&v2[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs] = v9;
    swift_unknownObjectRetain(a1, v10);

  }
  else
  {
    v12 = objc_msgSend(v2, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v12, "setStatusCode:", isa);

    objc_msgSend(v2, "setFinished:", 1);
  }
}

void sub_100004220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t Strong;
  void *v9;
  uint64_t v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  _BYTE v23[8];
  uint64_t v24;
  _BYTE v25[24];

  v7 = a4 + 16;
  swift_beginAccess(a4 + 16, v25, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    if (a3)
    {
      v10 = swift_errorRetain(a3);
      v11 = static os_log_type_t.error.getter(v10);
      if (qword_100011330 != -1)
        swift_once(&qword_100011330, sub_100004088);
      v12 = qword_1000119F0;
      v13 = v11;
      if (os_log_type_enabled((os_log_t)qword_1000119F0, v11))
      {
        swift_errorRetain(a3);
        swift_errorRetain(a3);
        v14 = (uint8_t *)swift_slowAlloc(12, -1);
        v15 = swift_slowAlloc(32, -1);
        v24 = v15;
        *(_DWORD *)v14 = 136315138;
        swift_getErrorValue(a3, v23, v22);
        v16 = Error.localizedDescription.getter(v22[1], v22[2]);
        v18 = v17;
        v21 = sub_100007198(v16, v17, &v24);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v14 + 4, v14 + 12);
        swift_bridgeObjectRelease(v18);
        swift_errorRelease(a3);
        swift_errorRelease(a3);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Unable to get accessory identifier from host app with error %s", v14, 0xCu);
        swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v15, -1, -1);
        swift_slowDealloc(v14, -1, -1);
      }
      sub_100006754(0);
      swift_errorRelease(a3);

    }
    else
    {
      v19 = (_QWORD *)(Strong + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID);
      v20 = *(_QWORD *)(Strong + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID + 8);
      *v19 = a1;
      v19[1] = a2;
      swift_bridgeObjectRetain(a2);

      swift_bridgeObjectRelease(v20);
    }
  }
}

void sub_100004434(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t sub_100004524()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[5];
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v30 = *(_QWORD *)(v6 - 8);
  v31 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchTime(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v28 - v14;
  sub_100005494();
  sub_100007054();
  v16 = static OS_dispatch_queue.main.getter();
  result = static DispatchTime.now()(v16);
  v18 = *(_QWORD *)(v1 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
  if (v18)
  {
    v28 = (void *)v16;
    v29 = v3;
    v19 = v18 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDuration;
    if ((*(_BYTE *)(v19 + 8) & 1) == 0)
    {
      + infix(_:_:)(v13, (double)*(unint64_t *)v19);
      v20 = *(void (**)(char *, uint64_t))(v10 + 8);
      v20(v13, v9);
      v21 = swift_allocObject(&unk_10000C5A0, 24, 7);
      swift_unknownObjectWeakInit(v21 + 16, v1);
      aBlock[4] = sub_10000838C;
      v33 = v21;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100004E50;
      aBlock[3] = &unk_10000C6D0;
      v22 = _Block_copy(aBlock);
      v23 = swift_release(v33);
      static DispatchQoS.unspecified.getter(v23);
      aBlock[0] = &_swiftEmptyArrayStorage;
      v24 = sub_10000830C(&qword_100011400, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v25 = sub_1000070FC(&qword_100011408);
      v26 = sub_10000834C(&qword_100011410, &qword_100011408);
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v2, v24);
      v27 = v28;
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v15, v8, v5, v22);
      _Block_release(v22);

      (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v31);
      return ((uint64_t (*)(char *, uint64_t))v20)(v15, v9);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1000047E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  NSString v18;
  Class isa;
  void *v20;
  uint64_t v21;
  _QWORD aBlock[5];
  uint64_t v23;
  char v24[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v24, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (!Strong)
    return;
  v3 = (char *)Strong;
  v4 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs;
  v5 = *(_QWORD *)(Strong + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
  if (!v5)
  {
    __break(1u);
    goto LABEL_16;
  }
  v6 = *(unsigned __int8 *)(v5 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled);
  if (v6 == 2)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((v6 & 1) != 0)
    sub_100004E88();
  v7 = *(void **)&v3[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder];
  if (!v7)
    goto LABEL_17;
  if ((objc_msgSend(*(id *)&v3[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder], "respondsToSelector:", "displayAlertWithHeader:message:buttonStrings:completion:") & 1) != 0)
  {
    v8 = *(_QWORD *)&v3[v4];
    if (v8)
    {
      v9 = *(_QWORD *)(v8 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader + 8);
      if (v9)
      {
        v10 = *(_QWORD *)(v8 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage + 8);
        if (v10)
        {
          v11 = sub_1000070FC(&qword_100011450);
          v12 = swift_allocObject(v11, 48, 7);
          *(_OWORD *)(v12 + 16) = xmmword_100009AB0;
          v13 = *(_QWORD *)(v8 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton + 8);
          if (v13)
          {
            v14 = v12;
            *(_QWORD *)(v12 + 32) = *(_QWORD *)(v8 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton);
            *(_QWORD *)(v12 + 40) = v13;
            v15 = swift_allocObject(&unk_10000C5A0, 24, 7);
            swift_unknownObjectWeakInit(v15 + 16, v3);
            swift_bridgeObjectRetain(v9);
            swift_bridgeObjectRetain(v10);
            swift_unknownObjectRetain(v7, v16);
            swift_bridgeObjectRetain(v13);
            swift_retain(v15);
            v17 = String._bridgeToObjectiveC()();
            v18 = String._bridgeToObjectiveC()();
            isa = Array._bridgeToObjectiveC()().super.isa;
            aBlock[4] = sub_100008394;
            v23 = v15;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_100004A8C;
            aBlock[3] = &unk_10000C6F8;
            v20 = _Block_copy(aBlock);
            swift_retain(v15);
            objc_msgSend(v7, "displayAlertWithHeader:message:buttonStrings:completion:", v17, v18, isa, v20);
            _Block_release(v20);

            v21 = v23;
            swift_bridgeObjectRelease(v14);
            swift_release_n(v15, 2);

            swift_unknownObjectRelease(v7);
            swift_release(v21);
            swift_bridgeObjectRelease(v9);
            swift_bridgeObjectRelease(v10);
            return;
          }
          goto LABEL_21;
        }
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        return;
      }
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

}

void sub_100004A8C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(id, void *);
  id v7;
  id v8;

  v6 = *(void (**)(id, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(v8, a3);
  swift_release(v5);

}

uint64_t sub_100004B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void (*v30)(char *, uint64_t);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[5];
  uint64_t v36;
  _BYTE v37[24];

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v33 = *(_QWORD *)(v8 - 8);
  v34 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchTime(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v30 - v16;
  a3 += 16;
  swift_beginAccess(a3, v37, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(a3);
  if (result)
  {
    v19 = (char *)result;
    *(_BYTE *)(result + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_openLidAlertDismissed) = 1;
    sub_100007054();
    v20 = static OS_dispatch_queue.main.getter();
    result = static DispatchTime.now()(v20);
    v21 = *(_QWORD *)&v19[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs];
    if (v21)
    {
      v31 = (void *)v20;
      v32 = v5;
      v22 = v21 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeout;
      if ((*(_BYTE *)(v22 + 8) & 1) == 0)
      {
        + infix(_:_:)(v15, (double)*(unint64_t *)v22);
        v30 = *(void (**)(char *, uint64_t))(v12 + 8);
        v30(v15, v11);
        v23 = swift_allocObject(&unk_10000C5A0, 24, 7);
        swift_unknownObjectWeakInit(v23 + 16, v19);
        aBlock[4] = sub_10000839C;
        v36 = v23;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100004E50;
        aBlock[3] = &unk_10000C720;
        v24 = _Block_copy(aBlock);
        v25 = swift_release(v36);
        static DispatchQoS.unspecified.getter(v25);
        aBlock[0] = &_swiftEmptyArrayStorage;
        v26 = sub_10000830C(&qword_100011400, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        v27 = sub_1000070FC(&qword_100011408);
        v28 = sub_10000834C(&qword_100011410, &qword_100011408);
        dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v4, v26);
        v29 = v31;
        OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v17, v10, v7, v24);
        _Block_release(v24);

        (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v34);
        return ((uint64_t (*)(char *, uint64_t))v30)(v17, v11);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_100004DFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_100006754(1);

  }
}

void sub_100004E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  SystemSoundID v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;

  v1 = v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_audioAlertPlaybackStartTime;
  if ((*(_BYTE *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_audioAlertPlaybackStartTime + 8) & 1) != 0)
  {
    *(_QWORD *)v1 = 0x41CD27E440000000;
    *(_BYTE *)(v1 + 8) = 0;
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
    if (!v2)
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
LABEL_3:
    v3 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID;
    if ((*(_BYTE *)(v3 + 4) & 1) == 0)
    {
      v4 = *(_DWORD *)v3;
      v5 = swift_allocObject(&unk_10000C5A0, 24, 7);
      swift_unknownObjectWeakInit(v5 + 16, v0);
      v7[4] = sub_1000082FC;
      v8 = v5;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 1107296256;
      v7[2] = sub_100004E50;
      v7[3] = &unk_10000C680;
      v6 = _Block_copy(v7);
      swift_release(v8);
      AudioServicesPlayAlertSoundWithCompletion(v4, v6);
      _Block_release(v6);
      return;
    }
    __break(1u);
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_openLidAlertDismissed) & 1) == 0)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
    if (!v2)
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    if ((*(_BYTE *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration + 8) & 1) != 0)
    {
LABEL_13:
      __break(1u);
      return;
    }
    if (*(double *)v1
       + (double)*(unint64_t *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration) >= 978307200.0)
      goto LABEL_3;
  }
}

void sub_100004FF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *Strong;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void *v46;
  _QWORD aBlock[5];
  uint64_t v48;
  char v49[24];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v44 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v42 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  __chkstk_darwin(v5);
  v41 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = type metadata accessor for DispatchTime(0);
  v7 = *(_QWORD *)(v45 - 8);
  v8 = __chkstk_darwin(v45);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v38 - v11;
  v13 = type metadata accessor for DispatchQoS.QoSClass(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v49, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v18 = Strong;
    v40 = v3;
    v19 = v2;
    v20 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs;
    v21 = *(_QWORD *)&Strong[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs];
    if (v21)
    {
      v22 = *(unsigned __int8 *)(v21 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops);
      if (v22 != 2)
      {
        if ((v22 & 1) == 0)
        {

          return;
        }
        sub_100007054();
        (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, enum case for DispatchQoS.QoSClass.userInteractive(_:), v13);
        v23 = static OS_dispatch_queue.global(qos:)(v16);
        v24 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
        static DispatchTime.now()(v24);
        v25 = *(_QWORD *)&v18[v20];
        if (v25)
        {
          v39 = (void *)v23;
          v26 = v25 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay;
          if ((*(_BYTE *)(v26 + 8) & 1) == 0)
          {
            v27 = v19;
            + infix(_:_:)(v10, (double)*(unint64_t *)v26);
            v38 = *(void (**)(char *, uint64_t))(v7 + 8);
            v38(v10, v45);
            v28 = swift_allocObject(&unk_10000C5A0, 24, 7);
            swift_unknownObjectWeakInit(v28 + 16, v18);
            aBlock[4] = sub_100008304;
            v48 = v28;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_100004E50;
            aBlock[3] = &unk_10000C6A8;
            v29 = _Block_copy(aBlock);
            v30 = swift_retain(v28);
            v31 = v41;
            static DispatchQoS.unspecified.getter(v30);
            v46 = &_swiftEmptyArrayStorage;
            v32 = sub_10000830C(&qword_100011400, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
            v33 = sub_1000070FC(&qword_100011408);
            v34 = sub_10000834C(&qword_100011410, &qword_100011408);
            v35 = v44;
            dispatch thunk of SetAlgebra.init<A>(_:)(&v46, v33, v34, v27, v32);
            v36 = v39;
            OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v12, v31, v35, v29);
            _Block_release(v29);

            (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v27);
            (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v43);
            v38(v12, v45);
            v37 = v48;
            swift_release(v28);
            swift_release(v37);
            return;
          }
LABEL_13:
          __break(1u);
          return;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

void sub_1000053AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_100004E88();

  }
}

uint64_t sub_1000053FC(uint64_t a1)
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

void sub_100005494()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v1 = *(void **)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeClient);
  objc_msgSend(v1, "setDispatchQueue:", *(_QWORD *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeDispatchQueue));
  v2 = swift_allocObject(&unk_10000C5A0, 24, 7);
  swift_unknownObjectWeakInit(v2 + 16, v0);
  v12 = sub_100007180;
  v13 = v2;
  v8 = _NSConcreteStackBlock;
  v9 = 1107296256;
  v10 = sub_100004E50;
  v11 = &unk_10000C608;
  v3 = _Block_copy(&v8);
  swift_release(v13);
  objc_msgSend(v1, "setInterruptionHandler:", v3);
  _Block_release(v3);
  v4 = swift_allocObject(&unk_10000C5A0, 24, 7);
  swift_unknownObjectWeakInit(v4 + 16, v0);
  v12 = sub_100007188;
  v13 = v4;
  v8 = _NSConcreteStackBlock;
  v9 = 1107296256;
  v10 = sub_1000064E4;
  v11 = &unk_10000C630;
  v5 = _Block_copy(&v8);
  swift_release(v13);
  objc_msgSend(v1, "setDeviceDiagnosticRecordFoundHandler:", v5);
  _Block_release(v5);
  v6 = swift_allocObject(&unk_10000C5A0, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, v0);
  v12 = sub_100007190;
  v13 = v6;
  v8 = _NSConcreteStackBlock;
  v9 = 1107296256;
  v10 = sub_100006700;
  v11 = &unk_10000C658;
  v7 = _Block_copy(&v8);
  swift_release(v13);
  objc_msgSend(v1, "activateWithCompletion:", v7);
  _Block_release(v7);
}

void sub_100005674(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  uint64_t v4;
  _BYTE v5[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = static os_log_type_t.error.getter(Strong);
    if (qword_100011330 != -1)
      swift_once(&qword_100011330, sub_100004088);
    os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, qword_1000119F0, "HearingModeClient was interrupted (HearingModeService crash?)", 61, 2, &_swiftEmptyArrayStorage);
    sub_100006754(2);

  }
}

void sub_100005728(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t Strong;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  os_log_type_t v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  id v39;
  uint8_t *v40;
  id v41;
  _QWORD *v42;
  uint64_t v43;
  uint8_t *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int (*v55)(uint64_t, uint64_t, uint64_t);
  id v56;
  id v57;
  Class isa;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v68;
  Class v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  __objc2_class_ro *v74;
  uint64_t v75;
  unsigned int v76;
  __objc2_class_ro *v77;
  id v78;
  id v79;
  Class v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  Class v91;
  unsigned int v92;
  unsigned int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  char *v99;
  char *v100;
  id v101;
  id v102;
  __objc2_class_ro *v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  Class v107;
  id v108;
  id v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  Class v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  void *v121;
  char v122;
  _QWORD *v123;
  os_log_t v124;
  id v125;
  char *v126;
  char *v127;
  char *v128;
  uint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  _OWORD v137[2];
  __int128 v138;
  __int128 v139;
  id v140;
  uint64_t v141;
  char v142[32];

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v131 = (char *)&v123 - v9;
  v10 = sub_1000070FC((uint64_t *)&unk_100011420);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v123 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v123 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v123 - v18;
  v20 = __chkstk_darwin(v17);
  v130 = (char *)&v123 - v21;
  v22 = __chkstk_darwin(v20);
  v134 = (char *)&v123 - v23;
  __chkstk_darwin(v22);
  v25 = (char *)&v123 - v24;
  a2 += 16;
  swift_beginAccess(a2, v142, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v27 = (char *)Strong;
    v127 = v16;
    v128 = v8;
    v132 = v5;
    v28 = objc_msgSend(a1, "bluetoothUUID");
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v31 = v30;

    if (v29 == *(_QWORD *)&v27[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID]
      && v31 == *(_QWORD *)&v27[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID + 8])
    {
      v32 = swift_bridgeObjectRelease(v31);
      v33 = (uint64_t)v134;
    }
    else
    {
      v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v31);
      v32 = swift_bridgeObjectRelease(v31);
      v33 = (uint64_t)v134;
      if ((v34 & 1) == 0)
      {

        return;
      }
    }
    v35 = static os_log_type_t.error.getter(v32);
    if (qword_100011330 != -1)
      swift_once(&qword_100011330, sub_100004088);
    v36 = qword_1000119F0;
    v37 = os_log_type_enabled((os_log_t)qword_1000119F0, v35);
    v133 = v27;
    v129 = v4;
    if (v37)
    {
      v38 = a1;
      v125 = a1;
      v39 = v38;
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v123 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v40 = 138412290;
      v140 = v39;
      v124 = v36;
      v41 = v39;
      v33 = (uint64_t)v134;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v140, &v141, v40 + 4, v40 + 12);
      v42 = v123;
      *v123 = v39;
      a1 = v125;

      v4 = v129;
      _os_log_impl((void *)&_mh_execute_header, v124, v35, "Recieved diagnostic record from HearingModeService client %@", v40, 0xCu);
      v43 = sub_1000070FC(&qword_100011418);
      swift_arrayDestroy(v42, 1, v43);
      swift_slowDealloc(v42, -1, -1);
      v44 = v40;
      v27 = v133;
      swift_slowDealloc(v44, -1, -1);
    }
    v45 = objc_msgSend((id)objc_opt_self(DSDateFormatter), "sharedFormatter");
    if (v45)
    {
      v46 = v45;
      v134 = v13;
      v47 = objc_msgSend(v45, "formatterWithType:", 0);

      v48 = objc_msgSend(a1, "lastMeasurementTimestampLeft");
      v49 = v132;
      if (v48)
      {
        v50 = v48;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        v51 = *(NSObject **)(v49 + 56);
        v52 = v33;
        v53 = 0;
      }
      else
      {
        v51 = *(NSObject **)(v132 + 56);
        v52 = v33;
        v53 = 1;
      }
      v124 = v51;
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v51)(v52, v53, 1, v4);
      v54 = (uint64_t)v130;
      sub_1000077D8(v33, (uint64_t)v25);
      v123 = v25;
      sub_100007820((uint64_t)v25, v54);
      v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48);
      if (v55(v54, 1, v4) == 1)
      {
        sub_10000788C(v54, (uint64_t *)&unk_100011420);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v131, v54, v4);
        v56 = objc_msgSend(v27, "result");
        *(_QWORD *)&v138 = 0xD00000000000001CLL;
        *((_QWORD *)&v138 + 1) = 0x800000010000A2B0;
        AnyHashable.init<A>(_:)(&v140, &v138, &type metadata for String, &protocol witness table for String);
        if (v47)
        {
          v57 = v47;
          isa = Date._bridgeToObjectiveC()().super.isa;
          v59 = v47;
          v60 = a1;
          v61 = objc_msgSend(v57, "stringFromDate:", isa);

          v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
          v64 = v63;

          a1 = v60;
          v47 = v59;
          *((_QWORD *)&v139 + 1) = &type metadata for String;
          *(_QWORD *)&v138 = v62;
          *((_QWORD *)&v138 + 1) = v64;
        }
        else
        {
          v138 = 0u;
          v139 = 0u;
        }
        v65 = objc_msgSend(v56, "data");
        v66 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        v136 = v66;
        if (v47)
        {
          sub_1000079E4(&v138, v137);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v66);
          v135 = v66;
          sub_100007ED0(v137, (uint64_t)&v140, isUniquelyReferenced_nonNull_native);
          v68 = v135;
          v136 = v135;
          swift_bridgeObjectRelease(0x8000000000000000);
          sub_1000079B0((uint64_t)&v140);
        }
        else
        {
          sub_10000788C((uint64_t)&v138, (uint64_t *)&unk_1000119E0);
          sub_1000078C8((uint64_t)&v140, v137);
          sub_1000079B0((uint64_t)&v140);
          sub_10000788C((uint64_t)v137, (uint64_t *)&unk_1000119E0);
          v68 = v136;
        }
        v49 = v132;
        v69 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v68);
        objc_msgSend(v56, "setData:", v69);

        v4 = v129;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v131, v129);
      }
      v70 = objc_msgSend(a1, "lastMeasurementTimestampRight");
      if (v70)
      {
        v71 = v70;
        v72 = (uint64_t)v127;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        v73 = 0;
        v74 = &OnDemandAudioDiagnosticMonitorController__metaData;
      }
      else
      {
        v73 = 1;
        v74 = &OnDemandAudioDiagnosticMonitorController__metaData;
        v72 = (uint64_t)v127;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v124)(v72, v73, 1, v4);
      sub_1000077D8(v72, (uint64_t)v19);
      v75 = (uint64_t)v134;
      sub_100007820((uint64_t)v19, (uint64_t)v134);
      v76 = v55(v75, 1, v4);
      v126 = v19;
      v125 = v47;
      if (v76 == 1)
      {
        sub_10000788C(v75, (uint64_t *)&unk_100011420);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v128, v75, v4);
        v77 = v74;
        v78 = objc_msgSend(v27, v74[48].name);
        *(_QWORD *)&v138 = 0xD00000000000001DLL;
        *((_QWORD *)&v138 + 1) = 0x800000010000A290;
        AnyHashable.init<A>(_:)(&v140, &v138, &type metadata for String, &protocol witness table for String);
        if (v47)
        {
          v79 = v47;
          v80 = Date._bridgeToObjectiveC()().super.isa;
          v81 = a1;
          v82 = objc_msgSend(v79, "stringFromDate:", v80);

          v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v82);
          v85 = v84;

          a1 = v81;
          *((_QWORD *)&v139 + 1) = &type metadata for String;
          *(_QWORD *)&v138 = v83;
          *((_QWORD *)&v138 + 1) = v85;
        }
        else
        {
          v138 = 0u;
          v139 = 0u;
        }
        v86 = objc_msgSend(v78, "data");
        v87 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        v136 = v87;
        if (v47)
        {
          sub_1000079E4(&v138, v137);
          v88 = swift_isUniquelyReferenced_nonNull_native(v87);
          v135 = v87;
          sub_100007ED0(v137, (uint64_t)&v140, v88);
          v89 = v135;
          v136 = v135;
          swift_bridgeObjectRelease(0x8000000000000000);
          sub_1000079B0((uint64_t)&v140);
        }
        else
        {
          sub_10000788C((uint64_t)&v138, (uint64_t *)&unk_1000119E0);
          sub_1000078C8((uint64_t)&v140, v137);
          sub_1000079B0((uint64_t)&v140);
          sub_10000788C((uint64_t)v137, (uint64_t *)&unk_1000119E0);
          v89 = v136;
        }
        v90 = v132;
        v91 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v89);
        objc_msgSend(v78, "setData:", v91);

        (*(void (**)(char *, uint64_t))(v90 + 8))(v128, v129);
        v74 = v77;
      }
      v92 = objc_msgSend(a1, "latestMeasurementResultLeft");
      LODWORD(v132) = v92;
      v93 = objc_msgSend(a1, "latestMeasurementResultRight");
      LODWORD(v134) = v93;
      v94 = sub_100007868(v92);
      v95 = String.init(cString:)(v94);
      v97 = v96;
      v98 = sub_100007868(v93);
      v131 = (char *)String.init(cString:)(v98);
      v130 = v99;
      v100 = v133;
      v101 = objc_msgSend(v133, v74[48].name);
      *(_QWORD *)&v138 = 0xD00000000000001FLL;
      *((_QWORD *)&v138 + 1) = 0x800000010000A240;
      AnyHashable.init<A>(_:)(&v140, &v138, &type metadata for String, &protocol witness table for String);
      *((_QWORD *)&v139 + 1) = &type metadata for String;
      *(_QWORD *)&v138 = v95;
      *((_QWORD *)&v138 + 1) = v97;
      v102 = objc_msgSend(v101, "data");
      v103 = v74;
      v104 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      sub_1000079E4(&v138, v137);
      v105 = swift_isUniquelyReferenced_nonNull_native(v104);
      v136 = v104;
      sub_100007ED0(v137, (uint64_t)&v140, v105);
      v106 = v136;
      swift_bridgeObjectRelease(0x8000000000000000);
      sub_1000079B0((uint64_t)&v140);
      v107 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v106);
      objc_msgSend(v101, "setData:", v107);

      v108 = objc_msgSend(v100, v103[48].name);
      *(_QWORD *)&v138 = 0xD000000000000020;
      *((_QWORD *)&v138 + 1) = 0x800000010000A260;
      AnyHashable.init<A>(_:)(&v140, &v138, &type metadata for String, &protocol witness table for String);
      *((_QWORD *)&v139 + 1) = &type metadata for String;
      *(_QWORD *)&v138 = v131;
      *((_QWORD *)&v138 + 1) = v130;
      v109 = objc_msgSend(v108, "data");
      v110 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      sub_1000079E4(&v138, v137);
      v111 = swift_isUniquelyReferenced_nonNull_native(v110);
      v136 = v110;
      sub_100007ED0(v137, (uint64_t)&v140, v111);
      v112 = v136;
      swift_bridgeObjectRelease(0x8000000000000000);
      sub_1000079B0((uint64_t)&v140);
      v113 = Dictionary._bridgeToObjectiveC()().super.isa;
      v114 = v112;
      v115 = v132;
      swift_bridgeObjectRelease(v114);
      objc_msgSend(v108, "setData:", v113);

      v116 = v134;
      if ((sub_100006480(v115, (uint64_t)&off_10000C450) & 1) != 0
        && (sub_100006480(v116, (uint64_t)&off_10000C450) & 1) != 0)
      {
        v117 = 6;
        v118 = (uint64_t)v126;
        v119 = (uint64_t)v123;
        v120 = v133;
        v121 = v125;
      }
      else
      {
        v122 = sub_100006480(v115, (uint64_t)&off_10000C478);
        v118 = (uint64_t)v126;
        v121 = v125;
        if ((v122 & 1) != 0)
        {
          v117 = 5;
        }
        else if ((sub_100006480(v116, (uint64_t)&off_10000C478) & 1) != 0)
        {
          v117 = 5;
        }
        else
        {
          v117 = 4;
        }
        v119 = (uint64_t)v123;
        v120 = v133;
      }
      sub_100006754(v117);

      sub_10000788C(v118, (uint64_t *)&unk_100011420);
      sub_10000788C(v119, (uint64_t *)&unk_100011420);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_100006480(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_DWORD *)(a2 + 32) == (_DWORD)result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 9; ; ++i)
  {
    v4 = i - 7;
    if (__OFADD__(i - 8, 1))
      break;
    v6 = *(_DWORD *)(a2 + 4 * i) == (_DWORD)result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

void sub_1000064E4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

void sub_100006534(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *Strong;
  void *v5;
  uint64_t v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v15, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    if (a1)
    {
      v6 = swift_errorRetain(a1);
      v7 = static os_log_type_t.error.getter(v6);
      if (qword_100011330 != -1)
        swift_once(&qword_100011330, sub_100004088);
      v8 = qword_1000119F0;
      v9 = v7;
      if (os_log_type_enabled((os_log_t)qword_1000119F0, v7))
      {
        swift_errorRetain(a1);
        swift_errorRetain(a1);
        v10 = (uint8_t *)swift_slowAlloc(12, -1);
        v11 = (uint64_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v10 = 138412290;
        swift_errorRetain(a1);
        v12 = _swift_stdlib_bridgeErrorToNSError(a1);
        v14 = v12;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, v15, v10 + 4, v10 + 12);
        *v11 = v12;
        swift_errorRelease(a1);
        swift_errorRelease(a1);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to activate HearingModeService client with error %@", v10, 0xCu);
        v13 = sub_1000070FC(&qword_100011418);
        swift_arrayDestroy(v11, 1, v13);
        swift_slowDealloc(v11, -1, -1);
        swift_slowDealloc(v10, -1, -1);
      }
      sub_100006754(3);

      swift_errorRelease(a1);
    }
    else
    {

    }
  }
}

void sub_100006700(uint64_t a1, void *a2)
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

id sub_100006754(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id result;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  os_log_type_t v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void **aBlock;
  _QWORD v55[4];
  uint64_t v56;

  v52 = a1;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v51 = *(_QWORD *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v50 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v49 - 8);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v48 = (char *)&v41 - v12;
  v13 = type metadata accessor for DispatchQoS.QoSClass(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = *(id *)(v1 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder);
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  result = objc_msgSend(result, "clearAllowSessionAccessoryDisconnect");
  v18 = *(_QWORD *)(v1 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
  if (!v18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v46 = v1;
  v47 = v6;
  v19 = v18 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDuration;
  if ((*(_BYTE *)(v19 + 8) & 1) != 0)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v44 = v3;
  v45 = v2;
  v20 = *(_QWORD *)v19;
  v21 = static os_log_type_t.default.getter(result);
  if (qword_100011330 != -1)
    swift_once(&qword_100011330, sub_100004088);
  v43 = v5;
  v22 = (double)v20;
  v23 = qword_1000119F0;
  if (os_log_type_enabled((os_log_t)qword_1000119F0, v21))
  {
    v24 = swift_slowAlloc(22, -1);
    *(_DWORD *)v24 = 134218240;
    aBlock = (void **)qword_100009B40[(char)v52];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v55, v24 + 4, v24 + 12);
    *(_WORD *)(v24 + 12) = 2048;
    aBlock = *(void ***)&v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v55, v24 + 14, v24 + 22);
    _os_log_impl((void *)&_mh_execute_header, v23, v21, "Test finished with status code %ld. Will end test after %f seconds", (uint8_t *)v24, 0x16u);
    swift_slowDealloc(v24, -1, -1);
  }
  sub_100007054();
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, enum case for DispatchQoS.QoSClass.default(_:), v13);
  v25 = (void *)static OS_dispatch_queue.global(qos:)(v16);
  v26 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  static DispatchTime.now()(v26);
  v27 = v48;
  + infix(_:_:)(v11, v22);
  v42 = *(void (**)(char *, uint64_t))(v8 + 8);
  v28 = v49;
  v42(v11, v49);
  v29 = swift_allocObject(&unk_10000C5A0, 24, 7);
  swift_unknownObjectWeakInit(v29 + 16, v46);
  v30 = swift_allocObject(&unk_10000C5C8, 25, 7);
  *(_QWORD *)(v30 + 16) = v29;
  *(_BYTE *)(v30 + 24) = v52;
  v55[3] = sub_1000070D8;
  v56 = v30;
  aBlock = _NSConcreteStackBlock;
  v55[0] = 1107296256;
  v55[1] = sub_100004E50;
  v55[2] = &unk_10000C5E0;
  v31 = _Block_copy(&aBlock);
  v32 = swift_retain(v29);
  v33 = v50;
  static DispatchQoS.unspecified.getter(v32);
  v53 = &_swiftEmptyArrayStorage;
  v34 = sub_10000830C(&qword_100011400, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v35 = sub_1000070FC(&qword_100011408);
  v36 = sub_10000834C(&qword_100011410, &qword_100011408);
  v37 = v43;
  v38 = v35;
  v39 = v45;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v53, v38, v36, v45, v34);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v27, v33, v37, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v44 + 8))(v37, v39);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v33, v47);
  v42(v27, v28);
  v40 = v56;
  swift_release(v29);
  return (id)swift_release(v40);
}

void sub_100006BF8(uint64_t a1)
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
    if (qword_100011330 != -1)
      swift_once(&qword_100011330, sub_100004088);
    os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, qword_1000119F0, "Exit delay duration passed. Ending test now.", 44, 2, &_swiftEmptyArrayStorage);
    v5 = objc_msgSend(v3, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v5, "setStatusCode:", isa);

    objc_msgSend(v3, "setFinished:", 1);
  }
}

id sub_100006D14()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  objc_class *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  void *v26;

  v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v23 = *(_QWORD *)(v1 - 8);
  v24 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder] = 0;
  v10 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeClient;
  v11 = objc_allocWithZone((Class)HMServiceClient);
  v12 = v0;
  *(_QWORD *)&v0[v10] = objc_msgSend(v11, "init");
  v13 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeDispatchQueue;
  v14 = sub_100007054();
  static DispatchQoS.unspecified.getter(v14);
  v26 = &_swiftEmptyArrayStorage;
  v15 = sub_10000830C(&qword_100011438, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v16 = sub_1000070FC(&qword_100011440);
  v17 = sub_10000834C(&qword_100011448, &qword_100011440);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v16, v17, v4, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v23 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v24);
  *(_QWORD *)&v12[v13] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000030, 0x800000010000A310, v9, v6, v3, 0);
  v18 = &v12[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_audioAlertPlaybackStartTime];
  *(_QWORD *)v18 = 0;
  v18[8] = 1;
  v12[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_openLidAlertDismissed] = 0;
  v19 = &v12[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0xE000000000000000;

  v20 = (objc_class *)type metadata accessor for OnDemandAudioDiagnosticMonitorController();
  v25.receiver = v12;
  v25.super_class = v20;
  return objc_msgSendSuper2(&v25, "init");
}

id sub_100006F98()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticMonitorController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticMonitorController()
{
  return objc_opt_self(OnDemandAudioDiagnosticMonitorController);
}

unint64_t sub_100007054()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000113F8;
  if (!qword_1000113F8)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000113F8);
  }
  return result;
}

uint64_t sub_100007090()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000070B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 25, 7);
}

void sub_1000070D8()
{
  uint64_t v0;

  sub_100006BF8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1000070E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000070F4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000070FC(uint64_t *a1)
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

uint64_t sub_10000713C(uint64_t *a1)
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

void sub_100007180()
{
  uint64_t v0;

  sub_100005674(v0);
}

void sub_100007188(void *a1)
{
  uint64_t v1;

  sub_100005728(a1, v1);
}

void sub_100007190(uint64_t a1)
{
  uint64_t v1;

  sub_100006534(a1, v1);
}

uint64_t sub_100007198(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100007268(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000082C0((uint64_t)v12, *a3);
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
      sub_1000082C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000082A0(v12);
  return v7;
}

uint64_t sub_100007268(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100007420(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100007420(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000074B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000768C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000768C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000074B4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100007628(v4, 0);
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

_QWORD *sub_100007628(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000070FC(&qword_100011458);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000768C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000070FC(&qword_100011458);
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

uint64_t sub_1000077D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000070FC((uint64_t *)&unk_100011420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007820(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000070FC((uint64_t *)&unk_100011420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

const char *sub_100007868(unsigned int a1)
{
  if (a1 > 8)
    return "?";
  else
    return off_10000C770[a1];
}

uint64_t sub_10000788C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000070FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_1000078C8@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100009268(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v13 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100008080();
      v10 = v13;
    }
    sub_1000079B0(*(_QWORD *)(v10 + 48) + 40 * v7);
    sub_1000079E4((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v7), a2);
    sub_100007D08(v7, v10);
    v11 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1000079B0(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

_OWORD *sub_1000079E4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000079F4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000070FC(&qword_100011430);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_44;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v15 << 6);
      goto LABEL_25;
    }
    v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v22 >= v12)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v15;
    if (!v24)
    {
      v15 = v22 + 1;
      if (v22 + 1 >= v12)
        goto LABEL_37;
      v24 = *(_QWORD *)(v37 + 8 * v15);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v12)
        {
LABEL_37:
          swift_release(v5);
          if ((a2 & 1) == 0)
            goto LABEL_44;
          goto LABEL_40;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v15 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_46;
            if (v15 >= v12)
              goto LABEL_37;
            v24 = *(_QWORD *)(v37 + 8 * v15);
            ++v25;
            if (v24)
              goto LABEL_24;
          }
        }
        v15 = v25;
      }
    }
LABEL_24:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_25:
    v26 = *(_QWORD *)(v5 + 48) + 40 * v21;
    if ((a2 & 1) != 0)
    {
      v27 = *(_OWORD *)v26;
      v28 = *(_OWORD *)(v26 + 16);
      v41 = *(_QWORD *)(v26 + 32);
      v39 = v27;
      v40 = v28;
      sub_1000079E4((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v21), v38);
    }
    else
    {
      sub_100008264(v26, (uint64_t)&v39);
      sub_1000082C0(*(_QWORD *)(v5 + 56) + 32 * v21, (uint64_t)v38);
    }
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v29 = -1 << *(_BYTE *)(v8 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v13 + 8 * v31);
      }
      while (v35 == -1);
      v16 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    v17 = *(_QWORD *)(v8 + 48) + 40 * v16;
    v18 = v39;
    v19 = v40;
    *(_QWORD *)(v17 + 32) = v41;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    result = (uint64_t)sub_1000079E4(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v16));
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_44;
LABEL_40:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_44:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_100007D08(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_100008264(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
        result = sub_1000079B0((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_100007ED0(_OWORD *a1, uint64_t a2, char a3)
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
  _QWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_100009268(a2);
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
        v17 = (_QWORD *)(v16[7] + 32 * v10);
        sub_1000082A0(v17);
        return sub_1000079E4(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100008080();
      goto LABEL_7;
    }
    sub_1000079F4(v13, a3 & 1);
    v19 = sub_100009268(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100008264(a2, (uint64_t)v21);
      return sub_100008008(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

_OWORD *sub_100008008(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
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
  result = sub_1000079E4(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_100008080()
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
  sub_1000070FC(&qword_100011430);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    sub_100008264(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1000082C0(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1000079E4(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
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

uint64_t sub_100008264(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000082A0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000082C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000082FC()
{
  uint64_t v0;

  sub_100004FF4(v0);
}

void sub_100008304()
{
  uint64_t v0;

  sub_1000053AC(v0);
}

uint64_t sub_10000830C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000834C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000713C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000838C()
{
  uint64_t v0;

  sub_1000047E0(v0);
}

uint64_t sub_100008394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100004B00(a1, a2, v2);
}

void sub_10000839C()
{
  uint64_t v0;

  sub_100004DFC(v0);
}

void sub_1000083A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_100004220(a1, a2, a3, v3);
}

uint64_t sub_1000083F8(uint64_t result)
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
  int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  __int128 v81;
  __int128 v82;

  if (result)
  {
    v2 = v1;
    v3 = result;
    if (*(_QWORD *)(result + 16))
    {
      v5 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationKey);
      v4 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationKey + 8);
      swift_bridgeObjectRetain(v4);
      v6 = sub_100009298(v5, v4);
      if ((v7 & 1) != 0)
      {
        sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v6, (uint64_t)&v81);
        swift_bridgeObjectRelease(v4);
        if (*((_QWORD *)&v82 + 1))
        {
          if ((swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
          {
            v8 = v79;
            if (!v79)
              return 0;
LABEL_12:
            v9 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDuration;
            *(_QWORD *)v9 = v8;
            *(_BYTE *)(v9 + 8) = 0;
            if (*(_QWORD *)(v3 + 16))
            {
              v11 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeaderKey);
              v10 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeaderKey + 8);
              swift_bridgeObjectRetain(v10);
              v12 = sub_100009298(v11, v10);
              if ((v13 & 1) != 0)
              {
                sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v12, (uint64_t)&v81);
              }
              else
              {
                v81 = 0u;
                v82 = 0u;
              }
              swift_bridgeObjectRelease(v10);
              if (*((_QWORD *)&v82 + 1))
              {
                v14 = swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for String, 6);
                v15 = v79;
                v16 = v80;
                if (!v14)
                {
                  v15 = 0;
                  v16 = 0;
                }
LABEL_21:
                v17 = (unint64_t *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader);
                v18 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader + 8);
                *v17 = v15;
                v17[1] = v16;
                swift_bridgeObjectRelease(v18);
                if (!v17[1])
                  return 0;
                if (*(_QWORD *)(v3 + 16))
                {
                  v20 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessageKey);
                  v19 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessageKey + 8);
                  swift_bridgeObjectRetain(v19);
                  v21 = sub_100009298(v20, v19);
                  if ((v22 & 1) != 0)
                  {
                    sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v21, (uint64_t)&v81);
                  }
                  else
                  {
                    v81 = 0u;
                    v82 = 0u;
                  }
                  swift_bridgeObjectRelease(v19);
                  if (*((_QWORD *)&v82 + 1))
                  {
                    v23 = swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for String, 6);
                    v24 = v79;
                    v25 = v80;
                    if (!v23)
                    {
                      v24 = 0;
                      v25 = 0;
                    }
LABEL_31:
                    v26 = (unint64_t *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage);
                    v27 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage + 8);
                    *v26 = v24;
                    v26[1] = v25;
                    swift_bridgeObjectRelease(v27);
                    if (!v26[1])
                      return 0;
                    if (*(_QWORD *)(v3 + 16))
                    {
                      v29 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButtonKey);
                      v28 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButtonKey + 8);
                      swift_bridgeObjectRetain(v28);
                      v30 = sub_100009298(v29, v28);
                      if ((v31 & 1) != 0)
                      {
                        sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v30, (uint64_t)&v81);
                      }
                      else
                      {
                        v81 = 0u;
                        v82 = 0u;
                      }
                      swift_bridgeObjectRelease(v28);
                      if (*((_QWORD *)&v82 + 1))
                      {
                        v32 = swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for String, 6);
                        v33 = v79;
                        v34 = v80;
                        if (!v32)
                        {
                          v33 = 0;
                          v34 = 0;
                        }
LABEL_41:
                        v35 = (unint64_t *)(v2
                                                 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton);
                        v36 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton + 8);
                        *v35 = v33;
                        v35[1] = v34;
                        swift_bridgeObjectRelease(v36);
                        if (!v35[1])
                          return 0;
                        if (*(_QWORD *)(v3 + 16))
                        {
                          v38 = *(_QWORD *)(v2
                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledKey);
                          v37 = *(_QWORD *)(v2
                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledKey
                                          + 8);
                          swift_bridgeObjectRetain(v37);
                          v39 = sub_100009298(v38, v37);
                          if ((v40 & 1) != 0)
                          {
                            sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v39, (uint64_t)&v81);
                          }
                          else
                          {
                            v81 = 0u;
                            v82 = 0u;
                          }
                          swift_bridgeObjectRelease(v37);
                          if (*((_QWORD *)&v82 + 1))
                          {
                            if ((swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0)
                            {
                              v41 = v79;
                              if (*(_QWORD *)(v3 + 16))
                              {
                                v43 = *(_QWORD *)(v2
                                                + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationKey);
                                v42 = *(_QWORD *)(v2
                                                + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationKey
                                                + 8);
                                swift_bridgeObjectRetain(v42);
                                v44 = sub_100009298(v43, v42);
                                if ((v45 & 1) != 0)
                                {
                                  sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v44, (uint64_t)&v81);
                                }
                                else
                                {
                                  v81 = 0u;
                                  v82 = 0u;
                                }
                                swift_bridgeObjectRelease(v42);
                                if (*((_QWORD *)&v82 + 1))
                                {
                                  if ((swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
                                  {
                                    v54 = v79;
                                    if (!v79)
                                      return 0;
LABEL_69:
                                    v55 = v2
                                        + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration;
                                    *(_QWORD *)v55 = v54;
                                    *(_BYTE *)(v55 + 8) = 0;
                                    if (*(_QWORD *)(v3 + 16))
                                    {
                                      v57 = *(_QWORD *)(v2
                                                      + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsKey);
                                      v56 = *(_QWORD *)(v2
                                                      + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsKey
                                                      + 8);
                                      swift_bridgeObjectRetain(v56);
                                      v58 = sub_100009298(v57, v56);
                                      if ((v59 & 1) != 0)
                                      {
                                        sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v58, (uint64_t)&v81);
                                      }
                                      else
                                      {
                                        v81 = 0u;
                                        v82 = 0u;
                                      }
                                      swift_bridgeObjectRelease(v56);
                                      if (*((_QWORD *)&v82 + 1))
                                      {
                                        if (swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
                                        {
                                          v60 = v79;
                                          goto LABEL_79;
                                        }
LABEL_78:
                                        v60 = 0;
LABEL_79:
                                        *(_BYTE *)(v2
                                                 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops) = v60;
                                        if (*(_QWORD *)(v3 + 16))
                                        {
                                          v62 = *(_QWORD *)(v2
                                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayKey);
                                          v61 = *(_QWORD *)(v2
                                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayKey
                                                          + 8);
                                          swift_bridgeObjectRetain(v61);
                                          v63 = sub_100009298(v62, v61);
                                          if ((v64 & 1) != 0)
                                          {
                                            sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v63, (uint64_t)&v81);
                                          }
                                          else
                                          {
                                            v81 = 0u;
                                            v82 = 0u;
                                          }
                                          swift_bridgeObjectRelease(v61);
                                          if (*((_QWORD *)&v82 + 1))
                                          {
                                            if ((swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
                                            {
                                              v65 = v79;
                                              goto LABEL_89;
                                            }
LABEL_88:
                                            v65 = 10;
LABEL_89:
                                            v66 = v2
                                                + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay;
                                            *(_QWORD *)v66 = v65;
                                            *(_BYTE *)(v66 + 8) = 0;
                                            if (*(_QWORD *)(v3 + 16))
                                            {
                                              v68 = *(_QWORD *)(v2
                                                              + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundIDKey);
                                              v67 = *(_QWORD *)(v2
                                                              + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundIDKey
                                                              + 8);
                                              swift_bridgeObjectRetain(v67);
                                              v69 = sub_100009298(v68, v67);
                                              if ((v70 & 1) != 0)
                                              {
                                                sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v69, (uint64_t)&v81);
                                              }
                                              else
                                              {
                                                v81 = 0u;
                                                v82 = 0u;
                                              }
                                              swift_bridgeObjectRelease(v67);
                                              if (*((_QWORD *)&v82 + 1))
                                              {
                                                if ((swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for UInt32, 6) & 1) != 0)
                                                {
                                                  v71 = v2
                                                      + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID;
                                                  *(_DWORD *)v71 = v79;
                                                  *(_BYTE *)(v71 + 4) = 0;
                                                  *(_BYTE *)(v2
                                                           + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled) = v41;
                                                  if (!*(_QWORD *)(v3 + 16))
                                                    goto LABEL_97;
                                                  goto LABEL_54;
                                                }
                                                return 0;
                                              }
                                            }
                                            else
                                            {
                                              v81 = 0u;
                                              v82 = 0u;
                                            }
                                            sub_1000092FC((uint64_t)&v81);
                                            return 0;
                                          }
                                        }
                                        else
                                        {
                                          v81 = 0u;
                                          v82 = 0u;
                                        }
                                        sub_1000092FC((uint64_t)&v81);
                                        goto LABEL_88;
                                      }
                                    }
                                    else
                                    {
                                      v81 = 0u;
                                      v82 = 0u;
                                    }
                                    sub_1000092FC((uint64_t)&v81);
                                    goto LABEL_78;
                                  }
LABEL_68:
                                  v54 = 10;
                                  goto LABEL_69;
                                }
                              }
                              else
                              {
                                v81 = 0u;
                                v82 = 0u;
                              }
                              sub_1000092FC((uint64_t)&v81);
                              goto LABEL_68;
                            }
LABEL_53:
                            *(_BYTE *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled) = 0;
                            v46 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration;
                            *(_QWORD *)v46 = 10;
                            *(_BYTE *)(v46 + 8) = 0;
                            *(_BYTE *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops) = 0;
                            v47 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay;
                            *(_QWORD *)v47 = 10;
                            *(_BYTE *)(v47 + 8) = 0;
                            v48 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID;
                            *(_DWORD *)v48 = 0;
                            *(_BYTE *)(v48 + 4) = 0;
                            if (!*(_QWORD *)(v3 + 16))
                            {
LABEL_97:
                              v81 = 0u;
                              v82 = 0u;
                              goto LABEL_98;
                            }
LABEL_54:
                            v50 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey);
                            v49 = *(_QWORD *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey + 8);
                            swift_bridgeObjectRetain(v49);
                            v51 = sub_100009298(v50, v49);
                            if ((v52 & 1) != 0)
                            {
                              sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v51, (uint64_t)&v81);
                            }
                            else
                            {
                              v81 = 0u;
                              v82 = 0u;
                            }
                            swift_bridgeObjectRelease(v49);
                            if (*((_QWORD *)&v82 + 1))
                            {
                              if ((swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
                              {
                                v53 = v79;
                                if (!v79)
                                  return 0;
LABEL_100:
                                v72 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeout;
                                *(_QWORD *)v72 = v53;
                                *(_BYTE *)(v72 + 8) = 0;
                                if (*(_QWORD *)(v3 + 16))
                                {
                                  v74 = *(_QWORD *)(v2
                                                  + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationKey);
                                  v73 = *(_QWORD *)(v2
                                                  + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationKey
                                                  + 8);
                                  swift_bridgeObjectRetain(v73);
                                  v75 = sub_100009298(v74, v73);
                                  if ((v76 & 1) != 0)
                                  {
                                    sub_1000082C0(*(_QWORD *)(v3 + 56) + 32 * v75, (uint64_t)&v81);
                                  }
                                  else
                                  {
                                    v81 = 0u;
                                    v82 = 0u;
                                  }
                                  swift_bridgeObjectRelease(v73);
                                  if (*((_QWORD *)&v82 + 1))
                                  {
                                    if ((swift_dynamicCast(&v79, &v81, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
                                    {
                                      v77 = v79;
                                      if (*(_QWORD *)(v2
                                                     + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMax) < v79
                                        || v79 < *(_QWORD *)(v2
                                                           + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMin))
                                      {
                                        return 0;
                                      }
LABEL_112:
                                      v78 = v2
                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDuration;
                                      *(_QWORD *)v78 = v77;
                                      *(_BYTE *)(v78 + 8) = 0;
                                      return 1;
                                    }
LABEL_111:
                                    v77 = *(_QWORD *)(v2
                                                    + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationDefault);
                                    goto LABEL_112;
                                  }
                                }
                                else
                                {
                                  v81 = 0u;
                                  v82 = 0u;
                                }
                                sub_1000092FC((uint64_t)&v81);
                                goto LABEL_111;
                              }
LABEL_99:
                              v53 = 60;
                              goto LABEL_100;
                            }
LABEL_98:
                            sub_1000092FC((uint64_t)&v81);
                            goto LABEL_99;
                          }
                        }
                        else
                        {
                          v81 = 0u;
                          v82 = 0u;
                        }
                        sub_1000092FC((uint64_t)&v81);
                        goto LABEL_53;
                      }
                    }
                    else
                    {
                      v81 = 0u;
                      v82 = 0u;
                    }
                    sub_1000092FC((uint64_t)&v81);
                    v33 = 0;
                    v34 = 0;
                    goto LABEL_41;
                  }
                }
                else
                {
                  v81 = 0u;
                  v82 = 0u;
                }
                sub_1000092FC((uint64_t)&v81);
                v24 = 0;
                v25 = 0;
                goto LABEL_31;
              }
            }
            else
            {
              v81 = 0u;
              v82 = 0u;
            }
            sub_1000092FC((uint64_t)&v81);
            v15 = 0;
            v16 = 0;
            goto LABEL_21;
          }
LABEL_11:
          v8 = 30;
          goto LABEL_12;
        }
      }
      else
      {
        v81 = 0u;
        v82 = 0u;
        swift_bridgeObjectRelease(v4);
      }
    }
    else
    {
      v81 = 0u;
      v82 = 0u;
    }
    sub_1000092FC((uint64_t)&v81);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

id sub_100008D60()
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
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  objc_super v22;

  v1 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationKey];
  *(_QWORD *)v1 = 0xD00000000000001ALL;
  *((_QWORD *)v1 + 1) = 0x800000010000AA10;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationMin] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationMax] = -1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationDefault] = 30;
  v2 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeaderKey];
  *(_QWORD *)v2 = 0xD000000000000012;
  *((_QWORD *)v2 + 1) = 0x800000010000AA30;
  v3 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessageKey];
  *(_QWORD *)v3 = 0xD000000000000013;
  *((_QWORD *)v3 + 1) = 0x800000010000AA50;
  v4 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButtonKey];
  *(_QWORD *)v4 = 0xD000000000000012;
  *((_QWORD *)v4 + 1) = 0x800000010000AA70;
  v5 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey];
  strcpy(&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey], "resultTimeout");
  *((_WORD *)v5 + 7) = -4864;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutMin] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutMax] = -1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutDefault] = 60;
  v6 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledKey];
  *(_QWORD *)v6 = 0xD000000000000018;
  *((_QWORD *)v6 + 1) = 0x800000010000AAA0;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledDefault] = 0;
  v7 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsKey];
  *(_QWORD *)v7 = 0xD000000000000016;
  *((_QWORD *)v7 + 1) = 0x800000010000AB60;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsDefault] = 0;
  v8 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationKey];
  *(_QWORD *)v8 = 0xD000000000000019;
  *((_QWORD *)v8 + 1) = 0x800000010000AAC0;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationMin] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationMax] = -1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationDefault] = 10;
  v9 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayKey];
  *(_QWORD *)v9 = 0xD00000000000001ALL;
  *((_QWORD *)v9 + 1) = 0x800000010000AB00;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayMin] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayMax] = -1;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayDefault] = 10;
  v10 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundIDKey];
  *(_QWORD *)v10 = 0xD000000000000013;
  *((_QWORD *)v10 + 1) = 0x800000010000AB20;
  v11 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationKey];
  *(_QWORD *)v11 = 0xD00000000000001BLL;
  *((_QWORD *)v11 + 1) = 0x800000010000AB40;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMin] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMax] = 60;
  *(_QWORD *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationDefault] = 0;
  v12 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDuration];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeout];
  *(_QWORD *)v16 = 0;
  v16[8] = 1;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled] = 2;
  v17 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration];
  *(_QWORD *)v17 = 0;
  v17[8] = 1;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops] = 2;
  v18 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay];
  *(_QWORD *)v18 = 0;
  v18[8] = 1;
  v19 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID];
  *(_DWORD *)v19 = 0;
  v19[4] = 1;
  v20 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDuration];
  *(_QWORD *)v20 = 0;
  v20[8] = 1;
  v22.receiver = v0;
  v22.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticMonitorInputs();
  return objc_msgSendSuper2(&v22, "init");
}

id sub_1000090E8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticMonitorInputs();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticMonitorInputs()
{
  return objc_opt_self(OnDemandAudioDiagnosticMonitorInputs);
}

unint64_t sub_100009268(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000933C(a1, v4);
}

unint64_t sub_100009298(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100009400(a1, a2, v5);
}

uint64_t sub_1000092FC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000070FC((uint64_t *)&unk_1000119E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000933C(uint64_t a1, uint64_t a2)
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
      sub_100008264(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000079B0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100009400(uint64_t a1, uint64_t a2, uint64_t a3)
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
