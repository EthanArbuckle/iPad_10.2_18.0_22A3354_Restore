@implementation ObjCVersion

- (ObjCVersion)init
{
  uint64_t v2;
  _QWORD *v3;
  objc_super v5;

  v2 = MEMORY[0x1E0DEE9E0];
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCVersion_version);
  *v3 = MEMORY[0x1E0DEE9E0];
  v3[1] = v2;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ObjCVersion();
  return -[ObjCVersion init](&v5, sel_init);
}

- (BOOL)isEmpty
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  return !*(_QWORD *)(v2[1] + 16) && *(_QWORD *)(*v2 + 16) == 0;
}

- (int64_t)maxCounter
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  ObjCVersion *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6EF738);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = self;
  v7 = swift_bridgeObjectRetain();
  sub_1BDEEC99C(v7, (uint64_t)v5);
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for Timestamp(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v5, 1, v8) == 1)
  {
    sub_1BDD86E30((uint64_t)v5, &qword_1ED6EF738);
    v9 = -1;
  }
  else
  {
    v9 = *(_QWORD *)&v5[*(int *)(v8 + 20)];
    sub_1BDD9C3E0((uint64_t)v5, type metadata accessor for Timestamp);
  }

  return v9;
}

- (BOOL)hasTemporaryComponents
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ObjCVersion_version;
  swift_beginAccess();
  return *(_QWORD *)(*((_QWORD *)v2 + 1) + 16) != 0;
}

- (id)temporaryComponentsWithExcluding:(id)a3
{
  id v5;
  ObjCVersion *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1BE19E3A0((uint64_t)a3);

  return v7;
}

- (NSArray)sortedUUIDs
{
  ObjCVersion *v2;
  void *v3;

  v2 = self;
  sub_1BE19E5EC();

  sub_1BE1B1F58();
  v3 = (void *)sub_1BE1B296C();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)hasDeltaTo:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  ObjCVersion *v12;
  char v13;

  v5 = (uint64_t *)((char *)a3 + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((sub_1BDDB04C0(v7, v10) & 1) != 0)
    v13 = 1;
  else
    v13 = sub_1BDDB04C0(v6, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13 & 1;
}

- (int64_t)compareTo:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  ObjCVersion *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  v8 = (uint64_t *)((char *)a3 + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  v9 = *v8;
  v14 = 0;
  v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = swift_bridgeObjectRetain();
  sub_1BDEEDAB4(v12, &v14, v7);
  sub_1BDEEDAB4(v9, &v14, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  ObjCVersion *v4;
  ObjCVersion *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BE1B2F3C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1BE19E8C4((uint64_t)v8);

  sub_1BDD86E30((uint64_t)v8, qword_1EF52B750);
  return v6 & 1;
}

- (id)copy
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  ObjCVersion *v10;
  ObjCVersion *v11;
  objc_super v13;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCVersion_version);
  swift_beginAccess();
  v5 = *v3;
  v4 = v3[1];
  v6 = (objc_class *)type metadata accessor for ObjCVersion();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___ObjCVersion_version];
  v9 = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)v8 = MEMORY[0x1E0DEE9E0];
  *((_QWORD *)v8 + 1) = v9;
  swift_beginAccess();
  *(_QWORD *)v8 = v5;
  *((_QWORD *)v8 + 1) = v4;
  v10 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13.receiver = v7;
  v13.super_class = v6;
  v11 = -[ObjCVersion init](&v13, sel_init);

  return v11;
}

- (BOOL)contains:(id)a3
{
  id v4;
  ObjCVersion *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1BE19EB68((uint64_t)v4);

  return self & 1;
}

- (void)insertWithRange:(_NSRange)a3 replica:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  ObjCVersion *v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = self;
  sub_1BE19F33C(location, length, (uint64_t)v7);

}

- (void)subtractWithRange:(_NSRange)a3 replica:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  ObjCVersion *v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = self;
  sub_1BE19F4E0(location, length, (uint64_t)v7);

}

- (void)subtract:(id)a3
{
  sub_1BE19F6F4(self, (uint64_t)a2, (char *)a3, (void (*)(uint64_t))sub_1BDEE9868);
}

- (void)merge:(id)a3
{
  sub_1BE19F6F4(self, (uint64_t)a2, (char *)a3, (void (*)(uint64_t))sub_1BDDAF714);
}

- (void)apply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  ObjCVersion *v9;

  v5 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames);
  v6 = *((unsigned __int8 *)a3 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 8);
  v7 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 16);
  swift_beginAccess();
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain();
  sub_1BDDB2D90(v5, v6, v7);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  ObjCVersion *v3;
  void *v4;

  swift_beginAccess();
  v3 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BDF1E398();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1BE1B27A4();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
