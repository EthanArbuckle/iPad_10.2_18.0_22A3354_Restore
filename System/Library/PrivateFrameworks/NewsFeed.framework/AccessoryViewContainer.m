@implementation AccessoryViewContainer

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  _QWORD *v8;
  _TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_identifier);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_accessoryView);
  *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_height) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AccessoryViewContainer();
  v9 = -[UIInputView initWithFrame:inputViewStyle:](&v11, sel_initWithFrame_inputViewStyle_, 0, x, y, width, height);
  -[AccessoryViewContainer setTranslatesAutoresizingMaskIntoConstraints:](v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v9;
}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_identifier);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_accessoryView);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_heightConstraint) = 0;
  v6 = a3;

  result = (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *v2;
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;
  CGRect v9;

  v2 = self;
  -[AccessoryViewContainer bounds](v2, sel_bounds);
  Width = CGRectGetWidth(v9);
  sub_1BB1B2C2C(Width);
  v4 = *MEMORY[0x1E0DC55F0];
  v5 = *(double *)((char *)&v2->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_height);

  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithFrame:(CGRect)a3 inputViewStyle:(int64_t)a4
{
  _TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *result;

  result = (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_heightConstraint));
}

@end
