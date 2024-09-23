@implementation _EXQueryResultUpdate

- (NSSet)removedUUIDs
{
  void *v2;

  sub_190CA84E8();
  sub_190C898C4(&qword_1EE20ABB0, MEMORY[0x1E0CB09C8]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190CA8758();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (_EXQueryResultUpdate)initWithAddedExtensions:(id)a3 removedUUIDs:(id)a4
{
  objc_class *v5;
  objc_super v7;

  sub_190C2B30C(0, (unint64_t *)&qword_1ECD98C80);
  sub_190C6D7B8();
  v5 = (objc_class *)sub_190CA8764();
  sub_190CA84E8();
  sub_190C898C4(&qword_1EE20ABB0, MEMORY[0x1E0CB09C8]);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResultUpdate_removedUUIDs) = (Class)sub_190CA8764();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_identities) = v5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _EXQueryResult();
  return -[_EXQueryResult init](&v7, sel_init);
}

- (_EXQueryResultUpdate)initWithAvailablility:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResultUpdate_removedUUIDs) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_identities) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_availablility) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _EXQueryResult();
  v4 = a3;
  return -[_EXQueryResult init](&v6, sel_init);
}

- (_EXQueryResultUpdate)initWithIdentities:(id)a3
{
  objc_class *v4;
  objc_super v6;

  sub_190C2B30C(0, (unint64_t *)&qword_1ECD98C80);
  sub_190C6D7B8();
  v4 = (objc_class *)sub_190CA8764();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResultUpdate_removedUUIDs) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_identities) = v4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _EXQueryResult();
  return -[_EXQueryResult init](&v6, sel_init);
}

- (_EXQueryResultUpdate)initWithCurrentExtensions:(id)a3 updatedExtensions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _EXQueryResultUpdate *result;

  sub_190C2B30C(0, (unint64_t *)&qword_1ECD98C80);
  sub_190C6D7B8();
  v4 = sub_190CA8764();
  v5 = sub_190CA8764();
  sub_190C88F64(v4, v5);
  return result;
}

- (_EXQueryResultUpdate)initWithCoder:(id)a3
{
  return (_EXQueryResultUpdate *)sub_190C89404(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _EXQueryResultUpdate *v8;

  v4 = a3;
  v8 = self;
  v5 = swift_bridgeObjectRetain();
  sub_190C899FC(v5);
  swift_bridgeObjectRelease();
  sub_190CA84E8();
  v6 = (void *)sub_190CA86B0();
  swift_release();
  v7 = (void *)sub_190CA85D8();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

  sub_190C889FC(v4);
}

- (NSSet)addedExtensions
{
  void *v2;

  sub_190C2B30C(0, (unint64_t *)&qword_1ECD98C80);
  sub_190C6D7B8();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190CA8758();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (NSString)description
{
  _EXQueryResultUpdate *v2;
  void *v3;

  v2 = self;
  sub_190C896B0();

  v3 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_EXQueryResultUpdate)init
{
  _EXQueryResultUpdate *result;

  result = (_EXQueryResultUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
