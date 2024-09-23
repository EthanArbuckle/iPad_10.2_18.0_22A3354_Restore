@implementation LensFilteringViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport27LensFilteringViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22758E1E4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MagnifierSupport27LensFilteringViewController *)sub_22742424C(v5, v7, a4);
}

- (_TtC16MagnifierSupport27LensFilteringViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport27LensFilteringViewController_brightness) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport27LensFilteringViewController_contrast) = (Class)0x3FF0000000000000;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport27LensFilteringViewController_colorFilter) = 12;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LensFilteringViewController();
  return -[LensFilteringViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
