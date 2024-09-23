@implementation PasswordSharingFlowViewController

- (_TtC18SharingViewService33PasswordSharingFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  return (_TtC18SharingViewService33PasswordSharingFlowViewController *)sub_1000685EC(v5, v7, a4);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC18SharingViewService33PasswordSharingFlowViewController *v9;

  v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017A230, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(uint64_t))sub_10005B9E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100068708(v8, v6);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)handleButtonActions:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC18SharingViewService33PasswordSharingFlowViewController *v9;
  uint64_t v10;

  if (a3)
  {
    v5 = sub_100069228();
    v6 = sub_10005B9EC();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(uint64_t *)((char *)&self->super + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_module);
  if (v8)
  {
    v9 = self;
    swift_unknownObjectRetain(v8);
    sub_100095F28(v7, v10);

    swift_unknownObjectRelease(v8);
  }
  swift_bridgeObjectRelease(v7);
}

- (_TtC18SharingViewService33PasswordSharingFlowViewController)initWithCoder:(id)a3
{
  _TtC18SharingViewService26BaseProxFlowViewController *v4;
  id v5;
  _TtC18SharingViewService33PasswordSharingFlowViewController *result;

  v4 = (_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_module);
  *v4 = 0;
  v4[1] = 0;
  *(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                          + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_prxContainerViewController) = 0;
  *(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                          + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_userInfo) = 0;
  v5 = a3;

  result = (_TtC18SharingViewService33PasswordSharingFlowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100136660, "SharingViewService/PasswordSharingFlowViewController.swift", 58, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService33PasswordSharingFlowViewController *v4;

  v4 = self;
  sub_100068B24(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC18SharingViewService33PasswordSharingFlowViewController *v6;
  uint64_t v7;
  void *v8;
  NSString v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = self;
  v7 = sub_100064288();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = String._bridgeToObjectiveC()();
    objc_msgSend(v8, "setIdleTimerDisabled:forReason:", 0, v9);

    swift_unknownObjectRelease(v8);
  }
  v10.receiver = v6;
  v10.super_class = ObjectType;
  -[PasswordSharingFlowViewController viewDidDisappear:](&v10, "viewDidDisappear:", v3);

}

- (void)proxCardFlowWillPresent
{
  uint64_t v2;
  uint64_t v3;
  _TtC18SharingViewService33PasswordSharingFlowViewController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject *oslog;

  v2 = qword_1001A2FE8;
  v4 = self;
  if (v2 != -1)
    swift_once(&qword_1001A2FE8, sub_10006855C);
  v5 = type metadata accessor for Logger(0, v3);
  v6 = sub_10000E8E8(v5, (uint64_t)qword_1001A5B60);
  oslog = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter(oslog, v7);
  if (os_log_type_enabled(oslog, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v8, "Begin Password Sharing flow", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

}

- (void)proxCardFlowDidDismiss
{
  _TtC18SharingViewService33PasswordSharingFlowViewController *v2;

  v2 = self;
  sub_100068EE8();

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)((char *)&self->super
                                       + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_module));
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_prxContainerViewController));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)&self->super
                                      + OBJC_IVAR____TtC18SharingViewService33PasswordSharingFlowViewController_userInfo));
}

@end
