@implementation AddColorCell

- (_TtC20ColorPickerUIService12AddColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ColorPickerUIService12AddColorCell *)sub_100016B2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ColorPickerUIService12AddColorCell)initWithCoder:(id)a3
{
  return (_TtC20ColorPickerUIService12AddColorCell *)sub_100016C34(a3);
}

- (void)layoutSubviews
{
  _TtC20ColorPickerUIService12AddColorCell *v2;

  v2 = self;
  sub_1000171F4();

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_100017410();
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView));
}

@end
