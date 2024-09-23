@implementation PASVSSetupEventPresenter

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController));
}

- (void)setPresentingViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController) = (Class)a3;
  v3 = a3;

}

- (_TtP14PASViewService22PASViewServiceProtocol_)delegate
{
  return (_TtP14PASViewService22PASViewServiceProtocol_ *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate), a2);
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate) = (Class)a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (void)showProxCard
{
  _TtC14PASViewService24PASVSSetupEventPresenter *v2;

  v2 = self;
  sub_1000097A8();

}

- (void)authRequested
{
  _TtC14PASViewService24PASVSSetupEventPresenter *v2;

  v2 = self;
  sub_10000A75C();

}

- (void)showManualPinEntry
{
  _TtC14PASViewService24PASVSSetupEventPresenter *v2;

  v2 = self;
  sub_10000A924();

}

- (void)showPinEntryError
{
  _TtC14PASViewService24PASVSSetupEventPresenter *v2;

  v2 = self;
  sub_10000AE9C();

}

- (void)authCompleted:(CUMessageSession *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CUMessageSession *v15;
  _TtC14PASViewService24PASVSSetupEventPresenter *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100004170(&qword_10001E310);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100018F78, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100018FA0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10001E320;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100018FC8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10001E330;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10000C0AC((uint64_t)v9, (uint64_t)&unk_10001E340, (uint64_t)v14);
  swift_release(v17);
}

- (void)showErrorWithTitle:(id)a3 message:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC14PASViewService24PASVSSetupEventPresenter *v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  sub_10000B7BC(v6, v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
}

- (_TtC14PASViewService24PASVSSetupEventPresenter)init
{
  _TtC14PASViewService24PASVSSetupEventPresenter *result;

  result = (_TtC14PASViewService24PASVSSetupEventPresenter *)_swift_stdlib_reportUnimplementedInitializer("PASViewService.PASVSSetupEventPresenter", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter));
  swift_bridgeObjectRelease(*(_QWORD *)&self->presentingViewController[OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_accountUserName]);
  sub_100006884((uint64_t)self + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice, &qword_10001E2F0);
  sub_100006884((uint64_t)self + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_viewDetails, &qword_10001E2C0);
  sub_1000041B0((uint64_t)self + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_proxyDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController));
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  id v4;
  _TtC14PASViewService24PASVSSetupEventPresenter *v5;

  v4 = a3;
  v5 = self;
  sub_10000C410();

}

- (void)proxCardFlowDidDismiss
{
  _TtC14PASViewService24PASVSSetupEventPresenter *v2;

  v2 = self;
  sub_10000BE40();
}

@end
