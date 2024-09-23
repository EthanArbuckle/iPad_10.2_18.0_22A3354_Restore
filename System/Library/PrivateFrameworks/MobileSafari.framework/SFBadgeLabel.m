@implementation SFBadgeLabel

- (_TtC12MobileSafari12SFBadgeLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC12MobileSafari12SFBadgeLabel *result;

  v5 = OBJC_IVAR____TtC12MobileSafari12SFBadgeLabel_label;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC12MobileSafari12SFBadgeLabel *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SFBadgeLabel();
  v2 = v3.receiver;
  -[SFBadgeLabel layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  objc_msgSend(v2, sel__setContinuousCornerRadius_, CGRectGetHeight(v4) * 0.5);

}

- (_TtC12MobileSafari12SFBadgeLabel)initWithFrame:(CGRect)a3
{
  _TtC12MobileSafari12SFBadgeLabel *result;

  result = (_TtC12MobileSafari12SFBadgeLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
