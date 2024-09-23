@implementation MapsSyncMutableCollectionPlaceItem

- (_TtC8MapsSync34MapsSyncMutableCollectionPlaceItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedCollectionItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSString)customName
{
  void *v2;
  _TtC8MapsSync34MapsSyncMutableCollectionPlaceItem *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
  v3 = self;
  v4 = objc_msgSend(v2, sel_customName);
  if (v4)
  {
    v5 = v4;
    sub_1A423C14C();

    v6 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setCustomName:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8MapsSync34MapsSyncMutableCollectionPlaceItem *v6;
  id v7;
  id v8;
  _TtC8MapsSync34MapsSyncMutableCollectionPlaceItem *v9;
  id v10;
  id v11;

  if (!a3)
  {
    v4 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
    goto LABEL_5;
  }
  sub_1A423C14C();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
  if (!v5)
  {
LABEL_5:
    v9 = self;
    v7 = v4;
    v8 = 0;
    goto LABEL_6;
  }
  v6 = self;
  v7 = v4;
  v10 = (id)sub_1A423C140();
  swift_bridgeObjectRelease();
  v8 = v10;
LABEL_6:
  v11 = v8;
  objc_msgSend(v7, sel_setCustomName_);

}

- (GEOLatLng)droppedPinCoordinate
{
  void *v2;
  _TtC8MapsSync34MapsSyncMutableCollectionPlaceItem *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem);
  v3 = self;
  v4 = objc_msgSend(v2, sel_droppedPinCoordinate);
  if (v4)
  {
    v5 = sub_1A423BF54();
    v7 = v6;

    v4 = (id)sub_1A423BF48();
    sub_1A40D778C(v5, v7);
  }
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D27140]), sel_initWithData_, v4);

  return (GEOLatLng *)v8;
}

- (void)setDroppedPinCoordinate:(id)a3
{
  id v5;
  _TtC8MapsSync34MapsSyncMutableCollectionPlaceItem *v6;

  v5 = a3;
  v6 = self;
  sub_1A40E4EF4(a3);

}

- (int)droppedPinFloorOrdinal
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem), sel_droppedPinFloorOrdinal);
}

- (void)setDroppedPinFloorOrdinal:(int)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem), sel_setDroppedPinFloorOrdinal_, *(_QWORD *)&a3);
}

- (GEOMapItemStorage)mapItemStorage
{
  _TtC8MapsSync34MapsSyncMutableCollectionPlaceItem *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1A40E538C();
  v4 = v3;

  return (GEOMapItemStorage *)v4;
}

- (void)setMapItemStorage:(id)a3
{
  id v5;
  _TtC8MapsSync34MapsSyncMutableCollectionPlaceItem *v6;

  v5 = a3;
  v6 = self;
  sub_1A40E5518(a3);

}

- (signed)origin
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem), sel_origin);
}

- (void)setOrigin:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem), sel_setOrigin_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableCollectionPlaceItem__proxyCollectionPlaceItem));
}

@end
