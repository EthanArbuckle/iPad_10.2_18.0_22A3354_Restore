@implementation LoggingCardCarouselCollectionViewFlowLayout

- (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_scaleFactor) = (Class)0x3FC999999999999ALL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_scaleAlphaFactor) = (Class)0x3FB999999999999ALL;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_xScaleFactor) = (Class)0x3FF0000000000000;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *)sub_231CA2A48();
  __break(1u);
  return result;
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for LoggingCardCarouselLayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)prepareLayout
{
  _TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *v2;

  v2 = self;
  sub_231C659F0();

}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_231C65AC8(x, y, width, height);

  if (v8)
  {
    sub_231C661D4();
    v9 = (void *)sub_231CA1D94();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v7 = v13.receiver;
  v8 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v13, sel_invalidationContextForBoundsChange_, x, y, width, height);
  objc_opt_self();
  v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = v8;
    objc_msgSend(v10, sel_setInvalidateFlowLayoutDelegateMetrics_, 0, v13.receiver, v13.super_class);
    objc_msgSend(v10, sel_setInvalidateFlowLayoutAttributes_, 0);

    v7 = v11;
  }

  return v8;
}

- (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout)init
{
  _TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *result;

  result = (_TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super._deletedDecorationIndexPathsDict
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43LoggingCardCarouselCollectionViewFlowLayout_configuration));
}

@end
