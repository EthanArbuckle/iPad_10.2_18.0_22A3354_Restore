@implementation DottedLineLabel

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TtC16MagnifierSupport15DottedLineLabel *v11;
  objc_super v12;

  v4 = UIEdgeInsetsInsetRect_0(a3.origin.x);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DottedLineLabel();
  v11 = self;
  -[DottedLineLabel drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);

}

- (_TtC16MagnifierSupport15DottedLineLabel)initWithFrame:(CGRect)a3
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DottedLineLabel();
  return -[DottedLineLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport15DottedLineLabel)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport15DottedLineLabel *)sub_2274CAAF8(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for DottedLineLabel);
}

@end
