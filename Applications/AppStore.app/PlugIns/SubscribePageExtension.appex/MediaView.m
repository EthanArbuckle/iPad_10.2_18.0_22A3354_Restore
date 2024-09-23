@implementation MediaView

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension9MediaView_contentContainer)+ OBJC_IVAR____TtC22SubscribePageExtensionP33_3BFA609B93F5C4376389C1E6266A901920UberContentContainer_contents), "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension9MediaView *v6;

  v5 = a3;
  v6 = self;
  sub_100499030(a3);

}

- (_TtC22SubscribePageExtension9MediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10049A4A0();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension9MediaView *v2;

  v2 = self;
  sub_1004996C8();

}

- (_TtC22SubscribePageExtension9MediaView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension9MediaView *result;

  result = (_TtC22SubscribePageExtension9MediaView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.MediaView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9MediaView_contentContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9MediaView_reflectionView));
}

@end
