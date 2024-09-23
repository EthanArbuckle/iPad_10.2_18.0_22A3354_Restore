@implementation ATAnswerChoice

- (NSString)id
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)title
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_236B1654C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)completedRequestTitle
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setCompletedRequestTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_236B1654C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (signed)kind
{
  signed __int16 *v2;

  v2 = (signed __int16 *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  return *v2;
}

- (void)setKind:(signed __int16)a3
{
  signed __int16 *v4;

  v4 = (signed __int16 *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC5AskTo14ATAnswerChoice)initWithId:(id)a3 title:(id)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_236B1654C();
  v8 = v7;
  v9 = sub_236B1654C();
  v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  *v10 = 0;
  v10[1] = 0;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind) = 0;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  *v12 = v9;
  v12[1] = v13;
  v15.receiver = self;
  v15.super_class = ObjectType;
  return -[ATAnswerChoice init](&v15, sel_init);
}

- (_TtC5AskTo14ATAnswerChoice)initWithId:(id)a3 title:(id)a4 completedRequestTitle:(id)a5
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  uint64_t *v17;
  uint64_t *v18;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = sub_236B1654C();
  v10 = v9;
  v11 = sub_236B1654C();
  v13 = v12;
  if (a5)
  {
    a5 = (id)sub_236B1654C();
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  v16 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  *v16 = 0;
  v16[1] = 0;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind) = 0;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  *v17 = v8;
  v17[1] = v10;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  *v18 = v11;
  v18[1] = v13;
  swift_beginAccess();
  *v16 = a5;
  v16[1] = v15;
  swift_bridgeObjectRelease();
  v20.receiver = self;
  v20.super_class = ObjectType;
  return -[ATAnswerChoice init](&v20, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  _TtC5AskTo14ATAnswerChoice *v4;
  _TtC5AskTo14ATAnswerChoice *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_236B16714();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = ATAnswerChoice.isEqual(_:)((uint64_t)v8);

  sub_236B04E2C((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  _TtC5AskTo14ATAnswerChoice *v2;
  int64_t v3;

  v2 = self;
  v3 = ATAnswerChoice.hash.getter();

  return v3;
}

- (NSString)description
{
  _TtC5AskTo14ATAnswerChoice *v2;
  void *v3;

  v2 = self;
  ATAnswerChoice.description.getter();

  v3 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC5AskTo14ATAnswerChoice)init
{
  _TtC5AskTo14ATAnswerChoice *result;

  result = (_TtC5AskTo14ATAnswerChoice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC5AskTo14ATAnswerChoice)initWithCoder:(id)a3
{
  return (_TtC5AskTo14ATAnswerChoice *)ATAnswerChoice.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC5AskTo14ATAnswerChoice *v5;

  v4 = a3;
  v5 = self;
  ATAnswerChoice.encode(with:)((NSCoder)v4);

}

@end
