@implementation CHUISControlIconView

- (UIFont)font
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHUISControlIconView_font);
  swift_beginAccess();
  return (UIFont *)*v2;
}

- (void)setFont:(id)a3
{
  CHUISControlIconView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1B7149F68(a3);

}

- (unint64_t)style
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  CHUISControlIconView *v7;
  unint64_t v8;
  _BYTE v11[32];

  v3 = type metadata accessor for ControlIconView(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (char *)self + OBJC_IVAR___CHUISControlIconView__controlIconView;
  swift_beginAccess();
  sub_1B714A118((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  v8 = *(_QWORD *)&v5[*(int *)(v3 + 20)];
  sub_1B713C3D8((uint64_t)v5, type metadata accessor for ControlIconView);

  return v8;
}

- (void)setStyle:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  CHUISControlIconView *v9;
  _BYTE v11[32];

  v5 = type metadata accessor for ControlIconView(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v8 = (char *)self + OBJC_IVAR___CHUISControlIconView__controlIconView;
  swift_beginAccess();
  sub_1B714A118((uint64_t)v8, (uint64_t)v11);
  v9 = self;
  swift_dynamicCast();
  *(_QWORD *)&v7[*(int *)(v5 + 20)] = a3;
  sub_1B7149594((uint64_t)v7);

}

- (CHUISControlIconView)initWithFrame:(CGRect)a3
{
  return (CHUISControlIconView *)CHUISControlIconView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CHUISControlIconView)initWithCoder:(id)a3
{
  id v4;
  CHUISControlIconView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHUISControlIconView_font) = 0;
  v4 = a3;

  result = (CHUISControlIconView *)sub_1B7196A64();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  CHUISControlIconView *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHUISControlIconView;
  v2 = self;
  -[CHUISControlIconView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(id *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CHUISControlIconView__hostingView);
  -[CHUISControlIconView bounds](v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHUISControlIconView__hostingView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___CHUISControlIconView__controlIconView);
}

@end
