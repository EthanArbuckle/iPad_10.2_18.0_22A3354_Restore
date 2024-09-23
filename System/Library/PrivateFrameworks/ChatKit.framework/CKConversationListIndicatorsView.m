@implementation CKConversationListIndicatorsView

- (int64_t)orientation
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_orientation);
  swift_beginAccess();
  return *v2;
}

- (void)setOrientation:(int64_t)a3
{
  int64_t *v5;
  int64_t v6;
  _TtC7ChatKit32CKConversationListIndicatorsView *v7;

  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_orientation);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  if (v6 != a3)
  {
    v7 = self;
    -[CKConversationListIndicatorsView setNeedsLayout](v7, sel_setNeedsLayout);
    -[CKConversationListIndicatorsView layoutIfNeeded](v7, sel_layoutIfNeeded);

  }
}

- (_TtC7ChatKit32CKConversationListIndicatorsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v7;
  _TtC7ChatKit32CKConversationListIndicatorsView *v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicators) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_orientation) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorImageViews) = v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CKConversationListIndicatorsView();
  v8 = -[CKConversationListIndicatorsView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = -[CKConversationListIndicatorsView layer](v8, sel_layer);
  objc_msgSend(v9, sel_setMasksToBounds_, 0);

  sub_18E6C4810();
  return v8;
}

- (_TtC7ChatKit32CKConversationListIndicatorsView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit32CKConversationListIndicatorsView *)sub_18E6C4308(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CKConversationListIndicatorsView sizeThatFits:](self, sel_sizeThatFits_, 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC7ChatKit32CKConversationListIndicatorsView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_18E6C59C0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)xOriginForCenteringWithTrailingSlot
{
  _QWORD *v3;
  uint64_t v4;
  _TtC7ChatKit32CKConversationListIndicatorsView *v5;
  double v6;
  _TtC7ChatKit32CKConversationListIndicatorsView *v8;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorImageViews);
  swift_beginAccess();
  if (*v3 >> 62)
  {
    v8 = self;
    sub_18E7669BC();
    v4 = sub_18E769338();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v5 = self;
  }
  if (qword_1EE107568 != -1)
    swift_once();
  v6 = *(double *)&xmmword_1EE1102A0;

  return ((double)v4 + -0.5) * v6;
}

- (double)verticalOffsetForCenteringVisibleIndicators
{
  _TtC7ChatKit32CKConversationListIndicatorsView *v2;
  double v3;
  double v4;

  v2 = self;
  sub_18E6C4618();
  v4 = v3;

  return v4;
}

- (double)widthForVisibleIndicators
{
  uint64_t v2;
  uint64_t v3;
  _TtC7ChatKit32CKConversationListIndicatorsView *v4;
  double v5;

  v2 = (*(_QWORD **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicators))[2];
  v3 = qword_1EE107568;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = *(double *)&xmmword_1EE1102A0;

  return v5 * (double)v2;
}

- (void)layoutSubviews
{
  _TtC7ChatKit32CKConversationListIndicatorsView *v2;

  v2 = self;
  sub_18E6C54C4();

}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKConversationListIndicatorsView();
  return -[CKConversationListIndicatorsView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  _TtC7ChatKit32CKConversationListIndicatorsView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18E6C5BA0((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
