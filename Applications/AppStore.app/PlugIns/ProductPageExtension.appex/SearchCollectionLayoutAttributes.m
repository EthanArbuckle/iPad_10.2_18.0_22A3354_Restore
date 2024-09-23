@implementation SearchCollectionLayoutAttributes

- (_TtC20ProductPageExtension32SearchCollectionLayoutAttributes)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32SearchCollectionLayoutAttributes_cornerRadius) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32SearchCollectionLayoutAttributes_backgroundColor) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32SearchCollectionLayoutAttributes_backgroundGradientColors) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32SearchCollectionLayoutAttributes_borderColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchCollectionLayoutAttributes();
  return -[SearchCollectionLayoutAttributes init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32SearchCollectionLayoutAttributes_backgroundColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension32SearchCollectionLayoutAttributes_backgroundGradientColors));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32SearchCollectionLayoutAttributes_borderColor));
}

@end
