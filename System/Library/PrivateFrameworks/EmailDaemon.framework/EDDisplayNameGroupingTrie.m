@implementation EDDisplayNameGroupingTrie

- (EDDisplayNameGroupingTrie)init
{
  return (EDDisplayNameGroupingTrie *)EDDisplayNameGroupingTrie.init()();
}

- (void)insertDisplayNameAndIDPairs:(id)a3
{
  unint64_t v4;
  EDDisplayNameGroupingTrie *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFCBBBC0);
  v4 = sub_1D3124EF0();
  v5 = self;
  sub_1D30EF5BC(v4);

  swift_bridgeObjectRelease();
}

- (void)insertDisplayName:(id)a3 addressID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  EDDisplayNameGroupingTrie *v10;

  v6 = sub_1D3124DE8();
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_1D30EF740(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (int64_t)count
{
  EDDisplayNameGroupingTrie *v2;
  Swift::Int v3;

  v2 = self;
  v3 = EDDisplayNameGroupingTrie.count()();

  return v3;
}

- (id)findGroups
{
  EDDisplayNameGroupingTrie *v2;
  void *v3;

  v2 = self;
  EDDisplayNameGroupingTrie.findGroups()();

  sub_1D30F3388(0, (unint64_t *)&qword_1ED11B560);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFCBBBA8);
  sub_1D30F3534();
  v3 = (void *)sub_1D3124D88();
  swift_bridgeObjectRelease();
  return v3;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
