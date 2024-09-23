@implementation AdContext

- (_TtC7NewsUI29AdContext)init
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  objc_super v7;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI29AdContext_qToken);
  *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI29AdContext_previewID);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI29AdContext_previewSessionID);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI29AdContext_maximumAdRequestsForCurrentAdPreviewID;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AdContext();
  return -[AdContext init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
