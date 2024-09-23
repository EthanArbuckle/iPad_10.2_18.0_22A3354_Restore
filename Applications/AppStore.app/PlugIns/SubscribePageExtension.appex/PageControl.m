@implementation PageControl

- (void)accessibilityIncrement
{
  uint64_t Strong;
  uint64_t v4;
  _TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_100465568(1u);

    swift_unknownObjectRelease(v4);
  }
}

- (void)accessibilityDecrement
{
  uint64_t Strong;
  uint64_t v4;
  _TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_100465568(0);

    swift_unknownObjectRelease(v4);
  }
}

- (_TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl_delegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PageControl();
  return -[PageControl initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PageControl();
  return -[PageControl initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtensionP33_1716A80D629D077B00382A9108BDDA4211PageControl_delegate);
}

@end
