@implementation IDVTrailingAccessoryLabel

- (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel)initWithFrame:(CGRect)a3
{
  return (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel *)sub_213FCC300(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _TtC9CoreIDVUI25IDVTrailingAccessoryLabel *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_contentInsets);
  v5 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *v4 = *MEMORY[0x24BEBE158];
  v4[1] = v5;
  v6 = OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_registeredAccessories;
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_213F415E4(MEMORY[0x24BEE4AF8]);
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize);
  *v8 = 0;
  v8[1] = 0;

  result = (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel *)sub_213FF9878();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC9CoreIDVUI25IDVTrailingAccessoryLabel *v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_213FCC800(1, 0.0, 0.0, width, 1.79769313e308);

  v6 = width;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  CGFloat v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  -[IDVTrailingAccessoryLabel layoutSubviews](&v7, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
  sub_213FCC800(0, v3, v4, v5, v6);

}

- (void)registerAccessoryWithView:(id)a3 withSize:(CGSize)a4 for:(id)a5
{
  CGFloat height;
  CGFloat width;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9CoreIDVUI25IDVTrailingAccessoryLabel *v13;

  height = a4.height;
  width = a4.width;
  v9 = sub_213FF9458();
  v11 = v10;
  v12 = a3;
  v13 = self;
  sub_213FCC1A0(v12, v9, v11, width, height);

  swift_bridgeObjectRelease();
}

- (void)unregisterAccessories
{
  _TtC9CoreIDVUI25IDVTrailingAccessoryLabel *v2;

  v2 = self;
  sub_213FCCAE4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView));
  swift_bridgeObjectRelease();
}

@end
