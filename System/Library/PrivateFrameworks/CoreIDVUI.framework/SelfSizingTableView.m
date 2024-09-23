@implementation SelfSizingTableView

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SelfSizingTableView();
  -[SelfSizingTableView contentSize](&v4, sel_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelfSizingTableView();
  v5 = v6.receiver;
  -[SelfSizingTableView setContentSize:](&v6, sel_setContentSize_, width, height);
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setNeedsLayout);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  _TtC9CoreIDVUI19SelfSizingTableView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC9CoreIDVUI19SelfSizingTableView_maxHeight);
  v3 = self;
  -[SelfSizingTableView contentSize](v3, sel_contentSize);
  if (v4 < v2)
    v2 = v4;
  -[SelfSizingTableView contentSize](v3, sel_contentSize);
  v6 = v5;

  v7 = v6;
  v8 = v2;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC9CoreIDVUI19SelfSizingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9CoreIDVUI19SelfSizingTableView_maxHeight) = (Class)0x7FF0000000000000;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SelfSizingTableView();
  return -[SelfSizingTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC9CoreIDVUI19SelfSizingTableView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9CoreIDVUI19SelfSizingTableView_maxHeight) = (Class)0x7FF0000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfSizingTableView();
  return -[SelfSizingTableView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
