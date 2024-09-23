@implementation MFPageViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport20MFPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  objc_class *ObjectType;
  _TtC16MagnifierSupport20MFPageViewController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    type metadata accessor for OptionsKey(0);
    sub_2273096F0(&qword_2558D53E0, (uint64_t (*)(uint64_t))type metadata accessor for OptionsKey, (uint64_t)&unk_227596300);
    sub_22758E118();
    a5 = (id)sub_22758E10C();
    swift_bridgeObjectRelease();
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[MFPageViewController initWithTransitionStyle:navigationOrientation:options:](&v12, sel_initWithTransitionStyle_navigationOrientation_options_, a3, a4, a5);

  return v10;
}

- (_TtC16MagnifierSupport20MFPageViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[MFPageViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
