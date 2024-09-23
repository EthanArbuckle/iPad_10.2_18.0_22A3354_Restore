@implementation SectionFooterView

- (_TtC12GameCenterUI17SectionFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17SectionFooterView *)sub_1AB74E5C0();
}

- (_TtC12GameCenterUI17SectionFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB74E900();
}

- (UIEdgeInsets)layoutMargins
{
  _TtC12GameCenterUI17SectionFooterView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = self;
  sub_1AB74EBFC();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  _TtC12GameCenterUI17SectionFooterView *v3;

  v3 = self;
  sub_1AB74EC90();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI17SectionFooterView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = sub_1AB74ED44((uint64_t)a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease();

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI17SectionFooterView *v2;

  v2 = self;
  sub_1AB74EFC8();

}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC12GameCenterUI17SectionFooterView *v5;

  v4 = a3;
  v5 = self;
  sub_1AB74F3A0(v4);

}

- (void)prepareForReuse
{
  _TtC12GameCenterUI17SectionFooterView *v2;

  v2 = self;
  sub_1AB74F4C0();

}

- (BOOL)accessibilityLabelHasAction
{
  _TtC12GameCenterUI17SectionFooterView *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1AB750EBC();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)accessibilityAttachmentHasAction
{
  _TtC12GameCenterUI17SectionFooterView *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1AB750F4C();
  v4 = v3;

  return v4 & 1;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityFooterLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB750FCC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_attachmentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_tapGestureRecognizer));
  sub_1AB471664((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_style);
  sub_1AB48E78C((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_attachment, &qword_1EEBFC0D8);
  OUTLINED_FUNCTION_37_30((uint64_t *)((char *)self + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_labelTapAction));
  OUTLINED_FUNCTION_37_30((uint64_t *)((char *)self
                                    + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_attachmentTapAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_separator));
}

@end
