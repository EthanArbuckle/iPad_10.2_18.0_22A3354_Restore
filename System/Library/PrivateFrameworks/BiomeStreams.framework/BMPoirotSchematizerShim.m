@implementation BMPoirotSchematizerShim

+ (id)searchValueIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  __int128 v19;
  uint64_t v20;

  v8 = a3;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  swift_getObjCClassMetadata();
  static BMPoirotSchematizerShim.searchValue(in:withFieldNumber:typeRawValue:error:)(v9, v11, a4, a5, &v19);
  outlined consume of Data._Representation(v9, v11);
  v12 = v20;
  if (!v20)
    return 0;
  v13 = __swift_project_boxed_opaque_existential_1(&v19, v20);
  v14 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v16);
  v17 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v19);
  return v17;
}

+ (id)searchValueIn:(id)a3 withFieldPath:(id)a4 typeRawValue:(int64_t)a5 error:(id *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static BMPoirotSchematizerShim.searchValue(in:withFieldPath:typeRawValue:error:)(v10, v12, v13, a5, &v21);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v10, v12);
  v14 = v22;
  if (!v22)
    return 0;
  v15 = __swift_project_boxed_opaque_existential_1(&v21, v22);
  v16 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v18);
  v19 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v21);
  return v19;
}

+ (id)searchValuesIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;

  v9 = a3;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  swift_getObjCClassMetadata();
  v13 = static BMPoirotSchematizerShim.searchValues(in:withFieldNumber:typeRawValue:error:)(v10, v12, a4, a5, (uint64_t)a6);
  outlined consume of Data._Representation(v10, v12);
  return v13;
}

- (_TtC12BiomeStreams23BMPoirotSchematizerShim)init
{
  return (_TtC12BiomeStreams23BMPoirotSchematizerShim *)BMPoirotSchematizerShim.init()();
}

@end
