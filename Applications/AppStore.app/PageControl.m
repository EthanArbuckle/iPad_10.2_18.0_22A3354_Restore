@implementation PageControl

- (void)accessibilityIncrement
{
  uint64_t Strong;
  uint64_t v4;
  _TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_1004E147C(1u);

    swift_unknownObjectRelease(v4);
  }
}

- (void)accessibilityDecrement
{
  uint64_t Strong;
  uint64_t v4;
  _TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_1004E147C(0);

    swift_unknownObjectRelease(v4);
  }
}

- (_TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl)initWithFrame:(CGRect)a3
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
  v8 = (char *)self + OBJC_IVAR____TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl_delegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PageControl();
  return -[PageControl initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PageControl();
  return -[PageControl initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStoreP33_34C2CD3B1DD055F5A56FA333DB4C2D6511PageControl_delegate);
}

@end
