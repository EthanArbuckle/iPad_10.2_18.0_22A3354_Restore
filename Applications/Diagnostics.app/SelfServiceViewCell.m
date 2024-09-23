@implementation SelfServiceViewCell

- (CGSize)intrinsicContentSize
{
  _TtC11Diagnostics19SelfServiceViewCell *v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_100084F9C();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC11Diagnostics19SelfServiceViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DARootViewController *v5;
  DARootViewController *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC11Diagnostics19SelfServiceViewCell *)sub_1000850B8(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics19SelfServiceViewCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics19SelfServiceViewCell *)sub_100085408(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_descriptionStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_titleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->iconSpacing[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_titleText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->iconSpacing[OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_subtitleText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19SelfServiceViewCell_learnMoreLabel));
}

@end
