@implementation HostedSceneObserver

- (_TtC12DrawingBoard19HostedSceneObserver)init
{
  _TtC12DrawingBoard19HostedSceneObserver *result;

  result = (_TtC12DrawingBoard19HostedSceneObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectUnownedDestroy();
  sub_23A6EDFE4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle), *(void **)&self->scene[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration));
  v3 = (char *)self + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver___observationRegistrar;
  v4 = sub_23A70D03C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)scene:(id)a3 didUpdateHostHandle:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard19HostedSceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6EDBE8(a4);

}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard19HostedSceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6ECDF0(v6);

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  sub_23A6E24A4(0, (unint64_t *)&qword_2569AFF10);
  sub_23A6DD7F0();
  return (id)sub_23A70D540();
}

@end
