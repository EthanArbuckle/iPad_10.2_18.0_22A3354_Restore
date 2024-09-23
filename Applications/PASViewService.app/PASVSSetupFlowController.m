@implementation PASVSSetupFlowController

- (void)initiateClientConnectionIfEligible
{
  sub_100006070((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))PASVSSetupFlowController.initiateClientConnectionIfEligible());
}

- (void)activateClientConnection
{
  sub_100006070((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))PASVSSetupFlowController.activateClientConnection());
}

- (void)handleScannedCode:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain(self);
  v7._countAndFlagsBits = v4;
  v7._object = v6;
  PASVSSetupFlowController.handleScannedCode(_:)(v7);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
}

- (void)enableManualPairing
{
  sub_100006070((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))PASVSSetupFlowController.enableManualPairing());
}

- (void)invalidateClientConnection
{
  sub_100006070((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))PASVSSetupFlowController.invalidateClientConnection());
}

@end
