@implementation EDPersistedRichLinkID

- (int64_t)databaseID
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___EDPersistedRichLinkID_databaseID);
}

- (NSString)stringValue
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D3124DC4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (EDPersistedRichLinkID)initWithDatabaseID:(int64_t)a3
{
  EDPersistedRichLinkID *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  objc_super v10;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EDPersistedRichLinkID_databaseID) = (Class)a3;
  v3 = self;
  v4 = (id)EFStringWithInt64();
  v5 = sub_1D3124DE8();
  v7 = v6;

  v8 = (uint64_t *)((char *)v3 + OBJC_IVAR___EDPersistedRichLinkID_stringValue);
  *v8 = v5;
  v8[1] = v7;

  v10.receiver = v3;
  v10.super_class = (Class)EDPersistedRichLinkID;
  return -[EDPersistedRichLinkID init](&v10, sel_init);
}

- (EDPersistedRichLinkID)initWithString:(id)a3
{
  void *v4;
  id v5;

  sub_1D3124DE8();
  v4 = (void *)sub_1D3124DC4();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v4, sel_longLongValue);

  return -[EDPersistedRichLinkID initWithDatabaseID:](self, sel_initWithDatabaseID_, v5);
}

- (NSString)description
{
  EDPersistedRichLinkID *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[EDPersistedRichLinkID stringValue](v2, sel_stringValue);
  sub_1D3124DE8();

  v4 = (void *)sub_1D3124DC4();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  EDPersistedRichLinkID *v4;
  EDPersistedRichLinkID *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D3124FE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = EDPersistedRichLinkID.isEqual(_:)((uint64_t)v8);

  sub_1D30F40F8((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  EDPersistedRichLinkID *v2;
  int64_t v3;

  v2 = self;
  -[EDPersistedRichLinkID databaseID](v2, sel_databaseID);
  v3 = sub_1D31251FC();

  return v3;
}

- (EDPersistedRichLinkID)init
{
  EDPersistedRichLinkID *result;

  result = (EDPersistedRichLinkID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
