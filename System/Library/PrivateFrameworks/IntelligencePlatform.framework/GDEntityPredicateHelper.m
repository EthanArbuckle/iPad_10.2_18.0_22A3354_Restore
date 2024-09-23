@implementation GDEntityPredicateHelper

- (_TtC20IntelligencePlatform23GDEntityPredicateHelper)init
{
  sub_1AE5C5D64();
}

+ (unint64_t)entityPredicateFrom:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = sub_1AE925E3C();
  v5 = static GDEntityPredicateHelper.entityPredicate(from:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

@end
