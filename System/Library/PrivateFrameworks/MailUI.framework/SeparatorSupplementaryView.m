@implementation SeparatorSupplementaryView

- (_TtC6MailUI26SeparatorSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI26SeparatorSupplementaryView *)SeparatorSupplementaryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI26SeparatorSupplementaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D564B5A0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6MailUI26SeparatorSupplementaryView *v5;
  UITraitCollection_optional v8;

  v4 = a3;
  v5 = self;
  v8.value.super.isa = (Class)a3;
  SeparatorSupplementaryView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  sub_1D5565D18((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator));
}

@end
