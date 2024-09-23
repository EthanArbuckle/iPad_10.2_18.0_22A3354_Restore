@implementation Sidebar.Button

- (_TtCO17ContinuityDisplay7Sidebar6Button)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10003779C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (BOOL)isHighlighted
{
  _TtCO17ContinuityDisplay7Sidebar6Button *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100037A70((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtCO17ContinuityDisplay7Sidebar6Button *v4;

  v4 = self;
  sub_100037AF0(a3, (SEL *)&selRef_setHighlighted_);

}

- (BOOL)isSelected
{
  _TtCO17ContinuityDisplay7Sidebar6Button *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100037A70((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  _TtCO17ContinuityDisplay7Sidebar6Button *v4;

  v4 = self;
  sub_100037AF0(a3, (SEL *)&selRef_setSelected_);

}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  _TtCO17ContinuityDisplay7Sidebar6Button *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = self;
  sub_100037C3C();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (_TtCO17ContinuityDisplay7Sidebar6Button)initWithFrame:(CGRect)a3
{
  sub_100037CA4();
}

- (void).cxx_destruct
{
  sub_10001B978(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar6Button_identifier), *(_QWORD *)&self->identifier[OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar6Button_identifier], *(_QWORD *)&self->identifier[OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar6Button_identifier + 8], *(_QWORD *)&self->identifier[OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar6Button_identifier + 16], self->identifier[OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar6Button_identifier + 24]);
}

@end
