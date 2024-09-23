@implementation MFSlider

- (_TtC16MagnifierSupport8MFSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22738EABC();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC16MagnifierSupport8MFSlider *v8;
  BOOL v9;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[MFSlider bounds](v8, sel_bounds);
  v13 = CGRectInset(v12, *(CGFloat *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport8MFSlider_extraTouchInset), *(CGFloat *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport8MFSlider_extraTouchInset));
  v11.x = x;
  v11.y = y;
  v9 = CGRectContainsPoint(v13, v11);

  return v9;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC16MagnifierSupport8MFSlider *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = self;
  -[MFSlider alignmentRectInsets](v8, sel_alignmentRectInsets);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  UIRoundToViewScale();
  v28.receiver = v8;
  v28.super_class = ObjectType;
  -[MFSlider trackRectForBounds:](&v28, sel_trackRectForBounds_, x, y, width, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v12 + v17;
  v25 = v21 - (v12 + v14);
  v26 = v10 + v19;
  v27 = v23 * 0.5;
  result.size.height = v27;
  result.size.width = v25;
  result.origin.y = v26;
  result.origin.x = v24;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport8MFSlider *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22738EC0C(v6);
  v10 = v9;

  return v10 & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  _TtC16MagnifierSupport8MFSlider *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_22738E6AC((uint64_t)a3, (uint64_t)a4);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  char *v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  v5 = a3;
  -[MFSlider cancelTrackingWithEvent:](&v8, sel_cancelTrackingWithEvent_, v5);
  v6 = objc_msgSend(v4, sel__edgeFeedbackGenerator, v8.receiver, v8.super_class);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_userInteractionCancelled);

    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC16MagnifierSupport8MFSlider_tickFeedbackGenerator], sel_userInteractionCancelled);
  }
  else
  {
    __break(1u);
  }
}

- (void)drawRect:(CGRect)a3
{
  _TtC16MagnifierSupport8MFSlider *v3;

  v3 = self;
  sub_22738EDF0();

}

- (_TtC16MagnifierSupport8MFSlider)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport8MFSlider *result;

  result = (_TtC16MagnifierSupport8MFSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport8MFSlider_trackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport8MFSlider_tickFeedbackGenerator));
}

@end
