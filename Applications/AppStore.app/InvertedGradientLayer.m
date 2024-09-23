@implementation InvertedGradientLayer

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer *v5;

  v4 = a3;
  v5 = self;
  sub_100392D54(v4);

}

- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_textDirection) = (Class)3;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  return -[InvertedGradientLayer init](&v3, "init");
}

- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)initWithLayer:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer *v8;
  objc_super v10;
  _QWORD v11[3];
  uint64_t v12;

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v11, a3);
  swift_unknownObjectRelease(a3);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_textDirection) = (Class)3;
  v5 = v12;
  v6 = sub_100060B40(v11, v12);
  v7 = _bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  v8 = -[InvertedGradientLayer initWithLayer:](&v10, "initWithLayer:", v7);
  swift_unknownObjectRelease(v7);
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v11);
  return v8;
}

- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)initWithCoder:(id)a3
{
  return (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer *)sub_1003932F8(a3);
}

@end
