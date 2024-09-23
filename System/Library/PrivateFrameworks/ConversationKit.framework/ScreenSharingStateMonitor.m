@implementation ScreenSharingStateMonitor

- (BOOL)isBroadcastingScreenSharing
{
  return ScreenSharingStateMonitor.isBroadcastingScreenSharing.getter() & 1;
}

- (void)setIsBroadcastingScreenSharing:(BOOL)a3
{
  ScreenSharingStateMonitor.isBroadcastingScreenSharing.setter(a3);
}

- (CGSize)currentlySharingParticipantContentsSize
{
  _TtC15ConversationKit25ScreenSharingStateMonitor *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = ScreenSharingStateMonitor.currentlySharingParticipantContentsSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (TUCall)call
{
  return (TUCall *)ScreenSharingStateMonitor.call.getter();
}

- (void)setCall:(id)a3
{
  id v5;
  _TtC15ConversationKit25ScreenSharingStateMonitor *v6;

  v5 = a3;
  v6 = self;
  ScreenSharingStateMonitor.call.setter(a3);

}

- (void)addObserver:(id)a3
{
  @objc ScreenSharingStateMonitor.addObserver(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ScreenSharingStateMonitor.addObserver(_:));
}

- (void)removeObserver:(id)a3
{
  @objc ScreenSharingStateMonitor.addObserver(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ScreenSharingStateMonitor.removeObserver(_:));
}

- (_TtC15ConversationKit25ScreenSharingStateMonitor)init
{
  _TtC15ConversationKit25ScreenSharingStateMonitor *result;

  ScreenSharingStateMonitor.init()();
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_conversationController, &demangling cache variable for type metadata for ScreenSharingStateMonitorConversationProviderProtocol?);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_conversationControllerProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_screenSharingRemoteControllerObservation));
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit25ScreenSharingStateMonitor_currentlySharingParticipant, &demangling cache variable for type metadata for Participant?);

}

@end
