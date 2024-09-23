@implementation MFActivityViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport24MFActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  objc_class *ObjectType;
  void *v7;
  void *v8;
  _TtC16MagnifierSupport24MFActivityViewController *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_22758E3DC();
  if (a4)
  {
    sub_227381ACC();
    a4 = (id)sub_22758E3DC();
  }
  v7 = (void *)sub_22758E3C4();
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_227381ACC();
    v8 = (void *)sub_22758E3C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[MFActivityViewController initWithActivityItems:applicationActivities:](&v11, sel_initWithActivityItems_applicationActivities_, v7, v8);

  return v9;
}

@end
