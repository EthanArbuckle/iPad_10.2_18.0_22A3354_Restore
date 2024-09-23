@implementation ICHTMLSearchIndexerDataSource(App)

- (id)mainThreadContext
{
  id v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  void (*v6)(uint64_t);
  id v7;

  v2 = 0;
  v3 = &v2;
  v4 = 0x3032000000;
  v5 = __Block_byref_object_copy__8;
  v6 = __Block_byref_object_dispose__8;
  v7 = 0;
  performBlockOnMainThreadAndWait();
  v0 = (id)v3[5];
  _Block_object_dispose(&v2, 8);

  return v0;
}

@end
