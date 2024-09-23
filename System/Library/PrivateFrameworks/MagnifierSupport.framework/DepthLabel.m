@implementation DepthLabel

- (NSAttributedString)attributedText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[DepthLabel attributedText](&v3, sel_attributedText);
}

- (void)setAttributedText:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC16MagnifierSupport10DepthLabel *v7;
  NSAttributedString *v8;
  objc_super v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = a3;
  v7 = self;
  v8 = -[DepthLabel attributedText](&v10, sel_attributedText);
  v9.receiver = v7;
  v9.super_class = ObjectType;
  -[DepthLabel setAttributedText:](&v9, sel_setAttributedText_, v6);
  sub_22754DE24(v8);

}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _TtC16MagnifierSupport10DepthLabel *v16;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = UIEdgeInsetsInsetRect(x, y, width, height, *(double *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport10DepthLabel__topInset), 0.0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17.receiver = self;
  v17.super_class = ObjectType;
  v16 = self;
  -[DepthLabel drawTextInRect:](&v17, sel_drawTextInRect_, v9, v11, v13, v15);

}

- (void)rotateIfPossibleTo:(int64_t)a3
{
  _TtC16MagnifierSupport10DepthLabel *v4;

  v4 = self;
  sub_22754E738(a3);

}

- (_TtC16MagnifierSupport10DepthLabel)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport10DepthLabel *)sub_22754E834(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport10DepthLabel)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport10DepthLabel *)sub_22754EAAC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10DepthLabel_kDigitFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10DepthLabel_kUnitFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10DepthLabel_kSpaceFont));
}

@end
