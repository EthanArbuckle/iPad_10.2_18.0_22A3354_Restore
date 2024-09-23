@implementation BloomFilter

- (double)falsePositiveRate
{
  return BloomFilter.falsePositiveRate.getter();
}

- (NSString)name
{
  sub_21A3071E8();
  sub_21A450620();
  OUTLINED_FUNCTION_59_2();
  return (NSString *)self;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC13CDMFoundation11BloomFilter *v7;

  v4 = sub_21A450644();
  v6 = v5;
  v7 = self;
  sub_21A307284(v4, v6);

}

- (BOOL)containsWithData:(id)a3
{
  id v4;
  _TtC13CDMFoundation11BloomFilter *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = sub_21A44C4EC();
  v8 = v7;

  LOBYTE(v4) = sub_21A307F98(v6, v8);
  sub_21A2C91A4(v6, v8);

  return v4 & 1;
}

- (_TtC13CDMFoundation11BloomFilter)init
{
  BloomFilter.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
