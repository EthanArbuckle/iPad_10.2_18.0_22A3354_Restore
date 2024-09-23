@implementation InstrumentedTransportClientDelegate

- (void)connectionDidChangeWithState:(int)a3 playerID:(id)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a3;
  sub_1BCF15628();
  swift_retain();
  sub_1BCEC1C70(v4);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)connectionDidFailWithError:(id)a3
{
  sub_1BCEC20A0((uint64_t)self, (uint64_t)a2, a3, (uint64_t)sub_1BCEC43A8, (SEL *)&selRef_connectionDidFailWithError_);
}

- (void)relayDidReceivePushData:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = sub_1BCF1558C();
  _Block_copy(v5);
  swift_retain();
  sub_1BCEC1D90(v6, (uint64_t)self, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)transportDidFailWithError:(id)a3
{
  sub_1BCEC20A0((uint64_t)self, (uint64_t)a2, a3, (uint64_t)sub_1BCEC43A8, (SEL *)&selRef_transportDidFailWithError_);
}

- (void)transportDidReceivePacket:(id)a3 fromPlayerID:(id)a4 remoteRecipientID:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = sub_1BCF15628();
  v9 = v8;
  if (a5)
  {
    v10 = sub_1BCF15628();
    a5 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = a3;
  swift_retain();
  sub_1BCEC2100((uint64_t)v12, v7, v9, v10, a5);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)transportDidUpdateWithInfo:(id)a3
{
  sub_1BCF1558C();
  swift_retain();
  sub_1BCEC2258();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
