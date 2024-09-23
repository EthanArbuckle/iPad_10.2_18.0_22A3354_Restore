uint64_t sub_100002DC8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000076C4(v0, qword_100011DA8);
  sub_10000760C(v0, (uint64_t)qword_100011DA8);
  return Logger.init(subsystem:category:)(0xD000000000000019, 0x8000000100008C00, 0x6E6F632D77656976, 0xEF72656C6C6F7274);
}

uint64_t sub_100002E48()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 33, 7);
}

uint64_t sub_100002E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0
     + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_remoteEvaluationRequest;
  v2 = type metadata accessor for FBKSRemoteEvaluationRequest(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_evaluationController));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100002ED4(char a1)
{
  char *v1;
  char *v2;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;

  v2 = v1;
  v32.receiver = v2;
  v32.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  objc_msgSendSuper2(&v32, "viewWillAppear:", a1 & 1);
  v4 = objc_msgSend((id)objc_opt_self(NSProcessInfo), "processInfo");
  v5 = objc_msgSend(v4, "environment");

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for String, &type metadata for String, &protocol witness table for String);
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_100006534(0xD000000000000014, 0x8000000100008D10), (v8 & 1) == 0))
  {
    v19 = v6;
    return swift_bridgeObjectRelease(v19);
  }
  v9 = (uint64_t *)(*(_QWORD *)(v6 + 56) + 16 * v7);
  v11 = *v9;
  v10 = v9[1];
  swift_bridgeObjectRetain(v10);
  v12 = swift_bridgeObjectRelease(v6);
  if ((FBKSHasInternalDiagnostics(v12) & 1) == 0)
  {
    v19 = v10;
    return swift_bridgeObjectRelease(v19);
  }
  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v13 = type metadata accessor for Logger(0);
  sub_10000760C(v13, (uint64_t)qword_100011DA8);
  v14 = swift_bridgeObjectRetain_n(v10, 2);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(32, -1);
    v31 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain(v10);
    v30 = sub_100005EF4(v11, v10, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease_n(v10, 3);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Using form from scheme %s", v17, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v10, 2);
  }
  v21 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackForm(0));
  v22 = (void *)FBKFeedbackForm.init(identifier:)(v11, v10);
  objc_allocWithZone((Class)type metadata accessor for FBKFeedbackDraftViewController(0));
  v23 = v22;
  v24 = FBKFeedbackDraftViewController.init(feedbackForm:)();
  v26 = swift_unknownObjectRetain(v2, v25);
  dispatch thunk of FBKFeedbackDraftViewController.delegate.setter(v26);
  v27 = type metadata accessor for FeedbackRemoteViewController.FormRequestState();
  v28 = swift_allocObject(v27, 33, 7);
  *(_BYTE *)(v28 + 32) = 0;
  *(_QWORD *)(v28 + 16) = v23;
  *(_QWORD *)(v28 + 24) = v24;
  v29 = *(_QWORD *)&v2[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
  *(_QWORD *)&v2[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = v28;
  return sub_10000778C(v29);
}

void sub_100003218(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v2 = v1;
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  objc_msgSendSuper2(&v12, "viewDidAppear:", a1 & 1);
  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000760C(v4, (uint64_t)qword_100011DA8);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v11 = v9;
    *(_DWORD *)v8 = 136446210;
    v10 = sub_100005EF4(0xD000000000000011, 0x8000000100008CF0, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8 + 4, v8 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  sub_100003494();
}

void sub_100003494()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  int64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  int64_t v33;
  uint8_t *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint8_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;

  v1 = v0;
  v2 = type metadata accessor for FBKSEvaluation.Subject(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (uint64_t *)((char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for FBKSEvaluation.Action(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)&v0[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
  if ((~v10 & 0xF000000000000007) == 0)
  {
    if (qword_100011DA0 != -1)
      swift_once(&qword_100011DA0, sub_100002DC8);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_10000760C(v11, (uint64_t)qword_100011DA8);
    v53 = Logger.logObject.getter(v12);
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled((os_log_t)v53, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v53, v13, "Not configured yet. Will not present UI", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    return;
  }
  v53 = *(_QWORD *)&v0[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
  v15 = v10 & 0x7FFFFFFFFFFFFFFFLL;
  swift_retain(v10 & 0x7FFFFFFFFFFFFFFFLL);
  v16 = objc_msgSend(v0, "view");
  if (!v16)
  {
    __break(1u);
    return;
  }
  v17 = v16;
  v18 = objc_msgSend(v16, "window");

  if (v18)
  {
    v19 = qword_100011DA0;
    v20 = v53;
    if ((v53 & 0x8000000000000000) == 0)
    {
      v21 = *(_BYTE *)(v53 + 32);
      swift_retain(v15);
      if ((v21 & 1) == 0)
      {
        if (v19 != -1)
          swift_once(&qword_100011DA0, sub_100002DC8);
        v38 = type metadata accessor for Logger(0);
        v39 = sub_10000760C(v38, (uint64_t)qword_100011DA8);
        v40 = Logger.logObject.getter(v39);
        v41 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v42 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "Presenting Feedback UI", v42, 2u);
          swift_slowDealloc(v42, -1, -1);
        }

        *(_BYTE *)(v20 + 32) = 1;
        v43 = *(id *)(v20 + 24);
        objc_msgSend(v1, "presentViewController:animated:completion:", v43, 1, 0);
        sub_10000778C(v20);

        goto LABEL_32;
      }
      if (v19 != -1)
        swift_once(&qword_100011DA0, sub_100002DC8);
      v22 = type metadata accessor for Logger(0);
      v23 = sub_10000760C(v22, (uint64_t)qword_100011DA8);
      v24 = Logger.logObject.getter(v23);
      v25 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v24, v25))
      {
LABEL_26:

        sub_10000778C(v20);
LABEL_32:
        sub_10000778C(v20);
        return;
      }
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      v27 = "Feedback UI already presented.";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v24, v25, v27, v26, 2u);
      swift_slowDealloc(v26, -1, -1);
      goto LABEL_26;
    }
    v52 = OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_isPresented;
    v35 = *(_BYTE *)(v15
                   + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_isPresented);
    swift_retain(v15);
    if ((v35 & 1) != 0)
    {
      if (v19 != -1)
        swift_once(&qword_100011DA0, sub_100002DC8);
      v36 = type metadata accessor for Logger(0);
      v37 = sub_10000760C(v36, (uint64_t)qword_100011DA8);
      v24 = Logger.logObject.getter(v37);
      v25 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v24, v25))
        goto LABEL_26;
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      v27 = "Evaluation Feedback UI already presented.";
      goto LABEL_25;
    }
    if (v19 != -1)
      swift_once(&qword_100011DA0, sub_100002DC8);
    v44 = type metadata accessor for Logger(0);
    v45 = sub_10000760C(v44, (uint64_t)qword_100011DA8);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Starting evaluation", v48, 2u);
      v49 = v48;
      v20 = v53;
      swift_slowDealloc(v49, -1, -1);
    }

    *(_BYTE *)(v15 + v52) = 1;
    v50 = objc_retain(*(id *)(v15
                            + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_evaluationController));
    v51 = FBKSRemoteEvaluationRequest.action.getter();
    *v5 = FBKSRemoteEvaluationRequest.interaction.getter(v51);
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for FBKSEvaluation.Subject.interaction(_:), v2);
    dispatch thunk of FBKEvaluationController.userDidPerformAction(action:subject:showFeedbackForm:retryCount:)(v9, v5, 1, 0);

    sub_10000778C(v20);
    sub_10000778C(v20);
    (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    if (qword_100011DA0 != -1)
      swift_once(&qword_100011DA0, sub_100002DC8);
    v28 = type metadata accessor for Logger(0);
    v29 = sub_10000760C(v28, (uint64_t)qword_100011DA8);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.fault.getter();
    v32 = os_log_type_enabled(v30, v31);
    v33 = v53;
    if (v32)
    {
      v34 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "No window. Will not present UI", v34, 2u);
      swift_slowDealloc(v34, -1, -1);
    }

    sub_1000054F8();
    sub_10000778C(v33);
  }
}

uint64_t sub_100003AF4()
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
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100007704((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_100007624(&qword_100012058);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_10000774C((uint64_t)v7);
    return 0;
  }
}

void sub_100003BB4(void *a1, void (*a2)(void), uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint8_t *v27;
  char *v28;
  void (*v29)(void);
  void **v30;
  void **v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void *v50;
  id v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  NSObject *v59;
  os_log_type_t v60;
  _BOOL4 v61;
  uint64_t v62;
  void **v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  void (*v70)(void);
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint64_t v75;
  uint8_t *v76;
  uint8_t *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  void **v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t);
  char *v88;
  uint64_t v89;
  void (*v90)(char *, char *, uint64_t);
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  void (**v97)(void);
  uint64_t v98;
  void *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  id v111;
  void (*v112)(void);
  id v113;
  unint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  unsigned __int8 v128;
  char v129[24];
  uint64_t v130;
  unint64_t v131;
  void **aBlock;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  __int128 v138;
  __int128 v139;

  v4 = v3;
  v126 = a3;
  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v110 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v118 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v117 = (char *)&v110 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for FBKSRemoteAlertRequest(0);
  v116 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v115 = (char *)&v110 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v110 - v17;
  v114 = v19;
  __chkstk_darwin(v16);
  v123 = (char *)&v110 - v20;
  v21 = (void *)sub_100003AF4();
  if (v21)
  {
    v22 = v21;
    objc_msgSend(v21, "setAllowsAlertStacking:", 1);
    swift_unknownObjectRelease(v22);
  }
  v124 = v13;
  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v23 = type metadata accessor for Logger(0);
  v127 = sub_10000760C(v23, (uint64_t)qword_100011DA8);
  v24 = Logger.logObject.getter(v127);
  v25 = static os_log_type_t.default.getter();
  v26 = os_log_type_enabled(v24, v25);
  v122 = v7;
  v121 = v8;
  v120 = v10;
  v119 = v11;
  v125 = v18;
  if (v26)
  {
    v27 = (uint8_t *)swift_slowAlloc(12, -1);
    v28 = v4;
    v29 = a2;
    v30 = (void **)swift_slowAlloc(32, -1);
    aBlock = v30;
    *(_DWORD *)v27 = 136446210;
    *(_QWORD *)&v138 = sub_100005EF4(0xD00000000000001BLL, 0x8000000100008C50, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, (char *)&v138 + 8, v27 + 4, v27 + 12);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "%{public}s", v27, 0xCu);
    swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
    v31 = v30;
    a2 = v29;
    v4 = v28;
    swift_slowDealloc(v31, -1, -1);
    swift_slowDealloc(v27, -1, -1);
  }

  if (!a1)
    __break(1u);
  v32 = objc_msgSend(a1, "userInfo");
  if (!v32)
  {
    v138 = 0u;
    v139 = 0u;
LABEL_30:
    v37 = sub_10000774C((uint64_t)&v138);
    goto LABEL_31;
  }
  v33 = v32;
  v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v32, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v130 = 0x74736575716572;
  v131 = 0xE700000000000000;
  AnyHashable.init<A>(_:)(&aBlock, &v130, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v34 + 16) && (v35 = sub_100006598((uint64_t)&aBlock), (v36 & 1) != 0))
  {
    sub_100007684(*(_QWORD *)(v34 + 56) + 32 * v35, (uint64_t)&v138);
  }
  else
  {
    v138 = 0u;
    v139 = 0u;
  }
  sub_1000077E4((uint64_t)&aBlock);
  swift_bridgeObjectRelease(v34);
  if (!*((_QWORD *)&v139 + 1))
    goto LABEL_30;
  v37 = swift_dynamicCast(&aBlock, &v138, (char *)&type metadata for Any + 8, &type metadata for Data, 6);
  if ((v37 & 1) == 0)
  {
LABEL_31:
    v80 = Logger.logObject.getter(v37);
    v81 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc(12, -1);
      v83 = (void **)swift_slowAlloc(32, -1);
      aBlock = v83;
      *(_DWORD *)v82 = 136315138;
      *(_QWORD *)&v138 = sub_100005EF4(0xD00000000000001BLL, 0x8000000100008C50, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, (char *)&v138 + 8, v82 + 4, v82 + 12);
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "%s Failed to get request data.", v82, 0xCu);
      swift_arrayDestroy(v83, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v83, -1, -1);
      swift_slowDealloc(v82, -1, -1);
    }

    if (a2)
    {
      a2();
      sub_1000054F8();
      return;
    }
    __break(1u);
    goto LABEL_39;
  }
  v38 = (uint64_t)aBlock;
  v39 = v133;
  v113 = objc_msgSend(objc_allocWithZone((Class)NSXPCListenerEndpoint), "init");
  v40 = objc_msgSend(a1, "xpcEndpoint");
  if (!v40)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v41 = v40;
  v112 = a2;
  v42 = v113;
  objc_msgSend(v113, "_setEndpoint:", v40);
  swift_unknownObjectRelease(v41);
  v43 = objc_msgSend(objc_allocWithZone((Class)NSXPCConnection), "initWithListenerEndpoint:", v42);
  v44 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP15FeedbackService33RemoteViewControllerReplyProtocol_);
  objc_msgSend(v43, "setRemoteObjectInterface:", v44);

  v136 = sub_1000049D8;
  v137 = 0;
  aBlock = _NSConcreteStackBlock;
  v133 = 1107296256;
  v134 = sub_1000049E4;
  v135 = &unk_10000C6D8;
  v45 = _Block_copy(&aBlock);
  objc_msgSend(v43, "setInvalidationHandler:", v45);
  _Block_release(v45);
  v136 = sub_100004A10;
  v137 = 0;
  aBlock = _NSConcreteStackBlock;
  v133 = 1107296256;
  v134 = sub_1000049E4;
  v135 = &unk_10000C700;
  v46 = _Block_copy(&aBlock);
  objc_msgSend(v43, "setInterruptionHandler:", v46);
  _Block_release(v46);
  v47 = Logger.logObject.getter(objc_msgSend(v43, "resume"));
  v48 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Anonymous xpc connection created", v49, 2u);
    swift_slowDealloc(v49, -1, -1);
  }

  v136 = sub_100004A1C;
  v137 = 0;
  aBlock = _NSConcreteStackBlock;
  v133 = 1107296256;
  v134 = sub_100004BF8;
  v135 = &unk_10000C728;
  v50 = _Block_copy(&aBlock);
  v111 = v43;
  v51 = objc_msgSend(v43, "remoteObjectProxyWithErrorHandler:", v50);
  _Block_release(v50);
  _bridgeAnyObjectToAny(_:)(&v138);
  swift_unknownObjectRelease(v51);
  sub_100007684((uint64_t)&v138, (uint64_t)&aBlock);
  v52 = sub_100007624(&qword_100012060);
  v53 = swift_dynamicCast(&v130, &aBlock, (char *)&type metadata for Any + 8, v52, 6);
  v54 = v130;
  if (!v53)
    v54 = 0;
  v55 = OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd;
  v56 = *(_QWORD *)&v4[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd];
  *(_QWORD *)&v4[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = v54;
  swift_unknownObjectRelease(v56);
  v128 = 0;
  v57 = SBSGetScreenLockStatus(&v128);
  v58 = v57;
  v59 = Logger.logObject.getter(v57);
  v60 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v59, v60))
  {
    v110 = v55;
    v61 = v58 != 0;
    v62 = swift_slowAlloc(18, -1);
    v63 = (void **)swift_slowAlloc(32, -1);
    aBlock = v63;
    *(_DWORD *)v62 = 67240450;
    LODWORD(v130) = v61;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v130, (char *)&v130 + 4, v62 + 4, v62 + 8);
    *(_WORD *)(v62 + 8) = 2082;
    swift_beginAccess(&v128, v129, 0, 0);
    v64 = DarwinBoolean.description.getter(v128);
    v65 = v38;
    v66 = v39;
    v68 = v67;
    v130 = sub_100005EF4(v64, v67, (uint64_t *)&aBlock);
    v55 = v110;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v130, &v131, v62 + 10, v62 + 18);
    v69 = v68;
    v39 = v66;
    v38 = v65;
    swift_bridgeObjectRelease(v69);
    _os_log_impl((void *)&_mh_execute_header, v59, v60, "Is device locked? [%{BOOL,public}d] passcodeRequired [%{public}s]", (uint8_t *)v62, 0x12u);
    swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v63, -1, -1);
    swift_slowDealloc(v62, -1, -1);
  }

  v70 = v112;
  v71 = (uint64_t)v125;
  v72 = swift_beginAccess(&v128, &v130, 0, 0);
  if (!v128)
  {
    v84 = sub_100007A28(&qword_100012068, 255, (uint64_t (*)(uint64_t))&type metadata accessor for FBKSRemoteAlertRequest, (uint64_t)&protocol conformance descriptor for FBKSRemoteAlertRequest);
    v85 = v124;
    static JSONCodable.decode(from:)(v38, v39, v124, v84);
    v86 = v116;
    v87 = *(void (**)(char *, uint64_t, uint64_t))(v116 + 32);
    v88 = v123;
    v87(v123, v71, v85);
    sub_100007874();
    v127 = static OS_dispatch_queue.main.getter();
    v89 = v86;
    v90 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
    v91 = v115;
    v90(v115, v88, v85);
    v92 = *(unsigned __int8 *)(v89 + 80);
    v93 = v89;
    v94 = (v92 + 16) & ~v92;
    v125 = (char *)v38;
    v95 = (v114 + v94 + 7) & 0xFFFFFFFFFFFFFFF8;
    v114 = v39;
    v96 = swift_allocObject(&unk_10000C788, ((v95 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v92 | 7);
    v87((char *)(v96 + v94), (uint64_t)v91, v85);
    *(_QWORD *)(v96 + v95) = v4;
    v97 = (void (**)(void))(v96 + ((v95 + 15) & 0xFFFFFFFFFFFFFFF8));
    v98 = v126;
    *v97 = v70;
    v97[1] = (void (*)(void))v98;
    v136 = sub_100007938;
    v137 = v96;
    aBlock = _NSConcreteStackBlock;
    v133 = 1107296256;
    v134 = sub_1000049E4;
    v135 = &unk_10000C7A0;
    v99 = _Block_copy(&aBlock);
    v100 = v137;
    v101 = v4;
    sub_100007988((uint64_t)v70, v98);
    v102 = swift_release(v100);
    v103 = v117;
    static DispatchQoS.unspecified.getter(v102);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v104 = sub_100007A28(&qword_100012078, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v105 = sub_100007624(&qword_100012080);
    v106 = sub_100007998();
    v107 = v120;
    v108 = v122;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v105, v106, v122, v104);
    v109 = (void *)v127;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v103, v107, v99);

    sub_100007830((uint64_t)v125, v114);
    _Block_release(v99);

    (*(void (**)(char *, uint64_t))(v121 + 8))(v107, v108);
    (*(void (**)(char *, uint64_t))(v118 + 8))(v103, v119);
    (*(void (**)(char *, uint64_t))(v93 + 8))(v123, v85);
    goto LABEL_36;
  }
  v73 = Logger.logObject.getter(v72);
  v74 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v73, v74))
  {
    v75 = v55;
    v76 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v76 = 0;
    _os_log_impl((void *)&_mh_execute_header, v73, v74, "Detected race condition with remote alert launching while device is locked from remote view", v76, 2u);
    v77 = v76;
    v55 = v75;
    swift_slowDealloc(v77, -1, -1);
  }

  v78 = *(void **)&v4[v55];
  if (v78)
  {
    v136 = sub_100004C48;
    v137 = 0;
    aBlock = _NSConcreteStackBlock;
    v133 = 1107296256;
    v134 = sub_1000049E4;
    v135 = &unk_10000C750;
    v79 = _Block_copy(&aBlock);
    objc_msgSend(v78, "remoteViewControllerDidLaunchWhileLockedWithCompletion:", v79);
    _Block_release(v79);
  }
  if (v70)
  {
    v70();
    sub_1000054F8();

    sub_100007830(v38, v39);
LABEL_36:
    sub_100007664(&v138);
    return;
  }
LABEL_40:
  __break(1u);
  __break(1u);
}

void sub_1000049D8()
{
  sub_100004C54("feedbackd connection invalidated");
}

uint64_t sub_1000049E4(uint64_t a1)
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

void sub_100004A10()
{
  sub_100004C54("feedbackd connection interrupted");
}

void sub_100004A1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *oslog;
  uint64_t v12;
  uint64_t v13;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v2 = type metadata accessor for Logger(0);
  sub_10000760C(v2, (uint64_t)qword_100011DA8);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v12 = a1;
    v13 = v6;
    *(_DWORD *)v5 = 136446210;
    swift_errorRetain(a1);
    v7 = sub_100007624(&qword_100012098);
    v8 = String.init<A>(describing:)(&v12, v7);
    v10 = v9;
    v12 = sub_100005EF4(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v5 + 4, v5 + 12);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Failed to connect to feedbackd from remote alert view controller: [%{public}s]", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

  }
}

void sub_100004BF8(uint64_t a1, void *a2)
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

void sub_100004C48()
{
  sub_100004C54("Informed feedbackd about locked device");
}

void sub_100004C54(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000760C(v2, (uint64_t)qword_100011DA8);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, a1, v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

}

void sub_100004D28(uint64_t a1, char *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
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
  void **v19;
  void (*v20)(char *, uint64_t, uint64_t);
  int v21;
  __objc2_meth *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  void (*v29)(void);
  uint8_t *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, void **, uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  char *v55;
  void *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  void (*v84)(void);
  uint64_t v85;
  uint64_t v86;

  v82 = a4;
  v83 = a2;
  v84 = a3;
  v81 = type metadata accessor for FBKSRemoteEvaluationRequest(0);
  v5 = *(_QWORD *)(v81 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v80 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v79 - v8;
  v10 = type metadata accessor for FBKSRemoteAlertRequest(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v79 - v16;
  __chkstk_darwin(v15);
  v19 = (void **)((char *)&v79 - v18);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v20((char *)&v79 - v18, a1, v10);
  v21 = (*(uint64_t (**)(void **, uint64_t))(v11 + 88))(v19, v10);
  v22 = &stru_100011000;
  if (v21 != enum case for FBKSRemoteAlertRequest.form(_:))
  {
    if (v21 != enum case for FBKSRemoteAlertRequest.evaluation(_:))
    {
      if (qword_100011DA0 != -1)
        swift_once(&qword_100011DA0, sub_100002DC8);
      v63 = type metadata accessor for Logger(0);
      sub_10000760C(v63, (uint64_t)qword_100011DA8);
      v64 = ((uint64_t (*)(char *, uint64_t, uint64_t))v20)(v17, a1, v10);
      v65 = Logger.logObject.getter(v64);
      v66 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v65, v66))
      {
        v67 = (uint8_t *)swift_slowAlloc(12, -1);
        v81 = swift_slowAlloc(32, -1);
        v86 = v81;
        *(_DWORD *)v67 = 136315138;
        v80 = (char *)(v67 + 4);
        v20(v14, (uint64_t)v17, v10);
        v68 = String.init<A>(describing:)(v14, v10);
        v70 = v69;
        v85 = sub_100005EF4(v68, v69, &v86);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v80, v67 + 12);
        swift_bridgeObjectRelease(v70);
        v71 = *(void (**)(char *, uint64_t))(v11 + 8);
        v71(v17, v10);
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "Unknown request type %s. Closing the connection.", v67, 0xCu);
        v72 = v81;
        swift_arrayDestroy(v81, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v72, -1, -1);
        v73 = v67;
        v22 = &stru_100011000;
        swift_slowDealloc(v73, -1, -1);
      }
      else
      {
        v71 = *(void (**)(char *, uint64_t))(v11 + 8);
        v71(v17, v10);
      }

      if (v84)
      {
        v84();
        sub_1000054F8();
        v71((char *)v19, v10);
        goto LABEL_22;
      }
LABEL_29:
      __break(1u);
      return;
    }
    (*(void (**)(void **, uint64_t))(v11 + 96))(v19, v10);
    v45 = v5;
    v46 = *(void (**)(char *, void **, uint64_t))(v5 + 32);
    v47 = v9;
    v48 = v81;
    v46(v9, v19, v81);
    if (qword_100011DA0 != -1)
      swift_once(&qword_100011DA0, sub_100002DC8);
    v49 = type metadata accessor for Logger(0);
    v50 = sub_10000760C(v49, (uint64_t)qword_100011DA8);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Configuring with Interaction", v53, 2u);
      swift_slowDealloc(v53, -1, -1);
    }

    type metadata accessor for FBKEvaluationController(0);
    sub_100007A28(&qword_100012090, v54, (uint64_t (*)(uint64_t))type metadata accessor for FeedbackRemoteViewController, (uint64_t)&unk_1000086E8);
    v55 = v83;
    v56 = (void *)FBKEvaluationController.__allocating_init(delegate:)();
    dispatch thunk of FBKEvaluationController.blockPresentationDetentUsage.setter(1);
    v57 = v80;
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v80, v47, v48);
    v58 = type metadata accessor for FeedbackRemoteViewController.RemoteEvaluationControllerState(0);
    v59 = swift_allocObject(v58, *(unsigned int *)(v58 + 48), *(unsigned __int16 *)(v58 + 52));
    *(_BYTE *)(v59
             + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_isPresented) = 0;
    v46((char *)(v59+ OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_remoteEvaluationRequest), (void **)v57, v48);
    *(_QWORD *)(v59
              + OBJC_IVAR____TtCC18FeedbackRemoteView28FeedbackRemoteViewController31RemoteEvaluationControllerState_evaluationController) = v56;
    v60 = *(_QWORD *)&v55[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
    *(_QWORD *)&v55[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = v59 | 0x8000000000000000;
    v61 = v56;
    swift_retain(v59);
    v62 = sub_10000778C(v60);
    if (v84)
    {
      ((void (*)(uint64_t))v84)(v62);

      swift_release(v59);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v48);
      v22 = &stru_100011000;
      goto LABEL_22;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  (*(void (**)(void **, uint64_t))(v11 + 96))(v19, v10);
  v23 = *v19;
  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v24 = type metadata accessor for Logger(0);
  v25 = sub_10000760C(v24, (uint64_t)qword_100011DA8);
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.default.getter();
  v28 = os_log_type_enabled(v26, v27);
  v29 = v84;
  if (v28)
  {
    v30 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Configuring with Form", v30, 2u);
    swift_slowDealloc(v30, -1, -1);
  }

  type metadata accessor for FBKFeedbackForm(0);
  v31 = v23;
  v32 = (void *)FBKFeedbackForm.__allocating_init(serviceForm:)();
  v33 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackDraftViewController(0));
  v34 = v32;
  v35 = (void *)FBKFeedbackDraftViewController.init(feedbackForm:)();
  v36 = v83;
  v38 = swift_unknownObjectRetain(v83, v37);
  dispatch thunk of FBKFeedbackDraftViewController.delegate.setter(v38);
  v39 = type metadata accessor for FeedbackRemoteViewController.FormRequestState();
  v40 = swift_allocObject(v39, 33, 7);
  *(_BYTE *)(v40 + 32) = 0;
  *(_QWORD *)(v40 + 16) = v34;
  *(_QWORD *)(v40 + 24) = v35;
  v41 = *(_QWORD *)&v36[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state];
  *(_QWORD *)&v36[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = v40;
  v42 = v34;
  v43 = v35;
  v44 = sub_10000778C(v41);
  if (!v29)
  {
    __break(1u);
    goto LABEL_28;
  }
  ((void (*)(uint64_t))v29)(v44);

LABEL_22:
  if (v22[145].types != (char *)-1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v74 = type metadata accessor for Logger(0);
  v75 = sub_10000760C(v74, (uint64_t)qword_100011DA8);
  v76 = Logger.logObject.getter(v75);
  v77 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v76, v77))
  {
    v78 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v78 = 0;
    _os_log_impl((void *)&_mh_execute_header, v76, v77, "Did configure remote alert controller", v78, 2u);
    swift_slowDealloc(v78, -1, -1);
  }

}

void *sub_1000054F8()
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

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_10000760C(v0, (uint64_t)qword_100011DA8);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = swift_slowAlloc(32, -1);
    v9 = v5;
    *(_DWORD *)v4 = 136446210;
    v8 = sub_100005EF4(0x292865736F6C63, 0xE700000000000000, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);
  }

  result = (void *)sub_100003AF4();
  if (result)
  {
    v7 = result;
    objc_msgSend(result, "invalidate");
    return (void *)swift_unknownObjectRelease(v7);
  }
  return result;
}

id sub_1000057C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FeedbackRemoteViewController()
{
  return objc_opt_self(_TtC18FeedbackRemoteView28FeedbackRemoteViewController);
}

uint64_t type metadata accessor for FeedbackRemoteViewController.FormRequestState()
{
  return objc_opt_self(_TtCC18FeedbackRemoteView28FeedbackRemoteViewController16FormRequestState);
}

uint64_t sub_100005868()
{
  return type metadata accessor for FeedbackRemoteViewController.RemoteEvaluationControllerState(0);
}

uint64_t type metadata accessor for FeedbackRemoteViewController.RemoteEvaluationControllerState(uint64_t a1)
{
  uint64_t result;

  result = qword_100011F00;
  if (!qword_100011F00)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FeedbackRemoteViewController.RemoteEvaluationControllerState);
  return result;
}

uint64_t sub_1000058AC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for FBKSRemoteEvaluationRequest(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = &unk_100008690;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for FeedbackRemoteViewController.State(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = *a2 & 0x7FFFFFFFFFFFFFFFLL;
  *a1 = *a2;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for FeedbackRemoteViewController.State(_QWORD *a1)
{
  return swift_release(*a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t *assignWithCopy for FeedbackRemoteViewController.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2 & 0x7FFFFFFFFFFFFFFFLL;
  v4 = *a1;
  *a1 = *a2;
  v5 = v4 & 0x7FFFFFFFFFFFFFFFLL;
  swift_retain(v3);
  swift_release(v5);
  return a1;
}

_QWORD *initializeWithTake for FeedbackRemoteViewController.State(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t *assignWithTake for FeedbackRemoteViewController.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  swift_release(v3 & 0x7FFFFFFFFFFFFFFFLL);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackRemoteViewController.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 127);
  v3 = (((*(_QWORD *)a1 >> 57) >> 6) | (2 * ((*(_QWORD *)a1 >> 57) & 0x38 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FeedbackRemoteViewController.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7E)
  {
    *(_QWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_100005E30(_QWORD *a1)
{
  return *a1 >> 63;
}

_QWORD *sub_100005E3C(_QWORD *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_100005E4C(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for FeedbackRemoteViewController.State()
{
  return &type metadata for FeedbackRemoteViewController.State;
}

uint64_t sub_100005E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000086E8, a3);
  return FBKEvaluationControllerDelegate.evaluationDidComplete(controller:response:)(a1, a2, a3, WitnessTable);
}

void *sub_100005EC0(uint64_t a1, uint64_t a2)
{
  return sub_1000073DC(a2);
}

uint64_t sub_100005EC8(uint64_t a1, uint64_t a2)
{
  return sub_100007A28(&qword_100011FC8, a2, (uint64_t (*)(uint64_t))type metadata accessor for FeedbackRemoteViewController, (uint64_t)"AA");
}

uint64_t sub_100005EF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100005FC4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100007684((uint64_t)v12, *a3);
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
      sub_100007684((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100007664(v12);
  return v7;
}

uint64_t sub_100005FC4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000617C(a5, a6);
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

uint64_t sub_10000617C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100006210(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000063E8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000063E8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100006210(uint64_t a1, unint64_t a2)
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
      v5 = sub_100006384(v4, 0);
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

_QWORD *sub_100006384(uint64_t a1, uint64_t a2)
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
  v4 = sub_100007624(&qword_100011FD8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000063E8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100007624(&qword_100011FD8);
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

unint64_t sub_100006534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000065C8(a1, a2, v5);
}

unint64_t sub_100006598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000066A8(a1, v4);
}

unint64_t sub_1000065C8(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000066A8(uint64_t a1, uint64_t a2)
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
      sub_100007A68(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000077E4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_10000697C(void (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000760C(v2, (uint64_t)qword_100011DA8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v9 = v7;
    *(_DWORD *)v6 = 136446210;
    v8 = sub_100005EF4(0xD000000000000026, 0x8000000100008CA0, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  if (a1)
    a1();
}

void *sub_100006B00(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v4 = type metadata accessor for Logger(0);
  sub_10000760C(v4, (uint64_t)qword_100011DA8);
  v5 = swift_bridgeObjectRetain_n(a2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v12 = v9;
    *(_DWORD *)v8 = 136446210;
    swift_bridgeObjectRetain(a2);
    v11 = sub_100005EF4(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Controller complete with ID: %{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  return sub_1000054F8();
}

void *sub_100006CB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000760C(v2, (uint64_t)qword_100011DA8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v13 = v7;
    *(_DWORD *)v6 = 136446210;
    v8 = FBKDraftError.description.getter(a1);
    v10 = v9;
    v12 = sub_100005EF4(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Controller failed to start, error: %{public}s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  return sub_1000054F8();
}

void sub_100006E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v8 = type metadata accessor for Logger(0);
  sub_10000760C(v8, (uint64_t)qword_100011DA8);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(22, -1);
    v23 = a2;
    v13 = v12;
    v14 = swift_slowAlloc(64, -1);
    v25 = v14;
    *(_DWORD *)v13 = 136380931;
    v15 = sub_100007A28(&qword_100011FE8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v16 = dispatch thunk of CustomStringConvertible.description.getter(v4, v15);
    v18 = v17;
    v24 = sub_100005EF4(v16, v17, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_WORD *)(v13 + 12) = 2082;
    v19 = FBKAttachmentError.description.getter(v23);
    v21 = v20;
    v24 = sub_100005EF4(v19, v20, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v13 + 14, v13 + 22);
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Controller failed to attach, url: %{private}s error  %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

}

void *sub_100007080(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v2 = type metadata accessor for Logger(0);
  sub_10000760C(v2, (uint64_t)qword_100011DA8);
  v3 = a1;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v15 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = type metadata accessor for FBKSubmissionError(0);
    v9 = sub_100007A28(&qword_100011FE0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for FBKSubmissionError, (uint64_t)&protocol conformance descriptor for FBKSubmissionError);
    v10 = Error.localizedDescription.getter(v8, v9);
    v12 = v11;
    v14 = sub_100005EF4(v10, v11, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v6 + 4, v6 + 12);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to submit feedback.%s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
  return sub_1000054F8();
}

void *sub_100007260()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_10000760C(v0, (uint64_t)qword_100011DA8);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = swift_slowAlloc(32, -1);
    v8 = v5;
    *(_DWORD *)v4 = 136446210;
    v7 = sub_100005EF4(0xD00000000000002DLL, 0x8000000100008C20, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);
  }

  return sub_1000054F8();
}

void *sub_1000073DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v2 = type metadata accessor for Logger(0);
  sub_10000760C(v2, (uint64_t)qword_100011DA8);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc(22, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    v8 = swift_slowAlloc(32, -1);
    v13 = v8;
    *(_DWORD *)v6 = 136446466;
    v12 = sub_100005EF4(0xD000000000000024, 0x8000000100008980, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v6 + 4, v6 + 12);
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain(a1);
    v9 = _swift_stdlib_bridgeErrorToNSError(a1);
    v12 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v6 + 14, v6 + 22);
    *v7 = v9;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s %@", (uint8_t *)v6, 0x16u);
    v10 = sub_100007624(&qword_100011FD0);
    swift_arrayDestroy(v7, 1, v10);
    swift_slowDealloc(v7, -1, -1);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  return sub_1000054F8();
}

uint64_t sub_10000760C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100007624(uint64_t *a1)
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

uint64_t sub_100007664(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100007684(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_1000076C4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100007704(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007624(&qword_100011FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000774C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007624(&qword_100011FF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000778C(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return swift_release(result & 0x7FFFFFFFFFFFFFFFLL);
  return result;
}

uint64_t sub_1000077A4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_1000077B4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000077D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1000077E4(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100007818(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007828(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007830(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100007874()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100012070;
  if (!qword_100012070)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100012070);
  }
  return result;
}

uint64_t sub_1000078B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for FBKSRemoteAlertRequest(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  if (*(_QWORD *)(v0 + v6))
    swift_release(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v3 | 7);
}

void sub_100007938()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for FBKSRemoteAlertRequest(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_100004D28(v0 + v2, *(char **)(v0 + v3), *(void (**)(void))(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_100007988(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

unint64_t sub_100007998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100012088;
  if (!qword_100012088)
  {
    v1 = sub_1000079E4(&qword_100012080);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100012088);
  }
  return result;
}

uint64_t sub_1000079E4(uint64_t *a1)
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

uint64_t sub_100007A28(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007A68(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

id sub_100007BF8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
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
  uint64_t v12;

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);
  v12 = v11;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v10, v12);
  swift_bridgeObjectRelease(v12);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC18FeedbackRemoteView11AppDelegate);
}

id sub_100007D74()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC18FeedbackRemoteView13SceneDelegate);
}

uint64_t sub_100007DD4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC18FeedbackRemoteViewP33_640D9ADC16FFA01F4D938220D2608D0719ResourceBundleClass);
}
