@implementation ARQLReplayObserver

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  _TtC11AssetViewer18ARQLReplayObserver *v7;

  v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11AssetViewer18ARQLReplayObserver_callback);
  if (v3)
  {
    v5 = a3;
    v7 = self;
    v6 = sub_1D93D6BE8((uint64_t)v3);
    v3(v6);
    sub_1D93D6F38((uint64_t)v3);

  }
}

- (_TtC11AssetViewer18ARQLReplayObserver)init
{
  _TtC11AssetViewer18ARQLReplayObserver *result;

  result = (_TtC11AssetViewer18ARQLReplayObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer18ARQLReplayObserver_callback));
}

@end
