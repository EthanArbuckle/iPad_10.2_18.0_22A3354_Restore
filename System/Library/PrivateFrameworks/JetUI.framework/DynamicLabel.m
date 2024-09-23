@implementation DynamicLabel

- (_TtC5JetUI12DynamicLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC5JetUI12DynamicLabel *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC5JetUI12DynamicLabel_customTextStyle;
  v9 = (objc_class *)type metadata accessor for DynamicLabel();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[DynamicLabel initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  -[DynamicLabel setAdjustsFontForContentSizeCategory:](v10, sel_setAdjustsFontForContentSizeCategory_, 1);
  return v10;
}

- (_TtC5JetUI12DynamicLabel)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5JetUI12DynamicLabel *result;

  v4 = (char *)self + OBJC_IVAR____TtC5JetUI12DynamicLabel_customTextStyle;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC5JetUI12DynamicLabel *)sub_1AC726910();
  __break(1u);
  return result;
}

- (UIFont)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicLabel();
  return -[DynamicLabel font](&v3, sel_font);
}

- (void)setFont:(id)a3
{
  void (*v4)(_OWORD *);
  id v5;
  _TtC5JetUI12DynamicLabel *v6;
  objc_super v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v4 = *(void (**)(_OWORD *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  v5 = a3;
  v6 = self;
  v4(v8);
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for DynamicLabel();
  -[DynamicLabel setFont:](&v7, sel_setFont_, v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC5JetUI12DynamicLabel *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AC6BA2BC(a3);

}

- (void).cxx_destruct
{
  sub_1AC6B9CB4((uint64_t)self + OBJC_IVAR____TtC5JetUI12DynamicLabel_customTextStyle);
}

@end
