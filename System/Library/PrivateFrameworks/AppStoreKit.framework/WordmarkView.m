@implementation WordmarkView

- (_TtC11AppStoreKit12WordmarkView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  char *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)objc_allocWithZone((Class)swift_getObjectType());
  v8 = sub_1D8207F44(1, 0, v7, x, y, width, height, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC11AppStoreKit12WordmarkView *)v8;
}

- (_TtC11AppStoreKit12WordmarkView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11AppStoreKit12WordmarkView *result;

  v5 = OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC11AppStoreKit12WordmarkView *)sub_1D82159B8();
  __break(1u);
  return result;
}

- (BOOL)hasContent
{
  void *v2;
  _TtC11AppStoreKit12WordmarkView *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_imageView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_image);

  if (v4)
  return v4 != 0;
}

- (void)layoutSubviews
{
  _TtC11AppStoreKit12WordmarkView *v2;

  v2 = self;
  WordmarkView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC11AppStoreKit12WordmarkView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = WordmarkView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC11AppStoreKit12WordmarkView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = WordmarkView.intrinsicContentSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11AppStoreKit12WordmarkView_referenceLineHeight);
}

@end
