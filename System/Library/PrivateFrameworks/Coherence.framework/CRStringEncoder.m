@implementation CRStringEncoder

- (void)setCharWithId:(id)a3 clock:(unsigned int)a4
{
  sub_1BDF098F8(self, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, (void (*)(char *, uint64_t))sub_1BDF093D0);
}

- (void)addAddedById:(id)a3 clock:(unsigned int)a4
{
  sub_1BDF098F8(self, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, (void (*)(char *, uint64_t))sub_1BDF09660);
}

- (void)addRemovedAddedById:(id)a3 clock:(unsigned int)a4
{
  sub_1BDF098F8(self, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, (void (*)(char *, uint64_t))sub_1BDF09678);
}

- (void)setWithLength:(unsigned int)a3
{
  char *v5;
  uint64_t v6;
  _TtC9Coherence15CRStringEncoder *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;

  v5 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringEncoder_subsequence;
  swift_beginAccess();
  v6 = *(int *)(type metadata accessor for Proto_Subsequence(0) + 20);
  v7 = self;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Proto_Subsequence._StorageClass(0);
    swift_allocObject();
    v8 = swift_retain();
    v9 = sub_1BE148B38(v8);
    swift_release();
    *(_QWORD *)&v5[v6] = v9;
    swift_release();
  }
  v10 = (unsigned int *)(*(_QWORD *)&v5[v6]
                       + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__length);
  swift_beginAccess();
  *v10 = a3;
  swift_endAccess();

}

- (void)setWithContentOptions:(int64_t)a3
{
  _TtC9Coherence15CRStringEncoder *v4;

  v4 = self;
  sub_1BDF09A98(a3);

}

- (void)addChildWithId:(unsigned int)a3
{
  _TtC9Coherence15CRStringEncoder *v4;

  v4 = self;
  sub_1BDF09BC0(a3);

}

- (void)finishSubstring
{
  _TtC9Coherence15CRStringEncoder *v2;

  v2 = self;
  sub_1BDF09D80();

}

- (BOOL)setStorage:(id)a3 error:(id *)a4
{
  return sub_1BDF0D714(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(_BYTE *))sub_1BDF0A03C);
}

- (void)setWithVersion:(id)a3
{
  id v4;
  _TtC9Coherence15CRStringEncoder *v5;

  v4 = a3;
  v5 = self;
  sub_1BDF0A1D4((uint64_t)v4);

}

- (void)setWithAddedByVersion:(id)a3
{
  id v4;
  _TtC9Coherence15CRStringEncoder *v5;

  v4 = a3;
  v5 = self;
  sub_1BDF0A234();

}

- (void)setFromVersion:(id)a3
{
  id v4;
  _TtC9Coherence15CRStringEncoder *v5;

  v4 = a3;
  v5 = self;
  sub_1BDF0A3BC((uint64_t)v4);

}

- (void)setFromAddedByVersion:(id)a3
{
  id v4;
  _TtC9Coherence15CRStringEncoder *v5;

  v4 = a3;
  v5 = self;
  sub_1BDF0A41C((uint64_t)v4);

}

- (_TtC9Coherence15CRStringEncoder)init
{
  _TtC9Coherence15CRStringEncoder *result;

  result = (_TtC9Coherence15CRStringEncoder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDF0A5F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9Coherence15CRStringEncoder_sequence, &OBJC_IVAR____TtC9Coherence15CRStringEncoder_subsequence);
}

@end
