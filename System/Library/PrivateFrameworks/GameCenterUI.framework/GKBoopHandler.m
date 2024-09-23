@implementation GKBoopHandler

- (GKBoopHandler)initWithUrlProvider:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  return (GKBoopHandler *)BoopHandler.init(urlProvider:)((uint64_t)sub_1AB53EC34, v4);
}

- (void)startNearbyDiscoveryWithCompletionHandler:(id)a3
{
  sub_1AB53E468(self, (int)a2, a3, (uint64_t)&unk_1E59D2E40, (uint64_t)&unk_1EEC02A30);
}

- (void)stopWithCompletionHandler:(id)a3
{
  sub_1AB53E468(self, (int)a2, a3, (uint64_t)&unk_1E59D2E18, (uint64_t)&unk_1EEC02A20);
}

- (GKBoopHandler)init
{
  BoopHandler.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  sub_1AB47A074((uint64_t)self + OBJC_IVAR___GKBoopHandler_currentNearbySharingInteraction, &qword_1EEC02910);
  sub_1AB47A074((uint64_t)self + OBJC_IVAR___GKBoopHandler_currentNearbySharingAssertionID, &qword_1EEC02918);
}

@end
