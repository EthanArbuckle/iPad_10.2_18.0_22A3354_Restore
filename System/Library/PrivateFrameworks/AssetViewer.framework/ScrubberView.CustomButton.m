@implementation ScrubberView.CustomButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScrubberView.CustomButton();
  return -[ScrubberView.CustomButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtCC11AssetViewer12ScrubberView12CustomButton *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for ScrubberView.CustomButton();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[ScrubberView.CustomButton isHighlighted](&v9, sel_isHighlighted);
  v8.receiver = v6;
  v8.super_class = v5;
  -[ScrubberView.CustomButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  sub_1D940FC08(v7);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtCC11AssetViewer12ScrubberView12CustomButton *v8;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  sub_1D940FEB0();
  v10.x = x;
  v10.y = y;
  LOBYTE(self) = CGRectContainsPoint(v11, v10);

  return (char)self;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtCC11AssetViewer12ScrubberView12CustomButton *v8;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  sub_1D940FEB0();
  v10.x = x;
  v10.y = y;
  LOBYTE(self) = CGRectContainsPoint(v11, v10);

  if ((self & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

- (_TtCC11AssetViewer12ScrubberView12CustomButton)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC11AssetViewer12ScrubberView12CustomButton_highlightAnimator) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ScrubberView.CustomButton();
  return -[ScrubberView.CustomButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC11AssetViewer12ScrubberView12CustomButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC11AssetViewer12ScrubberView12CustomButton_highlightAnimator) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ScrubberView.CustomButton();
  return -[ScrubberView.CustomButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC11AssetViewer12ScrubberView12CustomButton_highlightAnimator));
}

@end
