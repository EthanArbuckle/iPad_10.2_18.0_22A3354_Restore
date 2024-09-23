@implementation MAFloatVectorWrapper

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)initWithArray:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector) = (Class)sub_1CA1F0AFC();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  return -[MAFloatVectorWrapper init](&v5, sel_init);
}

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector) = (Class)MEMORY[0x1E0DEE9D8];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  return -[MAFloatVectorWrapper init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)initWithFloats:(const float *)a3 count:(int64_t)a4
{
  uint64_t ObjectType;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v7;
  uint64_t v9;

  ObjectType = swift_getObjectType();
  v9 = sub_1CA0B550C((char *)a3, a4);
  v7 = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)(*(uint64_t (**)(uint64_t *))(ObjectType + 120))(&v9);
  swift_deallocPartialClassInstance();
  return v7;
}

+ (id)zerosOfCount:(int64_t)a3
{
  int32x2_t v4;

  swift_getObjCClassMetadata();
  return (id)static MAFloatVectorWrapper.zeros(count:)(a3, v4);
}

+ (id)onesOfCount:(int64_t)a3
{
  int32x2_t v4;

  swift_getObjCClassMetadata();
  return (id)static MAFloatVectorWrapper.ones(count:)(a3, v4);
}

+ (id)repeatingFloat:(float)a3 count:(int64_t)a4
{
  int32x2_t v6;

  swift_getObjCClassMetadata();
  *(float *)v6.i32 = a3;
  return (id)static MAFloatVectorWrapper.repeating(float:count:)(a4, v6);
}

- (id)mutableCopyWithZone:(void *)a3
{
  uint64_t v3;
  char *v4;
  objc_super v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v4 = (char *)objc_allocWithZone((Class)type metadata accessor for MAMutableFloatVectorWrapper());
  *(_QWORD *)&v4[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector] = v3;
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  swift_bridgeObjectRetain();
  return -[MAFloatVectorWrapper init](&v6, sel_init);
}

- (float)floatAtIndex:(int64_t)a3
{
  float result;
  float v5;
  uint64_t v6;

  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(&v6);
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v6 + 16) > (unint64_t)a3)
  {
    v5 = *(float *)(v6 + 4 * a3 + 32);
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return result;
}

- (id)vectorBySubtractingVector:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v5;
  _QWORD *v6;

  v4 = a3;
  v5 = self;
  v6 = MAFloatVectorWrapper.vectorBySubtractingVector(_:)(v4);

  return v6;
}

- (id)vectorByAddingVector:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v5;
  _QWORD *v6;

  v4 = a3;
  v5 = self;
  v6 = MAFloatVectorWrapper.vectorByAddingVector(_:)(v4);

  return v6;
}

- (id)vectorBySubtractingScalar:(float)a3
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v3;
  id v4;

  v3 = self;
  v4 = MAFloatVectorWrapper.vectorBySubtractingScalar(_:)();

  return v4;
}

- (id)vectorByAddingScalar:(float)a3
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v3;
  id v4;

  v3 = self;
  v4 = MAFloatVectorWrapper.vectorByAddingScalar(_:)();

  return v4;
}

- (id)vectorByMultiplyingByScalar:(float)a3
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v3;
  id v4;

  v3 = self;
  v4 = MAFloatVectorWrapper.vectorByMultiplyingByScalar(_:)();

  return v4;
}

- (id)vectorByDividingByScalar:(float)a3
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v3;
  id v4;

  v3 = self;
  v4 = MAFloatVectorWrapper.vectorByDividingByScalar(_:)();

  return v4;
}

- (id)vectorByElementwiseMultiplyingByWrapper:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v5;
  _QWORD *v6;

  v4 = a3;
  v5 = self;
  v6 = MAFloatVectorWrapper.vectorByElementwiseMultiplyingByWrapper(_:)(v4);

  return v6;
}

- (id)vectorByElementwiseRaisingToExponent:(float)a3
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v4;
  id v5;

  v4 = self;
  v5 = MAFloatVectorWrapper.vectorByElementwiseRaisingToExponent(_:)(a3);

  return v5;
}

- (float)dotProductWithWrapper:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v5;
  float v6;

  v4 = a3;
  v5 = self;
  v6 = MAFloatVectorWrapper.dotProductWithWrapper(_:)(v4);

  return v6;
}

- (id)sliceFromStart:(int64_t)a3 toEnd:(int64_t)a4
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v6;
  id v7;

  v6 = self;
  v7 = MAFloatVectorWrapper.slice(from:to:)(a3, a4);

  return v7;
}

- (int64_t)count
{
  int64_t v2;
  uint64_t v4;

  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(&v4);
  v2 = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRelease();
  return v2;
}

- (float)sum
{
  return sub_1CA0B16C4(self, (uint64_t)a2, MEMORY[0x1E0C8C2E8]);
}

- (float)sumOfSquares
{
  return sub_1CA0B16C4(self, (uint64_t)a2, MEMORY[0x1E0C8C328]);
}

- (float)mean
{
  return sub_1CA0B16C4(self, (uint64_t)a2, MEMORY[0x1E0C8C1E8]);
}

- (float)standardDeviation
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v2;
  float v3;

  v2 = self;
  v3 = MAFloatVectorWrapper.standardDeviation()();

  return v3;
}

- (id)array
{
  void *v2;
  uint64_t v4;

  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(&v4);
  v2 = (void *)sub_1CA1F0AE4();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)data
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = MAFloatVectorWrapper.data()();
  v5 = v4;

  v6 = (void *)sub_1CA1F0820();
  sub_1CA0B69D0((uint64_t)v3, v5);
  return v6;
}

- (NSString)description
{
  return (NSString *)sub_1CA0B1AE0(self, (uint64_t)a2, (void (*)(uint64_t, _QWORD))MEMORY[0x1E0DEADB0]);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1CA0B1AE0(self, (uint64_t)a2, (void (*)(uint64_t, _QWORD))MEMORY[0x1E0DEADF0]);
}

- (id)naturalLogarithm
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v2;
  id v3;

  v2 = self;
  v3 = MAFloatVectorWrapper.naturalLogarithm()();

  return v3;
}

- (id)naturalLogarithmIfPositive
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v2;
  id v3;

  v2 = self;
  v3 = MAFloatVectorWrapper.naturalLogarithmIfPositive()();

  return v3;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = MAFloatVectorWrapper.isApproximatelyEqual(to:)(v4);

  return self & 1;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4
{
  _QWORD *v6;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v7;

  v6 = a3;
  v7 = self;
  LOBYTE(self) = MAFloatVectorWrapper.isApproximatelyEqual(to:epsilon:)(v6, a4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v4;
  _TtC17KnowledgeGraphKit20MAFloatVectorWrapper *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1CA1F0F04();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = MAFloatVectorWrapper.isEqual(_:)((uint64_t)v8);

  sub_1CA0B6AD4((uint64_t)v8, &qword_1ED8528F8);
  return v6;
}

- (int64_t)hash
{
  uint64_t v2;
  int64_t v3;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(&v6);
  v2 = v6;
  sub_1CA1F13F0();
  sub_1CA0B53DC((uint64_t)&v5, v2);
  v3 = sub_1CA1F1438();
  swift_bridgeObjectRelease();
  return v3;
}

@end
