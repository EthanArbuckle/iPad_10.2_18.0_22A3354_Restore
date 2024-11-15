@implementation MAMutableFloatVectorWrapper

- (_TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper)initWithArray:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector) = (Class)sub_1CA1F0AFC();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MAFloatVectorWrapper();
  return -[MAFloatVectorWrapper init](&v5, sel_init);
}

- (_TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MAFloatVectorWrapper init](&v3, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;

  v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v4 = (objc_class *)type metadata accessor for MAFloatVectorWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_bridgeObjectRetain();
  return -[MAFloatVectorWrapper init](&v7, sel_init);
}

- (void)appendFloat:(float)a3
{
  uint64_t v5;
  char *v6;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v7;
  unint64_t v8;
  unint64_t v9;

  v5 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  v6 = *(char **)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v7 = self;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = sub_1CA0E59AC(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
  v9 = *((_QWORD *)v6 + 2);
  v8 = *((_QWORD *)v6 + 3);
  if (v9 >= v8 >> 1)
    v6 = sub_1CA0E59AC((char *)(v8 > 1), v9 + 1, 1, v6);
  *((_QWORD *)v6 + 2) = v9 + 1;
  *(float *)&v6[4 * v9 + 32] = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)v6;

  swift_bridgeObjectRelease();
}

- (void)appendFloats:(const float *)a3 count:(int64_t)a4
{
  uint64_t v7;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v8;
  objc_class *v9;

  v7 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v8 = self;
  swift_bridgeObjectRetain();
  sub_1CA0B2080((char *)a3, (char *)a4);
  *(Class *)((char *)&self->super.super.isa + v7) = v9;

  swift_bridgeObjectRelease();
}

- (void)appendDoubles:(const double *)a3 count:(int64_t)a4
{
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v6;

  v6 = self;
  MAMutableFloatVectorWrapper.append(doubles:count:)((uint64_t)a3, a4);

}

- (void)appendVector:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v8;
  objc_class *v9;
  uint64_t v10;

  (*(void (**)(uint64_t *__return_ptr, _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *, SEL))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a3) + 0x70))(&v10, self, a2);
  v5 = v10;
  v6 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  sub_1CA0B223C(v5);
  *(Class *)((char *)&self->super.super.isa + v6) = v9;

  swift_bridgeObjectRelease();
}

- (void)appendArray:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v6;
  objc_class *v7;

  v4 = sub_1CA1F0AFC();
  v5 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v6 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1CA0B223C(v4);
  *(Class *)((char *)&self->super.super.isa + v5) = v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)setFloat:(float)a3 atIndex:(int64_t)a4
{
  uint64_t v7;
  char *v8;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v9;

  v7 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  v8 = *(char **)((char *)&self->super.super.isa + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v9 = self;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v8 = sub_1CA0B6080((uint64_t)v8);
  if (a4 < 0)
    goto LABEL_6;
LABEL_3:
  if (*((_QWORD *)v8 + 2) > (unint64_t)a4)
  {
    *(float *)&v8[4 * a4 + 32] = a3;
    *(Class *)((char *)&self->super.super.isa + v7) = (Class)v8;

    swift_bridgeObjectRelease();
    return;
  }
LABEL_7:
  __break(1u);
}

- (void)subtractVector:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v5;

  v4 = a3;
  v5 = self;
  MAMutableFloatVectorWrapper.subtract(_:)(v4);

}

- (void)addVector:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v5;

  v4 = a3;
  v5 = self;
  MAMutableFloatVectorWrapper.add(_:)(v4);

}

- (void)subtractScalar:(float)a3
{
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v4;

  v4 = self;
  MAMutableFloatVectorWrapper.subtract(_:)(a3);

}

- (void)addScalar:(float)a3
{
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v4;

  v4 = self;
  MAMutableFloatVectorWrapper.add(_:)(a3);

}

- (void)multiplyByScalar:(float)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v6;
  objc_class *v7;
  _QWORD v8[3];
  float v9;

  v4 = OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector;
  v5 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC17KnowledgeGraphKit20MAFloatVectorWrapper__floatVector);
  v9 = a3;
  v8[2] = &v9;
  v6 = self;
  swift_bridgeObjectRetain();
  v7 = (objc_class *)sub_1CA0B49E4((void (*)(int *__return_ptr, int *))sub_1CA0B6B10, (uint64_t)v8, v5);
  swift_bridgeObjectRelease();
  *(Class *)((char *)&self->super.super.isa + v4) = v7;

  swift_bridgeObjectRelease();
}

- (void)divideByScalar:(float)a3
{
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v4;

  v4 = self;
  MAMutableFloatVectorWrapper.divide(_:)(a3);

}

- (void)elementwiseMultiplyByWrapper:(id)a3
{
  _QWORD *v4;
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v5;

  v4 = a3;
  v5 = self;
  MAMutableFloatVectorWrapper.elementwiseMultiplyByWrapper(_:)(v4);

}

- (void)elementwiseRaiseToExponent:(float)a3
{
  _TtC17KnowledgeGraphKit27MAMutableFloatVectorWrapper *v4;

  v4 = self;
  MAMutableFloatVectorWrapper.elementwiseRaiseToExponent(_:)(a3);

}

@end
