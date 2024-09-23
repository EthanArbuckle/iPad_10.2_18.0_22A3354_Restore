@implementation GKMultiplayerActivityReporter

- (GKMultiplayerActivityReporter)initWithLocalPlayerID:(id)a3 matchDataDelegate:(id)a4 apiReporter:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = sub_1BCF15628();
  v9 = v8;
  swift_unknownObjectRetain();
  return (GKMultiplayerActivityReporter *)MultiplayerActivityReporter.init(localPlayerID:matchDataDelegate:apiReporter:)(v7, v9, (uint64_t)a4, a5);
}

- (id)instrumentClientDelegate:(id)a3 transportContext:(id)a4
{
  id v7;
  GKMultiplayerActivityReporter *v8;
  void *v9;
  void *v10;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  MultiplayerActivityReporter.instrument(clientDelegate:transportContext:)((uint64_t)a3, v7);
  v10 = v9;
  swift_unknownObjectRelease();

  return v10;
}

- (id)instrumentErrorHandler:(id)a3 transportContext:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v5 = _Block_copy(a3);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_1BCEC3F70;
  }
  else
  {
    v6 = 0;
  }
  MultiplayerActivityReporter.instrument(errorHandler:transportContext:)((uint64_t)v5, v6, a4);
  v8 = v7;
  sub_1BCEC3F60((uint64_t)v5);
  v11[4] = sub_1BCEC1BEC;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1BCEBEE10;
  v11[3] = &block_descriptor_19;
  v9 = _Block_copy(v11);
  swift_release();
  return v9;
}

- (id)instrumentBestHostElectedHandler:(id)a3 transportContext:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v5 = _Block_copy(a3);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  MultiplayerActivityReporter.instrument(bestHostHandler:transportContext:)((uint64_t)sub_1BCEC43A4, v6, a4);
  v8 = v7;
  swift_release();
  v11[4] = sub_1BCEC1C48;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1BCEBF098;
  v11[3] = &block_descriptor_16;
  v9 = _Block_copy(v11);
  swift_release();
  return v9;
}

- (void)onDisconnectWithTransportContext:(id)a3
{
  GKTransportContext *v4;
  GKMultiplayerActivityReporter *v5;

  v4 = (GKTransportContext *)a3;
  v5 = self;
  MultiplayerActivityReporter.onDisconnect(transportContext:)(v4);

}

- (void)onGameplayStartedWithTransportContext:(id)a3
{
  GKTransportContext *v4;
  GKMultiplayerActivityReporter *v5;

  v4 = (GKTransportContext *)a3;
  v5 = self;
  MultiplayerActivityReporter.onGameplayStarted(transportContext:)(v4);

}

- (void)onGameplayEndedWithReason:(int64_t)a3 error:(id)a4 transportContext:(id)a5
{
  id v8;
  GKMultiplayerActivityReporter *v9;
  id v10;

  v8 = a5;
  v9 = self;
  v10 = a4;
  MultiplayerActivityReporter.onGameplayEnded(reason:error:transportContext:)(a3, (uint64_t)a4, v8);

}

- (void)onInviteSentWithApproach:(unint64_t)a3 isHosted:(BOOL)a4 recipients:(id)a5 transportContext:(id)a6
{
  uint64_t v10;
  id v11;
  GKMultiplayerActivityReporter *v12;

  sub_1BCEC3F04(0, &qword_1EF49A420);
  v10 = sub_1BCF15748();
  v11 = a6;
  v12 = self;
  MultiplayerActivityReporter.onInviteSent(approach:isHosted:recipients:transportContext:)(a3, a4, v10, v11);

  swift_bridgeObjectRelease();
}

- (void)onTransportError:(id)a3 transportContext:(id)a4
{
  id v6;
  GKMultiplayerActivityReporter *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  MultiplayerActivityReporter.onTransportError(error:transportContext:)((uint64_t)v9, v6, v8);

}

- (GKMultiplayerActivityReporter)init
{
  MultiplayerActivityReporter.init()();
}

- (void).cxx_destruct
{
  sub_1BCEB8864((uint64_t)self + OBJC_IVAR___GKMultiplayerActivityReporter_matchDataDelegate);
  swift_bridgeObjectRelease();

  swift_release();
}

@end
