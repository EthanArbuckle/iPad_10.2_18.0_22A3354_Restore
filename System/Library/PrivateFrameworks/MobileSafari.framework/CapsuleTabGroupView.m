@implementation CapsuleTabGroupView

- (_TtC12MobileSafari19CapsuleTabGroupView)init
{
  return -[CapsuleTabGroupView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 100.0, 44.0);
}

- (_TtC12MobileSafari19CapsuleTabGroupView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari19CapsuleTabGroupView *)sub_18BA59484(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari19CapsuleTabGroupView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari19CapsuleTabGroupView *)sub_18BA59658(a3);
}

- (void)updateConstraints
{
  _TtC12MobileSafari19CapsuleTabGroupView *v2;

  v2 = self;
  sub_18BA59EA0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19CapsuleTabGroupView_configuration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19CapsuleTabGroupView_disclosureIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19CapsuleTabGroupView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19CapsuleTabGroupView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19CapsuleTabGroupView_titleLabel));
}

@end
