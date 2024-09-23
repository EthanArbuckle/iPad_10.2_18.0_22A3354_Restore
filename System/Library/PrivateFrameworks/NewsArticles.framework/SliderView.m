@implementation SliderView

- (int64_t)semanticContentAttribute
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SliderView semanticContentAttribute](&v3, sel_semanticContentAttribute);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_class *ObjectType;
  _TtC12NewsArticles10SliderView *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  -[SliderView setSemanticContentAttribute:](&v9, sel_setSemanticContentAttribute_, a3);
  v7 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles10SliderView_stackView);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  objc_msgSend(v7, sel_setSemanticContentAttribute_, -[SliderView semanticContentAttribute](&v8, sel_semanticContentAttribute));

}

- (_TtC12NewsArticles10SliderView)initWithFrame:(CGRect)a3
{
  return (_TtC12NewsArticles10SliderView *)sub_1BA0B5C14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NewsArticles10SliderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA0B71B4();
}

- (void)layoutSubviews
{
  _TtC12NewsArticles10SliderView *v2;

  v2 = self;
  sub_1BA0B6500();

}

- (NSString)accessibilityValue
{
  void *v2;

  sub_1BA0BEBC4();
  v2 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  _TtC12NewsArticles10SliderView *v3;
  CGFloat MaxX;
  CGFloat MidY;
  double v6;
  double v7;
  CGPoint result;
  CGRect v9;
  CGRect v10;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrack);
  v3 = self;
  objc_msgSend(v2, sel_accessibilityFrame);
  MaxX = CGRectGetMaxX(v9);
  -[SliderView accessibilityFrame](v3, sel_accessibilityFrame);
  MidY = CGRectGetMidY(v10);

  v6 = MaxX;
  v7 = MidY;
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)accessibilityIncrement
{
  _TtC12NewsArticles10SliderView *v2;

  v2 = self;
  sub_1BA0B66D0();

}

- (void)accessibilityDecrement
{
  _TtC12NewsArticles10SliderView *v2;

  v2 = self;
  sub_1BA0B67C8();

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  _TtC12NewsArticles10SliderView *v5;

  v4 = a3;
  v5 = self;
  sub_1BA0B68CC(v4);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView____lazy_storage___elapsedTrackWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView____lazy_storage___trackHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView____lazy_storage___panRecognizer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles10SliderView_remainingTrackColor));

  sub_1B9E47D78(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12NewsArticles10SliderView_valueChangedHandler));
}

@end
