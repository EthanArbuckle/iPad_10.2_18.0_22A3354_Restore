@implementation MapsSyncMutableCachedCuratedCollection

- (_TtC8MapsSync38MapsSyncMutableCachedCuratedCollection)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A411C430((char *)self, (uint64_t)a2, (SEL *)&selRef_collectionDescription);
}

- (void)setCollectionDescription:(id)a3
{
  sub_1A411C544((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setCollectionDescription_);
}

- (NSData)image
{
  void *v2;
  _TtC8MapsSync38MapsSyncMutableCachedCuratedCollection *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy);
  v3 = self;
  v4 = objc_msgSend(v2, sel_image);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423BF54();
    v8 = v7;

    v9 = (void *)sub_1A423BF48();
    sub_1A40D778C(v6, v8);
  }
  else
  {

    v9 = 0;
  }
  return (NSData *)v9;
}

- (void)setImage:(id)a3
{
  void *v3;
  _TtC8MapsSync38MapsSyncMutableCachedCuratedCollection *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _TtC8MapsSync38MapsSyncMutableCachedCuratedCollection *v12;
  id v13;

  v3 = a3;
  if (!a3)
  {
    v9 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy);
    v12 = self;
    v8 = 0xF000000000000000;
    goto LABEL_5;
  }
  v5 = self;
  v6 = v3;
  v3 = (void *)sub_1A423BF54();
  v8 = v7;

  v9 = *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy);
  if (v8 >> 60 == 15)
  {
LABEL_5:
    v10 = v9;
    v11 = 0;
    goto LABEL_6;
  }
  v10 = v9;
  v11 = sub_1A423BF48();
LABEL_6:
  v13 = (id)v11;
  objc_msgSend(v10, sel_setImage_);
  sub_1A40D7778((uint64_t)v3, v8);

}

- (NSString)imageUrl
{
  return (NSString *)sub_1A411C430((char *)self, (uint64_t)a2, (SEL *)&selRef_imageUrl);
}

- (void)setImageUrl:(id)a3
{
  sub_1A411C544((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setImageUrl_);
}

- (NSString)title
{
  return (NSString *)sub_1A411C430((char *)self, (uint64_t)a2, (SEL *)&selRef_title);
}

- (void)setTitle:(id)a3
{
  sub_1A411C544((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setTitle_);
}

- (unint64_t)curatedCollectionIdentifier
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_curatedCollectionIdentifier);
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_setCuratedCollectionIdentifier_, a3);
}

- (BOOL)isTombstone
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_isTombstone);
}

- (void)setIsTombstone:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_setIsTombstone_, a3);
}

- (NSDate)lastFetchedDate
{
  return (NSDate *)sub_1A411BAA0((char *)self, (uint64_t)a2, (SEL *)&selRef_lastFetchedDate);
}

- (void)setLastFetchedDate:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A411B960);
}

- (NSDate)lastSignificantChangeDate
{
  return (NSDate *)sub_1A411BAA0((char *)self, (uint64_t)a2, (SEL *)&selRef_lastSignificantChangeDate);
}

- (void)setLastSignificantChangeDate:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A411BD74);
}

- (int)placesCount
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_placesCount);
}

- (void)setPlacesCount:(int)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_setPlacesCount_, *(_QWORD *)&a3);
}

- (NSString)publisherAttribution
{
  return (NSString *)sub_1A411C430((char *)self, (uint64_t)a2, (SEL *)&selRef_publisherAttribution);
}

- (void)setPublisherAttribution:(id)a3
{
  sub_1A411C544((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setPublisherAttribution_);
}

- (NSString)titleLocale
{
  return (NSString *)sub_1A411C430((char *)self, (uint64_t)a2, (SEL *)&selRef_titleLocale);
}

- (void)setTitleLocale:(id)a3
{
  sub_1A411C544((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setTitleLocale_);
}

- (int)resultProviderIdentifier
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_resultProviderIdentifier);
}

- (void)setResultProviderIdentifier:(int)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_setResultProviderIdentifier_, *(_QWORD *)&a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy));
}

@end
