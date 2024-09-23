@implementation MapsSyncMutableAnalyticsIdentifier

- (_TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSData)data
{
  void *v2;
  _TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy);
  v3 = self;
  v4 = objc_msgSend(v2, sel_data);
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

- (void)setData:(id)a3
{
  void *v3;
  _TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier *v12;
  id v13;

  v3 = a3;
  if (!a3)
  {
    v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy);
    v12 = self;
    v8 = 0xF000000000000000;
    goto LABEL_5;
  }
  v5 = self;
  v6 = v3;
  v3 = (void *)sub_1A423BF54();
  v8 = v7;

  v9 = *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy);
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
  objc_msgSend(v10, sel_setData_);
  sub_1A40D7778((uint64_t)v3, v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy));
}

@end
