@implementation BMPoirotSchematizerShim.BMPoirotRepeatedFieldEnumerator

- (id)nextObject
{
  _TtCC12BiomeStreams23BMPoirotSchematizerShimP33_6AF5E9B2F4D56B14EB8E6E9336EA174F31BMPoirotRepeatedFieldEnumerator *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  __int128 v10;
  uint64_t v11;

  v2 = self;
  BMPoirotSchematizerShim.BMPoirotRepeatedFieldEnumerator.nextObject()(&v10);

  v3 = v11;
  if (!v11)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(&v10, v11);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v10);
  return v8;
}

- (_TtCC12BiomeStreams23BMPoirotSchematizerShimP33_6AF5E9B2F4D56B14EB8E6E9336EA174F31BMPoirotRepeatedFieldEnumerator)init
{
  BMPoirotSchematizerShim.BMPoirotRepeatedFieldEnumerator.init()();
}

- (void).cxx_destruct
{
  outlined destroy of (key: String, value: StorableValue)((uint64_t)self+ OBJC_IVAR____TtCC12BiomeStreams23BMPoirotSchematizerShimP33_6AF5E9B2F4D56B14EB8E6E9336EA174F31BMPoirotRepeatedFieldEnumerator_iterator, &demangling cache variable for type metadata for Schematizer.RepeatableFieldIterator?);
}

@end
