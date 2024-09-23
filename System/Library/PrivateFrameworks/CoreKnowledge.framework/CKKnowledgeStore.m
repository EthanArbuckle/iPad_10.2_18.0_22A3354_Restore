@implementation CKKnowledgeStore

- (id)writeBatch
{
  CKKnowledgeStore *v2;
  void *v3;

  v2 = self;
  v3 = (void *)CKKnowledgeStore.writeBatch()();

  return v3;
}

- (void)setValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  CKKnowledgeStore *v10;
  id v11;
  CKKnowledgeStore *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _OWORD v16[2];

  v8 = _Block_copy(a5);
  if (a3)
  {
    v9 = a4;
    v10 = self;
    swift_unknownObjectRetain();
    sub_1A4921018();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v11 = a4;
    v12 = self;
  }
  v13 = sub_1A4920D3C();
  v15 = v14;

  _Block_copy(v8);
  sub_1A48BBFE4((uint64_t)v16, v13, v15, self, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  sub_1A48B7AE8((uint64_t)v16);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  CKKnowledgeStore *v7;
  id v8;
  CKKnowledgeStore *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _OWORD v13[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1A4921018();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v8 = a4;
    v9 = self;
  }
  v10 = sub_1A4920D3C();
  v12 = v11;

  CKKnowledgeStore.setValue(_:forKey:)((uint64_t)v13, v10, v12);
  swift_bridgeObjectRelease();
  sub_1A48B7AE8((uint64_t)v13);
}

- (void)removeEntity:(id)a3 completionHandler:(id)a4
{
  sub_1A48BD3B8(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E4D25348, (uint64_t)sub_1A48BEAA8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))CKKnowledgeStore.removeEntity(_:completionHandler:));
}

- (BOOL)removeEntity:(id)a3 error:(id *)a4
{
  return sub_1A48BD6B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.removeEntity(_:));
}

- (void)removeValueForKey:(id)a3 completionHandler:(id)a4
{
  sub_1A48BD3B8(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E4D25320, (uint64_t)sub_1A48BEAA8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))CKKnowledgeStore.removeValue(forKey:completionHandler:));
}

- (BOOL)removeValueForKey:(id)a3 error:(id *)a4
{
  return sub_1A48BD6B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.removeValue(forKey:));
}

- (void)removeValuesForKeys:(id)a3 completionHandler:(id)a4
{
  void *v5;
  CKKnowledgeStore *v6;

  v5 = _Block_copy(a4);
  sub_1A4920E74();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  CKKnowledgeStore.removeValues(forKeys:completionHandler:)();

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4
{
  uint64_t v6;
  CKKnowledgeStore *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_1A4920E74();
  v7 = self;
  CKKnowledgeStore.removeValues(forKeys:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();

  if (v8)
  {
    if (a4)
    {
      v9 = (void *)sub_1A4920AB4();

      v10 = v9;
      *a4 = v9;
    }
    else
    {

    }
  }
  return v8 == 0;
}

- (void)removeValuesMatching:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  CKKnowledgeStore *v8;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = self;
  CKKnowledgeStore.removeValues(matching:completionHandler:)();

  swift_release();
}

- (BOOL)removeValuesMatching:(id)a3 error:(id *)a4
{
  id v5;
  CKKnowledgeStore *v6;

  v5 = a3;
  v6 = self;
  CKKnowledgeStore.removeValues(matching:)();

  return 1;
}

- (void)removeAllValuesWithCompletionHandler:(id)a3
{
  sub_1A48BE174(self, (int)a2, a3, (uint64_t)&unk_1E4D252A8, (uint64_t)sub_1A48BEAA8, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.removeAllValues(completionHandler:));
}

- (BOOL)removeAllValuesAndReturnError:(id *)a3
{
  CKKnowledgeStore *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  CKKnowledgeStore.removeAllValues()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_1A4920AB4();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  sub_1A48BE174(self, (int)a2, a3, (uint64_t)&unk_1E4D25280, (uint64_t)sub_1A48BEA9C, CKKnowledgeStore.disableSyncAndDeleteCloudData(completionHandler:));
}

- (void)dictionaryRepresentationWithCompletionHandler:(id)a3
{
  sub_1A48CF924(self, (int)a2, a3, (uint64_t)&unk_1E4D25C08, (uint64_t)sub_1A48D0290, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.dictionaryRepresentation(completionHandler:));
}

- (id)dictionaryRepresentationAndReturnError:(id *)a3
{
  CKKnowledgeStore *v3;
  void *v4;

  v3 = self;
  CKKnowledgeStore.dictionaryRepresentation()();

  v4 = (void *)sub_1A4920CE8();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)dictionaryRepresentationForKeysMatching:(id)a3 completionHandler:(id)a4
{
  sub_1A48CF4A4(self, (int)a2, a3, a4, (uint64_t)&unk_1E4D25BE0, (uint64_t)sub_1A48D0238, (void (*)(id, uint64_t, uint64_t))CKKnowledgeStore.dictionaryRepresentation(forKeysMatching:completionHandler:));
}

- (id)dictionaryRepresentationForKeysMatching:(id)a3 error:(id *)a4
{
  id v5;
  CKKnowledgeStore *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  CKKnowledgeStore.dictionaryRepresentation(forKeysMatching:)();

  v7 = (void *)sub_1A4920CE8();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)keysWithCompletionHandler:(id)a3
{
  sub_1A48CF924(self, (int)a2, a3, (uint64_t)&unk_1E4D25BB8, (uint64_t)sub_1A48D028C, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.keys(completionHandler:));
}

- (id)keysAndReturnError:(id *)a3
{
  return sub_1A48C409C(self, (uint64_t)a2, (uint64_t)a3, CKKnowledgeStore.keys());
}

- (void)keysMatching:(id)a3 completionHandler:(id)a4
{
  sub_1A48CF4A4(self, (int)a2, a3, a4, (uint64_t)&unk_1E4D25B90, (uint64_t)sub_1A48D0230, (void (*)(id, uint64_t, uint64_t))CKKnowledgeStore.keys(matching:completionHandler:));
}

- (id)keysMatching:(id)a3 error:(id *)a4
{
  return sub_1A48C43BC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKKnowledgeStore.keys(matching:));
}

- (void)valuesWithCompletionHandler:(id)a3
{
  sub_1A48CF924(self, (int)a2, a3, (uint64_t)&unk_1E4D25B68, (uint64_t)sub_1A48D0288, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.values(completionHandler:));
}

- (id)valuesAndReturnError:(id *)a3
{
  return sub_1A48C409C(self, (uint64_t)a2, (uint64_t)a3, CKKnowledgeStore.values());
}

- (void)valueForKey:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CKKnowledgeStore *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1A4920D3C();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  CKKnowledgeStore.value(forKey:completionHandler:)(v6, v8, (uint64_t)sub_1A48D0228, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (id)valueForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CKKnowledgeStore *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD v15[3];
  uint64_t v16;

  v4 = sub_1A4920D3C();
  v6 = v5;
  v7 = self;
  CKKnowledgeStore.value(forKey:)(v4, v6);

  swift_bridgeObjectRelease();
  v8 = v16;
  if (!v16)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_0(v15, v16);
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v9, v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)sub_1A492118C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v13;
}

- (void)valuesForKeys:(id)a3 completionHandler:(id)a4
{
  void *v5;
  CKKnowledgeStore *v6;

  v5 = _Block_copy(a4);
  sub_1A4920E74();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  CKKnowledgeStore.values(forKeys:completionHandler:)();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)valuesForKeysMatching:(id)a3 completionHandler:(id)a4
{
  sub_1A48CF4A4(self, (int)a2, a3, a4, (uint64_t)&unk_1E4D25AF0, (uint64_t)sub_1A48D0220, (void (*)(id, uint64_t, uint64_t))CKKnowledgeStore.values(forKeysMatching:completionHandler:));
}

- (id)valuesForKeysMatching:(id)a3 error:(id *)a4
{
  return sub_1A48C43BC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKKnowledgeStore.values(forKeysMatching:));
}

- (id)entityWithIdentifier:(id)a3
{
  CKKnowledgeStore *v4;
  id v5;

  sub_1A4920D3C();
  v4 = self;
  v5 = CKKnowledgeStore.entity(withIdentifier:)();

  swift_bridgeObjectRelease();
  return v5;
}

- (void)entitiesWithCompletionHandler:(id)a3
{
  sub_1A48CF924(self, (int)a2, a3, (uint64_t)&unk_1E4D25AC8, (uint64_t)sub_1A48D0200, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.entities(completionHandler:));
}

- (id)entitiesAndReturnError:(id *)a3
{
  CKKnowledgeStore *v3;
  void *v4;

  v3 = self;
  CKKnowledgeStore.entities()();

  type metadata accessor for CKEntity();
  v4 = (void *)sub_1A4920E68();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)triplesMatching:(id)a3 error:(id *)a4
{
  id v5;
  CKKnowledgeStore *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  CKKnowledgeStore.triples(matching:)();

  type metadata accessor for CKTriple();
  v7 = (void *)sub_1A4920E68();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)triplesMatching:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  CKKnowledgeStore *v8;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = self;
  CKKnowledgeStore.triples(matching:completionHandler:)();

  swift_release();
}

- (id)subgraphWithEntities:(id)a3
{
  uint64_t v4;
  CKKnowledgeStore *v5;
  id v6;

  v4 = sub_1A4920E74();
  v5 = self;
  v6 = CKKnowledgeStore.subgraph(withEntities:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)importContentsOfJSONLDAtPath:(id)a3 completionHandler:(id)a4
{
  void *v5;
  CKKnowledgeStore *v6;

  v5 = _Block_copy(a4);
  sub_1A4920D3C();
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v5 = sub_1A48BEA9C;
  }
  v6 = self;
  CKKnowledgeStore.importContentsOfJSONLD(atPath:completionHandler:)();
  sub_1A48E3A30((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (BOOL)inferLinkTo:(id)a3 withPredicate:(id)a4 when:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  CKKnowledgeStore *v14;

  v9 = sub_1A4920D3C();
  v11 = v10;
  v12 = a3;
  v13 = a5;
  v14 = self;
  CKKnowledgeStore.inferLink(to:withPredicate:when:)(v12, v9, v11, v13);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)inferLinkTo:(id)a3 withPredicate:(id)a4 when:(id)a5 completionHandler:(id)a6
{
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  _QWORD *v14;
  CKKnowledgeStore *v15;

  v9 = _Block_copy(a6);
  v10 = (_QWORD *)sub_1A4920D3C();
  v12 = v11;
  _Block_copy(v9);
  v13 = a3;
  v14 = a5;
  v15 = self;
  sub_1A48EF908(v13, v10, v12, v14, v15, (void (**)(_QWORD, _QWORD))v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (CKKnowledgeStoreDelegate)delegate
{
  id v2;

  sub_1A48FD2AC();
  return (CKKnowledgeStoreDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  CKKnowledgeStore *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A48FD2E4();

}

- (NSString)name
{
  CKKnowledgeStore *v2;
  void *v3;

  v2 = self;
  sub_1A48FD410();

  v3 = (void *)sub_1A4920D30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)directoryURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE77C760);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CKKnowledgeStore.directory()((uint64_t)v5);
  v6 = sub_1A4920B14();
  v7 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) != 1)
  {
    v7 = (void *)sub_1A4920AD8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  return v7;
}

- (NSURL)filePathURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  CKKnowledgeStore *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE77C760);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1A48FD454((uint64_t)v6);

  v8 = sub_1A4920B14();
  v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    v9 = (void *)sub_1A4920AD8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  return (NSURL *)v9;
}

- (int64_t)hash
{
  CKKnowledgeStore *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1A48FE078();
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKKnowledgeStore *v4;
  CKKnowledgeStore *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A4921018();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A48FE0B8((uint64_t)v8);

  sub_1A48CC0BC((uint64_t)v8, &qword_1ED0C7AB0);
  return v6 & 1;
}

+ (id)defaultKnowledgeStore
{
  id v2;

  sub_1A48FD64C();
  return v2;
}

+ (id)defaultSynchedKnowledgeStore
{
  id v2;

  sub_1A48FD668();
  return v2;
}

+ (id)inMemoryKnowledgeStore
{
  return sub_1A48FD684();
}

+ (id)userDefaultsKnowledgeStore
{
  return sub_1A48FD6B4();
}

+ (CKKnowledgeStore)knowledgeStoreWithName:(id)a3
{
  return (CKKnowledgeStore *)sub_1A48FE2A8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1A48FD6EC);
}

+ (id)synchedKnowledgeStoreWithName:(id)a3
{
  return sub_1A48FE2A8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1A48FD7D4);
}

- (CKKnowledgeStore)init
{
  CKKnowledgeStore.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CKKnowledgeStore_backingStore);

  sub_1A48EE84C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKKnowledgeStore_location), *(_QWORD *)&self->backingStore[OBJC_IVAR___CKKnowledgeStore_location], self->backingStore[OBJC_IVAR___CKKnowledgeStore_location + 8]);
  sub_1A48FEFA4((uint64_t)self + OBJC_IVAR___CKKnowledgeStore_delegate);
}

@end
