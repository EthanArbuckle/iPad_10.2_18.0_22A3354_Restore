@implementation SearchCollectionLayoutAttributes

- (_TtC8AppStore32SearchCollectionLayoutAttributes)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore32SearchCollectionLayoutAttributes_cornerRadius) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore32SearchCollectionLayoutAttributes_backgroundColor) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStore32SearchCollectionLayoutAttributes_backgroundGradientColors) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore32SearchCollectionLayoutAttributes_borderColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchCollectionLayoutAttributes();
  return -[SearchCollectionLayoutAttributes init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore32SearchCollectionLayoutAttributes_backgroundColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8AppStore32SearchCollectionLayoutAttributes_backgroundGradientColors));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore32SearchCollectionLayoutAttributes_borderColor));
}

@end
