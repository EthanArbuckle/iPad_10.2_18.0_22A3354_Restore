@implementation NavigationBarManualCheckLayoutMarginsChange

- (_TtC8AppStore43NavigationBarManualCheckLayoutMarginsChange)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore43NavigationBarManualCheckLayoutMarginsChange__cachedLayoutMargins;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[NavigationBarManualCheckLayoutMarginsChange initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (void)layoutMarginsDidChange
{
  uint64_t v2;
  _TtC8AppStore43NavigationBarManualCheckLayoutMarginsChange *v3;

  v3 = self;
  sub_100028A04((uint64_t)v3, v2);

}

- (_TtC8AppStore43NavigationBarManualCheckLayoutMarginsChange)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = (char *)self + OBJC_IVAR____TtC8AppStore43NavigationBarManualCheckLayoutMarginsChange__cachedLayoutMargins;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[NavigationBarManualCheckLayoutMarginsChange initWithCoder:](&v8, "initWithCoder:", a3);
}

@end
