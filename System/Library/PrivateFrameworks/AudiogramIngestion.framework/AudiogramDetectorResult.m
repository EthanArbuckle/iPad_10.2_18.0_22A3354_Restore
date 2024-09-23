@implementation AudiogramDetectorResult

- (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)graph
{
  return (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph);
}

- (NSArray)symbols
{
  void *v2;

  type metadata accessor for AudiogramSymbolDetectorResult();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22FB8D1C0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC18AudiogramIngestion23AudiogramDetectorResult)initWithGraph:(id)a3 symbols:(id)a4
{
  objc_class *v6;
  id v7;
  objc_super v9;

  type metadata accessor for AudiogramSymbolDetectorResult();
  v6 = (objc_class *)sub_22FB8D1D8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_graph) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion23AudiogramDetectorResult_symbols) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AudiogramDetectorResult();
  v7 = a3;
  return -[AudiogramDetectorResult init](&v9, sel_init);
}

- (_TtC18AudiogramIngestion23AudiogramDetectorResult)init
{
  _TtC18AudiogramIngestion23AudiogramDetectorResult *result;

  result = (_TtC18AudiogramIngestion23AudiogramDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
