@implementation GDVUGalleryTransaction

- (BOOL)addWithObservation:(id)a3 context:(id)a4 priority:(int64_t)a5 at:(int64_t)a6 output:(int64_t *)a7 error:(id *)a8
{
  id v10;
  id v11;
  GDVUGalleryTransaction *v12;

  v10 = a3;
  v11 = a4;
  v12 = self;
  GDVUGalleryTransaction.add(with:context:priority:at:output:)();

  return 1;
}

- (BOOL)remove:(int64_t)a3 error:(id *)a4
{
  return sub_1AE8D9934(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))GDVUGalleryTransaction.remove(_:));
}

- (BOOL)removeWithAsset:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  GDVUGalleryTransaction *v9;
  uint64_t v11;

  v5 = sub_1AE924918();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AE924900();
  v9 = self;
  GDVUGalleryTransaction.remove(withAsset:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)tag:(int64_t)a3 with:(id)a4 type:(int64_t)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  GDVUGalleryTransaction *v13;
  uint64_t v15;

  v9 = sub_1AE924918();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AE924900();
  v13 = self;
  GDVUGalleryTransaction.tag(_:with:type:)(a3, (uint64_t)v12, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return 1;
}

- (BOOL)untag:(int64_t)a3 error:(id *)a4
{
  return sub_1AE8D9934(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))GDVUGalleryTransaction.untag(_:));
}

- (GDVUGalleryTransaction)init
{
  GDVUGalleryTransaction.init()();
}

- (void).cxx_destruct
{
  sub_1AE501338();
}

@end
