@implementation CoverViewActionButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoverViewActionButton();
  return -[CoverViewActionButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC8NewsFeed21CoverViewActionButton *v4;

  v4 = self;
  sub_1BB4D70FC(a3);

}

- (_TtC8NewsFeed21CoverViewActionButton)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed21CoverViewActionButton *)sub_1BB4D724C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed21CoverViewActionButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s8NewsFeed21CoverViewActionButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC8NewsFeed21CoverViewActionButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[CoverViewActionButton bounds](v8, sel_bounds);
  v16.origin.x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, *(double *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_touchInsets), *(double *)((char *)&v8->super.super.super.super._responderFlags+ OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_touchInsets));
  v15.x = x;
  v15.y = y;
  v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_onTap));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_onMenuPresentation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_tintColorForNormalState));
}

@end
