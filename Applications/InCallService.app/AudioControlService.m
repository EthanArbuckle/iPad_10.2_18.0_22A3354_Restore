@implementation AudioControlService

- (void)routesChangedForRouteController:(id)a3
{
  id v4;
  _TtC13InCallService19AudioControlService *v5;

  v4 = a3;
  v5 = self;
  AudioControlService.routesChanged(for:)();

}

- (_TtC13InCallService19AudioControlService)init
{
  AudioControlService.init()();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13InCallService19AudioControlService_controlEnabledPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13InCallService19AudioControlService_audioRoutesPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13InCallService19AudioControlService_currentAudioRoutePublisher));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13InCallService19AudioControlService_cancellables));
}

@end
