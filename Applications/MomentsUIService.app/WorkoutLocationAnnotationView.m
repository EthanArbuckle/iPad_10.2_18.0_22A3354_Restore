@implementation WorkoutLocationAnnotationView

- (_TtC16MomentsUIService29WorkoutLocationAnnotationView)initWithCoder:(id)a3
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutLocationAnnotationView();
  swift_deallocPartialClassInstance(self, v4, 8, 7);
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC16MomentsUIService29WorkoutLocationAnnotationView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  WorkoutLocationAnnotationView.draw(_:)(x, y, width, height);

}

- (_TtC16MomentsUIService29WorkoutLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  _TtC16MomentsUIService29WorkoutLocationAnnotationView *result;

  swift_unknownObjectRetain(a3);
  result = (_TtC16MomentsUIService29WorkoutLocationAnnotationView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.WorkoutLocationAnnotationView", 46, "init(annotation:reuseIdentifier:)", 33, 0);
  __break(1u);
  return result;
}

@end
