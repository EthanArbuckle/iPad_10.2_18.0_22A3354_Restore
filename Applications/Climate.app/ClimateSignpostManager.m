@implementation ClimateSignpostManager

- (_TtC7Climate22ClimateSignpostManager)init
{
  return (_TtC7Climate22ClimateSignpostManager *)sub_100070D78();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Climate22ClimateSignpostManager_observingServices));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Climate22ClimateSignpostManager_observingAccessories));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Climate22ClimateSignpostManager_emitted));

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  _TtC7Climate22ClimateSignpostManager *v6;

  v5 = a3;
  v6 = self;
  sub_100071AEC(v5, (uint64_t)&unk_1000A0358, (uint64_t)sub_100071D90, (uint64_t)&unk_1000A0370);

}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  _TtC7Climate22ClimateSignpostManager *v6;

  v5 = a3;
  v6 = self;
  sub_100071AEC(v5, (uint64_t)&unk_1000A0308, (uint64_t)sub_100071D44, (uint64_t)&unk_1000A0320);

}

@end
