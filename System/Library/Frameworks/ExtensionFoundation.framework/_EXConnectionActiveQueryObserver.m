@implementation _EXConnectionActiveQueryObserver

- (int64_t)hash
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver_connection), sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  _TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver *v4;
  _TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190CA8908();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_190C6F040((uint64_t)v8);

  sub_190C459C8((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  _TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver *v2;
  void *v3;

  v2 = self;
  sub_190C6F1BC();

  v3 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver)init
{
  _TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver *result;

  result = (_TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver_connection));
  v3 = (char *)self + OBJC_IVAR____TtC19ExtensionFoundation32_EXConnectionActiveQueryObserver_id;
  v4 = sub_190CA84E8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

@end
