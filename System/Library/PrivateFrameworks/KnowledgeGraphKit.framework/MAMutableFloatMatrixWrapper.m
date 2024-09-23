@implementation MAMutableFloatMatrixWrapper

- (_TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper)initWithRows:(id)a3
{
  uint64_t v4;
  _TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper *v5;
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

- (_TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MAFloatMatrixWrapper init](&v3, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix);
  v4 = *(_QWORD *)&self->super._floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  v5 = *(_QWORD *)&self->super._floatMatrix[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix + 8];
  v6 = (objc_class *)type metadata accessor for MAFloatMatrixWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatMatrixWrapper__floatMatrix];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v4;
  *((_QWORD *)v8 + 2) = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_bridgeObjectRetain();
  return -[MAFloatMatrixWrapper init](&v10, sel_init);
}

- (void)setFloat:(float)a3 atRow:(int64_t)a4 column:(int64_t)a5
{
  _TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper *v8;

  v8 = self;
  MAMutableFloatMatrixWrapper.setFloat(_:at:column:)(a3, a4, a5);

}

- (void)subtract:(id)a3
{
  float *v4;
  _TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper *v5;

  v4 = (float *)a3;
  v5 = self;
  MAMutableFloatMatrixWrapper.subtract(_:)(v4);

}

- (void)subtractScalar:(float)a3
{
  _TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper *v4;

  v4 = self;
  MAMutableFloatMatrixWrapper.subtract(_:)(a3);

}

- (void)addScalar:(float)a3
{
  _TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper *v4;

  v4 = self;
  MAMutableFloatMatrixWrapper.add(_:)(a3);

}

- (void)appendRow:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit27MAMutableFloatMatrixWrapper *v5;

  v4 = a3;
  v5 = self;
  MAMutableFloatMatrixWrapper.appendRow(_:)(v4);

}

@end
