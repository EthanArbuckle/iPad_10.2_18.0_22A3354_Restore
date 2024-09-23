@implementation CKTriple

- (NSString)subject
{
  return (NSString *)sub_1A48DC34C(self, (uint64_t)a2, (void (*)(void))sub_1A48DC22C);
}

- (NSString)predicate
{
  return (NSString *)sub_1A48DC34C(self, (uint64_t)a2, sub_1A48DC270);
}

- (NSString)object
{
  return (NSString *)sub_1A48DC34C(self, (uint64_t)a2, sub_1A48DC2C4);
}

- (int64_t)weight
{
  return sub_1A48DC32C();
}

- (NSString)description
{
  return (NSString *)sub_1A48DC34C(self, (uint64_t)a2, (void (*)(void))sub_1A48DC3A0);
}

- (int64_t)hash
{
  CKTriple *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1A48DC4D8();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CKTriple *v4;
  CKTriple *v5;
  char v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A4921018();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  sub_1A48DC544((uint64_t)v9);
  v7 = v6;

  sub_1A48B7AE8((uint64_t)v9);
  return v7 & 1;
}

- (CKTriple)initWithSubject:(id)a3 predicate:(id)a4 object:(id)a5 weight:(int64_t)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_1A4920D3C();
  v9 = v8;
  v10 = sub_1A4920D3C();
  v12 = v11;
  v13 = sub_1A4920D3C();
  return (CKTriple *)CKTriple.init(subject:predicate:object:weight:)(v7, v9, v10, v12, v13, v14, a6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKTriple *v5;

  v4 = a3;
  v5 = self;
  sub_1A48DC934(v4);

}

- (CKTriple)initWithCoder:(id)a3
{
  CKTriple *result;

  CKTriple.init(coder:)(a3);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKTriple)init
{
  CKTriple.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
  swift_bridgeObjectRelease();
}

@end
