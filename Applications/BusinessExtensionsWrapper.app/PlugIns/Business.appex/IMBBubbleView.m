@implementation IMBBubbleView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel));
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business13IMBBubbleView_image));
}

- (void)setImage:(id)a3
{
  void *v4;
  _TtC8Business13IMBBubbleView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_image);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_image) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1000AA424();
}

- (_TtC8Business13IMBBubbleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000AAF1C();
}

- (void)layoutSubviews
{
  _TtC8Business13IMBBubbleView *v2;

  v2 = self;
  sub_1000AA700();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1000AA864(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_1000AB2AC);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1000AA864(self, (uint64_t)a2, (uint64_t)a3, a4, sub_1000AB38C);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  id v6;
  _TtC8Business13IMBBubbleView *v7;

  v5 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor);
  v6 = a4;
  v7 = self;
  -[IMBBubbleView setBackgroundColor:](v7, "setBackgroundColor:", v5);
  objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground), "setBackgroundColor:", v5);

}

- (_TtC8Business13IMBBubbleView)initWithFrame:(CGRect)a3
{
  _TtC8Business13IMBBubbleView *result;

  result = (_TtC8Business13IMBBubbleView *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBBubbleView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_labelWidthConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerFirstConstraintsIconSmall));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewFirstConstraintsIconSmall));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business13IMBBubbleView_largeLabelContainerConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint));

  swift_bridgeObjectRelease(*(_QWORD *)&self->touchDelay[OBJC_IVAR____TtC8Business13IMBBubbleView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->touchDelay[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitle]);

  sub_100010C40((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business13IMBBubbleView_urlHelper));
}

@end
