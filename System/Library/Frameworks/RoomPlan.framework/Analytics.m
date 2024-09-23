@implementation Analytics

- (_TtC8RoomPlan9Analytics)init
{
  uint64_t v3;
  void *v4;
  _TtC8RoomPlan9Analytics *v5;
  id v6;
  unsigned __int8 v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan9Analytics_roomPlanStats) = (Class)MEMORY[0x24BEE4B00];
  v3 = OBJC_IVAR____TtC8RoomPlan9Analytics_bOptInApple;
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_sharedInstance);
  v7 = objc_msgSend(v6, sel_optInApple);

  *((_BYTE *)&self->super.isa + v3) = v7;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for Analytics();
  return -[Analytics init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
