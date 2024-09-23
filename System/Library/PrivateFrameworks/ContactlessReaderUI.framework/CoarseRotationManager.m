@implementation CoarseRotationManager

- (_TtC19ContactlessReaderUI21CoarseRotationManager)init
{
  return (_TtC19ContactlessReaderUI21CoarseRotationManager *)sub_22F88AE98();
}

- (void)dealloc
{
  void *v2;
  _TtC19ContactlessReaderUI21CoarseRotationManager *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19ContactlessReaderUI21CoarseRotationManager_accelerometer);
  v3 = self;
  objc_msgSend(v2, sel_setOrientationEventsEnabled_, 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CoarseRotationManager(0);
  -[CoarseRotationManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21CoarseRotationManager__orientation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E1FD28);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI21CoarseRotationManager_accelerometer));
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6;
  _TtC19ContactlessReaderUI21CoarseRotationManager *v7;

  v6 = a3;
  v7 = self;
  sub_22F88BD88(a4);

}

@end
