@implementation AccountActionSectionFooterView

- (_TtC20ProductPageExtension30AccountActionSectionFooterView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension30AccountActionSectionFooterView *result;

  sub_1005D134C();
  return result;
}

- (_TtC20ProductPageExtension30AccountActionSectionFooterView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC20ProductPageExtension30AccountActionSectionFooterView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_tapGestureRecognizer) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_isCentered) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_text);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_buttonAction);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC20ProductPageExtension30AccountActionSectionFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/AccountActionSectionFooterView.swift", 57, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension30AccountActionSectionFooterView *v2;

  v2 = self;
  sub_1005D0AF0();

}

- (void)buttonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension30AccountActionSectionFooterView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_buttonAction);
  if (v2)
  {
    v3 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_buttonAction];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (void)tintColorDidChange
{
  _TtC20ProductPageExtension30AccountActionSectionFooterView *v2;

  v2 = self;
  sub_1005D0F0C();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension30AccountActionSectionFooterView *v2;

  v2 = self;
  sub_1005D1160();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  uint64_t v5;
  uint64_t v6;
  _TtC20ProductPageExtension30AccountActionSectionFooterView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_text);
  v6 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_text];
  swift_bridgeObjectRetain(v6);
  v7 = self;
  -[AccountActionSectionFooterView layoutMargins](v7, "layoutMargins");
  v12 = sub_1005D15E4(v5, v6, (uint64_t)v7, width, v8, v9, v10, v11);
  v14 = v13;

  swift_bridgeObjectRelease(v6);
  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_titleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_tapGestureRecognizer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_text]);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_buttonAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension30AccountActionSectionFooterView_buttonAction]);
}

@end
