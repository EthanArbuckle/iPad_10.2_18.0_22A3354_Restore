@implementation DebugFormatRulerView

- (_TtC8NewsFeed20DebugFormatRulerView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed20DebugFormatRulerView *)sub_1BACC7CA0();
}

- (_TtC8NewsFeed20DebugFormatRulerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BACC803C();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed20DebugFormatRulerView *v2;

  v2 = self;
  sub_1BACC7764();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char *v8;
  BOOL v9;
  objc_super v11;
  CGPoint v12;
  CGPoint v13;
  CGRect v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v7 = a4;
  v8 = (char *)v11.receiver;
  if (-[DebugFormatRulerView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_horizontalRulerEdgeView], sel_frame, v11.receiver, v11.super_class);
    v12.x = x;
    v12.y = y;
    if (CGRectContainsPoint(v14, v12))
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_verticalRulerEdgeView], sel_frame);
      v13.x = x;
      v13.y = y;
      v9 = CGRectContainsPoint(v15, v13);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v9.receiver;
  -[DebugFormatRulerView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_borderLayer];
  v7 = objc_msgSend((id)objc_opt_self(), sel_labelColor, v9.receiver, v9.super_class);
  v8 = objc_msgSend(v7, sel_CGColor);

  objc_msgSend(v6, sel_setStrokeColor_, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_verticalRulerEdgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_horizontalRulerEdgeView));

}

@end
