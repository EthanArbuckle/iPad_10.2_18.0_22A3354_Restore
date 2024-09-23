@implementation ProxCardFlowEngine

- (void)dealloc
{
  _TtC21TDGSharingViewService18ProxCardFlowEngine *v2;

  v2 = self;
  sub_1000108F4();
}

- (void).cxx_destruct
{
  sub_10000B6F0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow));

  sub_10000FE98((uint64_t)self + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage, &qword_100042B20);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_navigationContoller));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_appleIDManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_assetLoader));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_cancellables));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_interactionEventPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupPinPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_layoutCache));
}

- (void)handleDeviceSetupNotification:(id)a3
{
  _TtC21TDGSharingViewService18ProxCardFlowEngine *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1000166FC(v5);

}

- (_TtC21TDGSharingViewService18ProxCardFlowEngine)init
{
  _TtC21TDGSharingViewService18ProxCardFlowEngine *result;

  result = (_TtC21TDGSharingViewService18ProxCardFlowEngine *)_swift_stdlib_reportUnimplementedInitializer("TDGSharingViewService.ProxCardFlowEngine", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
