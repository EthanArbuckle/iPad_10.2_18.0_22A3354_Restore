@implementation ObjCRenames

- (int64_t)generation
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames);
}

- (int64_t)count
{
  return *(_QWORD *)(*(_QWORD *)&self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 8] + 16);
}

- (BOOL)hasLocalRenames
{
  return self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames];
}

- (_TtC9Coherence11ObjCRenames)init
{
  _TtC9Coherence11ObjCRenames *v2;
  unint64_t v3;
  char *v4;
  objc_super v6;

  v2 = self;
  v3 = sub_1BDDC8AB0(MEMORY[0x1E0DEE9D8]);
  v4 = (char *)v2 + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames;
  *(_QWORD *)v4 = -1;
  v4[8] = 0;
  *((_QWORD *)v4 + 2) = v3;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ObjCRenames();
  return -[ObjCRenames init](&v6, sel_init);
}

- (id)renamed:(int64_t)a3 replica:(id)a4
{
  id v6;
  _TtC9Coherence11ObjCRenames *v7;
  id v8;

  v6 = a4;
  v7 = self;
  v8 = sub_1BE19B510(a3, (uint64_t)v6);

  return v8;
}

- (id)renamed:(id)a3
{
  id v4;
  _TtC9Coherence11ObjCRenames *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BE19B8F8((uint64_t)v4);

  return v6;
}

- (id)renamedWithRange:(_NSRange)a3 replica:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _TtC9Coherence11ObjCRenames *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1BE19BE9C(location, length, (uint64_t)v7);

  return v9;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _TtC9Coherence11ObjCRenames *v5;
  void *v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence11ObjCRenames_renames);
  v3 = self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames];
  v4 = *(_QWORD *)&self->renames[OBJC_IVAR____TtC9Coherence11ObjCRenames_renames + 8];
  v5 = self;
  swift_bridgeObjectRetain();
  sub_1BE19A4D8(v2, v3, v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1BE1B27A4();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
