@implementation MAGAngelConnectionManager

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v5;
  void *v6;
  objc_super v7;

  v3 = OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener);
  v5 = self;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    v6 = *(Class *)((char *)&self->super.isa + v3);
    *(Class *)((char *)&self->super.isa + v3) = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MAGAngelConnectionManager();
  -[MAGAngelConnectionManager dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_clientRequestStream));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100026380(v9);

  swift_unknownObjectRelease(a5);
}

- (_TtC14MagnifierAngel25MAGAngelConnectionManager)init
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *result;

  result = (_TtC14MagnifierAngel25MAGAngelConnectionManager *)_swift_stdlib_reportUnimplementedInitializer("MagnifierAngel.MAGAngelConnectionManager", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)presentDetectionUI
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100024044();

}

- (void)dismissUI
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_1000242A0();

}

- (void)hideUI
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100024504();

}

- (void)toggleUI
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100024760();

}

- (void)toggleTextDetection
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_1000249C0();

}

- (void)toggleFurnitureDetection
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100024C20();

}

- (void)togglePeopleDetection
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100024E80();

}

- (void)toggleDoorDetection
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_1000250E0();

}

- (void)toggleImageDescriptions
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100025340();

}

- (void)togglePointAndSpeak
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_1000255A0();

}

- (void)describeScene
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100025800();

}

- (id)currentState
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_100026714();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (void)stopSpeech
{
  _TtC14MagnifierAngel25MAGAngelConnectionManager *v2;

  v2 = self;
  sub_100025A9C();

}

@end
