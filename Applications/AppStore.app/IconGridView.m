@implementation IconGridView

- (_TtC8AppStore12IconGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005BFA34();
}

- (void)layoutSubviews
{
  _TtC8AppStore12IconGridView *v2;

  v2 = self;
  sub_1005BEF48();

}

- (_TtC8AppStore12IconGridView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore12IconGridView *result;

  result = (_TtC8AppStore12IconGridView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.IconGridView", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore12IconGridView_artworkViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore12IconGridView_viewPool;
  v4 = sub_10007B804(&qword_1008318F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore12IconGridView_impressionableArtworks));
  swift_release();
}

@end
