@implementation IconGridView

- (_TtC20ProductPageExtension12IconGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10034040C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension12IconGridView *v2;

  v2 = self;
  sub_10033F920();

}

- (_TtC20ProductPageExtension12IconGridView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension12IconGridView *result;

  result = (_TtC20ProductPageExtension12IconGridView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.IconGridView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension12IconGridView_artworkViews));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension12IconGridView_viewPool;
  v4 = sub_10000DAF8((uint64_t *)&unk_100811760);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension12IconGridView_impressionableArtworks));
  swift_release();
}

@end
