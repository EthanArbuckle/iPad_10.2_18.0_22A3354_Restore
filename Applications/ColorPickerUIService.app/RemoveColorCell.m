@implementation RemoveColorCell

- (_TtC20ColorPickerUIService15RemoveColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ColorPickerUIService15RemoveColorCell *)sub_100030450(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ColorPickerUIService15RemoveColorCell)initWithCoder:(id)a3
{
  return (_TtC20ColorPickerUIService15RemoveColorCell *)sub_100030574(a3);
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoveColorCell();
  return -[RemoveColorCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoveColorCell();
  v4 = v5.receiver;
  -[RemoveColorCell setSelected:](&v5, "setSelected:", v3);
  objc_msgSend(v4, "setNeedsLayout", v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  _TtC20ColorPickerUIService15RemoveColorCell *v2;

  v2 = self;
  sub_100030AFC();

}

- (unint64_t)accessibilityTraits
{
  _TtC20ColorPickerUIService15RemoveColorCell *v2;
  UIAccessibilityTraits v3;

  v2 = self;
  v3 = sub_100030E80();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_colorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_maskShapeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService15RemoveColorCell_barView));
}

@end
