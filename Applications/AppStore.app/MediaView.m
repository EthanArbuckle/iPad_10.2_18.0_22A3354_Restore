@implementation MediaView

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore9MediaView_contentContainer)+ OBJC_IVAR____TtC8AppStoreP33_ECECB79BEF5D802E6E21EF3AE112F28D20UberContentContainer_contents), "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC8AppStore9MediaView *v6;

  v5 = a3;
  v6 = self;
  sub_1003C54FC(a3, (uint64_t)v6);

}

- (_TtC8AppStore9MediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003C69F8();
}

- (void)layoutSubviews
{
  _TtC8AppStore9MediaView *v2;

  v2 = self;
  sub_1003C5C20();

}

- (_TtC8AppStore9MediaView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore9MediaView *result;

  result = (_TtC8AppStore9MediaView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.MediaView", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
