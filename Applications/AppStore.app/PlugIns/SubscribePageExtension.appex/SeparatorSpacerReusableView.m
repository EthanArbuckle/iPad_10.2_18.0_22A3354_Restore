@implementation SeparatorSpacerReusableView

- (_TtC22SubscribePageExtension27SeparatorSpacerReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension27SeparatorSpacerReusableView *)sub_1001EAF18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC22SubscribePageExtension27SeparatorSpacerReusableView)initWithCoder:(id)a3
{
  _OWORD *v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  id v9;
  _TtC22SubscribePageExtension27SeparatorSpacerReusableView *result;

  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension27SeparatorSpacerReusableView_separatorInsets);
  v6 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *v5 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v5[1] = v6;
  v7 = OBJC_IVAR____TtC22SubscribePageExtension27SeparatorSpacerReusableView_lineView;
  v8 = objc_allocWithZone((Class)UIView);
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC22SubscribePageExtension27SeparatorSpacerReusableView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/SeparatorSpacerReusableView.swift", 56, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC22SubscribePageExtension27SeparatorSpacerReusableView *v3;

  v3 = self;
  sub_1001EB1AC((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27SeparatorSpacerReusableView_lineView));
}

@end
