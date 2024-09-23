void sub_100004ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100004AF8(uint64_t a1)
{
  Class result;

  sub_100004B4C();
  result = objc_getClass("TVRViewServiceConfigContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_1000121E4();
  qword_10001E810 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100004B4C()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_10001E818)
  {
    v2 = off_100018708;
    v3 = 0;
    qword_10001E818 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_10001E818)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_100004BF8(uint64_t a1)
{
  Class result;

  sub_100004B4C();
  result = objc_getClass("TVRViewServiceManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100012208();
  qword_10001E820 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100007258(v0, qword_10001E830);
  v1 = sub_100006FE4(v0, (uint64_t)qword_10001E830);
  v2 = sub_100007944();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100004CA8()
{
  return 0;
}

uint64_t sub_100004CB4()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_100004D00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _BYTE v7[24];

  v5 = v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate;
  swift_beginAccess(v5, v7, 1, 0);
  *(_QWORD *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign(v5, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_100004D68(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_100004DDC;
}

void sub_100004DDC(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48);
  *(_QWORD *)(v6 + 8) = v5;
  swift_unknownObjectWeakAssign(v6, v4);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease(v3[3]);
    swift_endAccess(v3);
  }
  else
  {
    swift_endAccess(v3);
    swift_unknownObjectRelease(v4);
  }
  free(v3);
}

uint64_t sub_100004E50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier);
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier, v4, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t sub_100004EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

uint64_t (*sub_100004F00(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100004F44()
{
  return 256;
}

uint64_t sub_100004F54()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode);
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode, v3, 0, 0);
  return *v1 | (v1[1] << 8);
}

uint64_t sub_100004FA0(__int16 a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  v3[1] = HIBYTE(a1) & 1;
  return result;
}

uint64_t (*sub_100004FF0(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_100005038()
{
  return 0;
}

void sub_100005040()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  NSString v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  Class isa;
  id v48;
  id v49;
  _QWORD v50[4];
  _QWORD aBlock[3];
  void *v52;
  void (*v53)();
  uint64_t v54;
  objc_super v55;

  v1 = v0;
  v55.receiver = v0;
  v55.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  objc_msgSendSuper2(&v55, "viewDidLoad");
  sub_100011608(0x415F50555F544553, (void *)0xEF56545F454C5050);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "setTitle:", v4);

  objc_msgSend(v1, "setDismissalType:", 3);
  sub_100011608(0x50555F544553, (void *)0xE600000000000000);
  v6 = v5;
  v7 = swift_allocObject(&unk_100018820, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, v1);
  swift_retain(v7);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v53 = sub_1000066E8;
  v54 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005734;
  v52 = &unk_100018838;
  v9 = _Block_copy(aBlock);
  v10 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v8, 0, v9);

  _Block_release(v9);
  v11 = v54;
  swift_release(v7);
  swift_release(v11);

  v12 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0xA0))();
  if ((v12 & 0x100) != 0 || *(_QWORD *)sub_100009094() != v12)
    v13 = 0xE700000000000000;
  else
    v13 = 0xEC0000003535324ALL;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  v49 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v14);

  v15 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v49);
  objc_msgSend(v15, "setContentMode:", 1);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = objc_msgSend(v1, "contentView");
  objc_msgSend(v16, "addSubview:", v15);

  sub_1000068AC(0, (unint64_t *)&qword_10001E378, NSLayoutConstraint_ptr);
  v52 = (void *)sub_1000068AC(0, &qword_10001E380, UIImageView_ptr);
  v50[3] = v52;
  aBlock[0] = v15;
  v50[0] = v15;
  v17 = v15;
  objc_msgSend(v17, "frame");
  v19 = v18;
  objc_msgSend(v17, "frame");
  v21 = sub_100005784(aBlock, 7, 0, v50, 8, v19 / v20, 0.0);
  objc_msgSend(v17, "addConstraint:", v21);

  v48 = (id)objc_opt_self(NSLayoutConstraint);
  v22 = sub_1000068E4(&qword_10001E388);
  v23 = swift_allocObject(v22, 72, 7);
  *(_OWORD *)(v23 + 16) = xmmword_100012C50;
  v24 = objc_msgSend(v17, "centerXAnchor");
  v25 = objc_msgSend(v1, "contentView");
  v26 = objc_msgSend(v25, "mainContentGuide");

  v27 = objc_msgSend(v26, "centerXAnchor");
  v28 = objc_msgSend(v24, "constraintEqualToAnchor:", v27);

  *(_QWORD *)(v23 + 32) = v28;
  v29 = objc_msgSend(v17, "centerYAnchor");
  v30 = objc_msgSend(v1, "contentView");
  v31 = objc_msgSend(v30, "mainContentGuide");

  v32 = objc_msgSend(v31, "centerYAnchor");
  v33 = objc_msgSend(v29, "constraintEqualToAnchor:", v32);

  *(_QWORD *)(v23 + 40) = v33;
  v34 = objc_msgSend(v17, "topAnchor");
  v35 = objc_msgSend(v1, "contentView");
  v36 = objc_msgSend(v35, "mainContentGuide");

  v37 = objc_msgSend(v36, "topAnchor");
  v38 = objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:", v37);

  *(_QWORD *)(v23 + 48) = v38;
  v39 = objc_msgSend(v17, "bottomAnchor");
  v40 = objc_msgSend(v1, "contentView");
  v41 = objc_msgSend(v40, "mainContentGuide");

  v42 = objc_msgSend(v41, "bottomAnchor");
  v43 = objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:", v42);

  *(_QWORD *)(v23 + 56) = v43;
  v44 = objc_msgSend(v17, "heightAnchor");
  v45 = objc_msgSend(v44, "constraintEqualToConstant:", 75.0);

  *(_QWORD *)(v23 + 64) = v45;
  aBlock[0] = v23;
  specialized Array._endMutation()();
  v46 = aBlock[0];
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v46);
  objc_msgSend(v48, "activateConstraints:", isa);

}

uint64_t type metadata accessor for TVSetupStartViewController()
{
  return objc_opt_self(_TtC16TVSetupUIService26TVSetupStartViewController);
}

void sub_100005734(uint64_t a1, void *a2)
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

id sub_100005784(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  id v27;
  uint64_t v29;
  uint64_t v30;

  v8 = v7;
  v16 = a1[3];
  v17 = sub_100007298(a1, v16);
  v18 = _bridgeAnythingToObjectiveC<A>(_:)(v17, v16);
  v19 = a4[3];
  if (v19)
  {
    v20 = sub_100007298(a4, a4[3]);
    v29 = a5;
    v30 = a2;
    v21 = a3;
    v22 = *(_QWORD *)(v19 - 8);
    __chkstk_darwin(v20, v20);
    v24 = (char *)&v29 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v22 + 16))(v24);
    v25 = _bridgeAnythingToObjectiveC<A>(_:)(v24, v19);
    v26 = *(void (**)(char *, uint64_t))(v22 + 8);
    a3 = v21;
    v26(v24, v19);
    a5 = v29;
    a2 = v30;
    sub_100007234(a4);
  }
  else
  {
    v25 = 0;
  }
  v27 = objc_msgSend((id)swift_getObjCClassFromMetadata(v8), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, a2, a3, v25, a5, a6, a7);
  swift_unknownObjectRelease(v18);
  swift_unknownObjectRelease(v25);
  sub_100007234(a1);
  return v27;
}

void sub_10000592C(char a1)
{
  void *v1;
  void *v2;
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  objc_super v12;

  v2 = v1;
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  objc_msgSendSuper2(&v12, "viewWillAppear:", a1 & 1);
  v4 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend((id)objc_opt_self(NSOperationQueue), "mainQueue");
  v7 = swift_allocObject(&unk_100018820, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, v2);
  v10[4] = sub_100006924;
  v11 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10000641C;
  v10[3] = &unk_100018860;
  v8 = _Block_copy(v10);
  swift_release(v11);
  v9 = objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v8);
  _Block_release(v8);
  swift_unknownObjectRelease(v9);

}

void sub_100005AA0(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  char *v16;
  uint64_t Strong;
  uint64_t (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t (*v30)(char *, uint64_t);
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char *v47;
  uint64_t (*v48)(char *, uint64_t);
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  unint64_t v65;
  uint64_t v66;
  char v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t ObjectType;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t (*v79)(char *, uint64_t);
  void (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85[5];
  __int128 v86;
  __int128 v87;
  char v88[32];

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  v7 = __chkstk_darwin(v4, v6);
  v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v7, v10);
  v13 = (char *)&v76 - v12;
  __chkstk_darwin(v11, v14);
  v16 = (char *)&v76 - v15;
  a2 += 16;
  swift_beginAccess(a2, v88, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v18 = (uint64_t (*)(char *, uint64_t))Strong;
    if (qword_10001E828 != -1)
      swift_once(&qword_10001E828, sub_100004C4C);
    v82 = v9;
    v19 = type metadata accessor for Logger(0);
    v20 = sub_100006FE4(v19, (uint64_t)qword_10001E830);
    v21 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v21(v16, a1, v4);
    v80 = v21;
    v22 = ((uint64_t (*)(char *, uint64_t, uint64_t))v21)(v13, a1, v4);
    v81 = v20;
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, (os_log_type_t)v24))
    {
      v77 = v24;
      v78 = a1;
      v79 = v18;
      v25 = swift_slowAlloc(22, -1);
      v76 = swift_slowAlloc(64, -1);
      v85[0] = v76;
      *(_DWORD *)v25 = 136315394;
      v26 = (void *)Notification.name.getter();
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v29 = v28;

      *(_QWORD *)&v86 = sub_1000069A4(v27, v29, v85);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, (char *)&v86 + 8, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease(v29);
      v30 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
      v31 = v30(v16, v4);
      *(_WORD *)(v25 + 12) = 2080;
      v32 = Notification.userInfo.getter(v31);
      if (!v32)
        v32 = sub_1000062F0((uint64_t)&_swiftEmptyArrayStorage);
      v33 = v32;
      v34 = Dictionary.description.getter(v32, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v36 = v35;
      swift_bridgeObjectRelease(v33);
      *(_QWORD *)&v86 = sub_1000069A4(v34, v36, v85);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, (char *)&v86 + 8, v25 + 14, v25 + 22);
      swift_bridgeObjectRelease(v36);
      v30(v13, v4);
      _os_log_impl((void *)&_mh_execute_header, v23, (os_log_type_t)v77, "Device setup notification: '%s', %s", (uint8_t *)v25, 0x16u);
      v37 = v76;
      swift_arrayDestroy(v76, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1, -1);
      swift_slowDealloc(v25, -1, -1);

      a1 = v78;
      v18 = v79;
    }
    else
    {
      v30 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
      v30(v16, v4);
      v30(v13, v4);

    }
    v38 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted;
    if ((*((_BYTE *)v18 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted) & 1) == 0)
    {
      v39 = (*(uint64_t (**)(void))((swift_isaMask & *(_QWORD *)v18) + 0x88))();
      if (v40)
      {
        v41 = v39;
        v42 = v40;
        v43 = Notification.userInfo.getter(v39);
        if (v43)
        {
          v44 = v43;
          v83 = 0x746553736465656ELL;
          v84 = 0xEA00000000007075;
          AnyHashable.init<A>(_:)(v85, &v83, &type metadata for String, &protocol witness table for String);
          if (*(_QWORD *)(v44 + 16) && (v45 = sub_100006FFC((uint64_t)v85), (v46 & 1) != 0))
          {
            sub_1000070A0(*(_QWORD *)(v44 + 56) + 32 * v45, (uint64_t)&v86);
          }
          else
          {
            v86 = 0u;
            v87 = 0u;
          }
          sub_10000702C((uint64_t)v85);
          if (*((_QWORD *)&v87 + 1))
          {
            if ((swift_dynamicCast(&v83, &v86, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0
              && v83 == 1)
            {

              swift_bridgeObjectRelease(v44);
LABEL_45:
              swift_bridgeObjectRelease(v42);
              return;
            }
          }
          else
          {
            sub_100007060((uint64_t)&v86);
          }
          v83 = 0x4449656369766564;
          v84 = 0xE800000000000000;
          AnyHashable.init<A>(_:)(v85, &v83, &type metadata for String, &protocol witness table for String);
          if (*(_QWORD *)(v44 + 16) && (v63 = sub_100006FFC((uint64_t)v85), (v64 & 1) != 0))
          {
            sub_1000070A0(*(_QWORD *)(v44 + 56) + 32 * v63, (uint64_t)&v86);
          }
          else
          {
            v86 = 0u;
            v87 = 0u;
          }
          swift_bridgeObjectRelease(v44);
          sub_10000702C((uint64_t)v85);
          if (!*((_QWORD *)&v87 + 1))
          {

            swift_bridgeObjectRelease(v42);
            sub_100007060((uint64_t)&v86);
            return;
          }
          if ((swift_dynamicCast(&v83, &v86, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
          {

            goto LABEL_45;
          }
          v65 = v84;
          if (v83 == v41 && v42 == v84)
          {
            swift_bridgeObjectRelease(v84);
            v66 = swift_bridgeObjectRelease(v42);
          }
          else
          {
            v67 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease(v65);
            v66 = swift_bridgeObjectRelease(v42);
            if ((v67 & 1) == 0)
            {
LABEL_51:

              return;
            }
          }
          v68 = Logger.logObject.getter(v66);
          v69 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v68, v69))
          {
            v70 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v70 = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, v69, "Setup started - auto dismissing.", v70, 2u);
            swift_slowDealloc(v70, -1, -1);
          }

          v71 = (*(uint64_t (**)(void))((swift_isaMask & *(_QWORD *)v18) + 0x70))();
          if (v71)
          {
            v73 = v71;
            v74 = v72;
            ObjectType = swift_getObjectType();
            (*(void (**)(uint64_t (*)(char *, uint64_t), uint64_t, uint64_t))(v74 + 16))(v18, ObjectType, v74);

            swift_unknownObjectRelease(v73);
            return;
          }
          goto LABEL_51;
        }
        swift_bridgeObjectRelease(v42);
      }
    }
    v79 = v30;
    v47 = v82;
    v80(v82, a1, v4);
    v48 = v18;
    v49 = Logger.logObject.getter(v48);
    v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = 7104878;
      v52 = swift_slowAlloc(28, -1);
      v81 = swift_slowAlloc(64, -1);
      v85[0] = v81;
      *(_DWORD *)v52 = 67109634;
      LODWORD(v86) = *((unsigned __int8 *)v18 + v38);
      v53 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, (char *)&v86 + 4, v52 + 4, v52 + 8);
      *(_WORD *)(v52 + 8) = 2080;
      v54 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *(_QWORD *)v48) + 0x88))(v53);
      if (!v55)
        v54 = 7104878;
      v56 = 0xE300000000000000;
      if (v55)
        v57 = v55;
      else
        v57 = 0xE300000000000000;
      *(_QWORD *)&v86 = sub_1000069A4(v54, v57, v85);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, (char *)&v86 + 8, v52 + 10, v52 + 18);

      v58 = swift_bridgeObjectRelease(v57);
      *(_WORD *)(v52 + 18) = 2080;
      v59 = Notification.userInfo.getter(v58);
      if (v59)
      {
        v60 = v59;
        v51 = Dictionary.description.getter(v59, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
        v56 = v61;
        swift_bridgeObjectRelease(v60);
      }
      *(_QWORD *)&v86 = sub_1000069A4(v51, v56, v85);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, (char *)&v86 + 8, v52 + 20, v52 + 28);
      swift_bridgeObjectRelease(v56);
      v79(v82, v4);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed to handle device setup notification: isStarted=%{BOOL}d, deviceIdentifier=%s, userInfo=%s", (uint8_t *)v52, 0x1Cu);
      v62 = v81;
      swift_arrayDestroy(v81, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v52, -1, -1);

    }
    else
    {

      v79(v47, v4);
    }

  }
}

unint64_t sub_1000062F0(uint64_t a1)
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
  sub_1000068E4((uint64_t *)&unk_10001E530);
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
    sub_1000070DC(v7, (uint64_t)v16);
    result = sub_100006FFC((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100007124(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_10000641C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_100006500(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithContentView:", a1);

  return v3;
}

id sub_100006540(void *a1)
{
  _BYTE *v1;
  char *v3;
  _QWORD *v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate];
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3, 0);
  v4 = &v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier];
  *v4 = 0;
  v4[1] = 0;
  *(_WORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode] = 256;
  v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  v5 = objc_msgSendSuper2(&v7, "initWithContentView:", a1);

  return v5;
}

id sub_100006658()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000066C4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000066E8()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  _BYTE v15[24];

  swift_beginAccess(v0 + 16, v15, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = (_QWORD *)Strong;
    if ((*(_BYTE *)(Strong + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted) & 1) == 0)
    {
      *(_BYTE *)(Strong + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted) = 1;
      if (qword_10001E828 != -1)
        swift_once(&qword_10001E828, sub_100004C4C);
      v3 = type metadata accessor for Logger(0);
      sub_100006FE4(v3, (uint64_t)qword_10001E830);
      v4 = Logger.logObject.getter();
      v5 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Tapped start button", v6, 2u);
        swift_slowDealloc(v6, -1, -1);
      }

      sub_100011608(0x495443454E4E4F43, (void *)0xEA0000000000474ELL);
      v8 = v7;
      v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v8);
      objc_msgSend(v2, "showActivityIndicatorWithStatus:", v9);

      v10 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x70))();
      if (v10)
      {
        v12 = v10;
        v13 = v11;
        ObjectType = swift_getObjectType();
        (*(void (**)(_QWORD *, uint64_t, uint64_t))(v13 + 8))(v2, ObjectType, v13);
        swift_unknownObjectRelease(v12);
      }
    }

  }
}

uint64_t sub_100006894(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000068A4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000068AC(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000068E4(uint64_t *a1)
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

void sub_100006924(uint64_t a1)
{
  uint64_t v1;

  sub_100005AA0(a1, v1);
}

uint64_t sub_10000692C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

void type metadata accessor for SFDeviceModelCode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10001E3C0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100018898);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001E3C0);
  }
}

uint64_t sub_1000069A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100006A74(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000070A0((uint64_t)v12, *a3);
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
      sub_1000070A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100007234(v12);
  return v7;
}

uint64_t sub_100006A74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100006C2C(a5, a6);
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

uint64_t sub_100006C2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100006CC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100006E98(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100006E98(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100006CC0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100006E34(v4, 0);
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

_QWORD *sub_100006E34(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000068E4(&qword_10001E3D8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006E98(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000068E4(&qword_10001E3D8);
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

uint64_t sub_100006FE4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_100006FFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100007134(a1, v4);
}

uint64_t sub_10000702C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100007060(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000068E4(&qword_10001E3C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000070A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000070DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000068E4(&qword_10001E3D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100007124(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100007134(uint64_t a1, uint64_t a2)
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
      sub_1000071F8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000702C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000071F8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100007234(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *sub_100007258(uint64_t a1, uint64_t *a2)
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

_QWORD *sub_100007298(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_1000072BC()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1000072D8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_100007324(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _BYTE v7[24];

  v5 = v2 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate;
  swift_beginAccess(v5, v7, 1, 0);
  *(_QWORD *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign(v5, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_10000738C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_100004DDC;
}

uint64_t sub_100007400(char a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  objc_msgSendSuper2(&v10, "viewWillAppear:", a1 & 1);
  sub_100011608(0x49544E4548545541, (void *)0xEE004E4F49544143);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v1, "setTitle:", v5);

  sub_100011608(0xD00000000000001BLL, (void *)0x8000000100015870);
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v1, "setSubtitle:", v8);

  objc_msgSend(v1, "setDismissalType:", 1);
  return (*(uint64_t (**)(_QWORD))((swift_isaMask & *v1) + 0x70))(0);
}

uint64_t type metadata accessor for TVSetupAuthViewController()
{
  return objc_opt_self(_TtC16TVSetupUIService25TVSetupAuthViewController);
}

void sub_100007574(int a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  id v8;
  NSString v9;

  objc_msgSend(v1, "hideActivityIndicator");
  if ((a1 & 0x10000) != 0)
  {
    v4 = 0xD00000000000001DLL;
    v3 = (void *)0x8000000100015890;
  }
  else
  {
    v3 = (void *)0x8000000100015870;
    v4 = 0xD00000000000001BLL;
  }
  sub_100011608(v4, v3);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v1, "setSubtitle:", v7);

  v8 = objc_msgSend(v1, "passcodeEntryView");
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "setText:", v9);

}

uint64_t sub_100007664(void *a1)
{
  _QWORD *v1;
  NSString v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  objc_msgSendSuper2(&v13, "didCompleteTextEntry:", a1);
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "showActivityIndicatorWithStatus:", v3);

  result = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x58))();
  if (result)
  {
    v6 = result;
    v7 = v5;
    ObjectType = swift_getObjectType();
    v9 = objc_msgSend(a1, "text");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;

    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(v1, v10, v12, ObjectType, v7);
    swift_bridgeObjectRelease(v12);
    return swift_unknownObjectRelease(v6);
  }
  return result;
}

id sub_1000077C4(void *a1)
{
  char *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate];
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3, 0);
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  v4 = objc_msgSendSuper2(&v6, "initWithContentView:", a1);

  return v4;
}

id sub_100007884()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000078C4(uint64_t a1)
{
  return sub_100007B00(a1, qword_10001EBD0, 0xD00000000000001ALL, 0x80000001000159C0);
}

uint64_t sub_1000078E8()
{
  return sub_100007960(&qword_10001E848, (uint64_t)qword_10001EBD0);
}

uint64_t sub_100007904@<X0>(uint64_t a1@<X8>)
{
  return sub_1000079BC(&qword_10001E848, (uint64_t)qword_10001EBD0, (uint64_t)sub_1000078C4, a1);
}

uint64_t sub_100007920(uint64_t a1)
{
  return sub_100007B00(a1, qword_10001EBE8, 0xD00000000000001ALL, 0x80000001000159A0);
}

uint64_t sub_100007944()
{
  return sub_100007960(&qword_10001E850, (uint64_t)qword_10001EBE8);
}

uint64_t sub_100007960(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger(0);
  return sub_100006FE4(v3, a2);
}

uint64_t sub_1000079A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000079BC(&qword_10001E850, (uint64_t)qword_10001EBE8, (uint64_t)sub_100007920, a1);
}

uint64_t sub_1000079BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100006FE4(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a4, v7, v6);
}

uint64_t sub_100007A24(uint64_t a1)
{
  return sub_100007B00(a1, qword_10001EC00, 0xD00000000000001DLL, 0x8000000100015980);
}

uint64_t sub_100007A48()
{
  return sub_100007960(&qword_10001E858, (uint64_t)qword_10001EC00);
}

uint64_t sub_100007A64@<X0>(uint64_t a1@<X8>)
{
  return sub_1000079BC(&qword_10001E858, (uint64_t)qword_10001EC00, (uint64_t)sub_100007A24, a1);
}

uint64_t sub_100007A80(uint64_t a1)
{
  return sub_100007B00(a1, qword_10001EC18, 0xD000000000000019, 0x8000000100015960);
}

uint64_t sub_100007AA4()
{
  return sub_100007960(&qword_10001E860, (uint64_t)qword_10001EC18);
}

uint64_t sub_100007AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000079BC(&qword_10001E860, (uint64_t)qword_10001EC18, (uint64_t)sub_100007A80, a1);
}

uint64_t sub_100007ADC(uint64_t a1)
{
  return sub_100007B00(a1, qword_10001EC30, 0xD000000000000029, 0x8000000100015930);
}

uint64_t sub_100007B00(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_100007258(v7, a2);
  sub_100006FE4(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD00000000000001ALL, 0x8000000100015910, a3, a4);
}

uint64_t sub_100007B74()
{
  return sub_100007960(&qword_10001E868, (uint64_t)qword_10001EC30);
}

uint64_t sub_100007B90@<X0>(uint64_t a1@<X8>)
{
  return sub_1000079BC(&qword_10001E868, (uint64_t)qword_10001EC30, (uint64_t)sub_100007ADC, a1);
}

uint64_t sub_100007BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100007258(v0, qword_10001E878);
  v1 = sub_100006FE4(v0, (uint64_t)qword_10001E878);
  v2 = sub_100007A48();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100007C08()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode);
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode, v3, 0, 0);
  return *v1 | (v1[1] << 8);
}

uint64_t sub_100007C54(__int16 a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  v3[1] = HIBYTE(a1) & 1;
  return result;
}

uint64_t (*sub_100007CA4(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode, a1, 33, 0);
  return j__swift_endAccess;
}

void sub_100007CE8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  __int16 v6;
  unint64_t v7;
  NSString v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  Class isa;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45[3];
  uint64_t v46;
  objc_super v47;

  v1 = v0;
  v47.receiver = v0;
  v47.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  objc_msgSendSuper2(&v47, "viewDidLoad");
  sub_100011608(0xD000000000000013, (void *)0x80000001000159E0);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "setTitle:", v4);

  v5 = objc_msgSend(v1, "setDismissalType:", 1);
  v6 = (*(uint64_t (**)(id))((swift_isaMask & *v1) + 0x58))(v5);
  if ((v6 & 0x100) != 0 || *(_QWORD *)sub_100009094() != v6)
    v7 = 0xE700000000000000;
  else
    v7 = 0xEC0000003535324ALL;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v43 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v8);

  v9 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v43);
  objc_msgSend(v9, "setContentMode:", 1);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = objc_msgSend(v1, "contentView");
  objc_msgSend(v10, "addSubview:", v9);

  sub_1000068AC(0, (unint64_t *)&qword_10001E378, NSLayoutConstraint_ptr);
  v46 = sub_1000068AC(0, &qword_10001E380, UIImageView_ptr);
  v44[3] = v46;
  v45[0] = v9;
  v44[0] = v9;
  v11 = v9;
  objc_msgSend(v11, "frame");
  v13 = v12;
  objc_msgSend(v11, "frame");
  v15 = sub_100005784(v45, 7, 0, v44, 8, v13 / v14, 0.0);
  objc_msgSend(v11, "addConstraint:", v15);

  v42 = (id)objc_opt_self(NSLayoutConstraint);
  v16 = sub_1000068E4(&qword_10001E388);
  v17 = swift_allocObject(v16, 72, 7);
  *(_OWORD *)(v17 + 16) = xmmword_100012C50;
  v18 = objc_msgSend(v11, "centerXAnchor");
  v19 = objc_msgSend(v1, "contentView");
  v20 = objc_msgSend(v19, "mainContentGuide");

  v21 = objc_msgSend(v20, "centerXAnchor");
  v22 = objc_msgSend(v18, "constraintEqualToAnchor:", v21);

  *(_QWORD *)(v17 + 32) = v22;
  v23 = objc_msgSend(v11, "centerYAnchor");
  v24 = objc_msgSend(v1, "contentView");
  v25 = objc_msgSend(v24, "mainContentGuide");

  v26 = objc_msgSend(v25, "centerYAnchor");
  v27 = objc_msgSend(v23, "constraintEqualToAnchor:", v26);

  *(_QWORD *)(v17 + 40) = v27;
  v28 = objc_msgSend(v11, "topAnchor");
  v29 = objc_msgSend(v1, "contentView");
  v30 = objc_msgSend(v29, "mainContentGuide");

  v31 = objc_msgSend(v30, "topAnchor");
  v32 = objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v31);

  *(_QWORD *)(v17 + 48) = v32;
  v33 = objc_msgSend(v11, "bottomAnchor");
  v34 = objc_msgSend(v1, "contentView");
  v35 = objc_msgSend(v34, "mainContentGuide");

  v36 = objc_msgSend(v35, "bottomAnchor");
  v37 = objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v36);

  *(_QWORD *)(v17 + 56) = v37;
  v38 = objc_msgSend(v11, "heightAnchor");
  v39 = objc_msgSend(v38, "constraintEqualToConstant:", 75.0);

  *(_QWORD *)(v17 + 64) = v39;
  v45[0] = (id)v17;
  specialized Array._endMutation()();
  v40 = (uint64_t)v45[0];
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v40);
  objc_msgSend(v42, "activateConstraints:", isa);

}

uint64_t type metadata accessor for TVSetupProgressViewController()
{
  return objc_opt_self(_TtC16TVSetupUIService29TVSetupProgressViewController);
}

void sub_1000082E8(char a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  objc_msgSendSuper2(&v6, "viewWillAppear:", a1 & 1);
  sub_100011608(0x5F474E4954544553, (void *)0xEA00000000005055);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v1, "showActivityIndicatorWithStatus:", v5);

}

void sub_10000841C(int a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSString v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  NSString v27;
  uint64_t v28;
  uint64_t v29;

  v2 = v1;
  if (qword_10001E870 != -1)
    swift_once(&qword_10001E870, sub_100007BAC);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100006FE4(v4, (uint64_t)qword_10001E878);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v29 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_100008894(a1);
    v11 = String.init(cString:)(v10);
    v13 = v12;
    v28 = sub_1000069A4(v11, v12, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "handleProgressEvent: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  switch(a1)
  {
    case 200:
      v14 = String._bridgeToObjectiveC()();
      v15 = (id)SFLocalizableWAPIStringKeyForKey();

      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v18 = v17;

      sub_100011608(v16, v18);
      v20 = v19;
      swift_bridgeObjectRelease(v18);
      goto LABEL_20;
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 211:
    case 212:
    case 213:
    case 214:
    case 215:
    case 216:
    case 217:
    case 218:
    case 219:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
    case 231:
    case 232:
    case 233:
    case 235:
      return;
    case 210:
      v21 = 0x415649544341;
      goto LABEL_11;
    case 220:
      v22 = 0xD000000000000011;
      v24 = "SETTING_UP_ICLOUD";
      goto LABEL_15;
    case 230:
      v25 = "WAITING_FOR_HOMEKIT";
      goto LABEL_17;
    case 234:
      v22 = 0xD000000000000012;
      v24 = "SETTING_UP_HOMEKIT";
LABEL_15:
      v23 = (void *)((unint64_t)(v24 - 32) | 0x8000000000000000);
      goto LABEL_19;
    case 236:
      v25 = "SETTING_UP_SECURITY";
LABEL_17:
      v23 = (void *)((unint64_t)(v25 - 32) | 0x8000000000000000);
      v22 = 0xD000000000000013;
      goto LABEL_19;
    default:
      if (a1 == 80)
      {
        v23 = (void *)0xEA00000000005055;
        v22 = 0x5F474E4954544553;
      }
      else
      {
        if (a1 != 35)
          return;
        v21 = 0x43454E4E4F43;
LABEL_11:
        v22 = v21 & 0xFFFFFFFFFFFFLL | 0x4954000000000000;
        v23 = (void *)0xEA0000000000474ELL;
      }
LABEL_19:
      sub_100011608(v22, v23);
      v20 = v26;
LABEL_20:
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v20);
      objc_msgSend(v2, "showActivityIndicatorWithStatus:", v27);

      return;
  }
}

id sub_1000087B4(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_WORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode] = 256;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  v3 = objc_msgSendSuper2(&v5, "initWithContentView:", a1);

  return v3;
}

id sub_100008864()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

const char *sub_100008894(int a1)
{
  const char *result;

  if (a1 > 299)
  {
    if (a1 <= 799)
    {
      if (a1 <= 519)
      {
        if (a1 <= 410)
        {
          if (a1 <= 399)
          {
            if (a1 == 300)
              return "BackupProgress";
            if (a1 == 310)
              return "SyncProgress";
          }
          else
          {
            switch(a1)
            {
              case 400:
                return "StopSetup";
              case 401:
                return "PINPair";
              case 410:
                return "MigrateStart";
            }
          }
        }
        else if (a1 > 430)
        {
          switch(a1)
          {
            case 431:
              return "eSimExternal2FAStop";
            case 500:
              return "SiriWelcome";
            case 510:
              return "SiriDialogA";
          }
        }
        else
        {
          switch(a1)
          {
            case 411:
              return "MigrateStop";
            case 420:
              return "FileTransferReady";
            case 430:
              return "eSimExternal2FAStart";
          }
        }
      }
      else if (a1 > 559)
      {
        if (a1 > 599)
        {
          switch(a1)
          {
            case 600:
              return "SiriSkipDemo";
            case 700:
              return "StopSetupLEDs";
            case 710:
              return "AudioPasscodeEnded";
          }
        }
        else
        {
          switch(a1)
          {
            case 560:
              return "SiriDialogCMusic";
            case 570:
              return "SiriDialogCNews";
            case 580:
              return "SiriDialogCWeather";
          }
        }
      }
      else if (a1 > 549)
      {
        switch(a1)
        {
          case 550:
            return "SiriDialogBWeather";
          case 555:
            return "SiriDialogBClock";
          case 558:
            return "SiriDialogBMusic";
        }
      }
      else
      {
        switch(a1)
        {
          case 520:
            return "SiriDialogBStart";
          case 530:
            return "SiriDialogBHome";
          case 540:
            return "SiriDialogBNews";
        }
      }
      return "?";
    }
    if (a1 > 999)
    {
      if (a1 <= 1099)
      {
        if (a1 == 1000)
          return "SecureIntentStart";
        if (a1 == 1001)
          return "SecureIntentFinish";
      }
      else
      {
        switch(a1)
        {
          case 1100:
            return "OneTimeCodeDetected";
          case 2000:
            return "DependentStart";
          case 2001:
            return "DependentEnd";
        }
      }
      return "?";
    }
    switch(a1)
    {
      case 900:
        result = "SU-No-SetupScanAttempt";
        break;
      case 901:
        result = "SU-No-SetupStatusUpdate";
        break;
      case 902:
        result = "SU-No-SetupWipeWifi";
        break;
      case 903:
        result = "SU-No-SetupCancelled";
        break;
      case 904:
        result = "SU-No-SetupObliterate";
        break;
      case 905:
        result = "SU-No-SetupCannotCancel";
        break;
      case 906:
        result = "SysDrop AirDrop Event";
        break;
      case 907:
        result = "SysDrop Sysdiagnose Event";
        break;
      case 908:
        result = "SysDrop Cancel Event";
        break;
      case 909:
        result = "File Transfer Progress Event";
        break;
      case 910:
        result = "File Transfer Completed Event";
        break;
      case 911:
        result = "iOSWiFiSetup";
        break;
      case 912:
        result = "HKPrimaryResidentSSIDFetchStart";
        break;
      default:
        switch(a1)
        {
          case 800:
            result = "AuthAccountsStart";
            break;
          case 803:
            result = "AuthAccountsiCloudProgress";
            break;
          case 804:
            result = "AuthAccountsStoreProgress";
            break;
          case 805:
            result = "AuthAccountsGameCenterProgress";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  else if (a1 > 129)
  {
    if (a1 > 249)
    {
      switch(a1)
      {
        case 260:
          result = "TVLSStart";
          break;
        case 261:
        case 262:
        case 263:
        case 265:
        case 266:
        case 267:
        case 268:
        case 269:
        case 271:
        case 273:
        case 275:
          return "?";
        case 264:
          result = "TVLSFinish";
          break;
        case 270:
          result = "TVLSEstimateStart";
          break;
        case 272:
          result = "TVLSEstimateFinal";
          break;
        case 274:
          result = "TVLSEstimateFailed";
          break;
        case 276:
          result = "TVLSTryAgain";
          break;
        case 277:
          result = "TVLSToneBegan";
          break;
        case 278:
          result = "TVLCalStart";
          break;
        case 279:
          result = "TVLCalStep";
          break;
        case 280:
          result = "TVLCalFailed";
          break;
        case 281:
          result = "TVLCalTryAgain";
          break;
        case 282:
          result = "TVLCalFinal";
          break;
        default:
          if (a1 != 250)
            return "?";
          result = "ReportSuccess";
          break;
      }
    }
    else
    {
      if (a1 <= 219)
      {
        if (a1 <= 149)
        {
          if (a1 == 130)
            return "WiFiPoweredOff";
          if (a1 == 140)
            return "RecognizeVoice";
        }
        else
        {
          switch(a1)
          {
            case 150:
              return "SiriForEveryone";
            case 200:
              return "WiFiStart";
            case 210:
              return "ActivationStart";
          }
        }
        return "?";
      }
      switch(a1)
      {
        case 230:
          return "HomeKitStart";
        case 231:
        case 232:
        case 233:
        case 235:
        case 237:
        case 238:
        case 239:
          return "?";
        case 234:
          return "HomeKitSetupStart";
        case 236:
          return "CDPSetupStart";
        case 240:
          return "BuddyStarting";
        case 241:
          return "BuddyProgress";
        case 242:
          return "BuddyFinished";
        default:
          if (a1 == 220)
          {
            result = "iCloudStart";
          }
          else
          {
            if (a1 != 224)
              return "?";
            result = "AppleIDSetupStart";
          }
          break;
      }
    }
  }
  else
  {
    if (a1 <= 79)
    {
      if (a1 > 49)
      {
        if (a1 > 64)
        {
          if (a1 == 65)
            return "SecurityAPCLoopStart";
          if (a1 == 70)
            return "SecurityFinish";
        }
        else
        {
          if (a1 == 50)
            return "PreAuthFinish";
          if (a1 == 60)
            return "SecurityStart";
        }
      }
      else
      {
        if (a1 > 29)
        {
          switch(a1)
          {
            case 30:
              result = "Error";
              break;
            case 31:
              result = "SessionStarted";
              break;
            case 32:
              result = "SessionEnded";
              break;
            case 33:
              result = "SessionSecured";
              break;
            case 35:
              result = "ConnectStart";
              break;
            case 40:
              result = "PreAuthStart";
              break;
            default:
              return "?";
          }
          return result;
        }
        switch(a1)
        {
          case 0:
            return "Invalid";
          case 10:
            return "Start";
          case 20:
            return "Final";
        }
      }
      return "?";
    }
    if (a1 > 119)
    {
      switch(a1)
      {
        case 'x':
          return "CheckingiCloud";
        case 'z':
          return "CheckingAppleMusic";
        case '|':
          return "CheckingAccount";
      }
      return "?";
    }
    switch(a1)
    {
      case 'P':
        result = "BasicConfigStart";
        break;
      case 'Z':
        result = "BasicConfigFinish";
        break;
      case '\\':
        result = "StepStart";
        break;
      case '^':
        result = "StepFinish";
        break;
      case '_':
        result = "PreFinish";
        break;
        result = "SetupFinished";
        break;
      case 'a':
        result = "SetupResumed";
        break;
      case 'b':
        result = "SetupSuspend";
        break;
      case 'c':
        result = "SetupPeerSWUpdate";
        break;
      case 'd':
        result = "Finished";
        break;
      default:
        return "?";
    }
  }
  return result;
}

uint64_t sub_100009010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100007258(v0, qword_10001E898);
  v1 = sub_100006FE4(v0, (uint64_t)qword_10001E898);
  v2 = sub_1000078E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_10000906C()
{
  byte_10001E8B8 = 1;
  qword_10001E8C0 = 0xEF65646F436C6564;
}

void *sub_100009094()
{
  return &unk_100012EA8;
}

uint64_t sub_1000090A0()
{
  return 0;
}

uint64_t sub_1000090A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_1000090E4()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  v1 = objc_msgSend(v0, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_10000D174((uint64_t)v11, (uint64_t)v12);
  if (v13)
  {
    v3 = sub_1000068E4((uint64_t *)&unk_10001E5A0);
    if ((swift_dynamicCast(&v10, v12, (char *)&type metadata for Any + 8, v3, 6) & 1) != 0)
      return v10;
  }
  else
  {
    sub_10000CEB4((uint64_t)v12, &qword_10001E3C8);
  }
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_100006FE4(v5, (uint64_t)qword_10001E898);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Could not get remote view controller proxy", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  return 0;
}

void *sub_100009254(void *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (**v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _DWORD *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *result;
  id v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  _DWORD *v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  _BYTE *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  uint64_t (*v52)(_QWORD);
  void (**v53)(char *, uint64_t, uint64_t);
  char *v54;
  id v55;
  int v56;
  _QWORD v57[2];
  void *v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;

  v4 = v3;
  v8 = sub_1000068E4((uint64_t *)&unk_10001E440);
  __chkstk_darwin(v8, v9);
  v11 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Logger(0);
  v13 = *(void (***)(char *, uint64_t, uint64_t))(v12 - 8);
  __chkstk_darwin(v12, v14);
  v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v17 = sub_100006FE4(v12, (uint64_t)qword_10001E898);
  v13[2](v16, v17, v12);
  v18 = a1;
  v19 = Logger.logObject.getter(v18);
  v56 = static os_log_type_t.default.getter();
  v20 = os_log_type_enabled(v19, (os_log_type_t)v56);
  v54 = v11;
  if (!v20)
  {

    ((void (*)(char *, uint64_t))v13[1])(v16, v12);
    if (a1)
      goto LABEL_11;
    __break(1u);
    goto LABEL_9;
  }
  v53 = v13;
  v55 = v18;
  v18 = (_DWORD *)swift_slowAlloc(12, -1);
  result = (void *)swift_slowAlloc(32, -1);
  v58 = result;
  *v18 = 136315138;
  if (!a1)
  {
    __break(1u);
    return result;
  }
  v13 = (void (**)(char *, uint64_t, uint64_t))result;
  v51[0] = v4;
  v22 = objc_msgSend(v55, "userInfo");
  v51[1] = a3;
  v52 = a2;
  if (!v22)
  {
LABEL_9:
    v24 = sub_1000062F0((uint64_t)&_swiftEmptyArrayStorage);
    goto LABEL_10;
  }
  v23 = v22;
  v24 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v22, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

LABEL_10:
  v25 = Dictionary.description.getter(v24, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v27 = v26;
  swift_bridgeObjectRelease(v24);
  *(_QWORD *)&v60 = sub_1000069A4(v25, v27, (uint64_t *)&v58);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, (char *)&v60 + 8, v18 + 1, v18 + 3);
  v28 = v55;

  swift_bridgeObjectRelease(v27);
  _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v56, "Main configuration: %s", (uint8_t *)v18, 0xCu);
  swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v13, -1, -1);
  v29 = v18;
  v18 = v28;
  swift_slowDealloc(v29, -1, -1);

  ((void (*)(char *, uint64_t))v53[1])(v16, v12);
  a2 = v52;
  v4 = v51[0];
LABEL_11:
  v30 = objc_msgSend(v18, "userInfo");
  if (!v30)
  {
    v60 = 0u;
    v61 = 0u;
LABEL_20:
    sub_10000CEB4((uint64_t)&v60, &qword_10001E3C8);
    goto LABEL_21;
  }
  v31 = v30;
  v32 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v30, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v57[0] = 0xD000000000000010;
  v57[1] = 0x8000000100015600;
  AnyHashable.init<A>(_:)(&v58, v57, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v32 + 16) && (v33 = sub_100006FFC((uint64_t)&v58), (v34 & 1) != 0))
  {
    sub_1000070A0(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)&v60);
  }
  else
  {
    v60 = 0u;
    v61 = 0u;
  }
  sub_10000702C((uint64_t)&v58);
  swift_bridgeObjectRelease(v32);
  if (!*((_QWORD *)&v61 + 1))
    goto LABEL_20;
  if ((swift_dynamicCast(&v58, &v60, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
  {
    v35 = v59;
    v36 = (uint64_t)v54;
    UUID.init(uuidString:)(v58, v59);
    swift_bridgeObjectRelease(v35);
    v37 = v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier;
    swift_beginAccess(v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier, &v58, 33, 0);
    sub_10000CE70(v36, v37, (uint64_t *)&unk_10001E440);
    swift_endAccess(&v58);
  }
LABEL_21:
  v38 = objc_msgSend(v18, "userInfo");
  if (!v38)
  {
    v60 = 0u;
    v61 = 0u;
LABEL_34:
    sub_10000CEB4((uint64_t)&v60, &qword_10001E3C8);
    goto LABEL_35;
  }
  v39 = v38;
  v40 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v38, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  if (qword_10001E8B0 != -1)
    swift_once(&qword_10001E8B0, sub_10000906C);
  v41 = 0x6F4D656369766564;
  if (!byte_10001E8B8)
    v41 = 0;
  *(_QWORD *)&v60 = v41;
  *((_QWORD *)&v60 + 1) = qword_10001E8C0;
  swift_bridgeObjectRetain(qword_10001E8C0);
  AnyHashable.init<A>(_:)(&v58, &v60, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v40 + 16) && (v42 = sub_100006FFC((uint64_t)&v58), (v43 & 1) != 0))
  {
    sub_1000070A0(*(_QWORD *)(v40 + 56) + 32 * v42, (uint64_t)&v60);
  }
  else
  {
    v60 = 0u;
    v61 = 0u;
  }
  sub_10000702C((uint64_t)&v58);
  swift_bridgeObjectRelease(v40);
  if (!*((_QWORD *)&v61 + 1))
    goto LABEL_34;
  if (!swift_dynamicCast(&v58, &v60, (char *)&type metadata for Any + 8, &type metadata for UInt8, 6))
  {
LABEL_35:
    v44 = 0;
    goto LABEL_36;
  }
  v44 = (char)v58;
LABEL_36:
  v45 = (_BYTE *)(v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode);
  *v45 = v44;
  v45[1] = 0;
  v46 = objc_msgSend(v18, "userInfo");
  if (v46)
  {
    v47 = v46;
    v48 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v46, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  }
  else
  {
    v48 = 0;
  }
  v49 = *(_QWORD *)(v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo) = v48;
  swift_bridgeObjectRelease(v49);
  result = (void *)sub_1000090E4();
  if (result)
  {
    v50 = result;
    objc_msgSend(result, "setAllowsAlertStacking:", 1);
    result = (void *)swift_unknownObjectRelease(v50);
  }
  if (a2)
    return (void *)a2(result);
  return result;
}

unint64_t sub_100009890(uint64_t a1)
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
  sub_1000068E4(&qword_10001E518);
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
    sub_10000D130(v7, (uint64_t)&v16, (uint64_t *)&unk_10001E520);
    v8 = v16;
    v9 = v17;
    result = sub_10000C5D0(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100007124(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_100009A84()
{
  uint64_t v0;

  return PRXSupportedInterfaceOrientations(v0, 0);
}

void *sub_100009A90(char a1)
{
  void *v1;
  void *result;
  void *v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TVSetupAlertViewController(0);
  objc_msgSendSuper2(&v5, "viewWillAppear:", a1 & 1);
  result = (void *)sub_1000090E4();
  if (result)
  {
    v4 = result;
    objc_msgSend(result, "setStatusBarHidden:withDuration:", 1, 0.0);
    return (void *)swift_unknownObjectRelease(v4);
  }
  return result;
}

void sub_100009B8C(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t started;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  void (*v32)(char *, _UNKNOWN **);
  _QWORD *v33;
  char *v34;
  _QWORD *v35;
  int v36;
  int v37;
  void (*v38)(_QWORD);
  _QWORD *v39;
  id v40;
  void *v41;
  char v43[24];
  objc_super v44;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = &v43[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = sub_1000068E4((uint64_t *)&unk_10001E440);
  __chkstk_darwin(v9, v10);
  v12 = &v43[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v13 = (objc_class *)type metadata accessor for TVSetupAlertViewController(0);
  v44.receiver = v2;
  v44.super_class = v13;
  objc_msgSendSuper2(&v44, "viewDidAppear:", a1 & 1);
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v14 = type metadata accessor for Logger(0);
  v15 = sub_100006FE4(v14, (uint64_t)qword_10001E898);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "viewDidAppear(_:)", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  started = type metadata accessor for TVSetupStartViewController();
  v20 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(started)), "init");
  v21 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController;
  v22 = *(void **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController];
  *(_QWORD *)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController] = v20;

  v23 = *(_QWORD **)&v2[v21];
  if (!v23)
    goto LABEL_13;
  v24 = (uint64_t)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier];
  swift_beginAccess(&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier], v43, 0, 0);
  sub_10000D130(v24, (uint64_t)v12, (uint64_t *)&unk_10001E440);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4))
  {
    v25 = v23;
    sub_10000CEB4((uint64_t)v12, (uint64_t *)&unk_10001E440);
    v26 = 0;
    v27 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v12, v4);
    v28 = v23;
    v29 = sub_10000CEB4((uint64_t)v12, (uint64_t *)&unk_10001E440);
    v26 = UUID.uuidString.getter(v29);
    v27 = v30;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v23) + 0x90))(v26, v27);

  v31 = *(_QWORD **)&v2[v21];
  if (!v31)
    goto LABEL_13;
  v32 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v31) + 0x78);
  v33 = v31;
  v34 = v2;
  v32(v2, &off_1000188F8);

  v35 = *(_QWORD **)&v2[v21];
  if (!v35)
    goto LABEL_13;
  v36 = v34[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode];
  v37 = v34[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode + 1];
  v38 = *(void (**)(_QWORD))((swift_isaMask & *v35) + 0xA8);
  v39 = v35;
  v38(v36 | (v37 << 8));

  if (*(_QWORD *)&v2[v21])
  {
    v40 = objc_msgSend(v34, "presentProxCardFlowWithDelegate:initialViewController:", v34);
    v41 = *(void **)&v34[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    *(_QWORD *)&v34[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController] = v40;

  }
  else
  {
LABEL_13:
    __break(1u);
  }
}

id sub_100009F18(char a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  void *v10;
  NSString v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  objc_super v16;

  v2 = v1;
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100006FE4(v4, (uint64_t)qword_10001E898);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "viewDidDisappear(_:)", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9 = sub_1000090E4();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = String._bridgeToObjectiveC()();
    objc_msgSend(v10, "setIdleTimerDisabled:forReason:", 0, v11);

    v9 = swift_unknownObjectRelease(v10);
  }
  if ((v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] & 1) == 0)
  {
    v12 = Logger.logObject.getter(v9);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Main disappeared without dismiss (device locked?)... dismissing UI", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    sub_10000A15C(0, 0);
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession], "invalidate");
  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for TVSetupAlertViewController(0);
  return objc_msgSendSuper2(&v16, "viewDidDisappear:", a1 & 1);
}

void sub_10000A15C(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  void *v3;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _BYTE *v10;
  _QWORD v11[5];
  _QWORD *v12;

  if ((v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] & 1) == 0)
  {
    v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 1;
    v3 = *(void **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    if (v3)
    {
      v6 = (_QWORD *)swift_allocObject(&unk_100018AC0, 40, 7);
      v6[2] = a1;
      v6[3] = a2;
      v6[4] = v2;
      v11[4] = sub_10000D1EC;
      v12 = v6;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 1107296256;
      v11[2] = sub_10000A2B8;
      v11[3] = &unk_100018AD8;
      v7 = _Block_copy(v11);
      v8 = v12;
      v9 = v3;
      sub_10000D120(a1, a2);
      v10 = v2;
      swift_release(v8);
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v7);
      _Block_release(v7);

    }
  }
}

void *sub_10000A264(void (*a1)(void))
{
  void *result;
  void *v2;

  if (a1)
    a1();
  result = (void *)sub_1000090E4();
  if (result)
  {
    v2 = result;
    objc_msgSend(result, "dismiss");
    return (void *)swift_unknownObjectRelease(v2);
  }
  return result;
}

uint64_t sub_10000A2B8(uint64_t a1)
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

void sub_10000A2E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v14;
  unint64_t v15;
  char v16;
  id v17;
  NSString v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSString v32;
  uint64_t v33;
  id v34;
  void **aBlock;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];
  __int128 v42;
  __int128 v43;
  _BYTE v44[24];

  v1 = v0;
  v2 = sub_1000068E4((uint64_t *)&unk_10001E440);
  __chkstk_darwin(v2, v3);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(MCProfileConnection), "sharedConnection");
  if (!v6)
  {
    __break(1u);
    return;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "isPasscodeSet");

  if ((v8 & 1) == 0)
  {
    v17 = objc_allocWithZone((Class)NSError);
    v18 = String._bridgeToObjectiveC()();
    v34 = objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 301001, 0);

    sub_10000B008(v34, 0);
    return;
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)SFDevice), "init");
  v10 = v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier;
  swift_beginAccess(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier, v44, 0, 0);
  sub_10000D130(v10, (uint64_t)v5, (uint64_t *)&unk_10001E440);
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  objc_msgSend(v9, "setIdentifier:", isa);

  v14 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo);
  if (v14)
  {
    v41[0] = 0x6F6973726556736FLL;
    v41[1] = 0xE90000000000006ELL;
    swift_bridgeObjectRetain(v14);
    AnyHashable.init<A>(_:)(&aBlock, v41, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v14 + 16) && (v15 = sub_100006FFC((uint64_t)&aBlock), (v16 & 1) != 0))
    {
      sub_1000070A0(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)&v42);
    }
    else
    {
      v42 = 0u;
      v43 = 0u;
    }
    sub_10000702C((uint64_t)&aBlock);
    swift_bridgeObjectRelease(v14);
    if (*((_QWORD *)&v43 + 1))
    {
      if ((swift_dynamicCast(&aBlock, &v42, (char *)&type metadata for Any + 8, &type metadata for UInt8, 6) & 1) != 0)
        objc_msgSend(v9, "setOsVersion:", aBlock);
      goto LABEL_16;
    }
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
  }
  sub_10000CEB4((uint64_t)&v42, &qword_10001E3C8);
LABEL_16:
  v19 = objc_msgSend(objc_allocWithZone((Class)SFDeviceSetupAppleTVSession), "init");
  objc_msgSend(v19, "setPeerDevice:", v9);
  objc_msgSend(v19, "setPresentingViewController:", *(_QWORD *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController));
  v20 = swift_allocObject(&unk_1000189F8, 24, 7);
  swift_unknownObjectWeakInit(v20 + 16, v1);
  v39 = sub_10000CF18;
  v40 = v20;
  aBlock = _NSConcreteStackBlock;
  v36 = 1107296256;
  v37 = sub_10000A890;
  v38 = &unk_100018A10;
  v21 = _Block_copy(&aBlock);
  swift_release(v40);
  objc_msgSend(v19, "setProgressHandler:", v21);
  _Block_release(v21);
  v22 = swift_allocObject(&unk_1000189F8, 24, 7);
  swift_unknownObjectWeakInit(v22 + 16, v1);
  v39 = sub_10000CF84;
  v40 = v22;
  aBlock = _NSConcreteStackBlock;
  v36 = 1107296256;
  v37 = sub_10000A2B8;
  v38 = &unk_100018A38;
  v23 = _Block_copy(&aBlock);
  swift_release(v40);
  objc_msgSend(v19, "setPromptForCaptiveNetworkHandler:", v23);
  _Block_release(v23);
  v24 = swift_allocObject(&unk_1000189F8, 24, 7);
  swift_unknownObjectWeakInit(v24 + 16, v1);
  v39 = sub_10000CFD4;
  v40 = v24;
  aBlock = _NSConcreteStackBlock;
  v36 = 1107296256;
  v37 = sub_10000A2B8;
  v38 = &unk_100018A60;
  v25 = _Block_copy(&aBlock);
  swift_release(v40);
  objc_msgSend(v19, "setPromptForHomeiCloudHandler:", v25);
  _Block_release(v25);
  v26 = swift_allocObject(&unk_1000189F8, 24, 7);
  swift_unknownObjectWeakInit(v26 + 16, v1);
  v39 = sub_10000D090;
  v40 = v26;
  aBlock = _NSConcreteStackBlock;
  v36 = 1107296256;
  v37 = sub_10000A910;
  v38 = &unk_100018A88;
  v27 = _Block_copy(&aBlock);
  swift_release(v40);
  objc_msgSend(v19, "setPromptForPINHandler:", v27);
  _Block_release(v27);
  objc_msgSend(v19, "activate");
  v28 = *(void **)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession) = v19;
  v29 = v19;

  v30 = sub_1000090E4();
  if (v30)
  {
    v31 = (void *)v30;
    v32 = String._bridgeToObjectiveC()();
    objc_msgSend(v31, "setIdleTimerDisabled:forReason:", 1, v32);

    swift_unknownObjectRelease(v31);
  }

}

uint64_t sub_10000A890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v5(a2, v6);
  swift_release(v4);
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_10000A910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v6 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v6(a2, a3);
  return swift_release(v5);
}

void sub_10000A958(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  unint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31[5];
  __int128 v32;
  __int128 v33;

  if ((int)a1 <= 79)
  {
    if ((_DWORD)a1 == 20)
    {
      if (qword_10001E890 != -1)
        swift_once(&qword_10001E890, sub_100009010);
      v3 = type metadata accessor for Logger(0);
      v4 = sub_100006FE4(v3, (uint64_t)qword_10001E898);
      v5 = Logger.logObject.getter(v4);
      v6 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Setup finalized", v7, 2u);
        swift_slowDealloc(v7, -1, -1);
      }

      sub_10000B008(0, 1);
      return;
    }
    if ((_DWORD)a1 != 30)
    {
      if ((_DWORD)a1 != 70)
        return;
      goto LABEL_10;
    }
    if (a2)
    {
      *(_QWORD *)&v32 = 28517;
      *((_QWORD *)&v32 + 1) = 0xE200000000000000;
      AnyHashable.init<A>(_:)(v31, &v32, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(a2 + 16) && (v9 = sub_100006FFC((uint64_t)v31), (v10 & 1) != 0))
      {
        sub_1000070A0(*(_QWORD *)(a2 + 56) + 32 * v9, (uint64_t)&v32);
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
      }
      sub_10000702C((uint64_t)v31);
      if (*((_QWORD *)&v33 + 1))
      {
        v17 = sub_1000068AC(0, &qword_10001E500, NSError_ptr);
        if (swift_dynamicCast(v31, &v32, (char *)&type metadata for Any + 8, v17, 6))
          v18 = (void *)v31[0];
        else
          v18 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
    }
    sub_10000CEB4((uint64_t)&v32, &qword_10001E3C8);
    v18 = 0;
LABEL_34:
    if (qword_10001E890 != -1)
      swift_once(&qword_10001E890, sub_100009010);
    v19 = type metadata accessor for Logger(0);
    sub_100006FE4(v19, (uint64_t)qword_10001E898);
    v20 = v18;
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v31[0] = v24;
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)&v32 = v18;
      v30 = v18;
      v25 = v20;
      v26 = sub_1000068E4(&qword_10001E4F8);
      v27 = String.init<A>(describing:)(&v32, v26);
      v29 = v28;
      *(_QWORD *)&v32 = sub_1000069A4(v27, v28, v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, (char *)&v32 + 8, v23 + 4, v23 + 12);

      v18 = v30;
      swift_bridgeObjectRelease(v29);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Setup failed: %s", v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);

    }
    else
    {

    }
    sub_10000B008(v18, 1);

    return;
  }
  if ((a1 - 200) <= 0x24 && ((1 << (a1 + 56)) & 0x1440100401) != 0)
    goto LABEL_10;
  if ((_DWORD)a1 != 96)
  {
    if ((_DWORD)a1 != 80)
      return;
LABEL_10:
    sub_10000B44C(a1);
    return;
  }
  v11 = *(void **)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController);
  if (v11)
  {
    *(_QWORD *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController) = 0;

  }
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_100006FE4(v12, (uint64_t)qword_10001E898);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Setup completed", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  sub_10000B008(0, 0);
}

void sub_10000AE20(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void (*v16)(char *, _UNKNOWN **);
  _QWORD *v17;
  char *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;

  v2 = v1;
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100006FE4(v4, (uint64_t)qword_10001E898);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "showAuth(flags:)", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController;
  v10 = *(_QWORD **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController];
  if (v10)
  {
    v11 = *(void (**)(uint64_t))((swift_isaMask & *v10) + 0x70);
    v21 = v10;
    v11(a1);

  }
  else
  {
    v12 = type metadata accessor for TVSetupAuthViewController();
    v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v12)), "init");
    v14 = *(void **)&v2[v9];
    *(_QWORD *)&v2[v9] = v13;

    v15 = *(_QWORD **)&v2[v9];
    if (v15)
    {
      v16 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v15) + 0x60);
      v17 = v15;
      v18 = v2;
      v16(v2, &off_100018910);

    }
    v19 = *(void **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    if (v19)
    {
      v20 = *(_QWORD *)&v2[v9];
      if (v20)
        objc_msgSend(v19, "pushViewController:animated:", v20, 1);
      else
        __break(1u);
    }
  }
}

void sub_10000B008(void *a1, char a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t done;
  id v21;
  void *v22;
  _QWORD *v23;
  void (*v24)(void *);
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  void (*v28)(char *, _UNKNOWN **);
  _QWORD *v29;
  char *v30;
  _QWORD *v31;
  void *v32;
  _QWORD *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSString v47;
  char v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v6 = type metadata accessor for Logger(0);
  sub_100006FE4(v6, (uint64_t)qword_10001E898);
  v7 = a1;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  v49 = v7;
  v50 = a1;
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v48 = a2;
    v11 = swift_slowAlloc(32, -1);
    v51 = (uint64_t)a1;
    v52 = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = v7;
    v13 = sub_1000068E4(&qword_10001E4F8);
    v14 = String.init<A>(describing:)(&v51, v13);
    v16 = v15;
    v51 = sub_1000069A4(v14, v15, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Show done: %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    v17 = v11;
    a2 = v48;
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

  }
  v19 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController;
  if (*(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController])
    goto LABEL_21;
  done = type metadata accessor for TVSetupDoneViewController();
  v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(done)), "init");
  v22 = *(void **)&v3[v19];
  *(_QWORD *)&v3[v19] = v21;

  v23 = *(_QWORD **)&v3[v19];
  if (v23)
  {
    v24 = *(void (**)(void *))((swift_isaMask & *v23) + 0xA0);
    v25 = v49;
    v26 = v23;
    v24(v50);

    v27 = *(_QWORD **)&v3[v19];
    if (v27)
    {
      v28 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v27) + 0x70);
      v29 = v27;
      v30 = v3;
      v28(v3, &off_100018920);

      v31 = *(_QWORD **)&v3[v19];
      if (v31)
      {
        v32 = *(void **)&v30[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession];
        if (v32)
        {
          v33 = v31;
          v34 = objc_msgSend(v32, "peerDevice");
          v32 = v34;
          if (v34)
          {
            v35 = objc_msgSend(v34, "mediaRemoteID");

            if (v35)
            {
              v32 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
              v37 = v36;

LABEL_17:
              (*(void (**)(void *, uint64_t))((swift_isaMask & *v31) + 0x88))(v32, v37);

              goto LABEL_18;
            }
            v32 = 0;
          }
        }
        else
        {
          v38 = v31;
        }
        v37 = 0;
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  v18 = *(id *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
  if (v18)
  {
    v39 = *(_QWORD *)&v3[v19];
    if (!v39)
    {
      __break(1u);
      return;
    }
    v18 = objc_msgSend(v18, "pushViewController:animated:", v39, 1);
  }
LABEL_21:
  if ((a2 & 1) != 0)
  {
    v40 = Logger.logObject.getter(v18);
    v41 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Invalidating session", v42, 2u);
      swift_slowDealloc(v42, -1, -1);
    }

    v43 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession;
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession], "invalidate");
    v44 = *(void **)&v3[v43];
    *(_QWORD *)&v3[v43] = 0;

    v45 = sub_1000090E4();
    if (v45)
    {
      v46 = (void *)v45;
      v47 = String._bridgeToObjectiveC()();
      objc_msgSend(v46, "setIdleTimerDisabled:forReason:", 0, v47);

      swift_unknownObjectRelease(v46);
    }
  }
}

void sub_10000B44C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  void (*v11)(uint64_t);
  _QWORD *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD *v22;
  int v23;
  int v24;
  void (*v25)(_QWORD);
  _QWORD *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;

  v2 = v1;
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100006FE4(v4, (uint64_t)qword_10001E898);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "showProgress(_:)", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController;
  v10 = *(_QWORD **)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController);
  if (v10)
    goto LABEL_6;
  v19 = type metadata accessor for TVSetupProgressViewController();
  v20 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v19)), "init");
  v21 = *(void **)(v2 + v9);
  *(_QWORD *)(v2 + v9) = v20;

  v22 = *(_QWORD **)(v2 + v9);
  if (v22)
  {
    v23 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode);
    v24 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode + 1);
    v25 = *(void (**)(_QWORD))((swift_isaMask & *v22) + 0x60);
    v26 = v22;
    v25(v23 | (v24 << 8));

    v10 = *(_QWORD **)(v2 + v9);
    if (v10)
    {
LABEL_6:
      v11 = *(void (**)(uint64_t))((swift_isaMask & *v10) + 0x70);
      v12 = v10;
      v11(a1);

    }
  }
  v13 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController;
  v14 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController), "visibleViewController");
  v15 = *(_QWORD *)(v2 + v9);
  if (v14)
  {
    if (!v15)
    {

      v27 = *(void **)(v2 + v13);
      if (!v27)
        return;
      goto LABEL_18;
    }
    v38 = *(id *)(v2 + v9);
    sub_1000068AC(0, &qword_10001E4F0, UIViewController_ptr);
    v16 = v38;
    v17 = v14;
    v18 = static NSObject.== infix(_:_:)(v17, v16);

    if ((v18 & 1) != 0)
      return;
  }
  else if (!v15)
  {
    v37 = 0;
    return;
  }
  v27 = *(void **)(v2 + v13);
  if (!v27)
    return;
LABEL_18:
  v28 = objc_msgSend(v27, "viewControllers", v38);
  v29 = sub_1000068AC(0, &qword_10001E4F0, UIViewController_ptr);
  v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v28, v29);

  v31 = *(void **)(v2 + v9);
  if (!v31)
  {
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    return;
  }
  v32 = v31;
  v33 = sub_10000B79C((uint64_t)v32, v30);
  swift_bridgeObjectRelease(v30);

  v34 = *(void **)(v2 + v13);
  if ((v33 & 1) != 0)
  {
    if (v34)
    {
      v35 = *(_QWORD *)(v2 + v9);
      if (v35)
      {

        return;
      }
      goto LABEL_29;
    }
  }
  else if (v34)
  {
    v36 = *(_QWORD *)(v2 + v9);
    if (v36)
    {
      objc_msgSend(v34, "pushViewController:animated:", v36, 1);
      return;
    }
    goto LABEL_30;
  }
}

uint64_t sub_10000B79C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;

  if ((unint64_t)a2 >> 62)
    goto LABEL_20;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a2);
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    v5 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v6 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
LABEL_5:
      v7 = v6;
      sub_1000068AC(0, &qword_10001E4F0, UIViewController_ptr);
      v8 = static NSObject.== infix(_:_:)(v7, a1);

      if ((v8 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease(a2);
        return 1;
      }
      if (v4 == 1)
        goto LABEL_18;
      if (v5)
        break;
      v5 = 5;
      while (1)
      {
        v15 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
          break;
        v16 = *(id *)(a2 + 8 * v5);
        v17 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v17 & 1) != 0)
          goto LABEL_6;
        ++v5;
        if (v15 == v4)
          goto LABEL_18;
      }
      __break(1u);
    }
    v10 = 1;
    while (1)
    {
      v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a2);
      v12 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      v13 = v11;
      v14 = static NSObject.== infix(_:_:)(v11, a1);
      swift_unknownObjectRelease(v13);
      if ((v14 & 1) != 0)
        goto LABEL_6;
      ++v10;
      if (v12 == v4)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    if (a2 < 0)
      v18 = a2;
    else
      v18 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
  }
LABEL_18:
  swift_bridgeObjectRelease(a2);
  return 0;
}

id sub_10000B920()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void (*v12)(char *, _UNKNOWN **);
  _QWORD *v13;
  char *v14;
  id result;
  uint64_t v16;

  v1 = v0;
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006FE4(v2, (uint64_t)qword_10001E898);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "showCaptiveNetworkWarning()", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7)), "init");
  v9 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController;
  v10 = *(void **)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController] = v8;

  v11 = *(_QWORD **)&v1[v9];
  if (v11)
  {
    v12 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v11) + 0x68);
    v13 = v11;
    v14 = v1;
    v12(v1, &off_100018938);

  }
  result = *(id *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
  if (result)
  {
    v16 = *(_QWORD *)&v1[v9];
    if (v16)
      return objc_msgSend(result, "pushViewController:animated:", v16, 1);
    else
      __break(1u);
  }
  return result;
}

id sub_10000BA98(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_10000BB0C(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  char *v6;
  uint64_t v7;
  NSString v8;
  id v9;
  objc_super v11;

  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession] = 0;
  v6 = &v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier];
  v7 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_WORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode] = 256;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo] = 0;
  v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController] = 0;
  if (a2)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for TVSetupAlertViewController(0);
  v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", v8, a3);

  return v9;
}

id sub_10000BCA8(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id sub_10000BCE8(void *a1)
{
  _BYTE *v1;
  char *v3;
  uint64_t v4;
  id v5;
  objc_super v7;

  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession] = 0;
  v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier];
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_WORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode] = 256;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo] = 0;
  v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for TVSetupAlertViewController(0);
  v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

id sub_10000BE10()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupAlertViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10000BEF4()
{
  sub_10000C714((uint64_t)&unk_1000188B8, (uint64_t)sub_10000C5AC, (uint64_t)&unk_1000188D0);
}

void sub_10000BF64()
{
  sub_10000C714((uint64_t)&unk_1000189A8, (uint64_t)sub_10000D1EC, (uint64_t)&unk_1000189C0);
}

void sub_10000BF90(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_10000C7F0(a2, a3);
}

id sub_10000BF9C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession), "homeiCloudEnable");
}

void sub_10000BFB4(uint64_t a1, char a2)
{
  sub_10000CA64(a2);
}

uint64_t sub_10000BFBC(uint64_t a1, void *a2)
{
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void (*v34)(char *, uint64_t);
  id v35;
  NSURL *v36;
  char *v37;
  void *v38;
  void *v39;
  void *v40;
  Class isa;
  unsigned __int8 v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  void (*v60)(char *, char *, uint64_t);
  uint64_t v61;
  char *v62;
  void *v63;
  char *v64;
  _QWORD v65[3];
  char v66[8];
  uint64_t v67;
  uint64_t v68;
  id v69;
  char v70[24];

  v4 = sub_1000068E4(&qword_10001E508);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v11 = __chkstk_darwin(v8, v10);
  v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v11, v14);
  v17 = (char *)&v60 - v16;
  __chkstk_darwin(v15, v18);
  v20 = (char *)&v60 - v19;
  v21 = swift_projectBox(a1);
  swift_beginAccess(v21, v70, 0, 0);
  sub_10000D130(v21, (uint64_t)v7, &qword_10001E508);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_10000CEB4((uint64_t)v7, &qword_10001E508);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v20, v7, v8);
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v62 = v13;
  v63 = a2;
  v23 = type metadata accessor for Logger(0);
  v24 = sub_100006FE4(v23, (uint64_t)qword_10001E898);
  v25 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v64 = v20;
  v60 = v25;
  v26 = ((uint64_t (*)(char *, char *, uint64_t))v25)(v17, v20, v8);
  v61 = v24;
  v27 = Logger.logObject.getter(v26);
  v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc(12, -1);
    v30 = (void *)swift_slowAlloc(32, -1);
    v69 = v30;
    *(_DWORD *)v29 = 136315138;
    v31 = URL.debugDescription.getter();
    v33 = v32;
    v67 = sub_1000069A4(v31, v32, (uint64_t *)&v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v29 + 4, v29 + 12);
    swift_bridgeObjectRelease(v33);
    v34 = *(void (**)(char *, uint64_t))(v9 + 8);
    v34(v17, v8);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Open settings: %s", v29, 0xCu);
    swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1, -1);
    swift_slowDealloc(v29, -1, -1);
  }
  else
  {
    v34 = *(void (**)(char *, uint64_t))(v9 + 8);
    v34(v17, v8);
  }

  v35 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  v37 = v64;
  if (v35)
  {
    v38 = v35;
    URL._bridgeToObjectiveC()(v36);
    v40 = v39;
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    v69 = 0;
    v42 = objc_msgSend(v38, "openSensitiveURL:withOptions:error:", v40, isa, &v69);

    v43 = v69;
    if ((v42 & 1) != 0)
    {
      v44 = v69;
    }
    else
    {
      v45 = v69;
      v46 = _convertNSErrorToError(_:)(v43);

      swift_willThrow();
      v47 = v62;
      v60(v62, v37, v8);
      swift_errorRetain(v46);
      v48 = swift_errorRetain(v46);
      v49 = Logger.logObject.getter(v48);
      v50 = static os_log_type_t.error.getter();
      v51 = v50;
      if (os_log_type_enabled(v49, v50))
      {
        v52 = swift_slowAlloc(22, -1);
        v63 = (void *)swift_slowAlloc(64, -1);
        v69 = v63;
        *(_DWORD *)v52 = 136315394;
        LODWORD(v61) = v51;
        v53 = URL.debugDescription.getter();
        v55 = v54;
        v67 = sub_1000069A4(v53, v54, (uint64_t *)&v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v52 + 4, v52 + 12);
        swift_bridgeObjectRelease(v55);
        v34(v47, v8);
        *(_WORD *)(v52 + 12) = 2080;
        swift_getErrorValue(v46, v66, v65);
        v56 = Error.localizedDescription.getter(v65[1], v65[2]);
        v58 = v57;
        v67 = sub_1000069A4(v56, v57, (uint64_t *)&v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v52 + 14, v52 + 22);
        swift_bridgeObjectRelease(v58);
        swift_errorRelease(v46);
        swift_errorRelease(v46);
        _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v61, "Failed to open settings: %s %s", (uint8_t *)v52, 0x16u);
        v59 = v63;
        swift_arrayDestroy(v63, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v59, -1, -1);
        swift_slowDealloc(v52, -1, -1);

      }
      else
      {

        swift_errorRelease(v46);
        swift_errorRelease(v46);
        v34(v47, v8);
      }
      swift_errorRelease(v46);
    }
  }
  return ((uint64_t (*)(char *, uint64_t))v34)(v37, v8);
}

id sub_10000C554()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession), "captiveConfirmed");
}

uint64_t type metadata accessor for TVSetupAlertViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10001E918;
  if (!qword_10001E918)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TVSetupAlertViewController);
  return result;
}

void *sub_10000C5AC()
{
  uint64_t v0;

  return sub_10000A264(*(void (**)(void))(v0 + 16));
}

uint64_t sub_10000C5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C5C8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000C5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000C634(a1, a2, v5);
}

unint64_t sub_10000C634(uint64_t a1, uint64_t a2, uint64_t a3)
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

void sub_10000C714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  void *v4;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  id v10;
  _BYTE *v11;
  _QWORD v12[5];
  _QWORD *v13;

  if ((v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] & 1) == 0)
  {
    v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 1;
    v4 = *(void **)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    if (v4)
    {
      v7 = (_QWORD *)swift_allocObject(a1, 40, 7);
      v7[2] = 0;
      v7[3] = 0;
      v7[4] = v3;
      v12[4] = a2;
      v13 = v7;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 1107296256;
      v12[2] = sub_10000A2B8;
      v12[3] = a3;
      v8 = _Block_copy(v12);
      v9 = v13;
      v10 = v4;
      v11 = v3;
      swift_release(v9);
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v8);
      _Block_release(v8);

    }
  }
}

void sub_10000C7F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  NSString v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001E890 != -1)
    swift_once(&qword_10001E890, sub_100009010);
  v11 = sub_100006FE4(v6, (uint64_t)qword_10001E898);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  v12 = swift_bridgeObjectRetain_n(a2, 2);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v23[0] = v3;
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = IsAppleInternalBuild();
    v23[1] = a1;
    if (v17)
    {
      swift_bridgeObjectRetain(a2);
      v18 = a1;
      v19 = a2;
    }
    else
    {
      v19 = 0xE100000000000000;
      v18 = 42;
    }
    v24 = sub_1000069A4(v18, v19, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Trying PIN: %s", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v3 = v23[0];
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v20 = *(void **)(v3 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession);
  if (v20)
  {
    v21 = v20;
    v22 = String._bridgeToObjectiveC()();
    objc_msgSend(v21, "pairSetupTryPIN:", v22);

  }
}

void sub_10000CA64(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];

  v2 = sub_1000068E4(&qword_10001E508);
  v4 = __chkstk_darwin(v2, v3);
  v6 = __chkstk_darwin(v4, v5);
  __chkstk_darwin(v6, v7);
  v8 = sub_1000068E4(&qword_10001E510);
  inited = swift_initStackObject(v8, v15);
  *(_OWORD *)(inited + 16) = xmmword_100012E90;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
  *(_QWORD *)(inited + 40) = v10;
  *(_QWORD *)(inited + 72) = &type metadata for Bool;
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
  *(_QWORD *)(inited + 88) = v11;
  *(_QWORD *)(inited + 120) = &type metadata for Bool;
  *(_BYTE *)(inited + 96) = 1;
  sub_100009890(inited);
  swift_allocBox(v2);
  v13 = v12;
  v14 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  __asm { BR              X10 }
}

uint64_t sub_10000CBC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  ((void (*)(uint64_t, unint64_t))URL.init(string:))(0x6F723A7366657270, 0xEF494649573D746FLL);
  sub_10000CE70(v2, v3, &qword_10001E508);
  v4 = swift_allocObject(&unk_100018980, 32, 7);
  *(_QWORD *)(v4 + 16) = v0;
  *(_QWORD *)(v4 + 24) = v1;
  swift_retain(v0);
  sub_10000A15C((uint64_t)sub_10000CE68, v4);
  swift_release(v0);
  return swift_release(v4);
}

uint64_t sub_10000CD08()
{
  return type metadata accessor for TVSetupAlertViewController(0);
}

void sub_10000CD10(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[11];

  v4[0] = "\b";
  sub_10000CDA8(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = &unk_100012F48;
    v4[3] = "\b";
    v4[4] = &unk_100012F60;
    v4[5] = "\b";
    v4[6] = "\b";
    v4[7] = "\b";
    v4[8] = "\b";
    v4[9] = "\b";
    v4[10] = "\b";
    swift_updateClassMetadata2(a1, 256, 11, v4, a1 + 80);
  }
}

void sub_10000CDA8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10001E480)
  {
    v2 = type metadata accessor for UUID(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10001E480);
  }
}

uint64_t sub_10000CDFC(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000CE0C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CE30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10000CE3C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CE68()
{
  uint64_t v0;

  return sub_10000BFBC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000CE70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000068E4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000CEB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000068E4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000CEF4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000CF18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  _BYTE v8[24];

  v5 = v2 + 16;
  swift_beginAccess(v5, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    sub_10000A958(a1, a2);

  }
}

void sub_10000CF84()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  _BYTE v3[24];

  swift_beginAccess(v0 + 16, v3, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = (void *)Strong;
    sub_10000B920();

  }
}

void sub_10000CFD4()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  id v3;
  NSString v4;
  id v5;
  _BYTE v6[24];

  swift_beginAccess(v0 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = (void *)Strong;
    v3 = objc_allocWithZone((Class)NSError);
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 301010, 0);

    sub_10000B008(v5, 0);
  }
}

void sub_10000D090(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = v1 + 16;
  swift_beginAccess(v3, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_10000AE20(a1);

  }
}

uint64_t sub_10000D0EC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D120(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10000D130(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000068E4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000068E4(&qword_10001E3C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL sub_10000D1F0(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000D200(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int sub_10000D224(unsigned __int8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL sub_10000D268(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000D27C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000D2C0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000D2E8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000D328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100007258(v0, qword_10001E938);
  v1 = sub_100006FE4(v0, (uint64_t)qword_10001E938);
  v2 = sub_100007AA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10000D384()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_10000D3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _BYTE v7[24];

  v5 = v2 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate;
  swift_beginAccess(v5, v7, 1, 0);
  *(_QWORD *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign(v5, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_10000D438(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_100004DDC;
}

uint64_t sub_10000D4AC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier);
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier, v4, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t sub_10000D500(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

uint64_t (*sub_10000D55C(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier, a1, 33, 0);
  return j__swift_endAccess;
}

void *sub_10000D5A0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error);
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_10000D5EC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_10000D63C(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10000D680()
{
  _QWORD *v0;
  id v1;
  uint64_t (*v2)(void);
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSString v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSString v27;
  NSString v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSString v35;
  uint64_t v36;
  uint64_t v37;
  NSString v38;
  id v39;
  NSString v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSString v47;
  NSString v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSString v55;
  NSString v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void **v84;
  NSArray v85;
  void **v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  NSString v90;
  uint64_t v91;
  uint64_t v92;
  NSString v93;
  NSString v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  NSString v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  void **v113;
  id v114;
  Class isa;
  id v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  double v124;
  id v125;
  id v126;
  id v127;
  uint64_t v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  void **v157;
  Class v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  NSString v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSString v168;
  uint64_t v169;
  uint64_t v170;
  NSString v171;
  NSString v172;
  uint64_t v173;
  uint64_t v174;
  NSString v175;
  NSString v176;
  id v177;
  uint64_t v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  NSString v183;
  NSString v184;
  id v185;
  id v186;
  NSString v187;
  id v188;
  uint64_t v189;
  void *v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  NSString v194;
  NSString v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  NSString v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  NSString v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  NSString v212;
  void *v213;
  id v214;
  uint64_t v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  void **aBlock;
  uint64_t v226;
  void (*v227)(uint64_t, void *);
  void *v228;
  void *v229;
  uint64_t v230;
  objc_super v231;

  v231.receiver = v0;
  v231.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  objc_msgSendSuper2(&v231, "viewDidLoad");
  v1 = objc_msgSend(v0, "setDismissalType:", 3);
  v2 = *(uint64_t (**)(void))((swift_isaMask & *v0) + 0x98);
  v224 = v0;
  v3 = (void *)((uint64_t (*)(id))v2)(v1);

  if (v3)
  {
    v4 = 19279;
    v5 = (void *)0xE200000000000000;
  }
  else
  {
    v4 = 0x4D45525F4E45504FLL;
    v5 = (void *)0xEB0000000045544FLL;
  }
  sub_100011608(v4, v5);
  v7 = v6;
  v8 = (void *)v2();

  if (!v8)
    goto LABEL_8;
  v9 = (void *)v2();
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "code");

    if (v11 == (id)301010)
    {
      swift_bridgeObjectRelease(v7);
      goto LABEL_9;
    }
LABEL_8:
    v12 = swift_allocObject(&unk_100018B30, 24, 7);
    swift_unknownObjectWeakInit(v12 + 16, v224);
    swift_retain(v12);
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    v229 = sub_100010298;
    v230 = v12;
    aBlock = _NSConcreteStackBlock;
    v226 = 1107296256;
    v227 = sub_100005734;
    v228 = &unk_100018B48;
    v14 = _Block_copy(&aBlock);
    v15 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v13, 0, v14);

    _Block_release(v14);
    v16 = v230;
    swift_release(v12);
    swift_release(v16);
    v17 = objc_msgSend(v224, "addAction:", v15);

LABEL_9:
    sub_100011608(0x45535F4F545F4F47, (void *)0xEE0053474E495454);
    v19 = v18;
    v20 = swift_allocObject(&unk_100018B30, 24, 7);
    swift_unknownObjectWeakInit(v20 + 16, v224);
    swift_retain(v20);
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    v229 = sub_10001042C;
    v230 = v20;
    aBlock = _NSConcreteStackBlock;
    v226 = 1107296256;
    v227 = sub_100005734;
    v228 = &unk_100018B70;
    v22 = _Block_copy(&aBlock);
    v23 = (void *)objc_opt_self(PRXAction);
    v223 = objc_msgSend(v23, "actionWithTitle:style:handler:", v21, 1, v22);

    _Block_release(v22);
    v24 = v230;
    swift_release(v20);
    v25 = swift_release(v24);
    v26 = (void *)((uint64_t (*)(uint64_t))v2)(v25);
    if (!v26)
    {
      v28 = String._bridgeToObjectiveC()();
      v29 = (id)SFAddSuffixForCurrentDeviceClass();

      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
      v32 = v31;

      sub_100011608(v30, v32);
      v34 = v33;
      swift_bridgeObjectRelease(v32);
      v35 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v34);
      objc_msgSend(v224, "setTitle:", v35);

      sub_100011608(0xD000000000000011, (void *)0x80000001000163E0);
      v37 = v36;
      v38 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v37);
      objc_msgSend(v224, "setSubtitle:", v38);

      v27 = String._bridgeToObjectiveC()();
      v39 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v27);
LABEL_16:

      if (!v39)
      {
LABEL_19:

        return;
      }
      v58 = objc_allocWithZone((Class)UIImageView);
      v221 = v39;
      v59 = objc_msgSend(v58, "initWithImage:", v221);
      objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v60 = objc_msgSend(v224, "contentView");
      objc_msgSend(v60, "addSubview:", v59);

      v219 = (id)objc_opt_self(NSLayoutConstraint);
      v61 = sub_1000068E4(&qword_10001E388);
      v62 = swift_allocObject(v61, 64, 7);
      *(_OWORD *)(v62 + 16) = xmmword_100012FE0;
      v63 = objc_msgSend(v59, "centerXAnchor");
      v64 = objc_msgSend(v224, "contentView");
      v65 = objc_msgSend(v64, "mainContentGuide");

      v66 = objc_msgSend(v65, "centerXAnchor");
      v67 = objc_msgSend(v63, "constraintEqualToAnchor:", v66);

      *(_QWORD *)(v62 + 32) = v67;
      v68 = objc_msgSend(v59, "centerYAnchor");
      v69 = objc_msgSend(v224, "contentView");
      v70 = objc_msgSend(v69, "mainContentGuide");

      v71 = objc_msgSend(v70, "centerYAnchor");
      v72 = objc_msgSend(v68, "constraintEqualToAnchor:", v71);

      *(_QWORD *)(v62 + 40) = v72;
      v73 = objc_msgSend(v59, "topAnchor");
      v74 = objc_msgSend(v224, "contentView");
      v75 = objc_msgSend(v74, "mainContentGuide");

      v76 = objc_msgSend(v75, "topAnchor");
      v77 = objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:constant:", v76, 10.0);

      *(_QWORD *)(v62 + 48) = v77;
      v78 = v223;
      v79 = objc_msgSend(v59, "bottomAnchor");
      v80 = objc_msgSend(v224, "contentView");
      v81 = objc_msgSend(v80, "mainContentGuide");

      v82 = objc_msgSend(v81, "bottomAnchor");
      v83 = objc_msgSend(v79, "constraintLessThanOrEqualToAnchor:constant:", v82, -10.0);

      *(_QWORD *)(v62 + 56) = v83;
      aBlock = (void **)v62;
      specialized Array._endMutation()();
      v84 = aBlock;
      sub_1000068AC(0, (unint64_t *)&qword_10001E378, NSLayoutConstraint_ptr);
      v85.super.isa = Array._bridgeToObjectiveC()().super.isa;
      v86 = v84;
      v87 = v221;
      swift_bridgeObjectRelease(v86);
      objc_msgSend(v219, "activateConstraints:", v85.super.isa);
      v27 = v221;
LABEL_18:

      v223 = v27;
      goto LABEL_19;
    }
    v27 = v26;
    if (objc_msgSend(v26, "code") == (id)301004 || objc_msgSend(v27, "code") == (id)301000)
    {
      v40 = String._bridgeToObjectiveC()();
      v41 = (id)SFLocalizableWAPIStringKeyForKey();

      v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      v44 = v43;

      sub_100011608(v42, v44);
      v46 = v45;
      swift_bridgeObjectRelease(v44);
      v47 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v46);
      objc_msgSend(v224, "setTitle:", v47);

      v48 = String._bridgeToObjectiveC()();
      v49 = (id)SFLocalizableWAPIStringKeyForKey();

      v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
      v52 = v51;

      sub_100011608(v50, v52);
      v54 = v53;
      swift_bridgeObjectRelease(v52);
      v55 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v54);
      objc_msgSend(v224, "setSubtitle:", v55);

      v56 = String._bridgeToObjectiveC()();
      v39 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v56);

      v57 = objc_msgSend(v224, "addAction:", v223);
LABEL_15:

      goto LABEL_16;
    }
    if (objc_msgSend(v27, "code") == (id)301010)
    {
      v222 = v23;
      sub_100011608(0xD000000000000015, (void *)0x8000000100016510);
      v89 = v88;
      v90 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v89);
      objc_msgSend(v224, "setTitle:", v90);

      sub_100011608(0xD000000000000014, (void *)0x8000000100016530);
      v92 = v91;
      v93 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v92);
      objc_msgSend(v224, "setSubtitle:", v93);

      v94 = String._bridgeToObjectiveC()();
      v95 = (void *)objc_opt_self(UIImage);
      v96 = objc_msgSend(v95, "imageNamed:", v94);

      v97 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v96);
      objc_msgSend(v97, "_setContinuousCornerRadius:", 17.5);
      v98 = objc_msgSend(v97, "layer");
      v99 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.21);
      v100 = objc_msgSend(v99, "CGColor");

      objc_msgSend(v98, "setBorderColor:", v100);
      v101 = objc_msgSend(v97, "layer");
      objc_msgSend(v101, "setBorderWidth:", 1.0);

      v102 = objc_msgSend(v97, "layer");
      objc_msgSend(v102, "setMasksToBounds:", 1);

      v103 = String._bridgeToObjectiveC()();
      v104 = objc_msgSend(v95, "imageNamed:", v103);

      v105 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v104);
      objc_msgSend(v105, "_setContinuousCornerRadius:", 17.5);
      v106 = objc_msgSend(v105, "layer");
      v107 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.21);
      v108 = objc_msgSend(v107, "CGColor");

      objc_msgSend(v106, "setBorderColor:", v108);
      v109 = objc_msgSend(v105, "layer");
      objc_msgSend(v109, "setBorderWidth:", 1.0);

      v110 = objc_msgSend(v105, "layer");
      objc_msgSend(v110, "setMasksToBounds:", 1);

      v111 = sub_1000068E4(&qword_10001E388);
      v112 = swift_allocObject(v111, 48, 7);
      *(_OWORD *)(v112 + 16) = xmmword_100012FC0;
      *(_QWORD *)(v112 + 32) = v97;
      *(_QWORD *)(v112 + 40) = v105;
      aBlock = (void **)v112;
      specialized Array._endMutation()();
      v113 = aBlock;
      v114 = objc_allocWithZone((Class)UIStackView);
      sub_1000068AC(0, &qword_10001E630, UIView_ptr);
      v217 = v97;
      v220 = v105;
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v113);
      v116 = objc_msgSend(v114, "initWithArrangedSubviews:", isa);

      objc_msgSend(v116, "setAxis:", 0);
      objc_msgSend(v116, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v116, "setClipsToBounds:", 0);
      v117 = (void *)objc_opt_self(UIColor);
      v118 = v116;
      v119 = objc_msgSend(v117, "clearColor");
      objc_msgSend(v118, "setBackgroundColor:", v119);

      objc_msgSend(v118, "setSpacing:", 12.0);
      v120 = objc_msgSend(v118, "layer");
      v121 = objc_msgSend(v117, "blackColor");
      v122 = objc_msgSend(v121, "CGColor");

      objc_msgSend(v120, "setShadowColor:", v122);
      v123 = objc_msgSend(v118, "layer");
      LODWORD(v124) = 1045220557;
      objc_msgSend(v123, "setShadowOpacity:", v124);

      v125 = objc_msgSend(v118, "layer");
      objc_msgSend(v125, "setShadowRadius:", 10.0);

      v126 = objc_msgSend(v118, "layer");
      objc_msgSend(v126, "setShadowOffset:", 0.0, 8.0);

      v127 = objc_msgSend(v224, "contentView");
      objc_msgSend(v127, "addSubview:", v118);

      v218 = (id)objc_opt_self(NSLayoutConstraint);
      v128 = swift_allocObject(v111, 96, 7);
      *(_OWORD *)(v128 + 16) = xmmword_100012FD0;
      v129 = objc_msgSend(v118, "centerXAnchor");
      v130 = objc_msgSend(v224, "contentView");
      v131 = objc_msgSend(v130, "mainContentGuide");

      v132 = objc_msgSend(v131, "centerXAnchor");
      v133 = objc_msgSend(v129, "constraintEqualToAnchor:", v132);

      *(_QWORD *)(v128 + 32) = v133;
      v134 = objc_msgSend(v118, "centerYAnchor");
      v135 = objc_msgSend(v224, "contentView");
      v136 = objc_msgSend(v135, "mainContentGuide");

      v137 = objc_msgSend(v136, "centerYAnchor");
      v138 = objc_msgSend(v134, "constraintEqualToAnchor:", v137);

      *(_QWORD *)(v128 + 40) = v138;
      v139 = objc_msgSend(v118, "topAnchor");
      v140 = objc_msgSend(v224, "contentView");
      v141 = objc_msgSend(v140, "mainContentGuide");

      v142 = objc_msgSend(v141, "topAnchor");
      v143 = objc_msgSend(v139, "constraintGreaterThanOrEqualToAnchor:", v142);

      *(_QWORD *)(v128 + 48) = v143;
      v144 = objc_msgSend(v118, "bottomAnchor");
      v145 = objc_msgSend(v224, "contentView");
      v146 = objc_msgSend(v145, "mainContentGuide");

      v147 = objc_msgSend(v146, "bottomAnchor");
      v148 = objc_msgSend(v144, "constraintLessThanOrEqualToAnchor:", v147);

      *(_QWORD *)(v128 + 56) = v148;
      v149 = objc_msgSend(v217, "heightAnchor");
      v150 = objc_msgSend(v149, "constraintEqualToConstant:", 75.0);

      *(_QWORD *)(v128 + 64) = v150;
      v151 = objc_msgSend(v217, "widthAnchor");
      v152 = objc_msgSend(v151, "constraintEqualToConstant:", 75.0);

      *(_QWORD *)(v128 + 72) = v152;
      v153 = objc_msgSend(v220, "heightAnchor");
      v154 = objc_msgSend(v153, "constraintEqualToConstant:", 75.0);

      *(_QWORD *)(v128 + 80) = v154;
      v155 = objc_msgSend(v220, "widthAnchor");
      v156 = objc_msgSend(v155, "constraintEqualToConstant:", 75.0);

      *(_QWORD *)(v128 + 88) = v156;
      aBlock = (void **)v128;
      specialized Array._endMutation()();
      v157 = aBlock;
      sub_1000068AC(0, (unint64_t *)&qword_10001E378, NSLayoutConstraint_ptr);
      v158 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v157);
      objc_msgSend(v218, "activateConstraints:", v158);

      sub_100011608(0x45554E49544E4F43, (void *)0xE800000000000000);
      v160 = v159;
      v161 = swift_allocObject(&unk_100018B30, 24, 7);
      swift_unknownObjectWeakInit(v161 + 16, v224);
      swift_retain(v161);
      v162 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v160);
      v229 = sub_10001042C;
      v230 = v161;
      aBlock = _NSConcreteStackBlock;
      v226 = 1107296256;
      v227 = sub_100005734;
      v228 = &unk_100018BC0;
      v163 = _Block_copy(&aBlock);
      v85.super.isa = (Class)objc_msgSend(v222, "actionWithTitle:style:handler:", v162, 0, v163);

      _Block_release(v163);
      v164 = v230;
      swift_release(v161);
      v165 = v164;
      v59 = v220;
      swift_release(v165);
      v87 = objc_msgSend(v224, "addAction:", v85.super.isa);

      v78 = v118;
      goto LABEL_18;
    }
    if (objc_msgSend(v27, "code") == (id)301005)
    {
      sub_100011608(0xD00000000000001ALL, (void *)0x80000001000164D0);
      v167 = v166;
      v168 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v167);
      objc_msgSend(v224, "setTitle:", v168);

      sub_100011608(0xD000000000000019, (void *)0x80000001000164F0);
      v170 = v169;
      v171 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v170);
      objc_msgSend(v224, "setSubtitle:", v171);

      v172 = String._bridgeToObjectiveC()();
      v39 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v172);

      v57 = objc_msgSend(v224, "addAction:", v223);
      goto LABEL_15;
    }
    if (objc_msgSend(v27, "code") == (id)301001)
    {
      sub_100011608(0xD000000000000017, (void *)0x8000000100016490);
      v174 = v173;
      v175 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v174);
      objc_msgSend(v224, "setTitle:", v175);

      v176 = String._bridgeToObjectiveC()();
      v177 = (id)SFAddSuffixForCurrentDeviceClass();

      v178 = static String._unconditionallyBridgeFromObjectiveC(_:)(v177);
      v180 = v179;

      sub_100011608(v178, v180);
      v182 = v181;
      swift_bridgeObjectRelease(v180);
      v183 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v182);
      objc_msgSend(v224, "setSubtitle:", v183);

      v184 = String._bridgeToObjectiveC()();
      v185 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v184);

      if (v185)
      {
        v186 = objc_msgSend((id)objc_opt_self(UIColor), "redColor");
        v39 = objc_msgSend(v185, "flattenedImageWithColor:", v186);

      }
      else
      {
        v39 = 0;
      }
      v57 = objc_msgSend(v224, "addAction:", v223);
      goto LABEL_15;
    }
    if (objc_msgSend(v27, "code") == (id)301021)
    {
      v187 = String._bridgeToObjectiveC()();
      v188 = (id)SFLocalizableWAPIStringKeyForKey();

      v189 = static String._unconditionallyBridgeFromObjectiveC(_:)(v188);
      v191 = v190;

      sub_100011608(v189, v191);
      v193 = v192;
      swift_bridgeObjectRelease(v191);
      v194 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v193);
      objc_msgSend(v224, "setTitle:", v194);

      if (!IsAppleInternalBuild())
      {
        v195 = String._bridgeToObjectiveC()();
        v39 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v195);

        goto LABEL_32;
      }
    }
    else
    {
      v196 = sub_100011608(0xD000000000000013, (void *)0x8000000100016400);
      v198 = v197;
      v199 = sub_1000068E4(&qword_10001E628);
      v200 = swift_allocObject(v199, 72, 7);
      *(_OWORD *)(v200 + 16) = xmmword_100012FB0;
      v201 = objc_msgSend(v27, "code");
      *(_QWORD *)(v200 + 56) = &type metadata for Int;
      *(_QWORD *)(v200 + 64) = &protocol witness table for Int;
      *(_QWORD *)(v200 + 32) = v201;
      String.init(format:_:)(v196, v198, v200);
      v203 = v202;
      swift_bridgeObjectRelease(v198);
      v204 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v203);
      objc_msgSend(v224, "setTitle:", v204);

    }
    v39 = 0;
LABEL_32:
    if (IsAppleInternalBuild())
    {
      v205 = objc_msgSend(v27, "description");
      static String._unconditionallyBridgeFromObjectiveC(_:)(v205);
      v207 = v206;

      v208 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v207);
      objc_msgSend(v224, "setSubtitle:", v208);

      sub_100011608(0xD000000000000020, (void *)0x8000000100016420);
      v210 = v209;
      v211 = swift_allocObject(&unk_100018B30, 24, 7);
      swift_unknownObjectWeakInit(v211 + 16, v224);
      swift_retain(v211);
      v212 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v210);
      v229 = sub_100010438;
      v230 = v211;
      aBlock = _NSConcreteStackBlock;
      v226 = 1107296256;
      v227 = sub_100005734;
      v228 = &unk_100018B98;
      v213 = _Block_copy(&aBlock);
      v214 = objc_msgSend(v23, "actionWithTitle:style:handler:", v212, 1, v213);

      _Block_release(v213);
      v215 = v230;
      swift_release(v211);
      swift_release(v215);
      v216 = objc_msgSend(v224, "addAction:", v214);

    }
    goto LABEL_16;
  }
  __break(1u);
}

uint64_t type metadata accessor for TVSetupDoneViewController()
{
  return objc_opt_self(_TtC16TVSetupUIService25TVSetupDoneViewController);
}

void sub_10000F338()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v1 = v0;
  if (qword_10001E930 != -1)
    swift_once(&qword_10001E930, sub_10000D328);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100006FE4(v2, (uint64_t)qword_10001E938);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Action button", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x98))();
  if (v7)
  {
    v28 = v7;
    if (objc_msgSend(v7, "code") == (id)301000 || objc_msgSend(v28, "code") == (id)301004)
    {
      v8 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))();
      if (!v8)
      {
LABEL_11:

        return;
      }
      v10 = v8;
      v11 = v9;
      ObjectType = swift_getObjectType(v8);
      (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, 1, ObjectType, v11);
    }
    else if (objc_msgSend(v28, "code") == (id)301010)
    {
      v18 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))();
      if (!v18)
        goto LABEL_11;
      v10 = v18;
      v20 = v19;
      v21 = swift_getObjectType(v18);
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(v20 + 8))(v1, v21, v20);
    }
    else
    {
      v22 = objc_msgSend(v28, "code");
      v23 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))();
      v10 = v23;
      v25 = v24;
      if (v22 == (id)301005)
      {
        if (!v23)
          goto LABEL_11;
        v26 = swift_getObjectType(v23);
        (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v25 + 16))(v1, 2, v26, v25);
      }
      else
      {
        if (!v23)
          goto LABEL_11;
        v27 = swift_getObjectType(v23);
        (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v25 + 16))(v1, 3, v27, v25);
      }
    }
    swift_unknownObjectRelease(v10);
    goto LABEL_11;
  }
  v13 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))();
  if (v13)
  {
    v15 = v13;
    v16 = v14;
    v17 = ((uint64_t (*)(void))swift_getObjectType)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 16))(v1, 0, v17, v16);
    swift_unknownObjectRelease(v15);
  }
  sub_10000F5F4();
}

void sub_10000F5F4()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_10001E930 != -1)
    swift_once(&qword_10001E930, sub_10000D328);
  v1 = type metadata accessor for Logger(0);
  sub_100006FE4(v1, (uint64_t)qword_10001E938);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    *(_DWORD *)v5 = 136315138;
    v14 = v6;
    v7 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x80))();
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      v7 = 7104878;
      v9 = 0xE300000000000000;
    }
    v13 = sub_1000069A4(v7, v9, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4, v5 + 12);

    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Launching the TVRemote with deviceIdentifier=%s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  (*(void (**)(void))((swift_isaMask & *v2) + 0x80))();
  if (v10)
  {
    v11 = v10;
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend((id)objc_opt_self(TVSetupRemoteLauncher), "launchRemoteWithDeviceIdentifier:", v12);

}

uint64_t sub_10000F818()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  void *object;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(_BYTE *, uint64_t, uint64_t);
  uint64_t result;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSURL *v37;
  void *v38;
  _BYTE v39[16];
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;

  v1 = v0;
  v2 = type metadata accessor for URLComponents(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = &v39[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1000068E4(&qword_10001E508);
  __chkstk_darwin(v7, v8);
  v10 = &v39[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_1000068E4(&qword_10001E668);
  __chkstk_darwin(v11, v12);
  v14 = &v39[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_10001E930 != -1)
    swift_once(&qword_10001E930, sub_10000D328);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_100006FE4(v15, (uint64_t)qword_10001E938);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "handleReportBugButton()", v19, 2u);
    swift_slowDealloc(v19, -1, -1);
  }

  v20 = sub_1000068E4(&qword_10001E670);
  inited = swift_initStackObject(v20, &v43);
  *(_OWORD *)(inited + 16) = xmmword_100012FF0;
  strcpy((char *)(inited + 32), "Classification");
  *(_BYTE *)(inited + 47) = -18;
  *(_QWORD *)(inited + 48) = 0x2073756F69726553;
  *(_QWORD *)(inited + 56) = 0xEB00000000677542;
  *(_QWORD *)(inited + 64) = 0x6E656E6F706D6F43;
  *(_QWORD *)(inited + 72) = 0xEB00000000444974;
  *(_QWORD *)(inited + 80) = 0x353634303532;
  *(_QWORD *)(inited + 88) = 0xE600000000000000;
  strcpy((char *)(inited + 96), "ComponentName");
  *(_WORD *)(inited + 110) = -4864;
  *(_QWORD *)(inited + 112) = 0x565420656C707041;
  *(_QWORD *)(inited + 120) = 0xE800000000000000;
  *(_QWORD *)(inited + 128) = 0xD000000000000010;
  *(_QWORD *)(inited + 136) = 0x8000000100016620;
  *(_QWORD *)(inited + 144) = 0x736775422077654ELL;
  *(_QWORD *)(inited + 152) = 0xE800000000000000;
  *(_QWORD *)(inited + 160) = 0xD000000000000014;
  *(_QWORD *)(inited + 168) = 0x8000000100016640;
  *(_QWORD *)(inited + 176) = 0xD000000000000028;
  *(_QWORD *)(inited + 184) = 0x8000000100016660;
  *(_QWORD *)(inited + 192) = 0x6375646F72706552;
  *(_QWORD *)(inited + 200) = 0xEF7974696C696269;
  strcpy((char *)(inited + 208), "I Didn't Try");
  *(_BYTE *)(inited + 221) = 0;
  *(_WORD *)(inited + 222) = -5120;
  *(_QWORD *)(inited + 224) = 0x656C746954;
  *(_QWORD *)(inited + 232) = 0xE500000000000000;
  v41 = 0;
  v42 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  v22 = swift_bridgeObjectRelease(v42);
  v41 = 0xD00000000000001BLL;
  v42 = 0x8000000100016690;
  v40 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x98))(v22);
  v23 = sub_1000068E4(&qword_10001E4F8);
  v24._countAndFlagsBits = String.init<A>(describing:)(&v40, v23);
  object = v24._object;
  String.append(_:)(v24);
  swift_bridgeObjectRelease(object);
  v26 = v42;
  *(_QWORD *)(inited + 240) = v41;
  *(_QWORD *)(inited + 248) = v26;
  v27 = sub_10000FD34(inited);
  v28 = sub_10000FE54(v27);
  swift_bridgeObjectRelease(v27);
  URLComponents.init(string:)(0xD000000000000012, 0x80000001000166B0);
  v29 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v3 + 48);
  if (v29(v14, 1, v2))
    result = swift_bridgeObjectRelease(v28);
  else
    result = URLComponents.queryItems.setter(v28);
  v31 = (void *)UIApp;
  if (UIApp)
  {
    if (v29(v14, 1, v2))
    {
      v32 = type metadata accessor for URL(0);
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v10, 1, 1, v32);
      v33 = v31;
      v34 = 0;
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 16))(v6, v14, v2);
      URLComponents.url.getter(v31);
      (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
      v35 = type metadata accessor for URL(0);
      v36 = *(_QWORD *)(v35 - 8);
      v34 = 0;
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v36 + 48))(v10, 1, v35) != 1)
      {
        URL._bridgeToObjectiveC()(v37);
        v34 = v38;
        (*(void (**)(_BYTE *, uint64_t))(v36 + 8))(v10, v35);
      }
    }
    objc_msgSend(v31, "openURL:withCompletionHandler:", v34, 0);

    return sub_100010660((uint64_t)v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_10000FD34(uint64_t a1)
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
  sub_1000068E4(&qword_10001E680);
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
    result = sub_10000C5D0(v7, v8);
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

uint64_t sub_10000FE54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int64_t v7;
  unint64_t *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t *v39;

  v3 = type metadata accessor for URLQueryItem(0);
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v7)
    return (uint64_t)v8;
  v31 = v1;
  v39 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_1000106A0(0, v7, 0);
  v8 = v39;
  result = sub_10001089C(a1);
  v11 = result;
  v12 = 0;
  v13 = a1 + 64;
  v32 = a1 + 80;
  v33 = v7;
  v34 = v10;
  v35 = a1 + 64;
  while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(_BYTE *)(a1 + 32))
  {
    v16 = (unint64_t)v11 >> 6;
    if ((*(_QWORD *)(v13 + 8 * ((unint64_t)v11 >> 6)) & (1 << v11)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v10)
      goto LABEL_24;
    v38 = v12;
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v18 = *v17;
    v19 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v11);
    v21 = a1;
    v22 = *v20;
    v23 = v20[1];
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v23);
    URLQueryItem.init(name:value:)(v18, v19, v22, v23);
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v19);
    v39 = v8;
    v25 = v8[2];
    v24 = v8[3];
    if (v25 >= v24 >> 1)
    {
      sub_1000106A0(v24 > 1, v25 + 1, 1);
      v8 = v39;
    }
    v8[2] = v25 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v36 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(_QWORD *)(v36 + 72) * v25, v6, v37);
    v14 = 1 << *(_BYTE *)(v21 + 32);
    if (v11 >= v14)
      goto LABEL_25;
    v13 = v35;
    v26 = *(_QWORD *)(v35 + 8 * v16);
    if ((v26 & (1 << v11)) == 0)
      goto LABEL_26;
    a1 = v21;
    LODWORD(v10) = v34;
    if (*(_DWORD *)(v21 + 36) != (_DWORD)v34)
      goto LABEL_27;
    v27 = v26 & (-2 << (v11 & 0x3F));
    if (v27)
    {
      v14 = __clz(__rbit64(v27)) | v11 & 0xFFFFFFFFFFFFFFC0;
      v15 = v33;
    }
    else
    {
      v28 = v16 + 1;
      v29 = (unint64_t)(v14 + 63) >> 6;
      v15 = v33;
      if (v16 + 1 < v29)
      {
        v30 = *(_QWORD *)(v35 + 8 * v28);
        if (v30)
        {
LABEL_20:
          v14 = __clz(__rbit64(v30)) + (v28 << 6);
        }
        else
        {
          while (v29 - 2 != v16)
          {
            v30 = *(_QWORD *)(v32 + 8 * v16++);
            if (v30)
            {
              v28 = v16 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v12 = v38 + 1;
    v11 = v14;
    if (v38 + 1 == v15)
      return (uint64_t)v8;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

id sub_100010100(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate];
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3, 0);
  v4 = &v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  v5 = objc_msgSendSuper2(&v7, "initWithContentView:", a1);

  return v5;
}

id sub_1000101F8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100010274()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100010298()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  void *v13;
  _BYTE v14[24];

  swift_beginAccess(v0 + 16, v14, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = (_QWORD *)Strong;
    if (qword_10001E930 != -1)
      swift_once(&qword_10001E930, sub_10000D328);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_100006FE4(v3, (uint64_t)qword_10001E938);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Tapped done button", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    v8 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x68))();
    if (v8)
    {
      v10 = v8;
      v11 = v9;
      ObjectType = swift_getObjectType();
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 16))(v2, 0, ObjectType, v11);
      v8 = swift_unknownObjectRelease(v10);
    }
    v13 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v2) + 0x98))(v8);

    if (!v13)
      sub_10000F5F4();

  }
}

uint64_t sub_100010414(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010424(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10001042C(uint64_t a1)
{
  sub_100010444(a1, sub_10000F338);
}

void sub_100010438(uint64_t a1)
{
  sub_100010444(a1, (void (*)(void))sub_10000F818);
}

void sub_100010444(uint64_t a1, void (*a2)(void))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  _BYTE v7[24];

  v4 = v2 + 16;
  swift_beginAccess(v4, v7, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = (void *)Strong;
    a2();

  }
}

unint64_t sub_10001049C()
{
  unint64_t result;

  result = qword_10001E638;
  if (!qword_10001E638)
  {
    result = swift_getWitnessTable(&unk_10001300C, &type metadata for TVSetupDoneViewControllerDismissReason);
    atomic_store(result, (unint64_t *)&qword_10001E638);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for TVSetupDoneViewControllerDismissReason(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TVSetupDoneViewControllerDismissReason(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TVSetupDoneViewControllerDismissReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000105CC + 4 * byte_100013005[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100010600 + 4 * byte_100013000[v4]))();
}

uint64_t sub_100010600(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010608(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100010610);
  return result;
}

uint64_t sub_10001061C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100010624);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100010628(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010630(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001063C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100010648(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TVSetupDoneViewControllerDismissReason()
{
  return &type metadata for TVSetupDoneViewControllerDismissReason;
}

uint64_t sub_100010660(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000068E4(&qword_10001E668);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000106A0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000106BC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1000106BC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
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
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000068E4(&qword_10001E678);
  v11 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for URLQueryItem(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001089C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_10001093C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100007258(v0, qword_10001EA58);
  v1 = sub_100006FE4(v0, (uint64_t)qword_10001EA58);
  v2 = sub_100007B74();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100010998()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_1000109E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _BYTE v7[24];

  v5 = v2 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate;
  swift_beginAccess(v5, v7, 1, 0);
  *(_QWORD *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign(v5, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_100010A4C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_100004DDC;
}

void sub_100010AC0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
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
  NSString v21;
  NSString v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  Class isa;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSString v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  _QWORD v58[2];
  __int128 aBlock;
  __int128 v60;
  void (*v61)();
  uint64_t v62;
  objc_super v63;

  v1 = v0;
  v63.receiver = v0;
  v63.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  objc_msgSendSuper2(&v63, "viewDidLoad");
  objc_msgSend(v0, "setDismissalType:", 3);
  sub_100011608(0xD00000000000001DLL, (void *)0x80000001000166D0);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "setTitle:", v4);

  v5 = WiFiCopyCurrentNetworkInfo(0);
  if (v5)
  {
    v6 = (void *)v5;
    *(_QWORD *)&aBlock = 0;
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(v5, &aBlock, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

    v7 = aBlock;
    if ((_QWORD)aBlock)
    {
      if (*(_QWORD *)(aBlock + 16) && (v8 = sub_10000C5D0(1684632435, 0xE400000000000000), (v9 & 1) != 0))
      {
        sub_1000070A0(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&aBlock);
      }
      else
      {
        aBlock = 0u;
        v60 = 0u;
      }
      swift_bridgeObjectRelease(v7);
      if (*((_QWORD *)&v60 + 1))
      {
        if (swift_dynamicCast(v58, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 6))
        {
          v11 = v58[0];
          v10 = v58[1];
          goto LABEL_12;
        }
      }
      else
      {
        sub_100007060((uint64_t)&aBlock);
      }
    }
  }
  v11 = 0;
  v10 = 0xE000000000000000;
LABEL_12:
  v12 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v12 = v11 & 0xFFFFFFFFFFFFLL;
  if (v12)
  {
    v13 = sub_100011608(0xD00000000000001CLL, (void *)0x80000001000166F0);
    v15 = v14;
    v16 = sub_1000068E4(&qword_10001E628);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100012FB0;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_1000114FC();
    *(_QWORD *)(v17 + 32) = v11;
    *(_QWORD *)(v17 + 40) = v10;
    String.init(format:_:)(v13, v15, v17);
    v19 = v18;
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    swift_bridgeObjectRelease(v10);
    sub_100011608(0xD000000000000024, (void *)0x8000000100016710);
    v19 = v20;
  }
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  objc_msgSend(v1, "setSubtitle:", v21);

  v22 = String._bridgeToObjectiveC()();
  v23 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v22);

  if (v23)
  {
    v24 = objc_msgSend((id)objc_opt_self(UIColor), "systemBlueColor");
    v25 = objc_msgSend(v23, "imageWithTintColor:", v24);

  }
  else
  {
    v25 = 0;
  }
  v26 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v25);
  objc_msgSend(v26, "setContentMode:", 1);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = objc_msgSend(v1, "contentView");
  objc_msgSend(v27, "addSubview:", v26);

  v28 = objc_msgSend(v1, "contentView");
  v29 = objc_msgSend(v28, "mainContentGuide");

  v30 = (void *)objc_opt_self(NSLayoutConstraint);
  v31 = sub_1000068E4(&qword_10001E388);
  v32 = swift_allocObject(v31, 72, 7);
  *(_OWORD *)(v32 + 16) = xmmword_100012C50;
  v33 = objc_msgSend(v26, "centerXAnchor");
  v34 = objc_msgSend(v29, "centerXAnchor");
  v35 = objc_msgSend(v33, "constraintEqualToAnchor:", v34);

  *(_QWORD *)(v32 + 32) = v35;
  v36 = objc_msgSend(v26, "centerYAnchor");
  v37 = objc_msgSend(v29, "centerYAnchor");
  v38 = objc_msgSend(v36, "constraintEqualToAnchor:", v37);

  *(_QWORD *)(v32 + 40) = v38;
  v39 = objc_msgSend(v26, "leadingAnchor");
  v40 = objc_msgSend(v29, "leadingAnchor");
  v41 = objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v40);

  *(_QWORD *)(v32 + 48) = v41;
  v42 = objc_msgSend(v26, "trailingAnchor");
  v43 = objc_msgSend(v29, "trailingAnchor");
  v44 = objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43);

  *(_QWORD *)(v32 + 56) = v44;
  v45 = objc_msgSend(v26, "bottomAnchor");
  v46 = objc_msgSend(v29, "bottomAnchor");
  v47 = objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v46);

  *(_QWORD *)(v32 + 64) = v47;
  *(_QWORD *)&aBlock = v32;
  specialized Array._endMutation()();
  v48 = aBlock;
  sub_100011540();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v48);
  objc_msgSend(v30, "activateConstraints:", isa);

  sub_100011608(0x45554E49544E4F43, (void *)0xE800000000000000);
  v51 = v50;
  v52 = swift_allocObject(&unk_100018CC0, 24, 7);
  swift_unknownObjectWeakInit(v52 + 16, v1);
  swift_retain(v52);
  v53 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v51);
  v61 = sub_1000115A0;
  v62 = v52;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v60 = sub_100005734;
  *((_QWORD *)&v60 + 1) = &unk_100018CD8;
  v54 = _Block_copy(&aBlock);
  v55 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v53, 0, v54);

  _Block_release(v54);
  v56 = v62;
  swift_release(v52);
  swift_release(v56);
  v57 = objc_msgSend(v1, "addAction:", v55);

}

uint64_t type metadata accessor for TVSetupCaptiveNetworkWarningViewController()
{
  return objc_opt_self(_TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController);
}

void sub_10001125C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;

  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue) & 1) == 0)
  {
    v1 = v0;
    *((_BYTE *)v0 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue) = 1;
    if (qword_10001EA50 != -1)
      swift_once(&qword_10001EA50, sub_10001093C);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_100006FE4(v2, (uint64_t)qword_10001EA58);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Tapped continue button", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }

    sub_100011608(0x495443454E4E4F43, (void *)0xEA0000000000474ELL);
    v8 = v7;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    objc_msgSend(v1, "showActivityIndicatorWithStatus:", v9);

    v10 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x60))();
    if (v10)
    {
      v12 = v10;
      v13 = v11;
      ObjectType = swift_getObjectType(v10);
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(v13 + 8))(v1, ObjectType, v13);
      swift_unknownObjectRelease(v12);
    }
  }
}

id sub_1000113E4(void *a1)
{
  _BYTE *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate];
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3, 0);
  v1[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  v4 = objc_msgSendSuper2(&v6, "initWithContentView:", a1);

  return v4;
}

id sub_1000114BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_1000114FC()
{
  unint64_t result;

  result = qword_10001E690;
  if (!qword_10001E690)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001E690);
  }
  return result;
}

unint64_t sub_100011540()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E378;
  if (!qword_10001E378)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001E378);
  }
  return result;
}

uint64_t sub_10001157C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000115A0()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  _BYTE v3[24];

  swift_beginAccess(v0 + 16, v3, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = (void *)Strong;
    sub_10001125C();

  }
}

uint64_t sub_1000115F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011600(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100011608(uint64_t a1, void *a2)
{
  id v4;
  Swift::String v5;
  Swift::String_optional v6;
  Swift::String v7;
  uint64_t countAndFlagsBits;
  Swift::String v10;

  v4 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v10._object = (void *)0xE000000000000000;
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  v6.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v6.value._object = (void *)0xEB00000000656C62;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v10._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, v6, (NSBundle)v4, v7, v10)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000116B0()
{
  return 1;
}

id sub_1000116C0()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id sub_1000116E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC16TVSetupUIService11AppDelegate);
}

void sub_10001176C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *ObjCClassFromMetadata;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = type metadata accessor for AppDelegate();
  v1 = static CommandLine.unsafeArgv.getter();
  v2 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v3 = static CommandLine.argc.getter(v2);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v0);
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  LODWORD(v5) = UIApplicationMain(_:_:_:_:)(v3, v1, 0, 0, v6, v8);
  swift_bridgeObjectRelease(v8);
  exit((int)v5);
}

id sub_1000117F4()
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

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = static CommandLine.argc.getter(v4);
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t sub_1000118AC(char a1)
{
  const char *v1;

  if (!a1)
    return sub_100011608(0xD000000000000013, (void *)0x80000001000167E0);
  if (a1 == 1)
    v1 = "DEVICE_CLASS_IPAD";
  else
    v1 = "DEVICE_CLASS_IPOD";
  return sub_100011608(0xD000000000000011, (void *)((unint64_t)(v1 - 32) | 0x8000000000000000));
}

uint64_t sub_100011904()
{
  NSString v0;
  unsigned int v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  _BYTE v7[24];

  if (qword_10001EA70 != -1)
    swift_once(&qword_10001EA70, sub_1000119CC);
  v0 = String._bridgeToObjectiveC()();
  v1 = MGGetSInt32Answer(v0, 0xFFFFFFFFLL);

  swift_beginAccess(&qword_10001EA78, v7, 32, 0);
  v2 = qword_10001EA78;
  if (*(_QWORD *)(qword_10001EA78 + 16) && (v3 = sub_1000119F0(v1), (v4 & 1) != 0))
    v5 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 56) + v3);
  else
    v5 = 3;
  swift_endAccess(v7);
  return v5;
}

unint64_t sub_1000119CC()
{
  unint64_t result;

  result = sub_100011C74((uint64_t)&off_100018D00);
  qword_10001EA78 = result;
  return result;
}

unint64_t sub_1000119F0(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:bytes:count:)(*(_QWORD *)(v1 + 40), a1, 4);
  return sub_100011BD8(a1, v3);
}

unint64_t sub_100011A28()
{
  unint64_t result;

  result = qword_10001E760;
  if (!qword_10001E760)
  {
    result = swift_getWitnessTable(&unk_1000131DC, &type metadata for DeviceInfo.DeviceType);
    atomic_store(result, (unint64_t *)&qword_10001E760);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceInfo()
{
  return &type metadata for DeviceInfo;
}

uint64_t getEnumTagSinglePayload for DeviceInfo.DeviceType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DeviceInfo.DeviceType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100011B58 + 4 * byte_1000131D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100011B8C + 4 * asc_1000131D0[v4]))();
}

uint64_t sub_100011B8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100011B94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100011B9CLL);
  return result;
}

uint64_t sub_100011BA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100011BB0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100011BB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100011BBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceInfo.DeviceType()
{
  return &type metadata for DeviceInfo.DeviceType;
}

unint64_t sub_100011BD8(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_100011C74(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE *i;
  unsigned int v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_1000068E4(&qword_10001E768);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
    for (i = (_BYTE *)(a1 + 36); ; i += 8)
    {
      v5 = *((_DWORD *)i - 1);
      v6 = *i;
      result = sub_1000119F0(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_100011D48()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

id sub_100011D58()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_10001EB88 = (uint64_t)result;
  return result;
}

uint64_t sub_100011DA8(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001EC48, 0x7269437472656C41, 0xEB00000000656C63);
}

uint64_t sub_100011DD0()
{
  return sub_100011E44(&qword_10001EB90, (uint64_t)qword_10001EC48, (uint64_t)sub_100011DA8);
}

uint64_t sub_100011DEC@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EB90, (uint64_t)qword_10001EC48, (uint64_t)sub_100011DA8, a1);
}

uint64_t sub_100011E08(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001EC60, 0x5654656C707041, 0xE700000000000000);
}

uint64_t sub_100011E28()
{
  return sub_100011E44(&qword_10001EB98, (uint64_t)qword_10001EC60, (uint64_t)sub_100011E08);
}

uint64_t sub_100011E44(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (*a1 != -1)
    swift_once(a1, a3);
  v4 = type metadata accessor for ImageResource(0);
  return sub_100006FE4(v4, a2);
}

uint64_t sub_100011E84@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EB98, (uint64_t)qword_10001EC60, (uint64_t)sub_100011E08, a1);
}

uint64_t sub_100011EA0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = type metadata accessor for ImageResource(0);
  v7 = sub_100006FE4(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a4, v7, v6);
}

uint64_t sub_100011F08(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001EC78, 0x2D5654656C707041, 0xEC0000003535324ALL);
}

uint64_t sub_100011F30()
{
  return sub_100011E44(&qword_10001EBA0, (uint64_t)qword_10001EC78, (uint64_t)sub_100011F08);
}

uint64_t sub_100011F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EBA0, (uint64_t)qword_10001EC78, (uint64_t)sub_100011F08, a1);
}

uint64_t sub_100011F68(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001EC90, 0x74694B656D6F48, 0xE700000000000000);
}

uint64_t sub_100011F88()
{
  return sub_100011E44(&qword_10001EBA8, (uint64_t)qword_10001EC90, (uint64_t)sub_100011F68);
}

uint64_t sub_100011FA4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EBA8, (uint64_t)qword_10001EC90, (uint64_t)sub_100011F68, a1);
}

uint64_t sub_100011FC0(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001ECA8, 0x747061432D424F4FLL, 0xEB00000000657669);
}

uint64_t sub_100011FE8()
{
  return sub_100011E44(&qword_10001EBB0, (uint64_t)qword_10001ECA8, (uint64_t)sub_100011FC0);
}

uint64_t sub_100012004@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EBB0, (uint64_t)qword_10001ECA8, (uint64_t)sub_100011FC0, a1);
}

uint64_t sub_100012020(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001ECC0, 0x65746F6D6552, 0xE600000000000000);
}

uint64_t sub_10001203C()
{
  return sub_100011E44(&qword_10001EBB8, (uint64_t)qword_10001ECC0, (uint64_t)sub_100012020);
}

uint64_t sub_100012058@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EBB8, (uint64_t)qword_10001ECC0, (uint64_t)sub_100012020, a1);
}

uint64_t sub_100012074(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001ECD8, 0xD000000000000012, 0x8000000100016470);
}

uint64_t sub_100012098()
{
  return sub_100011E44(&qword_10001EBC0, (uint64_t)qword_10001ECD8, (uint64_t)sub_100012074);
}

uint64_t sub_1000120B4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EBC0, (uint64_t)qword_10001ECD8, (uint64_t)sub_100012074, a1);
}

uint64_t sub_1000120D0(uint64_t a1)
{
  return sub_1000120F4(a1, qword_10001ECF0, 0x634964756F6C4369, 0xEA00000000006E6FLL);
}

uint64_t sub_1000120F4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for ImageResource(0);
  sub_100007258(v7, a2);
  sub_100006FE4(v7, (uint64_t)a2);
  if (qword_10001EB80 != -1)
    swift_once(&qword_10001EB80, sub_100011D58);
  return ImageResource.init(name:bundle:)(a3, a4, (id)qword_10001EB88);
}

uint64_t sub_10001218C()
{
  return sub_100011E44(&qword_10001EBC8, (uint64_t)qword_10001ECF0, (uint64_t)sub_1000120D0);
}

uint64_t sub_1000121A8@<X0>(uint64_t a1@<X8>)
{
  return sub_100011EA0(&qword_10001EBC8, (uint64_t)qword_10001ECF0, (uint64_t)sub_1000120D0, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC16TVSetupUIServiceP33_78D3E49BDFAACD3E88735C3078AEDF6219ResourceBundleClass);
}

void sub_1000121E4()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "TVRViewServiceConfigContext");
  sub_100012208(v0);
}

void sub_100012208()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "TVRViewServiceManager");
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

id objc_msgSend_initWithDeviceIdentifier_identifierType_deviceType_launchContext_launchMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:");
}

id objc_msgSend_presentWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWithContext:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}
