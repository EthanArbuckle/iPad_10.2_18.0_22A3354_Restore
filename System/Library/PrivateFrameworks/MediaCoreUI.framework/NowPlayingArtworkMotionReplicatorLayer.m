@implementation NowPlayingArtworkMotionReplicatorLayer

- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)init
{
  _TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer_originalContent) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingArtworkMotionReplicatorLayer();
  v2 = -[CAReplicatorLayer init](&v4, sel_init);
  -[CAReplicatorLayer setInstanceCount:](v2, sel_setInstanceCount_, 2);
  return v2;
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)initWithCoder:(id)a3
{
  id v4;
  _TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer_originalContent) = 0;
  v4 = a3;

  result = (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *)sub_2414B5674();
  __break(1u);
  return result;
}

- (void)layoutSublayers
{
  _TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *v2;

  v2 = self;
  sub_2414114CC();

}

- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)initWithLayer:(id)a3
{
  _TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *result;

  swift_unknownObjectRetain();
  sub_2414B544C();
  swift_unknownObjectRelease();
  result = (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer_originalContent));
}

@end
