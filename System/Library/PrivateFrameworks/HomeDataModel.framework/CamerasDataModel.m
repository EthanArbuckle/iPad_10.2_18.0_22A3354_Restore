@implementation CamerasDataModel

- (_TtC13HomeDataModel16CamerasDataModel)init
{
  _TtC13HomeDataModel16CamerasDataModel *v2;
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t, uint64_t);
  objc_super v7;

  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC13HomeDataModel16CamerasDataModel__homesToCameraControllers) = (Class)sub_23E20E3B8(MEMORY[0x24BEE4AF8]);
  v3 = (char *)v2 + OBJC_IVAR____TtC13HomeDataModel16CamerasDataModel__currentHomeIdentifier;
  v4 = sub_23E536F80();
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(v3, 1, 1, v4);
  sub_23E537094();

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CamerasDataModel();
  return -[CamerasDataModel init](&v7, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_23E273104((uint64_t)self + OBJC_IVAR____TtC13HomeDataModel16CamerasDataModel__currentHomeIdentifier);
  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel16CamerasDataModel___observationRegistrar;
  v4 = sub_23E5370A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
