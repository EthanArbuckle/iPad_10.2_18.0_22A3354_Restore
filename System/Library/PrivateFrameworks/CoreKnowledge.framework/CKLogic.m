@implementation CKLogic

- (int64_t)hash
{
  CKLogic *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1A48EEC1C();

  return v3;
}

- (NSString)identifier
{
  CKLogic *v2;
  void *v3;

  v2 = self;
  sub_1A48EEED4();

  v3 = (void *)sub_1A4920D30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)ifExistsLink:(id)a3 to:(id)a4
{
  return sub_1A48EF0C0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1A48EEF90);
}

- (id)andExistsLink:(id)a3 to:(id)a4 error:(id *)a5
{
  return sub_1A48EF29C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, id))sub_1A48EF020);
}

+ (id)ifNotExistsLink:(id)a3 to:(id)a4
{
  return sub_1A48EF0C0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1A48EF050);
}

- (id)andNotExistsLink:(id)a3 to:(id)a4 error:(id *)a5
{
  return sub_1A48EF29C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, id))sub_1A48EF134);
}

- (id)and:(id)a3
{
  id v4;
  CKLogic *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A48EF370();

  return v6;
}

- (CKLogic)init
{
  CKLogic.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
