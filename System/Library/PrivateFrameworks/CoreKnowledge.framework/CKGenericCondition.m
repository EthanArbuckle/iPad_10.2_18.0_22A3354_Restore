@implementation CKGenericCondition

- (NSPredicate)predicate
{
  CKGenericCondition *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1A48E6D74();
  v4 = v3;

  return (NSPredicate *)v4;
}

- (NSString)description
{
  return (NSString *)sub_1A48DC34C(self, (uint64_t)a2, (void (*)(void))sub_1A48E6F40);
}

- (CKGenericCondition)initWithValue:(BOOL)a3
{
  return (CKGenericCondition *)CKGenericCondition.init(value:)(a3);
}

- (CKGenericCondition)initWithMatchType:(int64_t)a3 value:(id)a4 negated:(BOOL)a5
{
  CKGenericCondition *result;

  sub_1A4920D3C();
  CKGenericCondition.init(_:value:negated:)();
  return result;
}

- (id)and:(id)a3
{
  id v4;
  CKGenericCondition *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1A48E7240(v4);
  v7 = v6;

  return v7;
}

- (id)or:(id)a3
{
  id v4;
  CKGenericCondition *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1A48E72F8(v4);
  v7 = v6;

  return v7;
}

- (BOOL)evaluateOn:(id)a3
{
  CKGenericCondition *v4;
  CKGenericCondition *v5;
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
  v6 = sub_1A48E7620((uint64_t)v8);

  sub_1A48CC0BC((uint64_t)v8, &qword_1ED0C7AB0);
  return v6 & 1;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1A48E9F38(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_1A48E78C8);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static CKGenericCondition.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static CKGenericCondition.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKGenericCondition *v5;

  v4 = a3;
  v5 = self;
  sub_1A48E7A3C(v4);

}

- (CKGenericCondition)initWithCoder:(id)a3
{
  CKGenericCondition *result;

  CKGenericCondition.init(coder:)(a3);
  return result;
}

- (CKGenericCondition)init
{
  CKGenericCondition.init()();
}

- (void).cxx_destruct
{
  sub_1A48E9B20(*(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKGenericCondition_type), *(void **)&self->type[OBJC_IVAR___CKGenericCondition_type], *(void **)&self->type[OBJC_IVAR___CKGenericCondition_type + 8]);
  swift_bridgeObjectRelease();
}

@end
