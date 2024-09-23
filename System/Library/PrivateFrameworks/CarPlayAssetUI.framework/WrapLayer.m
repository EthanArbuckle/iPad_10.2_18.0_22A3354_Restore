@implementation WrapLayer

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for WrapLayer();
  -[WrapLayer bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WrapLayer();
  v7 = v8.receiver;
  -[WrapLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
  sub_23789A9C0();

}

- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WrapLayer();
  return -[WrapLayer init](&v3, sel_init);
}

- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_237A87E78();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_2Tm(v8, v8[3]);
  v4 = sub_237A88400();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WrapLayer();
  v5 = -[WrapLayer initWithLayer:](&v7, sel_initWithLayer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v8);
  return v5;
}

- (_TtC14CarPlayAssetUIP33_D494934E4D2CED7DFF04AAA732ED178E9WrapLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WrapLayer();
  return -[WrapLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
