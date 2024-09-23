@implementation UberNavigationBarTitleView

- (_TtC20ProductPageExtension26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26UberNavigationBarTitleView *)sub_10017886C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100179468();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension26UberNavigationBarTitleView *v2;

  v2 = self;
  sub_100179058();

}

- (void)didTapNonStandardDismissButton
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension26UberNavigationBarTitleView *v5;

  v2 = *(void (**)(uint64_t))&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];
  if (v2)
  {
    v3 = *(_QWORD *)&self->backButtonStyle[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (_TtC20ProductPageExtension18RoundChevronButton)accessibilityNonStandardDismissButton
{
  return (_TtC20ProductPageExtension18RoundChevronButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissButton];
}

- (void).cxx_destruct
{

  sub_100018908(*(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissHandler], *(_QWORD *)&self->backButtonStyle[OBJC_IVAR____TtC20ProductPageExtension26UberNavigationBarTitleView_nonStandardDismissHandler]);
}

@end
