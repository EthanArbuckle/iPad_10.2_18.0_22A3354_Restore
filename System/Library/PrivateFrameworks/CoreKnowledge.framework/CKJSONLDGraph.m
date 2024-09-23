@implementation CKJSONLDGraph

- (CKJSONLDGraph)initWithEntities:(id)a3
{
  uint64_t v3;

  if (a3)
  {
    type metadata accessor for CKEntity();
    v3 = sub_1A4920E74();
  }
  else
  {
    v3 = 0;
  }
  return (CKJSONLDGraph *)CKJSONLDGraph.init(withEntities:)(v3);
}

- (NSArray)entities
{
  CKJSONLDGraph *v2;
  void *v3;

  v2 = self;
  sub_1A48DED80();

  v3 = (void *)sub_1A4920E68();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)linkedDataWithCompletionHandler:(id)a3
{
  void *v4;
  CKJSONLDGraph *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_1A48DEEF4();

  swift_release();
}

- (CKJSONLDGraph)init
{
  CKJSONLDGraph.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
