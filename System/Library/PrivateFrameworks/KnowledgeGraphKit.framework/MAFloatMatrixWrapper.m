@implementation MAFloatMatrixWrapper

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)initWithRows:(id)a3
{
  uint64_t v4;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v5;
  char *v6;
  objc_super v8;
  uint64_t v9;
  __int128 v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8528D0);
  v4 = sub_1CA1F0AFC();
  v5 = self;
  sub_1CA151EF0(v4, &v9);
  v6 = (char *)v5 + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix;
  *(_QWORD *)v6 = v9;
  *(_OWORD *)(v6 + 8) = v10;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for MAFloatMatrixWrapper();
  return -[MAFloatMatrixWrapper init](&v8, sel_init);
}

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)init
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v2;
  __int128 v3;
  char *v4;
  objc_super v6;
  uint64_t v7;
  __int128 v8;

  v2 = self;
  sub_1CA151EF0(MEMORY[0x1E0DEE9D8], &v7);
  v3 = v8;
  v4 = (char *)v2 + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix;
  *(_QWORD *)v4 = v7;
  *(_OWORD *)(v4 + 8) = v3;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for MAFloatMatrixWrapper();
  return -[MAFloatMatrixWrapper init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)initWithFloats:(const float *)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *result;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v9;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v10;
  _QWORD v11[3];

  result = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)swift_getObjectType();
  if ((unsigned __int128)(a4 * (__int128)a5) >> 64 == (a4 * a5) >> 63)
  {
    v9 = result;
    result = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)sub_1CA0B550C((char *)a3, a4 * a5);
    if (*(_QWORD *)&result->_floatMatrix[8] == a4 * a5)
    {
      v11[0] = result;
      v11[1] = a4;
      v11[2] = a5;
      v10 = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)(*(uint64_t (**)(_QWORD *))&v9[3]._floatMatrix[16])(v11);
      swift_deallocPartialClassInstance();
      return v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

+ (id)wrapperWithData:(id)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = sub_1CA1F082C();
  v8 = v7;

  _s17KnowledgeGraphKit20MAFloatMatrixWrapperC8fromData4data4rows7columnsAC10Foundation0H0V_S2itFZ_0(v6, v8);
  v10 = v9;
  sub_1CA0B69D0(v6, v8);
  return v10;
}

+ (id)repeatingWithElement:(float)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  int64_t v5;
  id v8;
  objc_class *v9;
  char *v10;
  char *v11;
  objc_super v12;

  v5 = a4 * a5;
  if ((unsigned __int128)(a4 * (__int128)a5) >> 64 == (a4 * a5) >> 63)
  {
    result = (id)sub_1CA0B4560(a4 * a5, *(int32x2_t *)&a3);
    if (*((_QWORD *)result + 2) == v5)
    {
      v8 = result;
      v9 = (objc_class *)type metadata accessor for MAFloatMatrixWrapper();
      v10 = (char *)objc_allocWithZone(v9);
      v11 = &v10[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
      *(_QWORD *)v11 = v8;
      *((_QWORD *)v11 + 1) = a4;
      *((_QWORD *)v11 + 2) = a5;
      v12.receiver = v10;
      v12.super_class = v9;
      return objc_msgSendSuper2(&v12, sel_init);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

+ (id)zerosWithRows:(int64_t)a3 columns:(int64_t)a4
{
  int32x2_t v6;

  swift_getObjCClassMetadata();
  return (id)static MAFloatMatrixWrapper.zeros(rows:columns:)(a3, a4, v6);
}

+ (id)onesWithRows:(int64_t)a3 columns:(int64_t)a4
{
  int32x2_t v6;

  swift_getObjCClassMetadata();
  return (id)static MAFloatMatrixWrapper.ones(rows:columns:)(a3, a4, v6);
}

- (id)mutableCopyWithZone:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  objc_super v9;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix);
  v4 = *(_QWORD *)&self->_floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  v5 = *(_QWORD *)&self->_floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix + 8];
  v6 = (char *)objc_allocWithZone((Class)type metadata accessor for MAMutableFloatMatrixWrapper());
  v7 = &v6[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  *(_QWORD *)v7 = v3;
  *((_QWORD *)v7 + 1) = v4;
  *((_QWORD *)v7 + 2) = v5;
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for MAFloatMatrixWrapper();
  swift_bridgeObjectRetain();
  return -[MAFloatMatrixWrapper init](&v9, sel_init);
}

- (float)floatAtRow:(int64_t)a3 column:(int64_t)a4
{
  float result;
  int64_t v8;
  unint64_t v9;
  float v10;
  _QWORD v11[2];
  int64_t v12;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(v11);
  if (v11[1] < a3 || v12 <= a4)
  {
    __break(1u);
    goto LABEL_11;
  }
  v8 = a3 * v12;
  if ((unsigned __int128)(a3 * (__int128)v12) >> 64 != (a3 * v12) >> 63)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v9 = v8 + a4;
  if (__OFADD__(v8, a4))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v9 < *(_QWORD *)(v11[0] + 16))
  {
    v10 = *(float *)(v11[0] + 4 * v9 + 32);
    swift_bridgeObjectRelease();
    return v10;
  }
LABEL_14:
  __break(1u);
  return result;
}

- (id)row:(int64_t)a3
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v4;
  id v5;

  v4 = self;
  v5 = MAFloatMatrixWrapper.vector(_:)(a3);

  return v5;
}

- (int64_t)count
{
  int64_t v2;
  _QWORD v4[3];

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(v4);
  v2 = *(_QWORD *)(v4[0] + 16);
  swift_bridgeObjectRelease();
  return v2;
}

- (int64_t)rows
{
  int64_t v2;
  _QWORD v4[3];

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(v4);
  v2 = v4[1];
  swift_bridgeObjectRelease();
  return v2;
}

- (int64_t)columns
{
  int64_t v2;
  _QWORD v4[3];

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70))(v4);
  v2 = v4[2];
  swift_bridgeObjectRelease();
  return v2;
}

- (float)sum
{
  return sub_1CA0F6080(self, (uint64_t)a2, MEMORY[0x1E0C8C2E8]);
}

- (float)sumOfSquares
{
  return sub_1CA0F6080(self, (uint64_t)a2, MEMORY[0x1E0C8C328]);
}

- (float)mean
{
  return sub_1CA0F6080(self, (uint64_t)a2, MEMORY[0x1E0C8C1E8]);
}

- (id)array
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v2;
  void *v3;

  v2 = self;
  MAFloatMatrixWrapper.array()();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8528D0);
  v3 = (void *)sub_1CA1F0AE4();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)data
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = MAFloatMatrixWrapper.data()();
  v5 = v4;

  v6 = (void *)sub_1CA1F0820();
  sub_1CA0B69D0((uint64_t)v3, v5);
  return v6;
}

- (NSString)description
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v2;
  void *v3;

  v2 = self;
  MAFloatMatrixWrapper.description.getter();

  v3 = (void *)sub_1CA1F0A00();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)matrixBySubtractingMatrix:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v5;
  _QWORD *v6;

  v4 = a3;
  v5 = self;
  v6 = MAFloatMatrixWrapper.matrixBySubtractingMatrix(_:)(v4);

  return v6;
}

- (id)matrixBySubtractingScalar:(float)a3
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v3;
  id v4;

  v3 = self;
  v4 = MAFloatMatrixWrapper.matrixBySubtractingScalar(_:)();

  return v4;
}

- (id)matrixByAddingScalar:(float)a3
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v3;
  id v4;

  v3 = self;
  v4 = MAFloatMatrixWrapper.matrixByAddingScalar(_:)();

  return v4;
}

- (id)sumAlongAxis:(unint64_t)a3
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v4;
  id v5;

  v4 = self;
  v5 = MAFloatMatrixWrapper.sumAlongAxis(_:)(a3);

  return v5;
}

- (id)meanAlongAxis:(unint64_t)a3
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v4;
  id v5;

  v4 = self;
  v5 = MAFloatMatrixWrapper.meanAlongAxis(_:)(a3);

  return v5;
}

- (id)matrixByAppendingColumnVector:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v5;
  _QWORD *v6;

  v4 = a3;
  v5 = self;
  v6 = MAFloatMatrixWrapper.appendingColumn(_:)(v4);

  return v6;
}

- (id)matrixByAppendingColumnsOfMatrix:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = MAFloatMatrixWrapper.appendingColumns(of:)(v4);

  return v6;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = MAFloatMatrixWrapper.isApproximatelyEqual(to:)(v4);

  return self & 1;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4
{
  _QWORD *v6;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v7;

  v6 = a3;
  v7 = self;
  LOBYTE(self) = MAFloatMatrixWrapper.isApproximatelyEqual(to:epsilon:)(v6, a4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v4;
  _TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *v5;
  char v6;
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
  v6 = MAFloatMatrixWrapper.isEqual(_:)((uint64_t)v8);

  sub_1CA0BD158((uint64_t)v8);
  return v6 & 1;
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
  sub_1CA1F13FC();
  sub_1CA1F13FC();
  v3 = sub_1CA1F1438();
  swift_bridgeObjectRelease();
  return v3;
}

@end
