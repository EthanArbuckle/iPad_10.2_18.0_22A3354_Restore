@implementation TiledViewRenderer

- (_TtC9PencilKit17TiledViewRenderer)init
{
  uint64_t v3;
  void *v4;
  _TtC9PencilKit17TiledViewRenderer *v5;
  objc_class *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC9PencilKit17TiledViewRenderer_startTime;
  v4 = (void *)objc_opt_self();
  v5 = self;
  objc_msgSend(v4, sel_timeIntervalSinceReferenceDate);
  *(Class *)((char *)&self->super.isa + v3) = v6;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC9PencilKit17TiledViewRenderer_duration) = (Class)0x3FF0000000000000;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for TiledViewRenderer();
  return -[TiledViewRenderer init](&v8, sel_init);
}

@end
