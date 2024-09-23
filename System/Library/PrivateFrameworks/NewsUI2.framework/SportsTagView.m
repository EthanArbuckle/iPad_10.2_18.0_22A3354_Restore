@implementation SportsTagView

- (_TtC7NewsUI213SportsTagView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI213SportsTagView *)sub_1D64493E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI213SportsTagView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D644A1D8();
}

- (void).cxx_destruct
{

}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D6449294);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D6449800);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1D60B39EC(self, (uint64_t)a2, (void (*)(void))sub_1D64499C8);
}

- (NSArray)accessibilityCustomActions
{
  _TtC7NewsUI213SportsTagView *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1D6449C0C();

  if (v3)
  {
    sub_1D644A13C();
    v4 = (void *)sub_1D6E26D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  objc_class *ObjectType;
  _TtC7NewsUI213SportsTagView *v6;
  _TtC7NewsUI213SportsTagView *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1D644A13C();
    sub_1D6E26D80();
    v6 = self;
    a3 = (id)sub_1D6E26D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[SportsTagView setAccessibilityCustomActions:](&v8, sel_setAccessibilityCustomActions_, a3);

}

@end
