@implementation IconGridView

- (_TtC22SubscribePageExtension12IconGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005F14C8();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension12IconGridView *v2;

  v2 = self;
  sub_1005F09DC();

}

- (_TtC22SubscribePageExtension12IconGridView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension12IconGridView *result;

  result = (_TtC22SubscribePageExtension12IconGridView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.IconGridView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_artworkViews));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_viewPool;
  v4 = sub_10000DF3C(&qword_1007FC668);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_impressionableArtworks));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_artworkLoader));
}

@end
