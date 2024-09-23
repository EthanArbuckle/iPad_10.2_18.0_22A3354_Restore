@implementation GDBiomeStreamStoreCache

- (id)getLibraryStreamWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  GDBiomeStreamStoreCache *v6;
  void *v7;
  _QWORD v9[4];

  v5 = a3;
  v6 = self;
  sub_1C07B3D38();

  sub_1C07A9480(v9, v9[3]);
  v7 = (void *)sub_1C1070C9C();
  _s24IntelligencePlatformCore19StoredLocationVisitVwxx_0((uint64_t)v9);
  return v7;
}

- (GDBiomeStreamStoreCache)initWithStreamLookup:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  return (GDBiomeStreamStoreCache *)sub_1C08836B8((uint64_t)sub_1C07C01BC, v4);
}

- (void)clearCache
{
  GDBiomeStreamStoreCache *v2;

  v2 = self;
  sub_1C08837B8();

}

- (GDBiomeStreamStoreCache)init
{
  GDBiomeStreamStoreCache.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
