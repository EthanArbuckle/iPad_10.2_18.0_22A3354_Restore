@implementation MapsSyncHistoryItem

+ (id)fetchHistoryItemForIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v3 = sub_1A423BFE4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A423BFCC();
  v7 = (void *)_s8MapsSync0aB11HistoryItemC05fetchcD13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (double)position
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position);
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  void *v13;
  _OWORD v14[2];

  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A4224D34(a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A40CD40C((uint64_t)v14);
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completionWithError:(id)a8
{
  void *v11;
  uint64_t v12;
  _OWORD v13[2];

  v11 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  sub_1A42253DC(a3, a4, (uint64_t)v13, 1, 0, sub_1A40F4FB0, v12);
  swift_release();
  sub_1A40CD40C((uint64_t)v13);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync19MapsSyncHistoryItem *v4;
  _TtC8MapsSync19MapsSyncHistoryItem *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A4224360((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  objc_class *v5;
  _TtC8MapsSync19MapsSyncHistoryItem *v6;

  v4 = a3;
  v6 = self;
  sub_1A41CF8C8(v4);
  type metadata accessor for MapsSyncManagedHistoryItem();
  if (swift_dynamicCastClass())
  {
    objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_position);
    *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = v5;
  }

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync19MapsSyncHistoryItem *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A42246B8, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync19MapsSyncHistoryItem)initWithObject:(id)a3
{
  id v4;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  v4 = a3;
  return (_TtC8MapsSync19MapsSyncHistoryItem *)sub_1A41D033C(a3);
}

@end
