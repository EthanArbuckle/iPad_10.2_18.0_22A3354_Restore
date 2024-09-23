@implementation CKPersistentStoreHandler

+ (id)inMemoryHandler
{
  id v2;

  sub_1A48C2494();
  return v2;
}

- (CKPersistentStoreHandler)init
{
  return (CKPersistentStoreHandler *)sub_1A48C2D00();
}

- (CKPersistentStoreHandler)initWithName:(id)a3
{
  CKPersistentStoreHandler *result;

  sub_1A4920D3C();
  CKPersistentStoreHandler.init(name:)();
  return result;
}

- (id)keysAndReturnError:(id *)a3
{
  return sub_1A48C409C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1A48C3830);
}

- (id)keysMatching:(id)a3 error:(id *)a4
{
  return sub_1A48C43BC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1A48C3B30);
}

- (id)valuesAndReturnError:(id *)a3
{
  return sub_1A48C409C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1A48C3D58);
}

- (id)valuesForKeysMatching:(id)a3 error:(id *)a4
{
  return sub_1A48C43BC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1A48C413C);
}

- (id)keysAndValuesAndReturnError:(id *)a3
{
  CKPersistentStoreHandler *v3;
  void *v4;

  v3 = self;
  sub_1A48C4478();

  v4 = (void *)sub_1A4920CE8();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)_valuesForKeys:(id)a3 error:(id *)a4
{
  uint64_t v5;
  CKPersistentStoreHandler *v6;
  void *v7;

  v5 = sub_1A4920E74();
  v6 = self;
  sub_1A48C53A4(v5);
  swift_bridgeObjectRelease();

  v7 = (void *)sub_1A4920E68();
  swift_bridgeObjectRelease();
  return v7;
}

- (BOOL)saveKeysAndValues:(id)a3 error:(id *)a4
{
  CKPersistentStoreHandler *v5;

  sub_1A4920CF4();
  v5 = self;
  sub_1A48C5C54();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeValueForKey:(id)a3 error:(id *)a4
{
  CKPersistentStoreHandler *v5;

  sub_1A4920D3C();
  v5 = self;
  sub_1A48C67D4();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4
{
  CKPersistentStoreHandler *v5;

  sub_1A4920E74();
  v5 = self;
  sub_1A48C6E0C();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeValuesMatching:(id)a3 error:(id *)a4
{
  id v5;
  CKPersistentStoreHandler *v6;

  v5 = a3;
  v6 = self;
  sub_1A48C70D0();

  return 1;
}

- (BOOL)removeAllValuesAndReturnError:(id *)a3
{
  CKPersistentStoreHandler *v3;

  v3 = self;
  sub_1A48C7200();

  return 1;
}

- (id)tripleComponentsMatching:(id)a3 error:(id *)a4
{
  id v6;
  CKPersistentStoreHandler *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  sub_1A48C74CC((char *)a3);

  type metadata accessor for CKTriple();
  v8 = (void *)sub_1A4920E68();
  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)setWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5 toValue:(int64_t)a6 error:(id *)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKPersistentStoreHandler *v18;

  v9 = sub_1A4920D3C();
  v11 = v10;
  v12 = sub_1A4920D3C();
  v14 = v13;
  v15 = sub_1A4920D3C();
  v17 = v16;
  v18 = self;
  sub_1A48C79D8(v9, v11, v12, v14, v15, v17, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (int64_t)increaseWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5
{
  int64_t result;

  sub_1A48C9014();
  return result;
}

- (int64_t)decreaseWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5
{
  int64_t result;

  sub_1A48C9014();
  return result;
}

- (BOOL)dropLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CKPersistentStoreHandler *v16;

  v7 = sub_1A4920D3C();
  v9 = v8;
  v10 = sub_1A4920D3C();
  v12 = v11;
  v13 = sub_1A4920D3C();
  v15 = v14;
  v16 = self;
  sub_1A48C90B0(v7, v9, v10, v12, v13, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)dropLinksWithLabel:(id)a3 from:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CKPersistentStoreHandler *v12;

  if (a3)
  {
    v6 = sub_1A4920D3C();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = sub_1A4920D3C();
  v11 = v10;
  v12 = self;
  sub_1A48C93E4(v6, v8, v9, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)dropLinksBetween:(id)a3 and:(id)a4 error:(id *)a5
{
  CKPersistentStoreHandler *v6;

  sub_1A4920D3C();
  sub_1A4920D3C();
  v6 = self;
  sub_1A48C9880();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
