@implementation MapsSyncDataValidator

+ (BOOL)doesMapItemExistInCollectionWithMapItem:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  sub_1A40F7868((uint64_t)a3, (uint64_t)v7);
  v9 = v8;

  return v9 != 0;
}

+ (BOOL)doesMapItemExistInPlacesWithMapItem:(id)a3 session:(id)a4
{
  return 0;
}

+ (id)findMapItemInPlacesWithMapItem:(id)a3 session:(id)a4
{
  return 0;
}

+ (id)findPlaceInCollectionWithMapItem:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  sub_1A40F7868((uint64_t)a3, (uint64_t)v7);
  v9 = v8;

  return v9;
}

- (_TtC8MapsSync21MapsSyncDataValidator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSyncDataValidator();
  return -[MapsSyncDataValidator init](&v3, sel_init);
}

@end
