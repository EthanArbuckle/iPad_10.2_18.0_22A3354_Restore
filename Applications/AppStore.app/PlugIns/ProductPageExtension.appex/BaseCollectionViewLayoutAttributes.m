@implementation BaseCollectionViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  _TtC20ProductPageExtension34BaseCollectionViewLayoutAttributes *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  v4 = self;
  sub_100338138((uint64_t)a3, (uint64_t)v9);

  v5 = v10;
  v6 = sub_100010F08(v9, v10);
  v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v9);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _TtC20ProductPageExtension34BaseCollectionViewLayoutAttributes *v5;
  uint64_t v6;
  _TtC20ProductPageExtension34BaseCollectionViewLayoutAttributes *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100338284((uint64_t)v10);

  sub_10001282C((uint64_t)v10);
  return v8;
}

- (_TtC20ProductPageExtension34BaseCollectionViewLayoutAttributes)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension34BaseCollectionViewLayoutAttributes_rubberbandingDistance) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension34BaseCollectionViewLayoutAttributes_parallaxY) = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension34BaseCollectionViewLayoutAttributes_isRubberbanding) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BaseCollectionViewLayoutAttributes();
  return -[BaseCollectionViewLayoutAttributes init](&v3, "init");
}

@end
