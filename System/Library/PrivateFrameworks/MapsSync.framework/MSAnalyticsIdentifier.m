@implementation MSAnalyticsIdentifier

- (MSAnalyticsIdentifier)initWithData:(id)a3 positionIndex:(int64_t)a4
{
  uint64_t v5;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  MSAnalyticsIdentifier *v12;

  v5 = (uint64_t)a3;
  if (a3)
  {
    v7 = a3;
    v5 = sub_1A423BF54();
    v9 = v8;

  }
  else
  {
    v9 = 0xF000000000000000;
  }
  if (qword_1ED1AB880 != -1)
    swift_once();
  v10 = qword_1ED1AB9F0;
  if (v9 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    sub_1A40D7734(v5, v9);
    v11 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v9);
  }
  v12 = -[MSAnalyticsIdentifier initWithStore:data:positionIndex:](self, sel_initWithStore_data_positionIndex_, v10, v11, a4);
  sub_1A40D7778(v5, v9);

  return v12;
}

- (MSAnalyticsIdentifier)initWithStore:(id)a3 data:(id)a4 positionIndex:(int64_t)a5
{
  void *v6;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = a4;
  if (a4)
  {
    v8 = a3;
    v9 = v6;
    v6 = (void *)sub_1A423BF54();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v11 = 0xF000000000000000;
  }
  return (MSAnalyticsIdentifier *)AnalyticsIdentifier.init(store:data:positionIndex:)(a3, (uint64_t)v6, v11, a5);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSAnalyticsIdentifier *v7;

  v6 = a3;
  v7 = self;
  sub_1A41476E8(v6, a4);

}

- (NSData)data
{
  MSAnalyticsIdentifier *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A4147888();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1A423BF48();
    sub_1A40D7778(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setData:(id)a3
{
  void *v3;
  MSAnalyticsIdentifier *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSAnalyticsIdentifier *v8;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_1A423BF54();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  sub_1A41483FC((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (int64_t)positionIndex
{
  void *v2;
  MSAnalyticsIdentifier *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSAnalyticsIdentifier__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSAnalyticsIdentifier *v4;

  v4 = self;
  sub_1A4147FFC(a3);

}

- (MSAnalyticsIdentifier)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnalyticsIdentifier__data) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnalyticsIdentifier__positionIndex) = 0;
  v8 = a3;
  return (MSAnalyticsIdentifier *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnalyticsIdentifier__data), *(_QWORD *)&self->super._store[OBJC_IVAR___MSAnalyticsIdentifier__data]);
}

@end
