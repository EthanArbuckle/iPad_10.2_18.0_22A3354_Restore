@implementation RemoteParticipantVideoProvider

- (void)dealloc
{
  _TtC15ConversationKit30RemoteParticipantVideoProvider *v2;

  v2 = self;
  RemoteParticipantVideoProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_features));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider__remoteVideoAttributes);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider__remoteScreenAttributes);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_avcRemoteVideoClient);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_avcRemoteVideoClientDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30RemoteParticipantVideoProvider_oneToOneModeStateProvider);
}

- (_TtC15ConversationKit30RemoteParticipantVideoProvider)init
{
  RemoteParticipantVideoProvider.init()();
}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4;

  v4 = a3;
  self;
  RemoteParticipantVideoProvider.remoteVideoClientDidReceiveFirstFrame(_:)();
}

- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:videoDidSuspend:)();
}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteVideoDidPause:)();
}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:videoDidDegrade:)();
}

- (void)remoteVideoClient:(id)a3 networkQualityDidDegrade:(BOOL)a4 info:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC15ConversationKit30RemoteParticipantVideoProvider *v10;

  if (a5)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v8 = 0;
  v9 = a3;
  v10 = self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:networkQualityDidDegrade:info:)((uint64_t)v9, a4, v8);

  swift_bridgeObjectRelease();
}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteMediaDidStall:)();
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteVideoAttributesDidChange:)((uint64_t)v6, v7);
}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  self;
  RemoteParticipantVideoProvider.remoteVideoClient(_:remoteScreenAttributesDidChange:)((uint64_t)a3, a4);
}

- (NSString)debugDescription
{
  _TtC15ConversationKit30RemoteParticipantVideoProvider *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = RemoteParticipantVideoProvider.debugDescription.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1C3B72E00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end
