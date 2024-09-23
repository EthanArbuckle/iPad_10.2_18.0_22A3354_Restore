@implementation CKTripleCondition

- (NSString)description
{
  return (NSString *)sub_1A48DC34C(self, (uint64_t)a2, sub_1A48E8268);
}

- (CKTripleCondition)initWithValue:(BOOL)a3
{
  CKTripleCondition *result;

  CKTripleCondition.init(value:)(a3);
  return result;
}

- (CKTripleCondition)initWithSubject:(id)a3 predicate:(id)a4 object:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (uint64_t)a4;
  if (a3)
  {
    v7 = sub_1A4920D3C();
    v9 = v8;
    if (v6)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    v14 = 0;
    return (CKTripleCondition *)CKTripleCondition.init(subject:predicate:object:)(v7, v9, v6, v11, v12, v14);
  }
  v7 = 0;
  v9 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v6 = sub_1A4920D3C();
  v11 = v10;
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v12 = sub_1A4920D3C();
  v14 = v13;
  return (CKTripleCondition *)CKTripleCondition.init(subject:predicate:object:)(v7, v9, v6, v11, v12, v14);
}

- (id)and:(id)a3
{
  id v4;
  CKTripleCondition *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1A48E9C54();
  v7 = v6;

  return v7;
}

- (id)or:(id)a3
{
  id v4;
  CKTripleCondition *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1A48E9D10();
  v7 = v6;

  return v7;
}

- (BOOL)evaluateOn:(id)a3
{
  CKTripleCondition *v5;
  char v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1A48E9DCC((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1A48E9F38(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_1A48E9EC0);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static CKTripleCondition.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static CKTripleCondition.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKTripleCondition *v5;

  v4 = a3;
  v5 = self;
  sub_1A48EA06C(v4);

}

- (CKTripleCondition)initWithCoder:(id)a3
{
  CKTripleCondition *result;

  CKTripleCondition.init(coder:)((objc_class *)a3);
  return result;
}

- (CKTripleCondition)init
{
  CKTripleCondition.init()();
}

- (void).cxx_destruct
{

}

+ (id)havingPredicate:(id)a3 matchType:(int64_t)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = sub_1A4920D3C();
  static CKTripleCondition.havingPredicate(_:matchType:)(v6, v7, a4);
  v9 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

+ (id)havingSubject:(id)a3 andAbject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  static CKTripleCondition.havingSubject(_:andAbject:)();
  v8 = v7;

  return v8;
}

@end
