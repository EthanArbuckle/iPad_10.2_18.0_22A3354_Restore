@implementation KGWrapperMutableDirectedBinaryAdjacency

- (void)insertSource:(unint64_t)a3 target:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a4;
  v5 = a3;
  ElementIdentifierTupleSet.insert(_:)(&v7, &v6, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)removeSource:(unint64_t)a3 target:(unint64_t)a4
{
  Swift::tuple_KnowledgeGraphKit_ElementIdentifier_KnowledgeGraphKit_ElementIdentifier v4;
  unint64_t v5;
  unint64_t v6;

  v5 = a4;
  v6 = a3;
  v4._0.rawValue = (Swift::UInt)&v6;
  v4._1.rawValue = (Swift::UInt)&v5;
  ElementIdentifierTupleSet.remove(_:)(v4);
}

- (void)formUnionWith:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  swift_bridgeObjectRetain();
  ElementIdentifierTupleSet.formUnion(_:)(&v3);
}

- (void)subtract:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency_wrappedValue);
  ElementIdentifierTupleSet.subtract(_:)((KnowledgeGraphKit::ElementIdentifierTupleSet)&v3);
}

- (void)setTargets:(id)a3 forSource:(unint64_t)a4
{
  id v6;
  _TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency *v7;

  v6 = a3;
  v7 = self;
  sub_1CA0BCF04(v6, a4);

}

- (void)removeTargetsForSource:(unint64_t)a3
{
  _TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency *v4;
  uint64_t v5;

  v4 = self;
  sub_1CA0F1680(a3, &v5);

  swift_release();
}

- (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[KGWrapperDirectedBinaryAdjacency init](&v3, sel_init);
}

@end
