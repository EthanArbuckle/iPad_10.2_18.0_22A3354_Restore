@implementation CustomLayoutView

- (_TtC5JetUI16CustomLayoutView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CustomLayoutView();
  return -[CustomLayoutView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  _TtC5JetUI16CustomLayoutView *v2;

  v2 = self;
  CustomLayoutView.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  _TtC5JetUI16CustomLayoutView *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  v2 = self;
  v3 = -[CustomLayoutView traitCollection](v2, sel_traitCollection);
  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v2->super.super.super.super.isa) + 0x50))(v11);
  v4 = v12;
  v5 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v6 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v5 + 8))(v3, v4, v5, 0.0, 0.0);
  v8 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC5JetUI16CustomLayoutView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[CustomLayoutView traitCollection](v5, sel_traitCollection);
  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v5->super.super.super.super.isa) + 0x50))(v14);
  v7 = v15;
  v8 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v9 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v8 + 8))(v6, v7, v8, width, height);
  v11 = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC5JetUI16CustomLayoutView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CustomLayoutView();
  return -[CustomLayoutView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
