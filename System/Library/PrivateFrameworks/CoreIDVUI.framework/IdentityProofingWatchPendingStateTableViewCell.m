@implementation IdentityProofingWatchPendingStateTableViewCell

- (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_213FF9458();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell *)sub_213F9BAB0(v4, v5);
}

- (_TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F9BD1C();
}

- (void)buttonClickedWithSender:(id)a3
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  _TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell *v7;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped);
  if (v3)
  {
    v5 = a3;
    v7 = self;
    v6 = sub_213F4D4E0((uint64_t)v3);
    v3(v6);
    sub_213F4BE68((uint64_t)v3);

  }
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateTableViewCell();
  v2 = (char *)v5.receiver;
  -[IdentityProofingWatchPendingStateTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  sub_213F4BE68(v4);

}

- (void).cxx_destruct
{
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_subTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_button));
}

@end
