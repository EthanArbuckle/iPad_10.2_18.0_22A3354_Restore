@implementation Button

- (_TtC11AppStoreKit6Button)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v8;
  __int128 v9;
  _QWORD *v10;
  objc_class *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC11AppStoreKit6Button_imageAlignment) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC11AppStoreKit6Button_imageWantsBaselineAlignment) = 0;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin);
  v9 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v8 = *MEMORY[0x1E0DC49E8];
  v8[1] = v9;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler);
  v11 = (objc_class *)type metadata accessor for Button();
  *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[Button initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1D81D91C0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_1D81D923C);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1D81D91C0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (double (*)(double, double, double, double))sub_1D81D93F4);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void).cxx_destruct
{
  sub_1D81E2E70(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler));
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  _TtC11AppStoreKit6Button *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC11AppStoreKit6Button_touchOutsideMargin);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  v11 = v8[2];
  v12 = v8[3];
  v13 = a4;
  v14 = self;
  -[Button bounds](v14, sel_bounds);
  v21.origin.x = v15 - v10;
  v21.origin.y = v16 - v9;
  v21.size.width = v10 + v12 + v17;
  v21.size.height = v9 + v11 + v18;
  v20.x = x;
  v20.y = y;
  LOBYTE(v8) = CGRectContainsPoint(v21, v20);

  return (char)v8;
}

- (void)didTriggerPrimaryAction:(id)a3
{
  void (**v5)(uint64_t);
  void (*v6)(uint64_t);
  id v7;
  _TtC11AppStoreKit6Button *v8;
  uint64_t v9;

  v5 = (void (**)(uint64_t))((char *)self + OBJC_IVAR____TtC11AppStoreKit6Button_primaryActionHandler);
  swift_beginAccess();
  v6 = *v5;
  if (*v5)
  {
    v7 = a3;
    v8 = self;
    v9 = sub_1D81E3020((uint64_t)v6);
    v6(v9);
    sub_1D81E2E70((uint64_t)v6);

  }
}

- (_TtC11AppStoreKit6Button)initWithCoder:(id)a3
{
  return (_TtC11AppStoreKit6Button *)Button.init(coder:)(a3);
}

@end
