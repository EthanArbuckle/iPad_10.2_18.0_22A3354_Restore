@implementation CLKUIBezierPathStepper

- (UIBezierPath)path
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  return (UIBezierPath *)*v2;
}

- (void)setPath:(id)a3
{
  id *v5;
  id v6;
  CLKUIBezierPathStepper *v7;
  CLKUIBezierPathStepper *v8;
  CLKUIBezierPathStepper *v9;

  v5 = (id *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = (CLKUIBezierPathStepper *)a3;
  v8 = self;

  if (*v5)
  {
    v9 = (CLKUIBezierPathStepper *)*v5;
    CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v9);

    v8 = v7;
    v7 = v9;
  }

}

- (CLKUIBezierPathStepper)init
{
  objc_class *ObjectType;
  void **v4;
  objc_class *v5;
  void *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_path) = 0;
  v5 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_segments) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLKUIBezierPathStepper_segmentLengthTables) = v5;
  swift_beginAccess();
  v6 = *v4;
  *v4 = 0;

  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[CLKUIBezierPathStepper init](&v8, sel_init);
}

- (void)updateSegmentsWithPath:(id)a3
{
  id v4;
  CLKUIBezierPathStepper *v5;

  v4 = a3;
  v5 = self;
  CLKUIBezierPathStepper.updateSegments(path:)((UIBezierPath)v4);

}

- (id)mapOffsetsToPathPositions:(id)a3
{
  CLKUIBezierPathStepper *v4;
  void *v5;

  sub_1CB9D6B3C();
  v4 = self;
  CLKUIBezierPathStepper.mapOffsetsToPathPositions(_:)();

  swift_bridgeObjectRelease();
  type metadata accessor for SlopedPoint();
  v5 = (void *)sub_1CB9D6B30();
  swift_bridgeObjectRelease();
  return v5;
}

- (double)totalLength
{
  double result;

  CLKUIBezierPathStepper.totalLength()();
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
