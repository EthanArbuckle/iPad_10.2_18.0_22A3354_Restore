@implementation NoCellNecessary

- (_TtC5HeartP33_38C201FDECF4757A10F3783D1B8C5FB515NoCellNecessary)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC5HeartP33_38C201FDECF4757A10F3783D1B8C5FB515NoCellNecessary_item;
  v9 = (objc_class *)type metadata accessor for NoCellNecessary();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[NoCellNecessary initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5HeartP33_38C201FDECF4757A10F3783D1B8C5FB515NoCellNecessary)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC5HeartP33_38C201FDECF4757A10F3783D1B8C5FB515NoCellNecessary_item;
  v6 = (objc_class *)type metadata accessor for NoCellNecessary();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[NoCellNecessary initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_2312D1D70((uint64_t)self + OBJC_IVAR____TtC5HeartP33_38C201FDECF4757A10F3783D1B8C5FB515NoCellNecessary_item);
}

@end
