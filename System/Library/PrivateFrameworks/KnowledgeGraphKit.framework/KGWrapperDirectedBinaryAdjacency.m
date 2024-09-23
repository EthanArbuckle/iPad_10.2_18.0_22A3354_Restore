@implementation KGWrapperDirectedBinaryAdjacency

- (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue) = (Class)sub_1CA0AECA8(MEMORY[0x1E0DEE9D8]);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  return -[KGWrapperDirectedBinaryAdjacency init](&v4, sel_init);
}

+ (id)identityWith:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_1CA0BD1B0(v3);

  return v4;
}

- (KGElementIdentifierSet)sources
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1CA0BBC6C();

  return (KGElementIdentifierSet *)v3;
}

- (KGElementIdentifierSet)targets
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1CA0BBD58();

  return (KGElementIdentifierSet *)v3;
}

- (int64_t)sourcesCount
{
  return (*(_QWORD **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue))[2];
}

- (id)intersectingTargetsWith:(id)a3
{
  id v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CA0BBE80(v4);

  return v6;
}

- (id)intersectingSourcesWith:(id)a3
{
  id v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CA0BBED8(v4);

  return v6;
}

- (id)subtractingTargetsWith:(id)a3
{
  id v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CA0BC038(v4);

  return v6;
}

- (id)subtractingSourcesWith:(id)a3
{
  id v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CA0BC1BC(v4);

  return v6;
}

- (id)joinOnTargetsOfAdjacency:(id)a3
{
  id v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CA0BC328((uint64_t)v4);

  return v6;
}

- (void)enumerateTargetsBySourceWith:(id)a3
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v4;
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  v4 = self;
  swift_bridgeObjectRetain();
  sub_1CA0AFCD0(&v6, (void (*)(uint64_t, void *, char *))sub_1CA0BD198);
  swift_bridgeObjectRelease();
  _Block_release(v5);

}

- (BOOL)containsSource:(unint64_t)a3 target:(unint64_t)a4
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v6;

  v6 = self;
  LOBYTE(a4) = sub_1CA0BC46C(a3, a4);

  return a4 & 1;
}

- (id)targetsForSources:(id)a3
{
  id v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CA0BC514(v4);

  return v6;
}

- (id)targetsForSourceIdentifier:(unint64_t)a3
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1CA0BC6C0(a3);

  return v5;
}

- (id)transposed
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v2;
  objc_class *v3;
  char *v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  v2 = self;
  DirectedBinaryAdjacency.transposed()();
  v3 = (objc_class *)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue] = v9;
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = -[KGWrapperDirectedBinaryAdjacency init](&v7, sel_init);

  return v5;
}

- (id)differenceWith:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v10;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  v13 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  v14 = v4;
  v5 = a3;
  v6 = self;
  swift_bridgeObjectRetain();
  ElementIdentifierTupleSet.subtract(_:)((KnowledgeGraphKit::ElementIdentifierTupleSet)&v13);
  v7 = v14;
  v8 = (objc_class *)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  v9 = (char *)objc_allocWithZone(v8);
  *(_QWORD *)&v9[OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue] = v7;
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = -[KGWrapperDirectedBinaryAdjacency init](&v12, sel_init);

  return v10;
}

- (id)unionWith:(id)a3
{
  id v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1CA0BC930((uint64_t)v4);

  return v6;
}

- (id)targetsWithMinimumCount:(unint64_t)a3
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1CA0BCA00(a3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1CA1F0F04();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1CA0BCAF8((uint64_t)v8);

  sub_1CA0BD158((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v4;
  int64_t v5;
  __int128 v7[4];

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  sub_1CA1F13F0();
  v4 = self;
  swift_bridgeObjectRetain();
  sub_1CA0F2270(v7, v3);
  v5 = sub_1CA1F1438();

  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)description
{
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v3;
  void *v4;

  sub_1CA0BD114();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_1CA1F08E0();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1CA1F0A00();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (id)mutableCopy
{
  uint64_t v2;
  char *v3;
  objc_super v5;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for KGWrapperMutableDirectedBinaryAdjacency());
  *(_QWORD *)&v3[OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue] = v2;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for KGWrapperDirectedBinaryAdjacency();
  swift_bridgeObjectRetain();
  return -[KGWrapperDirectedBinaryAdjacency init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
