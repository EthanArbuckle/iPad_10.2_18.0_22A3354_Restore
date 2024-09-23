@implementation _SwiftPanicCriterials

- (_SwiftPanicCriterials)initWithCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _SwiftPanicCriterials *result;

  v6 = sub_2390F92B4();
  v8 = v7;
  v9 = sub_2390F92B4();
  v11 = v10;
  v12 = sub_2390F92B4();
  v14 = v13;
  v15 = sub_2390F92B4();
  PanicCriterials.init(id:type:path:panicString:)(v6, v8, v9, v11, v12, v14, v15, v16);
  return result;
}

- (_SwiftPanicCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5
{
  _SwiftPanicCriterials *result;

  result = (_SwiftPanicCriterials *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
