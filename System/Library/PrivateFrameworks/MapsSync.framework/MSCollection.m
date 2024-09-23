@implementation MSCollection

- (void)beforeDeleteWithManaged:(id)a3
{
  id v4;
  MSCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A4161CF0(v4);

}

- (MSCollection)initWithCollectionDescription:(id)a3 image:(id)a4 imageUrl:(id)a5 positionIndex:(int64_t)a6 title:(id)a7
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  v9 = a4;
  if (a3)
  {
    v10 = sub_1A423C14C();
    v12 = v11;
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v10 = 0;
    v12 = 0;
    if (a4)
    {
LABEL_3:
      v13 = v9;
      v14 = a5;
      v15 = a7;
      v9 = (void *)sub_1A423BF54();
      v17 = v16;

      if (a5)
        goto LABEL_4;
LABEL_8:
      v18 = 0;
      v20 = 0;
      if (a7)
        goto LABEL_5;
LABEL_9:
      v21 = 0;
      v23 = 0;
      return (MSCollection *)Collection.init(collectionDescription:image:imageUrl:positionIndex:title:)(v10, v12, (uint64_t)v9, v17, v18, v20, a6, v21, v23);
    }
  }
  v24 = a5;
  v25 = a7;
  v17 = 0xF000000000000000;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  v18 = sub_1A423C14C();
  v20 = v19;

  if (!a7)
    goto LABEL_9;
LABEL_5:
  v21 = sub_1A423C14C();
  v23 = v22;

  return (MSCollection *)Collection.init(collectionDescription:image:imageUrl:positionIndex:title:)(v10, v12, (uint64_t)v9, v17, v18, v20, a6, v21, v23);
}

- (MSCollection)initWithStore:(id)a3 collectionDescription:(id)a4 image:(id)a5 imageUrl:(id)a6 positionIndex:(int64_t)a7 title:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  char *v30;

  if (a4)
  {
    v12 = sub_1A423C14C();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a3;
  if (a5)
  {
    v16 = a5;
    v17 = a6;
    v18 = a8;
    v19 = sub_1A423BF54();
    v21 = v20;

    if (a6)
      goto LABEL_6;
LABEL_9:
    v22 = 0;
    v24 = 0;
    if (a8)
      goto LABEL_7;
LABEL_10:
    v25 = 0;
    v27 = 0;
    goto LABEL_11;
  }
  v28 = a6;
  v29 = a8;
  v19 = 0;
  v21 = 0xF000000000000000;
  if (!a6)
    goto LABEL_9;
LABEL_6:
  v22 = sub_1A423C14C();
  v24 = v23;

  if (!a8)
    goto LABEL_10;
LABEL_7:
  v25 = sub_1A423C14C();
  v27 = v26;

LABEL_11:
  v30 = sub_1A41E200C(v15, v12, v14, v19, v21, v22, v24, a7, v25, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MSCollection *)v30;
}

- (void)flushChanges
{
  _QWORD *v3;
  uint64_t v4;
  MSCollection *v5;
  _QWORD *v6;

  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  v4 = MEMORY[0x1E0DEE9D8];
  *v3 = MEMORY[0x1E0DEE9D8];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCollection__placeChanges);
  swift_beginAccess();
  *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSCollection *v7;

  v6 = a3;
  v7 = self;
  sub_1A41DF86C(v6, a4);

}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41DFB20);
}

- (void)setCollectionDescription:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41E2360);
}

- (NSData)image
{
  MSCollection *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A41DFF04();
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

- (void)setImage:(id)a3
{
  void *v3;
  MSCollection *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSCollection *v8;

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
  sub_1A41E2530((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (NSString)imageUrl
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41E0588);
}

- (void)setImageUrl:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41E2724);
}

- (int)placesCount
{
  void *v2;
  MSCollection *v3;
  int v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_DWORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCollection__placesCount);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (int64_t)positionIndex
{
  void *v2;
  MSCollection *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCollection__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSCollection *v4;

  v4 = self;
  sub_1A41E0AB4(a3);

}

- (NSString)title
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41E0D2C);
}

- (void)setTitle:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41E2948);
}

- (id)fetchPlaces
{
  MSCollection *v2;
  void *v3;

  v2 = self;
  sub_1A41E1270();

  type metadata accessor for CollectionItem();
  v3 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addPlace:(id)a3
{
  id v4;
  MSCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A41E19B4(v4, 0, (uint64_t)sub_1A41E18B8, 0);

}

- (void)removePlace:(id)a3
{
  id v4;
  MSCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1A41E19B4(v4, 1, (uint64_t)sub_1A41E1940, 0);

}

- (MSCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;

  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__collectionDescription);
  *v8 = 0;
  v8[1] = 0;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__image) = xmmword_1A4243680;
  v9 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__imageUrl);
  *v9 = 0;
  v9[1] = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__placesCount) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__positionIndex) = 0;
  v10 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__title);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__placeChanges) = (Class)MEMORY[0x1E0DEE9D8];
  v11 = a3;
  return (MSCollection *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__image), *(_QWORD *)&self->super._store[OBJC_IVAR___MSCollection__image]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
