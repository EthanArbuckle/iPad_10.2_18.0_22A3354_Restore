@implementation PlayerView

+ (Class)layerClass
{
  sub_2412CC884(0, &qword_2571239C8);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC11MediaCoreUIP33_5C0FCAEC7E121FD01840555B36210BDC10PlayerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerView();
  return -[GeometryTrackingView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
