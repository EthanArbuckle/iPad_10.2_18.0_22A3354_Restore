@implementation NowPlayingArtworkMirrorReplicatorLayer

- (void)layoutSublayers
{
  _TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer *v2;

  v2 = self;
  sub_2414AA6B0();

}

- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingArtworkMirrorReplicatorLayer();
  return -[CAReplicatorLayer init](&v3, sel_init);
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_2414B544C();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v4 = sub_2414B57C4();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingArtworkMirrorReplicatorLayer();
  v5 = -[NowPlayingArtworkMirrorReplicatorLayer initWithLayer:](&v7, sel_initWithLayer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingArtworkMirrorReplicatorLayer();
  return -[NowPlayingArtworkMirrorReplicatorLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer));
}

@end
