@implementation NBObjCHashBucketer

- (NBObjCHashBucketer)init
{
  return (NBObjCHashBucketer *)sub_1ABFB85E0((char *)self, (uint64_t)a2, &OBJC_IVAR___NBObjCHashBucketer_hashBucketer, (void (*)(_QWORD))type metadata accessor for HashBucketer);
}

- (int64_t)bucketForHash:(id)a3 bucketCount:(int64_t)a4
{
  id v5;
  NBObjCHashBucketer *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;

  v5 = a3;
  v6 = self;
  v7 = sub_1ABFBC5EC();
  v9 = v8;

  _s13NewsURLBucket12HashBucketerC6bucket3for0E5CountSi10Foundation4DataV_SitF_0(v7, v9);
  v11 = v10;
  sub_1ABFB8DCC(v7, v9);

  return v11;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
