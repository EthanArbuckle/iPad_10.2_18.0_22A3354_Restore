@implementation ResultHandler

- (void)onData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  swift_retain();
  v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  ResultHandler.onData(_:)(v4, v6);
  outlined consume of Data._Representation(v4, v6);
  swift_release();
}

- (void)onInterrupt
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))self->_cbInterrupt;
  v3 = swift_retain();
  v2(v3);
  swift_release();
}

@end
