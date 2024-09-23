@implementation DropletBackgroundView

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9DropletUI21DropletBackgroundView *v8;

  if (a4)
  {
    if (sub_23A84C21C() == 0xD000000000000020 && v6 == 0x800000023A84EB80 || (sub_23A84C3FC() & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      sub_23A847750();

    }
    swift_bridgeObjectRelease();
  }
}

- (_TtC9DropletUI21DropletBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A8485E4();
}

- (void)layoutSubviews
{
  _TtC9DropletUI21DropletBackgroundView *v2;

  v2 = self;
  sub_23A846E28();

}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType;
  sub_23A82E644(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType), *((_QWORD *)v3 + 1), *((_QWORD *)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((_QWORD *)v3 + 6), *((_QWORD *)v3 + 7), *((_QWORD *)v3 + 8), *((_QWORD *)v3 + 9), v3[80]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___intelligentView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView));
}

@end
