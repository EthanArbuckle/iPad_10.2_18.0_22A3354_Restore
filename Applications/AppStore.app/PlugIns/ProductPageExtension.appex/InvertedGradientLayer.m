@implementation InvertedGradientLayer

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer *v5;

  v4 = a3;
  v5 = self;
  sub_1005D20F8(v4);

}

- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_textDirection) = (Class)3;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  return -[InvertedGradientLayer init](&v3, "init");
}

- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)initWithLayer:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer *v8;
  objc_super v10;
  _QWORD v11[3];
  uint64_t v12;

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v11, a3);
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer_textDirection) = (Class)3;
  v5 = v12;
  v6 = sub_100010F08(v11, v12);
  v7 = _bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  v8 = -[InvertedGradientLayer initWithLayer:](&v10, "initWithLayer:", v7);
  swift_unknownObjectRelease();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v11);
  return v8;
}

- (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtensionP33_783347D3A1F7C40B6C9C949BBB68902921InvertedGradientLayer *)sub_1005D269C(a3);
}

@end
