@implementation MSCachedCuratedCollection

- (MSCachedCuratedCollection)initWithCollectionDescription:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 image:(id)a5 imageUrl:(id)a6 isTombstone:(BOOL)a7 lastFetchedDate:(id)a8 lastSignificantChangeDate:(id)a9 placesCount:(int)a10 positionIndex:(int64_t)a11 publisherAttribution:(id)a12 resultProviderIdentifier:(int)a13 title:(id)a14 titleLocale:(id)a15
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  MSCachedCuratedCollection *v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  MSCachedCuratedCollection *v71;
  _BOOL4 v72;

  v72 = a7;
  v70 = a4;
  v71 = self;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v61 - v23;
  if (a3)
  {
    v25 = sub_1A423C14C();
    v68 = v26;
    v69 = v25;
  }
  else
  {
    v68 = 0;
    v69 = 0;
  }
  if (a5)
  {
    v27 = a5;
    v28 = a6;
    v29 = a8;
    v30 = a9;
    v31 = a12;
    v32 = a14;
    v33 = a15;
    v34 = sub_1A423BF54();
    v66 = v35;
    v67 = v34;

    if (a6)
      goto LABEL_6;
LABEL_9:
    v64 = 0;
    v65 = 0;
    if (a8)
      goto LABEL_7;
    goto LABEL_10;
  }
  v39 = a6;
  v40 = a8;
  v41 = a9;
  v42 = a12;
  v43 = a14;
  v44 = a15;
  v66 = 0xF000000000000000;
  v67 = 0;
  if (!a6)
    goto LABEL_9;
LABEL_6:
  v36 = sub_1A423C14C();
  v64 = v37;
  v65 = v36;

  if (a8)
  {
LABEL_7:
    sub_1A423BF84();

    v38 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v24, 0, 1, v38);
    goto LABEL_11;
  }
LABEL_10:
  v45 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v24, 1, 1, v45);
LABEL_11:
  if (a9)
  {
    sub_1A423BF84();

    v46 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v22, 0, 1, v46);
  }
  else
  {
    v47 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v22, 1, 1, v47);
  }
  if (a12)
  {
    v48 = sub_1A423C14C();
    v62 = v49;
    v63 = v48;

  }
  else
  {
    v62 = 0;
    v63 = 0;
  }
  v50 = (uint64_t)v22;
  if (a14)
  {
    v51 = sub_1A423C14C();
    v53 = v52;

  }
  else
  {
    v51 = 0;
    v53 = 0;
  }
  if (a15)
  {
    v54 = sub_1A423C14C();
    v56 = v55;

  }
  else
  {
    v54 = 0;
    v56 = 0;
  }
  v58 = v66;
  v57 = v67;
  v59 = (MSCachedCuratedCollection *)sub_1A41A1678(v69, v68, v70, v67, v66, v65, v64, v72, (uint64_t)v24, v50, a10, a11, v63, v62, a13, v51, v53, v54, v56);
  sub_1A40D7778(v57, v58);
  return v59;
}

- (MSCachedCuratedCollection)initWithStore:(id)a3 collectionDescription:(id)a4 curatedCollectionIdentifier:(unint64_t)a5 image:(id)a6 imageUrl:(id)a7 isTombstone:(BOOL)a8 lastFetchedDate:(id)a9 lastSignificantChangeDate:(id)a10 placesCount:(int)a11 positionIndex:(int64_t)a12 publisherAttribution:(id)a13 resultProviderIdentifier:(int)a14 title:(id)a15 titleLocale:(id)a16
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  _BOOL4 v67;
  unint64_t v68;
  MSCachedCuratedCollection *v69;

  v67 = a8;
  v68 = a5;
  v69 = self;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v58 - v24;
  if (a4)
  {
    v26 = sub_1A423C14C();
    v65 = v27;
    v66 = v26;
  }
  else
  {
    v65 = 0;
    v66 = 0;
  }
  v64 = a3;
  if (a6)
  {
    v28 = a6;
    v29 = a7;
    v30 = a9;
    v31 = a10;
    v32 = a13;
    v33 = a15;
    v34 = a16;
    v35 = sub_1A423BF54();
    v62 = v36;
    v63 = v35;

    if (a7)
      goto LABEL_6;
LABEL_9:
    v60 = 0;
    v61 = 0;
    if (a9)
      goto LABEL_7;
    goto LABEL_10;
  }
  v40 = a7;
  v41 = a9;
  v42 = a10;
  v43 = a13;
  v44 = a15;
  v45 = a16;
  v62 = 0xF000000000000000;
  v63 = 0;
  if (!a7)
    goto LABEL_9;
LABEL_6:
  v37 = sub_1A423C14C();
  v60 = v38;
  v61 = v37;

  if (a9)
  {
LABEL_7:
    sub_1A423BF84();

    v39 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v25, 0, 1, v39);
    goto LABEL_11;
  }
LABEL_10:
  v46 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v25, 1, 1, v46);
LABEL_11:
  if (a10)
  {
    sub_1A423BF84();

    v47 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v23, 0, 1, v47);
  }
  else
  {
    v48 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v23, 1, 1, v48);
  }
  if (a13)
  {
    v49 = sub_1A423C14C();
    v58 = v50;
    v59 = v49;

  }
  else
  {
    v58 = 0;
    v59 = 0;
  }
  if (a15)
  {
    v51 = sub_1A423C14C();
    v53 = v52;

  }
  else
  {
    v51 = 0;
    v53 = 0;
  }
  if (a16)
  {
    v54 = sub_1A423C14C();
    v56 = v55;

  }
  else
  {
    v54 = 0;
    v56 = 0;
  }
  return (MSCachedCuratedCollection *)CachedCuratedCollection.init(store:collectionDescription:curatedCollectionIdentifier:image:imageUrl:isTombstone:lastFetchedDate:lastSignificantChangeDate:placesCount:positionIndex:publisherAttribution:resultProviderIdentifier:title:titleLocale:)(v64, v66, v65, v68, v63, v62, v61, v60, v67, (uint64_t)v25, (uint64_t)v23, a11, a12, v59, v58, a14, v51, v53, v54,
                                        v56);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSCachedCuratedCollection *v7;

  v6 = a3;
  v7 = self;
  sub_1A419D274(v6, a4);

}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A419D874);
}

- (void)setCollectionDescription:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41A19FC);
}

- (unint64_t)curatedCollectionIdentifier
{
  void *v2;
  MSCachedCuratedCollection *v3;
  unint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(unint64_t *)((char *)&v3->super.super.isa
                           + OBJC_IVAR___MSCachedCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  MSCachedCuratedCollection *v4;

  v4 = self;
  sub_1A419DCE4(a3);

}

- (NSData)image
{
  MSCachedCuratedCollection *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A419DF70();
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
  MSCachedCuratedCollection *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSCachedCuratedCollection *v8;

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
  sub_1A41A1BFC((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (NSString)imageUrl
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A419E5F4);
}

- (void)setImageUrl:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41A1DF0);
}

- (BOOL)isTombstone
{
  void *v2;
  MSCachedCuratedCollection *v3;
  char v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *((_BYTE *)&v3->super.super.isa + OBJC_IVAR___MSCachedCuratedCollection__isTombstone);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setIsTombstone:(BOOL)a3
{
  MSCachedCuratedCollection *v4;

  v4 = self;
  sub_1A419EA64(a3);

}

- (NSDate)lastFetchedDate
{
  return (NSDate *)sub_1A4193E08(self, (uint64_t)a2, (void (*)(void))sub_1A419ECE0);
}

- (void)setLastFetchedDate:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A419F0D0);
}

- (NSDate)lastSignificantChangeDate
{
  return (NSDate *)sub_1A4193E08(self, (uint64_t)a2, (void (*)(void))sub_1A419F390);
}

- (void)setLastSignificantChangeDate:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A419F780);
}

- (int)placesCount
{
  return sub_1A41A071C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCachedCuratedCollection__placesCount);
}

- (void)setPlacesCount:(int)a3
{
  MSCachedCuratedCollection *v4;

  v4 = self;
  sub_1A419FDFC(a3);

}

- (int64_t)positionIndex
{
  void *v2;
  MSCachedCuratedCollection *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCachedCuratedCollection__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSCachedCuratedCollection *v4;

  v4 = self;
  sub_1A41A0118(a3);

}

- (NSString)publisherAttribution
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41A039C);
}

- (void)setPublisherAttribution:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41A212C);
}

- (int)resultProviderIdentifier
{
  return sub_1A41A071C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCachedCuratedCollection__resultProviderIdentifier);
}

- (void)setResultProviderIdentifier:(int)a3
{
  MSCachedCuratedCollection *v4;

  v4 = self;
  sub_1A41A082C(a3);

}

- (NSString)title
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41A0A58);
}

- (void)setTitle:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41A2344);
}

- (NSString)titleLocale
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41A0DD8);
}

- (void)setTitleLocale:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41A252C);
}

- (MSCachedCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSCachedCuratedCollection *)sub_1A41A1364(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSCachedCuratedCollection__image), *(_QWORD *)&self->super._store[OBJC_IVAR___MSCachedCuratedCollection__image]);
  swift_bridgeObjectRelease();
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSCachedCuratedCollection__lastFetchedDate);
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSCachedCuratedCollection__lastSignificantChangeDate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
