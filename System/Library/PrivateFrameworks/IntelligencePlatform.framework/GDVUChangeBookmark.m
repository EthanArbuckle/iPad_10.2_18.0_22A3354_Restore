@implementation GDVUChangeBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDataAndReturnError:(id *)a3
{
  GDVUChangeBookmark *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = self;
  v4 = GDVUChangeBookmark.encodeToData()();
  v6 = v5;

  v7 = (void *)sub_1AE92481C();
  sub_1AE50BDB4(v4, v6);
  return v7;
}

+ (id)decodeFromData:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = sub_1AE924834();
  v7 = v6;

  static GDVUChangeBookmark.decode(from:)();
  v9 = v8;
  sub_1AE50BDB4(v5, v7);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1AE8DAC84(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))GDVUChangeBookmark.isEqual(_:));
}

- (int64_t)hash
{
  GDVUChangeBookmark *v2;
  int64_t v3;

  v2 = self;
  v3 = GDVUChangeBookmark.hash.getter();

  return v3;
}

- (GDVUChangeBookmark)init
{
  GDVUChangeBookmark.init()();
}

- (void).cxx_destruct
{
  sub_1AE50BDB4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GDVUChangeBookmark_inner), *(_QWORD *)&self->inner[OBJC_IVAR___GDVUChangeBookmark_inner]);
}

@end
