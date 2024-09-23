uint64_t sub_1000020D8()
{
  return os_variant_has_internal_diagnostics("com.apple.OSAnalytics.DiagnosticsReporter");
}

uint64_t sub_1000020E4()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics("com.apple.OSAnalytics.DiagnosticsReporter");
  if ((_DWORD)result)
    return _os_feature_enabled_impl("OSAnalytics", "forceSeedFeedbackPrompting");
  return result;
}

void *variable initialization expression of DiagnosticsReporterLaunchOptions.files_to_attach()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of DiagnosticsReporterLaunchOptions.log_path()
{
  return 0;
}

void sub_100002134(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_10000213C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100002148(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t result;
  NSString v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  Swift::String v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];

  v4 = v3;
  v54 = a3;
  v52 = a2;
  v53 = type metadata accessor for FBKFeedbackForm.Question(0);
  v6 = *(_QWORD *)(v53 - 8);
  __chkstk_darwin(v53);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectUnownedInit(v3 + 64, 0);
  sub_100002858((uint64_t)a1, v3 + 24);
  v16 = a1[3];
  v15 = a1[4];
  sub_10000289C(a1, v16);
  (*(void (**)(uint64_t, uint64_t))(v15 + 24))(v16, v15);
  v18 = v17;
  v19 = String.lowercased()();
  swift_bridgeObjectRelease(v18);
  v55[0] = 0;
  v55[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease(v55[1]);
  strcpy((char *)v55, "ios-framework-");
  HIBYTE(v55[1]) = -18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v19._object);
  v20 = v55[0];
  v21 = v55[1];
  v22 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackForm(0));
  v23 = (void *)FBKFeedbackForm.init(identifier:)(v20, v21);
  v25 = a1[3];
  v24 = a1[4];
  sub_10000289C(a1, v25);
  v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 24))(v25, v24);
  v28 = v27;
  if (v26 == 0x63696E6150 && v27 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease(0xE500000000000000);
  }
  else
  {
    v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v27, 0x63696E6150, 0xE500000000000000, 0);
    swift_bridgeObjectRelease(v28);
    if ((v29 & 1) == 0)
    {
LABEL_9:
      v35 = a1[3];
      v36 = a1[4];
      sub_10000289C(a1, v35);
      v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 32))(v35, v36);
      dispatch thunk of FBKFeedbackForm.attachments.setter(v37);
      v38 = v53;
      (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for FBKFeedbackForm.Question.title(_:), v53);
      v39 = v54;
      dispatch thunk of FBKFeedbackForm.prefill(question:answer:)(v8, v52, v54);
      swift_bridgeObjectRelease(v39);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v38);
      v40 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackDraftViewController(0));
      v41 = v23;
      v42 = (void *)FBKFeedbackDraftViewController.init(feedbackForm:)();
      *(_QWORD *)(v4 + 16) = v42;
      v43 = v42;
      v44 = swift_retain(v4);
      dispatch thunk of FBKFeedbackDraftViewController.delegate.setter(v44);

      sub_1000028C0(a1);
      return v4;
    }
  }
  v30 = String.LocalizationValue.init(_:)(0x7865546C6167654CLL, 0xEE00726F72724574);
  static Locale.current.getter(v30);
  v31 = String.init(localized:defaultValue:table:bundle:locale:comment:)("LegalTextPanic", 14, 2, v14, 0, 0, 0, v11, 0, 0, 256);
  v33 = v31;
  v34 = v32;
  if ((v31 != 0x7865546C6167654CLL || v32 != 0xEE00726F72724574)
    && (_stringCompareWithSmolCheck(_:_:expecting:)(v31, v32, 0x7865546C6167654CLL, 0xEE00726F72724574, 0) & 1) == 0)
  {
    dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.setter(v33, v34);
    goto LABEL_9;
  }
  v55[0] = 0;
  v55[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(43);
  swift_bridgeObjectRelease(v55[1]);
  v55[0] = 0xD000000000000029;
  v55[1] = 0x800000010000F5D0;
  v46 = String._bridgeToObjectiveC()();
  v47 = (void *)MGGetStringAnswer();

  if (!v47)
    __break(1u);
  v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
  v50 = v49;

  v51._countAndFlagsBits = v48;
  v51._object = v50;
  String.append(_:)(v51);
  swift_bridgeObjectRelease(v50);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v55[0], v55[1], "DiagnosticsReporter/FeedbackController.swift", 44, 2, 42, 0);
  __break(1u);
  return result;
}

uint64_t sub_100002804()
{
  uint64_t v0;

  sub_1000028C0((_QWORD *)(v0 + 24));
  swift_unknownObjectUnownedDestroy(v0 + 64);
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for FeedbackController()
{
  return objc_opt_self(_TtC19DiagnosticsReporter18FeedbackController);
}

uint64_t sub_100002858(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_10000289C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000028C0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_1000028E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  void *Strong;
  void *v14;
  uint64_t v15;
  uint64_t v16[5];

  v3 = v2;
  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v6 = type metadata accessor for Logger(0);
  sub_100003380(v6, (uint64_t)qword_10001AB28);
  v7 = swift_bridgeObjectRetain_n(a2, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v16[0] = v11;
    *(_DWORD *)v10 = 136446210;
    swift_bridgeObjectRetain(a2);
    v15 = sub_1000096B8(a1, a2, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, v16, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Controller complete with ID: %{public}s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  sub_100002858(v3 + 24, (uint64_t)v16);
  v12 = sub_100004598((uint64_t)&_swiftEmptyArrayStorage);
  sub_100005DF0(0);
  swift_bridgeObjectRelease(v12);
  sub_100003398((uint64_t)v16);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong(v3 + 64);
  if (Strong)
  {
    v14 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

void sub_100002AEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  unint64_t v18;
  void *Strong;
  void *v20;
  uint64_t v21;
  _BYTE v22[56];
  uint64_t v23[5];

  v2 = v1;
  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100003380(v4, (uint64_t)qword_10001AB28);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v23[0] = v9;
    *(_DWORD *)v8 = 136446210;
    v10 = FBKDraftError.description.getter(a1);
    v12 = v11;
    v21 = sub_1000096B8(v10, v11, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Controller failed to start, error: %{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  sub_100002858(v2 + 24, (uint64_t)v23);
  v13 = sub_1000033D8(&qword_100019E38);
  inited = swift_initStackObject(v13, v22);
  *(_OWORD *)(inited + 16) = xmmword_100010810;
  *(_QWORD *)(inited + 32) = 0x726F727265;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  FBKDraftError.description.getter(a1);
  v16 = v15;
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  *(_QWORD *)(inited + 48) = v17;
  v18 = sub_100004598(inited);
  sub_100005DF0(1);
  swift_bridgeObjectRelease(v18);
  sub_100003398((uint64_t)v23);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong(v2 + 64);
  if (Strong)
  {
    v20 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

uint64_t sub_100002D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  NSString v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[56];
  uint64_t v36[5];

  v3 = v2;
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v10 = type metadata accessor for Logger(0);
  sub_100003380(v10, (uint64_t)qword_10001AB28);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v32 = swift_slowAlloc(64, -1);
    v36[0] = v32;
    *(_DWORD *)v14 = 136380931;
    v15 = sub_100003418((unint64_t *)&qword_100019E40, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v16 = dispatch thunk of CustomStringConvertible.description.getter(v6, v15);
    v18 = v17;
    v19 = sub_1000096B8(v16, v17, v36);
    v33 = v3;
    v34 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *(_WORD *)(v14 + 12) = 2082;
    v20 = FBKAttachmentError.description.getter(a2);
    v22 = v21;
    v34 = sub_1000096B8(v20, v21, v36);
    v3 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v14 + 14, v14 + 22);
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Controller failed to attach, url: %{private}s error  %{public}s", (uint8_t *)v14, 0x16u);
    v23 = v32;
    swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  sub_100002858(v3 + 24, (uint64_t)v36);
  v24 = sub_1000033D8(&qword_100019E38);
  inited = swift_initStackObject(v24, v35);
  *(_OWORD *)(inited + 16) = xmmword_100010810;
  *(_QWORD *)(inited + 32) = 0x726F727265;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  FBKAttachmentError.description.getter(a2);
  v27 = v26;
  v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v27);
  *(_QWORD *)(inited + 48) = v28;
  v29 = sub_100004598(inited);
  sub_100005DF0(2);
  swift_bridgeObjectRelease(v29);
  return sub_100003398((uint64_t)v36);
}

void sub_10000300C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  unint64_t v7;
  void *Strong;
  void *v9;
  _BYTE v10[40];

  v1 = v0;
  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100003380(v2, (uint64_t)qword_10001AB28);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Controller cancelled.", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  sub_100002858(v1 + 24, (uint64_t)v10);
  v7 = sub_100004598((uint64_t)&_swiftEmptyArrayStorage);
  sub_100005DF0(6);
  swift_bridgeObjectRelease(v7);
  sub_100003398((uint64_t)v10);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong(v1 + 64);
  if (Strong)
  {
    v9 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

void sub_100003148(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *Strong;
  void *v17;
  uint64_t v18;
  uint64_t v19[5];

  v2 = v1;
  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v4 = type metadata accessor for Logger(0);
  sub_100003380(v4, (uint64_t)qword_10001AB28);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v19[0] = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = type metadata accessor for FBKSubmissionError(0);
    v11 = sub_100003418(&qword_100019E30, (uint64_t (*)(uint64_t))&type metadata accessor for FBKSubmissionError, (uint64_t)&protocol conformance descriptor for FBKSubmissionError);
    v12 = Error.localizedDescription.getter(v10, v11);
    v14 = v13;
    v18 = sub_1000096B8(v12, v13, v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, v19, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to submit feedback.%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  sub_100002858(v2 + 24, (uint64_t)v19);
  v15 = sub_100004598((uint64_t)&_swiftEmptyArrayStorage);
  sub_100005DF0(1);
  swift_bridgeObjectRelease(v15);
  sub_100003398((uint64_t)v19);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong(v2 + 64);
  if (Strong)
  {
    v17 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

uint64_t sub_100003380(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100003398(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033D8(&qword_100019E28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000033D8(uint64_t *a1)
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

uint64_t sub_100003418(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100003458@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  Swift::Bool v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString v27;
  uint64_t v28;
  unint64_t v29;
  const char *v30;
  Swift::String v31;
  void *object;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  uint64_t v52;
  char *v53;
  char *v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD v58[3];
  char v59[8];
  uint64_t v60;
  uint64_t v61;

  v4 = sub_1000033D8(&qword_100019E58);
  __chkstk_darwin(v4);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v54 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v52 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v52 - v14;
  v55 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v16 = URL.checkResourceIsReachable()();
  if (v17)
  {
    v18 = v17;
  }
  else if (v16)
  {
    v19 = URL.resolvingSymlinksInPath()();
    URL.path.getter(v19);
    v21 = v20;
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
    v23 = v55;
    LOBYTE(v21) = objc_msgSend(v55, "fileExistsAtPath:", v22);

    if ((v21 & 1) != 0)
    {
      URL.path.getter(v24);
      v26 = v25;
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v26);
      LOBYTE(v26) = objc_msgSend(v23, "isReadableFileAtPath:", v27);

      if ((v26 & 1) != 0)
      {

        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a2, v15, v7);
LABEL_17:
        v50 = 0;
        return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v50, 1, v7);
      }
      v56 = 0;
      v57 = 0xE000000000000000;
      _StringGuts.grow(_:)(26);
      v28 = swift_bridgeObjectRelease(v57);
      v29 = 0xD000000000000018;
      v30 = "File is not readable at ";
    }
    else
    {
      v56 = 0;
      v57 = 0xE000000000000000;
      _StringGuts.grow(_:)(24);
      v28 = swift_bridgeObjectRelease(v57);
      v29 = 0xD000000000000016;
      v30 = "File doesn't exist at ";
    }
    v56 = v29;
    v57 = (unint64_t)(v30 - 32) | 0x8000000000000000;
    v31._countAndFlagsBits = URL.path.getter(v28);
    object = v31._object;
    String.append(_:)(v31);
    swift_bridgeObjectRelease(object);
    v33 = v57;
    v18 = sub_100004350(v56, v57);
    v34 = swift_bridgeObjectRelease(v33);
    swift_willThrow(v34);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  }
  else
  {
    v18 = sub_100004350(0xD000000000000018, 0x800000010000F880);
    ((void (*)(void))swift_willThrow)();
  }
  sub_100004088((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {

    swift_errorRelease(v18);
    v49 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v49(v13, v6, v7);
    v49(a2, v13, v7);
    goto LABEL_17;
  }
  sub_100004288((uint64_t)v6, &qword_100019E58);
  if (qword_100019C70 != -1)
    swift_once(&qword_100019C70, sub_10000835C);
  v35 = type metadata accessor for Logger(0);
  sub_100003380(v35, (uint64_t)qword_10001AB10);
  v36 = v54;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v54, a1, v7);
  swift_errorRetain(v18);
  v37 = swift_errorRetain(v18);
  v38 = Logger.logObject.getter(v37);
  v39 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = swift_slowAlloc(22, -1);
    v52 = swift_slowAlloc(64, -1);
    v56 = v52;
    *(_DWORD *)v40 = 136446466;
    v41 = sub_100004308();
    v42 = dispatch thunk of CustomStringConvertible.description.getter(v7, v41);
    v44 = v43;
    v60 = sub_1000096B8(v42, v43, &v56);
    v53 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v40 + 4, v40 + 12);
    swift_bridgeObjectRelease(v44);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v36, v7);
    *(_WORD *)(v40 + 12) = 2082;
    swift_getErrorValue(v18, v59, v58);
    v45 = Error.localizedDescription.getter(v58[1], v58[2]);
    v47 = v46;
    v60 = sub_1000096B8(v45, v46, &v56);
    a2 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v40 + 14, v40 + 22);
    swift_bridgeObjectRelease(v47);
    swift_errorRelease(v18);
    swift_errorRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Error accessing %{public}s. %{public}s", (uint8_t *)v40, 0x16u);
    v48 = v52;
    swift_arrayDestroy(v52, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1, -1);
    swift_slowDealloc(v40, -1, -1);

    swift_errorRelease(v18);
  }
  else
  {

    swift_errorRelease(v18);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v36, v7);
    swift_errorRelease(v18);
    swift_errorRelease(v18);

  }
  v50 = 1;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v50, 1, v7);
}

void sub_1000039CC(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _OWORD *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t (*v58)(uint64_t);
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[24];

  v66 = a1;
  v68 = a3;
  v4 = sub_1000033D8(&qword_100019E48);
  v5 = __chkstk_darwin(v4);
  v65 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v64 = (char *)&v63 - v8;
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v63 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v63 - v12;
  v14 = sub_1000033D8(&qword_100019E50);
  __chkstk_darwin(v14);
  v16 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1000033D8(&qword_100019E58);
  __chkstk_darwin(v17);
  v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for URL(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = __chkstk_darwin(v20);
  v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v67 = (char *)&v63 - v25;
  v26 = &a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess(&a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path], v70, 0, 0);
  v27 = *((_QWORD *)v26 + 1);
  if (!v27)
  {
LABEL_4:
    if (qword_100019C78 != -1)
      swift_once(&qword_100019C78, sub_100008374);
    v30 = type metadata accessor for Logger(0);
    v31 = sub_100003380(v30, (uint64_t)qword_10001AB28);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Invalid log_path.", v34, 2u);
      swift_slowDealloc(v34, -1, -1);
    }

LABEL_9:
    v35 = (_OWORD *)v68;
    *(_QWORD *)(v68 + 32) = 0;
    *v35 = 0u;
    v35[1] = 0u;
    return;
  }
  v28 = *(_QWORD *)v26;
  swift_bridgeObjectRetain(v27);
  URL.init(fileURLWithPath:)(v28, v27);
  swift_bridgeObjectRelease(v27);
  sub_100003458((uint64_t)v24, v19);
  v29 = *(void (**)(char *, uint64_t))(v21 + 8);
  v29(v24, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_100004288((uint64_t)v19, &qword_100019E58);
    goto LABEL_4;
  }
  v36 = v20;
  v37 = v67;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v67, v19, v36);
  v38 = v66;
  switch(v66)
  {
    case 0:
      sub_10000AAE0(0, a2, (uint64_t)v16);
      v39 = type metadata accessor for PanicLog(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 48))(v16, 1, v39) == 1)
      {
        v29(v37, v36);
        v40 = &qword_100019E50;
        v41 = (uint64_t)v16;
        goto LABEL_26;
      }
      v60 = (_QWORD *)v68;
      *(_QWORD *)(v68 + 24) = v39;
      v60[4] = &off_100014C98;
      v57 = sub_10000424C(v60);
      v58 = type metadata accessor for PanicLog;
      v59 = (uint64_t)v16;
      goto LABEL_31;
    case 1:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v37, v36);
      sub_100006190(3u, (uint64_t)v24, (uint64_t)v11);
      v49 = type metadata accessor for CrashLog(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 48))(v11, 1, v49) == 1)
      {
        v29(v37, v36);
        v40 = &qword_100019E48;
        v41 = (uint64_t)v11;
        goto LABEL_26;
      }
      v61 = (_QWORD *)v68;
      *(_QWORD *)(v68 + 24) = v49;
      v61[4] = &off_100014960;
      v57 = sub_10000424C(v61);
      v58 = type metadata accessor for CrashLog;
      v59 = (uint64_t)v11;
      goto LABEL_31;
    case 2:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v37, v36);
      sub_100006190(0, (uint64_t)v24, (uint64_t)v13);
      v50 = type metadata accessor for CrashLog(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 48))(v13, 1, v50) == 1)
      {
        v29(v37, v36);
        v40 = &qword_100019E48;
        v41 = (uint64_t)v13;
        goto LABEL_26;
      }
      v62 = (_QWORD *)v68;
      *(_QWORD *)(v68 + 24) = v50;
      v62[4] = &off_100014960;
      v57 = sub_10000424C(v62);
      v58 = type metadata accessor for CrashLog;
      v59 = (uint64_t)v13;
      goto LABEL_31;
    case 3:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v37, v36);
      v51 = v64;
      v52 = (uint64_t)v64;
      v53 = 1;
      goto LABEL_24;
    case 4:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v37, v36);
      v51 = v65;
      v52 = (uint64_t)v65;
      v53 = 2;
LABEL_24:
      sub_100006190(v53, (uint64_t)v24, v52);
      v54 = type metadata accessor for CrashLog(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 48))(v51, 1, v54) == 1)
      {
        v29(v37, v36);
        v40 = &qword_100019E48;
        v41 = (uint64_t)v51;
LABEL_26:
        sub_100004288(v41, v40);
        v55 = v68;
        *(_OWORD *)v68 = 0u;
        *(_OWORD *)(v55 + 16) = 0u;
        *(_QWORD *)(v55 + 32) = 0;
      }
      else
      {
        v56 = (_QWORD *)v68;
        *(_QWORD *)(v68 + 24) = v54;
        v56[4] = &off_100014960;
        v57 = sub_10000424C(v56);
        v58 = type metadata accessor for CrashLog;
        v59 = (uint64_t)v51;
LABEL_31:
        sub_1000042C4(v59, (uint64_t)v57, v58);
        v29(v37, v36);
      }
      break;
    default:
      if (qword_100019C78 != -1)
        swift_once(&qword_100019C78, sub_100008374);
      v42 = type metadata accessor for Logger(0);
      v43 = sub_100003380(v42, (uint64_t)qword_10001AB28);
      v44 = Logger.logObject.getter(v43);
      v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = v36;
        v47 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v47 = 134217984;
        v69 = v38;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, v70, v47 + 4, v47 + 12);
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Invalid Log Type %ld", v47, 0xCu);
        v48 = v47;
        v36 = v46;
        v37 = v67;
        swift_slowDealloc(v48, -1, -1);
      }

      v29(v37, v36);
      goto LABEL_9;
  }
}

uint64_t sub_100004088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  uint64_t v22;
  uint64_t v24;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v24 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v24 - v11;
  URL.deletingLastPathComponent()(v10);
  URL.appendingPathComponent(_:isDirectory:)(0x64657269746552, 0xE700000000000000, 1);
  v13 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v14 = v13(v6, v2);
  v15 = URL.lastPathComponent.getter(v14);
  v17 = v16;
  URL.appendingPathComponent(_:)(v15);
  swift_bridgeObjectRelease(v17);
  v13(v9, v2);
  v18 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL.path.getter();
  v20 = v19;
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  LODWORD(v20) = objc_msgSend(v18, "fileExistsAtPath:", v21);

  if ((_DWORD)v20)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v12, v2);
    v22 = 0;
  }
  else
  {
    v13(v12, v2);
    v22 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, v22, 1, v2);
}

_QWORD *sub_10000424C(_QWORD *a1)
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

uint64_t sub_100004288(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000033D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000042C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100004308()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019E40;
  if (!qword_100019E40)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100019E40);
  }
  return result;
}

id sub_100004350(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  id v8;
  NSString v9;
  Class isa;
  id v11;
  uint64_t v13;

  v4 = sub_1000033D8(&qword_100019E60);
  inited = swift_initStackObject(v4, &v13);
  *(_OWORD *)(inited + 16) = xmmword_100010810;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
  *(_QWORD *)(inited + 40) = v6;
  *(_QWORD *)(inited + 72) = &type metadata for String;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  swift_bridgeObjectRetain(a2);
  v7 = sub_100004464(inited);
  v8 = objc_allocWithZone((Class)NSError);
  v9 = String._bridgeToObjectiveC()();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  v11 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, 1, isa);

  return v11;
}

unint64_t sub_100004464(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000033D8(&qword_100019E78);
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
    sub_1000053E8(v7, (uint64_t)&v16, &qword_100019E80);
    v8 = v16;
    v9 = v17;
    result = sub_10000506C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000542C(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
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

unint64_t sub_100004598(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000033D8(&qword_100019E88);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_10000506C(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
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

uint64_t sub_1000046B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[32];
  uint64_t v60;

  v60 = 0;
  memset(v59, 0, sizeof(v59));
  v52 = 0x736E6F6974706FLL;
  v53 = 0xE700000000000000;
  AnyHashable.init<A>(_:)(&v54, &v52, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v4 = sub_1000050D0((uint64_t)&v54), (v5 & 1) != 0))
  {
    sub_1000053AC(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v57);
  }
  else
  {
    v57 = 0u;
    v58 = 0u;
  }
  sub_100005100((uint64_t)&v54);
  if (!*((_QWORD *)&v58 + 1))
  {
    sub_100004288((uint64_t)&v57, &qword_100019E68);
LABEL_11:
    if (qword_100019C78 != -1)
      swift_once(&qword_100019C78, sub_100008374);
    v10 = type metadata accessor for Logger(0);
    sub_100003380(v10, (uint64_t)qword_10001AB28);
    v11 = swift_bridgeObjectRetain_n(a1, 2);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v54 = v15;
      *(_DWORD *)v14 = 136315138;
      v16 = swift_bridgeObjectRetain(a1);
      v17 = a2;
      v18 = Dictionary.description.getter(v16, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v20 = v19;
      swift_bridgeObjectRelease(a1);
      v21 = v18;
      a2 = v17;
      *(_QWORD *)&v57 = sub_1000096B8(v21, v20, (uint64_t *)&v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, (char *)&v57 + 8, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Missing or malformed \"options\" in launch parameters: %s", v14, 0xCu);
      swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if ((swift_dynamicCast(&v52, &v57, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) == 0)
    goto LABEL_11;
  v6 = v52;
  v7 = v53;
  v52 = 1701869940;
  v53 = 0xE400000000000000;
  AnyHashable.init<A>(_:)(&v54, &v52, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v8 = sub_1000050D0((uint64_t)&v54), (v9 & 1) != 0))
  {
    sub_1000053AC(*(_QWORD *)(a1 + 56) + 32 * v8, (uint64_t)&v57);
  }
  else
  {
    v57 = 0u;
    v58 = 0u;
  }
  sub_100005100((uint64_t)&v54);
  if (*((_QWORD *)&v58 + 1))
  {
    if ((swift_dynamicCast(&v52, &v57, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
    {
      v22 = v52;
      v23 = type metadata accessor for JSONDecoder(0);
      swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
      v24 = JSONDecoder.init()();
      v25 = type metadata accessor for DiagnosticsReporterLaunchOptions();
      v26 = sub_10000531C();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)(&v54, v25, v6, v7, v25, v26);
      swift_release(v24);
      v41 = (void *)v54;
      v42 = sub_100008BE8(v22);
      if ((v43 & 1) == 0)
      {
        v44 = v42;
        v45 = v41;
        sub_1000039CC(v44, v45, (uint64_t)&v54);
        sub_1000052D8(v6, v7);

        sub_100004288((uint64_t)v59, &qword_100019E28);
        sub_100005364((uint64_t)&v54, (uint64_t)v59);
        sub_1000053E8((uint64_t)v59, a2, &qword_100019E28);
        sub_1000053E8((uint64_t)v59, (uint64_t)&v54, &qword_100019E28);
        v46 = *((_QWORD *)&v55 + 1);
        sub_100004288((uint64_t)&v54, &qword_100019E28);
        if (v46)
          return sub_100004288((uint64_t)v59, &qword_100019E28);
        goto LABEL_28;
      }
      if (qword_100019C78 != -1)
        swift_once(&qword_100019C78, sub_100008374);
      v47 = type metadata accessor for Logger(0);
      v48 = sub_100003380(v47, (uint64_t)qword_10001AB28);
      v12 = Logger.logObject.getter(v48);
      v49 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v50 = 134217984;
        *(_QWORD *)&v54 = v22;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, (char *)&v54 + 8, v50 + 4, v50 + 12);
        _os_log_impl((void *)&_mh_execute_header, v12, v49, "Log type value does not match a know type: %ld", v50, 0xCu);
        swift_slowDealloc(v50, -1, -1);
      }

      v36 = v6;
      v37 = v7;
      goto LABEL_24;
    }
  }
  else
  {
    sub_100004288((uint64_t)&v57, &qword_100019E68);
  }
  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v27 = type metadata accessor for Logger(0);
  sub_100003380(v27, (uint64_t)qword_10001AB28);
  v28 = swift_bridgeObjectRetain_n(a1, 2);
  v12 = Logger.logObject.getter(v28);
  v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v29))
  {
    v51 = v6;
    v30 = (uint8_t *)swift_slowAlloc(12, -1);
    v31 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v54 = v31;
    *(_DWORD *)v30 = 136315138;
    v32 = swift_bridgeObjectRetain(a1);
    v33 = Dictionary.description.getter(v32, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v35 = v34;
    swift_bridgeObjectRelease(a1);
    *(_QWORD *)&v57 = sub_1000096B8(v33, v35, (uint64_t *)&v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, (char *)&v57 + 8, v30 + 4, v30 + 12);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v35);
    _os_log_impl((void *)&_mh_execute_header, v12, v29, "Missing or malformed \"type\" in launch parameters: %s", v30, 0xCu);
    swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    swift_slowDealloc(v30, -1, -1);
    v37 = v7;
    v36 = v51;
LABEL_24:
    sub_1000052D8(v36, v37);

    goto LABEL_27;
  }
  sub_1000052D8(v6, v7);
LABEL_26:

  swift_bridgeObjectRelease_n(a1, 2);
LABEL_27:
  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  sub_1000053E8((uint64_t)v59, (uint64_t)&v54, &qword_100019E28);
  v38 = *((_QWORD *)&v55 + 1);
  sub_100004288((uint64_t)&v54, &qword_100019E28);
  if (!v38)
  {
LABEL_28:
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
    v39 = sub_100004598((uint64_t)&_swiftEmptyArrayStorage);
    sub_100005DF0(3);
    swift_bridgeObjectRelease(v39);
    sub_100004288((uint64_t)&v54, &qword_100019E28);
  }
  return sub_100004288((uint64_t)v59, &qword_100019E28);
}

void *sub_100004FB0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_100005044@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_10000506C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100005134(a1, a2, v5);
}

unint64_t sub_1000050D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100005214(a1, v4);
}

uint64_t sub_100005100(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

unint64_t sub_100005134(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100005214(uint64_t a1, uint64_t a2)
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
      sub_10000543C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100005100((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000052D8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10000531C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019E70;
  if (!qword_100019E70)
  {
    v1 = type metadata accessor for DiagnosticsReporterLaunchOptions();
    result = swift_getWitnessTable(&protocol conformance descriptor for DiagnosticsReporterLaunchOptions, v1);
    atomic_store(result, (unint64_t *)&qword_100019E70);
  }
  return result;
}

uint64_t sub_100005364(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033D8(&qword_100019E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000053AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000053E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000033D8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000542C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000543C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for DefaultPolicy()
{
  return &type metadata for DefaultPolicy;
}

ValueMetadata *type metadata accessor for AnalyticsLogger()
{
  return &type metadata for AnalyticsLogger;
}

uint64_t sub_100005498(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1000054D0 + 4 * byte_1000108D0[a1]))(0xD000000000000013, 0x800000010000F9F0);
}

uint64_t sub_1000054D0()
{
  return 0x73736563637573;
}

uint64_t sub_1000054E8()
{
  return 0x6572756C696166;
}

uint64_t sub_100005500()
{
  return 0x2D6572756C696166;
}

uint64_t sub_100005538()
{
  return 0x2D64656C706D6173;
}

uint64_t sub_100005558()
{
  return 0x662D6C65636E6163;
}

uint64_t sub_100005574()
{
  return 0x642D6C65636E6163;
}

uint64_t sub_100005590(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v12;

  swift_bridgeObjectRetain(a2);
  v8 = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a4);
  v12 = *a4;
  *a4 = 0x8000000000000000;
  sub_100005934((uint64_t)v8, a1, a2, isUniquelyReferenced_nonNull_native);
  v10 = *a4;
  *a4 = v12;
  swift_bridgeObjectRelease(a2);
  return swift_bridgeObjectRelease(v10);
}

Swift::Int sub_100005628(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000033D8(&qword_100019E88);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_36;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v37)
              goto LABEL_36;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      v34 = v33;
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

void sub_100005934(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_10000506C(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100005A90();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }
    goto LABEL_14;
  }
  sub_100005628(v15, a4 & 1);
  v20 = sub_10000506C(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

id sub_100005A90()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_1000033D8(&qword_100019E88);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100005C40(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;

  v20 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = ((uint64_t (*)(void))swift_bridgeObjectRetain)();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v7)
      return swift_release(a1);
    v18 = *(_QWORD *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v7)
        return swift_release(a1);
      v18 = *(_QWORD *)(v20 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v7)
          return swift_release(a1);
        v18 = *(_QWORD *)(v20 + 8 * v9);
        if (!v18)
        {
          v9 = v17 + 3;
          if (v17 + 3 >= v7)
            return swift_release(a1);
          v18 = *(_QWORD *)(v20 + 8 * v9);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v14);
    v16 = v15;
    a2(v13, v14, v16);

    result = swift_bridgeObjectRelease(v14);
  }
  v19 = v17 + 4;
  if (v19 >= v7)
    return swift_release(a1);
  v18 = *(_QWORD *)(v20 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v7)
      return swift_release(a1);
    v18 = *(_QWORD *)(v20 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_100005DF0(char a1)
{
  uint64_t v2;
  uint64_t inited;
  _BYTE v4[64];

  v2 = sub_1000033D8(&qword_100019E38);
  inited = swift_initStackObject(v2, v4);
  *(_OWORD *)(inited + 16) = xmmword_100010810;
  *(_QWORD *)(inited + 32) = 0x737574617473;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  __asm { BR              X10 }
}

void sub_100005E90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  uint64_t v11;
  Class isa;

  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE700000000000000);
  *(_QWORD *)(v2 + 48) = v4;
  v5 = sub_100004598(v2);
  *(_QWORD *)(v3 - 72) = v5;
  if (*(_QWORD *)(v1 + 24))
  {
    sub_100006144(v1, v3 - 176);
    v6 = *(_QWORD *)(v3 - 152);
    if (!v6)
    {
      __break(1u);
      JUMPOUT(0x1000060D0);
    }
    v7 = *(_QWORD *)(v3 - 144);
    sub_10000289C((_QWORD *)(v3 - 176), *(_QWORD *)(v3 - 152));
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 56))(v6, v7);
    v9 = __chkstk_darwin(v8);
    sub_100005C40(v9, (void (*)(uint64_t, uint64_t, id))sub_10000618C);
    swift_bridgeObjectRelease(v8);
    v5 = sub_1000028C0((_QWORD *)(v3 - 176));
  }
  __chkstk_darwin(v5);
  sub_100005C40(v0, (void (*)(uint64_t, uint64_t, id))sub_1000060F0);
  v10 = String._bridgeToObjectiveC()();
  v11 = *(_QWORD *)(v3 - 72);
  sub_100006108();
  swift_bridgeObjectRetain(v11);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  ((void (*)(NSString, Class))AnalyticsSendEvent)(v10, isa);
  swift_bridgeObjectRelease(v11);

}

uint64_t sub_1000060F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  return sub_100005590(a1, a2, a3, *(_QWORD **)(v3 + 16));
}

unint64_t sub_100006108()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019E90;
  if (!qword_100019E90)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019E90);
  }
  return result;
}

uint64_t sub_100006144(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033D8(&qword_100019E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006190@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  ValueMetadata *v24;
  _UNKNOWN **v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v43[12];
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  _UNKNOWN **v53;

  v48 = a3;
  v5 = a1;
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v44 = &v43[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = (int *)type metadata accessor for CrashLog(0);
  v47 = *((_QWORD *)v9 - 1);
  v10 = (int *)__chkstk_darwin(v9);
  v12 = &v43[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = &v12[v10[6]];
  *(_QWORD *)v13 = 0x6873617243;
  *((_QWORD *)v13 + 1) = 0xE500000000000000;
  v14 = &v12[v10[10]];
  if (v5 == 4)
    v15 = 3;
  else
    v15 = a1;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *v12 = v15;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16(&v12[v10[5]], a2, v6);
  v17 = sub_1000033D8(&qword_100019E98);
  v18 = *(_QWORD *)(v7 + 72);
  v45 = v7;
  v19 = *(unsigned __int8 *)(v7 + 80);
  v20 = (v19 + 32) & ~v19;
  v21 = swift_allocObject(v17, v20 + v18, v19 | 7);
  *(_OWORD *)(v21 + 16) = xmmword_100010810;
  v46 = v6;
  v16((char *)(v21 + v20), a2, v6);
  *(_QWORD *)&v12[v9[7]] = v21;
  v22 = sub_100004464((uint64_t)&_swiftEmptyArrayStorage);
  v23 = v9[8];
  *(_QWORD *)&v12[v23] = v22;
  v24 = &type metadata for DefaultPolicy;
  if ((v15 & 0xFE) != 0)
  {
    v25 = &off_100014920;
  }
  else
  {
    v24 = &type metadata for CriticalPolicy;
    v25 = &off_100014F38;
  }
  *((_QWORD *)&v52 + 1) = v24;
  v53 = v25;
  sub_1000067D0(&v51, (uint64_t)&v12[v9[9]]);
  v26 = sub_10000A410(a2);
  v44 = v14;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v22);
  *(_QWORD *)&v12[v23] = v26;
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(kOSALogOptionDisplayName);
  v29 = v28;
  v30 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
  v31 = __DataStorage.init(capacity:)(128);
  v51 = 0uLL;
  v32 = __chkstk_darwin(v31);
  *(_QWORD *)&v43[-48] = a2;
  *(_QWORD *)&v43[-40] = v27;
  *(_QWORD *)&v43[-32] = v29;
  *(_QWORD *)&v43[-24] = 128;
  *(_QWORD *)&v43[-16] = &v51;
  v49 = 0;
  v50 = v32;
  sub_100007BFC((void (*)(uint64_t, uint64_t))sub_100006BD0);
  v33 = v50;
  swift_bridgeObjectRelease(v29);
  swift_release(v33);
  v34 = *((_QWORD *)&v51 + 1);
  if (!*((_QWORD *)&v51 + 1))
  {
    v37 = v46;
    v36 = v44;
    if (v26[2] && (v38 = sub_10000506C(1701667182, 0xE400000000000000), (v39 & 1) != 0))
    {
      sub_1000053AC(v26[7] + 32 * v38, (uint64_t)&v51);
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
    }
    v40 = v45;
    swift_bridgeObjectRelease(v26);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(a2, v37);
    if (*((_QWORD *)&v52 + 1))
    {
      if (swift_dynamicCast(&v49, &v51, (char *)&type metadata for Any + 8, &type metadata for String, 6))
      {
        v35 = v49;
        v34 = v50;
        goto LABEL_18;
      }
    }
    else
    {
      sub_100006BF0((uint64_t)&v51);
    }
    v34 = 0;
    v35 = 0;
    v49 = 0;
    v50 = 0;
    goto LABEL_18;
  }
  v35 = v51;
  swift_bridgeObjectRelease(v26);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(a2, v46);
  v49 = v35;
  v50 = v34;
  v36 = v44;
LABEL_18:
  swift_bridgeObjectRelease(*((_QWORD *)v36 + 1));
  *(_QWORD *)v36 = v35;
  *((_QWORD *)v36 + 1) = v34;
  v41 = v48;
  sub_100006C30((uint64_t)v12, v48);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v47 + 56))(v41, 0, 1, v9);
  return sub_100006B94((uint64_t)v12);
}

uint64_t type metadata accessor for CrashLog(uint64_t a1)
{
  uint64_t result;

  result = qword_100019EF8;
  if (!qword_100019EF8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CrashLog);
  return result;
}

uint64_t sub_1000067D0(__int128 *a1, uint64_t a2)
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

BOOL sub_1000067E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000067FC()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006840()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006868(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_1000068A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _BYTE v17[32];
  _BYTE v18[104];

  v1 = v0;
  v2 = sub_1000033D8(&qword_100019E38);
  inited = swift_initStackObject(v2, v18);
  *(_OWORD *)(inited + 16) = xmmword_100010910;
  *(_QWORD *)(inited + 32) = 0x737365636F7270;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  v4 = *(int *)(type metadata accessor for CrashLog(0) + 32);
  v5 = *(_QWORD *)(v0 + v4);
  if (*(_QWORD *)(v5 + 16)
    && (v6 = sub_10000506C(1701667182, 0xE400000000000000), (v7 & 1) != 0)
    && (sub_1000053AC(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)v17),
        v8 = sub_1000074F4(),
        swift_dynamicCast(&v16, v17, (char *)&type metadata for Any + 8, v8, 6)))
  {
    v9 = v16;
  }
  else
  {
    sub_1000074F4();
    v9 = NSString.init(stringLiteral:)("<unknown>", 9, 2);
  }
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = 0x746E656469636E69;
  *(_QWORD *)(inited + 64) = 0xEB0000000064695FLL;
  v10 = *(_QWORD *)(v1 + v4);
  if (*(_QWORD *)(v10 + 16)
    && (v11 = sub_10000506C(0x746E656469636E69, 0xEB0000000064695FLL), (v12 & 1) != 0)
    && (sub_1000053AC(*(_QWORD *)(v10 + 56) + 32 * v11, (uint64_t)v17),
        v13 = sub_1000074F4(),
        swift_dynamicCast(&v16, v17, (char *)&type metadata for Any + 8, v13, 6)))
  {
    v14 = v16;
  }
  else
  {
    sub_1000074F4();
    v14 = NSString.init(stringLiteral:)("<unknown>", 9, 2);
  }
  *(_QWORD *)(inited + 72) = v14;
  *(_QWORD *)(inited + 80) = 1701869940;
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  *(_QWORD *)(inited + 96) = String._bridgeToObjectiveC()();
  return sub_100004598(inited);
}

unint64_t sub_100006A94()
{
  _BYTE *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = 0x61576D6574737953;
  v3 = 0x647261646E617453;
  if (!*v0)
    v3 = 4541505;
  if (v1 != 1)
    v2 = v3;
  if (v1 == 2)
    return 0xD000000000000014;
  else
    return v2;
}

uint64_t sub_100006B18(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 24));
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_100006B4C(uint64_t a1)
{
  uint64_t v1;

  return swift_bridgeObjectRetain(*(_QWORD *)(v1 + *(int *)(a1 + 28)));
}

uint64_t sub_100006B60(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 40));
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_100006B94(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CrashLog(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006BD0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1000077E4(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_100006BF0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033D8(&qword_100019E68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006C30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CrashLog(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100006C74(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = a3[7];
    v13 = (uint64_t *)((char *)v4 + v11);
    v14 = (uint64_t *)((char *)a2 + v11);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = *(uint64_t *)((char *)a2 + v12);
    *(uint64_t *)((char *)v4 + v12) = v16;
    v17 = a3[8];
    v18 = a3[9];
    v19 = *(uint64_t *)((char *)a2 + v17);
    *(uint64_t *)((char *)v4 + v17) = v19;
    v20 = (char *)v4 + v18;
    v21 = (char *)a2 + v18;
    v22 = *(_OWORD *)((char *)a2 + v18 + 24);
    *(_OWORD *)((char *)v4 + v18 + 24) = v22;
    v23 = v22;
    v24 = **(void (***)(char *, char *, uint64_t))(v22 - 8);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(v19);
    v24(v20, v21, v23);
    v25 = a3[10];
    v26 = (uint64_t *)((char *)v4 + v25);
    v27 = (uint64_t *)((char *)a2 + v25);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    swift_bridgeObjectRetain(v28);
  }
  return v4;
}

uint64_t sub_100006D9C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + a2[5];
  v5 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[7]));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[8]));
  sub_1000028C0((_QWORD *)(a1 + a2[9]));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[10] + 8));
}

_BYTE *sub_100006E28(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  __int128 v21;
  uint64_t v22;
  void (*v23)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = &a1[v10];
  v13 = &a2[v10];
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = *(_QWORD *)&a2[v11];
  *(_QWORD *)&a1[v11] = v15;
  v16 = a3[8];
  v17 = a3[9];
  v18 = *(_QWORD *)&a2[v16];
  *(_QWORD *)&a1[v16] = v18;
  v19 = &a1[v17];
  v20 = &a2[v17];
  v21 = *(_OWORD *)&a2[v17 + 24];
  *(_OWORD *)&a1[v17 + 24] = v21;
  v22 = v21;
  v23 = **(void (***)(_BYTE *, _BYTE *, uint64_t))(v21 - 8);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v18);
  v23(v19, v20, v22);
  v24 = a3[10];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  swift_bridgeObjectRetain(v27);
  return a1;
}

_BYTE *sub_100006F24(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = &a1[v10];
  v12 = &a2[v10];
  *v11 = *v12;
  v13 = v12[1];
  v14 = v11[1];
  v11[1] = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  v15 = a3[7];
  v16 = *(_QWORD *)&a2[v15];
  v17 = *(_QWORD *)&a1[v15];
  *(_QWORD *)&a1[v15] = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  v18 = a3[8];
  v19 = *(_QWORD *)&a2[v18];
  v20 = *(_QWORD *)&a1[v18];
  *(_QWORD *)&a1[v18] = v19;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRelease(v20);
  sub_100007030(&a1[a3[9]], &a2[a3[9]]);
  v21 = a3[10];
  v22 = &a1[v21];
  v23 = &a2[v21];
  *v22 = *v23;
  v24 = v23[1];
  v25 = v22[1];
  v22[1] = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  return a1;
}

_QWORD *sub_100007030(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

_BYTE *sub_100007198(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  __int128 v14;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  v11 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  return a1;
}

_BYTE *sub_100007248(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  __int128 v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = &a1[v10];
  v12 = (uint64_t *)&a2[v10];
  v14 = *v12;
  v13 = v12[1];
  v15 = v11[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease(v15);
  v16 = a3[7];
  v17 = *(_QWORD *)&a1[v16];
  *(_QWORD *)&a1[v16] = *(_QWORD *)&a2[v16];
  swift_bridgeObjectRelease(v17);
  v18 = a3[8];
  v19 = *(_QWORD *)&a1[v18];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  swift_bridgeObjectRelease(v19);
  v20 = a3[9];
  v21 = &a1[v20];
  v22 = &a2[v20];
  sub_1000028C0(&a1[v20]);
  v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
  v24 = a3[10];
  v25 = &a1[v24];
  v26 = (uint64_t *)&a2[v24];
  v28 = *v26;
  v27 = v26[1];
  v29 = v25[1];
  *v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease(v29);
  return a1;
}

uint64_t sub_100007338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007344);
}

uint64_t sub_100007344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000073C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000073D4);
}

uint64_t sub_1000073D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_100007454(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = &unk_100010950;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_100010968;
    v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[5] = &unk_100010980;
    v4[6] = &unk_100010998;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_1000074F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019F48;
  if (!qword_100019F48)
  {
    v1 = objc_opt_self(NSString);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019F48);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for CrashLog.Type(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CrashLog.Type(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CrashLog.Type(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000761C + 4 * byte_100010925[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100007650 + 4 * byte_100010920[v4]))();
}

uint64_t sub_100007650(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007658(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100007660);
  return result;
}

uint64_t sub_10000766C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100007674);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100007678(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007680(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000768C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100007698(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CrashLog.Type()
{
  return &type metadata for CrashLog.Type;
}

unint64_t sub_1000076B4()
{
  unint64_t result;

  result = qword_100019F50;
  if (!qword_100019F50)
  {
    result = swift_getWitnessTable(&unk_100010A08, &type metadata for CrashLog.Type);
    atomic_store(result, (unint64_t *)&qword_100019F50);
  }
  return result;
}

Swift::String_optional __swiftcall URL.extendedAttribute(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  Swift::String_optional result;
  uint64_t v5;

  v1 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v5 = __DataStorage.init(capacity:)(128);
  sub_100007BFC((void (*)(uint64_t, uint64_t))sub_100006BD0);
  swift_release(v5);
  v2 = 0;
  v3 = 0;
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

uint64_t URL.setExtendedAttribute(name:value:)()
{
  return URL.withUnsafeFileSystemRepresentation<A>(_:)(sub_100007CA4);
}

uint64_t sub_1000077E4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    v7 = a4;
    v8 = a5;
    v9 = result;
    v10 = a6;
    v11 = a7;
    return URL.withUnsafeFileSystemRepresentation<A>(_:)(sub_100007DB8);
  }
  return result;
}

uint64_t sub_100007850(const char *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, uint64_t *a6)
{
  uint64_t v10;
  ssize_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = String.utf8CString.getter(a2, a3);
  v11 = getxattr(a1, (const char *)(v10 + 32), a4, a5, 0, 0);
  result = swift_release(v10);
  if (v11 >= 1)
  {
    v13 = String.init(validatingUTF8:)(a4);
    v14 = a6[1];
    *a6 = v13;
    a6[1] = v15;
    return swift_bridgeObjectRelease(v14);
  }
  return result;
}

void sub_1000078E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

uint64_t sub_10000794C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t value, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t result;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  __int16 v35;
  char v36;
  char v37;
  char v38;
  char v39;

  v34 = v25;
  v35 = v28;
  v36 = BYTE2(v28);
  v37 = BYTE3(v28);
  v38 = BYTE4(v28);
  v39 = BYTE5(v28);
  v29 = String.utf8CString.getter(v27, v26);
  v30 = setxattr(v24, (const char *)(v29 + 32), &v34, BYTE6(v28), 0, 0);
  result = swift_release(v29);
  if (v30 < 0)
  {
    v32 = sub_100007D30();
    ((void (*)(ValueMetadata *, unint64_t, _QWORD, _QWORD))swift_allocError)(&type metadata for URL.ExtendedAttributeError, v32, 0, 0);
    *v33 = v30;
    return ((uint64_t (*)(void))swift_willThrow)();
  }
  return result;
}

void sub_100007BFC(void (*a1)(uint64_t, uint64_t))
{
  int *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  Data.InlineSlice.ensureUniqueReference()();
  v3 = *v1;
  v4 = v1[1];
  if ((int)v4 < (int)v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  v5 = __DataStorage._bytes.getter();
  if (!v5)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v6 = v5;
  v7 = __DataStorage._offset.getter();
  v8 = v3 - v7;
  if (__OFSUB__(v3, v7))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v4 - v3;
  v10 = __DataStorage._length.getter();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  a1(v6 + v8, v6 + v8 + v11);
}

void sub_100007CA4(uint64_t a1)
{
  uint64_t v1;

  sub_1000078E8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

_QWORD *_s22ExtendedAttributeErrorOwCP(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s22ExtendedAttributeErrorOwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t _s22ExtendedAttributeErrorOwst(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t sub_100007D18()
{
  return 0;
}

ValueMetadata *type metadata accessor for URL.ExtendedAttributeError()
{
  return &type metadata for URL.ExtendedAttributeError;
}

unint64_t sub_100007D30()
{
  unint64_t result;

  result = qword_100019F58;
  if (!qword_100019F58)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for URL.ExtendedAttributeError, &type metadata for URL.ExtendedAttributeError);
    atomic_store(result, (unint64_t *)&qword_100019F58);
  }
  return result;
}

uint64_t sub_100007D74(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100007DB8(const char *a1)
{
  uint64_t v1;

  return sub_100007850(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(uint64_t **)(v1 + 48));
}

id sub_100007E14(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *ObjCClassFromMetadata;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC19DiagnosticsReporter11AppDelegate);
}

uint64_t type metadata accessor for RootViewController()
{
  return objc_opt_self(_TtC19DiagnosticsReporter18RootViewController);
}

id sub_1000080D4()
{
  void *v0;
  uint64_t v1;
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v1 = (uint64_t)v0 + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
  result = (id)sub_100006144((uint64_t)v0 + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog, (uint64_t)v15);
  if (!v15[3])
  {
    __break(1u);
    goto LABEL_7;
  }
  result = (id)sub_100006144(v1, (uint64_t)v14);
  if (!v14[3])
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_100008444(v14);
  v4 = v3;
  v6 = v5;
  sub_1000028C0(v14);
  sub_100002858((uint64_t)v15, (uint64_t)v14);
  v7 = type metadata accessor for FeedbackController();
  swift_allocObject(v7, 72, 7);
  v8 = v0;
  v9 = sub_100002148(v14, v4, v6);
  sub_1000028C0(v15);
  swift_unknownObjectUnownedAssign(v9 + 64, v8);

  v10 = OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController;
  v11 = *(_QWORD *)&v8[OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController];
  *(_QWORD *)&v8[OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController] = v9;
  result = (id)swift_release(v11);
  v12 = *(_QWORD *)&v8[v10];
  if (!v12)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = objc_msgSend(*(id *)(v12 + 16), "setModalInPresentation:", 1);
  v13 = *(_QWORD *)&v8[v10];
  if (v13)
    return objc_msgSend(v8, "presentViewController:animated:completion:", *(_QWORD *)(v13 + 16), 1, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t Array.appendIfNotNil(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = type metadata accessor for Optional(0, v4);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v17 - v8;
  v10 = *(_QWORD *)(v4 - 8);
  v11 = __chkstk_darwin(v7);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v17 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v4) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v9, v4);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v4);
  Array.append(_:)(v13, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v4);
}

uint64_t sub_10000835C(uint64_t a1)
{
  return sub_100008390(a1, qword_10001AB10, 7368801, 0xE300000000000000);
}

uint64_t sub_100008374(uint64_t a1)
{
  return sub_100008390(a1, qword_10001AB28, 0x6E6F6D6D6F63, 0xE600000000000000);
}

uint64_t sub_100008390(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_100008404(v7, a2);
  sub_100003380(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000029, 0x800000010000FAE0, a3, a4);
}

uint64_t *sub_100008404(uint64_t a1, uint64_t *a2)
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

void sub_100008444(_QWORD *a1)
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
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSString v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  _OWORD *object;
  NSString v30;
  id v31;
  Swift::String v32;
  Swift::String v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSString v53;
  id v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  char v58;
  _QWORD v59[3];
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[3];
  uint64_t v63;
  uint64_t v64;
  Swift::String v65;
  Swift::String v66;
  Swift::String v67;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000289C(a1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
  v6 = v5;
  if (v4 == 0x63696E6150 && v5 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease(v5);
    goto LABEL_21;
  }
  v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, 0x63696E6150, 0xE500000000000000, 0);
  swift_bridgeObjectRelease(v6);
  if ((v8 & 1) != 0)
  {
LABEL_21:
    v30 = String._bridgeToObjectiveC()();
    v31 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleWithIdentifier:", v30);

    if (v31)
    {
      v66._countAndFlagsBits = 0xD00000000000001BLL;
      v66._object = (void *)0x800000010000FB40;
      v32._countAndFlagsBits = 0x6E6150656C746954;
      v32._object = (void *)0xED0000534F696369;
      v33._countAndFlagsBits = 0;
      v33._object = (void *)0xE000000000000000;
      v34 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, (Swift::String_optional)0, (NSBundle)v31, v33, v66);

      v35 = sub_1000033D8(&qword_10001A088);
      v36 = swift_allocObject(v35, 72, 7);
      *(_OWORD *)(v36 + 16) = xmmword_100010810;
      v37 = String._bridgeToObjectiveC()();
      v38 = (void *)MGGetStringAnswer();

      if (v38)
      {
        v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        v41 = v40;

        *(_QWORD *)(v36 + 56) = &type metadata for String;
        *(_QWORD *)(v36 + 64) = sub_100008A90();
        *(_QWORD *)(v36 + 32) = v39;
        *(_QWORD *)(v36 + 40) = v41;
        static String.localizedStringWithFormat(_:_:)(v34._countAndFlagsBits, v34._object, v36);
        swift_bridgeObjectRelease(v34._object);
        swift_bridgeObjectRelease(v36);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_41;
  }
  v9 = a1[3];
  v10 = a1[4];
  sub_10000289C(a1, v9);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
  v13 = v12;
  if (v11 == 0x6873617243 && v12 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease(v12);
    sub_100002858((uint64_t)a1, (uint64_t)v62);
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v12, 0x6873617243, 0xE500000000000000, 0);
    swift_bridgeObjectRelease(v13);
    sub_100002858((uint64_t)a1, (uint64_t)v62);
    if ((v15 & 1) == 0)
    {
      sub_1000028C0(v62);
      goto LABEL_12;
    }
  }
  v42 = v63;
  v43 = v64;
  sub_10000289C(v62, v63);
  v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 64))(v42, v43);
  v46 = v45;
  if (v44 == 4541505 && v45 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease(0xE300000000000000);
    sub_100002858((uint64_t)v62, (uint64_t)v59);
LABEL_32:
    sub_1000028C0(v59);
    sub_1000028C0(v62);
    goto LABEL_33;
  }
  v47 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, 4541505, 0xE300000000000000, 0);
  swift_bridgeObjectRelease(v46);
  sub_100002858((uint64_t)v62, (uint64_t)v59);
  if ((v47 & 1) != 0)
    goto LABEL_32;
  v48 = v60;
  v49 = v61;
  sub_10000289C(v59, v60);
  v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 64))(v48, v49);
  v52 = v51;
  if (v50 == 0x61576D6574737953 && v51 == 0xEE00676F64686374)
  {
    swift_bridgeObjectRelease(0xEE00676F64686374);
    goto LABEL_32;
  }
  v58 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v51, 0x61576D6574737953, 0xEE00676F64686374, 0);
  swift_bridgeObjectRelease(v52);
  sub_1000028C0(v59);
  sub_1000028C0(v62);
  if ((v58 & 1) == 0)
  {
LABEL_12:
    v16 = a1[3];
    v17 = a1[4];
    sub_10000289C(a1, v16);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 72))(v16, v17);
    v20 = v19;
    v21 = String._bridgeToObjectiveC()();
    v22 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleWithIdentifier:", v21);

    if (v22)
    {
      if (v20)
        v23 = v20;
      else
        v23 = 0xE700000000000000;
      if (v20)
        v24 = v18;
      else
        v24 = 0x6E776F6E6B6E55;
      v65._countAndFlagsBits = 0xD00000000000001BLL;
      v25._object = (void *)0xED0000534F696873;
      v65._object = (void *)0x800000010000FB40;
      v25._countAndFlagsBits = 0x617243656C746954;
      v26._countAndFlagsBits = 0;
      v26._object = (void *)0xE000000000000000;
      v27 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, (Swift::String_optional)0, (NSBundle)v22, v26, v65);

      v28 = sub_1000033D8(&qword_10001A088);
      object = (_OWORD *)swift_allocObject(v28, 72, 7);
      object[1] = xmmword_100010810;
      *((_QWORD *)object + 7) = &type metadata for String;
      *((_QWORD *)object + 8) = sub_100008A90();
      *((_QWORD *)object + 4) = v24;
      *((_QWORD *)object + 5) = v23;
      static String.localizedStringWithFormat(_:_:)(v27._countAndFlagsBits, v27._object, object);
      swift_bridgeObjectRelease(v27._object);
      goto LABEL_35;
    }
LABEL_42:
    __break(1u);
    return;
  }
LABEL_33:
  v53 = String._bridgeToObjectiveC()();
  v54 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleWithIdentifier:", v53);

  if (!v54)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v55._countAndFlagsBits = 0xD000000000000010;
  v67._countAndFlagsBits = 0xD000000000000028;
  v67._object = (void *)0x800000010000FB80;
  v55._object = (void *)0x800000010000FB60;
  v56._countAndFlagsBits = 0;
  v56._object = (void *)0xE000000000000000;
  v57 = NSLocalizedString(_:tableName:bundle:value:comment:)(v55, (Swift::String_optional)0, (NSBundle)v54, v56, v67);
  object = v57._object;

  static String.localizedStringWithFormat(_:_:)(v57._countAndFlagsBits, v57._object, &_swiftEmptyArrayStorage);
LABEL_35:
  swift_bridgeObjectRelease(object);
}

unint64_t sub_100008A90()
{
  unint64_t result;

  result = qword_10001A090;
  if (!qword_10001A090)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001A090);
  }
  return result;
}

unint64_t DiagnosticLogType.init(rawValue:)(unint64_t a1)
{
  return sub_100008BE8(a1);
}

BOOL sub_100008AEC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100008B00()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100008B44()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100008B6C(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_100008BAC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_100008BE8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100008BDC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_100008BE8(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

unint64_t sub_100008BFC()
{
  unint64_t result;

  result = qword_10001A098;
  if (!qword_10001A098)
  {
    result = swift_getWitnessTable("Y@", &type metadata for DiagnosticLogType);
    atomic_store(result, (unint64_t *)&qword_10001A098);
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticLogType()
{
  return &type metadata for DiagnosticLogType;
}

uint64_t sub_100008C50()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = objc_msgSend(v0, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v6, v1);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000959C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_1000033D8(&qword_10001A0D8);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_100004288((uint64_t)v7, &qword_100019E68);
    return 0;
  }
}

void sub_100008E40(void *a1, void (*a2)(uint64_t))
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  char *v9;
  uint8_t *v10;
  uint64_t v11;
  uint8_t *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];

  v3 = v2;
  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_100003380(v5, (uint64_t)qword_10001AB28);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = v3;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v35 = v11;
    *(_DWORD *)v10 = 136315138;
    v33 = sub_1000096B8(0xD00000000000001BLL, 0x800000010000FED0, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v10 + 4, v10 + 12);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    v12 = v10;
    v3 = v9;
    swift_slowDealloc(v12, -1, -1);
  }

  if (a1)
  {
    v13 = objc_msgSend(a1, "userInfo");
    if (v13)
    {
      v14 = v13;
      v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      sub_1000046B0(v15, (uint64_t)&v35);
      swift_bridgeObjectRelease(v15);
      v16 = (uint64_t)&v3[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
      swift_beginAccess(&v3[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog], &v33, 33, 0);
      sub_10000A3BC((uint64_t)&v35, v16);
      swift_endAccess(&v33);
    }
    else
    {
      v17 = a1;
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v31 = v3;
        v20 = (uint8_t *)swift_slowAlloc(12, -1);
        v21 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v20 = 138412290;
        v35 = (uint64_t)v17;
        v22 = v17;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, v36, v20 + 4, v20 + 12);
        *v21 = a1;

        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Context is missing user info dictionary: %@.", v20, 0xCu);
        v23 = sub_1000033D8(&qword_10001A0E8);
        swift_arrayDestroy(v21, 1, v23);
        swift_slowDealloc(v21, -1, -1);
        v24 = v20;
        v3 = v31;
        swift_slowDealloc(v24, -1, -1);

      }
      else
      {

      }
    }
    v25 = (uint64_t)&v3[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
    swift_beginAccess(&v3[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog], &v33, 0, 0);
    sub_100006144(v25, (uint64_t)&v35);
    v26 = v36[2];
    v27 = sub_100004288((uint64_t)&v35, &qword_100019E28);
    if (v26)
    {
      if (a2)
        a2(v27);
    }
    else
    {
      v28 = Logger.logObject.getter(v27);
      v29 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Unable to decode diagnostic log from launch parameters.", v30, 2u);
        swift_slowDealloc(v30, -1, -1);
      }

      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_10000950C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteViewController()
{
  return objc_opt_self(_TtC19DiagnosticsReporter20RemoteViewController);
}

uint64_t sub_10000959C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033D8(&qword_100019E68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000095E4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000095F4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100009628(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009648(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_1000096B8(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_1000096B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_100009788(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_1000053AC((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_1000053AC((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000028C0(v13);
  return v8;
}

uint64_t sub_100009788(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100009940(a5, a6);
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

uint64_t sub_100009940(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000099D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100009C24(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100009C24(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000099D4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100009B48(v4, 0);
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

_QWORD *sub_100009B48(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000033D8(&qword_10001A0E0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100009BAC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_100009C24(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000033D8(&qword_10001A0E0);
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

_BYTE **sub_100009D70(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

id sub_100009D80()
{
  char *v0;
  uint64_t v1;
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  char v15[24];
  _QWORD v16[5];

  v1 = (uint64_t)&v0[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
  swift_beginAccess(&v0[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog], v15, 0, 0);
  result = (id)sub_100006144(v1, (uint64_t)v16);
  if (!v16[3])
  {
    __break(1u);
    goto LABEL_7;
  }
  result = (id)sub_100006144(v1, (uint64_t)v14);
  if (!v14[3])
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_100008444(v14);
  v4 = v3;
  v6 = v5;
  sub_1000028C0(v14);
  sub_100002858((uint64_t)v16, (uint64_t)v14);
  v7 = type metadata accessor for FeedbackController();
  swift_allocObject(v7, 72, 7);
  v8 = v0;
  v9 = sub_100002148(v14, v4, v6);
  sub_1000028C0(v16);
  swift_unknownObjectUnownedAssign(v9 + 64, v8);

  v10 = OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController;
  v11 = *(_QWORD *)&v8[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController];
  *(_QWORD *)&v8[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = v9;
  result = (id)swift_release(v11);
  v12 = *(_QWORD *)&v8[v10];
  if (!v12)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = objc_msgSend(*(id *)(v12 + 16), "setModalInPresentation:", 1);
  v13 = *(_QWORD *)&v8[v10];
  if (v13)
    return objc_msgSend(v8, "presentViewController:animated:completion:", *(_QWORD *)(v13 + 16), 1, 0);
LABEL_9:
  __break(1u);
  return result;
}

void sub_100009ED0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  NSObject *oslog;
  uint64_t v10;
  uint64_t v11;

  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100003380(v4, (uint64_t)qword_10001AB28);
  oslog = Logger.logObject.getter(v5);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v11 = v8;
    *(_DWORD *)v7 = 136315138;
    v10 = sub_1000096B8(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, oslog, v6, "%s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
}

void sub_10000A05C(void (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100003380(v2, (uint64_t)qword_10001AB28);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v9 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = sub_1000096B8(0xD000000000000026, 0x800000010000FEF0, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  if (a1)
    a1();
}

void *sub_10000A1E0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  void *result;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_100019C78 != -1)
    swift_once(&qword_100019C78, sub_100008374);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100003380(v0, (uint64_t)qword_10001AB28);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = swift_slowAlloc(32, -1);
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v8 = sub_1000096B8(0xD00000000000001DLL, 0x800000010000FC70, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);
  }

  result = (void *)sub_100008C50();
  if (result)
  {
    v7 = result;
    objc_msgSend(result, "invalidate");
    return (void *)swift_unknownObjectRelease(v7);
  }
  return result;
}

uint64_t sub_10000A378(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000A388()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A3AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10000A3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033D8(&qword_100019E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_10000A410(uint64_t a1)
{
  return sub_10000A460(a1, sub_10000D3B8);
}

id sub_10000A460(uint64_t a1, uint64_t (*a2)(_QWORD *))
{
  uint64_t v2;
  id v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  Class isa;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[4];
  void *v26;
  id v27[4];
  _QWORD v28[4];

  v5 = String.init(contentsOf:)();
  if (!v2)
  {
    v7 = v5;
    v8 = v6;
    v28[0] = 10;
    v28[1] = 0xE100000000000000;
    __chkstk_darwin(v5);
    v25[2] = v28;
    swift_bridgeObjectRetain(v9);
    v10 = (_QWORD *)sub_10000B9DC(0x7FFFFFFFFFFFFFFFLL, 1, a2, (uint64_t)v25, v7, v8);
    swift_bridgeObjectRelease(v8);
    if (!v10[2])
      __break(1u);
    v11 = v10[4];
    v12 = v10[5];
    v13 = v10[6];
    v14 = v10[7];
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRelease(v10);
    v15 = sub_10000A690(v11, v12, v13, v14);
    v17 = v16;
    v18 = (void *)objc_opt_self(NSJSONSerialization);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v27[0] = 0;
    v3 = objc_msgSend(v18, "JSONObjectWithData:options:error:", isa, 0, v27);

    v20 = v27[0];
    if (v3)
    {
      _bridgeAnyObjectToAny(_:)(v28, v3);
      swift_unknownObjectRelease(v3);
      sub_1000053AC((uint64_t)v28, (uint64_t)v27);
      v21 = sub_1000033D8(&qword_10001A0F0);
      if ((swift_dynamicCast(&v26, v27, (char *)&type metadata for Any + 8, v21, 6) & 1) != 0)
        v3 = v26;
      else
        v3 = (id)sub_100004464((uint64_t)&_swiftEmptyArrayStorage);
      sub_1000052D8(v15, v17);
      sub_1000028C0(v28);
    }
    else
    {
      v22 = v20;
      _convertNSErrorToError(_:)();

      swift_willThrow(v23);
      sub_1000052D8(v15, v17);
    }
  }
  return v3;
}

uint64_t sub_10000A690(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20[2];
  uint64_t v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;

  *(_QWORD *)&v22 = a1;
  *((_QWORD *)&v22 + 1) = a2;
  v23 = a3;
  v24 = a4;
  swift_bridgeObjectRetain(a4);
  v4 = sub_1000033D8(&qword_10001A0F8);
  if (swift_dynamicCast(v20, &v22, &type metadata for Substring.UTF8View, v4, 6))
  {
    sub_1000067D0(v20, (uint64_t)&v16);
    v5 = v18;
    v6 = v19;
    sub_10000289C(&v16, v18);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(&v22, sub_10000C748, 0, &type metadata for Data._Representation, v5, v6);
    swift_bridgeObjectRelease(a4);
    v20[0] = v22;
    sub_1000028C0(&v16);
  }
  else
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_100004288((uint64_t)v20, &qword_10001A100);
    sub_10000CC10(a1, a2, a3, a4, &v16);
    v8 = v16;
    v7 = v17;
    if (v17 >> 60 == 15)
    {
      v9 = sub_10000C8F8(a1, a2, a3, a4);
      *(_QWORD *)&v20[0] = sub_10000D10C(v9);
      *((_QWORD *)&v20[0] + 1) = v10;
      __chkstk_darwin(*(_QWORD *)&v20[0]);
      sub_10000C42C();
      __asm { BR              X12 }
    }
    swift_bridgeObjectRelease(a4);
    *(_QWORD *)&v20[0] = v8;
    *((_QWORD *)&v20[0] + 1) = v7;
  }
  return *(_QWORD *)&v20[0];
}

void sub_10000AAE0(char a1@<W0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  _BYTE *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  uint64_t v35;
  void *v36;
  NSString v37;
  unsigned int v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  _QWORD *v46;
  int *v47;
  uint8_t *v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t);
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  NSString v75;
  unsigned __int8 v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char v80;
  unint64_t v81;
  unint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  _QWORD *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  int *v101;
  char *v102;
  uint64_t *v103;
  uint64_t v104;
  char *v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t v108[3];
  uint64_t v109;
  char v110[8];

  v100 = a3;
  v5 = type metadata accessor for Logger(0);
  v94 = *(_QWORD *)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v93 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v95 = (char *)&v86 - v8;
  v9 = sub_1000033D8(&qword_100019E58);
  __chkstk_darwin(v9);
  v92 = (uint64_t)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v107 - 8);
  v12 = __chkstk_darwin(v107);
  v102 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v105 = (char *)&v86 - v15;
  v16 = __chkstk_darwin(v14);
  v89 = (char *)&v86 - v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v86 - v18;
  v20 = (int *)type metadata accessor for PanicLog(0);
  v21 = *((_QWORD *)v20 - 1);
  v22 = (int *)__chkstk_darwin(v20);
  v24 = (char *)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v23) = a1 & 1;
  v25 = &v24[v22[6]];
  *v25 = 0x63696E6150;
  v25[1] = 0xE500000000000000;
  v96 = v25;
  v26 = &v24[v22[9]];
  v26[3] = &type metadata for CriticalPolicy;
  v26[4] = &off_100014F38;
  v27 = &v24[v22[10]];
  *v27 = 0;
  v27[1] = 0;
  *v24 = v23;
  v28 = sub_100004464((uint64_t)&_swiftEmptyArrayStorage);
  v98 = v20[8];
  *(_QWORD *)&v24[v98] = v28;
  v104 = v20[7];
  *(_QWORD *)&v24[v104] = &_swiftEmptyArrayStorage;
  v99 = a2;
  v29 = &a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess(&a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path], v110, 0, 0);
  v30 = (uint64_t *)v29;
  v31 = *((_QWORD *)v29 + 1);
  if (!v31)
  {
    v41 = v27;
    if (qword_100019C78 != -1)
      swift_once(&qword_100019C78, sub_100008374);
    v42 = sub_100003380(v5, (uint64_t)qword_10001AB28);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.error.getter();
    v45 = os_log_type_enabled(v43, v44);
    v46 = v96;
    v39 = v100;
    if (v45)
    {
      v47 = v20;
      v48 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Invalid log path", v48, 2u);
      v49 = v48;
      v20 = v47;
      swift_slowDealloc(v49, -1, -1);
    }

    v50 = v98;
    goto LABEL_43;
  }
  v91 = v5;
  v88 = v26;
  v106 = v24;
  v32 = *v30;
  v103 = v30;
  swift_bridgeObjectRetain(v31);
  v97 = v19;
  URL.init(fileURLWithPath:)(v32, v31);
  swift_bridgeObjectRelease(v31);
  v33 = (char *)objc_opt_self(NSFileManager);
  v34 = objc_msgSend(v33, "defaultManager");
  v35 = v103[1];
  if (!v35)
  {
    __break(1u);
    swift_errorRelease(v20);

    __break(1u);
    goto LABEL_45;
  }
  v36 = v34;
  swift_bridgeObjectRetain(v103[1]);
  v37 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v35);
  v38 = objc_msgSend(v36, "fileExistsAtPath:", v37);

  v39 = v100;
  v40 = v95;
  v90 = v21;
  v87 = v27;
  if (!v38)
  {
    v51 = v92;
    sub_100004088(v92);
    v52 = v107;
    v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v51, 1, v107);
    v24 = v106;
    if (v53 != 1)
    {
      v64 = v51;
      v65 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 32);
      v66 = v89;
      v65(v89, v64, v52);
      v65(&v24[v20[5]], (uint64_t)v66, v52);
      goto LABEL_17;
    }
    sub_100004288(v51, &qword_100019E58);
    if (qword_100019C78 != -1)
      swift_once(&qword_100019C78, sub_100008374);
    v54 = v91;
    v55 = sub_100003380(v91, (uint64_t)qword_10001AB28);
    v56 = v94;
    (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v40, v55, v54);
    v33 = v99;
    v57 = Logger.logObject.getter(v33);
    v58 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v57, v58))
    {

      (*(void (**)(char *, uint64_t))(v56 + 8))(v40, v54);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v97, v107);
      v21 = v90;
      goto LABEL_42;
    }
    v101 = v20;
    v59 = (uint8_t *)swift_slowAlloc(12, -1);
    v60 = swift_slowAlloc(32, -1);
    v108[0] = v60;
    *(_DWORD *)v59 = 136446210;
    v61 = v103[1];
    if (v61)
    {
      v62 = v60;
      v63 = *v103;
      swift_bridgeObjectRetain(v103[1]);
      v109 = sub_1000096B8(v63, v61, v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, v110, v59 + 4, v59 + 12);

      swift_bridgeObjectRelease(v61);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "Failed reading from URL: %{public}s and retired path.", v59, 0xCu);
      swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v59, -1, -1);

      (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v91);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v97, v107);
      v20 = v101;
      v21 = v90;
      v24 = v106;
LABEL_42:
      v26 = v88;
      v41 = v87;
      v50 = v98;
      v46 = v96;
LABEL_43:
      swift_bridgeObjectRelease(v46[1]);
      swift_bridgeObjectRelease(*(_QWORD *)&v24[v104]);
      swift_bridgeObjectRelease(*(_QWORD *)&v24[v50]);
      sub_1000028C0(v26);
      swift_bridgeObjectRelease(v41[1]);
      (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v21 + 56))(v39, 1, 1, v20);
      return;
    }
LABEL_45:

    __break(1u);
    return;
  }
  v24 = v106;
  (*(void (**)(_BYTE *, char *, uint64_t))(v11 + 16))(&v106[v20[5]], v97, v107);
LABEL_17:
  v67 = &v99[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  swift_beginAccess(&v99[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach], v108, 0, 0);
  v68 = *(_QWORD *)v67;
  v69 = *(_QWORD *)(*(_QWORD *)v67 + 16);
  v101 = v20;
  if (!v69)
    goto LABEL_40;
  v95 = (char *)swift_bridgeObjectRetain(v68);
  v70 = v95 + 40;
  v71 = &_swiftEmptyArrayStorage;
  do
  {
    v73 = *(v70 - 1);
    v72 = *v70;
    swift_bridgeObjectRetain(*v70);
    v74 = objc_msgSend(v33, "defaultManager");
    v75 = String._bridgeToObjectiveC()();
    v76 = objc_msgSend(v74, "fileExistsAtPath:", v75);

    if ((v76 & 1) != 0)
    {
      URL.init(fileURLWithPath:)(v73, v72);
      swift_bridgeObjectRelease(v72);
      if ((swift_isUniquelyReferenced_nonNull_native(v71) & 1) == 0)
        v71 = (_QWORD *)sub_10000C0DC(0, v71[2] + 1, 1, (unint64_t)v71);
      v24 = v106;
      v78 = v71[2];
      v77 = v71[3];
      if (v78 >= v77 >> 1)
        v71 = (_QWORD *)sub_10000C0DC(v77 > 1, v78 + 1, 1, (unint64_t)v71);
      v71[2] = v78 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))((unint64_t)v71+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v78, v105, v107);
      goto LABEL_20;
    }
    v79 = v103[1];
    if (v79)
    {
      if (v73 == *v103 && v79 == v72)
      {
        swift_bridgeObjectRelease(v72);
LABEL_33:
        v24 = v106;
        (*(void (**)(char *, _BYTE *, uint64_t))(v11 + 16))(v102, &v106[v101[5]], v107);
        if ((swift_isUniquelyReferenced_nonNull_native(v71) & 1) == 0)
          v71 = (_QWORD *)sub_10000C0DC(0, v71[2] + 1, 1, (unint64_t)v71);
        v82 = v71[2];
        v81 = v71[3];
        if (v82 >= v81 >> 1)
          v71 = (_QWORD *)sub_10000C0DC(v81 > 1, v82 + 1, 1, (unint64_t)v71);
        v71[2] = v82 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))((unint64_t)v71+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v82, v102, v107);
LABEL_20:
        *(_QWORD *)&v24[v104] = v71;
        goto LABEL_21;
      }
      v80 = _stringCompareWithSmolCheck(_:_:expecting:)(v73, v72, *v103, v79, 0);
      swift_bridgeObjectRelease(v72);
      if ((v80 & 1) != 0)
        goto LABEL_33;
      v24 = v106;
    }
    else
    {
      swift_bridgeObjectRelease(v72);
      v24 = v106;
    }
LABEL_21:
    v70 += 2;
    --v69;
  }
  while (v69);
  swift_bridgeObjectRelease(v95);
  v20 = v101;
LABEL_40:
  v83 = sub_10000A460((uint64_t)&v24[v20[5]], sub_10000D3B8);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v97, v107);
  v84 = v98;
  swift_bridgeObjectRelease(*(_QWORD *)&v24[v98]);
  *(_QWORD *)&v24[v84] = v83;
  v85 = v100;
  sub_10000C2E4((uint64_t)v24, v100);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v90 + 56))(v85, 0, 1, v20);
  sub_10000C328((uint64_t)v24);
}

BOOL sub_10000B808(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_10000B820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  _BYTE v10[32];
  _BYTE v11[80];

  v1 = sub_1000033D8(&qword_100019E38);
  inited = swift_initStackObject(v1, v11);
  *(_OWORD *)(inited + 16) = xmmword_100010C50;
  *(_QWORD *)(inited + 32) = 0x746E656469636E69;
  *(_QWORD *)(inited + 40) = 0xEB0000000064695FLL;
  v3 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for PanicLog(0) + 32));
  if (*(_QWORD *)(v3 + 16)
    && (v4 = sub_10000506C(0x746E656469636E69, 0xEB0000000064695FLL), (v5 & 1) != 0)
    && (sub_1000053AC(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)v10),
        v6 = sub_1000074F4(),
        swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, v6, 6)))
  {
    v7 = v9;
  }
  else
  {
    sub_1000074F4();
    v7 = NSString.init(stringLiteral:)("<unknown>", 9, 2);
  }
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = 1701869940;
  *(_QWORD *)(inited + 64) = 0xE400000000000000;
  *(_QWORD *)(inited + 72) = String._bridgeToObjectiveC()();
  return sub_100004598(inited);
}

uint64_t sub_10000B964()
{
  _BYTE *v0;

  if (*v0)
    return 0x79616C70736944;
  else
    return 1953722184;
}

uint64_t type metadata accessor for PanicLog(uint64_t a1)
{
  uint64_t result;

  result = qword_10001A168;
  if (!qword_10001A168)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PanicLog);
  return result;
}

uint64_t sub_10000B9DC(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t result;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  unint64_t v55;
  _QWORD v57[4];

  v57[3] = a4;
  if (a1 < 0)
    goto LABEL_44;
  v10 = swift_allocObject(&unk_100014C58, 24, 7);
  *(_QWORD *)(v10 + 16) = &_swiftEmptyArrayStorage;
  v54 = swift_allocObject(&unk_100014C80, 24, 7);
  *(_QWORD *)(v54 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v33 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v33 = 11;
    sub_10000BE78(v33 | (v11 << 16), v54, a2 & 1, v10);
    swift_bridgeObjectRelease(a6);
    v14 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain(v14);
    swift_release(v10);
    v34 = v54;
LABEL_41:
    swift_release(v34);
    return (uint64_t)v14;
  }
  v49 = a1;
  v50 = v10;
  v13 = 7;
  if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
    v13 = 11;
  v48 = v13 | (v12 << 16);
  v55 = 4 * v12;
  v14 = (char *)&_swiftEmptyArrayStorage;
  v15 = 15;
  v16 = 15;
  v17 = 15;
  while (1)
  {
    v18 = String.subscript.getter(v15, a5, a6);
    v20 = v19;
    v57[0] = v18;
    v57[1] = v19;
    v21 = a3(v57);
    if (v6)
    {
      swift_release(v50);
      swift_release(v54);
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(a6);
      return (uint64_t)v14;
    }
    v22 = v21;
    swift_bridgeObjectRelease(v20);
    if ((v22 & 1) != 0)
      break;
    v15 = String.index(after:)(v15, a5, a6);
LABEL_11:
    if (v55 == v15 >> 14)
      goto LABEL_31;
  }
  if (v16 >> 14 == v15 >> 14 && (a2 & 1) != 0)
  {
    v15 = String.index(after:)(v15, a5, a6);
    *(_QWORD *)(v54 + 16) = v15;
    v16 = v15;
    v17 = v15;
    goto LABEL_11;
  }
  if (v15 >> 14 < v16 >> 14)
    goto LABEL_43;
  v23 = String.subscript.getter(v16, v15, a5, a6);
  v51 = v24;
  v52 = v23;
  v26 = v25;
  v28 = v27;
  if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
    v14 = sub_10000BFD0(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
  v30 = *((_QWORD *)v14 + 2);
  v29 = *((_QWORD *)v14 + 3);
  if (v30 >= v29 >> 1)
    v14 = sub_10000BFD0((char *)(v29 > 1), v30 + 1, 1, v14);
  *((_QWORD *)v14 + 2) = v30 + 1;
  v31 = &v14[32 * v30];
  *((_QWORD *)v31 + 4) = v52;
  *((_QWORD *)v31 + 5) = v26;
  *((_QWORD *)v31 + 6) = v28;
  *((_QWORD *)v31 + 7) = v51;
  *(_QWORD *)(v50 + 16) = v14;
  v32 = String.index(after:)(v15, a5, a6);
  v15 = v32;
  *(_QWORD *)(v54 + 16) = v32;
  if (*((_QWORD *)v14 + 2) != v49)
  {
    v16 = v32;
    v17 = v32;
    goto LABEL_11;
  }
  v17 = v32;
  v16 = v32;
LABEL_31:
  if (v55 == v16 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease(a6);
    v35 = v50;
LABEL_40:
    swift_bridgeObjectRetain(v14);
    swift_release(v35);
    v34 = v54;
    goto LABEL_41;
  }
  if (v55 >= v17 >> 14)
  {
    v36 = String.subscript.getter(v17, v48, a5, a6);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    swift_bridgeObjectRelease(a6);
    if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
      v14 = sub_10000BFD0(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
    v44 = *((_QWORD *)v14 + 2);
    v43 = *((_QWORD *)v14 + 3);
    if (v44 >= v43 >> 1)
      v14 = sub_10000BFD0((char *)(v43 > 1), v44 + 1, 1, v14);
    *((_QWORD *)v14 + 2) = v44 + 1;
    v45 = &v14[32 * v44];
    *((_QWORD *)v45 + 4) = v36;
    *((_QWORD *)v45 + 5) = v38;
    *((_QWORD *)v45 + 6) = v40;
    *((_QWORD *)v45 + 7) = v42;
    v35 = v50;
    *(_QWORD *)(v50 + 16) = v14;
    goto LABEL_40;
  }
LABEL_43:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Range requires lowerBound <= upperBound", 39, 2, "Swift/Range.swift", 17, 2, 754, 0);
  __break(1u);
LABEL_44:
  LOBYTE(v47) = 2;
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Must take zero or more splits", 29, 2, "Swift/Collection.swift", 22, v47, 1552, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000BE78(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = String.subscript.getter();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(char **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_10000BFD0(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = *((_QWORD *)v14 + 2);
    v16 = *((_QWORD *)v14 + 3);
    if (v17 >= v16 >> 1)
    {
      v14 = sub_10000BFD0((char *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    *((_QWORD *)v14 + 2) = v17 + 1;
    v18 = &v14[32 * v17];
    *((_QWORD *)v18 + 4) = v7;
    *((_QWORD *)v18 + 5) = v9;
    *((_QWORD *)v18 + 6) = v11;
    *((_QWORD *)v18 + 7) = v13;
    return v5 ^ 1u;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Range requires lowerBound <= upperBound", 39, 2, "Swift/Range.swift", 17, 2, 754, 0);
  __break(1u);
  return result;
}

char *sub_10000BFD0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000033D8(&qword_10001A108);
      v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32])
          memmove(v14, a4 + 32, 32 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000CF5C(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C0DC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000033D8(&qword_100019E98);
  v11 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for URL(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000D2A0(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_10000C2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PanicLog(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C328(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PanicLog(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C364@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!__src)
    goto LABEL_7;
  if (!a2)
  {
    __src = 0;
LABEL_7:
    v8 = 0xC000000000000000;
    goto LABEL_10;
  }
  v5 = __src;
  if (a2 <= 14)
  {
    __src = sub_10000D04C((_BYTE *)__src, (_BYTE *)(__src + a2));
    v8 = v9 & 0xFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = type metadata accessor for __DataStorage(0);
    swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
    v7 = __DataStorage.init(bytes:length:)(v5, a2);
    if ((unint64_t)a2 >= 0x7FFFFFFF)
    {
      v10 = type metadata accessor for Data.RangeReference(0);
      __src = swift_allocObject(v10, 32, 7);
      *(_QWORD *)(__src + 16) = 0;
      *(_QWORD *)(__src + 24) = a2;
      v8 = v7 | 0x8000000000000000;
    }
    else
    {
      __src = a2 << 32;
      v8 = v7 | 0x4000000000000000;
    }
  }
LABEL_10:
  *a3 = __src;
  a3[1] = v8;
  return __src;
}

void sub_10000C42C()
{
  __asm { BR              X11 }
}

_QWORD *sub_10000C490@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(__int128 *__return_ptr, uint64_t *, char *);
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unsigned int v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;

  v17 = v5;
  LOWORD(v18) = a1;
  BYTE2(v18) = BYTE2(a1);
  HIBYTE(v18) = BYTE3(a1);
  v19 = BYTE4(a1);
  v20 = BYTE5(a1);
  v21 = BYTE6(a1);
  result = v3(&v13, &v17, (char *)&v17 + BYTE6(a1));
  if (v2)
  {
    v7 = v18 | ((unint64_t)v19 << 32) | ((unint64_t)v20 << 40) | ((unint64_t)v21 << 48);
    *v1 = v17;
    v1[1] = v7;
  }
  else
  {
    v8 = v13;
    v9 = v14;
    v10 = v15;
    v11 = v16;
    v12 = v18 | ((unint64_t)v19 << 32) | ((unint64_t)v20 << 40) | ((unint64_t)v21 << 48);
    *v1 = v17;
    v1[1] = v12;
    *(_OWORD *)v4 = v8;
    *(_QWORD *)(v4 + 16) = v9;
    *(_QWORD *)(v4 + 24) = v10;
    *(_OWORD *)(v4 + 32) = v11;
  }
  return result;
}

_BYTE *sub_10000C748@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_10000D04C(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_10000D1A8((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_10000D220((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

double sub_10000C7BC@<D0>(void (*a1)(__int128 *__return_ptr, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  double result;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  if (a2)
  {
    a1(&v10, a2, a3 - a2);
    if (v4)
      return result;
LABEL_5:
    v7 = v11;
    v8 = v12;
    result = *(double *)&v10;
    v9 = v13;
    *(_OWORD *)a4 = v10;
    *(_QWORD *)(a4 + 16) = v7;
    *(_QWORD *)(a4 + 24) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    return result;
  }
  a1(&v10, 0, 0);
  if (!v4)
    goto LABEL_5;
  return result;
}

char *sub_10000C834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *(*a3)(__int128 *__return_ptr, char *, char *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  char *result;
  char *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v10 = result;
  result = (char *)__DataStorage._offset.getter();
  v11 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  result = (char *)a3(&v19, &v10[v11], &v10[v11 + v15]);
  if (!v4)
  {
    v16 = v20;
    v17 = v21;
    v18 = v22;
    *(_OWORD *)a4 = v19;
    *(_QWORD *)(a4 + 16) = v16;
    *(_QWORD *)(a4 + 24) = v17;
    *(_OWORD *)(a4 + 32) = v18;
  }
  return result;
}

unint64_t sub_10000C8F8(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_100009BAC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_100009BAC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t sub_10000C9E4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[2];

  if (!a2)
  {
    v13 = 0;
    v15 = a4;
LABEL_34:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_QWORD *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = a7;
    *(_QWORD *)(result + 32) = v15;
    return v13;
  }
  if (!a3)
  {
    v15 = a4;
    v13 = 0;
    goto LABEL_34;
  }
  v10 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v10) = 1;
  v11 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v11 = a6 & 0xFFFFFFFFFFFFLL;
  v27 = v11;
  if (a3 < 0)
    goto LABEL_37;
  v23 = result;
  v24 = a5;
  v13 = 0;
  v14 = a5 >> 14;
  v15 = a4;
  v16 = 4 << v10;
  v17 = a4 >> 14;
  v25 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v26 = a7 & 0xFFFFFFFFFFFFFFLL;
  v22 = a4;
  v28 = a4 >> 14;
  while (1)
  {
    v18 = v15 >> 14;
    if (v15 >> 14 == v14)
      goto LABEL_33;
    v19 = v15 & 0xC;
    v20 = v15;
    if (v19 == v16)
      break;
    if (v18 < v17)
      goto LABEL_35;
LABEL_14:
    if (v18 >= v14)
      goto LABEL_35;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)(v20, a6, a7);
      v17 = v28;
      v21 = result;
      if (v19 != v16)
        goto LABEL_22;
    }
    else if ((a7 & 0x2000000000000000) != 0)
    {
      v29[0] = a6;
      v29[1] = v26;
      v21 = *((_BYTE *)v29 + (v20 >> 16));
      if (v19 != v16)
        goto LABEL_22;
    }
    else
    {
      result = v25;
      if ((a6 & 0x1000000000000000) == 0)
      {
        result = _StringObject.sharedUTF8.getter(a6, a7);
        v17 = v28;
      }
      v21 = *(_BYTE *)(result + (v20 >> 16));
      if (v19 != v16)
      {
LABEL_22:
        if ((a7 & 0x1000000000000000) != 0)
          goto LABEL_23;
        goto LABEL_9;
      }
    }
    result = sub_100009BAC(v15, a6, a7);
    v17 = v28;
    v15 = result;
    if ((a7 & 0x1000000000000000) != 0)
    {
LABEL_23:
      if (v27 <= v15 >> 16)
        goto LABEL_36;
      result = String.UTF8View._foreignIndex(after:)(v15, a6, a7);
      v17 = v28;
      v15 = result;
      goto LABEL_10;
    }
LABEL_9:
    v15 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_10:
    *(_BYTE *)(a2 + v13++) = v21;
    if (a3 == v13)
    {
      v13 = a3;
LABEL_33:
      result = v23;
      a5 = v24;
      a4 = v22;
      goto LABEL_34;
    }
  }
  result = sub_100009BAC(v15, a6, a7);
  v17 = v28;
  v20 = result;
  v18 = result >> 14;
  if (result >> 14 >= v28)
    goto LABEL_14;
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000CC10@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  unint64_t v9;
  _QWORD *v10;
  _QWORD v11[2];

  if ((a4 & 0x1000000000000000) != 0)
  {
    *(_OWORD *)a5 = xmmword_100010C70;
  }
  else
  {
    v9 = result;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v11[0] = a3;
      v11[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      v10 = v11;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      v10 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      v10 = (_QWORD *)_StringObject.sharedUTF8.getter(a3, a4);
    }
    return sub_10000CCC8((uint64_t)v10, v9, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_10000CCC8@<X0>(uint64_t result@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, unint64_t a5@<X5>, _QWORD *a6@<X8>)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a2;
  v10 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  v15 = a2;
  if (v14 == 4 << v12)
  {
    result = sub_100009BAC(a2, a4, a5);
    v15 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v16 = v15 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v17 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v17 = HIBYTE(a5) & 0xF;
  if (v17 < v15 >> 16)
    goto LABEL_31;
  result = String.UTF8View._foreignDistance(from:to:)(15, v15, a4, a5);
  v16 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_100009BAC(v9, a4, a5);
    v9 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_100009BAC(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v9 >> 16);
    goto LABEL_21;
  }
  v18 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v18 = a4 & 0xFFFFFFFFFFFFLL;
  if (v18 < v9 >> 16)
    goto LABEL_29;
  if (v18 < a3 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  result = String.UTF8View._foreignDistance(from:to:)(v9, a3, a4, a5);
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  v19 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10)
    v20 = v10 + v16;
  else
    v20 = 0;
  return sub_10000C364(v20, v19, a6);
}

double sub_10000CE78@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *((_QWORD *)a3 + 2);
  v6 = *((_QWORD *)a3 + 3);
  v15 = *a3;
  v16 = v5;
  v17 = v6;
  sub_10000C7BC((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))sub_10000D3FC, a1, a2, (uint64_t)&v11);
  v7 = v12;
  v8 = v13;
  result = *(double *)&v11;
  v10 = v14;
  *(_OWORD *)a4 = v11;
  *(_QWORD *)(a4 + 16) = v7;
  *(_QWORD *)(a4 + 24) = v8;
  *(_OWORD *)(a4 + 32) = v10;
  return result;
}

uint64_t sub_10000CEF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v10[2];
  uint64_t v11;

  v5 = a3[3];
  v6 = sub_10000C9E4((unint64_t)v10, a1, a2, *a3, a3[1], a3[2], v5);
  v7 = v11;
  v8 = v10[1];
  *(_OWORD *)a4 = v10[0];
  *(_OWORD *)(a4 + 16) = v8;
  *(_QWORD *)(a4 + 32) = v7;
  *(_QWORD *)(a4 + 40) = v6;
  return swift_bridgeObjectRetain(v5);
}

uint64_t sub_10000CF5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000D04C(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;

  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_10000D10C(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      v2 = type metadata accessor for __DataStorage(0);
      swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
      __DataStorage.init(length:)(v1);
      if (v1 >= 0x7FFFFFFF)
      {
        v3 = type metadata accessor for Data.RangeReference(0);
        result = swift_allocObject(v3, 32, 7);
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_10000D1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (a1)
    v3 = a2 - a1;
  else
    v3 = 0;
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = type metadata accessor for Data.RangeReference(0);
    result = swift_allocObject(v6, 32, 7);
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v3;
  }
  return result;
}

uint64_t sub_10000D220(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  if (a1)
    v3 = a2 - a1;
  else
    v3 = 0;
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v3 & 0x80000000) == 0)
    return v3 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_10000D2A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000D3B8(_QWORD *a1)
{
  return sub_10000D44C(a1) & 1;
}

double sub_10000D3D0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_10000CE78(a1, a2, *(__int128 **)(v3 + 16), a3);
}

uint64_t sub_10000D3E8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1000052D8(result, a2);
  return result;
}

uint64_t sub_10000D3FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_10000CEF0(a1, a2, *(unint64_t **)(v3 + 16), a3);
}

uint64_t sub_10000D418()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D43C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D44C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
}

uint64_t sub_10000D4A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D4AC);
}

uint64_t sub_10000D4AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10000D530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000D53C);
}

uint64_t sub_10000D53C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_10000D5BC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = &unk_100010CB0;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_100010CC8;
    v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[5] = &unk_100010CE0;
    v4[6] = &unk_100010CF8;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PanicLog.Type(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PanicLog.Type(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000D738 + 4 * byte_100010C85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000D76C + 4 * byte_100010C80[v4]))();
}

uint64_t sub_10000D76C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D774(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000D77CLL);
  return result;
}

uint64_t sub_10000D788(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000D790);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000D794(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D79C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000D7A8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PanicLog.Type()
{
  return &type metadata for PanicLog.Type;
}

unint64_t sub_10000D7C8()
{
  unint64_t result;

  result = qword_10001A1B8;
  if (!qword_10001A1B8)
  {
    result = swift_getWitnessTable(&unk_100010D68, &type metadata for PanicLog.Type);
    atomic_store(result, (unint64_t *)&qword_10001A1B8);
  }
  return result;
}

id DiagnosticsReporterLaunchOptions.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

uint64_t DiagnosticsReporterLaunchOptions.files_to_attach.getter()
{
  uint64_t v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess(v0 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach, v3, 0, 0);
  return swift_bridgeObjectRetain(*v1);
}

uint64_t DiagnosticsReporterLaunchOptions.files_to_attach.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_bridgeObjectRelease(v4);
}

void *DiagnosticsReporterLaunchOptions.files_to_attach.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t DiagnosticsReporterLaunchOptions.log_path.getter()
{
  return sub_10000DAD4(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t DiagnosticsReporterLaunchOptions.log_path.setter(uint64_t a1, uint64_t a2)
{
  return sub_10000DBB4(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

void *DiagnosticsReporterLaunchOptions.log_path.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000DA54(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  _BYTE v7[24];

  v3 = a1 + *a3;
  swift_beginAccess(v3, v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 8);
  if (!v4)
    return 0;
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

uint64_t DiagnosticsReporterLaunchOptions.panic_string.getter()
{
  return sub_10000DAD4(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_10000DAD4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _BYTE v5[24];

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess(v2, v5, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_10000DB30(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v12[24];

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess(v9, v12, 1, 0);
  v10 = v9[1];
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease(v10);
}

uint64_t DiagnosticsReporterLaunchOptions.panic_string.setter(uint64_t a1, uint64_t a2)
{
  return sub_10000DBB4(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_10000DBB4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  _BYTE v9[24];

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = v6[1];
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease(v7);
}

void *DiagnosticsReporterLaunchOptions.panic_string.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string, a1, 33, 0);
  return &j__swift_endAccess;
}

id DiagnosticsReporterLaunchOptions.init()()
{
  char *v0;
  char *v1;
  char *v2;
  objc_class *v3;
  objc_super v5;

  *(_QWORD *)&v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = &_swiftEmptyArrayStorage;
  v1 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  v3 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v5.receiver = v0;
  v5.super_class = v3;
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t type metadata accessor for DiagnosticsReporterLaunchOptions()
{
  return objc_opt_self(ObjCDiagnosticsReporterLaunchOptions);
}

uint64_t sub_10000DD50(char a1)
{
  return qword_100010F48[a1];
}

uint64_t sub_10000DD70()
{
  char *v0;

  return sub_10000DD50(*v0);
}

uint64_t sub_10000DD78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000E7A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000DD9C()
{
  return 0;
}

void sub_10000DDA8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10000DDB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E0B8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DDDC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E0B8();
  return CodingKey.debugDescription.getter(a1, v2);
}

id DiagnosticsReporterLaunchOptions.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporterLaunchOptions();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t DiagnosticsReporterLaunchOptions.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  _QWORD v24[3];
  _BYTE v25[24];

  v3 = v1;
  v5 = sub_1000033D8(&qword_10001A1D8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = a1[3];
  v10 = a1[4];
  sub_10000289C(a1, v9);
  v11 = sub_10000E0B8();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for DiagnosticsReporterLaunchOptions.CodingKeys, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys, v11, v9, v10);
  v12 = (_QWORD *)(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach, v25, 0, 0);
  v24[0] = *v12;
  v23[0] = 0;
  v13 = sub_1000033D8(&qword_10001A1E8);
  v14 = sub_10000E4A0(&qword_10001A1F0, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v24, v23, v5, v13, v14);
  if (v2)
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  v16 = (uint64_t *)(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
  swift_beginAccess(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path, v24, 0, 0);
  v17 = *v16;
  v18 = v16[1];
  v23[0] = 1;
  swift_bridgeObjectRetain(v18);
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v17, v18, v23, v5);
  swift_bridgeObjectRelease(v18);
  v19 = (uint64_t *)(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
  swift_beginAccess(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string, v23, 0, 0);
  v20 = *v19;
  v21 = v19[1];
  HIBYTE(v22) = 2;
  swift_bridgeObjectRetain(v21);
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v20, v21, (char *)&v22 + 7, v5);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  return swift_bridgeObjectRelease(v21);
}

unint64_t sub_10000E0B8()
{
  unint64_t result;

  result = qword_10001A1E0;
  if (!qword_10001A1E0)
  {
    result = swift_getWitnessTable(&unk_100010EF4, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A1E0);
  }
  return result;
}

uint64_t sub_10000E0FC(uint64_t *a1)
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

id DiagnosticsReporterLaunchOptions.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DiagnosticsReporterLaunchOptions.init(from:)(a1);
}

id DiagnosticsReporterLaunchOptions.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  objc_class *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  char *v45;
  uint64_t *v46;
  objc_super v47;
  _BYTE v48[24];
  _QWORD v49[3];
  _BYTE v50[24];
  char *v51;

  v42 = sub_1000033D8(&qword_10001A1F8);
  v4 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  v44 = a1;
  *(_QWORD *)&v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = &_swiftEmptyArrayStorage;
  v7 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v46 = (uint64_t *)v7;
  v8 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v51 = v8;
  v9 = (id)a1[3];
  v10 = a1[4];
  sub_10000289C(a1, (uint64_t)v9);
  v11 = sub_10000E0B8();
  v45 = v1;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for DiagnosticsReporterLaunchOptions.CodingKeys, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys, v11, v9, v10);
  if (v2)
  {
    v19 = v45;
    v20 = v51;
    v21 = v43;
    v22 = v46;
    sub_1000028C0(v44);
    swift_bridgeObjectRelease(*(_QWORD *)v21);
    swift_bridgeObjectRelease(v22[1]);
    v23 = *((_QWORD *)v20 + 1);

    swift_bridgeObjectRelease(v23);
    v24 = type metadata accessor for DiagnosticsReporterLaunchOptions();
    swift_deallocPartialClassInstance(v19, v24, 48, 7);
  }
  else
  {
    v12 = v4;
    v13 = sub_1000033D8(&qword_10001A1E8);
    v50[0] = 0;
    v14 = sub_10000E4A0(&qword_10001A200, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
    v15 = v13;
    v16 = v42;
    v17 = v13;
    v18 = v6;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v49, v15, v50, v42, v17, v14);
    v26 = v49[0];
    v27 = v43;
    swift_beginAccess(v43, v50, 1, 0);
    v28 = *(_QWORD *)v27;
    *(_QWORD *)v27 = v26;
    swift_bridgeObjectRelease(v28);
    LOBYTE(v49[0]) = 1;
    v29 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v49, v16);
    v31 = v30;
    v32 = v46;
    swift_beginAccess(v46, v49, 1, 0);
    v33 = v32[1];
    *v32 = v29;
    v32[1] = v31;
    swift_bridgeObjectRelease(v33);
    v48[0] = 2;
    v34 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v48, v16);
    v35 = (uint64_t *)v51;
    v36 = v34;
    v38 = v37;
    swift_beginAccess(v51, v48, 1, 0);
    v39 = v35[1];
    *v35 = v36;
    v35[1] = v38;
    v40 = v45;

    swift_bridgeObjectRelease(v39);
    v41 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
    v47.receiver = v40;
    v47.super_class = v41;
    v9 = objc_msgSendSuper2(&v47, "init");
    (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v16);
    sub_1000028C0(v44);
  }
  return v9;
}

uint64_t sub_10000E4A0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000E0FC(&qword_10001A1E8);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_10000E500@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id result;

  v5 = objc_allocWithZone((Class)type metadata accessor for DiagnosticsReporterLaunchOptions());
  result = DiagnosticsReporterLaunchOptions.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_10000E550(_QWORD *a1)
{
  return DiagnosticsReporterLaunchOptions.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000E64C + 4 * byte_100010D95[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000E680 + 4 * byte_100010D90[v4]))();
}

uint64_t sub_10000E680(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E688(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000E690);
  return result;
}

uint64_t sub_10000E69C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000E6A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000E6A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E6B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticsReporterLaunchOptions.CodingKeys()
{
  return &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys;
}

unint64_t sub_10000E6D0()
{
  unint64_t result;

  result = qword_10001A230;
  if (!qword_10001A230)
  {
    result = swift_getWitnessTable(&unk_100010ECC, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A230);
  }
  return result;
}

unint64_t sub_10000E718()
{
  unint64_t result;

  result = qword_10001A238;
  if (!qword_10001A238)
  {
    result = swift_getWitnessTable("M@", &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A238);
  }
  return result;
}

unint64_t sub_10000E760()
{
  unint64_t result;

  result = qword_10001A240;
  if (!qword_10001A240)
  {
    result = swift_getWitnessTable(&unk_100010E64, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A240);
  }
  return result;
}

uint64_t sub_10000E7A4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6F745F73656C6966 && a2 == 0xEF6863617474615FLL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6F745F73656C6966, 0xEF6863617474615FLL, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else if (a1 == 0x687461705F676F6CLL && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x687461705F676F6CLL, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1;
  }
  else if (a1 == 0x74735F63696E6170 && a2 == 0xEC000000676E6972)
  {
    swift_bridgeObjectRelease(0xEC000000676E6972);
    return 2;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x74735F63696E6170, 0xEC000000676E6972, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

ValueMetadata *type metadata accessor for CriticalPolicy()
{
  return &type metadata for CriticalPolicy;
}

uint64_t sub_10000E924()
{
  uint64_t v0;

  sub_1000028C0((_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for DetailsController()
{
  return objc_opt_self(_TtC19DiagnosticsReporter17DetailsController);
}

uint64_t sub_10000E968()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC19DiagnosticsReporterP33_921F314E59E785D862D98A18FA9B609819ResourceBundleClass);
}
