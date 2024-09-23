@implementation MapsSyncMutableCollection

- (_TtC8MapsSync25MapsSyncMutableCollection)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedCollection();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A41B8814((char *)self, (uint64_t)a2, (SEL *)&selRef_collectionDescription);
}

- (void)setCollectionDescription:(id)a3
{
  sub_1A41B8928((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setCollectionDescription_);
}

- (NSData)image
{
  void *v2;
  _TtC8MapsSync25MapsSyncMutableCollection *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection);
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
  _TtC8MapsSync25MapsSyncMutableCollection *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _TtC8MapsSync25MapsSyncMutableCollection *v12;
  id v13;

  v3 = a3;
  if (!a3)
  {
    v9 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection);
    v12 = self;
    v8 = 0xF000000000000000;
    goto LABEL_5;
  }
  v5 = self;
  v6 = v3;
  v3 = (void *)sub_1A423BF54();
  v8 = v7;

  v9 = *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection);
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
  return (NSString *)sub_1A41B8814((char *)self, (uint64_t)a2, (SEL *)&selRef_imageUrl);
}

- (void)setImageUrl:(id)a3
{
  sub_1A41B8928((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setImageUrl_);
}

- (NSString)title
{
  return (NSString *)sub_1A41B8814((char *)self, (uint64_t)a2, (SEL *)&selRef_title);
}

- (void)setTitle:(id)a3
{
  sub_1A41B8928((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setTitle_);
}

- (NSSet)places
{
  return (NSSet *)sub_1A41B8C04(self, (uint64_t)a2, (uint64_t (*)(void))sub_1A41B8C88);
}

- (void)setPlaces:(id)a3
{
  unint64_t v3;
  _TtC8MapsSync25MapsSyncMutableCollection *v5;

  v3 = (unint64_t)a3;
  if (a3)
  {
    type metadata accessor for MapsSyncCollectionItem();
    sub_1A40D0EE8((unint64_t *)&qword_1ED1AA838, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncCollectionItem, MEMORY[0x1E0DEFCF8]);
    v3 = sub_1A423C2D8();
  }
  v5 = self;
  sub_1A41B8E24(v3);

}

- (void)addItemWithCollectionItem:(id)a3
{
  id v4;
  _TtC8MapsSync25MapsSyncMutableCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A41B915C((uint64_t)v4);

}

- (void)removePlaceWithCollectionItem:(id)a3
{
  id v4;
  _TtC8MapsSync25MapsSyncMutableCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A41B92B8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection));
}

@end
