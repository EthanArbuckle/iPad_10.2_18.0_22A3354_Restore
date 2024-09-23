@implementation GKFastSyncTransport

- (void)connectToPlayersWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4
{
  sub_1BCEB16FC(self, (int)a2, a3, a4);
}

- (void)disconnectAllWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4
{
  sub_1BCEB16FC(self, (int)a2, a3, a4);
}

- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  GKFastSyncTransport *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = self;
  v17 = sub_1BCF1501C();
  v19 = v18;

  sub_1BCEC3F04(0, &qword_1EF499ED8);
  v20 = sub_1BCF15748();

  FastSyncTransport.sendScopedData(_:to:dataMode:dataScope:transportContext:)(v17, v19, v20, a5, a6, (uint64_t)v15);
  swift_bridgeObjectRelease();
  sub_1BCEAC4B8(v17, v19);
  return 1;
}

- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  GKFastSyncTransport *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v11 = a3;
  v12 = a6;
  v13 = self;
  v14 = sub_1BCF1501C();
  v16 = v15;

  FastSyncTransport.sendScopedData(toAll:dataMode:dataScope:transportContext:)(v14, v16, a4, a5, (uint64_t)v12);
  sub_1BCEAC4B8(v14, v16);
  return 1;
}

- (void)chooseBestHostingPlayerWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4
{
  sub_1BCEB16FC(self, (int)a2, a3, a4);
}

- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5
{
  id v7;
  Swift::String v8;
  void *countAndFlagsBits;
  Swift::OpaquePointer v10;
  GKTransportContext *v11;
  GKVoiceChat_optional *v12;

  sub_1BCF15628();
  sub_1BCEC3F04(0, &qword_1EF499ED8);
  sub_1BCF15748();
  v7 = a5;
  v8._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v8._countAndFlagsBits;
  FastSyncTransport.voiceChat(withName:players:transportContext:)(v12, v8, v10, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

- (GKFastSyncTransport)init
{
  FastSyncTransport.init()();
}

- (void).cxx_destruct
{
  sub_1BCEB8864((uint64_t)self + OBJC_IVAR___GKFastSyncTransport_clientDelegate);
  OUTLINED_FUNCTION_251();
  OUTLINED_FUNCTION_251();

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_251();
  OUTLINED_FUNCTION_251();
  OUTLINED_FUNCTION_251();

  swift_bridgeObjectRelease();
}

- (NSData)nearbyConnectionData
{
  GKFastSyncTransport *v2;
  void *v3;

  v2 = self;
  FastSyncTransport.nearbyConnectionData.getter();

  v3 = (void *)sub_1BCF15010();
  sub_1BCEAC4B8(0, 0xC000000000000000);
  return (NSData *)v3;
}

- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
{
  id v6;
  id v7;
  GKFastSyncTransport *v8;
  GKPlayer *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  FastSyncTransport.connect(toGuestPlayer:withHostPlayer:)((GKPlayer *)v8, v9);

  return 0;
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  GKFastSyncTransport *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = sub_1BCF1501C();
  v10 = v9;

  FastSyncTransport.connect(toNearbyPlayer:withConnectionData:)();
  sub_1BCEAC4B8(v8, v10);

}

- (id)enrichPeerDictionariesForPlayersConnection:(id)a3
{
  GKFastSyncTransport *v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF49B0B0);
  sub_1BCF15748();
  v4 = self;
  FastSyncTransport.enrichPeerDictionaries(forPlayersConnection:)();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1BCF1573C();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)localConnectionDataWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  GKFastSyncTransport *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1BCF092DC((uint64_t)&unk_1EF49B0A8, v5);
}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  sub_1BCF1558C();
  sub_1BCF15628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  sub_1BCF1558C();
  swift_bridgeObjectRelease();
}

- (void)preemptRelay:(id)a3
{
  sub_1BCF15628();
  swift_bridgeObjectRelease();
}

@end
