@implementation DDUser

- (NSUUID)uuid
{
  return (NSUUID *)sub_23A1E3B40(self, (uint64_t)a2, (void (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDUser__user);
}

- (unsigned)uid
{
  return sub_23A1E3C98(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDUser__user);
}

- (void)setUid:(unsigned int)a3
{
  sub_23A1E3D88((char *)self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDUser__user);
}

- (NSString)name
{
  return (NSString *)sub_23A1E3EB8(self, (uint64_t)a2, (void (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDUser__user);
}

- (void)setName:(id)a3
{
  sub_23A1E4228(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)type metadata accessor for User, (uint64_t)&OBJC_IVAR___DDUser__user, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A1E3FD4);
}

- (NSString)fullName
{
  return (NSString *)sub_23A1E410C(self, (uint64_t)a2, (void (*)(_QWORD))type metadata accessor for User, &OBJC_IVAR___DDUser__user);
}

- (void)setFullName:(id)a3
{
  sub_23A1E4228(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)type metadata accessor for User, (uint64_t)&OBJC_IVAR___DDUser__user, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A1E42A0);
}

- (NSString)homeDirectory
{
  uint64_t v3;
  char *v4;
  char *v5;
  DDUser *v6;
  void *v7;
  _BYTE v10[32];

  type metadata accessor for User();
  MEMORY[0x24BDAC7A8]();
  v4 = v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v5 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v5, (uint64_t)v10);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A1E2184((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for User);

  v7 = (void *)sub_23A1EE838();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)setHomeDirectory:(id)a3
{
  sub_23A1E2B74(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_23A1E2704);
}

- (DDGroup)primaryGroup
{
  DDUser *v2;
  id v3;

  v2 = self;
  v3 = sub_23A1E2860();

  return (DDGroup *)v3;
}

- (void)setPrimaryGroup:(id)a3
{
  DDUser *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_23A1E9F9C((uint64_t)v5);

}

- (NSString)shell
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  DDUser *v7;
  void *v8;
  _BYTE v11[32];

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A1E2184((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for User);

  v8 = (void *)sub_23A1EE838();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (void)setShell:(id)a3
{
  sub_23A1E2B74(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_23A1E2BD4);
}

- (NSSet)aliases
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  DDUser *v7;
  void *v8;
  _BYTE v11[32];

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A1E2184((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for User);

  v8 = (void *)sub_23A1EE868();
  swift_bridgeObjectRelease();
  return (NSSet *)v8;
}

- (void)setAliases:(id)a3
{
  uint64_t v4;
  DDUser *v5;

  v4 = sub_23A1EE874();
  v5 = self;
  sub_23A1E2E70(v4);

}

- (NSSet)memberships
{
  return (NSSet *)sub_23A1E465C(self, (uint64_t)a2, (void (*)(void))sub_23A1E2F98);
}

- (void)setMemberships:(id)a3
{
  sub_23A1E49EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23A1E32C8);
}

- (DDUser)userWithName:(id)a3 fullName:(id)a4 primaryGroup:(id)a5
{
  DDUser *result;

  result = (DDUser *)sub_23A1EE9AC();
  __break(1u);
  return result;
}

- (DDUser)init
{
  DDUser *result;

  result = (DDUser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___DDUser__user);
}

+ (id)userWithName:(id)a3 fullName:(id)a4 primaryGroup:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = sub_23A1EE844();
  v8 = v7;
  v9 = sub_23A1EE844();
  v11 = v10;
  v12 = a5;
  v13 = sub_23A1EA68C(v6, v8, v9, v11, (uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A1E52D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDUser.isEqual(_:));
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  DDUser *v7;
  int64_t v8;
  __int128 v10[4];

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v6, (uint64_t)v10);
  v7 = self;
  swift_dynamicCast();
  sub_23A1EE9DC();
  User.hash(into:)(v10);
  v8 = sub_23A1EEA0C();
  sub_23A1E2184((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for User);

  return v8;
}

@end
