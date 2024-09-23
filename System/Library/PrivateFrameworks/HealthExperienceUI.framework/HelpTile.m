@implementation HelpTile

- (_TtC18HealthExperienceUI8HelpTile)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI8HelpTile *)sub_1A97C8E0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI8HelpTile)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A97CB1DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI8HelpTile *v6;

  v5 = a3;
  v6 = self;
  sub_1A97C90A4(a3);

}

- (void)actionTapped
{
  uint64_t *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  _TtC18HealthExperienceUI8HelpTile *v6;
  uint64_t v7;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_actionHandler);
  swift_beginAccess();
  v4 = *v3;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t))(v4 + 16);
  v6 = self;
  v7 = swift_retain();
  v5(v7);

  swift_release();
}

- (void)dismissTapped
{
  uint64_t *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  _TtC18HealthExperienceUI8HelpTile *v6;
  uint64_t v7;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_actionHandler);
  swift_beginAccess();
  v4 = *v3;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t))(v4 + 32);
  v6 = self;
  v7 = swift_retain();
  v5(v7);

  swift_release();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1A97C8C8C(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_viewModel), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_viewModel), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_viewModel));
}

@end
