@implementation NoSessionViewController

- (BOOL)showingDeviceInformation
{
  return self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__showingDeviceInformation];
}

- (void)setShowingDeviceInformation:(BOOL)a3
{
  self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__showingDeviceInformation] = a3;
}

- (UIView)substitutableView
{
  return (UIView *)-[NoSessionViewController headerView](self, "headerView");
}

- (UIButton)infoButton
{
  return (UIButton *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__infoButton];
}

- (void)setInfoButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__infoButton];
  *(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__infoButton] = a3;
  v3 = a3;

}

- (UIView)deviceInformationView
{
  return (UIView *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__deviceInformationView];
}

- (void)setDeviceInformationView:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__deviceInformationView];
  *(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics23NoSessionViewController__deviceInformationView] = a3;
  v3 = a3;

}

- (void)viewDidLoad
{
  _TtC11Diagnostics23NoSessionViewController *v2;

  v2 = self;
  sub_10008C364();

}

- (void)viewDidLayoutSubviews
{
  _TtC11Diagnostics23NoSessionViewController *v2;

  v2 = self;
  sub_10008C5E4();

}

- (_TtC11Diagnostics23NoSessionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC11Diagnostics23NoSessionViewController *result;

  result = (_TtC11Diagnostics23NoSessionViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.NoSessionViewController", 35, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics23NoSessionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC11Diagnostics23NoSessionViewController *result;

  v6 = a5;
  result = (_TtC11Diagnostics23NoSessionViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.NoSessionViewController", 35, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (uint64_t)viewDidAppear:
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  NSString v14;
  unsigned __int8 v15;
  id v16;
  unsigned int v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  __n128 v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  v30 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DispatchQoS(0);
  v28 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchTime(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v27 - v11;
  v13 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "BOOLForKey:", v14);

  if ((v15 & 1) != 0
    || (v16 = objc_msgSend((id)objc_opt_self(DAPlatform), "currentPlatform"),
        v17 = objc_msgSend(v16, "isInBoxUpdateModeActive"),
        result = swift_unknownObjectRelease(v16),
        v17))
  {
    v19 = sub_100037118(0, (unint64_t *)&qword_10016AD00, OS_dispatch_queue_ptr);
    v20 = (void *)static OS_dispatch_queue.main.getter(v19);
    static DispatchTime.now()(v20);
    + infix(_:_:)(v10, 2.0);
    v21 = *(void (**)(char *, uint64_t))(v7 + 8);
    v21(v10, v6);
    aBlock[4] = sub_10008C5D8;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100030658;
    aBlock[3] = &unk_100139580;
    v22 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter(v23);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v24 = sub_100035C5C();
    v25 = sub_100035CA4((uint64_t *)&unk_10016AD10);
    v26 = sub_100035CE4();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v0, v24);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v12, v5, v2, v22);
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v2, v0);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v29);
    return ((uint64_t (*)(char *, uint64_t))v21)(v12, v6);
  }
  return result;
}

@end
