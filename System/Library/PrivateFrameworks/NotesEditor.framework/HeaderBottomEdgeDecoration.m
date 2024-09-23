@implementation HeaderBottomEdgeDecoration

- (_TtC11NotesEditor26HeaderBottomEdgeDecoration)initWithFrame:(CGRect)a3
{
  return (_TtC11NotesEditor26HeaderBottomEdgeDecoration *)sub_1DD8F2880(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11NotesEditor26HeaderBottomEdgeDecoration)initWithCoder:(id)a3
{
  return (_TtC11NotesEditor26HeaderBottomEdgeDecoration *)sub_1DD8F2A48(a3);
}

- (void)layoutSubviews
{
  _TtC11NotesEditor26HeaderBottomEdgeDecoration *v2;

  v2 = self;
  sub_1DD8F2C04();

}

- (CGSize)intrinsicContentSize
{
  _TtC11NotesEditor26HeaderBottomEdgeDecoration *v2;
  id v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[HeaderBottomEdgeDecoration window](v2, sel_window);
  v4 = 1.0;
  if (v3)
  {
    v5 = v3;
    v6 = objc_msgSend(v3, sel_screen);

    objc_msgSend(v6, sel_scale);
    v4 = v7;

  }
  v8 = *MEMORY[0x1E0DC55F0];

  v9 = 1.0 / v4;
  v10 = v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)updateLayers
{
  _TtC11NotesEditor26HeaderBottomEdgeDecoration *v2;

  v2 = self;
  sub_1DD8F2E68();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor26HeaderBottomEdgeDecoration_gradientLayer));
}

@end
