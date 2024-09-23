int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;

  v3 = static CommandLine.argc.getter(*(_QWORD *)&argc, argv, envp);
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v3, v4, 0, 0);
  return 0;
}

void type metadata accessor for HKSPSleepLockScreenState(uint64_t a1)
{
  sub_100005098(a1, &qword_100019140, (uint64_t)&unk_1000149B8);
}

uint64_t sub_100004F7C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100004FB0(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004FBC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100004FDC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_100005098(a1, &qword_100019148, (uint64_t)&unk_100014A30);
}

__n128 sub_10000501C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005028(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100005048(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_100005098(a1, &qword_1000192D0, (uint64_t)&unk_100014AB0);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100005098(a1, &qword_1000192D8, (uint64_t)&unk_100014B30);
}

void sub_100005098(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_1000050E4()
{
  uint64_t v0;
  uint64_t ObjectType;
  Swift::String v2;
  uint64_t v3;
  void *v4;
  Swift::String v5;
  uint64_t v7;

  ObjectType = swift_getObjectType(v0);
  v7 = _typeName(_:qualified:)(ObjectType, 0);
  v2._countAndFlagsBits = 58;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugIdentifier);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugIdentifier + 8);
  swift_bridgeObjectRetain(v4);
  v5._countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v4);
  return v7;
}

void sub_100005168(uint64_t a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t ObjectType;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  double *v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t Strong;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  char v38;
  uint64_t v39;
  _QWORD v40[5];
  _BYTE v41[32];
  char v42;
  CGRect v43;
  CGRect v44;

  v2 = v1;
  ObjectType = swift_getObjectType(v1);
  sub_100006A64(a1, (uint64_t)v40);
  v5 = *(double *)v40;
  v6 = *(double *)&v40[1];
  v7 = *(double *)&v40[2];
  v8 = *(double *)&v40[3];
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (double *)&v2[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  if ((v2[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame + 32] & 1) != 0)
  {
    v14 = sub_100006A64(a1, (uint64_t)v41);
    if ((v42 & 1) != 0)
      return;
  }
  else
  {
    v15 = *v13;
    v16 = v13[1];
    v17 = v13[2];
    v18 = v13[3];
    v14 = sub_100006A64(a1, (uint64_t)v41);
    if ((v42 & 1) == 0)
    {
      v43.origin.x = v15;
      v43.origin.y = v16;
      v43.size.width = v17;
      v43.size.height = v18;
      v44.origin.x = v5;
      v44.origin.y = v6;
      v44.size.width = v7;
      v44.size.height = v8;
      v14 = CGRectEqualToRect(v43, v44);
      if ((v14 & 1) != 0)
        return;
    }
  }
  static Logger.mode.getter(v14);
  v19 = v2;
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc(22, -1);
    v36 = swift_slowAlloc(64, -1);
    v39 = v36;
    *(_DWORD *)v22 = 136446466;
    v23 = _typeName(_:qualified:)(ObjectType, 0);
    v25 = v24;
    *(_QWORD *)&v37[0] = sub_10000E870(v23, v24, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v37, (char *)v37 + 8, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v22 + 12) = 2080;
    v26 = *((_BYTE *)v13 + 32);
    v27 = *((_OWORD *)v13 + 1);
    v37[0] = *(_OWORD *)v13;
    v37[1] = v27;
    v38 = v26;
    sub_100006AC0(0, &qword_1000193D8, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    v29 = String.init<A>(describing:)(v37, v28);
    v31 = v30;
    *(_QWORD *)&v37[0] = sub_10000E870(v29, v30, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v37, (char *)v37 + 8, v22 + 14, v22 + 22);

    swift_bridgeObjectRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%{public}s] Calculated new visibleContentFrame: %s", (uint8_t *)v22, 0x16u);
    v32 = v36;
    swift_arrayDestroy(v36, 2, &type metadata for Any[8]);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  Strong = swift_unknownObjectWeakLoadStrong(&v19[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate]);
  if (Strong)
  {
    v34 = (void *)Strong;
    sub_1000082A0();

  }
}

id sub_10000547C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  char *v4;
  char *v5;
  uint64_t ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id result;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[2];
  uint64_t v33;
  CGRect v34;

  v5 = v4;
  ObjectType = swift_getObjectType(v4);
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = &v5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  result = (id)CGRectEqualToRect(*(CGRect *)&v5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds], v34);
  if ((result & 1) == 0)
  {
    static Logger.mode.getter(result);
    v17 = v5;
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc(22, -1);
      v31 = swift_slowAlloc(64, -1);
      v33 = v31;
      *(_DWORD *)v20 = 136446466;
      v21 = _typeName(_:qualified:)(ObjectType, 0);
      v23 = v22;
      *(_QWORD *)&v32[0] = sub_10000E870(v21, v22, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v32, (char *)v32 + 8, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v23);
      *(_WORD *)(v20 + 12) = 2080;
      v24 = *((_OWORD *)v15 + 1);
      v32[0] = *(_OWORD *)v15;
      v32[1] = v24;
      type metadata accessor for CGRect(0);
      v26 = String.init<A>(describing:)(v32, v25);
      v28 = v27;
      *(_QWORD *)&v32[0] = sub_10000E870(v26, v27, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v32, (char *)v32 + 8, v20 + 14, v20 + 22);

      swift_bridgeObjectRelease(v28);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%{public}s] Received new safeContentBounds: %s", (uint8_t *)v20, 0x16u);
      v29 = v31;
      swift_arrayDestroy(v31, 2, &type metadata for Any[8]);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v20, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return objc_msgSend(v17, "setNeedsLayout");
  }
  return result;
}

uint64_t sub_1000056E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD aBlock[5];
  uint64_t v21;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006960();
  v11 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_10000699C;
  v21 = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006C1C;
  aBlock[3] = &unk_100014B48;
  v12 = _Block_copy(aBlock);
  v13 = v21;
  swift_retain(a2);
  v14 = swift_release(v13);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v15 = sub_1000069BC();
  sub_100006AC0(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v17 = v16;
  v18 = sub_100006A04();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v3, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_1000058B0(uint64_t a1)
{
  uint64_t v1;
  void *Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    objc_msgSend(Strong, "setNeedsLayout");

  }
}

uint64_t sub_100005908(_BYTE *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t Strong;
  void *v10;
  void *v11;
  _BYTE v13[24];

  sub_100006AC0(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  result = __chkstk_darwin(v4);
  v7 = &v13[-v6 - 8];
  if (*a1 == 1)
  {
    v8 = a2 + 16;
    swift_beginAccess(v8, v13, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v8);
    if (Strong)
    {
      v10 = (void *)Strong;
      v11 = (void *)swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate);

      if (v11)
      {
        dispatch thunk of LockScreenContentModel.alarm.getter();
        sub_100008088((uint64_t)v7);

        sub_10000690C((uint64_t)v7);
      }
    }
    return dispatch thunk of LockScreenContentModel.alarmButtonPressed.setter(0);
  }
  return result;
}

void sub_100005A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3 += 16;
  swift_beginAccess(a3, v22, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a3);
  if (Strong)
  {
    v9 = (void *)Strong;
    static Logger.mode.getter(Strong);
    v10 = v9;
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc(12, -1);
      v19 = v4;
      v14 = (uint8_t *)v13;
      v15 = swift_slowAlloc(32, -1);
      v21 = v15;
      *(_DWORD *)v14 = 136446210;
      v16 = sub_1000050E4();
      v18 = v17;
      v20 = sub_10000E870(v16, v17, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v14 + 4, v14 + 12);

      swift_bridgeObjectRelease(v18);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}s] traitCollectionDidChange", v14, 0xCu);
      swift_arrayDestroy(v15, 1, &type metadata for Any[8]);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    objc_msgSend(v10, "setNeedsLayout");

  }
}

void sub_100005C24()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView])
  {
    objc_msgSend(v0, "addSubview:");
    v1 = *(void **)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView];
    if (v1)
    {
      v2 = *(void **)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView];
      if (v2)
      {
        v3 = v1;
        v13 = v2;
        v4 = objc_msgSend(v13, "layer");
        v5 = (void *)objc_opt_self(UIColor);
        v6 = objc_msgSend(v5, "blueColor");
        v7 = objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);

        v8 = objc_msgSend(v7, "CGColor");
        objc_msgSend(v4, "setBackgroundColor:", v8);

        objc_msgSend(v0, "addSubview:", v13);
        objc_msgSend(v0, "sendSubviewToBack:", v13);
        v9 = objc_msgSend(v3, "layer");
        v10 = objc_msgSend(v5, "greenColor");
        v11 = objc_msgSend(v10, "colorWithAlphaComponent:", 0.1);

        v12 = objc_msgSend(v11, "CGColor");
        objc_msgSend(v9, "setBackgroundColor:", v12);

        objc_msgSend(v0, "addSubview:", v3);
        objc_msgSend(v0, "sendSubviewToBack:", v3);

      }
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_100005E54()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  id v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  void *v24;
  char *v25;
  CGRect *v26;
  double v27;
  id v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  BOOL v37;
  double v38;
  double v39;
  double Height;
  uint64_t v41;
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  char *v59;
  uint64_t v60;
  void *v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  char *v83;
  int v84;
  id v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  double v95;
  double y;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  id result;
  uint64_t v109;
  id v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  objc_super v119;
  double v120;
  _QWORD v121[5];
  CGRect v122;

  v113 = type metadata accessor for LockScreenContentState(0);
  v112 = *(_QWORD *)(v113 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v111 = (char *)&v109 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v109 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v115 = (char *)&v109 - v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v109 - v9;
  v11 = (objc_class *)type metadata accessor for LockScreenContainerView();
  v119.receiver = v0;
  v119.super_class = v11;
  v12 = objc_msgSendSuper2(&v119, "layoutSubviews");
  static Logger.mode.getter(v12);
  v13 = v0;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.debug.getter();
  v16 = os_log_type_enabled(v14, v15);
  v116 = v6;
  v117 = v2;
  if (v16)
  {
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(32, -1);
    v120 = *(double *)&v18;
    *(_DWORD *)v17 = 136446210;
    v19 = sub_1000050E4();
    v21 = v20;
    v118 = sub_10000E870(v19, v20, (uint64_t *)&v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119, v17 + 4, v17 + 12);

    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%{public}s] layoutSubviews", v17, 0xCu);
    swift_arrayDestroy(v18, 1, &type metadata for Any[8]);
    v22 = v18;
    v2 = v117;
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

  }
  v23 = *(void (**)(char *, uint64_t))(v3 + 8);
  v23(v10, v2);
  v24 = *(void **)&v13[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView];
  v25 = v115;
  if (v24)
    objc_msgSend(v24, "setFrame:", *(double *)&v13[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds], *(double *)&v13[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 8], *(double *)&v13[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 16], *(double *)&v13[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 24]);
  v26 = (CGRect *)&v13[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  v27 = *(double *)&v13[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 16];
  v110 = (id)objc_opt_self(UIScreen);
  v28 = objc_msgSend(v110, "mainScreen");
  objc_msgSend(v28, "_referenceBounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v122.origin.x = v30;
  v122.origin.y = v32;
  v122.size.width = v34;
  v122.size.height = v36;
  v37 = CGRectGetWidth(v122) < 414.0;
  v38 = 92.0;
  if (!v37)
    v38 = 102.0;
  v39 = v27 - v38;
  Height = CGRectGetHeight(*v26);
  static Logger.mode.getter(v41);
  v42 = v13;
  v43 = Logger.logObject.getter(v42);
  v44 = static os_log_type_t.debug.getter();
  v45 = os_log_type_enabled(v43, v44);
  v114 = v23;
  if (v45)
  {
    v46 = swift_slowAlloc(22, -1);
    v47 = swift_slowAlloc(64, -1);
    v118 = v47;
    *(_DWORD *)v46 = 136446466;
    v48 = sub_1000050E4();
    v50 = v49;
    v120 = COERCE_DOUBLE(sub_10000E870(v48, v49, &v118));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v46 + 4, v46 + 12);

    swift_bridgeObjectRelease(v50);
    *(_WORD *)(v46 + 12) = 2082;
    v120 = v39;
    *(double *)v121 = Height;
    type metadata accessor for CGSize(0);
    v52 = String.init<A>(describing:)(&v120, v51);
    v54 = v53;
    v120 = COERCE_DOUBLE(sub_10000E870(v52, v53, &v118));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v46 + 14, v46 + 22);
    v55 = v54;
    v2 = v117;
    swift_bridgeObjectRelease(v55);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "[%{public}s] targetSize: %{public}s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy(v47, 2, &type metadata for Any[8]);
    swift_slowDealloc(v47, -1, -1);
    v56 = v46;
    v23 = v114;
    swift_slowDealloc(v56, -1, -1);

  }
  else
  {

  }
  v23(v25, v2);
  v59 = v116;
  v60 = OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView;
  v61 = *(void **)&v42[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView];
  if (!v61)
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LODWORD(v57) = 1112014848;
  LODWORD(v58) = 1112014848;
  v62 = objc_msgSend(v61, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v39, Height, v57, v58);
  v64 = v63;
  v66 = v65;
  static Logger.mode.getter(v62);
  v67 = v42;
  v68 = Logger.logObject.getter(v67);
  v69 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = swift_slowAlloc(22, -1);
    v71 = swift_slowAlloc(64, -1);
    v115 = (char *)v60;
    v72 = v71;
    v118 = v71;
    *(_DWORD *)v70 = 136446466;
    v73 = sub_1000050E4();
    v75 = v74;
    v120 = COERCE_DOUBLE(sub_10000E870(v73, v74, &v118));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v70 + 4, v70 + 12);

    swift_bridgeObjectRelease(v75);
    *(_WORD *)(v70 + 12) = 2082;
    v120 = v64;
    *(double *)v121 = v66;
    type metadata accessor for CGSize(0);
    v77 = String.init<A>(describing:)(&v120, v76);
    v79 = v78;
    v120 = COERCE_DOUBLE(sub_10000E870(v77, v78, &v118));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v70 + 14, v70 + 22);
    swift_bridgeObjectRelease(v79);
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "[%{public}s] size: %{public}s", (uint8_t *)v70, 0x16u);
    swift_arrayDestroy(v72, 2, &type metadata for Any[8]);
    v80 = v72;
    v60 = (uint64_t)v115;
    swift_slowDealloc(v80, -1, -1);
    swift_slowDealloc(v70, -1, -1);

    v81 = ((uint64_t (*)(char *, uint64_t))v114)(v116, v117);
  }
  else
  {

    v23(v59, v2);
  }
  v82 = CGRect.center.getter(v81, v26->origin.x, v26->origin.y, v26->size.width, v26->size.height);
  v83 = v111;
  dispatch thunk of LockScreenContentModel.state.getter();
  v84 = (*(uint64_t (**)(char *, uint64_t))(v112 + 88))(v83, v113);
  if (v84 == enum case for LockScreenContentState.loading(_:)
    || v84 == enum case for LockScreenContentState.windDown(_:)
    || v84 == enum case for LockScreenContentState.bedtime(_:))
  {
    y = v26->origin.y;
  }
  else
  {
    if (v84 != enum case for LockScreenContentState.wakeUpGreeting(_:))
    {
LABEL_31:
      result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenContainerView.swift", 45, 2, 153, 0);
      __break(1u);
      return result;
    }
    v85 = objc_msgSend(v110, "mainScreen");
    objc_msgSend(v85, "_referenceBounds");
    v87 = v86;
    v89 = v88;
    v91 = v90;
    v93 = v92;

    CGRect.center.getter(v94, v87, v89, v91, v93);
    y = v95 + v66 / -2.5;
  }
  v97 = *(void **)&v42[v60];
  if (!v97)
    goto LABEL_28;
  objc_msgSend(v97, "setFrame:", v82 + v64 * -0.5, y, v64, v66);
  v98 = *(void **)&v42[v60];
  if (!v98)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  objc_msgSend(v98, "frame");
  v100 = v99;
  v102 = v101;
  v104 = v103;
  v106 = v105;
  v107 = &v67[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  sub_100006A64((uint64_t)&v67[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame], (uint64_t)&v120);
  *(_QWORD *)v107 = v100;
  *((_QWORD *)v107 + 1) = v102;
  *((_QWORD *)v107 + 2) = v104;
  *((_QWORD *)v107 + 3) = v106;
  v107[32] = 0;
  sub_100005168((uint64_t)&v120);
  result = *(id *)&v67[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView];
  if (!result)
    return result;
  if ((v107[32] & 1) != 0)
    goto LABEL_30;
  return objc_msgSend(result, "setFrame:", *(double *)v107, *((double *)v107 + 1), *((double *)v107 + 2), *((double *)v107 + 3));
}

id sub_10000671C(void *a1)
{
  uint64_t v1;
  id result;
  id v4;
  double v5;
  double v6;

  result = objc_msgSend(a1, "state");
  if (result == (id)3)
  {
    v4 = objc_msgSend(a1, "translationInView:", v1);
    if (fabs(v5) >= fabs(v6))
    {
      if (v5 >= 0.0)
        return (id)dispatch thunk of LockScreenContentModel.moveDemoStateBackward()(v4);
      else
        return (id)dispatch thunk of LockScreenContentModel.moveDemoStateForward()(v4);
    }
    else
    {
      return (id)dispatch thunk of LockScreenContentModel.toggleDemoMode()(v4);
    }
  }
  return result;
}

id sub_100006820()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockScreenContainerView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LockScreenContainerView()
{
  return objc_opt_self(_TtC15SleepLockScreen23LockScreenContainerView);
}

uint64_t sub_10000690C(uint64_t a1)
{
  uint64_t v2;

  sub_100006AC0(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100006960()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000193C8;
  if (!qword_1000193C8)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000193C8);
  }
  return result;
}

void sub_10000699C()
{
  uint64_t v0;

  sub_1000058B0(v0);
}

uint64_t sub_1000069A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000069B4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000069BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000196E0;
  if (!qword_1000196E0)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000196E0);
  }
  return result;
}

unint64_t sub_100006A04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000196F0;
  if (!qword_1000196F0)
  {
    sub_100006AC0(255, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000196F0);
  }
  return result;
}

uint64_t sub_100006A64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_100006AC0(0, &qword_1000193D8, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100006AC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_100006B18()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;

  v1 = &v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v2 = &v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView____lazy_storage___screenBounds];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3 = &v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100012B30, "SleepLockScreen/LockScreenContainerView.swift", 45, 2, 96, 0);
  __break(1u);
}

uint64_t sub_100006BF8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_100006C1C(uint64_t a1)
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

uint64_t sub_100006C48()
{
  uint64_t v0;
  uint64_t ObjectType;
  Swift::String v2;
  uint64_t v3;
  void *v4;
  Swift::String v5;
  uint64_t v7;

  ObjectType = swift_getObjectType(v0);
  v7 = _typeName(_:qualified:)(ObjectType, 0);
  v2._countAndFlagsBits = 58;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier + 8);
  swift_bridgeObjectRetain(v4);
  v5._countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v4);
  return v7;
}

uint64_t sub_100006CCC()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), "invalidate");

  return swift_deallocClassInstance(v0, 24, 7);
}

char *sub_100006D00()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (**v9)();
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
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
  uint64_t *v25;
  id v26;
  uint64_t (**v27)();
  objc_class *v28;
  id v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint8_t *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)();
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  objc_super v53;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver] = 0;
  v9 = &off_100019000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentStateObserver] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = 0;
  v10 = v0;
  v11 = UUID.init()();
  v12 = UUID.uuidString.getter(v11);
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15 = sub_10000FD84(8, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  swift_bridgeObjectRelease(v14);
  v22 = static String._fromSubstring(_:)(v15, v17, v19, v21);
  v24 = v23;
  swift_bridgeObjectRelease(v21);
  v25 = (uint64_t *)&v10[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier];
  *v25 = v22;
  v25[1] = v24;
  v26 = objc_allocWithZone((Class)type metadata accessor for LockScreenContentModel(0));
  swift_bridgeObjectRetain(v24);
  v27 = &off_100019000;
  *(_QWORD *)&v10[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model] = LockScreenContentModel.init(debugIdentifier:)(v22, v24);

  v28 = (objc_class *)type metadata accessor for LockScreenViewController();
  v53.receiver = v10;
  v53.super_class = v28;
  v29 = objc_msgSendSuper2(&v53, "initWithNibName:bundle:", 0, 0);
  static Logger.mode.getter(v29);
  v30 = (char *)v29;
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc(12, -1);
    v34 = swift_slowAlloc(32, -1);
    v52 = v34;
    v50 = v1;
    *(_DWORD *)v33 = 136446210;
    v35 = sub_100006C48();
    v37 = v36;
    v51 = sub_10000E870(v35, v36, &v52);
    v9 = &off_100019000;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v33 + 4, v33 + 12);

    swift_bridgeObjectRelease(v37);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "[%{public}s] init", v33, 0xCu);
    swift_arrayDestroy(v34, 1, &type metadata for Any[8]);
    swift_slowDealloc(v34, -1, -1);
    v38 = v33;
    v27 = &off_100019000;
    swift_slowDealloc(v38, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v50);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v39 = *(id *)((char *)v27[125] + (_QWORD)v30);
  v40 = LockScreenContentModel.stateDidChange.getter();

  v52 = v40;
  v41 = swift_allocObject(&unk_100014C38, 24, 7);
  swift_unknownObjectWeakInit(v41 + 16, v30);
  sub_100010548(0);
  v43 = v42;
  v44 = sub_1000105AC((unint64_t *)&unk_1000197F0, (uint64_t (*)(uint64_t))sub_100010548, (uint64_t)&protocol conformance descriptor for PassthroughSubject<A, B>);
  v45 = Publisher<>.sink(receiveValue:)(sub_100010540, v41, v43, v44);
  swift_release(v41);

  swift_release(v52);
  v46 = v9[128];
  v47 = *(_QWORD *)((char *)v46 + (_QWORD)v30);
  *(_QWORD *)((char *)v46 + (_QWORD)v30) = v45;
  swift_release(v47);
  return v30;
}

void sub_1000070F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_100007DC8(a1);

  }
}

id sub_100007190()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  objc_class *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter(v3);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(12, -1);
    v18 = v1;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc(32, -1);
    v20 = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_100006C48();
    v14 = v13;
    v19 = sub_10000E870(v12, v13, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%{public}s] deinit", v10, 0xCu);
    swift_arrayDestroy(v11, 1, &type metadata for Any[8]);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  v15 = (objc_class *)type metadata accessor for LockScreenViewController();
  v21.receiver = v6;
  v21.super_class = v15;
  return objc_msgSendSuper2(&v21, "dealloc");
}

void sub_100007414()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  id v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  id v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  NSString v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  NSString v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (objc_class *)type metadata accessor for LockScreenViewController();
  v49.receiver = v0;
  v49.super_class = v5;
  v6 = objc_msgSendSuper2(&v49, "viewDidLoad");
  static Logger.mode.getter(v6);
  v7 = v0;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(12, -1);
    v46 = v1;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc(32, -1);
    v48 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = sub_100006C48();
    v15 = v14;
    v47 = sub_10000E870(v13, v14, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v11 + 4, v11 + 12);

    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%{public}s] view did load", v11, 0xCu);
    swift_arrayDestroy(v12, 1, &type metadata for Any[8]);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v46);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v16 = *(void **)&v7[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
  v17 = *(_QWORD *)&v7[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier];
  v18 = *(_QWORD *)&v7[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_debugIdentifier + 8];
  v19 = (char *)objc_allocWithZone((Class)type metadata accessor for LockScreenContainerView());
  v20 = v7;
  v21 = v16;
  swift_bridgeObjectRetain(v18);
  v22 = sub_10000F7AC(v21, v20, v17, v18, v19);
  v23 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView;
  v24 = *(void **)&v20[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView];
  *(_QWORD *)&v20[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView] = v22;

  v25 = *(void **)&v20[v23];
  if (!v25)
  {
    __break(1u);
    goto LABEL_11;
  }
  v26 = (void *)objc_opt_self(UIScreen);
  v27 = v25;
  v28 = objc_msgSend(v26, "mainScreen");
  objc_msgSend(v28, "_referenceBounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  objc_msgSend(v27, "setFrame:", v30, v32, v34, v36);
  v37 = *(void **)&v20[v23];
  if (!v37)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v38 = v37;
  v39 = String._bridgeToObjectiveC()();
  objc_msgSend(v38, "setAccessibilityIdentifier:", v39);

  v40 = objc_msgSend(v20, "view");
  if (!v40)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!*(_QWORD *)&v20[v23])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v41 = v40;
  objc_msgSend(v40, "addSubview:");

  v42 = objc_msgSend(v20, "view");
  if (v42)
  {
    v43 = v42;
    v44 = String._bridgeToObjectiveC()();
    objc_msgSend(v43, "setAccessibilityIdentifier:", v44);

    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_10000785C(char a1, SEL *a2, const char *a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (objc_class *)type metadata accessor for LockScreenViewController();
  v27.receiver = v3;
  v27.super_class = v11;
  v12 = objc_msgSendSuper2(&v27, *a2, a1 & 1);
  static Logger.mode.getter(v12);
  v13 = v3;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc(12, -1);
    v23 = a3;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc(32, -1);
    v26 = v18;
    *(_DWORD *)v17 = 136446210;
    v24 = v7;
    v19 = sub_100006C48();
    v21 = v20;
    v25 = sub_10000E870(v19, v20, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v17 + 4, v17 + 12);

    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v23, v17, 0xCu);
    swift_arrayDestroy(v18, 1, &type metadata for Any[8]);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v24);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

void sub_100007A9C(double a1, double a2, double a3, double a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  double *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;

  v5 = v4;
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DispatchPredicate(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (uint64_t *)((char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v17 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  v18 = _dispatchPreconditionTest(_:)(v17);
  v19 = (*(uint64_t (**)(_QWORD *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) != 0)
  {
    static Logger.mode.getter(v19);
    v20 = v5;
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc(22, -1);
      v24 = swift_slowAlloc(64, -1);
      v40 = v11;
      v25 = v24;
      v43 = v24;
      *(_DWORD *)v23 = 136446466;
      v26 = sub_100006C48();
      v28 = v27;
      v41 = sub_10000E870(v26, v27, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, v42, v23 + 4, v23 + 12);

      swift_bridgeObjectRelease(v28);
      *(_WORD *)(v23 + 12) = 2082;
      v41 = *(_QWORD *)&a1;
      *(double *)v42 = a2;
      *(double *)&v42[1] = a3;
      *(double *)&v42[2] = a4;
      type metadata accessor for CGRect(0);
      v30 = String.init<A>(describing:)(&v41, v29);
      v32 = v31;
      v41 = sub_10000E870(v30, v31, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, v42, v23 + 14, v23 + 22);
      swift_bridgeObjectRelease(v32);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%{public}s] update layout with safe bounds: %{public}s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy(v25, 2, &type metadata for Any[8]);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v10);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    v33 = *(char **)&v20[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView];
    if (v33)
    {
      v34 = (double *)&v33[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
      v35 = *(double *)&v33[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
      v36 = *(double *)&v33[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 8];
      v37 = *(double *)&v33[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 16];
      v38 = *(double *)&v33[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds + 24];
      *v34 = a1;
      v34[1] = a2;
      v34[2] = a3;
      v34[3] = a4;
      v39 = v33;
      sub_10000547C(v35, v36, v37, v38);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void *sub_100007DC8(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void (*v14)(_BYTE *, uint64_t, uint64_t);
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  _BYTE v31[4];
  int v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;

  v3 = type metadata accessor for LockScreenContentState(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v37 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v8 = &v31[-v7];
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = &v31[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Logger.mode.getter(v11);
  v14 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v14(v8, a1, v3);
  v15 = v1;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc(22, -1);
    v36 = v9;
    v20 = v19;
    v35 = swift_slowAlloc(64, -1);
    v39 = v35;
    *(_DWORD *)v20 = 136446466;
    v33 = v16;
    v32 = v18;
    v21 = sub_100006C48();
    v23 = v22;
    v38 = sub_10000E870(v21, v22, &v39);
    v34 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v20 + 4, v20 + 12);

    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v20 + 12) = 2082;
    v24 = v37;
    v14(v37, (uint64_t)v8, v3);
    v25 = String.init<A>(describing:)(v24, v3);
    v27 = v26;
    v38 = sub_10000E870(v25, v26, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease(v27);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v8, v3);
    v28 = v33;
    _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v32, "[%{public}s] updated content state: %{public}s", (uint8_t *)v20, 0x16u);
    v29 = v35;
    swift_arrayDestroy(v35, 2, &type metadata for Any[8]);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v34 + 8))(v13, v36);
  }
  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v8, v3);
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v13, v9);
  }
  return sub_10000AFE0();
}

void sub_100008088(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  id v16;
  uint64_t v17;

  v2 = v1;
  sub_100006AC0(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4);
  v6 = (char *)&v17 - v5;
  v7 = type metadata accessor for Alarm(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchPredicate(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (uint64_t *)((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v14 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v11);
  v15 = _dispatchPreconditionTest(_:)(v14);
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) != 0)
  {
    sub_10000F754(a1, (uint64_t)v6, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_10000F3BC((uint64_t)v6, (uint64_t)&qword_1000193C0, (uint64_t)&type metadata accessor for Alarm, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_100006AC0);
      sub_1000092F4(1);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      sub_100008480((uint64_t)v10);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    v16 = *(id *)(v2 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model);
    dispatch thunk of LockScreenContentModel.didInteractWithAlarm(_:)(a1);

  }
  else
  {
    __break(1u);
  }
}

void *sub_1000082A0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *result;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter(v3);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(12, -1);
    v18 = v1;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc(32, -1);
    v20 = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_100006C48();
    v14 = v13;
    v19 = sub_10000E870(v12, v13, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%{public}s] contentSizeDidChange", v10, 0xCu);
    swift_arrayDestroy(v11, 1, &type metadata for Any[8]);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  result = (void *)sub_100009E0C();
  if (result)
  {
    v16 = result;
    objc_msgSend(result, "didChangeStyle");
    return (void *)swift_unknownObjectRelease(v16);
  }
  return result;
}

void sub_100008480(uint64_t a1)
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t ObjCClassFromMetadata;
  void *v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  id v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  id v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  id v32;
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  char *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  char *v52;
  int v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSString v63;
  id v64;
  id v65;
  void *v66;
  NSString v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  NSString v72;
  id v73;
  id v74;
  void *v75;
  NSString v76;
  id v77;
  uint64_t v78;
  void *v79;
  char *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  void *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  void *v95;
  char *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t ObjectType;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t countAndFlagsBits;
  _BYTE *v114;
  char *v115;
  void *object;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t aBlock[5];
  char *v122;
  Swift::String v123;
  Swift::String v124;
  Swift::String v125;
  Swift::String v126;

  v119 = a1;
  ObjectType = swift_getObjectType(v1);
  sub_100006AC0(0, &qword_1000193C0, (uint64_t (*)(uint64_t))&type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2);
  v108 = (char *)&v98 - v3;
  v4 = type metadata accessor for Alarm(0);
  v118 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v102 = (char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v115 = (char *)&v98 - v8;
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v98 - v10;
  v101 = v12;
  __chkstk_darwin(v9);
  v14 = (char *)&v98 - v13;
  v106 = type metadata accessor for Logger(0);
  v105 = *(_QWORD *)(v106 - 8);
  __chkstk_darwin(v106);
  v16 = (char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LockScreenViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v17);
  v19 = (void *)objc_opt_self(NSBundle);
  v20 = objc_msgSend(v19, "bundleForClass:", ObjCClassFromMetadata);
  v123._object = (void *)0xE000000000000000;
  v21._object = (void *)0x8000000100013120;
  v21._countAndFlagsBits = 0xD000000000000012;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v123._countAndFlagsBits = 0;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v123);
  countAndFlagsBits = v23._countAndFlagsBits;
  object = v23._object;

  v24 = objc_msgSend(v19, "bundleForClass:", ObjCClassFromMetadata);
  v124._object = (void *)0xE000000000000000;
  v25._object = (void *)0x8000000100013140;
  v25._countAndFlagsBits = 0xD000000000000010;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  v124._countAndFlagsBits = 0;
  v27 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, (Swift::String_optional)0, (NSBundle)v24, v26, v124);
  v110 = v27._countAndFlagsBits;
  v112 = v27._object;

  v28 = objc_msgSend(v19, "bundleForClass:", ObjCClassFromMetadata);
  v125._object = (void *)0xE000000000000000;
  v29._object = (void *)0x8000000100013160;
  v29._countAndFlagsBits = 0xD000000000000010;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  v125._countAndFlagsBits = 0;
  v31 = NSLocalizedString(_:tableName:bundle:value:comment:)(v29, (Swift::String_optional)0, (NSBundle)v28, v30, v125);
  v103 = v31._countAndFlagsBits;
  v111 = v31._object;

  v32 = objc_msgSend(v19, "bundleForClass:", ObjCClassFromMetadata);
  v126._object = (void *)0xE000000000000000;
  v33._object = (void *)0x8000000100013180;
  v33._countAndFlagsBits = 0xD000000000000012;
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  v126._countAndFlagsBits = 0;
  v35 = NSLocalizedString(_:tableName:bundle:value:comment:)(v33, (Swift::String_optional)0, (NSBundle)v32, v34, v126);
  v107 = v35._countAndFlagsBits;
  v109 = v35._object;

  static Logger.mode.getter(v36);
  v37 = v119;
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v118 + 16);
  v38(v14, v119, v4);
  v39 = v11;
  v38(v11, v37, v4);
  v117 = v4;
  v40 = ((uint64_t (*)(char *, uint64_t, uint64_t))v38)(v115, v37, v4);
  v104 = v16;
  v41 = Logger.logObject.getter(v40);
  v42 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = swift_slowAlloc(30, -1);
    v99 = swift_slowAlloc(32, -1);
    aBlock[0] = v99;
    *(_DWORD *)v43 = 136446978;
    v44 = _typeName(_:qualified:)(ObjectType, 0);
    ObjectType = (uint64_t)v38;
    v46 = v45;
    v120 = sub_10000E870(v44, v45, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, aBlock, v43 + 4, v43 + 12);
    v47 = swift_bridgeObjectRelease(v46);
    *(_WORD *)(v43 + 12) = 1026;
    v48 = Alarm.isSleepAlarm.getter(v47) & 1;
    v49 = v117;
    v50 = *(void (**)(char *, uint64_t))(v118 + 8);
    v50(v14, v117);
    LODWORD(v120) = v48;
    v51 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, (char *)&v120 + 4, v43 + 14, v43 + 18);
    *(_WORD *)(v43 + 18) = 1026;
    v52 = v39;
    v53 = Alarm.isSnoozed.getter(v51) & 1;
    v50(v52, v49);
    LODWORD(v120) = v53;
    v54 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, (char *)&v120 + 4, v43 + 20, v43 + 24);
    *(_WORD *)(v43 + 24) = 1026;
    v55 = v115;
    LODWORD(v46) = Alarm.isFiring.getter(v54) & 1;
    v50(v55, v49);
    LODWORD(v120) = v46;
    v38 = (void (*)(char *, uint64_t, uint64_t))ObjectType;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, (char *)&v120 + 4, v43 + 26, v43 + 30);
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "[%{public}s] creating remote alert alarm - is sleep: %{BOOL,public}d, is snoozed: %{BOOL,public}d, is firing: %{BOOL,public}d", (uint8_t *)v43, 0x1Eu);
    v56 = v99;
    swift_arrayDestroy(v99, 1, &type metadata for Any[8]);
    swift_slowDealloc(v56, -1, -1);
    swift_slowDealloc(v43, -1, -1);
  }
  else
  {
    v57 = v117;
    v58 = *(void (**)(char *, uint64_t))(v118 + 8);
    v58(v115, v117);
    v58(v11, v57);
    v58(v14, v57);
  }

  (*(void (**)(char *, uint64_t))(v105 + 8))(v104, v106);
  v59 = (uint64_t)v108;
  v60 = v117;
  v38(v108, v119, v117);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v118 + 56))(v59, 0, 1, v60);
  static Alarm.statusText(for:includeTime:allowSnoozeCountdown:isShortFormat:)(v59, 1, 0, 0);
  v62 = v61;
  sub_10000F3BC(v59, (uint64_t)&qword_1000193C0, (uint64_t)&type metadata accessor for Alarm, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_100006AC0);
  if (v62)
  {
    v63 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v62);
  }
  else
  {
    v63 = 0;
  }
  v64 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteContentAlert), "initWithTitle:message:preferredStyle:", 0, v63, 0);

  v65 = objc_allocWithZone((Class)SBSRemoteContentAlertAction);
  v66 = object;
  swift_bridgeObjectRetain(object);
  v67 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v66);
  v68 = objc_msgSend(v65, "initWithTitle:style:", v67, 0);

  objc_msgSend(v64, "addAction:", v68);
  v69 = Alarm.isActive.getter();
  if ((v69 & 1) != 0)
  {
    v70 = objc_allocWithZone((Class)SBSRemoteContentAlertAction);
    v71 = v112;
    swift_bridgeObjectRetain(v112);
  }
  else
  {
    if ((Alarm.isSleepAlarm.getter(v69) & 1) == 0)
      goto LABEL_12;
    v70 = objc_allocWithZone((Class)SBSRemoteContentAlertAction);
    v71 = v111;
    swift_bridgeObjectRetain(v111);
  }
  v72 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v71);
  v73 = objc_msgSend(v70, "initWithTitle:style:", v72, 2);

  objc_msgSend(v64, "addAction:", v73);
LABEL_12:
  v74 = objc_allocWithZone((Class)SBSRemoteContentAlertAction);
  v75 = v109;
  v76 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v75);
  v77 = objc_msgSend(v74, "initWithTitle:style:", v76, 1);

  objc_msgSend(v64, "addAction:", v77);
  v114[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible] = 1;
  sub_10000AFE0();
  v78 = sub_100009E0C();
  if (v78)
  {
    v79 = (void *)v78;
    v80 = v102;
    v81 = v117;
    v38(v102, v119, v117);
    v82 = v64;
    v83 = v118;
    v84 = *(unsigned __int8 *)(v118 + 80);
    v85 = (v84 + 40) & ~v84;
    v86 = (v101 + v85 + 7) & 0xFFFFFFFFFFFFFFF8;
    v87 = (v86 + 23) & 0xFFFFFFFFFFFFFFF8;
    v88 = (char *)swift_allocObject(&unk_100014E18, v87 + 16, v84 | 7);
    v89 = countAndFlagsBits;
    v90 = v114;
    *((_QWORD *)v88 + 2) = v114;
    *((_QWORD *)v88 + 3) = v89;
    *((_QWORD *)v88 + 4) = object;
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(&v88[v85], v80, v81);
    v91 = (uint64_t *)&v88[v86];
    v92 = (uint64_t)v112;
    *v91 = v110;
    v91[1] = v92;
    v93 = (uint64_t *)&v88[v87];
    v94 = (uint64_t)v111;
    *v93 = v103;
    v93[1] = v94;
    aBlock[4] = (uint64_t)sub_10000F5B4;
    v122 = v88;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000092F0;
    aBlock[3] = (uint64_t)&unk_100014E30;
    v95 = _Block_copy(aBlock);
    v96 = v122;
    v97 = v90;
    swift_release(v96);
    objc_msgSend(v79, "presentAlert:replyBlock:", v82, v95);

    swift_unknownObjectRelease(v79);
    _Block_release(v95);
  }
  else
  {
    swift_bridgeObjectRelease(v111);
    swift_bridgeObjectRelease(v112);
    swift_bridgeObjectRelease(object);

  }
}

uint64_t sub_100008DC0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  id v31;
  id v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD aBlock[5];
  char *v57;

  v47 = a7;
  v48 = a8;
  v43 = a3;
  v44 = a4;
  v45 = a9;
  v46 = a6;
  v52 = type metadata accessor for DispatchWorkItemFlags(0);
  v55 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v51 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v53 = *(_QWORD *)(v13 - 8);
  v54 = v13;
  __chkstk_darwin(v13);
  v49 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Alarm(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  __chkstk_darwin(v15);
  v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  v50 = static OS_dispatch_queue.main.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a5, v15);
  v19 = *(unsigned __int8 *)(v16 + 80);
  v20 = (v19 + 48) & ~v19;
  v21 = (v17 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_100014E68, v22 + 16, v19 | 7);
  *((_QWORD *)v23 + 2) = a2;
  *((_QWORD *)v23 + 3) = a1;
  v24 = v44;
  *((_QWORD *)v23 + 4) = v43;
  *((_QWORD *)v23 + 5) = v24;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v23[v20], v18, v15);
  v25 = &v23[v21];
  v26 = v47;
  *(_QWORD *)v25 = v46;
  *((_QWORD *)v25 + 1) = v26;
  v27 = &v23[v22];
  v28 = v45;
  *(_QWORD *)v27 = v48;
  *((_QWORD *)v27 + 1) = v28;
  aBlock[4] = sub_10000F6E8;
  v57 = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006C1C;
  aBlock[3] = &unk_100014E80;
  v29 = _Block_copy(aBlock);
  v30 = v57;
  v31 = a2;
  v32 = a1;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRetain(v28);
  v33 = swift_release(v30);
  v34 = v49;
  static DispatchQoS.unspecified.getter(v33);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v35 = sub_1000105AC((unint64_t *)&qword_1000196E0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  sub_100006AC0(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v37 = v36;
  v38 = sub_100006A04();
  v40 = v51;
  v39 = v52;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v37, v38, v52, v35);
  v41 = (void *)v50;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v34, v40, v29);
  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v39);
  return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v34, v54);
}

void sub_1000090B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void *v36;
  char v37;
  id v39;
  id v41;

  *(_BYTE *)(a1 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible) = 0;
  sub_10000AFE0();
  v15 = objc_msgSend(a2, "title");
  if (v15)
  {
    v16 = v15;
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v19 = v18;

    if (v17 == a3 && v19 == a4)
    {
      v22 = swift_bridgeObjectRelease(a4);
    }
    else
    {
      v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v19, a3, a4, 0);
      v22 = swift_bridgeObjectRelease(v19);
      if ((v21 & 1) == 0)
        goto LABEL_7;
    }
    v35 = Alarm.isSleepAlarm.getter(v22);
    sub_1000092F4(v35 & 1);
    return;
  }
LABEL_7:
  v23 = objc_msgSend(a2, "title");
  if (!v23)
    goto LABEL_13;
  v24 = v23;
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  v27 = v26;

  if (v25 == a6 && v27 == a7)
  {
    swift_bridgeObjectRelease(a7);
    goto LABEL_21;
  }
  v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v27, a6, a7, 0);
  swift_bridgeObjectRelease(v27);
  if ((v29 & 1) != 0)
  {
LABEL_21:
    v39 = *(id *)(a1 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model);
    dispatch thunk of LockScreenContentModel.dismissActiveAlarm(_:)(a5);
    v36 = v39;
LABEL_24:

    return;
  }
LABEL_13:
  v30 = objc_msgSend(a2, "title");
  if (v30)
  {
    v31 = v30;
    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
    v34 = v33;

    if (v32 == a8 && v34 == a9)
    {
      swift_bridgeObjectRelease(a9);
LABEL_23:
      v41 = *(id *)(a1 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model);
      dispatch thunk of LockScreenContentModel.skipUpcomingOccurrenceAlarm()();
      v36 = v41;
      goto LABEL_24;
    }
    v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v34, a8, a9, 0);
    swift_bridgeObjectRelease(v34);
    if ((v37 & 1) != 0)
      goto LABEL_23;
  }
}

uint64_t sub_1000092F4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
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
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  unsigned __int8 v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  unsigned __int8 v42;
  id v43;
  void *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  id v48;
  NSURL *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t inited;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  Class isa;
  char *v58;
  char *v59;
  void *v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  char *v76;
  void (*v77)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88[3];

  v2 = type metadata accessor for Logger(0);
  v83 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v84 = (char *)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v82 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v85 = (char *)&v79 - v8;
  sub_100006AC0(0, &qword_100019770, v9, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v79 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v79 - v18;
  __chkstk_darwin(v17);
  v86 = (char *)&v79 - v20;
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(HKSPClockAppBundleIdentifier);
  v23 = v22;
  v24 = objc_allocWithZone((Class)LSApplicationRecord);
  v25 = sub_10000E640(v21, v23, 1);
  v34 = v25;
  if (v25)
  {
    v79 = v4;
    v80 = v2;
    v35 = objc_msgSend(v25, "applicationState");
    v36 = objc_msgSend(v35, "isInstalled");

    if ((v36 & 1) != 0)
    {
      if ((a1 & 1) != 0)
        v37 = 0xD000000000000016;
      else
        v37 = 0xD000000000000013;
      if ((a1 & 1) != 0)
        v38 = 0x8000000100013100;
      else
        v38 = 0x80000001000130E0;
      v39 = (uint64_t)v86;
      URL.init(string:)(v37, v38);
      swift_bridgeObjectRelease(v38);

      v2 = v80;
      v4 = v79;
      goto LABEL_20;
    }

    v2 = v80;
    v4 = v79;
  }
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(kHKHealthAppBundleIdentifier);
  v28 = v27;
  v29 = objc_allocWithZone((Class)LSApplicationRecord);
  v30 = sub_10000E640(v26, v28, 1);
  v40 = v30;
  v39 = (uint64_t)v86;
  if (v30)
  {
    v41 = objc_msgSend(v30, "applicationState");
    v42 = objc_msgSend(v41, "isInstalled");

    if ((v42 & 1) != 0)
    {
      v43 = (id)HKSPSleepURL(HKSPSleepLaunchURLRouteOverrideNextScheduleOccurrence, HKSPProvenanceSourceSleepLockScreen);
      if (v43)
      {
        v44 = v43;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        v45 = 0;
      }
      else
      {

        v45 = 1;
      }
      v46 = v85;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v19, v45, 1, v4);
      sub_10000F364((uint64_t)v19, v39, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_100006AC0);
      goto LABEL_21;
    }

  }
  v31 = (id)HKSPSleepFocusConfigurationURL(v30);
  if (v31)
  {
    v32 = v31;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v16, v33, 1, v4);
  sub_10000F364((uint64_t)v16, v39, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_100006AC0);
LABEL_20:
  v46 = v85;
LABEL_21:
  sub_10000F754(v39, (uint64_t)v13, &qword_100019770, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1)
  {
    sub_10000F3BC(v39, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_100006AC0);
    v47 = (uint64_t)v13;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v46, v13, v4);
    v48 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (v48)
    {
      v50 = v48;
      URL._bridgeToObjectiveC()(v49);
      v52 = v51;
      sub_100006AC0(0, &qword_100019780, (uint64_t (*)(uint64_t))sub_10000F404, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100011360;
      *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
      *(_QWORD *)(inited + 40) = v54;
      *(_QWORD *)(inited + 72) = &type metadata for Bool;
      *(_BYTE *)(inited + 48) = 1;
      *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
      *(_QWORD *)(inited + 88) = v55;
      *(_QWORD *)(inited + 120) = &type metadata for Bool;
      *(_BYTE *)(inited + 96) = 1;
      v56 = sub_100009CC8(inited);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v56);
      LODWORD(v79) = objc_msgSend(v50, "openSensitiveURL:withOptions:", v52, isa);

    }
    else
    {
      LODWORD(v79) = 2;
    }
    v58 = v84;
    v59 = v82;
    v60 = v81;
    static Logger.mode.getter(v48);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v59, v46, v4);
    v61 = v60;
    v62 = Logger.logObject.getter(v61);
    v63 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = swift_slowAlloc(32, -1);
      v82 = (char *)swift_slowAlloc(96, -1);
      v88[0] = (uint64_t)v82;
      *(_DWORD *)v64 = 136446722;
      v80 = v2;
      v65 = sub_100006C48();
      v67 = v66;
      v87 = sub_10000E870(v65, v66, v88);
      v81 = (_QWORD *)v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v64 + 4, v64 + 12);

      swift_bridgeObjectRelease(v67);
      *(_WORD *)(v64 + 12) = 2082;
      v68 = sub_1000105AC(&qword_100019778, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v69 = dispatch thunk of CustomStringConvertible.description.getter(v4, v68);
      v71 = v70;
      v87 = sub_10000E870(v69, v70, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v64 + 14, v64 + 22);
      swift_bridgeObjectRelease(v71);
      v72 = (void (*)(char *, uint64_t))v81[1];
      v72(v59, v4);
      *(_WORD *)(v64 + 22) = 2082;
      LOBYTE(v87) = v79;
      v73 = String.init<A>(describingOptional:)(&v87, &type metadata for Bool);
      v75 = v74;
      v87 = sub_10000E870(v73, v74, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v64 + 24, v64 + 32);
      swift_bridgeObjectRelease(v75);
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "[%{public}s] opening %{public}s, success: %{public}s", (uint8_t *)v64, 0x20u);
      v76 = v82;
      swift_arrayDestroy(v82, 3, &type metadata for Any[8]);
      swift_slowDealloc(v76, -1, -1);
      swift_slowDealloc(v64, -1, -1);

      (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v80);
      v72(v85, v4);
    }
    else
    {

      v77 = *(void (**)(char *, uint64_t))(v5 + 8);
      v77(v59, v4);

      (*(void (**)(char *, uint64_t))(v83 + 8))(v58, v2);
      v77(v46, v4);
    }
    v47 = (uint64_t)v86;
  }
  return sub_10000F3BC(v47, (uint64_t)&qword_100019770, (uint64_t)&type metadata accessor for URL, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_100006AC0);
}

unint64_t sub_100009BB4(uint64_t a1)
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
  sub_10000F138(0);
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
    result = sub_10000F1AC(v7, v8);
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

unint64_t sub_100009CC8(uint64_t a1)
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
  sub_10000F46C(0, (unint64_t *)&unk_100019790, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, (uint64_t (*)(_QWORD, uint64_t, char *))&type metadata accessor for _DictionaryStorage);
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
    sub_10000F4C0(v7, (uint64_t)&v16);
    v8 = v16;
    v9 = v17;
    result = sub_10000F1AC(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000E858(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_100009E0C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint8_t *v21;
  uint64_t v22;
  __int128 aBlock;
  __int128 v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((_BYTE *)v0 + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection) != 1)
  {
    static Logger.mode.getter(v3);
    v11 = v0;
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = swift_slowAlloc(32, -1);
      *(_QWORD *)&aBlock = v15;
      *(_DWORD *)v14 = 136446210;
      v21 = v14 + 4;
      v16 = sub_100006C48();
      v18 = v17;
      v27 = sub_10000E870(v16, v17, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28, v21, v14 + 12);

      swift_bridgeObjectRelease(v18);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%{public}s] requested remote content host proxy before configuring connection", v14, 0xCu);
      swift_arrayDestroy(v15, 1, &type metadata for Any[8]);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  v6 = swift_allocObject(&unk_100014DC8, 24, 7);
  *(_QWORD *)(v6 + 16) = v0;
  v25 = sub_10000F2F8;
  v26 = v6;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v24 = sub_10000A370;
  *((_QWORD *)&v24 + 1) = &unk_100014DE0;
  v7 = _Block_copy(&aBlock);
  v8 = v26;
  v9 = v0;
  swift_release(v8);
  v10 = objc_msgSend(v9, "_remoteViewControllerProxyWithErrorHandler:", v7);
  _Block_release(v7);
  if (v10)
  {
    _bridgeAnyObjectToAny(_:)(&aBlock, v10);
    swift_unknownObjectRelease(v10);
  }
  else
  {
    aBlock = 0u;
    v24 = 0u;
  }
  sub_10000F364((uint64_t)&aBlock, (uint64_t)&v27, (uint64_t)&unk_100019758, (uint64_t)&type metadata for Any[8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10001035C);
  if (!v28[2])
  {
    sub_10000F3BC((uint64_t)&v27, (uint64_t)&unk_100019758, (uint64_t)&type metadata for Any[8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_10001035C);
    return 0;
  }
  v19 = sub_1000104F0(0, &qword_100019760, &protocolRef_SBSRemoteContentHostInterface);
  if (swift_dynamicCast(&v22, &v27, &type metadata for Any[8], v19, 6))
    return v22;
  else
    return 0;
}

uint64_t sub_10000A124(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin();
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter(v6);
  v9 = a2;
  swift_errorRetain(a1);
  v10 = v9;
  v11 = swift_errorRetain(a1);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v26 = v4;
    v15 = v14;
    v16 = swift_slowAlloc(64, -1);
    v28 = v16;
    *(_DWORD *)v15 = 136446466;
    v17 = sub_100006C48();
    v19 = v18;
    v27 = sub_10000E870(v17, v18, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 4, v15 + 12);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v15 + 12) = 2082;
    v27 = a1;
    swift_errorRetain(a1);
    sub_10000F300(0);
    v21 = String.init<A>(describing:)(&v27, v20);
    v23 = v22;
    v27 = sub_10000E870(v21, v22, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v23);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%{public}s] error acquiring remote content host proxy: %{public}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v16, 2, &type metadata for Any[8]);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v26);
  }
  else
  {

    swift_errorRelease(a1);
    swift_errorRelease(a1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

void sub_10000A370(uint64_t a1, void *a2)
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

void sub_10000A3FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  _BYTE *v27;
  _BYTE *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  _BYTE *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint8_t *v66;
  uint64_t v67;
  double v68;
  _QWORD v69[3];
  uint64_t v70;
  uint64_t v71;

  v4 = v3;
  v8 = type metadata accessor for Logger(0);
  v66 = *(uint8_t **)(v8 - 8);
  v67 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v63 - v12;
  v14 = type metadata accessor for DispatchPredicate(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (uint64_t *)((char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v17 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  v18 = _dispatchPreconditionTest(_:)(v17);
  (*(void (**)(_QWORD *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) != 0)
  {
    v65 = v10;
    v4[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection] = 1;
    v19 = BSDeserializeCGRectFromXPCDictionaryWithKey(a2, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    static Logger.mode.getter(v26);
    swift_unknownObjectRetain_n(a3, 2);
    v27 = v4;
    swift_bridgeObjectRetain_n(a1, 2);
    v28 = v27;
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc(42, -1);
      v64 = swift_slowAlloc(128, -1);
      v70 = v64;
      *(_DWORD *)v31 = 136446978;
      v32 = sub_100006C48();
      v34 = v33;
      v68 = COERCE_DOUBLE(sub_10000E870(v32, v33, &v70));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v31 + 4, v31 + 12);

      swift_bridgeObjectRelease(v34);
      *(_WORD *)(v31 + 12) = 2082;
      v68 = *(double *)&a1;
      sub_10000F46C(0, (unint64_t *)&unk_100019620, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(_QWORD, uint64_t, char *))&type metadata accessor for Dictionary);
      v36 = v35;
      swift_bridgeObjectRetain(a1);
      v37 = String.init<A>(describingOptional:)(&v68, v36);
      v39 = v38;
      v68 = COERCE_DOUBLE(sub_10000E870(v37, v38, &v70));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v31 + 14, v31 + 22);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v39);
      *(_WORD *)(v31 + 22) = 2082;
      v68 = v19;
      *(double *)v69 = v21;
      *(double *)&v69[1] = v23;
      *(double *)&v69[2] = v25;
      type metadata accessor for CGRect(0);
      v41 = String.init<A>(describing:)(&v68, v40);
      v43 = v42;
      v68 = COERCE_DOUBLE(sub_10000E870(v41, v42, &v70));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v31 + 24, v31 + 32);
      swift_bridgeObjectRelease(v43);
      *(_WORD *)(v31 + 32) = 2082;
      v68 = *(double *)&a3;
      v44 = sub_1000104F0(0, &qword_100019750, &protocolRef_OS_xpc_object);
      swift_unknownObjectRetain(a3, v45);
      v46 = String.init<A>(describingOptional:)(&v68, v44);
      v48 = v47;
      v68 = COERCE_DOUBLE(sub_10000E870(v46, v47, &v70));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v31 + 34, v31 + 42);
      swift_unknownObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease(v48);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%{public}s] configure with userInfo: %{public}s, bounds: %{public}s endpoint: %{public}s", (uint8_t *)v31, 0x2Au);
      v49 = v64;
      swift_arrayDestroy(v64, 4, &type metadata for Any[8]);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v31, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease_n(a1, 2);

    }
    v50 = (uint64_t (*)(char *, uint64_t))*((_QWORD *)v66 + 1);
    v51 = v50(v13, v67);
    if (a3)
    {
      v53 = swift_unknownObjectRetain(a3, v52);
      sub_10000C58C(v53);
      swift_unknownObjectRelease(a3);
    }
    else
    {
      v54 = v65;
      static Logger.mode.getter(v51);
      v55 = v28;
      v56 = Logger.logObject.getter(v55);
      v57 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc(12, -1);
        v59 = swift_slowAlloc(32, -1);
        v68 = *(double *)&v59;
        *(_DWORD *)v58 = 136446210;
        v66 = v58 + 4;
        v60 = sub_100006C48();
        v62 = v61;
        v70 = sub_10000E870(v60, v61, (uint64_t *)&v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v66, v58 + 12);

        swift_bridgeObjectRelease(v62);
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "[%{public}s] cannot connect to sleepd due to nil endpoint", v58, 0xCu);
        swift_arrayDestroy(v59, 1, &type metadata for Any[8]);
        swift_slowDealloc(v59, -1, -1);
        swift_slowDealloc(v58, -1, -1);

      }
      else
      {

      }
      v50(v54, v67);
    }
    sub_100007A9C(v19, v21, v23, v25);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000AA50()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t aBlock[5];
  uint64_t v25;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter(v5);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(12, -1);
    v22 = v1;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc(32, -1);
    aBlock[0] = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_100006C48();
    v14 = v13;
    v23 = sub_10000E870(v12, v13, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, aBlock, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%{public}s] didChangeContentBounds called, requesting content bounds using ObjC shim", v10, 0xCu);
    swift_arrayDestroy(v11, 1, &type metadata for Any[8]);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  result = sub_100009E0C();
  if (result)
  {
    v16 = result;
    v17 = (void *)objc_opt_self(SBSRemoteContentHostInterfaceShim);
    v18 = swift_allocObject(&unk_100014D78, 24, 7);
    *(_QWORD *)(v18 + 16) = v6;
    aBlock[4] = (uint64_t)sub_10000F2F0;
    v25 = v18;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000AEF8;
    aBlock[3] = (uint64_t)&unk_100014D90;
    v19 = _Block_copy(aBlock);
    v20 = v25;
    v21 = v6;
    swift_release(v20);
    objc_msgSend(v17, "getContentBoundsWithBlock:interface:", v19, v16);
    _Block_release(v19);
    return swift_unknownObjectRelease(v16);
  }
  return result;
}

void sub_10000ACC0(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;

  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter(v14);
  v15 = a1;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v19 = swift_slowAlloc(64, -1);
    v30 = v19;
    *(_DWORD *)v18 = 136446466;
    v20 = sub_100006C48();
    v22 = v21;
    v28 = sub_10000E870(v20, v21, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, v29, v18 + 4, v18 + 12);

    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v18 + 12) = 2082;
    v28 = *(_QWORD *)&a2;
    *(double *)v29 = a3;
    *(double *)&v29[1] = a4;
    *(double *)&v29[2] = a5;
    type metadata accessor for CGRect(0);
    v24 = String.init<A>(describing:)(&v28, v23);
    v26 = v25;
    v28 = sub_10000E870(v24, v25, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, v29, v18 + 14, v18 + 22);
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%{public}s] received new bounds: %{public}s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy(v19, 2, &type metadata for Any[8]);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v18, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_100007A9C(a2, a3, a4, a5);
}

uint64_t sub_10000AEF8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void (*v9)(double, double, double, double);
  uint64_t v10;

  v9 = *(void (**)(double, double, double, double))(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  swift_retain(v10);
  v9(a2, a3, a4, a5);
  return swift_release(v10);
}

void *sub_10000AFE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char v36;
  uint64_t v37;
  char *v38;
  id v39;
  uint64_t (*v40)(char *, uint64_t);
  int v41;
  uint64_t (*v42)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  char *v54;
  uint64_t v55;
  id v56;
  char v57;
  void (*v58)(char *, uint64_t, uint64_t);
  char *v59;
  int v60;
  int v61;
  void (*v62)(char *, uint64_t, uint64_t);
  void *result;
  char *v64;
  uint64_t v65;
  id v66;
  char *v67;
  char *v68;
  char *v69;
  void (*v70)(char *, char *, uint64_t);
  int v71;
  int v72;
  uint64_t v73;
  id v74;
  char *v75;
  char *v76;
  uint64_t (*v77)(char *, uint64_t);
  int v78;
  int v79;
  int v80;
  id v81;
  char *v82;
  id v83;
  id v84;
  id v85;
  char *v86;
  char *v87;
  int v88;
  BOOL v90;
  int v91;
  id v92;
  char *v93;
  char *v94;
  int v95;
  uint64_t v96;
  uint64_t inited;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  id v110;
  Class isa;
  id v112;
  uint64_t v113;
  void *v114;
  char *v115;
  uint64_t v116;
  char *v117;
  NSObject *v118;
  os_log_type_t v119;
  int v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  void *v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  unint64_t v149;
  unint64_t v150;
  os_log_t v151;
  char *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;
  char *v164;
  uint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173[33];

  v0 = type metadata accessor for Logger(0);
  v169 = *(_QWORD *)(v0 - 8);
  v170 = v0;
  v1 = __chkstk_darwin(v0);
  v164 = (char *)&v154 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v163 = (char *)&v154 - v3;
  v4 = type metadata accessor for LockScreenContentState(0);
  v5 = *(_QWORD **)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v161 = (char *)&v154 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v162 = (char *)&v154 - v9;
  v10 = __chkstk_darwin(v8);
  v160 = (char *)&v154 - v11;
  v12 = __chkstk_darwin(v10);
  v168 = (char *)&v154 - v13;
  v14 = __chkstk_darwin(v12);
  v159 = (char *)&v154 - v15;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v154 - v17;
  v19 = __chkstk_darwin(v16);
  v167 = (char *)&v154 - v20;
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v154 - v22;
  v24 = __chkstk_darwin(v21);
  v166 = (char *)&v154 - v25;
  v26 = __chkstk_darwin(v24);
  v158 = (char *)&v154 - v27;
  v28 = __chkstk_darwin(v26);
  v165 = (uint64_t)&v154 - v29;
  __chkstk_darwin(v28);
  v31 = (char *)&v154 - v30;
  v32 = type metadata accessor for DispatchPredicate(0);
  v33 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v35 = (uint64_t *)((char *)&v154 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v35 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v33 + 104))(v35, enum case for DispatchPredicate.onQueue(_:), v32);
  v36 = _dispatchPreconditionTest(_:)(v35);
  (*(void (**)(_QWORD *, uint64_t))(v33 + 8))(v35, v32);
  if ((v36 & 1) == 0)
  {
    __break(1u);
LABEL_73:
    result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenContentState+SleepLockScreen.swift", 60, 2, 58, 0);
    goto LABEL_77;
  }
  v156 = v23;
  v157 = v18;
  v37 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model;
  v38 = v171;
  v39 = *(id *)&v171[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
  dispatch thunk of LockScreenContentModel.state.getter();

  v40 = (uint64_t (*)(char *, uint64_t))v5[11];
  LODWORD(v39) = v40(v31, v4);
  v41 = enum case for LockScreenContentState.loading(_:);
  v42 = (uint64_t (*)(char *, uint64_t))v5[1];
  v43 = v42(v31, v4);
  if ((_DWORD)v39 == v41)
  {
    v44 = v163;
    static Logger.mode.getter(v43);
    v45 = v38;
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(12, -1);
      v49 = swift_slowAlloc(32, -1);
      v173[0] = v49;
      *(_DWORD *)v48 = 136446210;
      v50 = sub_100006C48();
      v52 = v51;
      v172 = sub_10000E870(v50, v51, v173);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v48 + 4, v48 + 12);

      swift_bridgeObjectRelease(v52);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "[%{public}s] skipping updating content preferences while in loading state", v48, 0xCu);
      swift_arrayDestroy(v49, 1, &type metadata for Any[8]);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v48, -1, -1);

    }
    else
    {

    }
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v169 + 8))(v44, v170);
  }
  v53 = *(id *)&v38[v37];
  v54 = v38;
  v55 = v165;
  dispatch thunk of LockScreenContentModel.state.getter();

  v56 = *(id *)&v54[v37];
  v57 = dispatch thunk of LockScreenContentModel.hideTime.getter();

  v58 = (void (*)(char *, uint64_t, uint64_t))v5[2];
  v59 = v158;
  v58(v158, v55, v4);
  v60 = v40(v59, v4);
  v61 = enum case for LockScreenContentState.windDown(_:);
  LODWORD(v158) = v41;
  if (v60 == v41)
  {
    v62 = v58;
    v155 = 0;
LABEL_16:
    v64 = v171;
    goto LABEL_17;
  }
  if (v60 == enum case for LockScreenContentState.windDown(_:)
    || v60 == enum case for LockScreenContentState.bedtime(_:))
  {
    v62 = v58;
    v65 = 2;
    if ((v57 & 1) == 0)
      v65 = 0;
    v155 = v65;
    goto LABEL_16;
  }
  v64 = v171;
  if (v60 != enum case for LockScreenContentState.wakeUpGreeting(_:))
  {
    result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenContentState+SleepLockScreen.swift", 60, 2, 45, 0);
    goto LABEL_77;
  }
  v62 = v58;
  v155 = 0;
LABEL_17:
  v42((char *)v165, v4);
  v66 = *(id *)&v64[v37];
  v67 = v166;
  dispatch thunk of LockScreenContentModel.state.getter();

  v68 = v156;
  v69 = v67;
  v70 = (void (*)(char *, char *, uint64_t))v62;
  v62(v156, (uint64_t)v69, v4);
  v71 = v40(v68, v4);
  LODWORD(v163) = v61;
  v72 = enum case for LockScreenContentState.bedtime(_:);
  if (v71 == (_DWORD)v158)
  {
LABEL_18:
    v73 = 1;
LABEL_21:
    v165 = v73;
    goto LABEL_22;
  }
  if (v71 == v61)
  {
    v73 = 2;
    goto LABEL_21;
  }
  if (v71 != enum case for LockScreenContentState.bedtime(_:))
  {
    if (v71 != enum case for LockScreenContentState.wakeUpGreeting(_:))
    {
      result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenContentState+SleepLockScreen.swift", 60, 2, 23, 0);
LABEL_77:
      __break(1u);
      return result;
    }
    goto LABEL_18;
  }
  v165 = 3;
  v72 = v71;
LABEL_22:
  v42(v166, v4);
  v74 = *(id *)&v64[v37];
  v75 = v167;
  dispatch thunk of LockScreenContentModel.state.getter();

  v76 = v157;
  v70(v157, v75, v4);
  v77 = v40;
  v78 = v40(v76, v4);
  v79 = (int)v158;
  LODWORD(v156) = v72;
  if (v78 == (_DWORD)v158)
  {
    v80 = 0;
    LODWORD(v157) = enum case for LockScreenContentState.wakeUpGreeting(_:);
  }
  else
  {
    LODWORD(v157) = enum case for LockScreenContentState.wakeUpGreeting(_:);
    v80 = 1;
    if (v78 != (_DWORD)v163 && v78 != v72)
    {
      if (v78 != (_DWORD)v157)
      {
        result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenContentState+SleepLockScreen.swift", 60, 2, 34, 0);
        goto LABEL_77;
      }
      v80 = 0;
      LODWORD(v157) = v78;
    }
  }
  LODWORD(v166) = v80;
  v42(v167, v4);
  v81 = *(id *)&v64[v37];
  v82 = v159;
  dispatch thunk of LockScreenContentModel.state.getter();

  v42(v82, v4);
  v83 = *(id *)&v64[v37];
  dispatch thunk of LockScreenContentModel.state.getter();

  v42(v82, v4);
  v84 = *(id *)&v64[v37];
  dispatch thunk of LockScreenContentModel.state.getter();

  v42(v82, v4);
  v85 = *(id *)&v64[v37];
  v86 = v168;
  dispatch thunk of LockScreenContentModel.state.getter();

  v87 = v160;
  v70(v160, v86, v4);
  v88 = v77(v87, v4);
  v90 = v88 == v79 || v88 == (_DWORD)v163 || v88 == (_DWORD)v156;
  v91 = v90;
  if (!v90 && v88 != (_DWORD)v157)
    goto LABEL_73;
  v42(v168, v4);
  v92 = *(id *)&v64[v37];
  v93 = v162;
  dispatch thunk of LockScreenContentModel.state.getter();

  v94 = v161;
  v70(v161, v93, v4);
  v95 = v77(v94, v4);
  v96 = 3;
  if (v95 == v79 || v95 == (_DWORD)v163 || v95 == (_DWORD)v156)
    goto LABEL_44;
  if (v95 != (_DWORD)v157)
  {
    result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenContentState+SleepLockScreen.swift", 60, 2, 75, 0);
    goto LABEL_77;
  }
  v96 = 4;
LABEL_44:
  v167 = (char *)v96;
  v42(v93, v4);
  sub_100006AC0(0, &qword_100019728, (uint64_t (*)(uint64_t))sub_10000F08C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011370;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesDateTimeStyleKey);
  *(_QWORD *)(inited + 40) = v98;
  v99 = v155;
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 56) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesBackgroundStyleKey);
  *(_QWORD *)(inited + 64) = v100;
  v101 = v165;
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesReducesWhitePointKey);
  *(_QWORD *)(inited + 88) = v102;
  *(NSNumber *)(inited + 96) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 104) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesHomeGestureModeKey);
  *(_QWORD *)(inited + 112) = v103;
  *(NSNumber *)(inited + 120) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesSuppressesNotificationsKey);
  *(_QWORD *)(inited + 136) = v104;
  *(NSNumber *)(inited + 144) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 152) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesSuppressesBottomEdgeContentKey);
  *(_QWORD *)(inited + 160) = v105;
  v168 = (char *)OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible;
  *(NSNumber *)(inited + 168) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesPrefersInlinePresentationKey);
  *(_QWORD *)(inited + 184) = v106;
  *(NSNumber *)(inited + 192) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 200) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesDismissesOnTapKey);
  *(_QWORD *)(inited + 208) = v107;
  *(NSNumber *)(inited + 216) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSRemoteContentPreferencesPreferredNotificationListModeKey);
  *(_QWORD *)(inited + 232) = v108;
  *(NSNumber *)(inited + 240) = Int._bridgeToObjectiveC()();
  v109 = sub_100009BB4(inited);
  v110 = objc_allocWithZone((Class)SBSRemoteContentPreferences);
  sub_10000F100(0, &qword_100019738, NSNumber_ptr);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v109);
  v112 = objc_msgSend(v110, "initWithConfiguration:", isa);

  v113 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences;
  v114 = *(void **)&v64[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences];
  *(_QWORD *)&v64[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences] = v112;

  v115 = v164;
  static Logger.mode.getter(v116);
  v117 = v64;
  v118 = Logger.logObject.getter(v117);
  v119 = static os_log_type_t.default.getter();
  v120 = v119;
  if (os_log_type_enabled(v118, v119))
  {
    v121 = swift_slowAlloc(112, -1);
    v165 = (uint64_t)v101;
    v122 = v64;
    v123 = v121;
    v163 = (char *)swift_slowAlloc(352, -1);
    v173[0] = (uint64_t)v163;
    *(_DWORD *)v123 = 136448770;
    LODWORD(v161) = v91;
    LODWORD(v162) = v120;
    v124 = sub_100006C48();
    v126 = v125;
    v172 = sub_10000E870(v124, v125, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 4, v123 + 12);

    swift_bridgeObjectRelease(v126);
    *(_WORD *)(v123 + 12) = 2082;
    v127 = *(void **)&v122[v113];
    v172 = (uint64_t)v127;
    v128 = sub_10000F100(0, &qword_100019740, SBSRemoteContentPreferences_ptr);
    v129 = v127;
    v130 = String.init<A>(describingOptional:)(&v172, v128);
    v132 = v131;
    v172 = sub_10000E870(v130, v131, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 14, v123 + 22);

    swift_bridgeObjectRelease(v132);
    *(_WORD *)(v123 + 22) = 2082;
    v172 = v99;
    v133 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v135 = v134;
    v172 = sub_10000E870(v133, v134, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 24, v123 + 32);
    swift_bridgeObjectRelease(v135);
    *(_WORD *)(v123 + 32) = 2082;
    v172 = v165;
    v165 = (uint64_t)v118;
    v136 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v138 = v137;
    v172 = sub_10000E870(v136, v137, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 34, v123 + 42);
    swift_bridgeObjectRelease(v138);
    *(_WORD *)(v123 + 42) = 2082;
    if ((_DWORD)v166)
      v139 = 1702195828;
    else
      v139 = 0x65736C6166;
    if ((_DWORD)v166)
      v140 = 0xE400000000000000;
    else
      v140 = 0xE500000000000000;
    v172 = sub_10000E870(v139, v140, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 44, v123 + 52);
    swift_bridgeObjectRelease(v140);
    *(_WORD *)(v123 + 52) = 2082;
    v172 = 4;
    v141 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v143 = v142;
    v172 = sub_10000E870(v141, v142, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 54, v123 + 62);
    swift_bridgeObjectRelease(v143);
    *(_WORD *)(v123 + 62) = 2082;
    v172 = sub_10000E870(1702195828, 0xE400000000000000, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 64, v123 + 72);
    *(_WORD *)(v123 + 72) = 2082;
    if (v168[(_QWORD)v171])
      v144 = 1702195828;
    else
      v144 = 0x65736C6166;
    if (v168[(_QWORD)v171])
      v145 = 0xE400000000000000;
    else
      v145 = 0xE500000000000000;
    v172 = sub_10000E870(v144, v145, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 74, v123 + 82);

    swift_bridgeObjectRelease(v145);
    *(_WORD *)(v123 + 82) = 2082;
    v172 = sub_10000E870(1702195828, 0xE400000000000000, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 84, v123 + 92);
    *(_WORD *)(v123 + 92) = 2082;
    if ((_DWORD)v161)
      v146 = 0x65736C6166;
    else
      v146 = 1702195828;
    if ((_DWORD)v161)
      v147 = 0xE500000000000000;
    else
      v147 = 0xE400000000000000;
    v172 = sub_10000E870(v146, v147, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 94, v123 + 102);
    swift_bridgeObjectRelease(v147);
    *(_WORD *)(v123 + 102) = 2082;
    v172 = (uint64_t)v167;
    v148 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v150 = v149;
    v172 = sub_10000E870(v148, v149, v173);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v173, v123 + 104, v123 + 112);
    swift_bridgeObjectRelease(v150);
    v151 = (os_log_t)v165;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v165, (os_log_type_t)v162, "[%{public}s] updating content preferences %{public}s, dateTime: %{public}s, background: %{public}s, reduceWhitePoint: %{public}s, homeGestureMode: %{public}s, suppressNotifications: %{public}s, suppressBottomEdgeContent: %{public}s, presentInline: %{public}s, dismissOnTap: %{public}s, preferredNotificationListMode: %{public}s", (uint8_t *)v123, 0x70u);
    v152 = v163;
    swift_arrayDestroy(v163, 11, &type metadata for Any[8]);
    swift_slowDealloc(v152, -1, -1);
    swift_slowDealloc(v123, -1, -1);

    (*(void (**)(char *, uint64_t))(v169 + 8))(v164, v170);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v169 + 8))(v115, v170);
  }
  result = (void *)sub_100009E0C();
  if (result)
  {
    v153 = result;
    objc_msgSend(result, "didChangeStyle");
    return (void *)swift_unknownObjectRelease(v153);
  }
  return result;
}

void *sub_10000C09C(unint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
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
  _QWORD *v18;
  char v19;
  uint64_t v20;
  id v21;
  int v22;
  void (*v23)(char *, uint64_t);
  BOOL v24;
  unint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  char *v29;
  id v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *result;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v1;
  v47 = a1;
  v3 = type metadata accessor for Logger(0);
  v45 = *(_QWORD *)(v3 - 8);
  v46 = v3;
  __chkstk_darwin(v3);
  v44 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LockScreenContentState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)&v44 - v10;
  __chkstk_darwin(v12);
  v14 = (char *)&v44 - v13;
  v15 = type metadata accessor for DispatchPredicate(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char **)((char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v18 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v16 + 104))(v18, enum case for DispatchPredicate.onQueue(_:), v15);
  v19 = _dispatchPreconditionTest(_:)(v18);
  (*(void (**)(_QWORD *, uint64_t))(v16 + 8))(v18, v15);
  if ((v19 & 1) == 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v20 = OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model;
  v21 = *(id *)&v2[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
  dispatch thunk of LockScreenContentModel.state.getter();

  LODWORD(v21) = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v14, v5);
  v22 = enum case for LockScreenContentState.wakeUpGreeting(_:);
  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v14, v5);
  v24 = (_DWORD)v21 == v22;
  v25 = v47;
  if (!v24)
    goto LABEL_7;
  if (v47 > 8)
  {
LABEL_18:
    result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenViewController.swift", 46, 2, 411, 0);
    goto LABEL_20;
  }
  if (((1 << v47) & 0x7B) == 0)
  {
    v26 = *(id *)&v2[v20];
    dispatch thunk of LockScreenContentModel.dismissWakeUpGreeting()();

  }
LABEL_7:
  v27 = *(id *)&v2[v20];
  dispatch thunk of LockScreenContentModel.state.getter();

  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for LockScreenContentState.bedtime(_:), v5);
  LOBYTE(v27) = static LockScreenContentState.== infix(_:_:)(v11, v8);
  v23(v8, v5);
  v28 = ((uint64_t (*)(char *, uint64_t))v23)(v11, v5);
  v29 = v44;
  if ((v27 & 1) != 0)
  {
    if (v25 <= 8)
    {
      if (((1 << v25) & 0x17B) == 0)
      {
        v30 = *(id *)&v2[v20];
        dispatch thunk of LockScreenContentModel.dismissSleepLock()();

      }
      goto LABEL_11;
    }
    result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "SleepLockScreen/LockScreenViewController.swift", 46, 2, 422, 0);
LABEL_20:
    __break(1u);
    return result;
  }
LABEL_11:
  static Logger.mode.getter(v28);
  v31 = v2;
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc(22, -1);
    v35 = swift_slowAlloc(64, -1);
    v49 = v35;
    *(_DWORD *)v34 = 136446466;
    v36 = sub_100006C48();
    v38 = v37;
    v48 = sub_10000E870(v36, v37, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v34 + 4, v34 + 12);

    swift_bridgeObjectRelease(v38);
    *(_WORD *)(v34 + 12) = 2082;
    v48 = v25;
    v39 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v41 = v40;
    v48 = sub_10000E870(v39, v40, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v34 + 14, v34 + 22);
    swift_bridgeObjectRelease(v41);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%{public}s] did dismiss, type: %{public}s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy(v35, 2, &type metadata for Any[8]);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v34, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v46);
  result = (void *)sub_10000D5B8();
  if (result)
  {
    v43 = result;
    objc_msgSend(result, "didDismissWithReason:", v25);
    return (void *)swift_unknownObjectRelease(v43);
  }
  return result;
}

void sub_10000C58C(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
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
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  void **v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint8_t *v53;
  void **v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  char *v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  void **v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  _QWORD *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void **aBlock;
  uint64_t v84;
  uint64_t (*v85)(uint64_t);
  void *v86;
  uint64_t (*v87)();
  uint64_t v88;

  v2 = v1;
  v81 = type metadata accessor for Logger(0);
  v77 = *(_QWORD **)(v81 - 8);
  __chkstk_darwin(v81);
  v79 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v78 = (char *)&v75 - v6;
  __chkstk_darwin(v7);
  v9 = (char *)&v75 - v8;
  sub_100006AC0(0, &qword_100019718, (uint64_t (*)(uint64_t))sub_10000E510, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published.Publisher);
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v14 = (char *)&v75 - v13;
  v15 = type metadata accessor for DispatchPredicate(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (uint64_t *)((char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v18 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v16 + 104))(v18, enum case for DispatchPredicate.onQueue(_:), v15);
  v19 = _dispatchPreconditionTest(_:)(v18);
  (*(void (**)(_QWORD *, uint64_t))(v16 + 8))(v18, v15);
  if ((v19 & 1) != 0)
  {
    v20 = type metadata accessor for LockScreenClient(0);
    v80 = swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
    v21 = v80 + OBJC_IVAR____TtC15SleepLockScreen16LockScreenClient__state;
    sub_10000E510(0);
    aBlock = 0;
    v84 = 0;
    Published.init(initialValue:)(&aBlock, v22);
    swift_beginAccess(v21, &aBlock, 33, 0);
    sub_100006AC0(0, &qword_100019608, (uint64_t (*)(uint64_t))sub_10000E510, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
    Published.projectedValue.getter();
    swift_endAccess(&aBlock);
    v23 = swift_allocObject(&unk_100014C38, 24, 7);
    swift_unknownObjectWeakInit(v23 + 16, v2);
    v24 = swift_allocObject(&unk_100014C60, 32, 7);
    *(_QWORD *)(v24 + 16) = sub_10000EF28;
    *(_QWORD *)(v24 + 24) = v23;
    v25 = sub_10000EF7C(&qword_100019720, (uint64_t)&qword_100019718, (uint64_t)sub_10000E510, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))sub_100006AC0);
    v26 = Publisher<>.sink(receiveValue:)(sub_10000EF54, v24, v11, v25);
    swift_release(v24);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v27 = *(_QWORD *)&v2[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver];
    *(_QWORD *)&v2[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver] = v26;
    v28 = swift_release(v27);
    static Logger.mode.getter(v28);
    v29 = v2;
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = (void **)swift_slowAlloc(32, -1);
      aBlock = v33;
      *(_DWORD *)v32 = 136446210;
      v34 = sub_100006C48();
      v36 = v35;
      v82 = sub_10000E870(v34, v35, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, &aBlock, v32 + 4, v32 + 12);

      swift_bridgeObjectRelease(v36);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "[%{public}s] creating connection", v32, 0xCu);
      swift_arrayDestroy(v33, 1, &type metadata for Any[8]);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);

    }
    else
    {

    }
    v37 = (void (*)(char *, uint64_t))v77[1];
    v37(v9, v81);
    v38 = objc_msgSend(objc_allocWithZone((Class)NSXPCListenerEndpoint), "init");
    objc_msgSend(v38, "_setEndpoint:", a1);
    v39 = objc_allocWithZone((Class)NSXPCConnection);
    v77 = v38;
    v40 = objc_msgSend(v39, "initWithListenerEndpoint:", v38);
    v41 = (id)HKSPSleepLockScreenClientInterface();
    objc_msgSend(v40, "setExportedInterface:", v41);

    v42 = (id)HKSPSleepLockScreenServerInterface(objc_msgSend(v40, "setExportedObject:", v80));
    objc_msgSend(v40, "setRemoteObjectInterface:", v42);

    v43 = swift_allocObject(&unk_100014C38, 24, 7);
    swift_unknownObjectWeakInit(v43 + 16, v29);
    v87 = sub_10000EFC8;
    v88 = v43;
    aBlock = _NSConcreteStackBlock;
    v84 = 1107296256;
    v85 = sub_100006C1C;
    v86 = &unk_100014C78;
    v44 = _Block_copy(&aBlock);
    swift_release(v88);
    objc_msgSend(v40, "setInterruptionHandler:", v44);
    _Block_release(v44);
    v45 = swift_allocObject(&unk_100014C38, 24, 7);
    swift_unknownObjectWeakInit(v45 + 16, v29);
    v87 = sub_10000EFF8;
    v88 = v45;
    aBlock = _NSConcreteStackBlock;
    v84 = 1107296256;
    v85 = sub_100006C1C;
    v86 = &unk_100014CA0;
    v46 = _Block_copy(&aBlock);
    swift_release(v88);
    objc_msgSend(v40, "setInvalidationHandler:", v46);
    _Block_release(v46);
    v47 = v78;
    static Logger.mode.getter(v48);
    v49 = v29;
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = swift_slowAlloc(12, -1);
      v76 = v37;
      v53 = (uint8_t *)v52;
      v54 = (void **)swift_slowAlloc(32, -1);
      aBlock = v54;
      *(_DWORD *)v53 = 136446210;
      v55 = sub_100006C48();
      v57 = v56;
      v82 = sub_10000E870(v55, v56, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, &aBlock, v53 + 4, v53 + 12);

      swift_bridgeObjectRelease(v57);
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "[%{public}s] resuming connection", v53, 0xCu);
      swift_arrayDestroy(v54, 1, &type metadata for Any[8]);
      swift_slowDealloc(v54, -1, -1);
      v58 = v53;
      v37 = v76;
      swift_slowDealloc(v58, -1, -1);

    }
    else
    {

    }
    v37(v47, v81);
    objc_msgSend(v40, "resume");
    v59 = type metadata accessor for LockScreenViewController.DaemonConnectionWrapper();
    v60 = swift_allocObject(v59, 24, 7);
    *(_QWORD *)(v60 + 16) = v40;
    v61 = *(_QWORD *)&v49[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection];
    *(_QWORD *)&v49[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = v60;
    v62 = v40;
    v63 = swift_release(v61);
    v64 = v79;
    static Logger.mode.getter(v63);
    v65 = v49;
    v66 = Logger.logObject.getter(v65);
    v67 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc(12, -1);
      v69 = (void **)swift_slowAlloc(32, -1);
      aBlock = v69;
      *(_DWORD *)v68 = 136446210;
      v70 = sub_100006C48();
      v72 = v71;
      v82 = sub_10000E870(v70, v71, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, &aBlock, v68 + 4, v68 + 12);

      swift_bridgeObjectRelease(v72);
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "[%{public}s] requested connect", v68, 0xCu);
      swift_arrayDestroy(v69, 1, &type metadata for Any[8]);
      swift_slowDealloc(v69, -1, -1);
      swift_slowDealloc(v68, -1, -1);

      v37(v79, v81);
    }
    else
    {

      v37(v64, v81);
    }
    v73 = (void *)sub_10000D5B8();
    if (v73)
    {
      v74 = v73;
      objc_msgSend(v73, "connect");
      swift_release(v80);
      swift_unknownObjectRelease(v74);
    }
    else
    {
      swift_release(v80);
    }

  }
  else
  {
    __break(1u);
  }
}

void sub_10000CE80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[24];

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3 += 16;
  swift_beginAccess(a3, v39, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a3);
  if (Strong)
  {
    v11 = (void *)Strong;
    static Logger.mode.getter(Strong);
    swift_bridgeObjectRetain_n(a2, 2);
    v12 = v11;
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      v16 = swift_slowAlloc(32, -1);
      v35 = v7;
      v17 = v16;
      v33 = swift_slowAlloc(96, -1);
      v38 = v33;
      *(_DWORD *)v17 = 136446722;
      v34 = v6;
      HIDWORD(v32) = v15;
      v18 = sub_100006C48();
      v20 = v19;
      v37 = sub_10000E870(v18, v19, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v17 + 4, v17 + 12);

      swift_bridgeObjectRelease(v20);
      *(_WORD *)(v17 + 12) = 2082;
      v21 = (id)NSStringFromHKSPSleepLockScreenState(a1);
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v36 = a1;
      v24 = v23;

      v37 = sub_10000E870(v22, v24, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v17 + 14, v17 + 22);
      swift_bridgeObjectRelease(v24);
      *(_WORD *)(v17 + 22) = 2082;
      v37 = a2;
      sub_10000F46C(0, (unint64_t *)&unk_100019620, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(_QWORD, uint64_t, char *))&type metadata accessor for Dictionary);
      v26 = v25;
      swift_bridgeObjectRetain(a2);
      v27 = String.init<A>(describingOptional:)(&v37, v26);
      v29 = v28;
      v37 = sub_10000E870(v27, v28, &v38);
      a1 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v17 + 24, v17 + 32);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v29);
      _os_log_impl((void *)&_mh_execute_header, v13, BYTE4(v32), "[%{public}s] update to state: %{public}s, user info: %{public}s", (uint8_t *)v17, 0x20u);
      v30 = v33;
      swift_arrayDestroy(v33, 3, &type metadata for Any[8]);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v17, -1, -1);

      (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v34);
    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    v31 = *(id *)&v12[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model];
    dispatch thunk of LockScreenContentModel.lockScreenState.setter(a1, 0);

  }
}

uint64_t sub_10000D1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[5];
  uint64_t v32;
  char v33[24];

  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin(v30);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v33, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(a1);
  if (result)
  {
    v16 = (void *)result;
    sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
    v17 = static OS_dispatch_queue.main.getter();
    v29 = v9;
    v18 = (void *)v17;
    v19 = swift_allocObject(a2, 24, 7);
    *(_QWORD *)(v19 + 16) = v16;
    aBlock[4] = a3;
    v32 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006C1C;
    aBlock[3] = a4;
    v20 = _Block_copy(aBlock);
    v21 = v32;
    v22 = v16;
    v23 = swift_release(v21);
    static DispatchQoS.unspecified.getter(v23);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v24 = sub_1000105AC((unint64_t *)&qword_1000196E0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    sub_100006AC0(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    v26 = v25;
    v27 = sub_100006A04();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v26, v27, v8, v24);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v11, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v30);
  }
  return result;
}

uint64_t sub_10000D3E0(void *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter(v8);
  v9 = a1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(12, -1);
    v20 = a2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc(32, -1);
    v23 = v14;
    *(_DWORD *)v13 = 136446210;
    v21 = v4;
    v15 = sub_100006C48();
    v17 = v16;
    v22 = sub_10000E870(v15, v16, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v13 + 4, v13 + 12);

    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v20, v13, 0xCu);
    swift_arrayDestroy(v14, 1, &type metadata for Any[8]);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v18 = *(_QWORD *)&v9[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection];
  *(_QWORD *)&v9[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = 0;
  return swift_release(v18);
}

uint64_t sub_10000D5B8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  char *v18;
  id v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  uint64_t aBlock[5];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchPredicate(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (uint64_t *)((char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v9 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  v10 = _dispatchPreconditionTest(_:)(v9);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    v12 = *(_QWORD *)&v1[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection];
    if (v12)
    {
      v13 = *(void **)(v12 + 16);
      v14 = swift_allocObject(&unk_100014BE8, 24, 7);
      *(_QWORD *)(v14 + 16) = v1;
      aBlock[4] = (uint64_t)sub_10000EED8;
      v31 = v14;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000092F0;
      aBlock[3] = (uint64_t)&unk_100014C00;
      v15 = _Block_copy(aBlock);
      v16 = v31;
      swift_retain(v12);
      v17 = v13;
      v18 = v1;
      swift_release(v16);
      v19 = objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v15);
      _Block_release(v15);

      _bridgeAnyObjectToAny(_:)(aBlock, v19);
      swift_release(v12);
      swift_unknownObjectRelease(v19);
      v20 = sub_1000104F0(0, &qword_100019700, &protocolRef_HKSPSleepLockScreenServer);
      if (swift_dynamicCast(&v32, aBlock, &type metadata for Any[8], v20, 6))
        return v32;
      else
        return 0;
    }
    else
    {
      static Logger.mode.getter(result);
      v21 = v1;
      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        v25 = swift_slowAlloc(32, -1);
        *(_DWORD *)v24 = 136446210;
        v29 = v24 + 4;
        aBlock[0] = v25;
        v26 = sub_100006C48();
        v28 = v27;
        v32 = sub_10000E870(v26, v27, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v29, v24 + 12);

        swift_bridgeObjectRelease(v28);
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%{public}s] requested remote server proxy before starting sleepd connection", v24, 0xCu);
        swift_arrayDestroy(v25, 1, &type metadata for Any[8]);
        swift_slowDealloc(v25, -1, -1);
        swift_slowDealloc(v24, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D928(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.mode.getter(v8);
  v9 = a2;
  swift_errorRetain(a1);
  v10 = v9;
  v11 = swift_errorRetain(a1);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v26 = v4;
    v15 = v14;
    v16 = swift_slowAlloc(64, -1);
    v28 = v16;
    *(_DWORD *)v15 = 136446466;
    v17 = sub_100006C48();
    v19 = v18;
    v27 = sub_10000E870(v17, v18, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 4, v15 + 12);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v15 + 12) = 2082;
    v27 = a1;
    swift_errorRetain(a1);
    v20 = sub_10001049C(0, &qword_100019708, (uint64_t)&protocol descriptor for Error);
    v21 = String.init<A>(describing:)(&v27, v20);
    v23 = v22;
    v27 = sub_10000E870(v21, v22, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v23);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%{public}s] error acquiring remote server proxy: %{public}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v16, 2, &type metadata for Any[8]);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v26);
  }
  else
  {

    swift_errorRelease(a1);
    swift_errorRelease(a1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_10000DB84(uint64_t a1, void *a2)
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

uint64_t type metadata accessor for LockScreenViewController()
{
  return objc_opt_self(_TtC15SleepLockScreen24LockScreenViewController);
}

uint64_t type metadata accessor for LockScreenViewController.DaemonConnectionWrapper()
{
  return objc_opt_self(_TtCC15SleepLockScreen24LockScreenViewControllerP33_DB83B3820BCB06A68353D0742C4D0FC923DaemonConnectionWrapper);
}

uint64_t sub_10000DC5C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100011408);
  v2 = swift_getKeyPath(&unk_100011430);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_10000DCCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  _QWORD *v26;

  v3 = v2;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  v13 = (void *)static OS_dispatch_queue.main.getter();
  v14 = (_QWORD *)swift_allocObject(&unk_100014B98, 40, 7);
  v14[2] = v2;
  v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_10000E61C;
  v26 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006C1C;
  aBlock[3] = &unk_100014BB0;
  v15 = _Block_copy(aBlock);
  v16 = v26;
  swift_bridgeObjectRetain(a2);
  swift_retain(v3);
  v17 = swift_release(v16);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v18 = sub_1000105AC((unint64_t *)&qword_1000196E0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  sub_100006AC0(0, &qword_1000193D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v20 = v19;
  v21 = sub_100006A04();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v20, v21, v6, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10000DEF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  __n128 v9;
  _QWORD v11[2];

  if (a3)
  {
    sub_10000DF80(a3);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  KeyPath = swift_getKeyPath(&unk_100011408);
  v8 = swift_getKeyPath(&unk_100011430);
  v11[0] = a2;
  v11[1] = v6;
  v9 = swift_retain(a1);
  return static Published.subscript.setter(v11, a1, KeyPath, v8, v9);
}

void sub_10000DF80(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  Swift::Int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10000F46C(0, &qword_1000196F8, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(_QWORD, uint64_t, char *))&type metadata accessor for _DictionaryStorage);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  swift_retain(v3);
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v11 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v28)
      goto LABEL_37;
    v14 = *(_QWORD *)(v29 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v28)
        goto LABEL_37;
      v14 = *(_QWORD *)(v29 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v28)
          goto LABEL_37;
        v14 = *(_QWORD *)(v29 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v28)
            goto LABEL_37;
          v14 = *(_QWORD *)(v29 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_10000E81C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v41);
    *(_QWORD *)&v40 = v19;
    *((_QWORD *)&v40 + 1) = v18;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v19;
    *((_QWORD *)&v38[0] + 1) = v18;
    swift_bridgeObjectRetain(v18);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_10000E858(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_10000E858(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_10000E858(v37, v38);
    sub_10000E858(v38, &v34);
    v20 = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v9 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v9 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    v10 = v3[6] + 40 * v9;
    *(_OWORD *)v10 = v30;
    *(_OWORD *)(v10 + 16) = v31;
    *(_QWORD *)(v10 + 32) = v32;
    sub_10000E858(&v34, (_OWORD *)(v3[7] + 32 * v9));
    ++v3[2];
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10000E868(a1);
    return;
  }
  v14 = *(_QWORD *)(v29 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v28)
      goto LABEL_37;
    v14 = *(_QWORD *)(v29 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_10000E3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15SleepLockScreen16LockScreenClient__state;
  sub_100006AC0(0, &qword_100019608, (uint64_t (*)(uint64_t))sub_10000E510, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10000E448()
{
  return type metadata accessor for LockScreenClient(0);
}

uint64_t type metadata accessor for LockScreenClient(uint64_t a1)
{
  uint64_t result;

  result = qword_1000195F8;
  if (!qword_1000195F8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LockScreenClient);
  return result;
}

void sub_10000E48C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_100006AC0(319, &qword_100019608, (uint64_t (*)(uint64_t))sub_10000E510, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
  }
}

void sub_10000E510(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t TupleTypeMetadata2;
  uint64_t v6;

  if (!qword_100019610)
  {
    type metadata accessor for HKSPSleepLockScreenState(255);
    v3 = v2;
    sub_10000E57C(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v3, v4, 0, 0);
    if (!v6)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100019610);
  }
}

void sub_10000E57C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100019618)
  {
    sub_10000F46C(255, (unint64_t *)&unk_100019620, (uint64_t)&type metadata for AnyHashable, (uint64_t)&protocol witness table for AnyHashable, (uint64_t (*)(_QWORD, uint64_t, char *))&type metadata accessor for Dictionary);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100019618);
  }
}

uint64_t sub_10000E5F0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000E61C()
{
  uint64_t *v0;

  return sub_10000DEF0(v0[2], v0[3], v0[4]);
}

double sub_10000E628(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10000E638(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_10000E640(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, a3 & 1, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

double sub_10000E718@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  __int128 v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100011408);
  v5 = swift_getKeyPath(&unk_100011430);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = *(double *)&v7;
  *a2 = v7;
  return result;
}

uint64_t sub_10000E798(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  __n128 v7;
  _QWORD v9[2];

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100011408);
  v6 = swift_getKeyPath(&unk_100011430);
  v9[0] = v3;
  v9[1] = v2;
  swift_bridgeObjectRetain(v2);
  v7 = swift_retain(v4);
  return static Published.subscript.setter(v9, v4, KeyPath, v6, v7);
}

uint64_t sub_10000E81C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000E858(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000E868(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000E870(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000E940(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000E81C((uint64_t)v12, *a3);
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
      sub_10000E81C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000EEE0(v12);
  return v7;
}

uint64_t sub_10000E940(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000EAF8(a5, a6);
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

uint64_t sub_10000EAF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000EB8C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000ED78(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000ED78(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000EB8C(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000ED00(v4, 0);
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

_QWORD *sub_10000ED00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  sub_10001035C(0, &qword_100019710, (uint64_t)&type metadata for UInt8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000ED78(char a1, int64_t a2, char a3, char *a4)
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
    sub_10001035C(0, &qword_100019710, (uint64_t)&type metadata for UInt8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)&_swiftEmptyArrayStorage;
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
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000EED8(uint64_t a1)
{
  uint64_t v1;

  return sub_10000D928(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000EEE0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000EF04()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000EF28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000CE80(a1, a2, v2);
}

uint64_t sub_10000EF30()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EF54(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_10000EF7C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void *))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a4(255, a2, a3, &type metadata accessor for Published.Publisher);
    result = swift_getWitnessTable(&protocol conformance descriptor for Published<A>.Publisher, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000EFC8()
{
  uint64_t v0;

  return sub_10000D1AC(v0, (uint64_t)&unk_100014D28, (uint64_t)sub_10000F06C, (uint64_t)&unk_100014D40);
}

uint64_t sub_10000EFF8()
{
  uint64_t v0;

  return sub_10000D1AC(v0, (uint64_t)&unk_100014CD8, (uint64_t)sub_10000F04C, (uint64_t)&unk_100014CF0);
}

uint64_t sub_10000F028()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000F04C()
{
  uint64_t v0;

  return sub_10000D3E0(*(void **)(v0 + 16), "[%{public}s] invalidation handler called");
}

uint64_t sub_10000F06C()
{
  uint64_t v0;

  return sub_10000D3E0(*(void **)(v0 + 16), "[%{public}s] interruption handler called");
}

void sub_10000F08C(uint64_t a1)
{
  uint64_t v2;
  unint64_t TupleTypeMetadata2;
  uint64_t v4;

  if (!qword_100019730)
  {
    v2 = sub_10000F100(255, &qword_100019738, NSNumber_ptr);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, &type metadata for String, v2, 0, 0);
    if (!v4)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100019730);
  }
}

uint64_t sub_10000F100(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_10000F138(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100019748)
  {
    v2 = sub_10000F100(255, &qword_100019738, NSNumber_ptr);
    v3 = type metadata accessor for _DictionaryStorage(a1, &type metadata for String, v2, &protocol witness table for String);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100019748);
  }
}

unint64_t sub_10000F1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000F210(a1, a2, v5);
}

unint64_t sub_10000F210(uint64_t a1, uint64_t a2, uint64_t a3)
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

void sub_10000F2F0(double a1, double a2, double a3, double a4)
{
  uint64_t v4;

  sub_10000ACC0(*(void **)(v4 + 16), a1, a2, a3, a4);
}

uint64_t sub_10000F2F8(uint64_t a1)
{
  uint64_t v1;

  return sub_10000A124(a1, *(void **)(v1 + 16));
}

void sub_10000F300(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100019768)
  {
    v2 = sub_10001049C(255, &qword_100019708, (uint64_t)&protocol descriptor for Error);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100019768);
  }
}

uint64_t sub_10000F364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, void *))
{
  uint64_t v7;

  v7 = a5(0, a3, a4, &type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a2, a1, v7);
  return a2;
}

uint64_t sub_10000F3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, void *))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, &type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void sub_10000F404()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_100019788)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(0, &type metadata for String, (char *)&type metadata for Any + 8, 0, 0);
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100019788);
  }
}

void sub_10000F46C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, char *))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(0, a3, &type metadata for Any[8]);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10000F4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_10000F404();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for Alarm(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v5);
}

uint64_t sub_10000F5B4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(type metadata accessor for Alarm(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_100008DC0(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + v5 + 8), *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000F630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for Alarm(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v5);
}

void sub_10000F6E8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for Alarm(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1000090B8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000F754(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_100006AC0(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

char *sub_10000F7AC(void *a1, void *a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  id v24;
  char *v25;
  Class v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  unsigned int v34;
  id v35;
  objc_class *v36;
  char *v37;
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
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSString v52;
  unsigned int v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  objc_super v66;

  sub_10001035C(0, &qword_1000197A0, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Published.Publisher);
  v11 = v10;
  v63 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v62 - v12;
  v14 = type metadata accessor for LockScreenContentView(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame];
  *(_OWORD *)v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  v17[32] = 1;
  *(_QWORD *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber] = 0;
  *(_QWORD *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber] = 0;
  v18 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_delegate];
  *((_QWORD *)v18 + 1) = 0;
  v19 = swift_unknownObjectWeakInit(v18, 0);
  v20 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView____lazy_storage___screenBounds];
  *(_OWORD *)v20 = 0u;
  *((_OWORD *)v20 + 1) = 0u;
  v20[32] = 1;
  v21 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_safeContentBounds];
  *(_OWORD *)v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  v22 = OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView;
  *(_QWORD *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_contentView] = 0;
  *(_QWORD *)&a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_model] = a1;
  *(_QWORD *)(v19 + 8) = &off_100014B70;
  v64 = a2;
  swift_unknownObjectWeakAssign();
  v23 = &a5[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugIdentifier];
  *(_QWORD *)v23 = a3;
  *((_QWORD *)v23 + 1) = a4;
  v24 = a1;
  v25 = a5;
  LockScreenContentView.init(model:)(v24);
  sub_1000103A0(0);
  v27 = objc_allocWithZone(v26);
  v28 = _UIHostingView.init(rootView:)(v16);
  v29 = *(void **)&a5[v22];
  *(_QWORD *)&a5[v22] = v28;

  v30 = (void *)objc_opt_self(NSUserDefaults);
  v31 = objc_msgSend(v30, "hksp_internalUserDefaults");
  LODWORD(v16) = objc_msgSend(v31, "hksp_lockScreenDebugMode");

  v32 = 0;
  if ((_DWORD)v16)
    v32 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  *(_QWORD *)&v25[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugSafeContentBoundsView] = v32;
  v33 = objc_msgSend(v30, "hksp_internalUserDefaults");
  v34 = objc_msgSend(v33, "hksp_lockScreenDebugMode");

  if (v34)
    v35 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  else
    v35 = 0;
  *(_QWORD *)&v25[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_debugActualContentBoundsView] = v35;

  v36 = (objc_class *)type metadata accessor for LockScreenContainerView();
  v66.receiver = v25;
  v66.super_class = v36;
  v37 = (char *)objc_msgSendSuper2(&v66, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_100005C24();
  v38 = type metadata accessor for LockScreenContentModel(0);
  v39 = sub_1000105AC(&qword_1000197B8, (uint64_t (*)(uint64_t))&type metadata accessor for LockScreenContentModel, (uint64_t)&protocol conformance descriptor for LockScreenContentModel);
  v65 = ObservableObject<>.objectWillChange.getter(v38, v39);
  v40 = swift_allocObject(&unk_100014EB8, 24, 7);
  swift_unknownObjectWeakInit(v40 + 16, v37);
  v41 = type metadata accessor for ObservableObjectPublisher(0);
  v42 = Publisher<>.sink(receiveValue:)(sub_100010418, v40, v41, &protocol witness table for ObservableObjectPublisher);
  swift_release(v40);
  swift_release(v65);
  v43 = *(_QWORD *)&v37[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber];
  *(_QWORD *)&v37[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_modelSubscriber] = v42;
  v44 = swift_release(v43);
  dispatch thunk of LockScreenContentModel.$alarmButtonPressed.getter(v44);
  v45 = swift_allocObject(&unk_100014EB8, 24, 7);
  swift_unknownObjectWeakInit(v45 + 16, v37);
  v46 = swift_allocObject(&unk_100014EE0, 32, 7);
  *(_QWORD *)(v46 + 16) = v45;
  *(_QWORD *)(v46 + 24) = v24;
  v47 = sub_10000EF7C(&qword_1000197C0, (uint64_t)&qword_1000197A0, (uint64_t)&type metadata for Bool, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))sub_10001035C);
  v48 = v24;
  v49 = Publisher<>.sink(receiveValue:)(sub_10001044C, v46, v11, v47);
  swift_release(v46);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v13, v11);
  v50 = *(_QWORD *)&v37[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber];
  *(_QWORD *)&v37[OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_alarmSheetSubscriber] = v49;
  swift_release(v50);
  v51 = objc_msgSend(v30, "hksp_internalUserDefaults");
  v52 = String._bridgeToObjectiveC()();
  v53 = objc_msgSend(v51, "BOOLForKey:", v52);

  if (v53)
  {
    v54 = objc_msgSend(objc_allocWithZone((Class)UIPanGestureRecognizer), "initWithTarget:action:", v37, "didPan:");
    objc_msgSend(v37, "addGestureRecognizer:", v54);

  }
  sub_100006AC0(0, &qword_1000197C8, (uint64_t (*)(uint64_t))sub_100010454, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v56 = swift_allocObject(v55, 48, 7);
  *(_OWORD *)(v56 + 16) = xmmword_100011380;
  *(_QWORD *)(v56 + 32) = type metadata accessor for UITraitPreferredContentSizeCategory(0);
  *(_QWORD *)(v56 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
  v57 = swift_allocObject(&unk_100014EB8, 24, 7);
  swift_unknownObjectWeakInit(v57 + 16, v37);
  v58 = sub_1000104F0(0, &qword_1000197E0, &protocolRef_UITraitEnvironment);
  v59 = v37;
  v60 = UIView.registerForTraitChanges<A>(_:handler:)(v56, sub_1000104E8, v57, v58);
  swift_unknownObjectRelease(v60);
  swift_bridgeObjectRelease(v56);
  swift_release(v57);

  return v59;
}

uint64_t sub_10000FD84(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v5 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v5 = a2;
    v6 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v6 = 11;
    v7 = v6 | (v5 << 16);
    v8 = String.index(_:offsetBy:limitedBy:)(15, result, v7, a2, a3);
    if ((v9 & 1) != 0)
      v10 = v7;
    else
      v10 = v8;
    return String.subscript.getter(15, v10, a2, a3);
  }
  return result;
}

void sub_10000FE0C()
{
  _BYTE *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_lockScreenStateObserver] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentStateObserver] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_isAlertVisible] = 0;
  v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_didConfigureHostConnection] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_daemonConnection] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100012B30, "SleepLockScreen/LockScreenViewController.swift", 46, 2, 55, 0);
  __break(1u);
}

void sub_10000FEBC(void *a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  xpc_object_t v47;
  void (**v48)(_QWORD, _QWORD);
  char *v49;
  uint64_t v50;
  double v51;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;

  v50 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v50 - 8);
  __chkstk_darwin(v50);
  v49 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v48 - v7;
  v9 = type metadata accessor for DispatchPredicate(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (void (***)(_QWORD, _QWORD))((char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F100(0, (unint64_t *)&qword_1000193C8, OS_dispatch_queue_ptr);
  *v12 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for DispatchPredicate.onQueue(_:), v9);
  v13 = _dispatchPreconditionTest(_:)(v12);
  v14 = (*(uint64_t (**)(_QWORD *, uint64_t))(v10 + 8))(v12, v9);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_13:
    _Block_release(a2);
    __break(1u);
    return;
  }
  static Logger.mode.getter(v14);
  v15 = a1;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    v19 = swift_slowAlloc(32, -1);
    v48 = a2;
    v20 = v19;
    v51 = *(double *)&v19;
    *(_DWORD *)v18 = 136446210;
    v21 = sub_100006C48();
    v23 = v22;
    v53 = sub_10000E870(v21, v22, (uint64_t *)&v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v18 + 4, v18 + 12);

    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%{public}s] getInlinePresentationContentFrame called, returning content size", v18, 0xCu);
    swift_arrayDestroy(v20, 1, &type metadata for Any[8]);
    v24 = v20;
    a2 = v48;
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v18, -1, -1);

  }
  else
  {

  }
  v25 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  v26 = v25(v8, v50);
  v27 = v49;
  v28 = *(_QWORD *)&v15[OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView];
  if (!v28)
    goto LABEL_13;
  v29 = v28 + OBJC_IVAR____TtC15SleepLockScreen23LockScreenContainerView_visibleContentFrame;
  v30 = 0.0;
  v31 = 0.0;
  v32 = 0.0;
  v33 = 0.0;
  if ((*(_BYTE *)(v29 + 32) & 1) == 0)
  {
    v30 = *(double *)(v29 + 16);
    v31 = *(double *)(v29 + 24);
    v32 = *(double *)v29;
    v33 = *(double *)(v29 + 8);
  }
  static Logger.mode.getter(v26);
  v34 = v15;
  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = swift_slowAlloc(22, -1);
    v38 = swift_slowAlloc(64, -1);
    v53 = v38;
    *(_DWORD *)v37 = 136446466;
    v39 = sub_100006C48();
    v41 = v40;
    v51 = COERCE_DOUBLE(sub_10000E870(v39, v40, &v53));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52, v37 + 4, v37 + 12);

    swift_bridgeObjectRelease(v41);
    *(_WORD *)(v37 + 12) = 2082;
    v51 = v32;
    *(double *)v52 = v33;
    *(double *)&v52[1] = v30;
    *(double *)&v52[2] = v31;
    type metadata accessor for CGRect(0);
    v43 = String.init<A>(describing:)(&v51, v42);
    v45 = v44;
    v51 = COERCE_DOUBLE(sub_10000E870(v43, v44, &v53));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52, v37 + 14, v37 + 22);
    swift_bridgeObjectRelease(v45);
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%{public}s] frame: %{public}s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy(v38, 2, &type metadata for Any[8]);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v37, -1, -1);

    v46 = v49;
  }
  else
  {

    v46 = v27;
  }
  v25(v46, v50);
  v47 = xpc_dictionary_create(0, 0, 0);
  BSSerializeCGRectToXPCDictionaryWithKey(v47, "frame", v32, v33, v30, v31);
  ((void (**)(_QWORD, xpc_object_t))a2)[2](a2, v47);
  swift_unknownObjectRelease(v47);
}

void sub_10001035C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_1000103A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000197A8)
  {
    v2 = type metadata accessor for LockScreenContentView(255);
    v3 = sub_1000105AC(&qword_1000197B0, (uint64_t (*)(uint64_t))&type metadata accessor for LockScreenContentView, (uint64_t)&protocol conformance descriptor for LockScreenContentView);
    v4 = type metadata accessor for _UIHostingView(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000197A8);
  }
}

uint64_t sub_100010418(uint64_t a1)
{
  uint64_t v1;

  return sub_1000056E8(a1, v1);
}

uint64_t sub_100010420()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001044C(_BYTE *a1)
{
  uint64_t v1;

  return sub_100005908(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_100010454()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000197D0;
  if (!qword_1000197D0)
  {
    v1 = sub_10001049C(255, &qword_1000197D8, (uint64_t)&protocol descriptor for UITraitDefinition);
    result = swift_getExistentialMetatypeMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000197D0);
  }
  return result;
}

uint64_t sub_10001049C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = a3;
    result = swift_getExistentialTypeMetadata(1, 0, 1, &v5);
    atomic_store(result, a2);
  }
  return result;
}

void sub_1000104E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100005A04(a1, a2, v2);
}

uint64_t sub_1000104F0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = *a3 | 1;
    result = swift_getExistentialTypeMetadata(0, 0, 1, &v5);
    atomic_store(result, a2);
  }
  return result;
}

void sub_100010540(uint64_t a1)
{
  uint64_t v1;

  sub_1000070F4(a1, v1);
}

void sub_100010548(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000197E8)
  {
    v2 = type metadata accessor for LockScreenContentState(255);
    v3 = type metadata accessor for PassthroughSubject(a1, v2, &type metadata for Never, &protocol witness table for Never);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000197E8);
  }
}

uint64_t sub_1000105AC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100010720(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint8_t v14[16];

  v3 = a2;
  v4 = HKSPLogForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LockScreenViewController] received boundsDictionary in ObjC shim", v14, 2u);
  }

  v6 = BSDeserializeCGRectFromXPCDictionaryWithKey(v3, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v6, v8, v10, v12);
}

id objc_msgSend_getContentBoundsWithReplyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContentBoundsWithReplyBlock:");
}
