@implementation UberNavigationBarTitleView

- (_TtC22SubscribePageExtension26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26UberNavigationBarTitleView *)sub_1002D91B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002D9DB0();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension26UberNavigationBarTitleView *v2;

  v2 = self;
  sub_1002D99A0();

}

- (void)didTapNonStandardDismissButton
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC22SubscribePageExtension26UberNavigationBarTitleView *v5;

  v2 = *(void (**)(uint64_t))&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];
  if (v2)
  {
    v3 = *(_QWORD *)&self->backButtonStyle[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissHandler];
    v5 = self;
    v4 = sub_100019320((uint64_t)v2, v3);
    v2(v4);
    sub_100019310((uint64_t)v2, v3);

  }
}

- (_TtC22SubscribePageExtension18RoundChevronButton)accessibilityNonStandardDismissButton
{
  return (_TtC22SubscribePageExtension18RoundChevronButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissButton];
}

- (void).cxx_destruct
{

  sub_100019310(*(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissHandler], *(_QWORD *)&self->backButtonStyle[OBJC_IVAR____TtC22SubscribePageExtension26UberNavigationBarTitleView_nonStandardDismissHandler]);
}

@end
