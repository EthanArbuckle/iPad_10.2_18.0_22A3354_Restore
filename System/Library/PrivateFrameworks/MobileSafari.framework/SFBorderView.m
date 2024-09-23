@implementation SFBorderView

- (UIColor)borderColor
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setBorderColor:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  SFBorderView *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_18B9882F8();
}

- (SFBorderView)initWithFrame:(CGRect)a3
{
  SFBorderView *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)SFBorderView;
  v3 = -[SFBorderView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  sub_18B9884B4();

  return v3;
}

- (SFBorderView)initWithCoder:(id)a3
{
  id v3;
  SFBorderView *v4;
  SFBorderView *v5;
  SFBorderView *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor) = 0;
  v8.receiver = self;
  v8.super_class = (Class)SFBorderView;
  v3 = a3;
  v4 = -[SFBorderView initWithCoder:](&v8, sel_initWithCoder_, v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    sub_18B9884B4();

  }
  return v5;
}

- (void).cxx_destruct
{

}

@end
