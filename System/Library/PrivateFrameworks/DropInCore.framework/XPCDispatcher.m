@implementation XPCDispatcher

- (void)checkInWithCompletionHandler:(id)a3
{
  sub_23A788B48((int)self, (int)a2, a3, (uint64_t)&unk_250B9E2C8, (uint64_t)sub_23A78C0C0, sub_23A787DD8);
}

- (void)cancelSessionWithContext:(id)a3 session:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v13 = a3;
  v11 = a4;
  swift_retain();
  v12 = a5;
  sub_23A7880D4(v13, v11, (uint64_t)a5, (uint64_t)sub_23A78C0C0, v10);
  swift_release();

  swift_release();
}

- (void)startSessionWithContext:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  sub_23A788950((int)self, (int)a2, a3, a4, a5, (uint64_t)&unk_250B9E278, (uint64_t)sub_23A78BEE0, sub_23A78837C);
}

- (void)endSessionWithContext:(id)a3 session:(id)a4 completionHandler:(id)a5
{
  sub_23A788950((int)self, (int)a2, a3, a4, a5, (uint64_t)&unk_250B9E250, (uint64_t)sub_23A78C0C0, sub_23A78864C);
}

- (void)getCurrentSessionWithCompletionHandler:(id)a3
{
  sub_23A788B48((int)self, (int)a2, a3, (uint64_t)&unk_250B9E228, (uint64_t)sub_23A78BED0, sub_23A788A00);
}

- (void)setUplinkMutedForCurrentSession:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_retain();
  sub_23A788BB8(a3, (uint64_t)self, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  swift_release();
}

- (void)getUplinkMutedForCurrentSessionWithCompletionHandler:(id)a3
{
  sub_23A788B48((int)self, (int)a2, a3, (uint64_t)&unk_250B9E1B0, (uint64_t)sub_23A78BE18, sub_23A789234);
}

- (void)loadDevicesWithContext:(id)a3 completionHandler:(id)a4
{
  sub_23A78A2A4((int)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_23A789604);
}

- (void)registerAudioPowerWithContext:(id)a3 completionHandler:(id)a4
{
  sub_23A78A2A4((int)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_23A789DC0);
}

- (void)updateState:(int64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = _Block_copy(a5);
  v8 = sub_23A7F20E8();
  v10 = v9;
  _Block_copy(v7);
  swift_retain();
  sub_23A78A310(a3, v8, v10, (uint64_t)self, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)requestStateForDevice:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  swift_retain();
  sub_23A78AC80(v7, (uint64_t)sub_23A78BAAC, v6);
  swift_release();
  swift_release();

}

- (void)setUplinkMuted:(BOOL)a3 completionHandler:(id)a4
{
  sub_23A78B14C((int)self, (int)a2, a3, a4, (SEL *)&selRef_setUplinkMuted_);
}

- (void)setDownlinkMuted:(BOOL)a3 completionHandler:(id)a4
{
  sub_23A78B14C((int)self, (int)a2, a3, a4, (SEL *)&selRef_setDownlinkMuted_);
}

- (void)getUplinkMutedWithCompletionHandler:(id)a3
{
  sub_23A78B470((int)self, (int)a2, a3, (SEL *)&selRef_isUplinkMuted);
}

- (void)getDownlinkMutedWithCompletionHandler:(id)a3
{
  sub_23A78B470((int)self, (int)a2, a3, (SEL *)&selRef_isDownlinkMuted);
}

@end
