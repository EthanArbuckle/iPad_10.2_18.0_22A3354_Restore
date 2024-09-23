void sub_100004214()
{
  qword_100034770 = 0x4072C00000000000;
}

id sub_100004228(double a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v19;
  id result;
  uint64_t v21;
  double *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  double v28;
  uint64_t v29;
  _BYTE *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  double v53;
  _BYTE v54[24];

  v3 = type metadata accessor for Logger(0);
  v52 = *(_QWORD *)(v3 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v49 - v7;
  v9 = type metadata accessor for InviteMessageView(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000070B8(&qword_100034818);
  __chkstk_darwin(v12);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for InviteMessageDetails(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (id)__chkstk_darwin(v17);
  v22 = (double *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  if ((v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize + 16] & 1) == 0)
    return result;
  v51 = v6;
  v23 = *(void **)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler];
  if (!v23)
    return result;
  v49 = v3;
  v50 = (uint64_t)&v49 - v21;
  v24 = (uint64_t)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  swift_beginAccess(&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails], v54, 0, 0);
  sub_1000079E4(v24, (uint64_t)v14, &qword_100034818);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
    return (id)sub_100008080((uint64_t)v14, &qword_100034818);
  v25 = v50;
  sub_100007338((uint64_t)v14, v50);
  sub_10000737C(v25, (uint64_t)v19, type metadata accessor for InviteMessageDetails);
  v26 = qword_100034768;
  v27 = v23;
  if (v26 != -1)
    swift_once(&qword_100034768, sub_100004214);
  v28 = *(double *)&qword_100034770;
  if (*(double *)&qword_100034770 >= a1)
    v28 = a1;
  v29 = *(_QWORD *)&v28;
  v30 = v1;
  sub_100009CE8((uint64_t)v19, v29, 0, (uint64_t)v1, (uint64_t)&off_100031370, 0, 0, (uint64_t)v11);
  dispatch thunk of UIHostingController.rootView.setter(v11);
  result = objc_msgSend(v27, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_23;
  }
  v31 = result;
  objc_msgSend(result, "invalidateIntrinsicContentSize");

  result = objc_msgSend(v27, "view");
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v32 = result;
  objc_msgSend(result, "layoutSubviews");

  result = objc_msgSend(v27, "view");
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v33 = result;
  objc_msgSend(result, "intrinsicContentSize");
  v35 = v34;

  result = objc_msgSend(v27, "view");
  if (!result)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  v36 = result;
  objc_msgSend(result, "intrinsicContentSize");
  v38 = v37;

  v39 = ((uint64_t (*)(void))static FamilyLogger.extension.getter)();
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = swift_slowAlloc(22, -1);
    *(_DWORD *)v42 = 134218240;
    v53 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54);
    *(_WORD *)(v42 + 12) = 2048;
    v53 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "content size width: %f, height: %f", (uint8_t *)v42, 0x16u);
    swift_slowDealloc(v42, -1, -1);
  }

  v43 = *(uint64_t (**)(char *, uint64_t))(v52 + 8);
  v44 = v43(v8, v49);
  if (*(double *)&qword_100034770 < a1)
    a1 = *(double *)&qword_100034770;
  v45 = static FamilyLogger.extension.getter(v44);
  v46 = Logger.logObject.getter(v45);
  v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = swift_slowAlloc(22, -1);
    *(_DWORD *)v48 = 134218240;
    v53 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54);
    *(_WORD *)(v48 + 12) = 2048;
    v53 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54);
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "contentSizeThatFits %f,%f", (uint8_t *)v48, 0x16u);
    swift_slowDealloc(v48, -1, -1);
  }

  v43(v51, v49);
  result = (id)sub_1000073C0(v50, type metadata accessor for InviteMessageDetails);
  *v22 = a1;
  v22[1] = v35;
  *((_BYTE *)v22 + 16) = 0;
  return result;
}

void sub_1000047B8(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  objc_super v15;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for MessagesViewController(0);
  v15.receiver = v2;
  v15.super_class = v8;
  v9 = objc_msgSendSuper2(&v15, "viewWillAppear:", a1 & 1);
  v10 = static FamilyLogger.extension.getter(v9);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Register for family update notification", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v14 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  objc_msgSend(v14, "addObserver:selector:name:object:", v2, "handleFamilyDidUpdate", FAFamilyUpdateNotification, 0);

}

void sub_100004964(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  objc_super v15;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for MessagesViewController(0);
  v15.receiver = v2;
  v15.super_class = v8;
  v9 = objc_msgSendSuper2(&v15, "viewDidDisappear:", a1 & 1);
  v10 = static FamilyLogger.extension.getter(v9);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Unregister for family update notification", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v14 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  objc_msgSend(v14, "removeObserver:name:object:", v2, FAFamilyUpdateNotification, 0);

}

id sub_100004B08(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  void *v55;
  uint8_t *v56;
  uint8_t *v57;
  id result;
  void *v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  id v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint8_t *v70;
  char *v71;
  uint8_t *v72;
  uint64_t v73;
  char *v74;
  void *v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  NSObject *v82;
  os_log_type_t v83;
  __objc2_class_ro *v84;
  uint8_t *v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint8_t *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  _QWORD *v102;
  unint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  id v107;
  unsigned __int8 v108;
  id v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  char *v121;
  char *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint8_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138[4];

  v3 = sub_1000070B8(&qword_1000347E8);
  __chkstk_darwin(v3);
  v128 = (char *)&v120 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000070B8(&qword_1000347F0);
  v124 = *(_QWORD *)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v125 = v7;
  v126 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v127 = (char *)&v120 - v8;
  v9 = type metadata accessor for Logger(0);
  v135 = *(uint8_t **)(v9 - 8);
  v136 = v9;
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v120 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v120 - v14;
  v16 = __chkstk_darwin(v13);
  v129 = (char *)&v120 - v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v120 - v18;
  v20 = sub_1000070B8(&qword_100034820);
  v21 = __chkstk_darwin(v20);
  v23 = (char *)&v120 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v25 = (char *)&v120 - v24;
  v26 = type metadata accessor for URLComponents(0);
  v131 = *(_QWORD *)(v26 - 8);
  v132 = v26;
  __chkstk_darwin(v26);
  v130 = (char *)&v120 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1000070B8(&qword_100034868);
  __chkstk_darwin(v28);
  v30 = (char *)&v120 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = type metadata accessor for URL(0);
  v32 = *(_QWORD *)(v31 - 8);
  v133 = v31;
  v134 = v32;
  v33 = __chkstk_darwin(v31);
  v35 = (char *)&v120 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  v37 = (char *)&v120 - v36;
  v123 = a1;
  v38 = objc_msgSend(a1, "selectedMessage");
  if (v38)
  {
    v39 = v38;
    v121 = v1;
    v122 = v37;
    v40 = objc_msgSend(v38, "URL");
    if (v40)
    {
      v41 = v40;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v42 = v134;
      v43 = *(void (**)(char *, char *, uint64_t))(v134 + 32);
      v44 = v35;
      v45 = v133;
      v43(v30, v44, v133);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v30, 0, 1, v45);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v30, 1, v45) != 1)
      {
        v46 = v122;
        v43(v122, v30, v45);
        v47 = v46;
        URLComponents.init(url:resolvingAgainstBaseURL:)(v46, 0);
        v49 = v131;
        v48 = v132;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v131 + 48))(v25, 1, v132) == 1)
        {
          v50 = sub_100008080((uint64_t)v25, &qword_100034820);
          v51 = static FamilyLogger.extension.getter(v50);
          v52 = Logger.logObject.getter(v51);
          v53 = static os_log_type_t.default.getter();
          v54 = os_log_type_enabled(v52, v53);
          v55 = v121;
          if (v54)
          {
            v56 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v56 = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, v53, "Missing url components for invite message url", v56, 2u);
            v57 = v56;
            v45 = v133;
            swift_slowDealloc(v57, -1, -1);
          }

          (*((void (**)(char *, uint64_t))v135 + 1))(v15, v136);
          result = objc_msgSend(v55, "view");
          if (result)
          {
            v59 = result;
            v60 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
            objc_msgSend(v59, "setBackgroundColor:", v60);

            return (id)(*(uint64_t (**)(char *, uint64_t))(v134 + 8))(v47, v45);
          }
          else
          {
            __break(1u);
          }
        }
        else
        {
          v65 = (*(uint64_t (**)(char *, char *, uint64_t))(v49 + 32))(v130, v25, v48);
          static FamilyLogger.common.getter(v65);
          v66 = v39;
          v67 = Logger.logObject.getter(v66);
          v68 = static os_log_type_t.default.getter();
          v69 = os_log_type_enabled(v67, v68);
          v120 = v66;
          if (v69)
          {
            v70 = (uint8_t *)swift_slowAlloc(8, -1);
            *(_DWORD *)v70 = 67109120;
            LODWORD(v138[0]) = objc_msgSend(v66, "isPending");
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v138, (char *)v138 + 4);

            _os_log_impl((void *)&_mh_execute_header, v67, v68, "in compose screen %{BOOL}d", v70, 8u);
            swift_slowDealloc(v70, -1, -1);
          }
          else
          {

          }
          v71 = v121;
          v72 = v135;
          v73 = v136;
          v74 = v129;
          v75 = v123;

          v76 = (void (*)(char *, uint64_t))*((_QWORD *)v72 + 1);
          v76(v19, v73);
          v77 = v131;
          v78 = v132;
          (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v23, v130, v132);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v77 + 56))(v23, 0, 1, v78);
          v79 = (uint64_t)&v71[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
          swift_beginAccess(&v71[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents], v138, 33, 0);
          sub_1000080BC((uint64_t)v23, v79, &qword_100034820);
          v80 = swift_endAccess(v138);
          static FamilyLogger.common.getter(v80);
          v81 = v75;
          v82 = Logger.logObject.getter(v81);
          v83 = static os_log_type_t.default.getter();
          v84 = &Family_MSMessagesAppViewController__metaData;
          if (os_log_type_enabled(v82, v83))
          {
            v85 = (uint8_t *)swift_slowAlloc(12, -1);
            v86 = swift_slowAlloc(32, -1);
            v138[0] = v86;
            *(_DWORD *)v85 = 136315138;
            v135 = v85 + 4;
            v87 = objc_msgSend(v81, "recipientAddresses");
            v88 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

            v89 = Array.description.getter(v88, &type metadata for String);
            v91 = v90;
            v92 = v88;
            v71 = v121;
            swift_bridgeObjectRelease(v92);
            v137 = sub_100026DB4(v89, v91, v138);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, v138);
            swift_bridgeObjectRelease(v91);

            _os_log_impl((void *)&_mh_execute_header, v82, v83, "recipientAddresses from conversation %s", v85, 0xCu);
            swift_arrayDestroy(v86, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v86, -1, -1);
            v93 = v85;
            v84 = &Family_MSMessagesAppViewController__metaData;
            swift_slowDealloc(v93, -1, -1);

            v94 = v129;
            v95 = v136;
          }
          else
          {

            v94 = v74;
            v95 = v73;
          }
          v76(v94, v95);
          v97 = (uint64_t)v127;
          v96 = (uint64_t)v128;
          v98 = v125;
          v99 = (uint64_t)v126;
          v100 = v124;
          v101 = objc_msgSend(v81, *(SEL *)&v84[13].flags);
          v102 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

          if (v102[2])
          {
            v104 = v102[4];
            v103 = v102[5];
            swift_bridgeObjectRetain(v103);
            swift_bridgeObjectRelease(v102);
          }
          else
          {
            swift_bridgeObjectRelease(v102);
            v104 = 0;
            v103 = 0xE000000000000000;
          }
          v105 = &v71[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
          v106 = *(_QWORD *)&v71[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation
                               + 8];
          *(_QWORD *)v105 = v104;
          *((_QWORD *)v105 + 1) = v103;
          swift_bridgeObjectRelease(v106);
          v107 = v120;
          v108 = objc_msgSend(v120, "isPending");
          v109 = objc_msgSend(v107, "time");
          if (v109)
          {
            v110 = v109;
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v111 = type metadata accessor for Date(0);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v111 - 8) + 56))(v97, 0, 1, v111);
          }
          else
          {
            v112 = type metadata accessor for Date(0);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 56))(v97, 1, 1, v112);
          }
          v113 = type metadata accessor for TaskPriority(0);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v113 - 8) + 56))(v96, 1, 1, v113);
          sub_1000079E4(v97, v99, &qword_1000347F0);
          type metadata accessor for MainActor(0);
          v114 = v71;
          v115 = static MainActor.shared.getter();
          v116 = *(unsigned __int8 *)(v100 + 80);
          v117 = (v116 + 41) & ~v116;
          v118 = swift_allocObject(&unk_100031460, v117 + v98, v116 | 7);
          *(_QWORD *)(v118 + 16) = v115;
          *(_QWORD *)(v118 + 24) = &protocol witness table for MainActor;
          *(_QWORD *)(v118 + 32) = v114;
          *(_BYTE *)(v118 + 40) = v108;
          sub_1000070FC(v99, v118 + v117);
          v119 = sub_1000064C4(v96, (uint64_t)&unk_100034870, v118, (uint64_t)&unk_1000313C0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_100034810);
          swift_release(v119);

          sub_100008080(v97, &qword_1000347F0);
          (*(void (**)(char *, uint64_t))(v131 + 8))(v130, v132);
          return (id)(*(uint64_t (**)(char *, uint64_t))(v134 + 8))(v122, v133);
        }
        return result;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v134 + 56))(v30, 1, 1, v133);
    }

    v38 = (id)sub_100008080((uint64_t)v30, &qword_100034868);
  }
  v61 = static FamilyLogger.extension.getter(v38);
  v62 = Logger.logObject.getter(v61);
  v63 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v64 = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Missing invite message url", v64, 2u);
    swift_slowDealloc(v64, -1, -1);
  }

  return (id)(*((uint64_t (**)(char *, uint64_t))v135 + 1))(v12, v136);
}

void sub_100005598(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSString v29;
  Class isa;
  uint64_t inited;
  uint64_t v32;
  id v33;
  unint64_t v34;
  Class v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  NSString v39;
  Class v40;
  uint64_t v41;
  id v42;
  unint64_t v43;
  Class v44;
  id v45;
  uint64_t v46;
  void *v47;
  Class v48;
  id v49;
  uint64_t v50;
  id v51;
  unint64_t v52;
  void *v53;
  id v54;
  _BYTE v55[80];
  void *v56;

  v2 = v1;
  v4 = objc_msgSend(a1, "view");
  if (v4)
  {
    v54 = v4;
    v5 = objc_msgSend(v2, "view");
    if (!v5)
    {

      return;
    }
    v51 = v5;
    v53 = a1;
    v6 = objc_msgSend(v2, "childViewControllers");
    v7 = sub_100007620(0, &qword_100034838, UIViewController_ptr);
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    if ((unint64_t)v8 >> 62)
    {
      if (v8 < 0)
        v14 = v8;
      else
        v14 = v8 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v8);
      v9 = _CocoaArrayWrapper.endIndex.getter(v14);
      if (!v9)
        goto LABEL_16;
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v8);
      if (!v9)
        goto LABEL_16;
    }
    if (v9 < 1)
    {
      __break(1u);
      goto LABEL_21;
    }
    v10 = 0;
    do
    {
      if ((v8 & 0xC000000000000001) != 0)
        v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, v8);
      else
        v11 = *(id *)(v8 + 8 * v10 + 32);
      v12 = v11;
      ++v10;
      objc_msgSend(v11, "willMoveToParentViewController:", 0);
      v13 = objc_msgSend(v12, "view");
      objc_msgSend(v13, "removeFromSuperview");

      objc_msgSend(v12, "removeFromParentViewController");
    }
    while (v9 != v10);
LABEL_16:
    swift_bridgeObjectRelease_n(v8, 2);
    v15 = objc_msgSend(v2, "view");
    if (v15)
    {
      v16 = v15;
      v17 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray5Color");
      objc_msgSend(v16, "setBackgroundColor:", v17);

      objc_msgSend(v2, "_balloonMaskEdgeInsets");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(v2, "addChildViewController:", v53);
      v26 = objc_msgSend(v2, "view");
      if (v26)
      {
        v27 = v26;
        objc_msgSend(v26, "addSubview:", v54);

        objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v50 = sub_1000070B8(&qword_100034840);
        v28 = ((uint64_t (*)(void))swift_initStackObject)();
        *(_OWORD *)(v28 + 16) = xmmword_100029EC0;
        *(_QWORD *)(v28 + 32) = 1952867692;
        *(_QWORD *)(v28 + 40) = 0xE400000000000000;
        *(_QWORD *)(v28 + 48) = v21;
        *(_QWORD *)(v28 + 72) = &type metadata for CGFloat;
        *(_QWORD *)(v28 + 80) = 0x7468676972;
        *(_QWORD *)(v28 + 88) = 0xE500000000000000;
        *(_QWORD *)(v28 + 96) = v25;
        *(_QWORD *)(v28 + 120) = &type metadata for CGFloat;
        *(_QWORD *)(v28 + 128) = 7368564;
        *(_QWORD *)(v28 + 136) = 0xE300000000000000;
        *(_QWORD *)(v28 + 144) = v19;
        *(_QWORD *)(v28 + 168) = &type metadata for CGFloat;
        *(_QWORD *)(v28 + 176) = 0x6D6F74746F62;
        *(_QWORD *)(v28 + 184) = 0xE600000000000000;
        *(_QWORD *)(v28 + 216) = &type metadata for CGFloat;
        *(_QWORD *)(v28 + 192) = v23;
        v52 = sub_100020F94(v28);
        v56 = &_swiftEmptyArrayStorage;
        v49 = (id)objc_opt_self(NSLayoutConstraint);
        swift_bridgeObjectRetain(0x800000010002A950);
        v29 = String._bridgeToObjectiveC()();
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        inited = swift_initStackObject(v50, v55);
        *(_OWORD *)(inited + 16) = xmmword_100029ED0;
        *(_QWORD *)(inited + 32) = 2003134838;
        *(_QWORD *)(inited + 40) = 0xE400000000000000;
        v32 = sub_100007620(0, &qword_100034848, UIView_ptr);
        *(_QWORD *)(inited + 72) = v32;
        *(_QWORD *)(inited + 48) = v54;
        v33 = v54;
        v34 = sub_100020F94(inited);
        v35 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v34);
        v36 = objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", v29, 0, isa, v35);

        v37 = sub_100007620(0, &qword_100034850, NSLayoutConstraint_ptr);
        v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v36, v37);
        swift_bridgeObjectRelease(0x800000010002A950);

        sub_100007468(v38);
        swift_bridgeObjectRetain(0x800000010002A970);
        v39 = String._bridgeToObjectiveC()();
        v40 = Dictionary._bridgeToObjectiveC()().super.isa;
        v41 = swift_initStackObject(v50, v55);
        *(_OWORD *)(v41 + 16) = xmmword_100029ED0;
        *(_QWORD *)(v41 + 32) = 2003134838;
        *(_QWORD *)(v41 + 40) = 0xE400000000000000;
        *(_QWORD *)(v41 + 48) = v33;
        *(_QWORD *)(v41 + 72) = v32;
        v42 = v33;
        v43 = sub_100020F94(v41);
        v44 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v43);
        v45 = objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", v39, 0, v40, v44);

        v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v45, v37);
        swift_bridgeObjectRelease(0x800000010002A970);

        sub_100007468(v46);
        swift_bridgeObjectRelease(v52);
        v47 = v56;
        v48 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v47);
        objc_msgSend(v51, "addConstraints:", v48);

        objc_msgSend(v53, "didMoveToParentViewController:", v2);
        objc_msgSend(v2, "requestResize");

        return;
      }
LABEL_22:
      __break(1u);
      return;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
}

void sub_100005C10(uint64_t a1, void *a2)
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

uint64_t sub_100005CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_BYTE *)(v6 + 248) = a5;
  *(_QWORD *)(v6 + 64) = a4;
  *(_QWORD *)(v6 + 72) = a6;
  v7 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for InviteMessageView(0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 80) = swift_task_alloc(v7);
  *(_QWORD *)(v6 + 88) = swift_task_alloc(v7);
  v8 = (*(_QWORD *)(*(_QWORD *)(sub_1000070B8(&qword_100034818) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 96) = swift_task_alloc(v8);
  *(_QWORD *)(v6 + 104) = swift_task_alloc(v8);
  v9 = type metadata accessor for InviteMessageDetails(0);
  *(_QWORD *)(v6 + 112) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v6 + 120) = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 128) = swift_task_alloc(v11);
  *(_QWORD *)(v6 + 136) = swift_task_alloc(v11);
  v12 = type metadata accessor for Logger(0);
  *(_QWORD *)(v6 + 144) = v12;
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 152) = v13;
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 160) = swift_task_alloc(v14);
  *(_QWORD *)(v6 + 168) = swift_task_alloc(v14);
  v15 = sub_1000070B8(&qword_100034820);
  *(_QWORD *)(v6 + 176) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v15 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for URLComponents(0);
  *(_QWORD *)(v6 + 184) = v16;
  v17 = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v6 + 192) = v17;
  *(_QWORD *)(v6 + 200) = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v6 + 208) = static MainActor.shared.getter();
  v19 = dispatch thunk of Actor.unownedExecutor.getter(v18, &protocol witness table for MainActor);
  *(_QWORD *)(v6 + 216) = v19;
  *(_QWORD *)(v6 + 224) = v20;
  return swift_task_switch(sub_100005E4C, v19, v20);
}

uint64_t sub_100005E4C()
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
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 64) + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents;
  swift_beginAccess(v4, v0 + 16, 0, 0);
  sub_1000079E4(v4, v3, &qword_100034820);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v5 = *(_QWORD *)(v0 + 176);
    swift_release(*(_QWORD *)(v0 + 208));
    v6 = sub_100008080(v5, &qword_100034820);
    v7 = static FamilyLogger.extension.getter(v6);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Message bubble missing urlComponents", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = *(_QWORD *)(v0 + 200);
    v13 = *(_QWORD *)(v0 + 168);
    v12 = *(_QWORD *)(v0 + 176);
    v14 = *(_QWORD *)(v0 + 160);
    v16 = *(_QWORD *)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 96);
    v17 = *(_QWORD *)(v0 + 104);
    v19 = *(_QWORD *)(v0 + 88);
    v27 = *(_QWORD *)(v0 + 80);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(v13, *(_QWORD *)(v0 + 144));
    swift_task_dealloc(v11);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v27);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v21 = *(_QWORD *)(v0 + 64);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 32))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
    v23 = *(_QWORD *)(v21
                    + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation);
    v22 = *(_QWORD *)(v21
                    + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation
                    + 8);
    *(_QWORD *)(v0 + 232) = v22;
    v24 = v21 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher;
    v25 = dword_10003512C;
    swift_bridgeObjectRetain(v22);
    v26 = (_QWORD *)swift_task_alloc(v25);
    *(_QWORD *)(v0 + 240) = v26;
    *v26 = v0;
    v26[1] = sub_1000060A0;
    return sub_1000212F4(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 200), *(_BYTE *)(v0 + 248), v23, v22, v24, *(_QWORD *)(v0 + 72));
  }
}

uint64_t sub_1000060A0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 232);
  swift_task_dealloc(*(_QWORD *)(*v0 + 240));
  swift_bridgeObjectRelease(v2);
  return swift_task_switch(sub_1000060F4, *(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 224));
}

uint64_t sub_1000060F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 208));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = sub_100008080(*(_QWORD *)(v0 + 104), &qword_100034818);
    v5 = static FamilyLogger.extension.getter(v4);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Message bubble could not build inviteMessageDetail", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }
    v10 = *(_QWORD *)(v0 + 152);
    v9 = *(_QWORD *)(v0 + 160);
    v11 = *(_QWORD *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 128);
    v13 = *(_QWORD *)(v0 + 136);
    v14 = *(_QWORD *)(v0 + 112);
    v15 = *(_QWORD *)(v0 + 120);
    v16 = *(_QWORD *)(v0 + 96);
    v17 = *(_QWORD *)(v0 + 64);
    sub_100007338(*(_QWORD *)(v0 + 104), v13);
    v18 = v17 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize;
    *(_QWORD *)v18 = 0;
    *(_QWORD *)(v18 + 8) = 0;
    *(_BYTE *)(v18 + 16) = 1;
    sub_10000737C(v13, v16, type metadata accessor for InviteMessageDetails);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(v16, 0, 1, v14);
    v19 = v17 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails;
    swift_beginAccess(v17 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails, v0 + 40, 33, 0);
    sub_1000080BC(v16, v19, &qword_100034818);
    swift_endAccess(v0 + 40);
    sub_10000737C(v13, v12, type metadata accessor for InviteMessageDetails);
    if (qword_100034768 != -1)
      swift_once(&qword_100034768, sub_100004214);
    v20 = *(_QWORD *)(v0 + 128);
    v22 = *(_QWORD *)(v0 + 80);
    v21 = *(_QWORD *)(v0 + 88);
    v23 = *(void **)(v0 + 64);
    v24 = qword_100034770;
    v25 = v23;
    sub_100009CE8(v20, v24, 0, (uint64_t)v23, (uint64_t)&off_100031370, 0, 0, v21);
    sub_10000737C(v21, v22, type metadata accessor for InviteMessageView);
    v26 = objc_allocWithZone((Class)sub_1000070B8(&qword_100034828));
    v27 = (void *)UIHostingController.init(rootView:)(v22);
    dispatch thunk of UIHostingController._disableSafeArea.setter(1);
    v28 = objc_msgSend(v27, "view");
    if (v28)
    {
      v29 = v28;
      v30 = sub_1000070B8(&qword_100034830);
      if (swift_dynamicCastClass(v29, v30))
        _UIHostingView.addsKeyboardToSafeAreaInsets.setter(0);

    }
    v31 = *(_QWORD *)(v0 + 136);
    v32 = *(char **)(v0 + 64);
    sub_1000073C0(*(_QWORD *)(v0 + 88), type metadata accessor for InviteMessageView);
    v33 = *(void **)&v32[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler];
    *(_QWORD *)&v32[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = v27;
    v34 = v27;

    sub_100005598(v34);
    objc_msgSend(v32, "setReadyForDisplay");

    sub_1000073C0(v31, type metadata accessor for InviteMessageDetails);
  }
  v35 = *(_QWORD *)(v0 + 200);
  v36 = *(_QWORD *)(v0 + 176);
  v38 = *(_QWORD *)(v0 + 160);
  v37 = *(_QWORD *)(v0 + 168);
  v40 = *(_QWORD *)(v0 + 128);
  v39 = *(_QWORD *)(v0 + 136);
  v42 = *(_QWORD *)(v0 + 96);
  v41 = *(_QWORD *)(v0 + 104);
  v43 = *(_QWORD *)(v0 + 88);
  v45 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(v35, *(_QWORD *)(v0 + 184));
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v45);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000064C4(a1, a2, a3, (uint64_t)&unk_1000313C0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_100034810);
}

uint64_t sub_1000064A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000064C4(a1, a2, a3, (uint64_t)&unk_100031488, (uint64_t)&type metadata for Bool, (uint64_t)&unk_100034880);
}

uint64_t sub_1000064C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD v25[4];

  v12 = type metadata accessor for TaskPriority(0);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(a1, 1, v12) == 1)
  {
    sub_100008080(a1, &qword_1000347E8);
    v14 = 7168;
    v15 = *(_QWORD *)(a3 + 16);
    if (v15)
    {
LABEL_3:
      v16 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v15);
      swift_unknownObjectRetain(v15);
      v18 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v16);
      v20 = v19;
      swift_unknownObjectRelease(v15);
      goto LABEL_6;
    }
  }
  else
  {
    v21 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
    v14 = v21 | 0x1C00;
    v15 = *(_QWORD *)(a3 + 16);
    if (v15)
      goto LABEL_3;
  }
  v18 = 0;
  v20 = 0;
LABEL_6:
  v22 = swift_allocObject(a4, 32, 7);
  *(_QWORD *)(v22 + 16) = a2;
  *(_QWORD *)(v22 + 24) = a3;
  if (v20 | v18)
  {
    v25[0] = 0;
    v25[1] = 0;
    v23 = v25;
    v25[2] = v18;
    v25[3] = v20;
  }
  else
  {
    v23 = 0;
  }
  return swift_task_create(v14, v23, a5, a6, v22);
}

uint64_t sub_1000066E4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  char *v20;
  void *v21;
  uint8_t *v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;
  uint64_t v34;

  v1 = v0;
  v2 = sub_1000070B8(&qword_1000347E8);
  __chkstk_darwin(v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000070B8(&qword_1000347F0);
  v34 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v34 + 64);
  v7 = __chkstk_darwin(v5);
  v8 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v33 - v9;
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = static FamilyLogger.extension.getter(v13);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    v33 = v10;
    v20 = v4;
    v21 = v1;
    v22 = v19;
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Received notification for family update", v19, 2u);
    v23 = v22;
    v1 = v21;
    v4 = v20;
    v8 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v10 = v33;
    swift_slowDealloc(v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  v24 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v10, 1, 1, v24);
  v25 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v4, 1, 1, v25);
  sub_1000079E4((uint64_t)v10, (uint64_t)v8, &qword_1000347F0);
  type metadata accessor for MainActor(0);
  v26 = v1;
  v27 = static MainActor.shared.getter();
  v28 = *(unsigned __int8 *)(v34 + 80);
  v29 = (v28 + 41) & ~v28;
  v30 = swift_allocObject(&unk_100031398, v29 + v6, v28 | 7);
  *(_QWORD *)(v30 + 16) = v27;
  *(_QWORD *)(v30 + 24) = &protocol witness table for MainActor;
  *(_QWORD *)(v30 + 32) = v26;
  *(_BYTE *)(v30 + 40) = 0;
  sub_1000070FC((uint64_t)v8, v30 + v29);
  v31 = sub_1000064C4((uint64_t)v4, (uint64_t)&unk_100034800, v30, (uint64_t)&unk_1000313C0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_100034810);
  swift_release(v31);
  return sub_100008080((uint64_t)v10, &qword_1000347F0);
}

id sub_1000069CC(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  NSString v15;
  id v16;
  objc_super v18;

  v6 = (uint64_t *)&v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher];
  v7 = type metadata accessor for FamilyFetcher();
  v8 = swift_allocObject(v7, 16, 7);
  v6[3] = v7;
  v6[4] = (uint64_t)&off_100031960;
  *v6 = v8;
  v9 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
  v11 = type metadata accessor for URLComponents(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  v13 = type metadata accessor for InviteMessageDetails(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(_QWORD *)&v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = 0;
  v14 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v14[16] = 1;
  if (a2)
  {
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v15 = 0;
  }
  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for MessagesViewController(0);
  v16 = objc_msgSendSuper2(&v18, "initWithNibName:bundle:", v15, a3);

  return v16;
}

id sub_100006B84(void *a1)
{
  char *v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  objc_super v14;

  v3 = (uint64_t *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher];
  v4 = type metadata accessor for FamilyFetcher();
  v5 = swift_allocObject(v4, 16, 7);
  v3[3] = v4;
  v3[4] = (uint64_t)&off_100031960;
  *v3 = v5;
  v6 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
  v8 = type metadata accessor for URLComponents(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  v10 = type metadata accessor for InviteMessageDetails(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(_QWORD *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = 0;
  v11 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for MessagesViewController(0);
  v12 = objc_msgSendSuper2(&v14, "initWithCoder:", a1);

  return v12;
}

id sub_100006CC8(char a1)
{
  char *v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  objc_super v13;

  v3 = (uint64_t *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher];
  v4 = type metadata accessor for FamilyFetcher();
  v5 = swift_allocObject(v4, 16, 7);
  v3[3] = v4;
  v3[4] = (uint64_t)&off_100031960;
  *v3 = v5;
  v6 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
  v8 = type metadata accessor for URLComponents(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  v10 = type metadata accessor for InviteMessageDetails(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(_QWORD *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = 0;
  v11 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for MessagesViewController(0);
  return objc_msgSendSuper2(&v13, "initWithShouldBeSheetPresentationControllerDelegate:", a1 & 1);
}

id sub_100006E00()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006EB0()
{
  return type metadata accessor for MessagesViewController(0);
}

uint64_t type metadata accessor for MessagesViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000347C0;
  if (!qword_1000347C0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MessagesViewController);
  return result;
}

void sub_100006EF4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[6];

  v6[0] = "(";
  v6[1] = &unk_100029F40;
  sub_100006FC0(319, &qword_1000347D0, (uint64_t (*)(uint64_t))&type metadata accessor for URLComponents);
  if (v3 <= 0x3F)
  {
    v6[2] = *(_QWORD *)(v2 - 8) + 64;
    sub_100006FC0(319, &qword_1000347D8, type metadata accessor for InviteMessageDetails);
    if (v5 <= 0x3F)
    {
      v6[3] = *(_QWORD *)(v4 - 8) + 64;
      v6[4] = &unk_100029F58;
      v6[5] = &unk_100029F70;
      swift_updateClassMetadata2(a1, 256, 6, v6, a1 + 80);
    }
  }
}

void sub_100006FC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

__n128 initializeWithTake for InviteLoadingView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000701C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10000703C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1000347E0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100031358);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000347E0);
  }
}

uint64_t sub_1000070B8(uint64_t *a1)
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

uint64_t sub_1000070FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000070B8(&qword_1000347F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007144(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000070B8(&qword_1000347F0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 32);
  v8 = *(_BYTE *)(v1 + 40);
  v9 = v1 + ((v4 + 41) & ~v4);
  v10 = (_QWORD *)swift_task_alloc(dword_1000347FC);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_100008348;
  return sub_100005CBC(a1, v5, v6, v7, v8, v9);
}

BOOL sub_1000071E8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_1000071FC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100007208(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100007218(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000727C;
  return v6(a1);
}

uint64_t sub_10000727C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000072C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003480C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100008348;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100034808 + dword_100034808))(a1, v4);
}

uint64_t sub_100007338(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InviteMessageDetails(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000737C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000073C0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000073FC(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_100007420(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100007440@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100007468(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_100007658(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
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
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_100007620(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100007658(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000078E0();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_1000070B8(&qword_100034858);
          v13 = sub_100007860(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100007620(0, &qword_100034850, NSLayoutConstraint_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_100007860(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100007970(v6, a2, a3);
  return sub_1000078B4;
}

void sub_1000078B4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_1000078E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034860;
  if (!qword_100034860)
  {
    v1 = sub_10000792C(&qword_100034858);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100034860);
  }
  return result;
}

uint64_t sub_10000792C(uint64_t *a1)
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

void (*sub_100007970(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
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
    return sub_1000079DC;
  }
  __break(1u);
  return result;
}

void sub_1000079DC(id *a1)
{

}

uint64_t sub_1000079E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000070B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007A28(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_100007A90;
  return v5(v2 + 32);
}

uint64_t sub_100007A90()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 24));
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_100007AE0(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  _QWORD v28[2];
  void *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;
  _QWORD aBlock[5];
  uint64_t v34;
  char v35[24];

  v4 = type metadata accessor for Logger(0);
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  v5 = __chkstk_darwin(v4);
  v28[1] = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  __chkstk_darwin(v7);
  v9 = (char *)v28 - v8;
  v10 = sub_1000070B8(&qword_100034818);
  __chkstk_darwin(v10);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for InviteMessageDetails(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_allocObject(&unk_1000313E8, 24, 7);
  *(_QWORD *)(v17 + 16) = a2;
  v29 = a1;
  v18 = (uint64_t)a1 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails;
  swift_beginAccess(v18, v35, 0, 0);
  sub_1000079E4(v18, (uint64_t)v12, &qword_100034818);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
  {
    sub_100007338((uint64_t)v12, (uint64_t)v16);
    __asm { BR              X10 }
  }
  _Block_copy(a2);
  v19 = sub_100008080((uint64_t)v12, &qword_100034818);
  v20 = static FamilyLogger.extension.getter(v19);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Snapshot fallback, no bubble", v23, 2u);
    swift_slowDealloc(v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  aBlock[4] = sub_100008058;
  v34 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005C10;
  aBlock[3] = &unk_100031400;
  v24 = _Block_copy(aBlock);
  v25 = v34;
  swift_retain(v17);
  swift_release(v25);
  v26 = (objc_class *)type metadata accessor for MessagesViewController(0);
  v32.receiver = v29;
  v32.super_class = v26;
  objc_msgSendSuper2(&v32, "updateSnapshotWithCompletionBlock:", v24);
  _Block_release(v24);
  return swift_release(v17);
}

uint64_t sub_100008034()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008058()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100008068(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008078(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100008080(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000070B8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000080BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000070B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(sub_1000070B8(&qword_1000347F0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 41) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000081AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000070B8(&qword_1000347F0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 32);
  v8 = *(_BYTE *)(v1 + 40);
  v9 = v1 + ((v4 + 41) & ~v4);
  v10 = (_QWORD *)swift_task_alloc(dword_1000347FC);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_10000824C;
  return sub_100005CBC(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_10000824C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100008294(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000082B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000082D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003487C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000824C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100034878 + dword_100034878))(a1, v4);
}

uint64_t sub_10000835C(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *__dst;
  int *v61;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v58 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v58;
    v57 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v57;
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    v56 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v56;
    v55 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v55;
    v54 = a2[15];
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v54;
    v53 = a2[17];
    *(_QWORD *)(a1 + 128) = a2[16];
    *(_QWORD *)(a1 + 136) = v53;
    v52 = a2[19];
    *(_QWORD *)(a1 + 144) = a2[18];
    *(_QWORD *)(a1 + 152) = v52;
    v51 = a2[21];
    *(_QWORD *)(a1 + 160) = a2[20];
    *(_QWORD *)(a1 + 168) = v51;
    v50 = a2[23];
    *(_QWORD *)(a1 + 176) = a2[22];
    *(_QWORD *)(a1 + 184) = v50;
    v49 = a2[25];
    *(_QWORD *)(a1 + 192) = a2[24];
    *(_QWORD *)(a1 + 200) = v49;
    v48 = a2[27];
    *(_QWORD *)(a1 + 208) = a2[26];
    *(_QWORD *)(a1 + 216) = v48;
    v59 = a2[28];
    *(_QWORD *)(a1 + 224) = v59;
    *(_BYTE *)(a1 + 232) = *((_BYTE *)a2 + 232);
    *(_BYTE *)(a1 + 233) = *((_BYTE *)a2 + 233);
    *(_BYTE *)(a1 + 234) = *((_BYTE *)a2 + 234);
    v9 = a2[31];
    *(_QWORD *)(a1 + 240) = a2[30];
    *(_QWORD *)(a1 + 248) = v9;
    v10 = a2[33];
    *(_QWORD *)(a1 + 256) = a2[32];
    *(_QWORD *)(a1 + 264) = v10;
    v61 = (int *)type metadata accessor for InviteMessageDetails(0);
    v11 = v61[24];
    __dst = (void *)(v4 + v11);
    v47 = (char *)a2 + v11;
    v12 = type metadata accessor for URL(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v58);
    swift_bridgeObjectRetain(v57);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v56);
    swift_bridgeObjectRetain(v55);
    swift_bridgeObjectRetain(v54);
    swift_bridgeObjectRetain(v53);
    swift_bridgeObjectRetain(v52);
    swift_bridgeObjectRetain(v51);
    swift_bridgeObjectRetain(v50);
    swift_bridgeObjectRetain(v49);
    swift_bridgeObjectRetain(v48);
    swift_bridgeObjectRetain(v59);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    if (v14(v47, 1, v12))
    {
      v15 = sub_1000070B8(&qword_100034868);
      memcpy(__dst, v47, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(__dst, v47, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v17 = v61[25];
    v18 = (void *)(v4 + v17);
    v19 = (char *)a2 + v17;
    if (v14((char *)a2 + v17, 1, v12))
    {
      v20 = sub_1000070B8(&qword_100034868);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v18, v19, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v18, 0, 1, v12);
    }
    v21 = v61[26];
    v22 = (void *)(v4 + v21);
    v23 = (char *)a2 + v21;
    v24 = type metadata accessor for Date(0);
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      v26 = sub_1000070B8(&qword_1000347F0);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    *(_BYTE *)(v4 + v61[27]) = *((_BYTE *)a2 + v61[27]);
    v27 = a3[5];
    v28 = a3[6];
    v29 = v4 + v27;
    v30 = (uint64_t)a2 + v27;
    *(_QWORD *)v29 = *(_QWORD *)v30;
    v31 = *(_OWORD *)((char *)a2 + v28);
    *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
    *(_OWORD *)(v4 + v28) = v31;
    v32 = a3[7];
    v33 = v4 + v32;
    v34 = (uint64_t)a2 + v32;
    v35 = *(_OWORD *)((char *)a2 + v32 + 24);
    *(_OWORD *)(v4 + v32 + 24) = v35;
    v36 = v35;
    v37 = **(void (***)(uint64_t, uint64_t, uint64_t))(v35 - 8);
    v38 = (id)v31;
    v37(v33, v34, v36);
    v39 = a3[8];
    v40 = a3[9];
    v41 = v4 + v39;
    v42 = (uint64_t)a2 + v39;
    *(_BYTE *)v41 = *(_BYTE *)v42;
    v43 = *(_QWORD *)(v42 + 8);
    *(_QWORD *)(v41 + 8) = v43;
    v44 = v4 + v40;
    v45 = (uint64_t)a2 + v40;
    *(_BYTE *)v44 = *(_BYTE *)v45;
    v16 = *(_QWORD *)(v45 + 8);
    *(_QWORD *)(v44 + 8) = v16;
    *(_QWORD *)(v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    swift_retain(v43);
  }
  swift_retain(v16);
  return v4;
}

uint64_t sub_10000877C(_QWORD *a1, int *a2)
{
  int *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[13]);
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(a1[19]);
  swift_bridgeObjectRelease(a1[21]);
  swift_bridgeObjectRelease(a1[23]);
  swift_bridgeObjectRelease(a1[25]);
  swift_bridgeObjectRelease(a1[27]);
  swift_bridgeObjectRelease(a1[28]);
  swift_bridgeObjectRelease(a1[31]);
  swift_bridgeObjectRelease(a1[33]);
  v4 = (int *)type metadata accessor for InviteMessageDetails(0);
  v5 = (char *)a1 + v4[24];
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  v9 = (char *)a1 + v4[25];
  if (!v8(v9, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v10 = (char *)a1 + v4[26];
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);

  sub_100008294((_QWORD *)((char *)a1 + a2[7]));
  swift_release(*(_QWORD *)((char *)a1 + a2[8] + 8));
  return swift_release(*(_QWORD *)((char *)a1 + a2[9] + 8));
}

uint64_t sub_100008928(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *__dst;
  int *v60;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v57 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v57;
  v56 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v56;
  v55 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v55;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v54 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v54;
  v53 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v53;
  v52 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v52;
  v51 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v51;
  v50 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v50;
  v49 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v49;
  v48 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v48;
  v47 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v47;
  v58 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 224) = v58;
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v8 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v8;
  v9 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v9;
  v60 = (int *)type metadata accessor for InviteMessageDetails(0);
  v10 = v60[24];
  __dst = (void *)(a1 + v10);
  v46 = (const void *)(a2 + v10);
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v57);
  swift_bridgeObjectRetain(v56);
  swift_bridgeObjectRetain(v55);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v54);
  swift_bridgeObjectRetain(v53);
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRetain(v51);
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRetain(v49);
  swift_bridgeObjectRetain(v48);
  swift_bridgeObjectRetain(v47);
  swift_bridgeObjectRetain(v58);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  if (v13(v46, 1, v11))
  {
    v14 = sub_1000070B8(&qword_100034868);
    memcpy(__dst, v46, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v46, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v15 = v60[25];
  v16 = (void *)(a1 + v15);
  v17 = (const void *)(a2 + v15);
  if (v13((const void *)(a2 + v15), 1, v11))
  {
    v18 = sub_1000070B8(&qword_100034868);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v16, v17, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
  }
  v19 = v60[26];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = type metadata accessor for Date(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = sub_1000070B8(&qword_1000347F0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  *(_BYTE *)(a1 + v60[27]) = *(_BYTE *)(a2 + v60[27]);
  v25 = a3[5];
  v26 = a3[6];
  v27 = a1 + v25;
  v28 = a2 + v25;
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v29 = *(_OWORD *)(a2 + v26);
  *(_BYTE *)(v27 + 8) = *(_BYTE *)(v28 + 8);
  *(_OWORD *)(a1 + v26) = v29;
  v30 = a3[7];
  v31 = a1 + v30;
  v32 = a2 + v30;
  v33 = *(_OWORD *)(a2 + v30 + 24);
  *(_OWORD *)(a1 + v30 + 24) = v33;
  v34 = v33;
  v35 = **(void (***)(uint64_t, uint64_t, uint64_t))(v33 - 8);
  v36 = (id)v29;
  v35(v31, v32, v34);
  v37 = a3[8];
  v38 = a3[9];
  v39 = a1 + v37;
  v40 = a2 + v37;
  *(_BYTE *)v39 = *(_BYTE *)v40;
  v41 = *(_QWORD *)(v40 + 8);
  *(_QWORD *)(v39 + 8) = v41;
  v42 = a1 + v38;
  v43 = a2 + v38;
  *(_BYTE *)v42 = *(_BYTE *)v43;
  v44 = *(_QWORD *)(v43 + 8);
  *(_QWORD *)(v42 + 8) = v44;
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_retain(v41);
  swift_retain(v44);
  return a1;
}

uint64_t sub_100008D20(uint64_t a1, uint64_t a2, int *a3)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(void *, uint64_t, uint64_t);
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(void *, uint64_t, uint64_t);
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v12 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v18 = *(_QWORD *)(a2 + 104);
  v19 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v20 = *(_QWORD *)(a2 + 120);
  v21 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v22 = *(_QWORD *)(a2 + 136);
  v23 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v24 = *(_QWORD *)(a2 + 152);
  v25 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v26 = *(_QWORD *)(a2 + 168);
  v27 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  v28 = *(_QWORD *)(a2 + 184);
  v29 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v30 = *(_QWORD *)(a2 + 200);
  v31 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v32 = *(_QWORD *)(a2 + 216);
  v33 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  v34 = *(_QWORD *)(a2 + 224);
  v35 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  v36 = *(_QWORD *)(a2 + 248);
  v37 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 248) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  v38 = *(_QWORD *)(a2 + 264);
  v39 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 264) = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease(v39);
  v40 = (int *)type metadata accessor for InviteMessageDetails(0);
  v41 = v40[24];
  v42 = (void *)(a1 + v41);
  v43 = (void *)(a2 + v41);
  v44 = type metadata accessor for URL(0);
  v45 = *(_QWORD *)(v44 - 8);
  v46 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v45 + 48);
  v47 = v46(v42, 1, v44);
  v48 = v46(v43, 1, v44);
  if (v47)
  {
    if (!v48)
    {
      (*(void (**)(void *, void *, uint64_t))(v45 + 16))(v42, v43, v44);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v48)
  {
    (*(void (**)(void *, uint64_t))(v45 + 8))(v42, v44);
LABEL_6:
    v49 = sub_1000070B8(&qword_100034868);
    memcpy(v42, v43, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v45 + 24))(v42, v43, v44);
LABEL_7:
  v50 = v40[25];
  v51 = (void *)(a1 + v50);
  v52 = (void *)(a2 + v50);
  v53 = v46((void *)(a1 + v50), 1, v44);
  v54 = v46(v52, 1, v44);
  if (v53)
  {
    if (!v54)
    {
      (*(void (**)(void *, void *, uint64_t))(v45 + 16))(v51, v52, v44);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v51, 0, 1, v44);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v54)
  {
    (*(void (**)(void *, uint64_t))(v45 + 8))(v51, v44);
LABEL_12:
    v55 = sub_1000070B8(&qword_100034868);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v45 + 24))(v51, v52, v44);
LABEL_13:
  v56 = v40[26];
  v57 = (void *)(a1 + v56);
  v58 = (void *)(a2 + v56);
  v59 = type metadata accessor for Date(0);
  v60 = *(_QWORD *)(v59 - 8);
  v61 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v60 + 48);
  v62 = v61(v57, 1, v59);
  v63 = v61(v58, 1, v59);
  if (!v62)
  {
    if (!v63)
    {
      (*(void (**)(void *, void *, uint64_t))(v60 + 24))(v57, v58, v59);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v60 + 8))(v57, v59);
    goto LABEL_18;
  }
  if (v63)
  {
LABEL_18:
    v64 = sub_1000070B8(&qword_1000347F0);
    memcpy(v57, v58, *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v60 + 16))(v57, v58, v59);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v57, 0, 1, v59);
LABEL_19:
  *(_BYTE *)(a1 + v40[27]) = *(_BYTE *)(a2 + v40[27]);
  v65 = a3[5];
  v66 = a1 + v65;
  v67 = (uint64_t *)(a2 + v65);
  v68 = *v67;
  *(_BYTE *)(v66 + 8) = *((_BYTE *)v67 + 8);
  *(_QWORD *)v66 = v68;
  v69 = a3[6];
  v70 = a1 + v69;
  v71 = a2 + v69;
  v72 = *(void **)v71;
  v73 = *(_QWORD *)(v71 + 8);
  v74 = *(void **)v70;
  *(_QWORD *)v70 = *(_QWORD *)v71;
  v75 = v72;

  *(_QWORD *)(v70 + 8) = v73;
  sub_1000092A8((_QWORD *)(a1 + a3[7]), (_QWORD *)(a2 + a3[7]));
  v76 = a3[8];
  v77 = a1 + v76;
  v78 = a2 + v76;
  *(_BYTE *)v77 = *(_BYTE *)v78;
  v79 = *(_QWORD *)(v77 + 8);
  v80 = *(_QWORD *)(v78 + 8);
  *(_QWORD *)(v77 + 8) = v80;
  swift_retain(v80);
  swift_release(v79);
  v81 = a3[9];
  v82 = a1 + v81;
  v83 = a2 + v81;
  *(_BYTE *)v82 = *(_BYTE *)v83;
  v84 = *(_QWORD *)(v82 + 8);
  v85 = *(_QWORD *)(v83 + 8);
  *(_QWORD *)(v82 + 8) = v85;
  swift_retain(v85);
  swift_release(v84);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  return a1;
}

_QWORD *sub_1000092A8(_QWORD *result, _QWORD *a2)
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

uint64_t sub_100009410(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(const void *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const void *v28;
  uint64_t v29;
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
  __int128 v40;
  uint64_t v41;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  v10 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v10;
  v11 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v11;
  v12 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v12;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  v13 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v13;
  v14 = (int *)type metadata accessor for InviteMessageDetails(0);
  v15 = v14[24];
  v16 = (void *)(a1 + v15);
  v17 = (const void *)(a2 + v15);
  v18 = type metadata accessor for URL(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v20(v17, 1, v18))
  {
    v21 = sub_1000070B8(&qword_100034868);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v22 = v14[25];
  v23 = (void *)(a1 + v22);
  v24 = (const void *)(a2 + v22);
  if (v20((const void *)(a2 + v22), 1, v18))
  {
    v25 = sub_1000070B8(&qword_100034868);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v23, v24, v18);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v23, 0, 1, v18);
  }
  v26 = v14[26];
  v27 = (void *)(a1 + v26);
  v28 = (const void *)(a2 + v26);
  v29 = type metadata accessor for Date(0);
  v30 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    v31 = sub_1000070B8(&qword_1000347F0);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v30 + 32))(v27, v28, v29);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  *(_BYTE *)(a1 + v14[27]) = *(_BYTE *)(a2 + v14[27]);
  v32 = a3[5];
  v33 = a3[6];
  v34 = a1 + v32;
  v35 = a2 + v32;
  *(_QWORD *)v34 = *(_QWORD *)v35;
  *(_BYTE *)(v34 + 8) = *(_BYTE *)(v35 + 8);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  v36 = a3[7];
  v37 = a3[8];
  v38 = a1 + v36;
  v39 = a2 + v36;
  v40 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)v38 = *(_OWORD *)v39;
  *(_OWORD *)(v38 + 16) = v40;
  *(_QWORD *)(v38 + 32) = *(_QWORD *)(v39 + 32);
  *(_OWORD *)(a1 + v37) = *(_OWORD *)(a2 + v37);
  v41 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v41) = *(_QWORD *)(a2 + v41);
  return a1;
}

uint64_t sub_10000969C(uint64_t a1, uint64_t a2, int *a3)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(void *, uint64_t, uint64_t);
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(void *, uint64_t, uint64_t);
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v16;
  swift_bridgeObjectRelease(v17);
  v18 = *(_QWORD *)(a2 + 104);
  v19 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v18;
  swift_bridgeObjectRelease(v19);
  v20 = *(_QWORD *)(a2 + 120);
  v21 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v20;
  swift_bridgeObjectRelease(v21);
  v22 = *(_QWORD *)(a2 + 136);
  v23 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v22;
  swift_bridgeObjectRelease(v23);
  v24 = *(_QWORD *)(a2 + 152);
  v25 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v24;
  swift_bridgeObjectRelease(v25);
  v26 = *(_QWORD *)(a2 + 168);
  v27 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v26;
  swift_bridgeObjectRelease(v27);
  v28 = *(_QWORD *)(a2 + 184);
  v29 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v28;
  swift_bridgeObjectRelease(v29);
  v30 = *(_QWORD *)(a2 + 200);
  v31 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v30;
  swift_bridgeObjectRelease(v31);
  v32 = *(_QWORD *)(a2 + 216);
  v33 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v32;
  swift_bridgeObjectRelease(v33);
  v34 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRelease(v34);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v35 = *(_QWORD *)(a2 + 248);
  v36 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v35;
  swift_bridgeObjectRelease(v36);
  v37 = *(_QWORD *)(a2 + 264);
  v38 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v37;
  swift_bridgeObjectRelease(v38);
  v39 = (int *)type metadata accessor for InviteMessageDetails(0);
  v40 = v39[24];
  v41 = (void *)(a1 + v40);
  v42 = (void *)(a2 + v40);
  v43 = type metadata accessor for URL(0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v44 + 48);
  v46 = v45(v41, 1, v43);
  v47 = v45(v42, 1, v43);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(void *, void *, uint64_t))(v44 + 32))(v41, v42, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v47)
  {
    (*(void (**)(void *, uint64_t))(v44 + 8))(v41, v43);
LABEL_6:
    v48 = sub_1000070B8(&qword_100034868);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v44 + 40))(v41, v42, v43);
LABEL_7:
  v49 = v39[25];
  v50 = (void *)(a1 + v49);
  v51 = (void *)(a2 + v49);
  v52 = v45((void *)(a1 + v49), 1, v43);
  v53 = v45(v51, 1, v43);
  if (v52)
  {
    if (!v53)
    {
      (*(void (**)(void *, void *, uint64_t))(v44 + 32))(v50, v51, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v50, 0, 1, v43);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v53)
  {
    (*(void (**)(void *, uint64_t))(v44 + 8))(v50, v43);
LABEL_12:
    v54 = sub_1000070B8(&qword_100034868);
    memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v44 + 40))(v50, v51, v43);
LABEL_13:
  v55 = v39[26];
  v56 = (void *)(a1 + v55);
  v57 = (void *)(a2 + v55);
  v58 = type metadata accessor for Date(0);
  v59 = *(_QWORD *)(v58 - 8);
  v60 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v59 + 48);
  v61 = v60(v56, 1, v58);
  v62 = v60(v57, 1, v58);
  if (!v61)
  {
    if (!v62)
    {
      (*(void (**)(void *, void *, uint64_t))(v59 + 40))(v56, v57, v58);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v59 + 8))(v56, v58);
    goto LABEL_18;
  }
  if (v62)
  {
LABEL_18:
    v63 = sub_1000070B8(&qword_1000347F0);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v59 + 32))(v56, v57, v58);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
LABEL_19:
  *(_BYTE *)(a1 + v39[27]) = *(_BYTE *)(a2 + v39[27]);
  v64 = a3[5];
  v65 = a3[6];
  v66 = a1 + v64;
  v67 = a2 + v64;
  *(_QWORD *)v66 = *(_QWORD *)v67;
  *(_BYTE *)(v66 + 8) = *(_BYTE *)(v67 + 8);
  v68 = a1 + v65;
  v69 = *(_QWORD *)(a2 + v65 + 8);
  v70 = *(void **)(a1 + v65);
  *(_QWORD *)(a1 + v65) = *(_QWORD *)(a2 + v65);

  *(_QWORD *)(v68 + 8) = v69;
  v71 = a3[7];
  v72 = a1 + v71;
  v73 = a2 + v71;
  sub_100008294((_QWORD *)(a1 + v71));
  v74 = *(_OWORD *)(v73 + 16);
  *(_OWORD *)v72 = *(_OWORD *)v73;
  *(_OWORD *)(v72 + 16) = v74;
  *(_QWORD *)(v72 + 32) = *(_QWORD *)(v73 + 32);
  v75 = a3[8];
  v76 = a1 + v75;
  v77 = a2 + v75;
  *(_BYTE *)v76 = *(_BYTE *)v77;
  v78 = *(_QWORD *)(v76 + 8);
  *(_QWORD *)(v76 + 8) = *(_QWORD *)(v77 + 8);
  swift_release(v78);
  v79 = a3[9];
  v80 = a1 + v79;
  v81 = a2 + v79;
  *(_BYTE *)v80 = *(_BYTE *)v81;
  v82 = *(_QWORD *)(v80 + 8);
  *(_QWORD *)(v80 + 8) = *(_QWORD *)(v81 + 8);
  swift_release(v82);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_100009B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009B24);
}

uint64_t sub_100009B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for InviteMessageDetails(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_100009BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009BB0);
}

uint64_t sub_100009BB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for InviteMessageDetails(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 24) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for InviteMessageView(uint64_t a1)
{
  return sub_100014350(a1, qword_1000348E0, (uint64_t)&nominal type descriptor for InviteMessageView);
}

uint64_t sub_100009C40(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  result = type metadata accessor for InviteMessageDetails(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\t";
    v4[2] = &unk_10002A050;
    v4[3] = &unk_10002A068;
    v4[4] = &unk_10002A050;
    v4[5] = &unk_10002A050;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100009CD8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B798, 1);
}

uint64_t sub_100009CE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, int a7@<W6>, uint64_t a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  double v30;
  uint64_t v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v35;

  v32 = a7;
  v15 = type metadata accessor for FamilyFeatureFlags(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin();
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019ECC(a1, a8, type metadata accessor for InviteMessageDetails);
  v19 = (int *)type metadata accessor for InviteMessageView(0);
  v20 = a8 + v19[5];
  *(_QWORD *)v20 = a2;
  *(_BYTE *)(v20 + 8) = a3 & 1;
  v21 = (_QWORD *)(a8 + v19[6]);
  *v21 = a4;
  v21[1] = a5;
  v22 = (uint64_t *)(a8 + v19[7]);
  v23 = type metadata accessor for FamilyFetcher();
  v24 = swift_allocObject(v23, 16, 7);
  v22[3] = v23;
  v22[4] = (uint64_t)&off_100031960;
  *v22 = v24;
  v25 = a8 + v19[8];
  v33 = a6;
  State.init(wrappedValue:)(&v34, &v33, &type metadata for Bool);
  v26 = v35;
  *(_BYTE *)v25 = v34;
  *(_QWORD *)(v25 + 8) = v26;
  v27 = a8 + v19[9];
  v33 = v32;
  State.init(wrappedValue:)(&v34, &v33, &type metadata for Bool);
  v28 = v35;
  *(_BYTE *)v27 = v34;
  *(_QWORD *)(v27 + 8) = v28;
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, enum case for FamilyFeatureFlags.familyPrivacyDisclosure(_:), v15);
  LOBYTE(v27) = static FamilyFeatureFlags.enabled(_:)(v18);
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  v30 = 0.0;
  if ((v27 & 1) != 0)
    v30 = 3.0;
  *(double *)(a8 + v19[10]) = v30;
  return result;
}

uint64_t sub_100009EA4(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aAccepteddeclin[v2];
  v4 = *(_QWORD *)((char *)&unk_10002A528 + v2);
  v5 = 8 * a2;
  v6 = *(_QWORD *)((char *)&unk_10002A528 + v5);
  if (v3 == *(_QWORD *)&aAccepteddeclin[v5] && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

uint64_t sub_100009F28(uint64_t a1)
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

uint64_t sub_100009F54(uint64_t a1, int a2)
{
  **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

void sub_100009F68(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  int v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v36 = a1;
  v35 = type metadata accessor for InviteMessageView(0);
  __chkstk_darwin(v35);
  v2 = sub_1000070B8(&qword_100034930);
  __chkstk_darwin(v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000070B8(&qword_100034938);
  __chkstk_darwin(v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1000070B8(&qword_100034940);
  __chkstk_darwin(v30);
  v31 = sub_1000070B8(&qword_100034948);
  __chkstk_darwin(v31);
  v8 = sub_1000070B8(&qword_100034950);
  __chkstk_darwin(v8);
  v34 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_1000070B8(&qword_100034958);
  v10 = __chkstk_darwin(v32);
  v33 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v4 = static HorizontalAlignment.leading.getter(v10);
  *((_QWORD *)v4 + 1) = 0x4028000000000000;
  v4[16] = 0;
  v12 = sub_1000070B8(&qword_100034960);
  v13 = v1;
  v14 = sub_10000A52C(v1, &v4[*(int *)(v12 + 44)]);
  v15 = static Edge.Set.leading.getter(v14);
  v16 = static Edge.Set.trailing.getter();
  v17 = Edge.Set.init(rawValue:)(0);
  v18 = Edge.Set.init(rawValue:)(v17);
  if (Edge.Set.init(rawValue:)(v18 & v15) != v15)
    v17 = Edge.Set.init(rawValue:)(v17 | v15);
  v19 = Edge.Set.init(rawValue:)(v17);
  if (Edge.Set.init(rawValue:)(v19 & v16) != v16)
    LOBYTE(v17) = Edge.Set.init(rawValue:)(v17 | v16);
  v20 = EdgeInsets.init(_all:)(16.0);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  sub_1000079E4((uint64_t)v4, (uint64_t)v7, &qword_100034930);
  v27 = &v7[*(int *)(v5 + 36)];
  *v27 = v17;
  *((double *)v27 + 1) = v20;
  *((_QWORD *)v27 + 2) = v22;
  *((_QWORD *)v27 + 3) = v24;
  *((_QWORD *)v27 + 4) = v26;
  v27[40] = 0;
  v28 = sub_100008080((uint64_t)v4, &qword_100034930);
  static Edge.Set.bottom.getter(v28);
  __asm { BR              X10 }
}

uint64_t sub_10000A258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;

  v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64656E696C636544, v1, 0x676E69646E6550, 0xE700000000000000, 0);
  swift_bridgeObjectRelease(v1);
  sub_10000737C(v3, v2, type metadata accessor for InviteMessageView);
  if ((v8 & 1) != 0)
  {
    v9 = *(_BYTE *)(v2 + 233);
    sub_1000073C0(v2, type metadata accessor for InviteMessageView);
    v10 = 16.0;
    if ((v9 & 1) == 0)
      goto LABEL_6;
  }
  else
  {
    sub_1000073C0(v2, type metadata accessor for InviteMessageView);
  }
  v10 = 10.0;
LABEL_6:
  v11 = EdgeInsets.init(_all:)(v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  sub_1000079E4(v0, v6, &qword_100034938);
  v18 = v6 + *(int *)(*(_QWORD *)(v7 - 168) + 36);
  *(_BYTE *)v18 = v4;
  *(double *)(v18 + 8) = v11;
  *(_QWORD *)(v18 + 16) = v13;
  *(_QWORD *)(v18 + 24) = v15;
  *(_QWORD *)(v18 + 32) = v17;
  *(_BYTE *)(v18 + 40) = 0;
  v19 = sub_100008080(v0, &qword_100034938);
  v20 = static Edge.Set.top.getter(v19);
  v21 = EdgeInsets.init(_all:)(12.0);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  sub_1000079E4(v6, v5, &qword_100034940);
  v28 = v5 + *(int *)(*(_QWORD *)(v7 - 160) + 36);
  *(_BYTE *)v28 = v20;
  *(double *)(v28 + 8) = v21;
  *(_QWORD *)(v28 + 16) = v23;
  *(_QWORD *)(v28 + 24) = v25;
  *(_QWORD *)(v28 + 32) = v27;
  *(_BYTE *)(v28 + 40) = 0;
  v29 = sub_100008080(v6, &qword_100034940);
  v30 = v3 + *(int *)(*(_QWORD *)(v7 - 128) + 20);
  v31 = *(double *)v30;
  v32 = *(_BYTE *)(v30 + 8);
  v33 = static Alignment.center.getter(v29);
  v34 = *(_QWORD *)(v7 - 136);
  sub_10000C544(0.0, 1, 0.0, 1, v31, v32, 0.0, 1, v34, 0.0, 1, 0.0, 1, v33, v35, (uint64_t)&qword_100034948, (void (*)(uint64_t, uint64_t, uint64_t))sub_1000079E4, &qword_100034950);
  sub_100008080(v5, &qword_100034948);
  v36 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray5Color");
  v37 = Color.init(uiColor:)(v36);
  v38 = ((uint64_t (*)(void))static Edge.Set.all.getter)();
  v39 = *(_QWORD *)(v7 - 144);
  sub_1000079E4(v34, v39, &qword_100034950);
  v40 = v39 + *(int *)(*(_QWORD *)(v7 - 152) + 36);
  *(_QWORD *)v40 = v37;
  *(_BYTE *)(v40 + 8) = v38;
  sub_100008080(v34, &qword_100034950);
  return sub_10001B1B8(v39, *(_QWORD *)(v7 - 120), &qword_100034958);
}

uint64_t sub_10000A52C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  int *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char v81;
  char v82;
  __int128 v83;
  __int128 v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  BOOL v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  _OWORD *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(char *, char *, uint64_t);
  char *v142;
  uint64_t v143;
  uint64_t v144;
  void (*v145)(char *, char *, uint64_t);
  char *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  int *v151;
  uint64_t v152;
  void (*v153)(char *, uint64_t);
  void (*v154)(char *, uint64_t);
  _QWORD v156[7];
  uint64_t v157;
  char *v158;
  uint64_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  char *v177;
  uint64_t v178;
  char *v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  char *v194;
  uint64_t v195;
  char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  __int128 v200;
  _BYTE v201[32];
  _BYTE v202[32];
  __int128 v203;
  __int128 v204;
  __int128 v205;
  uint64_t v206;

  v188 = a2;
  v159 = sub_1000070B8(&qword_100034968);
  v3 = __chkstk_darwin(v159);
  v156[2] = (char *)v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v156[3] = (char *)v156 - v5;
  v162 = sub_1000070B8(&qword_100034970);
  __chkstk_darwin(v162);
  v164 = (uint64_t)v156 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = sub_1000070B8(&qword_100034978);
  __chkstk_darwin(v157);
  v158 = (char *)v156 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v163 = sub_1000070B8(&qword_100034980);
  __chkstk_darwin(v163);
  v160 = (char *)v156 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v175 = sub_1000070B8(&qword_100034988);
  v9 = __chkstk_darwin(v175);
  v161 = (char *)v156 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v165 = (uint64_t)v156 - v11;
  v173 = sub_1000070B8(&qword_100034990);
  __chkstk_darwin(v173);
  v174 = (uint64_t)v156 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v170 = type metadata accessor for InviteActionsView(0);
  __chkstk_darwin(v170);
  v156[6] = (char *)v156 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v167 = sub_1000070B8(&qword_100034998);
  __chkstk_darwin(v167);
  v169 = (char *)v156 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v181 = type metadata accessor for InviteMessageView(0);
  v15 = __chkstk_darwin(v181);
  v156[0] = (char *)v156 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v156[1] = (char *)v156 - v18;
  v19 = __chkstk_darwin(v17);
  v156[4] = (char *)v156 - v20;
  v21 = __chkstk_darwin(v19);
  v166 = (uint64_t)v156 - v22;
  __chkstk_darwin(v21);
  v156[5] = (char *)v156 - v23;
  v171 = sub_1000070B8(&qword_1000349A0);
  __chkstk_darwin(v171);
  v168 = (char *)v156 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v189 = sub_1000070B8(&qword_1000349A8);
  v183 = *(_QWORD *)(v189 - 8);
  v25 = __chkstk_darwin(v189);
  v176 = (char *)v156 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v172 = (uint64_t)v156 - v27;
  v28 = sub_1000070B8(&qword_1000349B0);
  v29 = __chkstk_darwin(v28);
  v187 = (uint64_t)v156 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  v197 = (uint64_t)v156 - v31;
  v184 = type metadata accessor for AccessibilityChildBehavior(0);
  v182 = *(_QWORD *)(v184 - 8);
  __chkstk_darwin(v184);
  v180 = (char *)v156 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v192 = sub_1000070B8(&qword_1000349B8);
  v191 = *(_QWORD *)(v192 - 8);
  v33 = __chkstk_darwin(v192);
  v186 = (char *)v156 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v33);
  v179 = (char *)v156 - v36;
  __chkstk_darwin(v35);
  v193 = (char *)v156 - v37;
  v38 = sub_1000070B8(&qword_1000349C0);
  __chkstk_darwin(v38);
  v177 = (char *)v156 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = sub_1000070B8(&qword_1000349C8);
  v40 = __chkstk_darwin(v178);
  v199 = (uint64_t)v156 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  v198 = (uint64_t)v156 - v42;
  v43 = type metadata accessor for FamilyFeatureFlags(0);
  v44 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v46 = (char *)v156 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = type metadata accessor for SettingsView(0);
  __chkstk_darwin(v47);
  v49 = (char *)v156 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_1000070B8(&qword_1000349D0);
  v51 = *(_QWORD *)(v50 - 8);
  v52 = __chkstk_darwin(v50);
  v54 = (char *)v156 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v52);
  v56 = (char *)v156 - v55;
  v190 = a1;
  sub_10000737C(a1, (uint64_t)v49, type metadata accessor for InviteMessageView);
  sub_10000737C(a1, (uint64_t)&v49[*(int *)(v47 + 20)], type metadata accessor for InviteMessageDetails);
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v46, enum case for FamilyFeatureFlags.familyPrivacyDisclosure(_:), v43);
  LOBYTE(a1) = static FamilyFeatureFlags.enabled(_:)(v46);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v43);
  v57 = sub_1000144C4(&qword_1000349D8, type metadata accessor for SettingsView, (uint64_t)&unk_10002A2F8);
  View.fa_availableIf(condition:)((a1 & 1) == 0, v47, v57);
  sub_1000073C0((uint64_t)v49, type metadata accessor for SettingsView);
  v195 = v51;
  v58 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
  v194 = v56;
  v59 = v56;
  v60 = (int *)v181;
  v196 = v54;
  v185 = v50;
  v58(v59, v54, v50);
  v61 = sub_100014384();
  v62 = (uint64_t)v177;
  v63 = View.accessibilityHidden(_:)(1, &type metadata for FamilyIconView, v61);
  LOBYTE(v47) = static Edge.Set.top.getter(v63);
  v64 = v190;
  v65 = EdgeInsets.init(_all:)(*(double *)(v190 + v60[10]));
  v67 = v66;
  v69 = v68;
  v71 = v70;
  v72 = v199;
  sub_1000079E4(v62, v199, &qword_1000349C0);
  v73 = v72 + *(int *)(v178 + 36);
  *(_BYTE *)v73 = v47;
  *(double *)(v73 + 8) = v65;
  *(_QWORD *)(v73 + 16) = v67;
  *(_QWORD *)(v73 + 24) = v69;
  *(_QWORD *)(v73 + 32) = v71;
  *(_BYTE *)(v73 + 40) = 0;
  sub_100008080(v62, &qword_1000349C0);
  v74 = sub_10001B1B8(v72, v198, &qword_1000349C8);
  v75 = static HorizontalAlignment.leading.getter(v74);
  v76 = sub_10000C038((_QWORD *)v64, (uint64_t)&v200);
  v77 = v201[0];
  v78 = *(_QWORD *)&v201[8];
  v79 = v202[0];
  v80 = *(_QWORD *)&v202[8];
  v81 = v202[16];
  v82 = v202[17];
  v83 = v200;
  v84 = *(_OWORD *)&v201[16];
  v200 = (unint64_t)v75;
  v201[0] = 0;
  *(_OWORD *)&v201[8] = v83;
  v201[24] = v77;
  *(_QWORD *)v202 = v78;
  *(_OWORD *)&v202[8] = v84;
  v202[24] = v79;
  *(_QWORD *)&v203 = v80;
  BYTE8(v203) = v81;
  BYTE9(v203) = v82;
  v85 = v180;
  static AccessibilityChildBehavior.combine.getter(v76);
  v86 = sub_1000070B8(&qword_1000349E8);
  v87 = sub_10001B88C(&qword_1000349F0, &qword_1000349E8, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v88 = v179;
  View.accessibilityElement(children:)(v85, v86, v87);
  v89 = v191;
  (*(void (**)(char *, uint64_t))(v182 + 8))(v85, v184);
  v90 = *(_OWORD *)v202;
  v91 = *(_QWORD *)&v202[16];
  LOBYTE(v85) = v202[24];
  v92 = v203;
  sub_1000143C8(*(uint64_t *)&v201[8], *(uint64_t *)&v201[16], v201[24]);
  swift_bridgeObjectRelease(v90);
  v93 = (char)v85;
  v94 = v64;
  sub_1000143C8(*((uint64_t *)&v90 + 1), v91, v93);
  swift_bridgeObjectRelease(v92);
  v95 = v89;
  (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v193, v88, v192);
  v96 = *(_QWORD *)(v64 + 224);
  v97 = *(_BYTE *)(v64 + *(int *)(type metadata accessor for InviteMessageDetails(0) + 108));
  v184 = v96;
  if ((v97 & 1) != 0)
  {
    v98 = v197;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v183 + 56))(v197, 1, 1, v189);
    swift_bridgeObjectRetain(v96);
  }
  else
  {
    v99 = *(_BYTE *)(v64 + 233) == 1;
    v100 = v183;
    if (v99)
      __asm { BR              X10 }
    v101 = v94 + v60[8];
    v102 = *(_BYTE *)v101;
    v103 = *(_QWORD *)(v101 + 8);
    LOBYTE(v200) = v102;
    *((_QWORD *)&v200 + 1) = v103;
    swift_bridgeObjectRetain(v96);
    sub_1000070B8(&qword_1000349F8);
    State.wrappedValue.getter(&v206);
    v104 = v206;
    v105 = v166;
    sub_10000737C(v94, v166, type metadata accessor for InviteMessageView);
    v106 = (uint64_t)v176;
    if (v104 == 1)
    {
      sub_1000073C0(v105, type metadata accessor for InviteMessageView);
    }
    else
    {
      v107 = v105 + v60[9];
      v108 = *(_BYTE *)v107;
      v109 = *(_QWORD *)(v107 + 8);
      LOBYTE(v200) = v108;
      *((_QWORD *)&v200 + 1) = v109;
      State.wrappedValue.getter(&v206);
      v110 = v206;
      sub_1000073C0(v105, type metadata accessor for InviteMessageView);
      if (v110 != 1)
        __asm { BR              X10 }
    }
    v112 = *(_QWORD *)(v190 + 48);
    v111 = *(_QWORD *)(v190 + 56);
    v113 = swift_bridgeObjectRetain(v111);
    v114 = static Alignment.center.getter(v113);
    sub_10000C398(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v200, 0.0, 1, 0.0, 1, v114, v115, v112, v111);
    swift_bridgeObjectRelease(v111);
    v116 = v203;
    v117 = v158;
    *((_OWORD *)v158 + 4) = *(_OWORD *)&v202[16];
    v117[5] = v116;
    v118 = v205;
    v117[6] = v204;
    v117[7] = v118;
    v119 = *(_OWORD *)v201;
    *v117 = v200;
    v117[1] = v119;
    v120 = *(_OWORD *)v202;
    v117[2] = *(_OWORD *)&v201[16];
    v117[3] = v120;
    swift_storeEnumTagMultiPayload(v117, v157, 0);
    v121 = sub_1000070B8(&qword_100034A50);
    v122 = sub_10001461C();
    v123 = sub_1000146EC();
    v124 = (uint64_t)v160;
    _ConditionalContent<>.init(storage:)(v117, v121, v159, v122, v123);
    v125 = v164;
    sub_1000079E4(v124, v164, &qword_100034980);
    swift_storeEnumTagMultiPayload(v125, v162, 0);
    v126 = sub_1000070B8(&qword_100034A18);
    v127 = sub_100014588();
    v128 = sub_10001445C();
    v129 = (uint64_t)v161;
    _ConditionalContent<>.init(storage:)(v125, v163, v126, v127, v128);
    sub_100008080(v124, &qword_100034980);
    v130 = sub_1000070B8(&qword_100034A00);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v130 - 8) + 56))(v129, 0, 1, v130);
    v131 = v165;
    sub_10001B1B8(v129, v165, &qword_100034988);
    v132 = v131;
    v133 = v131;
    v134 = v174;
    sub_1000079E4(v132, v174, &qword_100034988);
    swift_storeEnumTagMultiPayload(v134, v173, 1);
    v135 = sub_1000143D8();
    v136 = sub_100014504();
    _ConditionalContent<>.init(storage:)(v134, v171, v175, v135, v136);
    sub_100008080(v133, &qword_100034988);
    v137 = v197;
    v138 = v189;
    v139 = sub_1000070B8(&qword_100034A68);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v139 - 8) + 56))(v106, 0, 1, v139);
    v140 = v172;
    sub_10001B1B8(v106, v172, &qword_1000349A8);
    sub_10001B1B8(v140, v137, &qword_1000349A8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v100 + 56))(v137, 0, 1, v138);
    v98 = v137;
  }
  v141 = *(void (**)(char *, char *, uint64_t))(v195 + 16);
  v142 = v196;
  v143 = v185;
  v141(v196, v194, v185);
  v144 = v199;
  sub_1000079E4(v198, v199, &qword_1000349C8);
  v145 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
  v146 = v186;
  v147 = v193;
  v148 = v192;
  v145(v186, v193, v192);
  v149 = v187;
  sub_1000079E4(v98, v187, &qword_1000349B0);
  v150 = v188;
  v141(v188, v142, v143);
  v151 = (int *)sub_1000070B8(&qword_100034A70);
  sub_1000079E4(v144, (uint64_t)&v150[v151[12]], &qword_1000349C8);
  v145(&v150[v151[16]], v146, v148);
  v152 = v184;
  *(_QWORD *)&v150[v151[20]] = v184;
  sub_1000079E4(v149, (uint64_t)&v150[v151[24]], &qword_1000349B0);
  swift_bridgeObjectRetain(v152);
  sub_100008080(v197, &qword_1000349B0);
  v153 = *(void (**)(char *, uint64_t))(v191 + 8);
  v153(v147, v148);
  sub_100008080(v198, &qword_1000349C8);
  v154 = *(void (**)(char *, uint64_t))(v195 + 8);
  v154(v194, v143);
  sub_100008080(v149, &qword_1000349B0);
  swift_bridgeObjectRelease(v152);
  v153(v146, v148);
  sub_100008080(v199, &qword_1000349C8);
  return ((uint64_t (*)(char *, uint64_t))v154)(v196, v143);
}

uint64_t sub_10000BB38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  v3 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64656E696C636544, v0, 0x6E776F6E6B6E55, 0xE700000000000000, 0);
  swift_bridgeObjectRelease(v0);
  sub_1000073C0(v1, type metadata accessor for InviteMessageView);
  if ((v3 & 1) != 0)
    JUMPOUT(0x10000B628);
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BBF4
                                          + 4 * byte_100029FCA[*(unsigned __int8 *)(*(_QWORD *)(v2 - 368) + 232)]))(0x64656E696C636544);
}

void sub_10000BBF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  swift_bridgeObjectRelease(0xE800000000000000);
  v1 = *(_QWORD *)(v0 - 368);
  v2 = *(_QWORD *)(v0 - 712);
  sub_10000737C(v1, v2, type metadata accessor for InviteMessageView);
  sub_1000073C0(v2, type metadata accessor for InviteMessageView);
  v3 = *(_QWORD *)(v0 - 720);
  sub_10000737C(v1, v3, type metadata accessor for InviteMessageView);
  sub_1000073C0(v3, type metadata accessor for InviteMessageView);
  v4 = *(_QWORD *)(v0 - 680);
  sub_10000737C(*(_QWORD *)(v0 - 368), v4, type metadata accessor for InviteMessageView);
  sub_100015044(v4);
  *(_OWORD *)(v0 - 368) = *(_OWORD *)(v0 - 272);
  *(_OWORD *)(v0 - 432) = *(_OWORD *)(v0 - 256);
  *(_OWORD *)(v0 - 448) = *(_OWORD *)(v0 - 240);
  *(_OWORD *)(v0 - 464) = *(_OWORD *)(v0 - 224);
  v5 = *(_QWORD *)(v0 - 208);
  v6 = *(_BYTE *)(v0 - 200);
  v7 = *(_QWORD *)(v0 - 192);
  LOBYTE(v4) = static Edge.Set.top.getter();
  v8 = EdgeInsets.init(_all:)(4.0);
  *(_BYTE *)(v0 - 128) = v6;
  *(_BYTE *)(v0 - 136) = 0;
  v9 = *(_QWORD *)(v0 - 608);
  v10 = *(_OWORD *)(v0 - 432);
  *(_OWORD *)v9 = *(_OWORD *)(v0 - 368);
  *(_OWORD *)(v9 + 16) = v10;
  v11 = *(_OWORD *)(v0 - 464);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v0 - 448);
  *(_OWORD *)(v9 + 48) = v11;
  *(_QWORD *)(v9 + 64) = v5;
  *(_BYTE *)(v9 + 72) = v6;
  *(_QWORD *)(v9 + 80) = v7;
  *(_BYTE *)(v9 + 88) = v4;
  *(double *)(v9 + 96) = v8;
  *(_QWORD *)(v9 + 104) = v12;
  *(_QWORD *)(v9 + 112) = v13;
  *(_QWORD *)(v9 + 120) = v14;
  *(_BYTE *)(v9 + 128) = 0;
  swift_storeEnumTagMultiPayload(v9, *(_QWORD *)(v0 - 624), 1);
  v15 = sub_1000070B8(&qword_100034A18);
  v16 = sub_100014588();
  v17 = sub_10001445C();
  v18 = *(_QWORD *)(v0 - 600);
  _ConditionalContent<>.init(storage:)(v9, *(_QWORD *)(v0 - 616), v15, v16, v17);
  v19 = sub_1000070B8(&qword_100034A00);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 0, 1, v19);
  JUMPOUT(0x10000B82CLL);
}

void sub_10000BE98()
{
  swift_bridgeObjectRelease(0xE800000000000000);
  JUMPOUT(0x10000BCC8);
}

uint64_t sub_10000BEB4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = _stringCompareWithSmolCheck(_:_:expecting:)(0x676E69646E6550, 0xE700000000000000, 0x64656E696C636544, 0xE800000000000000, 0);
  swift_bridgeObjectRelease(0xE700000000000000);
  sub_1000073C0(*(_QWORD *)(v0 - 712), type metadata accessor for InviteMessageView);
  v2 = *(_QWORD *)(v0 - 720);
  v3 = sub_10000737C(*(_QWORD *)(v0 - 368), v2, type metadata accessor for InviteMessageView);
  if ((v1 & 1) != 0)
    JUMPOUT(0x10000BCF8);
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BF7C + 4 * byte_100029FD4[*(unsigned __int8 *)(v2 + 232)]))(v3);
}

void sub_10000BF7C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v2 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64656E696C636544, v0, 0x64657269707845, 0xE700000000000000, 0);
  swift_bridgeObjectRelease(v0);
  sub_1000073C0(v1, type metadata accessor for InviteMessageView);
  if ((v2 & 1) == 0)
  {
    sub_1000070B8(&qword_100034A00);
    JUMPOUT(0x10000BE58);
  }
  JUMPOUT(0x10000BD08);
}

uint64_t sub_10000C038@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v73;
  _QWORD *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v4 = type metadata accessor for Font.Leading(0);
  v80 = *(_QWORD *)(v4 - 8);
  v81 = v4;
  __chkstk_darwin(v4);
  v79 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = a1;
  v6 = *a1;
  v7 = a1[1];
  v82 = v6;
  v83 = v7;
  v8 = sub_10001525C();
  v73 = v8;
  swift_bridgeObjectRetain(v7);
  v9 = Text.init<A>(_:)(&v82, &type metadata for String, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14 & 1;
  v16 = static Font.subheadline.getter();
  v17 = Text.font(_:)(v16, v9, v11, v15, v13);
  v19 = v18;
  LOBYTE(v8) = v20;
  v22 = v21;
  swift_release(v16);
  v23 = v8 & 1;
  sub_1000143C8(v9, v11, v15);
  v24 = swift_bridgeObjectRelease(v13);
  v25 = static Font.Weight.bold.getter(v24);
  v26 = Text.fontWeight(_:)(*(_QWORD *)&v25, 0, v17, v19, v23, v22);
  v28 = v27;
  v30 = v29;
  v32 = v31 & 1;
  sub_1000143C8(v17, v19, v23);
  v33 = swift_bridgeObjectRelease(v22);
  v34 = static Color.primary.getter(v33);
  v35 = Text.foregroundColor(_:)(v34, v26, v28, v32, v30);
  v76 = v36;
  v77 = v35;
  LOBYTE(v16) = v37;
  v78 = v38;
  swift_release(v34);
  v75 = v16 & 1;
  sub_1000143C8(v26, v28, v32);
  swift_bridgeObjectRelease(v30);
  v39 = v74[3];
  v82 = v74[2];
  v83 = v39;
  swift_bridgeObjectRetain(v39);
  v40 = Text.init<A>(_:)(&v82, &type metadata for String, v73);
  v42 = v41;
  v44 = v43;
  v46 = v45 & 1;
  v47 = static Color.primary.getter(v40);
  v48 = Text.foregroundColor(_:)(v47, v40, v42, v46, v44);
  v50 = v49;
  LOBYTE(v16) = v51;
  v53 = v52;
  swift_release(v47);
  v54 = v16 & 1;
  sub_1000143C8(v40, v42, v46);
  v55 = swift_bridgeObjectRelease(v44);
  v56 = static Font.footnote.getter(v55);
  v58 = v79;
  v57 = v80;
  v59 = v81;
  (*(void (**)(char *, _QWORD, uint64_t))(v80 + 104))(v79, enum case for Font.Leading.tight(_:), v81);
  v60 = Font.leading(_:)(v58, v56);
  swift_release(v56);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v59);
  v61 = Text.font(_:)(v60, v48, v50, v54, v53);
  v63 = v62;
  LOBYTE(v57) = v64;
  v66 = v65;
  swift_release(v60);
  LOBYTE(v60) = v57 & 1;
  sub_1000143C8(v48, v50, v54);
  swift_bridgeObjectRelease(v53);
  v67 = v75;
  LOBYTE(v82) = v75;
  v69 = v76;
  v68 = v77;
  *(_QWORD *)a2 = v77;
  *(_QWORD *)(a2 + 8) = v69;
  *(_BYTE *)(a2 + 16) = v67;
  v70 = v78;
  *(_QWORD *)(a2 + 24) = v78;
  *(_QWORD *)(a2 + 32) = v61;
  *(_QWORD *)(a2 + 40) = v63;
  *(_BYTE *)(a2 + 48) = v60;
  *(_QWORD *)(a2 + 56) = v66;
  *(_WORD *)(a2 + 64) = 256;
  v71 = v68;
  sub_1000152A0(v68, v69, v67);
  swift_bridgeObjectRetain(v70);
  sub_1000152A0(v61, v63, v60);
  swift_bridgeObjectRetain(v66);
  sub_1000143C8(v61, v63, v60);
  swift_bridgeObjectRelease(v66);
  sub_1000143C8(v71, v69, v82);
  return swift_bridgeObjectRelease(v70);
}

uint64_t sub_10000C398@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  double v29;
  double v31;
  double v32;
  double v33;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _OWORD v46[7];

  v18 = a16;
  v19 = a15;
  v20 = a12;
  v21 = a10;
  v22 = a2 & 1;
  v23 = a1;
  if ((_DWORD)v22)
    v23 = -INFINITY;
  v24 = a4 & 1;
  v25 = a3;
  if ((a4 & 1) != 0)
    v25 = v23;
  v26 = a6 & 1;
  v27 = a8 & 1;
  v28 = a11 & 1;
  v29 = a5;
  if ((a6 & 1) != 0)
    v29 = v25;
  if (v23 > v25 || v25 > v29)
    goto LABEL_22;
  v31 = a7;
  if ((a8 & 1) != 0)
    v31 = -INFINITY;
  v32 = a10;
  if ((a11 & 1) != 0)
    v32 = v31;
  v33 = a12;
  if ((a13 & 1) != 0)
    v33 = v32;
  if (v31 > v32 || v32 > v33)
  {
LABEL_22:
    v45 = a7;
    v43 = a3;
    v44 = a5;
    v42 = a1;
    v41 = v22;
    v35 = static os_log_type_t.fault.getter();
    v36 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v35, &_mh_execute_header, v36, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v28 = a11 & 1;
    v19 = a15;
    v22 = v41;
    v21 = a10;
    v20 = a12;
    a1 = v42;
    a3 = v43;
    a5 = v44;
    a7 = v45;
    v18 = a16;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v46, *(_QWORD *)&a1, v22, *(_QWORD *)&a3, v24, *(_QWORD *)&a5, v26, *(_QWORD *)&a7, v27, *(_QWORD *)&v21, v28, *(_QWORD *)&v20, a13 & 1, a14, v19);
  *(_QWORD *)a9 = v18;
  *(_QWORD *)(a9 + 8) = a17;
  v37 = v46[5];
  *(_OWORD *)(a9 + 80) = v46[4];
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v46[6];
  v38 = v46[1];
  *(_OWORD *)(a9 + 16) = v46[0];
  *(_OWORD *)(a9 + 32) = v38;
  v39 = v46[3];
  *(_OWORD *)(a9 + 48) = v46[2];
  *(_OWORD *)(a9 + 64) = v39;
  return swift_bridgeObjectRetain(a17);
}

__n128 sub_10000C544@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void (*a17)(uint64_t, uint64_t, uint64_t), uint64_t *a18)
{
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v34;
  double v35;
  double v36;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __n128 result;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _OWORD v53[7];

  v19 = a9;
  v20 = a17;
  v21 = a18;
  v22 = a15;
  v23 = a14;
  v24 = a12;
  v25 = a10;
  v26 = a2 & 1;
  v27 = a1;
  if ((_DWORD)v26)
    v27 = -INFINITY;
  v28 = a4 & 1;
  v29 = a3;
  if ((_DWORD)v28)
    v29 = v27;
  v30 = a6 & 1;
  v31 = a8 & 1;
  v32 = a5;
  if ((a6 & 1) != 0)
    v32 = v29;
  if (v27 > v29 || v29 > v32)
    goto LABEL_22;
  v34 = a7;
  if ((_DWORD)v31)
    v34 = -INFINITY;
  v35 = a10;
  if ((a11 & 1) != 0)
    v35 = v34;
  v36 = a12;
  if ((a13 & 1) != 0)
    v36 = v35;
  if (v34 > v35 || v35 > v36)
  {
LABEL_22:
    v51 = a5;
    v52 = a7;
    v49 = a1;
    v50 = a3;
    v47 = v28;
    v48 = v26;
    v46 = v31;
    v39 = static os_log_type_t.fault.getter();
    v40 = (void *)static Log.runtimeIssuesLog.getter();
    v41 = v39;
    v19 = a9;
    os_log(_:dso:log:_:_:)(v41, &_mh_execute_header, v40, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v31 = v46;
    v28 = v47;
    v26 = v48;
    v23 = a14;
    v22 = a15;
    v24 = a12;
    v25 = a10;
    a1 = v49;
    a3 = v50;
    a5 = v51;
    a7 = v52;
    v21 = a18;
    v20 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v53, *(_QWORD *)&a1, v26, *(_QWORD *)&a3, v28, *(_QWORD *)&a5, v30, *(_QWORD *)&a7, v31, *(_QWORD *)&v25, a11 & 1, *(_QWORD *)&v24, a13 & 1, v23, v22);
  v20(v18, v19, a16);
  v42 = v19 + *(int *)(sub_1000070B8(v21) + 36);
  v43 = v53[5];
  *(_OWORD *)(v42 + 64) = v53[4];
  *(_OWORD *)(v42 + 80) = v43;
  *(_OWORD *)(v42 + 96) = v53[6];
  v44 = v53[1];
  *(_OWORD *)v42 = v53[0];
  *(_OWORD *)(v42 + 16) = v44;
  result = (__n128)v53[3];
  *(_OWORD *)(v42 + 32) = v53[2];
  *(__n128 *)(v42 + 48) = result;
  return result;
}

uint64_t sub_10000C720@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  double v34;
  double v36;
  double v37;
  double v38;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned int v46;
  unsigned int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _OWORD v52[7];

  v20 = a19;
  v21 = a18;
  v22 = a17;
  v24 = a14;
  v23 = a15;
  v25 = a12;
  v26 = a10;
  v27 = a2 & 1;
  v28 = a1;
  if ((_DWORD)v27)
    v28 = -INFINITY;
  v29 = a4 & 1;
  v30 = a3;
  if ((_DWORD)v29)
    v30 = v28;
  v31 = a6 & 1;
  v32 = a8 & 1;
  v33 = a13 & 1;
  v34 = a5;
  if ((a6 & 1) != 0)
    v34 = v30;
  if (v28 > v30 || v30 > v34)
    goto LABEL_22;
  v36 = a7;
  if ((a8 & 1) != 0)
    v36 = -INFINITY;
  v37 = a10;
  if ((a11 & 1) != 0)
    v37 = v36;
  v38 = a12;
  if ((a13 & 1) != 0)
    v38 = v37;
  if (v36 > v37 || v37 > v38)
  {
LABEL_22:
    v50 = a7;
    v51 = a5;
    v48 = a1;
    v49 = a3;
    v47 = v27;
    v46 = v29;
    v40 = static os_log_type_t.fault.getter();
    v41 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v41, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v33 = a13 & 1;
    v29 = v46;
    v24 = a14;
    v23 = a15;
    v27 = v47;
    v26 = a10;
    v25 = a12;
    a1 = v48;
    a3 = v49;
    a7 = v50;
    a5 = v51;
    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v52, *(_QWORD *)&a1, v27, *(_QWORD *)&a3, v29, *(_QWORD *)&a5, v31, *(_QWORD *)&a7, v32, *(_QWORD *)&v26, a11 & 1, *(_QWORD *)&v25, v33, v24, v23);
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  v42 = v52[5];
  *(_OWORD *)(a9 + 96) = v52[4];
  *(_OWORD *)(a9 + 112) = v42;
  *(_OWORD *)(a9 + 128) = v52[6];
  v43 = v52[1];
  *(_OWORD *)(a9 + 32) = v52[0];
  *(_OWORD *)(a9 + 48) = v43;
  v44 = v52[3];
  *(_OWORD *)(a9 + 64) = v52[2];
  *(_OWORD *)(a9 + 80) = v44;
  sub_1000152A0(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain(v20);
}

uint64_t sub_10000C90C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(_QWORD);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint64_t v72;
  char *v73;
  _OWORD *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  _QWORD v91[16];
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _OWORD v111[7];

  v105 = a2;
  v110 = sub_1000070B8(&qword_100034C70);
  __chkstk_darwin(v110);
  v96 = (char *)v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_1000070B8(&qword_100034C78);
  v8 = __chkstk_darwin(v92);
  v94 = (char *)v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v93 = (char *)v91 - v11;
  v12 = __chkstk_darwin(v10);
  v91[15] = (char *)v91 - v13;
  v14 = __chkstk_darwin(v12);
  v95 = (char *)v91 - v15;
  v16 = __chkstk_darwin(v14);
  v91[10] = (char *)v91 - v17;
  __chkstk_darwin(v16);
  v97 = (char *)v91 - v18;
  v103 = sub_1000070B8(&qword_100034C80);
  __chkstk_darwin(v103);
  v104 = (uint64_t)v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v108);
  v102 = (char *)v91 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_1000070B8(&qword_100034C88);
  v100 = *(_QWORD *)(v101 - 8);
  v21 = __chkstk_darwin(v101);
  v91[12] = (char *)v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v21);
  v91[6] = (char *)v91 - v24;
  __chkstk_darwin(v23);
  v26 = (char *)v91 - v25;
  v106 = sub_1000070B8(&qword_100034C90);
  v27 = __chkstk_darwin(v106);
  v91[13] = (char *)v91 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __chkstk_darwin(v27);
  v91[7] = (char *)v91 - v30;
  __chkstk_darwin(v29);
  v32 = (char *)v91 - v31;
  v107 = sub_1000070B8(&qword_100034C98);
  v33 = __chkstk_darwin(v107);
  v91[14] = (char *)v91 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v33);
  v91[9] = (char *)v91 - v36;
  __chkstk_darwin(v35);
  v38 = (char *)v91 - v37;
  v109 = sub_1000070B8(&qword_100034CA0);
  v39 = __chkstk_darwin(v109);
  v91[11] = (char *)v91 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __chkstk_darwin(v39);
  v91[8] = (char *)v91 - v42;
  v43 = __chkstk_darwin(v41);
  v98 = (char *)v91 - v44;
  __chkstk_darwin(v43);
  v99 = (uint64_t)v91 - v45;
  v46 = type metadata accessor for InviteActionsView(0);
  v47 = *(_QWORD *)(v46 - 8);
  v48 = *(_QWORD *)(v47 + 64);
  v49 = __chkstk_darwin(v46);
  v50 = (char *)v91 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v49);
  v52 = (char *)v91 - v51;
  v53 = *(_BYTE *)(a1 + 234);
  v54 = a1;
  v55 = a1;
  v56 = v110;
  sub_10000737C(v55, (uint64_t)v91 - v51, v57);
  if ((v53 & 1) == 0)
    __asm { BR              X10 }
  sub_1000073C0((uint64_t)v52, type metadata accessor for InviteActionsView);
  sub_10000737C(v54, (uint64_t)v50, type metadata accessor for InviteActionsView);
  v58 = *(unsigned __int8 *)(v47 + 80);
  v59 = (v58 + 32) & ~v58;
  v60 = swift_allocObject(&unk_1000316D0, v59 + v48, v58 | 7);
  *(double *)(v60 + 16) = a3;
  *(double *)(v60 + 24) = a4;
  v61 = sub_100019ECC((uint64_t)v50, v60 + v59, type metadata accessor for InviteActionsView);
  __chkstk_darwin(v61);
  v62 = Button.init(action:label:)(sub_10001A9D0, v60, sub_10001A9DC);
  v63 = static Alignment.center.getter(v62);
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v111, 0, 1, 0, 1, 0x7FF0000000000000, 0, 0x4041000000000000, 0, 0, 1, 0, 1, v63, v64);
  v65 = v100;
  v66 = v101;
  (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v32, v26, v101);
  v67 = &v32[*(int *)(v106 + 36)];
  v68 = v111[5];
  *((_OWORD *)v67 + 4) = v111[4];
  *((_OWORD *)v67 + 5) = v68;
  *((_OWORD *)v67 + 6) = v111[6];
  v69 = v111[1];
  *(_OWORD *)v67 = v111[0];
  *((_OWORD *)v67 + 1) = v69;
  v70 = v111[3];
  *((_OWORD *)v67 + 2) = v111[2];
  *((_OWORD *)v67 + 3) = v70;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v26, v66);
  v71 = objc_msgSend((id)objc_opt_self(UIColor), "systemBlueColor");
  v72 = Color.init(uiColor:)(v71);
  LOBYTE(v66) = static Edge.Set.all.getter();
  sub_1000079E4((uint64_t)v32, (uint64_t)v38, &qword_100034C90);
  v73 = &v38[*(int *)(v107 + 36)];
  *(_QWORD *)v73 = v72;
  v73[8] = v66;
  sub_100008080((uint64_t)v32, &qword_100034C90);
  v74 = v102;
  v75 = &v102[*(int *)(v108 + 20)];
  v76 = enum case for RoundedCornerStyle.continuous(_:);
  v77 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 104))(v75, v76, v77);
  __asm { FMOV            V0.2D, #10.0 }
  *v74 = _Q0;
  v83 = v109;
  v84 = (uint64_t)v98;
  v85 = (uint64_t)&v98[*(int *)(v109 + 36)];
  sub_10000737C((uint64_t)v74, v85, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v85 + *(int *)(sub_1000070B8(&qword_100034CA8) + 36)) = 256;
  sub_1000079E4((uint64_t)v38, v84, &qword_100034C98);
  sub_1000073C0((uint64_t)v74, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  sub_100008080((uint64_t)v38, &qword_100034C98);
  v86 = v99;
  sub_10001B1B8(v84, v99, &qword_100034CA0);
  v87 = v104;
  sub_1000079E4(v86, v104, &qword_100034CA0);
  swift_storeEnumTagMultiPayload(v87, v103, 0);
  v88 = sub_10001A8AC();
  v89 = sub_10001B88C(&qword_100034CE0, &qword_100034C70, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  _ConditionalContent<>.init(storage:)(v87, v83, v56, v88, v89);
  return sub_100008080(v86, &qword_100034CA0);
}

void sub_10000D90C()
{
  swift_bridgeObjectRelease(0xE700000000000000);
  JUMPOUT(0x10000CDE4);
}

void sub_10000D934(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  char v32;
  uint64_t v33;
  char v34;

  v3 = type metadata accessor for InviteActionsView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000070B8(&qword_1000347E8);
  __chkstk_darwin(v7);
  v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for InviteMessageView(0);
  v11 = a1 + *(int *)(v10 + 24);
  v12 = *(void **)v11;
  if (*(_QWORD *)v11)
  {
    v31[0] = *(_QWORD *)(v11 + 8);
    v31[1] = v1;
    v13 = a1 + *(int *)(v10 + 36);
    v14 = *(_BYTE *)v13;
    v15 = *(_QWORD *)(v13 + 8);
    v32 = v14;
    v33 = v15;
    v34 = 1;
    v16 = v12;
    v17 = sub_1000070B8(&qword_1000349F8);
    State.wrappedValue.setter(&v34, v17);
    type metadata accessor for FamilyInviteAnalytics(0);
    v18 = (void *)static FamilyInviteAnalytics.shared.getter();
    v19 = 8 * *(char *)(a1 + 232);
    v20 = *(_QWORD *)((char *)&unk_10002A528 + v19);
    dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteInteractionEvent(action:inviteState:isReceiver:)(0xD00000000000001BLL, 0x800000010002AFF0, *(_QWORD *)&aAccepteddeclin[v19], v20, (*(_BYTE *)(a1 + 233) & 1) == 0);

    swift_bridgeObjectRelease(v20);
    v21 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v9, 1, 1, v21);
    sub_10000737C(a1, (uint64_t)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for InviteActionsView);
    type metadata accessor for MainActor(0);
    v22 = v16;
    v23 = static MainActor.shared.getter();
    v24 = *(unsigned __int8 *)(v4 + 80);
    v25 = (v24 + 32) & ~v24;
    v26 = (v5 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
    v27 = swift_allocObject(&unk_1000316F8, v26 + 16, v24 | 7);
    *(_QWORD *)(v27 + 16) = v23;
    *(_QWORD *)(v27 + 24) = &protocol witness table for MainActor;
    sub_100019ECC((uint64_t)v6, v27 + v25, type metadata accessor for InviteActionsView);
    v28 = (_QWORD *)(v27 + v26);
    v29 = v31[0];
    *v28 = v22;
    v28[1] = v29;
    v30 = sub_100006488((uint64_t)v9, (uint64_t)&unk_100034CF0, v27);
    swift_release(v30);

  }
}

uint64_t sub_10000DB88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  v7 = sub_1000070B8(&qword_100034868);
  v6[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v6[8] = static MainActor.shared.getter();
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v6[9] = v9;
  v6[10] = v10;
  return swift_task_switch(sub_10000DC1C, v9, v10);
}

uint64_t sub_10000DC1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = v0[4];
  URL.init(string:)(*(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
  v2 = type metadata accessor for InviteMessageView(0);
  v0[11] = v2;
  v3 = *sub_10001A340((_QWORD *)(v1 + *(int *)(v2 + 28)), *(_QWORD *)(v1 + *(int *)(v2 + 28) + 24));
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100034C50
                                                                                    + dword_100034C50);
  v4 = (_QWORD *)swift_task_alloc(unk_100034C54);
  v0[12] = v4;
  *v4 = v0;
  v4[1] = sub_10000DCCC;
  return v6(v0[7], v0[5], v0[6], v3, 0xD000000000000014, 0x800000010002B010);
}

uint64_t sub_10000DCCC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*v0 + 96));
  sub_100008080(v2, &qword_100034868);
  return swift_task_switch(sub_10000DD2C, *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80));
}

uint64_t sub_10000DD2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 64));
  v4 = (char *)(v3 + *(int *)(v1 + 36));
  v5 = *v4;
  v6 = *((_QWORD *)v4 + 1);
  *(_BYTE *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v6;
  *(_BYTE *)(v0 + 104) = 0;
  v7 = sub_1000070B8(&qword_1000349F8);
  State.wrappedValue.setter(v0 + 104, v7);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000DDB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  _QWORD v29[2];

  v3 = *(_QWORD *)(a1 + 40);
  v29[0] = *(_QWORD *)(a1 + 32);
  v29[1] = v3;
  v4 = sub_10001525C();
  swift_bridgeObjectRetain(v3);
  v5 = Text.init<A>(_:)(v29, &type metadata for String, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10 & 1;
  v12 = static Font.subheadline.getter();
  v13 = Text.font(_:)(v12, v5, v7, v11, v9);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release(v12);
  LOBYTE(v12) = v17 & 1;
  sub_1000143C8(v5, v7, v11);
  v20 = swift_bridgeObjectRelease(v9);
  v21 = static Color.white.getter(v20);
  v22 = Text.foregroundColor(_:)(v21, v13, v15, v17 & 1, v19);
  v24 = v23;
  LOBYTE(v11) = v25;
  v27 = v26;
  swift_release(v21);
  sub_1000143C8(v13, v15, v12);
  result = swift_bridgeObjectRelease(v19);
  *(_QWORD *)a2 = v22;
  *(_QWORD *)(a2 + 8) = v24;
  *(_BYTE *)(a2 + 16) = v11 & 1;
  *(_QWORD *)(a2 + 24) = v27;
  return result;
}

uint64_t sub_10000DEDC(uint64_t a1)
{
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;

  v2 = type metadata accessor for InviteActionsView(0);
  v36 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v36 + 64);
  __chkstk_darwin(v2);
  v37 = (uint64_t)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000070B8(&qword_1000347E8);
  __chkstk_darwin(v4);
  v38 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000070B8(&qword_100034868);
  __chkstk_darwin(v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v34 - v14;
  v16 = type metadata accessor for InviteMessageDetails(0);
  sub_1000079E4(a1 + *(int *)(v16 + 100), (uint64_t)v8, &qword_100034868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_100008080((uint64_t)v8, &qword_100034868);
  v35 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v35(v15, v8, v9);
  v18 = a1 + *(int *)(type metadata accessor for InviteMessageView(0) + 32);
  v19 = *(_BYTE *)v18;
  v20 = *(_QWORD *)(v18 + 8);
  v39 = v19;
  v40 = v20;
  v41 = 1;
  v21 = sub_1000070B8(&qword_1000349F8);
  State.wrappedValue.setter(&v41, v21);
  type metadata accessor for FamilyInviteAnalytics(0);
  v22 = (void *)static FamilyInviteAnalytics.shared.getter();
  v23 = 8 * *(char *)(a1 + 232);
  v24 = *(_QWORD *)((char *)&unk_10002A528 + v23);
  dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteInteractionEvent(action:inviteState:isReceiver:)(0x656E696C636544, 0xE700000000000000, *(_QWORD *)&aAccepteddeclin[v23], v24, (*(_BYTE *)(a1 + 233) & 1) == 0);

  swift_bridgeObjectRelease(v24);
  v25 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v38, 1, 1, v25);
  v26 = v37;
  sub_10000737C(a1, v37, type metadata accessor for InviteActionsView);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  type metadata accessor for MainActor(0);
  v27 = static MainActor.shared.getter();
  v28 = *(unsigned __int8 *)(v36 + 80);
  v29 = (v28 + 32) & ~v28;
  v30 = *(unsigned __int8 *)(v10 + 80);
  v31 = (v3 + v30 + v29) & ~v30;
  v32 = swift_allocObject(&unk_1000317C8, v31 + v11, v28 | v30 | 7);
  *(_QWORD *)(v32 + 16) = v27;
  *(_QWORD *)(v32 + 24) = &protocol witness table for MainActor;
  sub_100019ECC(v26, v32 + v29, type metadata accessor for InviteActionsView);
  v35((char *)(v32 + v31), v13, v9);
  v33 = sub_100006488(v38, (uint64_t)&unk_100034D58, v32);
  swift_release(v33);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_10000E244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = type metadata accessor for MainActor(0);
  v5[2] = v7;
  v5[3] = static MainActor.shared.getter(v7);
  v8 = (_QWORD *)swift_task_alloc(dword_100034D0C);
  v5[4] = v8;
  *v8 = v5;
  v8[1] = sub_10000E2BC;
  return sub_10000E35C(a5, 2);
}

uint64_t sub_10000E2BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000E32C, v2, v3);
}

uint64_t sub_10000E32C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E35C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  v4 = (*(_QWORD *)(*(_QWORD *)(sub_1000070B8(&qword_100034868) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[23] = swift_task_alloc(v4);
  v3[24] = swift_task_alloc(v4);
  v5 = type metadata accessor for URL(0);
  v3[25] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[26] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[27] = swift_task_alloc(v7);
  v3[28] = swift_task_alloc(v7);
  v3[29] = swift_task_alloc(v7);
  v3[30] = swift_task_alloc(v7);
  v8 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v3[31] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v3[32] = v9;
  v3[33] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000070B8(&qword_1000347E8);
  v3[34] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for FamilyFeatureFlags(0);
  v3[35] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v3[36] = v12;
  v3[37] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Logger(0);
  v3[38] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v3[39] = v14;
  v15 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[40] = swift_task_alloc(v15);
  v3[41] = swift_task_alloc(v15);
  v3[42] = swift_task_alloc(v15);
  v16 = type metadata accessor for MainActor(0);
  v3[43] = v16;
  v3[44] = static MainActor.shared.getter(v16);
  v17 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
  v3[45] = v17;
  v3[46] = v18;
  return swift_task_switch(sub_10000E50C, v17, v18);
}

uint64_t sub_10000E50C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  Swift::String v67;
  Swift::String v68;
  Swift::String v69;
  id v70;
  Swift::String v71;
  Swift::String v72;
  Swift::String v73;
  id v74;
  Swift::String v75;
  Swift::String v76;
  Swift::String v77;
  id v78;
  Swift::String v79;
  Swift::String v80;
  Swift::String v81;
  uint64_t v82;
  uint64_t v83;
  NSNumber v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  Swift::String v90;
  Swift::String v91;
  Swift::String v92;
  Swift::String v93;

  v2 = static FamilyLogger.extension.getter(a1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v1 + 168);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v6 = 134217984;
    *(_QWORD *)(v1 + 152) = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 152, v1 + 160);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "User didTap %ld button", v6, 0xCu);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = *(_QWORD *)(v1 + 336);
  v8 = *(_QWORD *)(v1 + 304);
  v9 = *(_QWORD *)(v1 + 176);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 312) + 8);
  *(_QWORD *)(v1 + 376) = v10;
  v10(v7, v8);
  v11 = type metadata accessor for InviteMessageView(0);
  *(_QWORD *)(v1 + 384) = v11;
  v12 = v9 + *(int *)(v11 + 24);
  v13 = *(void **)v12;
  *(_QWORD *)(v1 + 392) = *(_QWORD *)v12;
  if (!v13)
  {
    v39 = v11;
    v40 = swift_release(*(_QWORD *)(v1 + 352));
    v41 = static FamilyLogger.extension.getter(v40);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "No presenter, return", v44, 2u);
      swift_slowDealloc(v44, -1, -1);
    }
    v45 = *(_QWORD *)(v1 + 320);
    v46 = *(_QWORD *)(v1 + 304);
    v47 = *(_QWORD *)(v1 + 176);

    v10(v45, v46);
    v48 = (char *)(v47 + *(int *)(v39 + 32));
    v49 = *v48;
    v50 = *((_QWORD *)v48 + 1);
    *(_BYTE *)(v1 + 120) = v49;
    *(_QWORD *)(v1 + 128) = v50;
    *(_BYTE *)(v1 + 565) = 0;
    v37 = sub_1000070B8(&qword_1000349F8);
    v38 = v1 + 565;
    goto LABEL_10;
  }
  v15 = *(_QWORD *)(v1 + 288);
  v14 = *(_QWORD *)(v1 + 296);
  v16 = *(_QWORD *)(v1 + 280);
  v17 = *(_QWORD *)(v12 + 8);
  *(_QWORD *)(v1 + 400) = v17;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 104))(v14, enum case for FamilyFeatureFlags.familyPrivacyDisclosure(_:), v16);
  v18 = v13;
  v19 = static FamilyFeatureFlags.enabled(_:)(v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  if ((v19 & 1) != 0)
  {
    if (*(_QWORD *)(v1 + 168) == 1)
    {
      v21 = *(_QWORD *)(v1 + 264);
      v20 = *(_QWORD *)(v1 + 272);
      v23 = *(_QWORD *)(v1 + 248);
      v22 = *(_QWORD *)(v1 + 256);
      v24 = *(_QWORD *)(v1 + 176);
      swift_release(*(_QWORD *)(v1 + 352));
      v25 = type metadata accessor for TaskPriority(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v20, 1, 1, v25);
      sub_10000737C(v24, v21, type metadata accessor for InviteActionsView);
      v26 = v18;
      v27 = static MainActor.shared.getter(v26);
      v28 = *(unsigned __int8 *)(v23 + 80);
      v29 = (v28 + 32) & ~v28;
      v30 = (v22 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
      v31 = swift_allocObject(&unk_100031760, v30 + 16, v28 | 7);
      *(_QWORD *)(v31 + 16) = v27;
      *(_QWORD *)(v31 + 24) = &protocol witness table for MainActor;
      sub_100019ECC(v21, v31 + v29, type metadata accessor for InviteActionsView);
      v32 = (_QWORD *)(v31 + v30);
      *v32 = v26;
      v32[1] = v17;
      v33 = sub_100006488(v20, (uint64_t)&unk_100034D40, v31);
      swift_release(v33);

      v34 = (char *)(*(_QWORD *)(v1 + 176) + *(int *)(*(_QWORD *)(v1 + 384) + 32));
      v35 = *v34;
      v36 = *((_QWORD *)v34 + 1);
      *(_BYTE *)(v1 + 136) = v35;
      *(_QWORD *)(v1 + 144) = v36;
      *(_BYTE *)(v1 + 564) = 0;
      v37 = sub_1000070B8(&qword_1000349F8);
      v38 = v1 + 564;
LABEL_10:
      State.wrappedValue.setter(v38, v37);
      v51 = *(_QWORD *)(v1 + 328);
      v52 = *(_QWORD *)(v1 + 320);
      v53 = *(_QWORD *)(v1 + 296);
      v55 = *(_QWORD *)(v1 + 264);
      v54 = *(_QWORD *)(v1 + 272);
      v57 = *(_QWORD *)(v1 + 232);
      v56 = *(_QWORD *)(v1 + 240);
      v59 = *(_QWORD *)(v1 + 216);
      v58 = *(_QWORD *)(v1 + 224);
      v88 = *(_QWORD *)(v1 + 192);
      v89 = *(_QWORD *)(v1 + 184);
      swift_task_dealloc(*(_QWORD *)(v1 + 336));
      swift_task_dealloc(v51);
      swift_task_dealloc(v52);
      swift_task_dealloc(v53);
      swift_task_dealloc(v54);
      swift_task_dealloc(v55);
      swift_task_dealloc(v56);
      swift_task_dealloc(v57);
      swift_task_dealloc(v58);
      swift_task_dealloc(v59);
      swift_task_dealloc(v88);
      swift_task_dealloc(v89);
      return (*(uint64_t (**)(void))(v1 + 8))();
    }
    v62 = *(_QWORD *)(v1 + 344);
    v63 = sub_1000070B8(&qword_100034D20);
    v64 = swift_allocObject(v63, 64, 7);
    *(_QWORD *)(v1 + 408) = v64;
    *(_OWORD *)(v64 + 16) = xmmword_10002A570;
    v65 = (void *)objc_opt_self(NSBundle);
    v66 = objc_msgSend(v65, "mainBundle");
    v90._object = (void *)0xE000000000000000;
    v67._object = (void *)0x800000010002B050;
    v67._countAndFlagsBits = 0xD000000000000017;
    v68._countAndFlagsBits = 0;
    v68._object = (void *)0xE000000000000000;
    v90._countAndFlagsBits = 0;
    v69 = NSLocalizedString(_:tableName:bundle:value:comment:)(v67, (Swift::String_optional)0, (NSBundle)v66, v68, v90);

    *(Swift::String *)(v64 + 32) = v69;
    v70 = objc_msgSend(v65, "mainBundle");
    v91._object = (void *)0xE000000000000000;
    v71._countAndFlagsBits = 0x6C65636E6143;
    v71._object = (void *)0xE600000000000000;
    v72._countAndFlagsBits = 0;
    v72._object = (void *)0xE000000000000000;
    v91._countAndFlagsBits = 0;
    v73 = NSLocalizedString(_:tableName:bundle:value:comment:)(v71, (Swift::String_optional)0, (NSBundle)v70, v72, v91);

    *(Swift::String *)(v64 + 48) = v73;
    v74 = objc_msgSend(v65, "mainBundle");
    v75._countAndFlagsBits = 0xD00000000000001CLL;
    v92._object = (void *)0xE000000000000000;
    v75._object = (void *)0x800000010002B070;
    v76._countAndFlagsBits = 0;
    v76._object = (void *)0xE000000000000000;
    v92._countAndFlagsBits = 0;
    v77 = NSLocalizedString(_:tableName:bundle:value:comment:)(v75, (Swift::String_optional)0, (NSBundle)v74, v76, v92);

    *(Swift::String *)(v1 + 416) = v77;
    v78 = objc_msgSend(v65, "mainBundle");
    v79._countAndFlagsBits = 0xD00000000000001ELL;
    v93._object = (void *)0xE000000000000000;
    v79._object = (void *)0x800000010002B090;
    v80._countAndFlagsBits = 0;
    v80._object = (void *)0xE000000000000000;
    v93._countAndFlagsBits = 0;
    v81 = NSLocalizedString(_:tableName:bundle:value:comment:)(v79, (Swift::String_optional)0, (NSBundle)v78, v80, v93);

    *(Swift::String *)(v1 + 432) = v81;
    v82 = sub_1000070B8(&qword_100034D28);
    v83 = swift_allocObject(v82, 48, 7);
    *(_OWORD *)(v83 + 16) = xmmword_10002A580;
    *(_QWORD *)(v1 + 448) = sub_10001AB7C();
    *(NSNumber *)(v83 + 32) = NSNumber.init(integerLiteral:)(2);
    v84.super.super.isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
    *(NSNumber *)(v83 + 40) = v84;
    v85 = specialized Array._endMutation()(v84.super.super.isa);
    *(_QWORD *)(v1 + 456) = v83;
    *(_QWORD *)(v1 + 464) = static MainActor.shared.getter(v85);
    v86 = dispatch thunk of Actor.unownedExecutor.getter(v62, &protocol witness table for MainActor);
    *(_QWORD *)(v1 + 472) = v86;
    *(_QWORD *)(v1 + 480) = v87;
    return swift_task_switch(sub_10000EBC0, v86, v87);
  }
  else
  {
    v61 = (_QWORD *)swift_task_alloc(dword_100034D14);
    *(_QWORD *)(v1 + 536) = v61;
    *v61 = v1;
    v61[1] = sub_10000F18C;
    return sub_10000FB94(*(_QWORD *)(v1 + 184));
  }
}

uint64_t sub_10000EBC0()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  NSString v3;
  NSString v4;
  Class isa;
  Class v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0 + 2;
  v2 = (void *)v0[49];
  v3 = String._bridgeToObjectiveC()();
  v0[61] = v3;
  v4 = String._bridgeToObjectiveC()();
  v0[62] = v4;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[63] = isa;
  v6 = Array._bridgeToObjectiveC()().super.isa;
  v0[64] = v6;
  v0[7] = (char *)v0 + 556;
  v0[2] = v0;
  v0[3] = sub_10000ECE0;
  v7 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v8 = v0 + 10;
  v8[1] = 0x40000000;
  v8[2] = sub_100009F54;
  v8[3] = &unk_100031738;
  v8[4] = v7;
  objc_msgSend(v2, "family_presentAlertSheetWithTitle:message:buttonTitles:styles:completion:", v3, v4, isa, v6, v8);
  return swift_continuation_await(v1);
}

uint64_t sub_10000ECE0()
{
  uint64_t v0;

  return swift_task_switch(sub_10000ED24, *(_QWORD *)(*(_QWORD *)v0 + 472), *(_QWORD *)(*(_QWORD *)v0 + 480));
}

uint64_t sub_10000ED24()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(void **)(v0 + 504);
  v1 = *(void **)(v0 + 512);
  v4 = *(void **)(v0 + 488);
  v3 = *(void **)(v0 + 496);
  v5 = *(_QWORD *)(v0 + 456);
  v6 = *(_QWORD *)(v0 + 440);
  v7 = *(_QWORD *)(v0 + 424);
  v8 = *(_QWORD *)(v0 + 408);
  swift_release(*(_QWORD *)(v0 + 464));
  *(_DWORD *)(v0 + 560) = *(_DWORD *)(v0 + 556);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  return swift_task_switch(sub_10000EDC0, *(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 368));
}

uint64_t sub_10000EDC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  uint8_t *v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;

  v2 = static FamilyLogger.extension.getter(a1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_DWORD *)(v1 + 560);
    v6 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 67109120;
    *(_DWORD *)(v1 + 552) = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 552, v1 + 556);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "User in tap in alert sheet: %d", v6, 8u);
    swift_slowDealloc(v6, -1, -1);
  }
  v7 = *(_DWORD *)(v1 + 560);
  v8 = *(void (**)(uint64_t, uint64_t))(v1 + 376);
  v9 = *(_QWORD *)(v1 + 328);
  v10 = *(_QWORD *)(v1 + 304);

  v8(v9, v10);
  if (v7)
  {
    v11 = *(void **)(v1 + 392);
    swift_release(*(_QWORD *)(v1 + 352));

    v12 = (char *)(*(_QWORD *)(v1 + 176) + *(int *)(*(_QWORD *)(v1 + 384) + 32));
    v13 = *v12;
    v14 = *((_QWORD *)v12 + 1);
    *(_BYTE *)(v1 + 136) = v13;
    *(_QWORD *)(v1 + 144) = v14;
    *(_BYTE *)(v1 + 564) = 0;
    v15 = sub_1000070B8(&qword_1000349F8);
    State.wrappedValue.setter(v1 + 564, v15);
    v16 = *(_QWORD *)(v1 + 328);
    v17 = *(_QWORD *)(v1 + 320);
    v18 = *(_QWORD *)(v1 + 296);
    v20 = *(_QWORD *)(v1 + 264);
    v19 = *(_QWORD *)(v1 + 272);
    v22 = *(_QWORD *)(v1 + 232);
    v21 = *(_QWORD *)(v1 + 240);
    v24 = *(_QWORD *)(v1 + 216);
    v23 = *(_QWORD *)(v1 + 224);
    v27 = *(_QWORD *)(v1 + 192);
    v28 = *(_QWORD *)(v1 + 184);
    swift_task_dealloc(*(_QWORD *)(v1 + 336));
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v26 = (_QWORD *)swift_task_alloc(dword_100034D14);
    *(_QWORD *)(v1 + 520) = v26;
    *v26 = v1;
    v26[1] = sub_10000EFE8;
    return sub_10000FB94(*(_QWORD *)(v1 + 192));
  }
}

uint64_t sub_10000EFE8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 520));
  return swift_task_switch(sub_10000F034, *(_QWORD *)(v1 + 360), *(_QWORD *)(v1 + 368));
}

uint64_t sub_10000F034()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = v0[25];
  v2 = v0[26];
  v3 = v0[24];
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 16))(v0[29], v0[20], v1);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  v5 = v0[30];
  v6 = v0[25];
  v7 = v0[26];
  v8 = v0[24];
  if (v4 == 1)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 32))(v0[30], v0[29], v0[25]);
    sub_100008080(v8, &qword_100034868);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v7 + 8))(v0[29], v0[25]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  v9 = v0[49];
  v10 = (_QWORD *)swift_task_alloc(dword_100034D1C);
  v0[66] = v10;
  *v10 = v0;
  v10[1] = sub_10000F120;
  return sub_100010338(v0[30], v0[21], v9);
}

uint64_t sub_10000F120()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 240);
  v3 = *(_QWORD *)(*v0 + 200);
  v4 = *(_QWORD *)(*v0 + 208);
  swift_task_dealloc(*(_QWORD *)(*v0 + 528));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch(sub_10001B8CC, *(_QWORD *)(v1 + 360), *(_QWORD *)(v1 + 368));
}

uint64_t sub_10000F18C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 536));
  return swift_task_switch(sub_10000F1D8, *(_QWORD *)(v1 + 360), *(_QWORD *)(v1 + 368));
}

uint64_t sub_10000F1D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = v0[26];
  v2 = v0[25];
  v3 = v0[23];
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v1 + 16))(v0[27], v0[20], v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2);
  v5 = v0[28];
  v6 = v0[25];
  v7 = v0[26];
  v8 = v0[23];
  if (v4 == 1)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 32))(v0[28], v0[27], v0[25]);
    sub_100008080(v8, &qword_100034868);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v7 + 8))(v0[27], v0[25]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  v9 = v0[49];
  v10 = (_QWORD *)swift_task_alloc(dword_100034D1C);
  v0[68] = v10;
  *v10 = v0;
  v10[1] = sub_10000F2C4;
  return sub_100010338(v0[28], v0[21], v9);
}

uint64_t sub_10000F2C4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 224);
  v3 = *(_QWORD *)(*v0 + 200);
  v4 = *(_QWORD *)(*v0 + 208);
  swift_task_dealloc(*(_QWORD *)(*v0 + 544));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch(sub_10000F330, *(_QWORD *)(v1 + 360), *(_QWORD *)(v1 + 368));
}

uint64_t sub_10000F330()
{
  uint64_t v0;
  void *v1;
  char *v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 392);
  swift_release(*(_QWORD *)(v0 + 352));

  v2 = (char *)(*(_QWORD *)(v0 + 176) + *(int *)(*(_QWORD *)(v0 + 384) + 32));
  v3 = *v2;
  v4 = *((_QWORD *)v2 + 1);
  *(_BYTE *)(v0 + 136) = v3;
  *(_QWORD *)(v0 + 144) = v4;
  *(_BYTE *)(v0 + 564) = 0;
  v5 = sub_1000070B8(&qword_1000349F8);
  State.wrappedValue.setter(v0 + 564, v5);
  v6 = *(_QWORD *)(v0 + 328);
  v7 = *(_QWORD *)(v0 + 320);
  v8 = *(_QWORD *)(v0 + 296);
  v10 = *(_QWORD *)(v0 + 264);
  v9 = *(_QWORD *)(v0 + 272);
  v12 = *(_QWORD *)(v0 + 232);
  v11 = *(_QWORD *)(v0 + 240);
  v14 = *(_QWORD *)(v0 + 216);
  v13 = *(_QWORD *)(v0 + 224);
  v16 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 184);
  swift_task_dealloc(*(_QWORD *)(v0 + 336));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F44C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F964(0xD000000000000020, 0x800000010002B0E0, (uint64_t (*)(uint64_t))&static Color.primary.getter, a1);
}

uint64_t sub_10000F470(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];

  v7 = static Animation.easeInOut(duration:)();
  v8 = Animation.delay(_:)(a4);
  swift_release(v7);
  v10[2] = a1;
  withAnimation<A>(_:_:)(v8, a2, v10, (char *)&type metadata for () + 8);
  return swift_release(v8);
}

uint64_t sub_10000F4F4(uint64_t a1)
{
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;

  v2 = type metadata accessor for InviteActionsView(0);
  v36 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v36 + 64);
  __chkstk_darwin(v2);
  v37 = (uint64_t)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000070B8(&qword_1000347E8);
  __chkstk_darwin(v4);
  v38 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000070B8(&qword_100034868);
  __chkstk_darwin(v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v34 - v14;
  v16 = type metadata accessor for InviteMessageDetails(0);
  sub_1000079E4(a1 + *(int *)(v16 + 96), (uint64_t)v8, &qword_100034868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_100008080((uint64_t)v8, &qword_100034868);
  v35 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v35(v15, v8, v9);
  v18 = a1 + *(int *)(type metadata accessor for InviteMessageView(0) + 32);
  v19 = *(_BYTE *)v18;
  v20 = *(_QWORD *)(v18 + 8);
  v39 = v19;
  v40 = v20;
  v41 = 1;
  v21 = sub_1000070B8(&qword_1000349F8);
  State.wrappedValue.setter(&v41, v21);
  type metadata accessor for FamilyInviteAnalytics(0);
  v22 = (void *)static FamilyInviteAnalytics.shared.getter();
  v23 = 8 * *(char *)(a1 + 232);
  v24 = *(_QWORD *)((char *)&unk_10002A528 + v23);
  dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteInteractionEvent(action:inviteState:isReceiver:)(0x747065636341, 0xE600000000000000, *(_QWORD *)&aAccepteddeclin[v23], v24, (*(_BYTE *)(a1 + 233) & 1) == 0);

  swift_bridgeObjectRelease(v24);
  v25 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v38, 1, 1, v25);
  v26 = v37;
  sub_10000737C(a1, v37, type metadata accessor for InviteActionsView);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  type metadata accessor for MainActor(0);
  v27 = static MainActor.shared.getter();
  v28 = *(unsigned __int8 *)(v36 + 80);
  v29 = (v28 + 32) & ~v28;
  v30 = *(unsigned __int8 *)(v10 + 80);
  v31 = (v3 + v30 + v29) & ~v30;
  v32 = swift_allocObject(&unk_100031720, v31 + v11, v28 | v30 | 7);
  *(_QWORD *)(v32 + 16) = v27;
  *(_QWORD *)(v32 + 24) = &protocol witness table for MainActor;
  sub_100019ECC(v26, v32 + v29, type metadata accessor for InviteActionsView);
  v35((char *)(v32 + v31), v13, v9);
  v33 = sub_100006488(v38, (uint64_t)&unk_100034D00, v32);
  swift_release(v33);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_10000F858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = type metadata accessor for MainActor(0);
  v5[2] = v7;
  v5[3] = static MainActor.shared.getter(v7);
  v8 = (_QWORD *)swift_task_alloc(dword_100034D0C);
  v5[4] = v8;
  *v8 = v5;
  v8[1] = sub_10000F8D0;
  return sub_10000E35C(a5, 1);
}

uint64_t sub_10000F8D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001B8D0, v2, v3);
}

uint64_t sub_10000F940@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F964(0xD00000000000001FLL, 0x800000010002B030, (uint64_t (*)(uint64_t))&static Color.white.getter, a1);
}

uint64_t sub_10000F964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);

  v46 = a3;
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = String.LocalizationValue.init(stringLiteral:)(a1, a2);
  v20 = static LocalizedStringResource.BundleDescription.familyCircleUI.getter(v19);
  static Locale.current.getter(v20);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v15, 0, 0, v9, v12, 0, 0, 256);
  v21 = Text.init(_:)(v18);
  v23 = v22;
  v25 = v24;
  v27 = v26 & 1;
  v28 = static Font.subheadline.getter();
  v29 = Text.font(_:)(v28, v21, v23, v27, v25);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  swift_release(v28);
  LOBYTE(v28) = v33 & 1;
  sub_1000143C8(v21, v23, v27);
  v36 = swift_bridgeObjectRelease(v25);
  v37 = v46(v36);
  v38 = Text.foregroundColor(_:)(v37, v29, v31, v33 & 1, v35);
  v40 = v39;
  LOBYTE(v27) = v41;
  v43 = v42;
  swift_release(v37);
  sub_1000143C8(v29, v31, v28);
  result = swift_bridgeObjectRelease(v35);
  *(_QWORD *)a4 = v38;
  *(_QWORD *)(a4 + 8) = v40;
  *(_BYTE *)(a4 + 16) = v27 & 1;
  *(_QWORD *)(a4 + 24) = v43;
  return result;
}

uint64_t sub_10000FB94(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[16] = a1;
  v2 = type metadata accessor for Logger(0);
  v1[17] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[18] = v3;
  v1[19] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v1[20] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[21] = v5;
  v1[22] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MainActor(0);
  v1[23] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v1[24] = v7;
  v1[25] = v8;
  return swift_task_switch(sub_10000FC50, v7, v8);
}

uint64_t sub_10000FC50()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0 + 2;
  v2 = v0[22];
  v0[26] = objc_msgSend(objc_allocWithZone((Class)FAURLConfiguration), "init");
  v3 = objc_msgSend(objc_allocWithZone((Class)FAURLConfiguration), "init");
  v0[27] = v3;
  v4 = FAURLEndpointPendingInviteActionFromMessagesV1;
  v0[7] = v2;
  v0[2] = v0;
  v0[3] = sub_10000FD2C;
  v5 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_10001001C;
  v6[3] = &unk_1000317A0;
  v6[4] = v5;
  objc_msgSend(v3, "URLForEndpoint:withCompletion:", v4, v6);
  return swift_continuation_await(v1);
}

uint64_t sub_10000FD2C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 224) = v2;
  if (v2)
    v3 = sub_10000FE20;
  else
    v3 = sub_10000FD88;
  return swift_task_switch(v3, *(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 200));
}

uint64_t sub_10000FD88()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 128);

  swift_release(v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v6, v2, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v6, 0, 1, v4);

  v7 = *(_QWORD *)(v0 + 152);
  swift_task_dealloc(*(_QWORD *)(v0 + 176));
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000FE20()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  void *v9;
  uint8_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *(void **)(v0 + 216);
  v1 = *(_QWORD *)(v0 + 224);
  v3 = swift_release(*(_QWORD *)(v0 + 184));
  swift_willThrow(v3);

  static FamilyLogger.extension.getter(v4);
  swift_errorRetain(v1);
  v5 = swift_errorRetain(v1);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 224);
    v9 = *(void **)(v0 + 208);
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    swift_errorRetain(v8);
    v12 = _swift_stdlib_bridgeErrorToNSError(v8);
    *(_QWORD *)(v0 + 120) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 120, v0 + 128);
    *v11 = v12;
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to retrieve PendingInviteActionFromMessagesV1 from config bag. Falling back to url from messages payload. Error: %@", v10, 0xCu);
    v13 = sub_1000070B8(&qword_100034C58);
    swift_arrayDestroy(v11, 1, v13);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    swift_errorRelease(v8);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 224);

    swift_errorRelease(v14);
    swift_errorRelease(v14);
    swift_errorRelease(v14);

  }
  v15 = *(_QWORD *)(v0 + 160);
  v16 = *(_QWORD *)(v0 + 168);
  v17 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v17, 1, 1, v15);
  v18 = *(_QWORD *)(v0 + 152);
  swift_task_dealloc(*(_QWORD *)(v0 + 176));
  swift_task_dealloc(v18);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001001C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v16;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v11 = sub_1000070B8(&qword_100034D48);
    v12 = swift_allocError(v11, &protocol self-conformance witness table for Error, 0, 0);
    *v13 = a3;
    v14 = a3;
    return swift_continuation_throwingResumeWithError(v10, v12);
  }
  else
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a2);
    (*(void (**)(_QWORD, char *, uint64_t))(v7 + 32))(*(_QWORD *)(*(_QWORD *)(v10 + 64) + 40), v9, v6);
    return swift_continuation_throwingResume(v10);
  }
}

uint64_t sub_10001010C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  v7 = sub_1000070B8(&qword_100034868);
  v6[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v6[8] = static MainActor.shared.getter(v8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v6[9] = v9;
  v6[10] = v10;
  return swift_task_switch(sub_1000101A0, v9, v10);
}

uint64_t sub_1000101A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = v0[4];
  URL.init(string:)(*(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
  v2 = type metadata accessor for InviteMessageView(0);
  v0[11] = v2;
  v3 = *sub_10001A340((_QWORD *)(v1 + *(int *)(v2 + 28)), *(_QWORD *)(v1 + *(int *)(v2 + 28) + 24));
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100034C50
                                                                                    + dword_100034C50);
  v4 = (_QWORD *)swift_task_alloc(unk_100034C54);
  v0[12] = v4;
  *v4 = v0;
  v4[1] = sub_100010254;
  return v6(v0[7], v0[5], v0[6], v3, 0x7542747065636341, 0xEC0000006E6F7474);
}

uint64_t sub_100010254()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*v0 + 96));
  sub_100008080(v2, &qword_100034868);
  return swift_task_switch(sub_1000102B4, *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80));
}

uint64_t sub_1000102B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 64));
  v4 = (char *)(v3 + *(int *)(v1 + 32));
  v5 = *v4;
  v6 = *((_QWORD *)v4 + 1);
  *(_BYTE *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v6;
  *(_BYTE *)(v0 + 104) = 0;
  v7 = sub_1000070B8(&qword_1000349F8);
  State.wrappedValue.setter(v0 + 104, v7);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  v5 = type metadata accessor for Locale(0);
  v4[22] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for String.LocalizationValue(0);
  v4[23] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  v4[24] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[25] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[26] = swift_task_alloc(v9);
  v4[27] = swift_task_alloc(v9);
  v10 = type metadata accessor for MainActor(0);
  v4[28] = static MainActor.shared.getter();
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v4[29] = v11;
  v4[30] = v12;
  return swift_task_switch(sub_100010420, v11, v12);
}

uint64_t sub_100010420()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char *v6;

  v1 = v0[21];
  v3 = *(_QWORD *)(v1 + 96);
  v2 = *(_QWORD *)(v1 + 104);
  v6 = (char *)&dword_100035018 + dword_100035018;
  v4 = (_QWORD *)swift_task_alloc(unk_10003501C);
  v0[31] = v4;
  *v4 = v0;
  v4[1] = sub_100010494;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))v6)(v0[18], v3, v2, v0[19]);
}

uint64_t sub_100010494(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 248);
  *(_QWORD *)(v3 + 256) = a1;
  *(_BYTE *)(v3 + 264) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_1000104F0, *(_QWORD *)(v3 + 232), *(_QWORD *)(v3 + 240));
}

uint64_t sub_1000104F0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSString v45;
  NSString v46;
  NSString v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v1 = *(_BYTE *)(v0 + 264);
  swift_release(*(_QWORD *)(v0 + 224));
  if ((v1 & 1) != 0)
  {
    v12 = v0 + 88;
    v13 = *(_QWORD *)(v0 + 256);
    v14 = *(_QWORD *)(v0 + 152);
    type metadata accessor for FamilyInviteAnalytics(0);
    v15 = swift_errorRetain(v13);
    v16 = (void *)static FamilyInviteAnalytics.shared.getter(v15);
    if (v14 == 1)
      v17 = 0x6465747065636341;
    else
      v17 = 0x64656E696C636544;
    dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteStatusUpdateEvent(updateStatus:success:)(v17, 0xE800000000000000, 0);
    swift_bridgeObjectRelease(0xE800000000000000);

    static FamilyLogger.extension.getter(v18);
    sub_10001AE74(v13, 1);
    v19 = sub_10001AE74(v13, 1);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    v22 = os_log_type_enabled(v20, v21);
    v23 = *(_QWORD *)(v0 + 256);
    v24 = *(_QWORD *)(v0 + 216);
    v25 = *(_QWORD *)(v0 + 192);
    v26 = *(_QWORD *)(v0 + 200);
    if (v22)
    {
      v53 = *(_QWORD *)(v0 + 200);
      v54 = *(_QWORD *)(v0 + 216);
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(32, -1);
      v55 = v28;
      *(_DWORD *)v27 = 136315138;
      swift_getErrorValue(v13, v0 + 120, v0 + 64);
      v29 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
      v31 = v30;
      *(_QWORD *)(v0 + 136) = sub_100026DB4(v29, v30, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144);
      swift_bridgeObjectRelease(v31);
      sub_10001AE80(v23, 1);
      sub_10001AE80(v23, 1);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Updating invite status failed with error %s", v27, 0xCu);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      v32 = v27;
      v12 = v0 + 88;
      swift_slowDealloc(v32, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v25);
    }
    else
    {
      sub_10001AE80(*(_QWORD *)(v0 + 256), 1);
      sub_10001AE80(v23, 1);

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    }
    v33 = *(_QWORD *)(v0 + 256);
    v34 = *(_QWORD *)(v0 + 176);
    v35 = *(_QWORD *)(v0 + 184);
    v36 = *(void **)(v0 + 160);
    v37 = String.LocalizationValue.init(stringLiteral:)(0x49545F5452454C41, 0xEB00000000454C54);
    static Locale.current.getter(v37);
    String.init(localized:table:bundle:locale:comment:)(v35, 0, 0, 0, v34, 0, 0, 256);
    v39 = v38;
    swift_getErrorValue(v13, v0 + 128, v12);
    Error.localizedDescription.getter(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
    v41 = v40;
    v42 = String.LocalizationValue.init(stringLiteral:)(19279, 0xE200000000000000);
    static Locale.current.getter(v42);
    String.init(localized:table:bundle:locale:comment:)(v35, 0, 0, 0, v34, 0, 0, 256);
    v44 = v43;
    v45 = String._bridgeToObjectiveC()();
    v46 = String._bridgeToObjectiveC()();
    v47 = String._bridgeToObjectiveC()();
    *(_QWORD *)(v0 + 48) = nullsub_1;
    *(_QWORD *)(v0 + 56) = 0;
    *(_QWORD *)(v0 + 16) = _NSConcreteStackBlock;
    *(_QWORD *)(v0 + 24) = 1107296256;
    *(_QWORD *)(v0 + 32) = sub_100009F28;
    *(_QWORD *)(v0 + 40) = &unk_100031778;
    v48 = _Block_copy((const void *)(v0 + 16));
    objc_msgSend(v36, "_presentAlertWithTitle:message:buttonTitle:completion:", v45, v46, v47, v48);
    _Block_release(v48);

    sub_10001AE80(v33, 1);
    swift_bridgeObjectRelease(v44);
    swift_bridgeObjectRelease(v41);
    swift_bridgeObjectRelease(v39);
    sub_10001AE80(v33, 1);
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 152);
    v3 = type metadata accessor for FamilyInviteAnalytics(0);
    v4 = (void *)static FamilyInviteAnalytics.shared.getter(v3);
    if (v2 == 1)
      v5 = 0x6465747065636341;
    else
      v5 = 0x64656E696C636544;
    dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteStatusUpdateEvent(updateStatus:success:)(v5, 0xE800000000000000, 1);
    swift_bridgeObjectRelease(0xE800000000000000);

    v7 = static FamilyLogger.extension.getter(v6);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = *(_QWORD *)(v0 + 152);
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v11 = 134217984;
      *(_QWORD *)(v0 + 112) = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Updated invite status to %ld", v11, 0xCu);
      swift_slowDealloc(v11, -1, -1);
    }

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  }
  v49 = *(_QWORD *)(v0 + 208);
  v51 = *(_QWORD *)(v0 + 176);
  v50 = *(_QWORD *)(v0 + 184);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010A24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0x4024000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v3 = sub_1000070B8(&qword_100034C68);
  return sub_10000C90C(v1, a1 + *(int *)(v3 + 44), 0.15, 0.25);
}

uint64_t sub_100010A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t (*v19)(_QWORD);
  char v20;
  char v21;
  uint64_t v23;

  v1 = type metadata accessor for SettingsView(0);
  v2 = __chkstk_darwin(v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v23 - v6;
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v23 - v9;
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v23 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v23 - v15;
  v17 = v0 + *(int *)(v14 + 20);
  v18 = *(unsigned __int8 *)(v17 + 233);
  sub_10000737C(v0, (uint64_t)&v23 - v15, v19);
  if (v18 == 1)
    __asm { BR              X10 }
  sub_1000073C0((uint64_t)v16, type metadata accessor for SettingsView);
  sub_10000737C(v0, (uint64_t)v13, type metadata accessor for SettingsView);
  v20 = v13[*(int *)(v1 + 20) + 233];
  sub_10000737C((uint64_t)v13, (uint64_t)v10, type metadata accessor for SettingsView);
  if ((v20 & 1) == 0)
    __asm { BR              X10 }
  sub_1000073C0((uint64_t)v10, type metadata accessor for SettingsView);
  sub_1000073C0((uint64_t)v13, type metadata accessor for SettingsView);
  v21 = *(_BYTE *)(v17 + 233);
  sub_10000737C(v0, (uint64_t)v7, type metadata accessor for SettingsView);
  if ((v21 & 1) == 0)
    __asm { BR              X10 }
  sub_1000073C0((uint64_t)v7, type metadata accessor for SettingsView);
  sub_10000737C(v0, (uint64_t)v4, type metadata accessor for SettingsView);
  sub_1000073C0((uint64_t)v4, type metadata accessor for SettingsView);
  return 0;
}

uint64_t sub_100010F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v64 = a1;
  v71 = a2;
  v2 = type metadata accessor for SettingsView(0);
  v60 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v61 = v3;
  v62 = (uint64_t)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000070B8(&qword_100034BE8);
  __chkstk_darwin(v4);
  v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000070B8(&qword_100034BF0);
  v8 = *(_QWORD *)(v7 - 8);
  v67 = v7;
  v68 = v8;
  __chkstk_darwin(v7);
  v63 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000070B8(&qword_100034BF8);
  v11 = __chkstk_darwin(v10);
  v70 = (uint64_t)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v65 = (uint64_t)&v59 - v13;
  v14 = sub_1000070B8(&qword_100034C00);
  v15 = __chkstk_darwin(v14);
  v69 = (uint64_t)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v59 - v18;
  v20 = static HorizontalAlignment.leading.getter(v17);
  sub_100011444(&v72);
  v21 = v72;
  v22 = v73;
  v24 = v74;
  v23 = v75;
  v25 = v76;
  v72 = v20;
  v73 = 0;
  v26 = 1;
  LOBYTE(v74) = 1;
  v75 = v21;
  v76 = v22;
  v77 = v24;
  v78 = v23;
  v79 = v25;
  v27 = sub_1000070B8(&qword_100034C08);
  v28 = sub_10001B88C(&qword_100034C10, &qword_100034C08, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v66 = v19;
  View.accessibilityHidden(_:)(1, v27, v28);
  swift_release(v23);
  swift_release(v22);
  swift_release(v21);
  v29 = v64;
  swift_release(v24);
  swift_release(v25);
  v30 = sub_100010A7C();
  if (v31)
  {
    v32 = v30;
    v33 = v31;
    *(_QWORD *)v6 = static HorizontalAlignment.trailing.getter();
    *((_QWORD *)v6 + 1) = 0;
    v6[16] = 1;
    sub_1000070B8(&qword_100034C20);
    v34 = v62;
    sub_10000737C(v29, v62, type metadata accessor for SettingsView);
    v35 = *(unsigned __int8 *)(v60 + 80);
    v36 = (v35 + 16) & ~v35;
    v37 = swift_allocObject(&unk_100031608, v36 + v61, v35 | 7);
    v38 = sub_100019ECC(v34, v37 + v36, type metadata accessor for SettingsView);
    __chkstk_darwin(v38);
    *(&v59 - 2) = v32;
    *(&v59 - 1) = v33;
    sub_1000070B8(&qword_100034C28);
    sub_10001B4A0(&qword_100034C30, &qword_100034C28);
    Button.init(action:label:)(sub_100019F10, v37, sub_100019F48);
    v39 = swift_bridgeObjectRelease(v33);
    v40 = static Edge.Set.top.getter(v39);
    v41 = EdgeInsets.init(_all:)(3.0);
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v48 = v63;
    sub_1000079E4((uint64_t)v6, v63, &qword_100034BE8);
    v49 = v67;
    v50 = v48 + *(int *)(v67 + 36);
    *(_BYTE *)v50 = v40;
    *(double *)(v50 + 8) = v41;
    *(_QWORD *)(v50 + 16) = v43;
    *(_QWORD *)(v50 + 24) = v45;
    *(_QWORD *)(v50 + 32) = v47;
    *(_BYTE *)(v50 + 40) = 0;
    sub_100008080((uint64_t)v6, &qword_100034BE8);
    v51 = v65;
    sub_10001B1B8(v48, v65, &qword_100034BF0);
    v26 = 0;
    v52 = v49;
  }
  else
  {
    v52 = v67;
    v51 = v65;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56))(v51, v26, 1, v52);
  v53 = (uint64_t)v66;
  v54 = v69;
  sub_1000079E4((uint64_t)v66, v69, &qword_100034C00);
  v55 = v70;
  sub_1000079E4(v51, v70, &qword_100034BF8);
  v56 = v71;
  sub_1000079E4(v54, v71, &qword_100034C00);
  v57 = sub_1000070B8(&qword_100034C18);
  sub_1000079E4(v55, v56 + *(int *)(v57 + 48), &qword_100034BF8);
  sub_100008080(v51, &qword_100034BF8);
  sub_100008080(v53, &qword_100034C00);
  sub_100008080(v55, &qword_100034BF8);
  return sub_100008080(v54, &qword_100034C00);
}

uint64_t sub_100011444@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v2 = sub_1000070B8(&qword_100034C60);
  __chkstk_darwin(v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = Image.init(systemName:)(0x6F6C2E656C707061, 0xEA00000000006F67);
  v6 = static Color.gray.getter();
  KeyPath = swift_getKeyPath(&unk_10002A348);
  v8 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 1, 1, v8);
  v9 = static Font.system(size:weight:design:)(0, 1, v4, 15.0);
  sub_100008080((uint64_t)v4, &qword_100034C60);
  result = swift_getKeyPath(&unk_10002A378);
  *a1 = v5;
  a1[1] = KeyPath;
  a1[2] = v6;
  a1[3] = result;
  a1[4] = v9;
  return result;
}

void sub_100011550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
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
  uint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];
  id v57;

  v1 = v0;
  v56[0] = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v56[0] - 8);
  __chkstk_darwin(v56[0]);
  v4 = (char *)v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SettingsView(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000070B8(&qword_1000347E8);
  __chkstk_darwin(v9);
  v11 = (char *)v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000070B8(&qword_100034868);
  __chkstk_darwin(v12);
  v14 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100010A7C();
  if (!v16)
  {
LABEL_7:
    v23 = type metadata accessor for InviteMessageView(0);
    v24 = v1 + *(int *)(v23 + 24);
    v25 = *(void **)v24;
    if (*(_QWORD *)v24)
    {
      v26 = *(_QWORD *)(v24 + 8);
      type metadata accessor for FamilyInviteAnalytics(0);
      v27 = v25;
      v28 = (void *)static FamilyInviteAnalytics.shared.getter();
      v29 = 8 * *(char *)(v1 + 232);
      v30 = *(_QWORD *)((char *)&unk_10002A528 + v29);
      dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteInteractionEvent(action:inviteState:isReceiver:)(0x726F4D6E7261654CLL, 0xE900000000000065, *(_QWORD *)&aAccepteddeclin[v29], v30, (*(_BYTE *)(v1 + 233) & 1) == 0);

      swift_bridgeObjectRelease(v30);
      v31 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v11, 1, 1, v31);
      sub_10000737C(v1, (uint64_t)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SettingsView);
      type metadata accessor for MainActor(0);
      v32 = v27;
      v33 = static MainActor.shared.getter();
      v34 = *(unsigned __int8 *)(v6 + 80);
      v35 = (v34 + 32) & ~v34;
      v36 = (v7 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
      v37 = swift_allocObject(&unk_100031630, v36 + 16, v34 | 7);
      *(_QWORD *)(v37 + 16) = v33;
      *(_QWORD *)(v37 + 24) = &protocol witness table for MainActor;
      sub_100019ECC((uint64_t)v8, v37 + v35, type metadata accessor for SettingsView);
      v38 = (_QWORD *)(v37 + v36);
      *v38 = v32;
      v38[1] = v26;
      v39 = sub_1000064A8((uint64_t)v11, (uint64_t)&unk_100034C40, v37);
      swift_release(v39);

    }
    else
    {
      v49 = static FamilyLogger.extension.getter(v23);
      v50 = Logger.logObject.getter(v49);
      v51 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "No presenter, return", v52, 2u);
        swift_slowDealloc(v52, -1, -1);
      }

      (*(void (**)(char *, _QWORD))(v2 + 8))(v4, v56[0]);
    }
    return;
  }
  v17 = v16;
  v18 = v1 + *(int *)(v5 + 20);
  v19 = *(_QWORD *)(v18 + 176);
  v20 = *(_QWORD *)(v18 + 184);
  if (v15 == v19 && v16 == v20)
  {
    swift_bridgeObjectRelease(v16);
  }
  else
  {
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v19, v20, 0);
    swift_bridgeObjectRelease(v17);
    if ((v22 & 1) == 0)
      goto LABEL_7;
  }
  type metadata accessor for FamilyInviteAnalytics(0);
  v40 = (void *)static FamilyInviteAnalytics.shared.getter();
  v41 = 8 * *(char *)(v1 + 232);
  v42 = *(_QWORD *)((char *)&unk_10002A528 + v41);
  dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteInteractionEvent(action:inviteState:isReceiver:)(0xD000000000000012, 0x800000010002AFD0, *(_QWORD *)&aAccepteddeclin[v41], v42, (*(_BYTE *)(v1 + 233) & 1) == 0);

  swift_bridgeObjectRelease(v42);
  v43 = (void *)objc_opt_self(FamilySettingsDestinations);
  v57 = 0;
  v44 = objc_msgSend(v43, "urlDestinationTo:error:", 1, &v57);
  v45 = v57;
  if (v44)
  {
    v46 = v44;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v47 = v45;

    v48 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v14, 0, 1, v48);
  }
  else
  {
    v53 = v57;
    v54 = _convertNSErrorToError(_:)(v45);

    swift_willThrow();
    swift_errorRelease(v54);
    v55 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v14, 1, 1, v55);
  }
  sub_100011CD0((uint64_t)v14);
  sub_100008080((uint64_t)v14, &qword_100034868);
}

__n128 sub_100011A08@<Q0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __n128 result;
  uint64_t v55;
  _OWORD v56[9];

  v6 = type metadata accessor for LocalizedStringKey.StringInterpolation(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 2);
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v9);
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v10);
  v11._countAndFlagsBits = 32;
  v11._object = (void *)0xE100000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v11);
  v12 = Image.init(systemName:)(0x2E6E6F7276656863, 0xEF64726177726F66);
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
  swift_release(v12);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v13);
  v14 = LocalizedStringKey.init(stringInterpolation:)(v8);
  v15 = Text.init(_:tableName:bundle:comment:)(v14);
  v17 = v16;
  v19 = v18;
  v21 = v20 & 1;
  v22 = static Font.footnote.getter(v15);
  v23 = Text.font(_:)(v22, v15, v17, v21, v19);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  swift_release(v22);
  sub_1000143C8(v15, v17, v21);
  v30 = swift_bridgeObjectRelease(v19);
  v31 = static Font.Weight.semibold.getter(v30);
  v32 = Text.fontWeight(_:)(*(_QWORD *)&v31, 0, v23, v25, v27 & 1, v29);
  v34 = v33;
  v36 = v35;
  v38 = v37 & 1;
  sub_1000143C8(v23, v25, v27 & 1);
  v39 = swift_bridgeObjectRelease(v29);
  v40 = static Color.gray.getter(v39);
  v41 = Text.foregroundColor(_:)(v40, v32, v34, v38, v36);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  swift_release(v40);
  sub_1000143C8(v32, v34, v38);
  v48 = swift_bridgeObjectRelease(v36);
  v49 = static Alignment.trailing.getter(v48);
  sub_10000C720(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v56, 0.0, 1, 0.0, 1, v49, v50, v41, v43, v45 & 1, v47);
  sub_1000143C8(v41, v43, v45 & 1);
  swift_bridgeObjectRelease(v47);
  v51 = v56[7];
  *(_OWORD *)(a3 + 96) = v56[6];
  *(_OWORD *)(a3 + 112) = v51;
  *(_OWORD *)(a3 + 128) = v56[8];
  v52 = v56[3];
  *(_OWORD *)(a3 + 32) = v56[2];
  *(_OWORD *)(a3 + 48) = v52;
  v53 = v56[5];
  *(_OWORD *)(a3 + 64) = v56[4];
  *(_OWORD *)(a3 + 80) = v53;
  result = (__n128)v56[1];
  *(_OWORD *)a3 = v56[0];
  *(__n128 *)(a3 + 16) = result;
  return result;
}

id sub_100011CD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  void *v31;
  char *v32;
  uint64_t (*v33)(char *, char *, uint64_t);
  char *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  NSURL *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  id v54;
  char *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  Class isa;
  void *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint8_t *v67;
  uint8_t *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v2 = type metadata accessor for Logger(0);
  v73 = *(_QWORD *)(v2 - 8);
  v74 = v2;
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v69 - v7;
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v69 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v69 - v12;
  v14 = sub_1000070B8(&qword_100034868);
  __chkstk_darwin(v14);
  v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URL(0);
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v69 - v21;
  v24 = v23;
  sub_1000079E4(a1, (uint64_t)v16, &qword_100034868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v16, 1, v17) == 1)
  {
    v25 = sub_100008080((uint64_t)v16, &qword_100034868);
    v26 = static FamilyLogger.extension.getter(v25);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "invalid url", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v73 + 8))(v5, v74);
    return 0;
  }
  v72 = v11;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v22, v16, v17);
  v30 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (!v30)
  {
    v50 = static FamilyLogger.extension.getter(0);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "no workspace", v53, 2u);
      swift_slowDealloc(v53, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v73 + 8))(v8, v74);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v17);
    return 0;
  }
  v31 = v30;
  v32 = v13;
  static FamilyLogger.extension.getter(v30);
  v33 = *(uint64_t (**)(char *, char *, uint64_t))(v24 + 16);
  v34 = v20;
  v71 = v22;
  v35 = v33(v20, v22, v17);
  v36 = Logger.logObject.getter(v35);
  v37 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc(12, -1);
    v39 = swift_slowAlloc(32, -1);
    v76 = v39;
    v70 = v24;
    *(_DWORD *)v38 = 136315138;
    v69 = v38 + 4;
    v40 = sub_1000144C4(&qword_100034C48, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v41 = dispatch thunk of CustomStringConvertible.description.getter(v17, v40);
    v43 = v42;
    v75 = sub_100026DB4(v41, v42, &v76);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76);
    swift_bridgeObjectRelease(v43);
    v44 = *(void (**)(char *, uint64_t))(v70 + 8);
    v44(v34, v17);
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Opening url %s", v38, 0xCu);
    swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
    v45 = v39;
    v46 = v44;
    swift_slowDealloc(v45, -1, -1);
    swift_slowDealloc(v38, -1, -1);

    v47 = v74;
    v48 = *(void (**)(char *, uint64_t))(v73 + 8);
    v48(v32, v74);
  }
  else
  {
    v46 = *(void (**)(char *, uint64_t))(v24 + 8);
    v46(v34, v17);

    v47 = v74;
    v48 = *(void (**)(char *, uint64_t))(v73 + 8);
    v48(v13, v74);
  }
  v55 = v71;
  URL._bridgeToObjectiveC()(v49);
  v57 = v56;
  v58 = sub_100020F94((uint64_t)&_swiftEmptyArrayStorage);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v58);
  v60 = v31;
  v54 = objc_msgSend(v31, "openSensitiveURL:withOptions:", v57, isa);

  v61 = v72;
  v63 = static FamilyLogger.extension.getter(v62);
  v64 = Logger.logObject.getter(v63);
  v65 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v64, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v66 = 67109120;
    v55 = v71;
    LODWORD(v76) = (_DWORD)v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, (char *)&v76 + 4);
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "Did open Family Settings: %{BOOL}d", v66, 8u);
    v67 = v66;
    v61 = v72;
    swift_slowDealloc(v67, -1, -1);
  }

  v48(v61, v47);
  v46(v55, v17);
  return v54;
}

uint64_t sub_1000122C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  v7 = sub_1000070B8(&qword_100034868);
  v6[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v6[7] = static MainActor.shared.getter();
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v6[8] = v9;
  v6[9] = v10;
  return swift_task_switch(sub_100012354, v9, v10);
}

uint64_t sub_100012354()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char *v7;

  v1 = v0[3];
  v2 = type metadata accessor for SettingsView(0);
  URL.init(string:)(*(_QWORD *)(v1 + *(int *)(v2 + 20) + 96), *(_QWORD *)(v1 + *(int *)(v2 + 20) + 104));
  v3 = type metadata accessor for InviteMessageView(0);
  v4 = *sub_10001A340((_QWORD *)(v1 + *(int *)(v3 + 28)), *(_QWORD *)(v1 + *(int *)(v3 + 28) + 24));
  v7 = (char *)&dword_100034C50 + dword_100034C50;
  v5 = (_QWORD *)swift_task_alloc(unk_100034C54);
  v0[10] = v5;
  *v5 = v0;
  v5[1] = sub_100012420;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, unint64_t))v7)(v0[6], v0[4], v0[5], v4, 0x726F4D6E7261654CLL, 0xED00006B6E694C65);
}

uint64_t sub_100012420(char a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 80);
  v4 = *(_QWORD *)(*v1 + 48);
  *(_BYTE *)(*v1 + 88) = a1;
  swift_task_dealloc(v3);
  sub_100008080(v4, &qword_100034868);
  return swift_task_switch(sub_10001248C, *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72));
}

uint64_t sub_10001248C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  _BYTE *v3;

  v1 = *(_BYTE *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_BYTE **)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 56));
  *v3 = v1;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000124D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = sub_1000070B8(&qword_100034BE0);
  return sub_100010F64(v1, a1 + *(int *)(v3 + 44));
}

double sub_100012520@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  double result;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  __int128 v20;

  v2 = type metadata accessor for Image.ResizingMode(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = Image.init(_:bundle:)(0x6349796C696D6146, 0xEA00000000006E6FLL, 0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
  v7 = Image.resizable(capInsets:resizingMode:)(v5, v6, 0.0, 0.0, 0.0, 0.0);
  swift_release(v6);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = static Alignment.leading.getter(v8);
  _FrameLayout.init(width:height:alignment:)(&v16, 0x404E000000000000, 0, 0x404E000000000000, 0, v9, v10);
  v11 = v16;
  v12 = v17;
  v13 = v18;
  v14 = v19;
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = v12;
  *(_QWORD *)(a1 + 24) = v13;
  *(_BYTE *)(a1 + 32) = v14;
  result = *(double *)&v20;
  *(_OWORD *)(a1 + 40) = v20;
  return result;
}

uint64_t sub_100012654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v19;
  char v20;
  _OWORD v21[7];

  v6 = sub_1000070B8(&qword_100034D60);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = static HorizontalAlignment.leading.getter(v7);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 0;
  v10 = sub_1000070B8(&qword_100034D68);
  v11 = sub_100012794(a1, a2, (uint64_t)&v9[*(int *)(v10 + 44)]);
  v12 = static Alignment.center.getter(v11);
  v20 = 1;
  v19 = 1;
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v21, 0, 1, 0, 1, 0x7FF0000000000000, 0, 0x4041000000000000, 0, 0, v19, 0, v20, v12, v13);
  sub_1000079E4((uint64_t)v9, a3, &qword_100034D60);
  v14 = (_OWORD *)(a3 + *(int *)(sub_1000070B8(&qword_100034D70) + 36));
  v15 = v21[5];
  v14[4] = v21[4];
  v14[5] = v15;
  v14[6] = v21[6];
  v16 = v21[1];
  *v14 = v21[0];
  v14[1] = v16;
  v17 = v21[3];
  v14[2] = v21[2];
  v14[3] = v17;
  return sub_100008080((uint64_t)v9, &qword_100034D60);
}

uint64_t sub_100012794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  _QWORD *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;

  v24 = a1;
  v25 = a2;
  v4 = sub_1000070B8(&qword_100034D78);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v24 - v9;
  v11 = static Alignment.center.getter(v8);
  v13 = _FrameLayout.init(width:height:alignment:)(&v26, 0, 1, 0x4030000000000000, 0, v11, v12);
  v14 = v26;
  v15 = v27;
  v16 = v28;
  v17 = v29;
  v18 = v30;
  v19 = v31;
  *(_QWORD *)v10 = static HorizontalAlignment.leading.getter(v13);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 0;
  v20 = &v10[*(int *)(sub_1000070B8(&qword_100034D80) + 44)];
  *(_QWORD *)v20 = static VerticalAlignment.center.getter();
  *((_QWORD *)v20 + 1) = 0x4010000000000000;
  v20[16] = 0;
  v21 = sub_1000070B8(&qword_100034D88);
  sub_10001292C(v24, v25, (uint64_t)&v20[*(int *)(v21 + 44)]);
  sub_1000079E4((uint64_t)v10, (uint64_t)v7, &qword_100034D78);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  *(_QWORD *)(a3 + 16) = v14;
  *(_BYTE *)(a3 + 24) = v15;
  *(_QWORD *)(a3 + 32) = v16;
  *(_BYTE *)(a3 + 40) = v17;
  *(_QWORD *)(a3 + 48) = v18;
  *(_QWORD *)(a3 + 56) = v19;
  *(_WORD *)(a3 + 64) = 257;
  v22 = sub_1000070B8(&qword_100034D90);
  sub_1000079E4((uint64_t)v7, a3 + *(int *)(v22 + 64), &qword_100034D78);
  sub_100008080((uint64_t)v10, &qword_100034D78);
  return sub_100008080((uint64_t)v7, &qword_100034D78);
}

uint64_t sub_10001292C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[2];

  v69 = a1;
  v70 = a2;
  v71 = a3;
  v3 = type metadata accessor for ControlSize(0);
  v67 = *(_QWORD *)(v3 - 8);
  v68 = v3;
  __chkstk_darwin(v3);
  v66 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CircularProgressViewStyle(0);
  v65 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000070B8(&qword_100034D98);
  v63 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000070B8(&qword_100034DA0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000070B8(&qword_100034DA8);
  __chkstk_darwin(v15);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_1000070B8(&qword_100034DB0);
  v18 = __chkstk_darwin(v62);
  v72 = (uint64_t)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v18);
  v64 = (uint64_t)&v61 - v21;
  v22 = ProgressView<>.init<>()(v20);
  CircularProgressViewStyle.init()(v22);
  v23 = sub_10001B88C(&qword_100034DB8, &qword_100034D98, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
  v24 = sub_1000144C4(&qword_100034DC0, (uint64_t (*)(uint64_t))&type metadata accessor for CircularProgressViewStyle, (uint64_t)&protocol conformance descriptor for CircularProgressViewStyle);
  View.progressViewStyle<A>(_:)(v7, v8, v5, v23, v24);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v10, v8);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v14, v11);
  *(_WORD *)&v17[*(int *)(v15 + 36)] = 257;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v26 = v66;
  v25 = v67;
  v27 = v68;
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v66, enum case for ControlSize.small(_:), v68);
  KeyPath = swift_getKeyPath(&unk_10002A3A8);
  v29 = v72;
  v30 = (uint64_t *)(v72 + *(int *)(v62 + 36));
  v31 = sub_1000070B8(&qword_100034DC8);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))((char *)v30 + *(int *)(v31 + 28), v26, v27);
  *v30 = KeyPath;
  sub_1000079E4((uint64_t)v17, v29, &qword_100034DA8);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  sub_100008080((uint64_t)v17, &qword_100034DA8);
  v32 = v64;
  sub_10001B1B8(v29, v64, &qword_100034DB0);
  v33 = v70;
  v73[0] = v69;
  v73[1] = v70;
  v34 = sub_10001525C();
  swift_bridgeObjectRetain(v33);
  v35 = Text.init<A>(_:)(v73, &type metadata for String, v34);
  v37 = v36;
  v39 = v38;
  v41 = v40 & 1;
  v42 = static Font.caption2.getter();
  v43 = Text.font(_:)(v42, v35, v37, v41, v39);
  v45 = v44;
  LOBYTE(v11) = v46;
  v48 = v47;
  swift_release(v42);
  LOBYTE(v42) = v11 & 1;
  sub_1000143C8(v35, v37, v41);
  swift_bridgeObjectRelease(v39);
  v49 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  v50 = Color.init(uiColor:)(v49);
  v51 = Text.foregroundColor(_:)(v50, v43, v45, v11 & 1, v48);
  v53 = v52;
  LOBYTE(v11) = v54;
  v56 = v55;
  swift_release(v50);
  sub_1000143C8(v43, v45, v42);
  swift_bridgeObjectRelease(v48);
  v57 = v72;
  sub_1000079E4(v32, v72, &qword_100034DB0);
  v58 = v71;
  sub_1000079E4(v57, v71, &qword_100034DB0);
  v59 = v58 + *(int *)(sub_1000070B8(&qword_100034DD0) + 48);
  *(_QWORD *)v59 = v51;
  *(_QWORD *)(v59 + 8) = v53;
  *(_BYTE *)(v59 + 16) = v11 & 1;
  *(_QWORD *)(v59 + 24) = v56;
  sub_1000152A0(v51, v53, v11 & 1);
  swift_bridgeObjectRetain(v56);
  sub_100008080(v32, &qword_100034DB0);
  sub_1000143C8(v51, v53, v11 & 1);
  swift_bridgeObjectRelease(v56);
  return sub_100008080(v57, &qword_100034DB0);
}

uint64_t sub_100012E10@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100012654(*v1, v1[1], a1);
}

uint64_t sub_100012E18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v18[8];
  _BYTE v19[135];
  char v20;
  __int128 v21;
  _BYTE v22[136];
  _QWORD v23[2];
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[23];

  v4 = static HorizontalAlignment.leading.getter(a1);
  sub_100012F70(a1, (uint64_t)v18);
  *(_OWORD *)&v19[71] = v18[4];
  *(_OWORD *)&v19[87] = v18[5];
  *(_OWORD *)&v19[103] = v18[6];
  *(_OWORD *)&v19[119] = v18[7];
  *(_OWORD *)&v19[7] = v18[0];
  *(_OWORD *)&v19[23] = v18[1];
  *(_OWORD *)&v19[39] = v18[2];
  *(_OWORD *)&v19[55] = v18[3];
  v21 = (unint64_t)v4;
  v22[0] = 0;
  v5 = *(_OWORD *)&v19[16];
  *(_OWORD *)&v22[33] = *(_OWORD *)&v19[32];
  v6 = *(_OWORD *)&v19[32];
  *(_OWORD *)&v22[17] = *(_OWORD *)&v19[16];
  v7 = *(_OWORD *)&v19[96];
  *(_OWORD *)&v22[81] = *(_OWORD *)&v19[80];
  v8 = *(_OWORD *)&v19[80];
  *(_OWORD *)&v22[97] = *(_OWORD *)&v19[96];
  v9 = *(_OWORD *)&v19[112];
  *(_OWORD *)&v22[113] = *(_OWORD *)&v19[112];
  v10 = *(_OWORD *)&v19[64];
  *(_OWORD *)&v22[49] = *(_OWORD *)&v19[48];
  v11 = *(_OWORD *)&v19[48];
  *(_OWORD *)&v22[65] = *(_OWORD *)&v19[64];
  v12 = *(_OWORD *)v19;
  *(_OWORD *)&v22[1] = *(_OWORD *)v19;
  v13 = *(_OWORD *)&v22[96];
  *(_OWORD *)(a2 + 96) = *(_OWORD *)&v22[80];
  *(_OWORD *)(a2 + 112) = v13;
  *(_OWORD *)(a2 + 128) = *(_OWORD *)&v22[112];
  v14 = *(_OWORD *)&v22[32];
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v22[16];
  *(_OWORD *)(a2 + 48) = v14;
  v15 = *(_OWORD *)&v22[64];
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v22[48];
  *(_OWORD *)(a2 + 80) = v15;
  v16 = *(_OWORD *)v22;
  *(_OWORD *)a2 = v21;
  *(_OWORD *)(a2 + 16) = v16;
  v30 = v8;
  v31 = v7;
  *(_OWORD *)v32 = v9;
  v26 = v5;
  v27 = v6;
  v28 = v11;
  v29 = v10;
  v20 = 0;
  *(_QWORD *)&v22[128] = *(_QWORD *)&v19[127];
  *(_QWORD *)(a2 + 144) = *(_QWORD *)&v19[127];
  v23[0] = v4;
  v23[1] = 0;
  v24 = 0;
  *(_QWORD *)&v32[15] = *(_QWORD *)&v19[127];
  v25 = v12;
  sub_10001A41C((uint64_t)&v21);
  return sub_10001A53C((uint64_t)v23);
}

uint64_t sub_100012F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[9];
  char v37;

  v32 = static VerticalAlignment.center.getter();
  v4 = sub_100013174((uint64_t *)a1, v36);
  v34 = v36[2];
  v35 = v36[1];
  v33 = v36[3];
  v30 = v36[5];
  v31 = v36[4];
  v28 = v36[7];
  v29 = v36[6];
  v26 = v36[0];
  v27 = v36[8];
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(unsigned __int8 *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = static Font.caption2.getter(v4);
  v10 = Text.font(_:)(v9, v5, v6, v7, v8);
  v12 = v11;
  LOBYTE(v8) = v13;
  v15 = v14;
  swift_release(v9);
  LOBYTE(v9) = v8 & 1;
  v16 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  v17 = Color.init(uiColor:)(v16);
  v18 = Text.foregroundColor(_:)(v17, v10, v12, v8 & 1, v15);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  swift_release(v17);
  sub_1000143C8(v10, v12, v9);
  swift_bridgeObjectRelease(v15);
  LOBYTE(v36[0]) = 0;
  v37 = v22 & 1;
  *(_QWORD *)a2 = v32;
  *(_QWORD *)(a2 + 8) = 0x4000000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = v26;
  *(_QWORD *)(a2 + 32) = v35;
  *(_QWORD *)(a2 + 40) = v34;
  *(_QWORD *)(a2 + 48) = v33;
  *(_QWORD *)(a2 + 56) = v31;
  *(_QWORD *)(a2 + 64) = v30;
  *(_QWORD *)(a2 + 72) = v29;
  *(_QWORD *)(a2 + 80) = v28;
  *(_QWORD *)(a2 + 88) = v27;
  *(_QWORD *)(a2 + 96) = v18;
  *(_QWORD *)(a2 + 104) = v20;
  *(_BYTE *)(a2 + 112) = v22 & 1;
  *(_QWORD *)(a2 + 120) = v24;
  sub_10001A4B0(v26, v35, v34, v33);
  sub_10001A4E0(v31, v30, v29, v28, v27);
  sub_1000152A0(v18, v20, v22 & 1);
  swift_bridgeObjectRetain(v24);
  sub_1000143C8(v18, v20, v22 & 1);
  swift_bridgeObjectRelease(v24);
  sub_10001A5D0(v26, v35, v34, v33);
  return sub_10001A600(v31, v30, v29, v28, v27);
}

uint64_t sub_100013174@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v4 = *a1;
  v5 = a1[1];
  v6 = a1[2];
  v7 = a1[3];
  if (!v7)
  {
    v35 = 0;
    v25 = a1[5];
    if (v25)
      goto LABEL_3;
LABEL_5:
    KeyPath = 0;
    v27 = 0;
    v30 = 0;
    v29 = 0;
    goto LABEL_6;
  }
  v8 = v6 & 1;
  v34 = v6 & 1;
  sub_1000152A0(*a1, v5, v6 & 1);
  v9 = swift_bridgeObjectRetain(v7);
  v10 = static Font.caption2.getter(v9);
  v11 = Text.font(_:)(v10, v4, v5, v8, v7);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = swift_release(v10);
  v19 = v15 & 1;
  v20 = static Font.Weight.semibold.getter(v18);
  v21 = Text.fontWeight(_:)(*(_QWORD *)&v20, 0, v11, v13, v19, v17);
  v32 = v22;
  v33 = v21;
  v35 = v23;
  v6 = v24 & 1;
  sub_1000143C8(v4, v5, v34);
  swift_bridgeObjectRelease(v7);
  sub_1000143C8(v11, v13, v19);
  swift_bridgeObjectRelease(v17);
  v5 = v32;
  v4 = v33;
  v25 = a1[5];
  if (!v25)
    goto LABEL_5;
LABEL_3:
  v26 = a1[4];
  swift_bridgeObjectRetain(v25);
  v25 = Image.init(systemName:)(v26, v25);
  v27 = static Font.caption2.getter(v25);
  KeyPath = swift_getKeyPath(&unk_10002A378);
  v29 = a1[6];
  v30 = swift_getKeyPath(&unk_10002A348);
  swift_retain(v29);
LABEL_6:
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v35;
  a2[4] = v25;
  a2[5] = KeyPath;
  a2[6] = v27;
  a2[7] = v30;
  a2[8] = v29;
  sub_10001A4B0(v4, v5, v6, v35);
  sub_10001A4E0(v25, KeyPath, v27, v30, v29);
  sub_10001A600(v25, KeyPath, v27, v30, v29);
  return sub_10001A5D0(v4, v5, v6, v35);
}

uint64_t sub_100013368()
{
  return static View._viewListCount(inputs:)();
}

double sub_100013380@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  _OWORD v12[5];
  uint64_t v13;
  _OWORD v14[9];
  uint64_t v15;
  _OWORD v16[10];

  v4 = *(_OWORD *)(v2 + 48);
  v12[2] = *(_OWORD *)(v2 + 32);
  v12[3] = v4;
  v12[4] = *(_OWORD *)(v2 + 64);
  v13 = *(_QWORD *)(v2 + 80);
  v5 = *(_OWORD *)(v2 + 16);
  v12[0] = *(_OWORD *)v2;
  v12[1] = v5;
  v6 = static HorizontalAlignment.leading.getter(a1);
  sub_100012E18((uint64_t)v12, (uint64_t)v14);
  *(_OWORD *)((char *)&v16[7] + 7) = v14[7];
  *(_OWORD *)((char *)&v16[6] + 7) = v14[6];
  *(_OWORD *)((char *)&v16[3] + 7) = v14[3];
  *(_OWORD *)((char *)&v16[2] + 7) = v14[2];
  *(_OWORD *)((char *)&v16[8] + 7) = v14[8];
  *(_QWORD *)((char *)&v16[9] + 7) = v15;
  *(_OWORD *)((char *)&v16[4] + 7) = v14[4];
  *(_OWORD *)((char *)&v16[5] + 7) = v14[5];
  *(_OWORD *)((char *)v16 + 7) = v14[0];
  *(_OWORD *)((char *)&v16[1] + 7) = v14[1];
  v7 = v16[7];
  *(_OWORD *)(a2 + 113) = v16[6];
  *(_OWORD *)(a2 + 129) = v7;
  *(_OWORD *)(a2 + 145) = v16[8];
  *(_OWORD *)(a2 + 160) = *(_OWORD *)((char *)&v16[8] + 15);
  v8 = v16[3];
  *(_OWORD *)(a2 + 49) = v16[2];
  *(_OWORD *)(a2 + 65) = v8;
  v9 = v16[5];
  *(_OWORD *)(a2 + 81) = v16[4];
  *(_OWORD *)(a2 + 97) = v9;
  result = *(double *)v16;
  v11 = v16[1];
  *(_OWORD *)(a2 + 17) = v16[0];
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = 0x401C000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 33) = v11;
  return result;
}

double sub_100013478@<D0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  double result;
  _OWORD v8[2];
  __int128 v9;

  v2 = objc_msgSend((id)objc_opt_self(UIColor), "opaqueSeparatorColor");
  v3 = Color.init(uiColor:)(v2);
  v4 = static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)(v8, 0, 1, 0x3FE0000000000000, 0, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_WORD *)(a1 + 8) = 256;
  v6 = v8[1];
  *(_OWORD *)(a1 + 16) = v8[0];
  *(_OWORD *)(a1 + 32) = v6;
  result = *(double *)&v9;
  *(_OWORD *)(a1 + 48) = v9;
  return result;
}

uint64_t sub_100013504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;

  v4 = sub_1000070B8(&qword_100034DF0);
  v69 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v70 = (char *)&v59 - v9;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v59 - v11;
  __chkstk_darwin(v10);
  v68 = (char *)&v59 - v13;
  v14 = sub_1000070B8(&qword_100034DF8);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v59 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v59 - v22;
  v24 = __chkstk_darwin(v21);
  v26 = (char *)&v59 - v25;
  *(_QWORD *)v26 = static HorizontalAlignment.leading.getter(v24);
  *((_QWORD *)v26 + 1) = 0x4020000000000000;
  v26[16] = 0;
  v27 = *(_QWORD *)(a1 + 16);
  v28 = v27 - 1;
  if (v27 > 3)
    v28 = 3;
  if ((v28 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v27 <= v28)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    swift_bridgeObjectRelease(a1);
    v33 = sub_1000147EC(a1, v60, 0, (2 * a2) | 1);
    goto LABEL_10;
  }
  v64 = v20;
  v65 = v17;
  v67 = a2;
  a2 = v28 + 1;
  v60 = a1 + 32;
  v20 = (char *)type metadata accessor for __ContiguousArrayStorageBase(0);
  v29 = swift_bridgeObjectRetain(a1);
  v30 = swift_unknownObjectRetain_n(v29, 2);
  v31 = (_QWORD *)swift_dynamicCastClass(v30, v20);
  if (!v31)
  {
    swift_bridgeObjectRelease(a1);
    v31 = &_swiftEmptyArrayStorage;
  }
  v63 = v7;
  v32 = v31[2];
  swift_release(v31);
  v66 = v4;
  if (v32 != a2)
    goto LABEL_21;
  v33 = (_QWORD *)swift_dynamicCastClass(a1, v20);
  if (!v33)
  {
    swift_bridgeObjectRelease(a1);
    v33 = &_swiftEmptyArrayStorage;
  }
LABEL_10:
  swift_bridgeObjectRelease(a1);
  v61 = sub_1000070B8(&qword_100034E00);
  v34 = &v26[*(int *)(v61 + 44)];
  v35 = v33[2];
  swift_release(v33);
  v36 = swift_allocObject(&unk_1000317F0, 24, 7);
  *(_QWORD *)(v36 + 16) = a1;
  v37 = sub_10001B228();
  swift_bridgeObjectRetain(a1);
  v62 = v37;
  ForEach<>.init(_:content:)(0, v35, sub_10001B220, v36, &type metadata for SubscriptionView, v37);
  v38 = v68;
  v39 = *(void (**)(char *, char *, uint64_t))(v69 + 32);
  v40 = v66;
  v39(v68, v12, v66);
  v41 = v34;
  v42 = v40;
  v43 = ((uint64_t (*)(char *, char *, uint64_t))v39)(v41, v38, v40);
  *(_QWORD *)v23 = static HorizontalAlignment.leading.getter(v43);
  *((_QWORD *)v23 + 1) = 0x4020000000000000;
  v23[16] = 0;
  if (v27 <= 4)
  {
    v48 = &_swiftEmptyArrayStorage;
    v49 = (uint64_t)v64;
    goto LABEL_18;
  }
  v44 = swift_bridgeObjectRetain(a1);
  v45 = swift_unknownObjectRetain_n(v44, 2);
  v46 = (_QWORD *)swift_dynamicCastClass(v45, v20);
  if (!v46)
  {
    swift_bridgeObjectRelease(a1);
    v46 = &_swiftEmptyArrayStorage;
  }
  v47 = v46[2];
  swift_release(v46);
  if (v47 != v27 - 4)
  {
    swift_bridgeObjectRelease(a1);
    v48 = sub_1000147EC(a1, v60, 4, (2 * v27) | 1);
    v49 = (uint64_t)v64;
    goto LABEL_16;
  }
  v48 = (_QWORD *)swift_dynamicCastClass(a1, v20);
  swift_bridgeObjectRelease(a1);
  v49 = (uint64_t)v64;
  if (!v48)
  {
    v48 = &_swiftEmptyArrayStorage;
LABEL_16:
    swift_bridgeObjectRelease(a1);
  }
LABEL_18:
  v50 = &v23[*(int *)(v61 + 44)];
  v51 = v48[2];
  swift_bridgeObjectRelease(v48);
  v52 = swift_allocObject(&unk_100031818, 24, 7);
  *(_QWORD *)(v52 + 16) = a1;
  swift_bridgeObjectRetain(a1);
  v53 = v63;
  ForEach<>.init(_:content:)(0, v51, sub_10001B26C, v52, &type metadata for SubscriptionView, v62);
  v54 = v70;
  v39(v70, v53, v42);
  v39(v50, v54, v42);
  sub_1000079E4((uint64_t)v26, v49, &qword_100034DF8);
  v55 = (uint64_t)v65;
  sub_1000079E4((uint64_t)v23, (uint64_t)v65, &qword_100034DF8);
  v56 = v67;
  sub_1000079E4(v49, v67, &qword_100034DF8);
  v57 = sub_1000070B8(&qword_100034E10);
  sub_1000079E4(v55, v56 + *(int *)(v57 + 48), &qword_100034DF8);
  sub_100008080((uint64_t)v23, &qword_100034DF8);
  sub_100008080((uint64_t)v26, &qword_100034DF8);
  sub_100008080(v55, &qword_100034DF8);
  return sub_100008080(v49, &qword_100034DF8);
}

uint64_t sub_1000139F4@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = *(_QWORD *)(a2 + 16);
  v8 = v7 - 1;
  if (v7 > 3)
    v8 = 3;
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v7 <= v8)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    swift_bridgeObjectRelease(v4);
    v14 = sub_1000147EC(v4, v4 + 32, 0, (2 * v5) | 1);
    goto LABEL_10;
  }
  v4 = a2;
  v3 = a1;
  v5 = v8 + 1;
  v9 = type metadata accessor for __ContiguousArrayStorageBase(0);
  v10 = swift_bridgeObjectRetain(v4);
  v11 = swift_unknownObjectRetain_n(v10, 2);
  v12 = (_QWORD *)swift_dynamicCastClass(v11, v9);
  if (!v12)
  {
    swift_bridgeObjectRelease(v4);
    v12 = &_swiftEmptyArrayStorage;
  }
  v13 = v12[2];
  swift_release(v12);
  if (v13 != v5)
    goto LABEL_15;
  v14 = (_QWORD *)swift_dynamicCastClass(v4, v9);
  if (!v14)
  {
    swift_bridgeObjectRelease(v4);
    v14 = &_swiftEmptyArrayStorage;
  }
LABEL_10:
  result = swift_bridgeObjectRelease(v4);
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14[2] > v3)
  {
    v16 = &v14[4 * v3];
    v18 = v16[4];
    v17 = v16[5];
    v20 = v16[6];
    v19 = v16[7];
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v19);
    result = swift_release(v14);
    *a3 = v18;
    a3[1] = v17;
    a3[2] = v20;
    a3[3] = v19;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_100013B38@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *i;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v6 = *(_QWORD *)(a2 + 16);
  if (v6 < 5)
  {
    i = &_swiftEmptyArrayStorage;
    goto LABEL_9;
  }
  v3 = a2;
  v7 = type metadata accessor for __ContiguousArrayStorageBase(0);
  v8 = swift_bridgeObjectRetain(v3);
  v9 = swift_unknownObjectRetain_n(v8, 2);
  v10 = (_QWORD *)swift_dynamicCastClass(v9, v7);
  if (!v10)
  {
    swift_bridgeObjectRelease(v3);
    v10 = &_swiftEmptyArrayStorage;
  }
  v11 = v10[2];
  swift_release(v10);
  if (v11 != v6 - 4)
    goto LABEL_14;
  i = (_QWORD *)swift_dynamicCastClass(v3, v7);
  swift_bridgeObjectRelease(v3);
  if (i)
    goto LABEL_9;
  for (i = &_swiftEmptyArrayStorage; ; i = sub_1000147EC(v3, v3 + 32, 4, (2 * v6) | 1))
  {
    swift_bridgeObjectRelease(v3);
LABEL_9:
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_13;
    }
    if (i[2] > a1)
      break;
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease(v3);
  }
  v13 = &i[4 * a1];
  v15 = v13[4];
  v14 = v13[5];
  v17 = v13[6];
  v16 = v13[7];
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v16);
  result = swift_bridgeObjectRelease(i);
  *a3 = v15;
  a3[1] = v14;
  a3[2] = v17;
  a3[3] = v16;
  return result;
}

uint64_t sub_100013C6C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = type metadata accessor for AccessibilityChildBehavior(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000070B8(&qword_100034DD8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v0;
  *(_QWORD *)v8 = static VerticalAlignment.top.getter(v6);
  *((_QWORD *)v8 + 1) = 0x403E000000000000;
  v8[16] = 0;
  v10 = sub_1000070B8(&qword_100034DE0);
  v11 = sub_100013504(v9, (uint64_t)&v8[*(int *)(v10 + 44)]);
  static AccessibilityChildBehavior.combine.getter(v11);
  v12 = sub_10001B88C(&qword_100034DE8, &qword_100034DD8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  View.accessibilityElement(children:)(v4, v5, v12);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_100008080((uint64_t)v8, &qword_100034DD8);
}

uint64_t sub_100013DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[16];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[16];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v26 = a3;
  v27 = a4;
  v28 = a5;
  v7 = sub_1000070B8(&qword_100034E70);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CharacterSet(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = a1;
  v38 = a2;
  v15 = swift_bridgeObjectRetain(a2);
  static CharacterSet.whitespacesAndNewlines.getter(v15);
  v16 = sub_10001525C();
  v17 = StringProtocol.trimmingCharacters(in:)(v14, &type metadata for String, v16);
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease(v38);
  v35 = v17;
  v36 = v19;
  v30 = a1;
  v31 = a2;
  v32 = v26;
  v33 = v27;
  v20 = sub_1000070B8(&qword_100034E78);
  v21 = sub_10001B678();
  Label.init(title:icon:)(sub_10001B664, v34, sub_10001B66C, v29, &type metadata for Text, v20, &protocol witness table for Text, v21);
  swift_bridgeObjectRelease(v19);
  v22 = sub_10001B88C(&qword_100034E98, &qword_100034E70, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v23 = sub_10001B6FC();
  View.labelStyle<A>(_:)(v23, v7, &type metadata for CaptionLabelStyle, v22, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_100013F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  _QWORD v28[2];

  v6 = type metadata accessor for Font.Leading(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[0] = a1;
  v28[1] = a2;
  v10 = sub_10001525C();
  swift_bridgeObjectRetain(a2);
  v11 = Text.init<A>(_:)(v28, &type metadata for String, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16 & 1;
  v18 = static Font.footnote.getter(v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Font.Leading.tight(_:), v6);
  v19 = Font.leading(_:)(v9, v18);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v20 = Text.font(_:)(v19, v11, v13, v17, v15);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  swift_release(v19);
  sub_1000143C8(v11, v13, v17);
  result = swift_bridgeObjectRelease(v15);
  *(_QWORD *)a3 = v20;
  *(_QWORD *)(a3 + 8) = v22;
  *(_BYTE *)(a3 + 16) = v18 & 1;
  *(_QWORD *)(a3 + 24) = v25;
  return result;
}

uint64_t sub_1000140D0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_bridgeObjectRetain(a2);
  v6 = Image.init(_internalSystemName:)(a1, a2);
  v7 = static Font.caption.getter();
  result = swift_getKeyPath(&unk_10002A378);
  *a3 = v6;
  a3[1] = result;
  a3[2] = v7;
  return result;
}

uint64_t sub_100014130@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100013DA0(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t sub_10001413C@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  char *v25;

  v25 = a1;
  v1 = type metadata accessor for LabelStyleConfiguration.Title(0);
  v24 = *(_QWORD *)(v1 - 8);
  v2 = v24;
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v24 - v6;
  v8 = type metadata accessor for LabelStyleConfiguration.Icon(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v24 - v14;
  v16 = LabelStyleConfiguration.icon.getter(v13);
  LabelStyleConfiguration.title.getter(v16);
  v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v17(v12, v15, v8);
  v18 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v18(v5, v7, v1);
  v19 = v25;
  v17(v25, v12, v8);
  v20 = sub_1000070B8(&qword_100034ED0);
  v18(&v19[*(int *)(v20 + 48)], v5, v1);
  v21 = *(void (**)(char *, uint64_t))(v24 + 8);
  v21(v7, v1);
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v15, v8);
  v21(v5, v1);
  return ((uint64_t (*)(char *, uint64_t))v22)(v12, v8);
}

uint64_t sub_1000142DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = sub_1000070B8(&qword_100034EC8);
  return sub_10001413C((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t type metadata accessor for InviteActionsView(uint64_t a1)
{
  return sub_100014350(a1, qword_100034AD8, (uint64_t)&nominal type descriptor for InviteActionsView);
}

uint64_t type metadata accessor for SettingsView(uint64_t a1)
{
  return sub_100014350(a1, qword_100034B68, (uint64_t)&nominal type descriptor for SettingsView);
}

uint64_t sub_100014350(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

unint64_t sub_100014384()
{
  unint64_t result;

  result = qword_1000349E0;
  if (!qword_1000349E0)
  {
    result = swift_getWitnessTable(&unk_10002A2A8, &type metadata for FamilyIconView);
    atomic_store(result, (unint64_t *)&qword_1000349E0);
  }
  return result;
}

uint64_t sub_1000143C8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_1000143D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034A08;
  if (!qword_100034A08)
  {
    v1 = sub_10000792C(&qword_1000349A0);
    sub_10001445C();
    sub_1000144C4(&qword_100034A28, type metadata accessor for InviteActionsView, (uint64_t)&unk_10002A208);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034A08);
  }
  return result;
}

uint64_t sub_10001445C()
{
  return sub_100014640(&qword_100034A10, &qword_100034A18, (void (*)(void))sub_100014480);
}

unint64_t sub_100014480()
{
  unint64_t result;

  result = qword_100034A20;
  if (!qword_100034A20)
  {
    result = swift_getWitnessTable(&unk_10002A258, &type metadata for InviteStatusView);
    atomic_store(result, (unint64_t *)&qword_100034A20);
  }
  return result;
}

uint64_t sub_1000144C4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100014504()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034A30;
  if (!qword_100034A30)
  {
    v1 = sub_10000792C(&qword_100034988);
    sub_1000145AC(&qword_100034A38, &qword_100034A00, (void (*)(void))sub_100014588, (void (*)(void))sub_10001445C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100034A30);
  }
  return result;
}

uint64_t sub_100014588()
{
  return sub_1000145AC(&qword_100034A40, &qword_100034980, (void (*)(void))sub_10001461C, (void (*)(void))sub_1000146EC);
}

uint64_t sub_1000145AC(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000792C(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001461C()
{
  return sub_100014640(&qword_100034A48, &qword_100034A50, (void (*)(void))sub_1000146A8);
}

uint64_t sub_100014640(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000792C(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000146A8()
{
  unint64_t result;

  result = qword_100034A58;
  if (!qword_100034A58)
  {
    result = swift_getWitnessTable(&unk_10002A1B8, &type metadata for InviteLoadingView);
    atomic_store(result, (unint64_t *)&qword_100034A58);
  }
  return result;
}

unint64_t sub_1000146EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034A60;
  if (!qword_100034A60)
  {
    v1 = sub_10000792C(&qword_100034968);
    sub_1000144C4(&qword_100034A28, type metadata accessor for InviteActionsView, (uint64_t)&unk_10002A208);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034A60);
  }
  return result;
}

uint64_t sub_100014770(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ControlSize(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.controlSize.setter(v3);
}

_QWORD *sub_1000147EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_18;
  if (!v5)
    return &_swiftEmptyArrayStorage;
  v8 = 32 * v5;
  if (v5 <= 0)
  {
    v10 = &_swiftEmptyArrayStorage;
    if (v4 != a3)
      goto LABEL_7;
    goto LABEL_17;
  }
  v9 = sub_1000070B8(&qword_100034E18);
  v10 = (_QWORD *)swift_allocObject(v9, v8 + 32, 7);
  v11 = j__malloc_size(v10);
  v12 = v11 - 32;
  if (v11 < 32)
    v12 = v11 - 1;
  v10[2] = v5;
  v10[3] = 2 * (v12 >> 5);
  if (v4 == a3)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
LABEL_7:
  if (v5 < 0)
  {
LABEL_19:
    result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_20;
  }
  v13 = v10 + 4;
  v14 = a2 + 32 * a3;
  if (v14 >= (unint64_t)&v10[(unint64_t)v8 / 8 + 4] || (unint64_t)v13 >= v14 + v8)
  {
    swift_arrayInitWithCopy(v13);
    return v10;
  }
  result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_10001495C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6[16] = a5;
  v6[17] = a6;
  v6[14] = a2;
  v6[15] = a4;
  v6[13] = a1;
  v8 = type metadata accessor for Locale(0);
  v6[18] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  v6[19] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v6[20] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v6[21] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[22] = swift_task_alloc(v12);
  v6[23] = swift_task_alloc(v12);
  v13 = sub_1000070B8(&qword_100034868);
  v6[24] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for URL(0);
  v6[25] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v6[26] = v15;
  v6[27] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain(a4);
  return swift_task_switch(sub_100014A6C, 0, 0);
}

uint64_t sub_100014A6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 192);
  sub_1000079E4(*(_QWORD *)(v0 + 104), v3, &qword_100034868);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = sub_100008080(*(_QWORD *)(v0 + 192), &qword_100034868);
    v5 = static FamilyLogger.extension.getter(v4);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "invalid url in openFamilyInvite", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }
    v9 = *(_QWORD *)(v0 + 184);
    v10 = *(_QWORD *)(v0 + 160);
    v11 = *(_QWORD *)(v0 + 168);
    v12 = *(_QWORD *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    swift_release(v12);
    v13 = *(_QWORD *)(v0 + 184);
    v14 = *(_QWORD *)(v0 + 192);
    v15 = *(_QWORD *)(v0 + 176);
    v17 = *(_QWORD *)(v0 + 144);
    v16 = *(_QWORD *)(v0 + 152);
    swift_task_dealloc(*(_QWORD *)(v0 + 216));
    swift_task_dealloc(v14);
    swift_task_dealloc(v13);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 32))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200));
    v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100035008 + dword_100035008);
    v19 = (_QWORD *)swift_task_alloc(unk_10003500C);
    *(_QWORD *)(v0 + 224) = v19;
    *v19 = v0;
    v19[1] = sub_100014C30;
    return v20(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  }
}

uint64_t sub_100014C30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 224);
  *(_QWORD *)(*(_QWORD *)v1 + 232) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100014C8C, 0, 0);
}

uint64_t sub_100014C8C()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;
  NSString v15;
  NSString v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  BOOL v21;
  void *v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = objc_msgSend(*(id *)(v0 + 232), "error");
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)(v0 + 144);
    v4 = *(_QWORD *)(v0 + 152);
    v5 = *(void **)(v0 + 112);
    v6 = String.LocalizationValue.init(stringLiteral:)(0x49545F5452454C41, 0xEB00000000454C54);
    static Locale.current.getter(v6);
    String.init(localized:table:bundle:locale:comment:)(v4, 0, 0, 0, v3, 0, 0, 256);
    v8 = v7;
    swift_getErrorValue(v2, v0 + 96, v0 + 64);
    Error.localizedDescription.getter(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
    v10 = v9;
    v11 = String.LocalizationValue.init(stringLiteral:)(19279, 0xE200000000000000);
    static Locale.current.getter(v11);
    String.init(localized:table:bundle:locale:comment:)(v4, 0, 0, 0, v3, 0, 0, 256);
    v13 = v12;
    v14 = String._bridgeToObjectiveC()();
    v15 = String._bridgeToObjectiveC()();
    v16 = String._bridgeToObjectiveC()();
    *(_QWORD *)(v0 + 16) = _NSConcreteStackBlock;
    *(_QWORD *)(v0 + 48) = nullsub_1;
    *(_QWORD *)(v0 + 56) = 0;
    *(_QWORD *)(v0 + 24) = 1107296256;
    *(_QWORD *)(v0 + 32) = sub_100009F28;
    *(_QWORD *)(v0 + 40) = &unk_100031648;
    v17 = _Block_copy((const void *)(v0 + 16));
    objc_msgSend(v5, "_presentAlertWithTitle:message:buttonTitle:completion:", v14, v15, v16, v17);
    _Block_release(v17);

    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v8);

  }
  v18 = *(void **)(v0 + 232);
  static FamilyLogger.extension.getter(v1);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  v21 = os_log_type_enabled(v19, v20);
  v22 = *(void **)(v0 + 232);
  if (v21)
  {
    v23 = (uint8_t *)swift_slowAlloc(12, -1);
    v24 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v23 = 138412290;
    *(_QWORD *)(v0 + 88) = v22;
    v25 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96);
    *v24 = v22;

    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Did present Family invite: %@", v23, 0xCu);
    v26 = sub_1000070B8(&qword_100034C58);
    swift_arrayDestroy(v24, 1, v26);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v23, -1, -1);
    v27 = *(NSObject **)(v0 + 232);
  }
  else
  {

    v27 = *(NSObject **)(v0 + 232);
    v19 = v27;
  }
  v29 = *(_QWORD *)(v0 + 208);
  v28 = *(_QWORD *)(v0 + 216);
  v30 = *(_QWORD *)(v0 + 200);
  v32 = *(_QWORD *)(v0 + 168);
  v31 = *(_QWORD *)(v0 + 176);
  v33 = *(_QWORD *)(v0 + 160);
  v34 = *(_QWORD *)(v0 + 120);

  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  v35 = -[NSObject success](v27, "success");

  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  swift_release(v34);
  v37 = *(_QWORD *)(v0 + 184);
  v36 = *(_QWORD *)(v0 + 192);
  v38 = *(_QWORD *)(v0 + 176);
  v40 = *(_QWORD *)(v0 + 144);
  v39 = *(_QWORD *)(v0 + 152);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  return (*(uint64_t (**)(id))(v0 + 8))(v35);
}

void sub_100015044(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v2 = *(_QWORD *)(a1 + 120);
  v4[0] = *(_QWORD *)(a1 + 112);
  v4[1] = v2;
  v3 = sub_10001525C();
  swift_bridgeObjectRetain(v2);
  Text.init<A>(_:)(v4, &type metadata for String, v3);
  __asm { BR              X9 }
}

uint64_t sub_1000150E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  char v5;
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
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[14];

  v5 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64656E696C636544, v4, 0x676E69646E6550, 0xE700000000000000, 0);
  v6 = swift_bridgeObjectRelease(v4);
  if ((v5 & 1) != 0)
  {
    v7 = 0;
    v8 = 0;
    if (v3 != 1)
      goto LABEL_3;
LABEL_7:
    v9 = ((uint64_t (*)(uint64_t))static Color.red.getter)(v6);
    goto LABEL_8;
  }
  v7 = *(_QWORD *)(v1 + 160);
  v8 = *(_QWORD *)(v1 + 168);
  v6 = swift_bridgeObjectRetain(v8);
  if (v3 == 1)
    goto LABEL_7;
LABEL_3:
  if (v3)
    v9 = ((uint64_t (*)(uint64_t))static Color.gray.getter)(v6);
  else
    v9 = ((uint64_t (*)(uint64_t))static Color.green.getter)(v6);
LABEL_8:
  v10 = v9;
  v11 = 144;
  v12 = 152;
  if (*(_BYTE *)(v1 + 233))
    v12 = 136;
  v13 = *(_QWORD *)(v1 + v12);
  if (*(_BYTE *)(v1 + 233))
    v11 = 128;
  v26[0] = *(_QWORD *)(v1 + v11);
  v26[1] = v13;
  swift_bridgeObjectRetain(v13);
  v14 = ((uint64_t (*)(_QWORD *, void *, uint64_t))Text.init<A>(_:))(v26, &type metadata for String, v2);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  result = sub_1000073C0(v1, type metadata accessor for InviteMessageView);
  *(_QWORD *)v0 = v23;
  *(_QWORD *)(v0 + 8) = v25;
  *(_QWORD *)(v0 + 16) = v22 & 1;
  *(_QWORD *)(v0 + 24) = v24;
  *(_QWORD *)(v0 + 32) = v7;
  *(_QWORD *)(v0 + 40) = v8;
  *(_QWORD *)(v0 + 48) = v10;
  *(_QWORD *)(v0 + 56) = v14;
  *(_QWORD *)(v0 + 64) = v16;
  *(_BYTE *)(v0 + 72) = v18 & 1;
  *(_QWORD *)(v0 + 80) = v20;
  return result;
}

unint64_t sub_10001525C()
{
  unint64_t result;

  result = qword_100034A78;
  if (!qword_100034A78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100034A78);
  }
  return result;
}

uint64_t sub_1000152A0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

_QWORD *initializeBufferWithCopyOfBuffer for InviteLoadingView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for InviteLoadingView(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for InviteLoadingView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *assignWithTake for InviteLoadingView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InviteLoadingView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InviteLoadingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InviteLoadingView()
{
  return &type metadata for InviteLoadingView;
}

uint64_t sub_1000153E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *__dst;
  int *v61;
  int *v62;

  v4 = type metadata accessor for InviteMessageView(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v62 = (int *)v4;
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v58 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v58;
    v57 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v57;
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    v56 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v56;
    v55 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v55;
    v54 = a2[15];
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v54;
    v53 = a2[17];
    *(_QWORD *)(a1 + 128) = a2[16];
    *(_QWORD *)(a1 + 136) = v53;
    v52 = a2[19];
    *(_QWORD *)(a1 + 144) = a2[18];
    *(_QWORD *)(a1 + 152) = v52;
    v51 = a2[21];
    *(_QWORD *)(a1 + 160) = a2[20];
    *(_QWORD *)(a1 + 168) = v51;
    v50 = a2[23];
    *(_QWORD *)(a1 + 176) = a2[22];
    *(_QWORD *)(a1 + 184) = v50;
    v49 = a2[25];
    *(_QWORD *)(a1 + 192) = a2[24];
    *(_QWORD *)(a1 + 200) = v49;
    v48 = a2[27];
    *(_QWORD *)(a1 + 208) = a2[26];
    *(_QWORD *)(a1 + 216) = v48;
    v59 = a2[28];
    *(_QWORD *)(a1 + 224) = v59;
    *(_BYTE *)(a1 + 232) = *((_BYTE *)a2 + 232);
    *(_BYTE *)(a1 + 233) = *((_BYTE *)a2 + 233);
    *(_BYTE *)(a1 + 234) = *((_BYTE *)a2 + 234);
    v9 = a2[31];
    *(_QWORD *)(a1 + 240) = a2[30];
    *(_QWORD *)(a1 + 248) = v9;
    v10 = a2[33];
    *(_QWORD *)(a1 + 256) = a2[32];
    *(_QWORD *)(a1 + 264) = v10;
    v61 = (int *)type metadata accessor for InviteMessageDetails(0);
    v11 = v61[24];
    __dst = (void *)(a1 + v11);
    v47 = (char *)a2 + v11;
    v12 = type metadata accessor for URL(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v58);
    swift_bridgeObjectRetain(v57);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v56);
    swift_bridgeObjectRetain(v55);
    swift_bridgeObjectRetain(v54);
    swift_bridgeObjectRetain(v53);
    swift_bridgeObjectRetain(v52);
    swift_bridgeObjectRetain(v51);
    swift_bridgeObjectRetain(v50);
    swift_bridgeObjectRetain(v49);
    swift_bridgeObjectRetain(v48);
    swift_bridgeObjectRetain(v59);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    if (v14(v47, 1, v12))
    {
      v15 = sub_1000070B8(&qword_100034868);
      memcpy(__dst, v47, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(__dst, v47, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v17 = v61[25];
    v18 = (void *)(a1 + v17);
    v19 = (char *)a2 + v17;
    if (v14((char *)a2 + v17, 1, v12))
    {
      v20 = sub_1000070B8(&qword_100034868);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v18, v19, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v18, 0, 1, v12);
    }
    v21 = v61[26];
    v22 = (void *)(a1 + v21);
    v23 = (char *)a2 + v21;
    v24 = type metadata accessor for Date(0);
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      v26 = sub_1000070B8(&qword_1000347F0);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    *(_BYTE *)(a1 + v61[27]) = *((_BYTE *)a2 + v61[27]);
    v27 = v62[5];
    v28 = a1 + v27;
    v29 = (uint64_t)a2 + v27;
    *(_QWORD *)v28 = *(_QWORD *)v29;
    *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
    v30 = v62[6];
    v31 = *(_OWORD *)((char *)a2 + v30);
    *(_OWORD *)(a1 + v30) = v31;
    v32 = v62[7];
    v33 = a1 + v32;
    v34 = (uint64_t)a2 + v32;
    v35 = *(_OWORD *)((char *)a2 + v32 + 24);
    *(_OWORD *)(a1 + v32 + 24) = v35;
    v36 = v35;
    v37 = **(void (***)(uint64_t, uint64_t, uint64_t))(v35 - 8);
    v38 = (id)v31;
    v37(v33, v34, v36);
    v39 = v62[8];
    v40 = a1 + v39;
    v41 = (uint64_t)a2 + v39;
    *(_BYTE *)v40 = *(_BYTE *)v41;
    v42 = *(_QWORD *)(v41 + 8);
    *(_QWORD *)(v40 + 8) = v42;
    v43 = v62[9];
    v44 = a1 + v43;
    v45 = (uint64_t)a2 + v43;
    *(_BYTE *)v44 = *(_BYTE *)v45;
    v16 = *(_QWORD *)(v45 + 8);
    *(_QWORD *)(v44 + 8) = v16;
    *(_QWORD *)(a1 + v62[10]) = *(uint64_t *)((char *)a2 + v62[10]);
    swift_retain(v42);
  }
  swift_retain(v16);
  return a1;
}

uint64_t sub_100015818(_QWORD *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(char *, uint64_t, uint64_t);
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[13]);
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(a1[19]);
  swift_bridgeObjectRelease(a1[21]);
  swift_bridgeObjectRelease(a1[23]);
  swift_bridgeObjectRelease(a1[25]);
  swift_bridgeObjectRelease(a1[27]);
  swift_bridgeObjectRelease(a1[28]);
  swift_bridgeObjectRelease(a1[31]);
  swift_bridgeObjectRelease(a1[33]);
  v2 = (int *)type metadata accessor for InviteMessageDetails(0);
  v3 = (char *)a1 + v2[24];
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (!v6(v3, 1, v4))
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
  v7 = (char *)a1 + v2[25];
  if (!v6(v7, 1, v4))
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = (char *)a1 + v2[26];
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  v11 = (int *)type metadata accessor for InviteMessageView(0);

  sub_100008294((_QWORD *)((char *)a1 + v11[7]));
  swift_release(*(_QWORD *)((char *)a1 + v11[8] + 8));
  return swift_release(*(_QWORD *)((char *)a1 + v11[9] + 8));
}

uint64_t sub_1000159C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *__dst;
  int *v61;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v58 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v58;
  v57 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v57;
  v56 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v56;
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  v55 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v55;
  v54 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v54;
  v53 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v53;
  v52 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v52;
  v51 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v51;
  v50 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v50;
  v49 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v49;
  v59 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 224) = v59;
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v8 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v8;
  v9 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v9;
  v61 = (int *)type metadata accessor for InviteMessageDetails(0);
  v10 = v61[24];
  __dst = (void *)(a1 + v10);
  v48 = (const void *)(a2 + v10);
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = v4;
  v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v58);
  swift_bridgeObjectRetain(v57);
  swift_bridgeObjectRetain(v56);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v55);
  swift_bridgeObjectRetain(v54);
  swift_bridgeObjectRetain(v53);
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRetain(v51);
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRetain(v49);
  swift_bridgeObjectRetain(v59);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  if (v14(v48, 1, v11))
  {
    v15 = sub_1000070B8(&qword_100034868);
    memcpy(__dst, v48, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v48, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v16 = v61[25];
  v17 = (void *)(a1 + v16);
  v18 = (const void *)(a2 + v16);
  if (v14((const void *)(a2 + v16), 1, v11))
  {
    v19 = sub_1000070B8(&qword_100034868);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v17, v18, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
  }
  v20 = v61[26];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  v23 = type metadata accessor for Date(0);
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = sub_1000070B8(&qword_1000347F0);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(_BYTE *)(a1 + v61[27]) = *(_BYTE *)(a2 + v61[27]);
  v26 = (int *)type metadata accessor for InviteMessageView(0);
  v27 = v26[5];
  v28 = a1 + v27;
  v29 = a2 + v27;
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
  v30 = v26[6];
  v31 = *(_OWORD *)(a2 + v30);
  *(_OWORD *)(a1 + v30) = v31;
  v32 = v26[7];
  v33 = a1 + v32;
  v34 = a2 + v32;
  v35 = *(_OWORD *)(a2 + v32 + 24);
  *(_OWORD *)(a1 + v32 + 24) = v35;
  v36 = v35;
  v37 = **(void (***)(uint64_t, uint64_t, uint64_t))(v35 - 8);
  v38 = (id)v31;
  v37(v33, v34, v36);
  v39 = v26[8];
  v40 = a1 + v39;
  v41 = a2 + v39;
  *(_BYTE *)v40 = *(_BYTE *)v41;
  v42 = *(_QWORD *)(v41 + 8);
  *(_QWORD *)(v40 + 8) = v42;
  v43 = v26[9];
  v44 = a1 + v43;
  v45 = a2 + v43;
  *(_BYTE *)v44 = *(_BYTE *)v45;
  v46 = *(_QWORD *)(v45 + 8);
  *(_QWORD *)(v44 + 8) = v46;
  *(_QWORD *)(a1 + v26[10]) = *(_QWORD *)(a2 + v26[10]);
  swift_retain(v42);
  swift_retain(v46);
  return a1;
}

uint64_t sub_100015DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(void *, uint64_t, uint64_t);
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(void *, uint64_t, uint64_t);
  int v60;
  int v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v12 = *(_QWORD *)(a2 + 72);
  v13 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v14 = *(_QWORD *)(a2 + 88);
  v15 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v16 = *(_QWORD *)(a2 + 104);
  v17 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v18 = *(_QWORD *)(a2 + 120);
  v19 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v20 = *(_QWORD *)(a2 + 136);
  v21 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v22 = *(_QWORD *)(a2 + 152);
  v23 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v24 = *(_QWORD *)(a2 + 168);
  v25 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  v26 = *(_QWORD *)(a2 + 184);
  v27 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v28 = *(_QWORD *)(a2 + 200);
  v29 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v30 = *(_QWORD *)(a2 + 216);
  v31 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  v32 = *(_QWORD *)(a2 + 224);
  v33 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  v34 = *(_QWORD *)(a2 + 248);
  v35 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 248) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  v36 = *(_QWORD *)(a2 + 264);
  v37 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 264) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  v38 = (int *)type metadata accessor for InviteMessageDetails(0);
  v39 = v38[24];
  v40 = (void *)(a1 + v39);
  v41 = (void *)(a2 + v39);
  v42 = type metadata accessor for URL(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v43 + 48);
  v45 = v44(v40, 1, v42);
  v46 = v44(v41, 1, v42);
  if (v45)
  {
    if (!v46)
    {
      (*(void (**)(void *, void *, uint64_t))(v43 + 16))(v40, v41, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v46)
  {
    (*(void (**)(void *, uint64_t))(v43 + 8))(v40, v42);
LABEL_6:
    v47 = sub_1000070B8(&qword_100034868);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v43 + 24))(v40, v41, v42);
LABEL_7:
  v48 = v38[25];
  v49 = (void *)(a1 + v48);
  v50 = (void *)(a2 + v48);
  v51 = v44((void *)(a1 + v48), 1, v42);
  v52 = v44(v50, 1, v42);
  if (v51)
  {
    if (!v52)
    {
      (*(void (**)(void *, void *, uint64_t))(v43 + 16))(v49, v50, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v49, 0, 1, v42);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v52)
  {
    (*(void (**)(void *, uint64_t))(v43 + 8))(v49, v42);
LABEL_12:
    v53 = sub_1000070B8(&qword_100034868);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v43 + 24))(v49, v50, v42);
LABEL_13:
  v54 = v38[26];
  v55 = (void *)(a1 + v54);
  v56 = (void *)(a2 + v54);
  v57 = type metadata accessor for Date(0);
  v58 = *(_QWORD *)(v57 - 8);
  v59 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v58 + 48);
  v60 = v59(v55, 1, v57);
  v61 = v59(v56, 1, v57);
  if (!v60)
  {
    if (!v61)
    {
      (*(void (**)(void *, void *, uint64_t))(v58 + 24))(v55, v56, v57);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v58 + 8))(v55, v57);
    goto LABEL_18;
  }
  if (v61)
  {
LABEL_18:
    v62 = sub_1000070B8(&qword_1000347F0);
    memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v58 + 16))(v55, v56, v57);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, v57);
LABEL_19:
  *(_BYTE *)(a1 + v38[27]) = *(_BYTE *)(a2 + v38[27]);
  v63 = (int *)type metadata accessor for InviteMessageView(0);
  v64 = v63[5];
  v65 = a1 + v64;
  v66 = a2 + v64;
  v67 = *(_BYTE *)(v66 + 8);
  *(_QWORD *)v65 = *(_QWORD *)v66;
  *(_BYTE *)(v65 + 8) = v67;
  v68 = v63[6];
  v69 = a1 + v68;
  v70 = a2 + v68;
  v71 = *(void **)v70;
  v72 = *(_QWORD *)(v70 + 8);
  v73 = *(void **)v69;
  *(_QWORD *)v69 = *(_QWORD *)v70;
  v74 = v71;

  *(_QWORD *)(v69 + 8) = v72;
  sub_1000092A8((_QWORD *)(a1 + v63[7]), (_QWORD *)(a2 + v63[7]));
  v75 = v63[8];
  v76 = a1 + v75;
  v77 = a2 + v75;
  *(_BYTE *)v76 = *(_BYTE *)v77;
  v78 = *(_QWORD *)(v76 + 8);
  v79 = *(_QWORD *)(v77 + 8);
  *(_QWORD *)(v76 + 8) = v79;
  swift_retain(v79);
  swift_release(v78);
  v80 = v63[9];
  v81 = a1 + v80;
  v82 = a2 + v80;
  *(_BYTE *)v81 = *(_BYTE *)v82;
  v83 = *(_QWORD *)(v81 + 8);
  v84 = *(_QWORD *)(v82 + 8);
  *(_QWORD *)(v81 + 8) = v84;
  swift_retain(v84);
  swift_release(v83);
  *(_QWORD *)(a1 + v63[10]) = *(_QWORD *)(a2 + v63[10]);
  return a1;
}

uint64_t sub_100016358(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int *v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  v9 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v9;
  v10 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v10;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  v11 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v11;
  v12 = (int *)type metadata accessor for InviteMessageDetails(0);
  v13 = v12[24];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = type metadata accessor for URL(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  if (v18(v15, 1, v16))
  {
    v19 = sub_1000070B8(&qword_100034868);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v20 = v12[25];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  if (v18((const void *)(a2 + v20), 1, v16))
  {
    v23 = sub_1000070B8(&qword_100034868);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v21, v22, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v21, 0, 1, v16);
  }
  v24 = v12[26];
  v25 = (void *)(a1 + v24);
  v26 = (const void *)(a2 + v24);
  v27 = type metadata accessor for Date(0);
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = sub_1000070B8(&qword_1000347F0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v28 + 32))(v25, v26, v27);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  *(_BYTE *)(a1 + v12[27]) = *(_BYTE *)(a2 + v12[27]);
  v30 = (int *)type metadata accessor for InviteMessageView(0);
  v31 = v30[5];
  v32 = a1 + v31;
  v33 = a2 + v31;
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *(_BYTE *)(v32 + 8) = *(_BYTE *)(v33 + 8);
  *(_OWORD *)(a1 + v30[6]) = *(_OWORD *)(a2 + v30[6]);
  v34 = v30[7];
  v35 = a1 + v34;
  v36 = a2 + v34;
  *(_QWORD *)(v35 + 32) = *(_QWORD *)(v36 + 32);
  v37 = *(_OWORD *)(v36 + 16);
  *(_OWORD *)v35 = *(_OWORD *)v36;
  *(_OWORD *)(v35 + 16) = v37;
  *(_OWORD *)(a1 + v30[8]) = *(_OWORD *)(a2 + v30[8]);
  *(_OWORD *)(a1 + v30[9]) = *(_OWORD *)(a2 + v30[9]);
  *(_QWORD *)(a1 + v30[10]) = *(_QWORD *)(a2 + v30[10]);
  return a1;
}

uint64_t sub_1000165EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(void *, uint64_t, uint64_t);
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(void *, uint64_t, uint64_t);
  int v59;
  int v60;
  uint64_t v61;
  int *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 72);
  v13 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a2 + 88);
  v15 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 104);
  v17 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v16;
  swift_bridgeObjectRelease(v17);
  v18 = *(_QWORD *)(a2 + 120);
  v19 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v18;
  swift_bridgeObjectRelease(v19);
  v20 = *(_QWORD *)(a2 + 136);
  v21 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v20;
  swift_bridgeObjectRelease(v21);
  v22 = *(_QWORD *)(a2 + 152);
  v23 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v22;
  swift_bridgeObjectRelease(v23);
  v24 = *(_QWORD *)(a2 + 168);
  v25 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v24;
  swift_bridgeObjectRelease(v25);
  v26 = *(_QWORD *)(a2 + 184);
  v27 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v26;
  swift_bridgeObjectRelease(v27);
  v28 = *(_QWORD *)(a2 + 200);
  v29 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v28;
  swift_bridgeObjectRelease(v29);
  v30 = *(_QWORD *)(a2 + 216);
  v31 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v30;
  swift_bridgeObjectRelease(v31);
  v32 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRelease(v32);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v33 = *(_QWORD *)(a2 + 248);
  v34 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v33;
  swift_bridgeObjectRelease(v34);
  v35 = *(_QWORD *)(a2 + 264);
  v36 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v35;
  swift_bridgeObjectRelease(v36);
  v37 = (int *)type metadata accessor for InviteMessageDetails(0);
  v38 = v37[24];
  v39 = (void *)(a1 + v38);
  v40 = (void *)(a2 + v38);
  v41 = type metadata accessor for URL(0);
  v42 = *(_QWORD *)(v41 - 8);
  v43 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v42 + 48);
  v44 = v43(v39, 1, v41);
  v45 = v43(v40, 1, v41);
  if (v44)
  {
    if (!v45)
    {
      (*(void (**)(void *, void *, uint64_t))(v42 + 32))(v39, v40, v41);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v45)
  {
    (*(void (**)(void *, uint64_t))(v42 + 8))(v39, v41);
LABEL_6:
    v46 = sub_1000070B8(&qword_100034868);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v42 + 40))(v39, v40, v41);
LABEL_7:
  v47 = v37[25];
  v48 = (void *)(a1 + v47);
  v49 = (void *)(a2 + v47);
  v50 = v43((void *)(a1 + v47), 1, v41);
  v51 = v43(v49, 1, v41);
  if (v50)
  {
    if (!v51)
    {
      (*(void (**)(void *, void *, uint64_t))(v42 + 32))(v48, v49, v41);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v48, 0, 1, v41);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v51)
  {
    (*(void (**)(void *, uint64_t))(v42 + 8))(v48, v41);
LABEL_12:
    v52 = sub_1000070B8(&qword_100034868);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v42 + 40))(v48, v49, v41);
LABEL_13:
  v53 = v37[26];
  v54 = (void *)(a1 + v53);
  v55 = (void *)(a2 + v53);
  v56 = type metadata accessor for Date(0);
  v57 = *(_QWORD *)(v56 - 8);
  v58 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v57 + 48);
  v59 = v58(v54, 1, v56);
  v60 = v58(v55, 1, v56);
  if (!v59)
  {
    if (!v60)
    {
      (*(void (**)(void *, void *, uint64_t))(v57 + 40))(v54, v55, v56);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v57 + 8))(v54, v56);
    goto LABEL_18;
  }
  if (v60)
  {
LABEL_18:
    v61 = sub_1000070B8(&qword_1000347F0);
    memcpy(v54, v55, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v57 + 32))(v54, v55, v56);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v54, 0, 1, v56);
LABEL_19:
  *(_BYTE *)(a1 + v37[27]) = *(_BYTE *)(a2 + v37[27]);
  v62 = (int *)type metadata accessor for InviteMessageView(0);
  v63 = v62[5];
  v64 = a1 + v63;
  v65 = a2 + v63;
  *(_QWORD *)v64 = *(_QWORD *)v65;
  *(_BYTE *)(v64 + 8) = *(_BYTE *)(v65 + 8);
  v66 = v62[6];
  v67 = a1 + v66;
  v68 = (uint64_t *)(a2 + v66);
  v69 = *v68;
  v70 = v68[1];
  v71 = *(void **)v67;
  *(_QWORD *)v67 = v69;

  *(_QWORD *)(v67 + 8) = v70;
  v72 = v62[7];
  v73 = a1 + v72;
  v74 = a2 + v72;
  sub_100008294((_QWORD *)(a1 + v72));
  v75 = *(_OWORD *)(v74 + 16);
  *(_OWORD *)v73 = *(_OWORD *)v74;
  *(_OWORD *)(v73 + 16) = v75;
  *(_QWORD *)(v73 + 32) = *(_QWORD *)(v74 + 32);
  v76 = v62[8];
  v77 = a1 + v76;
  v78 = a2 + v76;
  *(_BYTE *)v77 = *(_BYTE *)v78;
  v79 = *(_QWORD *)(v77 + 8);
  *(_QWORD *)(v77 + 8) = *(_QWORD *)(v78 + 8);
  swift_release(v79);
  v80 = v62[9];
  v81 = a1 + v80;
  v82 = a2 + v80;
  *(_BYTE *)v81 = *(_BYTE *)v82;
  v83 = *(_QWORD *)(v81 + 8);
  *(_QWORD *)(v81 + 8) = *(_QWORD *)(v82 + 8);
  swift_release(v83);
  *(_QWORD *)(a1 + v62[10]) = *(_QWORD *)(a2 + v62[10]);
  return a1;
}

uint64_t sub_100016A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100016A80);
}

uint64_t sub_100016A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InviteMessageView(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_100016ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016AC8);
}

uint64_t sub_100016AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InviteMessageView(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_100016B08(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for InviteMessageView(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Subscription(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for InviteStatusView(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    sub_1000143C8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
    swift_bridgeObjectRelease(v2);
  }
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  swift_release(*(_QWORD *)(a1 + 48));
  sub_1000143C8(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 72));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 80));
}

uint64_t initializeWithCopy for InviteStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v5 = *(_QWORD *)a2;
    v6 = *(_QWORD *)(a2 + 8);
    v7 = *(_BYTE *)(a2 + 16);
    sub_1000152A0(*(_QWORD *)a2, v6, v7);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v6;
    *(_BYTE *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v4;
    swift_bridgeObjectRetain(v4);
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
  }
  v9 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v9;
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v10;
  v12 = *(_QWORD *)(a2 + 64);
  v13 = *(_BYTE *)(a2 + 72);
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  sub_1000152A0(v11, v12, v13);
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_BYTE *)(a1 + 72) = v13;
  v14 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v14;
  swift_bridgeObjectRetain(v14);
  return a1;
}

uint64_t assignWithCopy for InviteStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      v5 = *(_QWORD *)a2;
      v6 = *(_QWORD *)(a2 + 8);
      v7 = *(_BYTE *)(a2 + 16);
      sub_1000152A0(*(_QWORD *)a2, v6, v7);
      v8 = *(_QWORD *)a1;
      v9 = *(_QWORD *)(a1 + 8);
      v10 = *(_BYTE *)(a1 + 16);
      *(_QWORD *)a1 = v5;
      *(_QWORD *)(a1 + 8) = v6;
      *(_BYTE *)(a1 + 16) = v7;
      sub_1000143C8(v8, v9, v10);
      v11 = *(_QWORD *)(a2 + 24);
      v12 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v11;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRelease(v12);
    }
    else
    {
      sub_100016E0C(a1);
      v17 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v17;
    }
  }
  else if (v4)
  {
    v13 = *(_QWORD *)a2;
    v14 = *(_QWORD *)(a2 + 8);
    v15 = *(_BYTE *)(a2 + 16);
    sub_1000152A0(*(_QWORD *)a2, v14, v15);
    *(_QWORD *)a1 = v13;
    *(_QWORD *)(a1 + 8) = v14;
    *(_BYTE *)(a1 + 16) = v15;
    v16 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v16;
    swift_bridgeObjectRetain(v16);
  }
  else
  {
    v18 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v18;
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v19 = *(_QWORD *)(a2 + 40);
  v20 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v19;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRelease(v20);
  v21 = *(_QWORD *)(a1 + 48);
  v22 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v22;
  swift_retain(v22);
  swift_release(v21);
  v23 = *(_QWORD *)(a2 + 56);
  v24 = *(_QWORD *)(a2 + 64);
  v25 = *(_BYTE *)(a2 + 72);
  sub_1000152A0(v23, v24, v25);
  v26 = *(_QWORD *)(a1 + 56);
  v27 = *(_QWORD *)(a1 + 64);
  v28 = *(_BYTE *)(a1 + 72);
  *(_QWORD *)(a1 + 56) = v23;
  *(_QWORD *)(a1 + 64) = v24;
  *(_BYTE *)(a1 + 72) = v25;
  sub_1000143C8(v26, v27, v28);
  v29 = *(_QWORD *)(a2 + 80);
  v30 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  return a1;
}

uint64_t sub_100016E0C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for Text - 1) + 8))();
  return a1;
}

__n128 initializeWithTake for InviteStatusView(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for InviteStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 24);
  if (!v5)
  {
    sub_100016E0C(a1);
LABEL_5:
    v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v10;
    goto LABEL_6;
  }
  v6 = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_1000143C8(v7, v8, v9);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease(v4);
LABEL_6:
  v11 = *(_QWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v11;
  swift_bridgeObjectRelease(v12);
  v13 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release(v13);
  v14 = *(_BYTE *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 64);
  v17 = *(_BYTE *)(a1 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 72) = v14;
  sub_1000143C8(v15, v16, v17);
  v18 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease(v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for InviteStatusView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 80);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InviteStatusView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 80) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InviteStatusView()
{
  return &type metadata for InviteStatusView;
}

ValueMetadata *type metadata accessor for StackedSubscriptionsView()
{
  return &type metadata for StackedSubscriptionsView;
}

ValueMetadata *type metadata accessor for FamilyIconView()
{
  return &type metadata for FamilyIconView;
}

_QWORD *sub_100016FF4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
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
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  const void *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  const void *v68;
  uint64_t v69;
  const void *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int (*v94)(char *, uint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  char *v98;
  char *__dst;
  void *__dsta;
  unsigned int (*v101)(const void *, uint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  int *v104;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v18);
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v93 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v93;
    v91 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v91;
    v89 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v89;
    v87 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v87;
    v8 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v8;
    v9 = a2[15];
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v9;
    v85 = a2[17];
    *(_QWORD *)(a1 + 128) = a2[16];
    *(_QWORD *)(a1 + 136) = v85;
    v83 = a2[19];
    *(_QWORD *)(a1 + 144) = a2[18];
    *(_QWORD *)(a1 + 152) = v83;
    v81 = a2[21];
    *(_QWORD *)(a1 + 160) = a2[20];
    *(_QWORD *)(a1 + 168) = v81;
    v79 = a2[23];
    *(_QWORD *)(a1 + 176) = a2[22];
    *(_QWORD *)(a1 + 184) = v79;
    v77 = a2[25];
    *(_QWORD *)(a1 + 192) = a2[24];
    *(_QWORD *)(a1 + 200) = v77;
    v75 = a2[27];
    *(_QWORD *)(a1 + 208) = a2[26];
    *(_QWORD *)(a1 + 216) = v75;
    v95 = a2[28];
    *(_QWORD *)(a1 + 224) = v95;
    *(_BYTE *)(a1 + 232) = *((_BYTE *)a2 + 232);
    *(_BYTE *)(a1 + 233) = *((_BYTE *)a2 + 233);
    *(_BYTE *)(a1 + 234) = *((_BYTE *)a2 + 234);
    v10 = a2[31];
    *(_QWORD *)(a1 + 240) = a2[30];
    *(_QWORD *)(a1 + 248) = v10;
    v11 = a2[33];
    *(_QWORD *)(a1 + 256) = a2[32];
    *(_QWORD *)(a1 + 264) = v11;
    v104 = (int *)type metadata accessor for InviteMessageDetails(0);
    v12 = v104[24];
    __dst = (char *)v4 + v12;
    v73 = (char *)a2 + v12;
    v13 = type metadata accessor for URL(0);
    v14 = *(_QWORD *)(v13 - 8);
    v15 = v6;
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v93);
    swift_bridgeObjectRetain(v91);
    swift_bridgeObjectRetain(v89);
    swift_bridgeObjectRetain(v87);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v85);
    swift_bridgeObjectRetain(v83);
    swift_bridgeObjectRetain(v81);
    swift_bridgeObjectRetain(v79);
    swift_bridgeObjectRetain(v77);
    swift_bridgeObjectRetain(v75);
    swift_bridgeObjectRetain(v95);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    if (v16(v73, 1, v13))
    {
      v17 = sub_1000070B8(&qword_100034868);
      memcpy(__dst, v73, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v73, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
    }
    v19 = v104[25];
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    if (v16((char *)a2 + v19, 1, v13))
    {
      v22 = sub_1000070B8(&qword_100034868);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v21, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
    }
    v23 = v104[26];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    v26 = type metadata accessor for Date(0);
    v27 = *(_QWORD *)(v26 - 8);
    v94 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
    v102 = v14;
    v103 = v13;
    v101 = (unsigned int (*)(const void *, uint64_t, uint64_t))v16;
    __dsta = (void *)v26;
    v96 = v27;
    if (v94(v25, 1, v26))
    {
      v28 = sub_1000070B8(&qword_1000347F0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    *((_BYTE *)v4 + v104[27]) = *((_BYTE *)a2 + v104[27]);
    v29 = (int *)type metadata accessor for InviteMessageView(0);
    v30 = v29[5];
    v31 = (char *)v4 + v30;
    v32 = (uint64_t)a2 + v30;
    *(_QWORD *)v31 = *(_QWORD *)v32;
    v31[8] = *(_BYTE *)(v32 + 8);
    v33 = v29[6];
    v34 = *(_OWORD *)((char *)a2 + v33);
    *(_OWORD *)((char *)v4 + v33) = v34;
    v35 = v29[7];
    v36 = (char *)v4 + v35;
    v37 = (uint64_t)a2 + v35;
    v38 = *(_OWORD *)((char *)a2 + v35 + 24);
    *(_OWORD *)((char *)v4 + v35 + 24) = v38;
    v39 = v38;
    v40 = **(void (***)(char *, uint64_t, uint64_t))(v38 - 8);
    v41 = (id)v34;
    v40(v36, v37, v39);
    v42 = v29[8];
    v43 = (char *)v4 + v42;
    v44 = (char *)a2 + v42;
    *v43 = *v44;
    v45 = *((_QWORD *)v44 + 1);
    *((_QWORD *)v43 + 1) = v45;
    v46 = v29[9];
    v47 = (char *)v4 + v46;
    v48 = (char *)a2 + v46;
    *v47 = *v48;
    v92 = *((_QWORD *)v48 + 1);
    *((_QWORD *)v47 + 1) = v92;
    *(_QWORD *)((char *)v4 + v29[10]) = *(uint64_t *)((char *)a2 + v29[10]);
    v49 = *(int *)(a3 + 20);
    v50 = (char *)v4 + v49;
    v51 = (uint64_t)a2 + v49;
    v52 = *(_QWORD *)(v51 + 8);
    *(_QWORD *)v50 = *(_QWORD *)v51;
    *((_QWORD *)v50 + 1) = v52;
    v53 = *(_QWORD *)(v51 + 24);
    *((_QWORD *)v50 + 2) = *(_QWORD *)(v51 + 16);
    *((_QWORD *)v50 + 3) = v53;
    v54 = *(_QWORD *)(v51 + 40);
    *((_QWORD *)v50 + 4) = *(_QWORD *)(v51 + 32);
    *((_QWORD *)v50 + 5) = v54;
    v55 = *(_QWORD *)(v51 + 56);
    *((_QWORD *)v50 + 6) = *(_QWORD *)(v51 + 48);
    *((_QWORD *)v50 + 7) = v55;
    v88 = *(_QWORD *)(v51 + 72);
    *((_QWORD *)v50 + 8) = *(_QWORD *)(v51 + 64);
    *((_QWORD *)v50 + 9) = v88;
    v86 = *(_QWORD *)(v51 + 88);
    *((_QWORD *)v50 + 10) = *(_QWORD *)(v51 + 80);
    *((_QWORD *)v50 + 11) = v86;
    v56 = *(_QWORD *)(v51 + 104);
    *((_QWORD *)v50 + 12) = *(_QWORD *)(v51 + 96);
    *((_QWORD *)v50 + 13) = v56;
    v84 = *(_QWORD *)(v51 + 120);
    *((_QWORD *)v50 + 14) = *(_QWORD *)(v51 + 112);
    *((_QWORD *)v50 + 15) = v84;
    v82 = *(_QWORD *)(v51 + 136);
    *((_QWORD *)v50 + 16) = *(_QWORD *)(v51 + 128);
    *((_QWORD *)v50 + 17) = v82;
    v80 = *(_QWORD *)(v51 + 152);
    *((_QWORD *)v50 + 18) = *(_QWORD *)(v51 + 144);
    *((_QWORD *)v50 + 19) = v80;
    v78 = *(_QWORD *)(v51 + 168);
    *((_QWORD *)v50 + 20) = *(_QWORD *)(v51 + 160);
    *((_QWORD *)v50 + 21) = v78;
    v76 = *(_QWORD *)(v51 + 184);
    *((_QWORD *)v50 + 22) = *(_QWORD *)(v51 + 176);
    *((_QWORD *)v50 + 23) = v76;
    v74 = *(_QWORD *)(v51 + 200);
    *((_QWORD *)v50 + 24) = *(_QWORD *)(v51 + 192);
    *((_QWORD *)v50 + 25) = v74;
    v72 = *(_QWORD *)(v51 + 216);
    *((_QWORD *)v50 + 26) = *(_QWORD *)(v51 + 208);
    *((_QWORD *)v50 + 27) = v72;
    v90 = *(_QWORD *)(v51 + 224);
    *((_QWORD *)v50 + 28) = v90;
    v50[232] = *(_BYTE *)(v51 + 232);
    v50[233] = *(_BYTE *)(v51 + 233);
    v50[234] = *(_BYTE *)(v51 + 234);
    v57 = *(_QWORD *)(v51 + 248);
    *((_QWORD *)v50 + 30) = *(_QWORD *)(v51 + 240);
    *((_QWORD *)v50 + 31) = v57;
    v58 = *(_QWORD *)(v51 + 264);
    *((_QWORD *)v50 + 32) = *(_QWORD *)(v51 + 256);
    *((_QWORD *)v50 + 33) = v58;
    v59 = v104[24];
    v98 = &v50[v59];
    v71 = (const void *)(v51 + v59);
    swift_retain(v45);
    swift_retain(v92);
    swift_bridgeObjectRetain(v52);
    swift_bridgeObjectRetain(v53);
    swift_bridgeObjectRetain(v54);
    swift_bridgeObjectRetain(v55);
    swift_bridgeObjectRetain(v88);
    swift_bridgeObjectRetain(v86);
    swift_bridgeObjectRetain(v56);
    swift_bridgeObjectRetain(v84);
    swift_bridgeObjectRetain(v82);
    swift_bridgeObjectRetain(v80);
    swift_bridgeObjectRetain(v78);
    swift_bridgeObjectRetain(v76);
    swift_bridgeObjectRetain(v74);
    swift_bridgeObjectRetain(v72);
    swift_bridgeObjectRetain(v90);
    swift_bridgeObjectRetain(v57);
    swift_bridgeObjectRetain(v58);
    if (v101(v71, 1, v103))
    {
      v60 = sub_1000070B8(&qword_100034868);
      memcpy(v98, v71, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
      v61 = v102;
    }
    else
    {
      v61 = v102;
      (*(void (**)(char *, const void *, uint64_t))(v102 + 16))(v98, v71, v103);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v102 + 56))(v98, 0, 1, v103);
    }
    v62 = v104[25];
    v63 = &v50[v62];
    v64 = (const void *)(v51 + v62);
    if (v101((const void *)(v51 + v62), 1, v103))
    {
      v65 = sub_1000070B8(&qword_100034868);
      memcpy(v63, v64, *(_QWORD *)(*(_QWORD *)(v65 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v61 + 16))(v63, v64, v103);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v63, 0, 1, v103);
    }
    v66 = v104[26];
    v67 = &v50[v66];
    v68 = (const void *)(v51 + v66);
    if (v94((char *)(v51 + v66), 1, (uint64_t)__dsta))
    {
      v69 = sub_1000070B8(&qword_1000347F0);
      memcpy(v67, v68, *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, void *))(v96 + 16))(v67, v68, __dsta);
      (*(void (**)(char *, _QWORD, uint64_t, void *))(v96 + 56))(v67, 0, 1, __dsta);
    }
    v50[v104[27]] = *(_BYTE *)(v51 + v104[27]);
  }
  return v4;
}

uint64_t sub_100017734(_QWORD *a1, uint64_t a2)
{
  int *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  int *v14;
  _QWORD *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t result;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[13]);
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(a1[19]);
  swift_bridgeObjectRelease(a1[21]);
  swift_bridgeObjectRelease(a1[23]);
  swift_bridgeObjectRelease(a1[25]);
  swift_bridgeObjectRelease(a1[27]);
  swift_bridgeObjectRelease(a1[28]);
  swift_bridgeObjectRelease(a1[31]);
  swift_bridgeObjectRelease(a1[33]);
  v4 = (int *)type metadata accessor for InviteMessageDetails(0);
  v5 = (char *)a1 + v4[24];
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  v9 = (char *)a1 + v4[25];
  if (!v8(v9, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v10 = (char *)a1 + v4[26];
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (!v13(v10, 1, v11))
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  v14 = (int *)type metadata accessor for InviteMessageView(0);

  sub_100008294((_QWORD *)((char *)a1 + v14[7]));
  swift_release(*(_QWORD *)((char *)a1 + v14[8] + 8));
  swift_release(*(_QWORD *)((char *)a1 + v14[9] + 8));
  v15 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  swift_bridgeObjectRelease(v15[1]);
  swift_bridgeObjectRelease(v15[3]);
  swift_bridgeObjectRelease(v15[5]);
  swift_bridgeObjectRelease(v15[7]);
  swift_bridgeObjectRelease(v15[9]);
  swift_bridgeObjectRelease(v15[11]);
  swift_bridgeObjectRelease(v15[13]);
  swift_bridgeObjectRelease(v15[15]);
  swift_bridgeObjectRelease(v15[17]);
  swift_bridgeObjectRelease(v15[19]);
  swift_bridgeObjectRelease(v15[21]);
  swift_bridgeObjectRelease(v15[23]);
  swift_bridgeObjectRelease(v15[25]);
  swift_bridgeObjectRelease(v15[27]);
  swift_bridgeObjectRelease(v15[28]);
  swift_bridgeObjectRelease(v15[31]);
  swift_bridgeObjectRelease(v15[33]);
  v16 = (char *)v15 + v4[24];
  if (!v8(v16, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
  v17 = (char *)v15 + v4[25];
  if (!v8(v17, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v17, v6);
  v18 = (char *)v15 + v4[26];
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v13)(v18, 1, v11);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v18, v11);
  return result;
}

uint64_t sub_100017A24(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unsigned int (*v15)(const void *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const void *v66;
  uint64_t v67;
  const void *v69;
  uint64_t v70;
  const void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int (*v92)(const void *, uint64_t, uint64_t);
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *__dst;
  void *__dsta;
  unsigned int (*v99)(const void *, uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  int *v102;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v91 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v91;
  v89 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v89;
  v87 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v87;
  v85 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v85;
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  v8 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v8;
  v83 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v83;
  v81 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v81;
  v79 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v79;
  v77 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v77;
  v75 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v75;
  v73 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v73;
  v95 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 224) = v95;
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v9 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v9;
  v10 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v10;
  v102 = (int *)type metadata accessor for InviteMessageDetails(0);
  v11 = v102[24];
  __dst = (void *)(a1 + v11);
  v71 = (const void *)(a2 + v11);
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = v5;
  v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v91);
  swift_bridgeObjectRetain(v89);
  swift_bridgeObjectRetain(v87);
  swift_bridgeObjectRetain(v85);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v83);
  swift_bridgeObjectRetain(v81);
  swift_bridgeObjectRetain(v79);
  swift_bridgeObjectRetain(v77);
  swift_bridgeObjectRetain(v75);
  swift_bridgeObjectRetain(v73);
  swift_bridgeObjectRetain(v95);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  if (v15(v71, 1, v12))
  {
    v16 = sub_1000070B8(&qword_100034868);
    memcpy(__dst, v71, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(__dst, v71, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
  }
  v17 = v102[25];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  if (v15((const void *)(a2 + v17), 1, v12))
  {
    v20 = sub_1000070B8(&qword_100034868);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v18, v19, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v18, 0, 1, v12);
  }
  v21 = v102[26];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  v24 = type metadata accessor for Date(0);
  v25 = *(_QWORD *)(v24 - 8);
  v92 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48);
  v100 = v13;
  v101 = v12;
  v99 = v15;
  v96 = v25;
  __dsta = (void *)v24;
  if (v92(v23, 1, v24))
  {
    v26 = sub_1000070B8(&qword_1000347F0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  *(_BYTE *)(a1 + v102[27]) = *(_BYTE *)(a2 + v102[27]);
  v27 = (int *)type metadata accessor for InviteMessageView(0);
  v28 = v27[5];
  v29 = a1 + v28;
  v30 = a2 + v28;
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
  v31 = v27[6];
  v32 = *(_OWORD *)(a2 + v31);
  *(_OWORD *)(a1 + v31) = v32;
  v33 = v27[7];
  v34 = a1 + v33;
  v35 = a2 + v33;
  v36 = *(_OWORD *)(a2 + v33 + 24);
  *(_OWORD *)(a1 + v33 + 24) = v36;
  v37 = v36;
  v38 = **(void (***)(uint64_t, uint64_t, uint64_t))(v36 - 8);
  v39 = (id)v32;
  v38(v34, v35, v37);
  v40 = v27[8];
  v41 = a1 + v40;
  v42 = a2 + v40;
  *(_BYTE *)v41 = *(_BYTE *)v42;
  v43 = *(_QWORD *)(v42 + 8);
  *(_QWORD *)(v41 + 8) = v43;
  v44 = v27[9];
  v45 = a1 + v44;
  v46 = a2 + v44;
  *(_BYTE *)v45 = *(_BYTE *)v46;
  v90 = *(_QWORD *)(v46 + 8);
  *(_QWORD *)(v45 + 8) = v90;
  *(_QWORD *)(a1 + v27[10]) = *(_QWORD *)(a2 + v27[10]);
  v47 = *(int *)(a3 + 20);
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = *(_QWORD *)(v49 + 8);
  *(_QWORD *)v48 = *(_QWORD *)v49;
  *(_QWORD *)(v48 + 8) = v50;
  v51 = *(_QWORD *)(v49 + 24);
  *(_QWORD *)(v48 + 16) = *(_QWORD *)(v49 + 16);
  *(_QWORD *)(v48 + 24) = v51;
  v52 = *(_QWORD *)(v49 + 40);
  *(_QWORD *)(v48 + 32) = *(_QWORD *)(v49 + 32);
  *(_QWORD *)(v48 + 40) = v52;
  v53 = *(_QWORD *)(v49 + 56);
  *(_QWORD *)(v48 + 48) = *(_QWORD *)(v49 + 48);
  *(_QWORD *)(v48 + 56) = v53;
  v86 = *(_QWORD *)(v49 + 72);
  *(_QWORD *)(v48 + 64) = *(_QWORD *)(v49 + 64);
  *(_QWORD *)(v48 + 72) = v86;
  v84 = *(_QWORD *)(v49 + 88);
  *(_QWORD *)(v48 + 80) = *(_QWORD *)(v49 + 80);
  *(_QWORD *)(v48 + 88) = v84;
  v54 = *(_QWORD *)(v49 + 104);
  *(_QWORD *)(v48 + 96) = *(_QWORD *)(v49 + 96);
  *(_QWORD *)(v48 + 104) = v54;
  v82 = *(_QWORD *)(v49 + 120);
  *(_QWORD *)(v48 + 112) = *(_QWORD *)(v49 + 112);
  *(_QWORD *)(v48 + 120) = v82;
  v80 = *(_QWORD *)(v49 + 136);
  *(_QWORD *)(v48 + 128) = *(_QWORD *)(v49 + 128);
  *(_QWORD *)(v48 + 136) = v80;
  v78 = *(_QWORD *)(v49 + 152);
  *(_QWORD *)(v48 + 144) = *(_QWORD *)(v49 + 144);
  *(_QWORD *)(v48 + 152) = v78;
  v76 = *(_QWORD *)(v49 + 168);
  *(_QWORD *)(v48 + 160) = *(_QWORD *)(v49 + 160);
  *(_QWORD *)(v48 + 168) = v76;
  v74 = *(_QWORD *)(v49 + 184);
  *(_QWORD *)(v48 + 176) = *(_QWORD *)(v49 + 176);
  *(_QWORD *)(v48 + 184) = v74;
  v72 = *(_QWORD *)(v49 + 200);
  *(_QWORD *)(v48 + 192) = *(_QWORD *)(v49 + 192);
  *(_QWORD *)(v48 + 200) = v72;
  v70 = *(_QWORD *)(v49 + 216);
  *(_QWORD *)(v48 + 208) = *(_QWORD *)(v49 + 208);
  *(_QWORD *)(v48 + 216) = v70;
  v88 = *(_QWORD *)(v49 + 224);
  *(_QWORD *)(v48 + 224) = v88;
  *(_BYTE *)(v48 + 232) = *(_BYTE *)(v49 + 232);
  *(_BYTE *)(v48 + 233) = *(_BYTE *)(v49 + 233);
  *(_BYTE *)(v48 + 234) = *(_BYTE *)(v49 + 234);
  v55 = *(_QWORD *)(v49 + 248);
  *(_QWORD *)(v48 + 240) = *(_QWORD *)(v49 + 240);
  *(_QWORD *)(v48 + 248) = v55;
  v56 = *(_QWORD *)(v49 + 264);
  *(_QWORD *)(v48 + 256) = *(_QWORD *)(v49 + 256);
  *(_QWORD *)(v48 + 264) = v56;
  v57 = v102[24];
  v94 = (void *)(v48 + v57);
  v69 = (const void *)(v49 + v57);
  swift_retain(v43);
  swift_retain(v90);
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRetain(v51);
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRetain(v53);
  swift_bridgeObjectRetain(v86);
  swift_bridgeObjectRetain(v84);
  swift_bridgeObjectRetain(v54);
  swift_bridgeObjectRetain(v82);
  swift_bridgeObjectRetain(v80);
  swift_bridgeObjectRetain(v78);
  swift_bridgeObjectRetain(v76);
  swift_bridgeObjectRetain(v74);
  swift_bridgeObjectRetain(v72);
  swift_bridgeObjectRetain(v70);
  swift_bridgeObjectRetain(v88);
  swift_bridgeObjectRetain(v55);
  swift_bridgeObjectRetain(v56);
  if (v99(v69, 1, v101))
  {
    v58 = sub_1000070B8(&qword_100034868);
    memcpy(v94, v69, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
    v59 = v100;
  }
  else
  {
    v59 = v100;
    (*(void (**)(void *, const void *, uint64_t))(v100 + 16))(v94, v69, v101);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v100 + 56))(v94, 0, 1, v101);
  }
  v60 = v102[25];
  v61 = (void *)(v48 + v60);
  v62 = (const void *)(v49 + v60);
  if (v99((const void *)(v49 + v60), 1, v101))
  {
    v63 = sub_1000070B8(&qword_100034868);
    memcpy(v61, v62, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v59 + 16))(v61, v62, v101);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v61, 0, 1, v101);
  }
  v64 = v102[26];
  v65 = (void *)(v48 + v64);
  v66 = (const void *)(v49 + v64);
  if (v92((const void *)(v49 + v64), 1, (uint64_t)__dsta))
  {
    v67 = sub_1000070B8(&qword_1000347F0);
    memcpy(v65, v66, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, void *))(v96 + 16))(v65, v66, __dsta);
    (*(void (**)(void *, _QWORD, uint64_t, void *))(v96 + 56))(v65, 0, 1, __dsta);
  }
  *(_BYTE *)(v48 + v102[27]) = *(_BYTE *)(v49 + v102[27]);
  return a1;
}

uint64_t sub_100018130(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(void *, uint64_t, uint64_t);
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(void *, uint64_t, uint64_t);
  int v61;
  int v62;
  uint64_t v63;
  int *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  int v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  int v137;
  int v138;
  uint64_t v139;
  uint64_t v141;
  uint64_t v143;
  int *v144;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v6);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v18);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v19 = *(_QWORD *)(a2 + 120);
  v20 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v19;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRelease(v20);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v21 = *(_QWORD *)(a2 + 136);
  v22 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v22);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v23 = *(_QWORD *)(a2 + 152);
  v24 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v23;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease(v24);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v25 = *(_QWORD *)(a2 + 168);
  v26 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v26);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  v27 = *(_QWORD *)(a2 + 184);
  v28 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v29 = *(_QWORD *)(a2 + 200);
  v30 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v31 = *(_QWORD *)(a2 + 216);
  v32 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v32);
  v33 = *(_QWORD *)(a2 + 224);
  v34 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = v33;
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRelease(v34);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  v35 = *(_QWORD *)(a2 + 248);
  v36 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 248) = v35;
  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRelease(v36);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  v37 = *(_QWORD *)(a2 + 264);
  v38 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 264) = v37;
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRelease(v38);
  v39 = (int *)type metadata accessor for InviteMessageDetails(0);
  v40 = v39[24];
  v41 = (void *)(a1 + v40);
  v42 = (void *)(a2 + v40);
  v43 = type metadata accessor for URL(0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v44 + 48);
  v46 = v45(v41, 1, v43);
  v47 = v45(v42, 1, v43);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(void *, void *, uint64_t))(v44 + 16))(v41, v42, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v47)
  {
    (*(void (**)(void *, uint64_t))(v44 + 8))(v41, v43);
LABEL_6:
    v48 = sub_1000070B8(&qword_100034868);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v44 + 24))(v41, v42, v43);
LABEL_7:
  v49 = v39[25];
  v50 = (void *)(a1 + v49);
  v51 = (void *)(a2 + v49);
  v52 = v45((void *)(a1 + v49), 1, v43);
  v53 = v45(v51, 1, v43);
  v143 = v44;
  if (v52)
  {
    if (!v53)
    {
      (*(void (**)(void *, void *, uint64_t))(v44 + 16))(v50, v51, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v50, 0, 1, v43);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v53)
  {
    (*(void (**)(void *, uint64_t))(v44 + 8))(v50, v43);
LABEL_12:
    v54 = sub_1000070B8(&qword_100034868);
    memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v44 + 24))(v50, v51, v43);
LABEL_13:
  v144 = v39;
  v55 = v39[26];
  v56 = (void *)(a1 + v55);
  v57 = (void *)(a2 + v55);
  v58 = type metadata accessor for Date(0);
  v59 = *(_QWORD *)(v58 - 8);
  v60 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v59 + 48);
  v61 = v60(v56, 1, v58);
  v62 = v60(v57, 1, v58);
  v141 = v59;
  if (v61)
  {
    if (!v62)
    {
      (*(void (**)(void *, void *, uint64_t))(v59 + 16))(v56, v57, v58);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v62)
  {
    (*(void (**)(void *, uint64_t))(v59 + 8))(v56, v58);
LABEL_18:
    v63 = sub_1000070B8(&qword_1000347F0);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v59 + 24))(v56, v57, v58);
LABEL_19:
  *(_BYTE *)(a1 + v144[27]) = *(_BYTE *)(a2 + v144[27]);
  v64 = (int *)type metadata accessor for InviteMessageView(0);
  v65 = v64[5];
  v66 = a1 + v65;
  v67 = a2 + v65;
  v68 = *(_BYTE *)(v67 + 8);
  *(_QWORD *)v66 = *(_QWORD *)v67;
  *(_BYTE *)(v66 + 8) = v68;
  v69 = v64[6];
  v70 = a1 + v69;
  v71 = a2 + v69;
  v72 = *(void **)v71;
  v73 = *(_QWORD *)(v71 + 8);
  v74 = *(void **)v70;
  *(_QWORD *)v70 = *(_QWORD *)v71;
  v75 = v72;

  *(_QWORD *)(v70 + 8) = v73;
  sub_1000092A8((_QWORD *)(a1 + v64[7]), (_QWORD *)(a2 + v64[7]));
  v76 = v64[8];
  v77 = a1 + v76;
  v78 = a2 + v76;
  *(_BYTE *)v77 = *(_BYTE *)v78;
  v79 = *(_QWORD *)(v77 + 8);
  v80 = *(_QWORD *)(v78 + 8);
  *(_QWORD *)(v77 + 8) = v80;
  swift_retain(v80);
  swift_release(v79);
  v81 = v64[9];
  v82 = a1 + v81;
  v83 = a2 + v81;
  *(_BYTE *)v82 = *(_BYTE *)v83;
  v84 = *(_QWORD *)(v82 + 8);
  v85 = *(_QWORD *)(v83 + 8);
  *(_QWORD *)(v82 + 8) = v85;
  swift_retain(v85);
  swift_release(v84);
  *(_QWORD *)(a1 + v64[10]) = *(_QWORD *)(a2 + v64[10]);
  v86 = *(int *)(a3 + 20);
  v87 = a1 + v86;
  v88 = a2 + v86;
  *(_QWORD *)v87 = *(_QWORD *)(a2 + v86);
  v89 = *(_QWORD *)(a2 + v86 + 8);
  v90 = *(_QWORD *)(a1 + v86 + 8);
  *(_QWORD *)(v87 + 8) = v89;
  swift_bridgeObjectRetain(v89);
  swift_bridgeObjectRelease(v90);
  *(_QWORD *)(v87 + 16) = *(_QWORD *)(v88 + 16);
  v91 = *(_QWORD *)(v88 + 24);
  v92 = *(_QWORD *)(v87 + 24);
  *(_QWORD *)(v87 + 24) = v91;
  swift_bridgeObjectRetain(v91);
  swift_bridgeObjectRelease(v92);
  *(_QWORD *)(v87 + 32) = *(_QWORD *)(v88 + 32);
  v93 = *(_QWORD *)(v88 + 40);
  v94 = *(_QWORD *)(v87 + 40);
  *(_QWORD *)(v87 + 40) = v93;
  swift_bridgeObjectRetain(v93);
  swift_bridgeObjectRelease(v94);
  *(_QWORD *)(v87 + 48) = *(_QWORD *)(v88 + 48);
  v95 = *(_QWORD *)(v88 + 56);
  v96 = *(_QWORD *)(v87 + 56);
  *(_QWORD *)(v87 + 56) = v95;
  swift_bridgeObjectRetain(v95);
  swift_bridgeObjectRelease(v96);
  *(_QWORD *)(v87 + 64) = *(_QWORD *)(v88 + 64);
  v97 = *(_QWORD *)(v88 + 72);
  v98 = *(_QWORD *)(v87 + 72);
  *(_QWORD *)(v87 + 72) = v97;
  swift_bridgeObjectRetain(v97);
  swift_bridgeObjectRelease(v98);
  *(_QWORD *)(v87 + 80) = *(_QWORD *)(v88 + 80);
  v99 = *(_QWORD *)(v88 + 88);
  v100 = *(_QWORD *)(v87 + 88);
  *(_QWORD *)(v87 + 88) = v99;
  swift_bridgeObjectRetain(v99);
  swift_bridgeObjectRelease(v100);
  *(_QWORD *)(v87 + 96) = *(_QWORD *)(v88 + 96);
  v101 = *(_QWORD *)(v88 + 104);
  v102 = *(_QWORD *)(v87 + 104);
  *(_QWORD *)(v87 + 104) = v101;
  swift_bridgeObjectRetain(v101);
  swift_bridgeObjectRelease(v102);
  *(_QWORD *)(v87 + 112) = *(_QWORD *)(v88 + 112);
  v103 = *(_QWORD *)(v88 + 120);
  v104 = *(_QWORD *)(v87 + 120);
  *(_QWORD *)(v87 + 120) = v103;
  swift_bridgeObjectRetain(v103);
  swift_bridgeObjectRelease(v104);
  *(_QWORD *)(v87 + 128) = *(_QWORD *)(v88 + 128);
  v105 = *(_QWORD *)(v88 + 136);
  v106 = *(_QWORD *)(v87 + 136);
  *(_QWORD *)(v87 + 136) = v105;
  swift_bridgeObjectRetain(v105);
  swift_bridgeObjectRelease(v106);
  *(_QWORD *)(v87 + 144) = *(_QWORD *)(v88 + 144);
  v107 = *(_QWORD *)(v88 + 152);
  v108 = *(_QWORD *)(v87 + 152);
  *(_QWORD *)(v87 + 152) = v107;
  swift_bridgeObjectRetain(v107);
  swift_bridgeObjectRelease(v108);
  *(_QWORD *)(v87 + 160) = *(_QWORD *)(v88 + 160);
  v109 = *(_QWORD *)(v88 + 168);
  v110 = *(_QWORD *)(v87 + 168);
  *(_QWORD *)(v87 + 168) = v109;
  swift_bridgeObjectRetain(v109);
  swift_bridgeObjectRelease(v110);
  *(_QWORD *)(v87 + 176) = *(_QWORD *)(v88 + 176);
  v111 = *(_QWORD *)(v88 + 184);
  v112 = *(_QWORD *)(v87 + 184);
  *(_QWORD *)(v87 + 184) = v111;
  swift_bridgeObjectRetain(v111);
  swift_bridgeObjectRelease(v112);
  *(_QWORD *)(v87 + 192) = *(_QWORD *)(v88 + 192);
  v113 = *(_QWORD *)(v88 + 200);
  v114 = *(_QWORD *)(v87 + 200);
  *(_QWORD *)(v87 + 200) = v113;
  swift_bridgeObjectRetain(v113);
  swift_bridgeObjectRelease(v114);
  *(_QWORD *)(v87 + 208) = *(_QWORD *)(v88 + 208);
  v115 = *(_QWORD *)(v88 + 216);
  v116 = *(_QWORD *)(v87 + 216);
  *(_QWORD *)(v87 + 216) = v115;
  swift_bridgeObjectRetain(v115);
  swift_bridgeObjectRelease(v116);
  v117 = *(_QWORD *)(v88 + 224);
  v118 = *(_QWORD *)(v87 + 224);
  *(_QWORD *)(v87 + 224) = v117;
  swift_bridgeObjectRetain(v117);
  swift_bridgeObjectRelease(v118);
  *(_BYTE *)(v87 + 232) = *(_BYTE *)(v88 + 232);
  *(_BYTE *)(v87 + 233) = *(_BYTE *)(v88 + 233);
  *(_BYTE *)(v87 + 234) = *(_BYTE *)(v88 + 234);
  *(_QWORD *)(v87 + 240) = *(_QWORD *)(v88 + 240);
  v119 = *(_QWORD *)(v88 + 248);
  v120 = *(_QWORD *)(v87 + 248);
  *(_QWORD *)(v87 + 248) = v119;
  swift_bridgeObjectRetain(v119);
  swift_bridgeObjectRelease(v120);
  *(_QWORD *)(v87 + 256) = *(_QWORD *)(v88 + 256);
  v121 = *(_QWORD *)(v88 + 264);
  v122 = *(_QWORD *)(v87 + 264);
  *(_QWORD *)(v87 + 264) = v121;
  swift_bridgeObjectRetain(v121);
  swift_bridgeObjectRelease(v122);
  v123 = v144[24];
  v124 = (void *)(v87 + v123);
  v125 = (void *)(v88 + v123);
  LODWORD(v64) = v45((void *)(v87 + v123), 1, v43);
  v126 = v45(v125, 1, v43);
  if ((_DWORD)v64)
  {
    if (!v126)
    {
      (*(void (**)(void *, void *, uint64_t))(v143 + 16))(v124, v125, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v143 + 56))(v124, 0, 1, v43);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v126)
  {
    (*(void (**)(void *, uint64_t))(v143 + 8))(v124, v43);
LABEL_24:
    v127 = sub_1000070B8(&qword_100034868);
    memcpy(v124, v125, *(_QWORD *)(*(_QWORD *)(v127 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v143 + 24))(v124, v125, v43);
LABEL_25:
  v128 = v144[25];
  v129 = (void *)(v87 + v128);
  v130 = (void *)(v88 + v128);
  v131 = v45((void *)(v87 + v128), 1, v43);
  v132 = v45(v130, 1, v43);
  if (v131)
  {
    if (!v132)
    {
      (*(void (**)(void *, void *, uint64_t))(v143 + 16))(v129, v130, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v143 + 56))(v129, 0, 1, v43);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v132)
  {
    (*(void (**)(void *, uint64_t))(v143 + 8))(v129, v43);
LABEL_30:
    v133 = sub_1000070B8(&qword_100034868);
    memcpy(v129, v130, *(_QWORD *)(*(_QWORD *)(v133 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(void *, void *, uint64_t))(v143 + 24))(v129, v130, v43);
LABEL_31:
  v134 = v144[26];
  v135 = (void *)(v87 + v134);
  v136 = (void *)(v88 + v134);
  v137 = v60((void *)(v87 + v134), 1, v58);
  v138 = v60(v136, 1, v58);
  if (!v137)
  {
    if (!v138)
    {
      (*(void (**)(void *, void *, uint64_t))(v141 + 24))(v135, v136, v58);
      goto LABEL_37;
    }
    (*(void (**)(void *, uint64_t))(v141 + 8))(v135, v58);
    goto LABEL_36;
  }
  if (v138)
  {
LABEL_36:
    v139 = sub_1000070B8(&qword_1000347F0);
    memcpy(v135, v136, *(_QWORD *)(*(_QWORD *)(v139 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(void *, void *, uint64_t))(v141 + 16))(v135, v136, v58);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v141 + 56))(v135, 0, 1, v58);
LABEL_37:
  *(_BYTE *)(v87 + v144[27]) = *(_BYTE *)(v88 + v144[27]);
  return a1;
}

uint64_t sub_100018B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int *v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(const void *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  const void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const void *v60;
  uint64_t v61;
  unsigned int (*v63)(const void *, uint64_t, uint64_t);
  uint64_t v65;

  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  v9 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v9;
  v10 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v10;
  v11 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v11;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  v12 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v12;
  v13 = (int *)type metadata accessor for InviteMessageDetails(0);
  v14 = v13[24];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    v20 = sub_1000070B8(&qword_100034868);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v21 = v13[25];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    v24 = sub_1000070B8(&qword_100034868);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v22, v23, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  v25 = v13[26];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = type metadata accessor for Date(0);
  v29 = *(_QWORD *)(v28 - 8);
  v63 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48);
  v65 = v29;
  if (v63(v27, 1, v28))
  {
    v30 = sub_1000070B8(&qword_1000347F0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  *(_BYTE *)(a1 + v13[27]) = *(_BYTE *)(a2 + v13[27]);
  v31 = (int *)type metadata accessor for InviteMessageView(0);
  v32 = v31[5];
  v33 = a1 + v32;
  v34 = a2 + v32;
  *(_QWORD *)v33 = *(_QWORD *)v34;
  *(_BYTE *)(v33 + 8) = *(_BYTE *)(v34 + 8);
  *(_OWORD *)(a1 + v31[6]) = *(_OWORD *)(a2 + v31[6]);
  v35 = v31[7];
  v36 = a1 + v35;
  v37 = a2 + v35;
  *(_QWORD *)(v36 + 32) = *(_QWORD *)(v37 + 32);
  v38 = *(_OWORD *)(v37 + 16);
  *(_OWORD *)v36 = *(_OWORD *)v37;
  *(_OWORD *)(v36 + 16) = v38;
  *(_OWORD *)(a1 + v31[8]) = *(_OWORD *)(a2 + v31[8]);
  *(_OWORD *)(a1 + v31[9]) = *(_OWORD *)(a2 + v31[9]);
  *(_QWORD *)(a1 + v31[10]) = *(_QWORD *)(a2 + v31[10]);
  v39 = *(int *)(a3 + 20);
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = *(_OWORD *)(a2 + v39 + 16);
  *(_OWORD *)v40 = *(_OWORD *)(a2 + v39);
  *(_OWORD *)(v40 + 16) = v42;
  v43 = *(_OWORD *)(a2 + v39 + 48);
  *(_OWORD *)(v40 + 32) = *(_OWORD *)(a2 + v39 + 32);
  *(_OWORD *)(v40 + 48) = v43;
  v44 = *(_OWORD *)(a2 + v39 + 80);
  *(_OWORD *)(v40 + 64) = *(_OWORD *)(a2 + v39 + 64);
  *(_OWORD *)(v40 + 80) = v44;
  v45 = *(_OWORD *)(a2 + v39 + 112);
  *(_OWORD *)(v40 + 96) = *(_OWORD *)(a2 + v39 + 96);
  *(_OWORD *)(v40 + 112) = v45;
  v46 = *(_OWORD *)(a2 + v39 + 144);
  *(_OWORD *)(v40 + 128) = *(_OWORD *)(a2 + v39 + 128);
  *(_OWORD *)(v40 + 144) = v46;
  v47 = *(_OWORD *)(a2 + v39 + 176);
  *(_OWORD *)(v40 + 160) = *(_OWORD *)(a2 + v39 + 160);
  *(_OWORD *)(v40 + 176) = v47;
  v48 = *(_OWORD *)(a2 + v39 + 208);
  *(_OWORD *)(v40 + 192) = *(_OWORD *)(a2 + v39 + 192);
  *(_OWORD *)(v40 + 208) = v48;
  *(_QWORD *)(v40 + 224) = *(_QWORD *)(a2 + v39 + 224);
  *(_BYTE *)(v40 + 232) = *(_BYTE *)(a2 + v39 + 232);
  *(_BYTE *)(v40 + 233) = *(_BYTE *)(a2 + v39 + 233);
  *(_BYTE *)(v40 + 234) = *(_BYTE *)(a2 + v39 + 234);
  v49 = *(_OWORD *)(a2 + v39 + 256);
  *(_OWORD *)(v40 + 240) = *(_OWORD *)(a2 + v39 + 240);
  *(_OWORD *)(v40 + 256) = v49;
  v50 = v13[24];
  v51 = (void *)(v40 + v50);
  v52 = (const void *)(v41 + v50);
  if (v19((const void *)(v41 + v50), 1, v17))
  {
    v53 = sub_1000070B8(&qword_100034868);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v51, v52, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v51, 0, 1, v17);
  }
  v54 = v13[25];
  v55 = (void *)(v40 + v54);
  v56 = (const void *)(v41 + v54);
  if (v19((const void *)(v41 + v54), 1, v17))
  {
    v57 = sub_1000070B8(&qword_100034868);
    memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v55, v56, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v55, 0, 1, v17);
  }
  v58 = v13[26];
  v59 = (void *)(v40 + v58);
  v60 = (const void *)(v41 + v58);
  if (v63((const void *)(v41 + v58), 1, v28))
  {
    v61 = sub_1000070B8(&qword_1000347F0);
    memcpy(v59, v60, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v65 + 32))(v59, v60, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v65 + 56))(v59, 0, 1, v28);
  }
  *(_BYTE *)(v40 + v13[27]) = *(_BYTE *)(v41 + v13[27]);
  return a1;
}

uint64_t sub_100018FF8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(void *, uint64_t, uint64_t);
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t (*v58)(void *, uint64_t, uint64_t);
  int v59;
  int v60;
  uint64_t v61;
  int *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  int v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  int v134;
  int v135;
  uint64_t v136;
  uint64_t (*v139)(void *, uint64_t, uint64_t);
  uint64_t v140;
  uint64_t v141;

  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v6);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v9;
  swift_bridgeObjectRelease(v10);
  v11 = *(_QWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v11;
  swift_bridgeObjectRelease(v12);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v13;
  swift_bridgeObjectRelease(v14);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v15;
  swift_bridgeObjectRelease(v16);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v17;
  swift_bridgeObjectRelease(v18);
  v19 = *(_QWORD *)(a2 + 120);
  v20 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v19;
  swift_bridgeObjectRelease(v20);
  v21 = *(_QWORD *)(a2 + 136);
  v22 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v21;
  swift_bridgeObjectRelease(v22);
  v23 = *(_QWORD *)(a2 + 152);
  v24 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v23;
  swift_bridgeObjectRelease(v24);
  v25 = *(_QWORD *)(a2 + 168);
  v26 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v25;
  swift_bridgeObjectRelease(v26);
  v27 = *(_QWORD *)(a2 + 184);
  v28 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v27;
  swift_bridgeObjectRelease(v28);
  v29 = *(_QWORD *)(a2 + 200);
  v30 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v29;
  swift_bridgeObjectRelease(v30);
  v31 = *(_QWORD *)(a2 + 216);
  v32 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v31;
  swift_bridgeObjectRelease(v32);
  v33 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRelease(v33);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v34 = *(_QWORD *)(a2 + 248);
  v35 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v34;
  swift_bridgeObjectRelease(v35);
  v36 = *(_QWORD *)(a2 + 264);
  v37 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v36;
  swift_bridgeObjectRelease(v37);
  v38 = (int *)type metadata accessor for InviteMessageDetails(0);
  v39 = v38[24];
  v40 = (void *)(a1 + v39);
  v41 = (void *)(a2 + v39);
  v42 = type metadata accessor for URL(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v43 + 48);
  v45 = v44(v40, 1, v42);
  v46 = v44(v41, 1, v42);
  if (v45)
  {
    if (!v46)
    {
      (*(void (**)(void *, void *, uint64_t))(v43 + 32))(v40, v41, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v46)
  {
    (*(void (**)(void *, uint64_t))(v43 + 8))(v40, v42);
LABEL_6:
    v47 = sub_1000070B8(&qword_100034868);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v43 + 40))(v40, v41, v42);
LABEL_7:
  v48 = v38[25];
  v49 = (void *)(a1 + v48);
  v50 = (void *)(a2 + v48);
  v51 = v44((void *)(a1 + v48), 1, v42);
  v52 = v44(v50, 1, v42);
  v141 = v43;
  if (v51)
  {
    if (!v52)
    {
      (*(void (**)(void *, void *, uint64_t))(v43 + 32))(v49, v50, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v49, 0, 1, v42);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v52)
  {
    (*(void (**)(void *, uint64_t))(v43 + 8))(v49, v42);
LABEL_12:
    v53 = sub_1000070B8(&qword_100034868);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v43 + 40))(v49, v50, v42);
LABEL_13:
  v54 = v38[26];
  v55 = (void *)(a1 + v54);
  v56 = (void *)(a2 + v54);
  v57 = type metadata accessor for Date(0);
  v140 = *(_QWORD *)(v57 - 8);
  v58 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v140 + 48);
  v59 = v58(v55, 1, v57);
  v139 = v58;
  v60 = v58(v56, 1, v57);
  if (v59)
  {
    if (!v60)
    {
      (*(void (**)(void *, void *, uint64_t))(v140 + 32))(v55, v56, v57);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v140 + 56))(v55, 0, 1, v57);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v60)
  {
    (*(void (**)(void *, uint64_t))(v140 + 8))(v55, v57);
LABEL_18:
    v61 = sub_1000070B8(&qword_1000347F0);
    memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v140 + 40))(v55, v56, v57);
LABEL_19:
  *(_BYTE *)(a1 + v38[27]) = *(_BYTE *)(a2 + v38[27]);
  v62 = (int *)type metadata accessor for InviteMessageView(0);
  v63 = v62[5];
  v64 = a1 + v63;
  v65 = a2 + v63;
  *(_QWORD *)v64 = *(_QWORD *)v65;
  *(_BYTE *)(v64 + 8) = *(_BYTE *)(v65 + 8);
  v66 = v62[6];
  v67 = a1 + v66;
  v68 = (uint64_t *)(a2 + v66);
  v69 = *v68;
  v70 = v68[1];
  v71 = *(void **)v67;
  *(_QWORD *)v67 = v69;

  *(_QWORD *)(v67 + 8) = v70;
  v72 = v62[7];
  v73 = a1 + v72;
  v74 = a2 + v72;
  sub_100008294((_QWORD *)(a1 + v72));
  v75 = *(_OWORD *)(v74 + 16);
  *(_OWORD *)v73 = *(_OWORD *)v74;
  *(_OWORD *)(v73 + 16) = v75;
  *(_QWORD *)(v73 + 32) = *(_QWORD *)(v74 + 32);
  v76 = v62[8];
  v77 = a1 + v76;
  v78 = a2 + v76;
  *(_BYTE *)v77 = *(_BYTE *)v78;
  v79 = *(_QWORD *)(v77 + 8);
  *(_QWORD *)(v77 + 8) = *(_QWORD *)(v78 + 8);
  swift_release(v79);
  v80 = v62[9];
  v81 = a1 + v80;
  v82 = a2 + v80;
  *(_BYTE *)v81 = *(_BYTE *)v82;
  v83 = *(_QWORD *)(v81 + 8);
  *(_QWORD *)(v81 + 8) = *(_QWORD *)(v82 + 8);
  swift_release(v83);
  *(_QWORD *)(a1 + v62[10]) = *(_QWORD *)(a2 + v62[10]);
  v84 = *(int *)(a3 + 20);
  v85 = a1 + v84;
  v86 = a2 + v84;
  v87 = *(_QWORD *)(a2 + v84 + 8);
  v88 = *(_QWORD *)(a1 + v84 + 8);
  *(_QWORD *)v85 = *(_QWORD *)(a2 + v84);
  *(_QWORD *)(v85 + 8) = v87;
  swift_bridgeObjectRelease(v88);
  v89 = *(_QWORD *)(v86 + 24);
  v90 = *(_QWORD *)(v85 + 24);
  *(_QWORD *)(v85 + 16) = *(_QWORD *)(v86 + 16);
  *(_QWORD *)(v85 + 24) = v89;
  swift_bridgeObjectRelease(v90);
  v91 = *(_QWORD *)(v86 + 40);
  v92 = *(_QWORD *)(v85 + 40);
  *(_QWORD *)(v85 + 32) = *(_QWORD *)(v86 + 32);
  *(_QWORD *)(v85 + 40) = v91;
  swift_bridgeObjectRelease(v92);
  v93 = *(_QWORD *)(v86 + 56);
  v94 = *(_QWORD *)(v85 + 56);
  *(_QWORD *)(v85 + 48) = *(_QWORD *)(v86 + 48);
  *(_QWORD *)(v85 + 56) = v93;
  swift_bridgeObjectRelease(v94);
  v95 = *(_QWORD *)(v86 + 72);
  v96 = *(_QWORD *)(v85 + 72);
  *(_QWORD *)(v85 + 64) = *(_QWORD *)(v86 + 64);
  *(_QWORD *)(v85 + 72) = v95;
  swift_bridgeObjectRelease(v96);
  v97 = *(_QWORD *)(v86 + 88);
  v98 = *(_QWORD *)(v85 + 88);
  *(_QWORD *)(v85 + 80) = *(_QWORD *)(v86 + 80);
  *(_QWORD *)(v85 + 88) = v97;
  swift_bridgeObjectRelease(v98);
  v99 = *(_QWORD *)(v86 + 104);
  v100 = *(_QWORD *)(v85 + 104);
  *(_QWORD *)(v85 + 96) = *(_QWORD *)(v86 + 96);
  *(_QWORD *)(v85 + 104) = v99;
  swift_bridgeObjectRelease(v100);
  v101 = *(_QWORD *)(v86 + 120);
  v102 = *(_QWORD *)(v85 + 120);
  *(_QWORD *)(v85 + 112) = *(_QWORD *)(v86 + 112);
  *(_QWORD *)(v85 + 120) = v101;
  swift_bridgeObjectRelease(v102);
  v103 = *(_QWORD *)(v86 + 136);
  v104 = *(_QWORD *)(v85 + 136);
  *(_QWORD *)(v85 + 128) = *(_QWORD *)(v86 + 128);
  *(_QWORD *)(v85 + 136) = v103;
  swift_bridgeObjectRelease(v104);
  v105 = *(_QWORD *)(v86 + 152);
  v106 = *(_QWORD *)(v85 + 152);
  *(_QWORD *)(v85 + 144) = *(_QWORD *)(v86 + 144);
  *(_QWORD *)(v85 + 152) = v105;
  swift_bridgeObjectRelease(v106);
  v107 = *(_QWORD *)(v86 + 168);
  v108 = *(_QWORD *)(v85 + 168);
  *(_QWORD *)(v85 + 160) = *(_QWORD *)(v86 + 160);
  *(_QWORD *)(v85 + 168) = v107;
  swift_bridgeObjectRelease(v108);
  v109 = *(_QWORD *)(v86 + 184);
  v110 = *(_QWORD *)(v85 + 184);
  *(_QWORD *)(v85 + 176) = *(_QWORD *)(v86 + 176);
  *(_QWORD *)(v85 + 184) = v109;
  swift_bridgeObjectRelease(v110);
  v111 = *(_QWORD *)(v86 + 200);
  v112 = *(_QWORD *)(v85 + 200);
  *(_QWORD *)(v85 + 192) = *(_QWORD *)(v86 + 192);
  *(_QWORD *)(v85 + 200) = v111;
  swift_bridgeObjectRelease(v112);
  v113 = *(_QWORD *)(v86 + 216);
  v114 = *(_QWORD *)(v85 + 216);
  *(_QWORD *)(v85 + 208) = *(_QWORD *)(v86 + 208);
  *(_QWORD *)(v85 + 216) = v113;
  swift_bridgeObjectRelease(v114);
  v115 = *(_QWORD *)(v85 + 224);
  *(_QWORD *)(v85 + 224) = *(_QWORD *)(v86 + 224);
  swift_bridgeObjectRelease(v115);
  *(_BYTE *)(v85 + 232) = *(_BYTE *)(v86 + 232);
  *(_BYTE *)(v85 + 233) = *(_BYTE *)(v86 + 233);
  *(_BYTE *)(v85 + 234) = *(_BYTE *)(v86 + 234);
  v116 = *(_QWORD *)(v86 + 248);
  v117 = *(_QWORD *)(v85 + 248);
  *(_QWORD *)(v85 + 240) = *(_QWORD *)(v86 + 240);
  *(_QWORD *)(v85 + 248) = v116;
  swift_bridgeObjectRelease(v117);
  v118 = *(_QWORD *)(v86 + 264);
  v119 = *(_QWORD *)(v85 + 264);
  *(_QWORD *)(v85 + 256) = *(_QWORD *)(v86 + 256);
  *(_QWORD *)(v85 + 264) = v118;
  swift_bridgeObjectRelease(v119);
  v120 = v38[24];
  v121 = (void *)(v85 + v120);
  v122 = (void *)(v86 + v120);
  LODWORD(v62) = v44((void *)(v85 + v120), 1, v42);
  v123 = v44(v122, 1, v42);
  if ((_DWORD)v62)
  {
    if (!v123)
    {
      (*(void (**)(void *, void *, uint64_t))(v141 + 32))(v121, v122, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v141 + 56))(v121, 0, 1, v42);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v123)
  {
    (*(void (**)(void *, uint64_t))(v141 + 8))(v121, v42);
LABEL_24:
    v124 = sub_1000070B8(&qword_100034868);
    memcpy(v121, v122, *(_QWORD *)(*(_QWORD *)(v124 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v141 + 40))(v121, v122, v42);
LABEL_25:
  v125 = v38[25];
  v126 = (void *)(v85 + v125);
  v127 = (void *)(v86 + v125);
  v128 = v44((void *)(v85 + v125), 1, v42);
  v129 = v44(v127, 1, v42);
  if (v128)
  {
    if (!v129)
    {
      (*(void (**)(void *, void *, uint64_t))(v141 + 32))(v126, v127, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v141 + 56))(v126, 0, 1, v42);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v129)
  {
    (*(void (**)(void *, uint64_t))(v141 + 8))(v126, v42);
LABEL_30:
    v130 = sub_1000070B8(&qword_100034868);
    memcpy(v126, v127, *(_QWORD *)(*(_QWORD *)(v130 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(void *, void *, uint64_t))(v141 + 40))(v126, v127, v42);
LABEL_31:
  v131 = v38[26];
  v132 = (void *)(v85 + v131);
  v133 = (void *)(v86 + v131);
  v134 = v139((void *)(v85 + v131), 1, v57);
  v135 = v139(v133, 1, v57);
  if (!v134)
  {
    if (!v135)
    {
      (*(void (**)(void *, void *, uint64_t))(v140 + 40))(v132, v133, v57);
      goto LABEL_37;
    }
    (*(void (**)(void *, uint64_t))(v140 + 8))(v132, v57);
    goto LABEL_36;
  }
  if (v135)
  {
LABEL_36:
    v136 = sub_1000070B8(&qword_1000347F0);
    memcpy(v132, v133, *(_QWORD *)(*(_QWORD *)(v136 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(void *, void *, uint64_t))(v140 + 32))(v132, v133, v57);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v140 + 56))(v132, 0, 1, v57);
LABEL_37:
  *(_BYTE *)(v85 + v38[27]) = *(_BYTE *)(v86 + v38[27]);
  return a1;
}

uint64_t sub_10001982C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019838);
}

uint64_t sub_100019838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for InviteMessageView(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for InviteMessageDetails(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1000198AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000198B8);
}

uint64_t sub_1000198B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for InviteMessageView(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for InviteMessageDetails(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_100019934(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[2];

  result = type metadata accessor for InviteMessageView(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for InviteMessageDetails(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000199B8()
{
  return sub_1000199E4(&qword_100034BA0, &qword_100034958, (void (*)(void))sub_100019A68);
}

uint64_t sub_1000199E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000792C(a2);
    a3();
    sub_10001B88C(&qword_100034BD0, &qword_100034BD8, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100019A68()
{
  return sub_100014640(&qword_100034BA8, &qword_100034950, (void (*)(void))sub_100019A8C);
}

uint64_t sub_100019A8C()
{
  return sub_100014640(&qword_100034BB0, &qword_100034948, (void (*)(void))sub_100019AB0);
}

uint64_t sub_100019AB0()
{
  return sub_100014640(&qword_100034BB8, &qword_100034940, (void (*)(void))sub_100019AD4);
}

unint64_t sub_100019AD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034BC0;
  if (!qword_100034BC0)
  {
    v1 = sub_10000792C(&qword_100034938);
    sub_10001B88C(&qword_100034BC8, &qword_100034930, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034BC0);
  }
  return result;
}

uint64_t sub_100019B58(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B8C0, 1);
}

uint64_t sub_100019B68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B898, 1);
}

uint64_t sub_100019B78(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B870, 1);
}

uint64_t sub_100019B88(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B848, 1);
}

uint64_t sub_100019B98(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B820, 1);
}

uint64_t sub_100019BA8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B7F8, 1);
}

uint64_t sub_100019BB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  int *v14;
  _QWORD *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = type metadata accessor for SettingsView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v22 = *(unsigned __int8 *)(v2 + 80);
  v23 = v0;
  v20 = *(_QWORD *)(v2 + 64);
  v21 = (v22 + 16) & ~v22;
  v3 = (_QWORD *)(v0 + v21);
  swift_bridgeObjectRelease(v3[1]);
  swift_bridgeObjectRelease(v3[3]);
  swift_bridgeObjectRelease(v3[5]);
  swift_bridgeObjectRelease(v3[7]);
  swift_bridgeObjectRelease(v3[9]);
  swift_bridgeObjectRelease(v3[11]);
  swift_bridgeObjectRelease(v3[13]);
  swift_bridgeObjectRelease(v3[15]);
  swift_bridgeObjectRelease(v3[17]);
  swift_bridgeObjectRelease(v3[19]);
  swift_bridgeObjectRelease(v3[21]);
  swift_bridgeObjectRelease(v3[23]);
  swift_bridgeObjectRelease(v3[25]);
  swift_bridgeObjectRelease(v3[27]);
  swift_bridgeObjectRelease(v3[28]);
  swift_bridgeObjectRelease(v3[31]);
  swift_bridgeObjectRelease(v3[33]);
  v4 = (int *)type metadata accessor for InviteMessageDetails(0);
  v5 = (char *)v3 + v4[24];
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  v9 = (char *)v3 + v4[25];
  if (!v8(v9, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v10 = (char *)v3 + v4[26];
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (!v13(v10, 1, v11))
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  v14 = (int *)type metadata accessor for InviteMessageView(0);

  sub_100008294((_QWORD *)((char *)v3 + v14[7]));
  swift_release(*(_QWORD *)((char *)v3 + v14[8] + 8));
  swift_release(*(_QWORD *)((char *)v3 + v14[9] + 8));
  v15 = (_QWORD *)((char *)v3 + *(int *)(v1 + 20));
  swift_bridgeObjectRelease(v15[1]);
  swift_bridgeObjectRelease(v15[3]);
  swift_bridgeObjectRelease(v15[5]);
  swift_bridgeObjectRelease(v15[7]);
  swift_bridgeObjectRelease(v15[9]);
  swift_bridgeObjectRelease(v15[11]);
  swift_bridgeObjectRelease(v15[13]);
  swift_bridgeObjectRelease(v15[15]);
  swift_bridgeObjectRelease(v15[17]);
  swift_bridgeObjectRelease(v15[19]);
  swift_bridgeObjectRelease(v15[21]);
  swift_bridgeObjectRelease(v15[23]);
  swift_bridgeObjectRelease(v15[25]);
  swift_bridgeObjectRelease(v15[27]);
  swift_bridgeObjectRelease(v15[28]);
  swift_bridgeObjectRelease(v15[31]);
  swift_bridgeObjectRelease(v15[33]);
  v16 = (char *)v15 + v4[24];
  if (!v8(v16, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
  v17 = (char *)v15 + v4[25];
  if (!v8(v17, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v17, v6);
  v18 = (char *)v15 + v4[26];
  if (!v13(v18, 1, v11))
    (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v11);
  return swift_deallocObject(v23, v21 + v20, v22 | 7);
}

uint64_t sub_100019ECC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_100019F10()
{
  type metadata accessor for SettingsView(0);
  sub_100011550();
}

double sub_100019F48@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_100011A08(*(_QWORD *)(v1 + 16), (void *)*(_QWORD *)(v1 + 24), a1).n128_u64[0];
  return result;
}

uint64_t sub_100019F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(uint64_t, uint64_t, uint64_t);
  int *v14;
  _QWORD *v15;
  char *v16;
  char *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = type metadata accessor for SettingsView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v24 = *(unsigned __int8 *)(v2 + 80);
  v22 = *(_QWORD *)(v2 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v25 = v0;
  v23 = (v24 + 32) & ~v24;
  v3 = v0 + v23;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 104));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 120));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 136));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 152));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 168));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 184));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 200));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 216));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 224));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 248));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v23 + 264));
  v4 = (int *)type metadata accessor for InviteMessageDetails(0);
  v5 = v0 + v23 + v4[24];
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v9 = v3 + v4[25];
  if (!v8(v9, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  v10 = v3 + v4[26];
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (!v13(v10, 1, v11))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  v14 = (int *)type metadata accessor for InviteMessageView(0);

  sub_100008294((_QWORD *)(v3 + v14[7]));
  swift_release(*(_QWORD *)(v3 + v14[8] + 8));
  swift_release(*(_QWORD *)(v3 + v14[9] + 8));
  v15 = (_QWORD *)(v3 + *(int *)(v1 + 20));
  swift_bridgeObjectRelease(v15[1]);
  swift_bridgeObjectRelease(v15[3]);
  swift_bridgeObjectRelease(v15[5]);
  swift_bridgeObjectRelease(v15[7]);
  swift_bridgeObjectRelease(v15[9]);
  swift_bridgeObjectRelease(v15[11]);
  swift_bridgeObjectRelease(v15[13]);
  swift_bridgeObjectRelease(v15[15]);
  swift_bridgeObjectRelease(v15[17]);
  swift_bridgeObjectRelease(v15[19]);
  swift_bridgeObjectRelease(v15[21]);
  swift_bridgeObjectRelease(v15[23]);
  swift_bridgeObjectRelease(v15[25]);
  swift_bridgeObjectRelease(v15[27]);
  swift_bridgeObjectRelease(v15[28]);
  swift_bridgeObjectRelease(v15[31]);
  swift_bridgeObjectRelease(v15[33]);
  v16 = (char *)v15 + v4[24];
  if (!v8((uint64_t)v16, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
  v17 = (char *)v15 + v4[25];
  if (!v8((uint64_t)v17, 1, v6))
    (*(void (**)(char *, uint64_t))(v7 + 8))(v17, v6);
  v18 = (char *)v15 + v4[26];
  if (!v13((uint64_t)v18, 1, v11))
    (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v11);
  v19 = (v22 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = v19 + 16;

  return swift_deallocObject(v25, v20, v24 | 7);
}

uint64_t sub_10001A294(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for SettingsView(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc(dword_100034C3C);
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_100008348;
  return sub_1000122C0(a1, v6, v7, v8, v10, v11);
}

_QWORD *sub_10001A340(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001A364(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001A374(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001A37C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001A3A4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10001A3CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001A3F4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10001A41C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 112);
  v7 = *(_QWORD *)(a1 + 120);
  v8 = *(_QWORD *)(a1 + 128);
  v9 = *(_BYTE *)(a1 + 136);
  v10 = *(_QWORD *)(a1 + 144);
  sub_10001A4B0(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  sub_10001A4E0(v2, v3, v4, v5, v6);
  sub_1000152A0(v7, v8, v9);
  swift_bridgeObjectRetain(v10);
  return a1;
}

uint64_t sub_10001A4B0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000152A0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t sub_10001A4E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;

  if (result)
  {
    v8 = result;
    swift_retain(a5);
    swift_retain(v8);
    swift_retain(a2);
    swift_retain(a3);
    return swift_retain(a4);
  }
  return result;
}

uint64_t sub_10001A53C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 112);
  v7 = *(_QWORD *)(a1 + 120);
  v8 = *(_QWORD *)(a1 + 128);
  v9 = *(_BYTE *)(a1 + 136);
  v10 = *(_QWORD *)(a1 + 144);
  sub_10001A5D0(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  sub_10001A600(v2, v3, v4, v5, v6);
  sub_1000143C8(v7, v8, v9);
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t sub_10001A5D0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000143C8(result, a2, a3 & 1);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_10001A600(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    swift_release(result);
    swift_release(a2);
    swift_release(a4);
    swift_release(a3);
    return swift_release(a5);
  }
  return result;
}

uint64_t sub_10001A65C()
{
  return sub_10001A868((uint64_t)sub_10001AE8C);
}

uint64_t sub_10001A66C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;

  v1 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  v5 = v0 + v3;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 104));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 120));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 136));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 152));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 168));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 184));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 200));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 216));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 224));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 248));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 264));
  v6 = (int *)type metadata accessor for InviteMessageDetails(0);
  v7 = v0 + v3 + v6[24];
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v11 = v5 + v6[25];
  if (!v10(v11, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  v12 = v5 + v6[26];
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v15 = (int *)type metadata accessor for InviteMessageView(0);

  sub_100008294((_QWORD *)(v5 + v15[7]));
  swift_release(*(_QWORD *)(v5 + v15[8] + 8));
  swift_release(*(_QWORD *)(v5 + v15[9] + 8));
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10001A85C()
{
  return sub_10001A868((uint64_t)sub_10001AAAC);
}

uint64_t sub_10001A868(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8) + 80);
  return sub_10000F470(v1 + ((v3 + 32) & ~v3), a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

unint64_t sub_10001A8AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034CB8;
  if (!qword_100034CB8)
  {
    v1 = sub_10000792C(&qword_100034CA0);
    sub_1000199E4(&qword_100034CC0, &qword_100034C98, (void (*)(void))sub_10001A948);
    sub_10001B88C(&qword_100034CD8, &qword_100034CA8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034CB8);
  }
  return result;
}

unint64_t sub_10001A948()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034CC8;
  if (!qword_100034CC8)
  {
    v1 = sub_10000792C(&qword_100034C90);
    sub_10001B88C(&qword_100034CD0, &qword_100034C88, (uint64_t)&protocol conformance descriptor for Button<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034CC8);
  }
  return result;
}

uint64_t sub_10001A9D0()
{
  return sub_10001A868((uint64_t)sub_10001A9E4);
}

uint64_t sub_10001A9DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000DDB0(*(_QWORD *)(v1 + 16), a1);
}

void sub_10001A9E4()
{
  uint64_t v0;

  sub_10000D934(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10001AA00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc(dword_100034CEC);
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_100008348;
  return sub_10000DB88(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_10001AAAC()
{
  uint64_t v0;

  return sub_10000F4F4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10001AAC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + (v8 & ~v7);
  v13 = (_QWORD *)swift_task_alloc(dword_100034CFC);
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_100008348;
  return sub_10000F858(a1, v9, v10, v11, v12);
}

unint64_t sub_10001AB7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034D30;
  if (!qword_100034D30)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_100034D30);
  }
  return result;
}

uint64_t sub_10001ABBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int *v16;

  v1 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v5 = v0 + v3;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 104));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 120));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 136));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 152));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 168));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 184));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 200));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 216));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 224));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 248));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 264));
  v6 = (int *)type metadata accessor for InviteMessageDetails(0);
  v7 = v0 + v3 + v6[24];
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v11 = v5 + v6[25];
  if (!v10(v11, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  v12 = v5 + v6[26];
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v15 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = (int *)type metadata accessor for InviteMessageView(0);

  sub_100008294((_QWORD *)(v5 + v16[7]));
  swift_release(*(_QWORD *)(v5 + v16[8] + 8));
  swift_release(*(_QWORD *)(v5 + v16[9] + 8));

  return swift_deallocObject(v0, v15 + 16, v2 | 7);
}

uint64_t sub_10001ADC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc(dword_100034D3C);
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_10000824C;
  return sub_10001010C(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_10001AE74(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_errorRetain();
  return result;
}

uint64_t sub_10001AE80(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_errorRelease();
  return result;
}

uint64_t sub_10001AE8C()
{
  uint64_t v0;

  return sub_10000DEDC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10001AEA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 32) & ~v2;
  v20 = *(_QWORD *)(v1 + 64);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v19 = *(_QWORD *)(v5 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v7 = v0 + v3;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 104));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 120));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 136));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 152));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 168));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 184));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 200));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 216));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 224));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 248));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 264));
  v8 = (int *)type metadata accessor for InviteMessageDetails(0);
  v9 = v0 + v3 + v8[24];
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v10(v9, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v4);
  v11 = v7 + v8[25];
  if (!v10(v11, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v4);
  v12 = v7 + v8[26];
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v15 = v2 | v6 | 7;
  v16 = (v3 + v20 + v6) & ~v6;
  v17 = (int *)type metadata accessor for InviteMessageView(0);

  sub_100008294((_QWORD *)(v7 + v17[7]));
  swift_release(*(_QWORD *)(v7 + v17[8] + 8));
  swift_release(*(_QWORD *)(v7 + v17[9] + 8));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v16, v4);
  return swift_deallocObject(v0, v16 + v19, v15);
}

uint64_t sub_10001B0E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(type metadata accessor for InviteActionsView(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + (v8 & ~v7);
  v13 = (_QWORD *)swift_task_alloc(dword_100034D54);
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_100008348;
  return sub_10000E244(a1, v9, v10, v11, v12);
}

uint64_t sub_10001B194()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_10001B1B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000070B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001B1FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B220@<X0>(unint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1000139F4(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_10001B228()
{
  unint64_t result;

  result = qword_100034E08;
  if (!qword_100034E08)
  {
    result = swift_getWitnessTable(&unk_10002A454, &type metadata for SubscriptionView);
    atomic_store(result, (unint64_t *)&qword_100034E08);
  }
  return result;
}

uint64_t sub_10001B26C@<X0>(unint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100013B38(a1, *(_QWORD *)(v2 + 16), a2);
}

ValueMetadata *type metadata accessor for ThinDivider()
{
  return &type metadata for ThinDivider;
}

uint64_t destroy for Subscription(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for Subscription(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for Subscription(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for Subscription(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for Subscription(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for Subscription(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Subscription(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SubscriptionView()
{
  return &type metadata for SubscriptionView;
}

uint64_t sub_10001B440()
{
  return sub_10001B88C(&qword_100034E20, &qword_100034E28, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

uint64_t sub_10001B46C()
{
  return sub_10001B4A0(&qword_100034E30, &qword_100034E38);
}

uint64_t sub_10001B4A0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000792C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001B500()
{
  return sub_10001B88C(&qword_100034E40, &qword_100034E48, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_10001B52C()
{
  return sub_10001B88C(&qword_100034E50, &qword_100034E58, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

unint64_t sub_10001B55C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034E60;
  if (!qword_100034E60)
  {
    v1 = sub_10000792C(&qword_100034D70);
    sub_10001B88C(&qword_100034E68, &qword_100034D60, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034E60);
  }
  return result;
}

uint64_t sub_10001B5E0()
{
  _QWORD v1[2];

  v1[0] = sub_10000792C(&qword_100034DD8);
  v1[1] = sub_10001B88C(&qword_100034DE8, &qword_100034DD8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
}

uint64_t sub_10001B644(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B92C, 1);
}

uint64_t sub_10001B654(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B904, 1);
}

uint64_t sub_10001B664@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100013F70(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_10001B66C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1000140D0(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_10001B678()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034E80;
  if (!qword_100034E80)
  {
    v1 = sub_10000792C(&qword_100034E78);
    sub_10001B88C(&qword_100034E88, &qword_100034E90, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034E80);
  }
  return result;
}

unint64_t sub_10001B6FC()
{
  unint64_t result;

  result = qword_100034EA0;
  if (!qword_100034EA0)
  {
    result = swift_getWitnessTable("}t", &type metadata for CaptionLabelStyle);
    atomic_store(result, (unint64_t *)&qword_100034EA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptionLabelStyle()
{
  return &type metadata for CaptionLabelStyle;
}

uint64_t sub_10001B750()
{
  _QWORD v1[4];

  v1[0] = sub_10000792C(&qword_100034E70);
  v1[1] = &type metadata for CaptionLabelStyle;
  v1[2] = sub_10001B88C(&qword_100034E98, &qword_100034E70, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v1[3] = sub_10001B6FC();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.labelStyle<A>(_:)>>, 1);
}

unint64_t sub_10001B7CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034EA8;
  if (!qword_100034EA8)
  {
    v1 = sub_10000792C(&qword_100034EB0);
    sub_10001B88C(&qword_100034EB8, &qword_100034EC0, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034EA8);
  }
  return result;
}

uint64_t sub_10001B850(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002B954, 1);
}

uint64_t sub_10001B860()
{
  return sub_10001B88C(&qword_100034ED8, &qword_100034EE0, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

uint64_t sub_10001B88C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000792C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001B8EC(char a1)
{
  return *(_QWORD *)&aAccepteddeclin_0[8 * a1];
}

uint64_t sub_10001B90C(char *a1, char *a2)
{
  return sub_100009EA4(*a1, *a2);
}

Swift::Int sub_10001B918()
{
  char *v0;

  return sub_10001B920(*v0);
}

Swift::Int sub_10001B920(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  v2 = 8 * a1;
  v3 = *(_QWORD *)((char *)&unk_10002A700 + v2);
  String.hash(into:)(v5, *(_QWORD *)&aAccepteddeclin_0[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10001B988(uint64_t a1)
{
  char *v1;

  return sub_10001B990(a1, *v1);
}

uint64_t sub_10001B990(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)((char *)&unk_10002A700 + v2);
  String.hash(into:)(a1, *(_QWORD *)&aAccepteddeclin_0[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10001B9D0(uint64_t a1)
{
  char *v1;

  return sub_10001B9D8(a1, *v1);
}

Swift::Int sub_10001B9D8(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)((char *)&unk_10002A700 + v3);
  String.hash(into:)(v6, *(_QWORD *)&aAccepteddeclin_0[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_10001BA3C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001C604(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001BA68@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10001B8EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10001BA90(uint64_t result, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  id v9;

  v3 = *(_QWORD *)(result + 32);
  if (a3)
  {
    v5 = sub_1000070B8(&qword_100034D48);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = a2;
    v9 = a2;
    return swift_continuation_throwingResume(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BB1C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[2];
  _OWORD v42[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1000070B8(&qword_100035028);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v32 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v31)
      goto LABEL_37;
    v15 = *(_QWORD *)(v32 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v31)
        goto LABEL_37;
      v15 = *(_QWORD *)(v32 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v31)
          goto LABEL_37;
        v15 = *(_QWORD *)(v32 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v31)
            goto LABEL_37;
          v15 = *(_QWORD *)(v32 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = 16 * v13;
    v19 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = v19[1];
    v21 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v18);
    v23 = *v21;
    v22 = v21[1];
    *(_QWORD *)&v42[0] = *v19;
    *((_QWORD *)&v42[0] + 1) = v20;
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v22);
    swift_dynamicCast(&v34, v42, &type metadata for String, &type metadata for AnyHashable, 7);
    v33[0] = v23;
    v33[1] = v22;
    swift_dynamicCast(v37, v33, &type metadata for String, (char *)&type metadata for Any + 8, 7);
    v38 = v34;
    v39 = v35;
    v40 = v36;
    sub_10001FA28(v37, v41);
    v34 = v38;
    v35 = v39;
    v36 = v40;
    sub_10001FA28(v41, v42);
    sub_10001FA28(v42, &v38);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v24 = -1 << *((_BYTE *)v3 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)])) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)&v7[8 * v26];
      }
      while (v30 == -1);
      v10 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v34;
    *(_OWORD *)(v11 + 16) = v35;
    *(_QWORD *)(v11 + 32) = v36;
    result = (uint64_t)sub_10001FA28(&v38, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v31)
  {
LABEL_37:
    swift_release(v3);
    sub_10001FA38(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v32 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v31)
      goto LABEL_37;
    v15 = *(_QWORD *)(v32 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10001BED8(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_1000070B8(&qword_100034D48);
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

uint64_t sub_10001BF58(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  **(_QWORD **)(*(_QWORD *)(v2 + 64) + 40) = a2;
  v3 = a2;
  return swift_continuation_resume(v2);
}

uint64_t sub_10001BF88()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FamilyFetcher()
{
  return objc_opt_self(_TtC28InviteMessageBubbleExtension13FamilyFetcher);
}

uint64_t sub_10001BFB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_100027480(a3, a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (uint64_t *)(v20[7] + 16 * v14);
        result = swift_bridgeObjectRelease(v21[1]);
        *v21 = a1;
        v21[1] = a2;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_100028198();
      goto LABEL_7;
    }
    sub_100027AC0(v17, a5 & 1);
    v23 = sub_100027480(a3, a4);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100027FB8(v14, a3, a4, a1, a2, v20);
      return swift_bridgeObjectRetain(a4);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10001C0F8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = a1;
  return swift_task_switch(sub_10001C110, 0, 0);
}

uint64_t sub_10001C110()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0 + 2;
  v2 = v0[16];
  v3 = objc_msgSend(objc_allocWithZone((Class)FAFetchFamilyCircleRequest), "init");
  v0[17] = v3;
  objc_msgSend(v3, "setCachePolicy:", v2);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10001C1DC;
  v4 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_10001BA90;
  v5[3] = &unk_1000319A0;
  v5[4] = v4;
  objc_msgSend(v3, "startRequestWithCompletionHandler:", v5);
  return swift_continuation_await(v1);
}

uint64_t sub_10001C1DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 144) = v1;
  if (v1)
    v2 = sub_10001C270;
  else
    v2 = sub_10001C23C;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001C23C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120));
}

uint64_t sub_10001C270()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  swift_willThrow();

  swift_errorRelease(v2);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_10001C2BC(void *a1, uint64_t a2, unint64_t a3)
{
  __objc2_class_ro *v6;
  __objc2_prop_list *base_props;
  uint64_t v8;
  char *v9;
  id v10;
  __objc2_class_ro *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  __objc2_class_ro *v38;

  v6 = (__objc2_class_ro *)type metadata accessor for Logger(0);
  base_props = v6[-1].base_props;
  __chkstk_darwin(v6);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return 0;
  v10 = a1;
  v11 = &Family_MSMessagesAppViewController__metaData;
  v12 = objc_msgSend(v10, "members");
  v13 = sub_100007620(0, &qword_100034FC0, FAFamilyMember_ptr);
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

  if ((unint64_t)v14 >> 62)
  {
LABEL_24:
    if (v14 < 0)
      v29 = v14;
    else
      v29 = v14 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v14);
    v15 = _CocoaArrayWrapper.endIndex.getter(v29);
    swift_bridgeObjectRelease(v14);
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v14);
  if (!v15)
    goto LABEL_22;
  v16 = objc_msgSend(v10, *(SEL *)&v11[16].flags);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v13);

  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0)
      v30 = v13;
    else
      v30 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v13);
    v17 = _CocoaArrayWrapper.endIndex.getter(v30);
    if (v17)
      goto LABEL_7;
LABEL_32:
    v19 = swift_bridgeObjectRelease_n(v13, 2);
    goto LABEL_33;
  }
  v17 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v13);
  if (!v17)
    goto LABEL_32;
LABEL_7:
  v36 = a2;
  v37 = a3;
  v38 = v6;
  a3 = v13 & 0xC000000000000001;
  a2 = 4;
  v6 = &Family_MSMessagesAppViewController__metaData;
  while (1)
  {
    if (a3)
      v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2 - 4, v13);
    else
      v18 = *(id *)(v13 + 8 * a2);
    v14 = (uint64_t)v18;
    v11 = (__objc2_class_ro *)(a2 - 3);
    if (__OFADD__(a2 - 4, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (objc_msgSend(v18, "isOrganizer"))
      break;

    ++a2;
    if (v11 == (__objc2_class_ro *)v17)
    {
      v19 = swift_bridgeObjectRelease_n(v13, 2);
      v6 = v38;
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRelease_n(v13, 2);
  v21 = objc_msgSend((id)v14, "appleID");
  v6 = v38;
  if (!v21)
  {

    goto LABEL_33;
  }
  v23 = v21;
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);
  v26 = v25;

  v27 = v37;
  if (v24 == v36 && v26 == v37)
  {

    swift_bridgeObjectRelease(v27);
    return 0;
  }
  v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v26, v36, v37, 0);
  swift_bridgeObjectRelease(v26);

  if ((v28 & 1) != 0)
  {
LABEL_22:

    return 0;
  }
LABEL_33:
  v31 = static FamilyLogger.extension.getter(v19);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "orgranizerAppleID and senderHandle do not match, receiver is already in another family", v34, 2u);
    swift_slowDealloc(v34, -1, -1);
  }

  ((void (*)(char *, __objc2_class_ro *))base_props[1])(v9, v6);
  return 1;
}

unint64_t sub_10001C604(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100031140, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

void *sub_10001C64C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;

  v2 = type metadata accessor for Calendar.Component(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_1000070B8(&qword_100034FE0);
    v10 = static _SetStorage.allocate(capacity:)(v9);
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v31 = v9;
    v32 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v35 = v10 + 56;
    while (1)
    {
      v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      v14 = *(_QWORD *)(v10 + 40);
      v15 = sub_10001E9CC(&qword_100034FE8, (uint64_t)&protocol conformance descriptor for Calendar.Component);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      v17 = ~(-1 << *(_BYTE *)(v10 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v35 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(_QWORD *)(v10 + 48) + v18 * v13, v2);
          v22 = sub_10001E9CC(&qword_100034FF0, (uint64_t)&protocol conformance descriptor for Calendar.Component);
          v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          v24 = v3;
          v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            v3 = v24;
            v9 = v31;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v35 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v24;
        }
        while ((v20 & (1 << v18)) != 0);
        v9 = v31;
      }
      *(_QWORD *)(v35 + 8 * v19) = v21 | v20;
      result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v13, v8, v2);
      v27 = *(_QWORD *)(v10 + 16);
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        break;
      *(_QWORD *)(v10 + 16) = v29;
LABEL_4:
      v11 = v33 + 1;
      if (v33 + 1 == v9)
        return (void *)v10;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

BOOL sub_10001C8A4(uint64_t a1)
{
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t (*v33)(void);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;

  v2 = type metadata accessor for Logger(0);
  v62 = *(_QWORD *)(v2 - 8);
  v63 = v2;
  __chkstk_darwin(v2);
  v65 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = type metadata accessor for DateComponents(0);
  v4 = *(_QWORD *)(v55 - 8);
  v5 = __chkstk_darwin(v55);
  v54 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v53 - v7;
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v53 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v53 - v17;
  v19 = type metadata accessor for Calendar(0);
  v58 = *(_QWORD *)(v19 - 8);
  v59 = v19;
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.current.getter(v20);
  v23 = Calendar.startOfDay(for:)(a1);
  Date.init()(v23);
  Calendar.startOfDay(for:)(v13);
  v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v64 = v9;
  v56 = v24;
  v24(v13, v9);
  v25 = sub_1000070B8(&qword_100034FD8);
  v26 = type metadata accessor for Calendar.Component(0);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(unsigned __int8 *)(v27 + 80);
  v29 = (v28 + 32) & ~v28;
  v30 = swift_allocObject(v25, v29 + *(_QWORD *)(v27 + 72), v28 | 7);
  *(_OWORD *)(v30 + 16) = xmmword_100029ED0;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v27 + 104))(v30 + v29, enum case for Calendar.Component.day(_:), v26);
  v31 = sub_10001C64C(v30);
  swift_setDeallocating(v30);
  swift_arrayDestroy(v30 + v29, 1, v26);
  swift_deallocClassInstance(v30, 32, 7);
  v60 = v18;
  v61 = v16;
  Calendar.dateComponents(_:from:to:)(v31, v18, v16);
  v32 = swift_bridgeObjectRelease(v31);
  static FamilyLogger.common.getter(v32);
  v33 = *(uint64_t (**)(void))(v4 + 16);
  v34 = v54;
  v57 = v8;
  v35 = v55;
  v36 = v33();
  v37 = Logger.logObject.getter(v36);
  v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v39 = 134217984;
    v40 = ((uint64_t (*)(void))DateComponents.day.getter)();
    if ((v41 & 1) != 0)
      v42 = 0;
    else
      v42 = v40;
    v43 = *(void (**)(char *, uint64_t))(v4 + 8);
    v43(v34, v35);
    v66 = v42;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67);
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Invite date is %ld days old", v39, 0xCu);
    swift_slowDealloc(v39, -1, -1);
  }
  else
  {
    v43 = *(void (**)(char *, uint64_t))(v4 + 8);
    v43(v34, v35);
  }

  v44 = (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v65, v63);
  v45 = v57;
  v46 = DateComponents.day.getter(v44);
  v48 = v47;
  v43(v45, v35);
  v49 = v64;
  v50 = v56;
  v56(v61, v64);
  v50(v60, v49);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v22, v59);
  return (v48 & 1) == 0 && v46 > 89;
}

void sub_10001CC98(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  BOOL v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  char *v105;
  _QWORD *v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  id v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  void *v129;
  unint64_t v130;
  id v131;
  NSString v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  NSString v137;
  id v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  char v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  NSObject *v157;
  os_log_type_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  char *v164;
  Swift::String v165;
  void *v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  NSObject *v171;
  os_log_type_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  id v179;
  NSObject *v180;
  os_log_type_t v181;
  uint8_t *v182;
  uint64_t v183;
  id v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void (*v188)(char *, uint64_t);
  uint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  unint64_t v194;
  id v195;
  void *v196;
  uint64_t v197;
  uint64_t v198;
  __int128 v199;
  uint64_t v200;
  uint64_t v201;
  __objc2_class_ro *v202;
  id v203;
  void *v204;
  uint64_t v205;
  NSObject *v206;
  os_log_type_t v207;
  _BOOL4 v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void (*v212)(char *, uint64_t);
  uint64_t v213;
  unint64_t v214;
  uint64_t v215;
  unint64_t v216;
  char *v217;
  uint64_t v218;
  NSObject *v219;
  os_log_type_t v220;
  uint64_t v221;
  uint64_t v222;
  id v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  id v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  char v237;
  id v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  char v244;
  id v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  char v253;
  id v254;
  uint64_t v255;
  void *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  char v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  unint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  char *v273;
  uint64_t v274;
  char *v275;
  uint64_t v276;
  uint64_t v277;
  char *v278;
  char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  char *v285;
  _QWORD *v286;
  id v287;
  void *v288;
  __int128 v289;
  unint64_t v290;
  char *v291;
  char *v292;
  unint64_t v293;
  void *v294;
  char *v295;
  uint64_t v296;
  _QWORD *v297;
  uint64_t v298;
  uint64_t v299;

  v297 = a1;
  v3 = sub_1000070B8(&qword_1000347F0);
  __chkstk_darwin(v3);
  v281 = (uint64_t)&v265 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v282 = type metadata accessor for Date(0);
  v5 = *(id *)(v282 - 8);
  __chkstk_darwin(v282);
  v279 = (char *)&v265 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v280 = type metadata accessor for InviteMessageDetails(0);
  v7 = __chkstk_darwin(v280);
  v9 = (char *)&v265 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v274 = (uint64_t)&v265 - v11;
  v12 = __chkstk_darwin(v10);
  v272 = (uint64_t)&v265 - v13;
  v14 = __chkstk_darwin(v12);
  v16 = (uint64_t)&v265 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (uint64_t)&v265 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v265 - v20;
  v296 = type metadata accessor for Logger(0);
  v283 = *(_QWORD *)(v296 - 8);
  v22 = __chkstk_darwin(v296);
  v291 = (char *)&v265 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v265 - v25;
  v27 = __chkstk_darwin(v24);
  v29 = (char *)&v265 - v28;
  v30 = __chkstk_darwin(v27);
  v275 = (char *)&v265 - v31;
  v32 = __chkstk_darwin(v30);
  v273 = (char *)&v265 - v33;
  v34 = __chkstk_darwin(v32);
  v36 = (uint64_t)&v265 - v35;
  v37 = __chkstk_darwin(v34);
  v38 = (id)__chkstk_darwin(v37);
  v287 = v5;
  v41 = v9;
  v292 = v9;
  v294 = a2;
  v295 = v26;
  if (!a2)
    goto LABEL_124;
  v285 = (char *)&v265 - v39;
  v286 = v21;
  v288 = (void *)v40;
  v278 = v29;
  v42 = objc_msgSend(a2, "members");
  v290 = sub_100007620(0, &qword_100034FC0, FAFamilyMember_ptr);
  v43 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v42, v290);

  if ((sub_10001C2BC(a2, v297[32], v297[33]) & 1) == 0)
  {
    if ((unint64_t)v43 >> 62)
      goto LABEL_79;
    v44 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (v44)
    {
      v45 = 0;
      v46 = v43 & 0xC000000000000001;
      v271 = v43 & 0xFFFFFFFFFFFFFF8;
      v270 = v43 + 32;
      v266 = v16;
      v276 = v19;
      v269 = v36;
      v284 = v43;
      v268 = v44;
      v267 = v43 & 0xC000000000000001;
      while (1)
      {
        if (v46)
        {
          v47 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v45, v43);
        }
        else
        {
          if (v45 >= *(_QWORD *)(v271 + 16))
          {
            __break(1u);
LABEL_183:

            __break(1u);
            return;
          }
          v47 = (char *)*(id *)(v270 + 8 * v45);
        }
        v26 = v47;
        v48 = __OFADD__(v45, 1);
        v49 = v45 + 1;
        if (v48)
          goto LABEL_118;
        v50 = objc_msgSend(v47, "appleID");
        if (v50)
        {
          v52 = v50;
          v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50, v51);
          v55 = v54;

          v56 = v297[30];
          v57 = v297[31];
          if (v53 == v56 && v55 == v57)
          {
            swift_bridgeObjectRelease(v43);
LABEL_73:
            v104 = swift_bridgeObjectRelease(v55);
            v105 = v285;
            static FamilyLogger.extension.getter(v104);
            v106 = v286;
            v107 = sub_10001E94C((uint64_t)v297, (uint64_t)v286);
            v108 = Logger.logObject.getter(v107);
            v109 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v108, v109))
            {
              v110 = (uint8_t *)swift_slowAlloc(12, -1);
              v111 = swift_slowAlloc(32, -1);
              v299 = v111;
              *(_DWORD *)v110 = 136315138;
              v297 = v110 + 4;
              v112 = v106[30];
              v113 = v106[31];
              swift_bridgeObjectRetain(v113);
              v298 = sub_100026DB4(v112, v113, &v299);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);
              swift_bridgeObjectRelease(v113);
              sub_10001E990((uint64_t)v106);
              _os_log_impl((void *)&_mh_execute_header, v108, v109, "contact handle %s mapped to family member Apple Account", v110, 0xCu);
              swift_arrayDestroy(v111, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v111, -1, -1);
              swift_slowDealloc(v110, -1, -1);
            }
            else
            {
              sub_10001E990((uint64_t)v106);
            }

            (*(void (**)(char *, uint64_t))(v283 + 8))(v105, v296);
            return;
          }
          v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v53, v55, v56, v57, 0);
          swift_bridgeObjectRelease(v55);
          if ((v16 & 1) != 0)
          {
            v55 = v43;
            goto LABEL_73;
          }
        }
        v59 = objc_msgSend(v26, "contact");
        if (v59)
        {
          v60 = v59;
          v16 = (uint64_t)objc_msgSend(v59, "phoneNumbers");

          v61 = sub_1000070B8(&qword_100034FD0);
          v62 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v61);

        }
        else
        {
          v62 = (uint64_t)&_swiftEmptyArrayStorage;
        }
        *(_QWORD *)&v289 = v26;
        v277 = v49;
        if ((unint64_t)v62 >> 62)
          break;
        v36 = *(_QWORD *)((v62 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v36)
          goto LABEL_22;
LABEL_33:
        swift_bridgeObjectRelease(v62);
        v70 = objc_msgSend((id)v289, "contact");
        if (v70)
        {
          v71 = v70;
          v43 = (uint64_t)objc_msgSend(v70, "emailAddresses");

          v72 = sub_1000070B8(&qword_100034FD0);
          v73 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v43, v72);

          if ((unint64_t)v73 >> 62)
            goto LABEL_50;
        }
        else
        {
          v73 = (uint64_t)&_swiftEmptyArrayStorage;
          if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
          {
LABEL_50:
            if (v73 < 0)
              v43 = v73;
            else
              v43 = v73 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(v73);
            v19 = _CocoaArrayWrapper.endIndex.getter(v43);
            swift_bridgeObjectRelease(v73);
            if (v19)
            {
LABEL_36:
              v26 = (char *)v297[30];
              a2 = (void *)v297[31];
              v293 = v73 & 0xC000000000000001;
              v36 = 4;
              while (1)
              {
                if (v293)
                  v74 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v36 - 4, v73);
                else
                  v74 = *(id *)(v73 + 8 * v36);
                v5 = v74;
                v41 = (char *)(v36 - 3);
                if (__OFADD__(v36 - 4, 1))
                  goto LABEL_78;
                v75 = objc_msgSend(v74, "value");
                v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v75, v76);
                v78 = v77;

                if ((char *)v16 == v26 && v78 == a2)
                  break;
                v43 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v78, v26, a2, 0);
                swift_bridgeObjectRelease(v78);
                if ((v43 & 1) != 0)
                {
                  a2 = (void *)v73;
                  v93 = (void *)v289;
                  v92 = v284;
LABEL_68:
                  swift_bridgeObjectRelease(v92);
                  v94 = swift_bridgeObjectRelease(a2);
                  v95 = v269;
                  static FamilyLogger.extension.getter(v94);
                  v96 = v266;
                  v97 = sub_10001E94C((uint64_t)v297, v266);
                  v98 = Logger.logObject.getter(v97);
                  v99 = static os_log_type_t.default.getter();
                  if (os_log_type_enabled(v98, v99))
                  {
                    v100 = (uint8_t *)swift_slowAlloc(12, -1);
                    v101 = swift_slowAlloc(32, -1);
                    v299 = v101;
                    *(_DWORD *)v100 = 136315138;
                    v102 = *(_QWORD *)(v96 + 240);
                    v103 = *(_QWORD *)(v96 + 248);
                    swift_bridgeObjectRetain(v103);
                    v298 = sub_100026DB4(v102, v103, &v299);
                    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);
                    swift_bridgeObjectRelease(v103);
                    sub_10001E990(v96);
                    _os_log_impl((void *)&_mh_execute_header, v98, v99, "contact handle %s mapped to family member email address", v100, 0xCu);
                    swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
                    swift_slowDealloc(v101, -1, -1);
                    swift_slowDealloc(v100, -1, -1);

                    (*(void (**)(uint64_t, uint64_t))(v283 + 8))(v269, v296);
                  }
                  else
                  {

                    sub_10001E990(v96);
                    (*(void (**)(uint64_t, uint64_t))(v283 + 8))(v95, v296);
                  }
                  return;
                }

                ++v36;
                if (v41 == (char *)v19)
                  goto LABEL_47;
              }
              swift_bridgeObjectRelease(v284);
              v92 = v73;
              v93 = (void *)v289;
              goto LABEL_68;
            }
            goto LABEL_47;
          }
        }
        v19 = *(_QWORD *)((v73 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v19)
          goto LABEL_36;
LABEL_47:

        swift_bridgeObjectRelease(v73);
        v45 = v277;
        v5 = v287;
        v41 = v292;
        a2 = v294;
        v26 = v295;
        v43 = v284;
        v46 = v267;
        if (v277 == v268)
          goto LABEL_83;
      }
      if (v62 < 0)
        v16 = v62;
      else
        v16 = v62 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v62);
      v36 = _CocoaArrayWrapper.endIndex.getter(v16);
      swift_bridgeObjectRelease(v62);
      if (!v36)
        goto LABEL_33;
LABEL_22:
      v26 = (char *)v297[30];
      a2 = (void *)v297[31];
      v293 = v62 & 0xC000000000000001;
      v19 = 4;
      while (1)
      {
        v63 = v293
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v19 - 4, v62)
            : *(id *)(v62 + 8 * v19);
        v5 = v63;
        v41 = (char *)(v19 - 3);
        if (__OFADD__(v19 - 4, 1))
          break;
        v64 = objc_msgSend(v63, "value");
        v65 = objc_msgSend(v64, "stringValue");

        v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v65, v66);
        v68 = v67;

        if ((char *)v16 == v26 && v68 == a2)
        {
          swift_bridgeObjectRelease(v284);
          v80 = v62;
          v81 = (void *)v289;
LABEL_62:
          swift_bridgeObjectRelease(v80);
          v82 = swift_bridgeObjectRelease(a2);
          v83 = (unint64_t)v288;
          static FamilyLogger.extension.getter(v82);
          v84 = v276;
          v85 = sub_10001E94C((uint64_t)v297, v276);
          v86 = Logger.logObject.getter(v85);
          v87 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v86, v87))
          {
            v88 = (uint8_t *)swift_slowAlloc(12, -1);
            v89 = swift_slowAlloc(32, -1);
            v299 = v89;
            *(_DWORD *)v88 = 136315138;
            v297 = v88 + 4;
            v90 = *(_QWORD *)(v84 + 240);
            v91 = *(_QWORD *)(v84 + 248);
            swift_bridgeObjectRetain(v91);
            v298 = sub_100026DB4(v90, v91, &v299);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);
            swift_bridgeObjectRelease(v91);
            sub_10001E990(v84);
            _os_log_impl((void *)&_mh_execute_header, v86, v87, "contact handle %s mapped to family member phone number", v88, 0xCu);
            swift_arrayDestroy(v89, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v89, -1, -1);
            swift_slowDealloc(v88, -1, -1);

          }
          else
          {

            sub_10001E990(v84);
          }
          (*(void (**)(unint64_t, uint64_t))(v283 + 8))(v83, v296);
          return;
        }
        v43 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v68, v26, a2, 0);
        swift_bridgeObjectRelease(v68);
        if ((v43 & 1) != 0)
        {
          a2 = (void *)v62;
          v81 = (void *)v289;
          v80 = v284;
          goto LABEL_62;
        }

        ++v19;
        if (v41 == (char *)v36)
          goto LABEL_33;
      }
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      if (v43 < 0)
        v114 = v43;
      else
        v114 = v43 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v43);
      v44 = _CocoaArrayWrapper.endIndex.getter(v114);
      swift_bridgeObjectRelease(v43);
    }
  }
LABEL_83:
  swift_bridgeObjectRelease(v43);
  v38 = objc_msgSend(a2, "pendingMembersWithAllStatues");
  v29 = v278;
  if (!v38)
  {
LABEL_124:
    static FamilyLogger.extension.getter(v38);
    v179 = a2;
    v180 = Logger.logObject.getter(v179);
    v181 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v180, v181))
    {
      v182 = (uint8_t *)swift_slowAlloc(12, -1);
      v183 = swift_slowAlloc(32, -1);
      v299 = v183;
      *(_DWORD *)v182 = 136315138;
      if (a2 && (v184 = objc_msgSend(v179, "invites")) != 0)
      {
        v185 = v184;
        v186 = sub_100007620(0, &qword_100034FC8, FAFamilyInvite_ptr);
        v187 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v185, v186);

      }
      else
      {
        v187 = &_swiftEmptyArrayStorage;
      }
      v191 = sub_100007620(0, &qword_100034FC8, FAFamilyInvite_ptr);
      v192 = Array.description.getter(v187, v191);
      v194 = v193;
      swift_bridgeObjectRelease(v187);
      v298 = sub_100026DB4(v192, v194, &v299);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);

      swift_bridgeObjectRelease(v194);
      _os_log_impl((void *)&_mh_execute_header, v180, v181, "invites %s", v182, 0xCu);
      swift_arrayDestroy(v183, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v183, -1, -1);
      swift_slowDealloc(v182, -1, -1);

      v188 = *(void (**)(char *, uint64_t))(v283 + 8);
      v188(v29, v296);
      v5 = v287;
      v189 = (uint64_t)v292;
      v26 = v295;
      v190 = v291;
      if (!v294)
        goto LABEL_179;
    }
    else
    {

      v188 = *(void (**)(char *, uint64_t))(v283 + 8);
      v188(v29, v296);
      v189 = (uint64_t)v41;
      v190 = v291;
      if (!a2)
        goto LABEL_179;
    }
    v195 = objc_msgSend(v179, "invites");
    if (v195)
    {
      v196 = v195;
      v197 = sub_100007620(0, &qword_100034FC8, FAFamilyInvite_ptr);
      v198 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v196, v197);

      if ((unint64_t)v198 >> 62)
        goto LABEL_174;
      v200 = *(_QWORD *)((v198 & 0xFFFFFFFFFFFFF8) + 0x10);
      while (v200)
      {
        v290 = v198 & 0xC000000000000001;
        v201 = 4;
        *(_QWORD *)&v199 = 136315138;
        v289 = v199;
        v286 = (_QWORD *)((char *)&type metadata for Any + 8);
        v202 = &Family_MSMessagesAppViewController__metaData;
        v288 = (void *)v200;
        while (1)
        {
          v203 = v290
               ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v201 - 4, v198)
               : *(id *)(v198 + 8 * v201);
          v204 = v203;
          if (__OFADD__(v201 - 4, 1))
            break;
          v293 = v201 - 3;
          static FamilyLogger.extension.getter(v203);
          v205 = sub_10001E94C((uint64_t)v297, v189);
          v206 = Logger.logObject.getter(v205);
          v207 = static os_log_type_t.default.getter();
          v208 = os_log_type_enabled(v206, v207);
          v294 = (void *)v201;
          if (v208)
          {
            v209 = swift_slowAlloc(12, -1);
            v210 = swift_slowAlloc(32, -1);
            v299 = v210;
            *(_DWORD *)v209 = v289;
            v211 = v198;
            v212 = v188;
            v213 = *(_QWORD *)(v189 + 96);
            v214 = *(_QWORD *)(v189 + 104);
            swift_bridgeObjectRetain(v214);
            v215 = v213;
            v188 = v212;
            v198 = v211;
            v202 = &Family_MSMessagesAppViewController__metaData;
            *(_QWORD *)(v209 + 4) = sub_100026DB4(v215, v214, &v299);
            v216 = v214;
            v190 = v291;
            swift_bridgeObjectRelease(v216);
            sub_10001E990(v189);
            _os_log_impl((void *)&_mh_execute_header, v206, v207, "Invite code from message url %s", (uint8_t *)v209, 0xCu);
            swift_arrayDestroy(v210, 1, v286);
            swift_slowDealloc(v210, -1, -1);
            swift_slowDealloc(v209, -1, -1);

            v217 = v295;
          }
          else
          {
            sub_10001E990(v189);

            v217 = v26;
          }
          v218 = ((uint64_t (*)(char *, uint64_t))v188)(v217, v296);
          static FamilyLogger.extension.getter(v218);
          v5 = v204;
          v219 = Logger.logObject.getter(v5);
          v220 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v219, v220))
          {
            v221 = swift_slowAlloc(12, -1);
            v222 = swift_slowAlloc(32, -1);
            v299 = v222;
            *(_DWORD *)v221 = v289;
            v223 = objc_msgSend(v5, "code");
            if (!v223)
              goto LABEL_183;
            v225 = v223;
            v226 = static String._unconditionallyBridgeFromObjectiveC(_:)(v223, v224);
            v228 = v227;

            *(_QWORD *)(v221 + 4) = sub_100026DB4(v226, v228, &v299);
            swift_bridgeObjectRelease(v228);
            _os_log_impl((void *)&_mh_execute_header, v219, v220, "Invite code from family circle %s", (uint8_t *)v221, 0xCu);
            swift_arrayDestroy(v222, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v222, -1, -1);
            swift_slowDealloc(v221, -1, -1);

            v190 = v291;
            v188(v291, v296);
            v189 = (uint64_t)v292;
            v202 = &Family_MSMessagesAppViewController__metaData;
          }
          else
          {

            v188(v190, v296);
          }
          v229 = objc_msgSend(v5, (SEL)v202[16].base_meths);
          v26 = v295;
          if (v229)
          {
            v231 = v229;
            v232 = static String._unconditionallyBridgeFromObjectiveC(_:)(v229, v230);
            v234 = v233;

            v235 = v297[32];
            v236 = v297[33];
            if (v232 == v235 && v234 == v236)
            {
              swift_bridgeObjectRelease(v234);
            }
            else
            {
              v237 = _stringCompareWithSmolCheck(_:_:expecting:)(v232, v234, v235, v236, 0);
              swift_bridgeObjectRelease(v234);
              if ((v237 & 1) == 0)
                goto LABEL_160;
            }
            v238 = objc_msgSend(v5, "inviteStatus");
            if (!v238
              || (v240 = v238,
                  v241 = static String._unconditionallyBridgeFromObjectiveC(_:)(v238, v239),
                  v243 = v242,
                  v240,
                  !v243))
            {
LABEL_171:

              swift_bridgeObjectRelease(v198);
              return;
            }
            if (v241 == 0x64656E696C636544 && v243 == 0xE800000000000000)
            {
              swift_bridgeObjectRelease(0xE800000000000000);
            }
            else
            {
              v244 = _stringCompareWithSmolCheck(_:_:expecting:)(v241, v243, 0x64656E696C636544, 0xE800000000000000, 0);
              swift_bridgeObjectRelease(v243);
              if ((v244 & 1) == 0)
                goto LABEL_171;
            }
          }
LABEL_160:
          v245 = objc_msgSend(v5, (SEL)v202[16].base_meths);
          if (!v245)
            goto LABEL_136;
          v247 = v245;
          v248 = static String._unconditionallyBridgeFromObjectiveC(_:)(v245, v246);
          v250 = v249;

          v251 = v297[32];
          v252 = v297[33];
          if (v248 == v251 && v250 == v252)
          {
            swift_bridgeObjectRelease(v250);
          }
          else
          {
            v253 = _stringCompareWithSmolCheck(_:_:expecting:)(v248, v250, v251, v252, 0);
            swift_bridgeObjectRelease(v250);
            if ((v253 & 1) == 0)
              goto LABEL_136;
          }
          v254 = objc_msgSend(v5, "inviteStatus");
          if (!v254
            || (v256 = v254,
                v257 = static String._unconditionallyBridgeFromObjectiveC(_:)(v254, v255),
                v259 = v258,
                v256,
                !v259))
          {
LABEL_136:

            goto LABEL_137;
          }
          if (v257 == 0x64656E696C636544 && v259 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease(v198);
            swift_bridgeObjectRelease(0xE800000000000000);

            return;
          }
          v260 = _stringCompareWithSmolCheck(_:_:expecting:)(v257, v259, 0x64656E696C636544, 0xE800000000000000, 0);
          swift_bridgeObjectRelease(v259);

          if ((v260 & 1) != 0)
          {
            swift_bridgeObjectRelease(v198);
            return;
          }
LABEL_137:
          v201 = (uint64_t)v294 + 1;
          if ((void *)v293 == v288)
            goto LABEL_178;
        }
        __break(1u);
LABEL_174:
        if (v198 < 0)
          v261 = v198;
        else
          v261 = v198 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v198);
        v200 = _CocoaArrayWrapper.endIndex.getter(v261);
        swift_bridgeObjectRelease(v198);
      }
LABEL_178:
      swift_bridgeObjectRelease(v198);
      v5 = v287;
    }
LABEL_179:
    v262 = v281;
    sub_10001E8C4((uint64_t)v297 + *(int *)(v280 + 104), v281);
    v263 = v282;
    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v5 + 6))(v262, 1, v282) == 1)
    {
      sub_10001E90C(v262);
    }
    else
    {
      v264 = (uint64_t)v279;
      (*((void (**)(char *, uint64_t, uint64_t))v5 + 4))(v279, v262, v263);
      sub_10001C8A4(v264);
      (*((void (**)(uint64_t, uint64_t))v5 + 1))(v264, v263);
    }
    return;
  }
  v115 = v38;
  v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v38, v290);

  if ((unint64_t)v36 >> 62)
    goto LABEL_119;
  v116 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v116)
  {
LABEL_123:
    v38 = (id)swift_bridgeObjectRelease(v36);
    v29 = v278;
    goto LABEL_124;
  }
LABEL_86:
  v293 = v36 & 0xC000000000000001;
  v117 = 4;
  v277 = v36;
  v290 = v116;
  while (1)
  {
    if (v293)
      v118 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v117 - 4, v36);
    else
      v118 = *(id *)(v36 + 8 * v117);
    v119 = v118;
    v120 = v117 - 3;
    if (__OFADD__(v117 - 4, 1))
    {
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      if (v36 < 0)
        v178 = v36;
      else
        v178 = v36 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v36);
      v116 = _CocoaArrayWrapper.endIndex.getter(v178);
      swift_bridgeObjectRelease(v36);
      if (!v116)
        goto LABEL_123;
      goto LABEL_86;
    }
    v121 = objc_msgSend(v118, "inviteEmail");
    if (v121)
      break;
LABEL_88:

    ++v117;
    if (v120 == v290)
      goto LABEL_123;
  }
  v123 = v121;
  v124 = static String._unconditionallyBridgeFromObjectiveC(_:)(v121, v122);
  v126 = v125;

  v127 = objc_msgSend(v119, "statusString");
  if (!v127)
  {
    swift_bridgeObjectRelease(v126);
    v41 = v292;
    a2 = v294;
    goto LABEL_88;
  }
  v129 = v127;
  v286 = v119;
  v276 = static String._unconditionallyBridgeFromObjectiveC(_:)(v127, v128);
  v288 = (void *)v130;

  v131 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain(v126);
  v284 = v124;
  v132 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v126);
  v133 = (char *)objc_msgSend(v131, "initWithStringValue:", v132);

  v134 = v297[31];
  v135 = v297[30];
  v136 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain(v134);
  v137 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v134);
  *(_QWORD *)&v289 = objc_msgSend(v136, "initWithStringValue:", v137);

  v285 = v133;
  v138 = objc_msgSend(v133, "fullyQualifiedDigits");
  if (!v138)
  {
LABEL_102:
    if (v284 == v135 && v126 == v134)
    {
      v152 = swift_bridgeObjectRelease(v126);
LABEL_107:
      v153 = v275;
      static FamilyLogger.extension.getter(v152);
      v154 = v274;
      sub_10001E94C((uint64_t)v297, v274);
      v155 = v288;
      v156 = swift_bridgeObjectRetain_n(v288, 2);
      v157 = Logger.logObject.getter(v156);
      v158 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v157, v158))
      {
        v159 = swift_slowAlloc(22, -1);
        v160 = swift_slowAlloc(64, -1);
        v299 = v160;
        *(_DWORD *)v159 = 136315394;
        v161 = *(_QWORD *)(v154 + 240);
        v162 = *(_QWORD *)(v154 + 248);
        swift_bridgeObjectRetain(v162);
        v298 = sub_100026DB4(v161, v162, &v299);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);
        swift_bridgeObjectRelease(v162);
        sub_10001E990(v154);
        *(_WORD *)(v159 + 12) = 2080;
        swift_bridgeObjectRetain(v155);
        v163 = v276;
        v298 = sub_100026DB4(v276, (unint64_t)v155, &v299);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);
        swift_bridgeObjectRelease(v277);
        swift_bridgeObjectRelease_n(v155, 3);
        _os_log_impl((void *)&_mh_execute_header, v157, v158, "contact handle %s found in pending members with status %s", (uint8_t *)v159, 0x16u);
        swift_arrayDestroy(v160, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v160, -1, -1);
        swift_slowDealloc(v159, -1, -1);

        (*(void (**)(char *, uint64_t))(v283 + 8))(v153, v296);
      }
      else
      {
        swift_bridgeObjectRelease_n(v155, 2);

        sub_10001E990(v154);
        (*(void (**)(char *, uint64_t))(v283 + 8))(v153, v296);
        swift_bridgeObjectRelease(v277);
        v163 = v276;
      }
      v164 = v285;
      v165._countAndFlagsBits = v163;
      v165._object = v155;
      goto LABEL_116;
    }
    v151 = _stringCompareWithSmolCheck(_:_:expecting:)(v284, v126, v135, v134, 0);
    v152 = swift_bridgeObjectRelease(v126);
    if ((v151 & 1) != 0)
      goto LABEL_107;
    swift_bridgeObjectRelease(v288);

    v41 = v292;
    a2 = v294;
    v26 = v295;
    v119 = v286;
    v36 = v277;
    goto LABEL_88;
  }
  v140 = v138;
  v141 = static String._unconditionallyBridgeFromObjectiveC(_:)(v138, v139);
  v143 = v142;

  v144 = objc_msgSend((id)v289, "fullyQualifiedDigits");
  if (!v144)
  {
    swift_bridgeObjectRelease(v143);
    v5 = v287;
    goto LABEL_102;
  }
  v146 = v144;
  v147 = static String._unconditionallyBridgeFromObjectiveC(_:)(v144, v145);
  v149 = v148;

  if (v141 != v147 || v143 != v149)
  {
    v150 = _stringCompareWithSmolCheck(_:_:expecting:)(v141, v143, v147, v149, 0);
    swift_bridgeObjectRelease(v149);
    swift_bridgeObjectRelease(v143);
    v5 = v287;
    if ((v150 & 1) != 0)
    {
      v143 = v126;
      goto LABEL_112;
    }
    goto LABEL_102;
  }
  swift_bridgeObjectRelease(v126);
  swift_bridgeObjectRelease(v143);
LABEL_112:
  v166 = v288;
  v167 = swift_bridgeObjectRelease(v143);
  v168 = v273;
  static FamilyLogger.extension.getter(v167);
  v169 = v272;
  sub_10001E94C((uint64_t)v297, v272);
  v170 = swift_bridgeObjectRetain_n(v166, 2);
  v171 = Logger.logObject.getter(v170);
  v172 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v171, v172))
  {
    v173 = swift_slowAlloc(22, -1);
    v174 = swift_slowAlloc(64, -1);
    v299 = v174;
    *(_DWORD *)v173 = 136315394;
    v175 = *(_QWORD *)(v169 + 240);
    v176 = *(_QWORD *)(v169 + 248);
    swift_bridgeObjectRetain(v176);
    v298 = sub_100026DB4(v175, v176, &v299);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);
    swift_bridgeObjectRelease(v176);
    sub_10001E990(v169);
    *(_WORD *)(v173 + 12) = 2080;
    swift_bridgeObjectRetain(v288);
    v177 = v276;
    v298 = sub_100026DB4(v276, (unint64_t)v288, &v299);
    v166 = v288;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, &v299);
    swift_bridgeObjectRelease(v277);
    swift_bridgeObjectRelease_n(v166, 3);
    _os_log_impl((void *)&_mh_execute_header, v171, v172, "contact handle %s found in pending members with status %s", (uint8_t *)v173, 0x16u);
    swift_arrayDestroy(v174, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v174, -1, -1);
    swift_slowDealloc(v173, -1, -1);

    (*(void (**)(char *, uint64_t))(v283 + 8))(v168, v296);
  }
  else
  {
    swift_bridgeObjectRelease_n(v166, 2);

    sub_10001E990(v169);
    (*(void (**)(char *, uint64_t))(v283 + 8))(v168, v296);
    swift_bridgeObjectRelease(v277);
    v177 = v276;
  }
  v164 = v285;
  v165._countAndFlagsBits = v177;
  v165._object = v166;
LABEL_116:
  sub_10001C604(v165);

}

uint64_t sub_10001E8C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000070B8(&qword_1000347F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E90C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000070B8(&qword_1000347F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001E94C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InviteMessageDetails(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E990(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for InviteMessageDetails(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001E9CC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Calendar.Component(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for FamilyInviteStatus(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FamilyInviteStatus(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FamilyInviteStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001EAF4 + 4 * byte_10002A5B5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10001EB28 + 4 * byte_10002A5B0[v4]))();
}

uint64_t sub_10001EB28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001EB30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001EB38);
  return result;
}

uint64_t sub_10001EB44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001EB4CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10001EB50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001EB58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001EB64(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10001EB6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FamilyInviteStatus()
{
  return &type metadata for FamilyInviteStatus;
}

unint64_t sub_10001EB88()
{
  unint64_t result;

  result = qword_100035000;
  if (!qword_100035000)
  {
    result = swift_getWitnessTable(&unk_10002A6AC, &type metadata for FamilyInviteStatus);
    atomic_store(result, (unint64_t *)&qword_100035000);
  }
  return result;
}

uint64_t sub_10001EBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[33] = a3;
  v4[34] = a4;
  v4[31] = a1;
  v4[32] = a2;
  v5 = type metadata accessor for Logger(0);
  v4[35] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[36] = v6;
  v4[37] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001EC30, 0, 0);
}

uint64_t sub_10001EC30()
{
  _QWORD *v0;
  id v1;
  id v2;
  NSURL *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t inited;
  unint64_t v14;
  Class isa;
  _QWORD *v16;
  uint64_t v17;
  NSString v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = objc_msgSend(objc_allocWithZone((Class)FACircleContext), "initWithEventType:", FACircleEventTypeAcceptInvitationFromMessages);
  v0[38] = v1;
  v2 = objc_allocWithZone((Class)NSURLComponents);
  URL._bridgeToObjectiveC()(v3);
  v5 = v4;
  v6 = objc_msgSend(v2, "initWithURL:resolvingAgainstBaseURL:", v4, 1);

  if (v6)
  {
    v8 = v0[33];
    v7 = v0[34];
    v9 = objc_msgSend(v6, "fa_queryItemsDictionary");
    v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain(v7);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
    sub_10001BFB8(v8, v7, 0xD000000000000013, 0x800000010002B1E0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(0x8000000000000000);
    v12 = sub_1000070B8(&qword_100034840);
    inited = swift_initStackObject(v12, v0 + 10);
    *(_OWORD *)(inited + 16) = xmmword_100029ED0;
    *(_QWORD *)(inited + 32) = 0xD000000000000011;
    *(_QWORD *)(inited + 40) = 0x800000010002B200;
    *(_QWORD *)(inited + 72) = sub_1000070B8(&qword_100035010);
    *(_QWORD *)(inited + 48) = v10;
    v14 = sub_100020F94(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v14);
    objc_msgSend(v1, "setAdditionalParameters:", isa);

  }
  v16 = v0 + 2;
  v17 = v0[32];
  v18 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "setClientName:", v18);

  v19 = objc_msgSend(objc_allocWithZone((Class)FACircleStateController), "initWithPresenter:", v17);
  v0[39] = v19;
  v0[7] = v0 + 28;
  v0[2] = v0;
  v0[3] = sub_10001EEEC;
  v20 = swift_continuation_init(v0 + 2, 0);
  v0[20] = _NSConcreteStackBlock;
  v21 = v0 + 20;
  v21[1] = 0x40000000;
  v21[2] = sub_10001BF58;
  v21[3] = &unk_100031A48;
  v21[4] = v20;
  objc_msgSend(v19, "performWithContext:completion:", v1, v21);
  return swift_continuation_await(v16);
}

uint64_t sub_10001EEEC()
{
  return swift_task_switch(sub_10001EF38, 0, 0);
}

uint64_t sub_10001EF38()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(void **)(v0 + 224);
  v2 = objc_msgSend(v1, "error");
  if (v2)
  {
    v3 = v2;
    static FamilyLogger.extension.getter(v2);
    v4 = v3;
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.error.getter();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(void **)(v0 + 304);
    v10 = *(_QWORD *)(v0 + 288);
    v9 = *(_QWORD *)(v0 + 296);
    v11 = *(_QWORD *)(v0 + 280);
    if (v7)
    {
      v21 = *(_QWORD *)(v0 + 288);
      v22 = *(_QWORD *)(v0 + 296);
      v19 = *(void **)(v0 + 312);
      v20 = *(_QWORD *)(v0 + 280);
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v23 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue(v4, v0 + 240, v0 + 200);
      v14 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216));
      v16 = v15;
      *(_QWORD *)(v0 + 232) = sub_100026DB4(v14, v15, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240);
      swift_bridgeObjectRelease(v16);

      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Error loading stateController: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v20);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
  }
  else
  {
    v17 = *(void **)(v0 + 304);

  }
  swift_task_dealloc(*(_QWORD *)(v0 + 296));
  return (*(uint64_t (**)(void *))(v0 + 8))(v1);
}

uint64_t sub_10001F168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4[39] = a3;
  v4[40] = a4;
  v4[37] = a1;
  v4[38] = a2;
  v5 = type metadata accessor for URL(0);
  v4[41] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[42] = v6;
  v4[43] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  v4[44] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[45] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[46] = swift_task_alloc(v9);
  v4[47] = swift_task_alloc(v9);
  return swift_task_switch(sub_10001F204, 0, 0);
}

uint64_t sub_10001F204(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v1[42];
  v2 = v1[43];
  v4 = v1[41];
  v5 = v1[37];
  static FamilyLogger.extension.getter(a1);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = v1[43];
    v32 = v1[44];
    v33 = v1[47];
    v29 = v1[42];
    v30 = v1[41];
    v31 = v1[45];
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v34 = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = URL.absoluteString.getter();
    v14 = v13;
    v1[36] = sub_100026DB4(v12, v13, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 36, v1 + 37);
    swift_bridgeObjectRelease(v14);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v9, v30);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Loading url for updateFamilyStatus %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    v15 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v15(v33, v32);
  }
  else
  {
    v16 = v1[47];
    v17 = v1[44];
    v18 = v1[45];
    (*(void (**)(_QWORD, _QWORD))(v1[42] + 8))(v1[43], v1[41]);

    v15 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v15(v16, v17);
  }
  v1[48] = v15;
  v19 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v20 = objc_msgSend(v19, "bundleIdentifier");

  if (v20)
  {
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);
    v24 = v23;

  }
  else
  {
    v24 = 0x800000010002B220;
    v22 = 0xD00000000000002DLL;
  }
  v1[49] = v22;
  v1[50] = v24;
  v1[51] = objc_opt_self(MFMessageComposeViewController);
  v25 = type metadata accessor for MainActor(0);
  v1[52] = static MainActor.shared.getter(v25);
  v26 = dispatch thunk of Actor.unownedExecutor.getter(v25, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001F4A4, v26, v27);
}

uint64_t sub_10001F4A4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 408);
  swift_release(*(_QWORD *)(v0 + 416));
  *(_BYTE *)(v0 + 441) = objc_msgSend(v1, "canSendText");
  return swift_task_switch(sub_10001F4F4, 0, 0);
}

uint64_t sub_10001F4F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  NSString v15;
  Class isa;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(v0 + 392);
  v1 = *(_QWORD *)(v0 + 400);
  v3 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 320);
  if (*(_BYTE *)(v0 + 441))
    v5 = 49;
  else
    v5 = 48;
  v6 = sub_1000070B8(&qword_100035020);
  inited = swift_initStackObject(v6, v0 + 80);
  *(_OWORD *)(inited + 16) = xmmword_10002A5A0;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FAClientAppContextHeaderKey, v8);
  *(_QWORD *)(inited + 40) = v9;
  *(_QWORD *)(inited + 48) = 0x6E65726566657250;
  *(_QWORD *)(inited + 56) = 0xEB00000000736563;
  *(_QWORD *)(inited + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)(FAClientAppBundleIDHeaderKey, v9);
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = v2;
  *(_QWORD *)(inited + 88) = v1;
  *(_QWORD *)(inited + 96) = static String._unconditionallyBridgeFromObjectiveC(_:)(FAClientCanSendTextHeaderKey, v10);
  *(_QWORD *)(inited + 104) = v11;
  *(_QWORD *)(inited + 112) = v5;
  *(_QWORD *)(inited + 120) = 0xE100000000000000;
  v12 = sub_1000211D4(inited);
  v13 = sub_10001BB1C(v12);
  swift_bridgeObjectRelease(v12);
  v14 = objc_allocWithZone((Class)FAUpdateFamilyInviteStatusRequest);
  swift_bridgeObjectRetain(v3);
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  v17 = objc_msgSend(v14, "initWithInviteCode:inviteStatus:responseFormat:additionalRequestParameters:", v15, v4, 1, isa);
  *(_QWORD *)(v0 + 424) = v17;

  if (v17)
  {
    v18 = v0 + 16;
    *(_QWORD *)(v0 + 56) = v0 + 440;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_10001F73C;
    v19 = swift_continuation_init(v0 + 16, 1);
    *(_QWORD *)(v0 + 208) = _NSConcreteStackBlock;
    v20 = (_QWORD *)(v0 + 208);
    v20[1] = 0x40000000;
    v20[2] = sub_10001BED8;
    v20[3] = &unk_100031A60;
    v20[4] = v19;
    objc_msgSend(v17, "startRequestWithCompletionHandler:", v20);
    return swift_continuation_await(v18);
  }
  else
  {
    v22 = *(_QWORD *)(v0 + 368);
    v23 = *(_QWORD *)(v0 + 344);
    swift_task_dealloc(*(_QWORD *)(v0 + 376));
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  }
}

uint64_t sub_10001F73C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 432) = v1;
  if (v1)
    v2 = sub_10001F800;
  else
    v2 = sub_10001F79C;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001F79C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 424);

  v2 = *(unsigned __int8 *)(v0 + 440);
  v3 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 344);
  swift_task_dealloc(*(_QWORD *)(v0 + 376));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v2, 0);
}

uint64_t sub_10001F800(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;

  v3 = *(void **)(v1 + 424);
  v2 = *(_QWORD *)(v1 + 432);
  swift_willThrow(a1);

  static FamilyLogger.extension.getter(v4);
  swift_errorRetain(v2);
  v5 = swift_errorRetain(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v1 + 432);
    v22 = *(void **)(v1 + 424);
    v24 = *(_QWORD *)(v1 + 368);
    v25 = *(void (**)(uint64_t, uint64_t))(v1 + 384);
    v23 = *(_QWORD *)(v1 + 352);
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v26 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue(v8, v1 + 272, v1 + 248);
    v11 = Error.localizedDescription.getter(*(_QWORD *)(v1 + 256), *(_QWORD *)(v1 + 264));
    v13 = v12;
    *(_QWORD *)(v1 + 280) = sub_100026DB4(v11, v12, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 280, v1 + 288);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error updaing family invite status %s", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    v25(v24, v23);
  }
  else
  {
    v14 = *(_QWORD *)(v1 + 432);
    v15 = *(void (**)(uint64_t, uint64_t))(v1 + 384);
    v16 = *(_QWORD *)(v1 + 368);
    v17 = *(_QWORD *)(v1 + 352);

    swift_errorRelease(v14);
    swift_errorRelease(v14);

    v15(v16, v17);
  }
  v18 = *(_QWORD *)(v1 + 432);
  v19 = *(_QWORD *)(v1 + 368);
  v20 = *(_QWORD *)(v1 + 344);
  swift_task_dealloc(*(_QWORD *)(v1 + 376));
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v18, 1);
}

_OWORD *sub_10001FA28(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001FA38(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_QWORD *sub_10001FA40(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
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
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v30;
  uint64_t v31;
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
  void *__dst;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v18);
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v40 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v40;
    v39 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v39;
    v38 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v38;
    v9 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v9;
    v37 = a2[15];
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v37;
    v36 = a2[17];
    *(_QWORD *)(a1 + 128) = a2[16];
    *(_QWORD *)(a1 + 136) = v36;
    v35 = a2[19];
    *(_QWORD *)(a1 + 144) = a2[18];
    *(_QWORD *)(a1 + 152) = v35;
    v34 = a2[21];
    *(_QWORD *)(a1 + 160) = a2[20];
    *(_QWORD *)(a1 + 168) = v34;
    v33 = a2[23];
    *(_QWORD *)(a1 + 176) = a2[22];
    *(_QWORD *)(a1 + 184) = v33;
    v32 = a2[25];
    *(_QWORD *)(a1 + 192) = a2[24];
    *(_QWORD *)(a1 + 200) = v32;
    v31 = a2[27];
    *(_QWORD *)(a1 + 208) = a2[26];
    *(_QWORD *)(a1 + 216) = v31;
    v41 = a2[28];
    *(_QWORD *)(a1 + 224) = v41;
    *(_BYTE *)(a1 + 232) = *((_BYTE *)a2 + 232);
    *(_BYTE *)(a1 + 233) = *((_BYTE *)a2 + 233);
    *(_BYTE *)(a1 + 234) = *((_BYTE *)a2 + 234);
    v10 = a2[31];
    *(_QWORD *)(a1 + 240) = a2[30];
    *(_QWORD *)(a1 + 248) = v10;
    v11 = a2[33];
    v12 = a3[24];
    __dst = (void *)(a1 + v12);
    v30 = (char *)a2 + v12;
    *(_QWORD *)(a1 + 256) = a2[32];
    *(_QWORD *)(a1 + 264) = v11;
    v13 = type metadata accessor for URL(0);
    v14 = *(_QWORD *)(v13 - 8);
    v15 = v6;
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v40);
    swift_bridgeObjectRetain(v39);
    swift_bridgeObjectRetain(v38);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v37);
    swift_bridgeObjectRetain(v36);
    swift_bridgeObjectRetain(v35);
    swift_bridgeObjectRetain(v34);
    swift_bridgeObjectRetain(v33);
    swift_bridgeObjectRetain(v32);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRetain(v41);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    if (v16(v30, 1, v13))
    {
      v17 = sub_1000070B8(&qword_100034868);
      memcpy(__dst, v30, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v14 + 16))(__dst, v30, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
    }
    v19 = a3[25];
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    if (v16((char *)a2 + v19, 1, v13))
    {
      v22 = sub_1000070B8(&qword_100034868);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v21, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
    }
    v23 = a3[26];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    v26 = type metadata accessor for Date(0);
    v27 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      v28 = sub_1000070B8(&qword_1000347F0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    *((_BYTE *)v4 + a3[27]) = *((_BYTE *)a2 + a3[27]);
  }
  return v4;
}

uint64_t sub_10001FDAC(_QWORD *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(char *, uint64_t, uint64_t);
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[13]);
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(a1[19]);
  swift_bridgeObjectRelease(a1[21]);
  swift_bridgeObjectRelease(a1[23]);
  swift_bridgeObjectRelease(a1[25]);
  swift_bridgeObjectRelease(a1[27]);
  swift_bridgeObjectRelease(a1[28]);
  swift_bridgeObjectRelease(a1[31]);
  swift_bridgeObjectRelease(a1[33]);
  v4 = (char *)a1 + a2[24];
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  v8 = (char *)a1 + a2[25];
  if (!v7(v8, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v9 = (char *)a1 + a2[26];
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  return result;
}

uint64_t sub_10001FF20(uint64_t a1, uint64_t a2, int *a3)
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
  unsigned int (*v15)(const void *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const void *v28;
  uint64_t v29;
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
  void *__dst;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v38 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v38;
  v37 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v37;
  v36 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v36;
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  v35 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v35;
  v34 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v34;
  v33 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v33;
  v32 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v32;
  v31 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v31;
  v30 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v30;
  v29 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v29;
  v39 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 224) = v39;
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v9 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v9;
  v10 = *(_QWORD *)(a2 + 264);
  v11 = a3[24];
  __dst = (void *)(a1 + v11);
  v28 = (const void *)(a2 + v11);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v10;
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = v5;
  v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  if (v15(v28, 1, v12))
  {
    v16 = sub_1000070B8(&qword_100034868);
    memcpy(__dst, v28, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(__dst, v28, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
  }
  v17 = a3[25];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  if (v15((const void *)(a2 + v17), 1, v12))
  {
    v20 = sub_1000070B8(&qword_100034868);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v18, v19, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v18, 0, 1, v12);
  }
  v21 = a3[26];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  v24 = type metadata accessor for Date(0);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = sub_1000070B8(&qword_1000347F0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_100020260(uint64_t a1, uint64_t a2, int *a3)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(void *, uint64_t, uint64_t);
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(void *, uint64_t, uint64_t);
  int v61;
  int v62;
  uint64_t v63;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v12 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v18 = *(_QWORD *)(a2 + 104);
  v19 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v20 = *(_QWORD *)(a2 + 120);
  v21 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v22 = *(_QWORD *)(a2 + 136);
  v23 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v24 = *(_QWORD *)(a2 + 152);
  v25 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v26 = *(_QWORD *)(a2 + 168);
  v27 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  v28 = *(_QWORD *)(a2 + 184);
  v29 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v30 = *(_QWORD *)(a2 + 200);
  v31 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v32 = *(_QWORD *)(a2 + 216);
  v33 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  v34 = *(_QWORD *)(a2 + 224);
  v35 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  v36 = *(_QWORD *)(a2 + 248);
  v37 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 248) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  v38 = *(_QWORD *)(a2 + 264);
  v39 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 264) = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease(v39);
  v40 = a3[24];
  v41 = (void *)(a1 + v40);
  v42 = (void *)(a2 + v40);
  v43 = type metadata accessor for URL(0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v44 + 48);
  v46 = v45(v41, 1, v43);
  v47 = v45(v42, 1, v43);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(void *, void *, uint64_t))(v44 + 16))(v41, v42, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v47)
  {
    (*(void (**)(void *, uint64_t))(v44 + 8))(v41, v43);
LABEL_6:
    v48 = sub_1000070B8(&qword_100034868);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v44 + 24))(v41, v42, v43);
LABEL_7:
  v49 = a3[25];
  v50 = (void *)(a1 + v49);
  v51 = (void *)(a2 + v49);
  v52 = v45((void *)(a1 + v49), 1, v43);
  v53 = v45(v51, 1, v43);
  if (v52)
  {
    if (!v53)
    {
      (*(void (**)(void *, void *, uint64_t))(v44 + 16))(v50, v51, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v50, 0, 1, v43);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v53)
  {
    (*(void (**)(void *, uint64_t))(v44 + 8))(v50, v43);
LABEL_12:
    v54 = sub_1000070B8(&qword_100034868);
    memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v44 + 24))(v50, v51, v43);
LABEL_13:
  v55 = a3[26];
  v56 = (void *)(a1 + v55);
  v57 = (void *)(a2 + v55);
  v58 = type metadata accessor for Date(0);
  v59 = *(_QWORD *)(v58 - 8);
  v60 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v59 + 48);
  v61 = v60(v56, 1, v58);
  v62 = v60(v57, 1, v58);
  if (!v61)
  {
    if (!v62)
    {
      (*(void (**)(void *, void *, uint64_t))(v59 + 24))(v56, v57, v58);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v59 + 8))(v56, v58);
    goto LABEL_18;
  }
  if (v62)
  {
LABEL_18:
    v63 = sub_1000070B8(&qword_1000347F0);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v59 + 16))(v56, v57, v58);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
LABEL_19:
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_100020728(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(const void *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  v10 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v10;
  v11 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v11;
  v12 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v12;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  v13 = *(_OWORD *)(a2 + 256);
  v14 = a3[24];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v13;
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    v20 = sub_1000070B8(&qword_100034868);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v21 = a3[25];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    v24 = sub_1000070B8(&qword_100034868);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v22, v23, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  v25 = a3[26];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = type metadata accessor for Date(0);
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    v30 = sub_1000070B8(&qword_1000347F0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_100020944(uint64_t a1, uint64_t a2, int *a3)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(void *, uint64_t, uint64_t);
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(void *, uint64_t, uint64_t);
  int v60;
  int v61;
  uint64_t v62;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v16;
  swift_bridgeObjectRelease(v17);
  v18 = *(_QWORD *)(a2 + 104);
  v19 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v18;
  swift_bridgeObjectRelease(v19);
  v20 = *(_QWORD *)(a2 + 120);
  v21 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v20;
  swift_bridgeObjectRelease(v21);
  v22 = *(_QWORD *)(a2 + 136);
  v23 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v22;
  swift_bridgeObjectRelease(v23);
  v24 = *(_QWORD *)(a2 + 152);
  v25 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v24;
  swift_bridgeObjectRelease(v25);
  v26 = *(_QWORD *)(a2 + 168);
  v27 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v26;
  swift_bridgeObjectRelease(v27);
  v28 = *(_QWORD *)(a2 + 184);
  v29 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v28;
  swift_bridgeObjectRelease(v29);
  v30 = *(_QWORD *)(a2 + 200);
  v31 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v30;
  swift_bridgeObjectRelease(v31);
  v32 = *(_QWORD *)(a2 + 216);
  v33 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v32;
  swift_bridgeObjectRelease(v33);
  v34 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRelease(v34);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 233) = *(_BYTE *)(a2 + 233);
  *(_BYTE *)(a1 + 234) = *(_BYTE *)(a2 + 234);
  v35 = *(_QWORD *)(a2 + 248);
  v36 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v35;
  swift_bridgeObjectRelease(v36);
  v37 = *(_QWORD *)(a2 + 264);
  v38 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v37;
  swift_bridgeObjectRelease(v38);
  v39 = a3[24];
  v40 = (void *)(a1 + v39);
  v41 = (void *)(a2 + v39);
  v42 = type metadata accessor for URL(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v43 + 48);
  v45 = v44(v40, 1, v42);
  v46 = v44(v41, 1, v42);
  if (v45)
  {
    if (!v46)
    {
      (*(void (**)(void *, void *, uint64_t))(v43 + 32))(v40, v41, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v46)
  {
    (*(void (**)(void *, uint64_t))(v43 + 8))(v40, v42);
LABEL_6:
    v47 = sub_1000070B8(&qword_100034868);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v43 + 40))(v40, v41, v42);
LABEL_7:
  v48 = a3[25];
  v49 = (void *)(a1 + v48);
  v50 = (void *)(a2 + v48);
  v51 = v44((void *)(a1 + v48), 1, v42);
  v52 = v44(v50, 1, v42);
  if (v51)
  {
    if (!v52)
    {
      (*(void (**)(void *, void *, uint64_t))(v43 + 32))(v49, v50, v42);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v49, 0, 1, v42);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v52)
  {
    (*(void (**)(void *, uint64_t))(v43 + 8))(v49, v42);
LABEL_12:
    v53 = sub_1000070B8(&qword_100034868);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v43 + 40))(v49, v50, v42);
LABEL_13:
  v54 = a3[26];
  v55 = (void *)(a1 + v54);
  v56 = (void *)(a2 + v54);
  v57 = type metadata accessor for Date(0);
  v58 = *(_QWORD *)(v57 - 8);
  v59 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v58 + 48);
  v60 = v59(v55, 1, v57);
  v61 = v59(v56, 1, v57);
  if (!v60)
  {
    if (!v61)
    {
      (*(void (**)(void *, void *, uint64_t))(v58 + 40))(v55, v56, v57);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v58 + 8))(v55, v57);
    goto LABEL_18;
  }
  if (v61)
  {
LABEL_18:
    v62 = sub_1000070B8(&qword_1000347F0);
    memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v58 + 32))(v55, v56, v57);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, v57);
LABEL_19:
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_100020D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020D10);
}

uint64_t sub_100020D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1000070B8(&qword_100034868);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 96);
    }
    else
    {
      v10 = sub_1000070B8(&qword_1000347F0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 104);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_100020DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100020DC4);
}

uint64_t sub_100020DC4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_1000070B8(&qword_100034868);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 96);
    }
    else
    {
      v10 = sub_1000070B8(&qword_1000347F0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 104);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for InviteMessageDetails(uint64_t a1)
{
  uint64_t result;

  result = qword_100035088;
  if (!qword_100035088)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InviteMessageDetails);
  return result;
}

void sub_100020EA4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[20];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6[0] = &unk_10002A7A8;
  v6[1] = &unk_10002A7A8;
  v6[2] = &unk_10002A7A8;
  v6[3] = &unk_10002A7A8;
  v6[4] = &unk_10002A7A8;
  v6[5] = &unk_10002A7A8;
  v6[6] = &unk_10002A7A8;
  v6[7] = &unk_10002A7A8;
  v6[8] = &unk_10002A7A8;
  v6[9] = &unk_10002A7A8;
  v6[10] = &unk_10002A7A8;
  v6[11] = &unk_10002A7A8;
  v6[12] = &unk_10002A7A8;
  v6[13] = &unk_10002A7A8;
  v6[14] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v6[15] = &unk_10002A7C0;
  v6[16] = &unk_10002A7D8;
  v6[17] = &unk_10002A7D8;
  v6[18] = &unk_10002A7A8;
  v6[19] = &unk_10002A7A8;
  sub_100006FC0(319, &qword_100035098, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
  if (v3 <= 0x3F)
  {
    v7 = *(_QWORD *)(v2 - 8) + 64;
    v8 = v7;
    sub_100006FC0(319, (unint64_t *)&unk_1000350A0, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
    if (v5 <= 0x3F)
    {
      v9 = *(_QWORD *)(v4 - 8) + 64;
      v10 = &unk_10002A7D8;
      swift_initStructMetadata(a1, 256, 24, v6, a1 + 16);
    }
  }
}

unint64_t sub_100020F94(uint64_t a1)
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
  sub_1000070B8(&qword_100035158);
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
    sub_1000079E4(v7, (uint64_t)&v16, &qword_100035160);
    v8 = v16;
    v9 = v17;
    result = sub_100027480(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10001FA28(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_1000210C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070B8(&qword_100035140);
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
  v6 = (_QWORD *)(a1 + 48);
  while (1)
  {
    v7 = *((_BYTE *)v6 - 16);
    v9 = *(v6 - 1);
    v8 = *v6;
    swift_bridgeObjectRetain(*v6);
    result = sub_1000274E4(v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v4[6] + result) = v7;
    v12 = (_QWORD *)(v4[7] + 16 * result);
    *v12 = v9;
    v12[1] = v8;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6 += 3;
    v4[2] = v15;
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

unint64_t sub_1000211D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070B8(&qword_100035170);
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
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_100027480(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
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

uint64_t sub_1000212F4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)(v7 + 1016) = a7;
  *(_QWORD *)(v7 + 1008) = a5;
  *(_QWORD *)(v7 + 1000) = a4;
  *(_BYTE *)(v7 + 1629) = a3;
  *(_QWORD *)(v7 + 992) = a2;
  *(_QWORD *)(v7 + 984) = a1;
  v8 = type metadata accessor for InviteMessageDetails(0);
  *(_QWORD *)(v7 + 1024) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 1032) = v9;
  *(_QWORD *)(v7 + 1040) = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (*(_QWORD *)(*(_QWORD *)(sub_1000070B8(&qword_1000347F0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v7 + 1048) = swift_task_alloc(v10);
  *(_QWORD *)(v7 + 1056) = swift_task_alloc(v10);
  v11 = type metadata accessor for Date(0);
  *(_QWORD *)(v7 + 1064) = v11;
  v12 = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v7 + 1072) = v12;
  *(_QWORD *)(v7 + 1080) = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000070B8(&qword_100034868);
  *(_QWORD *)(v7 + 1088) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Logger(0);
  *(_QWORD *)(v7 + 1096) = v14;
  v15 = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v7 + 1104) = v15;
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v7 + 1112) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1120) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1128) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1136) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1144) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1152) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1160) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1168) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1176) = swift_task_alloc(v16);
  *(_QWORD *)(v7 + 1184) = swift_task_alloc(v16);
  v17 = type metadata accessor for URLQueryItem(0);
  *(_QWORD *)(v7 + 1192) = v17;
  v18 = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v7 + 1200) = v18;
  *(_QWORD *)(v7 + 1208) = swift_task_alloc((*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000214A8, 0, 0);
}

_QWORD *sub_1000214A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unsigned __int8 v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  _QWORD *v17;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *result;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  char v76;
  uint64_t v77;
  id v78;
  id v79;
  NSString v80;
  NSString v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  _QWORD *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  _BOOL4 v134;
  uint8_t *v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  char *v146;
  uint64_t v147;
  int v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *v152;
  os_log_type_t v153;
  uint8_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  _QWORD *v162;
  uint64_t v163;
  uint64_t v164;
  uint8_t *buf;
  uint64_t v166;
  uint64_t v167;
  char **v168;
  uint64_t v169;
  os_log_type_t type;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *log;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  _QWORD *v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  uint64_t (*v203)(uint64_t);
  uint64_t v204[3];

  v1 = URLComponents.queryItems.getter();
  v192 = v0;
  if (!v1)
  {
    v35 = sub_1000210C8((uint64_t)&_swiftEmptyArrayStorage);
LABEL_30:
    v201 = v35;
    *(_QWORD *)(v0 + 1216) = v35;
    v36 = static FamilyLogger.extension.getter(v35);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Building message..", v39, 2u);
      swift_slowDealloc(v39, -1, -1);
    }
    v40 = *(_QWORD *)(v0 + 1184);
    v41 = *(_QWORD *)(v0 + 1104);
    v42 = *(_QWORD *)(v0 + 1096);
    v43 = *(_QWORD *)(v0 + 1024);

    v20 = *(_QWORD *)(v41 + 8);
    *(_QWORD *)(v0 + 1224) = v20;
    ((void (*)(uint64_t, uint64_t))v20)(v40, v42);
    v4 = swift_allocBox(v43);
    v17 = (_QWORD *)v44;
    *(_QWORD *)(v0 + 1232) = v4;
    *(_QWORD *)(v0 + 1240) = v44;
    sub_1000262C8(v44);
    *(_BYTE *)(v0 + 1625) = 0;
    v5 = sub_10002741C();
    Dictionary.subscript.getter(v0 + 1625, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
    v45 = *(_QWORD *)(v0 + 456);
    v46 = v17[1];
    *v17 = *(_QWORD *)(v0 + 448);
    v17[1] = v45;
    swift_bridgeObjectRelease(v46);
    *(_BYTE *)(v0 + 1620) = 1;
    Dictionary.subscript.getter(v0 + 1620, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
    v47 = *(_QWORD *)(v0 + 616);
    v48 = v17[3];
    v17[2] = *(_QWORD *)(v0 + 608);
    v17[3] = v47;
    swift_bridgeObjectRelease(v48);
    *(_BYTE *)(v0 + 1617) = 4;
    Dictionary.subscript.getter(v0 + 1617, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
    v49 = *(_QWORD *)(v0 + 680);
    v50 = v17[5];
    v17[4] = *(_QWORD *)(v0 + 672);
    v17[5] = v49;
    swift_bridgeObjectRelease(v50);
    *(_BYTE *)(v0 + 1604) = 7;
    Dictionary.subscript.getter(v0 + 1604, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
    v51 = *(_QWORD *)(v0 + 408);
    v52 = v17[13];
    v17[12] = *(_QWORD *)(v0 + 400);
    v17[13] = v51;
    swift_bridgeObjectRelease(v52);
    *(_BYTE *)(v0 + 1627) = 8;
    Dictionary.subscript.getter(v0 + 1627, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
    v53 = *(_QWORD *)(v0 + 440);
    v54 = v17[23];
    v17[22] = *(_QWORD *)(v0 + 432);
    v17[23] = v53;
    swift_bridgeObjectRelease(v54);
    *(_BYTE *)(v0 + 1626) = 10;
    Dictionary.subscript.getter(v0 + 1626, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
    v2 = (_QWORD *)v0;
    v16 = (_BYTE *)(v0 + 1623);
    v55 = *(_QWORD *)(v0 + 472);
    v56 = v17[25];
    v17[24] = *(_QWORD *)(v0 + 464);
    v17[25] = v55;
    swift_bridgeObjectRelease(v56);
    *(_BYTE *)(v0 + 1624) = 3;
    Dictionary.subscript.getter(v0 + 1624, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
    goto LABEL_36;
  }
  v2 = *(_QWORD **)(v1 + 16);
  v189 = v1;
  if (!v2)
  {
    v5 = (unint64_t)&_swiftEmptyDictionarySingleton;
LABEL_29:
    swift_bridgeObjectRelease(v189);
    v35 = v5;
    goto LABEL_30;
  }
  v3 = *(_QWORD *)(v0 + 1200);
  v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v194 = *(_QWORD *)(v3 + 72);
  v197 = v3;
  v201 = *(_QWORD *)(v3 + 16);
  v5 = (unint64_t)&_swiftEmptyDictionarySingleton;
  for (i = ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v201)(*(_QWORD *)(v0 + 1208), v4, *(_QWORD *)(v0 + 1192));
        ;
        i = ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v201)(*(_QWORD *)(v0 + 1208), v4, *(_QWORD *)(v0 + 1192)))
  {
    v9 = URLQueryItem.name.getter(i);
    v11 = sub_100028350(v9, v10);
    v12 = v11 == 40 ? 39 : v11;
    v13 = URLQueryItem.value.getter();
    if (v14)
      break;
    v26 = v5;
    swift_bridgeObjectRetain(v5);
    v27 = sub_1000274E4(v12);
    v29 = v28;
    swift_bridgeObjectRelease(v5);
    if ((v29 & 1) != 0)
    {
      v204[0] = v5;
      if (!swift_isUniquelyReferenced_nonNull_native(v5))
      {
        sub_100028008();
        v26 = v204[0];
      }
      v30 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 16 * v27 + 8);
      v5 = v26;
      sub_100027DE4(v27, v26);
      swift_bridgeObjectRelease(0x8000000000000000);
      swift_bridgeObjectRelease(v30);
    }
LABEL_6:
    (*(void (**)(_QWORD, _QWORD))(v197 + 8))(*(_QWORD *)(v0 + 1208), *(_QWORD *)(v0 + 1192));
    v4 += v194;
    v2 = (_QWORD *)((char *)v2 - 1);
    if (!v2)
      goto LABEL_29;
  }
  v15 = v13;
  v16 = v14;
  v17 = (_QWORD *)v5;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
  v204[0] = v5;
  v20 = sub_1000274E4(v12);
  v21 = *(_QWORD *)(v5 + 16);
  v22 = (v19 & 1) == 0;
  v23 = v21 + v22;
  if (!__OFADD__(v21, v22))
  {
    v5 = v19;
    if (v17[3] < v23)
    {
      sub_1000277C0(v23, isUniquelyReferenced_nonNull_native);
      v17 = (_QWORD *)v204[0];
      v24 = sub_1000274E4(v12);
      if ((v5 & 1) != (v25 & 1))
        return (_QWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for InviteQueryItem);
      v20 = v24;
      if ((v5 & 1) == 0)
        goto LABEL_23;
LABEL_4:
      v5 = (unint64_t)v17;
      v7 = (uint64_t *)(v17[7] + 16 * v20);
      v8 = v7[1];
      *v7 = v15;
      v7[1] = (uint64_t)v16;
      swift_bridgeObjectRelease(v8);
LABEL_5:
      swift_bridgeObjectRelease(0x8000000000000000);
      v0 = v192;
      goto LABEL_6;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v19 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      sub_100028008();
      v17 = (_QWORD *)v204[0];
      if ((v5 & 1) != 0)
        goto LABEL_4;
    }
LABEL_23:
    v17[(v20 >> 6) + 8] |= 1 << v20;
    *(_BYTE *)(v17[6] + v20) = v12;
    v31 = (uint64_t *)(v17[7] + 16 * v20);
    *v31 = v15;
    v31[1] = (uint64_t)v16;
    v32 = v17[2];
    v33 = __OFADD__(v32, 1);
    v34 = v32 + 1;
    if (v33)
      goto LABEL_35;
    v5 = (unint64_t)v17;
    v17[2] = v34;
    goto LABEL_5;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  v58 = v2[63];
  v59 = v2;
  v60 = v17[7];
  v17[6] = v2[62];
  v17[7] = v58;
  swift_bridgeObjectRelease(v60);
  *v16 = 17;
  Dictionary.subscript.getter(v16, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  v198 = (char *)v2 + 1622;
  v61 = v2[136];
  v62 = v2[128];
  v63 = v59[67];
  URL.init(string:)(v59[66], v63);
  swift_bridgeObjectRelease(v63);
  sub_1000080BC(v61, (uint64_t)v17 + *(int *)(v62 + 96), &qword_100034868);
  *((_BYTE *)v59 + 1622) = 28;
  Dictionary.subscript.getter(v198, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  v64 = v59[136];
  v65 = v59[128];
  v66 = v59[71];
  URL.init(string:)(v59[70], v66);
  swift_bridgeObjectRelease(v66);
  sub_1000080BC(v64, (uint64_t)v17 + *(int *)(v65 + 100), &qword_100034868);
  *((_BYTE *)v59 + 1621) = 13;
  Dictionary.subscript.getter((char *)v59 + 1621, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  v199 = v4;
  v67 = (char *)v59 + 1619;
  v68 = v59[134];
  v69 = v59[133];
  v70 = v59[132];
  v71 = v59[127];
  v72 = v59[75];
  v73 = v17[33];
  v17[32] = v59[74];
  v17[33] = v72;
  swift_bridgeObjectRelease(v73);
  sub_1000079E4(v71, v70, &qword_1000347F0);
  v195 = v17;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v70, 1, v69) == 1)
  {
    sub_10001E90C(v59[132]);
    v74 = v201;
    if (*(_QWORD *)(v201 + 16))
    {
      v75 = sub_1000274E4(0x22u);
      if ((v76 & 1) != 0)
      {
        v77 = *(_QWORD *)(*(_QWORD *)(v201 + 56) + 16 * v75 + 8);
        v78 = objc_allocWithZone((Class)NSDateFormatter);
        swift_bridgeObjectRetain(v77);
        v79 = objc_msgSend(v78, "init");
        v80 = String._bridgeToObjectiveC()();
        objc_msgSend(v79, "setDateFormat:", v80);

        v81 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v77);
        v82 = objc_msgSend(v79, "dateFromString:", v81);

        if (v82)
        {
          static Date._unconditionallyBridgeFromObjectiveC(_:)(v82);

          v83 = 0;
        }
        else
        {
          v83 = 1;
        }
        v100 = *(_QWORD *)(v192 + 1048);
        v101 = *(_QWORD *)(v192 + 1024);
        (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v192 + 1072) + 56))(v100, v83, 1, *(_QWORD *)(v192 + 1064));
        v102 = sub_1000080BC(v100, (uint64_t)v195 + *(int *)(v101 + 104), &qword_1000347F0);
        v103 = static FamilyLogger.common.getter(v102);
        v104 = Logger.logObject.getter(v103);
        v105 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v104, v105))
        {
          v106 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v106 = 0;
          _os_log_impl((void *)&_mh_execute_header, v104, v105, "got date from message url", v106, 2u);
          swift_slowDealloc(v106, -1, -1);
        }
        v59 = (_QWORD *)v192;
        v107 = *(_QWORD *)(v192 + 1168);
        v108 = *(_QWORD *)(v192 + 1096);

        ((void (*)(uint64_t, uint64_t))v20)(v107, v108);
        v74 = v201;
      }
    }
  }
  else
  {
    v84 = v59[135];
    v85 = v59[134];
    v86 = v59[133];
    v87 = v59[132];
    v88 = v59[128];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 32))(v84, v87, v86);
    v89 = (uint64_t)v17 + *(int *)(v88 + 104);
    sub_10001E90C(v89);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 16))(v89, v84, v86);
    v90 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v85 + 56))(v89, 0, 1, v86);
    v91 = static FamilyLogger.common.getter(v90);
    v92 = Logger.logObject.getter(v91);
    v93 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v94 = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, v93, "got date from msmessage", v94, 2u);
      swift_slowDealloc(v94, -1, -1);
    }
    v59 = (_QWORD *)v192;
    v95 = *(_QWORD *)(v192 + 1176);
    v96 = *(_QWORD *)(v192 + 1096);
    v97 = *(_QWORD *)(v192 + 1080);
    v98 = *(_QWORD *)(v192 + 1072);
    v99 = *(_QWORD *)(v192 + 1064);

    ((void (*)(uint64_t, uint64_t))v20)(v95, v96);
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v97, v99);
    v74 = v201;
  }
  *v67 = 11;
  Dictionary.subscript.getter(v67, v74, &type metadata for InviteQueryItem, &type metadata for String, v5);
  v109 = (char *)v59 + 1618;
  v110 = v59;
  v111 = v59[78];
  v112 = v110[79];
  *((_BYTE *)v110 + 1618) = 14;
  Dictionary.subscript.getter(v109, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1248) = *(_QWORD *)(v192 + 656);
  v113 = *(_QWORD *)(v192 + 664);
  *(_QWORD *)(v192 + 1256) = v113;
  *(_BYTE *)(v192 + 1616) = 15;
  Dictionary.subscript.getter(v192 + 1616, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1264) = *(_QWORD *)(v192 + 688);
  v114 = *(_QWORD *)(v192 + 696);
  *(_QWORD *)(v192 + 1272) = v114;
  *(_BYTE *)(v192 + 1615) = 16;
  Dictionary.subscript.getter(v192 + 1615, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  v115 = *(_QWORD *)(v192 + 424);
  *(_QWORD *)(v192 + 1280) = *(_QWORD *)(v192 + 416);
  *(_QWORD *)(v192 + 1288) = v115;
  *(_BYTE *)(v192 + 1614) = 18;
  Dictionary.subscript.getter(v192 + 1614, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1296) = *(_QWORD *)(v192 + 752);
  v116 = *(_QWORD *)(v192 + 760);
  *(_QWORD *)(v192 + 1304) = v116;
  *(_BYTE *)(v192 + 1613) = 19;
  Dictionary.subscript.getter(v192 + 1613, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1312) = *(_QWORD *)(v192 + 784);
  v190 = *(_QWORD *)(v192 + 792);
  *(_QWORD *)(v192 + 1320) = v190;
  *(_BYTE *)(v192 + 1612) = 20;
  Dictionary.subscript.getter(v192 + 1612, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1328) = *(_QWORD *)(v192 + 816);
  v187 = *(_QWORD *)(v192 + 824);
  *(_QWORD *)(v192 + 1336) = v187;
  *(_BYTE *)(v192 + 1610) = 21;
  Dictionary.subscript.getter(v192 + 1610, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1344) = *(_QWORD *)(v192 + 848);
  v186 = *(_QWORD *)(v192 + 856);
  *(_QWORD *)(v192 + 1352) = v186;
  *(_BYTE *)(v192 + 1608) = 22;
  Dictionary.subscript.getter(v192 + 1608, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1360) = *(_QWORD *)(v192 + 880);
  v185 = *(_QWORD *)(v192 + 888);
  *(_QWORD *)(v192 + 1368) = v185;
  *(_BYTE *)(v192 + 1606) = 23;
  Dictionary.subscript.getter(v192 + 1606, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1376) = *(_QWORD *)(v192 + 912);
  v184 = *(_QWORD *)(v192 + 920);
  *(_QWORD *)(v192 + 1384) = v184;
  *(_BYTE *)(v192 + 1628) = 24;
  Dictionary.subscript.getter(v192 + 1628, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1392) = *(_QWORD *)(v192 + 640);
  v183 = *(_QWORD *)(v192 + 648);
  *(_QWORD *)(v192 + 1400) = v183;
  *(_BYTE *)(v192 + 1602) = 25;
  Dictionary.subscript.getter(v192 + 1602, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1408) = *(_QWORD *)(v192 + 544);
  v182 = *(_QWORD *)(v192 + 552);
  *(_QWORD *)(v192 + 1416) = v182;
  *(_BYTE *)(v192 + 1600) = 26;
  Dictionary.subscript.getter(v192 + 1600, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  v117 = *(_QWORD *)(v192 + 488);
  *(_QWORD *)(v192 + 1424) = *(_QWORD *)(v192 + 480);
  v181 = v117;
  *(_QWORD *)(v192 + 1432) = v117;
  *(_BYTE *)(v192 + 1601) = 27;
  Dictionary.subscript.getter(v192 + 1601, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1440) = *(_QWORD *)(v192 + 720);
  v180 = *(_QWORD *)(v192 + 728);
  *(_QWORD *)(v192 + 1448) = v180;
  *(_BYTE *)(v192 + 1603) = 29;
  Dictionary.subscript.getter(v192 + 1603, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1456) = *(_QWORD *)(v192 + 512);
  v179 = *(_QWORD *)(v192 + 520);
  *(_QWORD *)(v192 + 1464) = v179;
  *(_BYTE *)(v192 + 1605) = 30;
  Dictionary.subscript.getter(v192 + 1605, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1472) = *(_QWORD *)(v192 + 576);
  v178 = *(_QWORD *)(v192 + 584);
  *(_QWORD *)(v192 + 1480) = v178;
  *(_BYTE *)(v192 + 1607) = 31;
  Dictionary.subscript.getter(v192 + 1607, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1488) = *(_QWORD *)(v192 + 832);
  v166 = *(_QWORD *)(v192 + 840);
  *(_QWORD *)(v192 + 1496) = v166;
  *(_BYTE *)(v192 + 1609) = 32;
  Dictionary.subscript.getter(v192 + 1609, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1504) = *(_QWORD *)(v192 + 896);
  v167 = *(_QWORD *)(v192 + 904);
  *(_QWORD *)(v192 + 1512) = v167;
  *(_BYTE *)(v192 + 1611) = 33;
  Dictionary.subscript.getter(v192 + 1611, v201, &type metadata for InviteQueryItem, &type metadata for String, v5);
  *(_QWORD *)(v192 + 1520) = *(_QWORD *)(v192 + 864);
  v164 = *(_QWORD *)(v192 + 872);
  *(_QWORD *)(v192 + 1528) = v164;
  if (*(_QWORD *)(v201 + 16))
  {
    v127 = sub_1000274E4(0xCu);
    if ((v128 & 1) != 0)
    {
      v129 = (_QWORD *)(*(_QWORD *)(v201 + 56) + 16 * v127);
      v130 = v129[1];
      v131 = v195[31];
      v195[30] = *v129;
      v195[31] = v130;
      goto LABEL_53;
    }
  }
  v130 = *(_QWORD *)(v192 + 1008);
  if (v130)
  {
    v131 = v195[31];
    v195[30] = *(_QWORD *)(v192 + 1000);
    v195[31] = v130;
LABEL_53:
    swift_bridgeObjectRetain(v130);
    v130 = swift_bridgeObjectRelease(v131);
  }
  static FamilyLogger.extension.getter(v130);
  v132 = swift_retain(v199);
  v133 = Logger.logObject.getter(v132);
  type = static os_log_type_t.default.getter();
  v134 = os_log_type_enabled(v133, type);
  v171 = *(_QWORD *)(v192 + 1096);
  v173 = *(_QWORD *)(v192 + 1160);
  if (v134)
  {
    v135 = (uint8_t *)swift_slowAlloc(12, -1);
    v169 = swift_slowAlloc(32, -1);
    v204[0] = v169;
    *(_DWORD *)v135 = 136315138;
    swift_beginAccess(v195, v192 + 352, 0, 0);
    v136 = v195[31];
    v163 = v195[30];
    swift_bridgeObjectRetain(v136);
    *(_QWORD *)(v192 + 976) = sub_100026DB4(v163, v136, v204);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v192 + 976, v192 + 984);
    swift_bridgeObjectRelease(v136);
    swift_release(v199);
    _os_log_impl((void *)&_mh_execute_header, v133, type, "recipient handle is %s", v135, 0xCu);
    swift_arrayDestroy(v169, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v169, -1, -1);
    swift_slowDealloc(v135, -1, -1);

  }
  else
  {
    swift_release(v199);

  }
  ((void (*)(uint64_t, uint64_t))v20)(v173, v171);
  log = (char *)&_swiftEmptyArrayStorage;
  *(_QWORD *)(v192 + 928) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(v192 + 800) = v111;
  *(_QWORD *)(v192 + 808) = v112;
  *(_QWORD *)(v192 + 768) = 44;
  *(_QWORD *)(v192 + 776) = 0xE100000000000000;
  v172 = sub_10001525C();
  v137 = StringProtocol.components<A>(separatedBy:)(v192 + 768, &type metadata for String, &type metadata for String, v172, v172);
  swift_bridgeObjectRelease(v112);
  buf = (uint8_t *)v137;
  v138 = *(_QWORD *)(v137 + 16);
  if (v138)
  {
    v168 = (char **)(v192 + 928);
    v139 = (uint64_t *)(v137 + 40);
    while (1)
    {
      v140 = *v139;
      *(_QWORD *)(v192 + 736) = *(v139 - 1);
      *(_QWORD *)(v192 + 744) = v140;
      *(_QWORD *)(v192 + 704) = 58;
      *(_QWORD *)(v192 + 712) = 0xE100000000000000;
      result = (_QWORD *)StringProtocol.components<A>(separatedBy:)(v192 + 704, &type metadata for String, &type metadata for String, v172, v172);
      v141 = result[2];
      if (!v141)
        break;
      if (v141 == 1)
        goto LABEL_70;
      v142 = result;
      v175 = result[5];
      v176 = result[4];
      v143 = result[7];
      v174 = result[6];
      swift_bridgeObjectRetain(v175);
      swift_bridgeObjectRetain(v143);
      swift_bridgeObjectRelease(v142);
      sub_100026AF4();
      log = *v168;
      v145 = *((_QWORD *)*v168 + 2);
      v144 = *((_QWORD *)*v168 + 3);
      if (v145 >= v144 >> 1)
      {
        log = sub_100026B3C((char *)(v144 > 1), v145 + 1, 1, log);
        *v168 = log;
      }
      *((_QWORD *)log + 2) = v145 + 1;
      v146 = &log[32 * v145];
      *((_QWORD *)v146 + 4) = v176;
      *((_QWORD *)v146 + 5) = v175;
      *((_QWORD *)v146 + 6) = v174;
      *((_QWORD *)v146 + 7) = v143;
      v139 += 2;
      if (!--v138)
        goto LABEL_64;
    }
    __break(1u);
LABEL_70:
    __break(1u);
  }
  else
  {
LABEL_64:
    v147 = *(_QWORD *)(v192 + 1024);
    v148 = *(unsigned __int8 *)(v192 + 1629);
    swift_bridgeObjectRelease(buf);
    swift_beginAccess(v195, v192 + 376, 1, 0);
    v149 = v195[28];
    v195[28] = log;
    *((_BYTE *)v195 + *(int *)(v147 + 108)) = v148;
    swift_bridgeObjectRetain(log);
    swift_bridgeObjectRelease(v149);
    if (v148 == 1)
    {
      swift_bridgeObjectRelease(log);
      swift_bridgeObjectRelease(v201);
      swift_bridgeObjectRelease(v113);
      swift_bridgeObjectRelease(v114);
      swift_bridgeObjectRelease(v115);
      swift_bridgeObjectRelease(v116);
      swift_bridgeObjectRelease(v190);
      swift_bridgeObjectRelease(v187);
      swift_bridgeObjectRelease(v186);
      swift_bridgeObjectRelease(v185);
      swift_bridgeObjectRelease(v184);
      swift_bridgeObjectRelease(v183);
      swift_bridgeObjectRelease(v182);
      swift_bridgeObjectRelease(v181);
      swift_bridgeObjectRelease(v180);
      swift_bridgeObjectRelease(v179);
      swift_bridgeObjectRelease(v178);
      swift_bridgeObjectRelease(v166);
      swift_bridgeObjectRelease(v167);
      v150 = swift_bridgeObjectRelease(v164);
      v151 = static FamilyLogger.extension.getter(v150);
      v152 = Logger.logObject.getter(v151);
      v153 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v152, v153))
      {
        v154 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v154 = 0;
        _os_log_impl((void *)&_mh_execute_header, v152, v153, "Message is in compose screen, return message with minimal details", v154, 2u);
        swift_slowDealloc(v154, -1, -1);
      }
      v155 = v192;
      v156 = *(_QWORD *)(v192 + 1152);
      v157 = *(_QWORD *)(v192 + 1096);
      v158 = *(_QWORD *)(v192 + 1032);
      v159 = *(_QWORD *)(v192 + 1024);
      v160 = *(_QWORD *)(v192 + 984);

      ((void (*)(uint64_t, uint64_t))v20)(v156, v157);
      sub_10001E94C((uint64_t)v195, v160);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v158 + 56))(v160, 0, 1, v159);
      swift_release(v199);
      v118 = *(_QWORD *)(v192 + 1184);
      v119 = *(_QWORD *)(v192 + 1176);
      v120 = *(_QWORD *)(v192 + 1168);
      v121 = *(_QWORD *)(v192 + 1160);
      v122 = *(_QWORD *)(v192 + 1152);
      v123 = *(_QWORD *)(v192 + 1144);
      v124 = *(_QWORD *)(v192 + 1136);
      v125 = *(_QWORD *)(v192 + 1128);
      v126 = *(_QWORD *)(v192 + 1120);
      v188 = *(_QWORD *)(v192 + 1112);
      v191 = *(_QWORD *)(v192 + 1088);
      v193 = *(_QWORD *)(v192 + 1080);
      v196 = *(_QWORD *)(v155 + 1056);
      v200 = *(_QWORD *)(v155 + 1048);
      v202 = *(_QWORD *)(v155 + 1040);
      swift_task_dealloc(*(_QWORD *)(v155 + 1208));
      swift_task_dealloc(v118);
      swift_task_dealloc(v119);
      swift_task_dealloc(v120);
      swift_task_dealloc(v121);
      swift_task_dealloc(v122);
      swift_task_dealloc(v123);
      swift_task_dealloc(v124);
      swift_task_dealloc(v125);
      swift_task_dealloc(v126);
      swift_task_dealloc(v188);
      swift_task_dealloc(v191);
      swift_task_dealloc(v193);
      swift_task_dealloc(v196);
      swift_task_dealloc(v200);
      swift_task_dealloc(v202);
      return (_QWORD *)(*(uint64_t (**)(void))(v155 + 8))();
    }
    else
    {
      v161 = swift_allocObject(&unk_100031AE8, 24, 7);
      *(_QWORD *)(v192 + 1536) = v161;
      *(_QWORD *)(v161 + 16) = 0;
      v203 = (uint64_t (*)(uint64_t))((char *)&dword_100034FF8 + dword_100034FF8);
      v162 = (_QWORD *)swift_task_alloc(unk_100034FFC);
      *(_QWORD *)(v192 + 1544) = v162;
      *v162 = v192;
      v162[1] = sub_100023100;
      return (_QWORD *)v203(1);
    }
  }
  return result;
}

uint64_t sub_100023100(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 1544);
  *(_QWORD *)(*(_QWORD *)v1 + 1552) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10002315C, 0, 0);
}

void sub_10002315C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = v0[192];
  v2 = v0[155];
  v3 = (_QWORD *)v0[130];
  v4 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v0[194];

  sub_10001E94C(v2, (uint64_t)v3);
  v5 = *(void **)(v1 + 16);
  v6 = v5;
  sub_10001CC98(v3, v5);

  sub_10001E990((uint64_t)v3);
  __asm { BR              X10 }
}

uint64_t sub_100023220()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t inited;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  void *v47;
  id v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BOOL4 v66;
  uint64_t v67;
  uint8_t *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64656E696C636544, v0, 0x6E776F6E6B6E55, 0xE700000000000000, 0);
  v10 = swift_bridgeObjectRelease(v0);
  if ((v9 & 1) == 0)
  {
    *(_QWORD *)(v8 - 104) = v7;
    v83 = v6;
    v85 = v3;
    v11 = v2[154];
    *(_BYTE *)(v2[155] + 232) = v1;
    static FamilyLogger.extension.getter(v10);
    v12 = swift_retain_n(v11, 2);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    v15 = swift_allocObject(&unk_100031B10, 17, 7);
    *(_BYTE *)(v15 + 16) = 32;
    v16 = swift_allocObject(&unk_100031B38, 17, 7);
    *(_BYTE *)(v16 + 16) = 8;
    v17 = swift_allocObject(&unk_100031B60, 32, 7);
    *(_QWORD *)(v17 + 16) = sub_100028490;
    *(_QWORD *)(v17 + 24) = v11;
    v18 = swift_allocObject(&unk_100031B88, 32, 7);
    *(_QWORD *)(v18 + 16) = sub_1000284F0;
    *(_QWORD *)(v18 + 24) = v17;
    v19 = sub_1000070B8(&qword_100035138);
    v2[197] = v19;
    inited = swift_initStackObject(v19, v5);
    *(_OWORD *)(inited + 16) = xmmword_10002A5A0;
    *(_QWORD *)(inited + 32) = sub_1000284A8;
    *(_QWORD *)(inited + 40) = v15;
    *(_QWORD *)(inited + 48) = sub_100028804;
    *(_QWORD *)(inited + 56) = v16;
    *(_QWORD *)(inited + 64) = sub_100028510;
    *(_QWORD *)(inited + 72) = v18;
    swift_retain(v11);
    swift_retain(v17);
    swift_retain(v15);
    swift_retain(v16);
    swift_retain(v18);
    swift_bridgeObjectRelease(inited);
    v21 = v14;
    v84 = v4;
    if (os_log_type_enabled(v13, v14))
    {
      v22 = v2[155];
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      *(_QWORD *)(v8 - 80) = v24;
      *(_WORD *)v23 = 258;
      v23[2] = 32;
      swift_release(v15);
      v23[3] = 8;
      swift_release(v16);
      v25 = 8 * *(char *)(v22 + 232);
      v26 = *(_QWORD *)((char *)&unk_10002A908 + v25);
      v27 = v2[154];
      v81 = v2[142];
      v82 = (void (*)(uint64_t, uint64_t))v2[153];
      v80 = v2[137];
      v2[121] = sub_100026DB4(*(_QWORD *)&aAccepteddeclin_1[v25], v26, (uint64_t *)(v8 - 80));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(*(_QWORD *)(v8 - 96), v2 + 122);
      swift_bridgeObjectRelease(v26);
      swift_bridgeObjectRelease(v2[116]);
      swift_release(v18);
      swift_release(v17);
      swift_release_n(v27, 2);
      _os_log_impl((void *)&_mh_execute_header, v13, v21, "invite status %s", v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);

      v82(v81, v80);
    }
    else
    {
      v38 = v2[154];
      v39 = (void (*)(uint64_t, uint64_t))v2[153];
      v40 = v2[142];
      v41 = v2[137];

      swift_release(v18);
      swift_release(v17);
      swift_release_n(v38, 2);
      swift_release(v16);
      swift_release(v15);
      v39(v40, v41);
      swift_bridgeObjectRelease(v2[116]);
    }
    v42 = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
    v2[198] = v42;
    if (v42)
    {
      v43 = v42;
      v44 = v2 + 2;
      v2[7] = *(_QWORD *)(v8 - 88);
      v2[2] = v2;
      v2[3] = sub_100025244;
      v45 = swift_continuation_init(v2 + 2, 1);
      v2[30] = _NSConcreteStackBlock;
      v46 = v2 + 30;
      v46[1] = 0x40000000;
      v46[2] = sub_1000269B4;
      v46[3] = &unk_100031C40;
      v46[4] = v45;
      objc_msgSend(v43, "aa_primaryAppleAccountWithCompletion:", v46);
      return swift_continuation_await(v44);
    }
    v47 = *(void **)(v2[192] + 16);
    if (!v47 || (v48 = v47, v49 = FAFamilyCircle.amIOrganizer.getter(), v48, (v49 & 1) == 0))
      swift_bridgeObjectRelease(0);
    v50 = v2[197];
    v51 = v2[192];
    v52 = v2[155];
    *(_BYTE *)(v52 + 233) = 0;
    v53 = *(void **)(v51 + 16);
    v54 = *(_QWORD *)(v52 + 256);
    v55 = *(_QWORD *)(v52 + 264);
    v56 = v53;
    swift_bridgeObjectRetain(v55);
    LOBYTE(v53) = sub_10001C2BC(v53, v54, v55);
    swift_bridgeObjectRelease(v55);

    *(_QWORD *)(v8 - 88) = v52;
    *(_BYTE *)(v52 + 234) = v53 & 1;
    static FamilyLogger.extension.getter(v57);
    v58 = swift_retain_n(v51, 2);
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.default.getter();
    v61 = swift_allocObject(&unk_100031BB0, 17, 7);
    *(_BYTE *)(v61 + 16) = 0;
    v62 = swift_allocObject(&unk_100031BD8, 17, 7);
    *(_BYTE *)(v62 + 16) = 8;
    v63 = swift_allocObject(&unk_100031C00, 32, 7);
    *(_QWORD *)(v63 + 16) = sub_100028518;
    *(_QWORD *)(v63 + 24) = v51;
    v64 = swift_allocObject(&unk_100031C28, 32, 7);
    *(_QWORD *)(v64 + 16) = sub_100028540;
    *(_QWORD *)(v64 + 24) = v63;
    v65 = swift_initStackObject(v50, *(_QWORD *)(v8 - 104));
    *(_OWORD *)(v65 + 16) = xmmword_10002A5A0;
    *(_QWORD *)(v65 + 32) = sub_100028804;
    *(_QWORD *)(v65 + 40) = v61;
    *(_QWORD *)(v65 + 48) = sub_100028804;
    *(_QWORD *)(v65 + 56) = v62;
    *(_QWORD *)(v65 + 64) = sub_100028568;
    *(_QWORD *)(v65 + 72) = v64;
    swift_retain(v51);
    swift_retain(v63);
    swift_retain(v61);
    swift_retain(v62);
    swift_retain(v64);
    swift_bridgeObjectRelease(v65);
    v66 = os_log_type_enabled(v59, v60);
    v67 = v2[192];
    if (v66)
    {
      v68 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_WORD *)v68 = 256;
      v68[2] = 0;
      swift_release(v61);
      v68[3] = 8;
      swift_release(v62);
      swift_beginAccess(v67 + 16, v83, 0, 0);
      v69 = *(void **)(v67 + 16);
      if (v69)
        v70 = (uint64_t)objc_msgSend(v69, "ageCategory");
      else
        v70 = 9;
      v71 = v85;
      swift_release_n(v2[192], 2);
      v2[119] = v70;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v84, v2 + 120);
      swift_release(v63);
      swift_release(v64);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "Age category: %ld", v68, 0xCu);
      swift_slowDealloc(v68, -1, -1);
    }
    else
    {
      swift_release_n(v2[192], 2);
      swift_release(v63);
      swift_release(v61);
      swift_release(v62);
      swift_release(v64);
      v71 = v85;
    }

    v72 = v2[192];
    ((void (*)(_QWORD, _QWORD))v2[153])(v2[141], v2[137]);
    swift_beginAccess(v72 + 16, v71, 0, 0);
    v73 = *(void **)(v72 + 16);
    if (v73)
    {
      v74 = objc_msgSend(v73, "ageCategory");
      v75 = v2[152];
      if (v74 == (id)1)
      {
        v76 = sub_100026910(2u, v2[152]);
        v78 = v77;
        swift_bridgeObjectRelease(v75);
        if (!v78)
          goto LABEL_25;
        v79 = v2[155];
        v75 = *(_QWORD *)(v79 + 24);
        *(_QWORD *)(v79 + 16) = v76;
        *(_QWORD *)(v79 + 24) = v78;
      }
    }
    else
    {
      v75 = v2[152];
    }
    swift_bridgeObjectRelease(v75);
LABEL_25:
    __asm { BR              X10 }
  }
  v28 = static FamilyLogger.extension.getter(v10);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Invite status is unknown, fetch family again from server", v31, 2u);
    swift_slowDealloc(v31, -1, -1);
  }
  v32 = (void (*)(uint64_t, uint64_t))v2[153];
  v33 = v2[143];
  v34 = v2[137];

  v32(v33, v34);
  v35 = unk_100034FFC;
  *(_QWORD *)(v8 - 88) = (char *)&dword_100034FF8 + dword_100034FF8;
  v36 = (_QWORD *)swift_task_alloc(v35);
  v2[195] = v36;
  *v36 = v2;
  v36[1] = sub_100024270;
  return (*(uint64_t (**)(uint64_t))(v8 - 88))(2);
}

uint64_t sub_100023AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;

  v3 = *(void **)(v0 + 1584);
  v45 = *(_QWORD *)(v0 + 1512);
  v46 = *(_QWORD *)(v0 + 1528);
  v43 = *(_QWORD *)(v0 + 1496);
  v40 = *(_QWORD *)(v0 + 1464);
  v41 = *(_QWORD *)(v0 + 1480);
  v38 = *(_QWORD *)(v0 + 1432);
  v39 = *(_QWORD *)(v0 + 1448);
  v4 = *(_QWORD *)(v0 + 1416);
  v5 = *(_QWORD *)(v0 + 1400);
  v6 = *(_QWORD *)(v0 + 1384);
  v7 = *(_QWORD *)(v0 + 1368);
  *(_QWORD *)(v2 - 104) = *(_QWORD *)(v0 + 1360);
  *(_QWORD *)(v2 - 96) = v7;
  v47 = *(_QWORD *)(v0 + 1344);
  v49 = *(_QWORD *)(v0 + 1352);
  v51 = *(_OWORD *)(v0 + 1328);
  v8 = *(_QWORD *)(v0 + 1320);
  v44 = *(_QWORD *)(v0 + 1312);
  v9 = *(_QWORD *)(v0 + 1304);
  v42 = *(_QWORD *)(v0 + 1296);
  v10 = *(_QWORD *)(v0 + 1288);
  v11 = *(_QWORD *)(v0 + 1272);
  v12 = *(_QWORD *)(v0 + 1256);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v38);
  swift_bridgeObjectRelease(v39);
  swift_bridgeObjectRelease(v40);
  swift_bridgeObjectRelease(v41);
  swift_bridgeObjectRelease(v43);
  swift_bridgeObjectRelease(v45);
  swift_bridgeObjectRelease(v46);
  if (*(_BYTE *)(*(_QWORD *)(v2 - 88) + 233))
    v13 = v8;
  else
    v13 = v9;
  if (*(_BYTE *)(*(_QWORD *)(v2 - 88) + 233))
    v14 = v42;
  else
    v14 = v44;
  if (*(_BYTE *)(*(_QWORD *)(v2 - 88) + 233))
    v15 = v9;
  else
    v15 = v8;
  swift_bridgeObjectRelease(v13);
  v16 = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v1 + 112) = v14;
  *(_QWORD *)(v1 + 120) = v15;
  v17 = *(_QWORD *)(v1 + 136);
  *(_QWORD *)(v1 + 128) = v47;
  *(_QWORD *)(v1 + 136) = v49;
  v18 = *(_QWORD *)(v1 + 168);
  v19 = *(_QWORD *)(v2 - 96);
  *(_QWORD *)(v1 + 160) = *(_QWORD *)(v2 - 104);
  *(_QWORD *)(v1 + 168) = v19;
  v20 = *(_QWORD *)(v1 + 152);
  *(_OWORD *)(v1 + 144) = v51;
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v20);
  v21 = *(_QWORD *)(v0 + 1536);
  v22 = *(_QWORD *)(v0 + 1232);
  v23 = *(_QWORD *)(v0 + 1032);
  v24 = *(_QWORD *)(v0 + 1024);
  v25 = *(_QWORD *)(v0 + 984);
  sub_10001E94C(*(_QWORD *)(v0 + 1240), v25);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v25, 0, 1, v24);
  swift_release(v21);
  swift_release(v22);
  v26 = *(_QWORD *)(v0 + 1208);
  v27 = *(_QWORD *)(v0 + 1184);
  v28 = *(_QWORD *)(v0 + 1176);
  v29 = *(_QWORD *)(v0 + 1168);
  v30 = *(_QWORD *)(v0 + 1160);
  v31 = *(_QWORD *)(v0 + 1152);
  v32 = *(_QWORD *)(v0 + 1144);
  v33 = *(_QWORD *)(v0 + 1136);
  v34 = *(_QWORD *)(v0 + 1128);
  v35 = *(_QWORD *)(v0 + 1120);
  v48 = *(_QWORD *)(v0 + 1112);
  v50 = *(_QWORD *)(v0 + 1088);
  v52 = *(_QWORD *)(v0 + 1080);
  v36 = *(_QWORD *)(v0 + 1048);
  *(_QWORD *)(v2 - 104) = *(_QWORD *)(v0 + 1056);
  *(_QWORD *)(v2 - 96) = v36;
  *(_QWORD *)(v2 - 88) = *(_QWORD *)(v0 + 1040);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v48);
  swift_task_dealloc(v50);
  swift_task_dealloc(v52);
  swift_task_dealloc(*(_QWORD *)(v2 - 104));
  swift_task_dealloc(*(_QWORD *)(v2 - 96));
  swift_task_dealloc(*(_QWORD *)(v2 - 88));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100024270(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 1560);
  *(_QWORD *)(*(_QWORD *)v1 + 1568) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000242CC, 0, 0);
}

uint64_t sub_1000242CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t inited;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  os_log_type_t v71;
  uint64_t v72;

  v1 = v0[192];
  v2 = v0[155];
  v3 = (_QWORD *)v0[130];
  v4 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v0[196];

  sub_10001E94C(v2, (uint64_t)v3);
  v5 = *(void **)(v1 + 16);
  v6 = v5;
  sub_10001CC98(v3, v5);
  LOBYTE(v5) = v7;

  v8 = sub_10001E990((uint64_t)v3);
  v9 = v0[154];
  *(_BYTE *)(v0[155] + 232) = (_BYTE)v5;
  static FamilyLogger.extension.getter(v8);
  v10 = swift_retain_n(v9, 2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  v13 = swift_allocObject(&unk_100031B10, 17, 7);
  *(_BYTE *)(v13 + 16) = 32;
  v14 = swift_allocObject(&unk_100031B38, 17, 7);
  *(_BYTE *)(v14 + 16) = 8;
  v15 = swift_allocObject(&unk_100031B60, 32, 7);
  *(_QWORD *)(v15 + 16) = sub_100028490;
  *(_QWORD *)(v15 + 24) = v9;
  v16 = swift_allocObject(&unk_100031B88, 32, 7);
  *(_QWORD *)(v16 + 16) = sub_1000284F0;
  *(_QWORD *)(v16 + 24) = v15;
  v17 = sub_1000070B8(&qword_100035138);
  v0[197] = v17;
  inited = swift_initStackObject(v17, v0 + 10);
  *(_OWORD *)(inited + 16) = xmmword_10002A5A0;
  *(_QWORD *)(inited + 32) = sub_1000284A8;
  *(_QWORD *)(inited + 40) = v13;
  *(_QWORD *)(inited + 48) = sub_100028804;
  *(_QWORD *)(inited + 56) = v14;
  *(_QWORD *)(inited + 64) = sub_100028510;
  *(_QWORD *)(inited + 72) = v16;
  swift_retain(v9);
  swift_retain(v15);
  swift_retain(v13);
  swift_retain(v14);
  swift_retain(v16);
  swift_bridgeObjectRelease(inited);
  if (os_log_type_enabled(v11, v12))
  {
    v19 = v0[155];
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    v21 = swift_slowAlloc(32, -1);
    v72 = v21;
    *(_WORD *)v20 = 258;
    v20[2] = 32;
    swift_release(v13);
    v20[3] = 8;
    swift_release(v14);
    v22 = 8 * *(char *)(v19 + 232);
    v23 = *(_QWORD *)((char *)&unk_10002A908 + v22);
    v24 = v0[154];
    v70 = (void (*)(uint64_t, uint64_t))v0[153];
    v69 = v0[142];
    v68 = v0[137];
    v0[121] = sub_100026DB4(*(_QWORD *)&aAccepteddeclin_1[v22], v23, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 121, v0 + 122);
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v0[116]);
    swift_release(v16);
    swift_release(v15);
    swift_release_n(v24, 2);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "invite status %s", v20, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v70(v69, v68);
  }
  else
  {
    v25 = v0[154];
    v26 = (void (*)(uint64_t, uint64_t))v0[153];
    v27 = v0[142];
    v28 = v0[137];

    swift_release(v16);
    swift_release(v15);
    swift_release_n(v25, 2);
    swift_release(v14);
    swift_release(v13);
    v26(v27, v28);
    swift_bridgeObjectRelease(v0[116]);
  }
  v29 = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
  v0[198] = v29;
  if (!v29)
  {
    v35 = *(void **)(v0[192] + 16);
    if (!v35 || (v36 = v35, v37 = FAFamilyCircle.amIOrganizer.getter(), v36, (v37 & 1) == 0))
      swift_bridgeObjectRelease(0);
    v38 = v0[197];
    v39 = v0[192];
    v40 = v0[155];
    *(_BYTE *)(v40 + 233) = 0;
    v41 = *(void **)(v39 + 16);
    v42 = *(_QWORD *)(v40 + 256);
    v43 = *(_QWORD *)(v40 + 264);
    v44 = v41;
    swift_bridgeObjectRetain(v43);
    LOBYTE(v41) = sub_10001C2BC(v41, v42, v43);
    swift_bridgeObjectRelease(v43);

    *(_BYTE *)(v40 + 234) = v41 & 1;
    static FamilyLogger.extension.getter(v45);
    v46 = swift_retain_n(v39, 2);
    v47 = Logger.logObject.getter(v46);
    v48 = static os_log_type_t.default.getter();
    v49 = swift_allocObject(&unk_100031BB0, 17, 7);
    *(_BYTE *)(v49 + 16) = 0;
    v50 = swift_allocObject(&unk_100031BD8, 17, 7);
    *(_BYTE *)(v50 + 16) = 8;
    v51 = swift_allocObject(&unk_100031C00, 32, 7);
    *(_QWORD *)(v51 + 16) = sub_100028518;
    *(_QWORD *)(v51 + 24) = v39;
    v52 = swift_allocObject(&unk_100031C28, 32, 7);
    *(_QWORD *)(v52 + 16) = sub_100028540;
    *(_QWORD *)(v52 + 24) = v51;
    v53 = swift_initStackObject(v38, v0 + 20);
    *(_OWORD *)(v53 + 16) = xmmword_10002A5A0;
    *(_QWORD *)(v53 + 32) = sub_100028804;
    *(_QWORD *)(v53 + 40) = v49;
    *(_QWORD *)(v53 + 48) = sub_100028804;
    *(_QWORD *)(v53 + 56) = v50;
    *(_QWORD *)(v53 + 64) = sub_100028568;
    *(_QWORD *)(v53 + 72) = v52;
    swift_retain(v39);
    swift_retain(v51);
    swift_retain(v49);
    swift_retain(v50);
    swift_retain(v52);
    swift_bridgeObjectRelease(v53);
    v54 = os_log_type_enabled(v47, v48);
    v55 = v0[192];
    if (v54)
    {
      v71 = v48;
      v56 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_WORD *)v56 = 256;
      v56[2] = 0;
      swift_release(v49);
      v56[3] = 8;
      swift_release(v50);
      swift_beginAccess(v55 + 16, v0 + 35, 0, 0);
      v57 = *(void **)(v55 + 16);
      if (v57)
        v58 = (uint64_t)objc_msgSend(v57, "ageCategory");
      else
        v58 = 9;
      v59 = v0 + 38;
      swift_release_n(v0[192], 2);
      v0[119] = v58;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 119, v0 + 120);
      swift_release(v51);
      swift_release(v52);
      _os_log_impl((void *)&_mh_execute_header, v47, v71, "Age category: %ld", v56, 0xCu);
      swift_slowDealloc(v56, -1, -1);
    }
    else
    {
      swift_release_n(v0[192], 2);
      swift_release(v51);
      swift_release(v49);
      swift_release(v50);
      swift_release(v52);
      v59 = v0 + 38;
    }

    v60 = v0[192];
    ((void (*)(_QWORD, _QWORD))v0[153])(v0[141], v0[137]);
    swift_beginAccess(v60 + 16, v59, 0, 0);
    v61 = *(void **)(v60 + 16);
    if (v61)
    {
      v62 = objc_msgSend(v61, "ageCategory");
      v63 = v0[152];
      if (v62 == (id)1)
      {
        v64 = sub_100026910(2u, v0[152]);
        v66 = v65;
        swift_bridgeObjectRelease(v63);
        if (!v66)
          goto LABEL_21;
        v67 = v0[155];
        v63 = *(_QWORD *)(v67 + 24);
        *(_QWORD *)(v67 + 16) = v64;
        *(_QWORD *)(v67 + 24) = v66;
      }
    }
    else
    {
      v63 = v0[152];
    }
    swift_bridgeObjectRelease(v63);
LABEL_21:
    __asm { BR              X10 }
  }
  v30 = v29;
  v31 = v0 + 2;
  v0[7] = v0 + 117;
  v0[2] = v0;
  v0[3] = sub_100025244;
  v32 = swift_continuation_init(v0 + 2, 1);
  v0[30] = _NSConcreteStackBlock;
  v33 = v0 + 30;
  v33[1] = 0x40000000;
  v33[2] = sub_1000269B4;
  v33[3] = &unk_100031C40;
  v33[4] = v32;
  objc_msgSend(v30, "aa_primaryAppleAccountWithCompletion:", v33);
  return swift_continuation_await(v31);
}

uint64_t sub_100024A88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v3 = *(void **)(v0 + 1584);
  v45 = *(_QWORD *)(v0 + 1512);
  v46 = *(_QWORD *)(v0 + 1528);
  v43 = *(_QWORD *)(v0 + 1496);
  v40 = *(_QWORD *)(v0 + 1464);
  v41 = *(_QWORD *)(v0 + 1480);
  v38 = *(_QWORD *)(v0 + 1432);
  v39 = *(_QWORD *)(v0 + 1448);
  v4 = *(_QWORD *)(v0 + 1416);
  v5 = *(_QWORD *)(v0 + 1400);
  v6 = *(_QWORD *)(v0 + 1384);
  v7 = *(_QWORD *)(v0 + 1368);
  *(_QWORD *)(v2 - 104) = *(_QWORD *)(v0 + 1360);
  *(_QWORD *)(v2 - 96) = v7;
  v47 = *(_QWORD *)(v0 + 1344);
  v49 = *(_QWORD *)(v0 + 1352);
  v51 = *(_OWORD *)(v0 + 1328);
  v8 = *(_QWORD *)(v0 + 1320);
  v44 = *(_QWORD *)(v0 + 1312);
  v9 = *(_QWORD *)(v0 + 1304);
  v42 = *(_QWORD *)(v0 + 1296);
  v10 = *(_QWORD *)(v0 + 1288);
  v11 = *(_QWORD *)(v0 + 1272);
  v12 = *(_QWORD *)(v0 + 1256);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v38);
  swift_bridgeObjectRelease(v39);
  swift_bridgeObjectRelease(v40);
  swift_bridgeObjectRelease(v41);
  swift_bridgeObjectRelease(v43);
  swift_bridgeObjectRelease(v45);
  swift_bridgeObjectRelease(v46);
  if (*(_BYTE *)(v53 + 233))
    v13 = v8;
  else
    v13 = v9;
  if (*(_BYTE *)(v53 + 233))
    v14 = v42;
  else
    v14 = v44;
  if (*(_BYTE *)(v53 + 233))
    v15 = v9;
  else
    v15 = v8;
  swift_bridgeObjectRelease(v13);
  v16 = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v1 + 112) = v14;
  *(_QWORD *)(v1 + 120) = v15;
  v17 = *(_QWORD *)(v1 + 136);
  *(_QWORD *)(v1 + 128) = v47;
  *(_QWORD *)(v1 + 136) = v49;
  v18 = *(_QWORD *)(v1 + 168);
  v19 = *(_QWORD *)(v2 - 96);
  *(_QWORD *)(v1 + 160) = *(_QWORD *)(v2 - 104);
  *(_QWORD *)(v1 + 168) = v19;
  v20 = *(_QWORD *)(v1 + 152);
  *(_OWORD *)(v1 + 144) = v51;
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v20);
  v21 = *(_QWORD *)(v0 + 1536);
  v22 = *(_QWORD *)(v0 + 1232);
  v23 = *(_QWORD *)(v0 + 1032);
  v24 = *(_QWORD *)(v0 + 1024);
  v25 = *(_QWORD *)(v0 + 984);
  sub_10001E94C(*(_QWORD *)(v0 + 1240), v25);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v25, 0, 1, v24);
  swift_release(v21);
  swift_release(v22);
  v26 = *(_QWORD *)(v0 + 1208);
  v27 = *(_QWORD *)(v0 + 1184);
  v28 = *(_QWORD *)(v0 + 1176);
  v29 = *(_QWORD *)(v0 + 1168);
  v30 = *(_QWORD *)(v0 + 1160);
  v31 = *(_QWORD *)(v0 + 1152);
  v32 = *(_QWORD *)(v0 + 1144);
  v33 = *(_QWORD *)(v0 + 1136);
  v34 = *(_QWORD *)(v0 + 1128);
  v35 = *(_QWORD *)(v0 + 1120);
  v48 = *(_QWORD *)(v0 + 1112);
  v50 = *(_QWORD *)(v0 + 1088);
  v52 = *(_QWORD *)(v0 + 1080);
  v54 = *(_QWORD *)(v0 + 1056);
  v36 = *(_QWORD *)(v0 + 1040);
  *(_QWORD *)(v2 - 104) = *(_QWORD *)(v0 + 1048);
  *(_QWORD *)(v2 - 96) = v36;
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v48);
  swift_task_dealloc(v50);
  swift_task_dealloc(v52);
  swift_task_dealloc(v54);
  swift_task_dealloc(*(_QWORD *)(v2 - 104));
  swift_task_dealloc(*(_QWORD *)(v2 - 96));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100025244()
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
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD **)v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 1592) = v2;
  if (v2)
  {
    v21 = v1[189];
    v22 = v1[191];
    v19 = v1[185];
    v20 = v1[187];
    v17 = v1[181];
    v18 = v1[183];
    v15 = v1[177];
    v16 = v1[179];
    v14 = v1[175];
    v3 = v1[173];
    v4 = v1[171];
    v5 = v1[169];
    v6 = v1[167];
    v7 = v1[165];
    v8 = v1[163];
    v9 = v1[161];
    v10 = v1[159];
    v11 = v1[157];
    swift_bridgeObjectRelease(v1[152]);
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(v22);
    v12 = sub_100025FD0;
  }
  else
  {
    v12 = sub_1000253B8;
  }
  return swift_task_switch(v12, 0, 0);
}

void sub_1000253B8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t inited;
  _BOOL4 v31;
  uint64_t v32;
  uint8_t *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(void **)(v0 + 936);
  if (v1
    && (v2 = objc_msgSend(*(id *)(v0 + 936), "aa_primaryEmail"), v1, v2))
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }

  v7 = *(void **)(*(_QWORD *)(v0 + 1536) + 16);
  if (v7 && (v8 = v7, v9 = FAFamilyCircle.amIOrganizer.getter(), v8, (v9 & 1) != 0))
  {
    if (v6)
    {
      v10 = *(_QWORD *)(v0 + 1240);
      v11 = *(_QWORD *)(v10 + 256);
      v12 = *(_QWORD *)(v10 + 264);
      if (v11 == v4 && v6 == v12)
      {
        swift_bridgeObjectRelease(v6);
        v14 = 1;
      }
      else
      {
        v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v12, v4, v6, 0);
        swift_bridgeObjectRelease(v6);
      }
      goto LABEL_15;
    }
  }
  else
  {
    swift_bridgeObjectRelease(v6);
  }
  v14 = 0;
LABEL_15:
  v15 = *(_QWORD *)(v0 + 1576);
  v16 = *(_QWORD *)(v0 + 1536);
  v17 = *(_QWORD *)(v0 + 1240);
  *(_BYTE *)(v17 + 233) = v14 & 1;
  v18 = *(void **)(v16 + 16);
  v19 = *(_QWORD *)(v17 + 256);
  v20 = *(_QWORD *)(v17 + 264);
  v21 = v18;
  swift_bridgeObjectRetain(v20);
  LOBYTE(v18) = sub_10001C2BC(v18, v19, v20);
  swift_bridgeObjectRelease(v20);

  *(_BYTE *)(v17 + 234) = v18 & 1;
  static FamilyLogger.extension.getter(v22);
  v23 = swift_retain_n(v16, 2);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  v26 = swift_allocObject(&unk_100031BB0, 17, 7);
  *(_BYTE *)(v26 + 16) = 0;
  v27 = swift_allocObject(&unk_100031BD8, 17, 7);
  *(_BYTE *)(v27 + 16) = 8;
  v28 = swift_allocObject(&unk_100031C00, 32, 7);
  *(_QWORD *)(v28 + 16) = sub_100028518;
  *(_QWORD *)(v28 + 24) = v16;
  v29 = swift_allocObject(&unk_100031C28, 32, 7);
  *(_QWORD *)(v29 + 16) = sub_100028540;
  *(_QWORD *)(v29 + 24) = v28;
  inited = swift_initStackObject(v15, v0 + 160);
  *(_OWORD *)(inited + 16) = xmmword_10002A5A0;
  *(_QWORD *)(inited + 32) = sub_100028804;
  *(_QWORD *)(inited + 40) = v26;
  *(_QWORD *)(inited + 48) = sub_100028804;
  *(_QWORD *)(inited + 56) = v27;
  *(_QWORD *)(inited + 64) = sub_100028568;
  *(_QWORD *)(inited + 72) = v29;
  swift_retain(v16);
  swift_retain(v28);
  swift_retain(v26);
  swift_retain(v27);
  swift_retain(v29);
  swift_bridgeObjectRelease(inited);
  v31 = os_log_type_enabled(v24, v25);
  v32 = *(_QWORD *)(v0 + 1536);
  if (v31)
  {
    v33 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_WORD *)v33 = 256;
    v33[2] = 0;
    swift_release(v26);
    v33[3] = 8;
    swift_release(v27);
    swift_beginAccess(v32 + 16, v0 + 280, 0, 0);
    v34 = *(void **)(v32 + 16);
    if (v34)
      v35 = (uint64_t)objc_msgSend(v34, "ageCategory");
    else
      v35 = 9;
    swift_release_n(*(_QWORD *)(v0 + 1536), 2);
    *(_QWORD *)(v0 + 952) = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 952, v0 + 960);
    swift_release(v28);
    swift_release(v29);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Age category: %ld", v33, 0xCu);
    swift_slowDealloc(v33, -1, -1);
  }
  else
  {
    swift_release_n(*(_QWORD *)(v0 + 1536), 2);
    swift_release(v28);
    swift_release(v26);
    swift_release(v27);
    swift_release(v29);
  }

  v36 = *(_QWORD *)(v0 + 1536);
  (*(void (**)(_QWORD, _QWORD))(v0 + 1224))(*(_QWORD *)(v0 + 1128), *(_QWORD *)(v0 + 1096));
  swift_beginAccess(v36 + 16, v0 + 304, 0, 0);
  v37 = *(void **)(v36 + 16);
  if (v37)
  {
    v38 = objc_msgSend(v37, "ageCategory");
    v39 = *(_QWORD *)(v0 + 1216);
    if (v38 == (id)1)
    {
      v40 = sub_100026910(2u, *(_QWORD *)(v0 + 1216));
      v42 = v41;
      swift_bridgeObjectRelease(v39);
      if (!v42)
        goto LABEL_27;
      v43 = *(_QWORD *)(v0 + 1240);
      v39 = *(_QWORD *)(v43 + 24);
      *(_QWORD *)(v43 + 16) = v40;
      *(_QWORD *)(v43 + 24) = v42;
    }
  }
  else
  {
    v39 = *(_QWORD *)(v0 + 1216);
  }
  swift_bridgeObjectRelease(v39);
LABEL_27:
  __asm { BR              X10 }
}

uint64_t sub_100025FD0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
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
  unint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;

  v2 = *(void **)(v1 + 1584);
  v3 = *(_QWORD *)(v1 + 1536);
  v4 = *(_QWORD *)(v1 + 1232);
  swift_willThrow(a1);

  swift_release(v3);
  v5 = swift_release(v4);
  v6 = *(_QWORD *)(v1 + 1592);
  static FamilyLogger.extension.getter(v5);
  swift_errorRetain(v6);
  v7 = swift_errorRetain(v6);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v33 = *(_QWORD *)(v1 + 1112);
    v35 = *(void (**)(uint64_t, uint64_t))(v1 + 1224);
    v31 = *(_QWORD *)(v1 + 1096);
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v37 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_getErrorValue(v6, v1 + 960, v1 + 328);
    v12 = Error.localizedDescription.getter(*(_QWORD *)(v1 + 336), *(_QWORD *)(v1 + 344));
    v14 = v13;
    *(_QWORD *)(v1 + 944) = sub_100026DB4(v12, v13, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 944, v1 + 952);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    swift_errorRelease(v6);
    v35(v33, v31);
  }
  else
  {
    v15 = *(void (**)(uint64_t, uint64_t))(v1 + 1224);
    v16 = *(_QWORD *)(v1 + 1112);
    v17 = *(_QWORD *)(v1 + 1096);
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    swift_errorRelease(v6);

    v15(v16, v17);
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v1 + 1032) + 56))(*(_QWORD *)(v1 + 984), 1, 1, *(_QWORD *)(v1 + 1024));
  v18 = *(_QWORD *)(v1 + 1184);
  v19 = *(_QWORD *)(v1 + 1176);
  v20 = *(_QWORD *)(v1 + 1168);
  v21 = *(_QWORD *)(v1 + 1160);
  v22 = *(_QWORD *)(v1 + 1152);
  v23 = *(_QWORD *)(v1 + 1144);
  v24 = *(_QWORD *)(v1 + 1136);
  v25 = *(_QWORD *)(v1 + 1128);
  v26 = *(_QWORD *)(v1 + 1120);
  v28 = *(_QWORD *)(v1 + 1112);
  v29 = *(_QWORD *)(v1 + 1088);
  v30 = *(_QWORD *)(v1 + 1080);
  v32 = *(_QWORD *)(v1 + 1056);
  v34 = *(_QWORD *)(v1 + 1048);
  v36 = *(_QWORD *)(v1 + 1040);
  swift_task_dealloc(*(_QWORD *)(v1 + 1208));
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  swift_task_dealloc(v36);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000262C8@<X0>(uint64_t a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0xE000000000000000;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0xE000000000000000;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0xE000000000000000;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0xE000000000000000;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0xE000000000000000;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0xE000000000000000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0xE000000000000000;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0xE000000000000000;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0xE000000000000000;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0xE000000000000000;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = 0xE000000000000000;
  *(_QWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 200) = 0xE000000000000000;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0xE000000000000000;
  *(_QWORD *)(a1 + 224) = &_swiftEmptyArrayStorage;
  *(_WORD *)(a1 + 232) = 4;
  *(_BYTE *)(a1 + 234) = 1;
  *(_QWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 248) = 0xE000000000000000;
  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)(a1 + 264) = 0xE000000000000000;
  v2 = (int *)type metadata accessor for InviteMessageDetails(0);
  v3 = a1 + v2[24];
  v4 = type metadata accessor for URL(0);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(a1 + v2[25], 1, 1, v4);
  v6 = a1 + v2[26];
  v7 = type metadata accessor for Date(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_BYTE *)(a1 + v2[27]) = 0;
  return result;
}

uint64_t sub_1000263DC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100026418 + 4 * byte_10002A730[a1]))(0xD000000000000013, 0x800000010002A9B0);
}

uint64_t sub_100026418()
{
  return 0x546567617373656DLL;
}

uint64_t sub_100026560()
{
  return 0x49676E69646E6570;
}

uint64_t sub_100026648()
{
  uint64_t v0;

  return v0 - 1;
}

uint64_t sub_100026658()
{
  uint64_t v0;

  return v0 + 2;
}

uint64_t sub_100026668()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_100026678()
{
  uint64_t v0;

  return v0 + 7;
}

uint64_t sub_100026688()
{
  uint64_t v0;

  return v0 + 5;
}

unint64_t sub_1000266B8()
{
  return 0xD000000000000011;
}

uint64_t sub_1000266E0()
{
  uint64_t v0;

  return v0 + 2;
}

uint64_t sub_1000266F0()
{
  uint64_t v0;

  return v0 + 6;
}

void sub_100026700()
{
  JUMPOUT(0x10002670CLL);
}

uint64_t sub_100026718()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_100026730(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = sub_1000263DC(*a1);
  v5 = v4;
  v6 = sub_1000263DC(v2);
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

Swift::Int sub_1000267B8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_1000263DC(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100026818(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1000263DC(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100026858(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_1000263DC(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_1000268B4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_100028350(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_1000268E0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000263DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100026908()
{
  unsigned __int8 *v0;

  return sub_1000263DC(*v0);
}

uint64_t sub_100026910(unsigned __int8 a1, uint64_t a2)
{
  unint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v3 = sub_1000274E4(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v3);
  v6 = *v5;
  swift_bridgeObjectRetain(v5[1]);
  return v6;
}

uint64_t sub_100026964(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  type metadata accessor for InviteMessageDetails(0);
  v2 = swift_projectBox(a1);
  swift_beginAccess(v2, v4, 0, 0);
  return sub_10001B8EC(*(_BYTE *)(v2 + 232));
}

uint64_t sub_1000269B4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_1000070B8(&qword_100034D48);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    v12 = a2;
    v10 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v11 = a2;
    sub_1000285C0((uint64_t)&v12, v10);
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100026A54(uint64_t a1)
{
  void *v2;
  _BYTE v4[24];

  swift_beginAccess(a1 + 16, v4, 0, 0);
  v2 = *(void **)(a1 + 16);
  if (v2)
    return (uint64_t)objc_msgSend(v2, "ageCategory");
  else
    return 9;
}

uint64_t sub_100026AA8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100026ADC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_100026AEC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

char *sub_100026AF4()
{
  char **v0;
  char *v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native(*v0);
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_100026B3C(result, *((_QWORD *)v1 + 2) + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

char *sub_100026B3C(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_1000070B8(&qword_100034E18);
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
    sub_1000283A0(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_BYTE **sub_100026C48(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_100026C58(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  a4(&v7);
  v5 = *a1 + 8;
  result = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8);
  *a1 = v5;
  return result;
}

void *sub_100026CB0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_100026D44(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
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
  v9 = sub_100026DB4(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100026DB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100026E84(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100028608((uint64_t)v12, *a3);
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
      sub_100028608((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008294(v12);
  return v7;
}

uint64_t sub_100026E84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10002703C(a5, a6);
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

uint64_t sub_10002703C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000270D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000272A8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000272A8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000270D0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100027244(v4, 0);
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

_QWORD *sub_100027244(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000070B8(&qword_100035150);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000272A8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000070B8(&qword_100035150);
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

uint64_t sub_1000273F4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_10002741C()
{
  unint64_t result;

  result = qword_100035130;
  if (!qword_100035130)
  {
    result = swift_getWitnessTable(&unk_10002A898, &type metadata for InviteQueryItem);
    atomic_store(result, (unint64_t *)&qword_100035130);
  }
  return result;
}

unint64_t sub_100027460(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_100027480(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10002757C(a1, a2, v5);
}

unint64_t sub_1000274E4(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8, *(_QWORD *)(v1 + 40));
  v3 = sub_1000263DC(a1);
  v5 = v4;
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v5);
  v6 = Hasher._finalize()();
  return sub_10002765C(a1, v6);
}

uint64_t sub_100027558()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

unint64_t sub_10002757C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10002765C(unsigned __int8 a1, uint64_t a2)
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
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = sub_1000263DC(*(_BYTE *)(*(_QWORD *)(v2 + 48) + v5));
    v9 = v8;
    v10 = sub_1000263DC(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_17:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v10;
    v14 = v11;
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v14);
    if ((v15 & 1) == 0)
    {
      v16 = ~v4;
      v5 = (v5 + 1) & v16;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v17 = sub_1000263DC(*(_BYTE *)(*(_QWORD *)(v2 + 48) + v5));
          if (v17 == v13 && v18 == v14)
            break;
          v20 = v18;
          v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v18, v13, v14, 0);
          swift_bridgeObjectRelease(v20);
          swift_bridgeObjectRelease(v14);
          if ((v21 & 1) == 0)
          {
            v5 = (v5 + 1) & v16;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        v9 = v14;
        goto LABEL_17;
      }
    }
  }
  return v5;
}

Swift::Int sub_1000277C0(uint64_t a1, uint64_t a2)
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
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v27;
  unint64_t v28;
  int64_t v29;
  unsigned __int8 v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000070B8(&qword_100035140);
  v41 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v39 = v3;
  v40 = v5 + 64;
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
      v24 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v25 = v24 | (v15 << 6);
      goto LABEL_24;
    }
    if (__OFADD__(v15++, 1))
      goto LABEL_43;
    if (v15 >= v12)
      break;
    v27 = (_QWORD *)(v5 + 64);
    v28 = *(_QWORD *)(v40 + 8 * v15);
    if (!v28)
    {
      v29 = v15 + 1;
      if (v15 + 1 >= v12)
      {
LABEL_34:
        swift_release(v5);
        v3 = v39;
        if ((v41 & 1) == 0)
          goto LABEL_41;
        goto LABEL_37;
      }
      v28 = *(_QWORD *)(v40 + 8 * v29);
      if (!v28)
      {
        while (1)
        {
          v15 = v29 + 1;
          if (__OFADD__(v29, 1))
            break;
          if (v15 >= v12)
            goto LABEL_34;
          v28 = *(_QWORD *)(v40 + 8 * v15);
          ++v29;
          if (v28)
            goto LABEL_23;
        }
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
      ++v15;
    }
LABEL_23:
    v11 = (v28 - 1) & v28;
    v25 = __clz(__rbit64(v28)) + (v15 << 6);
LABEL_24:
    v30 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v25);
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v25);
    v32 = *v31;
    v33 = v31[1];
    if ((v41 & 1) == 0)
      swift_bridgeObjectRetain(v33);
    Hasher.init(_seed:)(v42, *(_QWORD *)(v8 + 40));
    v16 = sub_1000263DC(v30);
    v18 = v17;
    String.hash(into:)(v42, v16, v17);
    swift_bridgeObjectRelease(v18);
    result = Hasher._finalize()();
    v19 = -1 << *(_BYTE *)(v8 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v13 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v13 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v21 == v35;
        if (v21 == v35)
          v21 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v13 + 8 * v21);
      }
      while (v37 == -1);
      v22 = __clz(__rbit64(~v37)) + (v21 << 6);
    }
    *(_QWORD *)(v13 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_BYTE *)(*(_QWORD *)(v8 + 48) + v22) = v30;
    v23 = (_QWORD *)(*(_QWORD *)(v8 + 56) + 16 * v22);
    *v23 = v32;
    v23[1] = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v39;
  v27 = (_QWORD *)(v5 + 64);
  if ((v41 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v27, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v27 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100027AC0(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  char v43;
  _QWORD v44[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000070B8(&qword_100035170);
  v43 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v42 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v40 = v3;
  v41 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v23 = v22 | (v14 << 6);
      goto LABEL_34;
    }
    v24 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = (_QWORD *)(v5 + 64);
    v26 = *(_QWORD *)(v42 + 8 * v24);
    ++v14;
    if (!v26)
    {
      v14 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_36;
      v26 = *(_QWORD *)(v42 + 8 * v14);
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_36:
          swift_release(v5);
          v3 = v40;
          if ((v43 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v26 = *(_QWORD *)(v42 + 8 * v27);
        if (!v26)
        {
          while (1)
          {
            v14 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_45;
            if (v14 >= v41)
              goto LABEL_36;
            v26 = *(_QWORD *)(v42 + 8 * v14);
            ++v27;
            if (v26)
              goto LABEL_33;
          }
        }
        v14 = v27;
      }
    }
LABEL_33:
    v11 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v14 << 6);
LABEL_34:
    v32 = 16 * v23;
    v33 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v32);
    v35 = *v33;
    v34 = v33[1];
    v36 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v32);
    v37 = *v36;
    v38 = v36[1];
    if ((v43 & 1) == 0)
    {
      swift_bridgeObjectRetain(v33[1]);
      swift_bridgeObjectRetain(v38);
    }
    Hasher.init(_seed:)(v44, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v44, v35, v34);
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
      v28 = 0;
      v29 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v30 = v17 == v29;
        if (v17 == v29)
          v17 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v31 == -1);
      v18 = __clz(__rbit64(~v31)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 16 * v18;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v20 = v35;
    v20[1] = v34;
    v21 = (_QWORD *)(*(_QWORD *)(v8 + 56) + v19);
    *v21 = v37;
    v21[1] = v38;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v40;
  v25 = (_QWORD *)(v5 + 64);
  if ((v43 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v5 + 32);
  if (v39 >= 64)
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v39;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_100027DE4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

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
        v9 = *(_BYTE *)(*(_QWORD *)(a2 + 48) + v6);
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        v10 = sub_1000263DC(v9);
        v12 = v11;
        String.hash(into:)(v26, v10, v11);
        swift_bridgeObjectRelease(v12);
        result = Hasher._finalize()();
        v13 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_BYTE *)(v14 + v3);
          v16 = (_BYTE *)(v14 + v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_OWORD *)(v17 + 16 * v3);
          v19 = (_OWORD *)(v17 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100027FB8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

void *sub_100028008()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_1000070B8(&qword_100035140);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    if (!v21)
      break;
LABEL_23:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    result = (void *)swift_bridgeObjectRetain(v17);
  }
  v22 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_100028198()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_1000070B8(&qword_100035170);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v22);
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100028350(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_100030D60, a1, a2, &unk_100034778);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x28)
    return 40;
  else
    return v3;
}

uint64_t sub_1000283A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_100028490()
{
  uint64_t v0;

  return sub_100026964(v0);
}

uint64_t sub_100028498()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE **sub_1000284A8(_BYTE **result)
{
  uint64_t v1;
  _BYTE *v2;

  v2 = *result;
  *v2 = *(_BYTE *)(v1 + 16);
  *result = v2 + 1;
  return result;
}

uint64_t sub_1000284BC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000284CC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000284F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100028510(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_100026D44(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100028518()
{
  uint64_t v0;

  return sub_100026A54(v0);
}

uint64_t sub_100028520()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100028530()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100028540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_100028568(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  v3 = *a1 + 8;
  result = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v5, &v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1000285C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000070B8(&qword_100035148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100028608(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t getEnumTagSinglePayload for InviteQueryItem(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xD9)
    goto LABEL_17;
  if (a2 + 39 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 39) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 39;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 39;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 39;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x28;
  v8 = v6 - 40;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for InviteQueryItem(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 39 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 39) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD8)
    return ((uint64_t (*)(void))((char *)&loc_100028720 + 4 * byte_10002A75D[v4]))();
  *a1 = a2 + 39;
  return ((uint64_t (*)(void))((char *)sub_100028754 + 4 * byte_10002A758[v4]))();
}

uint64_t sub_100028754(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002875C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100028764);
  return result;
}

uint64_t sub_100028770(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100028778);
  *(_BYTE *)result = a2 + 39;
  return result;
}

uint64_t sub_10002877C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100028784(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InviteQueryItem()
{
  return &type metadata for InviteQueryItem;
}

ValueMetadata *type metadata accessor for Subscription()
{
  return &type metadata for Subscription;
}

unint64_t sub_1000287B4()
{
  unint64_t result;

  result = qword_100035168;
  if (!qword_100035168)
  {
    result = swift_getWitnessTable(&unk_10002A870, &type metadata for InviteQueryItem);
    atomic_store(result, (unint64_t *)&qword_100035168);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC28InviteMessageBubbleExtensionP33_DDC795A1FAE319D8F028D6D3AB1E13ED19ResourceBundleClass);
}

id objc_msgSend__presentAlertSheetWith_styles_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertSheetWith:styles:completion:");
}

id objc_msgSend__presentAlertSheetWithTitle_message_buttonTitles_styles_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertSheetWithTitle:message:buttonTitles:styles:completion:");
}
