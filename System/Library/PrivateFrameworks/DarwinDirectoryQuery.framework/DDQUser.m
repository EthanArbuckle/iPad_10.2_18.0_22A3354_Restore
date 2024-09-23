@implementation DDQUser

+ (NSSet)allUsers
{
  return (NSSet *)sub_23A24352C((uint64_t)a1, (uint64_t)a2, (uint64_t (*)(void *))sub_23A24F874);
}

+ (NSSet)mutableUsers
{
  return (NSSet *)sub_23A24352C((uint64_t)a1, (uint64_t)a2, (uint64_t (*)(void *))sub_23A24FD00);
}

- (NSUUID)uuid
{
  return (NSUUID *)sub_23A244000(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDQUser__user);
}

- (unsigned)uid
{
  return sub_23A244140(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDQUser__user);
}

- (NSString)name
{
  return (NSString *)sub_23A244218(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDQUser__user);
}

- (NSString)fullName
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  DDQUser *v6;
  void *v7;
  _BYTE v9[32];

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A243D1C((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v9);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A242A04((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for User);

  v7 = (void *)sub_23A251414();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)homeDirectory
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  DDQUser *v6;
  void *v7;
  _BYTE v9[32];

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A243D1C((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v9);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A242A04((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for User);

  v7 = (void *)sub_23A251414();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (unsigned)primaryGroupID
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  DDQUser *v6;
  _BYTE v8[32];

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A243D1C((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v8);
  v6 = self;
  swift_dynamicCast();
  LODWORD(v3) = *(_DWORD *)&v5[*(int *)(v3 + 36)];
  sub_23A242A04((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for User);

  return v3;
}

- (NSString)shell
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  DDQUser *v6;
  void *v7;
  _BYTE v9[32];

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A243D1C((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v9);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A242A04((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for User);

  v7 = (void *)sub_23A251414();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (DDQUser)userWithUUID:(id)a3
{
  sub_23A244694();
}

- (DDQUser)userWithUID:(unsigned int)a3
{
  DDQUser *result;

  result = (DDQUser *)sub_23A25154C();
  __break(1u);
  return result;
}

- (DDQUser)userWithName:(id)a3
{
  DDQUser *result;

  result = (DDQUser *)sub_23A25154C();
  __break(1u);
  return result;
}

- (DDQUser)init
{
  DDQUser *result;

  result = (DDQUser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___DDQUser__user);
}

+ (id)userWithUUID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;

  v3 = sub_23A2513FC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A2513D8();
  v7 = sub_23A2456E0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (id)userWithUID:(unsigned int)a3
{
  return sub_23A2458BC(a3);
}

+ (id)userWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = sub_23A251420();
  v5 = sub_23A245A7C(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A245098(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDQUser.isEqual(_:));
}

- (int64_t)hash
{
  DDQUser *v2;
  int64_t v3;

  v2 = self;
  v3 = DDQUser.hash.getter();

  return v3;
}

@end
