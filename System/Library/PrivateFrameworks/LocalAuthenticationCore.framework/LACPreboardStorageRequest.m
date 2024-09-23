@implementation LACPreboardStorageRequest

- (unsigned)identifier
{
  return *(_DWORD *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_identifier);
}

- (NSData)acl
{
  uint64_t *v2;
  unint64_t v3;
  Class isa;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_acl);
  v3 = *(_QWORD *)&self->identifier[OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_acl];
  if (v3 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    v5 = *v2;
    outlined copy of Data._Representation(*v2, v3);
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v5, v3);
  }
  return (NSData *)isa;
}

- (LACXPCClient)client
{
  return (LACXPCClient *)(id)swift_unknownObjectRetain();
}

- (NSUUID)contextID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of UUID?((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_contextID, (uint64_t)v5);
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSUUID *)isa;
}

- (int64_t)domain
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_domain);
}

- (int64_t)key
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_key);
}

- (_TtC23LocalAuthenticationCore25LACPreboardStorageRequest)init
{
  _TtC23LocalAuthenticationCore25LACPreboardStorageRequest *result;

  result = (_TtC23LocalAuthenticationCore25LACPreboardStorageRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_acl), *(_QWORD *)&self->identifier[OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_acl]);
  swift_unknownObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore25LACPreboardStorageRequest_contextID);
}

@end
