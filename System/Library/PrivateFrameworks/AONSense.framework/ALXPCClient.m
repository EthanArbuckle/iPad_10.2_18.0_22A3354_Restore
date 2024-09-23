@implementation ALXPCClient

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

  ALXPCClient.onData(_:)(v4, v6);
  outlined consume of Data._Representation(v4, v6);
  swift_release();
}

- (void)onInterrupt
{
  objc_msgSend(*(id *)self->_callback, sel_onInterrupt);
}

@end
