@implementation MSHistoryPlaceItem

- (MSHistoryPlaceItem)initWithLatitude:(id)a3 longitude:(id)a4 mapItemLastRefreshed:(id)a5 muid:(id)a6 supersededSearchId:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  MSHistoryPlaceItem *v25;
  uint64_t v27;

  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1A423BF84();
    v18 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    v19 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a7)
  {
    sub_1A423BFCC();
    v20 = sub_1A423BFE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v14, 0, 1, v20);
  }
  else
  {
    v21 = sub_1A423BFE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v14, 1, 1, v21);
  }
  v22 = a3;
  v23 = a4;
  v24 = a6;
  v25 = (MSHistoryPlaceItem *)sub_1A41219C8((uint64_t)a3, (uint64_t)a4, (uint64_t)v17, (uint64_t)a6, (uint64_t)v14);

  return v25;
}

- (MSHistoryPlaceItem)initWithStore:(id)a3 latitude:(id)a4 longitude:(id)a5 mapItemLastRefreshed:(id)a6 muid:(id)a7 supersededSearchId:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v29;

  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    sub_1A423BF84();
    v20 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    v21 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v19, 1, 1, v21);
  }
  if (a8)
  {
    sub_1A423BFCC();
    v22 = sub_1A423BFE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v16, 0, 1, v22);
  }
  else
  {
    v23 = sub_1A423BFE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v16, 1, 1, v23);
  }
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a7;
  return (MSHistoryPlaceItem *)HistoryPlaceItem.init(store:latitude:longitude:mapItemLastRefreshed:muid:supersededSearchId:)(v24, a4, a5, (uint64_t)v19, a7, (uint64_t)v16);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryPlaceItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSHistoryPlaceItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A411DFF4(v6, a4);

}

- (NSNumber)latitude
{
  MSHistoryPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A411E518();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  MSHistoryPlaceItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4121C2C(a3);

}

- (NSNumber)longitude
{
  MSHistoryPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A411E8DC();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  MSHistoryPlaceItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4121E00(a3);

}

- (NSDate)mapItemLastRefreshed
{
  return (NSDate *)sub_1A40FF2B8(self, (uint64_t)a2, &qword_1ED1AB5D0, (void (*)(void))sub_1A411EC94, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (void)setMapItemLastRefreshed:(id)a3
{
  sub_1A40FF7C8(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED1AB5D0, (void (*)(uint64_t))MEMORY[0x1E0CB07E8], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], (void (*)(char *))sub_1A411F0D0);
}

- (NSNumber)muid
{
  MSHistoryPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A411F3E0();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  MSHistoryPlaceItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4122058(a3);

}

- (NSUUID)supersededSearchId
{
  return (NSUUID *)sub_1A40FF2B8(self, (uint64_t)a2, (uint64_t *)&unk_1ED1ABCE0, (void (*)(void))sub_1A411F904, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB0930]);
}

- (void)setSupersededSearchId:(id)a3
{
  sub_1A40FF7C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_1ED1ABCE0, (void (*)(uint64_t))MEMORY[0x1E0CB0958], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], (void (*)(char *))sub_1A411FD40);
}

- (GEOMapItemStorage)mapItemStorage
{
  MSHistoryPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41203E8();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  void *v5;
  MSHistoryPlaceItem *v6;
  id v7;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v7 = a3;
  v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A4120C08((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);

}

- (MSHistoryPlaceItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSHistoryPlaceItem *)sub_1A4121744(a3, a4, a5);
}

- (void).cxx_destruct
{

  sub_1A410251C((uint64_t)self + OBJC_IVAR___MSHistoryPlaceItem__mapItemLastRefreshed, &qword_1ED1AB5D0);
  sub_1A410251C((uint64_t)self + OBJC_IVAR___MSHistoryPlaceItem__supersededSearchId, (uint64_t *)&unk_1ED1ABCE0);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryPlaceItem__mapItemStorage), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryPlaceItem__mapItemStorage]);
}

+ (id)strippedMapItemWith:(id)a3
{
  void *v4;
  id v5;
  id result;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  result = objc_msgSend(v4, sel_mapItemStorageForGEOMapItem_forUseType_, v5, 4);
  if (result)
  {
    v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
