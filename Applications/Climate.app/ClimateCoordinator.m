@implementation ClimateCoordinator

- (_TtC7Climate18ClimateCoordinator)init
{
  return (_TtC7Climate18ClimateCoordinator *)sub_100024F64();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Climate18ClimateCoordinator_assetManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Climate18ClimateCoordinator_activeScenes));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Climate18ClimateCoordinator_requestContentManager));
  v3 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__appActive;
  v4 = sub_100006058(&qword_1000B83E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__currentCar;
  v6 = sub_100006058(&qword_1000B83E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__climateSystem;
  v8 = sub_100006058(&qword_1000B74B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__activeZone;
  v10 = sub_100006058((uint64_t *)&unk_1000B83D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__layoutSide;
  v12 = sub_100006058(&qword_1000B83C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__layoutMode;
  v14 = sub_100006058(&qword_1000B83C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC7Climate18ClimateCoordinator__statusBarSteppersState;
  v16 = sub_100006058((uint64_t *)&unk_1000B7BA0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Climate18ClimateCoordinator_cancellables));
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6;
  id v7;
  _TtC7Climate18ClimateCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10002C860(a4);

}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  _TtC7Climate18ClimateCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1000277A0(0xD00000000000001BLL, 0x800000010008D0E0);

}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  _TtC7Climate18ClimateCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1000277A0(0xD000000000000022, 0x800000010008D0B0);

}

- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4
{
  id v5;
  _TtC7Climate18ClimateCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1000277A0(0xD00000000000001DLL, 0x800000010008D090);

}

- (void)positionManagerDidUpdateTracking:(id)a3
{
  id v4;
  _TtC7Climate18ClimateCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1000277A0(0xD000000000000024, 0x800000010008D060);

}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  _TtC7Climate18ClimateCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1000277A0(0xD000000000000028, 0x800000010008D030);

}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  _TtC7Climate18ClimateCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100025754();

}

@end
