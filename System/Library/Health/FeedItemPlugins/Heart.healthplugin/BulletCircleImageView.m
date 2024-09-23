@implementation BulletCircleImageView

- (_TtC5Heart21BulletCircleImageView)initWithCoder:(id)a3
{
  id v4;
  _TtC5Heart21BulletCircleImageView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart21BulletCircleImageView____lazy_storage___iconView) = 0;
  v4 = a3;

  result = (_TtC5Heart21BulletCircleImageView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  _TtC5Heart21BulletCircleImageView *v3;
  CGContext *v4;
  CGColor *v5;
  void *v6;
  CGContext *c;
  CGRect v8;
  CGRect v9;

  v3 = self;
  v4 = UIGraphicsGetCurrentContext();
  if (v4)
  {
    c = v4;
    CGContextSetLineWidth(v4, 2.0);
    if (qword_255ECA9E8 != -1)
      swift_once();
    v5 = (CGColor *)objc_msgSend((id)qword_255ECD5B8, sel_CGColor);
    CGContextSetStrokeColorWithColor(c, v5);

    -[BulletCircleImageView bounds](v3, sel_bounds);
    v9 = CGRectInset(v8, 1.0, 1.0);
    CGContextAddEllipseInRect(c, v9);
    CGContextStrokePath(c);

    v6 = c;
  }
  else
  {
    v6 = v3;
  }

}

- (_TtC5Heart21BulletCircleImageView)initWithFrame:(CGRect)a3
{
  sub_231334824();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC5Heart21BulletCircleImageView_item);
  v4 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC5Heart21BulletCircleImageView_item);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC5Heart21BulletCircleImageView_item));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart21BulletCircleImageView____lazy_storage___iconView));
}

@end
