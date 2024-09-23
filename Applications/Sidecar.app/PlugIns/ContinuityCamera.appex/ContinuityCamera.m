id sub_100003054()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v1, "removeObserver:", v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CameraMainViewController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_1000030F8()
{
  void *v0;
  id v1;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v1 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  objc_msgSend(v2, "setBackgroundColor:", v1);

  objc_msgSend(v0, "setView:", v2);
  sub_100007278(v2);
}

void sub_1000031CC(void *a1)
{
  char *v1;
  void *v2;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  Class isa;
  id v28;

  v2 = v1;
  v3 = a1;
  v4 = *(id *)&v1[OBJC_IVAR___CameraMainViewController_contentViewController];
  if (!v4)
  {
    if (!a1)
      return;
LABEL_6:
    v6 = v3;
    objc_msgSend(v6, "willMoveToParentViewController:", 0);
    objc_msgSend(v6, "removeFromParentViewController");
    v7 = objc_msgSend(v6, "view");
    objc_msgSend(v7, "removeFromSuperview");

    if (!v4)
      return;
    goto LABEL_9;
  }
  if (a1)
  {
    sub_100007024(0, &qword_100010F58, UIViewController_ptr);
    v28 = v4;
    v3 = v3;
    v5 = static NSObject.== infix(_:_:)(v28, v3);

    if ((v5 & 1) != 0)
      goto LABEL_12;
    goto LABEL_6;
  }
  v4 = v4;
LABEL_9:
  v28 = v4;
  objc_msgSend(v2, "addChildViewController:");
  v8 = objc_msgSend(v2, "view");
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v28, "view");
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v9, "bounds");
      objc_msgSend(v11, "setFrame:");
      objc_msgSend(v9, "addSubview:", v11);
      v12 = (void *)objc_opt_self(NSLayoutConstraint);
      v13 = sub_100005DA4(&qword_100010EE8);
      v14 = swift_allocObject(v13, 64, 7);
      *(_OWORD *)(v14 + 16) = xmmword_100009E70;
      v15 = objc_msgSend(v11, "leftAnchor");
      v16 = objc_msgSend(v9, "leftAnchor");
      v17 = objc_msgSend(v15, "constraintEqualToAnchor:", v16);

      *(_QWORD *)(v14 + 32) = v17;
      v18 = objc_msgSend(v11, "topAnchor");
      v19 = objc_msgSend(v9, "topAnchor");
      v20 = objc_msgSend(v18, "constraintEqualToAnchor:", v19);

      *(_QWORD *)(v14 + 40) = v20;
      v21 = objc_msgSend(v9, "rightAnchor");
      v22 = objc_msgSend(v11, "rightAnchor");
      v23 = objc_msgSend(v21, "constraintEqualToAnchor:", v22);

      *(_QWORD *)(v14 + 48) = v23;
      v24 = objc_msgSend(v9, "bottomAnchor");
      v25 = objc_msgSend(v11, "bottomAnchor");
      v26 = objc_msgSend(v24, "constraintEqualToAnchor:", v25);

      *(_QWORD *)(v14 + 56) = v26;
      specialized Array._endMutation()();
      sub_100007024(0, &qword_100010F50, NSLayoutConstraint_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v14);
      objc_msgSend(v12, "activateConstraints:", isa);

      objc_msgSend(v28, "didMoveToParentViewController:", v2);
LABEL_12:

      return;
    }
  }
  else
  {

    __break(1u);
  }

  __break(1u);
}

void sub_1000035D0(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR___CameraMainViewController_contentViewController);
  *(_QWORD *)(v1 + OBJC_IVAR___CameraMainViewController_contentViewController) = a1;
  v3 = a1;
  sub_1000031CC(v2);

  sub_100007278(v3);
}

void sub_100003610()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  NSString *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  id v16;
  NSString *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v0 = *(_QWORD *)(type metadata accessor for Logger(0) - 8);
  __chkstk_darwin();
  sub_10000722C();
  v2 = sub_100007378(v1, "view");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "layer");

    if (v4)
    {
      v5 = NSTemporaryDirectory();
      v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      v8 = v7;

      v23 = v6;
      v24 = v8;
      swift_bridgeObjectRetain(v8);
      sub_1000071F4();
      v9 = sub_1000072EC();
      v11 = (_DWORD *)v6;
      v10 = v24;
      Logger.init()(v9);
      v12 = swift_bridgeObjectRetain(v24);
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        sub_10000736C();
        v15 = sub_1000072CC();
        v23 = v15;
        *v11 = 136446210;
        swift_bridgeObjectRetain(v10);
        v22 = sub_10000628C((uint64_t)v11, v10, &v23);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v11 + 1);
        swift_bridgeObjectRelease_n(v10, 3);
        sub_1000073C4((void *)&_mh_execute_header, v13, v14, "Saving layers: %{public}s");
        swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
        sub_100007244(v15);
        sub_100007244((uint64_t)v11);

      }
      else
      {

        sub_100007294();
      }
      sub_100007398(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
      v16 = v4;
      v17 = NSTemporaryDirectory();
      v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      v20 = v19;

      v23 = v18;
      v24 = v20;
      swift_bridgeObjectRetain(v20);
      sub_1000071F4();
      swift_bridgeObjectRelease(v20);
      v21 = String.utf8CString.getter(v23, v24);
      sub_1000071C4();
      CAEncodeLayerTreeToFile(v16, v21 + 32);

      swift_release(v21);
    }
  }
  sub_1000071CC();
}

void sub_100003880()
{
  objc_msgSend(objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice"), "userInterfaceIdiom");
  sub_1000073D0();
  sub_10000728C();
}

void sub_100003930(char a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v20[5];
  uint64_t v21;

  v5 = v1;
  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  sub_1000072BC();
  __chkstk_darwin();
  sub_10000722C();
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  sub_100007328();
  if ((a1 & 1) != 0)
  {
    sub_100007284(v10, &qword_100010F30, OS_dispatch_queue_ptr);
    v11 = (void *)static OS_dispatch_queue.main.getter();
    v12 = sub_100007304((uint64_t)&unk_10000C840, 24);
    *(_QWORD *)(v12 + 16) = v5;
    v20[4] = sub_10000707C;
    v21 = v12;
    v20[1] = 1107296256;
    v13 = sub_1000073B8((uint64_t)sub_100003B38);
    v14 = v5;
    v15 = swift_release(v21);
    static DispatchQoS.unspecified.getter(v15);
    v20[0] = &_swiftEmptyArrayStorage;
    sub_100006F60(&qword_100010F38, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v17 = v16;
    v18 = sub_100005DA4(&qword_100010F40);
    v19 = sub_100006F9C();
    dispatch thunk of SetAlgebra.init<A>(_:)(v20, v18, v19, v7, v17);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v3, v2, v13);
    _Block_release(v13);

    sub_100007398(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v8);
  }
  sub_1000071CC();
}

char *sub_100003AD4(char *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)&result[OBJC_IVAR___CameraMainViewController_contentViewController];
  if (v1)
  {
    v2 = type metadata accessor for CameraViewController();
    result = (char *)swift_dynamicCastClass(v1, v2);
    if (result)
      return (char *)objc_msgSend(*(id *)&result[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker], "takePicture");
  }
  return result;
}

uint64_t sub_100003B38(uint64_t a1)
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

id sub_100003BA4(char a1)
{
  void *v1;

  return objc_msgSend(v1, "sidecarServiceVolumeUpButtonPressed:", a1 & 1);
}

id sub_100003BF8()
{
  char *v0;
  id result;

  if (*(_QWORD *)&v0[OBJC_IVAR___CameraMainViewController_contentViewController])
    return objc_msgSend(v0, "setWantsVolumeButtonEvents:", 1);
  return result;
}

id sub_100003C54(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  NSString v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v3[OBJC_IVAR___CameraMainViewController_contentViewController] = 0;
  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for CameraMainViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

char *sub_100003D38(uint64_t a1)
{
  char *v1;
  objc_super v4;

  *(_QWORD *)&v1[OBJC_IVAR___CameraMainViewController_contentViewController] = 0;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for CameraMainViewController();
  objc_msgSendSuper2(&v4, "initWithCoder:", a1);
  sub_1000073D0();
  return v1;
}

uint64_t type metadata accessor for CameraMainViewController()
{
  return objc_opt_self(CameraMainViewController);
}

void sub_100003DD0(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;

  v3 = v1;
  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  sub_100007340();
  v11 = sub_100006F14();
  if ((v11 & 1) == 0)
  {
    sub_100007284(v11, &qword_100010EE0, NSError_ptr);
    static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarErrorDomain);
    sub_1000072F4();
    v15 = -103;
    goto LABEL_5;
  }
  v12 = sub_100006F20();
  if ((_DWORD)v12)
  {
    sub_100007284(v12, &qword_100010EE0, NSError_ptr);
    static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarErrorDomain);
    sub_1000072F4();
    v15 = -104;
LABEL_5:
    v16 = sub_1000072A8(v13, v14, v15);
    v30 = (id)_convertErrorToNSError(_:)(v16, v17);

    objc_msgSend(a1, "setError:", v30);
    return;
  }
  sub_100007284(v12, &qword_100010F30, OS_dispatch_queue_ptr);
  v30 = (id)static OS_dispatch_queue.main.getter();
  v18 = sub_100007304((uint64_t)&unk_10000C7F0, 32);
  *(_QWORD *)(v18 + 16) = a1;
  *(_QWORD *)(v18 + 24) = v1;
  v31[4] = sub_100006F58;
  v32 = v18;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 1107296256;
  v19 = sub_1000073B8((uint64_t)sub_100003B38);
  v20 = v32;
  v21 = a1;
  v22 = v3;
  v23 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v23);
  v31[0] = &_swiftEmptyArrayStorage;
  sub_100006F60(&qword_100010F38, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v25 = v24;
  v26 = sub_100005DA4(&qword_100010F40);
  v27 = sub_100006F9C();
  dispatch thunk of SetAlgebra.init<A>(_:)(v31, v26, v27, v5, v25);
  v28 = v30;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v2, v8, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v9);
  sub_1000071CC();
}

void sub_100004078(void *a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  char *v50;

  v4 = objc_msgSend(a1, "message");
  if (v4)
  {
    v5 = v4;
    v6 = (id)SidecarMessageGetServiceName();
    swift_unknownObjectRelease(v5);
    if (!v6)
    {
LABEL_18:
      sub_100007024(0, &qword_100010EE0, NSError_ptr);
      v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarErrorDomain);
      LOBYTE(v49) = 2;
      v39 = sub_100005A80(v37, v38, -103, 0, 0, 0);
      v50 = (char *)_convertErrorToNSError(_:)(v39, v40);

      objc_msgSend(a1, "setError:", v50, v49, 135);
LABEL_25:

      return;
    }
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarServiceNameTakePhoto);
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    if (v7 == v10 && v9 == v11)
    {
      swift_bridgeObjectRelease_n(v9, 2);
    }
    else
    {
      v13 = v11;
      v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v13);
      if ((v14 & 1) == 0)
      {
        v15 = (void *)SidecarServiceNameScanDocument;
        v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarServiceNameScanDocument);
        v18 = v17;
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
        if (v16 == v19 && v18 == v20)
        {
          v44 = v15;
          v45 = v6;

          swift_bridgeObjectRelease_n(v18, 2);
        }
        else
        {
          v22 = v20;
          v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, v19, v20, 0);
          v24 = v15;
          v25 = v6;

          swift_bridgeObjectRelease(v18);
          swift_bridgeObjectRelease(v22);
          if ((v23 & 1) == 0)
          {
            v26 = (void *)SidecarServiceNameScanLosslessDocument;
            v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarServiceNameScanLosslessDocument);
            v29 = v28;
            v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
            if (v27 == v30 && v29 == v31)
            {
              v47 = v26;
              v48 = v25;

              swift_bridgeObjectRelease_n(v29, 2);
            }
            else
            {
              v33 = v31;
              v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v29, v30, v31, 0);
              v35 = v26;
              v36 = v25;

              swift_bridgeObjectRelease(v29);
              swift_bridgeObjectRelease(v33);
              if ((v34 & 1) == 0)
                goto LABEL_18;
            }
            goto LABEL_23;
          }
        }

LABEL_23:
        v46 = type metadata accessor for DocumentScannerViewController();
        v42 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v46)), "init");
        v43 = &v42[OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_delegate];
        goto LABEL_24;
      }
    }

    v41 = type metadata accessor for CameraViewController();
    v42 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v41)), "init");
    v43 = &v42[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate];
    *(_QWORD *)&v42[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate + 8] = &off_10000C778;
LABEL_24:
    swift_unknownObjectWeakAssign(v43, a2);
    v50 = v42;
    sub_1000035D0(v42);
    goto LABEL_25;
  }
  __break(1u);
}

void sub_100004418(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(void *, uint64_t);
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  Class isa;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  Swift::String v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  BOOL v70;
  char v72;
  NSString *v73;
  double width;
  uint64_t v75;
  os_log_type_t v76;
  void *v77;
  void *v78;
  void (*v79)(void *, uint64_t);
  uint64_t v80;
  unint64_t v81;
  uint64_t v82[5];
  __int128 v83;
  uint64_t v84;

  v7 = type metadata accessor for Logger(0);
  sub_1000072BC();
  __chkstk_darwin(v8);
  sub_100007328();
  v9 = type metadata accessor for UTType(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10000722C();
  v12 = sub_100007378(v11, "request");
  if (!v12)
  {
    objc_msgSend(v2, "completeRequest:", 0);
    return;
  }
  v13 = v12;
  v14 = static UTType.jpeg.getter(v12);
  v15 = UTType.identifier.getter(v14);
  v81 = v16;
  v17 = *(void (**)(void *, uint64_t))(v10 + 8);
  v78 = v3;
  v17(v3, v9);
  v18 = objc_msgSend(v13, "message");
  v79 = v17;
  v80 = v9;
  if (v18)
  {
    v3 = v18;
    v19 = (id)SidecarMessageGetDefaults();
    if (v19)
    {
      v20 = v19;
      v77 = v3;
      v3 = &type metadata for Any;
      v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for AnyHashable);

      Logger.init()(v22);
      v23 = swift_bridgeObjectRetain_n(v21, 2);
      v24 = Logger.logObject.getter(v23);
      v76 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v76))
      {
        sub_10000736C();
        v75 = sub_1000072CC();
        v82[0] = v75;
        *v13 = 136446210;
        v25 = swift_bridgeObjectRetain(v21);
        v26 = Dictionary.description.getter(v25, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
        v28 = v27;
        swift_bridgeObjectRelease(v21);
        *(_QWORD *)&v83 = sub_10000628C(v26, v28, v82);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, (char *)&v83 + 8, v13 + 1);
        sub_100007380();
        v29 = v28;
        v3 = &type metadata for Any;
        swift_bridgeObjectRelease(v29);
        sub_1000073C4((void *)&_mh_execute_header, v24, v76, "Defaults: %{public}s");
        swift_arrayDestroy(v75, 1, (char *)&type metadata for Any + 8);
        sub_100007244(v75);
        sub_100007244((uint64_t)v13);

      }
      else
      {

        sub_100007380();
      }
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
      v56 = v21;
      *(_QWORD *)&v83 = 0xD00000000000001CLL;
      *((_QWORD *)&v83 + 1) = 0x800000010000AC30;
      AnyHashable.init<A>(_:)(&v83);
      sub_1000078FC((uint64_t)v82, v21, &v83);
      v57 = sub_1000073D8();
      v30 = v81;
      if (v84)
      {
        v60 = a2;
        sub_100007218(v57, v58, v59, (uint64_t)&type metadata for Double);
      }
      else
      {
        sub_100007364(v57, &qword_100011120);
        v60 = a2;
      }
      sub_1000073E0();
      sub_1000072DC();
      v61 = sub_1000073D8();
      if (v84)
      {
        if ((sub_100007218(v61, v62, v63, (uint64_t)&type metadata for String) & 1) != 0)
        {
          v64 = String.lowercased()();
          v65 = v64._countAndFlagsBits == 0x6C616E696769726FLL && v64._object == (void *)0xE800000000000000;
          if (v65 || (sub_1000071E4(0x6C616E696769726FLL, 0xE800000000000000) & 1) != 0)
          {
            sub_1000072A0();
            v30 = v81;
            sub_1000071C4();
            objc_msgSend(v60, "size");
            v3 = &type metadata for Any;
            goto LABEL_27;
          }
          v69 = v64._countAndFlagsBits == 0x6C6C616D73 && v64._object == (void *)0xE500000000000000;
          if (v69
            || (sub_1000071E4(0x6C6C616D73, 0xE500000000000000) & 1) != 0
            || (v64._countAndFlagsBits == 0x6D756964656DLL
              ? (v70 = v64._object == (void *)0xE600000000000000)
              : (v70 = 0),
                v70 || (sub_1000071E4(0x6D756964656DLL, 0xE600000000000000) & 1) != 0))
          {
            sub_1000072A0();
            sub_1000071C4();
          }
          else
          {
            if (v64._countAndFlagsBits != 0x656772616CLL || v64._object != (void *)0xE500000000000000)
            {
              v72 = sub_1000071E4(0x656772616CLL, 0xE500000000000000);
              sub_1000072A0();
              if ((v72 & 1) != 0)
              {
                sub_1000071C4();
                sub_10000730C();
                v3 = &type metadata for Any;
              }
              else
              {
                v73 = (NSString *)String._bridgeToObjectiveC()();
                sub_1000071C4();
                width = CGSizeFromString(v73).width;

                v3 = &type metadata for Any;
                if (width <= 0.0)
                  sub_10000730C();
              }
              v56 = v21;
              goto LABEL_38;
            }
            sub_1000071C4();
            sub_1000072A0();
            sub_10000730C();
          }
          v3 = &type metadata for Any;
LABEL_38:
          v30 = v81;
LABEL_27:
          sub_1000073E0();
          sub_1000072DC();
          swift_bridgeObjectRelease(v56);
          swift_unknownObjectRelease(v77);
          v66 = sub_1000073D8();
          if (v84)
          {
            if ((sub_100007218(v66, v67, v68, (uint64_t)&type metadata for String) & 1) != 0)
            {
              swift_bridgeObjectRelease(v30);
              v15 = 0xD000000000000019;
              v30 = 0x800000010000AC70;
            }
          }
          else
          {
            sub_100007364(v66, &qword_100011120);
          }
          goto LABEL_10;
        }
      }
      else
      {
        sub_100007364(v61, &qword_100011120);
      }
      sub_10000730C();
      goto LABEL_27;
    }
    swift_unknownObjectRelease(v3);
  }
  sub_10000730C();
  v30 = v81;
LABEL_10:
  String._bridgeToObjectiveC()();
  v31 = sub_1000073A4();
  sub_100004CD4(v32, v33, v34, v35, v31);
  sub_10000738C();
  if (v30 >> 60 == 15)
  {
    v37 = static UTType.jpeg.getter(v36);
    UTType.identifier.getter(v37);
    v79(v78, v80);
    String._bridgeToObjectiveC()();
    sub_1000071C4();
    v38 = sub_1000073A4();
    sub_100004CD4(v39, v40, v41, v42, v38);
    sub_10000738C();
    v43 = swift_bridgeObjectRelease(v30);
    sub_100007284(v43, &qword_100010EE0, NSError_ptr);
    v45 = v44;
    static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarErrorDomain);
    sub_1000072F4();
    v48 = sub_1000072A8(v46, v47, -1011);
    _convertErrorToNSError(_:)(v48, v49);
    sub_1000073D0();
    objc_msgSend(v13, "setError:", v45);

  }
  else
  {
    v50 = objc_allocWithZone((Class)SidecarItem);
    sub_100005D60((uint64_t)v3, v30);
    v51 = sub_100005CC0((uint64_t)v3, v30, v15, v30);
    v52 = sub_100005DA4(&qword_100010EE8);
    v53 = sub_100007304(v52, 40);
    *(_OWORD *)(v53 + 16) = xmmword_100009E80;
    *(_QWORD *)(v53 + 32) = v51;
    v82[0] = v53;
    specialized Array._endMutation()(v53);
    sub_100007024(0, (unint64_t *)&unk_100010EF0, SidecarItem_ptr);
    v54 = v51;
    isa = Array._bridgeToObjectiveC()().super.isa;
    sub_1000071C4();
    objc_msgSend(v13, "sendItems:", isa);

    sub_100005DE4((uint64_t)v3, v30);
  }
}

uint64_t sub_100004CD4(void *a1, uint64_t a2, uint64_t a3, char a4, double a5)
{
  void *v5;
  char v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v19[6];

  v9 = a4 & 1;
  v10 = a1;
  v11 = v5;
  v12 = sub_1000055B0(a2, a3, v9, 1.0);
  v14 = v13;
  v15 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRendererFormat), "init");
  objc_msgSend(v15, "setOpaque:", 0);
  objc_msgSend(v11, "scale");
  objc_msgSend(v15, "setScale:");
  v16 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:format:", v15, v12, v14);
  v19[2] = v11;
  *(double *)&v19[3] = v12;
  *(double *)&v19[4] = v14;
  v17 = sub_100005690((uint64_t)v10, (uint64_t)sub_100006DD8, (uint64_t)v19, a5);

  return v17;
}

void sub_100004E08(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  Class isa;
  id v19;

  v6 = sub_100007378(a1, "request");
  if (!v6)
    goto LABEL_17;
  v19 = v6;
  v7 = objc_msgSend(v6, "message");
  if (!v7)
  {

LABEL_17:
    objc_msgSend(v2, "completeRequest:", 0);
    return;
  }
  v8 = v7;
  v9 = (id)SidecarMessageGetServiceName();
  if (!v9)
  {

    swift_unknownObjectRelease(v8);
    goto LABEL_17;
  }
  v10 = v9;
  static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarServiceNameScanDocument);
  v11 = sub_100007318();
  if (v4 == v11 && v3 == v12)
  {
    sub_100007294();
    goto LABEL_19;
  }
  sub_10000725C(v11, v12);
  sub_100007358();
  sub_1000072EC();
  if ((v4 & 1) != 0)
  {
LABEL_19:
    v17 = sub_100004FC0(a2);
LABEL_20:
    sub_100007284(v17, (unint64_t *)&unk_100010EF0, SidecarItem_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    sub_1000071C4();
    objc_msgSend(v19, "sendItems:", isa);

    goto LABEL_21;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarServiceNameScanLosslessDocument);
  v14 = sub_100007318();
  if (v4 == v14 && v3 == v15)
  {
    sub_100007294();
    goto LABEL_23;
  }
  sub_10000725C(v14, v15);
  sub_100007358();
  sub_1000072EC();
  if ((v4 & 1) != 0)
  {
LABEL_23:
    v17 = (uint64_t)sub_1000052E0(a2);
    goto LABEL_20;
  }
  objc_msgSend(v2, "completeRequest:", 0);
LABEL_21:

  swift_unknownObjectRelease(v8);
}

unint64_t sub_100004FC0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t result;
  unint64_t v9;
  uint64_t v10;
  __objc2_prot_list *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void *v42;
  _QWORD v43[4];
  unint64_t v44;

  v2 = type metadata accessor for UTType(0);
  v39 = *(_QWORD *)(v2 - 8);
  v40 = v2;
  __chkstk_darwin();
  v38 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = (unint64_t)&_swiftEmptyArrayStorage;
  result = (unint64_t)objc_msgSend(a1, "pageCount");
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = result;
    if (result)
    {
      v10 = 0;
      v11 = &CameraMainViewController__prots;
      v41 = (char *)&type metadata for Any + 8;
      v36 = v5;
      v37 = v4;
      v35 = v7;
      do
      {
        v12 = objc_msgSend(a1, (SEL)v11[283].count, v35, v36, v37);
        if (v12)
        {
          v13 = v12;
          v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", v10);

          _bridgeAnyObjectToAny(_:)(v43, v14);
          swift_unknownObjectRelease(v14);
          sub_100007024(0, &qword_100010F28, ICDocCamDocumentInfo_ptr);
          if ((swift_dynamicCast(&v42, v43, v41, v15, 6) & 1) != 0)
          {
            v16 = v42;
            sub_100006E90(v42);
            if (v17)
            {
              v18 = v17;
              v19 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v18);
              v20 = objc_msgSend(a1, "getImageURL:", v19);

              static URL._unconditionallyBridgeFromObjectiveC(_:)(v20);
              v21 = Data.init(contentsOf:options:)(v7, 1);
              v23 = v22;
              v24 = sub_100005D60(v21, v22);
              v25 = v38;
              v26 = static UTType.jpeg.getter(v24);
              v27 = UTType.identifier.getter(v26);
              v29 = v28;
              (*(void (**)(char *, uint64_t))(v39 + 8))(v25, v40);
              v30 = objc_allocWithZone((Class)SidecarItem);
              v31 = sub_100005CC0(v21, v23, v27, v29);
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              v33 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
              v32 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x18);
              if (v33 >= v32 >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1);
              v34 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v31);
              specialized Array._endMutation()(v34);

              sub_100005DE4(v21, v23);
              v7 = v35;
              (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
            }
            else
            {

            }
            v11 = &CameraMainViewController__prots;
          }
        }
        ++v10;
      }
      while (v9 != v10);
      return v44;
    }
    else
    {
      return (unint64_t)&_swiftEmptyArrayStorage;
    }
  }
  return result;
}

id sub_1000052E0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[16];
  id v22;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = 0;
  v6 = objc_msgSend(a1, "archivedDataWithError:", &v22);
  v7 = v22;
  if (v6)
  {
    v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

    v11 = objc_allocWithZone((Class)SidecarItem);
    sub_100005D60(v8, v10);
    v12 = sub_100005CC0(v8, v10, 0xD000000000000025, 0x800000010000AFC0);
    v13 = sub_100005DA4(&qword_100010EE8);
    v14 = swift_allocObject(v13, 40, 7);
    *(_OWORD *)(v14 + 16) = xmmword_100009E80;
    *(_QWORD *)(v14 + 32) = v12;
    v22 = (id)v14;
    specialized Array._endMutation()(v14);
    v15 = v22;
    sub_100005DE4(v8, v10);
  }
  else
  {
    v16 = v7;
    v17 = _convertNSErrorToError(_:)();

    v18 = swift_willThrow();
    v19 = Logger.init()(v18);
    __chkstk_darwin(v19);
    *(_QWORD *)&v21[-16] = v17;
    sub_1000073EC((uint64_t (*)(void))sub_10000552C, 0, (uint64_t (*)(void))sub_100006EF0);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    swift_errorRelease(v17);
    return &_swiftEmptyArrayStorage;
  }
  return v15;
}

unint64_t sub_10000552C()
{
  return 0xD00000000000002CLL;
}

id sub_100005548()
{
  void *v0;

  return objc_msgSend(v0, "completeRequest:", 1);
}

double sub_1000055B0(uint64_t a1, uint64_t a2, char a3, double a4)
{
  void *v4;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;

  objc_msgSend(v4, "size");
  v10 = v9;
  v12 = v11;
  if ((a3 & 1) == 0)
  {
    objc_msgSend(v4, "scale");
    v14 = a4 / v13;
    v15 = v14 * *(double *)&a1;
    v16 = v14 * *(double *)&a2;
    v17 = (v12 < v10) ^ (v16 >= v15);
    if (v17)
      v18 = v16;
    else
      v18 = v15;
    if (v17)
      v16 = v15;
    v19 = v16 / v10;
    v20 = v18 / v12;
    if (v19 <= 1.0 || v20 <= 1.0)
    {
      if (v20 < v19)
        v19 = v18 / v12;
      return floor(v10 * v19);
    }
  }
  return v10;
}

uint64_t sub_100005690(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t result;
  id v28;
  uint64_t v29;
  uint64_t inited;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  NSDictionary v37;
  __CFData *v38;
  __CFString *v39;
  CGImageDestination *v40;
  CGImage *v41;
  CGImage *v42;
  __CFData *v43;
  uint64_t v44;
  _BYTE v45[48];
  _QWORD aBlock[5];
  uint64_t v47;

  v7 = v4;
  v12 = sub_100005DA4(&qword_100010F10);
  __chkstk_darwin(v12);
  sub_100007340();
  v13 = type metadata accessor for UTType(0);
  sub_1000072BC();
  v15 = __chkstk_darwin(v14);
  v17 = &v45[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  v19 = &v45[-v18];
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  UTType.init(_:)(v20);
  if (sub_100006DF4(v5, 1, v13) == 1)
  {
    sub_100006E00(v5, &qword_100010F10);
    return 0;
  }
  v21 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v6 + 32))(v19, v5, v13);
  static UTType.image.getter(v21);
  v22 = UTType.conforms(to:)(v17);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v17, v13);
  if ((v22 & 1) == 0)
  {
    sub_100007250();
    return 0;
  }
  v23 = sub_100007304((uint64_t)&unk_10000C7A0, 32);
  *(_QWORD *)(v23 + 16) = a2;
  *(_QWORD *)(v23 + 24) = a3;
  aBlock[4] = sub_100006E48;
  v47 = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005A4C;
  aBlock[3] = &unk_10000C7B8;
  v24 = _Block_copy(aBlock);
  v25 = v47;
  swift_retain(v23);
  swift_release(v25);
  v26 = objc_msgSend(v7, "imageWithActions:", v24);
  _Block_release(v24);
  LOBYTE(v24) = swift_isEscapingClosureAtFileLocation(v23, "", 93, 294, 41, 1);
  result = swift_release(v23);
  if ((v24 & 1) == 0)
  {
    v28 = objc_msgSend(objc_allocWithZone((Class)NSMutableData), "init");
    v29 = sub_100005DA4(&qword_100010F18);
    inited = swift_initStackObject(v29, v45);
    *(_OWORD *)(inited + 16) = xmmword_100009E90;
    *(_QWORD *)(inited + 32) = kCGImageDestinationLossyCompressionQuality;
    *(double *)(inited + 40) = a4;
    type metadata accessor for CFString(0);
    v32 = v31;
    sub_100006F60(&qword_100010F20, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10000A138);
    v34 = v33;
    v35 = (id)kCGImageDestinationLossyCompressionQuality;
    v36 = Dictionary.init(dictionaryLiteral:)(inited, v32, &type metadata for CGFloat, v34);
    v37.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v36);
    v38 = (__CFData *)v28;
    UTType.identifier.getter(v38);
    v39 = (__CFString *)String._bridgeToObjectiveC()();
    sub_1000072EC();
    v40 = CGImageDestinationCreateWithData(v38, v39, 1uLL, v37.super.isa);

    if (v40)
    {
      v41 = (CGImage *)objc_msgSend(v26, "CGImage");
      if (v41)
      {
        v42 = v41;
        CGImageDestinationAddImage(v40, v41, v37.super.isa);
        CGImageDestinationFinalize(v40);
        v43 = v38;
        v44 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v38);

        sub_100007250();
        return v44;
      }
      sub_100007250();

    }
    else
    {
      sub_100007250();

    }
    return 0;
  }
  __break(1u);
  return result;
}

void sub_100005A4C(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

id sub_100005A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  NSString v22;
  uint64_t v23;
  Class isa;
  id v25;
  uint64_t v27;
  _QWORD *v28;
  char v29[8];
  _QWORD v30[3];
  void *v31;
  uint64_t v32;

  v7 = v6;
  v32 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  if (a5)
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSDebugDescriptionErrorKey);
    v31 = &type metadata for String;
    v30[0] = a4;
    v30[1] = a5;
    sub_100005C30((uint64_t)v30, v13, v14);
  }
  if (a6)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUnderlyingErrorKey);
    v17 = v16;
    swift_getErrorValue(a6, v29, &v27);
    v18 = v27;
    v19 = v28;
    v31 = v28;
    v20 = sub_100006A68(v30);
    (*(void (**)(_QWORD *, uint64_t, _QWORD *))(*(v19 - 1) + 16))(v20, v18, v19);
    sub_100005C30((uint64_t)v30, v15, v17);
  }
  v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7));
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v23 = v32;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  v25 = objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, a3, isa);

  swift_errorRelease(a6);
  return v25;
}

void sub_100005C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v5[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_100006BC8((_OWORD *)a1, v5);
    sub_100006BD8(v5, a2, a3);
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    sub_100006E00(a1, &qword_100011120);
    sub_100006AA4(a2, a3, v5);
    swift_bridgeObjectRelease(a3);
    sub_100006E00((uint64_t)v5, &qword_100011120);
  }
}

id sub_100005CC0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  Class isa;
  NSString v9;
  id v10;

  if (a2 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100006A54(a1, a2);
  }
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  v10 = objc_msgSend(v4, "initWithData:type:", isa, v9);

  return v10;
}

uint64_t sub_100005D60(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100005DA4(uint64_t *a1)
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

uint64_t sub_100005DE4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100005E28(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100005E5C(uint64_t a1, id *a2)
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

uint64_t sub_100005ED0(uint64_t a1, id *a2)
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

NSString sub_100005F4C()
{
  uint64_t v0;
  uint64_t v1;
  NSString v2;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v1 = v0;
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  return v2;
}

uint64_t sub_100005F80(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100009FA8, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_100005FBC(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100009FA8, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100006004(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5);
  WitnessTable = swift_getWitnessTable(&unk_100009FA8, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

void sub_10000605C()
{
  uint64_t *v0;

  sub_1000060C8(*v0, (void (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_100006084@<X0>(_QWORD *a1@<X8>)
{
  NSString result;

  result = sub_100005F4C();
  *a1 = result;
  return result;
}

void sub_1000060A8()
{
  uint64_t *v0;

  sub_1000060C8(*v0, (void (*)(uint64_t))&String.hashValue.getter);
}

void sub_1000060C8(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  a2(v3);
  sub_1000071C4();
  sub_10000728C();
}

uint64_t sub_1000060F8(uint64_t a1)
{
  uint64_t *v1;

  return sub_100006100(a1, *v1);
}

uint64_t sub_100006100(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100006140(uint64_t a1)
{
  uint64_t *v1;

  return sub_1000088B8(a1, *v1);
}

uint64_t sub_100006148(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_100009FA8, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_100006194(_QWORD *a1, _QWORD *a2)
{
  return sub_100007874(*a1, *a2);
}

uint64_t sub_1000061A0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

void sub_1000061E4(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  *a1 = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  a1[1] = v3;
  sub_10000728C();
}

uint64_t sub_100006208(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100006F60((unint64_t *)&qword_100010F90, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_10000A0F4);
  v3 = v2;
  sub_100006F60(&qword_100010F98, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_10000A048);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

uint64_t sub_10000628C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  void *ObjectType;

  v6 = sub_10000635C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006A14((uint64_t)v12, *a3);
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
      sub_100006A14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000069F4(v12);
  return v7;
}

_QWORD *sub_10000635C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000064B0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100006574(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

void *sub_1000064B0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100006574(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_100006608(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000067DC(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_1000067DC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_100006608(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_100006778(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_100006778(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005DA4(&qword_100010F00);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000067DC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  if (v9)
  {
    v10 = sub_100005DA4(&qword_100010F00);
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
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100006974(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000068B0(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1000068B0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_100006974(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1000069F4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006A14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006A54(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100005DE4(result, a2);
  return result;
}

_QWORD *sub_100006A68(_QWORD *a1)
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

double sub_100006AA4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  double result;
  uint64_t v16;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_10000892C(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v16 = *v4;
    v12 = *v4;
    *v4 = 0x8000000000000000;
    v13 = *(_QWORD *)(v12 + 24);
    sub_100005DA4(&qword_100010F08);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v16 + 48) + 16 * v9 + 8));
    sub_100006BC8((_OWORD *)(*(_QWORD *)(v16 + 56) + 32 * v9), a3);
    _NativeDictionary._delete(at:)(v9, v16, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v14 = *v4;
    *v4 = v16;
    swift_bridgeObjectRelease(v14);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

_OWORD *sub_100006BC8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006BD8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_100006C54(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

_OWORD *sub_100006C54(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  _QWORD *v21;
  _OWORD *result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_10000892C(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  sub_100005DA4(&qword_100010F08);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_10000892C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = (_QWORD *)(v20[7] + 32 * v16);
    sub_1000069F4(v21);
    return sub_100006BC8(a1, v21);
  }
  else
  {
    sub_100006D70(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain(a3);
  }
}

_OWORD *sub_100006D70(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_100006BC8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

id sub_100006DD8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "drawInRect:", 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_100006DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_100006E00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005DA4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_10000728C();
}

uint64_t sub_100006E38()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100006E48()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  sub_10000728C();
}

uint64_t sub_100006E64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006E74(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_100007098(a1, &qword_100010F68, (uint64_t)&unk_10000C8B8);
}

uint64_t sub_100006E90(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "croppedAndFilteredImageUUID");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

void sub_100006EF0()
{
  uint64_t v0;

  swift_errorRetain(*(_QWORD *)(v0 + 16));
  sub_10000728C();
}

uint64_t sub_100006F14()
{
  return MGGetBoolAnswer(CFSTR("still-camera"));
}

uint64_t sub_100006F20()
{
  return MGGetBoolAnswer(CFSTR("cameraRestriction"));
}

uint64_t sub_100006F2C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100006F58()
{
  uint64_t v0;

  sub_100004078(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_100006F60(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_10000728C();
}

unint64_t sub_100006F9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010F48;
  if (!qword_100010F48)
  {
    v1 = sub_100006FE0(&qword_100010F40);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100010F48);
  }
  return result;
}

uint64_t sub_100006FE0(uint64_t *a1)
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

void sub_100007024(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t v4;

  if (!*a2)
  {
    v4 = objc_opt_self(*a3);
    atomic_store(swift_getObjCClassMetadata(v4), a2);
  }
  sub_10000728C();
}

uint64_t sub_100007058()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

char *sub_10000707C()
{
  uint64_t v0;

  return sub_100003AD4(*(char **)(v0 + 16));
}

void type metadata accessor for InfoKey(uint64_t a1)
{
  sub_100007098(a1, &qword_100010F60, (uint64_t)&unk_10000C890);
}

void sub_100007098(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
  sub_10000728C();
}

void sub_1000070D8()
{
  sub_100006F60(&qword_100010F20, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10000A138);
}

void sub_100007104()
{
  sub_100006F60(&qword_100010F70, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_10000A00C);
}

void sub_100007130()
{
  sub_100006F60(&qword_100010F78, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_100009FE0);
}

void sub_10000715C()
{
  sub_100006F60(&qword_100010F80, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_10000A07C);
}

void sub_100007188()
{
  sub_100006F60(&qword_100010F88, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)"e)");
}

uint64_t sub_1000071C4()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000071E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0);
}

void sub_1000071F4()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0x2E6172656D61632FLL;
  v0._object = (void *)0xEC00000072616163;
  String.append(_:)(v0);
}

uint64_t sub_100007218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return swift_dynamicCast(v5 - 208, v5 - 152, v4 + 8, a4, 6);
}

uint64_t sub_100007244(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_100007250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t sub_10000725C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return _stringCompareWithSmolCheck(_:_:expecting:)(v3, v2, a1, a2, 0);
}

void sub_100007278(id a1)
{

}

void sub_100007284(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  sub_100007024(0, a2, a3);
}

uint64_t sub_100007294()
{
  uint64_t v0;

  return swift_bridgeObjectRelease_n(v0, 2);
}

uint64_t sub_1000072A0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id sub_1000072A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005A80(a1, a2, a3, 0, 0, 0);
}

uint64_t sub_1000072CC()
{
  return swift_slowAlloc(32, -1);
}

double sub_1000072DC()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1000078FC(v1 - 192, v0, (_OWORD *)(v1 - 152));
}

uint64_t sub_1000072EC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100007304(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

uint64_t sub_100007318()
{
  uint64_t v0;

  return static String._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

uint64_t sub_100007358()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

void sub_100007364(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_100006E00(v2 - 152, a2);
}

uint64_t sub_10000736C()
{
  return swift_slowAlloc(12, -1);
}

id sub_100007378(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_100007380()
{
  uint64_t v0;

  return swift_bridgeObjectRelease_n(v0, 2);
}

void sub_10000738C()
{
  void *v0;

}

uint64_t sub_100007398@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

double sub_1000073A4()
{
  double v0;

  return v0;
}

void *sub_1000073B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

void sub_1000073C4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void sub_1000073D0()
{
  void *v0;

}

uint64_t sub_1000073D8()
{
  uint64_t v0;

  return sub_100005E28(v0 - 192);
}

uint64_t sub_1000073E0()
{
  uint64_t v0;

  return AnyHashable.init<A>(_:)(v0 - 208);
}

void sub_1000073EC(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  id v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  os_log_type_t v75;
  uint64_t v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  id v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  uint64_t v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  unint64_t v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  uint64_t v202;
  uint64_t v203;

  v4 = a3();
  v6 = (void *)_convertErrorToNSError(_:)(v4, v5);
  swift_errorRelease(v4);
  v7 = objc_msgSend(v6, "localizedDescription");
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  v11 = a1();
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    v186 = v6;
    swift_bridgeObjectRetain(v14);
    v15 = sub_100007864();
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (sub_100007844(v17))
    {
      v18 = sub_100007834(42);
      v171 = sub_100007834(96);
      v203 = v171;
      *(_DWORD *)v18 = 136446979;
      swift_bridgeObjectRetain(v14);
      v202 = sub_10000628C(v13, v14, &v203);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v202, &v203, v18 + 4);
      v19 = sub_10000786C(v14);
      *(_WORD *)(v18 + 12) = 2082;
      v26 = sub_10000783C(v19, "domain", v20, v21, v22, v23, v24, v25, v171, v186);
      v27 = v8;
      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      v30 = v29;

      v202 = sub_10000628C(v28, v30, &v203);
      v31 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v202, &v203, v18 + 14);
      sub_10000781C(v31, v32, v33, v34, v35, v36, v37, v38, v172, v187);
      sub_10000781C(v39, v40, v41, v42, v43, v44, v45, v46, v173, v188);
      v47 = swift_bridgeObjectRelease(v30);
      *(_WORD *)(v18 + 22) = 2048;
      v54 = sub_10000783C(v47, "code", v48, v49, v50, v51, v52, v53, v174, v189);
      sub_10000781C((int)v54, v55, v56, v57, v58, v59, v60, v61, v175, v190);
      v202 = (uint64_t)v54;
      v64 = sub_100007854(v62, v63);
      sub_10000781C(v64, v65, v66, v67, v68, v69, v70, v71, v176, v191);
      *(_WORD *)(v18 + 32) = 2081;
      sub_100007864();
      v202 = sub_10000628C(v27, v10, &v203);
      sub_100007854(v202, v72);
      sub_10000786C(v10);
      _os_log_impl((void *)&_mh_execute_header, v16, (os_log_type_t)v6, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v18, 0x2Au);
      swift_arrayDestroy(v177, 3, (char *)&type metadata for Any + 8);
      v73 = v177;
LABEL_6:
      sub_100007244(v73);
      sub_100007244(v18);

      sub_10000781C(v129, v130, v131, v132, v133, v134, v135, v136, v177, v192);
      return;
    }
    swift_bridgeObjectRelease_n(v10, 2);
    v137 = v14;
  }
  else
  {
    v186 = v6;
    v74 = sub_100007864();
    v16 = Logger.logObject.getter(v74);
    v75 = static os_log_type_t.error.getter();
    if (sub_100007844(v75))
    {
      v18 = sub_100007834(32);
      v76 = sub_100007834(64);
      v203 = v76;
      *(_DWORD *)v18 = 136446723;
      v83 = sub_10000783C(v76, "domain", v77, v78, v79, v80, v81, v82, v170, v186);
      v84 = static String._unconditionallyBridgeFromObjectiveC(_:)(v83);
      v86 = v85;

      v202 = sub_10000628C(v84, v86, &v203);
      v88 = sub_100007824(v202, v87);
      sub_10000781C(v88, v89, v90, v91, v92, v93, v94, v95, v178, v193);
      sub_10000781C(v96, v97, v98, v99, v100, v101, v102, v103, v179, v194);
      v104 = swift_bridgeObjectRelease(v86);
      *(_WORD *)(v18 + 12) = 2048;
      LODWORD(v84) = sub_10000783C(v104, "code", v105, v106, v107, v108, v109, v110, v180, v195);
      sub_10000781C(v84, v111, v112, v113, v114, v115, v116, v117, v181, v196);
      v120 = sub_100007824(v118, v119);
      sub_10000781C(v120, v121, v122, v123, v124, v125, v126, v127, v182, v197);
      *(_WORD *)(v18 + 22) = 2081;
      sub_100007864();
      v202 = sub_10000628C(v8, v10, &v203);
      sub_100007824(v202, v128);
      sub_10000786C(v10);
      _os_log_impl((void *)&_mh_execute_header, v16, (os_log_type_t)v6, "%{public}s (%ld) %{private}s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy(v76, 2, (char *)&type metadata for Any + 8);
      v73 = v76;
      goto LABEL_6;
    }
    v137 = v10;
  }
  swift_bridgeObjectRelease_n(v137, 2);

  sub_10000781C(v138, v139, v140, v141, v142, v143, v144, v145, v170, v186);
  sub_10000781C(v146, v147, v148, v149, v150, v151, v152, v153, v183, v198);
  sub_10000781C(v154, v155, v156, v157, v158, v159, v160, v161, v184, v199);
  sub_10000781C(v162, v163, v164, v165, v166, v167, v168, v169, v185, v200);

}

void sub_10000781C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t sub_100007824(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v3, v2);
}

uint64_t sub_100007834(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

id sub_10000783C(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  return objc_msgSend(a10, a2);
}

BOOL sub_100007844(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100007854(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v3, v2);
}

uint64_t sub_100007864()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10000786C(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 3);
}

uint64_t sub_100007878(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
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

double sub_1000078FC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_100008990(a1), (v6 & 1) != 0))
  {
    sub_100006A14(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

double sub_10000794C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_1000089C0(a1), (v6 & 1) != 0))
  {
    sub_100006A14(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_10000799C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  id result;
  id v7;
  Class isa;
  id v9;
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
  Class v22;
  uint64_t v23;
  _BYTE v24[24];
  uint64_t v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;

  v3 = type metadata accessor for UTType(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100007340();
  v5 = (objc_class *)type metadata accessor for CameraPicker();
  v28.receiver = v0;
  v28.super_class = v5;
  result = objc_msgSendSuper2(&v28, "init");
  if (result)
  {
    v7 = result;
    isa = Bool._bridgeToObjectiveC()().super.super.isa;
    v27.receiver = v7;
    v27.super_class = v5;
    objc_msgSendSuper2(&v27, "_setValue:forProperty:", isa, _UIImagePickerControllerAllowAnySuperview);

    v26.receiver = v7;
    v26.super_class = v5;
    objc_msgSendSuper2(&v26, "setSourceType:", 1);
    v9 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
    if (objc_msgSend(v9, "objectForKey:", _UIImagePickerControllerCameraDevice))
    {
      sub_100008F44();
      swift_unknownObjectRelease(v1);
    }
    v10 = sub_100008F2C();
    if (v25)
    {
      if ((sub_100008EF8(v10, v11, v12, (uint64_t)&type metadata for Int) & 1) != 0)
        objc_msgSend(v7, "setCameraDevice:", v23);
    }
    else
    {
      sub_100008878((uint64_t)v24);
    }
    if (objc_msgSend(v9, "objectForKey:", _UIImagePickerControllerCameraFlashMode))
    {
      sub_100008F44();
      swift_unknownObjectRelease(v1);
    }
    v13 = sub_100008F2C();
    if (v25)
    {
      if ((sub_100008EF8(v13, v14, v15, (uint64_t)&type metadata for Int) & 1) != 0)
        objc_msgSend(v7, "setCameraFlashMode:", v23);
    }
    else
    {
      sub_100008878((uint64_t)v24);
    }
    v16 = sub_100005DA4((uint64_t *)&unk_100011140);
    v17 = swift_allocObject(v16, 48, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100009E90;
    v18 = static UTType.image.getter();
    v19 = UTType.identifier.getter(v18);
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    *(_QWORD *)(v17 + 32) = v19;
    *(_QWORD *)(v17 + 40) = v21;
    v22 = Array._bridgeToObjectiveC()().super.isa;
    sub_100008F0C();
    objc_msgSend(v7, "setMediaTypes:", v22);

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100007C48()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010000B170, "ContinuityCamera/CameraViewController.swift", 43, 2, 41, 0);
  __break(1u);
}

void sub_100007CAC(uint64_t a1, uint64_t a2, NSString a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v8;
  NSString v9;
  Class isa;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[3];
  uint64_t v18;
  _QWORD v19[4];

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(_UIImagePickerControllerSourceType);
  if (!a3)
  {
    sub_100008F0C();
    goto LABEL_9;
  }
  if (v8 != a2 || v9 != a3)
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, v8, v9, 0);
    sub_100008F0C();
    if ((v4 & 1) != 0)
      goto LABEL_11;
LABEL_9:
    sub_100008DF8(a1, (uint64_t)v19);
    goto LABEL_12;
  }
  sub_100008F0C();
LABEL_11:
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  v19[3] = sub_100008E64(0, &qword_100011138, NSNumber_ptr);
  v19[0] = isa;
LABEL_12:
  sub_100008DF8((uint64_t)v19, (uint64_t)v17);
  v12 = v18;
  if (!v18)
  {
    v15 = 0;
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  v13 = sub_100008E40(v17, v18);
  v14 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v13);
  sub_100007340();
  (*(void (**)(uint64_t))(v14 + 16))(v4);
  v15 = _bridgeAnythingToObjectiveC<A>(_:)(v4, v12);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v12);
  sub_1000069F4(v17);
  if (a3)
LABEL_14:
    a3 = String._bridgeToObjectiveC()();
LABEL_15:
  v16.receiver = v3;
  v16.super_class = (Class)type metadata accessor for CameraPicker();
  objc_msgSendSuper2(&v16, "_setValue:forProperty:", v15, a3);
  swift_unknownObjectRelease(v15);

  sub_100008878((uint64_t)v19);
  sub_100008EE4();
}

id sub_100007F34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraPicker();
  return objc_msgSendSuper2(&v2, "setSourceType:", 1);
}

void sub_100007F70(char a1)
{
  void *v1;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for CameraPicker();
  objc_msgSendSuper2(&v5, "viewWillDisappear:", a1 & 1);
  v3 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  sub_100007378((uint64_t)v3, "cameraDevice");
  v4 = sub_100008F20();
  sub_100007378((uint64_t)v4, "cameraFlashMode");
  sub_100008F20();
  objc_msgSend(v3, "synchronize");

}

id sub_100008074()
{
  return sub_1000087E8(type metadata accessor for CameraPicker, (SEL *)&selRef_dealloc);
}

uint64_t type metadata accessor for CameraPicker()
{
  return objc_opt_self(_TtC16ContinuityCamera12CameraPicker);
}

BOOL sub_1000080D8()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  return v1 == (id)1;
}

void sub_100008138()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for CameraViewController();
  v1 = objc_msgSendSuper2(&v18, "viewDidLoad");
  v2 = *(void **)&v0[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker];
  sub_100008F14((uint64_t)v1, "setDelegate:");
  objc_msgSend(v0, "addChildViewController:", v2);
  v3 = objc_msgSend(v2, "view");
  if (!v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  v4 = v3;
  v5 = sub_100007378((uint64_t)v3, "view");
  if (!v5)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = v5;
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = sub_100007378((uint64_t)objc_msgSend(v4, "setFrame:", v8, v10, v12, v14), "view");
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "addSubview:", v4);

    sub_100008F14(v17, "didMoveToParentViewController:");
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_1000082F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  uint64_t v25;

  v3 = v2;
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = UIImagePickerControllerOriginalImage;
  sub_10000794C((uint64_t)v9, a2, &v24);

  if (v25)
  {
    v10 = sub_100008E64(0, (unint64_t *)&unk_100011128, UIImage_ptr);
    v11 = swift_dynamicCast(&v23, &v24, (char *)&type metadata for Any + 8, v10, 6);
    if ((v11 & 1) != 0)
    {
      v12 = v23;
      Strong = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate);
      if (!Strong)
      {

        goto LABEL_11;
      }
      v14 = Strong;
      sub_100004418(v3, v12);

      v15 = v14;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = sub_100008878((uint64_t)&v24);
  }
  v16 = Logger.init()(v11);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "no image from UIImagePickerController", v19, 2u);
    swift_slowDealloc(v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v20 = (void *)swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate);
  if (v20)
  {
    v21 = (uint64_t)v20;
    objc_msgSend(v20, "completeRequest:", 1);
    v15 = v21;
LABEL_10:
    swift_unknownObjectRelease(v15);
  }
LABEL_11:
  sub_100008EE4();
}

void *sub_100008540()
{
  uint64_t v0;
  void *result;
  void *v2;

  result = (void *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate);
  if (result)
  {
    v2 = result;
    objc_msgSend(result, "completeRequest:", 1);
    return (void *)swift_unknownObjectRelease(v2);
  }
  return result;
}

id sub_1000085DC(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  NSString v9;
  id v10;
  objc_super v12;

  v6 = OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker;
  v7 = objc_allocWithZone((Class)type metadata accessor for CameraPicker());
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, "init");
  sub_100008F38((uint64_t)&v8[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate]);

  if (a2)
  {
    v9 = String._bridgeToObjectiveC()();
    sub_100008F0C();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for CameraViewController();
  v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

id sub_100008710(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker;
  v4 = objc_allocWithZone((Class)type metadata accessor for CameraPicker());
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");
  sub_100008F38((uint64_t)&v5[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate]);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CameraViewController();
  v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

id sub_1000087D4()
{
  return sub_1000087E8(type metadata accessor for CameraViewController, (SEL *)&selRef_dealloc);
}

id sub_1000087E8(uint64_t (*a1)(void), SEL *a2)
{
  void *v2;
  objc_super v5;

  v5.receiver = v2;
  v5.super_class = (Class)a1();
  return objc_msgSendSuper2(&v5, *a2);
}

uint64_t type metadata accessor for CameraViewController()
{
  return objc_opt_self(_TtC16ContinuityCamera20CameraViewController);
}

uint64_t sub_100008878(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005DA4(&qword_100011120);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Int sub_1000088B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v4 = v3;
  Hasher.init(_seed:)(v7);
  String.hash(into:)(v7, v2, v4);
  v5 = Hasher._finalize()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

unint64_t sub_10000892C(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  String.hash(into:)(v6, a1, a2);
  v4 = Hasher._finalize()();
  return sub_100008A40(a1, a2, v4);
}

unint64_t sub_100008990(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100008B20(a1, v4);
}

unint64_t sub_1000089C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  Hasher.init(_seed:)(v7);
  String.hash(into:)(v7, v2, v4);
  v5 = Hasher._finalize()();
  swift_bridgeObjectRelease(v4);
  return sub_100008C20(a1, v5);
}

unint64_t sub_100008A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100008B20(uint64_t a1, uint64_t a2)
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
      sub_100008BE4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100005E28((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100008BE4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

unint64_t sub_100008C20(uint64_t a1, uint64_t a2)
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

unint64_t sub_100008D94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010F90;
  if (!qword_100010F90)
  {
    type metadata accessor for InfoKey(255);
    result = swift_getWitnessTable(&unk_10000A0F4, v1);
    atomic_store(result, (unint64_t *)&qword_100010F90);
  }
  return result;
}

uint64_t sub_100008DD4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_100008DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005DA4(&qword_100011120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100008E40(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100008E64(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100008E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005DA4(&qword_100011120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return swift_dynamicCast(v5 - 184, v5 - 144, v4 + 8, a4, 6);
}

uint64_t sub_100008F0C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id sub_100008F14(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

id sub_100008F20()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 2616));
}

uint64_t sub_100008F2C()
{
  uint64_t v0;

  return sub_100008E9C(v0 - 176, v0 - 144);
}

uint64_t sub_100008F38(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  return swift_unknownObjectWeakInit();
}

uint64_t sub_100008F44()
{
  return _bridgeAnyObjectToAny(_:)();
}

id sub_100008F60()
{
  void *v0;
  id v1;
  id v2;
  id result;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  v1 = objc_msgSendSuper2(&v17, "viewDidLoad");
  v2 = sub_100008F14((uint64_t)v1, "setDelegate:");
  sub_10000952C((uint64_t)v2, "addChildViewController:");
  result = sub_100009508();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = result;
  result = sub_100009514();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v5 = result;
  objc_msgSend(result, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
  result = sub_100009514();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v14 = result;
  result = sub_100009508();
  if (result)
  {
    v15 = result;
    objc_msgSend(v14, "addSubview:", result);

    return sub_100008F14(v16, "didMoveToParentViewController:");
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_1000090E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  void *v6;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_delegate);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "documentCameraViewController:didFinishWithScan:") & 1) != 0)
      objc_msgSend(v6, "documentCameraViewController:didFinishWithScan:", a1, a2);
    sub_1000094F0((uint64_t)v6);
  }
  else
  {
    sub_100009520();
  }
}

void sub_1000091B8()
{
  uint64_t v0;
  void *Strong;
  uint64_t v2;
  uint64_t v3;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_delegate);
  if (Strong)
  {
    v2 = (uint64_t)Strong;
    v3 = (uint64_t)objc_msgSend(Strong, "respondsToSelector:", "documentCameraViewControllerDidCancel:");
    if ((v3 & 1) != 0)
      sub_10000952C(v3, "documentCameraViewControllerDidCancel:");
    sub_1000094F0(v2);
  }
  else
  {
    sub_100009520();
  }
}

id sub_10000926C(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  NSString v9;
  id v10;
  objc_super v12;

  sub_1000094FC(OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_delegate);
  v6 = OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_documentCamera;
  v7 = objc_allocWithZone((Class)VNDocumentCameraViewController);
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, "init");

  if (a2)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

id sub_1000093A4(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  objc_super v8;

  sub_1000094FC(OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_delegate);
  v3 = OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_documentCamera;
  v4 = objc_allocWithZone((Class)VNDocumentCameraViewController);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

id sub_100009468()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DocumentScannerViewController()
{
  return objc_opt_self(_TtC16ContinuityCamera29DocumentScannerViewController);
}

uint64_t sub_1000094F0(uint64_t a1)
{
  return swift_unknownObjectRelease(a1);
}

uint64_t sub_1000094FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_unknownObjectWeakInit(v1 + a1, 0);
}

id sub_100009508()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 2320));
}

id sub_100009514()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 2320));
}

id sub_10000952C(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

