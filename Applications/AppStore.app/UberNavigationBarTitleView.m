@implementation UberNavigationBarTitleView

- (_TtC8AppStore26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26UberNavigationBarTitleView *)sub_100072640(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004A12BC();
}

- (void)layoutSubviews
{
  _TtC8AppStore26UberNavigationBarTitleView *v2;

  v2 = self;
  sub_1004A0F8C();

}

- (void)didTapNonStandardDismissButton
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8AppStore26UberNavigationBarTitleView *v5;

  v2 = *(void (**)(uint64_t))&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissHandler];
  if (v2)
  {
    v3 = *(_QWORD *)&self->backButtonStyle[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissHandler];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

- (_TtC8AppStore18RoundChevronButton)accessibilityNonStandardDismissButton
{
  return (_TtC8AppStore18RoundChevronButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissButton];
}

- (void).cxx_destruct
{

  sub_10003A350(*(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissHandler], *(_QWORD *)&self->backButtonStyle[OBJC_IVAR____TtC8AppStore26UberNavigationBarTitleView_nonStandardDismissHandler]);
}

@end
