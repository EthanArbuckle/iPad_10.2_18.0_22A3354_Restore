@implementation PageControl

- (void)accessibilityIncrement
{
  _TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl *v3;

  if (swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl_delegate))
  {
    v3 = self;
    sub_1002DBD44(1u);

    swift_unknownObjectRelease();
  }
}

- (void)accessibilityDecrement
{
  _TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl *v3;

  if (swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl_delegate))
  {
    v3 = self;
    sub_1002DBD44(0);

    swift_unknownObjectRelease();
  }
}

- (_TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl)initWithFrame:(CGRect)a3
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
  v8 = (char *)self + OBJC_IVAR____TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl_delegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PageControl();
  return -[PageControl initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PageControl();
  return -[PageControl initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtensionP33_F7854DF1AF16A1A2A8136C94AC46A1AB11PageControl_delegate);
}

@end
