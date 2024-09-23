@implementation DARootViewController

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  v4 = v5.receiver;
  -[DARootViewController viewIsAppearing:](&v5, "viewIsAppearing:", v3);
  if (qword_100172320)
    sub_1000491F0();

}

- (void)enableVolumeHUD:(BOOL)a3
{
  _BOOL8 v3;
  DARootViewController *v4;

  v3 = a3;
  v4 = self;
  sub_100049DE8(v3);

}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  DARootViewController *v7;

  v4 = a4;
  v7 = self;
  *(float *)&v6 = a3;
  sub_100049F24(v4, v6);

}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  DARootViewController *v19;

  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  v18 = swift_allocObject(&unk_100136258, 24, 7);
  *(_QWORD *)(v18 + 16) = v10;
  v19 = self;
  sub_10004CD2C(v11, v13, v14, v16, v17, (uint64_t)sub_10004E42C, v18);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
  swift_release(v18);
}

- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  void *v15;
  DARootViewController *v16;
  DARootViewController *v17;
  uint64_t v18;
  DARootViewController *v19;
  DARootViewController *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  DARootViewController *v25;
  uint64_t v26;
  DARootViewController *v27;
  SEL v28;
  id v29;
  int v30;
  id v31;
  id v32;
  id v33;
  id v34;
  SEL v35;
  id v36;
  int v37;
  id v38;
  id v39;
  id v40;
  id v41;
  SEL v42;
  id v43;
  int v44;
  id v45;
  id v46;
  id v47;
  id v48;
  SEL v49;
  id v50;
  int v51;
  id v52;
  id v53;
  id v54;
  id v55;
  SEL v56;
  id v57;
  int v58;
  id v59;
  id v60;
  id v61;
  id v62;
  SEL v63;
  id v64;
  int v65;
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
  id v78;
  id v79;

  v15 = _Block_copy(a10);
  v16 = (DARootViewController *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v17 = (DARootViewController *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v20 = v19;
  if (!a7)
  {
    v21 = 0;
    if (!a8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  a7 = v22;
  if (a8)
  {
LABEL_3:
    static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
    a8 = v23;
  }
LABEL_4:
  v24 = sub_100035CA4(&qword_10016B6A8);
  v25 = (DARootViewController *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a9, v24);
  v26 = swift_allocObject(&unk_100136168, 24, 7);
  *(_QWORD *)(v26 + 16) = v15;
  v27 = self;
  sub_10004CF64((uint64_t)v16, a4, (uint64_t)v17, v18, (uint64_t)v20, v21, (uint64_t)a7, (uint64_t)v25, (uint64_t)sub_10004E2D0, v26);

  swift_bridgeObjectRelease(v16, v28, v29, v30, v31, v32, v33, v34, v70, v75);
  swift_bridgeObjectRelease(v17, v35, v36, v37, v38, v39, v40, v41, v71, v76);
  swift_bridgeObjectRelease(v20, v42, v43, v44, v45, v46, v47, v48, v72, v77);
  swift_bridgeObjectRelease((DARootViewController *)a8, v49, v50, v51, v52, v53, v54, v55, v73, v78);
  swift_bridgeObjectRelease(v25, v56, v57, v58, v59, v60, v61, v62, v74, v79);
  swift_release(v26);
  swift_bridgeObjectRelease((DARootViewController *)a7, v63, v64, v65, v66, v67, v68, v69, a9, a10);
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return qword_10016CDC0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (DARootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  DARootViewController *v6;
  DARootViewController *v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (DARootViewController *)sub_10004A8D4(v5, v7, a4);
}

- (DARootViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  DARootViewController *v8;
  char *v9;
  DARootViewController *v10;
  objc_super v12;

  v5 = OBJC_IVAR___DARootViewController_responder;
  v6 = objc_allocWithZone((Class)DADiagnosticResponder);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v9 = (char *)v8 + OBJC_IVAR___DARootViewController_remoteCardFilter;
  *(_QWORD *)v9 = &_swiftEmptySetSingleton;
  *((_QWORD *)v9 + 1) = &_swiftEmptySetSingleton;
  v9[16] = 1;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for RootViewController();
  v10 = -[BaseViewController initWithCoder:](&v12, "initWithCoder:", v7);

  return v10;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___DARootViewController_remoteCardFilter;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___DARootViewController_remoteCardFilter);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 1));
  swift_bridgeObjectRelease(v4);
}

- (void)_willAppearInRemoteViewController
{
  DARootViewController *v2;

  v2 = self;
  sub_10004AC1C();

}

- (void)_hostApplicationWillEnterForeground
{
  DARootViewController *v2;

  v2 = self;
  sub_10004B08C();

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  return sub_10004B994((uint64_t)a1, (uint64_t)a2, &protocolRef_DADiagnosticsRemoteViewControllerInterface);
}

+ (id)_exportedInterface
{
  return sub_10004B994((uint64_t)a1, (uint64_t)a2, &protocolRef_DADiagnosticsViewServiceInterface);
}

- (void)remoteViewControllerDidSetSessionToken:(id)a3
{
  uint64_t v4;
  DARootViewController *v5;
  DARootViewController *v6;
  DARootViewController *v7;
  SEL v8;
  id v9;
  int v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10004E058(v4, (uint64_t)v6);

  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14);
}

- (void)remoteViewControllerDidSetRequiredSerialNumbers:(id)a3
{
  sub_10004C1D4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10004BAD0);
}

- (void)remoteViewControllerDidSetSelectableSerialNumbers:(id)a3
{
  sub_10004C1D4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10004BEB8);
}

- (uint64_t)_hostApplicationDidEnterBackground
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  SEL v5;
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];

  v0 = sub_100035CA4((uint64_t *)&unk_10016BE40);
  v1 = swift_allocObject(v0, 72, 7);
  *(_OWORD *)(v1 + 16) = xmmword_10010BE30;
  if (qword_10016A678 != -1)
    swift_once(&qword_10016A678, sub_10008BF34);
  v2 = (void *)qword_100172378;
  *(_QWORD *)(v1 + 56) = sub_100037118(0, (unint64_t *)&qword_10016B180, OS_os_log_ptr);
  *(_QWORD *)(v1 + 64) = sub_10004E1F4((unint64_t *)&qword_10016B690, (unint64_t *)&qword_10016B180, OS_os_log_ptr);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = (void *)static OS_os_log.default.getter(v2);
  v4 = static os_log_type_t.default.getter(v3);
  os_log(_:dso:log:type:_:)("## Host application going into the background", 45, 2, &_mh_execute_header, v3, v4, v1);
  swift_bridgeObjectRelease((DARootViewController *)v1, v5, v6, v7, v8, v9, v10, v11);

  v12 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_10016A618 != -1)
    swift_once(&qword_10016A618, sub_10004ABE8);
  objc_msgSend(v12, "postNotificationName:object:", qword_100172330, 0);

  if (qword_10016A6D8 != -1)
    swift_once(&qword_10016A6D8, sub_1000C6380);
  v13 = type metadata accessor for ModalPresentationCoordinator(0);
  v14 = sub_100036D34(v13, (uint64_t)qword_1001723D0);
  swift_beginAccess(v14, v16, 33, 0);
  sub_1000C5184(0, 0);
  return swift_endAccess(v16);
}

- (uint64_t)remoteViewControllerDidDisappear
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __n128 v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD aBlock[6];

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100037118(0, (unint64_t *)&qword_10016AD00, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter(v8);
  aBlock[4] = sub_10004B9D4;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100030658;
  aBlock[3] = &unk_100136090;
  v10 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter(v11);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v12 = sub_100035C5C();
  v13 = sub_100035CA4((uint64_t *)&unk_10016AD10);
  v14 = sub_100035CE4();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v13, v14, v0, v12);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v3, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
