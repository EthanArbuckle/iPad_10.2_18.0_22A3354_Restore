@implementation MediaView

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension9MediaView_contentContainer)+ OBJC_IVAR____TtC20ProductPageExtensionP33_FB55F4AFA9572A544272989A93E5CCC820UberContentContainer_contents), "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC20ProductPageExtension9MediaView *v6;

  v5 = a3;
  v6 = self;
  sub_1003A3728(a3);

}

- (_TtC20ProductPageExtension9MediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003A4C1C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension9MediaView *v2;

  v2 = self;
  sub_1003A3DC0();

}

- (_TtC20ProductPageExtension9MediaView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension9MediaView *result;

  result = (_TtC20ProductPageExtension9MediaView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.MediaView", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9MediaView_contentContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9MediaView_reflectionView));
}

@end
