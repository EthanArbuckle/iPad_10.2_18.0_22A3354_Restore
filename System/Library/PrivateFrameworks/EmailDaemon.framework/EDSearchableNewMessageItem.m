@implementation EDSearchableNewMessageItem

- (unint64_t)itemInstantiationTime
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_itemInstantiationTime);
}

- (NSString)identifier
{
  return (NSString *)sub_1D310CA04();
}

- (NSString)domainIdentifier
{
  return (NSString *)sub_1D310CA04();
}

- (int64_t)indexingType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_indexingType);
  swift_beginAccess();
  return *v2;
}

- (void)setIndexingType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_indexingType);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC11EmailDaemon26EDSearchableNewMessageItem)init
{
  _TtC11EmailDaemon26EDSearchableNewMessageItem *result;

  result = (_TtC11EmailDaemon26EDSearchableNewMessageItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D3105134((uint64_t)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_message, type metadata accessor for SearchableMessage);
  sub_1D3105134((uint64_t)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_update, (uint64_t (*)(_QWORD))type metadata accessor for SearchableMessageUpdate);
}

- (BOOL)alwaysMarkAsIndexed
{
  return 1;
}

- (NSDate)dateReceived
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED11B448);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_message;
  v7 = &v6[*(int *)(type metadata accessor for SearchableMessage(0) + 24)];
  v8 = sub_1D3124CD4();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v7, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1D3124CB0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (int64_t)estimatedSizeInBytes
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_sizeInBytes);
}

- (BOOL)hasCompleteData
{
  return 1;
}

- (BOOL)requiresPreprocessing
{
  return 0;
}

- (BOOL)shouldExcludeFromIndex
{
  return 0;
}

- (id)fetchIndexableAttachments
{
  return objc_msgSend((id)objc_opt_self(), sel_nullFuture);
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (id)searchableItem
{
  _TtC11EmailDaemon26EDSearchableNewMessageItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)EDSearchableNewMessageItem.searchableItem()();

  return v3;
}

@end
