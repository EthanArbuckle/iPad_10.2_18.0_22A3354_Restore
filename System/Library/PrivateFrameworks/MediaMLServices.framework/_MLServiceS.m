@implementation _MLServiceS

- (_MLServiceS)initWithNameOfModel:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _MLServiceS *v8;

  v3 = a3;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = (_MLServiceS *)_MLServiceS.init(nameOfModel:)(v4, v5);

  return v8;
}

- (void)getModelStatsWithCompletionHandler:(id)a3
{
  _MLServiceS *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  void *v8;

  v8 = _Block_copy(a3);
  v3 = self;
  if (v8)
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v8;
    v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ();
    v6 = v4;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  _MLServiceS.getModelStats(completionHandler:)((uint64_t)v5, v6);
  outlined consume of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?((uint64_t)v5);

}

- (double)getPredictionWithInputFeatures:(id)a3
{
  id v4;
  _MLServiceS *v5;
  uint64_t v7;
  double v10;

  v4 = a3;
  v5 = self;
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = _MLServiceS.getPrediction(inputFeatures:)((Swift::OpaquePointer)v7);
  swift_bridgeObjectRelease();

  return v10;
}

- (id)getPredictionDictionaryWithInputFeatures:(id)a3
{
  id v4;
  _MLServiceS *v5;
  Class isa;
  Class v8;
  uint64_t v9;
  unint64_t v12;

  v4 = a3;
  v5 = self;
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = (unint64_t)_MLServiceS.getPredictionDictionary(withInputFeatures:)((Swift::OpaquePointer)v9);
  swift_bridgeObjectRelease();

  if (v12)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = isa;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)writeWithData:(id)a3
{
  id v4;
  _MLServiceS *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _MLServiceS.write(data:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();

}

- (void)dealloc
{
  _MLServiceS *v2;

  v2 = self;
  _MLServiceS.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of String();

  outlined destroy of MLServerProtocol?();
}

- (_MLServiceS)init
{
  return (_MLServiceS *)_MLServiceS.init()();
}

@end
