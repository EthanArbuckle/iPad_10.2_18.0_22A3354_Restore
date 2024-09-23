@implementation IdentityProofingFedStatsOptinTableViewCell

- (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_213FF9458();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell *)sub_213F7FF10(a3, (uint64_t)a4, v6);
}

- (_TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F810E8();
}

- (void)setupBackgroundColor
{
  _TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell *v2;

  v2 = self;
  sub_213F80404();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_subtitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_bulletList));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_divider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingFedStatsOptinTableViewCell_checkmarkImageView));
}

@end
