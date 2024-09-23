@implementation _DPPrio3SumVectorParameter

- (int64_t)bitWidth
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth);
}

- (int64_t)numOfAggregators
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators);
}

- (int64_t)numberOfProofs
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs);
}

- (unsigned)vdafType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType);
}

- (_DPPrio3SumVectorParameter)initWithBitWidth:(int64_t)a3 numOfAggregators:(int64_t)a4 numOfProofs:(int64_t)a5 vdafType:(unsigned int)a6
{
  objc_class *ObjectType;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs) = (Class)a5;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType) = a6;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[_DPPrio3SumVectorParameter init](&v13, sel_init);
}

- (_DPPrio3SumVectorParameter)init
{
  _DPPrio3SumVectorParameter *result;

  result = (_DPPrio3SumVectorParameter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
