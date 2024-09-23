@implementation CHCalculateWrapper

+ (id)textTranscriptionForLatex:(id)a3
{
  void *v3;

  sub_1BE8C7D34();
  sub_1BE60ADFC();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1BE8C7D10();
  swift_bridgeObjectRelease();
  return v3;
}

+ (BOOL)isTextTranscriptionUnitConversion:(id)a3 locales:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_1BE8C7D34();
  v6 = v5;
  sub_1BE8C7BB4();
  v7 = sub_1BE8C7D64();
  LOBYTE(v4) = sub_1BE60AFB4(v4, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

+ (BOOL)isLatexTranscriptionValidExpression:(id)a3
{
  char v3;

  sub_1BE8C7D34();
  v3 = sub_1BE60B164();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (CHCalculateWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CHCalculateWrapper();
  return -[CHCalculateWrapper init](&v3, sel_init);
}

@end
