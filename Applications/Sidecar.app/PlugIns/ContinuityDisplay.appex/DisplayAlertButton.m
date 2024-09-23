@implementation DisplayAlertButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC17ContinuityDisplay18DisplayAlertButton *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_10002065C((uint64_t)v8, x, y);

  return v9;
}

- (BOOL)isHighlighted
{
  _TtC17ContinuityDisplay18DisplayAlertButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100020934((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC17ContinuityDisplay18DisplayAlertButton *v4;

  v4 = self;
  sub_1000209B4(a3, (SEL *)&selRef_setHighlighted_);

}

- (BOOL)isSelected
{
  _TtC17ContinuityDisplay18DisplayAlertButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100020934((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  _TtC17ContinuityDisplay18DisplayAlertButton *v4;

  v4 = self;
  sub_1000209B4(a3, (SEL *)&selRef_setSelected_);

}

- (_TtC17ContinuityDisplay18DisplayAlertButton)initWithFrame:(CGRect)a3
{
  return (_TtC17ContinuityDisplay18DisplayAlertButton *)sub_100020B54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17ContinuityDisplay18DisplayAlertButton)initWithCoder:(id)a3
{
  return (_TtC17ContinuityDisplay18DisplayAlertButton *)sub_100020BD4(a3);
}

@end
