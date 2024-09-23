@implementation BloomFilterObjectiveCHelper

- (id)getDecodedBFWithData:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = OUTLINED_FUNCTION_7_17((uint64_t)self, (uint64_t)a2, a3);
  v6 = v4;
  sub_21A352548();
  v8 = v7;

  return OUTLINED_FUNCTION_1_21(v8);
}

- (id)getDecodedBFArrayWithData:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  id v6;
  void *v7;

  v5 = OUTLINED_FUNCTION_7_17((uint64_t)self, (uint64_t)a2, a3);
  v6 = v4;
  sub_21A352670();

  type metadata accessor for BloomFilter();
  v7 = (void *)sub_21A450830();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_1_21(v7);
}

- (_TtC13CDMFoundation27BloomFilterObjectiveCHelper)init
{
  return (_TtC13CDMFoundation27BloomFilterObjectiveCHelper *)BloomFilterObjectiveCHelper.init()();
}

@end
