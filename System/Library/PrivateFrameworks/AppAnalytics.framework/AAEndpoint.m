@implementation AAEndpoint

- (NSURL)url
{
  return (NSURL *)(id)sub_1A5F63D64();
}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)sharedContainerIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->_anon_0[OBJC_IVAR___AAEndpoint_sharedContainerIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A5F6410C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (AAEndpoint)initWithURL:(id)a3 name:(id)a4 sharedContainerIdentifier:(id)a5
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  id *v18;
  AAEndpoint *v19;
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = sub_1A5F63DD0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F63D94();
  v12 = sub_1A5F64130();
  v14 = v13;
  if (a5)
  {
    a5 = (id)sub_1A5F64130();
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)self + OBJC_IVAR___AAEndpoint_url, v11, v8);
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___AAEndpoint_name);
  *v17 = v12;
  v17[1] = v14;
  v18 = (id *)((char *)&self->super.isa + OBJC_IVAR___AAEndpoint_sharedContainerIdentifier);
  *v18 = a5;
  v18[1] = v16;
  v21.receiver = self;
  v21.super_class = ObjectType;
  v19 = -[AAEndpoint init](&v21, sel_init);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v19;
}

- (AAEndpoint)init
{
  AAEndpoint *result;

  result = (AAEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___AAEndpoint_url;
  v3 = sub_1A5F63DD0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
