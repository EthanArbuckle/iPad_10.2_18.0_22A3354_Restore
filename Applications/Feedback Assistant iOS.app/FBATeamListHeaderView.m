@implementation FBATeamListHeaderView

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  NSString v3;

  if (qword_100115E30 != -1)
    swift_once(&qword_100115E30, sub_100085A94);
  v2 = *(_QWORD *)algn_100119F68;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100119F68);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (UILabel)teamNameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel));
}

- (void)setTeamNameLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)teamTypeLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel));
}

- (void)setTeamTypeLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC18Feedback_Assistant21FBATeamListHeaderView)initWithFrame:(CGRect)a3
{
  _TtC18Feedback_Assistant21FBATeamListHeaderView *result;

  sub_100085BD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant21FBATeamListHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_100086790();

}

- (_TtC18Feedback_Assistant21FBATeamListHeaderView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_stackView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBATeamListHeaderView();
  return -[FBATeamListHeaderView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void)configureForTeam:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant21FBATeamListHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_10008643C(v4);

}

- (void)hide
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_stackView);
  if (v2)
    objc_msgSend(v2, "setHidden:", 1);
  else
    __break(1u);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_teamTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBATeamListHeaderView_stackView));
}

@end
