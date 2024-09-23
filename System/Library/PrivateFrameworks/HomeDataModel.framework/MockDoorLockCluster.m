@implementation MockDoorLockCluster

- (void)writeAttributeAutoRelockTimeWithValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v6;
  void (*v7)(uint64_t);
  id v8;
  _TtC13HomeDataModel19MockDoorLockCluster *v9;

  v6 = sub_23E537460();
  v7 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC13HomeDataModel19MockDoorLockCluster_setAutoRelockTime);
  if (v7)
  {
    v8 = a4;
    v9 = self;
    sub_23E27D5B0((uint64_t)v7);
    v7(v6);
    sub_23E22D1F8((uint64_t)v7);

  }
  swift_bridgeObjectRelease();
}

- (_TtC13HomeDataModel19MockDoorLockCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  sub_23E27D3BC((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (_TtC13HomeDataModel19MockDoorLockCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
  sub_23E27D418((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23E22D1F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13HomeDataModel19MockDoorLockCluster_commandObserver));
  sub_23E22D1F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13HomeDataModel19MockDoorLockCluster_setAutoRelockTime));
  sub_23E22D1F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13HomeDataModel19MockDoorLockCluster_setWalletKeyUWBApproachAngle));
}

@end
