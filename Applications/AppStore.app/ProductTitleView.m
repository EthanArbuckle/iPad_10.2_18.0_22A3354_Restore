@implementation ProductTitleView

- (_TtC8AppStore16ProductTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16ProductTitleView *)sub_10024EB74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC8AppStore16ProductTitleView *v2;

  v2 = self;
  sub_10024EDE8();

}

- (void)didTapIcon:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore16ProductTitleView *v8;

  v3 = *(void (**)(uint64_t))&self->super._UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore16ProductTitleView_iconTapHandler];
  if (v3)
  {
    v5 = *(_QWORD *)&self->super.backButtonStyle[OBJC_IVAR____TtC8AppStore16ProductTitleView_iconTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void)contentDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProductTitleView();
  v2 = v3.receiver;
  -[ProductTitleView contentDidChange](&v3, "contentDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void).cxx_destruct
{

  sub_10003A350(*(_QWORD *)&self->super._UINavigationBarTitleView_opaque[OBJC_IVAR____TtC8AppStore16ProductTitleView_iconTapHandler], *(_QWORD *)&self->super.backButtonStyle[OBJC_IVAR____TtC8AppStore16ProductTitleView_iconTapHandler]);
}

@end
