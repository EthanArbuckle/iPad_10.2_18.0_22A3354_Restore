@implementation CycleChart

- (_TtC24MenstrualCyclesAppPlugin10CycleChart)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t ObjectType;
  _TtC24MenstrualCyclesAppPlugin10CycleChart *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = swift_getObjectType();
  v8 = (_TtC24MenstrualCyclesAppPlugin10CycleChart *)(*(uint64_t (**)(_QWORD, double, double, double, double))(ObjectType + 112))(MEMORY[0x24BEE4AF8], x, y, width, height);
  swift_deallocPartialClassInstance();
  return v8;
}

- (_TtC24MenstrualCyclesAppPlugin10CycleChart)initWithCoder:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin10CycleChart *result;

  result = (_TtC24MenstrualCyclesAppPlugin10CycleChart *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
