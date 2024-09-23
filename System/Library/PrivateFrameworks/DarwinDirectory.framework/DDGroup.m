@implementation DDGroup

- (NSUUID)uuid
{
  return (NSUUID *)sub_23A1E3B40(self, (uint64_t)a2, (void (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group);
}

- (unsigned)gid
{
  return sub_23A1E3C98(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group);
}

- (void)setGid:(unsigned int)a3
{
  sub_23A1E3D88((char *)self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group);
}

- (NSString)name
{
  return (NSString *)sub_23A1E3EB8(self, (uint64_t)a2, (void (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group);
}

- (void)setName:(id)a3
{
  sub_23A1E4228(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)type metadata accessor for Group, (uint64_t)&OBJC_IVAR___DDGroup__group, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A1E3FD4);
}

- (NSString)fullName
{
  return (NSString *)sub_23A1E410C(self, (uint64_t)a2, (void (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group);
}

- (void)setFullName:(id)a3
{
  sub_23A1E4228(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)type metadata accessor for Group, (uint64_t)&OBJC_IVAR___DDGroup__group, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A1E42A0);
}

- (NSSet)aliases
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  DDGroup *v7;
  void *v8;
  _BYTE v11[32];

  v3 = type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v3);
  v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (char *)self + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A1E2184((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);

  v8 = (void *)sub_23A1EE868();
  swift_bridgeObjectRelease();
  return (NSSet *)v8;
}

- (void)setAliases:(id)a3
{
  uint64_t v4;
  DDGroup *v5;

  v4 = sub_23A1EE874();
  v5 = self;
  sub_23A1E4534(v4);

}

- (NSSet)nestedGroups
{
  return (NSSet *)sub_23A1E465C(self, (uint64_t)a2, (void (*)(void))sub_23A1E46D0);
}

- (void)setNestedGroups:(id)a3
{
  sub_23A1E49EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23A1E4A74);
}

- (DDGroup)groupWithName:(id)a3 fullName:(id)a4
{
  DDGroup *result;

  result = (DDGroup *)sub_23A1EE9AC();
  __break(1u);
  return result;
}

- (DDGroup)init
{
  DDGroup *result;

  result = (DDGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___DDGroup__group);
}

+ (DDGroup)groupWithName:(id)a3 fullName:(id)a4
{
  int *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  char *v16;
  uint64_t *v17;
  uint64_t *boxed_opaque_existential_0;
  id v19;
  objc_super v21;

  v4 = (int *)type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A1EE844();
  v9 = v8;
  v10 = sub_23A1EE844();
  v12 = v11;
  v13 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v6[v4[8]] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v6[v4[9]] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A1EE814();
  *(_DWORD *)&v6[v4[5]] = sub_23A1E1EF0();
  v14 = (uint64_t *)&v6[v4[6]];
  *v14 = v7;
  v14[1] = v9;
  v15 = (uint64_t *)&v6[v4[7]];
  *v15 = v10;
  v15[1] = v12;
  v16 = (char *)objc_allocWithZone((Class)DDGroup);
  v17 = (uint64_t *)&v16[OBJC_IVAR___DDGroup__group];
  v17[3] = (uint64_t)v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v17);
  sub_23A1E21C0((uint64_t)v6, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  v21.receiver = v16;
  v21.super_class = (Class)DDGroup;
  v19 = objc_msgSendSuper2(&v21, sel_init);
  sub_23A1E2184((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (DDGroup *)v19;
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A1E52D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDGroup.isEqual(_:));
}

- (int64_t)hash
{
  DDGroup *v2;
  int64_t v3;

  v2 = self;
  v3 = DDGroup.hash.getter();

  return v3;
}

@end
