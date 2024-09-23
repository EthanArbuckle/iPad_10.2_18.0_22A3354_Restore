@implementation ProductTitleView

- (_TtC20ProductPageExtension16ProductTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16ProductTitleView *)sub_1004D61A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension16ProductTitleView *v2;

  v2 = self;
  sub_1004D6418();

}

- (void)didTapIcon:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC20ProductPageExtension16ProductTitleView *v8;

  v3 = *(void (**)(uint64_t))&self->super._UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension16ProductTitleView_iconTapHandler];
  if (v3)
  {
    v5 = *(_QWORD *)&self->super.backButtonStyle[OBJC_IVAR____TtC20ProductPageExtension16ProductTitleView_iconTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

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

  sub_100018908(*(_QWORD *)&self->super._UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension16ProductTitleView_iconTapHandler], *(_QWORD *)&self->super.backButtonStyle[OBJC_IVAR____TtC20ProductPageExtension16ProductTitleView_iconTapHandler]);
}

@end
