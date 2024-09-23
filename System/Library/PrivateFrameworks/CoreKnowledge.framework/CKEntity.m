@implementation CKEntity

- (BOOL)isEqual:(id)a3
{
  CKEntity *v4;
  CKEntity *v5;
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
  v6 = sub_1A48F57C0((uint64_t)v8);

  sub_1A48B7AE8((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  CKEntity *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1A48F5964();

  return v3;
}

- (NSString)description
{
  void *v2;

  CKEntity.identifier.getter();
  v2 = (void *)sub_1A4920D30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)valueForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  CKEntity *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  __int128 v15;
  uint64_t v16;

  v4 = sub_1A4920D3C();
  v6 = v5;
  v7 = self;
  sub_1A48F5A10(v4, v6, &v15);

  swift_bridgeObjectRelease();
  v8 = v16;
  if (!v16)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_0(&v15, v16);
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v9, v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)sub_1A492118C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v15);
  return v13;
}

- (void)valueForKey:(id)a3 completionHandler:(id)a4
{
  sub_1A48F7204(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E4D28430, (uint64_t)sub_1A48D0228, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A48F5EB0);
}

- (void)valuesForKeys:(id)a3 completionHandler:(id)a4
{
  void *v5;
  CKEntity *v6;

  v5 = _Block_copy(a4);
  sub_1A4920E74();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_1A48F5F60();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;

  v7 = _Block_copy(a5);
  swift_unknownObjectRetain();
  v8 = a4;
  self;
  sub_1A4921018();
  swift_unknownObjectRelease();
  sub_1A4920D3C();

  *(_QWORD *)(swift_allocObject() + 16) = v7;
  sub_1A48F6204();
}

- (void)setValuesForKeys:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CKEntity *v8;

  v5 = _Block_copy(a4);
  v6 = sub_1A4920CF4();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_1A48F68A8(v6, (uint64_t)sub_1A48BEAA8, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)removeValueForKey:(id)a3 completionHandler:(id)a4
{
  sub_1A48F7204(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E4D28390, (uint64_t)sub_1A48BEAA8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1A48F7054);
}

- (void)linkTo:(id)a3 withPredicate:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  CKEntity *v12;

  v7 = _Block_copy(a5);
  v8 = sub_1A4920D3C();
  v10 = v9;
  _Block_copy(v7);
  v11 = a3;
  v12 = self;
  sub_1A48F72A4(v11, v8, v10, v12, v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (BOOL)linkTo:(id)a3 withPredicate:(id)a4 error:(id *)a5
{
  id v7;
  CKEntity *v8;

  sub_1A4920D3C();
  v7 = a3;
  v8 = self;
  sub_1A48F7B94();
  swift_bridgeObjectRelease();

  return 1;
}

- (void)removeWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  CKEntity *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A48F8184((uint64_t)sub_1A48BEA9C, v5);

  swift_release();
}

- (void)linksTo:(id)a3 matchType:(int64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  CKEntity *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_1A48FAAD8(v9, a4, v10, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

}

- (id)linksTo:(id)a3 matchType:(int64_t)a4 error:(id *)a5
{
  id v6;
  CKEntity *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  sub_1A48FB888();

  v8 = (void *)sub_1A4920E68();
  swift_bridgeObjectRelease();
  return v8;
}

- (CKEntity)init
{
  CKEntity.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
