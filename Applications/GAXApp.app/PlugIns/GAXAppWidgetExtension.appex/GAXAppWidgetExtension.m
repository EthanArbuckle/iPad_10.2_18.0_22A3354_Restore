uint64_t sub_100004A5C()
{
  return sub_100004B04(&qword_10000C188, (uint64_t)&unk_100007210);
}

uint64_t type metadata accessor for StartGuidedAccessIntent(uint64_t a1)
{
  uint64_t result;

  result = qword_10000C2A0;
  if (!qword_10000C2A0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StartGuidedAccessIntent);
  return result;
}

uint64_t sub_100004ABC()
{
  return sub_100004B04(&qword_10000C190, (uint64_t)&unk_1000072A0);
}

uint64_t sub_100004AE0()
{
  return sub_100004B04((unint64_t *)&unk_10000C198, (uint64_t)&unk_1000072C8);
}

uint64_t sub_100004B04(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t started;

  result = *a1;
  if (!result)
  {
    started = type metadata accessor for StartGuidedAccessIntent(255);
    result = swift_getWitnessTable(a2, started);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004B44(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000791C, 1);
}

uint64_t sub_100004B54(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100004B04(&qword_10000C188, (uint64_t)&unk_100007210);
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100004BA4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100004BB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t started;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  void *v13;
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  Swift::String v41;
  uint64_t v42;
  unint64_t v43;
  Swift::String v44;
  Swift::String v45;

  v40 = a1;
  type metadata accessor for ControlSize(0);
  __chkstk_darwin();
  v2 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_10000643C(&qword_10000C320);
  v4 = *(_QWORD *)(v3 - 8);
  v36 = v3;
  v37 = v4;
  __chkstk_darwin();
  v34 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000643C(&qword_10000C328);
  v7 = *(_QWORD *)(v6 - 8);
  v38 = v6;
  v39 = v7;
  __chkstk_darwin();
  v35 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = off_10000C170;
  v33 = qword_10000C168;
  started = type metadata accessor for StartGuidedAccessIntent(0);
  v11 = type metadata accessor for GAXAppReferenceClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v11);
  v13 = (void *)objc_opt_self(NSBundle);
  swift_bridgeObjectRetain(v9);
  v14 = objc_msgSend(v13, "bundleForClass:", ObjCClassFromMetadata);
  v44._countAndFlagsBits = 0xD00000000000001ELL;
  v44._object = (void *)0x8000000100007540;
  v15._countAndFlagsBits = 0x545F544547444957;
  v15._object = (void *)0xEC000000454C5449;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v44);

  static ControlSize._1x1.getter();
  v18 = sub_10000643C(&qword_10000C330);
  v19 = sub_100004B04(&qword_10000C188, (uint64_t)&unk_100007210);
  v20 = sub_100006B7C(&qword_10000C338, &qword_10000C330, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v21 = v34;
  ControlButton.init<A>(kind:intent:displayName:preferredSize:title:affordances:)(v33, v9, started, v17._countAndFlagsBits, v17._object, v2, sub_100006B78, 0, 0, 0, started, v18, v19, v20);
  v22 = objc_msgSend(v13, "bundleForClass:", ObjCClassFromMetadata);
  v45._countAndFlagsBits = 0xD000000000000024;
  v45._object = (void *)0x8000000100007580;
  v23._object = (void *)0x8000000100007560;
  v23._countAndFlagsBits = 0xD000000000000012;
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  v25 = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, (Swift::String_optional)0, (NSBundle)v22, v24, v45);

  v41 = v25;
  v26 = sub_100006B7C(&qword_10000C340, &qword_10000C320, (uint64_t)&protocol conformance descriptor for ControlButton<A>);
  v27 = sub_100006BBC();
  v29 = v35;
  v28 = v36;
  WidgetConfiguration.description<A>(_:)(&v41, v36, &type metadata for String, v26, v27);
  swift_bridgeObjectRelease(v25._object);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v21, v28);
  v41._countAndFlagsBits = v28;
  v41._object = &type metadata for String;
  v42 = v26;
  v43 = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v41, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v31 = v38;
  WidgetConfiguration.showsInSystemSpaces()(v38, OpaqueTypeConformance2);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v29, v31);
}

uint64_t sub_100004F34()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  unint64_t v6;
  Swift::String v8;
  Swift::String v9;

  v0 = type metadata accessor for GAXAppReferenceClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v9._countAndFlagsBits = 0xD00000000000001ELL;
  v9._object = (void *)0x8000000100007540;
  v3._countAndFlagsBits = 0x545F544547444957;
  v3._object = (void *)0xEC000000454C5449;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v9);

  v8 = v5;
  v6 = sub_100006BBC();
  return Label<>.init<A>(_:systemImage:)(&v8, 0xD000000000000012, 0x80000001000075B0, &type metadata for String, v6);
}

uint64_t sub_100005034()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100006AD4(v0, qword_10000C3F8);
  sub_100006A34(v0, (uint64_t)qword_10000C3F8);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000012, 0x8000000100007520);
}

uint64_t sub_100005094(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[31] = a1;
  v2[32] = v1;
  v3 = sub_10000643C(&qword_10000C240);
  v2[33] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v2[34] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[35] = v5;
  v2[36] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100005118, 0, 0);
}

id sub_100005118()
{
  uint64_t v0;
  _QWORD *v1;
  id result;
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
  id v13;
  NSURL *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  if (_AXSGuidedAccessEnabledNoCaching())
  {
    v1 = (_QWORD *)swift_task_alloc(dword_10000C2FC);
    *(_QWORD *)(v0 + 296) = v1;
    *v1 = v0;
    v1[1] = sub_1000053B4;
    return (id)swift_task_switch(sub_100005FAC, 0, 0);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 272);
    v4 = *(_QWORD *)(v0 + 280);
    v5 = *(_QWORD *)(v0 + 264);
    sub_100006A4C(*(_QWORD *)(v0 + 256), v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_100006A94(*(_QWORD *)(v0 + 264));
      if (qword_10000C180 != -1)
        swift_once(&qword_10000C180, sub_1000069D4);
      v6 = type metadata accessor for Logger(0);
      v7 = sub_100006A34(v6, (uint64_t)qword_10000C410);
      v8 = Logger.logObject.getter(v7);
      v9 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unable to create Guided Access settings URL.", v10, 2u);
        swift_slowDealloc(v10, -1, -1);
      }

      static IntentResult.result<>()(v11);
      v12 = *(_QWORD *)(v0 + 264);
      swift_task_dealloc(*(_QWORD *)(v0 + 288));
      swift_task_dealloc(v12);
      return (id)(*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 280) + 32))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 272));
      v13 = objc_msgSend(objc_allocWithZone((Class)_LSOpenConfiguration), "init");
      *(_QWORD *)(v0 + 368) = v13;
      objc_msgSend(v13, "setSensitive:", 1);
      result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
      *(_QWORD *)(v0 + 376) = result;
      if (result)
      {
        v15 = result;
        v16 = v0 + 80;
        URL._bridgeToObjectiveC()(v14);
        v18 = v17;
        *(_QWORD *)(v0 + 384) = v17;
        *(_QWORD *)(v0 + 120) = v0 + 240;
        *(_QWORD *)(v0 + 80) = v0;
        *(_QWORD *)(v0 + 88) = sub_1000057D8;
        v19 = swift_continuation_init(v0 + 80, 1);
        *(_QWORD *)(v0 + 144) = _NSConcreteStackBlock;
        v20 = (_QWORD *)(v0 + 144);
        v20[1] = 0x40000000;
        v20[2] = sub_100005EC4;
        v20[3] = &unk_100008480;
        v20[4] = v19;
        objc_msgSend(v15, "openURL:configuration:completionHandler:", v18, v13, v20);
        return (id)swift_continuation_await(v16);
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_1000053B4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 296);
  *(_QWORD *)(v3 + 304) = a1;
  *(_QWORD *)(v3 + 312) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100005410, 0, 0);
}

id sub_100005410()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 304) & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  if (v2)
  {
    result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    *(_QWORD *)(v0 + 320) = result;
    if (result)
    {
      v4 = result;
      v5 = v0 + 16;
      v6 = *(_QWORD *)(v0 + 312);
      v7 = String._bridgeToObjectiveC()();
      *(_QWORD *)(v0 + 328) = v7;
      swift_bridgeObjectRelease(v6);
      v8 = objc_msgSend(objc_allocWithZone((Class)_LSOpenConfiguration), "init");
      *(_QWORD *)(v0 + 336) = v8;
      *(_QWORD *)(v0 + 56) = v0 + 400;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_10000562C;
      v9 = swift_continuation_init(v0 + 16, 1);
      *(_QWORD *)(v0 + 184) = _NSConcreteStackBlock;
      v10 = (_QWORD *)(v0 + 184);
      v10[1] = 0x40000000;
      v10[2] = sub_1000060FC;
      v10[3] = &unk_100008468;
      v10[4] = v9;
      objc_msgSend(v4, "openApplicationWithBundleIdentifier:usingConfiguration:completionHandler:", v7, v8, v10);
      return (id)swift_continuation_await(v5);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v1);
    if (qword_10000C180 != -1)
      swift_once(&qword_10000C180, sub_1000069D4);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_100006A34(v11, (uint64_t)qword_10000C410);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Unable to start Guided Access from Control Center because there was no effective app.", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    static IntentResult.result<>()(v16);
    v17 = *(_QWORD *)(v0 + 264);
    swift_task_dealloc(*(_QWORD *)(v0 + 288));
    swift_task_dealloc(v17);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_10000562C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 344) = v1;
  if (v1)
    v2 = sub_100005AE4;
  else
    v2 = sub_10000568C;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000568C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD *v3;

  v1 = *(void **)(v0 + 328);
  v2 = *(void **)(v0 + 336);

  v3 = (_QWORD *)swift_task_alloc(async function pointer to static Task<>.sleep(nanoseconds:)[1]);
  *(_QWORD *)(v0 + 352) = v3;
  *v3 = v0;
  v3[1] = sub_1000056F0;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_1000056F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 352);
  *(_QWORD *)(*(_QWORD *)v1 + 360) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100005CE0;
  else
    v3 = sub_100005754;
  return swift_task_switch(v3, 0, 0);
}

id sub_100005754()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend((id)objc_opt_self(AXBackBoardServer), "server");
  if (result)
  {
    v2 = result;
    objc_msgSend(result, "toggleGuidedAccess");

    static IntentResult.result<>()();
    v3 = *(_QWORD *)(v0 + 264);
    swift_task_dealloc(*(_QWORD *)(v0 + 288));
    swift_task_dealloc(v3);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000057D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  *(_QWORD *)(*(_QWORD *)v0 + 392) = v1;
  if (v1)
    v2 = sub_1000058CC;
  else
    v2 = sub_100005838;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005838()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(v0 + 376);
  v1 = *(void **)(v0 + 384);
  v3 = *(void **)(v0 + 368);
  v5 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 288);
  v6 = *(_QWORD *)(v0 + 272);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v7 = *(_QWORD *)(v0 + 240);

  v8 = swift_bridgeObjectRelease(v7);
  static IntentResult.result<>()(v8);
  v9 = *(_QWORD *)(v0 + 264);
  swift_task_dealloc(*(_QWORD *)(v0 + 288));
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000058CC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 384);
  v3 = *(void **)(v0 + 368);
  v2 = *(void **)(v0 + 376);
  swift_willThrow();

  if (qword_10000C180 != -1)
    swift_once(&qword_10000C180, sub_1000069D4);
  v4 = *(_QWORD *)(v0 + 392);
  v5 = type metadata accessor for Logger(0);
  sub_100006A34(v5, (uint64_t)qword_10000C410);
  swift_errorRetain(v4);
  v6 = swift_errorRetain(v4);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 392);
  if (v9)
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 138412290;
    swift_errorRetain(v10);
    v13 = _swift_stdlib_bridgeErrorToNSError(v10);
    *(_QWORD *)(v0 + 224) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v0 + 232, v11 + 4, v11 + 12);
    *v12 = v13;
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unable to open Guided Access settings from Control Center: %@", v11, 0xCu);
    v14 = sub_10000643C(&qword_10000C300);
    swift_arrayDestroy(v12, 1, v14);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_errorRelease(v10);
    swift_errorRelease(v10);
  }
  v16 = *(_QWORD *)(v0 + 280);
  v15 = *(_QWORD *)(v0 + 288);
  v17 = *(_QWORD *)(v0 + 272);
  swift_errorRelease(*(_QWORD *)(v0 + 392));
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  static IntentResult.result<>()(v18);
  v19 = *(_QWORD *)(v0 + 264);
  swift_task_dealloc(*(_QWORD *)(v0 + 288));
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005AE4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(void **)(v0 + 336);
  v3 = *(void **)(v0 + 320);
  v2 = *(void **)(v0 + 328);
  swift_willThrow();

  v4 = *(_QWORD *)(v0 + 344);
  if (qword_10000C180 != -1)
    swift_once(&qword_10000C180, sub_1000069D4);
  v5 = type metadata accessor for Logger(0);
  sub_100006A34(v5, (uint64_t)qword_10000C410);
  swift_errorRetain(v4);
  v6 = swift_errorRetain(v4);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v9 = 138412290;
    swift_errorRetain(v4);
    v11 = _swift_stdlib_bridgeErrorToNSError(v4);
    *(_QWORD *)(v0 + 232) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v9 + 4, v9 + 12);
    *v10 = v11;
    swift_errorRelease(v4);
    swift_errorRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unable to open application from Control Center: %@", v9, 0xCu);
    v12 = sub_10000643C(&qword_10000C300);
    swift_arrayDestroy(v10, 1, v12);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    v13 = swift_errorRelease(v4);
  }
  else
  {
    swift_errorRelease(v4);
    swift_errorRelease(v4);
    swift_errorRelease(v4);

  }
  static IntentResult.result<>()(v13);
  v14 = *(_QWORD *)(v0 + 264);
  swift_task_dealloc(*(_QWORD *)(v0 + 288));
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005CE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 360);
  if (qword_10000C180 != -1)
    swift_once(&qword_10000C180, sub_1000069D4);
  v2 = type metadata accessor for Logger(0);
  sub_100006A34(v2, (uint64_t)qword_10000C410);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v1);
    v8 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 232) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Unable to open application from Control Center: %@", v6, 0xCu);
    v9 = sub_10000643C(&qword_10000C300);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v10 = swift_errorRelease(v1);
  }
  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    swift_errorRelease(v1);

  }
  static IntentResult.result<>()(v10);
  v11 = *(_QWORD *)(v0 + 264);
  swift_task_dealloc(*(_QWORD *)(v0 + 288));
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005EC4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_10000643C(&qword_10000C310);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    if (a2)
      v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    else
      v10 = 0;
    v11 = v10;
    sub_100006B14((uint64_t)&v11, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40), &qword_10000C308);
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100005F98()
{
  return swift_task_switch(sub_100005FAC, 0, 0);
}

id sub_100005FAC()
{
  _QWORD *v0;
  id result;
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  result = objc_msgSend((id)objc_opt_self(AXBackBoardServer), "server");
  v0[17] = result;
  if (result)
  {
    v2 = result;
    v3 = v0 + 2;
    v0[7] = v0 + 15;
    v0[2] = v0;
    v0[3] = sub_10000606C;
    v4 = swift_continuation_init(v0 + 2, 0);
    v0[10] = _NSConcreteStackBlock;
    v5 = v0 + 10;
    v5[1] = 0x40000000;
    v5[2] = sub_10000617C;
    v5[3] = &unk_100008498;
    v5[4] = v4;
    objc_msgSend(v2, "guidedAccessEffectiveAppBundleIdentifier:", v5);
    return (id)swift_continuation_await(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000606C()
{
  return swift_task_switch(sub_1000060B8, 0, 0);
}

uint64_t sub_1000060B8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 120);

  if (v1)
    v3 = v2;
  else
    v3 = 0;
  if (v1)
    v4 = v1;
  else
    v4 = 0xE000000000000000;
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v3, v4);
}

uint64_t sub_1000060FC(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_10000643C(&qword_10000C310);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000617C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  else
    v3 = 0;
  v5[0] = v3;
  v5[1] = a2;
  sub_100006B14((uint64_t)v5, *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40), &qword_10000C318);
  return swift_continuation_resume(v2);
}

uint64_t sub_1000061D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10000C178 != -1)
    swift_once(&qword_10000C178, sub_100005034);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100006A34(v2, (uint64_t)qword_10000C3F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000625C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10000C2F4);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000062AC;
  return sub_100005094(a1);
}

uint64_t sub_1000062AC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000062F4()
{
  return URL.init(string:)(0xD000000000000032, 0x8000000100007470);
}

uint64_t sub_100006310(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004B04(&qword_10000C188, (uint64_t)&unk_100007210);
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for GAXAppReferenceClass()
{
  return objc_opt_self(_TtC21GAXAppWidgetExtension20GAXAppReferenceClass);
}

uint64_t *sub_100006368(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(sub_10000643C(&qword_10000C240) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = type metadata accessor for URL(0);
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  return a1;
}

uint64_t sub_10000643C(uint64_t *a1)
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

uint64_t sub_10000647C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *sub_1000064E4(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = sub_10000643C(&qword_10000C240);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_100006588(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = sub_10000643C(&qword_10000C240);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_100006678(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = sub_10000643C(&qword_10000C240);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_10000671C(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = sub_10000643C(&qword_10000C240);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_10000680C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006818);
}

uint64_t sub_100006818(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000643C(&qword_10000C240);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_100006858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006864);
}

uint64_t sub_100006864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000643C(&qword_10000C240);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_1000068A8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_100006910(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
  }
}

void sub_100006910(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10000C2B0)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10000C2B0);
  }
}

uint64_t sub_100006964()
{
  return sub_100006B7C(&qword_10000C2E0, &qword_10000C2E8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100006990(uint64_t *a1)
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

id sub_1000069D4()
{
  uint64_t v0;
  id result;

  v0 = type metadata accessor for Logger(0);
  sub_100006AD4(v0, qword_10000C410);
  sub_100006A34(v0, (uint64_t)qword_10000C410);
  result = (id)GAXLogCommon();
  if (result)
    return (id)Logger.init(_:)();
  __break(1u);
  return result;
}

uint64_t sub_100006A34(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100006A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000643C(&qword_10000C240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006A94(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000643C(&qword_10000C240);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_100006AD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_100006B14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000643C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for GAXAppWidget()
{
  return &type metadata for GAXAppWidget;
}

uint64_t sub_100006B68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007960, 1);
}

uint64_t sub_100006B7C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006990(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006BBC()
{
  unint64_t result;

  result = qword_10000C348;
  if (!qword_10000C348)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C348);
  }
  return result;
}

uint64_t sub_100006C00()
{
  uint64_t v0;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v0 = sub_100006990(&qword_10000C328);
  v3 = sub_100006990(&qword_10000C320);
  v4 = &type metadata for String;
  v5 = sub_100006B7C(&qword_10000C340, &qword_10000C320, (uint64_t)&protocol conformance descriptor for ControlButton<A>);
  v6 = sub_100006BBC();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v3 = v0;
  v4 = (void *)OpaqueTypeConformance2;
  return swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration.showsInSystemSpaces()>>, 1);
}

uint64_t sub_100006CA8()
{
  unint64_t v0;

  v0 = sub_100006D70();
  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for GAXAppWidget, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100006D0C();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100006D0C()
{
  unint64_t result;

  result = qword_10000C350;
  if (!qword_10000C350)
  {
    result = swift_getWitnessTable(&unk_1000073B4, &type metadata for GAXAppWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_10000C350);
  }
  return result;
}

ValueMetadata *type metadata accessor for GAXAppWidgetBundle()
{
  return &type metadata for GAXAppWidgetBundle;
}

uint64_t sub_100006D60(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000079A4, 1);
}

unint64_t sub_100006D70()
{
  unint64_t result;

  result = qword_10000C358;
  if (!qword_10000C358)
  {
    result = swift_getWitnessTable(&unk_100007358, &type metadata for GAXAppWidget);
    atomic_store(result, (unint64_t *)&qword_10000C358);
  }
  return result;
}

uint64_t sub_100006DB4()
{
  _QWORD v1[2];

  v1[0] = &type metadata for GAXAppWidget;
  v1[1] = sub_100006D70();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC21GAXAppWidgetExtensionP33_678D143374769E1A64B92B237E3A66F319ResourceBundleClass);
}
