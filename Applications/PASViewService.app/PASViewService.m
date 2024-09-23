double variable initialization expression of PASVSSetupFlowController.targetDevice@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t variable initialization expression of PASVSSetupFlowController.delegate()
{
  return 0;
}

_QWORD *PASVSSetupFlowController.deinit()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_unknownObjectRelease(v0[4]);
  sub_100006884((uint64_t)(v0 + 5), &qword_10001E2F0);
  sub_100006884((uint64_t)(v0 + 12), &qword_10001DE50);
  sub_1000041B0((uint64_t)(v0 + 17));
  sub_100008098(v0 + 19);
  return v0;
}

uint64_t sub_100004170(uint64_t *a1)
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

uint64_t sub_1000041B0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t PASVSSetupFlowController.__deallocating_deinit()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_unknownObjectRelease(v0[4]);
  sub_100006884((uint64_t)(v0 + 5), &qword_10001E2F0);
  sub_100006884((uint64_t)(v0 + 12), &qword_10001DE50);
  sub_1000041B0((uint64_t)(v0 + 17));
  sub_100008098(v0 + 19);
  return swift_deallocClassInstance(v0, 192, 7);
}

Swift::Void __swiftcall PASVSSetupFlowController.initiateClientConnectionIfEligible()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_100004170(&qword_10001E310);
  __chkstk_darwin(v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = PASLogger.viewService.unsafeMutableAddressor(v7);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v10, v5);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "PASVSSetupFlowController initiateClientConnectionIfEligible", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v4, 1, 1, v15);
  type metadata accessor for MainActor(0);
  v16 = swift_retain(v1);
  v17 = static MainActor.shared.getter(v16);
  v18 = (_QWORD *)swift_allocObject(&unk_100018920, 40, 7);
  v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = v1;
  v19 = sub_100004970((uint64_t)v4, (uint64_t)&unk_10001DE60, (uint64_t)v18);
  swift_release(v19);
}

uint64_t sub_1000043E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[2] = a4;
  v5 = type metadata accessor for Logger(0);
  v4[3] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[4] = v6;
  v4[5] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0);
  v4[6] = static MainActor.shared.getter();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v4[7] = v8;
  v4[8] = v9;
  return swift_task_switch(sub_10000447C, v8, v9);
}

uint64_t sub_10000447C()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 16) + 136);
  *(_QWORD *)(v0 + 72) = Strong;
  if (Strong)
  {
    v2 = unk_10001E5C4;
    v8 = (uint64_t (*)(void))((char *)&dword_10001E5C0 + dword_10001E5C0);
    swift_retain(*(_QWORD *)(v0 + 16));
    v3 = (_QWORD *)swift_task_alloc(v2);
    *(_QWORD *)(v0 + 80) = v3;
    *v3 = v0;
    v3[1] = sub_100004560;
    return v8();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 48);
    swift_retain(*(_QWORD *)(v0 + 16));
    swift_release(v5);
    v6 = *(_QWORD *)(v0 + 16);
    v7 = swift_retain_n(v6, 2);
    sub_100007618(v7, v6, (uint64_t)sub_100006954, v6);
    swift_release_n(v6, 3);
    swift_task_dealloc(*(_QWORD *)(v0 + 40));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100004560(char a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 80);
  *(_BYTE *)(*v1 + 88) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_1000045B8, *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64));
}

uint64_t sub_1000045B8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v1 = *(_BYTE *)(v0 + 88);
  v2 = swift_release(*(_QWORD *)(v0 + 48));
  if ((v1 & 1) != 0)
  {
    swift_unknownObjectRelease(*(_QWORD *)(v0 + 72));
    v3 = *(_QWORD *)(v0 + 16);
    v4 = swift_retain_n(v3, 2);
    sub_100007618(v4, v3, (uint64_t)sub_100006954, v3);
    swift_release_n(v3, 3);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 24);
    v8 = PASLogger.viewService.unsafeMutableAddressor(v2);
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "PASVSSetupFlowController initiateClientConnectionIfEligible skipping local authentication per delegate", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }
    v14 = *(_QWORD *)(v0 + 32);
    v13 = *(_QWORD *)(v0 + 40);
    v16 = *(_QWORD *)(v0 + 16);
    v15 = *(_QWORD *)(v0 + 24);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    v17 = objc_msgSend(*(id *)(v16 + 32), "delegate");
    v18 = *(_QWORD *)(v0 + 72);
    v19 = *(_QWORD *)(v0 + 16);
    if (v17)
    {
      v20 = v17;
      objc_msgSend(v17, "activateClientConnection");
      swift_unknownObjectRelease(v20);
    }
    swift_unknownObjectRelease(v18);
    swift_release(v19);
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004734()
{
  return sub_100007EA4((void (*)(_QWORD))&_swift_unknownObjectRelease);
}

uint64_t sub_100004740(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10001DE5C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1000082E8;
  return sub_1000043E8(a1, v4, v5, v6);
}

BOOL sub_1000047AC(uint64_t a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "activateClientConnection");
    swift_unknownObjectRelease(v2);
  }
  return v2 == 0;
}

uint64_t sub_100004804(char a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_100004170(&qword_10001E310);
  result = __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    Strong = swift_unknownObjectWeakLoadStrong(a2 + 136);
    if (Strong)
    {
      v11 = Strong;
      v12 = *(void **)(Strong + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension);
      if (v12)
      {
        v13 = *(void **)(Strong + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension + 8);
        v14 = type metadata accessor for TaskPriority(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
        type metadata accessor for MainActor(0);
        sub_1000080F4(v12, v13);
        swift_retain(v12);
        v15 = v13;
        v16 = static MainActor.shared.getter();
        v17 = (_QWORD *)swift_allocObject(&unk_100018B40, 48, 7);
        v17[2] = v16;
        v17[3] = &protocol witness table for MainActor;
        v17[4] = v12;
        v17[5] = v15;
        v18 = sub_100004970((uint64_t)v9, (uint64_t)&unk_10001DFC8, (uint64_t)v17);
        swift_unknownObjectRelease(v11);
        swift_release(v18);

        Strong = swift_release(v12);
      }
      else
      {
        Strong = swift_unknownObjectRelease(Strong);
      }
    }
    return a3(Strong);
  }
  return result;
}

uint64_t sub_100004970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100006884(a1, &qword_10001E310);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100018AA0, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_10001DFB0, v17);
}

uint64_t sub_100004AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(BOOL), uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  void *v45;
  Swift::String v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t ObjCClassFromMetadata;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  NSString v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NSString v59;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(BOOL);
  unint64_t v70;
  unint64_t v71;

  v68 = a7;
  v69 = a6;
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Logger(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v61 - v23;
  v25 = PASLogger.common.unsafeMutableAddressor(v22);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  if (a2)
  {
    v66 = a3;
    v26(v21, v25, v17);
    swift_errorRetain(a2);
    v27 = swift_errorRetain(a2);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.error.getter();
    v30 = os_log_type_enabled(v28, v29);
    v67 = a2;
    if (v30)
    {
      v65 = v13;
      v31 = a2;
      v32 = swift_slowAlloc(12, -1);
      v62 = a4;
      v33 = (uint8_t *)v32;
      v34 = swift_slowAlloc(8, -1);
      v61 = v17;
      v35 = (_QWORD *)v34;
      v63 = a5;
      v64 = v16;
      *(_DWORD *)v33 = 138543362;
      swift_errorRetain(a2);
      v36 = _swift_stdlib_bridgeErrorToNSError(a2);
      v70 = v36;
      a5 = v63;
      v16 = v64;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71);
      *v35 = v36;
      v37 = v35;
      v17 = v61;
      swift_errorRelease(v31);
      v38 = v31;
      v13 = v65;
      swift_errorRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Local authentication failed with error %{public}@", v33, 0xCu);
      v39 = sub_100004170(&qword_10001DE68);
      swift_arrayDestroy(v37, 1, v39);
      swift_slowDealloc(v37, -1, -1);
      v40 = v33;
      a4 = v62;
      swift_slowDealloc(v40, -1, -1);
    }
    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    v45 = *(void **)(v66 + 32);
    v70 = 0;
    v71 = 0xE000000000000000;
    _StringGuts.grow(_:)(32);
    swift_bridgeObjectRelease(v71);
    v70 = 0xD00000000000001ELL;
    v71 = 0x8000000100016000;
    v46._countAndFlagsBits = a4;
    v46._object = a5;
    String.append(_:)(v46);
    v47 = v70;
    v48 = v71;
    swift_bridgeObjectRetain(v71);
    String.LocalizationValue.init(_:)(v47, v48);
    v49 = type metadata accessor for PASVSPrimaryViewController();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v49);
    v51 = (void *)objc_opt_self(NSBundle);
    v52 = objc_msgSend(v51, "bundleForClass:", ObjCClassFromMetadata);
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)(v16, 0, 0, v52, v13, 0, 0, 256);
    v54 = v53;
    swift_bridgeObjectRelease(v48);
    v55 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v54);
    String.LocalizationValue.init(_:)(0xD00000000000001FLL, 0x8000000100016020);
    v56 = objc_msgSend(v51, "bundleForClass:", ObjCClassFromMetadata);
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)(v16, 0, 0, v56, v13, 0, 0, 256);
    v58 = v57;
    v59 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v58);
    objc_msgSend(v45, "showErrorWithTitle:message:", v55, v59);

    a2 = v67;
  }
  else
  {
    v41 = ((uint64_t (*)(char *, uint64_t, uint64_t))v26)(v24, v25, v17);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Local authentication succeeded continue with setup", v44, 2u);
      swift_slowDealloc(v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
  }
  return v69(a2 == 0);
}

uint64_t sub_100004F8C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v7 = a3;
  v5(v6, a3);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

Swift::Void __swiftcall PASVSSetupFlowController.activateClientConnection()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t ObjectType;
  void (*v14)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = PASLogger.viewService.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "PASVSSetupFlowController activateClientConnection", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType(*(_QWORD *)(v1 + 16));
  v14 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v12 + 88);
  swift_retain(v1);
  v14(sub_10000655C, v1, ObjectType, v12);
  (*(void (**)(uint64_t, uint64_t))(v12 + 136))(ObjectType, v12);
}

void sub_100005168(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint8_t *v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject **v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  void (*v40)(char *, uint64_t);
  int v41;
  char *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void *v47;
  char *v48;
  uint64_t v49;
  uint64_t ObjCClassFromMetadata;
  void *v51;
  id v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  NSString v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  NSString v60;
  uint64_t v61;
  uint64_t ObjectType;
  int v63;
  void *v64;
  char *v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  char *v70;
  id v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  _QWORD *v87;
  uint8_t *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  NSObject **v105;
  char *v106;
  _QWORD *v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  char *v113;
  char *v114;
  _QWORD *v115;
  uint8_t *v116;
  void (*v117)(char *, uint64_t);
  NSObject *v118;
  uint64_t v119;

  v2 = v1;
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004170(&qword_10001E310);
  __chkstk_darwin(v10);
  v108 = (char *)&v104 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v14);
  v111 = (char *)&v104 - v18;
  v19 = __chkstk_darwin(v17);
  v110 = (char *)&v104 - v20;
  v21 = __chkstk_darwin(v19);
  v109 = (char *)&v104 - v22;
  v23 = __chkstk_darwin(v21);
  v114 = (char *)&v104 - v24;
  v25 = __chkstk_darwin(v23);
  v27 = (char *)&v104 - v26;
  v28 = PASLogger.viewService.unsafeMutableAddressor(v25);
  v117 = (void (*)(char *, uint64_t))v13;
  v29 = *(uint8_t **)(v13 + 16);
  v115 = (_QWORD *)v28;
  ((void (*)(char *))v29)(v27);
  v30 = a1;
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.info.getter();
  v33 = os_log_type_enabled(v31, v32);
  v112 = v9;
  v113 = v6;
  v116 = v29;
  if (v33)
  {
    v34 = (uint8_t *)swift_slowAlloc(12, -1);
    v105 = (NSObject **)swift_slowAlloc(8, -1);
    v107 = v2;
    *(_DWORD *)v34 = 138543362;
    v118 = v30;
    v35 = v30;
    v106 = v16;
    v36 = v35;
    v2 = v107;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119);
    v37 = v105;
    *v105 = v30;

    v16 = v106;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "PASVSSetupFlowController SKEventHandler invoked for event: %{public}@", v34, 0xCu);
    v38 = sub_100004170(&qword_10001DE68);
    swift_arrayDestroy(v37, 1, v38);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v34, -1, -1);
  }
  else
  {

    v31 = v30;
  }
  v39 = v117;

  v40 = (void (*)(char *, uint64_t))*((_QWORD *)v39 + 1);
  v40(v27, v12);
  v41 = -[NSObject eventType](v30, "eventType");
  if (v41 <= 119)
  {
    if (v41 == 30)
    {
      v65 = v110;
      v66 = ((uint64_t (*)(char *, _QWORD *, uint64_t))v116)(v110, v115, v12);
      v67 = Logger.logObject.getter(v66);
      v68 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v69 = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "PASVSSetupFlowController: Exiting PASViewService", v69, 2u);
        swift_slowDealloc(v69, -1, -1);
      }

      v70 = v65;
      goto LABEL_31;
    }
    if (v41 == 41)
    {
      v42 = v111;
      v43 = ((uint64_t (*)(char *, _QWORD *, uint64_t))v116)(v111, v115, v12);
      v44 = Logger.logObject.getter(v43);
      v45 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Triggering error flow", v46, 2u);
        swift_slowDealloc(v46, -1, -1);
      }

      v40(v42, v12);
      v47 = (void *)v2[4];
      v48 = v112;
      String.LocalizationValue.init(_:)(0xD000000000000013, 0x8000000100015F30);
      v49 = type metadata accessor for PASVSPrimaryViewController();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v49);
      v51 = (void *)objc_opt_self(NSBundle);
      v52 = objc_msgSend(v51, "bundleForClass:", ObjCClassFromMetadata);
      v53 = v113;
      static Locale.current.getter();
      String.init(localized:table:bundle:locale:comment:)(v48, 0, 0, v52, v53, 0, 0, 256);
      v55 = v54;
      v56 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v55);
      String.LocalizationValue.init(_:)(0xD000000000000015, 0x8000000100015F50);
      v57 = objc_msgSend(v51, "bundleForClass:", ObjCClassFromMetadata);
      static Locale.current.getter();
      String.init(localized:table:bundle:locale:comment:)(v48, 0, 0, v57, v53, 0, 0, 256);
      v59 = v58;
      v60 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v59);
      objc_msgSend(v47, "showErrorWithTitle:message:", v56, v60);

      return;
    }
    goto LABEL_20;
  }
  if (v41 != 140)
  {
    if (v41 == 120)
    {
      v61 = v2[3];
      ObjectType = swift_getObjectType(v2[2]);
      v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 32))(ObjectType, v61);
      v64 = (void *)v2[4];
      if (v63 == 3)
        objc_msgSend(v64, "showPinEntryError");
      else
        objc_msgSend(v64, "authRequested");
      return;
    }
LABEL_20:
    ((void (*)(char *, _QWORD *, uint64_t))v116)(v16, v115, v12);
    v80 = v30;
    v81 = Logger.logObject.getter(v80);
    v82 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v81, v82))
    {
      v83 = (uint8_t *)swift_slowAlloc(12, -1);
      v115 = (_QWORD *)swift_slowAlloc(8, -1);
      v116 = v83;
      *(_DWORD *)v83 = 138543362;
      v118 = v80;
      v84 = v80;
      v117 = v40;
      v85 = v12;
      v86 = v84;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119);
      v87 = v115;
      *v115 = v80;

      v12 = v85;
      v88 = v116;
      v40 = v117;
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "PASVSSetupFlowController: Got unhandled event %{public}@", v116, 0xCu);
      v89 = sub_100004170(&qword_10001DE68);
      swift_arrayDestroy(v87, 1, v89);
      swift_slowDealloc(v87, -1, -1);
      swift_slowDealloc(v88, -1, -1);
    }
    else
    {

      v81 = v80;
    }

    v70 = v16;
LABEL_31:
    v40(v70, v12);
    return;
  }
  v71 = -[NSObject error](v30, "error");
  if (v71)
  {
    v72 = v71;
    ((void (*)(char *, _QWORD *, uint64_t))v116)(v114, v115, v12);
    v73 = v72;
    v74 = Logger.logObject.getter(v73);
    v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc(12, -1);
      v77 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v76 = 138543362;
      v73 = v73;
      v78 = _swift_stdlib_bridgeErrorToNSError(v73);
      v118 = v78;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119);
      *v77 = v78;

      _os_log_impl((void *)&_mh_execute_header, v74, v75, "PASVSSetupFlowController: Pairing completed with error: %{public}@", v76, 0xCu);
      v79 = sub_100004170(&qword_10001DE68);
      swift_arrayDestroy(v77, 1, v79);
      swift_slowDealloc(v77, -1, -1);
      swift_slowDealloc(v76, -1, -1);
    }
    else
    {

      v74 = v73;
    }

    v70 = v114;
    goto LABEL_31;
  }
  v90 = v109;
  v91 = ((uint64_t (*)(char *, _QWORD *, uint64_t))v116)(v109, v115, v12);
  v92 = Logger.logObject.getter(v91);
  v93 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v92, v93))
  {
    v94 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v94 = 0;
    _os_log_impl((void *)&_mh_execute_header, v92, v93, "PASVSSetupFlowController: Activating Message Session", v94, 2u);
    swift_slowDealloc(v94, -1, -1);
  }

  v40(v90, v12);
  v95 = v2[3];
  v96 = swift_getObjectType(v2[2]);
  v97 = (*(uint64_t (**)(uint64_t, uint64_t))(v95 + 128))(v96, v95);
  if (v97)
  {
    v98 = (void *)v97;
    v99 = type metadata accessor for TaskPriority(0);
    v100 = (uint64_t)v108;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v108, 1, 1, v99);
    v101 = (_QWORD *)swift_allocObject(&unk_100018A60, 48, 7);
    v101[2] = 0;
    v101[3] = 0;
    v101[4] = v2;
    v101[5] = v98;
    swift_retain(v2);
    v102 = v98;
    v103 = sub_100004970(v100, (uint64_t)&unk_10001DFA0, (uint64_t)v101);

    swift_release(v103);
  }
}

Swift::Void __swiftcall PASVSSetupFlowController.handleScannedCode(_:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject **v22;
  uint64_t v23;
  uint64_t v24;
  NSObject **v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  object = a1._object;
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone((Class)SKAuthenticationResponseEvent);
  swift_bridgeObjectRetain(object);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v9 = objc_msgSend(v7, "initWithPassword:", v8);

  v10 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType(*(_QWORD *)(v1 + 16));
  v12 = (*(uint64_t (**)(id, uint64_t, uint64_t))(v10 + 144))(v9, ObjectType, v10);
  v13 = PASLogger.viewService.unsafeMutableAddressor(v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  v14 = v9;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(22, -1);
    v25 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v17 = 141558274;
    v27 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
    *(_WORD *)(v17 + 12) = 2112;
    v27 = (uint64_t)v14;
    v18 = v14;
    v26 = v6;
    v19 = v4;
    v20 = v3;
    v21 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
    v22 = v25;
    *v25 = v14;

    v3 = v20;
    v4 = v19;
    v6 = v26;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "PASVSSetupFlowController post pairing code: %{mask.hash}@", (uint8_t *)v17, 0x16u);
    v23 = sub_100004170(&qword_10001DE68);
    swift_arrayDestroy(v22, 1, v23);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v17, -1, -1);
  }
  else
  {

    v15 = v14;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Void __swiftcall PASVSSetupFlowController.enableManualPairing()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = PASLogger.viewService.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "PASVSSetupFlowController manual pairing mode enabled...", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType(*(_QWORD *)(v1 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(3, ObjectType, v12);
  objc_msgSend(*(id *)(v1 + 32), "showManualPinEntry");
}

Swift::Void __swiftcall PASVSSetupFlowController.invalidateClientConnection()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = PASLogger.viewService.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "PASVSSetupFlowController Connection ended, invalidate server", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v13 = *(_QWORD *)(v1 + 16);
  v12 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType(v13);
  (*(void (**)(uint64_t, uint64_t))(v12 + 152))(ObjectType, v12);
}

uint64_t sub_100006070(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;

  v5 = swift_retain(a1);
  a3(v5);
  return swift_release(a1);
}

uint64_t sub_10000609C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 120) = a4;
  *(_QWORD *)(v5 + 128) = a5;
  return swift_task_switch(sub_1000060B4, 0, 0);
}

uint64_t sub_1000060B4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0 + 2;
  v2 = v0[16];
  v3 = *(void **)(v0[15] + 32);
  v0[2] = v0;
  v0[3] = sub_100006150;
  v4 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_1000061A4;
  v5[3] = &unk_100018A78;
  v5[4] = v4;
  objc_msgSend(v3, "authCompleted:completionHandler:", v2, v5);
  return swift_continuation_await(v1);
}

uint64_t sub_100006150()
{
  return swift_task_switch(sub_10000619C, 0, 0);
}

uint64_t sub_10000619C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000061A4(uint64_t a1)
{
  return swift_continuation_resume(*(_QWORD *)(a1 + 32));
}

void sub_1000061AC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000061B8(uint64_t a1, uint64_t a2)
{
  return sub_100006300(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000061C4(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100006238(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_1000062B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_1000062F4(uint64_t a1, uint64_t a2)
{
  return sub_100006300(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100006300(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10000633C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000637C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000063EC(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100006474@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000064B8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000064E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100008284((unint64_t *)&qword_10001DFF8, (uint64_t)&unk_100012DE4);
  v3 = sub_100008284(&qword_10001E000, (uint64_t)&unk_100012D38);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000654C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100006560(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100006594(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000065F8;
  return v6(a1);
}

uint64_t sub_1000065F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_BYTE **sub_100006644(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_100006654(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

void *sub_100006704(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_100006798(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t type metadata accessor for PASVSSetupFlowController()
{
  return objc_opt_self(_TtC14PASViewService24PASVSSetupFlowController);
}

uint64_t sub_1000067DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc(dword_10001DF9C);
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_10000683C;
  *(_OWORD *)(v2 + 120) = v3;
  return swift_task_switch(sub_1000060B4, 0, 0);
}

uint64_t sub_10000683C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100006884(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004170(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000068C0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000068E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001DFAC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000683C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001DFA8 + dword_10001DFA8))(a1, v4);
}

BOOL sub_100006954()
{
  uint64_t v0;

  return sub_1000047AC(v0);
}

uint64_t sub_10000695C(uint64_t a1, uint64_t a2)
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
  sub_100004170(&qword_10001DFC0);
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
      sub_100008018((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v21), v38);
    }
    else
    {
      sub_10000805C(v26, (uint64_t)&v39);
      sub_1000080B8(*(_QWORD *)(v5 + 56) + 32 * v21, (uint64_t)v38);
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
    result = (uint64_t)sub_100008018(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v16));
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

_OWORD *sub_100006C70(_OWORD *a1, uint64_t a2, char a3)
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
  v10 = sub_10001162C(a2);
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
        sub_100008098(v17);
        return sub_100008018(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100006E20();
      goto LABEL_7;
    }
    sub_10000695C(v13, a3 & 1);
    v19 = sub_10001162C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10000805C(a2, (uint64_t)v21);
      return sub_100006DA8(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

_OWORD *sub_100006DA8(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
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
  result = sub_100008018(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_100006E20()
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
  sub_100004170(&qword_10001DFC0);
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
    sub_10000805C(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1000080B8(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_100008018(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
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

unint64_t sub_100007004(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t inited;
  Swift::String v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t ObjCClassFromMetadata;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  __int128 v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v54;
  uint64_t v55;
  Swift::String v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _OWORD v60[2];
  __int128 v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  _BYTE v65[88];

  v58 = type metadata accessor for Logger(0);
  v57 = *(_QWORD *)(v58 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v54 - v9;
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100004170(&qword_10001DFB8);
  inited = swift_initStackObject(v17, v65);
  *(_OWORD *)(inited + 16) = xmmword_100012BB0;
  LODWORD(v63) = 1037;
  AnyHashable.init<A>(_:)(&v63, &type metadata for Int32, &protocol witness table for Int32);
  v63 = 0;
  v64 = 0xE000000000000000;
  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease(v64);
  v63 = 0xD00000000000001DLL;
  v64 = 0x8000000100016040;
  v56._countAndFlagsBits = a1;
  v19._countAndFlagsBits = a1;
  v56._object = a2;
  v19._object = a2;
  String.append(_:)(v19);
  v21 = v63;
  v20 = v64;
  swift_bridgeObjectRetain(v64);
  String.LocalizationValue.init(_:)(v21, v20);
  v22 = type metadata accessor for PASVSPrimaryViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v22);
  v24 = (void *)objc_opt_self(NSBundle);
  v55 = ObjCClassFromMetadata;
  v25 = objc_msgSend(v24, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  v26 = String.init(localized:table:bundle:locale:comment:)(v16, 0, 0, v25, v13, 0, 0, 256);
  v28 = v27;
  swift_bridgeObjectRelease(v20);
  *(_QWORD *)(inited + 96) = &type metadata for String;
  *(_QWORD *)(inited + 72) = v26;
  *(_QWORD *)(inited + 80) = v28;
  v29 = sub_10000DB78(inited);
  v30 = objc_msgSend((id)objc_opt_self(LARatchetManager), "sharedInstance");
  LODWORD(v20) = objc_msgSend(v30, "isFeatureEnabled");

  if ((_DWORD)v20)
  {
    LODWORD(v61) = 1061;
    AnyHashable.init<A>(_:)(&v61, &type metadata for Int32, &protocol witness table for Int32);
    v62 = &type metadata for Bool;
    LOBYTE(v61) = 1;
    sub_100008018(&v61, v60);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v29);
    v59 = v29;
    sub_100006C70(v60, (uint64_t)&v63, isUniquelyReferenced_nonNull_native);
    v29 = v59;
    swift_bridgeObjectRelease(0x8000000000000000);
    v31 = sub_100008028((uint64_t)&v63);
  }
  if (a3 == 2)
  {
    v46 = PASLogger.viewService.unsafeMutableAddressor(v31);
    v47 = v57;
    v48 = v58;
    v49 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 16))(v8, v46, v58);
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "PASVSSetupFlowController Biometric type is face id", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v47 + 8))(v8, v48);
  }
  else if (a3 == 1)
  {
    v33 = PASLogger.viewService.unsafeMutableAddressor(v31);
    v34 = v57;
    v35 = v58;
    v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 16))(v10, v33, v58);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "PASVSSetupFlowController Biometric type is touch id", v39, 2u);
      swift_slowDealloc(v39, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v35);
    LODWORD(v61) = 1030;
    AnyHashable.init<A>(_:)(&v61, &type metadata for Int32, &protocol witness table for Int32);
    *(_QWORD *)&v61 = 0;
    *((_QWORD *)&v61 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease(*((_QWORD *)&v61 + 1));
    *(_QWORD *)&v61 = 0xD00000000000001BLL;
    *((_QWORD *)&v61 + 1) = 0x8000000100016060;
    String.append(_:)(v56);
    v40 = v61;
    swift_bridgeObjectRetain(*((_QWORD *)&v61 + 1));
    String.LocalizationValue.init(_:)(v40, *((_QWORD *)&v40 + 1));
    v41 = objc_msgSend(v24, "bundleForClass:", v55);
    static Locale.current.getter();
    v42 = String.init(localized:table:bundle:locale:comment:)(v16, 0, 0, v41, v13, 0, 0, 256);
    v44 = v43;
    swift_bridgeObjectRelease(*((_QWORD *)&v40 + 1));
    v62 = &type metadata for String;
    *(_QWORD *)&v61 = v42;
    *((_QWORD *)&v61 + 1) = v44;
    sub_100008018(&v61, v60);
    v45 = swift_isUniquelyReferenced_nonNull_native(v29);
    v59 = v29;
    sub_100006C70(v60, (uint64_t)&v63, v45);
    v29 = v59;
    swift_bridgeObjectRelease(0x8000000000000000);
    sub_100008028((uint64_t)&v63);
  }
  return v29;
}

void sub_100007618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  void *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  void ***v41;
  void **v42;
  void **v43;
  _QWORD *v44;
  id v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  NSDictionary v49;
  _QWORD *v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  Swift::String v59;
  void **v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t ObjCClassFromMetadata;
  void *v65;
  id v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  void *v74;
  char *v75;
  id v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  NSString v80;
  void **v81;
  uint8_t *v82;
  void ***v83;
  id v84;
  _QWORD *v85;
  char *v86;
  char *v87;
  void **aBlock;
  _QWORD v89[2];
  void *v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  _QWORD *v92;
  _BYTE v93[24];
  void **v94;

  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8);
  v87 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v86 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v82 - v17;
  v19 = (_QWORD *)swift_allocObject(&unk_100018AC8, 40, 7);
  v19[2] = a2;
  v19[3] = a3;
  v85 = v19;
  v19[4] = a4;
  v20 = objc_allocWithZone((Class)LAContext);
  swift_retain(a2);
  swift_retain(a4);
  v21 = objc_msgSend(v20, "init");
  v22 = (void *)objc_opt_self(LARatchetManager);
  v23 = objc_msgSend(v22, "sharedInstance");
  LODWORD(v20) = objc_msgSend(v23, "isFeatureEnabled");

  if ((_DWORD)v20)
    v24 = 1025;
  else
    v24 = 2;
  aBlock = 0;
  v25 = objc_msgSend(v21, "canEvaluatePolicy:error:", v24, &aBlock);
  v94 = aBlock;
  if (!(_DWORD)v25 || aBlock)
  {
    v36 = PASLogger.common.unsafeMutableAddressor(aBlock);
    v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v36, v12);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v84 = v21;
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = (void ***)swift_slowAlloc(8, -1);
      *(_DWORD *)v40 = 138543362;
      swift_beginAccess(&v94, v93, 0, 0);
      v42 = v94;
      if (v94)
      {
        v82 = v40 + 12;
        v83 = v41;
        aBlock = v94;
        v43 = v94;
        v41 = v83;
      }
      else
      {
        aBlock = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v89);
      *v41 = v42;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Local authentication failed with error %{public}@", v40, 0xCu);
      v53 = sub_100004170(&qword_10001DE68);
      swift_arrayDestroy(v41, 1, v53);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);
      v21 = v84;
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    v54 = swift_beginAccess(a1 + 40, &aBlock, 32, 0);
    v55 = a1;
    if (*(_QWORD *)(a1 + 64))
    {
      v56 = PASDevice.deviceBiometricKey.getter(v54);
      v58 = v57;
      swift_endAccess(&aBlock);
    }
    else
    {
      swift_endAccess(&aBlock);
      v58 = (void *)0xED00005343495254;
      v56 = 0x454D4F49425F4F4ELL;
    }
    aBlock = 0;
    v89[0] = 0xE000000000000000;
    _StringGuts.grow(_:)(40);
    swift_bridgeObjectRelease(v89[0]);
    aBlock = (void **)0xD000000000000026;
    v89[0] = 0x8000000100015F70;
    v59._countAndFlagsBits = v56;
    v59._object = v58;
    String.append(_:)(v59);
    swift_bridgeObjectRelease(v58);
    v60 = aBlock;
    v61 = v89[0];
    swift_bridgeObjectRetain(v89[0]);
    v62 = v86;
    String.LocalizationValue.init(_:)(v60, v61);
    v63 = type metadata accessor for PASVSPrimaryViewController();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v63);
    v65 = (void *)objc_opt_self(NSBundle);
    v66 = objc_msgSend(v65, "bundleForClass:", ObjCClassFromMetadata);
    v67 = v87;
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)(v62, 0, 0, v66, v67, 0, 0, 256);
    v69 = v68;
    swift_bridgeObjectRelease(v61);
    sub_100007EE0(v55 + 96, (uint64_t)&aBlock);
    v70 = v90;
    if (v90)
    {
      v71 = v91;
      sub_100007F28(&aBlock, (uint64_t)v90);
      (*((void (**)(void *, uint64_t (*)(uint64_t, uint64_t)))v71 + 1))(v70, v71);
      v73 = v72;
      sub_100008098(&aBlock);
      if (v73)
      {
        swift_bridgeObjectRelease(v69);
        v69 = v73;
      }
    }
    else
    {
      sub_100006884((uint64_t)&aBlock, &qword_10001DE50);
    }
    v74 = *(void **)(v55 + 32);
    v75 = v86;
    String.LocalizationValue.init(_:)(0xD000000000000023, 0x8000000100015FA0);
    v76 = objc_msgSend(v65, "bundleForClass:", ObjCClassFromMetadata);
    v77 = v87;
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)(v75, 0, 0, v76, v77, 0, 0, 256);
    v79 = v78;
    v80 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v79);
    v49.super.isa = (Class)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v69);
    objc_msgSend(v74, "showErrorWithTitle:message:", v80, v49.super.isa);

    v44 = v85;
  }
  else
  {
    v26 = PASLogger.common.unsafeMutableAddressor(v25);
    v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v26, v12);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v30 = 67240192;
      LODWORD(aBlock) = 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "PASBiometryEvaluator result: %{BOOL,public}d", v30, 8u);
      swift_slowDealloc(v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    swift_beginAccess(a1 + 40, v93, 0, 0);
    if (*(_QWORD *)(a1 + 64))
    {
      sub_100007FA8(a1 + 40, (uint64_t)&aBlock);
      v31 = v90;
      v32 = v91;
      sub_100007F28(&aBlock, (uint64_t)v90);
      v33 = (*((uint64_t (**)(void *, _QWORD))v32 + 1))(v31, v32);
      v35 = v34;
      sub_100007FE4((uint64_t)&aBlock);
    }
    else
    {
      v35 = (void *)0xE700000000000000;
      v33 = 0x4E574F4E4B4E55;
    }
    v44 = v85;
    v45 = objc_msgSend(v22, "sharedInstance");
    v46 = objc_msgSend(v45, "isFeatureEnabled");

    if (v46)
      v47 = 1025;
    else
      v47 = 2;
    v48 = sub_100007004(v33, v35, (uint64_t)objc_msgSend(v21, "biometryType"));
    v49.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v48);
    v50 = (_QWORD *)swift_allocObject(&unk_100018AF0, 56, 7);
    v50[2] = a1;
    v50[3] = v33;
    v50[4] = v35;
    v50[5] = sub_100007ED4;
    v50[6] = v44;
    v91 = sub_100007F80;
    v92 = v50;
    aBlock = _NSConcreteStackBlock;
    v89[0] = 1107296256;
    v89[1] = sub_100004F8C;
    v90 = &unk_100018B08;
    v51 = _Block_copy(&aBlock);
    v52 = v92;
    swift_retain(a1);
    swift_retain(v44);
    swift_release(v52);
    objc_msgSend(v21, "evaluatePolicy:options:reply:", v47, v49.super.isa, v51);
    _Block_release(v51);
  }

  v81 = v94;
  swift_release(v44);

}

uint64_t sub_100007E98()
{
  return sub_100007EA4((void (*)(_QWORD))&_swift_release);
}

uint64_t sub_100007EA4(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));
  swift_release(*(_QWORD *)(v1 + 32));
  return swift_deallocObject(v1, 40, 7);
}

uint64_t sub_100007ED4(char a1)
{
  uint64_t v1;

  return sub_100004804(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_100007EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004170(&qword_10001DE50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100007F28(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100007F4C()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100007F80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100004AC8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32), *(uint64_t (**)(BOOL))(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_100007F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007FA0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007FA8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for PASDevice - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100007FE4(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for PASDevice - 1) + 8))();
  return a1;
}

_OWORD *sub_100008018(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008028(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10000805C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100008098(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000080B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_1000080F4(id result, void *a2)
{
  if (result)
  {
    swift_retain(result);
    return a2;
  }
  return result;
}

uint64_t sub_100008124()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100008158()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10001E5CC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000082E8;
  return sub_100010928();
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1000081F8(a1, &qword_10001DFD0, (uint64_t)&unk_100018B68);
}

void type metadata accessor for MGDeviceClass(uint64_t a1)
{
  sub_1000081F8(a1, &qword_10001DFD8, (uint64_t)&unk_100018B90);
}

void sub_1000081F8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_10000823C()
{
  return sub_100008284(&qword_10001DFE0, (uint64_t)&unk_100012CFC);
}

uint64_t sub_100008260()
{
  return sub_100008284(&qword_10001DFE8, (uint64_t)&unk_100012CD0);
}

uint64_t sub_100008284(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000082C4()
{
  return sub_100008284(&qword_10001DFF0, (uint64_t)&unk_100012D6C);
}

ValueMetadata *type metadata accessor for DTOStatusProvider()
{
  return &type metadata for DTOStatusProvider;
}

uint64_t sub_1000082FC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AccountSecurityLevelCalculator()
{
  return objc_opt_self(_TtC14PASViewService30AccountSecurityLevelCalculator);
}

uint64_t sub_10000832C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = v0;
  v2 = type metadata accessor for Logger(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000838C, 0, 0);
}

uint64_t sub_10000838C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v17;

  v1 = *(_QWORD **)(v0 + 16);
  v2 = v1[10];
  v3 = v1[11];
  sub_100007F28(v1 + 7, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if ((v4 & 1) != 0)
  {
    v6 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 24);
    v8 = PASLogger.viewService.unsafeMutableAddressor(v4);
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "PASVSProxCardValidator Suppressing Proximity Apple ID Sign In prox card - Device is in lost mode", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }
    v14 = *(_QWORD *)(v0 + 32);
    v13 = *(_QWORD *)(v0 + 40);
    v15 = *(_QWORD *)(v0 + 24);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    swift_task_dealloc(*(_QWORD *)(v0 + 40));
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(0, 0, 0);
  }
  else
  {
    v17 = (_QWORD *)swift_task_alloc(dword_10001E18C);
    *(_QWORD *)(v0 + 48) = v17;
    *v17 = v0;
    v17[1] = sub_1000084D8;
    return sub_1000086A0();
  }
}

uint64_t sub_1000084D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 56) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100008534, 0, 0);
}

uint64_t sub_100008534()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;

  v1 = *(void **)(v0 + 56);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 136);
    if (v2 && *(_BYTE *)(v2 + direct field offset for PASExtensionManifest.isAccountPickerAvailable) == 1)
    {
      v3 = objc_msgSend(*(id *)(v0 + 56), "username");
      if (v3)
      {
        v4 = v3;
        v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
        v7 = v6;

      }
      else
      {

        v5 = 0;
        v7 = 0;
      }
      swift_task_dealloc(*(_QWORD *)(v0 + 40));
    }
    else
    {
      v8 = sub_100008D0C(*(_QWORD *)(v0 + 56));
      v9 = objc_msgSend(v1, "username");
      v10 = *(_QWORD *)(v0 + 40);
      if (v9)
      {
        v11 = v9;
        v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
        v7 = v12;

        swift_task_dealloc(v10);
        if (v8 != (id)4)
        {
          v13 = 0;
LABEL_15:
          v14 = 1;
          return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 8))(v13 | v14, v5, v7);
        }
      }
      else
      {

        swift_task_dealloc(v10);
        v7 = 0;
        if (v8 != (id)4)
        {
          v13 = 0;
          v14 = 1;
          v5 = 0;
          return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 8))(v13 | v14, v5, v7);
        }
        v5 = 0;
      }
    }
    v13 = 256;
    goto LABEL_15;
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  v14 = 0;
  v7 = 0;
  v5 = 0;
  v13 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 8))(v13 | v14, v5, v7);
}

uint64_t sub_1000086A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1[4] = v0;
  v2 = type metadata accessor for Logger(0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v4 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[7] = swift_task_alloc(v4);
  v1[8] = swift_task_alloc(v4);
  return swift_task_switch(sub_100008710, 0, 0);
}

uint64_t sub_100008710()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 32);
  v2 = v1[5];
  v3 = v1[6];
  sub_100007F28(v1 + 2, v2);
  v4 = *(int **)(v3 + 8);
  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc(v4[1]);
  *(_QWORD *)(v0 + 72) = v5;
  *v5 = v0;
  v5[1] = sub_10000878C;
  return v7(v2, v3);
}

uint64_t sub_10000878C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 72);
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_1000088F8;
  }
  else
  {
    *(_QWORD *)(v4 + 88) = a1;
    v6 = sub_100008800;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100008800(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(v1 + 88);
  if (!v2)
  {
    v3 = *(_QWORD *)(v1 + 64);
    v4 = *(_QWORD *)(v1 + 40);
    v5 = *(_QWORD *)(v1 + 48);
    v6 = PASLogger.viewService.unsafeMutableAddressor(a1);
    v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "PASVSProxCardValidator Suppressing Proximity Apple ID Sign In prox card - No primary account found", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }
    v11 = *(_QWORD *)(v1 + 64);
    v12 = *(_QWORD *)(v1 + 40);
    v13 = *(_QWORD *)(v1 + 48);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  v14 = *(_QWORD *)(v1 + 56);
  swift_task_dealloc(*(_QWORD *)(v1 + 64));
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v2);
}

uint64_t sub_1000088F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = *(_QWORD *)(v1 + 80);
  v4 = *(_QWORD *)(v1 + 48);
  v3 = *(_QWORD *)(v1 + 56);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = PASLogger.viewService.unsafeMutableAddressor(a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  swift_errorRetain(v2);
  v7 = swift_errorRetain(v2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(_QWORD *)(v1 + 80);
    v11 = *(_QWORD *)(v1 + 48);
    v24 = *(_QWORD *)(v1 + 40);
    v25 = *(_QWORD *)(v1 + 56);
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    *(_DWORD *)v12 = 136446210;
    v26 = v13;
    *(_QWORD *)(v1 + 16) = v10;
    swift_errorRetain(v10);
    v14 = sub_100004170(&qword_10001E190);
    v15 = String.init<A>(describing:)(v1 + 16, v14);
    v17 = v16;
    *(_QWORD *)(v1 + 24) = sub_100010FEC(v15, v16, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32);
    swift_bridgeObjectRelease(v17);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "PASVSProxCardValidator, failed trying to find local account %{public}s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    swift_errorRelease(v10);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v25, v24);
  }
  else
  {
    v18 = *(_QWORD *)(v1 + 80);
    v20 = *(_QWORD *)(v1 + 48);
    v19 = *(_QWORD *)(v1 + 56);
    v21 = *(_QWORD *)(v1 + 40);
    swift_errorRelease(v18);
    swift_errorRelease(v18);
    swift_errorRelease(v18);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  v22 = *(_QWORD *)(v1 + 56);
  swift_task_dealloc(*(_QWORD *)(v1 + 64));
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(_QWORD))(v1 + 8))(0);
}

uint64_t sub_100008B0C()
{
  uint64_t v0;

  sub_100008098((_QWORD *)(v0 + 16));
  sub_100008098((_QWORD *)(v0 + 56));
  sub_100008098((_QWORD *)(v0 + 96));

  return swift_deallocClassInstance(v0, 144, 7);
}

uint64_t type metadata accessor for PASVSProxCardValidator()
{
  return objc_opt_self(_TtC14PASViewService22PASVSProxCardValidator);
}

uint64_t destroy for PASVSProxCardValidator.ValidatorResult(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

uint64_t _s14PASViewService22PASVSProxCardValidatorC15ValidatorResultVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASVSProxCardValidator.ValidatorResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for PASVSProxCardValidator.ValidatorResult(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PASVSProxCardValidator.ValidatorResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASVSProxCardValidator.ValidatorResult(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PASVSProxCardValidator.ValidatorResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASVSProxCardValidator.ValidatorResult()
{
  return &type metadata for PASVSProxCardValidator.ValidatorResult;
}

id sub_100008D0C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = (void *)objc_opt_self(AKAccountManager);
  v3 = objc_msgSend(v2, "sharedInstance");
  v4 = objc_msgSend(v3, "altDSIDForAccount:", a1);

  if (!v4)
    return 0;
  v5 = objc_msgSend(v2, "sharedInstance");
  v6 = objc_msgSend(v5, "authKitAccountWithAltDSID:", v4);

  if (!v6)
    return 0;
  v7 = objc_msgSend(v2, "sharedInstance");
  v8 = objc_msgSend(v7, "securityLevelForAccount:", v6);

  return v8;
}

ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_100008E14(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000159C8, 1);
}

uint64_t sub_100008E24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = a1;
  v35 = sub_100004170(&qword_10001E1B0);
  __chkstk_darwin(v35);
  v2 = (uint64_t *)((char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = type metadata accessor for Image.Scale(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004170(&qword_10001E1B8);
  __chkstk_darwin(v7);
  v9 = (uint64_t *)((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = sub_100004170(&qword_10001E1C0);
  v10 = __chkstk_darwin(v36);
  v37 = (uint64_t)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v34 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v34 - v15;
  v17 = Image.init(systemName:)(0x65626F6C67, 0xE500000000000000);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for Image.Scale.large(_:), v3);
  KeyPath = swift_getKeyPath(&unk_100012FC8);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v2 + *(int *)(v35 + 28), v6, v3);
  *v2 = KeyPath;
  sub_1000093C8((uint64_t)v2, (uint64_t)v9 + *(int *)(v7 + 36), &qword_10001E1B0);
  *v9 = v17;
  swift_retain(v17);
  sub_100006884((uint64_t)v2, &qword_10001E1B0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v19 = swift_release(v17);
  v20 = static Color.accentColor.getter(v19);
  v21 = swift_getKeyPath(&unk_100012FF8);
  sub_1000093C8((uint64_t)v9, (uint64_t)v14, &qword_10001E1B8);
  v22 = (uint64_t *)&v14[*(int *)(v36 + 36)];
  *v22 = v21;
  v22[1] = v20;
  sub_100006884((uint64_t)v9, &qword_10001E1B8);
  sub_100009380((uint64_t)v14, (uint64_t)v16);
  v23 = LocalizedStringKey.init(stringLiteral:)(0x77202C6F6C6C6548, 0xED000021646C726FLL);
  v24 = Text.init(_:tableName:bundle:comment:)(v23);
  v26 = v25;
  v28 = v27;
  LOBYTE(v4) = v29 & 1;
  v30 = v37;
  sub_1000093C8((uint64_t)v16, v37, &qword_10001E1C0);
  v31 = v38;
  sub_1000093C8(v30, v38, &qword_10001E1C0);
  v32 = v31 + *(int *)(sub_100004170(&qword_10001E1C8) + 48);
  *(_QWORD *)v32 = v24;
  *(_QWORD *)(v32 + 8) = v26;
  *(_BYTE *)(v32 + 16) = v4;
  *(_QWORD *)(v32 + 24) = v28;
  sub_10000940C(v24, v26, v4);
  swift_bridgeObjectRetain(v28);
  sub_100006884((uint64_t)v16, &qword_10001E1C0);
  sub_10000941C(v24, v26, v4);
  swift_bridgeObjectRelease(v28);
  return sub_100006884(v30, &qword_10001E1C0);
}

uint64_t sub_100009198()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000091B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v11;

  v2 = sub_100004170(&qword_10001E198);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = static HorizontalAlignment.center.getter(v3);
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = sub_100004170(&qword_10001E1A0);
  v7 = sub_100008E24((uint64_t)&v5[*(int *)(v6 + 44)]);
  v8 = static Edge.Set.all.getter(v7);
  sub_1000093C8((uint64_t)v5, a1, &qword_10001E198);
  v9 = a1 + *(int *)(sub_100004170(&qword_10001E1A8) + 36);
  *(_BYTE *)v9 = v8;
  *(_OWORD *)(v9 + 8) = 0u;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_BYTE *)(v9 + 40) = 1;
  return sub_100006884((uint64_t)v5, &qword_10001E198);
}

uint64_t sub_100009290()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000092B0(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for Image.Scale(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.imageScale.setter(v3);
}

uint64_t sub_100009330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009358(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100009380(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004170(&qword_10001E1C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000093C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004170(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000940C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000941C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_100009430()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E1D0;
  if (!qword_10001E1D0)
  {
    v1 = sub_10000949C(&qword_10001E1A8);
    sub_1000094E0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E1D0);
  }
  return result;
}

uint64_t sub_10000949C(uint64_t *a1)
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

unint64_t sub_1000094E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E1D8;
  if (!qword_10001E1D8)
  {
    v1 = sub_10000949C(&qword_10001E198);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E1D8);
  }
  return result;
}

NSString sub_10000952C()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_10001EA80 = (uint64_t)result;
  return result;
}

NSString sub_100009560()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_10001EA88 = (uint64_t)result;
  return result;
}

id sub_10000962C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)PRXCardContentViewController), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_10000969C(uint64_t a1)
{
  _BYTE *v1;
  _QWORD *v3;
  char *v4;
  char *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter] = 0;
  v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_hasEligibleAccountForProxSetup] = 1;
  v3 = &v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName];
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  v4 = &v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_QWORD *)v4 + 6) = 0;
  v5 = &v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_proxyDelegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController] = 0;
  sub_1000093C8(a1, (uint64_t)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_viewDetails], &qword_10001E2C0);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for PASVSSetupEventPresenter();
  v6 = objc_msgSendSuper2(&v8, "init");
  sub_100006884(a1, &qword_10001E2C0);
  return v6;
}

void sub_1000097A8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint8_t *v18;
  uint8_t *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  Swift::String v28;
  __int128 v29;
  uint64_t v30;
  uint64_t ObjCClassFromMetadata;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSString v36;
  id v37;
  NSString v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void **v63;
  Class isa;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  char *v70;
  int v71;
  id v72;
  id v73;
  void *v74;
  uint64_t (**v75)(void *, void *);
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  Swift::String v82;
  void **v83;
  unint64_t v84;
  char *v85;
  id v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  NSString v90;
  Swift::String v91;
  void **v92;
  unint64_t v93;
  id v94;
  unint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  NSString v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  char *v117;
  char *v118;
  id v119;
  id v120;
  id v121;
  uint64_t v122;
  char *v123;
  _QWORD v124[3];
  uint64_t v125;
  uint64_t v126;
  __int128 v127[3];
  char v128[24];
  void **aBlock;
  unint64_t v130;
  void (*v131)(uint64_t, void *);
  void *v132;
  uint64_t (**v133)(void *, void *);
  uint64_t v134;

  v1 = v0;
  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v115 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v115 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v115 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = PASLogger.viewService.unsafeMutableAddressor(v10);
  v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v13, v8);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.info.getter();
  v17 = os_log_type_enabled(v15, v16);
  v123 = v1;
  if (v17)
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "PASVSSetupEventPresenter: About to present prox card", v18, 2u);
    v19 = v18;
    v1 = v123;
    swift_slowDealloc(v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v20 = sub_10000962C();
  objc_msgSend(v20, "setDismissalType:", 1);

  v21 = sub_10000962C();
  aBlock = 0;
  v130 = 0xE000000000000000;
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease(v130);
  *(_QWORD *)&v127[0] = 0xD000000000000017;
  *((_QWORD *)&v127[0] + 1) = 0x80000001000165C0;
  v22 = (uint64_t)&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice];
  swift_beginAccess(&v1[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice], v128, 0, 0);
  sub_1000093C8(v22, (uint64_t)&aBlock, &qword_10001E2F0);
  if (v132)
  {
    sub_100007FA8((uint64_t)&aBlock, (uint64_t)v124);
    sub_100006884((uint64_t)&aBlock, &qword_10001E2F0);
    v23 = v125;
    v24 = v126;
    sub_100007F28(v124, v125);
    v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
    v27 = v26;
    sub_100007FE4((uint64_t)v124);
  }
  else
  {
    v25 = 0x4E574F4E4B4E55;
    sub_100006884((uint64_t)&aBlock, &qword_10001E2F0);
    v27 = (void *)0xE700000000000000;
  }
  v28._countAndFlagsBits = v25;
  v28._object = v27;
  String.append(_:)(v28);
  swift_bridgeObjectRelease(v27);
  v29 = v127[0];
  swift_bridgeObjectRetain(*((_QWORD *)&v127[0] + 1));
  String.LocalizationValue.init(_:)(v29, *((_QWORD *)&v29 + 1));
  v30 = type metadata accessor for PASVSPrimaryViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v30);
  v32 = (void *)objc_opt_self(NSBundle);
  v33 = objc_msgSend(v32, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v7, 0, 0, v33, v4, 0, 0, 256);
  v35 = v34;
  swift_bridgeObjectRelease(*((_QWORD *)&v29 + 1));
  v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v35);
  objc_msgSend(v21, "setTitle:", v36);

  v37 = sub_10000962C();
  v38 = String._bridgeToObjectiveC()();
  v133 = (uint64_t (**)(void *, void *))sub_10000A528;
  v134 = 0;
  aBlock = _NSConcreteStackBlock;
  v130 = 1107296256;
  v131 = sub_10000CDA8;
  v132 = &unk_100018EF0;
  v39 = _Block_copy(&aBlock);
  v116 = (id)objc_opt_self(PRXAction);
  v40 = objc_msgSend(v116, "actionWithTitle:style:handler:", v38, 0, v39);

  _Block_release(v39);
  swift_release(v134);
  objc_msgSend(v37, "setDismissButtonAction:", v40);

  sub_1000093C8(v22, (uint64_t)&aBlock, &qword_10001E2F0);
  v118 = v7;
  v122 = ObjCClassFromMetadata;
  v121 = v32;
  v117 = v4;
  if (v132)
  {
    sub_100007FA8((uint64_t)&aBlock, (uint64_t)v124);
    sub_100006884((uint64_t)&aBlock, &qword_10001E2F0);
    sub_10000C8B8((uint64_t)v124, (uint64_t)v127);
    sub_100007FE4((uint64_t)v124);
    sub_10000C8FC(v127, (uint64_t)&aBlock);
  }
  else
  {
    sub_100006884((uint64_t)&aBlock, &qword_10001E2F0);
    v132 = &type metadata for PASDeviceClass;
    v133 = (uint64_t (**)(void *, void *))&protocol witness table for PASDeviceClass;
    LOBYTE(aBlock) = 3;
  }
  sub_10000C1F8((uint64_t)&aBlock);
  v42 = v41;
  sub_100008098(&aBlock);
  v43 = sub_10000962C();
  v44 = objc_msgSend(v43, "contentView");

  objc_msgSend(v44, "addSubview:", v42);
  v45 = sub_10000962C();
  v46 = objc_msgSend(v45, "contentView");

  v47 = objc_msgSend(v46, "mainContentGuide");
  v48 = (void *)objc_opt_self(NSLayoutConstraint);
  v49 = sub_100004170(&qword_10001E2F8);
  v50 = swift_allocObject(v49, 64, 7);
  *(_OWORD *)(v50 + 16) = xmmword_100013030;
  v51 = objc_msgSend(v42, "topAnchor");
  v52 = objc_msgSend(v47, "topAnchor");
  v53 = objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:", v52);

  *(_QWORD *)(v50 + 32) = v53;
  v54 = objc_msgSend(v42, "bottomAnchor");
  v55 = objc_msgSend(v47, "bottomAnchor");
  v56 = objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:", v55);

  *(_QWORD *)(v50 + 40) = v56;
  v57 = objc_msgSend(v42, "centerXAnchor");
  v58 = objc_msgSend(v47, "centerXAnchor");
  v59 = objc_msgSend(v57, "constraintEqualToAnchor:", v58);

  *(_QWORD *)(v50 + 48) = v59;
  v120 = v42;
  v60 = objc_msgSend(v42, "centerYAnchor");
  v119 = v47;
  v61 = objc_msgSend(v47, "centerYAnchor");
  v62 = objc_msgSend(v60, "constraintEqualToAnchor:", v61);

  *(_QWORD *)(v50 + 56) = v62;
  aBlock = (void **)v50;
  specialized Array._endMutation()();
  v63 = aBlock;
  sub_10000C878(0, &qword_10001E300, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v63);
  objc_msgSend(v48, "activateConstraints:", isa);

  sub_1000093C8(v22, (uint64_t)&aBlock, &qword_10001E2F0);
  if (v132)
  {
    sub_100007FA8((uint64_t)&aBlock, (uint64_t)v124);
    sub_100006884((uint64_t)&aBlock, &qword_10001E2F0);
    v65 = v125;
    v66 = v126;
    sub_100007F28(v124, v125);
    v67 = (*(uint64_t (**)(uint64_t, uint64_t))(v66 + 8))(v65, v66);
    v69 = v68;
    sub_100007FE4((uint64_t)v124);
  }
  else
  {
    v67 = 0x4E574F4E4B4E55;
    sub_100006884((uint64_t)&aBlock, &qword_10001E2F0);
    v69 = (void *)0xE700000000000000;
  }
  v70 = v123;
  v71 = v123[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_hasEligibleAccountForProxSetup];
  v72 = sub_10000962C();
  v73 = v72;
  if (v71 != 1)
  {
    aBlock = 0;
    v130 = 0xE000000000000000;
    _StringGuts.grow(_:)(39);
    swift_bridgeObjectRelease(v130);
    aBlock = (void **)0xD000000000000025;
    v130 = 0x80000001000165E0;
    v82._countAndFlagsBits = v67;
    v82._object = v69;
    String.append(_:)(v82);
    swift_bridgeObjectRelease(v69);
    v83 = aBlock;
    v84 = v130;
    swift_bridgeObjectRetain(v130);
    v85 = v118;
    String.LocalizationValue.init(_:)(v83, v84);
    v86 = objc_msgSend(v121, "bundleForClass:", v122);
    v87 = v117;
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)(v85, 0, 0, v86, v87, 0, 0, 256);
    v89 = v88;
    swift_bridgeObjectRelease(v84);
    v90 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v89);
    objc_msgSend(v73, "setSubtitle:", v90);
    goto LABEL_20;
  }
  v115 = v72;
  sub_1000093C8((uint64_t)&v70[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_viewDetails], (uint64_t)&aBlock, &qword_10001E2C0);
  v74 = v132;
  if (!v132)
  {
    sub_100006884((uint64_t)&aBlock, &qword_10001E2C0);
    goto LABEL_18;
  }
  v75 = v133;
  sub_100007F28(&aBlock, (uint64_t)v132);
  v76 = v75[1](v74, v75);
  v78 = v77;
  sub_100008098(&aBlock);
  if (!v78)
  {
LABEL_18:
    aBlock = 0;
    v130 = 0xE000000000000000;
    _StringGuts.grow(_:)(28);
    swift_bridgeObjectRelease(v130);
    aBlock = (void **)0xD00000000000001ALL;
    v130 = 0x8000000100016610;
    v91._countAndFlagsBits = v67;
    v91._object = v69;
    String.append(_:)(v91);
    swift_bridgeObjectRelease(v69);
    v92 = aBlock;
    v93 = v130;
    swift_bridgeObjectRetain(v130);
    v81 = v118;
    String.LocalizationValue.init(_:)(v92, v93);
    v94 = objc_msgSend(v121, "bundleForClass:", v122);
    v80 = v117;
    static Locale.current.getter();
    v76 = String.init(localized:table:bundle:locale:comment:)(v81, 0, 0, v94, v80, 0, 0, 256);
    v78 = v95;
    swift_bridgeObjectRelease(0);
    v79 = swift_bridgeObjectRelease(v93);
    goto LABEL_19;
  }
  v79 = swift_bridgeObjectRelease(v69);
  v80 = v117;
  v81 = v118;
LABEL_19:
  v96 = (uint64_t *)PASBoldAppleIDPlaceholder.unsafeMutableAddressor(v79);
  v97 = *v96;
  v98 = v96[1];
  v99 = *(_QWORD *)&v70[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName];
  v100 = *(_QWORD *)&v70[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName + 8];
  swift_bridgeObjectRetain(v98);
  swift_bridgeObjectRetain(v100);
  v70 = v123;
  v101 = sub_10000DDE4(v97, v98, v99, v100, (uint64_t)UIFontTextStyleSubheadline, v76, v78);
  swift_bridgeObjectRelease(v78);
  swift_bridgeObjectRelease(v98);
  swift_bridgeObjectRelease(v100);
  v102 = v115;
  objc_msgSend(v115, "setAttributedSubtitle:", v101);

  v73 = sub_10000962C();
  String.LocalizationValue.init(_:)(0xD000000000000018, 0x8000000100016630);
  v103 = objc_msgSend(v121, "bundleForClass:", v122);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v81, 0, 0, v103, v80, 0, 0, 256);
  v105 = v104;
  v106 = swift_allocObject(&unk_100018F28, 24, 7);
  *(_QWORD *)(v106 + 16) = v70;
  v107 = v70;
  v108 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v105);
  v133 = (uint64_t (**)(void *, void *))sub_10000C8B0;
  v134 = v106;
  aBlock = _NSConcreteStackBlock;
  v130 = 1107296256;
  v131 = sub_10000CDA8;
  v132 = &unk_100018F40;
  v109 = _Block_copy(&aBlock);
  v90 = objc_msgSend(v116, "actionWithTitle:style:handler:", v108, 0, v109);

  _Block_release(v109);
  swift_release(v134);

LABEL_20:
  v110 = *(void **)&v70[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController];
  if (v110)
  {
    v111 = v110;
    v112 = sub_10000962C();
    v113 = objc_msgSend(v111, "presentProxCardFlowWithDelegate:initialViewController:", v70, v112);

    v114 = v119;
  }
  else
  {
    v114 = v120;
    v113 = v119;
  }

}

void sub_10000A528()
{
  exit(1);
}

void sub_10000A538(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  void *v16;
  uint64_t v17;
  id v18;
  _BYTE v19[16];

  v3 = type metadata accessor for Locale(0);
  __chkstk_darwin(v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v6);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_10000962C();
  String.LocalizationValue.init(_:)(0xD000000000000012, 0x8000000100016650);
  v10 = type metadata accessor for PASVSPrimaryViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v10);
  v12 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v8, 0, 0, v12, v5, 0, 0, 256);
  v14 = v13;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v9, "showActivityIndicatorWithStatus:", v15);

  v16 = *(void **)(a2 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v16)
    objc_msgSend(v16, "initiateClientConnectionIfEligible");
  v17 = sub_10000C878(0, &qword_10001E2C8, NSDistributedNotificationCenter_ptr);
  v18 = objc_msgSend((id)swift_getObjCClassFromMetadata(v17), "defaultCenter");
  if (qword_10001DE30 != -1)
    swift_once(&qword_10001DE30, sub_10000952C);
  objc_msgSend(v18, "postNotificationName:object:", qword_10001EA80, 0);

}

void sub_10000A75C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = PASLogger.viewService.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "PASVSSetupEventPresenter: Pairing Requested", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = objc_allocWithZone((Class)type metadata accessor for PASVSScannerCardViewController());
  v13 = sub_10000CDF8();
  v14 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  v15 = *(_QWORD *)&v13[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate];
  *(_QWORD *)&v13[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate] = v14;
  swift_unknownObjectRetain(v14, v16);
  swift_unknownObjectRelease(v15);
  v17 = sub_10000962C();
  v18 = objc_msgSend(v17, "navigationController");

  if (v18)
  {
    objc_msgSend(v18, "pushViewController:animated:", v13, 1);

  }
}

void sub_10000A924()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t ObjCClassFromMetadata;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSString v20;
  uint64_t v21;
  id v22;
  id v23;
  NSString v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  void **aBlock;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;

  v1 = type metadata accessor for Locale(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone((Class)PRXPasscodeEntryViewController), "init");
  objc_msgSend(v7, "setNumberOfDigits:", 6);
  v8 = v7;
  String.LocalizationValue.init(_:)(0x52544E455F4E4950, 0xEF454C5449545F59);
  v9 = type metadata accessor for PASVSPrimaryViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v9);
  v11 = (void *)objc_opt_self(NSBundle);
  v12 = objc_msgSend(v11, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v12, v3, 0, 0, 256);
  v14 = v13;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v8, "setTitle:", v15);

  v16 = v8;
  String.LocalizationValue.init(_:)(0xD000000000000012, 0x8000000100016560);
  v17 = objc_msgSend(v11, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v17, v3, 0, 0, 256);
  v19 = v18;
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  objc_msgSend(v16, "setSubtitle:", v20);

  objc_msgSend(v16, "setDismissalType:", 1);
  v21 = swift_allocObject(&unk_100018E60, 32, 7);
  *(_QWORD *)(v21 + 16) = v16;
  *(_QWORD *)(v21 + 24) = v0;
  v22 = v16;
  v23 = v0;
  v24 = String._bridgeToObjectiveC()();
  v39 = sub_10000C844;
  v40 = v21;
  aBlock = _NSConcreteStackBlock;
  v36 = 1107296256;
  v37 = sub_10000CDA8;
  v38 = &unk_100018E78;
  v25 = _Block_copy(&aBlock);
  v26 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v24, 0, v25);

  _Block_release(v25);
  swift_release(v40);
  objc_msgSend(v22, "setDismissButtonAction:", v26);

  v27 = swift_allocObject(&unk_100018EB0, 24, 7);
  *(_QWORD *)(v27 + 16) = v23;
  v39 = sub_10000C870;
  v40 = v27;
  aBlock = _NSConcreteStackBlock;
  v36 = 1107296256;
  v37 = sub_10000AE14;
  v38 = &unk_100018EC8;
  v28 = _Block_copy(&aBlock);
  v29 = v40;
  v30 = (char *)v23;
  swift_release(v29);
  objc_msgSend(v22, "setTextEntryCompletionHandler:", v28);
  _Block_release(v28);
  v31 = sub_10000962C();
  v32 = objc_msgSend(v31, "navigationController");

  if (v32)
  {
    objc_msgSend(v32, "pushViewController:animated:", v22, 1);

  }
  v33 = *(void **)&v30[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController];
  *(_QWORD *)&v30[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController] = v22;

}

void sub_10000AD34(int a1, id a2, uint64_t a3)
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a2, "passcodeEntryView");
  objc_msgSend(v4, "endEditing:", 1);

  v5 = *(void **)(a3 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v5)
    objc_msgSend(v5, "invalidateClientConnection");
  exit(1);
}

void sub_10000AD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  NSString v4;

  v3 = *(void **)(a3 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v3)
  {
    swift_unknownObjectRetain(*(_QWORD *)(a3 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate), a2);
    v4 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "handleScannedCode:", v4);

    swift_unknownObjectRelease(v3);
  }
}

uint64_t sub_10000AE14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v6 = v5;
  swift_retain(v2);
  v3(v4, v6);
  swift_release(v2);
  return swift_bridgeObjectRelease(v6);
}

void sub_10000AE9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t ObjCClassFromMetadata;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSString v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _BYTE v30[16];

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = &v30[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for Locale(0);
  __chkstk_darwin(v5);
  v7 = &v30[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for String.LocalizationValue(0);
  v9 = __chkstk_darwin(v8);
  v11 = &v30[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = *(void **)(v0 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController);
  if (v12)
  {
    v13 = v12;
    String.LocalizationValue.init(_:)(0x52544E455F4E4950, 0xEF524F5252455F59);
    v14 = type metadata accessor for PASVSPrimaryViewController();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v14);
    v16 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)(v11, 0, 0, v16, v7, 0, 0, 256);
    v18 = v17;
    v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
    objc_msgSend(v13, "setSubtitle:", v19);

    v20 = objc_msgSend(v13, "contentView");
    v21 = objc_msgSend(v20, "subtitleLabel");

    if (v21)
    {
      v22 = objc_msgSend((id)objc_opt_self(UIColor), "systemRedColor");
      objc_msgSend(v21, "setTextColor:", v22);

    }
    v23 = objc_msgSend(v13, "passcodeEntryView");
    v24 = String._bridgeToObjectiveC()();
    objc_msgSend(v23, "setText:", v24);

  }
  else
  {
    v25 = PASLogger.viewService.unsafeMutableAddressor(v9);
    v26 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v25, v1);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Attempted to show PIN entry error, but no PIN entry view was found.", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_10000B1DC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for Logger(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MainActor(0);
  v2[10] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v2[11] = v6;
  v2[12] = v7;
  return swift_task_switch(sub_10000B270, v6, v7);
}

uint64_t sub_10000B270()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;

  v1 = sub_10000962C();
  v2 = objc_msgSend(v1, "navigationController");

  if (v2)
  {
    v4 = sub_10000962C();
    v5 = objc_msgSend(v2, "popToViewController:animated:", v4, 0);

  }
  v7 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 56);
  v9 = PASLogger.viewService.unsafeMutableAddressor(v3);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "PASVSSetupEventPresenter: Pairing Completed", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }
  v15 = *(_QWORD *)(v0 + 64);
  v14 = *(_QWORD *)(v0 + 72);
  v17 = *(_QWORD *)(v0 + 48);
  v16 = *(_QWORD *)(v0 + 56);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  v18 = sub_10000962C();
  v19 = objc_allocWithZone((Class)type metadata accessor for PASUISourceViewPresenter(0));
  v20 = PASUISourceViewPresenter.init(sharingViewController:)(v18);
  v21 = OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter;
  v22 = *(void **)(v17 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter);
  *(_QWORD *)(v17 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter) = v20;

  v23 = *(char **)(v17 + v21);
  *(_QWORD *)(v0 + 104) = v23;
  if (v23)
  {
    v24 = *(_QWORD *)(v0 + 48);
    v25 = &v23[direct field offset for PASUISourceViewPresenter.delegate];
    swift_beginAccess(&v23[direct field offset for PASUISourceViewPresenter.delegate], v0 + 16, 1, 0);
    swift_unknownObjectWeakAssign(v25, v24);
    v26 = *((unsigned int *)&async function pointer to PASUISourceViewPresenter.activate(withTemplate:) + 1);
    v23;
    v27 = (_QWORD *)swift_task_alloc(v26);
    *(_QWORD *)(v0 + 112) = v27;
    *v27 = v0;
    v27[1] = sub_10000B494;
    return PASUISourceViewPresenter.activate(withTemplate:)(*(_QWORD *)(v0 + 40));
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 80));
    swift_task_dealloc(*(_QWORD *)(v0 + 72));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000B494(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  void *v4;

  v3 = *v1;
  v4 = *(void **)(*v1 + 104);
  swift_task_dealloc(*(_QWORD *)(*v1 + 112));

  return swift_task_switch(sub_10000B4F4, *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96));
}

uint64_t sub_10000B4F4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B65C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[5] = static MainActor.shared.getter(v4);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000B6CC, v5, v6);
}

uint64_t sub_10000B6CC()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t **v7;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release(v0[5]);
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = dword_10001E25C;
  v5 = v3;
  v6 = v1;
  v7 = (uint64_t **)swift_task_alloc(v4);
  v0[7] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = (uint64_t *)sub_10000B748;
  return sub_10000B1DC(v0[2]);
}

uint64_t sub_10000B748()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD))(*v0 + 48);
  v2 = *(void **)(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v5 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 56));

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_10000B7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[5];
  _QWORD *v32;

  v5 = v4;
  v30 = a3;
  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v14 = *(_QWORD *)(v13 - 8);
  result = __chkstk_darwin(v13);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)&v5[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter])
  {
    sub_10000C878(0, &qword_10001E2D0, OS_dispatch_queue_ptr);
    v29 = v10;
    v28 = static OS_dispatch_queue.main.getter();
    v18 = (_QWORD *)swift_allocObject(&unk_100018E10, 56, 7);
    v18[2] = a1;
    v18[3] = a2;
    v18[4] = v30;
    v18[5] = a4;
    v18[6] = v5;
    aBlock[4] = sub_10000C808;
    v32 = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000BAF0;
    aBlock[3] = &unk_100018E28;
    v19 = _Block_copy(aBlock);
    v20 = v32;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    v21 = v5;
    v22 = swift_release(v20);
    static DispatchQoS.unspecified.getter(v22);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v23 = sub_10000C740();
    v24 = sub_100004170(&qword_10001E2E0);
    v25 = sub_10000C788();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v9, v23);
    v26 = (void *)v28;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v17, v12, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  return result;
}

void sub_10000B9D8()
{
  NSString v0;
  NSString v1;
  id v2;
  id v3;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone((Class)PRXCardContentViewController), "init");
  v0 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "setTitle:", v0);

  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "setSubtitle:", v1);

  objc_msgSend(v4, "setDismissalType:", 1);
  v2 = sub_10000962C();
  v3 = objc_msgSend(v2, "navigationController");

  if (v3)
  {
    objc_msgSend(v3, "pushViewController:animated:", v4, 1);

  }
}

uint64_t sub_10000BAF0(uint64_t a1)
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

id sub_10000BBC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASVSSetupEventPresenter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PASVSSetupEventPresenter()
{
  return objc_opt_self(_TtC14PASViewService24PASVSSetupEventPresenter);
}

void sub_10000BCD0(uint64_t a1)
{
  uint64_t v1;
  char *Strong;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[6];
  _BYTE v10[24];
  _BYTE v11[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = *(void **)&Strong[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter];
    *(_QWORD *)&Strong[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter] = 0;

  }
  swift_beginAccess(v1, v10, 0, 0);
  v4 = swift_unknownObjectWeakLoadStrong(v1);
  if (!v4
    || (v5 = (void *)v4,
        v6 = *(void **)(v4 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController),
        v7 = v6,
        v5,
        !v6))
  {
    exit(0);
  }
  v9[4] = sub_10000BDE4;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10000BAF0;
  v9[3] = &unk_100018DD8;
  v8 = _Block_copy(v9);
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);
  _Block_release(v8);

}

void sub_10000BDE4()
{
  exit(0);
}

void sub_10000BE40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t Strong;
  uint64_t v16;
  uint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = PASLogger.viewService.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "PASVSSetupEventPresenter:proxCardFlowDidDismiss", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = *(void **)(v1 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v12)
    objc_msgSend(v12, "invalidateClientConnection");
  v13 = sub_10000C878(0, &qword_10001E2C8, NSDistributedNotificationCenter_ptr);
  v14 = objc_msgSend((id)swift_getObjCClassFromMetadata(v13), "defaultCenter");
  if (qword_10001DE38 != -1)
    swift_once(&qword_10001DE38, sub_100009560);
  objc_msgSend(v14, "postNotificationName:object:", qword_10001EA88, 0);

  Strong = swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_proxyDelegate);
  if (Strong)
  {
    v16 = Strong;
    sub_10001034C();
    swift_unknownObjectRelease(v16);
  }
  exit(0);
}

uint64_t sub_10000C004(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1000082E8;
  return v6();
}

uint64_t sub_10000C058(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1000082E8;
  return v7();
}

uint64_t sub_10000C0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100006884(a1, &qword_10001E310);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100018FF0, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_10001E350, v17);
}

void sub_10000C1F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  NSString v5;
  id v6;
  id v7;
  NSString v8;
  id v9;
  id v10;
  char v11;
  _BYTE v12[40];

  sub_10000C8B8(a1, (uint64_t)v12);
  v1 = sub_100004170(&qword_10001E308);
  if ((swift_dynamicCast(&v11, v12, v1, &type metadata for PASDeviceClass, 6) & 1) != 0 && v11 == 2)
  {
    if (qword_10001DE40 != -1)
      swift_once(&qword_10001DE40, sub_10000DAD8);
    v2 = *(_QWORD *)algn_10001EA98;
    v3 = qword_10001DE48;
    swift_bridgeObjectRetain(*(_QWORD *)algn_10001EA98);
    if (v3 != -1)
      swift_once(&qword_10001DE48, sub_10000DB08);
    v4 = (id)qword_10001EAA0;
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
    v6 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:inBundle:", v5, v4);

    if (v6)
      goto LABEL_12;
    __break(1u);
  }
  if (qword_10001DE48 != -1)
    swift_once(&qword_10001DE48, sub_10000DB08);
  v7 = (id)qword_10001EAA0;
  v8 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:inBundle:", v8, v7);

  if (v6)
  {
LABEL_12:
    v9 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v6);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = v9;
    objc_msgSend(v10, "setContentMode:", 1);

    return;
  }
  __break(1u);
}

uint64_t sub_10000C410()
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
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[5];
  uint64_t v39;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = PASLogger.viewService.unsafeMutableAddressor(v11);
  v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    v35 = v8;
    v19 = v5;
    v20 = v2;
    v21 = v1;
    v22 = v3;
    v23 = v18;
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "PASVSSetupEventPresenter: proximitySetupCompleted", v18, 2u);
    v24 = v23;
    v3 = v22;
    v1 = v21;
    v2 = v20;
    v5 = v19;
    v8 = v35;
    swift_slowDealloc(v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v25 = *(void **)(v1 + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  if (v25)
    objc_msgSend(v25, "invalidateClientConnection");
  sub_10000C878(0, &qword_10001E2D0, OS_dispatch_queue_ptr);
  v26 = (void *)static OS_dispatch_queue.main.getter();
  v27 = swift_allocObject(&unk_100018D98, 24, 7);
  swift_unknownObjectWeakInit(v27 + 16, v1);
  aBlock[4] = sub_10000C720;
  v39 = v27;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000BAF0;
  aBlock[3] = &unk_100018DB0;
  v28 = _Block_copy(aBlock);
  v29 = swift_release(v39);
  static DispatchQoS.unspecified.getter(v29);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v30 = sub_10000C740();
  v31 = sub_100004170(&qword_10001E2E0);
  v32 = sub_10000C788();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v31, v32, v2, v30);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v5, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v8, v37);
}

uint64_t sub_10000C6FC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000C720()
{
  uint64_t v0;

  sub_10000BCD0(v0);
}

uint64_t sub_10000C728(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C738(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000C740()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E2D8;
  if (!qword_10001E2D8)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10001E2D8);
  }
  return result;
}

unint64_t sub_10000C788()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E2E8;
  if (!qword_10001E2E8)
  {
    v1 = sub_10000949C(&qword_10001E2E0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001E2E8);
  }
  return result;
}

uint64_t sub_10000C7D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));

  return swift_deallocObject(v0, 56, 7);
}

void sub_10000C808()
{
  sub_10000B9D8();
}

uint64_t sub_10000C818()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000C844(int a1)
{
  uint64_t v1;

  sub_10000AD34(a1, *(id *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000C84C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000C870(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000AD98(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10000C878(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

void sub_10000C8B0(uint64_t a1)
{
  uint64_t v1;

  sub_10000A538(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000C8B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000C8FC(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000C914()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000C948()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10001E31C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000683C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10001E318 + dword_10001E318))(v2, v3, v4);
}

uint64_t sub_10000C9B8()
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
  v5 = (_QWORD *)swift_task_alloc(dword_10001E32C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000082E8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10001E328 + dword_10001E328))(v2, v3, v4);
}

uint64_t sub_10000CA34()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000CA60(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10001E33C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1000082E8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10001E338 + dword_10001E338))(a1, v4, v5, v6);
}

uint64_t sub_10000CAE4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CB08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001E34C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000683C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001E348 + dword_10001E348))(a1, v4);
}

uint64_t sub_10000CBB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100004170(&qword_10001E3C8);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10000CD14();
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, nullsub_1, 0, &type metadata for ContentView, v4);
  v5 = sub_10000CD58();
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000CCB0();
  static App.main()();
  return 0;
}

unint64_t sub_10000CCB0()
{
  unint64_t result;

  result = qword_10001E3C0;
  if (!qword_10001E3C0)
  {
    result = swift_getWitnessTable("U_", &type metadata for PASViewServiceApp);
    atomic_store(result, (unint64_t *)&qword_10001E3C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PASViewServiceApp()
{
  return &type metadata for PASViewServiceApp;
}

uint64_t sub_10000CD04(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100015B80, 1);
}

unint64_t sub_10000CD14()
{
  unint64_t result;

  result = qword_10001E3D0;
  if (!qword_10001E3D0)
  {
    result = swift_getWitnessTable(&unk_100012F74, &type metadata for ContentView);
    atomic_store(result, (unint64_t *)&qword_10001E3D0);
  }
  return result;
}

unint64_t sub_10000CD58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E3D8;
  if (!qword_10001E3D8)
  {
    v1 = sub_10000949C(&qword_10001E3C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E3D8);
  }
  return result;
}

void sub_10000CDA8(uint64_t a1, void *a2)
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

char *sub_10000CDF8()
{
  char *v0;
  id v1;
  char *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  objc_super v16;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate] = 0;
  v1 = objc_allocWithZone((Class)VPScannerProxCardViewController);
  v2 = v0;
  v3 = objc_msgSend(v1, "init");
  v4 = OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC;
  *(_QWORD *)&v2[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC] = v3;

  v5 = *(_QWORD *)&v2[v4];
  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  v6 = (char *)objc_msgSendSuper2(&v16, "initWithScannerEngine:", v5);
  v7 = *(void **)&v6[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC];
  v8 = swift_allocObject(&unk_1000190B8, 24, 7);
  *(_QWORD *)(v8 + 16) = v6;
  v14[4] = sub_10000DAAC;
  v15 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10000AE14;
  v14[3] = &unk_1000190D0;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = v6;
  v12 = v7;
  swift_release(v10);
  objc_msgSend(v12, "setScannedCodeHandler:", v9);

  _Block_release(v9);
  return v11;
}

void sub_10000CF34()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t ObjCClassFromMetadata;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSString v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSString v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSString v34;
  id v35;
  id v36;
  _BYTE v37[16];
  objc_super v38;

  v1 = type metadata accessor for Locale(0);
  __chkstk_darwin(v1);
  v3 = &v37[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v4);
  v6 = &v37[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = (objc_class *)type metadata accessor for PASVSScannerCardViewController();
  v38.receiver = v0;
  v38.super_class = v7;
  objc_msgSendSuper2(&v38, "viewDidLoad");
  objc_msgSend(v0, "setDismissalType:", 1);
  String.LocalizationValue.init(_:)(0xD000000000000019, 0x8000000100016830);
  v8 = type metadata accessor for PASVSPrimaryViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v8);
  v10 = (void *)objc_opt_self(NSBundle);
  v11 = objc_msgSend(v10, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v11, v3, 0, 0, 256);
  v13 = v12;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  objc_msgSend(v0, "setTitle:", v14);

  String.LocalizationValue.init(_:)(0xD00000000000001FLL, 0x8000000100016850);
  v15 = objc_msgSend(v10, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v15, v3, 0, 0, 256);
  v17 = v16;
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  objc_msgSend(v0, "setSubtitle:", v18);

  String.LocalizationValue.init(_:)(0xD00000000000001FLL, 0x8000000100016870);
  v19 = objc_msgSend(v10, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v19, v3, 0, 0, 256);
  v21 = v20;
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v21);
  String.LocalizationValue.init(_:)(0xD000000000000021, 0x8000000100016890);
  v23 = objc_msgSend(v10, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v23, v3, 0, 0, 256);
  v25 = v24;
  v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v25);
  String.LocalizationValue.init(_:)(0xD000000000000019, 0x80000001000168C0);
  v27 = objc_msgSend(v10, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v27, v3, 0, 0, 256);
  v29 = v28;
  v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v29);
  String.LocalizationValue.init(_:)(0xD000000000000019, 0x80000001000168E0);
  v31 = objc_msgSend(v10, "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v31, v3, 0, 0, 256);
  v33 = v32;
  v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v33);
  v35 = objc_msgSend(v0, "dismissalConfirmationActionWithTitle:message:confirmButtonTitle:cancelButtonTitle:", v22, v26, v30, v34);

  objc_msgSend(v0, "setDismissButtonAction:", v35);
  v36 = sub_10000D3C0();

}

id sub_10000D3C0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  void *v15;
  id v16;
  _QWORD aBlock[5];
  uint64_t v20;

  v1 = type metadata accessor for Locale(0);
  __chkstk_darwin(v1);
  v3 = (char *)&aBlock[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v4);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.LocalizationValue.init(_:)(0xD000000000000010, 0x8000000100016900);
  v7 = type metadata accessor for PASVSPrimaryViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v7);
  v9 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v9, v3, 0, 0, 256);
  v11 = v10;
  v12 = swift_allocObject(&unk_100019068, 24, 7);
  *(_QWORD *)(v12 + 16) = v0;
  v13 = v0;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  aBlock[4] = sub_10000DA8C;
  v20 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CDA8;
  aBlock[3] = &unk_100019080;
  v15 = _Block_copy(aBlock);
  v16 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v14, 1, v15);

  _Block_release(v15);
  swift_release(v20);
  return v16;
}

void sub_10000D5D4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  uint64_t v13;
  void *v14;
  NSString v15;
  _BYTE v16[16];

  v1 = type metadata accessor for Locale(0);
  __chkstk_darwin(v1);
  v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v4);
  v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v0, "showConfirmationRing");
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC], "stop");
  String.LocalizationValue.init(_:)(0xD000000000000011, 0x80000001000167C0);
  v7 = type metadata accessor for PASVSPrimaryViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v7);
  v9 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)(v6, 0, 0, v9, v3, 0, 0, 256);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  objc_msgSend(v0, "showActivityIndicatorWithStatus:", v12);

  v14 = *(void **)&v0[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate];
  if (v14)
  {
    swift_unknownObjectRetain(v14, v13);
    v15 = String._bridgeToObjectiveC()();
    objc_msgSend(v14, "handleScannedCode:", v15);

    swift_unknownObjectRelease(v14);
  }
}

id sub_10000D8C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PASVSScannerCardViewController()
{
  return objc_opt_self(_TtC14PASViewService30PASVSScannerCardViewController);
}

id sub_10000D948(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id result;
  uint64_t v14;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = PASLogger.viewService.unsafeMutableAddressor(v5);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v3);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "User has elected manual pairing.", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  result = *(id *)(a2 + OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate);
  if (result)
    return objc_msgSend(result, "enableManualPairing");
  return result;
}

uint64_t sub_10000DA68()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10000DA8C(uint64_t a1)
{
  uint64_t v1;

  return sub_10000D948(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000DA94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000DAA4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000DAAC()
{
  sub_10000D5D4();
}

void sub_10000DAD8()
{
  qword_10001EA90 = 0x64615069786F7250;
  *(_QWORD *)algn_10001EA98 = 0xEF636972656E6547;
}

id sub_10000DB08()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for PASBundleForViewService();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_10001EAA0 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for PASBundleForViewService()
{
  return objc_opt_self(_TtC14PASViewService23PASBundleForViewService);
}

unint64_t sub_10000DB78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004170(&qword_10001DFC0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_1000093C8(v7, (uint64_t)v16, &qword_10001E4F0);
    result = sub_10001162C((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100008018(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10000DCB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004170(&qword_10001E4E0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_1000093C8(v7, (uint64_t)&v14, &qword_10001E4E8);
    v8 = v14;
    result = sub_10001165C(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_100008018(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_10000DDE4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t inited;
  NSString *v37;
  id v38;
  unint64_t v39;
  id v40;
  NSString v41;
  Class isa;
  id v43;
  NSString v44;
  id v45;
  char v48[72];
  _QWORD v49[2];
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;

  v14 = sub_100004170(&qword_10001E4B0);
  __chkstk_darwin(v14);
  v16 = &v48[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v52 = a6;
  v53 = a7;
  v50 = a1;
  v51 = a2;
  v49[0] = a3;
  v49[1] = a4;
  v17 = sub_10000E16C();
  v18 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)(&v50, v49, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v17, v17, v17);
  v20 = v19;
  v52 = v18;
  v53 = v19;
  v50 = a3;
  v51 = a4;
  v21 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v16, 1, 1, v21);
  v22 = StringProtocol.range<A>(of:options:range:locale:)(&v50, 0, 0, 0, 1, v16, &type metadata for String, &type metadata for String, v17, v17);
  v24 = v23;
  LOBYTE(a3) = v25;
  sub_10000E1B0((uint64_t)v16);
  if ((a3 & 1) != 0 || (v22 ^ v24) < 0x4000)
  {
    v45 = objc_allocWithZone((Class)NSAttributedString);
    v44 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    v43 = objc_msgSend(v45, "initWithString:", v44);
  }
  else
  {
    v52 = v22;
    v53 = v24;
    v50 = v18;
    v51 = v20;
    swift_bridgeObjectRetain(v20);
    v26 = sub_100004170(&qword_10001E4C0);
    v27 = sub_10000E1F0();
    v28 = _NSRange.init<A, B>(_:in:)(&v52, &v50, v26, &type metadata for String, v27, v17);
    v30 = v29;
    v31 = (void *)objc_opt_self(UIFont);
    v32 = objc_msgSend(v31, "preferredFontForTextStyle:", a5);
    objc_msgSend(v32, "pointSize");
    v34 = v33;

    v35 = sub_100004170(&qword_10001E4D0);
    inited = swift_initStackObject(v35, v48);
    *(_OWORD *)(inited + 16) = xmmword_100012BB0;
    *(_QWORD *)(inited + 32) = NSFontAttributeName;
    v37 = NSFontAttributeName;
    v38 = objc_msgSend(v31, "systemFontOfSize:", v34);
    *(_QWORD *)(inited + 64) = sub_10000E23C();
    *(_QWORD *)(inited + 40) = v38;
    v39 = sub_10000DCB8(inited);
    v40 = objc_allocWithZone((Class)NSMutableAttributedString);
    v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    type metadata accessor for Key(0);
    sub_10000E278();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v39);
    v43 = objc_msgSend(v40, "initWithString:attributes:", v41, isa);

    v44 = objc_msgSend(v31, "boldSystemFontOfSize:", v34);
    objc_msgSend(v43, "addAttribute:value:range:", v37, v44, v28, v30);
  }

  return v43;
}

unint64_t sub_10000E16C()
{
  unint64_t result;

  result = qword_10001E4B8;
  if (!qword_10001E4B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001E4B8);
  }
  return result;
}

uint64_t sub_10000E1B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004170(&qword_10001E4B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E1F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E4C8;
  if (!qword_10001E4C8)
  {
    v1 = sub_10000949C(&qword_10001E4C0);
    result = swift_getWitnessTable(&protocol conformance descriptor for Range<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E4C8);
  }
  return result;
}

unint64_t sub_10000E23C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E4D8;
  if (!qword_10001E4D8)
  {
    v1 = objc_opt_self(UIFont);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001E4D8);
  }
  return result;
}

unint64_t sub_10000E278()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DFF8;
  if (!qword_10001DFF8)
  {
    type metadata accessor for Key(255);
    result = swift_getWitnessTable(&unk_100012DE4, v1);
    atomic_store(result, (unint64_t *)&qword_10001DFF8);
  }
  return result;
}

uint64_t sub_10000E2C0(void *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  _QWORD *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t result;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, void *);
  id v62;
  NSObject *v63;
  os_log_type_t v64;
  _BOOL4 v65;
  uint64_t v66;
  id v67;
  _QWORD *v68;
  os_log_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  os_log_t v87;
  _QWORD *v88;
  int v89;
  uint64_t v90;
  uint64_t (*v91)(char *, uint64_t, id);
  uint64_t v92;
  uint64_t (*v93)(uint64_t);
  uint64_t v94;
  uint64_t v95;
  void *v96;
  _QWORD v97[2];
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  _BYTE v102[48];

  v4 = v3;
  v94 = a3;
  v7 = sub_100004170(&qword_10001E310);
  __chkstk_darwin(v7);
  v9 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v95 = *(_QWORD *)(v10 - 8);
  v96 = (void *)v10;
  v11 = __chkstk_darwin(v10);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v86 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v86 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v86 - v19;
  v21 = (id)__chkstk_darwin(v18);
  v23 = (char *)&v86 - v22;
  if (a1 && (v21 = objc_msgSend(a1, "userInfo")) != 0)
  {
    v24 = v21;
    v93 = a2;
    v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v21, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v97[0] = 0x656369766564;
    v97[1] = 0xE600000000000000;
    AnyHashable.init<A>(_:)(v97, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v25 + 16) && (v26 = sub_10001162C((uint64_t)&v101), (v27 & 1) != 0))
    {
      sub_1000080B8(*(_QWORD *)(v25 + 56) + 32 * v26, (uint64_t)&v98);
    }
    else
    {
      v98 = 0u;
      v99 = 0u;
    }
    sub_100008028((uint64_t)&v101);
    if (*((_QWORD *)&v99 + 1))
    {
      v37 = sub_100004170(&qword_10001E590);
      v38 = swift_dynamicCast(v97, &v98, (char *)&type metadata for Any + 8, v37, 6);
      if ((v38 & 1) != 0)
      {
        swift_bridgeObjectRelease(v25);
        v39 = v97[0];
        v40 = objc_allocWithZone((Class)CBDevice);
        v55 = sub_100010E28(v39);
        v56 = objc_msgSend(v55, "nearbyActionDeviceClass");
        v100 = 0;
        v98 = 0u;
        v99 = 0u;
        v57 = objc_msgSend((id)objc_opt_self(AKDevice), "currentDevice");
        if (v57)
        {
          PASDevice.init(deviceClass:biometryProvider:ak_device:)(&v101, v56, &v98, v57);
          v58 = (uint64_t)&v4[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
          swift_beginAccess(&v4[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice], &v98, 33, 0);
          sub_100011C94((uint64_t)&v101, v58, &qword_10001E2F0);
          v59 = swift_endAccess(&v98);
          v60 = PASLogger.viewService.unsafeMutableAddressor(v59);
          v61 = *(void (**)(char *, uint64_t, void *))(v95 + 16);
          v61(v23, v60, v96);
          v62 = v55;
          v63 = Logger.logObject.getter(v62);
          v64 = static os_log_type_t.info.getter();
          LODWORD(v92) = v64;
          v65 = os_log_type_enabled(v63, v64);
          v91 = (uint64_t (*)(char *, uint64_t, id))v61;
          v90 = v60;
          if (v65)
          {
            v66 = swift_slowAlloc(22, -1);
            v88 = (_QWORD *)swift_slowAlloc(8, -1);
            *(_DWORD *)v66 = 141558274;
            v101 = 1752392040;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, v102);
            *(_WORD *)(v66 + 12) = 2112;
            v89 = (int)v56;
            v87 = v63;
            v101 = (uint64_t)v62;
            v67 = v62;
            LODWORD(v56) = v89;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, v102);
            v68 = v88;
            *v88 = v62;

            v69 = v87;
            _os_log_impl((void *)&_mh_execute_header, v87, (os_log_type_t)v92, "PASVSPrimaryViewController Started CoreBluetooth device %{mask.hash}@", (uint8_t *)v66, 0x16u);
            v70 = sub_100004170(&qword_10001DE68);
            swift_arrayDestroy(v68, 1, v70);
            swift_slowDealloc(v68, -1, -1);
            swift_slowDealloc(v66, -1, -1);

          }
          else
          {

          }
          v71 = (uint64_t)v93;
          v55 = v96;
          v25 = *(_QWORD *)(v95 + 8);
          ((void (*)(char *, void *))v25)(v23, v96);
          v72 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device;
          v73 = *(void **)&v4[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device];
          *(_QWORD *)&v4[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device] = v62;

          if (*(_QWORD *)&v4[v72])
          {
            v74 = *(_QWORD *)PASServices.shared.unsafeMutableAddressor();
            swift_retain(v74);
            PASServices.registerSourceServices()();
            swift_release(v74);
            v75 = type metadata accessor for TaskPriority(0);
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 56))(v9, 1, 1, v75);
            type metadata accessor for MainActor(0);
            v76 = v4;
            v77 = v94;
            v78 = sub_100011B8C(v71, v94);
            v79 = static MainActor.shared.getter(v78);
            v80 = swift_allocObject(&unk_100019228, 64, 7);
            *(_QWORD *)(v80 + 16) = v79;
            *(_QWORD *)(v80 + 24) = &protocol witness table for MainActor;
            *(_QWORD *)(v80 + 32) = v76;
            *(_DWORD *)(v80 + 40) = (_DWORD)v56;
            *(_QWORD *)(v80 + 48) = v71;
            *(_QWORD *)(v80 + 56) = v77;
            v81 = sub_10000F720((uint64_t)v9, (uint64_t)&unk_10001E5A0, v80);
            return swift_release(v81);
          }
        }
        else
        {
          __break(1u);
        }
        v82 = v91(v20, v90, v55);
        v83 = Logger.logObject.getter(v82);
        v84 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v83, v84))
        {
          v85 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v85 = 0;
          _os_log_impl((void *)&_mh_execute_header, v83, v84, "PASVSPrimaryViewController No remote device, exiting PASViewService.", v85, 2u);
          swift_slowDealloc(v85, -1, -1);
        }

        ((void (*)(char *, void *))v25)(v20, v96);
        exit(-1);
      }
    }
    else
    {
      v38 = sub_100006884((uint64_t)&v98, &qword_10001E560);
    }
    v41 = PASLogger.viewService.unsafeMutableAddressor(v38);
    v43 = v95;
    v42 = v96;
    (*(void (**)(char *, uint64_t, void *))(v95 + 16))(v17, v41, v96);
    v44 = swift_bridgeObjectRetain(v25);
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = swift_slowAlloc(22, -1);
      v48 = swift_slowAlloc(32, -1);
      v101 = v48;
      *(_DWORD *)v47 = 141558274;
      *(_QWORD *)&v98 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, (char *)&v98 + 8);
      *(_WORD *)(v47 + 12) = 2080;
      v92 = v47 + 14;
      v49 = swift_bridgeObjectRetain(v25);
      v50 = Dictionary.description.getter(v49, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v52 = v51;
      swift_bridgeObjectRelease(v25);
      *(_QWORD *)&v98 = sub_100010FEC(v50, v52, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, (char *)&v98 + 8);
      swift_bridgeObjectRelease_n(v25, 2);
      swift_bridgeObjectRelease(v52);
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "PASVSPrimaryViewController No device to start setup: %{mask.hash}s", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v47, -1, -1);

      result = (*(uint64_t (**)(char *, void *))(v95 + 8))(v17, v96);
    }
    else
    {

      swift_bridgeObjectRelease_n(v25, 2);
      result = (*(uint64_t (**)(char *, void *))(v43 + 8))(v17, v42);
    }
    if (v93)
      return v93(result);
  }
  else
  {
    v28 = PASLogger.viewService.unsafeMutableAddressor(v21);
    v30 = v95;
    v29 = v96;
    (*(void (**)(char *, uint64_t, void *))(v95 + 16))(v14, v28, v96);
    v31 = a1;
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v93 = a2;
      v34 = swift_slowAlloc(22, -1);
      v35 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v34 = 141558274;
      v101 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, v102);
      *(_WORD *)(v34 + 12) = 2112;
      if (a1)
      {
        v101 = (uint64_t)v31;
        v36 = v31;
      }
      else
      {
        v101 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, v102);
      *v35 = a1;

      _os_log_impl((void *)&_mh_execute_header, v32, v33, "PASVSPrimaryViewController No user info dictionary to start setup: %{mask.hash}@", (uint8_t *)v34, 0x16u);
      v54 = sub_100004170(&qword_10001DE68);
      swift_arrayDestroy(v35, 1, v54);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v34, -1, -1);
      a2 = v93;
      v30 = v95;
      v29 = v96;
    }
    else
    {

      v32 = v31;
    }

    result = (*(uint64_t (**)(char *, void *))(v30 + 8))(v14, v29);
    if (a2)
      return a2(result);
  }
  return result;
}

uint64_t sub_10000ED9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v7 + 184) = a6;
  *(_QWORD *)(v7 + 192) = a7;
  *(_DWORD *)(v7 + 352) = a5;
  *(_QWORD *)(v7 + 176) = a4;
  v8 = type metadata accessor for Logger(0);
  *(_QWORD *)(v7 + 200) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 208) = v9;
  *(_QWORD *)(v7 + 216) = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v7 + 224) = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  *(_QWORD *)(v7 + 232) = v11;
  *(_QWORD *)(v7 + 240) = v12;
  return swift_task_switch(sub_10000EE38, v11, v12);
}

uint64_t sub_10000EE38()
{
  _QWORD *v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0[22] + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__extensionCache);
  v2 = *(void (**)(uint64_t))(*(_QWORD *)v1 + 128);
  v3 = swift_retain(v1);
  v2(v3);
  swift_release(v1);
  v4 = v0[11];
  v5 = v0[12];
  sub_100007F28(v0 + 8, v4);
  v6 = *(int **)(v5 + 8);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc(v6[1]);
  v0[31] = v7;
  *v7 = v0;
  v7[1] = sub_10000EEE8;
  return v9(v4, v5);
}

uint64_t sub_10000EEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 248);
  v3[32] = a1;
  v3[33] = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_10000EF40, v3[29], v3[30]);
}

id sub_10000EF40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  id result;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD *v37;
  __int128 v38;
  uint64_t v39;
  void *v40;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension;
  *(_QWORD *)(v0 + 272) = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension;
  v3 = v1 + v2;
  v4 = *(_QWORD *)(v1 + v2);
  v5 = *(void **)(v1 + v2 + 8);
  *(_OWORD *)(v1 + v2) = *(_OWORD *)(v0 + 256);
  sub_100011C68(v4, v5);
  sub_100008098((_QWORD *)(v0 + 64));
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__deviceProvider);
  v7 = *(void (**)(uint64_t))(*(_QWORD *)v6 + 128);
  v8 = swift_retain(v6);
  v7(v8);
  v9 = swift_release(v6);
  v10 = *(_QWORD *)(v0 + 168);
  PASDeviceProvider.sourceDevice.getter(v9);
  swift_release(v10);
  v11 = *(_QWORD *)(v0 + 128);
  if (v11)
  {
    v12 = *(_QWORD *)(v0 + 136);
    v13 = sub_100007F28((_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 128));
    v14 = *(_QWORD *)(v11 - 8);
    v15 = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(v14 + 16))(v15, v13, v11);
    sub_100006884(v0 + 104, &qword_10001E5A8);
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 40))(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v11);
    swift_task_dealloc(v15);
  }
  else
  {
    sub_100006884(v0 + 104, &qword_10001E5A8);
    v16 = 0;
  }
  v17 = v11 == 0;
  v18 = *(unsigned int *)(v0 + 352);
  v19 = objc_allocWithZone((Class)type metadata accessor for PASExtensionDevicePair(0));
  LOBYTE(v38) = 0;
  v20 = PASExtensionDevicePair.init(targetDeviceType:sourceDeviceBiometryType:)(v18, v16, v17);
  *(_QWORD *)(v0 + 280) = v20;
  v21 = *(void **)v3;
  *(_QWORD *)(v0 + 288) = *(_QWORD *)v3;
  if (v21)
  {
    v22 = v20;
    v23 = *(void **)(v3 + 8);
    sub_1000080F4(v21, v23);
    v24 = swift_retain(v21);
    sub_100011C68(v24, v23);
    v25 = (_QWORD *)swift_task_alloc(async function pointer to PASExtensionHandle.viewDetails(for:)[1]);
    *(_QWORD *)(v0 + 296) = v25;
    *v25 = v0;
    v25[1] = sub_10000F2A8;
    return (id)PASExtensionHandle.viewDetails(for:)(v22);
  }
  else
  {
    *(_OWORD *)(v0 + 32) = 0u;
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    v27 = *(_QWORD *)(v0 + 176) + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails;
    swift_beginAccess(v27, v0 + 144, 33, 0);
    sub_100011C94(v0 + 16, v27, &qword_10001E580);
    swift_endAccess(v0 + 144);
    result = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
    if (result)
    {
      v28 = result;
      v29 = *(_QWORD *)(v0 + 272);
      v30 = *(_QWORD *)(v0 + 176);
      v39 = sub_10000C878(0, &qword_10001E5B0, ACAccountStore_ptr);
      v40 = &protocol witness table for ACAccountStore;
      v31 = objc_msgSend((id)objc_opt_self(FMDFMIPManager), "sharedInstance", v28);
      v32 = type metadata accessor for AccountSecurityLevelCalculator();
      v33 = swift_allocObject(v32, 16, 7);
      v34 = *(void **)(v30 + v29);
      if (v34)
      {
        v35 = *(void **)(*(_QWORD *)(v0 + 176) + *(_QWORD *)(v0 + 272) + 8);
        sub_1000080F4(v34, v35);
        v36 = v35;
        sub_100011C68((uint64_t)v34, v35);
      }
      else
      {
        v35 = 0;
      }
      *(_QWORD *)(v0 + 320) = sub_100011914(&v38, (uint64_t)v31, v33, (uint64_t)v35);
      v37 = (_QWORD *)swift_task_alloc(dword_10001E0D4);
      *(_QWORD *)(v0 + 328) = v37;
      *v37 = v0;
      v37[1] = sub_10000F4D8;
      return (id)sub_10000832C();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_10000F2A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 296);
  *(_QWORD *)(*(_QWORD *)v2 + 304) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = v4[29];
    v7 = v4[30];
    v8 = sub_10000F6C8;
  }
  else
  {
    swift_release(v4[36]);
    v4[39] = a1;
    v6 = v4[29];
    v7 = v4[30];
    v8 = sub_10000F324;
  }
  return swift_task_switch(v8, v6, v7);
}

id sub_10000F324()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id result;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  __int128 v15;
  uint64_t v16;
  void *v17;

  v1 = v0[39];
  v2 = type metadata accessor for PASExtensionProvidedViewDetails(0);
  v0[2] = v1;
  v0[5] = v2;
  v0[6] = &protocol witness table for PASExtensionProvidedViewDetails;
  v0[7] = &protocol witness table for PASExtensionProvidedViewDetails;
  v3 = v0[22] + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails;
  swift_beginAccess(v3, v0 + 18, 33, 0);
  sub_100011C94((uint64_t)(v0 + 2), v3, &qword_10001E580);
  swift_endAccess(v0 + 18);
  result = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
  if (result)
  {
    v5 = result;
    v6 = v0[34];
    v7 = v0[22];
    v16 = sub_10000C878(0, &qword_10001E5B0, ACAccountStore_ptr);
    v17 = &protocol witness table for ACAccountStore;
    *(_QWORD *)&v15 = v5;
    v8 = objc_msgSend((id)objc_opt_self(FMDFMIPManager), "sharedInstance");
    v9 = type metadata accessor for AccountSecurityLevelCalculator();
    v10 = swift_allocObject(v9, 16, 7);
    v11 = *(void **)(v7 + v6);
    if (v11)
    {
      v12 = *(void **)(v0[22] + v0[34] + 8);
      sub_1000080F4(v11, v12);
      v13 = v12;
      sub_100011C68((uint64_t)v11, v12);
    }
    else
    {
      v12 = 0;
    }
    v0[40] = sub_100011914(&v15, (uint64_t)v8, v10, (uint64_t)v12);
    v14 = (_QWORD *)swift_task_alloc(dword_10001E0D4);
    v0[41] = v14;
    *v14 = v0;
    v14[1] = sub_10000F4D8;
    return (id)sub_10000832C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F4D8(__int16 a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *v3;
  v5 = *(_QWORD *)(*v3 + 328);
  *(_WORD *)(v4 + 356) = a1;
  *(_QWORD *)(v4 + 336) = a2;
  *(_QWORD *)(v4 + 344) = a3;
  swift_task_dealloc(v5);
  return swift_task_switch(sub_10000F534, *(_QWORD *)(v4 + 232), *(_QWORD *)(v4 + 240));
}

uint64_t sub_10000F534()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(unsigned __int16 *)(v0 + 356);
  v4 = *(_QWORD *)(v0 + 176);
  swift_release(*(_QWORD *)(v0 + 224));
  v5 = v3 & 0x101010101010101;
  v6 = (unsigned __int8 *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult);
  v7 = *(_QWORD *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult);
  v8 = *(_QWORD *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult + 8);
  v9 = *(_QWORD *)(v4 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult + 16);
  *(_QWORD *)v6 = v5;
  *((_QWORD *)v6 + 1) = v1;
  *((_QWORD *)v6 + 2) = v2;
  v10 = sub_100010F0C(v7, v8, v9);
  v11 = *((_QWORD *)v6 + 2);
  if (v11 == 1
    || (v12 = *v6,
        v13 = *((_QWORD *)v6 + 1),
        v14 = ((unint64_t)*(unsigned int *)(v6 + 1) << 8) | ((unint64_t)(*(unsigned __int16 *)(v6 + 5) | (v6[7] << 16)) << 40) | v12,
        swift_bridgeObjectRetain(v11),
        v10 = sub_100010F0C(v14, v13, v11),
        (v12 & 1) == 0))
  {
    v20 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 216);
    v21 = *(_QWORD *)(v0 + 200);
    v22 = PASLogger.viewService.unsafeMutableAddressor(v10);
    v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v22, v21);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Validator says we should not show prox card, exiting PASViewService.", v26, 2u);
      swift_slowDealloc(v26, -1, -1);
    }
    v28 = *(_QWORD *)(v0 + 208);
    v27 = *(_QWORD *)(v0 + 216);
    v29 = *(_QWORD *)(v0 + 200);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    exit(-1);
  }
  v15 = *(void (**)(uint64_t))(v0 + 184);
  if (v15)
    v15(v10);
  v16 = *(_QWORD *)(v0 + 320);
  v17 = *(_QWORD *)(v0 + 216);

  swift_release(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);

  swift_release(v2);
  swift_release(v1);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned __int8 v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100006884(a1, &qword_10001E310);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      v16 = 0;
      return swift_task_create(v8, v16, (char *)&type metadata for () + 8, a2, a3);
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v17 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
      goto LABEL_6;
  }
  v10 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9, v12);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  v15 = v14;
  swift_unknownObjectRelease(v9);
  if (!(v15 | v13))
    goto LABEL_6;
  v19[0] = 0;
  v19[1] = 0;
  v16 = v19;
  v19[2] = v13;
  v19[3] = v15;
  return swift_task_create(v8, v16, (char *)&type metadata for () + 8, a2, a3);
}

void sub_10000F904()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _BYTE *v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  NSString v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[48];
  uint64_t v88;
  char v89[24];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  char v98[16];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v81 - v8;
  v10 = *(void **)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device];
  if (!v10)
  {
    v75 = PASLogger.viewService.unsafeMutableAddressor(v7);
    v76 = v3;
    v77 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v75, v2);
    v78 = Logger.logObject.getter(v77);
    v79 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v80 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, v79, "No CBDevice present, unable to show prox card, exiting PASViewService.", v80, 2u);
      swift_slowDealloc(v80, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v76 + 8))(v6, v2);
    exit(-1);
  }
  v11 = (uint64_t)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails];
  swift_beginAccess(&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails], v98, 0, 0);
  sub_1000093C8(v11, (uint64_t)&v94, &qword_10001E580);
  v12 = *((_QWORD *)&v95 + 1);
  v85 = v11;
  v83 = v3;
  if (*((_QWORD *)&v95 + 1))
  {
    v13 = v96;
    v14 = sub_100007F28(&v94, *((uint64_t *)&v95 + 1));
    *((_QWORD *)&v91 + 1) = v12;
    *(_QWORD *)&v92 = v13;
    v15 = sub_100011B0C(&v90);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v15, v14, v12);
    v16 = v10;
    sub_100008098(&v94);
  }
  else
  {
    v17 = v10;
    sub_100006884((uint64_t)&v94, &qword_10001E580);
    v90 = 0u;
    v91 = 0u;
    *(_QWORD *)&v92 = 0;
  }
  v18 = objc_allocWithZone((Class)type metadata accessor for PASVSSetupEventPresenter());
  v19 = sub_10000969C((uint64_t)&v90);
  v20 = *(void **)&v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController];
  *(_QWORD *)&v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController] = v1;
  v21 = v1;

  v22 = &v21[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult];
  v23 = *(_QWORD *)&v21[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult + 16];
  if (v23 == 1)
  {
    v24 = 0;
  }
  else
  {
    v25 = v22[1];
    v24 = v25 & 1;
    v26 = *((_QWORD *)v22 + 1);
    v27 = ((unint64_t)*(unsigned int *)(v22 + 2) << 16) | ((unint64_t)*((unsigned __int16 *)v22 + 3) << 48) | *v22 | (v25 << 8);
    swift_bridgeObjectRetain(*(_QWORD *)&v21[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult
                                           + 16]);
    sub_100010F0C(v27, v26, v23);
  }
  v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_hasEligibleAccountForProxSetup] = v24;
  v28 = *((_QWORD *)v22 + 2);
  v84 = v10;
  if (v28 == 1
    || (v30 = *(_QWORD *)v22,
        v29 = *((_QWORD *)v22 + 1),
        swift_bridgeObjectRetain(v28),
        sub_100010F20(v30, v29, v28),
        sub_100010F0C(v30, v29, v28),
        !v28))
  {
    swift_bridgeObjectRelease(0);
    v29 = 0;
    v28 = 0xE000000000000000;
  }
  v31 = (uint64_t *)&v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName];
  v32 = *(_QWORD *)&v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName + 8];
  *v31 = v29;
  v31[1] = v28;
  swift_bridgeObjectRelease(v32);
  v33 = &v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_proxyDelegate];
  *((_QWORD *)v33 + 1) = &off_1000191E0;
  swift_unknownObjectWeakAssign(v33, v21);
  v34 = (uint64_t)&v21[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
  swift_beginAccess(&v21[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice], v89, 0, 0);
  v35 = sub_1000093C8(v34, (uint64_t)&v90, &qword_10001E2F0);
  if (*((_QWORD *)&v91 + 1))
  {
    v94 = v90;
    v95 = v91;
    v96 = v92;
    v97 = v93;
    v36 = PASLogger.common.unsafeMutableAddressor(v35);
    v37 = v83;
    (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v9, v36, v2);
    v38 = sub_100007FA8((uint64_t)&v94, (uint64_t)&v90);
    v39 = Logger.logObject.getter(v38);
    v40 = v2;
    v41 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v39, v41))
    {
      v42 = swift_slowAlloc(22, -1);
      v43 = swift_slowAlloc(32, -1);
      v82 = v40;
      v44 = v43;
      v88 = v43;
      *(_DWORD *)v42 = 141558274;
      v86 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, v87);
      *(_WORD *)(v42 + 12) = 2080;
      sub_100007FA8((uint64_t)&v90, (uint64_t)&v86);
      v45 = String.init<A>(describing:)(&v86, &type metadata for PASDevice);
      v47 = v46;
      v86 = sub_100010FEC(v45, v46, &v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, v87);
      swift_bridgeObjectRelease(v47);
      sub_100007FE4((uint64_t)&v90);
      _os_log_impl((void *)&_mh_execute_header, v39, v41, "Setting target Device to :%{mask.hash}s", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v42, -1, -1);

      (*(void (**)(char *, uint64_t))(v83 + 8))(v9, v82);
    }
    else
    {
      sub_100007FE4((uint64_t)&v90);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v40);
    }
    v48 = v84;
    sub_100007FA8((uint64_t)&v94, (uint64_t)&v90);
    v49 = (uint64_t)&v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice];
    swift_beginAccess(&v19[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice], &v86, 33, 0);
    sub_100011C94((uint64_t)&v90, v49, &qword_10001E2F0);
    swift_endAccess(&v86);
    sub_100007FE4((uint64_t)&v94);
  }
  else
  {
    sub_100006884((uint64_t)&v90, &qword_10001E2F0);
    v48 = v84;
  }
  v50 = objc_msgSend(objc_allocWithZone((Class)SKDevice), "init");
  v51 = objc_msgSend(v48, "identifier");
  objc_msgSend(v50, "setIdentifier:", v51);

  v52 = objc_msgSend(objc_allocWithZone((Class)SKSetupAppleIDSignInClient), "init");
  objc_msgSend(v52, "setPasswordType:", 2);
  objc_msgSend(v52, "setPeerDevice:", v50);
  objc_msgSend(v52, "setPersistentPairing:", 0);
  sub_1000093C8(v85, (uint64_t)&v94, &qword_10001E580);
  v53 = *((_QWORD *)&v95 + 1);
  if (*((_QWORD *)&v95 + 1))
  {
    v54 = *((_QWORD *)&v96 + 1);
    v55 = sub_100007F28(&v94, *((uint64_t *)&v95 + 1));
    *((_QWORD *)&v91 + 1) = v53;
    *(_QWORD *)&v92 = v54;
    v56 = sub_100011B0C(&v90);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v53 - 8) + 16))(v56, v55, v53);
    sub_100008098(&v94);
  }
  else
  {
    sub_100006884((uint64_t)&v94, &qword_10001E580);
    v90 = 0u;
    v91 = 0u;
    *(_QWORD *)&v92 = 0;
  }
  *((_QWORD *)&v95 + 1) = &type metadata for DTOStatusProvider;
  *(_QWORD *)&v96 = &off_100018C78;
  v57 = type metadata accessor for PASVSSetupFlowController();
  v58 = swift_allocObject(v57, 192, 7);
  v59 = sub_100010F34((uint64_t)&v94, (uint64_t)&type metadata for DTOStatusProvider);
  __chkstk_darwin(v59);
  (*(void (**)(void))(v60 + 16))();
  v61 = v52;
  v62 = v19;
  v63 = sub_100011A3C((uint64_t)v61, (uint64_t)v62, (uint64_t)&v90, v58);
  sub_100008098(&v94);
  v64 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController;
  v65 = *(_QWORD *)&v21[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController];
  *(_QWORD *)&v21[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController] = v63;
  swift_release(v65);
  v66 = *(_QWORD *)&v21[v64];
  if (v66)
  {
    *(_QWORD *)(v66 + 144) = &off_1000191C8;
    swift_unknownObjectWeakAssign(v66 + 136, v21);
  }
  sub_1000093C8(v34, (uint64_t)&v90, &qword_10001E2F0);
  if (*((_QWORD *)&v91 + 1))
  {
    v94 = v90;
    v95 = v91;
    v96 = v92;
    v97 = v93;
    v67 = *(_QWORD *)&v21[v64];
    if (v67)
    {
      v90 = v94;
      v91 = v95;
      v92 = v96;
      v93 = v97;
      swift_beginAccess(v67 + 40, &v86, 33, 0);
      swift_retain(v67);
      sub_100011C94((uint64_t)&v90, v67 + 40, &qword_10001E2F0);
      swift_endAccess(&v86);
      swift_release(v67);
    }
    else
    {
      sub_100007FE4((uint64_t)&v94);
    }
  }
  else
  {
    sub_100006884((uint64_t)&v90, &qword_10001E2F0);
  }
  v68 = objc_msgSend(v21, "_remoteViewControllerProxy");
  if (v68)
  {
    v69 = v68;
    _bridgeAnyObjectToAny(_:)(&v90);
    swift_unknownObjectRelease(v69);
  }
  else
  {
    v90 = 0u;
    v91 = 0u;
  }
  sub_100010DE0((uint64_t)&v90, (uint64_t)&v94);
  if (!*((_QWORD *)&v95 + 1))
  {
    sub_100006884((uint64_t)&v94, &qword_10001E560);
    v73 = *(_QWORD *)&v21[v64];
    if (!v73)
      goto LABEL_35;
    goto LABEL_34;
  }
  v70 = sub_100004170(&qword_10001E568);
  if ((swift_dynamicCast(&v86, &v94, (char *)&type metadata for Any + 8, v70, 6) & 1) != 0)
  {
    v71 = (void *)v86;
    v72 = String._bridgeToObjectiveC()();
    objc_msgSend(v71, "setIdleTimerDisabled:forReason:", 1, v72);
    swift_unknownObjectRelease(v71);

  }
  v73 = *(_QWORD *)&v21[v64];
  if (v73)
  {
LABEL_34:
    v74 = *(void **)(v73 + 32);
    swift_retain(v73);
    objc_msgSend(v74, "showProxCard");
    swift_release(v73);
  }
LABEL_35:

}

void sub_100010300()
{
  sub_100010358("PASVSPrimaryViewController didInvalidateForRemoteAlert");
}

void sub_10001034C()
{
  sub_100010358("PASVSPrimaryViewController flowDidEnd");
}

void sub_100010358(const char *a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSString v18;
  uint64_t v19;
  void *v20;
  _OWORD v21[2];
  _BYTE v22[24];
  uint64_t v23;

  v3 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = PASLogger.common.unsafeMutableAddressor(v6);
  v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v9, v4);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, a1, v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v14 = objc_msgSend(v3, "_remoteViewControllerProxy");
  if (v14)
  {
    v15 = v14;
    _bridgeAnyObjectToAny(_:)(v21);
    swift_unknownObjectRelease(v15);
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_100010DE0((uint64_t)v21, (uint64_t)v22);
  if (v23)
  {
    v16 = sub_100004170(&qword_10001E568);
    if ((swift_dynamicCast(&v20, v22, (char *)&type metadata for Any + 8, v16, 6) & 1) != 0)
    {
      v17 = v20;
      v18 = String._bridgeToObjectiveC()();
      objc_msgSend(v17, "setIdleTimerDisabled:forReason:", 0, v18);
      swift_unknownObjectRelease(v17);

    }
  }
  else
  {
    sub_100006884((uint64_t)v22, &qword_10001E560);
  }
}

id sub_10001053C(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v4;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  NSString v15;
  id v16;
  objc_super v18;

  v4 = v3;
  *(_QWORD *)&v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device] = 0;
  v7 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_QWORD *)v7 + 6) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController] = 0;
  v8 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 1;
  v9 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__extensionCache;
  v10 = sub_100004170(&qword_10001E570);
  swift_allocObject(v10, 56, 7);
  *(_QWORD *)&v3[v9] = PASService.init()();
  v11 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__deviceProvider;
  v12 = sub_100004170(&qword_10001E578);
  swift_allocObject(v12, 24, 7);
  *(_QWORD *)&v3[v11] = PASService.init()();
  v13 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v3[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails];
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  if (a2)
  {
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v15 = 0;
  }
  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for PASVSPrimaryViewController();
  v16 = objc_msgSendSuper2(&v18, "initWithNibName:bundle:", v15, a3);

  return v16;
}

id sub_1000106F8(void *a1)
{
  char *v1;
  void *v2;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  objc_class *v12;
  id v13;
  objc_super v15;

  v2 = v1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_device] = 0;
  v4 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_QWORD *)v4 + 6) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController] = 0;
  v5 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 1;
  v6 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__extensionCache;
  v7 = sub_100004170(&qword_10001E570);
  swift_allocObject(v7, 56, 7);
  *(_QWORD *)&v1[v6] = PASService.init()();
  v8 = OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__deviceProvider;
  v9 = sub_100004170(&qword_10001E578);
  swift_allocObject(v9, 24, 7);
  *(_QWORD *)&v1[v8] = PASService.init()();
  v10 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v1[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails];
  v12 = (objc_class *)type metadata accessor for PASVSPrimaryViewController();
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  v15.receiver = v2;
  v15.super_class = v12;
  v13 = objc_msgSendSuper2(&v15, "initWithCoder:", a1);

  return v13;
}

id sub_100010840()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASVSPrimaryViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100010928()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = type metadata accessor for Logger(0);
  v0[3] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[4] = v2;
  v0[5] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for MainActor(0);
  v0[6] = v3;
  v0[7] = static MainActor.shared.getter(v3);
  v4 = (_QWORD *)swift_task_alloc(async function pointer to PASExtensionHandle.didPerformLocalAuthentication()[1]);
  v0[8] = v4;
  *v4 = v0;
  v4[1] = sub_1000109B8;
  return PASExtensionHandle.didPerformLocalAuthentication()();
}

uint64_t sub_1000109B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  if (v0)
    v6 = sub_100010A78;
  else
    v6 = sub_100010A40;
  return swift_task_switch(v6, v5, v4);
}

uint64_t sub_100010A40()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 56));
  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010A78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = swift_release(*(_QWORD *)(v0 + 56));
  v6 = PASLogger.common.unsafeMutableAddressor(v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v1);
  swift_errorRetain(v2);
  v7 = swift_errorRetain(v2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(_QWORD *)(v0 + 72);
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 138543362;
    swift_errorRetain(v10);
    v13 = _swift_stdlib_bridgeErrorToNSError(v10);
    *(_QWORD *)(v0 + 16) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24);
    *v12 = v13;
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "PASVSPrimaryViewController setupFlowControllerDidPerformLocalAuthentication failed to notify extension: %{public}@", v11, 0xCu);
    v14 = sub_100004170(&qword_10001DE68);
    swift_arrayDestroy(v12, 1, v14);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    swift_errorRelease(v10);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 72);
    swift_errorRelease(v15);
    swift_errorRelease(v15);
    swift_errorRelease(v15);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100010C48()
{
  void *v0;

  return objc_msgSend(v0, "passwordType");
}

id sub_100010C58(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, "setPasswordType:", a1);
}

void sub_100010C6C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;

  if (a1)
  {
    v4[4] = a1;
    v5 = a2;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_10000CDA8;
    v4[3] = &unk_100019240;
    v3 = _Block_copy(v4);
    swift_release(v5);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v2, "setEventHandler:", v3);
  _Block_release(v3);
}

id sub_100010CF8()
{
  void *v0;

  return objc_msgSend(v0, "messageSessionTemplate");
}

id sub_100010D1C()
{
  void *v0;

  return objc_msgSend(v0, "activate");
}

id sub_100010D2C(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, "postEvent:", a1);
}

id sub_100010D40()
{
  void *v0;

  return objc_msgSend(v0, "invalidate");
}

id sub_100010D50()
{
  id *v0;

  return objc_msgSend(*v0, "isLostModeActive");
}

uint64_t sub_100010D70(uint64_t a1, uint64_t a2)
{
  return sub_100010D88(a1, a2, &direct field offset for PASExtensionProvidedViewDetails.proxCardSubtitle);
}

uint64_t sub_100010D7C(uint64_t a1, uint64_t a2)
{
  return sub_100010D88(a1, a2, &direct field offset for PASExtensionProvidedViewDetails.biometricsNotEnrolledErrorSubtitle);
}

uint64_t sub_100010D88(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;

  v4 = (uint64_t *)(*v3 + *a3);
  v5 = *v4;
  swift_bridgeObjectRetain(v4[1]);
  return v5;
}

uint64_t type metadata accessor for PASVSPrimaryViewController()
{
  return objc_opt_self(_TtC14PASViewService26PASVSPrimaryViewController);
}

uint64_t sub_100010DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004170(&qword_10001E560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_100010E28(uint64_t a1)
{
  void *v1;
  Class isa;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9 = 0;
  v4 = objc_msgSend(v1, "initWithDictionary:error:", isa, &v9);

  v5 = v9;
  if (v4)
  {
    v6 = v9;
  }
  else
  {
    v7 = v9;
    _convertNSErrorToError(_:)(v5);

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_100010F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRelease(a3);
  return result;
}

uint64_t sub_100010F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRetain(a3);
  return result;
}

uint64_t sub_100010F34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100010F5C(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_100010F7C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = sub_100010FEC(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100010FEC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000110BC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000080B8((uint64_t)v12, *a3);
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
      sub_1000080B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008098(v12);
  return v7;
}

uint64_t sub_1000110BC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100011274(a5, a6);
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

uint64_t sub_100011274(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100011308(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_1000114E0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000114E0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100011308(uint64_t a1, unint64_t a2)
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
      v5 = sub_10001147C(v4, 0);
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

_QWORD *sub_10001147C(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004170(&qword_10001E588);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000114E0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004170(&qword_10001E588);
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

unint64_t sub_10001162C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000116DC(a1, v4);
}

unint64_t sub_10001165C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_1000117A0(a1, v7);
}

unint64_t sub_1000116DC(uint64_t a1, uint64_t a2)
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
      sub_10000805C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100008028((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000117A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

_QWORD *sub_100011914(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  __int128 v19;
  uint64_t v20;
  _UNKNOWN **v21;

  v20 = sub_10000C878(0, &qword_10001E5B8, FMDFMIPManager_ptr);
  v21 = &off_100019198;
  *(_QWORD *)&v19 = a2;
  v8 = type metadata accessor for AccountSecurityLevelCalculator();
  v18[3] = v8;
  v18[4] = &off_100018D10;
  v18[0] = a3;
  v9 = type metadata accessor for PASVSProxCardValidator();
  v10 = (_QWORD *)swift_allocObject(v9, 144, 7);
  v11 = sub_100010F34((uint64_t)v18, v8);
  __chkstk_darwin(v11);
  v13 = (_QWORD *)((char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  v15 = *v13;
  v10[15] = v8;
  v10[16] = &off_100018D10;
  v10[12] = v15;
  v10[17] = 0;
  sub_10000C8FC(a1, (uint64_t)(v10 + 2));
  sub_10000C8FC(&v19, (uint64_t)(v10 + 7));
  v16 = (void *)v10[17];
  v10[17] = a4;

  sub_100008098(v18);
  return v10;
}

uint64_t sub_100011A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v9[5];

  v9[3] = &type metadata for DTOStatusProvider;
  v9[4] = &off_100018C78;
  *(_QWORD *)(a4 + 144) = 0;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_QWORD *)(a4 + 88) = 0;
  swift_unknownObjectWeakInit(a4 + 136, 0);
  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = &off_1000190F8;
  *(_QWORD *)(a4 + 32) = a2;
  sub_10000C8B8((uint64_t)v9, a4 + 152);
  sub_1000093C8(a3, a4 + 96, &qword_10001DE50);
  objc_msgSend(*(id *)(a4 + 32), "setDelegate:", a4);
  sub_100006884(a3, &qword_10001DE50);
  sub_100008098(v9);
  return a4;
}

_QWORD *sub_100011B0C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_100011B4C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100011B5C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011B80()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100011B8C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100011B9C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  if (*(_QWORD *)(v0 + 48))
    swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100011BD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_DWORD *)(v1 + 40);
  v9 = *(_QWORD *)(v1 + 48);
  v8 = *(_QWORD *)(v1 + 56);
  v10 = (_QWORD *)swift_task_alloc(dword_10001E59C);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_10000683C;
  return sub_10000ED9C(a1, v4, v5, v6, v7, v9, v8);
}

void sub_100011C68(uint64_t a1, void *a2)
{
  if (a1)
  {
    swift_release(a1);

  }
}

uint64_t sub_100011C94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004170(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011CE8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100011CF0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[3] = v0;
  v2 = type metadata accessor for Logger(0);
  v1[4] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[5] = v3;
  v1[6] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v1[7] = static MainActor.shared.getter(v4);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v1[8] = v5;
  v1[9] = v6;
  return swift_task_switch(sub_100011D84, v5, v6);
}

uint64_t sub_100011D84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;

  v1 = (uint64_t *)(*(_QWORD *)(v0 + 24)
                 + OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension);
  v2 = *v1;
  *(_QWORD *)(v0 + 80) = *v1;
  if (v2)
  {
    v3 = (void *)v1[1];
    *(_QWORD *)(v0 + 88) = v3;
    v4 = async function pointer to PASExtensionHandle.shouldPerformLocalAuthentication()[1];
    swift_retain(v2);
    v5 = v3;
    v6 = (_QWORD *)swift_task_alloc(v4);
    *(_QWORD *)(v0 + 96) = v6;
    *v6 = v0;
    v6[1] = sub_100011E34;
    return PASExtensionHandle.shouldPerformLocalAuthentication()();
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 56));
    swift_task_dealloc(*(_QWORD *)(v0 + 48));
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
  }
}

uint64_t sub_100011E34(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 96);
  *(_QWORD *)(*v2 + 104) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = *(_QWORD *)(v4 + 64);
    v7 = *(_QWORD *)(v4 + 72);
    v8 = sub_100011EFC;
  }
  else
  {
    *(_BYTE *)(v4 + 112) = a1 & 1;
    v6 = *(_QWORD *)(v4 + 64);
    v7 = *(_QWORD *)(v4 + 72);
    v8 = sub_100011EAC;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_100011EAC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(void **)(v0 + 88);
  swift_release(*(_QWORD *)(v0 + 56));

  swift_release(v2);
  v3 = *(unsigned __int8 *)(v0 + 112);
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_100011EFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = swift_release(*(_QWORD *)(v0 + 56));
  v6 = PASLogger.common.unsafeMutableAddressor(v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v6, v3);
  swift_errorRetain(v1);
  v7 = swift_errorRetain(v1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(_QWORD *)(v0 + 104);
    v11 = *(_QWORD *)(v0 + 80);
    v19 = *(void **)(v0 + 88);
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 138543362;
    swift_errorRetain(v10);
    v14 = _swift_stdlib_bridgeErrorToNSError(v10);
    *(_QWORD *)(v0 + 16) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24);
    *v13 = v14;
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "PASVSPrimaryViewController setupFlowControllerShouldPerformLocalAuthentication extension failed: %{public}@", v12, 0xCu);
    v15 = sub_100004170(&qword_10001DE68);
    swift_arrayDestroy(v13, 1, v15);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    swift_release(v11);
    swift_errorRelease(v10);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 104);
    v17 = *(_QWORD *)(v0 + 80);

    swift_release(v17);
    swift_errorRelease(v16);
    swift_errorRelease(v16);
    swift_errorRelease(v16);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC14PASViewServiceP33_91E7C59A43F5A2D8A60D68ED2C8A4EB619ResourceBundleClass);
}
