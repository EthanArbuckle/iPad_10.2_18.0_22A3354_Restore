@implementation MSHistorySearchItem

- (MSHistorySearchItem)initWithGeoMapRegion:(id)a3 language:(id)a4 locationDisplay:(id)a5 query:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;

  v9 = a3;
  if (a3)
  {
    v10 = a4;
    v11 = a5;
    v12 = a6;
    v13 = v9;
    v9 = (void *)sub_1A423BF54();
    v15 = v14;

    if (a4)
      goto LABEL_3;
  }
  else
  {
    v25 = a4;
    v26 = a5;
    v27 = a6;
    v15 = 0xF000000000000000;
    if (a4)
    {
LABEL_3:
      v16 = sub_1A423C14C();
      v18 = v17;

      if (a5)
        goto LABEL_4;
LABEL_8:
      v19 = 0;
      v21 = 0;
      if (a6)
        goto LABEL_5;
LABEL_9:
      v22 = 0;
      v24 = 0;
      return (MSHistorySearchItem *)HistorySearchItem.init(geoMapRegion:language:locationDisplay:query:)((uint64_t)v9, v15, v16, v18, v19, v21, v22, v24);
    }
  }
  v16 = 0;
  v18 = 0;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  v19 = sub_1A423C14C();
  v21 = v20;

  if (!a6)
    goto LABEL_9;
LABEL_5:
  v22 = sub_1A423C14C();
  v24 = v23;

  return (MSHistorySearchItem *)HistorySearchItem.init(geoMapRegion:language:locationDisplay:query:)((uint64_t)v9, v15, v16, v18, v19, v21, v22, v24);
}

- (MSHistorySearchItem)initWithStore:(id)a3 geoMapRegion:(id)a4 language:(id)a5 locationDisplay:(id)a6 query:(id)a7
{
  void *v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char *v32;

  v10 = a4;
  if (a4)
  {
    v12 = a3;
    v13 = a5;
    v14 = a6;
    v15 = a7;
    v16 = v10;
    v10 = (void *)sub_1A423BF54();
    v18 = v17;

    if (a5)
      goto LABEL_3;
  }
  else
  {
    v28 = a3;
    v29 = a5;
    v30 = a6;
    v31 = a7;
    v18 = 0xF000000000000000;
    if (a5)
    {
LABEL_3:
      v19 = sub_1A423C14C();
      v21 = v20;

      if (a6)
        goto LABEL_4;
LABEL_8:
      v22 = 0;
      v24 = 0;
      if (a7)
        goto LABEL_5;
LABEL_9:
      v25 = 0;
      v27 = 0;
      goto LABEL_10;
    }
  }
  v19 = 0;
  v21 = 0;
  if (!a6)
    goto LABEL_8;
LABEL_4:
  v22 = sub_1A423C14C();
  v24 = v23;

  if (!a7)
    goto LABEL_9;
LABEL_5:
  v25 = sub_1A423C14C();
  v27 = v26;

LABEL_10:
  v32 = sub_1A414A7C4(a3, (uint64_t)v10, v18, v19, v21, v22, v24, v25, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MSHistorySearchItem *)v32;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistorySearchItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSHistorySearchItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A4148F6C(v6, a4);

}

- (NSData)geoMapRegion
{
  MSHistorySearchItem *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A41492B0();
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

- (void)setGeoMapRegion:(id)a3
{
  void *v3;
  MSHistorySearchItem *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSHistorySearchItem *v8;

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
  sub_1A414AAE8((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (NSString)language
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A4149934);
}

- (void)setLanguage:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A414ACDC);
}

- (NSString)locationDisplay
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A4149CB4);
}

- (void)setLocationDisplay:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A414AEC4);
}

- (NSString)query
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A414A034);
}

- (void)setQuery:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A414B0AC);
}

- (MSHistorySearchItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;

  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__geoMapRegion) = xmmword_1A4243680;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__language);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__locationDisplay);
  *v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__query);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  v11 = a3;
  return (MSHistorySearchItem *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__geoMapRegion), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistorySearchItem__geoMapRegion]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
