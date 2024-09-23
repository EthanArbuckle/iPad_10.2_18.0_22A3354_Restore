@implementation _DPPINEParameter

- (int64_t)fractionalBitCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
}

- (float)l2NormBound
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_l2NormBound);
}

- (int64_t)numOfProofs
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_numOfProofs);
}

- (unsigned)pineType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_pineType);
}

- (_DPPINEParameter)initWithFractionalBitCount:(int64_t)a3 l2NormBound:(float)a4 numOfProofs:(int64_t)a5 pineType:(unsigned int)a6
{
  objc_class *ObjectType;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_fractionalBitCount) = (Class)a3;
  *(float *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_l2NormBound) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_numOfProofs) = (Class)a5;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_pineType) = a6;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[_DPPINEParameter init](&v13, sel_init);
}

- (_DPPINEParameter)init
{
  _DPPINEParameter *result;

  result = (_DPPINEParameter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
