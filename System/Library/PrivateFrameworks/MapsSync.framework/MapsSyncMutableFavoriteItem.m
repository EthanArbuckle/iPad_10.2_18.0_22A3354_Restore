@implementation MapsSyncMutableFavoriteItem

- (void)moveToFront
{
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v2;

  v2 = self;
  MapsSyncMutableFavoriteItem.moveToFront()();

}

- (void)moveToBack
{
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v2;

  v2 = self;
  MapsSyncMutableFavoriteItem.moveToBack()();

}

- (id)moveBeforeItem:(id)a3
{
  char *v4;
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v5;
  id v6;

  v4 = (char *)a3;
  v5 = self;
  v6 = MapsSyncMutableFavoriteItem.moveBefore(item:)(v4);

  return v6;
}

- (id)moveAfterItem:(id)a3
{
  char *v4;
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v5;
  id v6;

  v4 = (char *)a3;
  v5 = self;
  v6 = MapsSyncMutableFavoriteItem.moveAfter(item:)(v4);

  return v6;
}

- (MapsSyncManagedFavoriteItem)_proxyFavorite
{
  return (MapsSyncManagedFavoriteItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite));
}

- (void)set_proxyFavorite:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite) = (Class)a3;
  v3 = a3;

}

- (_TtC8MapsSync27MapsSyncMutableFavoriteItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSSet)contactHandles
{
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1A420C3C4();

  if (v3)
  {
    v4 = (void *)sub_1A423C2B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSSet *)v4;
}

- (void)setContactHandles:(id)a3
{
  uint64_t v4;
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v5;

  if (a3)
    v4 = sub_1A423C2D8();
  else
    v4 = 0;
  v5 = self;
  sub_1A420C4D8(v4);

}

- (id)addContactHandle:(id)a3
{
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v4;
  id v5;

  sub_1A423C14C();
  v4 = self;
  v5 = sub_1A420CC08();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)removeContactHandle:(id)a3
{
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v4;

  sub_1A423C14C();
  v4 = self;
  sub_1A420CE90();

  swift_bridgeObjectRelease();
  return 0;
}

- (NSString)customName
{
  return (NSString *)sub_1A420DD70((char *)self, (uint64_t)a2, (SEL *)&selRef_customName);
}

- (void)setCustomName:(id)a3
{
  sub_1A420DE84((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setCustomName_);
}

- (BOOL)hidden
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_hidden);
}

- (void)setHidden:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setHidden_, a3);
}

- (GEOMapItemStorage)mapItemStorage
{
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1A420D428();
  v4 = v3;

  return (GEOMapItemStorage *)v4;
}

- (void)setMapItemStorage:(id)a3
{
  id v5;
  _TtC8MapsSync27MapsSyncMutableFavoriteItem *v6;

  v5 = a3;
  v6 = self;
  sub_1A420D5B4(a3);

}

- (NSString)originatingAddressString
{
  return (NSString *)sub_1A420DD70((char *)self, (uint64_t)a2, (SEL *)&selRef_originatingAddressString);
}

- (void)setOriginatingAddressString:(id)a3
{
  sub_1A420DE84((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setOriginatingAddressString_);
}

- (signed)type
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_type);
}

- (void)setType:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setType_, a3);
}

- (signed)source
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_source);
}

- (void)setSource:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setSource_, a3);
}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_1A420DD70((char *)self, (uint64_t)a2, (SEL *)&selRef_shortcutIdentifier);
}

- (void)setShortcutIdentifier:(id)a3
{
  sub_1A420DE84((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setShortcutIdentifier_);
}

- (signed)version
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_version);
}

- (void)setVersion:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setVersion_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite));
}

@end
