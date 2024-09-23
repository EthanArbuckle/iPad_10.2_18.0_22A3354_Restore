@implementation AATimestampJitter

+ (AATimestampJitter)default
{
  if (qword_1ED1CC0D8 != -1)
    swift_once();
  return (AATimestampJitter *)(id)qword_1ED1CC0D0;
}

- (BOOL)enabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AATimestampJitter_enabled);
}

- (double)lowerBound
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_lowerBound);
}

- (double)upperBound
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_upperBound);
}

- (id)withEnabled:(BOOL)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_lowerBound);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_upperBound);
  v8 = objc_allocWithZone(ObjectType);
  v8[OBJC_IVAR___AATimestampJitter_enabled] = a3;
  *(_QWORD *)&v8[OBJC_IVAR___AATimestampJitter_lowerBound] = v6;
  *(_QWORD *)&v8[OBJC_IVAR___AATimestampJitter_upperBound] = v7;
  v10.receiver = v8;
  v10.super_class = ObjectType;
  return -[AATimestampJitter init](&v10, sel_init);
}

- (id)withLowerBound:(double)a3
{
  objc_class *ObjectType;
  char v6;
  uint64_t v7;
  _BYTE *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = *((_BYTE *)&self->super.isa + OBJC_IVAR___AATimestampJitter_enabled);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_upperBound);
  v8 = objc_allocWithZone(ObjectType);
  v8[OBJC_IVAR___AATimestampJitter_enabled] = v6;
  *(double *)&v8[OBJC_IVAR___AATimestampJitter_lowerBound] = a3;
  *(_QWORD *)&v8[OBJC_IVAR___AATimestampJitter_upperBound] = v7;
  v10.receiver = v8;
  v10.super_class = ObjectType;
  return -[AATimestampJitter init](&v10, sel_init);
}

- (id)withUpperBound:(double)a3
{
  objc_class *ObjectType;
  char v6;
  uint64_t v7;
  _BYTE *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = *((_BYTE *)&self->super.isa + OBJC_IVAR___AATimestampJitter_enabled);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_lowerBound);
  v8 = objc_allocWithZone(ObjectType);
  v8[OBJC_IVAR___AATimestampJitter_enabled] = v6;
  *(_QWORD *)&v8[OBJC_IVAR___AATimestampJitter_lowerBound] = v7;
  *(double *)&v8[OBJC_IVAR___AATimestampJitter_upperBound] = a3;
  v10.receiver = v8;
  v10.super_class = ObjectType;
  return -[AATimestampJitter init](&v10, sel_init);
}

- (AATimestampJitter)init
{
  AATimestampJitter *result;

  result = (AATimestampJitter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
