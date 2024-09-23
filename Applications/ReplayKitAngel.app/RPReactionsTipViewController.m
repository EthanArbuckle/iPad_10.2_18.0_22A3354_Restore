@implementation RPReactionsTipViewController

- (_TtC14ReplayKitAngel28RPReactionsTipViewController)initWithCoder:(id)a3
{
  return (_TtC14ReplayKitAngel28RPReactionsTipViewController *)sub_10001EAE4(a3);
}

- (void)viewDidLoad
{
  _TtC14ReplayKitAngel28RPReactionsTipViewController *v2;

  v2 = self;
  sub_10001EBEC();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC14ReplayKitAngel28RPReactionsTipViewController *v4;

  v3 = a3;
  v4 = self;
  sub_10001F01C(v3);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC14ReplayKitAngel28RPReactionsTipViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100020EA0();

}

- (_TtC14ReplayKitAngel28RPReactionsTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC14ReplayKitAngel28RPReactionsTipViewController *result;

  v4 = a4;
  result = (_TtC14ReplayKitAngel28RPReactionsTipViewController *)_swift_stdlib_reportUnimplementedInitializer("ReplayKitAngel.RPReactionsTipViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipPopoverController);
  swift_bridgeObjectRelease(*(_QWORD *)&self->tipAnchorView[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->tipAnchorView[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints));
}

- (uint64_t)prepareForPopoverPresentation:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10001DA68();
  v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    v11 = sub_1000184E8(0xD000000000000021, 0x800000010002FAD0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end
